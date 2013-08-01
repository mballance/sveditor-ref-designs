// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cpx_ob1_dp.v
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
`ifndef FPGA
module cpx_ob1_dp (
  cpx_spc_data_cx2, 
  cpx_spc_data_cx2_prebuf);
wire [145:0] in;
wire [145:0] in_swz;
wire [145:0] in_px2;
wire [145:0] out_swz;


output [145:0] cpx_spc_data_cx2;

input [145:0] cpx_spc_data_cx2_prebuf;


assign in[145:0] = cpx_spc_data_cx2_prebuf[145:0];
assign in_swz[72:0] =     {
                           in[144],in[142],in[140],
                           in[138],in[136],in[134],in[132],in[130],in[128],in[126],in[124],in[122],in[120],
                           in[118],in[116],in[114],in[112],in[110],in[108],in[106],in[104],in[102],in[100],
                           in[98],in[96],in[94],in[92],in[90],in[88],in[86],in[84],in[82],in[80],
                           in[78],in[76],in[74],in[72],in[70],in[68],in[66],in[64],in[62],in[60],
                           in[58],in[56],in[54],in[52],in[50],in[48],in[46],in[44],in[42],in[40],
                           in[38],in[36],in[34],in[32],in[30],in[28],in[26],in[24],in[22],in[20],
                           in[18],in[16],in[14],in[12],in[10],in[8],in[6],in[4],in[2],in[0]
                           };



assign in_swz[145:73] =   {
                           in[145],in[143],in[141],
                           in[139],in[137],in[135],in[133],in[131],in[129],in[127],in[125],in[123],in[121],
                           in[119],in[117],in[115],in[113],in[111],in[109],in[107],in[105],in[103],in[101],
                           in[99],in[97],in[95],in[93],in[91],in[89],in[87],in[85],in[83],in[81],
                           in[79],in[77],in[75],in[73],in[71],in[69],in[67],in[65],in[63],in[61],
                           in[59],in[57],in[55],in[53],in[51],in[49],in[47],in[45],in[43],in[41],
                           in[39],in[37],in[35],in[33],in[31],in[29],in[27],in[25],in[23],in[21],
                           in[19],in[17],in[15],in[13],in[11],in[9],in[7],in[5],in[3],in[1]
                           };


cpx_ob1_dp_buff_macro__dbuff_32x__rep_1__stack_74c__width_73 i_buf_data_0     (
	.din	({in_swz[72:0] }),
	.dout	({in_px2[72:0]})
);

cpx_ob1_dp_buff_macro__dbuff_32x__rep_1__stack_74c__width_73 i_buf_data_1     (
	.din	({in_swz[145:73]}),
	.dout	({in_px2[145:73]})
);


assign {
        out_swz[144],out_swz[142],out_swz[140],
        out_swz[138],out_swz[136],out_swz[134],out_swz[132],out_swz[130],out_swz[128],out_swz[126],out_swz[124],out_swz[122],out_swz[120],
        out_swz[118],out_swz[116],out_swz[114],out_swz[112],out_swz[110],out_swz[108],out_swz[106],out_swz[104],out_swz[102],out_swz[100],
        out_swz[98],out_swz[96],out_swz[94],out_swz[92],out_swz[90],out_swz[88],out_swz[86],out_swz[84],out_swz[82],out_swz[80],
        out_swz[78],out_swz[76],out_swz[74],out_swz[72],out_swz[70],out_swz[68],out_swz[66],out_swz[64],out_swz[62],out_swz[60],
        out_swz[58],out_swz[56],out_swz[54],out_swz[52],out_swz[50],out_swz[48],out_swz[46],out_swz[44],out_swz[42],out_swz[40],
        out_swz[38],out_swz[36],out_swz[34],out_swz[32],out_swz[30],out_swz[28],out_swz[26],out_swz[24],out_swz[22],out_swz[20],
        out_swz[18],out_swz[16],out_swz[14],out_swz[12],out_swz[10],out_swz[8],out_swz[6],out_swz[4],out_swz[2],out_swz[0]
        } = in_px2[72:0];



assign {
        out_swz[145],out_swz[143],out_swz[141],
        out_swz[139],out_swz[137],out_swz[135],out_swz[133],out_swz[131],out_swz[129],out_swz[127],out_swz[125],out_swz[123],out_swz[121],
        out_swz[119],out_swz[117],out_swz[115],out_swz[113],out_swz[111],out_swz[109],out_swz[107],out_swz[105],out_swz[103],out_swz[101],
        out_swz[99],out_swz[97],out_swz[95],out_swz[93],out_swz[91],out_swz[89],out_swz[87],out_swz[85],out_swz[83],out_swz[81],
        out_swz[79],out_swz[77],out_swz[75],out_swz[73],out_swz[71],out_swz[69],out_swz[67],out_swz[65],out_swz[63],out_swz[61],
        out_swz[59],out_swz[57],out_swz[55],out_swz[53],out_swz[51],out_swz[49],out_swz[47],out_swz[45],out_swz[43],out_swz[41],
        out_swz[39],out_swz[37],out_swz[35],out_swz[33],out_swz[31],out_swz[29],out_swz[27],out_swz[25],out_swz[23],out_swz[21],
        out_swz[19],out_swz[17],out_swz[15],out_swz[13],out_swz[11],out_swz[9],out_swz[7],out_swz[5],out_swz[3],out_swz[1]
        } = in_px2[145:73];


assign cpx_spc_data_cx2[145:0] = out_swz[145:0];

endmodule // cpx_bfs_dp


//
//   buff macro
//
//





module cpx_ob1_dp_buff_macro__dbuff_32x__rep_1__stack_74c__width_73 (
  din, 
  dout);
  input [72:0] din;
  output [72:0] dout;






buff #(73)  d0_0 (
.in(din[72:0]),
.out(dout[72:0])
);








endmodule


`endif // `ifndef FPGA

`ifdef FPGA
`timescale 1 ns / 100 ps
module cpx_ob1_dp(cpx_spc_data_cx2, cpx_spc_data_cx2_prebuf);

	output	[145:0]		cpx_spc_data_cx2;
	input	[145:0]		cpx_spc_data_cx2_prebuf;

	wire	[145:0]		in;
	wire	[145:0]		in_swz;
	wire	[145:0]		in_px2;
	wire	[145:0]		out_swz;

	assign in[145:0] = cpx_spc_data_cx2_prebuf[145:0];
	assign in_swz[72:0] = {in[144], in[142], in[140], in[138], in[136], 
		in[134], in[132], in[130], in[128], in[126], in[124], in[122], 
		in[120], in[118], in[116], in[114], in[112], in[110], in[108], 
		in[106], in[104], in[102], in[100], in[98], in[96], in[94], 
		in[92], in[90], in[88], in[86], in[84], in[82], in[80], in[78], 
		in[76], in[74], in[72], in[70], in[68], in[66], in[64], in[62], 
		in[60], in[58], in[56], in[54], in[52], in[50], in[48], in[46], 
		in[44], in[42], in[40], in[38], in[36], in[34], in[32], in[30], 
		in[28], in[26], in[24], in[22], in[20], in[18], in[16], in[14], 
		in[12], in[10], in[8], in[6], in[4], in[2], in[0]};
	assign in_swz[145:73] = {in[145], in[143], in[141], in[139], in[137], 
		in[135], in[133], in[131], in[129], in[127], in[125], in[123], 
		in[121], in[119], in[117], in[115], in[113], in[111], in[109], 
		in[107], in[105], in[103], in[101], in[99], in[97], in[95], 
		in[93], in[91], in[89], in[87], in[85], in[83], in[81], in[79], 
		in[77], in[75], in[73], in[71], in[69], in[67], in[65], in[63], 
		in[61], in[59], in[57], in[55], in[53], in[51], in[49], in[47], 
		in[45], in[43], in[41], in[39], in[37], in[35], in[33], in[31], 
		in[29], in[27], in[25], in[23], in[21], in[19], in[17], in[15], 
		in[13], in[11], in[9], in[7], in[5], in[3], in[1]};
	assign {out_swz[144], out_swz[142], out_swz[140], out_swz[138], 
		out_swz[136], out_swz[134], out_swz[132], out_swz[130], 
		out_swz[128], out_swz[126], out_swz[124], out_swz[122], 
		out_swz[120], out_swz[118], out_swz[116], out_swz[114], 
		out_swz[112], out_swz[110], out_swz[108], out_swz[106], 
		out_swz[104], out_swz[102], out_swz[100], out_swz[98], 
		out_swz[96], out_swz[94], out_swz[92], out_swz[90], out_swz[88],
		out_swz[86], out_swz[84], out_swz[82], out_swz[80], out_swz[78],
		out_swz[76], out_swz[74], out_swz[72], out_swz[70], out_swz[68],
		out_swz[66], out_swz[64], out_swz[62], out_swz[60], out_swz[58],
		out_swz[56], out_swz[54], out_swz[52], out_swz[50], out_swz[48],
		out_swz[46], out_swz[44], out_swz[42], out_swz[40], out_swz[38],
		out_swz[36], out_swz[34], out_swz[32], out_swz[30], out_swz[28],
		out_swz[26], out_swz[24], out_swz[22], out_swz[20], out_swz[18],
		out_swz[16], out_swz[14], out_swz[12], out_swz[10], out_swz[8], 
		out_swz[6], out_swz[4], out_swz[2], out_swz[0]} = in_px2[72:0];
	assign {out_swz[145], out_swz[143], out_swz[141], out_swz[139], 
		out_swz[137], out_swz[135], out_swz[133], out_swz[131], 
		out_swz[129], out_swz[127], out_swz[125], out_swz[123], 
		out_swz[121], out_swz[119], out_swz[117], out_swz[115], 
		out_swz[113], out_swz[111], out_swz[109], out_swz[107], 
		out_swz[105], out_swz[103], out_swz[101], out_swz[99], 
		out_swz[97], out_swz[95], out_swz[93], out_swz[91], out_swz[89],
		out_swz[87], out_swz[85], out_swz[83], out_swz[81], out_swz[79],
		out_swz[77], out_swz[75], out_swz[73], out_swz[71], out_swz[69],
		out_swz[67], out_swz[65], out_swz[63], out_swz[61], out_swz[59],
		out_swz[57], out_swz[55], out_swz[53], out_swz[51], out_swz[49],
		out_swz[47], out_swz[45], out_swz[43], out_swz[41], out_swz[39],
		out_swz[37], out_swz[35], out_swz[33], out_swz[31], out_swz[29],
		out_swz[27], out_swz[25], out_swz[23], out_swz[21], out_swz[19],
		out_swz[17], out_swz[15], out_swz[13], out_swz[11], out_swz[9], 
		out_swz[7], out_swz[5], out_swz[3], out_swz[1]} = in_px2[145:73]
		;
	assign cpx_spc_data_cx2[145:0] = out_swz[145:0];

	buff_macro__dbuff_32x__rep_1__stack_74c__width_73 i_buf_data_0(
		.din				({in_swz[72:0]}), 
		.dout				({in_px2[72:0]}));
	buff_macro__dbuff_32x__rep_1__stack_74c__width_73 i_buf_data_1(
		.din				({in_swz[145:73]}), 
		.dout				({in_px2[145:73]}));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_74c__width_73(din, dout);

        input   [72:0]          din;
        output  [72:0]          dout;

        buff #(73) d0_0(
                .in                             (din[72:0]),
                .out                            (dout[72:0]));
endmodule



`endif // `ifdef FPGA

