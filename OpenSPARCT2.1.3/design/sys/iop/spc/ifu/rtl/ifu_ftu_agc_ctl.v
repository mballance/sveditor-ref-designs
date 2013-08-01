// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu_agc_ctl.v
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
module ifu_ftu_agc_ctl (
  tcu_se_scancollar_out, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tlu_trap_pc_0_valid, 
  tlu_retry, 
  tlu_ceter_pscce, 
  tlu_trap_pc_1_valid, 
  tlu_ifu_invalidate, 
  tlu_trap_0_tid, 
  tlu_trap_1_tid, 
  spc_core_running_status, 
  mbi_wdata, 
  mbi_addr, 
  mbi_cmpsel, 
  mbi_run, 
  mbi_icv_write_en, 
  tlu_flush_ifu, 
  tlu_ifu_hpstate_hpriv, 
  tlu_ifu_pstate_priv, 
  tlu_cerer_ittp, 
  tlu_cerer_itdp, 
  tlu_cerer_ittm, 
  tlu_cerer_icl2c, 
  tlu_cerer_icl2u, 
  tlu_cerer_icl2nd, 
  tlu_cerer_icvp, 
  tlu_cerer_ictp, 
  tlu_cerer_ictm, 
  tlb_nfo, 
  agd_va_hole_excp_f, 
  agd_itlb_valid_f, 
  agd_itlb_valid_dupl_f, 
  asi_ith_det_req, 
  asi_vl_arr_data, 
  ftp_asi_tg_wr_req_hold, 
  ftp_itlb_cam_vld_f, 
  asi_addr_bf, 
  asi_way_bf, 
  ifu_agd_pc_f, 
  agd_thr0_pc_4_2_f, 
  agd_thr1_pc_4_2_f, 
  agd_thr2_pc_4_2_f, 
  agd_thr3_pc_4_2_f, 
  agd_thr4_pc_4_2_f, 
  agd_thr5_pc_4_2_f, 
  agd_thr6_pc_4_2_f, 
  agd_thr7_pc_4_2_f, 
  dec_load_flush_w, 
  itc_bypass_bf, 
  itc_real_bf, 
  itc_demap_next, 
  ftp_curr_fetch_thr_f, 
  ftp_fetch_thr_q_f, 
  ftp_fill_req_q_bf, 
  ftp_any_thr_clken, 
  err_w0_8b_parity_f, 
  err_w1_8b_parity_f, 
  err_w2_8b_parity_f, 
  err_w3_8b_parity_f, 
  err_w4_8b_parity_f, 
  err_w5_8b_parity_f, 
  err_w6_8b_parity_f, 
  err_w7_8b_parity_f, 
  tsm_thr0_ignore_by_pass, 
  tsm_thr1_ignore_by_pass, 
  tsm_thr2_ignore_by_pass, 
  tsm_thr3_ignore_by_pass, 
  tsm_thr4_ignore_by_pass, 
  tsm_thr5_ignore_by_pass, 
  tsm_thr6_ignore_by_pass, 
  tsm_thr7_ignore_by_pass, 
  tsm_thr0_no_new_miss, 
  tsm_thr1_no_new_miss, 
  tsm_thr2_no_new_miss, 
  tsm_thr3_no_new_miss, 
  tsm_thr4_no_new_miss, 
  tsm_thr5_no_new_miss, 
  tsm_thr6_no_new_miss, 
  tsm_thr7_no_new_miss, 
  cmu_any_data_ready, 
  cmu_any_un_cacheable, 
  cmu_l2_err, 
  cmu_l2miss, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  cmu_fill_wrway, 
  cmu_icache_invalidate, 
  cmu_evic_invalidate, 
  cmu_icache_invalidate_way, 
  cmu_icache_inv_way1, 
  fill_paddr_bit_5, 
  inv_paddr_bit_5, 
  ftu_paddr_unq_39, 
  cmu_instr_v, 
  dec_br_taken_e, 
  dec_valid_e, 
  ftp_tid0_e, 
  ftp_tid1_e, 
  ftp_fetch_v_f, 
  itb_chit_c, 
  itb_cam_hit_c, 
  itb_tte_p_c, 
  itb_itb_mhit_c, 
  itb_tte_tag_parity, 
  itb_tte_data_parity, 
  itb_icd_waysel_c, 
  lsu_ifu_tid_w, 
  lsu_ifu_wr_p0ctxt, 
  lsu_ifu_wr_p1ctxt, 
  lsu_ifu_no_miss, 
  lsu_ic_enable, 
  cmu_inval_ack, 
  ftp_asi_mbist_access_bf, 
  itd_prty_256m, 
  itd_prty_4m, 
  itd_prty_64k, 
  itd_prty_8k, 
  itd_prty_ctxt0, 
  itd_prty_ctxt1, 
  tlb_pgsize, 
  tlb_context0_hit, 
  ftu_buffer_wr_en_f, 
  agc_itb_tag_perr_c, 
  agc_vl_data_c, 
  agc_asi_sel_word_c, 
  agc_sel_tg_data_f, 
  agc_word_en_bf, 
  agc_by_pass_update_lru_bf, 
  agc_invalidation_req_ff, 
  agc_any_invalidation_req_f, 
  agc_thr0_sf_valid_f, 
  agc_thr1_sf_valid_f, 
  agc_thr2_sf_valid_f, 
  agc_thr3_sf_valid_f, 
  agc_thr4_sf_valid_f, 
  agc_thr5_sf_valid_f, 
  agc_thr6_sf_valid_f, 
  agc_thr7_sf_valid_f, 
  agc_thr0_micro_flush_unq_c, 
  agc_thr1_micro_flush_unq_c, 
  agc_thr2_micro_flush_unq_c, 
  agc_thr3_micro_flush_unq_c, 
  agc_thr4_micro_flush_unq_c, 
  agc_thr5_micro_flush_unq_c, 
  agc_thr6_micro_flush_unq_c, 
  agc_thr7_micro_flush_unq_c, 
  agc_thr0_err_detect_c, 
  agc_thr1_err_detect_c, 
  agc_thr2_err_detect_c, 
  agc_thr3_err_detect_c, 
  agc_thr4_err_detect_c, 
  agc_thr5_err_detect_c, 
  agc_thr6_err_detect_c, 
  agc_thr7_err_detect_c, 
  agc_thr0_cmiss_stm_c, 
  agc_thr1_cmiss_stm_c, 
  agc_thr2_cmiss_stm_c, 
  agc_thr3_cmiss_stm_c, 
  agc_thr4_cmiss_stm_c, 
  agc_thr5_cmiss_stm_c, 
  agc_thr6_cmiss_stm_c, 
  agc_thr7_cmiss_stm_c, 
  ftu_agc_thr0_cmiss_c, 
  ftu_agc_thr1_cmiss_c, 
  ftu_agc_thr2_cmiss_c, 
  ftu_agc_thr3_cmiss_c, 
  ftu_agc_thr4_cmiss_c, 
  ftu_agc_thr5_cmiss_c, 
  ftu_agc_thr6_cmiss_c, 
  ftu_agc_thr7_cmiss_c, 
  ftu_thr0_inv_req_c, 
  ftu_thr1_inv_req_c, 
  ftu_thr2_inv_req_c, 
  ftu_thr3_inv_req_c, 
  ftu_thr4_inv_req_c, 
  ftu_thr5_inv_req_c, 
  ftu_thr6_inv_req_c, 
  ftu_thr7_inv_req_c, 
  ifu_ibuffer_write_c, 
  ftu_fetch_thr_c, 
  ftu_instr_sf_valid_c, 
  ftu_excp_way_d, 
  ftu_excp_tid_d, 
  ftu_excp_way_valid_d, 
  agc_fill_wrway_bf, 
  agc_sel_inv_index, 
  agc_thr0_lsu_no_ic_miss, 
  agc_thr1_lsu_no_ic_miss, 
  agc_thr2_lsu_no_ic_miss, 
  agc_thr3_lsu_no_ic_miss, 
  agc_thr4_lsu_no_ic_miss, 
  agc_thr5_lsu_no_ic_miss, 
  agc_thr6_lsu_no_ic_miss, 
  agc_thr7_lsu_no_ic_miss, 
  agc_thr0_itb_miss_c, 
  agc_thr1_itb_miss_c, 
  agc_thr2_itb_miss_c, 
  agc_thr3_itb_miss_c, 
  agc_thr4_itb_miss_c, 
  agc_thr5_itb_miss_c, 
  agc_thr6_itb_miss_c, 
  agc_thr7_itb_miss_c, 
  ftu_ic_no_err_c, 
  ftu_bus_0_is_first, 
  ftu_bus_1_is_first, 
  ftu_bus_2_is_first, 
  ftu_bus_3_is_first, 
  ftu_instr_valid_c, 
  ftu_exception_valid_c, 
  ftu_instr_exceptions_c, 
  agc_thr0_pcf_sel_bf, 
  agc_thr1_pcf_sel_bf, 
  agc_thr2_pcf_sel_bf, 
  agc_thr3_pcf_sel_bf, 
  agc_thr4_pcf_sel_bf, 
  agc_thr5_pcf_sel_bf, 
  agc_thr6_pcf_sel_bf, 
  agc_thr7_pcf_sel_bf, 
  agc_thr0_pcf_sel_last_bf, 
  agc_thr1_pcf_sel_last_bf, 
  agc_thr2_pcf_sel_last_bf, 
  agc_thr3_pcf_sel_last_bf, 
  agc_thr4_pcf_sel_last_bf, 
  agc_thr5_pcf_sel_last_bf, 
  agc_thr6_pcf_sel_last_bf, 
  agc_thr7_pcf_sel_last_bf, 
  agc_icv_wr_req_bf, 
  agc_icv_wrdata_bf, 
  agc_icv_wren_bf, 
  ftu_thr0_redirect_bf, 
  ftu_thr1_redirect_bf, 
  ftu_thr2_redirect_bf, 
  ftu_thr3_redirect_bf, 
  ftu_thr4_redirect_bf, 
  ftu_thr5_redirect_bf, 
  ftu_thr6_redirect_bf, 
  ftu_thr7_redirect_bf, 
  ftu_ibu_redirect_bf, 
  agc_thr0_tlu_redirect_bf, 
  agc_thr1_tlu_redirect_bf, 
  agc_thr2_tlu_redirect_bf, 
  agc_thr3_tlu_redirect_bf, 
  agc_thr4_tlu_redirect_bf, 
  agc_thr5_tlu_redirect_bf, 
  agc_thr6_tlu_redirect_bf, 
  agc_thr7_tlu_redirect_bf, 
  agc_kill_fetch_cv_c, 
  agc_pc_sel_for_c, 
  agc_instr_bp_sel_c, 
  agc_thr0_byp_incr_bit5, 
  agc_thr1_byp_incr_bit5, 
  agc_thr2_byp_incr_bit5, 
  agc_thr3_byp_incr_bit5, 
  agc_thr4_byp_incr_bit5, 
  agc_thr5_byp_incr_bit5, 
  agc_thr6_byp_incr_bit5, 
  agc_thr7_byp_incr_bit5, 
  agc_thr0_byp_pc_update_bf, 
  agc_thr1_byp_pc_update_bf, 
  agc_thr2_byp_pc_update_bf, 
  agc_thr3_byp_pc_update_bf, 
  agc_thr4_byp_pc_update_bf, 
  agc_thr5_byp_pc_update_bf, 
  agc_thr6_byp_pc_update_bf, 
  agc_thr7_byp_pc_update_bf, 
  agc_thr0_cntx_0_sel, 
  agc_thr0_cntx_1_sel, 
  agc_thr1_cntx_0_sel, 
  agc_thr1_cntx_1_sel, 
  agc_thr2_cntx_0_sel, 
  agc_thr2_cntx_1_sel, 
  agc_thr3_cntx_0_sel, 
  agc_thr3_cntx_1_sel, 
  agc_thr4_cntx_0_sel, 
  agc_thr4_cntx_1_sel, 
  agc_thr5_cntx_0_sel, 
  agc_thr5_cntx_1_sel, 
  agc_thr6_cntx_0_sel, 
  agc_thr6_cntx_1_sel, 
  agc_thr7_cntx_0_sel, 
  agc_thr7_cntx_1_sel, 
  agc_thr0_cntx_0_sel_ff, 
  agc_thr0_cntx_1_sel_ff, 
  agc_thr1_cntx_0_sel_ff, 
  agc_thr1_cntx_1_sel_ff, 
  agc_thr2_cntx_0_sel_ff, 
  agc_thr2_cntx_1_sel_ff, 
  agc_thr3_cntx_0_sel_ff, 
  agc_thr3_cntx_1_sel_ff, 
  agc_thr4_cntx_0_sel_ff, 
  agc_thr4_cntx_1_sel_ff, 
  agc_thr5_cntx_0_sel_ff, 
  agc_thr5_cntx_1_sel_ff, 
  agc_thr6_cntx_0_sel_ff, 
  agc_thr6_cntx_1_sel_ff, 
  agc_thr7_cntx_0_sel_ff, 
  agc_thr7_cntx_1_sel_ff, 
  ftu_mbi_tlb_cam_hit, 
  ftu_mbi_tlb_ctxt0_hit, 
  ftu_mbi_tlb_cam_mhit, 
  scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk;
wire l1clk_pm1;
wire l1clk_out;
wire thr0_first_level_sel_bf;
wire thr0_trap_pcaddr_is_valid_bf;
wire thr0_lsu_sync_bf;
wire thr0_replay_pc;
wire last_fetch_was_thr0_bf;
wire agc_by_pass_valid_bf;
wire [7:0] agc_by_pass_sel_bf;
wire thr0_br_misp_f;
wire thr0_matches_curr_f;
wire agc_thr0_br_misp_f;
wire thr1_first_level_sel_bf;
wire thr1_trap_pcaddr_is_valid_bf;
wire thr1_lsu_sync_bf;
wire thr1_replay_pc;
wire last_fetch_was_thr1_bf;
wire thr1_br_misp_f;
wire thr1_matches_curr_f;
wire agc_thr1_br_misp_f;
wire thr2_first_level_sel_bf;
wire thr2_trap_pcaddr_is_valid_bf;
wire thr2_lsu_sync_bf;
wire thr2_replay_pc;
wire last_fetch_was_thr2_bf;
wire thr2_br_misp_f;
wire thr2_matches_curr_f;
wire agc_thr2_br_misp_f;
wire thr3_first_level_sel_bf;
wire thr3_trap_pcaddr_is_valid_bf;
wire thr3_lsu_sync_bf;
wire thr3_replay_pc;
wire last_fetch_was_thr3_bf;
wire thr3_br_misp_f;
wire thr3_matches_curr_f;
wire agc_thr3_br_misp_f;
wire thr4_first_level_sel_bf;
wire thr4_trap_pcaddr_is_valid_bf;
wire thr4_lsu_sync_bf;
wire thr4_replay_pc;
wire last_fetch_was_thr4_bf;
wire thr4_br_misp_f;
wire thr4_matches_curr_f;
wire agc_thr4_br_misp_f;
wire thr5_first_level_sel_bf;
wire thr5_trap_pcaddr_is_valid_bf;
wire thr5_lsu_sync_bf;
wire thr5_replay_pc;
wire last_fetch_was_thr5_bf;
wire thr5_br_misp_f;
wire thr5_matches_curr_f;
wire agc_thr5_br_misp_f;
wire thr6_first_level_sel_bf;
wire thr6_trap_pcaddr_is_valid_bf;
wire thr6_lsu_sync_bf;
wire thr6_replay_pc;
wire last_fetch_was_thr6_bf;
wire thr6_br_misp_f;
wire thr6_matches_curr_f;
wire agc_thr6_br_misp_f;
wire thr7_first_level_sel_bf;
wire thr7_trap_pcaddr_is_valid_bf;
wire thr7_lsu_sync_bf;
wire thr7_replay_pc;
wire last_fetch_was_thr7_bf;
wire thr7_br_misp_f;
wire thr7_matches_curr_f;
wire agc_thr7_br_misp_f;
wire [3:0] trap_thread_g0;
wire [3:0] trap_thread_g1;
wire thr0_sf_is_valid_bf;
wire thr1_sf_is_valid_bf;
wire thr2_sf_is_valid_bf;
wire thr3_sf_is_valid_bf;
wire thr4_sf_is_valid_bf;
wire thr5_sf_is_valid_bf;
wire thr6_sf_is_valid_bf;
wire thr7_sf_is_valid_bf;
wire [7:0] load_flush_w;
wire [7:0] tid_dec_w;
wire tlu_ceter_pscce_reg_scanin;
wire tlu_ceter_pscce_reg_scanout;
wire [7:0] ceter_pscce_ff;
wire br_misp_data_reg_scanin;
wire br_misp_data_reg_scanout;
wire [1:0] tid1_m;
wire [1:0] tid0_m;
wire [1:0] agc_br_taken_m;
wire [1:0] agc_valid_m;
wire [1:0] br_taken_ff;
wire [1:0] br_taken_dup_ff;
wire [1:0] agc_br_taken_dup_m;
wire [1:0] agc_valid_dup_m;
wire br_misp_data_dup_reg_scanin;
wire br_misp_data_dup_reg_scanout;
wire [1:0] tid1_dup_m;
wire [1:0] tid0_dup_m;
wire [1:0] tid1_dup_b;
wire [1:0] tid0_dup_b;
wire [7:0] next_tid_dec_b;
wire tid_dec_w_reg_scanin;
wire tid_dec_w_reg_scanout;
wire curr_fetch_thr_c_reg_scanin;
wire curr_fetch_thr_c_reg_scanout;
wire [7:0] curr_fetch_thr_c;
wire cms_curr_fetch_thr_c_reg_scanin;
wire cms_curr_fetch_thr_c_reg_scanout;
wire [7:0] cms_curr_fetch_thr_c;
wire thr0_matches_curr_c;
wire thr1_matches_curr_c;
wire thr2_matches_curr_c;
wire thr3_matches_curr_c;
wire thr4_matches_curr_c;
wire thr5_matches_curr_c;
wire thr6_matches_curr_c;
wire thr7_matches_curr_c;
wire set_thr0_sf_valid_bf;
wire agc_thr0_reset_sf_c;
wire sf_valid_c;
wire reset_thr0_sf_valid_bf;
wire invalidation_req_f;
wire [7:0] agc_by_pass_sel_f;
wire agc_by_pass_valid_f;
wire [7:0] tlu_flush_ifu_f;
wire hold_thr0_sf_valid_bf;
wire next_thr0_sf_valid_bf;
wire thr0_sf_valid_f;
wire set_thr1_sf_valid_bf;
wire agc_thr1_reset_sf_c;
wire reset_thr1_sf_valid_bf;
wire hold_thr1_sf_valid_bf;
wire next_thr1_sf_valid_bf;
wire thr1_sf_valid_f;
wire set_thr2_sf_valid_bf;
wire agc_thr2_reset_sf_c;
wire reset_thr2_sf_valid_bf;
wire hold_thr2_sf_valid_bf;
wire next_thr2_sf_valid_bf;
wire thr2_sf_valid_f;
wire set_thr3_sf_valid_bf;
wire agc_thr3_reset_sf_c;
wire reset_thr3_sf_valid_bf;
wire hold_thr3_sf_valid_bf;
wire next_thr3_sf_valid_bf;
wire thr3_sf_valid_f;
wire set_thr4_sf_valid_bf;
wire agc_thr4_reset_sf_c;
wire reset_thr4_sf_valid_bf;
wire hold_thr4_sf_valid_bf;
wire next_thr4_sf_valid_bf;
wire thr4_sf_valid_f;
wire set_thr5_sf_valid_bf;
wire agc_thr5_reset_sf_c;
wire reset_thr5_sf_valid_bf;
wire hold_thr5_sf_valid_bf;
wire next_thr5_sf_valid_bf;
wire thr5_sf_valid_f;
wire set_thr6_sf_valid_bf;
wire agc_thr6_reset_sf_c;
wire reset_thr6_sf_valid_bf;
wire hold_thr6_sf_valid_bf;
wire next_thr6_sf_valid_bf;
wire thr6_sf_valid_f;
wire set_thr7_sf_valid_bf;
wire agc_thr7_reset_sf_c;
wire reset_thr7_sf_valid_bf;
wire hold_thr7_sf_valid_bf;
wire next_thr7_sf_valid_bf;
wire thr7_sf_valid_f;
wire sf_valid_reg_scanin;
wire sf_valid_reg_scanout;
wire sf_valid_dup_reg_scanin;
wire sf_valid_dup_reg_scanout;
wire instr_sf_valid_f;
wire sf_valid_by_pass_bf;
wire sf_valid_by_pass_f_reg_scanin;
wire sf_valid_by_pass_f_reg_scanout;
wire sf_valid_by_pass_f;
wire sf_valid_by_pass_c_reg_scanin;
wire sf_valid_by_pass_c_reg_scanout;
wire sf_valid_by_pass_c;
wire sf_v_c_scanin;
wire sf_v_c_scanout;
wire instr_sf_valid_c;
wire set_thr0_unc_valid_bf;
wire thr0_unc_is_valid;
wire reset_thr0_unc_valid_bf;
wire hold_thr0_unc_valid_bf;
wire next_thr0_unc_valid_bf;
wire thr0_unc_valid_f;
wire set_thr1_unc_valid_bf;
wire thr1_unc_is_valid;
wire reset_thr1_unc_valid_bf;
wire hold_thr1_unc_valid_bf;
wire next_thr1_unc_valid_bf;
wire thr1_unc_valid_f;
wire set_thr2_unc_valid_bf;
wire thr2_unc_is_valid;
wire reset_thr2_unc_valid_bf;
wire hold_thr2_unc_valid_bf;
wire next_thr2_unc_valid_bf;
wire thr2_unc_valid_f;
wire set_thr3_unc_valid_bf;
wire thr3_unc_is_valid;
wire reset_thr3_unc_valid_bf;
wire hold_thr3_unc_valid_bf;
wire next_thr3_unc_valid_bf;
wire thr3_unc_valid_f;
wire set_thr4_unc_valid_bf;
wire thr4_unc_is_valid;
wire reset_thr4_unc_valid_bf;
wire hold_thr4_unc_valid_bf;
wire next_thr4_unc_valid_bf;
wire thr4_unc_valid_f;
wire set_thr5_unc_valid_bf;
wire thr5_unc_is_valid;
wire reset_thr5_unc_valid_bf;
wire hold_thr5_unc_valid_bf;
wire next_thr5_unc_valid_bf;
wire thr5_unc_valid_f;
wire set_thr6_unc_valid_bf;
wire thr6_unc_is_valid;
wire reset_thr6_unc_valid_bf;
wire hold_thr6_unc_valid_bf;
wire next_thr6_unc_valid_bf;
wire thr6_unc_valid_f;
wire set_thr7_unc_valid_bf;
wire thr7_unc_is_valid;
wire reset_thr7_unc_valid_bf;
wire hold_thr7_unc_valid_bf;
wire next_thr7_unc_valid_bf;
wire thr7_unc_valid_f;
wire unc_valid_reg_scanin;
wire unc_valid_reg_scanout;
wire thr0_by_pass_pc_incr_bit5;
wire [4:2] thr0_by_pass_inc_pc_bf;
wire thr0_pc_f_inc_reg_scanin;
wire thr0_pc_f_inc_reg_scanout;
wire thr1_by_pass_pc_incr_bit5;
wire [4:2] thr1_by_pass_inc_pc_bf;
wire thr1_pc_f_inc_reg_scanin;
wire thr1_pc_f_inc_reg_scanout;
wire thr2_by_pass_pc_incr_bit5;
wire [4:2] thr2_by_pass_inc_pc_bf;
wire thr2_pc_f_inc_reg_scanin;
wire thr2_pc_f_inc_reg_scanout;
wire thr3_by_pass_pc_incr_bit5;
wire [4:2] thr3_by_pass_inc_pc_bf;
wire thr3_pc_f_inc_reg_scanin;
wire thr3_pc_f_inc_reg_scanout;
wire thr4_by_pass_pc_incr_bit5;
wire [4:2] thr4_by_pass_inc_pc_bf;
wire thr4_pc_f_inc_reg_scanin;
wire thr4_pc_f_inc_reg_scanout;
wire thr5_by_pass_pc_incr_bit5;
wire [4:2] thr5_by_pass_inc_pc_bf;
wire thr5_pc_f_inc_reg_scanin;
wire thr5_pc_f_inc_reg_scanout;
wire thr6_by_pass_pc_incr_bit5;
wire [4:2] thr6_by_pass_inc_pc_bf;
wire thr6_pc_f_inc_reg_scanin;
wire thr6_pc_f_inc_reg_scanout;
wire thr7_by_pass_pc_incr_bit5;
wire [4:2] thr7_by_pass_inc_pc_bf;
wire thr7_pc_f_inc_reg_scanin;
wire thr7_pc_f_inc_reg_scanout;
wire tlu_flush_ifu_reg_scanin;
wire tlu_flush_ifu_reg_scanout;
wire tlu_flush_ifu_d_reg_scanin;
wire tlu_flush_ifu_d_reg_scanout;
wire [7:0] tlu_flush_ifu_f_d;
wire [7:0] tlu_flush_ifu_f_dd;
wire cms_tlu_flush_ifu_reg_scanin;
wire cms_tlu_flush_ifu_reg_scanout;
wire [7:0] cms_tlu_flush_f;
wire load_flush_reg_scanin;
wire load_flush_reg_scanout;
wire [7:0] load_flush_f;
wire agc_kill_fetch_cv_f;
wire ftu_thr0_redirect_int_bf;
wire thr0_sf_kill;
wire thr0_sf_kill_d;
wire thr0_br_misp_no_match_f;
wire thr0_kill_after_invalidation;
wire thr0_kill_after_invalidation_d;
wire thr0_exception_valid_kill_c2;
wire ftu_thr1_redirect_int_bf;
wire thr1_sf_kill;
wire thr1_sf_kill_d;
wire thr1_br_misp_no_match_f;
wire thr1_kill_after_invalidation;
wire thr1_kill_after_invalidation_d;
wire thr1_exception_valid_kill_c2;
wire ftu_thr2_redirect_int_bf;
wire thr2_sf_kill;
wire thr2_sf_kill_d;
wire thr2_br_misp_no_match_f;
wire thr2_kill_after_invalidation;
wire thr2_kill_after_invalidation_d;
wire thr2_exception_valid_kill_c2;
wire ftu_thr3_redirect_int_bf;
wire thr3_sf_kill;
wire thr3_sf_kill_d;
wire thr3_br_misp_no_match_f;
wire thr3_kill_after_invalidation;
wire thr3_kill_after_invalidation_d;
wire thr3_exception_valid_kill_c2;
wire ftu_thr4_redirect_int_bf;
wire thr4_sf_kill;
wire thr4_sf_kill_d;
wire thr4_br_misp_no_match_f;
wire thr4_kill_after_invalidation;
wire thr4_kill_after_invalidation_d;
wire thr4_exception_valid_kill_c2;
wire ftu_thr5_redirect_int_bf;
wire thr5_sf_kill;
wire thr5_sf_kill_d;
wire thr5_br_misp_no_match_f;
wire thr5_kill_after_invalidation;
wire thr5_kill_after_invalidation_d;
wire thr5_exception_valid_kill_c2;
wire ftu_thr6_redirect_int_bf;
wire thr6_sf_kill;
wire thr6_sf_kill_d;
wire thr6_br_misp_no_match_f;
wire thr6_kill_after_invalidation;
wire thr6_kill_after_invalidation_d;
wire thr6_exception_valid_kill_c2;
wire ftu_thr7_redirect_int_bf;
wire thr7_sf_kill;
wire thr7_sf_kill_d;
wire thr7_br_misp_no_match_f;
wire thr7_kill_after_invalidation;
wire thr7_kill_after_invalidation_d;
wire thr7_exception_valid_kill_c2;
wire next_br_misp_match;
wire next_br_misp_match_int;
wire kill_fetch_vc_reg_scanin;
wire kill_fetch_vc_reg_scanout;
wire kill_fetch_cv_c_unq;
wire kill_fetch_vc_2_reg_scanin;
wire kill_fetch_vc_2_reg_scanout;
wire kill_fetch_cv_c_unq2;
wire exception_valid_kill_in;
wire exception_valid_c;
wire exception_valid_kill_reg_scanin;
wire exception_valid_kill_reg_scanout;
wire exception_valid_kill_c;
wire exception_valid_kill1_reg_scanin;
wire exception_valid_kill1_reg_scanout;
wire exception_valid_kill_int_c;
wire agc_kill_fetch_cv_int1_c;
wire agc_kill_fetch_cv_int2_c;
wire thr0_exception_valid_kill_in;
wire thr1_exception_valid_kill_in;
wire thr2_exception_valid_kill_in;
wire thr3_exception_valid_kill_in;
wire thr4_exception_valid_kill_in;
wire thr5_exception_valid_kill_in;
wire thr6_exception_valid_kill_in;
wire thr7_exception_valid_kill_in;
wire thrx_exception_valid_kill_reg_scanin;
wire thrx_exception_valid_kill_reg_scanout;
wire thr7_exception_valid_kill_c2_in;
wire thr6_exception_valid_kill_c2_in;
wire thr5_exception_valid_kill_c2_in;
wire thr4_exception_valid_kill_c2_in;
wire thr3_exception_valid_kill_c2_in;
wire thr2_exception_valid_kill_c2_in;
wire thr1_exception_valid_kill_c2_in;
wire thr0_exception_valid_kill_c2_in;
wire thr7_exception_valid_kill_c;
wire thr6_exception_valid_kill_c;
wire thr5_exception_valid_kill_c;
wire thr4_exception_valid_kill_c;
wire thr3_exception_valid_kill_c;
wire thr2_exception_valid_kill_c;
wire thr1_exception_valid_kill_c;
wire thr0_exception_valid_kill_c;
wire thrx_redirect_reg_scanin;
wire thrx_redirect_reg_scanout;
wire ftu_thr7_redirect_part_bf;
wire ftu_thr6_redirect_part_bf;
wire ftu_thr5_redirect_part_bf;
wire ftu_thr4_redirect_part_bf;
wire ftu_thr3_redirect_part_bf;
wire ftu_thr2_redirect_part_bf;
wire ftu_thr1_redirect_part_bf;
wire ftu_thr0_redirect_part_bf;
wire thrx_ibu_redirect_reg_scanin;
wire thrx_ibu_redirect_reg_scanout;
wire [7:0] to_ibu_redirect_part_bf;
wire single_thread_active;
wire [7:0] other_flushes_in;
wire other_flushes_reg_scanin;
wire other_flushes_reg_scanout;
wire [7:0] other_flushes_del;
wire [7:0] redirect_ibu_int_bf;
wire [7:0] next_by_pass_sel_bbf;
wire cmu_fill_byp_thread_reg_scanin;
wire cmu_fill_byp_thread_reg_scanout;
wire by_pass_thread_bf_reg_scanin;
wire by_pass_thread_bf_reg_scanout;
wire [7:0] by_pass_thread_bf;
wire by_pass_sel_f_reg_scanin;
wire by_pass_sel_f_reg_scanout;
wire by_pass_sel_c_reg_scanin;
wire by_pass_sel_c_reg_scanout;
wire [7:0] by_pass_thread_c;
wire by_pass_thread_f_reg_scanin;
wire by_pass_thread_f_reg_scanout;
wire [7:0] by_pass_thread_f;
wire fetchalid_cnq_reg_scanin;
wire fetchalid_cnq_reg_scanout;
wire agc_fetch_v_c_unq;
wire fetch_v_dup_c_reg_scanin;
wire fetch_v_dup_c_reg_scanout;
wire agc_fetch_v_c_dup_unq;
wire prev_by_pass_at_cycle_1;
wire agc_cycle_2_by_pass_ok_f;
wire agc_cycle_3_by_pass_ok_c;
wire prev_by_pass_at_cycle_2;
wire agc_cycle_3_by_pass_ok_f;
wire agc_fetch_v_int_c;
wire agc_fetch_v_c;
wire agc_cycle_2_by_pass_ok_bf;
wire agc_cycle_3_by_pass_ok_bf;
wire cycle_2_by_pass_f_reg_scanin;
wire cycle_2_by_pass_f_reg_scanout;
wire cycle_3_by_pass_f_reg_scanin;
wire cycle_3_by_pass_f_reg_scanout;
wire cycle_3_by_pass_c_reg_scanin;
wire cycle_3_by_pass_c_reg_scanout;
wire byp_valid_in;
wire thr0_kill_by_pass_bbf;
wire thr1_kill_by_pass_bbf;
wire thr2_kill_by_pass_bbf;
wire thr3_kill_by_pass_bbf;
wire thr4_kill_by_pass_bbf;
wire thr5_kill_by_pass_bbf;
wire thr6_kill_by_pass_bbf;
wire thr7_kill_by_pass_bbf;
wire cmu_any_data_ready_reg_scanin;
wire cmu_any_data_ready_reg_scanout;
wire agc_byp_valid;
wire tsm_thrx_kill_by_pass_reg_scanin;
wire tsm_thrx_kill_by_pass_reg_scanout;
wire thr7_kill_by_pass_bf;
wire thr6_kill_by_pass_bf;
wire thr5_kill_by_pass_bf;
wire thr4_kill_by_pass_bf;
wire thr3_kill_by_pass_bf;
wire thr2_kill_by_pass_bf;
wire thr1_kill_by_pass_bf;
wire thr0_kill_by_pass_bf;
wire kill2_by_pass_bf;
wire bypass_thread_killed;
wire next_by_pass_f_valid;
wire by_pass_v_f_reg_scanin;
wire by_pass_v_f_reg_scanout;
wire agc_by_pass_valid_unq_f;
wire bypass_thread_redirected_p_f;
wire bypass_thread_redirected_f;
wire agc_sel_by_pass_cycle_2_f;
wire agc_sel_by_pass_cycle_3_c;
wire agc_by_pass_valid_c;
wire next_by_pass_c_valid;
wire by_pass_v_c_reg_scanin;
wire by_pass_v_c_reg_scanout;
wire agc_sel_by_pass_cycle_2_int_f;
wire agc_sel_by_pass_cycle_3_int_c;
wire [2:0] agc_bypass_selects;
wire [3:0] by_pass_valid_instr_bf;
wire by_pass_instr_v_f_reg_scanin;
wire by_pass_instr_v_f_reg_scanout;
wire [3:0] by_pass_valid_instr_f;
wire by_pass_instr_v_c_reg_scanin;
wire by_pass_instr_v_c_reg_scanout;
wire [3:0] by_pass_valid_instr_c;
wire instr_0_v_q_c;
wire instr_1_v_q_c;
wire instr_2_v_q_c;
wire instr_3_v_q_c;
wire bus_3_is_first_in;
wire bus_2_is_first_in;
wire bus_1_is_first_in;
wire bus_0_is_first_in;
wire bus_first_reg_scanin;
wire bus_first_reg_scanout;
wire exception_valid_int_c;
wire thr0_byp_bf_kill_sf;
wire thr0_byp_f_kill_sf;
wire thr0_byp_c_kill_sf;
wire thr0_instr_kill_sf;
wire thr1_byp_bf_kill_sf;
wire thr1_byp_f_kill_sf;
wire thr1_byp_c_kill_sf;
wire thr1_instr_kill_sf;
wire thr2_byp_bf_kill_sf;
wire thr2_byp_f_kill_sf;
wire thr2_byp_c_kill_sf;
wire thr2_instr_kill_sf;
wire thr3_byp_bf_kill_sf;
wire thr3_byp_f_kill_sf;
wire thr3_byp_c_kill_sf;
wire thr3_instr_kill_sf;
wire thr4_byp_bf_kill_sf;
wire thr4_byp_f_kill_sf;
wire thr4_byp_c_kill_sf;
wire thr4_instr_kill_sf;
wire thr5_byp_bf_kill_sf;
wire thr5_byp_f_kill_sf;
wire thr5_byp_c_kill_sf;
wire thr5_instr_kill_sf;
wire thr6_byp_bf_kill_sf;
wire thr6_byp_f_kill_sf;
wire thr6_byp_c_kill_sf;
wire thr6_instr_kill_sf;
wire thr7_byp_bf_kill_sf;
wire thr7_byp_f_kill_sf;
wire thr7_byp_c_kill_sf;
wire thr7_instr_kill_sf;
wire thrx_sf_kill_reg_scanin;
wire thrx_sf_kill_reg_scanout;
wire any_instr_v_q_c;
wire mbist_data_in_reg_scanin;
wire mbist_data_in_reg_scanout;
wire [2:0] mbi_bist_way_bf;
wire [2:0] mbi_bist_word_en_bf;
wire mbi_run_bf;
wire mbi_icv_write_en_bf;
wire [7:0] mbi_wdata_bf;
wire agc_data_ready_bf;
wire [2:0] agc_cmu_fill_wrway_bf;
wire cmu_fill_wrway_reg_scanin;
wire cmu_fill_wrway_reg_scanout;
wire asi_mbist_way_f_reg_scanin;
wire asi_mbist_way_f_reg_scanout;
wire [2:0] agc_asi_mbist_way_f;
wire [7:0] next_wrway_bbf;
wire [1:0] vl_data;
wire vl_data_reg_scanin;
wire vl_data_reg_scanout;
wire itlb_valid_reg_scanin;
wire itlb_valid_reg_scanout;
wire [7:0] itlb_valid_c;
wire itlb_valid_dupl_reg_scanin;
wire itlb_valid_dupl_reg_scanout;
wire [7:0] itlb_valid_dupl_c;
wire va_hole_excp_extra;
wire next_va_hole_excp;
wire agc_itb_bypass_f;
wire va_hole_excp_c_reg_scanin;
wire va_hole_excp_c_reg_scanout;
wire va_hole_excp_c;
wire inv_ack;
wire [7:0] next_inv_way_bbf;
wire [7:0] next_inv_way1_bbf;
wire [7:0] asi_way_dec_bf;
wire addr_bit_5_bf_reg_scanin;
wire addr_bit_5_bf_reg_scanout;
wire phys_addr_bit_5_bf;
wire inv_bit_5_bf_reg_scanin;
wire inv_bit_5_bf_reg_scanout;
wire inv_addr_bit_5_bf;
wire inv_or_phys_addr_bit_5_bf;
wire agc_inv_line_bf;
wire wrway_bf_reg_scanin;
wire wrway_bf_reg_scanout;
wire [7:0] wrway_bf;
wire inv_way_bf_reg_scanin;
wire inv_way_bf_reg_scanout;
wire [7:0] inv_way_bf;
wire inv_way1_bf_reg_scanin;
wire inv_way1_bf_reg_scanout;
wire [7:0] inv_way1_bf;
wire [7:0] inv_or_wrway_bf;
wire [7:0] way1_inv;
wire agc_evic_line_bf;
wire next_inv_line;
wire inv_line_bf_reg_scanin;
wire inv_line_bf_reg_scanout;
wire evic_line_bf_reg_scanin;
wire evic_line_bf_reg_scanout;
wire [1:0] icv_wrdata;
wire next_data_ready_bbf;
wire data_ready_bf_reg_scanin;
wire data_ready_bf_reg_scanout;
wire l2_cache_miss_in_reg_scanin;
wire l2_cache_miss_in_reg_scanout;
wire l1_miss_in;
wire l2_miss_in;
wire l2_err_corr_in;
wire l2_err_ucorr_in;
wire l2_err_ndata_in;
wire l1_cache_1_miss;
wire l2_cache_1_miss;
wire l2_err_corr_1_ff;
wire l2_err_ucorr_1_ff;
wire l2_err_ndata_1_ff;
wire l2_cache_miss_1_reg_scanin;
wire l2_cache_miss_1_reg_scanout;
wire l1_cache_2_miss;
wire l2_cache_2_miss;
wire l2_err_corr_2_ff;
wire l2_err_ucorr_2_ff;
wire l2_err_ndata_2_ff;
wire l2_cache_miss_2_reg_scanin;
wire l2_cache_miss_2_reg_scanout;
wire l1_cache_3_miss;
wire l2_cache_3_miss;
wire l2_err_corr_3_ff;
wire l2_err_ucorr_3_ff;
wire l2_err_ndata_3_ff;
wire precise_en_bp_in;
wire cerer_icl2c_ff;
wire cerer_icl2u_ff;
wire cerer_icl2nd_ff;
wire l2_ucorr_err_byp_1;
wire l2_ucorr_err_byp_2;
wire l2_ucorr_err_byp_3;
wire l2_ucorr_err;
wire l2_corr_err_byp_1;
wire l2_corr_err_byp_2;
wire l2_corr_err_byp_3;
wire l2_corr_err;
wire l2_ndata_err_byp_1;
wire l2_ndata_err_byp_2;
wire l2_ndata_err_byp_3;
wire l2_ndata_err;
wire l2_cache_miss_byp_1;
wire l2_cache_miss_byp_2;
wire l2_cache_miss_byp_3;
wire l2_cache_miss;
wire l1_cache_miss;
wire itb_cmiss_c;
wire agc_ic_disable_thr_c;
wire itb_itb_miss_c;
wire agc_itb_cmiss_c_q;
wire ic_valid_err_no_priority;
wire itb_itb_acc_viol_c;
wire invalidation_req_c;
wire itb_tag_perr;
wire cerer_ittp_ff;
wire cerer_itdp_ff;
wire agc_tag_perror_c;
wire cerer_ictp_ff;
wire itb_mhit_en_c;
wire agc_qualify_cmiss;
wire agc_thrx_un_cacheable;
wire bus_0_valid_f;
wire bus_1_valid_f;
wire bus_2_valid_f;
wire bus_3_valid_f;
wire ic_instr_v_reg_scanin;
wire ic_instr_v_reg_scanout;
wire bus_3_valid_c;
wire bus_2_valid_c;
wire bus_1_valid_c;
wire bus_0_valid_c;
wire next_any_instr_v_c;
wire any_instr_v_c_reg_scanin;
wire any_instr_v_c_reg_scanout;
wire any_instr_v_c;
wire agc_itb_itb_miss_c_q;
wire agc_itb_itb_miss_c_int_q;
wire itb_itb_acc_viol_no_priority;
wire va_hole_exception_c;
wire nfo_tlb_exception_no_priority;
wire tag_perror_no_priority;
wire itb_mhit_no_priority;
wire tte_tag_parity_no_priority;
wire tag_multiple_hit_no_priority;
wire tte_data_parity_no_priority;
wire itb_itb_acc_viol_int_c;
wire va_hole_exception_int_c;
wire hpstate_reg_scanin;
wire hpstate_reg_scanout;
wire [7:0] hpstate_hpriv_ff;
wire [7:0] pstate_priv_ff;
wire next_priv_state;
wire priv_state_c_reg_scanin;
wire priv_state_c_reg_scanout;
wire agc_priv_state_c;
wire tlb_parity_reg_scanin;
wire tlb_parity_reg_scanout;
wire prty_256m_c;
wire prty_4m_c;
wire prty_64k_c;
wire prty_8k_c;
wire prty_ctxt0_c;
wire prty_ctxt1_c;
wire prty_ctxt;
wire tag_parity_gen;
wire agc_itc_real_c;
wire itlb_cam_vld_c_reg_scanin;
wire itlb_cam_vld_c_reg_scanout;
wire itlb_cam_vld_c;
wire cerer_en_reg_scanin;
wire cerer_en_reg_scanout;
wire cerer_ittm_ff;
wire cerer_icvp_ff;
wire cerer_ictm_ff;
wire tte_tag_parity_en_c;
wire tte_data_parity_en_c;
wire nfo_tlb_exception;
wire ic_valid_err_c_en;
wire ic_valid_err_c;
wire tag_perror_en_c;
wire tag_multiple_hit_en;
wire ic_tag_multiple_hit;
wire agc_ic_enable_thr_c;
wire l2_ucorr_err_en;
wire l2_corr_err_en;
wire l2_ndata_err_en;
wire l2_cache_miss_no_error;
wire l2_uncorr_err_en_no_l2_miss;
wire l2_cache_miss_n_corr;
wire l2_cache_miss_n_uncorr;
wire l2_cache_miss_n_ndata;
wire agc_itc_real_c_q;
wire va_hole_exception_c_r;
wire way_sel_all_but_0;
wire way_sel_all_but_1;
wire way_sel_all_but_2;
wire way_sel_all_but_3;
wire way_sel_all_but_4;
wire way_sel_all_but_5;
wire way_sel_all_but_6;
wire way_sel_all_but_7;
wire itc_real_f_reg_scanin;
wire itc_real_f_reg_scanout;
wire agc_itc_real_f;
wire itc_real_c_reg_scanin;
wire itc_real_c_reg_scanout;
wire cntx_sel_reg_scanin;
wire cntx_sel_reg_scanout;
wire lsu_no_icm_reg_scanin;
wire lsu_no_icm_reg_scanout;
wire ic_enable_reg_scanin;
wire ic_enable_reg_scanout;
wire [7:0] agc_icache_enable;
wire next_ic_enable_thr_c;
wire thr_c_ic_enable_reg_scanin;
wire thr_c_ic_enable_reg_scanout;
wire next_ic_enable_thr_c_l;
wire thr_c_ic_disable_reg_scanin;
wire thr_c_ic_disable_reg_scanout;
wire ic_valid_err_unq;
wire dff_8b_prty_7_scanin;
wire dff_8b_prty_7_scanout;
wire [3:0] w7_8b_parity_c;
wire [3:0] w6_8b_parity_c;
wire dff_8b_prty_5_scanin;
wire dff_8b_prty_5_scanout;
wire [3:0] w5_8b_parity_c;
wire [3:0] w4_8b_parity_c;
wire dff_8b_prty_3_scanin;
wire dff_8b_prty_3_scanout;
wire [3:0] w3_8b_parity_c;
wire [3:0] w2_8b_parity_c;
wire dff_8b_prty_1_scanin;
wire dff_8b_prty_1_scanout;
wire [3:0] w1_8b_parity_c;
wire [3:0] w0_8b_parity_c;
wire err_tag_w0_parity_c;
wire err_tag_w1_parity_c;
wire err_tag_w2_parity_c;
wire err_tag_w3_parity_c;
wire err_tag_w4_parity_c;
wire err_tag_w5_parity_c;
wire err_tag_w6_parity_c;
wire err_tag_w7_parity_c;
wire [7:0] agc_tag_pe_c;
wire err_excp_set;
wire [5:3] asi_mbist_addr_bf;
wire [7:0] word_en_asi;
wire asi_sel_word_reg_scanin;
wire asi_sel_word_reg_scanout;
wire [4:3] asi_mbist_addr_f;
wire [4:3] asi_mbist_addr_c;
wire thr0_valid_exception_p;
wire thr1_valid_exception_p;
wire thr2_valid_exception_p;
wire thr3_valid_exception_p;
wire thr4_valid_exception_p;
wire thr5_valid_exception_p;
wire thr6_valid_exception_p;
wire thr7_valid_exception_p;
wire thr0_way_write_en;
wire thr1_way_write_en;
wire thr2_way_write_en;
wire thr3_way_write_en;
wire thr4_way_write_en;
wire thr5_way_write_en;
wire thr6_way_write_en;
wire thr7_way_write_en;
wire [2:0] error_way_muxed_p;
wire ic_valid_err_p_en;
wire [2:0] valid_err_way_p;
wire tag_perror_en_p;
wire [2:0] perr_way_p;
wire tag_multiple_hit_en_p;
wire [2:0] fetch_way_p;
wire [2:0] thr0_excp_way_in;
wire [2:0] ftu_thr0_excp_way;
wire [2:0] thr1_excp_way_in;
wire [2:0] ftu_thr1_excp_way;
wire [2:0] thr2_excp_way_in;
wire [2:0] ftu_thr2_excp_way;
wire [2:0] thr3_excp_way_in;
wire [2:0] ftu_thr3_excp_way;
wire [2:0] thr4_excp_way_in;
wire [2:0] ftu_thr4_excp_way;
wire [2:0] thr5_excp_way_in;
wire [2:0] ftu_thr5_excp_way;
wire [2:0] thr6_excp_way_in;
wire [2:0] ftu_thr6_excp_way;
wire [2:0] thr7_excp_way_in;
wire [2:0] ftu_thr7_excp_way;
wire [2:0] fetch_way_p_in;
wire fetch_way_p_reg_scanin;
wire fetch_way_p_reg_scanout;
wire [7:0] valid_err_way;
wire [2:0] valid_err_way_p_in;
wire valid_err_way_p_reg_scanin;
wire valid_err_way_p_reg_scanout;
wire [2:0] perr_way_p_in;
wire tag_pe_way_scanin;
wire tag_pe_way_scanout;
wire tag_perror_en_reg_scanin;
wire tag_perror_en_reg_scanout;
wire way_thr0_keep_reg_scanin;
wire way_thr0_keep_reg_scanout;
wire way_thr1_keep_reg_scanin;
wire way_thr1_keep_reg_scanout;
wire way_thr2_keep_reg_scanin;
wire way_thr2_keep_reg_scanout;
wire way_thr3_keep_reg_scanin;
wire way_thr3_keep_reg_scanout;
wire way_thr4_keep_reg_scanin;
wire way_thr4_keep_reg_scanout;
wire way_thr5_keep_reg_scanin;
wire way_thr5_keep_reg_scanout;
wire way_thr6_keep_reg_scanin;
wire way_thr6_keep_reg_scanout;
wire way_thr7_keep_reg_scanin;
wire way_thr7_keep_reg_scanout;
wire excp_way_valid_in;
wire excp_way_d_reg_scanin;
wire excp_way_d_reg_scanout;
wire [2:0] excp_tid_d_in;
wire excp_tid_d_reg_scanin;
wire excp_tid_d_reg_scanout;
wire next_itlb_busy;
wire itlb_busy_reg_scanin;
wire itlb_busy_reg_scanout;
wire itlb_busy_bf;
wire itlb_busy_f_reg_scanin;
wire itlb_busy_f_reg_scanout;
wire itlb_busy_f;
wire ith_det_req_bbf;
wire ith_det_req_ff;
wire ith_det_req_ff_reg_scanin;
wire ith_det_req_ff_reg_scanout;
wire [7:0] next_enabled_thread;
wire enabled_thr_reg_dup_scanin;
wire enabled_thr_reg_dup_scanout;
wire [7:0] enabled_threads_dup;
wire next_single_thread_active;
wire single_thread_active_reg_scanin;
wire single_thread_active_reg_scanout;
wire [7:0] reset_invalidation_req;
wire [7:0] new_invalidation_req;
wire [7:0] set_invalidation_req;
wire [7:0] next_invalidation_req;
wire [7:0] invalidation_req_ff;
wire invalidation_req_reg_scanin;
wire invalidation_req_reg_scanout;
wire invalidation_req_dup_reg_scanin;
wire invalidation_req_dup_reg_scanout;
wire invalidation_req_c_reg_scanin;
wire invalidation_req_c_reg_scanout;
wire thrx_inv_kill_reg_scanin;
wire thrx_inv_kill_reg_scanout;
wire cms_itb_cmiss_c_q;
wire spares_scanin;
wire spares_scanout;
wire mbist_output_scanin;
wire mbist_output_scanout;
wire itb_cam_hit_c_1;
wire tlb_context0_hit_1;
wire itb_itb_mhit_c_1;
wire se;
 

input tcu_se_scancollar_out ;
input tcu_scan_en ;
input l2clk;
input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;

input       tlu_trap_pc_0_valid    ;
input [1:0] tlu_retry    ;
input [7:0] tlu_ceter_pscce    ;

input       tlu_trap_pc_1_valid    ;
input [1:0] tlu_ifu_invalidate     ;

input [1:0] tlu_trap_0_tid    ;
input [1:0] tlu_trap_1_tid    ;

input [7:0]  spc_core_running_status;

input [7:0]  mbi_wdata;
input [8:6]  mbi_addr;
input [2:0]  mbi_cmpsel;
input        mbi_run;
input        mbi_icv_write_en;


input [7:0] tlu_flush_ifu    ;
input [7:0] tlu_ifu_hpstate_hpriv    ;
input [7:0] tlu_ifu_pstate_priv    ;

input         tlu_cerer_ittp         ;
input         tlu_cerer_itdp         ;
input         tlu_cerer_ittm         ;
input         tlu_cerer_icl2c     ;
input         tlu_cerer_icl2u     ; 
input         tlu_cerer_icl2nd    ; 
input         tlu_cerer_icvp         ;
input         tlu_cerer_ictp         ;
input         tlu_cerer_ictm         ;

input       tlb_nfo           ;
input       agd_va_hole_excp_f;
input [7:0] agd_itlb_valid_f     ;
input [7:0] agd_itlb_valid_dupl_f     ;

input       asi_ith_det_req        ;
input [1:0] asi_vl_arr_data        ; 
input       ftp_asi_tg_wr_req_hold ;
input       ftp_itlb_cam_vld_f ;
input [6:3] asi_addr_bf     ;
input [2:0] asi_way_bf     ;
input [47:2] ifu_agd_pc_f   ;
input [4:2] agd_thr0_pc_4_2_f     ;
input [4:2] agd_thr1_pc_4_2_f     ;
input [4:2] agd_thr2_pc_4_2_f     ;
input [4:2] agd_thr3_pc_4_2_f     ;
input [4:2] agd_thr4_pc_4_2_f     ;
input [4:2] agd_thr5_pc_4_2_f     ;
input [4:2] agd_thr6_pc_4_2_f     ;
input [4:2] agd_thr7_pc_4_2_f     ;

input  [1:0] dec_load_flush_w;     


input        itc_bypass_bf   ;
input        itc_real_bf   ;
input        itc_demap_next   ;

input [7:0] ftp_curr_fetch_thr_f    ; 
input [7:0] ftp_fetch_thr_q_f   ;



input       ftp_fill_req_q_bf            ;
input       ftp_any_thr_clken;

input [3:0] err_w0_8b_parity_f;
input [3:0] err_w1_8b_parity_f;
input [3:0] err_w2_8b_parity_f;
input [3:0] err_w3_8b_parity_f;
input [3:0] err_w4_8b_parity_f;
input [3:0] err_w5_8b_parity_f;
input [3:0] err_w6_8b_parity_f;
input [3:0] err_w7_8b_parity_f;


input	    tsm_thr0_ignore_by_pass;
input	    tsm_thr1_ignore_by_pass;
input	    tsm_thr2_ignore_by_pass;
input	    tsm_thr3_ignore_by_pass;
input	    tsm_thr4_ignore_by_pass;
input	    tsm_thr5_ignore_by_pass;
input       tsm_thr6_ignore_by_pass;
input       tsm_thr7_ignore_by_pass;

input       tsm_thr0_no_new_miss;
input       tsm_thr1_no_new_miss;
input       tsm_thr2_no_new_miss;
input       tsm_thr3_no_new_miss;
input       tsm_thr4_no_new_miss;
input       tsm_thr5_no_new_miss;
input       tsm_thr6_no_new_miss;
input       tsm_thr7_no_new_miss;

input       cmu_any_data_ready     ;   
input       cmu_any_un_cacheable    ;



input [1:0] cmu_l2_err     ;
input       cmu_l2miss     ;

input   cmu_thr0_data_ready;
input   cmu_thr1_data_ready;
input   cmu_thr2_data_ready;
input   cmu_thr3_data_ready;
input   cmu_thr4_data_ready;
input   cmu_thr5_data_ready;
input   cmu_thr6_data_ready;
input   cmu_thr7_data_ready;


input [2:0] cmu_fill_wrway            ;
input       cmu_icache_invalidate;
input       cmu_evic_invalidate;
input [2:0] cmu_icache_invalidate_way;
input [2:0] cmu_icache_inv_way1;
      
input       fill_paddr_bit_5    ;
input       inv_paddr_bit_5    ;
input       ftu_paddr_unq_39   ;
input [3:0] cmu_instr_v            ;



input [1:0] dec_br_taken_e ;
input [1:0] dec_valid_e;
input [1:0] ftp_tid0_e;
input [1:0] ftp_tid1_e;


input       ftp_fetch_v_f;
input       itb_chit_c;
input       itb_cam_hit_c;
input       itb_tte_p_c;
input       itb_itb_mhit_c;
input       itb_tte_tag_parity;
input       itb_tte_data_parity;
input [7:0] itb_icd_waysel_c;


input  [2:0]   lsu_ifu_tid_w;
input          lsu_ifu_wr_p0ctxt;
input          lsu_ifu_wr_p1ctxt;
input  [7:0]   lsu_ifu_no_miss;

input  [7:0]   lsu_ic_enable;
input  [7:0]   cmu_inval_ack;
input          ftp_asi_mbist_access_bf;

input		itd_prty_256m;
input		itd_prty_4m;
input		itd_prty_64k;
input		itd_prty_8k;
input		itd_prty_ctxt0;
input		itd_prty_ctxt1;
input [2:0]     tlb_pgsize;
input           tlb_context0_hit;




output [7:0] ftu_buffer_wr_en_f;


output       agc_itb_tag_perr_c ;

output [1:0] agc_vl_data_c;

output [3:0] agc_asi_sel_word_c;
output [7:0] agc_sel_tg_data_f;
output [7:0] agc_word_en_bf;
output [7:0] agc_by_pass_update_lru_bf;
output [7:0] agc_invalidation_req_ff;
output       agc_any_invalidation_req_f ;
output       agc_thr0_sf_valid_f ;
output       agc_thr1_sf_valid_f ;
output       agc_thr2_sf_valid_f ;
output       agc_thr3_sf_valid_f ;
output       agc_thr4_sf_valid_f ;
output       agc_thr5_sf_valid_f ;
output       agc_thr6_sf_valid_f ;
output       agc_thr7_sf_valid_f ;


output       agc_thr0_micro_flush_unq_c ;
output       agc_thr1_micro_flush_unq_c ;
output       agc_thr2_micro_flush_unq_c ;
output       agc_thr3_micro_flush_unq_c ;
output       agc_thr4_micro_flush_unq_c ;
output       agc_thr5_micro_flush_unq_c ;
output       agc_thr6_micro_flush_unq_c ;
output       agc_thr7_micro_flush_unq_c ;



output       agc_thr0_err_detect_c;
output       agc_thr1_err_detect_c;
output       agc_thr2_err_detect_c;
output       agc_thr3_err_detect_c;
output       agc_thr4_err_detect_c;
output       agc_thr5_err_detect_c;
output       agc_thr6_err_detect_c;
output       agc_thr7_err_detect_c;

output       agc_thr0_cmiss_stm_c;
output       agc_thr1_cmiss_stm_c;
output       agc_thr2_cmiss_stm_c;
output       agc_thr3_cmiss_stm_c;
output       agc_thr4_cmiss_stm_c;
output       agc_thr5_cmiss_stm_c;
output       agc_thr6_cmiss_stm_c;
output       agc_thr7_cmiss_stm_c;


output       ftu_agc_thr0_cmiss_c; 
output       ftu_agc_thr1_cmiss_c; 
output       ftu_agc_thr2_cmiss_c; 
output       ftu_agc_thr3_cmiss_c; 
output       ftu_agc_thr4_cmiss_c; 
output       ftu_agc_thr5_cmiss_c; 
output       ftu_agc_thr6_cmiss_c; 
output       ftu_agc_thr7_cmiss_c; 

output       ftu_thr0_inv_req_c ;
output       ftu_thr1_inv_req_c ;
output       ftu_thr2_inv_req_c ;
output       ftu_thr3_inv_req_c ;
output       ftu_thr4_inv_req_c ;
output       ftu_thr5_inv_req_c ;
output       ftu_thr6_inv_req_c ;
output       ftu_thr7_inv_req_c ;

output [7:0] ifu_ibuffer_write_c;
output [7:0] ftu_fetch_thr_c;
output       ftu_instr_sf_valid_c;

output [2:0] ftu_excp_way_d;
output [2:0] ftu_excp_tid_d;
output       ftu_excp_way_valid_d;


output [2:0] agc_fill_wrway_bf;
output [3:0] agc_sel_inv_index ;

output       agc_thr0_lsu_no_ic_miss;
output       agc_thr1_lsu_no_ic_miss;
output       agc_thr2_lsu_no_ic_miss;
output       agc_thr3_lsu_no_ic_miss;
output       agc_thr4_lsu_no_ic_miss;
output       agc_thr5_lsu_no_ic_miss;
output       agc_thr6_lsu_no_ic_miss;
output       agc_thr7_lsu_no_ic_miss;

output       agc_thr0_itb_miss_c;
output       agc_thr1_itb_miss_c;
output       agc_thr2_itb_miss_c;
output       agc_thr3_itb_miss_c;
output       agc_thr4_itb_miss_c;
output       agc_thr5_itb_miss_c;
output       agc_thr6_itb_miss_c;
output       agc_thr7_itb_miss_c;

output       ftu_ic_no_err_c   ;            // Data being by_passed does not have an error 

output       ftu_bus_0_is_first ;           // bus 0 contains first instr
output       ftu_bus_1_is_first ;           // bus 1 contains first instr
output       ftu_bus_2_is_first ;           // bus 2 contains first instr
output       ftu_bus_3_is_first ;           // bus 3 contains first instr

output [3:0] ftu_instr_valid_c;
output       ftu_exception_valid_c ;

output [4:0] ftu_instr_exceptions_c;

            
output [3:0] agc_thr0_pcf_sel_bf;
output [3:0] agc_thr1_pcf_sel_bf;
output [3:0] agc_thr2_pcf_sel_bf;
output [3:0] agc_thr3_pcf_sel_bf;
output [3:0] agc_thr4_pcf_sel_bf;
output [3:0] agc_thr5_pcf_sel_bf;
output [3:0] agc_thr6_pcf_sel_bf;
output [3:0] agc_thr7_pcf_sel_bf;

output [1:0] agc_thr0_pcf_sel_last_bf;
output [1:0] agc_thr1_pcf_sel_last_bf;
output [1:0] agc_thr2_pcf_sel_last_bf;
output [1:0] agc_thr3_pcf_sel_last_bf;
output [1:0] agc_thr4_pcf_sel_last_bf;
output [1:0] agc_thr5_pcf_sel_last_bf;
output [1:0] agc_thr6_pcf_sel_last_bf;
output [1:0] agc_thr7_pcf_sel_last_bf;
            

output        agc_icv_wr_req_bf;    
output [31:0] agc_icv_wrdata_bf;    
output [31:0] agc_icv_wren_bf;     

            



 

output       ftu_thr0_redirect_bf;
output       ftu_thr1_redirect_bf;
output       ftu_thr2_redirect_bf;
output       ftu_thr3_redirect_bf;
output       ftu_thr4_redirect_bf;
output       ftu_thr5_redirect_bf;
output       ftu_thr6_redirect_bf;
output       ftu_thr7_redirect_bf;

output [7:0] ftu_ibu_redirect_bf  ;

output       agc_thr0_tlu_redirect_bf;
output       agc_thr1_tlu_redirect_bf;
output       agc_thr2_tlu_redirect_bf;
output       agc_thr3_tlu_redirect_bf;
output       agc_thr4_tlu_redirect_bf;
output       agc_thr5_tlu_redirect_bf;
output       agc_thr6_tlu_redirect_bf;
output       agc_thr7_tlu_redirect_bf;






output       agc_kill_fetch_cv_c;

output [3:0] agc_pc_sel_for_c ;
output [2:0] agc_instr_bp_sel_c ;

output       agc_thr0_byp_incr_bit5 ;
output       agc_thr1_byp_incr_bit5 ;
output       agc_thr2_byp_incr_bit5 ;
output       agc_thr3_byp_incr_bit5 ;
output       agc_thr4_byp_incr_bit5 ;
output       agc_thr5_byp_incr_bit5 ;
output       agc_thr6_byp_incr_bit5 ;
output       agc_thr7_byp_incr_bit5 ;

output [4:2] agc_thr0_byp_pc_update_bf ;
output [4:2] agc_thr1_byp_pc_update_bf ;
output [4:2] agc_thr2_byp_pc_update_bf ;
output [4:2] agc_thr3_byp_pc_update_bf ;
output [4:2] agc_thr4_byp_pc_update_bf ;
output [4:2] agc_thr5_byp_pc_update_bf ;
output [4:2] agc_thr6_byp_pc_update_bf ;
output [4:2] agc_thr7_byp_pc_update_bf ;

output  [1:0]    agc_thr0_cntx_0_sel;
output  [1:0]    agc_thr0_cntx_1_sel;
output  [1:0]    agc_thr1_cntx_0_sel;
output  [1:0]    agc_thr1_cntx_1_sel;
output  [1:0]    agc_thr2_cntx_0_sel;
output  [1:0]    agc_thr2_cntx_1_sel;
output  [1:0]    agc_thr3_cntx_0_sel;
output  [1:0]    agc_thr3_cntx_1_sel;
output  [1:0]    agc_thr4_cntx_0_sel;
output  [1:0]    agc_thr4_cntx_1_sel;
output  [1:0]    agc_thr5_cntx_0_sel;
output  [1:0]    agc_thr5_cntx_1_sel;
output  [1:0]    agc_thr6_cntx_0_sel;
output  [1:0]    agc_thr6_cntx_1_sel;
output  [1:0]    agc_thr7_cntx_0_sel;
output  [1:0]    agc_thr7_cntx_1_sel;

output           agc_thr0_cntx_0_sel_ff;
output           agc_thr0_cntx_1_sel_ff;

output           agc_thr1_cntx_0_sel_ff;
output           agc_thr1_cntx_1_sel_ff;

output           agc_thr2_cntx_0_sel_ff;
output           agc_thr2_cntx_1_sel_ff;

output           agc_thr3_cntx_0_sel_ff;
output           agc_thr3_cntx_1_sel_ff;

output           agc_thr4_cntx_0_sel_ff;
output           agc_thr4_cntx_1_sel_ff;

output           agc_thr5_cntx_0_sel_ff;
output           agc_thr5_cntx_1_sel_ff;

output           agc_thr6_cntx_0_sel_ff;
output           agc_thr6_cntx_1_sel_ff;

output           agc_thr7_cntx_0_sel_ff;
output           agc_thr7_cntx_1_sel_ff;

output		ftu_mbi_tlb_cam_hit;
output		ftu_mbi_tlb_ctxt0_hit;
output		ftu_mbi_tlb_cam_mhit;	
output   scan_out;

// renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0 ;
assign siclk = spc_aclk;
assign soclk = spc_bclk;


ifu_ftu_agc_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

ifu_ftu_agc_ctl_l1clkhdr_ctl_macro clkgen_pm (
 .l2clk(l2clk),
 .l1en (ftp_any_thr_clken ),
 .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


ifu_ftu_agc_ctl_l1clkhdr_ctl_macro scancollar_out_clkgen (
        .l2clk  (l2clk),
        .l1en   (1'b1),
        .se     (tcu_se_scancollar_out),
        .l1clk  (l1clk_out),
  .pce_ov(pce_ov),
  .stop(stop)
);





///////////////////////////////////////////////////////////////////////
// Generate selects for the second level of redirection muxing for   //
// thread_0 to thread_7                                              //
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// Second level of redirection muxing                                //
///////////////////////////////////////////////////////////////////////
assign thr0_first_level_sel_bf    = thr0_trap_pcaddr_is_valid_bf | thr0_lsu_sync_bf |
                                    thr0_replay_pc ;  
assign agc_thr0_pcf_sel_bf[0] =  thr0_replay_pc | thr0_trap_pcaddr_is_valid_bf | 
                                 thr0_lsu_sync_bf ;
assign agc_thr0_pcf_sel_bf[1] = ~thr0_first_level_sel_bf & last_fetch_was_thr0_bf ;
assign agc_thr0_pcf_sel_bf[2] = ~thr0_first_level_sel_bf & ~last_fetch_was_thr0_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[0]);
assign agc_thr0_pcf_sel_bf[3] = ~thr0_first_level_sel_bf & ~last_fetch_was_thr0_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[0]);

assign agc_thr0_pcf_sel_last_bf[0] =  thr0_br_misp_f & ~(thr0_matches_curr_f & ftp_fetch_v_f) & 
                                     ~thr0_lsu_sync_bf & ~thr0_trap_pcaddr_is_valid_bf ;  
assign agc_thr0_pcf_sel_last_bf[1] = ~agc_thr0_pcf_sel_last_bf[0]  ;  

assign agc_thr0_br_misp_f          =  thr0_br_misp_f   ;

assign thr1_first_level_sel_bf    = thr1_trap_pcaddr_is_valid_bf | thr1_lsu_sync_bf |
                                    thr1_replay_pc ;  
assign agc_thr1_pcf_sel_bf[0] =  thr1_replay_pc | thr1_trap_pcaddr_is_valid_bf | 
                                 thr1_lsu_sync_bf  ;
assign agc_thr1_pcf_sel_bf[1] = ~thr1_first_level_sel_bf & last_fetch_was_thr1_bf ;
assign agc_thr1_pcf_sel_bf[2] = ~thr1_first_level_sel_bf & ~last_fetch_was_thr1_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[1]);
assign agc_thr1_pcf_sel_bf[3] = ~thr1_first_level_sel_bf & ~last_fetch_was_thr1_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[1]);

assign agc_thr1_pcf_sel_last_bf[0] =  thr1_br_misp_f & ~(thr1_matches_curr_f & ftp_fetch_v_f) &  
                                     ~thr1_lsu_sync_bf & ~thr1_trap_pcaddr_is_valid_bf ;  
assign agc_thr1_pcf_sel_last_bf[1] = ~agc_thr1_pcf_sel_last_bf[0]  ;  

assign agc_thr1_br_misp_f          =  thr1_br_misp_f   ;

assign thr2_first_level_sel_bf    = thr2_trap_pcaddr_is_valid_bf | thr2_lsu_sync_bf |
                                    thr2_replay_pc ;  
assign agc_thr2_pcf_sel_bf[0] =  thr2_replay_pc | thr2_trap_pcaddr_is_valid_bf | 
                                 thr2_lsu_sync_bf ;
assign agc_thr2_pcf_sel_bf[1] = ~thr2_first_level_sel_bf & last_fetch_was_thr2_bf ;
assign agc_thr2_pcf_sel_bf[2] = ~thr2_first_level_sel_bf & ~last_fetch_was_thr2_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[2]);
assign agc_thr2_pcf_sel_bf[3] = ~thr2_first_level_sel_bf & ~last_fetch_was_thr2_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[2]);

assign agc_thr2_pcf_sel_last_bf[0] =  thr2_br_misp_f & ~(thr2_matches_curr_f & ftp_fetch_v_f) &   
                                     ~thr2_lsu_sync_bf & ~thr2_trap_pcaddr_is_valid_bf ;  
assign agc_thr2_pcf_sel_last_bf[1] = ~agc_thr2_pcf_sel_last_bf[0]  ;  



assign agc_thr2_br_misp_f          =  thr2_br_misp_f   ;

assign thr3_first_level_sel_bf    = thr3_trap_pcaddr_is_valid_bf | thr3_lsu_sync_bf |
                                    thr3_replay_pc ;  
assign agc_thr3_pcf_sel_bf[0] =  thr3_replay_pc | thr3_trap_pcaddr_is_valid_bf | 
                                 thr3_lsu_sync_bf ;
assign agc_thr3_pcf_sel_bf[1] = ~thr3_first_level_sel_bf & last_fetch_was_thr3_bf ;
assign agc_thr3_pcf_sel_bf[2] = ~thr3_first_level_sel_bf & ~last_fetch_was_thr3_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[3]);
assign agc_thr3_pcf_sel_bf[3] = ~thr3_first_level_sel_bf & ~last_fetch_was_thr3_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[3]);

assign agc_thr3_pcf_sel_last_bf[0] =  thr3_br_misp_f & ~(thr3_matches_curr_f & ftp_fetch_v_f) &  
                                     ~thr3_lsu_sync_bf & ~thr3_trap_pcaddr_is_valid_bf ;  
assign agc_thr3_pcf_sel_last_bf[1] = ~agc_thr3_pcf_sel_last_bf[0]  ;  

assign agc_thr3_br_misp_f          =  thr3_br_misp_f   ;

assign thr4_first_level_sel_bf    = thr4_trap_pcaddr_is_valid_bf | thr4_lsu_sync_bf |
                                    thr4_replay_pc ;  
assign agc_thr4_pcf_sel_bf[0] =  thr4_replay_pc | thr4_trap_pcaddr_is_valid_bf | 
                                 thr4_lsu_sync_bf ;
assign agc_thr4_pcf_sel_bf[1] = ~thr4_first_level_sel_bf & last_fetch_was_thr4_bf ;
assign agc_thr4_pcf_sel_bf[2] = ~thr4_first_level_sel_bf & ~last_fetch_was_thr4_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[4]);
assign agc_thr4_pcf_sel_bf[3] = ~thr4_first_level_sel_bf & ~last_fetch_was_thr4_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[4]);

assign agc_thr4_pcf_sel_last_bf[0] =  thr4_br_misp_f  & ~(thr4_matches_curr_f & ftp_fetch_v_f) &   
                                     ~thr4_lsu_sync_bf & ~thr4_trap_pcaddr_is_valid_bf ;  
assign agc_thr4_pcf_sel_last_bf[1] = ~agc_thr4_pcf_sel_last_bf[0]  ;  

assign agc_thr4_br_misp_f          =  thr4_br_misp_f   ;

assign thr5_first_level_sel_bf    = thr5_trap_pcaddr_is_valid_bf | thr5_lsu_sync_bf |
                                    thr5_replay_pc ;  
assign agc_thr5_pcf_sel_bf[0] =  thr5_replay_pc | thr5_trap_pcaddr_is_valid_bf | 
                                 thr5_lsu_sync_bf ;
assign agc_thr5_pcf_sel_bf[1] = ~thr5_first_level_sel_bf & last_fetch_was_thr5_bf ;
assign agc_thr5_pcf_sel_bf[2] = ~thr5_first_level_sel_bf & ~last_fetch_was_thr5_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[5]);
assign agc_thr5_pcf_sel_bf[3] = ~thr5_first_level_sel_bf & ~last_fetch_was_thr5_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[5]);

assign agc_thr5_pcf_sel_last_bf[0] =  thr5_br_misp_f  & ~(thr5_matches_curr_f & ftp_fetch_v_f) &   
                                     ~thr5_lsu_sync_bf & ~thr5_trap_pcaddr_is_valid_bf ;  
assign agc_thr5_pcf_sel_last_bf[1] = ~agc_thr5_pcf_sel_last_bf[0]  ;  

assign agc_thr5_br_misp_f          =  thr5_br_misp_f   ;

assign thr6_first_level_sel_bf    = thr6_trap_pcaddr_is_valid_bf | thr6_lsu_sync_bf |
                                    thr6_replay_pc ;  
assign agc_thr6_pcf_sel_bf[0] =  thr6_replay_pc | thr6_trap_pcaddr_is_valid_bf | 
                                 thr6_lsu_sync_bf ;
assign agc_thr6_pcf_sel_bf[1] = ~thr6_first_level_sel_bf & last_fetch_was_thr6_bf ;
assign agc_thr6_pcf_sel_bf[2] = ~thr6_first_level_sel_bf & ~last_fetch_was_thr6_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[6]);
assign agc_thr6_pcf_sel_bf[3] = ~thr6_first_level_sel_bf & ~last_fetch_was_thr6_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[6]);

assign agc_thr6_pcf_sel_last_bf[0] =  thr6_br_misp_f  & ~(thr6_matches_curr_f & ftp_fetch_v_f) &   
                                     ~thr6_lsu_sync_bf & ~thr6_trap_pcaddr_is_valid_bf ;  
assign agc_thr6_pcf_sel_last_bf[1] = ~agc_thr6_pcf_sel_last_bf[0]  ;  

assign agc_thr6_br_misp_f          =  thr6_br_misp_f   ;


assign thr7_first_level_sel_bf    = thr7_trap_pcaddr_is_valid_bf | thr7_lsu_sync_bf |
                                    thr7_replay_pc ;  
assign agc_thr7_pcf_sel_bf[0] =  thr7_replay_pc | thr7_trap_pcaddr_is_valid_bf | 
                                 thr7_lsu_sync_bf ;
assign agc_thr7_pcf_sel_bf[1] = ~thr7_first_level_sel_bf & last_fetch_was_thr7_bf ;
assign agc_thr7_pcf_sel_bf[2] = ~thr7_first_level_sel_bf & ~last_fetch_was_thr7_bf &  (agc_by_pass_valid_bf & agc_by_pass_sel_bf[7]);
assign agc_thr7_pcf_sel_bf[3] = ~thr7_first_level_sel_bf & ~last_fetch_was_thr7_bf & ~(agc_by_pass_valid_bf & agc_by_pass_sel_bf[7]);

assign agc_thr7_pcf_sel_last_bf[0] =  thr7_br_misp_f  & ~(thr7_matches_curr_f & ftp_fetch_v_f) &   
                                     ~thr7_lsu_sync_bf & ~thr7_trap_pcaddr_is_valid_bf ;  
assign agc_thr7_pcf_sel_last_bf[1] = ~agc_thr7_pcf_sel_last_bf[0]  ;  

assign agc_thr7_br_misp_f          =  thr7_br_misp_f   ;


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// Decode which thread is trapping                                   //
// Note: two threads can be trapping at the same time; One from each //
// Thread group.                                                     //
///////////////////////////////////////////////////////////////////////
assign trap_thread_g0[0] = ~tlu_trap_0_tid[1] & ~tlu_trap_0_tid[0] ; 
assign trap_thread_g0[1] = ~tlu_trap_0_tid[1] &  tlu_trap_0_tid[0] ; 
assign trap_thread_g0[2] =  tlu_trap_0_tid[1] & ~tlu_trap_0_tid[0] ; 
assign trap_thread_g0[3] =  tlu_trap_0_tid[1] &  tlu_trap_0_tid[0] ; 

assign trap_thread_g1[0] = ~tlu_trap_1_tid[1] & ~tlu_trap_1_tid[0] ; 
assign trap_thread_g1[1] = ~tlu_trap_1_tid[1] &  tlu_trap_1_tid[0] ; 
assign trap_thread_g1[2] =  tlu_trap_1_tid[1] & ~tlu_trap_1_tid[0] ; 
assign trap_thread_g1[3] =  tlu_trap_1_tid[1] &  tlu_trap_1_tid[0] ; 

assign thr0_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[0] ; 
assign thr1_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[1] ; 
assign thr2_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[2] ; 
assign thr3_trap_pcaddr_is_valid_bf  = tlu_trap_pc_0_valid  & trap_thread_g0[3] ; 

assign thr4_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[0] ; 
assign thr5_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[1] ; 
assign thr6_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[2] ; 
assign thr7_trap_pcaddr_is_valid_bf  = tlu_trap_pc_1_valid  & trap_thread_g1[3] ; 

assign thr0_sf_is_valid_bf = tlu_retry[0] & trap_thread_g0[0] & tlu_trap_pc_0_valid;
assign thr1_sf_is_valid_bf = tlu_retry[0] & trap_thread_g0[1] & tlu_trap_pc_0_valid;
assign thr2_sf_is_valid_bf = tlu_retry[0] & trap_thread_g0[2] & tlu_trap_pc_0_valid;
assign thr3_sf_is_valid_bf = tlu_retry[0] & trap_thread_g0[3] & tlu_trap_pc_0_valid;
			     
assign thr4_sf_is_valid_bf = tlu_retry[1] & trap_thread_g1[0] & tlu_trap_pc_1_valid;
assign thr5_sf_is_valid_bf = tlu_retry[1] & trap_thread_g1[1] & tlu_trap_pc_1_valid;
assign thr6_sf_is_valid_bf = tlu_retry[1] & trap_thread_g1[2] & tlu_trap_pc_1_valid;
assign thr7_sf_is_valid_bf = tlu_retry[1] & trap_thread_g1[3] & tlu_trap_pc_1_valid;
///////////////////////////////////////////////////////////////////////
// Decode which thread has LSU sync                                  //
// Note: two threads can be synced by LSU at the same time;          //
// One from each thread group.                                       //
///////////////////////////////////////////////////////////////////////
assign load_flush_w[0] = dec_load_flush_w[0] & tid_dec_w[0] ; 
assign load_flush_w[1] = dec_load_flush_w[0] & tid_dec_w[1] ; 
assign load_flush_w[2] = dec_load_flush_w[0] & tid_dec_w[2] ; 
assign load_flush_w[3] = dec_load_flush_w[0] & tid_dec_w[3] ; 
assign load_flush_w[4] = dec_load_flush_w[1] & tid_dec_w[4] ; 
assign load_flush_w[5] = dec_load_flush_w[1] & tid_dec_w[5] ; 
assign load_flush_w[6] = dec_load_flush_w[1] & tid_dec_w[6] ; 
assign load_flush_w[7] = dec_load_flush_w[1] & tid_dec_w[7] ; 

assign thr0_lsu_sync_bf  = load_flush_w[0] ; 
assign thr1_lsu_sync_bf  = load_flush_w[1] ; 
assign thr2_lsu_sync_bf  = load_flush_w[2] ; 
assign thr3_lsu_sync_bf  = load_flush_w[3] ; 

assign thr4_lsu_sync_bf  = load_flush_w[4] ; 
assign thr5_lsu_sync_bf  = load_flush_w[5] ; 
assign thr6_lsu_sync_bf  = load_flush_w[6] ; 
assign thr7_lsu_sync_bf  = load_flush_w[7] ; 

///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 tlu_ceter_pscce_reg  (
  .scan_in(tlu_ceter_pscce_reg_scanin),
  .scan_out(tlu_ceter_pscce_reg_scanout),
  .l1clk( l1clk  ),
  .din  (tlu_ceter_pscce[7:0]),
  .dout (ceter_pscce_ff[7:0]),
  .siclk(siclk),
  .soclk(soclk));
 
///////////////////////////////////////////////////////////////////////
// Decode which thread has a branch misprediction this cycle         //
// Note two threads can have branch misprediction at the same time;  //
// One from each thread group.                                       // 
///////////////////////////////////////////////////////////////////////


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 br_misp_data_reg  (
 .scan_in(br_misp_data_reg_scanin),
 .scan_out(br_misp_data_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({ftp_tid1_e[1:0], ftp_tid0_e[1:0] , dec_br_taken_e[1:0],dec_valid_e[1:0]}),
 .dout ({tid1_m[1:0], tid0_m[1:0] , agc_br_taken_m[1:0],agc_valid_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk));

assign br_taken_ff[1:0] = agc_br_taken_m[1:0] & agc_valid_m[1:0] ;
assign br_taken_dup_ff[1:0] = agc_br_taken_dup_m[1:0] & agc_valid_dup_m[1:0] ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_12 br_misp_data_dup_reg  (
 .scan_in(br_misp_data_dup_reg_scanin),
 .scan_out(br_misp_data_dup_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({ftp_tid1_e[1:0], ftp_tid0_e[1:0], tid1_dup_m[1:0] , tid0_dup_m[1:0], dec_br_taken_e[1:0],dec_valid_e[1:0]}),
 .dout ({tid1_dup_m[1:0], tid0_dup_m[1:0], tid1_dup_b[1:0] , tid0_dup_b[1:0],agc_br_taken_dup_m[1:0], agc_valid_dup_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk));

assign next_tid_dec_b[0] = ~tid0_dup_b[1] & ~tid0_dup_b[0] ;
assign next_tid_dec_b[1] = ~tid0_dup_b[1] &  tid0_dup_b[0] ;
assign next_tid_dec_b[2] =  tid0_dup_b[1] & ~tid0_dup_b[0] ;
assign next_tid_dec_b[3] =  tid0_dup_b[1] &  tid0_dup_b[0] ;
assign next_tid_dec_b[4] = ~tid1_dup_b[1] & ~tid1_dup_b[0] ;
assign next_tid_dec_b[5] = ~tid1_dup_b[1] &  tid1_dup_b[0] ;
assign next_tid_dec_b[6] =  tid1_dup_b[1] & ~tid1_dup_b[0] ;
assign next_tid_dec_b[7] =  tid1_dup_b[1] &  tid1_dup_b[0] ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 tid_dec_w_reg  (
 .scan_in(tid_dec_w_reg_scanin),
 .scan_out(tid_dec_w_reg_scanout),
 .l1clk(l1clk),
 .din  (next_tid_dec_b[7:0]),
 .dout (tid_dec_w[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 curr_fetch_thr_c_reg  (
 .scan_in(curr_fetch_thr_c_reg_scanin),
 .scan_out(curr_fetch_thr_c_reg_scanout),
 .l1clk(l1clk),
 .din  (ftp_curr_fetch_thr_f[7:0]),
 .dout (curr_fetch_thr_c[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 cms_curr_fetch_thr_c_reg  (
 .scan_in(cms_curr_fetch_thr_c_reg_scanin),
 .scan_out(cms_curr_fetch_thr_c_reg_scanout),
 .l1clk(l1clk),
 .din  (ftp_curr_fetch_thr_f[7:0]),
 .dout (cms_curr_fetch_thr_c[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


assign thr0_matches_curr_f = (~tid0_m[1] & ~tid0_m[0] & ftp_curr_fetch_thr_f[0]   ) ;
assign thr1_matches_curr_f = (~tid0_m[1] &  tid0_m[0] & ftp_curr_fetch_thr_f[1]   ) ;
assign thr2_matches_curr_f = ( tid0_m[1] & ~tid0_m[0] & ftp_curr_fetch_thr_f[2]   ) ;
assign thr3_matches_curr_f = ( tid0_m[1] &  tid0_m[0] & ftp_curr_fetch_thr_f[3]   ) ;
assign thr4_matches_curr_f = (~tid1_m[1] & ~tid1_m[0] & ftp_curr_fetch_thr_f[4]   ) ;
assign thr5_matches_curr_f = (~tid1_m[1] &  tid1_m[0] & ftp_curr_fetch_thr_f[5]   ) ;
assign thr6_matches_curr_f = ( tid1_m[1] & ~tid1_m[0] & ftp_curr_fetch_thr_f[6]   ) ;
assign thr7_matches_curr_f = ( tid1_m[1] &  tid1_m[0] & ftp_curr_fetch_thr_f[7]   ) ;

assign thr0_matches_curr_c = (~tid0_m[1] & ~tid0_m[0] & curr_fetch_thr_c[0]   ) ;
assign thr1_matches_curr_c = (~tid0_m[1] &  tid0_m[0] & curr_fetch_thr_c[1]   ) ;
assign thr2_matches_curr_c = ( tid0_m[1] & ~tid0_m[0] & curr_fetch_thr_c[2]   ) ;
assign thr3_matches_curr_c = ( tid0_m[1] &  tid0_m[0] & curr_fetch_thr_c[3]   ) ;
assign thr4_matches_curr_c = (~tid1_m[1] & ~tid1_m[0] & curr_fetch_thr_c[4]   ) ;
assign thr5_matches_curr_c = (~tid1_m[1] &  tid1_m[0] & curr_fetch_thr_c[5]   ) ;
assign thr6_matches_curr_c = ( tid1_m[1] & ~tid1_m[0] & curr_fetch_thr_c[6]   ) ;
assign thr7_matches_curr_c = ( tid1_m[1] &  tid1_m[0] & curr_fetch_thr_c[7]   ) ;


assign thr0_br_misp_f    = ~tid0_dup_m[1] & ~tid0_dup_m[0] & br_taken_dup_ff[0]; 
assign thr1_br_misp_f    = ~tid0_dup_m[1] &  tid0_dup_m[0] & br_taken_dup_ff[0]; 
assign thr2_br_misp_f    =  tid0_dup_m[1] & ~tid0_dup_m[0] & br_taken_dup_ff[0]; 
assign thr3_br_misp_f    =  tid0_dup_m[1] &  tid0_dup_m[0] & br_taken_dup_ff[0]; 

assign thr4_br_misp_f    = ~tid1_dup_m[1] & ~tid1_dup_m[0] & br_taken_dup_ff[1]; 
assign thr5_br_misp_f    = ~tid1_dup_m[1] &  tid1_dup_m[0] & br_taken_dup_ff[1]; 
assign thr6_br_misp_f    =  tid1_dup_m[1] & ~tid1_dup_m[0] & br_taken_dup_ff[1]; 
assign thr7_br_misp_f    =  tid1_dup_m[1] &  tid1_dup_m[0] & br_taken_dup_ff[1]; 



///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// This is the scheme to take out NPCs                               //
// We need to main a signal which tells us to fetch only one         //
// instruction. The source for this signal is the TLU or C stage     //
// incase we have to replay from fetches in C stage.                 //
// There one bit per thread.                                         //
///////////////////////////////////////////////////////////////////////
// Thread 0 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr0_sf_valid_bf   = thr0_sf_is_valid_bf | (agc_thr0_reset_sf_c & sf_valid_c) ;
assign reset_thr0_sf_valid_bf = (ftp_fetch_thr_q_f[0] & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[0]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[0] ;   
assign hold_thr0_sf_valid_bf  = ~set_thr0_sf_valid_bf  & ~reset_thr0_sf_valid_bf ;
assign next_thr0_sf_valid_bf  = (set_thr0_sf_valid_bf ) |  (hold_thr0_sf_valid_bf &  thr0_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 1 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr1_sf_valid_bf   = thr1_sf_is_valid_bf | (agc_thr1_reset_sf_c & sf_valid_c) ;
assign reset_thr1_sf_valid_bf = (ftp_fetch_thr_q_f[1]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[1]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[1] ;   
assign hold_thr1_sf_valid_bf  = ~set_thr1_sf_valid_bf  & ~reset_thr1_sf_valid_bf ;
assign next_thr1_sf_valid_bf  = (set_thr1_sf_valid_bf ) |  (hold_thr1_sf_valid_bf &  thr1_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 2 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr2_sf_valid_bf   = thr2_sf_is_valid_bf | (agc_thr2_reset_sf_c & sf_valid_c) ;
assign reset_thr2_sf_valid_bf = (ftp_fetch_thr_q_f[2]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[2]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[2] ;   
assign hold_thr2_sf_valid_bf  = ~set_thr2_sf_valid_bf  & ~reset_thr2_sf_valid_bf ;
assign next_thr2_sf_valid_bf  = (set_thr2_sf_valid_bf ) |  (hold_thr2_sf_valid_bf &  thr2_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 3 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr3_sf_valid_bf   = thr3_sf_is_valid_bf | (agc_thr3_reset_sf_c & sf_valid_c) ;
assign reset_thr3_sf_valid_bf = (ftp_fetch_thr_q_f[3]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[3]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[3] ;   
assign hold_thr3_sf_valid_bf  = ~set_thr3_sf_valid_bf  & ~reset_thr3_sf_valid_bf ;
assign next_thr3_sf_valid_bf  = (set_thr3_sf_valid_bf ) |  (hold_thr3_sf_valid_bf &  thr3_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 4 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr4_sf_valid_bf   = thr4_sf_is_valid_bf | (agc_thr4_reset_sf_c & sf_valid_c) ;
assign reset_thr4_sf_valid_bf = (ftp_fetch_thr_q_f[4]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[4]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[4] ;   
assign hold_thr4_sf_valid_bf  = ~set_thr4_sf_valid_bf  & ~reset_thr4_sf_valid_bf ;
assign next_thr4_sf_valid_bf  = (set_thr4_sf_valid_bf ) |  (hold_thr4_sf_valid_bf &  thr4_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 5 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr5_sf_valid_bf   = thr5_sf_is_valid_bf | (agc_thr5_reset_sf_c & sf_valid_c) ;
assign reset_thr5_sf_valid_bf = (ftp_fetch_thr_q_f[5]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[5]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[5] ;   
assign hold_thr5_sf_valid_bf  = ~set_thr5_sf_valid_bf  & ~reset_thr5_sf_valid_bf ;
assign next_thr5_sf_valid_bf  = (set_thr5_sf_valid_bf ) |  (hold_thr5_sf_valid_bf &  thr5_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 6 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr6_sf_valid_bf   = thr6_sf_is_valid_bf | (agc_thr6_reset_sf_c & sf_valid_c) ;
assign reset_thr6_sf_valid_bf = (ftp_fetch_thr_q_f[6]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[6]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[6] ;   
assign hold_thr6_sf_valid_bf  = ~set_thr6_sf_valid_bf  & ~reset_thr6_sf_valid_bf ;
assign next_thr6_sf_valid_bf  = (set_thr6_sf_valid_bf ) |  (hold_thr6_sf_valid_bf &  thr6_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 7 single fetch bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr7_sf_valid_bf   = thr7_sf_is_valid_bf | (agc_thr7_reset_sf_c & sf_valid_c) ;
assign reset_thr7_sf_valid_bf = (ftp_fetch_thr_q_f[7]  & ~invalidation_req_f) |
                                 (agc_by_pass_sel_f[7]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[7] ;   
assign hold_thr7_sf_valid_bf  = ~set_thr7_sf_valid_bf  & ~reset_thr7_sf_valid_bf ;
assign next_thr7_sf_valid_bf  = (set_thr7_sf_valid_bf ) |  (hold_thr7_sf_valid_bf &  thr7_sf_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Flop the single fetch bits                                        //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_8 sf_valid_reg  (
 .scan_in(sf_valid_reg_scanin),
 .scan_out(sf_valid_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({next_thr7_sf_valid_bf,next_thr6_sf_valid_bf,next_thr5_sf_valid_bf,
         next_thr4_sf_valid_bf,next_thr3_sf_valid_bf,next_thr2_sf_valid_bf,
         next_thr1_sf_valid_bf,next_thr0_sf_valid_bf}),
 .dout ({thr7_sf_valid_f,thr6_sf_valid_f,thr5_sf_valid_f,thr4_sf_valid_f,
         thr3_sf_valid_f,thr2_sf_valid_f,thr1_sf_valid_f,thr0_sf_valid_f}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 sf_valid_dup_reg  (
 .scan_in(sf_valid_dup_reg_scanin),
 .scan_out(sf_valid_dup_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({next_thr7_sf_valid_bf,next_thr6_sf_valid_bf,next_thr5_sf_valid_bf,
         next_thr4_sf_valid_bf,next_thr3_sf_valid_bf,next_thr2_sf_valid_bf,
         next_thr1_sf_valid_bf,next_thr0_sf_valid_bf}),
 .dout ({agc_thr7_sf_valid_f,agc_thr6_sf_valid_f,agc_thr5_sf_valid_f,agc_thr4_sf_valid_f,
         agc_thr3_sf_valid_f,agc_thr2_sf_valid_f,agc_thr1_sf_valid_f,agc_thr0_sf_valid_f}),
  .siclk(siclk),
  .soclk(soclk));



////////////////////////////////////////////////////////////////////////////
// single fetch bit with out the by_pass case.                            //
////////////////////////////////////////////////////////////////////////////
assign instr_sf_valid_f   =  (ftp_fetch_thr_q_f[0] & thr0_sf_valid_f) |
                             (ftp_fetch_thr_q_f[1] & thr1_sf_valid_f) |
                             (ftp_fetch_thr_q_f[2] & thr2_sf_valid_f) |
                             (ftp_fetch_thr_q_f[3] & thr3_sf_valid_f) |
                             (ftp_fetch_thr_q_f[4] & thr4_sf_valid_f) |
                             (ftp_fetch_thr_q_f[5] & thr5_sf_valid_f) |
                             (ftp_fetch_thr_q_f[6] & thr6_sf_valid_f) |
                             (ftp_fetch_thr_q_f[7] & thr7_sf_valid_f) ;
 

////////////////////////////////////////////////////////////////////////////
// Note the thrx_sf_valid_f has been set when the miss was detected.      //
////////////////////////////////////////////////////////////////////////////
assign sf_valid_by_pass_bf = (thr0_sf_valid_f & agc_by_pass_sel_bf[0] ) |
                             (thr1_sf_valid_f & agc_by_pass_sel_bf[1] ) |
                             (thr2_sf_valid_f & agc_by_pass_sel_bf[2] ) |
                             (thr3_sf_valid_f & agc_by_pass_sel_bf[3] ) |
                             (thr4_sf_valid_f & agc_by_pass_sel_bf[4] ) |
                             (thr5_sf_valid_f & agc_by_pass_sel_bf[5] ) |
                             (thr6_sf_valid_f & agc_by_pass_sel_bf[6] ) |
                             (thr7_sf_valid_f & agc_by_pass_sel_bf[7] ) ;

 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 sf_valid_by_pass_f_reg  (
  .scan_in(sf_valid_by_pass_f_reg_scanin),
  .scan_out(sf_valid_by_pass_f_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (sf_valid_by_pass_bf),
  .dout (sf_valid_by_pass_f),
  .siclk(siclk),
  .soclk(soclk));
 
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 sf_valid_by_pass_c_reg  (
  .scan_in(sf_valid_by_pass_c_reg_scanin),
  .scan_out(sf_valid_by_pass_c_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (sf_valid_by_pass_f),
  .dout (sf_valid_by_pass_c),
  .siclk(siclk),
  .soclk(soclk));

 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 sf_v_c  (
  .scan_in(sf_v_c_scanin),
  .scan_out(sf_v_c_scanout),
  .l1clk( l1clk_pm1),
  .din  (instr_sf_valid_f),
  .dout (instr_sf_valid_c),
  .siclk(siclk),
  .soclk(soclk));
assign ftu_instr_sf_valid_c = instr_sf_valid_c ; 

///////////////////////////////////////////////////////////////////////
// Thread 0 uncacheable bit                                          //
///////////////////////////////////////////////////////////////////////
assign set_thr0_unc_valid_bf   = thr0_unc_is_valid  ;
assign reset_thr0_unc_valid_bf = (ftp_fetch_thr_q_f[0] ) |
                                 (agc_by_pass_sel_f[0]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[0] ;   
assign hold_thr0_unc_valid_bf  = ~set_thr0_unc_valid_bf  & ~reset_thr0_unc_valid_bf ;
assign next_thr0_unc_valid_bf  = (set_thr0_unc_valid_bf ) |  (hold_thr0_unc_valid_bf &  thr0_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 1 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr1_unc_valid_bf   = thr1_unc_is_valid  ;
assign reset_thr1_unc_valid_bf = (ftp_fetch_thr_q_f[1] ) |
                                 (agc_by_pass_sel_f[1]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[1] ;   
assign hold_thr1_unc_valid_bf  = ~set_thr1_unc_valid_bf  & ~reset_thr1_unc_valid_bf ;
assign next_thr1_unc_valid_bf  = (set_thr1_unc_valid_bf ) |  (hold_thr1_unc_valid_bf &  thr1_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 2 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr2_unc_valid_bf   = thr2_unc_is_valid  ;
assign reset_thr2_unc_valid_bf = (ftp_fetch_thr_q_f[2] ) |
                                 (agc_by_pass_sel_f[2]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[2] ;   
assign hold_thr2_unc_valid_bf  = ~set_thr2_unc_valid_bf  & ~reset_thr2_unc_valid_bf ;
assign next_thr2_unc_valid_bf  = (set_thr2_unc_valid_bf ) |  (hold_thr2_unc_valid_bf &  thr2_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 3 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr3_unc_valid_bf   = thr3_unc_is_valid  ;
assign reset_thr3_unc_valid_bf = (ftp_fetch_thr_q_f[3] ) |
                                 (agc_by_pass_sel_f[3]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[3] ;   
assign hold_thr3_unc_valid_bf  = ~set_thr3_unc_valid_bf  & ~reset_thr3_unc_valid_bf ;
assign next_thr3_unc_valid_bf  = (set_thr3_unc_valid_bf ) |  (hold_thr3_unc_valid_bf &  thr3_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 4 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr4_unc_valid_bf   = thr4_unc_is_valid  ;
assign reset_thr4_unc_valid_bf = (ftp_fetch_thr_q_f[4] ) |
                                 (agc_by_pass_sel_f[4]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[4] ;   
assign hold_thr4_unc_valid_bf  = ~set_thr4_unc_valid_bf  & ~reset_thr4_unc_valid_bf ;
assign next_thr4_unc_valid_bf  = (set_thr4_unc_valid_bf ) |  (hold_thr4_unc_valid_bf &  thr4_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 5 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr5_unc_valid_bf   = thr5_unc_is_valid  ;
assign reset_thr5_unc_valid_bf = (ftp_fetch_thr_q_f[5] ) |
                                 (agc_by_pass_sel_f[5]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[5] ;   
assign hold_thr5_unc_valid_bf  = ~set_thr5_unc_valid_bf  & ~reset_thr5_unc_valid_bf ;
assign next_thr5_unc_valid_bf  = (set_thr5_unc_valid_bf ) |  (hold_thr5_unc_valid_bf &  thr5_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 6 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr6_unc_valid_bf   = thr6_unc_is_valid  ;
assign reset_thr6_unc_valid_bf = (ftp_fetch_thr_q_f[6] ) |
                                 (agc_by_pass_sel_f[6]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[6] ;   
assign hold_thr6_unc_valid_bf  = ~set_thr6_unc_valid_bf  & ~reset_thr6_unc_valid_bf ;
assign next_thr6_unc_valid_bf  = (set_thr6_unc_valid_bf ) |  (hold_thr6_unc_valid_bf &  thr6_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Thread 7 uncacheable bit                                         //
///////////////////////////////////////////////////////////////////////
assign set_thr7_unc_valid_bf   = thr7_unc_is_valid  ;
assign reset_thr7_unc_valid_bf = (ftp_fetch_thr_q_f[7] ) |
                                 (agc_by_pass_sel_f[7]    &  agc_by_pass_valid_f ) | tlu_flush_ifu_f[7] ;   
assign hold_thr7_unc_valid_bf  = ~set_thr7_unc_valid_bf  & ~reset_thr7_unc_valid_bf ;
assign next_thr7_unc_valid_bf  = (set_thr7_unc_valid_bf ) |  (hold_thr7_unc_valid_bf &  thr7_unc_valid_f) ; 

///////////////////////////////////////////////////////////////////////
// Flop the uncacheable bits                                        //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_8 unc_valid_reg  (
 .scan_in(unc_valid_reg_scanin),
 .scan_out(unc_valid_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({next_thr7_unc_valid_bf,next_thr6_unc_valid_bf,next_thr5_unc_valid_bf,
         next_thr4_unc_valid_bf,next_thr3_unc_valid_bf,next_thr2_unc_valid_bf,
         next_thr1_unc_valid_bf,next_thr0_unc_valid_bf}),
 .dout ({thr7_unc_valid_f,thr6_unc_valid_f,thr5_unc_valid_f,thr4_unc_valid_f,
         thr3_unc_valid_f,thr2_unc_valid_f,thr1_unc_valid_f,thr0_unc_valid_f}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr0 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////

assign thr0_by_pass_pc_incr_bit5 = ( agd_thr0_pc_4_2_f[4] &  agd_thr0_pc_4_2_f[3] &  agd_thr0_pc_4_2_f[2]) | 
                                   (!thr0_unc_valid_f     &  agd_thr0_pc_4_2_f[4]);

assign thr0_by_pass_inc_pc_bf[4] = ( thr0_unc_valid_f      &  agd_thr0_pc_4_2_f[4] & !agd_thr0_pc_4_2_f[2]) | 
                                   ( thr0_unc_valid_f      &  agd_thr0_pc_4_2_f[4] & !agd_thr0_pc_4_2_f[3]) | 
                                   (!thr0_unc_valid_f      & !agd_thr0_pc_4_2_f[4]) | 
                                   (!agd_thr0_pc_4_2_f[4]  &  agd_thr0_pc_4_2_f[3] &  agd_thr0_pc_4_2_f[2]);

assign thr0_by_pass_inc_pc_bf[3] = ( thr0_unc_valid_f      & !agd_thr0_pc_4_2_f[3] &  agd_thr0_pc_4_2_f[2]) | 
                                   (!thr0_unc_valid_f      & !agd_thr0_pc_4_2_f[4] &  agd_thr0_pc_4_2_f[3]) | 
                                   ( thr0_unc_valid_f      &  agd_thr0_pc_4_2_f[3] & !agd_thr0_pc_4_2_f[2]);

assign thr0_by_pass_inc_pc_bf[2] = (!thr0_unc_valid_f      & !agd_thr0_pc_4_2_f[4] &  agd_thr0_pc_4_2_f[2]) | 
                                   ( thr0_unc_valid_f      & !agd_thr0_pc_4_2_f[2]);



ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr0_pc_f_inc_reg  (
 .scan_in(thr0_pc_f_inc_reg_scanin),
 .scan_out(thr0_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr0_by_pass_inc_pc_bf[4:2], thr0_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr0_byp_pc_update_bf[4:2],agc_thr0_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr1 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
assign thr1_by_pass_pc_incr_bit5 = ( agd_thr1_pc_4_2_f[4] &  agd_thr1_pc_4_2_f[3] &  agd_thr1_pc_4_2_f[2]) | 
                                   (!thr1_unc_valid_f     &  agd_thr1_pc_4_2_f[4]);

assign thr1_by_pass_inc_pc_bf[4] = ( thr1_unc_valid_f      &  agd_thr1_pc_4_2_f[4] & !agd_thr1_pc_4_2_f[2]) | 
                                   ( thr1_unc_valid_f      &  agd_thr1_pc_4_2_f[4] & !agd_thr1_pc_4_2_f[3]) | 
                                   (!thr1_unc_valid_f      & !agd_thr1_pc_4_2_f[4]) | 
                                   (!agd_thr1_pc_4_2_f[4]  &  agd_thr1_pc_4_2_f[3] &  agd_thr1_pc_4_2_f[2]);

assign thr1_by_pass_inc_pc_bf[3] = ( thr1_unc_valid_f      & !agd_thr1_pc_4_2_f[3] &  agd_thr1_pc_4_2_f[2]) | 
                                   (!thr1_unc_valid_f      & !agd_thr1_pc_4_2_f[4] &  agd_thr1_pc_4_2_f[3]) | 
                                   ( thr1_unc_valid_f      &  agd_thr1_pc_4_2_f[3] & !agd_thr1_pc_4_2_f[2]);

assign thr1_by_pass_inc_pc_bf[2] = (!thr1_unc_valid_f      & !agd_thr1_pc_4_2_f[4] &  agd_thr1_pc_4_2_f[2]) | 
                                   ( thr1_unc_valid_f      & !agd_thr1_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr1_pc_f_inc_reg  (
 .scan_in(thr1_pc_f_inc_reg_scanin),
 .scan_out(thr1_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr1_by_pass_inc_pc_bf[4:2], thr1_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr1_byp_pc_update_bf[4:2],agc_thr1_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr2 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr2_by_pass_pc_incr_bit5 = ( agd_thr2_pc_4_2_f[4] &  agd_thr2_pc_4_2_f[3] &  agd_thr2_pc_4_2_f[2]) | 
                                   (!thr2_unc_valid_f     &  agd_thr2_pc_4_2_f[4]);

assign thr2_by_pass_inc_pc_bf[4] = ( thr2_unc_valid_f      &  agd_thr2_pc_4_2_f[4] & !agd_thr2_pc_4_2_f[2]) | 
                                   ( thr2_unc_valid_f      &  agd_thr2_pc_4_2_f[4] & !agd_thr2_pc_4_2_f[3]) | 
                                   (!thr2_unc_valid_f      & !agd_thr2_pc_4_2_f[4]) | 
                                   (!agd_thr2_pc_4_2_f[4]  &  agd_thr2_pc_4_2_f[3] &  agd_thr2_pc_4_2_f[2]);

assign thr2_by_pass_inc_pc_bf[3] = ( thr2_unc_valid_f      & !agd_thr2_pc_4_2_f[3] &  agd_thr2_pc_4_2_f[2]) | 
                                   (!thr2_unc_valid_f      & !agd_thr2_pc_4_2_f[4] &  agd_thr2_pc_4_2_f[3]) | 
                                   ( thr2_unc_valid_f      &  agd_thr2_pc_4_2_f[3] & !agd_thr2_pc_4_2_f[2]);

assign thr2_by_pass_inc_pc_bf[2] = (!thr2_unc_valid_f      & !agd_thr2_pc_4_2_f[4] &  agd_thr2_pc_4_2_f[2]) | 
                                   ( thr2_unc_valid_f      & !agd_thr2_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr2_pc_f_inc_reg  (
 .scan_in(thr2_pc_f_inc_reg_scanin),
 .scan_out(thr2_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr2_by_pass_inc_pc_bf[4:2], thr2_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr2_byp_pc_update_bf[4:2],agc_thr2_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr3 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr3_by_pass_pc_incr_bit5 = ( agd_thr3_pc_4_2_f[4] &  agd_thr3_pc_4_2_f[3] &  agd_thr3_pc_4_2_f[2]) | 
                                   (!thr3_unc_valid_f     &  agd_thr3_pc_4_2_f[4]);

assign thr3_by_pass_inc_pc_bf[4] = ( thr3_unc_valid_f      &  agd_thr3_pc_4_2_f[4] & !agd_thr3_pc_4_2_f[2]) | 
                                   ( thr3_unc_valid_f      &  agd_thr3_pc_4_2_f[4] & !agd_thr3_pc_4_2_f[3]) | 
                                   (!thr3_unc_valid_f      & !agd_thr3_pc_4_2_f[4]) | 
                                   (!agd_thr3_pc_4_2_f[4]  &  agd_thr3_pc_4_2_f[3] &  agd_thr3_pc_4_2_f[2]);

assign thr3_by_pass_inc_pc_bf[3] = ( thr3_unc_valid_f      & !agd_thr3_pc_4_2_f[3] &  agd_thr3_pc_4_2_f[2]) | 
                                   (!thr3_unc_valid_f      & !agd_thr3_pc_4_2_f[4] &  agd_thr3_pc_4_2_f[3]) | 
                                   ( thr3_unc_valid_f      &  agd_thr3_pc_4_2_f[3] & !agd_thr3_pc_4_2_f[2]);

assign thr3_by_pass_inc_pc_bf[2] = (!thr3_unc_valid_f      & !agd_thr3_pc_4_2_f[4] &  agd_thr3_pc_4_2_f[2]) | 
                                   ( thr3_unc_valid_f      & !agd_thr3_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr3_pc_f_inc_reg  (
 .scan_in(thr3_pc_f_inc_reg_scanin),
 .scan_out(thr3_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr3_by_pass_inc_pc_bf[4:2], thr3_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr3_byp_pc_update_bf[4:2],agc_thr3_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr4 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr4_by_pass_pc_incr_bit5 = ( agd_thr4_pc_4_2_f[4] &  agd_thr4_pc_4_2_f[3] &  agd_thr4_pc_4_2_f[2]) | 
                                   (!thr4_unc_valid_f     &  agd_thr4_pc_4_2_f[4]);

assign thr4_by_pass_inc_pc_bf[4] = ( thr4_unc_valid_f      &  agd_thr4_pc_4_2_f[4] & !agd_thr4_pc_4_2_f[2]) | 
                                   ( thr4_unc_valid_f      &  agd_thr4_pc_4_2_f[4] & !agd_thr4_pc_4_2_f[3]) | 
                                   (!thr4_unc_valid_f      & !agd_thr4_pc_4_2_f[4]) | 
                                   (!agd_thr4_pc_4_2_f[4]  &  agd_thr4_pc_4_2_f[3] &  agd_thr4_pc_4_2_f[2]);

assign thr4_by_pass_inc_pc_bf[3] = ( thr4_unc_valid_f      & !agd_thr4_pc_4_2_f[3] &  agd_thr4_pc_4_2_f[2]) | 
                                   (!thr4_unc_valid_f      & !agd_thr4_pc_4_2_f[4] &  agd_thr4_pc_4_2_f[3]) | 
                                   ( thr4_unc_valid_f      &  agd_thr4_pc_4_2_f[3] & !agd_thr4_pc_4_2_f[2]);

assign thr4_by_pass_inc_pc_bf[2] = (!thr4_unc_valid_f      & !agd_thr4_pc_4_2_f[4] &  agd_thr4_pc_4_2_f[2]) | 
                                   ( thr4_unc_valid_f      & !agd_thr4_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr4_pc_f_inc_reg  (
 .scan_in(thr4_pc_f_inc_reg_scanin),
 .scan_out(thr4_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr4_by_pass_inc_pc_bf[4:2], thr4_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr4_byp_pc_update_bf[4:2],agc_thr4_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr5 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr5_by_pass_pc_incr_bit5 = ( agd_thr5_pc_4_2_f[4] &  agd_thr5_pc_4_2_f[3] &  agd_thr5_pc_4_2_f[2]) | 
                                   (!thr5_unc_valid_f     &  agd_thr5_pc_4_2_f[4]);

assign thr5_by_pass_inc_pc_bf[4] = ( thr5_unc_valid_f      &  agd_thr5_pc_4_2_f[4] & !agd_thr5_pc_4_2_f[2]) | 
                                   ( thr5_unc_valid_f      &  agd_thr5_pc_4_2_f[4] & !agd_thr5_pc_4_2_f[3]) | 
                                   (!thr5_unc_valid_f      & !agd_thr5_pc_4_2_f[4]) | 
                                   (!agd_thr5_pc_4_2_f[4]  &  agd_thr5_pc_4_2_f[3] &  agd_thr5_pc_4_2_f[2]);

assign thr5_by_pass_inc_pc_bf[3] = ( thr5_unc_valid_f      & !agd_thr5_pc_4_2_f[3] &  agd_thr5_pc_4_2_f[2]) | 
                                   (!thr5_unc_valid_f      & !agd_thr5_pc_4_2_f[4] &  agd_thr5_pc_4_2_f[3]) | 
                                   ( thr5_unc_valid_f      &  agd_thr5_pc_4_2_f[3] & !agd_thr5_pc_4_2_f[2]);

assign thr5_by_pass_inc_pc_bf[2] = (!thr5_unc_valid_f      & !agd_thr5_pc_4_2_f[4] &  agd_thr5_pc_4_2_f[2]) | 
                                   ( thr5_unc_valid_f      & !agd_thr5_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr5_pc_f_inc_reg  (
 .scan_in(thr5_pc_f_inc_reg_scanin),
 .scan_out(thr5_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr5_by_pass_inc_pc_bf[4:2], thr5_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr5_byp_pc_update_bf[4:2],agc_thr5_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr6 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr6_by_pass_pc_incr_bit5 = ( agd_thr6_pc_4_2_f[4] &  agd_thr6_pc_4_2_f[3] &  agd_thr6_pc_4_2_f[2]) | 
                                   (!thr6_unc_valid_f     &  agd_thr6_pc_4_2_f[4]);

assign thr6_by_pass_inc_pc_bf[4] = ( thr6_unc_valid_f      &  agd_thr6_pc_4_2_f[4] & !agd_thr6_pc_4_2_f[2]) | 
                                   ( thr6_unc_valid_f      &  agd_thr6_pc_4_2_f[4] & !agd_thr6_pc_4_2_f[3]) | 
                                   (!thr6_unc_valid_f      & !agd_thr6_pc_4_2_f[4]) | 
                                   (!agd_thr6_pc_4_2_f[4]  &  agd_thr6_pc_4_2_f[3] &  agd_thr6_pc_4_2_f[2]);

assign thr6_by_pass_inc_pc_bf[3] = ( thr6_unc_valid_f      & !agd_thr6_pc_4_2_f[3] &  agd_thr6_pc_4_2_f[2]) | 
                                   (!thr6_unc_valid_f      & !agd_thr6_pc_4_2_f[4] &  agd_thr6_pc_4_2_f[3]) | 
                                   ( thr6_unc_valid_f      &  agd_thr6_pc_4_2_f[3] & !agd_thr6_pc_4_2_f[2]);

assign thr6_by_pass_inc_pc_bf[2] = (!thr6_unc_valid_f      & !agd_thr6_pc_4_2_f[4] &  agd_thr6_pc_4_2_f[2]) | 
                                   ( thr6_unc_valid_f      & !agd_thr6_pc_4_2_f[2]);



ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr6_pc_f_inc_reg  (
 .scan_in(thr6_pc_f_inc_reg_scanin),
 .scan_out(thr6_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr6_by_pass_inc_pc_bf[4:2], thr6_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr6_byp_pc_update_bf[4:2],agc_thr6_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
// thr7 by_pass lower bits incrementining. This is done early and    //
// flopped to fix timing problems.                                   //
///////////////////////////////////////////////////////////////////////
assign thr7_by_pass_pc_incr_bit5 = ( agd_thr7_pc_4_2_f[4] &  agd_thr7_pc_4_2_f[3] &  agd_thr7_pc_4_2_f[2]) | 
                                   (!thr7_unc_valid_f     &  agd_thr7_pc_4_2_f[4]);

assign thr7_by_pass_inc_pc_bf[4] = ( thr7_unc_valid_f      &  agd_thr7_pc_4_2_f[4] & !agd_thr7_pc_4_2_f[2]) | 
                                   ( thr7_unc_valid_f      &  agd_thr7_pc_4_2_f[4] & !agd_thr7_pc_4_2_f[3]) | 
                                   (!thr7_unc_valid_f      & !agd_thr7_pc_4_2_f[4]) | 
                                   (!agd_thr7_pc_4_2_f[4]  &  agd_thr7_pc_4_2_f[3] &  agd_thr7_pc_4_2_f[2]);

assign thr7_by_pass_inc_pc_bf[3] = ( thr7_unc_valid_f      & !agd_thr7_pc_4_2_f[3] &  agd_thr7_pc_4_2_f[2]) | 
                                   (!thr7_unc_valid_f      & !agd_thr7_pc_4_2_f[4] &  agd_thr7_pc_4_2_f[3]) | 
                                   ( thr7_unc_valid_f      &  agd_thr7_pc_4_2_f[3] & !agd_thr7_pc_4_2_f[2]);

assign thr7_by_pass_inc_pc_bf[2] = (!thr7_unc_valid_f      & !agd_thr7_pc_4_2_f[4] &  agd_thr7_pc_4_2_f[2]) | 
                                   ( thr7_unc_valid_f      & !agd_thr7_pc_4_2_f[2]);


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 thr7_pc_f_inc_reg  (
 .scan_in(thr7_pc_f_inc_reg_scanin),
 .scan_out(thr7_pc_f_inc_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ( {thr7_by_pass_inc_pc_bf[4:2], thr7_by_pass_pc_incr_bit5}),
 .dout ( {agc_thr7_byp_pc_update_bf[4:2],agc_thr7_byp_incr_bit5}),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

assign last_fetch_was_thr0_bf = ftp_fetch_thr_q_f[0] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr1_bf = ftp_fetch_thr_q_f[1] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr2_bf = ftp_fetch_thr_q_f[2] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr3_bf = ftp_fetch_thr_q_f[3] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr4_bf = ftp_fetch_thr_q_f[4] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr5_bf = ftp_fetch_thr_q_f[5] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr6_bf = ftp_fetch_thr_q_f[6] & ~agc_by_pass_valid_f;
assign last_fetch_was_thr7_bf = ftp_fetch_thr_q_f[7] & ~agc_by_pass_valid_f;

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 tlu_flush_ifu_reg  (
 .scan_in(tlu_flush_ifu_reg_scanin),
 .scan_out(tlu_flush_ifu_reg_scanout),
 .l1clk( l1clk),
 .din  (tlu_flush_ifu[7:0]),
 .dout (tlu_flush_ifu_f[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_16 tlu_flush_ifu_d_reg  (
 .scan_in(tlu_flush_ifu_d_reg_scanin),
 .scan_out(tlu_flush_ifu_d_reg_scanout),
 .l1clk( l1clk),
 .din  ({tlu_flush_ifu_f[7:0],tlu_flush_ifu_f_d[7:0]}),
 .dout ({tlu_flush_ifu_f_d[7:0],tlu_flush_ifu_f_dd[7:0]}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 cms_tlu_flush_ifu_reg  (
 .scan_in(cms_tlu_flush_ifu_reg_scanin),
 .scan_out(cms_tlu_flush_ifu_reg_scanout),
 .l1clk( l1clk),
 .din  (tlu_flush_ifu[7:0]),
 .dout (cms_tlu_flush_f[7:0]),
  .siclk(siclk),
  .soclk(soclk));


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 load_flush_reg  (
 .scan_in(load_flush_reg_scanin),
 .scan_out(load_flush_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (load_flush_w[7:0]),
 .dout (load_flush_f[7:0]),
  .siclk(siclk),
  .soclk(soclk));


assign agc_kill_fetch_cv_f =  (((ftu_thr0_redirect_int_bf | agc_thr0_micro_flush_unq_c |  tlu_flush_ifu_f[0] | load_flush_f[0] |
                                 tlu_flush_ifu_f_d[0] | tlu_flush_ifu_f_dd[0] | thr0_sf_kill | 
                                 thr0_sf_kill_d | thr0_br_misp_no_match_f | thr0_kill_after_invalidation |
                                 thr0_kill_after_invalidation_d | thr0_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[0])| 
                                ((ftu_thr1_redirect_int_bf | agc_thr1_micro_flush_unq_c | tlu_flush_ifu_f[1] | load_flush_f[1] | 
                                 tlu_flush_ifu_f_d[1] | tlu_flush_ifu_f_dd[1] | thr1_sf_kill | 
                                 thr1_sf_kill_d | thr1_br_misp_no_match_f | thr1_kill_after_invalidation |
                                 thr1_kill_after_invalidation_d | thr1_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[1])| 
                                ((ftu_thr2_redirect_int_bf | agc_thr2_micro_flush_unq_c | tlu_flush_ifu_f[2] | load_flush_f[2] | 
                                 tlu_flush_ifu_f_d[2] | tlu_flush_ifu_f_dd[2] | thr2_sf_kill | 
                                 thr2_sf_kill_d | thr2_br_misp_no_match_f | thr2_kill_after_invalidation |
                                 thr2_kill_after_invalidation_d | thr2_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[2])| 
                                ((ftu_thr3_redirect_int_bf | agc_thr3_micro_flush_unq_c | tlu_flush_ifu_f[3] | load_flush_f[3] | 
                                 tlu_flush_ifu_f_d[3] | tlu_flush_ifu_f_dd[3] | thr3_sf_kill | 
                                 thr3_sf_kill_d | thr3_br_misp_no_match_f | thr3_kill_after_invalidation |
                                 thr3_kill_after_invalidation_d | thr3_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[3])| 
                                ((ftu_thr4_redirect_int_bf | agc_thr4_micro_flush_unq_c | tlu_flush_ifu_f[4] | load_flush_f[4] | 
                                 tlu_flush_ifu_f_d[4] | tlu_flush_ifu_f_dd[4] | thr4_sf_kill | 
                                 thr4_sf_kill_d | thr4_br_misp_no_match_f | thr4_kill_after_invalidation |
                                 thr4_kill_after_invalidation_d | thr4_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[4])| 
                                ((ftu_thr5_redirect_int_bf | agc_thr5_micro_flush_unq_c | tlu_flush_ifu_f[5] | load_flush_f[5] | 
                                 tlu_flush_ifu_f_d[5] | tlu_flush_ifu_f_dd[5] | thr5_sf_kill | 
                                 thr5_sf_kill_d | thr5_br_misp_no_match_f | thr5_kill_after_invalidation |
                                 thr5_kill_after_invalidation_d | thr5_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[5])| 
                                ((ftu_thr6_redirect_int_bf | agc_thr6_micro_flush_unq_c | tlu_flush_ifu_f[6] | load_flush_f[6] | 
                                 tlu_flush_ifu_f_d[6] | tlu_flush_ifu_f_dd[6] | thr6_sf_kill | 
                                 thr6_sf_kill_d | thr6_br_misp_no_match_f | thr6_kill_after_invalidation |
                                 thr6_kill_after_invalidation_d | thr6_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[6])| 
                                ((ftu_thr7_redirect_int_bf | agc_thr7_micro_flush_unq_c | tlu_flush_ifu_f[7] | load_flush_f[7] | 
                                 tlu_flush_ifu_f_d[7] | tlu_flush_ifu_f_dd[7] | thr7_sf_kill | 
                                 thr7_sf_kill_d | thr7_br_misp_no_match_f | thr7_kill_after_invalidation |
                                 thr7_kill_after_invalidation_d | thr7_exception_valid_kill_c2) & ftp_curr_fetch_thr_f[7])) ;
                            



assign next_br_misp_match = (br_taken_ff[0] & ~tid0_m[1] & ~tid0_m[0] & thr0_matches_curr_c) |
                            (br_taken_ff[0] & ~tid0_m[1] &  tid0_m[0] & thr1_matches_curr_c) |
                            (br_taken_ff[0] &  tid0_m[1] & ~tid0_m[0] & thr2_matches_curr_c) |
                            (br_taken_ff[0] &  tid0_m[1] &  tid0_m[0] & thr3_matches_curr_c) |
                            (br_taken_ff[1] & ~tid1_m[1] & ~tid1_m[0] & thr4_matches_curr_c) |
                            (br_taken_ff[1] & ~tid1_m[1] &  tid1_m[0] & thr5_matches_curr_c) |
                            (br_taken_ff[1] &  tid1_m[1] & ~tid1_m[0] & thr6_matches_curr_c) |
                            (br_taken_ff[1] &  tid1_m[1] &  tid1_m[0] & thr7_matches_curr_c) ;
  
assign next_br_misp_match_int = (br_taken_ff[0] & ~tid0_m[1] & ~tid0_m[0] & thr0_matches_curr_c) |
                                (br_taken_ff[0] & ~tid0_m[1] &  tid0_m[0] & thr1_matches_curr_c) |
                                (br_taken_ff[0] &  tid0_m[1] & ~tid0_m[0] & thr2_matches_curr_c) |
                                (br_taken_ff[0] &  tid0_m[1] &  tid0_m[0] & thr3_matches_curr_c) |
                                (br_taken_ff[1] & ~tid1_m[1] & ~tid1_m[0] & thr4_matches_curr_c) |
                                (br_taken_ff[1] & ~tid1_m[1] &  tid1_m[0] & thr5_matches_curr_c) |
                                (br_taken_ff[1] &  tid1_m[1] & ~tid1_m[0] & thr6_matches_curr_c) |
                                (br_taken_ff[1] &  tid1_m[1] &  tid1_m[0] & thr7_matches_curr_c) ;
  

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 kill_fetch_vc_reg  (
 .scan_in(kill_fetch_vc_reg_scanin),
 .scan_out(kill_fetch_vc_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (agc_kill_fetch_cv_f),
 .dout (kill_fetch_cv_c_unq),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 kill_fetch_vc_2_reg  (
 .scan_in(kill_fetch_vc_2_reg_scanin),
 .scan_out(kill_fetch_vc_2_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (agc_kill_fetch_cv_f),
 .dout (kill_fetch_cv_c_unq2),
  .siclk(siclk),
  .soclk(soclk));

assign exception_valid_kill_in = exception_valid_c & (curr_fetch_thr_c[7:0] == ftp_curr_fetch_thr_f[7:0]) ; 
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 exception_valid_kill_reg  (
 .scan_in(exception_valid_kill_reg_scanin),
 .scan_out(exception_valid_kill_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (exception_valid_kill_in),
 .dout (exception_valid_kill_c),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 exception_valid_kill1_reg  (
 .scan_in(exception_valid_kill1_reg_scanin),
 .scan_out(exception_valid_kill1_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  (exception_valid_kill_in),
 .dout (exception_valid_kill_int_c),
  .siclk(siclk),
  .soclk(soclk));

assign agc_kill_fetch_cv_c = kill_fetch_cv_c_unq | next_br_misp_match | exception_valid_kill_c;
assign agc_kill_fetch_cv_int1_c = kill_fetch_cv_c_unq2 | next_br_misp_match_int | exception_valid_kill_int_c;
assign agc_kill_fetch_cv_int2_c = kill_fetch_cv_c_unq2 | next_br_misp_match_int | exception_valid_kill_int_c;



assign thr0_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[0] & ~ftu_ibu_redirect_bf[0];
assign thr1_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[1] & ~ftu_ibu_redirect_bf[1];
assign thr2_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[2] & ~ftu_ibu_redirect_bf[2];
assign thr3_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[3] & ~ftu_ibu_redirect_bf[3];
assign thr4_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[4] & ~ftu_ibu_redirect_bf[4];
assign thr5_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[5] & ~ftu_ibu_redirect_bf[5];
assign thr6_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[6] & ~ftu_ibu_redirect_bf[6];
assign thr7_exception_valid_kill_in = exception_valid_c & curr_fetch_thr_c[7] & ~ftu_ibu_redirect_bf[7];

ifu_ftu_agc_ctl_msff_ctl_macro__width_16 thrx_exception_valid_kill_reg  (
 .scan_in(thrx_exception_valid_kill_reg_scanin),
 .scan_out(thrx_exception_valid_kill_reg_scanout),
 .l1clk( l1clk_pm1),
 .din  ({thr7_exception_valid_kill_in,thr6_exception_valid_kill_in,
         thr5_exception_valid_kill_in,thr4_exception_valid_kill_in,
         thr3_exception_valid_kill_in,thr2_exception_valid_kill_in,
         thr1_exception_valid_kill_in,thr0_exception_valid_kill_in,
         thr7_exception_valid_kill_c2_in, thr6_exception_valid_kill_c2_in, 
         thr5_exception_valid_kill_c2_in, thr4_exception_valid_kill_c2_in, 
         thr3_exception_valid_kill_c2_in, thr2_exception_valid_kill_c2_in, 
         thr1_exception_valid_kill_c2_in, thr0_exception_valid_kill_c2_in  
        }),
 .dout ({thr7_exception_valid_kill_c,thr6_exception_valid_kill_c,
         thr5_exception_valid_kill_c,thr4_exception_valid_kill_c,
         thr3_exception_valid_kill_c,thr2_exception_valid_kill_c,
         thr1_exception_valid_kill_c,thr0_exception_valid_kill_c, 
         thr7_exception_valid_kill_c2,thr6_exception_valid_kill_c2,
         thr5_exception_valid_kill_c2,thr4_exception_valid_kill_c2,
         thr3_exception_valid_kill_c2,thr2_exception_valid_kill_c2,
         thr1_exception_valid_kill_c2,thr0_exception_valid_kill_c2 
        }),
  .siclk(siclk),
  .soclk(soclk));

assign thr0_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[0] & ~ftu_thr0_redirect_bf;
assign thr1_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[1] & ~ftu_thr1_redirect_bf;
assign thr2_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[2] & ~ftu_thr2_redirect_bf;
assign thr3_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[3] & ~ftu_thr3_redirect_bf;
assign thr4_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[4] & ~ftu_thr4_redirect_bf;
assign thr5_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[5] & ~ftu_thr5_redirect_bf;
assign thr6_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[6] & ~ftu_thr6_redirect_bf;
assign thr7_exception_valid_kill_c2_in = exception_valid_c & curr_fetch_thr_c[7] & ~ftu_thr7_redirect_bf;

//////////////////////////////////////////////////////////////////////////////




assign ftu_thr0_redirect_int_bf = thr0_trap_pcaddr_is_valid_bf |  thr0_lsu_sync_bf ; 
assign ftu_thr1_redirect_int_bf = thr1_trap_pcaddr_is_valid_bf |  thr1_lsu_sync_bf ; 
assign ftu_thr2_redirect_int_bf = thr2_trap_pcaddr_is_valid_bf |  thr2_lsu_sync_bf ; 
assign ftu_thr3_redirect_int_bf = thr3_trap_pcaddr_is_valid_bf |  thr3_lsu_sync_bf ; 
assign ftu_thr4_redirect_int_bf = thr4_trap_pcaddr_is_valid_bf |  thr4_lsu_sync_bf ; 
assign ftu_thr5_redirect_int_bf = thr5_trap_pcaddr_is_valid_bf |  thr5_lsu_sync_bf ; 
assign ftu_thr6_redirect_int_bf = thr6_trap_pcaddr_is_valid_bf |  thr6_lsu_sync_bf ; 
assign ftu_thr7_redirect_int_bf = thr7_trap_pcaddr_is_valid_bf |  thr7_lsu_sync_bf ; 

assign agc_thr0_tlu_redirect_bf =  thr0_trap_pcaddr_is_valid_bf ;  
assign agc_thr1_tlu_redirect_bf =  thr1_trap_pcaddr_is_valid_bf ;  
assign agc_thr2_tlu_redirect_bf =  thr2_trap_pcaddr_is_valid_bf ;  
assign agc_thr3_tlu_redirect_bf =  thr3_trap_pcaddr_is_valid_bf ;  
assign agc_thr4_tlu_redirect_bf =  thr4_trap_pcaddr_is_valid_bf ;  
assign agc_thr5_tlu_redirect_bf =  thr5_trap_pcaddr_is_valid_bf ;  
assign agc_thr6_tlu_redirect_bf =  thr6_trap_pcaddr_is_valid_bf ;  
assign agc_thr7_tlu_redirect_bf =  thr7_trap_pcaddr_is_valid_bf ;  


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 thrx_redirect_reg  (
 .scan_in(thrx_redirect_reg_scanin),
 .scan_out(thrx_redirect_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({ftu_thr7_redirect_int_bf,ftu_thr6_redirect_int_bf,ftu_thr5_redirect_int_bf,ftu_thr4_redirect_int_bf,
         ftu_thr3_redirect_int_bf,ftu_thr2_redirect_int_bf,ftu_thr1_redirect_int_bf,ftu_thr0_redirect_int_bf}),
 .dout ({ftu_thr7_redirect_part_bf,ftu_thr6_redirect_part_bf,ftu_thr5_redirect_part_bf,ftu_thr4_redirect_part_bf,
         ftu_thr3_redirect_part_bf,ftu_thr2_redirect_part_bf,ftu_thr1_redirect_part_bf,ftu_thr0_redirect_part_bf}),
  .siclk(siclk),
  .soclk(soclk));

assign ftu_thr0_redirect_bf = ftu_thr0_redirect_part_bf | tlu_flush_ifu_f[0] | thr0_br_misp_f ;
assign ftu_thr1_redirect_bf = ftu_thr1_redirect_part_bf | tlu_flush_ifu_f[1] | thr1_br_misp_f ;
assign ftu_thr2_redirect_bf = ftu_thr2_redirect_part_bf | tlu_flush_ifu_f[2] | thr2_br_misp_f ;
assign ftu_thr3_redirect_bf = ftu_thr3_redirect_part_bf | tlu_flush_ifu_f[3] | thr3_br_misp_f ;
assign ftu_thr4_redirect_bf = ftu_thr4_redirect_part_bf | tlu_flush_ifu_f[4] | thr4_br_misp_f ;
assign ftu_thr5_redirect_bf = ftu_thr5_redirect_part_bf | tlu_flush_ifu_f[5] | thr5_br_misp_f ;
assign ftu_thr6_redirect_bf = ftu_thr6_redirect_part_bf | tlu_flush_ifu_f[6] | thr6_br_misp_f ;
assign ftu_thr7_redirect_bf = ftu_thr7_redirect_part_bf | tlu_flush_ifu_f[7] | thr7_br_misp_f ;


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 thrx_ibu_redirect_reg  (
 .scan_in(thrx_ibu_redirect_reg_scanin),
 .scan_out(thrx_ibu_redirect_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({ftu_thr7_redirect_int_bf,ftu_thr6_redirect_int_bf,ftu_thr5_redirect_int_bf,ftu_thr4_redirect_int_bf,
         ftu_thr3_redirect_int_bf,ftu_thr2_redirect_int_bf,ftu_thr1_redirect_int_bf,ftu_thr0_redirect_int_bf}),
 .dout ( to_ibu_redirect_part_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));


assign thr0_br_misp_no_match_f = (thr0_br_misp_f & ~(thr0_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr1_br_misp_no_match_f = (thr1_br_misp_f & ~(thr1_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr2_br_misp_no_match_f = (thr2_br_misp_f & ~(thr2_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr3_br_misp_no_match_f = (thr3_br_misp_f & ~(thr3_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr4_br_misp_no_match_f = (thr4_br_misp_f & ~(thr4_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr5_br_misp_no_match_f = (thr5_br_misp_f & ~(thr5_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr6_br_misp_no_match_f = (thr6_br_misp_f & ~(thr6_matches_curr_f & ftp_fetch_v_f & single_thread_active));
assign thr7_br_misp_no_match_f = (thr7_br_misp_f & ~(thr7_matches_curr_f & ftp_fetch_v_f & single_thread_active));

assign other_flushes_in[0] =  agc_thr0_micro_flush_unq_c | load_flush_f[0]  | thr0_sf_kill | 
                              thr0_sf_kill_d | tlu_flush_ifu_f[0] | tlu_flush_ifu_f_d[0] | tlu_flush_ifu_f_dd[0] | 
                              thr0_br_misp_no_match_f | 
                              thr0_kill_after_invalidation | thr0_kill_after_invalidation_d |
                              thr0_exception_valid_kill_c;
assign other_flushes_in[1] =  agc_thr1_micro_flush_unq_c | load_flush_f[1]  | thr1_sf_kill | 
                              thr1_sf_kill_d | tlu_flush_ifu_f[1] | tlu_flush_ifu_f_d[1] | tlu_flush_ifu_f_dd[1] | 
                              thr1_br_misp_no_match_f |
                              thr1_kill_after_invalidation | thr1_kill_after_invalidation_d  |
                              thr1_exception_valid_kill_c;
assign other_flushes_in[2] =  agc_thr2_micro_flush_unq_c | load_flush_f[2]  | thr2_sf_kill | 
                              thr2_sf_kill_d | tlu_flush_ifu_f[2] | tlu_flush_ifu_f_d[2] | tlu_flush_ifu_f_dd[2] | 
                              thr2_br_misp_no_match_f|
                              thr2_kill_after_invalidation | thr2_kill_after_invalidation_d  |
                              thr2_exception_valid_kill_c ;
assign other_flushes_in[3] =  agc_thr3_micro_flush_unq_c | load_flush_f[3]  | thr3_sf_kill | 
                              thr3_sf_kill_d | tlu_flush_ifu_f[3] | tlu_flush_ifu_f_d[3] | tlu_flush_ifu_f_dd[3] | 
                              thr3_br_misp_no_match_f|
                              thr3_kill_after_invalidation | thr3_kill_after_invalidation_d  |
                              thr3_exception_valid_kill_c ;
assign other_flushes_in[4] =  agc_thr4_micro_flush_unq_c | load_flush_f[4]  | thr4_sf_kill | 
                              thr4_sf_kill_d | tlu_flush_ifu_f[4] | tlu_flush_ifu_f_d[4] | tlu_flush_ifu_f_dd[4] | 
                              thr4_br_misp_no_match_f|
                              thr4_kill_after_invalidation | thr4_kill_after_invalidation_d  |
                              thr4_exception_valid_kill_c ;
assign other_flushes_in[5] =  agc_thr5_micro_flush_unq_c | load_flush_f[5]  | thr5_sf_kill | 
                              thr5_sf_kill_d | tlu_flush_ifu_f[5] | tlu_flush_ifu_f_d[5] | tlu_flush_ifu_f_dd[5] | 
                              thr5_br_misp_no_match_f|
                              thr5_kill_after_invalidation | thr5_kill_after_invalidation_d  |
                              thr5_exception_valid_kill_c ;
assign other_flushes_in[6] =  agc_thr6_micro_flush_unq_c | load_flush_f[6]  | thr6_sf_kill | 
                              thr6_sf_kill_d | tlu_flush_ifu_f[6] | tlu_flush_ifu_f_d[6] | tlu_flush_ifu_f_dd[6] | 
                              thr6_br_misp_no_match_f|
                              thr6_kill_after_invalidation | thr6_kill_after_invalidation_d  |
                              thr6_exception_valid_kill_c ;
assign other_flushes_in[7] =  agc_thr7_micro_flush_unq_c | load_flush_f[7]  | thr7_sf_kill | 
                              thr7_sf_kill_d | tlu_flush_ifu_f[7] | tlu_flush_ifu_f_d[7] | tlu_flush_ifu_f_dd[7] | 
                              thr7_br_misp_no_match_f|
                              thr7_kill_after_invalidation | thr7_kill_after_invalidation_d   |
                              thr7_exception_valid_kill_c;

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 other_flushes_reg  (
 .scan_in(other_flushes_reg_scanin),
 .scan_out(other_flushes_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (other_flushes_in[7:0]),
 .dout (other_flushes_del[7:0]),
  .siclk(siclk),
  .soclk(soclk));

assign ftu_ibu_redirect_bf[0] = to_ibu_redirect_part_bf[0] | tlu_flush_ifu_f[0] | other_flushes_del[0] | thr0_br_misp_f | thr0_exception_valid_kill_c ;
assign ftu_ibu_redirect_bf[1] = to_ibu_redirect_part_bf[1] | tlu_flush_ifu_f[1] | other_flushes_del[1] | thr1_br_misp_f | thr1_exception_valid_kill_c; 
assign ftu_ibu_redirect_bf[2] = to_ibu_redirect_part_bf[2] | tlu_flush_ifu_f[2] | other_flushes_del[2] | thr2_br_misp_f | thr2_exception_valid_kill_c;
assign ftu_ibu_redirect_bf[3] = to_ibu_redirect_part_bf[3] | tlu_flush_ifu_f[3] | other_flushes_del[3] | thr3_br_misp_f | thr3_exception_valid_kill_c; 
assign ftu_ibu_redirect_bf[4] = to_ibu_redirect_part_bf[4] | tlu_flush_ifu_f[4] | other_flushes_del[4] | thr4_br_misp_f | thr4_exception_valid_kill_c;
assign ftu_ibu_redirect_bf[5] = to_ibu_redirect_part_bf[5] | tlu_flush_ifu_f[5] | other_flushes_del[5] | thr5_br_misp_f | thr5_exception_valid_kill_c;
assign ftu_ibu_redirect_bf[6] = to_ibu_redirect_part_bf[6] | tlu_flush_ifu_f[6] | other_flushes_del[6] | thr6_br_misp_f | thr6_exception_valid_kill_c;
assign ftu_ibu_redirect_bf[7] = to_ibu_redirect_part_bf[7] | tlu_flush_ifu_f[7] | other_flushes_del[7] | thr7_br_misp_f | thr7_exception_valid_kill_c;

assign redirect_ibu_int_bf[0] = to_ibu_redirect_part_bf[0] | tlu_flush_ifu_f[0] | other_flushes_del[0] | thr0_br_misp_f | thr0_exception_valid_kill_c;
assign redirect_ibu_int_bf[1] = to_ibu_redirect_part_bf[1] | tlu_flush_ifu_f[1] | other_flushes_del[1] | thr1_br_misp_f | thr1_exception_valid_kill_c;
assign redirect_ibu_int_bf[2] = to_ibu_redirect_part_bf[2] | tlu_flush_ifu_f[2] | other_flushes_del[2] | thr2_br_misp_f | thr2_exception_valid_kill_c;
assign redirect_ibu_int_bf[3] = to_ibu_redirect_part_bf[3] | tlu_flush_ifu_f[3] | other_flushes_del[3] | thr3_br_misp_f | thr3_exception_valid_kill_c;
assign redirect_ibu_int_bf[4] = to_ibu_redirect_part_bf[4] | tlu_flush_ifu_f[4] | other_flushes_del[4] | thr4_br_misp_f | thr4_exception_valid_kill_c;
assign redirect_ibu_int_bf[5] = to_ibu_redirect_part_bf[5] | tlu_flush_ifu_f[5] | other_flushes_del[5] | thr5_br_misp_f | thr5_exception_valid_kill_c;
assign redirect_ibu_int_bf[6] = to_ibu_redirect_part_bf[6] | tlu_flush_ifu_f[6] | other_flushes_del[6] | thr6_br_misp_f | thr6_exception_valid_kill_c;
assign redirect_ibu_int_bf[7] = to_ibu_redirect_part_bf[7] | tlu_flush_ifu_f[7] | other_flushes_del[7] | thr7_br_misp_f | thr7_exception_valid_kill_c;




assign next_by_pass_sel_bbf[0] = cmu_thr0_data_ready;
assign next_by_pass_sel_bbf[1] = cmu_thr1_data_ready;
assign next_by_pass_sel_bbf[2] = cmu_thr2_data_ready;
assign next_by_pass_sel_bbf[3] = cmu_thr3_data_ready;
assign next_by_pass_sel_bbf[4] = cmu_thr4_data_ready;
assign next_by_pass_sel_bbf[5] = cmu_thr5_data_ready;
assign next_by_pass_sel_bbf[6] = cmu_thr6_data_ready;
assign next_by_pass_sel_bbf[7] = cmu_thr7_data_ready;

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 cmu_fill_byp_thread_reg  (
 .scan_in(cmu_fill_byp_thread_reg_scanin),
 .scan_out(cmu_fill_byp_thread_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_by_pass_sel_bbf[7:0]),
 .dout (agc_by_pass_sel_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 by_pass_thread_bf_reg  (
 .scan_in(by_pass_thread_bf_reg_scanin),
 .scan_out(by_pass_thread_bf_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_by_pass_sel_bbf[7:0]),
 .dout (by_pass_thread_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 by_pass_sel_f_reg  (
 .scan_in(by_pass_sel_f_reg_scanin),
 .scan_out(by_pass_sel_f_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (agc_by_pass_sel_bf[7:0]),
 .dout (agc_by_pass_sel_f[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 by_pass_sel_c_reg  (
 .scan_in(by_pass_sel_c_reg_scanin),
 .scan_out(by_pass_sel_c_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (agc_by_pass_sel_f[7:0]),
 .dout (by_pass_thread_c[7:0]),
  .siclk(siclk),
  .soclk(soclk));


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 by_pass_thread_f_reg  (
 .scan_in(by_pass_thread_f_reg_scanin),
 .scan_out(by_pass_thread_f_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (agc_by_pass_sel_bf[7:0]),
 .dout (by_pass_thread_f[7:0]),
  .siclk(siclk),
  .soclk(soclk));

 


ifu_ftu_agc_ctl_msff_ctl_macro__width_1 fetchalid_cnq_reg  (
 .scan_in(fetchalid_cnq_reg_scanin),
 .scan_out(fetchalid_cnq_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (ftp_fetch_v_f),
 .dout (agc_fetch_v_c_unq),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 fetch_v_dup_c_reg  (
 .scan_in(fetch_v_dup_c_reg_scanin),
 .scan_out(fetch_v_dup_c_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (ftp_fetch_v_f),
 .dout (agc_fetch_v_c_dup_unq),
  .siclk(siclk),
  .soclk(soclk));

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// Generate instruction bypass mux selects 
///////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
// Create signals that show which cycle the by_pass is possible.                   //
// NOTE: If previous by_pass occupies the slot which the new by_pass may take, it  //
//       has to be scheduled for the next available cycle (slot).                  //
/////////////////////////////////////////////////////////////////////////////////////
assign prev_by_pass_at_cycle_1 = agc_cycle_2_by_pass_ok_f | agc_cycle_3_by_pass_ok_c ;
assign prev_by_pass_at_cycle_2 = agc_cycle_3_by_pass_ok_f ;

assign agc_fetch_v_int_c = agc_fetch_v_c_unq & ~agc_kill_fetch_cv_int1_c ; 
assign agc_fetch_v_c = agc_fetch_v_c_unq  ; // & ~agc_kill_fetch_cv_c ;

assign agc_cycle_2_by_pass_ok_bf=  ((agc_fetch_v_c | prev_by_pass_at_cycle_1) & ~(ftp_fetch_v_f | prev_by_pass_at_cycle_2) & agc_by_pass_valid_bf);  
assign agc_cycle_3_by_pass_ok_bf=  ((agc_fetch_v_c | prev_by_pass_at_cycle_1)  &  (ftp_fetch_v_f | prev_by_pass_at_cycle_2)   & agc_by_pass_valid_bf) ;


// Cycle_2
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 cycle_2_by_pass_f_reg  (
  .scan_in(cycle_2_by_pass_f_reg_scanin),
  .scan_out(cycle_2_by_pass_f_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (agc_cycle_2_by_pass_ok_bf),
  .dout (agc_cycle_2_by_pass_ok_f),
  .siclk(siclk),
  .soclk(soclk));
 
// Cycle_3
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 cycle_3_by_pass_f_reg  (
  .scan_in(cycle_3_by_pass_f_reg_scanin),
  .scan_out(cycle_3_by_pass_f_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (agc_cycle_3_by_pass_ok_bf),
  .dout (agc_cycle_3_by_pass_ok_f),
  .siclk(siclk),
  .soclk(soclk));
 
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 cycle_3_by_pass_c_reg  (
  .scan_in(cycle_3_by_pass_c_reg_scanin),
  .scan_out(cycle_3_by_pass_c_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (agc_cycle_3_by_pass_ok_f),
  .dout (agc_cycle_3_by_pass_ok_c),
  .siclk(siclk),
  .soclk(soclk));



assign byp_valid_in = cmu_any_data_ready & ~( thr0_kill_by_pass_bbf |
                                              thr1_kill_by_pass_bbf |
                                              thr2_kill_by_pass_bbf |
                                              thr3_kill_by_pass_bbf |
                                              thr4_kill_by_pass_bbf |
                                              thr5_kill_by_pass_bbf |
                                              thr6_kill_by_pass_bbf |
                                              thr7_kill_by_pass_bbf ) ;
 
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 cmu_any_data_ready_reg  (
  .scan_in(cmu_any_data_ready_reg_scanin),
  .scan_out(cmu_any_data_ready_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (byp_valid_in),
  .dout (agc_byp_valid),
  .siclk(siclk),
  .soclk(soclk));

assign thr0_kill_by_pass_bbf = next_by_pass_sel_bbf[0] & (tsm_thr0_ignore_by_pass | ftu_thr0_redirect_bf) ;  
assign thr1_kill_by_pass_bbf = next_by_pass_sel_bbf[1] & (tsm_thr1_ignore_by_pass | ftu_thr1_redirect_bf) ;  
assign thr2_kill_by_pass_bbf = next_by_pass_sel_bbf[2] & (tsm_thr2_ignore_by_pass | ftu_thr2_redirect_bf) ;  
assign thr3_kill_by_pass_bbf = next_by_pass_sel_bbf[3] & (tsm_thr3_ignore_by_pass | ftu_thr3_redirect_bf) ;  
assign thr4_kill_by_pass_bbf = next_by_pass_sel_bbf[4] & (tsm_thr4_ignore_by_pass | ftu_thr4_redirect_bf) ;  
assign thr5_kill_by_pass_bbf = next_by_pass_sel_bbf[5] & (tsm_thr5_ignore_by_pass | ftu_thr5_redirect_bf) ;  
assign thr6_kill_by_pass_bbf = next_by_pass_sel_bbf[6] & (tsm_thr6_ignore_by_pass | ftu_thr6_redirect_bf) ;  
assign thr7_kill_by_pass_bbf = next_by_pass_sel_bbf[7] & (tsm_thr7_ignore_by_pass | ftu_thr7_redirect_bf) ;  

 ifu_ftu_agc_ctl_msff_ctl_macro__width_8 tsm_thrx_kill_by_pass_reg  (
  .scan_in(tsm_thrx_kill_by_pass_reg_scanin),
  .scan_out(tsm_thrx_kill_by_pass_reg_scanout),
  .l1clk( l1clk  ),
  .din  ({thr7_kill_by_pass_bbf,thr6_kill_by_pass_bbf,thr5_kill_by_pass_bbf,thr4_kill_by_pass_bbf,
          thr3_kill_by_pass_bbf,thr2_kill_by_pass_bbf,thr1_kill_by_pass_bbf,thr0_kill_by_pass_bbf}),
  .dout ({thr7_kill_by_pass_bf,thr6_kill_by_pass_bf,thr5_kill_by_pass_bf,thr4_kill_by_pass_bf,
          thr3_kill_by_pass_bf,thr2_kill_by_pass_bf,thr1_kill_by_pass_bf,thr0_kill_by_pass_bf}),
  .siclk(siclk),
  .soclk(soclk));

assign kill2_by_pass_bf  = (agc_by_pass_sel_bf[0] & ftu_thr0_redirect_bf) |
                           (agc_by_pass_sel_bf[1] & ftu_thr1_redirect_bf) |
                           (agc_by_pass_sel_bf[2] & ftu_thr2_redirect_bf) |
                           (agc_by_pass_sel_bf[3] & ftu_thr3_redirect_bf) |
                           (agc_by_pass_sel_bf[4] & ftu_thr4_redirect_bf) |
                           (agc_by_pass_sel_bf[5] & ftu_thr5_redirect_bf) |
                           (agc_by_pass_sel_bf[6] & ftu_thr6_redirect_bf) |
                           (agc_by_pass_sel_bf[7] & ftu_thr7_redirect_bf) ;

assign bypass_thread_killed = thr7_kill_by_pass_bf | thr6_kill_by_pass_bf | thr5_kill_by_pass_bf |
                              thr4_kill_by_pass_bf | thr3_kill_by_pass_bf | thr2_kill_by_pass_bf |
                              thr1_kill_by_pass_bf | thr0_kill_by_pass_bf | kill2_by_pass_bf     ;

assign agc_by_pass_valid_bf = agc_byp_valid & ~bypass_thread_killed ;


assign next_by_pass_f_valid = agc_by_pass_valid_bf ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 by_pass_v_f_reg  (
 .scan_in(by_pass_v_f_reg_scanin),
 .scan_out(by_pass_v_f_reg_scanout),
 .l1clk( l1clk_pm1  ),
 .din  (next_by_pass_f_valid),
 .dout (agc_by_pass_valid_unq_f),
  .siclk(siclk),
  .soclk(soclk));

assign agc_by_pass_valid_f = agc_by_pass_valid_unq_f & ~bypass_thread_redirected_p_f ; 
assign bypass_thread_redirected_p_f = ((ftu_thr0_redirect_bf) & agc_by_pass_sel_f[0]) |
                                      ((ftu_thr1_redirect_bf) & agc_by_pass_sel_f[1]) |
                                      ((ftu_thr2_redirect_bf) & agc_by_pass_sel_f[2]) |
                                      ((ftu_thr3_redirect_bf) & agc_by_pass_sel_f[3]) |
                                      ((ftu_thr4_redirect_bf) & agc_by_pass_sel_f[4]) |
                                      ((ftu_thr5_redirect_bf) & agc_by_pass_sel_f[5]) |
                                      ((ftu_thr6_redirect_bf) & agc_by_pass_sel_f[6]) |
                                      ((ftu_thr7_redirect_bf) & agc_by_pass_sel_f[7]) ;


assign bypass_thread_redirected_f = ((ftu_thr0_redirect_int_bf | ftu_thr0_redirect_bf) & agc_by_pass_sel_f[0]) |
                                    ((ftu_thr1_redirect_int_bf | ftu_thr1_redirect_bf) & agc_by_pass_sel_f[1]) |
                                    ((ftu_thr2_redirect_int_bf | ftu_thr2_redirect_bf) & agc_by_pass_sel_f[2]) |
                                    ((ftu_thr3_redirect_int_bf | ftu_thr3_redirect_bf) & agc_by_pass_sel_f[3]) |
                                    ((ftu_thr4_redirect_int_bf | ftu_thr4_redirect_bf) & agc_by_pass_sel_f[4]) |
                                    ((ftu_thr5_redirect_int_bf | ftu_thr5_redirect_bf) & agc_by_pass_sel_f[5]) |
                                    ((ftu_thr6_redirect_int_bf | ftu_thr6_redirect_bf) & agc_by_pass_sel_f[6]) |
                                    ((ftu_thr7_redirect_int_bf | ftu_thr7_redirect_bf) & agc_by_pass_sel_f[7]) ;

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the LRU for the fetching mechanism if by_pass is valid.                                      //
/////////////////////////////////////////////////////////////////////////////////////////////////////////
assign agc_by_pass_update_lru_bf[0]     = agc_by_pass_sel_bf[0] & agc_byp_valid & ~thr0_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[1]     = agc_by_pass_sel_bf[1] & agc_byp_valid & ~thr1_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[2]     = agc_by_pass_sel_bf[2] & agc_byp_valid & ~thr2_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[3]     = agc_by_pass_sel_bf[3] & agc_byp_valid & ~thr3_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[4]     = agc_by_pass_sel_bf[4] & agc_byp_valid & ~thr4_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[5]     = agc_by_pass_sel_bf[5] & agc_byp_valid & ~thr5_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[6]     = agc_by_pass_sel_bf[6] & agc_byp_valid & ~thr6_kill_by_pass_bf ;  
assign agc_by_pass_update_lru_bf[7]     = agc_by_pass_sel_bf[7] & agc_byp_valid & ~thr7_kill_by_pass_bf ;  


 
assign agc_sel_by_pass_cycle_2_f  = (agc_cycle_2_by_pass_ok_f  & agc_by_pass_valid_unq_f) ; 
assign agc_sel_by_pass_cycle_3_c  = (agc_cycle_3_by_pass_ok_c  & agc_by_pass_valid_c) ; 
 
 assign next_by_pass_c_valid = agc_by_pass_valid_f & ~bypass_thread_redirected_f ;
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 by_pass_v_c_reg  (
  .scan_in(by_pass_v_c_reg_scanin),
  .scan_out(by_pass_v_c_reg_scanout),
  .l1clk( l1clk_pm1  ),
  .din  (next_by_pass_c_valid),
  .dout (agc_by_pass_valid_c),
  .siclk(siclk),
  .soclk(soclk));
 
assign agc_sel_by_pass_cycle_2_int_f  = (agc_cycle_2_by_pass_ok_f  & agc_by_pass_valid_unq_f) ; 
assign agc_sel_by_pass_cycle_3_int_c  = (agc_cycle_3_by_pass_ok_c  & agc_by_pass_valid_c) ; 


assign agc_pc_sel_for_c[0] = agc_fetch_v_c ; 
assign agc_pc_sel_for_c[1] = ~agc_pc_sel_for_c[0]  & ~agc_pc_sel_for_c[2] & ~agc_pc_sel_for_c[3] ;
assign agc_pc_sel_for_c[2] = agc_sel_by_pass_cycle_2_int_f ;
assign agc_pc_sel_for_c[3] = agc_sel_by_pass_cycle_3_int_c ;


///////////////////////////////////////////////////////////////////////////////
// NOTE:
// Exceptions can happen during by_pass too (L2ECC errors)                   //
///////////////////////////////////////////////////////////////////////////////

assign agc_instr_bp_sel_c[0] =  agc_fetch_v_c_dup_unq  ; // & ~io_is_not_boot_rom_c; 
assign agc_instr_bp_sel_c[1] =  (!agc_fetch_v_c_dup_unq  &  agc_sel_by_pass_cycle_2_f ) ; 
assign agc_instr_bp_sel_c[2] =  (!agc_fetch_v_c_dup_unq  &  agc_sel_by_pass_cycle_3_c ) ; 

assign agc_bypass_selects[0] = (!agc_fetch_v_c_dup_unq  &  agc_byp_valid & !prev_by_pass_at_cycle_1 ) ; 
assign agc_bypass_selects[1] = (!agc_fetch_v_c_dup_unq  &  agc_sel_by_pass_cycle_2_f ) ; 
assign agc_bypass_selects[2] = (!agc_fetch_v_c_dup_unq  &  agc_sel_by_pass_cycle_3_c ) ; 


///////////////////////////////////////////////////////////////////////////////
// Generate the instruction valid signal for C stage.                        //
///////////////////////////////////////////////////////////////////////////////

assign by_pass_valid_instr_bf[3]  = cmu_instr_v[3] & ~sf_valid_by_pass_bf ;  
assign by_pass_valid_instr_bf[2]  = cmu_instr_v[2] & ~sf_valid_by_pass_bf ;  
assign by_pass_valid_instr_bf[1]  = cmu_instr_v[1] & ~sf_valid_by_pass_bf ; 
assign by_pass_valid_instr_bf[0]  = cmu_instr_v[0] ; 


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 by_pass_instr_v_f_reg  (
 .scan_in(by_pass_instr_v_f_reg_scanin),
 .scan_out(by_pass_instr_v_f_reg_scanout),
 .l1clk( l1clk_pm1  ),
 .din  (by_pass_valid_instr_bf[3:0]),
 .dout (by_pass_valid_instr_f[3:0]),
  .siclk(siclk),
  .soclk(soclk));


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 by_pass_instr_v_c_reg  (
 .scan_in(by_pass_instr_v_c_reg_scanin),
 .scan_out(by_pass_instr_v_c_reg_scanout),
 .l1clk( l1clk_pm1  ),
 .din  (by_pass_valid_instr_f[3:0]),
 .dout (by_pass_valid_instr_c[3:0]),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////
// Number of instructions valid can come from one of    //
// four source:                                         //
// 1-   Normal fetching                                 //
// 2-   By_pass in the first cycle when C stage is      //
//      empty when the data is recieved.                //
// 3-   By_pass in the second cycle when C stage is not //
//      empty but the F stage is.                       //
// 4-   By_pass in the third cycle when C and F stages  //
//      are not empty when the bypass data arrives.     //
//////////////////////////////////////////////////////////

assign ftu_instr_valid_c[0] = (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_valid_instr_bf[0]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_valid_instr_f[0]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_valid_instr_c[0]) | 
                              ( agc_fetch_v_c             & instr_0_v_q_c) ;  

assign ftu_instr_valid_c[1] = (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_valid_instr_bf[1]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_valid_instr_f[1]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_valid_instr_c[1]) | 
                              ( agc_fetch_v_c             & instr_1_v_q_c) ; 

assign ftu_instr_valid_c[2] = (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_valid_instr_bf[2]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_valid_instr_f[2]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_valid_instr_c[2]) | 
                              ( agc_fetch_v_c             & instr_2_v_q_c)  ; 

assign ftu_instr_valid_c[3] = (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_valid_instr_bf[3]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_valid_instr_f[3]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_valid_instr_c[3]) | 
                              ( agc_fetch_v_c             & instr_3_v_q_c) ; 

                                     
assign bus_3_is_first_in = ( ifu_agd_pc_f[3] &  ifu_agd_pc_f[2]) & ftp_fetch_v_f;
assign bus_2_is_first_in = ( ifu_agd_pc_f[3] & !ifu_agd_pc_f[2]) & ftp_fetch_v_f;
assign bus_1_is_first_in = (!ifu_agd_pc_f[3] &  ifu_agd_pc_f[2]) & ftp_fetch_v_f;
assign bus_0_is_first_in = (!ifu_agd_pc_f[3] & !ifu_agd_pc_f[2]) | ~ftp_fetch_v_f;

ifu_ftu_agc_ctl_msff_ctl_macro__width_4 bus_first_reg  (
 .scan_in(bus_first_reg_scanin),
 .scan_out(bus_first_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  ({bus_3_is_first_in,bus_2_is_first_in,bus_1_is_first_in,bus_0_is_first_in}),
 .dout ({ftu_bus_3_is_first,ftu_bus_2_is_first,ftu_bus_1_is_first,ftu_bus_0_is_first}),
  .siclk(siclk),
  .soclk(soclk));

assign ftu_fetch_thr_c[0] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[0]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[0]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[0]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[0]) ; 

assign ftu_fetch_thr_c[1] =   (!agc_fetch_v_c & agc_byp_valid &
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[1]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[1]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[1]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[1]) ; 

assign ftu_fetch_thr_c[2] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[2]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[2]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[2]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[2]) ; 

assign ftu_fetch_thr_c[3] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[3]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[3]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[3]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[3]) ; 

assign ftu_fetch_thr_c[4] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[4]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[4]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[4]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[4]) ; 

assign ftu_fetch_thr_c[5] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[5]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[5]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[5]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[5]) ; 

assign ftu_fetch_thr_c[6] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[6]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[6]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[6]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[6]) ; 

assign ftu_fetch_thr_c[7] =   (!agc_fetch_v_c & agc_byp_valid & 
                               !prev_by_pass_at_cycle_1   &  by_pass_thread_bf[7]) | 
                              ( agc_sel_by_pass_cycle_2_f & by_pass_thread_f[7]) | 
                              ( agc_sel_by_pass_cycle_3_c & by_pass_thread_c[7]) | 
                              ( agc_fetch_v_c             & curr_fetch_thr_c[7]) ; 

 
assign sf_valid_c         =   (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  sf_valid_by_pass_bf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & sf_valid_by_pass_f) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & sf_valid_by_pass_c) | 
                              ( agc_fetch_v_int_c           &  instr_sf_valid_c) | 
                              ( exception_valid_int_c       &  instr_sf_valid_c);

assign thr0_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr0_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr0_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr0_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr0_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr0_instr_kill_sf);
 
assign thr1_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr1_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr1_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr1_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr1_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr1_instr_kill_sf);
 
assign thr2_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr2_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr2_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr2_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr2_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr2_instr_kill_sf);
 
assign thr3_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr3_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr3_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr3_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr3_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr3_instr_kill_sf);
 
assign thr4_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr4_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr4_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr4_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr4_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr4_instr_kill_sf);
 
assign thr5_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr5_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr5_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr5_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr5_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr5_instr_kill_sf);
 
assign thr6_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr6_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr6_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr6_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr6_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr6_instr_kill_sf);
 
assign thr7_sf_kill         = (!exception_valid_int_c       & !agc_fetch_v_c & agc_byp_valid &!bypass_thread_killed & 
                               !prev_by_pass_at_cycle_1 &  thr7_byp_bf_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_2_int_f & thr7_byp_f_kill_sf) | 
                              (!exception_valid_int_c       &  agc_sel_by_pass_cycle_3_int_c & thr7_byp_c_kill_sf) | 
                              ( agc_fetch_v_int_c           & thr7_instr_kill_sf) | 
                              ( exception_valid_int_c       & thr7_instr_kill_sf);
 
 ifu_ftu_agc_ctl_msff_ctl_macro__width_8 thrx_sf_kill_reg  (
  .scan_in(thrx_sf_kill_reg_scanin),
  .scan_out(thrx_sf_kill_reg_scanout),
  .l1clk( l1clk                                                             ),
  .din  ({thr7_sf_kill,thr6_sf_kill,thr5_sf_kill,thr4_sf_kill,
          thr3_sf_kill,thr2_sf_kill,thr1_sf_kill,thr0_sf_kill}),
  .dout ({thr7_sf_kill_d,thr6_sf_kill_d,thr5_sf_kill_d,thr4_sf_kill_d,
          thr3_sf_kill_d,thr2_sf_kill_d,thr1_sf_kill_d,thr0_sf_kill_d}),
  .siclk(siclk),
  .soclk(soclk)) ;

assign thr0_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[0] & any_instr_v_q_c ;       
assign thr0_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[0]    & by_pass_valid_instr_bf[0] ;       
assign thr0_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[0]     & by_pass_valid_instr_f[0] ;       
assign thr0_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[0]     & by_pass_valid_instr_c[0] ;       


assign thr1_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[1] & any_instr_v_q_c ;       
assign thr1_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[1]    & by_pass_valid_instr_bf[0] ;       
assign thr1_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[1]     & by_pass_valid_instr_f[0] ;       
assign thr1_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[1]     & by_pass_valid_instr_c[0] ;       

assign thr2_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[2] & any_instr_v_q_c ;       
assign thr2_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[2]    & by_pass_valid_instr_bf[0] ;       
assign thr2_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[2]     & by_pass_valid_instr_f[0] ;       
assign thr2_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[2]     & by_pass_valid_instr_c[0] ;       

assign thr3_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[3] & any_instr_v_q_c ;       
assign thr3_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[3]    & by_pass_valid_instr_bf[0] ;       
assign thr3_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[3]     & by_pass_valid_instr_f[0] ;       
assign thr3_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[3]     & by_pass_valid_instr_c[0] ;       

assign thr4_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[4] & any_instr_v_q_c ;       
assign thr4_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[4]    & by_pass_valid_instr_bf[0] ;       
assign thr4_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[4]     & by_pass_valid_instr_f[0] ;       
assign thr4_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[4]     & by_pass_valid_instr_c[0] ;       


assign thr5_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[5] & any_instr_v_q_c ;       
assign thr5_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[5]    & by_pass_valid_instr_bf[0] ;       
assign thr5_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[5]     & by_pass_valid_instr_f[0] ;       
assign thr5_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[5]     & by_pass_valid_instr_c[0] ;       

assign thr6_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[6] & any_instr_v_q_c ;       
assign thr6_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[6]    & by_pass_valid_instr_bf[0] ;       
assign thr6_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[6]     & by_pass_valid_instr_f[0] ;       
assign thr6_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[6]     & by_pass_valid_instr_c[0] ;       

assign thr7_instr_kill_sf   = instr_sf_valid_c    & curr_fetch_thr_c[7] & any_instr_v_q_c ;       
assign thr7_byp_bf_kill_sf  = sf_valid_by_pass_bf & by_pass_thread_bf[7]    & by_pass_valid_instr_bf[0] ;       
assign thr7_byp_f_kill_sf   = sf_valid_by_pass_f  & by_pass_thread_f[7]     & by_pass_valid_instr_f[0] ;       
assign thr7_byp_c_kill_sf   = sf_valid_by_pass_c  & by_pass_thread_c[7]     & by_pass_valid_instr_c[0] ;       



///////////////////////////////////////////////////////////
// Generate the write enable for the V bits.             //
///////////////////////////////////////////////////////////
 ifu_ftu_agc_ctl_msff_ctl_macro__width_16 mbist_data_in_reg  (
  .scan_in(mbist_data_in_reg_scanin),
  .scan_out(mbist_data_in_reg_scanout),
  .l1clk( l1clk                                                             ),
  .din  ({mbi_addr[8:6], mbi_cmpsel[2:0],  mbi_run, mbi_icv_write_en,mbi_wdata[7:0]}),
  .dout ({mbi_bist_way_bf[2:0], mbi_bist_word_en_bf[2:0],  mbi_run_bf, mbi_icv_write_en_bf, mbi_wdata_bf[7:0]}),
  .siclk(siclk),
  .soclk(soclk));

 assign agc_fill_wrway_bf[2:0] = ({3{agc_data_ready_bf & !mbi_run_bf}} &  agc_cmu_fill_wrway_bf[2:0] ) |
                                 ({3{mbi_run_bf}} & mbi_bist_way_bf[2:0]) |
                                 ({3{(!agc_data_ready_bf & !mbi_run_bf)}} &  asi_way_bf[2:0] ) ;

 ifu_ftu_agc_ctl_msff_ctl_macro__width_3 cmu_fill_wrway_reg  (
  .scan_in(cmu_fill_wrway_reg_scanin),
  .scan_out(cmu_fill_wrway_reg_scanout),
  .l1clk( l1clk                                                             ),
  .din  (cmu_fill_wrway[2:0]),
  .dout (agc_cmu_fill_wrway_bf[2:0]),
  .siclk(siclk),
  .soclk(soclk));

 ifu_ftu_agc_ctl_msff_ctl_macro__width_3 asi_mbist_way_f_reg  (
  .scan_in(asi_mbist_way_f_reg_scanin),
  .scan_out(asi_mbist_way_f_reg_scanout),
  .l1clk( l1clk_pm1                                                             ),
  .din  (agc_fill_wrway_bf[2:0]),
  .dout (agc_asi_mbist_way_f[2:0]),
  .siclk(siclk),
  .soclk(soclk));


assign agc_sel_tg_data_f[0] = ~agc_asi_mbist_way_f[2] & ~agc_asi_mbist_way_f[1] & ~agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[1] = ~agc_asi_mbist_way_f[2] & ~agc_asi_mbist_way_f[1] &  agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[2] = ~agc_asi_mbist_way_f[2] &  agc_asi_mbist_way_f[1] & ~agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[3] = ~agc_asi_mbist_way_f[2] &  agc_asi_mbist_way_f[1] &  agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[4] =  agc_asi_mbist_way_f[2] & ~agc_asi_mbist_way_f[1] & ~agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[5] =  agc_asi_mbist_way_f[2] & ~agc_asi_mbist_way_f[1] &  agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[6] =  agc_asi_mbist_way_f[2] &  agc_asi_mbist_way_f[1] & ~agc_asi_mbist_way_f[0] ; 
assign agc_sel_tg_data_f[7] =  agc_asi_mbist_way_f[2] &  agc_asi_mbist_way_f[1] &  agc_asi_mbist_way_f[0] ; 

assign next_wrway_bbf[0]     = ~cmu_fill_wrway[2] & ~cmu_fill_wrway[1] & ~cmu_fill_wrway[0] ; 
assign next_wrway_bbf[1]     = ~cmu_fill_wrway[2] & ~cmu_fill_wrway[1] &  cmu_fill_wrway[0] ; 
assign next_wrway_bbf[2]     = ~cmu_fill_wrway[2] &  cmu_fill_wrway[1] & ~cmu_fill_wrway[0] ; 
assign next_wrway_bbf[3]     = ~cmu_fill_wrway[2] &  cmu_fill_wrway[1] &  cmu_fill_wrway[0] ; 
assign next_wrway_bbf[4]     =  cmu_fill_wrway[2] & ~cmu_fill_wrway[1] & ~cmu_fill_wrway[0] ; 
assign next_wrway_bbf[5]     =  cmu_fill_wrway[2] & ~cmu_fill_wrway[1] &  cmu_fill_wrway[0] ; 
assign next_wrway_bbf[6]     =  cmu_fill_wrway[2] &  cmu_fill_wrway[1] & ~cmu_fill_wrway[0] ; 
assign next_wrway_bbf[7]     =  cmu_fill_wrway[2] &  cmu_fill_wrway[1] &  cmu_fill_wrway[0] ; 

assign vl_data[1]        = (agc_sel_tg_data_f[0] & agd_itlb_valid_f[0] ) | 
                               (agc_sel_tg_data_f[1] & agd_itlb_valid_f[1] ) | 
                               (agc_sel_tg_data_f[2] & agd_itlb_valid_f[2] ) | 
                               (agc_sel_tg_data_f[3] & agd_itlb_valid_f[3] ) | 
                               (agc_sel_tg_data_f[4] & agd_itlb_valid_f[4] ) | 
                               (agc_sel_tg_data_f[5] & agd_itlb_valid_f[5] ) | 
                               (agc_sel_tg_data_f[6] & agd_itlb_valid_f[6] ) | 
                               (agc_sel_tg_data_f[7] & agd_itlb_valid_f[7] ) ; 

assign vl_data[0]        = (agc_sel_tg_data_f[0] & agd_itlb_valid_dupl_f[0] ) | 
                               (agc_sel_tg_data_f[1] & agd_itlb_valid_dupl_f[1] ) | 
                               (agc_sel_tg_data_f[2] & agd_itlb_valid_dupl_f[2] ) | 
                               (agc_sel_tg_data_f[3] & agd_itlb_valid_dupl_f[3] ) | 
                               (agc_sel_tg_data_f[4] & agd_itlb_valid_dupl_f[4] ) | 
                               (agc_sel_tg_data_f[5] & agd_itlb_valid_dupl_f[5] ) | 
                               (agc_sel_tg_data_f[6] & agd_itlb_valid_dupl_f[6] ) | 
                               (agc_sel_tg_data_f[7] & agd_itlb_valid_dupl_f[7] ) ; 

 ifu_ftu_agc_ctl_msff_ctl_macro__width_2 vl_data_reg  (
  .scan_in(vl_data_reg_scanin),
  .scan_out(vl_data_reg_scanout),
  .l1clk( l1clk_pm1                                                             ),
  .din  (vl_data[1:0]),
  .dout (agc_vl_data_c[1:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 itlb_valid_reg  (
 .scan_in(itlb_valid_reg_scanin),
 .scan_out(itlb_valid_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (agd_itlb_valid_f[7:0]),
 .dout (itlb_valid_c[7:0]),
  .siclk(siclk),
  .soclk(soclk));


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 itlb_valid_dupl_reg  (
 .scan_in(itlb_valid_dupl_reg_scanin),
 .scan_out(itlb_valid_dupl_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (agd_itlb_valid_dupl_f[7:0]),
 .dout (itlb_valid_dupl_c[7:0]),
  .siclk(siclk),
  .soclk(soclk));

assign va_hole_excp_extra = ~ifu_agd_pc_f[47] & (&ifu_agd_pc_f[46:5]) ;
assign next_va_hole_excp = (agd_va_hole_excp_f | va_hole_excp_extra) & ~agc_itb_bypass_f ;
 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 va_hole_excp_c_reg  (
  .scan_in(va_hole_excp_c_reg_scanin),
  .scan_out(va_hole_excp_c_reg_scanout),
  .l1clk( l1clk_pm1                                                             ),
  .din  (next_va_hole_excp),
  .dout (va_hole_excp_c),
  .siclk(siclk),
  .soclk(soclk));


assign inv_ack               =  |cmu_inval_ack[7:0] ; 
assign next_inv_way_bbf[0]     = (~cmu_icache_invalidate_way[2] & ~cmu_icache_invalidate_way[1] & ~cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[1]     = (~cmu_icache_invalidate_way[2] & ~cmu_icache_invalidate_way[1] &  cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[2]     = (~cmu_icache_invalidate_way[2] &  cmu_icache_invalidate_way[1] & ~cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[3]     = (~cmu_icache_invalidate_way[2] &  cmu_icache_invalidate_way[1] &  cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[4]     = ( cmu_icache_invalidate_way[2] & ~cmu_icache_invalidate_way[1] & ~cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[5]     = ( cmu_icache_invalidate_way[2] & ~cmu_icache_invalidate_way[1] &  cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[6]     = ( cmu_icache_invalidate_way[2] &  cmu_icache_invalidate_way[1] & ~cmu_icache_invalidate_way[0]) | inv_ack ; 
assign next_inv_way_bbf[7]     = ( cmu_icache_invalidate_way[2] &  cmu_icache_invalidate_way[1] &  cmu_icache_invalidate_way[0]) | inv_ack ; 

assign next_inv_way1_bbf[0]     = (~cmu_icache_inv_way1[2] & ~cmu_icache_inv_way1[1] & ~cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[1]     = (~cmu_icache_inv_way1[2] & ~cmu_icache_inv_way1[1] &  cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[2]     = (~cmu_icache_inv_way1[2] &  cmu_icache_inv_way1[1] & ~cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[3]     = (~cmu_icache_inv_way1[2] &  cmu_icache_inv_way1[1] &  cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[4]     = ( cmu_icache_inv_way1[2] & ~cmu_icache_inv_way1[1] & ~cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[5]     = ( cmu_icache_inv_way1[2] & ~cmu_icache_inv_way1[1] &  cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[6]     = ( cmu_icache_inv_way1[2] &  cmu_icache_inv_way1[1] & ~cmu_icache_inv_way1[0]) | inv_ack ; 
assign next_inv_way1_bbf[7]     = ( cmu_icache_inv_way1[2] &  cmu_icache_inv_way1[1] &  cmu_icache_inv_way1[0]) | inv_ack ; 

assign asi_way_dec_bf[0]       = ~asi_way_bf[2]  & ~asi_way_bf[1]  & ~asi_way_bf[0] ;
assign asi_way_dec_bf[1]       = ~asi_way_bf[2]  & ~asi_way_bf[1]  &  asi_way_bf[0] ;
assign asi_way_dec_bf[2]       = ~asi_way_bf[2]  &  asi_way_bf[1]  & ~asi_way_bf[0] ;
assign asi_way_dec_bf[3]       = ~asi_way_bf[2]  &  asi_way_bf[1]  &  asi_way_bf[0] ;
assign asi_way_dec_bf[4]       =  asi_way_bf[2]  & ~asi_way_bf[1]  & ~asi_way_bf[0] ;
assign asi_way_dec_bf[5]       =  asi_way_bf[2]  & ~asi_way_bf[1]  &  asi_way_bf[0] ;
assign asi_way_dec_bf[6]       =  asi_way_bf[2]  &  asi_way_bf[1]  & ~asi_way_bf[0] ;
assign asi_way_dec_bf[7]       =  asi_way_bf[2]  &  asi_way_bf[1]  &  asi_way_bf[0] ;

//////////////// Address staging /////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 addr_bit_5_bf_reg  (
 .scan_in(addr_bit_5_bf_reg_scanin),
 .scan_out(addr_bit_5_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (fill_paddr_bit_5),
 .dout (phys_addr_bit_5_bf),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 inv_bit_5_bf_reg  (
 .scan_in(inv_bit_5_bf_reg_scanin),
 .scan_out(inv_bit_5_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (inv_paddr_bit_5),
 .dout (inv_addr_bit_5_bf),
  .siclk(siclk),
  .soclk(soclk));

assign  inv_or_phys_addr_bit_5_bf = ( agc_inv_line_bf & inv_addr_bit_5_bf) |
                                    (~agc_inv_line_bf & ftp_fill_req_q_bf & phys_addr_bit_5_bf) |
                                    (~agc_inv_line_bf & ftp_asi_tg_wr_req_hold  & asi_addr_bf[6] & ~ftp_fill_req_q_bf) ;  

//////////////// Write way staging /////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_8 wrway_bf_reg  (
 .scan_in(wrway_bf_reg_scanin),
 .scan_out(wrway_bf_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_wrway_bbf[7:0]),
 .dout (wrway_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 inv_way_bf_reg  (
 .scan_in(inv_way_bf_reg_scanin),
 .scan_out(inv_way_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (next_inv_way_bbf[7:0]),
 .dout (inv_way_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 inv_way1_bf_reg  (
 .scan_in(inv_way1_bf_reg_scanin),
 .scan_out(inv_way1_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (next_inv_way1_bbf[7:0]),
 .dout (inv_way1_bf[7:0]),
  .siclk(siclk),
  .soclk(soclk));

assign  inv_or_wrway_bf[7:0] =      ({8{ agc_inv_line_bf  & ~ftp_fill_req_q_bf     }} &  inv_way_bf[7:0]) |
                                    ({8{~agc_inv_line_bf  &  ftp_fill_req_q_bf     }} & wrway_bf[7:0]) |
                                    ({8{~agc_inv_line_bf  & ~ftp_fill_req_q_bf & ftp_asi_tg_wr_req_hold}} & asi_way_dec_bf[7:0]) ;  

assign  way1_inv[7:0]        = agc_evic_line_bf ? inv_way1_bf[7:0] : 8'b0 ;

assign agc_icv_wren_bf[31:0]  = ({32{ inv_or_phys_addr_bit_5_bf & !mbi_run_bf}} &  {inv_or_wrway_bf[7:0],8'b0,inv_or_wrway_bf[7:0],8'b0}) |
                                ({32{~inv_or_phys_addr_bit_5_bf & !mbi_run_bf}} &  {way1_inv[7:0], inv_or_wrway_bf[7:0],way1_inv[7:0],inv_or_wrway_bf[7:0] }) |
                                ({32{ mbi_run_bf}}                &  32'hFFFFFFFF) ; 
//////////////// Invalidate staging /////////////////////////////////////////
assign next_inv_line = cmu_icache_invalidate | inv_ack ;
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 inv_line_bf_reg  (
 .scan_in(inv_line_bf_reg_scanin),
 .scan_out(inv_line_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (next_inv_line),
 .dout (agc_inv_line_bf),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 evic_line_bf_reg  (
 .scan_in(evic_line_bf_reg_scanin),
 .scan_out(evic_line_bf_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (cmu_evic_invalidate),
 .dout (agc_evic_line_bf),
  .siclk(siclk),
  .soclk(soclk));

assign icv_wrdata[1]  = ftp_fill_req_q_bf |
                        (asi_vl_arr_data[1] & ~agc_inv_line_bf  & ftp_asi_tg_wr_req_hold ) ;

assign icv_wrdata[0]  = ftp_fill_req_q_bf |
                        (asi_vl_arr_data[0] & ~agc_inv_line_bf  & ftp_asi_tg_wr_req_hold) ;

assign agc_icv_wrdata_bf[31:0] = mbi_run_bf ? {mbi_wdata_bf[7:0],mbi_wdata_bf[7:0],mbi_wdata_bf[7:0],mbi_wdata_bf[7:0]} : 
                                              {{8{icv_wrdata[0]}},{8{icv_wrdata[0]}},{8{icv_wrdata[1]}},{8{icv_wrdata[1]}}}  ;
assign agc_icv_wr_req_bf = (~mbi_run_bf & (ftp_fill_req_q_bf | agc_inv_line_bf | ftp_asi_tg_wr_req_hold)) |
                           ( mbi_run_bf &  mbi_icv_write_en_bf) ;
///////////////////////////////////////////////////////////
// Generate duplicate miss reset signal from WOB bits.   //
///////////////////////////////////////////////////////////
assign next_data_ready_bbf = cmu_any_data_ready & ~cmu_any_un_cacheable    ;
                       
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 data_ready_bf_reg  (
 .scan_in(data_ready_bf_reg_scanin),
 .scan_out(data_ready_bf_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_data_ready_bbf),
 .dout (agc_data_ready_bf),
  .siclk(siclk),
  .soclk(soclk));



ifu_ftu_agc_ctl_msff_ctl_macro__width_5 l2_cache_miss_in_reg  (
 .scan_in(l2_cache_miss_in_reg_scanin),
 .scan_out(l2_cache_miss_in_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ({l1_miss_in,l2_miss_in,l2_err_corr_in,l2_err_ucorr_in,l2_err_ndata_in}),
 .dout ({l1_cache_1_miss,l2_cache_1_miss,l2_err_corr_1_ff,l2_err_ucorr_1_ff,l2_err_ndata_1_ff}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_5 l2_cache_miss_1_reg  (
 .scan_in(l2_cache_miss_1_reg_scanin),
 .scan_out(l2_cache_miss_1_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ({l1_cache_1_miss,l2_cache_1_miss,l2_err_corr_1_ff,l2_err_ucorr_1_ff,l2_err_ndata_1_ff}),
 .dout ({l1_cache_2_miss,l2_cache_2_miss,l2_err_corr_2_ff,l2_err_ucorr_2_ff,l2_err_ndata_2_ff}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_5 l2_cache_miss_2_reg  (
 .scan_in(l2_cache_miss_2_reg_scanin),
 .scan_out(l2_cache_miss_2_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ({l1_cache_2_miss,l2_cache_2_miss,l2_err_corr_2_ff,l2_err_ucorr_2_ff,l2_err_ndata_2_ff}),
 .dout ({l1_cache_3_miss,l2_cache_3_miss,l2_err_corr_3_ff,l2_err_ucorr_3_ff,l2_err_ndata_3_ff}),
  .siclk(siclk),
  .soclk(soclk));

assign precise_en_bp_in    =  (ceter_pscce_ff[0] & next_by_pass_sel_bbf[0]) | 
                              (ceter_pscce_ff[1] & next_by_pass_sel_bbf[1]) | 
                              (ceter_pscce_ff[2] & next_by_pass_sel_bbf[2]) | 
                              (ceter_pscce_ff[3] & next_by_pass_sel_bbf[3]) | 
                              (ceter_pscce_ff[4] & next_by_pass_sel_bbf[4]) | 
                              (ceter_pscce_ff[5] & next_by_pass_sel_bbf[5]) | 
                              (ceter_pscce_ff[6] & next_by_pass_sel_bbf[6]) | 
                              (ceter_pscce_ff[7] & next_by_pass_sel_bbf[7]) ; 

assign l2_err_corr_in      = ~cmu_l2_err[1] &  cmu_l2_err[0] & cerer_icl2c_ff;
assign l2_err_ucorr_in     =  cmu_l2_err[1] & ~cmu_l2_err[0] &  precise_en_bp_in & cerer_icl2u_ff;
assign l2_err_ndata_in     =  cmu_l2_err[1] &  cmu_l2_err[0] &  precise_en_bp_in & cerer_icl2nd_ff;
assign l2_miss_in          =  cmu_l2miss    & ~l2_err_corr_in & ~l2_err_ucorr_in & ~l2_err_ndata_in ;
assign l1_miss_in          = ~cmu_l2miss    & ~l2_err_corr_in & ~l2_err_ucorr_in & ~l2_err_ndata_in ; 

assign l2_ucorr_err_byp_1  =  agc_bypass_selects[0] & l2_err_ucorr_1_ff; 
assign l2_ucorr_err_byp_2  =  agc_bypass_selects[1] & l2_err_ucorr_2_ff; 
assign l2_ucorr_err_byp_3  =  agc_bypass_selects[2] & l2_err_ucorr_3_ff; 
assign l2_ucorr_err        =  l2_ucorr_err_byp_1 | l2_ucorr_err_byp_2 | l2_ucorr_err_byp_3 ;

assign l2_corr_err_byp_1  =  agc_bypass_selects[0] & l2_err_corr_1_ff; 
assign l2_corr_err_byp_2  =  agc_bypass_selects[1] & l2_err_corr_2_ff; 
assign l2_corr_err_byp_3  =  agc_bypass_selects[2] & l2_err_corr_3_ff; 
assign l2_corr_err        =  l2_corr_err_byp_1 | l2_corr_err_byp_2 | l2_corr_err_byp_3 ;

assign l2_ndata_err_byp_1  =  agc_bypass_selects[0] & l2_err_ndata_1_ff; 
assign l2_ndata_err_byp_2  =  agc_bypass_selects[1] & l2_err_ndata_2_ff; 
assign l2_ndata_err_byp_3  =  agc_bypass_selects[2] & l2_err_ndata_3_ff; 
assign l2_ndata_err        =  l2_ndata_err_byp_1 | l2_ndata_err_byp_2 | l2_ndata_err_byp_3 ;

assign l2_cache_miss_byp_1 = agc_bypass_selects[0] & l2_cache_1_miss;
assign l2_cache_miss_byp_2 = agc_bypass_selects[1] & l2_cache_2_miss ;
assign l2_cache_miss_byp_3 = agc_bypass_selects[2] & l2_cache_3_miss ;

assign l2_cache_miss = l2_cache_miss_byp_1   | l2_cache_miss_byp_2   | l2_cache_miss_byp_3 ;
assign l1_cache_miss = (agc_bypass_selects[0] & l1_cache_1_miss) |
                       (agc_bypass_selects[1] & l1_cache_2_miss) | 
                       (agc_bypass_selects[2] & l1_cache_3_miss) ;





/////////////////////////////////////////////////////////////////////////////
// Cache miss signals.                                                   //
///////////////////////////////////////////////////////////////////////////

assign itb_cmiss_c = ~itb_chit_c | agc_ic_disable_thr_c;
assign itb_itb_miss_c = ~itb_cam_hit_c;


assign agc_itb_cmiss_c_q     =  itb_cmiss_c & agc_fetch_v_c     & ~itb_itb_miss_c & ~ic_valid_err_no_priority & 
                               ~va_hole_excp_c & ~itb_itb_acc_viol_c & ~invalidation_req_c &  
                               ~(itb_tag_perr & cerer_ittp_ff) & ~(itb_tte_data_parity & agc_fetch_v_c_unq & cerer_itdp_ff) &
                                ~(agc_tag_perror_c & cerer_ictp_ff) & ~(tlb_nfo & itb_cam_hit_c) & ~itb_mhit_en_c; 

assign agc_qualify_cmiss     = ~itb_itb_miss_c & ~ic_valid_err_no_priority & ~va_hole_excp_c & ~itb_itb_acc_viol_c  & ~invalidation_req_c &
                                ~(itb_tag_perr & cerer_ittp_ff)  & 
                                ~(itb_tte_data_parity & agc_fetch_v_c_unq & cerer_itdp_ff) & 
                                ~(agc_tag_perror_c & cerer_ictp_ff) & ~(tlb_nfo & itb_cam_hit_c) & ~itb_mhit_en_c;  




assign agc_thr0_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[0]  & agc_fetch_v_int_c ; 
assign agc_thr1_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[1]  & agc_fetch_v_int_c; 
assign agc_thr2_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[2]  & agc_fetch_v_int_c; 
assign agc_thr3_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[3]  & agc_fetch_v_int_c; 
assign agc_thr4_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[4]  & agc_fetch_v_int_c; 
assign agc_thr5_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[5]  & agc_fetch_v_int_c; 
assign agc_thr6_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[6]  & agc_fetch_v_int_c; 
assign agc_thr7_micro_flush_unq_c =  (itb_cmiss_c | invalidation_req_c) & 
                                      curr_fetch_thr_c[7]  & agc_fetch_v_int_c; 

assign thr0_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[0]  & agc_fetch_v_int_c ; 
assign thr1_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[1]  & agc_fetch_v_int_c ; 
assign thr2_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[2]  & agc_fetch_v_int_c ; 
assign thr3_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[3]  & agc_fetch_v_int_c ; 
assign thr4_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[4]  & agc_fetch_v_int_c ; 
assign thr5_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[5]  & agc_fetch_v_int_c ; 
assign thr6_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[6]  & agc_fetch_v_int_c ; 
assign thr7_replay_pc   = (itb_cmiss_c | invalidation_req_c) & curr_fetch_thr_c[7]  & agc_fetch_v_int_c ; 

assign agc_thr0_reset_sf_c = agc_thr0_micro_flush_unq_c ; 
assign agc_thr1_reset_sf_c = agc_thr1_micro_flush_unq_c ; 
assign agc_thr2_reset_sf_c = agc_thr2_micro_flush_unq_c ; 
assign agc_thr3_reset_sf_c = agc_thr3_micro_flush_unq_c ; 
assign agc_thr4_reset_sf_c = agc_thr4_micro_flush_unq_c ; 
assign agc_thr5_reset_sf_c = agc_thr5_micro_flush_unq_c ; 
assign agc_thr6_reset_sf_c = agc_thr6_micro_flush_unq_c ; 
assign agc_thr7_reset_sf_c = agc_thr7_micro_flush_unq_c ; 


assign agc_thr0_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[0] & ~redirect_ibu_int_bf[0]; 
assign agc_thr1_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[1] & ~redirect_ibu_int_bf[1]; 
assign agc_thr2_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[2] & ~redirect_ibu_int_bf[2]; 
assign agc_thr3_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[3] & ~redirect_ibu_int_bf[3]; 
assign agc_thr4_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[4] & ~redirect_ibu_int_bf[4]; 
assign agc_thr5_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[5] & ~redirect_ibu_int_bf[5]; 
assign agc_thr6_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[6] & ~redirect_ibu_int_bf[6]; 
assign agc_thr7_cmiss_stm_c = agc_itb_cmiss_c_q & curr_fetch_thr_c[7] & ~redirect_ibu_int_bf[7]; 

assign thr0_unc_is_valid    = agc_thr0_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr1_unc_is_valid    = agc_thr1_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr2_unc_is_valid    = agc_thr2_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr3_unc_is_valid    = agc_thr3_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr4_unc_is_valid    = agc_thr4_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr5_unc_is_valid    = agc_thr5_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr6_unc_is_valid    = agc_thr6_cmiss_stm_c & agc_thrx_un_cacheable ;
assign thr7_unc_is_valid    = agc_thr7_cmiss_stm_c & agc_thrx_un_cacheable ;


///////////////////////////////////////////////////////////////////////
// Generate which instructions are valid and to be sent to the IB.   //
///////////////////////////////////////////////////////////////////////
assign bus_0_valid_f = (~ifu_agd_pc_f[4] &  ifu_agd_pc_f[3] & ~instr_sf_valid_f & ~invalidation_req_f)  |
                     (~ifu_agd_pc_f[4] & ~ifu_agd_pc_f[3] &  ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f)  |
                     (~ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~invalidation_req_f) ;

assign bus_1_valid_f = (~ifu_agd_pc_f[3] &  ifu_agd_pc_f[2] & ~invalidation_req_f)  |
                     (~ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f)  |
                     (~ifu_agd_pc_f[4] &  ifu_agd_pc_f[3] & ~instr_sf_valid_f & ~invalidation_req_f) ;

assign bus_2_valid_f = ( ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~invalidation_req_f)  |
                     (~ifu_agd_pc_f[3] &  ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) |
                     (~ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) |
                     (~ifu_agd_pc_f[4] &  ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) ;

assign bus_3_valid_f = ( ifu_agd_pc_f[3] &  ifu_agd_pc_f[2]  & ~invalidation_req_f) |
                     ( ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) |
                     (~ifu_agd_pc_f[3] &  ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) |
                     (~ifu_agd_pc_f[3] & ~ifu_agd_pc_f[2] & ~instr_sf_valid_f & ~invalidation_req_f) ;


ifu_ftu_agc_ctl_msff_ctl_macro__width_4 ic_instr_v_reg  (
 .scan_in(ic_instr_v_reg_scanin),
 .scan_out(ic_instr_v_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  ({bus_3_valid_f,bus_2_valid_f,bus_1_valid_f,bus_0_valid_f}),
 .dout ({bus_3_valid_c,bus_2_valid_c,bus_1_valid_c,bus_0_valid_c}),
  .siclk(siclk),
  .soclk(soclk));

assign next_any_instr_v_c = bus_3_valid_f | bus_2_valid_f | bus_1_valid_f | bus_0_valid_f ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 any_instr_v_c_reg  (
 .scan_in(any_instr_v_c_reg_scanin),
 .scan_out(any_instr_v_c_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  (next_any_instr_v_c),
 .dout (any_instr_v_c),
  .siclk(siclk),
  .soclk(soclk));

assign any_instr_v_q_c =  any_instr_v_c & ~itb_cmiss_c & agc_fetch_v_c ;

assign agc_itb_itb_miss_c_q        = itb_itb_miss_c & agc_fetch_v_c_dup_unq & ~va_hole_excp_c & ~invalidation_req_c;
assign agc_itb_itb_miss_c_int_q    = itb_itb_miss_c & agc_fetch_v_int_c     & ~va_hole_excp_c & ~invalidation_req_c;

assign exception_valid_c            = agc_itb_itb_miss_c_q          | ((itb_itb_acc_viol_no_priority   | va_hole_exception_c  | 
                                      nfo_tlb_exception_no_priority | tag_perror_no_priority           | itb_mhit_no_priority | 
                                      tte_tag_parity_no_priority    | ic_valid_err_no_priority         | tag_multiple_hit_no_priority | 
                                      tte_data_parity_no_priority   ) & agc_fetch_v_c_dup_unq ); 

assign ftu_exception_valid_c        = agc_itb_itb_miss_c_q          | ((itb_itb_acc_viol_no_priority   | va_hole_exception_c  | 
                                      nfo_tlb_exception_no_priority | tag_perror_no_priority           | itb_mhit_no_priority | 
                                      tte_tag_parity_no_priority    | ic_valid_err_no_priority         | tag_multiple_hit_no_priority | 
                                      tte_data_parity_no_priority   ) & agc_fetch_v_c_dup_unq ); 
assign exception_valid_int_c    = agc_itb_itb_miss_c_int_q | itb_itb_acc_viol_int_c | va_hole_exception_int_c; 

assign instr_3_v_q_c = (bus_3_valid_c & ~itb_cmiss_c & agc_fetch_v_c) ;  
assign instr_2_v_q_c = (bus_2_valid_c & ~itb_cmiss_c & agc_fetch_v_c) ;  
assign instr_1_v_q_c = (bus_1_valid_c & ~itb_cmiss_c & agc_fetch_v_c) ; 
assign instr_0_v_q_c = (bus_0_valid_c & ~itb_cmiss_c & agc_fetch_v_c) ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_16 hpstate_reg  (
 .scan_in(hpstate_reg_scanin),
 .scan_out(hpstate_reg_scanout),
 .l1clk( l1clk ),
 .din  ({tlu_ifu_hpstate_hpriv[7:0], tlu_ifu_pstate_priv[7:0]}),
 .dout ({hpstate_hpriv_ff[7:0], pstate_priv_ff[7:0]}),
  .siclk(siclk),
  .soclk(soclk));

assign next_priv_state = ftp_fetch_v_f & ( 
                  (ftp_curr_fetch_thr_f[0] & (hpstate_hpriv_ff[0] | pstate_priv_ff[0])) |   
                  (ftp_curr_fetch_thr_f[1] & (hpstate_hpriv_ff[1] | pstate_priv_ff[1])) |   
                  (ftp_curr_fetch_thr_f[2] & (hpstate_hpriv_ff[2] | pstate_priv_ff[2])) |   
                  (ftp_curr_fetch_thr_f[3] & (hpstate_hpriv_ff[3] | pstate_priv_ff[3])) |   
                  (ftp_curr_fetch_thr_f[4] & (hpstate_hpriv_ff[4] | pstate_priv_ff[4])) |   
                  (ftp_curr_fetch_thr_f[5] & (hpstate_hpriv_ff[5] | pstate_priv_ff[5])) |   
                  (ftp_curr_fetch_thr_f[6] & (hpstate_hpriv_ff[6] | pstate_priv_ff[6])) |   
                  (ftp_curr_fetch_thr_f[7] & (hpstate_hpriv_ff[7] | pstate_priv_ff[7])) )  ;  

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 priv_state_c_reg  (
 .scan_in(priv_state_c_reg_scanin),
 .scan_out(priv_state_c_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  (next_priv_state),
 .dout (agc_priv_state_c),
  .siclk(siclk),
  .soclk(soclk));



///////////////////////////////////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_6 tlb_parity_reg  (
 .scan_in(tlb_parity_reg_scanin),
 .scan_out(tlb_parity_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({itd_prty_256m,itd_prty_4m,itd_prty_64k,itd_prty_8k, itd_prty_ctxt0,itd_prty_ctxt1}),
 .dout ({prty_256m_c,prty_4m_c,prty_64k_c,prty_8k_c, prty_ctxt0_c,prty_ctxt1_c}),
  .siclk(siclk),
  .soclk(soclk)) ;


///////////////////////
// TLB errors
// Code from LSU
// 
// Resolve TLB tag parity error here.  Select the proper parity bit based
// on the page size and compare it to the stored parity.
// 
 assign prty_ctxt = tlb_context0_hit ? prty_ctxt0_c : prty_ctxt1_c;
 
 assign tag_parity_gen = (( tlb_pgsize[2] &                               prty_256m_c) |
                      (~tlb_pgsize[2] &  tlb_pgsize[1] &                  prty_4m_c) |
                      (~tlb_pgsize[2] & ~tlb_pgsize[1] &  tlb_pgsize[0] & prty_64k_c) |
                      (~tlb_pgsize[2] & ~tlb_pgsize[1] & ~tlb_pgsize[0] & prty_8k_c)) ^
                     ( prty_ctxt & ~agc_itc_real_c);
 
 
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 itlb_cam_vld_c_reg  (
 .scan_in(itlb_cam_vld_c_reg_scanin),
 .scan_out(itlb_cam_vld_c_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  (ftp_itlb_cam_vld_f),
 .dout (itlb_cam_vld_c),
  .siclk(siclk),
  .soclk(soclk));

 




/////////////////////////////////////////////////////////////////
// no exception                  = 00000                       //
// tlb_miss (non-real)           = 00001                       //
// tlb_access_violation          = 00010                       //
// VA hole exception             = 00011                       //
// tlb real miss                 = 00100                       //
// L2 MISS (for PMU)             = 00101                       //
// IC MISS (for PMU)             = 00110                       // 
// ITLB tag parity error         = 00111                       //
// ITLB data parity error        = 11111                       //
// ITLB multiple hit             = 01001                       //
// icache valid (parity error)   = 01010                       //
// icache tag parity error       = 01011                       //
// icache tag multiple hit       = 01100                       //
// icache L2 correctable error   = 01110                       //
// icache L2 uncorrectable error = 01111                       //
// icache L2 NotData error       = 10000                       //
// ITLB NFO excp                 = 10001                       //
// Real VA hole exception        = 10011                       //
/////////////////////////////////////////////////////////////////
// New codes added for fetching from I/O space that is not     //
// boot-rom area. Also added code points for l2_miss and errors//
// together to more accurately count l2_miss in PMU.           //
// The new codes were chosen in such a way to minimize         //
// changes to existing testbenches and testcases.              //
// not boot rom fetch            = 10100 (Not-taken)           //
// L2 miss and correctable error = 11110                       //
// L2 miss and uncorrectable err = 10111                       //
// L2 miss and Notdata error     = 11000                       //
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////
ifu_ftu_agc_ctl_msff_ctl_macro__width_9 cerer_en_reg  (
 .scan_in(cerer_en_reg_scanin),
 .scan_out(cerer_en_reg_scanout),
 .l1clk( l1clk ),
 .din  ({tlu_cerer_ittp  ,tlu_cerer_itdp,tlu_cerer_ittm,tlu_cerer_icl2c,tlu_cerer_icl2u,
         tlu_cerer_icl2nd,tlu_cerer_icvp,tlu_cerer_ictp,tlu_cerer_ictm }),
 .dout ({cerer_ittp_ff  ,cerer_itdp_ff,cerer_ittm_ff,cerer_icl2c_ff,cerer_icl2u_ff,
         cerer_icl2nd_ff,cerer_icvp_ff,cerer_ictp_ff,cerer_ictm_ff }),
  .siclk(siclk),
  .soclk(soclk));

assign agc_itb_tag_perr_c   = itlb_cam_vld_c & (tag_parity_gen  ^ itb_tte_tag_parity) & agc_fetch_v_c_unq;
assign itb_tag_perr         = itlb_cam_vld_c & (tag_parity_gen  ^ itb_tte_tag_parity) & agc_fetch_v_c_unq;

/// Exception generation ////////////////////////////////////////////////////////
assign itb_mhit_en_c           = itb_itb_mhit_c      & cerer_ittm_ff          & ~va_hole_exception_c &  agc_fetch_v_c_dup_unq & 
                                 ~invalidation_req_c ;
assign tte_tag_parity_en_c     = itb_tag_perr        & cerer_ittp_ff          & ~itb_itb_miss_c      & ~itb_mhit_en_c & 
                                 ~va_hole_exception_c & agc_fetch_v_c_dup_unq & ~invalidation_req_c ; 
assign tte_data_parity_en_c    = itb_tte_data_parity & cerer_itdp_ff          & ~tte_tag_parity_en_c & ~itb_mhit_en_c & 
                                 agc_fetch_v_c_unq   & itb_cam_hit_c          & ~va_hole_exception_c  & ~invalidation_req_c ;
assign itb_itb_acc_viol_c      = itb_tte_p_c         & agc_fetch_v_c_dup_unq  & ~agc_priv_state_c    & ~itb_itb_miss_c & 
                                ~invalidation_req_c  & ~va_hole_excp_c        & ~itb_mhit_en_c       & ~tte_tag_parity_en_c ; 
assign itb_itb_acc_viol_int_c  = itb_tte_p_c         & agc_fetch_v_int_c      & ~agc_priv_state_c    & ~itb_itb_miss_c & 
                                ~invalidation_req_c  & ~va_hole_excp_c        & ~itb_mhit_en_c       & ~tte_tag_parity_en_c ; 
assign nfo_tlb_exception       = tlb_nfo             & itb_cam_hit_c          & agc_fetch_v_c_dup_unq &  
                                ~invalidation_req_c  & ~va_hole_excp_c        & ~(itb_tte_p_c        & ~agc_priv_state_c) & 
                                ~itb_mhit_en_c       & ~tte_tag_parity_en_c   ;
assign ic_valid_err_c_en       = ic_valid_err_c      & cerer_icvp_ff          & ~invalidation_req_c  & agc_fetch_v_c_unq  & ~va_hole_exception_c  &
                                ~itb_mhit_en_c       & ~tte_tag_parity_en_c   & ~itb_itb_acc_viol_c  & 
                                ~nfo_tlb_exception   & itb_cam_hit_c         ;
assign tag_perror_en_c         = agc_tag_perror_c    & cerer_ictp_ff          & ~invalidation_req_c  &  agc_fetch_v_c_unq    & 
                                ~va_hole_exception_c & ~ic_valid_err_c_en     & ~itb_mhit_en_c       & ~tte_tag_parity_en_c  & 
                                ~itb_itb_acc_viol_c  & ~nfo_tlb_exception     &  itb_cam_hit_c       ;
assign tag_multiple_hit_en     = ic_tag_multiple_hit & cerer_ictm_ff          & ~invalidation_req_c  & agc_fetch_v_c_unq     & 
                                ~ic_valid_err_c_en   & ~va_hole_exception_c   & ~tag_perror_en_c     & agc_ic_enable_thr_c   &
                                ~itb_mhit_en_c       & ~tte_tag_parity_en_c   & ~itb_itb_acc_viol_c  & ~nfo_tlb_exception    & itb_cam_hit_c ;
assign l2_ucorr_err_en         = l2_ucorr_err        & cerer_icl2u_ff  ;
assign l2_corr_err_en          = l2_corr_err         & cerer_icl2c_ff  ;
assign l2_ndata_err_en         = l2_ndata_err        & cerer_icl2nd_ff ;

assign ftu_ic_no_err_c                = l2_ucorr_err_en | l2_ndata_err_en | agc_fetch_v_c_dup_unq;

assign l2_cache_miss_no_error      = l2_cache_miss & ~l2_ucorr_err_en & ~l2_corr_err_en & ~l2_ndata_err_en ;
assign l2_uncorr_err_en_no_l2_miss = l2_ucorr_err  &  cerer_icl2u_ff  & ~l2_cache_miss ; 

assign l2_cache_miss_n_corr        = l2_cache_miss &  l2_corr_err_en ;
assign l2_cache_miss_n_uncorr      = l2_cache_miss &  l2_ucorr_err_en ;
assign l2_cache_miss_n_ndata       = l2_cache_miss &  l2_ndata_err_en ;

// NFO is lower priority than access (privilege violation)

assign ftu_instr_exceptions_c[0] = (agc_itb_itb_miss_c_q & ~agc_itc_real_c_q) | va_hole_exception_c | l2_cache_miss_no_error      | tte_tag_parity_en_c |
                                     itb_mhit_en_c        | tag_perror_en_c     | l2_ucorr_err_en   | nfo_tlb_exception |
                                     tte_data_parity_en_c ; 

assign ftu_instr_exceptions_c[1] = itb_itb_acc_viol_c   | va_hole_exception_c | l1_cache_miss      | tte_tag_parity_en_c |
                                   ic_valid_err_c_en    | tag_perror_en_c     | l2_corr_err_en     | l2_ucorr_err_en     |
                                   tte_data_parity_en_c   ; 

assign ftu_instr_exceptions_c[2] = agc_itc_real_c_q     | l2_cache_miss_no_error      | l1_cache_miss     | tte_tag_parity_en_c  |
                                   tag_multiple_hit_en  | l2_corr_err_en     | l2_ucorr_err_en   | 
                                   tte_data_parity_en_c  ; 

assign ftu_instr_exceptions_c[3] = tte_data_parity_en_c  | itb_mhit_en_c    | ic_valid_err_c_en     | tag_perror_en_c | 
                                   tag_multiple_hit_en   | l2_corr_err_en   | l2_uncorr_err_en_no_l2_miss       | 
                                   tag_perror_en_c       | l2_cache_miss_n_ndata ;  
 
assign ftu_instr_exceptions_c[4] =  tte_data_parity_en_c | l2_ndata_err_en  | nfo_tlb_exception | va_hole_exception_c_r | 
                                    l2_cache_miss_n_uncorr | l2_cache_miss_n_corr ; 


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

assign way_sel_all_but_0   = |itb_icd_waysel_c[7:1] ;
assign way_sel_all_but_1   = (|itb_icd_waysel_c[7:2]) | itb_icd_waysel_c[0] ;
assign way_sel_all_but_2   = (|itb_icd_waysel_c[7:3]) | (|itb_icd_waysel_c[1:0]) ;
assign way_sel_all_but_3   = (|itb_icd_waysel_c[7:4]) | (|itb_icd_waysel_c[2:0]) ;
assign way_sel_all_but_4   = (|itb_icd_waysel_c[7:5]) | (|itb_icd_waysel_c[3:0]) ;
assign way_sel_all_but_5   = (|itb_icd_waysel_c[7:6]) | (|itb_icd_waysel_c[4:0]) ;
assign way_sel_all_but_6   =  itb_icd_waysel_c[7]     | (|itb_icd_waysel_c[5:0]) ;
assign way_sel_all_but_7   = |itb_icd_waysel_c[6:0] ;

assign ic_tag_multiple_hit = (itb_icd_waysel_c[0] & way_sel_all_but_0) |
                             (itb_icd_waysel_c[1] & way_sel_all_but_1) |
                             (itb_icd_waysel_c[2] & way_sel_all_but_2) |
                             (itb_icd_waysel_c[3] & way_sel_all_but_3) |
                             (itb_icd_waysel_c[4] & way_sel_all_but_4) |
                             (itb_icd_waysel_c[5] & way_sel_all_but_5) |
                             (itb_icd_waysel_c[6] & way_sel_all_but_6) |
                             (itb_icd_waysel_c[7] & way_sel_all_but_7) ;

assign va_hole_exception_c     = va_hole_excp_c & agc_fetch_v_c_dup_unq & ~invalidation_req_c ;
assign va_hole_exception_int_c = va_hole_excp_c & agc_fetch_v_int_c     & ~invalidation_req_c;

/////////////////////////////////////////////////////////////////
// TLB_MISS per thread
/////////////////////////////////////////////////////////////////
assign agc_thr0_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[0] & ~redirect_ibu_int_bf[0] ; 
assign agc_thr1_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[1] & ~redirect_ibu_int_bf[1] ; 
assign agc_thr2_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[2] & ~redirect_ibu_int_bf[2] ; 
assign agc_thr3_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[3] & ~redirect_ibu_int_bf[3] ; 
assign agc_thr4_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[4] & ~redirect_ibu_int_bf[4] ; 
assign agc_thr5_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[5] & ~redirect_ibu_int_bf[5] ; 
assign agc_thr6_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[6] & ~redirect_ibu_int_bf[6] ; 
assign agc_thr7_itb_miss_c = agc_itb_itb_miss_c_q & curr_fetch_thr_c[7] & ~redirect_ibu_int_bf[7] ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_2 itc_real_f_reg  (
 .scan_in(itc_real_f_reg_scanin),
 .scan_out(itc_real_f_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  ({itc_real_bf,itc_bypass_bf}),
 .dout ({agc_itc_real_f,agc_itb_bypass_f}),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 itc_real_c_reg  (
 .scan_in(itc_real_c_reg_scanin),
 .scan_out(itc_real_c_reg_scanout),
 .l1clk( l1clk_pm1 ),
 .din  (agc_itc_real_f),
 .dout (agc_itc_real_c),
  .siclk(siclk),
  .soclk(soclk));

assign agc_itc_real_c_q = agc_itc_real_c & agc_fetch_v_c & agc_itb_itb_miss_c_q ;
assign va_hole_exception_c_r = va_hole_exception_c & agc_itc_real_c  ;


assign agc_sel_inv_index[0] = ~agc_inv_line_bf & ftp_fill_req_q_bf & ~mbi_run_bf; 
assign agc_sel_inv_index[1] =  agc_inv_line_bf & ~mbi_run_bf & ~ftp_fill_req_q_bf; 
assign agc_sel_inv_index[2] =  ~agc_inv_line_bf & ftp_asi_tg_wr_req_hold & ~mbi_run_bf & ~ftp_fill_req_q_bf;
assign agc_sel_inv_index[3] =  mbi_run_bf ; 

assign agc_thr0_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b000);
assign agc_thr0_cntx_0_sel[1] = ~agc_thr0_cntx_0_sel[0] ; 
assign agc_thr1_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b001);
assign agc_thr1_cntx_0_sel[1] = ~agc_thr1_cntx_0_sel[0] ; 
assign agc_thr2_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b010);
assign agc_thr2_cntx_0_sel[1] = ~agc_thr2_cntx_0_sel[0] ; 
assign agc_thr3_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b011);
assign agc_thr3_cntx_0_sel[1] = ~agc_thr3_cntx_0_sel[0] ; 
assign agc_thr4_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b100);
assign agc_thr4_cntx_0_sel[1] = ~agc_thr4_cntx_0_sel[0] ; 
assign agc_thr5_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b101);
assign agc_thr5_cntx_0_sel[1] = ~agc_thr5_cntx_0_sel[0] ; 
assign agc_thr6_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b110);
assign agc_thr6_cntx_0_sel[1] = ~agc_thr6_cntx_0_sel[0] ; 
assign agc_thr7_cntx_0_sel[0] = lsu_ifu_wr_p0ctxt & (lsu_ifu_tid_w[2:0] == 3'b111);
assign agc_thr7_cntx_0_sel[1] = ~agc_thr7_cntx_0_sel[0] ; 

assign agc_thr0_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b000);
assign agc_thr0_cntx_1_sel[1] = ~agc_thr0_cntx_1_sel[0] ; 
assign agc_thr1_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b001);
assign agc_thr1_cntx_1_sel[1] = ~agc_thr1_cntx_1_sel[0] ; 
assign agc_thr2_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b010);
assign agc_thr2_cntx_1_sel[1] = ~agc_thr2_cntx_1_sel[0] ; 
assign agc_thr3_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b011);
assign agc_thr3_cntx_1_sel[1] = ~agc_thr3_cntx_1_sel[0] ; 
assign agc_thr4_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b100);
assign agc_thr4_cntx_1_sel[1] = ~agc_thr4_cntx_1_sel[0] ; 
assign agc_thr5_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b101);
assign agc_thr5_cntx_1_sel[1] = ~agc_thr5_cntx_1_sel[0] ; 
assign agc_thr6_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b110);
assign agc_thr6_cntx_1_sel[1] = ~agc_thr6_cntx_1_sel[0] ; 
assign agc_thr7_cntx_1_sel[0] = lsu_ifu_wr_p1ctxt & (lsu_ifu_tid_w[2:0] == 3'b111);
assign agc_thr7_cntx_1_sel[1] = ~agc_thr7_cntx_1_sel[0] ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_16 cntx_sel_reg  (
 .scan_in(cntx_sel_reg_scanin),
 .scan_out(cntx_sel_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({agc_thr0_cntx_0_sel[0], agc_thr0_cntx_1_sel[0],
         agc_thr1_cntx_0_sel[0], agc_thr1_cntx_1_sel[0],
         agc_thr2_cntx_0_sel[0], agc_thr2_cntx_1_sel[0],
         agc_thr3_cntx_0_sel[0], agc_thr3_cntx_1_sel[0],
         agc_thr4_cntx_0_sel[0], agc_thr4_cntx_1_sel[0],
         agc_thr5_cntx_0_sel[0], agc_thr5_cntx_1_sel[0],
         agc_thr6_cntx_0_sel[0], agc_thr6_cntx_1_sel[0],
         agc_thr7_cntx_0_sel[0], agc_thr7_cntx_1_sel[0]}),

 .dout ({agc_thr0_cntx_0_sel_ff, agc_thr0_cntx_1_sel_ff,
         agc_thr1_cntx_0_sel_ff, agc_thr1_cntx_1_sel_ff,
         agc_thr2_cntx_0_sel_ff, agc_thr2_cntx_1_sel_ff,
         agc_thr3_cntx_0_sel_ff, agc_thr3_cntx_1_sel_ff,
         agc_thr4_cntx_0_sel_ff, agc_thr4_cntx_1_sel_ff,
         agc_thr5_cntx_0_sel_ff, agc_thr5_cntx_1_sel_ff,
         agc_thr6_cntx_0_sel_ff, agc_thr6_cntx_1_sel_ff,
         agc_thr7_cntx_0_sel_ff, agc_thr7_cntx_1_sel_ff}),
  .siclk(siclk),
  .soclk(soclk));


assign agc_thrx_un_cacheable = ftu_paddr_unq_39  ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 lsu_no_icm_reg  (
 .scan_in(lsu_no_icm_reg_scanin),
 .scan_out(lsu_no_icm_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (lsu_ifu_no_miss[7:0]),
 .dout ({agc_thr7_lsu_no_ic_miss,agc_thr6_lsu_no_ic_miss,agc_thr5_lsu_no_ic_miss,agc_thr4_lsu_no_ic_miss,
         agc_thr3_lsu_no_ic_miss,agc_thr2_lsu_no_ic_miss,agc_thr1_lsu_no_ic_miss,agc_thr0_lsu_no_ic_miss}),
  .siclk(siclk),
  .soclk(soclk));





ifu_ftu_agc_ctl_msff_ctl_macro__width_8 ic_enable_reg  (
 .scan_in(ic_enable_reg_scanin),
 .scan_out(ic_enable_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  (lsu_ic_enable[7:0]),
 .dout (agc_icache_enable[7:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

assign next_ic_enable_thr_c =  |(agc_icache_enable[7:0] & ftp_curr_fetch_thr_f[7:0] ) ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 thr_c_ic_enable_reg  (
 .scan_in(thr_c_ic_enable_reg_scanin),
 .scan_out(thr_c_ic_enable_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_ic_enable_thr_c),
 .dout (agc_ic_enable_thr_c),
  .siclk(siclk),
  .soclk(soclk)) ;

assign next_ic_enable_thr_c_l = ~next_ic_enable_thr_c;
ifu_ftu_agc_ctl_msff_ctl_macro__width_1 thr_c_ic_disable_reg  (
 .scan_in(thr_c_ic_disable_reg_scanin),
 .scan_out(thr_c_ic_disable_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (next_ic_enable_thr_c_l),
 .dout (agc_ic_disable_thr_c),
  .siclk(siclk),
  .soclk(soclk)) ;





assign ic_valid_err_unq = (itlb_valid_dupl_c[7:0] != itlb_valid_c[7:0] ) ; 
assign ic_valid_err_c = ic_valid_err_unq & ~agc_ic_disable_thr_c ;


ifu_ftu_agc_ctl_msff_ctl_macro__width_8 dff_8b_prty_7   (
        .scan_in(dff_8b_prty_7_scanin),
        .scan_out(dff_8b_prty_7_scanout),
        .l1clk(l1clk_out                ),
	.din	({err_w7_8b_parity_f[3:0],err_w6_8b_parity_f[3:0]}),
	.dout	({w7_8b_parity_c[3:0],w6_8b_parity_c[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 dff_8b_prty_5   (
        .scan_in(dff_8b_prty_5_scanin),
        .scan_out(dff_8b_prty_5_scanout),
        .l1clk(l1clk_out                ),
	.din	({err_w5_8b_parity_f[3:0],err_w4_8b_parity_f[3:0]}),
	.dout	({w5_8b_parity_c[3:0],w4_8b_parity_c[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 dff_8b_prty_3   (
        .scan_in(dff_8b_prty_3_scanin),
        .scan_out(dff_8b_prty_3_scanout),
        .l1clk(l1clk_out                ),
	.din	({err_w3_8b_parity_f[3:0],err_w2_8b_parity_f[3:0]}),
	.dout	({w3_8b_parity_c[3:0],w2_8b_parity_c[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 dff_8b_prty_1   (
        .scan_in(dff_8b_prty_1_scanin),
        .scan_out(dff_8b_prty_1_scanout),
        .l1clk(l1clk_out                ),
	.din	({err_w1_8b_parity_f[3:0],err_w0_8b_parity_f[3:0]}),
	.dout	({w1_8b_parity_c[3:0],w0_8b_parity_c[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


assign err_tag_w0_parity_c = ^(w0_8b_parity_c[3:0]);
assign err_tag_w1_parity_c = ^(w1_8b_parity_c[3:0]);
assign err_tag_w2_parity_c = ^(w2_8b_parity_c[3:0]);
assign err_tag_w3_parity_c = ^(w3_8b_parity_c[3:0]);
assign err_tag_w4_parity_c = ^(w4_8b_parity_c[3:0]);
assign err_tag_w5_parity_c = ^(w5_8b_parity_c[3:0]);
assign err_tag_w6_parity_c = ^(w6_8b_parity_c[3:0]);
assign err_tag_w7_parity_c = ^(w7_8b_parity_c[3:0]);


assign agc_tag_pe_c[0] = err_tag_w0_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[0];
assign agc_tag_pe_c[1] = err_tag_w1_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[1];
assign agc_tag_pe_c[2] = err_tag_w2_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[2];
assign agc_tag_pe_c[3] = err_tag_w3_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[3];
assign agc_tag_pe_c[4] = err_tag_w4_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[4];
assign agc_tag_pe_c[5] = err_tag_w5_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[5];
assign agc_tag_pe_c[6] = err_tag_w6_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[6];
assign agc_tag_pe_c[7] = err_tag_w7_parity_c & agc_ic_enable_thr_c & agc_fetch_v_c & itlb_valid_c[7];



assign ftu_thr0_inv_req_c = invalidation_req_c & curr_fetch_thr_c[0] & ~tsm_thr0_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr1_inv_req_c = invalidation_req_c & curr_fetch_thr_c[1] & ~tsm_thr1_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr2_inv_req_c = invalidation_req_c & curr_fetch_thr_c[2] & ~tsm_thr2_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr3_inv_req_c = invalidation_req_c & curr_fetch_thr_c[3] & ~tsm_thr3_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr4_inv_req_c = invalidation_req_c & curr_fetch_thr_c[4] & ~tsm_thr4_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr5_inv_req_c = invalidation_req_c & curr_fetch_thr_c[5] & ~tsm_thr5_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr6_inv_req_c = invalidation_req_c & curr_fetch_thr_c[6] & ~tsm_thr6_no_new_miss & agc_fetch_v_int_c;
assign ftu_thr7_inv_req_c = invalidation_req_c & curr_fetch_thr_c[7] & ~tsm_thr7_no_new_miss & agc_fetch_v_int_c;

assign agc_tag_perror_c = |agc_tag_pe_c[7:0] ;



assign itb_mhit_no_priority          = itb_itb_mhit_c      & cerer_ittm_ff & ~invalidation_req_c ; 
assign tte_tag_parity_no_priority    = itb_tag_perr        & cerer_ittp_ff &  itb_cam_hit_c    & ~itb_itb_mhit_c & ~invalidation_req_c ; 
assign tte_data_parity_no_priority   = itb_tte_data_parity & cerer_itdp_ff &  itb_cam_hit_c    & ~itb_itb_mhit_c & ~invalidation_req_c ; 
assign itb_itb_acc_viol_no_priority  = itb_tte_p_c         & ~agc_priv_state_c    & ~itb_itb_miss_c & ~invalidation_req_c & ~itb_itb_mhit_c; 
assign nfo_tlb_exception_no_priority = tlb_nfo             & itb_cam_hit_c          & ~invalidation_req_c   & ~itb_itb_mhit_c; 
assign ic_valid_err_no_priority      = ic_valid_err_c      & cerer_icvp_ff          & ~invalidation_req_c   & ~itb_itb_mhit_c & itb_cam_hit_c;
assign tag_perror_no_priority        = agc_tag_perror_c    & cerer_ictp_ff          & ~invalidation_req_c   &  itb_cam_hit_c ;
assign tag_multiple_hit_no_priority  = ic_tag_multiple_hit & cerer_ictm_ff          & ~invalidation_req_c   &  agc_ic_enable_thr_c & itb_cam_hit_c ;



assign err_excp_set =      itb_mhit_no_priority     | va_hole_exception_c           | nfo_tlb_exception_no_priority   |
                           tag_perror_no_priority   | itb_itb_acc_viol_no_priority  | tte_tag_parity_no_priority      | 
                           ic_valid_err_no_priority | tag_multiple_hit_no_priority  | tte_data_parity_no_priority     ;

assign agc_thr0_err_detect_c = err_excp_set  & curr_fetch_thr_c[0] & agc_fetch_v_int_c;
assign agc_thr1_err_detect_c = err_excp_set  & curr_fetch_thr_c[1] & agc_fetch_v_int_c;
assign agc_thr2_err_detect_c = err_excp_set  & curr_fetch_thr_c[2] & agc_fetch_v_int_c;
assign agc_thr3_err_detect_c = err_excp_set  & curr_fetch_thr_c[3] & agc_fetch_v_int_c;
assign agc_thr4_err_detect_c = err_excp_set  & curr_fetch_thr_c[4] & agc_fetch_v_int_c;
assign agc_thr5_err_detect_c = err_excp_set  & curr_fetch_thr_c[5] & agc_fetch_v_int_c;
assign agc_thr6_err_detect_c = err_excp_set  & curr_fetch_thr_c[6] & agc_fetch_v_int_c;
assign agc_thr7_err_detect_c = err_excp_set  & curr_fetch_thr_c[7] & agc_fetch_v_int_c;

assign asi_mbist_addr_bf[5:3] = mbi_run_bf ? mbi_bist_word_en_bf[2:0] : asi_addr_bf[5:3] ;

assign word_en_asi[0]      = ~asi_addr_bf[5] & ~asi_addr_bf[4] & ~asi_addr_bf[3] ;
assign word_en_asi[1]      = ~asi_addr_bf[5] & ~asi_addr_bf[4] &  asi_addr_bf[3] ;
assign word_en_asi[2]      = ~asi_addr_bf[5] &  asi_addr_bf[4] & ~asi_addr_bf[3] ;
assign word_en_asi[3]      = ~asi_addr_bf[5] &  asi_addr_bf[4] &  asi_addr_bf[3] ;
assign word_en_asi[4]      =  asi_addr_bf[5] & ~asi_addr_bf[4] & ~asi_addr_bf[3] ;
assign word_en_asi[5]      =  asi_addr_bf[5] & ~asi_addr_bf[4] &  asi_addr_bf[3] ;
assign word_en_asi[6]      =  asi_addr_bf[5] &  asi_addr_bf[4] & ~asi_addr_bf[3] ;
assign word_en_asi[7]      =  asi_addr_bf[5] &  asi_addr_bf[4] &  asi_addr_bf[3] ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_4 asi_sel_word_reg  (
 .scan_in(asi_sel_word_reg_scanin),
 .scan_out(asi_sel_word_reg_scanout),
 .l1clk( l1clk                                                             ),
 .din  ({asi_mbist_addr_bf[4:3],asi_mbist_addr_f[4:3]}),
 .dout ({asi_mbist_addr_f[4:3], asi_mbist_addr_c[4:3]}),
  .siclk(siclk),
  .soclk(soclk)) ;

assign agc_asi_sel_word_c[0]     = ~asi_mbist_addr_c[4] & ~asi_mbist_addr_c[3] ;
assign agc_asi_sel_word_c[1]     = ~asi_mbist_addr_c[4] &  asi_mbist_addr_c[3] ;
assign agc_asi_sel_word_c[2]     =  asi_mbist_addr_c[4] & ~asi_mbist_addr_c[3] ;
assign agc_asi_sel_word_c[3]     =  asi_mbist_addr_c[4] &  asi_mbist_addr_c[3] ;

assign agc_word_en_bf[7:0] = (ftp_asi_mbist_access_bf & ~mbi_run_bf) ? word_en_asi[7:0] : 8'hFF;



///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// NOTE: Qualify the bypass more with the Thread ID.                                                         //
///////////////////////////////////////////////////////////////////////////////////////////////////////////////    
assign ftu_buffer_wr_en_f[0] = ftp_fetch_thr_q_f[0] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[1] = ftp_fetch_thr_q_f[1] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[2] = ftp_fetch_thr_q_f[2] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[3] = ftp_fetch_thr_q_f[3] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[4] = ftp_fetch_thr_q_f[4] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[5] = ftp_fetch_thr_q_f[5] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[6] = ftp_fetch_thr_q_f[6] | agc_byp_valid | agc_by_pass_valid_unq_f;
assign ftu_buffer_wr_en_f[7] = ftp_fetch_thr_q_f[7] | agc_byp_valid | agc_by_pass_valid_unq_f;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Add logic to keep track of which has the ERROR condition                                                   //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign thr0_valid_exception_p = thr0_exception_valid_kill_c ;
assign thr1_valid_exception_p = thr1_exception_valid_kill_c ;
assign thr2_valid_exception_p = thr2_exception_valid_kill_c ;
assign thr3_valid_exception_p = thr3_exception_valid_kill_c ;
assign thr4_valid_exception_p = thr4_exception_valid_kill_c ;
assign thr5_valid_exception_p = thr5_exception_valid_kill_c ;
assign thr6_valid_exception_p = thr6_exception_valid_kill_c ;
assign thr7_valid_exception_p = thr7_exception_valid_kill_c ;

assign thr0_way_write_en = (thr0_valid_exception_p ) ; 
assign thr1_way_write_en = (thr1_valid_exception_p ) ; 
assign thr2_way_write_en = (thr2_valid_exception_p ) ; 
assign thr3_way_write_en = (thr3_valid_exception_p ) ; 
assign thr4_way_write_en = (thr4_valid_exception_p ) ; 
assign thr5_way_write_en = (thr5_valid_exception_p ) ; 
assign thr6_way_write_en = (thr6_valid_exception_p ) ; 
assign thr7_way_write_en = (thr7_valid_exception_p ) ; 

assign error_way_muxed_p[2:0] = ({3{ic_valid_err_p_en}}       &   valid_err_way_p[2:0]) |
                                ({3{tag_perror_en_p}}         &   perr_way_p[2:0]     ) |
                                ({3{tag_multiple_hit_en_p}}   &   fetch_way_p[2:0]    ) ;
 
assign thr0_excp_way_in[2:0] = thr0_way_write_en ? error_way_muxed_p[2:0] : ftu_thr0_excp_way[2:0] ;
assign thr1_excp_way_in[2:0] = thr1_way_write_en ? error_way_muxed_p[2:0] : ftu_thr1_excp_way[2:0] ;
assign thr2_excp_way_in[2:0] = thr2_way_write_en ? error_way_muxed_p[2:0] : ftu_thr2_excp_way[2:0] ;
assign thr3_excp_way_in[2:0] = thr3_way_write_en ? error_way_muxed_p[2:0] : ftu_thr3_excp_way[2:0] ;
assign thr4_excp_way_in[2:0] = thr4_way_write_en ? error_way_muxed_p[2:0] : ftu_thr4_excp_way[2:0] ;
assign thr5_excp_way_in[2:0] = thr5_way_write_en ? error_way_muxed_p[2:0] : ftu_thr5_excp_way[2:0] ;
assign thr6_excp_way_in[2:0] = thr6_way_write_en ? error_way_muxed_p[2:0] : ftu_thr6_excp_way[2:0] ;
assign thr7_excp_way_in[2:0] = thr7_way_write_en ? error_way_muxed_p[2:0] : ftu_thr7_excp_way[2:0] ;

/////////////////////////////////////////////////////////////////////////////////////////////////////
// If multiple errors report the LEAST way.                                                        //
/////////////////////////////////////////////////////////////////////////////////////////////////////
assign fetch_way_p_in[0] = (itb_icd_waysel_c[7] & ~itb_icd_waysel_c[6] & ~itb_icd_waysel_c[4] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[0]) | 
                           (itb_icd_waysel_c[5] & ~itb_icd_waysel_c[4] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[0]                       ) | 
                           (itb_icd_waysel_c[3] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[0]                                              ) |
                           (itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) ;
assign fetch_way_p_in[1] = (itb_icd_waysel_c[7] & ~itb_icd_waysel_c[5] & ~itb_icd_waysel_c[4] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) |
                           (itb_icd_waysel_c[6] & ~itb_icd_waysel_c[5] & ~itb_icd_waysel_c[4] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) | 
                           (itb_icd_waysel_c[3] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) | 
                           (itb_icd_waysel_c[2] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) ;
assign fetch_way_p_in[2] = (itb_icd_waysel_c[7] & ~itb_icd_waysel_c[3] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) | 
                           (itb_icd_waysel_c[6] & ~itb_icd_waysel_c[3] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) |
                           (itb_icd_waysel_c[5] & ~itb_icd_waysel_c[3] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) | 
                           (itb_icd_waysel_c[4] & ~itb_icd_waysel_c[3] & ~itb_icd_waysel_c[2] & ~itb_icd_waysel_c[1] & ~itb_icd_waysel_c[0]) ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_3 fetch_way_p_reg  (
 .scan_in(fetch_way_p_reg_scanin),
 .scan_out(fetch_way_p_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (fetch_way_p_in[2:0]),
 .dout (fetch_way_p[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

assign valid_err_way[0] = itlb_valid_c[0] ^ itlb_valid_dupl_c[0] ;
assign valid_err_way[1] = itlb_valid_c[1] ^ itlb_valid_dupl_c[1] ;
assign valid_err_way[2] = itlb_valid_c[2] ^ itlb_valid_dupl_c[2] ;
assign valid_err_way[3] = itlb_valid_c[3] ^ itlb_valid_dupl_c[3] ;
assign valid_err_way[4] = itlb_valid_c[4] ^ itlb_valid_dupl_c[4] ;
assign valid_err_way[5] = itlb_valid_c[5] ^ itlb_valid_dupl_c[5] ;
assign valid_err_way[6] = itlb_valid_c[6] ^ itlb_valid_dupl_c[6] ;
assign valid_err_way[7] = itlb_valid_c[7] ^ itlb_valid_dupl_c[7] ;

assign valid_err_way_p_in[0] = (valid_err_way[7] & ~valid_err_way[6] & ~valid_err_way[4] & ~valid_err_way[2] & ~valid_err_way[0]) | 
                               (valid_err_way[5] & ~valid_err_way[4] & ~valid_err_way[2] & ~valid_err_way[0]                       ) | 
                               (valid_err_way[3] & ~valid_err_way[2] & ~valid_err_way[0]                                              ) |
                               (valid_err_way[1] & ~valid_err_way[0]) ;
assign valid_err_way_p_in[1] = (valid_err_way[7] & ~valid_err_way[5] & ~valid_err_way[4] & ~valid_err_way[1] & ~valid_err_way[0]) |
                               (valid_err_way[6] & ~valid_err_way[5] & ~valid_err_way[4] & ~valid_err_way[1] & ~valid_err_way[0]) | 
                               (valid_err_way[3] & ~valid_err_way[1] & ~valid_err_way[0]) | 
                               (valid_err_way[2] & ~valid_err_way[1] & ~valid_err_way[0]) ;
assign valid_err_way_p_in[2] = (valid_err_way[7] & ~valid_err_way[3] & ~valid_err_way[2] & ~valid_err_way[1] & ~valid_err_way[0]) | 
                               (valid_err_way[6] & ~valid_err_way[3] & ~valid_err_way[2] & ~valid_err_way[1] & ~valid_err_way[0]) |
                               (valid_err_way[5] & ~valid_err_way[3] & ~valid_err_way[2] & ~valid_err_way[1] & ~valid_err_way[0]) | 
                               (valid_err_way[4] & ~valid_err_way[3] & ~valid_err_way[2] & ~valid_err_way[1] & ~valid_err_way[0]) ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_3 valid_err_way_p_reg  (
 .scan_in(valid_err_way_p_reg_scanin),
 .scan_out(valid_err_way_p_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (valid_err_way_p_in[2:0]),
 .dout (valid_err_way_p[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
assign perr_way_p_in[0] = (agc_tag_pe_c[7] & ~agc_tag_pe_c[6] & ~agc_tag_pe_c[4] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[0]) | 
                          (agc_tag_pe_c[5] & ~agc_tag_pe_c[4] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[0]                       ) | 
                          (agc_tag_pe_c[3] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[0]                                              ) |
                          (agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) ;
assign perr_way_p_in[1] = (agc_tag_pe_c[7] & ~agc_tag_pe_c[5] & ~agc_tag_pe_c[4] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) |
                          (agc_tag_pe_c[6] & ~agc_tag_pe_c[5] & ~agc_tag_pe_c[4] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) | 
                          (agc_tag_pe_c[3] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) | 
                          (agc_tag_pe_c[2] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) ;
assign perr_way_p_in[2] = (agc_tag_pe_c[7] & ~agc_tag_pe_c[3] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) | 
                          (agc_tag_pe_c[6] & ~agc_tag_pe_c[3] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) |
                          (agc_tag_pe_c[5] & ~agc_tag_pe_c[3] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) | 
                          (agc_tag_pe_c[4] & ~agc_tag_pe_c[3] & ~agc_tag_pe_c[2] & ~agc_tag_pe_c[1] & ~agc_tag_pe_c[0]) ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_3 tag_pe_way  (
 .scan_in(tag_pe_way_scanin),
 .scan_out(tag_pe_way_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (perr_way_p_in[2:0]),
 .dout (perr_way_p[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

/////////////////////////////////////////////////////////////////////////////////////////////////////

ifu_ftu_agc_ctl_msff_ctl_macro__width_3 tag_perror_en_reg  (
 .scan_in(tag_perror_en_reg_scanin),
 .scan_out(tag_perror_en_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ({tag_perror_en_c , ic_valid_err_c_en , tag_multiple_hit_en}),
 .dout ({tag_perror_en_p , ic_valid_err_p_en , tag_multiple_hit_en_p}),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr0_keep_reg  (
 .scan_in(way_thr0_keep_reg_scanin),
 .scan_out(way_thr0_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr0_excp_way_in[2:0]),
 .dout (ftu_thr0_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr1_keep_reg  (
 .scan_in(way_thr1_keep_reg_scanin),
 .scan_out(way_thr1_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr1_excp_way_in[2:0]),
 .dout (ftu_thr1_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr2_keep_reg  (
 .scan_in(way_thr2_keep_reg_scanin),
 .scan_out(way_thr2_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr2_excp_way_in[2:0]),
 .dout (ftu_thr2_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr3_keep_reg  (
 .scan_in(way_thr3_keep_reg_scanin),
 .scan_out(way_thr3_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr3_excp_way_in[2:0]),
 .dout (ftu_thr3_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr4_keep_reg  (
 .scan_in(way_thr4_keep_reg_scanin),
 .scan_out(way_thr4_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr4_excp_way_in[2:0]),
 .dout (ftu_thr4_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr5_keep_reg  (
 .scan_in(way_thr5_keep_reg_scanin),
 .scan_out(way_thr5_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr5_excp_way_in[2:0]),
 .dout (ftu_thr5_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

 
ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr6_keep_reg  (
 .scan_in(way_thr6_keep_reg_scanin),
 .scan_out(way_thr6_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr6_excp_way_in[2:0]),
 .dout (ftu_thr6_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;


ifu_ftu_agc_ctl_msff_ctl_macro__width_3 way_thr7_keep_reg  (
 .scan_in(way_thr7_keep_reg_scanin),
 .scan_out(way_thr7_keep_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (thr7_excp_way_in[2:0]),
 .dout (ftu_thr7_excp_way[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign excp_way_valid_in = thr7_way_write_en | thr6_way_write_en | thr5_way_write_en | thr4_way_write_en |
                           thr3_way_write_en | thr2_way_write_en | thr1_way_write_en | thr0_way_write_en ;
 

ifu_ftu_agc_ctl_msff_ctl_macro__width_4 excp_way_d_reg  (
 .scan_in(excp_way_d_reg_scanin),
 .scan_out(excp_way_d_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  ({error_way_muxed_p[2:0],excp_way_valid_in}),
 .dout ({ftu_excp_way_d[2:0],ftu_excp_way_valid_d}),
  .siclk(siclk),
  .soclk(soclk)) ;


assign excp_tid_d_in[0] = thr1_way_write_en | thr3_way_write_en | thr5_way_write_en | thr7_way_write_en ; 
assign excp_tid_d_in[1] = thr2_way_write_en | thr3_way_write_en | thr6_way_write_en | thr7_way_write_en ; 
assign excp_tid_d_in[2] = thr4_way_write_en | thr5_way_write_en | thr6_way_write_en | thr7_way_write_en ; 

ifu_ftu_agc_ctl_msff_ctl_macro__width_3 excp_tid_d_reg  (
 .scan_in(excp_tid_d_reg_scanin),
 .scan_out(excp_tid_d_reg_scanout),
 .l1clk( l1clk_pm1                                                             ),
 .din  (excp_tid_d_in[2:0]),
 .dout (ftu_excp_tid_d[2:0]),
  .siclk(siclk),
  .soclk(soclk)) ;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
assign next_itlb_busy = itc_demap_next ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 itlb_busy_reg  (
 .scan_in(itlb_busy_reg_scanin),
 .scan_out(itlb_busy_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (next_itlb_busy),
 .dout (itlb_busy_bf),
  .siclk(siclk),
  .soclk(soclk)
);

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 itlb_busy_f_reg  (
 .scan_in(itlb_busy_f_reg_scanin),
 .scan_out(itlb_busy_f_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (itlb_busy_bf),
 .dout (itlb_busy_f),
  .siclk(siclk),
  .soclk(soclk)
);

assign ith_det_req_bbf = asi_ith_det_req | (ith_det_req_ff  & (itlb_busy_bf | itlb_busy_f)) ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_1 ith_det_req_ff_reg  (
 .scan_in(ith_det_req_ff_reg_scanin),
 .scan_out(ith_det_req_ff_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (ith_det_req_bbf),
 .dout (ith_det_req_ff),
  .siclk(siclk),
  .soclk(soclk)
 );






assign next_enabled_thread[7:0] =  spc_core_running_status[7:0] ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 enabled_thr_reg_dup  (
 .scan_in(enabled_thr_reg_dup_scanin),
 .scan_out(enabled_thr_reg_dup_scanout),
 .l1clk(l1clk),
 .din  (next_enabled_thread[7:0]),
 .dout (enabled_threads_dup[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign next_single_thread_active = (enabled_threads_dup[0] & ~(|enabled_threads_dup[7:1])) |
                                   (enabled_threads_dup[1] & ~(|enabled_threads_dup[7:2]) & ~(enabled_threads_dup[0]))    |
                                   (enabled_threads_dup[2] & ~(|enabled_threads_dup[7:3]) & ~(|enabled_threads_dup[1:0])) |
                                   (enabled_threads_dup[3] & ~(|enabled_threads_dup[7:4]) & ~(|enabled_threads_dup[2:0])) |
                                   (enabled_threads_dup[4] & ~(|enabled_threads_dup[7:5]) & ~(|enabled_threads_dup[3:0])) |
                                   (enabled_threads_dup[5] & ~(|enabled_threads_dup[7:6]) & ~(|enabled_threads_dup[4:0])) |
                                   (enabled_threads_dup[6] & ~( enabled_threads_dup[7])   & ~(|enabled_threads_dup[5:0])) |
                                   (enabled_threads_dup[7] & ~(|enabled_threads_dup[6:0])) ;


ifu_ftu_agc_ctl_msff_ctl_macro__width_1 single_thread_active_reg  (
 .scan_in(single_thread_active_reg_scanin),
 .scan_out(single_thread_active_reg_scanout),
 .l1clk(l1clk),
 .din  (next_single_thread_active),
 .dout (single_thread_active),
  .siclk(siclk),
  .soclk(soclk));


 
////////////////////////////////////////////////////////////////////////////////////////
// Invalidation request from TLU                                                      //
////////////////////////////////////////////////////////////////////////////////////////
assign reset_invalidation_req[0] = (agc_fetch_v_int_c & curr_fetch_thr_c[0] & ~tsm_thr0_no_new_miss) | tlu_flush_ifu_f[0] ;
assign reset_invalidation_req[1] = (agc_fetch_v_int_c & curr_fetch_thr_c[1] & ~tsm_thr1_no_new_miss) | tlu_flush_ifu_f[1] ;
assign reset_invalidation_req[2] = (agc_fetch_v_int_c & curr_fetch_thr_c[2] & ~tsm_thr2_no_new_miss) | tlu_flush_ifu_f[2] ;
assign reset_invalidation_req[3] = (agc_fetch_v_int_c & curr_fetch_thr_c[3] & ~tsm_thr3_no_new_miss) | tlu_flush_ifu_f[3] ;
assign reset_invalidation_req[4] = (agc_fetch_v_int_c & curr_fetch_thr_c[4] & ~tsm_thr4_no_new_miss) | tlu_flush_ifu_f[4] ;
assign reset_invalidation_req[5] = (agc_fetch_v_int_c & curr_fetch_thr_c[5] & ~tsm_thr5_no_new_miss) | tlu_flush_ifu_f[5] ;
assign reset_invalidation_req[6] = (agc_fetch_v_int_c & curr_fetch_thr_c[6] & ~tsm_thr6_no_new_miss) | tlu_flush_ifu_f[6] ;
assign reset_invalidation_req[7] = (agc_fetch_v_int_c & curr_fetch_thr_c[7] & ~tsm_thr7_no_new_miss) | tlu_flush_ifu_f[7] ;

assign new_invalidation_req[0] = tlu_ifu_invalidate[0] & trap_thread_g0[0] ; 
assign new_invalidation_req[1] = tlu_ifu_invalidate[0] & trap_thread_g0[1] ; 
assign new_invalidation_req[2] = tlu_ifu_invalidate[0] & trap_thread_g0[2] ; 
assign new_invalidation_req[3] = tlu_ifu_invalidate[0] & trap_thread_g0[3] ; 
assign new_invalidation_req[4] = tlu_ifu_invalidate[1] & trap_thread_g1[0] ; 
assign new_invalidation_req[5] = tlu_ifu_invalidate[1] & trap_thread_g1[1] ; 
assign new_invalidation_req[6] = tlu_ifu_invalidate[1] & trap_thread_g1[2] ; 
assign new_invalidation_req[7] = tlu_ifu_invalidate[1] & trap_thread_g1[3] ; 

assign set_invalidation_req[0] = new_invalidation_req[0] | (invalidation_req_c & curr_fetch_thr_c[0] & tsm_thr0_no_new_miss) ; 
assign set_invalidation_req[1] = new_invalidation_req[1] | (invalidation_req_c & curr_fetch_thr_c[1] & tsm_thr1_no_new_miss) ; 
assign set_invalidation_req[2] = new_invalidation_req[2] | (invalidation_req_c & curr_fetch_thr_c[2] & tsm_thr2_no_new_miss) ; 
assign set_invalidation_req[3] = new_invalidation_req[3] | (invalidation_req_c & curr_fetch_thr_c[3] & tsm_thr3_no_new_miss) ; 
assign set_invalidation_req[4] = new_invalidation_req[4] | (invalidation_req_c & curr_fetch_thr_c[4] & tsm_thr4_no_new_miss) ; 
assign set_invalidation_req[5] = new_invalidation_req[5] | (invalidation_req_c & curr_fetch_thr_c[5] & tsm_thr5_no_new_miss) ; 
assign set_invalidation_req[6] = new_invalidation_req[6] | (invalidation_req_c & curr_fetch_thr_c[6] & tsm_thr6_no_new_miss) ; 
assign set_invalidation_req[7] = new_invalidation_req[7] | (invalidation_req_c & curr_fetch_thr_c[7] & tsm_thr7_no_new_miss) ; 

assign next_invalidation_req[0] = set_invalidation_req[0] | (invalidation_req_ff[0] & ~reset_invalidation_req[0]) ;
assign next_invalidation_req[1] = set_invalidation_req[1] | (invalidation_req_ff[1] & ~reset_invalidation_req[1]) ;
assign next_invalidation_req[2] = set_invalidation_req[2] | (invalidation_req_ff[2] & ~reset_invalidation_req[2]) ;
assign next_invalidation_req[3] = set_invalidation_req[3] | (invalidation_req_ff[3] & ~reset_invalidation_req[3]) ;
assign next_invalidation_req[4] = set_invalidation_req[4] | (invalidation_req_ff[4] & ~reset_invalidation_req[4]) ;
assign next_invalidation_req[5] = set_invalidation_req[5] | (invalidation_req_ff[5] & ~reset_invalidation_req[5]) ;
assign next_invalidation_req[6] = set_invalidation_req[6] | (invalidation_req_ff[6] & ~reset_invalidation_req[6]) ;
assign next_invalidation_req[7] = set_invalidation_req[7] | (invalidation_req_ff[7] & ~reset_invalidation_req[7]) ;

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 invalidation_req_reg  (
 .scan_in(invalidation_req_reg_scanin),
 .scan_out(invalidation_req_reg_scanout),
 .l1clk(l1clk),
 .din  (next_invalidation_req[7:0]),
 .dout (invalidation_req_ff[7:0]),
  .siclk(siclk),
  .soclk(soclk));

ifu_ftu_agc_ctl_msff_ctl_macro__width_8 invalidation_req_dup_reg  (
 .scan_in(invalidation_req_dup_reg_scanin),
 .scan_out(invalidation_req_dup_reg_scanout),
 .l1clk(l1clk),
 .din  (next_invalidation_req[7:0]),
 .dout (agc_invalidation_req_ff[7:0]),
  .siclk(siclk),
  .soclk(soclk));


assign invalidation_req_f =  (ftp_fetch_thr_q_f[0] & invalidation_req_ff[0]) |
                             (ftp_fetch_thr_q_f[1] & invalidation_req_ff[1]) |
                             (ftp_fetch_thr_q_f[2] & invalidation_req_ff[2]) |
                             (ftp_fetch_thr_q_f[3] & invalidation_req_ff[3]) |
                             (ftp_fetch_thr_q_f[4] & invalidation_req_ff[4]) |
                             (ftp_fetch_thr_q_f[5] & invalidation_req_ff[5]) |
                             (ftp_fetch_thr_q_f[6] & invalidation_req_ff[6]) |
                             (ftp_fetch_thr_q_f[7] & invalidation_req_ff[7]) ;
 



 ifu_ftu_agc_ctl_msff_ctl_macro__width_1 invalidation_req_c_reg  (
  .scan_in(invalidation_req_c_reg_scanin),
  .scan_out(invalidation_req_c_reg_scanout),
  .l1clk( l1clk),
  .din  (invalidation_req_f),
  .dout (invalidation_req_c),
  .siclk(siclk),
  .soclk(soclk));

assign agc_any_invalidation_req_f = invalidation_req_f ;

assign thr0_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[0]  ; 
assign thr1_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[1]  ; 
assign thr2_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[2]  ; 
assign thr3_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[3]  ; 
assign thr4_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[4]  ; 
assign thr5_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[5]  ; 
assign thr6_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[6]  ; 
assign thr7_kill_after_invalidation   = invalidation_req_c    & curr_fetch_thr_c[7]  ; 

 ifu_ftu_agc_ctl_msff_ctl_macro__width_8 thrx_inv_kill_reg  (
  .scan_in(thrx_inv_kill_reg_scanin),
  .scan_out(thrx_inv_kill_reg_scanout),
  .l1clk( l1clk                                                             ),
  .din  ({thr7_kill_after_invalidation,thr6_kill_after_invalidation,
          thr5_kill_after_invalidation,thr4_kill_after_invalidation,
          thr3_kill_after_invalidation,thr2_kill_after_invalidation,
          thr1_kill_after_invalidation,thr0_kill_after_invalidation}),
  .dout ({thr7_kill_after_invalidation_d,thr6_kill_after_invalidation_d,
          thr5_kill_after_invalidation_d,thr4_kill_after_invalidation_d,
          thr3_kill_after_invalidation_d,thr2_kill_after_invalidation_d,
          thr1_kill_after_invalidation_d,thr0_kill_after_invalidation_d}),
  .siclk(siclk),
  .soclk(soclk)) ;


///////////////////////////////////////////////////////////////////////////
// Cache miss signals.                                                   //
///////////////////////////////////////////////////////////////////////////



assign cms_itb_cmiss_c_q =  itb_cmiss_c & agc_fetch_v_c_unq & ~itb_itb_miss_c & ~agc_kill_fetch_cv_int2_c & agc_qualify_cmiss;


assign ftu_agc_thr0_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[0] & ~tsm_thr0_no_new_miss  & ~cms_tlu_flush_f[0] & ~agc_thr0_br_misp_f;
assign ftu_agc_thr1_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[1] & ~tsm_thr1_no_new_miss  & ~cms_tlu_flush_f[1] & ~agc_thr1_br_misp_f;
assign ftu_agc_thr2_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[2] & ~tsm_thr2_no_new_miss  & ~cms_tlu_flush_f[2] & ~agc_thr2_br_misp_f;
assign ftu_agc_thr3_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[3] & ~tsm_thr3_no_new_miss  & ~cms_tlu_flush_f[3] & ~agc_thr3_br_misp_f;
assign ftu_agc_thr4_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[4] & ~tsm_thr4_no_new_miss  & ~cms_tlu_flush_f[4] & ~agc_thr4_br_misp_f;
assign ftu_agc_thr5_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[5] & ~tsm_thr5_no_new_miss  & ~cms_tlu_flush_f[5] & ~agc_thr5_br_misp_f;
assign ftu_agc_thr6_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[6] & ~tsm_thr6_no_new_miss  & ~cms_tlu_flush_f[6] & ~agc_thr6_br_misp_f;
assign ftu_agc_thr7_cmiss_c = cms_itb_cmiss_c_q & cms_curr_fetch_thr_c[7] & ~tsm_thr7_no_new_miss  & ~cms_tlu_flush_f[7] & ~agc_thr7_br_misp_f;

///////////////////////////////////////////////////////////////////////
// Spare circuits                                                    //
///////////////////////////////////////////////////////////////////////
ifu_ftu_agc_ctl_spare_ctl_macro__num_8 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


///////////////////////////////////////////////////////////////////////
// Cambist outputs for the ITLB
///////////////////////////////////////////////////////////////////////


ifu_ftu_agc_ctl_msff_ctl_macro__width_6 mbist_output  (
 .scan_in(mbist_output_scanin),
 .scan_out(mbist_output_scanout),
 .l1clk( l1clk                                                             ),
        .din    ({itb_cam_hit_c,          tlb_context0_hit,     itb_itb_mhit_c,
                  itb_cam_hit_c_1,        tlb_context0_hit_1,     itb_itb_mhit_c_1}),
        .dout   ({itb_cam_hit_c_1,        tlb_context0_hit_1,     itb_itb_mhit_c_1,
                  ftu_mbi_tlb_cam_hit,ftu_mbi_tlb_ctxt0_hit,ftu_mbi_tlb_cam_mhit}),
  .siclk(siclk),
  .soclk(soclk));



assign ifu_ibuffer_write_c[0]  = ftu_fetch_thr_c[0] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[0];

assign ifu_ibuffer_write_c[1]  = ftu_fetch_thr_c[1] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[1];

assign ifu_ibuffer_write_c[2]  = ftu_fetch_thr_c[2] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[2];

assign ifu_ibuffer_write_c[3]  = ftu_fetch_thr_c[3] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[3];


assign ifu_ibuffer_write_c[4]  = ftu_fetch_thr_c[4] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[4];

assign ifu_ibuffer_write_c[5]  = ftu_fetch_thr_c[5] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[5];

assign ifu_ibuffer_write_c[6]  = ftu_fetch_thr_c[6] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[6];

assign ifu_ibuffer_write_c[7]  = ftu_fetch_thr_c[7] & (ftu_instr_valid_c[0] | ftu_instr_valid_c[1] | ftu_instr_valid_c[2] |
                                                       ftu_instr_valid_c[3] | ftu_exception_valid_c) & ~ftu_ibu_redirect_bf[7];


supply0 vss;
supply1 vdd;
assign se = tcu_scan_en ;
// fixscan start:
assign tlu_ceter_pscce_reg_scanin = scan_in                  ;
assign br_misp_data_reg_scanin   = tlu_ceter_pscce_reg_scanout;
assign br_misp_data_dup_reg_scanin = br_misp_data_reg_scanout ;
assign tid_dec_w_reg_scanin      = br_misp_data_dup_reg_scanout;
assign curr_fetch_thr_c_reg_scanin = tid_dec_w_reg_scanout    ;
assign cms_curr_fetch_thr_c_reg_scanin = curr_fetch_thr_c_reg_scanout;
assign sf_valid_reg_scanin       = cms_curr_fetch_thr_c_reg_scanout;
assign sf_valid_dup_reg_scanin   = sf_valid_reg_scanout     ;
assign sf_valid_by_pass_f_reg_scanin = sf_valid_dup_reg_scanout ;
assign sf_valid_by_pass_c_reg_scanin = sf_valid_by_pass_f_reg_scanout;
assign sf_v_c_scanin             = sf_valid_by_pass_c_reg_scanout;
assign unc_valid_reg_scanin      = sf_v_c_scanout           ;
assign thr0_pc_f_inc_reg_scanin  = unc_valid_reg_scanout    ;
assign thr1_pc_f_inc_reg_scanin  = thr0_pc_f_inc_reg_scanout;
assign thr2_pc_f_inc_reg_scanin  = thr1_pc_f_inc_reg_scanout;
assign thr3_pc_f_inc_reg_scanin  = thr2_pc_f_inc_reg_scanout;
assign thr4_pc_f_inc_reg_scanin  = thr3_pc_f_inc_reg_scanout;
assign thr5_pc_f_inc_reg_scanin  = thr4_pc_f_inc_reg_scanout;
assign thr6_pc_f_inc_reg_scanin  = thr5_pc_f_inc_reg_scanout;
assign thr7_pc_f_inc_reg_scanin  = thr6_pc_f_inc_reg_scanout;
assign tlu_flush_ifu_reg_scanin  = thr7_pc_f_inc_reg_scanout;
assign tlu_flush_ifu_d_reg_scanin = tlu_flush_ifu_reg_scanout;
assign cms_tlu_flush_ifu_reg_scanin = tlu_flush_ifu_d_reg_scanout;
assign load_flush_reg_scanin     = cms_tlu_flush_ifu_reg_scanout;
assign kill_fetch_vc_reg_scanin  = load_flush_reg_scanout   ;
assign kill_fetch_vc_2_reg_scanin = kill_fetch_vc_reg_scanout;
assign exception_valid_kill_reg_scanin = kill_fetch_vc_2_reg_scanout;
assign exception_valid_kill1_reg_scanin = exception_valid_kill_reg_scanout;
assign thrx_exception_valid_kill_reg_scanin = exception_valid_kill1_reg_scanout;
assign thrx_redirect_reg_scanin  = thrx_exception_valid_kill_reg_scanout;
assign thrx_ibu_redirect_reg_scanin = thrx_redirect_reg_scanout;
assign other_flushes_reg_scanin  = thrx_ibu_redirect_reg_scanout;
assign cmu_fill_byp_thread_reg_scanin = other_flushes_reg_scanout;
assign by_pass_thread_bf_reg_scanin = cmu_fill_byp_thread_reg_scanout;
assign by_pass_sel_f_reg_scanin  = by_pass_thread_bf_reg_scanout;
assign by_pass_sel_c_reg_scanin  = by_pass_sel_f_reg_scanout;
assign by_pass_thread_f_reg_scanin = by_pass_sel_c_reg_scanout;
assign fetchalid_cnq_reg_scanin  = by_pass_thread_f_reg_scanout;
assign fetch_v_dup_c_reg_scanin  = fetchalid_cnq_reg_scanout;
assign cycle_2_by_pass_f_reg_scanin = fetch_v_dup_c_reg_scanout;
assign cycle_3_by_pass_f_reg_scanin = cycle_2_by_pass_f_reg_scanout;
assign cycle_3_by_pass_c_reg_scanin = cycle_3_by_pass_f_reg_scanout;
assign cmu_any_data_ready_reg_scanin = cycle_3_by_pass_c_reg_scanout;
assign tsm_thrx_kill_by_pass_reg_scanin = cmu_any_data_ready_reg_scanout;
assign by_pass_v_f_reg_scanin    = tsm_thrx_kill_by_pass_reg_scanout;
assign by_pass_v_c_reg_scanin    = by_pass_v_f_reg_scanout  ;
assign by_pass_instr_v_f_reg_scanin = by_pass_v_c_reg_scanout  ;
assign by_pass_instr_v_c_reg_scanin = by_pass_instr_v_f_reg_scanout;
assign bus_first_reg_scanin      = by_pass_instr_v_c_reg_scanout;
assign thrx_sf_kill_reg_scanin   = bus_first_reg_scanout    ;
assign mbist_data_in_reg_scanin  = thrx_sf_kill_reg_scanout ;
assign cmu_fill_wrway_reg_scanin = mbist_data_in_reg_scanout;
assign asi_mbist_way_f_reg_scanin = cmu_fill_wrway_reg_scanout;
assign vl_data_reg_scanin        = asi_mbist_way_f_reg_scanout;
assign itlb_valid_reg_scanin     = vl_data_reg_scanout      ;
assign itlb_valid_dupl_reg_scanin = itlb_valid_reg_scanout   ;
assign va_hole_excp_c_reg_scanin = itlb_valid_dupl_reg_scanout;
assign addr_bit_5_bf_reg_scanin  = va_hole_excp_c_reg_scanout;
assign inv_bit_5_bf_reg_scanin   = addr_bit_5_bf_reg_scanout;
assign wrway_bf_reg_scanin       = inv_bit_5_bf_reg_scanout ;
assign inv_way_bf_reg_scanin     = wrway_bf_reg_scanout     ;
assign inv_way1_bf_reg_scanin    = inv_way_bf_reg_scanout   ;
assign inv_line_bf_reg_scanin    = inv_way1_bf_reg_scanout  ;
assign evic_line_bf_reg_scanin   = inv_line_bf_reg_scanout  ;
assign data_ready_bf_reg_scanin  = evic_line_bf_reg_scanout ;
assign l2_cache_miss_in_reg_scanin = data_ready_bf_reg_scanout;
assign l2_cache_miss_1_reg_scanin = l2_cache_miss_in_reg_scanout;
assign l2_cache_miss_2_reg_scanin = l2_cache_miss_1_reg_scanout;
assign ic_instr_v_reg_scanin     = l2_cache_miss_2_reg_scanout;
assign any_instr_v_c_reg_scanin  = ic_instr_v_reg_scanout   ;
assign hpstate_reg_scanin        = any_instr_v_c_reg_scanout;
assign priv_state_c_reg_scanin   = hpstate_reg_scanout      ;
assign tlb_parity_reg_scanin     = priv_state_c_reg_scanout ;
assign itlb_cam_vld_c_reg_scanin = tlb_parity_reg_scanout   ;
assign cerer_en_reg_scanin       = itlb_cam_vld_c_reg_scanout;
assign itc_real_f_reg_scanin     = cerer_en_reg_scanout     ;
assign itc_real_c_reg_scanin     = itc_real_f_reg_scanout   ;
assign cntx_sel_reg_scanin       = itc_real_c_reg_scanout   ;
assign lsu_no_icm_reg_scanin     = cntx_sel_reg_scanout     ;
assign ic_enable_reg_scanin      = lsu_no_icm_reg_scanout   ;
assign thr_c_ic_enable_reg_scanin = ic_enable_reg_scanout    ;
assign thr_c_ic_disable_reg_scanin = thr_c_ic_enable_reg_scanout;
assign dff_8b_prty_7_scanin      = thr_c_ic_disable_reg_scanout;
assign dff_8b_prty_5_scanin      = dff_8b_prty_7_scanout    ;
assign dff_8b_prty_3_scanin      = dff_8b_prty_5_scanout    ;
assign dff_8b_prty_1_scanin      = dff_8b_prty_3_scanout    ;
assign asi_sel_word_reg_scanin   = dff_8b_prty_1_scanout    ;
assign fetch_way_p_reg_scanin    = asi_sel_word_reg_scanout ;
assign valid_err_way_p_reg_scanin = fetch_way_p_reg_scanout  ;
assign tag_pe_way_scanin         = valid_err_way_p_reg_scanout;
assign tag_perror_en_reg_scanin  = tag_pe_way_scanout       ;
assign way_thr0_keep_reg_scanin  = tag_perror_en_reg_scanout;
assign way_thr1_keep_reg_scanin  = way_thr0_keep_reg_scanout;
assign way_thr2_keep_reg_scanin  = way_thr1_keep_reg_scanout;
assign way_thr3_keep_reg_scanin  = way_thr2_keep_reg_scanout;
assign way_thr4_keep_reg_scanin  = way_thr3_keep_reg_scanout;
assign way_thr5_keep_reg_scanin  = way_thr4_keep_reg_scanout;
assign way_thr6_keep_reg_scanin  = way_thr5_keep_reg_scanout;
assign way_thr7_keep_reg_scanin  = way_thr6_keep_reg_scanout;
assign excp_way_d_reg_scanin     = way_thr7_keep_reg_scanout;
assign excp_tid_d_reg_scanin     = excp_way_d_reg_scanout   ;
assign itlb_busy_reg_scanin      = excp_tid_d_reg_scanout   ;
assign itlb_busy_f_reg_scanin    = itlb_busy_reg_scanout    ;
assign ith_det_req_ff_reg_scanin = itlb_busy_f_reg_scanout  ;
assign enabled_thr_reg_dup_scanin = ith_det_req_ff_reg_scanout;
assign single_thread_active_reg_scanin = enabled_thr_reg_dup_scanout;
assign invalidation_req_reg_scanin = single_thread_active_reg_scanout;
assign invalidation_req_dup_reg_scanin = invalidation_req_reg_scanout;
assign invalidation_req_c_reg_scanin = invalidation_req_dup_reg_scanout;
assign thrx_inv_kill_reg_scanin  = invalidation_req_c_reg_scanout;
assign spares_scanin             = thrx_inv_kill_reg_scanout;
assign mbist_output_scanin       = spares_scanout           ;
assign scan_out                  = mbist_output_scanout     ;
// fixscan end:
endmodule










// any PARAMS parms go into naming of macro

module ifu_ftu_agc_ctl_l1clkhdr_ctl_macro (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_8 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_12 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_1 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_4 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_16 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_3 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_2 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_5 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_6 (
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

module ifu_ftu_agc_ctl_msff_ctl_macro__width_9 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_ftu_agc_ctl_spare_ctl_macro__num_8 (
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
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;


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

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));
assign scan_out = so_7;



endmodule

