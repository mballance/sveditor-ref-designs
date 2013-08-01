// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_smx_arb_2c.v
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

module niu_smx_arb_2c(
/*AUTOARG*/
   // Outputs
   ack_a, ack_b, selout, 
   // Inputs
   clk, reset_l, req_a, req_b, muxin_a, muxin_b
   );
		// arb 2 clients


parameter MUX_WIDTH= 6;

	// req needs to go down on nxt cycle after seeing ack
input clk;
input reset_l;

input req_a;	
input req_b;

input [MUX_WIDTH-1:0] muxin_a;
input [MUX_WIDTH-1:0] muxin_b;

output ack_a;	// pulse
output ack_b;
output [MUX_WIDTH-1:0] selout;

reg a_first, a_first_n;
reg ack_a, ack_b;
reg [MUX_WIDTH-1:0] selout;


always @(posedge clk) begin
  if(!reset_l) begin
    a_first<= `SMX_PD 1'b0;
  end
  else begin
    a_first<= `SMX_PD a_first_n;
  end
end

always @(/*AUTOSENSE*/a_first or muxin_a or muxin_b or req_a or req_b) begin
  case({req_a, req_b})
    2'b00: begin	
	     ack_a= 1'b0;
	     ack_b= 1'b0;
	     a_first_n= a_first;
	     selout= muxin_a;
	   end
    2'b01: begin	
	     ack_a= 1'b0;
	     ack_b= 1'b1;
	     a_first_n= 1'b1;
	     selout= muxin_b;
	   end
    2'b10: begin	
	     ack_a= 1'b1;
	     ack_b= 1'b0;
	     a_first_n= 1'b0;
	     selout= muxin_a;
	   end
    2'b11: begin	
	     ack_a= a_first;
	     ack_b= ~a_first;
	     a_first_n= ~a_first;
	     selout= (a_first)? muxin_a : muxin_b;
	   end
    default: begin
	       ack_a= 1'b0;
	       ack_b= 1'b0;
	       a_first_n= a_first;
	       selout= muxin_a;
	     end
   endcase
end

endmodule

