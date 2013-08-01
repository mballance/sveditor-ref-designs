// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_readdp_dp.v
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
module	mcu_readdp_dp (
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  rddata_en, 
  radr_parity, 
  inj_ecc_err, 
  io_mcu_ecc_in, 
  io_mcu_data_in, 
  fail_over_mode, 
  fail_over_mask, 
  fail_over_mask_l, 
  fbdic_rddata_vld, 
  dr_secc_err, 
  dr_mecc_err, 
  rddata, 
  ecc_loc, 
  cor_rddata, 
  syndrome, 
  mcu_gnd);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire fbdic_rddata_vld_buf;
wire [15:0] io_mcu_ecc;
wire [127:0] io_mcu_data;
wire [15:0] mux_rdecc_in;
wire [127:0] mux_rddata_in;
wire u_rddata_in_127_64_scanin;
wire u_rddata_in_127_64_scanout;
wire [3:0] rddata31_in;
wire [3:0] rddata30_in;
wire [3:0] rddata29_in;
wire [3:0] rddata28_in;
wire [3:0] rddata27_in;
wire [3:0] rddata26_in;
wire [3:0] rddata25_in;
wire [3:0] rddata24_in;
wire [3:0] rddata23_in;
wire [3:0] rddata22_in;
wire [3:0] rddata21_in;
wire [3:0] rddata20_in;
wire [3:0] rddata19_in;
wire [3:0] rddata18_in;
wire [3:0] rddata17_in;
wire [3:0] rddata16_in;
wire u_rddata_in_63_0_scanin;
wire u_rddata_in_63_0_scanout;
wire [3:0] rddata15_in;
wire [3:0] rddata14_in;
wire [3:0] rddata13_in;
wire [3:0] rddata12_in;
wire [3:0] rddata11_in;
wire [3:0] rddata10_in;
wire [3:0] rddata09_in;
wire [3:0] rddata08_in;
wire [3:0] rddata07_in;
wire [3:0] rddata06_in;
wire [3:0] rddata05_in;
wire [3:0] rddata04_in;
wire [3:0] rddata03_in;
wire [3:0] rddata02_in;
wire [3:0] rddata01_in;
wire [3:0] rddata00_in;
wire mux_rdecc_in_err_inj;
wire u_rdecc_in_15_8_scanin;
wire u_rdecc_in_15_8_scanout;
wire [3:0] rd_ecc0_in;
wire [3:0] rd_ecc1_in;
wire u_rdecc_in_7_0_par_scanin;
wire u_rdecc_in_7_0_par_scanout;
wire [3:0] rd_ecc2_in;
wire [3:0] rd_ecc3_in;
wire rd_aparity;
wire [3:0] diff_ecc0;
wire [3:0] diff_ecc1;
wire [3:0] diff_ecc2;
wire [3:0] diff_ecc3;
wire diffecc0_nz_3_2;
wire diffecc0_nz_1_0;
wire diffecc0_nz;
wire diffecc0_zero;
wire diffecc1_nz_3_2;
wire diffecc1_nz_1_0;
wire diffecc1_nz;
wire diffecc1_zero;
wire diffecc2_nz_3_2;
wire diffecc2_nz_1_0;
wire diffecc2_nz;
wire diffecc2_zero;
wire diffecc3_nz_3_2;
wire diffecc3_nz_1_0;
wire diffecc3_nz;
wire diffecc3_zero;
wire [3:0] rddata_cor_result30;
wire [3:0] rddata_cor_result29;
wire [3:0] rddata_cor_result28;
wire [3:0] rddata_cor_result27;
wire [3:0] rddata_cor_result26;
wire [3:0] rddata_cor_result25;
wire [3:0] rddata_cor_result24;
wire [3:0] rddata_cor_result23;
wire [3:0] rddata_cor_result22;
wire [3:0] rddata_cor_result21;
wire [3:0] rddata_cor_result20;
wire [3:0] rddata_cor_result19;
wire [3:0] rddata_cor_result18;
wire [3:0] rddata_cor_result17;
wire [3:0] rddata_cor_result15;
wire [3:0] rddata_cor_result14;
wire [3:0] rddata_cor_result13;
wire [3:0] rddata_cor_result12;
wire [3:0] rddata_cor_result11;
wire [3:0] rddata_cor_result10;
wire [3:0] rddata_cor_result09;
wire [3:0] rddata_cor_result08;
wire [3:0] rddata_cor_result07;
wire [3:0] rddata_cor_result06;
wire [3:0] rddata_cor_result05;
wire [3:0] rddata_cor_result04;
wire [3:0] rddata_cor_result03;
wire [3:0] rddata_cor_result02;
wire diffecc3_z_failmode_1;
wire diffecc3_z_failmode;
wire diffecc_1_2_zero;
wire diffecc_0_2_zero;
wire diffecc_0_1_zero;
wire diffecc_0_1_2_zero;
wire diffecc0_adj;
wire diffecc1_adj;
wire diffecc2_adj;
wire diffecc3_nz_failmode;
wire [3:0] diff_ecc0_adj;
wire [3:0] diff_ecc1_adj;
wire [3:0] diff_ecc2_adj;
wire [3:0] diff_ecc3_adj;
wire [3:0] secc_err;
wire diffecc0_adj_nz_3_2;
wire diffecc0_adj_nz_1_0;
wire diffecc0_adj_nz;
wire diffecc0_adj_zero;
wire diffecc1_adj_nz_3_2;
wire diffecc1_adj_nz_1_0;
wire diffecc1_adj_nz;
wire diffecc1_adj_zero;
wire diffecc2_adj_nz_3_2;
wire diffecc2_adj_nz_1_0;
wire diffecc2_adj_nz;
wire diffecc2_adj_zero;
wire diffecc3_adj_nz_3_2;
wire diffecc3_adj_nz_1_0;
wire diffecc3_adj_nz;
wire diffecc3_adj_zero;
wire byte00_err_1;
wire byte01_err_1;
wire byte02_err_1;
wire byte03_err_1;
wire byte04_err_1;
wire byte05_err_1;
wire byte06_err_1;
wire byte07_err_1;
wire byte08_err_1;
wire byte09_err_1;
wire byte10_err_1;
wire byte11_err_1;
wire byte12_err_1;
wire byte13_err_1;
wire byte14_err_1;
wire byte15_err_1;
wire byte16_err_1;
wire byte17_err_1;
wire byte18_err_1;
wire byte19_err_1;
wire byte20_err_1;
wire byte21_err_1;
wire byte22_err_1;
wire byte23_err_1;
wire byte24_err_1;
wire byte25_err_1;
wire byte26_err_1;
wire byte27_err_1;
wire byte28_err_1;
wire byte29_err_1;
wire byte3031_err_1;
wire errpos_0to14;
wire byte00_err;
wire byte01_err;
wire byte02_err;
wire byte03_err;
wire byte04_err;
wire byte05_err;
wire byte06_err;
wire byte07_err;
wire byte08_err;
wire byte09_err;
wire byte10_err;
wire byte11_err;
wire byte12_err;
wire byte13_err;
wire byte14_err;
wire errpos_15to29;
wire byte15_err;
wire byte16_err;
wire byte17_err;
wire byte18_err;
wire byte19_err;
wire byte20_err;
wire byte21_err;
wire byte22_err;
wire byte23_err;
wire byte24_err;
wire byte25_err;
wire byte26_err;
wire byte27_err;
wire byte28_err;
wire byte29_err;
wire byte30_err;
wire byte31_err;
wire [3:0] outbyte00_1;
wire [3:0] outbyte01_1;
wire [3:0] outbyte02_1;
wire [3:0] outbyte03_1;
wire [3:0] outbyte04_1;
wire [3:0] outbyte05_1;
wire [3:0] outbyte06_1;
wire [3:0] outbyte07_1;
wire [3:0] outbyte08_1;
wire [3:0] outbyte09_1;
wire [3:0] outbyte10_1;
wire [3:0] outbyte11_1;
wire [3:0] outbyte12_1;
wire [3:0] outbyte13_1;
wire [3:0] outbyte14_1;
wire [3:0] outbyte15_1;
wire [3:0] outbyte16_1;
wire [3:0] outbyte17_1;
wire [3:0] outbyte18_1;
wire [3:0] outbyte19_1;
wire [3:0] outbyte20_1;
wire [3:0] outbyte21_1;
wire [3:0] outbyte22_1;
wire [3:0] outbyte23_1;
wire [3:0] outbyte24_1;
wire [3:0] outbyte25_1;
wire [3:0] outbyte26_1;
wire [3:0] outbyte27_1;
wire [3:0] outbyte28_1;
wire [3:0] outbyte29_1;
wire [3:0] outbyte30_1;
wire [3:0] outbyte31_1;
wire [3:0] outbyte00;
wire [3:0] outbyte01;
wire [3:0] outbyte02;
wire [3:0] outbyte03;
wire [3:0] outbyte04;
wire [3:0] outbyte05;
wire [3:0] outbyte06;
wire [3:0] outbyte07;
wire [3:0] outbyte08;
wire [3:0] outbyte09;
wire [3:0] outbyte10;
wire [3:0] outbyte11;
wire [3:0] outbyte12;
wire [3:0] outbyte13;
wire [3:0] outbyte14;
wire [3:0] outbyte15;
wire [3:0] outbyte16;
wire [3:0] outbyte17;
wire [3:0] outbyte18;
wire [3:0] outbyte19;
wire [3:0] outbyte20;
wire [3:0] outbyte21;
wire [3:0] outbyte22;
wire [3:0] outbyte23;
wire [3:0] outbyte24;
wire [3:0] outbyte25;
wire [3:0] outbyte26;
wire [3:0] outbyte27;
wire [3:0] outbyte28;
wire [3:0] outbyte29;
wire [3:0] outbyte30;
wire [3:0] outbyte31;
wire byte00_err_mecc_1;
wire byte08_23_err_mecc_1;
wire byte13_28_err_mecc_1;
wire byte12_27_err_mecc_1;
wire byte10_25_err_mecc_1;
wire byte06_21_err_mecc_1;
wire byte05_20_err_mecc_1;
wire byte14_29_err_mecc_1;
wire byte01_16_err_mecc_1;
wire byte11_26_err_mecc_1;
wire byte04_19_err_mecc_1;
wire byte09_24_err_mecc_1;
wire byte03_18_err_mecc_1;
wire byte02_17_err_mecc_1;
wire byte07_22_err_mecc_1;
wire byte15_err_mecc_1;
wire bytexx_err_mecc_2;
wire byteyy_err_mecc_2;
wire byte00_err_mecc;
wire byte01_err_mecc;
wire byte02_err_mecc;
wire byte03_err_mecc;
wire byte04_err_mecc;
wire byte05_err_mecc;
wire byte06_err_mecc;
wire byte07_err_mecc;
wire byte08_err_mecc;
wire byte09_err_mecc;
wire byte10_err_mecc;
wire byte11_err_mecc;
wire byte12_err_mecc;
wire byte13_err_mecc;
wire byte14_err_mecc;
wire byte15_err_mecc;
wire byte16_err_mecc;
wire byte17_err_mecc;
wire byte18_err_mecc;
wire byte19_err_mecc;
wire byte20_err_mecc;
wire byte21_err_mecc;
wire byte22_err_mecc;
wire byte23_err_mecc;
wire byte24_err_mecc;
wire byte25_err_mecc;
wire byte26_err_mecc;
wire byte27_err_mecc;
wire byte28_err_mecc;
wire byte29_err_mecc;
wire [14:0] err_byte_0_14_loc;
wire [14:0] err_byte_15_29_loc;
wire [10:0] ecc_multi_err_1;
wire [10:0] ecc_multi_err_2;
wire ecc_loc_err_byte_0_14_loc_eq;
wire ecc_loc_err_byte_15_29_loc_eq;
wire diffecc0ecc1_adj_ne;
wire diffecc1ecc2_adj_ne;
wire diffecc2ecc3_adj_ne;
wire eccloc_errbyte_0014loc_ne;
wire eccloc_errbyte_1529loc_ne;
wire ecc_multi_err1_4;
wire ecc_multi_err0_4;
wire ecc_multi_err3_5;
wire ecc_multi_err2_5;
wire ecc_multi_err1_5;
wire ecc_multi_err0_5;
wire ecc_multi_err3_6;
wire ecc_multi_err2_6;
wire ecc_multi_err1_6;
wire ecc_multi_err0_6;
wire ecc_multi_err;
wire secc_err31;
wire secc_err30;
wire secc_err_hi;
wire secc_err_lo;
wire ecc_single_err_1;
wire ecc_single_err_2;
wire ecc_single_err_3;
wire ecc_single_err_4;
wire ecc_single_err;
wire u_rddata_127_64_secc_err_scanin;
wire u_rddata_127_64_secc_err_scanout;
wire u_rddata_63_0_mecc_err_scanin;
wire u_rddata_63_0_mecc_err_scanout;


input		drl2clk;
input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input	[1:0]	rddata_en;			// read data nput reg enables  
input		radr_parity;			// read address parity to generate ECC from memory read data
input		inj_ecc_err;

input	[15:0]	io_mcu_ecc_in;			// DRAM ECC data
input	[127:0]	io_mcu_data_in;			// DRAM read data 
input		fail_over_mode;			// fail over mode
input	[34:0]	fail_over_mask;			// fail_over_mask_reg select
input	[34:0]	fail_over_mask_l;		// fail_over_mask_reg select

input		fbdic_rddata_vld;

output		dr_secc_err;			// single bit error detected in drl2clk domain
output		dr_mecc_err;			// multi bits error detected in drl2clk domain
output	[127:0]	rddata;				// memory read data for L2 

output	[35:0]	ecc_loc;			// error nibble location
output	[127:0]	cor_rddata;			// corrected read data to scrub data registers in the MCU write DP

output  [15:0]  syndrome;

output		mcu_gnd;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// 
mcu_readdp_dp_buff_macro__width_2	u_rddata_vld_buf  (
		.din ( {fbdic_rddata_vld, 1'b0} ),
		.dout( {fbdic_rddata_vld_buf, mcu_gnd} ));

mcu_readdp_dp_and_macro__width_16	u_and_ecc_15_0     (
		.din0( {16{fbdic_rddata_vld_buf}} ),
		.din1( io_mcu_ecc_in[15:0] ),
		.dout( io_mcu_ecc[15:0] ));

mcu_readdp_dp_and_macro__width_64	u_and_data_127_64     (
		.din0( {64{fbdic_rddata_vld_buf}} ),
		.din1( io_mcu_data_in[127:64] ),
		.dout( io_mcu_data[127:64] ));

mcu_readdp_dp_and_macro__width_64	u_and_data_63_0     (
		.din0( {64{fbdic_rddata_vld_buf}} ),
		.din1( io_mcu_data_in[63:0] ),
		.dout( io_mcu_data[63:0] ));

//
//	Memory read data return FailOverMask muxes of 128 bits data and 16 bits ECC
//
    
// ecc[15:0]

// ECC0
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rdecc_in_15_12                        ( 
		.din0	( io_mcu_ecc[11:8] ), 
		.din1	( io_mcu_ecc[15:12] ),    
		.sel0	( fail_over_mask[32] ), 
		.sel1	( fail_over_mask_l[32] ), 
		.dout	( mux_rdecc_in[15:12] ));
 
// ECC1
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rdecc_in_11_8                         ( 
		.din0	( io_mcu_ecc[7:4] ), 
		.din1	( io_mcu_ecc[11:8] ),     
		.sel0	( fail_over_mask[33] ), 
		.sel1	( fail_over_mask_l[33] ), 
		.dout	( mux_rdecc_in[11:8] ));

// ECC1
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rdecc_in_7_4                          ( 
		.din0	( io_mcu_ecc[3:0] ), 
		.din1	( io_mcu_ecc[7:4] ),     
		.sel0	( fail_over_mask[34] ), 
		.sel1	( fail_over_mask_l[34] ), 
		.dout	( mux_rdecc_in[7:4] ));

// ECC3
assign	mux_rdecc_in[3:0] = io_mcu_ecc[3:0];

// data[127:0]

mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_127_124                     ( 
		.din0	( io_mcu_ecc[15:12] ), 
		.din1	( io_mcu_data[127:124] ), 
		.sel0	( fail_over_mask[31] ), 
		.sel1	( fail_over_mask_l[31] ), 
		.dout	( mux_rddata_in[127:124] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_123_120                     ( 
		.din0	( io_mcu_data[127:124] ), 
		.din1	( io_mcu_data[123:120] ), 
		.sel0	( fail_over_mask[30] ), 
		.sel1	( fail_over_mask_l[30] ), 
		.dout	( mux_rddata_in[123:120] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_119_116                     ( 
		.din0	( io_mcu_data[123:120] ), 
		.din1	( io_mcu_data[119:116] ), 
		.sel0	( fail_over_mask[29] ), 
		.sel1	( fail_over_mask_l[29] ), 
		.dout	( mux_rddata_in[119:116] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_115_112                     ( 
		.din0	( io_mcu_data[119:116] ), 
		.din1	( io_mcu_data[115:112] ), 
		.sel0	( fail_over_mask[28] ), 
		.sel1	( fail_over_mask_l[28] ), 
		.dout	( mux_rddata_in[115:112] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_111_108                     ( 
		.din0	( io_mcu_data[115:112] ), 
		.din1	( io_mcu_data[111:108] ), 
		.sel0	( fail_over_mask[27] ), 
		.sel1	( fail_over_mask_l[27] ), 
		.dout	( mux_rddata_in[111:108] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_107_104                     ( 
		.din0	( io_mcu_data[111:108] ), 
		.din1	( io_mcu_data[107:104] ), 
		.sel0	( fail_over_mask[26] ), 
		.sel1	( fail_over_mask_l[26] ), 
		.dout	( mux_rddata_in[107:104] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_103_100                     ( 
		.din0	( io_mcu_data[107:104] ), 
		.din1	( io_mcu_data[103:100] ), 
		.sel0	( fail_over_mask[25] ), 
		.sel1	( fail_over_mask_l[25] ), 
		.dout	( mux_rddata_in[103:100] ));
    
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_99_96                       ( 
		.din0	( io_mcu_data[103:100] ), 
		.din1	( io_mcu_data[99:96] ),   
		.sel0	( fail_over_mask[24] ), 
		.sel1	( fail_over_mask_l[24] ), 
		.dout	( mux_rddata_in[99:96] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_95_92                       ( 
		.din0	( io_mcu_data[99:96] ), 
		.din1	( io_mcu_data[95:92] ),   
		.sel0	( fail_over_mask[23] ), 
		.sel1	( fail_over_mask_l[23] ), 
		.dout	( mux_rddata_in[95:92] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_91_88                       ( 
		.din0	( io_mcu_data[95:92] ), 
		.din1	( io_mcu_data[91:88] ),   
		.sel0	( fail_over_mask[22] ), 
		.sel1	( fail_over_mask_l[22] ), 
		.dout	( mux_rddata_in[91:88] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_87_84                       ( 
		.din0	( io_mcu_data[91:88] ), 
		.din1	( io_mcu_data[87:84] ),   
		.sel0	( fail_over_mask[21] ), 
		.sel1	( fail_over_mask_l[21] ), 
		.dout	( mux_rddata_in[87:84] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_83_80                       ( 
		.din0	( io_mcu_data[87:84] ), 
		.din1	( io_mcu_data[83:80] ),   
		.sel0	( fail_over_mask[20] ), 
		.sel1	( fail_over_mask_l[20] ), 
		.dout	( mux_rddata_in[83:80] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_79_76                       ( 
		.din0	( io_mcu_data[83:80] ), 
		.din1	( io_mcu_data[79:76] ),   
		.sel0	( fail_over_mask[19] ), 
		.sel1	( fail_over_mask_l[19] ), 
		.dout	( mux_rddata_in[79:76] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_75_72                       ( 
		.din0	( io_mcu_data[79:76] ), 
		.din1	( io_mcu_data[75:72] ),   
		.sel0	( fail_over_mask[18] ), 
		.sel1	( fail_over_mask_l[18] ), 
		.dout	( mux_rddata_in[75:72] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_71_68                       ( 
		.din0	( io_mcu_data[75:72] ), 
		.din1	( io_mcu_data[71:68] ),   
		.sel0	( fail_over_mask[17] ), 
		.sel1	( fail_over_mask_l[17] ), 
		.dout	( mux_rddata_in[71:68] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_67_64                       ( 
		.din0	( io_mcu_data[71:68] ), 
		.din1	( io_mcu_data[67:64] ),   
		.sel0	( fail_over_mask[16] ), 
		.sel1	( fail_over_mask_l[16] ), 
		.dout	( mux_rddata_in[67:64] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_63_60                       ( 
		.din0	( io_mcu_data[67:64] ), 
		.din1	( io_mcu_data[63:60] ),   
		.sel0	( fail_over_mask[15] ), 
		.sel1	( fail_over_mask_l[15] ), 
		.dout	( mux_rddata_in[63:60] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_59_56                       ( 
		.din0	( io_mcu_data[63:60] ), 
		.din1	( io_mcu_data[59:56] ),   
		.sel0	( fail_over_mask[14] ), 
		.sel1	( fail_over_mask_l[14] ), 
		.dout	( mux_rddata_in[59:56] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_55_52                       ( 
		.din0	( io_mcu_data[59:56] ), 
		.din1	( io_mcu_data[55:52] ),   
		.sel0	( fail_over_mask[13] ), 
		.sel1	( fail_over_mask_l[13] ), 
		.dout	( mux_rddata_in[55:52] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_51_48                       ( 
		.din0	( io_mcu_data[55:52] ), 
		.din1	( io_mcu_data[51:48] ),   
		.sel0	( fail_over_mask[12] ), 
		.sel1	( fail_over_mask_l[12] ), 
		.dout	( mux_rddata_in[51:48] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_47_44                       ( 
		.din0	( io_mcu_data[51:48] ), 
		.din1	( io_mcu_data[47:44] ),   
		.sel0	( fail_over_mask[11] ), 
		.sel1	( fail_over_mask_l[11] ), 
		.dout	( mux_rddata_in[47:44] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_43_40                       ( 
		.din0	( io_mcu_data[47:44] ), 
		.din1	( io_mcu_data[43:40] ),   
		.sel0	( fail_over_mask[10] ), 
		.sel1	( fail_over_mask_l[10] ), 
		.dout	( mux_rddata_in[43:40] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_39_36                       ( 
		.din0	( io_mcu_data[43:40] ), 
		.din1	( io_mcu_data[39:36] ),   
		.sel0	( fail_over_mask[9] ),  
		.sel1	( fail_over_mask_l[9] ),  
		.dout	( mux_rddata_in[39:36] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_35_32                       ( 
		.din0	( io_mcu_data[39:36] ), 
		.din1	( io_mcu_data[35:32] ),   
		.sel0	( fail_over_mask[8] ),  
		.sel1	( fail_over_mask_l[8] ),  
		.dout	( mux_rddata_in[35:32] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_31_28                       ( 
		.din0	( io_mcu_data[35:32] ), 
		.din1	( io_mcu_data[31:28] ),   
		.sel0	( fail_over_mask[7] ),  
		.sel1	( fail_over_mask_l[7] ),  
		.dout	( mux_rddata_in[31:28] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_27_24                       ( 
		.din0	( io_mcu_data[31:28] ), 
		.din1	( io_mcu_data[27:24] ),   
		.sel0	( fail_over_mask[6] ),  
		.sel1	( fail_over_mask_l[6] ),  
		.dout	( mux_rddata_in[27:24] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_23_20                       ( 
		.din0	( io_mcu_data[27:24] ), 
		.din1	( io_mcu_data[23:20] ),   
		.sel0	( fail_over_mask[5] ),  
		.sel1	( fail_over_mask_l[5] ),  
		.dout	( mux_rddata_in[23:20] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_19_16                       ( 
		.din0	( io_mcu_data[23:20] ), 
		.din1	( io_mcu_data[19:16] ),   
		.sel0	( fail_over_mask[4] ),  
		.sel1	( fail_over_mask_l[4] ),  
		.dout	( mux_rddata_in[19:16] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_15_12                       ( 
		.din0	( io_mcu_data[19:16] ), 
		.din1	( io_mcu_data[15:12] ),   
		.sel0	( fail_over_mask[3] ),  
		.sel1	( fail_over_mask_l[3] ),  
		.dout	( mux_rddata_in[15:12] ));
  
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_11_8                        ( 
		.din0	( io_mcu_data[15:12] ), 
		.din1	( io_mcu_data[11:8] ),    
		.sel0	( fail_over_mask[2] ),  
		.sel1	( fail_over_mask_l[2] ),  
		.dout	( mux_rddata_in[11:8] ));
 
mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_7_4                         ( 
		.din0	( io_mcu_data[11:8] ), 
		.din1	( io_mcu_data[7:4] ),     
		.sel0	( fail_over_mask[1] ),  
		.sel1	( fail_over_mask_l[1] ),  
		.dout	( mux_rddata_in[7:4] ));

mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4	u_mux_rddata_in_3_0                         ( 
		.din0	( io_mcu_data[7:4] ), 
		.din1	( io_mcu_data[3:0] ),     
		.sel0	( fail_over_mask[0] ),  
		.sel1	( fail_over_mask_l[0] ),  
		.dout	( mux_rddata_in[3:0] ));

//
//	Memory read data input registers. In 1-DIMM mode, 128 bits data and 16 bits are captured in 2
//	mcu_clk cycles.
//
mcu_readdp_dp_msff_macro__stack_64c__width_64	u_rddata_in_127_64	      (
		.scan_in(u_rddata_in_127_64_scanin),
		.scan_out(u_rddata_in_127_64_scanout),
		.clk	  ( drl2clk),
		.en	  ( rddata_en[0] ),
		.din	  ( mux_rddata_in[127:64] ),
		.dout	  ( { rddata31_in[3:0], rddata30_in[3:0], rddata29_in[3:0], rddata28_in[3:0],
		              rddata27_in[3:0], rddata26_in[3:0], rddata25_in[3:0], rddata24_in[3:0],
		              rddata23_in[3:0], rddata22_in[3:0], rddata21_in[3:0], rddata20_in[3:0],
		              rddata19_in[3:0], rddata18_in[3:0], rddata17_in[3:0], rddata16_in[3:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_readdp_dp_msff_macro__stack_64c__width_64	u_rddata_in_63_0               (
		.scan_in(u_rddata_in_63_0_scanin),
		.scan_out(u_rddata_in_63_0_scanout),
		.clk	  ( drl2clk ),
		.en	  ( rddata_en[0] ),
		.din	  ( mux_rddata_in[63:0] ),
		.dout	  ( { rddata15_in[3:0], rddata14_in[3:0], rddata13_in[3:0], rddata12_in[3:0],
		              rddata11_in[3:0], rddata10_in[3:0], rddata09_in[3:0], rddata08_in[3:0],
		              rddata07_in[3:0], rddata06_in[3:0], rddata05_in[3:0], rddata04_in[3:0],
		              rddata03_in[3:0], rddata02_in[3:0], rddata01_in[3:0], rddata00_in[3:0] } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


//
//
//

mcu_readdp_dp_xor_macro__ports_2 	u_xor_err_inj     (
		.din0(mux_rdecc_in[15]),
		.din1(inj_ecc_err),
		.dout(mux_rdecc_in_err_inj));

mcu_readdp_dp_msff_macro__stack_8l__width_8	u_rdecc_in_15_8               ( 	
		.scan_in(u_rdecc_in_15_8_scanin),
		.scan_out(u_rdecc_in_15_8_scanout),
		.clk	  ( drl2clk ),
		.en	  ( rddata_en[0] ),
		.din	  ( {mux_rdecc_in_err_inj, mux_rdecc_in[14:8]} ),
		.dout	  ( {rd_ecc0_in[3:0], rd_ecc1_in[3:0]} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
 
mcu_readdp_dp_msff_macro__stack_10l__width_9	u_rdecc_in_7_0_par            ( 
		.scan_in(u_rdecc_in_7_0_par_scanin),
		.scan_out(u_rdecc_in_7_0_par_scanout),
		.clk	  ( drl2clk ),
		.en	  ( rddata_en[0] ),
		.din	  ( {mux_rdecc_in[7:0], radr_parity} ),
		.dout	  ( {rd_ecc2_in[3:0], rd_ecc3_in[3:0], rd_aparity} ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));
 
//
//	Generate ECC for the incoming data, and compute the diffs of incoming ECC data 
//	and generated ECC of the incoming data.
//
mcu_eccgen_dp	u_r_eccgen    	(
		.din  		( { rddata31_in[3:0], rddata30_in[3:0], rddata29_in[3:0], rddata28_in[3:0],
		            	    rddata27_in[3:0], rddata26_in[3:0], rddata25_in[3:0], rddata24_in[3:0],
		            	    rddata23_in[3:0], rddata22_in[3:0], rddata21_in[3:0], rddata20_in[3:0],
		            	    rddata19_in[3:0], rddata18_in[3:0], rddata17_in[3:0], rddata16_in[3:0],
		            	    rddata15_in[3:0], rddata14_in[3:0], rddata13_in[3:0], rddata12_in[3:0],
		      		    rddata11_in[3:0], rddata10_in[3:0], rddata09_in[3:0], rddata08_in[3:0],
		      		    rddata07_in[3:0], rddata06_in[3:0], rddata05_in[3:0], rddata04_in[3:0],
		      		    rddata03_in[3:0], rddata02_in[3:0], rddata01_in[3:0], rddata00_in[3:0] } ),
		.adr_parity	( rd_aparity ),
		.ecc0_in	( rd_ecc0_in[3:0] ),
		.ecc1_in	( rd_ecc1_in[3:0] ),
		.ecc2_in	( rd_ecc2_in[3:0] ),
		.ecc3_in	( rd_ecc3_in[3:0] ),
		.ecc		( { diff_ecc0[3:0], diff_ecc1[3:0], diff_ecc2[3:0], diff_ecc3[3:0] } ));

assign syndrome[15:0] = { diff_ecc3[3:0], diff_ecc2[3:0], diff_ecc1[3:0], diff_ecc0[3:0] };


//
//	Generate zero, and not_equal_zero for diff_eccX.
//
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc0_nz_3_2             ( .din0 ( diff_ecc0[3]    ), .din1 ( diff_ecc0[2]    ), .dout ( diffecc0_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc0_nz_1_0             ( .din0 ( diff_ecc0[1]    ), .din1 ( diff_ecc0[0]    ), .dout ( diffecc0_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc0_nz                 ( .din0 ( diffecc0_nz_3_2 ), .din1 ( diffecc0_nz_1_0 ), .dout ( diffecc0_nz     ));
//and_macro	U_diffecc0_zero    ( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc0_nz_3_2 ), .din1 ( diffecc0_nz_1_0 ), .dout ( diffecc0_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc0_zero                        ( .din  ( diffecc0_nz     ),                            .dout ( diffecc0_zero   ));


mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc1_nz_3_2             ( .din0 ( diff_ecc1[3]    ), .din1 ( diff_ecc1[2]    ), .dout ( diffecc1_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc1_nz_1_0             ( .din0 ( diff_ecc1[1]    ), .din1 ( diff_ecc1[0]    ), .dout ( diffecc1_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc1_nz                 ( .din0 ( diffecc1_nz_3_2 ), .din1 ( diffecc1_nz_1_0 ), .dout ( diffecc1_nz     ));
//and_macro	U_diffecc1_zero    ( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc1_nz_3_2 ), .din1 ( diffecc1_nz_1_0 ), .dout ( diffecc1_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc1_zero                        ( .din  ( diffecc1_nz     ),                            .dout ( diffecc1_zero   ));

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc2_nz_3_2             ( .din0 ( diff_ecc2[3]    ), .din1 ( diff_ecc2[2]    ), .dout ( diffecc2_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc2_nz_1_0             ( .din0 ( diff_ecc2[1]    ), .din1 ( diff_ecc2[0]    ), .dout ( diffecc2_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc2_nz                 ( .din0 ( diffecc2_nz_3_2 ), .din1 ( diffecc2_nz_1_0 ), .dout ( diffecc2_nz     ));
//and_macro	U_diffecc2_zero    ( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc2_nz_3_2 ), .din1 ( diffecc2_nz_1_0 ), .dout ( diffecc2_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc2_zero                        ( .din  ( diffecc2_nz     ),                            .dout ( diffecc2_zero   ));

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc3_nz_3_2             ( .din0 ( diff_ecc3[3]    ), .din1 ( diff_ecc3[2]    ), .dout ( diffecc3_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc3_nz_1_0             ( .din0 ( diff_ecc3[1]    ), .din1 ( diff_ecc3[0]    ), .dout ( diffecc3_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc3_nz                 ( .din0 ( diffecc3_nz_3_2 ), .din1 ( diffecc3_nz_1_0 ), .dout ( diffecc3_nz     ));
//and_macro	U_diffecc3_zero    ( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc3_nz_3_2 ), .din1 ( diffecc3_nz_1_0 ), .dout ( diffecc3_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc3_zero                        ( .din  ( diffecc3_nz     ),                            .dout ( diffecc3_zero   ));

//
//	Nibbles data correction.
//
mcu_nibcor_dp	u_nibcor	(
		.diffecc2_nz	( diffecc2_nz ),
		.diff_ecc2	( diff_ecc2[3:0] ),
		.diff_ecc1	( diff_ecc1[3:0] ),
		.result		({                          rddata_cor_result30[3:0], rddata_cor_result29[3:0], rddata_cor_result28[3:0],
				  rddata_cor_result27[3:0], rddata_cor_result26[3:0], rddata_cor_result25[3:0], rddata_cor_result24[3:0],
				  rddata_cor_result23[3:0], rddata_cor_result22[3:0], rddata_cor_result21[3:0], rddata_cor_result20[3:0],
				  rddata_cor_result19[3:0], rddata_cor_result18[3:0], rddata_cor_result17[3:0],
				  rddata_cor_result15[3:0], rddata_cor_result14[3:0], rddata_cor_result13[3:0], rddata_cor_result12[3:0],
				  rddata_cor_result11[3:0], rddata_cor_result10[3:0], rddata_cor_result09[3:0], rddata_cor_result08[3:0],
				  rddata_cor_result07[3:0], rddata_cor_result06[3:0], rddata_cor_result05[3:0], rddata_cor_result04[3:0],
				  rddata_cor_result03[3:0], rddata_cor_result02[3:0]							 }));

//
//	Adjust diff_ecc values in fail_mask_over mode
//
//	assign diff_ecc0_in = (diff_ecc1 == 4'h0) & (diff_ecc2 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) ? 4'h0 : diff_ecc0;
//	assign diff_ecc1_in = (diff_ecc0 == 4'h0) & (diff_ecc2 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) ? 4'h0 : diff_ecc1;
//	assign diff_ecc2_in = (diff_ecc0 == 4'h0) & (diff_ecc1 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) ? 4'h0 : diff_ecc2;
//	assign diff_ecc3_in = (diff_ecc0 == 4'h0) & (diff_ecc1 == 4'h0) & (diff_ecc2 == 4'h0) ? 4'h0 : diff_ecc3;
//
//	assign secc_err[0] = (diff_ecc1 == 4'h0) & (diff_ecc2 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) & (diff_ecc0 != 4'h0) ? 1'b1 : 1'b0;
//	assign secc_err[1] = (diff_ecc0 == 4'h0) & (diff_ecc2 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) & (diff_ecc1 != 4'h0) ? 1'b1 : 1'b0;
//	assign secc_err[2] = (diff_ecc0 == 4'h0) & (diff_ecc1 == 4'h0) & ((diff_ecc3 == 4'h0) & ~l2if_dram_fail_over_mode | l2if_dram_fail_over_mode) & (diff_ecc2 != 4'h0) ? 1'b1 : 1'b0;
//	assign secc_err[3] = (diff_ecc0 == 4'h0) & (diff_ecc1 == 4'h0) & (diff_ecc2 == 4'h0) & (diff_ecc3 != 4'h0) & ~l2if_dram_fail_over_mode ? 1'b1 : 1'b0;
//
mcu_readdp_dp_nor_macro__dnor_4x__ports_2__width_1	u_diffecc3_z_failmode_1	            ( .din0 ( diffecc3_nz           ), .din1 ( fail_over_mode ), .dout ( diffecc3_z_failmode_1 ));
mcu_readdp_dp_nor_macro__dnor_16x__ports_2__width_1	u_diffecc3_z_failmode	           ( .din0 ( diffecc3_z_failmode_1 ), .din1 ( fail_over_mode ), .dout ( diffecc3_z_failmode	 ));

mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc_1_2_zero	           ( .din0 ( diffecc1_zero ), .din1 ( diffecc2_zero ),                         .dout ( diffecc_1_2_zero ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc_0_2_zero	           ( .din0 ( diffecc0_zero ), .din1 ( diffecc2_zero ),                         .dout ( diffecc_0_2_zero ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc_0_1_zero	           ( .din0 ( diffecc0_zero ), .din1 ( diffecc1_zero ),                         .dout ( diffecc_0_1_zero ));
mcu_readdp_dp_nand_macro__ports_3__stack_1l__width_1	u_diffecc_0_1_2_zero	           ( .din0 ( diffecc0_zero ), .din1 ( diffecc1_zero ), .din2( diffecc2_zero ), .dout ( diffecc_0_1_2_zero ));

mcu_readdp_dp_or_macro__ports_2__stack_1l__width_1	u_diffecc0_adj		           ( .din0 ( diffecc_1_2_zero ), .din1 ( diffecc3_z_failmode ), 		  .dout ( diffecc0_adj ));
mcu_readdp_dp_or_macro__ports_2__stack_1l__width_1	u_diffecc1_adj		           ( .din0 ( diffecc_0_2_zero ), .din1 ( diffecc3_z_failmode ), 		  .dout ( diffecc1_adj ));
mcu_readdp_dp_or_macro__ports_2__stack_1l__width_1	u_diffecc2_adj		           ( .din0 ( diffecc_0_1_zero ), .din1 ( diffecc3_z_failmode ), 		  .dout ( diffecc2_adj ));

mcu_readdp_dp_or_macro__ports_2__stack_1l__width_1	u_diffecc3_nz_failmode	           ( .din0 ( diffecc3_zero    ), .din1 ( fail_over_mode ), 			  .dout	( diffecc3_nz_failmode ));

//
//	Adjusted diff_ecc values
//
mcu_readdp_dp_and_macro__dinv_32x__dnand_4x__ports_2__width_4	u_diff_ecc0_adj		              ( .din0 ( {4{ diffecc0_adj }}      ), .din1 ( diff_ecc0[3:0] ), .dout ( diff_ecc0_adj[3:0] ));
mcu_readdp_dp_and_macro__dinv_32x__dnand_4x__ports_2__width_4	u_diff_ecc1_adj		              ( .din0 ( {4{ diffecc1_adj }}      ), .din1 ( diff_ecc1[3:0] ), .dout ( diff_ecc1_adj[3:0] ));
mcu_readdp_dp_and_macro__dinv_32x__dnand_4x__ports_2__width_4	u_diff_ecc2_adj		              ( .din0 ( {4{ diffecc2_adj }}      ), .din1 ( diff_ecc2[3:0] ), .dout ( diff_ecc2_adj[3:0] ));
mcu_readdp_dp_and_macro__dinv_32x__dnand_4x__ports_2__width_4	u_diff_ecc3_adj		              ( .din0 ( {4{ diffecc_0_1_2_zero }}), .din1 ( diff_ecc3[3:0] ), .dout ( diff_ecc3_adj[3:0] ));

//
//	SECC_ERR[3:0]
//
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_secc3_err     	          ( .din0 ( diffecc_0_1_2_zero ), .din1 ( diffecc3_nz_failmode  ),                                .dout ( secc_err[3] ));
mcu_readdp_dp_nor_macro__ports_3__stack_1l__width_1	u_secc2_err     	          ( .din0 ( diffecc_0_1_zero   ), .din1 ( diffecc2_zero         ), .din2 ( diffecc3_z_failmode ), .dout ( secc_err[2] ));
mcu_readdp_dp_nor_macro__ports_3__stack_1l__width_1	u_secc1_err     	          ( .din0 ( diffecc_0_2_zero   ), .din1 ( diffecc1_zero         ), .din2 ( diffecc3_z_failmode ), .dout ( secc_err[1] ));
mcu_readdp_dp_nor_macro__ports_3__stack_1l__width_1	u_secc0_err     	          ( .din0 ( diffecc_1_2_zero   ), .din1 ( diffecc0_zero         ), .din2 ( diffecc3_z_failmode ), .dout ( secc_err[0] ));

//
//	diff_eccX_adj[3:0] == 4'b0
//	diff_eccX_adj[3:0] != 4'b0
//

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc0_adj_nz_3_2  	           ( .din0 ( diff_ecc0_adj[3]    ), .din1 ( diff_ecc0_adj[2]    ), .dout ( diffecc0_adj_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc0_adj_nz_1_0  	           ( .din0 ( diff_ecc0_adj[1]    ), .din1 ( diff_ecc0_adj[0]    ), .dout ( diffecc0_adj_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc0_adj_nz      	           ( .din0 ( diffecc0_adj_nz_3_2 ), .din1 ( diffecc0_adj_nz_1_0 ), .dout ( diffecc0_adj_nz     ));
//and_macro	U_diffecc0_adj_zero    	( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc0_adj_nz_3_2 ), .din1 ( diffecc0_adj_nz_1_0 ), .dout ( diffecc0_adj_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc0_adj_zero    	                    ( .din  ( diffecc0_adj_nz     ),                                .dout ( diffecc0_adj_zero   ));

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc1_adj_nz_3_2  	           ( .din0 ( diff_ecc1_adj[3]    ), .din1 ( diff_ecc1_adj[2]    ), .dout ( diffecc1_adj_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc1_adj_nz_1_0  	           ( .din0 ( diff_ecc1_adj[1]    ), .din1 ( diff_ecc1_adj[0]    ), .dout ( diffecc1_adj_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc1_adj_nz      	           ( .din0 ( diffecc1_adj_nz_3_2 ), .din1 ( diffecc1_adj_nz_1_0 ), .dout ( diffecc1_adj_nz     ));
//and_macro	U_diffecc1_adj_zero    	( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc1_adj_nz_3_2 ), .din1 ( diffecc1_adj_nz_1_0 ), .dout ( diffecc1_adj_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc1_adj_zero    	                    ( .din  ( diffecc1_adj_nz     ),                                .dout ( diffecc1_adj_zero   ));

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc2_adj_nz_3_2  	           ( .din0 ( diff_ecc2_adj[3]    ), .din1 ( diff_ecc2_adj[2]    ), .dout ( diffecc2_adj_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc2_adj_nz_1_0  	           ( .din0 ( diff_ecc2_adj[1]    ), .din1 ( diff_ecc2_adj[0]    ), .dout ( diffecc2_adj_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc2_adj_nz      	           ( .din0 ( diffecc2_adj_nz_3_2 ), .din1 ( diffecc2_adj_nz_1_0 ), .dout ( diffecc2_adj_nz     ));
//and_macro	U_diffecc2_adj_zero    	( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc2_adj_nz_3_2 ), .din1 ( diffecc2_adj_nz_1_0 ), .dout ( diffecc2_adj_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc2_adj_zero    	                    ( .din  ( diffecc2_adj_nz     ),                                .dout ( diffecc2_adj_zero   ));

mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc3_adj_nz_3_2  	           ( .din0 ( diff_ecc3_adj[3]    ), .din1 ( diff_ecc3_adj[2]    ), .dout ( diffecc3_adj_nz_3_2 ));
mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1	u_diffecc3_adj_nz_1_0  	           ( .din0 ( diff_ecc3_adj[1]    ), .din1 ( diff_ecc3_adj[0]    ), .dout ( diffecc3_adj_nz_1_0 ));
mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1	u_diffecc3_adj_nz      	           ( .din0 ( diffecc3_adj_nz_3_2 ), .din1 ( diffecc3_adj_nz_1_0 ), .dout ( diffecc3_adj_nz     ));
//and_macro	U_diffecc3_adj_zero    	( stack = 1l , width = 1 , ports = 2 ) ( .din0 ( diffecc3_adj_nz_3_2 ), .din1 ( diffecc3_adj_nz_1_0 ), .dout ( diffecc3_adj_zero   ));
mcu_readdp_dp_inv_macro__stack_1l__width_1	u_diffecc3_adj_zero    	                    ( .din  ( diffecc3_adj_nz     ),                                .dout ( diffecc3_adj_zero   ));

//
// Correcting nibbles 0-29
//
mcu_readdp_dp_cmp_macro__width_4	u_byte00_err_1      	    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( diff_ecc1_adj[3:0]       ), .dout ( byte00_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte01_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result02[3:0] ), .dout ( byte01_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte02_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result03[3:0] ), .dout ( byte02_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte03_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result04[3:0] ), .dout ( byte03_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte04_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result05[3:0] ), .dout ( byte04_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte05_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result06[3:0] ), .dout ( byte05_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte06_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result07[3:0] ), .dout ( byte06_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte07_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result08[3:0] ), .dout ( byte07_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte08_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result09[3:0] ), .dout ( byte08_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte09_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result10[3:0] ), .dout ( byte09_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte10_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result11[3:0] ), .dout ( byte10_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte11_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result12[3:0] ), .dout ( byte11_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte12_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result13[3:0] ), .dout ( byte12_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte13_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result14[3:0] ), .dout ( byte13_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte14_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result15[3:0] ), .dout ( byte14_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte15_err_1      	    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( diff_ecc2_adj[3:0]       ), .dout	( byte15_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte16_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result17[3:0] ), .dout ( byte16_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte17_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result18[3:0] ), .dout ( byte17_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte18_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result19[3:0] ), .dout ( byte18_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte19_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result20[3:0] ), .dout ( byte19_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte20_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result21[3:0] ), .dout ( byte20_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte21_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result22[3:0] ), .dout ( byte21_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte22_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result23[3:0] ), .dout ( byte22_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte23_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result24[3:0] ), .dout ( byte23_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte24_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result25[3:0] ), .dout ( byte24_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte25_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result26[3:0] ), .dout ( byte25_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte26_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result27[3:0] ), .dout ( byte26_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte27_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result28[3:0] ), .dout ( byte27_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte28_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result29[3:0] ), .dout ( byte28_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte29_err_1		    ( .din0 ( diff_ecc0_adj[3:0] ), .din1 ( rddata_cor_result30[3:0] ), .dout ( byte29_err_1   ));
mcu_readdp_dp_cmp_macro__width_4	u_byte3031_err_1      	    ( .din0 ( diff_ecc1_adj[3:0] ), .din1 ( diff_ecc2_adj[3:0]       ), .dout ( byte3031_err_1 ));

mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_errpos_0to14		          ( .din0 ( diffecc1_adj_nz    ), .din1 ( diffecc2_adj_zero ), .dout ( errpos_0to14  ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte00_err      	          ( .din0 ( errpos_0to14       ), .din1 ( byte00_err_1      ), .dout ( byte00_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte01_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte01_err_1      ), .dout ( byte01_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte02_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte02_err_1      ), .dout ( byte02_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte03_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte03_err_1      ), .dout ( byte03_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte04_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte04_err_1      ), .dout ( byte04_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte05_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte05_err_1      ), .dout ( byte05_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte06_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte06_err_1      ), .dout ( byte06_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte07_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte07_err_1      ), .dout ( byte07_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte08_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte08_err_1      ), .dout ( byte08_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte09_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte09_err_1      ), .dout ( byte09_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte10_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte10_err_1      ), .dout ( byte10_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte11_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte11_err_1      ), .dout ( byte11_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte12_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte12_err_1      ), .dout ( byte12_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte13_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte13_err_1      ), .dout ( byte13_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte14_err		          ( .din0 ( errpos_0to14       ), .din1 ( byte14_err_1      ), .dout ( byte14_err    ));

mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_errpos_15to29	  	          ( .din0 ( diffecc1_adj_zero  ), .din1 ( diffecc2_adj_nz   ), .dout ( errpos_15to29 ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte15_err      	          ( .din0 ( errpos_15to29      ), .din1 ( byte15_err_1      ), .dout ( byte15_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte16_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte16_err_1      ), .dout ( byte16_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte17_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte17_err_1      ), .dout ( byte17_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte18_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte18_err_1      ), .dout ( byte18_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte19_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte19_err_1      ), .dout ( byte19_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte20_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte20_err_1      ), .dout ( byte20_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte21_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte21_err_1      ), .dout ( byte21_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte22_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte22_err_1      ), .dout ( byte22_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte23_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte23_err_1      ), .dout ( byte23_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte24_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte24_err_1      ), .dout ( byte24_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte25_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte25_err_1      ), .dout ( byte25_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte26_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte26_err_1      ), .dout ( byte26_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte27_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte27_err_1      ), .dout ( byte27_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte28_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte28_err_1      ), .dout ( byte28_err    ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte29_err		          ( .din0 ( errpos_15to29      ), .din1 ( byte29_err_1      ), .dout ( byte29_err    ));

mcu_readdp_dp_and_macro__ports_3__stack_1l__width_1	u_byte30_err		          ( .din0 ( byte3031_err_1     ), .din1 ( diffecc0_adj_zero ), .din2 ( diffecc1_adj_nz   ), .dout ( byte30_err ));
mcu_readdp_dp_and_macro__ports_3__stack_1l__width_1	u_byte31_err		          ( .din0 ( byte3031_err_1     ), .din1 ( byte00_err_1      ), .din2 ( diffecc0_adj_nz   ), .dout ( byte31_err ));
                                                                                                                                                               
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte00_1		          ( .din0 ( {4{ byte00_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte00_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte01_1		          ( .din0 ( {4{ byte01_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte01_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte02_1		          ( .din0 ( {4{ byte02_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte02_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte03_1		          ( .din0 ( {4{ byte03_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte03_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte04_1		          ( .din0 ( {4{ byte04_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte04_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte05_1		          ( .din0 ( {4{ byte05_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte05_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte06_1		          ( .din0 ( {4{ byte06_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte06_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte07_1		          ( .din0 ( {4{ byte07_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte07_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte08_1		          ( .din0 ( {4{ byte08_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte08_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte09_1		          ( .din0 ( {4{ byte09_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte09_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte10_1		          ( .din0 ( {4{ byte10_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte10_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte11_1		          ( .din0 ( {4{ byte11_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte11_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte12_1		          ( .din0 ( {4{ byte12_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte12_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte13_1		          ( .din0 ( {4{ byte13_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte13_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte14_1		          ( .din0 ( {4{ byte14_err  }} ), .din1 ( diff_ecc1_adj[3:0] ), .dout ( outbyte14_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte15_1		          ( .din0 ( {4{ byte15_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte15_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte16_1		          ( .din0 ( {4{ byte16_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte16_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte17_1		          ( .din0 ( {4{ byte17_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte17_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte18_1		          ( .din0 ( {4{ byte18_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte18_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte19_1		          ( .din0 ( {4{ byte19_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte19_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte20_1		          ( .din0 ( {4{ byte20_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte20_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte21_1		          ( .din0 ( {4{ byte21_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte21_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte22_1		          ( .din0 ( {4{ byte22_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte22_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte23_1		          ( .din0 ( {4{ byte23_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte23_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte24_1		          ( .din0 ( {4{ byte24_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte24_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte25_1		          ( .din0 ( {4{ byte25_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte25_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte26_1		          ( .din0 ( {4{ byte26_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte26_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte27_1		          ( .din0 ( {4{ byte27_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte27_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte28_1		          ( .din0 ( {4{ byte28_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte28_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte29_1		          ( .din0 ( {4{ byte29_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte29_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte30_1		          ( .din0 ( {4{ byte30_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte30_1[3:0] ));
mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4	u_outbyte31_1		          ( .din0 ( {4{ byte31_err  }} ), .din1 ( diff_ecc2_adj[3:0] ), .dout ( outbyte31_1[3:0] ));

mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte00		          ( .din0 ( outbyte00_1[3:0] ), .din1 ( rddata00_in[3:0] ), .dout ( outbyte00[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte01		          ( .din0 ( outbyte01_1[3:0] ), .din1 ( rddata01_in[3:0] ), .dout ( outbyte01[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte02		          ( .din0 ( outbyte02_1[3:0] ), .din1 ( rddata02_in[3:0] ), .dout ( outbyte02[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte03		          ( .din0 ( outbyte03_1[3:0] ), .din1 ( rddata03_in[3:0] ), .dout ( outbyte03[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte04		          ( .din0 ( outbyte04_1[3:0] ), .din1 ( rddata04_in[3:0] ), .dout ( outbyte04[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte05		          ( .din0 ( outbyte05_1[3:0] ), .din1 ( rddata05_in[3:0] ), .dout ( outbyte05[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte06		          ( .din0 ( outbyte06_1[3:0] ), .din1 ( rddata06_in[3:0] ), .dout ( outbyte06[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte07		          ( .din0 ( outbyte07_1[3:0] ), .din1 ( rddata07_in[3:0] ), .dout ( outbyte07[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte08		          ( .din0 ( outbyte08_1[3:0] ), .din1 ( rddata08_in[3:0] ), .dout ( outbyte08[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte09		          ( .din0 ( outbyte09_1[3:0] ), .din1 ( rddata09_in[3:0] ), .dout ( outbyte09[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte10		          ( .din0 ( outbyte10_1[3:0] ), .din1 ( rddata10_in[3:0] ), .dout ( outbyte10[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte11		          ( .din0 ( outbyte11_1[3:0] ), .din1 ( rddata11_in[3:0] ), .dout ( outbyte11[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte12		          ( .din0 ( outbyte12_1[3:0] ), .din1 ( rddata12_in[3:0] ), .dout ( outbyte12[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte13		          ( .din0 ( outbyte13_1[3:0] ), .din1 ( rddata13_in[3:0] ), .dout ( outbyte13[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte14		          ( .din0 ( outbyte14_1[3:0] ), .din1 ( rddata14_in[3:0] ), .dout ( outbyte14[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte15		          ( .din0 ( outbyte15_1[3:0] ), .din1 ( rddata15_in[3:0] ), .dout ( outbyte15[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte16		          ( .din0 ( outbyte16_1[3:0] ), .din1 ( rddata16_in[3:0] ), .dout ( outbyte16[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte17		          ( .din0 ( outbyte17_1[3:0] ), .din1 ( rddata17_in[3:0] ), .dout ( outbyte17[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte18		          ( .din0 ( outbyte18_1[3:0] ), .din1 ( rddata18_in[3:0] ), .dout ( outbyte18[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte19		          ( .din0 ( outbyte19_1[3:0] ), .din1 ( rddata19_in[3:0] ), .dout ( outbyte19[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte20		          ( .din0 ( outbyte20_1[3:0] ), .din1 ( rddata20_in[3:0] ), .dout ( outbyte20[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte21		          ( .din0 ( outbyte21_1[3:0] ), .din1 ( rddata21_in[3:0] ), .dout ( outbyte21[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte22		          ( .din0 ( outbyte22_1[3:0] ), .din1 ( rddata22_in[3:0] ), .dout ( outbyte22[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte23		          ( .din0 ( outbyte23_1[3:0] ), .din1 ( rddata23_in[3:0] ), .dout ( outbyte23[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte24		          ( .din0 ( outbyte24_1[3:0] ), .din1 ( rddata24_in[3:0] ), .dout ( outbyte24[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte25		          ( .din0 ( outbyte25_1[3:0] ), .din1 ( rddata25_in[3:0] ), .dout ( outbyte25[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte26		          ( .din0 ( outbyte26_1[3:0] ), .din1 ( rddata26_in[3:0] ), .dout ( outbyte26[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte27		          ( .din0 ( outbyte27_1[3:0] ), .din1 ( rddata27_in[3:0] ), .dout ( outbyte27[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte28		          ( .din0 ( outbyte28_1[3:0] ), .din1 ( rddata28_in[3:0] ), .dout ( outbyte28[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte29		          ( .din0 ( outbyte29_1[3:0] ), .din1 ( rddata29_in[3:0] ), .dout ( outbyte29[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte30		          ( .din0 ( outbyte30_1[3:0] ), .din1 ( rddata30_in[3:0] ), .dout ( outbyte30[3:0] ));
mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4	u_outbyte31		          ( .din0 ( outbyte31_1[3:0] ), .din1 ( rddata31_in[3:0] ), .dout ( outbyte31[3:0] ));

// MECC detection

mcu_readdp_dp_cmp_macro__width_4	u_byte00_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( diff_ecc1_adj[3:0] ),       .dout ( byte00_err_mecc_1    ));
mcu_readdp_dp_cmp_macro__width_4	u_byte08_23_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result02[3:0] ), .dout ( byte08_23_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte13_28_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result03[3:0] ), .dout ( byte13_28_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte12_27_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result04[3:0] ), .dout ( byte12_27_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte10_25_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result05[3:0] ), .dout ( byte10_25_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte06_21_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result06[3:0] ), .dout ( byte06_21_err_mecc_1 )); 
mcu_readdp_dp_cmp_macro__width_4	u_byte05_20_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result07[3:0] ), .dout ( byte05_20_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte14_29_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result08[3:0] ), .dout ( byte14_29_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte01_16_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result09[3:0] ), .dout ( byte01_16_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte11_26_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result10[3:0] ), .dout ( byte11_26_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte04_19_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result11[3:0] ), .dout ( byte04_19_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte09_24_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result12[3:0] ), .dout ( byte09_24_err_mecc_1 )); 
mcu_readdp_dp_cmp_macro__width_4	u_byte03_18_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result13[3:0] ), .dout ( byte03_18_err_mecc_1 ));
mcu_readdp_dp_cmp_macro__width_4	u_byte02_17_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result14[3:0] ), .dout ( byte02_17_err_mecc_1 )); 
mcu_readdp_dp_cmp_macro__width_4	u_byte07_22_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( rddata_cor_result15[3:0] ), .dout ( byte07_22_err_mecc_1 )); 
mcu_readdp_dp_cmp_macro__width_4	u_byte15_err_mecc_1	    ( .din0 ( diff_ecc3_adj[3:0] ), .din1 ( diff_ecc2_adj[3:0] ),       .dout ( byte15_err_mecc_1    ));

mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_bytexx_err_mecc_2	           ( .din0 ( diffecc1_adj_nz   ), .din1 ( diffecc2_adj_zero ), .dout ( bytexx_err_mecc_2 ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byteyy_err_mecc_2	           ( .din0 ( diffecc1_adj_zero ), .din1 ( diffecc2_adj_nz   ), .dout ( byteyy_err_mecc_2 ));

mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte00_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte00_err_mecc_1    ), .dout ( byte00_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte01_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte01_16_err_mecc_1 ), .dout ( byte01_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte02_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte02_17_err_mecc_1 ), .dout ( byte02_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte03_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte03_18_err_mecc_1 ), .dout ( byte03_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte04_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte04_19_err_mecc_1 ), .dout ( byte04_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte05_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte05_20_err_mecc_1 ), .dout ( byte05_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte06_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte06_21_err_mecc_1 ), .dout ( byte06_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte07_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte07_22_err_mecc_1 ), .dout ( byte07_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte08_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte08_23_err_mecc_1 ), .dout ( byte08_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte09_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte09_24_err_mecc_1 ), .dout ( byte09_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte10_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte10_25_err_mecc_1 ), .dout ( byte10_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte11_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte11_26_err_mecc_1 ), .dout ( byte11_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte12_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte12_27_err_mecc_1 ), .dout ( byte12_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte13_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte13_28_err_mecc_1 ), .dout ( byte13_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte14_err_mecc	           ( .din0 ( bytexx_err_mecc_2 ), .din1 ( byte14_29_err_mecc_1 ), .dout ( byte14_err_mecc ));

mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte15_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte15_err_mecc_1    ), .dout ( byte15_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte16_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte01_16_err_mecc_1 ), .dout ( byte16_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte17_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte02_17_err_mecc_1 ), .dout ( byte17_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte18_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte03_18_err_mecc_1 ), .dout ( byte18_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte19_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte04_19_err_mecc_1 ), .dout ( byte19_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte20_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte05_20_err_mecc_1 ), .dout ( byte20_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte21_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte06_21_err_mecc_1 ), .dout ( byte21_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte22_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte07_22_err_mecc_1 ), .dout ( byte22_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte23_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte08_23_err_mecc_1 ), .dout ( byte23_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte24_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte09_24_err_mecc_1 ), .dout ( byte24_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte25_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte10_25_err_mecc_1 ), .dout ( byte25_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte26_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte11_26_err_mecc_1 ), .dout ( byte26_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte27_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte12_27_err_mecc_1 ), .dout ( byte27_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte28_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte13_28_err_mecc_1 ), .dout ( byte28_err_mecc ));
mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1	u_byte29_err_mecc	           ( .din0 ( byteyy_err_mecc_2 ), .din1 ( byte14_29_err_mecc_1 ), .dout ( byte29_err_mecc ));

assign	ecc_loc[35:0] =            { secc_err[3:0],						
                                     byte31_err, byte30_err, byte29_err, byte28_err, byte27_err, byte26_err, byte25_err, byte24_err, 
			             byte23_err, byte22_err, byte21_err, byte20_err, byte19_err, byte18_err, byte17_err, byte16_err, 
			             byte15_err, byte14_err, byte13_err, byte12_err, byte11_err, byte10_err, byte09_err, byte08_err, 
			             byte07_err, byte06_err, byte05_err, byte04_err, byte03_err, byte02_err, byte01_err, byte00_err };

assign	err_byte_0_14_loc[14:0] =  { byte14_err_mecc,    byte13_err_mecc,    byte12_err_mecc,    byte11_err_mecc,    byte10_err_mecc,  
                                     byte09_err_mecc,    byte08_err_mecc,    byte07_err_mecc,    byte06_err_mecc,    byte05_err_mecc,  
                                     byte04_err_mecc,    byte03_err_mecc,    byte02_err_mecc,    byte01_err_mecc,    byte00_err_mecc   };

assign	err_byte_15_29_loc[14:0] = { byte29_err_mecc,    byte28_err_mecc,    byte27_err_mecc,    byte26_err_mecc,    byte25_err_mecc,      
                                     byte24_err_mecc,    byte23_err_mecc,    byte22_err_mecc,    byte21_err_mecc,    byte20_err_mecc,      
                                     byte19_err_mecc,    byte18_err_mecc,    byte17_err_mecc,    byte16_err_mecc,    byte15_err_mecc   };


//
//	N1 dram_ecc_cor	line_409
//
//	assign ecc_multi_err = ~l2if_dram_fail_over_mode & ( 
//		((diff_ecc0_d1 == 4'h0) & (diff_ecc1_d1 == 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 != 4'h0)) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 == 4'h0) & (diff_ecc3_d1 == 4'h0)) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 == 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 == 4'h0)) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 == 4'h0) & (diff_ecc2_d1 == 4'h0) & (diff_ecc3_d1 != 4'h0)) |
//	        ((diff_ecc0_d1 == 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 == 4'h0) & (diff_ecc3_d1 != 4'h0)) |
//	        ((diff_ecc0_d1 == 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 == 4'h0)) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 != 4'h0)) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 == 4'h0) & (diff_ecc3_d1 != 4'h0) & (ecc_loc[14:0] !=  err_byte_0_14_loc[14:0]) ) |
//	        ((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 == 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 != 4'h0) & (ecc_loc[29:15] != err_byte_15_29_loc[14:0]) ) |
//		((diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 == 4'h0) & ((diff_ecc0_d1 != diff_ecc1_d1) | (diff_ecc1_d1 != diff_ecc2_d1)) ) |
//	  	((diff_ecc0_d1 == 4'h0) & (diff_ecc1_d1 != 4'h0) & (diff_ecc2_d1 != 4'h0) & (diff_ecc3_d1 != 4'h0) & ((diff_ecc1_d1 != diff_ecc2_d1) | (diff_ecc2_d1 != diff_ecc3_d1)) )); 
//
//

mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err10_1 	       ( .din0 ( diffecc0_adj_zero ), .din1 ( diffecc1_adj_zero ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[10] ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err9_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_zero ), .din3 ( diffecc3_adj_zero ), .dout ( ecc_multi_err_1[9]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err8_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_zero ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_zero ), .dout ( ecc_multi_err_1[8]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err7_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_zero ), .din2 ( diffecc2_adj_zero ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[7]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err6_1 	       ( .din0 ( diffecc0_adj_zero ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_zero ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[6]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err5_1 	       ( .din0 ( diffecc0_adj_zero ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_zero ), .dout ( ecc_multi_err_1[5]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err4_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[4]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err3_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_zero ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[3]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err2_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_zero ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[2]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err1_1 	       ( .din0 ( diffecc0_adj_nz   ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_zero ), .dout ( ecc_multi_err_1[1]  ));
mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err0_1 	       ( .din0 ( diffecc0_adj_zero ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc2_adj_nz   ), .din3 ( diffecc3_adj_nz   ), .dout ( ecc_multi_err_1[0]  ));

mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err10_2	       ( .din0 ( ecc_multi_err_1[10] ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[10] ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err9_2	       ( .din0 ( ecc_multi_err_1[9]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[9]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err8_2	       ( .din0 ( ecc_multi_err_1[8]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[8]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err7_2	       ( .din0 ( ecc_multi_err_1[7]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[7]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err6_2	       ( .din0 ( ecc_multi_err_1[6]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[6]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err5_2	       ( .din0 ( ecc_multi_err_1[5]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[5]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err4_2	       ( .din0 ( ecc_multi_err_1[4]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[4]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err3_2	       ( .din0 ( ecc_multi_err_1[3]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[3]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err2_2	       ( .din0 ( ecc_multi_err_1[2]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[2]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err1_2	       ( .din0 ( ecc_multi_err_1[1]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[1]  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_multi_err0_2	       ( .din0 ( ecc_multi_err_1[0]  ), .din1 ( fail_over_mode ), .dout ( ecc_multi_err_2[0]  ));

mcu_readdp_dp_cmp_macro__width_16	u_ecc_multi_err1_cmp       ( .din0	( { 1'b0, ecc_loc[14:0] }  ), .din1	( { 1'b0, err_byte_0_14_loc[14:0] }  ), .dout	( ecc_loc_err_byte_0_14_loc_eq ));
mcu_readdp_dp_cmp_macro__width_16	u_ecc_multi_err0_cmp       ( .din0	( { 1'b0, ecc_loc[29:15] } ), .din1	( { 1'b0, err_byte_15_29_loc[14:0] } ), .dout	( ecc_loc_err_byte_15_29_loc_eq ));

mcu_readdp_dp_inv_macro__width_1	u_ecc_multi_err4_3	    ( .din ( byte00_err_1                  ), .dout ( diffecc0ecc1_adj_ne           ));
mcu_readdp_dp_inv_macro__width_1	u_ecc_multi_err3_3	    ( .din ( byte3031_err_1                ), .dout ( diffecc1ecc2_adj_ne           ));
mcu_readdp_dp_inv_macro__width_1	u_ecc_multi_err2_3	    ( .din ( byte15_err_mecc_1             ), .dout ( diffecc2ecc3_adj_ne           ));
mcu_readdp_dp_inv_macro__width_1	u_ecc_multi_err1_3	    ( .din ( ecc_loc_err_byte_0_14_loc_eq  ), .dout ( eccloc_errbyte_0014loc_ne     ));
mcu_readdp_dp_inv_macro__width_1	u_ecc_multi_err0_3	    ( .din ( ecc_loc_err_byte_15_29_loc_eq ), .dout ( eccloc_errbyte_1529loc_ne     ));

mcu_readdp_dp_or_macro__ports_2__width_1	u_ecc_multi_err1_4	       ( .din0 ( diffecc0ecc1_adj_ne ), .din1 ( diffecc1ecc2_adj_ne ), .dout ( ecc_multi_err1_4 ));
mcu_readdp_dp_or_macro__ports_2__width_1	u_ecc_multi_err0_4	       ( .din0 ( diffecc1ecc2_adj_ne ), .din1 ( diffecc2ecc3_adj_ne ), .dout ( ecc_multi_err0_4 ));

mcu_readdp_dp_and_macro__dinv_4x__dnand_2x__ports_2__width_1	u_ecc_multi_err3_5	             ( .din0 ( ecc_multi_err_2[3]), .din1 ( eccloc_errbyte_0014loc_ne ), .dout ( ecc_multi_err3_5 ));
mcu_readdp_dp_and_macro__dinv_4x__dnand_2x__ports_2__width_1	u_ecc_multi_err2_5	             ( .din0 ( ecc_multi_err_2[2]), .din1 ( eccloc_errbyte_1529loc_ne ), .dout ( ecc_multi_err2_5 ));
mcu_readdp_dp_and_macro__dinv_4x__dnand_2x__ports_2__width_1	u_ecc_multi_err1_5	             ( .din0 ( ecc_multi_err_2[1]), .din1 ( ecc_multi_err1_4          ), .dout ( ecc_multi_err1_5 ));
mcu_readdp_dp_and_macro__dinv_4x__dnand_2x__ports_2__width_1	u_ecc_multi_err0_5	             ( .din0 ( ecc_multi_err_2[0]), .din1 ( ecc_multi_err0_4          ), .dout ( ecc_multi_err0_5 ));

mcu_readdp_dp_nor_macro__dnor_4x__ports_3__width_1	u_ecc_multi_err3_6 	          ( .din0 ( ecc_multi_err_2[10] ), .din1 ( ecc_multi_err_2[9] ), .din2 ( ecc_multi_err_2[8] ), .dout ( ecc_multi_err3_6 ));
mcu_readdp_dp_nor_macro__dnor_4x__ports_3__width_1	u_ecc_multi_err2_6 	          ( .din0 ( ecc_multi_err_2[7]  ), .din1 ( ecc_multi_err_2[6] ), .din2 ( ecc_multi_err_2[5] ), .dout ( ecc_multi_err2_6 ));
mcu_readdp_dp_nor_macro__dnor_4x__ports_3__width_1	u_ecc_multi_err1_6 	          ( .din0 ( ecc_multi_err_2[4]  ), .din1 ( ecc_multi_err3_5   ), .din2 ( ecc_multi_err2_5   ), .dout ( ecc_multi_err1_6 ));
mcu_readdp_dp_nor_macro__dnor_4x__ports_2__width_1	u_ecc_multi_err0_6 	          ( .din0 ( ecc_multi_err1_5    ), .din1 ( ecc_multi_err0_5   ),                               .dout ( ecc_multi_err0_6 ));

mcu_readdp_dp_nand_macro__ports_4__width_1	u_ecc_multi_err  	       ( .din0 ( ecc_multi_err3_6 ), .din1 (ecc_multi_err2_6), .din2 ( ecc_multi_err1_6 ), .din3 ( ecc_multi_err0_6 ), .dout ( ecc_multi_err ));

//	// Generate single ecc error signal. 
//	wire secc_err31       = (diff_ecc0_d1 != 4'h0) & ( (diff_ecc2_d1 == diff_ecc1_d1) & (diff_ecc2_d1 == diff_ecc0_d1) );
//	wire secc_err30       = (diff_ecc1_d1 != 4'h0) & ( (diff_ecc1_d1 == diff_ecc2_d1) & (diff_ecc0_d1 == 4'h0) );
//	wire secc_err_lo      = (diff_ecc1_d1 != 4'h0) & (diff_ecc0_d1 != 4'h0) & (diff_ecc2_d1 == 4'h0); 
//	wire secc_err_hi      = (diff_ecc2_d1 != 4'h0) & (diff_ecc0_d1 != 4'h0) & (diff_ecc1_d1 == 4'h0); 
//	assign ecc_single_err = ~ecc_multi_err & ((secc_err31 | secc_err30 | secc_err_hi | secc_err_lo) | (|secc_err_d1));


mcu_readdp_dp_and_macro__ports_3__width_1	u_secc_err31		       ( .din0 ( byte3031_err_1    ), .din1 ( byte15_err_1      ), .din2 ( diffecc0_adj_nz   ), .dout ( secc_err31  ));
mcu_readdp_dp_and_macro__ports_3__width_1	u_secc_err30		       ( .din0 ( byte3031_err_1    ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc0_adj_zero ), .dout ( secc_err30  ));
mcu_readdp_dp_and_macro__ports_3__width_1	u_secc_err_hi	               ( .din0 ( diffecc2_adj_nz   ), .din1 ( diffecc1_adj_zero ), .din2 ( diffecc0_adj_nz   ), .dout ( secc_err_hi ));
mcu_readdp_dp_and_macro__ports_3__width_1	u_secc_err_lo	               ( .din0 ( diffecc2_adj_zero ), .din1 ( diffecc1_adj_nz   ), .din2 ( diffecc0_adj_nz   ), .dout ( secc_err_lo ));

mcu_readdp_dp_nor_macro__ports_3__width_1	u_ecc_single_err_1	       ( .din0 ( secc_err31        ), .din1 ( secc_err30        ), .din2 ( secc_err_hi       ), .dout ( ecc_single_err_1  ));
mcu_readdp_dp_nor_macro__ports_3__width_1	u_ecc_single_err_2	       ( .din0 ( secc_err_lo       ), .din1 ( secc_err[3]       ), .din2 ( secc_err[2]       ), .dout ( ecc_single_err_2  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_single_err_3	       ( .din0 ( secc_err[1]       ), .din1 ( secc_err[0]       ),                              .dout ( ecc_single_err_3  ));
mcu_readdp_dp_and_macro__ports_3__width_1	u_ecc_single_err_4	       ( .din0 ( ecc_single_err_1  ), .din1 ( ecc_single_err_2  ), .din2 ( ecc_single_err_3  ), .dout ( ecc_single_err_4  ));
mcu_readdp_dp_nor_macro__ports_2__width_1	u_ecc_single_err  	       ( .din0 ( ecc_single_err_4  ), .din1 ( ecc_multi_err     ),                              .dout ( ecc_single_err    ));


//
//	Corrected data
//
mcu_readdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_64c__width_64 	u_cordata_127_64	              (	
		.din0	( { rddata31_in[3:0], rddata30_in[3:0], rddata29_in[3:0], rddata28_in[3:0], 
			    rddata27_in[3:0], rddata26_in[3:0], rddata25_in[3:0], rddata24_in[3:0], 
			    rddata23_in[3:0], rddata22_in[3:0], rddata21_in[3:0], rddata20_in[3:0], 
			    rddata19_in[3:0], rddata18_in[3:0], rddata17_in[3:0], rddata16_in[3:0]  }),
		.din1	( { outbyte31[3:0],   outbyte30[3:0],   outbyte29[3:0],   outbyte28[3:0], 
			    outbyte27[3:0],   outbyte26[3:0],   outbyte25[3:0],   outbyte24[3:0], 
			    outbyte23[3:0],   outbyte22[3:0],   outbyte21[3:0],   outbyte20[3:0], 
			    outbyte19[3:0],   outbyte18[3:0],   outbyte17[3:0],   outbyte16[3:0]    }),
		.sel0	( ecc_multi_err ),
		.dout	( cor_rddata[127:64] ));

mcu_readdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_64c__width_64 	u_cordata_63_0		              (
		.din0	( { rddata15_in[3:0], rddata14_in[3:0], rddata13_in[3:0], rddata12_in[3:0], 
			    rddata11_in[3:0], rddata10_in[3:0], rddata09_in[3:0], rddata08_in[3:0], 
			    rddata07_in[3:0], rddata06_in[3:0], rddata05_in[3:0], rddata04_in[3:0], 
			    rddata03_in[3:0], rddata02_in[3:0], rddata01_in[3:0], rddata00_in[3:0] }),
		.din1	( { outbyte15[3:0],   outbyte14[3:0],   outbyte13[3:0],   outbyte12[3:0], 
			    outbyte11[3:0],   outbyte10[3:0],   outbyte09[3:0],   outbyte08[3:0], 
			    outbyte07[3:0],   outbyte06[3:0],   outbyte05[3:0],   outbyte04[3:0], 
			    outbyte03[3:0],   outbyte02[3:0],   outbyte01[3:0],   outbyte00[3:0]   }),
		.sel0	( ecc_multi_err ),
		.dout	( cor_rddata[63:0] ));

mcu_readdp_dp_msff_macro__stack_66c__width_65	u_rddata_127_64_secc_err    		       (
		.scan_in(u_rddata_127_64_secc_err_scanin),
		.scan_out(u_rddata_127_64_secc_err_scanout),
		.clk	  ( drl2clk ),							
		.en	  ( rddata_en[1] ),
		.din	  ( {cor_rddata[127:64], ecc_single_err } ),
		.dout	  ( {rddata[127:64],     dr_secc_err } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_readdp_dp_msff_macro__stack_66c__width_65	u_rddata_63_0_mecc_err		       (
		.scan_in(u_rddata_63_0_mecc_err_scanin),
		.scan_out(u_rddata_63_0_mecc_err_scanout),
		.clk	  ( drl2clk ),							
		.en	  ( rddata_en[1] ),
		.din	  ( { cor_rddata[63:0],  ecc_multi_err } ),
		.dout	  ( { rddata[63:0],      dr_mecc_err } ),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// fixscan start:
assign u_rddata_in_127_64_scanin = scan_in                  ;
assign u_rddata_in_63_0_scanin   = u_rddata_in_127_64_scanout;
assign u_rdecc_in_15_8_scanin    = u_rddata_in_63_0_scanout ;
assign u_rdecc_in_7_0_par_scanin = u_rdecc_in_15_8_scanout  ;
assign u_rddata_127_64_secc_err_scanin = u_rdecc_in_7_0_par_scanout;
assign u_rddata_63_0_mecc_err_scanin = u_rddata_127_64_secc_err_scanout;
assign scan_out                  = u_rddata_63_0_mecc_err_scanout;
// fixscan end:
endmodule	//	mcu_readdp_dp;                                                                            



//
//   buff macro
//
//





module mcu_readdp_dp_buff_macro__width_2 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output [15:0] dout;






and2 #(16)  d0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout[15:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;






and2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_readdp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_4l__width_4 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [3:0] din0;
  input sel0;
  input [3:0] din1;
  input sel1;
  output [3:0] dout;





mux2s #(4)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
.dout(dout[3:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_readdp_dp_msff_macro__stack_64c__width_64 (
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
//   xor macro for ports = 2,3
//
//





module mcu_readdp_dp_xor_macro__ports_2 (
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









// any PARAMS parms go into naming of macro

module mcu_readdp_dp_msff_macro__stack_8l__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_readdp_dp_msff_macro__stack_10l__width_9 (
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
wire [7:0] so;

  input [8:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [8:0] dout;


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
dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);








endmodule




//
//   buff macro
//
//





module mcu_readdp_dp_buff_macro__stack_64c__width_64 (
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





module mcu_readdp_dp_buff_macro__stack_2l__width_2 (
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





module mcu_readdp_dp_xor_macro__dxor_8x__ports_3__width_1 (
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





module mcu_readdp_dp_buff_macro__stack_16l__width_16 (
  din, 
  dout);
  input [15:0] din;
  output [15:0] dout;






buff #(16)  d0_0 (
.in(din[15:0]),
.out(dout[15:0])
);








endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__ports_2__stack_1l__width_1 (
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





module mcu_readdp_dp_nand_macro__ports_2__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module mcu_readdp_dp_inv_macro__stack_1l__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule



// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_readdp_dp_mux_macro__mux_pgpe__ports_2__stack_4c__width_4 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [3:0] din0;
  input [3:0] din1;
  input sel0;
  output [3:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(4)  d0_0 (
  .sel(psel1),
  .in0(din0[3:0]),
  .in1(din1[3:0]),
.dout(dout[3:0])
);









  



endmodule


//
//   xor macro for ports = 2,3
//
//





module mcu_readdp_dp_xor_macro__ports_3__stack_1l__width_1 (
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





module mcu_readdp_dp_xor_macro__ports_2__stack_1l__width_1 (
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
//   buff macro
//
//





module mcu_readdp_dp_buff_macro__stack_1l__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module mcu_readdp_dp_buff_macro__stack_56l__width_56 (
  din, 
  dout);
  input [55:0] din;
  output [55:0] dout;






buff #(56)  d0_0 (
.in(din[55:0]),
.out(dout[55:0])
);








endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__dnor_4x__ports_2__width_1 (
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
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__dnor_16x__ports_2__width_1 (
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





module mcu_readdp_dp_nand_macro__ports_3__stack_1l__width_1 (
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
//   or macro for ports = 2,3
//
//





module mcu_readdp_dp_or_macro__ports_2__stack_1l__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__dinv_32x__dnand_4x__ports_2__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__ports_3__stack_1l__width_1 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_readdp_dp_cmp_macro__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output dout;






cmp #(4)  m0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__ports_2__stack_1l__width_1 (
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





module mcu_readdp_dp_and_macro__ports_3__stack_1l__width_1 (
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





//  
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__ports_2__stack_4l__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;






and2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_readdp_dp_xor_macro__ports_2__stack_4l__width_4 (
  din0, 
  din1, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  output [3:0] dout;





xor2 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.out(dout[3:0])
);








endmodule





//
//   nand macro for ports = 2,3,4
//
//





module mcu_readdp_dp_nand_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






nand4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__ports_2__width_1 (
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
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_readdp_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module mcu_readdp_dp_inv_macro__width_1 (
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
//   or macro for ports = 2,3
//
//





module mcu_readdp_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__dinv_4x__dnand_2x__ports_2__width_1 (
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
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__dnor_4x__ports_3__width_1 (
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
//   and macro for ports = 2,3,4
//
//





module mcu_readdp_dp_and_macro__ports_3__width_1 (
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





//
//   nor macro for ports = 2,3
//
//





module mcu_readdp_dp_nor_macro__ports_3__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_readdp_dp_mux_macro__dmux_32x__mux_pgpe__ports_2__stack_64c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(64)  d0_0 (
  .sel(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module mcu_readdp_dp_msff_macro__stack_66c__width_65 (
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








