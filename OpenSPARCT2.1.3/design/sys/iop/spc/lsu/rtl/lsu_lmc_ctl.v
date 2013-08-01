// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_lmc_ctl.v
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
module lsu_lmc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  dcc_tid_m, 
  dcc_ld_inst_vld_m, 
  dcc_pref_inst_m, 
  dcc_ld_miss_b, 
  dcc_ld_miss_ldd, 
  dcc_asi_load_b, 
  dcc_asi_iomap_b, 
  dcc_blk_inst_b, 
  dcc_ldbl_b, 
  dcc_ncache_b, 
  dcc_ld_miss_ctl_b43, 
  dcc_atomic_b, 
  dcc_casa_inst_b, 
  dcc_lsu_asi_rd_b, 
  dcc_lsu_asi_sel_w, 
  dcc_ceter_wr_w, 
  dcc_stb_diag_sel_w3, 
  dcc_exception_flush_b, 
  dcc_perror_b, 
  dcc_sync_pipe_w, 
  dcc_cache_diag_wr_b, 
  dcc_asi_rtn_vld, 
  dcc_asi_rtn_excp, 
  dcc_asi_rtn_rd, 
  pic_casa_squash_req, 
  pic_early_ld_b_sel_p3, 
  pic_no_load_p3, 
  pic_asi_busy, 
  lmd_pcx_pref, 
  lmd_asi_ld, 
  lmd_asi_indet, 
  lmd_sec_cmp_b, 
  lmd_addrb2, 
  lmd_sz_b1, 
  lmd_sz_b0, 
  lmd_ldbl, 
  lmd_rd_e, 
  lmd_dc_err_e, 
  lmd_fill_addr_b3_e, 
  lmd_fill_sz_b0_e, 
  tlb_pgnum_b39, 
  tlb_cam_mhit, 
  tlu_flush_lsu_b, 
  tlu_cerer_sbdlc, 
  tlu_cerer_sbdlu, 
  tlu_cerer_dcl2c, 
  tlu_cerer_dcl2u, 
  tlu_cerer_dcl2nd, 
  tlu_cerer_l2c_socc, 
  tlu_cerer_l2u_socu, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_ld_inst_d, 
  cic_l2fill_vld_e, 
  cic_cpq_ld_rdy, 
  cic_cpq_ld_rdy_, 
  cic_div_stall_d, 
  cic_oddrd_e, 
  cic_xinval_e, 
  cic_xinval, 
  cic_set_inval, 
  cic_rtn_cmplt, 
  cic_cpq_stall, 
  cic_ext_interrupt, 
  cid_tid, 
  cid_err, 
  cid_dcsoc_err_e, 
  cid_l2miss, 
  stb_cam_hit, 
  stb_cam_mhit, 
  stb_ld_part_raw, 
  stb_cecc_err, 
  stb_uecc_err, 
  sbd_st_data_b_62, 
  sbs_all_commited, 
  sbc_st_atom_p3, 
  sbc_rawp_rst, 
  sbc_st_sel_tid_p4, 
  sbc_force_inv, 
  sbc_kill_store_p4_, 
  lsu_lsu_pmen, 
  lmc_lmq_enable_b, 
  lmc_pcx_sel_p4, 
  lmc_pcx_rq_vld, 
  lmc_asi_rq_vld, 
  lmc_ld_rq_p3, 
  lmc_ld_vld_p4, 
  lmc_ld_no_req_p4, 
  lmc_ld_inv_p4, 
  lmc_ld_tid, 
  lmc_byp_sel_e, 
  lmc_cpq_tid_m, 
  lmc_lmq_bypass_en, 
  lmc_asi_bypass_m, 
  lmc_bld_addr54, 
  lmc_bld_req, 
  lmc_bld_req_, 
  lmc_bld_annul, 
  lmc_bld_miss_e, 
  lmc_bld_last_e, 
  lmc_rd_update, 
  lmc_pref_issued, 
  lmc_ldd_vld, 
  lmc_ld_unfilled, 
  lmc_lmd_ncache_b, 
  lmc_ld_sz, 
  lmc_ld_inst_w, 
  lmc_full_raw_w, 
  lmc_ld_stall, 
  lmc_l2_err_noup, 
  lmc_l2_uerr, 
  lmc_byp_data_hi, 
  lmc_byp_data_enable, 
  lmc_thrd_byp_sel_e, 
  lmc_thrd_byp_sel_m, 
  lmc_byp_tid_m, 
  lmc_byp_vld_m, 
  lmc_lmq0_byp_sel, 
  lmc_lmq1_byp_sel, 
  lmc_lmq2_byp_sel, 
  lmc_lmq3_byp_sel, 
  lmc_lmq4_byp_sel, 
  lmc_lmq5_byp_sel, 
  lmc_lmq6_byp_sel, 
  lmc_lmq7_byp_sel, 
  lmc_asi_indet_retire, 
  lsu_ifu_no_miss, 
  lsu_dcmh_err_g, 
  lsu_dcvp_err_g, 
  lsu_dctp_err_g, 
  lsu_dcdp_err_g, 
  lsu_dcerr_tid_g, 
  lsu_dcl2c_err_g, 
  lsu_dcl2u_err_g, 
  lsu_dcl2nd_err_g, 
  lsu_sbdlc_err_g, 
  lsu_sbdlu_err_g, 
  lsu_stberr_tid_g, 
  lbist_run, 
  mbi_run, 
  lmc_mbi_run, 
  lmc_bist_or_diag_e);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire rqpend_clken;
wire l1clk_pm1;
wire [7:0] cpq_mx_thread;
wire [7:0] ceter_pscce_in;
wire [7:0] thread_w;
wire st_data_w_62;
wire [7:0] ceter_pscce_reg;
wire dff_ceter_scanin;
wire dff_ceter_scanout;
wire ceter_pscce_cpq;
wire ceter_pscce_w3;
wire [7:0] thread_w3;
wire dff_cerer_scanin;
wire dff_cerer_scanout;
wire cerer_sbdlc;
wire cerer_sbdlu;
wire cerer_dcl2c;
wire cerer_dcl2u;
wire cerer_dcl2nd;
wire cerer_socc;
wire cerer_socu;
wire [7:0] thread_b;
wire [2:0] tid_b;
wire dff_thread_w_scanin;
wire dff_thread_w_scanout;
wire dff_flush_b_scanin;
wire dff_flush_b_scanout;
wire local_flush_b;
wire flush_b;
wire excep_only_flush_b;
wire dff_flush_w_scanin;
wire dff_flush_w_scanout;
wire flush_w;
wire perror_w;
wire dff_inst_b_scanin;
wire dff_inst_b_scanout;
wire ld_inst_vld_b;
wire pref_inst_b;
wire blk_inst_w;
wire dff_inst_w_scanin;
wire dff_inst_w_scanout;
wire pref_inst_w;
wire excep_only_flush_w;
wire [7:0] load_lmq_entry;
wire dff_l2fill_scanin;
wire dff_l2fill_scanout;
wire l2fill_vld_m;
wire [7:0] ld_fill;
wire [7:0] ld_unfilled_in;
wire [7:0] ld_unfilled;
wire dff_unfilled_scanin;
wire dff_unfilled_scanout;
wire [7:0] ld_unfilled_out;
wire [7:0] ld_pcx_vld_set;
wire ncache_w;
wire ld_sec_hit_b;
wire tlb_pgnum_b39_b;
wire stb_cam_hit_b;
wire stb_cam_mhit_b;
wire stb_ld_part_raw_b;
wire dff_stb_raw_scanin;
wire dff_stb_raw_scanout;
wire stb_cam_hit_w;
wire stb_cam_mhit_w;
wire stb_ld_part_raw_w;
wire tlb_pgnum_b39_w;
wire ldbl_w;
wire ld_full_raw_w;
wire ld_part_raw_w;
wire ld_rawp_disabled_asi_b;
wire [7:0] ld_rawp_disabled_in;
wire [7:0] ld_rawp_disabled;
wire dff_rawp_disable_scanin;
wire dff_rawp_disable_scanout;
wire ld_rawp_disabled_asi_w;
wire [7:0] ld_rawp_disabled_out;
wire [7:0] ld_rawp_disabled_set;
wire [7:0] ldd_vld_in;
wire dff_ldd_vld_scanin;
wire dff_ldd_vld_scanout;
wire lmq_vld_enable_b;
wire lmq_vld_cancel_b;
wire dff_ld_lmq_en_b_scanin;
wire dff_ld_lmq_en_b_scanout;
wire lmq_vld_enable_w_pre;
wire lmq_vld_cancel_w_pre;
wire lmq_vld_cancel_w;
wire lmq_vld_enable_w;
wire [7:0] ld_pcx_vld_rst;
wire [7:0] ld_pcx_commit;
wire [7:0] kill_pcx_ld_req;
wire [7:0] bld_hold;
wire [7:0] perr_inv;
wire [7:0] ld_pcx_vld_in;
wire [7:0] ld_pcx_vld;
wire dff_ld_pcx_vld_scanin;
wire dff_ld_pcx_vld_scanout;
wire [7:0] ld_pcx_vld_out;
wire ld_asi_vld_set_b;
wire [7:0] ld_asi_vld_set;
wire ld_asi_vld_set_w;
wire [7:0] ld_asi_vld_in;
wire [7:0] ld_asi_vld_rst;
wire [7:0] ld_asi_vld;
wire dff_ld_asi_vld_scanin;
wire dff_ld_asi_vld_scanout;
wire [7:0] ld_asi_vld_out;
wire early_ld_cancel_w;
wire [7:0] ld_pcx_rq_vld;
wire early_ld_b_sel_p4;
wire block_ldd_req;
wire [7:0] ld_asi_rq_vld;
wire asi_indet_block;
wire [7:0] ld_rq_vld;
wire [7:0] load_miss_w;
wire ld_inst_unflushed_w;
wire ld_inst_vld_w;
wire lru8_scanin;
wire lru8_scanout;
wire [7:0] ld_rq_sel;
wire [7:0] ld_pcx_rq_sel;
wire [7:0] ld_asi_rq_sel;
wire ld_pcx_sel_p3;
wire ld_asi_sel_p3;
wire [7:0] ld_early_rq_sel;
wire [7:0] ld_all_rq_sel;
wire [7:0] st_atom_p4_dec;
wire dff_ld_sel_scanin;
wire dff_ld_sel_scanout;
wire [7:0] ld_all_sel_p4;
wire ld_pcx_sel_p4;
wire [3:0] ldd_count_p1;
wire [3:0] ldd_count;
wire [3:0] ldd_count_m1;
wire inc_ldd_count_pre;
wire dec_ldd_count;
wire [3:0] ldd_count_in;
wire inc_ldd_count;
wire dff_ldd_out_scanin;
wire dff_ldd_out_scanout;
wire cpq_stall;
wire casa_ld_to_pcx;
wire [3:0] st_atom_p3;
wire casa_bypass_d;
wire dff_st_atom_p4_scanin;
wire dff_st_atom_p4_scanout;
wire [3:0] st_atom_p4;
wire casa_bypass_e;
wire [3:0] st_atom_p4_in;
wire dff_st_atom_p5_scanin;
wire dff_st_atom_p5_scanout;
wire asi_indet_sel;
wire asi_indet_retire;
wire asi_indet_in;
wire dff_asi_indet_scanin;
wire dff_asi_indet_scanout;
wire dff_cpq_tid_scanin;
wire dff_cpq_tid_scanout;
wire ld_inst_nopref_b;
wire dff_ld_raw_w_scanin;
wire dff_ld_raw_w_scanout;
wire ld_inst_nopref_w;
wire [2:0] tid_w;
wire ld_raw_bypass_w;
wire dff_ld_raw_w2_scanin;
wire dff_ld_raw_w2_scanout;
wire ld_raw_bypass_w2;
wire [2:0] tid_w2;
wire dff_ld_raw_w3_scanin;
wire dff_ld_raw_w3_scanout;
wire ld_raw_bypass_w3;
wire [2:0] tid_w3;
wire sbdlc_err;
wire sbdlu_err;
wire [7:0] lmq_bypass_vld;
wire [7:0] ldbyp_vld_en;
wire [7:0] ldbyp_rst;
wire [7:0] ldbyp_vld;
wire dff_ldbyp_vld_scanin;
wire dff_ldbyp_vld_scanout;
wire ld_bypass_ok_d;
wire dff_ld_inst_e_scanin;
wire dff_ld_inst_e_scanout;
wire ld_bypass_ok_e;
wire byp_cnt_rst;
wire [2:0] byp_cnt_in;
wire [2:0] byp_cnt;
wire dff_byp_cnt_scanin;
wire dff_byp_cnt_scanout;
wire ld_bypass_e;
wire byp_vld_e;
wire [7:0] thrd_byp_sel_e;
wire dff_thrd_byp_sel_m_scanin;
wire dff_thrd_byp_sel_m_scanout;
wire [7:0] thrd_byp_sel_m;
wire [7:0] bld_inst_w;
wire [7:0] bld_pending;
wire [7:0] bld_pend_hold;
wire [7:0] bld_pending_in;
wire [7:0] bld_reset;
wire dff_bld_pending_scanin;
wire dff_bld_pending_scanout;
wire [1:0] bld_addr54_p3;
wire [1:0] bld_cnt0;
wire [1:0] bld_cnt1;
wire [1:0] bld_cnt2;
wire [1:0] bld_cnt3;
wire [1:0] bld_cnt4;
wire [1:0] bld_cnt5;
wire [1:0] bld_cnt6;
wire [1:0] bld_cnt7;
wire bld_req_p3;
wire dff_bld_addr_scanin;
wire dff_bld_addr_scanout;
wire [1:0] bld_cnt0_in;
wire inc_bld0_cnt;
wire dff_bld_cnt0_scanin;
wire dff_bld_cnt0_scanout;
wire [1:0] bld_cnt1_in;
wire inc_bld1_cnt;
wire dff_bld_cnt1_scanin;
wire dff_bld_cnt1_scanout;
wire [1:0] bld_cnt2_in;
wire inc_bld2_cnt;
wire dff_bld_cnt2_scanin;
wire dff_bld_cnt2_scanout;
wire [1:0] bld_cnt3_in;
wire inc_bld3_cnt;
wire dff_bld_cnt3_scanin;
wire dff_bld_cnt3_scanout;
wire [1:0] bld_cnt4_in;
wire inc_bld4_cnt;
wire dff_bld_cnt4_scanin;
wire dff_bld_cnt4_scanout;
wire [1:0] bld_cnt5_in;
wire inc_bld5_cnt;
wire dff_bld_cnt5_scanin;
wire dff_bld_cnt5_scanout;
wire [1:0] bld_cnt6_in;
wire inc_bld6_cnt;
wire dff_bld_cnt6_scanin;
wire dff_bld_cnt6_scanout;
wire [1:0] bld_cnt7_in;
wire inc_bld7_cnt;
wire dff_bld_cnt7_scanin;
wire dff_bld_cnt7_scanout;
wire [7:0] bld_annul_rst;
wire [7:0] bld_annul_in;
wire [7:0] bld_annul;
wire dff_bld_bypass_scanin;
wire dff_bld_bypass_scanout;
wire block_load_annul;
wire [7:0] bld_miss_set;
wire [7:0] bld_miss_in;
wire [7:0] bld_miss;
wire report_and_clear_error;
wire [7:0] bld_miss_out;
wire bld_pass7;
wire dff_bld_miss_scanin;
wire dff_bld_miss_scanout;
wire bld_pass7_done;
wire [7:0] pref_issued;
wire dff_pref_issued_scanin;
wire dff_pref_issued_scanout;
wire [7:0] perr_set;
wire [7:0] perr_inv_in;
wire dff_perr_scanin;
wire dff_perr_scanout;
wire ld_inv_p3;
wire [7:0] perr_inv_out;
wire ld_inv_p4;
wire lsu_dcvp_err_e2;
wire lsu_dctp_err_e2;
wire lsu_dcmh_err_e2;
wire lsu_dcdp_err_e2;
wire dff_dcerr_scanin;
wire dff_dcerr_scanout;
wire [1:0] l2_err;
wire [1:0] l2_err0;
wire [1:0] l2_err1;
wire [1:0] l2_err2;
wire [1:0] l2_err3;
wire [1:0] l2_err4;
wire [1:0] l2_err5;
wire [1:0] l2_err6;
wire [1:0] l2_err7;
wire [1:0] l2_err_qual;
wire [1:0] l2_err_new;
wire [1:0] l2_err0_in;
wire [1:0] l2_err1_in;
wire [1:0] l2_err2_in;
wire [1:0] l2_err3_in;
wire [1:0] l2_err4_in;
wire [1:0] l2_err5_in;
wire [1:0] l2_err6_in;
wire [1:0] l2_err7_in;
wire dff_l2errcode_scanin;
wire dff_l2errcode_scanout;
wire dcl2c_err;
wire dcl2u_err;
wire dcl2nd_err;
wire dff_l2err_scanin;
wire dff_l2err_scanout;
wire [2:0] stberr_tid;
wire dff_stberr_scanin;
wire dff_stberr_scanout;
wire [7:0] xinval_pend_in;
wire [7:0] xinval_pend;
wire cpq_xinval_m;
wire dff_xinval_pend_scanin;
wire dff_xinval_pend_scanout;
wire dff_bist_diag_scanin;
wire dff_bist_diag_scanout;
wire bist_or_diag_d;
wire spares_scanin;
wire spares_scanout;
wire [4:0] unused;


// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input	[2:0]	dcc_tid_m;
input		dcc_ld_inst_vld_m;
input		dcc_pref_inst_m;
input		dcc_ld_miss_b;		// A load that needs to go to L2
input		dcc_ld_miss_ldd;
input		dcc_asi_load_b;
input		dcc_asi_iomap_b;
input		dcc_blk_inst_b;		// Block load instruction in B
input		dcc_ldbl_b;
input		dcc_ncache_b;		// Non-cacheable ldst in B
input		dcc_ld_miss_ctl_b43;	// Non-cacheable request to pcx
input		dcc_atomic_b;	
input		dcc_casa_inst_b;
input		dcc_lsu_asi_rd_b;
input		dcc_lsu_asi_sel_w;
input		dcc_ceter_wr_w;
input		dcc_stb_diag_sel_w3;
input		dcc_exception_flush_b;
input		dcc_perror_b;
input		dcc_sync_pipe_w;
input		dcc_cache_diag_wr_b;

input	[7:0]	dcc_asi_rtn_vld;
input		dcc_asi_rtn_excp;
input		dcc_asi_rtn_rd;

input		pic_casa_squash_req;	// No loads can request this cycle
input		pic_early_ld_b_sel_p3;	// The load in B is going to the pcx
input		pic_no_load_p3;		// Load cannot issue in P3
input		pic_asi_busy;		// ASI ring cannot accept a request

input		lmd_pcx_pref;
input	[7:0]	lmd_asi_ld;
input	[7:0]	lmd_asi_indet;
input	[7:0]	lmd_sec_cmp_b;		// secondary hit compare results
input		lmd_addrb2;
input		lmd_sz_b1;
input		lmd_sz_b0;
input		lmd_ldbl;
input	[2:1]	lmd_rd_e;
input	[1:0]	lmd_dc_err_e;
input		lmd_fill_addr_b3_e;
input		lmd_fill_sz_b0_e;

input		tlb_pgnum_b39;
input		tlb_cam_mhit;

input		tlu_flush_lsu_b;	// Flush the instruction in B
input		tlu_cerer_sbdlc;
input		tlu_cerer_sbdlu;
input		tlu_cerer_dcl2c;
input		tlu_cerer_dcl2u;
input		tlu_cerer_dcl2nd;
input		tlu_cerer_l2c_socc;
input		tlu_cerer_l2u_socu;

input		dec_flush_lm;		// Flush the instruction in M
input		dec_flush_lb;		// Flush the instruction in B
input		dec_ld_inst_d;

input		cic_l2fill_vld_e;
input		cic_cpq_ld_rdy;
input		cic_cpq_ld_rdy_;
input		cic_div_stall_d;
input		cic_oddrd_e;
input		cic_xinval_e;		// xinval is being processed
input	[7:0]	cic_xinval;		// xinval arrived for a thread
input		cic_set_inval;
input		cic_rtn_cmplt;
input		cic_cpq_stall;
input		cic_ext_interrupt;

input	[2:0]	cid_tid;
input	[1:0]	cid_err;
input		cid_dcsoc_err_e;
input		cid_l2miss;

input		stb_cam_hit;
input		stb_cam_mhit;
input		stb_ld_part_raw;
input		stb_cecc_err;
input		stb_uecc_err;

input		sbd_st_data_b_62;

input	[7:0]	sbs_all_commited;

input	[7:0]	sbc_st_atom_p3;
input	[7:0]	sbc_rawp_rst;
input	[2:0]	sbc_st_sel_tid_p4;
input		sbc_force_inv;
input		sbc_kill_store_p4_;

input		lsu_lsu_pmen;

output	[7:0]	lmc_lmq_enable_b;	// Load enables for LMQ flops (threaded)
output	[7:0]	lmc_pcx_sel_p4;		// Which thread to send to pcx/asi
output		lmc_pcx_rq_vld;		// At least one thread is ready to issue
output		lmc_asi_rq_vld;		// At least one thread is ready to issue
output		lmc_ld_rq_p3;
output		lmc_ld_vld_p4;
output		lmc_ld_no_req_p4;	// Cancel the pcx request of the load
output		lmc_ld_inv_p4;
output	[2:0]	lmc_ld_tid;		// Thread ID of load selected for issue
output	[7:0]	lmc_byp_sel_e;		// Thread select for fill/bypass data
output	[2:0]	lmc_cpq_tid_m;		// Thread ID of current cpq packet
output	[7:0]	lmc_lmq_bypass_en;	// Load enable for the LMQ bypass registers
output		lmc_asi_bypass_m;	// ASI data is bypassing now
output	[1:0]	lmc_bld_addr54;		// Block load address modifier
output		lmc_bld_req;		// Current pcx req is for block load
output		lmc_bld_req_;
output		lmc_bld_annul;		
output		lmc_bld_miss_e;
output		lmc_bld_last_e;
output	[7:0]	lmc_rd_update;
output	[7:0]	lmc_pref_issued;	// Prefetch issued to pcx
output	[7:0]	lmc_ldd_vld;
output	[7:0]	lmc_ld_unfilled;
output		lmc_lmd_ncache_b;
output	[4:0]	lmc_ld_sz;
output		lmc_ld_inst_w;
output		lmc_full_raw_w;
output		lmc_ld_stall;		// stall pipe so bypass can complete
output		lmc_l2_err_noup;
output		lmc_l2_uerr;
output		lmc_byp_data_hi;
output		lmc_byp_data_enable;

output	[7:0]	lmc_thrd_byp_sel_e;	// Thread is bypassing (or filling)
output	[7:0]	lmc_thrd_byp_sel_m;	// Which thread's bypass register is bypassing
output	[2:0]	lmc_byp_tid_m;		// Which thread's bypass register is bypassing
output		lmc_byp_vld_m;		// A bypass is occuring
output	[4:0]	lmc_lmq0_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq1_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq2_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq3_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq4_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq5_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq6_byp_sel;	// source selects for load bypass registers
output	[4:0]	lmc_lmq7_byp_sel;	// source selects for load bypass registers
output		lmc_asi_indet_retire;	// indeterminate ASI load back from ring

output	[7:0]	lsu_ifu_no_miss;	// xinval pending so do not allow I$ miss

output		lsu_dcmh_err_g;
output		lsu_dcvp_err_g;
output		lsu_dctp_err_g;
output		lsu_dcdp_err_g;
output	[2:0]	lsu_dcerr_tid_g;

output		lsu_dcl2c_err_g;
output		lsu_dcl2u_err_g;
output		lsu_dcl2nd_err_g;

output		lsu_sbdlc_err_g;
output		lsu_sbdlu_err_g;
output	[2:0]	lsu_stberr_tid_g;

input		lbist_run;
input		mbi_run;
output		lmc_mbi_run;
output		lmc_bist_or_diag_e;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

//////////////////////////////
// Clock header
//////////////////////////////
lsu_lmc_ctll1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (1'b1                           ),
        .l1clk  (l1clk                          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_lmc_ctll1clkhdr_ctl_macro rqpend_clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (rqpend_clken                   ),
        .l1clk  (l1clk_pm1                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

assign cpq_mx_thread[0] = (cid_tid[2:0] == 3'd0);
assign cpq_mx_thread[1] = (cid_tid[2:0] == 3'd1);
assign cpq_mx_thread[2] = (cid_tid[2:0] == 3'd2);
assign cpq_mx_thread[3] = (cid_tid[2:0] == 3'd3);
assign cpq_mx_thread[4] = (cid_tid[2:0] == 3'd4);
assign cpq_mx_thread[5] = (cid_tid[2:0] == 3'd5);
assign cpq_mx_thread[6] = (cid_tid[2:0] == 3'd6);
assign cpq_mx_thread[7] = (cid_tid[2:0] == 3'd7);

assign ceter_pscce_in[0] = (dcc_ceter_wr_w & thread_w[0]) ? st_data_w_62 : ceter_pscce_reg[0];
assign ceter_pscce_in[1] = (dcc_ceter_wr_w & thread_w[1]) ? st_data_w_62 : ceter_pscce_reg[1];
assign ceter_pscce_in[2] = (dcc_ceter_wr_w & thread_w[2]) ? st_data_w_62 : ceter_pscce_reg[2];
assign ceter_pscce_in[3] = (dcc_ceter_wr_w & thread_w[3]) ? st_data_w_62 : ceter_pscce_reg[3];
assign ceter_pscce_in[4] = (dcc_ceter_wr_w & thread_w[4]) ? st_data_w_62 : ceter_pscce_reg[4];
assign ceter_pscce_in[5] = (dcc_ceter_wr_w & thread_w[5]) ? st_data_w_62 : ceter_pscce_reg[5];
assign ceter_pscce_in[6] = (dcc_ceter_wr_w & thread_w[6]) ? st_data_w_62 : ceter_pscce_reg[6];
assign ceter_pscce_in[7] = (dcc_ceter_wr_w & thread_w[7]) ? st_data_w_62 : ceter_pscce_reg[7];

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_ceter  (
	.scan_in(dff_ceter_scanin),
	.scan_out(dff_ceter_scanout),
	.din	({sbd_st_data_b_62,ceter_pscce_in[7:0]}),
	.dout	({st_data_w_62,    ceter_pscce_reg[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ceter_pscce_cpq = (cpq_mx_thread[0] & ceter_pscce_reg[0]) |
                         (cpq_mx_thread[1] & ceter_pscce_reg[1]) | 
                         (cpq_mx_thread[2] & ceter_pscce_reg[2]) | 
                         (cpq_mx_thread[3] & ceter_pscce_reg[3]) | 
                         (cpq_mx_thread[4] & ceter_pscce_reg[4]) | 
                         (cpq_mx_thread[5] & ceter_pscce_reg[5]) | 
                         (cpq_mx_thread[6] & ceter_pscce_reg[6]) | 
                         (cpq_mx_thread[7] & ceter_pscce_reg[7]) ;

assign ceter_pscce_w3 = (thread_w3[0] & ceter_pscce_reg[0]) |
                        (thread_w3[1] & ceter_pscce_reg[1]) | 
                        (thread_w3[2] & ceter_pscce_reg[2]) | 
                        (thread_w3[3] & ceter_pscce_reg[3]) | 
                        (thread_w3[4] & ceter_pscce_reg[4]) | 
                        (thread_w3[5] & ceter_pscce_reg[5]) | 
                        (thread_w3[6] & ceter_pscce_reg[6]) | 
                        (thread_w3[7] & ceter_pscce_reg[7]) ;

lsu_lmc_ctlmsff_ctl_macro__width_7 dff_cerer  (
	.scan_in(dff_cerer_scanin),
	.scan_out(dff_cerer_scanout),
	.din	({tlu_cerer_sbdlc,tlu_cerer_sbdlu,tlu_cerer_dcl2c,tlu_cerer_dcl2u,tlu_cerer_dcl2nd,
		  tlu_cerer_l2c_socc, tlu_cerer_l2u_socu}),
	.dout	({    cerer_sbdlc,    cerer_sbdlu,    cerer_dcl2c,    cerer_dcl2u,    cerer_dcl2nd,
		  cerer_socc,         cerer_socu}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////
// Thread decoding
//////////////////////////////

assign thread_b[0] = ~tid_b[2] & ~tid_b[1] & ~tid_b[0];
assign thread_b[1] = ~tid_b[2] & ~tid_b[1] &  tid_b[0];
assign thread_b[2] = ~tid_b[2] &  tid_b[1] & ~tid_b[0];
assign thread_b[3] = ~tid_b[2] &  tid_b[1] &  tid_b[0];
assign thread_b[4] =  tid_b[2] & ~tid_b[1] & ~tid_b[0];
assign thread_b[5] =  tid_b[2] & ~tid_b[1] &  tid_b[0];
assign thread_b[6] =  tid_b[2] &  tid_b[1] & ~tid_b[0];
assign thread_b[7] =  tid_b[2] &  tid_b[1] &  tid_b[0];

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_thread_w  (
	.scan_in(dff_thread_w_scanin),
	.scan_out(dff_thread_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(thread_b[7:0]),
	.dout	(thread_w[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////
// Instruction flushing
//////////////////////////////

lsu_lmc_ctlmsff_ctl_macro__width_1 dff_flush_b  (
	.scan_in(dff_flush_b_scanin),
	.scan_out(dff_flush_b_scanout),
	.din	(dec_flush_lm),
	.dout	(local_flush_b),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign flush_b = tlu_flush_lsu_b | dec_flush_lb | local_flush_b | dcc_exception_flush_b;
assign excep_only_flush_b = dcc_exception_flush_b & ~(tlu_flush_lsu_b | dec_flush_lb | local_flush_b);

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_flush_w  (
	.scan_in(dff_flush_w_scanin),
	.scan_out(dff_flush_w_scanout),
	.din	({flush_b,dcc_perror_b}),
	.dout	({flush_w,perror_w}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Enables to load miss information into the LMQ buffers
// LMQ buffers are written in the W stage, so the enable must be valid in B.
// ld_miss_b will be the critical signal.  If it's too late, the LMQ can be loaded
// on every miss and a separate signal used to track whether the load needs to go
// to L2, but this will mess up the LRU mechanism below, so I'd like to avoid it
// if possible.
////////////////////////////////////////////////////////////////////////////////

lsu_lmc_ctlmsff_ctl_macro__width_6 dff_inst_b  (
	.scan_in(dff_inst_b_scanin),
	.scan_out(dff_inst_b_scanout),
	.din	({dcc_ld_inst_vld_m, dcc_pref_inst_m, dcc_blk_inst_b,dcc_tid_m[2:0]}),
	.dout	({    ld_inst_vld_b,     pref_inst_b, blk_inst_w,    tid_b[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_inst_w  (
	.scan_in(dff_inst_w_scanin),
	.scan_out(dff_inst_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({pref_inst_b, excep_only_flush_b}),
	.dout	({pref_inst_w, excep_only_flush_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign load_lmq_entry[7:0] = (({8{ld_inst_vld_b}} & thread_b[7:0]) &
                                ~(({8{dcc_sync_pipe_w}} & thread_w[7:0]) | {8{local_flush_b}}));
assign lmc_lmq_enable_b[7:0] = load_lmq_entry[7:0] | lmc_rd_update[7:0];

////////////////////////////////////////////////////////////////////////////////
// Fill state of each entry.  An unfilled flag is set when the miss occurs
// and cleared when the cache is filled (or when the data is bypassed in the
// case of non-cacheable loads).
////////////////////////////////////////////////////////////////////////////////

lsu_lmc_ctlmsff_ctl_macro__width_1 dff_l2fill  (
	.scan_in(dff_l2fill_scanin),
	.scan_out(dff_l2fill_scanout),
	.din	(cic_l2fill_vld_e),
	.dout	(l2fill_vld_m),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ld_fill[0] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b000);
assign ld_fill[1] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b001);
assign ld_fill[2] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b010);
assign ld_fill[3] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b011);
assign ld_fill[4] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b100);
assign ld_fill[5] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b101);
assign ld_fill[6] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b110);
assign ld_fill[7] = l2fill_vld_m & (lmc_cpq_tid_m[2:0] == 3'b111);

assign ld_unfilled_in[7:0] = ld_unfilled[7:0] & ~ld_fill[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_unfilled  (
	.scan_in(dff_unfilled_scanin),
	.scan_out(dff_unfilled_scanout),
	.din	(ld_unfilled_in[7:0]),
	.dout	(ld_unfilled_out[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign ld_unfilled[7:0] = (ld_pcx_vld_set[7:0] & {8{~ncache_w}}) | ld_unfilled_out[7:0];

////////////////////////////////////////////////////////////////////////////////
// Secondary miss processing
// A load miss is considered secondary if it matches a load from another thread
// that has a miss pending.  In this case, the secondary load will be marked
// as non-cacheable to avoid cache pollution. 
////////////////////////////////////////////////////////////////////////////////

assign lmc_ld_unfilled[7:0] = ld_unfilled[7:0];

assign ld_sec_hit_b = (|(lmd_sec_cmp_b[7:0]) & ~dcc_asi_load_b);

assign lmc_lmd_ncache_b = dcc_ld_miss_ctl_b43 | ld_sec_hit_b;

////////////////////////////////////////////////////////////////////////////////
// Partial RAW handling
// Partial RAWs and loads treated like partial raws (full raw to multiple stb
// entries) cannot issue to the pcx until dependent stores have been committed
// to the pcx.  The depedency tracking is done in lsu_sbc_ctl.
////////////////////////////////////////////////////////////////////////////////

assign tlb_pgnum_b39_b = ld_inst_vld_b & tlb_pgnum_b39 & ~tlb_cam_mhit;

assign stb_cam_hit_b     = stb_cam_hit     & ~(lbist_run | lmc_mbi_run);
assign stb_cam_mhit_b    = stb_cam_mhit    & ~(lbist_run | lmc_mbi_run);
assign stb_ld_part_raw_b = stb_ld_part_raw & ~(lbist_run | lmc_mbi_run);

lsu_lmc_ctlmsff_ctl_macro__width_5 dff_stb_raw  (
	.scan_in(dff_stb_raw_scanin),
	.scan_out(dff_stb_raw_scanout),
	.l1clk	(l1clk_pm1),
	.din	({stb_cam_hit_b,stb_cam_mhit_b,stb_ld_part_raw_b,tlb_pgnum_b39_b,dcc_ldbl_b}),
	.dout	({stb_cam_hit_w,stb_cam_mhit_w,stb_ld_part_raw_w,tlb_pgnum_b39_w,ldbl_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign ld_full_raw_w = stb_cam_hit_w & ~ld_part_raw_w;
assign ld_part_raw_w = stb_ld_part_raw_w |			// a partial hit
                       stb_cam_mhit_w |				// multiple hits
                       tlb_pgnum_b39_w |			// IO load
                       (ldbl_w & stb_cam_hit_w) ;		// BLD/QUAD/LDD

assign ld_rawp_disabled_asi_b = (dcc_asi_load_b & ~dcc_lsu_asi_rd_b) & ld_inst_vld_b;

assign ld_rawp_disabled_in[7:0] = (ld_rawp_disabled[7:0] & ~sbc_rawp_rst[7:0]) & ~sbs_all_commited[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_rawp_disable  (
	.scan_in(dff_rawp_disable_scanin),
	.scan_out(dff_rawp_disable_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ld_rawp_disabled_asi_b,ld_rawp_disabled_in[7:0]}),
	.dout	({ld_rawp_disabled_asi_w,ld_rawp_disabled_out[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Don't change or remove this signal name.  It's used by the bench.
assign ld_rawp_disabled_set[7:0] = {8{ (ld_rawp_disabled_asi_w | ld_part_raw_w) & ~flush_w }} & thread_w[7:0];	

assign ld_rawp_disabled[7:0] = ld_rawp_disabled_set[7:0] | ld_rawp_disabled_out[7:0];

////////////////////////////////////////////////////////////////////////////////
// Track ldd flags here.  They used to be part of lmq entry in lsu_lmd_dp, but
// they need to be here for timing.
////////////////////////////////////////////////////////////////////////////////

assign ldd_vld_in[7:0] = ( load_lmq_entry[7:0] & {8{dcc_ld_miss_ldd}}) |
                         (~load_lmq_entry[7:0] & lmc_ldd_vld[7:0]);

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_ldd_vld  (
	.scan_in(dff_ldd_vld_scanin),
	.scan_out(dff_ldd_vld_scanout),
	.l1clk	(l1clk_pm1),
	.din	(ldd_vld_in[7:0]),
	.dout	(lmc_ldd_vld[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// PCX and ASI Load Control
// An LMQ entry is ready to issue to the pcx when it is loaded.
// The request is cleared once the entry successfully issues to the pcx.
//
//	B	|	W/P3	|	P4	
//		|		|		
// miss detected| LMQ loaded	| packet to gasket	
//		| request set	|		
//		| arb for pcx	|		
//
// Arbitration among threads with pending load requests happens here.  Arbitration
// between the pcx sources (loads and stores) happens in the pic control block.
////////////////////////////////////////////////////////////////////////////////

// Load misses issue to the pcx with the following exceptions
// - internal ASI's which aren't IO mapped (they go to the ASI ring instead)
// - atomics (the STB arbitrates for these)
// - prefetches always issue, regardless
// - full raw

assign lmq_vld_enable_b = dcc_ld_miss_b & ld_inst_vld_b;
assign lmq_vld_cancel_b = (dcc_asi_load_b & ~dcc_asi_iomap_b) | dcc_atomic_b;

lsu_lmc_ctlmsff_ctl_macro__width_3 dff_ld_lmq_en_b  (
	.scan_in(dff_ld_lmq_en_b_scanin),
	.scan_out(dff_ld_lmq_en_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({lmq_vld_enable_b,    lmq_vld_cancel_b,    lmc_lmd_ncache_b}),
	.dout	({lmq_vld_enable_w_pre,lmq_vld_cancel_w_pre,ncache_w}),
  .siclk(siclk),
  .soclk(soclk)
);
assign lmq_vld_cancel_w = lmq_vld_cancel_w_pre | ld_full_raw_w;
assign lmq_vld_enable_w = (lmq_vld_enable_w_pre | ld_part_raw_w) & ~lmq_vld_cancel_w;

// PCX requests pending
assign ld_pcx_vld_set[0] = lmq_vld_enable_w & ~flush_w & thread_w[0];
assign ld_pcx_vld_set[1] = lmq_vld_enable_w & ~flush_w & thread_w[1];
assign ld_pcx_vld_set[2] = lmq_vld_enable_w & ~flush_w & thread_w[2];
assign ld_pcx_vld_set[3] = lmq_vld_enable_w & ~flush_w & thread_w[3];
assign ld_pcx_vld_set[4] = lmq_vld_enable_w & ~flush_w & thread_w[4];
assign ld_pcx_vld_set[5] = lmq_vld_enable_w & ~flush_w & thread_w[5];
assign ld_pcx_vld_set[6] = lmq_vld_enable_w & ~flush_w & thread_w[6];
assign ld_pcx_vld_set[7] = lmq_vld_enable_w & ~flush_w & thread_w[7];

assign ld_pcx_vld_rst[7:0] = (ld_pcx_commit[7:0] | kill_pcx_ld_req[7:0]) & ~(bld_hold[7:0] | perr_inv[7:0]);

assign ld_pcx_vld_in[7:0] = ~ld_pcx_vld_rst[7:0] & ld_pcx_vld[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_ld_pcx_vld  (
	.scan_in(dff_ld_pcx_vld_scanin),
	.scan_out(dff_ld_pcx_vld_scanout),
	.l1clk	(l1clk_pm1),
	.din	(ld_pcx_vld_in[7:0]),
	.dout	(ld_pcx_vld_out[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);
assign ld_pcx_vld[7:0] = ld_pcx_vld_set[7:0] | ld_pcx_vld_out[7:0];

// ASI requests pending
assign ld_asi_vld_set_b = dcc_asi_load_b & ~dcc_asi_iomap_b & ~dcc_lsu_asi_rd_b;

assign ld_asi_vld_set[0] = ld_asi_vld_set_w & ~flush_w & thread_w[0];
assign ld_asi_vld_set[1] = ld_asi_vld_set_w & ~flush_w & thread_w[1];
assign ld_asi_vld_set[2] = ld_asi_vld_set_w & ~flush_w & thread_w[2];
assign ld_asi_vld_set[3] = ld_asi_vld_set_w & ~flush_w & thread_w[3];
assign ld_asi_vld_set[4] = ld_asi_vld_set_w & ~flush_w & thread_w[4];
assign ld_asi_vld_set[5] = ld_asi_vld_set_w & ~flush_w & thread_w[5];
assign ld_asi_vld_set[6] = ld_asi_vld_set_w & ~flush_w & thread_w[6];
assign ld_asi_vld_set[7] = ld_asi_vld_set_w & ~flush_w & thread_w[7];

assign ld_asi_vld_in[7:0] = ~ld_asi_vld_rst[7:0] & ld_asi_vld[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_ld_asi_vld  (
	.scan_in(dff_ld_asi_vld_scanin),
	.scan_out(dff_ld_asi_vld_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ld_asi_vld_set_b,ld_asi_vld_in[7:0]}),
	.dout	({ld_asi_vld_set_w,ld_asi_vld_out[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign ld_asi_vld[7:0] = ld_asi_vld_set[7:0] | ld_asi_vld_out[7:0];

// Is the load which made an early request still valid?
assign early_ld_cancel_w = ld_full_raw_w | ld_part_raw_w | flush_w | perror_w;

// A thread should never have pcx and asi requests valid simultaneously
// 0in bits_on -var {ld_pcx_vld[0],ld_asi_vld[0]} -max 1 -message "PCX and ASI load requests for thread 0" 
// 0in bits_on -var {ld_pcx_vld[1],ld_asi_vld[1]} -max 1 -message "PCX and ASI load requests for thread 1" 
// 0in bits_on -var {ld_pcx_vld[2],ld_asi_vld[2]} -max 1 -message "PCX and ASI load requests for thread 2" 
// 0in bits_on -var {ld_pcx_vld[3],ld_asi_vld[3]} -max 1 -message "PCX and ASI load requests for thread 3" 
// 0in bits_on -var {ld_pcx_vld[4],ld_asi_vld[4]} -max 1 -message "PCX and ASI load requests for thread 4" 
// 0in bits_on -var {ld_pcx_vld[5],ld_asi_vld[5]} -max 1 -message "PCX and ASI load requests for thread 5" 
// 0in bits_on -var {ld_pcx_vld[6],ld_asi_vld[6]} -max 1 -message "PCX and ASI load requests for thread 6" 
// 0in bits_on -var {ld_pcx_vld[7],ld_asi_vld[7]} -max 1 -message "PCX and ASI load requests for thread 7" 

//////////////////////
// P3 stage
//////////////////////

// Generate valid pcx and asi requests.
// PCX requests can be cancelled by rawp conditions
// ASI requests can be cancelled by rawp conditions and by another outstanding indeterminate.

assign ld_pcx_rq_vld[7:0] = ld_pcx_vld[7:0] & ~ld_rawp_disabled[7:0] & ~({8{early_ld_b_sel_p4}} & thread_w[7:0]) & ~({8{block_ldd_req}} & lmc_ldd_vld[7:0]);
assign ld_asi_rq_vld[7:0] = ld_asi_vld[7:0] & ~ld_rawp_disabled[7:0] & ~(lmd_asi_ld[7:0] & lmd_asi_indet[7:0] & {8{asi_indet_block}});

assign ld_rq_vld[7:0] = ld_pcx_rq_vld[7:0] | ld_asi_rq_vld[7:0];
assign lmc_ld_rq_p3 = |(ld_rq_vld[7:0]);

// Pseudo-LRU picker to choose the oldest thread for issuing to pcx.
// LRU state is updated after a load is put into the miss queue
assign load_miss_w[7:0] = {8{(ld_inst_unflushed_w | (ld_inst_vld_w & ~flush_w))}} & thread_w[7:0] & (ld_pcx_vld[7:0] | ld_asi_vld[7:0]);

lsu_lru8_ctl lru8 (
	.scan_in(lru8_scanin),
	.scan_out(lru8_scanout),
	.request	(ld_rq_vld[7:0]),
	.enable		(load_miss_w[7:0]),
	.select		(ld_rq_sel[7:0]),
  .l1clk(l1clk),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

// Tell pic if request was pcx or asi
assign lmc_pcx_rq_vld = |(ld_rq_sel[7:0] & ld_pcx_rq_vld[7:0]);
assign lmc_asi_rq_vld = |(ld_rq_sel[7:0] & ld_asi_rq_vld[7:0]);

// A request wins arbitration to the pcx if it's thread is selected AND
// the load port wins source arbitration.
// Loads will win over stores unless blocked by pic_no_load_p3
assign ld_pcx_rq_sel[7:0]   = ld_rq_sel[7:0] & ld_pcx_rq_vld[7:0] & {8{~pic_no_load_p3}};
assign ld_asi_rq_sel[7:0]   = ld_rq_sel[7:0] & ld_asi_rq_vld[7:0] & {8{~(pic_no_load_p3 | pic_asi_busy)}};
assign ld_pcx_sel_p3 = |(ld_pcx_rq_sel[7:0]);
assign ld_asi_sel_p3 = |(ld_asi_rq_sel[7:0]);

assign ld_early_rq_sel[7:0] = {8{~(ld_pcx_sel_p3 | ld_asi_sel_p3 | pic_casa_squash_req)}} & thread_b[7:0];
assign ld_all_rq_sel[7:0] = ld_pcx_rq_sel[7:0] | ld_asi_rq_sel[7:0] | ld_early_rq_sel[7:0] | st_atom_p4_dec[7:0];

assign ld_pcx_commit[7:0] = ld_pcx_rq_sel[7:0];
assign ld_asi_vld_rst[7:0] = ld_asi_rq_sel[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_10 dff_ld_sel  (
	.scan_in(dff_ld_sel_scanin),
	.scan_out(dff_ld_sel_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ld_all_rq_sel[7:0],ld_pcx_sel_p3,pic_early_ld_b_sel_p3}),
	.dout	({ld_all_sel_p4[7:0],ld_pcx_sel_p4, early_ld_b_sel_p4}),
  .siclk(siclk),
  .soclk(soclk)
);

// Need to throttle the number of outstanding LDD requests to avoid CPQ overflow.  
// No more LDD requests can be sent if
// (i) Number of outstanding requests is 14   OR
// (ii)cic is issuing a stall due to CPQ above high water mark
// Counter is incremented one cycle late to ease timing.

assign ldd_count_p1[3:0] = ldd_count[3:0] + 4'b0001;
assign ldd_count_m1[3:0] = ldd_count[3:0] - 4'b0001;

assign inc_ldd_count_pre = |(ld_pcx_rq_sel[7:0] & lmc_ldd_vld[7:0] & ~perr_inv[7:0]);
assign dec_ldd_count = cic_oddrd_e;
assign ldd_count_in[3:0] = ({4{inc_ldd_count & ~dec_ldd_count}} & ldd_count_p1[3:0]) |
                           ({4{dec_ldd_count & ~inc_ldd_count}} & ldd_count_m1[3:0]) |
                           ({4{inc_ldd_count ~^ dec_ldd_count}} & ldd_count[3:0]) ;

lsu_lmc_ctlmsff_ctl_macro__width_6 dff_ldd_out  (
	.scan_in(dff_ldd_out_scanin),
	.scan_out(dff_ldd_out_scanout),
	.din	({cic_cpq_stall,inc_ldd_count_pre,ldd_count_in[3:0]}),
	.dout	({cpq_stall,    inc_ldd_count    ,ldd_count[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_ldd_req = (ldd_count[3:2]==2'b11 & (ldd_count[1] | ldd_count[0] & inc_ldd_count)) | cpq_stall;

//////////////////////
// P4 stage
//////////////////////

assign lmc_ld_no_req_p4 = early_ld_b_sel_p4 & early_ld_cancel_w;

assign kill_pcx_ld_req[7:0] = {8{(early_ld_b_sel_p4 & ~early_ld_cancel_w)}} & thread_w[7:0];

assign lmc_ld_vld_p4 = (casa_ld_to_pcx) | 			// CAS packet 2
                       (ld_pcx_sel_p4) |			// queued miss request
                       (early_ld_b_sel_p4 & ~early_ld_cancel_w);// early B/W request

assign lmc_pcx_sel_p4[7:0] = ld_all_sel_p4[7:0];

assign lmc_ld_tid[2] = lmc_pcx_sel_p4[7] | lmc_pcx_sel_p4[6] | lmc_pcx_sel_p4[5] | lmc_pcx_sel_p4[4];
assign lmc_ld_tid[1] = lmc_pcx_sel_p4[7] | lmc_pcx_sel_p4[6] | lmc_pcx_sel_p4[3] | lmc_pcx_sel_p4[2];
assign lmc_ld_tid[0] = lmc_pcx_sel_p4[7] | lmc_pcx_sel_p4[5] | lmc_pcx_sel_p4[3] | lmc_pcx_sel_p4[1];

// Encode this info to save some flops. [3]=valid,[2:0]=tid
assign st_atom_p3[3] = |(sbc_st_atom_p3[7:0]);
assign st_atom_p3[2] = sbc_st_atom_p3[7] | sbc_st_atom_p3[6] | sbc_st_atom_p3[5] | sbc_st_atom_p3[4];
assign st_atom_p3[1] = sbc_st_atom_p3[7] | sbc_st_atom_p3[6] | sbc_st_atom_p3[3] | sbc_st_atom_p3[2];
assign st_atom_p3[0] = sbc_st_atom_p3[7] | sbc_st_atom_p3[5] | sbc_st_atom_p3[3] | sbc_st_atom_p3[1];

assign casa_bypass_d = st_atom_p3[3];

lsu_lmc_ctlmsff_ctl_macro__width_4 dff_st_atom_p4  (
	.scan_in(dff_st_atom_p4_scanin),
	.scan_out(dff_st_atom_p4_scanout),
	.din	(st_atom_p3[3:0]),
	.dout	(st_atom_p4[3:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// If casa is using the bypass register, other bypasses must be blocked.
assign casa_bypass_e = st_atom_p4[3];

// If STB read of CAS1 had an error, kill the CAS2 and restart the thread
assign st_atom_p4_in[3] = st_atom_p4[3] & sbc_kill_store_p4_;
assign st_atom_p4_in[2:0] = st_atom_p4[2:0];

assign st_atom_p4_dec[0] = st_atom_p4[3] & ~st_atom_p4[2] & ~st_atom_p4[1] & ~st_atom_p4[0];
assign st_atom_p4_dec[1] = st_atom_p4[3] & ~st_atom_p4[2] & ~st_atom_p4[1] &  st_atom_p4[0];
assign st_atom_p4_dec[2] = st_atom_p4[3] & ~st_atom_p4[2] &  st_atom_p4[1] & ~st_atom_p4[0];
assign st_atom_p4_dec[3] = st_atom_p4[3] & ~st_atom_p4[2] &  st_atom_p4[1] &  st_atom_p4[0];
assign st_atom_p4_dec[4] = st_atom_p4[3] &  st_atom_p4[2] & ~st_atom_p4[1] & ~st_atom_p4[0];
assign st_atom_p4_dec[5] = st_atom_p4[3] &  st_atom_p4[2] & ~st_atom_p4[1] &  st_atom_p4[0];
assign st_atom_p4_dec[6] = st_atom_p4[3] &  st_atom_p4[2] &  st_atom_p4[1] & ~st_atom_p4[0];
assign st_atom_p4_dec[7] = st_atom_p4[3] &  st_atom_p4[2] &  st_atom_p4[1] &  st_atom_p4[0];

lsu_lmc_ctlmsff_ctl_macro__width_1 dff_st_atom_p5  (
	.scan_in(dff_st_atom_p5_scanin),
	.scan_out(dff_st_atom_p5_scanout),
	.din	(st_atom_p4_in[3]),
	.dout	(casa_ld_to_pcx),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Indeterminate ASI blocks

assign asi_indet_sel = |(ld_asi_vld_rst[7:0] & lmd_asi_indet[7:0]); 
assign asi_indet_retire = (lmc_lmq0_byp_sel[1] & lmd_asi_indet[0]) |
                          (lmc_lmq1_byp_sel[1] & lmd_asi_indet[1]) |
                          (lmc_lmq2_byp_sel[1] & lmd_asi_indet[2]) |
                          (lmc_lmq3_byp_sel[1] & lmd_asi_indet[3]) |
                          (lmc_lmq4_byp_sel[1] & lmd_asi_indet[4]) |
                          (lmc_lmq5_byp_sel[1] & lmd_asi_indet[5]) |
                          (lmc_lmq6_byp_sel[1] & lmd_asi_indet[6]) |
                          (lmc_lmq7_byp_sel[1] & lmd_asi_indet[7]) ;

assign lmc_asi_indet_retire = asi_indet_retire;

assign asi_indet_in = asi_indet_sel | (asi_indet_block & ~asi_indet_retire);

lsu_lmc_ctlmsff_ctl_macro__width_1 dff_asi_indet  (
	.scan_in(dff_asi_indet_scanin),
	.scan_out(dff_asi_indet_scanout),
	.din    (asi_indet_in),
	.dout   (asi_indet_block),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Data return
////////////////////////////////////////////////////////////////////////////////

// Select the correct thread's LMQ
assign lmc_byp_sel_e[0] = cpq_mx_thread[0] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[0];
assign lmc_byp_sel_e[1] = cpq_mx_thread[1] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[1];
assign lmc_byp_sel_e[2] = cpq_mx_thread[2] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[2];
assign lmc_byp_sel_e[3] = cpq_mx_thread[3] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[3];
assign lmc_byp_sel_e[4] = cpq_mx_thread[4] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[4];
assign lmc_byp_sel_e[5] = cpq_mx_thread[5] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[5];
assign lmc_byp_sel_e[6] = cpq_mx_thread[6] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[6];
assign lmc_byp_sel_e[7] = cpq_mx_thread[7] & cic_cpq_ld_rdy |
                           lmc_thrd_byp_sel_e[7];

lsu_lmc_ctlmsff_ctl_macro__width_3 dff_cpq_tid  (
	.scan_in(dff_cpq_tid_scanin),
	.scan_out(dff_cpq_tid_scanout),
	.din	(cid_tid[2:0]),
	.dout	(lmc_cpq_tid_m[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// LMQ bypassing
////////////////////////////////////////////////////////////////////////////////

assign ld_inst_nopref_b = ld_inst_vld_b & ~pref_inst_b;

lsu_lmc_ctlmsff_ctl_macro__width_4 dff_ld_raw_w  (
	.scan_in(dff_ld_raw_w_scanin),
	.scan_out(dff_ld_raw_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ld_inst_nopref_b,tid_b[2:0]}),
	.dout	({ld_inst_nopref_w,tid_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign ld_inst_unflushed_w = ld_inst_nopref_w & ~flush_w;
assign lmc_ld_inst_w = ld_inst_unflushed_w;

assign ld_raw_bypass_w = ld_inst_unflushed_w & ld_full_raw_w & ~stb_cam_mhit_w & ~ldbl_w;

assign lmc_full_raw_w = ld_raw_bypass_w;

lsu_lmc_ctlmsff_ctl_macro__width_4 dff_ld_raw_w2  (
	.scan_in(dff_ld_raw_w2_scanin),
	.scan_out(dff_ld_raw_w2_scanout),
	.din	({ld_raw_bypass_w, tid_w[2:0]}),
	.dout	({ld_raw_bypass_w2,tid_w2[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_lmc_ctlmsff_ctl_macro__width_4 dff_ld_raw_w3  (
	.scan_in(dff_ld_raw_w3_scanin),
	.scan_out(dff_ld_raw_w3_scanout),
	.din	({ld_raw_bypass_w2,tid_w2[2:0]}),
	.dout	({ld_raw_bypass_w3,tid_w3[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign thread_w3[0] = ~tid_w3[2] & ~tid_w3[1] & ~tid_w3[0];
assign thread_w3[1] = ~tid_w3[2] & ~tid_w3[1] &  tid_w3[0];
assign thread_w3[2] = ~tid_w3[2] &  tid_w3[1] & ~tid_w3[0];
assign thread_w3[3] = ~tid_w3[2] &  tid_w3[1] &  tid_w3[0];
assign thread_w3[4] =  tid_w3[2] & ~tid_w3[1] & ~tid_w3[0];
assign thread_w3[5] =  tid_w3[2] & ~tid_w3[1] &  tid_w3[0];
assign thread_w3[6] =  tid_w3[2] &  tid_w3[1] & ~tid_w3[0];
assign thread_w3[7] =  tid_w3[2] &  tid_w3[1] &  tid_w3[0];

// Select the source to load into the bypass register 
// [0] - swap data for CAS operation
// [1] - load return data from the ASI interface
// [2] - raw bypass from stb
// [3] - ldxa asi read data from registers internal to LSU (left side)
// [4] - ldxa asi read data from registers internal to LSU (right side)
// [5] - error code from L2
assign lmc_lmq0_byp_sel[0] = dcc_casa_inst_b & thread_b[0] & ~(dcc_sync_pipe_w & thread_w[0]) & ~local_flush_b;
assign lmc_lmq1_byp_sel[0] = dcc_casa_inst_b & thread_b[1] & ~(dcc_sync_pipe_w & thread_w[1]) & ~local_flush_b;
assign lmc_lmq2_byp_sel[0] = dcc_casa_inst_b & thread_b[2] & ~(dcc_sync_pipe_w & thread_w[2]) & ~local_flush_b;
assign lmc_lmq3_byp_sel[0] = dcc_casa_inst_b & thread_b[3] & ~(dcc_sync_pipe_w & thread_w[3]) & ~local_flush_b;
assign lmc_lmq4_byp_sel[0] = dcc_casa_inst_b & thread_b[4] & ~(dcc_sync_pipe_w & thread_w[4]) & ~local_flush_b;
assign lmc_lmq5_byp_sel[0] = dcc_casa_inst_b & thread_b[5] & ~(dcc_sync_pipe_w & thread_w[5]) & ~local_flush_b;
assign lmc_lmq6_byp_sel[0] = dcc_casa_inst_b & thread_b[6] & ~(dcc_sync_pipe_w & thread_w[6]) & ~local_flush_b;
assign lmc_lmq7_byp_sel[0] = dcc_casa_inst_b & thread_b[7] & ~(dcc_sync_pipe_w & thread_w[7]) & ~local_flush_b;

assign lmc_lmq0_byp_sel[1] = dcc_asi_rtn_vld[0] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq1_byp_sel[1] = dcc_asi_rtn_vld[1] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq2_byp_sel[1] = dcc_asi_rtn_vld[2] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq3_byp_sel[1] = dcc_asi_rtn_vld[3] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq4_byp_sel[1] = dcc_asi_rtn_vld[4] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq5_byp_sel[1] = dcc_asi_rtn_vld[5] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq6_byp_sel[1] = dcc_asi_rtn_vld[6] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;
assign lmc_lmq7_byp_sel[1] = dcc_asi_rtn_vld[7] & dcc_asi_rtn_rd & ~dcc_asi_rtn_excp;

assign lmc_lmq0_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[0];
assign lmc_lmq1_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[1];
assign lmc_lmq2_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[2];
assign lmc_lmq3_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[3];
assign lmc_lmq4_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[4];
assign lmc_lmq5_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[5];
assign lmc_lmq6_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[6];
assign lmc_lmq7_byp_sel[2] = ld_raw_bypass_w3 & ~(sbdlc_err | sbdlu_err) & thread_w3[7];

assign lmc_lmq0_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[0] & ~flush_w;
assign lmc_lmq1_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[1] & ~flush_w;
assign lmc_lmq2_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[2] & ~flush_w;
assign lmc_lmq3_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[3] & ~flush_w;
assign lmc_lmq4_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[4] & ~flush_w;
assign lmc_lmq5_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[5] & ~flush_w;
assign lmc_lmq6_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[6] & ~flush_w;
assign lmc_lmq7_byp_sel[3] = dcc_lsu_asi_sel_w & thread_w[7] & ~flush_w;

assign lmc_lmq0_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[0];
assign lmc_lmq1_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[1];
assign lmc_lmq2_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[2];
assign lmc_lmq3_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[3];
assign lmc_lmq4_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[4];
assign lmc_lmq5_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[5];
assign lmc_lmq6_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[6];
assign lmc_lmq7_byp_sel[4] = dcc_stb_diag_sel_w3 & thread_w3[7];

assign lmc_lmq_bypass_en[0] = |(lmc_lmq0_byp_sel[4:0]);
assign lmc_lmq_bypass_en[1] = |(lmc_lmq1_byp_sel[4:0]);
assign lmc_lmq_bypass_en[2] = |(lmc_lmq2_byp_sel[4:0]);
assign lmc_lmq_bypass_en[3] = |(lmc_lmq3_byp_sel[4:0]);
assign lmc_lmq_bypass_en[4] = |(lmc_lmq4_byp_sel[4:0]);
assign lmc_lmq_bypass_en[5] = |(lmc_lmq5_byp_sel[4:0]);
assign lmc_lmq_bypass_en[6] = |(lmc_lmq6_byp_sel[4:0]);
assign lmc_lmq_bypass_en[7] = |(lmc_lmq7_byp_sel[4:0]);

// This indicates bypass data ready to bypass back to the registers.
// It should not be valid for CAS/DIAG storage
assign lmq_bypass_vld[0] = |(lmc_lmq0_byp_sel[4:1]);
assign lmq_bypass_vld[1] = |(lmc_lmq1_byp_sel[4:1]);
assign lmq_bypass_vld[2] = |(lmc_lmq2_byp_sel[4:1]);
assign lmq_bypass_vld[3] = |(lmc_lmq3_byp_sel[4:1]);
assign lmq_bypass_vld[4] = |(lmc_lmq4_byp_sel[4:1]);
assign lmq_bypass_vld[5] = |(lmc_lmq5_byp_sel[4:1]);
assign lmq_bypass_vld[6] = |(lmc_lmq6_byp_sel[4:1]);
assign lmq_bypass_vld[7] = |(lmc_lmq7_byp_sel[4:1]);

// Valid tracking
assign ldbyp_vld_en[7:0] = ~ldbyp_rst[7:0] &				// Reset
                            (lmq_bypass_vld[7:0] | ldbyp_vld[7:0]);	// Set/hold

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_ldbyp_vld  (
	.scan_in(dff_ldbyp_vld_scanin),
	.scan_out(dff_ldbyp_vld_scanout),
	.din	(ldbyp_vld_en[7:0]),
	.dout	(ldbyp_vld[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// A valid entry ready for bypass can only go when there are no loads
// in the pipe and no data coming from the CPQ.

assign ld_bypass_ok_d = ~dec_ld_inst_d & ~cic_div_stall_d & ~casa_bypass_d;

lsu_lmc_ctlmsff_ctl_macro__width_1 dff_ld_inst_e  (
	.scan_in(dff_ld_inst_e_scanin),
	.scan_out(dff_ld_inst_e_scanout),
	.din	(ld_bypass_ok_d),
	.dout	(ld_bypass_ok_e),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Because of the low priority of bypass, and because of the fixed thread priority,
// there is a livelock concern.  If a bypass has been ready for eight cycles without
// proceeding, a decode block will be issued to free up the pipe.  The block will
// be removed once the bypass queue clears.

assign byp_cnt_rst = &(~ldbyp_vld[7:0] | lmc_thrd_byp_sel_e[7:0]);
assign byp_cnt_in[2:0] = {3{~byp_cnt_rst}} & (lmc_ld_stall ? byp_cnt[2:0] : (byp_cnt[2:0] + 3'b001));

lsu_lmc_ctlmsff_ctl_macro__width_3 dff_byp_cnt  (
	.scan_in(dff_byp_cnt_scanin),
	.scan_out(dff_byp_cnt_scanout),
	.din	(byp_cnt_in[2:0]),
	.dout	(byp_cnt[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign lmc_ld_stall = &(byp_cnt[2:0]);

assign ld_bypass_e = ld_bypass_ok_e & cic_cpq_ld_rdy_;

assign lmc_thrd_byp_sel_e[0] = ldbyp_vld[0] &                      ld_bypass_e;
assign lmc_thrd_byp_sel_e[1] = ldbyp_vld[1] & ~ldbyp_vld[0] &      ld_bypass_e;
assign lmc_thrd_byp_sel_e[2] = ldbyp_vld[2] & ~(|ldbyp_vld[1:0]) & ld_bypass_e;
assign lmc_thrd_byp_sel_e[3] = ldbyp_vld[3] & ~(|ldbyp_vld[2:0]) & ld_bypass_e;
assign lmc_thrd_byp_sel_e[4] = ldbyp_vld[4] & ~(|ldbyp_vld[3:0]) & ld_bypass_e;
assign lmc_thrd_byp_sel_e[5] = ldbyp_vld[5] & ~(|ldbyp_vld[4:0]) & ld_bypass_e;
assign lmc_thrd_byp_sel_e[6] = ldbyp_vld[6] & ~(|ldbyp_vld[5:0]) & ld_bypass_e;
assign lmc_thrd_byp_sel_e[7] = ldbyp_vld[7] & ~(|ldbyp_vld[6:0]) & ld_bypass_e;

assign byp_vld_e = |(lmc_thrd_byp_sel_e[7:0]);

assign ldbyp_rst[7:0] = lmc_thrd_byp_sel_e[7:0];

// Combine true bypass and a casa issue
assign thrd_byp_sel_e[7:0] = lmc_thrd_byp_sel_e[7:0] | st_atom_p4_dec[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_thrd_byp_sel_m  (
	.scan_in(dff_thrd_byp_sel_m_scanin),
	.scan_out(dff_thrd_byp_sel_m_scanout),
	.din	({    byp_vld_e,thrd_byp_sel_e[7:0]}),
	.dout	({lmc_byp_vld_m,thrd_byp_sel_m[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lmc_thrd_byp_sel_m[7:0] = thrd_byp_sel_m[7:0];

assign lmc_asi_bypass_m = |(thrd_byp_sel_m[7:0] & lmd_asi_ld[7:0]);

assign lmc_byp_tid_m[2] = thrd_byp_sel_m[7] | thrd_byp_sel_m[6] | thrd_byp_sel_m[5] | thrd_byp_sel_m[4];
assign lmc_byp_tid_m[1] = thrd_byp_sel_m[7] | thrd_byp_sel_m[6] | thrd_byp_sel_m[3] | thrd_byp_sel_m[2];
assign lmc_byp_tid_m[0] = thrd_byp_sel_m[7] | thrd_byp_sel_m[5] | thrd_byp_sel_m[3] | thrd_byp_sel_m[1];


////////////////////////////////////////////////////////////////////////////////
// Block load control
// Each incoming block (64B) load instruction must cause four requests to the
// L2 which return 16B each.
////////////////////////////////////////////////////////////////////////////////

assign bld_inst_w[7:0] = {8{blk_inst_w & ld_inst_unflushed_w}} & thread_w[7:0];

assign bld_pending[7:0] = bld_inst_w[7:0] | bld_pend_hold[7:0];

assign bld_pending_in[7:0] = bld_pending[7:0] & ~bld_reset[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_bld_pending  (
	.scan_in(dff_bld_pending_scanin),
	.scan_out(dff_bld_pending_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_pending_in[7:0]),
	.dout	(bld_pend_hold[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign bld_addr54_p3[1:0] = {2{ld_pcx_rq_sel[0]}} & bld_cnt0[1:0] |
                            {2{ld_pcx_rq_sel[1]}} & bld_cnt1[1:0] |
                            {2{ld_pcx_rq_sel[2]}} & bld_cnt2[1:0] |
                            {2{ld_pcx_rq_sel[3]}} & bld_cnt3[1:0] |
                            {2{ld_pcx_rq_sel[4]}} & bld_cnt4[1:0] |
                            {2{ld_pcx_rq_sel[5]}} & bld_cnt5[1:0] |
                            {2{ld_pcx_rq_sel[6]}} & bld_cnt6[1:0] |
                            {2{ld_pcx_rq_sel[7]}} & bld_cnt7[1:0] ;

assign bld_req_p3 = |(ld_pcx_rq_sel[7:0] & bld_pending[7:0]);

lsu_lmc_ctlmsff_ctl_macro__width_3 dff_bld_addr  (
	.scan_in(dff_bld_addr_scanin),
	.scan_out(dff_bld_addr_scanout),
	.l1clk	(l1clk_pm1),
	.din	({bld_addr54_p3[1:0], bld_req_p3}),
	.dout	({lmc_bld_addr54[1:0],lmc_bld_req}),
  .siclk(siclk),
  .soclk(soclk)
);
assign lmc_bld_req_ = ~lmc_bld_req;

// Thread 0

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt0_in[1:0] = bld_cnt0[1:0] + {1'b0,inc_bld0_cnt};
assign inc_bld0_cnt = ld_pcx_rq_sel[0] & ~perr_inv[0] & bld_pending[0];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[0] = ld_pcx_rq_sel[0] & (&(bld_cnt0[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[0] = ~(&(bld_cnt0[1:0])) & bld_pending[0];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt0  (
	.scan_in(dff_bld_cnt0_scanin),
	.scan_out(dff_bld_cnt0_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt0_in[1:0]),
	.dout	(bld_cnt0[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 1

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt1_in[1:0] = bld_cnt1[1:0] + {1'b0,inc_bld1_cnt};
assign inc_bld1_cnt = ld_pcx_rq_sel[1] & ~perr_inv[1] & bld_pending[1];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[1] = ld_pcx_rq_sel[1] & (&(bld_cnt1[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[1] = ~(&(bld_cnt1[1:0])) & bld_pending[1];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt1  (
	.scan_in(dff_bld_cnt1_scanin),
	.scan_out(dff_bld_cnt1_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt1_in[1:0]),
	.dout	(bld_cnt1[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 2

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt2_in[1:0] = bld_cnt2[1:0] + {1'b0,inc_bld2_cnt};
assign inc_bld2_cnt = ld_pcx_rq_sel[2] & ~perr_inv[2] & bld_pending[2];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[2] = ld_pcx_rq_sel[2] & (&(bld_cnt2[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[2] = ~(&(bld_cnt2[1:0])) & bld_pending[2];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt2  (
	.scan_in(dff_bld_cnt2_scanin),
	.scan_out(dff_bld_cnt2_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt2_in[1:0]),
	.dout	(bld_cnt2[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 3

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt3_in[1:0] = bld_cnt3[1:0] + {1'b0,inc_bld3_cnt};
assign inc_bld3_cnt = ld_pcx_rq_sel[3] & ~perr_inv[3] & bld_pending[3];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[3] = ld_pcx_rq_sel[3] & (&(bld_cnt3[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[3] = ~(&(bld_cnt3[1:0])) & bld_pending[3];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt3  (
	.scan_in(dff_bld_cnt3_scanin),
	.scan_out(dff_bld_cnt3_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt3_in[1:0]),
	.dout	(bld_cnt3[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 4

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt4_in[1:0] = bld_cnt4[1:0] + {1'b0,inc_bld4_cnt};
assign inc_bld4_cnt = ld_pcx_rq_sel[4] & ~perr_inv[4] & bld_pending[4];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[4] = ld_pcx_rq_sel[4] & (&(bld_cnt4[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[4] = ~(&(bld_cnt4[1:0])) & bld_pending[4];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt4  (
	.scan_in(dff_bld_cnt4_scanin),
	.scan_out(dff_bld_cnt4_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt4_in[1:0]),
	.dout	(bld_cnt4[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 5

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt5_in[1:0] = bld_cnt5[1:0] + {1'b0,inc_bld5_cnt};
assign inc_bld5_cnt = ld_pcx_rq_sel[5] & ~perr_inv[5] & bld_pending[5];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[5] = ld_pcx_rq_sel[5] & (&(bld_cnt5[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[5] = ~(&(bld_cnt5[1:0])) & bld_pending[5];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt5  (
	.scan_in(dff_bld_cnt5_scanin),
	.scan_out(dff_bld_cnt5_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt5_in[1:0]),
	.dout	(bld_cnt5[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 6

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt6_in[1:0] = bld_cnt6[1:0] + {1'b0,inc_bld6_cnt};
assign inc_bld6_cnt = ld_pcx_rq_sel[6] & ~perr_inv[6] & bld_pending[6];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[6] = ld_pcx_rq_sel[6] & (&(bld_cnt6[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[6] = ~(&(bld_cnt6[1:0])) & bld_pending[6];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt6  (
	.scan_in(dff_bld_cnt6_scanin),
	.scan_out(dff_bld_cnt6_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt6_in[1:0]),
	.dout	(bld_cnt6[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Thread 7

// Counter is incremented when the preceeding request was accepted.
assign bld_cnt7_in[1:0] = bld_cnt7[1:0] + {1'b0,inc_bld7_cnt};
assign inc_bld7_cnt = ld_pcx_rq_sel[7] & ~perr_inv[7] & bld_pending[7];

// Reset the bld pending state when the final request is accepted.
assign bld_reset[7] = ld_pcx_rq_sel[7] & (&(bld_cnt7[1:0]));

// Requests 1-3 must prevent the ld_pcx_vld state from being reset so that
// following requests still go to the pcx.
assign bld_hold[7] = ~(&(bld_cnt7[1:0])) & bld_pending[7];

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bld_cnt7  (
	.scan_in(dff_bld_cnt7_scanin),
	.scan_out(dff_bld_cnt7_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bld_cnt7_in[1:0]),
	.dout	(bld_cnt7[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Increment Rd after a load returns (used for QUAD/LDD/BLD)
// This path is also used to update the entry during a set invalidate to
// clear the error code.

assign lmc_rd_update[7:0] = {8{cic_l2fill_vld_e}} & lmc_byp_sel_e[7:0];

assign bld_annul_rst[7:0] = {8{(&lmd_rd_e[2:1] & cic_l2fill_vld_e)}} & lmc_byp_sel_e[7:0];

assign bld_annul_in[7:0] = ~bld_annul_rst[7:0] & (bld_annul[7:0] | bld_inst_w[7:0]);

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_bld_bypass  (
	.scan_in(dff_bld_bypass_scanin),
	.scan_out(dff_bld_bypass_scanout),
	.din	(bld_annul_in[7:0]),
	.dout	(bld_annul[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_load_annul = (cpq_mx_thread[0] & bld_annul[0]) |
                          (cpq_mx_thread[1] & bld_annul[1]) | 
                          (cpq_mx_thread[2] & bld_annul[2]) | 
                          (cpq_mx_thread[3] & bld_annul[3]) | 
                          (cpq_mx_thread[4] & bld_annul[4]) | 
                          (cpq_mx_thread[5] & bld_annul[5]) | 
                          (cpq_mx_thread[6] & bld_annul[6]) | 
                          (cpq_mx_thread[7] & bld_annul[7]) ;

assign lmc_bld_annul = block_load_annul;

// Must track the l2miss behavior for block loads to properly trap &
// write frf on perfmon events.  Block loads will act based on the first
// helper.  If it misses, the entire instruction is considered a miss.

assign bld_miss_set[7:0] = bld_annul[7:0] & cpq_mx_thread[7:0] & {8{lmd_rd_e[2:1] == 2'b00}} & {8{cid_l2miss}};

assign bld_miss_in[7:0] = (bld_miss_set[7:0] | bld_miss[7:0]) &
                          ~({8{report_and_clear_error}} & cpq_mx_thread[7:0]);

assign bld_miss[7:0] = bld_miss_set[7:0] | bld_miss_out[7:0];

assign bld_pass7 = |(bld_annul_rst[7:0]) & ~report_and_clear_error;

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_bld_miss  (
	.scan_in(dff_bld_miss_scanin),
	.scan_out(dff_bld_miss_scanout),
	.din	({bld_miss_in[7:0], bld_pass7}),
	.dout	({bld_miss_out[7:0],bld_pass7_done}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lmc_bld_last_e = bld_pass7_done & report_and_clear_error;

assign lmc_bld_miss_e = (cpq_mx_thread[0] & bld_miss[0]) |
                        (cpq_mx_thread[1] & bld_miss[1]) | 
                        (cpq_mx_thread[2] & bld_miss[2]) | 
                        (cpq_mx_thread[3] & bld_miss[3]) | 
                        (cpq_mx_thread[4] & bld_miss[4]) | 
                        (cpq_mx_thread[5] & bld_miss[5]) | 
                        (cpq_mx_thread[6] & bld_miss[6]) | 
                        (cpq_mx_thread[7] & bld_miss[7]) ;

////////////////////////////////////////////////////////////////////////////////
// Tracking issued prefetches
////////////////////////////////////////////////////////////////////////////////

assign pref_issued[7:0] = (ld_all_sel_p4[7:0] & {8{ld_pcx_sel_p4 & lmd_pcx_pref & ~(early_ld_b_sel_p4 & flush_w)}}) |
                          (thread_w[7:0] & {8{pref_inst_w & excep_only_flush_w}}) ;

lsu_lmc_ctlmsff_ctl_macro__width_8 dff_pref_issued  (
	.scan_in(dff_pref_issued_scanin),
	.scan_out(dff_pref_issued_scanout),
	.din	(pref_issued[7:0]),
	.dout	(lmc_pref_issued[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Figure size mask for loads
// CAS(X)A uses the store format (00001111, 11110000, or 11111111)
// Loads use 00=byte, 01=hw, 10=wd, 11=dw, 100=quad; 5 MSB's are zero
////////////////////////////////////////////////////////////////////////////////

assign lmc_ld_sz[4] = casa_ld_to_pcx & (~lmd_addrb2 | lmd_sz_b0);
assign lmc_ld_sz[3] = casa_ld_to_pcx & (lmd_addrb2 | lmd_sz_b0);
assign lmc_ld_sz[2] = lmc_ld_sz[3] | (lmd_ldbl & lmd_sz_b0);
assign lmc_ld_sz[1] = lmc_ld_sz[3] | (~casa_ld_to_pcx & lmd_sz_b1 & ~lmd_sz_b0) | (~lmd_ldbl & lmd_sz_b1 & lmd_sz_b0);
assign lmc_ld_sz[0] = (casa_ld_to_pcx & lmd_addrb2) | (lmd_ldbl ^ lmd_sz_b0);

////////////////////////////////////////////////////////////////////////////////
// Select hi or low 64b for load return
// For LDD (sz=10), addr[3] determines
// For QUAD (sz=11), first pass is hi, second is low
////////////////////////////////////////////////////////////////////////////////

assign lmc_byp_data_hi = cic_cpq_ld_rdy & ~lmd_fill_addr_b3_e & ~(cic_oddrd_e & lmd_fill_sz_b0_e);

////////////////////////////////////////////////////////////////////////////////
// Clock enable for the bypass/fill data register

assign lmc_byp_data_enable = cic_l2fill_vld_e | byp_vld_e | cic_ext_interrupt;

////////////////////////////////////////////////////////////////////////////////
// Parity errors require an inval request to be sent to L2.
////////////////////////////////////////////////////////////////////////////////

assign perr_set[7:0] = {8{perror_w & ~(ld_raw_bypass_w | flush_w)}} & thread_w[7:0];

assign perr_inv_in[7:0] = perr_inv[7:0] & ~ld_pcx_rq_sel[7:0];

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_perr  (
	.scan_in(dff_perr_scanin),
	.scan_out(dff_perr_scanout),
	.l1clk	(l1clk_pm1),
	.din	({perr_inv_in[7:0], ld_inv_p3}),
	.dout	({perr_inv_out[7:0],ld_inv_p4}),
  .siclk(siclk),
  .soclk(soclk)
);

assign perr_inv[7:0] = perr_inv_out[7:0] | perr_set[7:0];

// INV bit in pcx is asserted for line invalidation requests and for CAS2 packets
// if the store buffer had a UE
assign ld_inv_p3 = |(ld_pcx_rq_sel[7:0] & perr_inv[7:0]) | (sbc_force_inv & casa_bypass_e);

// INV bit is also asserted for prefetch ICE
assign lmc_ld_inv_p4 = ld_inv_p4 | (lmd_pcx_pref & lmd_ldbl);

// Error is reported when the inval_all packet comes back
// encoded error type: 00=valid, 01=tag, 10=mhit, 11=data

assign lsu_dcvp_err_e2 = cic_set_inval & (~lmd_dc_err_e[1] & ~lmd_dc_err_e[0]);
assign lsu_dctp_err_e2 = cic_set_inval & (~lmd_dc_err_e[1] &  lmd_dc_err_e[0]);
assign lsu_dcmh_err_e2 = cic_set_inval & ( lmd_dc_err_e[1] & ~lmd_dc_err_e[0]);
assign lsu_dcdp_err_e2 = cic_set_inval & ( lmd_dc_err_e[1] &  lmd_dc_err_e[0]);

lsu_lmc_ctlmsff_ctl_macro__width_4 dff_dcerr  (
	.scan_in(dff_dcerr_scanin),
	.scan_out(dff_dcerr_scanout),
	.din	({lsu_dcvp_err_e2,lsu_dctp_err_e2,lsu_dcmh_err_e2,lsu_dcdp_err_e2}),
	.dout	({lsu_dcvp_err_g ,lsu_dctp_err_g ,lsu_dcmh_err_g ,lsu_dcdp_err_g }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_dcerr_tid_g[2:0] = lmc_cpq_tid_m[2:0];

// Check that errors are never signaled during normal testing



////////////////////////////////////////////////////////////////////////////////
// L2 errors
// Multi-cycle loads (LDD,BLD) must wait until the final update to report the
// error.  Block loads will stop updating registers once an unc. error is detected.
// If multiple errors of different types are detected on the block load helpers,
// the highest priority error will be reported.  (UE > ND > CE)
////////////////////////////////////////////////////////////////////////////////

assign l2_err[1:0] = ({2{cpq_mx_thread[0]}} & l2_err0[1:0]) |
                     ({2{cpq_mx_thread[1]}} & l2_err1[1:0]) | 
                     ({2{cpq_mx_thread[2]}} & l2_err2[1:0]) | 
                     ({2{cpq_mx_thread[3]}} & l2_err3[1:0]) | 
                     ({2{cpq_mx_thread[4]}} & l2_err4[1:0]) | 
                     ({2{cpq_mx_thread[5]}} & l2_err5[1:0]) | 
                     ({2{cpq_mx_thread[6]}} & l2_err6[1:0]) | 
                     ({2{cpq_mx_thread[7]}} & l2_err7[1:0]) ;

assign l2_err_qual[1] = cic_cpq_ld_rdy & ceter_pscce_cpq &
                        ((cid_err[1] & ~cid_err[0] & cid_dcsoc_err_e  & cerer_socu) |
                         (cid_err[1] & ~cid_err[0] & ~cid_dcsoc_err_e & cerer_dcl2u) |
                         (cid_err[1] &  cid_err[0] & cerer_dcl2nd));

assign l2_err_qual[0] = cic_cpq_ld_rdy &
                        ((~cid_err[1] & cid_err[0] & cid_dcsoc_err_e  & cerer_socc) |
                         (~cid_err[1] & cid_err[0] & ~cid_dcsoc_err_e & cerer_dcl2c) |
                         ( cid_err[1] & cid_err[0] & ceter_pscce_cpq & cerer_dcl2nd));

assign l2_err_new[1] = l2_err[1] | l2_err_qual[1];
assign l2_err_new[0] = (l2_err[0] & ~l2_err_qual[1]) | 
                       (l2_err_qual[1] & l2_err_qual[0]) |
                       (~l2_err[1] & l2_err_qual[0]) |
                       (l2_err[1] & l2_err[0]);

// Suppress register update on any uncorrectable error, including accumulated errors.
assign lmc_l2_err_noup = l2_err_new[1];

// For uncorrectable errors on fill data, inject a parity error into the D$
// Don't need to worry about the accumulated error since LDD & BLD don't fill
// Inject errors even if ceter.pscce is off (for timing reasons).
assign lmc_l2_uerr = (cerer_dcl2u & cid_err[1] & ~cid_err[0]) | (cerer_dcl2nd & cid_err[1] & cid_err[0]);

assign l2_err0_in[1:0] = cpq_mx_thread[0] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err0[1:0];
assign l2_err1_in[1:0] = cpq_mx_thread[1] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err1[1:0];
assign l2_err2_in[1:0] = cpq_mx_thread[2] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err2[1:0];
assign l2_err3_in[1:0] = cpq_mx_thread[3] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err3[1:0];
assign l2_err4_in[1:0] = cpq_mx_thread[4] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err4[1:0];
assign l2_err5_in[1:0] = cpq_mx_thread[5] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err5[1:0];
assign l2_err6_in[1:0] = cpq_mx_thread[6] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err6[1:0];
assign l2_err7_in[1:0] = cpq_mx_thread[7] ? (l2_err_new[1:0] & {2{~report_and_clear_error}}) : l2_err7[1:0];

lsu_lmc_ctlmsff_ctl_macro__width_16 dff_l2errcode  (
	.scan_in(dff_l2errcode_scanin),
	.scan_out(dff_l2errcode_scanout),
	.din	({l2_err0_in[1:0],l2_err1_in[1:0],l2_err2_in[1:0],l2_err3_in[1:0],
		  l2_err4_in[1:0],l2_err5_in[1:0],l2_err6_in[1:0],l2_err7_in[1:0]}),
	.dout	({l2_err0[1:0],   l2_err1[1:0],   l2_err2[1:0],   l2_err3[1:0],
		  l2_err4[1:0],   l2_err5[1:0],   l2_err6[1:0],   l2_err7[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign report_and_clear_error = cic_rtn_cmplt & ~block_load_annul;

assign dcl2c_err  = report_and_clear_error & (~l2_err_new[1] &  l2_err_new[0]);
assign dcl2u_err  = report_and_clear_error & ( l2_err_new[1] & ~l2_err_new[0]);
assign dcl2nd_err = report_and_clear_error & ( l2_err_new[1] &  l2_err_new[0]);

lsu_lmc_ctlmsff_ctl_macro__width_3 dff_l2err  (
	.scan_in(dff_l2err_scanin),
	.scan_out(dff_l2err_scanout),
	.din	({dcl2c_err,      dcl2u_err,      dcl2nd_err}),
	.dout	({lsu_dcl2c_err_g,lsu_dcl2u_err_g,lsu_dcl2nd_err_g}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// STB RAW errors
////////////////////////////////////////////////////////////////////////////////
assign sbdlc_err = ld_raw_bypass_w3 & stb_cecc_err & ~stb_uecc_err & ceter_pscce_w3 & cerer_sbdlc;
assign sbdlu_err = ld_raw_bypass_w3 & stb_uecc_err & ceter_pscce_w3 & cerer_sbdlu;
assign stberr_tid[2:0] = ld_raw_bypass_w3 ? tid_w3[2:0] : sbc_st_sel_tid_p4[2:0];

lsu_lmc_ctlmsff_ctl_macro__width_5 dff_stberr  (
	.scan_in(dff_stberr_scanin),
	.scan_out(dff_stberr_scanout),
	.din	({sbdlc_err,      sbdlu_err,      stberr_tid[2:0]}),
	.dout	({lsu_sbdlc_err_g,lsu_sbdlu_err_g,lsu_stberr_tid_g[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// xinval control
// Because the IFU does not queue incoming packets, there is the possibility
// that they process an ifill which requires D$ invalidation much earlier than
// the LSU.  This causes a problem because the fill will occur and the thread
// could miss again before the D$ inval occurs.  I will signal when an inval
// is pending.  During this time, the I$ will not service a miss from that thread.
////////////////////////////////////////////////////////////////////////////////

assign xinval_pend_in[0] = cic_xinval[0] | (xinval_pend[0] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b000));
assign xinval_pend_in[1] = cic_xinval[1] | (xinval_pend[1] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b001));
assign xinval_pend_in[2] = cic_xinval[2] | (xinval_pend[2] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b010));
assign xinval_pend_in[3] = cic_xinval[3] | (xinval_pend[3] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b011));
assign xinval_pend_in[4] = cic_xinval[4] | (xinval_pend[4] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b100));
assign xinval_pend_in[5] = cic_xinval[5] | (xinval_pend[5] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b101));
assign xinval_pend_in[6] = cic_xinval[6] | (xinval_pend[6] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b110));
assign xinval_pend_in[7] = cic_xinval[7] | (xinval_pend[7] & ~(cpq_xinval_m & lmc_cpq_tid_m[2:0] == 3'b111));

lsu_lmc_ctlmsff_ctl_macro__width_9 dff_xinval_pend  (
	.scan_in(dff_xinval_pend_scanin),
	.scan_out(dff_xinval_pend_scanout),
	.din	({xinval_pend_in[7:0],cic_xinval_e}),
	.dout	({xinval_pend[7:0],   cpq_xinval_m}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_ifu_no_miss[7:0] = xinval_pend[7:0];

////////////////////////////////////////////////////////////////////////////////
// Power management.
// lmc has 2 clock domains.
// 1. Free running (l1clk)
// 2. Any load request pending (l1clk_pm1)
// A third possible domain which represends any load miss outstanding could
// gate ~50 flops but would require adding 8 flops and logic.  Not worth it.
////////////////////////////////////////////////////////////////////////////////

assign rqpend_clken = ~lsu_lsu_pmen | ld_inst_vld_b | ld_inst_nopref_w | pref_inst_w |
                      (|(ld_pcx_vld[7:0])) | (|(ld_asi_vld[7:0])) | (|(ld_all_sel_p4[7:0]));


////////////////////////////////////////////////////////////////////////////////
// BIST/DIAG
////////////////////////////////////////////////////////////////////////////////

lsu_lmc_ctlmsff_ctl_macro__width_2 dff_bist_diag  (
	.scan_in(dff_bist_diag_scanin),
	.scan_out(dff_bist_diag_scanout),
	.din	({mbi_run,    bist_or_diag_d}),
	.dout	({lmc_mbi_run,lmc_bist_or_diag_e}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bist_or_diag_d = lmc_mbi_run | dcc_cache_diag_wr_b;

lsu_lmc_ctlmsff_ctl_macro__scanreverse_1__width_6 dff_spares   (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.din	({ld_inst_vld_b,5'b0       }),
	.dout	({ld_inst_vld_w,unused[4:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//spare_ctl_macro spares (num=6) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk	(l1clk)
//);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_ceter_scanin          = scan_in                  ;
assign dff_cerer_scanin          = dff_ceter_scanout        ;
assign dff_thread_w_scanin       = dff_cerer_scanout        ;
assign dff_flush_b_scanin        = dff_thread_w_scanout     ;
assign dff_flush_w_scanin        = dff_flush_b_scanout      ;
assign dff_inst_b_scanin         = dff_flush_w_scanout      ;
assign dff_inst_w_scanin         = dff_inst_b_scanout       ;
assign dff_l2fill_scanin         = dff_inst_w_scanout       ;
assign dff_unfilled_scanin       = dff_l2fill_scanout       ;
assign dff_stb_raw_scanin        = dff_unfilled_scanout     ;
assign dff_rawp_disable_scanin   = dff_stb_raw_scanout      ;
assign dff_ldd_vld_scanin        = dff_rawp_disable_scanout ;
assign dff_ld_lmq_en_b_scanin    = dff_ldd_vld_scanout      ;
assign dff_ld_pcx_vld_scanin     = dff_ld_lmq_en_b_scanout  ;
assign dff_ld_asi_vld_scanin     = dff_ld_pcx_vld_scanout   ;
assign lru8_scanin               = dff_ld_asi_vld_scanout   ;
assign dff_ld_sel_scanin         = lru8_scanout             ;
assign dff_ldd_out_scanin        = dff_ld_sel_scanout       ;
assign dff_st_atom_p4_scanin     = dff_ldd_out_scanout      ;
assign dff_st_atom_p5_scanin     = dff_st_atom_p4_scanout   ;
assign dff_asi_indet_scanin      = dff_st_atom_p5_scanout   ;
assign dff_cpq_tid_scanin        = dff_asi_indet_scanout    ;
assign dff_ld_raw_w_scanin       = dff_cpq_tid_scanout      ;
assign dff_ld_raw_w2_scanin      = dff_ld_raw_w_scanout     ;
assign dff_ld_raw_w3_scanin      = dff_ld_raw_w2_scanout    ;
assign dff_ldbyp_vld_scanin      = dff_ld_raw_w3_scanout    ;
assign dff_ld_inst_e_scanin      = dff_ldbyp_vld_scanout    ;
assign dff_byp_cnt_scanin        = dff_ld_inst_e_scanout    ;
assign dff_thrd_byp_sel_m_scanin = dff_byp_cnt_scanout      ;
assign dff_bld_pending_scanin    = dff_thrd_byp_sel_m_scanout;
assign dff_bld_addr_scanin       = dff_bld_pending_scanout  ;
assign dff_bld_cnt0_scanin       = dff_bld_addr_scanout     ;
assign dff_bld_cnt1_scanin       = dff_bld_cnt0_scanout     ;
assign dff_bld_cnt2_scanin       = dff_bld_cnt1_scanout     ;
assign dff_bld_cnt3_scanin       = dff_bld_cnt2_scanout     ;
assign dff_bld_cnt4_scanin       = dff_bld_cnt3_scanout     ;
assign dff_bld_cnt5_scanin       = dff_bld_cnt4_scanout     ;
assign dff_bld_cnt6_scanin       = dff_bld_cnt5_scanout     ;
assign dff_bld_cnt7_scanin       = dff_bld_cnt6_scanout     ;
assign dff_bld_bypass_scanin     = dff_bld_cnt7_scanout     ;
assign dff_bld_miss_scanin       = dff_bld_bypass_scanout   ;
assign dff_pref_issued_scanin    = dff_bld_miss_scanout     ;
assign dff_perr_scanin           = dff_pref_issued_scanout  ;
assign dff_dcerr_scanin          = dff_perr_scanout         ;
assign dff_l2errcode_scanin      = dff_dcerr_scanout        ;
assign dff_l2err_scanin          = dff_l2errcode_scanout    ;
assign dff_stberr_scanin         = dff_l2err_scanout        ;
assign dff_xinval_pend_scanin    = dff_stberr_scanout       ;
assign dff_bist_diag_scanin      = dff_xinval_pend_scanout  ;
assign spares_scanin             = dff_bist_diag_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_lmc_ctll1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_1 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule






// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_lmc_ctlmsff_ctl_macro__scanreverse_1__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [0:4] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({so[0:4],scan_in}),
.so({scan_out,so[0:4]}),
.q(dout[5:0])
);












endmodule








