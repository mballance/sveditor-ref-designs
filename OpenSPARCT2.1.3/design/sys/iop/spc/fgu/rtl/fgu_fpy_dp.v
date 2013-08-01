// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fpy_dp.v
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
module fgu_fpy_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  scan_out, 
  mul_clken_rep0, 
  mul_clken_rep01, 
  spu_fgu_rs1_e, 
  spu_fgu_rs2_e, 
  fad_rs1_fmt_fx1_rep0, 
  fad_rs2_fmt_fx1_rep0, 
  fad_rs2_fmt_fx1_rep1, 
  fac_xr_mode_fx1, 
  fac_rs1_sel_fx1, 
  fac_rs2_sel_fx1, 
  fac_8x16_rnd_fx3, 
  fac_scff_sel_fx3, 
  fac_accum_sel_fx3, 
  fac_result_sel_fx4, 
  fac_ma_result_en_fx4, 
  fgu_mul_result_fx5, 
  fpy_sticky_dp_fx5, 
  fpy_sticky_sp_fx5, 
  fpy_fp_result_fx4_b63, 
  fpy_xicc_z_fx5, 
  fgu_accum_b0_fx5);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire i_spu_rs1_ff_scanin;
wire i_spu_rs1_ff_scanout;
wire [63:0] spu_fgu_rs1_fx1;
wire i_spu_rs2_ff_scanin;
wire i_spu_rs2_ff_scanout;
wire [63:0] spu_fgu_rs2_fx1;
wire [63:15] rs2_fx1_ebf;
wire xr_mode_fx1_;
wire [1:0] xr_mode_fx1_bf;
wire tcu_muxtest_a_rep0;
wire [63:0] ma_result_ff;
wire [12:0] rs1_fmt_a0;
wire [18:0] rs1_fmt_a1;
wire [18:0] rs1_fmt_a2;
wire [18:0] rs1_fmt_a3;
wire [4:0] be00;
wire [31:0] be_pout;
wire [31:0] be_hout;
wire [4:0] be01;
wire [4:0] be02;
wire [4:0] be03;
wire [4:0] be04;
wire [4:0] be05;
wire [4:0] be06;
wire [4:0] be07;
wire [4:0] be08;
wire [4:0] be09;
wire [4:0] be10;
wire [4:0] be11;
wire [4:0] be12;
wire [4:0] be13;
wire [4:0] be14;
wire [4:0] be15;
wire [4:0] be16;
wire [4:0] be17;
wire [4:0] be18;
wire [4:0] be19;
wire [4:0] be20;
wire [4:0] be21;
wire [4:0] be22;
wire [4:0] be23;
wire [4:0] be24;
wire [4:0] be25;
wire [4:0] be26;
wire [4:0] be27;
wire [4:0] be28;
wire [4:0] be29;
wire [4:0] be30;
wire [4:0] be31;
wire [5:0] i_be32_unused;
wire be32_b0;
wire [64:0] rs2_3x_fx1;
wire i_3x_ff_scanin;
wire i_3x_ff_scanout;
wire [64:0] rs2_3x_ff;
wire [64:0] rs2_3x;
wire i_a3_be_ff_scanin;
wire i_a3_be_ff_scanout;
wire a3_xr_mode_fx2_;
wire [31:0] be_pout_ff;
wire [4:0] be_ff08;
wire [4:0] be_ff07;
wire [4:0] be_ff06;
wire [4:0] be_ff05;
wire [4:0] be_ff04;
wire [4:0] be_ff03;
wire [4:0] be_ff02;
wire [4:0] be_ff01;
wire [4:0] be_ff00;
wire [31:0] be_hout_ff;
wire [63:15] rs2_fx1_ebf3;
wire i_a3_rs2_ff_scanin;
wire i_a3_rs2_ff_scanout;
wire [63:0] a3_rs2_ff;
wire [63:0] a3_rs2;
wire [63:0] a3_rs2_;
wire [67:0] bm00;
wire [68:0] bm01;
wire [70:2] bm02;
wire [72:4] bm03;
wire [74:6] bm04;
wire [76:8] bm05;
wire [78:10] bm06;
wire [80:12] bm07;
wire [82:14] bm08;
wire [69:1] a3_csa1_1_c;
wire [70:0] a3_csa1_1_s;
wire [75:7] a3_csa1_2_c;
wire [76:4] a3_csa1_2_s;
wire [81:13] a3_csa1_3_c;
wire [82:10] a3_csa1_3_s;
wire [77:5] a3_csa2_1_c;
wire [82:0] a3_csa2_1_s;
wire [76:8] a3_csa2_2_c;
wire [81:1] a3_csa2_2_s;
wire a3_csa3_1_unused;
wire [82:2] a3_csa3_1_c;
wire [82:0] a3_csa3_1_s;
wire i_a3_s_ff_a_scanin;
wire i_a3_s_ff_a_scanout;
wire [82:0] a3_csa3_1_s_ff;
wire i_a3_s_ff_b_scanin;
wire i_a3_s_ff_b_scanout;
wire i_a3_c_ff_a_scanin;
wire i_a3_c_ff_a_scanout;
wire [82:2] a3_csa3_1_c_ff;
wire i_a3_c_ff_b_scanin;
wire i_a3_c_ff_b_scanout;
wire [100:16] a2_csa2_3_s;
wire [98:0] a32_xr4_1;
wire i_a32_x_ff_a_scanin;
wire i_a32_x_ff_a_scanout;
wire [98:0] a32_xr_ff;
wire i_a32_x_ff_b_scanin;
wire i_a32_x_ff_b_scanout;
wire i_a2_be_ff_a_scanin;
wire i_a2_be_ff_a_scanout;
wire a2_xr_mode_fx2_;
wire [4:0] be_ff17;
wire [4:0] be_ff16;
wire i_a2_be_ff_b_scanin;
wire i_a2_be_ff_b_scanout;
wire [4:0] be_ff15;
wire [4:0] be_ff14;
wire [4:0] be_ff13;
wire [4:0] be_ff12;
wire [4:0] be_ff11;
wire [4:0] be_ff10;
wire [4:0] be_ff09;
wire [63:31] rs2_fx1_ebf2;
wire i_a2_rs2_ff_scanin;
wire i_a2_rs2_ff_scanout;
wire [63:0] a2_rs2_ff;
wire [63:0] a2_rs2;
wire [63:0] a2_rs2_;
wire [84:16] bm09;
wire [86:18] bm10;
wire [88:20] bm11;
wire [90:22] bm12;
wire [92:24] bm13;
wire [94:26] bm14;
wire [96:28] bm15;
wire [98:30] bm16;
wire [100:32] bm17;
wire [87:19] a2_csa1_4_c;
wire [88:16] a2_csa1_4_s;
wire [93:25] a2_csa1_5_c;
wire [94:22] a2_csa1_5_s;
wire [99:31] a2_csa1_6_c;
wire [100:28] a2_csa1_6_s;
wire [95:23] a2_csa2_3_c;
wire [94:26] a2_csa2_4_c;
wire [99:19] a2_csa2_4_s;
wire a2_csa3_2_unused;
wire [100:20] a2_csa3_2_c;
wire [100:16] a2_csa3_2_s;
wire i_a2_s_ff_a_scanin;
wire i_a2_s_ff_a_scanout;
wire [100:16] a2_csa3_2_s_ff;
wire i_a2_s_ff_b_scanin;
wire i_a2_s_ff_b_scanout;
wire i_a2_c_ff_a_scanin;
wire i_a2_c_ff_a_scanout;
wire [100:20] a2_csa3_2_c_ff;
wire i_a2_c_ff_b_scanin;
wire i_a2_c_ff_b_scanout;
wire i_a1_be_ff_scanin;
wire i_a1_be_ff_scanout;
wire a1_xr_mode_fx2_;
wire [4:0] be_ff26;
wire [4:0] be_ff25;
wire [4:0] be_ff24;
wire [4:0] be_ff23;
wire [4:0] be_ff22;
wire [4:0] be_ff21;
wire [4:0] be_ff20;
wire [4:0] be_ff19;
wire [4:0] be_ff18;
wire [63:47] rs2_fx1_ebf1;
wire i_a1_rs2_ff_scanin;
wire i_a1_rs2_ff_scanout;
wire [63:0] a1_rs2_ff;
wire [63:0] a1_rs2;
wire [63:0] a1_rs2_;
wire [102:34] bm18;
wire [104:36] bm19;
wire [106:38] bm20;
wire [108:40] bm21;
wire [110:42] bm22;
wire [112:44] bm23;
wire [114:46] bm24;
wire [116:48] bm25;
wire [118:50] bm26;
wire [105:37] a1_csa1_7_c;
wire [106:34] a1_csa1_7_s;
wire [111:43] a1_csa1_8_c;
wire [112:40] a1_csa1_8_s;
wire [117:49] a1_csa1_9_c;
wire [118:46] a1_csa1_9_s;
wire [113:41] a1_csa2_5_c;
wire [118:34] a1_csa2_5_s;
wire [112:44] a1_csa2_6_c;
wire [117:37] a1_csa2_6_s;
wire a1_csa3_3_unused;
wire [118:38] a1_csa3_3_c;
wire [118:34] a1_csa3_3_s;
wire i_a1_s_ff_a_scanin;
wire i_a1_s_ff_a_scanout;
wire [118:34] a1_csa3_3_s_ff;
wire i_a1_s_ff_b_scanin;
wire i_a1_s_ff_b_scanout;
wire i_a1_c_ff_a_scanin;
wire i_a1_c_ff_a_scanout;
wire [118:38] a1_csa3_3_c_ff;
wire i_a1_c_ff_b_scanin;
wire i_a1_c_ff_b_scanout;
wire [126:54] a0_xr_in;
wire [126:36] a10_xr4_2;
wire i_a10_x_ff_a_scanin;
wire i_a10_x_ff_a_scanout;
wire [126:36] a10_xr_ff;
wire i_a10_x_ff_b_scanin;
wire i_a10_x_ff_b_scanout;
wire i_a0_be_ff_scanin;
wire i_a0_be_ff_scanout;
wire a0_xr_mode_fx2_;
wire be_ff32_b0;
wire [4:0] be_ff31;
wire [4:0] be_ff30;
wire [4:0] be_ff29;
wire [4:0] be_ff28;
wire [4:0] be_ff27;
wire [63:47] rs2_fx1_ebf0;
wire i_a0_rs2_ff_scanin;
wire i_a0_rs2_ff_scanout;
wire [63:0] a0_rs2_ff;
wire [63:0] a0_rs2;
wire [63:0] a0_rs2_;
wire [120:52] bm27;
wire [122:54] bm28;
wire [124:56] bm29;
wire [126:58] bm30;
wire [127:60] bm31;
wire [135:62] bm32;
wire [123:55] a0_csa2_7_c;
wire [124:52] a0_csa2_7_s;
wire [128:61] a0_csa2_8_c;
wire [135:58] a0_csa2_8_s;
wire a0_csa3_4_unused;
wire [129:56] a0_csa3_4_c;
wire [135:52] a0_csa3_4_s;
wire i_a0_s_ff_a_scanin;
wire i_a0_s_ff_a_scanout;
wire [135:52] a0_csa3_4_s_ff;
wire i_a0_s_ff_b_scanin;
wire i_a0_s_ff_b_scanout;
wire i_a0_c_ff_a_scanin;
wire i_a0_c_ff_a_scanout;
wire [129:56] a0_csa3_4_c_ff;
wire i_a0_c_ff_b_scanin;
wire i_a0_c_ff_b_scanout;
wire [6:2] accum_sel_fx4;
wire accum_sel_fx4_b0;
wire a4_8x16csa4_1_unused;
wire [31:2] a4_8x16csa4_1_c;
wire [31:0] a4_8x16csa4_1_s;
wire a4_8x16csa4_2_unused;
wire [49:20] a4_8x16csa4_2_c;
wire [49:18] a4_8x16csa4_2_s;
wire a4_8x16csa4_3_unused;
wire [67:38] a4_8x16csa4_3_c;
wire [67:36] a4_8x16csa4_3_s;
wire a4_8x16csa4_4_unused;
wire [85:56] a4_8x16csa4_4_c;
wire [85:54] a4_8x16csa4_4_s;
wire [126:0] a4_xr5_1;
wire a4_csa4_1b_cout;
wire a4_csa4_1a_unused;
wire [101:3] a4_csa4_1_c;
wire [100:0] a4_csa4_1_s;
wire a4_csa4_2_unused;
wire [130:39] a4_csa4_2_c;
wire [135:34] a4_csa4_2_s;
wire a4_csa5_1b_cout;
wire a4_csa5_1a_unused;
wire [131:4] a4_csa5_1_c;
wire [135:0] a4_csa5_1_s;
wire i_a4_s_lo_ff_scanin;
wire i_a4_s_lo_ff_scanout;
wire [135:0] a4_csa5_1_s_ff;
wire i_a4_s_hi_ff_scanin;
wire i_a4_s_hi_ff_scanout;
wire i_a4_c_lo_ff_scanin;
wire i_a4_c_lo_ff_scanout;
wire [132:0] a4_csa5_1_c_ff;
wire i_a4_c_hi_ff_scanin;
wire i_a4_c_hi_ff_scanout;
wire [135:0] accum_ff;
wire [126:0] xr_fx4;
wire i_accum_ff0_scanin;
wire i_accum_ff0_scanout;
wire [135:0] fya_add_result;
wire i_accum_ff1_scanin;
wire i_accum_ff1_scanout;
wire i_accum_sel_b1_ff_scanin;
wire i_accum_sel_b1_ff_scanout;
wire [3:0] accum_sel_fx4_b1;
wire fya_sticky_dp;
wire fya_sticky_sp;
wire [1:0] fya_xicc_z;
wire i_fx5_ff_scanin;
wire i_fx5_ff_scanout;
wire i_ma_result_ff_scanin;
wire i_ma_result_ff_scanout;


input		l2clk;
input  		scan_in;
input  		tcu_pce_ov;		// scan signals
input  		spc_aclk;
input  		spc_bclk;
input 		tcu_scan_en;
input 	        tcu_dectest;
input           tcu_muxtest;
output 		scan_out;

input           mul_clken_rep0;         // multiply clken
input           mul_clken_rep01;        // multiply clken

input  [63:0]	spu_fgu_rs1_e;          // rs1 source from SPU
input  [63:0]	spu_fgu_rs2_e;          // rs2 source from SPU

input  [63:0]	fad_rs1_fmt_fx1_rep0;
input  [63:0]	fad_rs2_fmt_fx1_rep0;
input  [63:0]	fad_rs2_fmt_fx1_rep1;

input		fac_xr_mode_fx1;	//  0  : Int or Float
					//  1  : XOR mult

input  [4:0]	fac_rs1_sel_fx1;	// [0] : FMUL8SUx16 or FMULD8SUx16
					// [1] : FMUL8x16   or FMUL8x16AU  or FMUL8x16AL
					// [2] : FMUL8ULx16 or FMULD8ULx16
					// [3] : MA Int / XOR   forward of last MA result
					// [4] : MA Int / XOR unforwarded
					// Def : 64 * 64 Multiply

input  [3:0]	fac_rs2_sel_fx1;	// [0] : FMUL8x16AU
					// [1] : FMUL8x16AL
					// [2] : all 8x16
					// [3] : MA Int / XOR
					// Def : 64 * 64 Multiply

input  [1:0]	fac_8x16_rnd_fx3;	// [0] : FMUL8x16 or FMUL8x16AU or FMUL8x16AL or FMUL8SUx16
					// [1] : FMUL8ULx16

input  [3:0]	fac_scff_sel_fx3;	// [0] : Int, Float, MA Int
					// [1] : all 8x16
					// [2] : MA Int   * 2
					// [3] : XOR mult
					// Def : XOR mult * 2

input  [6:0]	fac_accum_sel_fx3;	// [0] : Write ACCUM with result
					// [1] : Add ACCUM to Mult product
					// [2] : XOR Mult w/        ACCUM
					// [3] : XOR Mult w/        ACCUM >> 64
					// [4] : XOR Mult       w/o ACCUM
					// [5] : XOR Mult       w/o ACCUM >> 64
					// [6] : Int Mult w/ or w/o ACCUM
					// Def : Int Mult w/ or w/o ACCUM >> 64

input  [5:0]	fac_result_sel_fx4;	// [0] : FMUL8x16   or FMUL8x16AU or FMUL8x16AL or FMUL8SUx16
					// [1] : FMUL8ULx16
					// [2] : FMULD8SUx16
					// [3] : FMULD8ULx16
					// [4] : XOR multiply w/ ACCUMUMATE
					// [5] : Float
					// Def : Integer, MA Integer w/ and w/o ACCUMULATE, XOR w/o ACCUMULATE

input		fac_ma_result_en_fx4;	//  1  : Save last MA result in shadow flop

output [63:0]	fgu_mul_result_fx5;
output		fpy_sticky_dp_fx5;
output		fpy_sticky_sp_fx5;
output		fpy_fp_result_fx4_b63;
output [1:0]	fpy_xicc_z_fx5;

output		fgu_accum_b0_fx5;	// To SPU MA



// scan renames
assign stop   = 1'b0;
assign test   = tcu_dectest;
// end scan

fgu_fpy_dp_buff_macro__dbuff_32x__rep_1__stack_88c__width_4 test_rep0  (
  .din ({tcu_scan_en, tcu_pce_ov, spc_aclk, spc_bclk}),
  .dout({se,          pce_ov,     siclk,    soclk   })
  );


fgu_fpy_dp_msff_macro__minbuff_1__stack_88c__width_64	i_spu_rs1_ff		 (
  .scan_in(i_spu_rs1_ff_scanin),
  .scan_out(i_spu_rs1_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( spu_fgu_rs1_e[63:0]			),
  .dout( spu_fgu_rs1_fx1[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__stack_88c__width_64	i_spu_rs2_ff		 (
  .scan_in(i_spu_rs2_ff_scanin),
  .scan_out(i_spu_rs2_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( spu_fgu_rs2_e[63:0]			),
  .dout( spu_fgu_rs2_fx1[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));





fgu_fpy_dp_buff_macro__stack_88c__width_4	i_rs2_fx1_ebuf		 (
  .din ({fad_rs2_fmt_fx1_rep0[63],fad_rs2_fmt_fx1_rep0[47],fad_rs2_fmt_fx1_rep0[31],fad_rs2_fmt_fx1_rep0[15]}),
  .dout({    rs2_fx1_ebf[63]     ,    rs2_fx1_ebf[47]     ,    rs2_fx1_ebf[31]     ,    rs2_fx1_ebf[15]}     ));



 
// *** *** *** *** *** *** *** *** Start : RS1 Format *** *** *** *** *** *** *** ***


fgu_fpy_dp_inv_macro__stack_88c__width_1	i_xr_mode_fx1_inv	 (
  .din ( fac_xr_mode_fx1	),
  .dout( xr_mode_fx1_   	));

fgu_fpy_dp_buff_macro__stack_88c__width_2	i_xr_mode_fx1_buf	 (
  .din ({2{fac_xr_mode_fx1}}	),
  .dout( xr_mode_fx1_bf[1:0]	));

fgu_fpy_dp_buff_macro__dbuff_48x__stack_88c__width_1 muxtest_a_rep0  (
  .din (tcu_muxtest	  ),
  .dout(tcu_muxtest_a_rep0)
  );

fgu_fpy_dp_mux_macro__mux_pgpe__ports_6__stack_88c__width_69	i_rs1_fmt_mux		  (
  .muxtst(tcu_muxtest_a_rep0),
  .din0({{ 4{fad_rs1_fmt_fx1_rep0[63]}},fad_rs1_fmt_fx1_rep0[63:56],1'b0,	// a0 12:0
         {10{fad_rs1_fmt_fx1_rep0[47]}},fad_rs1_fmt_fx1_rep0[47:40],1'b0,	// a1 18:0
         {10{fad_rs1_fmt_fx1_rep0[31]}},fad_rs1_fmt_fx1_rep0[31:24],1'b0,	// a2 18:0
         {10{fad_rs1_fmt_fx1_rep0[15]}},fad_rs1_fmt_fx1_rep0[15:8]     }),	// a3 18:1

  .din1({{ 4{    1'b0                }},fad_rs1_fmt_fx1_rep0[63:56],1'b0,	// a0 12:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[55:48],1'b0,	// a1 18:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[47:40],1'b0,	// a2 18:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[39:32]     }),	// a3 18:1

  .din2({{ 4{    1'b0                }},fad_rs1_fmt_fx1_rep0[55:48],1'b0,	// a0 12:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[39:32],1'b0,	// a1 18:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[23:16],1'b0,	// a2 18:0
         {10{    1'b0                }},fad_rs1_fmt_fx1_rep0[7:0]     }),	// a3 18:1

  .din3({2'b00,ma_result_ff[63:53],						// a0 12:0
         ma_result_ff[53:35]	,		  				// a1 18:0
         ma_result_ff[35:17]	,						// a2 18:0
         ma_result_ff[17:0]	}			  	         ),	// a3 18:1

  .din4({2'b00,spu_fgu_rs1_fx1[63:53],						// a0 12:0
         spu_fgu_rs1_fx1[53:35],						// a1 18:0
         spu_fgu_rs1_fx1[35:17],						// a2 18:0
         spu_fgu_rs1_fx1[17:0]}					 ),	// a3 18:1

  .din5({2'b00,fad_rs1_fmt_fx1_rep0[63:53],					// a0 12:0
         fad_rs1_fmt_fx1_rep0[53:35],						// a1 18:0
         fad_rs1_fmt_fx1_rep0[35:17],						// a2 18:0
         fad_rs1_fmt_fx1_rep0[17:0]}					 ),	// a3 18:1

  .sel0( fac_rs1_sel_fx1[0]						 ),
  .sel1( fac_rs1_sel_fx1[1]						 ),
  .sel2( fac_rs1_sel_fx1[2]						 ),
  .sel3( fac_rs1_sel_fx1[3]						 ),
  .sel4( fac_rs1_sel_fx1[4]						 ),
  .dout({rs1_fmt_a0[12:0]	,
         rs1_fmt_a1[18:0]	,
         rs1_fmt_a2[18:0]	,
         rs1_fmt_a3[18:1]	}					 ),
  .test(test));


  assign rs1_fmt_a3[0]	= 1'b0;		// 1st back bit is always '0'


fgu_fpy_dp_booth_encode_macro	i_be00	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[2:0]	),
  .dout    ( be00[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[0]	),	// P,H
  .hout    ( be_hout[0]	));


fgu_fpy_dp_booth_encode_macro	i_be01	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[4:2]	),
  .dout    ( be01[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[1]	),	// P,H
  .hout    ( be_hout[1]	));


fgu_fpy_dp_booth_encode_macro	i_be02	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[6:4]	),
  .dout    ( be02[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[2]	),	// P,H
  .hout    ( be_hout[2]	));


fgu_fpy_dp_booth_encode_macro	i_be03	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[8:6]	),
  .dout    ( be03[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[3]	),	// P,H
  .hout    ( be_hout[3]	));


fgu_fpy_dp_booth_encode_macro	i_be04	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[10:8]	),
  .dout    ( be04[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[4]	),	// P,H
  .hout    ( be_hout[4]	));


fgu_fpy_dp_booth_encode_macro	i_be05	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[12:10]	),
  .dout    ( be05[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[5]	),	// P,H
  .hout    ( be_hout[5]	));


fgu_fpy_dp_booth_encode_macro	i_be06	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[14:12]	),
  .dout    ( be06[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[6]	),	// P,H
  .hout    ( be_hout[6]	));


fgu_fpy_dp_booth_encode_macro	i_be07	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[16:14]	),
  .dout    ( be07[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[7]	),	// P,H
  .hout    ( be_hout[7]	));


fgu_fpy_dp_booth_encode_macro	i_be08	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a3[18:16]	),
  .dout    ( be08[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[8]	),	// P,H
  .hout    ( be_hout[8]	));




fgu_fpy_dp_booth_encode_macro	i_be09	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[2:0]	),
  .dout    ( be09[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[9]	),	// P,H
  .hout    ( be_hout[9]	));


fgu_fpy_dp_booth_encode_macro	i_be10	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[4:2]	),
  .dout    ( be10[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[10]	),	// P,H
  .hout    ( be_hout[10]	));


fgu_fpy_dp_booth_encode_macro	i_be11	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[6:4]	),
  .dout    ( be11[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[11]	),	// P,H
  .hout    ( be_hout[11]	));


fgu_fpy_dp_booth_encode_macro	i_be12	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[8:6]	),
  .dout    ( be12[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[12]	),	// P,H
  .hout    ( be_hout[12]	));


fgu_fpy_dp_booth_encode_macro	i_be13	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[10:8]	),
  .dout    ( be13[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[13]	),	// P,H
  .hout    ( be_hout[13]	));


fgu_fpy_dp_booth_encode_macro	i_be14	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[12:10]	),
  .dout    ( be14[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[14]	),	// P,H
  .hout    ( be_hout[14]	));


fgu_fpy_dp_booth_encode_macro	i_be15	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[14:12]	),
  .dout    ( be15[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[15]	),	// P,H
  .hout    ( be_hout[15]	));


fgu_fpy_dp_booth_encode_macro	i_be16	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[16:14]	),
  .dout    ( be16[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[16]	),	// P,H
  .hout    ( be_hout[16]	));


fgu_fpy_dp_booth_encode_macro	i_be17	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a2[18:16]	),
  .dout    ( be17[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[17]	),	// P,H
  .hout    ( be_hout[17]	));





fgu_fpy_dp_booth_encode_macro	i_be18	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a1[2:0]	),
  .dout    ( be18[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[18]	),	// P,H
  .hout    ( be_hout[18]	));


fgu_fpy_dp_booth_encode_macro	i_be19	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a1[4:2]	),
  .dout    ( be19[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[19]	),	// P,H
  .hout    ( be_hout[19]	));


fgu_fpy_dp_booth_encode_macro	i_be20	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a1[6:4]	),
  .dout    ( be20[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[20]	),	// P,H
  .hout    ( be_hout[20]	));


fgu_fpy_dp_booth_encode_macro	i_be21	(
  .xr_mode ( xr_mode_fx1_bf[0]	),
  .din     ( rs1_fmt_a1[8:6]	),
  .dout    ( be21[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[21]	),	// P,H
  .hout    ( be_hout[21]	));


fgu_fpy_dp_booth_encode_macro	i_be22	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a1[10:8]	),
  .dout    ( be22[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[22]	),	// P,H
  .hout    ( be_hout[22]	));


fgu_fpy_dp_booth_encode_macro	i_be23	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a1[12:10]	),
  .dout    ( be23[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[23]	),	// P,H
  .hout    ( be_hout[23]	));


fgu_fpy_dp_booth_encode_macro	i_be24	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a1[14:12]	),
  .dout    ( be24[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[24]	),	// P,H
  .hout    ( be_hout[24]	));


fgu_fpy_dp_booth_encode_macro	i_be25	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a1[16:14]	),
  .dout    ( be25[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[25]	),	// P,H
  .hout    ( be_hout[25]	));


fgu_fpy_dp_booth_encode_macro	i_be26	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a1[18:16]	),
  .dout    ( be26[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[26]	),	// P,H
  .hout    ( be_hout[26]	));





fgu_fpy_dp_booth_encode_macro	i_be27	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[2:0]	),
  .dout    ( be27[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[27]	),	// P,H
  .hout    ( be_hout[27]	));


fgu_fpy_dp_booth_encode_macro	i_be28	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[4:2]	),
  .dout    ( be28[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[28]	),	// P,H
  .hout    ( be_hout[28]	));


fgu_fpy_dp_booth_encode_macro	i_be29	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[6:4]	),
  .dout    ( be29[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[29]	),	// P,H
  .hout    ( be_hout[29]	));


fgu_fpy_dp_booth_encode_macro	i_be30	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[8:6]	),
  .dout    ( be30[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[30]	),	// P,H
  .hout    ( be_hout[30]	));


fgu_fpy_dp_booth_encode_macro	i_be31	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[10:8]	),
  .dout    ( be31[4:0]		),	// +3,-1,-2,+2,+1
  .pout    ( be_pout[31]	),	// P,H
  .hout    ( be_hout[31]	));


fgu_fpy_dp_booth_encode_macro	i_be32	(
  .xr_mode ( xr_mode_fx1_bf[1]	),
  .din     ( rs1_fmt_a0[12:10]	),
  .dout    ({i_be32_unused[3:0],
             be32_b0}		),	// +3,-1,-2,+2,+1
  .pout    ( i_be32_unused[4]	),	// P,H
  .hout    ( i_be32_unused[5]	));



// *** *** *** *** *** *** *** *** End   : RS1 Format *** *** *** *** *** *** *** ***


 
// *** *** *** *** *** *** *** *** Start : XOR multiply specific  *** *** *** *** ***



fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	i_3x_xor		 (
  .din0( spu_fgu_rs2_fx1[63:1]		),	// XOR 1x
  .din1( spu_fgu_rs2_fx1[62:0]		),	// XOR 2x
  .dout( rs2_3x_fx1[63:1]			));

  assign rs2_3x_fx1[0]	= spu_fgu_rs2_fx1[0];
  assign rs2_3x_fx1[64]	= spu_fgu_rs2_fx1[63];


fgu_fpy_dp_msff_macro__stack_88c__width_65	i_3x_ff			 (
  .scan_in(i_3x_ff_scanin),
  .scan_out(i_3x_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( rs2_3x_fx1[64:0]			),
  .dout( rs2_3x_ff[64:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_65	i_3x_buf		 (
  .din ( rs2_3x_ff[64:0]			),
  .dout( rs2_3x[64:0]				));


// *** *** *** *** *** *** *** *** End   : XOR multiply specific  *** *** *** *** ***


 
// *** *** *** *** *** *** *** *** Start : "A3" 9:2 CSA Tree  *** *** *** *** *** ***

fgu_fpy_dp_msff_macro__stack_88c__width_63	i_a3_be_ff		 (
  .scan_in(i_a3_be_ff_scanin),
  .scan_out(i_a3_be_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ({xr_mode_fx1_		,
         be_pout[8:0]		,
         be08[4:0]		,
         be07[4:0]		,
         be06[4:0]		,
         be05[4:0]		,
         be04[4:0]		,
         be03[4:0]		,
         be02[4:0]		,
         be01[4:0]		,
         be00[4:0]		,
         be_hout[7:0]}			),
  .dout({a3_xr_mode_fx2_	,
         be_pout_ff[8:0]	,
         be_ff08[4:0]		,
         be_ff07[4:0]		,
         be_ff06[4:0]		,
         be_ff05[4:0]		,
         be_ff04[4:0]		,
         be_ff03[4:0]		,
         be_ff02[4:0]		,
         be_ff01[4:0]		,
         be_ff00[4:0]		,
         be_hout_ff[7:0]}			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_3	i_a3_rs2_fx1_ebuf	 (
  .din ({rs2_fx1_ebf[63]    ,rs2_fx1_ebf[47]    ,rs2_fx1_ebf[15]}		),
  .dout({rs2_fx1_ebf3[63]   ,rs2_fx1_ebf3[47]   ,rs2_fx1_ebf3[15]}		));


fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_64	i_a3_rs2_ff		 (
  .scan_in(i_a3_rs2_ff_scanin),
  .scan_out(i_a3_rs2_ff_scanout),
  .clk ( l2clk								),
  .en  ( mul_clken_rep0					 	 	),
  .din0({{32{1'b0}},{17{rs2_fx1_ebf3[63]}},fad_rs2_fmt_fx1_rep1[62:48]}	),
  .din1({{32{1'b0}},{17{rs2_fx1_ebf3[47]}},fad_rs2_fmt_fx1_rep1[46:32]}	),
  .din2({{32{1'b0}},{17{rs2_fx1_ebf3[15]}},fad_rs2_fmt_fx1_rep1[14:0]}	),
  .din3( spu_fgu_rs2_fx1[63:0]						),
  .din4( fad_rs2_fmt_fx1_rep1[63:0]					),
  .sel0( fac_rs2_sel_fx1[0]						),
  .sel1( fac_rs2_sel_fx1[1]						),
  .sel2( fac_rs2_sel_fx1[2]						),
  .sel3( fac_rs2_sel_fx1[3]						),
  .dout( a3_rs2_ff[63:0]						),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_64	i_a3_rs2_buf		 (
  .din ( a3_rs2_ff[63:0]			),
  .dout( a3_rs2[63:0]				));

fgu_fpy_dp_inv_macro__stack_88c__width_64	i_a3_rs2_inv		 (
  .din ( a3_rs2_ff[63:0]			),
  .dout( a3_rs2_[63:0]				));




fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_00		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff00[0]                          ),
  .sel1( be_ff00[1]                          ),
  .sel2( be_ff00[2]                          ),
  .sel3( be_ff00[3]                          ),
  .sel4( be_ff00[4]                          ),
  .dout( bm00[64:0]                         ));

  assign bm00[67:65]	= { be_pout_ff[0] , be_hout_ff[0] , be_hout_ff[0]};	// PNN



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_01		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff01[0]                          ),
  .sel1( be_ff01[1]                          ),
  .sel2( be_ff01[2]                          ),
  .sel3( be_ff01[3]                          ),
  .sel4( be_ff01[4]                          ),
  .dout( bm01[66:2]                         ));

  assign bm01[68:67]	= { a3_xr_mode_fx2_ , be_pout_ff[1] };	// 1P
  assign bm01[1:0]	= { 1'b0            , be_hout_ff[0] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_02		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff02[0]                          ),
  .sel1( be_ff02[1]                          ),
  .sel2( be_ff02[2]                          ),
  .sel3( be_ff02[3]                          ),
  .sel4( be_ff02[4]                          ),
  .dout( bm02[68:4]                         ));

  assign bm02[70:69]	= { a3_xr_mode_fx2_ , be_pout_ff[2] };	// 1P
  assign bm02[3:2]	= { 1'b0            , be_hout_ff[1] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_03		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff03[0]                          ),
  .sel1( be_ff03[1]                          ),
  .sel2( be_ff03[2]                          ),
  .sel3( be_ff03[3]                          ),
  .sel4( be_ff03[4]                          ),
  .dout( bm03[70:6]                         ));

  assign bm03[72:71]	= { a3_xr_mode_fx2_ , be_pout_ff[3] };	// 1P
  assign bm03[5:4]	= { 1'b0            , be_hout_ff[2] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_04		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff04[0]                          ),
  .sel1( be_ff04[1]                          ),
  .sel2( be_ff04[2]                          ),
  .sel3( be_ff04[3]                          ),
  .sel4( be_ff04[4]                          ),
  .dout( bm04[72:8]                         ));

  assign bm04[74:73]	= { a3_xr_mode_fx2_ , be_pout_ff[4] };	// 1P
  assign bm04[7:6]	= { 1'b0            , be_hout_ff[3] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_05		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff05[0]                          ),
  .sel1( be_ff05[1]                          ),
  .sel2( be_ff05[2]                          ),
  .sel3( be_ff05[3]                          ),
  .sel4( be_ff05[4]                          ),
  .dout( bm05[74:10]                         ));

  assign bm05[76:75]	= { a3_xr_mode_fx2_ , be_pout_ff[5] };	// 1P
  assign bm05[9:8]	= { 1'b0            , be_hout_ff[4] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_06		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff06[0]                          ),
  .sel1( be_ff06[1]                          ),
  .sel2( be_ff06[2]                          ),
  .sel3( be_ff06[3]                          ),
  .sel4( be_ff06[4]                          ),
  .dout( bm06[76:12]                         ));

  assign bm06[78:77]	= { a3_xr_mode_fx2_ , be_pout_ff[6] };	// 1P
  assign bm06[11:10]	= { 1'b0            , be_hout_ff[5] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_07		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff07[0]                          ),
  .sel1( be_ff07[1]                          ),
  .sel2( be_ff07[2]                          ),
  .sel3( be_ff07[3]                          ),
  .sel4( be_ff07[4]                          ),
  .dout( bm07[78:14]                         ));

  assign bm07[80:79]	= { a3_xr_mode_fx2_ , be_pout_ff[7] };	// 1P
  assign bm07[13:12]	= { 1'b0            , be_hout_ff[6] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a3_bm_08		  (
  .din0({1'b0        , a3_rs2[63:0]         }),		// +1 * rs2
  .din1({              a3_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a3_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a3_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff08[0]                          ),
  .sel1( be_ff08[1]                          ),
  .sel2( be_ff08[2]                          ),
  .sel3( be_ff08[3]                          ),
  .sel4( be_ff08[4]                          ),
  .dout( bm08[80:16]                         ));

  assign bm08[82:81]	= { a3_xr_mode_fx2_ , be_pout_ff[8] };	// 1P
  assign bm08[15:14]	= { 1'b0            , be_hout_ff[7] };




fgu_fpy_dp_csa32_macro__stack_88c__width_69	a3_csa1_1		 (
 .i0   ({ { 1{1'b0}}, bm00[67:0]                    }),
 .i1   ({             bm01[68:0]                    }),
 .i2   ({             bm02[68:2]       , { 2{1'b0}} }),
 .carry(              a3_csa1_1_c[69:1]              ),
 .sum  (              a3_csa1_1_s[68:0]              ));

  assign a3_csa1_1_s[70:69]	= bm02[70:69];



fgu_fpy_dp_csa32_macro__stack_88c__width_69	a3_csa1_2		 (
 .i0   ({ { 2{1'b0}}, bm03[72:6]                    }),
 .i1   ({             bm04[74:6]                    }),
 .i2   ({             bm05[74:8]       , { 2{1'b0}} }),
 .carry(              a3_csa1_2_c[75:7]              ),
 .sum  (              a3_csa1_2_s[74:6]              ));

  assign a3_csa1_2_s[5:4]	= bm03[5:4];
  assign a3_csa1_2_s[76:75]	= bm05[76:75];



fgu_fpy_dp_csa32_macro__stack_88c__width_69	a3_csa1_3		 (
 .i0   ({ { 2{1'b0}}, bm06[78:12]                    }),
 .i1   ({             bm07[80:12]                    }),
 .i2   ({             bm08[80:14]       , { 2{1'b0}} }),
 .carry(              a3_csa1_3_c[81:13]              ),
 .sum  (              a3_csa1_3_s[80:12]              ));

  assign a3_csa1_3_s[11:10]	= bm06[11:10];
  assign a3_csa1_3_s[82:81]	= bm08[82:81];



//		*** 1st level to 2nd level ***
//
//	csa1_1_s[70:00]		csa1_1_c[69:01]
//	csa1_2_s[76:04]		csa1_2_c[75:07]
//	csa1_3_s[82:10]		csa1_3_c[81:13]


fgu_fpy_dp_csa32_macro__stack_88c__width_73	a3_csa2_1		 (
 .i0   ({ { 6{1'b0}}, a3_csa1_1_s[70:4]             }),
 .i1   ({             a3_csa1_2_s[76:4]             }),
 .i2   ({             a3_csa1_3_s[76:10], { 6{1'b0}} }),
 .carry(              a3_csa2_1_c[77:5]              ),
 .sum  (              a3_csa2_1_s[76:4]              ));

  assign a3_csa2_1_s[3:0]	= a3_csa1_1_s[3:0];
  assign a3_csa2_1_s[82:77]	= a3_csa1_3_s[82:77];



fgu_fpy_dp_csa32_macro__stack_88c__width_69	a3_csa2_2		 (
 .i0   ({ { 6{1'b0}}, a3_csa1_1_c[69:7]             }),
 .i1   ({             a3_csa1_2_c[75:7]             }),
 .i2   ({             a3_csa1_3_c[75:13], { 6{1'b0}} }),
 .carry(              a3_csa2_2_c[76:8]              ),
 .sum  (              a3_csa2_2_s[75:7]              ));

  assign a3_csa2_2_s[6:1]	= a3_csa1_1_c[6:1];
  assign a3_csa2_2_s[81:76]	= a3_csa1_3_c[81:76];




//		*** 2nd level to 3rd level ***
//
//	csa2_1_s[82:00]		csa2_1_c[77:05]
//	csa2_2_s[81:01]		csa2_2_c[76:08]


fgu_fpy_dp_csa42_macro__stack_88c__width_81	a3_csa3_1		 (
 .i0   ({             a3_csa2_1_s[81:1]              }),
 .i1   ({ { 4{1'b0}}, a3_csa2_1_c[77:5] , { 4{1'b0}} }),
 .i2   ({ { 5{1'b0}}, a3_csa2_2_c[76:8] , { 7{1'b0}} }),
 .i3   ({             a3_csa2_2_s[81:1]              }),
 .cin  (     1'b0                                      ), // 1 bit
 .cout ( a3_csa3_1_unused                              ), // 1 bit
 .carry( a3_csa3_1_c[82:2]                            ),
 .sum  ( a3_csa3_1_s[81:1]                            ));

  assign a3_csa3_1_s[0]	= a3_csa2_1_s[0];
  assign a3_csa3_1_s[82]	= a3_csa2_1_s[82];



fgu_fpy_dp_msff_macro__stack_88c__width_39	i_a3_s_ff_a		 (
  .scan_in(i_a3_s_ff_a_scanin),
  .scan_out(i_a3_s_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a3_csa3_1_s[82:44]			),	// [82] and [00] are early
  .dout( a3_csa3_1_s_ff[82:44]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a3_s_ff_b		 (
  .scan_in(i_a3_s_ff_b_scanin),
  .scan_out(i_a3_s_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a3_csa3_1_s[43:0]			),	// [82] and [00] are early
  .dout( a3_csa3_1_s_ff[43:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__stack_88c__width_37	i_a3_c_ff_a		 (
  .scan_in(i_a3_c_ff_a_scanin),
  .scan_out(i_a3_c_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a3_csa3_1_c[82:46]			),
  .dout( a3_csa3_1_c_ff[82:46]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a3_c_ff_b		 (
  .scan_in(i_a3_c_ff_b_scanin),
  .scan_out(i_a3_c_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a3_csa3_1_c[45:2]			),
  .dout( a3_csa3_1_c_ff[45:2]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// *** *** *** *** *** *** *** *** End   : "A3" 9:2 CSA Tree  *** *** *** *** *** ***





fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	a32_xor4_1		 (
  .din0( a3_csa2_1_s[80:18]			),
  .din1( a2_csa2_3_s[80:18]			),
  .dout( a32_xr4_1[80:18]			));

  assign a32_xr4_1[17:0]	= a3_csa2_1_s[17:0];
  assign a32_xr4_1[98:81]	= a2_csa2_3_s[98:81];


fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a32_x_ff_a		 (
  .scan_in(i_a32_x_ff_a_scanin),
  .scan_out(i_a32_x_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a32_xr4_1[87:44]			),
  .dout( a32_xr_ff[87:44]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a32_x_ff_b		 (
  .scan_in(i_a32_x_ff_b_scanin),
  .scan_out(i_a32_x_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a32_xr4_1[43:0]			),
  .dout( a32_xr_ff[43:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));





 
// *** *** *** *** *** *** *** *** Start : "A2" 9:2 CSA Tree  *** *** *** *** *** ***

fgu_fpy_dp_msff_macro__stack_88c__width_31	i_a2_be_ff_a		 (
  .scan_in(i_a2_be_ff_a_scanin),
  .scan_out(i_a2_be_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ({a32_xr4_1[98:88]	,
         xr_mode_fx1_		,
         be_pout[17:9]		,
         be17[4:0]		,
         be16[4:0]}                             ),
  .dout({a32_xr_ff[98:88]	,
         a2_xr_mode_fx2_	,
         be_pout_ff[17:9]	,
         be_ff17[4:0]		,
         be_ff16[4:0]}                          ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a2_be_ff_b		 (
  .scan_in(i_a2_be_ff_b_scanin),
  .scan_out(i_a2_be_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ({be15[4:0]		,
         be14[4:0]		,
         be13[4:0]		,
         be12[4:0]		,
         be11[4:0]		,
         be10[4:0]		,
         be09[4:0]		,
         be_hout[16:8]}			),
  .dout({be_ff15[4:0]		,
         be_ff14[4:0]		,
         be_ff13[4:0]		,
         be_ff12[4:0]		,
         be_ff11[4:0]		,
         be_ff10[4:0]		,
         be_ff09[4:0]		,
         be_hout_ff[16:8]}			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_3	i_a2_rs2_fx1_ebuf	 (
  .din ({rs2_fx1_ebf[63]    ,rs2_fx1_ebf[47]    ,rs2_fx1_ebf[31]}		),
  .dout({rs2_fx1_ebf2[63]   ,rs2_fx1_ebf2[47]   ,rs2_fx1_ebf2[31]}		));


fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_64	i_a2_rs2_ff		 (
  .scan_in(i_a2_rs2_ff_scanin),
  .scan_out(i_a2_rs2_ff_scanout),
  .clk ( l2clk								),
  .en  ( mul_clken_rep0							),
  .din0({{32{1'b0}},{17{rs2_fx1_ebf2[63]}},fad_rs2_fmt_fx1_rep1[62:48]}	),
  .din1({{32{1'b0}},{17{rs2_fx1_ebf2[47]}},fad_rs2_fmt_fx1_rep1[46:32]}	),
  .din2({{32{1'b0}},{17{rs2_fx1_ebf2[31]}},fad_rs2_fmt_fx1_rep1[30:16]}	),
  .din3( spu_fgu_rs2_fx1[63:0]						),
  .din4( fad_rs2_fmt_fx1_rep1[63:0]					),
  .sel0( fac_rs2_sel_fx1[0]						),
  .sel1( fac_rs2_sel_fx1[1]						),
  .sel2( fac_rs2_sel_fx1[2]						),
  .sel3( fac_rs2_sel_fx1[3]						),
  .dout( a2_rs2_ff[63:0]						),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_64	i_a2_rs2_buf		 (
  .din ( a2_rs2_ff[63:0]			),
  .dout( a2_rs2[63:0]				));

fgu_fpy_dp_inv_macro__stack_88c__width_64	i_a2_rs2_inv		 (
  .din ( a2_rs2_ff[63:0]			),
  .dout( a2_rs2_[63:0]				));




fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_09		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff09[0]                          ),
  .sel1( be_ff09[1]                          ),
  .sel2( be_ff09[2]                          ),
  .sel3( be_ff09[3]                          ),
  .sel4( be_ff09[4]                          ),
  .dout( bm09[82:18]                         ));

  assign bm09[84:83]	= { a2_xr_mode_fx2_ , be_pout_ff[9] };	// 1P
  assign bm09[17:16]	= { 1'b0            , be_hout_ff[8] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_10		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff10[0]                          ),
  .sel1( be_ff10[1]                          ),
  .sel2( be_ff10[2]                          ),
  .sel3( be_ff10[3]                          ),
  .sel4( be_ff10[4]                          ),
  .dout( bm10[84:20]                         ));

  assign bm10[86:85]	= { a2_xr_mode_fx2_ , be_pout_ff[10]};	// 1P
  assign bm10[19:18]	= { 1'b0            , be_hout_ff[9] };



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_11		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff11[0]                          ),
  .sel1( be_ff11[1]                          ),
  .sel2( be_ff11[2]                          ),
  .sel3( be_ff11[3]                          ),
  .sel4( be_ff11[4]                          ),
  .dout( bm11[86:22]                         ));

  assign bm11[88:87]	= { a2_xr_mode_fx2_ , be_pout_ff[11]};	// 1P
  assign bm11[21:20]	= { 1'b0            , be_hout_ff[10]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_12		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff12[0]                          ),
  .sel1( be_ff12[1]                          ),
  .sel2( be_ff12[2]                          ),
  .sel3( be_ff12[3]                          ),
  .sel4( be_ff12[4]                          ),
  .dout( bm12[88:24]                         ));

  assign bm12[90:89]	= { a2_xr_mode_fx2_ , be_pout_ff[12]};	// 1P
  assign bm12[23:22]	= { 1'b0            , be_hout_ff[11]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_13		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff13[0]                          ),
  .sel1( be_ff13[1]                          ),
  .sel2( be_ff13[2]                          ),
  .sel3( be_ff13[3]                          ),
  .sel4( be_ff13[4]                          ),
  .dout( bm13[90:26]                         ));

  assign bm13[92:91]	= { a2_xr_mode_fx2_ , be_pout_ff[13]};	// 1P
  assign bm13[25:24]	= { 1'b0            , be_hout_ff[12]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_14		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff14[0]                          ),
  .sel1( be_ff14[1]                          ),
  .sel2( be_ff14[2]                          ),
  .sel3( be_ff14[3]                          ),
  .sel4( be_ff14[4]                          ),
  .dout( bm14[92:28]                         ));

  assign bm14[94:93]	= { a2_xr_mode_fx2_ , be_pout_ff[14]};	// 1P
  assign bm14[27:26]	= { 1'b0            , be_hout_ff[13]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_15		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff15[0]                          ),
  .sel1( be_ff15[1]                          ),
  .sel2( be_ff15[2]                          ),
  .sel3( be_ff15[3]                          ),
  .sel4( be_ff15[4]                          ),
  .dout( bm15[94:30]                         ));

  assign bm15[96:95]	= { a2_xr_mode_fx2_ , be_pout_ff[15]};	// 1P
  assign bm15[29:28]	= { 1'b0            , be_hout_ff[14]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_16		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff16[0]                          ),
  .sel1( be_ff16[1]                          ),
  .sel2( be_ff16[2]                          ),
  .sel3( be_ff16[3]                          ),
  .sel4( be_ff16[4]                          ),
  .dout( bm16[96:32]                         ));

  assign bm16[98:97]	= { a2_xr_mode_fx2_ , be_pout_ff[16]};	// 1P
  assign bm16[31:30]	= { 1'b0            , be_hout_ff[15]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a2_bm_17		  (
  .din0({1'b0        , a2_rs2[63:0]         }),		// +1 * rs2
  .din1({              a2_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a2_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a2_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff17[0]                          ),
  .sel1( be_ff17[1]                          ),
  .sel2( be_ff17[2]                          ),
  .sel3( be_ff17[3]                          ),
  .sel4( be_ff17[4]                          ),
  .dout( bm17[98:34]                         ));

  assign bm17[100:99]	= { a2_xr_mode_fx2_ , be_pout_ff[17]};	// 1P
  assign bm17[33:32]	= { 1'b0            , be_hout_ff[16]};


//	bm09[84:16]	bm10[86:18]	bm11[88:20]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a2_csa1_4		 (
 .i0   ({ { 2{1'b0}}, bm09[84:18]                    }),
 .i1   ({             bm10[86:18]                    }),
 .i2   ({             bm11[86:20]       , { 2{1'b0}} }),
 .carry(              a2_csa1_4_c[87:19]              ),
 .sum  (              a2_csa1_4_s[86:18]              ));

  assign a2_csa1_4_s[17:16]	= bm09[17:16];
  assign a2_csa1_4_s[88:87]	= bm11[88:87];



//	bm12[90:22]	bm13[92:24]	bm14[94:26]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a2_csa1_5		 (
 .i0   ({ { 2{1'b0}}, bm12[90:24]                    }),
 .i1   ({             bm13[92:24]                    }),
 .i2   ({             bm14[92:26]       , { 2{1'b0}} }),
 .carry(              a2_csa1_5_c[93:25]              ),
 .sum  (              a2_csa1_5_s[92:24]              ));

  assign a2_csa1_5_s[23:22]	= bm12[23:22];
  assign a2_csa1_5_s[94:93]	= bm14[94:93];



//	bm15[96:28]	bm16[98:30]	bm17[100:32]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a2_csa1_6		 (
 .i0   ({ { 2{1'b0}}, bm15[96:30]                    }),
 .i1   ({             bm16[98:30]                    }),
 .i2   ({             bm17[98:32]       , { 2{1'b0}} }),
 .carry(              a2_csa1_6_c[99:31]              ),
 .sum  (              a2_csa1_6_s[98:30]              ));

  assign a2_csa1_6_s[29:28]	= bm15[29:28];
  assign a2_csa1_6_s[100:99]	= bm17[100:99];




//		*** 1st level to 2nd level ***
//
//	csa1_4_s[88:16]		csa1_4_c[87:19]
//	csa1_5_s[94:22]		csa1_5_c[93:25]
//	csa1_6_s[100:28]	csa1_6_c[99:31]


fgu_fpy_dp_csa32_macro__stack_88c__width_73	a2_csa2_3		 (
 .i0   ({ { 6{1'b0}}, a2_csa1_4_s[88:22]             }),
 .i1   ({             a2_csa1_5_s[94:22]             }),
 .i2   ({             a2_csa1_6_s[94:28], { 6{1'b0}} }),
 .carry(              a2_csa2_3_c[95:23]              ),
 .sum  (              a2_csa2_3_s[94:22]              ));

  assign a2_csa2_3_s[21:16]	= a2_csa1_4_s[21:16];
  assign a2_csa2_3_s[100:95]	= a2_csa1_6_s[100:95];



fgu_fpy_dp_csa32_macro__stack_88c__width_69	a2_csa2_4		 (
 .i0   ({ { 6{1'b0}}, a2_csa1_4_c[87:25]             }),
 .i1   ({             a2_csa1_5_c[93:25]             }),
 .i2   ({             a2_csa1_6_c[93:31], { 6{1'b0}} }),
 .carry(              a2_csa2_4_c[94:26]              ),
 .sum  (              a2_csa2_4_s[93:25]              ));

  assign a2_csa2_4_s[24:19]	= a2_csa1_4_c[24:19];
  assign a2_csa2_4_s[99:94]	= a2_csa1_6_c[99:94];




//		*** 2nd level to 3rd level ***
//
//	csa2_3_s[100:16]	csa2_3_c[95:23]
//	csa2_4_s[99:19]		csa2_4_c[94:26]


fgu_fpy_dp_csa42_macro__stack_88c__width_81	a2_csa3_2		 (
 .i0   ({             a2_csa2_3_s[99:19]              }),
 .i1   ({ { 4{1'b0}}, a2_csa2_3_c[95:23] , { 4{1'b0}} }),
 .i2   ({ { 5{1'b0}}, a2_csa2_4_c[94:26] , { 7{1'b0}} }),
 .i3   ({             a2_csa2_4_s[99:19]              }),
 .cin  (     1'b0                                      ), // 1 bit
 .cout ( a2_csa3_2_unused                              ), // 1 bit
 .carry( a2_csa3_2_c[100:20]                           ),
 .sum  ( a2_csa3_2_s[99:19]                            ));

  assign a2_csa3_2_s[18:16]	= a2_csa2_3_s[18:16];
  assign a2_csa3_2_s[100]	= a2_csa2_3_s[100];



fgu_fpy_dp_msff_macro__stack_88c__width_41	i_a2_s_ff_a		 (
  .scan_in(i_a2_s_ff_a_scanin),
  .scan_out(i_a2_s_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a2_csa3_2_s[100:60]			),	// [100] and [18:16] are early
  .dout( a2_csa3_2_s_ff[100:60]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a2_s_ff_b		 (
  .scan_in(i_a2_s_ff_b_scanin),
  .scan_out(i_a2_s_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a2_csa3_2_s[59:16]			),	// [100] and [18:16] are early
  .dout( a2_csa3_2_s_ff[59:16]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__stack_88c__width_37	i_a2_c_ff_a		 (
  .scan_in(i_a2_c_ff_a_scanin),
  .scan_out(i_a2_c_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a2_csa3_2_c[100:64]			),
  .dout( a2_csa3_2_c_ff[100:64]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a2_c_ff_b		 (
  .scan_in(i_a2_c_ff_b_scanin),
  .scan_out(i_a2_c_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a2_csa3_2_c[63:20]			),
  .dout( a2_csa3_2_c_ff[63:20]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));




// *** *** *** *** *** *** *** *** End   : "A2" 9:2 CSA Tree  *** *** *** *** *** ***



 
// *** *** *** *** *** *** *** *** Start : "A1" 9:2 CSA Tree  *** *** *** *** *** ***

fgu_fpy_dp_msff_macro__stack_88c__width_64	i_a1_be_ff		 (
  .scan_in(i_a1_be_ff_scanin),
  .scan_out(i_a1_be_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ({xr_mode_fx1_		,
         be_pout[26:18]		,
         be26[4:0]		,
         be25[4:0]		,
         be24[4:0]		,
         be23[4:0]		,
         be22[4:0]		,
         be21[4:0]		,
         be20[4:0]		,
         be19[4:0]		,
         be18[4:0]		,
         be_hout[25:17]}			),
  .dout({a1_xr_mode_fx2_	,
         be_pout_ff[26:18]	,
         be_ff26[4:0]		,
         be_ff25[4:0]		,
         be_ff24[4:0]		,
         be_ff23[4:0]		,
         be_ff22[4:0]		,
         be_ff21[4:0]		,
         be_ff20[4:0]		,
         be_ff19[4:0]		,
         be_ff18[4:0]		,
         be_hout_ff[25:17]}			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_2	i_a1_rs2_fx1_ebuf	 (
  .din ({rs2_fx1_ebf[63]    ,rs2_fx1_ebf[47]}		),
  .dout({rs2_fx1_ebf1[63]   ,rs2_fx1_ebf1[47]}		));



fgu_fpy_dp_msff_macro__mux_aope__ports_4__stack_88c__width_64	i_a1_rs2_ff		 (
  .scan_in(i_a1_rs2_ff_scanin),
  .scan_out(i_a1_rs2_ff_scanout),
  .clk ( l2clk								),
  .en  ( mul_clken_rep0							),
  .din0({{32{1'b0}},{17{rs2_fx1_ebf1[63]}},fad_rs2_fmt_fx1_rep0[62:48]}	),
  .din1({{32{1'b0}},{17{rs2_fx1_ebf1[47]}},fad_rs2_fmt_fx1_rep0[46:32]}	),
  .din2( spu_fgu_rs2_fx1[63:0]						),
  .din3( fad_rs2_fmt_fx1_rep0[63:0]					),
  .sel0( fac_rs2_sel_fx1[0]						),
  .sel1( fac_rs2_sel_fx1[2]						),
  .sel2( fac_rs2_sel_fx1[3]						),
  .dout( a1_rs2_ff[63:0]						),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_64	i_a1_rs2_buf		 (
  .din ( a1_rs2_ff[63:0]			),
  .dout( a1_rs2[63:0]				));

fgu_fpy_dp_inv_macro__stack_88c__width_64	i_a1_rs2_inv		 (
  .din ( a1_rs2_ff[63:0]			),
  .dout( a1_rs2_[63:0]				));




fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_18		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff18[0]                          ),
  .sel1( be_ff18[1]                          ),
  .sel2( be_ff18[2]                          ),
  .sel3( be_ff18[3]                          ),
  .sel4( be_ff18[4]                          ),
  .dout( bm18[100:36]                        ));

  assign bm18[102:101]	= { a1_xr_mode_fx2_ , be_pout_ff[18]};	// 1P
  assign bm18[35:34]	= { 1'b0            , be_hout_ff[17]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_19		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff19[0]                          ),
  .sel1( be_ff19[1]                          ),
  .sel2( be_ff19[2]                          ),
  .sel3( be_ff19[3]                          ),
  .sel4( be_ff19[4]                          ),
  .dout( bm19[102:38]                        ));

  assign bm19[104:103]	= { a1_xr_mode_fx2_ , be_pout_ff[19]};	// 1P
  assign bm19[37:36]	= { 1'b0            , be_hout_ff[18]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_20		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff20[0]                          ),
  .sel1( be_ff20[1]                          ),
  .sel2( be_ff20[2]                          ),
  .sel3( be_ff20[3]                          ),
  .sel4( be_ff20[4]                          ),
  .dout( bm20[104:40]                        ));

  assign bm20[106:105]	= { a1_xr_mode_fx2_ , be_pout_ff[20]};	// 1P
  assign bm20[39:38]	= { 1'b0            , be_hout_ff[19]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_21		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff21[0]                          ),
  .sel1( be_ff21[1]                          ),
  .sel2( be_ff21[2]                          ),
  .sel3( be_ff21[3]                          ),
  .sel4( be_ff21[4]                          ),
  .dout( bm21[106:42]                        ));

  assign bm21[108:107]	= { a1_xr_mode_fx2_ , be_pout_ff[21]};	// 1P
  assign bm21[41:40]	= { 1'b0            , be_hout_ff[20]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_22		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff22[0]                          ),
  .sel1( be_ff22[1]                          ),
  .sel2( be_ff22[2]                          ),
  .sel3( be_ff22[3]                          ),
  .sel4( be_ff22[4]                          ),
  .dout( bm22[108:44]                        ));

  assign bm22[110:109]	= { a1_xr_mode_fx2_ , be_pout_ff[22]};	// 1P
  assign bm22[43:42]	= { 1'b0            , be_hout_ff[21]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_23		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff23[0]                          ),
  .sel1( be_ff23[1]                          ),
  .sel2( be_ff23[2]                          ),
  .sel3( be_ff23[3]                          ),
  .sel4( be_ff23[4]                          ),
  .dout( bm23[110:46]                        ));

  assign bm23[112:111]	= { a1_xr_mode_fx2_ , be_pout_ff[23]};	// 1P
  assign bm23[45:44]	= { 1'b0            , be_hout_ff[22]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_24		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff24[0]                          ),
  .sel1( be_ff24[1]                          ),
  .sel2( be_ff24[2]                          ),
  .sel3( be_ff24[3]                          ),
  .sel4( be_ff24[4]                          ),
  .dout( bm24[112:48]                        ));

  assign bm24[114:113]	= { a1_xr_mode_fx2_ , be_pout_ff[24]};	// 1P
  assign bm24[47:46]	= { 1'b0            , be_hout_ff[23]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_25		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff25[0]                          ),
  .sel1( be_ff25[1]                          ),
  .sel2( be_ff25[2]                          ),
  .sel3( be_ff25[3]                          ),
  .sel4( be_ff25[4]                          ),
  .dout( bm25[114:50]                        ));

  assign bm25[116:115]	= { a1_xr_mode_fx2_ , be_pout_ff[25]};	// 1P
  assign bm25[49:48]	= { 1'b0            , be_hout_ff[24]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a1_bm_26		  (
  .din0({1'b0        , a1_rs2[63:0]         }),		// +1 * rs2
  .din1({              a1_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a1_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a1_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff26[0]                          ),
  .sel1( be_ff26[1]                          ),
  .sel2( be_ff26[2]                          ),
  .sel3( be_ff26[3]                          ),
  .sel4( be_ff26[4]                          ),
  .dout( bm26[116:52]                        ));

  assign bm26[118:117]	= { a1_xr_mode_fx2_ , be_pout_ff[26]};	// 1P
  assign bm26[51:50]	= { 1'b0            , be_hout_ff[25]};



//	bm18[102:34]	bm19[104:36]	bm20[106:38]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a1_csa1_7		 (
 .i0   ({ { 2{1'b0}}, bm18[102:36]                   }),
 .i1   ({             bm19[104:36]                   }),
 .i2   ({             bm20[104:38]      , { 2{1'b0}} }),
 .carry(              a1_csa1_7_c[105:37]             ),
 .sum  (              a1_csa1_7_s[104:36]             ));

  assign a1_csa1_7_s[35:34]	= bm18[35:34];
  assign a1_csa1_7_s[106:105]	= bm20[106:105];



//	bm21[108:40]	bm22[110:42]	bm23[112:44]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a1_csa1_8		 (
 .i0   ({ { 2{1'b0}}, bm21[108:42]                   }),
 .i1   ({             bm22[110:42]                   }),
 .i2   ({             bm23[110:44]      , { 2{1'b0}} }),
 .carry(              a1_csa1_8_c[111:43]             ),
 .sum  (              a1_csa1_8_s[110:42]             ));

  assign a1_csa1_8_s[41:40]	= bm21[41:40];
  assign a1_csa1_8_s[112:111]	= bm23[112:111];



//	bm24[114:46]	bm25[116:48]	bm26[118:50]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a1_csa1_9		 (
 .i0   ({ { 2{1'b0}}, bm24[114:48]                   }),
 .i1   ({             bm25[116:48]                   }),
 .i2   ({             bm26[116:50]      , { 2{1'b0}} }),
 .carry(              a1_csa1_9_c[117:49]             ),
 .sum  (              a1_csa1_9_s[116:48]             ));

  assign a1_csa1_9_s[47:46]	= bm24[47:46];
  assign a1_csa1_9_s[118:117]	= bm26[118:117];



//		*** 1st level to 2nd level ***
//
//	csa1_7_s[106:34]	csa1_7_c[105:37]
//	csa1_8_s[112:40]	csa1_8_c[111:43]
//	csa1_9_s[118:46]	csa1_9_c[117:49]


fgu_fpy_dp_csa32_macro__stack_88c__width_73	a1_csa2_5		 (
 .i0   ({ { 6{1'b0}}, a1_csa1_7_s[106:40]            }),
 .i1   ({             a1_csa1_8_s[112:40]            }),
 .i2   ({             a1_csa1_9_s[112:46],{ 6{1'b0}} }),
 .carry(              a1_csa2_5_c[113:41]             ),
 .sum  (              a1_csa2_5_s[112:40]             ));

  assign a1_csa2_5_s[39:34]	= a1_csa1_7_s[39:34];
  assign a1_csa2_5_s[118:113]	= a1_csa1_9_s[118:113];



fgu_fpy_dp_csa32_macro__stack_88c__width_69	a1_csa2_6		 (
 .i0   ({ { 6{1'b0}}, a1_csa1_7_c[105:43]            }),
 .i1   ({             a1_csa1_8_c[111:43]            }),
 .i2   ({             a1_csa1_9_c[111:49],{ 6{1'b0}} }),
 .carry(              a1_csa2_6_c[112:44]             ),
 .sum  (              a1_csa2_6_s[111:43]             ));

  assign a1_csa2_6_s[42:37]	= a1_csa1_7_c[42:37];
  assign a1_csa2_6_s[117:112]	= a1_csa1_9_c[117:112];



//		*** 2nd level to 3rd level ***
//
//	csa2_5_s[118:34]	csa2_5_c[113:41]
//	csa2_6_s[117:37]	csa2_6_c[112:44]


fgu_fpy_dp_csa42_macro__stack_88c__width_81	a1_csa3_3		 (
 .i0   ({             a1_csa2_5_s[117:37]             }),
 .i1   ({ { 4{1'b0}}, a1_csa2_5_c[113:41], { 4{1'b0}} }),
 .i2   ({ { 5{1'b0}}, a1_csa2_6_c[112:44], { 7{1'b0}} }),
 .i3   ({             a1_csa2_6_s[117:37]             }),
 .cin  (     1'b0                                      ), // 1 bit
 .cout ( a1_csa3_3_unused                              ), // 1 bit
 .carry( a1_csa3_3_c[118:38]                           ),
 .sum  ( a1_csa3_3_s[117:37]                           ));

  assign a1_csa3_3_s[36:34]	= a1_csa2_5_s[36:34];
  assign a1_csa3_3_s[118]	= a1_csa2_5_s[118];



fgu_fpy_dp_msff_macro__stack_88c__width_41	i_a1_s_ff_a		 (
  .scan_in(i_a1_s_ff_a_scanin),
  .scan_out(i_a1_s_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a1_csa3_3_s[118:78]			),	// [118] and [36:34] are early
  .dout( a1_csa3_3_s_ff[118:78]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a1_s_ff_b		 (
  .scan_in(i_a1_s_ff_b_scanin),
  .scan_out(i_a1_s_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a1_csa3_3_s[77:34]			),	// [118] and [36:34] are early
  .dout( a1_csa3_3_s_ff[77:34]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__stack_88c__width_37	i_a1_c_ff_a		 (
  .scan_in(i_a1_c_ff_a_scanin),
  .scan_out(i_a1_c_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a1_csa3_3_c[118:82]			),
  .dout( a1_csa3_3_c_ff[118:82]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a1_c_ff_b		 (
  .scan_in(i_a1_c_ff_b_scanin),
  .scan_out(i_a1_c_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a1_csa3_3_c[81:38]			),
  .dout( a1_csa3_3_c_ff[81:38]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



// *** *** *** *** *** *** *** *** End   : "A1" 9:2 CSA Tree  *** *** *** *** *** ***


fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	a10_xor4_2		 (
  .din0( a1_csa2_5_s[116:54]			),
  .din1( a0_xr_in[116:54]			),
  .dout( a10_xr4_2[116:54]			));

  assign a10_xr4_2[53:36]	= a1_csa2_5_s[53:36];
  assign a10_xr4_2[126:117]	= a0_xr_in[126:117];


fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a10_x_ff_a		 (
  .scan_in(i_a10_x_ff_a_scanin),
  .scan_out(i_a10_x_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a10_xr4_2[123:80]			),
  .dout( a10_xr_ff[123:80]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a10_x_ff_b		 (
  .scan_in(i_a10_x_ff_b_scanin),
  .scan_out(i_a10_x_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ( a10_xr4_2[79:36]			),
  .dout( a10_xr_ff[79:36]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


 
// *** *** *** *** *** *** *** *** Start : "A0" 6:2 CSA Tree  *** *** *** *** *** ***

fgu_fpy_dp_msff_macro__stack_88c__width_41	i_a0_be_ff		 (
  .scan_in(i_a0_be_ff_scanin),
  .scan_out(i_a0_be_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din ({a10_xr4_2[126:124]	,
         xr_mode_fx1_		,
         be_pout[31:27]		,
         be32_b0		,
         be31[4:0]		,
         be30[4:0]		,
         be29[4:0]		,
         be28[4:0]		,
         be27[4:0]		,
         be_hout[31:26]}			),
  .dout({a10_xr_ff[126:124]	,
         a0_xr_mode_fx2_	,
         be_pout_ff[31:27]	,
         be_ff32_b0		,
         be_ff31[4:0]		,
         be_ff30[4:0]		,
         be_ff29[4:0]		,
         be_ff28[4:0]		,
         be_ff27[4:0]		,
         be_hout_ff[31:26]}			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_2	i_a0_rs2_fx1_ebuf	 (
  .din ({rs2_fx1_ebf[63]    ,rs2_fx1_ebf[47]}		),
  .dout({rs2_fx1_ebf0[63]   ,rs2_fx1_ebf0[47]}		));



fgu_fpy_dp_msff_macro__mux_aope__ports_4__stack_88c__width_64	i_a0_rs2_ff		 (
  .scan_in(i_a0_rs2_ff_scanin),
  .scan_out(i_a0_rs2_ff_scanout),
  .clk ( l2clk								),
  .en  ( mul_clken_rep0							),
  .din0({{32{1'b0}},{17{rs2_fx1_ebf0[47]}},fad_rs2_fmt_fx1_rep0[46:32]}	),
  .din1({{32{1'b0}},{17{rs2_fx1_ebf0[63]}},fad_rs2_fmt_fx1_rep0[62:48]}	),
  .din2( spu_fgu_rs2_fx1[63:0]						),
  .din3( fad_rs2_fmt_fx1_rep0[63:0]					),
  .sel0( fac_rs2_sel_fx1[1]						),
  .sel1( fac_rs2_sel_fx1[2]						),
  .sel2( fac_rs2_sel_fx1[3]						),
  .dout( a0_rs2_ff[63:0]						),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_buff_macro__stack_88c__width_64	i_a0_rs2_buf		 (
  .din ( a0_rs2_ff[63:0]			),
  .dout( a0_rs2[63:0]				));

fgu_fpy_dp_inv_macro__stack_88c__width_64	i_a0_rs2_inv		 (
  .din ( a0_rs2_ff[63:0]			),
  .dout( a0_rs2_[63:0]				));




fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a0_bm_27		  (
  .din0({1'b0        , a0_rs2[63:0]         }),		// +1 * rs2
  .din1({              a0_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a0_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a0_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff27[0]                          ),
  .sel1( be_ff27[1]                          ),
  .sel2( be_ff27[2]                          ),
  .sel3( be_ff27[3]                          ),
  .sel4( be_ff27[4]                          ),
  .dout( bm27[118:54]                        ));

  assign bm27[120:119]	= { a0_xr_mode_fx2_ , be_pout_ff[27]};	// 1P
  assign bm27[53:52]	= { 1'b0            , be_hout_ff[26]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a0_bm_28		  (
  .din0({1'b0        , a0_rs2[63:0]         }),		// +1 * rs2
  .din1({              a0_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a0_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a0_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff28[0]                          ),
  .sel1( be_ff28[1]                          ),
  .sel2( be_ff28[2]                          ),
  .sel3( be_ff28[3]                          ),
  .sel4( be_ff28[4]                          ),
  .dout( bm28[120:56]                        ));

  assign bm28[122:121]	= { a0_xr_mode_fx2_ , be_pout_ff[28]};	// 1P
  assign bm28[55:54]	= { 1'b0            , be_hout_ff[27]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a0_bm_29		  (
  .din0({1'b0        , a0_rs2[63:0]         }),		// +1 * rs2
  .din1({              a0_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a0_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a0_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff29[0]                          ),
  .sel1( be_ff29[1]                          ),
  .sel2( be_ff29[2]                          ),
  .sel3( be_ff29[3]                          ),
  .sel4( be_ff29[4]                          ),
  .dout( bm29[122:58]                        ));

  assign bm29[124:123]	= { a0_xr_mode_fx2_ , be_pout_ff[29]};	// 1P
  assign bm29[57:56]	= { 1'b0            , be_hout_ff[28]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a0_bm_30		  (
  .din0({1'b0        , a0_rs2[63:0]         }),		// +1 * rs2
  .din1({              a0_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a0_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a0_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff30[0]                          ),
  .sel1( be_ff30[1]                          ),
  .sel2( be_ff30[2]                          ),
  .sel3( be_ff30[3]                          ),
  .sel4( be_ff30[4]                          ),
  .dout( bm30[124:60]                        ));

  assign bm30[126:125]	= { a0_xr_mode_fx2_ , be_pout_ff[30]};	// 1P
  assign bm30[59:58]	= { 1'b0            , be_hout_ff[29]};



fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65	i_a0_bm_31		  (
  .din0({1'b0        , a0_rs2[63:0]         }),		// +1 * rs2
  .din1({              a0_rs2[63:0]  , 1'b0 }),		// +2 * rs2
  .din2({              a0_rs2_[63:0] , 1'b1 }),		// -2 * rs2
  .din3({1'b1        , a0_rs2_[63:0]        }),		// -1 * rs2
  .din4( rs2_3x[64:0]                        ),		// +3 * rs2
  .sel0( be_ff31[0]                          ),
  .sel1( be_ff31[1]                          ),
  .sel2( be_ff31[2]                          ),
  .sel3( be_ff31[3]                          ),
  .sel4( be_ff31[4]                          ),
  .dout( bm31[126:62]                        ));

  assign bm31[127]	= {                   be_pout_ff[31]};	// 1P
  assign bm31[61:60]	= { 1'b0            , be_hout_ff[30]};


fgu_fpy_dp_mux_macro__mux_aope__ports_2__stack_88c__width_64	i_a0_bm_32		  (
  .din0({              a0_rs2[63:0]         }),		// +1 * rs2
  .din1( {64{1'b0}}                          ),
  .sel0( be_ff32_b0                          ),
  .dout( bm32[127:64]                        ));

  assign bm32[135:128]	= {8{a0_xr_mode_fx2_}                };	// Extend beyond ACCUM range
  assign bm32[63:62]	= { 1'b0            , be_hout_ff[31]};



//	bm27[120:52]	bm28[122:54]	bm29[124:56]

fgu_fpy_dp_csa32_macro__stack_88c__width_69	a0_csa2_7		 (
 .i0   ({ { 2{1'b0}}, bm27[120:54]                   }),
 .i1   ({             bm28[122:54]                   }),
 .i2   ({             bm29[122:56]      , { 2{1'b0}} }),
 .carry(              a0_csa2_7_c[123:55]             ),
 .sum  (              a0_csa2_7_s[122:54]             ));

  assign a0_csa2_7_s[53:52]	= bm27[53:52];
  assign a0_csa2_7_s[124:123]	= bm29[124:123];



//	bm30[126:58]	bm31[127:60]	bm32[135:62]

fgu_fpy_dp_csa32_macro__stack_88c__width_68	a0_csa2_8		 (
 .i0   ({ { 1{1'b0}}, bm30[126:60]                   }),
 .i1   ({             bm31[127:60]                   }),
 .i2   ({             bm32[127:62]      , { 2{1'b0}} }),
 .carry(                      a0_csa2_8_c[128:61]     ),
 .sum  (                      a0_csa2_8_s[127:60]     ));

  assign a0_csa2_8_s[59:58]	= bm30[59:58];
  assign a0_csa2_8_s[135:128]	= bm32[135:128];


//		*** 2nd level to 3rd level ***
//
//	csa2_7_s[124:52]	csa2_7_c[123:55]
//	csa2_8_s[135:58]	csa2_8_c[128:61]


fgu_fpy_dp_csa42_macro__stack_88c__width_74	a0_csa3_4		 (
 .i0   ({ { 4{1'b0}}, a0_csa2_7_s[124:55]             }),
 .i1   ({ { 5{1'b0}}, a0_csa2_7_c[123:55]             }),
 .i2   ({             a0_csa2_8_c[128:61], { 6{1'b0}} }),
 .i3   ({             a0_csa2_8_s[128:58], { 3{1'b0}} }),
 .cin  (     1'b0                                      ), // 1 bit
 .cout ( a0_csa3_4_unused                              ), // 1 bit
 .carry(                      a0_csa3_4_c[129:56]      ),
 .sum  (                      a0_csa3_4_s[128:55]      ));

  assign a0_csa3_4_s[54:52]	= a0_csa2_7_s[54:52];
  assign a0_csa3_4_s[135:129]	= a0_csa2_8_s[135:129];



// a0_csa2_7_s[122:54]	a0_csa2_8_s[126:60]

fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	a0_xor3_0		 (
  .din0( a0_csa2_7_s[122:60]			),
  .din1( a0_csa2_8_s[122:60]			),
  .dout( a0_xr_in[122:60]			));

  assign a0_xr_in[59:54]	= a0_csa2_7_s[59:54];
  assign a0_xr_in[126:123]	= a0_csa2_8_s[126:123];



fgu_fpy_dp_msff_macro__stack_88c__width_40	i_a0_s_ff_a		 (
  .scan_in(i_a0_s_ff_a_scanin),
  .scan_out(i_a0_s_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din ( a0_csa3_4_s[135:96]			),
  .dout( a0_csa3_4_s_ff[135:96]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a0_s_ff_b		 (
  .scan_in(i_a0_s_ff_b_scanin),
  .scan_out(i_a0_s_ff_b_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0 			),
  .din ( a0_csa3_4_s[95:52]			),
  .dout( a0_csa3_4_s_ff[95:52]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__stack_88c__width_36	i_a0_c_ff_a		 (
  .scan_in(i_a0_c_ff_a_scanin),
  .scan_out(i_a0_c_ff_a_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep01			),
  .din (a0_csa3_4_c[129:94]                     ),
  .dout(a0_csa3_4_c_ff[129:94]                  ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

fgu_fpy_dp_msff_macro__stack_88c__width_44	i_a0_c_ff_b		 (
  .scan_in(i_a0_c_ff_b_scanin),
  .scan_out(i_a0_c_ff_b_scanout),
  .clk ( l2clk							),
  .en  ( mul_clken_rep0						),
  .din ({a0_csa3_4_c[93:87]    , fac_accum_sel_fx3[6:2] , fac_accum_sel_fx3[0] , a0_csa3_4_c[86:56]}    ),
  .dout({a0_csa3_4_c_ff[93:87] ,     accum_sel_fx4[6:2] ,     accum_sel_fx4_b0 , a0_csa3_4_c_ff[86:56]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
 

// *** *** *** *** *** *** *** *** End   : "A0" 6:2 CSA Tree  *** *** *** *** *** ***



 
// *** *** *** *** *** *** *** *** Start : "A4" 8:2 CSA Tree  *** *** *** *** *** ***



//			*** 8x16 3rd level to 4th level ***
//
// Define Raw Result = {M3,M2,M1,M0}
//
// M0 =		a3_csa3_1_s_ff[31:0]		a3_csa3_1_c_ff[31:2]
// M1 =		a2_csa3_2_s_ff[49:18]		a2_csa3_2_c_ff[49:20]
// M2 =		a1_csa3_3_s_ff[67:36]		a1_csa3_3_c_ff[67:38]
// M3 =		a0_csa3_4_s_ff[85:54]		a0_csa3_4_c_ff[85:56]



fgu_fpy_dp_csa32_macro__stack_88c__width_25	a4_8x16csa4_1		 (
 .i0   ({             a3_csa3_1_s_ff[31:7]             }),
 .i1   ({             a3_csa3_1_c_ff[31:7]             }),
 .i2   ({ {16{1'b0}}, fac_8x16_rnd_fx3[1],
          { 7{1'b0}}, fac_8x16_rnd_fx3[0]              }),
 .carry({ a4_8x16csa4_1_unused , a4_8x16csa4_1_c[31:8]}),
 .sum  (                         a4_8x16csa4_1_s[31:7] ));

  assign a4_8x16csa4_1_s[6:0]	= a3_csa3_1_s_ff[6:0];
  assign a4_8x16csa4_1_c[7]	= 1'b0;
  assign a4_8x16csa4_1_c[6:2]	= a3_csa3_1_c_ff[6:2];



fgu_fpy_dp_csa32_macro__stack_88c__width_25	a4_8x16csa4_2		 (
 .i0   ({             a2_csa3_2_s_ff[49:25]            }),
 .i1   ({             a2_csa3_2_c_ff[49:25]            }),
 .i2   ({ {16{1'b0}}, fac_8x16_rnd_fx3[1],
          { 7{1'b0}}, fac_8x16_rnd_fx3[0]              }),
 .carry({ a4_8x16csa4_2_unused , a4_8x16csa4_2_c[49:26]}),
 .sum  (                         a4_8x16csa4_2_s[49:25] ));

  assign a4_8x16csa4_2_s[24:18]	= a2_csa3_2_s_ff[24:18];
  assign a4_8x16csa4_2_c[25]	= 1'b0;
  assign a4_8x16csa4_2_c[24:20]	= a2_csa3_2_c_ff[24:20];



fgu_fpy_dp_csa32_macro__stack_88c__width_25	a4_8x16csa4_3		 (
 .i0   ({             a1_csa3_3_s_ff[67:43]            }),
 .i1   ({             a1_csa3_3_c_ff[67:43]            }),
 .i2   ({ {16{1'b0}}, fac_8x16_rnd_fx3[1],
          { 7{1'b0}}, fac_8x16_rnd_fx3[0]              }),
 .carry({ a4_8x16csa4_3_unused , a4_8x16csa4_3_c[67:44]}),
 .sum  (                         a4_8x16csa4_3_s[67:43] ));

  assign a4_8x16csa4_3_s[42:36]	= a1_csa3_3_s_ff[42:36];
  assign a4_8x16csa4_3_c[43]	= 1'b0;
  assign a4_8x16csa4_3_c[42:38]	= a1_csa3_3_c_ff[42:38];



fgu_fpy_dp_csa32_macro__stack_88c__width_25	a4_8x16csa4_4		 (
 .i0   ({             a0_csa3_4_s_ff[85:61]            }),
 .i1   ({             a0_csa3_4_c_ff[85:61]            }),
 .i2   ({ {16{1'b0}}, fac_8x16_rnd_fx3[1],
          { 7{1'b0}}, fac_8x16_rnd_fx3[0]              }),
 .carry({ a4_8x16csa4_4_unused , a4_8x16csa4_4_c[85:62]}),
 .sum  (                         a4_8x16csa4_4_s[85:61] ));

  assign a4_8x16csa4_4_s[60:54]	= a0_csa3_4_s_ff[60:54];
  assign a4_8x16csa4_4_c[61]	= 1'b0;
  assign a4_8x16csa4_4_c[60:56]	= a0_csa3_4_c_ff[60:56];







//			*** XOR 4th level to 5th level ***
//


fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	a4_xor5_1		 (
  .din0( a32_xr_ff[98:36]			),
  .din1( a10_xr_ff[98:36]			),
  .dout( a4_xr5_1[98:36]			));

  assign a4_xr5_1[35:0]	= a32_xr_ff[35:0];
  assign a4_xr5_1[126:99]	= a10_xr_ff[126:99];




//			*** 4th level to 5th level ***
//
//	a3_csa3_1_s_ff[82:0]		a3_csa3_1_c_ff[82:2]
//	a2_csa3_2_s_ff[100:16]		a2_csa3_1_c_ff[100:20]
//
//	a1_csa3_3_s_ff[118:34]		a1_csa3_3_c_ff[118:38]
//	a0_csa3_4_s_ff[135:52]		a0_csa3_4_c_ff[129:56]



fgu_fpy_dp_csa42_macro__stack_88c__width_3	a4_csa4_1a		 (
 .i0   ({ { 3{1'b0}}                                     }),
 .i1   ({ { 3{1'b0}}                                     }),
 .i2   ({             a2_csa3_2_c_ff[100:98]             }),
 .i3   ({             a2_csa3_2_s_ff[100:98]             }),
 .cin  ( a4_csa4_1b_cout                                  ), // 1 bit
 .cout ( a4_csa4_1a_unused                                ), // 1 bit
 .carry(                      a4_csa4_1_c[101:99]         ),
 .sum  (                      a4_csa4_1_s[100:98]         ));


fgu_fpy_dp_csa42_macro__stack_96c__width_96	a4_csa4_1b		 (
 .i0   ({ {15{1'b0}}, a3_csa3_1_s_ff[82:2]              }),
 .i1   ({ {15{1'b0}}, a3_csa3_1_c_ff[82:2]              }),
 .i2   ({             a2_csa3_2_c_ff[97:20] , {18{1'b0}} }),
 .i3   ({             a2_csa3_2_s_ff[97:16] , {14{1'b0}} }),
 .cin  (     1'b0                                         ), // 1 bit
 .cout ( a4_csa4_1b_cout                                  ), // 1 bit
 .carry(                      a4_csa4_1_c[98:3]          ),
 .sum  (                      a4_csa4_1_s[97:2]          ));

  assign a4_csa4_1_s[1:0]	= a3_csa3_1_s_ff[1:0];



fgu_fpy_dp_csa42_macro__stack_96c__width_92	a4_csa4_2		 (
 .i0   ({ {11{1'b0}}, a1_csa3_3_s_ff[118:38]             }),
 .i1   ({ {11{1'b0}}, a1_csa3_3_c_ff[118:38]             }),
 .i2   ({             a0_csa3_4_c_ff[129:56], {18{1'b0}} }),
 .i3   ({             a0_csa3_4_s_ff[129:52], {14{1'b0}} }),
 .cin  (     1'b0                                         ), // 1 bit
 .cout ( a4_csa4_2_unused                                 ), // 1 bit
 .carry(                      a4_csa4_2_c[130:39]         ),
 .sum  (                      a4_csa4_2_s[129:38]         ));

  assign a4_csa4_2_s[37:34]	= a1_csa3_3_s_ff[37:34];
  assign a4_csa4_2_s[135:130]	= a0_csa3_4_s_ff[135:130];




fgu_fpy_dp_csa42_macro__stack_88c__width_32	a4_csa5_1a		 (
 .i0   ({ {30{1'b0}}, a4_csa4_1_s[100:99]                }),
 .i1   ({ {29{1'b0}}, a4_csa4_1_c[101:99]                }),
 .i2   (              a4_csa4_2_c[130:99]                 ),
 .i3   (              a4_csa4_2_s[130:99]                 ),
 .cin  ( a4_csa5_1b_cout                                  ), // 1 bit
 .cout ( a4_csa5_1a_unused                                ), // 1 bit
 .carry(                      a4_csa5_1_c[131:100]        ),
 .sum  (                      a4_csa5_1_s[130:99]         ));


fgu_fpy_dp_csa42_macro__stack_96c__width_96	a4_csa5_1b		 (
 .i0   (              a4_csa4_1_s[98:3]                  ),
 .i1   (              a4_csa4_1_c[98:3]                  ),
 .i2   ({             a4_csa4_2_c[98:39],     {36{1'b0}} }),
 .i3   ({             a4_csa4_2_s[98:34],     {31{1'b0}} }),
 .cin  (     1'b0                                         ), // 1 bit
 .cout ( a4_csa5_1b_cout                                  ), // 1 bit
 .carry(                      a4_csa5_1_c[99:4]          ),
 .sum  (                      a4_csa5_1_s[98:3]          ));

  assign a4_csa5_1_s[2:0]	= a4_csa4_1_s[2:0];
  assign a4_csa5_1_s[135:131]	= a4_csa4_2_s[135:131];


fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_64	i_a4_s_lo_ff		 (
  .scan_in(i_a4_s_lo_ff_scanin),
  .scan_out(i_a4_s_lo_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din0( a4_csa5_1_s[63:0]			),	// Integer, Float, MA Integer
  .din1({a4_8x16csa4_2_s[48:18],
         1'b0,
         a4_8x16csa4_1_s[31:0]}			),	// 8x16
  .din2({a4_csa5_1_s[62:0] , 1'b0}		),	// MA Integer   * 2
  .din3( a4_xr5_1[63:0]				),	// XOR multiply
  .din4({a4_xr5_1[62:0]    , 1'b0}		),	// XOR multiply * 2
  .sel0( fac_scff_sel_fx3[0]			),
  .sel1( fac_scff_sel_fx3[1]			),
  .sel2( fac_scff_sel_fx3[2]			),
  .sel3( fac_scff_sel_fx3[3]			),
  .dout( a4_csa5_1_s_ff[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_72	i_a4_s_hi_ff		 (
  .scan_in(i_a4_s_hi_ff_scanin),
  .scan_out(i_a4_s_hi_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din0({a4_csa5_1_s[135:134],
	 a4_csa5_1_s[133:64]}			),	// Integer, Float, MA Integer
  .din1({2'b00,
	 3'b000,
         a4_8x16csa4_4_s[85:54],
         1'b0,
         a4_8x16csa4_3_s[67:36],
         1'b0,
         a4_8x16csa4_2_s[49]}			),	// 8x16
  .din2({a4_csa5_1_s[134:133],
	 a4_csa5_1_s[132:63]}			),	// MA Integer   * 2
  .din3({2'b00,
	 3'b000,
         4'b0000,a4_xr5_1[126:64]}		),	// XOR multiply
  .din4({2'b00,
	 3'b000,
         3'b000 ,a4_xr5_1[126:63]}		),	// XOR multiply * 2
  .sel0( fac_scff_sel_fx3[0]			),
  .sel1( fac_scff_sel_fx3[1]			),
  .sel2( fac_scff_sel_fx3[2]			),
  .sel3( fac_scff_sel_fx3[3]			),
  .dout( a4_csa5_1_s_ff[135:64] 		),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__mux_aonpe__ports_3__stack_88c__width_62	i_a4_c_lo_ff		 (
  .scan_in(i_a4_c_lo_ff_scanin),
  .scan_out(i_a4_c_lo_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din0({a4_csa5_1_c[63:4],2'b00}		),	// Integer, Float, MA Integer
  .din1({a4_8x16csa4_2_c[48:20],2'b00,
         1'b0,
         a4_8x16csa4_1_c[31:2]}		),	// 8x16
  .din2({a4_csa5_1_c[62:4],3'b000}		),	// MA Integer   * 2
  .sel0( fac_scff_sel_fx3[0]			),
  .sel1( fac_scff_sel_fx3[1]			),
  .sel2( fac_scff_sel_fx3[2]			),
  .dout( a4_csa5_1_c_ff[63:2]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

  assign a4_csa5_1_c_ff[1:0]	= 2'b00;


fgu_fpy_dp_msff_macro__mux_aonpe__ports_3__stack_88c__width_69	i_a4_c_hi_ff		 (
  .scan_in(i_a4_c_hi_ff_scanin),
  .scan_out(i_a4_c_hi_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din0({1'b0,
	 a4_csa5_1_c[131:64]}			),	// Integer, Float, MA Integer
  .din1({1'b0,
	 1'b0,a4_8x16csa4_4_c[85:56],2'b00,
         1'b0,
	 a4_8x16csa4_3_c[67:38],3'b000,
	 a4_8x16csa4_2_c[49]}			),	// 8x16
  .din2({a4_csa5_1_c[131],
	 a4_csa5_1_c[130:63]}			),	// MA Integer   * 2
  .sel0( fac_scff_sel_fx3[0]			),
  .sel1( fac_scff_sel_fx3[1]			),
  .sel2( fac_scff_sel_fx3[2]			),
  .dout( a4_csa5_1_c_ff[132:64]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


// *** *** *** *** *** *** *** *** End   : "A4" 8:2 CSA Tree  *** *** *** *** *** ***



 
// *** *** *** *** *** *** *** *** Start : Accumulator        *** *** *** *** *** ***


fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63	i_fx4_xor0		 (
  .din0( a4_csa5_1_s_ff[126:64]			),
  .din1( accum_ff[126:64]			),
  .dout( xr_fx4[126:64]				));


fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_64	i_fx4_xor1		 (
  .din0( a4_csa5_1_s_ff[63:0]			),
  .din1( accum_ff[63:0]				),
  .dout( xr_fx4[63:0]				));


fgu_fpy_dp_msff_macro__mux_aope__ports_6__stack_88c__width_72	i_accum_ff0		 (
  .scan_in(i_accum_ff0_scanin),
  .scan_out(i_accum_ff0_scanout),
  .clk ( l2clk					),
  .en  ( accum_sel_fx4_b0			),
  .din0({{ 9{1'b0}},xr_fx4[126:64]}		),	// XOR w/        ACCUM and >> 0
  .din1( {72{1'b0}}                  		),	// XOR w/        ACCUM and >> 64
  .din2({{ 9{1'b0}},xr_fx4[126:64]}		),	// XOR       w/o ACCUM and >> 0
  .din3( {72{1'b0}}                 		),	// XOR       w/o ACCUM and >> 64
  .din4( fya_add_result[135:64]			),	// Int w/ or w/o ACCUM and >> 0
  .din5({{64{1'b0}},fya_add_result[135:128]}	),	// Int w/ or w/o ACCUM and >> 64
  .sel0( accum_sel_fx4[2]			),
  .sel1( accum_sel_fx4[3]			),
  .sel2( accum_sel_fx4[4]			),
  .sel3( accum_sel_fx4[5]			),
  .sel4( accum_sel_fx4[6]			),
  .dout( accum_ff[135:64]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


fgu_fpy_dp_msff_macro__mux_aope__ports_6__stack_88c__width_64	i_accum_ff1		 (
  .scan_in(i_accum_ff1_scanin),
  .scan_out(i_accum_ff1_scanout),
  .clk ( l2clk					),
  .en  ( accum_sel_fx4_b0			),
  .din0( xr_fx4[63:0]				),	// XOR w/        ACCUM and >> 0
  .din1({1'b0,xr_fx4[126:64]}			),	// XOR w/        ACCUM and >> 64
  .din2( xr_fx4[63:0]				),	// XOR       w/o ACCUM and >> 0
  .din3({1'b0,xr_fx4[126:64]}			),	// XOR       w/o ACCUM and >> 64
  .din4( fya_add_result[63:0]			),	// Int w/ or w/o ACCUM and >> 0
  .din5( fya_add_result[127:64]			),	// Int w/ or w/o ACCUM and >> 64
  .sel0( accum_sel_fx4[2]			),
  .sel1( accum_sel_fx4[3]			),
  .sel2( accum_sel_fx4[4]			),
  .sel3( accum_sel_fx4[5]			),
  .sel4( accum_sel_fx4[6]			),
  .dout( accum_ff[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


assign fgu_accum_b0_fx5	= accum_ff[0];

// *** *** *** *** *** *** *** *** End   : Accumulator        *** *** *** *** *** ***


fgu_fpy_dp_msff_macro__stack_88c__width_4	i_accum_sel_b1_ff	 (
  .scan_in(i_accum_sel_b1_ff_scanin),
  .scan_out(i_accum_sel_b1_ff_scanout),
  .clk ( l2clk			    ),
  .en  ( mul_clken_rep0		    ),
  .din ({4{fac_accum_sel_fx3[1]}}   ),
  .dout(       accum_sel_fx4_b1[3:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



 
// *** *** *** *** *** *** *** *** Start : Custom add136      *** *** *** *** *** ***


cl_dp1_add136_8x	fya		(
  .din0     ( a4_csa5_1_s_ff[135:0]		),
  .din1     ( a4_csa5_1_c_ff[132:0]		),
  .din2     ( accum_ff[135:0]			),
  .sel_din2 ( accum_sel_fx4_b1[3:0]		),
     .sum            ( fya_add_result[135:0]		),
     .fya_sticky_dp  ( fya_sticky_dp			),
     .fya_sticky_sp  ( fya_sticky_sp			),
     .fya_xicc_z     ( fya_xicc_z[1:0]                  ));



// *** *** *** *** *** *** *** *** End   : Custom add136      *** *** *** *** *** ***



 
// *** *** *** *** *** *** *** *** Start : Output Flop        *** *** *** *** *** ***


fgu_fpy_dp_buff_macro__stack_88c__width_1  i_fpy_fp_result_fx4_b63_buf	 (
  .din (fya_add_result[127]  ),
  .dout(fpy_fp_result_fx4_b63));

// 8x16 data is packed in FYA_ADD_RESULT as follows :
//
//     103:99  98  97:66  65  64:33  32  31:00
//     ------      -----      -----      -----
//       M3         M2         M1         M0


fgu_fpy_dp_msff_macro__mux_aope__ports_7__stack_88c__width_68	i_fx5_ff		 (
  .scan_in(i_fx5_ff_scanin),
  .scan_out(i_fx5_ff_scanout),
  .clk ( l2clk					),
  .en  ( mul_clken_rep0				),
  .din0({   2'b00			,
	    1'b0			,
	    1'b0			,
	 fya_add_result[122:107]	,
         fya_add_result[89:74]		,
         fya_add_result[56:41]		,
         fya_add_result[23:8]		}	),	// [0] : FMUL8x16   or FMUL8x16AU or FMUL8x16AL or FMUL8SUx16
  .din1({   2'b00			,
	    1'b0			,
	    1'b0			,
	 fya_add_result[130:115]	,
         fya_add_result[97:82]		,
         fya_add_result[64:49]		,
         fya_add_result[31:16]		}	),	// [1] : FMUL8ULx16
  .din2({   2'b00			,
	    1'b0			,
	    1'b0			,
	 fya_add_result[122:99],8'h00	,
         fya_add_result[89:66] ,8'h00	}	),	// [2] : FMULD8SUx16
  .din3({   2'b00			,
	    1'b0			,
	    1'b0			,
	 fya_add_result[130:99]		,
         fya_add_result[97:66]		}	),	// [3] : FMULD8ULx16
  .din4({   2'b00			,
	    1'b0			,
	    1'b0			,
	 xr_fx4[63:0]			}	),	// [4] : XOR multiply w/ ACCUMUMATE
  .din5({   2'b00			,
	 fya_sticky_sp			,
	 fya_sticky_dp			,
	 fya_add_result[127:73]		,
	 {9{1'b0}}			}	),	// [5] : Float
  .din6({fya_xicc_z[1:0]		,
	    1'b0			,
	    1'b0			,
	 fya_add_result[63:0]		}	),	// Def : Integer, MA Integer w/ and w/o ACCUMULATE, XOR w/o ACCUMULATE;
  .sel0( fac_result_sel_fx4[0]			),
  .sel1( fac_result_sel_fx4[1]			),
  .sel2( fac_result_sel_fx4[2]			),
  .sel3( fac_result_sel_fx4[3]			),
  .sel4( fac_result_sel_fx4[4]			),
  .sel5( fac_result_sel_fx4[5]			),
  .dout({fpy_xicc_z_fx5[1:0]		,
	 fpy_sticky_sp_fx5		,
	 fpy_sticky_dp_fx5		,
	 fgu_mul_result_fx5[63:0]	}	),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));




fgu_fpy_dp_msff_macro__mux_aope__ports_2__stack_88c__width_64	i_ma_result_ff		 (
  .scan_in(i_ma_result_ff_scanin),
  .scan_out(i_ma_result_ff_scanout),
  .clk ( l2clk					),
  .en  ( fac_ma_result_en_fx4			),
  .din0( xr_fx4[63:0]				),	// [4] : XOR multiply w/ ACCUMUMATE
  .din1( fya_add_result[63:0]			),	// Def : MA Integer w/ and w/o ACCUMULATE, XOR w/o ACCUMULATE;
  .sel0( fac_result_sel_fx4[4]			),
  .dout( ma_result_ff[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));




// *** *** *** *** *** *** *** *** End   : Output Flop        *** *** *** *** *** ***


// fixscan start:
assign i_spu_rs1_ff_scanin       = scan_in                  ;
assign i_spu_rs2_ff_scanin       = i_spu_rs1_ff_scanout     ;
assign i_3x_ff_scanin            = i_spu_rs2_ff_scanout     ;
assign i_a3_be_ff_scanin         = i_3x_ff_scanout          ;
assign i_a3_rs2_ff_scanin        = i_a3_be_ff_scanout       ;
assign i_a3_s_ff_a_scanin        = i_a3_rs2_ff_scanout      ;
assign i_a3_s_ff_b_scanin        = i_a3_s_ff_a_scanout      ;
assign i_a3_c_ff_a_scanin        = i_a3_s_ff_b_scanout      ;
assign i_a3_c_ff_b_scanin        = i_a3_c_ff_a_scanout      ;
assign i_a32_x_ff_a_scanin       = i_a3_c_ff_b_scanout      ;
assign i_a32_x_ff_b_scanin       = i_a32_x_ff_a_scanout     ;
assign i_a2_be_ff_a_scanin       = i_a32_x_ff_b_scanout     ;
assign i_a2_be_ff_b_scanin       = i_a2_be_ff_a_scanout     ;
assign i_a2_rs2_ff_scanin        = i_a2_be_ff_b_scanout     ;
assign i_a2_s_ff_a_scanin        = i_a2_rs2_ff_scanout      ;
assign i_a2_s_ff_b_scanin        = i_a2_s_ff_a_scanout      ;
assign i_a2_c_ff_a_scanin        = i_a2_s_ff_b_scanout      ;
assign i_a2_c_ff_b_scanin        = i_a2_c_ff_a_scanout      ;
assign i_a1_be_ff_scanin         = i_a2_c_ff_b_scanout      ;
assign i_a1_rs2_ff_scanin        = i_a1_be_ff_scanout       ;
assign i_a1_s_ff_a_scanin        = i_a1_rs2_ff_scanout      ;
assign i_a1_s_ff_b_scanin        = i_a1_s_ff_a_scanout      ;
assign i_a1_c_ff_a_scanin        = i_a1_s_ff_b_scanout      ;
assign i_a1_c_ff_b_scanin        = i_a1_c_ff_a_scanout      ;
assign i_a10_x_ff_a_scanin       = i_a1_c_ff_b_scanout      ;
assign i_a10_x_ff_b_scanin       = i_a10_x_ff_a_scanout     ;
assign i_a0_be_ff_scanin         = i_a10_x_ff_b_scanout     ;
assign i_a0_rs2_ff_scanin        = i_a0_be_ff_scanout       ;
assign i_a0_s_ff_a_scanin        = i_a0_rs2_ff_scanout      ;
assign i_a0_s_ff_b_scanin        = i_a0_s_ff_a_scanout      ;
assign i_a0_c_ff_a_scanin        = i_a0_s_ff_b_scanout      ;
assign i_a0_c_ff_b_scanin        = i_a0_c_ff_a_scanout      ;
assign i_a4_s_lo_ff_scanin       = i_a0_c_ff_b_scanout      ;
assign i_a4_s_hi_ff_scanin       = i_a4_s_lo_ff_scanout     ;
assign i_a4_c_lo_ff_scanin       = i_a4_s_hi_ff_scanout     ;
assign i_a4_c_hi_ff_scanin       = i_a4_c_lo_ff_scanout     ;
assign i_accum_ff0_scanin        = i_a4_c_hi_ff_scanout     ;
assign i_accum_ff1_scanin        = i_accum_ff0_scanout      ;
assign i_accum_sel_b1_ff_scanin  = i_accum_ff1_scanout      ;
assign i_fx5_ff_scanin           = i_accum_sel_b1_ff_scanout;
assign i_ma_result_ff_scanin     = i_fx5_ff_scanout         ;
assign scan_out                  = i_ma_result_ff_scanout   ;
// fixscan end:
endmodule  // fgu_fpy_dp


//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__dbuff_32x__rep_1__stack_88c__width_4 (
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

module fgu_fpy_dp_msff_macro__minbuff_1__stack_88c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
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



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
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



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   invert macro
//
//





module fgu_fpy_dp_inv_macro__stack_88c__width_1 (
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
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_2 (
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
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__dbuff_48x__stack_88c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpy_dp_mux_macro__mux_pgpe__ports_6__stack_88c__width_69 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;

  input [68:0] din0;
  input [68:0] din1;
  input [68:0] din2;
  input [68:0] din3;
  input [68:0] din4;
  input [68:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input muxtst;
  input test;
  output [68:0] dout;





cl_dp1_penc6_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
  .test(test)
);

mux6 #(69)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[68:0]),
  .in1(din1[68:0]),
  .in2(din2[68:0]),
  .in3(din3[68:0]),
  .in4(din4[68:0]),
  .in5(din5[68:0]),
.dout(dout[68:0]),
  .muxtst(muxtst)
);









  



endmodule


//
//      Booth Encoder with XOR multiply control
//
//





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_booth_encode_macro (
  din, 
  xr_mode, 
  dout, 
  pout, 
  hout);
  input  [2:0]	din;
  input		xr_mode;
  output [4:0]	dout;
  output		pout;
  output		hout;






  cl_dp1_boothenc_4x m0_0 (
  .din(din),
  .xr_mode(xr_mode),
  .dout(dout),
  .pout(pout),
  .hout(hout)
);






endmodule


//
//   xor macro for ports = 2,3
//
//





module fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_63 (
  din0, 
  din1, 
  dout);
  input [62:0] din0;
  input [62:0] din1;
  output [62:0] dout;





xor2 #(63)  d0_0 (
.in0(din0[62:0]),
.in1(din1[62:0]),
.out(dout[62:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_65 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


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
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_63 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [61:0] so;

  input [62:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [62:0] dout;


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
dff #(63)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[62:0]),
.si({scan_in,so[61:0]}),
.so({so[61:0],scan_out}),
.q(dout[62:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
.dout(muxout[63:0])
);
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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_64 (
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
//   invert macro
//
//





module fgu_fpy_dp_inv_macro__stack_88c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






inv #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpy_dp_mux_macro__mux_aonpe__ports_5__stack_88c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  input [64:0] din2;
  input sel2;
  input [64:0] din3;
  input sel3;
  input [64:0] din4;
  input sel4;
  output [64:0] dout;





cl_dp1_muxbuff5_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4)
);
mux5s #(65)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
  .in3(din3[64:0]),
  .in4(din4[64:0]),
.dout(dout[64:0])
);









  



endmodule


//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa32_macro__stack_88c__width_69 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [68:0] i0;
  input  [68:0] i1;
  input  [68:0] i2;
  output [68:0] carry;
  output [68:0] sum;






csa32 #(69)  d0_0 (
.in0(i0[68:0]),
.in1(i1[68:0]),
.in2(i2[68:0]),
.carry(carry[68:0]),
.sum(sum[68:0])
);









endmodule


//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa32_macro__stack_88c__width_73 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [72:0] i0;
  input  [72:0] i1;
  input  [72:0] i2;
  output [72:0] carry;
  output [72:0] sum;






csa32 #(73)  d0_0 (
.in0(i0[72:0]),
.in1(i1[72:0]),
.in2(i2[72:0]),
.carry(carry[72:0]),
.sum(sum[72:0])
);









endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_88c__width_81 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [80:0]    i0;
  input  [80:0]    i1;
  input  [80:0]    i2;
  input  [80:0]    i3;
  input              cin;
  output             cout;
  output [80:0]    carry;
  output [80:0]    sum;






csa42 #(81)  d0_0 (
.cin(cin),
.in0(i0[80:0]),
.in1(i1[80:0]),
.in2(i2[80:0]),
.in3(i3[80:0]),
.cout(cout),
.carry(carry[80:0]),
.sum(sum[80:0])
);








endmodule








// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_39 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


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
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_44 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [42:0] so;

  input [43:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [43:0] dout;


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
dff #(44)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[43:0]),
.si({scan_in,so[42:0]}),
.so({so[42:0],scan_out}),
.q(dout[43:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_37 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [35:0] so;

  input [36:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [36:0] dout;


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
dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_31 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [29:0] so;

  input [30:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [30:0] dout;


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
dff #(31)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[30:0]),
.si({scan_in,so[29:0]}),
.so({so[29:0],scan_out}),
.q(dout[30:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_41 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [39:0] so;

  input [40:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [40:0] dout;


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
dff #(41)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[40:0]),
.si({scan_in,so[39:0]}),
.so({so[39:0],scan_out}),
.q(dout[40:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_4__stack_88c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc4_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(muxout[63:0])
);
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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module fgu_fpy_dp_mux_macro__mux_aope__ports_2__stack_88c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa32_macro__stack_88c__width_68 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [67:0] i0;
  input  [67:0] i1;
  input  [67:0] i2;
  output [67:0] carry;
  output [67:0] sum;






csa32 #(68)  d0_0 (
.in0(i0[67:0]),
.in1(i1[67:0]),
.in2(i2[67:0]),
.carry(carry[67:0]),
.sum(sum[67:0])
);









endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_88c__width_74 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [73:0]    i0;
  input  [73:0]    i1;
  input  [73:0]    i2;
  input  [73:0]    i3;
  input              cin;
  output             cout;
  output [73:0]    carry;
  output [73:0]    sum;






csa42 #(74)  d0_0 (
.cin(cin),
.in0(i0[73:0]),
.in1(i1[73:0]),
.in2(i2[73:0]),
.in3(i3[73:0]),
.cout(cout),
.carry(carry[73:0]),
.sum(sum[73:0])
);








endmodule








// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_40 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [38:0] so;

  input [39:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [39:0] dout;


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
dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_36 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [34:0] so;

  input [35:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [35:0] dout;


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
dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);




















endmodule









//
//      3:2 Carry Save Adder
//
//




// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa32_macro__stack_88c__width_25 (
  i0, 
  i1, 
  i2, 
  carry, 
  sum);
  input  [24:0] i0;
  input  [24:0] i1;
  input  [24:0] i2;
  output [24:0] carry;
  output [24:0] sum;






csa32 #(25)  d0_0 (
.in0(i0[24:0]),
.in1(i1[24:0]),
.in2(i2[24:0]),
.carry(carry[24:0]),
.sum(sum[24:0])
);









endmodule


//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_88c__width_3 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [2:0]    i0;
  input  [2:0]    i1;
  input  [2:0]    i2;
  input  [2:0]    i3;
  input              cin;
  output             cout;
  output [2:0]    carry;
  output [2:0]    sum;






csa42 #(3)  d0_0 (
.cin(cin),
.in0(i0[2:0]),
.in1(i1[2:0]),
.in2(i2[2:0]),
.in3(i3[2:0]),
.cout(cout),
.carry(carry[2:0]),
.sum(sum[2:0])
);








endmodule




//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_96c__width_96 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [95:0]    i0;
  input  [95:0]    i1;
  input  [95:0]    i2;
  input  [95:0]    i3;
  input              cin;
  output             cout;
  output [95:0]    carry;
  output [95:0]    sum;






csa42 #(96)  d0_0 (
.cin(cin),
.in0(i0[95:0]),
.in1(i1[95:0]),
.in2(i2[95:0]),
.in3(i3[95:0]),
.cout(cout),
.carry(carry[95:0]),
.sum(sum[95:0])
);








endmodule




//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_96c__width_92 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [91:0]    i0;
  input  [91:0]    i1;
  input  [91:0]    i2;
  input  [91:0]    i3;
  input              cin;
  output             cout;
  output [91:0]    carry;
  output [91:0]    sum;






csa42 #(92)  d0_0 (
.cin(cin),
.in0(i0[91:0]),
.in1(i1[91:0]),
.in2(i2[91:0]),
.in3(i3[91:0]),
.cout(cout),
.carry(carry[91:0]),
.sum(sum[91:0])
);








endmodule




//
//           4:2 Carry Save Adder
//
//
//     i0 i1 i2 i3 | co | carry  sum
//     ------------|----|-----------
//      0  0  0  0 |  0 |   0    cin
//      0  0  0  1 |  0 |  cin  ~cin
//      0  0  1  0 |  0 |  cin  ~cin
//      0  0  1  1 |  0 |   1    cin
//   
//      0  1  0  0 |  0 |  cin  ~cin
//      0  1  0  1 |  0 |   1    cin
//      0  1  1  0 |  1 |   0    cin
//      0  1  1  1 |  1 |  cin  ~cin
//   
//      1  0  0  0 |  0 |  cin  ~cin
//      1  0  0  1 |  0 |   1    cin
//      1  0  1  0 |  1 |   0    cin
//      1  0  1  1 |  1 |  cin  ~cin
//   
//      1  1  0  0 |  1 |   0    cin
//      1  1  0  1 |  1 |  cin  ~cin
//      1  1  1  0 |  1 |  cin  ~cin
//      1  1  1  1 |  1 |   1    cin


// This circuit looks like a compression of 5 terms down
// to 3 term on an individual bit basis.  However, the fast
// output "co" from bit position "n" is actually the late input
// "cin" on bit position "n+1".  Once a wrapper is written
// around multiple bits, this circuit will give the 
// appearance of compressing 4 inputs down to 2 outputs.





// any PARAMS parms go into naming of macro


module fgu_fpy_dp_csa42_macro__stack_88c__width_32 (
  i0, 
  i1, 
  i2, 
  i3, 
  cin, 
  cout, 
  carry, 
  sum);
  input  [31:0]    i0;
  input  [31:0]    i1;
  input  [31:0]    i2;
  input  [31:0]    i3;
  input              cin;
  output             cout;
  output [31:0]    carry;
  output [31:0]    sum;






csa42 #(32)  d0_0 (
.cin(cin),
.in0(i0[31:0]),
.in1(i1[31:0]),
.in2(i2[31:0]),
.in3(i3[31:0]),
.cout(cout),
.carry(carry[31:0]),
.sum(sum[31:0])
);








endmodule








// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_5__stack_88c__width_72 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [71:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din0;
  input [71:0] din1;
  input [71:0] din2;
  input [71:0] din3;
  input [71:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(72)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
  .in4(din4[71:0]),
.dout(muxout[71:0])
);
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
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aonpe__ports_3__stack_88c__width_62 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire [61:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [60:0] so;

  input [61:0] din0;
  input sel0;
  input [61:0] din1;
  input sel1;
  input [61:0] din2;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [61:0] dout;


  output scan_out;




cl_dp1_muxbuff3_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(62)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[61:0]),
  .in1(din1[61:0]),
  .in2(din2[61:0]),
.dout(muxout[61:0])
);
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
dff #(62)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[61:0]),
.si({scan_in,so[60:0]}),
.so({so[60:0],scan_out}),
.q(dout[61:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aonpe__ports_3__stack_88c__width_69 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire [68:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [67:0] so;

  input [68:0] din0;
  input sel0;
  input [68:0] din1;
  input sel1;
  input [68:0] din2;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [68:0] dout;


  output scan_out;




cl_dp1_muxbuff3_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2)
);
mux3s #(69)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .in0(din0[68:0]),
  .in1(din1[68:0]),
  .in2(din2[68:0]),
.dout(muxout[68:0])
);
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
dff #(69)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[68:0]),
.si({scan_in,so[67:0]}),
.so({so[67:0],scan_out}),
.q(dout[68:0])
);




















endmodule









//
//   xor macro for ports = 2,3
//
//





module fgu_fpy_dp_xor_macro__ports_2__stack_88c__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;





xor2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_6__stack_88c__width_72 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire [71:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din0;
  input [71:0] din1;
  input [71:0] din2;
  input [71:0] din3;
  input [71:0] din4;
  input [71:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


  output scan_out;




cl_dp1_penc6_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(72)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
  .in4(din4[71:0]),
  .in5(din5[71:0]),
.dout(muxout[71:0])
);
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
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_6__stack_88c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc6_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
.dout(muxout[63:0])
);
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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__stack_88c__width_4 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   buff macro
//
//





module fgu_fpy_dp_buff_macro__stack_88c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_7__stack_88c__width_68 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire [67:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [66:0] so;

  input [67:0] din0;
  input [67:0] din1;
  input [67:0] din2;
  input [67:0] din3;
  input [67:0] din4;
  input [67:0] din5;
  input [67:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [67:0] dout;


  output scan_out;




cl_dp1_penc7_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6)
);

mux7s #(68)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[67:0]),
  .in1(din1[67:0]),
  .in2(din2[67:0]),
  .in3(din3[67:0]),
  .in4(din4[67:0]),
  .in5(din5[67:0]),
  .in6(din6[67:0]),
.dout(muxout[67:0])
);
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
dff #(68)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[67:0]),
.si({scan_in,so[66:0]}),
.so({so[66:0],scan_out}),
.q(dout[67:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module fgu_fpy_dp_msff_macro__mux_aope__ports_2__stack_88c__width_64 (
  din0, 
  din1, 
  sel0, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(muxout[63:0])
);
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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule








