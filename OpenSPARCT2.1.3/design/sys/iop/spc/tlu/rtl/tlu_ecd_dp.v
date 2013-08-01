// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_ecd_dp.v
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
module tlu_ecd_dp (
  data_in, 
  ecc_in, 
  cerer_ce, 
  cerer_ue, 
  syndrome, 
  cecc_err, 
  uecc_err, 
  uecc_err_);
wire [67:0] d;
wire [7:0] e;
wire [37:0] check0_bus;
wire check0_4;
wire check0_3;
wire check0_2;
wire check0_1;
wire check0_0;
wire c0;
wire [37:0] check1_bus;
wire check1_4;
wire check1_3;
wire check1_2;
wire check1_1;
wire check1_0;
wire c1;
wire [35:0] check2_bus;
wire check2_4;
wire check2_3;
wire check2_2;
wire check2_1;
wire check2_0;
wire c2;
wire [35:0] check3_bus;
wire check3_4;
wire check3_3;
wire check3_2;
wire check3_1;
wire check3_0;
wire c3;
wire [31:0] check4_bus;
wire c4;
wire [31:0] check5_bus;
wire c5;
wire [11:0] check6_bus;
wire c6;
wire [74:0] check7_bus;
wire check7_4;
wire check7_3;
wire check7_2;
wire check7_1;
wire check7_0;
wire c7;
wire [7:7] e_;
wire c7_;
wire parity_incorrect;
wire parity_correct;
wire ecc_err_0;
wire ecc_err_1;
wire ecc_err_2;
wire ecc_err;



input	[67:0]	data_in;	// Used for generation and checking
input	[7:0]	ecc_in;		// Used for checking only
input		cerer_ce;
input		cerer_ue;

output	[7:0]	syndrome;	// Used for generation and checking
output		cecc_err;	// Used for checking only; unused for gen
output		uecc_err;	// Used for checking only; unused for gen
output		uecc_err_;	// Used for checking only; unused for gen



//////////////////////////////////////////////////////////////////////////////

// Position	Binary	
//	 1	0000001	C0
//	 2	0000010	C1
//	 3	0000011	D0
//
//	 4	0000100	C2
//	 5	0000101	D1
//	 6	0000110	D2
//	 7	0000111	D3
//			
//	 8 	0001000	C3
//	 9	0001001	D4
//	10	0001010	D5
//	11	0001011 D6
//	12	0001100	D7
//	...		...
//	15	0001111	D10
//			
//	16	0010000	C4
//	17	0010001	D11
//	...		...
//	20	0010100 D14
//	...		...
//	24	0011000	D18
//	...		...
//	28	0011100	D22
//	...		...
//	31	0011111	D25
//			
//	32	0100000	C5
//	33	0100001	D26
//	...		...
//	36	0100100	D29
//	...		...
//	40	0101000	D33
//	...		...
//	44	0101100	D37
//	...		...
//	48	0110000	D41
//	...		...
//	52	0110100	D45
//	...		...
//	56	0111000	D49
//	...		...
//	60	0111100	D53
//	...		...
//	63	0111111	D56
//			
//	64	1000000	C6
//	65	1000001	D57
//	...		...
//	68	1000100	D60
//	...		...
//	72	1001000	D64
//	73	1001001	D65
//	74	1001010	D66
//	75	1001011	D67
//			
//	76	1001100	C7

assign d[67:0] = 
       data_in[67:0];
assign e[7:0] =
       ecc_in[7:0];



// All odd positions (LSB of position set)
assign check0_bus[37:0] = 
	{d[67], d[65], d[63], d[61], d[59], d[57], 
	 d[56], d[54], d[52], d[50], d[48], d[46], d[44], d[42], 
	 d[40], d[38], d[36], d[34], d[32], d[30], d[28], d[26], 
	 d[25], d[23], d[21], d[19], d[17], d[15], d[13], d[11], 
	 d[10], d[8], d[6], d[4], 
	 d[3], d[1],
	 d[0], 
	 e[0]};

tlu_ecd_dp_prty_macro__width_8 check0_4_pty  (
	.din	(check0_bus	[37:30]	),
	.dout	(check0_4		)
);

tlu_ecd_dp_prty_macro__width_8 check0_3_pty  (
	.din	(check0_bus	[29:22]	),
	.dout	(check0_3		)
);

tlu_ecd_dp_prty_macro__width_8 check0_2_pty  (
	.din	(check0_bus	[21:14]	),
	.dout	(check0_2		)
);

tlu_ecd_dp_prty_macro__width_8 check0_1_pty  (
	.din	(check0_bus	[13:6]	),
	.dout	(check0_1		)
);

tlu_ecd_dp_prty_macro__width_8 check0_0_pty  (
	.din	({check0_bus	[5:0],
		  {2 {1'b0}}	       }),
	.dout	(check0_0		)
);

tlu_ecd_dp_prty_macro__width_8 check0_pty  (
	.din	({check0_4	       ,
		  check0_3	       ,
		  check0_2	       ,
		  check0_1	       ,
		  check0_0	       ,
		  {3 {1'b0}}	       }),
	.dout	(c0			)
);



// All positions with secondmost LSB set
assign check1_bus[37:0] =
       {d[67:66], d[63:62], d[59:58], 
        d[56:55], d[52:51], d[48:47], d[44:43],
        d[40:39], d[36:35], d[32:31], d[28:27],
        d[25:24], d[21:20], d[17:16], d[13:12],
        d[10:9], d[6:5], 
        d[3:2],
        d[0],
        e[1]};

tlu_ecd_dp_prty_macro__width_8 check1_4_pty  (
	.din	(check1_bus	[37:30]	),
	.dout	(check1_4		)
);

tlu_ecd_dp_prty_macro__width_8 check1_3_pty  (
	.din	(check1_bus	[29:22]	),
	.dout	(check1_3		)
);

tlu_ecd_dp_prty_macro__width_8 check1_2_pty  (
	.din	(check1_bus	[21:14]	),
	.dout	(check1_2		)
);

tlu_ecd_dp_prty_macro__width_8 check1_1_pty  (
	.din	(check1_bus	[13:6]	),
	.dout	(check1_1		)
);

tlu_ecd_dp_prty_macro__width_8 check1_0_pty  (
	.din	({check1_bus	[5:0],
		  {2 {1'b0}}	       }),
	.dout	(check1_0		)
);

tlu_ecd_dp_prty_macro__width_8 check1_pty  (
	.din	({check1_0	       ,
		  check1_1	       ,
		  check1_2	       ,
		  check1_3	       ,
		  check1_4	       ,
		  {3 {1'b0}}	       }),
	.dout	(c1			)
);



// All positions with thirdmost LSB set
assign check2_bus[35:0] =
       {d[63:60],
        d[56:53], d[48:45], d[40:37], d[32:29], 
        d[25:22], d[17:14],
        d[10:7],
        d[3:1],
	e[2]};

tlu_ecd_dp_prty_macro__width_8 check2_4_pty  (
	.din	({1'b0,
		  check2_bus	[35:29]}),
	.dout	(check2_4		)
);

tlu_ecd_dp_prty_macro__width_8 check2_3_pty  (
	.din	(check2_bus	[28:21]	),
	.dout	(check2_3		)
);

tlu_ecd_dp_prty_macro__width_8 check2_2_pty  (
	.din	(check2_bus	[20:13]	),
	.dout	(check2_2		)
);

tlu_ecd_dp_prty_macro__width_8 check2_1_pty  (
	.din	(check2_bus	[12:5]	),
	.dout	(check2_1		)
);

tlu_ecd_dp_prty_macro__width_8 check2_0_pty  (
	.din	({check2_bus	[4:0],
		  {3 {1'b0}}	       }),
	.dout	(check2_0		)
);

tlu_ecd_dp_prty_macro__width_8 check2_pty  (
	.din	({check2_0	       ,
		  check2_1	       ,
		  check2_2	       ,
		  check2_3	       ,
		  check2_4	       ,
		  {3 {1'b0}}	       }),
	.dout	(c2			)
);



// All positions with fourthmost LSB set
assign check3_bus[35:0] =
       {d[67:64],
        d[56:49], d[40:33], 
        d[25:18],
        d[10:4],
	e[3]};

tlu_ecd_dp_prty_macro__width_8 check3_4_pty  (
	.din	({{1 {1'b0}}	       ,
		  check3_bus	[35:29]}),
	.dout	(check3_4		)
);

tlu_ecd_dp_prty_macro__width_8 check3_3_pty  (
	.din	(check3_bus	[28:21]	),
	.dout	(check3_3		)
);

tlu_ecd_dp_prty_macro__width_8 check3_2_pty  (
	.din	(check3_bus	[20:13]	),
	.dout	(check3_2		)
);

tlu_ecd_dp_prty_macro__width_8 check3_1_pty  (
	.din	(check3_bus	[12:5]	),
	.dout	(check3_1		)
);

tlu_ecd_dp_prty_macro__width_8 check3_0_pty  (
	.din	({check3_bus	[4:0],
		  {3 {1'b0}}	       }),
	.dout	(check3_0		)
);

tlu_ecd_dp_prty_macro__width_8 check3_pty  (
	.din	({check3_0	       ,
		  check3_1	       ,
		  check3_2	       ,
		  check3_3	       ,
		  check3_4	       ,
		  {3 {1'b0}}	       }),
	.dout	(c3			)
);


// All positions with fifthmost LSB set
assign check4_bus[31:0] =
       {d[56:41],
        d[25:11],
	e[4]};

tlu_ecd_dp_prty_macro__width_32 check4_pty  (
	.din	(check4_bus	[31:0]	),
	.dout	(c4			)
);



// All positions with sixthmost LSB set
assign check5_bus[31:0] =
       {d[56:26], 
	e[5]};

tlu_ecd_dp_prty_macro__width_32 check5_pty  (
	.din	(check5_bus	[31:0]	),
	.dout	(c5			)
);



// All positions with seventhmost LSB set
assign check6_bus[11:0] =
       {d[67:57],
	e[6]};

tlu_ecd_dp_prty_macro__width_16 check6_pty  (
	.din	({{4 {1'b0}}	       ,
		  check6_bus	[11:0]}),
	.dout	(c6			)
);



// Parity of the whole word (including ECC bits)
// Then xnor with e[07] to check the parity
// (or in this case, xor with e[07] to get miscompare)
assign check7_bus[74:0] =
      {d[67:0], e[6:0]};

tlu_ecd_dp_prty_macro__width_16 check7_4_pty  (
	.din	({{5 {1'b0}}	       ,
		  check7_bus	[74:64]}),
	.dout	(check7_4		)
);

tlu_ecd_dp_prty_macro__width_16 check7_3_pty  (
	.din	(check7_bus	[63:48]	),
	.dout	(check7_3		)
);

tlu_ecd_dp_prty_macro__width_16 check7_2_pty  (
	.din	(check7_bus	[47:32]	),
	.dout	(check7_2		)
);

tlu_ecd_dp_prty_macro__width_16 check7_1_pty  (
	.din	(check7_bus	[31:16]	),
	.dout	(check7_1		)
);

tlu_ecd_dp_prty_macro__width_16 check7_0_pty  (
	.din	(check7_bus	[15:0]	),
	.dout	(check7_0		)
);

tlu_ecd_dp_prty_macro__width_8 check7_inv_pty  (
	.din	({{2 {1'b0}}	      ,
		  e		[7   ],
		  check7_0	       ,
		  check7_1	       ,
		  check7_2	       ,
		  check7_3	       ,
		  check7_4	       }),
	.dout	(c7			)
);

tlu_ecd_dp_inv_macro__width_1 e7_inv  (
	.din	(e		[7   ]	),
	.dout	(e_		[7   ]	)
);

tlu_ecd_dp_prty_macro__width_8 check7_pty  (
	.din	({{2 {1'b0}}	      ,
		  e_		[7   ],
		  check7_0	       ,
		  check7_1	       ,
		  check7_2	       ,
		  check7_3	       ,
		  check7_4	       }),
	.dout	(c7_			)
);

assign parity_incorrect =
       c7;

assign parity_correct =
       c7_;


assign syndrome[7:0] = 
       {c7, c6, c5, c4, c3, c2, c1, c0};



// If the syndrome is zero and overall parity is correct, then no errors

// If overall parity is incorrect, then correctable
//assign cecc_err =
//       c7;
// If overall parity is correct and the syndrome is nonzero, then uncorrectable
//assign uecc_err =
//       (| ecc_out[06:00]) & ~c7;
// Also need to factor in CERER bits

tlu_ecd_dp_nor_macro__ports_3__width_1 ecc_err_2_nor   (
	.din0	(syndrome	[6]	),
	.din1	(syndrome	[5]	),
	.din2	(syndrome	[4]	),
	.dout	(ecc_err_0		)
);

tlu_ecd_dp_nor_macro__ports_2__width_1 ecc_err_1_nor   (
	.din0	(syndrome	[3]	),
	.din1	(syndrome	[2]	),
	.dout	(ecc_err_1		)
);

tlu_ecd_dp_nor_macro__ports_2__width_1 ecc_err_0_nor   (
	.din0	(syndrome	[1]	),
	.din1	(syndrome	[0]	),
	.dout	(ecc_err_2		)
);

tlu_ecd_dp_nand_macro__ports_3__width_1 ecc_err_nand   (
	.din0	(ecc_err_0		),
	.din1	(ecc_err_1		),
	.din2	(ecc_err_2		),
	.dout	(ecc_err		)
);

tlu_ecd_dp_and_macro__ports_2__width_1 cecc_err_and   (
 	.din0	(parity_incorrect	),
 	.din1	(cerer_ce		),
	.dout	(cecc_err		)
);

tlu_ecd_dp_and_macro__ports_3__width_1 uecc_err_and   (
	.din0	(ecc_err		),
 	.din1	(parity_correct		),
 	.din2	(cerer_ue		),
	.dout	(uecc_err		)
);

tlu_ecd_dp_nand_macro__ports_3__width_1 uecc_err_nand   (
	.din0	(ecc_err		),
 	.din1	(parity_correct		),
 	.din2	(cerer_ue		),
	.dout	(uecc_err_		)
);


supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//
//   parity macro (even parity)
//
//





module tlu_ecd_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module tlu_ecd_dp_prty_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module tlu_ecd_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module tlu_ecd_dp_inv_macro__width_1 (
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
//   nor macro for ports = 2,3
//
//





module tlu_ecd_dp_nor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
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





module tlu_ecd_dp_nor_macro__ports_2__width_1 (
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
//   nand macro for ports = 2,3,4
//
//





module tlu_ecd_dp_nand_macro__ports_3__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module tlu_ecd_dp_and_macro__ports_2__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module tlu_ecd_dp_and_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






and3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);









endmodule




