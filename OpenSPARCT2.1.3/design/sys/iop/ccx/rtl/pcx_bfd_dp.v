// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx_bfd_dp.v
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
module pcx_bfd_dp (
  pcx_sctag_data_px2, 
  pcx_scache_data_px_, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out, 
  ccx_aclk_out, 
  ccx_bclk_out, 
  tcu_pce_ov_out, 
  tcu_scan_en_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire [129:0] in;
wire [129:0] in_swz;
wire i_dff_data_0_scanin;
wire i_dff_data_0_scanout;
wire [9:0] in_unused_x2;
wire [129:0] in_x2;
wire i_dff_data_1_scanin;
wire i_dff_data_1_scanout;
wire i_dff_data_2_scanin;
wire i_dff_data_2_scanout;
wire i_dff_data_3_scanin;
wire i_dff_data_3_scanout;
wire [129:0] in_px2;
wire [9:0] in_unused;
wire [129:0] out_swz;
wire scan_out_prebuf;


output [129:0] pcx_sctag_data_px2;

input [129:0] pcx_scache_data_px_;

// globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// buffer the high fanout nets
output          ccx_aclk_out;
output          ccx_bclk_out;
output          tcu_pce_ov_out;
output          tcu_scan_en_out;

// scan renames
assign pce_ov = tcu_pce_ov_out;
assign stop = 1'b0;
assign siclk = ccx_aclk_out;
assign soclk = ccx_bclk_out;
assign se = tcu_scan_en_out ;
// end scan

pcx_bfd_dp_buff_macro__dbuff_8x__stack_none__width_4 buf_hfn    (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_out,ccx_bclk_out,tcu_pce_ov_out,tcu_scan_en_out})
);

assign in[129:0] = pcx_scache_data_px_[129:0];


assign in_swz[64:0] =     {
                           in[128],in[126],in[124],in[122],in[120],
                           in[118],in[116],in[114],in[112],in[110],in[108],in[106],in[104],in[102],in[100],
                           in[98],in[96],in[94],in[92],in[90],in[88],in[86],in[84],in[82],in[80],
                           in[78],in[76],in[74],in[72],in[70],in[68],in[66],in[64],in[62],in[60],
                           in[58],in[56],in[54],in[52],in[50],in[48],in[46],in[44],in[42],in[40],
                           in[38],in[36],in[34],in[32],in[30],in[28],in[26],in[24],in[22],in[20],
                           in[18],in[16],in[14],in[12],in[10],in[8],in[6],in[4],in[2],in[0]
                           };



assign in_swz[129:65] =   {
                           in[129],in[127],in[125],in[123],in[121],
                           in[119],in[117],in[115],in[113],in[111],in[109],in[107],in[105],in[103],in[101],
                           in[99],in[97],in[95],in[93],in[91],in[89],in[87],in[85],in[83],in[81],
                           in[79],in[77],in[75],in[73],in[71],in[69],in[67],in[65],in[63],in[61],
                           in[59],in[57],in[55],in[53],in[51],in[49],in[47],in[45],in[43],in[41],
                           in[39],in[37],in[35],in[33],in[31],in[29],in[27],in[25],in[23],in[21],
                           in[19],in[17],in[15],in[13],in[11],in[9],in[7],in[5],in[3],in[1]
                           };

  

//inv_macro i_inv_data_2 (width=40, stack=50c) (
//	.din	(pcx_scache_data_px_[129:90]),
//	.dout	(pcx_scache_data_px[129:90]),
//);
//
//inv_macro i_inv_data_1 (width=50, stack=50c) (
//	.din	(pcx_scache_data_px_[89:40]),
//	.dout	(pcx_scache_data_px[89:40]),
//);
//
//inv_macro i_inv_data_0 (width=40, stack=50c) (
//	.din	(pcx_scache_data_px_[39:0]),
//	.dout	(pcx_scache_data_px[39:0]),
//);
//
//msff_macro i_dff_data_2 (width=40, stack=50c) (
//	.scan_in(i_dff_sctag_l_scanin),
//	.scan_out(i_dff_sctag_l_scanout),
//	.clk	(l2clk),
//	.din	(pcx_scache_data_px[129:90]),
//	.dout	(pcx_sctag_data_x2[129:90]),
//	.en	(1'b1),
//);
//
//msff_macro i_dff_data_1 (width=50, stack=50c) (
//	.scan_in(i_dff_sctag_c_scanin),
//	.scan_out(i_dff_sctag_c_scanout),
//	.clk	(l2clk),
//	.din	(pcx_scache_data_px[89:40]),
//	.dout	(pcx_sctag_data_x2[89:40]),
//	.en	(1'b1),
//);
//
//msff_macro i_dff_data_0 (width=40, stack=50c) (
//	.scan_in(i_dff_sctag_r_scanin),
//	.scan_out(i_dff_sctag_r_scanout),
//	.clk	(l2clk),
//	.din	(pcx_scache_data_px[39:0]),
//	.dout	(pcx_sctag_data_x2[39:0]),
//	.en	(1'b1),
//);
//
//buff_macro i_buf_data_2 (width=40, stack=50c) (
//	.din	(pcx_sctag_data_x2[129:90]),
//	.dout	(pcx_sctag_data_px2[129:90]),
//);
//
//buff_macro i_buf_data_1 (width=50, stack=50c) (
//	.din	(pcx_sctag_data_x2[89:40]),
//	.dout	(pcx_sctag_data_px2[89:40]),
//);
//
//buff_macro i_buf_data_0 (width=40, stack=50c) (
//	.din	(pcx_sctag_data_x2[39:0]),
//	.dout	(pcx_sctag_data_px2[39:0]),
//);

//inv_macro i_inv_data_0 (width=64, stack=64c) (
//	.din	({2'b00,            in_swz[59:30],in_swz[29:0], 2'b00}),
//	.dout	({in_unused_px[3:2],in_px[59:30], in_px[29:0],  in_unused_px[1:0]}),
//);

//inv_macro i_inv_data_1 (width=64, stack=64c) (
//	.din	({2'b00,            in_swz[124:95],in_swz[94:65], 2'b00}),
//	.dout	({in_unused_px[7:6],in_px[124:95], in_px[94:65],  in_unused_px[5:4]}),
//);

//inv_macro i_inv_data_2 (width=6, stack=6l) (
//	.din	({1'b0,in_swz[64:60]}),
//	.dout	({in_unused_px[8],in_px[64:60]}),
//);

//inv_macro i_inv_data_3 (width=6, stack=6l) (
//	.din	({1'b0,in_swz[129:125]}),
//	.dout	({in_unused_px[9],in_px[129:125]}),
//);

pcx_bfd_dp_msffiz_macro__dmsffi_32x__stack_64c__width_64 i_dff_data_0    (
	.scan_in(i_dff_data_0_scanin),
	.scan_out(i_dff_data_0_scanout),
	.clk	(l2clk),
	.din	({2'b00,            in_swz[59:30], in_swz[29:0],  2'b00            }),
	.dout_l	({in_unused_x2[3:2],in_x2[59:30],  in_x2[29:0],   in_unused_x2[1:0]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

pcx_bfd_dp_msffiz_macro__dmsffi_32x__scanreverse_1__stack_64c__width_64 i_dff_data_1     (
	.scan_in(i_dff_data_1_scanin),
	.scan_out(i_dff_data_1_scanout),
	.clk	(l2clk),
	.din	({2'b00,            in_swz[124:95], in_swz[94:65],  2'b00}),
	.dout_l	({in_unused_x2[7:6],in_x2[124:95],  in_x2[94:65],   in_unused_x2[5:4]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

pcx_bfd_dp_msffiz_macro__dmsffi_32x__stack_6l__width_6 i_dff_data_2    (
	.scan_in(i_dff_data_2_scanin),
	.scan_out(i_dff_data_2_scanout),
	.clk	(l2clk),
	.din	({1'b0,           in_swz[64:60]}),
	.dout_l	({in_unused_x2[8],in_x2[64:60]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

pcx_bfd_dp_msffiz_macro__dmsffi_32x__stack_6l__width_6 i_dff_data_3    (
	.scan_in(i_dff_data_3_scanin),
	.scan_out(i_dff_data_3_scanout),
	.clk	(l2clk),
	.din	({1'b0,           in_swz[129:125]}),
	.dout_l	({in_unused_x2[9],in_x2[129:125]}),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

//buff_macro i_buf_data_0 (dbuff=32x, width=64, stack=64c) (
//	  .din	({in_unused_x2[3:2],in_x2[59:30], in_x2[29:0],  in_unused_x2[1:0]}),
//	  .dout	({in_unused[3:2],   in_px2[59:30],in_px2[29:0],  in_unused[1:0]}),
//);
//
//buff_macro i_buf_data_1 (dbuff=32x, width=64, stack=64c) (
//	  .din	({in_unused_x2[7:6],in_x2[124:95], in_x2[94:65],  in_unused_x2[5:4]}),
//	  .dout	({in_unused[7:6],   in_px2[124:95],in_px2[94:65], in_unused[5:4]}),
//);
//
//buff_macro i_buf_data_2 (dbuff=32x, width=6, stack=none) (
//	  .din	({in_unused_x2[8],in_x2[64:60]}),
//	  .dout	({in_unused[8],   in_px2[64:60]}),
//);
//
//buff_macro i_buf_data_3 (dbuff=32x, width=6, stack=none) (
//	  .din	({in_unused_x2[9],in_x2[129:125]}),
//	  .dout	({in_unused[9],in_px2[129:125]}),
//);

assign in_px2[129:0] = in_x2[129:0];
assign in_unused[9:0] = in_unused_x2[9:0];

assign {
        out_swz[128],out_swz[126],out_swz[124],out_swz[122],out_swz[120],
        out_swz[118],out_swz[116],out_swz[114],out_swz[112],out_swz[110],out_swz[108],out_swz[106],out_swz[104],out_swz[102],out_swz[100],
        out_swz[98],out_swz[96],out_swz[94],out_swz[92],out_swz[90],out_swz[88],out_swz[86],out_swz[84],out_swz[82],out_swz[80],
        out_swz[78],out_swz[76],out_swz[74],out_swz[72],out_swz[70],out_swz[68],out_swz[66],out_swz[64],out_swz[62],out_swz[60],
        out_swz[58],out_swz[56],out_swz[54],out_swz[52],out_swz[50],out_swz[48],out_swz[46],out_swz[44],out_swz[42],out_swz[40],
        out_swz[38],out_swz[36],out_swz[34],out_swz[32],out_swz[30],out_swz[28],out_swz[26],out_swz[24],out_swz[22],out_swz[20],
        out_swz[18],out_swz[16],out_swz[14],out_swz[12],out_swz[10],out_swz[8],out_swz[6],out_swz[4],out_swz[2],out_swz[0]
        } = in_px2[64:0];




assign  {
         out_swz[129],out_swz[127],out_swz[125],out_swz[123],out_swz[121],
         out_swz[119],out_swz[117],out_swz[115],out_swz[113],out_swz[111],out_swz[109],out_swz[107],out_swz[105],out_swz[103],out_swz[101],
         out_swz[99],out_swz[97],out_swz[95],out_swz[93],out_swz[91],out_swz[89],out_swz[87],out_swz[85],out_swz[83],out_swz[81],
         out_swz[79],out_swz[77],out_swz[75],out_swz[73],out_swz[71],out_swz[69],out_swz[67],out_swz[65],out_swz[63],out_swz[61],
         out_swz[59],out_swz[57],out_swz[55],out_swz[53],out_swz[51],out_swz[49],out_swz[47],out_swz[45],out_swz[43],out_swz[41],
         out_swz[39],out_swz[37],out_swz[35],out_swz[33],out_swz[31],out_swz[29],out_swz[27],out_swz[25],out_swz[23],out_swz[21],
         out_swz[19],out_swz[17],out_swz[15],out_swz[13],out_swz[11],out_swz[9],out_swz[7],out_swz[5],out_swz[3],out_swz[1]
         } = in_px2[129:65];


assign pcx_sctag_data_px2[129:0] = out_swz[129:0];

pcx_bfd_dp_buff_macro__dbuff_8x__stack_none__width_1 buf_scanout    (
	.din	(scan_out_prebuf),
	.dout	(scan_out)
);

// fixscan start:
assign i_dff_data_0_scanin       = scan_in                  ;
assign i_dff_data_1_scanin       = i_dff_data_0_scanout     ;
assign i_dff_data_2_scanin       = i_dff_data_1_scanout     ;
assign i_dff_data_3_scanin       = i_dff_data_2_scanout     ;
assign scan_out_prebuf           = i_dff_data_3_scanout     ;
// fixscan end:
endmodule // pcx_bfs_dp


//
//   buff macro
//
//





module pcx_bfd_dp_buff_macro__dbuff_8x__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module pcx_bfd_dp_msffiz_macro__dmsffi_32x__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout_l;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
msffiz_dp #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q_l(dout_l[63:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module pcx_bfd_dp_msffiz_macro__dmsffi_32x__scanreverse_1__stack_64c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout_l;


  output scan_out;




  wire [0:62] so;

cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
msffiz_dp #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({so[0:62],scan_in}),
.so({scan_out,so[0:62]}),
.q_l(dout_l[63:0])
);



















endmodule













// any PARAMS parms go into naming of macro

module pcx_bfd_dp_msffiz_macro__dmsffi_32x__stack_6l__width_6 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout_l, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout_l;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
msffiz_dp #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q_l(dout_l[5:0])
);



















endmodule









//
//   buff macro
//
//





module pcx_bfd_dp_buff_macro__dbuff_8x__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule

`endif // `ifndef FPGA

`ifdef FPGA

`timescale 1 ns / 100 ps
module pcx_bfd_dp(pcx_sctag_data_px2, pcx_scache_data_px_, tcu_scan_en, l2clk, 
	scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out, ccx_aclk_out, 
	ccx_bclk_out, tcu_pce_ov_out, tcu_scan_en_out);

	output	[129:0]		pcx_sctag_data_px2;
	input	[129:0]		pcx_scache_data_px_;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;
	output			ccx_aclk_out;
	output			ccx_bclk_out;
	output			tcu_pce_ov_out;
	output			tcu_scan_en_out;

	wire			pce_ov;
	wire			stop;
	wire			siclk;
	wire			soclk;
	wire			se;
	wire	[129:0]		in;
	wire	[129:0]		in_swz;
	wire			i_dff_data_0_scanin;
	wire			i_dff_data_0_scanout;
	wire	[9:0]		in_unused_x2;
	wire	[129:0]		in_x2;
	wire			i_dff_data_1_scanin;
	wire			i_dff_data_1_scanout;
	wire			i_dff_data_2_scanin;
	wire			i_dff_data_2_scanout;
	wire			i_dff_data_3_scanin;
	wire			i_dff_data_3_scanout;
	wire	[129:0]		in_px2;
	wire	[9:0]		in_unused;
	wire	[129:0]		out_swz;
	wire			scan_out_prebuf;

	assign pce_ov = tcu_pce_ov_out;
	assign stop = 1'b0;
	assign siclk = ccx_aclk_out;
	assign soclk = ccx_bclk_out;
	assign se = tcu_scan_en_out;
	assign in[129:0] = pcx_scache_data_px_[129:0];
	assign in_swz[64:0] = {in[128], in[126], in[124], in[122], in[120], 
		in[118], in[116], in[114], in[112], in[110], in[108], in[106], 
		in[104], in[102], in[100], in[98], in[96], in[94], in[92], 
		in[90], in[88], in[86], in[84], in[82], in[80], in[78], in[76], 
		in[74], in[72], in[70], in[68], in[66], in[64], in[62], in[60], 
		in[58], in[56], in[54], in[52], in[50], in[48], in[46], in[44], 
		in[42], in[40], in[38], in[36], in[34], in[32], in[30], in[28], 
		in[26], in[24], in[22], in[20], in[18], in[16], in[14], in[12], 
		in[10], in[8], in[6], in[4], in[2], in[0]};
	assign in_swz[129:65] = {in[129], in[127], in[125], in[123], in[121], 
		in[119], in[117], in[115], in[113], in[111], in[109], in[107], 
		in[105], in[103], in[101], in[99], in[97], in[95], in[93], 
		in[91], in[89], in[87], in[85], in[83], in[81], in[79], in[77], 
		in[75], in[73], in[71], in[69], in[67], in[65], in[63], in[61], 
		in[59], in[57], in[55], in[53], in[51], in[49], in[47], in[45], 
		in[43], in[41], in[39], in[37], in[35], in[33], in[31], in[29], 
		in[27], in[25], in[23], in[21], in[19], in[17], in[15], in[13], 
		in[11], in[9], in[7], in[5], in[3], in[1]};
	assign in_px2[129:0] = in_x2[129:0];
	assign in_unused[9:0] = in_unused_x2[9:0];
	assign {out_swz[128], out_swz[126], out_swz[124], out_swz[122], 
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
		out_swz[6], out_swz[4], out_swz[2], out_swz[0]} = in_px2[64:0];
	assign {out_swz[129], out_swz[127], out_swz[125], out_swz[123], 
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
		out_swz[7], out_swz[5], out_swz[3], out_swz[1]} = in_px2[129:65]
		;
	assign pcx_sctag_data_px2[129:0] = out_swz[129:0];
	assign i_dff_data_0_scanin = scan_in;
	assign i_dff_data_1_scanin = i_dff_data_0_scanout;
	assign i_dff_data_2_scanin = i_dff_data_1_scanout;
	assign i_dff_data_3_scanin = i_dff_data_2_scanout;
	assign scan_out_prebuf = i_dff_data_3_scanout;

	buff_macro__dbuff_8x__stack_none__width_4 buf_hfn(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_out, ccx_bclk_out,
		tcu_pce_ov_out, tcu_scan_en_out}));
	msffiz_macro__dmsffi_32x__stack_64c__width_64 i_dff_data_0(
		.scan_in			(i_dff_data_0_scanin), 
		.scan_out			(i_dff_data_0_scanout), 
		.clk				(l2clk), 
		.din				({2'b0, in_swz[59:30],
		in_swz[29:0], 2'b0}), 
		.dout_l				({in_unused_x2[3:2],
		in_x2[59:30], in_x2[29:0], in_unused_x2[1:0]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msffiz_macro__dmsffi_32x__scanreverse_1__stack_64c__width_64 
		i_dff_data_1(
		.scan_in			(i_dff_data_1_scanin), 
		.scan_out			(i_dff_data_1_scanout), 
		.clk				(l2clk), 
		.din				({2'b0, in_swz[124:95],
		in_swz[94:65], 2'b0}), 
		.dout_l				({in_unused_x2[7:6],
		in_x2[124:95], in_x2[94:65], in_unused_x2[5:4]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msffiz_macro__dmsffi_32x__stack_6l__width_6 i_dff_data_2(
		.scan_in			(i_dff_data_2_scanin), 
		.scan_out			(i_dff_data_2_scanout), 
		.clk				(l2clk), 
		.din				({1'b0, in_swz[64:60]}), 
		.dout_l				({in_unused_x2[8],
		in_x2[64:60]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	msffiz_macro__dmsffi_32x__stack_6l__width_6 i_dff_data_3(
		.scan_in			(i_dff_data_3_scanin), 
		.scan_out			(i_dff_data_3_scanout), 
		.clk				(l2clk), 
		.din				({1'b0, in_swz[129:125]}), 
		.dout_l				({in_unused_x2[9],
		in_x2[129:125]}), 
		.en				(1'b1), 
		.se				(se), 
		.siclk				(siclk), 
		.soclk				(soclk), 
		.pce_ov				(pce_ov), 
		.stop				(stop));
	buff_macro__dbuff_8x__stack_none__width_1 buf_scanout(
		.din				(scan_out_prebuf), 
		.dout				(scan_out));
endmodule

module msffiz_macro__dmsffi_32x__stack_6l__width_6(din, clk, en, se, scan_in,
        siclk, soclk, pce_ov, stop, dout_l, scan_out);

        input   [5:0]           din;
        input                   clk;
        input                   en;
        input                   se;
        input                   scan_in;
        input                   siclk;
        input                   soclk;
        input                   pce_ov;
        input                   stop;
        output  [5:0]           dout_l;
        output                  scan_out;

        wire                    l1clk;
        wire                    siclk_out;
        wire                    soclk_out;
        wire    [4:0]           so;

        cl_dp1_l1hdr_8x c0_0(
                .l2clk                          (clk),
                .pce                            (en),
                .aclk                           (siclk),
                .bclk                           (soclk),
                .l1clk                          (l1clk),
                .se                             (se),
                .pce_ov                         (pce_ov),
                .stop                           (stop),
                .siclk_out                      (siclk_out),
                .soclk_out                      (soclk_out));
        msffiz_dp #(6) d0_0(
                .l1clk                          (l1clk),
                .siclk                          (siclk_out),
                .soclk                          (soclk_out),
                .d                              (din[5:0]),
                .si                             ({scan_in, so[4:0]}),
                .so                             ({so[4:0], scan_out}),
                .q_l                            (dout_l[5:0]));
endmodule

module msffiz_macro__dmsffi_32x__stack_64c__width_64(din, clk, en, se, scan_in,
        siclk, soclk, pce_ov, stop, dout_l, scan_out);

        input   [63:0]          din;
        input                   clk;
        input                   en;
        input                   se;
        input                   scan_in;
        input                   siclk;
        input                   soclk;
        input                   pce_ov;
        input                   stop;
        output  [63:0]          dout_l;
        output                  scan_out;

        wire                    l1clk;
        wire                    siclk_out;
        wire                    soclk_out;
        wire    [62:0]          so;

        cl_dp1_l1hdr_8x c0_0(
                .l2clk                          (clk),
                .pce                            (en),
                .aclk                           (siclk),
                .bclk                           (soclk),
                .l1clk                          (l1clk),
                .se                             (se),
                .pce_ov                         (pce_ov),
                .stop                           (stop),
                .siclk_out                      (siclk_out),
                .soclk_out                      (soclk_out));
        msffiz_dp #(64) d0_0(
                .l1clk                          (l1clk),
                .siclk                          (siclk_out),
                .soclk                          (soclk_out),
                .d                              (din[63:0]),
                .si                             ({scan_in, so[62:0]}),
                .so                             ({so[62:0], scan_out}),
                .q_l                            (dout_l[63:0]));
endmodule


`endif // `ifdef FPGA

