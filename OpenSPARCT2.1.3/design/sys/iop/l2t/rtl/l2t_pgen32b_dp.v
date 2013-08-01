// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_pgen32b_dp.v
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
module l2t_pgen32b_dp (
  parity, 
  dout, 
  din);
wire dout_p0_1;
wire dout_p0_2;
wire dout_p0_3;
wire dout_p0_4;
wire dout_p0_5;
wire dout_p0_6;
wire dout_p0_7;
wire dout_p0_8;
wire dout_p1_1;
wire dout_p1_2;
wire dout_p1_3;
wire dout_p1_4;
wire dout_p1_5;
wire dout_p1_6;
wire dout_p1_7;
wire dout_p1_8;
wire dout_p2_1;
wire dout_p2_2;
wire dout_p2_3;
wire dout_p2_4;
wire dout_p2_5;
wire dout_p2_6;
wire dout_p2_7;
wire dout_p2_8;
wire dout_p3_1;
wire dout_p3_2;
wire dout_p3_3;
wire dout_p3_4;
wire dout_p4_1;
wire dout_p4_2;
wire dout_p4_3;
wire dout_p4_4;
wire dout_p5_1;
wire dout_p6_1;
wire dout_p6_2;
wire dout_p6_3;
wire dout_p6_4;
wire dout_p6_5;
wire dout_p6_6;
wire dout_p6_7;
wire dout_p6_8;


output [6:0] parity;
output [31:0] dout;

input  [31:0] din;


assign dout = din;


l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_1  (
  .dout(dout_p0_1),
  .din0(din[0]),
  .din1(din[1]),
  .din2(din[3])
);


l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_2  (
  .dout(dout_p0_2),
  .din0(din[4]),
  .din1(din[6]),
  .din2(din[8])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_3  (
  .dout(dout_p0_3),
  .din0(din[10]),
  .din1(din[11]),
  .din2(din[13])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_4  (
  .dout(dout_p0_4),
  .din0(din[15]),
  .din1(din[17]),
  .din2(din[19])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_5  (
  .dout(dout_p0_5),
  .din0(din[21]),
  .din1(din[23]),
  .din2(din[25])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_6  (
  .dout(dout_p0_6),
  .din0(din[26]),
  .din1(din[28]),
  .din2(din[30])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_7  (
  .dout(dout_p0_7),
  .din0(dout_p0_1),
  .din1(dout_p0_2),
  .din2(dout_p0_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P0_8  (
  .dout(dout_p0_8),
  .din0(dout_p0_4),
  .din1(dout_p0_5),
  .din2(dout_p0_6)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 P0_9  (
  .dout(parity[0]),
  .din0(dout_p0_7),
  .din1(dout_p0_8)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_1  (
  .dout(dout_p1_1),
  .din0(din[0]),
  .din1(din[2]),
  .din2(din[3])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_2  (
  .dout(dout_p1_2),
  .din0(din[5]),
  .din1(din[6]),
  .din2(din[9])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_3  (
  .dout(dout_p1_3),
  .din0(din[10]),
  .din1(din[12]),
  .din2(din[13])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_4  (
  .dout(dout_p1_4),
  .din0(din[16]),
  .din1(din[17]),
  .din2(din[20])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_5  (
  .dout(dout_p1_5),
  .din0(din[21]),
  .din1(din[24]),
  .din2(din[25])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_6  (
  .dout(dout_p1_6),
  .din0(din[27]),
  .din1(din[28]),
  .din2(din[31])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_7  (
  .dout(dout_p1_7),
  .din0(dout_p1_1),
  .din1(dout_p1_2),
  .din2(dout_p1_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P1_8  (
  .dout(dout_p1_8),
  .din0(dout_p1_4),
  .din1(dout_p1_5),
  .din2(dout_p1_6)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 P1_9  (
  .dout(parity[1]),
  .din0(dout_p1_7),
  .din1(dout_p1_8)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_1  (
  .dout(dout_p2_1),
  .din0(din[1]),
  .din1(din[2]),
  .din2(din[3])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_2  (
  .dout(dout_p2_2),
  .din0(din[7]),
  .din1(din[8]),
  .din2(din[9])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_3  (
  .dout(dout_p2_3),
  .din0(din[10]),
  .din1(din[14]),
  .din2(din[15])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_4  (
  .dout(dout_p2_4),
  .din0(din[16]),
  .din1(din[17]),
  .din2(din[22])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_5  (
  .dout(dout_p2_5),
  .din0(din[23]),
  .din1(din[24]),
  .din2(din[25])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_6  (
  .dout(dout_p2_6),
  .din0(din[29]),
  .din1(din[30]),
  .din2(din[31])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_7  (
  .dout(dout_p2_7),
  .din0(dout_p2_1),
  .din1(dout_p2_2),
  .din2(dout_p2_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P2_8  (
  .dout(dout_p2_8),
  .din0(dout_p2_4),
  .din1(dout_p2_5),
  .din2(dout_p2_6)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 P2_9  (
  .dout(parity[2]),
  .din0(dout_p2_7),
  .din1(dout_p2_8)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P3_1  (
  .dout(dout_p3_1),
  .din0(din[4]),
  .din1(din[5]),
  .din2(din[6])
);


l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P3_2  (
  .dout(dout_p3_2),
  .din0(din[10]),
  .din1(din[18]),
  .din2(din[19])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P3_3  (
  .dout(dout_p3_3),
  .din0(din[20]),
  .din1(din[21]),
  .din2(din[22])
);


l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P3_4  (
  .dout(dout_p3_4),
  .din0(dout_p3_1),
  .din1(dout_p2_2),
  .din2(dout_p3_2)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P3_5  (
  .dout(parity[3]),
  .din0(dout_p3_4),
  .din1(dout_p2_5),
  .din2(dout_p3_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P4_1  (
  .dout(dout_p4_1),
  .din0(din[11]),
  .din1(din[12]),
  .din2(din[13])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P4_2  (
  .dout(dout_p4_2),
  .din0(din[14]),
  .din1(din[15]),
  .din2(din[16])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P4_3  (
  .dout(dout_p4_3),
  .din0(din[17]),
  .din1(din[18]),
  .din2(din[19])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P4_4  (
  .dout(dout_p4_4),
  .din0(dout_p4_1),
  .din1(dout_p4_2),
  .din2(dout_p4_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P4_5  (
  .dout(parity[4]),
  .din0(dout_p4_4),
  .din1(dout_p2_5),
  .din2(dout_p3_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P5_1  (
  .dout(dout_p5_1),
  .din0(din[26]),
  .din1(din[27]),
  .din2(din[28])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 P5_2  (
  .dout(parity[5]),
  .din0(dout_p2_6),
  .din1(dout_p5_1)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_1  (
  .dout(dout_p6_1),
  .din0(din[0]),
  .din1(din[1]),
  .din2(din[2])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_2  (
  .dout(dout_p6_2),
  .din0(din[4]),
  .din1(din[5]),
  .din2(din[7])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_3  (
  .dout(dout_p6_3),
  .din0(din[10]),
  .din1(din[11]),
  .din2(din[12])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_4  (
  .dout(dout_p6_4),
  .din0(din[14]),
  .din1(din[17]),
  .din2(din[18])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_5  (
  .dout(dout_p6_5),
  .din0(din[21]),
  .din1(din[23]),
  .din2(din[24])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_6  (
  .dout(dout_p6_6),
  .din0(din[26]),
  .din1(din[27]),
  .din2(din[29])
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_7  (
  .dout(dout_p6_7),
  .din0(dout_p6_1),
  .din1(dout_p6_2),
  .din2(dout_p6_3)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_3__width_1 P6_8  (
  .dout(dout_p6_8),
  .din0(dout_p6_4),
  .din1(dout_p6_5),
  .din2(dout_p6_6)
);

l2t_vlddir_dp_xor_macro__dxor_8x__ports_2__width_1 P6_9  (
  .dout(parity[6]),
  .din0(dout_p6_7),
  .din1(dout_p6_8)
);



endmodule
