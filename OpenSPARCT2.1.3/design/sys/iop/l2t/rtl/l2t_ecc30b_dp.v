// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_ecc30b_dp.v
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
module l2t_ecc30b_dp (
  din, 
  parity, 
  dout, 
  corrected_bit);
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
wire p2_21;
wire p4_10;
wire p4_11;
wire p4_12;
wire p4_13;
wire p4_20;
wire p4_21;
wire p8_10;
wire p8_11;
wire p8_12;
wire p8_13;
wire p8_20;
wire p8_21;
wire p16_10;
wire p16_11;
wire p16_12;
wire p16_13;
wire p16_20;
wire p16_21;
wire np1;
wire np2;
wire np4;
wire np8;
wire np16;
wire error_bit0_10a;
wire error_bit0_10b;
wire error_bit0_10c;
wire error_bit0_a;
wire error_bit1_10a;
wire error_bit1_10b;
wire error_bit1_10c;
wire error_bit1_a;
wire error_bit2_10a;
wire error_bit2_10b;
wire error_bit2_10c;
wire error_bit2_a;
wire error_bit3_10a;
wire error_bit3_10b;
wire error_bit3_a;
wire error_bit4_10a;
wire error_bit4_10b;
wire error_bit4_a;
wire error_bit5_10a;
wire error_bit5_10b;
wire error_bit5_a;
wire error_bit6_10a;
wire error_bit6_10b;
wire error_bit6_a;
wire error_bit7_10a;
wire error_bit7_10b;
wire error_bit7_a;
wire error_bit8_10a;
wire error_bit8_10b;
wire error_bit8_a;
wire error_bit9_10a;
wire error_bit9_10b;
wire error_bit9_a;
wire error_bit10_10a;
wire error_bit10_10b;
wire error_bit10_a;
wire error_bit11_10a;
wire error_bit11_10b;
wire error_bit11_a;
wire error_bit12_10a;
wire error_bit12_10b;
wire error_bit12_a;
wire error_bit13_10a;
wire error_bit13_10b;
wire error_bit13_a;
wire error_bit14_10a;
wire error_bit14_10b;
wire error_bit14_a;
wire error_bit15_10a;
wire error_bit15_10b;
wire error_bit15_a;
wire error_bit16_10a;
wire error_bit16_10b;
wire error_bit16_a;
wire error_bit17_10a;
wire error_bit17_10b;
wire error_bit17_a;
wire error_bit18_10a;
wire error_bit18_10b;
wire error_bit18_a;
wire error_bit19_10a;
wire error_bit19_10b;
wire error_bit19_a;
wire error_bit20_10a;
wire error_bit20_10b;
wire error_bit20_a;
wire error_bit21_10a;
wire error_bit21_10b;
wire error_bit21_a;
wire error_bit22_10a;
wire error_bit22_10b;
wire error_bit22_a;
wire error_bit23_10a;
wire error_bit23_10b;
wire error_bit23_a;


// Input Ports
input  [23:0] din ;
input  [4:0]  parity ;

// Output Ports
output [23:0] dout ;
output [4:0]  corrected_bit ;

wire   [23:0] dout ;
wire   [4:0]  corrected_bit ;

// Local Reg and Wires
wire          p1 ;
wire          p2 ;
wire          p4 ;
wire          p8 ;
wire          p16 ;
wire [23:0]   error_bit ;


//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//    |1 |2 |3 |4 |5 |6 |7 |8 |9 |10|11|12|13|14|15 |16 |17 |18 |19 |20 |21 |22 |23 |24 |25 |26 |27 |28 |29 |30 |
//    |P1|P2|D0|P4|D1|D2|D3|P8|D4|D5|D6|D7|D8|D9|D10|P16|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|P30|
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//P1  |* |  |* |  |* |  |* |  |* |  |* |  |* |  | * |   | * |   | * |   | * |   | * |   | * |   | * |   | * |   |
//P2  |  |* |* |  |  |* |* |  |  |* |* |  |  |* | * |   |   | * | * |   |   | * | * |   |   | * | * |   |   |   |
//P4  |  |  |  |* |* |* |* |  |  |  |  |* |* |* | * |   |   |   |   | * | * | * | * |   |   |   |   | * | * |   |
//P8  |  |  |  |  |  |  |  |* |* |* |* |* |* |* | * |   |   |   |   |   |   |   |   | * | * | * | * | * | * |   |
//P16 |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   | * | * | * | * | * | * | * | * | * | * | * | * | * | * |   |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
//p30 |* |* |* |* |* |* |* |* |* |* |* |* |* |* | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * | * |
//----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|


//assign p1  = parity[0] ^
//             din[0]  ^ din[1]  ^ din[3]  ^ din[4]  ^ din[6]  ^ din[8]  ^
//             din[10] ^ din[11] ^ din[13] ^ din[15] ^ din[17] ^ din[19] ^
//             din[21] ^ din[23] ;

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_10  (
        .dout   (p1_10),
        .din0   (din[0]),
        .din1   (din[1]),
        .din2   (din[3])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_11  (
        .dout   (p1_11),
        .din0   (din[4]),
        .din1   (din[6]),
        .din2   (din[8])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_12  (
        .dout   (p1_12),
        .din0   (din[10]),
        .din1   (din[11]),
        .din2   (din[13])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_13  (
        .dout   (p1_13),
        .din0   (din[15]),
        .din1   (din[17]),
        .din2   (din[19])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_14  (
        .dout   (p1_14),
        .din0   (din[21]),
        .din1   (din[23]),
        .din2   (parity[0])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice_20  (
        .dout   (p1_20),
        .din0   (p1_10),
        .din1   (p1_11),
        .din2   (p1_12)
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p1_slice  (
        .dout   (p1),
        .din0   (p1_13),
        .din1   (p1_14),
        .din2   (p1_20)
        );

//assign p2  = parity[1] ^
//             din[0]  ^ din[2]  ^ din[3]  ^ din[5]  ^ din[6]  ^ din[9]  ^
//             din[10] ^ din[12] ^ din[13] ^ din[16] ^ din[17] ^ din[20] ^
//             din[21] ;

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_10  (
        .dout   (p2_10),
        .din0   (din[0]),
        .din1   (din[2]),
        .din2   (din[3])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_11  (
        .dout   (p2_11),
        .din0   (din[5]),
        .din1   (din[6]),
        .din2   (din[9]) 
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_12  (
        .dout   (p2_12),
        .din0   (din[10]),
        .din1   (din[12]),
        .din2   (din[13])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_13  (
        .dout   (p2_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[20])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_20  (
        .dout   (p2_20),
        .din0   (p2_10),
        .din1   (p2_11),
        .din2   (p2_12)
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p2_slice_21  (
        .dout   (p2_21),
        .din0   (p2_13),
        .din1   (din[21]),
        .din2   (parity[1])
        );

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_2__width_1 p2_slice  (
        .dout   (p2),
        .din0   (p2_21),
        .din1   (p2_20)
        );



//assign p4  = parity[2] ^
//             din[1]  ^ din[2]  ^ din[3]  ^ din[7]  ^ din[8]  ^ din[9]  ^
//             din[10] ^ din[14] ^ din[15] ^ din[16] ^ din[17] ^ din[22] ^
//             din[23] ;

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_10  (
        .dout   (p4_10), 
        .din0   (din[1]),
        .din1   (din[2]),
        .din2   (din[3])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_11  (
        .dout   (p4_11), 
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_12  (
        .dout   (p4_12),
        .din0   (din[10]),
        .din1   (din[14]),
        .din2   (din[15])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_13  (
        .dout   (p4_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[22])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_20  (
        .dout   (p4_20),
        .din0   (p4_10),
        .din1   (p4_11),
        .din2   (p4_12)
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p4_slice_21  (
        .dout   (p4_21),
        .din0   (p4_13),
        .din1   (din[23]),
        .din2   (parity[2])
        );

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_2__width_1 p4_slice  (
        .dout   (p4),
        .din0   (p4_20),
        .din1   (p4_21)
        );



//assign p8  = parity[3] ^
//             din[4]  ^ din[5]  ^ din[6]  ^ din[7]  ^ din[8]  ^ din[9]  ^
//             din[10] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
//             din[23] ;



l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_10  (
        .dout   (p8_10),
        .din0   (din[4]),
        .din1   (din[5]),
        .din2   (din[6]) 
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_11  (
        .dout   (p8_11), 
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_12  ( 
        .dout   (p8_12),
        .din0   (din[10]),
        .din1   (din[18]),
        .din2   (din[19])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_13  ( 
        .dout   (p8_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_20  (
        .dout   (p8_20),
        .din0   (p8_10),
        .din1   (p8_11),
        .din2   (p8_12)
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p8_slice_21  (
        .dout   (p8_21),
        .din0   (p8_13),
        .din1   (din[23]),
        .din2   (parity[3])
        );

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_2__width_1 p8_slice  (
        .dout   (p8),
        .din0   (p8_21),
        .din1   (p8_20)
        );



//assign p16 = parity[4] ^
//             din[11] ^ din[12] ^ din[13] ^ din[14] ^ din[15] ^ din[16] ^
//             din[17] ^ din[18] ^ din[19] ^ din[20] ^ din[21] ^ din[22] ^
//             din[23] ;




l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_10  (
        .dout   (p16_10),
        .din0   (din[11]),
        .din1   (din[12]),
        .din2   (din[13])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_11  (
        .dout   (p16_11),
        .din0   (din[14]),
        .din1   (din[15]),
        .din2   (din[16])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_12  (
        .dout   (p16_12),
        .din0   (din[17]),
        .din1   (din[18]),
        .din2   (din[19])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_13  (
        .dout   (p16_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_20  (
        .dout   (p16_20),
        .din0   (p16_10),
        .din1   (p16_11),
        .din2   (p16_12)
        );
l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 p16_slice_21  (
        .dout   (p16_21),
        .din0   (p16_13),
        .din1   (din[23]),
        .din2   (parity[4])
        );

l2t_ecc30b_dp_xor_macro__dxor_8x__ports_2__width_1 p16_slice  (
        .dout   (p16),
        .din0   (p16_21),
        .din1   (p16_20)
        );




//assign  error_bit[0]  = !p16 & !p8 & !p4 &  p2 &  p1 ; // 3
//assign  error_bit[1]  = !p16 & !p8 &  p4 & !p2 &  p1 ; // 5
//assign  error_bit[2]  = !p16 & !p8 &  p4 &  p2 & !p1 ; // 6
//assign  error_bit[3]  = !p16 & !p8 &  p4 &  p2 &  p1 ; // 7
//assign  error_bit[4]  = !p16 &  p8 & !p4 & !p2 &  p1 ; // 9
//assign  error_bit[5]  = !p16 &  p8 & !p4 &  p2 & !p1 ; // 10
//assign  error_bit[6]  = !p16 &  p8 & !p4 &  p2 &  p1 ; // 11
//assign  error_bit[7]  = !p16 &  p8 &  p4 & !p2 & !p1 ; // 12
//assign  error_bit[8]  = !p16 &  p8 &  p4 & !p2 &  p1 ; // 13
//assign  error_bit[9]  = !p16 &  p8 &  p4 &  p2 & !p1 ; // 14
//assign  error_bit[10] = !p16 &  p8 &  p4 &  p2 &  p1 ; // 15
//assign  error_bit[11] =  p16 & !p8 & !p4 & !p2 &  p1 ; // 17
//assign  error_bit[12] =  p16 & !p8 & !p4 &  p2 & !p1 ; // 18
//assign  error_bit[13] =  p16 & !p8 & !p4 &  p2 &  p1 ; // 19
//assign  error_bit[14] =  p16 & !p8 &  p4 & !p2 & !p1 ; // 20
//assign  error_bit[15] =  p16 & !p8 &  p4 & !p2 &  p1 ; // 21
//assign  error_bit[16] =  p16 & !p8 &  p4 &  p2 & !p1 ; // 22
//assign  error_bit[17] =  p16 & !p8 &  p4 &  p2 &  p1 ; // 23
//assign  error_bit[18] =  p16 &  p8 & !p4 & !p2 & !p1 ; // 24
//assign  error_bit[19] =  p16 &  p8 & !p4 & !p2 &  p1 ; // 25
//assign  error_bit[20] =  p16 &  p8 & !p4 &  p2 & !p1 ; // 26
//assign  error_bit[21] =  p16 &  p8 & !p4 &  p2 &  p1 ; // 27
//assign  error_bit[22] =  p16 &  p8 &  p4 & !p2 & !p1 ; // 28
//assign  error_bit[23] =  p16 &  p8 &  p4 & !p2 &  p1 ; // 29


l2t_ecc30b_dp_inv_macro__stack_1r__width_1  p1_inv_slice 
        (
        .din    (p1),
        .dout   (np1)
        );

l2t_ecc30b_dp_inv_macro__stack_1r__width_1  c2_inv_slice 
        (
        .din    (p2),
        .dout   (np2)
        );

l2t_ecc30b_dp_inv_macro__stack_1r__width_1  p3_inv_slice 
        (
        .din    (p4),
        .dout   (np4)
        );

l2t_ecc30b_dp_inv_macro__stack_1r__width_1  p4_inv_slice 
        (
        .din    (p8),
        .dout   (np8)
        );

l2t_ecc30b_dp_inv_macro__stack_1r__width_1  p5_inv_slice 
        (
        .din    (p16),
        .dout   (np16)
        );

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit0_slice_10a	(
.dout	(error_bit0_10a),
.din0	(np16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit0_slice_10b      (
.dout	(error_bit0_10b),
.din0	(np4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit0_slice_10c      (
.dout	(error_bit0_10c),
.din0	(p1),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit0_slice_11a      (
.dout	(error_bit0_a),
.din0	(error_bit0_10a),
.din1	(error_bit0_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit0_slice_11b      (
.dout	(error_bit[0]),
.din0	(error_bit0_10c),
.din1	(error_bit0_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit1_slice_10a	(
.dout	(error_bit1_10a),
.din0	(np16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit1_slice_10b      (
.dout	(error_bit1_10b),
.din0	(p4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit1_slice_10c      (
.dout	(error_bit1_10c),
.din0	(p1),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit1_slice_11a      (
.dout	(error_bit1_a),
.din0	(error_bit1_10a),
.din1	(error_bit1_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit1_slice_11b      (
.dout	(error_bit[1]),
.din0	(error_bit1_10c),
.din1	(error_bit1_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit2_slice_10a	(
.dout	(error_bit2_10a),
.din0	(np16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit2_slice_10b      (
.dout	(error_bit2_10b),
.din0	(p4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit2_slice_10c      (
.dout	(error_bit2_10c),
.din0	(np1),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit2_slice_11a      (
.dout	(error_bit2_a),
.din0	(error_bit2_10a),
.din1	(error_bit2_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit2_slice_11b      (
.dout	(error_bit[2]),
.din0	(error_bit2_10c),
.din1	(error_bit2_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit3_slice_10a	(
.dout	(error_bit3_10a),
.din0	(np16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit3_slice_10b      (
.dout	(error_bit3_10b),
.din0	(p4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit3_slice_11a      (
.dout	(error_bit3_a),
.din0	(error_bit3_10a),
.din1	(error_bit3_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit3_slice_11b      (
.dout	(error_bit[3]),
.din0	(p1),
.din1	(error_bit3_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit4_slice_10a	(
.dout	(error_bit4_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit4_slice_10b      (
.dout	(error_bit4_10b),
.din0	(np4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit4_slice_11a      (
.dout	(error_bit4_a),
.din0	(error_bit4_10a),
.din1	(error_bit4_10b)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit4_slice_11b      (
.dout	(error_bit[4]),
.din0	(error_bit4_a),
.din1	(p1)
);

/////////////////////////


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit5_slice_10a	(
.dout	(error_bit5_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit5_slice_10b      (
.dout	(error_bit5_10b),
.din0	(np4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit5_slice_11a      (
.dout	(error_bit5_a),
.din0	(error_bit5_10a),
.din1	(error_bit5_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit5_slice_11b      (
.dout	(error_bit[5]),
.din0	(np1),
.din1	(error_bit5_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit6_slice_10a	(
.dout	(error_bit6_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit6_slice_10b      (
.dout	(error_bit6_10b),
.din0	(np4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit6_slice_11a      (
.dout	(error_bit6_a),
.din0	(error_bit6_10a),
.din1	(error_bit6_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit6_slice_11b      (
.dout	(error_bit[6]),
.din0	(p1),
.din1	(error_bit6_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit7_slice_10a	(
.dout	(error_bit7_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit7_slice_10b      (
.dout	(error_bit7_10b),
.din0	(p4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit7_slice_11a      (
.dout	(error_bit7_a),
.din0	(error_bit7_10a),
.din1	(error_bit7_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit7_slice_11b      (
.dout	(error_bit[7]),
.din0	(np1),
.din1	(error_bit7_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit8_slice_10a	(
.dout	(error_bit8_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit8_slice_10b      (
.dout	(error_bit8_10b),
.din0	(p4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit8_slice_11a      (
.dout	(error_bit8_a),
.din0	(error_bit8_10a),
.din1	(error_bit8_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit8_slice_11b      (
.dout	(error_bit[8]),
.din0	(p1),
.din1	(error_bit8_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit9_slice_10a	(
.dout	(error_bit9_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit9_slice_10b      (
.dout	(error_bit9_10b),
.din0	(p4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit9_slice_11a      (
.dout	(error_bit9_a),
.din0	(error_bit9_10a),
.din1	(error_bit9_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit9_slice_11b      (
.dout	(error_bit[9]),
.din0	(np1),
.din1	(error_bit9_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit10_slice_10a	(
.dout	(error_bit10_10a),
.din0	(np16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit10_slice_10b      (
.dout	(error_bit10_10b),
.din0	(p4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit10_slice_11a      (
.dout	(error_bit10_a),
.din0	(error_bit10_10a),
.din1	(error_bit10_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit10_slice_11b      (
.dout	(error_bit[10]),
.din0	(p1),
.din1	(error_bit10_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit11_slice_10a	(
.dout	(error_bit11_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit11_slice_10b      (
.dout	(error_bit11_10b),
.din0	(np4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit11_slice_11a      (
.dout	(error_bit11_a),
.din0	(error_bit11_10a),
.din1	(error_bit11_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit11_slice_11b      (
.dout	(error_bit[11]),
.din0	(p1),
.din1	(error_bit11_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit12_slice_10a	(
.dout	(error_bit12_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit12_slice_10b      (
.dout	(error_bit12_10b),
.din0	(np4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit12_slice_11a      (
.dout	(error_bit12_a),
.din0	(error_bit12_10a),
.din1	(error_bit12_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit12_slice_11b      (
.dout	(error_bit[12]),
.din0	(np1),
.din1	(error_bit12_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit13_slice_10a	(
.dout	(error_bit13_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit13_slice_10b      (
.dout	(error_bit13_10b),
.din0	(np4),
.din1	(p2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit13_slice_11a      (
.dout	(error_bit13_a),
.din0	(error_bit13_10a),
.din1	(error_bit13_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit13_slice_11b      (
.dout	(error_bit[13]),
.din0	(p1),
.din1	(error_bit13_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit14_slice_10a	(
.dout	(error_bit14_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit14_slice_10b      (
.dout	(error_bit14_10b),
.din0	(p4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit14_slice_11a      (
.dout	(error_bit14_a),
.din0	(error_bit14_10a),
.din1	(error_bit14_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit14_slice_11b      (
.dout	(error_bit[14]),
.din0	(np1),
.din1	(error_bit14_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit15_slice_10a	(
.dout	(error_bit15_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit15_slice_10b      (
.dout	(error_bit15_10b),
.din0	(p4),
.din1	(np2)
);

l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit15_slice_11a      (
.dout	(error_bit15_a),
.din0	(error_bit15_10a),
.din1	(error_bit15_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit15_slice_11b      (
.dout	(error_bit[15]),
.din0	(p1),
.din1	(error_bit15_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit16_slice_10a	(
.dout	(error_bit16_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit16_slice_10b      (
.dout	(error_bit16_10b),
.din0	(p4),
.din1	(p2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit16_slice_11a      (
.dout	(error_bit16_a),
.din0	(error_bit16_10a),
.din1	(error_bit16_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit16_slice_11b      (
.dout	(error_bit[16]),
.din0	(np1),
.din1	(error_bit16_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit17_slice_10a	(
.dout	(error_bit17_10a),
.din0	(p16),
.din1	(np8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit17_slice_10b      (
.dout	(error_bit17_10b),
.din0	(p4),
.din1	(p2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit17_slice_11a      (
.dout	(error_bit17_a),
.din0	(error_bit17_10a),
.din1	(error_bit17_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit17_slice_11b      (
.dout	(error_bit[17]),
.din0	(p1),
.din1	(error_bit17_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit18_slice_10a	(
.dout	(error_bit18_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit18_slice_10b      (
.dout	(error_bit18_10b),
.din0	(np4),
.din1	(np2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit18_slice_11a      (
.dout	(error_bit18_a),
.din0	(error_bit18_10a),
.din1	(error_bit18_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit18_slice_11b      (
.dout	(error_bit[18]),
.din0	(np1),
.din1	(error_bit18_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit19_slice_10a	(
.dout	(error_bit19_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit19_slice_10b      (
.dout	(error_bit19_10b),
.din0	(np4),
.din1	(np2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit19_slice_11a      (
.dout	(error_bit19_a),
.din0	(error_bit19_10a),
.din1	(error_bit19_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit19_slice_11b      (
.dout	(error_bit[19]),
.din0	(p1),
.din1	(error_bit19_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit20_slice_10a	(
.dout	(error_bit20_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit20_slice_10b      (
.dout	(error_bit20_10b),
.din0	(np4),
.din1	(p2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit20_slice_11a      (
.dout	(error_bit20_a),
.din0	(error_bit20_10a),
.din1	(error_bit20_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit20_slice_11b      (
.dout	(error_bit[20]),
.din0	(np1),
.din1	(error_bit20_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit21_slice_10a	(
.dout	(error_bit21_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit21_slice_10b      (
.dout	(error_bit21_10b),
.din0	(np4),
.din1	(p2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit21_slice_11a      (
.dout	(error_bit21_a),
.din0	(error_bit21_10a),
.din1	(error_bit21_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit21_slice_11b      (
.dout	(error_bit[21]),
.din0	(p1),
.din1	(error_bit21_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit22_slice_10a	(
.dout	(error_bit22_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit22_slice_10b      (
.dout	(error_bit22_10b),
.din0	(p4),
.din1	(np2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit22_slice_11a      (
.dout	(error_bit22_a),
.din0	(error_bit22_10a),
.din1	(error_bit22_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit22_slice_11b      (
.dout	(error_bit[22]),
.din0	(np1),
.din1	(error_bit22_a)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit23_slice_10a	(
.dout	(error_bit23_10a),
.din0	(p16),
.din1	(p8)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit23_slice_10b      (
.dout	(error_bit23_10b),
.din0	(p4),
.din1	(np2)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit23_slice_11a      (
.dout	(error_bit23_a),
.din0	(error_bit23_10a),
.din1	(error_bit23_10b)
);


l2t_ecc30b_dp_and_macro__ports_2__width_1  error_bit23_slice_11b      (
.dout	(error_bit[23]),
.din0	(p1),
.din1	(error_bit23_a)
);



//assign  dout          = din ^ error_bit ;

l2t_ecc30b_dp_xor_macro__stack_24r__width_24       dout_slice      
        (
        .dout   (dout[23:0]),
        .din0   (din[23:0]),
        .din1   (error_bit[23:0])
        );

//assign  corrected_bit = {p16, p8, p4, p2, p1} ;

l2t_ecc30b_dp_buff_macro__stack_5r__width_5	buff_corrected_bit	 
	(
	.dout	(corrected_bit[4:0]),
	.din	({p16, p8, p4, p2, p1})
	);

endmodule


//
//   xor macro for ports = 2,3
//
//





module l2t_ecc30b_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module l2t_ecc30b_dp_xor_macro__dxor_8x__ports_2__width_1 (
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
//   invert macro
//
//





module l2t_ecc30b_dp_inv_macro__stack_1r__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module l2t_ecc30b_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_ecc30b_dp_xor_macro__stack_24r__width_24 (
  din0, 
  din1, 
  dout);
  input [23:0] din0;
  input [23:0] din1;
  output [23:0] dout;





xor2 #(24)  d0_0 (
.in0(din0[23:0]),
.in1(din1[23:0]),
.out(dout[23:0])
);








endmodule





//
//   buff macro
//
//





module l2t_ecc30b_dp_buff_macro__stack_5r__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule




