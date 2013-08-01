// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: n2_l2t_cmp_3bx2.v
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
module n2_l2t_cmp_3bx2 (
  sao_mx1_h, 
  sao_mx1_l, 
  sao_mx0_h, 
  sao_mx0_l, 
  lkuptag_d1, 
  l1clk_d, 
  w1_cmp3b, 
  w0_cmp3b) ;


	input 	[2:0]	sao_mx1_h;
	input 	[2:0]	sao_mx1_l;
	input 	[2:0]	sao_mx0_h;
	input 	[2:0]	sao_mx0_l;
	input 	[2:0]	lkuptag_d1;
	input           l1clk_d;
	output          w1_cmp3b;
	output	        w0_cmp3b;

reg w1_cmp3b;
reg w0_cmp3b;

//Compare ouput is 0 for match and 1 for mismatch

	always @(l1clk_d or sao_mx1_h or sao_mx1_l or sao_mx0_h or sao_mx0_l or lkuptag_d1) 

	if (l1clk_d) // Precharge mode
           begin
             w1_cmp3b = 1'b0;
             w0_cmp3b = 1'b0;
           end		   
        else 	
	if (~l1clk_d ) // Evaluation mode 
	   begin 
	     w1_cmp3b = (lkuptag_d1[2] && sao_mx1_l[2]) || (~lkuptag_d1[2] && sao_mx1_h[2]) ||
	                (lkuptag_d1[1] && sao_mx1_l[1]) || (~lkuptag_d1[1] && sao_mx1_h[1]) ||
	                (lkuptag_d1[0] && sao_mx1_l[0]) || (~lkuptag_d1[0] && sao_mx1_h[0]);
			
	     w0_cmp3b = (lkuptag_d1[2] && sao_mx0_l[2]) || (~lkuptag_d1[2] && sao_mx0_h[2]) ||
	                (lkuptag_d1[1] && sao_mx0_l[1]) || (~lkuptag_d1[1] && sao_mx0_h[1]) ||
	                (lkuptag_d1[0] && sao_mx0_l[0]) || (~lkuptag_d1[0] && sao_mx0_h[0]);
           end
 
endmodule // n2_l2t_cmp_3bx2

