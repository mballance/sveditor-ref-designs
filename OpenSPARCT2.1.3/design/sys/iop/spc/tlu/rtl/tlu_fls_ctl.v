// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_fls_ctl.v
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
module tlu_fls_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_tlu_pmen, 
  thread_group, 
  trl_shscanid, 
  tcu_core_running, 
  tcu_ss_mode, 
  tcu_do_mode, 
  tcu_ss_request, 
  cxi_xir, 
  cxi_ivt, 
  dec_raw_pick_p, 
  dec_tid_m, 
  dec_inst_valid_m, 
  dec_lsu_inst_m, 
  dec_fgu_inst_m, 
  dec_illegal_inst_m, 
  dec_exc_m, 
  dec_done_inst_m, 
  dec_retry_inst_m, 
  dec_sir_inst_m, 
  dec_hpriv_exc_m, 
  dec_priv_exc_m, 
  dec_fpdisable_exc_m, 
  dec_br_taken_m, 
  dec_annul_ds_m, 
  dec_ds_m, 
  dec_icache_perr_m, 
  dec_cti_inst_m, 
  dec_flush_b, 
  exu_ibp_m, 
  exu_tcc_m, 
  exu_tof_m, 
  exu_cecc_m, 
  exu_uecc_m, 
  exu_oor_va_m, 
  exu_misalign_m, 
  exu_spill_b, 
  exu_fill_m, 
  exu_normal_b, 
  exu_cleanwin_b, 
  exu_wstate_b, 
  exu_trap_number_b, 
  exu_cwp0, 
  exu_cwp1, 
  exu_cwp2, 
  exu_cwp3, 
  lsu_lddf_align_b, 
  lsu_stdf_align_b, 
  lsu_illegal_inst_b, 
  lsu_daccess_prot_b, 
  lsu_priv_action_b, 
  lsu_va_watchpoint_b, 
  lsu_pa_watchpoint_b, 
  lsu_align_b, 
  lsu_tlb_miss_b_, 
  lsu_dae_invalid_asi_b, 
  lsu_dae_nc_page_b, 
  lsu_dae_nfo_page_b, 
  lsu_dae_priv_viol_b, 
  lsu_dae_so_page, 
  lsu_priv_action_g, 
  lsu_tid_g, 
  lsu_trap_flush, 
  lsu_spec_enable, 
  lsu_tlb_bypass_b, 
  lsu_tlb_real_b, 
  lsu_sync_inst_b, 
  lsu_tlu_twocycle_m, 
  lsu_block_store_b, 
  lsu_dcl2u_err_g, 
  lsu_dcl2nd_err_g, 
  lsu_dcerr_tid_g, 
  lsu_sbdlc_err_g, 
  lsu_sbdlu_err_g, 
  lsu_sbapp_err_g, 
  lsu_sbdiou_err_g, 
  lsu_stberr_tid_g, 
  lsu_dttp_err_b, 
  lsu_dtdp_err_b, 
  lsu_dtmh_err_b, 
  lsu_perfmon_trap_b, 
  lsu_perfmon_trap_g, 
  lsu_immu_enable, 
  fgu_predict_fx2, 
  fgu_pdist_beat2_fx1, 
  fgu_cecc_fx2, 
  fgu_uecc_fx2, 
  fgu_fpx_ieee_trap_fw, 
  fgu_fpd_ieee_trap_fw, 
  fgu_fpx_unfin_fw, 
  fgu_fpd_unfin_fw, 
  fgu_fpd_idiv0_trap_fw, 
  fgu_fpx_trap_tid_fw, 
  fgu_fpd_trap_tid_fw, 
  asi_ece_exc, 
  asi_eue_exc, 
  asi_ecc_tid, 
  asi_irl_cleared, 
  asi_halt, 
  asi_decr, 
  asi_clear_spu_trap_req, 
  tel_tsacu_exc, 
  mmu_hw_tw_enable, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  mmu_asi_cecc, 
  mmu_asi_uecc, 
  mmu_asi_tid, 
  mmu_i_eccerr, 
  mmu_d_eccerr, 
  mmu_thr0_err_type_b1, 
  mmu_thr1_err_type_b1, 
  mmu_thr2_err_type_b1, 
  mmu_thr3_err_type_b1, 
  mmu_dae_req, 
  mmu_dae_tid, 
  spu_tlu_ma_int_req, 
  spu_tlu_cwq_int_req, 
  pmu_tlu_trap_m, 
  pmu_tlu_debug_event, 
  pct_iaw_exc_e, 
  pct_npc_0_w, 
  pct_npc_1_w, 
  pct_npc_2_w, 
  pct_npc_3_w, 
  pct_pc_oor_va_e, 
  flsx_flush_lsu_b, 
  flsx_flush_fgu_b, 
  trl_tl_eq_0, 
  trl_pil_mask_15, 
  trl_iln_exc, 
  trl_hstick_match, 
  trl_unhalt_, 
  trl_tlz_exc, 
  trl_nns_exc, 
  trl_ssc_exc, 
  trl_invalidate_pc, 
  trl_invalidate_npc, 
  trl_pc_sel_trap_pc, 
  trl_fls_npc_en, 
  trl_trap_taken, 
  trl_take_sma, 
  trl_take_cwq, 
  trl_take_xir, 
  trl_take_ftt, 
  trl_core_running_status, 
  trl_check_rqr, 
  tlu_ceter_de, 
  tlu_ceter_dhcce, 
  tsd_hpstate_ibe, 
  tsd_hpstate_hpriv, 
  tsd_hpstate_red, 
  tsd_pstate_tct, 
  tsd_pstate_priv, 
  tsd_pstate_ie, 
  tsd_pstate_am, 
  tsd_itlb_bypass, 
  tsd_mrqr_exc_, 
  tsd_dqr_exc_, 
  asi_check_qr_exc, 
  dfd_fls_desr_f, 
  dfd_fls_desr_s, 
  ras_precise_error, 
  ras_disrupting_error, 
  ras_deferred_error, 
  scan_out, 
  wmr_scan_out, 
  fls_spc_hardstop_request, 
  fls_spc_softstop_request, 
  fls_spc_trigger_pulse, 
  tlu_dbg_instr_cmt_grp, 
  tlu_flush_ifu, 
  tlu_flush_exu_b, 
  tlu_flush_lsu_b, 
  tlu_flush_fgu_b, 
  tlu_flush_pmu_b, 
  tlu_flush_pmu_w, 
  tlu_load_i_tag_access_p, 
  tlu_load_i_tag_access_n, 
  tlu_load_d_tag_access, 
  tlu_load_d_tag_access_r, 
  fls_flush_lsu_b, 
  fls_flush_fgu_b, 
  fls_pc_is_npc, 
  fls_tid_d, 
  fls_tid_dec_b, 
  fls_tid_dec_w, 
  fls_pc_sel_npc, 
  fls_pc_sel_npc_plus_4, 
  fls_npc_sel_npc_plus_4, 
  fls_npc_sel_npc_plus_8, 
  fls_npc_sel_target, 
  fls_npc_b_sel_npc, 
  fls_pstate_am_d_, 
  fls_pstate_am_b_, 
  fls_pstate_am_w_, 
  fls_lsu_inst_w, 
  fls_dfd_lsu_inst_b, 
  fls_wstate0, 
  fls_wstate1, 
  fls_wstate2, 
  fls_wstate3, 
  fls_tcc_number_0, 
  fls_tcc_number_1, 
  fls_tcc_number_2, 
  fls_tcc_number_3, 
  fls_tid_dec_w_in, 
  fls_por_request, 
  fls_xir_request, 
  fls_ivt_request, 
  fls_sir_request, 
  fls_itm_request, 
  fls_iln_request, 
  fls_hst_request, 
  fls_tlz_request, 
  fls_sma_request, 
  fls_cwq_request, 
  fls_ade_request, 
  fls_iae_request, 
  fls_ipe_request, 
  fls_ipv_request, 
  fls_inp_request, 
  fls_iar_request, 
  fls_irr_request, 
  fls_mar_request, 
  fls_mrr_request, 
  fls_pro_request, 
  fls_ill_request, 
  fls_don_request, 
  fls_ret_request, 
  fls_fpd_request, 
  fls_snn_request, 
  fls_sno_request, 
  fls_fnn_request, 
  fls_fno_request, 
  fls_clw_request, 
  fls_dtm_request, 
  fls_ldf_request, 
  fls_stf_request, 
  fls_dap_request, 
  fls_vaw_request, 
  fls_iaw_request, 
  fls_paw_request, 
  fls_maa_request, 
  fls_fpe_request, 
  fls_fei_request, 
  fls_fof_request, 
  fls_pra_request, 
  fls_dia_request, 
  fls_ups_request, 
  fls_dpv_request, 
  fls_dnc_request, 
  fls_dnf_request, 
  fls_dso_request, 
  fls_tof_request, 
  fls_dbz_request, 
  fls_tcc_request, 
  fls_dae_request, 
  fls_lsr_request, 
  fls_irt_request, 
  fls_drt_request, 
  fls_pmu_request, 
  fls_mqr_request, 
  fls_dqr_request, 
  fls_rqr_request, 
  fls_idl_request, 
  fls_res_request, 
  fls_ssr_request, 
  fls_ssc_request, 
  fls_nns_request, 
  fls_ime_request, 
  fls_dme_request, 
  fls_eer_request, 
  fls_icp_request, 
  fls_ftt_request, 
  fls_ibp_request, 
  fls_tct_request, 
  fls_ref_request, 
  fls_ipe_dme_request, 
  fls_pc_valid, 
  fls_load_dsfar, 
  fls_irf_cecc_b, 
  fls_irf_uecc_b, 
  fls_kill_irf_ecc_w, 
  fls_cwp0, 
  fls_cwp1, 
  fls_cwp2, 
  fls_cwp3, 
  fls_core_running, 
  fls_ss_request, 
  fls_pct_pc_en, 
  fls_pct_npc_en, 
  fls_trl_l1en, 
  fls_npc_if_cnt_eq_1_d, 
  fls_npc_if_cnt_eq_2_d, 
  fls_npc_if_cnt_eq_3_d, 
  fls_flush, 
  fls_disrupting_flush_w, 
  fls_f_cecc_w, 
  fls_f_uecc_w, 
  fls_ss_update_pc_w, 
  tlu_iht_request, 
  tlu_dht_request, 
  tlu_itlb_bypass_e, 
  tlu_tag_access_tid_b, 
  tlu_i_tag_access_b, 
  tlu_d_tag_access_b, 
  tlu_retry_state, 
  tlu_halted);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire beat_two_b_in;
wire l_tlu_twocycle_b;
wire fgu_inst_b;
wire beat_two_b_lat_scanin;
wire beat_two_b_lat_scanout;
wire beat_two_b;
wire pbeat_two_b;
wire beat_two_w;
wire exc_for_w;
wire l1en_b2w_in;
wire pre_inst_valid_b;
wire l1en_b2w;
wire [3:0] tid_dec_w;
wire [3:0] flush_gfb;
wire [3:0] m_dae_req_w;
wire [3:0] por_req;
wire [3:0] res_req;
wire [3:0] trap_flush;
wire [3:0] pdist_ecc_w;
wire [3:0] ssr_req;
wire [3:0] multicycle_nns_to_npc_w;
wire l1en_b2w_lat_scanin;
wire l1en_b2w_lat_scanout;
wire l1clk_pm1;
wire l1clk;
wire hpstate_hpriv_lat_scanin;
wire hpstate_hpriv_lat_scanout;
wire [3:0] hpstate_hpriv;
wire [3:0] hpriv_bar_or_ie_in;
wire hpriv_bar_or_ie_lat_scanin;
wire hpriv_bar_or_ie_lat_scanout;
wire [3:0] phpriv_bar_or_ie;
wire [3:0] hpriv_bar_or_ie_m;
wire [3:0] tid_dec_m;
wire [3:0] hpriv_bar_and_ie_in;
wire hpriv_bar_and_ie_lat_scanin;
wire hpriv_bar_and_ie_lat_scanout;
wire [3:0] hpriv_bar_and_ie;
wire [1:0] tid_p;
wire tid_dec_d_lat_scanin;
wire tid_dec_d_lat_scanout;
wire [1:0] tid_d;
wire [3:0] tid_dec_d;
wire itlb_bypass_lat_scanin;
wire itlb_bypass_lat_scanout;
wire [3:0] itlb_bypass;
wire itlb_bypass_d;
wire itlb_bypass_e_lat_scanin;
wire itlb_bypass_e_lat_scanout;
wire itlb_bypass_e;
wire l_tlu_twocycle_b_in;
wire l_tlu_twocycle_b_lat_scanin;
wire l_tlu_twocycle_b_lat_scanout;
wire [1:0] tid_m;
wire twocycle_inst_b;
wire [1:0] tid_b;
wire tid_b_lat_scanin;
wire tid_b_lat_scanout;
wire fast_tid_dec_b_lat_scanin;
wire fast_tid_dec_b_lat_scanout;
wire [3:0] fast_tid_dec_b;
wire inst_valid_m;
wire pre_inst_valid_b_lat_scanin;
wire pre_inst_valid_b_lat_scanout;
wire [3:0] tid_dec_b;
wire tl_eq_0_lat_scanin;
wire tl_eq_0_lat_scanout;
wire [3:0] tl_eq_0;
wire tl_eq_0_b;
wire inst_valid_b;
wire flush_b;
wire preflush_exu_b;
wire exception_for_w;
wire bsee_flush_b;
wire lsu_inst_m;
wire lsu_inst_b;
wire lsu_inst_b_lat_scanin;
wire lsu_inst_b_lat_scanout;
wire fgu_inst_m;
wire fgu_inst_b_lat_scanin;
wire fgu_inst_b_lat_scanout;
wire illegal_inst_b_in;
wire illegal_inst_b_lat_scanin;
wire illegal_inst_b_lat_scanout;
wire pillegal_inst_b;
wire illegal_inst_b;
wire illegal_sir_b;
wire illegal_done_inst_b;
wire illegal_retry_inst_b;
wire itlb_miss_m;
wire itlb_miss_b_lat_scanin;
wire itlb_miss_b_lat_scanout;
wire itlb_miss_b;
wire ra_itlb_miss_m;
wire ra_itlb_miss_b_lat_scanin;
wire ra_itlb_miss_b_lat_scanout;
wire ra_itlb_miss_b;
wire itlb_priv_exc_m;
wire itlb_priv_exc_b_lat_scanin;
wire itlb_priv_exc_b_lat_scanout;
wire itlb_priv_exc_b;
wire itlb_nfo_exc_m;
wire itlb_nfo_exc_b_lat_scanin;
wire itlb_nfo_exc_b_lat_scanout;
wire itlb_nfo_exc_b;
wire i_l2_unde_m;
wire i_l2_unde_b_lat_scanin;
wire i_l2_unde_b_lat_scanout;
wire i_l2_unde_b;
wire i_oor_va_m;
wire i_oor_va_b_lat_scanin;
wire i_oor_va_b_lat_scanout;
wire i_oor_va_b;
wire i_ra_oor_va_m;
wire i_ra_oor_va_b_lat_scanin;
wire i_ra_oor_va_b_lat_scanout;
wire i_ra_oor_va_b;
wire itlb_err_m;
wire itlb_err_b_lat_scanin;
wire itlb_err_b_lat_scanout;
wire itlb_err_b;
wire pre_icache_exc_m;
wire ic_err_m;
wire ic_err_b_lat_scanin;
wire ic_err_b_lat_scanout;
wire ic_err_b;
wire done_inst_b_in;
wire done_inst_b_lat_scanin;
wire done_inst_b_lat_scanout;
wire pdone_inst_b;
wire done_inst_b;
wire priv_exc_b;
wire retry_inst_b_in;
wire retry_inst_b_lat_scanin;
wire retry_inst_b_lat_scanout;
wire pretry_inst_b;
wire retry_inst_b;
wire sir_b_in;
wire sir_b_lat_scanin;
wire sir_b_lat_scanout;
wire psir_b;
wire in_hpriv_b;
wire sir_b;
wire hpriv_exc_b_in;
wire hpriv_exc_b_lat_scanin;
wire hpriv_exc_b_lat_scanout;
wire hpriv_exc_b;
wire priv_exc_b_in;
wire priv_exc_b_lat_scanin;
wire priv_exc_b_lat_scanout;
wire fpdisable_exc_b_in;
wire fpdisable_exc_b_lat_scanin;
wire fpdisable_exc_b_lat_scanout;
wire fpdisable_exc_b;
wire e_cecc_b_in;
wire e_uecc_b_in;
wire ecc_b_lat_scanin;
wire ecc_b_lat_scanout;
wire e_cecc_b;
wire e_uecc_b;
wire misalign_b_in;
wire misalign_b_lat_scanin;
wire misalign_b_lat_scanout;
wire misalign_b;
wire e_oor_va_b_lat_scanin;
wire e_oor_va_b_lat_scanout;
wire pe_oor_va_b;
wire e_oor_va_b;
wire pstate_am_b;
wire e_tcc_b_in;
wire e_tcc_b_lat_scanin;
wire e_tcc_b_lat_scanout;
wire e_tcc_b;
wire e_tof_b_in;
wire e_tof_b_lat_scanin;
wire e_tof_b_lat_scanout;
wire e_tof_b;
wire e_fill_b_in;
wire e_fill_b_lat_scanin;
wire e_fill_b_lat_scanout;
wire e_fill_b;
wire br_exc_b;
wire pdec_exc_b;
wire br_oor_va_b;
wire br_ra_oor_va_b;
wire [3:0] perf_trap_b;
wire ibp_b;
wire iaw_b;
wire tct_b;
wire target_oor_b;
wire disrupting_flush_pending_tid_dec_b;
wire br_taken_b_in;
wire br_taken_b_lat_scanin;
wire br_taken_b_lat_scanout;
wire pre_br_taken_b;
wire br_taken_b;
wire annul_ds_m_lat_scanin;
wire annul_ds_m_lat_scanout;
wire pre_annul_ds_b;
wire annul_ds_b;
wire ds_b_lat_scanin;
wire ds_b_lat_scanout;
wire pre_ds_b;
wire ds_b;
wire [3:0] perf_trap_m;
wire [3:0] pil_mask_15;
wire perf_trap_b_lat_scanin;
wire perf_trap_b_lat_scanout;
wire pil_mask_15_lat_scanin;
wire pil_mask_15_lat_scanout;
wire ibe_m;
wire ibp_b_in;
wire ibp_b_lat_scanin;
wire ibp_b_lat_scanout;
wire itlb_va_pa_enabled;
wire [3:0] immu_enable;
wire iaw_exc_m_in;
wire iaw_exc_m_lat_scanin;
wire iaw_exc_m_lat_scanout;
wire iaw_exc_m;
wire iaw_b_in;
wire iaw_b_lat_scanin;
wire iaw_b_lat_scanout;
wire pstate_tct_m;
wire pstate_tct_b_lat_scanin;
wire pstate_tct_b_lat_scanout;
wire pstate_tct_b;
wire tct_b_in_b;
wire tct_b_in;
wire tct_b_lat_scanin;
wire tct_b_lat_scanout;
wire ptct_b;
wire cti_b_in;
wire cti_b_lat_scanin;
wire cti_b_lat_scanout;
wire cti_b;
wire disrupting_flush_b;
wire pmu_debug_exc_b;
wire twocycle_inst_w_lat_scanin;
wire twocycle_inst_w_lat_scanout;
wire ptwocycle_inst_w;
wire twocycle_inst_w;
wire d_flush_w_lat_scanin;
wire d_flush_w_lat_scanout;
wire d_flush_w;
wire [3:0] dec_inst_valid_b;
wire [3:0] tid_dec_w_in;
wire tid_dec_w_lat_scanin;
wire tid_dec_w_lat_scanout;
wire pstate_am_b_in;
wire pstate_am_b_lat_scanin;
wire pstate_am_b_lat_scanout;
wire pstate_am_w_lat_scanin;
wire pstate_am_w_lat_scanout;
wire pstate_am_w;
wire [3:0] dec_two_tid_b;
wire [3:0] two_tid_dec_w_in;
wire two_tid_dec_w_lat_scanin;
wire two_tid_dec_w_lat_scanout;
wire [3:0] two_tid_dec_w;
wire inst_valid_w_lat_scanin;
wire inst_valid_w_lat_scanout;
wire pre_inst_valid_w;
wire inst_valid_w;
wire illegal_inst_w_in;
wire kill_exc_gt_6_lt_7_b_;
wire illegal_inst_w_lat_scanin;
wire illegal_inst_w_lat_scanout;
wire illegal_inst_w;
wire itlb_miss_w_in;
wire m103663_exc_b;
wire kill_exc_lt_6_b_;
wire itlb_miss_w_lat_scanin;
wire itlb_miss_w_lat_scanout;
wire itlb_miss_w;
wire ra_itlb_miss_w_in;
wire ra_itlb_miss_w_lat_scanin;
wire ra_itlb_miss_w_lat_scanout;
wire ra_itlb_miss_w;
wire itlb_priv_exc_w_in;
wire itlb_priv_exc_w_lat_scanin;
wire itlb_priv_exc_w_lat_scanout;
wire itlb_priv_exc_w;
wire itlb_nfo_exc_w_in;
wire itlb_nfo_exc_w_lat_scanin;
wire itlb_nfo_exc_w_lat_scanout;
wire itlb_nfo_exc_w;
wire i_l2_unde_w_in;
wire i_l2_err_w_lat_scanin;
wire i_l2_err_w_lat_scanout;
wire i_l2_unde_w;
wire i_oor_va_w_in;
wire target_oor_va_b;
wire kill_exc_iar_irr_b_;
wire i_oor_va_w_lat_scanin;
wire i_oor_va_w_lat_scanout;
wire i_oor_va_w;
wire i_ra_oor_va_w_in;
wire target_ra_oor_va_b;
wire i_ra_oor_va_w_lat_scanin;
wire i_ra_oor_va_w_lat_scanout;
wire i_ra_oor_va_w;
wire itlb_err_w_in;
wire itlb_err_w_lat_scanin;
wire itlb_err_w_lat_scanout;
wire itlb_err_w;
wire ic_err_w_in;
wire icp_req_in;
wire ic_err_w_lat_scanin;
wire ic_err_w_lat_scanout;
wire icp_req;
wire done_inst_w_in;
wire kill_exc_b_;
wire done_inst_w_lat_scanin;
wire done_inst_w_lat_scanout;
wire done_inst_w;
wire retry_inst_w_in;
wire retry_inst_w_lat_scanin;
wire retry_inst_w_lat_scanout;
wire retry_inst_w;
wire sir_w_in;
wire dsc_req_in;
wire sir_w_lat_scanin;
wire sir_w_lat_scanout;
wire sir_w;
wire hpriv_exc_w_in;
wire hpriv_exc_w_lat_scanin;
wire hpriv_exc_w_lat_scanout;
wire hpriv_exc_w;
wire priv_exc_w_in;
wire kill_exc_ge_7_lt_11_b_;
wire priv_exc_w_lat_scanin;
wire priv_exc_w_lat_scanout;
wire priv_exc_w;
wire fpdisable_exc_w_in;
wire fpdisable_exc_w_lat_scanin;
wire fpdisable_exc_w_lat_scanout;
wire fpdisable_exc_w;
wire tcc_w_in;
wire tcc_w_lat_scanin;
wire tcc_w_lat_scanout;
wire tcc_w;
wire tof_w_in;
wire tof_w_lat_scanin;
wire tof_w_lat_scanout;
wire tof_w;
wire kill_e_f_ecc_b;
wire e_ecc_b;
wire e_f_ecc_w_in;
wire f_ecc_b;
wire e_ecc_w_lat_scanin;
wire e_ecc_w_lat_scanout;
wire e_f_ecc_w;
wire kill_irf_ecc_w_lat_scanin;
wire kill_irf_ecc_w_lat_scanout;
wire kill_e_f_ecc_w;
wire e_misalign_b;
wire fnn_b;
wire fno_b;
wire e_misalign_w_in;
wire e_misalign_w_lat_scanin;
wire e_misalign_w_lat_scanout;
wire e_misalign_w;
wire immu_enable_lat_scanin;
wire immu_enable_lat_scanout;
wire br_real_b;
wire br_bypass_b;
wire ld_oor_va_b;
wire br_oor_va_w_in;
wire br_ld_oor_va_w_in;
wire br_ld_oor_va_w_lat_scanin;
wire br_ld_oor_va_w_lat_scanout;
wire br_ld_oor_va_w;
wire ld_ra_oor_va_b;
wire br_ra_oor_va_w_in;
wire br_ld_ra_oor_va_w_in;
wire br_ld_ra_oor_va_w_lat_scanin;
wire br_ld_ra_oor_va_w_lat_scanout;
wire br_ld_ra_oor_va_w;
wire pc_oor_va_b_lat_scanin;
wire pc_oor_va_b_lat_scanout;
wire pc_oor_va_m;
wire pc_oor_va_b;
wire snn_b;
wire sno_b;
wire snn_w_in;
wire sno_w_in;
wire fnn_w_in;
wire fno_w_in;
wire snn_w_lat_scanin;
wire snn_w_lat_scanout;
wire snn_w;
wire sno_w_lat_scanin;
wire sno_w_lat_scanout;
wire sno_w;
wire fnn_w_lat_scanin;
wire fnn_w_lat_scanout;
wire fnn_w;
wire fno_w_lat_scanin;
wire fno_w_lat_scanout;
wire fno_w;
wire clw_b;
wire clw_w_in;
wire clw_w_lat_scanin;
wire clw_w_lat_scanout;
wire clw_w;
wire lsu_inst_w_lat_scanin;
wire lsu_inst_w_lat_scanout;
wire lsu_inst_w;
wire cti_w_lat_scanin;
wire cti_w_lat_scanout;
wire cti_w;
wire [2:0] wstate3_b;
wire [2:0] wstate3_w;
wire wstate3_w_lat_scanin;
wire wstate3_w_lat_scanout;
wire [2:0] wstate2_b;
wire [2:0] wstate2_w;
wire wstate2_w_lat_scanin;
wire wstate2_w_lat_scanout;
wire [2:0] wstate1_b;
wire [2:0] wstate1_w;
wire wstate1_w_lat_scanin;
wire wstate1_w_lat_scanout;
wire [2:0] wstate0_b;
wire [2:0] wstate0_w;
wire wstate0_w_lat_scanin;
wire wstate0_w_lat_scanout;
wire in_user_b;
wire [7:0] trap_number_b;
wire trap_number_w_lat_scanin;
wire trap_number_w_lat_scanout;
wire [7:0] trap_number_w;
wire [7:0] trap_number_3_in;
wire [7:0] trap_number_3;
wire trap_number_3_lat_scanin;
wire trap_number_3_lat_scanout;
wire [7:0] trap_number_2_in;
wire [7:0] trap_number_2;
wire trap_number_2_lat_scanin;
wire trap_number_2_lat_scanout;
wire [7:0] trap_number_1_in;
wire [7:0] trap_number_1;
wire trap_number_1_lat_scanin;
wire trap_number_1_lat_scanout;
wire [7:0] trap_number_0_in;
wire [7:0] trap_number_0;
wire trap_number_0_lat_scanin;
wire trap_number_0_lat_scanout;
wire lddf_align_b;
wire lddf_align_w_in;
wire lddf_align_w_lat_scanin;
wire lddf_align_w_lat_scanout;
wire lddf_align_w;
wire stdf_align_b;
wire stdf_align_w_in;
wire stdf_align_w_lat_scanin;
wire stdf_align_w_lat_scanout;
wire stdf_align_w;
wire daccess_prot_b;
wire dtlb_error_b;
wire daccess_prot_w_in;
wire daccess_prot_w_lat_scanin;
wire daccess_prot_w_lat_scanout;
wire daccess_prot_w;
wire priv_action_b;
wire priv_action_w_in;
wire priv_action_w_lat_scanin;
wire priv_action_w_lat_scanout;
wire priv_action_w;
wire va_watchpoint_b;
wire va_watchpoint_w_in;
wire va_watchpoint_w_lat_scanin;
wire va_watchpoint_w_lat_scanout;
wire va_watchpoint_w;
wire pa_watchpoint_b;
wire pa_watchpoint_w_in;
wire pa_watchpoint_w_lat_scanin;
wire pa_watchpoint_w_lat_scanout;
wire pa_watchpoint_w;
wire align_b;
wire align_w_in;
wire align_w_lat_scanin;
wire align_w_lat_scanout;
wire align_w;
wire dtlb_miss_b;
wire perfmon_trap_b;
wire dtlb_miss_w_in;
wire dtlb_w_lat_scanin;
wire dtlb_w_lat_scanout;
wire dtlb_miss_w;
wire ra_dtlb_miss_b;
wire ra_dtlb_miss_w_in;
wire ra_dtlb_w_lat_scanin;
wire ra_dtlb_w_lat_scanout;
wire ra_dtlb_miss_w;
wire l_real_w_lat_scanin;
wire l_real_w_lat_scanout;
wire l_real_w;
wire dae_invalid_asi_b;
wire dae_invalid_asi_w_in;
wire dae_invalid_asi_w_lat_scanin;
wire dae_invalid_asi_w_lat_scanout;
wire dae_invalid_asi_w;
wire dae_nc_page_b;
wire dae_nc_page_w_in;
wire dae_nc_page_w_lat_scanin;
wire dae_nc_page_w_lat_scanout;
wire dae_nc_page_w;
wire dae_nfo_page_b;
wire dae_nfo_page_w_in;
wire dae_nfo_page_w_lat_scanin;
wire dae_nfo_page_w_lat_scanout;
wire dae_nfo_page_w;
wire dae_priv_viol_b;
wire dae_priv_viol_w_in;
wire dae_priv_viol_w_lat_scanin;
wire dae_priv_viol_w_lat_scanout;
wire dae_priv_viol_w;
wire dae_so_page_b;
wire dae_so_page_w_in;
wire dae_so_page_w_lat_scanin;
wire dae_so_page_w_lat_scanout;
wire dae_so_page_w;
wire dtlb_error_w_in;
wire dtlb_error_w_lat_scanin;
wire dtlb_error_w_lat_scanout;
wire dtlb_error_w;
wire pil_mask_15_b;
wire precise_perf_trap_b;
wire tlz_exc_dec_b;
wire por_req_in;
wire xir_req_in;
wire ftt_req_in;
wire debug_exc_b;
wire precise_perf_trap_w_in;
wire precise_perf_trap_w_lat_scanin;
wire precise_perf_trap_w_lat_scanout;
wire precise_perf_trap_w;
wire perf_trap_w_in;
wire perf_trap_w_lat_scanin;
wire perf_trap_w_lat_scanout;
wire perf_trap_w;
wire ibp_w_in;
wire ibp_w_lat_scanin;
wire ibp_w_lat_scanout;
wire ibp_w;
wire iaw_w_in;
wire kill_exc_iaw_b_;
wire iaw_w_lat_scanin;
wire iaw_w_lat_scanout;
wire iaw_w;
wire tct_w_in;
wire tct_w_lat_scanin;
wire tct_w_lat_scanout;
wire tct_w;
wire l_spec_enable_lat_scanin;
wire l_spec_enable_lat_scanout;
wire [3:0] l_spec_enable;
wire spec_enable;
wire f_predict_b;
wire f_predict_w_in;
wire f_predict_w_lat_scanin;
wire f_predict_w_lat_scanout;
wire f_predict_w;
wire pdist_beat2_fx2_in;
wire pdist_beat2_fx2_lat_scanin;
wire pdist_beat2_fx2_lat_scanout;
wire pdist_beat2_fx2;
wire f_cecc_w_lat_scanin;
wire f_cecc_w_lat_scanout;
wire f_uecc_w_lat_scanin;
wire f_uecc_w_lat_scanout;
wire pdist_ecc_b;
wire [3:0] pdist_ecc_w_in;
wire pdist_ecc_w_lat_scanin;
wire pdist_ecc_w_lat_scanout;
wire [3:0] m_asi_ecc_b;
wire [3:0] asi_ecc_b;
wire asi_ecc_w_lat_scanin;
wire asi_ecc_w_lat_scanout;
wire [3:0] asi_ecc_w;
wire [3:0] ime_b;
wire ime_w_lat_scanin;
wire ime_w_lat_scanout;
wire [3:0] ime_w;
wire [3:0] dme_b;
wire dme_w_lat_scanin;
wire dme_w_lat_scanout;
wire [3:0] dme_w;
wire [3:0] m_dae_req_m;
wire m_dae_req_b_lat_scanin;
wire m_dae_req_b_lat_scanout;
wire [3:0] pm_dae_req_b;
wire [3:0] m_dae_req_b;
wire m_dae_req_w_lat_scanin;
wire m_dae_req_w_lat_scanout;
wire br_taken_not_annul_ds_w_in;
wire br_taken_not_annul_ds_w_lat_scanin;
wire br_taken_not_annul_ds_w_lat_scanout;
wire br_taken_not_annul_ds_w;
wire [3:0] hold_nns_exc_w;
wire [3:0] clear_nns_exc_w;
wire [3:0] flush_not_tablewalk;
wire [3:0] flush_ifu;
wire [3:0] iht_request;
wire [3:0] dht_request;
wire [3:0] hwtw_exception;
wire [3:0] nns_exc_in;
wire [3:0] nns_exc;
wire nns_exc_lat_scanin;
wire nns_exc_lat_scanout;
wire ssmode;
wire domode;
wire sync_inst_b;
wire [3:0] nns_to_pc_b;
wire [3:0] tid_dec_valid_b;
wire [3:0] nns_to_npc_b;
wire [3:0] bsee_req_in;
wire [3:0] multicycle_nns_to_npc_b;
wire bsee_req_w_in;
wire [3:0] block_store_w;
wire nns_exc_w_lat_scanin;
wire nns_exc_w_lat_scanout;
wire [3:0] pnns_to_pc_w;
wire [3:0] pnns_to_npc_w;
wire [3:0] nns_to_pc_w;
wire [3:0] nns_to_npc_w;
wire same_thread_b_m;
wire [3:0] pbsee_pending_in;
wire [3:0] bsee_pending;
wire itlb_exc_b;
wire dtlb_exc_b;
wire dec_exc_b;
wire exu_exc_b;
wire lsu_exc_b;
wire fgu_exc_b;
wire exc_w_lat_scanin;
wire exc_w_lat_scanout;
wire dec_exc_w;
wire exu_exc_w;
wire lsu_exc_w;
wire fgu_exc_w;
wire bsee_req_w;
wire trap_flush_lat_scanin;
wire trap_flush_lat_scanout;
wire [3:0] ptrap_flush;
wire preflush_exu_m;
wire preflush_lsu_m;
wire preflush_fgu_m;
wire preflush_b_lat_scanin;
wire preflush_b_lat_scanout;
wire preflush_lsu_b;
wire preflush_fgu_b;
wire flush_lsu_b;
wire flush_fgu_b;
wire [3:0] sync_flush_ifu;
wire [3:0] flush_not_disrupting;
wire [3:0] bsee_req;
wire [3:0] clear_disrupting_flush_pending_w;
wire [3:0] core_running;
wire [3:0] clear_disrupting_flush_pending;
wire tlz_exc_b;
wire [3:0] l_tid_dec_g;
wire [3:0] fpx_tid_dec_fb;
wire [3:0] fpd_tid_dec_fb;
wire [3:0] dcerr_tid_dec_g;
wire [3:0] l_l2_ecc_g;
wire [3:0] l_sbdl_ecc_g;
wire [3:0] priv_action_g;
wire [3:0] precise_perf_trap_g;
wire [3:0] fpx_ieee_exc_fb;
wire [3:0] fpd_ieee_exc_fb;
wire [3:0] fpx_unfin_exc_fb;
wire [3:0] fpd_unfin_exc_fb;
wire [3:0] idiv0_exc_fb;
wire [3:0] flush_gfb_in;
wire flush_gfb_lat_scanin;
wire flush_gfb_lat_scanout;
wire l_l2_ecc_w_lat_scanin;
wire l_l2_ecc_w_lat_scanout;
wire [3:0] l_l2_ecc_w;
wire l_sbdl_ecc_w_lat_scanin;
wire l_sbdl_ecc_w_lat_scanout;
wire [3:0] l_sbdl_ecc_w;
wire priv_action_g_w_lat_scanin;
wire priv_action_g_w_lat_scanout;
wire [3:0] priv_action_g_w;
wire precise_perf_trap_g_w_lat_scanin;
wire precise_perf_trap_g_w_lat_scanout;
wire [3:0] precise_perf_trap_g_w;
wire [3:0] ieee_exc_fb;
wire ieee_exc_fw_lat_scanin;
wire ieee_exc_fw_lat_scanout;
wire [3:0] ieee_exc_fw;
wire [3:0] unfin_fb;
wire unfin_fw_lat_scanin;
wire unfin_fw_lat_scanout;
wire [3:0] unfin_fw;
wire idiv0_exc_fw_lat_scanin;
wire idiv0_exc_fw_lat_scanout;
wire [3:0] idiv0_exc_fw;
wire [3:0] xir_flush_in;
wire [3:0] pre_xir_flush;
wire xir_flush_lat_scanin;
wire xir_flush_lat_scanout;
wire [3:0] xir_flush_m;
wire xir_flush_b_in;
wire xir_flush_b_lat_scanin;
wire xir_flush_b_lat_scanout;
wire xir_flush_b;
wire pre_desr_f_lat_scanin;
wire pre_desr_f_lat_scanout;
wire [3:0] pre_desr_f;
wire [3:0] desr_f_in;
wire [3:0] desr_f;
wire desr_f_lat_scanin;
wire desr_f_lat_scanout;
wire desr_s_lat_scanin;
wire desr_s_lat_scanout;
wire [3:0] desr_s;
wire [3:0] eer_err_m;
wire eer_err_b_in;
wire eer_err_b_lat_scanin;
wire eer_err_b_lat_scanout;
wire eer_err_b;
wire [3:0] ade_err_m;
wire ade_err_b_in;
wire ade_err_b_lat_scanin;
wire ade_err_b_lat_scanout;
wire ade_err_b;
wire [3:0] l_sbpp_in;
wire [3:0] pre_l_sbpp;
wire l_sbpp_lat_scanin;
wire l_sbpp_lat_scanout;
wire [3:0] l_sbpp_m;
wire l_sbpp_b_in;
wire l_sbpp_b_lat_scanin;
wire l_sbpp_b_lat_scanout;
wire l_sbpp_b;
wire [3:0] ma_flush_in;
wire [3:0] pre_ma_flush;
wire ma_flush_lat_scanin;
wire ma_flush_lat_scanout;
wire [3:0] ma_flush_m;
wire ma_flush_b_in;
wire ma_flush_b_lat_scanin;
wire ma_flush_b_lat_scanout;
wire ma_flush_b;
wire [3:0] cwq_flush_in;
wire [3:0] pre_cwq_flush;
wire cwq_flush_lat_scanin;
wire cwq_flush_lat_scanout;
wire [3:0] cwq_flush_m;
wire cwq_flush_b_in;
wire cwq_flush_b_lat_scanin;
wire cwq_flush_b_lat_scanout;
wire cwq_flush_b;
wire tsa_tca_ecc_error;
wire [3:0] check_mqr_dqr_;
wire [3:0] check_mqr_dqr;
wire [3:0] check_rqr_;
wire [3:0] check_rqr;
wire [3:0] pmqr_exc_in;
wire [3:0] pmqr_exc;
wire pmqr_exc_lat_wmr_scanin;
wire pmqr_exc_lat_wmr_scanout;
wire [3:0] mqr_exc_m;
wire mqr_exc_b_in;
wire mqr_exc_b_lat_scanin;
wire mqr_exc_b_lat_scanout;
wire mqr_exc_b;
wire [3:0] pdqr_exc_in;
wire [3:0] pdqr_exc;
wire pdqr_exc_lat_wmr_scanin;
wire pdqr_exc_lat_wmr_scanout;
wire [3:0] dqr_exc_m;
wire dqr_exc_b_in;
wire dqr_exc_b_lat_scanin;
wire dqr_exc_b_lat_scanout;
wire dqr_exc_b;
wire [3:0] prqr_exc_in;
wire [3:0] prqr_exc;
wire prqr_exc_lat_wmr_scanin;
wire prqr_exc_lat_wmr_scanout;
wire [3:0] rqr_exc_m;
wire rqr_exc_b_in;
wire rqr_exc_b_lat_scanin;
wire rqr_exc_b_lat_scanout;
wire rqr_exc_b;
wire ivt_lat_scanin;
wire ivt_lat_scanout;
wire [3:0] ivt_last;
wire [3:0] ivt_flush_in;
wire [3:0] pre_ivt_flush;
wire ivt_flush_lat_wmr_scanin;
wire ivt_flush_lat_wmr_scanout;
wire [3:0] ivt_flush_m;
wire ivt_flush_b_in;
wire ivt_flush_b_lat_scanin;
wire ivt_flush_b_lat_scanout;
wire ivt_flush_b;
wire [3:0] iln_exc_m;
wire iln_exc_b_in;
wire iln_exc_b_lat_scanin;
wire iln_exc_b_lat_scanout;
wire iln_exc_b;
wire [3:0] tlz_exc_m;
wire tlz_exc_b_in;
wire tlz_exc_b_lat_scanin;
wire tlz_exc_b_lat_scanout;
wire [3:0] hst_exc_m;
wire hst_exc_b_in;
wire hst_exc_b_lat_scanin;
wire hst_exc_b_lat_scanout;
wire hst_exc_b;
wire [3:0] no_hold_disrupting_flush_in;
wire [3:0] idl_exc_in;
wire [3:0] disrupting_ssc_exc;
wire no_hold_disrupting_flush_lat_scanin;
wire no_hold_disrupting_flush_lat_scanout;
wire [3:0] no_hold_disrupting_flush;
wire [3:0] disrupting_flush_pending;
wire disrupting_flush_pending_tid_dec_m;
wire disrupting_flush_pending_tid_dec_b_lat_scanin;
wire disrupting_flush_pending_tid_dec_b_lat_scanout;
wire kill_pmu_debug_exc_b_;
wire pmu_debug_exc_ge_7_lt_11_b;
wire [3:0] clear_disrupting_flush_pending_w_in;
wire cdfpw_lat_scanin;
wire cdfpw_lat_scanout;
wire disrupting_flush_w_in;
wire refetch_b;
wire disrupting_flush_w_lat_scanin;
wire disrupting_flush_w_lat_scanout;
wire disrupting_flush_w;
wire block_store_w_lat_scanin;
wire block_store_w_lat_scanout;
wire [3:0] bsee_pending_in;
wire bsee_pending_lat_scanin;
wire bsee_pending_lat_scanout;
wire bsee_req_lat_scanin;
wire bsee_req_lat_scanout;
wire bsee_req_w_lat_scanin;
wire bsee_req_w_lat_scanout;
wire bsee_flush_b_in;
wire bsee_flush_b_lat_scanin;
wire bsee_flush_b_lat_scanout;
wire core_running_lat_scanin;
wire core_running_lat_scanout;
wire core_running_last_lat_scanin;
wire core_running_last_lat_scanout;
wire [3:0] core_running_last;
wire core_running_status_lat_scanin;
wire core_running_status_lat_scanout;
wire [3:0] core_running_status;
wire [3:0] idl_exc_new;
wire [3:0] idl_exc;
wire idl_exc_lat_scanin;
wire idl_exc_lat_scanout;
wire idl_exc_b;
wire idl_req_in;
wire rqr_req_in;
wire ade_req_in;
wire eer_req_in;
wire iln_req_in;
wire dqr_req_in;
wire mqr_req_in;
wire cwq_req_in;
wire ma_req_in;
wire ivt_req_in;
wire tlz_req_in;
wire hst_req_in;
wire idl_req_lat_scanin;
wire idl_req_lat_scanout;
wire idl_req;
wire [3:0] res_exc;
wire [3:0] ever_been_running;
wire ssmode_lat_scanin;
wire ssmode_lat_scanout;
wire domode_lat_scanin;
wire domode_lat_scanout;
wire ssreq_lat_scanin;
wire ssreq_lat_scanout;
wire ssreq;
wire [3:0] ssr_exc_forces_por;
wire [3:0] ssr_exc_b;
wire [3:0] por_exc;
wire [3:0] ssc_req;
wire [3:0] ssr_req_in;
wire ssr_req_lat_scanin;
wire ssr_req_lat_scanout;
wire [3:0] ever_been_running_in;
wire ever_been_running_lat_scanin;
wire ever_been_running_lat_scanout;
wire [3:0] por_req_vec_in;
wire por_req_lat_scanin;
wire por_req_lat_scanout;
wire [3:0] xir_request_in;
wire xir_req_lat_scanin;
wire xir_req_lat_scanout;
wire [3:0] xir_request;
wire [3:0] ftt_request_in;
wire ftt_req_lat_scanin;
wire ftt_req_lat_scanout;
wire [3:0] ftt_request;
wire ade_req_lat_scanin;
wire ade_req_lat_scanout;
wire ade_req;
wire eer_req_lat_scanin;
wire eer_req_lat_scanout;
wire eer_req;
wire ivt_req_lat_scanin;
wire ivt_req_lat_scanout;
wire ivt_req;
wire ma_req_lat_scanin;
wire ma_req_lat_scanout;
wire ma_req;
wire cwq_req_lat_scanin;
wire cwq_req_lat_scanout;
wire cwq_req;
wire mqr_req_lat_scanin;
wire mqr_req_lat_scanout;
wire mqr_req;
wire dqr_req_lat_scanin;
wire dqr_req_lat_scanout;
wire dqr_req;
wire rqr_req_lat_scanin;
wire rqr_req_lat_scanout;
wire rqr_req;
wire iln_req_lat_scanin;
wire iln_req_lat_scanout;
wire iln_req;
wire hst_req_lat_scanin;
wire hst_req_lat_scanout;
wire hst_req;
wire [3:0] tlz_request_in;
wire tlz_req_lat_scanin;
wire tlz_req_lat_scanout;
wire [3:0] tlz_request;
wire [3:0] ssc_req_in;
wire ssc_req_lat_scanin;
wire ssc_req_lat_scanout;
wire [3:0] disrupting_ssc_exc_in;
wire [3:0] idl_request;
wire [3:0] disrupting_ssc_req;
wire disrupting_ssc_exc_lat_scanin;
wire disrupting_ssc_exc_lat_scanout;
wire hw_tw_enabled_lat_scanin;
wire hw_tw_enabled_lat_scanout;
wire [3:0] hw_tw_enabled;
wire [3:0] hw_tw_disabled;
wire [3:0] itm_request;
wire load_i_tag_access_in;
wire load_i_tag_access_lat_scanin;
wire load_i_tag_access_lat_scanout;
wire load_i_tag_access_pre;
wire [3:0] load_i_tag_access;
wire [3:0] ipe_request;
wire [3:0] dtm_request;
wire load_d_tag_access_in;
wire load_d_tag_access_lat_scanin;
wire load_d_tag_access_lat_scanout;
wire load_d_tag_access;
wire [3:0] vaw_request;
wire [3:0] iaw_request;
wire [3:0] paw_request;
wire [3:0] irt_request;
wire [3:0] i_real_w;
wire [3:0] load_i_tag_access_r;
wire [3:0] drt_request;
wire [3:0] pre_lsr_request;
wire [3:0] ibp_request;
wire [3:0] tct_request;
wire refetch_w;
wire [3:0] m103663_in;
wire [3:0] m103663;
wire m103663_lat_scanin;
wire m103663_lat_scanout;
wire refetch_w_in;
wire refetch_w_lat_scanin;
wire refetch_w_lat_scanout;
wire [2:0] cwp3_in;
wire [2:0] cwp3;
wire [2:0] cwp2_in;
wire [2:0] cwp2;
wire [2:0] cwp1_in;
wire [2:0] cwp1;
wire [2:0] cwp0_in;
wire [2:0] cwp0;
wire cwp_lat_wmr_scanin;
wire cwp_lat_wmr_scanout;
wire [3:0] pc_valid;
wire [3:0] pc_sel_npc_plus_4;
wire [3:0] npc_valid;
wire prevent_valid;
wire [3:0] inst_b;
wire [3:0] pc_valid_in;
wire pc_valid_lat_scanin;
wire pc_valid_lat_scanout;
wire [3:0] npc_valid_in;
wire npc_valid_lat_scanin;
wire npc_valid_lat_scanout;
wire npc_is_valid;
wire [3:0] pc_is_npc_in;
wire [3:0] pc_is_npc;
wire pc_is_npc_lat_scanin;
wire pc_is_npc_lat_scanout;
wire [4:2] pre_npc_d;
wire sel_inst_cnt_m_1;
wire [4:2] npc_plus_0;
wire [4:2] npc_plus_1;
wire [4:2] npc_plus_2;
wire [4:2] npc_plus_3;
wire debug_event_lat_scanin;
wire debug_event_lat_scanout;
wire [3:0] debug_event;
wire softstop_req_in;
wire hardstop_req_in;
wire pulse_req_in;
wire softstop_req_lat_scanin;
wire softstop_req_lat_scanout;
wire softstop_req;
wire hardstop_req_lat_scanin;
wire hardstop_req_lat_scanout;
wire hardstop_req;
wire pulse_req_lat_scanin;
wire pulse_req_lat_scanout;
wire pulse_req;
wire [1:0] instr_cmt_grp_in;
wire instr_cmt_grp_lat_scanin;
wire instr_cmt_grp_lat_scanout;
wire [1:0] instr_cmt_grp;
wire [3:0] m114419_nor3_0;
wire [3:0] m114419_nor3_1;
wire [3:0] m114419_nor3_2;
wire [3:0] m114419_nand3_0;
wire [3:0] m114419_inv_0;
wire [3:0] unhalt;
wire [3:0] halted_in;
wire [3:0] halted;
wire spares_scanin;
wire spares_scanout;
wire [15:0] unused;


input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input		lsu_tlu_pmen;		// Power management

input		thread_group;		// Which thread group?

input	[2:0]	trl_shscanid;		// Select which thread to shadow


input	[3:0]	tcu_core_running;
input		tcu_ss_mode;		// Core is in single step mode
input		tcu_do_mode;		// Core is in disable overlap mode
input		tcu_ss_request;		// Enabled threads should single step

input	[3:0]	cxi_xir;		// External Interrupt Request
input 	[3:0]	cxi_ivt;		// Interrupt Vector Trap Request

input	[3:1]	dec_raw_pick_p;		// Decoded TID for instruction in P
input	[1:0]	dec_tid_m;		// TID for instruction in M
input 		dec_inst_valid_m;	// Valid instruction
input 		dec_lsu_inst_m;		// LSU instruction
input 		dec_fgu_inst_m;		// FGU instruction
input		dec_illegal_inst_m;	// Illegal instruction
input	[4:0]	dec_exc_m;		// Exceptions before the ibuffer
input		dec_done_inst_m;	// DONE
input		dec_retry_inst_m;	// RETRY
input		dec_sir_inst_m;		// Software initiated reset
input		dec_hpriv_exc_m;	// Instruction has hyperprivilege exc
input		dec_priv_exc_m;		// Instruction has privilege exc
input		dec_fpdisable_exc_m;	// Floating-point disabled exception
input		dec_br_taken_m;		// Branch in M is taken
input		dec_annul_ds_m;		// Branch in M annuls delay slot
input		dec_ds_m;		// Instruction is in a delay slot
input		dec_icache_perr_m;	// Icache data array had parity error
input		dec_cti_inst_m;		// br/tcc/call/jmpl in M
input		dec_flush_b;		// Flush instruction in B

input		exu_ibp_m;		// Instruction breakpoint
input		exu_tcc_m;		// Trap on condition codes
input		exu_tof_m;		// Tag overflow (TADccTV, TSUBccTV)
input		exu_cecc_m;		// Correctable ECC error on source
input		exu_uecc_m;		// Uncorrectable ECC error on source
input		exu_oor_va_m;		// VA is out of range
input		exu_misalign_m;		// Misaligned address for JMPL, RETURN
input		exu_spill_b;
input		exu_fill_m; 
input		exu_normal_b; 
input		exu_cleanwin_b;
input	[2:0]	exu_wstate_b;  
input	[7:0]	exu_trap_number_b;
input	[2:0]	exu_cwp0;
input	[2:0]	exu_cwp1;
input	[2:0]	exu_cwp2;
input	[2:0]	exu_cwp3;

input		lsu_lddf_align_b;
input		lsu_stdf_align_b;
input		lsu_illegal_inst_b;
input		lsu_daccess_prot_b;
input		lsu_priv_action_b;
input		lsu_va_watchpoint_b;
input		lsu_pa_watchpoint_b;
input		lsu_align_b;		// Alignment exception
input		lsu_tlb_miss_b_;	// TLB miss
input		lsu_dae_invalid_asi_b;
input		lsu_dae_nc_page_b;
input		lsu_dae_nfo_page_b;
input		lsu_dae_priv_viol_b;
input		lsu_dae_so_page; 
input		lsu_priv_action_g;	
input	[2:0]	lsu_tid_g;		// TID for exceptions from G
input	[3:0]	lsu_trap_flush;		// Flush thread and redirect to NPC
input	[3:0]	lsu_spec_enable;	// Speculation mode enabled
input 		lsu_tlb_bypass_b;	// TLB in bypass mode
input 		lsu_tlb_real_b;		// TLB doing RA->PA translation
input 		lsu_sync_inst_b;	// Instruction will get a trap flush
input		lsu_tlu_twocycle_m;	// LSU takes extra cycle on this inst
input	[3:0]	lsu_block_store_b;	// LSU reads FRF for block store
input		lsu_dcl2u_err_g;	// LSU data cache L2 uncorrectable ECC
input		lsu_dcl2nd_err_g;	// LSU data cache L2 NotData
input	[2:0]	lsu_dcerr_tid_g;	// TID for G stage errors (above)
input		lsu_sbdlc_err_g;        // STB RAW error (CE)
input		lsu_sbdlu_err_g;        // STB RAW error (UE)
input		lsu_sbapp_err_g;        // STB read for issue addr parity error
input		lsu_sbdiou_err_g;       // STB read for issue IO/ext ASI parity
input	[2:0]	lsu_stberr_tid_g;       // TID of STB error
input		lsu_dttp_err_b;         // DTLB tag parity error
input		lsu_dtdp_err_b;         // DTLB data parity error
input		lsu_dtmh_err_b;         // DTLB tag multiple hit
input		lsu_perfmon_trap_b;	// Take pic_overflow on this instruction
input		lsu_perfmon_trap_g;	// Take pic_overflow on this instruction
input	[3:0]	lsu_immu_enable;     	// For instruction VA watchpoint

input		fgu_predict_fx2;	// Exception predicted
input		fgu_pdist_beat2_fx1;	// Second part of PDIST in FX1
input		fgu_cecc_fx2;		// Correctable ECC Error on FRF
input		fgu_uecc_fx2;		// Uncorrectable ECC Error on FRF
input		fgu_fpx_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpd_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpx_unfin_fw; 	// Other FGU exception
input		fgu_fpd_unfin_fw; 	// Other divide exception
input		fgu_fpd_idiv0_trap_fw; 	// Integer divide by zero exception
input	[2:0]	fgu_fpx_trap_tid_fw;	// TID for FGU exceptions except divide
input	[2:0]	fgu_fpd_trap_tid_fw;	// TID for divide exception

input		asi_ece_exc;		// Correctable ECC error on ASI rd/wr
input		asi_eue_exc;		// Uncorrectable ECC error on ASI rd/wr
input	[2:0]	asi_ecc_tid;		// TID for ECC error
input	[3:0]	asi_irl_cleared;	// Interrupt_receive_register cleared
input	[3:0]	asi_halt;		// 
input	[63:46]	asi_decr;		// Debug event control register
input	[3:0] asi_clear_spu_trap_req;	// 

input	[3:0]	tel_tsacu_exc;		// ECC error TSA rd don/ret

input	[3:0]	mmu_hw_tw_enable;	// Hardware tablewalk enables per thread
input	[3:0]	mmu_i_unauth_access;	// Hardware tablewalk ITSB with EP=0
input	[3:0]	mmu_i_tsb_miss;		// Hardware tablewalk missed
input	[3:0]	mmu_d_tsb_miss;		// Hardware tablewalk missed
input	[3:0]	mmu_i_tte_outofrange;	// RA out of range
input	[3:0]	mmu_d_tte_outofrange;	// RA out of range
input 		mmu_asi_cecc; 		// Correctable ECC error on ASI read
input 		mmu_asi_uecc; 		// Uncorrectable ECC error on ASI read
input	[2:0]	mmu_asi_tid;		// Thread for reported error
input	[3:0]	mmu_i_eccerr;		// HW TW had MRA or L2 error on I rld
input	[3:0]	mmu_d_eccerr;		// HW TW had MRA or L2 error on D rld
input		mmu_thr0_err_type_b1;	// [1:0] ND U C - (3-0)
input		mmu_thr1_err_type_b1;	// [1:0] ND U C - (3-0)
input		mmu_thr2_err_type_b1;	// [1:0] ND U C - (3-0)
input		mmu_thr3_err_type_b1;	// [1:0] ND U C - (3-0)
input		mmu_dae_req;		// unsupported_page_size exception
input	[2:0]	mmu_dae_tid;		

input	[4:0]	spu_tlu_ma_int_req;	// SPU MA  4 err  3 trap  2:0 thread ID
input	[3:0]	spu_tlu_cwq_int_req;	// SPU CWQ trap rq  3 vld  2:0 thread ID

input	[3:0]	pmu_tlu_trap_m;		// PMU trap; kill instruction in M
input	[3:0]	pmu_tlu_debug_event;	// PMU event; soft/hard stop or pulse 

input	[1:0]	pct_iaw_exc_e;
input	[3:2]	pct_npc_0_w;
input	[3:2]	pct_npc_1_w;
input	[3:2]	pct_npc_2_w;
input	[3:2]	pct_npc_3_w;
input		pct_pc_oor_va_e;

input		flsx_flush_lsu_b;
input		flsx_flush_fgu_b;

input	[3:0]	trl_tl_eq_0;		// TL equals zero
input	[3:0]	trl_pil_mask_15;	// PIL_mask 15
input	[3:0]	trl_iln_exc;		// interrupt_level_n exception 
input	[3:0]	trl_hstick_match;	// HSTICK_CMPR matches TICK
input	[3:0]	trl_unhalt_;		// Raw *STICK_CMPR match; 
input	[3:0]	trl_tlz_exc;		// TL equals zero exception
input 	[3:0]	trl_nns_exc;		// Retry with nonsequential NPC
input 	[3:0]	trl_ssc_exc;		// Single step complete exception
input 	[3:0]	trl_invalidate_pc;	// Trap, done, retry, or HW TW complete
input 	[3:0]	trl_invalidate_npc;	// Trap, retry, or HW TW complete
input 	[3:0]	trl_pc_sel_trap_pc;	// Power management
input 	[3:0]	trl_fls_npc_en;		// Power management
input	[3:0]	trl_trap_taken;
input           trl_take_sma;           // SPU Modular Arithmetic trap taken
input           trl_take_cwq;           // SPU Control Word Queue trap taken
input		trl_take_xir;	
input		trl_take_ftt;	
input	[3:0]	trl_core_running_status;
input		trl_check_rqr;		

input 	[3:0]	tlu_ceter_de;
input 	[3:0]	tlu_ceter_dhcce;

input 	[3:0]	tsd_hpstate_ibe;
input 	[3:0]	tsd_hpstate_hpriv;
input 	[3:0]	tsd_hpstate_red;
input 	[3:0]	tsd_pstate_tct;
input 	[3:0]	tsd_pstate_priv;
input 	[3:0]	tsd_pstate_ie;
input 	[3:0]	tsd_pstate_am;
input	[3:0] tsd_itlb_bypass;
input 		tsd_mrqr_exc_;		// Mondo or Res Err Queue Register exc
input 		tsd_dqr_exc_;		// Device  Queue Register exception

input 	[3:0]	asi_check_qr_exc;	// Check for Interrupt Queue Register
					// head vs. tail mismatch

input	[3:0]	dfd_fls_desr_f;
input	[3:0]	dfd_fls_desr_s;
input	[3:0]	ras_precise_error;
input	[3:0]	ras_disrupting_error;
input	[3:0]	ras_deferred_error;



output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output		fls_spc_hardstop_request;	
output		fls_spc_softstop_request;	
output		fls_spc_trigger_pulse;	
output	[1:0]	tlu_dbg_instr_cmt_grp;	

output	[3:0]	tlu_flush_ifu;		// Flush specified thread

output		tlu_flush_exu_b;	// EXU to flush instr in B stage

output 		tlu_flush_lsu_b;	// This covers both thread groups

output 		tlu_flush_fgu_b;	// This covers both thread groups

output		tlu_flush_pmu_b;	// PMU to flush instr in B stage
output		tlu_flush_pmu_w;	// PMU to flush instr in W stage

output	[3:0]	tlu_load_i_tag_access_p;
output	[3:0]	tlu_load_i_tag_access_n;
output	[3:0]	tlu_load_d_tag_access;
output	[3:0]	tlu_load_d_tag_access_r;

output 		fls_flush_lsu_b;	// LSU to flush instr in B stage

output		fls_flush_fgu_b;	// FGU to flush instr in B stage

output		fls_pc_is_npc;		// PC reg actually holds NPC, not PC

output 	[1:0]	fls_tid_d;
output 	[3:0]	fls_tid_dec_b;
output 	[3:0]	fls_tid_dec_w;
output 	[3:0]	fls_pc_sel_npc;		// Sequential flow
output 	[3:0]	fls_pc_sel_npc_plus_4;	// Branch taken or(not taken with annul)
output 	[3:0]	fls_npc_sel_npc_plus_4;	// Sequential flow
output 	[3:0]	fls_npc_sel_npc_plus_8;	// Sequential flow
output 	[3:0]	fls_npc_sel_target;	// Branch taken
output 		fls_npc_b_sel_npc;	// NPC for inst at B is invalid
output		fls_pstate_am_d_;	// For instruction watchpoint
output		fls_pstate_am_b_;	// For dsfar
output		fls_pstate_am_w_;	// For itlb_tag_access
output		fls_lsu_inst_w;		// For npc_w
output		fls_dfd_lsu_inst_b;	// For DSFAR

output	[2:0]	fls_wstate0;		// WSTATE value for spill, fill traps
output	[2:0]	fls_wstate1;		// WSTATE value for spill, fill traps
output	[2:0]	fls_wstate2;		// WSTATE value for spill, fill traps
output	[2:0]	fls_wstate3;		// WSTATE value for spill, fill traps

output	[7:0]	fls_tcc_number_0;	// Trap number for thread 0
output	[7:0]	fls_tcc_number_1;	// Trap number for thread 1
output	[7:0]	fls_tcc_number_2;	// Trap number for thread 2
output	[7:0]	fls_tcc_number_3;	// Trap number for thread 3

output	[3:0]	fls_tid_dec_w_in;	// Decoded TID for nonstranded requests

output	[3:0]	fls_por_request;	// POR trap request
output	[3:0]	fls_xir_request;	// XIR trap request
output	[3:0]	fls_ivt_request;	// Interrupt Vector Trap request
output	[3:0]	fls_sir_request;	// SIR trap request
output	[3:0]	fls_itm_request;	// ITLB miss trap request
output	[3:0]	fls_iln_request;	// Interrupt level n request
output	[3:0]	fls_hst_request;	// hstick_match request
output	[3:0]	fls_tlz_request;	// TL equals zero request
output	[3:0]	fls_sma_request;	// SPU Modular Arithmetic request
output	[3:0]	fls_cwq_request;	// SPU Control Word Queue request
output	[3:0]	fls_ade_request;	// Software recoverable error trap req
					// 	(Disrupting error on store,HWTW)
output	[3:0]	fls_iae_request;	// Instruction_access_error trap req
output	[3:0]	fls_ipe_request;	// Internal processor error trap request
					// 	(Error on array access, etc.)
output		fls_ipv_request;	// IAE_privilege_violation trap request
output		fls_inp_request;	// IAE_nfo_page trap request
output		fls_iar_request;	// instruction_address_range trap equest
output		fls_irr_request;	// instruction_real_range trap equest
output		fls_mar_request;	// mem_address_range trap request
output		fls_mrr_request;	// mem_real_range trap request
output		fls_pro_request;	// Privileged opcode trap request
output		fls_ill_request;	// Illegal instruction trap request
output		fls_don_request;	// Done instruction
output		fls_ret_request;	// Retry instruction
output		fls_fpd_request;	// FP disabled trap request
output		fls_snn_request;	// Spill normal trap request
output		fls_sno_request;	// Spill other trap request
output		fls_fnn_request;	// Fill normal trap request
output		fls_fno_request;	// Fill other trap request
output		fls_clw_request;	// Clean window trap request
output	[3:0]	fls_dtm_request;	// DTLB miss trap request
output		fls_ldf_request;	// lddf alignment trap request
output		fls_stf_request;	// stdf alignment trap request
output 		fls_dap_request;	// data_access_protection trap request
output		fls_vaw_request;	// VA watchpoint trap request
output		fls_iaw_request;	// Instruction VA watchpoint trap req
output		fls_paw_request;	// PA watchpoint trap request
output		fls_maa_request;	// Memory address alignment trap request
output		fls_fpe_request;	// FP predicted exception
output	[3:0]	fls_fei_request;	// FP IEEE 754 trap request
output	[3:0]	fls_fof_request;	// FP other trap request (unfinished)
output	[3:0]	fls_pra_request;	// Privileged action trap request
output		fls_dia_request;	// DAE_invalid_asi trap request
output	[3:0]	fls_ups_request;	// unsupported_page_size trap request
output		fls_dpv_request;	// DAE_privilege_violation trap request
output		fls_dnc_request;	// DAE_nc_page trap request
output		fls_dnf_request;	// DAE_nfo_page trap request
output		fls_dso_request;	// DAE_so_page trap request
output		fls_tof_request;	// Tag overflow trap request
output	[3:0]	fls_dbz_request;	// Divide by zero trap request
output		fls_tcc_request;	// Trap instruction trap request
output	[3:0]	fls_dae_request;	// LSU uncorrectable ECC on load miss
output	[3:0]	fls_lsr_request;	// LSU sync trap (postsync)
output		fls_irt_request;	// Instruction real translation miss
output		fls_drt_request;	// Data real translation miss
output	[3:0]	fls_pmu_request;	// pic_overflow
output 	[3:0]	fls_mqr_request;	// CPU mondo trap request
output 	[3:0]	fls_dqr_request;	// Device mondo trap request
output 	[3:0]	fls_rqr_request;	// Resumable error trap request
output 	[3:0]	fls_idl_request;	// CMP idle request
output 	[3:0]	fls_res_request;	// CMP resume request
output	[3:0]	fls_ssr_request;	// Single step request
output	[3:0]	fls_ssc_request;	// Single step completion
output 	[3:0]	fls_nns_request;	// NPC nonsequential redirect request
output 	[3:0]	fls_ime_request;	// Instruction_access_MMU_error request
output 	[3:0]	fls_dme_request;	// Data_access_MMU_error request
output 	[3:0]	fls_eer_request;	// Hardware corrected error trap request
output 		fls_icp_request;	// Icache parity error (invalidate)
output 	[3:0]	fls_ftt_request;	// Fatal_thread_trap request
output 		fls_ibp_request;	// Instruction breakpoint request
output 		fls_tct_request;	// Trap on control transfer request
output 		fls_ref_request;	// Refetch inst 

output 		fls_ipe_dme_request;	// Update DSFSR / DSFAR

output	[3:0]	fls_pc_valid;		// For single step redirection control

output	[3:0]	fls_load_dsfar;
output		fls_irf_cecc_b;
output		fls_irf_uecc_b;
output		fls_kill_irf_ecc_w;

output	[2:0]	fls_cwp0;
output	[2:0]	fls_cwp1;
output	[2:0]	fls_cwp2;
output	[2:0]	fls_cwp3;

output	[3:0]	fls_core_running;
output		fls_ss_request;

output	[3:0]	fls_pct_pc_en;		// Power management for pct PC flops
output	[3:0]	fls_pct_npc_en;		// Power management for pct NPC flops
output	[3:0]	fls_trl_l1en;		// Power management for trl

output	[4:2]	fls_npc_if_cnt_eq_1_d;
output	[4:2]	fls_npc_if_cnt_eq_2_d;
output	[4:2]	fls_npc_if_cnt_eq_3_d;

output	[3:0]	fls_flush;		// Copy of tlu_flush_ifu
output		fls_disrupting_flush_w;	
output		fls_f_cecc_w;		// For tlu_ras_ctl
output		fls_f_uecc_w;		// For tlu_ras_ctl

output		fls_ss_update_pc_w;

output 	[3:0]	tlu_iht_request;	// ITLB hardware tablewalk request
output 	[3:0]	tlu_dht_request;	// DTLB hardware tablewalk request

output		tlu_itlb_bypass_e;

output	[1:0]	tlu_tag_access_tid_b;	// Tag access power management
output		tlu_i_tag_access_b;	// Tag access power management
output		tlu_d_tag_access_b;	// Tag access power management

output	[3:0]	tlu_retry_state;	// DEC should not wait for delay slot

output	[3:0]	tlu_halted;		




////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;



//////////////////////////////////////////////////////////////////////////////
// Power management

// l_tlu_twocycle_b is the M stage of the second beat
// fgu_pdist_beat2_fx1 is the M stage of the second beat
assign beat_two_b_in =
       (l_tlu_twocycle_b | (fgu_pdist_beat2_fx1 & fgu_inst_b)) & ~dec_flush_b;

tlu_fls_ctl_msff_ctl_macro__width_2 beat_two_b_lat  (
	.scan_in(beat_two_b_lat_scanin),
	.scan_out(beat_two_b_lat_scanout),
	.din	({beat_two_b_in	       ,
		  beat_two_b	       }),
	.dout	({pbeat_two_b	       ,
		  beat_two_w	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign beat_two_b =
       pbeat_two_b & ~exc_for_w;

// dec_inst_valid_m is the M stage of normal instructions
// pre_inst_valid_b is the B stage of normal instructions and M of twocycle ops
// beat_two_b is the B stage of twocycle ops
assign l1en_b2w_in =
       dec_inst_valid_m | pre_inst_valid_b | ~lsu_tlu_pmen |
       beat_two_b;

assign fls_trl_l1en[3:0] =
       ({4 {l1en_b2w}} & tid_dec_w[3:0]) | flush_gfb[3:0] | 
       m_dae_req_w[3:0] | por_req[3:0] | res_req[3:0] | 
       trap_flush[3:0] | pdist_ecc_w[3:0] | ssr_req[3:0] | 
       multicycle_nns_to_npc_w[3:0];

tlu_fls_ctl_msff_ctl_macro__width_1 l1en_b2w_lat  (
	.scan_in(l1en_b2w_lat_scanin),
	.scan_out(l1en_b2w_lat_scanout),
	.din	(l1en_b2w_in		),
	.dout	(l1en_b2w		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_l1clkhdr_ctl_macro b2w_clken (
        .l2clk  (l2clk 			),
        .l1en   (l1en_b2w		),
        .l1clk  (l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);




////////////////////////////////////////////////////////////////////////////////
// Clock header

tlu_fls_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);




////////////////////////////////////////////////////////////////////////////////
// Flop signals that are out of pipe

tlu_fls_ctl_msff_ctl_macro__width_4 hpstate_hpriv_lat  (
	.scan_in(hpstate_hpriv_lat_scanin),
	.scan_out(hpstate_hpriv_lat_scanout),
	.din	(tsd_hpstate_hpriv	[3:0]	),
	.dout	(hpstate_hpriv		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign hpriv_bar_or_ie_in[3:0] =
	~tsd_hpstate_hpriv[3:0] | tsd_pstate_ie[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 hpriv_bar_or_ie_lat  (
	.scan_in(hpriv_bar_or_ie_lat_scanin),
	.scan_out(hpriv_bar_or_ie_lat_scanout),
	.din	(hpriv_bar_or_ie_in	[3:0]	),
	.dout	(phpriv_bar_or_ie	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign hpriv_bar_or_ie_m[3:0] =
       phpriv_bar_or_ie[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign hpriv_bar_and_ie_in[3:0] =
	~tsd_hpstate_hpriv[3:0] & tsd_pstate_ie[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 hpriv_bar_and_ie_lat  (
	.scan_in(hpriv_bar_and_ie_lat_scanin),
	.scan_out(hpriv_bar_and_ie_lat_scanout),
	.din	(hpriv_bar_and_ie_in	[3:0]	),
	.dout	(hpriv_bar_and_ie	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);




////////////////////////////////////////////////////////////////////////////////
// Pipe signals from P to D 

assign tid_p[1:0] =
       {dec_raw_pick_p[3] | dec_raw_pick_p[2],
	dec_raw_pick_p[3] | dec_raw_pick_p[1]};

tlu_fls_ctl_msff_ctl_macro__width_2 tid_dec_d_lat  (
	.scan_in(tid_dec_d_lat_scanin),
	.scan_out(tid_dec_d_lat_scanout),
	.din	(tid_p		[1:0]	),
	.dout	(tid_d		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_d[3:0] = 
	{ tid_d[1] &  tid_d[0],
	  tid_d[1] & ~tid_d[0],
	 ~tid_d[1] &  tid_d[0],
	 ~tid_d[1] & ~tid_d[0]};

assign fls_tid_d[1:0] =
       tid_d[1:0];

assign fls_pstate_am_d_ =
       | (~tsd_pstate_am[3:0] & tid_dec_d[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 itlb_bypass_lat  (
	.scan_in(itlb_bypass_lat_scanin),
	.scan_out(itlb_bypass_lat_scanout),
	.din	(tsd_itlb_bypass[3:0]	),
	.dout	(itlb_bypass	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_bypass_d =
       | (itlb_bypass[3:0] & tid_dec_d[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_bypass_e_lat  (
	.scan_in(itlb_bypass_e_lat_scanin),
	.scan_out(itlb_bypass_e_lat_scanout),
	.din	(itlb_bypass_d		),
	.dout	(itlb_bypass_e		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_itlb_bypass_e =
       itlb_bypass_e;



////////////////////////////////////////////////////////////////////////////////
// Pipe signals from M to B 

assign l_tlu_twocycle_b_in =
       lsu_tlu_twocycle_m & dec_inst_valid_m & dec_lsu_inst_m;

tlu_fls_ctl_msff_ctl_macro__width_1 l_tlu_twocycle_b_lat  (
	.scan_in(l_tlu_twocycle_b_lat_scanin),
	.scan_out(l_tlu_twocycle_b_lat_scanout),
	.din	(l_tlu_twocycle_b_in		),
	.dout	(l_tlu_twocycle_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_m[1:0] =
       (dec_tid_m[1:0] & {2 {~twocycle_inst_b}}) |
       (tid_b    [1:0] & {2 { twocycle_inst_b}}) ;

tlu_fls_ctl_msff_ctl_macro__width_2 tid_b_lat  (
	.scan_in(tid_b_lat_scanin),
	.scan_out(tid_b_lat_scanout),
	.din	(tid_m		[1:0]	),
	.dout	(tid_b		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_m[3:0] = 
	{ tid_m[1] &  tid_m[0],
	  tid_m[1] & ~tid_m[0],
	 ~tid_m[1] &  tid_m[0],
	 ~tid_m[1] & ~tid_m[0]};

tlu_fls_ctl_msff_ctl_macro__width_4 fast_tid_dec_b_lat  (
	.scan_in(fast_tid_dec_b_lat_scanin),
	.scan_out(fast_tid_dec_b_lat_scanout),
	.din	(tid_dec_m	[3:0]	),
	.dout	(fast_tid_dec_b	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_tid_dec_b[3:0] = 
       fast_tid_dec_b[3:0];

assign inst_valid_m =
       dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 pre_inst_valid_b_lat  (
	.scan_in(pre_inst_valid_b_lat_scanin),
	.scan_out(pre_inst_valid_b_lat_scanout),
	.din	(inst_valid_m		),
	.dout	(pre_inst_valid_b	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_b[3:0] = 
	{ tid_b[1] &  tid_b[0],
	  tid_b[1] & ~tid_b[0],
	 ~tid_b[1] &  tid_b[0],
	 ~tid_b[1] & ~tid_b[0]};

tlu_fls_ctl_msff_ctl_macro__width_4 tl_eq_0_lat  (
	.scan_in(tl_eq_0_lat_scanin),
	.scan_out(tl_eq_0_lat_scanout),
	.din	(trl_tl_eq_0	[3:0]	),
	.dout	(tl_eq_0	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tl_eq_0_b = 
       (| (tl_eq_0[3:0] & tid_dec_b[3:0]));

assign inst_valid_b = 
       pre_inst_valid_b & ~flush_b;

// bsee_flush_b means there was an earlier block store with ECC error
// that is being injected 'just before' the next instruction for that thread
// coming down the pipe
assign flush_b = 
       (preflush_exu_b & exception_for_w) | bsee_flush_b;

assign lsu_inst_m =
       (dec_lsu_inst_m & ~twocycle_inst_b & dec_inst_valid_m) |
       (    lsu_inst_b &  twocycle_inst_b) ;

tlu_fls_ctl_msff_ctl_macro__width_1 lsu_inst_b_lat  (
	.scan_in(lsu_inst_b_lat_scanin),
	.scan_out(lsu_inst_b_lat_scanout),
	.din	(lsu_inst_m		),
	.dout	(lsu_inst_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_dfd_lsu_inst_b =
       lsu_inst_b & pre_inst_valid_b;

assign fgu_inst_m =
       dec_fgu_inst_m & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 fgu_inst_b_lat  (
	.scan_in(fgu_inst_b_lat_scanin),
	.scan_out(fgu_inst_b_lat_scanout),
	.din	(fgu_inst_m		),
	.dout	(fgu_inst_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign illegal_inst_b_in =
       dec_illegal_inst_m & ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 illegal_inst_b_lat  (
	.scan_in(illegal_inst_b_lat_scanin),
	.scan_out(illegal_inst_b_lat_scanout),
	.din	(illegal_inst_b_in	),
	.dout	(pillegal_inst_b	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign illegal_inst_b =
       pillegal_inst_b | (lsu_illegal_inst_b & lsu_inst_b) |
       illegal_sir_b | illegal_done_inst_b | illegal_retry_inst_b;

assign itlb_miss_m =
       dec_exc_m[4:0] == 5'b00001;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_miss_b_lat  (
	.scan_in(itlb_miss_b_lat_scanin),
	.scan_out(itlb_miss_b_lat_scanout),
	.din	(itlb_miss_m		),
	.dout	(itlb_miss_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ra_itlb_miss_m =
       dec_exc_m[4:0] == 5'b00100;

tlu_fls_ctl_msff_ctl_macro__width_1 ra_itlb_miss_b_lat  (
	.scan_in(ra_itlb_miss_b_lat_scanin),
	.scan_out(ra_itlb_miss_b_lat_scanout),
	.din	(ra_itlb_miss_m		),
	.dout	(ra_itlb_miss_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_priv_exc_m =
       dec_exc_m[4:0] == 5'b00010;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_priv_exc_b_lat  (
	.scan_in(itlb_priv_exc_b_lat_scanin),
	.scan_out(itlb_priv_exc_b_lat_scanout),
	.din	(itlb_priv_exc_m	),
	.dout	(itlb_priv_exc_b	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_nfo_exc_m =
       dec_exc_m[4:0] == 5'b10001;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_nfo_exc_b_lat  (
	.scan_in(itlb_nfo_exc_b_lat_scanin),
	.scan_out(itlb_nfo_exc_b_lat_scanout),
	.din	(itlb_nfo_exc_m		),
	.dout	(itlb_nfo_exc_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_l2_unde_m = 
       (dec_exc_m[4:0] == 5'b01111) | 
       (dec_exc_m[4:0] == 5'b10000) |
       (dec_exc_m[4:0] == 5'b10111) | 
       (dec_exc_m[4:0] == 5'b11000) ;

tlu_fls_ctl_msff_ctl_macro__width_1 i_l2_unde_b_lat  (
	.scan_in(i_l2_unde_b_lat_scanin),
	.scan_out(i_l2_unde_b_lat_scanout),
	.din	(i_l2_unde_m		),
	.dout	(i_l2_unde_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_oor_va_m =
       dec_exc_m[4:0] == 5'b00011;

tlu_fls_ctl_msff_ctl_macro__width_1 i_oor_va_b_lat  (
	.scan_in(i_oor_va_b_lat_scanin),
	.scan_out(i_oor_va_b_lat_scanout),
	.din	(i_oor_va_m		),
	.dout	(i_oor_va_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_ra_oor_va_m =
       dec_exc_m[4:0] == 5'b10011;

tlu_fls_ctl_msff_ctl_macro__width_1 i_ra_oor_va_b_lat  (
	.scan_in(i_ra_oor_va_b_lat_scanin),
	.scan_out(i_ra_oor_va_b_lat_scanout),
	.din	(i_ra_oor_va_m		),
	.dout	(i_ra_oor_va_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_err_m =
       (dec_exc_m[4:0] == 5'b00111) | 
       (dec_exc_m[4:0] == 5'b11111) | 
       (dec_exc_m[4:0] == 5'b01001) ;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_err_b_lat  (
	.scan_in(itlb_err_b_lat_scanin),
	.scan_out(itlb_err_b_lat_scanout),
	.din	(itlb_err_m		),
	.dout	(itlb_err_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pre_icache_exc_m = 
       itlb_miss_m | ra_itlb_miss_m | itlb_priv_exc_m | itlb_nfo_exc_m |
       i_oor_va_m | i_ra_oor_va_m | itlb_err_m;

assign ic_err_m = 
       (dec_exc_m[4:0] == 5'b01010) | // ICVP
       (dec_exc_m[4:0] == 5'b01011) | // ICTP
       (dec_exc_m[4:0] == 5'b01100) | // ICTM
       (dec_icache_perr_m & ~pre_icache_exc_m) ; // ICDP

tlu_fls_ctl_msff_ctl_macro__width_1 ic_err_b_lat  (
	.scan_in(ic_err_b_lat_scanin),
	.scan_out(ic_err_b_lat_scanout),
	.din	(ic_err_m		),
	.dout	(ic_err_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign done_inst_b_in =
       dec_done_inst_m & ~dec_illegal_inst_m &
       ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 done_inst_b_lat  (
	.scan_in(done_inst_b_lat_scanin),
	.scan_out(done_inst_b_lat_scanout),
	.din	(done_inst_b_in		),
	.dout	(pdone_inst_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign done_inst_b =
       pdone_inst_b & ~tl_eq_0_b & ~priv_exc_b;

assign illegal_done_inst_b = 
       pdone_inst_b &  tl_eq_0_b & ~priv_exc_b;

assign retry_inst_b_in =
       dec_retry_inst_m & ~dec_illegal_inst_m &
       ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 retry_inst_b_lat  (
	.scan_in(retry_inst_b_lat_scanin),
	.scan_out(retry_inst_b_lat_scanout),
	.din	(retry_inst_b_in	),
	.dout	(pretry_inst_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign retry_inst_b =
       pretry_inst_b & ~tl_eq_0_b & ~priv_exc_b;

assign illegal_retry_inst_b = 
       pretry_inst_b &  tl_eq_0_b & ~priv_exc_b;

assign sir_b_in = 
       dec_sir_inst_m & ~dec_illegal_inst_m & ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 sir_b_lat  (
	.scan_in(sir_b_lat_scanin),
	.scan_out(sir_b_lat_scanout),
	.din	(sir_b_in		),
	.dout	(psir_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign in_hpriv_b = 
       ( | (tid_dec_b[3:0] & hpstate_hpriv[3:0]));

assign sir_b =
       psir_b & in_hpriv_b;

assign illegal_sir_b =
       psir_b & ~in_hpriv_b;

assign hpriv_exc_b_in =
       dec_hpriv_exc_m & ~dec_illegal_inst_m & ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 hpriv_exc_b_lat  (
	.scan_in(hpriv_exc_b_lat_scanin),
	.scan_out(hpriv_exc_b_lat_scanout),
	.din	(hpriv_exc_b_in		),
	.dout	(hpriv_exc_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// DEC generates privileged exceptions only on legal instructions so TLU
// can prioritize it correctly
assign priv_exc_b_in =
       dec_priv_exc_m & ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 priv_exc_b_lat  (
	.scan_in(priv_exc_b_lat_scanin),
	.scan_out(priv_exc_b_lat_scanout),
	.din	(priv_exc_b_in		),
	.dout	(priv_exc_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpdisable_exc_b_in =
       dec_fpdisable_exc_m & ~dec_illegal_inst_m & ~dec_icache_perr_m;

tlu_fls_ctl_msff_ctl_macro__width_1 fpdisable_exc_b_lat  (
	.scan_in(fpdisable_exc_b_lat_scanin),
	.scan_out(fpdisable_exc_b_lat_scanout),
	.din	(fpdisable_exc_b_in	),
	.dout	(fpdisable_exc_b	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign e_cecc_b_in =
       exu_cecc_m & (dec_inst_valid_m | twocycle_inst_b);
assign e_uecc_b_in =
       exu_uecc_m & (dec_inst_valid_m | twocycle_inst_b);
tlu_fls_ctl_msff_ctl_macro__width_2 ecc_b_lat  (
	.scan_in(ecc_b_lat_scanin),
	.scan_out(ecc_b_lat_scanout),
	.din	({e_cecc_b_in	       ,
		  e_uecc_b_in	       }),
	.dout	({e_cecc_b	       ,
		  e_uecc_b	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_irf_cecc_b =
       e_cecc_b;
assign fls_irf_uecc_b =
       e_uecc_b;

assign misalign_b_in =
       exu_misalign_m & ~exu_cecc_m & ~exu_uecc_m & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 misalign_b_lat  (
	.scan_in(misalign_b_lat_scanin),
	.scan_out(misalign_b_lat_scanout),
	.din	(misalign_b_in		),
	.dout	(misalign_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 e_oor_va_b_lat  (
	.scan_in(e_oor_va_b_lat_scanin),
	.scan_out(e_oor_va_b_lat_scanout),
	.din	(exu_oor_va_m		),
	.dout	(pe_oor_va_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign e_oor_va_b =
       pe_oor_va_b & ~e_cecc_b & ~e_uecc_b & pre_inst_valid_b & ~pstate_am_b;

assign e_tcc_b_in =
       exu_tcc_m & ~exu_cecc_m & ~exu_uecc_m & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 e_tcc_b_lat  (
	.scan_in(e_tcc_b_lat_scanin),
	.scan_out(e_tcc_b_lat_scanout),
	.din	(e_tcc_b_in		),
	.dout	(e_tcc_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign e_tof_b_in =
       exu_tof_m & ~exu_cecc_m & ~exu_uecc_m & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 e_tof_b_lat  (
	.scan_in(e_tof_b_lat_scanin),
	.scan_out(e_tof_b_lat_scanout),
	.din	(e_tof_b_in		),
	.dout	(e_tof_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign e_fill_b_in =
       exu_fill_m & ~exu_cecc_m & ~exu_uecc_m & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 e_fill_b_lat  (
	.scan_in(e_fill_b_lat_scanin),
	.scan_out(e_fill_b_lat_scanout),
	.din	(e_fill_b_in		),
	.dout	(e_fill_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);




// Possible exceptions on branches:
// - decode exceptions
// - VA out of range on branch
// - Misaligned address (for jmpl and return)
// - Fill exceptions (for return)
// - disrupting exceptions
// - PMU and debug exceptions
assign br_exc_b =
       pdec_exc_b | br_oor_va_b | br_ra_oor_va_b | misalign_b |
       e_fill_b | 
       e_cecc_b | e_uecc_b |
       (| perf_trap_b[3:0]) | ibp_b | iaw_b | tct_b | target_oor_b |
       disrupting_flush_pending_tid_dec_b;

assign br_taken_b_in =
       dec_br_taken_m & dec_inst_valid_m & ~dec_illegal_inst_m;

tlu_fls_ctl_msff_ctl_macro__width_1 br_taken_b_lat  (
	.scan_in(br_taken_b_lat_scanin),
	.scan_out(br_taken_b_lat_scanout),
	.din	(br_taken_b_in		),
	.dout	(pre_br_taken_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign br_taken_b =
       pre_br_taken_b & ~br_exc_b;

tlu_fls_ctl_msff_ctl_macro__width_1 annul_ds_m_lat  (
	.scan_in(annul_ds_m_lat_scanin),
	.scan_out(annul_ds_m_lat_scanout),
	.din	(dec_annul_ds_m		),
	.dout	(pre_annul_ds_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign annul_ds_b =
       pre_annul_ds_b & ~br_exc_b;

tlu_fls_ctl_msff_ctl_macro__width_1 ds_b_lat  (
	.scan_in(ds_b_lat_scanin),
	.scan_out(ds_b_lat_scanout),
	.din	(dec_ds_m		),
	.dout	(pre_ds_b		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ds_b =
       pre_ds_b & ~ibp_b & ~iaw_b & ~tct_b & ~target_oor_b & 
       ~(| {perf_trap_b[3:0],
	    disrupting_flush_pending_tid_dec_b});

// This takes care of M stage flushes
// Take PMU trap if IE == 1 and PIL != 15
assign perf_trap_m[3:0] = 
       pmu_tlu_trap_m[3:0] & tid_dec_m[3:0] & pil_mask_15[3:0] &
       {4 {dec_inst_valid_m}};

tlu_fls_ctl_msff_ctl_macro__width_4 perf_trap_b_lat  (
	.scan_in(perf_trap_b_lat_scanin),
	.scan_out(perf_trap_b_lat_scanout),
	.din	(perf_trap_m	[3:0]	),
	.dout	(perf_trap_b	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 pil_mask_15_lat  (
	.scan_in(pil_mask_15_lat_scanin),
	.scan_out(pil_mask_15_lat_scanout),
	.din	(trl_pil_mask_15	[3:0]	),
	.dout	(pil_mask_15		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Instruction breakpoint
assign ibe_m =
       | (tsd_hpstate_ibe[3:0] & tid_dec_m[3:0]);

assign ibp_b_in =
       exu_ibp_m & ibe_m & dec_inst_valid_m & ~itlb_err_m & 
       ~i_l2_unde_m & ~ic_err_m;

tlu_fls_ctl_msff_ctl_macro__width_1 ibp_b_lat  (
	.scan_in(ibp_b_lat_scanin),
	.scan_out(ibp_b_lat_scanout),
	.din	(ibp_b_in			),
	.dout	(ibp_b				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_va_pa_enabled = 
       | (tid_dec_m[3:0] & ~hpstate_hpriv[3:0] & 
	  ~tsd_hpstate_red[3:0] & immu_enable[3:0]);

assign iaw_exc_m_in = 
       (& pct_iaw_exc_e[1:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 iaw_exc_m_lat  (
	.scan_in(iaw_exc_m_lat_scanin),
	.scan_out(iaw_exc_m_lat_scanout),
	.din	(iaw_exc_m_in			),
	.dout	(iaw_exc_m			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign iaw_b_in =
       iaw_exc_m & itlb_va_pa_enabled & dec_inst_valid_m;

tlu_fls_ctl_msff_ctl_macro__width_1 iaw_b_lat  (
	.scan_in(iaw_b_lat_scanin),
	.scan_out(iaw_b_lat_scanout),
	.din	(iaw_b_in			),
	.dout	(iaw_b				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pstate_tct_m = 
       | (tid_dec_m[3:0] & tsd_pstate_tct[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 pstate_tct_b_lat  (
	.scan_in(pstate_tct_b_lat_scanin),
	.scan_out(pstate_tct_b_lat_scanout),
	.din	(pstate_tct_m			),
	.dout	(pstate_tct_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tct_b_in_b =
       ~(((dec_br_taken_m & ~exu_cecc_m & ~exu_uecc_m) | 
	 dec_done_inst_m | dec_retry_inst_m) & 
        dec_inst_valid_m & ~dec_illegal_inst_m & pstate_tct_m);

assign tct_b_in =
       ~(tct_b_in_b | exu_fill_m);

tlu_fls_ctl_msff_ctl_macro__width_1 tct_b_lat  (
	.scan_in(tct_b_lat_scanin),
	.scan_out(tct_b_lat_scanout),
	.din	(tct_b_in			),
	.dout	(ptct_b				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tct_b =
       ptct_b | (e_tcc_b & pstate_tct_b);


assign cti_b_in =
       dec_cti_inst_m | dec_done_inst_m | dec_retry_inst_m;

tlu_fls_ctl_msff_ctl_macro__width_1 cti_b_lat  (
	.scan_in(cti_b_lat_scanin),
	.scan_out(cti_b_lat_scanout),
	.din	(cti_b_in			),
	.dout	(cti_b				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Pipe signals from B to W

// lsu_tlu_twocycle_m means that the first beat is in M
// FGU pdist is handled differently
assign twocycle_inst_b =
       l_tlu_twocycle_b & lsu_inst_b & inst_valid_b & ~disrupting_flush_b &
       ~e_cecc_b & ~e_uecc_b & ~pmu_debug_exc_b & ~dec_flush_b ;

tlu_fls_ctl_msff_ctl_macro__width_1 twocycle_inst_w_lat  (
	.scan_in(twocycle_inst_w_lat_scanin),
	.scan_out(twocycle_inst_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(twocycle_inst_b	),
	.dout	(ptwocycle_inst_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign twocycle_inst_w =
       ptwocycle_inst_w & ~exc_for_w;

tlu_fls_ctl_msff_ctl_macro__width_1 d_flush_w_lat  (
	.scan_in(d_flush_w_lat_scanin),
	.scan_out(d_flush_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dec_flush_b		),
	.dout	(d_flush_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dec_inst_valid_b[3] = 
	 tid_b[1] &  tid_b[0] & inst_valid_b;
assign dec_inst_valid_b[2] = 		      
	 tid_b[1] & ~tid_b[0] & inst_valid_b;
assign dec_inst_valid_b[1] = 		      
	~tid_b[1] &  tid_b[0] & inst_valid_b;
assign dec_inst_valid_b[0] = 		      
	~tid_b[1] & ~tid_b[0] & inst_valid_b;

assign tid_dec_w_in[3:0] =
       dec_inst_valid_b[3:0] & {4 {~dec_flush_b}};

assign fls_tid_dec_w_in[3:0] =
	tid_dec_w_in[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 tid_dec_w_lat  (
	.scan_in(tid_dec_w_lat_scanin),
	.scan_out(tid_dec_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(tid_dec_w_in		[3:0]	),
	.dout	(tid_dec_w		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_tid_dec_w[3:0] =
       tid_dec_w[3:0];

assign pstate_am_b_in =
       | (tsd_pstate_am[3:0] & tid_dec_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 pstate_am_b_lat  (
	.scan_in(pstate_am_b_lat_scanin),
	.scan_out(pstate_am_b_lat_scanout),
	.din	(pstate_am_b_in		       	),
	.dout	(pstate_am_b		       	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_pstate_am_b_ =
	~pstate_am_b;

tlu_fls_ctl_msff_ctl_macro__width_1 pstate_am_w_lat  (
	.scan_in(pstate_am_w_lat_scanin),
	.scan_out(pstate_am_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(pstate_am_b	     		),
	.dout	(pstate_am_w		    	),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_pstate_am_w_ =
	~pstate_am_w;

assign dec_two_tid_b[3:0] = 
       { tid_b[1] &  tid_b[0],
	 tid_b[1] & ~tid_b[0],
	~tid_b[1] &  tid_b[0],
	~tid_b[1] & ~tid_b[0]} & 
       {4 {inst_valid_b | twocycle_inst_w}};

assign two_tid_dec_w_in[3:0] =
       dec_two_tid_b[3:0] & {4 {~dec_flush_b}};

tlu_fls_ctl_msff_ctl_macro__width_4 two_tid_dec_w_lat  (
	.scan_in(two_tid_dec_w_lat_scanin),
	.scan_out(two_tid_dec_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(two_tid_dec_w_in	[3:0]	),
	.dout	(two_tid_dec_w		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_fls_ctl_msff_ctl_macro__width_1 inst_valid_w_lat  (
	.scan_in(inst_valid_w_lat_scanin),
	.scan_out(inst_valid_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(inst_valid_b		),
	.dout	(pre_inst_valid_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign inst_valid_w =
       pre_inst_valid_w & ~d_flush_w;

assign illegal_inst_w_in =
       illegal_inst_b & 
       kill_exc_gt_6_lt_7_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 illegal_inst_w_lat  (
	.scan_in(illegal_inst_w_lat_scanin),
	.scan_out(illegal_inst_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(illegal_inst_w_in	),
	.dout	(illegal_inst_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_miss_w_in =
       itlb_miss_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_miss_w_lat  (
	.scan_in(itlb_miss_w_lat_scanin),
	.scan_out(itlb_miss_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(itlb_miss_w_in		),
	.dout	(itlb_miss_w		),
  .siclk(siclk),
  .soclk(soclk)
);


assign ra_itlb_miss_w_in =
       ra_itlb_miss_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 ra_itlb_miss_w_lat  (
	.scan_in(ra_itlb_miss_w_lat_scanin),
	.scan_out(ra_itlb_miss_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ra_itlb_miss_w_in	),
	.dout	(ra_itlb_miss_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_priv_exc_w_in =
       itlb_priv_exc_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_priv_exc_w_lat  (
	.scan_in(itlb_priv_exc_w_lat_scanin),
	.scan_out(itlb_priv_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(itlb_priv_exc_w_in	),
	.dout	(itlb_priv_exc_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_nfo_exc_w_in =
       itlb_nfo_exc_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_nfo_exc_w_lat  (
	.scan_in(itlb_nfo_exc_w_lat_scanin),
	.scan_out(itlb_nfo_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(itlb_nfo_exc_w_in	),
	.dout	(itlb_nfo_exc_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_l2_unde_w_in =
       i_l2_unde_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 i_l2_err_w_lat  (
	.scan_in(i_l2_err_w_lat_scanin),
	.scan_out(i_l2_err_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(i_l2_unde_w_in		),
	.dout	(i_l2_unde_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_oor_va_w_in =
       (i_oor_va_b | target_oor_va_b) & kill_exc_iar_irr_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 i_oor_va_w_lat  (
	.scan_in(i_oor_va_w_lat_scanin),
	.scan_out(i_oor_va_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(i_oor_va_w_in		),
	.dout	(i_oor_va_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_ra_oor_va_w_in =
       (i_ra_oor_va_b | target_ra_oor_va_b) & kill_exc_iar_irr_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 i_ra_oor_va_w_lat  (
	.scan_in(i_ra_oor_va_w_lat_scanin),
	.scan_out(i_ra_oor_va_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(i_ra_oor_va_w_in	),
	.dout	(i_ra_oor_va_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign itlb_err_w_in =
       itlb_err_b & ~m103663_exc_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 itlb_err_w_lat  (
	.scan_in(itlb_err_w_lat_scanin),
	.scan_out(itlb_err_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(itlb_err_w_in		),
	.dout	(itlb_err_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign ic_err_w_in =
       ic_err_b & ~itlb_err_b & ~m103663_exc_b & kill_exc_lt_6_b_;

assign icp_req_in =
       ic_err_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 ic_err_w_lat  (
	.scan_in(ic_err_w_lat_scanin),
	.scan_out(ic_err_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(icp_req_in		),
	.dout	(icp_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign done_inst_w_in =
       done_inst_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 done_inst_w_lat  (
	.scan_in(done_inst_w_lat_scanin),
	.scan_out(done_inst_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(done_inst_w_in		),
	.dout	(done_inst_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign retry_inst_w_in =
       retry_inst_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 retry_inst_w_lat  (
	.scan_in(retry_inst_w_lat_scanin),
	.scan_out(retry_inst_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(retry_inst_w_in	),
	.dout	(retry_inst_w		),
  .siclk(siclk),
  .soclk(soclk)
);

// Disrupting single step completion must be higher priority
// than SIR because it's really for the previous instruction
assign sir_w_in =
       sir_b & ~dsc_req_in & ~target_oor_b;

tlu_fls_ctl_msff_ctl_macro__width_1 sir_w_lat  (
	.scan_in(sir_w_lat_scanin),
	.scan_out(sir_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(sir_w_in		),
	.dout	(sir_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign hpriv_exc_w_in =
       hpriv_exc_b & kill_exc_gt_6_lt_7_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 hpriv_exc_w_lat  (
	.scan_in(hpriv_exc_w_lat_scanin),
	.scan_out(hpriv_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(hpriv_exc_w_in		),
	.dout	(hpriv_exc_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign priv_exc_w_in =
       priv_exc_b & ~illegal_inst_b & ~hpriv_exc_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 priv_exc_w_lat  (
	.scan_in(priv_exc_w_lat_scanin),
	.scan_out(priv_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(priv_exc_w_in		),
	.dout	(priv_exc_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpdisable_exc_w_in =
       fpdisable_exc_b & ~(lsu_inst_b & lsu_illegal_inst_b) & 
       kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 fpdisable_exc_w_lat  (
	.scan_in(fpdisable_exc_w_lat_scanin),
	.scan_out(fpdisable_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(fpdisable_exc_w_in	),
	.dout	(fpdisable_exc_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tcc_w_in =
       e_tcc_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 tcc_w_lat  (
	.scan_in(tcc_w_lat_scanin),
	.scan_out(tcc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(tcc_w_in		),
	.dout	(tcc_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign tof_w_in =
       e_tof_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 tof_w_lat  (
	.scan_in(tof_w_lat_scanin),
	.scan_out(tof_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(tof_w_in		),
	.dout	(tof_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign kill_e_f_ecc_b =
       lsu_inst_b & lsu_illegal_inst_b;

assign e_ecc_b =
       e_cecc_b | e_uecc_b;

assign e_f_ecc_w_in =
       (e_ecc_b &              ~kill_e_f_ecc_b & kill_exc_ge_7_lt_11_b_) | 
       (f_ecc_b & fgu_inst_b & ~kill_e_f_ecc_b & kill_exc_ge_7_lt_11_b_);

tlu_fls_ctl_msff_ctl_macro__width_1 e_ecc_w_lat  (
	.scan_in(e_ecc_w_lat_scanin),
	.scan_out(e_ecc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(e_f_ecc_w_in		),
	.dout	(e_f_ecc_w		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 kill_irf_ecc_w_lat  (
	.scan_in(kill_irf_ecc_w_lat_scanin),
	.scan_out(kill_irf_ecc_w_lat_scanout),
	.din	(kill_e_f_ecc_b		),
	.dout	(kill_e_f_ecc_w		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_kill_irf_ecc_w =
       kill_e_f_ecc_w;

assign e_misalign_b =
       misalign_b & ~fnn_b & ~fno_b;

assign e_misalign_w_in =
       e_misalign_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 e_misalign_w_lat  (
	.scan_in(e_misalign_w_lat_scanin),
	.scan_out(e_misalign_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(e_misalign_w_in	),
	.dout	(e_misalign_w		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 immu_enable_lat  (
	.scan_in(immu_enable_lat_scanin),
	.scan_out(immu_enable_lat_scanout),
	.din	(lsu_immu_enable	[3:0]	),
	.dout	(immu_enable		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign br_real_b =
       | (~itlb_bypass[3:0] & ~immu_enable[3:0] & tid_dec_b[3:0]);

assign br_bypass_b =
       | ( itlb_bypass[3:0] &                       tid_dec_b[3:0]);

assign br_oor_va_b =
       e_oor_va_b & pre_br_taken_b & ~e_fill_b & 
       ~misalign_b & ~tct_b & ~br_real_b & ~br_bypass_b;

// Kill ld_oor_va_b if FGU inst with FRF ECC error
assign ld_oor_va_b =
       e_oor_va_b & ~lsu_va_watchpoint_b & ~lsu_tlb_bypass_b & ~lsu_align_b &
       ~lsu_stdf_align_b & ~lsu_lddf_align_b & ~lsu_priv_action_b & 
       ~lsu_tlb_real_b & ~lsu_illegal_inst_b & ~fpdisable_exc_b & 
       lsu_inst_b & (~fgu_inst_b | ~f_ecc_b);

assign br_oor_va_w_in =
       br_oor_va_b & kill_exc_ge_7_lt_11_b_;

assign br_ld_oor_va_w_in =
       (br_oor_va_b | ld_oor_va_b) & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 br_ld_oor_va_w_lat  (
	.scan_in(br_ld_oor_va_w_lat_scanin),
	.scan_out(br_ld_oor_va_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(br_ld_oor_va_w_in	),
	.dout	(br_ld_oor_va_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign br_ra_oor_va_b =
       e_oor_va_b & pre_br_taken_b & ~e_fill_b & 
       ~misalign_b & ~tct_b & br_real_b;

// Kill ld_ra_oor_va_b if FGU inst with FRF ECC error
assign ld_ra_oor_va_b =
       e_oor_va_b & ~lsu_va_watchpoint_b & ~lsu_tlb_bypass_b & ~lsu_align_b &
       ~lsu_stdf_align_b & ~lsu_lddf_align_b & ~lsu_priv_action_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b & lsu_inst_b & lsu_tlb_real_b & 
       (~fgu_inst_b | ~f_ecc_b);

assign br_ra_oor_va_w_in =
       br_ra_oor_va_b & kill_exc_ge_7_lt_11_b_;

assign br_ld_ra_oor_va_w_in =
       (br_ra_oor_va_b | ld_ra_oor_va_b) & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 br_ld_ra_oor_va_w_lat  (
	.scan_in(br_ld_ra_oor_va_w_lat_scanin),
	.scan_out(br_ld_ra_oor_va_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(br_ld_ra_oor_va_w_in	),
	.dout	(br_ld_ra_oor_va_w	),
  .siclk(siclk),
  .soclk(soclk)
);

// Hang onto VA hole exceptions on branches with delay slots when the branch
// occurs with the TLB in bypass mode because the delay slot instruction can
// take us out of bypass.  In this case, the processor should take an
// instruction_address_range or instruction_real_range trap on the target

// Same basic scenario, but PSTATE.am is set when branch is executed but
// clears due to delay slot.

// Same scenario, but now take a trap in the delay slot and return from
// trap handler while changing PSTATE.am or activating translation
//
// So the generic fix is to carry a 'oor_va' bit with the PC and NPC
// even into the trap stack.  pct tracks the 'oor_va' bit into the E stage

tlu_fls_ctl_msff_ctl_macro__width_2 pc_oor_va_b_lat  (
	.scan_in(pc_oor_va_b_lat_scanin),
	.scan_out(pc_oor_va_b_lat_scanout),
	.din	({pct_pc_oor_va_e	       ,
		  pc_oor_va_m		       }),
	.dout	({pc_oor_va_m		       ,
		  pc_oor_va_b		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// instruction_VA_watchpoint is higher priority
assign target_oor_b = 
       pc_oor_va_b & pre_inst_valid_b & ~br_bypass_b & ~pstate_am_b & ~iaw_b;

assign target_oor_va_b =
       target_oor_b & ~br_real_b;

assign target_ra_oor_va_b =
       target_oor_b &  br_real_b;

assign snn_b = 
       exu_spill_b &  exu_normal_b & ~e_cecc_b & ~e_uecc_b;
assign sno_b = 
       exu_spill_b & ~exu_normal_b & ~e_cecc_b & ~e_uecc_b;
assign fnn_b = 
       e_fill_b  &  exu_normal_b & ~e_cecc_b & ~e_uecc_b;
assign fno_b = 
       e_fill_b  & ~exu_normal_b & ~e_cecc_b & ~e_uecc_b;

assign snn_w_in =
       snn_b & kill_exc_ge_7_lt_11_b_;
assign sno_w_in =
       sno_b & kill_exc_ge_7_lt_11_b_;
assign fnn_w_in =
       fnn_b & kill_exc_ge_7_lt_11_b_;
assign fno_w_in =
       fno_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 snn_w_lat  (
	.scan_in(snn_w_lat_scanin),
	.scan_out(snn_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(snn_w_in		),
	.dout	(snn_w			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 sno_w_lat  (
	.scan_in(sno_w_lat_scanin),
	.scan_out(sno_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(sno_w_in		),
	.dout	(sno_w			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 fnn_w_lat  (
	.scan_in(fnn_w_lat_scanin),
	.scan_out(fnn_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(fnn_w_in		),
	.dout	(fnn_w			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 fno_w_lat  (
	.scan_in(fno_w_lat_scanin),
	.scan_out(fno_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(fno_w_in		),
	.dout	(fno_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign clw_b = 
       exu_cleanwin_b & ~e_cecc_b & ~e_uecc_b;

assign clw_w_in =
       clw_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 clw_w_lat  (
	.scan_in(clw_w_lat_scanin),
	.scan_out(clw_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(clw_w_in		),
	.dout	(clw_w			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 lsu_inst_w_lat  (
	.scan_in(lsu_inst_w_lat_scanin),
	.scan_out(lsu_inst_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(lsu_inst_b		),
	.dout	(lsu_inst_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_lsu_inst_w =
       lsu_inst_w & pre_inst_valid_w;

tlu_fls_ctl_msff_ctl_macro__width_1 cti_w_lat  (
	.scan_in(cti_w_lat_scanin),
	.scan_out(cti_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(cti_b			),
	.dout	(cti_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign wstate3_b[2:0] = 
	({3 { dec_inst_valid_b[3]}} & exu_wstate_b	[2:0]) | 
	({3 {~dec_inst_valid_b[3]}} & wstate3_w	[2:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_3 wstate3_w_lat  (
	.scan_in(wstate3_w_lat_scanin),
	.scan_out(wstate3_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(wstate3_b	[2:0]	),
	.dout	(wstate3_w	[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign wstate2_b[2:0] = 
	({3 { dec_inst_valid_b[2]}} & exu_wstate_b	[2:0]) | 
	({3 {~dec_inst_valid_b[2]}} & wstate2_w	[2:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_3 wstate2_w_lat  (
	.scan_in(wstate2_w_lat_scanin),
	.scan_out(wstate2_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(wstate2_b	[2:0]	),
	.dout	(wstate2_w	[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign wstate1_b[2:0] = 
	({3 { dec_inst_valid_b[1]}} & exu_wstate_b	[2:0]) | 
	({3 {~dec_inst_valid_b[1]}} & wstate1_w	[2:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_3 wstate1_w_lat  (
	.scan_in(wstate1_w_lat_scanin),
	.scan_out(wstate1_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(wstate1_b	[2:0]	),
	.dout	(wstate1_w	[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign wstate0_b[2:0] = 
	({3 { dec_inst_valid_b[0]}} & exu_wstate_b	[2:0]) | 
	({3 {~dec_inst_valid_b[0]}} & wstate0_w	[2:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_3 wstate0_w_lat  (
	.scan_in(wstate0_w_lat_scanin),
	.scan_out(wstate0_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(wstate0_b	[2:0]	),
	.dout	(wstate0_w	[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_wstate3[2:0] =
       wstate3_w[2:0];
assign fls_wstate2[2:0] =
       wstate2_w[2:0];
assign fls_wstate1[2:0] =
       wstate1_w[2:0];
assign fls_wstate0[2:0] =
       wstate0_w[2:0];

assign in_user_b = 
       ( | (tid_dec_b[3:0] & 
	    ~(hpstate_hpriv[3:0] | tsd_pstate_priv[3:0])));

assign trap_number_b[7:0] =
       {exu_trap_number_b[7] & ~in_user_b, exu_trap_number_b[6:0]};

tlu_fls_ctl_msff_ctl_macro__width_8 trap_number_w_lat  (
	.scan_in(trap_number_w_lat_scanin),
	.scan_out(trap_number_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(trap_number_b		[7:0]	),
	.dout	(trap_number_w		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign trap_number_3_in[7:0] = 
	({8 { tid_dec_w[3]}} & trap_number_w		[7:0]) | 
	({8 {~tid_dec_w[3]}} & trap_number_3		[7:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_8 trap_number_3_lat  (
	.scan_in(trap_number_3_lat_scanin),
	.scan_out(trap_number_3_lat_scanout),
	.din	(trap_number_3_in	[7:0]	),
	.dout	(trap_number_3		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trap_number_2_in[7:0] = 
	({8 { tid_dec_w[2]}} & trap_number_w		[7:0]) |
	({8 {~tid_dec_w[2]}} & trap_number_2		[7:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_8 trap_number_2_lat  (
	.scan_in(trap_number_2_lat_scanin),
	.scan_out(trap_number_2_lat_scanout),
	.din	(trap_number_2_in	[7:0]	),
	.dout	(trap_number_2		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trap_number_1_in[7:0] = 
	({8 { tid_dec_w[1]}} & trap_number_w		[7:0]) | 
	({8 {~tid_dec_w[1]}} & trap_number_1		[7:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_8 trap_number_1_lat  (
	.scan_in(trap_number_1_lat_scanin),
	.scan_out(trap_number_1_lat_scanout),
	.din	(trap_number_1_in	[7:0]	),
	.dout	(trap_number_1		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trap_number_0_in[7:0] = 
	({8 { tid_dec_w[0]}} & trap_number_w		[7:0]) | 
	({8 {~tid_dec_w[0]}} & trap_number_0		[7:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_8 trap_number_0_lat  (
	.scan_in(trap_number_0_lat_scanin),
	.scan_out(trap_number_0_lat_scanout),
	.din	(trap_number_0_in	[7:0]	),
	.dout	(trap_number_0		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_tcc_number_3[7:0] = 
	trap_number_3_in[7:0];
assign fls_tcc_number_2[7:0] = 
	trap_number_2_in[7:0];
assign fls_tcc_number_1[7:0] = 
	trap_number_1_in[7:0];
assign fls_tcc_number_0[7:0] = 
	trap_number_0_in[7:0];

assign lddf_align_b = 
       lsu_lddf_align_b & lsu_inst_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;

assign lddf_align_w_in =
       lddf_align_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 lddf_align_w_lat  (
	.scan_in(lddf_align_w_lat_scanin),
	.scan_out(lddf_align_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(lddf_align_w_in	),
	.dout	(lddf_align_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign stdf_align_b = 
       lsu_stdf_align_b & lsu_inst_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;

assign stdf_align_w_in =
       stdf_align_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 stdf_align_w_lat  (
	.scan_in(stdf_align_w_lat_scanin),
	.scan_out(stdf_align_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(stdf_align_w_in	),
	.dout	(stdf_align_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign daccess_prot_b = 
       lsu_daccess_prot_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_priv_action_b & ~lsu_stdf_align_b & ~lsu_lddf_align_b &
       ~lsu_va_watchpoint_b & ~lsu_dae_invalid_asi_b & 
       ~lsu_dae_priv_viol_b & ~lsu_dae_nc_page_b & ~lsu_dae_nfo_page_b & 
       ~lsu_dae_so_page & ~dtlb_error_b & lsu_inst_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;

assign daccess_prot_w_in =
       daccess_prot_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 daccess_prot_w_lat  (
	.scan_in(daccess_prot_w_lat_scanin),
	.scan_out(daccess_prot_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(daccess_prot_w_in	),
	.dout	(daccess_prot_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign priv_action_b = 
       lsu_priv_action_b &
       ~lsu_align_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_stdf_align_b & ~lsu_lddf_align_b & lsu_inst_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;


assign priv_action_w_in =
       priv_action_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 priv_action_w_lat  (
	.scan_in(priv_action_w_lat_scanin),
	.scan_out(priv_action_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(priv_action_w_in	),
	.dout	(priv_action_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign va_watchpoint_b = 
       lsu_va_watchpoint_b & ~lsu_tlb_bypass_b & ~lsu_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_priv_action_b & ~lsu_stdf_align_b & ~lsu_lddf_align_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b &
       lsu_inst_b;

assign va_watchpoint_w_in =
       va_watchpoint_b & kill_exc_ge_7_lt_11_b_; 

tlu_fls_ctl_msff_ctl_macro__width_1 va_watchpoint_w_lat  (
	.scan_in(va_watchpoint_w_lat_scanin),
	.scan_out(va_watchpoint_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(va_watchpoint_w_in	),
	.dout	(va_watchpoint_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pa_watchpoint_b = 
       lsu_pa_watchpoint_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       lsu_tlb_miss_b_ &
       ~lsu_align_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_priv_action_b & ~lsu_stdf_align_b & ~lsu_lddf_align_b &
       ~lsu_va_watchpoint_b & ~lsu_dae_invalid_asi_b & 
       ~lsu_dae_priv_viol_b & ~lsu_dae_nc_page_b & ~lsu_dae_nfo_page_b & 
       ~lsu_dae_so_page & ~dtlb_error_b & ~lsu_daccess_prot_b & lsu_inst_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;

assign pa_watchpoint_w_in =
       pa_watchpoint_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 pa_watchpoint_w_lat  (
	.scan_in(pa_watchpoint_w_lat_scanin),
	.scan_out(pa_watchpoint_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(pa_watchpoint_w_in	),
	.dout	(pa_watchpoint_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign align_b =
       lsu_align_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & lsu_inst_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b;


assign align_w_in =
       align_b & kill_exc_ge_7_lt_11_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 align_w_lat  (
	.scan_in(align_w_lat_scanin),
	.scan_out(align_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(align_w_in		),
	.dout	(align_w		),
  .siclk(siclk),
  .soclk(soclk)
);

// lsu_perfmon_trap_b can assert for TLB miss or for data cache miss
// If both signals assert, then the pic_overflow should have priority
// if the trap is not masked
assign dtlb_miss_b =
       ~lsu_tlb_miss_b_ & lsu_inst_b & ~lsu_tlb_real_b & ~lsu_priv_action_b & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & ~e_oor_va_b &
       ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & ~fpdisable_exc_b & 
       ~lsu_dae_invalid_asi_b &
       ~perfmon_trap_b &
       ~ld_oor_va_b & ~ld_ra_oor_va_b & ~dtlb_error_b;

assign dtlb_miss_w_in =
       dtlb_miss_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dtlb_w_lat  (
	.scan_in(dtlb_w_lat_scanin),
	.scan_out(dtlb_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dtlb_miss_w_in		),
	.dout	(dtlb_miss_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ra_dtlb_miss_b =
       ~lsu_tlb_miss_b_ & lsu_inst_b & lsu_tlb_real_b & ~lsu_priv_action_b & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & ~e_oor_va_b &
       ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & ~fpdisable_exc_b & 
       ~lsu_dae_invalid_asi_b & 
       ~perfmon_trap_b &
       ~ld_oor_va_b & ~ld_ra_oor_va_b & ~dtlb_error_b;

assign ra_dtlb_miss_w_in =
       ra_dtlb_miss_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 ra_dtlb_w_lat  (
	.scan_in(ra_dtlb_w_lat_scanin),
	.scan_out(ra_dtlb_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ra_dtlb_miss_w_in	),
	.dout	(ra_dtlb_miss_w		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 l_real_w_lat  (
	.scan_in(l_real_w_lat_scanin),
	.scan_out(l_real_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(lsu_tlb_real_b		),
	.dout	(l_real_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dae_invalid_asi_b = 
       lsu_dae_invalid_asi_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) &
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_priv_action_b & ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & 
       ~fpdisable_exc_b & lsu_inst_b;

assign dae_invalid_asi_w_in =
       dae_invalid_asi_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dae_invalid_asi_w_lat  (
	.scan_in(dae_invalid_asi_w_lat_scanin),
	.scan_out(dae_invalid_asi_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dae_invalid_asi_w_in	),
	.dout	(dae_invalid_asi_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign dae_nc_page_b = 
       lsu_dae_nc_page_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_dae_invalid_asi_b & ~lsu_dae_priv_viol_b & ~lsu_priv_action_b & 
       ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & ~fpdisable_exc_b & 
       ~dtlb_error_b & lsu_inst_b;

assign dae_nc_page_w_in =
       dae_nc_page_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dae_nc_page_w_lat  (
	.scan_in(dae_nc_page_w_lat_scanin),
	.scan_out(dae_nc_page_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dae_nc_page_w_in	),
	.dout	(dae_nc_page_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dae_nfo_page_b = 
       lsu_dae_nfo_page_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_dae_invalid_asi_b & ~lsu_dae_priv_viol_b & ~lsu_dae_nc_page_b & 
       ~lsu_priv_action_b & ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & 
       ~fpdisable_exc_b & ~dtlb_error_b & lsu_inst_b;

assign dae_nfo_page_w_in =
       dae_nfo_page_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dae_nfo_page_w_lat  (
	.scan_in(dae_nfo_page_w_lat_scanin),
	.scan_out(dae_nfo_page_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dae_nfo_page_w_in	),
	.dout	(dae_nfo_page_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dae_priv_viol_b = 
       lsu_dae_priv_viol_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_dae_invalid_asi_b & ~lsu_priv_action_b & ~lsu_va_watchpoint_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b & ~dtlb_error_b & lsu_inst_b;

assign dae_priv_viol_w_in =
       dae_priv_viol_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dae_priv_viol_w_lat  (
	.scan_in(dae_priv_viol_w_lat_scanin),
	.scan_out(dae_priv_viol_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dae_priv_viol_w_in	),
	.dout	(dae_priv_viol_w	),
  .siclk(siclk),
  .soclk(soclk)
);

assign dae_so_page_b = 
       lsu_dae_so_page & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b & 
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_dae_invalid_asi_b & ~lsu_dae_priv_viol_b & ~lsu_dae_nc_page_b & 
       ~lsu_priv_action_b & ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & 
       ~fpdisable_exc_b & ~dtlb_error_b & lsu_inst_b;

assign dae_so_page_w_in =
       dae_so_page_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dae_so_page_w_lat  (
	.scan_in(dae_so_page_w_lat_scanin),
	.scan_out(dae_so_page_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dae_so_page_w_in	),
	.dout	(dae_so_page_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dtlb_error_b =
       (lsu_dttp_err_b | lsu_dtmh_err_b | lsu_dtdp_err_b) & 
       ~lsu_dae_invalid_asi_b & 
       ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~lsu_lddf_align_b & ~lsu_stdf_align_b &
       ~e_cecc_b & ~e_uecc_b & ~f_ecc_b &
       ~lsu_priv_action_b & ~lsu_va_watchpoint_b & ~lsu_illegal_inst_b & 
       ~fpdisable_exc_b & lsu_inst_b;

assign dtlb_error_w_in =
       dtlb_error_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 dtlb_error_w_lat  (
	.scan_in(dtlb_error_w_lat_scanin),
	.scan_out(dtlb_error_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dtlb_error_w_in	),
	.dout	(dtlb_error_w		),
  .siclk(siclk),
  .soclk(soclk)
);

// If LSU signals PMU trap, and no earlier exception occurred,
// it will be treated as the same as if pmu_tlu_trap_m
// had been asserted in the M stage
//  Prioritizing precise_perf_trap over f_ecc
assign perfmon_trap_b = 
       lsu_perfmon_trap_b & pil_mask_15_b & lsu_inst_b;

assign precise_perf_trap_b =
       perfmon_trap_b & ~tlz_exc_dec_b & 
       ~dsc_req_in & 
       ~por_req_in & ~xir_req_in & ~ftt_req_in & 
       ~sir_b &
       ~lsu_pa_watchpoint_b & ~(e_oor_va_b & ~lsu_tlb_bypass_b) & 
       ~lsu_align_b & ~e_cecc_b & ~e_uecc_b & ~f_ecc_b & 
       ~lsu_priv_action_b & ~lsu_stdf_align_b & ~lsu_lddf_align_b &
       ~lsu_va_watchpoint_b & ~lsu_dae_invalid_asi_b & 
       ~lsu_dae_priv_viol_b & ~lsu_dae_nc_page_b & ~lsu_dae_nfo_page_b & 
       ~lsu_dae_so_page & ~dtlb_error_b & ~lsu_daccess_prot_b & lsu_inst_b & 
       ~lsu_illegal_inst_b & ~fpdisable_exc_b & ~debug_exc_b & ~target_oor_b;

assign pil_mask_15_b =
       | (pil_mask_15[3:0] & tid_dec_b[3:0]);

assign tlz_exc_dec_b =
       | (trl_tlz_exc[3:0] & tid_dec_b[3:0]);

// precise_perf_trap_w is higher priority than disrupting exceptions
// and it's essentially the same as pmu_exception
//   Prioritize precise_perf_trap_w lower than disrupting
// 		   exceptions to avoid OV bit not being set when pic_oveflow
// 		   trap is taken
assign precise_perf_trap_w_in =
       precise_perf_trap_b & ~disrupting_flush_b;

tlu_fls_ctl_msff_ctl_macro__width_1 precise_perf_trap_w_lat  (
	.scan_in(precise_perf_trap_w_lat_scanin),
	.scan_out(precise_perf_trap_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(precise_perf_trap_w_in	),
	.dout	(precise_perf_trap_w	),
  .siclk(siclk),
  .soclk(soclk)
);


// PMU trap is a disrupting exception with priority 16.0, so it needs to be 
// higher priority than all disruptings except
//	- disrupting single step completion
// 	- resets
//	- deferred (store_error)
//	- trap level zero
assign perf_trap_w_in = 
       (| (perf_trap_b[3:0] & ~trl_tlz_exc[3:0])) &
       ~dsc_req_in & 
       ~por_req_in & ~xir_req_in & ~ftt_req_in & 
       ~sir_b;

tlu_fls_ctl_msff_ctl_macro__width_1 perf_trap_w_lat  (
	.scan_in(perf_trap_w_lat_scanin),
	.scan_out(perf_trap_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(perf_trap_w_in			),
	.dout	(perf_trap_w			),
  .siclk(siclk),
  .soclk(soclk)
);

assign ibp_w_in = 
       ibp_b & ~ic_err_b & ~itlb_err_b & ~illegal_inst_b & ~hpriv_exc_b & 
       ~sir_b &
       ~itlb_miss_b & ~ra_itlb_miss_b & ~iaw_b & ~i_oor_va_b & ~i_ra_oor_va_b &
       ~target_oor_b & 
       ~i_l2_unde_b & ~itlb_priv_exc_b & ~itlb_nfo_exc_b & 
       kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 ibp_w_lat  (
	.scan_in(ibp_w_lat_scanin),
	.scan_out(ibp_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ibp_w_in			),
	.dout	(ibp_w				),
  .siclk(siclk),
  .soclk(soclk)
);

assign iaw_w_in = 
       iaw_b & kill_exc_iaw_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 iaw_w_lat  (
	.scan_in(iaw_w_lat_scanin),
	.scan_out(iaw_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(iaw_w_in			),
	.dout	(iaw_w				),
  .siclk(siclk),
  .soclk(soclk)
);

assign tct_w_in = 
       tct_b & kill_exc_ge_7_lt_11_b_ & ~e_misalign_w_in & ~align_w_in & 
       ~br_oor_va_w_in & ~br_ra_oor_va_w_in & ~illegal_inst_w_in & 
       ~hpriv_exc_w_in & ~priv_exc_w_in & ~ic_err_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 tct_w_lat  (
	.scan_in(tct_w_lat_scanin),
	.scan_out(tct_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(tct_w_in			),
	.dout	(tct_w				),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 l_spec_enable_lat  (
	.scan_in(l_spec_enable_lat_scanin),
	.scan_out(l_spec_enable_lat_scanout),
	.din	(lsu_spec_enable	[3:0]	),
	.dout	(l_spec_enable		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign spec_enable =
       | (l_spec_enable[3:0] & tid_dec_b[3:0]);

// Kill FGU predicted exception if not in spec_enable mode
assign f_predict_b =
       fgu_inst_b & fgu_predict_fx2 & ~fgu_cecc_fx2 & ~fgu_uecc_fx2 & 
       spec_enable;

assign f_predict_w_in =
       f_predict_b & kill_exc_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 f_predict_w_lat  (
	.scan_in(f_predict_w_lat_scanin),
	.scan_out(f_predict_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(f_predict_w_in		),
	.dout	(f_predict_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdist_beat2_fx2_in =
       fgu_pdist_beat2_fx1 & fgu_inst_b & inst_valid_b & ~disrupting_flush_b & 
       ~pmu_debug_exc_b & ~dec_flush_b;

tlu_fls_ctl_msff_ctl_macro__width_1 pdist_beat2_fx2_lat  (
	.scan_in(pdist_beat2_fx2_lat_scanin),
	.scan_out(pdist_beat2_fx2_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(pdist_beat2_fx2_in	),
	.dout	(pdist_beat2_fx2	),
  .siclk(siclk),
  .soclk(soclk)
);

// Used to gate DTLB miss which can't happen for pdist
// and for in-pipe FRF ECC errors
assign f_ecc_b = 
       fgu_inst_b & (fgu_cecc_fx2 | fgu_uecc_fx2);

// Latch for tlu_ras_ctl
// No power management because this is used for both thread groups
tlu_fls_ctl_msff_ctl_macro__width_1 f_cecc_w_lat  (
	.scan_in(f_cecc_w_lat_scanin),
	.scan_out(f_cecc_w_lat_scanout),
	.din	(fgu_cecc_fx2		),
	.dout	(fls_f_cecc_w		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 f_uecc_w_lat  (
	.scan_in(f_uecc_w_lat_scanin),
	.scan_out(f_uecc_w_lat_scanout),
	.din	(fgu_uecc_fx2		),
	.dout	(fls_f_uecc_w		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign pdist_ecc_b = 
       pdist_beat2_fx2 & (fgu_cecc_fx2 | fgu_uecc_fx2);

assign pdist_ecc_w_in[3:0] =
       {4 {pdist_ecc_b}} & tid_dec_w[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 pdist_ecc_w_lat  (
	.scan_in(pdist_ecc_w_lat_scanin),
	.scan_out(pdist_ecc_w_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(pdist_ecc_w_in	[3:0]	),
	.dout	(pdist_ecc_w	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign m_asi_ecc_b[3:0] =
       ({4 {mmu_asi_cecc | mmu_asi_uecc}} &
	{4 {mmu_asi_tid[2] == thread_group}} &
	{ mmu_asi_tid[1] &  mmu_asi_tid[0],
	  mmu_asi_tid[1] & ~mmu_asi_tid[0],
	 ~mmu_asi_tid[1] &  mmu_asi_tid[0],
	 ~mmu_asi_tid[1] & ~mmu_asi_tid[0]}) ;

assign asi_ecc_b[3:0] =
       m_asi_ecc_b[3:0] | 
       ({4 {asi_ece_exc  | asi_eue_exc }} &
	{4 {asi_ecc_tid[2] == thread_group}} &
	{ asi_ecc_tid[1] &  asi_ecc_tid[0],
	  asi_ecc_tid[1] & ~asi_ecc_tid[0],
	 ~asi_ecc_tid[1] &  asi_ecc_tid[0],
	 ~asi_ecc_tid[1] & ~asi_ecc_tid[0]}) | 
       tel_tsacu_exc[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 asi_ecc_w_lat  (
	.scan_in(asi_ecc_w_lat_scanin),
	.scan_out(asi_ecc_w_lat_scanout),
	.din	(asi_ecc_b	[3:0]	),
	.dout	(asi_ecc_w	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Instruction_access_MMU_error (HW TW MRA or L2 U/ND ECC error)
// Does not need to flush because flush occurred at beginning of HW TW
assign ime_b[3:0] =
       mmu_i_eccerr[3:0] & 
       {mmu_thr3_err_type_b1,
        mmu_thr2_err_type_b1,
        mmu_thr1_err_type_b1,
	mmu_thr0_err_type_b1};

tlu_fls_ctl_msff_ctl_macro__width_4 ime_w_lat  (
	.scan_in(ime_w_lat_scanin),
	.scan_out(ime_w_lat_scanout),
	.din	(ime_b		[3:0]	),
	.dout	(ime_w		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Data_access_MMU_error (HW TW MRA or L2 U/ND ECC error)
// Does not need to flush because flush occurred at beginning of HW TW
assign dme_b[3:0] =
       mmu_d_eccerr[3:0] & 
       {mmu_thr3_err_type_b1,
        mmu_thr2_err_type_b1,
        mmu_thr1_err_type_b1,
	mmu_thr0_err_type_b1};

tlu_fls_ctl_msff_ctl_macro__width_4 dme_w_lat  (
	.scan_in(dme_w_lat_scanin),
	.scan_out(dme_w_lat_scanout),
	.din	(dme_b		[3:0]	),
	.dout	(dme_w		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// unsupported_page_size in TSB config or data_in regs
// Does need to flush because only lsu_sync occurred (no previous flush)
// Pipe it one more cycle so MRA parity error can catch it
assign m_dae_req_m[3:0] = 
       {4 {mmu_dae_req}} &
       {4 {mmu_dae_tid[2] == thread_group}} &
	{ mmu_dae_tid[1] &  mmu_dae_tid[0],
	  mmu_dae_tid[1] & ~mmu_dae_tid[0],
	 ~mmu_dae_tid[1] &  mmu_dae_tid[0],
	 ~mmu_dae_tid[1] & ~mmu_dae_tid[0]};

tlu_fls_ctl_msff_ctl_macro__width_4 m_dae_req_b_lat  (
	.scan_in(m_dae_req_b_lat_scanin),
	.scan_out(m_dae_req_b_lat_scanout),
	.din	(m_dae_req_m		[3:0]	),
	.dout	(pm_dae_req_b		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign m_dae_req_b[3:0] = 
       pm_dae_req_b[3:0] & ~m_asi_ecc_b[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 m_dae_req_w_lat  (
	.scan_in(m_dae_req_w_lat_scanin),
	.scan_out(m_dae_req_w_lat_scanout),
	.din	(m_dae_req_b		[3:0]	),
	.dout	(m_dae_req_w		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);




////////////////////////////////////////////////////////////////////////////////
// NPC nonsequential on retry
// Flag exception on first instruction after retry
// Reassert exception if instruction after retry is a taken branch that does
// not annul delay slot
// Have to hold nns exception through branch taken that does not annul DS
// Have to suppress nns exception for any other exception
// Have to clear nns_exc if thread is flushed OR non-flushing exception occurs

assign br_taken_not_annul_ds_w_in =
       br_taken_b & ~annul_ds_b;

tlu_fls_ctl_msff_ctl_macro__width_1 br_taken_not_annul_ds_w_lat  (
	.scan_in(br_taken_not_annul_ds_w_lat_scanin),
	.scan_out(br_taken_not_annul_ds_w_lat_scanout),
	.din	(br_taken_not_annul_ds_w_in	),
	.dout	(br_taken_not_annul_ds_w	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign hold_nns_exc_w[3:0] =
       ~tid_dec_w[3:0] | {4 {br_taken_not_annul_ds_w}} | 
       lsu_block_store_b[3:0];

assign clear_nns_exc_w[3:0] = 
       ({4 {~exc_for_w}} & tid_dec_w[3:0]) | multicycle_nns_to_npc_w[3:0];

assign flush_not_tablewalk[3:0] =
       (flush_ifu[3:0] & ~iht_request[3:0] & ~dht_request[3:0]) |
       hwtw_exception[3:0];

assign hwtw_exception[3:0] = 
	mmu_i_unauth_access[3:0] |
	mmu_i_tsb_miss[3:0] | mmu_d_tsb_miss[3:0] |
	mmu_i_tte_outofrange[3:0] | mmu_d_tte_outofrange[3:0] |
	ime_b[3:0] | dme_b[3:0] | m_dae_req_b[3:0] ;

assign nns_exc_in[3:0] =
       trl_nns_exc[3:0] | 
       (nns_exc[3:0] & (hold_nns_exc_w[3:0] | ~clear_nns_exc_w[3:0]) & 
	~flush_not_tablewalk[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 nns_exc_lat  (
	.scan_in(nns_exc_lat_scanin),
	.scan_out(nns_exc_lat_scanout),
	.din	(nns_exc_in		[3:0]	),
	.dout	(nns_exc		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_retry_state[3:0] =
       nns_exc[3:0] | {4 {ssmode | domode}};

// If the first instruction after retry is a taken branch that does not annul
// its delay shot,
// then the TNPC from the retry will be in the PC flop,
// otherwise it will be in the NPC flop
assign sync_inst_b =
       lsu_sync_inst_b & lsu_inst_b;

assign nns_to_pc_b[3:0] =
       nns_exc[3:0] & {4 {  br_taken_b & ~annul_ds_b  & ~sync_inst_b}} & 
       tid_dec_valid_b[3:0];

// This needs to be validated with EACH multicycle instruction taking an ECC
// error in EVERY cycle (including the first)
// Multicycle are pdist, casa, std, block store
assign nns_to_npc_b[3:0] =
       nns_exc[3:0] & 
       (({4 {~(br_taken_b & ~annul_ds_b) & ~sync_inst_b & 
           ~(fgu_pdist_beat2_fx1 & fgu_inst_b) & ~l_tlu_twocycle_b}} &
        ~(lsu_block_store_b[3:0] & bsee_req_in[3:0]) & 
        tid_dec_valid_b[3:0]) |
        multicycle_nns_to_npc_b[3:0]);

assign multicycle_nns_to_npc_b[3:0] = 
        (tid_dec_w[3:0] & {4 {beat_two_b & ~bsee_req_w_in}} & 
         ~pdist_ecc_w_in[3:0]) | 
        (~lsu_block_store_b[3:0] & block_store_w[3:0] & 
         ~bsee_req_in[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_12 nns_exc_w_lat  (
	.scan_in(nns_exc_w_lat_scanin),
	.scan_out(nns_exc_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({nns_to_pc_b			[3:0],
		  nns_to_npc_b			[3:0],
		  multicycle_nns_to_npc_b	[3:0]}),
	.dout	({pnns_to_pc_w			[3:0],
		  pnns_to_npc_w			[3:0],
		  multicycle_nns_to_npc_w	[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign nns_to_pc_w[3:0] =
       pnns_to_pc_w[3:0] & clear_nns_exc_w[3:0];

assign nns_to_npc_w[3:0] =
       pnns_to_npc_w[3:0] & clear_nns_exc_w[3:0];



////////////////////////////////////////////////////////////////////////////////
// Determine if instruction in M is from the same thread as in B

assign same_thread_b_m = 
       (((tid_m[1:0] == tid_b[1:0]) & 
         (pre_inst_valid_b | twocycle_inst_w)) |
	(| (tid_dec_m[3:0] & pbsee_pending_in[3:0])) |
	(| (tid_dec_m[3:0] & bsee_pending    [3:0])) |
	(| (tid_dec_m[3:0] & pdist_ecc_w_in  [3:0])) ) & inst_valid_m;



////////////////////////////////////////////////////////////////////////////////
// Determine if instruction in B had an exception

assign itlb_exc_b = 
       itlb_miss_b | ra_itlb_miss_b;

assign dtlb_exc_b = 
       ~lsu_tlb_miss_b_;

assign pdec_exc_b = 
       (i_l2_unde_b | i_oor_va_b | i_ra_oor_va_b | itlb_err_b | 
        ic_err_b | 
	pdone_inst_b | pretry_inst_b | 
	itlb_exc_b | itlb_priv_exc_b | itlb_nfo_exc_b | 
	pillegal_inst_b | psir_b | hpriv_exc_b |
	priv_exc_b | fpdisable_exc_b | pmu_debug_exc_b | 
	disrupting_flush_b) & inst_valid_b;

assign dec_exc_b = 
       (i_l2_unde_b | i_oor_va_b | i_ra_oor_va_b | itlb_err_b | 
        ic_err_b | 
	done_inst_b | retry_inst_b | 
	itlb_exc_b | itlb_priv_exc_b | itlb_nfo_exc_b | 
	illegal_inst_b | sir_b | hpriv_exc_b |
	priv_exc_b | fpdisable_exc_b | pmu_debug_exc_b | 
	disrupting_flush_b) & inst_valid_b;

assign exu_exc_b = 
       e_tcc_b | e_tof_b | e_cecc_b | e_uecc_b | misalign_b | 
       br_oor_va_b | br_ra_oor_va_b | ld_oor_va_b | ld_ra_oor_va_b | 
       exu_spill_b | e_fill_b | exu_cleanwin_b;

assign lsu_exc_b = 
       (lsu_align_b | dtlb_exc_b | lsu_dae_invalid_asi_b |
        lsu_dae_nc_page_b | lsu_dae_nfo_page_b | lsu_dae_priv_viol_b |
        lsu_dae_so_page |
        lsu_lddf_align_b | lsu_stdf_align_b | lsu_daccess_prot_b | 
        lsu_priv_action_b | lsu_va_watchpoint_b | lsu_pa_watchpoint_b | 
        lsu_dttp_err_b | lsu_dtdp_err_b | lsu_dtmh_err_b | 
        perfmon_trap_b) & 
        lsu_inst_b;

assign fgu_exc_b =
       f_predict_b | ((fgu_cecc_fx2 | fgu_uecc_fx2) & fgu_inst_b);

tlu_fls_ctl_msff_ctl_macro__width_4 exc_w_lat  (
	.scan_in(exc_w_lat_scanin),
	.scan_out(exc_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({dec_exc_b		       ,
		  exu_exc_b		       ,
		  lsu_exc_b		       ,
		  fgu_exc_b		       }),
	.dout	({dec_exc_w		       ,
		  exu_exc_w		       ,
		  lsu_exc_w		       ,
		  fgu_exc_w		       }),
  .siclk(siclk),
  .soclk(soclk)
);

assign exc_for_w =
       (dec_exc_w | exu_exc_w | lsu_exc_w | fgu_exc_w) & 
       (inst_valid_w | beat_two_w);
assign exception_for_w =
       exc_for_w |
       bsee_req_w | (| (pdist_ecc_w[3:0] & tid_dec_b[3:0]));



////////////////////////////////////////////////////////////////////////////////
// Generate flushes

tlu_fls_ctl_msff_ctl_macro__width_4 trap_flush_lat  (
	.scan_in(trap_flush_lat_scanin),
	.scan_out(trap_flush_lat_scanout),
	.din	({lsu_trap_flush	[3:0]}),
	.dout	({ptrap_flush		[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Prevent trap_flush from flushing machine when in disable_overlap mode
// because there's no flush needed -- only one instruction in the machine
// at a time.  Also, the flush would kill the ssr_req in trl. 
assign trap_flush[3:0] =
       ptrap_flush[3:0] & {4 {~domode}};

assign preflush_exu_m = 
       same_thread_b_m;
assign preflush_lsu_m = 
       same_thread_b_m & dec_lsu_inst_m;
assign preflush_fgu_m = 
       same_thread_b_m & dec_fgu_inst_m;

tlu_fls_ctl_msff_ctl_macro__width_3 preflush_b_lat  (
	.scan_in(preflush_b_lat_scanin),
	.scan_out(preflush_b_lat_scanout),
	.din	({preflush_exu_m       , 
		  preflush_lsu_m       ,
		  preflush_fgu_m       }),
	.dout	({preflush_exu_b       , 
		  preflush_lsu_b       ,
		  preflush_fgu_b       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Note that pmu_debug_exc_b causes a flush in the B cycle of the instruction
// that has these exceptions.  
// Note that pmu_debug_exc_b is ORed into dec_exc_b, so that the execution units
// will receive flush_b when the instruction with the exception reaches W if
// the instruction in B is from the same thread
assign pmu_debug_exc_b =
       (| perf_trap_b[3:0]) | debug_exc_b;

assign debug_exc_b =
       ibp_b | iaw_b | tct_b | target_oor_b;

assign tlu_flush_exu_b = 
       (preflush_exu_b & exception_for_w) |
       (preflush_lsu_b & exception_for_w) | 
       disrupting_flush_b | pmu_debug_exc_b ;
			                                       
assign flush_lsu_b =
	(preflush_lsu_b     & exception_for_w) | 
	(disrupting_flush_b & lsu_inst_b     ) |
        (pmu_debug_exc_b    & lsu_inst_b     ) ;

assign flush_fgu_b =                                       
	(preflush_fgu_b     & exception_for_w) | 
	(disrupting_flush_b & fgu_inst_b     ) |
	(pmu_debug_exc_b    & fgu_inst_b     ) ;

assign fls_flush_lsu_b =
	flush_lsu_b;
			                                       
assign fls_flush_fgu_b =
	flush_fgu_b;

assign tlu_flush_lsu_b = 
	flush_lsu_b | flsx_flush_lsu_b;

assign tlu_flush_fgu_b = 
	flush_fgu_b | flsx_flush_fgu_b;

// IFU flushes regardless of whether the next instuction is from the same 
// thread
// IFU not flushed in B for tct, pmu, ibp, or iaw (but execution units are);
// IFU flushed in W for these exceptions
assign sync_flush_ifu[3:0] = 
       ({4 {exc_for_w}} & two_tid_dec_w[3:0]) |
       trap_flush[3:0];

assign flush_not_disrupting[3:0] =
       flush_gfb[3:0] | sync_flush_ifu[3:0] | m_dae_req_w[3:0] | 
       bsee_req[3:0] | pdist_ecc_w[3:0];

assign flush_ifu[3:0] =
       flush_not_disrupting[3:0] | clear_disrupting_flush_pending_w[3:0] | 
       (por_req[3:0] & core_running[3:0]);

assign tlu_flush_ifu[3:0] =
       flush_ifu[3:0];

assign fls_flush[3:0] =
       flush_ifu[3:0];	

// Flush PMU B if instruction in W had exception and instruction in B
// is from same thread
//	OR
// NPC arrived
//	OR
// disrupting flush for B
assign tlu_flush_pmu_b =
       flush_b | 
       (| (clear_disrupting_flush_pending[3:0] & ~perf_trap_b[3:0])) | 
       (debug_exc_b & ~(| perf_trap_b[3:0])) |
       tlz_exc_b;

// Flush PMU W if instruction in W had exception
assign tlu_flush_pmu_w =
       exc_for_w & ~perf_trap_w & ~precise_perf_trap_w;


////////////////////////////////////////////////////////////////////////////////
// Generate flushes for G and FB stages

assign l_tid_dec_g[3:0] = 
	{4 {thread_group == lsu_tid_g[2]}} &
	{ lsu_tid_g[1] &  lsu_tid_g[0],
	  lsu_tid_g[1] & ~lsu_tid_g[0],
	 ~lsu_tid_g[1] &  lsu_tid_g[0],
	 ~lsu_tid_g[1] & ~lsu_tid_g[0]};

assign fpx_tid_dec_fb[3:0] = 
	{4 {thread_group == fgu_fpx_trap_tid_fw[2]}} & 
	{ fgu_fpx_trap_tid_fw[1] &  fgu_fpx_trap_tid_fw[0],
	  fgu_fpx_trap_tid_fw[1] & ~fgu_fpx_trap_tid_fw[0],
	 ~fgu_fpx_trap_tid_fw[1] &  fgu_fpx_trap_tid_fw[0],
	 ~fgu_fpx_trap_tid_fw[1] & ~fgu_fpx_trap_tid_fw[0]};

assign fpd_tid_dec_fb[3:0] = 
	{4 {thread_group == fgu_fpd_trap_tid_fw[2]}} & 
	{ fgu_fpd_trap_tid_fw[1] &  fgu_fpd_trap_tid_fw[0],
	  fgu_fpd_trap_tid_fw[1] & ~fgu_fpd_trap_tid_fw[0],
	 ~fgu_fpd_trap_tid_fw[1] &  fgu_fpd_trap_tid_fw[0],
	 ~fgu_fpd_trap_tid_fw[1] & ~fgu_fpd_trap_tid_fw[0]};

assign dcerr_tid_dec_g[3:0] = 
       {4 {thread_group == lsu_dcerr_tid_g[2]}} &
	{ lsu_dcerr_tid_g[1] &  lsu_dcerr_tid_g[0],  
	  lsu_dcerr_tid_g[1] & ~lsu_dcerr_tid_g[0],  
	 ~lsu_dcerr_tid_g[1] &  lsu_dcerr_tid_g[0],  
	 ~lsu_dcerr_tid_g[1] & ~lsu_dcerr_tid_g[0]};

assign l_l2_ecc_g[3:0] =
       {4 {lsu_dcl2u_err_g | lsu_dcl2nd_err_g}} & dcerr_tid_dec_g[3:0];

assign l_sbdl_ecc_g[3:0] =
       {4 {(lsu_sbdlc_err_g | lsu_sbdlu_err_g) & 
       (thread_group == lsu_stberr_tid_g[2])}} &
	{ lsu_stberr_tid_g[1] &  lsu_stberr_tid_g[0],  
	  lsu_stberr_tid_g[1] & ~lsu_stberr_tid_g[0],  
	 ~lsu_stberr_tid_g[1] &  lsu_stberr_tid_g[0],  
	 ~lsu_stberr_tid_g[1] & ~lsu_stberr_tid_g[0]};

// lsu_priv_action_g can't happen for a L2 miss, so
// it will not happen on the same instruction as lsu_perfmon_trap_g
// lsu_priv_action_g and lsu_sbdp[cu]_err_g/lsu_sbapp_err_g/lsu_sbdiou_err_g
// can happen simultaneously for same thread; 
// the store buffer errors are
// disrupting, so no reason to prioritize
// lsu_priv_action_g cannot occur on same thread on same cycle as 
// lsu_sbdl[cu]_err_g
assign priv_action_g[3:0] = 
	{4 {lsu_priv_action_g}} & l_tid_dec_g[3:0];

assign precise_perf_trap_g[3:0] = 
	{4 {lsu_perfmon_trap_g & ~lsu_dcl2u_err_g & ~lsu_dcl2nd_err_g}} & 
        pil_mask_15[3:0] & dcerr_tid_dec_g[3:0];

assign fpx_ieee_exc_fb[3:0] = 
	{4 {fgu_fpx_ieee_trap_fw}} & fpx_tid_dec_fb[3:0];

assign fpd_ieee_exc_fb[3:0] = 
	{4 {fgu_fpd_ieee_trap_fw}} & fpd_tid_dec_fb[3:0];

assign fpx_unfin_exc_fb[3:0] = 
	{4 {fgu_fpx_unfin_fw}} & fpx_tid_dec_fb[3:0];

assign fpd_unfin_exc_fb[3:0] = 
	{4 {fgu_fpd_unfin_fw}} & fpd_tid_dec_fb[3:0];

assign idiv0_exc_fb[3:0] = 
	{4 {fgu_fpd_idiv0_trap_fw}} & fpx_tid_dec_fb[3:0];

assign flush_gfb_in[3:0] = 
       l_l2_ecc_g[3:0] | priv_action_g[3:0] |
       precise_perf_trap_g[3:0] |
       l_sbdl_ecc_g[3:0] |
       fpx_ieee_exc_fb[3:0] | fpd_ieee_exc_fb[3:0] |
       fpx_unfin_exc_fb[3:0] | fpd_unfin_exc_fb[3:0] | 
       idiv0_exc_fb[3:0] | asi_ecc_b[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 flush_gfb_lat  (
	.scan_in(flush_gfb_lat_scanin),
	.scan_out(flush_gfb_lat_scanout),
	.din	(flush_gfb_in	[3:0]	),
	.dout	(flush_gfb	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 l_l2_ecc_w_lat  (
	.scan_in(l_l2_ecc_w_lat_scanin),
	.scan_out(l_l2_ecc_w_lat_scanout),
	.din	(l_l2_ecc_g	[3:0]	),
	.dout	(l_l2_ecc_w	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 l_sbdl_ecc_w_lat  (
	.scan_in(l_sbdl_ecc_w_lat_scanin),
	.scan_out(l_sbdl_ecc_w_lat_scanout),
	.din	(l_sbdl_ecc_g	[3:0]	),
	.dout	(l_sbdl_ecc_w	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 priv_action_g_w_lat  (
	.scan_in(priv_action_g_w_lat_scanin),
	.scan_out(priv_action_g_w_lat_scanout),
	.din	(priv_action_g	[3:0]	),
	.dout	(priv_action_g_w[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 precise_perf_trap_g_w_lat  (
	.scan_in(precise_perf_trap_g_w_lat_scanin),
	.scan_out(precise_perf_trap_g_w_lat_scanout),
	.din	(precise_perf_trap_g	[3:0]	),
	.dout	(precise_perf_trap_g_w	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ieee_exc_fb[3:0] = 
	fpx_ieee_exc_fb[3:0] | fpd_ieee_exc_fb[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 ieee_exc_fw_lat  (
	.scan_in(ieee_exc_fw_lat_scanin),
	.scan_out(ieee_exc_fw_lat_scanout),
	.din	(ieee_exc_fb	[3:0]	),
	.dout	(ieee_exc_fw	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign unfin_fb[3:0] = 
	fpx_unfin_exc_fb[3:0] | fpd_unfin_exc_fb[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 unfin_fw_lat  (
	.scan_in(unfin_fw_lat_scanin),
	.scan_out(unfin_fw_lat_scanout),
	.din	(unfin_fb	[3:0]	),
	.dout	(unfin_fw	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 idiv0_exc_fw_lat  (
	.scan_in(idiv0_exc_fw_lat_scanin),
	.scan_out(idiv0_exc_fw_lat_scanout),
	.din	(idiv0_exc_fb	[3:0]	),
	.dout	(idiv0_exc_fw	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Generate flushes for disrupting traps
//	Includes reset requests
//

// XIR is not maskable, but use this structure to simplify verification
assign xir_flush_in[3:0] =
       cxi_xir[3:0] |
       (pre_xir_flush[3:0] & ~(trl_trap_taken[3:0] & {4 {trl_take_xir}}));

tlu_fls_ctl_msff_ctl_macro__width_4 xir_flush_lat  (
	.scan_in(xir_flush_lat_scanin),
	.scan_out(xir_flush_lat_scanout),
	.din	(xir_flush_in		[3:0]	),
	.dout	(pre_xir_flush		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign xir_flush_m[3:0] =
       pre_xir_flush[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign xir_flush_b_in =
       | xir_flush_m[3:0];

tlu_fls_ctl_msff_ctl_macro__width_1 xir_flush_b_lat  (
	.scan_in(xir_flush_b_lat_scanin),
	.scan_out(xir_flush_b_lat_scanout),
	.din	(xir_flush_b_in			),
	.dout	(xir_flush_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// Disrupting RAS errors
//   Take disrupting RAS errors on second instruction to
// enter M to break the hardware_corrected_error loop on L2U/L2ND error
// on instruction fetch

tlu_fls_ctl_msff_ctl_macro__width_4 pre_desr_f_lat  (
	.scan_in(pre_desr_f_lat_scanin),
	.scan_out(pre_desr_f_lat_scanout),
	.din	(dfd_fls_desr_f		[3:0]	),
	.dout	(pre_desr_f		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign desr_f_in[3:0] =
       dfd_fls_desr_f[3:0] & 
       ((    pre_desr_f[3:0] &  tid_dec_m[3:0] & {4 { dec_inst_valid_m}}) |
       (         desr_f[3:0] & ~tid_dec_m[3:0]                          ) |
       (         desr_f[3:0] &                     {4 {~dec_inst_valid_m}}));

tlu_fls_ctl_msff_ctl_macro__width_4 desr_f_lat  (
	.scan_in(desr_f_lat_scanin),
	.scan_out(desr_f_lat_scanout),
	.din	(desr_f_in		[3:0]	),
	.dout	(desr_f			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 desr_s_lat  (
	.scan_in(desr_s_lat_scanin),
	.scan_out(desr_s_lat_scanout),
	.din	(dfd_fls_desr_s		[3:0]	),
	.dout	(desr_s			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign eer_err_m[3:0] =
       pre_desr_f[3:0] & desr_f[3:0] & ~desr_s[3:0] & 
       tlu_ceter_dhcce[3:0] & hpriv_bar_or_ie_m[3:0];

assign eer_err_b_in =
       | eer_err_m[3:0];

tlu_fls_ctl_msff_ctl_macro__width_1 eer_err_b_lat  (
	.scan_in(eer_err_b_lat_scanin),
	.scan_out(eer_err_b_lat_scanout),
	.din	(eer_err_b_in			),
	.dout	(eer_err_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ade_err_m[3:0] =
       pre_desr_f[3:0] & desr_f[3:0] &  desr_s[3:0] & 
       tlu_ceter_de[3:0] & hpriv_bar_or_ie_m[3:0];

assign ade_err_b_in =
       | ade_err_m[3:0];

tlu_fls_ctl_msff_ctl_macro__width_1 ade_err_b_lat  (
	.scan_in(ade_err_b_lat_scanin),
	.scan_out(ade_err_b_lat_scanout),
	.din	(ade_err_b_in			),
	.dout	(ade_err_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);





// Fatal errors, not (technically) disrupting, and not maskable
assign l_sbpp_in[3:0] =
       ({4 {(lsu_sbapp_err_g | lsu_sbdiou_err_g) & 
	    (thread_group == lsu_stberr_tid_g[2])}} &
        { lsu_stberr_tid_g[1] &  lsu_stberr_tid_g[0],  
	  lsu_stberr_tid_g[1] & ~lsu_stberr_tid_g[0],  
	 ~lsu_stberr_tid_g[1] &  lsu_stberr_tid_g[0],  
	 ~lsu_stberr_tid_g[1] & ~lsu_stberr_tid_g[0]}) |
       (pre_l_sbpp[3:0] & ~({4 {trl_take_ftt}} & trl_trap_taken[3:0]));

tlu_fls_ctl_msff_ctl_macro__width_4 l_sbpp_lat  (
	.scan_in(l_sbpp_lat_scanin),
	.scan_out(l_sbpp_lat_scanout),
	.din	(l_sbpp_in		[3:0]	),
	.dout	(pre_l_sbpp		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign l_sbpp_m[3:0] =
       pre_l_sbpp[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign l_sbpp_b_in =
       (| l_sbpp_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 l_sbpp_b_lat  (
  	.scan_in(l_sbpp_b_lat_scanin),
  	.scan_out(l_sbpp_b_lat_scanout),
  	.din	(l_sbpp_b_in			),
  	.dout	(l_sbpp_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign ma_flush_in[3:0] =
       ({4 {spu_tlu_ma_int_req[3] & 
	(thread_group == spu_tlu_ma_int_req[2])}} &
        { spu_tlu_ma_int_req[1] &  spu_tlu_ma_int_req[0],
          spu_tlu_ma_int_req[1] & ~spu_tlu_ma_int_req[0],
         ~spu_tlu_ma_int_req[1] &  spu_tlu_ma_int_req[0],
         ~spu_tlu_ma_int_req[1] & ~spu_tlu_ma_int_req[0]}) |
       (pre_ma_flush[3:0] & ~({4 {trl_take_sma}} & trl_trap_taken[3:0]) &
	~asi_clear_spu_trap_req[3:0]);


tlu_fls_ctl_msff_ctl_macro__width_4 ma_flush_lat  (
	.scan_in(ma_flush_lat_scanin),
	.scan_out(ma_flush_lat_scanout),
	.din	(ma_flush_in			[3:0]	),
	.dout	(pre_ma_flush			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ma_flush_m[3:0] =
       pre_ma_flush[3:0] & 
       hpriv_bar_or_ie_m[3:0];

assign ma_flush_b_in =
       (| ma_flush_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 ma_flush_b_lat  (
	.scan_in(ma_flush_b_lat_scanin),
	.scan_out(ma_flush_b_lat_scanout),
	.din	(ma_flush_b_in			),
	.dout	(ma_flush_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign cwq_flush_in[3:0] =
       ({4 {spu_tlu_cwq_int_req[3] & 
        (thread_group == spu_tlu_cwq_int_req[2])}} &
        { spu_tlu_cwq_int_req[1] &  spu_tlu_cwq_int_req[0],
          spu_tlu_cwq_int_req[1] & ~spu_tlu_cwq_int_req[0],
         ~spu_tlu_cwq_int_req[1] &  spu_tlu_cwq_int_req[0],
         ~spu_tlu_cwq_int_req[1] & ~spu_tlu_cwq_int_req[0]}) |
       (pre_cwq_flush[3:0] & ~({4 {trl_take_cwq}} & trl_trap_taken[3:0]) &
	~asi_clear_spu_trap_req[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 cwq_flush_lat  (
	.scan_in(cwq_flush_lat_scanin),
	.scan_out(cwq_flush_lat_scanout),
	.din	(cwq_flush_in			[3:0]	),
	.dout	(pre_cwq_flush			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign cwq_flush_m[3:0] =
       pre_cwq_flush[3:0] & 
       hpriv_bar_or_ie_m[3:0];

assign cwq_flush_b_in =
       (| cwq_flush_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 cwq_flush_b_lat  (
	.scan_in(cwq_flush_b_lat_scanin),
	.scan_out(cwq_flush_b_lat_scanout),
	.din	(cwq_flush_b_in			),
	.dout	(cwq_flush_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



assign tsa_tca_ecc_error =
       asi_ece_exc | asi_eue_exc;

// No longer clear queue exceptions on taking the exception;
// have to see the head and tail the same.
// This should behave as registers outside an array.

assign check_mqr_dqr_[3:0] =
       ~(asi_check_qr_exc[3:0] & {4 {~trl_check_rqr}});
assign check_mqr_dqr[3:0] =
       ~check_mqr_dqr_[3:0];
assign check_rqr_[3:0] =
       ~(asi_check_qr_exc[3:0] & {4 {trl_check_rqr}});
assign check_rqr[3:0] =
       ~check_rqr_[3:0];

assign pmqr_exc_in[3:0] = 
       ({4 {~tsd_mrqr_exc_ & ~tsa_tca_ecc_error}} & check_mqr_dqr [3:0]) |
       (pmqr_exc[3:0]                           & check_mqr_dqr_[3:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_4 pmqr_exc_lat  ( 
	.scan_in(pmqr_exc_lat_wmr_scanin),
	.scan_out(pmqr_exc_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pmqr_exc_in			[3:0]	),
	.dout	(pmqr_exc			[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

// Need mqr_exc active in M for disrupting_flush
// and need it in B for mqr_req
assign mqr_exc_m[3:0] =
       pmqr_exc[3:0] & hpriv_bar_and_ie[3:0] &
       (tid_dec_m[3:0] & {4 {dec_inst_valid_m}});
       
assign mqr_exc_b_in =
       (| mqr_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 mqr_exc_b_lat  (
	.scan_in(mqr_exc_b_lat_scanin),
	.scan_out(mqr_exc_b_lat_scanout),
	.din	(mqr_exc_b_in			),
	.dout	(mqr_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

       
assign pdqr_exc_in[3:0] = 
       ({4 {~tsd_dqr_exc_  & ~tsa_tca_ecc_error}} & check_mqr_dqr [3:0]) |
       (pdqr_exc[3:0]                           & check_mqr_dqr_[3:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_4 pdqr_exc_lat  ( 
	.scan_in(pdqr_exc_lat_wmr_scanin),
	.scan_out(pdqr_exc_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pdqr_exc_in			[3:0]	),
	.dout	(pdqr_exc			[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

// Need dqr_exc active in M for disrupting_flush
// and need it in B for dqr_req
assign dqr_exc_m[3:0] =
       pdqr_exc[3:0] & hpriv_bar_and_ie[3:0] & 
       (tid_dec_m[3:0] & {4 {dec_inst_valid_m}});
       
assign dqr_exc_b_in =
       (| dqr_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 dqr_exc_b_lat  (
	.scan_in(dqr_exc_b_lat_scanin),
	.scan_out(dqr_exc_b_lat_scanout),
	.din	(dqr_exc_b_in			),
	.dout	(dqr_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

       
assign prqr_exc_in[3:0] = 
       ({4 {~tsd_mrqr_exc_ & ~tsa_tca_ecc_error}} & check_rqr     [3:0]) |
       (prqr_exc[3:0]                           & check_rqr_    [3:0]) ;

tlu_fls_ctl_msff_ctl_macro__width_4 prqr_exc_lat  ( 
	.scan_in(prqr_exc_lat_wmr_scanin),
	.scan_out(prqr_exc_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(prqr_exc_in			[3:0]	),
	.dout	(prqr_exc			[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

// Need rqr_exc active in M for disrupting_flush
// and need it in B for rqr_req
assign rqr_exc_m[3:0] =
       prqr_exc[3:0] & hpriv_bar_and_ie[3:0] & 
       (tid_dec_m[3:0] & {4 {dec_inst_valid_m}});

assign rqr_exc_b_in =
       (| rqr_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 rqr_exc_b_lat  (
	.scan_in(rqr_exc_b_lat_scanin),
	.scan_out(rqr_exc_b_lat_scanout),
	.din	(rqr_exc_b_in			),
	.dout	(rqr_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_fls_ctl_msff_ctl_macro__width_4 ivt_lat  (
	.scan_in(ivt_lat_scanin),
	.scan_out(ivt_lat_scanout),
	.din	(cxi_ivt			[3:0]	),
	.dout	(ivt_last			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Do not need to reinject exception on dec_flush_b because this
// only clears when the trap is taken
assign ivt_flush_in[3:0] =
       ivt_last[3:0] |
       (pre_ivt_flush[3:0] & ~asi_irl_cleared[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 ivt_flush_lat  ( 
	.scan_in(ivt_flush_lat_wmr_scanin),
	.scan_out(ivt_flush_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(ivt_flush_in		[3:0]	),
	.dout	(pre_ivt_flush		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign ivt_flush_m[3:0] =
       pre_ivt_flush[3:0] & 
       hpriv_bar_or_ie_m[3:0];

assign ivt_flush_b_in =
       (| ivt_flush_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 ivt_flush_b_lat  (
	.scan_in(ivt_flush_b_lat_scanin),
	.scan_out(ivt_flush_b_lat_scanout),
	.din	(ivt_flush_b_in			),
	.dout	(ivt_flush_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// Make sure these exceptions do not 'get ahead' of other disrupting exceptions
// This is not strictly required for correctness, but it makes
// verification much easier.

assign iln_exc_m[3:0] =
       trl_iln_exc[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign iln_exc_b_in =
       (| iln_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 iln_exc_b_lat  (
	.scan_in(iln_exc_b_lat_scanin),
	.scan_out(iln_exc_b_lat_scanout),
	.din	(iln_exc_b_in			),
	.dout	(iln_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign tlz_exc_m[3:0] =
       trl_tlz_exc[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign tlz_exc_b_in =
       (| tlz_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 tlz_exc_b_lat  (
	.scan_in(tlz_exc_b_lat_scanin),
	.scan_out(tlz_exc_b_lat_scanout),
	.din	(tlz_exc_b_in			),
	.dout	(tlz_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign hst_exc_m[3:0] =
       trl_hstick_match[3:0] & tid_dec_m[3:0] & {4 {dec_inst_valid_m}};

assign hst_exc_b_in =
       (| hst_exc_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 hst_exc_b_lat  (
	.scan_in(hst_exc_b_lat_scanin),
	.scan_out(hst_exc_b_lat_scanout),
	.din	(hst_exc_b_in			),
	.dout	(hst_exc_b			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



assign no_hold_disrupting_flush_in[3:0] =
	xir_flush_m[3:0] | l_sbpp_m[3:0] |
	iln_exc_m[3:0] | tlz_exc_m[3:0] | hst_exc_m[3:0] |
	ma_flush_m[3:0] | cwq_flush_m[3:0] |
	eer_err_m[3:0] | ade_err_m[3:0] |
	mqr_exc_m[3:0] | dqr_exc_m[3:0] | rqr_exc_m[3:0] | 
	ivt_flush_m[3:0] | idl_exc_in[3:0] |
        disrupting_ssc_exc[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 no_hold_disrupting_flush_lat  (
	.scan_in(no_hold_disrupting_flush_lat_scanin),
	.scan_out(no_hold_disrupting_flush_lat_scanout),
	.din	(no_hold_disrupting_flush_in	[3:0]	),
	.dout	(no_hold_disrupting_flush	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign disrupting_flush_pending[3:0] =
       no_hold_disrupting_flush[3:0];

assign disrupting_flush_pending_tid_dec_m =
       | (no_hold_disrupting_flush_in[3:0] & tid_dec_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 disrupting_flush_pending_tid_dec_b_lat  (
	.scan_in(disrupting_flush_pending_tid_dec_b_lat_scanin),
	.scan_out(disrupting_flush_pending_tid_dec_b_lat_scanout),
	.din	(disrupting_flush_pending_tid_dec_m	),
	.dout	(disrupting_flush_pending_tid_dec_b	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
	

// Consider instruction in B valid if IFU is not flushing it
assign clear_disrupting_flush_pending[3:0] =
       disrupting_flush_pending[3:0] & tid_dec_b[3:0] & 
	{4 {pre_inst_valid_b}};

assign kill_pmu_debug_exc_b_ =
       ~(| clear_disrupting_flush_pending[3:0]);

assign kill_exc_b_ =
       kill_pmu_debug_exc_b_ & ~pmu_debug_exc_b & ~target_oor_b;

assign kill_exc_ge_7_lt_11_b_ =
       kill_pmu_debug_exc_b_ & ~pmu_debug_exc_ge_7_lt_11_b;

assign pmu_debug_exc_ge_7_lt_11_b =
       (| perf_trap_b[3:0]) | ibp_b | iaw_b | target_oor_b;

assign kill_exc_gt_6_lt_7_b_ =
       kill_pmu_debug_exc_b_ & 
       ~(| {perf_trap_b[3:0], iaw_b, target_oor_b});

assign kill_exc_lt_6_b_ =
       kill_pmu_debug_exc_b_ & ~(| {perf_trap_b[3:0], iaw_b, target_oor_b});

assign kill_exc_iar_irr_b_ =
       kill_pmu_debug_exc_b_ & ~(| {perf_trap_b[3:0], iaw_b});

assign kill_exc_iaw_b_ =
       kill_pmu_debug_exc_b_ & ~(| {perf_trap_b[3:0]});


assign disrupting_flush_b = 
	(| clear_disrupting_flush_pending[3:0]);

// Precise perf traps (precise_perf_trap_b) kills all disrupting EXCEPT
// - resets (POR, XIR), but not SIR
// - trap_level_zero
// These are handled later (by not requiring clear_disrupting_flush_pending_w)
//                 In the event of a pending disrupting trap request when
//		   LSU signals pic_overflow trap, take the disrupting trap
assign clear_disrupting_flush_pending_w_in[3:0] =
       clear_disrupting_flush_pending[3:0] & tid_dec_w_in[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 cdfpw_lat  (
	.scan_in(cdfpw_lat_scanin),
	.scan_out(cdfpw_lat_scanout),
	.l1clk	(l1clk_pm1					),
	.din	(clear_disrupting_flush_pending_w_in	[3:0]	),
	.dout	(clear_disrupting_flush_pending_w	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Do not suppress disrupting exceptions in the case of
// trap on control transfer exception

// Do not suppress disrupting exceptions in the case of
// any 'debug' related exception

// Suppress error register updates on DCTI couple with error on
// annulled delay slot being tagged against next instruction
assign disrupting_flush_w_in = 
       | {clear_disrupting_flush_pending[3:0] & tid_dec_w_in[3:0],
          target_oor_b, refetch_b};

tlu_fls_ctl_msff_ctl_macro__width_1 disrupting_flush_w_lat  (
	.scan_in(disrupting_flush_w_lat_scanin),
	.scan_out(disrupting_flush_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(disrupting_flush_w_in		),
	.dout	(disrupting_flush_w		),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_disrupting_flush_w =
       disrupting_flush_w;



////////////////////////////////////////////////////////////////////////////////
// Block store FRF ECC errors

// Cannot power manage this flop because block stores "stall" in  or repeat B
tlu_fls_ctl_msff_ctl_macro__width_4 block_store_w_lat  (
	.scan_in(block_store_w_lat_scanin),
	.scan_out(block_store_w_lat_scanout),
	.din	(lsu_block_store_b		[3:0]	),
	.dout	(block_store_w			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pbsee_pending_in[3:0] =
       (lsu_block_store_b[3:0] & {4 {fgu_cecc_fx2 | fgu_uecc_fx2}}) |
       (bsee_pending[3:0] & lsu_block_store_b[3:0]);

assign bsee_pending_in[3:0] = 
       pbsee_pending_in[3:0] & ~(tid_dec_m[3:0] & {4 {inst_valid_m}});

tlu_fls_ctl_msff_ctl_macro__width_4 bsee_pending_lat  (
	.scan_in(bsee_pending_lat_scanin),
	.scan_out(bsee_pending_lat_scanout),
	.din	(bsee_pending_in		[3:0]	),
	.dout	(bsee_pending			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bsee_req_in[3:0] =
       (pbsee_pending_in[3:0] & tid_dec_m[3:0] & {4 {inst_valid_m}}) |
       (~lsu_block_store_b[3:0] & block_store_w[3:0] & bsee_pending[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 bsee_req_lat  (
	.scan_in(bsee_req_lat_scanin),
	.scan_out(bsee_req_lat_scanout),
	.din	(bsee_req_in			[3:0]	),
	.dout	(bsee_req			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bsee_req_w_in =
       | (bsee_req_in[3:0] & tid_dec_m[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 bsee_req_w_lat  (
	.scan_in(bsee_req_w_lat_scanin),
	.scan_out(bsee_req_w_lat_scanout),
	.din	(bsee_req_w_in				),
	.dout	(bsee_req_w				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign bsee_flush_b_in =
       | (tid_dec_m[3:0] & bsee_req_in[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_1 bsee_flush_b_lat  (
	.scan_in(bsee_flush_b_lat_scanin),
	.scan_out(bsee_flush_b_lat_scanout),
	.din	(bsee_flush_b_in			),
	.dout	(bsee_flush_b				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Generate trap request:  prioritize the various requests

tlu_fls_ctl_msff_ctl_macro__width_4 core_running_lat  (
	.scan_in(core_running_lat_scanin),
	.scan_out(core_running_lat_scanout),
	.din	(tcu_core_running	[3:0]	),
	.dout	(core_running		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_core_running[3:0] =
       core_running[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 core_running_last_lat  (
	.scan_in(core_running_last_lat_scanin),
	.scan_out(core_running_last_lat_scanout),
	.din	(core_running		[3:0]	),
	.dout	(core_running_last	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_4 core_running_status_lat  (
	.scan_in(core_running_status_lat_scanin),
	.scan_out(core_running_status_lat_scanout),
	.din	(trl_core_running_status[3:0]	),
	.dout	(core_running_status	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Idle thread if core_running transitions to 0 while core_running_status is 1
// Clear idle request if core becomes idle
assign idl_exc_new[3:0] =			
       ~core_running[3:0] & core_running_last[3:0] & 
       core_running_status[3:0];
assign idl_exc_in[3:0] =
       idl_exc_new[3:0] | 
       (idl_exc[3:0] & core_running_status[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 idl_exc_lat  (
	.scan_in(idl_exc_lat_scanin),
	.scan_out(idl_exc_lat_scanout),
	.din	(idl_exc_in		[3:0]	),
	.dout	(idl_exc		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign idl_exc_b =
       | (idl_exc[3:0] & tid_dec_b[3:0]) & pre_inst_valid_b;


// dsc_req_in is purposefully NOT included here.
// The TCU should not try to park a thread that has a pending
// single step completion, so this is OK.
assign idl_req_in = 
       idl_exc_b & 
       ~rqr_req_in & 
       ~ade_req_in & ~eer_req_in & 
       ~iln_req_in & ~dqr_req_in &
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~xir_req_in & ~por_req_in &
       ~perf_trap_w_in & ~sir_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 idl_req_lat  (
	.scan_in(idl_req_lat_scanin),
	.scan_out(idl_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(idl_req_in		),
	.dout	(idl_req		),
  .siclk(siclk),
  .soclk(soclk)
);

// Resume thread if core_running transitions to 1 and thread has been in
// running state previously and is not currently running
assign res_exc[3:0] =
       core_running[3:0] & ~core_running_last[3:0] & ~{4 {ssmode}} & 
       ever_been_running[3:0] & ~core_running_status[3:0];

assign res_req[3:0] =
       res_exc[3:0] & ~{4 {domode}};

// Treat single step as special resume request
tlu_fls_ctl_msff_ctl_macro__width_1 ssmode_lat  (
	.scan_in(ssmode_lat_scanin),
	.scan_out(ssmode_lat_scanout),
	.din	(tcu_ss_mode		),
	.dout	(ssmode			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 domode_lat  (
	.scan_in(domode_lat_scanin),
	.scan_out(domode_lat_scanout),
	.din	(tcu_do_mode		),
	.dout	(domode			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 ssreq_lat  (
	.scan_in(ssreq_lat_scanin),
	.scan_out(ssreq_lat_scanout),
	.din	(tcu_ss_request		),
	.dout	(ssreq			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_ss_request =
       ssmode & ssreq;

assign ssr_exc_forces_por[3:0] =
       {4 {ssmode & ssreq}} & core_running[3:0] & ~ever_been_running[3:0];

assign ssr_exc_b[3:0] =
       ({4 {ssmode & ssreq}} & core_running[3:0]) |
       ({4 {domode & ~idl_req_in}} & (por_exc[3:0] | res_exc[3:0] | 
       (ssc_req[3:0] & tid_dec_w_in[3:0]))) | 
       ({4 {ssmode}} & idl_exc_new[3:0]);

assign ssr_req_in[3:0] =
       ssr_exc_b[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 ssr_req_lat  (
	.scan_in(ssr_req_lat_scanin),
	.scan_out(ssr_req_lat_scanout),
	.din	(ssr_req_in		[3:0]	),
	.dout	(ssr_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ever_been_running_in[3:0] =
       core_running_last[3:0] | ever_been_running[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 ever_been_running_lat  (
	.scan_in(ever_been_running_lat_scanin),
	.scan_out(ever_been_running_lat_scanout),
	.din	(ever_been_running_in	[3:0]	),
	.dout	(ever_been_running	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign por_exc[3:0] =
       core_running[3:0] & ~core_running_last[3:0] &
       ~ever_been_running[3:0];
       
assign por_req_vec_in[3:0] = 
       (por_exc[3:0] & ~{4 {ssmode}}) | ssr_exc_forces_por[3:0];

assign por_req_in =
       | (por_req_vec_in[3:0] & clear_disrupting_flush_pending[3:0]);


tlu_fls_ctl_msff_ctl_macro__width_4 por_req_lat  (
	.scan_in(por_req_lat_scanin),
	.scan_out(por_req_lat_scanout),
	.din	(por_req_vec_in	[3:0]	),
	.dout	(por_req	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign xir_req_in = 
       xir_flush_b &
       ~dec_flush_b & 
       ~dsc_req_in &
       ~por_req_in;

assign xir_request_in[3:0] = 
       {4 {xir_req_in}} & 
       clear_disrupting_flush_pending[3:0] & tid_dec_w_in[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 xir_req_lat  (
	.scan_in(xir_req_lat_scanin),
	.scan_out(xir_req_lat_scanout),
	.din	(xir_request_in	[3:0]	),
	.dout	(xir_request	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// The following are RAS errors
assign ftt_req_in =
       l_sbpp_b & 
       ~dec_flush_b & 
       ~sir_b & ~xir_req_in & 
       ~dsc_req_in & ~por_req_in;
       
assign ftt_request_in[3:0] = 
       {4 {ftt_req_in}} & 
       clear_disrupting_flush_pending[3:0] & tid_dec_w_in[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 ftt_req_lat  (
	.scan_in(ftt_req_lat_scanin),
	.scan_out(ftt_req_lat_scanout),
	.din	(ftt_request_in	[3:0]	),
	.dout	(ftt_request	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ade_req_in = 
       ade_err_b &
       ~dec_flush_b & 
       ~iln_req_in & ~dqr_req_in & 
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 ade_req_lat  (
	.scan_in(ade_req_lat_scanin),
	.scan_out(ade_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ade_req_in		),
	.dout	(ade_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign eer_req_in = 
       eer_err_b &
       ~dec_flush_b & 
       ~ade_req_in & 
       ~iln_req_in & ~dqr_req_in & 
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;


tlu_fls_ctl_msff_ctl_macro__width_1 eer_req_lat  (
	.scan_in(eer_req_lat_scanin),
	.scan_out(eer_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(eer_req_in		),
	.dout	(eer_req		),
  .siclk(siclk),
  .soclk(soclk)
);

// The previous were RAS errors

assign ivt_req_in = 
       ivt_flush_b & 
       ~dec_flush_b & 
       ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 ivt_req_lat  (
	.scan_in(ivt_req_lat_scanin),
	.scan_out(ivt_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ivt_req_in		),
	.dout	(ivt_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign ma_req_in = 
       ma_flush_b & 
       ~dec_flush_b & 
       ~ivt_req_in & 
       ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 ma_req_lat  (
	.scan_in(ma_req_lat_scanin),
	.scan_out(ma_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(ma_req_in		),
	.dout	(ma_req			),
  .siclk(siclk),
  .soclk(soclk)
);

assign cwq_req_in = 
       cwq_flush_b & 
       ~dec_flush_b & 
       ~ma_req_in & ~ivt_req_in & 
       ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 cwq_req_lat  (
	.scan_in(cwq_req_lat_scanin),
	.scan_out(cwq_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(cwq_req_in		),
	.dout	(cwq_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign mqr_req_in = 
       mqr_exc_b & 
       ~dec_flush_b & 
       ~cwq_req_in & ~ma_req_in & ~ivt_req_in & 
       ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 mqr_req_lat  (
	.scan_in(mqr_req_lat_scanin),
	.scan_out(mqr_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(mqr_req_in		),
	.dout	(mqr_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign dqr_req_in = 
       dqr_exc_b & 
       ~dec_flush_b & 
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 dqr_req_lat  (
	.scan_in(dqr_req_lat_scanin),
	.scan_out(dqr_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(dqr_req_in		),
	.dout	(dqr_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign rqr_req_in = 
       rqr_exc_b & 
       ~dec_flush_b & 
       ~iln_req_in & ~dqr_req_in & 
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in &
       ~ade_req_in & ~eer_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 rqr_req_lat  (
	.scan_in(rqr_req_lat_scanin),
	.scan_out(rqr_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(rqr_req_in		),
	.dout	(rqr_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign iln_req_in =
       iln_exc_b &
       ~dec_flush_b & 
       ~dqr_req_in & 
       ~mqr_req_in & ~cwq_req_in & ~ma_req_in & 
       ~ivt_req_in & ~tlz_req_in & ~hst_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in & 
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 iln_req_lat  (
	.scan_in(iln_req_lat_scanin),
	.scan_out(iln_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(iln_req_in		),
	.dout	(iln_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign hst_req_in =
       hst_exc_b & 
       ~dec_flush_b & 
       ~tlz_req_in & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in &
       ~perf_trap_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 hst_req_lat  (
	.scan_in(hst_req_lat_scanin),
	.scan_out(hst_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(hst_req_in		),
	.dout	(hst_req		),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlz_req_in = 
       tlz_exc_b &
       ~dec_flush_b & 
       ~ftt_req_in & ~sir_b & ~xir_req_in & ~dsc_req_in & ~por_req_in;

assign tlz_request_in[3:0] = 
       {4 {tlz_req_in}} & 
       clear_disrupting_flush_pending[3:0] & tid_dec_w_in[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 tlz_req_lat  (
	.scan_in(tlz_req_lat_scanin),
	.scan_out(tlz_req_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(tlz_request_in	[3:0]	),
	.dout	(tlz_request	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Single step completion does not require a flush or gating from other
// exceptions
// Need to reset ssc_req_in in domode when G exceptions occur
// Or for exceptions on second cycle of twocycle instructions in domode
// Or for exceptions on second through eighth beats of block store in domode
assign ssc_req_in[3:0] = 
       (trl_ssc_exc[3:0] |
	((flush_gfb[3:0] | m_dae_req_w[3:0] |
	  (two_tid_dec_w[3:0] & {4 {e_f_ecc_w}}) |
          bsee_req[3:0] | pdist_ecc_w[3:0]) & {4 {domode}}) |
        ssc_req[3:0]) & 
       ~(tid_dec_w[3:0] & ~flush_ifu[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 ssc_req_lat  (
	.scan_in(ssc_req_lat_scanin),
	.scan_out(ssc_req_lat_scanout),
	.din	(ssc_req_in	[3:0]	),
	.dout	(ssc_req	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// There are certain cases for which we want to create a
// disrupting exception so that the 'next' instruction will be flushed
// and we can signal the completion
// This is the 'highest priority' disrupting or reset exception behind
// POR because it's really for the 'last' instruction
//
// tcu_ss_request	  x		x
// trl_trap_taken[n]	    x 		  x		x
// dec_inst_valid_m	      x		    x		  x
// ssc_req (precise)	        x
// flush_ifu				      x		    x
// disrupting_ssc_exc			       xxxxxxxxxxxxxx
// disrupting_ssc_req					    x
//
// suppress_d_s_e         xxxxxxx       xxxx
//
// But we don't want to do this on hardware tablewalks.  We want to let the
// tablewalk proceed without interruption, and want to stop after the 
// instruction with the hardware tablewalk.
//
// Also need to set disrupting_ssc_exc for late exceptions
// But have to suppress disrupting_ssc_req for late exceptions

assign disrupting_ssc_exc_in[3:0] =
       {4 {ssmode}} & 
        ((flush_ifu[3:0] & tid_dec_w[3:0] & ~disrupting_ssc_exc[3:0] & 
          ~idl_request[3:0] & ~iht_request[3:0] & ~dht_request[3:0]) |
         flush_gfb[3:0] | 
         hwtw_exception[3:0] |
         (two_tid_dec_w[3:0] & {4 {e_f_ecc_w}}) |
         bsee_req[3:0] | pdist_ecc_w[3:0] |
         (disrupting_ssc_exc[3:0] & ~disrupting_ssc_req[3:0]));

tlu_fls_ctl_msff_ctl_macro__width_4 disrupting_ssc_exc_lat  (
	.scan_in(disrupting_ssc_exc_lat_scanin),
	.scan_out(disrupting_ssc_exc_lat_scanout),
	.din	(disrupting_ssc_exc_in	[3:0]	),
	.dout	(disrupting_ssc_exc	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign dsc_req_in =
       | (disrupting_ssc_exc[3:0] & clear_disrupting_flush_pending[3:0]);

assign disrupting_ssc_req[3:0] =
       disrupting_ssc_exc[3:0] & flush_ifu[3:0] & ~por_req[3:0] & 
       ~(flush_gfb[3:0] | m_dae_req_w[3:0] |
         bsee_req[3:0] | pdist_ecc_w[3:0]);



//////////////////////////////////////////////////////////////////////////////
// Requests to trap redirect logic
//

assign fls_ssc_request[3:0] =
       (ssc_req[3:0] & tid_dec_w[3:0] & ~flush_ifu[3:0]) | 
       disrupting_ssc_req[3:0];

assign fls_ssr_request[3:0] =
       ssr_req[3:0];

assign fls_res_request[3:0] =
       res_req[3:0];

// Nonsequential NPC after retry (or taken branch after retry)
assign fls_nns_request[3:0] =
       nns_to_pc_w[3:0] & {4 {~(domode | ssmode)}};

assign fls_por_request[3:0] =  
       por_req[3:0];

assign fls_xir_request[3:0] =
       xir_request[3:0];

assign fls_tlz_request[3:0] = 
       tlz_request[3:0];

assign fls_hst_request[3:0] = 
       {4 {hst_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_ivt_request[3:0] = 
       {4 {ivt_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_sma_request[3:0] =
       {4 {ma_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_cwq_request[3:0] =
       {4 {cwq_req}} & 
       clear_disrupting_flush_pending_w[3:0];

// CPU mondo trap request
assign fls_mqr_request[3:0] =
       {4 {mqr_req}} &
       clear_disrupting_flush_pending_w[3:0];

// Device mondo trap request
assign fls_dqr_request[3:0] =
       {4 {dqr_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_iln_request[3:0] = 
       {4 {iln_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_rqr_request[3:0] = 
       {4 {rqr_req}} &
       clear_disrupting_flush_pending_w[3:0];

assign fls_ade_request[3:0] = 
       {4 {ade_req}} & 
       clear_disrupting_flush_pending_w[3:0];

// Idle lower than all other exceptions so that the other exceptions are not
// lost
assign idl_request[3:0] =
       {4 {idl_req}} & 
       clear_disrupting_flush_pending_w[3:0];

assign fls_idl_request[3:0] =
       idl_request[3:0];

assign fls_sir_request[3:0] = 
       {4 {sir_w}} & tid_dec_w[3:0];

tlu_fls_ctl_msff_ctl_macro__width_4 hw_tw_enabled_lat  (
	.scan_in(hw_tw_enabled_lat_scanin),
	.scan_out(hw_tw_enabled_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(mmu_hw_tw_enable	[3:0]	),
	.dout	(hw_tw_enabled		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign hw_tw_disabled[3:0] = 
       ~hw_tw_enabled[3:0];

assign itm_request[3:0] = 
       {4 {itlb_miss_w}} & tid_dec_w[3:0];

assign fls_itm_request[3:0] =
       (itm_request[3:0] & hw_tw_disabled[3:0]);

assign iht_request[3:0] =
       itm_request[3:0] & hw_tw_enabled[3:0];

assign tlu_iht_request[3:0] =
       iht_request[3:0];

assign load_i_tag_access_in =
       itlb_priv_exc_w_in | itlb_nfo_exc_w_in | i_oor_va_w_in | itlb_err_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 load_i_tag_access_lat  (
	.scan_in(load_i_tag_access_lat_scanin),
	.scan_out(load_i_tag_access_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(load_i_tag_access_in	),
	.dout	(load_i_tag_access_pre	),
  .siclk(siclk),
  .soclk(soclk)
);

assign load_i_tag_access[3:0] =
       itm_request[3:0] | 
       ({4 {load_i_tag_access_pre}} & tid_dec_w[3:0]);

assign fls_iae_request[3:0] = 
       ({4 {i_l2_unde_w}} & tid_dec_w[3:0]); 

assign ipe_request[3:0] =
       ({4 {e_f_ecc_w}} & two_tid_dec_w[3:0]) |
       bsee_req[3:0] | asi_ecc_w[3:0] | l_sbdl_ecc_w[3:0] | 
       pdist_ecc_w[3:0];

assign fls_ipe_request[3:0] =
       ipe_request[3:0];

assign fls_ipv_request =
       itlb_priv_exc_w;

assign fls_inp_request =
       itlb_nfo_exc_w;

assign fls_iar_request =
       i_oor_va_w;

assign fls_irr_request =
       i_ra_oor_va_w;

assign fls_mar_request =
       br_ld_oor_va_w;

assign fls_mrr_request =
       br_ld_ra_oor_va_w;

assign fls_pro_request =
       priv_exc_w;

// hyperprivileged exceptions cause
// illegal instruction traps
assign fls_ill_request = 
       illegal_inst_w | hpriv_exc_w;

assign fls_don_request = 
       done_inst_w;

assign fls_ret_request = 
       retry_inst_w;

assign fls_fpd_request = 
       fpdisable_exc_w;

assign fls_snn_request = 
       snn_w;

assign fls_sno_request = 
       sno_w;

assign fls_fnn_request = 
       fnn_w;

assign fls_fno_request = 
       fno_w;

assign fls_clw_request = 
       clw_w;

assign dtm_request[3:0] = 
       {4 {dtlb_miss_w}} & tid_dec_w[3:0];

assign fls_dtm_request[3:0] =
       dtm_request[3:0] & hw_tw_disabled[3:0];

assign dht_request[3:0] =
       dtm_request[3:0] & hw_tw_enabled[3:0];

assign tlu_dht_request[3:0] =
       dht_request[3:0];

assign load_d_tag_access_in =
       dae_priv_viol_w_in | dae_nc_page_w_in | 
       dae_nfo_page_w_in | dae_so_page_w_in | daccess_prot_w_in |
       dtlb_error_w_in;

tlu_fls_ctl_msff_ctl_macro__width_1 load_d_tag_access_lat  (
	.scan_in(load_d_tag_access_lat_scanin),
	.scan_out(load_d_tag_access_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(load_d_tag_access_in	),
	.dout	(load_d_tag_access	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_load_d_tag_access[3:0] = 
       dtm_request[3:0] | 
       ({4 {load_d_tag_access & ~l_real_w}} & tid_dec_w[3:0]);

assign fls_ldf_request = 
       lddf_align_w;

assign fls_stf_request = 
       stdf_align_w;

assign fls_dap_request =
       daccess_prot_w;

assign vaw_request[3:0] = 
       {4 {va_watchpoint_w}} & tid_dec_w[3:0];

assign fls_vaw_request = 
       va_watchpoint_w;

assign iaw_request[3:0] = 
       {4 {iaw_w}} & tid_dec_w[3:0];

assign fls_iaw_request = 
       iaw_w; 

assign paw_request[3:0] = 
       {4 {pa_watchpoint_w}} & tid_dec_w[3:0];

assign fls_paw_request = 
       pa_watchpoint_w; 

assign fls_maa_request = 
       align_w | e_misalign_w;

assign fls_fpe_request = 
       f_predict_w;
	
assign fls_fei_request[3:0] = 
       ieee_exc_fw[3:0];
	
assign fls_fof_request[3:0] = 
       unfin_fw[3:0];

assign fls_pra_request[3:0] = 
       ({4 {priv_action_w}} & tid_dec_w[3:0]) | priv_action_g_w[3:0]; 

assign fls_dia_request = 
       dae_invalid_asi_w;

assign fls_ups_request[3:0] = 
       m_dae_req_w[3:0];  
	
assign fls_dnc_request = 
       dae_nc_page_w;
	
assign fls_dnf_request = 
       dae_nfo_page_w;
	
assign fls_dpv_request = 
       dae_priv_viol_w;
	
assign fls_dso_request = 
       dae_so_page_w;
	
assign fls_tof_request = 
       tof_w;
	
assign fls_dbz_request[3:0] = 
       idiv0_exc_fw[3:0];
	
assign fls_tcc_request = 
       tcc_w;

assign fls_dae_request[3:0] = 
       l_l2_ecc_w[3:0];

assign irt_request[3:0] = 
       {4 {ra_itlb_miss_w}} & tid_dec_w[3:0];

assign i_real_w[3:0] =
       ~itlb_bypass[3:0] & ~immu_enable[3:0];

assign load_i_tag_access_r[3:0] = 
       ({4 {i_ra_oor_va_w}} & tid_dec_w[3:0]) | irt_request[3:0];

assign tlu_load_i_tag_access_p[3:0] =
       load_i_tag_access[3:0] &  tl_eq_0[3:0] & ~i_real_w[3:0];

assign tlu_load_i_tag_access_n[3:0] =
       (load_i_tag_access[3:0] & ~tl_eq_0[3:0]) | 
       (load_i_tag_access[3:0] & i_real_w[3:0]) | 
       load_i_tag_access_r[3:0];

assign fls_irt_request =
       ra_itlb_miss_w;

assign drt_request[3:0] = 
       {4 {ra_dtlb_miss_w}} & tid_dec_w[3:0];

assign tlu_load_d_tag_access_r[3:0] = 
       drt_request[3:0] | 
       ({4 {load_d_tag_access & l_real_w}} & tid_dec_w[3:0]);

assign fls_drt_request =
       ra_dtlb_miss_w;

assign fls_pmu_request[3:0] = 
       ({4 {perf_trap_w | precise_perf_trap_w}} & tid_dec_w[3:0]) | 
       precise_perf_trap_g_w[3:0];

assign pre_lsr_request[3:0] =
       (nns_to_npc_w[3:0] | trap_flush[3:0]) & {4 {~(domode | ssmode)}};

assign fls_lsr_request[3:0] =
       ~(~pre_lsr_request[3:0] | ipe_request[3:0]);

assign fls_ime_request[3:0] =
       ime_w[3:0] |
       ({4 {itlb_err_w}} & tid_dec_w[3:0]);

assign fls_dme_request[3:0] =
       dme_w[3:0] |
       ({4 {dtlb_error_w}} & tid_dec_w[3:0]);

assign fls_eer_request[3:0] =
       {4 {eer_req}} & clear_disrupting_flush_pending_w[3:0];

assign fls_icp_request = 
       icp_req;
	
assign fls_ftt_request[3:0] =
       ftt_request[3:0];

assign ibp_request[3:0] = 
       {4 {ibp_w}} & tid_dec_w[3:0];

assign fls_ibp_request = 
       ibp_w;

assign tct_request[3:0] = 
       {4 {tct_w}} & tid_dec_w[3:0];

assign fls_tct_request = 
       tct_w;

assign fls_ref_request =
       refetch_w;

assign fls_ipe_dme_request =
       ((e_f_ecc_w | dtlb_error_w) & (| two_tid_dec_w[3:0])) | 
       (| bsee_req[3:0]) | (| pdist_ecc_w[3:0]);

assign fls_load_dsfar[3:0] =
       ({4 {align_w | e_misalign_w | dae_invalid_asi_w | dae_priv_viol_w |
	    dae_nc_page_w | dae_nfo_page_w | dae_so_page_w | 
	    br_ld_oor_va_w | br_ld_ra_oor_va_w | 
            daccess_prot_w | pa_watchpoint_w |
	    va_watchpoint_w |
            lddf_align_w | stdf_align_w}} & tid_dec_w[3:0]); 



// If a
// branch that annuls its own delay slot that is in the delay slot of
// another branch 
// precedes an instruction with 
// a pre-icache exception, then that instruction will
// cause an instruction cache parity
// microarchitectural trap (icp).  Note that the disrupting exception is
// NOT posted, so no trap will be taken later.  
// This solution does cause
// the instruction cache line to be invalidated for no reason.

// First, capture that a branch in a delay slot has annulled its own delay slot

assign m103663_in[3:0] =
       ( tid_dec_w_in[3:0] & {4 {annul_ds_b & ~br_taken_b}}) | 
       (~tid_dec_w_in[3:0] & m103663[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 m103663_lat  (
	.scan_in(m103663_lat_scanin),
	.scan_out(m103663_lat_scanout),
	.din	(m103663_in	[3:0]	),
	.dout	(m103663	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Then generate exception and gate off the pre-icache exceptions
// This needs to be tid_dec_b to be fast, but the hold latch needs tid_dec_w_in
// to hold through dec_flush_b situations
// Have to gate off this exception in the absence of valid
assign m103663_exc_b =
       (| (m103663[3:0] & tid_dec_b[3:0])) & pre_inst_valid_b;

// i_oor_va_b and i_ra_oor_va_b not needed because these would not occur
// before the boundary.  IFU doesn't detect branches into VA hole; EXU
// and TLU do.
assign refetch_b = 
       m103663_exc_b & 
       (itlb_miss_b | ra_itlb_miss_b | itlb_priv_exc_b | itlb_nfo_exc_b |
	i_l2_unde_b | itlb_err_b | ic_err_b) ;

assign refetch_w_in =
       refetch_b & kill_exc_lt_6_b_;

tlu_fls_ctl_msff_ctl_macro__width_1 refetch_w_lat  (
	.scan_in(refetch_w_lat_scanin),
	.scan_out(refetch_w_lat_scanout),
	.din	(refetch_w_in		),
	.dout	(refetch_w		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Save CWP on flush

assign cwp3_in[2:0] =
        ({3 { flush_ifu[3]}} & exu_cwp3[2:0]) | 
	({3 {~flush_ifu[3]}} & cwp3[2:0]);
assign cwp2_in[2:0] =
        ({3 { flush_ifu[2]}} & exu_cwp2[2:0]) | 
	({3 {~flush_ifu[2]}} & cwp2[2:0]);
assign cwp1_in[2:0] =
        ({3 { flush_ifu[1]}} & exu_cwp1[2:0]) | 
	({3 {~flush_ifu[1]}} & cwp1[2:0]);
assign cwp0_in[2:0] =
        ({3 { flush_ifu[0]}} & exu_cwp0[2:0]) | 
	({3 {~flush_ifu[0]}} & cwp0[2:0]);

tlu_fls_ctl_msff_ctl_macro__width_12 cwp_lat  ( 
	.scan_in(cwp_lat_wmr_scanin),
	.scan_out(cwp_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	({cwp3_in	[2:0],
		  cwp2_in	[2:0],
		  cwp1_in	[2:0],
		  cwp0_in	[2:0]}),
	.dout	({cwp3		[2:0],
		  cwp2		[2:0],
		  cwp1		[2:0],
		  cwp0		[2:0]}),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign fls_cwp3[2:0] =
       cwp3[2:0];
assign fls_cwp2[2:0] =
       cwp2[2:0];
assign fls_cwp1[2:0] =
       cwp1[2:0];
assign fls_cwp0[2:0] =
       cwp0[2:0];



////////////////////////////////////////////////////////////////////////////////
//
// Manage PC, NPC
//
// Terminology:  a taken branch will not have an exception
assign tid_dec_valid_b[3:0] =
       tid_dec_b[3:0] & {4 {inst_valid_b}};

// Sequential flow 
//   or 
// branch not taken that annuls the delay slot that itself is in a delay slot
//   or 
// branch taken and NPC is invalid
// In pct, pc_sel_npc_plus_4 is prioritized over pc_sel_npc
assign fls_pc_sel_npc[3:0] =
       (pc_valid[3:0] | {4 {br_taken_b | annul_ds_b}}) & 
       tid_dec_valid_b[3:0];
	

// Branch taken and NPC is valid 
//   or 
// branch not taken that annuls the delay slot that is not in a delay slot
assign pc_sel_npc_plus_4[3:0] =
       npc_valid[3:0] & {4 {br_taken_b | (annul_ds_b & ~ds_b)}} & 
       tid_dec_valid_b[3:0];

assign fls_pc_sel_npc_plus_4[3:0] =
       pc_sel_npc_plus_4[3:0];




// Sequential flow or 
// first instruction (with or without exception) after done 
//   or 
// branch not taken that annuls the delay slot that itself is in a delay slot 
//   or 
// branch not taken that annuls delay slot that's not in a delay slot w/npc inv
// In pct, npc_sel_target and npc_sel_npc_plus_8 are prioritized over 
// npc_sel_npc_plus_4
assign fls_npc_sel_npc_plus_4[3:0] =
       ((npc_valid[3:0] & {4 {~annul_ds_b}}) | {4 {annul_ds_b}}) & 
       tid_dec_valid_b[3:0]; 

// Branch not taken that annuls the delay slot that is not in a delay slot
// In pct, npc_sel_target is prioritized over npc_sel_npc_plus_8
assign fls_npc_sel_npc_plus_8[3:0] =
       npc_valid[3:0] & {4 {annul_ds_b & ~ds_b}} &
       tid_dec_valid_b[3:0];

// Taken branch that does not have exception
assign fls_npc_sel_target[3:0] =
       {4 {br_taken_b}} & tid_dec_valid_b[3:0];



// PC becomes valid whenever instruction comes down pipe and that instruction
// is not 
//   a taken branch that does not annul the delay slot
//   an instruction that is being flushed due to idle exception
// PC is invalidated on trap, done, retry
assign prevent_valid =
       (br_taken_b & ~annul_ds_b) | disrupting_flush_b | pmu_debug_exc_b | 
       refetch_b;

// A flushed instruction should not affect PC valids
// (Flushes prevent updates to pc_?_w registers in PCT)
assign inst_b[3:0] =
       tid_dec_valid_b[3:0] & {4 {~dec_flush_b}};

assign pc_valid_in[3:0] =
       ( inst_b[3:0] & ~{4 {prevent_valid}}) |
       (~inst_b[3:0] & pc_valid[3:0] & ~trl_invalidate_pc[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 pc_valid_lat  (
	.scan_in(pc_valid_lat_scanin),
	.scan_out(pc_valid_lat_scanout),
	.din	(pc_valid_in		[3:0]	),
	.dout	(pc_valid		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_pc_valid[3:0] =
       pc_valid[3:0];


// NPC becomes valid whenever instruction comes down pipe and that instruction
// is not
//   a taken branch that does not annul the delay slot
//   an instruction that is being flushed due to idle exception
// NPC is invalidated on trap and retry (valid on done to calculate real NPC)
assign npc_valid_in[3:0] =
       ( inst_b[3:0] & ~{4 {prevent_valid}}) |
       (~inst_b[3:0] & npc_valid[3:0] & ~trl_invalidate_npc[3:0]);

tlu_fls_ctl_msff_ctl_macro__width_4 npc_valid_lat  (
	.scan_in(npc_valid_lat_scanin),
	.scan_out(npc_valid_lat_scanout),
	.din	(npc_valid_in		[3:0]	),
	.dout	(npc_valid		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign npc_is_valid = 
       (| (tid_dec_b[3:0] & npc_valid[3:0])) & inst_valid_b;

assign fls_npc_b_sel_npc =
       ~npc_is_valid;


// PC is actually NPC if
//   inst is taken branch that does not annul delay slot that is not in a delay
//     slot itself
//   inst is after done, retry, or trap
// In the case of a delay slot that's annulled, we want to know
//  the NPC of the delay slot, not the branch.  In this case, the NPC of the
//  delay slot is in the NPC flop, so the PC is not the NPC (that we want).
// If a branch in the delay slot of another branch is at decode 
//  (signified by dec_inst_cnt[01:00] being nonzero), then the PC is no longer 
//  the NPC.  Handled in tlu_pct_dp
assign pc_is_npc_in[3:0] =
       (inst_b[3:0] & {4 { br_taken_b & ~annul_ds_b}}) |
       trl_invalidate_pc[3:0] |
       (pc_is_npc[3:0] & ~inst_b[3:0]); 

tlu_fls_ctl_msff_ctl_macro__width_4 pc_is_npc_lat  (
	.scan_in(pc_is_npc_lat_scanin),
	.scan_out(pc_is_npc_lat_scanout),
	.din	(pc_is_npc_in		[3:0]	),
	.dout	(pc_is_npc		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_pc_is_npc =
       | (pc_is_npc[3:0] & tid_dec_d[3:0]);



//////////////////////////////////////////////////////////////////////////////
//
// Implement adder for lower two bits of NPC at D
//

// Need to mux NPC down to by thread group
assign pre_npc_d[3:2] =        
       ({2 {tid_dec_d[0]}} & pct_npc_0_w[3:2]) |
       ({2 {tid_dec_d[1]}} & pct_npc_1_w[3:2]) |
       ({2 {tid_dec_d[2]}} & pct_npc_2_w[3:2]) |
       ({2 {tid_dec_d[3]}} & pct_npc_3_w[3:2]) ;

assign pre_npc_d[4] =
       1'b0;

// Need to select inst_cnt minus one when a branch in the delay slot of
//  another branch is at decode, because the PC of the instruction after the 
//  branch (which is at D and in the delay slot) is in the NPC register
assign sel_inst_cnt_m_1 = 
       | (pc_is_npc[3:0] & ~npc_valid[3:0] & tid_dec_d[3:0]);



// Precalculate possible outcomes and then mux them
// dec_inst_cnt	sel_inst_cnt_m1		npc_inc_d = pre_npc_d + ?
//	00		1			0
//	00		0			0
//	01		1			0
//	01		0			1
//	10		1			1
//	10		0			2
//	11		1			2
//	11		0			3

assign npc_plus_0[4:2] =
       pre_npc_d[4:2];

assign npc_plus_1[4:2] =
       pre_npc_d[4:2] + 3'b001;

assign npc_plus_2[4:2] =
       pre_npc_d[4:2] + 3'b010;

assign npc_plus_3[4:2] =
       pre_npc_d[4:2] + 3'b011;


assign fls_npc_if_cnt_eq_1_d[4:2] =
       ({3 { sel_inst_cnt_m_1}} & npc_plus_0[4:2]) |
       ({3 {~sel_inst_cnt_m_1}} & npc_plus_1[4:2]) ;

assign fls_npc_if_cnt_eq_2_d[4:2] =
       ({3 { sel_inst_cnt_m_1}} & npc_plus_1[4:2]) |
       ({3 {~sel_inst_cnt_m_1}} & npc_plus_2[4:2]) ;

assign fls_npc_if_cnt_eq_3_d[4:2] =
       ({3 { sel_inst_cnt_m_1}} & npc_plus_2[4:2]) |
       ({3 {~sel_inst_cnt_m_1}} & npc_plus_3[4:2]) ;



//////////////////////////////////////////////////////////////////////////////
//
//  tlu_pct_dp power management
//

assign fls_pct_pc_en[3:0] =
       trl_pc_sel_trap_pc[3:0] | (tid_dec_b[3:0] & {4 {pre_inst_valid_b}});

assign fls_pct_npc_en[3:0] =
       trl_fls_npc_en[3:0] | (tid_dec_b[3:0] & {4 {pre_inst_valid_b}});



//////////////////////////////////////////////////////////////////////////////
//
//  Debug event control register processing
//

tlu_fls_ctl_msff_ctl_macro__width_4 debug_event_lat  (
	.scan_in(debug_event_lat_scanin),
	.scan_out(debug_event_lat_scanout),
	.din	(pmu_tlu_debug_event		[3:0]	),
	.dout	(debug_event			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign softstop_req_in =
       | (
	({4 {asi_decr[63:62] == 2'b01}} & ibp_request		[3:0]) |
	({4 {asi_decr[61:60] == 2'b01}} & iaw_request		[3:0]) |
	({4 {asi_decr[59:58] == 2'b01}} & vaw_request		[3:0]) |
	({4 {asi_decr[57:56] == 2'b01}} & paw_request		[3:0]) |
	({4 {asi_decr[55:54] == 2'b01}} & tct_request		[3:0]) |
	({4 {asi_decr[53:52] == 2'b01}} & ras_precise_error	[3:0]) |
	({4 {asi_decr[51:50] == 2'b01}} & ras_disrupting_error	[3:0]) |
	({4 {asi_decr[49:48] == 2'b01}} & ras_deferred_error	[3:0]) |
	({4 {asi_decr[47:46] == 2'b01}} & debug_event		[3:0]) );

assign hardstop_req_in =
       | (
	({4 {asi_decr[63:62] == 2'b10}} & ibp_request		[3:0]) |
	({4 {asi_decr[61:60] == 2'b10}} & iaw_request		[3:0]) |
	({4 {asi_decr[59:58] == 2'b10}} & vaw_request		[3:0]) |
	({4 {asi_decr[57:56] == 2'b10}} & paw_request		[3:0]) |
	({4 {asi_decr[55:54] == 2'b10}} & tct_request		[3:0]) |
	({4 {asi_decr[53:52] == 2'b10}} & ras_precise_error	[3:0]) |
	({4 {asi_decr[51:50] == 2'b10}} & ras_disrupting_error	[3:0]) |
	({4 {asi_decr[49:48] == 2'b10}} & ras_deferred_error	[3:0]) |
	({4 {asi_decr[47:46] == 2'b10}} & debug_event		[3:0]) );

assign pulse_req_in =
       | (
	({4 {asi_decr[63:62] == 2'b11}} & ibp_request		[3:0]) |
	({4 {asi_decr[61:60] == 2'b11}} & iaw_request		[3:0]) |
	({4 {asi_decr[59:58] == 2'b11}} & vaw_request		[3:0]) |
	({4 {asi_decr[57:56] == 2'b11}} & paw_request		[3:0]) |
	({4 {asi_decr[55:54] == 2'b11}} & tct_request		[3:0]) |
	({4 {asi_decr[53:52] == 2'b11}} & ras_precise_error	[3:0]) |
	({4 {asi_decr[51:50] == 2'b11}} & ras_disrupting_error	[3:0]) |
	({4 {asi_decr[49:48] == 2'b11}} & ras_deferred_error	[3:0]) |
	({4 {asi_decr[47:46] == 2'b11}} & debug_event		[3:0]) );

tlu_fls_ctl_msff_ctl_macro__width_1 softstop_req_lat  (
	.scan_in(softstop_req_lat_scanin),
	.scan_out(softstop_req_lat_scanout),
	.din	(softstop_req_in			),
	.dout	(softstop_req				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 hardstop_req_lat  (
	.scan_in(hardstop_req_lat_scanin),
	.scan_out(hardstop_req_lat_scanout),
	.din	(hardstop_req_in			),
	.dout	(hardstop_req				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_fls_ctl_msff_ctl_macro__width_1 pulse_req_lat  (
	.scan_in(pulse_req_lat_scanin),
	.scan_out(pulse_req_lat_scanout),
	.din	(pulse_req_in				),
	.dout	(pulse_req				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fls_spc_softstop_request =
	softstop_req;
assign fls_spc_hardstop_request =
	hardstop_req;
assign fls_spc_trigger_pulse =
	pulse_req;



//////////////////////////////////////////////////////////////////////////////
//
//  Core instruction signature
//

// 00 : instruction non commited
// 01 : Control Transfer instruction commited in pipe
// 10 : Integer or FPU instruction commited in pipe
// 11 : Ld/Store instruction commited in pipe
assign instr_cmt_grp_in[1:0] =
       {2 {inst_valid_w & ~(| (flush_ifu[3:0] & tid_dec_w[3:0]))}} &
       {~cti_w, cti_w | lsu_inst_w};

tlu_fls_ctl_msff_ctl_macro__width_2 instr_cmt_grp_lat  (
	.scan_in(instr_cmt_grp_lat_scanin),
	.scan_out(instr_cmt_grp_lat_scanout),
	.din	(instr_cmt_grp_in		[1:0]	),
	.dout	(instr_cmt_grp			[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_dbg_instr_cmt_grp[1:0] =
       instr_cmt_grp[1:0];
 



//////////////////////////////////////////////////////////////////////////////
//
//  Tag access register power management
//

assign tlu_tag_access_tid_b[1:0] =
       tid_b[1:0];

assign tlu_i_tag_access_b =
       itlb_miss_b | ra_itlb_miss_b | itlb_priv_exc_b | itlb_nfo_exc_b | 
       i_oor_va_b | i_ra_oor_va_b | itlb_err_b | target_oor_b;

assign tlu_d_tag_access_b =
       lsu_inst_b;



//////////////////////////////////////////////////////////////////////////////
//
// Shadow scan control for PC
//

assign fls_ss_update_pc_w =
       (trl_shscanid[2] == thread_group) &
       (( trl_shscanid[1] &  trl_shscanid[0] & tid_dec_w_in[3]) |
	( trl_shscanid[1] & ~trl_shscanid[0] & tid_dec_w_in[2]) |
	(~trl_shscanid[1] &  trl_shscanid[0] & tid_dec_w_in[1]) |
	(~trl_shscanid[1] & ~trl_shscanid[0] & tid_dec_w_in[0]) );



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//



assign m114419_nor3_0[3:0] =
       ~(pre_xir_flush[3:0] | pre_desr_f[3:0] | pre_l_sbpp[3:0]);

assign m114419_nor3_1[3:0] =
       ~(pre_ma_flush[3:0] | pre_cwq_flush[3:0] | pre_ivt_flush[3:0]);

assign m114419_nor3_2[3:0] =
       ~(idl_exc[3:0] | {4 {ssmode | domode}});

assign m114419_nand3_0[3:0] =
       ~(m114419_nor3_0 & m114419_nor3_1 & m114419_nor3_2);

assign m114419_inv_0[3:0] =
       ~(m114419_nand3_0[3:0]);

assign unhalt[3:0] =
       ~(trl_unhalt_[3:0] & m114419_inv_0[3:0]);

assign halted_in[3:0] =
       ~(~(halted[3:0] | asi_halt[3:0]) | unhalt[3:0]);

tlu_fls_ctl_msff_ctl_macro__scanreverse_1__width_16 spare_15_0_lat  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.din	({{6{1'b0}}		       ,
		  halted_in		[3   ],
		  1'b0			       ,
		  halted_in		[0   ],
		  1'b0			       ,
		  halted_in		[1   ],
		  1'b0			       ,
		  halted_in		[2   ],
		  {3{1'b0}}		       }),
	.dout	({unused		[15:10],
		  halted		[3   ],
		  unused		[8   ],
		  halted		[0   ],
		  unused		[6   ],
		  halted		[1   ],
		  unused		[4   ],
		  halted		[2   ],
		  unused		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_halted[3:0] =
       halted[3:0];






supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// fixscan start:
assign beat_two_b_lat_scanin     = scan_in                  ;
assign l1en_b2w_lat_scanin       = beat_two_b_lat_scanout   ;
assign hpstate_hpriv_lat_scanin  = l1en_b2w_lat_scanout     ;
assign hpriv_bar_or_ie_lat_scanin = hpstate_hpriv_lat_scanout;
assign hpriv_bar_and_ie_lat_scanin = hpriv_bar_or_ie_lat_scanout;
assign tid_dec_d_lat_scanin      = hpriv_bar_and_ie_lat_scanout;
assign itlb_bypass_lat_scanin    = tid_dec_d_lat_scanout    ;
assign itlb_bypass_e_lat_scanin  = itlb_bypass_lat_scanout  ;
assign l_tlu_twocycle_b_lat_scanin = itlb_bypass_e_lat_scanout;
assign tid_b_lat_scanin          = l_tlu_twocycle_b_lat_scanout;
assign fast_tid_dec_b_lat_scanin = tid_b_lat_scanout        ;
assign pre_inst_valid_b_lat_scanin = fast_tid_dec_b_lat_scanout;
assign tl_eq_0_lat_scanin        = pre_inst_valid_b_lat_scanout;
assign lsu_inst_b_lat_scanin     = tl_eq_0_lat_scanout      ;
assign fgu_inst_b_lat_scanin     = lsu_inst_b_lat_scanout   ;
assign illegal_inst_b_lat_scanin = fgu_inst_b_lat_scanout   ;
assign itlb_miss_b_lat_scanin    = illegal_inst_b_lat_scanout;
assign ra_itlb_miss_b_lat_scanin = itlb_miss_b_lat_scanout  ;
assign itlb_priv_exc_b_lat_scanin = ra_itlb_miss_b_lat_scanout;
assign itlb_nfo_exc_b_lat_scanin = itlb_priv_exc_b_lat_scanout;
assign i_l2_unde_b_lat_scanin    = itlb_nfo_exc_b_lat_scanout;
assign i_oor_va_b_lat_scanin     = i_l2_unde_b_lat_scanout  ;
assign i_ra_oor_va_b_lat_scanin  = i_oor_va_b_lat_scanout   ;
assign itlb_err_b_lat_scanin     = i_ra_oor_va_b_lat_scanout;
assign ic_err_b_lat_scanin       = itlb_err_b_lat_scanout   ;
assign done_inst_b_lat_scanin    = ic_err_b_lat_scanout     ;
assign retry_inst_b_lat_scanin   = done_inst_b_lat_scanout  ;
assign sir_b_lat_scanin          = retry_inst_b_lat_scanout ;
assign hpriv_exc_b_lat_scanin    = sir_b_lat_scanout        ;
assign priv_exc_b_lat_scanin     = hpriv_exc_b_lat_scanout  ;
assign fpdisable_exc_b_lat_scanin = priv_exc_b_lat_scanout   ;
assign ecc_b_lat_scanin          = fpdisable_exc_b_lat_scanout;
assign misalign_b_lat_scanin     = ecc_b_lat_scanout        ;
assign e_oor_va_b_lat_scanin     = misalign_b_lat_scanout   ;
assign e_tcc_b_lat_scanin        = e_oor_va_b_lat_scanout   ;
assign e_tof_b_lat_scanin        = e_tcc_b_lat_scanout      ;
assign e_fill_b_lat_scanin       = e_tof_b_lat_scanout      ;
assign br_taken_b_lat_scanin     = e_fill_b_lat_scanout     ;
assign annul_ds_m_lat_scanin     = br_taken_b_lat_scanout   ;
assign ds_b_lat_scanin           = annul_ds_m_lat_scanout   ;
assign perf_trap_b_lat_scanin    = ds_b_lat_scanout         ;
assign pil_mask_15_lat_scanin    = perf_trap_b_lat_scanout  ;
assign ibp_b_lat_scanin          = pil_mask_15_lat_scanout  ;
assign iaw_exc_m_lat_scanin      = ibp_b_lat_scanout        ;
assign iaw_b_lat_scanin          = iaw_exc_m_lat_scanout    ;
assign pstate_tct_b_lat_scanin   = iaw_b_lat_scanout        ;
assign tct_b_lat_scanin          = pstate_tct_b_lat_scanout ;
assign cti_b_lat_scanin          = tct_b_lat_scanout        ;
assign twocycle_inst_w_lat_scanin = cti_b_lat_scanout        ;
assign d_flush_w_lat_scanin      = twocycle_inst_w_lat_scanout;
assign tid_dec_w_lat_scanin      = d_flush_w_lat_scanout    ;
assign pstate_am_b_lat_scanin    = tid_dec_w_lat_scanout    ;
assign pstate_am_w_lat_scanin    = pstate_am_b_lat_scanout  ;
assign two_tid_dec_w_lat_scanin  = pstate_am_w_lat_scanout  ;
assign inst_valid_w_lat_scanin   = two_tid_dec_w_lat_scanout;
assign illegal_inst_w_lat_scanin = inst_valid_w_lat_scanout ;
assign itlb_miss_w_lat_scanin    = illegal_inst_w_lat_scanout;
assign ra_itlb_miss_w_lat_scanin = itlb_miss_w_lat_scanout  ;
assign itlb_priv_exc_w_lat_scanin = ra_itlb_miss_w_lat_scanout;
assign itlb_nfo_exc_w_lat_scanin = itlb_priv_exc_w_lat_scanout;
assign i_l2_err_w_lat_scanin     = itlb_nfo_exc_w_lat_scanout;
assign i_oor_va_w_lat_scanin     = i_l2_err_w_lat_scanout   ;
assign i_ra_oor_va_w_lat_scanin  = i_oor_va_w_lat_scanout   ;
assign itlb_err_w_lat_scanin     = i_ra_oor_va_w_lat_scanout;
assign ic_err_w_lat_scanin       = itlb_err_w_lat_scanout   ;
assign done_inst_w_lat_scanin    = ic_err_w_lat_scanout     ;
assign retry_inst_w_lat_scanin   = done_inst_w_lat_scanout  ;
assign sir_w_lat_scanin          = retry_inst_w_lat_scanout ;
assign hpriv_exc_w_lat_scanin    = sir_w_lat_scanout        ;
assign priv_exc_w_lat_scanin     = hpriv_exc_w_lat_scanout  ;
assign fpdisable_exc_w_lat_scanin = priv_exc_w_lat_scanout   ;
assign tcc_w_lat_scanin          = fpdisable_exc_w_lat_scanout;
assign tof_w_lat_scanin          = tcc_w_lat_scanout        ;
assign e_ecc_w_lat_scanin        = tof_w_lat_scanout        ;
assign kill_irf_ecc_w_lat_scanin = e_ecc_w_lat_scanout      ;
assign e_misalign_w_lat_scanin   = kill_irf_ecc_w_lat_scanout;
assign immu_enable_lat_scanin    = e_misalign_w_lat_scanout ;
assign br_ld_oor_va_w_lat_scanin = immu_enable_lat_scanout  ;
assign br_ld_ra_oor_va_w_lat_scanin = br_ld_oor_va_w_lat_scanout;
assign pc_oor_va_b_lat_scanin    = br_ld_ra_oor_va_w_lat_scanout;
assign snn_w_lat_scanin          = pc_oor_va_b_lat_scanout  ;
assign sno_w_lat_scanin          = snn_w_lat_scanout        ;
assign fnn_w_lat_scanin          = sno_w_lat_scanout        ;
assign fno_w_lat_scanin          = fnn_w_lat_scanout        ;
assign clw_w_lat_scanin          = fno_w_lat_scanout        ;
assign lsu_inst_w_lat_scanin     = clw_w_lat_scanout        ;
assign cti_w_lat_scanin          = lsu_inst_w_lat_scanout   ;
assign wstate3_w_lat_scanin      = cti_w_lat_scanout        ;
assign wstate2_w_lat_scanin      = wstate3_w_lat_scanout    ;
assign wstate1_w_lat_scanin      = wstate2_w_lat_scanout    ;
assign wstate0_w_lat_scanin      = wstate1_w_lat_scanout    ;
assign trap_number_w_lat_scanin  = wstate0_w_lat_scanout    ;
assign trap_number_3_lat_scanin  = trap_number_w_lat_scanout;
assign trap_number_2_lat_scanin  = trap_number_3_lat_scanout;
assign trap_number_1_lat_scanin  = trap_number_2_lat_scanout;
assign trap_number_0_lat_scanin  = trap_number_1_lat_scanout;
assign lddf_align_w_lat_scanin   = trap_number_0_lat_scanout;
assign stdf_align_w_lat_scanin   = lddf_align_w_lat_scanout ;
assign daccess_prot_w_lat_scanin = stdf_align_w_lat_scanout ;
assign priv_action_w_lat_scanin  = daccess_prot_w_lat_scanout;
assign va_watchpoint_w_lat_scanin = priv_action_w_lat_scanout;
assign pa_watchpoint_w_lat_scanin = va_watchpoint_w_lat_scanout;
assign align_w_lat_scanin        = pa_watchpoint_w_lat_scanout;
assign dtlb_w_lat_scanin         = align_w_lat_scanout      ;
assign ra_dtlb_w_lat_scanin      = dtlb_w_lat_scanout       ;
assign l_real_w_lat_scanin       = ra_dtlb_w_lat_scanout    ;
assign dae_invalid_asi_w_lat_scanin = l_real_w_lat_scanout     ;
assign dae_nc_page_w_lat_scanin  = dae_invalid_asi_w_lat_scanout;
assign dae_nfo_page_w_lat_scanin = dae_nc_page_w_lat_scanout;
assign dae_priv_viol_w_lat_scanin = dae_nfo_page_w_lat_scanout;
assign dae_so_page_w_lat_scanin  = dae_priv_viol_w_lat_scanout;
assign dtlb_error_w_lat_scanin   = dae_so_page_w_lat_scanout;
assign precise_perf_trap_w_lat_scanin = dtlb_error_w_lat_scanout ;
assign perf_trap_w_lat_scanin    = precise_perf_trap_w_lat_scanout;
assign ibp_w_lat_scanin          = perf_trap_w_lat_scanout  ;
assign iaw_w_lat_scanin          = ibp_w_lat_scanout        ;
assign tct_w_lat_scanin          = iaw_w_lat_scanout        ;
assign l_spec_enable_lat_scanin  = tct_w_lat_scanout        ;
assign f_predict_w_lat_scanin    = l_spec_enable_lat_scanout;
assign pdist_beat2_fx2_lat_scanin = f_predict_w_lat_scanout  ;
assign f_cecc_w_lat_scanin       = pdist_beat2_fx2_lat_scanout;
assign f_uecc_w_lat_scanin       = f_cecc_w_lat_scanout     ;
assign pdist_ecc_w_lat_scanin    = f_uecc_w_lat_scanout     ;
assign asi_ecc_w_lat_scanin      = pdist_ecc_w_lat_scanout  ;
assign ime_w_lat_scanin          = asi_ecc_w_lat_scanout    ;
assign dme_w_lat_scanin          = ime_w_lat_scanout        ;
assign m_dae_req_b_lat_scanin    = dme_w_lat_scanout        ;
assign m_dae_req_w_lat_scanin    = m_dae_req_b_lat_scanout  ;
assign br_taken_not_annul_ds_w_lat_scanin = m_dae_req_w_lat_scanout  ;
assign nns_exc_lat_scanin        = br_taken_not_annul_ds_w_lat_scanout;
assign nns_exc_w_lat_scanin      = nns_exc_lat_scanout      ;
assign exc_w_lat_scanin          = nns_exc_w_lat_scanout    ;
assign trap_flush_lat_scanin     = exc_w_lat_scanout        ;
assign preflush_b_lat_scanin     = trap_flush_lat_scanout   ;
assign flush_gfb_lat_scanin      = preflush_b_lat_scanout   ;
assign l_l2_ecc_w_lat_scanin     = flush_gfb_lat_scanout    ;
assign l_sbdl_ecc_w_lat_scanin   = l_l2_ecc_w_lat_scanout   ;
assign priv_action_g_w_lat_scanin = l_sbdl_ecc_w_lat_scanout ;
assign precise_perf_trap_g_w_lat_scanin = priv_action_g_w_lat_scanout;
assign ieee_exc_fw_lat_scanin    = precise_perf_trap_g_w_lat_scanout;
assign unfin_fw_lat_scanin       = ieee_exc_fw_lat_scanout  ;
assign idiv0_exc_fw_lat_scanin   = unfin_fw_lat_scanout     ;
assign xir_flush_lat_scanin      = idiv0_exc_fw_lat_scanout ;
assign xir_flush_b_lat_scanin    = xir_flush_lat_scanout    ;
assign pre_desr_f_lat_scanin     = xir_flush_b_lat_scanout  ;
assign desr_f_lat_scanin         = pre_desr_f_lat_scanout   ;
assign desr_s_lat_scanin         = desr_f_lat_scanout       ;
assign eer_err_b_lat_scanin      = desr_s_lat_scanout       ;
assign ade_err_b_lat_scanin      = eer_err_b_lat_scanout    ;
assign l_sbpp_lat_scanin         = ade_err_b_lat_scanout    ;
assign l_sbpp_b_lat_scanin       = l_sbpp_lat_scanout       ;
assign ma_flush_lat_scanin       = l_sbpp_b_lat_scanout     ;
assign ma_flush_b_lat_scanin     = ma_flush_lat_scanout     ;
assign cwq_flush_lat_scanin      = ma_flush_b_lat_scanout   ;
assign cwq_flush_b_lat_scanin    = cwq_flush_lat_scanout    ;
assign mqr_exc_b_lat_scanin      = cwq_flush_b_lat_scanout  ;
assign dqr_exc_b_lat_scanin      = mqr_exc_b_lat_scanout    ;
assign rqr_exc_b_lat_scanin      = dqr_exc_b_lat_scanout    ;
assign ivt_lat_scanin            = rqr_exc_b_lat_scanout    ;
assign ivt_flush_b_lat_scanin    = ivt_lat_scanout          ;
assign iln_exc_b_lat_scanin      = ivt_flush_b_lat_scanout  ;
assign tlz_exc_b_lat_scanin      = iln_exc_b_lat_scanout    ;
assign hst_exc_b_lat_scanin      = tlz_exc_b_lat_scanout    ;
assign no_hold_disrupting_flush_lat_scanin = hst_exc_b_lat_scanout    ;
assign disrupting_flush_pending_tid_dec_b_lat_scanin = no_hold_disrupting_flush_lat_scanout;
assign cdfpw_lat_scanin          = disrupting_flush_pending_tid_dec_b_lat_scanout;
assign disrupting_flush_w_lat_scanin = cdfpw_lat_scanout        ;
assign block_store_w_lat_scanin  = disrupting_flush_w_lat_scanout;
assign bsee_pending_lat_scanin   = block_store_w_lat_scanout;
assign bsee_req_lat_scanin       = bsee_pending_lat_scanout ;
assign bsee_req_w_lat_scanin     = bsee_req_lat_scanout     ;
assign bsee_flush_b_lat_scanin   = bsee_req_w_lat_scanout   ;
assign core_running_lat_scanin   = bsee_flush_b_lat_scanout ;
assign core_running_last_lat_scanin = core_running_lat_scanout ;
assign core_running_status_lat_scanin = core_running_last_lat_scanout;
assign idl_exc_lat_scanin        = core_running_status_lat_scanout;
assign idl_req_lat_scanin        = idl_exc_lat_scanout      ;
assign ssmode_lat_scanin         = idl_req_lat_scanout      ;
assign domode_lat_scanin         = ssmode_lat_scanout       ;
assign ssreq_lat_scanin          = domode_lat_scanout       ;
assign ssr_req_lat_scanin        = ssreq_lat_scanout        ;
assign ever_been_running_lat_scanin = ssr_req_lat_scanout      ;
assign por_req_lat_scanin        = ever_been_running_lat_scanout;
assign xir_req_lat_scanin        = por_req_lat_scanout      ;
assign ftt_req_lat_scanin        = xir_req_lat_scanout      ;
assign ade_req_lat_scanin        = ftt_req_lat_scanout      ;
assign eer_req_lat_scanin        = ade_req_lat_scanout      ;
assign ivt_req_lat_scanin        = eer_req_lat_scanout      ;
assign ma_req_lat_scanin         = ivt_req_lat_scanout      ;
assign cwq_req_lat_scanin        = ma_req_lat_scanout       ;
assign mqr_req_lat_scanin        = cwq_req_lat_scanout      ;
assign dqr_req_lat_scanin        = mqr_req_lat_scanout      ;
assign rqr_req_lat_scanin        = dqr_req_lat_scanout      ;
assign iln_req_lat_scanin        = rqr_req_lat_scanout      ;
assign hst_req_lat_scanin        = iln_req_lat_scanout      ;
assign tlz_req_lat_scanin        = hst_req_lat_scanout      ;
assign ssc_req_lat_scanin        = tlz_req_lat_scanout      ;
assign disrupting_ssc_exc_lat_scanin = ssc_req_lat_scanout      ;
assign hw_tw_enabled_lat_scanin  = disrupting_ssc_exc_lat_scanout;
assign load_i_tag_access_lat_scanin = hw_tw_enabled_lat_scanout;
assign load_d_tag_access_lat_scanin = load_i_tag_access_lat_scanout;
assign m103663_lat_scanin        = load_d_tag_access_lat_scanout;
assign refetch_w_lat_scanin      = m103663_lat_scanout      ;
assign pc_valid_lat_scanin       = refetch_w_lat_scanout    ;
assign npc_valid_lat_scanin      = pc_valid_lat_scanout     ;
assign pc_is_npc_lat_scanin      = npc_valid_lat_scanout    ;
assign debug_event_lat_scanin    = pc_is_npc_lat_scanout    ;
assign softstop_req_lat_scanin   = debug_event_lat_scanout  ;
assign hardstop_req_lat_scanin   = softstop_req_lat_scanout ;
assign pulse_req_lat_scanin      = hardstop_req_lat_scanout ;
assign instr_cmt_grp_lat_scanin  = pulse_req_lat_scanout    ;
assign spares_scanin             = instr_cmt_grp_lat_scanout;
assign scan_out                  = spares_scanout           ;

assign pmqr_exc_lat_wmr_scanin   = wmr_scan_in              ;
assign pdqr_exc_lat_wmr_scanin   = pmqr_exc_lat_wmr_scanout ;
assign prqr_exc_lat_wmr_scanin   = pdqr_exc_lat_wmr_scanout ;
assign ivt_flush_lat_wmr_scanin  = prqr_exc_lat_wmr_scanout ;
assign cwp_lat_wmr_scanin        = ivt_flush_lat_wmr_scanout;
assign wmr_scan_out              = cwp_lat_wmr_scanout      ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tlu_fls_ctl_msff_ctl_macro__width_2 (
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

module tlu_fls_ctl_msff_ctl_macro__width_1 (
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

module tlu_fls_ctl_l1clkhdr_ctl_macro (
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

module tlu_fls_ctl_msff_ctl_macro__width_4 (
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

module tlu_fls_ctl_msff_ctl_macro__width_3 (
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

module tlu_fls_ctl_msff_ctl_macro__width_8 (
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

module tlu_fls_ctl_msff_ctl_macro__width_12 (
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

module tlu_fls_ctl_msff_ctl_macro__scanreverse_1__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [0:14] so;

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
.si({so[0:14],scan_in}),
.so({scan_out,so[0:14]}),
.q(dout[15:0])
);












endmodule








