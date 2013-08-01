// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: rtx_dmo_mux.v
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
module rtx_dmo_mux (clk, in0, in1, in2, in3, in4, in5, in6, out, sel);

input 		clk;
input  [39:0] 	in0, in1, in2, in3, in4, in5, in6;
input  [2:0]	sel; 
output [39:0]  out;

reg [39:0]  mux_out, out;

always @(in0 or in1 or in2 or in3 or in4 or in5 or in6 or sel)
   case(sel) // synopsys parallel_case full_case
      3'b000: mux_out = in0;
      3'b001: mux_out = in1;
      3'b010: mux_out = in2;
      3'b011: mux_out = in3;
      3'b100: mux_out = in4;
      3'b101: mux_out = in5;
      3'b110: mux_out = in6;
     default: mux_out = in0;
   endcase


always @(posedge clk)
	out <= mux_out;

endmodule
