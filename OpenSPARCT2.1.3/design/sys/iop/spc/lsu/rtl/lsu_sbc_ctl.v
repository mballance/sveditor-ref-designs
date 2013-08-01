// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_sbc_ctl.v
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
module lsu_sbc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  dec_st_inst_e, 
  dec_fpldst_inst_e, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_frf_r2_addr_e, 
  dcc_lendian_pre_m, 
  dcc_tte_vld_m, 
  dcc_ldst_sz_m, 
  dcc_tid_e, 
  dcc_blk_inst_m, 
  dcc_std_inst_m, 
  dcc_asi_load_m, 
  dcc_binit_st_b, 
  dcc_casa_inst_b, 
  dcc_exception_flush_b, 
  dcc_priv_b, 
  dcc_hpriv_b, 
  dcc_stb_diag_rd_m, 
  dcc_wr_error_inj_m, 
  dcc_sync_pipe_w, 
  lsu_va_b, 
  lsu_asi_error_inject_b31, 
  lsu_asi_error_inject_b17, 
  lsu_asi_error_inject_b19, 
  lsu_asi_error_inject, 
  lsu_lsu_pmen, 
  tlu_flush_lsu_b, 
  tlu_cerer_sbdpc, 
  tlu_cerer_sbdpu, 
  tlu_cerer_sbapp, 
  tlu_cerer_sbdiou, 
  sbs0_stb_wptr_m, 
  sbs1_stb_wptr_m, 
  sbs2_stb_wptr_m, 
  sbs3_stb_wptr_m, 
  sbs4_stb_wptr_m, 
  sbs5_stb_wptr_m, 
  sbs6_stb_wptr_m, 
  sbs7_stb_wptr_m, 
  sbs0_stb_rptr, 
  sbs1_stb_rptr, 
  sbs2_stb_rptr, 
  sbs3_stb_rptr, 
  sbs4_stb_rptr, 
  sbs5_stb_rptr, 
  sbs6_stb_rptr, 
  sbs7_stb_rptr, 
  sbs_pcx_rq_vld, 
  sbs_atm_rq_vld, 
  sbs_asi_rq_vld, 
  sbs0_state_vld, 
  sbs1_state_vld, 
  sbs2_state_vld, 
  sbs3_state_vld, 
  sbs4_state_vld, 
  sbs5_state_vld, 
  sbs6_state_vld, 
  sbs7_state_vld, 
  sbs0_state_ced, 
  sbs1_state_ced, 
  sbs2_state_ced, 
  sbs3_state_ced, 
  sbs4_state_ced, 
  sbs5_state_ced, 
  sbs6_state_ced, 
  sbs7_state_ced, 
  sbs0_st_type, 
  sbs1_st_type, 
  sbs2_st_type, 
  sbs3_st_type, 
  sbs4_st_type, 
  sbs5_st_type, 
  sbs6_st_type, 
  sbs7_st_type, 
  sbs_state_asi_rngf, 
  sbs_pcx_pst_ie_p4, 
  sbs_bst_req, 
  sbs_asi_indet_req, 
  sbs_asi_indet_retire, 
  sbs_rmo_st_p4, 
  sbs_blk_st_p4, 
  sbs_stb_empty, 
  stb_cam_hit, 
  stb_cam_mhit, 
  stb_ld_part_raw, 
  stb_cam_hit_ptr, 
  stb_cam_data, 
  stb_cam_addr_b39, 
  stb_cecc_err, 
  stb_uecc_err, 
  stb_ram_ctl, 
  stb_cam_perr, 
  lmd_asi_asi, 
  lmd_asi_type, 
  lmc_ld_inst_w, 
  lmc_asi_indet_retire, 
  pic_st_pcx_sel_p3, 
  pic_st_asi_sel_p3, 
  pic_asi_sel_p4, 
  tlb_pgnum_b39, 
  tlb_tte_ie_b, 
  tlb_cam_mhit, 
  fgu_fst_ecc_error_fx2, 
  sed_bist_cmp_0, 
  sed_bist_cmp_1, 
  sed_bist_cmp_2, 
  sed_bist_cmp_3, 
  lbist_run, 
  mbi_run, 
  mbi_addr, 
  mbi_wdata, 
  mbi_stb_cam_read_en, 
  mbi_stb_cam_write_en, 
  mbi_stb_ram_read_en, 
  mbi_stb_ram_write_en, 
  bist_srm_rd_1, 
  bist_scm_rd_1, 
  sbc_thread_b, 
  sbc_st_int_sel_m, 
  sbc_std_le_m, 
  sbc_st_le_if_ie_m, 
  sbc_st_le_not_ie_m, 
  sbc_st_sz_m, 
  sbc_inv_addr_prty, 
  sbc_inv_ecc, 
  sbc_stb_ctl_data, 
  sbc_twocycle_inst_w, 
  sbc_tte_vld_b, 
  sbc_cam_wvld_m, 
  sbc_cam_wptr_vld_m, 
  sbc_cam_rptr_vld, 
  sbc_cam_rwptr, 
  sbc_cam_line_en_m, 
  sbc_ram_wptr_vld_b, 
  sbc_ram_rptr_vld, 
  sbc_ram_wptr, 
  sbc_ram_rptr, 
  sbc_cam_tid, 
  sbc_diag_wptr_w3, 
  sbc_st_rq_p2, 
  sbc_st_atomic_p2, 
  sbc_pcx_rq_p3, 
  sbc_asi_rq_p3, 
  sbc_st_sel_p3, 
  sbc_bst_sel, 
  sbc_st_sel_tid_p4, 
  sbc_st_pcx_nc, 
  sbc_pcx_bmask, 
  sbc_pcx_addr, 
  sbc_pcx_rmo_st, 
  sbc_pcx_blk_st, 
  sbc_st_asi_fs, 
  sbc_st_addr_new, 
  sbc_spd_clken, 
  sbc_ramout_clken, 
  sbc_tidb_eq_tidw, 
  sbc_tid_m, 
  sbc_st_atom_p3, 
  sbc_load_bst_addr, 
  sbc_bst_in_prog_m, 
  sbc_bst_in_prog_b, 
  sbc_bst_offset, 
  sbc_rmo_st_b, 
  sbc_rawp_rst, 
  sbc_fgu_ecc_b, 
  sbc_bst_rd_err, 
  sbc_pid_kill_store_p4_, 
  sbc_pic_kill_store_p4_, 
  sbc_sbs_kill_store_p4_, 
  sbc_force_inv, 
  sbc_st_type_p4, 
  sbc_blk_inst_b, 
  sbc_indet_block_p3, 
  lsu_block_store_stall, 
  lsu_block_store_rd, 
  lsu_block_store_tid, 
  lsu_block_store_alloc, 
  lsu_block_store_b, 
  lsu_block_store_m, 
  lsu_sbdpc_err_g, 
  lsu_sbdpu_err_g, 
  lsu_sbapp_err_g, 
  lsu_sbdiou_err_g, 
  lsu_stberr_index_g, 
  lsu_stberr_priv_g, 
  lsu_stb_flush_g, 
  lsu_frf_read_pending, 
  sbc_mbi_run, 
  lsu_mbi_stb_cam_fail, 
  lsu_mbi_stb_ram_fail, 
  lsu_mbi_scm_hit, 
  lsu_mbi_scm_mhit, 
  lsu_mbi_scm_hit_ptr, 
  lsu_mbi_scm_praw);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire stb_clken;
wire stb_cam_wptr_vld_m;
wire stb_cam_wptr_vld_b;
wire stb_cam_wptr_vld_w;
wire st_rq_p1;
wire st_rq_p2;
wire st_rq_p3;
wire st_rq_p4;
wire l1clk_pm1;
wire l1clk;
wire dff_flush_b_scanin;
wire dff_flush_b_scanout;
wire local_flush_b;
wire flush_b;
wire pipe_flush_b;
wire dff_flush_w_scanin;
wire dff_flush_w_scanout;
wire flush_w;
wire dff_inst_m_scanin;
wire dff_inst_m_scanout;
wire [4:3] bst_addr_m;
wire st_inst_vld_m;
wire dff_ldst_fp_m_scanin;
wire dff_ldst_fp_m_scanout;
wire ldst_fp_m;
wire bst_in_prog_m;
wire [1:0] st_sz_m;
wire std_inst_b;
wire [1:0] st_sz_b;
wire dff_ldst_sz_b_scanin;
wire dff_ldst_sz_b_scanout;
wire tidm_eq_tidb;
wire [2:0] tid_m;
wire [2:0] tid_b;
wire dff_st_w_scanin;
wire dff_st_w_scanout;
wire casa_inst_w;
wire st_lendian_b;
wire lendian_pre_b;
wire st_pre_le_m;
wire block_store_lendian;
wire std_le_m;
wire st_le_if_ie_m;
wire st_le_not_ie_m;
wire dff_st_le_b_scanin;
wire dff_st_le_b_scanout;
wire stb_cam_hit_b;
wire stb_cam_mhit_b;
wire stb_ld_part_raw_b;
wire [2:0] stb_cam_hit_ptr_b;
wire dff_cam_hit_scanin;
wire dff_cam_hit_scanout;
wire [2:0] tid_w;
wire stb_cam_hit_w;
wire stb_cam_mhit_w;
wire stb_ld_part_raw_w;
wire [2:0] stb_cam_hit_ptr_w;
wire full_raw_w;
wire io_or_asi_load_w;
wire [7:0] thread_w;
wire [7:0] thread_m;
wire mbi_run_local;
wire dff_ram_wptr_vld_b_scanin;
wire dff_ram_wptr_vld_b_scanout;
wire stb_ram_wptr_vld_b;
wire std_inst_w;
wire dff_stb_wptr_vld_w_scanin;
wire dff_stb_wptr_vld_w_scanout;
wire unflushed_store_w;
wire [2:0] tid_e;
wire bst_in_prog_e;
wire [2:0] bst_tid;
wire dff_tid_m_scanin;
wire dff_tid_m_scanout;
wire dff_thread_b_scanin;
wire dff_thread_b_scanout;
wire [7:0] thread_b;
wire [2:0] stb_wptr;
wire [2:0] cam_wptr_m;
wire st_pcx_rq_p2;
wire st_asi_rq_p2;
wire any_bst_req;
wire stb_diag_rd_w;
wire [5:3] va_w;
wire [2:0] st_rd_tid;
wire [2:0] stb_rptr_pcx;
wire dff_cam_wptr_scanin;
wire dff_cam_wptr_scanout;
wire [2:0] cam_wptr_b;
wire [2:0] cam_wptr_w;
wire [2:0] cam_wptr_w2;
wire [2:0] cam_wptr_w3;
wire dff_ram_rptr_scanin;
wire dff_ram_rptr_scanout;
wire [2:0] ram_rptr_d1;
wire stb_diag_rd_b_in;
wire ram_rptr_vld_2;
wire [2:0] ram_rptr_d2;
wire stb_diag_rd_b;
wire [7:0] st_rd_thread;
wire [7:0] asi_rq_vld;
wire asi_indet_block;
wire asi_indet_sel_qual_p2;
wire asi_indet_sel_p3;
wire asi_rq_blocked_p1;
wire [7:0] pcx_rq_vld;
wire [7:0] st_rq_vld_p1;
wire [7:0] st_rq_sel_p2;
wire [7:0] st_sel_p3;
wire [7:0] st_rq_asi_p1;
wire dff_st_rq_p2_scanin;
wire dff_st_rq_p2_scanout;
wire [7:0] st_rq_vld_p2;
wire [7:0] st_rq_asi_p2;
wire asi_rq_blocked_p2;
wire stb_hazard_p2;
wire st_pcx_rq_p3;
wire st_asi_rq_p3;
wire st_lru8_scanin;
wire st_lru8_scanout;
wire [7:0] st_lru_update_p3;
wire [7:0] st_rq_sel_unqual_p2;
wire st_asi_unqual_p2;
wire [2:0] st_tid_p2;
wire asi_indet_sel_p2;
wire dff_indet_temp_scanin;
wire dff_indet_temp_scanout;
wire asi_rq_blocked_p3;
wire indet_block_req_p2;
wire indet_block_req_p3;
wire [7:0] bst_sel;
wire dff_st_sel_p3_scanin;
wire dff_st_sel_p3_scanout;
wire [7:0] st_rq_sel_p3;
wire [7:0] st_atom_p3;
wire st_asi_fs_p3;
wire asi_indet_in;
wire dff_asi_indet_scanin;
wire dff_asi_indet_scanout;
wire dff_st_sel_p4_scanin;
wire dff_st_sel_p4_scanout;
wire [7:0] st_sel_p4;
wire st_asi_sel_p4;
wire st_pcx_sel_p4;
wire [2:0] st_sel_tid_p4;
wire bst_p2;
wire pst_ie_p4;
wire [7:0] bmask_ie;
wire [1:0] st_type_enc;
wire dff_cerer_scanin;
wire dff_cerer_scanout;
wire cerer_sbdpc;
wire cerer_sbdpu;
wire cerer_sbapp;
wire cerer_sbdiou;
wire sbdpc_err;
wire st_err_flush;
wire sbdpu_err;
wire sbapp_err;
wire sbdiou_err;
wire kill_store_p4_;
wire [1:0] stb_priv;
wire dff_stb_err_scanin;
wire dff_stb_err_scanout;
wire [7:0] fatal_err_cond_in;
wire [7:0] fatal_err_cond;
wire dff_fatal_err_scanin;
wire dff_fatal_err_scanout;
wire dff_bst_addr_pipe_scanin;
wire dff_bst_addr_pipe_scanout;
wire [4:3] bst_addr_b;
wire [4:3] bst_addr0_in;
wire [4:3] bst_addr0;
wire [4:3] bst_addr1_in;
wire [4:3] bst_addr1;
wire [4:3] bst_addr2_in;
wire [4:3] bst_addr2;
wire [4:3] bst_addr3_in;
wire [4:3] bst_addr3;
wire [4:3] bst_addr4_in;
wire [4:3] bst_addr4;
wire [4:3] bst_addr5_in;
wire [4:3] bst_addr5;
wire [4:3] bst_addr6_in;
wire [4:3] bst_addr6;
wire [4:3] bst_addr7_in;
wire [4:3] bst_addr7;
wire dff_bst_addr_scanin;
wire dff_bst_addr_scanout;
wire [7:0] bst_lendian_in;
wire [7:0] bst_lendian;
wire dff_bst_lendian_scanin;
wire dff_bst_lendian_scanout;
wire bst_busy_rst;
wire [2:0] bst_count;
wire bst_busy_in;
wire bst_busy;
wire dff_bst_busy_scanin;
wire dff_bst_busy_scanout;
wire bst_busy_out;
wire bst_lru8_scanin;
wire bst_lru8_scanout;
wire [7:0] bst_sel_unqual_p;
wire dff_bst_req_scanin;
wire dff_bst_req_scanout;
wire [7:0] bst_sel_unqual;
wire frf_read_pending;
wire [7:0] block_store_thread;
wire [2:0] bst_tid_in;
wire dff_bst_tid_scanin;
wire dff_bst_tid_scanout;
wire bst_in_prog_b;
wire rmo_st_w;
wire dff_rmo_st_w_scanin;
wire dff_rmo_st_w_scanout;
wire dff_bst_seq_scanin;
wire dff_bst_seq_scanout;
wire bst_p1;
wire bst_p2_in;
wire bst_p3;
wire [2:0] bst_count_in;
wire dff_bst_count_scanin;
wire dff_bst_count_scanout;
wire bst_err_p3;
wire dff_bst_rd_err_scanin;
wire dff_bst_rd_err_scanout;
wire bst_err_p4;
wire dff_std_seq_scanin;
wire dff_std_seq_scanout;
wire dff_praw_ctl_w_scanin;
wire dff_praw_ctl_w_scanout;
wire io_or_asi_load_b;
wire asi_load_b;
wire [2:0] last_stb_wptr_w;
wire [2:0] rawp_id_w;
wire [2:0] rawp_id0;
wire [2:0] rawp_id0_hold;
wire dff_rawp_id0_scanin;
wire dff_rawp_id0_scanout;
wire [7:0] dec_rawp_id0;
wire [2:0] rawp_id1;
wire [2:0] rawp_id1_hold;
wire dff_rawp_id1_scanin;
wire dff_rawp_id1_scanout;
wire [7:0] dec_rawp_id1;
wire [2:0] rawp_id2;
wire [2:0] rawp_id2_hold;
wire dff_rawp_id2_scanin;
wire dff_rawp_id2_scanout;
wire [7:0] dec_rawp_id2;
wire [2:0] rawp_id3;
wire [2:0] rawp_id3_hold;
wire dff_rawp_id3_scanin;
wire dff_rawp_id3_scanout;
wire [7:0] dec_rawp_id3;
wire [2:0] rawp_id4;
wire [2:0] rawp_id4_hold;
wire dff_rawp_id4_scanin;
wire dff_rawp_id4_scanout;
wire [7:0] dec_rawp_id4;
wire [2:0] rawp_id5;
wire [2:0] rawp_id5_hold;
wire dff_rawp_id5_scanin;
wire dff_rawp_id5_scanout;
wire [7:0] dec_rawp_id5;
wire [2:0] rawp_id6;
wire [2:0] rawp_id6_hold;
wire dff_rawp_id6_scanin;
wire dff_rawp_id6_scanout;
wire [7:0] dec_rawp_id6;
wire [2:0] rawp_id7;
wire [2:0] rawp_id7_hold;
wire dff_rawp_id7_scanin;
wire dff_rawp_id7_scanout;
wire [7:0] dec_rawp_id7;
wire [2:0] priv_enc;
wire inv_addr_prty_m;
wire inv_ecc_m;
wire dff_error_inj_scanin;
wire dff_error_inj_scanout;
wire inv_addr_prty_b;
wire inv_ecc_b;
wire dff_bist_in_scanin;
wire dff_bist_in_scanout;
wire bist_scm_cmp_en;
wire bist_srm_cmp_en;
wire stb_cam_fail;
wire stb_ram_fail;
wire dff_bist_fail_scanin;
wire dff_bist_fail_scanout;
wire frf_read_out;
wire frf_read_pending_in;
wire dff_frf_read_scanin;
wire dff_frf_read_scanout;
wire spares_scanin;
wire spares_scanout;
wire [2:0] unused;
wire indet_block_req_p4;


input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

input		dec_st_inst_e;
input		dec_fpldst_inst_e;
input		dec_flush_lm;
input		dec_flush_lb;
input	[4:3]	dec_frf_r2_addr_e;

input		dcc_lendian_pre_m;
input		dcc_tte_vld_m;
input	[1:0]	dcc_ldst_sz_m;
input	[2:0]	dcc_tid_e;
input		dcc_blk_inst_m;
input		dcc_std_inst_m;
input		dcc_asi_load_m;
input		dcc_binit_st_b;
input		dcc_casa_inst_b;
input		dcc_exception_flush_b;
input		dcc_priv_b;
input		dcc_hpriv_b;
input		dcc_stb_diag_rd_m;
input		dcc_wr_error_inj_m;
input		dcc_sync_pipe_w;

input	[5:3]	lsu_va_b;
input		lsu_asi_error_inject_b31; 
input		lsu_asi_error_inject_b17; 
input		lsu_asi_error_inject_b19; 
input	[6:0]	lsu_asi_error_inject; 
input		lsu_lsu_pmen;

input		tlu_flush_lsu_b;
input		tlu_cerer_sbdpc;
input		tlu_cerer_sbdpu;
input		tlu_cerer_sbapp;
input		tlu_cerer_sbdiou;

input	[2:0]	sbs0_stb_wptr_m;
input	[2:0]	sbs1_stb_wptr_m;
input	[2:0]	sbs2_stb_wptr_m;
input	[2:0]	sbs3_stb_wptr_m;
input	[2:0]	sbs4_stb_wptr_m;
input	[2:0]	sbs5_stb_wptr_m;
input	[2:0]	sbs6_stb_wptr_m;
input	[2:0]	sbs7_stb_wptr_m;
input	[2:0]	sbs0_stb_rptr;
input	[2:0]	sbs1_stb_rptr;
input	[2:0]	sbs2_stb_rptr;
input	[2:0]	sbs3_stb_rptr;
input	[2:0]	sbs4_stb_rptr;
input	[2:0]	sbs5_stb_rptr;
input	[2:0]	sbs6_stb_rptr;
input	[2:0]	sbs7_stb_rptr;
input	[7:0]	sbs_pcx_rq_vld;		// Request for pcx - one per thread
input	[7:0]	sbs_atm_rq_vld;		// Atomic request (CAS)
input	[7:0]	sbs_asi_rq_vld;		// Request for asi - one per thread
input	[7:0]	sbs0_state_vld;
input	[7:0]	sbs1_state_vld;
input	[7:0]	sbs2_state_vld;
input	[7:0]	sbs3_state_vld;
input	[7:0]	sbs4_state_vld;
input	[7:0]	sbs5_state_vld;
input	[7:0]	sbs6_state_vld;
input	[7:0]	sbs7_state_vld;
input	[7:0]	sbs0_state_ced;
input	[7:0]	sbs1_state_ced;
input	[7:0]	sbs2_state_ced;
input	[7:0]	sbs3_state_ced;
input	[7:0]	sbs4_state_ced;
input	[7:0]	sbs5_state_ced;
input	[7:0]	sbs6_state_ced;
input	[7:0]	sbs7_state_ced;
input	[1:0]	sbs0_st_type;
input	[1:0]	sbs1_st_type;
input	[1:0]	sbs2_st_type;
input	[1:0]	sbs3_st_type;
input	[1:0]	sbs4_st_type;
input	[1:0]	sbs5_st_type;
input	[1:0]	sbs6_st_type;
input	[1:0]	sbs7_st_type;
input	[7:0]	sbs_state_asi_rngf;
input	[7:0]	sbs_pcx_pst_ie_p4;
input	[7:0]	sbs_bst_req;
input	[7:0]	sbs_asi_indet_req;
input	[7:0]	sbs_asi_indet_retire;
input	[7:0]	sbs_rmo_st_p4;
input	[7:0]	sbs_blk_st_p4;
input	[7:0]	sbs_stb_empty;

input		stb_cam_hit;
input		stb_cam_mhit;
input		stb_ld_part_raw;
input	[2:0]	stb_cam_hit_ptr;
input	[7:0]	stb_cam_data;		// Byte mask (also has ASI value for internal ASI stores)
input		stb_cam_addr_b39;
input		stb_cecc_err;
input		stb_uecc_err;
input	[2:0]	stb_ram_ctl;

input		stb_cam_perr;		// parity error occured on CAM read

input	[7:0]	lmd_asi_asi;
input	[1:0]	lmd_asi_type;

input		lmc_ld_inst_w;		// Unflushed load in W
input		lmc_asi_indet_retire;

input		pic_st_pcx_sel_p3;	// STB gets access to pcx
input		pic_st_asi_sel_p3;		// STB gets access to asi
input		pic_asi_sel_p4;

input		tlb_pgnum_b39;
input		tlb_tte_ie_b;
input		tlb_cam_mhit;

input		fgu_fst_ecc_error_fx2;

input		sed_bist_cmp_0;
input		sed_bist_cmp_1;
input		sed_bist_cmp_2;
input		sed_bist_cmp_3;

input		lbist_run;
input		mbi_run;
input	[5:0]	mbi_addr;
input	[2:0]	mbi_wdata;
input		mbi_stb_cam_read_en;
input		mbi_stb_cam_write_en;
input		mbi_stb_ram_read_en;
input		mbi_stb_ram_write_en;
output		bist_srm_rd_1;
output		bist_scm_rd_1;

output	[7:0]	sbc_thread_b;
output		sbc_st_int_sel_m;
output		sbc_std_le_m;
output		sbc_st_le_if_ie_m;
output		sbc_st_le_not_ie_m;
output	[1:0]	sbc_st_sz_m;
output		sbc_inv_addr_prty;
output	[6:0]	sbc_inv_ecc;
output	[2:0]	sbc_stb_ctl_data;
output		sbc_twocycle_inst_w;
output		sbc_tte_vld_b;		// tlb_miss not accounted for

output	[7:0]	sbc_cam_wvld_m;
output		sbc_cam_wptr_vld_m;	// enable stb_cam write
output		sbc_cam_rptr_vld;
output	[5:0]	sbc_cam_rwptr;		// stb_cam write pointer
output	[7:0]	sbc_cam_line_en_m;
output		sbc_ram_wptr_vld_b;	// enable stb_ram write
output		sbc_ram_rptr_vld;
output	[5:0]	sbc_ram_wptr;		// stb_ram write pointer
output	[5:0]	sbc_ram_rptr;		// stb_ram read pointer
output	[2:0]	sbc_cam_tid;		// stb_cam lookup tid
output	[2:0]	sbc_diag_wptr_w3;

output		sbc_st_rq_p2;
output		sbc_st_atomic_p2;
output		sbc_pcx_rq_p3;		// STB wants access to the pcx
output		sbc_asi_rq_p3;		// STB wants access to the asi
output	[7:0]	sbc_st_sel_p3;		// Selected thread in P3 (not qual'ed with store select)
output	[7:0]	sbc_bst_sel;
output	[2:0]	sbc_st_sel_tid_p4;		
output		sbc_st_pcx_nc;		
output	[7:0]	sbc_pcx_bmask;		// Byte mask for pcx requests
output	[2:0]	sbc_pcx_addr;		// Byte mask for pcx requests
output		sbc_pcx_rmo_st;		// Store in P4 is RMO
output		sbc_pcx_blk_st;		// Store in P4 is block store
output		sbc_st_asi_fs;
output	[7:0]	sbc_st_addr_new;
output		sbc_spd_clken;
output		sbc_ramout_clken;
output		sbc_tidb_eq_tidw;
output	[2:0]	sbc_tid_m;
output	[7:0]	sbc_st_atom_p3;
output		sbc_load_bst_addr;	// Enables the bst addr register in sbd
output		sbc_bst_in_prog_m;
output		sbc_bst_in_prog_b;
output	[2:0]	sbc_bst_offset;
output		sbc_rmo_st_b;
output	[7:0]	sbc_rawp_rst;
output		sbc_fgu_ecc_b;
output		sbc_bst_rd_err;
output		sbc_pid_kill_store_p4_;
output		sbc_pic_kill_store_p4_;
output		sbc_sbs_kill_store_p4_;
output		sbc_force_inv;
output	[2:0]	sbc_st_type_p4;
output		sbc_blk_inst_b;
output		sbc_indet_block_p3;

output		lsu_block_store_stall;
output	[4:3]	lsu_block_store_rd;
output	[2:0]	lsu_block_store_tid;
output	[7:0]	lsu_block_store_alloc;
output	[7:0]	lsu_block_store_b;
output		lsu_block_store_m;

output		lsu_sbdpc_err_g;
output		lsu_sbdpu_err_g;
output		lsu_sbapp_err_g;
output		lsu_sbdiou_err_g;
output	[2:0]	lsu_stberr_index_g;
output	[1:0]	lsu_stberr_priv_g;
output		lsu_stb_flush_g;

output		lsu_frf_read_pending;

output		sbc_mbi_run;
output		lsu_mbi_stb_cam_fail;
output		lsu_mbi_stb_ram_fail;
output		lsu_mbi_scm_hit;
output		lsu_mbi_scm_mhit;
output	[2:0]	lsu_mbi_scm_hit_ptr;
output		lsu_mbi_scm_praw;

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

assign stb_clken = stb_cam_wptr_vld_m | stb_cam_wptr_vld_b | stb_cam_wptr_vld_w | 
                   st_rq_p1 | st_rq_p2 | st_rq_p3 | st_rq_p4 | mbi_run | ~lsu_lsu_pmen;

lsu_sbc_ctll1clkhdr_ctl_macro clkgen_stb (
        .l2clk  (l2clk                          ),
        .l1en   (stb_clken                      ),
        .l1clk  (l1clk_pm1                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_sbc_ctll1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (1'b1                           ),
        .l1clk  (l1clk                          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

//////////////////////////////
// Flush logic
//////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_flush_b  (
	.scan_in(dff_flush_b_scanin),
	.scan_out(dff_flush_b_scanout),
	.din	(dec_flush_lm),
	.dout	(local_flush_b),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign flush_b = tlu_flush_lsu_b | dec_flush_lb | local_flush_b | dcc_exception_flush_b;
assign pipe_flush_b = dec_flush_lb | local_flush_b;

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_flush_w  (
	.scan_in(dff_flush_w_scanin),
	.scan_out(dff_flush_w_scanout),
	.din	(flush_b),
	.dout	(flush_w),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

///////////////////////////////////////////////////
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_inst_m  (
	.scan_in(dff_inst_m_scanin),
	.scan_out(dff_inst_m_scanout),
	.din	({dec_frf_r2_addr_e[4:3],dec_st_inst_e}),
	.dout	({bst_addr_m[4:3],       st_inst_vld_m}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////////////
// Store data source selects
////////////////////////////////////////////////////////////////////////////////

// M stage
// Select between integer store and fp stores.  FP stores can be 32b or
// 64b. 
lsu_sbc_ctlmsff_ctl_macro__width_1 dff_ldst_fp_m  (
	.scan_in(dff_ldst_fp_m_scanin),
	.scan_out(dff_ldst_fp_m_scanout),
	.din	(dec_fpldst_inst_e),
	.dout	(ldst_fp_m),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbc_st_int_sel_m = ~(ldst_fp_m | bst_in_prog_m);

////////////////////////////////////////////////////////////////////////////////
// Store data formatting
//
// Data must be swapped if little endian and then replicated for stores less
// than 8 bytes.
////////////////////////////////////////////////////////////////////////////////

// Force block stores to size=11.  CAS formats data over two cycles.
assign st_sz_m[1:0] = ((dcc_casa_inst_b | std_inst_b) ? st_sz_b[1:0] : dcc_ldst_sz_m[1:0]) |
                       {2{bst_in_prog_m}} ;

assign sbc_st_sz_m[1:0] = st_sz_m[1:0];

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_ldst_sz_b  (
	.scan_in(dff_ldst_sz_b_scanin),
	.scan_out(dff_ldst_sz_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(st_sz_m[1:0]),
	.dout	(st_sz_b[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign tidm_eq_tidb = (tid_m[2:0] == tid_b[2:0]) & stb_cam_wptr_vld_b;

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_st_w  (
	.scan_in(dff_st_w_scanin),
	.scan_out(dff_st_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({tidm_eq_tidb,     dcc_casa_inst_b}),
	.dout	({sbc_tidb_eq_tidw, casa_inst_w}),
  .siclk(siclk),
  .soclk(soclk)
);

// Endian swapping in sbd.  PE mux defaults to big endian.  Final qualification with TTE.IE will be
// done in sbd for timing reasons.
assign st_lendian_b = lendian_pre_b ^ (sbc_tte_vld_b & tlb_tte_ie_b);

assign st_pre_le_m = (dcc_casa_inst_b & st_lendian_b) |
                     (bst_in_prog_m & block_store_lendian) |
                     (st_inst_vld_m & dcc_lendian_pre_m);

assign std_le_m = std_inst_b & st_lendian_b;
assign st_le_if_ie_m =  (dcc_tte_vld_m & ~st_pre_le_m) | (~dcc_tte_vld_m & st_pre_le_m);
assign st_le_not_ie_m = (dcc_tte_vld_m &  st_pre_le_m) | (~dcc_tte_vld_m & st_pre_le_m);

assign sbc_std_le_m = std_le_m;
assign sbc_st_le_if_ie_m = st_le_if_ie_m;
assign sbc_st_le_not_ie_m = st_le_not_ie_m;

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_st_le_b  (
	.scan_in(dff_st_le_b_scanin),
	.scan_out(dff_st_le_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dcc_tte_vld_m,dcc_lendian_pre_m}),
	.dout	({sbc_tte_vld_b,    lendian_pre_b}),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////////////
// STB array controls
////////////////////////////////////////////////////////////////////////////////

assign stb_cam_hit_b          = stb_cam_hit     & ~lbist_run;
assign stb_cam_mhit_b         = stb_cam_mhit    & ~lbist_run;
assign stb_ld_part_raw_b      = stb_ld_part_raw & ~lbist_run;
assign stb_cam_hit_ptr_b[2:0] = stb_cam_hit_ptr[2:0] & {3{~lbist_run}};

lsu_sbc_ctlmsff_ctl_macro__width_9 dff_cam_hit  (
	.scan_in(dff_cam_hit_scanin),
	.scan_out(dff_cam_hit_scanout),
	.din	({tid_b[2:0],stb_cam_hit_b,stb_cam_mhit_b,stb_ld_part_raw_b,stb_cam_hit_ptr_b[2:0]}),
	.dout	({tid_w[2:0],stb_cam_hit_w,stb_cam_mhit_w,stb_ld_part_raw_w,stb_cam_hit_ptr_w[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_mbi_scm_hit     = stb_cam_hit_w;
assign lsu_mbi_scm_mhit    = stb_cam_mhit_w;
assign lsu_mbi_scm_hit_ptr = stb_cam_hit_ptr_w[2:0];
assign lsu_mbi_scm_praw    = stb_ld_part_raw_w;

// stb ram is read on a full RAW 
// Note: There are cases (LDD/QUAD come to mind) where full_raw_w evaulates true but a bypass will
// not occur.  The full qualification is done in lsu_lmc_ctl.  In those cases, the stb will get read
// but the data will not be used.
assign full_raw_w = stb_cam_hit_w & ~(stb_cam_mhit_w | stb_ld_part_raw_w | io_or_asi_load_w | flush_w);

assign thread_w[0] = ~tid_w[2] & ~tid_w[1] & ~tid_w[0];
assign thread_w[1] = ~tid_w[2] & ~tid_w[1] &  tid_w[0];
assign thread_w[2] = ~tid_w[2] &  tid_w[1] & ~tid_w[0];
assign thread_w[3] = ~tid_w[2] &  tid_w[1] &  tid_w[0];
assign thread_w[4] =  tid_w[2] & ~tid_w[1] & ~tid_w[0];
assign thread_w[5] =  tid_w[2] & ~tid_w[1] &  tid_w[0];
assign thread_w[6] =  tid_w[2] &  tid_w[1] & ~tid_w[0];
assign thread_w[7] =  tid_w[2] &  tid_w[1] &  tid_w[0];

// Valid signals from each threads state determine which cam entries are valid.
assign sbc_cam_line_en_m[7:0] = ({8{thread_m[0]}} & sbs0_state_vld[7:0] |
                                 {8{thread_m[1]}} & sbs1_state_vld[7:0] |
                                 {8{thread_m[2]}} & sbs2_state_vld[7:0] |
                                 {8{thread_m[3]}} & sbs3_state_vld[7:0] |
                                 {8{thread_m[4]}} & sbs4_state_vld[7:0] |
                                 {8{thread_m[5]}} & sbs5_state_vld[7:0] |
                                 {8{thread_m[6]}} & sbs6_state_vld[7:0] |
                                 {8{thread_m[7]}} & sbs7_state_vld[7:0] ) |
                                 {8{mbi_run_local}} ;


// Write pointer generation

assign stb_cam_wptr_vld_m = (st_inst_vld_m | bst_in_prog_m) & ~mbi_run_local;	// does not include BIST
assign sbc_cam_wptr_vld_m = mbi_run_local ? mbi_stb_cam_write_en : 
                                            stb_cam_wptr_vld_m & ~(dcc_sync_pipe_w & (tid_m[2:0] == tid_w[2:0]));

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_ram_wptr_vld_b  (
	.scan_in(dff_ram_wptr_vld_b_scanin),
	.scan_out(dff_ram_wptr_vld_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_cam_wptr_vld_m),
	.dout	(stb_cam_wptr_vld_b),
  .siclk(siclk),
  .soclk(soclk)
);

assign stb_ram_wptr_vld_b = stb_cam_wptr_vld_b & ~(dcc_sync_pipe_w & (tid_b[2:0] == tid_w[2:0]));

assign sbc_ram_wptr_vld_b = mbi_run_local ? mbi_stb_ram_write_en : (stb_ram_wptr_vld_b | std_inst_w | casa_inst_w);

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_stb_wptr_vld_w  (
	.scan_in(dff_stb_wptr_vld_w_scanin),
	.scan_out(dff_stb_wptr_vld_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(stb_cam_wptr_vld_b),
	.dout	(stb_cam_wptr_vld_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign unflushed_store_w = stb_cam_wptr_vld_w & ~flush_w;

assign tid_e[2:0] = bst_in_prog_e ? bst_tid[2:0] : dcc_tid_e[2:0];

lsu_sbc_ctlmsff_ctl_macro__width_6 dff_tid_m  (
	.scan_in(dff_tid_m_scanin),
	.scan_out(dff_tid_m_scanout),
	.din	({tid_e[2:0],tid_m[2:0]}),
	.dout	({tid_m[2:0],tid_b[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbc_tid_m[2:0] = tid_m[2:0];

assign thread_m[0] = ~tid_m[2] & ~tid_m[1] & ~tid_m[0];
assign thread_m[1] = ~tid_m[2] & ~tid_m[1] &  tid_m[0];
assign thread_m[2] = ~tid_m[2] &  tid_m[1] & ~tid_m[0];
assign thread_m[3] = ~tid_m[2] &  tid_m[1] &  tid_m[0];
assign thread_m[4] =  tid_m[2] & ~tid_m[1] & ~tid_m[0];
assign thread_m[5] =  tid_m[2] & ~tid_m[1] &  tid_m[0];
assign thread_m[6] =  tid_m[2] &  tid_m[1] & ~tid_m[0];
assign thread_m[7] =  tid_m[2] &  tid_m[1] &  tid_m[0];

assign sbc_cam_wvld_m[0] = stb_cam_wptr_vld_m & thread_m[0];
assign sbc_cam_wvld_m[1] = stb_cam_wptr_vld_m & thread_m[1];
assign sbc_cam_wvld_m[2] = stb_cam_wptr_vld_m & thread_m[2];
assign sbc_cam_wvld_m[3] = stb_cam_wptr_vld_m & thread_m[3];
assign sbc_cam_wvld_m[4] = stb_cam_wptr_vld_m & thread_m[4];
assign sbc_cam_wvld_m[5] = stb_cam_wptr_vld_m & thread_m[5];
assign sbc_cam_wvld_m[6] = stb_cam_wptr_vld_m & thread_m[6];
assign sbc_cam_wvld_m[7] = stb_cam_wptr_vld_m & thread_m[7];

lsu_sbc_ctlmsff_ctl_macro__width_8 dff_thread_b  (
	.scan_in(dff_thread_b_scanin),
	.scan_out(dff_thread_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(thread_m[7:0]),
	.dout	(thread_b[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbc_thread_b[7:0] = thread_b[7:0];

assign stb_wptr[2:0] = {3{thread_m[0]}} & sbs0_stb_wptr_m[2:0] |
                       {3{thread_m[1]}} & sbs1_stb_wptr_m[2:0] |
                       {3{thread_m[2]}} & sbs2_stb_wptr_m[2:0] |
                       {3{thread_m[3]}} & sbs3_stb_wptr_m[2:0] |
                       {3{thread_m[4]}} & sbs4_stb_wptr_m[2:0] |
                       {3{thread_m[5]}} & sbs5_stb_wptr_m[2:0] |
                       {3{thread_m[6]}} & sbs6_stb_wptr_m[2:0] |
                       {3{thread_m[7]}} & sbs7_stb_wptr_m[2:0];

assign cam_wptr_m[2:0] = stb_wptr[2:0];

// CAM is 1rw.  Writes always have priority, so anything that generated a read must be deferred.
// 0in bits_on -var {sbc_cam_rptr_vld,sbc_cam_wptr_vld_m} -max 1 -message "stb_cam read/write contention"
// 0in bits_on -var {(st_pcx_rq_p2 | st_asi_rq_p2),any_bst_req,stb_diag_rd_w} -max 1

assign sbc_cam_rptr_vld =  mbi_run_local ? mbi_stb_cam_read_en : (st_pcx_rq_p2 | st_asi_rq_p2 | any_bst_req | stb_diag_rd_w);

// STB CAM is 1rw, so read and write pointers must be muxed.
// 0in bits_on -var {stb_cam_wptr_vld_m,stb_diag_rd_w,mbi_run_local} -max 1 -message "multiple stb_cam address selects"
assign sbc_cam_rwptr[5:0] = mbi_run_local ? mbi_addr[5:0] : 
       (({6{stb_cam_wptr_vld_m}}                    & {tid_m[2:0],cam_wptr_m[2:0]}) |		// write
        ({6{stb_diag_rd_w}}                         & {tid_w[2:0],va_w[5:3]}) |			// diag read
        ({6{~(stb_cam_wptr_vld_m | stb_diag_rd_w)}} & {st_rd_tid[2:0],stb_rptr_pcx[2:0]}));	// read for pcx/asi/bst
         
assign sbc_cam_tid[2:0] = mbi_run_local ? mbi_addr[5:3] : tid_m[2:0];

lsu_sbc_ctlmsff_ctl_macro__width_12 dff_cam_wptr  (
	.scan_in(dff_cam_wptr_scanin),
	.scan_out(dff_cam_wptr_scanout),
	.din	({cam_wptr_m[2:0],cam_wptr_b[2:0],cam_wptr_w[2:0], cam_wptr_w2[2:0]}),
	.dout	({cam_wptr_b[2:0],cam_wptr_w[2:0],cam_wptr_w2[2:0],cam_wptr_w3[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign sbc_diag_wptr_w3[2:0] = cam_wptr_w3[2:0];

assign sbc_ram_wptr[5:0] = mbi_run_local ? mbi_addr[5:0] :
                          ((std_inst_w | casa_inst_w) ? {tid_w[2:0],cam_wptr_w[2:0]} : {tid_b[2:0],cam_wptr_b[2:0]});

// Read pointer generation

// rptr_vld and rptr_pcx can be generated from an earlier pcx_rq signal.  The
// advantage of the later signal is that the array will only be read when
// absolutely necessary.
// 0in bits_on -var {(st_pcx_rq_p2 | st_asi_rq_p2),full_raw_w,stb_diag_rd_w} -max 1

assign sbc_ram_rptr_vld = mbi_run_local ? mbi_stb_ram_read_en :
                         ((st_pcx_rq_p2 | st_asi_rq_p2) |		// read for pcx/asi
                          full_raw_w |					// read for RAW bypass
                          any_bst_req |					// read for block store initiate
                          stb_diag_rd_w); 				// diag read

assign sbc_ram_rptr[5:0] = mbi_run_local ? mbi_addr[5:0] : 
                           (full_raw_w ? {tid_w[2:0],stb_cam_hit_ptr_w[2:0]} :			// read for RAW bypass
                            stb_diag_rd_w  ? {tid_w[2:0],va_w[5:3]} :				// diag read
                                                {st_rd_tid[2:0],stb_rptr_pcx[2:0]});		// read for pcx

lsu_sbc_ctlmsff_ctl_macro__width_12 dff_ram_rptr  (
	.scan_in(dff_ram_rptr_scanin),
	.scan_out(dff_ram_rptr_scanout),
	.din	({sbc_ram_rptr_vld,sbc_ram_rptr[2:0],ram_rptr_d1[2:0],lsu_va_b[5:3],
		  dcc_stb_diag_rd_m,stb_diag_rd_b_in}),
	.dout	({ram_rptr_vld_2,  ram_rptr_d1[2:0], ram_rptr_d2[2:0],va_w[5:3],
		  stb_diag_rd_b,    stb_diag_rd_w}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stb_diag_rd_b_in = stb_diag_rd_b & ~mbi_run_local;

assign sbc_ramout_clken = ram_rptr_vld_2 | ~lsu_lsu_pmen;

assign stb_rptr_pcx[2:0] = {3{st_rd_thread[0]}} & sbs0_stb_rptr[2:0] |
                           {3{st_rd_thread[1]}} & sbs1_stb_rptr[2:0] |
                           {3{st_rd_thread[2]}} & sbs2_stb_rptr[2:0] |
                           {3{st_rd_thread[3]}} & sbs3_stb_rptr[2:0] |
                           {3{st_rd_thread[4]}} & sbs4_stb_rptr[2:0] |
                           {3{st_rd_thread[5]}} & sbs5_stb_rptr[2:0] |
                           {3{st_rd_thread[6]}} & sbs6_stb_rptr[2:0] |
                           {3{st_rd_thread[7]}} & sbs7_stb_rptr[2:0];

// Update last stored address for pipelining comparisons
assign sbc_st_addr_new[0] = unflushed_store_w & thread_w[0];
assign sbc_st_addr_new[1] = unflushed_store_w & thread_w[1];
assign sbc_st_addr_new[2] = unflushed_store_w & thread_w[2];
assign sbc_st_addr_new[3] = unflushed_store_w & thread_w[3];
assign sbc_st_addr_new[4] = unflushed_store_w & thread_w[4];
assign sbc_st_addr_new[5] = unflushed_store_w & thread_w[5];
assign sbc_st_addr_new[6] = unflushed_store_w & thread_w[6];
assign sbc_st_addr_new[7] = unflushed_store_w & thread_w[7];

// Clock enables for pipe address flops

assign sbc_spd_clken = stb_cam_wptr_vld_m | stb_cam_wptr_vld_b | mbi_run_local | ~lsu_lsu_pmen;

////////////////////////////////////////////////////////////////////////////////
// PCX/ASI Arbitration
////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////
// P1 - receive requests from sbs
/////////////////////////////////////////////////////

// Turn off indeterminate ASI requests if they're blocked
// If an asi was selected in P2, clear the request since ASI can only issue
// every other cycle.
assign asi_rq_vld[7:0] = sbs_asi_rq_vld[7:0] & 
     ~(sbs_asi_indet_req[7:0] & {8{asi_indet_block | asi_indet_sel_qual_p2 | (asi_indet_sel_p3 & pic_st_asi_sel_p3)}});

assign asi_rq_blocked_p1 = |(sbs_asi_rq_vld[7:0] & sbs_asi_indet_req[7:0]) &
                            (asi_indet_block | asi_indet_sel_qual_p2 | (asi_indet_sel_p3 & pic_st_asi_sel_p3));

// Combine all requests for power management
assign st_rq_p1 = (|(sbs_pcx_rq_vld[7:0])) | (|(sbs_asi_rq_vld[7:0]));

// Turn off pcx requests for a thread during it's block store transfer.  Need to hold
// off until the end in case an ECC error occurs in the FGU.
assign pcx_rq_vld[7:0] = sbs_pcx_rq_vld[7:0] & ~lsu_block_store_b[7:0];

assign st_rq_vld_p1[7:0] = (pcx_rq_vld[7:0] | asi_rq_vld[7:0]) & ~st_rq_sel_p2[7:0] & ~st_sel_p3[7:0];
assign st_rq_asi_p1[7:0] = asi_rq_vld[7:0] & ~st_rq_sel_p2[7:0] & ~st_sel_p3[7:0];

lsu_sbc_ctlmsff_ctl_macro__width_18 dff_st_rq_p2  (
	.scan_in(dff_st_rq_p2_scanin),
	.scan_out(dff_st_rq_p2_scanout),
	.l1clk	(l1clk_pm1),
	.din	({st_rq_p1,st_rq_vld_p1[7:0],st_rq_asi_p1[7:0],asi_rq_blocked_p1}),
	.dout	({st_rq_p2,st_rq_vld_p2[7:0],st_rq_asi_p2[7:0],asi_rq_blocked_p2}),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////////////////////
// P2 - arbitrate among the threads
/////////////////////////////////////////////////////

// Stores cannot request under the following conditions
// 1 - when a load in W is reading the STB for RAW bypass
// 2 - when another thread is reading the STB to initiate a block store
// 3 - when a store in M will be writing the STB
// 4 - when a STD or CASA in W needs to write the STB 
// 5 - when a diagnostic STB read is in M or W
assign stb_hazard_p2 = full_raw_w | any_bst_req | stb_cam_wptr_vld_m | std_inst_w | 
                       casa_inst_w | stb_diag_rd_w | st_pcx_rq_p3 | st_asi_rq_p3;

// Pseudo-LRU picker to choose the oldest thread for issuing to pcx.
lsu_lru8_ctl st_lru8 (
	.scan_in(st_lru8_scanin),
	.scan_out(st_lru8_scanout),
	.l1clk	(l1clk_pm1),
	.request(st_rq_vld_p2[7:0]),
	.enable	(st_lru_update_p3[7:0]),
	.select	(st_rq_sel_unqual_p2[7:0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

assign st_rq_sel_p2[7:0] = st_rq_sel_unqual_p2[7:0] & {8{~stb_hazard_p2}};

assign st_asi_unqual_p2 = |(st_rq_sel_unqual_p2[7:0] & st_rq_asi_p2[7:0]);
assign st_pcx_rq_p2 = ~st_asi_unqual_p2 & |(st_rq_vld_p2[7:0]) & ~stb_hazard_p2;
assign st_asi_rq_p2 =  st_asi_unqual_p2 & |(st_rq_vld_p2[7:0]) & ~stb_hazard_p2;

// 0in arbiter -req st_rq_vld_p2[7:0] -gnt st_rq_sel_unqual_p2[7:0] -known_grant 

// Encode tid for use in STB read pointer
assign st_tid_p2[2] = st_rq_sel_p2[4] | st_rq_sel_p2[5] | st_rq_sel_p2[6] | st_rq_sel_p2[7];
assign st_tid_p2[1] = st_rq_sel_p2[2] | st_rq_sel_p2[3] | st_rq_sel_p2[6] | st_rq_sel_p2[7];
assign st_tid_p2[0] = st_rq_sel_p2[1] | st_rq_sel_p2[3] | st_rq_sel_p2[5] | st_rq_sel_p2[7];

// CAS tracking
assign sbc_st_atomic_p2 = |(st_rq_sel_p2[7:0] & sbs_atm_rq_vld[7:0]);

// Indeterminate asi tracking
assign asi_indet_sel_p2 = |(sbs_asi_indet_req[7:0] & st_rq_sel_unqual_p2[7:0]);

assign asi_indet_sel_qual_p2 = asi_indet_sel_p2 & ~stb_hazard_p2;

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_indet_temp  (
	.scan_in(dff_indet_temp_scanin),
	.scan_out(dff_indet_temp_scanout),
	.l1clk	(l1clk_pm1),
	.din	({asi_indet_sel_qual_p2,asi_rq_blocked_p2}),
	.dout	({asi_indet_sel_p3,     asi_rq_blocked_p3}),
  .siclk(siclk),
  .soclk(soclk)
);

// To prevent indeterminates from getting locked out, block the next two cycles if an
// indeterminate gets picked, but not selected in p3.
assign indet_block_req_p2 = asi_indet_sel_p3 & ~pic_st_asi_sel_p3;
//assign sbc_indet_block_p3 = indet_block_req_p3 | indet_block_req_p4;
assign sbc_indet_block_p3 = indet_block_req_p3;
 
// Data for STB read pointers
assign st_rd_tid[2:0] = st_tid_p2[2:0] | ({3{any_bst_req}} & lsu_block_store_tid[2:0]);
assign st_rd_thread[7:0] = st_rq_sel_p2[7:0] | bst_sel[7:0];

assign sbc_st_rq_p2 = st_pcx_rq_p2 | st_asi_rq_p2;

lsu_sbc_ctlmsff_ctl_macro__width_11 dff_st_sel_p3  (
	.scan_in(dff_st_sel_p3_scanin),
	.scan_out(dff_st_sel_p3_scanout),
	.l1clk	(l1clk_pm1),
	.din	({st_rq_p2,st_rq_sel_p2[7:0],st_pcx_rq_p2,st_asi_rq_p2}),
	.dout	({st_rq_p3,st_rq_sel_p3[7:0],st_pcx_rq_p3,st_asi_rq_p3}),
  .siclk(siclk),
  .soclk(soclk)
);

assign st_atom_p3[7:0] = st_rq_sel_p3[7:0] & sbs_atm_rq_vld[7:0];

////////////////////////////////////
// P3 - pic selects load or store //
////////////////////////////////////

assign sbc_st_atom_p3[7:0] = st_atom_p3[7:0] & {8{pic_st_pcx_sel_p3}};

assign sbc_asi_rq_p3 = st_asi_rq_p3;
assign sbc_pcx_rq_p3 = st_pcx_rq_p3;

assign st_sel_p3[7:0] = st_rq_sel_p3[7:0] & {8{(pic_st_pcx_sel_p3 | pic_st_asi_sel_p3)}};
assign sbc_st_sel_p3[7:0] = st_rq_sel_p3[7:0];

assign st_lru_update_p3[7:0] = st_sel_p3[7:0] & {8{~asi_rq_blocked_p3}};

assign st_asi_fs_p3 = (st_sel_p3[0] & sbs_state_asi_rngf[0]) |
                      (st_sel_p3[1] & sbs_state_asi_rngf[1]) |
                      (st_sel_p3[2] & sbs_state_asi_rngf[2]) |
                      (st_sel_p3[3] & sbs_state_asi_rngf[3]) |
                      (st_sel_p3[4] & sbs_state_asi_rngf[4]) |
                      (st_sel_p3[5] & sbs_state_asi_rngf[5]) |
                      (st_sel_p3[6] & sbs_state_asi_rngf[6]) |
                      (st_sel_p3[7] & sbs_state_asi_rngf[7]);

// Must track indeterminate ASI stores.  Only one (across all threads) can
// be outstanding at any time.

assign asi_indet_in = (asi_indet_sel_p3 & pic_st_asi_sel_p3) | (asi_indet_block & ~|(sbs_asi_indet_retire[7:0]));

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_asi_indet  (
	.scan_in(dff_asi_indet_scanin),
	.scan_out(dff_asi_indet_scanout),
	.din	(asi_indet_in),
	.dout	(asi_indet_block),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

/////////////////////////////////////
// P4 - data is valid from CAM/RAM //
/////////////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_12 dff_st_sel_p4  (
	.scan_in(dff_st_sel_p4_scanin),
	.scan_out(dff_st_sel_p4_scanout),
	.l1clk	(l1clk_pm1),
	.din	({st_rq_p3,st_asi_fs_p3, st_sel_p3[7:0],pic_st_asi_sel_p3,pic_st_pcx_sel_p3}),
	.dout	({st_rq_p4,sbc_st_asi_fs,st_sel_p4[7:0],st_asi_sel_p4,    st_pcx_sel_p4}),
  .siclk(siclk),
  .soclk(soclk)
);

assign st_sel_tid_p4[2] = st_sel_p4[4] | st_sel_p4[5] | st_sel_p4[6] | st_sel_p4[7];
assign st_sel_tid_p4[1] = st_sel_p4[2] | st_sel_p4[3] | st_sel_p4[6] | st_sel_p4[7];
assign st_sel_tid_p4[0] = st_sel_p4[1] | st_sel_p4[3] | st_sel_p4[5] | st_sel_p4[7];

assign sbc_st_sel_tid_p4[2:0] = bst_p2 ? bst_tid[2:0] : st_sel_tid_p4[2:0];

// Partial store mask calculation
assign pst_ie_p4 = |(sbs_pcx_pst_ie_p4[7:0]);

assign bmask_ie[7:0] = {stb_cam_data[0],stb_cam_data[1],stb_cam_data[2],stb_cam_data[3],
                        stb_cam_data[4],stb_cam_data[5],stb_cam_data[6],stb_cam_data[7]};
assign sbc_pcx_bmask[7:0] = pst_ie_p4 ? bmask_ie[7:0] : stb_cam_data[7:0];

// Generate addr[2:0] based on byte mask.  It won't be correct for PST instructions, but
// the L2 shouldn't use the address bits for those anyway.
assign sbc_pcx_addr[2] = (!stb_cam_data[0]&stb_cam_data[2]) | (!stb_cam_data[1]&stb_cam_data[0]) |
                         (!stb_cam_data[2]&stb_cam_data[1]) | (!stb_cam_data[4]&stb_cam_data[3]);
assign sbc_pcx_addr[1] = (!stb_cam_data[5]&stb_cam_data[4]) | (!stb_cam_data[1]&stb_cam_data[0]) |
                         (!stb_cam_data[6]&stb_cam_data[5]) | (!stb_cam_data[2]&stb_cam_data[1]);
assign sbc_pcx_addr[0] = (!stb_cam_data[7]&stb_cam_data[6]) | (!stb_cam_data[5]&stb_cam_data[4]) |
                         (!stb_cam_data[3]&stb_cam_data[2]) | (!stb_cam_data[1]&stb_cam_data[0]);


assign sbc_pcx_rmo_st = |(sbs_rmo_st_p4[7:0]);
assign sbc_pcx_blk_st = |(sbs_blk_st_p4[7:0]);

// Store type muxing
assign st_type_enc[1:0] = ({2{st_sel_p4[0]}} & sbs0_st_type[1:0]) |
                          ({2{st_sel_p4[1]}} & sbs1_st_type[1:0]) |
                          ({2{st_sel_p4[2]}} & sbs2_st_type[1:0]) |
                          ({2{st_sel_p4[3]}} & sbs3_st_type[1:0]) |
                          ({2{st_sel_p4[4]}} & sbs4_st_type[1:0]) |
                          ({2{st_sel_p4[5]}} & sbs5_st_type[1:0]) |
                          ({2{st_sel_p4[6]}} & sbs6_st_type[1:0]) |
                          ({2{st_sel_p4[7]}} & sbs7_st_type[1:0]) ;

assign sbc_st_type_p4[2] = st_pcx_sel_p4 & st_type_enc[1];
assign sbc_st_type_p4[1] = st_pcx_sel_p4 ? st_type_enc[0] : st_type_enc[1];
assign sbc_st_type_p4[0] = st_pcx_sel_p4 ? (~st_type_enc[0] | st_type_enc[1]) : st_type_enc[0];

///////////////////////////////
// STB error detection
///////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_4 dff_cerer  (
	.scan_in(dff_cerer_scanin),
	.scan_out(dff_cerer_scanout),
	.l1clk	(l1clk_pm1),
	.din	({tlu_cerer_sbdpc,tlu_cerer_sbdpu,tlu_cerer_sbapp,tlu_cerer_sbdiou}),
	.dout	({    cerer_sbdpc,    cerer_sbdpu,    cerer_sbapp,    cerer_sbdiou}),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbdpc_err  = cerer_sbdpc & stb_cecc_err & ~stb_uecc_err & (st_pcx_sel_p4 | st_asi_sel_p4) & ~st_err_flush;
assign sbdpu_err  = cerer_sbdpu & stb_uecc_err & st_pcx_sel_p4 & ~stb_cam_addr_b39 & ~st_err_flush;
assign sbapp_err  = cerer_sbapp & stb_cam_perr & (st_pcx_sel_p4 | st_asi_sel_p4 | bst_p2) & ~st_err_flush;
assign sbdiou_err = cerer_sbdiou & stb_uecc_err & ((st_pcx_sel_p4 & stb_cam_addr_b39) | st_asi_sel_p4) & ~st_err_flush;

// Check that errors are never signaled during normal testing



assign kill_store_p4_ = ~(sbapp_err | sbdiou_err | (st_asi_sel_p4 & sbdpu_err) | st_err_flush);
assign sbc_pid_kill_store_p4_ = kill_store_p4_;
assign sbc_pic_kill_store_p4_ = kill_store_p4_;
assign sbc_sbs_kill_store_p4_ = kill_store_p4_;

// On UE for store and CAS, assert the inv bit of the pcx packet so the L2 stores NotData
assign sbc_force_inv = sbdpu_err;

// Decode the priv encodings
assign stb_priv[1] = (stb_ram_ctl[1]&!stb_ram_ctl[0]) | (!stb_ram_ctl[1]&stb_ram_ctl[0]) | (stb_ram_ctl[2]);
assign stb_priv[0] = (stb_ram_ctl[2]&!stb_ram_ctl[0]) | (!stb_ram_ctl[2]&stb_ram_ctl[0]) | (stb_ram_ctl[1]);

lsu_sbc_ctlmsff_ctl_macro__width_10 dff_stb_err  (
	.scan_in(dff_stb_err_scanin),
	.scan_out(dff_stb_err_scanout),
	.din	({sbdpc_err,      sbdpu_err,      sbapp_err,      sbdiou_err      ,
		  ram_rptr_d2[2:0],       stb_priv[1:0], st_err_flush}),
	.dout	({lsu_sbdpc_err_g,lsu_sbdpu_err_g,lsu_sbapp_err_g,lsu_sbdiou_err_g,
		  lsu_stberr_index_g[2:0],lsu_stberr_priv_g[1:0],lsu_stb_flush_g}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// When a "fatal" error occurs (one which kills a store), all other stores in the buffer should
// also be killed.  Keep a flag that indicates the error condition and kill all stores as they
// try to issue.  Once the stb is empty, reset the flag.
assign fatal_err_cond_in[7:0] = (({8{~kill_store_p4_}} & st_sel_p4[7:0]) | fatal_err_cond[7:0]) & ~sbs_stb_empty[7:0];

lsu_sbc_ctlmsff_ctl_macro__width_8 dff_fatal_err  (
	.scan_in(dff_fatal_err_scanin),
	.scan_out(dff_fatal_err_scanout),
	.din	(fatal_err_cond_in[7:0]),
	.dout	(fatal_err_cond[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign st_err_flush = |(fatal_err_cond[7:0] & (st_sel_p4[7:0] | bst_sel[7:0]));

////////////////////////////////////////////////////////////////////////////////
// Block stores
////////////////////////////////////////////////////////////////////////////////

// Must hold onto Rd value for the bst to send back to decode.
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_bst_addr_pipe  (
	.scan_in(dff_bst_addr_pipe_scanin),
	.scan_out(dff_bst_addr_pipe_scanout),
	.l1clk	(l1clk_pm1),
	.din	({bst_addr_m[4:3],dcc_blk_inst_m}),
	.dout	({bst_addr_b[4:3],sbc_blk_inst_b}),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_addr0_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[0] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr0[4:3];
assign bst_addr1_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[1] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr1[4:3];
assign bst_addr2_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[2] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr2[4:3];
assign bst_addr3_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[3] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr3[4:3];
assign bst_addr4_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[4] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr4[4:3];
assign bst_addr5_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[5] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr5[4:3];
assign bst_addr6_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[6] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr6[4:3];
assign bst_addr7_in[4:3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[7] & ~pipe_flush_b) ? bst_addr_b[4:3] : bst_addr7[4:3];

lsu_sbc_ctlmsff_ctl_macro__width_16 dff_bst_addr  (
	.scan_in(dff_bst_addr_scanin),
	.scan_out(dff_bst_addr_scanout),
	.l1clk	(l1clk_pm1),
	.din	({bst_addr7_in[4:3],bst_addr6_in[4:3],bst_addr5_in[4:3],bst_addr4_in[4:3],
		  bst_addr3_in[4:3],bst_addr2_in[4:3],bst_addr1_in[4:3],bst_addr0_in[4:3]}),
	.dout	({bst_addr7[4:3],bst_addr6[4:3],bst_addr5[4:3],bst_addr4[4:3],
		  bst_addr3[4:3],bst_addr2[4:3],bst_addr1[4:3],bst_addr0[4:3]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Have to store the endianess of the store
assign bst_lendian_in[0] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[0] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[0];
assign bst_lendian_in[1] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[1] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[1];
assign bst_lendian_in[2] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[2] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[2];
assign bst_lendian_in[3] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[3] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[3];
assign bst_lendian_in[4] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[4] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[4];
assign bst_lendian_in[5] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[5] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[5];
assign bst_lendian_in[6] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[6] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[6];
assign bst_lendian_in[7] = (sbc_blk_inst_b & stb_cam_wptr_vld_b & thread_b[7] & ~pipe_flush_b) ? st_lendian_b : bst_lendian[7];

lsu_sbc_ctlmsff_ctl_macro__width_8 dff_bst_lendian  (
	.scan_in(dff_bst_lendian_scanin),
	.scan_out(dff_bst_lendian_scanout),
	.l1clk	(l1clk_pm1),
	.din	(bst_lendian_in[7:0]),
	.dout	(bst_lendian[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);
assign block_store_lendian = ((bst_tid[2:0] == 3'd0) & bst_lendian[0]) |
                             ((bst_tid[2:0] == 3'd1) & bst_lendian[1]) |
                             ((bst_tid[2:0] == 3'd2) & bst_lendian[2]) |
                             ((bst_tid[2:0] == 3'd3) & bst_lendian[3]) |
                             ((bst_tid[2:0] == 3'd4) & bst_lendian[4]) |
                             ((bst_tid[2:0] == 3'd5) & bst_lendian[5]) |
                             ((bst_tid[2:0] == 3'd6) & bst_lendian[6]) |
                             ((bst_tid[2:0] == 3'd7) & bst_lendian[7]) ;

assign bst_busy_rst = &(bst_count[2:0]);

assign bst_busy_in = (|(bst_sel[7:0])) | (bst_busy & ~bst_busy_rst);

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_bst_busy  (
	.scan_in(dff_bst_busy_scanin),
	.scan_out(dff_bst_busy_scanout),
	.din	(bst_busy_in),
	.dout	(bst_busy_out),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// If a store buffer diag read is in M, there will be a read-write collision in the stb_cam.
// In this case, restart the block store sequence by reissuing the lsu_block_store_stall
// and reseting the internal state machine.
assign bst_busy = bst_busy_out & ~(bst_p2 & dcc_stb_diag_rd_m);

lsu_lru8_ctl bst_lru8 (
	.scan_in(bst_lru8_scanin),
	.scan_out(bst_lru8_scanout),
	.request	(sbs_bst_req[7:0]),
	.enable		(bst_sel[7:0]),
	.select		(bst_sel_unqual_p[7:0]),
  .l1clk(l1clk),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

lsu_sbc_ctlmsff_ctl_macro__width_8 dff_bst_req  (
	.scan_in(dff_bst_req_scanin),
	.scan_out(dff_bst_req_scanout),
	.din	(bst_sel_unqual_p[7:0]),
	.dout	(bst_sel_unqual[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_sel[7:0] = bst_sel_unqual[7:0] & ~fatal_err_cond[7:0] &
                      {8{~(bst_busy | st_inst_vld_m | stb_diag_rd_w | full_raw_w | frf_read_pending)}};

assign sbc_bst_sel[7:0] = {8{bst_p2 & ~dcc_stb_diag_rd_m}} & block_store_thread[7:0];
assign any_bst_req = |(bst_sel[7:0]);

assign bst_tid_in[2:0] = lsu_block_store_stall ? lsu_block_store_tid[2:0] : bst_tid[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_bst_tid  (
	.scan_in(dff_bst_tid_scanin),
	.scan_out(dff_bst_tid_scanout),
	.din	(bst_tid_in[2:0]),
	.dout	(bst_tid[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_thread[0] = (bst_tid[2:0] == 3'd0);
assign block_store_thread[1] = (bst_tid[2:0] == 3'd1);
assign block_store_thread[2] = (bst_tid[2:0] == 3'd2);
assign block_store_thread[3] = (bst_tid[2:0] == 3'd3);
assign block_store_thread[4] = (bst_tid[2:0] == 3'd4);
assign block_store_thread[5] = (bst_tid[2:0] == 3'd5);
assign block_store_thread[6] = (bst_tid[2:0] == 3'd6);
assign block_store_thread[7] = (bst_tid[2:0] == 3'd7);

assign sbc_rmo_st_b = (dcc_binit_st_b & ~(tlb_pgnum_b39 & ~tlb_cam_mhit)) | bst_in_prog_b | (rmo_st_w & std_inst_w);

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_rmo_st_w  (
	.scan_in(dff_rmo_st_w_scanin),
	.scan_out(dff_rmo_st_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(sbc_rmo_st_b),
	.dout	(rmo_st_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_block_store_stall = |(bst_sel[7:0]);
assign lsu_block_store_tid[2] = bst_sel_unqual[4] | bst_sel_unqual[5] | bst_sel_unqual[6] | bst_sel_unqual[7];
assign lsu_block_store_tid[1] = bst_sel_unqual[2] | bst_sel_unqual[3] | bst_sel_unqual[6] | bst_sel_unqual[7];
assign lsu_block_store_tid[0] = bst_sel_unqual[1] | bst_sel_unqual[3] | bst_sel_unqual[5] | bst_sel_unqual[7];
assign lsu_block_store_rd[4:3] = {2{bst_sel_unqual[0]}} & bst_addr0[4:3] |
                                 {2{bst_sel_unqual[1]}} & bst_addr1[4:3] |
                                 {2{bst_sel_unqual[2]}} & bst_addr2[4:3] |
                                 {2{bst_sel_unqual[3]}} & bst_addr3[4:3] |
                                 {2{bst_sel_unqual[4]}} & bst_addr4[4:3] |
                                 {2{bst_sel_unqual[5]}} & bst_addr5[4:3] |
                                 {2{bst_sel_unqual[6]}} & bst_addr6[4:3] |
                                 {2{bst_sel_unqual[7]}} & bst_addr7[4:3] ;

// TLU must know which thread is receiving the data transfer in case of an FRF ECC error
assign lsu_block_store_b[0] = bst_in_prog_b & (bst_tid[2:0] == 3'd0);
assign lsu_block_store_b[1] = bst_in_prog_b & (bst_tid[2:0] == 3'd1);
assign lsu_block_store_b[2] = bst_in_prog_b & (bst_tid[2:0] == 3'd2);
assign lsu_block_store_b[3] = bst_in_prog_b & (bst_tid[2:0] == 3'd3);
assign lsu_block_store_b[4] = bst_in_prog_b & (bst_tid[2:0] == 3'd4);
assign lsu_block_store_b[5] = bst_in_prog_b & (bst_tid[2:0] == 3'd5);
assign lsu_block_store_b[6] = bst_in_prog_b & (bst_tid[2:0] == 3'd6);
assign lsu_block_store_b[7] = bst_in_prog_b & (bst_tid[2:0] == 3'd7);

// Sequencing logic

lsu_sbc_ctlmsff_ctl_macro__width_3 dff_bst_seq  (
	.scan_in(dff_bst_seq_scanin),
	.scan_out(dff_bst_seq_scanout),
	.din	({any_bst_req,bst_p1,bst_p2_in}),
	.dout	({bst_p1,     bst_p2,bst_p3}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_p2_in = bst_p2 & ~dcc_stb_diag_rd_m;

assign sbc_load_bst_addr = bst_p2;

assign bst_count_in[2:0] = bst_count[2:0] + {2'b00,bst_in_prog_m};

assign bst_in_prog_e = bst_p3 | (|(bst_count_in[2:0]));

lsu_sbc_ctlmsff_ctl_macro__width_6 dff_bst_count  (
	.scan_in(dff_bst_count_scanin),
	.scan_out(dff_bst_count_scanout),
	.din	({bst_count_in[2:0],bst_in_prog_e,bst_in_prog_e    ,bst_in_prog_m}),
	.dout	({bst_count[2:0],   bst_in_prog_m,lsu_block_store_m,bst_in_prog_b}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbc_bst_in_prog_m = bst_in_prog_m;
assign sbc_bst_in_prog_b = bst_in_prog_b;

assign sbc_bst_offset[2:0] = bst_count[2:0];

assign lsu_block_store_alloc[0] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd0);
assign lsu_block_store_alloc[1] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd1);
assign lsu_block_store_alloc[2] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd2);
assign lsu_block_store_alloc[3] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd3);
assign lsu_block_store_alloc[4] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd4);
assign lsu_block_store_alloc[5] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd5);
assign lsu_block_store_alloc[6] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd6);
assign lsu_block_store_alloc[7] = (bst_count[2:0] == 3'b001) & (bst_tid[2:0] == 3'd7);

// Must watch fgu ecc errors to know whether to kill block store
assign sbc_fgu_ecc_b = fgu_fst_ecc_error_fx2;

// If the read of the block store request gets a fatal error, kill the block store
assign bst_err_p3 = lsu_sbapp_err_g & bst_p3;

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_bst_rd_err  (
	.scan_in(dff_bst_rd_err_scanin),
	.scan_out(dff_bst_rd_err_scanout),
	.din	({bst_err_p3,bst_err_p4}),
	.dout	({bst_err_p4,sbc_bst_rd_err}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// STD
////////////////////////////////////////////////////////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_std_seq  (
	.scan_in(dff_std_seq_scanin),
	.scan_out(dff_std_seq_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dcc_std_inst_m,std_inst_b}),
	.dout	({std_inst_b,    std_inst_w}),
  .siclk(siclk),
  .soclk(soclk)
);

// Need to know when a 2 cycle is writing in W in order to used the older address parity
assign sbc_twocycle_inst_w = std_inst_w | casa_inst_w;

////////////////////////////////////////////////////////////////////////////////
// Partial RAW handling
// Generate an ID for use by partial raw cases.
////////////////////////////////////////////////////////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_praw_ctl_w  (
	.scan_in(dff_praw_ctl_w_scanin),
	.scan_out(dff_praw_ctl_w_scanout),
	.din	({dcc_asi_load_m,io_or_asi_load_b}),
	.dout	({asi_load_b,    io_or_asi_load_w}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign io_or_asi_load_b = asi_load_b | (tlb_pgnum_b39 & ~tlb_cam_mhit);

assign last_stb_wptr_w[2:0] = cam_wptr_w[2:0] - {3'b001};
assign rawp_id_w[2:0] = (stb_cam_mhit_w | io_or_asi_load_w | stb_diag_rd_w) ?
                         last_stb_wptr_w[2:0] : stb_cam_hit_ptr_w[2:0];

// Thread 0
assign rawp_id0[2:0] = (lmc_ld_inst_w & thread_w[0]) ? rawp_id_w[2:0] : rawp_id0_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id0  (
	.scan_in(dff_rawp_id0_scanin),
	.scan_out(dff_rawp_id0_scanout),
	.din	(rawp_id0[2:0]),
	.dout	(rawp_id0_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id0[0] = ~rawp_id0[2] & ~rawp_id0[1] & ~rawp_id0[0];
assign dec_rawp_id0[1] = ~rawp_id0[2] & ~rawp_id0[1] &  rawp_id0[0];
assign dec_rawp_id0[2] = ~rawp_id0[2] &  rawp_id0[1] & ~rawp_id0[0];
assign dec_rawp_id0[3] = ~rawp_id0[2] &  rawp_id0[1] &  rawp_id0[0];
assign dec_rawp_id0[4] =  rawp_id0[2] & ~rawp_id0[1] & ~rawp_id0[0];
assign dec_rawp_id0[5] =  rawp_id0[2] & ~rawp_id0[1] &  rawp_id0[0];
assign dec_rawp_id0[6] =  rawp_id0[2] &  rawp_id0[1] & ~rawp_id0[0];
assign dec_rawp_id0[7] =  rawp_id0[2] &  rawp_id0[1] &  rawp_id0[0];
assign sbc_rawp_rst[0] = |(dec_rawp_id0[7:0] & sbs0_state_ced[7:0]);

// Thread 1
assign rawp_id1[2:0] = (lmc_ld_inst_w & thread_w[1]) ? rawp_id_w[2:0] : rawp_id1_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id1  (
	.scan_in(dff_rawp_id1_scanin),
	.scan_out(dff_rawp_id1_scanout),
	.din	(rawp_id1[2:0]),
	.dout	(rawp_id1_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id1[0] = ~rawp_id1[2] & ~rawp_id1[1] & ~rawp_id1[0];
assign dec_rawp_id1[1] = ~rawp_id1[2] & ~rawp_id1[1] &  rawp_id1[0];
assign dec_rawp_id1[2] = ~rawp_id1[2] &  rawp_id1[1] & ~rawp_id1[0];
assign dec_rawp_id1[3] = ~rawp_id1[2] &  rawp_id1[1] &  rawp_id1[0];
assign dec_rawp_id1[4] =  rawp_id1[2] & ~rawp_id1[1] & ~rawp_id1[0];
assign dec_rawp_id1[5] =  rawp_id1[2] & ~rawp_id1[1] &  rawp_id1[0];
assign dec_rawp_id1[6] =  rawp_id1[2] &  rawp_id1[1] & ~rawp_id1[0];
assign dec_rawp_id1[7] =  rawp_id1[2] &  rawp_id1[1] &  rawp_id1[0];
assign sbc_rawp_rst[1] = |(dec_rawp_id1[7:0] & sbs1_state_ced[7:0]);

// Thread 2
assign rawp_id2[2:0] = (lmc_ld_inst_w & thread_w[2]) ? rawp_id_w[2:0] : rawp_id2_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id2  (
	.scan_in(dff_rawp_id2_scanin),
	.scan_out(dff_rawp_id2_scanout),
	.din	(rawp_id2[2:0]),
	.dout	(rawp_id2_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id2[0] = ~rawp_id2[2] & ~rawp_id2[1] & ~rawp_id2[0];
assign dec_rawp_id2[1] = ~rawp_id2[2] & ~rawp_id2[1] &  rawp_id2[0];
assign dec_rawp_id2[2] = ~rawp_id2[2] &  rawp_id2[1] & ~rawp_id2[0];
assign dec_rawp_id2[3] = ~rawp_id2[2] &  rawp_id2[1] &  rawp_id2[0];
assign dec_rawp_id2[4] =  rawp_id2[2] & ~rawp_id2[1] & ~rawp_id2[0];
assign dec_rawp_id2[5] =  rawp_id2[2] & ~rawp_id2[1] &  rawp_id2[0];
assign dec_rawp_id2[6] =  rawp_id2[2] &  rawp_id2[1] & ~rawp_id2[0];
assign dec_rawp_id2[7] =  rawp_id2[2] &  rawp_id2[1] &  rawp_id2[0];
assign sbc_rawp_rst[2] = |(dec_rawp_id2[7:0] & sbs2_state_ced[7:0]);

// Thread 3
assign rawp_id3[2:0] = (lmc_ld_inst_w & thread_w[3]) ? rawp_id_w[2:0] : rawp_id3_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id3  (
	.scan_in(dff_rawp_id3_scanin),
	.scan_out(dff_rawp_id3_scanout),
	.din	(rawp_id3[2:0]),
	.dout	(rawp_id3_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id3[0] = ~rawp_id3[2] & ~rawp_id3[1] & ~rawp_id3[0];
assign dec_rawp_id3[1] = ~rawp_id3[2] & ~rawp_id3[1] &  rawp_id3[0];
assign dec_rawp_id3[2] = ~rawp_id3[2] &  rawp_id3[1] & ~rawp_id3[0];
assign dec_rawp_id3[3] = ~rawp_id3[2] &  rawp_id3[1] &  rawp_id3[0];
assign dec_rawp_id3[4] =  rawp_id3[2] & ~rawp_id3[1] & ~rawp_id3[0];
assign dec_rawp_id3[5] =  rawp_id3[2] & ~rawp_id3[1] &  rawp_id3[0];
assign dec_rawp_id3[6] =  rawp_id3[2] &  rawp_id3[1] & ~rawp_id3[0];
assign dec_rawp_id3[7] =  rawp_id3[2] &  rawp_id3[1] &  rawp_id3[0];
assign sbc_rawp_rst[3] = |(dec_rawp_id3[7:0] & sbs3_state_ced[7:0]);

// Thread 4
assign rawp_id4[2:0] = (lmc_ld_inst_w & thread_w[4]) ? rawp_id_w[2:0] : rawp_id4_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id4  (
	.scan_in(dff_rawp_id4_scanin),
	.scan_out(dff_rawp_id4_scanout),
	.din	(rawp_id4[2:0]),
	.dout	(rawp_id4_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id4[0] = ~rawp_id4[2] & ~rawp_id4[1] & ~rawp_id4[0];
assign dec_rawp_id4[1] = ~rawp_id4[2] & ~rawp_id4[1] &  rawp_id4[0];
assign dec_rawp_id4[2] = ~rawp_id4[2] &  rawp_id4[1] & ~rawp_id4[0];
assign dec_rawp_id4[3] = ~rawp_id4[2] &  rawp_id4[1] &  rawp_id4[0];
assign dec_rawp_id4[4] =  rawp_id4[2] & ~rawp_id4[1] & ~rawp_id4[0];
assign dec_rawp_id4[5] =  rawp_id4[2] & ~rawp_id4[1] &  rawp_id4[0];
assign dec_rawp_id4[6] =  rawp_id4[2] &  rawp_id4[1] & ~rawp_id4[0];
assign dec_rawp_id4[7] =  rawp_id4[2] &  rawp_id4[1] &  rawp_id4[0];
assign sbc_rawp_rst[4] = |(dec_rawp_id4[7:0] & sbs4_state_ced[7:0]);

// Thread 5
assign rawp_id5[2:0] = (lmc_ld_inst_w & thread_w[5]) ? rawp_id_w[2:0] : rawp_id5_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id5  (
	.scan_in(dff_rawp_id5_scanin),
	.scan_out(dff_rawp_id5_scanout),
	.din	(rawp_id5[2:0]),
	.dout	(rawp_id5_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id5[0] = ~rawp_id5[2] & ~rawp_id5[1] & ~rawp_id5[0];
assign dec_rawp_id5[1] = ~rawp_id5[2] & ~rawp_id5[1] &  rawp_id5[0];
assign dec_rawp_id5[2] = ~rawp_id5[2] &  rawp_id5[1] & ~rawp_id5[0];
assign dec_rawp_id5[3] = ~rawp_id5[2] &  rawp_id5[1] &  rawp_id5[0];
assign dec_rawp_id5[4] =  rawp_id5[2] & ~rawp_id5[1] & ~rawp_id5[0];
assign dec_rawp_id5[5] =  rawp_id5[2] & ~rawp_id5[1] &  rawp_id5[0];
assign dec_rawp_id5[6] =  rawp_id5[2] &  rawp_id5[1] & ~rawp_id5[0];
assign dec_rawp_id5[7] =  rawp_id5[2] &  rawp_id5[1] &  rawp_id5[0];
assign sbc_rawp_rst[5] = |(dec_rawp_id5[7:0] & sbs5_state_ced[7:0]);

// Thread 6
assign rawp_id6[2:0] = (lmc_ld_inst_w & thread_w[6]) ? rawp_id_w[2:0] : rawp_id6_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id6  (
	.scan_in(dff_rawp_id6_scanin),
	.scan_out(dff_rawp_id6_scanout),
	.din	(rawp_id6[2:0]),
	.dout	(rawp_id6_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id6[0] = ~rawp_id6[2] & ~rawp_id6[1] & ~rawp_id6[0];
assign dec_rawp_id6[1] = ~rawp_id6[2] & ~rawp_id6[1] &  rawp_id6[0];
assign dec_rawp_id6[2] = ~rawp_id6[2] &  rawp_id6[1] & ~rawp_id6[0];
assign dec_rawp_id6[3] = ~rawp_id6[2] &  rawp_id6[1] &  rawp_id6[0];
assign dec_rawp_id6[4] =  rawp_id6[2] & ~rawp_id6[1] & ~rawp_id6[0];
assign dec_rawp_id6[5] =  rawp_id6[2] & ~rawp_id6[1] &  rawp_id6[0];
assign dec_rawp_id6[6] =  rawp_id6[2] &  rawp_id6[1] & ~rawp_id6[0];
assign dec_rawp_id6[7] =  rawp_id6[2] &  rawp_id6[1] &  rawp_id6[0];
assign sbc_rawp_rst[6] = |(dec_rawp_id6[7:0] & sbs6_state_ced[7:0]);

// Thread 7
assign rawp_id7[2:0] = (lmc_ld_inst_w & thread_w[7]) ? rawp_id_w[2:0] : rawp_id7_hold[2:0];
lsu_sbc_ctlmsff_ctl_macro__width_3 dff_rawp_id7  (
	.scan_in(dff_rawp_id7_scanin),
	.scan_out(dff_rawp_id7_scanout),
	.din	(rawp_id7[2:0]),
	.dout	(rawp_id7_hold[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign dec_rawp_id7[0] = ~rawp_id7[2] & ~rawp_id7[1] & ~rawp_id7[0];
assign dec_rawp_id7[1] = ~rawp_id7[2] & ~rawp_id7[1] &  rawp_id7[0];
assign dec_rawp_id7[2] = ~rawp_id7[2] &  rawp_id7[1] & ~rawp_id7[0];
assign dec_rawp_id7[3] = ~rawp_id7[2] &  rawp_id7[1] &  rawp_id7[0];
assign dec_rawp_id7[4] =  rawp_id7[2] & ~rawp_id7[1] & ~rawp_id7[0];
assign dec_rawp_id7[5] =  rawp_id7[2] & ~rawp_id7[1] &  rawp_id7[0];
assign dec_rawp_id7[6] =  rawp_id7[2] &  rawp_id7[1] & ~rawp_id7[0];
assign dec_rawp_id7[7] =  rawp_id7[2] &  rawp_id7[1] &  rawp_id7[0];
assign sbc_rawp_rst[7] = |(dec_rawp_id7[7:0] & sbs7_state_ced[7:0]);

////////////////////////////////////////////////////////////////////////////////
// Misc
////////////////////////////////////////////////////////////////////////////////

// Atomics are uncacheable.
assign sbc_st_pcx_nc = sbc_st_type_p4[1];

////////////////////////////////////////////////////////////////////////////////
// Store buffer RAM diagnostics and error handling
////////////////////////////////////////////////////////////////////////////////

// To make the error resolution even more robust, I'm encoding the priv/hpriv bits
// into three bits.  Each priv level has a Hamming distance >1 from the others, so
// I know if the parity error affected the priv information.

assign priv_enc[2] = dcc_hpriv_b;
assign priv_enc[1] = dcc_priv_b & ~dcc_hpriv_b;
assign priv_enc[0] = dcc_hpriv_b | dcc_priv_b;

assign sbc_stb_ctl_data[2:0] = mbi_run_local ? mbi_wdata[2:0] : priv_enc[2:0];

assign inv_addr_prty_m = lsu_asi_error_inject_b31 & lsu_asi_error_inject_b19 & ~dcc_wr_error_inj_m;
assign inv_ecc_m = lsu_asi_error_inject_b31 & lsu_asi_error_inject_b17 & ~dcc_wr_error_inj_m;

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_error_inj  (
	.scan_in(dff_error_inj_scanin),
	.scan_out(dff_error_inj_scanout),
	.l1clk	(l1clk_pm1),
	.din	({inv_addr_prty_m,inv_ecc_m}),
	.dout	({inv_addr_prty_b,inv_ecc_b}),
  .siclk(siclk),
  .soclk(soclk)
);
assign sbc_inv_addr_prty = inv_addr_prty_b; 
assign sbc_inv_ecc[6:0] = {7{inv_ecc_b}} & lsu_asi_error_inject[6:0];

////////////////////////////////////////////////////////////////////////////////
// BIST
////////////////////////////////////////////////////////////////////////////////

lsu_sbc_ctlmsff_ctl_macro__width_5 dff_bist_in  (
	.scan_in(dff_bist_in_scanin),
	.scan_out(dff_bist_in_scanout),
	.l1clk	(l1clk_pm1),
	.din	({mbi_stb_cam_read_en,bist_scm_rd_1,  mbi_stb_ram_read_en,bist_srm_rd_1,  mbi_run}),
	.dout	({bist_scm_rd_1,      bist_scm_cmp_en,bist_srm_rd_1,      bist_srm_cmp_en,mbi_run_local}),
  .siclk(siclk),
  .soclk(soclk)
);

assign sbc_mbi_run = mbi_run_local;

assign stb_cam_fail = bist_scm_cmp_en & (~sed_bist_cmp_0 | ~sed_bist_cmp_1 | ~sed_bist_cmp_2 | ~sed_bist_cmp_3);
assign stb_ram_fail = bist_srm_cmp_en & (~sed_bist_cmp_0 | ~sed_bist_cmp_1 | ~sed_bist_cmp_2 | ~sed_bist_cmp_3);

lsu_sbc_ctlmsff_ctl_macro__width_2 dff_bist_fail  (
	.scan_in(dff_bist_fail_scanin),
	.scan_out(dff_bist_fail_scanout),
	.l1clk	(l1clk_pm1),
	.din	({stb_cam_fail,        stb_ram_fail}),
	.dout	({lsu_mbi_stb_cam_fail,lsu_mbi_stb_ram_fail}),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Junk to prevent a collision at the FRF.  Without this, there is a possibility
// that a block store (which reads the FRF) could collide with an ASI read.
// When I detect an ASI read going out, supress block store requests until it
// comes back.
////////////////////////////////////////////////////////////////////////////////

assign frf_read_out = pic_asi_sel_p4 & ~st_asi_sel_p4 & (lmd_asi_type[1:0] == 2'b00) & (lmd_asi_asi[7:0] == 8'h49);
assign frf_read_pending_in = frf_read_out | (frf_read_pending & ~lmc_asi_indet_retire);

lsu_sbc_ctlmsff_ctl_macro__width_1 dff_frf_read  (
	.scan_in(dff_frf_read_scanin),
	.scan_out(dff_frf_read_scanout),
	.din	(frf_read_pending_in),
	.dout	(frf_read_pending),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_frf_read_pending = frf_read_pending;

lsu_sbc_ctlmsff_ctl_macro__scanreverse_1__width_5 dff_spares   (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.din	({3'b0,       indet_block_req_p2,indet_block_req_p3}),
	.dout	({unused[2:0],indet_block_req_p3,indet_block_req_p4}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

//spare_ctl_macro spares (num=5) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk	(l1clk)
//);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_flush_b_scanin        = scan_in                  ;
assign dff_flush_w_scanin        = dff_flush_b_scanout      ;
assign dff_inst_m_scanin         = dff_flush_w_scanout      ;
assign dff_ldst_fp_m_scanin      = dff_inst_m_scanout       ;
assign dff_ldst_sz_b_scanin      = dff_ldst_fp_m_scanout    ;
assign dff_st_w_scanin           = dff_ldst_sz_b_scanout    ;
assign dff_st_le_b_scanin        = dff_st_w_scanout         ;
assign dff_cam_hit_scanin        = dff_st_le_b_scanout      ;
assign dff_ram_wptr_vld_b_scanin = dff_cam_hit_scanout      ;
assign dff_stb_wptr_vld_w_scanin = dff_ram_wptr_vld_b_scanout;
assign dff_tid_m_scanin          = dff_stb_wptr_vld_w_scanout;
assign dff_thread_b_scanin       = dff_tid_m_scanout        ;
assign dff_cam_wptr_scanin       = dff_thread_b_scanout     ;
assign dff_ram_rptr_scanin       = dff_cam_wptr_scanout     ;
assign dff_st_rq_p2_scanin       = dff_ram_rptr_scanout     ;
assign st_lru8_scanin            = dff_st_rq_p2_scanout     ;
assign dff_indet_temp_scanin     = st_lru8_scanout          ;
assign dff_st_sel_p3_scanin      = dff_indet_temp_scanout   ;
assign dff_asi_indet_scanin      = dff_st_sel_p3_scanout    ;
assign dff_st_sel_p4_scanin      = dff_asi_indet_scanout    ;
assign dff_cerer_scanin          = dff_st_sel_p4_scanout    ;
assign dff_stb_err_scanin        = dff_cerer_scanout        ;
assign dff_fatal_err_scanin      = dff_stb_err_scanout      ;
assign dff_bst_addr_pipe_scanin  = dff_fatal_err_scanout    ;
assign dff_bst_addr_scanin       = dff_bst_addr_pipe_scanout;
assign dff_bst_lendian_scanin    = dff_bst_addr_scanout     ;
assign dff_bst_busy_scanin       = dff_bst_lendian_scanout  ;
assign bst_lru8_scanin           = dff_bst_busy_scanout     ;
assign dff_bst_req_scanin        = bst_lru8_scanout         ;
assign dff_bst_tid_scanin        = dff_bst_req_scanout      ;
assign dff_rmo_st_w_scanin       = dff_bst_tid_scanout      ;
assign dff_bst_seq_scanin        = dff_rmo_st_w_scanout     ;
assign dff_bst_count_scanin      = dff_bst_seq_scanout      ;
assign dff_bst_rd_err_scanin     = dff_bst_count_scanout    ;
assign dff_std_seq_scanin        = dff_bst_rd_err_scanout   ;
assign dff_praw_ctl_w_scanin     = dff_std_seq_scanout      ;
assign dff_rawp_id0_scanin       = dff_praw_ctl_w_scanout   ;
assign dff_rawp_id1_scanin       = dff_rawp_id0_scanout     ;
assign dff_rawp_id2_scanin       = dff_rawp_id1_scanout     ;
assign dff_rawp_id3_scanin       = dff_rawp_id2_scanout     ;
assign dff_rawp_id4_scanin       = dff_rawp_id3_scanout     ;
assign dff_rawp_id5_scanin       = dff_rawp_id4_scanout     ;
assign dff_rawp_id6_scanin       = dff_rawp_id5_scanout     ;
assign dff_rawp_id7_scanin       = dff_rawp_id6_scanout     ;
assign dff_error_inj_scanin      = dff_rawp_id7_scanout     ;
assign dff_bist_in_scanin        = dff_error_inj_scanout    ;
assign dff_bist_fail_scanin      = dff_bist_in_scanout      ;
assign dff_frf_read_scanin       = dff_bist_fail_scanout    ;
assign spares_scanin             = dff_frf_read_scanout     ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_sbc_ctll1clkhdr_ctl_macro (
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

module lsu_sbc_ctlmsff_ctl_macro__width_1 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_3 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_2 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_9 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_6 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_8 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_12 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_18 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = din[17:0];






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule







// any PARAMS parms go into naming of macro

module lsu_sbc_ctlmsff_ctl_macro__width_7 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_sbc_ctlmsff_ctl_macro__width_4 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_10 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_16 (
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

module lsu_sbc_ctlmsff_ctl_macro__width_5 (
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

module lsu_sbc_ctlmsff_ctl_macro__scanreverse_1__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [0:3] so;

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
.si({so[0:3],scan_in}),
.so({scan_out,so[0:3]}),
.q(dout[4:0])
);












endmodule








