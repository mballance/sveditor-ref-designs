// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu_rml_ctl.v
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
`define BUS_CTL 64
`define BUS_VLD 63
`define BUS_ACK 62
`define BUS_REGID_END 61
`define BUS_REGID_ST 60
`define BUS_RD  59
`define BUS_TID_END 58
`define BUS_TID_ST 56
`define BUS_ASI_END 55
`define BUS_ASI_ST 48
`define ASI  2'b00
`define ASR  2'b01
`define PR   2'b10


module exu_rml_ctl (
  l2clk, 
  scan_in, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_aclk_wmr, 
  tcu_scan_en, 
  dec_tid_p, 
  dec_inst_d, 
  dec_valid_e, 
  dec_thread_group, 
  tlu_flush_exu_b, 
  dec_flush_m, 
  dec_flush_b, 
  tlu_gl_thr0, 
  tlu_gl_thr1, 
  tlu_gl_thr2, 
  tlu_gl_thr3, 
  tlu_ccr_cwp_valid, 
  tlu_ccr_cwp_tid, 
  tlu_cwp, 
  mbi_run, 
  mbi_addr, 
  mbi_irf_read_en, 
  mbi_irf_save_en, 
  mbi_irf_restore_en, 
  edp_rng_in_ff, 
  edp_rd_ff_w, 
  ect_misaligned_error_m, 
  ect_yreg_wr_w, 
  ect_tid_lth_w, 
  exu_lsu_va_error_m, 
  exu_ecc_m, 
  edp_rs3_ecc_e, 
  ect_tg_clken, 
  exu_y_data_e, 
  exu_fill_m, 
  exu_spill_b, 
  exu_normal_b, 
  exu_cleanwin_b, 
  exu_wstate_b, 
  exu_cwp_thr0, 
  exu_cwp_thr1, 
  exu_cwp_thr2, 
  exu_cwp_thr3, 
  exu_oddwin_b, 
  exu_window_block_m, 
  exu_tlu_window_block, 
  exu_ecc_winop_flush_m, 
  exu_test_valid, 
  exu_test_tid, 
  exu_test_addr, 
  rml_test_valid_d, 
  rml_rng_data_out, 
  rml_rng_rd_ctl, 
  rml_rng_ack_ctl, 
  rml_rng_ack_cwp_tid, 
  rml_rng_ack_ecc_tid, 
  rml_rng_ack_det_vld, 
  rml_rng_wt_imask_ctl, 
  rml_rng_wt_ccr_ctl, 
  rml_irf_ecc_data, 
  rml_rng_ack_sel_ctl, 
  rml_rng_y_data, 
  rml_irf_cwpswap_tid_m, 
  rml_irf_old_lo_cwp_m, 
  rml_irf_old_e_cwp_m, 
  rml_irf_cwpswap_tid_b, 
  rml_irf_new_lo_cwp_b, 
  rml_irf_new_e_cwp_b, 
  rml_irf_save_even_m, 
  rml_irf_save_odd_m, 
  rml_irf_save_local_m, 
  rml_irf_restore_even_b, 
  rml_irf_restore_odd_b, 
  rml_irf_restore_local_b, 
  rml_irf_global_tid, 
  rml_irf_global_tid_ff, 
  rml_irf_old_agp, 
  rml_irf_new_agp_ff, 
  rml_irf_save_global, 
  rml_irf_restore_global, 
  scan_out, 
  wmr_scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm1;
wire mbist_scanin;
wire mbist_scanout;
wire mbi_irf_save_en_p1;
wire mbi_irf_restore_en_p1;
wire mbi_run_lth;
wire mbi_irf_read_en_p1;
wire [9:0] mbi_addr_lth;
wire mbi_irf_save_en_p2;
wire mbi_irf_restore_en_p2;
wire cwp_trap_scanin;
wire cwp_trap_scanout;
wire trap_ccr_cwp_valid;
wire [1:0] trap_ccr_cwp_tid;
wire [2:0] trap_cwp;
wire [31:13] inst;
wire d_return;
wire d_save;
wire d_restore;
wire d_flushw;
wire d_saved;
wire d_restored;
wire d_allclean;
wire d_otherw;
wire d_normalw;
wire d_invalw;
wire decoded_inst_d2e_scanin;
wire decoded_inst_d2e_scanout;
wire return_e;
wire save_e;
wire restore_e;
wire flushw_e;
wire saved_e;
wire restored_e;
wire allclean_e;
wire otherw_e;
wire normalw_e;
wire invalw_e;
wire decoded_inst_e2m_scanin;
wire decoded_inst_e2m_scanout;
wire return_m;
wire save_m;
wire restore_m;
wire flushw_m;
wire saved_m;
wire restored_m;
wire allclean_m;
wire otherw_m;
wire normalw_m;
wire invalw_m;
wire decoded_inst_m2b_scanin;
wire decoded_inst_m2b_scanout;
wire return_b;
wire save_b;
wire restore_b;
wire saved_b;
wire restored_b;
wire allclean_b;
wire otherw_b;
wire normalw_b;
wire invalw_b;
wire decoded_inst_b2w_scanin;
wire decoded_inst_b2w_scanout;
wire return_w;
wire save_w;
wire restore_w;
wire saved_w;
wire restored_w;
wire allclean_w;
wire otherw_w;
wire normalw_w;
wire invalw_w;
wire [3:0] tid4_d;
wire [1:0] tid_d;
wire tid_p2d2e2m2b2w_scanin;
wire tid_p2d2e2m2b2w_scanout;
wire [1:0] tid_e;
wire [1:0] tid_m;
wire [1:0] tid_b;
wire [1:0] tid_w;
wire [3:0] tid4_e;
wire inst_vld_e2m2b2w_scanin;
wire inst_vld_e2m2b2w_scanout;
wire inst_vld_e;
wire inst_vld_m;
wire inst_vld_b;
wire inst_vld_noflush_m;
wire inst_vld_noflush_b;
wire inst_vld_w;
wire exception_detected_m;
wire spill_detected_m;
wire cleanwin_detected_m;
wire address_error_detected_m;
wire exception_detected_m2b_scanin;
wire exception_detected_m2b_scanout;
wire exception_detected_b;
wire flush_exu_b2w_scanin;
wire flush_exu_b2w_scanout;
wire flush_exu_w;
wire dec_flush_w;
wire cansave_is0_m;
wire [2:0] cansave_m;
wire canrestore_is0_m;
wire [2:0] canrestore_m;
wire otherwin_is0_m;
wire [2:0] otherwin_m;
wire cleanwin4save_is0_m;
wire [2:0] cleanwin_m;
wire noflushwin_m;
wire spill_m;
wire cleanwin_exception_m;
wire return_consider_m;
wire exception_report_m2b_scanin;
wire exception_report_m2b_scanout;
wire spill_b;
wire cleanwin_exception_b;
wire otherwin_is0_b;
wire [5:0] wstate_b;
wire block_wrcwp;
wire wrcwp_in_play_in;
wire detected_wrpr_cwp;
wire wrcwp_in_play;
wire wrcwp_in_playf_scanin;
wire wrcwp_in_playf_scanout;
wire actual_wrpr_cwp;
wire pr_wt_ff_scanin;
wire pr_wt_ff_scanout;
wire actual_wrpr_cwp_d;
wire actual_wrpr_cwp_e;
wire pr_wt_m;
wire trap_ccr_cwp_ff_scanin;
wire trap_ccr_cwp_ff_scanout;
wire trap_ccr_cwp_valid_d;
wire trap_ccr_cwp_valid_e;
wire trap_ccr_cwp_valid_m;
wire make_2nd_window_slot;
wire ack_wrpr_cwp_done;
wire rd_irf_ecc_valid;
wire rd_irf_ecc_valid_lth;
wire [2:0] cwp_dec1_m;
wire [2:0] cwp_m;
wire [2:0] cwp_inc1_m;
wire [2:1] cwp_inc2_m;
wire [2:0] cwp_inc2_cansave_m;
wire [1:0] slot_tid_m;
wire [1:0] wrpr_cwp_tid_hold;
wire winblock_slot_tid_m2d2e2m_scanin;
wire winblock_slot_tid_m2d2e2m_scanout;
wire [1:0] slot_tid_d;
wire [1:0] slot_tid_e;
wire [1:0] old_lo_tid_m;
wire old_lo_fetch_m;
wire [2:0] cwp_thr0;
wire [2:0] cwp_thr1;
wire [2:0] cwp_thr2;
wire [2:0] cwp_thr3;
wire [2:0] old_lo_cwp_inc1_m;
wire old_lo_cwp_inc1_m_unused;
wire [2:0] slot_old_cwp_inc1_m;
wire slot_old_cwp_inc1_m_unused;
wire [2:0] slot_new_cwp_inc1_m;
wire [2:0] rml_irf_new_lo_cwp_m;
wire slot_new_cwp_inc1_m_unused;
wire [2:0] pr_new_cwp_wt;
wire [2:1] new_e_cwp_m;
wire i_rml_restore_en_ff_scanin;
wire i_rml_restore_en_ff_scanout;
wire [1:0] rml_irf_new_agp;
wire rml_irf_restore_even_b_ff;
wire rml_irf_restore_odd_b_ff;
wire rml_irf_restore_local_b_ff;
wire rml_irf_restore_global_ff;
wire [1:0] raw_irf_cwpswap_tid_b;
wire [2:1] raw_irf_new_e_cwp_b;
wire [2:0] raw_irf_new_lo_cwp_b;
wire cwp_update_m;
wire [1:0] cwp_tid_m;
wire [2:0] cwp_new_m;
wire cwp_m2b_scanin;
wire cwp_m2b_scanout;
wire [1:0] cwp_tid_b;
wire [2:0] cwp_new_b;
wire cwp_update_b;
wire cwp_update_no_flush_exu_b;
wire cwp_b2w_scanin;
wire cwp_b2w_scanout;
wire [1:0] cwp_tid_w;
wire [2:0] cwp_new_w;
wire cwp_update_w;
wire [2:0] cwp_next_w;
wire [3:0] cwp_we_w;
wire [3:0] cwp_pr_we;
wire [2:0] cwp_thr0_next;
wire [2:0] cwp_thr1_next;
wire [2:0] cwp_thr2_next;
wire [2:0] cwp_thr3_next;
wire gl_changed_thr0;
wire [1:0] gl_thr0;
wire gl_changed_thr1;
wire [1:0] gl_thr1;
wire gl_changed_thr2;
wire [1:0] gl_thr2;
wire gl_changed_thr3;
wire [1:0] gl_thr3;
wire [3:0] gl_we;
wire [1:0] gl_tid;
wire gl_changed;
wire [1:0] gl_thr0_next;
wire [1:0] gl_thr1_next;
wire [1:0] gl_thr2_next;
wire [1:0] gl_thr3_next;
wire old_gl_ptr_wmr_scanin;
wire old_gl_ptr_wmr_scanout;
wire [2:0] cansave_dec1_w;
wire [2:0] cansave_w;
wire [2:0] cansave_inc1_w;
wire [2:0] canrestore_dec1_w;
wire [2:0] canrestore_w;
wire [2:0] canrestore_inc1_w;
wire [2:0] otherwin_dec1_w;
wire [2:0] otherwin_w;
wire [2:0] cleanwin_inc1_w;
wire [2:0] cleanwin_w;
wire otherwin_is0_w;
wire cleanwin_is111_w;
wire cansave_inc_w;
wire cansave_dec_w;
wire cansave_reset_w;
wire cansave_update_w;
wire [2:0] cansave_next_w;
wire [3:0] cansave_we_w;
wire [3:0] cansave_pr_we;
wire [1:0] pr_tid_ctl;
wire pr_wt_cansave_ctl;
wire canrestore_inc_w;
wire canrestore_dec_w;
wire canrestore_0_w;
wire canrestore_otherwin_w;
wire canrestore_update_w;
wire [2:0] canrestore_next_w;
wire [2:0] canrestore_normalwin_data_w;
wire [2:0] otherwin_thr0;
wire [2:0] otherwin_thr1;
wire [2:0] otherwin_thr2;
wire [2:0] otherwin_thr3;
wire [3:0] canrestore_we_w;
wire [3:0] canrestore_pr_we;
wire pr_wt_canrestore_ctl;
wire otherwin_dec_w;
wire otherwin_0_w;
wire otherwin_canrestore_w;
wire otherwin_update_w;
wire [2:0] otherwin_next_w;
wire [2:0] otherwin_otherw_data_w;
wire [3:0] otherwin_we_w;
wire [2:0] canrestore_thr0;
wire [2:0] canrestore_thr1;
wire [2:0] canrestore_thr2;
wire [2:0] canrestore_thr3;
wire [3:0] otherwin_pr_we;
wire pr_wt_otherwin_ctl;
wire cleanwin_inc_w;
wire cleanwin_reset_w;
wire cleanwin_update_w;
wire [2:0] cleanwin_next_w;
wire [3:0] cleanwin_we_w;
wire [3:0] cleanwin_pr_we;
wire pr_wt_cleanwin_ctl;
wire [3:0] wstate_pr_we;
wire pr_wt_wstate_ctl;
wire [3:0] cwp_new_update;
wire [3:0] cwp_flushed;
wire [3:0] cwp_oddwin_next;
wire [3:0] cwp_oddwin_b;
wire cwp_speculative_scanin;
wire cwp_speculative_scanout;
wire [2:0] cansave_thr0_next;
wire [63:0] data_1f;
wire [2:0] cansave_thr0;
wire [2:0] cansave_thr1_next;
wire [2:0] cansave_thr1;
wire [2:0] cansave_thr2_next;
wire [2:0] cansave_thr2;
wire [2:0] cansave_thr3_next;
wire [2:0] cansave_thr3;
wire [2:1] cansave_thr0_next_l;
wire [2:1] cansave_thr1_next_l;
wire [2:1] cansave_thr2_next_l;
wire [2:1] cansave_thr3_next_l;
wire cansave_pr_wmr_scanin;
wire cansave_pr_wmr_scanout;
wire [2:1] cansave_thr0_l;
wire [2:1] cansave_thr1_l;
wire [2:1] cansave_thr2_l;
wire [2:1] cansave_thr3_l;
wire [2:0] cansave_e;
wire [2:0] cansave_pr_rd;
wire cansave_e2m2b2w_scanin;
wire cansave_e2m2b2w_scanout;
wire [2:0] cansave_b;
wire [2:0] canrestore_thr0_next;
wire [2:0] canrestore_thr1_next;
wire [2:0] canrestore_thr2_next;
wire [2:0] canrestore_thr3_next;
wire canrestore_pr_wmr_scanin;
wire canrestore_pr_wmr_scanout;
wire [2:0] canrestore_e;
wire [2:0] canrestore_pr_rd;
wire canrestore_e2m2b2w_scanin;
wire canrestore_e2m2b2w_scanout;
wire [2:0] canrestore_b;
wire [2:0] otherwin_thr0_next;
wire [2:0] otherwin_thr1_next;
wire [2:0] otherwin_thr2_next;
wire [2:0] otherwin_thr3_next;
wire otherwin_pr_wmr_scanin;
wire otherwin_pr_wmr_scanout;
wire [2:0] otherwin_e;
wire [2:0] otherwin_pr_rd;
wire otherwin_e2m2b2w_scanin;
wire otherwin_e2m2b2w_scanout;
wire [2:0] otherwin_b;
wire [2:0] cleanwin_thr0_next;
wire [2:0] cleanwin_thr0;
wire [2:0] cleanwin_thr1_next;
wire [2:0] cleanwin_thr1;
wire [2:0] cleanwin_thr2_next;
wire [2:0] cleanwin_thr2;
wire [2:0] cleanwin_thr3_next;
wire [2:0] cleanwin_thr3;
wire [2:0] cleanwin_thr0_next_l;
wire [2:0] cleanwin_thr1_next_l;
wire [2:0] cleanwin_thr2_next_l;
wire [2:0] cleanwin_thr3_next_l;
wire cleanwin_pr_wmr_scanin;
wire cleanwin_pr_wmr_scanout;
wire [2:0] cleanwin_thr0_l;
wire [2:0] cleanwin_thr1_l;
wire [2:0] cleanwin_thr2_l;
wire [2:0] cleanwin_thr3_l;
wire [2:0] cleanwin_e;
wire [2:0] cleanwin_pr_rd;
wire cleanwin_e2m2b2w_scanin;
wire cleanwin_e2m2b2w_scanout;
wire [2:0] cleanwin_b;
wire [5:0] wstate_thr0_next;
wire [5:0] wstate_thr0;
wire [5:0] wstate_thr1_next;
wire [5:0] wstate_thr1;
wire [5:0] wstate_thr2_next;
wire [5:0] wstate_thr2;
wire [5:0] wstate_thr3_next;
wire [5:0] wstate_thr3;
wire wstate_pr_wmr_scanin;
wire wstate_pr_wmr_scanout;
wire [5:0] wstate_pr_rd;
wire cwp_pr_wmr_scanin;
wire cwp_pr_wmr_scanout;
wire [2:0] cwp_e;
wire [2:0] cwp_pr_rd;
wire cwp_e2m2b2w_scanin;
wire cwp_e2m2b2w_scanout;
wire ctl_1f;
wire pr_relevent;
wire asr_relevent;
wire asi_relevent;
wire detected_empty_pkt;
wire [1:0] pr_tid;
wire match_cwp;
wire match_cansave;
wire match_canrestore;
wire match_cleanwin;
wire match_otherwin;
wire match_wstate;
wire match_yreg;
wire match_ccr;
wire match_imask;
wire match_irf_ecc;
wire pr_rd;
wire [1:0] send_ack;
wire [5:0] pr_rd_src;
wire [5:0] pr_wt_src;
wire detected_rd_irf_ecc;
wire [4:0] rd_irf_ecc_addr;
wire [4:0] pr_addr_ctl;
wire pipe_rd_irf_ecc_valid_pp2p2d2e_scanin;
wire pipe_rd_irf_ecc_valid_pp2p2d2e_scanout;
wire test_valid_p;
wire ack_irf_ecc_done;
wire [1:0] wrpr_cwp_tid_next;
wire save_wrpr_cwp_tid_scanin;
wire save_wrpr_cwp_tid_scanout;
wire [1:0] rd_irf_tid_next;
wire [1:0] rd_irf_tid_hold;
wire save_rd_irf_tid_scanin;
wire save_rd_irf_tid_scanout;
wire pr_wt_cwp_ctl;
wire [2:0] pr_new_cwp_wt_hold;
wire save_wrpr_cwp_scanin;
wire save_wrpr_cwp_scanout;
wire send_ack_wrpr_cwp;
wire done_wrpr_cwp_hold;
wire done_wrpr_cwp;
wire save_done_wrpr_cwp_scanin;
wire save_done_wrpr_cwp_scanout;
wire send_ack_irf_ecc;
wire done_irf_ecc_hold;
wire done_irf_ecc;
wire save_done_irf_ecc_scanin;
wire save_done_irf_ecc_scanout;
wire [7:0] irf_ecc_data;
wire [7:0] irf_ecc_data_hold;
wire save_irf_ecc_data_scanin;
wire save_irf_ecc_data_scanout;
wire pipe_ack_irf_ecc_scanin;
wire pipe_ack_irf_ecc_scanout;
wire send_ack_irf_ecc_piped;
wire [2:0] asr_rd_src;
wire [2:0] asr_wt_src;
wire asr_ctl_scanin;
wire asr_ctl_scanout;
wire pr_rd_ctl;
wire [5:0] pr_rd_src_ctl;
wire asi_rd_imask_ctl;
wire asr_rd_ccr_ctl;
wire asr_rd_yreg_ctl;
wire asi_wt_imask_ctl;
wire asr_wt_ccr_ctl;
wire asr_wt_yreg_ctl;
wire l1clk_pm2;
wire [3:0] yreg_rng_we;
wire [3:0] yreg_w_we;
wire [31:0] arch_yreg_tid0_in;
wire [31:0] arch_yreg_tid0_ff;
wire [31:0] arch_yreg_tid1_in;
wire [31:0] arch_yreg_tid1_ff;
wire [31:0] arch_yreg_tid2_in;
wire [31:0] arch_yreg_tid2_ff;
wire [31:0] arch_yreg_tid3_in;
wire [31:0] arch_yreg_tid3_ff;
wire i_yreg0_ff_wmr_scanin;
wire i_yreg0_ff_wmr_scanout;
wire i_yreg1_ff_wmr_scanin;
wire i_yreg1_ff_wmr_scanout;
wire i_yreg2_ff_wmr_scanin;
wire i_yreg2_ff_wmr_scanout;
wire i_yreg3_ff_wmr_scanin;
wire i_yreg3_ff_wmr_scanout;
wire spares_scanin;
wire spares_scanout;


// *** Global Inputs ***

input		l2clk;
input 		scan_in;
input		wmr_scan_in;
input 		tcu_pce_ov;			// scan signals
input 		spc_aclk;
input 		spc_bclk;
input		spc_aclk_wmr;
input		tcu_scan_en;


input  [1:0]	dec_tid_p;			// thread ID in pick stage
input  [31:13]	dec_inst_d;			// WARNING: Instruction for full decode
input        	dec_valid_e;			// Inst is truly valid at e
input        	dec_thread_group;		// Static Signal : Tie 1 or 0 where cloning

input       	tlu_flush_exu_b;		// FROM TLU : flushes inst in B-stage   ===> late signal

input		dec_flush_m;			// flush signal to invalidate inst in M ===> late signal

input		dec_flush_b;			// flush signal to invalidate inst in B

input   [1:0]   tlu_gl_thr0;			// FROM TLU : current GL value to update
input   [1:0]   tlu_gl_thr1;			// FROM TLU : current GL value to update
input   [1:0]   tlu_gl_thr2;			// FROM TLU : current GL value to update
input   [1:0]   tlu_gl_thr3;			// FROM TLU : current GL value to update

input   	tlu_ccr_cwp_valid;		// FROM TLU : done/retry CWP updates
input   [1:0]	tlu_ccr_cwp_tid;		// FROM TLU : done/retry CWP updates
input   [2:0]   tlu_cwp;			// FROM TLU : done/retry CWP updates

input		mbi_run; 			// MBIST
input  [9:0]	mbi_addr; 			// MBIST
input		mbi_irf_read_en; 		// MBIST
input		mbi_irf_save_en;		// MBIST
input		mbi_irf_restore_en;		// MBIST


// *** Local  Inputs ***
input  [64:0] 	edp_rng_in_ff;			// 65 bit control/data bus to the ASI 

input  [63:32]	edp_rd_ff_w;			// Yreg write data

input 		ect_misaligned_error_m;		// assert when last 2 bit of address is non "00"

input		ect_yreg_wr_w;
input  [1:0]	ect_tid_lth_w;

input		exu_lsu_va_error_m;		// Address out-of-range

input		exu_ecc_m;			// exu ecc errors detected

input  [7:0]	edp_rs3_ecc_e;                  // ECC syndrom bits for irf_ecc ASI read

input		ect_tg_clken;			// Power Management



// *** Global Outputs ***

output [31:0]	exu_y_data_e;

output     	exu_fill_m;			// To TLU : report window fill  exception
output    	exu_spill_b;			// To TLU : report window spill exception 
output     	exu_normal_b;			// To TLU : report window spill/fill exception type
                                                //    (4 signals above: 1 gate after flop
                                                //                   early signals)
output     	exu_cleanwin_b;			// To TLU : report clean window exception
                                                //    (straight out of flop, early signal)
output	[2:0]	exu_wstate_b;			// To TLU : report fill/spill vector to use
						//          - if otherwin=0: wstate.normal
						//          - else         : wstate.other
                                                //    (2 gate after flop, early)
output	[2:0]	exu_cwp_thr0;			// To TLU : Current Window Pointer for thr0
output	[2:0]	exu_cwp_thr1;			// To TLU : Current Window Pointer for thr1
output	[2:0]	exu_cwp_thr2;			// To TLU : Current Window Pointer for thr2
output	[2:0]	exu_cwp_thr3;			// To TLU : Current Window Pointer for thr3
                                                // (4 signals above: straight out of flops)

output	[3:0]	exu_oddwin_b;			// To PKU : odd window indicator for 4 thrd

output		exu_window_block_m;		// create bubble for SWAP signal for IRF
output		exu_tlu_window_block;		// create bubble for SWAP signal for IRF

output 		exu_ecc_winop_flush_m;		// To MDP : flush FGU 
						//          ADD part of save/restore
						//          in case of exception 


output 		exu_test_valid;			// To PKU : ASI/BIST read of IRF
output 	[1:0]	exu_test_tid;
output 	[4:0]	exu_test_addr;


// *** Local  Outputs ***

output		rml_test_valid_d;

output  [5:0]   rml_rng_data_out;		// Data for PR read
output 	[4:0] 	rml_rng_rd_ctl;			// To EDP: Control for selecting PR/ASR read source
output 	[1:0] 	rml_rng_ack_ctl;		// To EDP: Control for selecting PR/ASR ack bit
output 	[1:0] 	rml_rng_ack_cwp_tid;		// To EDP: CWP write ack tid
output 	[1:0] 	rml_rng_ack_ecc_tid;		// To EDP: ECC read ack tid
output 	 	rml_rng_ack_det_vld;		// To EDP: Ack valid for deterministic access
output		rml_rng_wt_imask_ctl;		// Enable for ASI write to Instruction mask reg
output  	rml_rng_wt_ccr_ctl;		// Enable for ASR write to CCR
output	[7:0]	rml_irf_ecc_data;		// To EDP: saved irf ECC data for indet. ASI access
output		rml_rng_ack_sel_ctl;		// To EDP: select ack type onto ASI rng 
output	[31:0]	rml_rng_y_data;

output  [1:0]   rml_irf_cwpswap_tid_m;		// To IRF: local/odd/even reg swap thread ID
output	[2:0] 	rml_irf_old_lo_cwp_m;		// To IRF: old local/odd CWP
output  [2:1] 	rml_irf_old_e_cwp_m;		// To IRF: old even CWP

output  [1:0]   rml_irf_cwpswap_tid_b;		// To IRF: local/odd/even reg swap thread ID
output	[2:0] 	rml_irf_new_lo_cwp_b;		// To IRF: new local/odd CWP
output  [2:1] 	rml_irf_new_e_cwp_b;		// To IRF: old even CWP

output		rml_irf_save_even_m;		// To IRF: swap enable for even reg
output		rml_irf_save_odd_m;		// To IRF: swap enable for odd reg
output		rml_irf_save_local_m;		// To IRF: swap enable for local reg

output		rml_irf_restore_even_b;		// To IRF: swap enable for even reg
output		rml_irf_restore_odd_b;		// To IRF: swap enable for odd reg
output		rml_irf_restore_local_b;	// To IRF: swap enable for local reg

output  [1:0]   rml_irf_global_tid;		// To IRF: global reg swap thread ID
output  [1:0]   rml_irf_global_tid_ff;		// To IRF: global reg swap thread ID
output  [1:0]   rml_irf_old_agp;		// To IRF: old global CWP
output  [1:0]   rml_irf_new_agp_ff;		// To IRF: new global CWP
output          rml_irf_save_global;		// To IRF: swap enable for global reg
output          rml_irf_restore_global;		// To IRF: swap enable for global reg

output		scan_out;
output		wmr_scan_out;


// renames
assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se	= tcu_scan_en;


exu_rml_ctl_l1clkhdr_ctl_macro clkgen_pm1	(
 .l2clk( l2clk			),
 .l1en ( ect_tg_clken		),
 .l1clk( l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


// Make sure exception-input are for valid instructions



// Flop all inputs from Mbist engine

exu_rml_ctl_msff_ctl_macro__width_16	mbist			 (
 .scan_in(mbist_scanin),
 .scan_out(mbist_scanout),
 .l1clk( l1clk_pm1			),
 .din  ({mbi_run		,
	 mbi_irf_read_en	,
	 mbi_irf_save_en	,
	 mbi_irf_restore_en	,
	 mbi_addr[9:0]		,
	 mbi_irf_save_en_p1	,
	 mbi_irf_restore_en_p1}		),
 .dout ({mbi_run_lth  ,
	 mbi_irf_read_en_p1 ,
	 mbi_irf_save_en_p1 ,
	 mbi_irf_restore_en_p1 ,
	 mbi_addr_lth[9:0] ,
	 mbi_irf_save_en_p2 ,
	 mbi_irf_restore_en_p2}		),
  .siclk(siclk),
  .soclk(soclk));



// Flop all inputs from the TLU to have the expected timings

exu_rml_ctl_msff_ctl_macro__width_6	cwp_trap		 (
 .scan_in(cwp_trap_scanin),
 .scan_out(cwp_trap_scanout),
 .l1clk(l1clk_pm1),
 .din  ({tlu_ccr_cwp_valid,tlu_ccr_cwp_tid[1:0],tlu_cwp[2:0]}),
 .dout ({trap_ccr_cwp_valid,trap_ccr_cwp_tid[1:0],trap_cwp[2:0]}),
  .siclk(siclk),
  .soclk(soclk));


// Never have tlu assert valid in the same thread trailing each other within 3 cycles



// =============================================================================
// Instruction Flow
// -----------------------------------------------------------------------------
// D stage:       - decode instructions 
//
// E stage:       - read Privileged Registers
//                - acquires instruction valid signal
//                - generate IRF Control signals
//                - checks for Trap conditions
//
// M stage:       - generate IRF Control signals
//                - checks for Trap conditions
//
// B stage:       - report possible trap at beginning of the cycle 
//                - invalidate instruction if it causes a trap
//                - generate Priviledged Registers write-back values
//
// W stage:       - Write-back Priviledged Registers 
//
//                     |----D----|----E----|----M----|----B----|----W----|
//   
// Decode Inst         |<------->|         
// Read PR                     |<->|
// Inst_vld available            ---->]
// IRF ctl                       |<------------->|-> to IRF
// Trap Chk                      |<----------------->|--> to TLU
// Flash Trap                                        |<------->|
// Write-back Gen.                                             |<------->|
// Write back                                  Trap_kil -->|          |<->|



// =============================================================================
// Instrution Decode
// -----------------------------------------------------------------------------

//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Decode       !*!*!*!*!*!*!*!*!*!*
assign inst[31:19]              = dec_inst_d[31:19];
assign inst[13]                 = dec_inst_d[13];

// *** SAVE/RESTORE ***

assign d_return    = (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1001);
assign d_save      = (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1100);
assign d_restore   = (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1101);
assign d_flushw    = (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_1011) & 
                     (inst[13] == 1'b0);

assign d_saved     = (inst[31:19] == 13'b10_00000_11_0001);
assign d_restored  = (inst[31:19] == 13'b10_00001_11_0001);
assign d_allclean  = (inst[31:19] == 13'b10_00010_11_0001);
assign d_otherw    = (inst[31:19] == 13'b10_00011_11_0001);
assign d_normalw   = (inst[31:19] == 13'b10_00100_11_0001);
assign d_invalw    = (inst[31:19] == 13'b10_00101_11_0001);

exu_rml_ctl_msff_ctl_macro__width_10	decoded_inst_d2e	 (
 .scan_in(decoded_inst_d2e_scanin),
 .scan_out(decoded_inst_d2e_scanout),
 .l1clk(l1clk_pm1),
 .din  ({d_return, d_save, d_restore, d_flushw, d_saved, d_restored, d_allclean, d_otherw, d_normalw, d_invalw}),
 .dout ({return_e, save_e, restore_e, flushw_e, saved_e, restored_e, allclean_e, otherw_e, normalw_e, invalw_e}),
  .siclk(siclk),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_10	decoded_inst_e2m	 (
 .scan_in(decoded_inst_e2m_scanin),
 .scan_out(decoded_inst_e2m_scanout),
 .l1clk(l1clk_pm1),
 .din  ({return_e, save_e, restore_e, flushw_e, saved_e, restored_e, allclean_e, otherw_e, normalw_e, invalw_e}),
 .dout ({return_m, save_m, restore_m, flushw_m, saved_m, restored_m, allclean_m, otherw_m, normalw_m, invalw_m}),
  .siclk(siclk),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_9	decoded_inst_m2b	 (
 .scan_in(decoded_inst_m2b_scanin),
 .scan_out(decoded_inst_m2b_scanout),
 .l1clk(l1clk_pm1),
 .din  ({return_m, save_m, restore_m, saved_m, restored_m, allclean_m, otherw_m, normalw_m, invalw_m}),
 .dout ({return_b, save_b, restore_b, saved_b, restored_b, allclean_b, otherw_b, normalw_b, invalw_b}),
  .siclk(siclk),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_9	decoded_inst_b2w	 (
 .scan_in(decoded_inst_b2w_scanin),
 .scan_out(decoded_inst_b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({return_b, save_b, restore_b, saved_b, restored_b, allclean_b, otherw_b, normalw_b, invalw_b}),
 .dout ({return_w, save_w, restore_w, saved_w, restored_w, allclean_w, otherw_w, normalw_w, invalw_w}),
  .siclk(siclk),
  .soclk(soclk));

// check for decoding logic, make sure one opcode is not decoded into 2 inst

//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Decode       !*!*!*!*!*!*!*!*!*!*!




// =============================================================================
// Pass through the control signals
// -----------------------------------------------------------------------------
//                            Timing   vld_e  vld_m  vld_b  vld_w  vld_noflush_w
//  ----------------------------------------------------------------------------
//  
//   + internal exception 
//     - clean_window          early     1      1      0      0        1
//     - fill                  early     1      1      0      0        1
//     - spill                 early     1      1      0      0        1
//     - spill_flush           early     1      1      0      0        1
//
//   + external exceptions
//     - exu_ecc_m             early     1      1      0      0        1
//     - misaligned_noflush_m  early
//       - no other exceptions           1      1      0      0        1
//       - w/ fill exception             1      1   (fill)  (fill)     1
//       - w/ ecc exception              1      1   (ecc)   (ecc)      1
// 
//   + external flushes          
//     - tlu_flush_exu_b       late      1      1      0      0        1
//     - dec_flush_m           late      1      0      0      0        1
//     - dec_flush_b           early     1      1      0      0        1


assign tid4_d[3:0]	= {(tid_d[1:0] == 2'b11),(tid_d[1:0] == 2'b10),(tid_d[1:0] == 2'b01),(tid_d[1:0] == 2'b00)};

exu_rml_ctl_msff_ctl_macro__width_14	tid_p2d2e2m2b2w		 (
 .scan_in(tid_p2d2e2m2b2w_scanin),
 .scan_out(tid_p2d2e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({dec_tid_p[1:0], tid_d[1:0], tid_e[1:0], tid_m[1:0], tid_b[1:0], tid4_d[3:0]}),
 .dout ({    tid_d[1:0], tid_e[1:0], tid_m[1:0], tid_b[1:0], tid_w[1:0], tid4_e[3:0]}),
  .siclk(siclk),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_3	inst_vld_e2m2b2w	 (
 .scan_in(inst_vld_e2m2b2w_scanin),
 .scan_out(inst_vld_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({inst_vld_e,         inst_vld_m,         inst_vld_b}),
 .dout ({inst_vld_noflush_m, inst_vld_noflush_b, inst_vld_w}),
  .siclk(siclk),
  .soclk(soclk));

assign inst_vld_e = dec_valid_e;
assign inst_vld_m = inst_vld_noflush_m & ~dec_flush_m;


// Flushing current instruction
// ------------------------------------------------------
assign exception_detected_m = (spill_detected_m | exu_fill_m | 
                              cleanwin_detected_m | address_error_detected_m |
                              exu_ecc_m) & ~dec_flush_m;

assign exu_ecc_winop_flush_m = ((spill_detected_m | cleanwin_detected_m | 
                               exu_fill_m) & (save_m | restore_m)) | 
                               exu_ecc_m;


exu_rml_ctl_msff_ctl_macro__width_1	exception_detected_m2b	 (
 .scan_in(exception_detected_m2b_scanin),
 .scan_out(exception_detected_m2b_scanout),
 .l1clk(l1clk_pm1),
 .din  ( exception_detected_m ),
 .dout ( exception_detected_b ),
  .siclk(siclk),
  .soclk(soclk));


// Flush current instruction if exception detected or tlu/dec trap flush 
assign inst_vld_b = inst_vld_noflush_b & ~exception_detected_b & ~tlu_flush_exu_b & ~dec_flush_b;


exu_rml_ctl_msff_ctl_macro__width_2	flush_exu_b2w		 (
 .scan_in(flush_exu_b2w_scanin),
 .scan_out(flush_exu_b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({tlu_flush_exu_b, dec_flush_b}),
 .dout ({flush_exu_w,     dec_flush_w}),
  .siclk(siclk),
  .soclk(soclk));



// =============================================================================
// Trap condition detection, flush, and trap vector generation
// -----------------------------------------------------------------------------
// flush window only if CANSAVE != NWINDOWS-2
// noflushwin_m if CANSAVE == NWINDOWS-2 = 6 = 3'b110
//
assign cansave_is0_m    = (~cansave_m[2]) & (~cansave_m[1]) & 
                          (~cansave_m[0]);

assign canrestore_is0_m = (~canrestore_m[2]) & (~canrestore_m[1]) & 
                          (~canrestore_m[0]);

assign otherwin_is0_m   = (~otherwin_m[2]) & (~otherwin_m[1]) & 
                          (~otherwin_m[0]);

assign cleanwin4save_is0_m =  (cleanwin_m[2] ~^ canrestore_m[2]) & 
                              (cleanwin_m[1] ~^ canrestore_m[1]) &
                              (cleanwin_m[0] ~^ canrestore_m[0]);

assign noflushwin_m     = ( cansave_m[2]) & ( cansave_m[1]) & 
                          (~cansave_m[0]);


// xxx_detected_m : exception condition detected, but not qualified with dec_flush_m
// xxx_m          : real exception, qualified with dec_flush_m
// exu_ecc_m exception pre-empt all other exceptions
// fill exception pre-empt misalign exception

// window_spill: no ecc errors detected
//               and:    cansave = 0,     and valid save instruction is issued
//                    or noflushwin_m = 0 and valid flushw instruction is issued
//
assign spill_detected_m = ~exu_ecc_m &
                          (( cansave_is0_m & inst_vld_noflush_m & save_m  ) |
                           (~noflushwin_m  & inst_vld_noflush_m & flushw_m));

// window_fill:  no ecc errors detected
//               and:    canrestore = 0,  and valid restore instruction is issued
//                    or canrestore = 0,  and valid return  instruction is issued
//
assign exu_fill_m  = ~exu_ecc_m &
                          canrestore_is0_m & inst_vld_noflush_m & (restore_m | return_m);

// misaligned_addr: no ecc errors detected
//                  and no fill condition detected
//                  and misalignment flagged by exu_ect_ctl 
//                  and return instruction is issued
//
assign address_error_detected_m = ~exu_ecc_m & ~exu_fill_m & return_m & inst_vld_noflush_m &
                                  (exu_lsu_va_error_m | ect_misaligned_error_m);

// clean_window: no ecc errors detected
//               and cansave != 0, (cleanwin - canrestore) = 0,
//               and a valid save instruction is issued
//
assign cleanwin_detected_m = ~exu_ecc_m &
                          (~cansave_is0_m & cleanwin4save_is0_m & 
                                        inst_vld_noflush_m & save_m);

assign spill_m     = spill_detected_m    & ~dec_flush_m;

assign cleanwin_exception_m  = cleanwin_detected_m & ~dec_flush_m;

// check for exception detection logic, only one exception detected at a time


assign return_consider_m = (return_m & ~ect_misaligned_error_m & ~exu_lsu_va_error_m) | 
                           (return_m &  exu_fill_m);


// Trap vector generation in M-stage and sent to TLU in B-stage
//-------------------------------------------------------------
exu_rml_ctl_msff_ctl_macro__width_3	exception_report_m2b	 (
 .scan_in(exception_report_m2b_scanin),
 .scan_out(exception_report_m2b_scanout),
 .l1clk(l1clk_pm1),
 .din  ({spill_m, cleanwin_exception_m, otherwin_is0_m}),
 .dout ({spill_b, cleanwin_exception_b, otherwin_is0_b}),
  .siclk(siclk),
  .soclk(soclk));

assign exu_cleanwin_b = cleanwin_exception_b;

assign exu_spill_b  = spill_b;
assign exu_normal_b = otherwin_is0_b;

assign exu_wstate_b[2:0] = ({3{ otherwin_is0_b}} & wstate_b[2:0]) |
                           ({3{~otherwin_is0_b}} & wstate_b[5:3]);



// =============================================================================
// Managing window block signal to decode
// -----------------------------------------------------------------------------
// Creating holes for full window swaps
// - first hole 
//   - available with any window ops
//   - need to create for WRPR to CWP
//   - cannot kick off a wrpr_cwp if tlu is initiating a window change the 
//     same cycle, second part of the tlu window change could conflict with 
//     the first part of the wrpr_cwp
//
// - second hole  
//   - conditions that triggers exu_window_block_m to block a potential conflicting 
//     window operation come down the pipeline in another thread
//     - spills caused by save and flushw
//   - WRPR to CWP
//   - TLU is taking care of all hole creation for done/retry
//
// - for a possible spill exception
//   - use spill_detected_m for block generation
//   - it will be a single cycle pulse, because the inst after save/flushw
//     in the same thread will be a NOP, garanteed by pick logic


// remember that a wrcwp is in play until it can be processed
// -------------------------------------------------------------
assign block_wrcwp = trap_ccr_cwp_valid | spill_detected_m;

assign wrcwp_in_play_in = (detected_wrpr_cwp & block_wrcwp) | (wrcwp_in_play & block_wrcwp);

exu_rml_ctl_msff_ctl_macro__width_1	wrcwp_in_playf		 (
 .scan_in(wrcwp_in_playf_scanin),
 .scan_out(wrcwp_in_playf_scanout),
 .l1clk	(l1clk_pm1),
 .din	(wrcwp_in_play_in),
 .dout	(wrcwp_in_play),
  .siclk(siclk),
  .soclk(soclk));

assign actual_wrpr_cwp = (detected_wrpr_cwp | wrcwp_in_play) & ~block_wrcwp;



exu_rml_ctl_msff_ctl_macro__width_3	pr_wt_ff		 (
 .scan_in(pr_wt_ff_scanin),
 .scan_out(pr_wt_ff_scanout),
 .l1clk(l1clk_pm1),
 .din  ({actual_wrpr_cwp   , actual_wrpr_cwp_d , actual_wrpr_cwp_e}),
 .dout ({actual_wrpr_cwp_d , actual_wrpr_cwp_e , pr_wt_m}),
  .siclk(siclk),
  .soclk(soclk));


exu_rml_ctl_msff_ctl_macro__width_3	trap_ccr_cwp_ff		 (
 .scan_in(trap_ccr_cwp_ff_scanin),
 .scan_out(trap_ccr_cwp_ff_scanout),
 .l1clk(l1clk_pm1),
 .din  ({trap_ccr_cwp_valid   , trap_ccr_cwp_valid_d , trap_ccr_cwp_valid_e }),
 .dout ({trap_ccr_cwp_valid_d , trap_ccr_cwp_valid_e , trap_ccr_cwp_valid_m }),
  .siclk(siclk),
  .soclk(soclk));


assign make_2nd_window_slot = spill_detected_m | pr_wt_m | trap_ccr_cwp_valid;
assign ack_wrpr_cwp_done = pr_wt_m;

assign exu_window_block_m	= actual_wrpr_cwp | rd_irf_ecc_valid | rd_irf_ecc_valid_lth;
assign exu_tlu_window_block	= exu_window_block_m; 






// =============================================================================
// Control signals to IRF 
// -----------------------------------------------------------------------------
// Three sources of control for local/even/odd register swaps:
// - window operation instruction
//   - normal window swaps w/o exception
//   - exception state preparation
// - WRPR to CWP from the ASI ring
// - CWP updates from TLU
//
// One source of control for Global register swap:
// - GL updates from TLU
//

// - generate control signals in M stage
// - send to IRF in B stage
//   - IRF decodes in B stage, saves in W stage, and restores in W2 stage
//
//
//                      old_lo   old_e   new_lo   new_e   l_en   o_en   e_en
//  --------------------------------------------------------------------------
//   window op inst
//   + no exception
//     - save           CWP      CWP+1   CWP+1    CWP+2   o/e     o      e
//     - restore        CWP      CWP+1   CWP-1    CWP     o/e     e      o
//     - saved          -	 -       -        -        -      -      -
//     - restored       -	 -       -        -        -      -      -
//     - flushw         -	 -       -        -        -      -      -
//     - return         CWP	 CWP+1   CWP-1    CWP     o/e     e      o
//
//   + exeption 
//     - clean_window   CWP      CWP+1   CWP+1    CWP+2   o/e     o      e
//     - fill           CWP      CWP+1   CWP-1    CWP     o/e     e      o
//
//     - spill_1        CWP      -       CWP+2    -       o/e    o/e     - 
//       spill_2        -        CWP+1   -        CWP+3    -      -     o/e
//
//     - spill_flush_1  CWP      -       CWP+2+   -       o/e    o/e     - 
//                                       CANSAVE
//
//       spill_flush_2  -        CWP+1   -        CWP+3+   -      -     o/e
//                                                CANSAVE 
//
//   WRPR to CWP
//     - WRPR_CWP_1     CWP      -       NEWCWP   -       o/e    o/e     - 
//       WRPR_CWP_2 	-	 CWP+1   -       NEWCWP+1  -      -     o/e
//
//   TLU CWP updates
//     - TLU_CWP_1      CWP      -       NEWCWP   -       o/e    o/e     - 
//	 TLU_CWP_2	-	 CWP+1   -       NEWCWP+1  -      -     o/e
//
//
// - speculatively controls IRF to do SWAP in case of exception
// - if TLU confirms with tlu_flush_exu_b signal, 
//        continue to restore-step in the swap process
// - if no TLU tlu_flush_exu_b
//        cancels the restore-step in the swap process
//   
//

// calculate possible CWP values
//---------------------------------------------
assign cwp_dec1_m[2:0] = cwp_m[2:0] - 3'b001;
assign cwp_inc1_m[2:0] = cwp_m[2:0] + 3'b001;
assign cwp_inc2_m[2:1] = cwp_m[2:1] + 2'b01 ;

// assign cwp_inc2_cansave_m[2:0] = cwp_m[2:0] + 3'b010 + cansave_m[2:0];
// Calculating increment by 2 plus cansave (logic mapped from espresso)
assign  cwp_inc2_cansave_m[2] = 
( cwp_m[2] &  cwp_m[1] &  cwp_m[0] & ~cansave_m[2] &  cansave_m[1] &  cansave_m[0]) | 
(~cwp_m[2] &  cwp_m[1] &  cwp_m[0] &  cansave_m[2] &  cansave_m[1] &  cansave_m[0]) | 
( cwp_m[2] & ~cwp_m[1] &             ~cansave_m[2] & ~cansave_m[1] & ~cansave_m[0]) | 
(~cwp_m[2] & ~cwp_m[1] &              cansave_m[2] & ~cansave_m[1] & ~cansave_m[0]) | 
(~cwp_m[2] &              cwp_m[0] & ~cansave_m[2] & ~cansave_m[1] &  cansave_m[0]) | 
( cwp_m[2] &              cwp_m[0] &  cansave_m[2] & ~cansave_m[1] &  cansave_m[0]) | 
(~cwp_m[2] &  cwp_m[1] & ~cwp_m[0] & ~cansave_m[2]                                ) | 
( cwp_m[2] &  cwp_m[1] & ~cwp_m[0] &  cansave_m[2]                                ) | 
( cwp_m[2] & ~cwp_m[1] & ~cwp_m[0] & ~cansave_m[2] & ~cansave_m[1]                ) | 
(~cwp_m[2] & ~cwp_m[1] & ~cwp_m[0] &  cansave_m[2] & ~cansave_m[1]                ) | 
(~cwp_m[2] &  cwp_m[1] &             ~cansave_m[2] &                 ~cansave_m[0]) | 
( cwp_m[2] &  cwp_m[1] &              cansave_m[2] &                 ~cansave_m[0]) | 
(~cwp_m[2] & ~cwp_m[1] &             ~cansave_m[2] &  cansave_m[1]                ) | 
( cwp_m[2] & ~cwp_m[1] &              cansave_m[2] &  cansave_m[1]                );

assign  cwp_inc2_cansave_m[1] = 
            (~cwp_m[1] &  cwp_m[0] &                  cansave_m[1] &  cansave_m[0]) | 
            ( cwp_m[1] &  cwp_m[0] &                 ~cansave_m[1] &  cansave_m[0]) | 
            ( cwp_m[1] &  cansave_m[1] &                             ~cansave_m[0]) | 
            ( cwp_m[1] & ~cwp_m[0] &                  cansave_m[1]                ) | 
            (~cwp_m[1] & ~cansave_m[1] &                             ~cansave_m[0]) | 
            (~cwp_m[1] & ~cwp_m[0] &                 ~cansave_m[1]                );

assign  cwp_inc2_cansave_m[0] = (cwp_m[0]& ~cansave_m[0]) | (~cwp_m[0]&  cansave_m[0]);




// setting IRF controls 
// --------------------------------------
// Thread ID is from
// - TLU in case of TLU CWP updates
// - in case of (trap_ccr_cwp_valid_m)
//   - the thread ID passed down the pipeline
// - WRPR ASI control in case of WRPR to CWP
//   - for the first slot, TID from ASI interface
// - current m-stage instruction ID in all other cases

assign rml_irf_cwpswap_tid_m[1:0]	= ( {2{~mbi_run_lth &  trap_ccr_cwp_valid                                   }} & trap_ccr_cwp_tid[1:0] ) |
					  ( {2{~mbi_run_lth & ~trap_ccr_cwp_valid &  trap_ccr_cwp_valid_m           }} & slot_tid_m[1:0]       ) |
					  ( {2{~mbi_run_lth & ~trap_ccr_cwp_valid & ~trap_ccr_cwp_valid_m &  pr_wt_m}} & wrpr_cwp_tid_hold[1:0]) |
					  ( {2{~mbi_run_lth & ~trap_ccr_cwp_valid & ~trap_ccr_cwp_valid_m & ~pr_wt_m}} & tid_m[1:0]            ) |
					  ( {2{ mbi_run_lth & ~mbi_irf_save_en_p2                                   }} & mbi_addr_lth[3:2]     ) |
					  ( {2{ mbi_run_lth &  mbi_irf_save_en_p2                                   }} & mbi_addr_lth[6:5]     );

exu_rml_ctl_msff_ctl_macro__width_6	winblock_slot_tid_m2d2e2m	 (
 .scan_in(winblock_slot_tid_m2d2e2m_scanin),
 .scan_out(winblock_slot_tid_m2d2e2m_scanout),
 .l1clk(l1clk_pm1),
 .din  ({rml_irf_cwpswap_tid_m[1:0], slot_tid_d[1:0], slot_tid_e[1:0] }),
 .dout ({slot_tid_d           [1:0], slot_tid_e[1:0], slot_tid_m[1:0] }),
  .siclk(siclk),
  .soclk(soclk));

/* 0in value -var {trap_ccr_cwp_valid, pr_wt_m, trap_ccr_cwp_valid_m} 
             -val 3'b000 3'b001 3'b010  3'b100 
             -message "TLU->CWP, WRPR->CWP & 2nd Full swap conflict in M stage exu.rml"*/



// Old CWP should always be the current CWP for the thread in processing
// - in case of WRPR of CWP
//   - get the correct old CWP from priviliged register file based on wrpr_cwp_tid_hold[1:0]
// - in case of done/retry 
//   - get the correct old CWP from priviliged register file based on trap_ccr_cwp_tid[1:0]
// - in case of (trap_ccr_cwp_valid_m):
//   - rml_irf_old_lo_cwp_m[2:0] = don't care, could just be cwp_m[2:0]
//   - rml_irf_old_e_cwp_m[2:0]  = the value passed down, incremented

assign old_lo_tid_m[1:0] 	= ({2{ trap_ccr_cwp_valid}}                 & trap_ccr_cwp_tid[1:0] ) |
				  ({2{~trap_ccr_cwp_valid}} & {2{ pr_wt_m}} & wrpr_cwp_tid_hold[1:0]) |
				  ({2{~trap_ccr_cwp_valid}} & {2{~pr_wt_m}} & tid_m[1:0]            );

assign old_lo_fetch_m    = trap_ccr_cwp_valid | pr_wt_m;

assign rml_irf_old_lo_cwp_m[2:0]= ({3{~mbi_run_lth & ~old_lo_fetch_m                                      }} & cwp_m[2:0]       ) |
				  ({3{~mbi_run_lth &  old_lo_fetch_m & ~old_lo_tid_m[1] & ~old_lo_tid_m[0]}} & cwp_thr0[2:0]    ) |
				  ({3{~mbi_run_lth &  old_lo_fetch_m & ~old_lo_tid_m[1] &  old_lo_tid_m[0]}} & cwp_thr1[2:0]    ) |
				  ({3{~mbi_run_lth &  old_lo_fetch_m &  old_lo_tid_m[1] & ~old_lo_tid_m[0]}} & cwp_thr2[2:0]    ) |
				  ({3{~mbi_run_lth &  old_lo_fetch_m &  old_lo_tid_m[1] &  old_lo_tid_m[0]}} & cwp_thr3[2:0]    ) |
				  ({3{ mbi_run_lth & ~mbi_irf_save_en_p2                                  }} & mbi_addr_lth[2:0]) |
				  ({3{ mbi_run_lth &  mbi_irf_save_en_p2                                  }} & mbi_addr_lth[9:7]);

assign old_lo_cwp_inc1_m[2:0] = rml_irf_old_lo_cwp_m[2:0] + 3'b001;
assign old_lo_cwp_inc1_m_unused = old_lo_cwp_inc1_m[0];

assign rml_irf_old_e_cwp_m[2:1]	= ({2{~mbi_run_lth &  old_lo_fetch_m                        }} & old_lo_cwp_inc1_m  [2:1]) |
				  ({2{~mbi_run_lth & ~old_lo_fetch_m &  make_2nd_window_slot}} & slot_old_cwp_inc1_m[2:1]) |
				  ({2{~mbi_run_lth & ~old_lo_fetch_m & ~make_2nd_window_slot}} & cwp_inc1_m[2:1]         ) |
				  ({2{ mbi_run_lth                   & ~mbi_irf_save_en_p2  }} & mbi_addr_lth[1:0]       ) |
				  ({2{ mbi_run_lth                   &  mbi_irf_save_en_p2  }} & mbi_addr_lth[9:8]       );

assign slot_old_cwp_inc1_m[2:0] = rml_irf_old_lo_cwp_m[2:0] + 3'b001;
assign slot_old_cwp_inc1_m_unused = slot_old_cwp_inc1_m[0];

assign slot_new_cwp_inc1_m[2:0] = rml_irf_new_lo_cwp_m[2:0] + 3'b001;
assign slot_new_cwp_inc1_m_unused = slot_new_cwp_inc1_m[0];

// New local/odd CWP should be:
// - (restore & (no_fill_exception | fill_exception):   CWP-1
// - (save & (no_exception | clean_window_exception)=
//   (save & (no_spill exception):                      CWP+1 
// - spill | spill_flush:                               CWP+2
// - WRPR_CWP:                                          NEWCWP from WRPR
// - TLU CWP updates:                                   NEWCWP from TLU
// - otherwise:                                         new CWP = old CWP

assign rml_irf_new_lo_cwp_m[2:0]= ({3{(inst_vld_m & (restore_m | return_consider_m))                                                        }} & cwp_dec1_m[2:0]        ) |
				  ({3{(inst_vld_m & save_m & ~spill_detected_m)                                                             }} & cwp_inc1_m[2:0]        ) |
				  ({3{(inst_vld_m & (save_m | flushw_m) & spill_detected_m)                                                 }} & cwp_inc2_cansave_m[2:0]) |
				  ({3{ pr_wt_m                                                                                              }} & pr_new_cwp_wt[2:0]     ) |
				  ({3{ trap_ccr_cwp_valid                                                                                   }} & trap_cwp[2:0]          ) |  
				  ({3{(~(inst_vld_m & (restore_m | return_consider_m | save_m | flushw_m)) & ~pr_wt_m & ~trap_ccr_cwp_valid)}} & cwp_m[2:0]             );

                     

// New even CWP should be:
// - restore/return & (no_fill_exception | fill_exception):    CWP
// - save & (no_exception | clean_window_exception)=
//   (save & (not_spill exception):                            CWP+2 
// - trap_ccr_cwp_valid_m:                                     (new CWP passed down)+1
// - otherwise:                                                new CWP = old CWP

assign new_e_cwp_m[2:1] = ({2{ (inst_vld_m & (restore_m | return_consider_m))}}                    & cwp_m[2:1]) |
                          ({2{ (inst_vld_m & save_m & ~spill_detected_m)}}                         & cwp_inc2_m[2:1]) |
                          ({2{  make_2nd_window_slot}}                                             & slot_new_cwp_inc1_m[2:1])|
                          ({2{~(inst_vld_m & save_m & ~spill_detected_m) & ~make_2nd_window_slot}} & cwp_m[2:1]);

// Local CWP, swap if:
// - valid save instruction, no exception
// - clean_window_exception
// - spill_exception  
//   ==> valid save instruction, with/without exceptions
//
// - valid restore/return instruction, no exception
// - fill_exception   
//   ==> valid restore/return instruction, with/without exceptions
//
// - spill_flush_exception, implies:
//   ==> spill_detected_m, since save is all covered
//   ==> inst_vld_m, since flushw must be valid to generate the exception
//
// - WRPR to CWP -> pr_wt_m asserted
// - TLU CPWP updates -> trap_ccr_cwp_valid asserted

assign rml_irf_save_local_m	= (~mbi_run_lth &  inst_vld_m & ~exu_ecc_m & (save_m  | restore_m | return_consider_m | spill_detected_m)) |
				  (~mbi_run_lth &                            (pr_wt_m | trap_ccr_cwp_valid                              )) |
				  ( mbi_run_lth &  mbi_irf_save_en_p2                                                                    );


// Odd CWP, swap if:
// - odd  current CWP, with a valid save instruction and no exception
// - odd  current CWP, with a clean_window exception
//   ==> odd  current CWP, a valid save inst (all spills are covered later)
//
// - even current CWP, with a valid restore/return instruction and no exception
// - even current CWP, with a fill_window  exception
//   ==> even current CWP, with a valid restore/return instruction, with/without exceptions
//
// - spill_exception
// - WRPR to CWP -> pr_wt_m asserted
// - TLU CPWP updates -> trap_ccr_cwp_valid asserted


assign rml_irf_save_odd_m	= (~mbi_run_lth &  inst_vld_m & ~exu_ecc_m &  save_m                               &  cwp_m[0]) | 
				  (~mbi_run_lth &  inst_vld_m & ~exu_ecc_m & (restore_m | return_consider_m)       & ~cwp_m[0]) |
				  (~mbi_run_lth &                            (spill_detected_m | pr_wt_m | trap_ccr_cwp_valid)) |
				  ( mbi_run_lth &  mbi_irf_save_en_p2                                                         );

// Even CWP, swap if:
// - even current CWP, with a valid save instruction and no exception
// - even current CWP, with a clean_window exception
//   ==> odd  current CWP, a valid save inst and no spill (~cansave_is0_m)
//
// - odd  current CWP, with a valid restore/return instruction and no exception
// - odd  current CWP, with a fill_window  exception
//   ==> even current CWP, with a valid restore/return instruction, with/without exceptions
//
// - second round of window swaps

assign rml_irf_save_even_m	= (~mbi_run_lth &  inst_vld_m & ~exu_ecc_m &  save_m  &   ~cansave_is0_m           & ~cwp_m[0]) | 
				  (~mbi_run_lth &  inst_vld_m & ~exu_ecc_m & (restore_m |  return_consider_m)      &  cwp_m[0]) |
				  (~mbi_run_lth &                            (spill_detected_m | pr_wt_m | trap_ccr_cwp_valid)) |
				  ( mbi_run_lth &  mbi_irf_save_en_p2                                                         );


exu_rml_ctl_msff_ctl_macro__width_15	i_rml_restore_en_ff	 (
 .scan_in(i_rml_restore_en_ff_scanin),
 .scan_out(i_rml_restore_en_ff_scanout),
 .l1clk(l1clk_pm1),
 .din  ({rml_irf_save_even_m		,
	 rml_irf_save_odd_m		,
	 rml_irf_save_local_m		,
	 rml_irf_save_global		,
	 rml_irf_global_tid[1:0]	,
	 rml_irf_cwpswap_tid_m[1:0]	,
	 new_e_cwp_m[2:1]		,
	 rml_irf_new_lo_cwp_m[2:0]	,
	 rml_irf_new_agp[1:0]}		),
 .dout ({rml_irf_restore_even_b_ff	,
	 rml_irf_restore_odd_b_ff	,
	 rml_irf_restore_local_b_ff	,
	 rml_irf_restore_global_ff	,
	 rml_irf_global_tid_ff[1:0]	,
	 raw_irf_cwpswap_tid_b[1:0]	,
	 raw_irf_new_e_cwp_b[2:1]	,
	 raw_irf_new_lo_cwp_b[2:0]	,
	 rml_irf_new_agp_ff[1:0]}	),
  .siclk(siclk),
  .soclk(soclk));

assign rml_irf_cwpswap_tid_b[1:0]	= ({2{~mbi_run_lth                         }} & raw_irf_cwpswap_tid_b[1:0]) |
					  ({2{ mbi_run_lth & ~mbi_irf_restore_en_p2}} & mbi_addr_lth[1:0]         ) |
					  ({2{ mbi_run_lth &  mbi_irf_restore_en_p2}} & mbi_addr_lth[6:5]         );

assign rml_irf_new_lo_cwp_b[2:0]	= ({3{~mbi_run_lth                         }} & raw_irf_new_lo_cwp_b[2:0] ) |
					  ({3{ mbi_run_lth & ~mbi_irf_restore_en_p2}} & mbi_addr_lth[3:1]         ) |
					  ({3{ mbi_run_lth &  mbi_irf_restore_en_p2}} & mbi_addr_lth[9:7]         );

assign rml_irf_new_e_cwp_b[2:1]		= ({2{~mbi_run_lth                         }} & raw_irf_new_e_cwp_b[2:1]  ) |
					  ({2{ mbi_run_lth & ~mbi_irf_restore_en_p2}} & mbi_addr_lth[4:3]         ) |
					  ({2{ mbi_run_lth &  mbi_irf_restore_en_p2}} & mbi_addr_lth[9:8]         );


assign rml_irf_restore_even_b		= (~mbi_run_lth &  rml_irf_restore_even_b_ff  & ~tlu_flush_exu_b) | ( mbi_run_lth &  mbi_irf_restore_en_p2);
assign rml_irf_restore_odd_b		= (~mbi_run_lth &  rml_irf_restore_odd_b_ff   & ~tlu_flush_exu_b) | ( mbi_run_lth &  mbi_irf_restore_en_p2);
assign rml_irf_restore_local_b		= (~mbi_run_lth &  rml_irf_restore_local_b_ff & ~tlu_flush_exu_b) | ( mbi_run_lth &  mbi_irf_restore_en_p2);
assign rml_irf_restore_global		= (~mbi_run_lth &  rml_irf_restore_global_ff                    ) | ( mbi_run_lth &  mbi_irf_restore_en_p2);

// Make sure no save/restore to the same thread at the same time


// generate next cycle CWP values
// -----------------------------------------------------
// replicate the window swap destination generated by IRF control

assign cwp_update_m   = rml_irf_save_local_m & ~exu_ecc_m;
assign cwp_tid_m[1:0] = rml_irf_cwpswap_tid_m[1:0];
assign cwp_new_m[2:0] = rml_irf_new_lo_cwp_m[2:0];

exu_rml_ctl_msff_ctl_macro__width_6	cwp_m2b		 (
 .scan_in(cwp_m2b_scanin),
 .scan_out(cwp_m2b_scanout),
 .l1clk(l1clk_pm1),
 .din  ({cwp_tid_m[1:0], cwp_new_m[2:0], cwp_update_m}),
 .dout ({cwp_tid_b[1:0], cwp_new_b[2:0], cwp_update_b}),
  .siclk(siclk),
  .soclk(soclk));

// Cancel CWP updates if the current instruction is being flushed
assign cwp_update_no_flush_exu_b = cwp_update_b & ~tlu_flush_exu_b & ~dec_flush_b;

exu_rml_ctl_msff_ctl_macro__width_6	cwp_b2w		 (
 .scan_in(cwp_b2w_scanin),
 .scan_out(cwp_b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({cwp_tid_b[1:0], cwp_new_b[2:0], cwp_update_no_flush_exu_b}),
 .dout ({cwp_tid_w[1:0], cwp_new_w[2:0], cwp_update_w}),
  .siclk(siclk),
  .soclk(soclk));

assign cwp_next_w[2:0] = cwp_new_w[2:0];

assign cwp_we_w[0] = (~cwp_tid_w[1]) & (~cwp_tid_w[0]) & (cwp_update_w);
assign cwp_we_w[1] = (~cwp_tid_w[1]) & ( cwp_tid_w[0]) & (cwp_update_w);
assign cwp_we_w[2] = ( cwp_tid_w[1]) & (~cwp_tid_w[0]) & (cwp_update_w);
assign cwp_we_w[3] = ( cwp_tid_w[1]) & ( cwp_tid_w[0]) & (cwp_update_w);

assign cwp_pr_we[0] = (~wrpr_cwp_tid_hold[1]) & (~wrpr_cwp_tid_hold[0]) & (pr_wt_m);
assign cwp_pr_we[1] = (~wrpr_cwp_tid_hold[1]) & ( wrpr_cwp_tid_hold[0]) & (pr_wt_m);
assign cwp_pr_we[2] = ( wrpr_cwp_tid_hold[1]) & (~wrpr_cwp_tid_hold[0]) & (pr_wt_m);
assign cwp_pr_we[3] = ( wrpr_cwp_tid_hold[1]) & ( wrpr_cwp_tid_hold[0]) & (pr_wt_m);

assign cwp_thr0_next[2:0]	= ({3{ cwp_we_w[0] }}                     & cwp_next_w[2:0]   ) |
				  ({3{ cwp_pr_we[0]}}                     & pr_new_cwp_wt[2:0]) |
				  ({3{~cwp_pr_we[0]}} & {3{~cwp_we_w[0]}} & cwp_thr0[2:0]     );

assign cwp_thr1_next[2:0]	= ({3{ cwp_we_w[1] }}                     & cwp_next_w[2:0]   ) |
				  ({3{ cwp_pr_we[1]}}                     & pr_new_cwp_wt[2:0]) |
				  ({3{~cwp_pr_we[1]}} & {3{~cwp_we_w[1]}} & cwp_thr1[2:0]     );

assign cwp_thr2_next[2:0]	= ({3{ cwp_we_w[2] }}                     & cwp_next_w[2:0]   ) |
				  ({3{ cwp_pr_we[2]}}                     & pr_new_cwp_wt[2:0]) |
				  ({3{~cwp_pr_we[2]}} & {3{~cwp_we_w[2]}} & cwp_thr2[2:0]     );

assign cwp_thr3_next[2:0]	= ({3{ cwp_we_w[3] }}                     & cwp_next_w[2:0]   ) |
				  ({3{ cwp_pr_we[3]}}                     & pr_new_cwp_wt[2:0]) |
				  ({3{~cwp_pr_we[3]}} & {3{~cwp_we_w[3]}} & cwp_thr3[2:0]     );





// Controls of Alternate Global Pointer
// -------------------------------------------------------

// Detect changes in thread being updated 
assign gl_changed_thr0 = (tlu_gl_thr0[1]^gl_thr0[1]) | (tlu_gl_thr0[0]^gl_thr0[0]);
assign gl_changed_thr1 = (tlu_gl_thr1[1]^gl_thr1[1]) | (tlu_gl_thr1[0]^gl_thr1[0]);
assign gl_changed_thr2 = (tlu_gl_thr2[1]^gl_thr2[1]) | (tlu_gl_thr2[0]^gl_thr2[0]);
assign gl_changed_thr3 = (tlu_gl_thr3[1]^gl_thr3[1]) | (tlu_gl_thr3[0]^gl_thr3[0]);

assign gl_we[0] =  gl_changed_thr0;
assign gl_we[1] =  gl_changed_thr1;
assign gl_we[2] =  gl_changed_thr2;
assign gl_we[3] =  gl_changed_thr3;

// No more than one GL changes per cycle to RML

// Never have GL changes in the same thread trailing each other within 3 cycles


assign gl_tid[0] = gl_we[1] | gl_we[3];
assign gl_tid[1] = gl_we[2] | gl_we[3];

assign gl_changed = gl_changed_thr0 | gl_changed_thr1 | gl_changed_thr2 |
                    gl_changed_thr3;

assign gl_thr0_next[1:0] = ({2{  gl_we[0]}} & tlu_gl_thr0[1:0]) | 
                           ({2{ ~gl_we[0]}} &     gl_thr0[1:0]);
assign gl_thr1_next[1:0] = ({2{  gl_we[1]}} & tlu_gl_thr1[1:0]) | 
                           ({2{ ~gl_we[1]}} &     gl_thr1[1:0]);
assign gl_thr2_next[1:0] = ({2{  gl_we[2]}} & tlu_gl_thr2[1:0]) | 
                           ({2{ ~gl_we[2]}} &     gl_thr2[1:0]);
assign gl_thr3_next[1:0] = ({2{  gl_we[3]}} & tlu_gl_thr3[1:0]) | 
                           ({2{ ~gl_we[3]}} &     gl_thr3[1:0]);


exu_rml_ctl_msff_ctl_macro__width_8	old_gl_ptr		 (		
 .scan_in(old_gl_ptr_wmr_scanin),
 .scan_out(old_gl_ptr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({gl_thr0_next[1:0],
	 gl_thr1_next[1:0],
	 gl_thr2_next[1:0],
	 gl_thr3_next[1:0]}),
 .dout ({gl_thr0[1:0],
	 gl_thr1[1:0],
	 gl_thr2[1:0],
	 gl_thr3[1:0]}),
  .soclk(soclk));


// Set IRF controls
// - if no valid signal, rml_irf_old_agp & rml_irf_new_agp follows [tlu_gl]

assign rml_irf_save_global	= (   ~mbi_run_lth   &  gl_changed        ) |
				  (    mbi_run_lth   &  mbi_irf_save_en_p2);

assign rml_irf_global_tid[1:0]	= ({2{~mbi_run_lth}} &  gl_tid[1:0]       ) |
				  ({2{ mbi_run_lth}} &  mbi_addr_lth[6:5] );

assign rml_irf_old_agp[1:0] 	= ({2{~mbi_run_lth & gl_we[0]}} &     gl_thr0[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[1]}} &     gl_thr1[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[2]}} &     gl_thr2[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[3]}} &     gl_thr3[1:0] ) |
				  ({2{ mbi_run_lth           }} & mbi_addr_lth[8:7]);

assign rml_irf_new_agp[1:0]	= ({2{~mbi_run_lth & gl_we[0]}} & tlu_gl_thr0[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[1]}} & tlu_gl_thr1[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[2]}} & tlu_gl_thr2[1:0] ) |
				  ({2{~mbi_run_lth & gl_we[3]}} & tlu_gl_thr3[1:0] ) |
				  ({2{ mbi_run_lth           }} & mbi_addr_lth[8:7]);



// =============================================================================
// State machines to keep track of priviledged register updates
// -----------------------------------------------------------------------------
// PR		   	CANSAVE     CANRESTORE   OTHERWIN   CLEANWIN      CWP
// -----------------------------------------------------------------------------
// Reset		3'b110      3'b000       3'b000     3'b111        3'b000
//
// Save                 dec	    inc            -          -            inc
//
// Restore		inc	    dec	           -          -            dec
//
// Saved 		inc         (OTHERWIN    (!=0)?dec    -             -
//                                   =0)?dec
//
// Restored		(OTHERWIN   inc          (!=0)?dec  (!=NWIN)?inc    -
//			 =0)?dec 
//
// Allclean (sun4v)     -           -              -          NWIN-1        -
//
// Otherw   (sun4v)     -           0            CANRESTORE   -             -
//
// Normalw  (sun4v)     -           OTHERWIN       0          -             -
//
// Invalw   (sun4v)     NWIN-2      0              0          -             -
//
// Return		inc         dec            -          -            dec
//
// Flushw               -           -              -          -             -
//
// fill_trap		      CWP <- (CWP + CANSAVE + 2) mod NWINDOWS
//
// spill_trap		      CWP <- (CWP - 1) mod NWINDOWS
//	     
// clean_window	    	      CWP <- (CWP + 1) mod NWINDOWS
// -----------------------------------------------------------------------------
// - Implemented in W stage, before it is written back at the end of W stage

assign cansave_dec1_w[2:0] = cansave_w[2:0] - 3'b001;
assign cansave_inc1_w[2:0] = cansave_w[2:0] + 3'b001;
assign canrestore_dec1_w[2:0] = canrestore_w[2:0] - 3'b001;
assign canrestore_inc1_w[2:0] = canrestore_w[2:0] + 3'b001;

assign otherwin_dec1_w[2:0] = otherwin_w[2:0] - 3'b001;
assign cleanwin_inc1_w[2:0] = cleanwin_w[2:0] + 3'b001;

assign otherwin_is0_w = ~(otherwin_w[2] | otherwin_w[1] | otherwin_w[0]);
assign cleanwin_is111_w = cleanwin_w[2] & cleanwin_w[1] & cleanwin_w[0] ;



// generate next cycle CANSAVE values
// ------------------------------------
// - use the table above to decide whether to inc/dec the counter
// - needs to mux in ASR data path to write to the PR

assign cansave_inc_w   = inst_vld_w & (restore_w | saved_w | return_w) ;
assign cansave_dec_w   = inst_vld_w & 
                         (save_w | (restored_w & otherwin_is0_w));
assign cansave_reset_w = inst_vld_w & invalw_w;
assign cansave_update_w = cansave_inc_w | cansave_dec_w | cansave_reset_w;

assign cansave_next_w[2:0] = ({3{ cansave_inc_w   }} & cansave_inc1_w[2:0]) |
			     ({3{ cansave_dec_w   }} & cansave_dec1_w[2:0]) |
                             ({3{ cansave_reset_w }} & 3'b110             ) |
                             ({3{~cansave_update_w}} & cansave_w     [2:0]) ;

assign cansave_we_w[0] = (tid_w[1:0] == 2'b00) & (cansave_update_w);
assign cansave_we_w[1] = (tid_w[1:0] == 2'b01) & (cansave_update_w);
assign cansave_we_w[2] = (tid_w[1:0] == 2'b10) & (cansave_update_w);
assign cansave_we_w[3] = (tid_w[1:0] == 2'b11) & (cansave_update_w);

assign cansave_pr_we[0] = (pr_tid_ctl[1:0] == 2'b00) & (pr_wt_cansave_ctl);
assign cansave_pr_we[1] = (pr_tid_ctl[1:0] == 2'b01) & (pr_wt_cansave_ctl);
assign cansave_pr_we[2] = (pr_tid_ctl[1:0] == 2'b10) & (pr_wt_cansave_ctl);
assign cansave_pr_we[3] = (pr_tid_ctl[1:0] == 2'b11) & (pr_wt_cansave_ctl);


// generate next cycle CANRESTORE values
// ---------------------------------------
// - use the table above to decide whether to inc/dec the counter
// - needs to mux in ASI data path to write to the PR

assign canrestore_inc_w = inst_vld_w & (save_w | restored_w);
assign canrestore_dec_w = inst_vld_w & 
			  (restore_w | (saved_w & otherwin_is0_w) | return_w);
assign canrestore_0_w   = inst_vld_w & (otherw_w | invalw_w);
assign canrestore_otherwin_w = inst_vld_w & normalw_w;
assign canrestore_update_w = canrestore_inc_w | canrestore_dec_w |
                             canrestore_0_w   | canrestore_otherwin_w;

assign canrestore_next_w[2:0] = ({3{ canrestore_inc_w     }}   & canrestore_inc1_w[2:0]) |
			        ({3{ canrestore_dec_w     }}   & canrestore_dec1_w[2:0]) |
			        ({3{ canrestore_0_w       }}   & 3'b000                ) |
			        ({3{ canrestore_otherwin_w}} & canrestore_normalwin_data_w[2:0]) |
                                ({3{~canrestore_update_w  }} & canrestore_w  [2:0]) ;

assign canrestore_normalwin_data_w[2:0] = {3{(~tid_w[1]) & (~tid_w[0])}} & (otherwin_thr0[2:0]) |
                                          {3{(~tid_w[1]) & ( tid_w[0])}} & (otherwin_thr1[2:0]) |
                                          {3{( tid_w[1]) & (~tid_w[0])}} & (otherwin_thr2[2:0]) |
                                          {3{( tid_w[1]) & ( tid_w[0])}} & (otherwin_thr3[2:0]) ;

assign canrestore_we_w[0] = (tid_w[1:0] == 2'b00) & (canrestore_update_w);
assign canrestore_we_w[1] = (tid_w[1:0] == 2'b01) & (canrestore_update_w);
assign canrestore_we_w[2] = (tid_w[1:0] == 2'b10) & (canrestore_update_w);
assign canrestore_we_w[3] = (tid_w[1:0] == 2'b11) & (canrestore_update_w);

assign canrestore_pr_we[0] = (pr_tid_ctl[1:0] == 2'b00) & (pr_wt_canrestore_ctl);
assign canrestore_pr_we[1] = (pr_tid_ctl[1:0] == 2'b01) & (pr_wt_canrestore_ctl);
assign canrestore_pr_we[2] = (pr_tid_ctl[1:0] == 2'b10) & (pr_wt_canrestore_ctl);
assign canrestore_pr_we[3] = (pr_tid_ctl[1:0] == 2'b11) & (pr_wt_canrestore_ctl);


// generate next cycle OTHERWIN values
// ---------------------------------------
assign otherwin_dec_w = inst_vld_w & (~otherwin_is0_w) & 
                        (saved_w | restored_w);
assign otherwin_0_w = inst_vld_w & (normalw_w | invalw_w);
assign otherwin_canrestore_w = inst_vld_w & otherw_w;
assign otherwin_update_w = otherwin_dec_w | otherwin_0_w | otherwin_canrestore_w;

assign otherwin_next_w[2:0] = ({3{ otherwin_dec_w       }}  & otherwin_dec1_w[2:0]      ) |
                              ({3{ otherwin_0_w         }}  & 3'b000                    ) |
                              ({3{ otherwin_canrestore_w}} & otherwin_otherw_data_w[2:0]) |
                              ({3{~otherwin_update_w    }} & otherwin_w[2:0]            ) ;

assign otherwin_we_w[0] = (~tid_w[1]) & (~tid_w[0]) & (otherwin_update_w);
assign otherwin_we_w[1] = (~tid_w[1]) & ( tid_w[0]) & (otherwin_update_w);
assign otherwin_we_w[2] = ( tid_w[1]) & (~tid_w[0]) & (otherwin_update_w);
assign otherwin_we_w[3] = ( tid_w[1]) & ( tid_w[0]) & (otherwin_update_w);

assign otherwin_otherw_data_w[2:0] = {3{tid_w[1:0] == 2'b00}} & (canrestore_thr0[2:0]) |
                                     {3{tid_w[1:0] == 2'b01}} & (canrestore_thr1[2:0]) |
                                     {3{tid_w[1:0] == 2'b10}} & (canrestore_thr2[2:0]) |
                                     {3{tid_w[1:0] == 2'b11}} & (canrestore_thr3[2:0]) ;

assign otherwin_pr_we[0] = (pr_tid_ctl[1:0] == 2'b00) & (pr_wt_otherwin_ctl);
assign otherwin_pr_we[1] = (pr_tid_ctl[1:0] == 2'b01) & (pr_wt_otherwin_ctl);
assign otherwin_pr_we[2] = (pr_tid_ctl[1:0] == 2'b10) & (pr_wt_otherwin_ctl);
assign otherwin_pr_we[3] = (pr_tid_ctl[1:0] == 2'b11) & (pr_wt_otherwin_ctl);


// generate next cycle CLEANWIN values
// ---------------------------------------
assign cleanwin_inc_w = inst_vld_w & (~cleanwin_is111_w) & restored_w;
assign cleanwin_reset_w = inst_vld_w & allclean_w;
assign cleanwin_update_w = cleanwin_inc_w | cleanwin_reset_w;

assign cleanwin_next_w[2:0] = ({3{ cleanwin_inc_w   }} & cleanwin_inc1_w[2:0]) |
                              ({3{ cleanwin_reset_w }} & 3'b111              ) |
                              ({3{~cleanwin_update_w}} & cleanwin_w     [2:0]) ;

assign cleanwin_we_w[0] = (tid_w[1:0] == 2'b00) & (cleanwin_update_w);
assign cleanwin_we_w[1] = (tid_w[1:0] == 2'b01) & (cleanwin_update_w);
assign cleanwin_we_w[2] = (tid_w[1:0] == 2'b10) & (cleanwin_update_w);
assign cleanwin_we_w[3] = (tid_w[1:0] == 2'b11) & (cleanwin_update_w);

assign cleanwin_pr_we[0] = (pr_tid_ctl[1:0] == 2'b00) & (pr_wt_cleanwin_ctl);
assign cleanwin_pr_we[1] = (pr_tid_ctl[1:0] == 2'b01) & (pr_wt_cleanwin_ctl);
assign cleanwin_pr_we[2] = (pr_tid_ctl[1:0] == 2'b10) & (pr_wt_cleanwin_ctl);
assign cleanwin_pr_we[3] = (pr_tid_ctl[1:0] == 2'b11) & (pr_wt_cleanwin_ctl);



// generate next cycle WSTATE values
// ---------------------------------------
assign wstate_pr_we[0] = (pr_tid_ctl[1:0] == 2'b00) & (pr_wt_wstate_ctl);
assign wstate_pr_we[1] = (pr_tid_ctl[1:0] == 2'b01) & (pr_wt_wstate_ctl);
assign wstate_pr_we[2] = (pr_tid_ctl[1:0] == 2'b10) & (pr_wt_wstate_ctl);
assign wstate_pr_we[3] = (pr_tid_ctl[1:0] == 2'b11) & (pr_wt_wstate_ctl);





// =============================================================================
// Specutively produce oddwin indicator for Pick-stage to translate 
// virtual architectural integer register address to physical address
// (involves swapping ins/outs registers for odd window pointers)
// ---------------------------------------------------------------------
// only requires LSB of CWPs
// - keeps a copy of CWP LSB in B stage
// - update oddwin indicator whenever CWP is updated 
// - revert oddwin indicator to architected state during a flush
// - otherwise, hold previous value

assign cwp_new_update[0] = cwp_update_m	& (~cwp_tid_m[1]) & (~cwp_tid_m[0]);
assign cwp_new_update[1] = cwp_update_m	& (~cwp_tid_m[1]) & ( cwp_tid_m[0]);
assign cwp_new_update[2] = cwp_update_m	& ( cwp_tid_m[1]) & (~cwp_tid_m[0]);
assign cwp_new_update[3] = cwp_update_m	& ( cwp_tid_m[1]) & ( cwp_tid_m[0]);

assign cwp_flushed   [0] = (flush_exu_w | dec_flush_w) & (~tid_w[1]) & (~tid_w[0]);
assign cwp_flushed   [1] = (flush_exu_w | dec_flush_w) & (~tid_w[1]) & ( tid_w[0]);
assign cwp_flushed   [2] = (flush_exu_w | dec_flush_w) & ( tid_w[1]) & (~tid_w[0]);
assign cwp_flushed   [3] = (flush_exu_w | dec_flush_w) & ( tid_w[1]) & ( tid_w[0]);

assign cwp_oddwin_next[0] = ( cwp_new_update[0] & ~cwp_flushed[0] & cwp_new_m   [0]) |
                            (~cwp_new_update[0] & ~cwp_flushed[0] & cwp_oddwin_b[0]) |
                            ( cwp_flushed   [0] &  cwp_thr0   [0]);

assign cwp_oddwin_next[1] = ( cwp_new_update[1] & ~cwp_flushed[1] & cwp_new_m   [0]) |
                            (~cwp_new_update[1] & ~cwp_flushed[1] & cwp_oddwin_b[1]) |
                            ( cwp_flushed   [1] &  cwp_thr1   [0]);

assign cwp_oddwin_next[2] = ( cwp_new_update[2] & ~cwp_flushed[2] & cwp_new_m   [0]) |
                            (~cwp_new_update[2] & ~cwp_flushed[2] & cwp_oddwin_b[2]) |
                            ( cwp_flushed   [2] &  cwp_thr2   [0]);

assign cwp_oddwin_next[3] = ( cwp_new_update[3] & ~cwp_flushed[3] & cwp_new_m   [0]) |
                            (~cwp_new_update[3] & ~cwp_flushed[3] & cwp_oddwin_b[3]) |
                            ( cwp_flushed   [3] &  cwp_thr3   [0]);



exu_rml_ctl_msff_ctl_macro__width_4	cwp_speculative		 (
 .scan_in(cwp_speculative_scanin),
 .scan_out(cwp_speculative_scanout),
 .l1clk(l1clk_pm1),
 .din  ({cwp_oddwin_next[3:0]}),
 .dout ({cwp_oddwin_b[3:0]}),
  .siclk(siclk),
  .soclk(soclk));

assign exu_oddwin_b[3:0] = cwp_oddwin_b[3:0];



// =============================================================================
// Privileged Registers
// -----------------------------------------------------------------------------
// - maintains legal state of interger-register-window  
//   related privileged registers (See pages 57-59)
// - allow RDPR/WRPR to read and write to these registers
// - PRs read in D stage, and written in W stage
// - 4 sets of PR, one set for each thread in EXU 
// - EXU only handles one thread's PR accesses per stage
// - needs to arbitrate between the threads
//
//     PR name          init. value
//   ------------------------------------------
//     CANSAVE		110
//     CANRESTORE	000
//     OTHERWIN		000
//     CLEANWIN		111
//     WSTATE		000000
//     CWP		000
//



// - CANSAVE Privileged Register
//   ----------------------------

// Only one thread can be writen each cycle
// Uses write enable to control which register to update

assign cansave_thr0_next[2:0] = ({3{ cansave_we_w[0] }}                         & cansave_next_w[2:0]) |
				({3{ cansave_pr_we[0]}}                         & data_1f[2:0]       ) |
                                ({3{~cansave_pr_we[0]}} & {3{~cansave_we_w[0]}} & cansave_thr0[2:0]  );

assign cansave_thr1_next[2:0] = ({3{ cansave_we_w[1] }}                         & cansave_next_w[2:0]) |
				({3{ cansave_pr_we[1]}}                         & data_1f[2:0]       ) |
                                ({3{~cansave_pr_we[1]}} & {3{~cansave_we_w[1]}} & cansave_thr1[2:0]  );

assign cansave_thr2_next[2:0] = ({3{ cansave_we_w[2] }}                         & cansave_next_w[2:0]) |
				({3{ cansave_pr_we[2]}}                         & data_1f[2:0]       ) |
                                ({3{~cansave_pr_we[2]}} & {3{~cansave_we_w[2]}} & cansave_thr2[2:0]  );

assign cansave_thr3_next[2:0] = ({3{ cansave_we_w[3] }}                         & cansave_next_w[2:0]) |
				({3{ cansave_pr_we[3]}}                         & data_1f[2:0]       ) |
                                ({3{~cansave_pr_we[3]}} & {3{~cansave_we_w[3]}} & cansave_thr3[2:0]  );

// Stores negated CANSAVE values
// - Use POR to reset the architectural PR values to 3'b110
assign cansave_thr0_next_l[2:1] = ~cansave_thr0_next[2:1];
assign cansave_thr1_next_l[2:1] = ~cansave_thr1_next[2:1];
assign cansave_thr2_next_l[2:1] = ~cansave_thr2_next[2:1];
assign cansave_thr3_next_l[2:1] = ~cansave_thr3_next[2:1];

exu_rml_ctl_msff_ctl_macro__width_12	cansave_pr		 (		
 .scan_in(cansave_pr_wmr_scanin),
 .scan_out(cansave_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({cansave_thr0_next_l[2:1], cansave_thr0_next[0],
         cansave_thr1_next_l[2:1], cansave_thr1_next[0],
         cansave_thr2_next_l[2:1], cansave_thr2_next[0],
         cansave_thr3_next_l[2:1], cansave_thr3_next[0]}),
 .dout ({cansave_thr0_l[2:1],      cansave_thr0[0],
         cansave_thr1_l[2:1],      cansave_thr1[0],
         cansave_thr2_l[2:1],      cansave_thr2[0],
         cansave_thr3_l[2:1],      cansave_thr3[0]}),
  .soclk(soclk));

assign cansave_thr0[2:1] = ~cansave_thr0_l[2:1];
assign cansave_thr1[2:1] = ~cansave_thr1_l[2:1];
assign cansave_thr2[2:1] = ~cansave_thr2_l[2:1];
assign cansave_thr3[2:1] = ~cansave_thr3_l[2:1];

// Output the cansave value of the current thread
assign cansave_e[2:0] = ({3{tid_e[1:0] == 2'b00}} & cansave_thr0[2:0]) |
                        ({3{tid_e[1:0] == 2'b01}} & cansave_thr1[2:0]) | 
                        ({3{tid_e[1:0] == 2'b10}} & cansave_thr2[2:0]) | 
                        ({3{tid_e[1:0] == 2'b11}} & cansave_thr3[2:0]) ;

assign cansave_pr_rd[2:0] = ({3{pr_tid_ctl[1:0] == 2'b00}} & cansave_thr0[2:0]) |
                            ({3{pr_tid_ctl[1:0] == 2'b01}} & cansave_thr1[2:0]) | 
                            ({3{pr_tid_ctl[1:0] == 2'b10}} & cansave_thr2[2:0]) | 
                            ({3{pr_tid_ctl[1:0] == 2'b11}} & cansave_thr3[2:0]) ;

exu_rml_ctl_msff_ctl_macro__width_9	cansave_e2m2b2w		 (
 .scan_in(cansave_e2m2b2w_scanin),
 .scan_out(cansave_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({cansave_e[2:0], cansave_m[2:0], cansave_b[2:0]}),
 .dout ({cansave_m[2:0], cansave_b[2:0], cansave_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk));



// - CANRESTORE Privileged Register
//   -------------------------------

// Only one thread can be writen each cycle
// Uses write enable to control which register to update

assign canrestore_thr0_next[2:0] = ({3{ canrestore_we_w[0] }}                            & canrestore_next_w[2:0]) |
                                   ({3{ canrestore_pr_we[0]}}                            & data_1f[2:0]          ) |
                                   ({3{~canrestore_pr_we[0]}} & {3{~canrestore_we_w[0]}} & canrestore_thr0[2:0]  );

assign canrestore_thr1_next[2:0] = ({3{ canrestore_we_w[1] }}                            & canrestore_next_w[2:0]) |
                                   ({3{ canrestore_pr_we[1]}}                            & data_1f[2:0]          ) |
                                   ({3{~canrestore_pr_we[1]}} & {3{~canrestore_we_w[1]}} & canrestore_thr1[2:0]  );

assign canrestore_thr2_next[2:0] = ({3{ canrestore_we_w[2] }}                            & canrestore_next_w[2:0]) |
                                   ({3{ canrestore_pr_we[2]}}                            & data_1f[2:0]          ) |
                                   ({3{~canrestore_pr_we[2]}} & {3{~canrestore_we_w[2]}} & canrestore_thr2[2:0]  );

assign canrestore_thr3_next[2:0] = ({3{ canrestore_we_w[3] }}                            & canrestore_next_w[2:0]) |
                                   ({3{ canrestore_pr_we[3]}}                            & data_1f[2:0]          ) |
                                   ({3{~canrestore_pr_we[3]}} & {3{~canrestore_we_w[3]}} & canrestore_thr3[2:0]  );

exu_rml_ctl_msff_ctl_macro__width_12	canrestore_pr		 (	
 .scan_in(canrestore_pr_wmr_scanin),
 .scan_out(canrestore_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({canrestore_thr0_next[2:0],
         canrestore_thr1_next[2:0],
         canrestore_thr2_next[2:0],
         canrestore_thr3_next[2:0]}),
 .dout ({canrestore_thr0[2:0],
         canrestore_thr1[2:0],
         canrestore_thr2[2:0],
         canrestore_thr3[2:0]}),
  .soclk(soclk));

// Output the canrestore value of the current thread
assign canrestore_e[2:0] = ({3{tid_e[1:0] == 2'b00}} & canrestore_thr0[2:0]) |
                           ({3{tid_e[1:0] == 2'b01}} & canrestore_thr1[2:0]) | 
                           ({3{tid_e[1:0] == 2'b10}} & canrestore_thr2[2:0]) | 
                           ({3{tid_e[1:0] == 2'b11}} & canrestore_thr3[2:0]) ;

assign canrestore_pr_rd[2:0] = ({3{pr_tid_ctl[1:0] == 2'b00}} & canrestore_thr0[2:0]) |
                               ({3{pr_tid_ctl[1:0] == 2'b01}} & canrestore_thr1[2:0]) | 
                               ({3{pr_tid_ctl[1:0] == 2'b10}} & canrestore_thr2[2:0]) | 
                               ({3{pr_tid_ctl[1:0] == 2'b11}} & canrestore_thr3[2:0]) ;

exu_rml_ctl_msff_ctl_macro__width_9	canrestore_e2m2b2w	 (
 .scan_in(canrestore_e2m2b2w_scanin),
 .scan_out(canrestore_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({canrestore_e[2:0], canrestore_m[2:0], canrestore_b[2:0]}),
 .dout ({canrestore_m[2:0], canrestore_b[2:0], canrestore_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk));



// - OTHERWIN Privileged Register
//   -----------------------------

// Only one thread can be writen each cycle
// Uses write enable to control which register to update

assign otherwin_thr0_next[2:0] = ({3{ otherwin_we_w[0] }}                          & otherwin_next_w[2:0]) |
                                 ({3{ otherwin_pr_we[0]}}                          & data_1f        [2:0]) |
                                 ({3{~otherwin_pr_we[0]}} & {3{~otherwin_we_w[0]}} & otherwin_thr0  [2:0]);

assign otherwin_thr1_next[2:0] = ({3{ otherwin_we_w[1] }}                          & otherwin_next_w[2:0]) |
                                 ({3{ otherwin_pr_we[1]}}                          & data_1f        [2:0]) |
                                 ({3{~otherwin_pr_we[1]}} & {3{~otherwin_we_w[1]}} & otherwin_thr1  [2:0]);

assign otherwin_thr2_next[2:0] = ({3{ otherwin_we_w[2] }}                          & otherwin_next_w[2:0]) |
                                 ({3{ otherwin_pr_we[2]}}                          & data_1f        [2:0]) |
                                 ({3{~otherwin_pr_we[2]}} & {3{~otherwin_we_w[2]}} & otherwin_thr2  [2:0]);

assign otherwin_thr3_next[2:0] = ({3{ otherwin_we_w[3] }}                          & otherwin_next_w[2:0]) |
                                 ({3{ otherwin_pr_we[3]}}                          & data_1f        [2:0]) |
                                 ({3{~otherwin_pr_we[3]}} & {3{~otherwin_we_w[3]}} & otherwin_thr3  [2:0]);

exu_rml_ctl_msff_ctl_macro__width_12	otherwin_pr		 (		
 .scan_in(otherwin_pr_wmr_scanin),
 .scan_out(otherwin_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({otherwin_thr0_next[2:0],
         otherwin_thr1_next[2:0],
         otherwin_thr2_next[2:0],
         otherwin_thr3_next[2:0]}),
 .dout ({otherwin_thr0[2:0],
         otherwin_thr1[2:0],
         otherwin_thr2[2:0],
         otherwin_thr3[2:0]}),
  .soclk(soclk));

// Output the otherwin value of the current thread
assign otherwin_e[2:0] = ({3{tid_e[1:0] == 2'b00}} & otherwin_thr0[2:0]) |
                         ({3{tid_e[1:0] == 2'b01}} & otherwin_thr1[2:0]) | 
                         ({3{tid_e[1:0] == 2'b10}} & otherwin_thr2[2:0]) | 
                         ({3{tid_e[1:0] == 2'b11}} & otherwin_thr3[2:0]) ;

assign otherwin_pr_rd[2:0] = ({3{pr_tid_ctl[1:0] == 2'b00}} & otherwin_thr0[2:0]) |
                             ({3{pr_tid_ctl[1:0] == 2'b01}} & otherwin_thr1[2:0]) | 
                             ({3{pr_tid_ctl[1:0] == 2'b10}} & otherwin_thr2[2:0]) | 
                             ({3{pr_tid_ctl[1:0] == 2'b11}} & otherwin_thr3[2:0]) ;

exu_rml_ctl_msff_ctl_macro__width_9	otherwin_e2m2b2w	 (
 .scan_in(otherwin_e2m2b2w_scanin),
 .scan_out(otherwin_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({otherwin_e[2:0], otherwin_m[2:0], otherwin_b[2:0]}),
 .dout ({otherwin_m[2:0], otherwin_b[2:0], otherwin_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk));



// - CLEANWIN Privileged Register
//   ----------------------------
// Only one thread can be writen each cycle
// Uses write enable to control which register to update

assign cleanwin_thr0_next[2:0] = ({3{ cleanwin_we_w[0] }}                          & cleanwin_next_w[2:0]) |
                                 ({3{ cleanwin_pr_we[0]}}                          & data_1f        [2:0]) |
                                 ({3{~cleanwin_pr_we[0]}} & {3{~cleanwin_we_w[0]}} & cleanwin_thr0  [2:0]) ;

assign cleanwin_thr1_next[2:0] = ({3{ cleanwin_we_w[1] }}                          & cleanwin_next_w[2:0]) |
                                 ({3{ cleanwin_pr_we[1]}}                          & data_1f        [2:0]) |
                                 ({3{~cleanwin_pr_we[1]}} & {3{~cleanwin_we_w[1]}} & cleanwin_thr1  [2:0]) ;

assign cleanwin_thr2_next[2:0] = ({3{ cleanwin_we_w[2] }}                          & cleanwin_next_w[2:0]) |
                                 ({3{ cleanwin_pr_we[2]}}                          & data_1f        [2:0]) |
                                 ({3{~cleanwin_pr_we[2]}} & {3{~cleanwin_we_w[2]}} & cleanwin_thr2  [2:0]) ;

assign cleanwin_thr3_next[2:0] = ({3{ cleanwin_we_w[3] }}                          & cleanwin_next_w[2:0]) |
                                 ({3{ cleanwin_pr_we[3]}}                          & data_1f        [2:0]) |
                                 ({3{~cleanwin_pr_we[3]}} & {3{~cleanwin_we_w[3]}} & cleanwin_thr3  [2:0]) ;


// Stores negated CLEANWIN values
// - Use POR to reset the architectural PR values to 3'b111
assign cleanwin_thr0_next_l[2:0] = ~cleanwin_thr0_next[2:0];
assign cleanwin_thr1_next_l[2:0] = ~cleanwin_thr1_next[2:0];
assign cleanwin_thr2_next_l[2:0] = ~cleanwin_thr2_next[2:0];
assign cleanwin_thr3_next_l[2:0] = ~cleanwin_thr3_next[2:0];

exu_rml_ctl_msff_ctl_macro__width_12	cleanwin_pr		 (		
 .scan_in(cleanwin_pr_wmr_scanin),
 .scan_out(cleanwin_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({cleanwin_thr0_next_l[2:0],
         cleanwin_thr1_next_l[2:0],
         cleanwin_thr2_next_l[2:0],
         cleanwin_thr3_next_l[2:0]}),
 .dout ({cleanwin_thr0_l[2:0],
         cleanwin_thr1_l[2:0],
         cleanwin_thr2_l[2:0],
         cleanwin_thr3_l[2:0]}),
  .soclk(soclk));

assign cleanwin_thr0[2:0] = ~cleanwin_thr0_l[2:0];
assign cleanwin_thr1[2:0] = ~cleanwin_thr1_l[2:0];
assign cleanwin_thr2[2:0] = ~cleanwin_thr2_l[2:0];
assign cleanwin_thr3[2:0] = ~cleanwin_thr3_l[2:0];

// Output the cleanwin value of the current thread
assign cleanwin_e[2:0] = ({3{tid_e[1:0] == 2'b00}} & cleanwin_thr0[2:0]) |
                         ({3{tid_e[1:0] == 2'b01}} & cleanwin_thr1[2:0]) | 
                         ({3{tid_e[1:0] == 2'b10}} & cleanwin_thr2[2:0]) | 
                         ({3{tid_e[1:0] == 2'b11}} & cleanwin_thr3[2:0]) ;

assign cleanwin_pr_rd[2:0] = ({3{pr_tid_ctl[1:0] == 2'b00}} & cleanwin_thr0[2:0]) |
                             ({3{pr_tid_ctl[1:0] == 2'b01}} & cleanwin_thr1[2:0]) | 
                             ({3{pr_tid_ctl[1:0] == 2'b10}} & cleanwin_thr2[2:0]) | 
                             ({3{pr_tid_ctl[1:0] == 2'b11}} & cleanwin_thr3[2:0]) ;


exu_rml_ctl_msff_ctl_macro__width_9	cleanwin_e2m2b2w	 (
 .scan_in(cleanwin_e2m2b2w_scanin),
 .scan_out(cleanwin_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  ({cleanwin_e[2:0], cleanwin_m[2:0], cleanwin_b[2:0]}),
 .dout ({cleanwin_m[2:0], cleanwin_b[2:0], cleanwin_w[2:0]}),
  .siclk(siclk),
  .soclk(soclk));


// - WSTATE Privileged Register
//   -------------------------------

// Only one thread can be writen each cycle
// Uses write enable to control which register to update

assign wstate_thr0_next[5:0] = ({6{ wstate_pr_we[0]}} & data_1f      [5:0]) |
                               ({6{~wstate_pr_we[0]}} & wstate_thr0  [5:0]);

assign wstate_thr1_next[5:0] = ({6{ wstate_pr_we[1]}} & data_1f      [5:0]) |
                               ({6{~wstate_pr_we[1]}} & wstate_thr1  [5:0]);

assign wstate_thr2_next[5:0] = ({6{ wstate_pr_we[2]}} & data_1f      [5:0]) |
                               ({6{~wstate_pr_we[2]}} & wstate_thr2  [5:0]);

assign wstate_thr3_next[5:0] = ({6{ wstate_pr_we[3]}} & data_1f      [5:0]) |
                               ({6{~wstate_pr_we[3]}} & wstate_thr3  [5:0]);

exu_rml_ctl_msff_ctl_macro__width_24	wstate_pr	 (		
 .scan_in(wstate_pr_wmr_scanin),
 .scan_out(wstate_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({wstate_thr0_next[5:0],
         wstate_thr1_next[5:0],
         wstate_thr2_next[5:0],
         wstate_thr3_next[5:0]}),
 .dout ({wstate_thr0[5:0],
         wstate_thr1[5:0],
         wstate_thr2[5:0],
         wstate_thr3[5:0]}),
  .soclk(soclk));

// Output the wstate value of the current thread
assign wstate_b[5:0] = ({6{tid_b[1:0] == 2'b00}} & wstate_thr0[5:0]) |
                       ({6{tid_b[1:0] == 2'b01}} & wstate_thr1[5:0]) | 
                       ({6{tid_b[1:0] == 2'b10}} & wstate_thr2[5:0]) | 
                       ({6{tid_b[1:0] == 2'b11}} & wstate_thr3[5:0]) ;


assign wstate_pr_rd[5:0] = ({6{pr_tid_ctl[1:0] == 2'b00}} & wstate_thr0[5:0]) |
                           ({6{pr_tid_ctl[1:0] == 2'b01}} & wstate_thr1[5:0]) | 
                           ({6{pr_tid_ctl[1:0] == 2'b10}} & wstate_thr2[5:0]) | 
                           ({6{pr_tid_ctl[1:0] == 2'b11}} & wstate_thr3[5:0]) ;


// - CWP Privileged Register
//   -------------------------------

// Only one thread can be writen each cycle
// Uses write enable to control which register to update

exu_rml_ctl_msff_ctl_macro__width_12	cwp_pr			 (		
 .scan_in(cwp_pr_wmr_scanin),
 .scan_out(cwp_pr_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  ({cwp_thr0_next[2:0],
         cwp_thr1_next[2:0],
         cwp_thr2_next[2:0],
         cwp_thr3_next[2:0]}),
 .dout ({cwp_thr0[2:0],
         cwp_thr1[2:0],
         cwp_thr2[2:0],
         cwp_thr3[2:0]}),
  .soclk(soclk));

// Output the cwp value of the current thread
assign cwp_e[2:0] = ({3{tid_e[1:0] == 2'b00}} & cwp_thr0[2:0]) |
                    ({3{tid_e[1:0] == 2'b01}} & cwp_thr1[2:0]) | 
                    ({3{tid_e[1:0] == 2'b10}} & cwp_thr2[2:0]) | 
                    ({3{tid_e[1:0] == 2'b11}} & cwp_thr3[2:0]) ;

assign cwp_pr_rd[2:0] = ({3{pr_tid_ctl[1:0] == 2'b00}} & cwp_thr0[2:0]) |
                        ({3{pr_tid_ctl[1:0] == 2'b01}} & cwp_thr1[2:0]) | 
                        ({3{pr_tid_ctl[1:0] == 2'b10}} & cwp_thr2[2:0]) | 
                        ({3{pr_tid_ctl[1:0] == 2'b11}} & cwp_thr3[2:0]) ;

assign exu_cwp_thr0[2:0] = cwp_thr0[2:0];
assign exu_cwp_thr1[2:0] = cwp_thr1[2:0];
assign exu_cwp_thr2[2:0] = cwp_thr2[2:0];
assign exu_cwp_thr3[2:0] = cwp_thr3[2:0];

exu_rml_ctl_msff_ctl_macro__width_3	cwp_e2m2b2w		 (
 .scan_in(cwp_e2m2b2w_scanin),
 .scan_out(cwp_e2m2b2w_scanout),
 .l1clk(l1clk_pm1),
 .din  (cwp_e[2:0]),
 .dout (cwp_m[2:0]),
  .siclk(siclk),
  .soclk(soclk));



// =============================================================================
// Priviledged Registers ASI access
// =============================================================================
// - Control cycle and data cycles are interleaved
// - Control cycles are identified by a "1" in bit [64]
// - ASI reads and writes are single cycle operations
// - control is decoded in one cycle and data is directed in the next
// =============================================================================
// assertion: ASI access should not happen when there is valid instruction
//            in the pipeline.
// =============================================================================
// 
//
// Pipeline:
// --------------------------------------
// > latch incoming ctl/data packet
// --------------------------------------
// detect ctl relevence                |
// generate control                    |
//  (send ctl for IRF_ECC to pick)     |
// -------------------------          Data
// > Latch ctl                         |
// -------------------------           |
// setup read/write ctl in datapath    |
//                           <---------+
// -------------------------
// > read/write data
// -------------------------
// assemble return data packet
//
// -------------------------
// > ASI Data out
// -------------------------



// Packet parsing and recognition
// ---------------------------------------------
assign data_1f[63:48] =  edp_rng_in_ff[63:48];
assign data_1f[7:0]   =  edp_rng_in_ff[7:0];
assign ctl_1f = edp_rng_in_ff[64];

// decode the packet, packet must be:
// - a valid, control packet for reading/writing
// - a PR operation
// - for the current thread group
// - to one of the targeted PRs

assign pr_relevent = ctl_1f & data_1f[`BUS_VLD] & (~data_1f[`BUS_ACK]) &
                     (data_1f[`BUS_REGID_END:`BUS_REGID_ST] == `PR) & 
                     (data_1f[`BUS_TID_END] == dec_thread_group);

assign asr_relevent = ctl_1f & data_1f[`BUS_VLD] & (~data_1f[`BUS_ACK]) &
                     (data_1f[`BUS_REGID_END:`BUS_REGID_ST] == `ASR)& 
                     (data_1f[`BUS_TID_END] == dec_thread_group);

assign asi_relevent = ctl_1f & data_1f[`BUS_VLD] & (~data_1f[`BUS_ACK]) &
                     (data_1f[`BUS_REGID_END:`BUS_REGID_ST] == `ASI) & 
                     (data_1f[`BUS_TID_END] == dec_thread_group) &
                     (data_1f[54] & (data_1f[51] | data_1f[49]) );

assign detected_empty_pkt = ctl_1f & ~data_1f[`BUS_VLD];


// Computing controls in the current cycle
// ---------------------------------------------
// - then flop controls to the next cycle to control the next packet
// - the signals become *_ctl once they are flopped and appear in
//   in the data cycle
assign pr_tid[1:0] = data_1f[(`BUS_TID_END-1):`BUS_TID_ST];

assign match_cwp        = pr_relevent  & (data_1f[52:48]==5'b01001);
assign match_cansave    = pr_relevent  & (data_1f[52:48]==5'b01010);
assign match_canrestore = pr_relevent  & (data_1f[52:48]==5'b01011);
assign match_cleanwin   = pr_relevent  & (data_1f[52:48]==5'b01100);
assign match_otherwin   = pr_relevent  & (data_1f[52:48]==5'b01101);
assign match_wstate     = pr_relevent  & (data_1f[52:48]==5'b01110);

assign match_yreg       = asr_relevent & (data_1f[52:48]==5'b00000);
assign match_ccr        = asr_relevent & (data_1f[52:48]==5'b00010);

// ASI == 42;  VA == 08
// use assertion to check that when data_1f[3], VA == 0x08

assign match_imask	= asi_relevent & (data_1f[55:48] == 8'h42) & data_1f[3];
assign match_irf_ecc	= asi_relevent & (data_1f[55:48] == 8'h48);

assign pr_rd = ( data_1f[`BUS_RD]) &
                (match_cwp        |        
	     	 match_cansave    |   
		 match_canrestore |
		 match_cleanwin   |  
		 match_otherwin   |  
		 match_wstate     );  

assign send_ack[0] = match_cwp        |        
	     	     match_cansave    |   
		     match_canrestore |
		     match_cleanwin   |  
		     match_otherwin   |  
		     match_wstate     |  
                     match_yreg       |        
		     match_ccr        |
		     match_imask      |
		     match_irf_ecc;

assign pr_rd_src[0] = ( data_1f[`BUS_RD]) & match_cwp;        
assign pr_rd_src[1] = ( data_1f[`BUS_RD]) & match_cansave;    
assign pr_rd_src[2] = ( data_1f[`BUS_RD]) & match_canrestore; 
assign pr_rd_src[3] = ( data_1f[`BUS_RD]) & match_cleanwin;   
assign pr_rd_src[4] = ( data_1f[`BUS_RD]) & match_otherwin;   
assign pr_rd_src[5] = ( data_1f[`BUS_RD]) & match_wstate;     
				  					    
assign pr_wt_src[0] = (~data_1f[`BUS_RD]) & match_cwp;        
assign pr_wt_src[1] = (~data_1f[`BUS_RD]) & match_cansave;    
assign pr_wt_src[2] = (~data_1f[`BUS_RD]) & match_canrestore; 
assign pr_wt_src[3] = (~data_1f[`BUS_RD]) & match_cleanwin;   
assign pr_wt_src[4] = (~data_1f[`BUS_RD]) & match_otherwin;   
assign pr_wt_src[5] = (~data_1f[`BUS_RD]) & match_wstate;    


assign detected_wrpr_cwp = pr_wt_src[0];

// IRF ECC is a read-only indeterminate write
assign detected_rd_irf_ecc  = ( data_1f[`BUS_RD]) & match_irf_ecc;


// Set rd_irf_ecc controls
assign rd_irf_ecc_valid = detected_rd_irf_ecc;
assign rd_irf_ecc_addr[4:0] = data_1f[7:3];

// Output control to Pick 
// ---------------------------------------------
//  MUX-IN BIST FOR IRF TEST PORT HERE
assign exu_test_valid		=                      rd_irf_ecc_valid_lth  |                     mbi_irf_read_en_p1;
assign exu_test_tid[1:0]	= ({2{~mbi_run_lth}} & pr_tid_ctl[1:0]     ) | ({2{mbi_run_lth}} & mbi_addr_lth[6:5]);
assign exu_test_addr[4:0]	= ({5{~mbi_run_lth}} & pr_addr_ctl[4:0]    ) | ({5{mbi_run_lth}} & mbi_addr_lth[4:0]);

exu_rml_ctl_msff_ctl_macro__width_4	pipe_rd_irf_ecc_valid_pp2p2d2e	 (
 .scan_in(pipe_rd_irf_ecc_valid_pp2p2d2e_scanin),
 .scan_out(pipe_rd_irf_ecc_valid_pp2p2d2e_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({rd_irf_ecc_valid     , exu_test_valid , test_valid_p     , rml_test_valid_d}),
 .dout  ({rd_irf_ecc_valid_lth , test_valid_p   , rml_test_valid_d , ack_irf_ecc_done}),
  .siclk(siclk),
  .soclk(soclk));



// Save thread ID for WRPR CWP
// ---------------------------------------------
// save control value in the first ASI stub cycle
 
assign wrpr_cwp_tid_next[1:0] = ({2{ detected_wrpr_cwp}} & pr_tid           [1:0]) |
                                ({2{~detected_wrpr_cwp}} & wrpr_cwp_tid_hold[1:0]) ;

exu_rml_ctl_msff_ctl_macro__width_2	save_wrpr_cwp_tid	 (
 .scan_in(save_wrpr_cwp_tid_scanin),
 .scan_out(save_wrpr_cwp_tid_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({wrpr_cwp_tid_next[1:0]}),
 .dout  ({wrpr_cwp_tid_hold[1:0]}),
  .siclk(siclk),
  .soclk(soclk));


// Save thread ID for RD_IRF_ECC
// ---------------------------------------------
// save control value in the first ASI stub cycle
 
assign rd_irf_tid_next[1:0] = ({2{ detected_rd_irf_ecc}} & pr_tid         [1:0]) |
                              ({2{~detected_rd_irf_ecc}} & rd_irf_tid_hold[1:0]) ;

exu_rml_ctl_msff_ctl_macro__width_2	save_rd_irf_tid		 (
 .scan_in(save_rd_irf_tid_scanin),
 .scan_out(save_rd_irf_tid_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({rd_irf_tid_next[1:0]}),
 .dout  ({rd_irf_tid_hold[1:0]}),
  .siclk(siclk),
  .soclk(soclk));


// Save new CWP when there is a write to CWP PR
// ---------------------------------------------
// save new CWP data in second ASI stub cycle

assign pr_new_cwp_wt[2:0] = ({3{ pr_wt_cwp_ctl}} & data_1f[2:0]) |
                            ({3{~pr_wt_cwp_ctl}} & pr_new_cwp_wt_hold[2:0]);

exu_rml_ctl_msff_ctl_macro__width_3	save_wrpr_cwp		 (
 .scan_in(save_wrpr_cwp_scanin),
 .scan_out(save_wrpr_cwp_scanout),
 .l1clk	(l1clk_pm1),
 .din	({pr_new_cwp_wt[2:0]}),
 .dout	({pr_new_cwp_wt_hold[2:0]     }),
  .siclk(siclk),
  .soclk(soclk));



// WRPR_done indicator to be sent out on the next empty packet
// ---------------------------------------------
assign send_ack_wrpr_cwp = (ack_wrpr_cwp_done  & detected_empty_pkt) |
                     (done_wrpr_cwp_hold & detected_empty_pkt) ;

assign done_wrpr_cwp = (~send_ack_wrpr_cwp) &     
                       ( ack_wrpr_cwp_done | done_wrpr_cwp_hold);

exu_rml_ctl_msff_ctl_macro__width_1	save_done_wrpr_cwp	 (
 .scan_in(save_done_wrpr_cwp_scanin),
 .scan_out(save_done_wrpr_cwp_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({done_wrpr_cwp}),
 .dout  ({done_wrpr_cwp_hold}),
  .siclk(siclk),
  .soclk(soclk));

assign send_ack[1] = send_ack_wrpr_cwp;


// IRF_ECC done indicator to be sent out on the next empty packet 
// ---------------------------------------------
// - WRPR has higher priorty
// - need to hold back sending irf_ecc ack

assign send_ack_irf_ecc = ~send_ack_wrpr_cwp &
                          ((ack_irf_ecc_done  & detected_empty_pkt) |
                           (done_irf_ecc_hold & detected_empty_pkt));

assign done_irf_ecc = (~send_ack_irf_ecc) &     
                       ( ack_irf_ecc_done | done_irf_ecc_hold);

exu_rml_ctl_msff_ctl_macro__width_1	save_done_irf_ecc	 (
 .scan_in(save_done_irf_ecc_scanin),
 .scan_out(save_done_irf_ecc_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({done_irf_ecc}),
 .dout  ({done_irf_ecc_hold}),
  .siclk(siclk),
  .soclk(soclk));

assign irf_ecc_data[7:0] = ({8{ ack_irf_ecc_done}} & edp_rs3_ecc_e[7:0]    ) |
                           ({8{~ack_irf_ecc_done}} & irf_ecc_data_hold[7:0]) ;

exu_rml_ctl_msff_ctl_macro__width_8	save_irf_ecc_data	 (
 .scan_in(save_irf_ecc_data_scanin),
 .scan_out(save_irf_ecc_data_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({irf_ecc_data[7:0]}),
 .dout  ({irf_ecc_data_hold[7:0]}),
  .siclk(siclk),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_1	pipe_ack_irf_ecc	 (
 .scan_in(pipe_ack_irf_ecc_scanin),
 .scan_out(pipe_ack_irf_ecc_scanout),
 .l1clk	(l1clk_pm1),
 .din   ({send_ack_irf_ecc}),
 .dout  ({send_ack_irf_ecc_piped}),
  .siclk(siclk),
  .soclk(soclk));


assign rml_irf_ecc_data[7:0] = irf_ecc_data[7:0];

assign rml_rng_ack_sel_ctl = send_ack[0] | send_ack_irf_ecc | send_ack_wrpr_cwp;



// EDP control signals for passing down DATA/CTL packets
// ---------------------------------------------
assign asr_rd_src[0] = ( data_1f[`BUS_RD]) & match_yreg;        
assign asr_rd_src[1] = ( data_1f[`BUS_RD]) & match_ccr; 
assign asr_rd_src[2] = ( data_1f[`BUS_RD]) & match_imask;   

assign asr_wt_src[0] = (~data_1f[`BUS_RD]) & match_yreg;        
assign asr_wt_src[1] = (~data_1f[`BUS_RD]) & match_ccr;    
assign asr_wt_src[2] = (~data_1f[`BUS_RD]) & match_imask;  

// Flop controls for the next data packet
exu_rml_ctl_msff_ctl_macro__width_26	asr_ctl			 (
	.scan_in(asr_ctl_scanin),
	.scan_out(asr_ctl_scanout),
	.l1clk	(l1clk_pm1),

	.din	({pr_tid[1:0], 
		  rd_irf_ecc_addr[4:0],
                  pr_rd, 
                  pr_rd_src[5:0],
                  asr_rd_src[2:0],
                  pr_wt_src[5:0],
                  asr_wt_src[2:0]}),

	.dout	({pr_tid_ctl[1:0],
		  pr_addr_ctl[4:0],
                  pr_rd_ctl,
                  pr_rd_src_ctl[5:0],
		  asi_rd_imask_ctl,
                  asr_rd_ccr_ctl,
                  asr_rd_yreg_ctl,
                  pr_wt_wstate_ctl,
                  pr_wt_otherwin_ctl,
                  pr_wt_cleanwin_ctl,
                  pr_wt_canrestore_ctl,
                  pr_wt_cansave_ctl,
                  pr_wt_cwp_ctl,
		  asi_wt_imask_ctl,
                  asr_wt_ccr_ctl,
	  	  asr_wt_yreg_ctl	 }),
  .siclk(siclk),
  .soclk(soclk));



// ASR datapath
// ------------------------


assign rml_rng_data_out[2:0] = ({3{pr_rd_src_ctl[0]}} & cwp_pr_rd[2:0]       ) |
                               ({3{pr_rd_src_ctl[1]}} & cansave_pr_rd[2:0]   ) |
                               ({3{pr_rd_src_ctl[2]}} & canrestore_pr_rd[2:0]) |
                               ({3{pr_rd_src_ctl[3]}} & cleanwin_pr_rd[2:0]  ) |
                               ({3{pr_rd_src_ctl[4]}} & otherwin_pr_rd[2:0]  ) |
                               ({3{pr_rd_src_ctl[5]}} & wstate_pr_rd[2:0]    );

assign rml_rng_data_out[5:3] = ({3{pr_rd_src_ctl[5]}} & wstate_pr_rd[5:3]);

assign rml_rng_wt_imask_ctl	= asi_wt_imask_ctl;
assign rml_rng_wt_ccr_ctl	= asr_wt_ccr_ctl;
assign rml_rng_rd_ctl[4:0]	= {send_ack_irf_ecc_piped, asi_rd_imask_ctl,asr_rd_yreg_ctl, asr_rd_ccr_ctl, pr_rd_ctl};

assign rml_rng_ack_ctl[1:0] = send_ack[1:0];
assign rml_rng_ack_cwp_tid[1:0] = wrpr_cwp_tid_hold[1:0];
assign rml_rng_ack_ecc_tid[1:0] = rd_irf_tid_hold[1:0];

assign rml_rng_ack_det_vld  = ~detected_wrpr_cwp &  ~detected_rd_irf_ecc;





 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Y Register   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_rml_ctl_l1clkhdr_ctl_macro clkgen_pm2	(
 .l2clk( l2clk					),
 .l1en ( asr_wt_yreg_ctl | ect_yreg_wr_w	),
 .l1clk( l1clk_pm2				),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

assign yreg_rng_we[0]		= asr_wt_yreg_ctl & (pr_tid_ctl[1:0] == 2'b00);
assign yreg_rng_we[1]		= asr_wt_yreg_ctl & (pr_tid_ctl[1:0] == 2'b01);
assign yreg_rng_we[2]		= asr_wt_yreg_ctl & (pr_tid_ctl[1:0] == 2'b10);
assign yreg_rng_we[3]		= asr_wt_yreg_ctl & (pr_tid_ctl[1:0] == 2'b11);

assign yreg_w_we[0]		= ect_yreg_wr_w   & (ect_tid_lth_w[1:0]   == 2'b00);
assign yreg_w_we[1]		= ect_yreg_wr_w   & (ect_tid_lth_w[1:0]   == 2'b01);
assign yreg_w_we[2]		= ect_yreg_wr_w   & (ect_tid_lth_w[1:0]   == 2'b10);
assign yreg_w_we[3]		= ect_yreg_wr_w   & (ect_tid_lth_w[1:0]   == 2'b11);


assign arch_yreg_tid0_in[31:0]	= ({32{ yreg_rng_we[0]                }} & edp_rng_in_ff[31:0]    ) |
				  ({32{                   yreg_w_we[0]}} & edp_rd_ff_w[63:32]     ) |
				  ({32{~yreg_rng_we[0] & ~yreg_w_we[0]}} & arch_yreg_tid0_ff[31:0]);

assign arch_yreg_tid1_in[31:0]	= ({32{ yreg_rng_we[1]                }} & edp_rng_in_ff[31:0]    ) |
				  ({32{                   yreg_w_we[1]}} & edp_rd_ff_w[63:32]     ) |
				  ({32{~yreg_rng_we[1] & ~yreg_w_we[1]}} & arch_yreg_tid1_ff[31:0]);

assign arch_yreg_tid2_in[31:0]	= ({32{ yreg_rng_we[2]                }} & edp_rng_in_ff[31:0]    ) |
				  ({32{                   yreg_w_we[2]}} & edp_rd_ff_w[63:32]     ) |
				  ({32{~yreg_rng_we[2] & ~yreg_w_we[2]}} & arch_yreg_tid2_ff[31:0]);

assign arch_yreg_tid3_in[31:0]	= ({32{ yreg_rng_we[3]                }} & edp_rng_in_ff[31:0]    ) |
				  ({32{                   yreg_w_we[3]}} & edp_rd_ff_w[63:32]     ) |
				  ({32{~yreg_rng_we[3] & ~yreg_w_we[3]}} & arch_yreg_tid3_ff[31:0]);


exu_rml_ctl_msff_ctl_macro__width_32	i_yreg0_ff	 (		
 .scan_in(i_yreg0_ff_wmr_scanin),
 .scan_out(i_yreg0_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk_pm2			),
 .din  ( arch_yreg_tid0_in[31:0]	),
 .dout ( arch_yreg_tid0_ff[31:0]	),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_32	i_yreg1_ff	 (		
 .scan_in(i_yreg1_ff_wmr_scanin),
 .scan_out(i_yreg1_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk_pm2			),
 .din  ( arch_yreg_tid1_in[31:0]	),
 .dout ( arch_yreg_tid1_ff[31:0]	),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_32	i_yreg2_ff	 (		
 .scan_in(i_yreg2_ff_wmr_scanin),
 .scan_out(i_yreg2_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk_pm2			),
 .din  ( arch_yreg_tid2_in[31:0]	),
 .dout ( arch_yreg_tid2_ff[31:0]	),
  .soclk(soclk));

exu_rml_ctl_msff_ctl_macro__width_32	i_yreg3_ff	 (		
 .scan_in(i_yreg3_ff_wmr_scanin),
 .scan_out(i_yreg3_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk_pm2			),
 .din  ( arch_yreg_tid3_in[31:0]	),
 .dout ( arch_yreg_tid3_ff[31:0]	),
  .soclk(soclk));


assign exu_y_data_e[31:0]	= ({32{tid4_e[0]}} & arch_yreg_tid0_ff[31:0]) |
				  ({32{tid4_e[1]}} & arch_yreg_tid1_ff[31:0]) |
				  ({32{tid4_e[2]}} & arch_yreg_tid2_ff[31:0]) |
				  ({32{tid4_e[3]}} & arch_yreg_tid3_ff[31:0]);

assign rml_rng_y_data[31:0]	= ({32{pr_tid_ctl[1:0] == 2'b00}} & arch_yreg_tid0_ff[31:0]) |
				  ({32{pr_tid_ctl[1:0] == 2'b01}} & arch_yreg_tid1_ff[31:0]) |
				  ({32{pr_tid_ctl[1:0] == 2'b10}} & arch_yreg_tid2_ff[31:0]) |
				  ({32{pr_tid_ctl[1:0] == 2'b11}} & arch_yreg_tid3_ff[31:0]);


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Y Register   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_rml_ctl_spare_ctl_macro__num_6 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk));



supply0 vss;
supply1 vdd;

// fixscan start:
assign mbist_scanin              = scan_in                  ;
assign cwp_trap_scanin           = mbist_scanout            ;
assign decoded_inst_d2e_scanin   = cwp_trap_scanout         ;
assign decoded_inst_e2m_scanin   = decoded_inst_d2e_scanout ;
assign decoded_inst_m2b_scanin   = decoded_inst_e2m_scanout ;
assign decoded_inst_b2w_scanin   = decoded_inst_m2b_scanout ;
assign tid_p2d2e2m2b2w_scanin    = decoded_inst_b2w_scanout ;
assign inst_vld_e2m2b2w_scanin   = tid_p2d2e2m2b2w_scanout  ;
assign exception_detected_m2b_scanin = inst_vld_e2m2b2w_scanout ;
assign flush_exu_b2w_scanin      = exception_detected_m2b_scanout;
assign exception_report_m2b_scanin = flush_exu_b2w_scanout    ;
assign wrcwp_in_playf_scanin     = exception_report_m2b_scanout;
assign pr_wt_ff_scanin           = wrcwp_in_playf_scanout   ;
assign trap_ccr_cwp_ff_scanin    = pr_wt_ff_scanout         ;
assign winblock_slot_tid_m2d2e2m_scanin = trap_ccr_cwp_ff_scanout  ;
assign i_rml_restore_en_ff_scanin = winblock_slot_tid_m2d2e2m_scanout;
assign cwp_m2b_scanin            = i_rml_restore_en_ff_scanout;
assign cwp_b2w_scanin            = cwp_m2b_scanout          ;
assign cwp_speculative_scanin    = cwp_b2w_scanout          ;
assign cansave_e2m2b2w_scanin    = cwp_speculative_scanout  ;
assign canrestore_e2m2b2w_scanin = cansave_e2m2b2w_scanout  ;
assign otherwin_e2m2b2w_scanin   = canrestore_e2m2b2w_scanout;
assign cleanwin_e2m2b2w_scanin   = otherwin_e2m2b2w_scanout ;
assign cwp_e2m2b2w_scanin        = cleanwin_e2m2b2w_scanout ;
assign pipe_rd_irf_ecc_valid_pp2p2d2e_scanin = cwp_e2m2b2w_scanout      ;
assign save_wrpr_cwp_tid_scanin  = pipe_rd_irf_ecc_valid_pp2p2d2e_scanout;
assign save_rd_irf_tid_scanin    = save_wrpr_cwp_tid_scanout;
assign save_wrpr_cwp_scanin      = save_rd_irf_tid_scanout  ;
assign save_done_wrpr_cwp_scanin = save_wrpr_cwp_scanout    ;
assign save_done_irf_ecc_scanin  = save_done_wrpr_cwp_scanout;
assign save_irf_ecc_data_scanin  = save_done_irf_ecc_scanout;
assign pipe_ack_irf_ecc_scanin   = save_irf_ecc_data_scanout;
assign asr_ctl_scanin            = pipe_ack_irf_ecc_scanout ;
assign spares_scanin             = asr_ctl_scanout          ;
assign scan_out                  = spares_scanout           ;

assign old_gl_ptr_wmr_scanin     = wmr_scan_in              ;
assign cansave_pr_wmr_scanin     = old_gl_ptr_wmr_scanout   ;
assign canrestore_pr_wmr_scanin  = cansave_pr_wmr_scanout   ;
assign otherwin_pr_wmr_scanin    = canrestore_pr_wmr_scanout;
assign cleanwin_pr_wmr_scanin    = otherwin_pr_wmr_scanout  ;
assign wstate_pr_wmr_scanin      = cleanwin_pr_wmr_scanout  ;
assign cwp_pr_wmr_scanin         = wstate_pr_wmr_scanout    ;
assign i_yreg0_ff_wmr_scanin     = cwp_pr_wmr_scanout       ;
assign i_yreg1_ff_wmr_scanin     = i_yreg0_ff_wmr_scanout   ;
assign i_yreg2_ff_wmr_scanin     = i_yreg1_ff_wmr_scanout   ;
assign i_yreg3_ff_wmr_scanin     = i_yreg2_ff_wmr_scanout   ;
assign wmr_scan_out              = i_yreg3_ff_wmr_scanout   ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module exu_rml_ctl_l1clkhdr_ctl_macro (
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

module exu_rml_ctl_msff_ctl_macro__width_16 (
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

module exu_rml_ctl_msff_ctl_macro__width_6 (
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

module exu_rml_ctl_msff_ctl_macro__width_10 (
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

module exu_rml_ctl_msff_ctl_macro__width_9 (
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

module exu_rml_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_rml_ctl_msff_ctl_macro__width_3 (
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

module exu_rml_ctl_msff_ctl_macro__width_1 (
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

module exu_rml_ctl_msff_ctl_macro__width_2 (
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

module exu_rml_ctl_msff_ctl_macro__width_15 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0];






dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_rml_ctl_msff_ctl_macro__width_8 (
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

module exu_rml_ctl_msff_ctl_macro__width_4 (
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

module exu_rml_ctl_msff_ctl_macro__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_rml_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_rml_ctl_msff_ctl_macro__width_26 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [25:0] fdin;
wire [24:0] so;

  input [25:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [25:0] dout;
  output scan_out;
assign fdin[25:0] = din[25:0];






dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_rml_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module exu_rml_ctl_spare_ctl_macro__num_6 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;
wire si_3;
wire so_3;
wire spare3_flop_unused;
wire spare3_buf_32x_unused;
wire spare3_nand3_8x_unused;
wire spare3_inv_8x_unused;
wire spare3_aoi22_4x_unused;
wire spare3_buf_8x_unused;
wire spare3_oai22_4x_unused;
wire spare3_inv_16x_unused;
wire spare3_nand2_16x_unused;
wire spare3_nor3_4x_unused;
wire spare3_nand2_8x_unused;
wire spare3_buf_16x_unused;
wire spare3_nor2_16x_unused;
wire spare3_inv_32x_unused;
wire si_4;
wire so_4;
wire spare4_flop_unused;
wire spare4_buf_32x_unused;
wire spare4_nand3_8x_unused;
wire spare4_inv_8x_unused;
wire spare4_aoi22_4x_unused;
wire spare4_buf_8x_unused;
wire spare4_oai22_4x_unused;
wire spare4_inv_16x_unused;
wire spare4_nand2_16x_unused;
wire spare4_nor3_4x_unused;
wire spare4_nand2_8x_unused;
wire spare4_buf_16x_unused;
wire spare4_nor2_16x_unused;
wire spare4_inv_32x_unused;
wire si_5;
wire so_5;
wire spare5_flop_unused;
wire spare5_buf_32x_unused;
wire spare5_nand3_8x_unused;
wire spare5_inv_8x_unused;
wire spare5_aoi22_4x_unused;
wire spare5_buf_8x_unused;
wire spare5_oai22_4x_unused;
wire spare5_inv_16x_unused;
wire spare5_nand2_16x_unused;
wire spare5_nor3_4x_unused;
wire spare5_nand2_8x_unused;
wire spare5_buf_16x_unused;
wire spare5_nor2_16x_unused;
wire spare5_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));

cl_sc1_msff_8x spare3_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_3),
                               .so(so_3),
                               .d(1'b0),
                               .q(spare3_flop_unused));
assign si_3 = so_2;

cl_u1_buf_32x   spare3_buf_32x (.in(1'b1),
                                   .out(spare3_buf_32x_unused));
cl_u1_nand3_8x spare3_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare3_nand3_8x_unused));
cl_u1_inv_8x    spare3_inv_8x (.in(1'b1),
                                  .out(spare3_inv_8x_unused));
cl_u1_aoi22_4x spare3_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_aoi22_4x_unused));
cl_u1_buf_8x    spare3_buf_8x (.in(1'b1),
                                  .out(spare3_buf_8x_unused));
cl_u1_oai22_4x spare3_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare3_oai22_4x_unused));
cl_u1_inv_16x   spare3_inv_16x (.in(1'b1),
                                   .out(spare3_inv_16x_unused));
cl_u1_nand2_16x spare3_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare3_nand2_16x_unused));
cl_u1_nor3_4x spare3_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare3_nor3_4x_unused));
cl_u1_nand2_8x spare3_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare3_nand2_8x_unused));
cl_u1_buf_16x   spare3_buf_16x (.in(1'b1),
                                   .out(spare3_buf_16x_unused));
cl_u1_nor2_16x spare3_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare3_nor2_16x_unused));
cl_u1_inv_32x   spare3_inv_32x (.in(1'b1),
                                   .out(spare3_inv_32x_unused));

cl_sc1_msff_8x spare4_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_4),
                               .so(so_4),
                               .d(1'b0),
                               .q(spare4_flop_unused));
assign si_4 = so_3;

cl_u1_buf_32x   spare4_buf_32x (.in(1'b1),
                                   .out(spare4_buf_32x_unused));
cl_u1_nand3_8x spare4_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare4_nand3_8x_unused));
cl_u1_inv_8x    spare4_inv_8x (.in(1'b1),
                                  .out(spare4_inv_8x_unused));
cl_u1_aoi22_4x spare4_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_aoi22_4x_unused));
cl_u1_buf_8x    spare4_buf_8x (.in(1'b1),
                                  .out(spare4_buf_8x_unused));
cl_u1_oai22_4x spare4_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare4_oai22_4x_unused));
cl_u1_inv_16x   spare4_inv_16x (.in(1'b1),
                                   .out(spare4_inv_16x_unused));
cl_u1_nand2_16x spare4_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare4_nand2_16x_unused));
cl_u1_nor3_4x spare4_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare4_nor3_4x_unused));
cl_u1_nand2_8x spare4_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare4_nand2_8x_unused));
cl_u1_buf_16x   spare4_buf_16x (.in(1'b1),
                                   .out(spare4_buf_16x_unused));
cl_u1_nor2_16x spare4_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare4_nor2_16x_unused));
cl_u1_inv_32x   spare4_inv_32x (.in(1'b1),
                                   .out(spare4_inv_32x_unused));

cl_sc1_msff_8x spare5_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_5),
                               .so(so_5),
                               .d(1'b0),
                               .q(spare5_flop_unused));
assign si_5 = so_4;

cl_u1_buf_32x   spare5_buf_32x (.in(1'b1),
                                   .out(spare5_buf_32x_unused));
cl_u1_nand3_8x spare5_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare5_nand3_8x_unused));
cl_u1_inv_8x    spare5_inv_8x (.in(1'b1),
                                  .out(spare5_inv_8x_unused));
cl_u1_aoi22_4x spare5_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_aoi22_4x_unused));
cl_u1_buf_8x    spare5_buf_8x (.in(1'b1),
                                  .out(spare5_buf_8x_unused));
cl_u1_oai22_4x spare5_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare5_oai22_4x_unused));
cl_u1_inv_16x   spare5_inv_16x (.in(1'b1),
                                   .out(spare5_inv_16x_unused));
cl_u1_nand2_16x spare5_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare5_nand2_16x_unused));
cl_u1_nor3_4x spare5_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare5_nor3_4x_unused));
cl_u1_nand2_8x spare5_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare5_nand2_8x_unused));
cl_u1_buf_16x   spare5_buf_16x (.in(1'b1),
                                   .out(spare5_buf_16x_unused));
cl_u1_nor2_16x spare5_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare5_nor2_16x_unused));
cl_u1_inv_32x   spare5_inv_32x (.in(1'b1),
                                   .out(spare5_inv_32x_unused));
assign scan_out = so_5;



endmodule

