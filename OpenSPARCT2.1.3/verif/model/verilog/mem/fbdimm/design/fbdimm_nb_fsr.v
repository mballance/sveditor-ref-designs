// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fbdimm_nb_fsr.v
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
module fbdimm_nb_fsr(reset,
                     pn0_in,
                     pn1_in,
                     pn2_in,
                     pn3_in,
                     pn4_in,
                     pn5_in,
                     pn6_in,
                     pn7_in,
                     pn8_in,
                     pn9_in,
                     pn10_in,
                     pn11_in,
                     pn_out,
                     serdes_data_rdy,
                     link_clk,
                     ref_clk);
parameter DS = 0;
input reset;
input [13:0] pn0_in,pn1_in,pn2_in,pn3_in,pn4_in,pn5_in,pn6_in,pn7_in,pn8_in,pn9_in,pn10_in,pn11_in;
output [13:0] pn_out;
input link_clk;
input ref_clk;
input serdes_data_rdy;

reg [3:0] curr_state;
reg [13:0] pn_out_reg;
wire [13:0] pn_out_reg_d,pn_out_reg_idle;
reg [3:0] fsr_counter;
wire [13:0] pn_out_reg_shft;
wire serdes_data_rdy_d;
reg serdes_data_rdy_d1;
reg [11:0] pn_shift_reg3,pn_shift_reg2,pn_shift_reg1,pn_shift_reg0;

assign pn_out =  pn_out_reg ;

reg [11:0] pn_in_reg;
reg [3:0] LastAMB_ID; 


initial begin
curr_state = 0;
 
if ($test$plusargs("1_FBDIMM"))
   LastAMB_ID=0;
else if ($test$plusargs("2_FBDIMMS"))
   LastAMB_ID=1;
else if ($test$plusargs("3_FBDIMMS"))
   LastAMB_ID=2;
else if ($test$plusargs("4_FBDIMMS"))
   LastAMB_ID=3;
else if ($test$plusargs("5_FBDIMMS"))
   LastAMB_ID=4;
else if ($test$plusargs("6_FBDIMMS"))
   LastAMB_ID=5;
else if ($test$plusargs("7_FBDIMMS"))
   LastAMB_ID=6;
else if ($test$plusargs("8_FBDIMMS"))
   LastAMB_ID=7;
else
   LastAMB_ID=0;


end


always@(posedge link_clk)
begin
   case ( curr_state)
    4'h0 : begin pn_out_reg <= pn11_in; end
    4'h1 : begin pn_out_reg <= pn0_in; end
    4'h2 : begin pn_out_reg <= pn1_in; end
    4'h3 : begin pn_out_reg <= pn2_in; end
    4'h4 : begin pn_out_reg <= pn3_in; end
    4'h5 : begin pn_out_reg <= pn4_in; end
    4'h6 : begin pn_out_reg <= pn5_in; end
    4'h7 : begin pn_out_reg <= pn6_in; end
    4'h8 : begin pn_out_reg <= pn7_in; end
    4'h9 : begin pn_out_reg <= pn8_in; end
    4'ha: begin pn_out_reg <= pn9_in; end
    4'hb: begin pn_out_reg <= pn10_in; end
   endcase

end


always@(negedge link_clk )
begin
   case ( curr_state )
     4'h0: begin
              if ( ref_clk )
                curr_state <= 4'h1;
           end
     4'h1: begin
                curr_state <= 4'h2;
           end
     4'h2: begin
                curr_state <= 4'h3;
           end
     4'h3: begin
                curr_state <= 4'h4;
           end
     4'h4: begin
                curr_state <= 4'h5;
           end
     4'h5: begin
                curr_state <= 4'h6;
           end
     4'h6: begin
                curr_state <= 4'h7;
           end
     4'h7: begin
                curr_state <= 4'h8;
           end
     4'h8: begin
                curr_state <= 4'h9;
           end
     4'h9: begin
                curr_state <= 4'ha;
           end
     4'ha: begin
                curr_state <= 4'hb;
           end
     4'hb: begin
                curr_state <= 4'h0;
           end
   endcase

end

endmodule

