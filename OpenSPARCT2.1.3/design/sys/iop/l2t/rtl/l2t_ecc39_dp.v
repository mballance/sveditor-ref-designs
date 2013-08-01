// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_ecc39_dp.v
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
module l2t_ecc39_dp (
  dout, 
  cflag, 
  pflag, 
  din, 
  parity);
wire c0_10;
wire c0_11;
wire c0_12;
wire c0_13;
wire c0_14;
wire c0_15;
wire c0_20;
wire c0_21;
wire c0_1;
wire c0_2;
wire c0_3;
wire c1_10;
wire c1_11;
wire c1_12;
wire c1_13;
wire c1_14;
wire c1_15;
wire c1_20;
wire c1_21;
wire c1_1;
wire c1_2;
wire c2_10;
wire c2_11;
wire c2_12;
wire c2_13;
wire c2_14;
wire c2_15;
wire c2_20;
wire c2_21;
wire c2_1;
wire c2_2;
wire c3_10;
wire c3_11;
wire c3_12;
wire c3_13;
wire c3_14;
wire c3_20;
wire c3_21;
wire c3_1;
wire c3_2;
wire c4_10;
wire c4_11;
wire c4_12;
wire c4_13;
wire c4_14;
wire c4_20;
wire c4_21;
wire c4_1;
wire c4_2;
wire c5_10;
wire c5_11;
wire pflag_10;
wire pflag_11;
wire pflag_12;
wire pflag_13;
wire pflag_14;
wire pflag_15;
wire pflag_20;
wire pflag_21;
wire pflag_30;
wire nc0_1;
wire nc0_2;
wire nc1_1;
wire nc1_2;
wire nc2_1;
wire nc2_2;
wire nc3_1;
wire nc3_2;
wire nc4_1;
wire nc4_2;
wire nc5_1;
wire nc5_2;
wire err_bit0_pos_10a;
wire err_bit0_pos_10b;
wire err_bit1_pos_10a;
wire err_bit1_pos_10b;
wire err_bit2_pos_10a;
wire err_bit2_pos_10b;
wire err_bit3_pos_10a;
wire err_bit3_pos_10b;
wire err_bit4_pos_10a;
wire err_bit4_pos_10b;
wire err_bit5_pos_10a;
wire err_bit5_pos_10b;
wire err_bit6_pos_10a;
wire err_bit6_pos_10b;
wire err_bit7_pos_10a;
wire err_bit7_pos_10b;
wire err_bit8_pos_10a;
wire err_bit8_pos_10b;
wire err_bit9_pos_10a;
wire err_bit9_pos_10b;
wire err_bit10_pos_10a;
wire err_bit10_pos_10b;
wire err_bit11_pos_10a;
wire err_bit11_pos_10b;
wire err_bit12_pos_10a;
wire err_bit12_pos_10b;
wire err_bit13_pos_10a;
wire err_bit13_pos_10b;
wire err_bit14_pos_10a;
wire err_bit14_pos_10b;
wire err_bit15_pos_10a;
wire err_bit15_pos_10b;
wire err_bit16_pos_10a;
wire err_bit16_pos_10b;
wire err_bit17_pos_10a;
wire err_bit17_pos_10b;
wire err_bit18_pos_10a;
wire err_bit18_pos_10b;
wire err_bit19_pos_10a;
wire err_bit19_pos_10b;
wire err_bit20_pos_10a;
wire err_bit20_pos_10b;
wire err_bit21_pos_10a;
wire err_bit21_pos_10b;
wire err_bit22_pos_10a;
wire err_bit22_pos_10b;
wire err_bit23_pos_10a;
wire err_bit23_pos_10b;
wire err_bit24_pos_10a;
wire err_bit24_pos_10b;
wire err_bit25_pos_10a;
wire err_bit25_pos_10b;
wire err_bit26_pos_10a;
wire err_bit26_pos_10b;
wire err_bit27_pos_10a;
wire err_bit27_pos_10b;
wire err_bit28_pos_10a;
wire err_bit28_pos_10b;
wire err_bit29_pos_10a;
wire err_bit29_pos_10b;
wire err_bit30_pos_10a;
wire err_bit30_pos_10b;
wire err_bit31_pos_10a;
wire err_bit31_pos_10b;


   //Output: 32bit corrected data
   output[31:0] dout;
   output [5:0] cflag;
   output 	pflag;
   
   //Input: 32bit data din
   input [31:0] din;
   input [6:0]	parity;

   wire 	c0,c1,c2,c3,c4,c5;
   wire [31:0] 	err_bit_pos;

   //refer to the comments in parity_gen_32b.v for the position description
//   
//   assign c0= parity[0]^(din[0]^din[1])^(din[3]^din[4])^(din[6]^din[8])
//                     ^(din[10]^din[11])^(din[13]^din[15])^(din[17]^din[19])
//		     ^(din[21]^din[23])^(din[25]^din[26])^(din[28]^din[30]);


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_10  (
  	.dout	(c0_10),
  	.din0	(din[0]),
  	.din1	(din[1]),
  	.din2	(din[3])
	);
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_11  (
        .dout   (c0_11),
        .din0   (din[4]),
        .din1   (din[6]),
        .din2   (din[8])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_12  (
        .dout   (c0_12),
        .din0   (din[10]),
        .din1   (din[11]),
        .din2   (din[13])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_13  (
        .dout   (c0_13),
        .din0   (din[15]),
        .din1   (din[17]),
        .din2   (din[19])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c0_slice_14  (
        .dout   (c0_14),
        .din0   (din[21]),
        .din1   (din[23]),
        .din2   (din[25])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_15  (
        .dout   (c0_15),
        .din0   (din[26]),
        .din1   (din[28]),
        .din2   (din[30])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c0_slice_20  (
        .dout   (c0_20),
        .din0   (c0_10),
        .din1   (c0_11),
        .din2   (c0_12)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c0_slice_21  (
        .dout   (c0_21),
        .din0   (c0_13),
        .din1   (c0_14),
        .din2   (c0_15)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c0_slice_22a  (
        .dout   (c0_1),
        .din0   (c0_20),
        .din1   (c0_21),
        .din2   (parity[0])
        );

l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c0_slice_22b  (
        .dout   (c0_2),
        .din0   (c0_20),
        .din1   (c0_21),
        .din2   (parity[0])
        );

l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c0_slice_22c  (
        .dout   (c0_3),
        .din0   (c0_20),
        .din1   (c0_21),
        .din2   (parity[0])
        );



//   assign c1= parity[1]^(din[0]^din[2])^(din[3]^din[5])^(din[6]^din[9])
//                     ^(din[10]^din[12])^(din[13]^din[16])^(din[17]^din[20])
//		     ^(din[21]^din[24])^(din[25]^din[27])^(din[28]^din[31]);

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_10  (
        .dout   (c1_10),
        .din0   (din[0]),
        .din1   (din[2]),
        .din2   (din[3])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_11  (
        .dout   (c1_11),
        .din0   (din[5]),
        .din1   (din[6]),
        .din2   (din[9])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_12  (
        .dout   (c1_12),
        .din0   (din[10]),
        .din1   (din[12]),
        .din2   (din[13])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_13  (
        .dout   (c1_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[20])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_14  (
        .dout   (c1_14),
        .din0   (din[21]),
        .din1   (din[24]),
        .din2   (din[25])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c1_slice_15  (
        .dout   (c1_15),
        .din0   (din[27]),
        .din1   (din[28]),
        .din2   (din[31])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c1_slice_20  (
        .dout   (c1_20),
        .din0   (c1_10),
        .din1   (c1_11),
        .din2   (c1_12)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c1_slice_21  (
        .dout   (c1_21),
        .din0   (c1_13),
        .din1   (c1_14),
        .din2   (c1_15)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c1_slice_22a  (
        .dout   (c1_1),
        .din0   (c1_20),
        .din1   (c1_21),
        .din2   (parity[1])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c1_slice_22b  (
        .dout   (c1_2),
        .din0   (c1_20),
        .din1   (c1_21),
        .din2   (parity[1])
        );


//   assign c2= parity[2]^(din[1]^din[2])^(din[3]^din[7])^(din[8]^din[9])
//                     ^(din[10]^din[14])^(din[15]^din[16])^(din[17]^din[22])
//		     ^(din[23]^din[24])^(din[25]^din[29])^(din[30]^din[31]);


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_10  (
        .dout   (c2_10),
        .din0   (din[1]),
        .din1   (din[2]),
        .din2   (din[3])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_11  (
        .dout   (c2_11),
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_12  (
        .dout   (c2_12),
        .din0   (din[10]),
        .din1   (din[14]),
        .din2   (din[15])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_13  (
        .dout   (c2_13),
        .din0   (din[16]),
        .din1   (din[17]),
        .din2   (din[22])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_14  (
        .dout   (c2_14),
        .din0   (din[23]),
        .din1   (din[24]),
        .din2   (din[25])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c2_slice_15  (
        .dout   (c2_15),
        .din0   (din[29]),
        .din1   (din[30]),
        .din2   (din[31])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c2_slice_20  (
        .dout   (c2_20),
        .din0   (c2_10),
        .din1   (c2_11),
        .din2   (c2_12)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c2_slice_21  (
        .dout   (c2_21),
        .din0   (c2_13),
        .din1   (c2_14),
        .din2   (c2_15)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c2_slice_22a  (
        .dout   (c2_1),
        .din0   (c2_20),
        .din1   (c2_21),
	.din2	(parity[2])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c2_slice_22b  (
        .dout   (c2_2),
        .din0   (c2_20),
        .din1   (c2_21),
        .din2   (parity[2])
        );



   
//   assign c3= parity[3]^(din[4]^din[5])^(din[6]^din[7])^(din[8]^din[9])
//                     ^(din[10]^din[18])^(din[19]^din[20])^(din[21]^din[22])
//		     ^(din[23]^din[24])^din[25];


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c3_slice_10  (
        .dout   (c3_10),
        .din0   (din[4]),
        .din1   (din[5]),
        .din2   (din[6])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c3_slice_11  (
        .dout   (c3_11),
        .din0   (din[7]),
        .din1   (din[8]),
        .din2   (din[9])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c3_slice_12  (
        .dout   (c3_12),
        .din0   (din[10]),
        .din1   (din[18]),
        .din2   (din[19])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c3_slice_13  (
        .dout   (c3_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c3_slice_14  (
        .dout   (c3_14),
        .din0   (din[23]),
        .din1   (din[24]),
        .din2   (din[25])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c3_slice_20  (
        .dout   (c3_20),
        .din0   (c3_10),
        .din1   (c3_11),
        .din2   (c3_12)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c3_slice_21  (
        .dout   (c3_21),
        .din0   (c3_13),
        .din1   (c3_14),
        .din2   (parity[3])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_2__width_1 c3_slice_22a  (
        .dout   (c3_1),
        .din0   (c3_20),
        .din1   (c3_21)
        );

l2t_ecc39_dp_xor_macro__dxor_16x__ports_2__width_1 c3_slice_22b  (
        .dout   (c3_2),
        .din0   (c3_20),
        .din1   (c3_21)
        );


//   assign c4= parity[4]^(din[11]^din[12])^(din[13]^din[14])^
//                    (din[15]^din[16])^(din[17]^din[18])^(din[19]^din[20])^
//                    (din[21]^din[22])^(din[23]^din[24])^din[25];



l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c4_slice_10  (
        .dout   (c4_10),
        .din0   (din[11]),
        .din1   (din[12]),
        .din2   (din[13])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c4_slice_11  (
        .dout   (c4_11),
        .din0   (din[14]),
        .din1   (din[15]),
        .din2   (din[16])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c4_slice_12  (
        .dout   (c4_12),
        .din0   (din[17]),
        .din1   (din[18]),
        .din2   (din[19])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c4_slice_13  (
        .dout   (c4_13),
        .din0   (din[20]),
        .din1   (din[21]),
        .din2   (din[22])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c4_slice_14  (
        .dout   (c4_14),
        .din0   (din[23]),
        .din1   (din[24]),
        .din2   (din[25])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c4_slice_20  (
        .dout   (c4_20),
        .din0   (c4_10),
        .din1   (c4_11),
        .din2   (c4_12)
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c4_slice_21  (
        .dout   (c4_21),
        .din0   (c4_13),
        .din1   (c4_14),
        .din2   (parity[4])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_2__width_1 c4_slice_22a  (
        .dout   (c4_1),
        .din0   (c4_20),
        .din1   (c4_21)
        );

l2t_ecc39_dp_xor_macro__dxor_16x__ports_2__width_1 c4_slice_22b  (
        .dout   (c4_2),
        .din0   (c4_20),
        .din1   (c4_21)
        );



//   assign c5= parity[5]^(din[26]^din[27])^(din[28]^din[29])^
//		    (din[30]^din[31]);



l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c5_slice_10  (
        .dout   (c5_10),
        .din0   (din[26]),
        .din1   (din[27]),
        .din2   (din[28])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 c5_slice_11  (
        .dout   (c5_11),
        .din0   (din[29]),
        .din1   (din[30]),
        .din2   (din[31])
        );
l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 c5_slice_20  (
        .dout   (c5),
        .din0   (c5_10),
        .din1   (c5_11),
        .din2   (parity[5])
        );


//   //generate total parity flag
//   assign pflag= c0 ^
//		(( (((parity[1]^parity[2])^(parity[3]^parity[4])) ^
//		 ((parity[5]^parity[6])^(din[2]^din[5]))) ^		 
//		 (((din[7]^din[9])^(din[12]^din[14])) ^
//		 ((din[16]^din[18])^(din[20]^din[22]))) ) ^
//		 ((din[24]^din[27])^(din[29]^din[31])) );

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_10  (
        .dout   (pflag_10),
        .din0   (parity[1]),
        .din1   (parity[2]),
        .din2   (parity[3])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_11  (
        .dout   (pflag_11),
        .din0   (parity[4]),
        .din1   (parity[5]),
        .din2   (parity[6])
        );
l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_12  (
        .dout   (pflag_12),
        .din0   (din[2]),
        .din1   (din[5]),
        .din2   (din[7])
        );

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_13  (
        .dout   (pflag_13),
        .din0   (din[9]),
        .din1   (din[12]),
        .din2   (din[14])
        );

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_14  (
        .dout   (pflag_14),
        .din0   (din[16]),
        .din1   (din[18]),
        .din2   (din[20])
        );

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_15  (
        .dout   (pflag_15),
        .din0   (din[22]),
        .din1   (din[24]),
        .din2   (din[27])
        );

l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_20  (
        .dout   (pflag_20),
        .din0   (din[29]),
        .din1   (din[31]),
        .din2   (pflag_10)
        );


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_21  (
        .dout   (pflag_21),
        .din0   (pflag_11),
        .din1   (pflag_12),
        .din2   (pflag_13)
        );


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_30  (
        .dout   (pflag_30),
        .din0   (pflag_14),
        .din1   (pflag_15),
        .din2   (pflag_20)
        );


l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 pflag_slice_31  (
        .dout   (pflag),
        .din0   (pflag_30),
        .din1   (pflag_21),
        .din2   (c0_1)
        );


assign cflag= {c5,c4_1,c3_1,c2_1,c1_1,c0_1};

   
   //6 to 32 decoder

l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c0_inv_slice_1	
	(
	.din	(c0_1),
	.dout	(nc0_1)
	);

l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c0_inv_slice_2 
        (
        .din    (c0_3),
        .dout   (nc0_2)
        );

l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c1_inv_slice_1	
	(
	.din	(c1_1),
	.dout	(nc1_1)
	);


l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c1_inv_slice_2 
        (
        .din    (c1_2),
        .dout   (nc1_2)
        );



l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c2_inv_slice_1	
	(
	.din	(c2_1),
	.dout	(nc2_1)
	);


l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c2_inv_slice_2 
        (
        .din    (c2_2),
        .dout   (nc2_2)
        );

l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c3_inv_slice_1	
	(
	.din	(c3_1),
	.dout	(nc3_1)
	);
l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c3_inv_slice_2 
        (
        .din    (c3_1),
        .dout   (nc3_2)
        );



l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c4_inv_slice_1	
	(
	.din	(c4_1),
	.dout	(nc4_1)
	);

l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c4_inv_slice_2 
        (
        .din    (c4_2),
        .dout   (nc4_2)
        );



l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c5_inv_slice_1	
	(
	.din	(c5),
	.dout	(nc5_1)
	);


l2t_ecc39_dp_inv_macro__dinv_32x__width_1  c5_inv_slice_2 
        (
        .din    (c5),
        .dout   (nc5_2)
        );


// bit 0

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit0_pos_slice_10a	(
.dout	(err_bit0_pos_10a),
.din0	(c0_2),
.din1	(c1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit0_pos_slice_10b      (
.dout	(err_bit0_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit0_pos_slice_10c      (
.dout	(err_bit_pos[0]),
.din0	(err_bit0_pos_10a),
.din1	(err_bit0_pos_10b)
);

// bit 1

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit1_pos_slice_10a	(
.dout	(err_bit1_pos_10a),
.din0	(c0_2),
.din1	(nc1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit1_pos_slice_10b      (
.dout	(err_bit1_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit1_pos_slice_10c      (
.dout	(err_bit_pos[1]),
.din0	(err_bit1_pos_10a),
.din1	(err_bit1_pos_10b)
);

// bit 2

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit2_pos_slice_10a	(
.dout	(err_bit2_pos_10a),
.din0	(nc0_1),
.din1	(c1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit2_pos_slice_10b      (
.dout	(err_bit2_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit2_pos_slice_10c      (
.dout	(err_bit_pos[2]),
.din0	(err_bit2_pos_10a),
.din1	(err_bit2_pos_10b)
);


// bit 3

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit3_pos_slice_10a	(
.dout	(err_bit3_pos_10a),
.din0	(c0_2),
.din1	(c1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit3_pos_slice_10b      (
.dout	(err_bit3_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit3_pos_slice_10c      (
.dout	(err_bit_pos[3]),
.din0	(err_bit3_pos_10a),
.din1	(err_bit3_pos_10b)
);


// bit 4

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit4_pos_slice_10a	(
.dout	(err_bit4_pos_10a),
.din0	(c0_2),
.din1	(nc1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit4_pos_slice_10b      (
.dout	(err_bit4_pos_10b),
.din0	(c3_1),
.din1	(nc4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit4_pos_slice_10c      (
.dout	(err_bit_pos[4]),
.din0	(err_bit4_pos_10a),
.din1	(err_bit4_pos_10b)
);

// bit 5

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit5_pos_slice_10a	(
.dout	(err_bit5_pos_10a),
.din0	(nc0_1),
.din1	(c1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit5_pos_slice_10b      (
.dout	(err_bit5_pos_10b),
.din0	(c3_1),
.din1	(nc4_2),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit5_pos_slice_10c      (
.dout	(err_bit_pos[5]),
.din0	(err_bit5_pos_10a),
.din1	(err_bit5_pos_10b)
);

// bit 6

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit6_pos_slice_10a	(
.dout	(err_bit6_pos_10a),
.din0	(c0_1),
.din1	(c1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit6_pos_slice_10b      (
.dout	(err_bit6_pos_10b),
.din0	(c3_1),
.din1	(nc4_2),
.din2   (nc5_1) 
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit6_pos_slice_10c      (
.dout	(err_bit_pos[6]),
.din0	(err_bit6_pos_10a),
.din1	(err_bit6_pos_10b)
);

// bit 7

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit7_pos_slice_10a	(
.dout	(err_bit7_pos_10a),
.din0	(nc0_1),
.din1	(nc1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit7_pos_slice_10b      (
.dout	(err_bit7_pos_10b),
.din0	(c3_1),
.din1	(nc4_2),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit7_pos_slice_10c      (
.dout	(err_bit_pos[7]),
.din0	(err_bit7_pos_10a),
.din1	(err_bit7_pos_10b)
);

// bit 8

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit8_pos_slice_10a	(
.dout	(err_bit8_pos_10a),
.din0	(c0_2),
.din1	(nc1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit8_pos_slice_10b      (
.dout	(err_bit8_pos_10b),
.din0	(c3_1),
.din1	(nc4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit8_pos_slice_10c      (
.dout	(err_bit_pos[8]),
.din0	(err_bit8_pos_10a),
.din1	(err_bit8_pos_10b)
);

// bit 9

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit9_pos_slice_10a	(
.dout	(err_bit9_pos_10a),
.din0	(nc0_1),
.din1	(c1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit9_pos_slice_10b      (
.dout	(err_bit9_pos_10b),
.din0	(c3_1),
.din1	(nc4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit9_pos_slice_10c      (
.dout	(err_bit_pos[9]),
.din0	(err_bit9_pos_10a),
.din1	(err_bit9_pos_10b)
);

// bit 10

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit10_pos_slice_10a	(
.dout	(err_bit10_pos_10a),
.din0	(c0_1),
.din1	(c1_1),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit10_pos_slice_10b      (
.dout	(err_bit10_pos_10b),
.din0	(c3_1),
.din1	(nc4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit10_pos_slice_10c      (
.dout	(err_bit_pos[10]),
.din0	(err_bit10_pos_10a),
.din1	(err_bit10_pos_10b)
);

// bit 11

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit11_pos_slice_10a	(
.dout	(err_bit11_pos_10a),
.din0	(c0_2),
.din1	(nc1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit11_pos_slice_10b      (
.dout	(err_bit11_pos_10b),
.din0	(nc3_1),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit11_pos_slice_10c      (
.dout	(err_bit_pos[11]),
.din0	(err_bit11_pos_10a),
.din1	(err_bit11_pos_10b)
);

// bit 12

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit12_pos_slice_10a	(
.dout	(err_bit12_pos_10a),
.din0	(nc0_1),
.din1	(c1_1),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit12_pos_slice_10b      (
.dout	(err_bit12_pos_10b),
.din0	(nc3_2),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit12_pos_slice_10c      (
.dout	(err_bit_pos[12]),
.din0	(err_bit12_pos_10a),
.din1	(err_bit12_pos_10b)
);

// bit 13

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit13_pos_slice_10a	(
.dout	(err_bit13_pos_10a),
.din0	(c0_2),
.din1	(c1_1),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit13_pos_slice_10b      (
.dout	(err_bit13_pos_10b),
.din0	(nc3_2),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit13_pos_slice_10c      (
.dout	(err_bit_pos[13]),
.din0	(err_bit13_pos_10a),
.din1	(err_bit13_pos_10b)
);

// bit 14

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit14_pos_slice_10a	(
.dout	(err_bit14_pos_10a),
.din0	(nc0_1),
.din1	(nc1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit14_pos_slice_10b      (
.dout	(err_bit14_pos_10b),
.din0	(nc3_2),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit14_pos_slice_10c      (
.dout	(err_bit_pos[14]),
.din0	(err_bit14_pos_10a),
.din1	(err_bit14_pos_10b)
);

// bit 15 

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit15_pos_slice_10a	(
.dout	(err_bit15_pos_10a),
.din0	(c0_2),
.din1	(nc1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit15_pos_slice_10b      (
.dout	(err_bit15_pos_10b),
.din0	(nc3_2),
.din1	(c4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit15_pos_slice_10c      (
.dout	(err_bit_pos[15]),
.din0	(err_bit15_pos_10a),
.din1	(err_bit15_pos_10b)
);

// bit 16

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit16_pos_slice_10a	(
.dout	(err_bit16_pos_10a),
.din0	(nc0_2),
.din1	(c1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit16_pos_slice_10b      (
.dout	(err_bit16_pos_10b),
.din0	(nc3_2),
.din1	(c4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit16_pos_slice_10c      (
.dout	(err_bit_pos[16]),
.din0	(err_bit16_pos_10a),
.din1	(err_bit16_pos_10b)
);

// bit 17

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit17_pos_slice_10a	(
.dout	(err_bit17_pos_10a),
.din0	(c0_3),
.din1	(c1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit17_pos_slice_10b      (
.dout	(err_bit17_pos_10b),
.din0	(nc3_2),
.din1	(c4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit17_pos_slice_10c      (
.dout	(err_bit_pos[17]),
.din0	(err_bit17_pos_10a),
.din1	(err_bit17_pos_10b)
);

// bit 18 

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit18_pos_slice_10a	(
.dout	(err_bit18_pos_10a),
.din0	(nc0_2),
.din1	(nc1_2),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit18_pos_slice_10b      (
.dout	(err_bit18_pos_10b),
.din0	(c3_2),
.din1	(c4_2),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit18_pos_slice_10c      (
.dout	(err_bit_pos[18]),
.din0	(err_bit18_pos_10a),
.din1	(err_bit18_pos_10b)
);

// bit 19

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit19_pos_slice_10a	(
.dout	(err_bit19_pos_10a),
.din0	(c0_3),
.din1	(nc1_2),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit19_pos_slice_10b      (
.dout	(err_bit19_pos_10b),
.din0	(c3_2),
.din1	(c4_1),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit19_pos_slice_10c      (
.dout	(err_bit_pos[19]),
.din0	(err_bit19_pos_10a),
.din1	(err_bit19_pos_10b)
);

// bit 20

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit20_pos_slice_10a	(
.dout	(err_bit20_pos_10a),
.din0	(nc0_2),
.din1	(c1_2),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit20_pos_slice_10b      (
.dout	(err_bit20_pos_10b),
.din0	(c3_2),
.din1	(c4_2),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit20_pos_slice_10c      (
.dout	(err_bit_pos[20]),
.din0	(err_bit20_pos_10a),
.din1	(err_bit20_pos_10b)
);

// bit 21

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit21_pos_slice_10a	(
.dout	(err_bit21_pos_10a),
.din0	(c0_3),
.din1	(c1_2),
.din2   (nc2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit21_pos_slice_10b      (
.dout	(err_bit21_pos_10b),
.din0	(c3_2),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit21_pos_slice_10c      (
.dout	(err_bit_pos[21]),
.din0	(err_bit21_pos_10a),
.din1	(err_bit21_pos_10b)
);

// bit 22

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit22_pos_slice_10a	(
.dout	(err_bit22_pos_10a),
.din0	(nc0_2),
.din1	(nc1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit22_pos_slice_10b      (
.dout	(err_bit22_pos_10b),
.din0	(c3_2),
.din1	(c4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit22_pos_slice_10c      (
.dout	(err_bit_pos[22]),
.din0	(err_bit22_pos_10a),
.din1	(err_bit22_pos_10b)
);

// bit 23

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit23_pos_slice_10a	(
.dout	(err_bit23_pos_10a),
.din0	(c0_3),
.din1	(nc1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit23_pos_slice_10b      (
.dout	(err_bit23_pos_10b),
.din0	(c3_2),
.din1	(c4_1),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit23_pos_slice_10c      (
.dout	(err_bit_pos[23]),
.din0	(err_bit23_pos_10a),
.din1	(err_bit23_pos_10b)
);

// bit 24 

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit24_pos_slice_10a	(
.dout	(err_bit24_pos_10a),
.din0	(nc0_2),
.din1	(c1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit24_pos_slice_10b      (
.dout	(err_bit24_pos_10b),
.din0	(c3_2),
.din1	(c4_2),
.din2   (nc5_2)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit24_pos_slice_10c      (
.dout	(err_bit_pos[24]),
.din0	(err_bit24_pos_10a),
.din1	(err_bit24_pos_10b)
);

// bit 25 

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit25_pos_slice_10a	(
.dout	(err_bit25_pos_10a),
.din0	(c0_3),
.din1	(c1_2),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit25_pos_slice_10b      (
.dout	(err_bit25_pos_10b),
.din0	(c3_2),
.din1	(c4_2),
.din2   (nc5_1)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit25_pos_slice_10c      (
.dout	(err_bit_pos[25]),
.din0	(err_bit25_pos_10a),
.din1	(err_bit25_pos_10b)
);

// bit 26

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit26_pos_slice_10a	(
.dout	(err_bit26_pos_10a),
.din0	(c0_3),
.din1	(nc1_1),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit26_pos_slice_10b      (
.dout	(err_bit26_pos_10b),
.din0	(nc3_2),
.din1	(nc4_1),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit26_pos_slice_10c      (
.dout	(err_bit_pos[26]),
.din0	(err_bit26_pos_10a),
.din1	(err_bit26_pos_10b)
);

// bit 27

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit27_pos_slice_10a	(
.dout	(err_bit27_pos_10a),
.din0	(nc0_2),
.din1	(c1_2),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit27_pos_slice_10b      (
.dout	(err_bit27_pos_10b),
.din0	(nc3_2),
.din1	(nc4_1),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit27_pos_slice_10c      (
.dout	(err_bit_pos[27]),
.din0	(err_bit27_pos_10a),
.din1	(err_bit27_pos_10b)
);

// bit 28

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit28_pos_slice_10a	(
.dout	(err_bit28_pos_10a),
.din0	(c0_3),
.din1	(c1_2),
.din2   (nc2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit28_pos_slice_10b      (
.dout	(err_bit28_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit28_pos_slice_10c      (
.dout	(err_bit_pos[28]),
.din0	(err_bit28_pos_10a),
.din1	(err_bit28_pos_10b)
);

// bit 29

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit29_pos_slice_10a	(
.dout	(err_bit29_pos_10a),
.din0	(nc0_2),
.din1	(nc1_1),
.din2   (c2_2)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit29_pos_slice_10b      (
.dout	(err_bit29_pos_10b),
.din0	(nc3_1),
.din1	(nc4_1),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit29_pos_slice_10c      (
.dout	(err_bit_pos[29]),
.din0	(err_bit29_pos_10a),
.din1	(err_bit29_pos_10b)
);

// bit 30

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit30_pos_slice_10a	(
.dout	(err_bit30_pos_10a),
.din0	(c0_3),
.din1	(nc1_1),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit30_pos_slice_10b      (
.dout	(err_bit30_pos_10b),
.din0	(nc3_1),
.din1	(nc4_2),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit30_pos_slice_10c      (
.dout	(err_bit_pos[30]),
.din0	(err_bit30_pos_10a),
.din1	(err_bit30_pos_10b)
);

// bit 31

l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit31_pos_slice_10a	(
.dout	(err_bit31_pos_10a),
.din0	(nc0_2),
.din1	(c1_2),
.din2   (c2_1)
);


l2t_ecc39_dp_nand_macro__ports_3__width_1  err_bit31_pos_slice_10b      (
.dout	(err_bit31_pos_10b),
.din0	(nc3_1),
.din1	(nc4_2),
.din2   (c5)
);

l2t_ecc39_dp_nor_macro__ports_2__width_1  err_bit31_pos_slice_10c      (
.dout	(err_bit_pos[31]),
.din0	(err_bit31_pos_10a),
.din1	(err_bit31_pos_10b)
);


//	correct the error bit, it can only correct one error bit.
//   	assign dout = din ^ err_bit_pos;

l2t_ecc39_dp_xor_macro__width_32	dout_slice	
	(
	.dout	(dout[31:0]),
	.din0	(din[31:0]),
	.din1	(err_bit_pos[31:0])
	);


endmodule 


//
//   xor macro for ports = 2,3
//
//





module l2t_ecc39_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module l2t_ecc39_dp_xor_macro__dxor_16x__ports_3__width_1 (
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





module l2t_ecc39_dp_xor_macro__dxor_16x__ports_2__width_1 (
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





module l2t_ecc39_dp_inv_macro__dinv_32x__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module l2t_ecc39_dp_nand_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nand3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module l2t_ecc39_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   xor macro for ports = 2,3
//
//





module l2t_ecc39_dp_xor_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output [31:0] dout;





xor2 #(32)  d0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout[31:0])
);








endmodule




