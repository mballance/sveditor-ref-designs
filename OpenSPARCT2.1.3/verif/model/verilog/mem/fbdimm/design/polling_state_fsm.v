// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: polling_state_fsm.v
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
module polling_state_fsm(ps_bit,link_clk,amb_id,polling_state_start,polling_state_end,amb_id_ok);


parameter DS=0;

input ps_bit;
input link_clk;
output [3:0] amb_id;
input polling_state_start;
output polling_state_end;
output amb_id_ok;

reg [2:0] SB2NB_Map;
reg [11:0] tr_reg;
reg [4:0] tr_state;
reg [4:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts2_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg polling_state_start_reg,polling_state_end_reg;
assign amb_id=amb_id_reg;
reg [35:0] end_del_reg;
reg        first_frame_enddelimeter_ok;

assign amb_id_ok = ( amb_id_reg == DS ) ? 1'b1 : 1'b0;

initial begin
tr_state=0;
tr_count=5'h0;
amb_id_reg=0;
test_param_count=0;
first_frame_enddelimeter_ok=0;
end

assign polling_state_end=polling_state_end_reg;

always@(negedge link_clk)  if ( polling_state_start )
begin
  case(tr_state)
   `IDLE: begin

              end_del_reg[35:0] <= 36'h0;
              ts2_ready_reg=0;
              tr_reg[11:0] <= {ps_bit, tr_reg[11:1] };

              if (( {ps_bit, tr_reg[11:1]} == 12'b001111111110 ) &
                   first_frame_enddelimeter_ok ) 
                       polling_state_end_reg<=1;
              else
                       polling_state_end_reg<=0;


              if ( {ps_bit, tr_reg[11:1]} == 12'b011111111110 ) begin
                 tr_state<=`TS_TEST_1;
`ifdef FBD_DBG
                 `PR_ALWAYS ("amb_init",`DBG_0,"AMB Detected POLLING");
`endif
               end

             end
   `TS_TEST_1: begin
                case(tr_count)
                 4'b0000: begin tr_reg[0] <= ps_bit;  tr_count=tr_count+5'h1; end
                 4'b0001: begin tr_reg[1] <= ps_bit; tr_count=tr_count+5'h1;  end
                 4'b0010: begin tr_reg[2] <= ps_bit;  tr_count=tr_count+5'h1;end
                 4'b0011: begin tr_reg[3] <= ps_bit; tr_count=tr_count+5'h1; end
                 4'b0100: begin tr_reg[4] <= ps_bit; tr_count=tr_count+5'h1; end
                 4'b0101: begin tr_reg[5] <= ps_bit; tr_count=tr_count+5'h1; end
                 4'b0110: begin tr_reg[6] <= ps_bit;  tr_count=tr_count+5'h1; end
                 4'b0111: begin tr_reg[7] <= ps_bit; tr_count=tr_count+5'h1; end
                 4'b1000: begin tr_reg[8] <= ps_bit; tr_count=tr_count+5'h1;  end
                 4'b1001: begin tr_reg[9] <= ps_bit;  tr_count=tr_count+5'h1; end
                 4'b1010: begin tr_reg[10] <= ps_bit; tr_count=tr_count+5'h1; end
                 4'b1011: begin tr_reg[11] <= ps_bit; tr_state<=`TS_TEST_2; 
                                 tr_count=1;clk_grp=0; amb_id_reg[3:0]=tr_reg[3:0];SB2NB_Map=tr_reg[6:4]; 
`ifdef FBD_DBG
                                `PR_ALWAYS ("amb_init",`DBG_4,"POLLING Control values: ambid=%h sb2nbmap   %h",tr_reg[3:0],tr_reg[6:4]);
`endif
                          end
                endcase
             end

   `TS_TEST_2: begin
                 end_del_reg[35:0] <= { ps_bit, end_del_reg[35:1]};
                 if ( {ps_bit, end_del_reg[35:1]} == {12'b101010101010,12'b101010101010,12'b101010101010} ) 
                  begin
`ifdef FBD_DBG
                       `PR_ALWAYS ("amb_init",`DBG_0,"AMB_INIT polling sequence end detected");

`endif
                  first_frame_enddelimeter_ok<=1'b1;

                       tr_state<=`IDLE;
                  end


               end

  endcase


end


endmodule


module polling_state_fsm_chk(ps_bit,link_clk,polling_state_start);


parameter DS=0;

input ps_bit;
input link_clk;
input polling_state_start;

reg [2:0] SB2NB_Map;
reg [71:0] tr_reg;
reg [4:0] tr_state;
reg [9:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts2_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg polling_state_start_reg,polling_state_end_reg;
reg [35:0] end_del_reg;



initial begin
tr_state=0;
tr_count=10'h0;
amb_id_reg=0;
test_param_count=0;
end


always@(posedge link_clk)  if ( polling_state_start )
begin
  case(tr_state)
   `IDLE: begin
              ts2_ready_reg=0;
              tr_reg[71:0] <= {ps_bit,tr_reg[71:1]};

              if (tr_reg[71:60] == 12'b011111111110 ) begin
                 tr_state <= `TS_TEST_1;
               end

             end
   `TS_TEST_1: begin
              tr_reg[71:0] = {ps_bit,tr_reg[71:1]};
               tr_count=tr_count+10'h1;
 
               if ( (tr_count == 10'h3b) && (tr_reg[71:0] != 0 ) ) begin  
`ifdef AXIS_FBDIMM_HW
`else

                           `PR_ALWAYS ("ch_mon",`DBG_0,"pol_reg: %h ",tr_reg);

/* This is checked indirectly
                        if ( tr_reg[11:0] != 12'h7fe )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: 7fe pattern not found for polling state ");
     
*/
                        if ( {tr_reg[23:18]} != {6'b00000} )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: grp1 pattern in polling is wrong! ");

                        if ( {tr_reg[34:29]} != {4'b0000} )
                             `PR_ALWAYS ("ch_mon",`DBG_0,"ERROR: NBwidthcapability pattern in polling is wrong! ");
`endif

                tr_count=10'h0;
                tr_state=`IDLE;
               end


             end

  endcase


end


endmodule

`endif // AXIS_FBDIMM_NO_FSR
