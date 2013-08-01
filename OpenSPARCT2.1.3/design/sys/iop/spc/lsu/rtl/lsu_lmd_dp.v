// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_lmd_dp.v
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
module lsu_lmd_dp (
  lmc_lmq_enable_b, 
  lmc_lmq_bypass_en, 
  lmc_pcx_sel_p4, 
  lmc_byp_sel_e, 
  lmc_thrd_byp_sel_m, 
  lmc_lmq0_byp_sel, 
  lmc_lmq1_byp_sel, 
  lmc_lmq2_byp_sel, 
  lmc_lmq3_byp_sel, 
  lmc_lmq4_byp_sel, 
  lmc_lmq5_byp_sel, 
  lmc_lmq6_byp_sel, 
  lmc_lmq7_byp_sel, 
  lmc_bld_addr54, 
  lmc_bld_req, 
  lmc_bld_req_, 
  lmc_lmd_ncache_b, 
  lmc_rd_update, 
  lmc_ld_unfilled, 
  lmc_bist_or_diag_e, 
  lmc_byp_data_hi, 
  lmc_byp_data_enable, 
  dcc_ld_miss_ctl, 
  dcc_perr_enc_b, 
  dcc_l2fill_vld_m, 
  dcc_cache_diag_wr_b, 
  stb_ram_data, 
  ard_pid_data, 
  stb_st_addr_b, 
  sbd_st_addr_b, 
  sbd_st_data_b, 
  stb_ldxa_asi_data_w, 
  lsu_va_b, 
  lsu_va_w, 
  cid_fill_data_e, 
  cid_st_data_sel, 
  cid_tid, 
  lsu_cpx_cpkt, 
  dcs_ldxa_asi_data_w, 
  cic_diag_data_sel_e, 
  mbi_wdata, 
  lmc_mbi_run, 
  lmd_addrb2, 
  lmd_asi_ld, 
  lmd_asi_indet, 
  lmd_sec_cmp_b, 
  lmd_ld_addr_m, 
  lmd_fill_sz_b0_e, 
  lmd_bendian_m, 
  lmd_sxt_fsr_m, 
  lmd_fill_way_e, 
  lmd_fill_way_m, 
  lmd_sz_m, 
  lmd_fpld_m, 
  lmd_rd_e, 
  lmd_rd_m, 
  lmd_fpodd32b_m, 
  lmd_fp32b_m, 
  lmd_bypass_data_m, 
  lmd_fill_data_e, 
  lmd_fill_or_byp_data_m, 
  lmd_misc_msb_m, 
  lmd_fill_addr_e, 
  lmd_fill_addr_m, 
  lmd_wrtag_parity_e, 
  lmd_pcx_rqtyp, 
  lmd_pcx_nc, 
  lmd_pcx_pref, 
  lmd_pcx_rway, 
  lmd_pcx_addr, 
  lmd_asi_rngf, 
  lmd_asi_type, 
  lmd_asi_asi, 
  lmd_sz_b1, 
  lmd_sz_b0, 
  lmd_ldbl, 
  lmd_dc_err_e, 
  lsu_ifu_ld_index, 
  lsu_ext_int_type, 
  lsu_ext_int_vec, 
  lsu_ext_int_tid, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [39:0] ld_addr_b;
wire [12:11] lsu_va_b_unused;
wire wrtag_parity_b;
wire [63:0] ld_miss_pkt;
wire ctl_unused;
wire [63:0] lmq7_pkt;
wire [63:0] lmq6_pkt;
wire [63:0] lmq5_pkt;
wire [63:0] lmq4_pkt;
wire [63:0] lmq3_pkt;
wire [63:0] lmq2_pkt;
wire [63:0] lmq1_pkt;
wire [63:0] lmq0_pkt;
wire [2:0] rd7_plus1;
wire [2:0] rd6_plus1;
wire [2:0] rd5_plus1;
wire [2:0] rd4_plus1;
wire [2:0] rd3_plus1;
wire [2:0] rd2_plus1;
wire [2:0] rd1_plus1;
wire [2:0] rd0_plus1;
wire [63:0] rd_update_pkt0;
wire [63:0] rd_update_pkt1;
wire [63:0] rd_update_pkt2;
wire [63:0] rd_update_pkt3;
wire [63:0] rd_update_pkt4;
wire [63:0] rd_update_pkt5;
wire [63:0] rd_update_pkt6;
wire [63:0] rd_update_pkt7;
wire dff_lmq0_scanin;
wire dff_lmq0_scanout;
wire dff_lmq1_scanin;
wire dff_lmq1_scanout;
wire dff_lmq2_scanin;
wire dff_lmq2_scanout;
wire dff_lmq3_scanin;
wire dff_lmq3_scanout;
wire dff_lmq4_scanin;
wire dff_lmq4_scanout;
wire dff_lmq5_scanin;
wire dff_lmq5_scanout;
wire dff_lmq6_scanin;
wire dff_lmq6_scanout;
wire dff_lmq7_scanin;
wire dff_lmq7_scanout;
wire [10:5] ifu_ld_index;
wire [39:4] cmp_addr;
wire [7:0] sec_cmp_lo;
wire [7:0] sec_cmp_hi;
wire pcx_pkt_b55;
wire [49:0] pcx_pkt;
wire [5:4] pcx_addr;
wire [49:0] lmd_pcx_pkt;
wire lmd_fpodd32b_e;
wire lmd_fp32b_e;
wire lmd_fpld_e;
wire lmd_sxt_fsr_e;
wire lmd_bendian_e;
wire [4:0] rd_e;
wire [1:0] lmd_sz_e;
wire [2:0] ld_addr_e;
wire [44:0] lmq0_or_diag;
wire [44:0] lmd_muxdata_e;
wire [30:2] diag_data_w_buf;
wire [39:11] diag_addr_e;
wire wrtag_parity_w;
wire dff_lmq_data_m_scanin;
wire dff_lmq_data_m_scanout;
wire [63:0] st_data_b;
wire [63:0] stb_ram_data_buf;
wire [63:0] stb_ldxa_asi_data_w_buf;
wire [63:0] ard_pid_data_buf;
wire [63:0] dcs_ldxa_asi_data_w_buf;
wire dff_ldbyp0_scanin;
wire dff_ldbyp0_scanout;
wire [63:0] lmq0_bypass_data;
wire dff_ldbyp1_scanin;
wire dff_ldbyp1_scanout;
wire [63:0] lmq1_bypass_data;
wire dff_ldbyp2_scanin;
wire dff_ldbyp2_scanout;
wire [63:0] lmq2_bypass_data;
wire dff_ldbyp3_scanin;
wire dff_ldbyp3_scanout;
wire [63:0] lmq3_bypass_data;
wire dff_ldbyp4_scanin;
wire dff_ldbyp4_scanout;
wire [63:0] lmq4_bypass_data;
wire dff_ldbyp5_scanin;
wire dff_ldbyp5_scanout;
wire [63:0] lmq5_bypass_data;
wire dff_ldbyp6_scanin;
wire dff_ldbyp6_scanout;
wire [63:0] lmq6_bypass_data;
wire dff_ldbyp7_scanin;
wire dff_ldbyp7_scanout;
wire [63:0] lmq7_bypass_data;
wire [63:0] bypass_data_m;
wire dff_st_data_w_scanin;
wire dff_st_data_w_scanout;
wire [63:0] diag_data_w;
wire [127:0] fill_data_e;
wire byp_half_sel_scanin;
wire byp_half_sel_scanout;
wire [63:0] fill_data_m;


input	[7:0]	lmc_lmq_enable_b;	// Load enables for LMQ flops (threaded)
input	[7:0]	lmc_lmq_bypass_en;	// Load enables for LMQ bypass registers
input	[7:0]	lmc_pcx_sel_p4;		// Mux the selected thread 
input	[7:0]	lmc_byp_sel_e;		// Thread select for fill/bypass
input	[7:0]	lmc_thrd_byp_sel_m;	// Thread select for bypass register
input	[4:0]	lmc_lmq0_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq1_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq2_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq3_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq4_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq5_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq6_byp_sel;	// source selects for load bypass registers
input	[4:0]	lmc_lmq7_byp_sel;	// source selects for load bypass registers
input	[1:0]	lmc_bld_addr54;		// Block load address modifier
input		lmc_bld_req;		// Current request is for block load
input		lmc_bld_req_;
input		lmc_lmd_ncache_b;
input	[7:0]	lmc_rd_update;
input	[7:0]	lmc_ld_unfilled;
input		lmc_bist_or_diag_e;
input		lmc_byp_data_hi;
input		lmc_byp_data_enable;

input	[60:40]	dcc_ld_miss_ctl;	// Load miss packet info
input	[1:0]	dcc_perr_enc_b;		// D$ parity error encoding
input		dcc_l2fill_vld_m;
input		dcc_cache_diag_wr_b;

input	[63:0]	stb_ram_data;		// stb data for RAW bypass
input	[63:0]	ard_pid_data;		// asi load data
input	[39:13]	stb_st_addr_b;		// should be equal to tlb_pgnum for normal loads
input	[12:11]	sbd_st_addr_b;
input	[63:0]	sbd_st_data_b;		// for CAS
input	[63:0]	stb_ldxa_asi_data_w;
input	[12:0]	lsu_va_b;
input	[12:3]	lsu_va_w;

input	[127:0]	cid_fill_data_e;	// cpx fill data
input		cid_st_data_sel;
input	[2:0]	cid_tid;
input	[8:6]	lsu_cpx_cpkt;

input	[63:0]	dcs_ldxa_asi_data_w;

input		cic_diag_data_sel_e;

input	[7:0]	mbi_wdata;
input		lmc_mbi_run;

output		lmd_addrb2;
output	[7:0]	lmd_asi_ld;		// ASI type flag for each thread
output	[7:0]	lmd_asi_indet;		// ASI type flag for each thread
output	[7:0]	lmd_sec_cmp_b;		// Secondary load indicators

// Data for fills and bypass
output	[2:0]	lmd_ld_addr_m;
output		lmd_fill_sz_b0_e;
output		lmd_bendian_m;		// Endian bit for load misses
output		lmd_sxt_fsr_m;		// Sign extend / LDFSR for load misses
output	[1:0]	lmd_fill_way_e;		// Replacement way for fill data write
output	[1:0]	lmd_fill_way_m;		// Replacement way for fill data write
output	[1:0]	lmd_sz_m;		// Size bits from LMQ
output		lmd_fpld_m;		// Load was floating point
output	[2:1]	lmd_rd_e;		// Dest. register address
output	[4:0]	lmd_rd_m;		// Dest. register address
output		lmd_fpodd32b_m;
output		lmd_fp32b_m;
output	[63:0]	lmd_bypass_data_m;
output	[127:0]	lmd_fill_data_e;
output	[63:0]	lmd_fill_or_byp_data_m;
output	[7:0]	lmd_misc_msb_m;
output	[39:3]	lmd_fill_addr_e;
output	[10:4]	lmd_fill_addr_m;
output		lmd_wrtag_parity_e;

output	[2:0]	lmd_pcx_rqtyp;
output		lmd_pcx_nc;
output		lmd_pcx_pref;
output	[1:0]	lmd_pcx_rway;
output	[39:0]	lmd_pcx_addr;
output		lmd_asi_rngf;
output	[1:0]	lmd_asi_type;
output	[7:0]	lmd_asi_asi;
output		lmd_sz_b1;
output		lmd_sz_b0;
output		lmd_ldbl;
output	[1:0]	lmd_dc_err_e;

output	[10:5]	lsu_ifu_ld_index;
output	[1:0]	lsu_ext_int_type;
output	[5:0]	lsu_ext_int_vec;
output	[2:0]	lsu_ext_int_tid;

// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign stop = 1'b0;
// end scan

lsu_lmd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

`define LMQ_TPAR        61
`define LMQ_ASI 	60
`define LMQ_FPODD32 	59
`define LMQ_FP32 	58
`define LMQ_FPLD 	57
`define LMQ_SIGNEXT 	56
`define LMQ_BIGEND 	55
`define LMQ_RD_HI       54
`define LMQ_RD_LO       50
`define LMQ_LDD         49
`define LMQ_SZ_HI       48
`define LMQ_SZ_LO       47
`define LMQ_RQ_HI       46
`define LMQ_RQ_LO       44
`define LMQ_NC  	43
`define LMQ_PREF 	42
`define LMQ_WY_HI       41
`define LMQ_WY_LO       40
`define LMQ_AD_HI       39
`define LMQ_AD_LO       0
`define LMQ_ASI_IND	56
`define LMQ_ASI_TYPE	48
`define LMQ_ASI_HI	47
`define LMQ_ASI_LO	40

////////////////////////////////////////////////////////////////////////////////
// Format of the load miss buffer
//
// MEM format
//
// 63:62 - parity error info
// 61    - wrtag_parity
// 60    - ASI			- (==0 for memory access)
// 59    - fpodd32		- 32 bit fp load to odd Rd
// 58    - fp32			- 32 bit fp load
// 57    - fp_ld		- load is floating point
// 56    - sign_ext/fsr		- data requires sign extension or is LDFSR
// 55    - bendian		- big endian access
// 54:50 - rd[4:0]		- destination register
// 49	 - ldst_dbl		- instruction is LDD (requires two returns)
// 48:47 - sz[1:0]		- size
// 46:44 - rqtyp[2:0]		- request type
// 43    - nc			- non-cacheable load
// 42    - prefetch		- prefetch instruction
// 41:40 - way[1:0]		- replacement way
// 39:13 - pgnum[39:13]		- translated addr.
// 12:0  - va[12:0]		-
//
// ASI format
//
// 63:62 - unused
// 61    - unused
// 60    - ASI			- (==1 for ASI access)
// 59:57 - unused
// 56    - indeterminate flag
// 55    - fast/local ring	- 1=fast
// 54:50 - rd[4:0]
// 49:48 - ASI type (00-ASI,01-ASR,10-PR,11-HPR)
// 47:40 - ASI
// 39:0  - address

lsu_lmd_dp_buff_macro__rep_1__stack_64c__width_40 ld_addr_buf   (
	.din	({stb_st_addr_b[39:13],sbd_st_addr_b[12:11],lsu_va_b[10:0]}),
	.dout	(ld_addr_b[39:0])
);

// Leave lsu_va_b[12:11] at this level because verfication bench needs it.
assign lsu_va_b_unused[12:11] = lsu_va_b[12:11];

////////////////////////////////////////////////////////////////////////////////
// LMQ flops.  One for each thread.
////////////////////////////////////////////////////////////////////////////////

// Miss packet construction

lsu_lmd_dp_buff_macro__dbuff_32x__rep_1__stack_24c__width_24 miss_pkt_buf    (
	.din	({dcc_perr_enc_b[1:0],wrtag_parity_b,dcc_ld_miss_ctl[60:44],lmc_lmd_ncache_b,dcc_ld_miss_ctl[42:40]}),
	.dout	(ld_miss_pkt[63:40])
);
assign ctl_unused=dcc_ld_miss_ctl[43];

assign ld_miss_pkt[39:0] = ld_addr_b[39:0];

lsu_lmd_dp_prty_macro__width_32 wrtag_prty  (
	.din	({ld_miss_pkt[39:32],3'b000,ld_miss_pkt[31:11]}),
	.dout	(wrtag_parity_b)
);

// Library incrementer is too big and is more than I need.  Build a simple one for each thread.

lsu_lmd_dp_inv_macro__width_8 rd_incr0  (
	.din	({lmq7_pkt[`LMQ_RD_LO],lmq6_pkt[`LMQ_RD_LO],lmq5_pkt[`LMQ_RD_LO],lmq4_pkt[`LMQ_RD_LO],
		  lmq3_pkt[`LMQ_RD_LO],lmq2_pkt[`LMQ_RD_LO],lmq1_pkt[`LMQ_RD_LO],lmq0_pkt[`LMQ_RD_LO]}),
	.dout	({rd7_plus1[0],rd6_plus1[0],rd5_plus1[0],rd4_plus1[0],rd3_plus1[0],rd2_plus1[0],rd1_plus1[0],rd0_plus1[0]})
);

lsu_lmd_dp_xor_macro__ports_2__width_8 rd_incr1   (
	.din0	({lmq7_pkt[`LMQ_RD_LO],lmq6_pkt[`LMQ_RD_LO],lmq5_pkt[`LMQ_RD_LO],lmq4_pkt[`LMQ_RD_LO],
		  lmq3_pkt[`LMQ_RD_LO],lmq2_pkt[`LMQ_RD_LO],lmq1_pkt[`LMQ_RD_LO],lmq0_pkt[`LMQ_RD_LO]}),
	.din1	({lmq7_pkt[`LMQ_RD_LO + 1],lmq6_pkt[`LMQ_RD_LO + 1],lmq5_pkt[`LMQ_RD_LO + 1],lmq4_pkt[`LMQ_RD_LO + 1],
		  lmq3_pkt[`LMQ_RD_LO + 1],lmq2_pkt[`LMQ_RD_LO + 1],lmq1_pkt[`LMQ_RD_LO + 1],lmq0_pkt[`LMQ_RD_LO + 1]}),
	.dout	({rd7_plus1[1],rd6_plus1[1],rd5_plus1[1],rd4_plus1[1],rd3_plus1[1],rd2_plus1[1],rd1_plus1[1],rd0_plus1[1]})
);



lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_0     (
	.din0	(lmq0_pkt[`LMQ_RD_LO]),
	.sel0	(lmq0_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq0_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd0_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_1     (
	.din0	(lmq1_pkt[`LMQ_RD_LO]),
	.sel0	(lmq1_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq1_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd1_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_2     (
	.din0	(lmq2_pkt[`LMQ_RD_LO]),
	.sel0	(lmq2_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq2_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd2_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_3     (
	.din0	(lmq3_pkt[`LMQ_RD_LO]),
	.sel0	(lmq3_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq3_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd3_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_4     (
	.din0	(lmq4_pkt[`LMQ_RD_LO]),
	.sel0	(lmq4_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq4_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd4_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_5     (
	.din0	(lmq5_pkt[`LMQ_RD_LO]),
	.sel0	(lmq5_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq5_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd5_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_6     (
	.din0	(lmq6_pkt[`LMQ_RD_LO]),
	.sel0	(lmq6_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq6_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd6_plus1[2])
);

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 rd_incr2_7     (
	.din0	(lmq7_pkt[`LMQ_RD_LO]),
	.sel0	(lmq7_pkt[`LMQ_RD_LO + 1]),
	.din1	(lmq7_pkt[`LMQ_RD_LO + 2]),
	.sel1	(1'b1),
	.dout	(rd7_plus1[2])
);



assign rd_update_pkt0[63:0] = {lmq0_pkt[63:53],rd0_plus1[2:0],lmq0_pkt[49:0]};
assign rd_update_pkt1[63:0] = {lmq1_pkt[63:53],rd1_plus1[2:0],lmq1_pkt[49:0]};
assign rd_update_pkt2[63:0] = {lmq2_pkt[63:53],rd2_plus1[2:0],lmq2_pkt[49:0]};
assign rd_update_pkt3[63:0] = {lmq3_pkt[63:53],rd3_plus1[2:0],lmq3_pkt[49:0]};
assign rd_update_pkt4[63:0] = {lmq4_pkt[63:53],rd4_plus1[2:0],lmq4_pkt[49:0]};
assign rd_update_pkt5[63:0] = {lmq5_pkt[63:53],rd5_plus1[2:0],lmq5_pkt[49:0]};
assign rd_update_pkt6[63:0] = {lmq6_pkt[63:53],rd6_plus1[2:0],lmq6_pkt[49:0]};
assign rd_update_pkt7[63:0] = {lmq7_pkt[63:53],rd7_plus1[2:0],lmq7_pkt[49:0]};

lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq0      (
	.scan_in(dff_lmq0_scanin),
	.scan_out(dff_lmq0_scanout),
	.din0	(rd_update_pkt0[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[0]),
	.dout	(lmq0_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq1      (
	.scan_in(dff_lmq1_scanin),
	.scan_out(dff_lmq1_scanout),
	.din0	(rd_update_pkt1[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[1]),
	.dout	(lmq1_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq2      (
	.scan_in(dff_lmq2_scanin),
	.scan_out(dff_lmq2_scanout),
	.din0	(rd_update_pkt2[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[2]),
	.dout	(lmq2_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq3      (
	.scan_in(dff_lmq3_scanin),
	.scan_out(dff_lmq3_scanout),
	.din0	(rd_update_pkt3[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[3]),
	.dout	(lmq3_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq4      (
	.scan_in(dff_lmq4_scanin),
	.scan_out(dff_lmq4_scanout),
	.din0	(rd_update_pkt4[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[4]),
	.dout	(lmq4_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[4]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq5      (
	.scan_in(dff_lmq5_scanin),
	.scan_out(dff_lmq5_scanout),
	.din0	(rd_update_pkt5[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[5]),
	.dout	(lmq5_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[5]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq6      (
	.scan_in(dff_lmq6_scanin),
	.scan_out(dff_lmq6_scanout),
	.din0	(rd_update_pkt6[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[6]),
	.dout	(lmq6_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[6]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 dff_lmq7      (
	.scan_in(dff_lmq7_scanin),
	.scan_out(dff_lmq7_scanout),
	.din0	(rd_update_pkt7[63:0]),
	.din1   (ld_miss_pkt[63:0]),
	.sel0	(lmc_rd_update[7]),
	.dout	(lmq7_pkt[63:0]),
	.clk    (l2clk),
	.en	(lmc_lmq_enable_b[7]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Export ASI flags to LMQ control
lsu_lmd_dp_buff_macro__width_8 asi_ld_buf  (
	.din	({lmq7_pkt[`LMQ_ASI],lmq6_pkt[`LMQ_ASI],lmq5_pkt[`LMQ_ASI],lmq4_pkt[`LMQ_ASI],
		  lmq3_pkt[`LMQ_ASI],lmq2_pkt[`LMQ_ASI],lmq1_pkt[`LMQ_ASI],lmq0_pkt[`LMQ_ASI]}),
	.dout	(lmd_asi_ld[7:0])
);

// Export ASI indeterminate flags to LMQ control
lsu_lmd_dp_buff_macro__width_8 asi_indet_buf  (
	.din	({lmq7_pkt[`LMQ_ASI_IND],lmq6_pkt[`LMQ_ASI_IND],lmq5_pkt[`LMQ_ASI_IND],lmq4_pkt[`LMQ_ASI_IND],
		  lmq3_pkt[`LMQ_ASI_IND],lmq2_pkt[`LMQ_ASI_IND],lmq1_pkt[`LMQ_ASI_IND],lmq0_pkt[`LMQ_ASI_IND]}),
	.dout	(lmd_asi_indet[7:0])
);

// Mux out the index of the load miss address for I$ to use for xinval
lsu_lmd_dp_mux_macro__mux_aodec__ports_8__stack_6l__width_6 xinval_indx_mx     (
	.din0	(lmq0_pkt[10:5]),
	.din1	(lmq1_pkt[10:5]),
	.din2	(lmq2_pkt[10:5]),
	.din3	(lmq3_pkt[10:5]),
	.din4	(lmq4_pkt[10:5]),
	.din5	(lmq5_pkt[10:5]),
	.din6	(lmq6_pkt[10:5]),
	.din7	(lmq7_pkt[10:5]),
	.sel	(lsu_cpx_cpkt[8:6]),
	.dout	(ifu_ld_index[10:5])
);
lsu_lmd_dp_buff_macro__stack_6l__width_6 xinval_indx_buf   (
	.din	(ifu_ld_index[10:5]),
	.dout	(lsu_ifu_ld_index[10:5])
);

////////////////////////////////////////////////////////////////////////////////
// Secondary miss comparators
////////////////////////////////////////////////////////////////////////////////

assign cmp_addr[39:4] = ld_addr_b[39:4];

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_0  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq0_pkt[31:4]}),
	.dout	(sec_cmp_lo[0])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_0  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq0_pkt[39:32]),
	.dout	(sec_cmp_hi[0])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_0   (
	.din0	(sec_cmp_lo[0]),
	.din1	(sec_cmp_hi[0]),
	.din2	(lmc_ld_unfilled[0]),
	.dout	(lmd_sec_cmp_b[0])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_1  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq1_pkt[31:4]}),
	.dout	(sec_cmp_lo[1])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_1  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq1_pkt[39:32]),
	.dout	(sec_cmp_hi[1])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_1   (
	.din0	(sec_cmp_lo[1]),
	.din1	(sec_cmp_hi[1]),
	.din2	(lmc_ld_unfilled[1]),
	.dout	(lmd_sec_cmp_b[1])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_2  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq2_pkt[31:4]}),
	.dout	(sec_cmp_lo[2])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_2  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq2_pkt[39:32]),
	.dout	(sec_cmp_hi[2])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_2   (
	.din0	(sec_cmp_lo[2]),
	.din1	(sec_cmp_hi[2]),
	.din2	(lmc_ld_unfilled[2]),
	.dout	(lmd_sec_cmp_b[2])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_3  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq3_pkt[31:4]}),
	.dout	(sec_cmp_lo[3])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_3  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq3_pkt[39:32]),
	.dout	(sec_cmp_hi[3])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_3   (
	.din0	(sec_cmp_lo[3]),
	.din1	(sec_cmp_hi[3]),
	.din2	(lmc_ld_unfilled[3]),
	.dout	(lmd_sec_cmp_b[3])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_4  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq4_pkt[31:4]}),
	.dout	(sec_cmp_lo[4])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_4  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq4_pkt[39:32]),
	.dout	(sec_cmp_hi[4])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_4   (
	.din0	(sec_cmp_lo[4]),
	.din1	(sec_cmp_hi[4]),
	.din2	(lmc_ld_unfilled[4]),
	.dout	(lmd_sec_cmp_b[4])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_5  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq5_pkt[31:4]}),
	.dout	(sec_cmp_lo[5])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_5  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq5_pkt[39:32]),
	.dout	(sec_cmp_hi[5])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_5   (
	.din0	(sec_cmp_lo[5]),
	.din1	(sec_cmp_hi[5]),
	.din2	(lmc_ld_unfilled[5]),
	.dout	(lmd_sec_cmp_b[5])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_6  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq6_pkt[31:4]}),
	.dout	(sec_cmp_lo[6])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_6  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq6_pkt[39:32]),
	.dout	(sec_cmp_hi[6])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_6   (
	.din0	(sec_cmp_lo[6]),
	.din1	(sec_cmp_hi[6]),
	.din2	(lmc_ld_unfilled[6]),
	.dout	(lmd_sec_cmp_b[6])
);

lsu_lmd_dp_cmp_macro__width_32 cmp_sec_lo_7  (
	.din0	({4'b0000,cmp_addr[31:4]}),
	.din1	({4'b0000,lmq7_pkt[31:4]}),
	.dout	(sec_cmp_lo[7])
);
lsu_lmd_dp_cmp_macro__width_8 cmp_sec_hi_7  (
	.din0	(cmp_addr[39:32]),
	.din1	(lmq7_pkt[39:32]),
	.dout	(sec_cmp_hi[7])
);
lsu_lmd_dp_and_macro__ports_3__width_1 cmp_sec_cmp_7   (
	.din0	(sec_cmp_lo[7]),
	.din1	(sec_cmp_hi[7]),
	.din2	(lmc_ld_unfilled[7]),
	.dout	(lmd_sec_cmp_b[7])
);

////////////////////////////////////////////////////////////////////////////////
// Select one thread to issue to the pcx or asi interface
////////////////////////////////////////////////////////////////////////////////

lsu_lmd_dp_mux_macro__mux_aonpe__ports_8__stack_64c__width_51 lmq_pcx_mux      (
	.din0	({lmq0_pkt[55],lmq0_pkt[49:0]}),
	.din1	({lmq1_pkt[55],lmq1_pkt[49:0]}),
	.din2	({lmq2_pkt[55],lmq2_pkt[49:0]}),
	.din3	({lmq3_pkt[55],lmq3_pkt[49:0]}),
	.din4	({lmq4_pkt[55],lmq4_pkt[49:0]}),
	.din5	({lmq5_pkt[55],lmq5_pkt[49:0]}),
	.din6	({lmq6_pkt[55],lmq6_pkt[49:0]}),
	.din7	({lmq7_pkt[55],lmq7_pkt[49:0]}),
	.sel0	(lmc_pcx_sel_p4[0]),
	.sel1	(lmc_pcx_sel_p4[1]),
	.sel2	(lmc_pcx_sel_p4[2]),
	.sel3	(lmc_pcx_sel_p4[3]),
	.sel4	(lmc_pcx_sel_p4[4]),
	.sel5	(lmc_pcx_sel_p4[5]),
	.sel6	(lmc_pcx_sel_p4[6]),
	.sel7	(lmc_pcx_sel_p4[7]),
	.dout	({pcx_pkt_b55,pcx_pkt[49:6],pcx_addr[5:4],pcx_pkt[3:0]})
);

lsu_lmd_dp_buff_macro__stack_64c__width_51 lmq_pcx_buf    (
	.din	({pcx_pkt_b55,pcx_pkt[49:0]}),
	.dout	({lmd_asi_rngf,lmd_pcx_pkt[49:0]})
);

assign lmd_pcx_rqtyp[2:0] = lmd_pcx_pkt[`LMQ_RQ_HI:`LMQ_RQ_LO];		// 46:44
assign lmd_pcx_nc         = lmd_pcx_pkt[`LMQ_NC];			// 43
assign lmd_pcx_pref       = lmd_pcx_pkt[`LMQ_PREF];			// 42
assign lmd_pcx_rway[1:0]  = lmd_pcx_pkt[`LMQ_WY_HI:`LMQ_WY_LO];		// 41:40
assign lmd_pcx_addr[39:0] = lmd_pcx_pkt[`LMQ_AD_HI:`LMQ_AD_LO];		// 39:0
assign lmd_asi_type[1:0]  = lmd_pcx_pkt[`LMQ_ASI_TYPE + 1:`LMQ_ASI_TYPE];	// 49:48
assign lmd_ldbl           = lmd_pcx_pkt[`LMQ_LDD];			// 49
assign lmd_asi_asi[7:0]   = lmd_pcx_pkt[`LMQ_ASI_HI:`LMQ_ASI_LO];	// 47:40
assign lmd_sz_b1	  = lmd_pcx_pkt[`LMQ_SZ_LO + 1];		// 48
assign lmd_sz_b0	  = lmd_pcx_pkt[`LMQ_SZ_LO];			// 47


assign lmd_addrb2 = lmd_pcx_pkt[2];

lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_64c__width_2 bld_addr_mux       (
	.din0	(lmc_bld_addr54[1:0]),
	.din1	(pcx_addr[5:4]),
	.sel0	(lmc_bld_req),
	.sel1	(lmc_bld_req_),
	.dout	(pcx_pkt[5:4])
);

////////////////////////////////////////////////////////////////////////////////
// Data for fills and bypass
////////////////////////////////////////////////////////////////////////////////

lsu_lmd_dp_mux_macro__dbuff_32x__dmux_4x__mux_aonpe__ports_8__stack_64c__width_15 lmq_data_mux_e       (
	.din0	({lmq0_pkt[59:50],lmq0_pkt[48:47],lmq0_pkt[2:0]}),
	.din1	({lmq1_pkt[59:50],lmq1_pkt[48:47],lmq1_pkt[2:0]}),
	.din2	({lmq2_pkt[59:50],lmq2_pkt[48:47],lmq2_pkt[2:0]}),
	.din3	({lmq3_pkt[59:50],lmq3_pkt[48:47],lmq3_pkt[2:0]}),
	.din4	({lmq4_pkt[59:50],lmq4_pkt[48:47],lmq4_pkt[2:0]}),
	.din5	({lmq5_pkt[59:50],lmq5_pkt[48:47],lmq5_pkt[2:0]}),
	.din6	({lmq6_pkt[59:50],lmq6_pkt[48:47],lmq6_pkt[2:0]}),
	.din7	({lmq7_pkt[59:50],lmq7_pkt[48:47],lmq7_pkt[2:0]}),
	.sel0	(lmc_byp_sel_e[0]),
	.sel1	(lmc_byp_sel_e[1]),
	.sel2	(lmc_byp_sel_e[2]),
	.sel3	(lmc_byp_sel_e[3]),
	.sel4	(lmc_byp_sel_e[4]),
	.sel5	(lmc_byp_sel_e[5]),
	.sel6	(lmc_byp_sel_e[6]),
	.sel7	(lmc_byp_sel_e[7]),
	.dout	({lmd_fpodd32b_e,lmd_fp32b_e,lmd_fpld_e,lmd_sxt_fsr_e,lmd_bendian_e,
		  rd_e[4:0],lmd_sz_e[1:0],ld_addr_e[2:0]})
);

lsu_lmd_dp_mux_macro__mux_aodec__ports_8__width_45 lmq_mux_e    (
	.din0	(lmq0_or_diag[44:0]),
	.din1	({lmq1_pkt[63:62],lmq1_pkt[`LMQ_TPAR],lmq1_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq1_pkt[`LMQ_SZ_LO],lmq1_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq1_pkt[39:3]}),
	.din2	({lmq2_pkt[63:62],lmq2_pkt[`LMQ_TPAR],lmq2_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq2_pkt[`LMQ_SZ_LO],lmq2_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq2_pkt[39:3]}),
	.din3	({lmq3_pkt[63:62],lmq3_pkt[`LMQ_TPAR],lmq3_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq3_pkt[`LMQ_SZ_LO],lmq3_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq3_pkt[39:3]}),
	.din4	({lmq4_pkt[63:62],lmq4_pkt[`LMQ_TPAR],lmq4_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq4_pkt[`LMQ_SZ_LO],lmq4_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq4_pkt[39:3]}),
	.din5	({lmq5_pkt[63:62],lmq5_pkt[`LMQ_TPAR],lmq5_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq5_pkt[`LMQ_SZ_LO],lmq5_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq5_pkt[39:3]}),
	.din6	({lmq6_pkt[63:62],lmq6_pkt[`LMQ_TPAR],lmq6_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq6_pkt[`LMQ_SZ_LO],lmq6_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq6_pkt[39:3]}),
	.din7	({lmq7_pkt[63:62],lmq7_pkt[`LMQ_TPAR],lmq7_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],
		  lmq7_pkt[`LMQ_SZ_LO],lmq7_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq7_pkt[39:3]}),
	.sel	(cid_tid[2:0]),
	.dout	(lmd_muxdata_e[44:0])
);

// Must mux in bist and diag write data for tag portion
lsu_lmd_dp_mux_macro__left_11__mux_aope__ports_2__stack_64c__width_29 bist_mx      (
	.din0	({mbi_wdata[4:0],{3{mbi_wdata[7:0]}}}),
	.din1	(diag_data_w_buf[30:2]),
	.sel0	(lmc_mbi_run),
	.dout	(diag_addr_e[39:11])
);
assign lmq0_or_diag[44:43] = lmq0_pkt[63:62];
assign lmq0_or_diag[41:39] = {lmq0_pkt[`LMQ_RD_LO + 2:`LMQ_RD_LO + 1],lmq0_pkt[`LMQ_SZ_LO]};

lsu_lmd_dp_mux_macro__left_3__mux_aope__ports_2__stack_64c__width_40 diag_mx      (
	.din0	({wrtag_parity_w,lsu_va_w[12:11],diag_addr_e[39:11],lsu_va_w[10:3]}),
	.din1	({lmq0_pkt[`LMQ_TPAR],lmq0_pkt[`LMQ_WY_HI:`LMQ_WY_LO],lmq0_pkt[39:3]}),
	.sel0	(lmc_bist_or_diag_e),
	.dout	({lmq0_or_diag[42],lmq0_or_diag[38:0]})
);

lsu_lmd_dp_buff_macro__width_45 lmq_buf_e  (
	.din	(lmd_muxdata_e[44:0]),
	.dout	({lmd_dc_err_e[1:0],lmd_wrtag_parity_e,lmd_rd_e[2:1],lmd_fill_sz_b0_e,
		  lmd_fill_way_e[1:0], lmd_fill_addr_e[39:3]})
);

lsu_lmd_dp_msff_macro__stack_64c__width_25 dff_lmq_data_m    (
	.scan_in(dff_lmq_data_m_scanin),
	.scan_out(dff_lmq_data_m_scanout),
	.din    ({wrtag_parity_b,
		  lmd_fpodd32b_e,lmd_fp32b_e,lmd_fpld_e,lmd_sxt_fsr_e,lmd_bendian_e,
                      rd_e[4:0],lmd_sz_e[1:0],lmd_fill_way_e[1:0],lmd_fill_addr_e[10:4],ld_addr_e[2:0]}),
	.dout	({wrtag_parity_w,
		  lmd_fpodd32b_m,lmd_fp32b_m,lmd_fpld_m,lmd_sxt_fsr_m,lmd_bendian_m,
                  lmd_rd_m[4:0],lmd_sz_m[1:0],lmd_fill_way_m[1:0],lmd_fill_addr_m[10:4],lmd_ld_addr_m[2:0]}),
	.clk    (l2clk),
	.en	(1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

////////////////////////////////////////////////////////////////////////////////
// Load data bypassing
// Bypass registers can hold the following data
// 0 - swap data for CAS instructions
// 1 - load data for ASI ring operations
// 2 - RAW bypass data from STB
// 3 - load data for LSU ASI registers (non-STB)
// 4 - load data for LSU ASI registers (STB)
// 5 - parity update for STB CAM read
////////////////////////////////////////////////////////////////////////////////

// These come from the other side of LSU so buffer off the load of the eight muxes
lsu_lmd_dp_buff_macro__rep_1__width_64 st_data_buf  (
	.din	(sbd_st_data_b[63:0]),
	.dout	(st_data_b[63:0])
);
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_stb_ram_data  (
	.din	(stb_ram_data[63:0]),
	.dout	(stb_ram_data_buf[63:0])
);
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_stb_asi_data  (
	.din	(stb_ldxa_asi_data_w[63:0]),
	.dout	(stb_ldxa_asi_data_w_buf[63:0])
);
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_ard_pid_data  (
	.din	(ard_pid_data[63:0]),
	.dout	(ard_pid_data_buf[63:0])
);

// Rebuffer for the load of the eight muxes
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_dcs_asi_data  (
	.din	(dcs_ldxa_asi_data_w[63:0]),
	.dout	(dcs_ldxa_asi_data_w_buf[63:0])
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp0      (
	.scan_in(dff_ldbyp0_scanin),
	.scan_out(dff_ldbyp0_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq0_byp_sel[0]),
	.sel1	(lmc_lmq0_byp_sel[1]),
	.sel2	(lmc_lmq0_byp_sel[2]),
	.sel3	(lmc_lmq0_byp_sel[3]),
	.sel4	(lmc_lmq0_byp_sel[4]),
	.dout	(lmq0_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp1      (
	.scan_in(dff_ldbyp1_scanin),
	.scan_out(dff_ldbyp1_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq1_byp_sel[0]),
	.sel1	(lmc_lmq1_byp_sel[1]),
	.sel2	(lmc_lmq1_byp_sel[2]),
	.sel3	(lmc_lmq1_byp_sel[3]),
	.sel4	(lmc_lmq1_byp_sel[4]),
	.dout	(lmq1_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp2      (
	.scan_in(dff_ldbyp2_scanin),
	.scan_out(dff_ldbyp2_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq2_byp_sel[0]),
	.sel1	(lmc_lmq2_byp_sel[1]),
	.sel2	(lmc_lmq2_byp_sel[2]),
	.sel3	(lmc_lmq2_byp_sel[3]),
	.sel4	(lmc_lmq2_byp_sel[4]),
	.dout	(lmq2_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp3      (
	.scan_in(dff_ldbyp3_scanin),
	.scan_out(dff_ldbyp3_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq3_byp_sel[0]),
	.sel1	(lmc_lmq3_byp_sel[1]),
	.sel2	(lmc_lmq3_byp_sel[2]),
	.sel3	(lmc_lmq3_byp_sel[3]),
	.sel4	(lmc_lmq3_byp_sel[4]),
	.dout	(lmq3_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp4      (
	.scan_in(dff_ldbyp4_scanin),
	.scan_out(dff_ldbyp4_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq4_byp_sel[0]),
	.sel1	(lmc_lmq4_byp_sel[1]),
	.sel2	(lmc_lmq4_byp_sel[2]),
	.sel3	(lmc_lmq4_byp_sel[3]),
	.sel4	(lmc_lmq4_byp_sel[4]),
	.dout	(lmq4_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[4]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp5      (
	.scan_in(dff_ldbyp5_scanin),
	.scan_out(dff_ldbyp5_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq5_byp_sel[0]),
	.sel1	(lmc_lmq5_byp_sel[1]),
	.sel2	(lmc_lmq5_byp_sel[2]),
	.sel3	(lmc_lmq5_byp_sel[3]),
	.sel4	(lmc_lmq5_byp_sel[4]),
	.dout	(lmq5_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[5]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp6      (
	.scan_in(dff_ldbyp6_scanin),
	.scan_out(dff_ldbyp6_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq6_byp_sel[0]),
	.sel1	(lmc_lmq6_byp_sel[1]),
	.sel2	(lmc_lmq6_byp_sel[2]),
	.sel3	(lmc_lmq6_byp_sel[3]),
	.sel4	(lmc_lmq6_byp_sel[4]),
	.dout	(lmq6_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[6]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 dff_ldbyp7      (
	.scan_in(dff_ldbyp7_scanin),
	.scan_out(dff_ldbyp7_scanout),
	.din0	(st_data_b[63:0]),
	.din1	(ard_pid_data_buf[63:0]),
	.din2	(stb_ram_data_buf[63:0]),
	.din3	(dcs_ldxa_asi_data_w_buf[63:0]),
	.din4	(stb_ldxa_asi_data_w_buf[63:0]),
	.sel0	(lmc_lmq7_byp_sel[0]),
	.sel1	(lmc_lmq7_byp_sel[1]),
	.sel2	(lmc_lmq7_byp_sel[2]),
	.sel3	(lmc_lmq7_byp_sel[3]),
	.sel4	(lmc_lmq7_byp_sel[4]),
	.dout	(lmq7_bypass_data[63:0]),
	.clk	(l2clk),
	.en	(lmc_lmq_bypass_en[7]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


// 0in bits_on -var lmc_thrd_byp_sel_m[7:0] -max 1

lsu_lmd_dp_mux_macro__dmux_4x__mux_aonpe__ports_8__stack_64c__width_64 ldbyp_data_mux      (
	.din0	(lmq0_bypass_data[63:0]),
	.din1	(lmq1_bypass_data[63:0]),
	.din2	(lmq2_bypass_data[63:0]),
	.din3	(lmq3_bypass_data[63:0]),
	.din4	(lmq4_bypass_data[63:0]),
	.din5	(lmq5_bypass_data[63:0]),
	.din6	(lmq6_bypass_data[63:0]),
	.din7	(lmq7_bypass_data[63:0]),
	.sel0	(lmc_thrd_byp_sel_m[0]),
	.sel1	(lmc_thrd_byp_sel_m[1]),
	.sel2	(lmc_thrd_byp_sel_m[2]),
	.sel3	(lmc_thrd_byp_sel_m[3]),
	.sel4	(lmc_thrd_byp_sel_m[4]),
	.sel5	(lmc_thrd_byp_sel_m[5]),
	.sel6	(lmc_thrd_byp_sel_m[6]),
	.sel7	(lmc_thrd_byp_sel_m[7]),
	.dout	(bypass_data_m[63:0])
);

lsu_lmd_dp_buff_macro__rep_1__stack_64c__width_64 ldbyp_data_buf   (
	.din	(bypass_data_m[63:0]),
	.dout	(lmd_bypass_data_m[63:0])
);

////////////////////////////////////////////////////////////////////////////////
// L2 Fill Data
// Normal fill data comes from cid.  Diagnostic store data will come from the
// ASI ring.
////////////////////////////////////////////////////////////////////////////////

lsu_lmd_dp_msff_macro__width_64 dff_st_data_w   (
	.scan_in(dff_st_data_w_scanin),
	.scan_out(dff_st_data_w_scanout),
	.din	(st_data_b[63:0]),
	.dout	(diag_data_w[63:0]),
	.clk    (l2clk),
	.en	(dcc_cache_diag_wr_b),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_buff_macro__left_11__rep_1__stack_64c__width_29 diag_data_buf    (
	.din	(diag_data_w[30:2]),
	.dout	(diag_data_w_buf[30:2])
);

lsu_lmd_dp_mux_macro__mux_aope__ports_3__width_64 mx_fill_data_hi     (
	.din0	(diag_data_w[63:0]),
	.din1	(cid_fill_data_e[63:0]),
	.din2	(cid_fill_data_e[127:64]),
	.sel0	(cic_diag_data_sel_e),
	.sel1	(cid_st_data_sel),
	.dout	(fill_data_e[127:64])
);
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_fill_data_hi  (
	.din	(fill_data_e[127:64]),
	.dout	(lmd_fill_data_e[127:64])
);

lsu_lmd_dp_mux_macro__mux_aope__ports_2__width_64 mx_fill_data_lo     (
	.din0	(diag_data_w[63:0]),
	.din1	(cid_fill_data_e[63:0]),
	.sel0	(cic_diag_data_sel_e),
	.dout	(fill_data_e[63:0])
);
lsu_lmd_dp_buff_macro__rep_1__width_64 buf_fill_data_lo  (
	.din	(fill_data_e[63:0]),
	.dout	(lmd_fill_data_e[63:0])
);


////////////////////////////////////////////////////////////////////////////////
// Data bypassing
////////////////////////////////////////////////////////////////////////////////

// Select the correct dword for bypassing
lsu_lmd_dp_msff_macro__mux_aope__ports_2__width_64 byp_half_sel     (
	.scan_in(byp_half_sel_scanin),
	.scan_out(byp_half_sel_scanout),
	.din0	(cid_fill_data_e[127:64]),
	.din1	(cid_fill_data_e[63:0]),
	.sel0	(lmc_byp_data_hi),
	.dout	(fill_data_m[63:0]),
	.clk    (l2clk),
	.en	(lmc_byp_data_enable),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_lmd_dp_buff_macro__width_11 int_buf  (
	.din	({fill_data_m[15:14],fill_data_m[10:8],fill_data_m[5:0]}),
	.dout	({lsu_ext_int_type[1:0],lsu_ext_int_tid[2:0],lsu_ext_int_vec[5:0]})
);

lsu_lmd_dp_mux_macro__mux_pgpe__ports_2__width_64 stgb_l2fd     (
	.din0	(fill_data_m[63:0]),
	.din1	(lmd_bypass_data_m[63:0]),
	.dout	(lmd_fill_or_byp_data_m[63:0]),
	.sel0	(dcc_l2fill_vld_m)
);

lsu_lmd_dp_buff_macro__width_8 msb_buf  (
	.din	({lmd_fill_or_byp_data_m[63],lmd_fill_or_byp_data_m[55],
                  lmd_fill_or_byp_data_m[47],lmd_fill_or_byp_data_m[39],
                  lmd_fill_or_byp_data_m[31],lmd_fill_or_byp_data_m[23],
                  lmd_fill_or_byp_data_m[15],lmd_fill_or_byp_data_m[7]}),
	.dout	(lmd_misc_msb_m[7:0])
);

// fixscan start:
assign dff_lmq0_scanin           = scan_in                  ;
assign dff_lmq1_scanin           = dff_lmq0_scanout         ;
assign dff_lmq2_scanin           = dff_lmq1_scanout         ;
assign dff_lmq3_scanin           = dff_lmq2_scanout         ;
assign dff_lmq4_scanin           = dff_lmq3_scanout         ;
assign dff_lmq5_scanin           = dff_lmq4_scanout         ;
assign dff_lmq6_scanin           = dff_lmq5_scanout         ;
assign dff_lmq7_scanin           = dff_lmq6_scanout         ;
assign dff_lmq_data_m_scanin     = dff_lmq7_scanout         ;
assign dff_ldbyp0_scanin         = dff_lmq_data_m_scanout   ;
assign dff_ldbyp1_scanin         = dff_ldbyp0_scanout       ;
assign dff_ldbyp2_scanin         = dff_ldbyp1_scanout       ;
assign dff_ldbyp3_scanin         = dff_ldbyp2_scanout       ;
assign dff_ldbyp4_scanin         = dff_ldbyp3_scanout       ;
assign dff_ldbyp5_scanin         = dff_ldbyp4_scanout       ;
assign dff_ldbyp6_scanin         = dff_ldbyp5_scanout       ;
assign dff_ldbyp7_scanin         = dff_ldbyp6_scanout       ;
assign dff_st_data_w_scanin      = dff_ldbyp7_scanout       ;
assign byp_half_sel_scanin       = dff_st_data_w_scanout    ;
assign scan_out                  = byp_half_sel_scanout     ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__rep_1__stack_64c__width_40 (
  din, 
  dout);
  input [39:0] din;
  output [39:0] dout;






buff #(40)  d0_0 (
.in(din[39:0]),
.out(dout[39:0])
);








endmodule





//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__dbuff_32x__rep_1__stack_24c__width_24 (
  din, 
  dout);
  input [23:0] din;
  output [23:0] dout;






buff #(24)  d0_0 (
.in(din[23:0]),
.out(dout[23:0])
);








endmodule





//
//   parity macro (even parity)
//
//





module lsu_lmd_dp_prty_macro__width_32 (
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
//   invert macro
//
//





module lsu_lmd_dp_inv_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






inv #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module lsu_lmd_dp_xor_macro__ports_2__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output [7:0] dout;





xor2 #(8)  d0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_lmd_dp_msff_macro__mux_aope__ports_2__stack_64c__width_64 (
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









//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_aodec__ports_8__stack_6l__width_6 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [5:0] din0;
  input [5:0] din1;
  input [5:0] din2;
  input [5:0] din3;
  input [5:0] din4;
  input [5:0] din5;
  input [5:0] din6;
  input [5:0] din7;
  input [2:0] sel;
  output [5:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(6)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
  .in2(din2[5:0]),
  .in3(din3[5:0]),
  .in4(din4[5:0]),
  .in5(din5[5:0]),
  .in6(din6[5:0]),
  .in7(din7[5:0]),
.dout(dout[5:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__stack_6l__width_6 (
  din, 
  dout);
  input [5:0] din;
  output [5:0] dout;






buff #(6)  d0_0 (
.in(din[5:0]),
.out(dout[5:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_lmd_dp_cmp_macro__width_32 (
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





module lsu_lmd_dp_cmp_macro__width_8 (
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
//   and macro for ports = 2,3,4
//
//





module lsu_lmd_dp_and_macro__ports_3__width_1 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_aonpe__ports_8__stack_64c__width_51 (
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
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [50:0] din0;
  input sel0;
  input [50:0] din1;
  input sel1;
  input [50:0] din2;
  input sel2;
  input [50:0] din3;
  input sel3;
  input [50:0] din4;
  input sel4;
  input [50:0] din5;
  input sel5;
  input [50:0] din6;
  input sel6;
  input [50:0] din7;
  input sel7;
  output [50:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(51)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[50:0]),
  .in1(din1[50:0]),
  .in2(din2[50:0]),
  .in3(din3[50:0]),
  .in4(din4[50:0]),
  .in5(din5[50:0]),
  .in6(din6[50:0]),
  .in7(din7[50:0]),
.dout(dout[50:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__stack_64c__width_51 (
  din, 
  dout);
  input [50:0] din;
  output [50:0] dout;






buff #(51)  d0_0 (
.in(din[50:0]),
.out(dout[50:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_64c__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





mux2s #(2)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__dbuff_32x__dmux_4x__mux_aonpe__ports_8__stack_64c__width_15 (
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
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [14:0] din0;
  input sel0;
  input [14:0] din1;
  input sel1;
  input [14:0] din2;
  input sel2;
  input [14:0] din3;
  input sel3;
  input [14:0] din4;
  input sel4;
  input [14:0] din5;
  input sel5;
  input [14:0] din6;
  input sel6;
  input [14:0] din7;
  input sel7;
  output [14:0] dout;





cl_dp1_muxbuff8_32x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(15)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[14:0]),
  .in1(din1[14:0]),
  .in2(din2[14:0]),
  .in3(din3[14:0]),
  .in4(din4[14:0]),
  .in5(din5[14:0]),
  .in6(din6[14:0]),
  .in7(din7[14:0]),
.dout(dout[14:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_aodec__ports_8__width_45 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [44:0] din0;
  input [44:0] din1;
  input [44:0] din2;
  input [44:0] din3;
  input [44:0] din4;
  input [44:0] din5;
  input [44:0] din6;
  input [44:0] din7;
  input [2:0] sel;
  output [44:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(45)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[44:0]),
  .in1(din1[44:0]),
  .in2(din2[44:0]),
  .in3(din3[44:0]),
  .in4(din4[44:0]),
  .in5(din5[44:0]),
  .in6(din6[44:0]),
  .in7(din7[44:0]),
.dout(dout[44:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__left_11__mux_aope__ports_2__stack_64c__width_29 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [28:0] din0;
  input [28:0] din1;
  input sel0;
  output [28:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(29)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[28:0]),
  .in1(din1[28:0]),
.dout(dout[28:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__left_3__mux_aope__ports_2__stack_64c__width_40 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [39:0] din0;
  input [39:0] din1;
  input sel0;
  output [39:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(40)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[39:0]),
  .in1(din1[39:0]),
.dout(dout[39:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__width_45 (
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

module lsu_lmd_dp_msff_macro__stack_64c__width_25 (
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
wire [23:0] so;

  input [24:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [24:0] dout;


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
dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__rep_1__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_lmd_dp_msff_macro__mux_aonpe__ports_5__stack_64c__width_64 (
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
wire buffout3;
wire buffout4;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
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




cl_dp1_muxbuff5_8x  c1_0 (
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
mux5s #(64)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
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









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__dmux_4x__mux_aonpe__ports_8__stack_64c__width_64 (
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
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;
  input [63:0] din5;
  input sel5;
  input [63:0] din6;
  input sel6;
  input [63:0] din7;
  input sel7;
  output [63:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__rep_1__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_lmd_dp_msff_macro__width_64 (
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





module lsu_lmd_dp_buff_macro__left_11__rep_1__stack_64c__width_29 (
  din, 
  dout);
  input [28:0] din;
  output [28:0] dout;






buff #(29)  d0_0 (
.in(din[28:0]),
.out(dout[28:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_aope__ports_3__width_64 (
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


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_aope__ports_2__width_64 (
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






// any PARAMS parms go into naming of macro

module lsu_lmd_dp_msff_macro__mux_aope__ports_2__width_64 (
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









//
//   buff macro
//
//





module lsu_lmd_dp_buff_macro__width_11 (
  din, 
  dout);
  input [10:0] din;
  output [10:0] dout;






buff #(11)  d0_0 (
.in(din[10:0]),
.out(dout[10:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_lmd_dp_mux_macro__mux_pgpe__ports_2__width_64 (
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

