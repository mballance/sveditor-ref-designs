// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: niu_meta_arb_dbg.v
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

module niu_meta_arb_dbg(
	/*AUTOARG*/
   // Outputs
   meta_arb_debug_port, 
   // Inputs
   clk, pio_arb_ctrl, pio_arb_debug_vector,
   int_debug_port
   );

input clk;

input [31:0] pio_arb_ctrl;
input [31:0] pio_arb_debug_vector;
input [31:0] int_debug_port;

		// output to debug blk
output [31:0]   meta_arb_debug_port;


reg [31:0]  meta_arb_debug_port, meta_arb_debug_port_n;
reg [31:0] pio_arb_debug_vector_r;
reg [2:0] debug_sel;
 
// wire [31:0] int_debug_port= 32'h0;

always @(posedge clk)  begin
  meta_arb_debug_port<= meta_arb_debug_port_n;
  pio_arb_debug_vector_r<=  pio_arb_debug_vector;
  debug_sel<= pio_arb_ctrl[2:0];
end


/*AUTO_CONSTANT (`META_ARB__TRAINING_SET `MEGA_ARB__TRAINING_LOAD)*/

always @ (/*AUTOSENSE*/debug_sel or int_debug_port
	  or meta_arb_debug_port or pio_arb_debug_vector_r) begin
  case(debug_sel) 
    `META_ARB_TRAINING_SET: meta_arb_debug_port_n= ~meta_arb_debug_port;
    `META_ARB_TRAINING_LOAD: meta_arb_debug_port_n= pio_arb_debug_vector_r;
    default: meta_arb_debug_port_n= int_debug_port;
  endcase 
end


endmodule


