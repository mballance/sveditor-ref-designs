// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_eccgen_dp.v
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
module mcu_eccgen_dp (
  din, 
  adr_parity, 
  ecc0_in, 
  ecc1_in, 
  ecc2_in, 
  ecc3_in, 
  ecc);
wire [127:0] d;
wire aparity_0;
wire aparity_1;
wire sd0_0_0_0;
wire sd0_0_0_1;
wire sd0_0_0_2;
wire sd0_0_0_3;
wire sd0_0_0_4;
wire sd0_0_0_5;
wire sd0_0_0_6;
wire sd0_0_0_7;
wire sd0_0_0_8;
wire sd0_0_0_9;
wire sd0_0_0_10;
wire sd0_0_0_11;
wire sd0_0_0_12;
wire sd0_0_0_13;
wire sd0_0_0_14;
wire sd0_0_0_15;
wire sd0_0_0_16;
wire sd0_0_0_17;
wire sd0_0_0_18;
wire sd0_0_0_19;
wire sd0_0_0_20;
wire sd0_0_0_21;
wire sd0_0_1_0;
wire sd0_0_1_1;
wire sd0_0_1_2;
wire sd0_0_1_3;
wire sd0_0_1_4;
wire sd0_0_1_5;
wire sd0_0_1_6;
wire sd0_0_2_0;
wire sd0_0_2_1;
wire sd0_0_2_2;
wire sd0_1_0_0;
wire sd0_1_0_1;
wire sd0_1_0_2;
wire sd0_1_0_3;
wire sd0_1_0_4;
wire sd0_1_0_5;
wire sd0_1_0_6;
wire sd0_1_0_7;
wire sd0_1_0_8;
wire sd0_1_0_9;
wire sd0_1_0_10;
wire sd0_1_0_11;
wire sd0_1_0_12;
wire sd0_1_0_13;
wire sd0_1_0_14;
wire sd0_1_0_15;
wire sd0_1_0_16;
wire sd0_1_0_17;
wire sd0_1_0_18;
wire sd0_1_0_19;
wire sd0_1_0_20;
wire sd0_1_0_21;
wire sd0_1_1_0;
wire sd0_1_1_1;
wire sd0_1_1_2;
wire sd0_1_1_3;
wire sd0_1_1_4;
wire sd0_1_1_5;
wire sd0_1_1_6;
wire sd0_1_2_0;
wire sd0_1_2_1;
wire sd0_1_2_2;
wire sd0_2_0_0;
wire sd0_2_0_1;
wire sd0_2_0_2;
wire sd0_2_0_3;
wire sd0_2_0_4;
wire sd0_2_0_5;
wire sd0_2_0_6;
wire sd0_2_0_7;
wire sd0_2_0_8;
wire sd0_2_0_9;
wire sd0_2_0_10;
wire sd0_2_0_11;
wire sd0_2_0_12;
wire sd0_2_0_13;
wire sd0_2_0_14;
wire sd0_2_0_15;
wire sd0_2_0_16;
wire sd0_2_0_17;
wire sd0_2_0_18;
wire sd0_2_0_19;
wire sd0_2_0_20;
wire sd0_2_0_21;
wire sd0_2_1_0;
wire sd0_2_1_1;
wire sd0_2_1_2;
wire sd0_2_1_3;
wire sd0_2_1_4;
wire sd0_2_1_5;
wire sd0_2_1_6;
wire sd0_2_2_0;
wire sd0_2_2_1;
wire sd0_2_2_2;
wire sd0_3_0_0;
wire sd0_3_0_1;
wire sd0_3_0_2;
wire sd0_3_0_3;
wire sd0_3_0_4;
wire sd0_3_0_5;
wire sd0_3_0_6;
wire sd0_3_0_7;
wire sd0_3_0_8;
wire sd0_3_0_9;
wire sd0_3_0_10;
wire sd0_3_0_11;
wire sd0_3_0_12;
wire sd0_3_0_13;
wire sd0_3_0_14;
wire sd0_3_0_15;
wire sd0_3_0_16;
wire sd0_3_0_17;
wire sd0_3_0_18;
wire sd0_3_0_19;
wire sd0_3_0_20;
wire sd0_3_0_21;
wire sd0_3_1_0;
wire sd0_3_1_1;
wire sd0_3_1_2;
wire sd0_3_1_3;
wire sd0_3_1_4;
wire sd0_3_1_5;
wire sd0_3_1_6;
wire sd0_3_2_0;
wire sd0_3_2_1;
wire sd0_3_2_2;
wire sd1_0_0_0;
wire sd1_0_0_1;
wire sd1_0_0_2;
wire sd1_0_0_3;
wire sd1_0_0_4;
wire sd1_0_0_5;
wire sd1_0_1_0;
wire sd1_0_1_1;
wire sd1_1_0_0;
wire sd1_1_0_1;
wire sd1_1_0_2;
wire sd1_1_0_3;
wire sd1_1_0_4;
wire sd1_1_0_5;
wire sd1_1_1_0;
wire sd1_1_1_1;
wire sd1_2_0_0;
wire sd1_2_0_1;
wire sd1_2_0_2;
wire sd1_2_0_3;
wire sd1_2_0_4;
wire sd1_2_0_5;
wire sd1_2_1_0;
wire sd1_2_1_1;
wire sd1_3_0_0;
wire sd1_3_0_1;
wire sd1_3_0_2;
wire sd1_3_0_3;
wire sd1_3_0_4;
wire sd1_3_0_5;
wire sd1_3_1_0;
wire sd1_3_1_1;
wire sd2_0_0_0;
wire sd2_0_0_1;
wire sd2_0_0_2;
wire sd2_0_0_3;
wire sd2_0_0_4;
wire sd2_0_0_5;
wire sd2_0_1_0;
wire sd2_0_1_1;
wire sd2_1_0_0;
wire sd2_1_0_1;
wire sd2_1_0_2;
wire sd2_1_0_3;
wire sd2_1_0_4;
wire sd2_1_0_5;
wire sd2_1_1_0;
wire sd2_1_1_1;
wire sd2_2_0_0;
wire sd2_2_0_1;
wire sd2_2_0_2;
wire sd2_2_0_3;
wire sd2_2_0_4;
wire sd2_2_0_5;
wire sd2_2_1_0;
wire sd2_2_1_1;
wire sd2_3_0_0;
wire sd2_3_0_1;
wire sd2_3_0_2;
wire sd2_3_0_3;
wire sd2_3_0_4;
wire sd2_3_0_5;
wire sd2_3_1_0;
wire sd2_3_1_1;
wire sd3_0_0_0;
wire sd3_0_0_1;
wire sd3_0_0_2;
wire sd3_0_0_3;
wire sd3_0_0_4;
wire sd3_0_0_5;
wire sd3_0_0_6;
wire sd3_0_0_7;
wire sd3_0_0_8;
wire sd3_0_0_9;
wire sd3_0_0_10;
wire sd3_0_0_11;
wire sd3_0_0_12;
wire sd3_0_0_13;
wire sd3_0_0_14;
wire sd3_0_0_15;
wire sd3_0_0_16;
wire sd3_0_0_17;
wire sd3_0_0_18;
wire sd3_0_0_19;
wire sd3_0_0_20;
wire sd3_0_0_21;
wire sd3_0_1_0;
wire sd3_0_1_1;
wire sd3_0_1_2;
wire sd3_0_1_3;
wire sd3_0_1_4;
wire sd3_0_1_5;
wire sd3_0_1_6;
wire sd3_0_2_0;
wire sd3_0_2_1;
wire sd3_0_2_2;
wire sd3_1_0_0;
wire sd3_1_0_1;
wire sd3_1_0_2;
wire sd3_1_0_3;
wire sd3_1_0_4;
wire sd3_1_0_5;
wire sd3_1_0_6;
wire sd3_1_0_7;
wire sd3_1_0_8;
wire sd3_1_0_9;
wire sd3_1_0_10;
wire sd3_1_0_11;
wire sd3_1_0_12;
wire sd3_1_0_13;
wire sd3_1_0_14;
wire sd3_1_0_15;
wire sd3_1_0_16;
wire sd3_1_0_17;
wire sd3_1_0_18;
wire sd3_1_0_19;
wire sd3_1_0_20;
wire sd3_1_0_21;
wire sd3_1_1_0;
wire sd3_1_1_1;
wire sd3_1_1_2;
wire sd3_1_1_3;
wire sd3_1_1_4;
wire sd3_1_1_5;
wire sd3_1_1_6;
wire sd3_1_2_0;
wire sd3_1_2_1;
wire sd3_1_2_2;
wire sd3_2_0_0;
wire sd3_2_0_1;
wire sd3_2_0_2;
wire sd3_2_0_3;
wire sd3_2_0_4;
wire sd3_2_0_5;
wire sd3_2_0_6;
wire sd3_2_0_7;
wire sd3_2_0_8;
wire sd3_2_0_9;
wire sd3_2_0_10;
wire sd3_2_0_11;
wire sd3_2_0_12;
wire sd3_2_0_13;
wire sd3_2_0_14;
wire sd3_2_0_15;
wire sd3_2_0_16;
wire sd3_2_0_17;
wire sd3_2_0_18;
wire sd3_2_0_19;
wire sd3_2_0_20;
wire sd3_2_0_21;
wire sd3_2_1_0;
wire sd3_2_1_1;
wire sd3_2_1_2;
wire sd3_2_1_3;
wire sd3_2_1_4;
wire sd3_2_1_5;
wire sd3_2_1_6;
wire sd3_2_2_0;
wire sd3_2_2_1;
wire sd3_2_2_2;
wire sd3_3_0_0;
wire sd3_3_0_1;
wire sd3_3_0_2;
wire sd3_3_0_3;
wire sd3_3_0_4;
wire sd3_3_0_5;
wire sd3_3_0_6;
wire sd3_3_0_7;
wire sd3_3_0_8;
wire sd3_3_0_9;
wire sd3_3_0_10;
wire sd3_3_0_11;
wire sd3_3_0_12;
wire sd3_3_0_13;
wire sd3_3_0_14;
wire sd3_3_0_15;
wire sd3_3_0_16;
wire sd3_3_0_17;
wire sd3_3_0_18;
wire sd3_3_0_19;
wire sd3_3_0_20;
wire sd3_3_0_21;
wire sd3_3_1_0;
wire sd3_3_1_1;
wire sd3_3_1_2;
wire sd3_3_1_3;
wire sd3_3_1_4;
wire sd3_3_1_5;
wire sd3_3_1_6;
wire sd3_3_2_0;
wire sd3_3_2_1;
wire sd3_3_2_2;


// Input Declarations
input 	[127:0] din;

//	For write datapath:	wire eccX_in ports to "0", 
//				wire write address parity to adr_parity port
//
// 	For read datapath: 	wire eccX_in ports to raw ecc from memory for error detecting
//				wire read address parity to adr_parity port

input		adr_parity;	// address parity input
input	[3:0] 	ecc0_in;	// ecc data input from memory
input	[3:0] 	ecc1_in;	// ecc data input from memory
input	[3:0] 	ecc2_in;	// ecc data input from memory
input	[3:0] 	ecc3_in;	// ecc data input from memory

// Output Declarations
output [15:0] 	ecc;


/////////////////////////////////////////////////////////////////////////
//	datain and address parity buffer
/////////////////////////////////////////////////////////////////////////

mcu_eccgen_dp_buff_macro__stack_64c__width_64      u_buf_din_127_64	       ( 
		  .din  ( din[127:64]	),
		  .dout ( d[127:64]	));

mcu_eccgen_dp_buff_macro__stack_64c__width_64      u_buf_din_63_0  	       ( 
		  .din  ( din[63:0]	),
		  .dout ( d[63:0] 	));

mcu_eccgen_dp_buff_macro__stack_2l__width_2      u_buf_adr_parity_1_0	        ( 
		  .din  ( { adr_parity, adr_parity } ),
		  .dout ( { aparity_0,	aparity_1  } ));


/////////////////////////////////////////////////////////////////////////
// ECC generation logic for the incomming data and address parity
/////////////////////////////////////////////////////////////////////////

//		wire [3:0]	partialsum;
//		wire [3:0]	p3_partialsum;

wire [3:0]	syndrome0;
wire [3:0]	syndrome1;
wire [3:0]	syndrome2;
wire [3:0]	syndrome3;

// partial sum

//		assign partialsum[3:0] = pw1  ^   pw2  ^   pw3  ^   pw4  ^   pw5  ^   pw6  ^   pw7  ^   
//					 pw8  ^   pw9  ^   pw10 ^   pw11 ^   pw12 ^   pw13 ^   pw14 ^   
//					 pw16 ^   pw17 ^   pw18 ^   pw19 ^   pw20 ^   pw21 ^   pw22 ^   
//					 pw23 ^   pw24 ^   pw25 ^   pw26 ^   pw27 ^   pw28 ^   pw29   ;
//		
//		
//		assign syndrome0[3:0] = w0 ^ w15 ^ w31 ^ partialsum ^ {4 {aparity_0 }} ^ ecc0_in;
//
//		
//		assign  syndrome0[0] =  d[0]	^	d[60]	^	d[124]	^                          	// w0[0] ^ w15[0] ^ w31[0]
//					d[7]	^								// pw1[0]
//					d[8] 	^ 	d[11]	^						// pw2[0]
//					d[14]	^								// pw3[0]
//					d[18] 	^ 	d[16] 	^						// pw4[0]
//					d[22] 	^ 	d[23]	^						// pw5[0]
//					d[26] 	^ 	d[27] 	^ 	d[24]	^				// pw6[0]
//					d[29]	^								// pw7[0]
//					d[33] 	^ 	d[32]	^						// pw8[0]
//					d[37] 	^ 	d[39]	^						// pw9[0]
//					d[41] 	^ 	d[40] 	^ 	d[43]	^				// pw10[0]
//					d[45] 	^ 	d[46]	^						// pw11[0]
//					d[49] 	^ 	d[50] 	^ 	d[48]	^				// pw12[0]
//					d[53] 	^ 	d[54] 	^ 	d[55]	^				// pw13[0]
//					d[57] 	^ 	d[58] 	^ 	d[59] 	^ 	d[56]	^		// pw14[0]
//					d[67]	^								// pw16[0]
//					d[68] 	^ 	d[71]	^						// pw17[0]
//					d[74]	^								// pw18[0]
//					d[78] 	^ 	d[76]	^						// pw19[0]
//					d[82] 	^ 	d[83]	^						// pw20[0]
//					d[86] 	^ 	d[87] 	^ 	d[84]	^				// pw21[0]
//					d[89]	^								// pw22[0]
//					d[93] 	^ 	d[92]	^						// pw23[0]
//					d[97] 	^ 	d[99]	^						// pw24[0]
//					d[101] 	^ 	d[100] 	^ 	d[103]	^				// pw25[0]
//					d[105] 	^ 	d[106]	^ 						// pw26[0]
//					d[109]  ^  	d[110] 	^  	d[108]	^				// pw27[0]
//					d[113] 	^ 	d[114] 	^ 	d[115]	^				// pw28[0]
//					d[117] 	^ 	d[118] 	^ 	d[119] 	^ 	d[116]	^		// pw29[0]
//					aparity_0 ^	ecc0_in[0];

//	syndrome0_bitx_levely_grpz
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_0               ( .din0 ( d[0]   ),     .din1 ( d[7]   ),     .din2 ( d[8]   ),     .dout ( sd0_0_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_1               ( .din0 ( d[11]  ),     .din1 ( d[14]  ),     .din2 ( d[16]  ),     .dout ( sd0_0_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_2               ( .din0 ( d[18]  ),     .din1 ( d[22]  ),     .din2 ( d[23]  ),     .dout ( sd0_0_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_3               ( .din0 ( d[24]  ),     .din1 ( d[26]  ),     .din2 ( d[27]  ),     .dout ( sd0_0_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_4               ( .din0 ( d[29]  ),     .din1 ( d[32]  ),     .din2 ( d[33]  ),     .dout ( sd0_0_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_5               ( .din0 ( d[37]  ),     .din1 ( d[39]  ),     .din2 ( d[40]  ),     .dout ( sd0_0_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_6               ( .din0 ( d[41]  ),     .din1 ( d[43]  ),     .din2 ( d[45]  ),     .dout ( sd0_0_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_7               ( .din0 ( d[46]  ),     .din1 ( d[48]  ),     .din2 ( d[49]  ),     .dout ( sd0_0_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_8               ( .din0 ( d[50]  ),     .din1 ( d[53]  ),     .din2 ( d[54]  ),     .dout ( sd0_0_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_9               ( .din0 ( d[55]  ),     .din1 ( d[56]  ),     .din2 ( d[57]  ),     .dout ( sd0_0_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_10              ( .din0 ( d[58]  ),     .din1 ( d[59]  ),     .din2 ( d[60]  ),     .dout ( sd0_0_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_11              ( .din0 ( d[67]  ),     .din1 ( d[68]  ),     .din2 ( d[71]  ),     .dout ( sd0_0_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_12              ( .din0 ( d[74]  ),     .din1 ( d[78]  ),     .din2 ( d[76]  ),     .dout ( sd0_0_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_13              ( .din0 ( d[82]  ),     .din1 ( d[83]  ),     .din2 ( d[84]  ),     .dout ( sd0_0_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_14              ( .din0 ( d[86]  ),     .din1 ( d[87]  ),     .din2 ( d[89]  ),     .dout ( sd0_0_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_15              ( .din0 ( d[92]  ),     .din1 ( d[93]  ),     .din2 ( d[97]  ),     .dout ( sd0_0_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_16              ( .din0 ( d[99]  ),     .din1 ( d[100] ),     .din2 ( d[101] ),     .dout ( sd0_0_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_17              ( .din0 ( d[103] ),     .din1 ( d[105] ),     .din2 ( d[106] ),     .dout ( sd0_0_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_18              ( .din0 ( d[108] ),     .din1 ( d[109] ),     .din2 ( d[110] ),     .dout ( sd0_0_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_19              ( .din0 ( d[113] ),     .din1 ( d[114] ),     .din2 ( d[115] ),     .dout ( sd0_0_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_20              ( .din0 ( d[116] ),     .din1 ( d[117] ),     .din2 ( d[118] ),     .dout ( sd0_0_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_0_21              ( .din0 ( d[119]     ), .din1 ( d[124]     ), .din2 ( aparity_0  ), .dout ( sd0_0_0_21  ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_0               ( .din0 ( sd0_0_0_0  ), .din1 ( sd0_0_0_1  ), .din2 ( sd0_0_0_2  ), .dout ( sd0_0_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_1               ( .din0 ( sd0_0_0_3  ), .din1 ( sd0_0_0_4  ), .din2 ( sd0_0_0_5  ), .dout ( sd0_0_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_2               ( .din0 ( sd0_0_0_6  ), .din1 ( sd0_0_0_7  ), .din2 ( sd0_0_0_8  ), .dout ( sd0_0_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_3               ( .din0 ( sd0_0_0_9  ), .din1 ( sd0_0_0_10 ), .din2 ( sd0_0_0_11 ), .dout ( sd0_0_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_4               ( .din0 ( sd0_0_0_12 ), .din1 ( sd0_0_0_13 ), .din2 ( sd0_0_0_14 ), .dout ( sd0_0_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_5               ( .din0 ( sd0_0_0_15 ), .din1 ( sd0_0_0_16 ), .din2 ( sd0_0_0_17 ), .dout ( sd0_0_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_1_6               ( .din0 ( sd0_0_0_18 ), .din1 ( sd0_0_0_19 ), .din2 ( sd0_0_0_20 ), .dout ( sd0_0_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_2_0               ( .din0 ( sd0_0_1_0  ), .din1 ( sd0_0_1_1  ), .din2 ( sd0_0_1_2  ), .dout ( sd0_0_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_2_1               ( .din0 ( sd0_0_1_3  ), .din1 ( sd0_0_1_4  ), .din2 ( sd0_0_1_5  ), .dout ( sd0_0_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_2_2               ( .din0 ( sd0_0_0_21 ), .din1 ( sd0_0_1_6  ), .din2 ( ecc0_in[0] ), .dout ( sd0_0_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_0_3_0               ( .din0 ( sd0_0_2_0  ), .din1 ( sd0_0_2_1  ), .din2 ( sd0_0_2_2  ), .dout ( syndrome0[0] ));

//		
//		
//		assign  syndrome0[1] =  d[1]	^	d[61]	^	d[125]	^ 				// w0[1] ^ w15[1] ^ w31[1]
//					d[4] 	^ 	d[7]	^					        // pw1[1]
//		                        d[8] 	^ 	d[11] 	^ 	d[9] 	^                               // pw2[1]
//		                        d[15] 	^ 	d[14] 	^                                               // pw3[1]
//		                        d[19] 	^ 	d[18] 	^ 	d[17] 	^                               // pw4[1]
//		                        d[22] 	^ 	d[20] 	^                                               // pw5[1]
//		                        d[26] 	^ 	d[24] 	^ 	d[25] 	^                               // pw6[1]
//		                        d[30] 	^ 	d[29] 	^                                               // pw7[1]
//		                        d[34] 	^                                                               // pw8[1]
//		                        d[38] 	^ 	d[37] 	^ 	d[36] 	^ 	d[39] 	^               // pw9[1]
//		                        d[42] 	^ 	d[40] 	^ 	d[43] 	^                               // pw10[1]
//		                        d[47] 	^ 	d[45] 	^ 	                                        // pw11[1]
//		                        d[51] 	^ 	      	  	                                        // pw12[1]
//		                        d[53] 	^ 	d[52] 	^ 	                                        // pw13[1]
//		                        d[56] 	^ 	      	  	                                        // pw14[1]
//		                        d[64] 	^ 	d[67] 	^ 	                                        // pw16[1]
//		                        d[68] 	^ 	d[71] 	^ 	d[69] 	^                               // pw17[1]
//		                        d[75] 	^       d[74]	^                                               // pw18[1]
//		                        d[79] 	^ 	d[78] 	^ 	d[77] 	^                               // pw19[1]
//		                        d[82] 	^ 	d[80] 	^                                               // pw20[1]
//		                        d[86] 	^ 	d[84] 	^ 	d[85] 	^                               // pw21[1]
//		                        d[90] 	^ 	d[89] 	^ 	                                        // pw22[1]
//		                        d[94] 	^ 	      	  	                                        // pw23[1]
//		                        d[98] 	^ 	d[97] 	^ 	d[96] 	^ 	d[99] ^                 // pw24[1]
//		                        d[102] 	^ 	d[100]	^	d[103]	^                               // pw25[1]
//		                        d[107] 	^ 	d[105]	^	                                        // pw26[1]
//		                        d[111] 	^                 	                                        // pw27[1]
//		                        d[113] 	^ 	d[112]	^                                               // pw28[1]
//		                        d[116]	^                  	                                        // pw29[1]
//					aparity_0 ^	ecc0_in[1];
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_0               ( .din0 ( d[1]   ),     .din1 ( d[4]   ),     .din2 ( d[7]   ),     .dout ( sd0_1_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_1               ( .din0 ( d[8]   ),     .din1 ( d[9]   ),     .din2 ( d[11]  ),     .dout ( sd0_1_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_2               ( .din0 ( d[14]  ),     .din1 ( d[15]  ),     .din2 ( d[17]  ),     .dout ( sd0_1_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_3               ( .din0 ( d[18]  ),     .din1 ( d[19]  ),     .din2 ( d[20]  ),     .dout ( sd0_1_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_4               ( .din0 ( d[22]  ),     .din1 ( d[24]  ),     .din2 ( d[25]  ),     .dout ( sd0_1_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_5               ( .din0 ( d[26]  ),     .din1 ( d[29]  ),     .din2 ( d[30]  ),     .dout ( sd0_1_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_6               ( .din0 ( d[34]  ),     .din1 ( d[36]  ),     .din2 ( d[38]  ),     .dout ( sd0_1_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_7               ( .din0 ( d[37]  ),     .din1 ( d[39]  ),     .din2 ( d[40]  ),     .dout ( sd0_1_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_8               ( .din0 ( d[42]  ),     .din1 ( d[43]  ),     .din2 ( d[45]  ),     .dout ( sd0_1_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_9               ( .din0 ( d[47]  ),     .din1 ( d[51]  ),     .din2 ( d[52]  ),     .dout ( sd0_1_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_10              ( .din0 ( d[53]  ),     .din1 ( d[56]  ),     .din2 ( d[61]  ),     .dout ( sd0_1_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_11              ( .din0 ( d[64]  ),     .din1 ( d[67]  ),     .din2 ( d[68]  ),     .dout ( sd0_1_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_12              ( .din0 ( d[69]  ),     .din1 ( d[71]  ),     .din2 ( d[74]  ),     .dout ( sd0_1_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_13              ( .din0 ( d[75]  ),     .din1 ( d[77]  ),     .din2 ( d[78]  ),     .dout ( sd0_1_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_14              ( .din0 ( d[79]  ),     .din1 ( d[80]  ),     .din2 ( d[82]  ),     .dout ( sd0_1_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_15              ( .din0 ( d[84]  ),     .din1 ( d[85]  ),     .din2 ( d[86]  ),     .dout ( sd0_1_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_16              ( .din0 ( d[89]  ),     .din1 ( d[90]  ),     .din2 ( d[94]  ),     .dout ( sd0_1_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_17              ( .din0 ( d[96]  ),     .din1 ( d[97]  ),     .din2 ( d[98]  ),     .dout ( sd0_1_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_18              ( .din0 ( d[99]  ),     .din1 ( d[100] ),     .din2 ( d[102] ),     .dout ( sd0_1_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_19              ( .din0 ( d[103] ),     .din1 ( d[105] ),     .din2 ( d[107] ),     .dout ( sd0_1_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_20              ( .din0 ( d[111] ),     .din1 ( d[112] ),     .din2 ( d[113] ),     .dout ( sd0_1_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_0_21              ( .din0 ( d[116]     ), .din1 ( d[125]     ), .din2 ( aparity_0  ), .dout ( sd0_1_0_21  ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_0               ( .din0 ( sd0_1_0_0  ), .din1 ( sd0_1_0_1  ), .din2 ( sd0_1_0_2  ), .dout ( sd0_1_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_1               ( .din0 ( sd0_1_0_3  ), .din1 ( sd0_1_0_4  ), .din2 ( sd0_1_0_5  ), .dout ( sd0_1_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_2               ( .din0 ( sd0_1_0_6  ), .din1 ( sd0_1_0_7  ), .din2 ( sd0_1_0_8  ), .dout ( sd0_1_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_3               ( .din0 ( sd0_1_0_9  ), .din1 ( sd0_1_0_10 ), .din2 ( sd0_1_0_11 ), .dout ( sd0_1_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_4               ( .din0 ( sd0_1_0_12 ), .din1 ( sd0_1_0_13 ), .din2 ( sd0_1_0_14 ), .dout ( sd0_1_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_5               ( .din0 ( sd0_1_0_15 ), .din1 ( sd0_1_0_16 ), .din2 ( sd0_1_0_17 ), .dout ( sd0_1_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_1_6               ( .din0 ( sd0_1_0_18 ), .din1 ( sd0_1_0_19 ), .din2 ( sd0_1_0_20 ), .dout ( sd0_1_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_2_0               ( .din0 ( sd0_1_1_0  ), .din1 ( sd0_1_1_1  ), .din2 ( sd0_1_1_2  ), .dout ( sd0_1_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_2_1               ( .din0 ( sd0_1_1_3  ), .din1 ( sd0_1_1_4  ), .din2 ( sd0_1_1_5  ), .dout ( sd0_1_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_2_2               ( .din0 ( sd0_1_0_21 ), .din1 ( sd0_1_1_6  ), .din2 ( ecc0_in[1] ), .dout ( sd0_1_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_1_3_0               ( .din0 ( sd0_1_2_0  ), .din1 ( sd0_1_2_1  ), .din2 ( sd0_1_2_2  ), .dout ( syndrome0[1] ));


//		
//		assign  syndrome0[2] =   d[2]	^	d[62]	^	d[126]	^				// w0[2] ^ w15[2] ^ w31[2]
//					d[5] 	^								// pw1[2]
//		                        d[9] 	^	 d[10]	^						// pw2[2]
//		                        d[12] 	^	 d[15]	^						// pw3[2]
//		                        d[16] 	^	 d[19] 	^	 d[18]	^				// pw4[2]
//		                        d[20] 	^	 d[23] 	^	 d[21]	^				// pw5[2]
//		                        d[24] 	^	 d[27] 	^	 d[25] 	^	 d[26]	^		// pw6[2]
//		                        d[31] 	^	 d[30]	^						// pw7[2]
//		                        d[35]	^								// pw8[2]
//		                        d[39] 	^	 d[38] 	^	 d[37]	^				// pw9[2]
//		                        d[43] 	^	 d[41]	^						// pw10[2]
//		                        d[44] 	^	 d[46]	^						// pw11[2]
//		                        d[48]	^								// pw12[2]
//		                        d[52] 	^	 d[54] 	^	 d[53]	^				// pw13[2]
//		                        d[56] 	^	 d[57]	^						// pw14[2]
//		                        d[65]	^								// pw16[2]
//		                        d[69] 	^	 d[70]	^						// pw17[2]
//		                        d[72] 	^	 d[75]	^						// pw18[2]
//		                        d[76] 	^	 d[79] 	^	 d[78]	^				// pw19[2]
//		                        d[80] 	^	 d[83] 	^	 d[81]	^				// pw20[2]
//		                        d[84] 	^	 d[87] 	^	 d[85] 	^	 d[86]	^		// pw21[2]
//		                        d[91] 	^	 d[90]	^						// pw22[2]
//		                        d[95]	^								// pw23[2]
//		                        d[99] 	^	 d[98] 	^	 d[97]	^				// pw24[2]
//		                        d[103] 	^	 d[101]	^						// pw25[2]
//		                        d[104] 	^	 d[106]	^						// pw26[2]
//		                        d[108]	^								// pw27[2]
//		                        d[112] 	^	 d[114] ^	 d[113]	^				// pw28[2]
//		                        d[116] 	^	 d[117]	^						// pw29[2]
//					aparity_0 ^	ecc0_in[2];
//		
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_0               ( .din0 ( d[2]   ),     .din1 ( d[5]   ),     .din2 ( d[9]   ),     .dout ( sd0_2_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_1               ( .din0 ( d[10]  ),     .din1 ( d[12]  ),     .din2 ( d[15]  ),     .dout ( sd0_2_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_2               ( .din0 ( d[16]  ),     .din1 ( d[18]  ),     .din2 ( d[19]  ),     .dout ( sd0_2_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_3               ( .din0 ( d[20]  ),     .din1 ( d[21]  ),     .din2 ( d[23]  ),     .dout ( sd0_2_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_4               ( .din0 ( d[24]  ),     .din1 ( d[25]  ),     .din2 ( d[26]  ),     .dout ( sd0_2_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_5               ( .din0 ( d[27]  ),     .din1 ( d[30]  ),     .din2 ( d[31]  ),     .dout ( sd0_2_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_6               ( .din0 ( d[35]  ),     .din1 ( d[37]  ),     .din2 ( d[38]  ),     .dout ( sd0_2_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_7               ( .din0 ( d[39]  ),     .din1 ( d[41]  ),     .din2 ( d[43]  ),     .dout ( sd0_2_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_8               ( .din0 ( d[44]  ),     .din1 ( d[46]  ),     .din2 ( d[48]  ),     .dout ( sd0_2_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_9               ( .din0 ( d[52]  ),     .din1 ( d[53]  ),     .din2 ( d[54]  ),     .dout ( sd0_2_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_10              ( .din0 ( d[56]  ),     .din1 ( d[57]  ),     .din2 ( d[62]  ),     .dout ( sd0_2_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_11              ( .din0 ( d[65]  ),     .din1 ( d[69]  ),     .din2 ( d[70]  ),     .dout ( sd0_2_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_12              ( .din0 ( d[72]  ),     .din1 ( d[75]  ),     .din2 ( d[76]  ),     .dout ( sd0_2_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_13              ( .din0 ( d[78]  ),     .din1 ( d[79]  ),     .din2 ( d[80]  ),     .dout ( sd0_2_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_14              ( .din0 ( d[81]  ),     .din1 ( d[83]  ),     .din2 ( d[84]  ),     .dout ( sd0_2_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_15              ( .din0 ( d[85]  ),     .din1 ( d[86]  ),     .din2 ( d[87]  ),     .dout ( sd0_2_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_16              ( .din0 ( d[91]  ),     .din1 ( d[90]  ),     .din2 ( d[95]  ),     .dout ( sd0_2_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_17              ( .din0 ( d[97]  ),     .din1 ( d[98]  ),     .din2 ( d[99]  ),     .dout ( sd0_2_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_18              ( .din0 ( d[101] ),     .din1 ( d[103] ),     .din2 ( d[104] ),     .dout ( sd0_2_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_19              ( .din0 ( d[106] ),     .din1 ( d[108] ),     .din2 ( d[112] ),     .dout ( sd0_2_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_20              ( .din0 ( d[113] ),     .din1 ( d[114] ),     .din2 ( d[116] ),     .dout ( sd0_2_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_0_21              ( .din0 ( d[117]     ), .din1 ( d[126]     ), .din2 ( aparity_0  ), .dout ( sd0_2_0_21  ));
   
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_0               ( .din0 ( sd0_2_0_0  ), .din1 ( sd0_2_0_1  ), .din2 ( sd0_2_0_2  ), .dout ( sd0_2_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_1               ( .din0 ( sd0_2_0_3  ), .din1 ( sd0_2_0_4  ), .din2 ( sd0_2_0_5  ), .dout ( sd0_2_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_2               ( .din0 ( sd0_2_0_6  ), .din1 ( sd0_2_0_7  ), .din2 ( sd0_2_0_8  ), .dout ( sd0_2_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_3               ( .din0 ( sd0_2_0_9  ), .din1 ( sd0_2_0_10 ), .din2 ( sd0_2_0_11 ), .dout ( sd0_2_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_4               ( .din0 ( sd0_2_0_12 ), .din1 ( sd0_2_0_13 ), .din2 ( sd0_2_0_14 ), .dout ( sd0_2_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_5               ( .din0 ( sd0_2_0_15 ), .din1 ( sd0_2_0_16 ), .din2 ( sd0_2_0_17 ), .dout ( sd0_2_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_1_6               ( .din0 ( sd0_2_0_18 ), .din1 ( sd0_2_0_19 ), .din2 ( sd0_2_0_20 ), .dout ( sd0_2_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_2_0               ( .din0 ( sd0_2_1_0  ), .din1 ( sd0_2_1_1  ), .din2 ( sd0_2_1_2  ), .dout ( sd0_2_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_2_1               ( .din0 ( sd0_2_1_3  ), .din1 ( sd0_2_1_4  ), .din2 ( sd0_2_1_5  ), .dout ( sd0_2_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_2_2               ( .din0 ( sd0_2_0_21 ), .din1 ( sd0_2_1_6  ), .din2 ( ecc0_in[2] ), .dout ( sd0_2_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_2_3_0               ( .din0 ( sd0_2_2_0  ), .din1 ( sd0_2_2_1  ), .din2 ( sd0_2_2_2  ), .dout ( syndrome0[2] ));


//		
//		assign	syndrome0[3] = 	d[3]	^	 d[63]	^	d[127]	^			^	// w0[3] ^ w15[3] ^ w31[3]
//					d[6]	^								// pw1[3]
//		                        d[10] 	^	 d[11]	^						// pw2[3]
//		                        d[13]	^								// pw3[3]
//		                        d[17] 	^	 d[19]	^						// pw4[3]
//		                        d[21] 	^	 d[22]	^						// pw5[3]
//		                        d[25] 	^	 d[26] 	^	 d[27]	^				// pw6[3]
//		                        d[28] 	^	 d[31]	^						// pw7[3]
//		                        d[32]	^								// pw8[3]
//		                        d[36] 	^	 d[39] 	^	 d[38]	^				// pw9[3]
//		                        d[40] 	^	 d[42]	^						// pw10[3]
//		                        d[44] 	^	 d[47] 	^	 d[45]	^				// pw11[3]
//		                        d[48] 	^	 d[49]	^						// pw12[3]
//		                        d[52] 	^	 d[55] 	^	 d[53] 	^	 d[54]	^		// pw13[3]
//		                        d[56] 	^	 d[57] 	^	 d[58]	^				// pw14[3]
//		                        d[66]	^								// pw16[3]
//		                        d[70] 	^	 d[71]	^						// pw17[3]
//		                        d[73]	^								// pw18[3]
//		                        d[77] 	^	 d[79]	^						// pw19[3]
//		                        d[81] 	^	 d[82]	^						// pw20[3]
//		                        d[85] 	^	 d[86] 	^	 d[87]	^				// pw21[3]
//		                        d[88] 	^	 d[91]	^						// pw22[3]
//		                        d[92]	^								// pw23[3]
//		                        d[96] 	^	 d[99] 	^	 d[98]	^				// pw24[3]
//		                        d[100] 	^	 d[102]	^						// pw25[3]
//		                        d[104] 	^	 d[107] ^	 d[105]	^				// pw26[3]
//		                        d[108] 	^	 d[109]	^						// pw27[3]
//		                        d[112] 	^	 d[115] ^	 d[113] ^	 d[114]	^		// pw28[3]
//		                        d[116] 	^	 d[117] ^	 d[118]	^				// pw29[3]
//					aparity_0 ^	ecc0_in[3];
//		  
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_0               ( .din0 ( d[3]   ),     .din1 ( d[6]   ),     .din2 ( d[10]  ),     .dout ( sd0_3_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_1               ( .din0 ( d[11]  ),     .din1 ( d[13]  ),     .din2 ( d[17]  ),     .dout ( sd0_3_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_2               ( .din0 ( d[19]  ),     .din1 ( d[21]  ),     .din2 ( d[22]  ),     .dout ( sd0_3_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_3               ( .din0 ( d[25]  ),     .din1 ( d[26]  ),     .din2 ( d[27]  ),     .dout ( sd0_3_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_4               ( .din0 ( d[28]  ),     .din1 ( d[31]  ),     .din2 ( d[32]  ),     .dout ( sd0_3_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_5               ( .din0 ( d[36]  ),     .din1 ( d[38]  ),     .din2 ( d[39]  ),     .dout ( sd0_3_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_6               ( .din0 ( d[40]  ),     .din1 ( d[42]  ),     .din2 ( d[44]  ),     .dout ( sd0_3_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_7               ( .din0 ( d[45]  ),     .din1 ( d[47]  ),     .din2 ( d[48]  ),     .dout ( sd0_3_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_8               ( .din0 ( d[49]  ),     .din1 ( d[52]  ),     .din2 ( d[53]  ),     .dout ( sd0_3_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_9               ( .din0 ( d[54]  ),     .din1 ( d[55]  ),     .din2 ( d[56]  ),     .dout ( sd0_3_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_10              ( .din0 ( d[57]  ),     .din1 ( d[58]  ),     .din2 ( d[63]  ),     .dout ( sd0_3_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_11              ( .din0 ( d[66]  ),     .din1 ( d[70]  ),     .din2 ( d[71]  ),     .dout ( sd0_3_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_12              ( .din0 ( d[73]  ),     .din1 ( d[77]  ),     .din2 ( d[79]  ),     .dout ( sd0_3_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_13              ( .din0 ( d[81]  ),     .din1 ( d[82]  ),     .din2 ( d[85]  ),     .dout ( sd0_3_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_14              ( .din0 ( d[86]  ),     .din1 ( d[87]  ),     .din2 ( d[88]  ),     .dout ( sd0_3_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_15              ( .din0 ( d[91]  ),     .din1 ( d[92]  ),     .din2 ( d[96]  ),     .dout ( sd0_3_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_16              ( .din0 ( d[99]  ),     .din1 ( d[98]  ),     .din2 ( d[100] ),     .dout ( sd0_3_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_17              ( .din0 ( d[102] ),     .din1 ( d[104] ),     .din2 ( d[105] ),     .dout ( sd0_3_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_18              ( .din0 ( d[107] ),     .din1 ( d[108] ),     .din2 ( d[109] ),     .dout ( sd0_3_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_19              ( .din0 ( d[112] ),     .din1 ( d[113] ),     .din2 ( d[114] ),     .dout ( sd0_3_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_20              ( .din0 ( d[115] ),     .din1 ( d[116] ),     .din2 ( d[117] ),     .dout ( sd0_3_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_0_21              ( .din0 ( d[118]     ), .din1 ( d[127]     ), .din2 ( aparity_0  ), .dout ( sd0_3_0_21  ));
                                                                                
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_0               ( .din0 ( sd0_3_0_0  ), .din1 ( sd0_3_0_1  ), .din2 ( sd0_3_0_2  ), .dout ( sd0_3_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_1               ( .din0 ( sd0_3_0_3  ), .din1 ( sd0_3_0_4  ), .din2 ( sd0_3_0_5  ), .dout ( sd0_3_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_2               ( .din0 ( sd0_3_0_6  ), .din1 ( sd0_3_0_7  ), .din2 ( sd0_3_0_8  ), .dout ( sd0_3_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_3               ( .din0 ( sd0_3_0_9  ), .din1 ( sd0_3_0_10 ), .din2 ( sd0_3_0_11 ), .dout ( sd0_3_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_4               ( .din0 ( sd0_3_0_12 ), .din1 ( sd0_3_0_13 ), .din2 ( sd0_3_0_14 ), .dout ( sd0_3_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_5               ( .din0 ( sd0_3_0_15 ), .din1 ( sd0_3_0_16 ), .din2 ( sd0_3_0_17 ), .dout ( sd0_3_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_1_6               ( .din0 ( sd0_3_0_18 ), .din1 ( sd0_3_0_19 ), .din2 ( sd0_3_0_20 ), .dout ( sd0_3_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_2_0               ( .din0 ( sd0_3_1_0  ), .din1 ( sd0_3_1_1  ), .din2 ( sd0_3_1_2  ), .dout ( sd0_3_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_2_1               ( .din0 ( sd0_3_1_3  ), .din1 ( sd0_3_1_4  ), .din2 ( sd0_3_1_5  ), .dout ( sd0_3_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_2_2               ( .din0 ( sd0_3_0_21 ), .din1 ( sd0_3_1_6  ), .din2 ( ecc0_in[3] ), .dout ( sd0_3_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd0_3_3_0               ( .din0 ( sd0_3_2_0  ), .din1 ( sd0_3_2_1  ), .din2 ( sd0_3_2_2  ), .dout ( syndrome0[3] ));





//		assign syndrome1[3:0] = w0  ^ w1  ^ w2  ^ w3  ^ w4  ^ w5  ^ w6  ^ w7  ^ 
//				       w8  ^ w9  ^ w10 ^ w11 ^ w12 ^ w13 ^ w14 ^ w30 ^ w31 ^ {4{aparity}} ^ ecc1_in; 
//		
//		assign syndrome1[0] = 	d[0]	^	//	 w0
//					d[4]	^	//	 w1
//					d[8]	^	//	 w2
//					d[12]	^	//	 w3
//					d[16]	^	//	 w4
//					d[20]	^	//	 w5
//					d[24]	^	//	 w6
//					d[28]	^	//	 w7
//					d[32]	^	//	 w8
//					d[36]	^	//	 w9
//					d[40]	^	//	w10
//					d[44]	^	//	w11
//					d[48]	^	//	w12
//					d[52]	^	//	w13
//					d[56]	^	//	w14
//					d[120]	^	//	w30
//					d[124]	^   	//	w31
//					aparity_0 ^	
//					ecc1_in[0];
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_0               ( .din0 ( d[0]   ),     .din1 ( d[4]   ),     .din2 ( d[8]   ),     .dout ( sd1_0_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_1               ( .din0 ( d[12]  ),     .din1 ( d[16]  ),     .din2 ( d[20]  ),     .dout ( sd1_0_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_2               ( .din0 ( d[24]  ),     .din1 ( d[28]  ),     .din2 ( d[32]  ),     .dout ( sd1_0_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_3               ( .din0 ( d[36]  ),     .din1 ( d[40]  ),     .din2 ( d[44]  ),     .dout ( sd1_0_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_4               ( .din0 ( d[48]  ),     .din1 ( d[52]  ),     .din2 ( d[56]  ),     .dout ( sd1_0_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_0_5               ( .din0 ( d[120] ),     .din1 ( d[124] ),     .din2 ( aparity_0  ), .dout ( sd1_0_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_1_0               ( .din0 ( sd1_0_0_0  ), .din1 ( sd1_0_0_1  ), .din2 ( sd1_0_0_2  ), .dout ( sd1_0_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_1_1               ( .din0 ( sd1_0_0_3  ), .din1 ( sd1_0_0_4  ), .din2 ( sd1_0_0_5  ), .dout ( sd1_0_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_0_2_0               ( .din0 ( sd1_0_1_0  ), .din1 ( sd1_0_1_1  ), .din2 ( ecc1_in[0] ), .dout ( syndrome1[0] ));


//		
//		assign syndrome1[1] = 	d[1]	^	//	 w0
//					d[5]	^	//	 w1
//					d[9]	^	//	 w2
//					d[13]	^	//	 w3
//					d[17]	^	//	 w4
//					d[21]	^	//	 w5
//					d[25]	^	//	 w6
//					d[29]	^	//	 w7
//					d[33]	^	//	 w8
//					d[37]	^	//	 w9
//					d[41]	^	//	w10
//					d[45]	^	//	w11
//					d[49]	^	//	w12
//					d[53]	^	//	w13
//					d[57]	^	//	w14
//					d[121]	^	//	w30
//					d[125]  ^	//	w31
//					aparity_0 ^	
//					ecc1_in[1];
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_0               ( .din0 ( d[1]   ),     .din1 ( d[5]   ),     .din2 ( d[9]   ),     .dout ( sd1_1_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_1               ( .din0 ( d[13]  ),     .din1 ( d[17]  ),     .din2 ( d[21]  ),     .dout ( sd1_1_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_2               ( .din0 ( d[25]  ),     .din1 ( d[29]  ),     .din2 ( d[33]  ),     .dout ( sd1_1_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_3               ( .din0 ( d[37]  ),     .din1 ( d[41]  ),     .din2 ( d[45]  ),     .dout ( sd1_1_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_4               ( .din0 ( d[49]  ),     .din1 ( d[53]  ),     .din2 ( d[57]  ),     .dout ( sd1_1_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_0_5               ( .din0 ( d[121] ),     .din1 ( d[125] ),     .din2 ( aparity_0  ), .dout ( sd1_1_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_1_0               ( .din0 ( sd1_1_0_0  ), .din1 ( sd1_1_0_1  ), .din2 ( sd1_1_0_2  ), .dout ( sd1_1_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_1_1               ( .din0 ( sd1_1_0_3  ), .din1 ( sd1_1_0_4  ), .din2 ( sd1_1_0_5  ), .dout ( sd1_1_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_1_2_0               ( .din0 ( sd1_1_1_0  ), .din1 ( sd1_1_1_1  ), .din2 ( ecc1_in[1] ), .dout ( syndrome1[1] ));


//		
//		
//		assign syndrome1[2] = 	d[2]	^	//	 w0
//					d[6]	^	//	 w1
//					d[10]	^	// 	 w2
//					d[14]	^	//	 w3
//					d[18]	^	//	 w4
//					d[22]	^	//	 w5
//					d[26]	^	//	 w6
//					d[30]	^	//	 w7
//					d[34]	^	//	 w8
//					d[38]	^	//	 w9
//					d[42]	^	//	w10
//					d[46]	^	//	w11
//					d[50]	^	//	w12
//					d[54]	^	//	w13
//					d[58]	^	//	w14
//					d[122]	^	//	w30
//					d[126] 	^	//	w31
//					aparity_0 ^	
//					ecc1_in[2];
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_0               ( .din0 ( d[2]   ),     .din1 ( d[6]   ),     .din2 ( d[10]  ),     .dout ( sd1_2_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_1               ( .din0 ( d[14]  ),     .din1 ( d[18]  ),     .din2 ( d[22]  ),     .dout ( sd1_2_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_2               ( .din0 ( d[26]  ),     .din1 ( d[30]  ),     .din2 ( d[34]  ),     .dout ( sd1_2_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_3               ( .din0 ( d[38]  ),     .din1 ( d[42]  ),     .din2 ( d[46]  ),     .dout ( sd1_2_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_4               ( .din0 ( d[50]  ),     .din1 ( d[54]  ),     .din2 ( d[58]  ),     .dout ( sd1_2_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_0_5               ( .din0 ( d[122] ),     .din1 ( d[126] ),     .din2 ( aparity_0  ), .dout ( sd1_2_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_1_0               ( .din0 ( sd1_2_0_0  ), .din1 ( sd1_2_0_1  ), .din2 ( sd1_2_0_2  ), .dout ( sd1_2_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_1_1               ( .din0 ( sd1_2_0_3  ), .din1 ( sd1_2_0_4  ), .din2 ( sd1_2_0_5  ), .dout ( sd1_2_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_2_2_0               ( .din0 ( sd1_2_1_0  ), .din1 ( sd1_2_1_1  ), .din2 ( ecc1_in[2] ), .dout ( syndrome1[2] ));


//		
//		
//		assign syndrome1[3] = 	d[3]	^	//	 w0
//					d[7]	^	//	 w1
//					d[11]	^	// 	 w2
//					d[15]	^	//	 w3
//					d[19]	^	//	 w4
//					d[23]	^	//	 w5
//					d[27]	^	//	 w6
//					d[31]	^	//	 w7
//					d[35]	^	//	 w8
//					d[39]	^	//	 w9
//					d[43]	^	//	w10
//					d[47]	^	//	w11
//					d[51]	^	//	w12
//					d[55]	^	//	w13
//					d[59]	^	//	w14
//					d[123]	^	//	w30
//					d[127]	^   	//	w31
//					aparity_0 ^	
//					ecc1_in[3];
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_0               ( .din0 ( d[3]   ),     .din1 ( d[7]   ),     .din2 ( d[11]  ),     .dout ( sd1_3_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_1               ( .din0 ( d[15]  ),     .din1 ( d[19]  ),     .din2 ( d[23]  ),     .dout ( sd1_3_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_2               ( .din0 ( d[27]  ),     .din1 ( d[31]  ),     .din2 ( d[35]  ),     .dout ( sd1_3_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_3               ( .din0 ( d[39]  ),     .din1 ( d[43]  ),     .din2 ( d[47]  ),     .dout ( sd1_3_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_4               ( .din0 ( d[51]  ),     .din1 ( d[55]  ),     .din2 ( d[59]  ),     .dout ( sd1_3_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_0_5               ( .din0 ( d[123] ),     .din1 ( d[127] ),     .din2 ( aparity_0  ), .dout ( sd1_3_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_1_0               ( .din0 ( sd1_3_0_0  ), .din1 ( sd1_3_0_1  ), .din2 ( sd1_3_0_2  ), .dout ( sd1_3_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_1_1               ( .din0 ( sd1_3_0_3  ), .din1 ( sd1_3_0_4  ), .din2 ( sd1_3_0_5  ), .dout ( sd1_3_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd1_3_2_0               ( .din0 ( sd1_3_1_0  ), .din1 ( sd1_3_1_1  ), .din2 ( ecc1_in[3] ), .dout ( syndrome1[3] ));




//		assign syndrome2[3:0] = w15 ^ w16 ^ w17 ^ w18 ^ w19 ^ w20 ^ w21 ^ w22 ^ w23 ^ 
//				             w24 ^ w25 ^ w26 ^ w27 ^ w28 ^ w29 ^ w30 ^ w31 ^ {4{aparity}} ^ ecc2_in;

//		assign syndrome2[0] = 	d[60]	^	//	w15
//					d[64]	^	//	w16
//					d[68]	^	//	w17
//					d[72]	^	//	w18
//					d[76]	^	//	w19
//					d[80]	^	//	w20
//					d[84]	^	//	w21
//					d[88]	^	//	w22
//					d[92]	^	//	w23
//					d[96]	^	//	w24
//					d[100]	^	//	w25
//					d[104]	^	//	w26
//					d[108]	^	//	w27
//					d[112]	^	//	w28
//					d[116]	^	//	w29
//					d[120]	^	//	w30
//					d[124]  ^	//	w31
//					aparity_1 ^	
//					ecc2_in[0];
//		
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_0               ( .din0 ( d[60]  ),     .din1 ( d[64]  ),     .din2 ( d[68]  ),     .dout ( sd2_0_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_1               ( .din0 ( d[72]  ),     .din1 ( d[76]  ),     .din2 ( d[80]  ),     .dout ( sd2_0_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_2               ( .din0 ( d[84]  ),     .din1 ( d[88]  ),     .din2 ( d[92]  ),     .dout ( sd2_0_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_3               ( .din0 ( d[96]  ),     .din1 ( d[100] ),     .din2 ( d[104] ),     .dout ( sd2_0_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_4               ( .din0 ( d[108] ),     .din1 ( d[112] ),     .din2 ( d[116] ),     .dout ( sd2_0_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_0_5               ( .din0 ( d[120] ),     .din1 ( d[124] ),     .din2 ( aparity_1  ), .dout ( sd2_0_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_1_0               ( .din0 ( sd2_0_0_0  ), .din1 ( sd2_0_0_1  ), .din2 ( sd2_0_0_2  ), .dout ( sd2_0_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_1_1               ( .din0 ( sd2_0_0_3  ), .din1 ( sd2_0_0_4  ), .din2 ( sd2_0_0_5  ), .dout ( sd2_0_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_0_2_0               ( .din0 ( sd2_0_1_0  ), .din1 ( sd2_0_1_1  ), .din2 ( ecc2_in[0] ), .dout ( syndrome2[0] ));


//		
//		
//		assign syndrome2[1] = 	d[61]	^	//	w15
//					d[65]	^	//	w16
//					d[69]	^	//	w17
//					d[73]	^	//	w18
//					d[77]	^	//	w19
//					d[81]	^	//	w20
//					d[85]	^	//	w21
//					d[89]	^	//	w22
//					d[93]	^	//	w23
//					d[97]	^	//	w24
//					d[101]	^	//	w25
//					d[105]	^	//	w26
//					d[109]	^	//	w27
//					d[113]	^	//	w28
//					d[117]	^	//	w29
//					d[121]	^	//	w30
//					d[125]  ^	//	w31
//					aparity_1 ^	
//					ecc2_in[1];
//		
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_0               ( .din0 ( d[61]  ),     .din1 ( d[65]  ),     .din2 ( d[69]  ),     .dout ( sd2_1_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_1               ( .din0 ( d[73]  ),     .din1 ( d[77]  ),     .din2 ( d[81]  ),     .dout ( sd2_1_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_2               ( .din0 ( d[85]  ),     .din1 ( d[89]  ),     .din2 ( d[93]  ),     .dout ( sd2_1_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_3               ( .din0 ( d[97]  ),     .din1 ( d[101] ),     .din2 ( d[105] ),     .dout ( sd2_1_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_4               ( .din0 ( d[109] ),     .din1 ( d[113] ),     .din2 ( d[117] ),     .dout ( sd2_1_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_0_5               ( .din0 ( d[121] ),     .din1 ( d[125] ),     .din2 ( aparity_1  ), .dout ( sd2_1_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_1_0               ( .din0 ( sd2_1_0_0  ), .din1 ( sd2_1_0_1  ), .din2 ( sd2_1_0_2  ), .dout ( sd2_1_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_1_1               ( .din0 ( sd2_1_0_3  ), .din1 ( sd2_1_0_4  ), .din2 ( sd2_1_0_5  ), .dout ( sd2_1_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_1_2_0               ( .din0 ( sd2_1_1_0  ), .din1 ( sd2_1_1_1  ), .din2 ( ecc2_in[1] ), .dout ( syndrome2[1] ));

//		
//		
//		assign syndrome2[2] = 	d[62]	^	//	w15
//					d[66]	^	//	w16
//					d[70]	^	//	w17
//					d[74]	^	//	w18
//					d[78]	^	//	w19
//					d[82]	^	//	w20
//					d[86]	^	//	w21
//					d[90]	^	//	w22
//					d[94]	^	//	w23
//					d[98]	^	//	w24
//					d[102]	^	//	w25
//					d[106]	^	//	w26
//					d[110]	^	//	w27
//					d[114]	^	//	w28
//					d[118]	^	//	w29
//					d[122]	^	//	w30
//					d[126]	^ 	//	w31
//					aparity_1 ^	
//					ecc2_in[2];
//		
//		


mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_0               ( .din0 ( d[62]  ),     .din1 ( d[66]  ),     .din2 ( d[70]  ),     .dout ( sd2_2_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_1               ( .din0 ( d[74]  ),     .din1 ( d[78]  ),     .din2 ( d[82]  ),     .dout ( sd2_2_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_2               ( .din0 ( d[86]  ),     .din1 ( d[90]  ),     .din2 ( d[94]  ),     .dout ( sd2_2_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_3               ( .din0 ( d[98]  ),     .din1 ( d[102] ),     .din2 ( d[106] ),     .dout ( sd2_2_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_4               ( .din0 ( d[110] ),     .din1 ( d[114] ),     .din2 ( d[118] ),     .dout ( sd2_2_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_0_5               ( .din0 ( d[122] ),     .din1 ( d[126] ),     .din2 ( aparity_1  ), .dout ( sd2_2_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_1_0               ( .din0 ( sd2_2_0_0  ), .din1 ( sd2_2_0_1  ), .din2 ( sd2_2_0_2  ), .dout ( sd2_2_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_1_1               ( .din0 ( sd2_2_0_3  ), .din1 ( sd2_2_0_4  ), .din2 ( sd2_2_0_5  ), .dout ( sd2_2_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_2_2_0               ( .din0 ( sd2_2_1_0  ), .din1 ( sd2_2_1_1  ), .din2 ( ecc2_in[2] ), .dout ( syndrome2[2] ));


//		
//		
//		assign syndrome2[3] = 	d[63]	^	//	w15
//					d[67]	^	//	w16
//					d[71]	^	//	w17
//					d[75]	^	//	w18
//					d[79]	^	//	w19
//					d[83]	^	//	w20
//					d[87]	^	//	w21
//					d[91]	^	//	w22
//					d[95]	^	//	w23
//					d[99]	^	//	w24
//					d[103]	^	//	w25
//					d[107]	^	//	w26
//					d[111]	^	//	w27
//					d[115]	^	//	w28
//					d[119]	^	//	w29
//					d[123]	^	//	w30
//					d[127]	^ 	//	w31
//					aparity_1 ^	
//					ecc2_in[3];
//		
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_0               ( .din0 ( d[63]  ),     .din1 ( d[67]  ),     .din2 ( d[71]  ),     .dout ( sd2_3_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_1               ( .din0 ( d[75]  ),     .din1 ( d[79]  ),     .din2 ( d[83]  ),     .dout ( sd2_3_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_2               ( .din0 ( d[87]  ),     .din1 ( d[91]  ),     .din2 ( d[95]  ),     .dout ( sd2_3_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_3               ( .din0 ( d[99]  ),     .din1 ( d[103] ),     .din2 ( d[107] ),     .dout ( sd2_3_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_4               ( .din0 ( d[111] ),     .din1 ( d[115] ),     .din2 ( d[119] ),     .dout ( sd2_3_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_0_5               ( .din0 ( d[123] ),     .din1 ( d[127] ),     .din2 ( aparity_1  ), .dout ( sd2_3_0_5   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_1_0               ( .din0 ( sd2_3_0_0  ), .din1 ( sd2_3_0_1  ), .din2 ( sd2_3_0_2  ), .dout ( sd2_3_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_1_1               ( .din0 ( sd2_3_0_3  ), .din1 ( sd2_3_0_4  ), .din2 ( sd2_3_0_5  ), .dout ( sd2_3_1_1   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd2_3_2_0               ( .din0 ( sd2_3_1_0  ), .din1 ( sd2_3_1_1  ), .din2 ( ecc2_in[3] ), .dout ( syndrome2[3] ));



//		
//		assign syndrome3[3:0] = w0 ^ w15 ^ w30 ^ p3_partialsum ^ {4{aparity}} ^ ecc3_in;


//		assign	syndrome3[0] =  d[0]	^	 d[60]	^	 d[120]	^	aparity_1	^	ecc3_in[0]	^
//					d[5] 	^	 d[4]	^
//					d[9] 	^	 d[10] 	^	 d[11]	^
//					d[13] 	^	 d[14] 	^	 d[12]	^
//					d[17] 	^	 d[16] 	^	 d[19]	^
//					d[22] 	^	 d[23] 	^	 d[20]	^
//					d[26] 	^	 d[27]	^
//					d[29] 	^	 d[30] 	^	 d[31] 	^	 d[28]	^
//					d[35]	^ 
//					d[37] 	^	 d[38]	^
//					d[42] 	^	 d[40]	^
//					d[45] 	^	 d[47]	^
//					d[50]	^
//					d[52] 	^	 d[55]	^
//					d[57]	^
//					d[65] 	^	 d[64]	^
//					d[69] 	^	 d[70] 	^	 d[71]	^
//					d[73] 	^	 d[74] 	^	 d[72]	^
//					d[77] 	^	 d[76] 	^	 d[79]	^
//					d[82] 	^	 d[83] 	^	 d[80]	^
//					d[86] 	^	 d[87]	^
//					d[89] 	^	 d[90] 	^	 d[91] 	^	 d[88]	^
//					d[95]	^ 
//					d[97] 	^	 d[98]	^
//					d[102] 	^	 d[100]	^
//					d[105] 	^	 d[107]	^
//					d[110]	^
//					d[112] 	^	 d[115]	^
//					d[117];
//					
//		
      
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_0               ( .din0 ( d[0]   ),     .din1 ( d[4]   ),     .din2 ( d[5]   ),     .dout ( sd3_0_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_1               ( .din0 ( d[9]   ),     .din1 ( d[10]  ),     .din2 ( d[11]  ),     .dout ( sd3_0_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_2               ( .din0 ( d[12]  ),     .din1 ( d[13]  ),     .din2 ( d[14]  ),     .dout ( sd3_0_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_3               ( .din0 ( d[16]  ),     .din1 ( d[17]  ),     .din2 ( d[19]  ),     .dout ( sd3_0_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_4               ( .din0 ( d[20]  ),     .din1 ( d[22]  ),     .din2 ( d[23]  ),     .dout ( sd3_0_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_5               ( .din0 ( d[26]  ),     .din1 ( d[27]  ),     .din2 ( d[28]  ),     .dout ( sd3_0_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_6               ( .din0 ( d[29]  ),     .din1 ( d[30]  ),     .din2 ( d[31]  ),     .dout ( sd3_0_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_7               ( .din0 ( d[35]  ),     .din1 ( d[37]  ),     .din2 ( d[38]  ),     .dout ( sd3_0_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_8               ( .din0 ( d[40]  ),     .din1 ( d[42]  ),     .din2 ( d[45]  ),     .dout ( sd3_0_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_9               ( .din0 ( d[47]  ),     .din1 ( d[50]  ),     .din2 ( d[52]  ),     .dout ( sd3_0_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_10              ( .din0 ( d[55]  ),     .din1 ( d[57]  ),     .din2 ( d[60]  ),     .dout ( sd3_0_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_11              ( .din0 ( d[64]  ),     .din1 ( d[65]  ),     .din2 ( d[69]  ),     .dout ( sd3_0_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_12              ( .din0 ( d[70]  ),     .din1 ( d[71]  ),     .din2 ( d[72]  ),     .dout ( sd3_0_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_13              ( .din0 ( d[73]  ),     .din1 ( d[74]  ),     .din2 ( d[76]  ),     .dout ( sd3_0_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_14              ( .din0 ( d[77]  ),     .din1 ( d[79]  ),     .din2 ( d[80]  ),     .dout ( sd3_0_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_15              ( .din0 ( d[82]  ),     .din1 ( d[83]  ),     .din2 ( d[86]  ),     .dout ( sd3_0_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_16              ( .din0 ( d[87]  ),     .din1 ( d[88]  ),     .din2 ( d[89]  ),     .dout ( sd3_0_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_17              ( .din0 ( d[90]  ),     .din1 ( d[91]  ),     .din2 ( d[95]  ),     .dout ( sd3_0_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_18              ( .din0 ( d[97]  ),     .din1 ( d[98]  ),     .din2 ( d[100] ),     .dout ( sd3_0_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_19              ( .din0 ( d[102] ),     .din1 ( d[105] ),     .din2 ( d[107] ),     .dout ( sd3_0_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_20              ( .din0 ( d[110] ),     .din1 ( d[112] ),     .din2 ( d[115] ),     .dout ( sd3_0_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_0_21              ( .din0 ( d[117]     ), .din1 ( d[120]     ), .din2 ( aparity_1  ), .dout ( sd3_0_0_21  ));
                                                                                
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_0               ( .din0 ( sd3_0_0_0  ), .din1 ( sd3_0_0_1  ), .din2 ( sd3_0_0_2  ), .dout ( sd3_0_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_1               ( .din0 ( sd3_0_0_3  ), .din1 ( sd3_0_0_4  ), .din2 ( sd3_0_0_5  ), .dout ( sd3_0_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_2               ( .din0 ( sd3_0_0_6  ), .din1 ( sd3_0_0_7  ), .din2 ( sd3_0_0_8  ), .dout ( sd3_0_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_3               ( .din0 ( sd3_0_0_9  ), .din1 ( sd3_0_0_10 ), .din2 ( sd3_0_0_11 ), .dout ( sd3_0_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_4               ( .din0 ( sd3_0_0_12 ), .din1 ( sd3_0_0_13 ), .din2 ( sd3_0_0_14 ), .dout ( sd3_0_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_5               ( .din0 ( sd3_0_0_15 ), .din1 ( sd3_0_0_16 ), .din2 ( sd3_0_0_17 ), .dout ( sd3_0_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_1_6               ( .din0 ( sd3_0_0_18 ), .din1 ( sd3_0_0_19 ), .din2 ( sd3_0_0_20 ), .dout ( sd3_0_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_2_0               ( .din0 ( sd3_0_1_0  ), .din1 ( sd3_0_1_1  ), .din2 ( sd3_0_1_2  ), .dout ( sd3_0_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_2_1               ( .din0 ( sd3_0_1_3  ), .din1 ( sd3_0_1_4  ), .din2 ( sd3_0_1_5  ), .dout ( sd3_0_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_2_2               ( .din0 ( sd3_0_0_21 ), .din1 ( sd3_0_1_6  ), .din2 ( ecc3_in[0] ), .dout ( sd3_0_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_0_3_0               ( .din0 ( sd3_0_2_0  ), .din1 ( sd3_0_2_1  ), .din2 ( sd3_0_2_2  ), .dout ( syndrome3[0] ));
      
      
//		
//					
//		assign	syndrome3[1] =  d[1]	^	 d[61]	^	 d[121]	^	aparity_1	^	ecc3_in[1]	^
//					d[6]	^
//					d[9] 	^	 d[8]	^
//					d[15]	^
//					d[18] 	^	 d[16] 	^	 d[19]	^
//					d[22] 	^	 d[20] 	^	 d[21]	^
//					d[26] 	^	 d[24]	^
//					d[28]	^
//					d[32] 	^	 d[35]	^
//					d[39] 	^	 d[37]	^
//					d[43] 	^	 d[42] 	^	 d[41]	^
//					d[46] 	^	 d[45] 	^	 d[44] 	^	 d[47]	^
//					d[51] 	^	 d[50]	^ 
//					d[52] 	^	 d[55] 	^	 d[53]	^
//					d[58] 	^	 d[57]	^
//					d[66]	^
//					d[69] 	^	 d[68]	^
//					d[75]	^
//					d[78] 	^	 d[76] 	^	 d[79]	^
//					d[82] 	^	 d[80] 	^	 d[81]	^
//					d[86] 	^	 d[84]	^
//					d[88]	^
//					d[92] 	^	 d[95]	^
//					d[99] 	^	 d[97]	^
//					d[103] 	^	 d[102] ^	 d[101]	^
//					d[106] 	^	 d[105] ^	 d[104] 	^	 d[107]	^
//					d[111] 	^	 d[110]	^ 
//					d[112] 	^	 d[115] ^	 d[113]	^
//					d[118] 	^	 d[117];
//					
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_0               ( .din0 ( d[1]   ),     .din1 ( d[6]   ),     .din2 ( d[9]   ),     .dout ( sd3_1_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_1               ( .din0 ( d[8]   ),     .din1 ( d[15]  ),     .din2 ( d[16]  ),     .dout ( sd3_1_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_2               ( .din0 ( d[18]  ),     .din1 ( d[19]  ),     .din2 ( d[20]  ),     .dout ( sd3_1_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_3               ( .din0 ( d[21]  ),     .din1 ( d[22]  ),     .din2 ( d[24]  ),     .dout ( sd3_1_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_4               ( .din0 ( d[26]  ),     .din1 ( d[28]  ),     .din2 ( d[32]  ),     .dout ( sd3_1_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_5               ( .din0 ( d[35]  ),     .din1 ( d[37]  ),     .din2 ( d[39]  ),     .dout ( sd3_1_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_6               ( .din0 ( d[41]  ),     .din1 ( d[42]  ),     .din2 ( d[43]  ),     .dout ( sd3_1_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_7               ( .din0 ( d[44]  ),     .din1 ( d[45]  ),     .din2 ( d[46]  ),     .dout ( sd3_1_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_8               ( .din0 ( d[47]  ),     .din1 ( d[50]  ),     .din2 ( d[51]  ),     .dout ( sd3_1_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_9               ( .din0 ( d[52]  ),     .din1 ( d[53]  ),     .din2 ( d[55]  ),     .dout ( sd3_1_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_10              ( .din0 ( d[57]  ),     .din1 ( d[58]  ),     .din2 ( d[61]  ),     .dout ( sd3_1_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_11              ( .din0 ( d[66]  ),     .din1 ( d[69]  ),     .din2 ( d[68]  ),     .dout ( sd3_1_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_12              ( .din0 ( d[75]  ),     .din1 ( d[78]  ),     .din2 ( d[76]  ),     .dout ( sd3_1_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_13              ( .din0 ( d[79]  ),     .din1 ( d[80]  ),     .din2 ( d[81]  ),     .dout ( sd3_1_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_14              ( .din0 ( d[82]  ),     .din1 ( d[84]  ),     .din2 ( d[86]  ),     .dout ( sd3_1_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_15              ( .din0 ( d[88]  ),     .din1 ( d[92]  ),     .din2 ( d[95]  ),     .dout ( sd3_1_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_16              ( .din0 ( d[97]  ),     .din1 ( d[99]  ),     .din2 ( d[101] ),     .dout ( sd3_1_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_17              ( .din0 ( d[102] ),     .din1 ( d[103] ),     .din2 ( d[106] ),     .dout ( sd3_1_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_18              ( .din0 ( d[105] ),     .din1 ( d[104] ),     .din2 ( d[107] ),     .dout ( sd3_1_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_19              ( .din0 ( d[110] ),     .din1 ( d[111] ),     .din2 ( d[112] ),     .dout ( sd3_1_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_20              ( .din0 ( d[113] ),     .din1 ( d[115] ),     .din2 ( d[118] ),     .dout ( sd3_1_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_0_21              ( .din0 ( d[117]     ), .din1 ( d[121]     ), .din2 ( aparity_1  ), .dout ( sd3_1_0_21  ));
                                                                              
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_0               ( .din0 ( sd3_1_0_0  ), .din1 ( sd3_1_0_1  ), .din2 ( sd3_1_0_2  ), .dout ( sd3_1_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_1               ( .din0 ( sd3_1_0_3  ), .din1 ( sd3_1_0_4  ), .din2 ( sd3_1_0_5  ), .dout ( sd3_1_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_2               ( .din0 ( sd3_1_0_6  ), .din1 ( sd3_1_0_7  ), .din2 ( sd3_1_0_8  ), .dout ( sd3_1_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_3               ( .din0 ( sd3_1_0_9  ), .din1 ( sd3_1_0_10 ), .din2 ( sd3_1_0_11 ), .dout ( sd3_1_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_4               ( .din0 ( sd3_1_0_12 ), .din1 ( sd3_1_0_13 ), .din2 ( sd3_1_0_14 ), .dout ( sd3_1_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_5               ( .din0 ( sd3_1_0_15 ), .din1 ( sd3_1_0_16 ), .din2 ( sd3_1_0_17 ), .dout ( sd3_1_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_1_6               ( .din0 ( sd3_1_0_18 ), .din1 ( sd3_1_0_19 ), .din2 ( sd3_1_0_20 ), .dout ( sd3_1_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_2_0               ( .din0 ( sd3_1_1_0  ), .din1 ( sd3_1_1_1  ), .din2 ( sd3_1_1_2  ), .dout ( sd3_1_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_2_1               ( .din0 ( sd3_1_1_3  ), .din1 ( sd3_1_1_4  ), .din2 ( sd3_1_1_5  ), .dout ( sd3_1_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_2_2               ( .din0 ( sd3_1_0_21 ), .din1 ( sd3_1_1_6  ), .din2 ( ecc3_in[1] ), .dout ( sd3_1_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_1_3_0               ( .din0 ( sd3_1_2_0  ), .din1 ( sd3_1_2_1  ), .din2 ( sd3_1_2_2  ), .dout ( syndrome3[1] ));
      
			
//					
//		assign	syndrome3[2] =  d[2]	^	 d[62]	^	 d[122]	^	aparity_1	^	ecc3_in[2]	^
//					d[7]	^
//					d[8] 	^	 d[10] 	^	 d[9]	^
//					d[12]	^
//					d[19] 	^	 d[17]	^
//					d[20] 	^	 d[23] 	^	 d[21] 	^	 d[22]	^
//					d[24] 	^	 d[27] 	^	 d[25]	^
//					d[28] 	^	 d[29]	^
//					d[33]	^
//					d[36] 	^	 d[38]	^
//					d[40] 	^	 d[43] 	^	 d[42]	^
//					d[47] 	^	 d[46] 	^	 d[45]	^
//					d[48] 	^	 d[51]	^
//					d[53] 	^	 d[54]	^
//					d[59] 	^	 d[58]	^
//					d[67]	^
//					d[68] 	^	 d[70] 	^	 d[69]	^
//					d[72]	^
//					d[79] 	^	 d[77]	^
//					d[80] 	^	 d[83] 	^	 d[81] 	^	 d[82]	^
//					d[84] 	^	 d[87] 	^	 d[85]	^
//					d[88] 	^	 d[89]	^
//					d[93]	^
//					d[96] 	^	 d[98]	^
//					d[100] 	^	 d[103] ^	 d[102]	^
//					d[107] 	^	 d[106] ^	 d[105]	^
//					d[108] 	^	 d[111]	^
//					d[113] 	^	 d[114]	^
//					d[118] 	^	 d[119];
//					
//		

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_0               ( .din0 ( d[2]   ),     .din1 ( d[7]   ),     .din2 ( d[8]   ),     .dout ( sd3_2_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_1               ( .din0 ( d[9]   ),     .din1 ( d[10]  ),     .din2 ( d[12]  ),     .dout ( sd3_2_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_2               ( .din0 ( d[17]  ),     .din1 ( d[19]  ),     .din2 ( d[20]  ),     .dout ( sd3_2_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_3               ( .din0 ( d[21]  ),     .din1 ( d[22]  ),     .din2 ( d[23]  ),     .dout ( sd3_2_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_4               ( .din0 ( d[24]  ),     .din1 ( d[25]  ),     .din2 ( d[27]  ),     .dout ( sd3_2_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_5               ( .din0 ( d[28]  ),     .din1 ( d[29]  ),     .din2 ( d[33]  ),     .dout ( sd3_2_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_6               ( .din0 ( d[36]  ),     .din1 ( d[38]  ),     .din2 ( d[40]  ),     .dout ( sd3_2_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_7               ( .din0 ( d[42]  ),     .din1 ( d[43]  ),     .din2 ( d[45]  ),     .dout ( sd3_2_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_8               ( .din0 ( d[46]  ),     .din1 ( d[47]  ),     .din2 ( d[48]  ),     .dout ( sd3_2_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_9               ( .din0 ( d[51]  ),     .din1 ( d[53]  ),     .din2 ( d[54]  ),     .dout ( sd3_2_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_10              ( .din0 ( d[58]  ),     .din1 ( d[59]  ),     .din2 ( d[62]  ),     .dout ( sd3_2_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_11              ( .din0 ( d[67]  ),     .din1 ( d[68]  ),     .din2 ( d[69]  ),     .dout ( sd3_2_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_12              ( .din0 ( d[70]  ),     .din1 ( d[72]  ),     .din2 ( d[77]  ),     .dout ( sd3_2_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_13              ( .din0 ( d[79]  ),     .din1 ( d[80]  ),     .din2 ( d[81]  ),     .dout ( sd3_2_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_14              ( .din0 ( d[82]  ),     .din1 ( d[83]  ),     .din2 ( d[84]  ),     .dout ( sd3_2_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_15              ( .din0 ( d[85]  ),     .din1 ( d[87]  ),     .din2 ( d[88]  ),     .dout ( sd3_2_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_16              ( .din0 ( d[89]  ),     .din1 ( d[93]  ),     .din2 ( d[96]  ),     .dout ( sd3_2_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_17              ( .din0 ( d[98]  ),     .din1 ( d[100] ),     .din2 ( d[102] ),     .dout ( sd3_2_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_18              ( .din0 ( d[103] ),     .din1 ( d[105] ),     .din2 ( d[106] ),     .dout ( sd3_2_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_19              ( .din0 ( d[107] ),     .din1 ( d[108] ),     .din2 ( d[111] ),     .dout ( sd3_2_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_20              ( .din0 ( d[113] ),     .din1 ( d[114] ),     .din2 ( d[118] ),     .dout ( sd3_2_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_0_21              ( .din0 ( d[119]     ), .din1 ( d[122]     ), .din2 ( aparity_1  ), .dout ( sd3_2_0_21  ));
                                                                                
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_0               ( .din0 ( sd3_2_0_0  ), .din1 ( sd3_2_0_1  ), .din2 ( sd3_2_0_2  ), .dout ( sd3_2_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_1               ( .din0 ( sd3_2_0_3  ), .din1 ( sd3_2_0_4  ), .din2 ( sd3_2_0_5  ), .dout ( sd3_2_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_2               ( .din0 ( sd3_2_0_6  ), .din1 ( sd3_2_0_7  ), .din2 ( sd3_2_0_8  ), .dout ( sd3_2_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_3               ( .din0 ( sd3_2_0_9  ), .din1 ( sd3_2_0_10 ), .din2 ( sd3_2_0_11 ), .dout ( sd3_2_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_4               ( .din0 ( sd3_2_0_12 ), .din1 ( sd3_2_0_13 ), .din2 ( sd3_2_0_14 ), .dout ( sd3_2_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_5               ( .din0 ( sd3_2_0_15 ), .din1 ( sd3_2_0_16 ), .din2 ( sd3_2_0_17 ), .dout ( sd3_2_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_1_6               ( .din0 ( sd3_2_0_18 ), .din1 ( sd3_2_0_19 ), .din2 ( sd3_2_0_20 ), .dout ( sd3_2_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_2_0               ( .din0 ( sd3_2_1_0  ), .din1 ( sd3_2_1_1  ), .din2 ( sd3_2_1_2  ), .dout ( sd3_2_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_2_1               ( .din0 ( sd3_2_1_3  ), .din1 ( sd3_2_1_4  ), .din2 ( sd3_2_1_5  ), .dout ( sd3_2_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_2_2               ( .din0 ( sd3_2_0_21 ), .din1 ( sd3_2_1_6  ), .din2 ( ecc3_in[2] ), .dout ( sd3_2_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_2_3_0               ( .din0 ( sd3_2_2_0  ), .din1 ( sd3_2_2_1  ), .din2 ( sd3_2_2_2  ), .dout ( syndrome3[2] ));
      
      
//		
//					
//		assign	syndrome3[3] =  d[3]	^	 d[63]	^	 d[123]	^	aparity_1	^	ecc3_in[3]	^
//					d[4]	^
//					d[8] 	^	 d[11] 	^	 d[9] 	^	 d[10]	^
//					d[12] 	^	 d[13]	^
//					d[16] 	^	 d[18]	^
//					d[21] 	^	 d[22] 	^	 d[23]	^
//					d[25] 	^	 d[26]	^
//					d[28] 	^	 d[29] 	^	 d[30]	^
//					d[34]	^ 
//					d[36] 	^	 d[39] 	^	 d[37]	^
//					d[41] 	^	 d[43]	^
//					d[44] 	^	 d[47] 	^	 d[46]	^
//					d[49]	^
//					d[54] 	^	 d[55]	^
//					d[56] 	^	 d[59]	^
//					d[64]	^
//					d[68] 	^	 d[71] 	^	 d[69] 	^	 d[70]	^
//					d[72] 	^	 d[73]	^
//					d[76] 	^	 d[78]	^
//					d[81] 	^	 d[82] 	^	 d[83]	^
//					d[85] 	^	 d[86]	^
//					d[88] 	^	 d[89] 	^	 d[90]	^
//					d[94]	^ 
//					d[96] 	^	 d[99] 	^	 d[97]	^
//					d[101] 	^	 d[103]	^
//					d[104] 	^	 d[107] ^	 d[106]	^
//					d[109]	^
//					d[114] 	^	 d[115]	^
//					d[116] 	^	 d[119];
//		
//		
      
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_0               ( .din0 ( d[3]   ),     .din1 ( d[4]   ),     .din2 ( d[8]   ),     .dout ( sd3_3_0_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_1               ( .din0 ( d[9]   ),     .din1 ( d[10]  ),     .din2 ( d[11]  ),     .dout ( sd3_3_0_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_2               ( .din0 ( d[12]  ),     .din1 ( d[13]  ),     .din2 ( d[16]  ),     .dout ( sd3_3_0_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_3               ( .din0 ( d[18]  ),     .din1 ( d[21]  ),     .din2 ( d[22]  ),     .dout ( sd3_3_0_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_4               ( .din0 ( d[23]  ),     .din1 ( d[25]  ),     .din2 ( d[26]  ),     .dout ( sd3_3_0_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_5               ( .din0 ( d[28]  ),     .din1 ( d[29]  ),     .din2 ( d[30]  ),     .dout ( sd3_3_0_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_6               ( .din0 ( d[34]  ),     .din1 ( d[36]  ),     .din2 ( d[37]  ),     .dout ( sd3_3_0_6   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_7               ( .din0 ( d[39]  ),     .din1 ( d[41]  ),     .din2 ( d[43]  ),     .dout ( sd3_3_0_7   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_8               ( .din0 ( d[44]  ),     .din1 ( d[46]  ),     .din2 ( d[47]  ),     .dout ( sd3_3_0_8   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_9               ( .din0 ( d[49]  ),     .din1 ( d[54]  ),     .din2 ( d[55]  ),     .dout ( sd3_3_0_9   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_10              ( .din0 ( d[56]  ),     .din1 ( d[59]  ),     .din2 ( d[63]  ),     .dout ( sd3_3_0_10  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_11              ( .din0 ( d[64]  ),     .din1 ( d[68]  ),     .din2 ( d[69]  ),     .dout ( sd3_3_0_11  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_12              ( .din0 ( d[70]  ),     .din1 ( d[71]  ),     .din2 ( d[72]  ),     .dout ( sd3_3_0_12  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_13              ( .din0 ( d[73]  ),     .din1 ( d[76]  ),     .din2 ( d[78]  ),     .dout ( sd3_3_0_13  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_14              ( .din0 ( d[81]  ),     .din1 ( d[82]  ),     .din2 ( d[83]  ),     .dout ( sd3_3_0_14  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_15              ( .din0 ( d[85]  ),     .din1 ( d[86]  ),     .din2 ( d[88]  ),     .dout ( sd3_3_0_15  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_16              ( .din0 ( d[89]  ),     .din1 ( d[90]  ),     .din2 ( d[94]  ),     .dout ( sd3_3_0_16  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_17              ( .din0 ( d[96]  ),     .din1 ( d[97]  ),     .din2 ( d[99]  ),     .dout ( sd3_3_0_17  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_18              ( .din0 ( d[101] ),     .din1 ( d[103] ),     .din2 ( d[104] ),     .dout ( sd3_3_0_18  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_19              ( .din0 ( d[106] ),     .din1 ( d[107] ),     .din2 ( d[109] ),     .dout ( sd3_3_0_19  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_20              ( .din0 ( d[114] ),     .din1 ( d[115] ),     .din2 ( d[116] ),     .dout ( sd3_3_0_20  ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_0_21              ( .din0 ( d[119]     ), .din1 ( d[123]     ), .din2 ( aparity_1  ), .dout ( sd3_3_0_21  ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_0               ( .din0 ( sd3_3_0_0  ), .din1 ( sd3_3_0_1  ), .din2 ( sd3_3_0_2  ), .dout ( sd3_3_1_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_1               ( .din0 ( sd3_3_0_3  ), .din1 ( sd3_3_0_4  ), .din2 ( sd3_3_0_5  ), .dout ( sd3_3_1_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_2               ( .din0 ( sd3_3_0_6  ), .din1 ( sd3_3_0_7  ), .din2 ( sd3_3_0_8  ), .dout ( sd3_3_1_2   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_3               ( .din0 ( sd3_3_0_9  ), .din1 ( sd3_3_0_10 ), .din2 ( sd3_3_0_11 ), .dout ( sd3_3_1_3   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_4               ( .din0 ( sd3_3_0_12 ), .din1 ( sd3_3_0_13 ), .din2 ( sd3_3_0_14 ), .dout ( sd3_3_1_4   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_5               ( .din0 ( sd3_3_0_15 ), .din1 ( sd3_3_0_16 ), .din2 ( sd3_3_0_17 ), .dout ( sd3_3_1_5   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_1_6               ( .din0 ( sd3_3_0_18 ), .din1 ( sd3_3_0_19 ), .din2 ( sd3_3_0_20 ), .dout ( sd3_3_1_6   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_2_0               ( .din0 ( sd3_3_1_0  ), .din1 ( sd3_3_1_1  ), .din2 ( sd3_3_1_2  ), .dout ( sd3_3_2_0   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_2_1               ( .din0 ( sd3_3_1_3  ), .din1 ( sd3_3_1_4  ), .din2 ( sd3_3_1_5  ), .dout ( sd3_3_2_1   ));
mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_2_2               ( .din0 ( sd3_3_0_21 ), .din1 ( sd3_3_1_6  ), .din2 ( ecc3_in[3] ), .dout ( sd3_3_2_2   ));

mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1	u_sd3_3_3_0               ( .din0 ( sd3_3_2_0  ), .din1 ( sd3_3_2_1  ), .din2 ( sd3_3_2_2  ), .dout ( syndrome3[3] ));
      
mcu_eccgen_dp_buff_macro__stack_16l__width_16	u_ecc_buf                        ( .din  ({syndrome0, syndrome1, syndrome2, syndrome3} ),            .dout ( ecc[15:0]   ));

//	assign ecc = {syndrome0, syndrome1, syndrome2, syndrome3};


endmodule


//
//   buff macro
//
//





module mcu_eccgen_dp_buff_macro__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module mcu_eccgen_dp_buff_macro__stack_2l__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_eccgen_dp_xor_macro__dxor_8x__ports_3__width_1 (
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
//   buff macro
//
//





module mcu_eccgen_dp_buff_macro__stack_16l__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule




