// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_mrep2x64_dp.v
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
module l2t_mrep2x64_dp (
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
  rep_in15, 
  rep_out16, 
  rep_in16, 
  rep_out17, 
  rep_in17, 
  rep_out18, 
  rep_in18, 
  rep_out19, 
  rep_in19, 
  rep_out20, 
  rep_in20, 
  rep_out21, 
  rep_in21, 
  rep_out22, 
  rep_in22, 
  rep_out23, 
  rep_in23, 
  rep_out24, 
  rep_in24, 
  rep_out25, 
  rep_in25, 
  rep_out26, 
  rep_in26, 
  rep_out27, 
  rep_in27, 
  rep_out28, 
  rep_in28, 
  rep_out29, 
  rep_in29, 
  rep_out30, 
  rep_in30, 
  rep_out31, 
  rep_in31, 
  rep_out32, 
  rep_in32, 
  rep_out33, 
  rep_in33, 
  rep_out34, 
  rep_in34, 
  rep_out35, 
  rep_in35, 
  rep_out36, 
  rep_in36, 
  rep_out37, 
  rep_in37, 
  rep_out38, 
  rep_in38, 
  rep_out39, 
  rep_in39, 
  rep_out40, 
  rep_in40, 
  rep_out41, 
  rep_in41, 
  rep_out42, 
  rep_in42, 
  rep_out43, 
  rep_in43, 
  rep_out44, 
  rep_in44, 
  rep_out45, 
  rep_in45, 
  rep_out46, 
  rep_in46, 
  rep_out47, 
  rep_in47, 
  rep_out48, 
  rep_in48, 
  rep_out49, 
  rep_in49, 
  rep_out50, 
  rep_in50, 
  rep_out51, 
  rep_in51, 
  rep_out52, 
  rep_in52, 
  rep_out53, 
  rep_in53, 
  rep_out54, 
  rep_in54, 
  rep_out55, 
  rep_in55, 
  rep_out56, 
  rep_in56, 
  rep_out57, 
  rep_in57, 
  rep_out58, 
  rep_in58, 
  rep_out59, 
  rep_in59, 
  rep_out60, 
  rep_in60, 
  rep_out61, 
  rep_in61, 
  rep_out62, 
  rep_in62, 
  rep_out63, 
  rep_in63);


output   [1:0]    rep_out0; 
input    [1:0]    rep_in0; 
output   [1:0]    rep_out1; 
input    [1:0]    rep_in1; 
output   [1:0]    rep_out2; 
input    [1:0]    rep_in2; 
output   [1:0]    rep_out3; 
input    [1:0]    rep_in3; 
output   [1:0]    rep_out4; 
input    [1:0]    rep_in4; 
output   [1:0]    rep_out5; 
input    [1:0]    rep_in5; 
output   [1:0]    rep_out6; 
input    [1:0]    rep_in6; 
output   [1:0]    rep_out7; 
input    [1:0]    rep_in7; 
output   [1:0]    rep_out8; 
input    [1:0]    rep_in8; 
output   [1:0]    rep_out9; 
input    [1:0]    rep_in9; 
output   [1:0]    rep_out10; 
input    [1:0]    rep_in10; 
output   [1:0]    rep_out11; 
input    [1:0]    rep_in11; 
output   [1:0]    rep_out12; 
input    [1:0]    rep_in12; 
output   [1:0]    rep_out13; 
input    [1:0]    rep_in13; 
output   [1:0]    rep_out14; 
input    [1:0]    rep_in14; 
output   [1:0]    rep_out15; 
input    [1:0]    rep_in15; 
output   [1:0]    rep_out16; 
input    [1:0]    rep_in16; 
output   [1:0]    rep_out17; 
input    [1:0]    rep_in17; 
output   [1:0]    rep_out18; 
input    [1:0]    rep_in18; 
output   [1:0]    rep_out19; 
input    [1:0]    rep_in19; 
output   [1:0]    rep_out20; 
input    [1:0]    rep_in20; 
output   [1:0]    rep_out21; 
input    [1:0]    rep_in21; 
output   [1:0]    rep_out22; 
input    [1:0]    rep_in22; 
output   [1:0]    rep_out23; 
input    [1:0]    rep_in23; 
output   [1:0]    rep_out24; 
input    [1:0]    rep_in24; 
output   [1:0]    rep_out25; 
input    [1:0]    rep_in25; 
output   [1:0]    rep_out26; 
input    [1:0]    rep_in26; 
output   [1:0]    rep_out27; 
input    [1:0]    rep_in27; 
output   [1:0]    rep_out28; 
input    [1:0]    rep_in28; 
output   [1:0]    rep_out29; 
input    [1:0]    rep_in29; 
output   [1:0]    rep_out30; 
input    [1:0]    rep_in30; 
output   [1:0]    rep_out31; 
input    [1:0]    rep_in31; 
output   [1:0]    rep_out32; 
input    [1:0]    rep_in32; 
output   [1:0]    rep_out33; 
input    [1:0]    rep_in33; 
output   [1:0]    rep_out34; 
input    [1:0]    rep_in34; 
output   [1:0]    rep_out35; 
input    [1:0]    rep_in35; 
output   [1:0]    rep_out36; 
input    [1:0]    rep_in36; 
output   [1:0]    rep_out37; 
input    [1:0]    rep_in37; 
output   [1:0]    rep_out38; 
input    [1:0]    rep_in38; 
output   [1:0]    rep_out39; 
input    [1:0]    rep_in39; 
output   [1:0]    rep_out40; 
input    [1:0]    rep_in40; 
output   [1:0]    rep_out41; 
input    [1:0]    rep_in41; 
output   [1:0]    rep_out42; 
input    [1:0]    rep_in42; 
output   [1:0]    rep_out43; 
input    [1:0]    rep_in43; 
output   [1:0]    rep_out44; 
input    [1:0]    rep_in44; 
output   [1:0]    rep_out45; 
input    [1:0]    rep_in45; 
output   [1:0]    rep_out46; 
input    [1:0]    rep_in46; 
output   [1:0]    rep_out47; 
input    [1:0]    rep_in47; 
output   [1:0]    rep_out48; 
input    [1:0]    rep_in48; 
output   [1:0]    rep_out49; 
input    [1:0]    rep_in49; 
output   [1:0]    rep_out50; 
input    [1:0]    rep_in50; 
output   [1:0]    rep_out51; 
input    [1:0]    rep_in51; 
output   [1:0]    rep_out52; 
input    [1:0]    rep_in52; 
output   [1:0]    rep_out53; 
input    [1:0]    rep_in53; 
output   [1:0]    rep_out54; 
input    [1:0]    rep_in54; 
output   [1:0]    rep_out55; 
input    [1:0]    rep_in55; 
output   [1:0]    rep_out56; 
input    [1:0]    rep_in56; 
output   [1:0]    rep_out57; 
input    [1:0]    rep_in57; 
output   [1:0]    rep_out58; 
input    [1:0]    rep_in58; 
output   [1:0]    rep_out59; 
input    [1:0]    rep_in59; 
output   [1:0]    rep_out60; 
input    [1:0]    rep_in60; 
output   [1:0]    rep_out61; 
input    [1:0]    rep_in61; 
output   [1:0]    rep_out62; 
input    [1:0]    rep_in62; 
output   [1:0]    rep_out63; 
input    [1:0]    rep_in63; 
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff0   
         (
         .din   (rep_in0[1:0]), 
         .dout   (rep_out0[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff1   
         (
         .din   (rep_in1[1:0]), 
         .dout   (rep_out1[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff2   
         (
         .din   (rep_in2[1:0]), 
         .dout   (rep_out2[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff3   
         (
         .din   (rep_in3[1:0]), 
         .dout   (rep_out3[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff4   
         (
         .din   (rep_in4[1:0]), 
         .dout   (rep_out4[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff5   
         (
         .din   (rep_in5[1:0]), 
         .dout   (rep_out5[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff6   
         (
         .din   (rep_in6[1:0]), 
         .dout   (rep_out6[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff7   
         (
         .din   (rep_in7[1:0]), 
         .dout   (rep_out7[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff8   
         (
         .din   (rep_in8[1:0]), 
         .dout   (rep_out8[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff9   
         (
         .din   (rep_in9[1:0]), 
         .dout   (rep_out9[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff10   
         (
         .din   (rep_in10[1:0]), 
         .dout   (rep_out10[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff11   
         (
         .din   (rep_in11[1:0]), 
         .dout   (rep_out11[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff12   
         (
         .din   (rep_in12[1:0]), 
         .dout   (rep_out12[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff13   
         (
         .din   (rep_in13[1:0]), 
         .dout   (rep_out13[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff14   
         (
         .din   (rep_in14[1:0]), 
         .dout   (rep_out14[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff15   
         (
         .din   (rep_in15[1:0]), 
         .dout   (rep_out15[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff16   
         (
         .din   (rep_in16[1:0]), 
         .dout   (rep_out16[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff17   
         (
         .din   (rep_in17[1:0]), 
         .dout   (rep_out17[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff18   
         (
         .din   (rep_in18[1:0]), 
         .dout   (rep_out18[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff19   
         (
         .din   (rep_in19[1:0]), 
         .dout   (rep_out19[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff20   
         (
         .din   (rep_in20[1:0]), 
         .dout   (rep_out20[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff21   
         (
         .din   (rep_in21[1:0]), 
         .dout   (rep_out21[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff22   
         (
         .din   (rep_in22[1:0]), 
         .dout   (rep_out22[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff23   
         (
         .din   (rep_in23[1:0]), 
         .dout   (rep_out23[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff24   
         (
         .din   (rep_in24[1:0]), 
         .dout   (rep_out24[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff25   
         (
         .din   (rep_in25[1:0]), 
         .dout   (rep_out25[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff26   
         (
         .din   (rep_in26[1:0]), 
         .dout   (rep_out26[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff27   
         (
         .din   (rep_in27[1:0]), 
         .dout   (rep_out27[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff28   
         (
         .din   (rep_in28[1:0]), 
         .dout   (rep_out28[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff29   
         (
         .din   (rep_in29[1:0]), 
         .dout   (rep_out29[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff30   
         (
         .din   (rep_in30[1:0]), 
         .dout   (rep_out30[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff31   
         (
         .din   (rep_in31[1:0]), 
         .dout   (rep_out31[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff32   
         (
         .din   (rep_in32[1:0]), 
         .dout   (rep_out32[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff33   
         (
         .din   (rep_in33[1:0]), 
         .dout   (rep_out33[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff34   
         (
         .din   (rep_in34[1:0]), 
         .dout   (rep_out34[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff35   
         (
         .din   (rep_in35[1:0]), 
         .dout   (rep_out35[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff36   
         (
         .din   (rep_in36[1:0]), 
         .dout   (rep_out36[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff37   
         (
         .din   (rep_in37[1:0]), 
         .dout   (rep_out37[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff38   
         (
         .din   (rep_in38[1:0]), 
         .dout   (rep_out38[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff39   
         (
         .din   (rep_in39[1:0]), 
         .dout   (rep_out39[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff40   
         (
         .din   (rep_in40[1:0]), 
         .dout   (rep_out40[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff41   
         (
         .din   (rep_in41[1:0]), 
         .dout   (rep_out41[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff42   
         (
         .din   (rep_in42[1:0]), 
         .dout   (rep_out42[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff43   
         (
         .din   (rep_in43[1:0]), 
         .dout   (rep_out43[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff44   
         (
         .din   (rep_in44[1:0]), 
         .dout   (rep_out44[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff45   
         (
         .din   (rep_in45[1:0]), 
         .dout   (rep_out45[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff46   
         (
         .din   (rep_in46[1:0]), 
         .dout   (rep_out46[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff47   
         (
         .din   (rep_in47[1:0]), 
         .dout   (rep_out47[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff48   
         (
         .din   (rep_in48[1:0]), 
         .dout   (rep_out48[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff49   
         (
         .din   (rep_in49[1:0]), 
         .dout   (rep_out49[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff50   
         (
         .din   (rep_in50[1:0]), 
         .dout   (rep_out50[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff51   
         (
         .din   (rep_in51[1:0]), 
         .dout   (rep_out51[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff52   
         (
         .din   (rep_in52[1:0]), 
         .dout   (rep_out52[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff53   
         (
         .din   (rep_in53[1:0]), 
         .dout   (rep_out53[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff54   
         (
         .din   (rep_in54[1:0]), 
         .dout   (rep_out54[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff55   
         (
         .din   (rep_in55[1:0]), 
         .dout   (rep_out55[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff56   
         (
         .din   (rep_in56[1:0]), 
         .dout   (rep_out56[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff57   
         (
         .din   (rep_in57[1:0]), 
         .dout   (rep_out57[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff58   
         (
         .din   (rep_in58[1:0]), 
         .dout   (rep_out58[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff59   
         (
         .din   (rep_in59[1:0]), 
         .dout   (rep_out59[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff60   
         (
         .din   (rep_in60[1:0]), 
         .dout   (rep_out60[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff61   
         (
         .din   (rep_in61[1:0]), 
         .dout   (rep_out61[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff62   
         (
         .din   (rep_in62[1:0]), 
         .dout   (rep_out62[1:0]) 
         );
l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 manual_buff63   
         (
         .din   (rep_in63[1:0]), 
         .dout   (rep_out63[1:0]) 
         );


endmodule


//
//   buff macro
//
//





module l2t_mrep2x64_dp_buff_macro__dbuff_32x__stack_2r__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule




