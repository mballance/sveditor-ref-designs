// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mrep16x8_dp.v
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
module l2t_mrep16x8_dp (
  rep_out0, 
  rep_in0, 
  rep_out1, 
  rep_in1, 
  rep_out2, 
  rep_in2, 
  rep_out3, 
  rep_in3, 
  rep_out4, 
  rep_in4, 
  rep_out5, 
  rep_in5, 
  rep_out6, 
  rep_in6, 
  rep_out7, 
  rep_in7);


output   [15:0]   rep_out0;
input    [15:0]   rep_in0;
output   [15:0]   rep_out1;
input    [15:0]   rep_in1;
output   [15:0]   rep_out2;
input    [15:0]   rep_in2;
output   [15:0]   rep_out3;
input    [15:0]   rep_in3;
output   [15:0]   rep_out4;
input    [15:0]   rep_in4;
output   [15:0]   rep_out5;
input    [15:0]   rep_in5;
output   [15:0]   rep_out6;
input    [15:0]   rep_in6;
output   [15:0]   rep_out7;
input    [15:0]   rep_in7;


l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff0        
        (
        .din   (rep_in0[15:0]),
        .dout    (rep_out0[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff1        
        (
        .din   (rep_in1[15:0]),
        .dout    (rep_out1[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff2        
        (
        .din   (rep_in2[15:0]),
        .dout    (rep_out2[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff3        
        (
        .din   (rep_in3[15:0]),
        .dout    (rep_out3[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff4        
        (
        .din   (rep_in4[15:0]),
        .dout    (rep_out4[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff5        
        (
        .din   (rep_in5[15:0]),
        .dout    (rep_out5[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff6        
        (
        .din   (rep_in6[15:0]),
        .dout    (rep_out6[15:0])
        );
l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 manual_buff7        
        (
        .din   (rep_in7[15:0]),
        .dout    (rep_out7[15:0])
        );

endmodule


//
//   buff macro
//
//





module l2t_mrep16x8_dp_buff_macro__dbuff_32x__stack_16r__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule




