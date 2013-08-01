// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dec_del_ctl.v
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
module dec_del_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  lsu_dec_pmen, 
  lsu_exu_pmen, 
  spc_core_running_status, 
  power_throttle, 
  lb_lbist_running, 
  pku_idest_p, 
  pku_fdest_p, 
  pku_fsrc_rd_p, 
  pku_lsu_p, 
  pku_fgu_p, 
  pku_pdist_p, 
  pku_twocycle_p, 
  pku_inst_cnt_brtaken00, 
  pku_inst_cnt_brtaken01, 
  pku_inst_cnt_brtaken02, 
  pku_inst_cnt_brtaken03, 
  pku_inst_cnt_brtaken04, 
  pku_inst_cnt_brtaken05, 
  pku_inst_cnt_brtaken06, 
  pku_inst_cnt_brtaken07, 
  pku_inst_cnt_brtaken10, 
  pku_inst_cnt_brtaken11, 
  pku_inst_cnt_brtaken12, 
  pku_inst_cnt_brtaken13, 
  pku_inst_cnt_brtaken14, 
  pku_inst_cnt_brtaken15, 
  pku_inst_cnt_brtaken16, 
  pku_inst_cnt_brtaken17, 
  exu_test_tid0, 
  exu_test_addr0, 
  exu_test_valid0, 
  exu_test_tid1, 
  exu_test_addr1, 
  exu_test_valid1, 
  ded_exc0_d, 
  ded_exc1_d, 
  tlu_dec_pstate_pef, 
  fgu_fprs_fef, 
  tlu_dec_hpstate_hpriv, 
  tlu_dec_pstate_priv, 
  dcd_wrtick_d, 
  lsu_cpq_stall, 
  dcd_callclass_d, 
  dcd_tcc_d, 
  dcd_specbr_d, 
  dcd_specfp_d, 
  dcd_exu_src_d, 
  dcd_killfgu_d, 
  dcd_sir_d, 
  dcd_stdfa_d, 
  pku_valid_e, 
  pku_annul_ds_dcti_brtaken0_e, 
  pku_annul_ds_dcti_brtaken1_e, 
  exu0_window_block, 
  exu1_window_block, 
  tlu_window_block, 
  fgu_idiv_stall, 
  fgu_fdiv_stall, 
  fgu_ecc_asi_stall, 
  dcd_fpdisable_d, 
  dcd_lsize0_d, 
  dcd_lsize1_d, 
  dcd_lsu_sign_ext_d, 
  dcd_load_d, 
  dcd_store_d, 
  dcd_sethi_d, 
  dcd_lsdouble_d, 
  dcd_prefetch_d, 
  dcd_flush_d, 
  dcd_memstbar_d, 
  dcd_pr_d, 
  dcd_priv_d, 
  dcd_hpr_d, 
  dcd_sr_d, 
  dcd_casa_d, 
  dcd_ldstub_d, 
  dcd_alt_d, 
  dcd_alti_d, 
  dcd_swap_d, 
  dcd_fsrc_rs1_d, 
  dcd_fsrc_rs2_d, 
  dcd_fpdest_single_d, 
  dcd_fp_rs1_single_d, 
  dcd_fp_rs2_single_d, 
  dcd_fsrsync_d, 
  dcd_done_d, 
  dcd_retry_d, 
  dec_inst0_rs1_d, 
  dec_inst0_rs2_d, 
  dec_inst0_raw_rd_d, 
  dec_inst1_rs1_d, 
  dec_inst1_rs2_d, 
  dec_inst1_raw_rd_d, 
  dcd_save_restore_d, 
  ded_oddwin0_d, 
  ded_oddwin1_d, 
  ded_perr_p, 
  ded_ferr_p, 
  ded_legal_p, 
  dec_inst0_b31, 
  dec_inst1_b31, 
  dec_inst0_op3_d, 
  dec_inst1_op3_d, 
  dec_inst0_opf_d, 
  dec_inst1_opf_d, 
  pku_base_pick_p, 
  pku_raw_pick0_p, 
  pku_raw_pick1_p, 
  pku_ds_e, 
  pku_load_flush_w, 
  tlu_flush_ifu, 
  pku_flush_f1, 
  pku_flush_f2, 
  pku_flush_lm, 
  pku_flush_lb, 
  pku_flush_m, 
  pku_flush_b, 
  dec_br_taken_e1, 
  spu_mult_request, 
  lsu_block_store_stall, 
  lsu_block_store_rd, 
  lsu_block_store_tid, 
  tlu_dtlb_reload_stall, 
  tlu_pstate_am, 
  dec_valid0_d, 
  dec_valid1_d, 
  dec_decode0_d, 
  dec_decode1_d, 
  del_noshift0_d, 
  del_noshift1_d, 
  dec_inst0_rd_d, 
  dec_inst1_rd_d, 
  dec_tid0_d, 
  dec_tid1_d, 
  dec_tid0_p, 
  dec_tid1_p, 
  dec_valid_e, 
  dec_pmu_valid_e, 
  dec_fgu_valid_e, 
  dec_frf_r1_addr_d, 
  dec_frf_r2_addr_d, 
  dec_frf_r2_addr_e, 
  dec_frf_r1_vld_d, 
  dec_frf_r2_vld_d, 
  dec_frf_r1_32b_d, 
  dec_frf_r2_32b_d, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  dec_frf_w_addr_d, 
  dec_frf_w_vld_d, 
  dec_frf_w_32b_d, 
  dec_frf_w_odd32b_d, 
  dec_spu_grant_d, 
  dec_spu_grant_fgu_d, 
  dec_exu_src_vld_d, 
  dec_irf_w_addr_d, 
  dec_frf_store_d, 
  dec_fsr_store_d, 
  dec_fgu_op3_d, 
  dec_fgu_opf_d, 
  dec_fgu_decode_d, 
  dec_fgu_tid_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_flush_m, 
  dec_flush_b, 
  dec_block_store_b, 
  dec_exc0_m, 
  dec_exc1_m, 
  dec_inst0_cnt, 
  dec_inst1_cnt, 
  dec_tid0_m, 
  dec_tid1_m, 
  dec_inst_valid_m, 
  dec_lsu_inst_m, 
  dec_fgu_inst_m, 
  dec_cti_inst_m, 
  dec_illegal_inst_m, 
  dec_icache_perr_m, 
  dec_priv_exc_m, 
  dec_hpriv_exc_m, 
  dec_fpdisable_exc_m, 
  dec_br_taken_m, 
  dec_done_inst_m, 
  dec_retry_inst_m, 
  dec_sir_inst_m, 
  dec_ds_m, 
  dec_annul_ds_m, 
  dec_fgu_sel_e, 
  dec_fgu_sel_m, 
  dec_lsu_sel0_e, 
  dec_lsu_sel1_e, 
  dec_rs1_addr0_e, 
  dec_rs1_addr1_e, 
  dec_lsu_sel0_upper_e, 
  dec_lsu_sel1_upper_e, 
  dec_lsu_sel0_lower_e, 
  dec_lsu_sel1_lower_e, 
  dec_rs1_addr0_upper_e, 
  dec_rs1_addr1_upper_e, 
  del_pick_d, 
  dec_ld_inst_e, 
  dec_st_inst_e, 
  dec_fsr_ldst_e, 
  dec_fpldst_inst_e, 
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
  dec_sraddr_e, 
  dec_imm_asi_vld_d, 
  dec_imm_asi_d, 
  dec_ldst_sz_e, 
  dec_ld_inst_d, 
  dec_lsu_tid0_d, 
  dec_lsu_tid1_d, 
  dec_lsu_tg_d, 
  dec_lsu_rd_e, 
  del_test0_sel_p, 
  del_twocycle0_std_p, 
  del_twocycle0_rs2_p, 
  del_default0_sel_p, 
  del_test1_sel_p, 
  del_twocycle1_std_p, 
  del_twocycle1_rs2_p, 
  del_default1_sel_p, 
  del_test_addr0_p, 
  del_test_addr1_p, 
  dec_instr0_type_d, 
  dec_instr1_type_d, 
  dec_exu_clken, 
  del_tg_clken, 
  scan_out, 
  dec_true_valid_e, 
  dec_load_flush_w, 
  dec_lsu_sel0_d, 
  dec_raw_pick_p, 
  dec_ierr_d, 
  dec_block_store_stall);
wire l1clk;
wire spares_scanin;
wire spares_scanout;
wire [1:0] pmu_valid_d;
wire [3:0] spare_5_0_lat_unused;
wire [1:0] pmu_valid_e;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire callinst0_d;
wire callinst1_d;
wire [6:0] pdecode0_in;
wire [6:0] pdecode1_in;
wire [6:0] pdecode2_in;
wire [6:0] pdecode3_in;
wire [6:0] pdec0_in;
wire [6:0] pdecode0_d;
wire pdecode0f_scanin;
wire pdecode0f_scanout;
wire idest0_d;
wire fdest0_d;
wire fsrc0_rd_d;
wire lsu0_d;
wire fgu0_d;
wire pdist0_d;
wire twocycle0_d;
wire [6:0] pdecode4_in;
wire [6:0] pdecode5_in;
wire [6:0] pdecode6_in;
wire [6:0] pdecode7_in;
wire [6:0] pdec1_in;
wire [6:0] pdecode1_d;
wire pdecode1f_scanin;
wire pdecode1f_scanout;
wire idest1_d;
wire fdest1_d;
wire fsrc1_rd_d;
wire lsu1_d;
wire fgu1_d;
wire pdist1_d;
wire twocycle1_d;
wire [7:0] final_pick_p;
wire shift0_d;
wire [3:0] raw_pick0_in;
wire [3:0] pick0_d;
wire [3:0] pick0_in;
wire pick0f_scanin;
wire pick0f_scanout;
wire shift1_d;
wire [3:0] raw_pick1_in;
wire [3:0] pick1_d;
wire [3:0] pick1_in;
wire pick1f_scanin;
wire pick1f_scanout;
wire privstatef_scanin;
wire privstatef_scanout;
wire [7:0] tlu_priv;
wire [7:0] tlu_hpriv;
wire fef_scanin;
wire fef_scanout;
wire [7:0] tlu_pef;
wire [7:0] fgu_fef;
wire [1:0] priv_d;
wire [1:0] hpriv_d;
wire [1:0] fpdis_d;
wire [1:0] inst0_cnt_brtaken0;
wire [1:0] inst0_cnt_brtaken1;
wire [1:0] inst1_cnt_brtaken0;
wire [1:0] inst1_cnt_brtaken1;
wire [1:0] br_taken_e;
wire [1:0] ifetch_err_e;
wire [1:0] inst0_cnt;
wire [1:0] inst1_cnt;
wire instcntf_scanin;
wire instcntf_scanout;
wire exutestf_scanin;
wire exutestf_scanout;
wire [1:0] ttid0_p;
wire [1:0] ttid1_p;
wire test_stall0_in;
wire test_stall1_in;
wire teststallf_scanin;
wire teststallf_scanout;
wire test_stall0;
wire test_stall1;
wire [1:0] twocycle_p;
wire twocycle0_sel_p;
wire twocycle1_sel_p;
wire [1:0] tid0_p;
wire [1:0] tid1_p;
wire [1:0] tid0_d;
wire [1:0] tid1_d;
wire [7:0] valid_d_in;
wire [7:0] valid_d;
wire val_df_scanin;
wire val_df_scanout;
wire valid0_d_in;
wire valid1_d_in;
wire valid_df_scanin;
wire valid_df_scanout;
wire valid0_d;
wire valid1_d;
wire dtlb_reloadf_scanin;
wire dtlb_reloadf_scanout;
wire [1:0] dtlb_reload;
wire dtlb_reload_stall;
wire block_store0f_scanin;
wire block_store0f_scanout;
wire pre_block_store_stall;
wire block_store_stall_in;
wire block_store_stall;
wire reset_block_store_stall;
wire block_storef_scanin;
wire block_storef_scanout;
wire [4:0] block_store_rd_in;
wire [4:0] block_store_rd;
wire block_store_rdhif_scanin;
wire block_store_rdhif_scanout;
wire block_store_rdlof_scanin;
wire block_store_rdlof_scanout;
wire [2:0] block_store_tid_in;
wire [2:0] block_store_tid;
wire block_store_tidf_scanin;
wire block_store_tidf_scanout;
wire block_store_stall0;
wire block_store_stall1;
wire cpq_stall_in;
wire cpq_stallf_scanin;
wire cpq_stallf_scanout;
wire cpq_stall;
wire fecc_stall_in;
wire fecc_stallf_scanin;
wire fecc_stallf_scanout;
wire fecc_stall;
wire block_resetf_scanin;
wire block_resetf_scanout;
wire [2:0] block_rst_cnt_in;
wire [2:0] block_rst_cnt;
wire block_store_e_scanin;
wire block_store_e_scanout;
wire block_store_stall_e;
wire [2:0] block_store_tid_e;
wire block_store_m_scanin;
wire block_store_m_scanout;
wire block_store_stall_m;
wire [2:0] block_store_tid_m;
wire block_store_b_scanin;
wire block_store_b_scanout;
wire block_store_stall_b;
wire [2:0] block_store_tid_b;
wire set_lfavor;
wire lsusel0_d;
wire reset_lfavor;
wire lfavor_in;
wire lfavor;
wire lfavorf_scanin;
wire lfavorf_scanout;
wire set_ffavor;
wire fgusel0_d;
wire reset_ffavor;
wire ffavor_in;
wire ffavor;
wire ffavorf_scanin;
wire ffavorf_scanout;
wire set_sffavor;
wire lsu_float_case;
wire reset_sffavor;
wire sffavor_in;
wire sffavor;
wire sffavorf_scanin;
wire sffavorf_scanout;
wire mult_request_in;
wire mult_request;
wire mulrequestf_scanin;
wire mulrequestf_scanout;
wire crypto_mult_case0;
wire crypto_mult_case1;
wire set_cmfavor;
wire reset_cmfavor;
wire cmfavor;
wire cmfavor_grant_d;
wire idiv_hole_d;
wire [1:0] idiv_stall_d;
wire pdistblock_d;
wire cmfavor_in;
wire cmfavorf_scanin;
wire cmfavorf_scanout;
wire [1:0] pdistblock_in;
wire pdistblockf_scanin;
wire pdistblockf_scanout;
wire [1:0] pdistblock;
wire pdistrdf_scanin;
wire pdistrdf_scanout;
wire [4:0] pdist_rd;
wire pdisttidf_scanin;
wire pdisttidf_scanout;
wire [2:0] pdist_tid;
wire twocycle0_d_in;
wire twocycle0_df_scanin;
wire twocycle0_df_scanout;
wire twocycle0_stall;
wire twocycle1_d_in;
wire twocycle1_df_scanin;
wire twocycle1_df_scanout;
wire twocycle1_stall;
wire int_hole0_in;
wire inthole0_df_scanin;
wire inthole0_df_scanout;
wire [2:0] int_hole0_stall;
wire int_hole1_in;
wire inthole1_df_scanin;
wire inthole1_df_scanout;
wire [2:0] int_hole1_stall;
wire divstall_df_scanin;
wire divstall_df_scanout;
wire fdiv_stall_d;
wire [1:0] window_stall_in;
wire windowstall_df_scanin;
wire windowstall_df_scanout;
wire [1:0] window_stall_d;
wire [1:0] exu_clken_in;
wire exu_clkenf_scanin;
wire exu_clkenf_scanout;
wire block0;
wire [7:0] power_stall;
wire block1;
wire legal_f_scanin;
wire legal_f_scanout;
wire [1:0] legal_d;
wire illegal0_d;
wire [1:0] ifetch_err_d;
wire illegal1_d;
wire [1:0] perr_d;
wire [1:0] illegal_d;
wire illegal_f_scanin;
wire illegal_f_scanout;
wire [1:0] illegal_e;
wire [1:0] fpdisable_exc_d;
wire fpdisable_exc_f_scanin;
wire fpdisable_exc_f_scanout;
wire [1:0] fpdisable_exc_e;
wire [1:0] priv_exc_d;
wire [1:0] hpriv_exc_d;
wire parity_err_f_scanin;
wire parity_err_f_scanout;
wire [1:0] icdp_perr_d;
wire exc_f_scanin;
wire exc_f_scanout;
wire [1:0] priv_exc_e;
wire [1:0] hpriv_exc_e;
wire [1:0] icdp_perr_e;
wire ffavor_real;
wire lfavor_real;
wire [1:0] fguselect_d;
wire tgsel_f_scanin;
wire tgsel_f_scanout;
wire twocycle0_stall_e;
wire twocycle1_stall_e;
wire decode_lsu0_e;
wire decode_lsu1_e;
wire [1:0] pstate_am_in;
wire rs1_addr0_d;
wire decode_lsu0_d;
wire casa_or_pst_d;
wire rs1_addr1_d;
wire decode_lsu1_d;
wire lsu_sel0_lower_d;
wire lsu_sel1_lower_d;
wire lsu_sel0_upper_d;
wire lsu_sel1_upper_d;
wire rs1_addr0_upper_d;
wire rs1_addr1_upper_d;
wire exuself_scanin;
wire exuself_scanout;
wire tgselm_f_scanin;
wire tgselm_f_scanout;
wire [1:0] store_float;
wire [4:0] i0_rd;
wire [4:0] i1_rd;
wire [4:0] i0_rd_remap_d;
wire [4:0] i1_rd_remap_d;
wire [4:0] f0_rs1;
wire [4:0] f0_rs2;
wire [4:0] f0_rd;
wire [4:0] f1_rs1;
wire [4:0] f1_rs2;
wire [4:0] f1_rd;
wire [4:0] inst0_rs2;
wire [4:0] inst1_rs2;
wire frf_r2addre_f_scanin;
wire frf_r2addre_f_scanout;
wire inst0_rs2_raw_bit0;
wire inst1_rs2_raw_bit0;
wire fsr_store0;
wire fsr_store1;
wire flush_lexc_m;
wire ifetch_err_f_scanin;
wire ifetch_err_f_scanout;
wire ifetcherr_f_scanin;
wire ifetcherr_f_scanout;
wire [1:0] true_valid_d;
wire truevalid_f_scanin;
wire truevalid_f_scanout;
wire illegal0_pmu_d;
wire illegal1_pmu_d;
wire [1:0] illegal_pmu_d;
wire [1:0] priv_exc_pmu_d;
wire [1:0] hpriv_exc_pmu_d;
wire [1:0] fpdisable_exc_pmu_d;
wire [1:0] valid_e;
wire [1:0] ls_valid_e;
wire decode_fgu0_d;
wire decode_fgu1_d;
wire fgudec_f_scanin;
wire fgudec_f_scanout;
wire decode_fgu0_e;
wire decode_fgu1_e;
wire lsudec_f_scanin;
wire lsudec_f_scanout;
wire st_inst_d;
wire fsr_ldst_d;
wire ldste_f_scanin;
wire ldste_f_scanout;
wire ld_inst_e;
wire st_inst_e;
wire fsr_ldst_e;
wire lsu_valid_e;
wire fpldst_d;
wire load_float0_d;
wire store_float0_d;
wire load_float1_d;
wire store_float1_d;
wire lsdouble_d;
wire prefetch_d;
wire flush_d;
wire memstbar_d;
wire pr_d;
wire hpr_d;
wire sr_d;
wire pst_d;
wire casa_d;
wire ldstub_d;
wire swap_d;
wire altspacei_d;
wire sign_ext_d;
wire [1:0] lsize_d;
wire ldme_f_scanin;
wire ldme_f_scanout;
wire fpldst_e;
wire lsdouble_e;
wire prefetch_e;
wire flush_e;
wire memstbar_e;
wire hpr_e;
wire pr_e;
wire sr_e;
wire casa_e;
wire ldstub_e;
wire swap_e;
wire sign_ext_e;
wire [1:0] lsize_e;
wire [4:0] sraddr_d;
wire sraddr_f_scanin;
wire sraddr_f_scanout;
wire [4:0] sraddr_e;
wire lsu_rd0_msb;
wire lsu_rd1_msb;
wire [4:0] lsu_rd_d;
wire lsurd_f_scanin;
wire lsurd_f_scanout;
wire [4:0] lsu_rd_e;
wire [1:0] ds_m_in;
wire ds_m_scanin;
wire ds_m_scanout;
wire [7:0] annul_ds_dcti_e;
wire [1:0] annul_ds_m_in;
wire annul_m_scanin;
wire annul_m_scanout;
wire tid_e_scanin;
wire tid_e_scanout;
wire [1:0] tid1_e;
wire [1:0] tid0_e;
wire tid_m_scanin;
wire tid_m_scanout;
wire dec_e_scanin;
wire dec_e_scanout;
wire decode1_raw_e;
wire decode0_raw_e;
wire decode1_e;
wire decode0_e;
wire dec_m_scanin;
wire dec_m_scanout;
wire [1:0] inst_valid_m;
wire is_lsu1_d;
wire is_lsu0_d;
wire is_fgu1_d;
wire is_fgu0_d;
wire [1:0] cti_d;
wire inst_e_scanin;
wire inst_e_scanout;
wire [4:0] exc1_e;
wire [4:0] exc0_e;
wire [1:0] is_lsu_e;
wire [1:0] is_fgu_e;
wire [1:0] cti_e;
wire inst_m_scanin;
wire inst_m_scanout;
wire [4:0] exc1_m;
wire [4:0] exc0_m;
wire flush_lexc_e;
wire flush_lexc_f_scanin;
wire flush_lexc_f_scanout;
wire illegal_priv_m_scanin;
wire illegal_priv_m_scanout;
wire [1:0] illegal_inst_m;
wire [1:0] priv_exc_m;
wire [1:0] hpriv_exc_m;
wire [1:0] fpdisable_exc_m;
wire [1:0] br_taken_m;
wire [1:0] icdp_perr_m;
wire [1:0] done_d;
wire [1:0] retry_d;
wire [1:0] sir_d;
wire done_retry_e_scanin;
wire done_retry_e_scanout;
wire [1:0] done_e;
wire [1:0] retry_e;
wire [1:0] sir_e;
wire done_retry_m_scanin;
wire done_retry_m_scanout;
wire [1:0] done_inst_m;
wire [1:0] retry_inst_m;
wire [1:0] sir_inst_m;
wire [1:0] atomic_d;
wire l2miss0_d;
wire l2miss1_d;
wire itlbmiss0_d;
wire itlbmiss1_d;
wire icmiss0_d;
wire icmiss1_d;
wire other0_d;
wire branch0_d;
wire other1_d;
wire branch1_d;
wire power_stall1f_scanin;
wire power_stall1f_scanout;
wire [7:0] power_stall_in;
wire thread_activef_scanin;
wire thread_activef_scanout;
wire [7:0] thread_active;
wire power_throttle1f_scanin;
wire power_throttle1f_scanout;
wire [2:0] power_throt0;
wire [2:0] power_throttle1;
wire power_throttle02_f_scanin;
wire power_throttle02_f_scanout;
wire [2:0] power_throttle0;
wire power_throttle01_f_scanin;
wire power_throttle01_f_scanout;
wire power_throttle00_f_scanin;
wire power_throttle00_f_scanout;
wire change_power_stall;
wire [7:0] new_power_stall;


   input l2clk;
   input scan_in;
   input tcu_pce_ov;		// scan signals
   input spc_aclk;
   input spc_bclk;
   input tcu_scan_en;


   input lsu_dec_pmen;		// power management enable for dec
   input lsu_exu_pmen;		// power management enable for exu
	
   input [7:0] spc_core_running_status;	// active bits for each of the threads


   input [2:0]  power_throttle;	// power throttle, [2:0] is encoded number of stalls in 8 cycle window
				        // 000 - no stalls, 001 - 1 stall, ... 111 - 7 stalls
   input lb_lbist_running;

   input [7:0] pku_idest_p;
   input [7:0] pku_fdest_p;
   input [7:0] pku_fsrc_rd_p;
   input [7:0] pku_lsu_p;
   input [7:0] pku_fgu_p;
   input [7:0] pku_pdist_p;
   input [7:0] pku_twocycle_p;

   input [1:0]  pku_inst_cnt_brtaken00;		// count of inst at e,m,b stages for each thread, for tlu to generate PC at decode
   input [1:0]  pku_inst_cnt_brtaken01;
   input [1:0]  pku_inst_cnt_brtaken02;
   input [1:0]  pku_inst_cnt_brtaken03;
   input [1:0]  pku_inst_cnt_brtaken04;
   input [1:0]  pku_inst_cnt_brtaken05;
   input [1:0]  pku_inst_cnt_brtaken06;
   input [1:0]  pku_inst_cnt_brtaken07;
   input [1:0]  pku_inst_cnt_brtaken10;		// count of inst at e,m,b stages for each thread, for tlu to generate PC at decode
   input [1:0]  pku_inst_cnt_brtaken11;
   input [1:0]  pku_inst_cnt_brtaken12;
   input [1:0]  pku_inst_cnt_brtaken13;
   input [1:0]  pku_inst_cnt_brtaken14;
   input [1:0]  pku_inst_cnt_brtaken15;
   input [1:0]  pku_inst_cnt_brtaken16;
   input [1:0]  pku_inst_cnt_brtaken17;

   input [1:0] exu_test_tid0;		// exu test interface to the irf (bist or ecc errors) 
   input [4:0] exu_test_addr0;
   input exu_test_valid0;

   input [1:0] exu_test_tid1;		// exu test interface to the irf (bist or ecc errors)
   input [4:0] exu_test_addr1;
   input exu_test_valid1;

   input [4:0] ded_exc0_d;		// ifetch related exceptions
   input [4:0] ded_exc1_d;

   input [7:0] tlu_dec_pstate_pef;     	// pstate enable fp bit
   input [7:0] fgu_fprs_fef;	       	// fprs enable fp bit
   input [7:0] tlu_dec_hpstate_hpriv;  	// hpriv bits
   input [7:0] tlu_dec_pstate_priv;    	// priv bits

   input [1:0] dcd_wrtick_d;	      	// write tick

   input lsu_cpq_stall;			// lsu cannot take any more lsu operations, stall decode
   input [1:0] dcd_callclass_d;		// JMPs,CALLs,RETs
   input [1:0] dcd_tcc_d;		// tcc instruction

   input [1:0] dcd_specbr_d;		// branch at decode
   input [1:0] dcd_specfp_d;		// FP at decode

   input [1:0] dcd_exu_src_d;  		// fgu sources will come from the integer unit
   input [1:0] dcd_killfgu_d;  		// dont really send alignaddr, bmask to the fgu

   input [1:0] dcd_sir_d;   		// SIR inst at decode
   input [1:0] dcd_stdfa_d;    		// for partial stores

   input [7:0] pku_valid_e;		// valid for inst at e stage
   input [7:0] pku_annul_ds_dcti_brtaken0_e;	// dcti at e stage has annulled its delay slot (DS)
   input [7:0] pku_annul_ds_dcti_brtaken1_e;	// dcti at e stage has annulled its delay slot (DS)

   input exu0_window_block;      	// for saves,restores,traps on saves,restores,wrpr to cwp
   input exu1_window_block;      
   input [1:0] tlu_window_block;      	// for dones and retries
   
   input [1:0] fgu_idiv_stall;    	// integer divide stall; no int ops to FGU
   input fgu_fdiv_stall;    		// float divide stall; no float loads to the LSU

   input fgu_ecc_asi_stall;		// fgu ecc stall

   input [1:0] dcd_fpdisable_d; 	// inst can cause a fpdisable exception


   // decodes needed by the lsu
   input [1:0] dcd_lsize0_d;		// size of the lsu operation (byte,half,word,dword)
   input [1:0] dcd_lsize1_d;
   input [1:0] dcd_lsu_sign_ext_d;	// lsu operation is a sign extended form
   input [1:0] dcd_load_d;		// op is load or load-like
   input [1:0] dcd_store_d;		// op is store or store-like
   input [1:0] dcd_sethi_d;		// op is special sethi 
   input [1:0] dcd_lsdouble_d;		// ldd inst
   input [1:0] dcd_prefetch_d;		// prefetch inst
   input [1:0] dcd_flush_d;		// flush inst
   input [1:0] dcd_memstbar_d;		// membar, stbar
   input [1:0] dcd_pr_d;		// is a WRPR or RDPR inst
   input [1:0] dcd_priv_d;		// is a privileged inst
   input [1:0] dcd_hpr_d;		// is a hypervisor priv inst
   input [1:0] dcd_sr_d;		// ASR operation
   input [1:0] dcd_casa_d;		// CASA inst
   input [1:0] dcd_ldstub_d;		// LDSTUB inst
   input [1:0] dcd_alt_d;		// alternate but not imm
   input [1:0] dcd_alti_d;		// imm alternate
   input [1:0] dcd_swap_d;		// SWAP inst
	
   input [1:0] dcd_fsrc_rs1_d;		// inst has rs1 FP source
   input [1:0] dcd_fsrc_rs2_d;		// inst has rs2 FP source
   input [1:0] dcd_fpdest_single_d;	// FP dest is single precision (SP)
   input [1:0] dcd_fp_rs1_single_d;	// FP rs1 source is SP
   input [1:0] dcd_fp_rs2_single_d;	// FP rs2 source is SP
   input [1:0] dcd_fsrsync_d;		// inst is LDFSR or STFSR
   input [1:0] dcd_done_d;		// inst is DONE inst
   input [1:0] dcd_retry_d;		// inst is a RETRY inst

   input [4:0] dec_inst0_rs1_d;		// RS1
   input [4:0] dec_inst0_rs2_d;		// RS2
   input [4:0] dec_inst0_raw_rd_d;	// RD
   input [4:0] dec_inst1_rs1_d;
   input [4:0] dec_inst1_rs2_d;
   input [4:0] dec_inst1_raw_rd_d;

   input [1:0] dcd_save_restore_d;	// SAVE or RESTORE
   input ded_oddwin0_d;			// window is odd or not
   input ded_oddwin1_d;

   input [1:0] ded_perr_p;		// inst parity error
   input [1:0] ded_ferr_p;		// inst fetch error
   input [1:0] ded_legal_p;		// inst is a legal instruction

   input dec_inst0_b31;			// bit 31 of instruction
   input dec_inst1_b31;

   input [5:0] dec_inst0_op3_d;		// op3 field of inst
   input [5:0] dec_inst1_op3_d;

   input [7:0] dec_inst0_opf_d;		// opf field of inst
   input [7:0] dec_inst1_opf_d;

   input [7:0] pku_base_pick_p;		// base pick without decode qualifications (includes cancel_pick, flush_buffer)
   input [3:0] pku_raw_pick0_p;		// pick with no qualifications (no cancel_pick, no flush_buffer)
   input [7:4] pku_raw_pick1_p;

   input [7:0] pku_ds_e;		// inst at e is a DS

   input [7:0] pku_load_flush_w;  	// load flush signals to IFU
   input [7:0] tlu_flush_ifu;		// trap flush
 
   input [7:0] pku_flush_f1;		// flush signals for FGU f1,f2 stages
   input [7:0] pku_flush_f2;

   input [7:0] pku_flush_lm;		// flush signals for LSU M,B stages
   input [7:0] pku_flush_lb;

   input [7:0] pku_flush_m;		// flush signals for TLU M,B stages
   input [7:0] pku_flush_b;

   input [1:0] dec_br_taken_e1;		// taken branches

   input       spu_mult_request;	// crypto multiply request

   input       lsu_block_store_stall;   // stall decode to read the sources of the store
   input [4:3] lsu_block_store_rd;	// RD for the block store
   input [2:0] lsu_block_store_tid;	// tid for the block store

   input       tlu_dtlb_reload_stall;	// stall decode for 2 cycles on a DTLB miss; LSU can't take any more lsu ops
   input [7:0] tlu_pstate_am;		// address mask bit

   output      dec_valid0_d;		// inst is valid at d stage
   output      dec_valid1_d;		
   output      dec_decode0_d;		// inst is decoded at d stage (implies a shift)
   output      dec_decode1_d;
   output      del_noshift0_d;		// inst is valid and not decoded (don't shift the decode stage)
   output      del_noshift1_d;

   // exu interface
   output [4:0] dec_inst0_rd_d;		// RD field (takes windows and calls into account)
   output [4:0] dec_inst1_rd_d;

   output [1:0] dec_tid0_d;		// TID for exu0
   output [1:0] dec_tid1_d;		// TID for exu1
   output [1:0] dec_tid0_p;		// TID for IRF
   output [1:0] dec_tid1_p;
   output [1:0] dec_valid_e;		// thread group [0,1] is valid at e stage
   output [1:0] dec_pmu_valid_e;	// thread group [0,1] is valid at e stage; dont include ifetch_err
   output 	dec_fgu_valid_e;        // fgu is valid at e

   // fgu interface
   output [4:0] dec_frf_r1_addr_d;	// FRF r1 read addr
   output [4:0] dec_frf_r2_addr_d;	// FRF r2 read addr (including store-floats)
   output [4:3] dec_frf_r2_addr_e;	// FRF r2 read addr (for LSU)
   output 	dec_frf_r1_vld_d;	// FRF r1 read valid
   output 	dec_frf_r2_vld_d;	// FRF r2 read valid
   output 	dec_frf_r1_32b_d;	// FRF rs1 source is single-precision
   output 	dec_frf_r2_32b_d;	// FRF rs2 source is single-precision
   output 	dec_frf_r1_odd32b_d;	// FRF rs1 source is single-precision and odd
   output 	dec_frf_r2_odd32b_d;	// FRF rs2 source is single-precision and odd
   output [4:0] dec_frf_w_addr_d;	// FRF write addr
   output 	dec_frf_w_vld_d;	// FRF write addr is valid
   output 	dec_frf_w_32b_d;	// FRF write is single precision
   output 	dec_frf_w_odd32b_d;	// FRF write is single precision; rd is odd
   output 	dec_spu_grant_d;	// SPU grant for a crypto multiply
   output 	dec_spu_grant_fgu_d;	// SPU grant for a crypto multiply to the fgu
   output 	dec_exu_src_vld_d;	// FGU op has any valid source
   output [4:0] dec_irf_w_addr_d;  	// RD for an integer op executed by the FGU
   output 	dec_frf_store_d;	// store-float of FRF data
   output 	dec_fsr_store_d;	// store-float of FSR data
   output [5:0] dec_fgu_op3_d;		// op3 field
   output [7:0] dec_fgu_opf_d;		// opf field
   output 	dec_fgu_decode_d;	// FGU op decoded this cycle
   output [2:0] dec_fgu_tid_d;		// TID for FGU op
   output 	dec_flush_f1;		// Flush f1 stage of the FGU
   output 	dec_flush_f2;		// Flush f2 stage of the FGU
   output 	dec_flush_lm;		// Flush the m stage of a load
   output 	dec_flush_lb;		// Flush the bypass stage of a load
   output [1:0] dec_flush_m;            // Flush the m stage of the ex units
   output [1:0] dec_flush_b;            // Flush the b stage of the ex units, also tlu

   output [7:0] dec_block_store_b;	// block store at b stage to tlu

   // tlu interface
   output [4:0] dec_exc0_m;             // encoded exception status to tlu
   output [4:0] dec_exc1_m;
   output [1:0] dec_inst0_cnt;		// inst cnt of e,m,b stage
   output [1:0] dec_inst1_cnt;
   output [1:0] dec_tid0_m;		// thread id
   output [1:0] dec_tid1_m;
   output [1:0] dec_inst_valid_m;	// inst is valid at m stage
   output [1:0] dec_lsu_inst_m;		// lsu inst at m stage
   output [1:0] dec_fgu_inst_m;		// fgu inst at m stage
   output [1:0] dec_cti_inst_m;		// fgu inst at m stage

   output [1:0] dec_illegal_inst_m;	// illegal at m stage
   output [1:0] dec_icache_perr_m;	// icache parity error at m stage
   output [1:0] dec_priv_exc_m;		// priv exception at m stage
   output [1:0] dec_hpriv_exc_m;	// hypervison priv exception at m stage
   output [1:0] dec_fpdisable_exc_m;	// fp disable exception at m stage
   output [1:0] dec_br_taken_m;		// br taken at m stage
   output [1:0] dec_done_inst_m;	// done inst at m stage
   output [1:0] dec_retry_inst_m;	// retry inst at m stage
   output [1:0] dec_sir_inst_m;		// sir inst a m stage

   output [1:0]	dec_ds_m;	        // this instruction is a DS
   output [1:0] dec_annul_ds_m;		// DS at m stage is annulled

   output [1:0]	dec_fgu_sel_e;		// mux select between TG's for fgu ops
   output [1:0]	dec_fgu_sel_m;		// mux select between TG's for fgu ops

   output 	dec_lsu_sel0_e;		// mux select between TG's for lsu ops
   output 	dec_lsu_sel1_e;		

   output 	dec_rs1_addr0_e;	
   output 	dec_rs1_addr1_e;	

   output 	dec_lsu_sel0_upper_e;	// mux select taking pstate AM into account
   output 	dec_lsu_sel1_upper_e;

   output 	dec_lsu_sel0_lower_e;	// mux select taking pstate AM into account
   output 	dec_lsu_sel1_lower_e;

   output 	dec_rs1_addr0_upper_e;
   output 	dec_rs1_addr1_upper_e;


   output [7:0] del_pick_d;		// picks to CCR logic       

   // lsu interface
   output 	dec_ld_inst_e;         	// load inst
   output 	dec_st_inst_e;         	// store inst
   output 	dec_fsr_ldst_e;         // LDFSR,STFSR
   output 	dec_fpldst_inst_e;     	// FP load or store inst
   output 	dec_ldst_dbl_e;        	// ldd inst
   output 	dec_pref_inst_e;       	// prefetch inst
   output 	dec_flush_inst_e;      	// flush inst
   output 	dec_memstbar_inst_e;	// membar, stbar
   
   output 	dec_sr_inst_e;        	// ASR inst
   output 	dec_pr_inst_e;        	// priv inst
   output 	dec_hpr_inst_e;        	// hypervisor inst
   output 	dec_casa_inst_e;       	// CASA inst
   output 	dec_ldstub_inst_e;     	// LDSTUB inst
   output 	dec_swap_inst_e;       	// SWAP inst
   output 	dec_altspace_d;        	// Alternate space access
   output 	dec_sign_ext_e;        	// Sign extend lsu op
   output [4:0] dec_sraddr_e;          	// source address for ASR access
   output 	dec_imm_asi_vld_d;     	// immediate form of alternate access
   output [7:0] dec_imm_asi_d;         	// 8-bit ASI access
   output [1:0] dec_ldst_sz_e;		// size of the ldst operation
   

   output 	dec_ld_inst_d;		// load inst decoded

   output [1:0] dec_lsu_tid0_d;		// tid for lsu operation
   output [1:0] dec_lsu_tid1_d;		// tid for lsu operation
   output       dec_lsu_tg_d;		// tid for lsu operation
   output [4:0] dec_lsu_rd_e;		// RD destination of lsu operation

   output del_test0_sel_p;		// mux selects for IRF read port rs3
   output del_twocycle0_std_p;
   output del_twocycle0_rs2_p;
   output del_default0_sel_p;

   output del_test1_sel_p;
   output del_twocycle1_std_p;
   output del_twocycle1_rs2_p;
   output del_default1_sel_p;

   output [4:0] del_test_addr0_p;	// address to read for exu test access
   output [4:0] del_test_addr1_p;

   output [9:0] dec_instr0_type_d;	// pmu stuff thread group 0
   output [9:0] dec_instr1_type_d;	// pmu stuff thread group 1

   output [1:0] dec_exu_clken;		// clk enable signals to the exu

   output [1:0] del_tg_clken;  		// clk enables for thread groups
   
   output scan_out;

   output [1:0] dec_true_valid_e;  	// take illegals and other exceptions into account

   output [1:0] dec_load_flush_w;

   output dec_lsu_sel0_d;      		// to the pmu to decide which tid to use for lsu at d stage

   output [7:0] dec_raw_pick_p;

   output [1:0] dec_ierr_d;  		// tell pku that an inst error has occurred: illegal, parity error or ifetch error

   output [7:0] dec_block_store_stall;  // prevent window ops from coming too early after a block store 

dec_del_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

dec_del_ctl_spare_ctl_macro__flops_0__num_6 spares  (
);

// bit 0 maps to spare0_flop
dec_del_ctl_msff_ctl_macro__scanreverse_1__width_6 spare_5_0_lat  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
	.l1clk	(l1clk),
        .din    ({{3{1'b0}},pmu_valid_d[0],1'b0,pmu_valid_d[1]}),
        .dout   ({spare_5_0_lat_unused[3:1],pmu_valid_e[0],spare_5_0_lat_unused[0],pmu_valid_e[1]}),
  .siclk(siclk),
  .soclk(soclk)
);

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
assign se    = tcu_scan_en;
// end scan


assign dec_load_flush_w[1:0] = { |pku_load_flush_w[7:4], |pku_load_flush_w[3:0] };

assign callinst0_d = dcd_callclass_d[0] & ~dec_inst0_b31;
assign callinst1_d = dcd_callclass_d[1] & ~dec_inst1_b31;

// for save/restore invert oddwin since rd is in the new window
assign dec_inst0_rd_d[4] = (dec_inst0_raw_rd_d[4] & ~callinst0_d) ^ ((dec_inst0_raw_rd_d[3] | callinst0_d) & (ded_oddwin0_d ^ dcd_save_restore_d[0]));
assign dec_inst0_rd_d[3:0] = dec_inst0_raw_rd_d[3:0] | {4{callinst0_d}};

assign dec_inst1_rd_d[4] = (dec_inst1_raw_rd_d[4] & ~callinst1_d) ^ ((dec_inst1_raw_rd_d[3] | callinst1_d) & (ded_oddwin1_d ^ dcd_save_restore_d[1]));
assign dec_inst1_rd_d[3:0] = dec_inst1_raw_rd_d[3:0] | {4{callinst1_d}};

// predecodes for timing (make dec_decode* fast)

// make sure twocycle is lsu to deal with illegal instructions (partial decodes)
assign pdecode0_in[6:0] = {  pku_idest_p[0],pku_fdest_p[0],pku_fsrc_rd_p[0],pku_lsu_p[0],pku_fgu_p[0],
			  pku_pdist_p[0],pku_twocycle_p[0] & pku_lsu_p[0] };
									    
assign pdecode1_in[6:0] = {  pku_idest_p[1],pku_fdest_p[1],pku_fsrc_rd_p[1],pku_lsu_p[1],pku_fgu_p[1],
			  pku_pdist_p[1],pku_twocycle_p[1] & pku_lsu_p[1] };
									    
assign pdecode2_in[6:0] = {  pku_idest_p[2],pku_fdest_p[2],pku_fsrc_rd_p[2],pku_lsu_p[2],pku_fgu_p[2],
			  pku_pdist_p[2],pku_twocycle_p[2] & pku_lsu_p[2] };
									    
assign pdecode3_in[6:0] = {  pku_idest_p[3],pku_fdest_p[3],pku_fsrc_rd_p[3],pku_lsu_p[3],pku_fgu_p[3],
			  pku_pdist_p[3],pku_twocycle_p[3] & pku_lsu_p[3] };


assign pdec0_in[6:0] =   ({7{del_noshift0_d}} & pdecode0_d[6:0]) |
			   ({7{~del_noshift0_d & pku_raw_pick0_p[0] & ded_legal_p[0] & ~ded_perr_p[0] & ~ded_ferr_p[0]}} & pdecode0_in[6:0]) |
			   ({7{~del_noshift0_d & pku_raw_pick0_p[1] & ded_legal_p[0] & ~ded_perr_p[0] & ~ded_ferr_p[0]}} & pdecode1_in[6:0]) |
			   ({7{~del_noshift0_d & pku_raw_pick0_p[2] & ded_legal_p[0] & ~ded_perr_p[0] & ~ded_ferr_p[0]}} & pdecode2_in[6:0]) |
			   ({7{~del_noshift0_d & pku_raw_pick0_p[3] & ded_legal_p[0] & ~ded_perr_p[0] & ~ded_ferr_p[0]}} & pdecode3_in[6:0]);


dec_del_ctl_msff_ctl_macro__width_7 pdecode0f  (
 .scan_in(pdecode0f_scanin),
 .scan_out(pdecode0f_scanout),
 .din(pdec0_in[6:0]),
 .dout(pdecode0_d[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign { idest0_d, fdest0_d, fsrc0_rd_d, lsu0_d, fgu0_d, pdist0_d, twocycle0_d } = pdecode0_d[6:0];

// make sure twocycle is lsu to deal with illegal instructions (partial decodes)
assign pdecode4_in[6:0] = {  pku_idest_p[4],pku_fdest_p[4],pku_fsrc_rd_p[4],pku_lsu_p[4],pku_fgu_p[4],
			  pku_pdist_p[4],pku_twocycle_p[4] & pku_lsu_p[4] };
									    
assign pdecode5_in[6:0] = {  pku_idest_p[5],pku_fdest_p[5],pku_fsrc_rd_p[5],pku_lsu_p[5],pku_fgu_p[5],
			  pku_pdist_p[5],pku_twocycle_p[5] & pku_lsu_p[5] };
									    
assign pdecode6_in[6:0] = {  pku_idest_p[6],pku_fdest_p[6],pku_fsrc_rd_p[6],pku_lsu_p[6],pku_fgu_p[6],
			  pku_pdist_p[6],pku_twocycle_p[6] & pku_lsu_p[6] };
									    
assign pdecode7_in[6:0] = {  pku_idest_p[7],pku_fdest_p[7],pku_fsrc_rd_p[7],pku_lsu_p[7],pku_fgu_p[7],
			  pku_pdist_p[7],pku_twocycle_p[7] & pku_lsu_p[7] };

assign pdec1_in[6:0] =   ({7{del_noshift1_d}} & pdecode1_d[6:0]) |
			   ({7{~del_noshift1_d & pku_raw_pick1_p[4] & ded_legal_p[1] & ~ded_perr_p[1] & ~ded_ferr_p[1]}} & pdecode4_in[6:0]) |
			   ({7{~del_noshift1_d & pku_raw_pick1_p[5] & ded_legal_p[1] & ~ded_perr_p[1] & ~ded_ferr_p[1]}} & pdecode5_in[6:0]) |
			   ({7{~del_noshift1_d & pku_raw_pick1_p[6] & ded_legal_p[1] & ~ded_perr_p[1] & ~ded_ferr_p[1]}} & pdecode6_in[6:0]) |
			   ({7{~del_noshift1_d & pku_raw_pick1_p[7] & ded_legal_p[1] & ~ded_perr_p[1] & ~ded_ferr_p[1]}} & pdecode7_in[6:0]);


dec_del_ctl_msff_ctl_macro__width_7 pdecode1f  (
 .scan_in(pdecode1f_scanin),
 .scan_out(pdecode1f_scanout),
 .din(pdec1_in[6:0]),
 .dout(pdecode1_d[6:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign { idest1_d, fdest1_d, fsrc1_rd_d, lsu1_d, fgu1_d, pdist1_d, twocycle1_d } = pdecode1_d[6:0];



assign final_pick_p[3:0] = pku_base_pick_p[3:0] & {4{~(dec_valid0_d & ~dec_decode0_d)}};
assign final_pick_p[7:4] = pku_base_pick_p[7:4] & {4{~(dec_valid1_d & ~dec_decode1_d)}};


assign shift0_d = ~del_noshift0_d;

assign raw_pick0_in[3:0] = ({4{shift0_d}} & pku_raw_pick0_p[3:0]) |
		           ({4{~shift0_d}} & pick0_d[3:0]);

assign pick0_in[3:0] = ({4{shift0_d}} & final_pick_p[3:0]) |
		       ({4{~shift0_d}} & pick0_d[3:0]);

dec_del_ctl_msff_ctl_macro__width_4 pick0f  (
 .scan_in(pick0f_scanin),
 .scan_out(pick0f_scanout),
 .l1clk(l1clk),
 .din  (pick0_in[3:0]),
 .dout (pick0_d[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign shift1_d = ~del_noshift1_d;

assign raw_pick1_in[3:0] = ({4{shift1_d}} & pku_raw_pick1_p[7:4]) |
		           ({4{~shift1_d}} & pick1_d[3:0]);

assign pick1_in[3:0] = ({4{shift1_d}} & final_pick_p[7:4]) |
		       ({4{~shift1_d}} & pick1_d[3:0]);

dec_del_ctl_msff_ctl_macro__width_4 pick1f  (
 .scan_in(pick1f_scanin),
 .scan_out(pick1f_scanout),
 .l1clk(l1clk),
 .din  (pick1_in[3:0]),
 .dout (pick1_d[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_raw_pick_p[7:0] = {raw_pick1_in[3:0], raw_pick0_in[3:0]};

dec_del_ctl_msff_ctl_macro__width_16 privstatef  (
 .scan_in(privstatef_scanin),
 .scan_out(privstatef_scanout),
 .l1clk(l1clk),
 .din  ({tlu_dec_pstate_priv[7:0],tlu_dec_hpstate_hpriv[7:0]}),
 .dout ({tlu_priv[7:0],tlu_hpriv[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_16 fef  (
 .scan_in(fef_scanin),
 .scan_out(fef_scanout),
 .l1clk(l1clk),
 .din  ({tlu_dec_pstate_pef[7:0],fgu_fprs_fef[7:0]}),
 .dout ({tlu_pef[7:0],fgu_fef[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

// priv bits from the tlu
assign priv_d[0] = |(pick0_d[3:0] & tlu_priv[3:0]);
assign hpriv_d[0] = |(pick0_d[3:0] & tlu_hpriv[3:0]);
assign fpdis_d[0] = |(pick0_d[3:0] & ~(tlu_pef[3:0] & fgu_fef[3:0]));

assign priv_d[1] = |(pick1_d[3:0] & tlu_priv[7:4]);
assign hpriv_d[1] = |(pick1_d[3:0] & tlu_hpriv[7:4]);
assign fpdis_d[1] = |(pick1_d[3:0] & ~(tlu_pef[7:4] & fgu_fef[7:4]));

assign del_pick_d[3:0] = pick0_d[3:0];
assign del_pick_d[7:4] = pick1_d[3:0];



assign inst0_cnt_brtaken0[1:0] = ({2{raw_pick0_in[3]}} & pku_inst_cnt_brtaken03[1:0]) |
			         ({2{raw_pick0_in[2]}} & pku_inst_cnt_brtaken02[1:0]) |
			         ({2{raw_pick0_in[1]}} & pku_inst_cnt_brtaken01[1:0]) |	
                                 ({2{raw_pick0_in[0]}} & pku_inst_cnt_brtaken00[1:0]);

assign inst0_cnt_brtaken1[1:0] = ({2{raw_pick0_in[3]}} & pku_inst_cnt_brtaken13[1:0]) |
			         ({2{raw_pick0_in[2]}} & pku_inst_cnt_brtaken12[1:0]) |
			         ({2{raw_pick0_in[1]}} & pku_inst_cnt_brtaken11[1:0]) |	
                                 ({2{raw_pick0_in[0]}} & pku_inst_cnt_brtaken10[1:0]);

assign inst1_cnt_brtaken0[1:0] = ({2{raw_pick1_in[3]}} & pku_inst_cnt_brtaken07[1:0]) |
			         ({2{raw_pick1_in[2]}} & pku_inst_cnt_brtaken06[1:0]) |
			         ({2{raw_pick1_in[1]}} & pku_inst_cnt_brtaken05[1:0]) |	
                                 ({2{raw_pick1_in[0]}} & pku_inst_cnt_brtaken04[1:0]);

assign inst1_cnt_brtaken1[1:0] = ({2{raw_pick1_in[3]}} & pku_inst_cnt_brtaken17[1:0]) |
			         ({2{raw_pick1_in[2]}} & pku_inst_cnt_brtaken16[1:0]) |
			         ({2{raw_pick1_in[1]}} & pku_inst_cnt_brtaken15[1:0]) |	
                                 ({2{raw_pick1_in[0]}} & pku_inst_cnt_brtaken14[1:0]);

assign br_taken_e[1:0] = dec_br_taken_e1[1:0] & dec_valid_e[1:0] & ~ifetch_err_e[1:0];

assign inst0_cnt[1:0] = ({2{~br_taken_e[0]}} & inst0_cnt_brtaken0[1:0]) |
			({2{ br_taken_e[0]}} & inst0_cnt_brtaken1[1:0]);

assign inst1_cnt[1:0] = ({2{~br_taken_e[1]}} & inst1_cnt_brtaken0[1:0]) |
			({2{ br_taken_e[1]}} & inst1_cnt_brtaken1[1:0]);
	                

// send inst cnt directly off flop to tlu
dec_del_ctl_msff_ctl_macro__width_4 instcntf  (
 .scan_in(instcntf_scanin),
 .scan_out(instcntf_scanout),
 .l1clk(l1clk),
 .din  ({inst0_cnt[1:0],inst1_cnt[1:0]}),
 .dout ({dec_inst0_cnt[1:0],dec_inst1_cnt[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_16  exutestf  (
 .scan_in(exutestf_scanin),
 .scan_out(exutestf_scanout),
 .l1clk(l1clk),
 .din  ({exu_test_tid0[1:0],exu_test_tid1[1:0],exu_test_addr0[4:0],exu_test_addr1[4:0],exu_test_valid0,exu_test_valid1}),
 .dout ({ttid0_p[1:0],ttid1_p[1:0],del_test_addr0_p[4:0],del_test_addr1_p[4:0],test_stall0_in,test_stall1_in}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_2  teststallf  (
 .scan_in(teststallf_scanin),
 .scan_out(teststallf_scanout),
 .l1clk(l1clk),
 .din  ({test_stall0_in,test_stall1_in}),
 .dout ({test_stall0,test_stall1}),
  .siclk(siclk),
  .soclk(soclk)
);

// DEC must select the correct register to send to LSU in the second cycle of a twocycle op.
// For STD, the register is Rs3+1
// For CASA, the register is Rs2
assign del_test0_sel_p = test_stall0_in;
assign del_twocycle0_std_p = twocycle_p[0] & ~dec_inst0_op3_d[3] & ~test_stall0_in;
assign del_twocycle0_rs2_p = twocycle_p[0] &  dec_inst0_op3_d[3] & ~test_stall0_in;
assign twocycle0_sel_p = twocycle_p[0] & ~test_stall0_in;
assign del_default0_sel_p = ~test_stall0_in & ~twocycle_p[0];

assign del_test1_sel_p = test_stall1_in;
assign del_twocycle1_std_p = twocycle_p[1] & ~dec_inst1_op3_d[3] & ~test_stall1_in;
assign del_twocycle1_rs2_p = twocycle_p[1] &  dec_inst1_op3_d[3] & ~test_stall1_in;
assign twocycle1_sel_p = twocycle_p[1] & ~test_stall1_in;
assign del_default1_sel_p = ~test_stall1_in & ~twocycle_p[1];

// generate tid's to the EXU
assign tid0_p[1] = ~raw_pick0_in[1] & ~raw_pick0_in[0];
assign tid0_p[0] = ~raw_pick0_in[2] & ~raw_pick0_in[0];

assign tid1_p[1] = ~raw_pick1_in[1] & ~raw_pick1_in[0];
assign tid1_p[0] = ~raw_pick1_in[2] & ~raw_pick1_in[0];

// force the same tid for twocycle operations (std,casa,pst)
assign dec_tid0_p[1:0] = ({2{del_default0_sel_p}} & tid0_p[1:0]) |
		         ({2{twocycle0_sel_p}} & tid0_d[1:0]) |
			 ({2{del_test0_sel_p}} & ttid0_p[1:0]);

assign dec_tid1_p[1:0] = ({2{del_default1_sel_p}} & tid1_p[1:0]) |
		         ({2{twocycle1_sel_p}} & tid1_d[1:0]) |
			 ({2{del_test1_sel_p}} & ttid1_p[1:0]);

// technically we dont need to clear the valid_d's for br_mispredict, trap flush or load flush
// we will never get a dec_valid_e for these cases
// clear it anyway

// flop tlu_flush_ifu if it don't make timing
assign valid_d_in[3:0] = (pku_base_pick_p[3:0] | (valid_d[3:0] & ~{4{dec_decode0_d}})) & ~tlu_flush_ifu[3:0] & ~pku_load_flush_w[3:0];
assign valid_d_in[7:4] = (pku_base_pick_p[7:4] | (valid_d[7:4] & ~{4{dec_decode1_d}})) & ~tlu_flush_ifu[7:4] & ~pku_load_flush_w[7:4];

dec_del_ctl_msff_ctl_macro__width_8  val_df  (
 .scan_in(val_df_scanin),
 .scan_out(val_df_scanout),
 .l1clk(l1clk),
 .din  (valid_d_in[7:0]),
 .dout (valid_d[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// for speed, have dec_valid0,1_d come off flop
assign valid0_d_in = |valid_d_in[3:0];
assign valid1_d_in = |valid_d_in[7:4];

dec_del_ctl_msff_ctl_macro__width_2  valid_df  (
 .scan_in(valid_df_scanin),
 .scan_out(valid_df_scanout),
 .l1clk(l1clk),
 .din  ({valid0_d_in,valid1_d_in}),
 .dout ({valid0_d,valid1_d}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_valid0_d = valid0_d;
assign dec_valid1_d = valid1_d;

dec_del_ctl_msff_ctl_macro__width_2 dtlb_reloadf  (
 .scan_in(dtlb_reloadf_scanin),
 .scan_out(dtlb_reloadf_scanout),
 .l1clk(l1clk),
 .din  ({tlu_dtlb_reload_stall,dtlb_reload[1]}),
 .dout (dtlb_reload[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dtlb_reload_stall = |dtlb_reload[1:0];


// we delay 1 cycle to give time to any STD's or PDIST's that might be going on
dec_del_ctl_msff_ctl_macro__width_1 block_store0f  (
 .scan_in(block_store0f_scanin),
 .scan_out(block_store0f_scanout),
 .l1clk(l1clk),
 .din  (lsu_block_store_stall),
 .dout (pre_block_store_stall),
  .siclk(siclk),
  .soclk(soclk)
);


assign block_store_stall_in = (block_store_stall | pre_block_store_stall) & ~reset_block_store_stall;

dec_del_ctl_msff_ctl_macro__width_1 block_storef  (
 .scan_in(block_storef_scanin),
 .scan_out(block_storef_scanout),
 .l1clk(l1clk),
 .din  (block_store_stall_in),
 .dout (block_store_stall),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_rd_in[4:3] = ({2{lsu_block_store_stall}} & lsu_block_store_rd[4:3]) |
				({2{~lsu_block_store_stall}} & block_store_rd[4:3]);

dec_del_ctl_msff_ctl_macro__width_2 block_store_rdhif  (
 .scan_in(block_store_rdhif_scanin),
 .scan_out(block_store_rdhif_scanout),
 .l1clk(l1clk),
 .din  (block_store_rd_in[4:3]),
 .dout (block_store_rd[4:3]),
  .siclk(siclk),
  .soclk(soclk)
);

// pre_block_store_stall must reset the count for the case where the sequence is restarted
assign block_store_rd_in[2:0] = ({3{block_store_stall}} & (block_store_rd[2:0]+3'b001)) &
				({3{~pre_block_store_stall}});

dec_del_ctl_msff_ctl_macro__width_3 block_store_rdlof  (
 .scan_in(block_store_rdlof_scanin),
 .scan_out(block_store_rdlof_scanout),
 .l1clk(l1clk),
 .din  (block_store_rd_in[2:0]),
 .dout (block_store_rd[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_tid_in[2:0] = ({3{lsu_block_store_stall}} & lsu_block_store_tid[2:0]) |
				 ({3{~lsu_block_store_stall}} & block_store_tid[2:0]);

dec_del_ctl_msff_ctl_macro__width_3 block_store_tidf  (
 .scan_in(block_store_tidf_scanin),
 .scan_out(block_store_tidf_scanout),
 .l1clk(l1clk),
 .din  (block_store_tid_in[2:0]),
 .dout (block_store_tid[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_stall0 = (block_store_stall | pre_block_store_stall) & ~block_store_tid[2];

assign block_store_stall1 = (block_store_stall | pre_block_store_stall) & block_store_tid[2];

// prevent window ops from coming too early after a block store
// it is possible for the 8th beat to have an ecc exception
// for this type of exception, tlu may take an extra cycle before signalling flush

// must reset the dec_block_store_stall with pre_block_store_stall in case the sequence is restarted
assign dec_block_store_stall[7:0] = {8{block_store_stall}}  &  {block_store_tid[2:0] == 3'b111,
								block_store_tid[2:0] == 3'b110,
								block_store_tid[2:0] == 3'b101,
								block_store_tid[2:0] == 3'b100,
								block_store_tid[2:0] == 3'b011,
								block_store_tid[2:0] == 3'b010,
								block_store_tid[2:0] == 3'b001,
								block_store_tid[2:0] == 3'b000} & {8{~pre_block_store_stall}};


assign cpq_stall_in = lsu_cpq_stall;

dec_del_ctl_msff_ctl_macro__width_1 cpq_stallf  (
 .scan_in(cpq_stallf_scanin),
 .scan_out(cpq_stallf_scanout),
 .l1clk(l1clk),
 .din  (cpq_stall_in),
 .dout (cpq_stall),
  .siclk(siclk),
  .soclk(soclk)
);

assign fecc_stall_in = fgu_ecc_asi_stall;

dec_del_ctl_msff_ctl_macro__width_1 fecc_stallf  (
 .scan_in(fecc_stallf_scanin),
 .scan_out(fecc_stallf_scanout),
 .l1clk(l1clk),
 .din  (fecc_stall_in),
 .dout (fecc_stall),
  .siclk(siclk),
  .soclk(soclk)
);

// no need to make this flushable because it is not speculative ...
// we always wait 1 cycle before starting the block store to allow prior twocycle operations
dec_del_ctl_msff_ctl_macro__width_3 block_resetf  (
 .scan_in(block_resetf_scanin),
 .scan_out(block_resetf_scanout),
 .l1clk(l1clk),
 .din  (block_rst_cnt_in[2:0]),
 .dout (block_rst_cnt[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// pre_block_store_stall must reset the count for the case where the sequence is restarted
assign block_rst_cnt_in[2:0] = ({3{block_store_stall}} & (block_rst_cnt[2:0]+3'b001)) &
			       ({3{~pre_block_store_stall}});
assign reset_block_store_stall = &(block_rst_cnt[2:0]);

// generate dec_block_store_b[7:0] to tlu to reduce routes

dec_del_ctl_msff_ctl_macro__width_4 block_store_e  (
 .scan_in(block_store_e_scanin),
 .scan_out(block_store_e_scanout),
 .l1clk(l1clk),
 .din  ({block_store_stall,block_store_tid[2:0]}),
 .dout ({block_store_stall_e,block_store_tid_e[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_4 block_store_m  (
 .scan_in(block_store_m_scanin),
 .scan_out(block_store_m_scanout),
 .l1clk(l1clk),
 .din  ({block_store_stall_e,block_store_tid_e[2:0]}),
 .dout ({block_store_stall_m,block_store_tid_m[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_4 block_store_b  (
 .scan_in(block_store_b_scanin),
 .scan_out(block_store_b_scanout),
 .l1clk(l1clk),
 .din  ({block_store_stall_m,block_store_tid_m[2:0]}),
 .dout ({block_store_stall_b,block_store_tid_b[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_block_store_b[0] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b000);
assign dec_block_store_b[1] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b001);
assign dec_block_store_b[2] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b010);
assign dec_block_store_b[3] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b011);
assign dec_block_store_b[4] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b100);
assign dec_block_store_b[5] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b101);
assign dec_block_store_b[6] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b110);
assign dec_block_store_b[7] = block_store_stall_b && (block_store_tid_b[2:0] == 3'b111);




// favor bits: only toggle when the relevant conflict is decided one way or the other

// load favor bit (which load to favor in case of two loads)
// harden illegals
assign set_lfavor = (dec_decode0_d & lsusel0_d & lsu0_d & lsu1_d & dec_valid1_d & ~(fgu0_d & fgu1_d));
assign reset_lfavor = (dec_decode1_d & ~lsusel0_d & lsu0_d & lsu1_d & dec_valid0_d & ~(fgu0_d & fgu1_d));

assign lfavor_in = (lfavor | set_lfavor) & ~reset_lfavor;
dec_del_ctl_msff_ctl_macro__width_1 lfavorf  (
 .scan_in(lfavorf_scanin),
 .scan_out(lfavorf_scanout),
 .l1clk(l1clk),
 .din  (lfavor_in),
 .dout (lfavor),
  .siclk(siclk),
  .soclk(soclk)
);

// fpu favor bit (which fpu to favor in case of two fpus)
// harden illegals
assign set_ffavor = (dec_decode0_d & fgusel0_d & fgu0_d & fgu1_d & dec_valid1_d & ~(lsu0_d & lsu1_d));
assign reset_ffavor = (dec_decode1_d & ~fgusel0_d & fgu0_d & fgu1_d & dec_valid0_d & ~(lsu0_d & lsu1_d));

assign ffavor_in = (ffavor | set_ffavor) & ~reset_ffavor;
dec_del_ctl_msff_ctl_macro__width_1 ffavorf  (
 .scan_in(ffavorf_scanin),
 .scan_out(ffavorf_scanout),
 .l1clk(l1clk),
 .din  (ffavor_in),
 .dout (ffavor),
  .siclk(siclk),
  .soclk(soclk)
);

// store-float favor bit (which store-float to favor in case of two store-floats)
assign set_sffavor = (dec_decode0_d & lsu_float_case & dec_valid1_d);
assign reset_sffavor = (dec_decode1_d & lsu_float_case & dec_valid0_d);

assign sffavor_in = (sffavor | set_sffavor) & ~reset_sffavor;
dec_del_ctl_msff_ctl_macro__width_1 sffavorf  (
 .scan_in(sffavorf_scanin),
 .scan_out(sffavorf_scanout),
 .l1clk(l1clk),
 .din  (sffavor_in),
 .dout (sffavor),
  .siclk(siclk),
  .soclk(soclk)
);

// remember mult request; not flushable
assign mult_request_in = (spu_mult_request & (~mult_request | (mult_request & dec_spu_grant_d))) | 
		         (mult_request & ~dec_spu_grant_d);

dec_del_ctl_msff_ctl_macro__width_1 mulrequestf  (
 .scan_in(mulrequestf_scanin),
 .scan_out(mulrequestf_scanout),
 .l1clk(l1clk),
 .din  (mult_request_in),
 .dout (mult_request),
  .siclk(siclk),
  .soclk(soclk)
);

// if you have crypto mult case and crypto mult is not favored; it must wait for cmfavor bit to toggle

// harden for illegals
assign crypto_mult_case0 = (mult_request & fgusel0_d & fgu0_d & dec_valid0_d);
assign crypto_mult_case1 = (mult_request & ~fgusel0_d & fgu1_d & dec_valid1_d);

// if the core wins; favor the crypto multiply next time
assign set_cmfavor = (dec_decode0_d & crypto_mult_case0) |
		     (dec_decode1_d & crypto_mult_case1);

// reset the cmfavor bit if you win it clean
assign reset_cmfavor = (cmfavor & cmfavor_grant_d & (crypto_mult_case0 | crypto_mult_case1));

// grant the mult_request if you are favored or ~favored but nothing else wants the fgu
// have we covered all things that want the fgu ????
// never grant spu if second cycle of a pdist
// never grant spu if we are doing a block store
// dont give spu_grant if fgu has created an idiv hole in the pipe

assign idiv_hole_d = |idiv_stall_d[1:0];

assign cmfavor_grant_d =  mult_request & ~idiv_hole_d & ~pdistblock_d & 
				    ~(block_store_stall | pre_block_store_stall);

assign dec_spu_grant_d = (cmfavor & cmfavor_grant_d) |
		        (~cmfavor & mult_request & ~idiv_hole_d & ~crypto_mult_case0 & 
                                    ~crypto_mult_case1 & ~pdistblock_d & 
				    ~(block_store_stall | pre_block_store_stall)); 

assign dec_spu_grant_fgu_d = dec_spu_grant_d; // clone copy to fgu

assign cmfavor_in = (cmfavor | set_cmfavor) & ~reset_cmfavor;

dec_del_ctl_msff_ctl_macro__width_1 cmfavorf  (
 .scan_in(cmfavorf_scanin),
 .scan_out(cmfavorf_scanout),
 .l1clk(l1clk),
 .din  (cmfavor_in),
 .dout (cmfavor),
  .siclk(siclk),
  .soclk(soclk)
);

// harden for illegals
assign pdistblock_in[1:0] = 	{ (pdist1_d & ~fgusel0_d & dec_decode1_d),
			          (pdist0_d &  fgusel0_d & dec_decode0_d) };

dec_del_ctl_msff_ctl_macro__width_2 pdistblockf  (
 .scan_in(pdistblockf_scanin),
 .scan_out(pdistblockf_scanout),
 .l1clk(l1clk),
 .din  (pdistblock_in[1:0]),
 .dout (pdistblock[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// pdist from either thread group
assign pdistblock_d = |pdistblock[1:0];

// remember the rd of the pdist
dec_del_ctl_msff_ctl_macro__width_5 pdistrdf  (
 .scan_in(pdistrdf_scanin),
 .scan_out(pdistrdf_scanout),
 .l1clk(l1clk),
 .din  (dec_frf_w_addr_d[4:0]),
 .dout (pdist_rd[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_3 pdisttidf  (
 .scan_in(pdisttidf_scanin),
 .scan_out(pdisttidf_scanout),
 .l1clk(l1clk),
 .din  (dec_fgu_tid_d[2:0]),
 .dout (pdist_tid[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// STD blocks on the second cycle
// STD is atomic; both reads are back-to-back
assign twocycle0_d_in = (twocycle0_d & dec_decode0_d);

dec_del_ctl_msff_ctl_macro__width_1 twocycle0_df  (
 .scan_in(twocycle0_df_scanin),
 .scan_out(twocycle0_df_scanout),
 .l1clk(l1clk),
 .din  (twocycle0_d_in),
 .dout (twocycle0_stall),
  .siclk(siclk),
  .soclk(soclk)
);

assign twocycle1_d_in = (twocycle1_d & dec_decode1_d);

dec_del_ctl_msff_ctl_macro__width_1 twocycle1_df  (
 .scan_in(twocycle1_df_scanin),
 .scan_out(twocycle1_df_scanout),
 .l1clk(l1clk),
 .din  (twocycle1_d_in),
 .dout (twocycle1_stall),
  .siclk(siclk),
  .soclk(soclk)
);

// 0in assert -var (~(twocycle0_stall & twocycle1_stall)) -message "twocycle0_stall and twocycle1_stall must be mutually exclusive"

assign twocycle_p[1:0] = { twocycle1_d_in, twocycle0_d_in };

// create a "hole" for integer ops executed by the fgu
assign int_hole0_in = (fgu0_d & idest0_d & dec_decode0_d) | idiv_stall_d[0];

dec_del_ctl_msff_ctl_macro__width_3 inthole0_df  (
 .scan_in(inthole0_df_scanin),
 .scan_out(inthole0_df_scanout),
 .l1clk(l1clk),
 .din  ({int_hole0_in,int_hole0_stall[2:1]}),
 .dout (int_hole0_stall[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign int_hole1_in = (fgu1_d & idest1_d & dec_decode1_d) | idiv_stall_d[1];

dec_del_ctl_msff_ctl_macro__width_3 inthole1_df  (
 .scan_in(inthole1_df_scanin),
 .scan_out(inthole1_df_scanout),
 .l1clk(l1clk),
 .din  ({int_hole1_in,int_hole1_stall[2:1]}),
 .dout (int_hole1_stall[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_3 divstall_df  (
 .scan_in(divstall_df_scanin),
 .scan_out(divstall_df_scanout),
 .l1clk(l1clk),
 .din  ({fgu_idiv_stall[1:0],fgu_fdiv_stall}),
 .dout ({idiv_stall_d[1:0],fdiv_stall_d}),
  .siclk(siclk),
  .soclk(soclk)
);

assign window_stall_in[1:0] = { exu1_window_block | tlu_window_block[1],
	  		        exu0_window_block | tlu_window_block[0] };
dec_del_ctl_msff_ctl_macro__width_2 windowstall_df  (
 .scan_in(windowstall_df_scanin),
 .scan_out(windowstall_df_scanout),
 .l1clk(l1clk),
 .din  (window_stall_in[1:0]),
 .dout (window_stall_d[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// clken signals for the exu
// not sure about window_stall; leave it out for now

assign exu_clken_in[1:0] = { valid1_d_in | test_stall1_in | twocycle1_d_in | ~lsu_exu_pmen,
			     valid0_d_in | test_stall0_in | twocycle0_d_in | ~lsu_exu_pmen};

dec_del_ctl_msff_ctl_macro__width_2 exu_clkenf  (
 .scan_in(exu_clkenf_scanin),
 .scan_out(exu_clkenf_scanout),
 .l1clk(l1clk),
 .din  (exu_clken_in[1:0]),
 .dout (dec_exu_clken[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);


//
// for legal insts, this can only happen for stores
//
assign lsu_float_case = fgu0_d & lsu0_d & fgu1_d & lsu1_d; 

// pdist bug
// second beat of a pdist can cause an ECC exception; can't let any other op for that TG down the pipe;
// use pdistblock[] to make this happen
// for second beat of a pdist, no fgu op can go from either TG; use pdistblock_d to make this happen


// two STDs can come the same cycle but never do we have twocycle0_stall and twocycle1_stall at the same time
// better block0 would be twocycle0_stall | (twocycle1_stall & twocycle0_d)

// only a block if the other one is valid
assign block0 = (dec_valid1_d & lsu0_d & lsu1_d & lfavor & ~lsu_float_case) |
		(dec_valid1_d & fgu0_d & fgu1_d & ffavor & ~lsu_float_case) |
		(dec_valid1_d & lsu_float_case & sffavor) |
		(fgu0_d & (pdistblock_d | (cmfavor & mult_request) | fecc_stall)) |
		(lsu0_d & (cpq_stall | dtlb_reload_stall)) |
	        (block_store_stall0 | (block_store_stall1 & (lsu0_d | fgu0_d))) |
	        (twocycle0_stall | (twocycle1_stall & lsu0_d)) |  // twocycles can appear at decode0,1 at the same time
                pdistblock[0] |
		((|idiv_stall_d[1:0]) & fgu0_d & idest0_d) |    // hole for common fgu result bus 
		int_hole0_stall[0] |				// hole for int ops executed by fgu (irf write port)
		(fdiv_stall_d & lsu0_d & fdest0_d) |		// hole for frf write port (no load-float)
		window_stall_d[0] |
		power_stall[0] |
		test_stall0;


assign dec_decode0_d = dec_valid0_d & ~block0;

assign del_noshift0_d = dec_valid0_d & ~dec_decode0_d;

assign block1 = (dec_valid0_d & lsu0_d & lsu1_d & ~lfavor & ~lsu_float_case) |
		(dec_valid0_d & fgu0_d & fgu1_d & ~ffavor & ~lsu_float_case) |
		(dec_valid0_d & lsu_float_case & ~sffavor) |
		(fgu1_d & (pdistblock_d | (cmfavor & mult_request) | fecc_stall)) |
		(lsu1_d & (cpq_stall | dtlb_reload_stall)) |
	        (block_store_stall1 | (block_store_stall0 & (lsu1_d | fgu1_d))) |
	        (twocycle1_stall | (twocycle0_stall & lsu1_d)) |
		pdistblock[1] |
		((|idiv_stall_d[1:0]) & fgu1_d & idest1_d) |	// hole for common fgu result bus
		int_hole1_stall[0] |				// hole for int ops executed by fgu (irf write port)
		(fdiv_stall_d & lsu1_d & fdest1_d) |		// hole for frf write port (no load-float)
		window_stall_d[1] |
		power_stall[0] |	
		test_stall1;


assign dec_decode1_d = dec_valid1_d & ~block1;

assign del_noshift1_d = dec_valid1_d & ~dec_decode1_d;

dec_del_ctl_msff_ctl_macro__width_2 legal_f  (
 .scan_in(legal_f_scanin),
 .scan_out(legal_f_scanout),
 .l1clk(l1clk),
 .din  (ded_legal_p[1:0]),
 .dout (legal_d[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);


// 0in assert -var (~(idest0_d & fdest0_d & dec_valid0_d & dec_decode0_d)) -message "idest0_d and fdest0_d should be mutually exclusive"
// 0in assert -var (~(idest1_d & fdest1_d & dec_valid1_d & dec_decode1_d)) -message "idest1_d and fdest1_d should be mutually exclusive"


assign illegal0_d = (~legal_d[0] | (dcd_wrtick_d[0] & ~hpriv_d[0])) & ~ifetch_err_d[0];
assign illegal1_d = (~legal_d[1] | (dcd_wrtick_d[1] & ~hpriv_d[1])) & ~ifetch_err_d[1];


assign dec_ierr_d[1:0] = {   ~legal_d[1] | perr_d[1] | ifetch_err_d[1],
		      	     ~legal_d[0] | perr_d[0] | ifetch_err_d[0] };


// write tick in priv mode then it is illegal_instruction trap
assign illegal_d[1:0] = {dec_decode1_d & illegal1_d, 
			 dec_decode0_d & illegal0_d};

dec_del_ctl_msff_ctl_macro__width_2 illegal_f  (
 .scan_in(illegal_f_scanin),
 .scan_out(illegal_f_scanout),
 .l1clk(l1clk),
 .din  (illegal_d[1:0]),
 .dout (illegal_e[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpdisable_exc_d[1:0] =    {dec_decode1_d & ~ifetch_err_d[1] & dcd_fpdisable_d[1] & fpdis_d[1], 
	 		          dec_decode0_d & ~ifetch_err_d[0] & dcd_fpdisable_d[0] & fpdis_d[0]};

dec_del_ctl_msff_ctl_macro__width_2 fpdisable_exc_f  (
 .scan_in(fpdisable_exc_f_scanin),
 .scan_out(fpdisable_exc_f_scanout),
 .l1clk(l1clk),
 .din  (fpdisable_exc_d[1:0]),
 .dout (fpdisable_exc_e[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// only a priv exception if not hypervisor 
// 00 user
// 01 priv
// 1- hyper

// write tick in user mode then its a privileged_opcode trap
// there was a  bug in dcd_wrtick_d in the presence of an illegal - can it happen now?
assign priv_exc_d[1:0] =  {dec_decode1_d & ~ifetch_err_d[1] & ((dcd_priv_d[1] & ~priv_d[1] & ~hpriv_d[1]) | (dcd_wrtick_d[1] & ~priv_d[1] & ~hpriv_d[1])), 
			   dec_decode0_d & ~ifetch_err_d[0] & ((dcd_priv_d[0] & ~priv_d[0] & ~hpriv_d[0]) | (dcd_wrtick_d[0] & ~priv_d[0] & ~hpriv_d[0]))};

assign hpriv_exc_d[1:0] =  {dec_decode1_d & ~ifetch_err_d[1] & dcd_hpr_d[1] & ~hpriv_d[1], 
                            dec_decode0_d & ~ifetch_err_d[0] & dcd_hpr_d[0] & ~hpriv_d[0]};



dec_del_ctl_msff_ctl_macro__width_2 parity_err_f  (
 .scan_in(parity_err_f_scanin),
 .scan_out(parity_err_f_scanout),
 .l1clk(l1clk),
 .din  (ded_perr_p[1:0]),
 .dout (perr_d[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign icdp_perr_d[1:0] = {dec_decode1_d & perr_d[1],
	   		   dec_decode0_d & perr_d[0] };

dec_del_ctl_msff_ctl_macro__width_6 exc_f  (
 .scan_in(exc_f_scanin),
 .scan_out(exc_f_scanout),
 .l1clk(l1clk),
 .din  ({priv_exc_d[1:0],hpriv_exc_d[1:0],icdp_perr_d[1:0]}),
 .dout ({priv_exc_e[1:0],hpriv_exc_e[1:0],icdp_perr_e[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);


assign ffavor_real = (~lsu_float_case & ffavor) | (lsu_float_case & sffavor);
assign lfavor_real = (~lsu_float_case & lfavor) | (lsu_float_case & sffavor);

assign fgusel0_d = ~ffavor_real & fgu0_d & dec_valid0_d | (ffavor_real & ~(fgu1_d & dec_valid1_d));

assign fguselect_d[0] =  fgusel0_d & dec_fgu_decode_d;
assign fguselect_d[1] = ~fgusel0_d & dec_fgu_decode_d;

// force this select to the right value for each STD in TG0 or 1
assign lsusel0_d = ((~lfavor_real & lsu0_d & dec_valid0_d | (lfavor_real & ~(lsu1_d & dec_valid1_d))) & ~twocycle1_stall) | twocycle0_stall;

// to the pmu to decide which tid to use for lsu at d stage
assign dec_lsu_sel0_d = lsusel0_d; 

dec_del_ctl_msff_ctl_macro__width_4 tgsel_f  (
 .scan_in(tgsel_f_scanin),
 .scan_out(tgsel_f_scanout),
 .l1clk(l1clk),
 .din  ({fguselect_d[1:0],twocycle0_stall,twocycle1_stall}),
 .dout ({dec_fgu_sel_e[1:0],twocycle0_stall_e,twocycle1_stall_e}),
  .siclk(siclk),
  .soclk(soclk)
);


// 0in value -var {dec_lsu_sel0_e,dec_lsu_sel1_e} -val 0 1 2 -message "{dec_lsu_sel0_e,dec_lsu_sel1_e} are mutually exclusive"

// can be off a flop if needed for timing
assign dec_lsu_sel0_e = decode_lsu0_e | twocycle0_stall_e;
assign dec_lsu_sel1_e = decode_lsu1_e | twocycle1_stall_e;

// put a little logic on the pstate_am signals (more flops if it doesn't make timing)
assign pstate_am_in[1:0] = { |(tlu_pstate_am[7:4] & pick1_d[3:0]), |(tlu_pstate_am[3:0] & pick0_d[3:0]) };


assign rs1_addr0_d       =  decode_lsu0_d &  casa_or_pst_d;
assign rs1_addr1_d       =  decode_lsu1_d &  casa_or_pst_d;
       
assign lsu_sel0_lower_d  =  decode_lsu0_d & ~casa_or_pst_d;
assign lsu_sel1_lower_d  =  decode_lsu1_d & ~casa_or_pst_d;


// quiet down these selects by using decode_lsu

assign lsu_sel0_upper_d  =  decode_lsu0_d & ~casa_or_pst_d & ~pstate_am_in[0];
assign lsu_sel1_upper_d  =  decode_lsu1_d & ~casa_or_pst_d & ~pstate_am_in[1];
       
assign rs1_addr0_upper_d =  decode_lsu0_d &  casa_or_pst_d & ~pstate_am_in[0];
assign rs1_addr1_upper_d =  decode_lsu1_d &  casa_or_pst_d & ~pstate_am_in[1];


// flop the selects to the exu for timing

dec_del_ctl_msff_ctl_macro__width_8 exuself  (
 .scan_in(exuself_scanin),
 .scan_out(exuself_scanout),
 .l1clk(l1clk),
 .din  ({ rs1_addr0_d, rs1_addr1_d, lsu_sel0_lower_d, lsu_sel1_lower_d, 
		lsu_sel0_upper_d, lsu_sel1_upper_d, rs1_addr0_upper_d, rs1_addr1_upper_d}),

 .dout ({ dec_rs1_addr0_e, dec_rs1_addr1_e, dec_lsu_sel0_lower_e, dec_lsu_sel1_lower_e, 
		dec_lsu_sel0_upper_e, dec_lsu_sel1_upper_e, dec_rs1_addr0_upper_e, dec_rs1_addr1_upper_e}),
  .siclk(siclk),
  .soclk(soclk)
);


// next 4 must be mutually exclusive (but not 1-hot)

// 0in value -var {dec_rs1_addr0_e,dec_rs1_addr1_e,dec_lsu_sel0_lower_e,dec_lsu_sel1_lower_e} -val 0 1 2 4 8 -message "{dec_rs1_addr0_e,dec_rs1_addr1_e,dec_lsu_sel0_lower_e,dec_lsu_sel1_lower_e} are mutually exclusive"

// next 4 are mutually exclusive (but not 1-hot)

// 0in value -var {dec_lsu_sel0_upper_e,dec_lsu_sel1_upper_e,dec_rs1_addr0_upper_e,dec_rs1_addr1_upper_e} -val 0 1 2 4 8 -message "{dec_lsu_sel0_upper_e,dec_lsu_sel1_upper_e,dec_rs1_addr0_upper_e,dec_rs1_addr1_upper_e} are mutually exclusive"



dec_del_ctl_msff_ctl_macro__width_2 tgselm_f  (
 .scan_in(tgselm_f_scanin),
 .scan_out(tgselm_f_scanout),
 .l1clk(l1clk),
 .din  (dec_fgu_sel_e[1:0]),
 .dout (dec_fgu_sel_m[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// generate interface needed by the fgu

assign store_float[0] = fsrc0_rd_d & fgu0_d;
assign store_float[1] = fsrc1_rd_d & fgu1_d;

// remap the integer destinations

assign i0_rd[4:0] = dec_inst0_raw_rd_d[4:0];
assign i1_rd[4:0] = dec_inst1_raw_rd_d[4:0];

assign i0_rd_remap_d[4:0] = ({5{idest0_d}} & {i0_rd[4] ^ (i0_rd[3] & (ded_oddwin0_d ^ dcd_save_restore_d[0])), i0_rd[3:0]}) |
		            ({5{~idest0_d}} & i0_rd[4:0]);

assign i1_rd_remap_d[4:0] = ({5{idest1_d}} & {i1_rd[4] ^ (i1_rd[3] & (ded_oddwin1_d ^ dcd_save_restore_d[1])), i1_rd[3:0]}) |
		            ({5{~idest1_d}} & i1_rd[4:0]);

assign dec_irf_w_addr_d[4:0] = ({5{fgusel0_d}} & i0_rd_remap_d[4:0]) |
		               ({5{~fgusel0_d}} & i1_rd_remap_d[4:0]);

// munge the address to always be double precision for fgu sources, dest
assign f0_rs1[4:0] = ({5{dcd_fp_rs1_single_d[0]}} & {1'b0,dec_inst0_rs1_d[4:1]}) |
		     ({5{~dcd_fp_rs1_single_d[0]}} & {dec_inst0_rs1_d[0],dec_inst0_rs1_d[4:1]});

assign f0_rs2[4:0] = ({5{dcd_fp_rs2_single_d[0]}} & {1'b0,dec_inst0_rs2_d[4:1]}) |
		     ({5{~dcd_fp_rs2_single_d[0]}} & {dec_inst0_rs2_d[0],dec_inst0_rs2_d[4:1]});

assign f0_rd[4:0] = ({5{dcd_fpdest_single_d[0]}} & {1'b0,dec_inst0_raw_rd_d[4:1]}) |
		    ({5{~dcd_fpdest_single_d[0]}} & {dec_inst0_raw_rd_d[0],dec_inst0_raw_rd_d[4:1]});

assign f1_rs1[4:0] = ({5{dcd_fp_rs1_single_d[1]}} & {1'b0,dec_inst1_rs1_d[4:1]}) |
		     ({5{~dcd_fp_rs1_single_d[1]}} & {dec_inst1_rs1_d[0],dec_inst1_rs1_d[4:1]});

assign f1_rs2[4:0] = ({5{dcd_fp_rs2_single_d[1]}} & {1'b0,dec_inst1_rs2_d[4:1]}) |
		     ({5{~dcd_fp_rs2_single_d[1]}} & {dec_inst1_rs2_d[0],dec_inst1_rs2_d[4:1]});

assign f1_rd[4:0] = ({5{dcd_fpdest_single_d[1]}} & {1'b0,dec_inst1_raw_rd_d[4:1]}) |
		    ({5{~dcd_fpdest_single_d[1]}} & {dec_inst1_raw_rd_d[0],dec_inst1_raw_rd_d[4:1]});



assign dec_frf_r1_addr_d[4:0] = ({5{fgusel0_d}} & f0_rs1[4:0]) |
				({5{~fgusel0_d}} & f1_rs1[4:0]);

assign inst0_rs2[4:0] = ({5{store_float[0]}} & f0_rd[4:0]) |
			({5{~store_float[0]}} & f0_rs2[4:0]);

assign inst1_rs2[4:0] = ({5{store_float[1]}} & f1_rd[4:0]) |
			({5{~store_float[1]}} & f1_rs2[4:0]);

assign dec_frf_r2_addr_d[4:0] = ({5{block_store_stall}} & block_store_rd[4:0]) |
				({5{~block_store_stall & pdistblock_d}} & pdist_rd[4:0]) |
				({5{~block_store_stall & fgusel0_d & ~pdistblock_d}} & inst0_rs2[4:0]) |
				({5{~block_store_stall & ~fgusel0_d & ~pdistblock_d}} & inst1_rs2[4:0]);
				
// Flop for LSU
dec_del_ctl_msff_ctl_macro__width_2 frf_r2addre_f  (
 .scan_in(frf_r2addre_f_scanin),
 .scan_out(frf_r2addre_f_scanout),
 .l1clk(l1clk),
 .din  (dec_frf_r2_addr_d[4:3]),
 .dout (dec_frf_r2_addr_e[4:3]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_frf_w_addr_d[4:0] = ({5{ fgusel0_d}} & f0_rd[4:0]) |
			       ({5{~fgusel0_d}} & f1_rd[4:0]);

assign dec_frf_r1_vld_d = ((fgu0_d & dec_decode0_d & fgusel0_d & dcd_fsrc_rs1_d[0]) |
			   (fgu1_d & dec_decode1_d & ~fgusel0_d & dcd_fsrc_rs1_d[1])) & ~pdistblock_d & ~block_store_stall;

assign dec_frf_r2_vld_d = (fgu0_d & dec_decode0_d & fgusel0_d & (dcd_fsrc_rs2_d[0] | store_float[0])) | 
			  (fgu1_d & dec_decode1_d & ~fgusel0_d & (dcd_fsrc_rs2_d[1] | store_float[1])) |
			   pdistblock_d | block_store_stall;

assign dec_frf_w_vld_d =  ( fgusel0_d & (fdest0_d & ~pdistblock_d)) |
			  (~fgusel0_d & (fdest1_d & ~pdistblock_d));

assign dec_frf_r1_32b_d = ( fgusel0_d & dcd_fp_rs1_single_d[0]) |
		          (~fgusel0_d & dcd_fp_rs1_single_d[1]);

assign dec_frf_r2_32b_d = ( fgusel0_d & dcd_fp_rs2_single_d[0] & ~pdistblock_d & ~block_store_stall) |
		          (~fgusel0_d & dcd_fp_rs2_single_d[1] & ~pdistblock_d & ~block_store_stall);

assign dec_frf_r1_odd32b_d = ( fgusel0_d & dcd_fp_rs1_single_d[0] & dec_inst0_rs1_d[0]) |
			     (~fgusel0_d & dcd_fp_rs1_single_d[1] & dec_inst1_rs1_d[0]);

// before the munge
assign inst0_rs2_raw_bit0 = (store_float[0] & dec_inst0_raw_rd_d[0]) |
			    (~store_float[0] & dec_inst0_rs2_d[0]);

assign inst1_rs2_raw_bit0 = (store_float[1] & dec_inst1_raw_rd_d[0]) |
			    (~store_float[1] & dec_inst1_rs2_d[0]);

assign dec_frf_r2_odd32b_d = (fgusel0_d & dcd_fp_rs2_single_d[0] & inst0_rs2_raw_bit0 & ~pdistblock_d & ~block_store_stall) |
			      (~fgusel0_d & dcd_fp_rs2_single_d[1] & inst1_rs2_raw_bit0 & ~pdistblock_d & ~block_store_stall);

assign dec_frf_w_32b_d = (fgusel0_d & dcd_fpdest_single_d[0]) |
			 (~fgusel0_d & dcd_fpdest_single_d[1]);

assign dec_frf_w_odd32b_d = (fgusel0_d & dcd_fpdest_single_d[0] & dec_inst0_raw_rd_d[0]) |
			    (~fgusel0_d & dcd_fpdest_single_d[1] & dec_inst1_raw_rd_d[0]);

assign dec_exu_src_vld_d = (fgusel0_d & dcd_exu_src_d[0] & ~pdistblock_d & ~block_store_stall) |
			  (~fgusel0_d & dcd_exu_src_d[1] & ~pdistblock_d & ~block_store_stall); 

assign dec_frf_store_d = (fgusel0_d & store_float[0] & ~pdistblock_d) |
			 (~fgusel0_d & store_float[1] & ~pdistblock_d) |
			 block_store_stall; 

assign fsr_store0 =  dcd_store_d[0] & dcd_fsrsync_d[0];
assign fsr_store1 =  dcd_store_d[1] & dcd_fsrsync_d[1];

assign dec_fsr_store_d = (fgusel0_d & fsr_store0 & ~pdistblock_d & ~block_store_stall) |
			  (~fgusel0_d & fsr_store1 & ~pdistblock_d & ~block_store_stall); 


assign dec_fgu_op3_d[5:0] = ({6{fgusel0_d}} & dec_inst0_op3_d[5:0]) |
			    ({6{~fgusel0_d}} & dec_inst1_op3_d[5:0]);

assign dec_fgu_opf_d[7:0] = ({8{fgusel0_d}} & dec_inst0_opf_d[7:0]) |
			    ({8{~fgusel0_d}} & dec_inst1_opf_d[7:0]);


// dont fire if a lsu op unless it is a store-float (including stfsr)
// harden for illegals
assign dec_fgu_decode_d = (dec_decode0_d & fgusel0_d & fgu0_d & ~(lsu0_d & ~fgu0_d)) |
		          (dec_decode1_d & ~fgusel0_d & fgu1_d & ~(lsu1_d & ~fgu1_d)) |
			   block_store_stall;
// .i 4
// .o 2
// .ilb p[3] p[2] p[1] p[0]
// .ob tid[1] tid[0]
// .type fr
// 0001 00
// 0010 01
// 0100 10
// 1000 11

assign tid0_d[1] = ~pick0_d[1] & ~pick0_d[0];
assign tid0_d[0] = ~pick0_d[2] & ~pick0_d[0];

assign tid1_d[1] = ~pick1_d[1] & ~pick1_d[0];
assign tid1_d[0] = ~pick1_d[2] & ~pick1_d[0];

assign dec_tid0_d[1:0] = tid0_d[1:0];
assign dec_tid1_d[1:0] = tid1_d[1:0];

assign dec_fgu_tid_d[2:0] = ({3{block_store_stall}} & block_store_tid[2:0]) |
			    ({3{~block_store_stall &  pdistblock_d}} & pdist_tid[2:0]) |
		            ({3{~block_store_stall &  fgusel0_d & ~pdistblock_d}} & {1'b0,tid0_d[1:0]}) |
			    ({3{~block_store_stall & ~fgusel0_d & ~pdistblock_d}} & {1'b1,tid1_d[1:0]});

// 0in value -var pku_flush_f1[7:0] -val 0 1 2 4 8 16 32 64 128 
// 0in value -var pku_flush_f2[7:0] -val 0 1 2 4 8 16 32 64 128 
// 0in value -var pku_flush_lm[7:0] -val 0 1 2 4 8 16 32 64 128 
// 0in value -var pku_flush_lb[7:0] -val 0 1 2 4 8 16 32 64 128 

assign dec_flush_f1 = |pku_flush_f1[7:0];
assign dec_flush_f2 = |pku_flush_f2[7:0];

// Must flush lsu instructions which cause fp_disabled or priv or hpriv exc
assign dec_flush_lm = (|pku_flush_lm[7:0]) | flush_lexc_m;
assign dec_flush_lb = |pku_flush_lb[7:0];

// 0in value -var pku_flush_m[7:4] -val 0 1 2 4 8 
// 0in value -var pku_flush_m[3:0] -val 0 1 2 4 8 

assign dec_flush_m[1] = |pku_flush_m[7:4];
assign dec_flush_m[0] = |pku_flush_m[3:0];

// 0in value -var pku_flush_b[7:4] -val 0 1 2 4 8 
// 0in value -var pku_flush_b[3:0] -val 0 1 2 4 8 

assign dec_flush_b[1] = |pku_flush_b[7:4];
assign dec_flush_b[0] = |pku_flush_b[3:0];


dec_del_ctl_msff_ctl_macro__width_2 ifetch_err_f  (
 .scan_in(ifetch_err_f_scanin),
 .scan_out(ifetch_err_f_scanout),
 .l1clk(l1clk),
 .din  (ded_ferr_p[1:0]),
 .dout (ifetch_err_d[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_2 ifetcherr_f  (
 .scan_in(ifetcherr_f_scanin),
 .scan_out(ifetcherr_f_scanout),
 .l1clk(l1clk),
 .din  (ifetch_err_d[1:0]),
 .dout (ifetch_err_e[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);
			

assign true_valid_d[0] = ~illegal_d[0] & ~priv_exc_d[0] & ~hpriv_exc_d[0] & ~fpdisable_exc_d[0] & ~icdp_perr_d[0] & ~ifetch_err_d[0];
assign true_valid_d[1] = ~illegal_d[1] & ~priv_exc_d[1] & ~hpriv_exc_d[1] & ~fpdisable_exc_d[1] & ~icdp_perr_d[1] & ~ifetch_err_d[1];

// don't let exceptions into the machine
dec_del_ctl_msff_ctl_macro__width_2 truevalid_f  (
 .scan_in(truevalid_f_scanin),
 .scan_out(truevalid_f_scanout),
 .l1clk(l1clk),
 .din  (true_valid_d[1:0]),
 .dout (dec_true_valid_e[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// pmu eco; dont qualify valids with ifetch_err[1:0] so itlb misses will be counted
assign illegal0_pmu_d = (~legal_d[0] | (dcd_wrtick_d[0] & ~hpriv_d[0])) & ~ifetch_err_d[0];  // add this to gates, missing
assign illegal1_pmu_d = (~legal_d[1] | (dcd_wrtick_d[1] & ~hpriv_d[1])) & ~ifetch_err_d[1];


// write tick in priv mode then it is illegal_instruction trap
assign illegal_pmu_d[1:0] = {dec_decode1_d & illegal1_pmu_d, 
		   	     dec_decode0_d & illegal0_pmu_d};

assign priv_exc_pmu_d[1:0] =  {dec_decode1_d & ~ifetch_err_d[1] & ((dcd_priv_d[1] & ~priv_d[1] & ~hpriv_d[1]) | (dcd_wrtick_d[1] & ~priv_d[1] & ~hpriv_d[1])), 
			       dec_decode0_d & ~ifetch_err_d[0] & ((dcd_priv_d[0] & ~priv_d[0] & ~hpriv_d[0]) | (dcd_wrtick_d[0] & ~priv_d[0] & ~hpriv_d[0]))};

assign hpriv_exc_pmu_d[1:0] =  {dec_decode1_d & dcd_hpr_d[1] & ~hpriv_d[1], 
                                dec_decode0_d & dcd_hpr_d[0] & ~hpriv_d[0]};


assign fpdisable_exc_pmu_d[1:0] =    {dec_decode1_d & dcd_fpdisable_d[1] & fpdis_d[1], 
	 		              dec_decode0_d & dcd_fpdisable_d[0] & fpdis_d[0]};

assign pmu_valid_d[0] = ~illegal_pmu_d[0] & ~priv_exc_pmu_d[0] & ~hpriv_exc_pmu_d[0] & ~fpdisable_exc_pmu_d[0] & ~icdp_perr_d[0];

assign pmu_valid_d[1] = ~illegal_pmu_d[1] & ~priv_exc_pmu_d[1] & ~hpriv_exc_pmu_d[1] & ~fpdisable_exc_pmu_d[1] & ~icdp_perr_d[1];

// use spare flops (see above)

assign dec_pmu_valid_e[0] = valid_e[0] & pmu_valid_e[0];
assign dec_pmu_valid_e[1] = valid_e[1] & pmu_valid_e[1];
// end pmu eco

// 0in value -var pku_valid_e[7:4] -val 0 1 2 4 8 
// 0in value -var pku_valid_e[3:0] -val 0 1 2 4 8 

assign valid_e[0] = |pku_valid_e[3:0];
assign valid_e[1] = |pku_valid_e[7:4];

assign dec_valid_e[0] = valid_e[0] & dec_true_valid_e[0];
assign dec_valid_e[1] = valid_e[1] & dec_true_valid_e[1];

// Must send lsu_valid even when fpdisabled or priv or hpriv excs
assign ls_valid_e[0] = valid_e[0] & ~illegal_e[0] &  ~icdp_perr_e[0] & ~ifetch_err_e[0];
assign ls_valid_e[1] = valid_e[1] & ~illegal_e[1] &  ~icdp_perr_e[1] & ~ifetch_err_e[1];

// never fire dec_fgu_valid_e for a lsu operation

// harden for illegals
assign decode_fgu0_d = dec_decode0_d & fgusel0_d & fgu0_d & ~lsu0_d & ~dcd_killfgu_d[0];
assign decode_fgu1_d = dec_decode1_d & ~fgusel0_d & fgu1_d & ~lsu1_d & ~dcd_killfgu_d[1];

dec_del_ctl_msff_ctl_macro__width_2 fgudec_f  (
 .scan_in(fgudec_f_scanin),
 .scan_out(fgudec_f_scanout),
 .l1clk(l1clk),
 .din  ({decode_fgu0_d,decode_fgu1_d}),
 .dout ({decode_fgu0_e,decode_fgu1_e}),
  .siclk(siclk),
  .soclk(soclk)
);

// fgu operation at e and it is not a lsu operation
assign dec_fgu_valid_e = (decode_fgu0_e & dec_valid_e[0]) |
			 (decode_fgu1_e & dec_valid_e[1]);

// harden for illegals
assign decode_lsu0_d = dec_decode0_d & lsusel0_d & lsu0_d;
assign decode_lsu1_d = dec_decode1_d & ~lsusel0_d & lsu1_d;

dec_del_ctl_msff_ctl_macro__width_2 lsudec_f  (
 .scan_in(lsudec_f_scanin),
 .scan_out(lsudec_f_scanout),
 .l1clk(l1clk),
 .din  ({decode_lsu0_d,decode_lsu1_d}),
 .dout ({decode_lsu0_e,decode_lsu1_e}),
  .siclk(siclk),
  .soclk(soclk)
);


// lsu interface

// this bug is no longer valid since we gate off all decodes for an illegal instruction
//   wrong! if a parity error is present it can appear to be illegal ... harden the logic

// bug fix
// if illegal is in TG0 and a valid load is in TG1, then ld_inst_d can fire for TG0 and be misinterpreted by TG1 
// this case is for different threads and both decode same cycle
// add lsusel0_d to eliminate this case

assign dec_ld_inst_d = 	(dec_decode0_d & lsusel0_d & dcd_load_d[0]) |
			(dec_decode1_d & ~lsusel0_d & dcd_load_d[1]);


assign st_inst_d = 	(lsusel0_d & dcd_store_d[0]) |
			(~lsusel0_d & dcd_store_d[1]);

assign fsr_ldst_d = (lsusel0_d & dcd_fsrsync_d[0]) |
	            (~lsusel0_d & dcd_fsrsync_d[1]); 


dec_del_ctl_msff_ctl_macro__width_3 ldste_f  (
 .scan_in(ldste_f_scanin),
 .scan_out(ldste_f_scanout),
 .l1clk(l1clk),
 .din  ({dec_ld_inst_d,st_inst_d,fsr_ldst_d}),
 .dout ({ld_inst_e,st_inst_e,fsr_ldst_e}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_ld_inst_e =  ld_inst_e & lsu_valid_e;
assign dec_st_inst_e =  st_inst_e & lsu_valid_e;
assign dec_fsr_ldst_e =  fsr_ldst_e;

assign fpldst_d = 	(lsusel0_d &  (load_float0_d | store_float0_d)) |
		   	(~lsusel0_d & (load_float1_d | store_float1_d));

assign lsdouble_d = 	(lsusel0_d &  (dcd_load_d[0] | dcd_store_d[0]) & dcd_lsdouble_d[0]) |
		   	(~lsusel0_d & (dcd_load_d[1] | dcd_store_d[1]) & dcd_lsdouble_d[1]);

assign prefetch_d = 	(lsusel0_d & dcd_prefetch_d[0]) |
			(~lsusel0_d & dcd_prefetch_d[1]);

assign flush_d = 	(lsusel0_d & dcd_flush_d[0]) |
			(~lsusel0_d & dcd_flush_d[1]);

assign memstbar_d = 	(lsusel0_d & dcd_memstbar_d[0]) |
			(~lsusel0_d & dcd_memstbar_d[1]);

assign pr_d = 		(lsusel0_d & dcd_pr_d[0]) |
			(~lsusel0_d & dcd_pr_d[1]);

assign hpr_d = 		(lsusel0_d & dcd_hpr_d[0]) |
			(~lsusel0_d & dcd_hpr_d[1]);

assign sr_d = 		(lsusel0_d & dcd_sr_d[0]) |
			(~lsusel0_d & dcd_sr_d[1]);

// finish the decode of partial store
assign pst_d = 		(lsusel0_d & dcd_stdfa_d[0] & (dec_inst0_opf_d[7:4]==4'b1100) & (dec_inst0_opf_d[2:1] != 2'b11)) |
			(~lsusel0_d & dcd_stdfa_d[1] & (dec_inst1_opf_d[7:4]==4'b1100) & (dec_inst1_opf_d[2:1] != 2'b11));

assign casa_d = 	(lsusel0_d & dcd_casa_d[0]) |
			(~lsusel0_d & dcd_casa_d[1]);

assign ldstub_d = 	(lsusel0_d & dcd_ldstub_d[0]) |
			(~lsusel0_d & dcd_ldstub_d[1]);

assign swap_d = 	(lsusel0_d & dcd_swap_d[0]) |
			(~lsusel0_d & dcd_swap_d[1]);

// how to code 0in to find potential issues with illegals

// 0in assert -var (~(lsusel0_d & ~(dcd_alt_d[0] | dcd_alti_d[0]) & dec_altspace_d)) -message "unexpected dec_altspace_d for TG0"

// 0in assert -var (~(~lsusel0_d & ~(dcd_alt_d[1] | dcd_alti_d[1]) & dec_altspace_d)) -message "unexpected dec_altspace_d for TG1"

// add lsusel0_d for illegal case
assign dec_altspace_d = (dec_decode0_d &  lsusel0_d & (dcd_alt_d[0] | dcd_alti_d[0])) |
			(dec_decode1_d & ~lsusel0_d & (dcd_alt_d[1] | dcd_alti_d[1]));

assign altspacei_d = 	(lsusel0_d & dcd_alt_d[0]) |
			(~lsusel0_d & dcd_alt_d[1]);

assign sign_ext_d =	(lsusel0_d & dcd_lsu_sign_ext_d[0]) |
			(~lsusel0_d & dcd_lsu_sign_ext_d[1]);

assign lsize_d[1:0] =   ({2{lsusel0_d}} & dcd_lsize0_d[1:0]) |
			({2{~lsusel0_d}} & dcd_lsize1_d[1:0]);
   
			
   
assign dec_imm_asi_vld_d = altspacei_d;

assign casa_or_pst_d = (casa_d | pst_d);

dec_del_ctl_msff_ctl_macro__width_14 ldme_f  (
 .scan_in(ldme_f_scanin),
 .scan_out(ldme_f_scanout),
 .l1clk(l1clk),
 .din  ({ 	fpldst_d, lsdouble_d, prefetch_d, flush_d,
		memstbar_d, hpr_d, pr_d, sr_d, casa_d, ldstub_d, 
		swap_d, sign_ext_d, lsize_d[1:0]
	}),
 .dout  ({ 	fpldst_e, lsdouble_e, prefetch_e, flush_e,
		memstbar_e, hpr_e, pr_e, sr_e, casa_e, ldstub_e, 
		swap_e, sign_ext_e, lsize_e[1:0] 
	}),
  .siclk(siclk),
  .soclk(soclk)
);

// These don't need to be qualified.  They'll be used to qualify
// a valid load or store.  ML 10-26-04
assign dec_hpr_inst_e = hpr_e;
assign dec_pr_inst_e = pr_e;
assign dec_sr_inst_e = sr_e;
assign dec_ldst_sz_e[1:0] = lsize_e[1:0];
assign dec_ldst_dbl_e = lsdouble_e;
assign dec_casa_inst_e = casa_e;
assign dec_ldstub_inst_e = ldstub_e;
assign dec_swap_inst_e = swap_e;
assign dec_sign_ext_e = sign_ext_e;
assign dec_pref_inst_e = prefetch_e;
   
assign dec_fpldst_inst_e = fpldst_e & lsu_valid_e;
assign dec_flush_inst_e = flush_e & lsu_valid_e;
assign dec_memstbar_inst_e = memstbar_e & lsu_valid_e;

assign dec_imm_asi_d[7:0] =  	({8{lsusel0_d}} & dec_inst0_opf_d[7:0]) |
				({8{~lsusel0_d}} & dec_inst1_opf_d[7:0]);

assign sraddr_d[4:0] = 	({5{lsusel0_d}} & dec_inst0_rs1_d[4:0]) |
			({5{~lsusel0_d}} & dec_inst1_rs1_d[4:0]);

dec_del_ctl_msff_ctl_macro__width_5 sraddr_f  (
 .scan_in(sraddr_f_scanin),
 .scan_out(sraddr_f_scanout),
 .l1clk(l1clk),
 .din  (sraddr_d[4:0]),
 .dout (sraddr_e[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);
			
assign dec_sraddr_e[4:0] = sraddr_e[4:0];


// lsu has valid operation at e stage (take annul into account)
assign dec_lsu_tid0_d[1:0] = tid0_d[1:0];
assign dec_lsu_tid1_d[1:0] = tid1_d[1:0];
assign dec_lsu_tg_d = ~(~lfavor_real & lsu0_d & dec_valid0_d | (lfavor_real & ~(lsu1_d & dec_valid1_d)));


assign lsu_rd0_msb = (idest0_d & (dec_inst0_raw_rd_d[4] ^ (dec_inst0_raw_rd_d[3] & ded_oddwin0_d))) |
		     (~idest0_d & dec_inst0_raw_rd_d[4]);

assign lsu_rd1_msb = (idest1_d & (dec_inst1_raw_rd_d[4] ^ (dec_inst1_raw_rd_d[3] & ded_oddwin1_d))) |
		     (~idest1_d & dec_inst1_raw_rd_d[4]);

assign lsu_rd_d[4:0] = ({5{lsusel0_d}} & {lsu_rd0_msb,dec_inst0_raw_rd_d[3:0]}) |
		       ({5{~lsusel0_d}} & {lsu_rd1_msb,dec_inst1_raw_rd_d[3:0]}); 

dec_del_ctl_msff_ctl_macro__width_5 lsurd_f  (
 .scan_in(lsurd_f_scanin),
 .scan_out(lsurd_f_scanout),
 .l1clk(l1clk),
 .din  (lsu_rd_d[4:0]),
 .dout (lsu_rd_e[4:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// decode_lsu0_e, decode_lsu1_e are hardened for illegal cases
assign lsu_valid_e = (decode_lsu0_e & ls_valid_e[0]) |
	             (decode_lsu1_e & ls_valid_e[1]);

assign dec_lsu_rd_e[4:0] = lsu_rd_e[4:0];

// end lsu interface

assign ds_m_in[1:0] = { |pku_ds_e[7:4], |pku_ds_e[3:0]  } & ~ifetch_err_e[1:0];

dec_del_ctl_msff_ctl_macro__width_2 ds_m  (
 .scan_in(ds_m_scanin),
 .scan_out(ds_m_scanout),
 .l1clk(l1clk),
 .din  (ds_m_in[1:0]),
 .dout (dec_ds_m[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign annul_ds_dcti_e[7:4] = ({4{~br_taken_e[1]}} & pku_annul_ds_dcti_brtaken0_e[7:4]) |
			      ({4{ br_taken_e[1]}} & pku_annul_ds_dcti_brtaken1_e[7:4]);

assign annul_ds_dcti_e[3:0] = ({4{~br_taken_e[0]}} & pku_annul_ds_dcti_brtaken0_e[3:0]) |
			      ({4{ br_taken_e[0]}} & pku_annul_ds_dcti_brtaken1_e[3:0]);

assign annul_ds_m_in[1:0] = { |annul_ds_dcti_e[7:4], |annul_ds_dcti_e[3:0] } & ~ifetch_err_e[1:0];

dec_del_ctl_msff_ctl_macro__width_2 annul_m  (
 .scan_in(annul_m_scanin),
 .scan_out(annul_m_scanout),
 .l1clk(l1clk),
 .din  (annul_ds_m_in[1:0]),
 .dout (dec_annul_ds_m[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_4 tid_e  (
 .scan_in(tid_e_scanin),
 .scan_out(tid_e_scanout),
 .l1clk(l1clk),
 .din  ({tid1_d[1:0],tid0_d[1:0]}),
 .dout ({tid1_e[1:0],tid0_e[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_4 tid_m  (
 .scan_in(tid_m_scanin),
 .scan_out(tid_m_scanout),
 .l1clk(l1clk),
 .din  ({tid1_e[1:0],tid0_e[1:0]}),
 .dout ({dec_tid1_m[1:0],dec_tid0_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_2 dec_e  (
 .scan_in(dec_e_scanin),
 .scan_out(dec_e_scanout),
 .l1clk(l1clk),
 .din  ({dec_decode1_d,dec_decode0_d}),
 .dout ({decode1_raw_e,decode0_raw_e}),
  .siclk(siclk),
  .soclk(soclk)
);

// send illegals to trap unit
assign decode1_e = decode1_raw_e & valid_e[1];
assign decode0_e = decode0_raw_e & valid_e[0];

dec_del_ctl_msff_ctl_macro__width_2 dec_m  (
 .scan_in(dec_m_scanin),
 .scan_out(dec_m_scanout),
 .l1clk(l1clk),
 .din  ({decode1_e,decode0_e}),
 .dout (inst_valid_m[1:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_inst_valid_m[1:0] = { ~dec_flush_m[1] & inst_valid_m[1],
				 ~dec_flush_m[0] & inst_valid_m[0] };

assign store_float0_d = lsu0_d & fgu0_d;  	// only store-floats have both lsu and fgu asserted
assign load_float0_d = lsu0_d & fdest0_d; // load-float only has lsu asserted along with fdest

assign store_float1_d = lsu1_d & fgu1_d;
assign load_float1_d = lsu1_d & fdest1_d;

// fire this for all lsu ops and store-float
assign is_lsu1_d = lsu1_d & ~ifetch_err_d[1];
assign is_lsu0_d = lsu0_d & ~ifetch_err_d[0];

// fire this for all fgu ops and store-float
assign is_fgu1_d = fgu1_d & ~ifetch_err_d[1];
assign is_fgu0_d = fgu0_d & ~ifetch_err_d[0];


assign cti_d[1:0] = { 	dcd_callclass_d[1] | dcd_tcc_d[1] | dcd_specbr_d[1],
			dcd_callclass_d[0] | dcd_tcc_d[0] | dcd_specbr_d[0] };

dec_del_ctl_msff_ctl_macro__width_16 inst_e  (
 .scan_in(inst_e_scanin),
 .scan_out(inst_e_scanout),
 .l1clk(l1clk),
 .din  ({ded_exc1_d[4:0],ded_exc0_d[4:0],is_lsu1_d,is_lsu0_d,is_fgu1_d,is_fgu0_d,cti_d[1:0]}),
 .dout ({exc1_e[4:0],exc0_e[4:0],is_lsu_e[1:0],is_fgu_e[1:0],cti_e[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_16 inst_m  (
 .scan_in(inst_m_scanin),
 .scan_out(inst_m_scanout),
 .l1clk(l1clk),
 .din  ({exc1_e[4:0],exc0_e[4:0],is_lsu_e[1:0],is_fgu_e[1:0],cti_e[1:0]}),
 .dout ({exc1_m[4:0],exc0_m[4:0],dec_lsu_inst_m[1:0],dec_fgu_inst_m[1:0],dec_cti_inst_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_exc0_m[4:0] = exc0_m[4:0];
assign dec_exc1_m[4:0] = exc1_m[4:0];


assign flush_lexc_e= |((fpdisable_exc_e[1:0] | priv_exc_e[1:0] | hpriv_exc_e[1:0]) & is_lsu_e[1:0]);

dec_del_ctl_msff_ctl_macro__width_1 flush_lexc_f  (
 .scan_in(flush_lexc_f_scanin),
 .scan_out(flush_lexc_f_scanout),
 .l1clk(l1clk),
 .din  (flush_lexc_e),
 .dout (flush_lexc_m),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_12 illegal_priv_m  (
 .scan_in(illegal_priv_m_scanin),
 .scan_out(illegal_priv_m_scanout),
 .l1clk(l1clk),
 .din  ({illegal_e[1:0],priv_exc_e[1:0],hpriv_exc_e[1:0],fpdisable_exc_e[1:0],br_taken_e[1:0],icdp_perr_e[1:0]}),
 .dout ({illegal_inst_m[1:0],priv_exc_m[1:0],hpriv_exc_m[1:0],fpdisable_exc_m[1:0],br_taken_m[1:0],icdp_perr_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_illegal_inst_m[1:0] = { ~dec_flush_m[1] & illegal_inst_m[1],
			  	   ~dec_flush_m[0] & illegal_inst_m[0] };

assign dec_icache_perr_m[1:0] = { ~dec_flush_m[1] & icdp_perr_m[1],
			          ~dec_flush_m[0] & icdp_perr_m[0] };

assign dec_priv_exc_m[1:0] = { ~dec_flush_m[1] & priv_exc_m[1],
			       ~dec_flush_m[0] & priv_exc_m[0] };

assign dec_hpriv_exc_m[1:0] = { ~dec_flush_m[1] & hpriv_exc_m[1],
			        ~dec_flush_m[0] & hpriv_exc_m[0] };

assign dec_fpdisable_exc_m[1:0] = { ~dec_flush_m[1] & fpdisable_exc_m[1],
			            ~dec_flush_m[0] & fpdisable_exc_m[0] };

assign dec_br_taken_m[1:0] = { ~dec_flush_m[1] & br_taken_m[1],
			       ~dec_flush_m[0] & br_taken_m[0] };


assign done_d[1:0] = dcd_done_d[1:0] &   ~ifetch_err_d[1:0];
assign retry_d[1:0] = dcd_retry_d[1:0] & ~ifetch_err_d[1:0];
assign sir_d[1:0] = dcd_sir_d[1:0] &     ~ifetch_err_d[1:0];

dec_del_ctl_msff_ctl_macro__width_6 done_retry_e  (
 .scan_in(done_retry_e_scanin),
 .scan_out(done_retry_e_scanout),
 .l1clk(l1clk),
 .din  ({done_d[1:0],retry_d[1:0],sir_d[1:0]}),
 .dout ({done_e[1:0],retry_e[1:0],sir_e[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

dec_del_ctl_msff_ctl_macro__width_6 done_retry_m  (
 .scan_in(done_retry_m_scanin),
 .scan_out(done_retry_m_scanout),
 .l1clk(l1clk),
 .din  ({done_e[1:0],retry_e[1:0],sir_e[1:0]}),
 .dout ({done_inst_m[1:0],retry_inst_m[1:0],sir_inst_m[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_done_inst_m[1:0] = { ~dec_flush_m[1] & done_inst_m[1],
			        ~dec_flush_m[0] & done_inst_m[0] };

assign dec_retry_inst_m[1:0] = { ~dec_flush_m[1] & retry_inst_m[1],
			         ~dec_flush_m[0] & retry_inst_m[0] };

assign dec_sir_inst_m[1:0] = { ~dec_flush_m[1] & sir_inst_m[1],
			       ~dec_flush_m[0] & sir_inst_m[0] };

// encodings for ded_exc0_d[4:0], ded_exc1_d[4:0]

/////////////////////////////////////////////////////////////////
// no exception                  = 00000                       //
// tlb_miss (non-real)           = 00001   E                   //
// tlb_access_violation          = 00010   E                   //
// VA hole exception             = 00011   E                   //
// tlb real miss                 = 00100   E                   //
// L2 MISS (for PMU)             = 00101                       //
// IC MISS (for PMU)             = 00110                       //
// ITLB tag parity error         = 00111   E                   //
// ITLB data parity error        = 11111   E                   //
// ITLB multiple hit             = 01001   E                   //
// icache valid (parity error)   = 01010   E                   //
// icache tag parity error       = 01011   E                   //
// icache tag multiple hit       = 01100   E                   //
// icache data parity error      = 01101   E                   //
// icache L2 correctable error   = 01110                       //
// icache L2 uncorrectable error = 01111   E                   //
// icache L2 NotData error       = 10000   E                   //
// ITLB NFO excp                 = 10001   E                   //
// Real VA hole exception        = 10011   E                   //

/////////////////////////////////////////////////////////////////
// New codes added for fetching from I/O space that is not     //
// boot-rom area. Also added code points for l2_miss and errors//
// together to more accurately count l2_miss in PMU.           //
// The new codes were chosen in such a way to minimize         //
// changes to existing testbenches and testcases.              //

// L2 miss and correctable error = 11110                       //
// L2 miss and uncorrectable err = 10111   E                   //
// L2 miss and Notdata error     = 11000   E                   //
/////////////////////////////////////////////////////////////////


// pmu stuff
// {12 - valid; 11:10 - tid; 9:0 - {atomic, l2imiss, itmiss, icmiss, other, %sethi, store, load, FGU, branch}}

// pmu will use dec_valid_e[1:0] to qualify instructions; eliminate illegals

assign atomic_d[0] = dcd_casa_d[0] | dcd_ldstub_d[0] | dcd_swap_d[0];
assign atomic_d[1] = dcd_casa_d[1] | dcd_ldstub_d[1] | dcd_swap_d[1];

assign l2miss0_d   = 	(ded_exc0_d[4:0] == 5'b00101) | // l2miss
			(ded_exc0_d[4:0] == 5'b11110) | // l2 miss correctable error  
			(ded_exc0_d[4:0] == 5'b10111) | // l2 miss uncorrectable error  
			(ded_exc0_d[4:0] == 5'b11000);  // l2 miss not data error

assign l2miss1_d   = 	(ded_exc1_d[4:0] == 5'b00101) | // l2miss
			(ded_exc1_d[4:0] == 5'b11110) | // l2 miss correctable error  
			(ded_exc1_d[4:0] == 5'b10111) | // l2 miss uncorrectable error  
			(ded_exc1_d[4:0] == 5'b11000);  // l2 miss not data error


assign itlbmiss0_d = 	(ded_exc0_d[4:0] == 5'b00001) | // tlb miss non-real
			(ded_exc0_d[4:0] == 5'b00100);  // tlb miss real

assign itlbmiss1_d = 	(ded_exc1_d[4:0] == 5'b00001) | // tlb miss non-real
			(ded_exc1_d[4:0] == 5'b00100);  // tlb miss real

assign icmiss0_d   = 	(ded_exc0_d[4:0] == 5'b00110) |  // ic miss
			(ded_exc0_d[4:0] == 5'b01110) |	 // l2 correctable error
			(ded_exc0_d[4:0] == 5'b01111) |	 // l2 uncorrectable error
			(ded_exc0_d[4:0] == 5'b10000) |	 // l2 not data error
			(ded_exc0_d[4:0] == 5'b11110) |	 // l2 miss correctable error
			(ded_exc0_d[4:0] == 5'b10111) |	 // l2 miss uncorrectable error
			(ded_exc0_d[4:0] == 5'b11000) |	 // l2 miss notdata error
			(ded_exc0_d[4:0] == 5'b00101);	 // l2 miss

assign icmiss1_d   = 	(ded_exc1_d[4:0] == 5'b00110) |  // ic miss
			(ded_exc1_d[4:0] == 5'b01110) |	 // l2 correctable error
			(ded_exc1_d[4:0] == 5'b01111) |	 // l2 uncorrectable error
			(ded_exc1_d[4:0] == 5'b10000) |	 // l2 not data error
			(ded_exc1_d[4:0] == 5'b11110) |	 // l2 miss correctable error
			(ded_exc1_d[4:0] == 5'b10111) |	 // l2 miss uncorrectable error
			(ded_exc1_d[4:0] == 5'b11000) |	 // l2 miss notdata error
			(ded_exc1_d[4:0] == 5'b00101);	 // l2 miss



assign other0_d = ~(dcd_sethi_d[0] | dcd_store_d[0] | dcd_load_d[0] | dcd_specfp_d[0] | branch0_d);
assign other1_d = ~(dcd_sethi_d[1] | dcd_store_d[1] | dcd_load_d[1] | dcd_specfp_d[1] | branch1_d);

assign branch0_d = dcd_specbr_d[0] | dcd_callclass_d[0];
assign branch1_d = dcd_specbr_d[1] | dcd_callclass_d[1];

assign dec_instr0_type_d[9:0] = { atomic_d[0], l2miss0_d, itlbmiss0_d, icmiss0_d, other0_d, dcd_sethi_d[0], dcd_store_d[0], 
				  dcd_load_d[0], dcd_specfp_d[0], branch0_d };

assign dec_instr1_type_d[9:0] = { atomic_d[1], l2miss1_d, itlbmiss1_d, icmiss1_d, other1_d, dcd_sethi_d[1], dcd_store_d[1], 
			          dcd_load_d[1], dcd_specfp_d[1], branch1_d };

// power throttle

// por state is all all zeroes

dec_del_ctl_msff_ctl_macro__width_8 power_stall1f  (
 .scan_in(power_stall1f_scanin),
 .scan_out(power_stall1f_scanout),
 .l1clk(l1clk),
 .din  (power_stall_in[7:0]),
 .dout (power_stall[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);


dec_del_ctl_msff_ctl_macro__width_8 thread_activef  (
 .scan_in(thread_activef_scanin),
 .scan_out(thread_activef_scanout),
 .l1clk(l1clk),
 .din  (spc_core_running_status[7:0]),
 .dout (thread_active[7:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign del_tg_clken[1:0] = { (|thread_active[7:4]) | ~lsu_dec_pmen, (|thread_active[3:0]) | ~lsu_dec_pmen };

dec_del_ctl_msff_ctl_macro__width_3 power_throttle1f  (
 .scan_in(power_throttle1f_scanin),
 .scan_out(power_throttle1f_scanout),
 .l1clk(l1clk),
 .din  (power_throt0[2:0]),
 .dout (power_throttle1[2:0]),
  .siclk(siclk),
  .soclk(soclk)
);


// special synchronizer for taking in primary inputs to chip
cl_sc1_clksyncff_4x power_throttle02_f (
 .l1clk(l1clk), 
 .si(power_throttle02_f_scanin), 
 .so(power_throttle02_f_scanout),
 .d(power_throttle[2]), 
 .q(power_throttle0[2]),
  .siclk(siclk),
  .soclk(soclk)
);

cl_sc1_clksyncff_4x power_throttle01_f (
 .l1clk(l1clk), 
 .si(power_throttle01_f_scanin), 
 .so(power_throttle01_f_scanout),
 .d(power_throttle[1]), 
 .q(power_throttle0[1]),
  .siclk(siclk),
  .soclk(soclk) 
);

cl_sc1_clksyncff_4x power_throttle00_f (
 .l1clk(l1clk), 
 .si(power_throttle00_f_scanin), 
 .so(power_throttle00_f_scanout),
 .d(power_throttle[0]), 
 .q(power_throttle0[0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign power_throt0[2:0] = ~{3 {lb_lbist_running}} & power_throttle0[2:0];

//// dont use power_throttle_unsafe[]; avoid metastable issue
//msff_ctl_macro power_throttle_unsafef (width=3) (
// .scan_in(power_throttle_unsafef_scanin),
// .scan_out(power_throttle_unsafef_scanout),
// .l1clk(l1clk),
// .din  (power_throttle[2:0]),
// .dout (power_throttle_unsafe[2:0])
//);
//
//msff_ctl_macro power_throttle0f (width=3) (
// .scan_in(power_throttle0f_scanin),
// .scan_out(power_throttle0f_scanout),
// .l1clk(l1clk),
// .din  (power_throttle_unsafe[2:0]),
// .dout (power_throttle0[2:0])
//);



assign change_power_stall = (power_throt0[2:0] != power_throttle1[2:0]);

assign new_power_stall[7:0] = (  ({8{power_throt0[2:0]==3'b000}} & 8'b00000000) |
				 ({8{power_throt0[2:0]==3'b001}} & 8'b00000001) |
				 ({8{power_throt0[2:0]==3'b010}} & 8'b00010001) |
				 ({8{power_throt0[2:0]==3'b011}} & 8'b00100101) |
				 ({8{power_throt0[2:0]==3'b100}} & 8'b01010101) |
				 ({8{power_throt0[2:0]==3'b101}} & 8'b11011010) |
				 ({8{power_throt0[2:0]==3'b110}} & 8'b11101110) |
				 ({8{power_throt0[2:0]==3'b111}} & 8'b11111110)  );

assign power_stall_in[7:0] = ({8{change_power_stall}} & new_power_stall[7:0]) |
			     ({8{~change_power_stall}} & {power_stall[6:0],power_stall[7]});


supply0 vss;
supply1 vdd;

// fixscan start:
assign spares_scanin             = scan_in                  ;
assign pdecode0f_scanin          = spares_scanout           ;
assign pdecode1f_scanin          = pdecode0f_scanout        ;
assign pick0f_scanin             = pdecode1f_scanout        ;
assign pick1f_scanin             = pick0f_scanout           ;
assign privstatef_scanin         = pick1f_scanout           ;
assign fef_scanin                = privstatef_scanout       ;
assign instcntf_scanin           = fef_scanout              ;
assign exutestf_scanin           = instcntf_scanout         ;
assign teststallf_scanin         = exutestf_scanout         ;
assign val_df_scanin             = teststallf_scanout       ;
assign valid_df_scanin           = val_df_scanout           ;
assign dtlb_reloadf_scanin       = valid_df_scanout         ;
assign block_store0f_scanin      = dtlb_reloadf_scanout     ;
assign block_storef_scanin       = block_store0f_scanout    ;
assign block_store_rdhif_scanin  = block_storef_scanout     ;
assign block_store_rdlof_scanin  = block_store_rdhif_scanout;
assign block_store_tidf_scanin   = block_store_rdlof_scanout;
assign cpq_stallf_scanin         = block_store_tidf_scanout ;
assign fecc_stallf_scanin        = cpq_stallf_scanout       ;
assign block_resetf_scanin       = fecc_stallf_scanout      ;
assign block_store_e_scanin      = block_resetf_scanout     ;
assign block_store_m_scanin      = block_store_e_scanout    ;
assign block_store_b_scanin      = block_store_m_scanout    ;
assign lfavorf_scanin            = block_store_b_scanout    ;
assign ffavorf_scanin            = lfavorf_scanout          ;
assign sffavorf_scanin           = ffavorf_scanout          ;
assign mulrequestf_scanin        = sffavorf_scanout         ;
assign cmfavorf_scanin           = mulrequestf_scanout      ;
assign pdistblockf_scanin        = cmfavorf_scanout         ;
assign pdistrdf_scanin           = pdistblockf_scanout      ;
assign pdisttidf_scanin          = pdistrdf_scanout         ;
assign twocycle0_df_scanin       = pdisttidf_scanout        ;
assign twocycle1_df_scanin       = twocycle0_df_scanout     ;
assign inthole0_df_scanin        = twocycle1_df_scanout     ;
assign inthole1_df_scanin        = inthole0_df_scanout      ;
assign divstall_df_scanin        = inthole1_df_scanout      ;
assign windowstall_df_scanin     = divstall_df_scanout      ;
assign exu_clkenf_scanin         = windowstall_df_scanout   ;
assign legal_f_scanin            = exu_clkenf_scanout       ;
assign illegal_f_scanin          = legal_f_scanout          ;
assign fpdisable_exc_f_scanin    = illegal_f_scanout        ;
assign parity_err_f_scanin       = fpdisable_exc_f_scanout  ;
assign exc_f_scanin              = parity_err_f_scanout     ;
assign tgsel_f_scanin            = exc_f_scanout            ;
assign exuself_scanin            = tgsel_f_scanout          ;
assign tgselm_f_scanin           = exuself_scanout          ;
assign frf_r2addre_f_scanin      = tgselm_f_scanout         ;
assign ifetch_err_f_scanin       = frf_r2addre_f_scanout    ;
assign ifetcherr_f_scanin        = ifetch_err_f_scanout     ;
assign truevalid_f_scanin        = ifetcherr_f_scanout      ;
assign fgudec_f_scanin           = truevalid_f_scanout       ;
assign lsudec_f_scanin           = fgudec_f_scanout         ;
assign ldste_f_scanin            = lsudec_f_scanout         ;
assign ldme_f_scanin             = ldste_f_scanout          ;
assign sraddr_f_scanin           = ldme_f_scanout           ;
assign lsurd_f_scanin            = sraddr_f_scanout         ;
assign ds_m_scanin               = lsurd_f_scanout          ;
assign annul_m_scanin            = ds_m_scanout             ;
assign tid_e_scanin              = annul_m_scanout          ;
assign tid_m_scanin              = tid_e_scanout            ;
assign dec_e_scanin              = tid_m_scanout            ;
assign dec_m_scanin              = dec_e_scanout            ;
assign inst_e_scanin             = dec_m_scanout            ;
assign inst_m_scanin             = inst_e_scanout           ;
assign flush_lexc_f_scanin       = inst_m_scanout           ;
assign illegal_priv_m_scanin     = flush_lexc_f_scanout     ;
assign done_retry_e_scanin       = illegal_priv_m_scanout   ;
assign done_retry_m_scanin       = done_retry_e_scanout     ;
assign power_stall1f_scanin      = done_retry_m_scanout     ;
assign thread_activef_scanin     = power_stall1f_scanout    ;
assign power_throttle1f_scanin   = thread_activef_scanout   ;
assign power_throttle02_f_scanin = power_throttle1f_scanout ;        
assign power_throttle01_f_scanin = power_throttle02_f_scanout ;  // these connections must be done by hand
assign power_throttle00_f_scanin = power_throttle01_f_scanout ;
assign scan_out                  = power_throttle00_f_scanout ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module dec_del_ctl_l1clkhdr_ctl_macro (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module dec_del_ctl_spare_ctl_macro__flops_0__num_6;
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



endmodule






// any PARAMS parms go into naming of macro

module dec_del_ctl_msff_ctl_macro__scanreverse_1__width_6 (
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













// any PARAMS parms go into naming of macro

module dec_del_ctl_msff_ctl_macro__width_7 (
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

module dec_del_ctl_msff_ctl_macro__width_4 (
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

module dec_del_ctl_msff_ctl_macro__width_16 (
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

module dec_del_ctl_msff_ctl_macro__width_2 (
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

module dec_del_ctl_msff_ctl_macro__width_8 (
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

module dec_del_ctl_msff_ctl_macro__width_1 (
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

module dec_del_ctl_msff_ctl_macro__width_3 (
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

module dec_del_ctl_msff_ctl_macro__width_5 (
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

module dec_del_ctl_msff_ctl_macro__width_6 (
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

module dec_del_ctl_msff_ctl_macro__width_14 (
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

module dec_del_ctl_msff_ctl_macro__width_12 (
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








