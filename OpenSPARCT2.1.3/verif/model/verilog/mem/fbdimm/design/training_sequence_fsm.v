// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: training_sequence_fsm.v
// Copyright (C) 1995-2007 Sun Microsystems, Inc. All Rights Reserved
// 4150 Network Circle, Santa Clara, California 95054, U.S.A.
//
// * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER. 
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
// 
// For the avoidance of doubt, and except that if any non-GPL license 
// choice is available it will apply instead, Sun elects to use only 
// the General Public License version 2 (GPLv2) at this time for any 
// software where a choice of GPL license versions is made 
// available with the language indicating that GPLv2 or any later version 
// may be used, or where a choice of which version of the GPL is applied is 
// otherwise unspecified. 
//
// Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara, 
// CA 95054 USA or visit www.sun.com if you need additional information or 
// have any questions. 
// 
// ========== Copyright Header End ============================================
`ifdef AXIS_FBDIMM_NO_FSR
`else
module training_sequence_fsm(ps_bit,
                             ps_bit_bar,
                             link_clk,amb_id,
                             training_sequence_start,
                             training_sequence_end,
                             amb_id_ok,
                             frm_align);


parameter DS=0;

input ps_bit,ps_bit_bar;
input link_clk;
output [3:0] amb_id;
output training_sequence_end;
input training_sequence_start;
output amb_id_ok;
output frm_align;

reg [2:0] SB2NB_Map;

reg [11:0] tr_reg;
reg [4:0] tr_state;
reg [4:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts0_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg frm_align_reg;

assign frm_align = frm_align_reg;

assign amb_id=amb_id_reg;
//assign amb_id_ok = (amb_id_reg == DS) ? 1'b1 : 1'b0;

wire training_sequence_start_d12;
assign training_sequence_end=ts0_ready_reg;
initial begin
tr_state=0;
tr_count=0;
test_param_count=0;
end

wire [9:0] delay_reg = 10'd12;


shifter_p #(1) train_delay (.signal_in ( training_sequence_start ),
                            .signal_out ( training_sequence_start_d12),
                            .delay_cycles (delay_reg),
                            .clk (link_clk));


initial 
  amb_id_reg=0;

always@(negedge link_clk) if ( training_sequence_start ) // _d12 && ( ps_bit !== ps_bit_bar) )
begin
  case(tr_state)
   `IDLE: begin
              tr_reg[11:0] = {ps_bit, tr_reg[11:1] };

              if ( training_sequence_start_d12 && ( ps_bit !== ps_bit_bar) ) 
              begin 
               // if beginning of ts1 is detected
                if ( {ps_bit, tr_reg[11:1] } == 12'b111111111110 )
                 ts0_ready_reg<=1;
                else
                 ts0_ready_reg<=0;

                if ( {ps_bit, tr_reg[11:1] } == 12'b101111111110 ) begin
                 tr_state<=`TS_TRAIN_1;

`ifdef FBD_DBG
 //                `PR_ALWAYS ("amb_init",`DBG_0,"Detected TRAINING");
`endif
                 frm_align_reg<=1;
               end
               else
                 frm_align_reg<=0;
               end // if training_sequence_start_d12

             end
   `TS_TRAIN_1: begin
                case(tr_count)
                 4'b0000: begin tr_reg[0] = ps_bit;  tr_count=tr_count+1; end
                 4'b0001: begin tr_reg[1] = ps_bit; tr_count=tr_count+1;  end
                 4'b0010: begin tr_reg[2] = ps_bit;  tr_count=tr_count+1;end
                 4'b0011: begin tr_reg[3] = ps_bit; tr_count=tr_count+1; end
                 4'b0100: begin tr_reg[4] = ps_bit; tr_count=tr_count+1; end
                 4'b0101: begin tr_reg[5] = ps_bit; tr_count=tr_count+1; end
                 4'b0110: begin tr_reg[6] = ps_bit;  tr_count=tr_count+1; end
                 4'b0111: begin tr_reg[7] = ps_bit; tr_count=tr_count+1; end
                 4'b1000: begin tr_reg[8] = ps_bit; tr_count=tr_count+1;  end
                 4'b1001: begin tr_reg[9] = ps_bit;  tr_count=tr_count+1; end
                 4'b1010: begin tr_reg[10] = ps_bit; tr_count=tr_count+1; end
                 4'b1011: begin tr_reg[11] = ps_bit; tr_state<=`TS_TRAIN_2; 
                                 tr_count=1;clk_grp=0; amb_id_reg[3:0]={tr_reg[11],tr_reg[9],tr_reg[7],tr_reg[5]}; 

`ifdef FBD_DBG
   //                             `PR_ALWAYS ("amb_init",`DBG_4,"Control values: pattern = %h   ambid=%h",{tr_reg[10],tr_reg[8],tr_reg[6],tr_reg[4:0]},{tr_reg[11],tr_reg[9],tr_reg[7],tr_reg[5]});
`endif
                          end
                endcase
               // tr_count=tr_count+1;
             end
   `TS_TRAIN_2: begin  // group 11-2: pg 27 of Jedec Spec

               case(tr_count)
                 4'b0001: begin clk_trn_ptrn[0] = ps_bit; tr_count=tr_count+1; end
                 4'b0010: begin clk_trn_ptrn[1] = ps_bit; tr_count=tr_count+1; end
                 4'b0011: begin clk_trn_ptrn[2] = ps_bit; tr_count=tr_count+1; end
                 4'b0100: begin clk_trn_ptrn[3] = ps_bit; tr_count=tr_count+1;  end
                 4'b0101: begin clk_trn_ptrn[4] = ps_bit; tr_count=tr_count+1; end
                 4'b0110: begin clk_trn_ptrn[5] = ps_bit; tr_count=tr_count+1; end
                 4'b0111: begin clk_trn_ptrn[6] = ps_bit; tr_count=tr_count+1; end
                 4'b1000: begin clk_trn_ptrn[7] = ps_bit; tr_count=tr_count+1; end
                 4'b1001: begin clk_trn_ptrn[8] = ps_bit; tr_count=tr_count+1; end
                 4'b1010: begin clk_trn_ptrn[9] = ps_bit; tr_count=tr_count+1; end
                 4'b1011: begin clk_trn_ptrn[10] = ps_bit; tr_count=tr_count+1; end
                 4'b1100: begin clk_trn_ptrn[11] = ps_bit; clk_grp=clk_grp+1; tr_count=1;
`ifdef FBD_DBG
//                           `PR_ALWAYS ("amb_init",`DBG_4,"Getting clock training sequence_%h->  %b",clk_grp,clk_trn_ptrn);
`endif
                          end
                endcase
                if ( clk_grp == 4'ha )
                 begin
                 tr_state<=`IDLE;
                end
             end
  endcase


end
else
 ts0_ready_reg<=0;

endmodule




module training_sequence_fsm_chk(ps_bit,ps_bit_bar,link_clk,training_sequence_start);


parameter DS=0;

input ps_bit,ps_bit_bar;
input link_clk;
input training_sequence_start;


reg [2:0] SB2NB_Map;

reg [143:0] tr_reg;
reg [4:0] tr_state;
reg [8:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts0_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg frm_align_reg;
reg [9:0] ts0_frm_cnt;


initial begin
tr_state=0;
tr_count=0;
ts0_frm_cnt=0;
test_param_count=0;
end


initial 
  tr_count=0;

always@(posedge link_clk) if ( training_sequence_start && (ps_bit !== ps_bit_bar) )
begin
  case(tr_state)
   `IDLE: begin
              //ts0_ready_reg=0;
              tr_reg[142:0] = tr_reg[143:1];
               tr_reg[143] = ps_bit;

              if (tr_reg[143:132] == 12'b101111111110 ) 
                 tr_state=`TS_TRAIN_1;

              // if beginning of ts1 is detected
              if (tr_reg[11:0] == 12'b111111111110 ) 
              begin
`ifdef AXIS_FBDIMM_HW
`else
                if ( ts0_frm_cnt < 200 )
                  `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: Approximate # of TS0 Patterns(268) not met => Only %d frames ",ts0_frm_cnt);
`endif

              end

          end
    `TS_TRAIN_1: begin
              tr_reg[142:0] = tr_reg[143:1];
               tr_reg[143] = ps_bit;
               tr_count=tr_count+1;
 
               if ( (tr_count == 8'h84) && (tr_reg[143:0] != 0 ) ) begin  
               ts0_frm_cnt= ts0_frm_cnt +1;
`ifdef AXIS_FBDIMM_HW
`else
                        if ( tr_reg[11:0] != 12'hbfe )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: bfe pattern not found for training state ");
     
                        if ( {tr_reg[22],tr_reg[20],tr_reg[18],tr_reg[16:12]} != {1'b0,1'b0,1'b0,5'b01010} )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: grp1 pattern in training is wrong! ");
                         
                        if ( tr_reg[143:24] != 120'haaaaaaaaaaaaaaaaaaaaaaaaaaaaaa )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: clock training patterns has errors in training state ");
`endif

                tr_count=0;
                tr_state=`IDLE;
               end
              end

          endcase
end


endmodule


`endif // AXIS_FBDIMM_HW
