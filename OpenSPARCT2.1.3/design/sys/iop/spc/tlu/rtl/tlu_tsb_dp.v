// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_tsb_dp.v
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
module tlu_tsb_dp (
  tsb_in, 
  wr_en_in, 
  ecc_error, 
  tsb_out, 
  wr_en_out);
wire [67:0] evb_in;
wire [67:0] evb_out;
wire [135:0] tsb_ou;
wire [67:0] odb_in;
wire [67:0] odb_out;
wire wr_en_in_;



input	[135:0]	tsb_in;
input		wr_en_in;
input 		ecc_error;

output	[135:0]	tsb_out;
output		wr_en_out;




////////////////////////////////////////////////////////////////////////////////
//
// The compiled SRAM used for the trap stack array is arranged so that
// din[000] is in bit 1
// din[001] is in bit 2
// din[002] is in bit 2
// din[003] is in bit 3
// din[004] is in bit 3
// etc.
// (pre-mirror)
//
// Also, data bits 135:134 wire to SRAM pins 151:150
//       ECC  bits  15:000 wire to SRAM pins 149:134
//       data bits 133:000 wire to SRAM pins 133:000
// The SRAM has its controls between bits 76 and 75

assign evb_in[67:0] =
       {                          tsb_in[134], tsb_in[132], tsb_in[130],
	tsb_in[128], tsb_in[126], tsb_in[124], tsb_in[122], tsb_in[120],
	tsb_in[118], tsb_in[116], tsb_in[114], tsb_in[112], tsb_in[110],
	tsb_in[108], tsb_in[106], tsb_in[104], tsb_in[102], tsb_in[100],
	tsb_in[98], tsb_in[96], tsb_in[94], tsb_in[92], tsb_in[90],
	tsb_in[88], tsb_in[86], tsb_in[84], tsb_in[82], tsb_in[80],
	tsb_in[78], tsb_in[76], tsb_in[74], tsb_in[72], tsb_in[70],
	tsb_in[68], tsb_in[66], tsb_in[64], tsb_in[62], tsb_in[60],
	tsb_in[58], tsb_in[56], tsb_in[54], tsb_in[52], tsb_in[50],
	tsb_in[48], tsb_in[46], tsb_in[44], tsb_in[42], tsb_in[40],
	tsb_in[38], tsb_in[36], tsb_in[34], tsb_in[32], tsb_in[30],
	tsb_in[28], tsb_in[26], tsb_in[24], tsb_in[22], tsb_in[20],
	tsb_in[18], tsb_in[16], tsb_in[14], tsb_in[12], tsb_in[10],
	tsb_in[8], tsb_in[6], tsb_in[4], tsb_in[2], tsb_in[0]};

tlu_tsb_dp_buff_macro__minbuff_1__stack_none__width_68 even_data_bits_buf    (
	.din	(evb_in			[67:0]	),
	.dout	(evb_out  		[67:0]	)
);

assign {                          tsb_ou[134], tsb_ou[132], tsb_ou[130],
	tsb_ou[128], tsb_ou[126], tsb_ou[124], tsb_ou[122], tsb_ou[120],
	tsb_ou[118], tsb_ou[116], tsb_ou[114], tsb_ou[112], tsb_ou[110],
	tsb_ou[108], tsb_ou[106], tsb_ou[104], tsb_ou[102], tsb_ou[100],
	tsb_ou[98], tsb_ou[96], tsb_ou[94], tsb_ou[92], tsb_ou[90],
	tsb_ou[88], tsb_ou[86], tsb_ou[84], tsb_ou[82], tsb_ou[80],
	tsb_ou[78], tsb_ou[76], tsb_ou[74], tsb_ou[72], tsb_ou[70],
	tsb_ou[68], tsb_ou[66], tsb_ou[64], tsb_ou[62], tsb_ou[60],
	tsb_ou[58], tsb_ou[56], tsb_ou[54], tsb_ou[52], tsb_ou[50],
	tsb_ou[48], tsb_ou[46], tsb_ou[44], tsb_ou[42], tsb_ou[40],
	tsb_ou[38], tsb_ou[36], tsb_ou[34], tsb_ou[32], tsb_ou[30],
	tsb_ou[28], tsb_ou[26], tsb_ou[24], tsb_ou[22], tsb_ou[20],
	tsb_ou[18], tsb_ou[16], tsb_ou[14], tsb_ou[12], tsb_ou[10],
	tsb_ou[8], tsb_ou[6], tsb_ou[4], tsb_ou[2], tsb_ou[0]} =
       evb_out[67:0];



assign odb_in[67:0] =
       {                          tsb_in[135], tsb_in[133], tsb_in[131],
	tsb_in[129], tsb_in[127], tsb_in[125], tsb_in[123], tsb_in[121],
	tsb_in[119], tsb_in[117], tsb_in[115], tsb_in[113], tsb_in[111],
	tsb_in[109], tsb_in[107], tsb_in[105], tsb_in[103], tsb_in[101],
	tsb_in[99], tsb_in[97], tsb_in[95], tsb_in[93], tsb_in[91],
	tsb_in[89], tsb_in[87], tsb_in[85], tsb_in[83], tsb_in[81],
	tsb_in[79], tsb_in[77], tsb_in[75], tsb_in[73], tsb_in[71],
	tsb_in[69], tsb_in[67], tsb_in[65], tsb_in[63], tsb_in[61],
	tsb_in[59], tsb_in[57], tsb_in[55], tsb_in[53], tsb_in[51],
	tsb_in[49], tsb_in[47], tsb_in[45], tsb_in[43], tsb_in[41],
	tsb_in[39], tsb_in[37], tsb_in[35], tsb_in[33], tsb_in[31],
	tsb_in[29], tsb_in[27], tsb_in[25], tsb_in[23], tsb_in[21],
	tsb_in[19], tsb_in[17], tsb_in[15], tsb_in[13], tsb_in[11],
	tsb_in[9], tsb_in[7], tsb_in[5], tsb_in[3], tsb_in[1]};

tlu_tsb_dp_buff_macro__minbuff_1__stack_none__width_68 odd_data_bits_buf    (
	.din	(odb_in			[67:0]	),
	.dout	(odb_out  		[67:0]	)
);

assign {                          tsb_ou[135], tsb_ou[133], tsb_ou[131],
	tsb_ou[129], tsb_ou[127], tsb_ou[125], tsb_ou[123], tsb_ou[121],
	tsb_ou[119], tsb_ou[117], tsb_ou[115], tsb_ou[113], tsb_ou[111],
	tsb_ou[109], tsb_ou[107], tsb_ou[105], tsb_ou[103], tsb_ou[101],
	tsb_ou[99], tsb_ou[97], tsb_ou[95], tsb_ou[93], tsb_ou[91],
	tsb_ou[89], tsb_ou[87], tsb_ou[85], tsb_ou[83], tsb_ou[81],
	tsb_ou[79], tsb_ou[77], tsb_ou[75], tsb_ou[73], tsb_ou[71],
	tsb_ou[69], tsb_ou[67], tsb_ou[65], tsb_ou[63], tsb_ou[61],
	tsb_ou[59], tsb_ou[57], tsb_ou[55], tsb_ou[53], tsb_ou[51],
	tsb_ou[49], tsb_ou[47], tsb_ou[45], tsb_ou[43], tsb_ou[41],
	tsb_ou[39], tsb_ou[37], tsb_ou[35], tsb_ou[33], tsb_ou[31],
	tsb_ou[29], tsb_ou[27], tsb_ou[25], tsb_ou[23], tsb_ou[21],
	tsb_ou[19], tsb_ou[17], tsb_ou[15], tsb_ou[13], tsb_ou[11],
	tsb_ou[9], tsb_ou[7], tsb_ou[5], tsb_ou[3], tsb_ou[1]} =
       odb_out[67:0];

assign tsb_out[135:0] =
       tsb_ou[135:0];



// The wr_en should be spaced 3 bits away from bit 76
// wr_en_out = wr_en_in & ~ecc_error = ~(~wr_en_in | ecc_error)

tlu_tsb_dp_inv_macro__stack_2r__width_1 wr_en_in_b_inv   ( // stack=none not supported
	.din	(wr_en_in			),
	.dout	(wr_en_in_  			)
);

tlu_tsb_dp_nor_macro__ports_2__stack_2r__width_1 wr_en_out_nor    (//stack=none not supported
	.din0	(ecc_error			),
	.din1	(wr_en_in_			),
	.dout	(wr_en_out  			)
);





endmodule




//
//   buff macro
//
//





module tlu_tsb_dp_buff_macro__minbuff_1__stack_none__width_68 (
  din, 
  dout);
  input [67:0] din;
  output [67:0] dout;






buff #(68)  d0_0 (
.in(din[67:0]),
.out(dout[67:0])
);








endmodule





//
//   invert macro
//
//





module tlu_tsb_dp_inv_macro__stack_2r__width_1 (
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





module tlu_tsb_dp_nor_macro__ports_2__stack_2r__width_1 (
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




