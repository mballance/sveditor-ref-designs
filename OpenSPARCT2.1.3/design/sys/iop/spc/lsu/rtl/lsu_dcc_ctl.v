// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_dcc_ctl.v
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
module lsu_dcc_ctl (
  dec_lsu_tg_d, 
  dec_ld_inst_d, 
  dec_ld_inst_e, 
  dec_st_inst_e, 
  dec_fpldst_inst_e, 
  dec_fsr_ldst_e, 
  dec_ldst_dbl_e, 
  dec_pref_inst_e, 
  dec_flush_inst_e, 
  dec_memstbar_inst_e, 
  dec_sr_inst_e, 
  dec_pr_inst_e, 
  dec_hpr_inst_e, 
  dec_casa_inst_e, 
  dec_ldstub_inst_e, 
  dec_swap_inst_e, 
  dec_altspace_d, 
  dec_sign_ext_e, 
  dec_ldst_sz_e, 
  dec_lsu_rd_e, 
  dec_sraddr_e, 
  dec_imm_asi_vld_d, 
  dec_imm_asi_d, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_lsu_tid0_d, 
  dec_lsu_tid1_d, 
  tlu_pstate_cle, 
  tlu_asi_0_tid, 
  tlu_asi_1_tid, 
  tlu_asi_0_valid, 
  tlu_asi_1_valid, 
  tlu_flush_lsu_b, 
  tlu_lsu_hpstate_hpriv, 
  tlu_lsu_pstate_priv, 
  tlu_tl_gt_0, 
  tlu_lsu_clear_ctl_reg_, 
  tlu_cerer_dttp, 
  tlu_cerer_dttm, 
  tlu_cerer_dtdp, 
  tlu_cerer_dcvp, 
  tlu_cerer_dctp, 
  tlu_cerer_dctm, 
  tlu_cerer_dcdp, 
  tlc_use_primary_context_c0, 
  tlc_use_secondary_context_c0, 
  tld_tid, 
  tlc_wr_or_demap, 
  tld_va_m_eq_zero, 
  exu_lsu_va_error_m, 
  exu_ecc_m, 
  exu_lsu_rs2_e, 
  fgu_fst_ecc_error_fx2, 
  lmd_sz_m, 
  lmd_fpld_m, 
  lmd_sxt_fsr_m, 
  lmd_rd_m, 
  lmd_fpodd32b_m, 
  lmd_fp32b_m, 
  lmd_bendian_m, 
  lmd_fill_addr_e, 
  lmd_ld_addr_m, 
  lmd_fill_way_e, 
  lmd_wrtag_parity_e, 
  lmc_cpq_tid_m, 
  lmc_thrd_byp_sel_e, 
  lmc_byp_tid_m, 
  lmc_byp_vld_m, 
  lmc_asi_bypass_m, 
  lmc_pref_issued, 
  lmc_bld_annul, 
  lmc_bld_last_e, 
  lmc_bld_miss_e, 
  lmc_full_raw_w, 
  lmc_ld_stall, 
  lmc_l2_err_noup, 
  lmc_l2_uerr, 
  tlb_tte_ie_b, 
  tlb_tte_cp_b, 
  tlb_tte_wbit_b, 
  tlb_tte_ebit_b, 
  tlb_tte_pbit_b, 
  tlb_tte_nfo_b, 
  tlb_cache_way_hit_b, 
  tlb_cache_hit_b, 
  tlb_pgnum_b39, 
  tlb_cam_hit, 
  tlb_cam_mhit, 
  tlb_pgsize, 
  tlb_context0_hit, 
  tlb_tag_parity, 
  tlb_tte_data_parity, 
  dcs_asi_d, 
  dcs_wpt_mask_m, 
  dcs_wpt_enable_m, 
  dcs_wpt_mode_m, 
  dcs_dc_enable, 
  dcs_dmmu_enable_d, 
  lsu_va_m, 
  lsu_va_b, 
  cic_l2fill_vld_e, 
  cic_cpq_ld_sel, 
  cic_invalidate_e, 
  cic_xinval_e, 
  cic_st_update_e, 
  cic_rtn_cmplt, 
  cic_oddrd_e, 
  cic_inv_wen_e, 
  cic_cpq_stall, 
  cid_tid, 
  cid_xway, 
  cid_st_addr, 
  cid_st_way, 
  cid_st_bmask, 
  cid_inv_index, 
  cid_ncache, 
  cid_atomic, 
  cid_l2miss, 
  stb_cam_hit, 
  sbc_bst_in_prog_m, 
  sbc_tid_m, 
  lsu_block_store_alloc, 
  lsu_block_store_kill, 
  sbd_st_data_b, 
  tgd_w0_parity_b, 
  tgd_w1_parity_b, 
  tgd_w2_parity_b, 
  tgd_w3_parity_b, 
  tgd_va_wp_47_16, 
  tgd_va_wp_15_3, 
  tgd_pa_wp_39_16, 
  tgd_pa_wp_15_3, 
  tgd_prty_256m_b, 
  tgd_prty_4m_b, 
  tgd_prty_64k_b, 
  tgd_prty_8k_b, 
  tgd_prty_ctxt0_b, 
  tgd_prty_ctxt1_b, 
  tgc_cache_way_vld_m, 
  tgc_verr_b, 
  dca_perr_w0_b, 
  dca_perr_w1_b, 
  dca_perr_w2_b, 
  dca_perr_w3_b, 
  dca_rparity_b, 
  lru_rdata_m, 
  ifu_lsu_if_vld, 
  ifu_lsu_if_tid, 
  ifu_lsu_if_addr, 
  arc_pid_ctl_2f, 
  dcd_dca_data_compare, 
  lbist_run, 
  mbi_addr, 
  mbi_wdata, 
  mbi_run, 
  mbi_dca_read_en, 
  mbi_dca_write_en, 
  mbi_cmpsel, 
  mbi_dta_read_en, 
  mbi_dta_write_en, 
  mbi_dva_read_en, 
  mbi_dva_write_en, 
  mbi_lru_read_en, 
  mbi_lru_write_en, 
  mbi_dtb_read_en, 
  mbi_dtb_cam_en_pre, 
  mbi_scm_cam_en_pre, 
  dmo_dcmuxctl, 
  bist_cmp_data, 
  bist_cmpsel_1, 
  bist_addr_1, 
  bist_srm_rd_1, 
  bist_scm_rd_1, 
  lsu_trap_flush, 
  dcc_exception_flush_b, 
  dcc_asi_load_m, 
  dcc_asi_load_b, 
  dcc_asi_store_b, 
  dcc_asi_iomap_m, 
  dcc_asi_iomap_b, 
  dcc_asi_rngf_b, 
  dcc_asi_indet_b, 
  dcc_binit_st_b, 
  dcc_dca_rvld_e, 
  dcc_dca_wvld_e, 
  dcc_dca_clk_en_e, 
  dcc_dca_wclk_en_e, 
  dcc_dca_rclk_en_m, 
  dcc_dca_bypass_e_, 
  dcc_dca_fill_way_e, 
  dcc_dca_fill_addr_e, 
  dcc_dca_byte_wr_en_e, 
  dcc_parity_invert, 
  dcc_dta_parity, 
  dcc_alt_addr_sel_e, 
  dcc_alt_way_sel_m, 
  dcc_alt_rsel_way_m, 
  dcc_dta_fill_addr_e, 
  dcc_dta_fill_way_e, 
  dcc_dta_wvld_e, 
  dcc_dta_rvld_e, 
  dcc_dta_index1_sel_e, 
  dcc_dta_clken, 
  dcc_dva_wvld_e, 
  dcc_dva_rvld_e, 
  dcc_dva_din_e, 
  dcc_dva_din2_e, 
  dcc_dva_wr_addr_e, 
  dcc_dva_bit_wen_e, 
  dcc_cache_diag_wr_m, 
  dcc_cache_diag_wr_b, 
  dcc_lru_rvld_e, 
  dcc_lru_wvld_w, 
  dcc_lru_wdata_w, 
  dcc_lru_wen_w, 
  dcc_lru_wr_addr_w, 
  dcc_ldst_bmask, 
  dcc_bmask_parity_b, 
  dcc_ld_miss_b, 
  dcc_early_ld_b, 
  dcc_stb_quad_ld_cam, 
  dcc_l2fill_vld_m, 
  dcc_ctxt_tid0_d, 
  dcc_ctxt_tid1_d, 
  dcc_ctxt_tg_d, 
  dcc_tid_e, 
  dcc_tid_m, 
  dcc_tid_b, 
  dcc_asi_m, 
  dcc_ld_inst_unqual_e, 
  dcc_ld_inst_vld_m, 
  dcc_stb_cam_vld_m, 
  dcc_baddr_m, 
  dcc_signed_m, 
  dcc_pref_inst_m, 
  dcc_std_inst_m, 
  dcc_ldstub_inst_m, 
  dcc_atomic_b, 
  dcc_casa_inst_b, 
  dcc_lendian_pre_m, 
  dcc_bendian_byp_m, 
  dcc_pst_asi_b, 
  dcc_tte_vld_m, 
  dcc_ldst_sz_m, 
  dcc_ld_sz_m, 
  dcc_fp32b_sel_m, 
  dcc_blk_inst_m, 
  dcc_blk_inst_b, 
  dcc_ldbl_b, 
  dcc_ncache_b, 
  dcc_st_rq_type_w, 
  dcc_sync_pipe_w, 
  dcc_priv_b, 
  dcc_hpriv_b, 
  dcc_pctxt_sel_e, 
  dcc_sctxt_sel_e, 
  dcc_ld_miss_ldd, 
  dcc_ld_miss_ctl, 
  dcc_sync_inst_w, 
  dcc_asi_reload_sel, 
  dcc_wr_wtchpt, 
  dcc_wr_lsu_ctl_reg, 
  dcc_wr_pwr_mgmt, 
  dcc_ceter_wr_w, 
  dcc_p0ctxt_rd_m, 
  dcc_p1ctxt_rd_m, 
  dcc_s0ctxt_rd_m, 
  dcc_s1ctxt_rd_m, 
  dcc_pid_rd_m, 
  dcc_wtchpt_sel_m, 
  dcc_demap_asi_m, 
  dcc_wtchpt_rd_b, 
  dcc_rd_lsu_ctl_reg_b, 
  dcc_rd_diag_reg_b, 
  dcc_rd_diag_dca_b, 
  dcc_rd_core_id_b, 
  dcc_rd_intr_id_b, 
  dcc_rd_dt_diag_m, 
  dcc_rd_dt_diag_b, 
  dcc_stb_diag_rd_m, 
  dcc_rd_error_inj_b, 
  dcc_rd_pwr_mgmt_b, 
  dcc_wr_error_inj_m, 
  dcc_wr_error_inj_w, 
  dcc_tlb_data_read_b, 
  dcc_tlb_tag0_read_b, 
  dcc_tlb_tag1_read_b, 
  dcc_tlb_rw_index_e, 
  dcc_rd_rhs_asi_b, 
  dcc_lsu_asi_rd_b, 
  dcc_lsu_asi_sel_w, 
  dcc_stb_diag_sel_w3, 
  dcc_stb_data_rd_w3, 
  dcc_stb_ecc_rd_w3, 
  dcc_stb_ctl_rd_w3, 
  dcc_stb_addr_sel_w3, 
  dcc_stb_ptr_rd_w3, 
  dcc_direct_map, 
  dcc_dcs_memref_e, 
  dcc_tlb_lookup, 
  dcc_tlb_bypass, 
  dcc_tlb_real, 
  dcc_tlb_rd_e, 
  dcc_perror_b, 
  dcc_perr_enc_b, 
  dcc_dmo_parity, 
  lsu_va_w, 
  dcc_sbd_e_clken, 
  dcc_sbd_m_clken, 
  dcc_ldst_m_clken, 
  dcc_asi_rtn_vld, 
  dcc_asi_rtn_excp, 
  dcc_asi_rtn_rd, 
  lsu_exu_ld_vld_w, 
  lsu_exu_ld_b, 
  lsu_exu_tid_m, 
  lsu_exu_rd_m, 
  lsu_fgu_fld_vld_w, 
  lsu_fgu_fld_b, 
  lsu_fgu_fld_32b_b, 
  lsu_fgu_fld_odd32b_b, 
  lsu_fgu_fsr_load_b, 
  lsu_fgu_fld_tid_b, 
  lsu_fgu_fld_addr_b, 
  lsu_fgu_exception_w, 
  lsu_sync, 
  lsu_complete, 
  lsu_cpq_stall, 
  lsu_tlu_twocycle_m, 
  lsu_tlb_bypass_b, 
  lsu_tlb_real_b, 
  lsu_align_b, 
  lsu_lddf_align_b, 
  lsu_stdf_align_b, 
  lsu_dae_invalid_asi_b, 
  lsu_dae_nc_page_b, 
  lsu_dae_nfo_page_b, 
  lsu_dae_priv_viol_b, 
  lsu_dae_so_page, 
  lsu_priv_action_b, 
  lsu_va_watchpoint_b, 
  lsu_pa_watchpoint_b, 
  lsu_illegal_inst_b, 
  lsu_daccess_prot_b, 
  lsu_tlb_miss_b_, 
  lsu_perfmon_trap_b, 
  lsu_perfmon_trap_g, 
  lsu_tlu_dsfsr_ct_b, 
  lsu_sync_inst_b, 
  lsu_dttp_err_b, 
  lsu_dtdp_err_b, 
  lsu_dtmh_err_b, 
  lsu_ifu_direct_map, 
  dcc_mbi_run, 
  lsu_mbi_dca_fail, 
  lsu_mbi_lru_fail, 
  pmu_lsu_dcmiss_trap_m, 
  pmu_lsu_dtmiss_trap_m, 
  pmu_lsu_l2dmiss_trap_m, 
  lsu_pmu_mem_type_b, 
  lsu_dc_pmen, 
  lsu_lsu_pmen, 
  lsu_lsu_pmen_, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire dcc_pm_clken;
wire l1clk_pm1;
wire ifu_indx_clken;
wire l1clk_pm2;
wire l1clk;
wire dff_cerer_scanin;
wire dff_cerer_scanout;
wire cerer_dttp;
wire cerer_dttm;
wire cerer_dtdp;
wire cerer_dcvp;
wire cerer_dctp;
wire cerer_dctm;
wire cerer_dcdp;
wire exu_error_m;
wire [2:0] tid_m;
wire tlb_bypass_m;
wire exu_error_qual_m;
wire ld_inst_vld_m;
wire st_inst_vld_m;
wire flush_inst_m;
wire mb_inst_m;
wire exu_va_oor_m;
wire dff_flush_b_scanin;
wire dff_flush_b_scanout;
wire pipe_flush_b;
wire exu_error_pre_b;
wire exu_va_oor_b;
wire exu_error_b;
wire [2:0] tid_b;
wire twocycle_b;
wire fgu_error_b;
wire st_inst_vld_b;
wire fpldst_inst_vld_b;
wire dcc_any_exception_b;
wire flush_b;
wire flush_all_b;
wire dff_flush_w_scanin;
wire dff_flush_w_scanout;
wire flush_w;
wire dff_asi_d_scanin;
wire dff_asi_d_scanout;
wire [7:0] asi_d;
wire dcc_imm_asi_vld_e;
wire [7:0] dcc_asi_e;
wire altspace_e;
wire dmmu_enable_e;
wire ld_inst_unqual_e;
wire [7:0] asx_e;
wire asi_use_rd_e;
wire asi_use_sr_e;
wire mbi_run_local;
wire bist_cam_en;
wire asi_internal_e;
wire pref_inst_qual_e;
wire dff_dec_inst1_m_scanin;
wire dff_dec_inst1_m_scanout;
wire fpldst_inst_vld_m;
wire pref_inst_m;
wire casa_inst_pre_m;
wire ldstub_inst_pre_m;
wire swap_inst_pre_m;
wire ldst_dbl_m;
wire sr_inst_m;
wire pr_inst_m;
wire hpr_inst_m;
wire fsr_ldst_m;
wire imm_asi_vld_m;
wire casa_inst_m;
wire swap_inst_m;
wire ldstub_inst_m;
wire dff_sync_inst_scanin;
wire dff_sync_inst_scanout;
wire sync_inst_m;
wire sync_inst_pre_b;
wire mbi_scm_cam_en;
wire atomic_m;
wire asi_internal_m;
wire blk_inst_m;
wire [1:0] ldst_sz_mod_m;
wire asi_iomap_m;
wire asi_sync_m;
wire dff_dec_ctl_m_scanin;
wire dff_dec_ctl_m_scanout;
wire [1:0] ldst_sz_m;
wire [4:0] ld_rd_inst_m;
wire sign_ext_m;
wire asi_sz_byte_m;
wire asi_sz_hw_m;
wire asi_legal_m;
wire sxt_fsr_m;
wire [4:0] ld_rd_m;
wire [1:0] asi_type_m;
wire dff_dec_inst_b_scanin;
wire dff_dec_inst_b_scanout;
wire ld_inst_vld_b;
wire pref_inst_b;
wire casa_inst_b;
wire ldst_dbl_b;
wire atomic_b;
wire [1:0] asi_type_b;
wire sync_inst_b;
wire pst_asi_b;
wire tlb_tte_vld_b;
wire dff_dec_ctl_b_scanin;
wire dff_dec_ctl_b_scanout;
wire [1:0] ldst_sz_b;
wire [4:0] ld_rd_b;
wire ldst_sz_b0_b;
wire quad_asi_b;
wire [2:0] tid_d;
wire thread0_d;
wire thread1_d;
wire thread2_d;
wire thread3_d;
wire thread4_d;
wire thread5_d;
wire thread6_d;
wire thread7_d;
wire dff_tid_e_scanin;
wire dff_tid_e_scanout;
wire [2:0] tid_e;
wire thread0_e;
wire thread1_e;
wire thread2_e;
wire thread3_e;
wire thread4_e;
wire thread5_e;
wire thread6_e;
wire thread7_e;
wire dff_tid_m_scanin;
wire dff_tid_m_scanout;
wire dff_tid_b_scanin;
wire dff_tid_b_scanout;
wire thread0_b;
wire thread1_b;
wire thread2_b;
wire thread3_b;
wire thread4_b;
wire thread5_b;
wire thread6_b;
wire thread7_b;
wire dff_tid_w_scanin;
wire dff_tid_w_scanout;
wire [2:0] tid_w;
wire [7:0] thread_w;
wire fpld_32b_m;
wire fpld_odd32b_m;
wire altspace_ldst_e;
wire dff_altspace_m_scanin;
wire dff_altspace_m_scanout;
wire altspace_ldst_m;
wire dff_altspace_b_scanin;
wire dff_altspace_b_scanout;
wire altspace_ldst_b;
wire fpld_inst_m;
wire dff_fpld_b_scanin;
wire dff_fpld_b_scanout;
wire fpld_inst_b;
wire blk_asi_m;
wire blk_asi_b;
wire dff_oddrd_scanin;
wire dff_oddrd_scanout;
wire oddrd_m;
wire dff_rs2_m_scanin;
wire dff_rs2_m_scanout;
wire [7:0] rs2_m;
wire ldst_byte;
wire bad_fp_asi;
wire ldst_hword;
wire ldst_word;
wire ldst_dword;
wire [7:0] ldst_bmask;
wire [7:0] pst_bmask;
wire asi_pst32_m;
wire asi_pst16_m;
wire asi_pst8_m;
wire [7:0] lend_pst_bmask;
wire [7:0] ldst_bmask_mod;
wire asi_store_m;
wire pst_asi_m;
wire lendian_asi_m;
wire st_bmask_parity_m;
wire dff_sba_par_scanin;
wire dff_sba_par_scanout;
wire l1_ld_miss_b;
wire dcache_enable_b;
wire ncache_rq_b;
wire early_ld_m;
wire dcache_enable_m;
wire dff_early_ld_scanin;
wire dff_early_ld_scanout;
wire sync_pipe;
wire asi_dcd_diag_rd_b;
wire asi_sync_b;
wire dff_sync_pipe_scanin;
wire dff_sync_pipe_scanout;
wire [7:0] sync_st_in;
wire st_inst_vld_w;
wire [7:0] sync_st;
wire dff_sync_st_scanin;
wire dff_sync_st_scanout;
wire stb_diag_rd_e;
wire asi_cache_diag_wr_m;
wire dcache_enable_e;
wire dcache_read_e;
wire asi_dca_diag_rd_e;
wire asi_dta_diag_rd_e;
wire dcache_nodiag_read_e;
wire dc_enable_scanin;
wire dc_enable_scanout;
wire dcache_read_m;
wire dcache_nodiag_read_m;
wire dcache_read_b;
wire dcc_dca_rvld_m;
wire ld_fill_e;
wire dca_diag_wr_e;
wire l2fill_vld_m;
wire asi_dca_diag_rd_m;
wire dta_diag_wr_e;
wire diag_write_e;
wire [20:3] va_w;
wire [10:4] xinv_index;
wire [1:0] st_data_w;
wire [15:0] fill_bit_wen_e;
wire [15:0] xinval_bit_wen_e;
wire l2fill_vld_e;
wire dff_l2fill_m_scanin;
wire dff_l2fill_m_scanout;
wire int_fill_or_byp_m;
wire l2_perfmon_wb_cancel_m;
wire fp_fill_or_byp_m;
wire exu_ld_m;
wire fgu_fld_m;
wire dff_l2fill_b_scanin;
wire dff_l2fill_b_scanout;
wire int_fill_or_byp_b;
wire fp_fill_or_byp_b;
wire fld_32b_m;
wire fld_odd32b_m;
wire fld_sxt_fsr_m;
wire [4:0] return_rd_m;
wire [2:0] ld_tid_m;
wire dff_ld_tid_b_scanin;
wire dff_ld_tid_b_scanout;
wire [2:0] ld_tid_b;
wire dff_fp32_b_scanin;
wire dff_fp32_b_scanout;
wire fld_32b_b;
wire fld_odd32b_b;
wire fld_sxt_fsr_b;
wire [4:0] return_rd_b;
wire fsr_load_unqual_b;
wire ld_inst_qual_b;
wire exu_ld_vld_b;
wire fgu_fld_vld_b;
wire dff_ld_vld_w_scanin;
wire dff_ld_vld_w_scanout;
wire exu_ld_vld_w;
wire fgu_fld_vld_w;
wire ld_inst_vld_w;
wire pstate_cle_d;
wire pstate_cle_m;
wire dff_le_bits_scanin;
wire dff_le_bits_scanout;
wire pstate_cle_e;
wire pstate_cle_b;
wire l1hit_lendian_b;
wire asi_internal_b;
wire lendian_asi_b;
wire [2:0] byp_baddr_m;
wire asi_legal_e_unqual;
wire tl_gt_0_d;
wire [7:0] tl_gt_0;
wire dff_tl_gt_0_scanin;
wire dff_tl_gt_0_scanout;
wire tl_gt_0_e;
wire tl_gt_0_m;
wire dff_tlc_scanin;
wire dff_tlc_scanout;
wire tlc_use_primary_context_c1;
wire tlc_use_secondary_context_c1;
wire wr_or_demap;
wire tlc_use_primary_context_c2;
wire tlc_use_secondary_context_c2;
wire tlc_use_secondary_context;
wire tlc_use_primary_context;
wire primary_asi_e;
wire secondary_asi_e;
wire [1:0] context_enc_e;
wire dff_ct_scanin;
wire dff_ct_scanout;
wire [1:0] context_enc_m;
wire [1:0] context_enc_b;
wire hpstate_hpriv_e;
wire real_asi_e;
wire as_if_user_asi_e;
wire as_if_priv_asi_e;
wire dff_asi_m_scanin;
wire dff_asi_m_scanout;
wire blk_asi_e;
wire as_if_user_asi_m;
wire asi_legal_m_unqual;
wire dff_asi_b_scanin;
wire dff_asi_b_scanout;
wire asi_rngf_m;
wire quad_asi_m;
wire atomic_asi_m;
wire asi_indet_m;
wire binit_quad_asi_m;
wire nofault_asi_m;
wire quad_ld_m;
wire asi_rngf_b;
wire atomic_asi_b;
wire asi_store_b;
wire asi_indet_b;
wire binit_quad_asi_b;
wire nofault_asi_b;
wire quad_ldd_b;
wire [7:0] dcc_asi_b;
wire asi_legal_b;
wire bist_dtb_read_en;
wire asi_dca_diag_e;
wire asi_dta_diag_e;
wire dff_int_asi_m_scanin;
wire dff_int_asi_m_scanout;
wire asi_dca_diag_m;
wire asi_dta_diag_m;
wire asi_dta_diag_rd_m;
wire dcc_wtchpt_rd_m;
wire tlb_tag_read_m;
wire tlb_data_read_m;
wire asi_dcd_diag_rd_m;
wire lsu_asi_rd_m;
wire dff_int_asi_b_scanin;
wire dff_int_asi_b_scanout;
wire wr_error_inj_m;
wire lsu_asi_rd_b;
wire asi_dca_diag_rd_b;
wire stb_diag_rd_b;
wire wr_error_inj_b;
wire asi_cache_diag_wr_b;
wire dcc_tlb_tag_read_b;
wire dff_int_asi_w_scanin;
wire dff_int_asi_w_scanout;
wire lsu_asi_sel_b;
wire lsu_asi_sel_w;
wire stb_diag_rd_w;
wire asi_cache_diag_wr_w;
wire asi_dta_not_dca_diag_w;
wire asi_wtchpt_wr_b;
wire asi_ctl_reg_wr_b;
wire asi_diag_reg_wr_b;
wire asi_wr_pwr_mgmt_b;
wire asi_ceter_wr_b;
wire dff_wr_state_w_scanin;
wire dff_wr_state_w_scanout;
wire asi_wtchpt_wr_w;
wire asi_ctl_reg_wr_w;
wire asi_diag_reg_wr_w;
wire asi_wr_pwr_mgmt_w;
wire wr_error_inj_w;
wire asi_ceter_wr_w;
wire dff_tlu_asi_scanin;
wire dff_tlu_asi_scanout;
wire reload_asi_0_valid;
wire reload_asi_1_valid;
wire [1:0] reload_asi_0_tid;
wire [1:0] reload_asi_1_tid;
wire stb_diag_rd_w_qual;
wire stb_ptr_rd_w2;
wire stb_diag_rd_w2;
wire [10:4] va_w2;
wire stb_data_rd_w2;
wire stb_ecc_rd_w2;
wire stb_ctl_rd_w2;
wire stb_addr_rd_w2;
wire dff_stb_w3_scanin;
wire dff_stb_w3_scanout;
wire stb_data_rd_w3;
wire stb_ecc_rd_w3;
wire stb_ctl_rd_w3;
wire stb_ptr_rd_w3;
wire stb_addr_rd_w3;
wire [1:0] diag_reg_in;
wire [1:0] diag_reg;
wire dff_diag_reg_scanin;
wire dff_diag_reg_scanout;
wire [1:0] way_hit_enc;
wire [1:0] ld_way_b;
wire [1:0] way_err_enc;
wire [1:0] rway;
wire [3:0] lru_line_sel;
wire [5:0] lru_rd_data_m;
wire bypass_from_w2;
wire ld_inst_vld_w2;
wire bypass_from_w;
wire bypass_from_b;
wire [5:0] lru_state_in_m;
wire [5:0] new_lru_state_b;
wire [5:0] lru_state_w;
wire [5:0] lru_state_w2;
wire dff_lru_data_b_scanin;
wire dff_lru_data_b_scanout;
wire [5:0] lru_state_in_b;
wire [5:0] lru_state_b;
wire [3:0] lru_way;
wire ldhit_b;
wire [3:0] used_way;
wire dff_new_lru_w_scanin;
wire dff_new_lru_w_scanout;
wire [5:0] new_lru_state_w;
wire [5:0] old_lru_state_w;
wire dff_new_lru_w2_scanin;
wire dff_new_lru_w2_scanout;
wire update_lru_noraw_b;
wire update_lru_raw_b;
wire dff_update_lru_scanin;
wire dff_update_lru_scanout;
wire update_lru_noraw_w;
wire update_lru_raw_w;
wire lru_new_state;
wire [2:0] ld_rq_type;
wire pgnum_b39_qual;
wire [1:0] ld_pkt_way_b;
wire [60:40] mem_ld_miss_ctl;
wire pref_ice_b;
wire [60:40] asi_ld_miss_ctl;
wire dff_sync_inst_w_scanin;
wire dff_sync_inst_w_scanout;
wire sync_inst_w;
wire [1:0] st_rq_type_b;
wire dff_st_type_w_scanin;
wire dff_st_type_w_scanout;
wire pstate_priv_d;
wire hpstate_hpriv_d;
wire dff_priv_state_e_scanin;
wire dff_priv_state_e_scanout;
wire pstate_priv_e;
wire dff_priv_state_m_scanin;
wire dff_priv_state_m_scanout;
wire pstate_priv_m;
wire hpstate_hpriv_m;
wire bst_priv_m;
wire bst_hpriv_m;
wire pstate_priv_m_in;
wire pstate_priv_b;
wire hpstate_hpriv_m_in;
wire hpstate_hpriv_b;
wire dff_priv_state_b_scanin;
wire dff_priv_state_b_scanout;
wire tlb_bypass_b;
wire blk_rd_align_err_m;
wire rd_odd_align_err_m;
wire illegal_spr_m;
wire asr_legal_m;
wire pst_with_imm_m;
wire asi_wo_viol;
wire priv_wrpr_tick_m;
wire wrhpr_ver_m;
wire tl_eq_0_m;
wire illegal_inst_m;
wire hw_aligned;
wire wd_aligned;
wire dw_aligned;
wire qw_aligned;
wire bl_aligned;
wire hw_size;
wire wd_size;
wire dw_size;
wire bl_size;
wire qw_size;
wire mem_addr_not_aligned;
wire lddf_not_aligned;
wire stdf_not_aligned;
wire hpriv_asi;
wire hpriv_asi_excp;
wire priv_action_m;
wire illegal_asi_m;
wire non_atomic_asi_m;
wire atomic_uncache_b;
wire nfo_pg_nonnfo_asi_b;
wire nfo_asi_ebit_b;
wire user_page_access_m;
wire dff_usr_pg_access_b_scanin;
wire dff_usr_pg_access_b_scanout;
wire user_page_access_b;
wire priv_page_viol_b;
wire ldxa_asi_exception;
wire quad_ldda_exception;
wire block_inst_exception;
wire bld_to_io_b;
wire nofault_st_exception;
wire bis_with_fp;
wire asi_ro_viol;
wire asi_read_only_m;
wire asi_write_only_m;
wire bad_asi_va_exception_m;
wire asi_no_va_check_m;
wire legal_asi_va_m;
wire wrpriv_intq_reg_m;
wire dae_invalid_asi_m;
wire dff_excp_b_scanin;
wire dff_excp_b_scanout;
wire tlb_real_m;
wire dae_invalid_asi_b;
wire tlb_real_b;
wire access_exception_b;
wire va_wpt_en_m;
wire pa_wpt_en_m;
wire va_wpt_rd_en_m;
wire va_wpt_wr_en_m;
wire pa_wpt_rd_en_m;
wire pa_wpt_wr_en_m;
wire [7:0] wpt_bmask;
wire mask_match_m;
wire va_wpt_check_m;
wire pa_wpt_check_m;
wire dff_wpt_scanin;
wire dff_wpt_scanout;
wire va_wpt_check_b;
wire pa_wpt_check_b;
wire asi_rtn_vld_2f;
wire asi_rtn_excp_2f;
wire asi_rtn_rd_2f;
wire [2:0] asi_rtn_tid_2f;
wire dff_asi_g_scanin;
wire dff_asi_g_scanout;
wire asi_rtn_vld_3f;
wire asi_rtn_excp_3f;
wire asi_rtn_rd_3f;
wire [2:0] asi_rtn_tid_3f;
wire dff_except_scanin;
wire dff_except_scanout;
wire priv_action_b;
wire nop_pref_func;
wire pref_nop_b;
wire dff_fgu_excp_w_scanin;
wire dff_fgu_excp_w_scanout;
wire [10:5] if_indx_0_in;
wire [10:5] if_indx_0;
wire [10:5] if_indx_1_in;
wire [10:5] if_indx_1;
wire [10:5] if_indx_2_in;
wire [10:5] if_indx_2;
wire [10:5] if_indx_3_in;
wire [10:5] if_indx_3;
wire [10:5] if_indx_4_in;
wire [10:5] if_indx_4;
wire [10:5] if_indx_5_in;
wire [10:5] if_indx_5;
wire [10:5] if_indx_6_in;
wire [10:5] if_indx_6;
wire [10:5] if_indx_7_in;
wire [10:5] if_indx_7;
wire dff_if_indx_0_scanin;
wire dff_if_indx_0_scanout;
wire dff_if_indx_1_scanin;
wire dff_if_indx_1_scanout;
wire dff_if_indx_2_scanin;
wire dff_if_indx_2_scanout;
wire dff_if_indx_3_scanin;
wire dff_if_indx_3_scanout;
wire dff_if_indx_4_scanin;
wire dff_if_indx_4_scanout;
wire dff_if_indx_5_scanin;
wire dff_if_indx_5_scanout;
wire dff_if_indx_6_scanin;
wire dff_if_indx_6_scanout;
wire dff_if_indx_7_scanin;
wire dff_if_indx_7_scanout;
wire dff_way_vld_b_scanin;
wire dff_way_vld_b_scanout;
wire [3:0] cache_way_vld_b;
wire [3:0] dval_perr_b;
wire dval_perror_b;
wire [3:0] dtag_perr_b;
wire dtag_perror_b;
wire mhit_err_b;
wire mhit_error_b;
wire [3:0] data_perr_b;
wire data_perror_b;
wire [2:0] way_err;
wire prty_ctxt;
wire tag_parity;
wire dcmiss_trap_m;
wire dtmiss_trap_m;
wire dcmiss_trap_b;
wire dtmiss_trap_b;
wire l2miss_no_atomic_e;
wire dff_l2miss_scanin;
wire dff_l2miss_scanout;
wire l2miss_no_atomic_m;
wire l2lmiss_trap_e;
wire dff_pmu_trap_scanin;
wire dff_pmu_trap_scanout;
wire load_complete_e;
wire l2lmiss_trap_m;
wire load_complete_m;
wire sbd_m_clken;
wire dff_pwr_mgmt_scanin;
wire dff_pwr_mgmt_scanout;
wire dff_bist_run_scanin;
wire dff_bist_run_scanout;
wire dff_bist_in_scanin;
wire dff_bist_in_scanout;
wire bist_dca_rd_1;
wire bist_lru_rd_1;
wire tlb_cam_en_pre;
wire bist_dca_cmp_en;
wire bist_lru_cmp_en;
wire dca_parity_compare;
wire dca_fail;
wire lru_fail;
wire dff_bist_fail_scanin;
wire dff_bist_fail_scanout;
wire spares_scanin;
wire spares_scanout;


// Inputs from decode unit.
input		dec_lsu_tg_d;		// Thread group of instruction in D
input		dec_ld_inst_d;		// Load instruction in D
input		dec_ld_inst_e;		// Load instruction in E
input		dec_st_inst_e;		// Store instruction in E
input		dec_fpldst_inst_e;	// Float ldst instruction in E
input		dec_fsr_ldst_e;		// LDFSR/STFSR instruction in E
input		dec_ldst_dbl_e;		// LDD or STB instruction in E
input		dec_pref_inst_e;	// Prefetch instruction in E
input		dec_flush_inst_e;	// Flush instruction in E
input		dec_memstbar_inst_e;	// Membar/stbar instruction in E
input		dec_sr_inst_e;		// Rd/rw state register instruction in E
input		dec_pr_inst_e;		// Rd/rw priv. register instruction in E
input		dec_hpr_inst_e;		// Rd/rw hyper-priv. register instruction in E
input		dec_casa_inst_e;	// CASA instruction in E
input		dec_ldstub_inst_e;	// LDSTUB instruction in E
input		dec_swap_inst_e;	// SWAP instruction in E
input		dec_altspace_d;		// Memory access to alternate space
input		dec_sign_ext_e;		// Instruction requiring sign extension of data (op3[3:2]==10)
input	[1:0]	dec_ldst_sz_e;		// Size bits for the instruction in E
input	[4:0]	dec_lsu_rd_e;		// Dest. register for load data
input	[4:0]	dec_sraddr_e;		// Source register for store data
input		dec_imm_asi_vld_d;	// Instruction in D uses immediate ASI 
input	[7:0]	dec_imm_asi_d;
input		dec_flush_lm;
input		dec_flush_lb;
input	[1:0]	dec_lsu_tid0_d;
input	[1:0]	dec_lsu_tid1_d;

input	[7:0]	tlu_pstate_cle;		// PSTATE.CLE bit for the 8 threads
input	[1:0]	tlu_asi_0_tid;		// Thread for TLU reload
input	[1:0]	tlu_asi_1_tid;		// Thread for TLU reload
input		tlu_asi_0_valid;
input		tlu_asi_1_valid;
input		tlu_flush_lsu_b;
input	[7:0]	tlu_lsu_hpstate_hpriv;
input	[7:0]	tlu_lsu_pstate_priv;
input	[7:0]	tlu_tl_gt_0;
input	[7:0]	tlu_lsu_clear_ctl_reg_;
input		tlu_cerer_dttp;
input		tlu_cerer_dttm;
input		tlu_cerer_dtdp;
input		tlu_cerer_dcvp;
input		tlu_cerer_dctp;
input		tlu_cerer_dctm;
input		tlu_cerer_dcdp;

input		tlc_use_primary_context_c0;
input		tlc_use_secondary_context_c0;
input	[2:0]	tld_tid;
input		tlc_wr_or_demap;
input		tld_va_m_eq_zero;	// Zero compare result of VA[47:16]

input	[1:0]	exu_lsu_va_error_m;
input	[1:0]	exu_ecc_m;
input	[7:0]	exu_lsu_rs2_e;

input		fgu_fst_ecc_error_fx2;	// ECC error on FRF read (B)

input	[1:0]	lmd_sz_m;		// Size bits from LMQ
input		lmd_fpld_m;		// Load float
input		lmd_sxt_fsr_m;		// Sign extend / LDFSR for load misses
input	[4:0]	lmd_rd_m;
input		lmd_fpodd32b_m;
input		lmd_fp32b_m;
input		lmd_bendian_m;
input	[10:3]	lmd_fill_addr_e;
input	[2:0]	lmd_ld_addr_m;		// Byte offset address of LMQ entry
input	[1:0]	lmd_fill_way_e;		// Replacement way for fill data write
input		lmd_wrtag_parity_e;

input	[2:0]	lmc_cpq_tid_m;		// Thread ID of fill packet
input	[7:0]	lmc_thrd_byp_sel_e;	// Thread is bypassing data
input	[2:0]	lmc_byp_tid_m;		// Thread is bypassing data
input		lmc_byp_vld_m;		// Thread is bypassing data
input		lmc_asi_bypass_m;	// ASI data is byapssing now
input	[7:0]	lmc_pref_issued;
input		lmc_bld_annul;
input		lmc_bld_last_e;
input		lmc_bld_miss_e;
input		lmc_full_raw_w;
input		lmc_ld_stall;
input		lmc_l2_err_noup;
input		lmc_l2_uerr;

input		tlb_tte_ie_b;		// Invert endianess bit
input		tlb_tte_cp_b;		// Cacheable physical bit
input		tlb_tte_wbit_b;		// Writeable page bit
input		tlb_tte_ebit_b;		// Side effect bit
input		tlb_tte_pbit_b;		// Privileged page bit
input		tlb_tte_nfo_b;		// Non faulting page bit
input	[3:0]	tlb_cache_way_hit_b;	// tag compare result		
input		tlb_cache_hit_b;	// OR of the four way tag compares
input		tlb_pgnum_b39;		// For indetifying IO accesses
input 		tlb_cam_hit;
input		tlb_cam_mhit;
input	[2:0]	tlb_pgsize;
input		tlb_context0_hit;
input		tlb_tag_parity;
input		tlb_tte_data_parity;

input	[7:0]	dcs_asi_d;		// ASI value of instruction in E stage
input	[7:0]	dcs_wpt_mask_m;
input	[1:0]	dcs_wpt_enable_m;
input	[1:0]	dcs_wpt_mode_m;
input	[7:0]	dcs_dc_enable;
input		dcs_dmmu_enable_d;

input	[15:0]	lsu_va_m;		// VA of instruction in M
input	[20:3]	lsu_va_b;		// VA of instruction in B

input		cic_l2fill_vld_e;	// Fill data is coming from the cpx
//input		cic_cpq_ld_rdy;		// Load at cpq head and cpq is not blocked
input		cic_cpq_ld_sel;		// Load at cpq head (blocking unknown)
input		cic_invalidate_e;	// Invalidations are coming from the cpx
input		cic_xinval_e;		// Cross invalidation
input		cic_st_update_e;	// Store data writes to cache
input		cic_rtn_cmplt;		// Load/Atomic complete
input		cic_oddrd_e;		// 2nd pass of a 2 pass load
input	[15:0]	cic_inv_wen_e;		// Invalidation data
input		cic_cpq_stall;

input	[2:0]	cid_tid;		// Thread ID of packet at head of CPQ
input	[1:0]	cid_xway;		// Way for cross invalidation
input	[10:3]	cid_st_addr;		// Index for store update
input	[1:0]	cid_st_way;		// Way for store update
input	[7:0]	cid_st_bmask;		// Byte mask for store update
input	[10:6]  cid_inv_index;		// Cache index for invalidation
input		cid_ncache;		// NC bit of the CPX packet
input		cid_atomic;		// Also indicates 2nd ifill packet
input		cid_l2miss;

input		stb_cam_hit;		// RAW hit in the stb

input		sbc_bst_in_prog_m;
input	[2:0]	sbc_tid_m;

input	[7:0]	lsu_block_store_alloc;
input	[7:0]	lsu_block_store_kill;

input	[1:0]	sbd_st_data_b;		// store data
input		tgd_w0_parity_b;
input		tgd_w1_parity_b;
input		tgd_w2_parity_b;
input		tgd_w3_parity_b;
input		tgd_va_wp_47_16;
input		tgd_va_wp_15_3;
input		tgd_pa_wp_39_16;
input		tgd_pa_wp_15_3;
input		tgd_prty_256m_b;
input		tgd_prty_4m_b;
input		tgd_prty_64k_b;
input		tgd_prty_8k_b;
input		tgd_prty_ctxt0_b;
input		tgd_prty_ctxt1_b;
input	[3:0]	tgc_cache_way_vld_m;
input	[3:0]	tgc_verr_b;

input		dca_perr_w0_b;
input		dca_perr_w1_b;
input		dca_perr_w2_b;
input		dca_perr_w3_b;
input	[7:0]	dca_rparity_b;

input	[23:0]	lru_rdata_m;

input		ifu_lsu_if_vld;		// ifetch request (for cross invalidation)
input	[2:0]	ifu_lsu_if_tid;
input	[10:5]	ifu_lsu_if_addr;

input	[6:0]	arc_pid_ctl_2f;

input	[1:0]	dcd_dca_data_compare;

input		lbist_run;
input	[8:0]	mbi_addr;
input	[7:0]	mbi_wdata;
input		mbi_run;
input		mbi_dca_read_en;
input		mbi_dca_write_en;
input		mbi_cmpsel;
input		mbi_dta_read_en;
input		mbi_dta_write_en;
input		mbi_dva_read_en;
input		mbi_dva_write_en;
input		mbi_lru_read_en;
input		mbi_lru_write_en;
input		mbi_dtb_read_en;
input		mbi_dtb_cam_en_pre;
input		mbi_scm_cam_en_pre;

input		dmo_dcmuxctl;

input	[7:0]	bist_cmp_data;
input	[1:0]	bist_cmpsel_1;
input	[8:5]	bist_addr_1;
input		bist_srm_rd_1;
input		bist_scm_rd_1;

input	[7:0]	lsu_trap_flush;		// must send lsu_complete on a trap_flush

output		dcc_exception_flush_b;
output		dcc_asi_load_m;		// Access is to internal ASI
output		dcc_asi_load_b;		// Access is to internal ASI
output		dcc_asi_store_b;	// Access is to internal ASI
output		dcc_asi_iomap_m;
output		dcc_asi_iomap_b;
output		dcc_asi_rngf_b;		// ASI access targeted to fast ring
output		dcc_asi_indet_b;	// ASI access is indeterminate
output		dcc_binit_st_b;

output		dcc_dca_rvld_e;		// Dcache read enable
output		dcc_dca_wvld_e;		// Dcache write enable
output		dcc_dca_clk_en_e;	// Dcache array clock enable
output		dcc_dca_wclk_en_e;	// Dcache output flop clock enable
output		dcc_dca_rclk_en_m;	// Dcache output flop clock enable
output		dcc_dca_bypass_e_;	// Dcache bypass enable
output	[1:0]	dcc_dca_fill_way_e;	// Dcache replacement way
output	[10:3]	dcc_dca_fill_addr_e;	// Dcache write index
output	[15:0]	dcc_dca_byte_wr_en_e;	// Dcache byte enables
output	[7:0]	dcc_parity_invert;
output		dcc_dta_parity;
output		dcc_alt_addr_sel_e;	// read/write addr select for dca
output		dcc_alt_way_sel_m;	// way source select for dca
output	[3:0]	dcc_alt_rsel_way_m;	// Way select for bist/diag
output	[10:4]	dcc_dta_fill_addr_e;	// Dtag write index
output	[1:0]	dcc_dta_fill_way_e;	// Dcache replacement way
output		dcc_dta_wvld_e;		// dtag write enable
output		dcc_dta_rvld_e;		// dtag read enable
output		dcc_dta_index1_sel_e;	// dtag address select
output		dcc_dta_clken;		// dtag clock enable
output		dcc_dva_wvld_e;		// dva write enable
output		dcc_dva_rvld_e;		// dva write enable
output		dcc_dva_din_e;		// dva write data
output		dcc_dva_din2_e;		// dva write data (redundant copy)
output	[10:6]	dcc_dva_wr_addr_e;	// dva update address
output	[15:0]	dcc_dva_bit_wen_e;	// Valid bit mapping
output		dcc_cache_diag_wr_m;
output		dcc_cache_diag_wr_b;
output		dcc_lru_rvld_e;
output		dcc_lru_wvld_w;
output	[5:0]	dcc_lru_wdata_w;
output	[3:0]	dcc_lru_wen_w;
output	[10:6]	dcc_lru_wr_addr_w;
output	[7:0]	dcc_ldst_bmask;
output		dcc_bmask_parity_b;

output		dcc_ld_miss_b;		// Load needs to go to L2
output		dcc_early_ld_b;		// Load with D$ enabled to pcx
output		dcc_stb_quad_ld_cam;

output		dcc_l2fill_vld_m;

output	[1:0]	dcc_ctxt_tid0_d;
output	[1:0]	dcc_ctxt_tid1_d;
output		dcc_ctxt_tg_d;
output	[2:0]	dcc_tid_e;		// Used by other blocks in the LSU
output	[2:0]	dcc_tid_m;		// Used by other blocks in the LSU
output	[2:0]	dcc_tid_b;		// Used by other blocks in the LSU
output	[7:0]	dcc_asi_m;
output		dcc_ld_inst_unqual_e;
output		dcc_ld_inst_vld_m;
output		dcc_stb_cam_vld_m;
output	[2:0]	dcc_baddr_m;
output		dcc_signed_m;
output		dcc_pref_inst_m;
output		dcc_std_inst_m;
output		dcc_ldstub_inst_m;
output		dcc_atomic_b;
output		dcc_casa_inst_b;
output		dcc_lendian_pre_m;
output		dcc_bendian_byp_m;
output		dcc_pst_asi_b;
output		dcc_tte_vld_m;
output	[1:0]	dcc_ldst_sz_m;		// Size for loads and stores
output	[1:0]	dcc_ld_sz_m;		// Size for loads
output		dcc_fp32b_sel_m;	// Selects 32b fp store data
output		dcc_blk_inst_m;		// Block load/store instruction in pipe
output		dcc_blk_inst_b;		// Block load/store instruction in pipe
output		dcc_ldbl_b;		// Double return instruction (LDD/QUAD/BLD)
output		dcc_ncache_b;
output	[1:0]	dcc_st_rq_type_w;
output		dcc_sync_pipe_w;	// so other blocks know when an instruction was sync'ed
output		dcc_priv_b;
output		dcc_hpriv_b;
output		dcc_pctxt_sel_e;
output		dcc_sctxt_sel_e;
output		dcc_ld_miss_ldd;
output	[60:40]	dcc_ld_miss_ctl;	// Load miss info for the LMQ

output	[7:0]	dcc_sync_inst_w;	// Sync instruction to store buffers

output	[7:0]	dcc_asi_reload_sel;
output	[7:0]	dcc_wr_wtchpt;
output	[7:0]	dcc_wr_lsu_ctl_reg;
output		dcc_wr_pwr_mgmt;
output		dcc_ceter_wr_w;
output		dcc_p0ctxt_rd_m;
output		dcc_p1ctxt_rd_m;
output		dcc_s0ctxt_rd_m;
output		dcc_s1ctxt_rd_m;
output		dcc_pid_rd_m;
output		dcc_wtchpt_sel_m;
output		dcc_demap_asi_m;
output		dcc_wtchpt_rd_b;
output		dcc_rd_lsu_ctl_reg_b;
output		dcc_rd_diag_reg_b;
output		dcc_rd_diag_dca_b;
output		dcc_rd_core_id_b;
output		dcc_rd_intr_id_b;
output		dcc_rd_dt_diag_m;
output		dcc_rd_dt_diag_b;
output		dcc_stb_diag_rd_m;
output		dcc_rd_error_inj_b;
output		dcc_rd_pwr_mgmt_b;
output		dcc_wr_error_inj_m;
output		dcc_wr_error_inj_w;	// flush qualified
output		dcc_tlb_data_read_b;
output		dcc_tlb_tag0_read_b;
output		dcc_tlb_tag1_read_b;
output		dcc_tlb_rw_index_e;
output		dcc_rd_rhs_asi_b;	// reading an ASI on the right hand side
output		dcc_lsu_asi_rd_b;
output		dcc_lsu_asi_sel_w;
output		dcc_stb_diag_sel_w3;
output		dcc_stb_data_rd_w3;
output		dcc_stb_ecc_rd_w3;
output		dcc_stb_ctl_rd_w3;
output		dcc_stb_addr_sel_w3;
output		dcc_stb_ptr_rd_w3;
output		dcc_direct_map;		// output for diag reads only
output		dcc_dcs_memref_e;	// Used for power management
output		dcc_tlb_lookup;
output		dcc_tlb_bypass;
output		dcc_tlb_real;
output		dcc_tlb_rd_e;
output		dcc_perror_b;
output	[1:0]	dcc_perr_enc_b;		// error encoding
output	[3:0]	dcc_dmo_parity;

output	[12:3]	lsu_va_w;

output		dcc_sbd_e_clken;
output		dcc_sbd_m_clken;
output		dcc_ldst_m_clken;	// ld/st instruction in M

output	[7:0]	dcc_asi_rtn_vld;
output		dcc_asi_rtn_excp;
output		dcc_asi_rtn_rd;

output		lsu_exu_ld_vld_w;	// Valid data is being sent to the IRF
output		lsu_exu_ld_b;
output	[2:0]	lsu_exu_tid_m;		// Thread ID of return data
output	[4:0]	lsu_exu_rd_m;		
output		lsu_fgu_fld_vld_w;	// Valid data is being sent to the FRF
output		lsu_fgu_fld_b;
output		lsu_fgu_fld_32b_b;
output		lsu_fgu_fld_odd32b_b;
output		lsu_fgu_fsr_load_b;
output	[2:0]	lsu_fgu_fld_tid_b;	// Thread ID of return data
output	[4:0]	lsu_fgu_fld_addr_b;		
output		lsu_fgu_exception_w;
output	[7:0]	lsu_sync;		// Flush thread
output	[7:0]	lsu_complete;		// Restart the thread
output		lsu_cpq_stall;		// Stall pipe at decode

output		lsu_tlu_twocycle_m;		// A two-cycle op is in M
output		lsu_tlb_bypass_b;
output		lsu_tlb_real_b;
output		lsu_align_b;
output		lsu_lddf_align_b;
output		lsu_stdf_align_b;
output		lsu_dae_invalid_asi_b;
output		lsu_dae_nc_page_b;
output		lsu_dae_nfo_page_b;
output		lsu_dae_priv_viol_b;
output		lsu_dae_so_page;
output		lsu_priv_action_b;
output		lsu_va_watchpoint_b;
output		lsu_pa_watchpoint_b;
output		lsu_illegal_inst_b;
output		lsu_daccess_prot_b;
output 		lsu_tlb_miss_b_;
output		lsu_perfmon_trap_b;
output		lsu_perfmon_trap_g;
output	[1:0]	lsu_tlu_dsfsr_ct_b;

output		lsu_sync_inst_b;
output		lsu_dttp_err_b;
output		lsu_dtdp_err_b;
output		lsu_dtmh_err_b;

output		lsu_ifu_direct_map;

output		dcc_mbi_run;
output		lsu_mbi_dca_fail;
output		lsu_mbi_lru_fail;

input		pmu_lsu_dcmiss_trap_m;
input		pmu_lsu_dtmiss_trap_m;
input	[7:0]	pmu_lsu_l2dmiss_trap_m;

output	[2:0]	lsu_pmu_mem_type_b;	// 2:0 - {l2 d-miss, dt_miss, d-cache miss}

input		lsu_dc_pmen;
input		lsu_lsu_pmen;		// Dynamic power management enable
output		lsu_lsu_pmen_;

// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

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
lsu_dcc_ctl_l1clkhdr_ctl_macro clkgen_pm (
        .l2clk  (l2clk                          ),
        .l1en   (dcc_pm_clken                   ),
        .l1clk  (l1clk_pm1                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_dcc_ctl_l1clkhdr_ctl_macro clkgen_ifu_indx (
        .l2clk  (l2clk                          ),
        .l1en   (ifu_indx_clken                 ),
        .l1clk  (l1clk_pm2                      ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_dcc_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk                          ),
        .l1en   (1'b1                           ),
        .l1clk  (l1clk                          ),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

lsu_dcc_ctl_msff_ctl_macro__width_7 dff_cerer  (
	.scan_in(dff_cerer_scanin),
	.scan_out(dff_cerer_scanout),
	.l1clk	(l1clk_pm1),
	.din	({tlu_cerer_dttp,tlu_cerer_dttm, tlu_cerer_dtdp,tlu_cerer_dcvp,tlu_cerer_dctp,
		  tlu_cerer_dctm,tlu_cerer_dcdp}),
	.dout	({cerer_dttp,    cerer_dttm,     cerer_dtdp,    cerer_dcvp,    cerer_dctp,    
		  cerer_dctm,    cerer_dcdp}),
  .siclk(siclk),
  .soclk(soclk)
);

//////////////////////////////
// Flush logic
//////////////////////////////

// Factor upstream exceptions into flush.  VA error is ignored if tlb_bypass.
assign exu_error_m = tid_m[2] ? (exu_ecc_m[1] | (exu_lsu_va_error_m[1] & ~tlb_bypass_m)) :
                                (exu_ecc_m[0] | (exu_lsu_va_error_m[0] & ~tlb_bypass_m)) ;
assign exu_error_qual_m = exu_error_m & (ld_inst_vld_m | st_inst_vld_m | flush_inst_m | mb_inst_m);

assign exu_va_oor_m = tid_m[2] ? exu_lsu_va_error_m[1] : exu_lsu_va_error_m[0];

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_flush_b  (
	.scan_in(dff_flush_b_scanin),
	.scan_out(dff_flush_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dec_flush_lm,exu_error_qual_m,exu_va_oor_m}),
	.dout	({pipe_flush_b,exu_error_pre_b, exu_va_oor_b}),
  .siclk(siclk),
  .soclk(soclk)
);

// Need to take into account ECC errors on the second read of a STD instruction
assign exu_error_b = exu_error_pre_b | 
                     ((tid_b[2] ? exu_ecc_m[1] : exu_ecc_m[0]) & twocycle_b);

// Internally generated flush conditions
assign fgu_error_b = fgu_fst_ecc_error_fx2 & st_inst_vld_b & fpldst_inst_vld_b;

assign dcc_exception_flush_b = dcc_any_exception_b | exu_error_b | fgu_error_b;

assign flush_b = dec_flush_lb | pipe_flush_b | dcc_any_exception_b | exu_error_b | fgu_error_b;

assign flush_all_b = flush_b | tlu_flush_lsu_b;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_flush_w  (
	.scan_in(dff_flush_w_scanin),
	.scan_out(dff_flush_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(flush_all_b),
	.dout	(flush_w),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Stage the main lsu controls coming from the decode and trap units.
////////////////////////////////////////////////////////////////////////////////

// 0in bits_on -var {(dec_ld_inst_e | dec_st_inst_e) & altspace_e,(dec_ld_inst_e | dec_st_inst_e) & dec_sr_inst_e,(dec_ld_inst_e | dec_st_inst_e) & dec_pr_inst_e,(dec_ld_inst_e | dec_st_inst_e) & dec_hpr_inst_e} -max 1

lsu_dcc_ctl_msff_ctl_macro__width_12 dff_asi_d  (
	.scan_in(dff_asi_d_scanin),
	.scan_out(dff_asi_d_scanout),
	.din	({dec_imm_asi_vld_d, asi_d[7:0],     dec_altspace_d,dcs_dmmu_enable_d,dec_ld_inst_d}),
	.dout	({dcc_imm_asi_vld_e, dcc_asi_e[7:0], altspace_e,    dmmu_enable_e,    ld_inst_unqual_e}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_ld_inst_unqual_e = ld_inst_unqual_e;

assign asi_d[7:0] = dec_imm_asi_vld_d ? dec_imm_asi_d[7:0] : dcs_asi_d[7:0];

assign asx_e[7:0] = ({8{asi_use_rd_e}} & {3'b000,dec_lsu_rd_e[4:0]}) |
                    ({8{asi_use_sr_e}} & {3'b000,dec_sraddr_e[4:0]}) |
                    ({8{~(asi_use_rd_e | asi_use_sr_e)}} & dcc_asi_e[7:0]);

assign dcc_tlb_lookup = mbi_run_local ? bist_cam_en :
                       ((dec_ld_inst_e | dec_st_inst_e) & ~asi_internal_e & ~dcc_tlb_bypass) ;

assign dcc_tlb_rw_index_e = ld_inst_unqual_e;

// dcc_memref_e is used to gate registers for power management
assign dcc_dcs_memref_e = dec_ld_inst_e | dec_st_inst_e | mbi_run_local | lsu_lsu_pmen_ ;

assign pref_inst_qual_e = dec_ld_inst_e & dec_pref_inst_e;

lsu_dcc_ctl_msff_ctl_macro__width_13 dff_dec_inst1_m  (
	.scan_in(dff_dec_inst1_m_scanin),
	.scan_out(dff_dec_inst1_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dec_ld_inst_e, dec_st_inst_e, dec_fpldst_inst_e, 
		 pref_inst_qual_e, 
		 dec_casa_inst_e, dec_ldstub_inst_e, dec_swap_inst_e,
		 dec_ldst_dbl_e, dec_sr_inst_e, dec_pr_inst_e, dec_hpr_inst_e,
	         dec_fsr_ldst_e, dcc_imm_asi_vld_e}),
	.dout	({ld_inst_vld_m, st_inst_vld_m, fpldst_inst_vld_m,
		 pref_inst_m,    
		 casa_inst_pre_m, ldstub_inst_pre_m, swap_inst_pre_m,
		 ldst_dbl_m,     sr_inst_m,     pr_inst_m,     hpr_inst_m,
	         fsr_ldst_m,     imm_asi_vld_m}),
  .siclk(siclk),
  .soclk(soclk)
);

assign casa_inst_m = casa_inst_pre_m & st_inst_vld_m;
assign swap_inst_m = swap_inst_pre_m & st_inst_vld_m;
assign ldstub_inst_m = ldstub_inst_pre_m & st_inst_vld_m;
assign dcc_ldstub_inst_m = ldstub_inst_m;

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_sync_inst  (
	.scan_in(dff_sync_inst_scanin),
	.scan_out(dff_sync_inst_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dec_memstbar_inst_e, dec_flush_inst_e,sync_inst_m}),
	.dout	({mb_inst_m,           flush_inst_m,    sync_inst_pre_b}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_ld_inst_vld_m = ld_inst_vld_m; 	// Used in other blocks

assign dcc_stb_cam_vld_m = mbi_run_local ? mbi_scm_cam_en :
       (ld_inst_vld_m & ~pref_inst_m & ~atomic_m & ~asi_internal_m & ~dec_flush_lm & ~blk_inst_m);

assign dcc_pref_inst_m = pref_inst_m;	 	// Used in other blocks
assign dcc_std_inst_m = ldst_dbl_m & st_inst_vld_m & ~fpldst_inst_vld_m;
assign dcc_fp32b_sel_m = fpldst_inst_vld_m & ldst_sz_mod_m[1] & ~ldst_sz_mod_m[0];

assign atomic_m = casa_inst_m | ldstub_inst_m | swap_inst_m;

// Use lbist_run here to force the store address mux.
assign dcc_asi_iomap_m = asi_iomap_m;

assign sync_inst_m = flush_inst_m | mb_inst_m | (asi_sync_m & st_inst_vld_m);

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_dec_ctl_m  (
	.scan_in(dff_dec_ctl_m_scanin),
	.scan_out(dff_dec_ctl_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dec_ldst_sz_e[1:0], dec_lsu_rd_e[4:0], dec_sign_ext_e}),
	.dout	({ldst_sz_m[1:0],     ld_rd_inst_m[4:0], sign_ext_m}),
  .siclk(siclk),
  .soclk(soclk)
);

// Modify the size bits for short and paritial ASIs
assign ldst_sz_mod_m[1] = (ldst_sz_m[1] & ~asi_sz_byte_m & ~asi_sz_hw_m) | (ldst_sz_m[1] & ~asi_legal_m);
assign ldst_sz_mod_m[0] = (ldst_sz_m[0] & (~asi_sz_byte_m | ~asi_legal_m)) | (asi_sz_hw_m & asi_legal_m);

// The sign_ext and ldst_fsr bits share the same status bit since sign_ext
// only has meaning in the integer context and ldst_fsr in the fp context.
// NOTE: Add an assertion to check that sign_ext is never valid for fpldst instructions.
assign sxt_fsr_m = fsr_ldst_m | sign_ext_m;

assign dcc_ldst_sz_m[1:0] = ldst_sz_mod_m[1:0];	// For use elsewhere in the LSU

// Rd must be swizzled for fp loads
assign ld_rd_m[4:0] = ({5{~fpldst_inst_vld_m}} & ld_rd_inst_m[4:0]) |			// Int
                      ({5{fpldst_inst_vld_m & ldst_sz_m[0]}} &
                           {ld_rd_inst_m[0],ld_rd_inst_m[4:1]})	    |			// Fp64
                      ({5{fpldst_inst_vld_m & ~ldst_sz_m[0]}} &
                           {1'b0,ld_rd_inst_m[4:1]});		    			// Fp32

assign asi_type_m[1] = (pr_inst_m | hpr_inst_m) & (ld_inst_vld_m | st_inst_vld_m);
assign asi_type_m[0] = (sr_inst_m | hpr_inst_m) & (ld_inst_vld_m | st_inst_vld_m);

lsu_dcc_ctl_msff_ctl_macro__width_9 dff_dec_inst_b  (
	.scan_in(dff_dec_inst_b_scanin),
	.scan_out(dff_dec_inst_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ld_inst_vld_m, st_inst_vld_m, fpldst_inst_vld_m,
		 pref_inst_m, casa_inst_m,
		 ldst_dbl_m, atomic_m, asi_type_m[1:0]}),
	.dout	({ld_inst_vld_b,  st_inst_vld_b, fpldst_inst_vld_b,
		 pref_inst_b, casa_inst_b, 
		 ldst_dbl_b, atomic_b, asi_type_b[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// Partial stores with TTE.IE=1 sync the thread so that later loads don't have
// to deal with an inverted byte mask in the CAM
assign sync_inst_b = sync_inst_pre_b | (pst_asi_b & tlb_tte_ie_b & tlb_tte_vld_b & st_inst_vld_b);

assign lsu_sync_inst_b = sync_inst_b;
assign dcc_atomic_b = atomic_b;
assign dcc_casa_inst_b = casa_inst_b;

lsu_dcc_ctl_msff_ctl_macro__width_7 dff_dec_ctl_b  (
	.scan_in(dff_dec_ctl_b_scanin),
	.scan_out(dff_dec_ctl_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({ldst_sz_mod_m[1:0], ld_rd_m[4:0]}),
	.dout	({ldst_sz_b[1:0],     ld_rd_b[4:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// TLU has to know about two cycle ops in case the second cycle IRF read results 
// in an ECC error
assign lsu_tlu_twocycle_m = casa_inst_m | (ldst_dbl_m & st_inst_vld_m & ~fpldst_inst_vld_m);
assign twocycle_b = casa_inst_b | (ldst_dbl_b & st_inst_vld_b & ~fpldst_inst_vld_b);

// Manipulate size to that non-quad ldd's are words and quad ldd's are dword
assign ldst_sz_b0_b = (ldst_sz_b[0] & (~ldst_dbl_b | fpldst_inst_vld_b)) |
                      (ldst_dbl_b & ~fpldst_inst_vld_b & quad_asi_b);

// Thread ID staging and decode.

assign tid_d[2:0] = dec_lsu_tg_d ? {1'b1,dec_lsu_tid1_d[1:0]} : {1'b0,dec_lsu_tid0_d[1:0]};
assign thread0_d = ~tid_d[2] & ~tid_d[1] & ~tid_d[0];
assign thread1_d = ~tid_d[2] & ~tid_d[1] &  tid_d[0];
assign thread2_d = ~tid_d[2] &  tid_d[1] & ~tid_d[0];
assign thread3_d = ~tid_d[2] &  tid_d[1] &  tid_d[0];
assign thread4_d =  tid_d[2] & ~tid_d[1] & ~tid_d[0];
assign thread5_d =  tid_d[2] & ~tid_d[1] &  tid_d[0];
assign thread6_d =  tid_d[2] &  tid_d[1] & ~tid_d[0];
assign thread7_d =  tid_d[2] &  tid_d[1] &  tid_d[0];

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_tid_e  (
	.scan_in(dff_tid_e_scanin),
	.scan_out(dff_tid_e_scanout),
	.din	(tid_d[2:0]),
	.dout	(tid_e[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign thread0_e = ~tid_e[2] & ~tid_e[1] & ~tid_e[0];
assign thread1_e = ~tid_e[2] & ~tid_e[1] &  tid_e[0];
assign thread2_e = ~tid_e[2] &  tid_e[1] & ~tid_e[0];
assign thread3_e = ~tid_e[2] &  tid_e[1] &  tid_e[0];
assign thread4_e =  tid_e[2] & ~tid_e[1] & ~tid_e[0];
assign thread5_e =  tid_e[2] & ~tid_e[1] &  tid_e[0];
assign thread6_e =  tid_e[2] &  tid_e[1] & ~tid_e[0];
assign thread7_e =  tid_e[2] &  tid_e[1] &  tid_e[0];

assign dcc_tid_e[2:0] = tid_e[2:0];	// for distribution to other blocks

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_tid_m  (
	.scan_in(dff_tid_m_scanin),
	.scan_out(dff_tid_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	(tid_e[2:0]),
	.dout	(tid_m[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_tid_m[2:0] = tid_m[2:0];	// for distribution to other blocks

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_tid_b  (
	.scan_in(dff_tid_b_scanin),
	.scan_out(dff_tid_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(tid_m[2:0]),
	.dout	(tid_b[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_tid_b[2:0] = tid_b[2:0];	// for distribution to other blocks

assign thread0_b = ~tid_b[2] & ~tid_b[1] & ~tid_b[0];
assign thread1_b = ~tid_b[2] & ~tid_b[1] &  tid_b[0];
assign thread2_b = ~tid_b[2] &  tid_b[1] & ~tid_b[0];
assign thread3_b = ~tid_b[2] &  tid_b[1] &  tid_b[0];
assign thread4_b =  tid_b[2] & ~tid_b[1] & ~tid_b[0];
assign thread5_b =  tid_b[2] & ~tid_b[1] &  tid_b[0];
assign thread6_b =  tid_b[2] &  tid_b[1] & ~tid_b[0];
assign thread7_b =  tid_b[2] &  tid_b[1] &  tid_b[0];

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_tid_w  (
	.scan_in(dff_tid_w_scanin),
	.scan_out(dff_tid_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(tid_b[2:0]),
	.dout	(tid_w[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign thread_w[0] = ~tid_w[2] & ~tid_w[1] & ~tid_w[0];
assign thread_w[1] = ~tid_w[2] & ~tid_w[1] &  tid_w[0];
assign thread_w[2] = ~tid_w[2] &  tid_w[1] & ~tid_w[0];
assign thread_w[3] = ~tid_w[2] &  tid_w[1] &  tid_w[0];
assign thread_w[4] =  tid_w[2] & ~tid_w[1] & ~tid_w[0];
assign thread_w[5] =  tid_w[2] & ~tid_w[1] &  tid_w[0];
assign thread_w[6] =  tid_w[2] &  tid_w[1] & ~tid_w[0];
assign thread_w[7] =  tid_w[2] &  tid_w[1] &  tid_w[0];

assign fpld_32b_m = ~ldst_sz_m[0];
assign fpld_odd32b_m = ~ldst_sz_m[0] & ld_rd_inst_m[0];


// Stage and qualify controls

assign altspace_ldst_e = altspace_e & (dec_ld_inst_e | dec_st_inst_e);

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_altspace_m  (
	.scan_in(dff_altspace_m_scanin),
	.scan_out(dff_altspace_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	(altspace_ldst_e),
	.dout	(altspace_ldst_m),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_altspace_b  (
	.scan_in(dff_altspace_b_scanin),
	.scan_out(dff_altspace_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(altspace_ldst_m),
	.dout	(altspace_ldst_b),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpld_inst_m = ld_inst_vld_m & (fpldst_inst_vld_m | fsr_ldst_m);
lsu_dcc_ctl_msff_ctl_macro__width_1 dff_fpld_b  (
	.scan_in(dff_fpld_b_scanin),
	.scan_out(dff_fpld_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(fpld_inst_m),
	.dout	(fpld_inst_b),
  .siclk(siclk),
  .soclk(soclk)
);


assign blk_inst_m = blk_asi_m & asi_legal_m & ldst_dbl_m & fpldst_inst_vld_m;
assign dcc_blk_inst_m = blk_inst_m;
assign dcc_blk_inst_b = blk_asi_b & altspace_ldst_b & ldst_dbl_b;

assign dcc_ldbl_b = ld_inst_vld_b & ldst_dbl_b & ~fpld_inst_b;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_oddrd  (
	.scan_in(dff_oddrd_scanin),
	.scan_out(dff_oddrd_scanout),
	.din	(cic_oddrd_e),
	.dout	(oddrd_m),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// LD/ST byte mask generation
////////////////////////////////////////////////////////////////////////////////
// For a normal ldst, the mask is based on the size and address.  For partial stores,
// the mask will come from rs2.

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_rs2_m  (
	.scan_in(dff_rs2_m_scanin),
	.scan_out(dff_rs2_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	(exu_lsu_rs2_e[7:0]),
	.dout	(rs2_m[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

//assign ldst_byte  = ~ldst_sz_mod_m[1] & ~ldst_sz_mod_m[0];
//assign ldst_hword = ~ldst_sz_mod_m[1] &  ldst_sz_mod_m[0];
//assign ldst_word  =  ldst_sz_mod_m[1] & ~ldst_sz_mod_m[0];
//assign ldst_dword =  ldst_sz_mod_m[1] &  ldst_sz_mod_m[0];

assign ldst_byte  = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b00) : (ldst_sz_mod_m[1:0] == 2'b00);
assign ldst_hword = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b01) : (ldst_sz_mod_m[1:0] == 2'b01);
assign ldst_word  = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b10) : (ldst_sz_mod_m[1:0] == 2'b10);
assign ldst_dword = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b11) : (ldst_sz_mod_m[1:0] == 2'b11);

assign ldst_bmask[7] = (~lsu_va_m[2] & ~lsu_va_m[1] & ~lsu_va_m[0]);

assign ldst_bmask[6] = (~lsu_va_m[2] & ~lsu_va_m[1] & ~ldst_byte) | 
                       (~lsu_va_m[2] & ~lsu_va_m[1] & lsu_va_m[0]);

assign ldst_bmask[5] = (~lsu_va_m[2] & ~ldst_byte & ~ldst_hword) |
                       (~lsu_va_m[2] & lsu_va_m[1] & ~lsu_va_m[0]);

assign ldst_bmask[4] = (~lsu_va_m[2] & lsu_va_m[1] & ldst_hword) |
                       (~lsu_va_m[2] & ~ldst_byte & ~ldst_hword) |
                       (~lsu_va_m[2] & lsu_va_m[1] & lsu_va_m[0]);

assign ldst_bmask[3] = (ldst_dword) |
                       (lsu_va_m[2] & ~lsu_va_m[1] & ~lsu_va_m[0]);

assign ldst_bmask[2] = (ldst_dword) |
                       (lsu_va_m[2] & ~lsu_va_m[1] & ~ldst_byte) |
                       (lsu_va_m[2] & ~lsu_va_m[1] & lsu_va_m[0]);

assign ldst_bmask[1] = (ldst_dword) |
                       (lsu_va_m[2] & ldst_word) |
                       (lsu_va_m[2] & lsu_va_m[1] & ~lsu_va_m[0]);

assign ldst_bmask[0] = (ldst_dword) |
                       (lsu_va_m[2] & lsu_va_m[1] & ldst_hword) |
                       (lsu_va_m[2] & ldst_word) |
                       (lsu_va_m[2] & lsu_va_m[1] & lsu_va_m[0]);

assign pst_bmask[7:0] = ({8{asi_pst32_m}} & {{4{rs2_m[1]}},{4{rs2_m[0]}}}) |
                        ({8{asi_pst16_m}} & {{2{rs2_m[3]}},{2{rs2_m[2]}},{2{rs2_m[1]}},{2{rs2_m[0]}}}) |
                        ({8{asi_pst8_m}} & rs2_m[7:0]);

assign lend_pst_bmask[7:0] = {pst_bmask[0],pst_bmask[1],pst_bmask[2],pst_bmask[3],
                              pst_bmask[4],pst_bmask[5],pst_bmask[6],pst_bmask[7]};


// 0in bits_on -var {(asi_legal_m & asi_store_m),(asi_legal_m & pst_asi_m)} -max 1
assign ldst_bmask_mod[7:0] = ({8{asi_store_m}} & (dcc_asi_m[7:0] | {8{asi_iomap_m}})) | 
                              ({8{pst_asi_m & lendian_asi_m}}  & lend_pst_bmask[7:0]) |
                              ({8{pst_asi_m & ~lendian_asi_m}} & pst_bmask[7:0]) |
                              ({8{~asi_store_m & ~pst_asi_m}}  & (ldst_bmask[7:0] | {8{sbc_bst_in_prog_m}}));

assign dcc_ldst_bmask[7:0] = mbi_run_local ? mbi_wdata[7:0] : ldst_bmask_mod[7:0];

assign st_bmask_parity_m = ^(ldst_bmask_mod[7:0]);

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_sba_par  (
	.scan_in(dff_sba_par_scanin),
	.scan_out(dff_sba_par_scanout),
	.din	(st_bmask_parity_m),
	.dout	(dcc_bmask_parity_b),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Hit/miss signaling
////////////////////////////////////////////////////////////////////////////////

// Need to track flushes through the pipe so lsu_sync isn't fired repeatedly.
// PKU will ignore an lsu_sync that asserts in the same cycle as dec_flush_lb
// since doing so here would create a bad timing path.  I'm responsible for
// tracking the flush_m.

// TLU flush can be ignored because the primary purpose of flush_b is to prevent
// the LMQ from loading on a flushed load.  If the flushed load is due to a
// previous load miss, that's handled by the dec_flush_lb.  If the load is flushed
// due to a trap, the LMQ will be loaded but the valid bit won't be set.

// This is a true load miss indicator used for advancing the rr replacement counter.
//assign l1_ld_miss_b = ld_inst_vld_b & ~tlb_cache_hit_b & ~flush_b;
assign l1_ld_miss_b = ld_inst_vld_b & ~(tlb_cache_hit_b & dcache_enable_b);

// In addition to true load misses, this signal asserts on any load type instruction
// that needs to go to L2.  (Ex. atomics, LDD, blk-ld, etc.)  This will cause the
// LMQ to load the miss information and begin requesting pcx access. 
assign dcc_ld_miss_b = (l1_ld_miss_b | ncache_rq_b | dcc_perror_b) & ld_inst_vld_b;

// True load misses are eligible to request pcx access in B.  The arbitration
// will be done in lsu_pic_ctl.  The cache hit result is sent there to be AND'ed
// with this signal.  If the D$ is disabled, loads cannot request early.
assign early_ld_m = ld_inst_vld_m & ~asi_internal_m & ~(blk_asi_m & altspace_ldst_m & ldst_dbl_m) &
                    ~atomic_m & ~(ldst_dbl_m & ~fpld_inst_m) & ~pref_inst_m & dcache_enable_m & ~dec_flush_lm;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_early_ld  (
	.scan_in(dff_early_ld_scanin),
	.scan_out(dff_early_ld_scanout),
	.l1clk	(l1clk_pm1),
	.din	(early_ld_m),
	.dout	(dcc_early_ld_b),
  .siclk(siclk),
  .soclk(soclk)
);

//assign dcc_early_ld_b = ld_inst_vld_b & ~asi_internal_b & ~dcc_blk_inst_b & ~atomic_b & ~dcc_ldbl_b & ~pref_inst_b & dcache_enable_b;

// lsu_sync tells the IFU that the instruction in B cannot complete in the normal
// pipeline.  IFU will flush the thread and refetch from the next instruction.
// The thread must be restarted by either a lsu_complete signal or a trap flush.
// Cannot use flush_b as a factor here because that would create a roundtrip
// between lsu and dec.
assign sync_pipe = ((((l1_ld_miss_b | ncache_rq_b | dcc_perror_b) & ~asi_dcd_diag_rd_b & ld_inst_vld_b) | 
                     (((altspace_ldst_b & blk_asi_b) | asi_sync_b | (pst_asi_b & tlb_tte_ie_b & tlb_tte_vld_b)) & st_inst_vld_b) |
                     lsu_dtmh_err_b
                    ) & ~pipe_flush_b
                   ) | stb_cam_hit | lbist_run ;

assign lsu_sync[0] = sync_pipe & thread0_b;
assign lsu_sync[1] = sync_pipe & thread1_b;
assign lsu_sync[2] = sync_pipe & thread2_b;
assign lsu_sync[3] = sync_pipe & thread3_b;
assign lsu_sync[4] = sync_pipe & thread4_b;
assign lsu_sync[5] = sync_pipe & thread5_b;
assign lsu_sync[6] = sync_pipe & thread6_b;
assign lsu_sync[7] = sync_pipe & thread7_b;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_sync_pipe  (
	.scan_in(dff_sync_pipe_scanin),
	.scan_out(dff_sync_pipe_scanout),
	.l1clk	(l1clk_pm1),
	.din	(sync_pipe),
	.dout	(dcc_sync_pipe_w),
  .siclk(siclk),
  .soclk(soclk)
);

// Must track cases where thread was stopped due to a store event.  If a
// disrupting store buffer error occurs while the thread is stopped due
// to a store event, lsu_complete must be sent to restart the thread.

assign sync_st_in[7:0] = ((thread_w[7:0] & {8{dcc_sync_pipe_w & st_inst_vld_w & ~flush_w}}) | sync_st[7:0]) &
                         ~lsu_complete[7:0];

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_sync_st  (
	.scan_in(dff_sync_st_scanin),
	.scan_out(dff_sync_st_scanout),
	.din	(sync_st_in[7:0]),
	.dout	(sync_st[7:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////////////
// Complete signaling
////////////////////////////////////////////////////////////////////////////////

// lsu_complete can only be signalled following an lsu_sync or postsync.

assign lsu_complete[0] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd0) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[0] | lsu_block_store_alloc[0] |
                         lmc_pref_issued[0] | lsu_trap_flush[0] | 
                         (sync_st[0] & lsu_block_store_kill[0]);
assign lsu_complete[1] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd1) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[1] | lsu_block_store_alloc[1] |
                         lmc_pref_issued[1] | lsu_trap_flush[1] | 
                         (sync_st[1] & lsu_block_store_kill[1]);
assign lsu_complete[2] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd2) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[2] | lsu_block_store_alloc[2] |
                         lmc_pref_issued[2] | lsu_trap_flush[2] | 
                         (sync_st[2] & lsu_block_store_kill[2]);
assign lsu_complete[3] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd3) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[3] | lsu_block_store_alloc[3] |
                         lmc_pref_issued[3] | lsu_trap_flush[3] | 
                         (sync_st[3] & lsu_block_store_kill[3]);
assign lsu_complete[4] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd4) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[4] | lsu_block_store_alloc[4] |
                         lmc_pref_issued[4] | lsu_trap_flush[4] | 
                         (sync_st[4] & lsu_block_store_kill[4]);
assign lsu_complete[5] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd5) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[5] | lsu_block_store_alloc[5] |
                         lmc_pref_issued[5] | lsu_trap_flush[5] | 
                         (sync_st[5] & lsu_block_store_kill[5]);
assign lsu_complete[6] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd6) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[6] | lsu_block_store_alloc[6] |
                         lmc_pref_issued[6] | lsu_trap_flush[6] | 
                         (sync_st[6] & lsu_block_store_kill[6]);
assign lsu_complete[7] = (cic_rtn_cmplt & (cid_tid[2:0] == 3'd7) & ~lmc_bld_annul) |
                         lmc_thrd_byp_sel_e[7] | lsu_block_store_alloc[7] |
                         lmc_pref_issued[7] | lsu_trap_flush[7] | 
                         (sync_st[7] & lsu_block_store_kill[7]);

////////////////////////////////////////////////////////////////////////////////
// Decode stall
// Stalls are requested at decode to allow cpq or bypass regs to drain.
// Also to clear holes for diagnostic accesses
////////////////////////////////////////////////////////////////////////////////

assign lsu_cpq_stall = cic_cpq_stall | lmc_ld_stall | stb_diag_rd_e | asi_cache_diag_wr_m;

////////////////////////////////////////////////////////////////////////////////
// Dcache Array Control
////////////////////////////////////////////////////////////////////////////////

assign dcache_enable_e = (thread0_e & dcs_dc_enable[0]) |
                         (thread1_e & dcs_dc_enable[1]) |
                         (thread2_e & dcs_dc_enable[2]) |
                         (thread3_e & dcs_dc_enable[3]) |
                         (thread4_e & dcs_dc_enable[4]) |
                         (thread5_e & dcs_dc_enable[5]) |
                         (thread6_e & dcs_dc_enable[6]) |
                         (thread7_e & dcs_dc_enable[7]) ;

assign dcache_read_e = dec_ld_inst_e &
                       (~(asi_internal_e | dec_pref_inst_e | dec_casa_inst_e | 
                         dec_ldstub_inst_e | dec_swap_inst_e) & dcache_enable_e) |
                       (asi_internal_e & (asi_dca_diag_rd_e | asi_dta_diag_rd_e));

assign dcache_nodiag_read_e = ld_inst_unqual_e &
                       (~(asi_internal_e | dec_pref_inst_e | dec_casa_inst_e |
                         dec_ldstub_inst_e | dec_swap_inst_e) & dcache_enable_e);

lsu_dcc_ctl_msff_ctl_macro__width_5 dc_enable  (
	.scan_in(dc_enable_scanin),
	.scan_out(dc_enable_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dcache_enable_e,dcache_enable_m,dcache_nodiag_read_e,dcache_read_m,dcc_dca_rvld_e}),
	.dout	({dcache_enable_m,dcache_enable_b,dcache_nodiag_read_m,dcache_read_b,dcc_dca_rvld_m}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcache_read_m = dcache_nodiag_read_m & ld_inst_vld_m;

assign ld_fill_e = cic_l2fill_vld_e & ~cid_ncache;

assign dcc_dca_wvld_e = mbi_run_local ? mbi_dca_write_en :
                       (ld_fill_e | 			// l2 fills
                        cic_st_update_e |		// store updates
                        dca_diag_wr_e );		// diagnostic write


// Data read enable
assign dcc_dca_rvld_e = mbi_run_local ? mbi_dca_read_en : dcache_read_e;

assign dcc_dca_clk_en_e = ld_inst_unqual_e | dcc_dca_wvld_e | mbi_run_local | ~lsu_dc_pmen;			// E stage
assign dcc_dca_wclk_en_e = dcc_dca_wvld_e | mbi_run_local | ~lsu_dc_pmen;					// E stage
assign dcc_dca_rclk_en_m = dcc_dca_rvld_m | l2fill_vld_m | lmc_byp_vld_m | mbi_run_local | ~lsu_dc_pmen;	// M stage

// Force bypass mode off during BIST and during macrotest if possible.
assign dcc_dca_bypass_e_ = ld_inst_unqual_e | mbi_run_local;
assign dcc_alt_addr_sel_e = ~ld_inst_unqual_e | mbi_run_local;

// Use alternate way for diag data reads and bist reads.  If not performing a diag or bist read,
// way zero must be selected to allow for cache bypassing.
assign dcc_alt_way_sel_m = asi_dca_diag_rd_m | ~ld_inst_vld_m | mbi_run_local;
assign dcc_alt_rsel_way_m[0] = (asi_dca_diag_rd_m & ~mbi_run_local & ~lsu_va_m[12] & ~lsu_va_m[11]) |
                               (mbi_run_local & ~bist_addr_1[8] & ~bist_addr_1[7]) |
                               ~(asi_dca_diag_rd_m | mbi_run_local);
assign dcc_alt_rsel_way_m[1] = mbi_run_local ? (~bist_addr_1[8] &  bist_addr_1[7]) :
                                (asi_dca_diag_rd_m & ~lsu_va_m[12] &  lsu_va_m[11]) ;
assign dcc_alt_rsel_way_m[2] = mbi_run_local ? ( bist_addr_1[8] & ~bist_addr_1[7]) :
                                (asi_dca_diag_rd_m &  lsu_va_m[12] & ~lsu_va_m[11]) ;
assign dcc_alt_rsel_way_m[3] = mbi_run_local ? ( bist_addr_1[8] &  bist_addr_1[7]) :
                                (asi_dca_diag_rd_m &  lsu_va_m[12] &  lsu_va_m[11]) ;

// Tag read/write enable
assign dcc_dta_rvld_e = mbi_run_local ? mbi_dta_read_en : dcache_read_e;
assign dcc_dta_wvld_e = mbi_run_local ? mbi_dta_write_en : (ld_fill_e | dta_diag_wr_e);
assign dcc_dta_clken = ld_inst_unqual_e | cic_cpq_ld_sel | dta_diag_wr_e | mbi_run_local | ~lsu_dc_pmen;
assign dcc_dta_index1_sel_e = ~ld_inst_unqual_e | mbi_run_local;

// Fill/bypass control
assign dcc_dca_fill_way_e[1:0] =
                  ({2{mbi_run_local}}                                     & mbi_addr[8:7]) |
                  ({2{(cic_cpq_ld_sel | diag_write_e) & ~mbi_run_local}}  & lmd_fill_way_e[1:0]) |
                  ({2{~(mbi_run_local | cic_cpq_ld_sel | dca_diag_wr_e)}} & cid_st_way[1:0]);

assign dcc_dta_fill_way_e[1:0] = mbi_run_local ? mbi_addr[8:7] : lmd_fill_way_e[1:0];

assign dcc_dca_fill_addr_e[10:3] =
                  ({8{mbi_run_local}}                                    & {mbi_addr[6:0],mbi_cmpsel}) |
                  ({8{(cic_cpq_ld_sel | diag_write_e) & ~mbi_run_local}} & lmd_fill_addr_e[10:3]) |
                  ({8{~(mbi_run_local | cic_cpq_ld_sel | diag_write_e)}} & cid_st_addr[10:3]);

assign dcc_dta_fill_addr_e[10:4] = mbi_run_local ? mbi_addr[6:0] : lmd_fill_addr_e[10:4];

// 0in bits_on -var {ld_fill_e,diag_write_e} -max 1

// Fills from L2 update all bytes.  Stores are selective.
assign dcc_dca_byte_wr_en_e[15:0] = 
  ({16{dca_diag_wr_e}} & {{8{~va_w[3]}},{8{va_w[3]}}}) |
  ({16{(cic_cpq_ld_sel & ~dca_diag_wr_e) | mbi_run_local}}) |
  ({16{~(dca_diag_wr_e | cic_cpq_ld_sel | mbi_run_local)}} &
     {({8{~cid_st_addr[3]}} & cid_st_bmask[7:0]),({8{cid_st_addr[3]}} & cid_st_bmask[7:0])});
                                    
                                    
////////////////////////////////////////////////////////////////////////////////
// Valid Array Control
// The array is organized as 32x16.  Each line corresponds to one L2 cache line.
// (4 ways x 4 16B D$ lines per L2 line = 16)
// The valid array is read on every load instruction.
// The valid array is written on:
//  1 - a load fill sets one valid bit
//  2 - a diag write sets or clears one valid bit
//  3 - an invalidate caused by an L2 evicition clears up to four bits
//  4 - other invalidates clear one bit

assign dcc_dva_rvld_e = mbi_run_local ? mbi_dva_read_en : (dcache_read_e | asi_dta_diag_rd_e);
assign dcc_dva_wvld_e = mbi_run_local ? mbi_dva_write_en : (ld_fill_e | dta_diag_wr_e | cic_invalidate_e | cic_xinval_e);
// 0in bits_on -var {ld_fill_e,dta_diag_wr_e,cic_invalidate_e,cic_xinval_e} -max 1

// 0in bits_on -var {mbi_run_local,cic_l2fill_vld_e,cic_invalidate_e,cic_xinval_e} -max 1
assign dcc_dva_wr_addr_e[10:6] = mbi_run_local ? mbi_addr[4:0] :
                    (({5{cic_invalidate_e}} 			& cid_inv_index[10:6]) |
                     ({5{cic_xinval_e}} 			& xinv_index[10:6]) |
                     ({5{(cic_l2fill_vld_e | dta_diag_wr_e)}}	& dcc_dta_fill_addr_e[10:6]));
		
assign dcc_dva_din_e  = mbi_run_local ? mbi_wdata[1] : ((cic_cpq_ld_sel & ~dta_diag_wr_e) | (dta_diag_wr_e & st_data_w[1]));
assign dcc_dva_din2_e = mbi_run_local ? mbi_wdata[0] : ((cic_cpq_ld_sel & ~dta_diag_wr_e) | (dta_diag_wr_e & (st_data_w[1] ^ va_w[14])));

assign fill_bit_wen_e[0]  = ~lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[1]  = ~lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[2]  = ~lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] &  lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[3]  = ~lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] &  lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[4]  = ~lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[5]  = ~lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[6]  = ~lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] &  lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[7]  = ~lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] &  lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[8]  =  lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[9]  =  lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[10] =  lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] &  lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[11] =  lmd_fill_addr_e[5] & ~lmd_fill_addr_e[4] &  lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[12] =  lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[13] =  lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] & ~lmd_fill_way_e[1] &  lmd_fill_way_e[0];
assign fill_bit_wen_e[14] =  lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] &  lmd_fill_way_e[1] & ~lmd_fill_way_e[0];
assign fill_bit_wen_e[15] =  lmd_fill_addr_e[5] &  lmd_fill_addr_e[4] &  lmd_fill_way_e[1] &  lmd_fill_way_e[0];

assign dcc_dva_bit_wen_e[15:0] =
		({16{mbi_run_local}}) | 
		({16{cic_invalidate_e}} 			& cic_inv_wen_e[15:0]) |
		({16{cic_xinval_e}} 				& xinval_bit_wen_e[15:0]) |
		({16{(cic_l2fill_vld_e | dta_diag_wr_e)}}	& fill_bit_wen_e[15:0]);

////////////////////////////////////////////////////////////////////////////////
// Regfile Data Control
////////////////////////////////////////////////////////////////////////////////

// Select the source of data to be passed to the register files.
// The same set of data always goes to both register files.
// [0] = load hit data from the dcache
// [1] = fill data from the CPX
// else bypass store buffer data

assign l2fill_vld_e = cic_l2fill_vld_e & ~lmc_l2_err_noup;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_l2fill_m  (
	.scan_in(dff_l2fill_m_scanin),
	.scan_out(dff_l2fill_m_scanout),
	.din	(l2fill_vld_e),
	.dout	(l2fill_vld_m),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_l2fill_vld_m = l2fill_vld_m;

assign int_fill_or_byp_m = ((l2fill_vld_m & ~l2_perfmon_wb_cancel_m) | lmc_byp_vld_m) & ~lmd_fpld_m;
assign fp_fill_or_byp_m  = ((l2fill_vld_m & ~l2_perfmon_wb_cancel_m) | lmc_byp_vld_m) & lmd_fpld_m;

assign exu_ld_m = (ld_inst_vld_m & ~fpld_inst_m) | int_fill_or_byp_m;
assign fgu_fld_m = (ld_inst_vld_m & fpld_inst_m) | fp_fill_or_byp_m;

lsu_dcc_ctl_msff_ctl_macro__width_4 dff_l2fill_b  (
	.scan_in(dff_l2fill_b_scanin),
	.scan_out(dff_l2fill_b_scanout),
	.din	({int_fill_or_byp_m,fp_fill_or_byp_m,    exu_ld_m,    fgu_fld_m}),
	.dout	({int_fill_or_byp_b,fp_fill_or_byp_b,lsu_exu_ld_b,lsu_fgu_fld_b}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign fld_32b_m = ld_inst_vld_m ? fpld_32b_m : lmd_fp32b_m;
assign fld_odd32b_m = ld_inst_vld_m ? fpld_odd32b_m : lmd_fpodd32b_m;
assign fld_sxt_fsr_m = ld_inst_vld_m ? sxt_fsr_m : lmd_sxt_fsr_m;

assign return_rd_m[4:0] =  ld_inst_vld_m ? ld_rd_m[4:0] : lmd_rd_m[4:0];

assign lsu_exu_rd_m[4:0] =  ld_inst_vld_m ? ld_rd_inst_m[4:0] : lmd_rd_m[4:0];

assign ld_tid_m[2:0] = ({3{ld_inst_vld_m}} & tid_m[2:0]) |				// pipe
                       ({3{l2fill_vld_m}}  & lmc_cpq_tid_m[2:0]) |			// ld miss
                       ({3{lmc_byp_vld_m}} & lmc_byp_tid_m[2:0]);			// bypass

assign lsu_exu_tid_m[2:0] = ld_tid_m[2:0];

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_ld_tid_b  (
	.scan_in(dff_ld_tid_b_scanin),
	.scan_out(dff_ld_tid_b_scanout),
	.din	(ld_tid_m[2:0]),
	.dout	(ld_tid_b[2:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_fp32_b  (
	.scan_in(dff_fp32_b_scanin),
	.scan_out(dff_fp32_b_scanout),
	.din	({fld_32b_m,fld_odd32b_m,fld_sxt_fsr_m,return_rd_m[4:0]}),
	.dout	({fld_32b_b,fld_odd32b_b,fld_sxt_fsr_b,return_rd_b[4:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_fgu_fld_32b_b = fld_32b_b;
assign lsu_fgu_fld_odd32b_b = fld_odd32b_b;
assign fsr_load_unqual_b = fld_sxt_fsr_b;

// Data is valid for the IRF/FRF when
// 1 - A load in the pipe hit the dcache.
// 2 - Data is returned from the CPX
// 3 - Data is bypassed from the LMQ bypass register (STB RAW, ASI, etc.)
assign ld_inst_qual_b = ld_inst_vld_b & ~sync_pipe & ~pipe_flush_b & ~dcc_any_exception_b;

assign exu_ld_vld_b = (ld_inst_qual_b & ~fpld_inst_b) |				// pipe
                      int_fill_or_byp_b;

assign fgu_fld_vld_b = (ld_inst_qual_b & fpld_inst_b) |				// pipe
                       fp_fill_or_byp_b;

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_ld_vld_w  (
      .scan_in(dff_ld_vld_w_scanin),
      .scan_out(dff_ld_vld_w_scanout),
      .din    ({exu_ld_vld_b,fgu_fld_vld_b}),
      .dout   ({exu_ld_vld_w,fgu_fld_vld_w}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
assign lsu_exu_ld_vld_w = exu_ld_vld_w & ~(ld_inst_vld_w & flush_w);
assign lsu_fgu_fld_vld_w = fgu_fld_vld_w & ~(ld_inst_vld_w & flush_w);


assign lsu_fgu_fld_tid_b[2:0] = ld_tid_b[2:0];

assign lsu_fgu_fld_addr_b[4:0] = return_rd_b[4:0];

assign lsu_fgu_fsr_load_b = fsr_load_unqual_b & lsu_fgu_fld_b;

////////////////////////////////////////////////////////////////////////////////
// Big/little Endian
// Endianess is controlled by the following rules
// 1. Internal ASI's are all big endian.
// 2. Accesses with implicit ASI's are controlled by (PSTATE.CLE ^ TTE.IE)
// 3. Accesses with explicit ASI's are controlled by (ASI value ^ TTE.IE)

assign pstate_cle_d = tlu_pstate_cle[0] & thread0_d |
                      tlu_pstate_cle[1] & thread1_d |
                      tlu_pstate_cle[2] & thread2_d |
                      tlu_pstate_cle[3] & thread3_d |
                      tlu_pstate_cle[4] & thread4_d |
                      tlu_pstate_cle[5] & thread5_d |
                      tlu_pstate_cle[6] & thread6_d |
                      tlu_pstate_cle[7] & thread7_d;

assign dcc_lendian_pre_m = altspace_ldst_m ? lendian_asi_m : (pstate_cle_m & ~asi_internal_m);
assign dcc_bendian_byp_m = (~ld_inst_vld_m & lmd_bendian_m) | lmc_asi_bypass_m | dcc_asi_load_m;

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_le_bits  (
	.scan_in(dff_le_bits_scanin),
	.scan_out(dff_le_bits_scanout),
	.din	({pstate_cle_d,pstate_cle_e,pstate_cle_m}),
	.dout	({pstate_cle_e,pstate_cle_m,pstate_cle_b}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign l1hit_lendian_b = (ld_inst_vld_b | st_inst_vld_b) & ~asi_internal_b & 
                         ((~altspace_ldst_b & (pstate_cle_b ^  (tlb_tte_ie_b & tlb_tte_vld_b))) |
                          (altspace_ldst_b &  (lendian_asi_b ^ (tlb_tte_ie_b & tlb_tte_vld_b))));

// Insure that TTE.IE is never high for internal ASI's
// 0in custom -fire (st_inst_vld_b & asi_internal_b & tlb_tte_ie_b & ~flush_all_b) -message "TTE.IE high for internal ASI store"

////////////////////////////////////////////////////////////////////////////////
// Byte offset address

assign byp_baddr_m[2:0] = {lmd_ld_addr_m[2] ^ (oddrd_m & ~lmd_sz_m[0]), lmd_ld_addr_m[1:0]};

assign dcc_baddr_m[2:0] = ld_inst_vld_m ? lsu_va_m[2:0] : byp_baddr_m[2:0];

////////////////////////////////////////////////////////////////////////////////
// Alignment and sign extension for load return data.
// Integer data is aligned and sign-extended as defined in the Sparc V9
// architecture.  Floating point data is either 64bit (endian swapping may
// occur, but no other alignment is applicable) or 32bit (endian swapping may
// occur and the 32b data is replicated on the upper and lower halves of the
// 64b return bus).
//

// Return data (and it's size information) can come from
// 1. Load Hit (ldst_sz_m)
// 2. Load Miss
// 3. ASI bypass

assign dcc_ld_sz_m[1:0] = ld_inst_vld_m ? ldst_sz_mod_m[1:0] : lmd_sz_m[1:0];

assign dcc_signed_m = ld_inst_vld_m ? sxt_fsr_m : (lmd_sxt_fsr_m & ~lmc_asi_bypass_m);

////////////////////////////////////////////////////////////////////////////////
// ASI Decode

lsu_adc_ctl adc (
	.asi_e		(dcc_asi_e[7:0]),
	.asi_m		(dcc_asi_m[7:0]),
	.sr_inst_e	(dec_sr_inst_e),
	.pr_inst_e	(dec_pr_inst_e),
	.hpr_inst_e	(dec_hpr_inst_e),
	.altspace_ldst_e(altspace_e),
	.asi_legal_e	(asi_legal_e_unqual),
  .lsu_va_m(lsu_va_m[11:3]),
  .sr_inst_m(sr_inst_m),
  .pr_inst_m(pr_inst_m),
  .hpr_inst_m(hpr_inst_m),
  .altspace_ldst_m(altspace_ldst_m),
  .ld_inst_vld_m(ld_inst_vld_m),
  .legal_asi_va_m(legal_asi_va_m),
  .asr_legal_m(asr_legal_m),
  .asi_sync_m(asi_sync_m),
  .asi_internal_e(asi_internal_e),
  .asi_rngf_m(asi_rngf_m),
  .asi_indet_m(asi_indet_m),
  .lendian_asi_m(lendian_asi_m),
  .asi_sz_byte_m(asi_sz_byte_m),
  .asi_sz_hw_m(asi_sz_hw_m),
  .pst_asi_m(pst_asi_m),
  .asi_pst8_m(asi_pst8_m),
  .asi_pst16_m(asi_pst16_m),
  .asi_pst32_m(asi_pst32_m),
  .asi_read_only_m(asi_read_only_m),
  .asi_write_only_m(asi_write_only_m),
  .quad_asi_m(quad_asi_m),
  .binit_quad_asi_m(binit_quad_asi_m),
  .primary_asi_e(primary_asi_e),
  .secondary_asi_e(secondary_asi_e),
  .real_asi_e(real_asi_e),
  .as_if_user_asi_e(as_if_user_asi_e),
  .as_if_priv_asi_e(as_if_priv_asi_e),
  .atomic_asi_m(atomic_asi_m),
  .blk_asi_e(blk_asi_e),
  .nofault_asi_m(nofault_asi_m),
  .asi_iomap_m(asi_iomap_m),
  .asi_no_va_check_m(asi_no_va_check_m)
);

// Context selection.  Alternate instructions get their context from the ASI value.
// Non-alternates default to primary, unless TL>0, then it's nulceus.
assign tl_gt_0_d = (thread0_d & tl_gt_0[0]) |
                   (thread1_d & tl_gt_0[1]) |
                   (thread2_d & tl_gt_0[2]) |
                   (thread3_d & tl_gt_0[3]) |
                   (thread4_d & tl_gt_0[4]) |
                   (thread5_d & tl_gt_0[5]) |
                   (thread6_d & tl_gt_0[6]) |
                   (thread7_d & tl_gt_0[7]) ;

lsu_dcc_ctl_msff_ctl_macro__width_10 dff_tl_gt_0  (
	.scan_in(dff_tl_gt_0_scanin),
	.scan_out(dff_tl_gt_0_scanout),
	.din	({tlu_tl_gt_0[7:0],tl_gt_0_d,tl_gt_0_e}),
	.dout	({tl_gt_0[7:0],    tl_gt_0_e,tl_gt_0_m}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_5 dff_tlc  (
	.scan_in(dff_tlc_scanin),
	.scan_out(dff_tlc_scanout),
	.din	({tlc_wr_or_demap,
		  tlc_use_primary_context_c0,tlc_use_secondary_context_c0,
		  tlc_use_primary_context_c1,tlc_use_secondary_context_c1}),
	.dout	({wr_or_demap,
		  tlc_use_primary_context_c1,tlc_use_secondary_context_c1,
		  tlc_use_primary_context_c2,tlc_use_secondary_context_c2}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlc_use_secondary_context = tlc_use_secondary_context_c1 | tlc_use_secondary_context_c2;
assign tlc_use_primary_context   = tlc_use_primary_context_c1   | tlc_use_primary_context_c2;

assign dcc_ctxt_tid0_d[1:0] = tlc_wr_or_demap ? tld_tid[1:0] : dec_lsu_tid0_d[1:0];
assign dcc_ctxt_tid1_d[1:0] = tlc_wr_or_demap ? tld_tid[1:0] : dec_lsu_tid1_d[1:0];
assign dcc_ctxt_tg_d        = tlc_wr_or_demap ? tld_tid[2] : dec_lsu_tg_d;

assign dcc_pctxt_sel_e = wr_or_demap ? tlc_use_primary_context : (altspace_e ? primary_asi_e : ~tl_gt_0_e);
assign dcc_sctxt_sel_e = wr_or_demap ? tlc_use_secondary_context : (altspace_e & secondary_asi_e);

assign context_enc_e[1:0] = {(asi_internal_e | ~(dcc_pctxt_sel_e | dcc_sctxt_sel_e)),
                             (asi_internal_e | dcc_sctxt_sel_e)};

lsu_dcc_ctl_msff_ctl_macro__width_4 dff_ct  (
	.scan_in(dff_ct_scanin),
	.scan_out(dff_ct_scanout),
	.l1clk	(l1clk_pm1),
	.din	({context_enc_e[1:0],context_enc_m[1:0]}),
	.dout	({context_enc_m[1:0],context_enc_b[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// TLB translation controls
// 1. All except aiu/aip/real bypass in HPRIV ENB mode
// 2. All internal ASIs are non-translating
assign dcc_tlb_bypass = mbi_run_local ? ~bist_cam_en :
            ((hpstate_hpriv_e & ~(real_asi_e | as_if_user_asi_e | as_if_priv_asi_e)) |	// #1
            asi_internal_e);								// #2

// this is dont_care when bypassing
assign dcc_tlb_real = (~dmmu_enable_e & ~hpstate_hpriv_e) | real_asi_e;

lsu_dcc_ctl_msff_ctl_macro__width_12 dff_asi_m  (
	.scan_in(dff_asi_m_scanin),
	.scan_out(dff_asi_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({blk_asi_e,asi_internal_e,as_if_user_asi_e,asi_legal_e_unqual,asx_e[7:0]}),
	.dout	({blk_asi_m,asi_internal_m,as_if_user_asi_m,asi_legal_m_unqual,dcc_asi_m[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_legal_m = asi_legal_m_unqual & (ld_inst_vld_m | st_inst_vld_m);

// Don't make dcache diagnostics look like an internal ASI because they never go to
// the ASI ring and they don't sync the thread.
assign dcc_asi_load_m = asi_internal_m & ld_inst_vld_m;

assign asi_store_m = asi_internal_m & st_inst_vld_m;

lsu_dcc_ctl_msff_ctl_macro__width_24 dff_asi_b  (
	.scan_in(dff_asi_b_scanin),
	.scan_out(dff_asi_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({asi_internal_m, lendian_asi_m, asi_rngf_m, asi_sync_m, blk_asi_m, quad_asi_m, atomic_asi_m,
                  dcc_asi_load_m, asi_store_m, asi_iomap_m,     asi_indet_m,     binit_quad_asi_m, pst_asi_m,
                  nofault_asi_m, quad_ld_m,     dcc_asi_m[7:0], asi_legal_m}),
	.dout	({asi_internal_b, lendian_asi_b, asi_rngf_b, asi_sync_b, blk_asi_b, quad_asi_b, atomic_asi_b,
                  dcc_asi_load_b, asi_store_b, dcc_asi_iomap_b, asi_indet_b,     binit_quad_asi_b, pst_asi_b,
                  nofault_asi_b, quad_ldd_b,    dcc_asi_b[7:0], asi_legal_b}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_asi_store_b = asi_store_b;
assign dcc_binit_st_b = binit_quad_asi_b & st_inst_vld_b;
assign dcc_pst_asi_b = pst_asi_b;
assign dcc_asi_indet_b = asi_indet_b;

// Used in store buffer.  For ASI_ITLB_DATA_ACCESS (ASI=0x55), writes need to go to the
// fast ring but reads to the local ring.  Take care of that special case here.
assign dcc_asi_rngf_b = asi_rngf_b | (st_inst_vld_b & asi_internal_b & (dcc_asi_b[7:0] == 8'h55));

// ASI comes from Rd for wsr, wpr, and whpr.
assign asi_use_rd_e = (dec_sr_inst_e | dec_pr_inst_e | dec_hpr_inst_e) & dec_st_inst_e;
// ASI comes from sraddr for rsr, rpr, and rhpr.
assign asi_use_sr_e = (dec_sr_inst_e | dec_pr_inst_e | dec_hpr_inst_e) & ld_inst_unqual_e;

assign quad_ld_m = ld_inst_vld_m & ldst_dbl_m & quad_asi_m & ~fpldst_inst_vld_m;

assign dcc_stb_quad_ld_cam = quad_ld_m & ~mbi_run_local;

////////////////////////////////////////////////////////////////////////////////
// ASI and state register control

assign dcc_tlb_rd_e      = mbi_run_local ? bist_dtb_read_en :
            (ld_inst_unqual_e & altspace_e & ((dcc_asi_e[7:0] == 8'h5D) | (dcc_asi_e[7:0] == 8'h5E)));
assign stb_diag_rd_e     = dec_ld_inst_e & ~dec_pref_inst_e & ~dec_st_inst_e & altspace_e & (dcc_asi_e[7:0] == 8'h4A);

assign asi_dca_diag_e    = altspace_e & (dcc_asi_e[7:0] == 8'h46);
assign asi_dta_diag_e    = altspace_e & (dcc_asi_e[7:0] == 8'h47);

assign asi_dca_diag_rd_e = dec_ld_inst_e & ~dec_pref_inst_e & asi_dca_diag_e;
assign asi_dta_diag_rd_e = dec_ld_inst_e & ~dec_pref_inst_e & asi_dta_diag_e;

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_int_asi_m  (
	.scan_in(dff_int_asi_m_scanin),
	.scan_out(dff_int_asi_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({stb_diag_rd_e,    asi_dca_diag_e,asi_dta_diag_e}),
	.dout	({dcc_stb_diag_rd_m,asi_dca_diag_m,asi_dta_diag_m}),
  .siclk(siclk),
  .soclk(soclk)
);
assign asi_dca_diag_rd_m = ld_inst_vld_m & ~pref_inst_m & asi_dca_diag_m;
assign asi_dta_diag_rd_m = ld_inst_vld_m & ~pref_inst_m & asi_dta_diag_m;

assign asi_cache_diag_wr_m = st_inst_vld_m & ~atomic_m & (asi_dca_diag_m | asi_dta_diag_m);
assign dcc_cache_diag_wr_m = asi_cache_diag_wr_m | lbist_run;

assign dcc_p0ctxt_rd_m      = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h21) & ~lsu_va_m[8] & lsu_va_m[3];
assign dcc_p1ctxt_rd_m      = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h21) &  lsu_va_m[8] & lsu_va_m[3];
assign dcc_s0ctxt_rd_m      = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h21) & ~lsu_va_m[8] & lsu_va_m[4];
assign dcc_s1ctxt_rd_m      = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h21) &  lsu_va_m[8] & lsu_va_m[4];
assign dcc_pid_rd_m         = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h58) &  lsu_va_m[7];
assign dcc_wtchpt_rd_m      = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h58) & (lsu_va_m[5] & lsu_va_m[4] & lsu_va_m[3]);
assign     tlb_tag_read_m   = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h5E);
assign     tlb_data_read_m  = ld_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h5D);
assign asi_dcd_diag_rd_m    = asi_dca_diag_rd_m & lsu_va_m[13];

// This signal gates the flop for tag/valid read data.  It must be active during BIST also.
assign dcc_rd_dt_diag_m = asi_dta_diag_rd_m | mbi_run_local;

// These are ASI's for which no ring transaction should be generated.
assign lsu_asi_rd_m = dcc_p0ctxt_rd_m | dcc_p1ctxt_rd_m   | dcc_s0ctxt_rd_m | dcc_s1ctxt_rd_m | dcc_pid_rd_m | 
                      dcc_wtchpt_rd_m | dcc_stb_diag_rd_m | asi_dca_diag_rd_m;

assign dcc_wtchpt_sel_m = dcc_wtchpt_rd_m;

lsu_dcc_ctl_msff_ctl_macro__width_10 dff_int_asi_b  (
	.scan_in(dff_int_asi_b_scanin),
	.scan_out(dff_int_asi_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({lsu_asi_rd_m,        dcc_wtchpt_rd_m,    asi_dca_diag_rd_m, 
		  dcc_stb_diag_rd_m,   asi_dcd_diag_rd_m,  asi_dta_diag_rd_m, wr_error_inj_m,
		  asi_cache_diag_wr_m, tlb_tag_read_m,     tlb_data_read_m }),
	.dout	({lsu_asi_rd_b,        dcc_wtchpt_rd_b,    asi_dca_diag_rd_b, 
		  stb_diag_rd_b,       asi_dcd_diag_rd_b,  dcc_rd_dt_diag_b,  wr_error_inj_b,
		  asi_cache_diag_wr_b, dcc_tlb_tag_read_b, dcc_tlb_data_read_b }),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_cache_diag_wr_b = asi_cache_diag_wr_b;

lsu_dcc_ctl_msff_ctl_macro__width_4 dff_int_asi_w  (
	.scan_in(dff_int_asi_w_scanin),
	.scan_out(dff_int_asi_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({lsu_asi_sel_b,stb_diag_rd_b,asi_cache_diag_wr_b,dcc_asi_b[0]}),
	.dout	({lsu_asi_sel_w,stb_diag_rd_w,asi_cache_diag_wr_w,asi_dta_not_dca_diag_w}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dca_diag_wr_e = asi_cache_diag_wr_w & ~asi_dta_not_dca_diag_w & ~flush_w & ~mbi_run_local;
assign dta_diag_wr_e = asi_cache_diag_wr_w & asi_dta_not_dca_diag_w & ~flush_w & ~mbi_run_local;
assign diag_write_e  = asi_cache_diag_wr_w & ~mbi_run_local;

// dcc_lsu_asi_sel_w is used to enable the loading of the bypass mux
assign lsu_asi_sel_b = dcc_lsu_asi_rd_b & ~(stb_diag_rd_b | asi_dcd_diag_rd_b);
assign dcc_lsu_asi_sel_w = lsu_asi_sel_w;

assign dcc_rd_diag_dca_b = asi_dca_diag_rd_b;

assign dcc_rd_lsu_ctl_reg_b = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h45) & ~|(lsu_va_b[4:3]);
assign dcc_rd_intr_id_b     = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h63) & ~lsu_va_b[4];
assign dcc_rd_core_id_b     = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h63) &  lsu_va_b[4];
assign dcc_rd_diag_reg_b    = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h42) &  lsu_va_b[4];
assign dcc_rd_error_inj_b   = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h43);
assign dcc_rd_pwr_mgmt_b    = ld_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h4E);

assign dcc_tlb_tag0_read_b = dcc_tlb_tag_read_b & ~lsu_va_b[10];
assign dcc_tlb_tag1_read_b = dcc_tlb_tag_read_b &  lsu_va_b[10];

// ASI reads are muxed in two levels.  This controls the mux that selects among the sources
// on the right hand side of the LSU.  (DTAG, DTLB_DATA, DTLB_TAG, etc.)
assign dcc_rd_rhs_asi_b = dcc_rd_dt_diag_b | dcc_tlb_tag_read_b | dcc_tlb_data_read_b;

// dcc_lsu_asi_rd_b is used to block the load from going out on the ASI ring
assign dcc_lsu_asi_rd_b = lsu_asi_rd_b | dcc_rd_lsu_ctl_reg_b | dcc_rd_intr_id_b | 
                          dcc_rd_core_id_b | dcc_rd_diag_reg_b | dcc_rd_dt_diag_b |
                          dcc_rd_diag_dca_b | dcc_tlb_tag_read_b | dcc_tlb_data_read_b |
                          dcc_rd_error_inj_b | dcc_rd_pwr_mgmt_b;

assign wr_error_inj_m    = st_inst_vld_m & altspace_ldst_m & (dcc_asi_m[7:0] == 8'h43);

assign dcc_wr_error_inj_m = wr_error_inj_m;

// Need this to copy the address to the store data
assign dcc_demap_asi_m   = st_inst_vld_m & altspace_ldst_m & ((dcc_asi_m[7:0] == 8'h57) | (dcc_asi_m[7:0] == 8'h5f));

assign asi_wtchpt_wr_b   = st_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h58) & (lsu_va_b[5] & lsu_va_b[4] & lsu_va_b[3]);
assign asi_ctl_reg_wr_b  = st_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h45) & ~|(lsu_va_b[4:3]);
assign asi_diag_reg_wr_b = st_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h42) & lsu_va_b[4];
assign asi_wr_pwr_mgmt_b = st_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h4E);
assign asi_ceter_wr_b    = st_inst_vld_b & altspace_ldst_b & (dcc_asi_b[7:0] == 8'h4C) & (~lsu_va_b[5] & lsu_va_b[4] & lsu_va_b[3]);

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_wr_state_w  (
	.scan_in(dff_wr_state_w_scanin),
	.scan_out(dff_wr_state_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({asi_wtchpt_wr_b,asi_ctl_reg_wr_b,asi_diag_reg_wr_b,sbd_st_data_b[1:0],
		  asi_wr_pwr_mgmt_b,wr_error_inj_b,asi_ceter_wr_b}),
	.dout	({asi_wtchpt_wr_w,asi_ctl_reg_wr_w,asi_diag_reg_wr_w,st_data_w[1:0],    
		  asi_wr_pwr_mgmt_w,wr_error_inj_w,asi_ceter_wr_w}),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_6 dff_tlu_asi  (
	.scan_in(dff_tlu_asi_scanin),
	.scan_out(dff_tlu_asi_scanout),
	.din	({tlu_asi_0_valid,   tlu_asi_1_valid,   tlu_asi_0_tid[1:0],   tlu_asi_1_tid[1:0]}),
	.dout	({reload_asi_0_valid,reload_asi_1_valid,reload_asi_0_tid[1:0],reload_asi_1_tid[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_asi_reload_sel[0] = ~reload_asi_0_tid[1] & ~reload_asi_0_tid[0] & reload_asi_0_valid;
assign dcc_asi_reload_sel[1] = ~reload_asi_0_tid[1] &  reload_asi_0_tid[0] & reload_asi_0_valid;
assign dcc_asi_reload_sel[2] =  reload_asi_0_tid[1] & ~reload_asi_0_tid[0] & reload_asi_0_valid;
assign dcc_asi_reload_sel[3] =  reload_asi_0_tid[1] &  reload_asi_0_tid[0] & reload_asi_0_valid;
assign dcc_asi_reload_sel[4] = ~reload_asi_1_tid[1] & ~reload_asi_1_tid[0] & reload_asi_1_valid;
assign dcc_asi_reload_sel[5] = ~reload_asi_1_tid[1] &  reload_asi_1_tid[0] & reload_asi_1_valid;
assign dcc_asi_reload_sel[6] =  reload_asi_1_tid[1] & ~reload_asi_1_tid[0] & reload_asi_1_valid;
assign dcc_asi_reload_sel[7] =  reload_asi_1_tid[1] &  reload_asi_1_tid[0] & reload_asi_1_valid;

assign dcc_wr_wtchpt[0] = asi_wtchpt_wr_w & thread_w[0] & ~flush_w;
assign dcc_wr_wtchpt[1] = asi_wtchpt_wr_w & thread_w[1] & ~flush_w;
assign dcc_wr_wtchpt[2] = asi_wtchpt_wr_w & thread_w[2] & ~flush_w;
assign dcc_wr_wtchpt[3] = asi_wtchpt_wr_w & thread_w[3] & ~flush_w;
assign dcc_wr_wtchpt[4] = asi_wtchpt_wr_w & thread_w[4] & ~flush_w;
assign dcc_wr_wtchpt[5] = asi_wtchpt_wr_w & thread_w[5] & ~flush_w;
assign dcc_wr_wtchpt[6] = asi_wtchpt_wr_w & thread_w[6] & ~flush_w;
assign dcc_wr_wtchpt[7] = asi_wtchpt_wr_w & thread_w[7] & ~flush_w;

assign dcc_wr_lsu_ctl_reg[0] = (asi_ctl_reg_wr_w & thread_w[0] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[0];
assign dcc_wr_lsu_ctl_reg[1] = (asi_ctl_reg_wr_w & thread_w[1] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[1];
assign dcc_wr_lsu_ctl_reg[2] = (asi_ctl_reg_wr_w & thread_w[2] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[2];
assign dcc_wr_lsu_ctl_reg[3] = (asi_ctl_reg_wr_w & thread_w[3] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[3];
assign dcc_wr_lsu_ctl_reg[4] = (asi_ctl_reg_wr_w & thread_w[4] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[4];
assign dcc_wr_lsu_ctl_reg[5] = (asi_ctl_reg_wr_w & thread_w[5] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[5];
assign dcc_wr_lsu_ctl_reg[6] = (asi_ctl_reg_wr_w & thread_w[6] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[6];
assign dcc_wr_lsu_ctl_reg[7] = (asi_ctl_reg_wr_w & thread_w[7] & ~flush_w) | ~tlu_lsu_clear_ctl_reg_[7];

assign dcc_wr_pwr_mgmt    = asi_wr_pwr_mgmt_w & ~flush_w;
assign dcc_wr_error_inj_w = wr_error_inj_w & ~flush_w;
assign dcc_ceter_wr_w     = asi_ceter_wr_w & ~flush_w;

assign stb_diag_rd_w_qual = stb_diag_rd_w & ~flush_w & ~mbi_run_local;

assign stb_ptr_rd_w2  = (stb_diag_rd_w2 &  va_w2[8]) & ~mbi_run_local;
assign stb_data_rd_w2 = (stb_diag_rd_w2 & ~va_w2[8] & ~va_w2[7] & ~va_w2[6]) |
                        (mbi_run_local & bist_srm_rd_1 & ~bist_cmpsel_1[1] & ~bist_cmpsel_1[0]);
assign stb_ecc_rd_w2  = (stb_diag_rd_w2 & ~va_w2[8] & ~va_w2[7] &  va_w2[6]) |
                        (mbi_run_local & bist_srm_rd_1 & ~bist_cmpsel_1[1] &  bist_cmpsel_1[0]);
assign stb_ctl_rd_w2  = (stb_diag_rd_w2 & ~va_w2[8] &  va_w2[7] & ~va_w2[6]) |
                        (mbi_run_local & bist_srm_rd_1 &  bist_cmpsel_1[1] & ~bist_cmpsel_1[0]);
assign stb_addr_rd_w2 = (stb_diag_rd_w2 & ~va_w2[8] &  va_w2[7] &  va_w2[6]) | 
                        (mbi_run_local & bist_scm_rd_1);

lsu_dcc_ctl_msff_ctl_macro__width_13 dff_stb_w3  (
	.scan_in(dff_stb_w3_scanin),
	.scan_out(dff_stb_w3_scanout),
	.din	({stb_diag_rd_w_qual,va_w[10:4], stb_data_rd_w2,stb_ecc_rd_w2,stb_ctl_rd_w2,stb_ptr_rd_w2,stb_addr_rd_w2}),
	.dout	({stb_diag_rd_w2,    va_w2[10:4],stb_data_rd_w3,stb_ecc_rd_w3,stb_ctl_rd_w3,stb_ptr_rd_w3,stb_addr_rd_w3}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_stb_ptr_rd_w3   = stb_ptr_rd_w3;
assign dcc_stb_data_rd_w3  = stb_data_rd_w3;
assign dcc_stb_ecc_rd_w3   = stb_ecc_rd_w3;
assign dcc_stb_ctl_rd_w3   = stb_ctl_rd_w3;
assign dcc_stb_addr_sel_w3 = stb_addr_rd_w3;

// dcc_stb_diag_sel_w3 loads the bypass mux
assign dcc_stb_diag_sel_w3 = stb_ptr_rd_w3 | stb_data_rd_w3 | stb_ecc_rd_w3 | stb_ctl_rd_w3 | stb_addr_rd_w3;

// ASI_LSU_DIAG_REG is just two bits and not threaded, so keep it here.
assign diag_reg_in[1:0] = (asi_diag_reg_wr_w & ~flush_w) ? st_data_w[1:0] : diag_reg[1:0] ;

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_diag_reg  (
	.scan_in(dff_diag_reg_scanin),
	.scan_out(dff_diag_reg_scanout),
	.l1clk	(l1clk_pm1),
	.din	(diag_reg_in[1:0]),
	.dout	(diag_reg[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_ifu_direct_map = diag_reg[0];
assign dcc_direct_map = diag_reg[1] | asi_cache_diag_wr_b;

////////////////////////////////////////////////////////////////////////////////
// Replacement way for load miss.
////////////////////////////////////////////////////////////////////////////////

assign way_hit_enc[0] = tlb_cache_way_hit_b[1] | tlb_cache_way_hit_b[3];
assign way_hit_enc[1] = tlb_cache_way_hit_b[2] | tlb_cache_way_hit_b[3];

// Replacement way is from one of the following sources
// (1) The way with the error in case of D$ error
// (2) The way hit in the dcache in the case of a partial raw.
// (3) Bits 12:11 of the VA in direct mapped mode.
// (4) LRU replacement in all other cases
 
assign ld_way_b[1:0] =             dcc_perror_b ? way_err_enc[1:0] :	// (1)
              (tlb_cache_hit_b & ld_inst_vld_b) ? way_hit_enc[1:0] :  	// (2)
		                 dcc_direct_map ? lsu_va_b[12:11] :  	// (3)
		                                  rway[1:0];	     	// (4)
                        
//////////////////////////////////////////////////////////////
// LRU replacement.  Use the matrix method for LRU calculation.
//
//   3|               When line is used, set row to all 1's and
//   2|         [5]   set column to all 0's
//   1|     [3] [4]
//   0| [0] [1] [2]   LRU way is the one with all 0's in   
//    -------------   its row and all 1's in it's column
//   0   1   2   3 

// State data from LRU array
assign lru_line_sel[0] = mbi_run_local ? (~bist_addr_1[6] & ~bist_addr_1[5]) : (~lsu_va_m[5] & ~lsu_va_m[4]);
assign lru_line_sel[1] = mbi_run_local ? (~bist_addr_1[6] &  bist_addr_1[5]) : (~lsu_va_m[5] &  lsu_va_m[4]);
assign lru_line_sel[2] = mbi_run_local ? ( bist_addr_1[6] & ~bist_addr_1[5]) : ( lsu_va_m[5] & ~lsu_va_m[4]);
assign lru_line_sel[3] = mbi_run_local ? ( bist_addr_1[6] &  bist_addr_1[5]) : ( lsu_va_m[5] &  lsu_va_m[4]);

assign lru_rd_data_m[5:0] = ({6{lru_line_sel[3]}} & lru_rdata_m[23:18]) |
                            ({6{lru_line_sel[2]}} & lru_rdata_m[17:12]) |
                            ({6{lru_line_sel[1]}} & lru_rdata_m[11:6]) |
                            ({6{lru_line_sel[0]}} & lru_rdata_m[5:0]) ;

assign bypass_from_w2 = (lsu_va_m[10:4] ==     va_w2[10:4]) & ld_inst_vld_w2 & ~mbi_run_local;
assign bypass_from_w  = (lsu_va_m[10:4] ==     va_w[10:4])  & ld_inst_vld_w  & ~mbi_run_local;
assign bypass_from_b  = (lsu_va_m[10:4] == lsu_va_b[10:4])  & ld_inst_vld_b  & ~mbi_run_local;

assign lru_state_in_m[5:0] =
 bypass_from_b ? new_lru_state_b[5:0] : 
                 (bypass_from_w ? lru_state_w[5:0] :
                                  (bypass_from_w2 ? lru_state_w2[5:0] : lru_rd_data_m[5:0])
                 );

lsu_dcc_ctl_msff_ctl_macro__width_6 dff_lru_data_b  (
	.scan_in(dff_lru_data_b_scanin),
	.scan_out(dff_lru_data_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(lru_state_in_m[5:0]),
	.dout	(lru_state_in_b[5:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// If this was bypassed from W and that load missed the cache and was a full RAW, we
// don't want to use the modified state since the cache is unchanged.

assign lru_state_b[5:0] = lru_state_in_b[5:0];

// This is the logic that takes the lru state and "hit" way and generates the LRU way
// and the new lru state
assign lru_way[0] = ~(lru_state_b[0] | lru_state_b[1] | lru_state_b[2]);
assign lru_way[1] = ~(lru_state_b[3] | lru_state_b[4]) & lru_state_b[0];
assign lru_way[2] = ~lru_state_b[5] & lru_state_b[1] & lru_state_b[3];
assign lru_way[3] = lru_state_b[2] & lru_state_b[4] & lru_state_b[5];

assign rway[0] = lru_way[1] | lru_way[3];
assign rway[1] = lru_way[2] | lru_way[3];

assign ldhit_b = ld_inst_vld_b & (tlb_cache_hit_b & dcache_enable_b);
assign used_way[3:0] = ldhit_b ? tlb_cache_way_hit_b[3:0] : lru_way[3:0];

assign new_lru_state_b[0] = (lru_state_b[0] & ~used_way[1]) | used_way[0];
assign new_lru_state_b[1] = (lru_state_b[1] & ~used_way[2]) | used_way[0];
assign new_lru_state_b[2] = (lru_state_b[2] & ~used_way[3]) | used_way[0];
assign new_lru_state_b[3] = (lru_state_b[3] & ~used_way[2]) | used_way[1];
assign new_lru_state_b[4] = (lru_state_b[4] & ~used_way[3]) | used_way[1];
assign new_lru_state_b[5] = (lru_state_b[5] & ~used_way[3]) | used_way[2];


lsu_dcc_ctl_msff_ctl_macro__width_13 dff_new_lru_w  (
	.scan_in(dff_new_lru_w_scanin),
	.scan_out(dff_new_lru_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({new_lru_state_b[5:0],lru_state_b[5:0],    ld_inst_vld_b}),
	.dout	({new_lru_state_w[5:0],old_lru_state_w[5:0],ld_inst_vld_w}),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_7 dff_new_lru_w2  (
	.scan_in(dff_new_lru_w2_scanin),
	.scan_out(dff_new_lru_w2_scanout),
	.din	({lru_state_w[5:0], ld_inst_vld_w}),
	.dout	({lru_state_w2[5:0],ld_inst_vld_w2}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// LRU state should not be updated on full RAWs which miss the cache or non-cacheable loads
// The full RAW timing is too critical to use in B, so it gets factored in in W.

assign update_lru_noraw_b = ld_inst_vld_b & ~ncache_rq_b;
assign update_lru_raw_b = ld_inst_vld_b & ~ncache_rq_b & tlb_cache_hit_b;

lsu_dcc_ctl_msff_ctl_macro__width_20 dff_update_lru  (
	.scan_in(dff_update_lru_scanin),
	.scan_out(dff_update_lru_scanout),
	.l1clk	(l1clk_pm1),
	.din	({update_lru_noraw_b,update_lru_raw_b,lsu_va_b[20:3]}),
	.dout	({update_lru_noraw_w,update_lru_raw_w,va_w[20:3]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_va_w[12:3] = va_w[12:3];

assign dcc_lru_wr_addr_w[10:6] = mbi_run_local ? mbi_addr[4:0] : va_w[10:6];

assign dcc_lru_rvld_e = mbi_run_local ? mbi_lru_read_en : dcache_read_e; 
assign lru_new_state = (lmc_full_raw_w ? update_lru_raw_w : update_lru_noraw_w) & ~flush_w;
assign dcc_lru_wvld_w = mbi_run_local ? mbi_lru_write_en : lru_new_state;

assign lru_state_w[5:0] = lru_new_state ? new_lru_state_w[5:0] : old_lru_state_w[5:0];

assign dcc_lru_wdata_w[5:0] = mbi_run_local ? mbi_wdata[5:0] : new_lru_state_w[5:0];

assign dcc_lru_wen_w[0] = mbi_run_local ? (~mbi_addr[6] & ~mbi_addr[5]) : (~va_w[5] & ~va_w[4]);
assign dcc_lru_wen_w[1] = mbi_run_local ? (~mbi_addr[6] &  mbi_addr[5]) : (~va_w[5] &  va_w[4]);
assign dcc_lru_wen_w[2] = mbi_run_local ? ( mbi_addr[6] & ~mbi_addr[5]) : ( va_w[5] & ~va_w[4]);
assign dcc_lru_wen_w[3] = mbi_run_local ? ( mbi_addr[6] &  mbi_addr[5]) : ( va_w[5] &  va_w[4]);


////////////////////////////////////////////////////////////////////////////////
// LMQ packet formating
////////////////////////////////////////////////////////////////////////////////

// Second packet of CAS uses load packet port.  Otherwise it's a normal load.
assign ld_rq_type[2:0] = atomic_b ? 3'b011 : 3'b000;

// Non-cacheable requests (all will sync the thread and initiate a pcx request)
assign ncache_rq_b =
  (tlb_tte_vld_b & ~tlb_tte_cp_b) |	// page has CP=0
  (tlb_tte_vld_b & tlb_tte_ie_b) |	// page has IE=1
  atomic_b |				// cas,ldstub,swap
  pgnum_b39_qual |			// IO access
  ldst_dbl_b & (~fpld_inst_b | (altspace_ldst_b & blk_asi_b)) |	// LDD and blk-ld
  dcc_asi_load_b |			// internal ASI loads do not allocate
  pref_inst_b |				// Prefetch does not allocate in the L1 caches
  ~dcache_enable_b;			// all loads are NC when D$ disabled

assign dcc_ncache_b = ncache_rq_b;
			
// The way should not matter for CAS since it's non-cacheable
//assign ld_pkt_way_b[1:0] = casa_inst_b ? 2'b00 : ld_way_b[1:0];
assign ld_pkt_way_b[1:0] = ld_way_b[1:0];

assign mem_ld_miss_ctl[60:40] = {
  1'b0,
  fld_odd32b_b,
  fld_32b_b,
  fpld_inst_b,
  fld_sxt_fsr_b,
  ~l1hit_lendian_b,
  ld_rd_b[4:0],
  (ldst_dbl_b & (~fpld_inst_b | (altspace_ldst_b & blk_asi_b))) | pref_ice_b,
  ldst_sz_b[1],ldst_sz_b0_b,
  ld_rq_type[2:0],
  ncache_rq_b,
  pref_inst_b,
  ld_pkt_way_b[1:0]
};
assign dcc_ld_miss_ldd = mem_ld_miss_ctl[49] & ~pref_ice_b;

assign asi_ld_miss_ctl[60:40] = {
  1'b1,
  3'b000,
  asi_indet_b,
  asi_rngf_b,
  ld_rd_b[4:0],
  asi_type_b[1:0],
  dcc_asi_b[7:0]
};

assign dcc_ld_miss_ctl[60:40] = (dcc_asi_load_b & ~dcc_asi_iomap_b) ? asi_ld_miss_ctl[60:40] : mem_ld_miss_ctl[60:40];

////////////////////////////////////////////////////////////////////////////////
// Signal sync instructions (flush/membar/stbar) to the store buffers
////////////////////////////////////////////////////////////////////////////////

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_sync_inst_w  (
	.scan_in(dff_sync_inst_w_scanin),
	.scan_out(dff_sync_inst_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	(sync_inst_b),
	.dout	(sync_inst_w),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_sync_inst_w[0] = sync_inst_w & thread_w[0] & ~flush_w;
assign dcc_sync_inst_w[1] = sync_inst_w & thread_w[1] & ~flush_w;
assign dcc_sync_inst_w[2] = sync_inst_w & thread_w[2] & ~flush_w;
assign dcc_sync_inst_w[3] = sync_inst_w & thread_w[3] & ~flush_w;
assign dcc_sync_inst_w[4] = sync_inst_w & thread_w[4] & ~flush_w;
assign dcc_sync_inst_w[5] = sync_inst_w & thread_w[5] & ~flush_w;
assign dcc_sync_inst_w[6] = sync_inst_w & thread_w[6] & ~flush_w;
assign dcc_sync_inst_w[7] = sync_inst_w & thread_w[7] & ~flush_w;

////////////////////////////////////////////////////////////////////////////////

// Encode store request types
assign st_rq_type_b[1] = (atomic_b & ~casa_inst_b) | asi_type_b[1];
assign st_rq_type_b[0] = atomic_b | asi_type_b[0];

lsu_dcc_ctl_msff_ctl_macro__width_3 dff_st_type_w  (
	.scan_in(dff_st_type_w_scanin),
	.scan_out(dff_st_type_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	({st_rq_type_b[1:0],    st_inst_vld_b}),
	.dout	({dcc_st_rq_type_w[1:0],st_inst_vld_w}),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////////////
// Parity generation
////////////////////////////////////////////////////////////////////////////////

// Parity invert.  Parity can be inverted by diagnostic accesses.
// UE/ND errors from L2 also cause an error to be injected
// NOTE : lmc_l2_uerr will not assert when dca_diag_wr_e is high
// 0in bits_on -var {lmc_l2_uerr,dca_diag_wr_e} -max 1 

assign dcc_parity_invert[7:0] = (va_w[20:13] & {8{dca_diag_wr_e}}) | {8{(cic_cpq_ld_sel & lmc_l2_uerr)}};

assign dcc_dta_parity = mbi_run_local ? mbi_wdata[5] : ((dta_diag_wr_e & va_w[13]) ^ lmd_wrtag_parity_e);

////////////////////////////////////////////////////////////////////////////////
// Exceptions (listed in order of priority)
////////////////////////////////////////////////////////////////////////////////

// mux in the privilege status
assign pstate_priv_d = (thread0_d & tlu_lsu_pstate_priv[0]) |
                       (thread1_d & tlu_lsu_pstate_priv[1]) |
                       (thread2_d & tlu_lsu_pstate_priv[2]) |
                       (thread3_d & tlu_lsu_pstate_priv[3]) |
                       (thread4_d & tlu_lsu_pstate_priv[4]) |
                       (thread5_d & tlu_lsu_pstate_priv[5]) |
                       (thread6_d & tlu_lsu_pstate_priv[6]) |
                       (thread7_d & tlu_lsu_pstate_priv[7]) ;

assign hpstate_hpriv_d = (thread0_d & tlu_lsu_hpstate_hpriv[0]) |
                         (thread1_d & tlu_lsu_hpstate_hpriv[1]) |
                         (thread2_d & tlu_lsu_hpstate_hpriv[2]) |
                         (thread3_d & tlu_lsu_hpstate_hpriv[3]) |
                         (thread4_d & tlu_lsu_hpstate_hpriv[4]) |
                         (thread5_d & tlu_lsu_hpstate_hpriv[5]) |
                         (thread6_d & tlu_lsu_hpstate_hpriv[6]) |
                         (thread7_d & tlu_lsu_hpstate_hpriv[7]) ;

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_priv_state_e  (
	.scan_in(dff_priv_state_e_scanin),
	.scan_out(dff_priv_state_e_scanout),
	.l1clk	(l1clk),
	.din	({pstate_priv_d,hpstate_hpriv_d}),
	.dout	({pstate_priv_e,hpstate_hpriv_e}),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_priv_state_m  (
	.scan_in(dff_priv_state_m_scanin),
	.scan_out(dff_priv_state_m_scanout),
	.l1clk	(l1clk_pm1),
	.din	({pstate_priv_e,hpstate_hpriv_e}),
	.dout	({pstate_priv_m,hpstate_hpriv_m}),
  .siclk(siclk),
  .soclk(soclk)
);

assign bst_priv_m = ((sbc_tid_m[2:0] == 3'd0) & tlu_lsu_pstate_priv[0]) |
                    ((sbc_tid_m[2:0] == 3'd1) & tlu_lsu_pstate_priv[1]) |
                    ((sbc_tid_m[2:0] == 3'd2) & tlu_lsu_pstate_priv[2]) |
                    ((sbc_tid_m[2:0] == 3'd3) & tlu_lsu_pstate_priv[3]) |
                    ((sbc_tid_m[2:0] == 3'd4) & tlu_lsu_pstate_priv[4]) |
                    ((sbc_tid_m[2:0] == 3'd5) & tlu_lsu_pstate_priv[5]) |
                    ((sbc_tid_m[2:0] == 3'd6) & tlu_lsu_pstate_priv[6]) |
                    ((sbc_tid_m[2:0] == 3'd7) & tlu_lsu_pstate_priv[7]) ;

assign bst_hpriv_m = ((sbc_tid_m[2:0] == 3'd0) & tlu_lsu_hpstate_hpriv[0]) |
                     ((sbc_tid_m[2:0] == 3'd1) & tlu_lsu_hpstate_hpriv[1]) |
                     ((sbc_tid_m[2:0] == 3'd2) & tlu_lsu_hpstate_hpriv[2]) |
                     ((sbc_tid_m[2:0] == 3'd3) & tlu_lsu_hpstate_hpriv[3]) |
                     ((sbc_tid_m[2:0] == 3'd4) & tlu_lsu_hpstate_hpriv[4]) |
                     ((sbc_tid_m[2:0] == 3'd5) & tlu_lsu_hpstate_hpriv[5]) |
                     ((sbc_tid_m[2:0] == 3'd6) & tlu_lsu_hpstate_hpriv[6]) |
                     ((sbc_tid_m[2:0] == 3'd7) & tlu_lsu_hpstate_hpriv[7]) ;

assign pstate_priv_m_in = (sbc_bst_in_prog_m                 & bst_priv_m) |
                          (twocycle_b                        & pstate_priv_b) |
                          (~(sbc_bst_in_prog_m | twocycle_b) & pstate_priv_m);
assign hpstate_hpriv_m_in = (sbc_bst_in_prog_m                 & bst_hpriv_m) |
                            (twocycle_b                        & hpstate_hpriv_b) |
                            (~(sbc_bst_in_prog_m | twocycle_b) & hpstate_hpriv_m);

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_priv_state_b  (
	.scan_in(dff_priv_state_b_scanin),
	.scan_out(dff_priv_state_b_scanout),
	.din	({pstate_priv_m_in,hpstate_hpriv_m_in}),
	.dout	({pstate_priv_b,   hpstate_hpriv_b}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_priv_b = pstate_priv_b;
assign dcc_hpriv_b = hpstate_hpriv_b;

// TTE's are not valid for internal ASIs and cases where the VA was out-of-range
assign tlb_tte_vld_b = (ld_inst_vld_b | st_inst_vld_b) & ~tlb_bypass_b & tlb_cam_hit & ~tlb_cam_mhit & ~asi_internal_b & ~exu_va_oor_b;

// Qualify tlb_pgnum_b39 with cam_mhit to prevent propagation of bad data
assign pgnum_b39_qual = tlb_pgnum_b39 & ~tlb_cam_mhit;

// Make an M stage version.  This won't reflect the result of tlb_miss, so that has to be factored in elsewhere.
// This is only used for endian determination, so exu_va_oor doesn't have to be factored.
assign dcc_tte_vld_m = (ld_inst_vld_m | st_inst_vld_m) & ~tlb_bypass_m & ~asi_internal_m;


////////////////////////////////////////
// illegal_instruction
// - illegal register alignment
// - illegal rs/rd values for RDPR/RDASR/WRPR/WRASR
// - partial store ASI with i=1
// - wrpr %tick in mode other than hpriv or wrasr to %tick (%asr4)
// - wrhpr to %hver (Rd=6)
// - access to pr<=3 or hpr==1 when tl=0 and not in user mode

assign blk_rd_align_err_m = blk_inst_m & asi_legal_m & ~bad_fp_asi & |(ld_rd_m[2:0]);
assign rd_odd_align_err_m = (ld_inst_vld_m | st_inst_vld_m) & (ldst_dbl_m & ~fpldst_inst_vld_m) & ld_rd_m[0];

assign illegal_spr_m = ~asr_legal_m & ~altspace_ldst_m;

assign pst_with_imm_m = pst_asi_m & asi_legal_m & ~imm_asi_vld_m & ~bad_fp_asi & ~asi_wo_viol;

assign priv_wrpr_tick_m = st_inst_vld_m & (ld_rd_inst_m[4:0] == 5'b00100) &
                          ((pr_inst_m & ~hpstate_hpriv_m & pstate_priv_m) | sr_inst_m);

assign wrhpr_ver_m = hpr_inst_m & st_inst_vld_m & (ld_rd_inst_m[3:0] == 4'b0110);

assign tl_eq_0_m = (ld_inst_vld_m | st_inst_vld_m) & ~tl_gt_0_m & (pstate_priv_m | hpstate_hpriv_m) &
                   ((pr_inst_m & dcc_asi_m[4:2]==3'b000) | (hpr_inst_m & dcc_asi_m[4:0]==5'b00001));

assign illegal_inst_m = (blk_rd_align_err_m | rd_odd_align_err_m | pst_with_imm_m |
                         illegal_spr_m      | priv_wrpr_tick_m   | wrhpr_ver_m    |
                         tl_eq_0_m) &
                        (ld_inst_vld_m | st_inst_vld_m);

////////////////////////////////////////
// mem_address_not_aligned
// Alignment is checked against the VA, unless the instruction
// alignment is modified by an ASI.  ASI modifiers are only used
// if a proper instruction/ASI combination is present.

assign  hw_aligned = ~lsu_va_m[0];
assign  wd_aligned = ~|(lsu_va_m[1:0]);
assign  dw_aligned = ~|(lsu_va_m[2:0]);
assign  qw_aligned = ~|(lsu_va_m[3:0]);
assign  bl_aligned = ~|(lsu_va_m[5:0]);

assign hw_size = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b01) : (ldst_sz_mod_m[1:0] == 2'b01);
assign wd_size = bad_fp_asi ? (ldst_sz_m[1:0] == 2'b10) : (ldst_sz_mod_m[1:0] == 2'b10);
assign dw_size = (bad_fp_asi ? (ldst_sz_m[1:0] == 2'b11) : (ldst_sz_mod_m[1:0] == 2'b11)) & ~bl_size;
assign qw_size = quad_ld_m;
assign bl_size = blk_inst_m; 

assign mem_addr_not_aligned =
	(st_inst_vld_m | (ld_inst_vld_m & ~pref_inst_m)) &
	~(sr_inst_m | pr_inst_m | hpr_inst_m) &
	((hw_size & ~hw_aligned) |
	 (wd_size & ~wd_aligned) |
	 (dw_size & ~dw_aligned) |
	 (qw_size & ~qw_aligned) |
	 (bl_size & ~bl_aligned)) &
        ~(lddf_not_aligned | stdf_not_aligned);

assign lddf_not_aligned = fpldst_inst_vld_m & ldst_dbl_m & ld_inst_vld_m & dw_size & wd_aligned & ~dw_aligned; 
assign stdf_not_aligned = fpldst_inst_vld_m & ldst_dbl_m & st_inst_vld_m & dw_size & wd_aligned & ~dw_aligned; 

////////////////////////////////////////
// privileged_action
// - ASI privilege violations
// ASI's 0x00-0x2F are privileged
// ASI's 0x30-0x7F are hyperprivileged
// NOTE: If TL>0, the implicit ASI=0x04, so user access should cause the trap

// priv access to hpriv ASI's
assign hpriv_asi = ~dcc_asi_m[7] & (dcc_asi_m[6] | (dcc_asi_m[5] & dcc_asi_m[4]));

assign hpriv_asi_excp = altspace_ldst_m & (hpriv_asi & ~hpstate_hpriv_m & pstate_priv_m);

assign priv_action_m = (ld_inst_vld_m | st_inst_vld_m) & 		// valid ld/st inst. AND
                       ~(sr_inst_m | pr_inst_m | hpr_inst_m) &		//  NOT WRSR/WRPR/WRHPR AND
                       ((((altspace_ldst_m & ~dcc_asi_m[7]) |		//   explicit ASI<0x80 OR
                        (~altspace_ldst_m & tl_gt_0_m)) &		//   implicit ASI=0x04   AND
                       ~(hpstate_hpriv_m | pstate_priv_m)) |		//  in user mode  OR
                        hpriv_asi_excp);				//  priv access to hpriv ASIs

////////////////////////////////////////
// data_access_exception
// - attempts to access privileged pages when PSTATE.PRIV=0
// - atomic accesses to ASIs other than those specifically allowed
// - atomic accesses to non-cacheable pages (TTE.CP=0)
// - access to NFO page with an ASI other than non-fault
// - access to NFO page with TTE.E=1
// - non-priv access to pages with TTE.P set
// - invalid ASIs
//   - undefined/unimplemented ASI values
//   - disallowed ASI/instruction combination
//   - write to read-only or read to write-only
//   - internal ASIs with bad VA

assign illegal_asi_m = ~asi_legal_m & altspace_ldst_m;

assign non_atomic_asi_m = atomic_m & ~atomic_asi_m;

assign atomic_uncache_b = (atomic_b | quad_ldd_b) & ((tlb_tte_vld_b & ~tlb_tte_cp_b) | (pgnum_b39_qual & tlb_cam_hit));

assign nfo_pg_nonnfo_asi_b = (ld_inst_vld_b | st_inst_vld_b) & tlb_tte_nfo_b & ~nofault_asi_b & tlb_tte_vld_b;

assign nfo_asi_ebit_b = ld_inst_vld_b & nofault_asi_b & ((tlb_tte_ebit_b & tlb_tte_vld_b) | (tlb_bypass_b & pgnum_b39_qual));

assign user_page_access_m = (ld_inst_vld_m | st_inst_vld_m) & (as_if_user_asi_m | ~(hpstate_hpriv_m | pstate_priv_m));

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_usr_pg_access_b  (
	.scan_in(dff_usr_pg_access_b_scanin),
	.scan_out(dff_usr_pg_access_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(user_page_access_m),
	.dout	(user_page_access_b),
  .siclk(siclk),
  .soclk(soclk)
);
assign priv_page_viol_b = user_page_access_b & tlb_tte_pbit_b & tlb_tte_vld_b;
                           
// Internal ASI's can only be accessed with LDXA/STXA
assign ldxa_asi_exception = (ld_inst_vld_m | st_inst_vld_m) & asi_internal_m & (~(ldst_sz_mod_m[1:0] == 2'b11) | ldst_dbl_m);

// Quad ASI's can only be accessed via LDDA
assign quad_ldda_exception = (ld_inst_vld_m & quad_asi_m & (fpldst_inst_vld_m | ~ldst_dbl_m)) |
                             (st_inst_vld_m & quad_asi_m & ~binit_quad_asi_m);

// Block load/store ASI's can only be accessed via LDDFA/STDFA
assign block_inst_exception = blk_asi_m & ~(ldst_dbl_m & fpldst_inst_vld_m) & (ld_inst_vld_m | st_inst_vld_m);

// Block loads to IO are not allowed
assign bld_to_io_b = ld_inst_vld_b & blk_asi_b & altspace_ldst_b & fpldst_inst_vld_b & ldst_dbl_b & pgnum_b39_qual & tlb_cam_hit;

// Stores to nofault asi's are not allowed
assign nofault_st_exception = st_inst_vld_m & nofault_asi_m;

// ASI_FL* and ASI_PST* only with LDDFA/STDFA
assign bad_fp_asi = (asi_sz_byte_m | asi_sz_hw_m | pst_asi_m) & ~(ldst_dbl_m & fpldst_inst_vld_m) & (ld_inst_vld_m | st_inst_vld_m);

// BLK_INIT_ST only allowed with integer stores
assign bis_with_fp = st_inst_vld_m & binit_quad_asi_m & fpldst_inst_vld_m;

// read-only/write-only violations (the ones from asi decode only indicate if the entire ASI is RO/WO) 
assign asi_ro_viol = (altspace_ldst_m & st_inst_vld_m) & 
	(asi_read_only_m |
	 ((dcc_asi_m[7:0] == 8'h40) & ((lsu_va_m[7:5] == 3'b101) |		// 0x40/0xA0
                                       (lsu_va_m[5:4] == 2'b11)	)		// 0x40/0x30
	 ) |
	 ((dcc_asi_m[7:0] == 8'h41) & ((lsu_va_m[7:5] == 3'b000) |		// 0x41/0x0+0x10
	                               (lsu_va_m[7:3] == 5'b01011))		// 0x41/0x58
	 ) |
	 ((dcc_asi_m[7:0] == 8'h50) & (lsu_va_m[7:4] == 4'b0000) 		// 0x50/0x0
	 ) |
	 ((dcc_asi_m[7:0] == 8'h58) & ((lsu_va_m[7:4] == 4'b0000) |		// 0x58/0x0
	                               (lsu_va_m[7:4] == 4'b0010))		// 0x58/0x20
	 ) |
	 ((dcc_asi_m[7:0] == 8'h54) & ((lsu_va_m[7]&!lsu_va_m[4]) |		// 0x54/0x50-0x88
	                               (lsu_va_m[7]&lsu_va_m[3]) | 
	                               (lsu_va_m[6]&lsu_va_m[5]) | 
                                       (lsu_va_m[6]&lsu_va_m[4]))
	 ) |
	 ((dcc_asi_m[7:0] == 8'h4c) & ((lsu_va_m[5]) |				// 0x4c/0x20-0x28
                                       (lsu_va_m[5:4] == 2'b00))		// 0x4c/0x0-0x8
         )
	);

assign asi_wo_viol = (altspace_ldst_m & ld_inst_vld_m) &
	(asi_write_only_m |
	 ((dcc_asi_m[7:0] == 8'h40) & (lsu_va_m[5:3] == 3'b101)			// 0x40/0x28
	 ) |
	 ((dcc_asi_m[7:0] == 8'h41) & (lsu_va_m[7:4] == 4'b0110)		// 0x41/0x60+0x68
	 ) |
	 ((dcc_asi_m[7:0] == 8'h54) & (lsu_va_m[7:4] == 4'b0000)		// 0x54/0x0+0x400+0x800+0xC00
	 )
	);

// Check for valid ASI/VA accesses.  ASI's which provide diagnostic access to
// arrays have wide allowable ranges, so they are not checked.  All other internal
// ASI's are strictly checked.  Excluding array diag and demap ASI's, all others
// only use the bottom 12 bits of the VA, so [47:12] must be zeros.
assign bad_asi_va_exception_m = altspace_ldst_m & asi_internal_m & ~asi_no_va_check_m &
                                (~legal_asi_va_m | (|(lsu_va_m[15:12])) | ~tld_va_m_eq_zero) ;

// Writes to the interrupt queue registers (ASI=0x25) by supervisor is not allowed.
assign wrpriv_intq_reg_m = (altspace_ldst_m & st_inst_vld_m) & (dcc_asi_m[7:0] == 8'h25) &
                           lsu_va_m[3] & ~hpstate_hpriv_m & pstate_priv_m;
//assign wrpriv_intq_reg_m = 1'b0;

assign dae_invalid_asi_m = illegal_asi_m 	| ldxa_asi_exception 	| quad_ldda_exception	| 
                           asi_ro_viol 		| asi_wo_viol		|
                           non_atomic_asi_m	| bad_asi_va_exception_m|
                           block_inst_exception	| nofault_st_exception	| bad_fp_asi		|
                           bis_with_fp		| wrpriv_intq_reg_m;

lsu_dcc_ctl_msff_ctl_macro__width_5 dff_excp_b  (
	.scan_in(dff_excp_b_scanin),
	.scan_out(dff_excp_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dae_invalid_asi_m,dcc_tlb_bypass,tlb_bypass_m,dcc_tlb_real,tlb_real_m}),
	.dout	({dae_invalid_asi_b,tlb_bypass_m,  tlb_bypass_b,tlb_real_m,  tlb_real_b}),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_tlb_bypass_b = tlb_bypass_b;
assign lsu_tlb_real_b = tlb_real_b;

assign access_exception_b = ~pref_inst_b &
                (dae_invalid_asi_b | nfo_pg_nonnfo_asi_b | priv_page_viol_b | atomic_uncache_b |
                 nfo_asi_ebit_b | bld_to_io_b);
assign lsu_dae_invalid_asi_b = ~pref_inst_b & dae_invalid_asi_b;
assign lsu_dae_nc_page_b     = ~pref_inst_b & (atomic_uncache_b | bld_to_io_b);
assign lsu_dae_nfo_page_b    = ~pref_inst_b & nfo_pg_nonnfo_asi_b;
assign lsu_dae_priv_viol_b   = ~pref_inst_b & priv_page_viol_b;
assign lsu_dae_so_page       = ~pref_inst_b & nfo_asi_ebit_b;

////////////////////////////////////////
// watchpoint exceptions
// Only one exception (VA or PA) can be enabled per thread.
// If both are enabled in ASI_LSU_CONTROL_REG, only VA will be checked.
// Nontranslating(internal) or illegal ASI's should not cause wpt traps.
// RA->PA and bypass translations should not cause VA wpt traps.
assign va_wpt_en_m = dcs_wpt_mode_m[1] & dcs_wpt_mode_m[0] & 
                      ~asi_internal_m & ~illegal_asi_m & ~tlb_bypass_m & ~tlb_real_m & ~hpstate_hpriv_m;
assign pa_wpt_en_m = dcs_wpt_mode_m[1] & ~dcs_wpt_mode_m[0] &
                      ~asi_internal_m & ~illegal_asi_m;

assign va_wpt_rd_en_m = dcs_wpt_enable_m[1] & va_wpt_en_m;
assign va_wpt_wr_en_m = dcs_wpt_enable_m[0] & va_wpt_en_m;
assign pa_wpt_rd_en_m = dcs_wpt_enable_m[1] & pa_wpt_en_m;
assign pa_wpt_wr_en_m = dcs_wpt_enable_m[0] & pa_wpt_en_m;

// ldst_bmask is positional and corresponds to the byte within the 64B dword
// Each bit of dcs_wpt_mask corresponds to the big endian byte address within
// the 64B dword
// ldst_bmask		 [7]   [6]   [5]   [4]   [3]   [2]   [1]   [0]
// 64B dword		byte0 byte1 byte2 byte3 byte4 byte5 byte6 byte7 
// dcs_wpt_mask		 [0]   [1]   [2]   [3]   [4]   [5]   [6]   [7]

assign wpt_bmask[7:0] = ldst_bmask[7:0] | {8{pst_asi_m & ~bad_fp_asi}};

assign mask_match_m = (wpt_bmask[7] & dcs_wpt_mask_m[0]) |
                      (wpt_bmask[6] & dcs_wpt_mask_m[1]) |
                      (wpt_bmask[5] & dcs_wpt_mask_m[2]) |
                      (wpt_bmask[4] & dcs_wpt_mask_m[3]) |
                      (wpt_bmask[3] & dcs_wpt_mask_m[4]) |
                      (wpt_bmask[2] & dcs_wpt_mask_m[5]) |
                      (wpt_bmask[1] & dcs_wpt_mask_m[6]) |
                      (wpt_bmask[0] & dcs_wpt_mask_m[7]) ;

assign va_wpt_check_m = mask_match_m & ((va_wpt_rd_en_m & ld_inst_vld_m & ~pref_inst_m) | (va_wpt_wr_en_m & st_inst_vld_m));
assign pa_wpt_check_m = mask_match_m & ((pa_wpt_rd_en_m & ld_inst_vld_m & ~pref_inst_m) | (pa_wpt_wr_en_m & st_inst_vld_m));

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_wpt  (
	.scan_in(dff_wpt_scanin),
	.scan_out(dff_wpt_scanout),
	.l1clk	(l1clk_pm1),
	.din	({va_wpt_check_m,pa_wpt_check_m}),
	.dout	({va_wpt_check_b,pa_wpt_check_b}),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_va_watchpoint_b = tgd_va_wp_47_16 & tgd_va_wp_15_3 & va_wpt_check_b;
assign lsu_pa_watchpoint_b = tgd_pa_wp_39_16 & tgd_pa_wp_15_3 & pa_wpt_check_b & ~tlb_cam_mhit;

// 0in bits_on -var {lsu_va_watchpoint_b,lsu_pa_watchpoint_b} -max 1 -message "Both watchpoints fired!"

//////////////////////////////////////////
// Feedback from the ASI ring

assign asi_rtn_vld_2f = arc_pid_ctl_2f[6];
assign asi_rtn_excp_2f = arc_pid_ctl_2f[5] | arc_pid_ctl_2f[4];
assign asi_rtn_rd_2f = arc_pid_ctl_2f[3];
assign asi_rtn_tid_2f[2:0] = arc_pid_ctl_2f[2:0];

lsu_dcc_ctl_msff_ctl_macro__width_6 dff_asi_g  (
	.scan_in(dff_asi_g_scanin),
	.scan_out(dff_asi_g_scanout),
	.din	({asi_rtn_vld_2f,asi_rtn_excp_2f,asi_rtn_rd_2f,asi_rtn_tid_2f[2:0]}),
	.dout	({asi_rtn_vld_3f,asi_rtn_excp_3f,asi_rtn_rd_3f,asi_rtn_tid_3f[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_asi_rtn_vld[0] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd0);
assign dcc_asi_rtn_vld[1] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd1);
assign dcc_asi_rtn_vld[2] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd2);
assign dcc_asi_rtn_vld[3] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd3);
assign dcc_asi_rtn_vld[4] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd4);
assign dcc_asi_rtn_vld[5] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd5);
assign dcc_asi_rtn_vld[6] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd6);
assign dcc_asi_rtn_vld[7] = asi_rtn_vld_3f & (asi_rtn_tid_3f[2:0] == 3'd7);
assign dcc_asi_rtn_excp = asi_rtn_excp_3f;
assign dcc_asi_rtn_rd = asi_rtn_rd_3f;


//////////////////////////////////////////
// Outputs to TLU

lsu_dcc_ctl_msff_ctl_macro__width_5 dff_except  (
	.scan_in(dff_except_scanin),
	.scan_out(dff_except_scanout),
	.l1clk	(l1clk_pm1),
	.din	({mem_addr_not_aligned,lddf_not_aligned,stdf_not_aligned,priv_action_m,illegal_inst_m}),
	.dout	({lsu_align_b,         lsu_lddf_align_b,lsu_stdf_align_b,priv_action_b,lsu_illegal_inst_b}),
  .siclk(siclk),
  .soclk(soclk)
);

// Prefetch should not cause priv_action or tlb_miss exception
assign lsu_priv_action_b = priv_action_b & ~pref_inst_b;
assign lsu_tlb_miss_b_ = tlb_cam_hit | pref_inst_b | dae_invalid_asi_b;

assign lsu_daccess_prot_b = (st_inst_vld_b & ~tlb_tte_wbit_b & tlb_tte_vld_b) & ~access_exception_b; 

// Some conditions cause prefetch instructions to be treated as NOP.  These include
// prefetch to IO space
// prefetch with fcn=0x4,0x19-0x1f
// prefetcha with "bad" asi
// prefetch with fcn=0x18 and not hypervisor
// prefetcha with fcn=0x18
assign nop_pref_func = (~ld_rd_b[4]&ld_rd_b[2]) | (ld_rd_b[3] & |(ld_rd_b[2:0]));// DEC detects illegal for 0x5-0xf
assign pref_ice_b = pref_inst_b & (ld_rd_b[3:0] == 4'b1000);

assign pref_nop_b = pref_inst_b & 
                    (pgnum_b39_qual |
                     nop_pref_func |
                     (altspace_ldst_b & (~asi_legal_b | (~nofault_asi_b & ~atomic_asi_b))) |
                     ((ld_rd_b[3:0] == 4'b1000) & (altspace_ldst_b | ~hpstate_hpriv_b))
                    );

assign dcc_any_exception_b = lsu_align_b             | lsu_lddf_align_b    | lsu_stdf_align_b |
                             lsu_va_watchpoint_b     | lsu_pa_watchpoint_b | lsu_dtmh_err_b   | 
                             priv_action_b           | ~tlb_cam_hit        | lsu_dttp_err_b   |
                             lsu_illegal_inst_b      | lsu_daccess_prot_b  | lsu_dtdp_err_b   |
                             access_exception_b      | pref_nop_b          | lsu_perfmon_trap_b;


assign lsu_tlu_dsfsr_ct_b[1:0] = context_enc_b[1:0];

// FGU needs exceptions for setting FSR.ftt
lsu_dcc_ctl_msff_ctl_macro__width_1 dff_fgu_excp_w  (
	.scan_in(dff_fgu_excp_w_scanin),
	.scan_out(dff_fgu_excp_w_scanout),
	.l1clk	(l1clk_pm1),
	.din	((dcc_any_exception_b | exu_error_b)),
	.dout	(lsu_fgu_exception_w),
  .siclk(siclk),
  .soclk(soclk)
);


////////////////////////////////////////////////////////////////////////
// Logic for maintaining I$/D$ exlusivity
// I must store the index for each outgoing ifetch request so that
// if an invalidation is required, I know what line it applies to
////////////////////////////////////////////////////////////////////////

assign if_indx_0_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd0)) ? ifu_lsu_if_addr[10:5] : if_indx_0[10:5];
assign if_indx_1_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd1)) ? ifu_lsu_if_addr[10:5] : if_indx_1[10:5];
assign if_indx_2_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd2)) ? ifu_lsu_if_addr[10:5] : if_indx_2[10:5];
assign if_indx_3_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd3)) ? ifu_lsu_if_addr[10:5] : if_indx_3[10:5];
assign if_indx_4_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd4)) ? ifu_lsu_if_addr[10:5] : if_indx_4[10:5];
assign if_indx_5_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd5)) ? ifu_lsu_if_addr[10:5] : if_indx_5[10:5];
assign if_indx_6_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd6)) ? ifu_lsu_if_addr[10:5] : if_indx_6[10:5];
assign if_indx_7_in[10:5] = (ifu_lsu_if_vld & (ifu_lsu_if_tid[2:0]==3'd7)) ? ifu_lsu_if_addr[10:5] : if_indx_7[10:5];

lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_0  (
	.scan_in(dff_if_indx_0_scanin),
	.scan_out(dff_if_indx_0_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_0_in[10:5]),
	.dout	(if_indx_0[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_1  (
	.scan_in(dff_if_indx_1_scanin),
	.scan_out(dff_if_indx_1_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_1_in[10:5]),
	.dout	(if_indx_1[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_2  (
	.scan_in(dff_if_indx_2_scanin),
	.scan_out(dff_if_indx_2_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_2_in[10:5]),
	.dout	(if_indx_2[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_3  (
	.scan_in(dff_if_indx_3_scanin),
	.scan_out(dff_if_indx_3_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_3_in[10:5]),
	.dout	(if_indx_3[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_4  (
	.scan_in(dff_if_indx_4_scanin),
	.scan_out(dff_if_indx_4_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_4_in[10:5]),
	.dout	(if_indx_4[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_5  (
	.scan_in(dff_if_indx_5_scanin),
	.scan_out(dff_if_indx_5_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_5_in[10:5]),
	.dout	(if_indx_5[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_6  (
	.scan_in(dff_if_indx_6_scanin),
	.scan_out(dff_if_indx_6_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_6_in[10:5]),
	.dout	(if_indx_6[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);
lsu_dcc_ctl_msff_ctl_macro__width_6 dff_if_indx_7  (
	.scan_in(dff_if_indx_7_scanin),
	.scan_out(dff_if_indx_7_scanout),
	.l1clk	(l1clk_pm2),
	.din	(if_indx_7_in[10:5]),
	.dout	(if_indx_7[10:5]),
  .siclk(siclk),
  .soclk(soclk)
);

assign xinv_index[10:5] = ({6{(cid_tid[2:0] == 3'd0)}} & if_indx_0[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd1)}} & if_indx_1[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd2)}} & if_indx_2[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd3)}} & if_indx_3[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd4)}} & if_indx_4[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd5)}} & if_indx_5[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd6)}} & if_indx_6[10:5]) |
                          ({6{(cid_tid[2:0] == 3'd7)}} & if_indx_7[10:5]) ;
assign xinv_index[4] = cid_atomic;

assign xinval_bit_wen_e[0]  = ~xinv_index[5] & ~xinv_index[4] & ~cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[1]  = ~xinv_index[5] & ~xinv_index[4] & ~cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[2]  = ~xinv_index[5] & ~xinv_index[4] &  cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[3]  = ~xinv_index[5] & ~xinv_index[4] &  cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[4]  = ~xinv_index[5] &  xinv_index[4] & ~cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[5]  = ~xinv_index[5] &  xinv_index[4] & ~cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[6]  = ~xinv_index[5] &  xinv_index[4] &  cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[7]  = ~xinv_index[5] &  xinv_index[4] &  cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[8]  =  xinv_index[5] & ~xinv_index[4] & ~cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[9]  =  xinv_index[5] & ~xinv_index[4] & ~cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[10] =  xinv_index[5] & ~xinv_index[4] &  cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[11] =  xinv_index[5] & ~xinv_index[4] &  cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[12] =  xinv_index[5] &  xinv_index[4] & ~cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[13] =  xinv_index[5] &  xinv_index[4] & ~cid_xway[1] &  cid_xway[0];
assign xinval_bit_wen_e[14] =  xinv_index[5] &  xinv_index[4] &  cid_xway[1] & ~cid_xway[0];
assign xinval_bit_wen_e[15] =  xinv_index[5] &  xinv_index[4] &  cid_xway[1] &  cid_xway[0];

////////////////////////////////////////////////////////////////////////
// Parity error detection
////////////////////////////////////////////////////////////////////////

lsu_dcc_ctl_msff_ctl_macro__width_4 dff_way_vld_b  (
	.scan_in(dff_way_vld_b_scanin),
	.scan_out(dff_way_vld_b_scanout),
	.l1clk	(l1clk_pm1),
	.din	(tgc_cache_way_vld_m[3:0]),
	.dout	(cache_way_vld_b[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Valid bit errors have top priority
assign dval_perr_b[0] = dcache_read_b & tgc_verr_b[0] & cerer_dcvp & ~pgnum_b39_qual;
assign dval_perr_b[1] = dcache_read_b & tgc_verr_b[1] & cerer_dcvp & ~pgnum_b39_qual;
assign dval_perr_b[2] = dcache_read_b & tgc_verr_b[2] & cerer_dcvp & ~pgnum_b39_qual;
assign dval_perr_b[3] = dcache_read_b & tgc_verr_b[3] & cerer_dcvp & ~pgnum_b39_qual;
assign dval_perror_b = |(dval_perr_b[3:0]);

// Tag errors have next priority
assign dtag_perr_b[0] = dcache_read_b & (tgd_w0_parity_b & cache_way_vld_b[0]) & cerer_dctp & ~pgnum_b39_qual;
assign dtag_perr_b[1] = dcache_read_b & (tgd_w1_parity_b & cache_way_vld_b[1]) & cerer_dctp & ~pgnum_b39_qual;
assign dtag_perr_b[2] = dcache_read_b & (tgd_w2_parity_b & cache_way_vld_b[2]) & cerer_dctp & ~pgnum_b39_qual;
assign dtag_perr_b[3] = dcache_read_b & (tgd_w3_parity_b & cache_way_vld_b[3]) & cerer_dctp & ~pgnum_b39_qual;
assign dtag_perror_b = ~dval_perror_b & |(dtag_perr_b[3:0]);

// Multiple tag hit errors have next priority
assign mhit_err_b = ((tlb_cache_way_hit_b[0] & tlb_cache_way_hit_b[1]) |
                     (tlb_cache_way_hit_b[0] & tlb_cache_way_hit_b[2]) |
                     (tlb_cache_way_hit_b[0] & tlb_cache_way_hit_b[3]) |
                     (tlb_cache_way_hit_b[1] & tlb_cache_way_hit_b[2]) |
                     (tlb_cache_way_hit_b[1] & tlb_cache_way_hit_b[3]) |
                     (tlb_cache_way_hit_b[2] & tlb_cache_way_hit_b[3])) &
                       dcache_read_b & cerer_dctm & ~pgnum_b39_qual;
assign mhit_error_b = mhit_err_b & ~(dval_perror_b | dtag_perror_b);

// Data parity errors are lowest priority
assign data_perr_b[0] = dcache_read_b & dca_perr_w0_b & cache_way_vld_b[0] & cerer_dcdp & ~pgnum_b39_qual;
assign data_perr_b[1] = dcache_read_b & dca_perr_w1_b & cache_way_vld_b[1] & cerer_dcdp & ~pgnum_b39_qual;
assign data_perr_b[2] = dcache_read_b & dca_perr_w2_b & cache_way_vld_b[2] & cerer_dcdp & ~pgnum_b39_qual;
assign data_perr_b[3] = dcache_read_b & dca_perr_w3_b & cache_way_vld_b[3] & cerer_dcdp & ~pgnum_b39_qual;
assign data_perror_b = ~(dval_perror_b | dtag_perror_b | mhit_error_b) & |(data_perr_b[3:0]);

assign dcc_perror_b = dval_perror_b | (|(dtag_perr_b[3:0])) | mhit_err_b | (|(data_perr_b[3:0]));

// Error encodings - 00=valid, 01=tag, 10=mhit, 11=data - prioritized in that order
assign dcc_perr_enc_b[1] = mhit_error_b | data_perror_b;
assign dcc_perr_enc_b[0] = dtag_perror_b | data_perror_b;

// Way encodings
assign way_err[0] = (dval_perror_b & dval_perr_b[0]) |
                    (dtag_perror_b & dtag_perr_b[0]) |
                    (data_perror_b & data_perr_b[0])  |
                    (mhit_error_b  & tlb_cache_way_hit_b[0]);
assign way_err[1] = (dval_perror_b & dval_perr_b[1]) |
                    (dtag_perror_b & dtag_perr_b[1]) |
                    (data_perror_b & data_perr_b[1])  |
                    (mhit_error_b  & tlb_cache_way_hit_b[1]);
assign way_err[2] = (dval_perror_b & dval_perr_b[2]) |
                    (dtag_perror_b & dtag_perr_b[2]) |
                    (data_perror_b & data_perr_b[2])  |
                    (mhit_error_b  & tlb_cache_way_hit_b[2]);

assign way_err_enc[1] = ~way_err[0] & ~way_err[1];
assign way_err_enc[0] = ~way_err[0] & (way_err[1] | ~way_err[2]);

// Check that errors are never signaled during normal testing



///////////////////////
// TLB errors

// Resolve TLB tag parity error here.  Select the proper parity bit based
// on the page size and compare it to the stored parity.

assign prty_ctxt = (tlb_context0_hit ? tgd_prty_ctxt0_b : tgd_prty_ctxt1_b) & ~tlb_real_b;

assign tag_parity = (( tlb_pgsize[2] &                                   tgd_prty_256m_b) |
                     (~tlb_pgsize[2] &  tlb_pgsize[1] &                  tgd_prty_4m_b) |
                     (~tlb_pgsize[2] & ~tlb_pgsize[1] &  tlb_pgsize[0] & tgd_prty_64k_b) |
                     (~tlb_pgsize[2] & ~tlb_pgsize[1] & ~tlb_pgsize[0] & tgd_prty_8k_b)) ^
                     prty_ctxt;
     

assign lsu_dttp_err_b = cerer_dttp & tlb_tte_vld_b & (tag_parity ^ tlb_tag_parity);
assign lsu_dtdp_err_b = cerer_dtdp & tlb_tte_vld_b & tlb_tte_data_parity;
assign lsu_dtmh_err_b = cerer_dttm & tlb_cam_mhit;

////////////////////////////////////////////////////////////////////////
// Perfmon support
// TID always indicates the l2_miss since pmu knows what's in B of the pipe
////////////////////////////////////////////////////////////////////////


// D$ miss
assign lsu_pmu_mem_type_b[0] = ld_inst_vld_b & ~(tlb_cache_hit_b & dcache_enable_b) & ~asi_internal_b &
                                ~ncache_rq_b & ~pipe_flush_b & tlb_cam_hit;

// DTLB miss
assign lsu_pmu_mem_type_b[1] = ~lsu_tlb_miss_b_ & ~pipe_flush_b;

// Generate traps if pmu requests
assign dcmiss_trap_m = pmu_lsu_dcmiss_trap_m;
assign dtmiss_trap_m = pmu_lsu_dtmiss_trap_m;

assign lsu_perfmon_trap_b = (dcmiss_trap_b & lsu_pmu_mem_type_b[0]) |
                            (dtmiss_trap_b & lsu_pmu_mem_type_b[1]) ;

// L2 miss (Don't count atomics)

assign l2miss_no_atomic_e = ((lmc_bld_annul | lmc_bld_last_e) ? lmc_bld_miss_e : cid_l2miss) & ~cid_atomic;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_l2miss  (
	.scan_in(dff_l2miss_scanin),
	.scan_out(dff_l2miss_scanout),
	.din	(l2miss_no_atomic_e),
	.dout	(l2miss_no_atomic_m),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// The l2dmiss isn't really aligned to the M cycle.
assign l2lmiss_trap_e =((cid_tid[2:0] == 3'b000) & pmu_lsu_l2dmiss_trap_m[0]) |
                       ((cid_tid[2:0] == 3'b001) & pmu_lsu_l2dmiss_trap_m[1]) |
                       ((cid_tid[2:0] == 3'b010) & pmu_lsu_l2dmiss_trap_m[2]) |
                       ((cid_tid[2:0] == 3'b011) & pmu_lsu_l2dmiss_trap_m[3]) |
                       ((cid_tid[2:0] == 3'b100) & pmu_lsu_l2dmiss_trap_m[4]) |
                       ((cid_tid[2:0] == 3'b101) & pmu_lsu_l2dmiss_trap_m[5]) |
                       ((cid_tid[2:0] == 3'b110) & pmu_lsu_l2dmiss_trap_m[6]) |
                       ((cid_tid[2:0] == 3'b111) & pmu_lsu_l2dmiss_trap_m[7]) ;

lsu_dcc_ctl_msff_ctl_macro__width_4 dff_pmu_trap  (
	.scan_in(dff_pmu_trap_scanin),
	.scan_out(dff_pmu_trap_scanout),
	.din	({dcmiss_trap_m,dtmiss_trap_m,l2lmiss_trap_e,load_complete_e}),
	.dout	({dcmiss_trap_b,dtmiss_trap_b,l2lmiss_trap_m,load_complete_m}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign load_complete_e = cic_rtn_cmplt & ~lmc_bld_annul;

assign l2_perfmon_wb_cancel_m = l2fill_vld_m & l2miss_no_atomic_m & l2lmiss_trap_m;

// These really assert in M.  (The tid can be shared with TLU this way.)
assign lsu_pmu_mem_type_b[2] = l2miss_no_atomic_m & load_complete_m;

assign lsu_perfmon_trap_g = l2lmiss_trap_m & l2miss_no_atomic_m & load_complete_m;

////////////////////////////////////////////////////////////////////////
// Power management controls
////////////////////////////////////////////////////////////////////////

assign lsu_lsu_pmen_ = ~lsu_lsu_pmen;

assign dcc_sbd_e_clken = dec_st_inst_e | casa_inst_m | dcc_std_inst_m | lsu_lsu_pmen_; 
assign dcc_sbd_m_clken = sbd_m_clken | sbc_bst_in_prog_m | lsu_lsu_pmen_;

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_pwr_mgmt  (
	.scan_in(dff_pwr_mgmt_scanin),
	.scan_out(dff_pwr_mgmt_scanout),
	.din	(dcc_sbd_e_clken),
	.dout	(sbd_m_clken),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_ldst_m_clken = ld_inst_vld_m | st_inst_vld_m | lsu_lsu_pmen_;

assign dcc_pm_clken = lsu_lsu_pmen_    | mbi_run_local | 
                      ld_inst_unqual_e | dec_st_inst_e | dec_flush_inst_e | dec_memstbar_inst_e |
                      ld_inst_vld_m    | st_inst_vld_m | sync_inst_m |
                      ld_inst_vld_b    | st_inst_vld_b | sync_inst_b |
                      ld_inst_vld_w    | st_inst_vld_w | sync_inst_w ;

assign ifu_indx_clken = lsu_lsu_pmen_ | ifu_lsu_if_vld;

////////////////////////////////////////////////////////////////////////
// BIST / DIAGNOSTICS
////////////////////////////////////////////////////////////////////////

lsu_dcc_ctl_msff_ctl_macro__width_1 dff_bist_run  (
	.scan_in(dff_bist_run_scanin),
	.scan_out(dff_bist_run_scanout),
	.din	(mbi_run),
	.dout	(mbi_run_local),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

lsu_dcc_ctl_msff_ctl_macro__width_8 dff_bist_in  (
	.scan_in(dff_bist_in_scanin),
	.scan_out(dff_bist_in_scanout),
	.l1clk	(l1clk_pm1),
	.din	({mbi_dca_read_en,bist_dca_rd_1,  mbi_lru_read_en,bist_lru_rd_1,
		  mbi_dtb_cam_en_pre, tlb_cam_en_pre, mbi_scm_cam_en_pre,mbi_dtb_read_en}),
	.dout	({bist_dca_rd_1,  bist_dca_cmp_en,bist_lru_rd_1,  bist_lru_cmp_en,
		  tlb_cam_en_pre,     bist_cam_en, mbi_scm_cam_en,    bist_dtb_read_en}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dcc_mbi_run = mbi_run_local;

assign dca_parity_compare = (dca_rparity_b[7:0] == bist_cmp_data[7:0]);
assign dca_fail = bist_dca_cmp_en & (~dcd_dca_data_compare[1] | ~dcd_dca_data_compare[0] | ~dca_parity_compare);

assign lru_fail = bist_lru_cmp_en & (lru_state_in_b[5:0] != bist_cmp_data[5:0]);

lsu_dcc_ctl_msff_ctl_macro__width_2 dff_bist_fail  (
	.scan_in(dff_bist_fail_scanin),
	.scan_out(dff_bist_fail_scanout),
	.l1clk	(l1clk_pm1),
	.din	({dca_fail,        lru_fail}),
	.dout	({lsu_mbi_dca_fail,lsu_mbi_lru_fail}),
  .siclk(siclk),
  .soclk(soclk)
);

// DMO reads parity.  Need to mux between hi/lo here.
assign dcc_dmo_parity[3:0] = dmo_dcmuxctl ? dca_rparity_b[7:4] : dca_rparity_b[3:0];

lsu_dcc_ctl_spare_ctl_macro__num_9 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign dff_cerer_scanin          = scan_in                  ;
assign dff_flush_b_scanin        = dff_cerer_scanout        ;
assign dff_flush_w_scanin        = dff_flush_b_scanout      ;
assign dff_asi_d_scanin          = dff_flush_w_scanout      ;
assign dff_dec_inst1_m_scanin    = dff_asi_d_scanout        ;
assign dff_sync_inst_scanin      = dff_dec_inst1_m_scanout  ;
assign dff_dec_ctl_m_scanin      = dff_sync_inst_scanout    ;
assign dff_dec_inst_b_scanin     = dff_dec_ctl_m_scanout    ;
assign dff_dec_ctl_b_scanin      = dff_dec_inst_b_scanout   ;
assign dff_tid_e_scanin          = dff_dec_ctl_b_scanout    ;
assign dff_tid_m_scanin          = dff_tid_e_scanout        ;
assign dff_tid_b_scanin          = dff_tid_m_scanout        ;
assign dff_tid_w_scanin          = dff_tid_b_scanout        ;
assign dff_altspace_m_scanin     = dff_tid_w_scanout        ;
assign dff_altspace_b_scanin     = dff_altspace_m_scanout   ;
assign dff_fpld_b_scanin         = dff_altspace_b_scanout   ;
assign dff_oddrd_scanin          = dff_fpld_b_scanout       ;
assign dff_rs2_m_scanin          = dff_oddrd_scanout        ;
assign dff_sba_par_scanin        = dff_rs2_m_scanout        ;
assign dff_early_ld_scanin       = dff_sba_par_scanout      ;
assign dff_sync_pipe_scanin      = dff_early_ld_scanout     ;
assign dff_sync_st_scanin        = dff_sync_pipe_scanout    ;
assign dc_enable_scanin          = dff_sync_st_scanout      ;
assign dff_l2fill_m_scanin       = dc_enable_scanout        ;
assign dff_l2fill_b_scanin       = dff_l2fill_m_scanout     ;
assign dff_ld_tid_b_scanin       = dff_l2fill_b_scanout     ;
assign dff_fp32_b_scanin         = dff_ld_tid_b_scanout     ;
assign dff_ld_vld_w_scanin       = dff_fp32_b_scanout       ;
assign dff_le_bits_scanin        = dff_ld_vld_w_scanout     ;
assign dff_tl_gt_0_scanin        = dff_le_bits_scanout      ;
assign dff_tlc_scanin            = dff_tl_gt_0_scanout      ;
assign dff_ct_scanin             = dff_tlc_scanout          ;
assign dff_asi_m_scanin          = dff_ct_scanout           ;
assign dff_asi_b_scanin          = dff_asi_m_scanout        ;
assign dff_int_asi_m_scanin      = dff_asi_b_scanout        ;
assign dff_int_asi_b_scanin      = dff_int_asi_m_scanout    ;
assign dff_int_asi_w_scanin      = dff_int_asi_b_scanout    ;
assign dff_wr_state_w_scanin     = dff_int_asi_w_scanout    ;
assign dff_tlu_asi_scanin        = dff_wr_state_w_scanout   ;
assign dff_stb_w3_scanin         = dff_tlu_asi_scanout      ;
assign dff_diag_reg_scanin       = dff_stb_w3_scanout       ;
assign dff_lru_data_b_scanin     = dff_diag_reg_scanout     ;
assign dff_new_lru_w_scanin      = dff_lru_data_b_scanout   ;
assign dff_new_lru_w2_scanin     = dff_new_lru_w_scanout    ;
assign dff_update_lru_scanin     = dff_new_lru_w2_scanout   ;
assign dff_sync_inst_w_scanin    = dff_update_lru_scanout   ;
assign dff_st_type_w_scanin      = dff_sync_inst_w_scanout  ;
assign dff_priv_state_e_scanin   = dff_st_type_w_scanout    ;
assign dff_priv_state_m_scanin   = dff_priv_state_e_scanout ;
assign dff_priv_state_b_scanin   = dff_priv_state_m_scanout ;
assign dff_usr_pg_access_b_scanin = dff_priv_state_b_scanout ;
assign dff_excp_b_scanin         = dff_usr_pg_access_b_scanout;
assign dff_wpt_scanin            = dff_excp_b_scanout       ;
assign dff_asi_g_scanin          = dff_wpt_scanout          ;
assign dff_except_scanin         = dff_asi_g_scanout        ;
assign dff_fgu_excp_w_scanin     = dff_except_scanout       ;
assign dff_if_indx_0_scanin      = dff_fgu_excp_w_scanout   ;
assign dff_if_indx_1_scanin      = dff_if_indx_0_scanout    ;
assign dff_if_indx_2_scanin      = dff_if_indx_1_scanout    ;
assign dff_if_indx_3_scanin      = dff_if_indx_2_scanout    ;
assign dff_if_indx_4_scanin      = dff_if_indx_3_scanout    ;
assign dff_if_indx_5_scanin      = dff_if_indx_4_scanout    ;
assign dff_if_indx_6_scanin      = dff_if_indx_5_scanout    ;
assign dff_if_indx_7_scanin      = dff_if_indx_6_scanout    ;
assign dff_way_vld_b_scanin      = dff_if_indx_7_scanout    ;
assign dff_l2miss_scanin         = dff_way_vld_b_scanout    ;
assign dff_pmu_trap_scanin       = dff_l2miss_scanout       ;
assign dff_pwr_mgmt_scanin       = dff_pmu_trap_scanout     ;
assign dff_bist_run_scanin       = dff_pwr_mgmt_scanout     ;
assign dff_bist_in_scanin        = dff_bist_run_scanout     ;
assign dff_bist_fail_scanin      = dff_bist_in_scanout      ;
assign spares_scanin             = dff_bist_fail_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module lsu_dcc_ctl_l1clkhdr_ctl_macro (
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

module lsu_dcc_ctl_msff_ctl_macro__width_7 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_3 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_1 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_12 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_13 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = din[12:0];






dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_dcc_ctl_msff_ctl_macro__width_8 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_9 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_5 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_4 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_2 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_10 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_24 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_6 (
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

module lsu_dcc_ctl_msff_ctl_macro__width_20 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0];






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_dcc_ctl_spare_ctl_macro__num_9 (
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
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;


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

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));
assign scan_out = so_8;



endmodule

