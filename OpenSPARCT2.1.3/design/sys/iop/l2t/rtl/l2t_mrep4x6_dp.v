// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mrep4x6_dp.v
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
module l2t_mrep4x6_dp (
  rep_out0, 
  rep_out1, 
  rep_out2, 
  rep_out3, 
  rep_out4, 
  rep_out5, 
  rep_in0, 
  rep_in1, 
  rep_in2, 
  rep_in3, 
  rep_in4, 
  rep_in5);


output   [3:0]   rep_out0;
output   [3:0]   rep_out1;
output   [3:0]   rep_out2;
output   [3:0]   rep_out3;
output   [3:0]   rep_out4;
output   [3:0]   rep_out5;
input    [3:0]   rep_in0;
input    [3:0]   rep_in1;
input    [3:0]   rep_in2;
input    [3:0]   rep_in3;
input    [3:0]   rep_in4;
input    [3:0]   rep_in5;

l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff0        
        (
        .din   (rep_in0[3:0]),
        .dout    (rep_out0[3:0])
        );

l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff1        
        (
        .din   (rep_in1[3:0]),
        .dout    (rep_out1[3:0])
        );

l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff2        
        (
        .din   (rep_in2[3:0]),
        .dout    (rep_out2[3:0])
        );

l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff3        
        (
        .din   (rep_in3[3:0]),
        .dout    (rep_out3[3:0])
        );


l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff4        
        (
        .din   (rep_in4[3:0]),
        .dout    (rep_out4[3:0])
        );


l2t_buff_macro__dbuff_32x__stack_4r__width_4 manual_buff5        
        (
        .din   (rep_in5[3:0]),
        .dout    (rep_out5[3:0])
        );


endmodule


//
//   buff macro
//
//





module l2t_buff_macro__dbuff_32x__stack_4r__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule


