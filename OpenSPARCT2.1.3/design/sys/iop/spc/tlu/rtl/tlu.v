// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu.v
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
module tlu (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  hver_mask_minor_rev, 
  spc_aclk_wmr, 
  lb_scan_en_wmr, 
  wmr_scan_in, 
  tcu_wmr_vec_mask, 
  cmp_tick_enable, 
  lsu_asi_clken, 
  lsu_tlu_pmen, 
  mbi_tsa0_write_en, 
  mbi_tsa1_write_en, 
  mbi_tca_write_en, 
  mbi_addr, 
  mbi_run, 
  mbi_wdata, 
  mbi_tsa0_read_en, 
  mbi_tsa1_read_en, 
  mbi_tca_read_en, 
  mbi_tlu_cmpsel, 
  tcu_shscan_pce_ov, 
  tcu_shscan_clk_stop, 
  tcu_shscan_aclk, 
  tcu_shscan_bclk, 
  tcu_shscan_scan_in, 
  tcu_shscan_scan_en, 
  tcu_shscanid, 
  tcu_core_running, 
  tcu_ss_mode, 
  tcu_do_mode, 
  tcu_ss_request, 
  ftu_ifu_quiesce, 
  pku_quiesce, 
  ftu_excp_way_d, 
  ftu_excp_tid_d, 
  ftu_excp_way_valid_d, 
  dec_inst0_cnt, 
  dec_inst1_cnt, 
  dec_raw_pick_p, 
  dec_tid0_m, 
  dec_tid1_m, 
  dec_inst_valid_m, 
  dec_lsu_inst_m, 
  dec_fgu_inst_m, 
  dec_illegal_inst_m, 
  dec_exc0_m, 
  dec_exc1_m, 
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
  exu0_ecc_addr_m, 
  exu1_ecc_addr_m, 
  exu0_ecc_check_m, 
  exu1_ecc_check_m, 
  exu_oor_va_m, 
  exu_misalign_m, 
  exu_spill_b, 
  exu_fill_m, 
  exu_normal_b, 
  exu_cleanwin_b, 
  exu0_wstate_b, 
  exu1_wstate_b, 
  exu0_ccr0, 
  exu0_ccr1, 
  exu0_ccr2, 
  exu0_ccr3, 
  exu1_ccr0, 
  exu1_ccr1, 
  exu1_ccr2, 
  exu1_ccr3, 
  exu0_cwp0, 
  exu0_cwp1, 
  exu0_cwp2, 
  exu0_cwp3, 
  exu1_cwp0, 
  exu1_cwp1, 
  exu1_cwp2, 
  exu1_cwp3, 
  exu0_trap_number_b, 
  exu1_trap_number_b, 
  exu_tlu_window_block, 
  exu_address0_e, 
  exu_address1_e, 
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
  lsu_tlb_bypass_b, 
  lsu_tlb_real_b, 
  lsu_sync_inst_b, 
  lsu_stb_empty, 
  lsu_tlu_twocycle_m, 
  lsu_block_store_b, 
  lsu_dcmh_err_g, 
  lsu_dcvp_err_g, 
  lsu_dctp_err_g, 
  lsu_dcdp_err_g, 
  lsu_dcl2c_err_g, 
  lsu_dcl2u_err_g, 
  lsu_dcl2nd_err_g, 
  lsu_dcsoc_err_g, 
  lsu_dcerr_tid_g, 
  lsu_dcerr_sfar_g, 
  lsu_sbdlc_err_g, 
  lsu_sbdlu_err_g, 
  lsu_sbdpc_err_g, 
  lsu_sbdpu_err_g, 
  lsu_sbapp_err_g, 
  lsu_sbdiou_err_g, 
  lsu_stberr_tid_g, 
  lsu_stberr_index_g, 
  lsu_stberr_priv_g, 
  lsu_stb_flush_g, 
  lsu_dttp_err_b, 
  lsu_dtdp_err_b, 
  lsu_dtmh_err_b, 
  lsu_perfmon_trap_b, 
  lsu_perfmon_trap_g, 
  lsu_va_b, 
  lsu_ext_interrupt, 
  lsu_ext_int_type, 
  lsu_ext_int_vec, 
  lsu_ext_int_tid, 
  l15_spc_data1, 
  l15_spc_cpkt, 
  l15_spc_valid, 
  lsu_asi_error_inject, 
  lsu_rngf_cdbus, 
  fgu_pdist_beat2_fx1, 
  fgu_predict_fx2, 
  fgu_cecc_fx2, 
  fgu_uecc_fx2, 
  fgu_ecc_addr_fx2, 
  fgu_ecc_check_fx2, 
  fgu_fpx_ieee_trap_fw, 
  fgu_fpd_ieee_trap_fw, 
  fgu_fpx_unfin_fw, 
  fgu_fpx_trap_tid_fw, 
  fgu_fpd_unfin_fw, 
  fgu_fpd_idiv0_trap_fw, 
  fgu_fpd_trap_tid_fw, 
  mmu_hw_tw_enable, 
  mmu_write_itlb, 
  mmu_reload_done, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  mmu_itte_tag_data, 
  mmu_asi_data, 
  mmu_asi_read, 
  mmu_dae_req, 
  mmu_dae_tid, 
  mmu_asi_cecc, 
  mmu_asi_uecc, 
  mmu_asi_tid, 
  mmu_asi_index, 
  mmu_asi_mra_not_sca, 
  mmu_i_l2cerr, 
  mmu_d_l2cerr, 
  mmu_i_eccerr, 
  mmu_d_eccerr, 
  mmu_thr0_err_type, 
  mmu_thr1_err_type, 
  mmu_thr2_err_type, 
  mmu_thr3_err_type, 
  mmu_thr4_err_type, 
  mmu_thr5_err_type, 
  mmu_thr6_err_type, 
  mmu_thr7_err_type, 
  mmu_thr0_err_index, 
  mmu_thr1_err_index, 
  mmu_thr2_err_index, 
  mmu_thr3_err_index, 
  mmu_thr4_err_index, 
  mmu_thr5_err_index, 
  mmu_thr6_err_index, 
  mmu_thr7_err_index, 
  spu_pmu_ma_busy, 
  spu_tlu_cwq_busy, 
  spu_tlu_mamu_err_req, 
  spu_tlu_ma_int_req, 
  spu_tlu_cwq_int_req, 
  spu_tlu_l2_error, 
  pmu_tlu_trap_m, 
  pmu_tlu_debug_event, 
  scan_out, 
  wmr_scan_out, 
  spc_shscan_scan_out, 
  tlu_core_running_status, 
  tlu_ss_complete, 
  tlu_hardstop_request, 
  tlu_softstop_request, 
  tlu_trigger_pulse, 
  tlu_dbg_instr_cmt_grp0, 
  tlu_dbg_instr_cmt_grp1, 
  tlu_flush_ifu, 
  tlu_window_block, 
  tlu_retry_state, 
  tlu_halted, 
  tlu_pc_0_d, 
  tlu_pc_1_d, 
  tlu_flush_exu_b, 
  tlu_ccr_0, 
  tlu_ccr_1, 
  tlu_cwp_0, 
  tlu_cwp_1, 
  tlu_ccr_cwp_0_valid, 
  tlu_ccr_cwp_1_valid, 
  tlu_ccr_cwp_0_tid, 
  tlu_ccr_cwp_1_tid, 
  tlu_gl0, 
  tlu_gl1, 
  tlu_gl2, 
  tlu_gl3, 
  tlu_gl4, 
  tlu_gl5, 
  tlu_gl6, 
  tlu_gl7, 
  tlu_itlb_bypass_e, 
  tlu_flush_lsu_b, 
  tlu_flush_fgu_b, 
  tlu_trap_pc_0, 
  tlu_trap_pc_0_valid, 
  tlu_trap_0_tid, 
  tlu_trap_pc_1, 
  tlu_trap_pc_1_valid, 
  tlu_trap_1_tid, 
  tlu_retry, 
  tlu_ifu_invalidate, 
  tlu_itlb_reload, 
  tlu_itlb_bypass, 
  tlu_release_tte, 
  tlu_rngf_cdbus, 
  tlu_rngf_cdbus_error, 
  tlu_asi_0, 
  tlu_asi_1, 
  tlu_asi_0_valid, 
  tlu_asi_1_valid, 
  tlu_asi_0_tid, 
  tlu_asi_1_tid, 
  tlu_tl_gt_0, 
  tlu_lsu_clear_ctl_reg_, 
  tlu_load_i_tag_access_p, 
  tlu_load_i_tag_access_n, 
  tlu_load_d_tag_access, 
  tlu_load_d_tag_access_r, 
  tlu_npc_w, 
  tlu_pc_0_w, 
  tlu_pc_1_w, 
  tlu_iht_request, 
  tlu_dht_request, 
  tlu_mmu_tl_gt_0, 
  tlu_flush_pmu_b, 
  tlu_flush_pmu_w, 
  tlu_pmu_trap_taken, 
  tlu_pmu_trap_mask_e, 
  tlu_lsu_hpstate_hpriv, 
  tlu_lsu_pstate_priv, 
  tlu_ifu_hpstate_hpriv, 
  tlu_ifu_pstate_priv, 
  tlu_pmu_hpstate_hpriv, 
  tlu_pmu_pstate_priv, 
  tlu_dec_hpstate_hpriv, 
  tlu_dec_pstate_priv, 
  tlu_dec_pstate_pef, 
  tlu_pstate_cle, 
  tlu_pstate_am, 
  tlu_cerer_ittp, 
  tlu_cerer_itdp, 
  tlu_cerer_ittm, 
  tlu_cerer_hwtwmu, 
  tlu_cerer_hwtwl2, 
  tlu_cerer_icl2c, 
  tlu_cerer_icl2u, 
  tlu_cerer_icl2nd, 
  tlu_cerer_irf, 
  tlu_cerer_frf, 
  tlu_cerer_dttp, 
  tlu_cerer_dttm, 
  tlu_cerer_dtdp, 
  tlu_cerer_dcl2c, 
  tlu_cerer_dcl2u, 
  tlu_cerer_dcl2nd, 
  tlu_cerer_sbdlc, 
  tlu_cerer_sbdlu, 
  tlu_cerer_mrau, 
  tlu_cerer_scac, 
  tlu_cerer_scau, 
  tlu_cerer_sbapp, 
  tlu_cerer_l2c_socc, 
  tlu_cerer_l2u_socu, 
  tlu_cerer_icvp, 
  tlu_cerer_ictp, 
  tlu_cerer_ictm, 
  tlu_cerer_icdp, 
  tlu_cerer_dcvp, 
  tlu_cerer_dctp, 
  tlu_cerer_dctm, 
  tlu_cerer_dcdp, 
  tlu_cerer_sbdpc, 
  tlu_cerer_sbdpu, 
  tlu_cerer_mamu, 
  tlu_cerer_mal2c, 
  tlu_cerer_mal2u, 
  tlu_cerer_mal2nd, 
  tlu_cerer_cwql2c, 
  tlu_cerer_cwql2u, 
  tlu_cerer_cwql2nd, 
  tlu_cerer_sbdiou, 
  tlu_ceter_pscce, 
  tlu_tag_access_tid_0_b, 
  tlu_i_tag_access_0_b, 
  tlu_d_tag_access_0_b, 
  tlu_tag_access_tid_1_b, 
  tlu_i_tag_access_1_b, 
  tlu_d_tag_access_1_b, 
  tlu_mbi_tsa0_fail, 
  tlu_mbi_tsa1_fail, 
  tlu_mbi_tca_fail, 
  tlu_spec_enable);
wire [30:8] error_inject_unused;
wire rd_pce;
wire wr_pce;
wire bist_clk_mux_sel;
wire tcu_scan_en_wmr;
wire fls0_wmr_scanin;
wire fls0_wmr_scanout;
wire fls0_scanin;
wire fls0_scanout;
wire trl0_shscanid_2;
wire [1:0] trl0_shscanid;
wire [7:0] cxi_xir;
wire [7:0] cxi_ivt;
wire [7:0] asi_spec_enable;
wire [7:0] asi_immu_enable;
wire [7:0] asi_irl_cleared;
wire [7:0] asi_halt;
wire [7:0] asi_clear_spu_trap_req;
wire [7:0] tel_tsacu_exc;
wire [1:0] pct0_iaw_exc_e;
wire [3:2] pct_npc_0_w;
wire [3:2] pct_npc_1_w;
wire [3:2] pct_npc_2_w;
wire [3:2] pct_npc_3_w;
wire [1:0] pct_pc_oor_va_e;
wire [7:0] trl_tl_eq_0;
wire [7:0] trl_pil_mask_15;
wire [7:0] trl_iln_exc;
wire [7:0] trl_hstick_match;
wire [7:0] trl_unhalt_;
wire [7:0] trl_tlz_exc;
wire [7:0] trl_nns_exc;
wire [7:0] trl_ssc_exc;
wire [7:0] trl_invalidate_pc;
wire [7:0] trl_invalidate_npc;
wire [7:0] trl_pc_sel_trap_pc;
wire [7:0] trl_fls_npc_en;
wire [7:0] trl_trap_taken;
wire trl0_take_sma;
wire trl0_take_cwq;
wire trl0_take_xir;
wire trl0_take_ftt;
wire [7:0] trl_core_running_status;
wire [4:0] trl0_tsa_wr_addr;
wire [7:0] tlu_ceter_de;
wire [7:0] tlu_ceter_dhcce;
wire [7:0] tsd_hpstate_ibe;
wire [7:0] tsd_hpstate_hpriv;
wire [7:0] tsd_hpstate_red;
wire [7:0] tsd_pstate_tct;
wire [7:0] tsd_pstate_priv;
wire [7:0] tsd_pstate_ie;
wire [7:0] tsd_pstate_am;
wire [7:0] tsd_itlb_bypass;
wire tsd0_mrqr_exc_;
wire tsd0_dqr_exc_;
wire [7:0] asi_check_qr_exc;
wire [7:0] dfd_fls_desr_f;
wire [7:0] dfd_fls_desr_s;
wire [7:0] ras_precise_error;
wire [7:0] ras_disrupting_error;
wire [7:0] ras_deferred_error;
wire fls0_spc_hardstop_request;
wire fls0_spc_softstop_request;
wire fls0_spc_trigger_pulse;
wire tlu_flush_lsu_b_unused;
wire tlu_flush_fgu_b_unused;
wire fls0_flush_lsu_b;
wire fls0_flush_fgu_b;
wire [1:0] fls0_tid_d;
wire [3:0] fls0_tid_dec_b;
wire [3:0] fls0_tid_dec_w;
wire [7:0] fls_pc_sel_npc;
wire [7:0] fls_pc_sel_npc_plus_4;
wire [7:0] fls_npc_sel_npc_plus_4;
wire [7:0] fls_npc_sel_npc_plus_8;
wire [7:0] fls_npc_sel_target;
wire fls0_npc_b_sel_npc;
wire fls0_pc_is_npc;
wire [1:0] fls_pstate_am_d_;
wire [1:0] fls_pstate_am_b_;
wire [1:0] fls_pstate_am_w_;
wire fls0_lsu_inst_w_unused;
wire fls0_dfd_lsu_inst_b;
wire [2:0] fls_wstate0;
wire [2:0] fls_wstate1;
wire [2:0] fls_wstate2;
wire [2:0] fls_wstate3;
wire [7:0] fls_tcc_number_0;
wire [7:0] fls_tcc_number_1;
wire [7:0] fls_tcc_number_2;
wire [7:0] fls_tcc_number_3;
wire [7:0] fls_tid_dec_w_in;
wire [7:0] fls_por_request;
wire [7:0] fls_xir_request;
wire [7:0] fls_ivt_request;
wire [7:0] fls_sir_request;
wire [7:0] fls_itm_request;
wire [7:0] fls_iln_request;
wire [7:0] fls_hst_request;
wire [7:0] fls_tlz_request;
wire [7:0] fls_sma_request;
wire [7:0] fls_cwq_request;
wire [7:0] fls_ade_request;
wire [7:0] fls_iae_request;
wire [7:0] fls_ipe_request;
wire [1:0] fls_ipv_request;
wire [1:0] fls_inp_request;
wire [1:0] fls_iar_request;
wire [1:0] fls_irr_request;
wire [1:0] fls_mar_request;
wire [1:0] fls_mrr_request;
wire [1:0] fls_pro_request;
wire [1:0] fls_ill_request;
wire [1:0] fls_don_request;
wire [1:0] fls_ret_request;
wire [1:0] fls_fpd_request;
wire [1:0] fls_snn_request;
wire [1:0] fls_sno_request;
wire [1:0] fls_fnn_request;
wire [1:0] fls_fno_request;
wire [1:0] fls_clw_request;
wire [7:0] fls_dtm_request;
wire [1:0] fls_ldf_request;
wire [1:0] fls_stf_request;
wire [1:0] fls_dap_request;
wire [1:0] fls_vaw_request;
wire [1:0] fls_iaw_request;
wire [1:0] fls_paw_request;
wire [1:0] fls_maa_request;
wire [1:0] fls_fpe_request;
wire [7:0] fls_fei_request;
wire [7:0] fls_fof_request;
wire [7:0] fls_pra_request;
wire [1:0] fls_dia_request;
wire [7:0] fls_ups_request;
wire [1:0] fls_dpv_request;
wire [1:0] fls_dnc_request;
wire [1:0] fls_dnf_request;
wire [1:0] fls_dso_request;
wire [1:0] fls_tof_request;
wire [7:0] fls_dbz_request;
wire [1:0] fls_tcc_request;
wire [7:0] fls_dae_request;
wire [7:0] fls_lsr_request;
wire [1:0] fls_irt_request;
wire [1:0] fls_drt_request;
wire [7:0] fls_pmu_request;
wire [7:0] fls_mqr_request;
wire [7:0] fls_dqr_request;
wire [7:0] fls_rqr_request;
wire [7:0] fls_idl_request;
wire [7:0] fls_res_request;
wire [7:0] fls_ssr_request;
wire [7:0] fls_ssc_request;
wire [7:0] fls_nns_request;
wire [7:0] fls_ime_request;
wire [7:0] fls_dme_request;
wire [7:0] fls_eer_request;
wire [1:0] fls_icp_request;
wire [7:0] fls_ftt_request;
wire [1:0] fls_ibp_request;
wire [1:0] fls_tct_request;
wire [1:0] fls_ref_request;
wire [1:0] fls_ipe_dme_request;
wire [7:0] fls_pc_valid;
wire [7:0] fls_load_dsfar;
wire [1:0] fls_irf_cecc_b;
wire [1:0] fls_irf_uecc_b;
wire [1:0] fls_kill_irf_ecc_w;
wire [2:0] fls0_cwp0;
wire [2:0] fls0_cwp1;
wire [2:0] fls0_cwp2;
wire [2:0] fls0_cwp3;
wire [7:0] fls_core_running;
wire fls_ss_request;
wire [7:0] fls_pct_pc_en;
wire [7:0] fls_pct_npc_en;
wire [7:0] fls_trl_l1en;
wire [4:2] fls0_npc_if_cnt_eq_1_d;
wire [4:2] fls0_npc_if_cnt_eq_2_d;
wire [4:2] fls0_npc_if_cnt_eq_3_d;
wire [7:0] fls_flush;
wire [1:0] fls_disrupting_flush_w;
wire fls_f_cecc_w;
wire fls_f_uecc_w;
wire [1:0] fls_ss_update_pc_w;
wire fls1_wmr_scanin;
wire fls1_wmr_scanout;
wire fls1_scanin;
wire fls1_scanout;
wire trl1_shscanid_2;
wire [1:0] trl1_shscanid;
wire [1:0] pct1_iaw_exc_e;
wire [3:2] pct_npc_4_w;
wire [3:2] pct_npc_5_w;
wire [3:2] pct_npc_6_w;
wire [3:2] pct_npc_7_w;
wire trl1_take_sma;
wire trl1_take_cwq;
wire trl1_take_xir;
wire trl1_take_ftt;
wire [4:0] trl1_tsa_wr_addr;
wire tsd1_mrqr_exc_;
wire tsd1_dqr_exc_;
wire fls1_spc_hardstop_request;
wire fls1_spc_softstop_request;
wire fls1_spc_trigger_pulse;
wire fls1_flush_lsu_b_unused;
wire fls1_flush_fgu_b_unused;
wire [1:0] fls1_tid_d;
wire [3:0] fls1_tid_dec_b;
wire [3:0] fls1_tid_dec_w;
wire fls1_npc_b_sel_npc;
wire fls1_pc_is_npc;
wire fls1_lsu_inst_w;
wire fls1_dfd_lsu_inst_b;
wire [2:0] fls_wstate4;
wire [2:0] fls_wstate5;
wire [2:0] fls_wstate6;
wire [2:0] fls_wstate7;
wire [7:0] fls_tcc_number_4;
wire [7:0] fls_tcc_number_5;
wire [7:0] fls_tcc_number_6;
wire [7:0] fls_tcc_number_7;
wire [2:0] fls1_cwp0;
wire [2:0] fls1_cwp1;
wire [2:0] fls1_cwp2;
wire [2:0] fls1_cwp3;
wire fls_ss_request_unused;
wire [4:2] fls1_npc_if_cnt_eq_1_d;
wire [4:2] fls1_npc_if_cnt_eq_2_d;
wire [4:2] fls1_npc_if_cnt_eq_3_d;
wire fls_f_cecc_w_unused;
wire fls_f_uecc_w_unused;
wire pct0_wmr_scanin;
wire pct0_wmr_scanout;
wire pct0_scanin;
wire pct0_scanout;
wire [47:2] tic_exu_address0_m;
wire [7:0] asi_rd_pc;
wire [1:0] asi_wr_iaw;
wire [63:0] asi_wr_data_0;
wire [7:0] trl_npc_sel_trap_npc;
wire [7:0] trl_npc_sel_tnpc;
wire [8:0] trl0_trap_type;
wire [3:0] trl0_pc_thread_sel;
wire [1:0] trl_pc_pstate_am_;
wire [1:0] trl_pc_sel_pc;
wire [1:0] trl_pc_sel_npc;
wire [1:0] trl_pc_sel_trap;
wire [1:0] trl_pc_sel_reset;
wire [1:0] trl_pc_done;
wire [1:0] trl_pc_retry;
wire [1:0] trl_pc_tte;
wire [1:0] trl_pct_trap_pc_en;
wire [1:0] trl_pct_tnpc_en;
wire [47:14] tsd0_tba;
wire [47:2] tsd0_tpc;
wire [1:0] tsd_tpc_oor_va;
wire [47:2] tsd0_tnpc;
wire [1:0] tsd_tnpc_oor_va;
wire [1:0] tsd_tnpc_nonseq;
wire [47:2] tsd0_asi_data_;
wire [48:2] pct0_asi_data;
wire [47:2] pct0_tsa_pc;
wire [1:0] pct_tsa_pc_oor_va;
wire [47:2] pct0_tsa_npc;
wire [1:0] pct_tsa_npc_oor_va;
wire [1:0] pct_tsa_npc_nonseq;
wire [7:0] pct_npc_is_nonseq;
wire [47:2] pct0_shadow_pc_d;
wire [47:2] pct0_npc_w;
wire [47:2] pct0_target_b;
wire [16:0] pct0_trl_wr_data;
wire [10:5] tsd_pc_0_w;
wire [47:2] tlu_pc_0_prebuf_d;
wire pct1_wmr_scanin;
wire pct1_wmr_scanout;
wire pct1_scanin;
wire pct1_scanout;
wire [47:2] tic_exu_address1_m;
wire [62:0] asi_wr_data_1;
wire [8:0] trl1_trap_type;
wire [3:0] trl1_pc_thread_sel;
wire [47:14] tsd1_tba;
wire [47:2] tsd1_tpc;
wire [47:2] tsd1_tnpc;
wire [47:2] tsd1_asi_data_;
wire [48:2] pct1_asi_data;
wire [47:2] pct1_tsa_pc;
wire [47:2] pct1_tsa_npc;
wire [47:2] pct1_shadow_pc_d;
wire [47:2] pct1_npc_w;
wire [47:2] pct1_target_b;
wire [16:0] pct1_trl_wr_data;
wire [10:5] tsd_pc_1_w;
wire cxi_scanin;
wire cxi_scanout;
wire [13:1] l15_spc_cpkt_unused;
wire [13:6] l15_spc_data1_unused;
wire cth_wmr_scanin;
wire cth_wmr_scanout;
wire cth_scanin;
wire cth_scanout;
wire trl0_wmr_scanin;
wire trl0_wmr_scanout;
wire trl0_scanin;
wire trl0_scanout;
wire trl1_itw_last;
wire [1:0] tsa0_gl;
wire [1:0] tsa_tnpc_nonseq;
wire [7:0] tsd_hpstate_tlz;
wire [1:0] tsd_htstate_hpriv;
wire [7:0] asi_rd_tl;
wire [7:0] asi_wr_tl;
wire [7:0] asi_rd_pil;
wire [7:0] asi_wr_pil;
wire [7:0] asi_rd_gl;
wire [7:0] asi_wr_gl;
wire [7:0] asi_wr_set_softint;
wire [7:0] asi_wr_clear_softint;
wire [7:0] asi_rd_softint;
wire [7:0] asi_wr_softint;
wire [7:0] asi_rd_hintp;
wire [7:0] asi_wr_hintp;
wire [1:0] asi_preempt_trap;
wire [1:0] asi_preempt_done_retry;
wire [1:0] asi_rmw_tsa;
wire [7:0] asi_wr_asireg;
wire [1:0] asi_trl_pstate_en;
wire [1:0] asi_mbist_tsa_rd_en;
wire [1:0] asi_mbist_tsa_wr_en;
wire [8:0] trl0_tsa_trap_type;
wire [4:0] trl0_asireg_sel;
wire trl0_asireg_en;
wire [3:0] trl0_thread_sel;
wire [2:0] trl0_tba_sel;
wire [4:0] trl0_pstate_thread_sel;
wire [3:0] trl0_don_ret_pstate_sel;
wire trl0_pstate_en;
wire [1:0] trl_reset_trap;
wire [1:0] trl_other_trap;
wire [1:0] trl_stay_in_priv;
wire [1:0] trl_tsa_wr_en_pre;
wire [1:0] trl_tsa_rd_en;
wire [4:0] trl0_tsa_rd_addr;
wire trl0_save_tsa;
wire trl0_tsd_tsa_en;
wire trl0_tsd_tsa_wd_en;
wire trl0_capture_ss;
wire trl0_rmw_tsa;
wire [1:0] trl_tl_gt_0;
wire [1:0] trl0_tsa_gl;
wire [16:0] trl0_asi_data;
wire [7:0] trl_ss_complete;
wire trl0_itw_wait;
wire trl0_itw_last;
wire [2:0] trl0_shadow_tl;
wire [2:0] trl0_tl_for_tt;
wire [1:0] trl_tel_en;
wire [1:0] trl_gl0;
wire [1:0] trl_gl1;
wire [1:0] trl_gl2;
wire [1:0] trl_gl3;
wire [7:0] trl_tsacu_en_in;
wire [2:0] tlu_tsa_index_0;
wire [7:0] tlu_tccd;
wire [7:0] tlu_tcud;
wire [1:0] tlu_tca_index_0;
wire trl1_wmr_scanin;
wire trl1_wmr_scanout;
wire trl1_scanin;
wire trl1_scanout;
wire [1:0] tsa1_gl;
wire [8:0] trl1_tsa_trap_type;
wire [4:0] trl1_asireg_sel;
wire trl1_asireg_en;
wire [3:0] trl1_thread_sel;
wire [2:0] trl1_tba_sel;
wire [4:0] trl1_pstate_thread_sel;
wire [3:0] trl1_don_ret_pstate_sel;
wire trl1_pstate_en;
wire [4:0] trl1_tsa_rd_addr;
wire trl1_save_tsa;
wire trl1_tsd_tsa_en;
wire trl1_tsd_tsa_wd_en;
wire trl1_capture_ss;
wire trl1_rmw_tsa;
wire [1:0] trl1_tsa_gl;
wire [16:0] trl1_asi_data;
wire trl1_itw_wait_unused;
wire [2:0] trl1_shadow_tl;
wire [2:0] trl1_tl_for_tt;
wire [1:0] trl_gl4;
wire [1:0] trl_gl5;
wire [1:0] trl_gl6;
wire [1:0] trl_gl7;
wire [2:0] tlu_tsa_index_1;
wire [1:0] tlu_tca_index_1;
wire [135:0] teg0_data_in;
wire [1:0] tsd_wr_tpc_oor_va;
wire [1:0] tsd_wr_tnpc_oor_va;
wire [1:0] tsd_wr_tnpc_nonseq;
wire [1:0] tsd0_wr_gl;
wire [29:0] tsd0_wr_data;
wire [8:0] tsd0_wr_trap_type;
wire [47:2] tsd0_wr_tpc;
wire [47:2] tsd0_wr_tnpc;
wire [15:0] teg0_ecc;
wire asi_error_tsau;
wire [7:0] asi_mbist_tsa_ecc_in;
wire [15:0] tem0_ecc;
wire tel0_scanin;
wire tel0_scanout;
wire [1:0] asi_mbist_tel_en;
wire [15:0] tsa0_ecc;
wire [15:0] ted0_syndrome;
wire ted00_cecc_err;
wire ted00_uecc_err;
wire ted00_uecc_err_;
wire ted01_cecc_err;
wire ted01_uecc_err;
wire ted01_uecc_err_;
wire [15:0] tel0_syndrome;
wire [15:0] tel0_ecc;
wire [15:0] tel0_crit_ecc;
wire tel0_tsac;
wire tel0_tsau;
wire [7:0] tlu_tsac;
wire [7:0] tlu_tsau;
wire [135:0] tsd0_ted_mra_rd_data;
wire tlu_cerer_tsac;
wire tlu_cerer_tsau;
wire [1:0] asi_tsacu;
wire [135:0] tsb0_data_out;
wire [1:0] trl_tsa_wr_en;
wire tsa0_scanin;
wire tsa0_scanout;
wire [1:0] tsa_tpc_oor_va;
wire [1:0] tsa_tnpc_oor_va;
wire [29:0] tsa0_rd_data;
wire [8:0] tsa0_trap_type;
wire [47:2] tsa0_tpc;
wire [47:2] tsa0_tnpc;
wire [135:0] teg1_data_in;
wire [1:0] tsd1_wr_gl;
wire [29:0] tsd1_wr_data;
wire [8:0] tsd1_wr_trap_type;
wire [47:2] tsd1_wr_tpc;
wire [47:2] tsd1_wr_tnpc;
wire [15:0] teg1_ecc;
wire [15:0] tem1_ecc;
wire tel1_scanin;
wire tel1_scanout;
wire [15:0] tsa1_ecc;
wire [15:0] ted1_syndrome;
wire ted10_cecc_err;
wire ted10_uecc_err;
wire ted10_uecc_err_;
wire ted11_cecc_err;
wire ted11_uecc_err;
wire ted11_uecc_err_;
wire [15:0] tel1_syndrome;
wire [15:0] tel1_ecc;
wire [15:0] tel1_crit_ecc;
wire tel1_tsac;
wire tel1_tsau;
wire [135:0] tsd1_ted_mra_rd_data;
wire [135:0] tsb1_data_out;
wire tsa1_scanin;
wire tsa1_scanout;
wire [29:0] tsa1_rd_data;
wire [8:0] tsa1_trap_type;
wire [47:2] tsa1_tpc;
wire [47:2] tsa1_tnpc;
wire tsd0_wmr_scanin;
wire tsd0_wmr_scanout;
wire tsd0_scanin;
wire tsd0_scanout;
wire [1:0] asi_wr_mondo_head;
wire [1:0] asi_wr_mondo_tail;
wire [1:0] asi_wr_device_head;
wire [1:0] asi_wr_device_tail;
wire [1:0] asi_wr_res_err_head;
wire [1:0] asi_wr_res_err_tail;
wire [1:0] asi_wr_nonres_err_head;
wire [1:0] asi_wr_nonres_err_tail;
wire [1:0] asi_rd_iqr_reg;
wire [1:0] asi_rd_tpc;
wire [1:0] asi_wr_tpc;
wire [1:0] asi_rd_tnpc;
wire [1:0] asi_wr_tnpc;
wire [1:0] asi_rd_tstate;
wire [1:0] asi_wr_tstate;
wire [1:0] asi_rd_tt;
wire [1:0] asi_wr_tt;
wire [1:0] asi_rd_htstate;
wire [1:0] asi_wr_htstate;
wire [7:0] asi_wr_tba;
wire [7:0] asi_wr_pstate;
wire [7:0] asi_wr_hpstate;
wire [7:0] asi_wr_htba;
wire [7:0] asi_rd_asireg;
wire [1:0] asi_rd_tba_htba;
wire [1:0] asi_rd_pstate_hpstate;
wire asi_tsd0_wr_data_12;
wire [10:8] asi_tsd0_wr_data_10_08;
wire [5:0] asi_tsd0_wr_data_05_00;
wire [1:0] tsd0_asi_data;
wire [10:0] tsd0_shadow_pstate;
wire [47:2] tsd0_shadow_tpc;
wire [8:0] tsd0_shadow_tt;
wire [31:0] tsd0_mbist_data;
wire tsd1_wmr_scanin;
wire tsd1_wmr_scanout;
wire tsd1_scanin;
wire tsd1_scanout;
wire asi_tsd1_wr_data_12;
wire [10:8] asi_tsd1_wr_data_10_08;
wire [5:0] asi_tsd1_wr_data_05_00;
wire [1:0] tsd1_asi_data;
wire [10:0] tsd1_shadow_pstate;
wire [47:2] tsd1_shadow_tpc;
wire [8:0] tsd1_shadow_tt;
wire [31:0] tsd1_mbist_data;
wire asi_wmr_scanin;
wire asi_wmr_scanout;
wire asi_scanin;
wire asi_scanout;
wire tic_scanin;
wire tic_scanout;
wire tca_scanin;
wire tca_scanout;
wire [4:0] tic_cmpr_addr;
wire tic_cmpr_rd_en;
wire tic_cmpr_wr_en;
wire [7:0] cem_ecc;
wire asi_tca_wr_data_63;
wire [7:0] tca_ecc;
wire [63:0] tca_cmpr_data_in;
wire cep_scanin;
wire cep_scanout;
wire [63:0] cep_wr_data;
wire [7:0] ceg_ecc;
wire asi_error_tccu;
wire cel_scanin;
wire cel_scanout;
wire [63:0] tic_cmpr_data;
wire [7:0] cel_crit_ecc;
wire [7:0] ced_syndrome;
wire ced_cecc_err;
wire ced_uecc_err;
wire ced_uecc_err__unused;
wire cer_scanin;
wire cer_scanout;
wire ras_wmr_scanin;
wire ras_wmr_scanout;
wire ras_scanin;
wire ras_scanout;
wire [61:0] cth_wr_data;
wire dfd_wmr_scanin;
wire dfd_wmr_scanout;
wire dfd_scanin;
wire dfd_scanout;
wire sse_scanin;
wire sse_scanout;
wire shscan_l2clk;
wire asi_ece_exc;
wire asi_eue_exc;
wire [2:0] asi_ecc_tid;
wire [63:46] asi_decr;
wire asi_rd_iaw;
wire [63:0] cth_irl_cleared;
wire tlu_cerer_l2nd;
wire [7:0] cxi_wr_int_dis;
wire [5:0] cxi_int_dis_vec;
wire cxi_l2_soc_sre;
wire [1:0] cxi_l2_soc_err_type;
wire [2:0] cxi_l2_soc_tid;
wire cxi_l2_err;
wire cxi_soc_err;
wire [7:0] asi_wr_int_rec;
wire [7:0] asi_rd_inc_vec_2;
wire [2:0] asi_int_rec_mux_sel_in;
wire asi_rd_int_rec;
wire asi_rd_inc_vec;
wire asi_wr_any_int_rec;
wire asi_rd_stage_1;
wire [47:0] dfd_asi_data;
wire [18:0] dfd_asi_desr;
wire [63:0] cth_asi_data;
wire [4:0] tic_addr;
wire tic_not_valid;
wire tic_match;
wire cel_tccd;
wire cel_tcud;
wire [4:0] asi_tsa_rd_addr;
wire asi_tsa_rd_iqr_ecc;
wire [1:0] asi_tsa_tid;
wire [4:0] asi_mbist_addr;
wire [7:0] asi_error_mask;
wire asi_mbist_run;
wire [2:0] asi_rd_iqr;
wire [2:0] asi_rd_h_pstate_tba;
wire [47:0] asi_tsa_wr_data;
wire asi_tsa_wr_data_npc_oor_va;
wire asi_tsa_wr_data_npc_nonseq;
wire [7:0] asi_mbist_ecc_in;
wire [3:0] asi_mbist_cmpsel;
wire mbd_compare;
wire [63:0] tic_asi_data;
wire [7:0] cel_ecc;
wire [63:0] cer_asi_data;
wire cel_tccp;
wire cel_tcup;
wire [7:0] dfd_desr_f;
wire [7:0] dfd_fesr_f;
wire asi_rd_tick;
wire asi_wr_tick;
wire [4:0] asi_tca_addr;
wire asi_tca_addr_valid;
wire asi_tca_wr;
wire asi_rd_cerer;
wire asi_rd_ceter;
wire asi_wr_cerer;
wire [2:0] asi_ceter_tid;
wire asi_wr_ceter;
wire [2:0] asi_rd_tid;
wire asi_rd_isfsr;
wire asi_rd_dsfsr;
wire asi_rd_dsfar;
wire asi_rd_desr;
wire asi_rd_fesr;
wire [7:0] asi_wr_isfsr;
wire [7:0] asi_wr_dsfsr;
wire [7:0] asi_wr_dsfar;
wire asi_tsac;
wire asi_tsau;
wire [2:0] asi_tsacu_tid;
wire asi_stg1_en;
wire [7:0] asi_mbd_compare_data;
wire asi_mbd_sel_tsd0;
wire asi_mbd_sel_tsd1;
wire asi_mbd_sel_tic;
wire asi_tccup_in;
wire asi_tccud_in;
wire [2:0] tlu_tca_tid;
wire [1:0] tlu_tca_index;
wire [31:0] tic_mbist_data;
wire [1:0] tic_exu_address0_b;
wire [1:0] tic_exu_address1_b;
wire tlu_cerer_tccp;
wire tlu_cerer_tcup;
wire tlu_cerer_tccd;
wire tlu_cerer_tcud;
wire [7:0] cel_syndrome;
wire [7:0] dfd_desr_s;
wire [1:0] dfd_fesr_priv_0;
wire [1:0] dfd_fesr_priv_1;
wire [1:0] dfd_fesr_priv_2;
wire [1:0] dfd_fesr_priv_3;
wire [1:0] dfd_fesr_priv_4;
wire [1:0] dfd_fesr_priv_5;
wire [1:0] dfd_fesr_priv_6;
wire [1:0] dfd_fesr_priv_7;
wire [3:0] ras_asi_data;
wire [19:0] ras_dsfar_0;
wire [19:0] ras_dsfar_1;
wire [19:0] ras_dsfar_2;
wire [19:0] ras_dsfar_3;
wire [19:0] ras_dsfar_4;
wire [19:0] ras_dsfar_5;
wire [19:0] ras_dsfar_6;
wire [19:0] ras_dsfar_7;
wire [7:0] ras_dsfar_sel_lsu_va;
wire [7:0] ras_dsfar_sel_ras;
wire [7:0] ras_dsfar_sel_tsa;
wire [7:0] ras_rd_dsfar;
wire [61:56] ras_desr_et_0;
wire [61:56] ras_desr_et_1;
wire [61:56] ras_desr_et_2;
wire [61:56] ras_desr_et_3;
wire [61:56] ras_desr_et_4;
wire [61:56] ras_desr_et_5;
wire [61:56] ras_desr_et_6;
wire [61:56] ras_desr_et_7;
wire [10:0] ras_desr_ea_0;
wire [10:0] ras_desr_ea_1;
wire [10:0] ras_desr_ea_2;
wire [10:0] ras_desr_ea_3;
wire [10:0] ras_desr_ea_4;
wire [10:0] ras_desr_ea_5;
wire [10:0] ras_desr_ea_6;
wire [10:0] ras_desr_ea_7;
wire ras_desr_me_0;
wire ras_desr_me_1;
wire ras_desr_me_2;
wire ras_desr_me_3;
wire ras_desr_me_4;
wire ras_desr_me_5;
wire ras_desr_me_6;
wire ras_desr_me_7;
wire [7:0] ras_desr_en;
wire [7:0] ras_write_desr_1st;
wire [7:0] ras_write_desr_2nd;
wire [7:0] ras_rd_desr;
wire [61:60] ras_fesr_et_0;
wire [61:60] ras_fesr_et_1;
wire [61:60] ras_fesr_et_2;
wire [61:60] ras_fesr_et_3;
wire [61:60] ras_fesr_et_4;
wire [61:60] ras_fesr_et_5;
wire [61:60] ras_fesr_et_6;
wire [61:60] ras_fesr_et_7;
wire [59:55] ras_fesr_ea_0;
wire [59:55] ras_fesr_ea_1;
wire [59:55] ras_fesr_ea_2;
wire [59:55] ras_fesr_ea_3;
wire [59:55] ras_fesr_ea_4;
wire [59:55] ras_fesr_ea_5;
wire [59:55] ras_fesr_ea_6;
wire [59:55] ras_fesr_ea_7;
wire [7:0] ras_fesr_en;
wire [7:0] ras_write_fesr;
wire [59:58] ras_fesr_priv;
wire [7:0] ras_update_priv;
wire [7:0] ras_rd_fesr;
wire sse_shscan_clk_stop;
wire [47:2] sse_shadow_pc;




input		l2clk;		
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;
input		tcu_muxtest;
input		tcu_array_wr_inhibit;
input		tcu_se_scancollar_in;

input	[3:0]	hver_mask_minor_rev;	// Input to spc for easy metal change

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		lb_scan_en_wmr;
input		wmr_scan_in;

// RSTVADDR (POR address) control
input 		tcu_wmr_vec_mask;

// TICK register enable
input 		cmp_tick_enable;

input		lsu_asi_clken;		// Power management
input		lsu_tlu_pmen;		// Power management

// MBIST
input		mbi_tsa0_write_en;	// MBIST write control
input		mbi_tsa1_write_en;	// MBIST write control
input		mbi_tca_write_en;	// MBIST write control
input	[4:0]	mbi_addr;		// 32 entry addressability for MBIST
input		mbi_run;		// Select MBIST controls
input	[7:0]	mbi_wdata;		// MBIST write data
input		mbi_tsa0_read_en;	// MBIST read control
input		mbi_tsa1_read_en;	// MBIST read control
input		mbi_tca_read_en;	// MBIST read control
input	[3:0]	mbi_tlu_cmpsel;		// Mux (NPE) between 32 bit chunks 

input		tcu_shscan_pce_ov;	// Shadow scan controls
input		tcu_shscan_clk_stop;
input		tcu_shscan_aclk;
input		tcu_shscan_bclk;
input		tcu_shscan_scan_in;
input		tcu_shscan_scan_en;
input	[2:0]	tcu_shscanid;		// Select which thread to shadow

input	[7:0]	tcu_core_running;
input		tcu_ss_mode;		// Core is in single step mode
input		tcu_do_mode;		// Core is in disable overlap mode
input		tcu_ss_request;		// Enabled threads should single step

input	[7:0]	ftu_ifu_quiesce;
input	[7:0]	pku_quiesce;

input	[2:0]	ftu_excp_way_d;
input	[2:0]	ftu_excp_tid_d;
input		ftu_excp_way_valid_d;

input 	[1:0]	dec_inst0_cnt;		// Count of instructions in E, M, B
input 	[1:0]	dec_inst1_cnt;		// Count of instructions in E, M, B
input	[7:0]	dec_raw_pick_p;		// Decoded TID for instructions at P
input	[1:0]	dec_tid0_m;		// TID for instruction in TG0 at M
input	[1:0]	dec_tid1_m;		// TID for instruction in TG1 at M
input 	[1:0]	dec_inst_valid_m;	// Valid instruction
input 	[1:0]	dec_lsu_inst_m;		// LSU instruction
input 	[1:0]	dec_fgu_inst_m;		// FGU instruction
input	[1:0]	dec_illegal_inst_m;	// Illegal instruction
input	[4:0]	dec_exc0_m;		// Exceptions before the ibuffer
input	[4:0]	dec_exc1_m;		// Exceptions before the ibuffer
input	[1:0]	dec_done_inst_m;	// DONE
input	[1:0]	dec_retry_inst_m;	// RETRY
input	[1:0]	dec_sir_inst_m;		// Software initiated reset
input	[1:0]	dec_hpriv_exc_m;	// Instruction has hyperprivilege exc
input	[1:0]	dec_priv_exc_m;		// Instruction has privilege exc
input	[1:0]	dec_fpdisable_exc_m;	// Floating-point disabled exception
input	[1:0]	dec_br_taken_m;		// Branch in M is taken
input	[1:0]	dec_annul_ds_m;		// Branch in M annuls delay slot
input	[1:0]	dec_ds_m;		// Instruction is in a delay slot
input	[1:0]	dec_icache_perr_m;	// Icache data array had parity error
input	[1:0]	dec_cti_inst_m;
input	[1:0] dec_flush_b;		// Flush instruction in B

input	[1:0]	exu_ibp_m;		// Instruction breakpoint
input	[1:0]	exu_tcc_m;		// Trap on condition codes
input	[1:0]	exu_tof_m;		// Tag overflow (TADccTV, TSUBccTV)
input	[1:0]	exu_cecc_m;		// Correctable ECC error on source
input	[1:0]	exu_uecc_m;		// Uncorrectable ECC error on source
input	[4:0]	exu0_ecc_addr_m;	// Address for ECC error
input	[4:0]	exu1_ecc_addr_m;	// Address for ECC error
input	[7:0]	exu0_ecc_check_m;	// ECC bits
input	[7:0]	exu1_ecc_check_m;	// ECC bits
input	[1:0]	exu_oor_va_m;		// VA is out of range
input	[1:0]	exu_misalign_m;		// Misaligned address for JMPL, RETURN
input	[1:0]	exu_spill_b;
input	[1:0]	exu_fill_m; 
input	[1:0]	exu_normal_b; 
input	[1:0]	exu_cleanwin_b;
input	[2:0]	exu0_wstate_b;  
input	[2:0]	exu1_wstate_b;  
input	[7:0]	exu0_ccr0;
input	[7:0]	exu0_ccr1;
input	[7:0]	exu0_ccr2;
input	[7:0]	exu0_ccr3;
input	[7:0]	exu1_ccr0;
input	[7:0]	exu1_ccr1;
input	[7:0]	exu1_ccr2;
input	[7:0]	exu1_ccr3;
input	[2:0]	exu0_cwp0;
input	[2:0]	exu0_cwp1;
input	[2:0]	exu0_cwp2;
input	[2:0]	exu0_cwp3;
input	[2:0]	exu1_cwp0;
input	[2:0]	exu1_cwp1;
input	[2:0]	exu1_cwp2;
input	[2:0]	exu1_cwp3;
input	[7:0] exu0_trap_number_b;	// Bits 7:0 of the ALU result
input	[7:0] exu1_trap_number_b;
input	[1:0]	exu_tlu_window_block;	// EXU needs hole for CWP change
input	[47:0]	exu_address0_e;		// Target address for branch in TG0
input	[47:0]	exu_address1_e;		// Target address for branch in TG1

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
input	[7:0]	lsu_trap_flush;		// Flush thread and redirect to NPC
input 		lsu_tlb_bypass_b;	// TLB in bypass mode
input 		lsu_tlb_real_b;		// TLB doing RA->PA translation
input 		lsu_sync_inst_b;	// Instruction will get a trap flush
input	[7:0]	lsu_stb_empty;		// Store buffer empty (for entering RED)
input		lsu_tlu_twocycle_m;	// LSU takes extra cycle on this inst
input	[7:0]	lsu_block_store_b;	// LSU reads FRF for block store
input		lsu_dcmh_err_g;		// LSU data cache multiple hit
input		lsu_dcvp_err_g;		// LSU data cache valid parity error
input		lsu_dctp_err_g;		// LSU data cache tag parity error
input		lsu_dcdp_err_g;		// LSU data cache parity error
input		lsu_dcl2c_err_g;	// LSU data cache L2 correctable ECC
input		lsu_dcl2u_err_g;	// LSU data cache L2 uncorrectable ECC
input		lsu_dcl2nd_err_g;	// LSU data cache L2 NotData
input		lsu_dcsoc_err_g;	// LSU data cache SOC error
input	[2:0]	lsu_dcerr_tid_g;	// TID for G stage errors (above)
input	[8:0]	lsu_dcerr_sfar_g;	// DSFAR data for data cache errors
input		lsu_sbdlc_err_g;        // STB RAW error (CE)
input		lsu_sbdlu_err_g;        // STB RAW error (UE)
input		lsu_sbdpc_err_g;        // STB read for issue data (CE)
input		lsu_sbdpu_err_g;        // STB read for issue data (UE)
input		lsu_sbapp_err_g;        // STB read for issue addr parity error
input		lsu_sbdiou_err_g;       // STB read for issue IO/ext ASI parity
input	[2:0]	lsu_stberr_tid_g;       // TID of STB error
input	[2:0]	lsu_stberr_index_g;	// Index of STB error
input	[1:0]	lsu_stberr_priv_g;	// Privilege level for STB entry
input		lsu_stb_flush_g;	// STB entry flushed STB (capture priv)
input		lsu_dttp_err_b;         // DTLB tag parity error
input		lsu_dtdp_err_b;         // DTLB data parity error
input		lsu_dtmh_err_b;         // DTLB data parity error 
input		lsu_perfmon_trap_b;	// Take pic_overflow on this instruction
input		lsu_perfmon_trap_g;	// Take pic_overflow on this instruction
input	[47:0]	lsu_va_b;		// For DSFAR
input		lsu_ext_interrupt;	// Write to interrupt vector dispatch
input	[1:0]	lsu_ext_int_type;	// Type for CPX packet
input	[5:0]	lsu_ext_int_vec;	// Interrupt vector
input	[2:0]	lsu_ext_int_tid;

input	[15:0]	l15_spc_data1;		// Lowest 16 bits of return data from L2
input	[17:0]	l15_spc_cpkt;		// Control part of cpx packet
					// NOTE: 17:13 == 144:140
					//       12 is always 1'b0
					// 	 11:0  == 139:128
input		l15_spc_valid;

input 	[31:0]	lsu_asi_error_inject; 	// 31:Enb 22:TCCU 21:TSAU 7:0 ECCMASK
input 	[64:0]	lsu_rngf_cdbus; 	// control/data bus from lsu



input		fgu_pdist_beat2_fx1;	// Second part of PDIST in FX1
input		fgu_predict_fx2;	// Exception predicted
input		fgu_cecc_fx2;		// Correctable ECC Error on FRF
input		fgu_uecc_fx2;		// Uncorrectable ECC Error on FRF
input	[5:0]	fgu_ecc_addr_fx2;	// Address for ECC error
input	[13:0]	fgu_ecc_check_fx2;	// ECC bits
input		fgu_fpx_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpd_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpx_unfin_fw; 	// Other FGU exception
input	[2:0]	fgu_fpx_trap_tid_fw;	// TID for FGU exceptions other than div
input		fgu_fpd_unfin_fw; 	// Other divide exception
input		fgu_fpd_idiv0_trap_fw;
input	[2:0]	fgu_fpd_trap_tid_fw;	// TID for divide exception

input	[7:0]	mmu_hw_tw_enable;	// Hardware tablewalk enable 
input	[7:0]	mmu_write_itlb;		// Reload the ITLB
input	[7:0]	mmu_reload_done;	// Hardware tablewalk done
input	[7:0]	mmu_i_unauth_access;	// Hardware tablewalk ITSB with EP=0
input	[7:0]	mmu_i_tsb_miss;		// Hardware tablewalk missed
input	[7:0]	mmu_d_tsb_miss;		// Hardware tablewalk missed
input	[7:0]	mmu_i_tte_outofrange;	// RA out of range
input	[7:0]	mmu_d_tte_outofrange;	// RA out of range
input	[47:0]	mmu_itte_tag_data;
input	[64:0]	mmu_asi_data;		// ASI read data for fast bus
input		mmu_asi_read;		// Valid for MMU ASI read
input		mmu_dae_req;		// data_access_exception for bad pg size
input	[2:0]	mmu_dae_tid;		
input 		mmu_asi_cecc; 		// Correctable ECC error on ASI read
input 		mmu_asi_uecc; 		// Uncorrectable ECC error on ASI read
input	[2:0]	mmu_asi_tid;		// Thread for reported error
input	[10:0]	mmu_asi_index;		// Syndrome and index of the failure
input		mmu_asi_mra_not_sca;	// 1: MRA error 0: Scratchpad error
input	[7:0]	mmu_i_l2cerr;           // HW TW had L2 CE on I rld
input	[7:0]	mmu_d_l2cerr;           // HW TW had L2 CE on D rld
input	[7:0]	mmu_i_eccerr;		// HW TW had MRA or L2 error on I rld
input	[7:0]	mmu_d_eccerr;		// HW TW had MRA or L2 error on D rld
input	[2:0]	mmu_thr0_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr1_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr2_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr3_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr4_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr5_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr6_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr7_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
input	[2:0]	mmu_thr0_err_index;	
input	[2:0]	mmu_thr1_err_index;	
input	[2:0]	mmu_thr2_err_index;	
input	[2:0]	mmu_thr3_err_index;	
input	[2:0]	mmu_thr4_err_index;	
input	[2:0]	mmu_thr5_err_index;	
input	[2:0]	mmu_thr6_err_index;	
input	[2:0]	mmu_thr7_err_index;	

input		spu_pmu_ma_busy;	// Must idle before parking
input		spu_tlu_cwq_busy;	// Must idle before soft stop parking
input	[10:0]	spu_tlu_mamu_err_req;	// SPU MAMEM parity error
input	[4:0]	spu_tlu_ma_int_req;	// SPU MA  4 err  3 vld  2:0 thread ID
input	[3:0]	spu_tlu_cwq_int_req;	// SPU CWQ trap rq  3 vld  2:0 thread ID
input	[5:0]	spu_tlu_l2_error;	// MAL2[C,U,ND],CWQL2[C,U,ND]


input	[7:0]	pmu_tlu_trap_m;		// PMU trap; kill instruction in M 
input	[7:0]	pmu_tlu_debug_event;	// PMU event; soft/hard stop or pulse 


output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output		spc_shscan_scan_out;	// Shadow scan

output	[7:0]	tlu_core_running_status;
output		tlu_ss_complete;

output		tlu_hardstop_request;	
output		tlu_softstop_request;	
output		tlu_trigger_pulse;	
output	[1:0]	tlu_dbg_instr_cmt_grp0;	
output	[1:0]	tlu_dbg_instr_cmt_grp1;	

output	[7:0]	tlu_flush_ifu;		// Flush specified thread

output	[1:0]	tlu_window_block;	// Block decode of CWP altering ops

output	[7:0]	tlu_retry_state;	// DEC should not wait for delay slot

output	[7:0]	tlu_halted;		// Pick should stall;

output 	[47:2]	tlu_pc_0_d;
output 	[47:2]	tlu_pc_1_d;
output	[1:0]	tlu_flush_exu_b;	// EXU to flush instr in B stage
output	[7:0]	tlu_ccr_0;
output	[7:0]	tlu_ccr_1;
output	[2:0]	tlu_cwp_0;
output	[2:0]	tlu_cwp_1;
output		tlu_ccr_cwp_0_valid;
output		tlu_ccr_cwp_1_valid;
output	[1:0]	tlu_ccr_cwp_0_tid;
output	[1:0]	tlu_ccr_cwp_1_tid;
output	[1:0]	tlu_gl0;
output	[1:0]	tlu_gl1;
output	[1:0]	tlu_gl2;
output	[1:0]	tlu_gl3;
output	[1:0]	tlu_gl4;
output	[1:0]	tlu_gl5;
output	[1:0]	tlu_gl6;
output	[1:0]	tlu_gl7;
output	[1:0]	tlu_itlb_bypass_e;

output 		tlu_flush_lsu_b;	// LSU to flush instr in B stage

output		tlu_flush_fgu_b;	// FGU to flush instr in B stage

output	[47:0]	tlu_trap_pc_0;
output		tlu_trap_pc_0_valid;
output	[1:0]	tlu_trap_0_tid;

output	[47:0]	tlu_trap_pc_1;
output		tlu_trap_pc_1_valid;
output	[1:0]	tlu_trap_1_tid;

output	[1:0]	tlu_retry;
output	[1:0]	tlu_ifu_invalidate;	// Forces IFU to invalidate, refetch

output	[1:0]	tlu_itlb_reload;
output	[7:0]	tlu_itlb_bypass;

output 	[7:0]	tlu_release_tte;

output 	[64:0]	tlu_rngf_cdbus;
output 		tlu_rngf_cdbus_error;	// Same cycle as data on cdbus

output	[7:0]	tlu_asi_0;
output	[7:0]	tlu_asi_1;
output		tlu_asi_0_valid;
output		tlu_asi_1_valid;
output	[1:0]	tlu_asi_0_tid;
output	[1:0]	tlu_asi_1_tid;

output	[7:0]	tlu_tl_gt_0;
output	[7:0]	tlu_lsu_clear_ctl_reg_;

output 	[7:0]	tlu_load_i_tag_access_p;
output 	[7:0]	tlu_load_i_tag_access_n;
output 	[7:0]	tlu_load_d_tag_access;
output 	[7:0]	tlu_load_d_tag_access_r;
output 	[47:2]	tlu_npc_w;
output 	[47:13]	tlu_pc_0_w;
output 	[47:13]	tlu_pc_1_w;
output 	[7:0]	tlu_iht_request;	// ITLB hardware tablewalk request
output 	[7:0]	tlu_dht_request;	// DTLB hardware tablewalk request
output	[7:0]	tlu_mmu_tl_gt_0;


output 	[1:0]	tlu_flush_pmu_b;
output 	[1:0]	tlu_flush_pmu_w;
output 	[7:0]	tlu_pmu_trap_taken;
output 	[1:0]	tlu_pmu_trap_mask_e;

output	[7:0]	tlu_lsu_hpstate_hpriv;
output	[7:0]	tlu_lsu_pstate_priv;
output	[7:0]	tlu_ifu_hpstate_hpriv;
output	[7:0]	tlu_ifu_pstate_priv;
output	[7:0]	tlu_pmu_hpstate_hpriv;
output	[7:0]	tlu_pmu_pstate_priv;
output	[7:0]	tlu_dec_hpstate_hpriv;
output	[7:0]	tlu_dec_pstate_priv;
output	[7:0]	tlu_dec_pstate_pef;
output	[7:0]	tlu_pstate_cle;
output	[7:0]	tlu_pstate_am;

output		tlu_cerer_ittp 		;
output		tlu_cerer_itdp 		;
output		tlu_cerer_ittm 		;
output		tlu_cerer_hwtwmu 	;
output		tlu_cerer_hwtwl2	;
output		tlu_cerer_icl2c 	;
output		tlu_cerer_icl2u 	;
output		tlu_cerer_icl2nd 	;
output		tlu_cerer_irf 		;
output		tlu_cerer_frf 		;
output		tlu_cerer_dttp 		;
output		tlu_cerer_dttm 		;
output		tlu_cerer_dtdp 		;
output		tlu_cerer_dcl2c 	;
output		tlu_cerer_dcl2u 	;
output		tlu_cerer_dcl2nd 	;
output		tlu_cerer_sbdlc 	;
output		tlu_cerer_sbdlu 	;
output		tlu_cerer_mrau 		;
output		tlu_cerer_scac 		;
output		tlu_cerer_scau 		;
output		tlu_cerer_sbapp 	;
output		tlu_cerer_l2c_socc	;
output		tlu_cerer_l2u_socu	;
output		tlu_cerer_icvp 		;
output		tlu_cerer_ictp 		;
output		tlu_cerer_ictm 		;
output		tlu_cerer_icdp 		;
output		tlu_cerer_dcvp 		;
output		tlu_cerer_dctp 		;
output		tlu_cerer_dctm 		;
output		tlu_cerer_dcdp 		;
output		tlu_cerer_sbdpc 	;
output		tlu_cerer_sbdpu 	;
output		tlu_cerer_mamu 		;
output		tlu_cerer_mal2c 	;
output		tlu_cerer_mal2u 	;
output		tlu_cerer_mal2nd 	;
output		tlu_cerer_cwql2c 	;
output		tlu_cerer_cwql2u 	;
output		tlu_cerer_cwql2nd 	;
output		tlu_cerer_sbdiou 	;

output	[7:0]	tlu_ceter_pscce;

output	[1:0]	tlu_tag_access_tid_0_b;	// Tag access power management
output		tlu_i_tag_access_0_b;	// Tag access power management
output		tlu_d_tag_access_0_b;	// Tag access power management
output	[1:0]	tlu_tag_access_tid_1_b;	// Tag access power management
output		tlu_i_tag_access_1_b;	// Tag access power management
output		tlu_d_tag_access_1_b;	// Tag access power management

output		tlu_mbi_tsa0_fail;	// MBIST
output		tlu_mbi_tsa1_fail;	// MBIST
output		tlu_mbi_tca_fail;	// MBIST

output 	[7:0]	tlu_spec_enable;



//////////////////////////////////////////////////////////////////////////////

assign error_inject_unused[30:23] =
       lsu_asi_error_inject[30:23];
assign error_inject_unused[20:8] =
       lsu_asi_error_inject[20:8];

assign tlu_cerer_sbdiou =
	tlu_cerer_sbdpu;

assign rd_pce = 1'b1;
assign wr_pce = 1'b1;
assign bist_clk_mux_sel = 1'b0;
assign tcu_scan_en_wmr = lb_scan_en_wmr;



////////////////////////////////////////////////////////////////////////////////
// Flush Logic: one for each thread group and datapath to merge LSU, FGU flushes
tlu_fls_ctl fls0 ( 
	.wmr_scan_in(fls0_wmr_scanin),
	.wmr_scan_out(fls0_wmr_scanout),
	.scan_in(fls0_scanin),
	.scan_out(fls0_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b0				),
	.trl_shscanid		({trl0_shscanid_2	       ,
				  trl0_shscanid		[1:0]}),
	.tcu_core_running	(tcu_core_running	[3:0]	),
	.cxi_xir		(cxi_xir		[3:0]	),
	.cxi_ivt		(cxi_ivt		[3:0]	),
	.dec_raw_pick_p		(dec_raw_pick_p		[3:1]	),
	.dec_tid_m		(dec_tid0_m		[1:0]	),
	.dec_inst_valid_m	(dec_inst_valid_m	[0   ]	),
	.dec_lsu_inst_m		(dec_lsu_inst_m		[0   ]	),
	.dec_fgu_inst_m		(dec_fgu_inst_m		[0   ]	),
	.dec_illegal_inst_m	(dec_illegal_inst_m	[0   ]	),
	.dec_exc_m		(dec_exc0_m		[4:0]	),
	.dec_done_inst_m	(dec_done_inst_m	[0   ]	),
	.dec_retry_inst_m	(dec_retry_inst_m	[0   ]	),
	.dec_sir_inst_m		(dec_sir_inst_m		[0   ]	),
	.dec_hpriv_exc_m	(dec_hpriv_exc_m	[0   ]	),
	.dec_priv_exc_m		(dec_priv_exc_m		[0   ]	),
	.dec_fpdisable_exc_m	(dec_fpdisable_exc_m	[0   ]	),
	.dec_br_taken_m		(dec_br_taken_m		[0   ]	),
	.dec_annul_ds_m		(dec_annul_ds_m		[0   ]	),
	.dec_ds_m		(dec_ds_m		[0   ]	),
	.dec_icache_perr_m	(dec_icache_perr_m	[0   ]	),
	.dec_cti_inst_m		(dec_cti_inst_m		[0   ]	),
	.dec_flush_b		(dec_flush_b		[0   ]	),
	.exu_ibp_m		(exu_ibp_m		[0   ]	),
	.exu_tcc_m		(exu_tcc_m		[0   ]	),
	.exu_tof_m		(exu_tof_m		[0   ]	),
	.exu_cecc_m		(exu_cecc_m		[0   ]	),
	.exu_uecc_m		(exu_uecc_m		[0   ]	),
	.exu_oor_va_m		(exu_oor_va_m		[0   ]	),
	.exu_misalign_m		(exu_misalign_m		[0   ]	),
	.exu_spill_b		(exu_spill_b		[0   ]	),
	.exu_fill_m		(exu_fill_m		[0   ]	),
	.exu_normal_b		(exu_normal_b		[0   ]	),
	.exu_cleanwin_b		(exu_cleanwin_b		[0   ]	),
	.exu_wstate_b		(exu0_wstate_b		[2:0]	),
	.exu_trap_number_b	(exu0_trap_number_b	[7:0]	),
	.exu_cwp0		(exu0_cwp0		[2:0]	),
	.exu_cwp1		(exu0_cwp1		[2:0]	),
	.exu_cwp2		(exu0_cwp2		[2:0]	),
	.exu_cwp3		(exu0_cwp3		[2:0]	),
	.lsu_trap_flush		(lsu_trap_flush		[3:0]	),
	.lsu_spec_enable	(asi_spec_enable	[3:0]	),
	.lsu_block_store_b	(lsu_block_store_b	[3:0]	),
	.lsu_immu_enable	(asi_immu_enable	[3:0]	),
	.asi_irl_cleared	(asi_irl_cleared	[3:0]	),
	.asi_halt		(asi_halt		[3:0]	),
	.asi_clear_spu_trap_req	(asi_clear_spu_trap_req	[3:0]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[3:0]	),
	.mmu_hw_tw_enable	(mmu_hw_tw_enable	[3:0]	),
	.mmu_i_unauth_access	(mmu_i_unauth_access	[3:0]	),
	.mmu_i_tsb_miss		(mmu_i_tsb_miss		[3:0]	),
	.mmu_d_tsb_miss		(mmu_d_tsb_miss		[3:0]	),
	.mmu_i_tte_outofrange	(mmu_i_tte_outofrange	[3:0]	),
	.mmu_d_tte_outofrange	(mmu_d_tte_outofrange	[3:0]	),
	.mmu_i_eccerr		(mmu_i_eccerr		[3:0]	),
	.mmu_d_eccerr		(mmu_d_eccerr		[3:0]	),
	.mmu_thr0_err_type_b1   (mmu_thr0_err_type	[1   ]	),
	.mmu_thr1_err_type_b1   (mmu_thr1_err_type	[1   ]	),
	.mmu_thr2_err_type_b1   (mmu_thr2_err_type	[1   ]	),
	.mmu_thr3_err_type_b1   (mmu_thr3_err_type	[1   ]	),
	.pmu_tlu_trap_m		(pmu_tlu_trap_m		[3:0]	),
	.pmu_tlu_debug_event	(pmu_tlu_debug_event	[3:0]	),
	.flsx_flush_lsu_b	(1'b0				),
	.flsx_flush_fgu_b	(1'b0				),
	.pct_iaw_exc_e		(pct0_iaw_exc_e		[1:0]	),
	.pct_npc_0_w		(pct_npc_0_w		[3:2]	),
	.pct_npc_1_w		(pct_npc_1_w		[3:2]	),
	.pct_npc_2_w		(pct_npc_2_w		[3:2]	),
	.pct_npc_3_w		(pct_npc_3_w		[3:2]	),
	.pct_pc_oor_va_e	(pct_pc_oor_va_e	[0   ]	),
	.trl_tl_eq_0		(trl_tl_eq_0		[3:0]	),
	.trl_pil_mask_15	(trl_pil_mask_15	[3:0]	),
	.trl_iln_exc		(trl_iln_exc		[3:0]	),
	.trl_hstick_match	(trl_hstick_match	[3:0]	),
	.trl_unhalt_		(trl_unhalt_		[3:0]	),
	.trl_tlz_exc		(trl_tlz_exc		[3:0]	),
	.trl_nns_exc		(trl_nns_exc		[3:0]	),
	.trl_ssc_exc		(trl_ssc_exc		[3:0]	),
	.trl_invalidate_pc	(trl_invalidate_pc	[3:0]	),
	.trl_invalidate_npc	(trl_invalidate_npc	[3:0]	),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[3:0]	),
	.trl_fls_npc_en		(trl_fls_npc_en		[3:0]	),
	.trl_trap_taken		(trl_trap_taken		[3:0]	),
	.trl_take_sma		(trl0_take_sma			),
	.trl_take_cwq		(trl0_take_cwq			),
	.trl_take_xir		(trl0_take_xir			),
	.trl_take_ftt		(trl0_take_ftt			),
	.trl_core_running_status(trl_core_running_status[3:0]	),
	.trl_check_rqr		(trl0_tsa_wr_addr	[0   ]	),
	.tlu_ceter_de		(tlu_ceter_de		[3:0]	),
	.tlu_ceter_dhcce	(tlu_ceter_dhcce	[3:0]	),
	.tsd_hpstate_ibe	(tsd_hpstate_ibe	[3:0]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[3:0]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[3:0]	),
	.tsd_pstate_tct		(tsd_pstate_tct		[3:0]	),
	.tsd_pstate_priv	(tsd_pstate_priv	[3:0]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[3:0]	),
	.tsd_pstate_am		(tsd_pstate_am		[3:0]	),
	.tsd_itlb_bypass	(tsd_itlb_bypass	[3:0]	),
	.tsd_mrqr_exc_		(tsd0_mrqr_exc_			),
	.tsd_dqr_exc_		(tsd0_dqr_exc_			),
	.asi_check_qr_exc	(asi_check_qr_exc	[3:0]	),
	.dfd_fls_desr_f		(dfd_fls_desr_f		[3:0]	),
	.dfd_fls_desr_s		(dfd_fls_desr_s		[3:0]	),
	.ras_precise_error	(ras_precise_error	[3:0]	),
	.ras_disrupting_error	(ras_disrupting_error	[3:0]	),
	.ras_deferred_error	(ras_deferred_error	[3:0]	),
	.fls_spc_hardstop_request(fls0_spc_hardstop_request	),
	.fls_spc_softstop_request(fls0_spc_softstop_request	),
	.fls_spc_trigger_pulse  (fls0_spc_trigger_pulse 	),
	.tlu_dbg_instr_cmt_grp 	(tlu_dbg_instr_cmt_grp0 [1:0]	),
	.tlu_flush_ifu		(tlu_flush_ifu		[3:0]	),
	.tlu_flush_exu_b	(tlu_flush_exu_b	[0   ]	),
	.tlu_flush_lsu_b	(tlu_flush_lsu_b_unused		),
	.tlu_flush_fgu_b	(tlu_flush_fgu_b_unused		),
	.tlu_flush_pmu_b	(tlu_flush_pmu_b	[0   ]	),
	.tlu_flush_pmu_w	(tlu_flush_pmu_w	[0   ]	),
	.tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[3:0]	),
	.tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[3:0]	),
	.tlu_load_d_tag_access	(tlu_load_d_tag_access	[3:0]	),
	.tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[3:0]	),
	.fls_flush_lsu_b	(fls0_flush_lsu_b		),
	.fls_flush_fgu_b	(fls0_flush_fgu_b		),
	.fls_tid_d		(fls0_tid_d		[1:0]	),
	.fls_tid_dec_b		(fls0_tid_dec_b		[3:0]	),
	.fls_tid_dec_w		(fls0_tid_dec_w		[3:0]	),
	.fls_pc_sel_npc		(fls_pc_sel_npc		[3:0]	),
	.fls_pc_sel_npc_plus_4	(fls_pc_sel_npc_plus_4	[3:0]	),
	.fls_npc_sel_npc_plus_4	(fls_npc_sel_npc_plus_4	[3:0]	),
	.fls_npc_sel_npc_plus_8	(fls_npc_sel_npc_plus_8	[3:0]	),
	.fls_npc_sel_target	(fls_npc_sel_target	[3:0]	),
	.fls_npc_b_sel_npc	(fls0_npc_b_sel_npc		),
	.fls_pc_is_npc		(fls0_pc_is_npc			),
	.fls_pstate_am_d_	(fls_pstate_am_d_	[0   ]	),
	.fls_pstate_am_b_	(fls_pstate_am_b_	[0   ]	),
	.fls_pstate_am_w_	(fls_pstate_am_w_	[0   ]	),
	.fls_lsu_inst_w		(fls0_lsu_inst_w_unused		),
	.fls_dfd_lsu_inst_b	(fls0_dfd_lsu_inst_b		),
	.fls_wstate0		(fls_wstate0		[2:0]	),
	.fls_wstate1		(fls_wstate1		[2:0]	),
	.fls_wstate2		(fls_wstate2		[2:0]	),
	.fls_wstate3		(fls_wstate3 		[2:0]	),
	.fls_tcc_number_0	(fls_tcc_number_0	[7:0]	),
	.fls_tcc_number_1	(fls_tcc_number_1	[7:0]	),
	.fls_tcc_number_2	(fls_tcc_number_2	[7:0]	),
	.fls_tcc_number_3	(fls_tcc_number_3	[7:0]	),
	.fls_tid_dec_w_in	(fls_tid_dec_w_in	[3:0]	),
	.fls_por_request	(fls_por_request	[3:0]	),
	.fls_xir_request	(fls_xir_request	[3:0]	),
	.fls_ivt_request	(fls_ivt_request	[3:0]	),
	.fls_sir_request	(fls_sir_request	[3:0]	),
	.fls_itm_request	(fls_itm_request	[3:0]	),
	.fls_iln_request	(fls_iln_request	[3:0]	),
	.fls_hst_request	(fls_hst_request	[3:0]	),
	.fls_tlz_request	(fls_tlz_request	[3:0]	),
	.fls_sma_request	(fls_sma_request	[3:0]	),
	.fls_cwq_request	(fls_cwq_request	[3:0]	),
	.fls_ade_request	(fls_ade_request	[3:0]	),
	.fls_iae_request	(fls_iae_request	[3:0]	),
	.fls_ipe_request	(fls_ipe_request	[3:0]	),
	.fls_ipv_request	(fls_ipv_request	[0   ]	),
	.fls_inp_request	(fls_inp_request	[0   ]	),
	.fls_iar_request	(fls_iar_request	[0   ]	),
	.fls_irr_request	(fls_irr_request	[0   ]	),
	.fls_mar_request	(fls_mar_request	[0   ]	),
	.fls_mrr_request	(fls_mrr_request	[0   ]	),
	.fls_pro_request	(fls_pro_request	[0   ]	),
	.fls_ill_request	(fls_ill_request	[0   ]	),
	.fls_don_request	(fls_don_request	[0   ]	),
	.fls_ret_request	(fls_ret_request	[0   ]	),
	.fls_fpd_request	(fls_fpd_request	[0   ]	),
	.fls_snn_request	(fls_snn_request	[0   ]	),
	.fls_sno_request	(fls_sno_request	[0   ]	),
	.fls_fnn_request	(fls_fnn_request	[0   ]	),
	.fls_fno_request	(fls_fno_request	[0   ]	),
	.fls_clw_request	(fls_clw_request	[0   ]	),
	.fls_dtm_request	(fls_dtm_request	[3:0]	),
	.fls_ldf_request	(fls_ldf_request	[0   ]	),
	.fls_stf_request	(fls_stf_request	[0   ]	),
	.fls_dap_request	(fls_dap_request	[0   ]	),
	.fls_vaw_request	(fls_vaw_request	[0   ]	),
	.fls_iaw_request	(fls_iaw_request	[0   ]	),
	.fls_paw_request	(fls_paw_request	[0   ]	),
	.fls_maa_request	(fls_maa_request	[0   ]	),
	.fls_fpe_request	(fls_fpe_request	[0   ]	),
	.fls_fei_request	(fls_fei_request	[3:0]	),
	.fls_fof_request	(fls_fof_request	[3:0]	),
	.fls_pra_request	(fls_pra_request	[3:0]	),
	.fls_dia_request	(fls_dia_request	[0   ]	),
	.fls_ups_request	(fls_ups_request	[3:0]	),
	.fls_dpv_request	(fls_dpv_request	[0   ]	),
	.fls_dnc_request	(fls_dnc_request	[0   ]	),
	.fls_dnf_request	(fls_dnf_request	[0   ]	),
	.fls_dso_request	(fls_dso_request	[0   ]	),
	.fls_tof_request	(fls_tof_request	[0   ]	),
	.fls_dbz_request	(fls_dbz_request	[3:0]	),
	.fls_tcc_request	(fls_tcc_request	[0   ]	),
	.fls_dae_request	(fls_dae_request	[3:0]	),
	.fls_lsr_request	(fls_lsr_request	[3:0]	),
	.fls_irt_request	(fls_irt_request	[0   ]	),
	.fls_drt_request	(fls_drt_request	[0   ]	),
	.fls_pmu_request	(fls_pmu_request	[3:0]	),
	.fls_mqr_request	(fls_mqr_request	[3:0]	),
	.fls_dqr_request	(fls_dqr_request	[3:0]	),
	.fls_rqr_request	(fls_rqr_request	[3:0]	),
	.fls_idl_request	(fls_idl_request	[3:0]	),
	.fls_res_request	(fls_res_request	[3:0]	),
	.fls_ssr_request	(fls_ssr_request	[3:0]	),
	.fls_ssc_request	(fls_ssc_request	[3:0]	),
	.fls_nns_request	(fls_nns_request	[3:0]	),
	.fls_ime_request	(fls_ime_request	[3:0]	),
	.fls_dme_request	(fls_dme_request	[3:0]	),
	.fls_eer_request	(fls_eer_request	[3:0]	),
	.fls_icp_request	(fls_icp_request	[0   ]	),
	.fls_ftt_request	(fls_ftt_request	[3:0]	),
	.fls_ibp_request	(fls_ibp_request	[0   ]	),
	.fls_tct_request	(fls_tct_request	[0   ]	),
	.fls_ref_request	(fls_ref_request	[0   ]	),
	.fls_ipe_dme_request	(fls_ipe_dme_request	[0   ]	),
	.fls_pc_valid		(fls_pc_valid		[3:0]	),
	.fls_load_dsfar		(fls_load_dsfar		[3:0]	),
	.fls_irf_cecc_b		(fls_irf_cecc_b		[0   ]	),
	.fls_irf_uecc_b		(fls_irf_uecc_b		[0   ]	),
	.fls_kill_irf_ecc_w	(fls_kill_irf_ecc_w	[0   ]	),
	.fls_cwp0		(fls0_cwp0		[2:0]	),
	.fls_cwp1		(fls0_cwp1		[2:0]	),
	.fls_cwp2		(fls0_cwp2		[2:0]	),
	.fls_cwp3		(fls0_cwp3		[2:0]	),
	.fls_core_running	(fls_core_running	[3:0]	),
	.fls_ss_request		(fls_ss_request			),
	.fls_pct_pc_en		(fls_pct_pc_en		[3:0]	),
	.fls_pct_npc_en		(fls_pct_npc_en		[3:0]	),
	.fls_trl_l1en		(fls_trl_l1en		[3:0]	),
	.fls_npc_if_cnt_eq_1_d	(fls0_npc_if_cnt_eq_1_d	[4:2]	),
	.fls_npc_if_cnt_eq_2_d	(fls0_npc_if_cnt_eq_2_d	[4:2]	),
	.fls_npc_if_cnt_eq_3_d	(fls0_npc_if_cnt_eq_3_d	[4:2]	),
	.fls_flush		(fls_flush		[3:0]	),
	.fls_disrupting_flush_w	(fls_disrupting_flush_w	[0   ]	),
	.fls_f_cecc_w		(fls_f_cecc_w			),
	.fls_f_uecc_w		(fls_f_uecc_w			),
	.fls_ss_update_pc_w	(fls_ss_update_pc_w	[0   ]	),
	.tlu_iht_request	(tlu_iht_request	[3:0]	),
	.tlu_dht_request	(tlu_dht_request	[3:0]	),
	.tlu_itlb_bypass_e	(tlu_itlb_bypass_e	[0   ]	),
	.tlu_tag_access_tid_b	(tlu_tag_access_tid_0_b	[1:0]	),
	.tlu_i_tag_access_b	(tlu_i_tag_access_0_b		),
	.tlu_d_tag_access_b	(tlu_d_tag_access_0_b		),
	.tlu_retry_state	(tlu_retry_state	[3:0]	),
	.tlu_halted		(tlu_halted		[3:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .tcu_ss_mode(tcu_ss_mode),
  .tcu_do_mode(tcu_do_mode),
  .tcu_ss_request(tcu_ss_request),
  .lsu_lddf_align_b(lsu_lddf_align_b),
  .lsu_stdf_align_b(lsu_stdf_align_b),
  .lsu_illegal_inst_b(lsu_illegal_inst_b),
  .lsu_daccess_prot_b(lsu_daccess_prot_b),
  .lsu_priv_action_b(lsu_priv_action_b),
  .lsu_va_watchpoint_b(lsu_va_watchpoint_b),
  .lsu_pa_watchpoint_b(lsu_pa_watchpoint_b),
  .lsu_align_b(lsu_align_b),
  .lsu_tlb_miss_b_(lsu_tlb_miss_b_),
  .lsu_dae_invalid_asi_b(lsu_dae_invalid_asi_b),
  .lsu_dae_nc_page_b(lsu_dae_nc_page_b),
  .lsu_dae_nfo_page_b(lsu_dae_nfo_page_b),
  .lsu_dae_priv_viol_b(lsu_dae_priv_viol_b),
  .lsu_dae_so_page(lsu_dae_so_page),
  .lsu_priv_action_g(lsu_priv_action_g),
  .lsu_tid_g(lsu_tid_g[2:0]),
  .lsu_tlb_bypass_b(lsu_tlb_bypass_b),
  .lsu_tlb_real_b(lsu_tlb_real_b),
  .lsu_sync_inst_b(lsu_sync_inst_b),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_perfmon_trap_b(lsu_perfmon_trap_b),
  .lsu_perfmon_trap_g(lsu_perfmon_trap_g),
  .fgu_predict_fx2(fgu_predict_fx2),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .fgu_cecc_fx2(fgu_cecc_fx2),
  .fgu_uecc_fx2(fgu_uecc_fx2),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .asi_ece_exc(asi_ece_exc),
  .asi_eue_exc(asi_eue_exc),
  .asi_ecc_tid(asi_ecc_tid[2:0]),
  .asi_decr(asi_decr[63:46]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_tid(mmu_asi_tid[2:0]),
  .mmu_dae_req(mmu_dae_req),
  .mmu_dae_tid(mmu_dae_tid[2:0]),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[4:0]),
  .spu_tlu_cwq_int_req(spu_tlu_cwq_int_req[3:0])
);

tlu_fls_ctl fls1 ( 
	.wmr_scan_in(fls1_wmr_scanin),
	.wmr_scan_out(fls1_wmr_scanout),
	.scan_in(fls1_scanin),
	.scan_out(fls1_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b1				),
	.trl_shscanid		({trl1_shscanid_2	       ,
				  trl1_shscanid		[1:0]}),
	.tcu_core_running	(tcu_core_running	[7:4]	),
	.cxi_xir		(cxi_xir		[7:4]	),
	.cxi_ivt		(cxi_ivt		[7:4]	),
	.dec_raw_pick_p		(dec_raw_pick_p		[7:5]	),
	.dec_tid_m		(dec_tid1_m		[1:0]	),
	.dec_inst_valid_m	(dec_inst_valid_m	[1   ]	),
	.dec_lsu_inst_m		(dec_lsu_inst_m		[1   ]	),
	.dec_fgu_inst_m		(dec_fgu_inst_m		[1   ]	),
	.dec_illegal_inst_m	(dec_illegal_inst_m	[1   ]	),
	.dec_exc_m		(dec_exc1_m		[4:0]	),
	.dec_done_inst_m	(dec_done_inst_m	[1   ]	),
	.dec_retry_inst_m	(dec_retry_inst_m	[1   ]	),
	.dec_sir_inst_m		(dec_sir_inst_m		[1   ]	),
	.dec_hpriv_exc_m	(dec_hpriv_exc_m	[1   ]	),
	.dec_priv_exc_m		(dec_priv_exc_m		[1   ]	),
	.dec_fpdisable_exc_m	(dec_fpdisable_exc_m	[1   ]	),
	.dec_br_taken_m		(dec_br_taken_m		[1   ]	),
	.dec_annul_ds_m		(dec_annul_ds_m		[1   ]	),
	.dec_ds_m		(dec_ds_m		[1   ]	),
	.dec_icache_perr_m	(dec_icache_perr_m	[1   ]	),
	.dec_cti_inst_m		(dec_cti_inst_m		[1   ]	),
	.dec_flush_b		(dec_flush_b		[1   ]	),
	.exu_ibp_m		(exu_ibp_m		[1   ]	),
	.exu_tcc_m		(exu_tcc_m		[1   ]	),
	.exu_tof_m		(exu_tof_m		[1   ]	),
	.exu_cecc_m		(exu_cecc_m		[1   ]	),
	.exu_uecc_m		(exu_uecc_m		[1   ]	),
	.exu_oor_va_m		(exu_oor_va_m		[1   ]	),
	.exu_misalign_m		(exu_misalign_m		[1   ]	),
	.exu_spill_b		(exu_spill_b		[1   ]	),
	.exu_fill_m		(exu_fill_m		[1   ]	),
	.exu_normal_b		(exu_normal_b		[1   ]	),
	.exu_cleanwin_b		(exu_cleanwin_b		[1   ]	),
	.exu_wstate_b		(exu1_wstate_b		[2:0]	),
	.exu_trap_number_b	(exu1_trap_number_b	[7:0]	),
	.exu_cwp0		(exu1_cwp0		[2:0]	),
	.exu_cwp1		(exu1_cwp1		[2:0]	),
	.exu_cwp2		(exu1_cwp2		[2:0]	),
	.exu_cwp3		(exu1_cwp3		[2:0]	),
	.lsu_trap_flush		(lsu_trap_flush		[7:4]	),
	.lsu_spec_enable	(asi_spec_enable	[7:4]	),
	.lsu_block_store_b	(lsu_block_store_b	[7:4]	),
	.lsu_immu_enable	(asi_immu_enable	[7:4]	),
	.asi_irl_cleared	(asi_irl_cleared	[7:4]	),
	.asi_halt		(asi_halt		[7:4]	),
	.asi_clear_spu_trap_req	(asi_clear_spu_trap_req	[7:4]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[7:4]	),
	.mmu_hw_tw_enable	(mmu_hw_tw_enable	[7:4]	),
	.mmu_i_unauth_access	(mmu_i_unauth_access	[7:4]	),
	.mmu_i_tsb_miss		(mmu_i_tsb_miss		[7:4]	),
	.mmu_d_tsb_miss		(mmu_d_tsb_miss		[7:4]	),
	.mmu_i_tte_outofrange	(mmu_i_tte_outofrange	[7:4]	),
	.mmu_d_tte_outofrange	(mmu_d_tte_outofrange	[7:4]	),
	.mmu_i_eccerr		(mmu_i_eccerr		[7:4]	),
	.mmu_d_eccerr		(mmu_d_eccerr		[7:4]	),
	.mmu_thr0_err_type_b1   (mmu_thr4_err_type	[1   ]	),
	.mmu_thr1_err_type_b1   (mmu_thr5_err_type	[1   ]	),
	.mmu_thr2_err_type_b1   (mmu_thr6_err_type	[1   ]	),
	.mmu_thr3_err_type_b1   (mmu_thr7_err_type	[1   ]	),
	.pmu_tlu_trap_m		(pmu_tlu_trap_m		[7:4]	),
	.pmu_tlu_debug_event	(pmu_tlu_debug_event	[7:4]	),
	.flsx_flush_lsu_b	(fls0_flush_lsu_b		),
	.flsx_flush_fgu_b	(fls0_flush_fgu_b		),
	.pct_iaw_exc_e		(pct1_iaw_exc_e		[1:0]	),
	.pct_npc_0_w		(pct_npc_4_w		[3:2]	),
	.pct_npc_1_w		(pct_npc_5_w		[3:2]	),
	.pct_npc_2_w		(pct_npc_6_w		[3:2]	),
	.pct_npc_3_w		(pct_npc_7_w		[3:2]	),
	.pct_pc_oor_va_e	(pct_pc_oor_va_e	[1   ]	),
	.trl_tl_eq_0		(trl_tl_eq_0		[7:4]	),
	.trl_pil_mask_15	(trl_pil_mask_15	[7:4]	),
	.trl_iln_exc		(trl_iln_exc		[7:4]	),
	.trl_hstick_match	(trl_hstick_match	[7:4]	),
	.trl_unhalt_		(trl_unhalt_		[7:4]	),
	.trl_tlz_exc		(trl_tlz_exc		[7:4]	),
	.trl_nns_exc		(trl_nns_exc		[7:4]	),
	.trl_ssc_exc		(trl_ssc_exc		[7:4]	),
	.trl_invalidate_pc	(trl_invalidate_pc	[7:4]	),
	.trl_invalidate_npc	(trl_invalidate_npc	[7:4]	),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[7:4]	),
	.trl_fls_npc_en		(trl_fls_npc_en		[7:4]	),
	.trl_trap_taken		(trl_trap_taken		[7:4]	),
	.trl_take_sma		(trl1_take_sma			),
	.trl_take_cwq		(trl1_take_cwq			),
	.trl_take_xir		(trl1_take_xir			),
	.trl_take_ftt		(trl1_take_ftt			),
	.trl_core_running_status(trl_core_running_status[7:4]	),
	.trl_check_rqr		(trl1_tsa_wr_addr	[0   ]	),
	.tlu_ceter_de		(tlu_ceter_de		[7:4]	),
	.tlu_ceter_dhcce	(tlu_ceter_dhcce	[7:4]	),
	.tsd_hpstate_ibe	(tsd_hpstate_ibe	[7:4]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[7:4]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[7:4]	),
	.tsd_pstate_tct		(tsd_pstate_tct		[7:4]	),
	.tsd_pstate_priv	(tsd_pstate_priv	[7:4]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[7:4]	),
	.tsd_pstate_am		(tsd_pstate_am		[7:4]	),
	.tsd_itlb_bypass	(tsd_itlb_bypass	[7:4]	),
	.tsd_mrqr_exc_		(tsd1_mrqr_exc_			),
	.tsd_dqr_exc_		(tsd1_dqr_exc_			),
	.asi_check_qr_exc	(asi_check_qr_exc	[7:4]	),
	.dfd_fls_desr_f		(dfd_fls_desr_f		[7:4]	),
	.dfd_fls_desr_s		(dfd_fls_desr_s		[7:4]	),
	.ras_precise_error	(ras_precise_error	[7:4]	),
	.ras_disrupting_error	(ras_disrupting_error	[7:4]	),
	.ras_deferred_error	(ras_deferred_error	[7:4]	),
	.fls_spc_hardstop_request(fls1_spc_hardstop_request	),
	.fls_spc_softstop_request(fls1_spc_softstop_request	),
	.fls_spc_trigger_pulse  (fls1_spc_trigger_pulse 	),
	.tlu_dbg_instr_cmt_grp 	(tlu_dbg_instr_cmt_grp1 [1:0]	),
	.tlu_flush_ifu		(tlu_flush_ifu		[7:4]	),
	.tlu_flush_exu_b	(tlu_flush_exu_b	[1   ]	),
	.tlu_flush_lsu_b	(tlu_flush_lsu_b		),
	.tlu_flush_fgu_b	(tlu_flush_fgu_b		),
	.tlu_flush_pmu_b	(tlu_flush_pmu_b	[1   ]	),
	.tlu_flush_pmu_w	(tlu_flush_pmu_w	[1   ]	),
	.tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[7:4]	),
	.tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[7:4]	),
	.tlu_load_d_tag_access	(tlu_load_d_tag_access	[7:4]	),
	.tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[7:4]	),
	.fls_flush_lsu_b	(fls1_flush_lsu_b_unused	),
	.fls_flush_fgu_b	(fls1_flush_fgu_b_unused	),
	.fls_tid_d		(fls1_tid_d		[1:0]	),
	.fls_tid_dec_b		(fls1_tid_dec_b		[3:0]	),
	.fls_tid_dec_w		(fls1_tid_dec_w		[3:0]	),
	.fls_pc_sel_npc		(fls_pc_sel_npc		[7:4]	),
	.fls_pc_sel_npc_plus_4	(fls_pc_sel_npc_plus_4	[7:4]	),
	.fls_npc_sel_npc_plus_4	(fls_npc_sel_npc_plus_4	[7:4]	),
	.fls_npc_sel_npc_plus_8	(fls_npc_sel_npc_plus_8	[7:4]	),
	.fls_npc_sel_target	(fls_npc_sel_target	[7:4]	),
	.fls_npc_b_sel_npc	(fls1_npc_b_sel_npc		),
	.fls_pc_is_npc		(fls1_pc_is_npc			),
	.fls_pstate_am_d_	(fls_pstate_am_d_	[1   ]	),
	.fls_pstate_am_b_	(fls_pstate_am_b_	[1   ]	),
	.fls_pstate_am_w_	(fls_pstate_am_w_	[1   ]	),
	.fls_lsu_inst_w		(fls1_lsu_inst_w		),
	.fls_dfd_lsu_inst_b	(fls1_dfd_lsu_inst_b		),
	.fls_wstate0		(fls_wstate4		[2:0]	),
	.fls_wstate1		(fls_wstate5		[2:0]	),
	.fls_wstate2		(fls_wstate6		[2:0]	),
	.fls_wstate3		(fls_wstate7 		[2:0]	),
	.fls_tcc_number_0	(fls_tcc_number_4	[7:0]	),
	.fls_tcc_number_1	(fls_tcc_number_5	[7:0]	),
	.fls_tcc_number_2	(fls_tcc_number_6	[7:0]	),
	.fls_tcc_number_3	(fls_tcc_number_7	[7:0]	),
	.fls_tid_dec_w_in	(fls_tid_dec_w_in	[7:4]	),
	.fls_por_request	(fls_por_request	[7:4]	),
	.fls_xir_request	(fls_xir_request	[7:4]	),
	.fls_ivt_request	(fls_ivt_request	[7:4]	),
	.fls_sir_request	(fls_sir_request	[7:4]	),
	.fls_itm_request	(fls_itm_request	[7:4]	),
	.fls_iln_request	(fls_iln_request	[7:4]	),
	.fls_hst_request	(fls_hst_request	[7:4]	),
	.fls_tlz_request	(fls_tlz_request	[7:4]	),
	.fls_sma_request	(fls_sma_request	[7:4]	),
	.fls_cwq_request	(fls_cwq_request	[7:4]	),
	.fls_ade_request	(fls_ade_request	[7:4]	),
	.fls_iae_request	(fls_iae_request	[7:4]	),
	.fls_ipe_request	(fls_ipe_request	[7:4]	),
	.fls_ipv_request	(fls_ipv_request	[1   ]	),
	.fls_inp_request	(fls_inp_request	[1   ]	),
	.fls_iar_request	(fls_iar_request	[1   ]	),
	.fls_irr_request	(fls_irr_request	[1   ]	),
	.fls_mar_request	(fls_mar_request	[1   ]	),
	.fls_mrr_request	(fls_mrr_request	[1   ]	),
	.fls_pro_request	(fls_pro_request	[1   ]	),
	.fls_ill_request	(fls_ill_request	[1   ]	),
	.fls_don_request	(fls_don_request	[1   ]	),
	.fls_ret_request	(fls_ret_request	[1   ]	),
	.fls_fpd_request	(fls_fpd_request	[1   ]	),
	.fls_snn_request	(fls_snn_request	[1   ]	),
	.fls_sno_request	(fls_sno_request	[1   ]	),
	.fls_fnn_request	(fls_fnn_request	[1   ]	),
	.fls_fno_request	(fls_fno_request	[1   ]	),
	.fls_clw_request	(fls_clw_request	[1   ]	),
	.fls_dtm_request	(fls_dtm_request	[7:4]	),
	.fls_ldf_request	(fls_ldf_request	[1   ]	),
	.fls_stf_request	(fls_stf_request	[1   ]	),
	.fls_dap_request	(fls_dap_request	[1   ]	),
	.fls_vaw_request	(fls_vaw_request	[1   ]	),
	.fls_iaw_request	(fls_iaw_request	[1   ]	),
	.fls_paw_request	(fls_paw_request	[1   ]	),
	.fls_maa_request	(fls_maa_request	[1   ]	),
	.fls_fpe_request	(fls_fpe_request	[1   ]	),
	.fls_fei_request	(fls_fei_request	[7:4]	),
	.fls_fof_request	(fls_fof_request	[7:4]	),
	.fls_pra_request	(fls_pra_request	[7:4]	),
	.fls_dia_request	(fls_dia_request	[1   ]	),
	.fls_ups_request	(fls_ups_request	[7:4]	),
	.fls_dpv_request	(fls_dpv_request	[1   ]	),
	.fls_dnc_request	(fls_dnc_request	[1   ]	),
	.fls_dnf_request	(fls_dnf_request	[1   ]	),
	.fls_dso_request	(fls_dso_request	[1   ]	),
	.fls_tof_request	(fls_tof_request	[1   ]	),
	.fls_dbz_request	(fls_dbz_request	[7:4]	),
	.fls_tcc_request	(fls_tcc_request	[1   ]	),
	.fls_dae_request	(fls_dae_request	[7:4]	),
	.fls_lsr_request	(fls_lsr_request	[7:4]	),
	.fls_irt_request	(fls_irt_request	[1   ]	),
	.fls_drt_request	(fls_drt_request	[1   ]	),
	.fls_pmu_request	(fls_pmu_request	[7:4]	),
	.fls_mqr_request	(fls_mqr_request	[7:4]	),
	.fls_dqr_request	(fls_dqr_request	[7:4]	),
	.fls_rqr_request	(fls_rqr_request	[7:4]	),
	.fls_idl_request	(fls_idl_request	[7:4]	),
	.fls_res_request	(fls_res_request	[7:4]	),
	.fls_ssr_request	(fls_ssr_request	[7:4]	),
	.fls_ssc_request	(fls_ssc_request	[7:4]	),
	.fls_nns_request	(fls_nns_request	[7:4]	),
	.fls_ime_request	(fls_ime_request	[7:4]	),
	.fls_dme_request	(fls_dme_request	[7:4]	),
	.fls_eer_request	(fls_eer_request	[7:4]	),
	.fls_icp_request	(fls_icp_request	[1   ]	),
	.fls_ftt_request	(fls_ftt_request	[7:4]	),
	.fls_ibp_request	(fls_ibp_request	[1   ]	),
	.fls_tct_request	(fls_tct_request	[1   ]	),
	.fls_ref_request	(fls_ref_request	[1   ]	),
	.fls_ipe_dme_request	(fls_ipe_dme_request	[1   ]	),
	.fls_pc_valid		(fls_pc_valid		[7:4]	),
	.fls_load_dsfar		(fls_load_dsfar		[7:4]	),
	.fls_irf_cecc_b		(fls_irf_cecc_b		[1   ]	),
	.fls_irf_uecc_b		(fls_irf_uecc_b		[1   ]	),
	.fls_kill_irf_ecc_w	(fls_kill_irf_ecc_w	[1   ]	),
	.fls_cwp0		(fls1_cwp0		[2:0]	),
	.fls_cwp1		(fls1_cwp1		[2:0]	),
	.fls_cwp2		(fls1_cwp2		[2:0]	),
	.fls_cwp3		(fls1_cwp3		[2:0]	),
	.fls_core_running	(fls_core_running	[7:4]	),
	.fls_ss_request		(fls_ss_request_unused		),
	.fls_pct_pc_en		(fls_pct_pc_en		[7:4]	),
	.fls_pct_npc_en		(fls_pct_npc_en		[7:4]	),
	.fls_trl_l1en		(fls_trl_l1en		[7:4]	),
	.fls_npc_if_cnt_eq_1_d	(fls1_npc_if_cnt_eq_1_d	[4:2]	),
	.fls_npc_if_cnt_eq_2_d	(fls1_npc_if_cnt_eq_2_d	[4:2]	),
	.fls_npc_if_cnt_eq_3_d	(fls1_npc_if_cnt_eq_3_d	[4:2]	),
	.fls_flush		(fls_flush		[7:4]	),
	.fls_disrupting_flush_w	(fls_disrupting_flush_w	[1   ]	),
	.fls_f_cecc_w		(fls_f_cecc_w_unused		),
	.fls_f_uecc_w		(fls_f_uecc_w_unused		),
	.fls_ss_update_pc_w	(fls_ss_update_pc_w	[1   ]	),
	.tlu_iht_request	(tlu_iht_request	[7:4]	),
	.tlu_dht_request	(tlu_dht_request	[7:4]	),
	.tlu_itlb_bypass_e	(tlu_itlb_bypass_e	[1   ]	),
	.tlu_tag_access_tid_b	(tlu_tag_access_tid_1_b	[1:0]	),
	.tlu_i_tag_access_b	(tlu_i_tag_access_1_b		),
	.tlu_d_tag_access_b	(tlu_d_tag_access_1_b		),
	.tlu_retry_state	(tlu_retry_state	[7:4]	),
	.tlu_halted		(tlu_halted		[7:4]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .tcu_ss_mode(tcu_ss_mode),
  .tcu_do_mode(tcu_do_mode),
  .tcu_ss_request(tcu_ss_request),
  .lsu_lddf_align_b(lsu_lddf_align_b),
  .lsu_stdf_align_b(lsu_stdf_align_b),
  .lsu_illegal_inst_b(lsu_illegal_inst_b),
  .lsu_daccess_prot_b(lsu_daccess_prot_b),
  .lsu_priv_action_b(lsu_priv_action_b),
  .lsu_va_watchpoint_b(lsu_va_watchpoint_b),
  .lsu_pa_watchpoint_b(lsu_pa_watchpoint_b),
  .lsu_align_b(lsu_align_b),
  .lsu_tlb_miss_b_(lsu_tlb_miss_b_),
  .lsu_dae_invalid_asi_b(lsu_dae_invalid_asi_b),
  .lsu_dae_nc_page_b(lsu_dae_nc_page_b),
  .lsu_dae_nfo_page_b(lsu_dae_nfo_page_b),
  .lsu_dae_priv_viol_b(lsu_dae_priv_viol_b),
  .lsu_dae_so_page(lsu_dae_so_page),
  .lsu_priv_action_g(lsu_priv_action_g),
  .lsu_tid_g(lsu_tid_g[2:0]),
  .lsu_tlb_bypass_b(lsu_tlb_bypass_b),
  .lsu_tlb_real_b(lsu_tlb_real_b),
  .lsu_sync_inst_b(lsu_sync_inst_b),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_perfmon_trap_b(lsu_perfmon_trap_b),
  .lsu_perfmon_trap_g(lsu_perfmon_trap_g),
  .fgu_predict_fx2(fgu_predict_fx2),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .fgu_cecc_fx2(fgu_cecc_fx2),
  .fgu_uecc_fx2(fgu_uecc_fx2),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .asi_ece_exc(asi_ece_exc),
  .asi_eue_exc(asi_eue_exc),
  .asi_ecc_tid(asi_ecc_tid[2:0]),
  .asi_decr(asi_decr[63:46]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_tid(mmu_asi_tid[2:0]),
  .mmu_dae_req(mmu_dae_req),
  .mmu_dae_tid(mmu_dae_tid[2:0]),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[4:0]),
  .spu_tlu_cwq_int_req(spu_tlu_cwq_int_req[3:0])
);



////////////////////////////////////////////////////////////////////////////////
// PC and NPC tracking:  one for each thread group
tlu_pct_dp pct0 ( 
	.wmr_scan_in(pct0_wmr_scanin),
	.wmr_scan_out(pct0_wmr_scanout),
	.scan_in(pct0_scanin),
	.scan_out(pct0_scanout),
	.l2clk			(l2clk				),
	.dec_flush_b		(dec_flush_b		[0   ]	),
	.dec_inst_cnt		(dec_inst0_cnt		[1:0]	),
	.dec_raw_pick_p		(dec_raw_pick_p		[3:0]	),
	.exu_address_m		(tic_exu_address0_m	[47:2]	),
	.exu_oor_va_m		(exu_oor_va_m		[0   ]	),
	.asi_rd_pc		(asi_rd_pc		[3:0]	),
	.asi_wr_iaw		(asi_wr_iaw		[0   ]	),
	.asi_wr_data		(asi_wr_data_0		[47:0]	),
	.fls_tid_dec_b		(fls0_tid_dec_b		[3:0]	),
	.fls_tid_dec_w		(fls0_tid_dec_w		[3:0]	),
	.fls_pc_sel_npc		(fls_pc_sel_npc		[3:0]	),
	.fls_pc_sel_npc_plus_4	(fls_pc_sel_npc_plus_4	[3:0]	),
	.fls_npc_sel_npc_plus_4	(fls_npc_sel_npc_plus_4	[3:0]	),
	.fls_npc_sel_npc_plus_8	(fls_npc_sel_npc_plus_8	[3:0]	),
	.fls_npc_sel_target	(fls_npc_sel_target	[3:0]	),
	.fls_npc_b_sel_npc	(fls0_npc_b_sel_npc		),
	.fls_pc_is_npc		(fls0_pc_is_npc			),
	.fls_pstate_am_d_	(fls_pstate_am_d_	[0   ]	),
	.fls_pstate_am_b_	(fls_pstate_am_b_	[0   ]	),
	.fls_pstate_am_w_	(fls_pstate_am_w_	[0   ]	),
	.fls_npc_if_cnt_eq_1_d	(fls0_npc_if_cnt_eq_1_d	[4:2]	),
	.fls_npc_if_cnt_eq_2_d	(fls0_npc_if_cnt_eq_2_d	[4:2]	),
	.fls_npc_if_cnt_eq_3_d	(fls0_npc_if_cnt_eq_3_d	[4:2]	),
	.fls_pct_pc_en		(fls_pct_pc_en		[3:0]	),
	.fls_pct_npc_en		(fls_pct_npc_en		[3:0]	),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[3:0]	),
	.trl_npc_sel_trap_npc	(trl_npc_sel_trap_npc	[3:0]	),
	.trl_npc_sel_tnpc	(trl_npc_sel_tnpc	[3:0]	),
	.trl_trap_type		(trl0_trap_type		[8:0]	),
	.trl_pc_thread_sel	(trl0_pc_thread_sel	[3:0]	),
	.trl_pc_pstate_am_	(trl_pc_pstate_am_	[0   ]	),
	.trl_pc_sel_pc		(trl_pc_sel_pc		[0   ]	),
	.trl_pc_sel_npc		(trl_pc_sel_npc		[0   ]	),
	.trl_pc_sel_trap	(trl_pc_sel_trap	[0   ]	),
	.trl_pc_sel_reset	(trl_pc_sel_reset	[0   ]	),
	.trl_pc_done		(trl_pc_done		[0   ]	),
	.trl_pc_retry		(trl_pc_retry		[0   ]	),
	.trl_pc_tte		(trl_pc_tte		[0   ]	),
	.trl_pct_trap_pc_en	(trl_pct_trap_pc_en	[0   ]	),
	.trl_pct_tnpc_en	(trl_pct_tnpc_en	[0   ]	),
	.tsd_tba		(tsd0_tba		[47:14]	),
	.tsd_tpc		(tsd0_tpc		[47:2]	),
	.tsd_tpc_oor_va		(tsd_tpc_oor_va		[0   ]	),
	.tsd_tnpc		(tsd0_tnpc		[47:2]	),
	.tsd_tnpc_oor_va	(tsd_tnpc_oor_va	[0   ]	),
	.tsd_tnpc_nonseq	(tsd_tnpc_nonseq	[0   ]	),
	.tsd_asi_data_		(tsd0_asi_data_		[47:2]	),
	.tsd_pstate_am		(tsd_pstate_am		[3:0]	),
	.pct_npc_0_w		(pct_npc_0_w		[3:2]	),
	.pct_npc_1_w		(pct_npc_1_w		[3:2]	),
	.pct_npc_2_w		(pct_npc_2_w		[3:2]	),
	.pct_npc_3_w		(pct_npc_3_w		[3:2]	),
	.pct_asi_data		(pct0_asi_data		[48:2]	),
	.pct_tsa_pc		(pct0_tsa_pc		[47:2]	),
	.pct_tsa_pc_oor_va	(pct_tsa_pc_oor_va	[0   ]	),
	.pct_tsa_npc		(pct0_tsa_npc		[47:2]	),
	.pct_tsa_npc_oor_va	(pct_tsa_npc_oor_va	[0   ]	),
	.pct_tsa_npc_nonseq	(pct_tsa_npc_nonseq	[0   ]	),
	.pct_npc_is_nonseq	(pct_npc_is_nonseq	[3:0]	),
	.pct_pc_oor_va_e	(pct_pc_oor_va_e	[0   ]	),
	.pct_iaw_exc_e		(pct0_iaw_exc_e		[1:0]	),
	.pct_shadow_pc_d	(pct0_shadow_pc_d	[47:2]	),
	.pct_npc_w 		(pct0_npc_w		[47:2]	),
	.pct_target_b 		(pct0_target_b		[47:2]	),
	.pct_trl_wr_data	(pct0_trl_wr_data	[16:0]	),
	.tsd_pc_w 		(tsd_pc_0_w		[10:5]	),
	.tlu_pc_d		(tlu_pc_0_prebuf_d	[47:2]	),
	.tlu_pc_w 		(tlu_pc_0_w		[47:13]	),
	.tlu_trap_pc		(tlu_trap_pc_0		[47:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_wmr_vec_mask(tcu_wmr_vec_mask),
  .mmu_itte_tag_data(mmu_itte_tag_data[47:0]),
  .asi_rd_iaw(asi_rd_iaw)
);

tlu_pct_dp pct1 ( 
	.wmr_scan_in(pct1_wmr_scanin),
	.wmr_scan_out(pct1_wmr_scanout),
	.scan_in(pct1_scanin),
	.scan_out(pct1_scanout),
	.l2clk			(l2clk				),
	.dec_flush_b		(dec_flush_b		[1   ]	),
	.dec_inst_cnt		(dec_inst1_cnt		[1:0]	),
	.dec_raw_pick_p		(dec_raw_pick_p		[7:4]	),
	.exu_address_m		(tic_exu_address1_m	[47:2]	),
	.exu_oor_va_m		(exu_oor_va_m		[1   ]	),
	.asi_rd_pc		(asi_rd_pc		[7:4]	),
	.asi_wr_iaw		(asi_wr_iaw		[1   ]	),
	.asi_wr_data		(asi_wr_data_1		[47:0]	),
	.fls_tid_dec_b		(fls1_tid_dec_b		[3:0]	),
	.fls_tid_dec_w		(fls1_tid_dec_w		[3:0]	),
	.fls_pc_sel_npc		(fls_pc_sel_npc		[7:4]	),
	.fls_pc_sel_npc_plus_4	(fls_pc_sel_npc_plus_4	[7:4]	),
	.fls_npc_sel_npc_plus_4	(fls_npc_sel_npc_plus_4	[7:4]	),
	.fls_npc_sel_npc_plus_8	(fls_npc_sel_npc_plus_8	[7:4]	),
	.fls_npc_sel_target	(fls_npc_sel_target	[7:4]	),
	.fls_npc_b_sel_npc	(fls1_npc_b_sel_npc		),
	.fls_pc_is_npc		(fls1_pc_is_npc			),
	.fls_pstate_am_d_	(fls_pstate_am_d_	[1   ]	),
	.fls_pstate_am_b_	(fls_pstate_am_b_	[1   ]	),
	.fls_pstate_am_w_	(fls_pstate_am_w_	[1   ]	),
	.fls_npc_if_cnt_eq_1_d	(fls1_npc_if_cnt_eq_1_d	[4:2]	),
	.fls_npc_if_cnt_eq_2_d	(fls1_npc_if_cnt_eq_2_d	[4:2]	),
	.fls_npc_if_cnt_eq_3_d	(fls1_npc_if_cnt_eq_3_d	[4:2]	),
	.fls_pct_pc_en		(fls_pct_pc_en		[7:4]	),
	.fls_pct_npc_en		(fls_pct_npc_en		[7:4]	),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[7:4]	),
	.trl_npc_sel_trap_npc	(trl_npc_sel_trap_npc	[7:4]	),
	.trl_npc_sel_tnpc	(trl_npc_sel_tnpc	[7:4]	),
	.trl_trap_type		(trl1_trap_type		[8:0]	),
	.trl_pc_thread_sel	(trl1_pc_thread_sel	[3:0]	),
	.trl_pc_pstate_am_	(trl_pc_pstate_am_	[1   ]	),
	.trl_pc_sel_pc		(trl_pc_sel_pc		[1   ]	),
	.trl_pc_sel_npc		(trl_pc_sel_npc		[1   ]	),
	.trl_pc_sel_trap	(trl_pc_sel_trap	[1   ]	),
	.trl_pc_sel_reset	(trl_pc_sel_reset	[1   ]	),
	.trl_pc_done		(trl_pc_done		[1   ]	),
	.trl_pc_retry		(trl_pc_retry		[1   ]	),
	.trl_pc_tte		(trl_pc_tte		[1   ]	),
	.trl_pct_trap_pc_en	(trl_pct_trap_pc_en	[1   ]	),
	.trl_pct_tnpc_en	(trl_pct_tnpc_en	[1   ]	),
	.tsd_tba		(tsd1_tba		[47:14]	),
	.tsd_tpc		(tsd1_tpc		[47:2]	),
	.tsd_tpc_oor_va		(tsd_tpc_oor_va		[1   ]	),
	.tsd_tnpc		(tsd1_tnpc		[47:2]	),
	.tsd_tnpc_oor_va	(tsd_tnpc_oor_va	[1   ]	),
	.tsd_tnpc_nonseq	(tsd_tnpc_nonseq	[1   ]	),
	.tsd_asi_data_		(tsd1_asi_data_		[47:2]	),
	.tsd_pstate_am		(tsd_pstate_am		[7:4]	),
	.pct_npc_0_w		(pct_npc_4_w		[3:2]	),
	.pct_npc_1_w		(pct_npc_5_w		[3:2]	),
	.pct_npc_2_w		(pct_npc_6_w		[3:2]	),
	.pct_npc_3_w		(pct_npc_7_w		[3:2]	),
	.pct_asi_data		(pct1_asi_data		[48:2]	),
	.pct_tsa_pc		(pct1_tsa_pc		[47:2]	),
	.pct_tsa_pc_oor_va	(pct_tsa_pc_oor_va	[1   ]	),
	.pct_tsa_npc		(pct1_tsa_npc		[47:2]	),
	.pct_tsa_npc_oor_va	(pct_tsa_npc_oor_va	[1   ]	),
	.pct_tsa_npc_nonseq	(pct_tsa_npc_nonseq	[1   ]	),
	.pct_npc_is_nonseq	(pct_npc_is_nonseq	[7:4]	),
	.pct_pc_oor_va_e	(pct_pc_oor_va_e	[1   ]	),
	.pct_iaw_exc_e		(pct1_iaw_exc_e		[1:0]	),
	.pct_shadow_pc_d	(pct1_shadow_pc_d	[47:2]	),
	.pct_npc_w 		(pct1_npc_w		[47:2]	),
	.pct_target_b 		(pct1_target_b		[47:2]	),
	.pct_trl_wr_data	(pct1_trl_wr_data	[16:0]	),
	.tsd_pc_w 		(tsd_pc_1_w		[10:5]	),
	.tlu_pc_d		(tlu_pc_1_d		[47:2]	),
	.tlu_pc_w		(tlu_pc_1_w		[47:13]	),
	.tlu_trap_pc		(tlu_trap_pc_1		[47:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_wmr_vec_mask(tcu_wmr_vec_mask),
  .mmu_itte_tag_data(mmu_itte_tag_data[47:0]),
  .asi_rd_iaw(asi_rd_iaw)
);

tlu_npc_dp npc(
  .pct0_npc_w(pct0_npc_w[47:2]),
  .pct1_npc_w(pct1_npc_w[47:2]),
  .fls1_lsu_inst_w(fls1_lsu_inst_w),
  .tlu_npc_w(tlu_npc_w[47:2]));



////////////////////////////////////////////////////////////////////////////////
// Crossbar Interface
tlu_cxi_ctl cxi (
	.scan_in(cxi_scanin),
	.scan_out(cxi_scanout),
	.l2clk			(l2clk				),
	.lsu_cpx_req		(l15_spc_cpkt		[17:14]	),
	.lsu_cpx_err		(l15_spc_cpkt		[11:10]	),
	.lsu_cpx_sre		(l15_spc_cpkt		[9   ]	),
	.lsu_cpx_err_thread_id	(l15_spc_cpkt		[8:6]	),
	.lsu_cpx_thread_id	(l15_spc_data1		[10:8]	),
	.lsu_cpx_valid		(l15_spc_valid			),
	.lsu_cpx_type		(l15_spc_data1		[15:14]	),
	.lsu_cpx_vector		(l15_spc_data1		[5:0]	),
	.lsu_cpx_prefetch	(l15_spc_cpkt		[0   ]	),
	.spc_ss_complete	(tlu_ss_complete		),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .fls_core_running(fls_core_running[7:0]),
  .fls_ss_request(fls_ss_request),
  .lsu_ext_interrupt(lsu_ext_interrupt),
  .lsu_ext_int_type(lsu_ext_int_type[1:0]),
  .lsu_ext_int_vec(lsu_ext_int_vec[5:0]),
  .lsu_ext_int_tid(lsu_ext_int_tid[2:0]),
  .trl_ss_complete(trl_ss_complete[7:0]),
  .asi_irl_cleared(asi_irl_cleared[7:0]),
  .cth_irl_cleared(cth_irl_cleared[63:0]),
  .tlu_cerer_l2c_socc(tlu_cerer_l2c_socc),
  .tlu_cerer_l2u_socu(tlu_cerer_l2u_socu),
  .tlu_cerer_l2nd(tlu_cerer_l2nd),
  .cxi_xir(cxi_xir[7:0]),
  .cxi_ivt(cxi_ivt[7:0]),
  .cxi_wr_int_dis(cxi_wr_int_dis[7:0]),
  .cxi_int_dis_vec(cxi_int_dis_vec[5:0]),
  .cxi_l2_soc_sre(cxi_l2_soc_sre),
  .cxi_l2_soc_err_type(cxi_l2_soc_err_type[1:0]),
  .cxi_l2_soc_tid(cxi_l2_soc_tid[2:0]),
  .cxi_l2_err(cxi_l2_err),
  .cxi_soc_err(cxi_soc_err)
);

assign l15_spc_cpkt_unused[13:12] = l15_spc_cpkt[13:12];
assign l15_spc_cpkt_unused[5:1] = l15_spc_cpkt[5:1];
assign l15_spc_data1_unused[13:11] = l15_spc_data1[13:11];
assign l15_spc_data1_unused[7:6] = l15_spc_data1[7:6];



////////////////////////////////////////////////////////////////////////////////
// Cross Thread Interrupts
tlu_cth_dp cth ( 
	.wmr_scan_in(cth_wmr_scanin),
	.wmr_scan_out(cth_wmr_scanout),
	.scan_in(cth_scanin),
	.scan_out(cth_scanout),
	.l2clk			(l2clk				),
	.asi_wr_data		(asi_wr_data_0		[63:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[64:56]),
  .cxi_wr_int_dis(cxi_wr_int_dis[7:0]),
  .cxi_int_dis_vec(cxi_int_dis_vec[5:0]),
  .asi_wr_int_rec(asi_wr_int_rec[7:0]),
  .asi_rd_inc_vec_2(asi_rd_inc_vec_2[7:0]),
  .asi_int_rec_mux_sel_in(asi_int_rec_mux_sel_in[2:0]),
  .asi_rd_int_rec(asi_rd_int_rec),
  .asi_rd_inc_vec(asi_rd_inc_vec),
  .asi_wr_any_int_rec(asi_wr_any_int_rec),
  .asi_rd_stage_1(asi_rd_stage_1),
  .dfd_asi_data(dfd_asi_data[47:0]),
  .dfd_asi_desr(dfd_asi_desr[18:0]),
  .cth_wr_data(cth_wr_data[61:0]),
  .cth_asi_data(cth_asi_data[63:0]),
  .cth_irl_cleared(cth_irl_cleared[63:0])
);



////////////////////////////////////////////////////////////////////////////////
// Trap Redirect Logic:  one for each thread group
tlu_trl_ctl trl0 ( 
	.wmr_scan_in(trl0_wmr_scanin),
	.wmr_scan_out(trl0_wmr_scanout),
	.scan_in(trl0_scanin),
	.scan_out(trl0_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b0				),
	.ftu_ifu_quiesce	(ftu_ifu_quiesce	[3:0]	),
	.pku_quiesce		(pku_quiesce		[3:0]	),
	.exu_tlu_window_block	(exu_tlu_window_block	[0   ]	),
	.lsu_stb_empty		(lsu_stb_empty		[3:0]	),
	.mmu_write_itlb		(mmu_write_itlb		[3:0]	),
	.mmu_reload_done	(mmu_reload_done	[3:0]	),
	.mmu_i_unauth_access	(mmu_i_unauth_access	[3:0]	),
	.mmu_i_tsb_miss		(mmu_i_tsb_miss		[3:0]	),
	.mmu_d_tsb_miss		(mmu_d_tsb_miss		[3:0]	),
	.mmu_i_tte_outofrange	(mmu_i_tte_outofrange	[3:0]	),
	.mmu_d_tte_outofrange	(mmu_d_tte_outofrange	[3:0]	),
	.fls_wstate0		(fls_wstate0		[2:0]	),
	.fls_wstate1		(fls_wstate1		[2:0]	),
	.fls_wstate2		(fls_wstate2		[2:0]	),
	.fls_wstate3		(fls_wstate3		[2:0]	),
	.fls_tcc_number_0	(fls_tcc_number_0	[7:0]	),
	.fls_tcc_number_1	(fls_tcc_number_1	[7:0]	),
	.fls_tcc_number_2	(fls_tcc_number_2	[7:0]	),
	.fls_tcc_number_3	(fls_tcc_number_3	[7:0]	),
	.fls_tid_d		(fls0_tid_d		[1:0]	),
	.fls_tid_dec_w_in	(fls_tid_dec_w_in	[3:0]	),
	.fls_por_request	(fls_por_request	[3:0]	),
	.fls_xir_request	(fls_xir_request	[3:0]	),
	.fls_ivt_request	(fls_ivt_request	[3:0]	),
	.fls_sir_request	(fls_sir_request	[3:0]	),
	.fls_itm_request	(fls_itm_request	[3:0]	),
	.fls_iln_request	(fls_iln_request	[3:0]	),
	.fls_hst_request	(fls_hst_request	[3:0]	),
	.fls_tlz_request	(fls_tlz_request	[3:0]	),
	.fls_sma_request	(fls_sma_request	[3:0]	),
	.fls_cwq_request	(fls_cwq_request	[3:0]	),
	.fls_ade_request	(fls_ade_request	[3:0]	),
	.fls_iae_request	(fls_iae_request	[3:0]	),
	.fls_ipe_request	(fls_ipe_request	[3:0]	),
	.fls_ipv_request	(fls_ipv_request	[0   ]	),
	.fls_inp_request	(fls_inp_request	[0   ]	),
	.fls_iar_request	(fls_iar_request	[0   ]	),
	.fls_irr_request	(fls_irr_request	[0   ]	),
	.fls_mar_request	(fls_mar_request	[0   ]	),
	.fls_mrr_request	(fls_mrr_request	[0   ]	),
	.fls_pro_request	(fls_pro_request	[0   ]	),
	.fls_ill_request	(fls_ill_request	[0   ]	),
	.fls_don_request	(fls_don_request	[0   ]	),
	.fls_ret_request	(fls_ret_request	[0   ]	),
	.fls_fpd_request	(fls_fpd_request	[0   ]	),
	.fls_snn_request	(fls_snn_request	[0   ]	),
	.fls_sno_request	(fls_sno_request	[0   ]	),
	.fls_fnn_request	(fls_fnn_request	[0   ]	),
	.fls_fno_request	(fls_fno_request	[0   ]	),
	.fls_clw_request	(fls_clw_request	[0   ]	),
	.fls_dtm_request	(fls_dtm_request	[3:0]	),
	.fls_ldf_request	(fls_ldf_request	[0   ]	),
	.fls_stf_request	(fls_stf_request	[0   ]	),
	.fls_dap_request	(fls_dap_request	[0   ]	),
	.fls_vaw_request	(fls_vaw_request	[0   ]	),
	.fls_iaw_request	(fls_iaw_request	[0   ]	),
	.fls_paw_request	(fls_paw_request	[0   ]	),
	.fls_maa_request	(fls_maa_request	[0   ]	),
	.fls_fpe_request	(fls_fpe_request	[0   ]	),
	.fls_fei_request	(fls_fei_request	[3:0]	),
	.fls_fof_request	(fls_fof_request	[3:0]	),
	.fls_pra_request	(fls_pra_request	[3:0]	),
	.fls_dia_request	(fls_dia_request	[0   ]	),
	.fls_ups_request	(fls_ups_request	[3:0]	),
	.fls_dpv_request	(fls_dpv_request	[0   ]	),
	.fls_dnc_request	(fls_dnc_request	[0   ]	),
	.fls_dnf_request	(fls_dnf_request	[0   ]	),
	.fls_dso_request	(fls_dso_request	[0   ]	),
	.fls_tof_request	(fls_tof_request	[0   ]	),
	.fls_dbz_request	(fls_dbz_request	[3:0]	),
	.fls_tcc_request	(fls_tcc_request	[0   ]	),
	.fls_dae_request	(fls_dae_request	[3:0]	),
	.fls_lsr_request	(fls_lsr_request	[3:0]	),
	.fls_irt_request	(fls_irt_request	[0   ]	),
	.fls_drt_request	(fls_drt_request	[0   ]	),
	.fls_pmu_request	(fls_pmu_request	[3:0]	),
	.fls_mqr_request	(fls_mqr_request	[3:0]	),
	.fls_dqr_request	(fls_dqr_request	[3:0]	),
	.fls_rqr_request	(fls_rqr_request	[3:0]	),
	.fls_idl_request	(fls_idl_request	[3:0]	),
	.fls_res_request	(fls_res_request	[3:0]	),
	.fls_ssr_request	(fls_ssr_request	[3:0]	),
	.fls_ssc_request	(fls_ssc_request	[3:0]	),
	.fls_nns_request	(fls_nns_request	[3:0]	),
	.fls_ime_request	(fls_ime_request	[3:0]	),
	.fls_dme_request	(fls_dme_request	[3:0]	),
	.fls_eer_request	(fls_eer_request	[3:0]	),
	.fls_icp_request	(fls_icp_request	[0   ]	),
	.fls_ftt_request	(fls_ftt_request	[3:0]	),
	.fls_ibp_request	(fls_ibp_request	[0   ]	),
	.fls_tct_request	(fls_tct_request	[0   ]	),
	.fls_ref_request	(fls_ref_request	[0   ]	),
	.fls_pc_valid		(fls_pc_valid		[3:0]	),
	.pmu_tlu_trap_m		(pmu_tlu_trap_m		[3:0]	),
	.fls_trl_l1en		(fls_trl_l1en		[3:0]	),
	.fls_core_running	(fls_core_running	[3:0]	),
	.tlu_flush_ifu		(tlu_flush_ifu		[3:0]	),
	.pct_npc_is_nonseq	(pct_npc_is_nonseq	[3:0]	),
	.trlx_itw_wait		(1'b0				),
	.trlx_itw_last		(trl1_itw_last			),
	.tsa_gl			(tsa0_gl		[1:0]	),
	.tsa_tnpc_nonseq	(tsa_tnpc_nonseq	[0   ]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[3:0]	),
	.tlu_ceter_de		(tlu_ceter_de		[3:0]	),
	.tlu_ceter_pscce	(tlu_ceter_pscce	[3:0]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[3:0]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[3:0]	),
	.tsd_hpstate_tlz	(tsd_hpstate_tlz	[3:0]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[3:0]	),
	.tsd_pstate_am		(tsd_pstate_am		[3:0]	),
	.tsd_htstate_hpriv	(tsd_htstate_hpriv	   [0]	),
	.asi_rd_tl		(asi_rd_tl		[3:0]	),
	.asi_wr_tl		(asi_wr_tl		[3:0]	),
	.asi_rd_pil		(asi_rd_pil		[3:0]	),
	.asi_wr_pil		(asi_wr_pil		[3:0]	),
	.asi_rd_gl		(asi_rd_gl		[3:0]	),
	.asi_wr_gl		(asi_wr_gl		[3:0]	),
	.asi_wr_set_softint	(asi_wr_set_softint	[3:0]	),
	.asi_wr_clear_softint	(asi_wr_clear_softint	[3:0]	),
	.asi_rd_softint		(asi_rd_softint		[3:0]	),
	.asi_wr_softint		(asi_wr_softint		[3:0]	),
	.asi_rd_hintp		(asi_rd_hintp		[3:0]	),
	.asi_wr_hintp		(asi_wr_hintp		[3:0]	),
	.asi_wr_data		(pct0_trl_wr_data	[16:0]	),
	.asi_preempt_trap	(asi_preempt_trap	[0   ]	),
	.asi_preempt_done_retry	(asi_preempt_done_retry	[0   ]	),
	.asi_rmw_tsa		(asi_rmw_tsa		[0   ]	),
	.asi_wr_asireg		(asi_wr_asireg		[3:0]	),
	.asi_trl_pstate_en	(asi_trl_pstate_en	[0   ]	),
	.asi_mbist_tsa_rd_en	(asi_mbist_tsa_rd_en	[0   ]	),
	.asi_mbist_tsa_wr_en	(asi_mbist_tsa_wr_en	[0   ]	),
	.spc_core_running_status(tlu_core_running_status[3:0]	),
	.trl_core_running_status(trl_core_running_status[3:0]	),
	.trl_pil_mask_15	(trl_pil_mask_15	[3:0]	),
	.trl_iln_exc		(trl_iln_exc		[3:0]	),
	.trl_hstick_match	(trl_hstick_match	[3:0]	),
	.trl_unhalt_		(trl_unhalt_		[3:0]	),
	.trl_tlz_exc		(trl_tlz_exc		[3:0]	),
	.trl_nns_exc		(trl_nns_exc		[3:0]	),
	.trl_ssc_exc		(trl_ssc_exc		[3:0]	),
	.trl_take_sma		(trl0_take_sma			),
	.trl_take_cwq		(trl0_take_cwq			),
	.trl_take_xir		(trl0_take_xir			),
	.trl_take_ftt		(trl0_take_ftt			),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[3:0]	),
	.trl_npc_sel_trap_npc	(trl_npc_sel_trap_npc	[3:0]	),
	.trl_npc_sel_tnpc	(trl_npc_sel_tnpc	[3:0]	),
	.trl_invalidate_pc	(trl_invalidate_pc	[3:0]	),
	.trl_invalidate_npc	(trl_invalidate_npc	[3:0]	),
	.trl_trap_type		(trl0_trap_type		[8:0]	),
	.trl_tsa_trap_type	(trl0_tsa_trap_type	[8:0]	),
	.trl_asireg_sel		(trl0_asireg_sel	[4:0]	),
	.trl_asireg_en		(trl0_asireg_en			),
	.trl_thread_sel		(trl0_thread_sel	[3:0]	),
	.trl_tba_sel		(trl0_tba_sel		[2:0]	),
	.trl_pc_thread_sel	(trl0_pc_thread_sel	[3:0]	),
	.trl_pc_pstate_am_	(trl_pc_pstate_am_	[0   ]	),
	.trl_pstate_thread_sel	(trl0_pstate_thread_sel	[4:0]	),
	.trl_don_ret_pstate_sel	(trl0_don_ret_pstate_sel[3:0]	),
	.trl_pstate_en		(trl0_pstate_en			),
	.trl_pc_sel_pc		(trl_pc_sel_pc		[0   ]	),
	.trl_pc_sel_npc		(trl_pc_sel_npc		[0   ]	),
	.trl_pc_sel_trap	(trl_pc_sel_trap	[0   ]	),
	.trl_pc_sel_reset	(trl_pc_sel_reset	[0   ]	),
	.trl_pc_done		(trl_pc_done		[0   ]	),
	.trl_pc_retry		(trl_pc_retry		[0   ]	),
	.trl_pc_tte		(trl_pc_tte		[0   ]	),
	.trl_pct_trap_pc_en	(trl_pct_trap_pc_en	[0   ]	),
	.trl_pct_tnpc_en	(trl_pct_tnpc_en	[0   ]	),
	.trl_reset_trap		(trl_reset_trap		[0   ]	),
	.trl_other_trap		(trl_other_trap		[0   ]	),
	.trl_stay_in_priv	(trl_stay_in_priv	[0   ]	),
	.trl_tsa_wr_en		(trl_tsa_wr_en_pre	[0   ]	),
	.trl_tsa_wr_addr	(trl0_tsa_wr_addr	[4:0]	),
	.trl_tsa_rd_en		(trl_tsa_rd_en		[0   ]	),
	.trl_tsa_rd_addr	(trl0_tsa_rd_addr	[4:0]	),
	.trl_save_tsa		(trl0_save_tsa			),
	.trl_tsd_tsa_en		(trl0_tsd_tsa_en		),
	.trl_tsd_tsa_wd_en	(trl0_tsd_tsa_wd_en		),
	.trl_capture_ss		(trl0_capture_ss		),
	.trl_rmw_tsa		(trl0_rmw_tsa			),
	.trl_tl_gt_0		(trl_tl_gt_0		[0   ]	),
	.trl_tl_eq_0		(trl_tl_eq_0		[3:0]	),
	.trl_tsa_gl		(trl0_tsa_gl		[1:0]	),
	.trl_asi_data		(trl0_asi_data		[16:0]	),
	.trl_ss_complete	(trl_ss_complete	[3:0]	),
	.trl_itw_wait		(trl0_itw_wait			),
	.trl_itw_last		(trl0_itw_last			),
	.trl_shscanid		(trl0_shscanid		[1:0]	),
	.trl_shscanid_2		(trl0_shscanid_2		),
	.trl_shadow_tl		(trl0_shadow_tl		[2:0]	),
	.trl_tl_for_tt		(trl0_tl_for_tt		[2:0]	),
	.trl_fls_npc_en		(trl_fls_npc_en		[3:0]	),
	.trl_trap_taken		(trl_trap_taken		[3:0]	),
	.trl_tel_en		(trl_tel_en		[0   ]	),
	.trl_gl0		(trl_gl0		[1:0]	),
	.trl_gl1		(trl_gl1		[1:0]	),
	.trl_gl2		(trl_gl2		[1:0]	),
	.trl_gl3		(trl_gl3		[1:0]	),
	.trl_tsacu_en_in	(trl_tsacu_en_in	[3:0]	),
	.tlu_tsa_index		(tlu_tsa_index_0	[2:0]	),
	.tlu_tccd		(tlu_tccd		[3:0]	),
	.tlu_tcud		(tlu_tcud		[3:0]	),
	.tlu_tca_index		(tlu_tca_index_0	[1:0]	),
	.tlu_window_block	(tlu_window_block	[0   ]	),
	.tlu_trap_pc_valid	(tlu_trap_pc_0_valid		),
	.tlu_retry		(tlu_retry		[0   ]	),
	.tlu_ifu_invalidate	(tlu_ifu_invalidate	[0   ]	),
	.tlu_trap_tid		(tlu_trap_0_tid		[1:0]	),
	.tlu_itlb_reload	(tlu_itlb_reload	[0   ]	),
	.tlu_ccr_cwp_valid	(tlu_ccr_cwp_0_valid		),
	.tlu_ccr_cwp_tid	(tlu_ccr_cwp_0_tid	[1:0]	),
	.tlu_asi_valid		(tlu_asi_0_valid		),
	.tlu_asi_tid		(tlu_asi_0_tid		[1:0]	),
	.tlu_gl0		(tlu_gl0		[1:0]	),
	.tlu_gl1		(tlu_gl1		[1:0]	),
	.tlu_gl2		(tlu_gl2		[1:0]	),
	.tlu_gl3		(tlu_gl3		[1:0]	),
	.tlu_tl_gt_0		(tlu_tl_gt_0		[3:0]	),
	.tlu_mmu_tl_gt_0	(tlu_mmu_tl_gt_0	[3:0]	),
	.tlu_release_tte	(tlu_release_tte	[3:0]	),
	.tlu_lsu_clear_ctl_reg_	(tlu_lsu_clear_ctl_reg_	[3:0]	),
	.tlu_pmu_trap_taken	(tlu_pmu_trap_taken	[3:0]	),
	.tlu_pmu_trap_mask_e	(tlu_pmu_trap_mask_e	[0   ]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .tcu_shscanid(tcu_shscanid[2:0]),
  .tcu_ss_mode(tcu_ss_mode),
  .tcu_do_mode(tcu_do_mode),
  .mbi_run(mbi_run),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .spu_pmu_ma_busy(spu_pmu_ma_busy),
  .spu_tlu_cwq_busy(spu_tlu_cwq_busy),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[2:0]),
  .tic_addr(tic_addr[4:0]),
  .tic_not_valid(tic_not_valid),
  .tic_match(tic_match),
  .cel_tccd(cel_tccd),
  .cel_tcud(cel_tcud),
  .asi_tsa_rd_addr(asi_tsa_rd_addr[4:0]),
  .asi_tsa_rd_iqr_ecc(asi_tsa_rd_iqr_ecc),
  .asi_tsa_tid(asi_tsa_tid[1:0]),
  .asi_mbist_addr(asi_mbist_addr[4:0])
);

tlu_trl_ctl trl1 ( 
	.wmr_scan_in(trl1_wmr_scanin),
	.wmr_scan_out(trl1_wmr_scanout),
	.scan_in(trl1_scanin),
	.scan_out(trl1_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b1				),
	.ftu_ifu_quiesce	(ftu_ifu_quiesce	[7:4]	),
	.pku_quiesce		(pku_quiesce		[7:4]	),
	.exu_tlu_window_block	(exu_tlu_window_block	[1   ]	),
	.lsu_stb_empty		(lsu_stb_empty		[7:4]	),
	.mmu_write_itlb		(mmu_write_itlb		[7:4]	),
	.mmu_reload_done	(mmu_reload_done	[7:4]	),
	.mmu_i_unauth_access	(mmu_i_unauth_access	[7:4]	),
	.mmu_i_tsb_miss		(mmu_i_tsb_miss		[7:4]	),
	.mmu_d_tsb_miss		(mmu_d_tsb_miss		[7:4]	),
	.mmu_i_tte_outofrange	(mmu_i_tte_outofrange	[7:4]	),
	.mmu_d_tte_outofrange	(mmu_d_tte_outofrange	[7:4]	),
	.fls_wstate0		(fls_wstate4		[2:0]	),
	.fls_wstate1		(fls_wstate5		[2:0]	),
	.fls_wstate2		(fls_wstate6		[2:0]	),
	.fls_wstate3		(fls_wstate7		[2:0]	),
	.fls_tcc_number_0	(fls_tcc_number_4	[7:0]	),
	.fls_tcc_number_1	(fls_tcc_number_5	[7:0]	),
	.fls_tcc_number_2	(fls_tcc_number_6	[7:0]	),
	.fls_tcc_number_3	(fls_tcc_number_7	[7:0]	),
	.fls_tid_d		(fls1_tid_d		[1:0]	),
	.fls_tid_dec_w_in	(fls_tid_dec_w_in	[7:4]	),
	.fls_por_request	(fls_por_request	[7:4]	),
	.fls_xir_request	(fls_xir_request	[7:4]	),
	.fls_ivt_request	(fls_ivt_request	[7:4]	),
	.fls_sir_request	(fls_sir_request	[7:4]	),
	.fls_itm_request	(fls_itm_request	[7:4]	),
	.fls_iln_request	(fls_iln_request	[7:4]	),
	.fls_hst_request	(fls_hst_request	[7:4]	),
	.fls_tlz_request	(fls_tlz_request	[7:4]	),
	.fls_sma_request	(fls_sma_request	[7:4]	),
	.fls_cwq_request	(fls_cwq_request	[7:4]	),
	.fls_ade_request	(fls_ade_request	[7:4]	),
	.fls_iae_request	(fls_iae_request	[7:4]	),
	.fls_ipe_request	(fls_ipe_request	[7:4]	),
	.fls_ipv_request	(fls_ipv_request	[1   ]	),
	.fls_inp_request	(fls_inp_request	[1   ]	),
	.fls_iar_request	(fls_iar_request	[1   ]	),
	.fls_irr_request	(fls_irr_request	[1   ]	),
	.fls_mar_request	(fls_mar_request	[1   ]	),
	.fls_mrr_request	(fls_mrr_request	[1   ]	),
	.fls_pro_request	(fls_pro_request	[1   ]	),
	.fls_ill_request	(fls_ill_request	[1   ]	),
	.fls_don_request	(fls_don_request	[1   ]	),
	.fls_ret_request	(fls_ret_request	[1   ]	),
	.fls_fpd_request	(fls_fpd_request	[1   ]	),
	.fls_snn_request	(fls_snn_request	[1   ]	),
	.fls_sno_request	(fls_sno_request	[1   ]	),
	.fls_fnn_request	(fls_fnn_request	[1   ]	),
	.fls_fno_request	(fls_fno_request	[1   ]	),
	.fls_clw_request	(fls_clw_request	[1   ]	),
	.fls_dtm_request	(fls_dtm_request	[7:4]	),
	.fls_ldf_request	(fls_ldf_request	[1   ]	),
	.fls_stf_request	(fls_stf_request	[1   ]	),
	.fls_dap_request	(fls_dap_request	[1   ]	),
	.fls_vaw_request	(fls_vaw_request	[1   ]	),
	.fls_iaw_request	(fls_iaw_request	[1   ]	),
	.fls_paw_request	(fls_paw_request	[1   ]	),
	.fls_maa_request	(fls_maa_request	[1   ]	),
	.fls_fpe_request	(fls_fpe_request	[1   ]	),
	.fls_fei_request	(fls_fei_request	[7:4]	),
	.fls_fof_request	(fls_fof_request	[7:4]	),
	.fls_pra_request	(fls_pra_request	[7:4]	),
	.fls_dia_request	(fls_dia_request	[1   ]	),
	.fls_ups_request	(fls_ups_request	[7:4]	),
	.fls_dpv_request	(fls_dpv_request	[1   ]	),
	.fls_dnc_request	(fls_dnc_request	[1   ]	),
	.fls_dnf_request	(fls_dnf_request	[1   ]	),
	.fls_dso_request	(fls_dso_request	[1   ]	),
	.fls_tof_request	(fls_tof_request	[1   ]	),
	.fls_dbz_request	(fls_dbz_request	[7:4]	),
	.fls_tcc_request	(fls_tcc_request	[1   ]	),
	.fls_dae_request	(fls_dae_request	[7:4]	),
	.fls_lsr_request	(fls_lsr_request	[7:4]	),
	.fls_irt_request	(fls_irt_request	[1   ]	),
	.fls_drt_request	(fls_drt_request	[1   ]	),
	.fls_pmu_request	(fls_pmu_request	[7:4]	),
	.fls_mqr_request	(fls_mqr_request	[7:4]	),
	.fls_dqr_request	(fls_dqr_request	[7:4]	),
	.fls_rqr_request	(fls_rqr_request	[7:4]	),
	.fls_idl_request	(fls_idl_request	[7:4]	),
	.fls_res_request	(fls_res_request	[7:4]	),
	.fls_ssr_request	(fls_ssr_request	[7:4]	),
	.fls_ssc_request	(fls_ssc_request	[7:4]	),
	.fls_nns_request	(fls_nns_request	[7:4]	),
	.fls_ime_request	(fls_ime_request	[7:4]	),
	.fls_dme_request	(fls_dme_request	[7:4]	),
	.fls_eer_request	(fls_eer_request	[7:4]	),
	.fls_icp_request	(fls_icp_request	[1   ]	),
	.fls_ftt_request	(fls_ftt_request	[7:4]	),
	.fls_ibp_request	(fls_ibp_request	[1   ]	),
	.fls_tct_request	(fls_tct_request	[1   ]	),
	.fls_ref_request	(fls_ref_request	[1   ]	),
	.fls_pc_valid		(fls_pc_valid		[7:4]	),
	.pmu_tlu_trap_m		(pmu_tlu_trap_m		[7:4]	),
	.fls_trl_l1en		(fls_trl_l1en		[7:4]	),
	.fls_core_running	(fls_core_running	[7:4]	),
	.tlu_flush_ifu		(tlu_flush_ifu		[7:4]	),
	.pct_npc_is_nonseq	(pct_npc_is_nonseq	[7:4]	),
	.trlx_itw_wait		(trl0_itw_wait			),
	.trlx_itw_last		(trl0_itw_last			),
	.tsa_gl			(tsa1_gl		[1:0]	),
	.tsa_tnpc_nonseq	(tsa_tnpc_nonseq	[1   ]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[7:4]	),
	.tlu_ceter_de		(tlu_ceter_de		[7:4]	),
	.tlu_ceter_pscce	(tlu_ceter_pscce	[7:4]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[7:4]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[7:4]	),
	.tsd_hpstate_tlz	(tsd_hpstate_tlz	[7:4]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[7:4]	),
	.tsd_pstate_am		(tsd_pstate_am		[7:4]	),
	.tsd_htstate_hpriv	(tsd_htstate_hpriv	   [1]	),
	.asi_rd_tl		(asi_rd_tl		[7:4]	),
	.asi_wr_tl		(asi_wr_tl		[7:4]	),
	.asi_rd_pil		(asi_rd_pil		[7:4]	),
	.asi_wr_pil		(asi_wr_pil		[7:4]	),
	.asi_rd_gl		(asi_rd_gl		[7:4]	),
	.asi_wr_gl		(asi_wr_gl		[7:4]	),
	.asi_wr_set_softint	(asi_wr_set_softint	[7:4]	),
	.asi_wr_clear_softint	(asi_wr_clear_softint	[7:4]	),
	.asi_rd_softint		(asi_rd_softint		[7:4]	),
	.asi_wr_softint		(asi_wr_softint		[7:4]	),
	.asi_rd_hintp		(asi_rd_hintp		[7:4]	),
	.asi_wr_hintp		(asi_wr_hintp		[7:4]	),
	.asi_wr_data		(pct1_trl_wr_data	[16:0]	),
	.asi_preempt_trap	(asi_preempt_trap	[1   ]	),
	.asi_preempt_done_retry	(asi_preempt_done_retry	[1   ]	),
	.asi_rmw_tsa		(asi_rmw_tsa		[1   ]	),
	.asi_wr_asireg		(asi_wr_asireg		[7:4]	),
	.asi_trl_pstate_en	(asi_trl_pstate_en	[1   ]	),
	.asi_mbist_tsa_rd_en	(asi_mbist_tsa_rd_en	[1   ]	),
	.asi_mbist_tsa_wr_en	(asi_mbist_tsa_wr_en	[1   ]	),
	.spc_core_running_status(tlu_core_running_status[7:4]	),
	.trl_core_running_status(trl_core_running_status[7:4]	),
	.trl_pil_mask_15	(trl_pil_mask_15	[7:4]	),
	.trl_iln_exc		(trl_iln_exc		[7:4]	),
	.trl_hstick_match	(trl_hstick_match	[7:4]	),
	.trl_unhalt_		(trl_unhalt_		[7:4]	),
	.trl_tlz_exc		(trl_tlz_exc		[7:4]	),
	.trl_nns_exc		(trl_nns_exc		[7:4]	),
	.trl_ssc_exc		(trl_ssc_exc		[7:4]	),
	.trl_take_sma		(trl1_take_sma			),
	.trl_take_cwq		(trl1_take_cwq			),
	.trl_take_xir		(trl1_take_xir			),
	.trl_take_ftt		(trl1_take_ftt			),
	.trl_pc_sel_trap_pc	(trl_pc_sel_trap_pc	[7:4]	),
	.trl_npc_sel_trap_npc	(trl_npc_sel_trap_npc	[7:4]	),
	.trl_npc_sel_tnpc	(trl_npc_sel_tnpc	[7:4]	),
	.trl_invalidate_pc	(trl_invalidate_pc	[7:4]	),
	.trl_invalidate_npc	(trl_invalidate_npc	[7:4]	),
	.trl_trap_type		(trl1_trap_type		[8:0]	),
	.trl_tsa_trap_type	(trl1_tsa_trap_type	[8:0]	),
	.trl_asireg_sel		(trl1_asireg_sel	[4:0]	),
	.trl_asireg_en		(trl1_asireg_en			),
	.trl_thread_sel		(trl1_thread_sel	[3:0]	),
	.trl_tba_sel		(trl1_tba_sel		[2:0]	),
	.trl_pstate_thread_sel	(trl1_pstate_thread_sel	[4:0]	),
	.trl_don_ret_pstate_sel	(trl1_don_ret_pstate_sel[3:0]	),
	.trl_pstate_en		(trl1_pstate_en			),
	.trl_pc_thread_sel	(trl1_pc_thread_sel	[3:0]	),
	.trl_pc_pstate_am_	(trl_pc_pstate_am_	[1   ]	),
	.trl_pc_sel_pc		(trl_pc_sel_pc		[1   ]	),
	.trl_pc_sel_npc		(trl_pc_sel_npc		[1   ]	),
	.trl_pc_sel_trap	(trl_pc_sel_trap	[1   ]	),
	.trl_pc_sel_reset	(trl_pc_sel_reset	[1   ]	),
	.trl_pc_done		(trl_pc_done		[1   ]	),
	.trl_pc_retry		(trl_pc_retry		[1   ]	),
	.trl_pc_tte		(trl_pc_tte		[1   ]	),
	.trl_pct_trap_pc_en	(trl_pct_trap_pc_en	[1   ]	),
	.trl_pct_tnpc_en	(trl_pct_tnpc_en	[1   ]	),
	.trl_reset_trap		(trl_reset_trap		[1   ]	),
	.trl_other_trap		(trl_other_trap		[1   ]	),
	.trl_stay_in_priv	(trl_stay_in_priv	[1   ]	),
	.trl_tsa_wr_en		(trl_tsa_wr_en_pre	[1   ]	),
	.trl_tsa_wr_addr	(trl1_tsa_wr_addr	[4:0]	),
	.trl_tsa_rd_en		(trl_tsa_rd_en		[1   ]	),
	.trl_tsa_rd_addr	(trl1_tsa_rd_addr	[4:0]	),
	.trl_save_tsa		(trl1_save_tsa			),
	.trl_tsd_tsa_en		(trl1_tsd_tsa_en		),
	.trl_tsd_tsa_wd_en	(trl1_tsd_tsa_wd_en		),
	.trl_capture_ss		(trl1_capture_ss		),
	.trl_rmw_tsa		(trl1_rmw_tsa			),
	.trl_tl_gt_0		(trl_tl_gt_0		[1   ]	),
	.trl_tl_eq_0		(trl_tl_eq_0		[7:4]	),
	.trl_tsa_gl		(trl1_tsa_gl		[1:0]	),
	.trl_asi_data		(trl1_asi_data		[16:0]	),
	.trl_ss_complete	(trl_ss_complete	[7:4]	),
	.trl_itw_wait		(trl1_itw_wait_unused		),
	.trl_itw_last		(trl1_itw_last			),
	.trl_shscanid		(trl1_shscanid		[1:0]	),
	.trl_shscanid_2		(trl1_shscanid_2		),
	.trl_shadow_tl		(trl1_shadow_tl		[2:0]	),
	.trl_tl_for_tt		(trl1_tl_for_tt		[2:0]	),
	.trl_fls_npc_en		(trl_fls_npc_en		[7:4]	),
	.trl_trap_taken		(trl_trap_taken		[7:4]	),
	.trl_tel_en		(trl_tel_en		[1   ]	),
	.trl_gl0		(trl_gl4		[1:0]	),
	.trl_gl1		(trl_gl5		[1:0]	),
	.trl_gl2		(trl_gl6		[1:0]	),
	.trl_gl3		(trl_gl7		[1:0]	),
	.trl_tsacu_en_in	(trl_tsacu_en_in	[7:4]	),
	.tlu_tsa_index		(tlu_tsa_index_1	[2:0]	),
	.tlu_tccd		(tlu_tccd		[7:4]	),
	.tlu_tcud		(tlu_tcud		[7:4]	),
	.tlu_tca_index		(tlu_tca_index_1	[1:0]	),
	.tlu_window_block	(tlu_window_block	[1]	),
	.tlu_trap_pc_valid	(tlu_trap_pc_1_valid		),
	.tlu_retry		(tlu_retry		[1   ]	),
	.tlu_ifu_invalidate	(tlu_ifu_invalidate	[1   ]	),
	.tlu_trap_tid		(tlu_trap_1_tid		[1:0]	),
	.tlu_itlb_reload	(tlu_itlb_reload	[1   ]	),
	.tlu_ccr_cwp_valid	(tlu_ccr_cwp_1_valid		),
	.tlu_ccr_cwp_tid	(tlu_ccr_cwp_1_tid	[1:0]	),
	.tlu_asi_valid		(tlu_asi_1_valid		),
	.tlu_asi_tid		(tlu_asi_1_tid		[1:0]	),
	.tlu_gl0		(tlu_gl4		[1:0]	),
	.tlu_gl1		(tlu_gl5		[1:0]	),
	.tlu_gl2		(tlu_gl6		[1:0]	),
	.tlu_gl3		(tlu_gl7		[1:0]	),
	.tlu_tl_gt_0		(tlu_tl_gt_0		[7:4]	),
	.tlu_mmu_tl_gt_0	(tlu_mmu_tl_gt_0	[7:4]	),
	.tlu_release_tte	(tlu_release_tte	[7:4]	),
	.tlu_lsu_clear_ctl_reg_	(tlu_lsu_clear_ctl_reg_	[7:4]	),
	.tlu_pmu_trap_taken	(tlu_pmu_trap_taken	[7:4]	),
	.tlu_pmu_trap_mask_e	(tlu_pmu_trap_mask_e	[1   ]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .tcu_shscanid(tcu_shscanid[2:0]),
  .tcu_ss_mode(tcu_ss_mode),
  .tcu_do_mode(tcu_do_mode),
  .mbi_run(mbi_run),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .spu_pmu_ma_busy(spu_pmu_ma_busy),
  .spu_tlu_cwq_busy(spu_tlu_cwq_busy),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[2:0]),
  .tic_addr(tic_addr[4:0]),
  .tic_not_valid(tic_not_valid),
  .tic_match(tic_match),
  .cel_tccd(cel_tccd),
  .cel_tcud(cel_tcud),
  .asi_tsa_rd_addr(asi_tsa_rd_addr[4:0]),
  .asi_tsa_rd_iqr_ecc(asi_tsa_rd_iqr_ecc),
  .asi_tsa_tid(asi_tsa_tid[1:0]),
  .asi_mbist_addr(asi_mbist_addr[4:0])
);



////////////////////////////////////////////////////////////////////////////////
// Trap Stack Array and associated datapath
//   GL      CCR    ASI   PSTATE  CWP
//  41 40   39 32  31 24  19   8  4 0

// ECC generation for 136 bits

assign teg0_data_in[135:0] =
	{tsd_wr_tpc_oor_va	[0   ],
	 tsd_wr_tnpc_oor_va	[0   ],
	 tsd_wr_tnpc_nonseq	[0   ],
	 tsd0_wr_gl		[1:0],
	 tsd0_wr_data		[29:0],
	 tsd0_wr_trap_type	[8:0],
	 tsd0_wr_tpc		[47:23],
	 tsd0_wr_tpc		[22:2],
	 tsd0_wr_tnpc		[47:2]};

tlu_ecg_dp teg01 (
	.data_in		(teg0_data_in		[135:68]),
	.ecc_out		(teg0_ecc		[15:8]	)
);

tlu_ecg_dp teg00 (
	.data_in		(teg0_data_in		[67:0]	),
	.ecc_out		(teg0_ecc		[7:0]	)
);

tlu_eem_dp tem01 (
	.asi_error_inject	(asi_error_tsau			),
	.asi_mbist_ecc_in	(asi_mbist_tsa_ecc_in	[7:0]	),
	.ecc_in			(teg0_ecc		[15:8]	),
	.ecc_out		(tem0_ecc		[15:8]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

tlu_eem_dp tem00 (
	.asi_error_inject	(asi_error_tsau			),
	.asi_mbist_ecc_in	(asi_mbist_tsa_ecc_in	[7:0]	),
	.ecc_in			(teg0_ecc		[7:0]	),
	.ecc_out		(tem0_ecc		[7:0]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

// ECC error detection for 136 bits
tlu_tel_dp tel0 (
	.scan_in(tel0_scanin),
	.scan_out(tel0_scanout),
	.l2clk			(l2clk				),
	.trl_tel_en		(trl_tel_en		[0   ]	),
	.asi_mbist_tel_en	(asi_mbist_tel_en	[0   ]	),
	.tsa_ecc		(tsa0_ecc		[15:0]	),
	.ted_syndrome		(ted0_syndrome		[15:0]	),
	.ted0_cecc_err		(ted00_cecc_err			),
	.ted0_uecc_err		(ted00_uecc_err			),
	.ted0_uecc_err_		(ted00_uecc_err_		),
	.ted1_cecc_err		(ted01_cecc_err			),
	.ted1_uecc_err		(ted01_uecc_err			),
	.ted1_uecc_err_		(ted01_uecc_err_		),
	.trl_tsacu_en_in	(trl_tsacu_en_in	[3:0]	),
	.tel_syndrome		(tel0_syndrome		[15:0]	),
	.tel_ecc		(tel0_ecc		[15:0]	),
	.tel_crit_ecc		(tel0_crit_ecc		[15:0]	),
	.tel_tsac		(tel0_tsac			),
	.tel_tsau		(tel0_tsau			),
	.tel_tsac_exc		(tlu_tsac		[3:0]	),
	.tel_tsau_exc		(tlu_tsau		[3:0]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[3:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

tlu_ecd_dp ted01 (
	.data_in		(tsd0_ted_mra_rd_data	[135:68]),
	.ecc_in			(tel0_crit_ecc		[15:8]	),
	.cerer_ce		(tlu_cerer_tsac			),
	.cerer_ue		(tlu_cerer_tsau			),
	.syndrome		(ted0_syndrome		[15:8]	),
	.cecc_err		(ted01_cecc_err			),
	.uecc_err		(ted01_uecc_err			),
	.uecc_err_		(ted01_uecc_err_		)
);

tlu_ecd_dp ted00 (
	.data_in		(tsd0_ted_mra_rd_data	[67:0]	),
	.ecc_in			(tel0_crit_ecc		[7:0]	),
	.cerer_ce		(tlu_cerer_tsac			),
	.cerer_ue		(tlu_cerer_tsau			),
	.syndrome		(ted0_syndrome		[7:0]	),
	.cecc_err		(ted00_cecc_err			),
	.uecc_err		(ted00_uecc_err			),
	.uecc_err_		(ted00_uecc_err_		)
);

tlu_tsb_dp tsb0 (
	.tsb_in			(teg0_data_in		[135:0]	),
        .wr_en_in		(trl_tsa_wr_en_pre	[0   ] ),
        .ecc_error		(asi_tsacu		[0   ] ),
	.tsb_out		(tsb0_data_out		[135:0]	),
        .wr_en_out		(trl_tsa_wr_en		[0   ] )
);

n2_com_dp_32x152_cust tsa0 (
	.scan_in(tsa0_scanin),
	.scan_out(tsa0_scanout),
	.rdclk			(l2clk				),
	.wrclk			(l2clk				),
	.tcu_aclk		(spc_aclk			),
	.tcu_bclk		(spc_bclk			),
	.rd_adr			(trl0_tsa_rd_addr	[4:0]	),
	.rd_en			(trl_tsa_rd_en		[0   ]	),
	.wr_adr			(trl0_tsa_wr_addr	[4:0]	),
	.wr_en			(trl_tsa_wr_en		[0   ]	),
	.din			({tsb0_data_out		[135:134],
				  tem0_ecc		[15:0],
				  tsb0_data_out		[133:0]}),
	.dout			({tsa_tpc_oor_va	[0   ],
				  tsa_tnpc_oor_va	[0   ],
				  tsa0_ecc		[15:0],
				  tsa_tnpc_nonseq	[0   ],
				  tsa0_gl		[1:0],
				  tsa0_rd_data		[29:0],
				  tsa0_trap_type	[8:0],
				  tsa0_tpc		[47:2],
				  tsa0_tnpc		[47:2]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);


// ECC generation for 136 bits
assign teg1_data_in[135:0] =
	{tsd_wr_tpc_oor_va	[1   ],
	 tsd_wr_tnpc_oor_va	[1   ],
	 tsd_wr_tnpc_nonseq	[1   ],
	 tsd1_wr_gl		[1:0],
	 tsd1_wr_data		[29:0],
	 tsd1_wr_trap_type	[8:0],
	 tsd1_wr_tpc		[47:23],
	 tsd1_wr_tpc		[22:2],
	 tsd1_wr_tnpc		[47:2]};

tlu_ecg_dp teg11 (
	.data_in		(teg1_data_in		[135:68]),
	.ecc_out		(teg1_ecc		[15:8]	)
);

tlu_ecg_dp teg10 (
	.data_in		(teg1_data_in		[67:0]	),
	.ecc_out		(teg1_ecc		[7:0]	)
);

tlu_eem_dp tem11 (
	.asi_error_inject	(asi_error_tsau			),
	.asi_mbist_ecc_in	(asi_mbist_tsa_ecc_in	[7:0]	),
	.ecc_in			(teg1_ecc		[15:8]	),
	.ecc_out		(tem1_ecc		[15:8]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

tlu_eem_dp tem10 (
	.asi_error_inject	(asi_error_tsau			),
	.asi_mbist_ecc_in	(asi_mbist_tsa_ecc_in	[7:0]	),
	.ecc_in			(teg1_ecc		[7:0]	),
	.ecc_out		(tem1_ecc		[7:0]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

// ECC error detection for 136 bits
tlu_tel_dp tel1 (
	.scan_in(tel1_scanin),
	.scan_out(tel1_scanout),
	.l2clk			(l2clk				),
	.trl_tel_en		(trl_tel_en		[1   ]	),
	.asi_mbist_tel_en	(asi_mbist_tel_en	[1   ]	),
	.tsa_ecc		(tsa1_ecc		[15:0]	),
	.ted_syndrome		(ted1_syndrome		[15:0]	),
	.ted0_cecc_err		(ted10_cecc_err			),
	.ted0_uecc_err		(ted10_uecc_err			),
	.ted0_uecc_err_		(ted10_uecc_err_		),
	.ted1_cecc_err		(ted11_cecc_err			),
	.ted1_uecc_err		(ted11_uecc_err			),
	.ted1_uecc_err_		(ted11_uecc_err_		),
	.trl_tsacu_en_in	(trl_tsacu_en_in	[7:4]	),
	.tel_syndrome		(tel1_syndrome		[15:0]	),
	.tel_ecc		(tel1_ecc		[15:0]	),
	.tel_crit_ecc		(tel1_crit_ecc		[15:0]	),
	.tel_tsac		(tel1_tsac			),
	.tel_tsau		(tel1_tsau			),
	.tel_tsac_exc		(tlu_tsac		[7:4]	),
	.tel_tsau_exc		(tlu_tsau		[7:4]	),
	.tel_tsacu_exc		(tel_tsacu_exc		[7:4]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

tlu_ecd_dp ted11 (
	.data_in		(tsd1_ted_mra_rd_data	[135:68]),
	.ecc_in			(tel1_crit_ecc		[15:8]	),
	.cerer_ce		(tlu_cerer_tsac			),
	.cerer_ue		(tlu_cerer_tsau			),
	.syndrome		(ted1_syndrome		[15:8]	),
	.cecc_err		(ted11_cecc_err			),
	.uecc_err		(ted11_uecc_err			),
	.uecc_err_		(ted11_uecc_err_		)
);

tlu_ecd_dp ted10 (
	.data_in		(tsd1_ted_mra_rd_data	[67:0]	),
	.ecc_in			(tel1_crit_ecc		[7:0]	),
	.cerer_ce		(tlu_cerer_tsac			),
	.cerer_ue		(tlu_cerer_tsau			),
	.syndrome		(ted1_syndrome		[7:0]	),
	.cecc_err		(ted10_cecc_err			),
	.uecc_err		(ted10_uecc_err			),
	.uecc_err_		(ted10_uecc_err_		)
);

tlu_tsb_dp tsb1 (
	.tsb_in			(teg1_data_in		[135:0]	),
        .wr_en_in		(trl_tsa_wr_en_pre	[1   ] ),
        .ecc_error		(asi_tsacu		[1   ] ),
	.tsb_out		(tsb1_data_out		[135:0]	),
        .wr_en_out		(trl_tsa_wr_en		[1   ] )
);

n2_com_dp_32x152_cust tsa1 (
	.scan_in(tsa1_scanin),
	.scan_out(tsa1_scanout),
	.rdclk			(l2clk				),
	.wrclk			(l2clk				),
	.tcu_aclk		(spc_aclk			),
	.tcu_bclk		(spc_bclk			),
	.rd_adr			(trl1_tsa_rd_addr	[4:0]	),
	.rd_en			(trl_tsa_rd_en		[1   ]	),
	.wr_adr			(trl1_tsa_wr_addr	[4:0]	),
	.wr_en			(trl_tsa_wr_en		[1   ]	),
	.din			({tsb1_data_out		[135:134],
				  tem1_ecc		[15:0],
				  tsb1_data_out		[133:0]}),
	.dout			({tsa_tpc_oor_va	[1   ],
				  tsa_tnpc_oor_va	[1   ],
				  tsa1_ecc		[15:0],
				  tsa_tnpc_nonseq	[1   ],
				  tsa1_gl		[1:0],
				  tsa1_rd_data		[29:0],
				  tsa1_trap_type	[8:0],
				  tsa1_tpc		[47:2],
				  tsa1_tnpc		[47:2]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);


tlu_tsd_dp tsd0 ( 
	.wmr_scan_in(tsd0_wmr_scanin),
	.wmr_scan_out(tsd0_wmr_scanout),
	.scan_in(tsd0_scanin),
	.scan_out(tsd0_scanout),
	.l2clk			(l2clk				),
	.trl_shscanid		(trl0_shscanid		[1:0]	),
	.exu_ccr0		(exu0_ccr0		[7:0]	),
	.exu_ccr1		(exu0_ccr1		[7:0]	),
	.exu_ccr2		(exu0_ccr2		[7:0]	),
	.exu_ccr3		(exu0_ccr3		[7:0]	),
	.fls_cwp0		(fls0_cwp0		[2:0]	),
	.fls_cwp1		(fls0_cwp1		[2:0]	),
	.fls_cwp2		(fls0_cwp2		[2:0]	),
	.fls_cwp3		(fls0_cwp3		[2:0]	),
	.pct_tsa_pc		(pct0_tsa_pc		[47:2]	),
	.pct_tsa_pc_oor_va	(pct_tsa_pc_oor_va	[0   ]	),
	.pct_tsa_npc		(pct0_tsa_npc		[47:2]	),
	.pct_tsa_npc_oor_va	(pct_tsa_npc_oor_va	[0   ]	),
	.pct_tsa_npc_nonseq	(pct_tsa_npc_nonseq	[0   ]	),
	.trl_tsa_gl		(trl0_tsa_gl		[1:0]	),
	.trl_tsa_trap_type	(trl0_tsa_trap_type	[8:0]	),
	.trl_asireg_sel		(trl0_asireg_sel	[4:0]	),
	.trl_asireg_en		(trl0_asireg_en			),
	.trl_thread_sel		(trl0_thread_sel	[3:0]	),
	.trl_tba_sel		(trl0_tba_sel		[2:0]	),
	.trl_pstate_thread_sel	(trl0_pstate_thread_sel	[4:0]	),
	.trl_don_ret_pstate_sel	(trl0_don_ret_pstate_sel[3:0]	),
	.trl_pstate_en		(trl0_pstate_en			),
	.trl_reset_trap		(trl_reset_trap		[0   ]	),
	.trl_other_trap		(trl_other_trap		[0   ]	),
	.trl_stay_in_priv	(trl_stay_in_priv	[0   ]	),
	.trl_tl_gt_0		(trl_tl_gt_0		[0   ]	),
	.trl_save_tsa		(trl0_save_tsa			),
	.trl_tsd_tsa_en		(trl0_tsd_tsa_en		),
	.trl_tsd_tsa_wd_en	(trl0_tsd_tsa_wd_en		),
	.trl_capture_ss		(trl0_capture_ss		),
	.trl_rmw_tsa		(trl0_rmw_tsa			),
	.tsa_tpc		(tsa0_tpc		[47:2]	),
	.tsa_tpc_oor_va		(tsa_tpc_oor_va		[0   ]	),
	.tsa_tnpc		(tsa0_tnpc		[47:2]	),
	.tsa_tnpc_oor_va	(tsa_tnpc_oor_va	[0   ]	),
	.tsa_tnpc_nonseq	(tsa_tnpc_nonseq	[0   ]	),
	.tsa_gl			(tsa0_gl		[1:0]	),
	.tsa_rd_data		(tsa0_rd_data		[29:0]	),
	.tsa_trap_type		(tsa0_trap_type		[8:0]	),
	.asi_wr_mondo_head	(asi_wr_mondo_head	[0   ]	),
	.asi_wr_mondo_tail	(asi_wr_mondo_tail	[0   ]	),
	.asi_wr_device_head	(asi_wr_device_head	[0   ]	),
	.asi_wr_device_tail	(asi_wr_device_tail	[0   ]	),
	.asi_wr_res_err_head	(asi_wr_res_err_head	[0   ]	),
	.asi_wr_res_err_tail	(asi_wr_res_err_tail	[0   ]	),
	.asi_wr_nonres_err_head	(asi_wr_nonres_err_head	[0   ]	),
	.asi_wr_nonres_err_tail	(asi_wr_nonres_err_tail	[0   ]	),
	.asi_rd_iqr_reg		(asi_rd_iqr_reg		[0   ]	),
	.asi_rd_tpc		(asi_rd_tpc		[0   ]	),
	.asi_wr_tpc		(asi_wr_tpc		[0   ]	),
	.asi_rd_tnpc		(asi_rd_tnpc		[0   ]	),
	.asi_wr_tnpc		(asi_wr_tnpc		[0   ]	),
	.asi_rd_tstate		(asi_rd_tstate		[0   ]	),
	.asi_wr_tstate		(asi_wr_tstate		[0   ]	),
	.asi_rd_tt		(asi_rd_tt		[0   ]	),
	.asi_wr_tt		(asi_wr_tt		[0   ]	),
	.asi_rd_htstate		(asi_rd_htstate		[0   ]	),
	.asi_wr_htstate		(asi_wr_htstate		[0   ]	),
	.asi_wr_tba		(asi_wr_tba		[3:0]	),
	.asi_wr_pstate		(asi_wr_pstate		[3:0]	),
	.asi_wr_hpstate		(asi_wr_hpstate		[3:0]	),
	.asi_wr_htba		(asi_wr_htba		[3:0]	),
	.asi_rd_asireg		(asi_rd_asireg		[3:0]	),
	.asi_wr_asireg		(asi_wr_asireg		[3:0]	),
	.asi_rd_tba_htba	(asi_rd_tba_htba	[0   ]	),
	.asi_rd_pstate_hpstate	(asi_rd_pstate_hpstate	[0   ]	),
	.asi_wr_data_47_14	(asi_wr_data_0		[47:14]	),
	.asi_wr_data_07_00	(asi_wr_data_0		[7:0]	),
	.asi_tsd_wr_data_12	(asi_tsd0_wr_data_12		),
	.asi_tsd_wr_data_10_08	(asi_tsd0_wr_data_10_08	[10:8]	),
	.asi_tsd_wr_data_05_00	(asi_tsd0_wr_data_05_00	[5:0]	),
	.tel_ecc		(tel0_ecc		[15:0]	),
	.tsd_tba		(tsd0_tba		[47:14]	),
	.tsd_wr_tpc		(tsd0_wr_tpc		[47:2]	),
	.tsd_wr_tpc_oor_va	(tsd_wr_tpc_oor_va	[0   ]	),
	.tsd_wr_tnpc		(tsd0_wr_tnpc		[47:2]	),
	.tsd_wr_tnpc_oor_va	(tsd_wr_tnpc_oor_va	[0   ]	),
	.tsd_wr_tnpc_nonseq	(tsd_wr_tnpc_nonseq	[0   ]	),
	.tsd_wr_gl		(tsd0_wr_gl		[1:0]	),
	.tsd_wr_data		(tsd0_wr_data		[29:0]	),
	.tsd_wr_trap_type	(tsd0_wr_trap_type	[8:0]	),
	.tsd_tpc		(tsd0_tpc		[47:2]	),
	.tsd_tpc_oor_va		(tsd_tpc_oor_va		[0   ]	),
	.tsd_tnpc		(tsd0_tnpc		[47:2]	),
	.tsd_tnpc_oor_va	(tsd_tnpc_oor_va	[0   ]	),
	.tsd_tnpc_nonseq	(tsd_tnpc_nonseq	[0   ]	),
	.tsd_mrqr_exc_		(tsd0_mrqr_exc_			),
	.tsd_dqr_exc_		(tsd0_dqr_exc_			),
	.tsd_asi_data_		(tsd0_asi_data_		[47:2]	),
	.tsd_asi_data		(tsd0_asi_data		[1:0]	),
	.tsd_ted_mra_rd_data	(tsd0_ted_mra_rd_data	[135:0]	),
	.tsd_hpstate_ibe	(tsd_hpstate_ibe	[3:0]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[3:0]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[3:0]	),
	.tsd_hpstate_tlz	(tsd_hpstate_tlz	[3:0]	),
	.tsd_pstate_tct		(tsd_pstate_tct		[3:0]	),
	.tsd_pstate_priv	(tsd_pstate_priv	[3:0]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[3:0]	),
	.tsd_pstate_am		(tsd_pstate_am		[3:0]	),
	.tsd_htstate_hpriv	(tsd_htstate_hpriv	   [0]	),
	.tsd_shadow_pstate 	(tsd0_shadow_pstate	[10:0]	),
	.tsd_shadow_tpc 	(tsd0_shadow_tpc	[47:2]	),
	.tsd_shadow_tt 		(tsd0_shadow_tt		[8:0]	),
	.tsd_mbist_data 	(tsd0_mbist_data	[31:0]	),
	.tsd_itlb_bypass	(tsd_itlb_bypass	[3:0]	),
	.tlu_itlb_bypass	(tlu_itlb_bypass	[3:0]	),
	.tlu_lsu_hpstate_hpriv	(tlu_lsu_hpstate_hpriv	[3:0]	),
	.tlu_lsu_pstate_priv	(tlu_lsu_pstate_priv	[3:0]	),
	.tlu_ifu_hpstate_hpriv	(tlu_ifu_hpstate_hpriv	[3:0]	),
	.tlu_ifu_pstate_priv	(tlu_ifu_pstate_priv	[3:0]	),
	.tlu_pmu_hpstate_hpriv	(tlu_pmu_hpstate_hpriv	[3:0]	),
	.tlu_pmu_pstate_priv	(tlu_pmu_pstate_priv	[3:0]	),
	.tlu_dec_hpstate_hpriv	(tlu_dec_hpstate_hpriv	[3:0]	),
	.tlu_dec_pstate_priv	(tlu_dec_pstate_priv	[3:0]	),
	.tlu_dec_pstate_pef	(tlu_dec_pstate_pef	[3:0]	),
	.tlu_pstate_cle		(tlu_pstate_cle		[3:0]	),
	.tlu_pstate_am		(tlu_pstate_am		[3:0]	),
	.tlu_ccr		(tlu_ccr_0		[7:0]	),
	.tlu_asi		(tlu_asi_0		[7:0]	),
	.tlu_cwp		(tlu_cwp_0		[2:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .asi_rd_iqr(asi_rd_iqr[2:0]),
  .asi_rd_h_pstate_tba(asi_rd_h_pstate_tba[2:0]),
  .asi_tsa_wr_data(asi_tsa_wr_data[47:0]),
  .asi_tsa_wr_data_npc_oor_va(asi_tsa_wr_data_npc_oor_va),
  .asi_tsa_wr_data_npc_nonseq(asi_tsa_wr_data_npc_nonseq),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_run(asi_mbist_run),
  .asi_mbist_cmpsel(asi_mbist_cmpsel[3:0])
);

tlu_tsd_dp tsd1 ( 
	.wmr_scan_in(tsd1_wmr_scanin),
	.wmr_scan_out(tsd1_wmr_scanout),
	.scan_in(tsd1_scanin),
	.scan_out(tsd1_scanout),
	.l2clk			(l2clk				),
	.trl_shscanid		(trl1_shscanid		[1:0]	),
	.exu_ccr0		(exu1_ccr0		[7:0]	),
	.exu_ccr1		(exu1_ccr1		[7:0]	),
	.exu_ccr2		(exu1_ccr2		[7:0]	),
	.exu_ccr3		(exu1_ccr3		[7:0]	),
	.fls_cwp0		(fls1_cwp0		[2:0]	),
	.fls_cwp1		(fls1_cwp1		[2:0]	),
	.fls_cwp2		(fls1_cwp2		[2:0]	),
	.fls_cwp3		(fls1_cwp3		[2:0]	),
	.pct_tsa_pc		(pct1_tsa_pc		[47:2]	),
	.pct_tsa_pc_oor_va	(pct_tsa_pc_oor_va	[1   ]	),
	.pct_tsa_npc		(pct1_tsa_npc		[47:2]	),
	.pct_tsa_npc_nonseq	(pct_tsa_npc_nonseq	[1   ]	),
	.pct_tsa_npc_oor_va	(pct_tsa_npc_oor_va	[1   ]	),
	.trl_tsa_gl		(trl1_tsa_gl		[1:0]	),
	.trl_tsa_trap_type	(trl1_tsa_trap_type	[8:0]	),
	.trl_asireg_sel		(trl1_asireg_sel	[4:0]	),
	.trl_asireg_en		(trl1_asireg_en			),
	.trl_thread_sel		(trl1_thread_sel	[3:0]	),
	.trl_tba_sel		(trl1_tba_sel		[2:0]	),
	.trl_pstate_thread_sel	(trl1_pstate_thread_sel	[4:0]	),
	.trl_don_ret_pstate_sel	(trl1_don_ret_pstate_sel[3:0]	),
	.trl_pstate_en		(trl1_pstate_en			),
	.trl_reset_trap		(trl_reset_trap		[1   ]	),
	.trl_other_trap		(trl_other_trap		[1   ]	),
	.trl_stay_in_priv	(trl_stay_in_priv	[1   ]	),
	.trl_tl_gt_0		(trl_tl_gt_0		[1   ]	),
	.trl_save_tsa		(trl1_save_tsa			),
	.trl_tsd_tsa_en		(trl1_tsd_tsa_en		),
	.trl_tsd_tsa_wd_en	(trl1_tsd_tsa_wd_en		),
	.trl_capture_ss		(trl1_capture_ss		),
	.trl_rmw_tsa		(trl1_rmw_tsa			),
	.tsa_tpc		(tsa1_tpc		[47:2]	),
	.tsa_tpc_oor_va		(tsa_tpc_oor_va		[1   ]	),
	.tsa_tnpc		(tsa1_tnpc		[47:2]	),
	.tsa_tnpc_oor_va	(tsa_tnpc_oor_va	[1   ]	),
	.tsa_tnpc_nonseq	(tsa_tnpc_nonseq	[1   ]	),
	.tsa_gl			(tsa1_gl		[1:0]	),
	.tsa_rd_data		(tsa1_rd_data		[29:0]	),
	.tsa_trap_type		(tsa1_trap_type		[8:0]	),
	.asi_wr_mondo_head	(asi_wr_mondo_head	[1   ]	),
	.asi_wr_mondo_tail	(asi_wr_mondo_tail	[1   ]	),
	.asi_wr_device_head	(asi_wr_device_head	[1   ]	),
	.asi_wr_device_tail	(asi_wr_device_tail	[1   ]	),
	.asi_wr_res_err_head	(asi_wr_res_err_head	[1   ]	),
	.asi_wr_res_err_tail	(asi_wr_res_err_tail	[1   ]	),
	.asi_wr_nonres_err_head	(asi_wr_nonres_err_head	[1   ]	),
	.asi_wr_nonres_err_tail	(asi_wr_nonres_err_tail	[1   ]	),
	.asi_rd_iqr_reg		(asi_rd_iqr_reg		[1   ]	),
	.asi_rd_tpc		(asi_rd_tpc		[1   ]	),
	.asi_wr_tpc		(asi_wr_tpc		[1   ]	),
	.asi_rd_tnpc		(asi_rd_tnpc		[1   ]	),
	.asi_wr_tnpc		(asi_wr_tnpc		[1   ]	),
	.asi_rd_tstate		(asi_rd_tstate		[1   ]	),
	.asi_wr_tstate		(asi_wr_tstate		[1   ]	),
	.asi_rd_tt		(asi_rd_tt		[1   ]	),
	.asi_wr_tt		(asi_wr_tt		[1   ]	),
	.asi_rd_htstate		(asi_rd_htstate		[1   ]	),
	.asi_wr_htstate		(asi_wr_htstate		[1   ]	),
	.asi_wr_tba		(asi_wr_tba		[7:4]	),
	.asi_wr_pstate		(asi_wr_pstate		[7:4]	),
	.asi_wr_hpstate		(asi_wr_hpstate		[7:4]	),
	.asi_wr_htba		(asi_wr_htba		[7:4]	),
	.asi_rd_asireg		(asi_rd_asireg		[7:4]	),
	.asi_wr_asireg		(asi_wr_asireg		[7:4]	),
	.asi_rd_tba_htba	(asi_rd_tba_htba	[1   ]	),
	.asi_rd_pstate_hpstate	(asi_rd_pstate_hpstate	[1   ]	),
	.asi_wr_data_47_14	(asi_wr_data_1		[47:14]	),
	.asi_wr_data_07_00	(asi_wr_data_1		[7:0]	),
	.asi_tsd_wr_data_12	(asi_tsd1_wr_data_12		),
	.asi_tsd_wr_data_10_08	(asi_tsd1_wr_data_10_08	[10:8]	),
	.asi_tsd_wr_data_05_00	(asi_tsd1_wr_data_05_00	[5:0]	),
	.tel_ecc		(tel1_ecc		[15:0]	),
	.tsd_tba		(tsd1_tba		[47:14]	),
	.tsd_wr_tpc		(tsd1_wr_tpc		[47:2]	),
	.tsd_wr_tpc_oor_va	(tsd_wr_tpc_oor_va	[1   ]	),
	.tsd_wr_tnpc		(tsd1_wr_tnpc		[47:2]	),
	.tsd_wr_tnpc_oor_va	(tsd_wr_tnpc_oor_va	[1   ]	),
	.tsd_wr_tnpc_nonseq	(tsd_wr_tnpc_nonseq	[1   ]	),
	.tsd_mrqr_exc_		(tsd1_mrqr_exc_			),
	.tsd_dqr_exc_		(tsd1_dqr_exc_			),
	.tsd_wr_gl		(tsd1_wr_gl		[1:0]	),
	.tsd_wr_data		(tsd1_wr_data		[29:0]	),
	.tsd_wr_trap_type	(tsd1_wr_trap_type	[8:0]	),
	.tsd_tpc		(tsd1_tpc		[47:2]	),
	.tsd_tpc_oor_va		(tsd_tpc_oor_va		[1   ]	),
	.tsd_tnpc		(tsd1_tnpc		[47:2]	),
	.tsd_tnpc_oor_va	(tsd_tnpc_oor_va	[1   ]	),
	.tsd_tnpc_nonseq	(tsd_tnpc_nonseq	[1   ]	),
	.tsd_asi_data_		(tsd1_asi_data_		[47:2]	),
	.tsd_asi_data		(tsd1_asi_data		[1:0]	),
	.tsd_ted_mra_rd_data	(tsd1_ted_mra_rd_data	[135:0]	),
	.tsd_hpstate_ibe	(tsd_hpstate_ibe	[7:4]	),
	.tsd_hpstate_red	(tsd_hpstate_red	[7:4]	),
	.tsd_hpstate_hpriv	(tsd_hpstate_hpriv	[7:4]	),
	.tsd_hpstate_tlz	(tsd_hpstate_tlz	[7:4]	),
	.tsd_pstate_tct		(tsd_pstate_tct		[7:4]	),
	.tsd_pstate_priv	(tsd_pstate_priv	[7:4]	),
	.tsd_pstate_ie		(tsd_pstate_ie		[7:4]	),
	.tsd_pstate_am		(tsd_pstate_am		[7:4]	),
	.tsd_htstate_hpriv	(tsd_htstate_hpriv	   [1]	),
	.tsd_shadow_pstate 	(tsd1_shadow_pstate	[10:0]	),
	.tsd_shadow_tpc 	(tsd1_shadow_tpc	[47:2]	),
	.tsd_shadow_tt 		(tsd1_shadow_tt		[8:0]	),
	.tsd_mbist_data 	(tsd1_mbist_data	[31:0]	),
	.tsd_itlb_bypass	(tsd_itlb_bypass	[7:4]	),
	.tlu_itlb_bypass	(tlu_itlb_bypass	[7:4]	),
	.tlu_lsu_hpstate_hpriv	(tlu_lsu_hpstate_hpriv	[7:4]	),
	.tlu_lsu_pstate_priv	(tlu_lsu_pstate_priv	[7:4]	),
	.tlu_ifu_hpstate_hpriv	(tlu_ifu_hpstate_hpriv	[7:4]	),
	.tlu_ifu_pstate_priv	(tlu_ifu_pstate_priv	[7:4]	),
	.tlu_pmu_hpstate_hpriv	(tlu_pmu_hpstate_hpriv	[7:4]	),
	.tlu_pmu_pstate_priv	(tlu_pmu_pstate_priv	[7:4]	),
	.tlu_dec_hpstate_hpriv	(tlu_dec_hpstate_hpriv	[7:4]	),
	.tlu_dec_pstate_priv	(tlu_dec_pstate_priv	[7:4]	),
	.tlu_dec_pstate_pef	(tlu_dec_pstate_pef	[7:4]	),
	.tlu_pstate_cle		(tlu_pstate_cle		[7:4]	),
	.tlu_pstate_am		(tlu_pstate_am		[7:4]	),
	.tlu_ccr		(tlu_ccr_1		[7:0]	),
	.tlu_asi		(tlu_asi_1		[7:0]	),
	.tlu_cwp		(tlu_cwp_1		[2:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .asi_rd_iqr(asi_rd_iqr[2:0]),
  .asi_rd_h_pstate_tba(asi_rd_h_pstate_tba[2:0]),
  .asi_tsa_wr_data(asi_tsa_wr_data[47:0]),
  .asi_tsa_wr_data_npc_oor_va(asi_tsa_wr_data_npc_oor_va),
  .asi_tsa_wr_data_npc_nonseq(asi_tsa_wr_data_npc_nonseq),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_run(asi_mbist_run),
  .asi_mbist_cmpsel(asi_mbist_cmpsel[3:0])
);



////////////////////////////////////////////////////////////////////////////////
// Fast ASI ring stub

tlu_asi_ctl asi ( 
	.wmr_scan_in(asi_wmr_scanin),
	.wmr_scan_out(asi_wmr_scanout),
	.scan_in(asi_scanin),
	.scan_out(asi_scanout),
	.l2clk			(l2clk				),
	.hver_mask_major_rev	(4'h2				),
	.error_inject_enable	(lsu_asi_error_inject	[31   ]	),
	.error_inject_tccu	(lsu_asi_error_inject	[22   ]	),
	.error_inject_tsau	(lsu_asi_error_inject	[21   ]	),
	.error_inject_mask	(lsu_asi_error_inject	[7:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .mbi_tsa0_write_en(mbi_tsa0_write_en),
  .mbi_tsa1_write_en(mbi_tsa1_write_en),
  .mbi_tca_write_en(mbi_tca_write_en),
  .mbi_addr(mbi_addr[4:0]),
  .mbi_run(mbi_run),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_tsa0_read_en(mbi_tsa0_read_en),
  .mbi_tsa1_read_en(mbi_tsa1_read_en),
  .mbi_tca_read_en(mbi_tca_read_en),
  .mbi_tlu_cmpsel(mbi_tlu_cmpsel[3:0]),
  .mbd_compare(mbd_compare),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[64:0]),
  .pct0_asi_data(pct0_asi_data[48:2]),
  .pct1_asi_data(pct1_asi_data[48:2]),
  .trl0_asi_data(trl0_asi_data[16:0]),
  .trl1_asi_data(trl1_asi_data[16:0]),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tsd_hpstate_hpriv(tsd_hpstate_hpriv[7:0]),
  .tsd_pstate_priv(tsd_pstate_priv[7:0]),
  .tsd0_asi_data(tsd0_asi_data[1:0]),
  .tsd1_asi_data(tsd1_asi_data[1:0]),
  .tel0_ecc(tel0_ecc[15:0]),
  .tel0_tsac(tel0_tsac),
  .tel0_tsau(tel0_tsau),
  .tel1_ecc(tel1_ecc[15:0]),
  .tel1_tsac(tel1_tsac),
  .tel1_tsau(tel1_tsau),
  .tic_asi_data(tic_asi_data[63:0]),
  .cel_ecc(cel_ecc[7:0]),
  .cer_asi_data(cer_asi_data[63:0]),
  .cel_tccp(cel_tccp),
  .cel_tcup(cel_tcup),
  .mmu_asi_data(mmu_asi_data[64:0]),
  .mmu_asi_read(mmu_asi_read),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .dfd_desr_f(dfd_desr_f[7:0]),
  .dfd_fesr_f(dfd_fesr_f[7:0]),
  .tlu_lsu_clear_ctl_reg_(tlu_lsu_clear_ctl_reg_[7:0]),
  .hver_mask_minor_rev(hver_mask_minor_rev[3:0]),
  .asi_error_tccu(asi_error_tccu),
  .asi_error_tsau(asi_error_tsau),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_tsa_rd_addr(asi_tsa_rd_addr[4:0]),
  .asi_tsa_rd_iqr_ecc(asi_tsa_rd_iqr_ecc),
  .asi_tsa_tid(asi_tsa_tid[1:0]),
  .asi_rd_asireg(asi_rd_asireg[7:0]),
  .asi_wr_asireg(asi_wr_asireg[7:0]),
  .asi_rd_tick(asi_rd_tick),
  .asi_wr_tick(asi_wr_tick),
  .asi_rd_pc(asi_rd_pc[7:0]),
  .asi_wr_set_softint(asi_wr_set_softint[7:0]),
  .asi_wr_clear_softint(asi_wr_clear_softint[7:0]),
  .asi_rd_softint(asi_rd_softint[7:0]),
  .asi_wr_softint(asi_wr_softint[7:0]),
  .asi_tca_addr(asi_tca_addr[4:0]),
  .asi_tca_addr_valid(asi_tca_addr_valid),
  .asi_tca_wr(asi_tca_wr),
  .asi_wr_mondo_head(asi_wr_mondo_head[1:0]),
  .asi_wr_mondo_tail(asi_wr_mondo_tail[1:0]),
  .asi_wr_device_head(asi_wr_device_head[1:0]),
  .asi_wr_device_tail(asi_wr_device_tail[1:0]),
  .asi_wr_res_err_head(asi_wr_res_err_head[1:0]),
  .asi_wr_res_err_tail(asi_wr_res_err_tail[1:0]),
  .asi_wr_nonres_err_head(asi_wr_nonres_err_head[1:0]),
  .asi_wr_nonres_err_tail(asi_wr_nonres_err_tail[1:0]),
  .asi_rd_iqr_reg(asi_rd_iqr_reg[1:0]),
  .asi_rd_iqr(asi_rd_iqr[2:0]),
  .asi_rd_tpc(asi_rd_tpc[1:0]),
  .asi_wr_tpc(asi_wr_tpc[1:0]),
  .asi_rd_tnpc(asi_rd_tnpc[1:0]),
  .asi_wr_tnpc(asi_wr_tnpc[1:0]),
  .asi_rd_tstate(asi_rd_tstate[1:0]),
  .asi_wr_tstate(asi_wr_tstate[1:0]),
  .asi_rd_tt(asi_rd_tt[1:0]),
  .asi_wr_tt(asi_wr_tt[1:0]),
  .asi_wr_tba(asi_wr_tba[7:0]),
  .asi_wr_pstate(asi_wr_pstate[7:0]),
  .asi_rd_tl(asi_rd_tl[7:0]),
  .asi_wr_tl(asi_wr_tl[7:0]),
  .asi_rd_pil(asi_rd_pil[7:0]),
  .asi_wr_pil(asi_wr_pil[7:0]),
  .asi_rd_gl(asi_rd_gl[7:0]),
  .asi_wr_gl(asi_wr_gl[7:0]),
  .asi_wr_hpstate(asi_wr_hpstate[7:0]),
  .asi_rd_htstate(asi_rd_htstate[1:0]),
  .asi_wr_htstate(asi_wr_htstate[1:0]),
  .asi_rd_hintp(asi_rd_hintp[7:0]),
  .asi_wr_hintp(asi_wr_hintp[7:0]),
  .asi_wr_htba(asi_wr_htba[7:0]),
  .asi_rd_h_pstate_tba(asi_rd_h_pstate_tba[2:0]),
  .asi_rd_tba_htba(asi_rd_tba_htba[1:0]),
  .asi_rd_pstate_hpstate(asi_rd_pstate_hpstate[1:0]),
  .asi_preempt_trap(asi_preempt_trap[1:0]),
  .asi_preempt_done_retry(asi_preempt_done_retry[1:0]),
  .asi_rmw_tsa(asi_rmw_tsa[1:0]),
  .asi_wr_int_rec(asi_wr_int_rec[7:0]),
  .asi_wr_any_int_rec(asi_wr_any_int_rec),
  .asi_rd_inc_vec_2(asi_rd_inc_vec_2[7:0]),
  .asi_int_rec_mux_sel_in(asi_int_rec_mux_sel_in[2:0]),
  .asi_rd_int_rec(asi_rd_int_rec),
  .asi_rd_inc_vec(asi_rd_inc_vec),
  .asi_check_qr_exc(asi_check_qr_exc[7:0]),
  .asi_tca_wr_data_63(asi_tca_wr_data_63),
  .asi_wr_data_0(asi_wr_data_0[63:0]),
  .asi_wr_data_1(asi_wr_data_1[62:0]),
  .asi_tsd0_wr_data_12(asi_tsd0_wr_data_12),
  .asi_tsd0_wr_data_10_08(asi_tsd0_wr_data_10_08[10:8]),
  .asi_tsd0_wr_data_05_00(asi_tsd0_wr_data_05_00[5:0]),
  .asi_tsd1_wr_data_12(asi_tsd1_wr_data_12),
  .asi_tsd1_wr_data_10_08(asi_tsd1_wr_data_10_08[10:8]),
  .asi_tsd1_wr_data_05_00(asi_tsd1_wr_data_05_00[5:0]),
  .asi_tsa_wr_data(asi_tsa_wr_data[47:0]),
  .asi_tsa_wr_data_npc_oor_va(asi_tsa_wr_data_npc_oor_va),
  .asi_tsa_wr_data_npc_nonseq(asi_tsa_wr_data_npc_nonseq),
  .asi_rd_cerer(asi_rd_cerer),
  .asi_rd_ceter(asi_rd_ceter),
  .asi_wr_cerer(asi_wr_cerer),
  .asi_ceter_tid(asi_ceter_tid[2:0]),
  .asi_wr_ceter(asi_wr_ceter),
  .asi_rd_tid(asi_rd_tid[2:0]),
  .asi_rd_isfsr(asi_rd_isfsr),
  .asi_rd_dsfsr(asi_rd_dsfsr),
  .asi_rd_dsfar(asi_rd_dsfar),
  .asi_rd_desr(asi_rd_desr),
  .asi_rd_fesr(asi_rd_fesr),
  .asi_wr_isfsr(asi_wr_isfsr[7:0]),
  .asi_wr_dsfsr(asi_wr_dsfsr[7:0]),
  .asi_wr_dsfar(asi_wr_dsfar[7:0]),
  .asi_rd_iaw(asi_rd_iaw),
  .asi_wr_iaw(asi_wr_iaw[1:0]),
  .asi_decr(asi_decr[63:46]),
  .asi_ece_exc(asi_ece_exc),
  .asi_eue_exc(asi_eue_exc),
  .asi_ecc_tid(asi_ecc_tid[2:0]),
  .asi_tsac(asi_tsac),
  .asi_tsau(asi_tsau),
  .asi_tsacu(asi_tsacu[1:0]),
  .asi_tsacu_tid(asi_tsacu_tid[2:0]),
  .asi_irl_cleared(asi_irl_cleared[7:0]),
  .asi_rd_stage_1(asi_rd_stage_1),
  .asi_trl_pstate_en(asi_trl_pstate_en[1:0]),
  .asi_stg1_en(asi_stg1_en),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_tsa_ecc_in(asi_mbist_tsa_ecc_in[7:0]),
  .asi_mbist_run(asi_mbist_run),
  .asi_mbist_cmpsel(asi_mbist_cmpsel[3:0]),
  .asi_mbd_compare_data(asi_mbd_compare_data[7:0]),
  .asi_mbd_sel_tsd0(asi_mbd_sel_tsd0),
  .asi_mbd_sel_tsd1(asi_mbd_sel_tsd1),
  .asi_mbd_sel_tic(asi_mbd_sel_tic),
  .asi_mbist_addr(asi_mbist_addr[4:0]),
  .asi_mbist_tsa_rd_en(asi_mbist_tsa_rd_en[1:0]),
  .asi_mbist_tsa_wr_en(asi_mbist_tsa_wr_en[1:0]),
  .asi_mbist_tel_en(asi_mbist_tel_en[1:0]),
  .asi_tccup_in(asi_tccup_in),
  .asi_tccud_in(asi_tccud_in),
  .asi_immu_enable(asi_immu_enable[7:0]),
  .asi_spec_enable(asi_spec_enable[7:0]),
  .asi_halt(asi_halt[7:0]),
  .asi_clear_spu_trap_req(asi_clear_spu_trap_req[7:0]),
  .tlu_spec_enable(tlu_spec_enable[7:0]),
  .tlu_tca_tid(tlu_tca_tid[2:0]),
  .tlu_tca_index(tlu_tca_index[1:0]),
  .tlu_mbi_tsa0_fail(tlu_mbi_tsa0_fail),
  .tlu_mbi_tsa1_fail(tlu_mbi_tsa1_fail),
  .tlu_mbi_tca_fail(tlu_mbi_tca_fail),
  .tlu_rngf_cdbus(tlu_rngf_cdbus[64:0]),
  .tlu_rngf_cdbus_error(tlu_rngf_cdbus_error)
);


////////////////////////////////////////////////////////////////////////////////
// TICK register support

tlu_tic_dp tic (
	.scan_in(tic_scanin),
	.scan_out(tic_scanout),
	.l2clk			(l2clk				),
	.asi_wr_data		(asi_wr_data_1		[62:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .cmp_tick_enable(cmp_tick_enable),
  .asi_rd_tick(asi_rd_tick),
  .asi_wr_tick(asi_wr_tick),
  .asi_tca_addr(asi_tca_addr[4:0]),
  .asi_tca_addr_valid(asi_tca_addr_valid),
  .asi_tca_wr(asi_tca_wr),
  .asi_mbist_run(asi_mbist_run),
  .asi_mbist_cmpsel(asi_mbist_cmpsel[1:0]),
  .tca_cmpr_data_in(tca_cmpr_data_in[63:0]),
  .cel_ecc(cel_ecc[7:0]),
  .exu_address0_e(exu_address0_e[47:0]),
  .exu_address1_e(exu_address1_e[47:0]),
  .tic_cmpr_addr(tic_cmpr_addr[4:0]),
  .tic_cmpr_wr_en(tic_cmpr_wr_en),
  .tic_cmpr_rd_en(tic_cmpr_rd_en),
  .tic_asi_data(tic_asi_data[63:0]),
  .tic_cmpr_data(tic_cmpr_data[63:0]),
  .tic_addr(tic_addr[4:0]),
  .tic_not_valid(tic_not_valid),
  .tic_match(tic_match),
  .tic_mbist_data(tic_mbist_data[31:0]),
  .tic_exu_address0_m(tic_exu_address0_m[47:2]),
  .tic_exu_address1_m(tic_exu_address1_m[47:2]),
  .tic_exu_address0_b(tic_exu_address0_b[1:0]),
  .tic_exu_address1_b(tic_exu_address1_b[1:0])
);

// Storage for TICK_CMPR, STICK_CMPR, HSTICK_CMPR
// Addressing:
//		4:3	10 HSTICK_CMPR
//			01 STICK_CMPR
//			00 TICK_CMPR
//		2:0	Thread ID
//
// Since (H)(S)TICK_CMPR.INTDIS (bit 63) has POR value of 1, store it
// negative active


n2_com_dp_32x72_cust tca (
        .scan_in(tca_scanin),
        .scan_out(tca_scanout),
        .rdclk			(l2clk				),
        .wrclk			(l2clk				),
	.tcu_aclk		(spc_aclk			),
	.tcu_bclk		(spc_bclk			),
	.rd_adr			(tic_cmpr_addr		[4:0]	),
	.rd_en			(tic_cmpr_rd_en			),
	.wr_adr			(tic_cmpr_addr		[4:0]	),
	.wr_en			(tic_cmpr_wr_en			),
	.din			({cem_ecc		[7:0],
				  asi_tca_wr_data_63	       ,
				  asi_wr_data_1		[62:0]}),
	.dout			({tca_ecc		[7:0],
				  tca_cmpr_data_in	[63:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);


// ECC generation for 64 bits
tlu_cep_dp cep (
	.scan_in(cep_scanin),
	.scan_out(cep_scanout),
	.l2clk			(l2clk				),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[63:0]),
  .asi_stg1_en(asi_stg1_en),
  .cep_wr_data(cep_wr_data[63:0])
);

tlu_ecg_dp ceg (
	.data_in		({{4 {1'b0}}		       ,
				  cep_wr_data		[63:0]}),
	.ecc_out		(ceg_ecc		[7:0]	)
);

tlu_eem_dp cem (
	.asi_error_inject	(asi_error_tccu			),
	.ecc_in			(ceg_ecc		[7:0]	),
	.ecc_out		(cem_ecc		[7:0]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

// ECC error detection for 64 bits
tlu_cel_dp cel (
	.scan_in(cel_scanin),
	.scan_out(cel_scanout),
	.l2clk			(l2clk				),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_tccp(tlu_cerer_tccp),
  .tlu_cerer_tcup(tlu_cerer_tcup),
  .tlu_cerer_tccd(tlu_cerer_tccd),
  .tlu_cerer_tcud(tlu_cerer_tcud),
  .ced_syndrome(ced_syndrome[7:0]),
  .tca_ecc(tca_ecc[7:0]),
  .ced_cecc_err(ced_cecc_err),
  .ced_uecc_err(ced_uecc_err),
  .asi_tccup_in(asi_tccup_in),
  .asi_tccud_in(asi_tccud_in),
  .cel_syndrome(cel_syndrome[7:0]),
  .cel_ecc(cel_ecc[7:0]),
  .cel_crit_ecc(cel_crit_ecc[7:0]),
  .cel_tccp(cel_tccp),
  .cel_tcup(cel_tcup),
  .cel_tccd(cel_tccd),
  .cel_tcud(cel_tcud)
);

tlu_ecd_dp ced (
	.data_in		({{4 {1'b0}}		       ,
				 tic_cmpr_data		[63:0]}),
	.ecc_in			(cel_crit_ecc		[7:0]	),
	.cerer_ce		(1'b1				),
	.cerer_ue		(1'b1				),
	.syndrome		(ced_syndrome		[7:0]	),
	.cecc_err		(ced_cecc_err			),
	.uecc_err		(ced_uecc_err			),
	.uecc_err_		(ced_uecc_err__unused		)
);



////////////////////////////////////////////////////////////////////////////////
// RAS 

// control regs
tlu_cer_dp cer (
	.scan_in(cer_scanin),
	.scan_out(cer_scanout),
	.l2clk			(l2clk			       	),
	.asi_wr_data		(asi_wr_data_0		[63:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .asi_rd_cerer(asi_rd_cerer),
  .asi_rd_ceter(asi_rd_ceter),
  .asi_wr_cerer(asi_wr_cerer),
  .asi_ceter_tid(asi_ceter_tid[2:0]),
  .asi_wr_ceter(asi_wr_ceter),
  .cth_asi_data(cth_asi_data[63:0]),
  .cer_asi_data(cer_asi_data[63:0]),
  .tlu_cerer_ittp(tlu_cerer_ittp),
  .tlu_cerer_itdp(tlu_cerer_itdp),
  .tlu_cerer_ittm(tlu_cerer_ittm),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu),
  .tlu_cerer_hwtwl2(tlu_cerer_hwtwl2),
  .tlu_cerer_icl2c(tlu_cerer_icl2c),
  .tlu_cerer_icl2u(tlu_cerer_icl2u),
  .tlu_cerer_icl2nd(tlu_cerer_icl2nd),
  .tlu_cerer_irf(tlu_cerer_irf),
  .tlu_cerer_frf(tlu_cerer_frf),
  .tlu_cerer_dttp(tlu_cerer_dttp),
  .tlu_cerer_dttm(tlu_cerer_dttm),
  .tlu_cerer_dtdp(tlu_cerer_dtdp),
  .tlu_cerer_dcl2c(tlu_cerer_dcl2c),
  .tlu_cerer_dcl2u(tlu_cerer_dcl2u),
  .tlu_cerer_dcl2nd(tlu_cerer_dcl2nd),
  .tlu_cerer_sbdlc(tlu_cerer_sbdlc),
  .tlu_cerer_sbdlu(tlu_cerer_sbdlu),
  .tlu_cerer_mrau(tlu_cerer_mrau),
  .tlu_cerer_tsac(tlu_cerer_tsac),
  .tlu_cerer_tsau(tlu_cerer_tsau),
  .tlu_cerer_scac(tlu_cerer_scac),
  .tlu_cerer_scau(tlu_cerer_scau),
  .tlu_cerer_tccp(tlu_cerer_tccp),
  .tlu_cerer_tcup(tlu_cerer_tcup),
  .tlu_cerer_sbapp(tlu_cerer_sbapp),
  .tlu_cerer_l2c_socc(tlu_cerer_l2c_socc),
  .tlu_cerer_l2u_socu(tlu_cerer_l2u_socu),
  .tlu_cerer_l2nd(tlu_cerer_l2nd),
  .tlu_cerer_icvp(tlu_cerer_icvp),
  .tlu_cerer_ictp(tlu_cerer_ictp),
  .tlu_cerer_ictm(tlu_cerer_ictm),
  .tlu_cerer_icdp(tlu_cerer_icdp),
  .tlu_cerer_dcvp(tlu_cerer_dcvp),
  .tlu_cerer_dctp(tlu_cerer_dctp),
  .tlu_cerer_dctm(tlu_cerer_dctm),
  .tlu_cerer_dcdp(tlu_cerer_dcdp),
  .tlu_cerer_sbdpc(tlu_cerer_sbdpc),
  .tlu_cerer_sbdpu(tlu_cerer_sbdpu),
  .tlu_cerer_mamu(tlu_cerer_mamu),
  .tlu_cerer_tccd(tlu_cerer_tccd),
  .tlu_cerer_tcud(tlu_cerer_tcud),
  .tlu_cerer_mal2c(tlu_cerer_mal2c),
  .tlu_cerer_mal2u(tlu_cerer_mal2u),
  .tlu_cerer_mal2nd(tlu_cerer_mal2nd),
  .tlu_cerer_cwql2c(tlu_cerer_cwql2c),
  .tlu_cerer_cwql2u(tlu_cerer_cwql2u),
  .tlu_cerer_cwql2nd(tlu_cerer_cwql2nd),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_ceter_de(tlu_ceter_de[7:0]),
  .tlu_ceter_dhcce(tlu_ceter_dhcce[7:0])
);

tlu_ras_ctl ras ( 
	.wmr_scan_in(ras_wmr_scanin),
	.wmr_scan_out(ras_wmr_scanout),
	.scan_in(ras_scanin),
	.scan_out(ras_scanout),
	.l2clk			(l2clk			       	),
	.asi_wr_data		(cth_wr_data		[3:0]	),
	.spu_tlu_mamu_err_req_v	(spu_tlu_ma_int_req	[4   ]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .ftu_excp_way_d(ftu_excp_way_d[2:0]),
  .ftu_excp_tid_d(ftu_excp_tid_d[2:0]),
  .ftu_excp_way_valid_d(ftu_excp_way_valid_d),
  .dec_exc0_m(dec_exc0_m[4:0]),
  .dec_exc1_m(dec_exc1_m[4:0]),
  .dec_icache_perr_m(dec_icache_perr_m[1:0]),
  .dec_tid0_m(dec_tid0_m[1:0]),
  .dec_tid1_m(dec_tid1_m[1:0]),
  .dec_inst_valid_m(dec_inst_valid_m[1:0]),
  .dec_fgu_inst_m(dec_fgu_inst_m[1:0]),
  .dec_lsu_inst_m(dec_lsu_inst_m[1:0]),
  .dec_flush_b(dec_flush_b[1:0]),
  .fls_irf_cecc_b(fls_irf_cecc_b[1:0]),
  .fls_irf_uecc_b(fls_irf_uecc_b[1:0]),
  .fls_kill_irf_ecc_w(fls_kill_irf_ecc_w[1:0]),
  .exu0_ecc_addr_m(exu0_ecc_addr_m[4:0]),
  .exu1_ecc_addr_m(exu1_ecc_addr_m[4:0]),
  .exu0_ecc_check_m(exu0_ecc_check_m[7:0]),
  .exu1_ecc_check_m(exu1_ecc_check_m[7:0]),
  .fls_f_cecc_w(fls_f_cecc_w),
  .fls_f_uecc_w(fls_f_uecc_w),
  .fgu_ecc_addr_fx2(fgu_ecc_addr_fx2[5:0]),
  .fgu_ecc_check_fx2(fgu_ecc_check_fx2[13:0]),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
  .lsu_block_store_b(lsu_block_store_b[7:0]),
  .fls_load_dsfar(fls_load_dsfar[7:0]),
  .fls_ipe_dme_request(fls_ipe_dme_request[1:0]),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_dcmh_err_g(lsu_dcmh_err_g),
  .lsu_dcvp_err_g(lsu_dcvp_err_g),
  .lsu_dctp_err_g(lsu_dctp_err_g),
  .lsu_dcdp_err_g(lsu_dcdp_err_g),
  .lsu_dcl2c_err_g(lsu_dcl2c_err_g),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_dcsoc_err_g(lsu_dcsoc_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_dcerr_sfar_g(lsu_dcerr_sfar_g[8:0]),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_sbdpc_err_g(lsu_sbdpc_err_g),
  .lsu_sbdpu_err_g(lsu_sbdpu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lsu_stberr_index_g(lsu_stberr_index_g[2:0]),
  .lsu_stberr_priv_g(lsu_stberr_priv_g[1:0]),
  .lsu_stb_flush_g(lsu_stb_flush_g),
  .cel_tccp(cel_tccp),
  .cel_tcup(cel_tcup),
  .cel_syndrome(cel_syndrome[7:0]),
  .tlu_tca_tid(tlu_tca_tid[2:0]),
  .tlu_tca_index(tlu_tca_index[1:0]),
  .tlu_tsac(tlu_tsac[7:0]),
  .tlu_tsau(tlu_tsau[7:0]),
  .asi_tsac(asi_tsac),
  .asi_tsau(asi_tsau),
  .asi_tsacu_tid(asi_tsacu_tid[2:0]),
  .tlu_tccd(tlu_tccd[7:0]),
  .tlu_tcud(tlu_tcud[7:0]),
  .tlu_tca_index_0(tlu_tca_index_0[1:0]),
  .tlu_tca_index_1(tlu_tca_index_1[1:0]),
  .tsd_pc_0_w(tsd_pc_0_w[10:5]),
  .tsd_pc_1_w(tsd_pc_1_w[10:5]),
  .fls_flush(fls_flush[7:0]),
  .fls_disrupting_flush_w(fls_disrupting_flush_w[1:0]),
  .trl_gl0(trl_gl0[1:0]),
  .trl_gl1(trl_gl1[1:0]),
  .trl_gl2(trl_gl2[1:0]),
  .trl_gl3(trl_gl3[1:0]),
  .trl_gl4(trl_gl4[1:0]),
  .trl_gl5(trl_gl5[1:0]),
  .trl_gl6(trl_gl6[1:0]),
  .trl_gl7(trl_gl7[1:0]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_index(mmu_asi_index[10:0]),
  .mmu_asi_mra_not_sca(mmu_asi_mra_not_sca),
  .mmu_i_l2cerr(mmu_i_l2cerr[7:0]),
  .mmu_d_l2cerr(mmu_d_l2cerr[7:0]),
  .mmu_i_eccerr(mmu_i_eccerr[7:0]),
  .mmu_d_eccerr(mmu_d_eccerr[7:0]),
  .mmu_thr0_err_type(mmu_thr0_err_type[2:0]),
  .mmu_thr1_err_type(mmu_thr1_err_type[2:0]),
  .mmu_thr2_err_type(mmu_thr2_err_type[2:0]),
  .mmu_thr3_err_type(mmu_thr3_err_type[2:0]),
  .mmu_thr4_err_type(mmu_thr4_err_type[2:0]),
  .mmu_thr5_err_type(mmu_thr5_err_type[2:0]),
  .mmu_thr6_err_type(mmu_thr6_err_type[2:0]),
  .mmu_thr7_err_type(mmu_thr7_err_type[2:0]),
  .mmu_thr0_err_index(mmu_thr0_err_index[2:0]),
  .mmu_thr1_err_index(mmu_thr1_err_index[2:0]),
  .mmu_thr2_err_index(mmu_thr2_err_index[2:0]),
  .mmu_thr3_err_index(mmu_thr3_err_index[2:0]),
  .mmu_thr4_err_index(mmu_thr4_err_index[2:0]),
  .mmu_thr5_err_index(mmu_thr5_err_index[2:0]),
  .mmu_thr6_err_index(mmu_thr6_err_index[2:0]),
  .mmu_thr7_err_index(mmu_thr7_err_index[2:0]),
  .spu_tlu_mamu_err_req(spu_tlu_mamu_err_req[10:0]),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[2:0]),
  .spu_tlu_cwq_int_req(spu_tlu_cwq_int_req[2:0]),
  .spu_tlu_l2_error(spu_tlu_l2_error[5:0]),
  .cxi_l2_soc_sre(cxi_l2_soc_sre),
  .cxi_l2_soc_err_type(cxi_l2_soc_err_type[1:0]),
  .cxi_l2_soc_tid(cxi_l2_soc_tid[2:0]),
  .cxi_l2_err(cxi_l2_err),
  .cxi_soc_err(cxi_soc_err),
  .asi_rd_isfsr(asi_rd_isfsr),
  .asi_rd_dsfsr(asi_rd_dsfsr),
  .asi_rd_dsfar(asi_rd_dsfar),
  .asi_rd_desr(asi_rd_desr),
  .asi_rd_fesr(asi_rd_fesr),
  .asi_rd_tid(asi_rd_tid[2:0]),
  .asi_wr_isfsr(asi_wr_isfsr[7:0]),
  .asi_wr_dsfsr(asi_wr_dsfsr[7:0]),
  .dfd_desr_f(dfd_desr_f[7:0]),
  .dfd_desr_s(dfd_desr_s[7:0]),
  .dfd_fesr_f(dfd_fesr_f[7:0]),
  .dfd_fesr_priv_0(dfd_fesr_priv_0[1:0]),
  .dfd_fesr_priv_1(dfd_fesr_priv_1[1:0]),
  .dfd_fesr_priv_2(dfd_fesr_priv_2[1:0]),
  .dfd_fesr_priv_3(dfd_fesr_priv_3[1:0]),
  .dfd_fesr_priv_4(dfd_fesr_priv_4[1:0]),
  .dfd_fesr_priv_5(dfd_fesr_priv_5[1:0]),
  .dfd_fesr_priv_6(dfd_fesr_priv_6[1:0]),
  .dfd_fesr_priv_7(dfd_fesr_priv_7[1:0]),
  .ras_asi_data(ras_asi_data[3:0]),
  .ras_dsfar_0(ras_dsfar_0[19:0]),
  .ras_dsfar_1(ras_dsfar_1[19:0]),
  .ras_dsfar_2(ras_dsfar_2[19:0]),
  .ras_dsfar_3(ras_dsfar_3[19:0]),
  .ras_dsfar_4(ras_dsfar_4[19:0]),
  .ras_dsfar_5(ras_dsfar_5[19:0]),
  .ras_dsfar_6(ras_dsfar_6[19:0]),
  .ras_dsfar_7(ras_dsfar_7[19:0]),
  .ras_dsfar_sel_lsu_va(ras_dsfar_sel_lsu_va[7:0]),
  .ras_dsfar_sel_ras(ras_dsfar_sel_ras[7:0]),
  .ras_dsfar_sel_tsa(ras_dsfar_sel_tsa[7:0]),
  .ras_rd_dsfar(ras_rd_dsfar[7:0]),
  .ras_desr_et_0(ras_desr_et_0[61:56]),
  .ras_desr_et_1(ras_desr_et_1[61:56]),
  .ras_desr_et_2(ras_desr_et_2[61:56]),
  .ras_desr_et_3(ras_desr_et_3[61:56]),
  .ras_desr_et_4(ras_desr_et_4[61:56]),
  .ras_desr_et_5(ras_desr_et_5[61:56]),
  .ras_desr_et_6(ras_desr_et_6[61:56]),
  .ras_desr_et_7(ras_desr_et_7[61:56]),
  .ras_desr_ea_0(ras_desr_ea_0[10:0]),
  .ras_desr_ea_1(ras_desr_ea_1[10:0]),
  .ras_desr_ea_2(ras_desr_ea_2[10:0]),
  .ras_desr_ea_3(ras_desr_ea_3[10:0]),
  .ras_desr_ea_4(ras_desr_ea_4[10:0]),
  .ras_desr_ea_5(ras_desr_ea_5[10:0]),
  .ras_desr_ea_6(ras_desr_ea_6[10:0]),
  .ras_desr_ea_7(ras_desr_ea_7[10:0]),
  .ras_desr_me_0(ras_desr_me_0),
  .ras_desr_me_1(ras_desr_me_1),
  .ras_desr_me_2(ras_desr_me_2),
  .ras_desr_me_3(ras_desr_me_3),
  .ras_desr_me_4(ras_desr_me_4),
  .ras_desr_me_5(ras_desr_me_5),
  .ras_desr_me_6(ras_desr_me_6),
  .ras_desr_me_7(ras_desr_me_7),
  .ras_desr_en(ras_desr_en[7:0]),
  .ras_write_desr_1st(ras_write_desr_1st[7:0]),
  .ras_write_desr_2nd(ras_write_desr_2nd[7:0]),
  .ras_rd_desr(ras_rd_desr[7:0]),
  .ras_fesr_et_0(ras_fesr_et_0[61:60]),
  .ras_fesr_et_1(ras_fesr_et_1[61:60]),
  .ras_fesr_et_2(ras_fesr_et_2[61:60]),
  .ras_fesr_et_3(ras_fesr_et_3[61:60]),
  .ras_fesr_et_4(ras_fesr_et_4[61:60]),
  .ras_fesr_et_5(ras_fesr_et_5[61:60]),
  .ras_fesr_et_6(ras_fesr_et_6[61:60]),
  .ras_fesr_et_7(ras_fesr_et_7[61:60]),
  .ras_fesr_ea_0(ras_fesr_ea_0[59:55]),
  .ras_fesr_ea_1(ras_fesr_ea_1[59:55]),
  .ras_fesr_ea_2(ras_fesr_ea_2[59:55]),
  .ras_fesr_ea_3(ras_fesr_ea_3[59:55]),
  .ras_fesr_ea_4(ras_fesr_ea_4[59:55]),
  .ras_fesr_ea_5(ras_fesr_ea_5[59:55]),
  .ras_fesr_ea_6(ras_fesr_ea_6[59:55]),
  .ras_fesr_ea_7(ras_fesr_ea_7[59:55]),
  .ras_fesr_en(ras_fesr_en[7:0]),
  .ras_write_fesr(ras_write_fesr[7:0]),
  .ras_fesr_priv(ras_fesr_priv[59:58]),
  .ras_update_priv(ras_update_priv[7:0]),
  .ras_rd_fesr(ras_rd_fesr[7:0]),
  .ras_precise_error(ras_precise_error[7:0]),
  .ras_disrupting_error(ras_disrupting_error[7:0]),
  .ras_deferred_error(ras_deferred_error[7:0])
);

tlu_dfd_dp dfd ( 
	.wmr_scan_in(dfd_wmr_scanin),
	.wmr_scan_out(dfd_wmr_scanout),
	.scan_in(dfd_scanin),
	.scan_out(dfd_scanout),
	.l2clk			(l2clk			       	),
	.asi_wr_data		(cth_wr_data		[61:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_va_b(lsu_va_b[47:0]),
  .pct0_target_b(pct0_target_b[47:2]),
  .pct1_target_b(pct1_target_b[47:2]),
  .tic_exu_address0_b(tic_exu_address0_b[1:0]),
  .tic_exu_address1_b(tic_exu_address1_b[1:0]),
  .fls0_dfd_lsu_inst_b(fls0_dfd_lsu_inst_b),
  .fls1_dfd_lsu_inst_b(fls1_dfd_lsu_inst_b),
  .tel0_syndrome(tel0_syndrome[15:0]),
  .tel1_syndrome(tel1_syndrome[15:0]),
  .tlu_tsa_index_0(tlu_tsa_index_0[2:0]),
  .tlu_tsa_index_1(tlu_tsa_index_1[2:0]),
  .ras_dsfar_0(ras_dsfar_0[19:0]),
  .ras_dsfar_1(ras_dsfar_1[19:0]),
  .ras_dsfar_2(ras_dsfar_2[19:0]),
  .ras_dsfar_3(ras_dsfar_3[19:0]),
  .ras_dsfar_4(ras_dsfar_4[19:0]),
  .ras_dsfar_5(ras_dsfar_5[19:0]),
  .ras_dsfar_6(ras_dsfar_6[19:0]),
  .ras_dsfar_7(ras_dsfar_7[19:0]),
  .ras_dsfar_sel_lsu_va(ras_dsfar_sel_lsu_va[7:0]),
  .ras_dsfar_sel_ras(ras_dsfar_sel_ras[7:0]),
  .ras_dsfar_sel_tsa(ras_dsfar_sel_tsa[7:0]),
  .ras_desr_et_0(ras_desr_et_0[61:56]),
  .ras_desr_et_1(ras_desr_et_1[61:56]),
  .ras_desr_et_2(ras_desr_et_2[61:56]),
  .ras_desr_et_3(ras_desr_et_3[61:56]),
  .ras_desr_et_4(ras_desr_et_4[61:56]),
  .ras_desr_et_5(ras_desr_et_5[61:56]),
  .ras_desr_et_6(ras_desr_et_6[61:56]),
  .ras_desr_et_7(ras_desr_et_7[61:56]),
  .ras_desr_ea_0(ras_desr_ea_0[10:0]),
  .ras_desr_ea_1(ras_desr_ea_1[10:0]),
  .ras_desr_ea_2(ras_desr_ea_2[10:0]),
  .ras_desr_ea_3(ras_desr_ea_3[10:0]),
  .ras_desr_ea_4(ras_desr_ea_4[10:0]),
  .ras_desr_ea_5(ras_desr_ea_5[10:0]),
  .ras_desr_ea_6(ras_desr_ea_6[10:0]),
  .ras_desr_ea_7(ras_desr_ea_7[10:0]),
  .ras_desr_me_0(ras_desr_me_0),
  .ras_desr_me_1(ras_desr_me_1),
  .ras_desr_me_2(ras_desr_me_2),
  .ras_desr_me_3(ras_desr_me_3),
  .ras_desr_me_4(ras_desr_me_4),
  .ras_desr_me_5(ras_desr_me_5),
  .ras_desr_me_6(ras_desr_me_6),
  .ras_desr_me_7(ras_desr_me_7),
  .ras_desr_en(ras_desr_en[7:0]),
  .ras_write_desr_1st(ras_write_desr_1st[7:0]),
  .ras_write_desr_2nd(ras_write_desr_2nd[7:0]),
  .ras_fesr_et_0(ras_fesr_et_0[61:60]),
  .ras_fesr_et_1(ras_fesr_et_1[61:60]),
  .ras_fesr_et_2(ras_fesr_et_2[61:60]),
  .ras_fesr_et_3(ras_fesr_et_3[61:60]),
  .ras_fesr_et_4(ras_fesr_et_4[61:60]),
  .ras_fesr_et_5(ras_fesr_et_5[61:60]),
  .ras_fesr_et_6(ras_fesr_et_6[61:60]),
  .ras_fesr_et_7(ras_fesr_et_7[61:60]),
  .ras_fesr_ea_0(ras_fesr_ea_0[59:55]),
  .ras_fesr_ea_1(ras_fesr_ea_1[59:55]),
  .ras_fesr_ea_2(ras_fesr_ea_2[59:55]),
  .ras_fesr_ea_3(ras_fesr_ea_3[59:55]),
  .ras_fesr_ea_4(ras_fesr_ea_4[59:55]),
  .ras_fesr_ea_5(ras_fesr_ea_5[59:55]),
  .ras_fesr_ea_6(ras_fesr_ea_6[59:55]),
  .ras_fesr_ea_7(ras_fesr_ea_7[59:55]),
  .ras_fesr_en(ras_fesr_en[7:0]),
  .ras_write_fesr(ras_write_fesr[7:0]),
  .ras_fesr_priv(ras_fesr_priv[59:58]),
  .ras_update_priv(ras_update_priv[7:0]),
  .ras_asi_data(ras_asi_data[3:0]),
  .ras_rd_dsfar(ras_rd_dsfar[7:0]),
  .ras_rd_desr(ras_rd_desr[7:0]),
  .ras_rd_fesr(ras_rd_fesr[7:0]),
  .asi_wr_dsfar(asi_wr_dsfar[7:0]),
  .dfd_desr_f(dfd_desr_f[7:0]),
  .dfd_desr_s(dfd_desr_s[7:0]),
  .dfd_fls_desr_f(dfd_fls_desr_f[7:0]),
  .dfd_fls_desr_s(dfd_fls_desr_s[7:0]),
  .dfd_fesr_f(dfd_fesr_f[7:0]),
  .dfd_fesr_priv_0(dfd_fesr_priv_0[1:0]),
  .dfd_fesr_priv_1(dfd_fesr_priv_1[1:0]),
  .dfd_fesr_priv_2(dfd_fesr_priv_2[1:0]),
  .dfd_fesr_priv_3(dfd_fesr_priv_3[1:0]),
  .dfd_fesr_priv_4(dfd_fesr_priv_4[1:0]),
  .dfd_fesr_priv_5(dfd_fesr_priv_5[1:0]),
  .dfd_fesr_priv_6(dfd_fesr_priv_6[1:0]),
  .dfd_fesr_priv_7(dfd_fesr_priv_7[1:0]),
  .dfd_asi_data(dfd_asi_data[47:0]),
  .dfd_asi_desr(dfd_asi_desr[18:0])
);



////////////////////////////////////////////////////////////////////////////////
// Debug 

// Freerunning domain
tlu_sse_dp sse (
	.scan_in(sse_scanin),
	.scan_out(sse_scanout),
	.l2clk			(l2clk			       	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_shscan_clk_stop(tcu_shscan_clk_stop),
  .trl1_shscanid_2(trl1_shscanid_2),
  .fls_ss_update_pc_w(fls_ss_update_pc_w[1:0]),
  .pct0_shadow_pc_d(pct0_shadow_pc_d[47:2]),
  .pct1_shadow_pc_d(pct1_shadow_pc_d[47:2]),
  .fls0_spc_hardstop_request(fls0_spc_hardstop_request),
  .fls0_spc_softstop_request(fls0_spc_softstop_request),
  .fls0_spc_trigger_pulse(fls0_spc_trigger_pulse),
  .fls1_spc_hardstop_request(fls1_spc_hardstop_request),
  .fls1_spc_softstop_request(fls1_spc_softstop_request),
  .fls1_spc_trigger_pulse(fls1_spc_trigger_pulse),
  .sse_shscan_clk_stop(sse_shscan_clk_stop),
  .sse_shadow_pc(sse_shadow_pc[47:2]),
  .tlu_hardstop_request(tlu_hardstop_request),
  .tlu_softstop_request(tlu_softstop_request),
  .tlu_trigger_pulse(tlu_trigger_pulse)
);

// Shadow scan domain
assign shscan_l2clk = l2clk; 
tlu_ssd_dp ssd (.shscan_l2clk(shscan_l2clk),
  .tcu_shscan_scan_in(tcu_shscan_scan_in),
  .tcu_shscan_pce_ov(tcu_shscan_pce_ov),
  .tcu_shscan_aclk(tcu_shscan_aclk),
  .tcu_shscan_bclk(tcu_shscan_bclk),
  .tcu_shscan_scan_en(tcu_shscan_scan_en),
  .trl1_shscanid_2(trl1_shscanid_2),
  .sse_shscan_clk_stop(sse_shscan_clk_stop),
  .sse_shadow_pc(sse_shadow_pc[47:2]),
  .tsd0_shadow_pstate(tsd0_shadow_pstate[10:0]),
  .tsd1_shadow_pstate(tsd1_shadow_pstate[10:0]),
  .tsd0_shadow_tpc(tsd0_shadow_tpc[47:2]),
  .tsd1_shadow_tpc(tsd1_shadow_tpc[47:2]),
  .tsd0_shadow_tt(tsd0_shadow_tt[8:0]),
  .tsd1_shadow_tt(tsd1_shadow_tt[8:0]),
  .trl0_shadow_tl(trl0_shadow_tl[2:0]),
  .trl1_shadow_tl(trl1_shadow_tl[2:0]),
  .trl0_tl_for_tt(trl0_tl_for_tt[2:0]),
  .trl1_tl_for_tt(trl1_tl_for_tt[2:0]),
  .spc_shscan_scan_out(spc_shscan_scan_out)
);



////////////////////////////////////////////////////////////////////////////////
// MBIST

tlu_mbd_dp mbd(
  .asi_mbd_compare_data(asi_mbd_compare_data[7:0]),
  .asi_mbd_sel_tsd0(asi_mbd_sel_tsd0),
  .asi_mbd_sel_tsd1(asi_mbd_sel_tsd1),
  .asi_mbd_sel_tic(asi_mbd_sel_tic),
  .tic_mbist_data(tic_mbist_data[31:0]),
  .tsd0_mbist_data(tsd0_mbist_data[31:0]),
  .tsd1_mbist_data(tsd1_mbist_data[31:0]),
  .tlu_pc_0_prebuf_d(tlu_pc_0_prebuf_d[47:2]),
  .mbd_compare(mbd_compare),
  .tlu_pc_0_d(tlu_pc_0_d[47:2]));



////////////////////////////////////////////////////////////////////////////////
// Scan patch panel
// fixscan start:
assign fls0_scanin               = scan_in                  ;
assign fls1_scanin               = fls0_scanout             ;
assign pct0_scanin               = fls1_scanout             ;
assign pct1_scanin               = pct0_scanout             ;
assign cxi_scanin                = pct1_scanout             ;
assign cth_scanin                = cxi_scanout              ;
assign trl0_scanin               = cth_scanout              ;
assign trl1_scanin               = trl0_scanout             ;
assign tel0_scanin               = trl1_scanout             ;
assign tsa0_scanin               = tel0_scanout             ;
assign tel1_scanin               = tsa0_scanout             ;
assign tsa1_scanin               = tel1_scanout             ;
assign tsd0_scanin               = tsa1_scanout             ;
assign tsd1_scanin               = tsd0_scanout             ;
assign asi_scanin                = tsd1_scanout             ;
assign tic_scanin                = asi_scanout              ;
assign tca_scanin                = tic_scanout              ;
assign cep_scanin                = tca_scanout              ;
assign cel_scanin                = cep_scanout              ;
assign cer_scanin                = cel_scanout              ;
assign ras_scanin                = cer_scanout              ;
assign dfd_scanin                = ras_scanout              ;
assign sse_scanin                = dfd_scanout              ;
assign scan_out                  = sse_scanout              ;

assign fls0_wmr_scanin           = wmr_scan_in              ;
assign fls1_wmr_scanin           = fls0_wmr_scanout         ;
assign pct0_wmr_scanin           = fls1_wmr_scanout         ;
assign pct1_wmr_scanin           = pct0_wmr_scanout         ;
assign cth_wmr_scanin            = pct1_wmr_scanout         ;
assign trl0_wmr_scanin           = cth_wmr_scanout          ;
assign trl1_wmr_scanin           = trl0_wmr_scanout         ;
assign tsd0_wmr_scanin           = trl1_wmr_scanout         ;
assign tsd1_wmr_scanin           = tsd0_wmr_scanout         ;
assign asi_wmr_scanin            = tsd1_wmr_scanout         ;
assign ras_wmr_scanin            = asi_wmr_scanout          ;
assign dfd_wmr_scanin            = ras_wmr_scanout          ;
assign wmr_scan_out              = dfd_wmr_scanout          ;
// fixscan end:
endmodule

