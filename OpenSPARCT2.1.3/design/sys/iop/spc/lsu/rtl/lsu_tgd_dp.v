// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_tgd_dp.v
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
module lsu_tgd_dp (
  dta_rdata_w0_m, 
  dta_rdata_w1_m, 
  dta_rdata_w2_m, 
  dta_rdata_w3_m, 
  tgc_cache_way_vld_m, 
  tgc_cache_way_vld2_m, 
  tgc_way_sel_m, 
  dcs_watchpoint_m, 
  dcs_context0_e, 
  dcs_context1_e, 
  dcc_rd_dt_diag_m, 
  dcc_rd_dt_diag_b, 
  dcc_tlb_tag0_read_b, 
  dcc_tlb_tag1_read_b, 
  dcc_tlb_data_read_b, 
  dcc_ld_inst_vld_m, 
  dcc_ldst_m_clken, 
  tlb_pgnum, 
  tlb_tte_data, 
  tlb_tte_tag, 
  tlb_tte_u_bit, 
  tlb_cam_hit, 
  tlb_context0_hit, 
  tlb_cam_mhit, 
  tld_prty_256m, 
  tld_prty_4m, 
  tld_prty_64k, 
  tld_prty_8k, 
  tld_prty_ctxt0, 
  tld_prty_ctxt1, 
  tld_tag_c0, 
  tld_tag_c1, 
  tlc_sel_tte_tag, 
  tlc_sel_demap_tag_c0, 
  tlc_sel_demap_tag_c1, 
  bist_cmp_data, 
  bist_dta_cmp_en, 
  bist_cmpsel_2, 
  lsu_va_m, 
  tgd_w0_parity_b, 
  tgd_w1_parity_b, 
  tgd_w2_parity_b, 
  tgd_w3_parity_b, 
  dta_rdata_w0_rep, 
  dta_rdata_w1_rep, 
  dta_rdata_w2_rep, 
  dta_rdata_w3_rep, 
  tgd_prty_256m_b, 
  tgd_prty_4m_b, 
  tgd_prty_64k_b, 
  tgd_prty_8k_b, 
  tgd_prty_ctxt0_b, 
  tgd_prty_ctxt1_b, 
  tgd_va_wp_47_16, 
  tgd_va_wp_15_3, 
  tgd_pa_wp_39_16, 
  tgd_pa_wp_15_3, 
  tgd_tag_c0, 
  tgd_tag_c1, 
  tlb_tag_parity, 
  tlb_pgsize, 
  tlb_tte_nfo_b, 
  tlb_tte_ie_b, 
  tlb_tte_cp_b, 
  tlb_tte_ebit_b, 
  tlb_tte_pbit_b, 
  tlb_tte_wbit_b, 
  tgd_ldxa_asi_data_b, 
  tgd_bist_compare, 
  lsu_mbi_tlb_data_cmp, 
  lsu_mbi_tlb_cam_hit, 
  lsu_mbi_tlb_cam_mhit, 
  lsu_mbi_tlb_ctxt0_hit, 
  lsu_mbi_tlb_valid, 
  lsu_mbi_tlb_used, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_out, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire clk;
wire [1:0] w0_16b_parity_m;
wire [1:0] w1_16b_parity_m;
wire [1:0] w2_16b_parity_m;
wire [1:0] w3_16b_parity_m;
wire dff_16b_prty_w01_scanin;
wire dff_16b_prty_w01_scanout;
wire [1:0] w0_16b_parity_b;
wire [1:0] w1_16b_parity_b;
wire dff_16b_prty_w23_scanin;
wire dff_16b_prty_w23_scanout;
wire [1:0] w2_16b_parity_b;
wire [1:0] w3_16b_parity_b;
wire [3:0] tag_parity_b;
wire [31:0] tgd_diag_tag01_m;
wire [31:0] tgd_diag_tag23_m;
wire dff_diag_tag_scanin;
wire dff_diag_tag_scanout;
wire [31:0] tgd_diag_tag_b;
wire tte_data_va_27_22_v_;
wire tte_data_sz_1;
wire [12:0] tag_c0;
wire [12:0] tag_c1;
wire [63:0] ldxa_asi_data_b;
wire [47:3] va_m_buf;
wire dff_va_b_scanin;
wire dff_va_b_scanout;
wire [47:3] va_b;
wire dff_wpt_b_scanin;
wire dff_wpt_b_scanout;
wire [47:3] watchpoint_b;
wire va_wp_47_16;
wire va_wp_15_3;
wire pa_wp_39_16;
wire pa_wp_15_3;
wire [63:0] bist_mux_data;


input	[29:0]	dta_rdata_w0_m;
input	[29:0]	dta_rdata_w1_m;
input	[29:0]	dta_rdata_w2_m;
input	[29:0]	dta_rdata_w3_m;

input	[3:0]	tgc_cache_way_vld_m;
input	[3:0]	tgc_cache_way_vld2_m;
input	[1:0]	tgc_way_sel_m;

input	[47:3]	dcs_watchpoint_m;
input	[12:0]	dcs_context0_e;
input	[12:0]	dcs_context1_e;

input		dcc_rd_dt_diag_m;
input		dcc_rd_dt_diag_b;
input		dcc_tlb_tag0_read_b;
input		dcc_tlb_tag1_read_b;
input		dcc_tlb_data_read_b;
input		dcc_ld_inst_vld_m;
input		dcc_ldst_m_clken;

input	[39:13]	tlb_pgnum;
input	[37:0]	tlb_tte_data;		// for diag read muxing
input	[65:0]	tlb_tte_tag;		// for diag read muxing
input		tlb_tte_u_bit;		// for diag read muxing
input		tlb_cam_hit;
input		tlb_context0_hit;
input		tlb_cam_mhit;

input		tld_prty_256m;
input		tld_prty_4m;
input		tld_prty_64k;
input		tld_prty_8k;
input		tld_prty_ctxt0;
input		tld_prty_ctxt1;
input	[12:0]	tld_tag_c0;
input	[12:0]	tld_tag_c1;

input		tlc_sel_tte_tag;
input		tlc_sel_demap_tag_c0;
input		tlc_sel_demap_tag_c1;

input	[7:0]	bist_cmp_data;
input		bist_dta_cmp_en;
input		bist_cmpsel_2;

input	[47:3]	lsu_va_m;

output		tgd_w0_parity_b;
output		tgd_w1_parity_b;
output		tgd_w2_parity_b;
output		tgd_w3_parity_b;

output	[28:0]	dta_rdata_w0_rep;
output	[28:0]	dta_rdata_w1_rep;
output	[28:0]	dta_rdata_w2_rep;
output	[28:0]	dta_rdata_w3_rep;

//output		tgd_tte_tag_parity;
//output		tgd_tte_data_parity;
output		tgd_prty_256m_b;
output		tgd_prty_4m_b;
output		tgd_prty_64k_b;
output		tgd_prty_8k_b;
output		tgd_prty_ctxt0_b;
output		tgd_prty_ctxt1_b;


output		tgd_va_wp_47_16;
output		tgd_va_wp_15_3;
output		tgd_pa_wp_39_16;
output		tgd_pa_wp_15_3;

output	[12:0]	tgd_tag_c0;
output	[12:0]	tgd_tag_c1;

output		tlb_tag_parity;
output	[2:0]	tlb_pgsize;
output		tlb_tte_nfo_b;
output		tlb_tte_ie_b;
output		tlb_tte_cp_b;
output		tlb_tte_ebit_b;
output		tlb_tte_pbit_b;
output		tlb_tte_wbit_b;

output	[63:0]	tgd_ldxa_asi_data_b;

output		tgd_bist_compare;

output		lsu_mbi_tlb_data_cmp;
output		lsu_mbi_tlb_cam_hit;
output		lsu_mbi_tlb_cam_mhit;
output		lsu_mbi_tlb_ctxt0_hit;
output		lsu_mbi_tlb_valid;
output		lsu_mbi_tlb_used;



// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input		tcu_se_scancollar_out;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign stop = 1'b0;
// end scan

lsu_tgd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

assign clk = l2clk;

// TLB TTE defines
`define TAG_CNTX1_HI    65
`define TAG_CNTX1_LO    53
`define TAG_PID_HI      52
`define TAG_PID_LO      50
`define TAG_REAL        49
`define TAG_VA_47_28_HI 48
`define TAG_VA_47_28_LO 29
`define TAG_VA_27_22_HI 28
`define TAG_VA_27_22_LO 23
`define TAG_V           22 
`define TAG_VA_21_16_HI 21
`define TAG_VA_21_16_LO 16
`define TAG_VA_15_13_HI 15 
`define TAG_VA_15_13_LO 13
`define TAG_CNTX0_HI    12
`define TAG_CNTX0_LO     0

`define TAG_PARITY	    37
`define DATA_PARITY         36 
`define DATA_PA_39_28_HI    35
`define DATA_PA_39_28_LO    24
`define DATA_PA_27_22_HI    23
`define DATA_PA_27_22_LO    18
`define DATA_VA_27_22_V     17 
`define DATA_PA_21_16_HI    16
`define DATA_PA_21_16_LO    11
`define DATA_VA_21_16_V     10 
`define DATA_PA_15_13_HI     9
`define DATA_PA_15_13_LO     7
`define DATA_VA_15_13_V      6 
`define DATA_NFO             5 
`define DATA_IE              4 
`define DATA_CP              3 
`define DATA_E               2 
`define DATA_P               1 
`define DATA_W               0 

// Parity checking for tag.  Tag is available late in M.  Flopping all 4 tags into
// B would require 120 flops, but there is not enough time to check 30b parity in M.
// So, generate 16b parity in M and flop that result (2 flops/way).  Then finish the 
// check in B.

lsu_tgd_dp_prty_macro__width_16 w0_16b_p1  (
	.din	({2'b00,dta_rdata_w0_m[29:16]}),
	.dout	(w0_16b_parity_m[1])
);
lsu_tgd_dp_prty_macro__width_16 w0_16b_p0  (
	.din	(dta_rdata_w0_m[15:0]),
	.dout	(w0_16b_parity_m[0])
);

lsu_tgd_dp_prty_macro__width_16 w1_16b_p1  (
	.din	({2'b00,dta_rdata_w1_m[29:16]}),
	.dout	(w1_16b_parity_m[1])
);
lsu_tgd_dp_prty_macro__width_16 w1_16b_p0  (
	.din	(dta_rdata_w1_m[15:0]),
	.dout	(w1_16b_parity_m[0])
);

lsu_tgd_dp_prty_macro__width_16 w2_16b_p1  (
	.din	({2'b00,dta_rdata_w2_m[29:16]}),
	.dout	(w2_16b_parity_m[1])
);
lsu_tgd_dp_prty_macro__width_16 w2_16b_p0  (
	.din	(dta_rdata_w2_m[15:0]),
	.dout	(w2_16b_parity_m[0])
);

lsu_tgd_dp_prty_macro__width_16 w3_16b_p1  (
	.din	({2'b00,dta_rdata_w3_m[29:16]}),
	.dout	(w3_16b_parity_m[1])
);
lsu_tgd_dp_prty_macro__width_16 w3_16b_p0  (
	.din	(dta_rdata_w3_m[15:0]),
	.dout	(w3_16b_parity_m[0])
);

lsu_tgd_dp_msff_macro__width_4 dff_16b_prty_w01  (
	.scan_in(dff_16b_prty_w01_scanin),
	.scan_out(dff_16b_prty_w01_scanout),
	.se	(tcu_se_scancollar_out),
	.din	({w0_16b_parity_m[1:0],w1_16b_parity_m[1:0]}),
	.dout	({w0_16b_parity_b[1:0],w1_16b_parity_b[1:0]}),
	.en	(dcc_ld_inst_vld_m),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_tgd_dp_msff_macro__width_4 dff_16b_prty_w23  (
	.scan_in(dff_16b_prty_w23_scanin),
	.scan_out(dff_16b_prty_w23_scanout),
	.se	(tcu_se_scancollar_out),
	.din	({w2_16b_parity_m[1:0],w3_16b_parity_m[1:0]}),
	.dout	({w2_16b_parity_b[1:0],w3_16b_parity_b[1:0]}),
	.en	(dcc_ld_inst_vld_m),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_tgd_dp_xor_macro__width_4 prty_xor  (
	.din0	({w3_16b_parity_b[0],w2_16b_parity_b[0],w1_16b_parity_b[0],w0_16b_parity_b[0]}),
	.din1	({w3_16b_parity_b[1],w2_16b_parity_b[1],w1_16b_parity_b[1],w0_16b_parity_b[1]}),
	.dout	(tag_parity_b[3:0])
);
lsu_tgd_dp_buff_macro__width_4 prty_buf  (
	.din	(tag_parity_b[3:0]),
	.dout	({tgd_w3_parity_b,tgd_w2_parity_b,tgd_w1_parity_b,tgd_w0_parity_b})
);

// Mux for diagnostic read
lsu_tgd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 mx_tag_way01      (
	.din0   ({dta_rdata_w1_m[29:0],tgc_cache_way_vld_m[1],tgc_cache_way_vld2_m[1]}),
	.din1   ({dta_rdata_w0_m[29:0],tgc_cache_way_vld_m[0],tgc_cache_way_vld2_m[0]}),
	.sel0	(tgc_way_sel_m[0]),
	.dout	(tgd_diag_tag01_m[31:0])
);
lsu_tgd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 mx_tag_way23      (
	.din0   ({dta_rdata_w3_m[29:0],tgc_cache_way_vld_m[3],tgc_cache_way_vld2_m[3]}),
	.din1   ({dta_rdata_w2_m[29:0],tgc_cache_way_vld_m[2],tgc_cache_way_vld2_m[2]}),
	.sel0	(tgc_way_sel_m[0]),
	.dout	(tgd_diag_tag23_m[31:0])
);
lsu_tgd_dp_msff_macro__mux_pgpe__ports_2__stack_32l__width_32 dff_diag_tag     (
	.scan_in(dff_diag_tag_scanin),
	.scan_out(dff_diag_tag_scanout),
	.se	(tcu_se_scancollar_out),
	.din0	(tgd_diag_tag23_m[31:0]),
	.din1	(tgd_diag_tag01_m[31:0]),
	.sel0	(tgc_way_sel_m[1]),
	.dout	(tgd_diag_tag_b[31:0]),
	.en	(dcc_rd_dt_diag_m),
  .clk(clk),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Buffer tag to tlb
lsu_tgd_dp_buff_macro__left_2__rep_1__stack_32c__width_29 buf_tag_w0    (
	.din	(dta_rdata_w0_m[28:0]),
	.dout	(dta_rdata_w0_rep[28:0])
);
lsu_tgd_dp_buff_macro__left_2__rep_1__stack_32c__width_29 buf_tag_w1    (
	.din	(dta_rdata_w1_m[28:0]),
	.dout	(dta_rdata_w1_rep[28:0])
);
lsu_tgd_dp_buff_macro__left_2__rep_1__stack_32c__width_29 buf_tag_w2    (
	.din	(dta_rdata_w2_m[28:0]),
	.dout	(dta_rdata_w2_rep[28:0])
);
lsu_tgd_dp_buff_macro__left_2__rep_1__stack_32c__width_29 buf_tag_w3    (
	.din	(dta_rdata_w3_m[28:0]),
	.dout	(dta_rdata_w3_rep[28:0])
);

lsu_tgd_dp_inv_macro__width_1 inv_sz_mux  (
	.din	(tlb_tte_data[`DATA_VA_27_22_V]),
	.dout	(tte_data_va_27_22_v_)
);
lsu_tgd_dp_and_macro__ports_2__width_1 and_sz   (
	.din0	(tlb_tte_data[`DATA_VA_21_16_V]),
	.din1	(tte_data_va_27_22_v_),
	.dout	(tte_data_sz_1)
);

////////////////////////////////////////////////////////////////////////////
// tte_tag context muxing

// First level of muxing is done in lsu_tld_dp and comes in as tld_tag_c0 
// and tld_tag_c1.  

lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_14l__width_13 mx_tag_c0     (
	.din0	(tld_tag_c0[12:0]),
	.din1	(dcs_context1_e[12:0]),
	.din2	(dcs_context0_e[12:0]),
	.sel0	(tlc_sel_tte_tag),
	.sel1	(tlc_sel_demap_tag_c1),
	.dout	(tag_c0[12:0])
);
lsu_tgd_dp_buff_macro__stack_14l__width_13 buf_tag_c0  (
	.din	(tag_c0[12:0]),
	.dout	(tgd_tag_c0[12:0])
);

lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_14r__width_13 mx_tag_c1     (
	.din0	(tld_tag_c1[12:0]),
	.din1	(dcs_context0_e[12:0]),
	.din2	(dcs_context1_e[12:0]),
	.sel0	(tlc_sel_tte_tag),
	.sel1	(tlc_sel_demap_tag_c0),
	.dout	(tag_c1[12:0])
);
lsu_tgd_dp_buff_macro__stack_14r__width_13 buf_tag_c1  (
	.din	(tag_c1[12:0]),
	.dout	(tgd_tag_c1[12:0])
);

//////
// Data access read format (sun4v TTE) is
// V    NFO   PRTY     0       0       PA    IE    E   CP   0   P   0   W    0    SZ
// 63 |  62 |  61  | 60:56 | 55:40 | 39:13 | 12 | 11 | 10 | 9 | 8 | 7 | 6 | 5:3 | 2:0
//
// Tag read register format is
//  PID    R    P    U      0      VA    Context
// 63:61 | 60 | 59 | 58 | 57:48 | 47:13 | 12:0


// Mux the different ASI read sources that are on the right side of the LSU
lsu_tgd_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 mx_asi_b      (
	.din0	({32'd0,tgd_diag_tag_b[31:0]}),
	.din1	({tlb_tte_tag[`TAG_V],					// V
		  tlb_tte_data[`DATA_NFO],				// NFO
		  tlb_tte_data[`DATA_PARITY],				// PARITY
		  5'b0,							// SOFT
		  16'b0,
		  tlb_tte_data[`DATA_PA_39_28_HI:`DATA_PA_39_28_LO],	// PA
		  tlb_tte_data[`DATA_PA_27_22_HI:`DATA_PA_27_22_LO],
		  tlb_tte_data[`DATA_PA_21_16_HI:`DATA_PA_21_16_LO],
		  tlb_tte_data[`DATA_PA_15_13_HI:`DATA_PA_15_13_LO],
		  tlb_tte_data[`DATA_IE],				// IE
		  tlb_tte_data[`DATA_E],				// E
		  tlb_tte_data[`DATA_CP],				// CP
		  1'b0,							// CV
		  tlb_tte_data[`DATA_P],				// P
		  1'b0,							// EP
		  tlb_tte_data[`DATA_W],				// W
		  3'b0,
		  tlb_tte_data[`DATA_VA_27_22_V],			// SZ
		  tte_data_sz_1,tlb_tte_data[`DATA_VA_15_13_V]		// SZ
		}),
	.din2	({tlb_tte_tag[`TAG_PID_HI:`TAG_PID_LO],			// PID
		  tlb_tte_tag[`TAG_REAL],				// REAL
		  tlb_tte_data[`TAG_PARITY],				// PARITY
		  tlb_tte_u_bit,					// USED
		  10'b0,
		  tlb_tte_tag[`TAG_VA_47_28_HI:`TAG_VA_27_22_LO],
		  tlb_tte_tag[`TAG_VA_21_16_HI:`TAG_VA_21_16_LO],
		  tlb_tte_tag[`TAG_VA_15_13_HI:`TAG_VA_15_13_LO],
		  tlb_tte_tag[`TAG_CNTX0_HI:`TAG_CNTX0_LO]		// context
		}),
	.din3	({tlb_tte_tag[`TAG_PID_HI:`TAG_PID_LO],			// PID
		  tlb_tte_tag[`TAG_REAL],				// REAL
		  tlb_tte_data[`TAG_PARITY],				// PARITY
		  tlb_tte_u_bit,					// USED
		  10'b0,
		  tlb_tte_tag[`TAG_VA_47_28_HI:`TAG_VA_27_22_LO],
		  tlb_tte_tag[`TAG_VA_21_16_HI:`TAG_VA_21_16_LO],
		  tlb_tte_tag[`TAG_VA_15_13_HI:`TAG_VA_15_13_LO],
		  tlb_tte_tag[`TAG_CNTX1_HI:`TAG_CNTX1_LO]		// context
		}),
	.sel0	(dcc_rd_dt_diag_b),
	.sel1	(dcc_tlb_data_read_b),
	.sel2	(dcc_tlb_tag0_read_b),
	.sel3	(dcc_tlb_tag1_read_b),
	.dout	(ldxa_asi_data_b[63:0])
);

lsu_tgd_dp_buff_macro__rep_1__stack_64c__width_64 buf_asi_b    (
	.din	(ldxa_asi_data_b[63:0]),
	.dout	(tgd_ldxa_asi_data_b[63:0])
);

lsu_tgd_dp_buff_macro__left_19__minbuff_1__stack_64c__width_45 va_minbuf     (
	.din	(lsu_va_m[47:3]),
	.dout	(va_m_buf[47:3])
);

// VA staging
lsu_tgd_dp_msff_macro__left_13__stack_64c__width_51 dff_va_b    (
	.scan_in(dff_va_b_scanin),
	.scan_out(dff_va_b_scanout),
	.din	({va_m_buf[47:3],
		  tld_prty_256m  ,tld_prty_4m  ,tld_prty_64k  ,tld_prty_8k  ,tld_prty_ctxt0  ,tld_prty_ctxt1}),
	.dout	({va_b[47:3],
		  tgd_prty_256m_b,tgd_prty_4m_b,tgd_prty_64k_b,tgd_prty_8k_b,tgd_prty_ctxt0_b,tgd_prty_ctxt1_b}),
	.en	(dcc_ldst_m_clken),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

///////////////////////////////////////////////////////////////
// Watchpoint mux and compare is here so it's close to the TLB

lsu_tgd_dp_msff_macro__left_19__stack_64c__width_45 dff_wpt_b    (
	.scan_in(dff_wpt_b_scanin),
	.scan_out(dff_wpt_b_scanout),
	.din	(dcs_watchpoint_m[47:3]),
	.dout	(watchpoint_b[47:3]),
	.en	(dcc_ldst_m_clken),
  .clk(clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_tgd_dp_cmp_macro__width_32 cmp_va_47_16  (
	.din0	(watchpoint_b[47:16]),
	.din1	(va_b[47:16]),
	.dout	(va_wp_47_16)
);
lsu_tgd_dp_cmp_macro__width_16 cmp_va_15_3  (
	.din0	({3'b0,watchpoint_b[15:3]}),
	.din1	({3'b0,va_b[15:3]}),
	.dout	(va_wp_15_3)
);

lsu_tgd_dp_cmp_macro__width_32 cmp_pa_39_16  (
	.din0	({8'b0,watchpoint_b[39:16]}),
	.din1	({8'b0,tlb_pgnum[39:16]}),
	.dout	(pa_wp_39_16)
);
lsu_tgd_dp_cmp_macro__width_16 cmp_pa_15_3  (
	.din0	({3'b0,watchpoint_b[15:3]}),
	.din1	({3'b0,tlb_pgnum[15:13],va_b[12:3]}),
	.dout	(pa_wp_15_3)
);

lsu_tgd_dp_buff_macro__width_4 wpt_buf  (
	.din	({    va_wp_47_16,    pa_wp_39_16,    va_wp_15_3,    pa_wp_15_3}),
	.dout	({tgd_va_wp_47_16,tgd_pa_wp_39_16,tgd_va_wp_15_3,tgd_pa_wp_15_3})
);

lsu_tgd_dp_buff_macro__rep_1__width_10 tte_buf  (
	.din	({tlb_tte_data[`TAG_PARITY],tlb_tte_data[`DATA_VA_27_22_V],
		  tlb_tte_data[`DATA_VA_21_16_V],tlb_tte_data[`DATA_VA_15_13_V],
		  tlb_tte_data[`DATA_NFO:`DATA_W]}),
	.dout	({tlb_tag_parity, tlb_pgsize[2:0],tlb_tte_nfo_b,tlb_tte_ie_b,
		  tlb_tte_cp_b,tlb_tte_ebit_b,tlb_tte_pbit_b,tlb_tte_wbit_b})
);

// BIST mux and tag comparator
lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_64c__width_64 bist_mx    (
	.din0	({{4{bist_cmp_data[7:0]}},bist_cmp_data[7:6],tgd_diag_tag_b[31:2]}),
	.din1	({bist_cmp_data[7:1],tlb_tte_u_bit,bist_cmp_data[7:5],tlb_tte_tag[52:50],
		  bist_cmp_data[1],tlb_tte_tag[48:0]}),
	.din2	({tlb_tte_tag[65:53],bist_cmp_data[2:0],bist_cmp_data[7:0],
		  bist_cmp_data[7:6],tlb_tte_data[37:0]}),	
	.sel0	(bist_dta_cmp_en),
	.sel1	(bist_cmpsel_2),
	.dout	(bist_mux_data[63:0])
);

lsu_tgd_dp_cmp_macro__width_64 bist_cmp  (
	.din0	({8{bist_cmp_data[7:0]}}),
	.din1	(bist_mux_data[63:0]),
	.dout	(tgd_bist_compare)
);

lsu_tgd_dp_cmp_macro__width_8 cambist_cmp  (
	.din0	({1'b0,bist_cmp_data[6:0]}),
	.din1	({1'b0,tlb_tte_data[6:0]}),
	.dout	(lsu_mbi_tlb_data_cmp)
);

lsu_tgd_dp_buff_macro__width_5 cambist_buf  (
	.din	({tlb_cam_hit,        tlb_context0_hit,     tlb_cam_mhit,
		  tlb_tte_u_bit,      tlb_tte_tag[`TAG_V]}),
	.dout	({lsu_mbi_tlb_cam_hit,lsu_mbi_tlb_ctxt0_hit,lsu_mbi_tlb_cam_mhit,
		  lsu_mbi_tlb_used,   lsu_mbi_tlb_valid})
);

// fixscan start:
assign dff_16b_prty_w01_scanin   = scan_in                  ;
assign dff_16b_prty_w23_scanin   = dff_16b_prty_w01_scanout ;
assign dff_diag_tag_scanin       = dff_16b_prty_w23_scanout ;
assign dff_va_b_scanin           = dff_diag_tag_scanout     ;
assign dff_wpt_b_scanin          = dff_va_b_scanout         ;
assign scan_out                  = dff_wpt_b_scanout        ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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
//   parity macro (even parity)
//
//





module lsu_tgd_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module lsu_tgd_dp_msff_macro__width_4 (
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
//   xor macro for ports = 2,3
//
//





module lsu_tgd_dp_xor_macro__width_4 (
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
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tgd_dp_mux_macro__mux_pgpe__ports_2__stack_32c__width_32 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0_unused;
wire psel1;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;
  output [31:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d0_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_tgd_dp_msff_macro__mux_pgpe__ports_2__stack_32l__width_32 (
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
wire psel0_unused;
wire psel1;
wire [31:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [30:0] so;

  input [31:0] din0;
  input [31:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [31:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0_unused),
 .psel1(psel1)
);

mux2e #(32)  d1_0 (
  .sel(psel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(muxout[31:0])
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
dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__left_2__rep_1__stack_32c__width_29 (
  din, 
  dout);
  input [28:0] din;
  output [28:0] dout;






buff #(29)  d0_0 (
.in(din[28:0]),
.out(dout[28:0])
);








endmodule





//
//   invert macro
//
//





module lsu_tgd_dp_inv_macro__width_1 (
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





module lsu_tgd_dp_and_macro__ports_2__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_14l__width_13 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [12:0] din0;
  input [12:0] din1;
  input [12:0] din2;
  input sel0;
  input sel1;
  output [12:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(13)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
.dout(dout[12:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__stack_14l__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_14r__width_13 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [12:0] din0;
  input [12:0] din1;
  input [12:0] din2;
  input sel0;
  input sel1;
  output [12:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(13)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[12:0]),
  .in1(din1[12:0]),
  .in2(din2[12:0]),
.dout(dout[12:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__stack_14r__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tgd_dp_mux_macro__mux_aonpe__ports_4__stack_64c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  output [63:0] dout;





cl_dp1_muxbuff4_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__rep_1__stack_64c__width_64 (
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





module lsu_tgd_dp_buff_macro__left_19__minbuff_1__stack_64c__width_45 (
  din, 
  dout);
  input [44:0] din;
  output [44:0] dout;






buff #(45)  d0_0 (
.in(din[44:0]),
.out(dout[44:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_tgd_dp_msff_macro__left_13__stack_64c__width_51 (
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
wire [49:0] so;

  input [50:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [50:0] dout;


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
dff #(51)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[50:0]),
.si({scan_in,so[49:0]}),
.so({so[49:0],scan_out}),
.q(dout[50:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module lsu_tgd_dp_msff_macro__left_19__stack_64c__width_45 (
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
wire [43:0] so;

  input [44:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [44:0] dout;


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
dff #(45)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[44:0]),
.si({scan_in,so[43:0]}),
.so({so[43:0],scan_out}),
.q(dout[44:0])
);




















endmodule









//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_tgd_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_tgd_dp_cmp_macro__width_16 (
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
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__rep_1__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






buff #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_tgd_dp_mux_macro__mux_aope__ports_3__stack_64c__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;
  output [63:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_tgd_dp_cmp_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_tgd_dp_cmp_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module lsu_tgd_dp_buff_macro__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule




