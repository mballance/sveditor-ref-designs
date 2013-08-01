// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_seg_dp.v
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
module mmu_seg_dp (
  data_in, 
  ecc_out);
wire [66:0] d;
wire [35:0] check0_bus;
wire check0_3;
wire check0_2;
wire check0_1;
wire check0_0;
wire c0;
wire [35:0] check1_bus;
wire check1_3;
wire check1_2;
wire check1_1;
wire check1_0;
wire c1;
wire [34:0] check2_bus;
wire check2_3;
wire check2_2;
wire check2_1;
wire check2_0;
wire c2;
wire [33:0] check3_bus;
wire check3_3;
wire check3_2;
wire check3_1;
wire check3_0;
wire c3;
wire [30:0] check4_bus;
wire c4;
wire [30:0] check5_bus;
wire c5;
wire [9:0] check6_bus;
wire c6;
wire [35:0] check7_bus;
wire check7_3;
wire check7_2;
wire check7_1;
wire check7_0;
wire c7;



input	[66:0]	data_in;	// Used for generation and checking

output	[7:0]	ecc_out;	// Used for generation and checking



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
//			
//	75	1001011	C7

assign d[66:0] = 
       data_in[66:0];



// All odd positions (LSB of position set)
assign check0_bus[35:0] = 
	{d[65], d[63], d[61], d[59], d[57], 
	 d[56], d[54], d[52], d[50], d[48], d[46], d[44], d[42], 
	 d[40], d[38], d[36], d[34], d[32], d[30], d[28], d[26], 
	 d[25], d[23], d[21], d[19], d[17], d[15], d[13], d[11], 
	 d[10], d[8], d[6], d[4], 
	 d[3], d[1],
	 d[0]};

mmu_seg_dp_prty_macro__width_8 check0_3_pty  (
	.din	(check0_bus	[31:24]	),
	.dout	(check0_3		)
);

mmu_seg_dp_prty_macro__width_8 check0_2_pty  (
	.din	(check0_bus	[23:16]	),
	.dout	(check0_2		)
);

mmu_seg_dp_prty_macro__width_8 check0_1_pty  (
	.din	(check0_bus	[15:8]	),
	.dout	(check0_1		)
);

mmu_seg_dp_prty_macro__width_8 check0_0_pty  (
	.din	(check0_bus	[7:0]	),
	.dout	(check0_0		)
);

mmu_seg_dp_prty_macro__width_8 check0_pty  (
	.din	({check0_bus	[35:32],
		  check0_3	       ,
		  check0_2	       ,
		  check0_1	       ,
		  check0_0	       }),
	.dout	(c0			)
);



// All positions with secondmost LSB set
assign check1_bus[35:0] =
       {d[66   ], d[63:62], d[59:58], 
        d[56:55], d[52:51], d[48:47], d[44:43],
        d[40:39], d[36:35], d[32:31], d[28:27],
        d[25:24], d[21:20], d[17:16], d[13:12],
        d[10:9], d[6:5], 
        d[3:2],
        d[0]};

mmu_seg_dp_prty_macro__width_8 check1_3_pty  (
	.din	(check1_bus	[31:24]	),
	.dout	(check1_3		)
);

mmu_seg_dp_prty_macro__width_8 check1_2_pty  (
	.din	(check1_bus	[23:16]	),
	.dout	(check1_2		)
);

mmu_seg_dp_prty_macro__width_8 check1_1_pty  (
	.din	(check1_bus	[15:8]	),
	.dout	(check1_1		)
);

mmu_seg_dp_prty_macro__width_8 check1_0_pty  (
	.din	(check1_bus	[7:0]	),
	.dout	(check1_0		)
);

mmu_seg_dp_prty_macro__width_8 check1_pty  (
	.din	({check1_bus	[35:32],
		  check1_3	       ,
		  check1_2	       ,
		  check1_1	       ,
		  check1_0	       }),
	.dout	(c1			)
);



// All positions with thirdmost LSB set
assign check2_bus[34:0] =
       {d[63:60],
        d[56:53], d[48:45], d[40:37], d[32:29], 
        d[25:22], d[17:14],
        d[10:7],
        d[3:1]};

mmu_seg_dp_prty_macro__width_8 check2_3_pty  (
	.din	(check2_bus	[31:24]	),
	.dout	(check2_3		)
);

mmu_seg_dp_prty_macro__width_8 check2_2_pty  (
	.din	(check2_bus	[23:16]	),
	.dout	(check2_2		)
);

mmu_seg_dp_prty_macro__width_8 check2_1_pty  (
	.din	(check2_bus	[15:8]	),
	.dout	(check2_1		)
);

mmu_seg_dp_prty_macro__width_8 check2_0_pty  (
	.din	(check2_bus	[7:0]	),
	.dout	(check2_0		)
);

mmu_seg_dp_prty_macro__width_8 check2_pty  (
	.din	({{1 {1'b0}}	       ,
		  check2_bus	[34:32],
		  check2_3	       ,
		  check2_2	       ,
		  check2_1	       ,
		  check2_0	       }),
	.dout	(c2			)
);



// All positions with fourthmost LSB set
assign check3_bus[33:0] =
       {d[66:64],
        d[56:49], d[40:33], 
        d[25:18],
        d[10:4]};

mmu_seg_dp_prty_macro__width_8 check3_3_pty  (
	.din	(check3_bus	[31:24]	),
	.dout	(check3_3		)
);

mmu_seg_dp_prty_macro__width_8 check3_2_pty  (
	.din	(check3_bus	[23:16]	),
	.dout	(check3_2		)
);

mmu_seg_dp_prty_macro__width_8 check3_1_pty  (
	.din	(check3_bus	[15:8]	),
	.dout	(check3_1		)
);

mmu_seg_dp_prty_macro__width_8 check3_0_pty  (
	.din	(check3_bus	[7:0]	),
	.dout	(check3_0		)
);

mmu_seg_dp_prty_macro__width_8 check3_pty  (
	.din	({{2 {1'b0}}	       ,
		  check3_bus	[33:32],
		  check3_3	       ,
		  check3_2	       ,
		  check3_1	       ,
		  check3_0	       }),
	.dout	(c3			)
);


// All positions with fifthmost LSB set
assign check4_bus[30:0] =
       {d[56:41],
        d[25:11]};

mmu_seg_dp_prty_macro__width_32 check4_pty  (
	.din	({{1 {1'b0}}	       ,
		  check4_bus	[30:0]}),
	.dout	(c4			)
);



// All positions with sixthmost LSB set
assign check5_bus[30:0] =
       {d[56:26]};

mmu_seg_dp_prty_macro__width_32 check5_pty  (
	.din	({{1 {1'b0}}	       ,
		  check5_bus	[30:0]}),
	.dout	(c5			)
);



// All positions with seventhmost LSB set
assign check6_bus[9:0] =
       {d[66:57]};

mmu_seg_dp_prty_macro__width_16 check6_pty  (
	.din	({{6 {1'b0}}	       ,
		  check6_bus	[9:0]}),
	.dout	(c6			)
);



// Parity of the whole word (including check bits)
//assign check7_bus[73:00] =
//      {d[66:00], c0, c1, c2, c3, c4, c5, c6};
// But in generation this simplifies to
//	(all d bits with even parity binary positions)

assign check7_bus[35:0] =
//	  72     71     68     66     65     63     60     58     57
       {d[64], d[63], d[60], d[58], d[57], d[56], d[53], d[51], d[50],
//        54     53     51     48     46     45     43     40     39     
	d[47], d[46], d[44], d[41], d[39], d[38], d[36], d[33], d[32],
//	  36     34     33     30     29     27     24     23     20
	d[29], d[27], d[26], d[24], d[23], d[21], d[18], d[17], d[14],
//        18     17     15     12     10      9      6      5      3
	d[12], d[11], d[10], d[7], d[5], d[4], d[2], d[1], d[0]};

mmu_seg_dp_prty_macro__width_8 check7_3_pty  (
	.din	(check7_bus	[31:24]	),
	.dout	(check7_3		)
);

mmu_seg_dp_prty_macro__width_8 check7_2_pty  (
	.din	(check7_bus	[23:16]	),
	.dout	(check7_2		)
);

mmu_seg_dp_prty_macro__width_8 check7_1_pty  (
	.din	(check7_bus	[15:8]	),
	.dout	(check7_1		)
);

mmu_seg_dp_prty_macro__width_8 check7_0_pty  (
	.din	(check7_bus	[7:0]	),
	.dout	(check7_0		)
);

mmu_seg_dp_prty_macro__width_8 check7_pty  (
	.din	({check7_bus	[35:32],
		  check7_3	       ,
		  check7_2	       ,
		  check7_1	       ,
		  check7_0	       }),
	.dout	(c7			)
);

assign ecc_out[7:0] = 
       {c7, c6, c5, c4, c3, c2, c1, c0};




supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

endmodule



//
//   parity macro (even parity)
//
//





module mmu_seg_dp_prty_macro__width_8 (
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





module mmu_seg_dp_prty_macro__width_32 (
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





module mmu_seg_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule




