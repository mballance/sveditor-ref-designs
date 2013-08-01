// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: config_state_fsm.v
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
module config_state_fsm(ps_bit,link_clk,amb_id,config_state_start,config_state_end,amb_id_ok);

parameter DS=0;

input ps_bit;
input link_clk;
output [3:0] amb_id;
input config_state_start;
output config_state_end;
output amb_id_ok;

reg [2:0] SB2NB_Map;
reg [11:0] tr_reg;
reg [4:0] tr_state;
reg [4:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts1_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg [35:0] end_del_reg;
reg config_state_start_reg,config_state_end_reg;

assign amb_id=amb_id_reg;
assign amb_id_ok = ( amb_id_reg == DS) ? 1'b1: 1'b0;

initial begin
tr_state=0;
tr_count=0;
amb_id_reg=0;

test_param_count=0;
end

assign config_state_end=config_state_end_reg;

always@(posedge link_clk) if ( config_state_start )
begin
  case(tr_state)
   `IDLE: begin
              tr_reg[11:0] <= {ps_bit, tr_reg[11:1] };

              if (  {ps_bit, tr_reg[11:1] } == 12'b001111111110 ) begin
                 tr_state<=`TS_TEST_1;
`ifdef FBD_DBG
                 `PR_ALWAYS("amb_init",`DBG_0,"%d: AMB Detected CONFIG",$time);
`endif
               end

             end
   `TS_TEST_1: begin
                case(tr_count)
                 4'b0000: begin tr_reg[0] <= ps_bit;  tr_count=tr_count+1; end
                 4'b0001: begin tr_reg[1] <= ps_bit; tr_count=tr_count+1;  end
                 4'b0010: begin tr_reg[2] <= ps_bit;  tr_count=tr_count+1;end
                 4'b0011: begin tr_reg[3] <= ps_bit; tr_count=tr_count+1; end
                 4'b0100: begin tr_reg[4] <= ps_bit; tr_count=tr_count+1; end
                 4'b0101: begin tr_reg[5] <= ps_bit; tr_count=tr_count+1; end
                 4'b0110: begin tr_reg[6] <= ps_bit;  tr_count=tr_count+1; end
                 4'b0111: begin tr_reg[7] <= ps_bit; tr_count=tr_count+1; end
                 4'b1000: begin tr_reg[8] <= ps_bit; tr_count=tr_count+1;  end
                 4'b1001: begin tr_reg[9] <= ps_bit;  tr_count=tr_count+1; end
                 4'b1010: begin tr_reg[10] <= ps_bit; tr_count=tr_count+1; end
                 4'b1011: begin tr_reg[11] <= ps_bit; tr_state <=`TS_TEST_2; 
                                 tr_count=1;clk_grp=0; amb_id_reg[3:0]=tr_reg[3:0];SB2NB_Map=tr_reg[6:4]; 
`ifdef FBD_DBG
                                `PR_ALWAYS("amb_init",`DBG_4,"TS_TEST Control values: ambid=%h sb2nbmap   %h",tr_reg[3:0],tr_reg[6:4]);
`endif
                          end
                endcase
             end

   `TS_TEST_2: begin
                end_del_reg[35:0] <= { end_del_reg[34:0],ps_bit};

                 if ( { end_del_reg[34:0],ps_bit} == {12'b101010101010,12'b101010101010,12'b101010101010} )
                  begin
`ifdef FBD_DBG
                       `PR_ALWAYS("amb_init",`DBG_0,"AMB_INIT config end detected");
`endif
                       config_state_end_reg<=1;
                       tr_state<=`IDLE;

                  end
                   else
                       config_state_end_reg<=0;
                      
               end

  endcase


end


endmodule


module config_state_fsm_chk(ps_bit,link_clk,config_state_start);

parameter DS=0;

input ps_bit;
input link_clk;
input config_state_start;

reg [2:0] SB2NB_Map;
reg [71:0] tr_reg;
reg [4:0] tr_state;
reg [9:0] tr_count;
reg [11:0] clk_trn_ptrn;
reg [3:0] clk_grp;
reg ts1_ready_reg;
reg [3:0] amb_id_reg;
reg [23:0] test_param_reg;
reg [7:8] test_param_count;
reg [35:0] end_del_reg;
reg config_state_start_reg,config_state_end_reg;

initial begin
tr_state=0;
tr_count=0;
amb_id_reg=0;

test_param_count=0;
end


always@(posedge link_clk) if ( config_state_start )
begin

  case(tr_state)
   `IDLE: begin
             // ts1_ready_reg=0;
              tr_reg[71:0] = { ps_bit,tr_reg[71:1]};

              if (tr_reg[71:60] == 12'b001111111110 ) begin
                 tr_state<=`TS_TEST_1;
               end

             end
   `TS_TEST_1: begin
              tr_reg[71:0] = {ps_bit,tr_reg[71:1]};
               tr_count=tr_count+1;
 
               if ( (tr_count == 8'h3c) && (tr_reg[71:0] != 0 ) ) begin  
`ifdef AXIS_FBDIMM_HW
`else
                           `PR_ALWAYS("ch_mon",`DBG_0,"cfg_reg: %h ",tr_reg);

                        if ( tr_reg[11:0] != 12'h3fe )
                             `PR_ALWAYS("ch_mon",`DBG_0,"ERROR: 3fe pattern not found for config state ");
     
                        if ( {tr_reg[23:21]} != {2'b00} )
                             `PR_ALWAYS("ch_mon",`DBG_0,"ERROR: grp1 pattern in testing is wrong! ");

                        if ( (tr_reg[20:17] == 4'b0010 ) || 
                             (tr_reg[20:17] == 4'b0110 ) ||
                             (tr_reg[20] ))  
                             `PR_ALWAYS("ch_mon",`DBG_0,"ERROR: Protocol selection field value(%b) in testing is reserved! ",tr_reg[20:17]);
                         
                        if ( (tr_reg[27:24] == 4'b1110 ) || 
                             (tr_reg[27:24] == 4'b1101 ) ||
                             (tr_reg[27:24] == 4'b1100 ) ||
                             (tr_reg[27:24] == 4'b1010 ) )
                             `PR_ALWAYS("ch_mon",`DBG_0,"ERROR: SB_Config field has a reserved value of %h in it!",tr_reg[27:24]);

`endif
                tr_count=0;
                tr_state<=`IDLE;
               end
            end

  endcase

end
endmodule

`endif // AXIS_FBDIMM_HW
