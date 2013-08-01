// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_ecc24b_dp.v
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
module l2t_ecc24b_dp (
  din, 
  dout, 
  parity);
wire p1_10;
wire p1_11;
wire p1_12;
wire p1_13;
wire p1_14;
wire p1_20;
wire p2_10;
wire p2_11;
wire p2_12;
wire p2_13;
wire p2_20;
wire p4_10;
wire p4_11;
wire p4_12;
wire p4_13;
wire p4_20;
wire p8_10;
wire p8_11;
wire p8_12;
wire p8_13;
wire p8_20;
wire p16_10;
wire p16_11;
wire p16_12;
wire p16_13;
wire p16_20;
wire p30_10;
wire p30_11;
wire p30_12;
wire p30_13;
wire p30_14;
wire p30_20;


// Input Ports
input  [23:0] din ;

// Output Ports
output [23:0] dout ;
output [5:0]  parity ;

wire   [23:0] dout ;
wire   [5:0]  parity ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire          p30 ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |  |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |  |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |  |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |  |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   |   | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |  |  |* |  |* |* |  |  |* |* |  |* |  |  | * |   | * | * |   | * |   |   | * | * |   |   | * |   | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

//
//assign p1  = din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
//             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
//             din[21] ^ din[23] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_10  (
        .dout   (p1_10),
        .din0   (din[0]),
        .din1   (din[1]),
        .din2   (din[3])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_11  (
        .dout   (p1_11),
        .din0   (din[4]),
        .din1   (din[6]),
        .din2   (din[8])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_12  (
        .dout   (p1_12),
        .din0   (din[10]),
        .din1   (din[11]),
        .din2   (din[13])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_13  (
        .dout   (p1_13),
        .din0   (din[15]),
        .din1   (din[17]),
        .din2   (din[19])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_2__width_1 p1_slice_14  (
        .dout   (p1_14),
        .din0   (din[21]),
        .din1   (din[23])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_20  (
        .dout   (p1_20),
        .din0   (p1_10),
        .din1   (p1_11),
        .din2   (p1_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p1_slice  (
        .dout   (p1),
        .din0   (p1_20),
        .din1   (p1_13),
        .din2   (p1_14)
        );



//assign p2  = din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
//             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
//             din[21] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_10  (
        .dout   (p2_10),
        .din0   (din[0]),
        .din1   (din[2]),
        .din2   (din[3])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_11  (
        .dout   (p2_11),
        .din0   (din[5]),
        .din1   (din[6]),
        .din2   (din[9])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_12  (
        .dout   (p2_12),
        .din0   (din[10]),
        .din1   (din[12]),
        .din2   (din[13])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_13  (
        .dout   (p2_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[20])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_20  (
        .dout   (p2_20),
        .din0   (p2_10),
        .din1   (p2_11),
        .din2   (p2_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p2_slice  (
        .dout   (p2),
        .din0   (p2_20),
        .din1   (p2_13),
        .din2   (din[21])
        );



//assign p4  = din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
//             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
//             din[23] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_10  (
        .dout   (p4_10),
        .din0   (din[1]),
        .din1   (din[2]),
        .din2   (din[3])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_11  (
        .dout   (p4_11),
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_12  (
        .dout   (p4_12),
        .din0   (din[10]),
        .din1   (din[14]),
        .din2   (din[15])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_13  (
        .dout   (p4_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[22])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_20  (
        .dout   (p4_20),
        .din0   (p4_10),
        .din1   (p4_11),
        .din2   (p4_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p4_slice  (
        .dout   (p4),
        .din0   (p4_20),
        .din1   (p4_13),
        .din2   (din[23])
        );



//assign p8  = din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
//             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
//             din[23] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_10  (
        .dout   (p8_10),
        .din0   (din[4]),
        .din1   (din[5]),
        .din2   (din[6])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_11  (
        .dout   (p8_11),
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_12  (
        .dout   (p8_12),
        .din0   (din[10]),
        .din1   (din[18]),
        .din2   (din[19])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_13  (
        .dout   (p8_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_20  (
        .dout   (p8_20),
        .din0   (p8_10),
        .din1   (p8_11),
        .din2   (p8_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p8_slice  (
        .dout   (p8),
        .din0   (p8_20),
        .din1   (p8_13),
        .din2   (din[23])
        );



//assign p16 = din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
//             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
//             din[23] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_10  (
        .dout   (p16_10),
        .din0   (din[11]),
        .din1   (din[12]),
        .din2   (din[13])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_11  (
        .dout   (p16_11),
        .din0   (din[14]),
        .din1   (din[15]),
        .din2   (din[16])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_12  (
        .dout   (p16_12),
        .din0   (din[17]),
        .din1   (din[18]),
        .din2   (din[19])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_13  (
        .dout   (p16_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_20  (
        .dout   (p16_20),
        .din0   (p16_10),
        .din1   (p16_11),
        .din2   (p16_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p16_slice  (
        .dout   (p16),
        .din0   (p16_20),
        .din1   (p16_13),
        .din2   (din[23])
        );



//assign p30 = din[0]  ^ din[1]  ^ din[2]  ^ din[4]  ^ din[5]  ^
//             din[7]  ^ din[10] ^ din[11] ^ din[12] ^ din[14] ^
//             din[17] ^ din[18] ^ din[21] ^ din[23] ;

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p30_slice_10  (
        .dout   (p30_10),
        .din0   (din[0]),
        .din1   (din[1]),
        .din2   (din[2])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p30_slice_11  (
        .dout   (p30_11),
        .din0   (din[4]),
        .din1   (din[5]),
        .din2   (din[7])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p30_slice_12  (
        .dout   (p30_12),
        .din0   (din[10]),
        .din1   (din[11]),
        .din2   (din[12])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p30_slice_13  (
        .dout   (p30_13),
        .din0   (din[14]),
        .din1   (din[17]),
        .din2   (din[18])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_2__width_1 p30_slice_14  (
        .dout   (p30_14),
        .din0   (din[21]),
        .din1   (din[23])
        );

l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 p30_slice_20  (
        .dout   (p30_20),
        .din0   (p30_10),
        .din1   (p30_11),
        .din2   (p30_12)
        );

l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 p30_slice  (
        .dout   (p30),
        .din0   (p30_20),
        .din1   (p30_13),
        .din2   (p30_14)
        );



assign dout   = din[23:0] ;

//buff_macro  buff_dout	(width=24,stack=24r)
//	(
//	.dout	(dout[23:0]),
//	.din	(din[23:0])
//	);
//
assign parity = {p30, p16, p8, p4, p2, p1} ;
//
//buff_macro  buff_parity   (width=6,stack=6c)
//        (
//        .dout   (parity[5:0]),
//        .din    ({p30, p16, p8, p4, p2, p1})
//        );
//

endmodule


//
//   xor macro for ports = 2,3
//
//





module l2t_ecc24b_dp_xor_macro__dxor_8x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_ecc24b_dp_xor_macro__dxor_8x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;





xor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_ecc24b_dp_xor_macro__dxor_16x__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule




