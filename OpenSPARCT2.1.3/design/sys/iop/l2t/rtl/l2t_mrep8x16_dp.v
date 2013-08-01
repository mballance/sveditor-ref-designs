// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mrep8x16_dp.v
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
module l2t_mrep8x16_dp (
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
  rep_in7, 
  rep_out8, 
  rep_in8, 
  rep_out9, 
  rep_in9, 
  rep_out10, 
  rep_in10, 
  rep_out11, 
  rep_in11, 
  rep_out12, 
  rep_in12, 
  rep_out13, 
  rep_in13, 
  rep_out14, 
  rep_in14, 
  rep_out15, 
  rep_in15);


output   [7:0]   rep_out0;
input    [7:0]   rep_in0;
output   [7:0]   rep_out1;
input    [7:0]   rep_in1;
output   [7:0]   rep_out2;
input    [7:0]   rep_in2;
output   [7:0]   rep_out3;
input    [7:0]   rep_in3;
output   [7:0]   rep_out4;
input    [7:0]   rep_in4;
output   [7:0]   rep_out5;
input    [7:0]   rep_in5;
output   [7:0]   rep_out6;
input    [7:0]   rep_in6;
output   [7:0]   rep_out7;
input    [7:0]   rep_in7;
output   [7:0]   rep_out8;
input    [7:0]   rep_in8;
output   [7:0]   rep_out9;
input    [7:0]   rep_in9;
output   [7:0]   rep_out10;
input    [7:0]   rep_in10;
output   [7:0]   rep_out11;
input    [7:0]   rep_in11;
output   [7:0]   rep_out12;
input    [7:0]   rep_in12;
output   [7:0]   rep_out13;
input    [7:0]   rep_in13;
output   [7:0]   rep_out14;
input    [7:0]   rep_in14;
output   [7:0]   rep_out15;
input    [7:0]   rep_in15;


l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff0        
        (
        .din   (rep_in0[7:0]),
        .dout    (rep_out0[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff1        
        (
        .din   (rep_in1[7:0]),
        .dout    (rep_out1[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff2        
        (
        .din   (rep_in2[7:0]),
        .dout    (rep_out2[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff3        
        (
        .din   (rep_in3[7:0]),
        .dout    (rep_out3[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff4        
        (
        .din   (rep_in4[7:0]),
        .dout    (rep_out4[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff5        
        (
        .din   (rep_in5[7:0]),
        .dout    (rep_out5[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff6        
        (
        .din   (rep_in6[7:0]),
        .dout    (rep_out6[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff7        
        (
        .din   (rep_in7[7:0]),
        .dout    (rep_out7[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff8        
        (
        .din   (rep_in8[7:0]),
        .dout    (rep_out8[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff9        
        (
        .din   (rep_in9[7:0]),
        .dout    (rep_out9[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff10        
        (
        .din   (rep_in10[7:0]),
        .dout    (rep_out10[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff11        
        (
        .din   (rep_in11[7:0]),
        .dout    (rep_out11[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff12        
        (
        .din   (rep_in12[7:0]),
        .dout    (rep_out12[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff13        
        (
        .din   (rep_in13[7:0]),
        .dout    (rep_out13[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff14        
        (
        .din   (rep_in14[7:0]),
        .dout    (rep_out14[7:0])
        );
l2t_buff_macro__dbuff_32x__stack_8r__width_8 manual_buff15        
        (
        .din   (rep_in15[7:0]),
        .dout    (rep_out15[7:0])
        );

endmodule

//
//   buff macro
//
//





module l2t_buff_macro__dbuff_32x__stack_8r__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule

