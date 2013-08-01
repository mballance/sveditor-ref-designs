// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mrep32x3_dp.v
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
module l2t_mrep32x3_dp (
  rep_out0, 
  rep_in0, 
  rep_out1, 
  rep_in1, 
  rep_out2, 
  rep_in2);


output   [31:0]   rep_out0;
input    [31:0]   rep_in0;
output   [31:0]   rep_out1;
input    [31:0]   rep_in1;
output   [31:0]   rep_out2;
input    [31:0]   rep_in2;


l2t_mrep32x3_dp_buff_macro__dbuff_32x__stack_32r__width_32 manual_buff0        
        (
        .din   (rep_in0[31:0]),
        .dout    (rep_out0[31:0])
        );
l2t_mrep32x3_dp_buff_macro__dbuff_32x__stack_32r__width_32 manual_buff1        
        (
        .din   (rep_in1[31:0]),
        .dout    (rep_out1[31:0])
        );
l2t_mrep32x3_dp_buff_macro__dbuff_32x__stack_32r__width_32 manual_buff2        
        (
        .din   (rep_in2[31:0]),
        .dout    (rep_out2[31:0])
        );

endmodule


//
//   buff macro
//
//





module l2t_mrep32x3_dp_buff_macro__dbuff_32x__stack_32r__width_32 (
  din, 
  dout);
  input [31:0] din;
  output [31:0] dout;






buff #(32)  d0_0 (
.in(din[31:0]),
.out(dout[31:0])
);








endmodule




