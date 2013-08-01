// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_trl_ctl.v
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
module tlu_trl_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_tlu_pmen, 
  tcu_shscanid, 
  tcu_ss_mode, 
  tcu_do_mode, 
  thread_group, 
  mbi_run, 
  ftu_ifu_quiesce, 
  pku_quiesce, 
  exu_tlu_window_block, 
  lsu_stb_empty, 
  fgu_fpx_ieee_trap_fw, 
  fgu_fpd_ieee_trap_fw, 
  fgu_fpx_unfin_fw, 
  fgu_fpd_unfin_fw, 
  fgu_fpd_idiv0_trap_fw, 
  fgu_fpx_trap_tid_fw, 
  fgu_fpd_trap_tid_fw, 
  mmu_write_itlb, 
  mmu_reload_done, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  spu_pmu_ma_busy, 
  spu_tlu_cwq_busy, 
  spu_tlu_ma_int_req, 
  fls_wstate0, 
  fls_wstate1, 
  fls_wstate2, 
  fls_wstate3, 
  fls_tcc_number_0, 
  fls_tcc_number_1, 
  fls_tcc_number_2, 
  fls_tcc_number_3, 
  fls_tid_d, 
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
  fls_pc_valid, 
  pmu_tlu_trap_m, 
  fls_trl_l1en, 
  fls_core_running, 
  tlu_flush_ifu, 
  pct_npc_is_nonseq, 
  trlx_itw_wait, 
  trlx_itw_last, 
  tsa_gl, 
  tsa_tnpc_nonseq, 
  tel_tsacu_exc, 
  tlu_ceter_de, 
  tlu_ceter_pscce, 
  tsd_hpstate_red, 
  tsd_hpstate_hpriv, 
  tsd_hpstate_tlz, 
  tsd_pstate_ie, 
  tsd_pstate_am, 
  tsd_htstate_hpriv, 
  tic_addr, 
  tic_not_valid, 
  tic_match, 
  cel_tccd, 
  cel_tcud, 
  asi_tsa_rd_addr, 
  asi_tsa_rd_iqr_ecc, 
  asi_tsa_tid, 
  asi_rd_tl, 
  asi_wr_tl, 
  asi_rd_pil, 
  asi_wr_pil, 
  asi_rd_gl, 
  asi_wr_gl, 
  asi_wr_set_softint, 
  asi_wr_clear_softint, 
  asi_rd_softint, 
  asi_wr_softint, 
  asi_rd_hintp, 
  asi_wr_hintp, 
  asi_wr_data, 
  asi_preempt_trap, 
  asi_preempt_done_retry, 
  asi_rmw_tsa, 
  asi_wr_asireg, 
  asi_trl_pstate_en, 
  asi_mbist_addr, 
  asi_mbist_tsa_rd_en, 
  asi_mbist_tsa_wr_en, 
  scan_out, 
  wmr_scan_out, 
  spc_core_running_status, 
  trl_core_running_status, 
  trl_pil_mask_15, 
  trl_iln_exc, 
  trl_hstick_match, 
  trl_unhalt_, 
  trl_tlz_exc, 
  trl_nns_exc, 
  trl_ssc_exc, 
  trl_take_sma, 
  trl_take_cwq, 
  trl_take_xir, 
  trl_take_ftt, 
  trl_pc_sel_trap_pc, 
  trl_npc_sel_trap_npc, 
  trl_npc_sel_tnpc, 
  trl_invalidate_pc, 
  trl_invalidate_npc, 
  trl_trap_type, 
  trl_tsa_trap_type, 
  trl_asireg_sel, 
  trl_asireg_en, 
  trl_thread_sel, 
  trl_tba_sel, 
  trl_pstate_thread_sel, 
  trl_don_ret_pstate_sel, 
  trl_pstate_en, 
  trl_pc_thread_sel, 
  trl_pc_pstate_am_, 
  trl_pc_sel_pc, 
  trl_pc_sel_npc, 
  trl_pc_sel_trap, 
  trl_pc_sel_reset, 
  trl_pc_done, 
  trl_pc_retry, 
  trl_pc_tte, 
  trl_pct_trap_pc_en, 
  trl_pct_tnpc_en, 
  trl_stay_in_priv, 
  trl_reset_trap, 
  trl_other_trap, 
  trl_tl_gt_0, 
  trl_tl_eq_0, 
  trl_tsa_wr_en, 
  trl_tsa_rd_en, 
  trl_tsa_wr_addr, 
  trl_tsa_rd_addr, 
  trl_save_tsa, 
  trl_tsd_tsa_en, 
  trl_tsd_tsa_wd_en, 
  trl_capture_ss, 
  trl_rmw_tsa, 
  trl_tsa_gl, 
  trl_asi_data, 
  trl_ss_complete, 
  trl_itw_wait, 
  trl_itw_last, 
  trl_shscanid, 
  trl_shscanid_2, 
  trl_shadow_tl, 
  trl_tl_for_tt, 
  trl_fls_npc_en, 
  trl_tel_en, 
  trl_trap_taken, 
  trl_gl0, 
  trl_gl1, 
  trl_gl2, 
  trl_gl3, 
  trl_tsacu_en_in, 
  tlu_tsa_index, 
  tlu_tccd, 
  tlu_tcud, 
  tlu_tca_index, 
  tlu_window_block, 
  tlu_trap_pc_valid, 
  tlu_retry, 
  tlu_ifu_invalidate, 
  tlu_trap_tid, 
  tlu_itlb_reload, 
  tlu_ccr_cwp_valid, 
  tlu_ccr_cwp_tid, 
  tlu_asi_valid, 
  tlu_asi_tid, 
  tlu_gl0, 
  tlu_gl1, 
  tlu_gl2, 
  tlu_gl3, 
  tlu_tl_gt_0, 
  tlu_mmu_tl_gt_0, 
  tlu_release_tte, 
  tlu_lsu_clear_ctl_reg_, 
  tlu_pmu_trap_taken, 
  tlu_pmu_trap_mask_e);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire [2:0] maxtl;
wire [2:0] maxptl;
wire [2:0] maxtl_minus_one;
wire [1:0] maxgl;
wire l1clk;
wire [3:0] thread_active;
wire [3:0] core_running_status;
wire [3:0] clear_l1en_per_thread_int;
wire [3:0] trap_taken0;
wire take_itw_last;
wire suppress_don_ret_taken_;
wire flush_ifu_last_lat_scanin;
wire flush_ifu_last_lat_scanout;
wire [3:0] flush_ifu_last;
wire [3:0] l1en_per_thread_int_in;
wire [3:0] l1en_per_thread_int;
wire l1en_per_thread_int_lat_scanin;
wire l1en_per_thread_int_lat_scanout;
wire [3:0] l1en_don_ret_in;
wire take_don_last;
wire take_ret_last;
wire l1en_don_ret_lat_scanin;
wire l1en_don_ret_lat_scanout;
wire [3:0] l1en_don_ret;
wire [3:0] l1en_per_thread;
wire l1clk_pm4;
wire l1clk_pm3;
wire l1clk_pm2;
wire l1clk_pm1;
wire tid_dec_w_lat_scanin;
wire tid_dec_w_lat_scanout;
wire [3:0] tid_dec_w;
wire cwq_busy_in;
wire cwq_busy_lat_scanin;
wire cwq_busy_lat_scanout;
wire cwq_busy;
wire [3:0] cwq_interlock_;
wire [3:0] quiesced_in;
wire [3:0] stb_empty;
wire [3:0] i_quiesce;
wire [3:0] p_quiesce;
wire [3:0] ma_idle;
wire [3:0] pitw_req_in;
wire quiesced_last_lat_scanin;
wire quiesced_last_lat_scanout;
wire [3:0] quiesced;
wire [3:0] quiesced_last;
wire [3:0] pidl_req_in;
wire [3:0] idl_req;
wire [3:0] idl_req_in;
wire idl_req_lat_scanin;
wire idl_req_lat_scanout;
wire i_quiesce_lat_scanin;
wire i_quiesce_lat_scanout;
wire p_quiesce_lat_scanin;
wire p_quiesce_lat_scanout;
wire ma_busy_lat_scanin;
wire ma_busy_lat_scanout;
wire ma_busy;
wire [2:0] ma_tid;
wire [3:0] core_running_status_in;
wire [3:0] trap_por_res_ssr;
wire core_running_status_lat_scanin;
wire core_running_status_lat_scanout;
wire [3:0] ever_been_running_in;
wire [3:0] ever_been_running;
wire ever_been_running_lat_scanin;
wire ever_been_running_lat_scanout;
wire [3:0] pdisrupting_req;
wire [3:0] disrupting_req;
wire [3:0] por_req_in;
wire [3:0] por_req;
wire [3:0] por_req_in_ntt;
wire por_req_lat_scanin;
wire por_req_lat_scanout;
wire [3:0] pxir_req_in;
wire [3:0] xir_req;
wire [3:0] xir_req_in;
wire [3:0] pxir_req_in_ntt;
wire xir_req_lat_scanin;
wire xir_req_lat_scanout;
wire [3:0] peer_req_in;
wire [3:0] eer_req;
wire [3:0] eer_req_in;
wire [3:0] peer_req_in_ntt;
wire eer_req_lat_scanin;
wire eer_req_lat_scanout;
wire [3:0] icp_req_in;
wire [3:0] icp_req;
wire [3:0] icp_req_in_ntt;
wire icp_req_lat_scanin;
wire icp_req_lat_scanout;
wire [3:0] pftt_req_in;
wire [3:0] ftt_req;
wire [3:0] ftt_req_in;
wire [3:0] pftt_req_in_ntt;
wire ftt_req_lat_scanin;
wire ftt_req_lat_scanout;
wire [3:0] pivt_req_in;
wire [3:0] ivt_req;
wire [3:0] ivt_req_in;
wire [3:0] stb_wait;
wire [3:0] pivt_req_in_ntt;
wire ivt_req_lat_scanin;
wire ivt_req_lat_scanout;
wire [3:0] pmqr_req_in;
wire [3:0] mqr_req;
wire [3:0] mqr_req_in;
wire [3:0] pmqr_req_in_ntt;
wire mqr_req_lat_scanin;
wire mqr_req_lat_scanout;
wire [3:0] pdqr_req_in;
wire [3:0] dqr_req;
wire [3:0] dqr_req_in;
wire [3:0] pdqr_req_in_ntt;
wire dqr_req_lat_scanin;
wire dqr_req_lat_scanout;
wire [3:0] prqr_req_in;
wire [3:0] rqr_req;
wire [3:0] rqr_req_in;
wire [3:0] prqr_req_in_ntt;
wire rqr_req_lat_scanin;
wire rqr_req_lat_scanout;
wire [3:0] pres_req_in;
wire [3:0] res_req;
wire [3:0] res_req_in;
wire [3:0] pres_req_in_ntt;
wire res_req_lat_scanin;
wire res_req_lat_scanout;
wire [3:0] pssr_req_in;
wire [3:0] ssr_req;
wire [3:0] ssr_req_in;
wire [3:0] ssr_req_in_for_taken;
wire [3:0] pssr_req_in_ntt;
wire take_ssr_last;
wire ssr_req_lat_scanin;
wire ssr_req_lat_scanout;
wire [3:0] ssc_req_in;
wire [3:0] ssc_req;
wire [3:0] fei_or_fof_incoming;
wire ssc_req_lat_scanin;
wire ssc_req_lat_scanout;
wire [3:0] pnns_req_in;
wire [3:0] nns_req;
wire [3:0] nns_req_in;
wire [3:0] pnns_req_in_ntt;
wire nns_req_lat_scanin;
wire nns_req_lat_scanout;
wire [3:0] psir_req_in;
wire [3:0] sir_req;
wire [3:0] sir_req_in;
wire [3:0] psir_req_in_ntt;
wire sir_req_lat_scanin;
wire sir_req_lat_scanout;
wire [3:0] pitm_req_in;
wire [3:0] itm_req;
wire [3:0] itm_req_in;
wire [3:0] irt_req_in;
wire [3:0] tlz_req_in;
wire [3:0] pmu_req_in;
wire [3:0] pitm_req_in_ntt;
wire itm_req_lat_scanin;
wire itm_req_lat_scanout;
wire i_tte_outofrange_lat_scanin;
wire i_tte_outofrange_lat_scanout;
wire [3:0] i_tte_outofrange;
wire [3:0] piit_req_in;
wire [3:0] iit_req;
wire [3:0] iit_req_in;
wire [3:0] piit_req_in_ntt;
wire iit_req_lat_scanin;
wire iit_req_lat_scanout;
wire [3:0] piln_req_in;
wire [3:0] iln_req;
wire [3:0] iln_req_in;
wire [3:0] piln_req_in_ntt;
wire iln_req_lat_scanin;
wire iln_req_lat_scanout;
wire [3:0] phst_req_in;
wire [3:0] hst_req;
wire [3:0] hst_req_in;
wire [3:0] phst_req_in_ntt;
wire hst_req_lat_scanin;
wire hst_req_lat_scanout;
wire [3:0] ptlz_req_in;
wire [3:0] tlz_req;
wire [3:0] ptlz_req_in_ntt;
wire tlz_req_lat_scanin;
wire tlz_req_lat_scanout;
wire [3:0] psma_req_in;
wire [3:0] sma_req;
wire [3:0] sma_req_in;
wire [3:0] psma_req_in_ntt;
wire [3:0] trap_taken1;
wire sma_req_lat_scanin;
wire sma_req_lat_scanout;
wire [3:0] pcwq_req_in;
wire [3:0] cwq_req;
wire [3:0] cwq_req_in;
wire [3:0] pcwq_req_in_ntt;
wire cwq_req_lat_scanin;
wire cwq_req_lat_scanout;
wire [3:0] pade_req_in;
wire [3:0] ade_req;
wire [3:0] ade_req_in;
wire [3:0] pade_req_in_ntt;
wire ade_req_lat_scanin;
wire ade_req_lat_scanout;
wire [3:0] piae_req_in;
wire [3:0] iae_req;
wire [3:0] iae_req_in;
wire [3:0] piae_req_in_ntt;
wire iae_req_lat_scanin;
wire iae_req_lat_scanout;
wire [3:0] pipe_req_in;
wire [3:0] ipe_req;
wire [3:0] tpe_exc;
wire [3:0] ipe_req_in;
wire [3:0] pipe_req_in_ntt;
wire take_lsr_last;
wire ipe_req_lat_scanin;
wire ipe_req_lat_scanout;
wire [3:0] pipv_req_in;
wire [3:0] ipv_req;
wire [3:0] ipv_req_in;
wire [3:0] pipv_req_in_ntt;
wire ipv_req_lat_scanin;
wire ipv_req_lat_scanout;
wire i_unauth_access_lat_scanin;
wire i_unauth_access_lat_scanout;
wire [3:0] i_unauth_access;
wire [3:0] piua_req_in;
wire [3:0] iua_req;
wire [3:0] iua_req_in;
wire [3:0] piua_req_in_ntt;
wire iua_req_lat_scanin;
wire iua_req_lat_scanout;
wire [3:0] pinp_req_in;
wire [3:0] inp_req;
wire [3:0] inp_req_in;
wire [3:0] pinp_req_in_ntt;
wire inp_req_lat_scanin;
wire inp_req_lat_scanout;
wire [3:0] piar_req_in;
wire [3:0] iar_req;
wire [3:0] iar_req_in;
wire [3:0] piar_req_in_ntt;
wire iar_req_lat_scanin;
wire iar_req_lat_scanout;
wire [3:0] pirr_req_in;
wire [3:0] irr_req;
wire [3:0] irr_req_in;
wire [3:0] pirr_req_in_ntt;
wire irr_req_lat_scanin;
wire irr_req_lat_scanout;
wire [3:0] pmar_req_in;
wire [3:0] mar_req;
wire [3:0] mar_req_in;
wire [3:0] pmar_req_in_ntt;
wire mar_req_lat_scanin;
wire mar_req_lat_scanout;
wire [3:0] pmrr_req_in;
wire [3:0] mrr_req;
wire [3:0] mrr_req_in;
wire [3:0] pmrr_req_in_ntt;
wire mrr_req_lat_scanin;
wire mrr_req_lat_scanout;
wire [3:0] ppro_req_in;
wire [3:0] pro_req;
wire [3:0] pro_req_in;
wire [3:0] ppro_req_in_ntt;
wire pro_req_lat_scanin;
wire pro_req_lat_scanout;
wire [3:0] pill_req_in;
wire [3:0] ill_req;
wire [3:0] ill_req_in;
wire [3:0] pill_req_in_ntt;
wire ill_req_lat_scanin;
wire ill_req_lat_scanout;
wire [3:0] pdon_req_in;
wire [3:0] don_req;
wire [3:0] don_req_in;
wire stall_don_ret;
wire [3:0] pdon_req_in_ntt;
wire hole_in_p;
wire don_req_lat_scanin;
wire don_req_lat_scanout;
wire [3:0] pret_req_in;
wire [3:0] ret_req;
wire [3:0] ret_req_in;
wire [3:0] pret_req_in_ntt;
wire ret_req_lat_scanin;
wire ret_req_lat_scanout;
wire [3:0] pfpd_req_in;
wire [3:0] fpd_req;
wire [3:0] fpd_req_in;
wire [3:0] pfpd_req_in_ntt;
wire fpd_req_lat_scanin;
wire fpd_req_lat_scanout;
wire [3:0] psnn_req_in;
wire [3:0] snn_req;
wire [3:0] snn_req_in;
wire [3:0] psnn_req_in_ntt;
wire snn_req_lat_scanin;
wire snn_req_lat_scanout;
wire [3:0] psno_req_in;
wire [3:0] sno_req;
wire [3:0] sno_req_in;
wire [3:0] psno_req_in_ntt;
wire sno_req_lat_scanin;
wire sno_req_lat_scanout;
wire [3:0] pfnn_req_in;
wire [3:0] fnn_req;
wire [3:0] fnn_req_in;
wire [3:0] pfnn_req_in_ntt;
wire fnn_req_lat_scanin;
wire fnn_req_lat_scanout;
wire [3:0] pfno_req_in;
wire [3:0] fno_req;
wire [3:0] fno_req_in;
wire [3:0] pfno_req_in_ntt;
wire fno_req_lat_scanin;
wire fno_req_lat_scanout;
wire [3:0] pclw_req_in;
wire [3:0] clw_req;
wire [3:0] clw_req_in;
wire [3:0] pclw_req_in_ntt;
wire clw_req_lat_scanin;
wire clw_req_lat_scanout;
wire [3:0] pdtm_req_in;
wire [3:0] dtm_req;
wire [3:0] dtm_req_in;
wire [3:0] maa_req_in;
wire [3:0] ldf_req_in;
wire [3:0] stf_req_in;
wire [3:0] pra_req_in;
wire [3:0] pdtm_req_in_ntt;
wire [3:0] trap_taken2;
wire dtm_req_lat_scanin;
wire dtm_req_lat_scanout;
wire [3:0] pldf_req_in;
wire [3:0] ldf_req;
wire [3:0] pldf_req_in_ntt;
wire ldf_req_lat_scanin;
wire ldf_req_lat_scanout;
wire [3:0] pstf_req_in;
wire [3:0] stf_req;
wire [3:0] pstf_req_in_ntt;
wire stf_req_lat_scanin;
wire stf_req_lat_scanout;
wire [3:0] pdap_req_in;
wire [3:0] dap_req;
wire [3:0] dap_req_in;
wire [3:0] pdap_req_in_ntt;
wire dap_req_lat_scanin;
wire dap_req_lat_scanout;
wire [3:0] pvaw_req_in;
wire [3:0] vaw_req;
wire [3:0] vaw_req_in;
wire [3:0] pvaw_req_in_ntt;
wire vaw_req_lat_scanin;
wire vaw_req_lat_scanout;
wire [3:0] piaw_req_in;
wire [3:0] iaw_req;
wire [3:0] iaw_req_in;
wire [3:0] piaw_req_in_ntt;
wire iaw_req_lat_scanin;
wire iaw_req_lat_scanout;
wire [3:0] ppaw_req_in;
wire [3:0] paw_req;
wire [3:0] paw_req_in;
wire [3:0] ppaw_req_in_ntt;
wire paw_req_lat_scanin;
wire paw_req_lat_scanout;
wire [3:0] pmaa_req_in;
wire [3:0] maa_req;
wire [3:0] pmaa_req_in_ntt;
wire maa_req_lat_scanin;
wire maa_req_lat_scanout;
wire [3:0] fpx_tid_dec_fw;
wire [3:0] fpd_tid_dec_fw;
wire [3:0] pfpe_req_in;
wire [3:0] fpe_req;
wire [3:0] fpe_req_in;
wire [3:0] pfpe_req_in_ntt;
wire fpe_req_lat_scanin;
wire fpe_req_lat_scanout;
wire [3:0] pfei_req_in;
wire [3:0] fei_req;
wire [3:0] fei_req_in;
wire [3:0] pfei_req_in_ntt;
wire take_fpe_last;
wire take_lsr_nns_last;
wire fei_req_lat_scanin;
wire fei_req_lat_scanout;
wire [3:0] pfof_req_in;
wire [3:0] fof_req;
wire [3:0] fof_req_in;
wire [3:0] pfof_req_in_ntt;
wire fof_req_lat_scanin;
wire fof_req_lat_scanout;
wire [3:0] ppra_req_in;
wire [3:0] pra_req;
wire [3:0] ppra_req_in_ntt;
wire pra_req_lat_scanin;
wire pra_req_lat_scanout;
wire [3:0] pdia_req_in;
wire [3:0] dia_req;
wire [3:0] dia_req_in;
wire [3:0] pdia_req_in_ntt;
wire dia_req_lat_scanin;
wire dia_req_lat_scanout;
wire [3:0] pups_req_in;
wire [3:0] ups_req;
wire [3:0] ups_req_in;
wire [3:0] pups_req_in_ntt;
wire ups_req_lat_scanin;
wire ups_req_lat_scanout;
wire [3:0] pdpv_req_in;
wire [3:0] dpv_req;
wire [3:0] dpv_req_in;
wire [3:0] pdpv_req_in_ntt;
wire dpv_req_lat_scanin;
wire dpv_req_lat_scanout;
wire [3:0] pdnc_req_in;
wire [3:0] dnc_req;
wire [3:0] dnc_req_in;
wire [3:0] pdnc_req_in_ntt;
wire dnc_req_lat_scanin;
wire dnc_req_lat_scanout;
wire [3:0] pdnf_req_in;
wire [3:0] dnf_req;
wire [3:0] dnf_req_in;
wire [3:0] pdnf_req_in_ntt;
wire dnf_req_lat_scanin;
wire dnf_req_lat_scanout;
wire [3:0] pdso_req_in;
wire [3:0] dso_req;
wire [3:0] dso_req_in;
wire [3:0] pdso_req_in_ntt;
wire dso_req_lat_scanin;
wire dso_req_lat_scanout;
wire [3:0] ptof_req_in;
wire [3:0] tof_req;
wire [3:0] tof_req_in;
wire [3:0] ptof_req_in_ntt;
wire tof_req_lat_scanin;
wire tof_req_lat_scanout;
wire [3:0] pdbz_req_in;
wire [3:0] dbz_req;
wire [3:0] dbz_req_in;
wire [3:0] pdbz_req_in_ntt;
wire dbz_req_lat_scanin;
wire dbz_req_lat_scanout;
wire [3:0] tcc_h;
wire [3:0] ptcc_req_in;
wire [3:0] tcc_req;
wire [3:0] tcc_req_in;
wire [3:0] ptcc_req_in_ntt;
wire [3:0] trap_taken3;
wire tcc_req_lat_scanin;
wire tcc_req_lat_scanout;
wire [3:0] pdae_req_in;
wire [3:0] dae_req;
wire [3:0] dae_req_in;
wire [3:0] pdae_req_in_ntt;
wire dae_req_lat_scanin;
wire dae_req_lat_scanout;
wire [3:0] dbz_incoming;
wire [3:0] plsr_req_in;
wire [3:0] lsr_req;
wire [3:0] real_trap_last;
wire [3:0] lsr_req_in;
wire [3:0] itw_req;
wire lsr_req_lat_scanin;
wire lsr_req_lat_scanout;
wire [3:0] pirt_req_in;
wire [3:0] irt_req;
wire [3:0] pirt_req_in_ntt;
wire irt_req_lat_scanin;
wire irt_req_lat_scanout;
wire [3:0] pdrt_req_in;
wire [3:0] drt_req;
wire [3:0] drt_req_in;
wire [3:0] pdrt_req_in_ntt;
wire drt_req_lat_scanin;
wire drt_req_lat_scanout;
wire d_tte_outofrange_lat_scanin;
wire d_tte_outofrange_lat_scanout;
wire [3:0] d_tte_outofrange;
wire [3:0] pdit_req_in;
wire [3:0] dit_req;
wire [3:0] dit_req_in;
wire [3:0] pdit_req_in_ntt;
wire dit_req_lat_scanin;
wire dit_req_lat_scanout;
wire [3:0] ppmu_req_in;
wire [3:0] pmu_req;
wire [3:0] ppmu_req_in_ntt;
wire pmu_req_lat_scanin;
wire pmu_req_lat_scanout;
wire [3:0] pime_req_in;
wire [3:0] ime_req;
wire [3:0] ime_req_in;
wire [3:0] pime_req_in_ntt;
wire ime_req_lat_scanin;
wire ime_req_lat_scanout;
wire [3:0] pdme_req_in;
wire [3:0] dme_req;
wire [3:0] dme_req_in;
wire [3:0] pdme_req_in_ntt;
wire dme_req_lat_scanin;
wire dme_req_lat_scanout;
wire write_itlb_lat_scanin;
wire write_itlb_lat_scanout;
wire [3:0] write_itlb;
wire [3:0] itw_req_in;
wire itw_req_lat_scanin;
wire itw_req_lat_scanout;
wire reload_done_lat_scanin;
wire reload_done_lat_scanout;
wire [3:0] reload_done;
wire [3:0] phtd_req_in;
wire [3:0] htd_req;
wire take_htd_last;
wire [3:0] htd_req_in;
wire htd_req_lat_scanin;
wire htd_req_lat_scanout;
wire i_tsb_miss_lat_scanin;
wire i_tsb_miss_lat_scanout;
wire [3:0] i_tsb_miss;
wire [3:0] phim_req_in;
wire [3:0] him_req;
wire [3:0] him_req_in;
wire [3:0] phim_req_in_ntt;
wire him_req_lat_scanin;
wire him_req_lat_scanout;
wire d_tsb_miss_lat_scanin;
wire d_tsb_miss_lat_scanout;
wire [3:0] d_tsb_miss;
wire [3:0] phdm_req_in;
wire [3:0] hdm_req;
wire [3:0] hdm_req_in;
wire [3:0] phdm_req_in_ntt;
wire hdm_req_lat_scanin;
wire hdm_req_lat_scanout;
wire [3:0] pibp_req_in;
wire [3:0] ibp_req;
wire [3:0] ibp_req_in;
wire [3:0] pibp_req_in_ntt;
wire ibp_req_lat_scanin;
wire ibp_req_lat_scanout;
wire [3:0] ptct_req_in;
wire [3:0] tct_req;
wire [3:0] tct_req_in;
wire [3:0] ptct_req_in_ntt;
wire tct_req_lat_scanin;
wire tct_req_lat_scanout;
wire [3:0] reset_category;
wire [3:0] trap_ndr;
wire [3:0] trap_taken5;
wire [3:0] disrupt_category;
wire [3:0] divide_category;
wire [3:0] long_category;
wire [3:0] fgu_category;
wire [3:0] don_ret_category;
wire [3:0] trap;
wire [3:0] notrap_category;
wire [3:0] itw_category;
wire [3:0] trap_itw;
wire [3:0] trap_itw_taken;
wire [3:0] other_category;
wire [3:0] reset_pre_trap_in;
wire [3:0] disrupt_pre_trap_in;
wire [3:0] divide_pre_trap_in;
wire [3:0] long_pre_trap_in;
wire [3:0] fgu_pre_trap_in;
wire [3:0] don_ret_pre_trap_in;
wire [3:0] notrap_pre_trap_in;
wire [3:0] itw_pre_trap_in;
wire [3:0] other_pre_trap_in;
wire reset_pre_trap_lat_scanin;
wire reset_pre_trap_lat_scanout;
wire [3:0] reset_pre_trap;
wire disrupt_pre_trap_lat_scanin;
wire disrupt_pre_trap_lat_scanout;
wire [3:0] disrupt_pre_trap;
wire divide_pre_trap_lat_scanin;
wire divide_pre_trap_lat_scanout;
wire [3:0] divide_pre_trap;
wire long_pre_trap_lat_scanin;
wire long_pre_trap_lat_scanout;
wire [3:0] long_pre_trap;
wire fgu_pre_trap_lat_scanin;
wire fgu_pre_trap_lat_scanout;
wire [3:0] fgu_pre_trap;
wire don_ret_pre_trap_lat_scanin;
wire don_ret_pre_trap_lat_scanout;
wire [3:0] don_ret_pre_trap;
wire notrap_pre_trap_lat_scanin;
wire notrap_pre_trap_lat_scanout;
wire [3:0] notrap_pre_trap;
wire itw_pre_trap_lat_scanin;
wire itw_pre_trap_lat_scanout;
wire [3:0] itw_pre_trap;
wire other_pre_trap_lat_scanin;
wire other_pre_trap_lat_scanout;
wire [3:0] other_pre_trap;
wire pre_allow_trap_in;
wire take_don;
wire take_ret;
wire take_itw;
wire pre_allow_trap_lat_scanin;
wire pre_allow_trap_lat_scanout;
wire pre_allow_trap;
wire allow_trap;
wire pre_allow_don_ret_in;
wire pre_allow_don_ret_lat_scanin;
wire pre_allow_don_ret_lat_scanout;
wire pre_allow_don_ret;
wire allow_don_ret;
wire take_reset_in;
wire take_disrupt_in;
wire take_div_in;
wire take_long_in;
wire take_fgu_in;
wire take_other_in;
wire take_don_ret_in;
wire take_itw_g_in;
wire take_notrap_in;
wire take_otr_in;
wire take_reset_lat_scanin;
wire take_reset_lat_scanout;
wire ptake_reset;
wire take_reset;
wire take_disrupt_lat_scanin;
wire take_disrupt_lat_scanout;
wire ptake_disrupt;
wire take_disrupt;
wire take_div_lat_scanin;
wire take_div_lat_scanout;
wire ptake_div;
wire take_div;
wire take_long_lat_scanin;
wire take_long_lat_scanout;
wire ptake_long;
wire take_long;
wire take_fgu_lat_scanin;
wire take_fgu_lat_scanout;
wire ptake_fgu;
wire take_fgu;
wire take_other_lat_scanin;
wire take_other_lat_scanout;
wire ptake_other;
wire take_other;
wire take_don_ret_lat_scanin;
wire take_don_ret_lat_scanout;
wire ptake_don_ret;
wire take_don_ret;
wire take_notrap_lat_scanin;
wire take_notrap_lat_scanout;
wire ptake_notrap;
wire take_notrap;
wire take_itw_lat_scanin;
wire take_itw_lat_scanout;
wire ptake_itw_g;
wire take_itw_g;
wire take_otr_lat_scanin;
wire take_otr_lat_scanout;
wire ptake_otr;
wire take_otr;
wire [3:0] take_any_dec;
wire [3:0] real_trap;
wire [3:0] take_any_dec_last;
wire take_por;
wire [3:0] take_por_dec;
wire [3:0] take_por_dec_last;
wire take_por_last;
wire take_xir;
wire take_sir;
wire take_ade;
wire take_iln;
wire take_ivt;
wire take_mqr;
wire take_dqr;
wire take_rqr;
wire take_eer;
wire take_ftt;
wire take_hst;
wire take_tlz;
wire take_sma;
wire take_cwq;
wire take_dae;
wire take_fei;
wire take_fof;
wire take_htd;
wire take_fpe;
wire take_lsr;
wire take_res;
wire take_ssr;
wire take_ssr_por;
wire take_nns;
wire take_icp;
wire take_ipe;
wire take_iae;
wire take_ipv;
wire take_inp;
wire take_iua;
wire take_iar;
wire take_irr;
wire take_mar;
wire take_mrr;
wire take_pro;
wire take_ill;
wire take_fpd;
wire take_snn;
wire take_sno;
wire take_fnn;
wire take_fno;
wire take_clw;
wire take_ldf;
wire take_stf;
wire take_dap;
wire take_pra;
wire take_vaw;
wire take_iaw;
wire take_paw;
wire take_maa;
wire take_dia;
wire take_ups;
wire take_dpv;
wire take_dnc;
wire take_dnf;
wire take_dso;
wire take_tof;
wire take_tcc;
wire take_itm;
wire take_dtm;
wire take_him;
wire take_hdm;
wire take_irt;
wire take_drt;
wire take_pmu;
wire take_ime;
wire take_dme;
wire take_ibp;
wire take_tct;
wire take_iit;
wire take_dit;
wire take_pmu_lat_scanin;
wire take_pmu_lat_scanout;
wire take_pmu_last;
wire take_ivt_lat_scanin;
wire take_ivt_lat_scanout;
wire take_sma_last;
wire take_cwq_last;
wire take_xir_last;
wire take_ftt_last;
wire take_rstnpor;
wire [3:0] trap_not_por;
wire [3:0] trap_taken_in;
wire trap_taken_lat_scanin;
wire trap_taken_lat_scanout;
wire [3:0] trap_taken;
wire trap_taken0_lat_scanin;
wire trap_taken0_lat_scanout;
wire trap_taken1_lat_scanin;
wire trap_taken1_lat_scanout;
wire trap_taken2_lat_scanin;
wire trap_taken2_lat_scanout;
wire trap_taken3_lat_scanin;
wire trap_taken3_lat_scanout;
wire trap_taken4_lat_scanin;
wire trap_taken4_lat_scanout;
wire [3:0] trap_taken4;
wire trap_taken5_lat_scanin;
wire trap_taken5_lat_scanout;
wire trap_itw_taken_lat_scanin;
wire trap_itw_taken_lat_scanout;
wire take_reset_last_lat_scanin;
wire take_reset_last_lat_scanout;
wire take_reset_last;
wire [8:0] trap_type_in;
wire [3:0] int_level_n;
wire [2:0] wstate;
wire [7:0] tcc_number;
wire no_special_trap;
wire next_trap_to_red;
wire next_trap_to_err;
wire priv_overflow_tl;
wire next_trap_to_hpriv;
wire sip;
wire [8:0] trap_type_for_pc_in;
wire trap_type_lat_scanin;
wire trap_type_lat_scanout;
wire [8:0] trap_type;
wire trap_type_for_pc_lat_scanin;
wire trap_type_for_pc_lat_scanout;
wire [8:0] trap_type_for_pc;
wire hpstate_hpriv_lat_scanin;
wire hpstate_hpriv_lat_scanout;
wire [3:0] hpstate_hpriv;
wire [3:0] h_wr_tl;
wire [3:0] n_wr_tl;
wire [2:0] tl_h_wr_data;
wire [2:0] tl_n_wr_data;
wire [3:0] hold_tl;
wire [3:0] npc_sel_tnpc;
wire [2:0] tl3_incr;
wire [2:0] tl3;
wire [2:0] tl3_decr;
wire [2:0] tl3_in;
wire [3:0] tlz_in;
wire [2:0] tl2_incr;
wire [2:0] tl2;
wire [2:0] tl2_decr;
wire [2:0] tl2_in;
wire [2:0] tl1_incr;
wire [2:0] tl1;
wire [2:0] tl1_decr;
wire [2:0] tl1_in;
wire [2:0] tl0_incr;
wire [2:0] tl0;
wire [2:0] tl0_decr;
wire [2:0] tl0_in;
wire tl_lat_scanin;
wire tl_lat_scanout;
wire tlz_lat_scanin;
wire tlz_lat_scanout;
wire [3:0] tlz;
wire [3:0] thread_sel;
wire [3:0] tl_gt_0_in;
wire [3:0] tl_gt_0;
wire tl_gt_0_last_lat_scanin;
wire tl_gt_0_last_lat_scanout;
wire [2:0] trap_tl;
wire [2:0] trap_tl_m1;
wire [2:0] rda_tl_m1;
wire [1:0] wr_gl_data_in_in;
wire [1:0] gl_data_in_in;
wire [3:0] update_gl_in_in;
wire wr_gl_lat_scanin;
wire wr_gl_lat_scanout;
wire [3:0] update_gl_in;
wire [1:0] gl_data_in;
wire [3:0] update_gl;
wire [1:0] gl_data;
wire [1:0] maxglc;
wire other_trap;
wire hpriv_last;
wire reset_trap;
wire [3:0] take_anr_dec_last;
wire [3:0] hold_gl;
wire saturate_restore;
wire [1:0] pgl_rest_in;
wire [1:0] gl_rest_in;
wire gl_rest_lat_scanin;
wire gl_rest_lat_scanout;
wire [1:0] gl_rest;
wire [1:0] gl3_incr;
wire [1:0] gl3;
wire [1:0] gl3_in;
wire [1:0] gl2_incr;
wire [1:0] gl2;
wire [1:0] gl2_in;
wire [1:0] gl1_incr;
wire [1:0] gl1;
wire [1:0] gl1_in;
wire [1:0] gl0_incr;
wire [1:0] gl0;
wire [1:0] gl0_in;
wire [1:0] trap_gl_in;
wire gl_lat_wmr_scanin;
wire gl_lat_wmr_scanout;
wire mbist_run_lat_scanin;
wire mbist_run_lat_scanout;
wire mbist_run;
wire [4:0] wr_addr_in_in;
wire [4:0] wr_addr_func_in;
wire rmw_tsa;
wire [4:0] wr_addr_in_p;
wire [4:0] rmw_addr;
wire [4:0] wr_addr_in;
wire tsa_wr_addr_lat_scanin;
wire tsa_wr_addr_lat_scanout;
wire [4:0] wr_addr;
wire [2:0] don_ret_tl_m1;
wire [4:0] rd_addr_in;
wire tsa_rd_addr_lat_scanin;
wire tsa_rd_addr_lat_scanout;
wire [4:0] rd_addr;
wire rmw_addr_lat_scanin;
wire rmw_addr_lat_scanout;
wire rmw_tsa_lat_scanin;
wire rmw_tsa_lat_scanout;
wire rmw_next;
wire [3:0] pil3_in;
wire [3:0] pil3;
wire [3:0] pil2_in;
wire [3:0] pil2;
wire [3:0] pil1_in;
wire [3:0] pil1;
wire [3:0] pil0_in;
wire [3:0] pil0;
wire pil3_lat_wmr_scanin;
wire pil3_lat_wmr_scanout;
wire pil2_lat_wmr_scanin;
wire pil2_lat_wmr_scanout;
wire pil1_lat_wmr_scanin;
wire pil1_lat_wmr_scanout;
wire pil0_lat_wmr_scanin;
wire pil0_lat_wmr_scanout;
wire [5:0] tic_compare_in;
wire tic_compare_lat_scanin;
wire tic_compare_lat_scanout;
wire [5:0] tic_compare;
wire [16:0] tick3_compare;
wire [16:0] softint3_mux;
wire [16:0] softint3;
wire [16:0] softint3_mask;
wire [16:0] softint3_in;
wire [16:0] tick2_compare;
wire [16:0] softint2_mux;
wire [16:0] softint2;
wire [16:0] softint2_mask;
wire [16:0] softint2_in;
wire [16:0] tick1_compare;
wire [16:0] softint1_mux;
wire [16:0] softint1;
wire [16:0] softint1_mask;
wire [16:0] softint1_in;
wire [16:0] tick0_compare;
wire [16:0] softint0_mux;
wire [16:0] softint0;
wire [16:0] softint0_mask;
wire [16:0] softint0_in;
wire softint3_lat_wmr_scanin;
wire softint3_lat_wmr_scanout;
wire softint2_lat_wmr_scanin;
wire softint2_lat_wmr_scanout;
wire softint1_lat_wmr_scanin;
wire softint1_lat_wmr_scanout;
wire softint0_lat_wmr_scanin;
wire softint0_lat_wmr_scanout;
wire pstate_ie_lat_scanin;
wire pstate_ie_lat_scanout;
wire [3:0] pstate_ie;
wire [16:0] pil3_mask;
wire [16:0] pil2_mask;
wire [16:0] pil1_mask;
wire [16:0] pil0_mask;
wire pmu_trap_mask_d;
wire pmu_trap_mask_lat_scanin;
wire pmu_trap_mask_lat_scanout;
wire pmu_trap_mask_e;
wire [15:1] sim3;
wire [15:1] sim2;
wire [15:1] sim1;
wire [15:1] sim0;
wire [3:0] int_level_n_3;
wire [3:0] int_level_n_2;
wire [3:0] int_level_n_1;
wire [3:0] int_level_n_0;
wire [3:0] int_level_n_3_last;
wire [3:0] int_level_n_2_last;
wire [3:0] int_level_n_1_last;
wire [3:0] int_level_n_0_last;
wire int_level_n_lat_scanin;
wire int_level_n_lat_scanout;
wire hstick3_compare;
wire hintp3_in;
wire hintp3;
wire hstick2_compare;
wire hintp2_in;
wire hintp2;
wire hstick1_compare;
wire hintp1_in;
wire hintp1;
wire hstick0_compare;
wire hintp0_in;
wire hintp0;
wire hintp_lat_wmr_scanin;
wire hintp_lat_wmr_scanout;
wire [3:0] tccd_in;
wire [3:0] tcud_in;
wire tccd_exc_lat_scanin;
wire tccd_exc_lat_scanout;
wire [3:0] tccd;
wire tcud_exc_lat_scanin;
wire tcud_exc_lat_scanout;
wire [3:0] tcud;
wire tic_index_lat_scanin;
wire tic_index_lat_scanout;
wire [4:3] tic_index;
wire [3:0] tsacu_en_in;
wire [3:0] tpe_exc_in;
wire tpe_exc_lat_scanin;
wire tpe_exc_lat_scanout;
wire tsa_index_lat_scanin;
wire tsa_index_lat_scanout;
wire [2:0] tsa_index;
wire p_trap_lat_scanin;
wire p_trap_lat_scanout;
wire [3:0] p_trap;
wire [16:0] rd_softint3;
wire [16:0] rd_softint2;
wire [16:0] rd_softint1;
wire [16:0] rd_softint0;
wire [16:0] asi_data_in;
wire asi_data_lat_scanin;
wire asi_data_lat_scanout;
wire [16:0] asi_data;
wire [3:0] enter_red_in;
wire enter_red_lat_scanin;
wire enter_red_lat_scanout;
wire [3:0] enter_red;
wire stb_empty_lat_scanin;
wire stb_empty_lat_scanout;
wire window_block_in;
wire ccr_cwp_valid;
wire window_block_lat_scanin;
wire window_block_lat_scanout;
wire don_ret_last_last;
wire take_lat_scanin;
wire take_lat_scanout;
wire ptake_don_last;
wire ptake_ret_last;
wire take_res_last;
wire take_ssr_por_last;
wire take_icp_last;
wire take_nns_last;
wire take_htd_icp_last;
wire take_last_lat_scanin;
wire take_last_lat_scanout;
wire don_ret_last;
wire take_don_last_last;
wire take_htd_icp_last_last;
wire take_don_last_last_last;
wire don_ret_last_last_last;
wire thread_sel_lat_scanin;
wire thread_sel_lat_scanout;
wire no_pstate_update;
wire pstate_am_lat_scanin;
wire pstate_am_lat_scanout;
wire [3:0] pstate_am;
wire take_ssr_pc_valid;
wire take_ssr_pc_invalid;
wire pc_sel_pc_in;
wire pc_sel_npc_in;
wire pc_sel_trap_in;
wire pc_sel_reset0_in;
wire pc_sel_reset1_in;
wire pc_done_in;
wire pc_retry_in;
wire pc_tte_in;
wire pc_npc_sel_lat_scanin;
wire pc_npc_sel_lat_scanout;
wire pc_sel_pc;
wire pc_sel_npc;
wire pc_sel_trap;
wire pc_sel_reset0;
wire pc_sel_reset1;
wire pc_done;
wire pc_retry;
wire pc_tte;
wire wr_en_in_in;
wire wr_en_func_in;
wire wr_en_in_p;
wire wr_en_in;
wire rd_en_in;
wire stack_lat_scanin;
wire stack_lat_scanout;
wire tsa_rd_en;
wire tsa_wr_en;
wire tsa_rd_en_last;
wire [3:0] check_tsa_ecc_in;
wire enable_tel_in;
wire check_tel_lat_scanin;
wire check_tel_lat_scanout;
wire enable_tel;
wire check_tel_in;
wire check_tel;
wire take_notrap_not_suppressed;
wire m107773_suppress_notrap_;
wire trap_pc_valid_in_in;
wire trap_pc_valid_in;
wire ptrap_pc_valid_in;
wire kill_fpe;
wire kill_lsr_nns;
wire m107773_suppress_pcvi;
wire real_trap_pc_valid_in;
wire npc_is_nonseq;
wire htd_res_icp_when_npc_nonseq;
wire htd_res_icp_when_npc_nonseq_last_lat_scanin;
wire htd_res_icp_when_npc_nonseq_last_lat_scanout;
wire htd_res_icp_when_npc_nonseq_last;
wire retry_in_in;
wire nns_exc;
wire retry_in;
wire pretry_in;
wire pc_valid_lat_scanin;
wire pc_valid_lat_scanout;
wire trap_pc_valid;
wire [1:0] trap_tid_in;
wire [1:0] ccr_cwp_asi_tid;
wire trap_tid_lat_scanin;
wire trap_tid_lat_scanout;
wire [1:0] trap_tid;
wire take_itw_last_lat_scanin;
wire take_itw_last_lat_scanout;
wire take_itw_last_last;
wire icache_perr_lat_scanin;
wire icache_perr_lat_scanout;
wire take_icp_last_last;
wire reset_trap_in;
wire in_red;
wire hpriv;
wire next_trap_in_hpriv;
wire take_tcc_nh;
wire stay_in_priv_in;
wire take_tcc_h;
wire pre_oti;
wire oti;
wire other_trap_in;
wire pstate_sel_lat_scanin;
wire pstate_sel_lat_scanout;
wire stay_in_priv;
wire [3:0] ccr_cwp_valid_per_thread;
wire [1:0] ccr_cwp_asi_tid_in_in;
wire ccr_cwp_asi_tid_lat_scanin;
wire ccr_cwp_asi_tid_lat_scanout;
wire [1:0] ccr_cwp_asi_tid_in;
wire [3:0] clear_ctl_reg_in;
wire clear_ctl_reg_lat_scanin;
wire clear_ctl_reg_lat_scanout;
wire [3:0] clear_ctl_reg;
wire [3:0] pnpc_nonseq_in;
wire [3:0] npc_nonseq_in;
wire nns_exc_in;
wire npc_nonseq_lat_scanin;
wire npc_nonseq_lat_scanout;
wire [3:0] npc_nonseq;
wire [3:0] trap_tid_in_dec;
wire [3:0] pc_sel_trap_pc_in;
wire pc_sel_trap_pc_lat_scanin;
wire pc_sel_trap_pc_lat_scanout;
wire [3:0] pc_sel_trap_pc;
wire [3:0] npc_sel_trap_npc_in;
wire npc_sel_trap_npc_lat_scanin;
wire npc_sel_trap_npc_lat_scanout;
wire [3:0] npc_sel_trap_npc;
wire [3:0] check_tsa_ecc_in_in;
wire [3:0] tsacu_en_in_in;
wire check_tsa_ecc_lat_scanin;
wire check_tsa_ecc_lat_scanout;
wire [3:0] check_tsa_ecc;
wire [3:0] trap_tid_dec;
wire [3:0] htd_icp_complete;
wire shscanid_lat_scanin;
wire shscanid_lat_scanout;
wire [2:0] shscanid;
wire [2:0] shadow_tl;
wire capture_ss_in;
wire capture_ss_lat_scanin;
wire capture_ss_lat_scanout;
wire capture_ss;
wire [2:0] tl_for_tt_in;
wire [2:0] tl_for_tt;
wire tl_for_tt_lat_scanin;
wire tl_for_tt_lat_scanout;
wire spares_scanin;
wire spares_scanout;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input		lsu_tlu_pmen;

input	[2:0]	tcu_shscanid;		// Select which thread to shadow
input		tcu_ss_mode;
input		tcu_do_mode;

input		thread_group;		// Which thread group?

input		mbi_run;		// MBIST

input	[3:0]	ftu_ifu_quiesce;
input	[3:0]	pku_quiesce;

input		exu_tlu_window_block;	// EXU needs hole for CWP change

input	[3:0]	lsu_stb_empty;		// Store buffer empty (for entering RED)

input		fgu_fpx_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpd_ieee_trap_fw;	// IEEE 754 trap exception
input		fgu_fpx_unfin_fw; 	// Other FGU exception
input		fgu_fpd_unfin_fw; 	// Other divide exception
input		fgu_fpd_idiv0_trap_fw;
input	[2:0]	fgu_fpx_trap_tid_fw;	// TID for FGU exceptions except divide
input	[2:0]	fgu_fpd_trap_tid_fw;	// TID for divide exception

input	[3:0]	mmu_write_itlb;		// Write ITLB
input	[3:0]	mmu_reload_done;	// Hardware tablewalk done
input	[3:0]	mmu_i_unauth_access;	// Hardware tablewalk ITSB with EP=0
input	[3:0]	mmu_i_tsb_miss;		// Hardware tablewalk missed
input	[3:0]	mmu_d_tsb_miss;		// Hardware tablewalk missed
input	[3:0]	mmu_i_tte_outofrange;	// RA out of range
input	[3:0]	mmu_d_tte_outofrange;	// RA out of range

input		spu_pmu_ma_busy;	// MA must be idle before parking
input		spu_tlu_cwq_busy;	// Must idle before soft stop parking
input	[2:0]	spu_tlu_ma_int_req;	// Thread that MA is working on

input	[2:0]	fls_wstate0;		// WSTATE for thread 0
input	[2:0]	fls_wstate1;		// WSTATE for thread 1
input	[2:0]	fls_wstate2;		// WSTATE for thread 2
input	[2:0]	fls_wstate3;		// WSTATE for thread 3

input	[7:0]	fls_tcc_number_0;	// Trap number for Tcc thread 0
input	[7:0]	fls_tcc_number_1;	// Trap number for Tcc thread 1
input	[7:0]	fls_tcc_number_2;	// Trap number for Tcc thread 2
input	[7:0]	fls_tcc_number_3;	// Trap number for Tcc thread 3

input	[1:0]	fls_tid_d;		// TID for pic_overflow mask
input	[3:0]	fls_tid_dec_w_in;	// Decoded TID for nonstranded requests

input	[3:0]	fls_por_request;	// POR trap request
input	[3:0]	fls_xir_request;	// XIR trap request
input	[3:0]	fls_ivt_request;	// Interrupt Vector Trap request
input	[3:0]	fls_sir_request;	// SIR trap request
input	[3:0]	fls_itm_request;	// ITLB miss trap request
input	[3:0]	fls_iln_request;	// Interrupt level n request
input	[3:0]	fls_hst_request;	// hstick_match request
input	[3:0]	fls_tlz_request;	// TL equals zero request
input	[3:0]	fls_sma_request;	// SPU Modular Arithmetic request
input	[3:0]	fls_cwq_request;	// SPU Control Word Queue request
input	[3:0]	fls_ade_request;	// Async data error trap request
					// 	(Disrupting error on store, HWTW
input	[3:0]	fls_iae_request;	// Instruction access error trap request
input	[3:0]	fls_ipe_request;	// Internal processor error trap request
					// 	(Error on array access, etc.)
input		fls_ipv_request;	// IAE_privilege_violation trap request
input		fls_inp_request;	// IAE_nfo_page trap request
input		fls_iar_request;	// instruction_address_range trap equest
input		fls_irr_request;	// instruction_real_range trap equest
input		fls_mar_request;	// mem_address_range trap request
input		fls_mrr_request;	// mem_real_range trap request
input		fls_pro_request;	// Privileged opcode trap request
input		fls_ill_request;	// Illegal instruction trap request
input		fls_don_request;	// Done instruction
input		fls_ret_request;	// Retry instruction
input		fls_fpd_request;	// FP disabled trap request
input		fls_snn_request;	// Spill normal trap request
input		fls_sno_request;	// Spill other trap request
input		fls_fnn_request;	// Fill normal trap request
input		fls_fno_request;	// Fill other trap request
input		fls_clw_request;	// Clean window trap request
input	[3:0]	fls_dtm_request;	// DTLB miss trap request
input		fls_ldf_request;	// lddf alignment trap request
input		fls_stf_request;	// stdf alignment trap request
input		fls_dap_request;	// data_access_protection request
input		fls_vaw_request;	// VA watchpoint trap request
input		fls_iaw_request;	// Instruction VA watchpoint trap req
input		fls_paw_request;	// PA watchpoint trap request
input		fls_maa_request;	// Memory address alignment trap request
input		fls_fpe_request;	// FP predicted exception
input	[3:0]	fls_fei_request;	// FP IEEE 754 trap request
input	[3:0]	fls_fof_request;	// FP other trap request (unfinished)
input	[3:0]	fls_pra_request;	// Privileged action trap request
input		fls_dia_request;	// DAE_invalid_asi trap request
input	[3:0]	fls_ups_request;	// unsupported_page_size trap request
input		fls_dpv_request;	// DAE_privilege_violation trap request
input		fls_dnc_request;	// DAE_nc_page trap request
input		fls_dnf_request;	// DAE_nfo_page trap request
input		fls_dso_request;	// DAE_so_page trap request
input		fls_tof_request;	// Tag overflow trap request
input	[3:0]	fls_dbz_request;	// Divide by zero trap request
input		fls_tcc_request;	// Trap instruction trap request
input	[3:0]	fls_dae_request;	// LSU uncorrectable ECC on load miss
input	[3:0]	fls_lsr_request;	// LSU sync redirect to NPC (postsync)
input		fls_irt_request;	// Instruction real translation miss
input		fls_drt_request;	// Data real translation miss
input	[3:0]	fls_pmu_request;	// pic_overflow
input 	[3:0]	fls_mqr_request;	// CPU mondo trap request
input 	[3:0]	fls_dqr_request;	// Device mondo trap request
input 	[3:0]	fls_rqr_request;	// Resumable error trap request
input 	[3:0]	fls_idl_request;	// CMP idle request
input 	[3:0]	fls_res_request;	// CMP resume request
input	[3:0]	fls_ssr_request;	// Single step request
input	[3:0]	fls_ssc_request;	// Single step completion
input 	[3:0]	fls_nns_request;	// NPC nonsequential redirect request
input 	[3:0]	fls_ime_request;	// Instruction_access_MMU_error request
input 	[3:0]	fls_dme_request;	// Data_access_MMU_error request
input 	[3:0]	fls_eer_request;	// ECC_error request
input 		fls_icp_request;	// Icache parity error (ivalidate)
input 	[3:0]	fls_ftt_request;	// Fatal_thread_trap request
input 		fls_ibp_request;	// Instruction breakpoint request
input 		fls_tct_request;	// Trap on control transfer request
input 		fls_ref_request;	// Refetch inst 

input	[3:0]	fls_pc_valid;

input 	[3:0]	pmu_tlu_trap_m;		// pic_overflow is pending

input	[3:0]	fls_trl_l1en;		// Power management for trl
input	[3:0]	fls_core_running;	// Power management
input	[3:0]	tlu_flush_ifu;		// Used for power management

input 	[3:0]	pct_npc_is_nonseq;	// NPC nonsequential, per thread

input 		trlx_itw_wait;		// Other thread group forces ITLB write
                                        // in this group to wait 
input 		trlx_itw_last;		

input	[1:0]	tsa_gl;
input 		tsa_tnpc_nonseq;
input	[3:0]	tel_tsacu_exc;

input	[3:0] tlu_ceter_de;
input	[3:0] tlu_ceter_pscce;

input 	[3:0]	tsd_hpstate_red;
input 	[3:0]	tsd_hpstate_hpriv;
input 	[3:0]	tsd_hpstate_tlz;
input	[3:0]	tsd_pstate_ie;
input	[3:0]	tsd_pstate_am;
input		tsd_htstate_hpriv;	// For saturating GL restore

input	[4:0]	tic_addr;
input		tic_not_valid;
input		tic_match;
input		cel_tccd;
input		cel_tcud;

input	[4:0]	asi_tsa_rd_addr;
input		asi_tsa_rd_iqr_ecc;
input	[1:0]	asi_tsa_tid;
input	[3:0]	asi_rd_tl;
input	[3:0]	asi_wr_tl;
input	[3:0]	asi_rd_pil;
input	[3:0]	asi_wr_pil;
input	[3:0]	asi_rd_gl;
input	[3:0]	asi_wr_gl;
input	[3:0]	asi_wr_set_softint;
input	[3:0]	asi_wr_clear_softint;
input	[3:0]	asi_rd_softint;
input	[3:0]	asi_wr_softint;
input	[3:0]	asi_rd_hintp;
input	[3:0]	asi_wr_hintp;
input	[16:0]	asi_wr_data;
input		asi_preempt_trap;
input		asi_preempt_done_retry;
input		asi_rmw_tsa;
input	[3:0]	asi_wr_asireg;		// Power management
input		asi_trl_pstate_en;	// Power management
input	[4:0]	asi_mbist_addr;		// MBIST
input		asi_mbist_tsa_rd_en;	// MBIST
input		asi_mbist_tsa_wr_en;	// MBIST


output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

output	[3:0]	spc_core_running_status;

output	[3:0]	trl_core_running_status;

output	[3:0]	trl_pil_mask_15;	// PIL_mask[15]
output 	[3:0]	trl_iln_exc;		// interrupt_level_n exception
output	[3:0]	trl_hstick_match;	// HSTICK_CMPR matches TICK
output	[3:0]	trl_unhalt_;		// Raw *TICK_CMPR matches
output	[3:0]	trl_tlz_exc;		// TL equals zero exception
output 	[3:0]	trl_nns_exc;		// Retry with nonsequential NPC
output 	[3:0]	trl_ssc_exc;		// Single step complete exception
output		trl_take_sma;		// SPU Modular Arithmetic trap taken
output		trl_take_cwq;		// SPU Control Word Queue trap taken
output		trl_take_xir;		// Hold XIR request until trap is taken
output		trl_take_ftt;		// Hold store_error rq until trap taken

output 	[3:0]	trl_pc_sel_trap_pc;	// Trap, retry, or done taken; update PC
output 	[3:0]	trl_npc_sel_trap_npc;	// Trap taken; update NPC
output 	[3:0]	trl_npc_sel_tnpc;	// Retry or done taken; update NPC
output 	[3:0]	trl_invalidate_pc;	// Trap, done, retry, or HW TW complete
output 	[3:0]	trl_invalidate_npc;	// Trap, retry, or HW TW complete
output	[8:0] trl_trap_type;		// Trap type generated from trap request
output	[8:0]	trl_tsa_trap_type;	// Trap type generated from trap request
output	[4:0]	trl_asireg_sel;		// Which asireg to update?
output		trl_asireg_en;		// Power management
output	[3:0]	trl_thread_sel;		// Which thread to trap?
output	[2:0]	trl_tba_sel;		// Which thread & to HPRIV?
output	[4:0]	trl_pstate_thread_sel;	// Which pstate to update?
output	[3:0]	trl_don_ret_pstate_sel;	// Which pstate to update?
output		trl_pstate_en;		// Power management
output	[3:0]	trl_pc_thread_sel;	// Which PC, NPC to use?
output		trl_pc_pstate_am_;
output		trl_pc_sel_pc;		// Retry the excepting instruction
output		trl_pc_sel_npc;		// Advance to the next instruction
output		trl_pc_sel_trap;	// Select the trap PC
output		trl_pc_sel_reset;	// Select the reset PC
output		trl_pc_done;		// Select the NPC from the stack
output		trl_pc_retry;		// Select the PC from the stack
output		trl_pc_tte;		// Select the TTE for ITLB write
output		trl_pct_trap_pc_en;	// Power management
output		trl_pct_tnpc_en;
output		trl_stay_in_priv;	// Trap should be in priv, not hyperpriv
output		trl_reset_trap;
output		trl_other_trap;
output		trl_tl_gt_0;
output	[3:0]	trl_tl_eq_0;


output		trl_tsa_wr_en;		// Store an entry on the trap stack
output		trl_tsa_rd_en;		// Retrieve an entry off the trap stack
output	[4:0]	trl_tsa_wr_addr;
output	[4:0]	trl_tsa_rd_addr;
output		trl_save_tsa;
output		trl_tsd_tsa_en;		// Power management
output		trl_tsd_tsa_wd_en;	// Power management
output		trl_capture_ss;		// Capture signal for TPC and TT
output		trl_rmw_tsa;

output	[1:0]	trl_tsa_gl;

output 	[16:0]	trl_asi_data;

output 	[3:0]	trl_ss_complete;

output 		trl_itw_wait;
output 		trl_itw_last;

output	[1:0]	trl_shscanid;
output		trl_shscanid_2;
output	[2:0]	trl_shadow_tl;
output	[2:0]	trl_tl_for_tt;

output	[3:0]	trl_fls_npc_en;		// Power management for NPC flops
output		trl_tel_en;		// Power management for tel

output	[3:0]	trl_trap_taken;		// To recycle disrupting requests

output	[1:0]	trl_gl0;
output	[1:0]	trl_gl1;
output	[1:0]	trl_gl2;
output	[1:0]	trl_gl3;

output	[3:0] trl_tsacu_en_in;
output	[2:0] tlu_tsa_index;
output	[3:0] tlu_tccd;
output	[3:0] tlu_tcud;
output	[1:0] tlu_tca_index;


output		tlu_window_block;

output		tlu_trap_pc_valid;
output		tlu_retry;
output		tlu_ifu_invalidate;
output	[1:0]	tlu_trap_tid;
output		tlu_itlb_reload;
output		tlu_ccr_cwp_valid;
output	[1:0]	tlu_ccr_cwp_tid;
output		tlu_asi_valid;
output	[1:0]	tlu_asi_tid;
output	[1:0]	tlu_gl0;
output	[1:0]	tlu_gl1;
output	[1:0]	tlu_gl2;
output	[1:0]	tlu_gl3;

output	[3:0]	tlu_tl_gt_0;

output	[3:0]	tlu_mmu_tl_gt_0;

output	[3:0]	tlu_release_tte;

output 	[3:0]	tlu_lsu_clear_ctl_reg_;

output 	[3:0]	tlu_pmu_trap_taken;

output		tlu_pmu_trap_mask_e;



////////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;

assign maxtl[2:0] = 3'b110;
assign maxptl[2:0] = 3'b010;
assign maxtl_minus_one[2:0] = maxtl[2:0] - 3'b001;
assign maxgl[1:0] = 2'b11;



////////////////////////////////////////////////////////////////////////////////
// Clock header for freerunning flops

tlu_trl_ctl_l1clkhdr_ctl_macro clkgen (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



////////////////////////////////////////////////////////////////////////////////
// Power management

assign thread_active[3:0] =
       fls_core_running[3:0] | core_running_status[3:0];

assign clear_l1en_per_thread_int[3:0] =
       trap_taken0[3:0] & ~{4 {take_itw_last}} & 
       {4 {suppress_don_ret_taken_}};

tlu_trl_ctl_msff_ctl_macro__width_4 flush_ifu_last_lat  (
	.scan_in(flush_ifu_last_lat_scanin),
	.scan_out(flush_ifu_last_lat_scanout),
	.din	(tlu_flush_ifu		[3:0]	),
	.dout	(flush_ifu_last		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign l1en_per_thread_int_in[3:0] =
       tlu_flush_ifu[3:0] | 
       flush_ifu_last[3:0] | 
       fls_res_request[3:0] | // No flush for resume
       fls_lsr_request[3:0] | // No flush for all LSR requests
       fls_nns_request[3:0] |
       fls_ssr_request[3:0] |
       mmu_write_itlb[3:0] |
       (l1en_per_thread_int[3:0] & ~clear_l1en_per_thread_int[3:0] & 
	thread_active[3:0]) |
       {4 {~lsu_tlu_pmen}};

tlu_trl_ctl_msff_ctl_macro__width_4 l1en_per_thread_int_lat  (
	.scan_in(l1en_per_thread_int_lat_scanin),
	.scan_out(l1en_per_thread_int_lat_scanout),
	.din	(l1en_per_thread_int_in	[3:0]	),
	.dout	(l1en_per_thread_int	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Dones and retries need an extra cycle

assign l1en_don_ret_in[3:0] =
       trap_taken0[3:0] & {4 {take_don_last | take_ret_last}};

tlu_trl_ctl_msff_ctl_macro__width_4 l1en_don_ret_lat  (
	.scan_in(l1en_don_ret_lat_scanin),
	.scan_out(l1en_don_ret_lat_scanout),
	.din	(l1en_don_ret_in	[3:0]	),
	.dout	(l1en_don_ret		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign l1en_per_thread[3:0] =
       fls_trl_l1en[3:0] | l1en_per_thread_int[3:0] | l1en_don_ret[3:0];

tlu_trl_ctl_l1clkhdr_ctl_macro t3_clken (
        .l2clk  (l2clk 				),
        .l1en   (l1en_per_thread	[3   ]	),
        .l1clk  (l1clk_pm4			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

tlu_trl_ctl_l1clkhdr_ctl_macro t2_clken (
        .l2clk  (l2clk 				),
        .l1en   (l1en_per_thread	[2   ]	),
        .l1clk  (l1clk_pm3			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

tlu_trl_ctl_l1clkhdr_ctl_macro t1_clken (
        .l2clk  (l2clk 				),
        .l1en   (l1en_per_thread	[1   ]	),
        .l1clk  (l1clk_pm2			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

tlu_trl_ctl_l1clkhdr_ctl_macro t0_clken (
        .l2clk  (l2clk 				),
        .l1en   (l1en_per_thread	[0   ]	),
        .l1clk  (l1clk_pm1			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



////////////////////////////////////////////////////////////////////////////////
// Record trap requests

tlu_trl_ctl_msff_ctl_macro__width_4 tid_dec_w_lat  (
	.scan_in(tid_dec_w_lat_scanin),
	.scan_out(tid_dec_w_lat_scanout),
	.din	(fls_tid_dec_w_in	[3:0]	),
	.dout	(tid_dec_w		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// Must wait for CWQ to go idle if this is a soft stop parking request
assign cwq_busy_in =
       spu_tlu_cwq_busy;

tlu_trl_ctl_msff_ctl_macro__width_1 cwq_busy_lat  (
	.scan_in(cwq_busy_lat_scanin),
	.scan_out(cwq_busy_lat_scanout),
	.din	(cwq_busy_in			),
	.dout	(cwq_busy			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign cwq_interlock_[3:0] =
       ~{4 {cwq_busy}};

// Don't quiesce until TLB updates are complete
// DTLB is covered by LSU which is covered by PKU, but
// ITLB is only known by TLU
assign quiesced_in[3:0] =
       stb_empty[3:0] & i_quiesce[3:0] & 
       p_quiesce[3:0] & ma_idle[3:0] & cwq_interlock_[3:0] & 
       ~pitw_req_in[3:0];

tlu_trl_ctl_msff_ctl_macro__width_8 quiesced_lat  (
	.scan_in(quiesced_last_lat_scanin),
	.scan_out(quiesced_last_lat_scanout),
	.din	({quiesced_in		[3:0],
		  quiesced		[3:0]}),
	.dout	({quiesced		[3:0],
		  quiesced_last		[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// Idle must suppress other pending (synchronous) traps 
assign pidl_req_in[3:0] = 
	(fls_idl_request[3:0] | idl_req[3:0]) & 
	core_running_status[3:0];

assign idl_req_in[3:0] =
       pidl_req_in[3:0] & quiesced[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 idl_req_lat   (
	.scan_in(idl_req_lat_scanin),
	.scan_out(idl_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pidl_req_in		[3:0]	),
	.dout	(idl_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 i_quiesce_lat  (
	.scan_in(i_quiesce_lat_scanin),
	.scan_out(i_quiesce_lat_scanout),
	.din	(ftu_ifu_quiesce	[3:0]	),
	.dout	(i_quiesce		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 p_quiesce_lat  (
	.scan_in(p_quiesce_lat_scanin),
	.scan_out(p_quiesce_lat_scanout),
	.din	(pku_quiesce		[3:0]	),
	.dout	(p_quiesce		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 ma_busy_lat  (
	.scan_in(ma_busy_lat_scanin),
	.scan_out(ma_busy_lat_scanout),
	.din	({spu_pmu_ma_busy	       ,
		  spu_tlu_ma_int_req	[2:0]}),
	.dout	({ma_busy		       ,
		  ma_tid		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ma_idle[3:0] =
       ~({4 {ma_busy & (ma_tid[2] == thread_group)}} &
         {ma_tid[1:0] == 2'b11,
          ma_tid[1:0] == 2'b10,
          ma_tid[1:0] == 2'b01,
          ma_tid[1:0] == 2'b00});

// Report status once thread is actually idle
assign core_running_status_in[3:0] =
       (core_running_status[3:0] | trap_por_res_ssr[3:0]) & 
       ~idl_req_in[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 core_running_status_lat   (
	.scan_in(core_running_status_lat_scanin),
	.scan_out(core_running_status_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(core_running_status_in	[3:0]	),
	.dout	(core_running_status	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ever_been_running_in[3:0] =
       ever_been_running[3:0] | core_running_status[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 ever_been_running_lat  (
	.scan_in(ever_been_running_lat_scanin),
	.scan_out(ever_been_running_lat_scanout),
	.din	(ever_been_running_in	[3:0]	),
	.dout	(ever_been_running	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign spc_core_running_status[3:0] = 
       core_running_status[3:0];

assign trl_core_running_status[3:0] = 
       core_running_status[3:0];



assign pdisrupting_req[3:0] = 4'h0;
assign disrupting_req[3:0] = 4'h0;


assign por_req_in[3:0] = 
	(fls_por_request[3:0] | por_req[3:0]);
assign por_req_in_ntt[3:0] = 
	por_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 por_req_lat   (
	.scan_in(por_req_lat_scanin),
	.scan_out(por_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(por_req_in_ntt		[3:0]	),
	.dout	(por_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pxir_req_in[3:0] = 
	(fls_xir_request[3:0] | xir_req[3:0]);

assign xir_req_in[3:0] =
       pxir_req_in[3:0] & stb_empty[3:0];

assign pxir_req_in_ntt[3:0] =
	pxir_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 xir_req_lat   (
	.scan_in(xir_req_lat_scanin),
	.scan_out(xir_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pxir_req_in_ntt	[3:0]	),
	.dout	(xir_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign peer_req_in[3:0] = 
	fls_eer_request[3:0] | eer_req[3:0];

assign eer_req_in[3:0] =
       peer_req_in[3:0] & stb_empty[3:0];

assign peer_req_in_ntt[3:0] =
	peer_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 eer_req_lat   (
	.scan_in(eer_req_lat_scanin),
	.scan_out(eer_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(peer_req_in_ntt	[3:0]	),
	.dout	(eer_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// icp means icache error.  TLU must redirect IFU to
// PC with an tlu_ifu_invalidate to force an invalidate and refetch
assign icp_req_in[3:0] = 
	({4 {fls_icp_request}} & tid_dec_w[3:0]) | icp_req[3:0];

assign icp_req_in_ntt[3:0] =
	icp_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 icp_req_lat   (
	.scan_in(icp_req_lat_scanin),
	.scan_out(icp_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(icp_req_in_ntt		[3:0]	),
	.dout	(icp_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pftt_req_in[3:0] = 
	fls_ftt_request[3:0] | ftt_req[3:0];

assign ftt_req_in[3:0] =
       pftt_req_in[3:0] & stb_empty[3:0];

assign pftt_req_in_ntt[3:0] =
	pftt_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ftt_req_lat   (
	.scan_in(ftt_req_lat_scanin),
	.scan_out(ftt_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pftt_req_in_ntt	[3:0]	),
	.dout	(ftt_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pivt_req_in[3:0] = 
	(fls_ivt_request[3:0] | ivt_req[3:0]);

assign ivt_req_in[3:0] =
       pivt_req_in[3:0] & ~stb_wait[3:0];

assign pivt_req_in_ntt[3:0] =
	pivt_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ivt_req_lat   (
	.scan_in(ivt_req_lat_scanin),
	.scan_out(ivt_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pivt_req_in_ntt	[3:0]	),
	.dout	(ivt_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pmqr_req_in[3:0] = 
	(fls_mqr_request[3:0] | mqr_req[3:0]);

assign mqr_req_in[3:0] =
       pmqr_req_in[3:0] & ~stb_wait[3:0];

assign pmqr_req_in_ntt[3:0] =
	pmqr_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 mqr_req_lat   (
	.scan_in(mqr_req_lat_scanin),
	.scan_out(mqr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pmqr_req_in_ntt	[3:0]	),
	.dout	(mqr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdqr_req_in[3:0] = 
	(fls_dqr_request[3:0] | dqr_req[3:0]);

assign dqr_req_in[3:0] =
       pdqr_req_in[3:0] & ~stb_wait[3:0];

assign pdqr_req_in_ntt[3:0] =
	pdqr_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dqr_req_lat   (
	.scan_in(dqr_req_lat_scanin),
	.scan_out(dqr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdqr_req_in_ntt	[3:0]	),
	.dout	(dqr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign prqr_req_in[3:0] = 
	(fls_rqr_request[3:0] | rqr_req[3:0]);

assign rqr_req_in[3:0] =
       prqr_req_in[3:0] & ~stb_wait[3:0];

assign prqr_req_in_ntt[3:0] =
	prqr_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 rqr_req_lat   (
	.scan_in(rqr_req_lat_scanin),
	.scan_out(rqr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(prqr_req_in_ntt	[3:0]	),
	.dout	(rqr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pres_req_in[3:0] = 
	(fls_res_request[3:0] | res_req[3:0]) & ever_been_running[3:0];

// Do not need to wait for anything for resume to take effect
assign res_req_in[3:0] =
       pres_req_in[3:0];

assign pres_req_in_ntt[3:0] =
	pres_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 res_req_lat   (
	.scan_in(res_req_lat_scanin),
	.scan_out(res_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pres_req_in_ntt	[3:0]	),
	.dout	(res_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pssr_req_in[3:0] = 
	(fls_ssr_request[3:0] | ssr_req[3:0]);

// Need to wait for quiesce for single step to take effect
assign ssr_req_in[3:0] =
       pssr_req_in[3:0] & quiesced[3:0];

assign ssr_req_in_for_taken[3:0] =
       pssr_req_in[3:0] & quiesced_last[3:0];

// Have to hold ssr until it's taken (in case of HW TW)
assign pssr_req_in_ntt[3:0] =
       pssr_req_in[3:0] & ~tlu_flush_ifu[3:0] & 
       ~(trap_taken0[3:0] & {4 {take_ssr_last}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ssr_req_lat   (
	.scan_in(ssr_req_lat_scanin),
	.scan_out(ssr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pssr_req_in_ntt	[3:0]	),
	.dout	(ssr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Tracking when machine idles again
// Kill request if late exception occurs (based on flush_gfb_in in tlu_fls_ctl)
// But also need unsupported_page_size because that happens late with no
// flush in W (other MMU-related exceptions already caused flushes in W)
assign ssc_req_in[3:0] = 
	(fls_ssc_request[3:0] | ssc_req[3:0]) & 
	~quiesced[3:0] & 
	~fei_or_fof_incoming[3:0] & 
        ~fls_dae_request[3:0] & 
	~fls_pra_request[3:0] & 
	~fls_pmu_request[3:0] & 
	~fls_ipe_request[3:0] & 
	~fls_dbz_request[3:0] &
	~fls_ups_request[3:0] ;

tlu_trl_ctl_msff_ctl_macro__width_4 ssc_req_lat  (
	.scan_in(ssc_req_lat_scanin),
	.scan_out(ssc_req_lat_scanout),
	.din	(ssc_req_in		[3:0]	),
	.dout	(ssc_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_ss_complete[3:0] =
       ssc_req[3:0] & quiesced[3:0];

assign pnns_req_in[3:0] = 
	(fls_nns_request[3:0] | nns_req[3:0]);

assign nns_req_in[3:0] =
       pnns_req_in[3:0];

assign pnns_req_in_ntt[3:0] =
	pnns_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 nns_req_lat   (
	.scan_in(nns_req_lat_scanin),
	.scan_out(nns_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pnns_req_in_ntt	[3:0]	),
	.dout	(nns_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign psir_req_in[3:0] = 
	(fls_sir_request[3:0] | sir_req[3:0]) & ~pdisrupting_req[3:0];

assign sir_req_in[3:0] =
       psir_req_in[3:0] & stb_empty[3:0];

assign psir_req_in_ntt[3:0] =
	psir_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 sir_req_lat   (
	.scan_in(sir_req_lat_scanin),
	.scan_out(sir_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(psir_req_in_ntt	[3:0]	),
	.dout	(sir_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pitm_req_in[3:0] = 
	(fls_itm_request[3:0] | itm_req[3:0]) & ~disrupting_req[3:0];

assign itm_req_in[3:0] =
       pitm_req_in[3:0] & ~stb_wait[3:0] &
       ~irt_req_in[3:0] & ~tlz_req_in[3:0] & ~pmu_req_in[3:0];

assign pitm_req_in_ntt[3:0] =
	pitm_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 itm_req_lat   (
	.scan_in(itm_req_lat_scanin),
	.scan_out(itm_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pitm_req_in_ntt	[3:0]	),
	.dout	(itm_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 i_tte_outofrange_lat  (
	.scan_in(i_tte_outofrange_lat_scanin),
	.scan_out(i_tte_outofrange_lat_scanout),
	.din	(mmu_i_tte_outofrange	[3:0]	),
	.dout	(i_tte_outofrange	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign piit_req_in[3:0] = 
	(i_tte_outofrange[3:0] | iit_req[3:0]) & ~disrupting_req[3:0];

assign iit_req_in[3:0] =
       piit_req_in[3:0] & ~stb_wait[3:0];

assign piit_req_in_ntt[3:0] =
	piit_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 iit_req_lat  (
	.scan_in(iit_req_lat_scanin),
	.scan_out(iit_req_lat_scanout),
	.din	(piit_req_in_ntt	[3:0]	),
	.dout	(iit_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign piln_req_in[3:0] = 
	(fls_iln_request[3:0] | iln_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign iln_req_in[3:0] =
       piln_req_in[3:0] & ~stb_wait[3:0];

assign piln_req_in_ntt[3:0] =
	piln_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 iln_req_lat   (
	.scan_in(iln_req_lat_scanin),
	.scan_out(iln_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(piln_req_in_ntt	[3:0]	),
	.dout	(iln_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign phst_req_in[3:0] = 
	(fls_hst_request[3:0] | hst_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign hst_req_in[3:0] =
       phst_req_in[3:0] & ~stb_wait[3:0];

assign phst_req_in_ntt[3:0] =
	phst_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 hst_req_lat   (
	.scan_in(hst_req_lat_scanin),
	.scan_out(hst_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(phst_req_in_ntt	[3:0]	),
	.dout	(hst_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ptlz_req_in[3:0] = 
	(fls_tlz_request[3:0] | tlz_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign tlz_req_in[3:0] =
       ptlz_req_in[3:0] & ~stb_wait[3:0];

assign ptlz_req_in_ntt[3:0] =
	ptlz_req_in[3:0] & ~trap_taken0[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 tlz_req_lat   (
	.scan_in(tlz_req_lat_scanin),
	.scan_out(tlz_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ptlz_req_in_ntt	[3:0]	),
	.dout	(tlz_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign psma_req_in[3:0] = 
	(fls_sma_request[3:0] | sma_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign sma_req_in[3:0] =
       psma_req_in[3:0] & ~stb_wait[3:0];

assign psma_req_in_ntt[3:0] =
	psma_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 sma_req_lat   (
	.scan_in(sma_req_lat_scanin),
	.scan_out(sma_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(psma_req_in_ntt	[3:0]	),
	.dout	(sma_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pcwq_req_in[3:0] = 
	(fls_cwq_request[3:0] | cwq_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign cwq_req_in[3:0] =
       pcwq_req_in[3:0] & ~stb_wait[3:0];

assign pcwq_req_in_ntt[3:0] =
	pcwq_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 cwq_req_lat   (
	.scan_in(cwq_req_lat_scanin),
	.scan_out(cwq_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pcwq_req_in_ntt	[3:0]	),
	.dout	(cwq_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pade_req_in[3:0] = 
	(fls_ade_request[3:0] | ade_req[3:0]) & 
	~pdisrupting_req[3:0] & ~sir_req[3:0];

assign ade_req_in[3:0] =
       pade_req_in[3:0] & stb_empty[3:0];

assign pade_req_in_ntt[3:0] =
	pade_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ade_req_lat   (
	.scan_in(ade_req_lat_scanin),
	.scan_out(ade_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pade_req_in_ntt	[3:0]	),
	.dout	(ade_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign piae_req_in[3:0] = 
	(fls_iae_request[3:0] | iae_req[3:0]) & 
	~disrupting_req[3:0];

assign iae_req_in[3:0] =
       piae_req_in[3:0] & stb_empty[3:0];

assign piae_req_in_ntt[3:0] =
	piae_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 iae_req_lat   (
	.scan_in(iae_req_lat_scanin),
	.scan_out(iae_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(piae_req_in_ntt	[3:0]	),
	.dout	(iae_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Note that TSA precise exception on done/retry come straight here
// and do NOT go to tlu_fls_ctl
// Also note that IPE is NOT disrupting
assign pipe_req_in[3:0] = 
       (fls_ipe_request[3:0] | ipe_req[3:0] | tpe_exc[3:0]) & 
       ~disrupting_req[3:0];

assign ipe_req_in[3:0] =
       pipe_req_in[3:0] & stb_empty[3:0];

assign pipe_req_in_ntt[3:0] =
	pipe_req_in[3:0] & ~(trap_taken1[3:0] & ~{4 {take_lsr_last}});

tlu_trl_ctl_msff_ctl_macro__width_4 ipe_req_lat  (
	.scan_in(ipe_req_lat_scanin),
	.scan_out(ipe_req_lat_scanout),
	.din	(pipe_req_in_ntt	[3:0]	),
	.dout	(ipe_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pipv_req_in[3:0] = 
	(({4 {fls_ipv_request}} & tid_dec_w[3:0]) | ipv_req[3:0]) & 
	~disrupting_req[3:0];

assign ipv_req_in[3:0] =
       pipv_req_in[3:0] & ~stb_wait[3:0];

assign pipv_req_in_ntt[3:0] =
	pipv_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ipv_req_lat   (
	.scan_in(ipv_req_lat_scanin),
	.scan_out(ipv_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pipv_req_in_ntt	[3:0]	),
	.dout	(ipv_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 i_unauth_access_lat  (
	.scan_in(i_unauth_access_lat_scanin),
	.scan_out(i_unauth_access_lat_scanout),
	.din	(mmu_i_unauth_access	[3:0]	),
	.dout	(i_unauth_access	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign piua_req_in[3:0] = 
	(i_unauth_access[3:0] | iua_req[3:0]) & 
	~disrupting_req[3:0];

assign iua_req_in[3:0] =
       piua_req_in[3:0] & ~stb_wait[3:0];

assign piua_req_in_ntt[3:0] =
	piua_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 iua_req_lat   (
	.scan_in(iua_req_lat_scanin),
	.scan_out(iua_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(piua_req_in_ntt	[3:0]	),
	.dout	(iua_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pinp_req_in[3:0] = 
	(({4 {fls_inp_request}} & tid_dec_w[3:0]) | inp_req[3:0]) & 
	~disrupting_req[3:0];

assign inp_req_in[3:0] =
       pinp_req_in[3:0] & ~stb_wait[3:0];

assign pinp_req_in_ntt[3:0] =
	pinp_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 inp_req_lat   (
	.scan_in(inp_req_lat_scanin),
	.scan_out(inp_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pinp_req_in_ntt	[3:0]	),
	.dout	(inp_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign piar_req_in[3:0] = 
	(({4 {fls_iar_request}} & tid_dec_w[3:0]) | iar_req[3:0]) & 
	~disrupting_req[3:0];

assign iar_req_in[3:0] =
       piar_req_in[3:0] & ~stb_wait[3:0];

assign piar_req_in_ntt[3:0] =
	piar_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 iar_req_lat   (
	.scan_in(iar_req_lat_scanin),
	.scan_out(iar_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(piar_req_in_ntt	[3:0]	),
	.dout	(iar_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pirr_req_in[3:0] = 
	(({4 {fls_irr_request}} & tid_dec_w[3:0]) | irr_req[3:0]) & 
	~disrupting_req[3:0];

assign irr_req_in[3:0] =
       pirr_req_in[3:0] & ~stb_wait[3:0];

assign pirr_req_in_ntt[3:0] =
	pirr_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 irr_req_lat   (
	.scan_in(irr_req_lat_scanin),
	.scan_out(irr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pirr_req_in_ntt	[3:0]	),
	.dout	(irr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pmar_req_in[3:0] = 
	(({4 {fls_mar_request}} & tid_dec_w[3:0]) | mar_req[3:0]) & 
	~disrupting_req[3:0];

assign mar_req_in[3:0] =
       pmar_req_in[3:0] & ~stb_wait[3:0];

assign pmar_req_in_ntt[3:0] =
	pmar_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 mar_req_lat   (
	.scan_in(mar_req_lat_scanin),
	.scan_out(mar_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pmar_req_in_ntt	[3:0]	),
	.dout	(mar_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pmrr_req_in[3:0] = 
	(({4 {fls_mrr_request}} & tid_dec_w[3:0]) | mrr_req[3:0]) & 
	~disrupting_req[3:0];

assign mrr_req_in[3:0] =
       pmrr_req_in[3:0] & ~stb_wait[3:0];

assign pmrr_req_in_ntt[3:0] =
	pmrr_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 mrr_req_lat   (
	.scan_in(mrr_req_lat_scanin),
	.scan_out(mrr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pmrr_req_in_ntt	[3:0]	),
	.dout	(mrr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ppro_req_in[3:0] = 
	(({4 {fls_pro_request}} & tid_dec_w[3:0]) | pro_req[3:0]) & 
	~disrupting_req[3:0];

assign pro_req_in[3:0] =
       ppro_req_in[3:0] & ~stb_wait[3:0];

assign ppro_req_in_ntt[3:0] =
	ppro_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 pro_req_lat   (
	.scan_in(pro_req_lat_scanin),
	.scan_out(pro_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ppro_req_in_ntt	[3:0]	),
	.dout	(pro_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pill_req_in[3:0] = 
	(({4 {fls_ill_request}} & tid_dec_w[3:0]) | ill_req[3:0]) & 
	~disrupting_req[3:0];

assign ill_req_in[3:0] =
       pill_req_in[3:0] & ~stb_wait[3:0];

assign pill_req_in_ntt[3:0] =
	pill_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ill_req_lat   (
	.scan_in(ill_req_lat_scanin),
	.scan_out(ill_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pill_req_in_ntt	[3:0]	),
	.dout	(ill_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdon_req_in[3:0] = 
	(({4 {fls_don_request}} & tid_dec_w[3:0]) | don_req[3:0]) & 
	~disrupting_req[3:0];

assign don_req_in[3:0] =
       {4 {~stall_don_ret}} & pdon_req_in[3:0];

assign pdon_req_in_ntt[3:0] =
	pdon_req_in[3:0] & (~trap_taken1[3:0] | {4 {hole_in_p}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 don_req_lat   (
	.scan_in(don_req_lat_scanin),
	.scan_out(don_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdon_req_in_ntt	[3:0]	),
	.dout	(don_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pret_req_in[3:0] = 
	(({4 {fls_ret_request}} & tid_dec_w[3:0]) | ret_req[3:0]) & 
	~disrupting_req[3:0];

assign ret_req_in[3:0] =
       {4 {~stall_don_ret}} & pret_req_in[3:0];

assign pret_req_in_ntt[3:0] =
	pret_req_in[3:0] & (~trap_taken1[3:0] | {4 {hole_in_p}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ret_req_lat   (
	.scan_in(ret_req_lat_scanin),
	.scan_out(ret_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pret_req_in_ntt	[3:0]	),
	.dout	(ret_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pfpd_req_in[3:0] = 
	(({4 {fls_fpd_request}} & tid_dec_w[3:0]) | fpd_req[3:0]) & 
	~disrupting_req[3:0];

assign fpd_req_in[3:0] =
       pfpd_req_in[3:0] & ~stb_wait[3:0];

assign pfpd_req_in_ntt[3:0] =
	pfpd_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fpd_req_lat   (
	.scan_in(fpd_req_lat_scanin),
	.scan_out(fpd_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfpd_req_in_ntt	[3:0]	),
	.dout	(fpd_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign psnn_req_in[3:0] = 
	(({4 {fls_snn_request}} & tid_dec_w[3:0]) | snn_req[3:0]) & 
	~disrupting_req[3:0];

assign snn_req_in[3:0] =
       psnn_req_in[3:0] & ~stb_wait[3:0];

assign psnn_req_in_ntt[3:0] =
	psnn_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 snn_req_lat   (
	.scan_in(snn_req_lat_scanin),
	.scan_out(snn_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(psnn_req_in_ntt	[3:0]	),
	.dout	(snn_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign psno_req_in[3:0] = 
	(({4 {fls_sno_request}} & tid_dec_w[3:0]) | sno_req[3:0]) & 
	~disrupting_req[3:0];

assign sno_req_in[3:0] =
       psno_req_in[3:0] & ~stb_wait[3:0];

assign psno_req_in_ntt[3:0] =
	psno_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 sno_req_lat   (
	.scan_in(sno_req_lat_scanin),
	.scan_out(sno_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(psno_req_in_ntt	[3:0]	),
	.dout	(sno_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pfnn_req_in[3:0] = 
	(({4 {fls_fnn_request}} & tid_dec_w[3:0]) | fnn_req[3:0]) & 
	~disrupting_req[3:0];

assign fnn_req_in[3:0] =
       pfnn_req_in[3:0] & ~stb_wait[3:0];

assign pfnn_req_in_ntt[3:0] =
	pfnn_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fnn_req_lat   (
	.scan_in(fnn_req_lat_scanin),
	.scan_out(fnn_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfnn_req_in_ntt	[3:0]	),
	.dout	(fnn_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pfno_req_in[3:0] = 
	(({4 {fls_fno_request}} & tid_dec_w[3:0]) | fno_req[3:0]) & 
	~disrupting_req[3:0];

assign fno_req_in[3:0] =
       pfno_req_in[3:0] & ~stb_wait[3:0];

assign pfno_req_in_ntt[3:0] =
	pfno_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fno_req_lat   (
	.scan_in(fno_req_lat_scanin),
	.scan_out(fno_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfno_req_in_ntt	[3:0]	),
	.dout	(fno_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pclw_req_in[3:0] = 
	(({4 {fls_clw_request}} & tid_dec_w[3:0]) | clw_req[3:0]) & 
	~disrupting_req[3:0];

assign clw_req_in[3:0] =
       pclw_req_in[3:0] & ~stb_wait[3:0];

assign pclw_req_in_ntt[3:0] =
	pclw_req_in[3:0] & ~trap_taken1[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 clw_req_lat   (
	.scan_in(clw_req_lat_scanin),
	.scan_out(clw_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pclw_req_in_ntt	[3:0]	),
	.dout	(clw_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdtm_req_in[3:0] = 
	(fls_dtm_request[3:0] | dtm_req[3:0]) & 
	~disrupting_req[3:0];

assign dtm_req_in[3:0] =
       pdtm_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdtm_req_in_ntt[3:0] =
	pdtm_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dtm_req_lat   (
	.scan_in(dtm_req_lat_scanin),
	.scan_out(dtm_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdtm_req_in_ntt	[3:0]	),
	.dout	(dtm_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pldf_req_in[3:0] = 
	(({4 {fls_ldf_request}} & tid_dec_w[3:0]) | ldf_req[3:0]) & 
	~disrupting_req[3:0];

assign ldf_req_in[3:0] =
       pldf_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0];

assign pldf_req_in_ntt[3:0] =
	pldf_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ldf_req_lat   (
	.scan_in(ldf_req_lat_scanin),
	.scan_out(ldf_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pldf_req_in_ntt	[3:0]	),
	.dout	(ldf_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pstf_req_in[3:0] = 
	(({4 {fls_stf_request}} & tid_dec_w[3:0]) | stf_req[3:0]) & 
	~disrupting_req[3:0];

assign stf_req_in[3:0] =
       pstf_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0];

assign pstf_req_in_ntt[3:0] =
	pstf_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 stf_req_lat   (
	.scan_in(stf_req_lat_scanin),
	.scan_out(stf_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pstf_req_in_ntt	[3:0]	),
	.dout	(stf_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdap_req_in[3:0] = 
	(({4 {fls_dap_request}} & tid_dec_w[3:0]) | dap_req[3:0]) & 
	~disrupting_req[3:0];

assign dap_req_in[3:0] =
       pdap_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdap_req_in_ntt[3:0] =
	pdap_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dap_req_lat   (
	.scan_in(dap_req_lat_scanin),
	.scan_out(dap_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdap_req_in_ntt	[3:0]	),
	.dout	(dap_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pvaw_req_in[3:0] = 
	(({4 {fls_vaw_request}} & tid_dec_w[3:0]) | vaw_req[3:0]) & 
	~disrupting_req[3:0];

assign vaw_req_in[3:0] =
       pvaw_req_in[3:0] & ~stb_wait[3:0];

assign pvaw_req_in_ntt[3:0] =
	pvaw_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 vaw_req_lat   (
	.scan_in(vaw_req_lat_scanin),
	.scan_out(vaw_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pvaw_req_in_ntt	[3:0]	),
	.dout	(vaw_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign piaw_req_in[3:0] = 
	(({4 {fls_iaw_request}} & tid_dec_w[3:0]) | iaw_req[3:0]) & 
	~disrupting_req[3:0];

assign iaw_req_in[3:0] =
       piaw_req_in[3:0] & ~stb_wait[3:0];

assign piaw_req_in_ntt[3:0] =
	piaw_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 iaw_req_lat   (
	.scan_in(iaw_req_lat_scanin),
	.scan_out(iaw_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(piaw_req_in_ntt	[3:0]	),
	.dout	(iaw_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ppaw_req_in[3:0] = 
	(({4 {fls_paw_request}} & tid_dec_w[3:0]) | paw_req[3:0]) & 
	~disrupting_req[3:0];

assign paw_req_in[3:0] =
       ppaw_req_in[3:0] & ~stb_wait[3:0];

assign ppaw_req_in_ntt[3:0] =
	ppaw_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 paw_req_lat   (
	.scan_in(paw_req_lat_scanin),
	.scan_out(paw_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ppaw_req_in_ntt	[3:0]	),
	.dout	(paw_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pmaa_req_in[3:0] = 
	(({4 {fls_maa_request}} & tid_dec_w[3:0]) | maa_req[3:0]) & 
	~disrupting_req[3:0];

assign maa_req_in[3:0] =
       pmaa_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0];
assign pmaa_req_in_ntt[3:0] =
	pmaa_req_in[3:0] & ~trap_taken2[3:0];


tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 maa_req_lat   (
	.scan_in(maa_req_lat_scanin),
	.scan_out(maa_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pmaa_req_in_ntt	[3:0]	),
	.dout	(maa_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpx_tid_dec_fw[3:0] = 
	{4 {thread_group == fgu_fpx_trap_tid_fw[2]}} & 
	{ fgu_fpx_trap_tid_fw[1] &  fgu_fpx_trap_tid_fw[0],
	  fgu_fpx_trap_tid_fw[1] & ~fgu_fpx_trap_tid_fw[0],
	 ~fgu_fpx_trap_tid_fw[1] &  fgu_fpx_trap_tid_fw[0],
	 ~fgu_fpx_trap_tid_fw[1] & ~fgu_fpx_trap_tid_fw[0]};

assign fpd_tid_dec_fw[3:0] = 
	{4 {thread_group == fgu_fpd_trap_tid_fw[2]}} & 
	{ fgu_fpd_trap_tid_fw[1] &  fgu_fpd_trap_tid_fw[0],
	  fgu_fpd_trap_tid_fw[1] & ~fgu_fpd_trap_tid_fw[0],
	 ~fgu_fpd_trap_tid_fw[1] &  fgu_fpd_trap_tid_fw[0],
	 ~fgu_fpd_trap_tid_fw[1] & ~fgu_fpd_trap_tid_fw[0]};

assign fei_or_fof_incoming[3:0] = 
       ({4 {fgu_fpx_ieee_trap_fw | fgu_fpx_unfin_fw}} & fpx_tid_dec_fw[3:0]) |
       ({4 {fgu_fpd_ieee_trap_fw | fgu_fpd_unfin_fw}} & fpd_tid_dec_fw[3:0]) ;

// Have to kill FP predicted exception redirect in the event the actual
// exception catches up with it
// dbz is not predicted
assign pfpe_req_in[3:0] = 
	(({4 {fls_fpe_request}} & tid_dec_w[3:0]) | fpe_req[3:0]) & 
	~disrupting_req[3:0] & 
	~fei_or_fof_incoming[3:0];

assign fpe_req_in[3:0] =
       pfpe_req_in[3:0];

assign pfpe_req_in_ntt[3:0] =
	pfpe_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fpe_req_lat   (
	.scan_in(fpe_req_lat_scanin),
	.scan_out(fpe_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfpe_req_in_ntt	[3:0]	),
	.dout	(fpe_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pfei_req_in[3:0] = 
       (fls_fei_request[3:0] | fei_req[3:0]) & 
       ~disrupting_req[3:0];

assign fei_req_in[3:0] =
       pfei_req_in[3:0] & ~stb_wait[3:0];

assign pfei_req_in_ntt[3:0] =
	pfei_req_in[3:0] & 
       (~trap_taken2[3:0] | {4 {take_fpe_last | take_lsr_nns_last}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fei_req_lat   (
	.scan_in(fei_req_lat_scanin),
	.scan_out(fei_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfei_req_in_ntt	[3:0]	),
	.dout	(fei_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pfof_req_in[3:0] = 
       (fls_fof_request[3:0] | fof_req[3:0]) &
       ~disrupting_req[3:0];

assign fof_req_in[3:0] =
       pfof_req_in[3:0] & ~stb_wait[3:0];

assign pfof_req_in_ntt[3:0] =
	pfof_req_in[3:0] & 
       (~trap_taken2[3:0] | {4 {take_fpe_last | take_lsr_nns_last}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fof_req_lat   (
	.scan_in(fof_req_lat_scanin),
	.scan_out(fof_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pfof_req_in_ntt	[3:0]	),
	.dout	(fof_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ppra_req_in[3:0] = 
	(fls_pra_request[3:0] | pra_req[3:0]) & 
	~disrupting_req[3:0];

assign pra_req_in[3:0] =
       ppra_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0];

assign ppra_req_in_ntt[3:0] =
	ppra_req_in[3:0] & ~(trap_taken1[3:0] & ~{4 {take_lsr_last}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 pra_req_lat   (
	.scan_in(pra_req_lat_scanin),
	.scan_out(pra_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ppra_req_in_ntt	[3:0]	),
	.dout	(pra_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdia_req_in[3:0] = 
	(({4 {fls_dia_request}} & tid_dec_w[3:0]) | dia_req[3:0]) & 
	~disrupting_req[3:0];

assign dia_req_in[3:0] =
       pdia_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdia_req_in_ntt[3:0] =
	pdia_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dia_req_lat   (
	.scan_in(dia_req_lat_scanin),
	.scan_out(dia_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdia_req_in_ntt	[3:0]	),
	.dout	(dia_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pups_req_in[3:0] = 
	(fls_ups_request[3:0] | ups_req[3:0]) &
	~disrupting_req[3:0];

assign ups_req_in[3:0] =
       pups_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pups_req_in_ntt[3:0] =
	pups_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ups_req_lat   (
	.scan_in(ups_req_lat_scanin),
	.scan_out(ups_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pups_req_in_ntt	[3:0]	),
	.dout	(ups_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdpv_req_in[3:0] = 
	(({4 {fls_dpv_request}} & tid_dec_w[3:0]) | dpv_req[3:0]) & 
	~disrupting_req[3:0];

assign dpv_req_in[3:0] =
       pdpv_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdpv_req_in_ntt[3:0] =
	pdpv_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dpv_req_lat   (
	.scan_in(dpv_req_lat_scanin),
	.scan_out(dpv_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdpv_req_in_ntt	[3:0]	),
	.dout	(dpv_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdnc_req_in[3:0] = 
	(({4 {fls_dnc_request}} & tid_dec_w[3:0]) | dnc_req[3:0]) & 
	~disrupting_req[3:0];

assign dnc_req_in[3:0] =
       pdnc_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdnc_req_in_ntt[3:0] =
	pdnc_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dnc_req_lat   (
	.scan_in(dnc_req_lat_scanin),
	.scan_out(dnc_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdnc_req_in_ntt	[3:0]	),
	.dout	(dnc_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdnf_req_in[3:0] = 
	(({4 {fls_dnf_request}} & tid_dec_w[3:0]) | dnf_req[3:0]) & 
	~disrupting_req[3:0];

assign dnf_req_in[3:0] =
       pdnf_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdnf_req_in_ntt[3:0] =
	pdnf_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dnf_req_lat   (
	.scan_in(dnf_req_lat_scanin),
	.scan_out(dnf_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdnf_req_in_ntt	[3:0]	),
	.dout	(dnf_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdso_req_in[3:0] = 
	(({4 {fls_dso_request}} & tid_dec_w[3:0]) | dso_req[3:0]) & 
	~disrupting_req[3:0];

assign dso_req_in[3:0] =
       pdso_req_in[3:0] & ~stb_wait[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdso_req_in_ntt[3:0] =
	pdso_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dso_req_lat   (
	.scan_in(dso_req_lat_scanin),
	.scan_out(dso_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdso_req_in_ntt	[3:0]	),
	.dout	(dso_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ptof_req_in[3:0] = 
	(({4 {fls_tof_request}} & tid_dec_w[3:0]) | tof_req[3:0]) & 
	~disrupting_req[3:0];

assign tof_req_in[3:0] =
       ptof_req_in[3:0] & ~stb_wait[3:0];

assign ptof_req_in_ntt[3:0] =
	ptof_req_in[3:0] & ~trap_taken2[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 tof_req_lat   (
	.scan_in(tof_req_lat_scanin),
	.scan_out(tof_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ptof_req_in_ntt	[3:0]	),
	.dout	(tof_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdbz_req_in[3:0] = 
       (fls_dbz_request[3:0] | dbz_req[3:0]) & 
	~disrupting_req[3:0];

assign dbz_req_in[3:0] =
       pdbz_req_in[3:0] & ~stb_wait[3:0];

assign pdbz_req_in_ntt[3:0] =
	pdbz_req_in[3:0] & 
       (~trap_taken2[3:0] | {4 {take_lsr_nns_last}});

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dbz_req_lat   (
	.scan_in(dbz_req_lat_scanin),
	.scan_out(dbz_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdbz_req_in_ntt	[3:0]	),
	.dout	(dbz_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tcc_h[3:0] = 
	{fls_tcc_number_3[7], fls_tcc_number_2[7],
	 fls_tcc_number_1[7], fls_tcc_number_0[7]};

assign ptcc_req_in[3:0] = 
	(({4 {fls_tcc_request}} & tid_dec_w[3:0]) | tcc_req[3:0]) & 
	~disrupting_req[3:0];

assign tcc_req_in[3:0] =
       ptcc_req_in[3:0] & 
       ((~stb_wait[3:0] &  tcc_h[3:0]) |
        (~stb_wait[3:0] & ~tcc_h[3:0]));

assign ptcc_req_in_ntt[3:0] =
	ptcc_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 tcc_req_lat   (
	.scan_in(tcc_req_lat_scanin),
	.scan_out(tcc_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ptcc_req_in_ntt	[3:0]	),
	.dout	(tcc_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdae_req_in[3:0] = 
       (fls_dae_request[3:0] | dae_req[3:0]) &
       ~disrupting_req[3:0];

assign dae_req_in[3:0] = 
       pdae_req_in[3:0] & stb_empty[3:0] &
       ~ill_req_in[3:0] & ~maa_req_in[3:0] & ~ldf_req_in[3:0] & 
       ~stf_req_in[3:0] & ~pra_req_in[3:0] ;

assign pdae_req_in_ntt[3:0] =
	pdae_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dae_req_lat   (
	.scan_in(dae_req_lat_scanin),
	.scan_out(dae_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdae_req_in_ntt	[3:0]	),
	.dout	(dae_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Have to kill LSR exception redirect in the event an FPOP
// exception catches up with it
assign dbz_incoming[3:0] = 
	{4 {fgu_fpd_idiv0_trap_fw}} & fpx_tid_dec_fw[3:0];

assign plsr_req_in[3:0] = 
       (fls_lsr_request[3:0] | lsr_req[3:0]) & 
       ~((trap_taken3[3:0] & {4 {take_lsr_last | take_fpe_last}}) | 
	 real_trap_last[3:0] | fei_or_fof_incoming[3:0] | 
	 ({4 {fls_fpd_request}} & tid_dec_w[3:0]) | dbz_incoming[3:0]) & 
	~disrupting_req[3:0];

assign lsr_req_in[3:0] =
       plsr_req_in[3:0] & ~itw_req[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 lsr_req_lat   (
	.scan_in(lsr_req_lat_scanin),
	.scan_out(lsr_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(plsr_req_in		[3:0]	),
	.dout	(lsr_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pirt_req_in[3:0] = 
        (({4 {fls_irt_request}} & tid_dec_w[3:0]) | irt_req[3:0]) &
	~disrupting_req[3:0];

assign irt_req_in[3:0] =
       pirt_req_in[3:0] & ~stb_wait[3:0] & 
       ~tlz_req_in[3:0] & ~pmu_req_in[3:0];

assign pirt_req_in_ntt[3:0] =
	pirt_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 irt_req_lat   (
	.scan_in(irt_req_lat_scanin),
	.scan_out(irt_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pirt_req_in_ntt	[3:0]	),
	.dout	(irt_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdrt_req_in[3:0] = 
        (({4 {fls_drt_request}} & tid_dec_w[3:0]) | drt_req[3:0]) &
	~disrupting_req[3:0];

assign drt_req_in[3:0] =
       pdrt_req_in[3:0] & ~stb_wait[3:0];

assign pdrt_req_in_ntt[3:0] =
	pdrt_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 drt_req_lat   (
	.scan_in(drt_req_lat_scanin),
	.scan_out(drt_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdrt_req_in_ntt	[3:0]	),
	.dout	(drt_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 d_tte_outofrange_lat  (
	.scan_in(d_tte_outofrange_lat_scanin),
	.scan_out(d_tte_outofrange_lat_scanout),
	.din	(mmu_d_tte_outofrange	[3:0]	),
	.dout	(d_tte_outofrange	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pdit_req_in[3:0] = 
        (d_tte_outofrange[3:0] | dit_req[3:0]) & 
	~disrupting_req[3:0];

assign dit_req_in[3:0] =
       pdit_req_in[3:0] & ~stb_wait[3:0];

assign pdit_req_in_ntt[3:0] =
	pdit_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 dit_req_lat  (
	.scan_in(dit_req_lat_scanin),
	.scan_out(dit_req_lat_scanout),
	.din	(pdit_req_in_ntt	[3:0]	),
	.dout	(dit_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ppmu_req_in[3:0] = 
        (fls_pmu_request[3:0] | pmu_req[3:0]) &
	~disrupting_req[3:0];

assign pmu_req_in[3:0] =
       ppmu_req_in[3:0] & ~stb_wait[3:0] & 
       ~tlz_req_in[3:0];

assign ppmu_req_in_ntt[3:0] =
	ppmu_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 pmu_req_lat   (
	.scan_in(pmu_req_lat_scanin),
	.scan_out(pmu_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ppmu_req_in_ntt	[3:0]	),
	.dout	(pmu_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pime_req_in[3:0] = 
       (fls_ime_request[3:0] | ime_req[3:0]) & 
       ~disrupting_req[3:0];

assign ime_req_in[3:0] =
       pime_req_in[3:0] & stb_empty[3:0];

assign pime_req_in_ntt[3:0] =
	pime_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ime_req_lat   (
	.scan_in(ime_req_lat_scanin),
	.scan_out(ime_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pime_req_in_ntt	[3:0]	),
	.dout	(ime_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


assign pdme_req_in[3:0] = 
       (fls_dme_request[3:0] | dme_req[3:0]) & 
       ~disrupting_req[3:0];

assign dme_req_in[3:0] =
       pdme_req_in[3:0] & stb_empty[3:0];

assign pdme_req_in_ntt[3:0] =
	pdme_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 dme_req_lat   (
	.scan_in(dme_req_lat_scanin),
	.scan_out(dme_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pdme_req_in_ntt	[3:0]	),
	.dout	(dme_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 write_itlb_lat  (
	.scan_in(write_itlb_lat_scanin),
	.scan_out(write_itlb_lat_scanout),
	.din	(mmu_write_itlb		[3:0]	),
	.dout	(write_itlb		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pitw_req_in[3:0] = 
       (write_itlb[3:0] | itw_req[3:0]) & 
       ~({4 {take_itw_last}} & trap_taken3[3:0]) & 
       ~disrupting_req[3:0];

// Thread group 1 waits for thread group 0 to complete all writes to ITLB
// Must be two cycles between ITLB writes
assign itw_req_in[3:0] =
       pitw_req_in[3:0] & 
       {4 {~trlx_itw_wait & ~trlx_itw_last}};

tlu_trl_ctl_msff_ctl_macro__width_4 itw_req_lat  (
	.scan_in(itw_req_lat_scanin),
	.scan_out(itw_req_lat_scanout),
	.din	(pitw_req_in		[3:0]	),
	.dout	(itw_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_itw_wait = 
       (| {itw_req[3:0], write_itlb[3:0]});

assign trl_itw_last =
       take_itw_last;

tlu_trl_ctl_msff_ctl_macro__width_4 reload_done_lat  (
	.scan_in(reload_done_lat_scanin),
	.scan_out(reload_done_lat_scanout),
	.din	(mmu_reload_done[3:0]	),
	.dout	(reload_done	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign phtd_req_in[3:0] = 
	(((reload_done[3:0] | htd_req[3:0]) & ~pssr_req_in[3:0]) |
	 ({4 {fls_ref_request}} & tid_dec_w[3:0])) &
	~({4 {take_htd_last}} & trap_taken3[3:0]) & ~disrupting_req[3:0];

assign htd_req_in[3:0] =
       phtd_req_in[3:0] & ~itw_req[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 htd_req_lat  (
	.scan_in(htd_req_lat_scanin),
	.scan_out(htd_req_lat_scanout),
	.din	(phtd_req_in		[3:0]	),
	.dout	(htd_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 i_tsb_miss_lat  (
	.scan_in(i_tsb_miss_lat_scanin),
	.scan_out(i_tsb_miss_lat_scanout),
	.din	(mmu_i_tsb_miss		[3:0]	),
	.dout	(i_tsb_miss		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign phim_req_in[3:0] = 
        (i_tsb_miss[3:0] | him_req[3:0]) & 
	~disrupting_req[3:0];

assign him_req_in[3:0] =
       phim_req_in[3:0] & ~stb_wait[3:0];

assign phim_req_in_ntt[3:0] =
	phim_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 him_req_lat  (
	.scan_in(him_req_lat_scanin),
	.scan_out(him_req_lat_scanout),
	.din	(phim_req_in_ntt	[3:0]	),
	.dout	(him_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_trl_ctl_msff_ctl_macro__width_4 d_tsb_miss_lat  (
	.scan_in(d_tsb_miss_lat_scanin),
	.scan_out(d_tsb_miss_lat_scanout),
	.din	(mmu_d_tsb_miss		[3:0]	),
	.dout	(d_tsb_miss		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign phdm_req_in[3:0] = 
        (d_tsb_miss[3:0] | hdm_req[3:0]) & 
	~disrupting_req[3:0];

assign hdm_req_in[3:0] =
       phdm_req_in[3:0] & ~stb_wait[3:0];

assign phdm_req_in_ntt[3:0] =
	phdm_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 hdm_req_lat  (
	.scan_in(hdm_req_lat_scanin),
	.scan_out(hdm_req_lat_scanout),
	.din	(phdm_req_in_ntt	[3:0]	),
	.dout	(hdm_req		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pibp_req_in[3:0] = 
        (({4 {fls_ibp_request}} & tid_dec_w[3:0]) | ibp_req[3:0]) &
	~disrupting_req[3:0];

assign ibp_req_in[3:0] =
       pibp_req_in[3:0] & ~stb_wait[3:0] & 
       ~tlz_req_in[3:0];

assign pibp_req_in_ntt[3:0] =
	pibp_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 ibp_req_lat   (
	.scan_in(ibp_req_lat_scanin),
	.scan_out(ibp_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(pibp_req_in_ntt	[3:0]	),
	.dout	(ibp_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ptct_req_in[3:0] = 
        (({4 {fls_tct_request}} & tid_dec_w[3:0]) | tct_req[3:0]) &
	~disrupting_req[3:0];

assign tct_req_in[3:0] =
       ptct_req_in[3:0] & ~stb_wait[3:0] & 
       ~tlz_req_in[3:0];

assign ptct_req_in_ntt[3:0] =
	ptct_req_in[3:0] & ~trap_taken3[3:0];

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 tct_req_lat   (
	.scan_in(tct_req_lat_scanin),
	.scan_out(tct_req_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(ptct_req_in_ntt	[3:0]	),
	.dout	(tct_req		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);




////////////////////////////////////////////////////////////////////////////////
// Categorize requests

assign reset_category[3:0] = 
       (por_req_in[3:0] | xir_req_in[3:0] | sir_req_in[3:0] ) & 
       ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign disrupt_category[3:0] = 
       (ade_req_in[3:0] | iln_req_in[3:0] | 
	hst_req_in[3:0] | tlz_req_in[3:0] | sma_req_in[3:0] | 
	cwq_req_in[3:0] | ivt_req_in[3:0] | mqr_req_in[3:0] | 
	dqr_req_in[3:0] | rqr_req_in[3:0] | eer_req_in[3:0] | 
	ftt_req_in[3:0] ) &
       ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign divide_category[3:0] = 
       (dbz_req_in[3:0]) &
       ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign long_category[3:0] = 
       dae_req_in[3:0] & ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign fgu_category[3:0] = 
       (fei_req_in[3:0] | fof_req_in[3:0]) &
       ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign don_ret_category[3:0] = 
       (don_req_in[3:0] | ret_req_in[3:0]) &
       ~trap[3:0] & (~trap_taken5[3:0] | {4 {hole_in_p}});

assign notrap_category[3:0] = 
       (htd_req_in[3:0] | fpe_req_in[3:0] | lsr_req_in[3:0] | 
	res_req_in[3:0] | ssr_req_in[3:0] | 
	nns_req_in[3:0] | icp_req_in[3:0]) &
       ~trap_ndr[3:0] & ~trap_taken5[3:0];

assign itw_category[3:0] =
       itw_req_in[3:0] & ~trap_itw[3:0] & ~trap_itw_taken[3:0];

assign other_category[3:0] = 
       (iae_req_in[3:0] | ipv_req_in[3:0] | inp_req_in[3:0] |
	iua_req_in[3:0] | ipe_req_in[3:0] | 
	iar_req_in[3:0] | irr_req_in[3:0] |
        mar_req_in[3:0] | mrr_req_in[3:0] |
        pro_req_in[3:0] |
	ill_req_in[3:0] | fpd_req_in[3:0] | snn_req_in[3:0] |
	sno_req_in[3:0] | fnn_req_in[3:0] | fno_req_in[3:0] | 
	clw_req_in[3:0] | ldf_req_in[3:0] | stf_req_in[3:0] |
	dap_req_in[3:0] |
	vaw_req_in[3:0] | iaw_req_in[3:0] | paw_req_in[3:0] | 
	maa_req_in[3:0] | 
	pra_req_in[3:0] | dia_req_in[3:0] | 
	ups_req_in[3:0] | dpv_req_in[3:0] |
	dnc_req_in[3:0] | dnf_req_in[3:0] | dso_req_in[3:0] |
	tof_req_in[3:0] | tcc_req_in[3:0] | 
	itm_req_in[3:0] | dtm_req_in[3:0] | him_req_in[3:0] | 
	hdm_req_in[3:0] | irt_req_in[3:0] | drt_req_in[3:0] |
	pmu_req_in[3:0] | ime_req_in[3:0] | dme_req_in[3:0] |
	ibp_req_in[3:0] | tct_req_in[3:0] | 
	iit_req_in[3:0] | dit_req_in[3:0] ) &
       ~trap_ndr[3:0] & ~trap_taken5[3:0];



////////////////////////////////////////////////////////////////////////////////
// Select thread within each category using static priority

// POR resets cannot wait for store buffer to empty
assign reset_pre_trap_in[3:0] = 
       {reset_category[3] & ~(| reset_category[2:0]),
	reset_category[2] & ~(| reset_category[1:0]),
	reset_category[1] & ~(  reset_category[   0]),
	reset_category[0]} & (stb_empty[3:0] | por_req_in[3:0]);

assign disrupt_pre_trap_in[3:0] = 
       {disrupt_category[3] & ~(| disrupt_category[2:0]),
	disrupt_category[2] & ~(| disrupt_category[1:0]),
	disrupt_category[1] & ~(  disrupt_category[   0]),
	disrupt_category[0]};

assign divide_pre_trap_in[3:0] = 
       {divide_category[3] & ~(| divide_category[2:0]),
	divide_category[2] & ~(| divide_category[1:0]),
	divide_category[1] & ~(  divide_category[   0]),
	divide_category[0]};

assign long_pre_trap_in[3:0] =
       {long_category[3] & ~(| long_category[2:0]),
	long_category[2] & ~(| long_category[1:0]),
	long_category[1] & ~(  long_category[   0]),
	long_category[0]};

assign fgu_pre_trap_in[3:0] = 
       {fgu_category[3] & ~(| fgu_category[2:0]),
	fgu_category[2] & ~(| fgu_category[1:0]),
	fgu_category[1] & ~(  fgu_category[   0]),
	fgu_category[0]};

assign don_ret_pre_trap_in[3:0] = 
       {don_ret_category[3] & ~(| don_ret_category[2:0]),
	don_ret_category[2] & ~(| don_ret_category[1:0]),
	don_ret_category[1] & ~(  don_ret_category[   0]),
	don_ret_category[0]};

assign notrap_pre_trap_in[3:0] = 
       {notrap_category[3] & ~(| notrap_category[2:0]),
	notrap_category[2] & ~(| notrap_category[1:0]),
	notrap_category[1] & ~(  notrap_category[   0]),
	notrap_category[0]};

assign itw_pre_trap_in[3:0] = 
       {itw_category[3] & ~(| itw_category[2:0]),
	itw_category[2] & ~(| itw_category[1:0]),
	itw_category[1] & ~(  itw_category[   0]),
	itw_category[0]};

assign other_pre_trap_in[3:0] = 
       {other_category[3] & ~(| other_category[2:0]),
	other_category[2] & ~(| other_category[1:0]),
	other_category[1] & ~(  other_category[   0]),
	other_category[0]};

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 reset_pre_trap_lat   (
	.scan_in(reset_pre_trap_lat_scanin),
	.scan_out(reset_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(reset_pre_trap_in	[3:0]	),
	.dout	(reset_pre_trap		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 disrupt_pre_trap_lat   (
	.scan_in(disrupt_pre_trap_lat_scanin),
	.scan_out(disrupt_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(disrupt_pre_trap_in	[3:0]	),
	.dout	(disrupt_pre_trap	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 divide_pre_trap_lat   (
	.scan_in(divide_pre_trap_lat_scanin),
	.scan_out(divide_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(divide_pre_trap_in	[3:0]	),
	.dout	(divide_pre_trap	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 long_pre_trap_lat   (
	.scan_in(long_pre_trap_lat_scanin),
	.scan_out(long_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(long_pre_trap_in	[3:0]	),
	.dout	(long_pre_trap		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 fgu_pre_trap_lat   (
	.scan_in(fgu_pre_trap_lat_scanin),
	.scan_out(fgu_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(fgu_pre_trap_in	[3:0]	),
	.dout	(fgu_pre_trap		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 don_ret_pre_trap_lat   (
	.scan_in(don_ret_pre_trap_lat_scanin),
	.scan_out(don_ret_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(don_ret_pre_trap_in	[3:0]	),
	.dout	(don_ret_pre_trap	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 notrap_pre_trap_lat   (
	.scan_in(notrap_pre_trap_lat_scanin),
	.scan_out(notrap_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(notrap_pre_trap_in	[3:0]	),
	.dout	(notrap_pre_trap	[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 itw_pre_trap_lat   (
	.scan_in(itw_pre_trap_lat_scanin),
	.scan_out(itw_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(itw_pre_trap_in	[3:0]	),
	.dout	(itw_pre_trap		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 other_pre_trap_lat   (
	.scan_in(other_pre_trap_lat_scanin),
	.scan_out(other_pre_trap_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(other_pre_trap_in	[3:0]	),
	.dout	(other_pre_trap		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Prioritize categories

// ITLB writes take two cycles on bus to IFU so must
// hold off traps in second cycle
// Traps must write the TSA

assign pre_allow_trap_in =
       ~asi_rmw_tsa & ~take_don & ~take_ret & ~take_don_last & 
       ~take_ret_last & ~take_itw;

tlu_trl_ctl_msff_ctl_macro__width_1 pre_allow_trap_lat  (
	.scan_in(pre_allow_trap_lat_scanin),
	.scan_out(pre_allow_trap_lat_scanout),
	.din	(pre_allow_trap_in	),
	.dout	(pre_allow_trap		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign allow_trap =
       ~asi_preempt_trap & pre_allow_trap;

assign pre_allow_don_ret_in =
       ~take_don & ~take_ret & ~take_itw;

tlu_trl_ctl_msff_ctl_macro__width_1 pre_allow_don_ret_lat  (
	.scan_in(pre_allow_don_ret_lat_scanin),
	.scan_out(pre_allow_don_ret_lat_scanout),
	.din	(pre_allow_don_ret_in	),
	.dout	(pre_allow_don_ret	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign allow_don_ret = 
       ~asi_preempt_done_retry & pre_allow_don_ret;

// POR resets cannot wait for store buffer to empty
assign take_reset_in = 
       (| (reset_category[3:0] & (stb_empty[3:0] | por_req_in[3:0])));

// Pending disrupting conditions prevent any other type of trap request
assign take_disrupt_in = 
       (| disrupt_category[3:0]) & ~take_reset_in;

assign take_div_in = 
       (| divide_category[3:0]) & ~take_disrupt_in & ~take_reset_in;

assign take_long_in = 
       (| long_category[3:0]) & ~take_div_in & ~take_disrupt_in & 
       ~take_reset_in;

assign take_fgu_in = 
	(| fgu_category[3:0]) & ~take_long_in & ~take_div_in & 
	~take_disrupt_in & ~take_reset_in;

assign take_other_in = 
       (| other_category[3:0]) & ~take_fgu_in & ~take_long_in & 
       ~take_div_in & ~take_disrupt_in & ~take_reset_in;

assign take_don_ret_in = 
       (| don_ret_category[3:0]) & ~take_other_in & ~take_fgu_in & 
       ~take_long_in & ~take_div_in & ~take_disrupt_in & ~take_disrupt_in & 
       ~take_reset_in;

// itw can occur at same time as disrupt or other categories
assign take_itw_g_in = 
       (| itw_category[3:0]) & ~take_don_ret_in & ~take_other_in & 
       ~take_fgu_in & ~take_long_in & ~take_div_in & ~take_disrupt_in & 
       ~take_disrupt_in & ~take_reset_in;

// notrap can occur at same time as disrupt or other categories
assign take_notrap_in = 
       (| notrap_category[3:0]) & ~take_don_ret_in & ~take_other_in & 
       ~take_fgu_in & ~take_long_in & ~take_div_in & ~take_disrupt_in & 
       ~take_disrupt_in & ~take_reset_in & ~take_itw_g_in;

assign take_otr_in =  // take trap other than reset
       take_disrupt_in | take_div_in | take_long_in | take_fgu_in | 
       take_other_in;

tlu_trl_ctl_msff_ctl_macro__width_1 take_reset_lat  (
	.scan_in(take_reset_lat_scanin),
	.scan_out(take_reset_lat_scanout),
	.din	(take_reset_in			),
	.dout	(ptake_reset			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_reset =
       ptake_reset & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_disrupt_lat  (
	.scan_in(take_disrupt_lat_scanin),
	.scan_out(take_disrupt_lat_scanout),
	.din	(take_disrupt_in		),
	.dout	(ptake_disrupt			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_disrupt =
       ptake_disrupt & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_div_lat  (
	.scan_in(take_div_lat_scanin),
	.scan_out(take_div_lat_scanout),
	.din	(take_div_in			),
	.dout	(ptake_div			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_div =
       ptake_div & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_long_lat  (
	.scan_in(take_long_lat_scanin),
	.scan_out(take_long_lat_scanout),
	.din	(take_long_in			),
	.dout	(ptake_long			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_long =
       ptake_long & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_fgu_lat  (
	.scan_in(take_fgu_lat_scanin),
	.scan_out(take_fgu_lat_scanout),
	.din	(take_fgu_in			),
	.dout	(ptake_fgu			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_fgu =
       ptake_fgu & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_other_lat  (
	.scan_in(take_other_lat_scanin),
	.scan_out(take_other_lat_scanout),
	.din	(take_other_in			),
	.dout	(ptake_other			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_other =
       ptake_other & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_don_ret_lat  (
	.scan_in(take_don_ret_lat_scanin),
	.scan_out(take_don_ret_lat_scanout),
	.din	(take_don_ret_in		),
	.dout	(ptake_don_ret			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_don_ret =
       ptake_don_ret & allow_don_ret;

tlu_trl_ctl_msff_ctl_macro__width_1 take_notrap_lat  (
	.scan_in(take_notrap_lat_scanin),
	.scan_out(take_notrap_lat_scanout),
	.din	(take_notrap_in			),
	.dout	(ptake_notrap			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_notrap =
       ptake_notrap & allow_trap;

tlu_trl_ctl_msff_ctl_macro__width_1 take_itw_lat  (
	.scan_in(take_itw_lat_scanin),
	.scan_out(take_itw_lat_scanout),
	.din	(take_itw_g_in			),
	.dout	(ptake_itw_g			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_itw_g =
       ptake_itw_g & allow_trap &
       ~trlx_itw_wait & ~trlx_itw_last;

tlu_trl_ctl_msff_ctl_macro__width_1 take_otr_lat  (
	.scan_in(take_otr_lat_scanin),
	.scan_out(take_otr_lat_scanout),
	.din	(take_otr_in			),
	.dout	(ptake_otr			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_otr =
       ptake_otr & allow_trap;

assign take_any_dec[3:0] =
       real_trap[3:0];

assign take_any_dec_last[3:0] =
       real_trap_last[3:0];




////////////////////////////////////////////////////////////////////////////////
// Figure out which trap in the group occurred

assign take_por = 
	(| ( por_req_in[3:0] & reset_pre_trap[3:0])) & 
	take_reset;

assign take_por_dec[3:0] = 
	por_req_in[3:0] & reset_pre_trap[3:0] & {4 {take_reset}};

assign take_por_dec_last[3:0] =
       {4 {take_por_last}} & trap_taken3[3:0];

assign take_xir = 
	(| ( xir_req_in[3:0] & reset_pre_trap[3:0] & ~por_req_in[3:0])) &
	take_reset;

assign take_sir = 
	(| ( sir_req_in[3:0] & reset_pre_trap[3:0] & ~por_req_in[3:0] &
	    ~xir_req_in[3:0])) & take_reset;

assign take_ade = 
	(| (ade_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_iln = 
	(| (iln_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_ivt = 
	(| (ivt_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_mqr = 
	(| (mqr_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_dqr = 
	(| (dqr_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_rqr = 
	(| (rqr_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_eer = 
	(| (eer_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_ftt = 
	(| (ftt_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_hst = 
	(| (hst_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_tlz = 
	(| (tlz_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_sma = 
	(| (sma_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_cwq = 
	(| (cwq_req_in[3:0] & disrupt_pre_trap[3:0])) & take_disrupt;

assign take_dae = 
	(| (dae_req_in[3:0] & long_pre_trap[3:0])) & take_long;

assign take_fei = 
	(| (fei_req_in[3:0] & fgu_pre_trap[3:0])) & take_fgu;

assign take_fof = 
	(| (fof_req_in[3:0] & fgu_pre_trap[3:0])) & take_fgu;

assign take_don = 
	(| (pdon_req_in[3:0] & don_ret_pre_trap[3:0])) & take_don_ret;

assign take_ret = 
	(| (pret_req_in[3:0] & don_ret_pre_trap[3:0])) & take_don_ret;

assign take_htd = 
	(| (htd_req_in[3:0] & notrap_pre_trap[3:0])) & take_notrap;

// fpe_req because this is not a trap, but if a real FPU trap
// catches up, then fpe is killed.  
// This led to a trap[03:00] without a take_fpe.
assign take_fpe = 
       (| (fpe_req[3:0] & notrap_pre_trap[3:0])) & take_notrap;

assign take_lsr = 
       (| (lsr_req_in[3:0] & notrap_pre_trap[3:0])) & take_notrap & 
       ~take_fpe;

assign take_itw =
       ( | (itw_req_in[3:0] & itw_pre_trap[3:0])) & take_itw_g;

assign take_res = 
       (| (res_req_in[3:0] & notrap_pre_trap[3:0])) & take_notrap & 
       ~take_fpe;

assign take_ssr = 
       (| (ssr_req_in_for_taken[3:0] & notrap_pre_trap[3:0])) & 
       take_notrap & 
       ~take_fpe;
assign take_ssr_por = 
       take_por & (| (ssr_req_in_for_taken[3:0] & reset_pre_trap[3:0]));

assign take_nns = 
       (| (nns_req_in[3:0] & notrap_pre_trap[3:0])) & take_notrap &
       ~take_fpe;

assign take_icp = 
       (| (icp_req_in[3:0] & notrap_pre_trap[3:0])) & take_notrap;

assign take_ipe = 
	(| (ipe_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_iae = 
	(| (iae_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_ipv = 
	(| (ipv_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_inp = 
	(| (inp_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_iua = 
	(| (iua_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_iar = 
	(| (iar_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_irr = 
	(| (irr_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_mar = 
	(| (mar_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_mrr = 
	(| (mrr_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_pro = 
	(| (pro_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_ill = 
	(| (ill_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_fpd = 
	(| (fpd_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_snn = 
	(| (snn_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_sno = 
	(| (sno_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_fnn = 
	(| (fnn_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_fno = 
	(| (fno_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_clw = 
	(| (clw_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_ldf = 
	(| (ldf_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_stf = 
	(| (stf_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_dap = 
	(| (dap_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
       ~take_pra;

assign take_vaw = 
	(| (vaw_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_iaw = 
	(| (iaw_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_paw = 
	(| (paw_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_maa = 
	(| (maa_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_pra = 
	(| (pra_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_dia = 
	(| (dia_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_ups = 
	(| (ups_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_dpv = 
	(| (dpv_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_dnc = 
	(| (dnc_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_dnf = 
	(| (dnf_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_dso = 
	(| (dso_req_in[3:0] & other_pre_trap[3:0])) & take_other & 
	~take_pra;

assign take_tof = 
	(| (tof_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_tcc = 
	(| (tcc_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_itm = 
	(| (itm_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_dtm = 
	(| (dtm_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_him = 
	(| (him_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_hdm = 
	(| (hdm_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_irt = 
	(| (irt_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_drt = 
	(| (drt_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_pmu = 
	(| (pmu_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_ime = 
	(| (ime_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_dme = 
	(| (dme_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_ibp = 
	(| (ibp_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_tct = 
	(| (tct_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_iit = 
	(| (iit_req_in[3:0] & other_pre_trap[3:0])) & take_other;

assign take_dit = 
	(| (dit_req_in[3:0] & other_pre_trap[3:0])) & take_other;

tlu_trl_ctl_msff_ctl_macro__width_1 take_pmu_lat  (
	.scan_in(take_pmu_lat_scanin),
	.scan_out(take_pmu_lat_scanout),
	.din	(take_pmu			),
	.dout	(take_pmu_last			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_pmu_trap_taken[3:0] =
       trap_taken3[3:0] & {4 {take_pmu_last}};

tlu_trl_ctl_msff_ctl_macro__width_4 take_ivt_lat  (
	.scan_in(take_ivt_lat_scanin),
	.scan_out(take_ivt_lat_scanout),
	.din	({take_sma,
		  take_cwq,
		  take_xir,
		  take_ftt}),
	.dout	({take_sma_last,
		  take_cwq_last,
		  take_xir_last,
		  take_ftt_last}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_take_sma =
	take_sma_last;
assign trl_take_cwq =
	take_cwq_last;
assign trl_take_xir =
	take_xir_last;
assign trl_take_ftt =
	take_ftt_last;




////////////////////////////////////////////////////////////////////////////////
// Determine which thread traps

assign trap[3:0] = 
	({4 {take_reset  }} &   reset_pre_trap[3:0]) | 
	({4 {take_disrupt}} & disrupt_pre_trap[3:0]) | 
	({4 {take_div    }} &  divide_pre_trap[3:0]) | 
	({4 {take_long   }} &    long_pre_trap[3:0]) | 
	({4 {take_don_ret}} & don_ret_pre_trap[3:0]) | 
	({4 {take_notrap }} &  notrap_pre_trap[3:0]) | 
	({4 {take_itw_g  }} &     itw_pre_trap[3:0]) | 
	({4 {take_fgu    }} &     fgu_pre_trap[3:0]) | 
	({4 {take_other  }} &   other_pre_trap[3:0]) ;

// trap_not_por only used for TL, so must not have POR in it
assign take_rstnpor =
       take_reset & ~take_por;
assign trap_not_por[3:0] = 
	({4 {take_rstnpor}} &   reset_pre_trap[3:0]) | 
	({4 {take_disrupt}} & disrupt_pre_trap[3:0]) | 
	({4 {take_div    }} &  divide_pre_trap[3:0]) | 
	({4 {take_long   }} &    long_pre_trap[3:0]) | 
	({4 {take_fgu    }} &     fgu_pre_trap[3:0]) | 
	({4 {take_other  }} &   other_pre_trap[3:0]) ;

assign real_trap[3:0] = 
	({4 {take_reset  }} &   reset_pre_trap[3:0]) | 
	({4 {take_disrupt}} & disrupt_pre_trap[3:0]) | 
	({4 {take_div    }} &  divide_pre_trap[3:0]) | 
	({4 {take_long   }} &    long_pre_trap[3:0]) | 
	({4 {take_fgu    }} &     fgu_pre_trap[3:0]) | 
	({4 {take_other  }} &   other_pre_trap[3:0]) ;

assign trap_ndr[3:0] = 
	({4 {take_reset  }} &   reset_pre_trap[3:0]) | 
	({4 {take_disrupt}} & disrupt_pre_trap[3:0]) | 
	({4 {take_div    }} &  divide_pre_trap[3:0]) | 
	({4 {take_long   }} &    long_pre_trap[3:0]) | 
	({4 {take_notrap }} &  notrap_pre_trap[3:0]) | 
	({4 {take_itw_g  }} &     itw_pre_trap[3:0]) | 
	({4 {take_fgu    }} &     fgu_pre_trap[3:0]) | 
	({4 {take_other  }} &   other_pre_trap[3:0]) ;

assign trap_itw[3:0] = 
	({4 {take_itw_g  }} &     itw_pre_trap[3:0]) ;

assign trap_por_res_ssr[3:0] =
	({4 {take_por   }} &    reset_pre_trap[3:0]) |
	({4 {take_res   }} &   notrap_pre_trap[3:0]) |
	({4 {take_ssr   }} &   notrap_pre_trap[3:0]) ;

assign trap_taken_in[3:0] =
       trap[3:0] & ~(fei_or_fof_incoming[3:0] | dbz_incoming[3:0]);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken_lat   (
	.scan_in(trap_taken_lat_scanin),
	.scan_out(trap_taken_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken0_lat   (
	.scan_in(trap_taken0_lat_scanin),
	.scan_out(trap_taken0_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken0		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken1_lat   (
	.scan_in(trap_taken1_lat_scanin),
	.scan_out(trap_taken1_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken1		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken2_lat   (
	.scan_in(trap_taken2_lat_scanin),
	.scan_out(trap_taken2_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken2		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken3_lat   (
	.scan_in(trap_taken3_lat_scanin),
	.scan_out(trap_taken3_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken3		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken4_lat   (
	.scan_in(trap_taken4_lat_scanin),
	.scan_out(trap_taken4_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken4		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_taken5_lat   (
	.scan_in(trap_taken5_lat_scanin),
	.scan_out(trap_taken5_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_taken_in		[3:0]	),
	.dout	(trap_taken5		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 trap_itw_taken_lat   (
	.scan_in(trap_itw_taken_lat_scanin),
	.scan_out(trap_itw_taken_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din  	(trap_itw		[3:0]	),
	.dout	(trap_itw_taken		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_trap_taken[3:0] =
       trap_taken[3:0];

tlu_trl_ctl_msff_ctl_macro__width_1 take_reset_last_lat  (
	.scan_in(take_reset_last_lat_scanin),
	.scan_out(take_reset_last_lat_scanout),
	.din	(take_reset			),
	.dout	(take_reset_last		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

////////////////////////////////////////////////////////////////////////////////
// Generate trap type
//
//  The trap address is 
//	TBA<63:15> TL>0  TT(TL)  00000
//	63      15  14   13   5  4   0
//

assign trap_type_in[8:0] = 
	({9 {take_por}} & 9'h001) |
	({9 {take_xir}} & 9'h003) | 
	({9 {take_sir}} & 9'h004) |
	({9 {take_iln}} & {5'b00100, int_level_n[3:0]}) | 
	({9 {take_ivt}} & 9'h060) | 
	({9 {take_mqr}} & 9'h07c) | 
	({9 {take_dqr}} & 9'h07d) | 
	({9 {take_rqr}} & 9'h07e) | 
	({9 {take_eer}} & 9'h063) | 
	({9 {take_ftt}} & 9'h007) | 
	({9 {take_hst}} & 9'h05e) | 
	({9 {take_tlz}} & 9'h05f) | 
	({9 {take_cwq}} & 9'h03c) | 
	({9 {take_sma}} & 9'h03d) | 
	({9 {take_ade}} & 9'h040) | 
	({9 {take_ipe}} & 9'h029) | 
	({9 {take_dae}} & 9'h032) | 
	({9 {take_fei}} & 9'h021) | 
	({9 {take_fof}} & 9'h022) | 
	({9 {take_iae}} & 9'h00a) | 
	({9 {take_ipv}} & 9'h008) | 
	({9 {take_iua}} & 9'h00b) | 
	({9 {take_inp}} & 9'h00c) | 
	({9 {take_iar}} & 9'h00d) | 
	({9 {take_irr}} & 9'h00e) | 
	({9 {take_mar}} & 9'h02e) | 
	({9 {take_mrr}} & 9'h02d) | 
	({9 {take_pro}} & 9'h011) | 
	({9 {take_ill}} & 9'h010) | 
	({9 {take_fpd}} & 9'h020) |
	({9 {take_snn}} & {4'b0100, wstate[2:0], 2'b00}) |
	({9 {take_sno}} & {4'b0101, wstate[2:0], 2'b00}) |
	({9 {take_fnn}} & {4'b0110, wstate[2:0], 2'b00}) |
	({9 {take_fno}} & {4'b0111, wstate[2:0], 2'b00}) |
	({9 {take_clw}} & 9'h024) | 
	({9 {take_ldf}} & 9'h035) | 
	({9 {take_stf}} & 9'h036) | 
	({9 {take_dap}} & 9'h06c) | 
	({9 {take_vaw}} & 9'h062) | 
	({9 {take_iaw}} & 9'h075) | 
	({9 {take_paw}} & 9'h061) | 
	({9 {take_maa}} & 9'h034) | 
	({9 {take_pra}} & 9'h037) |
 	({9 {take_dia}} & 9'h014) | 
 	({9 {take_ups}} & 9'h03b) | 
 	({9 {take_dpv}} & 9'h015) | 
 	({9 {take_dnc}} & 9'h016) | 
 	({9 {take_dnf}} & 9'h017) | 
 	({9 {take_dso}} & 9'h030) | 
	({9 {take_tof}} & 9'h023) | 
	({9 {take_tcc}} & {1'b1, tcc_number[7:0]}) | 
	({9 {take_itm}} & 9'h064) |  
	({9 {take_dtm}} & 9'h068) |  
	({9 {take_him}} & 9'h009) |  
	({9 {take_hdm}} & 9'h031) |  
	({9 {take_irt}} & 9'h03e) |  
	({9 {take_drt}} & 9'h03f) |  
	({9 {take_pmu}} & 9'h04f) |
        ({9 {take_div}} & 9'h028) |
        ({9 {take_ime}} & 9'h071) |
        ({9 {take_dme}} & 9'h072) |
        ({9 {take_ibp}} & 9'h076) |
        ({9 {take_tct}} & 9'h074) |
        ({9 {take_iit}} & 9'h02a) |
        ({9 {take_dit}} & 9'h02b) ;

assign no_special_trap =
       ~next_trap_to_red & ~next_trap_to_err & ~priv_overflow_tl;

assign priv_overflow_tl =
       next_trap_to_hpriv & sip;

// XIR and POR at TL==MAXTL do NOT take WDR
// SIR at TL==MAXTL DOES take WDR
// All other traps  at TL== MAXTL take WDR
assign trap_type_for_pc_in[8:0] = 
	({9 {take_por                    }} & 9'h001) |
	({9 {take_xir                    }} & 9'h003) | 
	({9 {take_sir & ~next_trap_to_err}} & 9'h004) |
	({9 {take_sir &  next_trap_to_err}} & 9'h002) |
        ({9 {            no_special_trap }} & trap_type_in[8:0]) |
	({9 {take_otr &  next_trap_to_red}} & 9'h005) |
	({9 {take_otr &  next_trap_to_err}} & 9'h002) |
	({9 {take_otr &  priv_overflow_tl}} & 9'h002) ;

assign wstate[2:0] =
	({3 {real_trap[3]}} & fls_wstate3[2:0]) | 
	({3 {real_trap[2]}} & fls_wstate2[2:0]) | 
	({3 {real_trap[1]}} & fls_wstate1[2:0]) | 
	({3 {real_trap[0]}} & fls_wstate0[2:0]) ;

assign tcc_number[7:0] =
	({8 {real_trap[3]}} & fls_tcc_number_3[7:0]) | 
	({8 {real_trap[2]}} & fls_tcc_number_2[7:0]) | 
	({8 {real_trap[1]}} & fls_tcc_number_1[7:0]) | 
	({8 {real_trap[0]}} & fls_tcc_number_0[7:0]) ;

tlu_trl_ctl_msff_ctl_macro__width_9 trap_type_lat  (
	.scan_in(trap_type_lat_scanin),
	.scan_out(trap_type_lat_scanout),
	.din	(trap_type_in		[8:0]	),
	.dout	(trap_type		[8:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_9 trap_type_for_pc_lat  (
	.scan_in(trap_type_for_pc_lat_scanin),
	.scan_out(trap_type_for_pc_lat_scanout),
	.din	(trap_type_for_pc_in	[8:0]	),
	.dout	(trap_type_for_pc	[8:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// trl_trap_type goes into muxflop, so can be late
assign trl_trap_type[8:0] = 
	trap_type_for_pc[8:0];

// trl_tsa_trap_type goes into muxflop, so can be late
assign trl_tsa_trap_type[8:0] = 
	trap_type[8:0];



////////////////////////////////////////////////////////////////////////////////
// Maintain trap level

tlu_trl_ctl_msff_ctl_macro__width_4 hpstate_hpriv_lat  (
	.scan_in(hpstate_hpriv_lat_scanin),
	.scan_out(hpstate_hpriv_lat_scanout),
	.din	(tsd_hpstate_hpriv	[3:0]	),
	.dout	(hpstate_hpriv		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign h_wr_tl[3:0] =
       asi_wr_tl[3:0] &  hpstate_hpriv[3:0];
assign n_wr_tl[3:0] =
       asi_wr_tl[3:0] & ~hpstate_hpriv[3:0];

// Writes to TL when not in hyperprivileged mode saturate at MAXPTL (3'b010);
// writes to TL when in hyperprivileged mode saturate at MAXTL (3'b110)
// Saturation looks at bits 2:0 only
assign tl_h_wr_data[2:0] =
       {asi_wr_data[2:1], asi_wr_data[0] & ~(& asi_wr_data[2:1])};
assign tl_n_wr_data[2:0] =
       {1'b0, (| asi_wr_data[2:1]), asi_wr_data[0] & ~(| asi_wr_data[2:1])};

assign hold_tl[3:0] =
       ~(take_any_dec[3:0] | npc_sel_tnpc[3:0] | asi_wr_tl[3:0]);

assign tl3_incr[2:0] = 
	tl3[2:0] + {2'b00, tl3[2:0] != maxtl[2:0]};
assign tl3_decr[2:0] = 
	tl3[2:0] - {2'b00, tl3[2:0] != 3'b000};
assign tl3_in[2:0] = 
	({3 {take_por_dec    [3]                    }} & maxtl       [2:0]) | 
	({3 {take_any_dec    [3] & ~take_por_dec[3]}} & tl3_incr    [2:0]) |
	({3 {npc_sel_tnpc    [3]                    }} & tl3_decr    [2:0]) |
        ({3 {h_wr_tl         [3]                    }} & tl_h_wr_data[2:0]) |
        ({3 {n_wr_tl         [3]                    }} & tl_n_wr_data[2:0]) |
        ({3 {hold_tl         [3]                    }} & tl3         [2:0]) ;
assign tlz_in[3] =
       (tl3[2:0] == 3'b000) & tsd_hpstate_tlz[3] & ~ptlz_req_in[3];

assign tl2_incr[2:0] = 
	tl2[2:0] + {2'b00, tl2[2:0] != maxtl[2:0]};
assign tl2_decr[2:0] = 
	tl2[2:0] - {2'b00, tl2[2:0] != 3'b000};
assign tl2_in[2:0] = 
	({3 {take_por_dec    [2]                    }} & maxtl       [2:0]) | 
	({3 {take_any_dec    [2] & ~take_por_dec[2]}} & tl2_incr    [2:0]) |
	({3 {npc_sel_tnpc    [2]                    }} & tl2_decr    [2:0]) |
        ({3 {h_wr_tl         [2]                    }} & tl_h_wr_data[2:0]) |
        ({3 {n_wr_tl         [2]                    }} & tl_n_wr_data[2:0]) |
        ({3 {hold_tl         [2]                    }} & tl2         [2:0]) ;
assign tlz_in[2] =
       (tl2[2:0] == 3'b000) & tsd_hpstate_tlz[2] & ~ptlz_req_in[2];

assign tl1_incr[2:0] = 
	tl1[2:0] + {2'b00, tl1[2:0] != maxtl[2:0]};
assign tl1_decr[2:0] = 
	tl1[2:0] - {2'b00, tl1[2:0] != 3'b000};
assign tl1_in[2:0] = 
	({3 {take_por_dec    [1]                    }} & maxtl       [2:0]) | 
	({3 {take_any_dec    [1] & ~take_por_dec[1]}} & tl1_incr    [2:0]) |
	({3 {npc_sel_tnpc    [1]                    }} & tl1_decr    [2:0]) |
        ({3 {h_wr_tl         [1]                    }} & tl_h_wr_data[2:0]) |
        ({3 {n_wr_tl         [1]                    }} & tl_n_wr_data[2:0]) |
        ({3 {hold_tl         [1]                    }} & tl1         [2:0]) ;
assign tlz_in[1] =
       (tl1[2:0] == 3'b000) & tsd_hpstate_tlz[1] & ~ptlz_req_in[1];

assign tl0_incr[2:0] = 
	tl0[2:0] + {2'b00, tl0[2:0] != maxtl[2:0]};
assign tl0_decr[2:0] = 
	tl0[2:0] - {2'b00, tl0[2:0] != 3'b000};
assign tl0_in[2:0] = 
	({3 {take_por_dec    [0]                    }} & maxtl       [2:0]) | 
	({3 {take_any_dec    [0] & ~take_por_dec[0]}} & tl0_incr    [2:0]) |
	({3 {npc_sel_tnpc    [0]                    }} & tl0_decr    [2:0]) |
        ({3 {h_wr_tl         [0]                    }} & tl_h_wr_data[2:0]) |
        ({3 {n_wr_tl         [0]                    }} & tl_n_wr_data[2:0]) |
        ({3 {hold_tl         [0]                    }} & tl0         [2:0]) ;
assign tlz_in[0] =
       (tl0[2:0] == 3'b000) & tsd_hpstate_tlz[0] & ~ptlz_req_in[0];

tlu_trl_ctl_msff_ctl_macro__width_12 tl_lat  (
	.scan_in(tl_lat_scanin),
	.scan_out(tl_lat_scanout),
	.din	({tl3_in	[2:0],
		  tl2_in	[2:0],
		  tl1_in	[2:0],
		  tl0_in	[2:0]}),
	.dout	({tl3		[2:0],
		  tl2		[2:0],
		  tl1		[2:0],
		  tl0		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_trl_ctl_msff_ctl_macro__width_4 tlz_lat  (
	.scan_in(tlz_lat_scanin),
	.scan_out(tlz_lat_scanout),
	.din	(tlz_in		[3:0]	),
	.dout	(tlz		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_tlz_exc[3:0] =
       tlz[3:0] & ~hpstate_hpriv[3:0];

// Since tl has already changed, check for tl > 1 when not in hpriv mode
assign trl_tl_gt_0 =
       (thread_sel[3] & (| tl3[2:1]) & ~hpstate_hpriv[3]) |
       (thread_sel[2] & (| tl2[2:1]) & ~hpstate_hpriv[2]) |
       (thread_sel[1] & (| tl1[2:1]) & ~hpstate_hpriv[1]) |
       (thread_sel[0] & (| tl0[2:1]) & ~hpstate_hpriv[0]) ;

assign tl_gt_0_in[3:0] =
       {(| tl3_in[2:0]), (| tl2_in[2:0]),  
	(| tl1_in[2:0]), (| tl0_in[2:0])};

assign trl_tl_eq_0[3:0] =
       ~tl_gt_0[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 tl_gt_0_last_lat  (
	.scan_in(tl_gt_0_last_lat_scanin),
	.scan_out(tl_gt_0_last_lat_scanout),
	.din	(tl_gt_0_in	[3:0]	),
	.dout	(tl_gt_0	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_tl_gt_0[3:0] =
       tl_gt_0[3:0];	

assign tlu_mmu_tl_gt_0[3:0] =
       tl_gt_0[3:0];

assign trap_tl[2:0] = 
	({3 {trap_not_por[3]}} & tl3			[2:0]) |
	({3 {trap_not_por[2]}} & tl2			[2:0]) |
	({3 {trap_not_por[1]}} & tl1			[2:0]) |
	({3 {trap_not_por[0]}} & tl0			[2:0]) |
        ({3 {take_por          }} & maxtl_minus_one	[2:0]) ;

assign trap_tl_m1[2:0] = 
	({3 {trap_ndr[3]}} & tl3_decr[2:0]) |
	({3 {trap_ndr[2]}} & tl2_decr[2:0]) |
	({3 {trap_ndr[1]}} & tl1_decr[2:0]) |
	({3 {trap_ndr[0]}} & tl0_decr[2:0]) ;

assign rda_tl_m1[2:0] =
       ({3 { asi_tsa_tid[1] &  asi_tsa_tid[0]}} & tl3_decr[2:0]) |
       ({3 { asi_tsa_tid[1] & ~asi_tsa_tid[0]}} & tl2_decr[2:0]) |
       ({3 {~asi_tsa_tid[1] &  asi_tsa_tid[0]}} & tl1_decr[2:0]) |
       ({3 {~asi_tsa_tid[1] & ~asi_tsa_tid[0]}} & tl0_decr[2:0]) ;



////////////////////////////////////////////////////////////////////////////////
// Maintain GL (global level)

// Writes to GL look at 4 bits
// Writes when HPSTATE.HPRIV == 1'b1 saturate at 2'b11
// Writes when HPSTATE.HPRIV == 1'b0 saturate at 2'b10

// Need to delay GL write and trap update by two cycles to avoid 
// simultaneous GL update by done or retry (for a different thread)
assign wr_gl_data_in_in[1] =
       (| asi_wr_data[3:1]);
assign wr_gl_data_in_in[0] =
        ((| {asi_wr_data[3:2], asi_wr_data[0]}) & 
	 (| (asi_wr_gl[3:0] & hpstate_hpriv[3:0]))) |
	(~asi_wr_data[3] & ~asi_wr_data[2] & ~asi_wr_data[1] & 
	 asi_wr_data[0] & 
	 (| (asi_wr_gl[3:0] & ~hpstate_hpriv[3:0])));

assign gl_data_in_in[1:0] =
        ({2 {| asi_wr_gl        [3:0]}} & wr_gl_data_in_in	[1:0]) ;

assign update_gl_in_in[3:0] =
       asi_wr_gl[3:0];

tlu_trl_ctl_msff_ctl_macro__width_12 wr_gl_lat  (
	.scan_in(wr_gl_lat_scanin),
	.scan_out(wr_gl_lat_scanout),
	.din	({update_gl_in_in	[3:0],
		  update_gl_in		[3:0],
		  gl_data_in_in		[1:0],
		  gl_data_in		[1:0]}),
	.dout	({update_gl_in		[3:0],
		  update_gl		[3:0],
		  gl_data_in		[1:0],
		  gl_data		[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// GL saturates at 2'b11 when in hypervisor mode, but at MAXPTL when not
assign maxglc[1:0] =
       {2 {other_trap | hpriv_last | take_reset_last | reset_trap}} | 
       maxptl[1:0];

assign take_anr_dec_last[3:0] =
       take_any_dec_last[3:0] & ~take_por_dec_last[3:0];

assign hold_gl[3:0] =
       ~(take_any_dec_last[3:0] | npc_sel_tnpc[3:0] | update_gl[3:0]);

// Hold GL for two cycles so ECC errors can prevent GL update
// Saturate when not returning to hyperprivileged mode
assign saturate_restore =
       (pgl_rest_in[1:0] > maxptl[1:0]) & ~tsd_htstate_hpriv;
assign gl_rest_in[1:0] =
       ({ 2 { saturate_restore}} & maxptl     [1:0]) | 
       ({ 2 {~saturate_restore}} & pgl_rest_in[1:0]) ;
tlu_trl_ctl_msff_ctl_macro__width_4 gl_rest_lat  (
	.scan_in(gl_rest_lat_scanin),
	.scan_out(gl_rest_lat_scanout),
	.din	({tsa_gl	[1:0],
		  gl_rest_in	[1:0]}),
	.dout	({pgl_rest_in	[1:0],
		  gl_rest	[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign gl3_incr[1:0] = 
	(gl3[1:0] + {1'b0, gl3[1:0] < maxglc[1:0]}) & 
	{1'b1, ~gl3[1] | maxglc[0]};
assign gl3_in[1:0] = 
	({2 {take_por_dec_last[3]}} & maxgl	[1:0]) | 
	({2 {take_anr_dec_last[3]}} & gl3_incr	[1:0]) |
	({2 {npc_sel_tnpc     [3]}} & gl_rest	[1:0]) |
        ({2 {update_gl        [3]}} & gl_data	[1:0]) |
	({2 {hold_gl          [3]}} & gl3    	[1:0]) ;

assign gl2_incr[1:0] = 
	(gl2[1:0] + {1'b0, gl2[1:0] < maxglc[1:0]}) & 
	{1'b1, ~gl2[1] | maxglc[0]};
assign gl2_in[1:0] = 
	({2 {take_por_dec_last[2]}} & maxgl	[1:0]) | 
	({2 {take_anr_dec_last[2]}} & gl2_incr	[1:0]) |
	({2 {npc_sel_tnpc     [2]}} & gl_rest	[1:0]) |
        ({2 {update_gl        [2]}} & gl_data	[1:0]) |
	({2 {hold_gl          [2]}} & gl2    	[1:0]) ;

assign gl1_incr[1:0] = 
	(gl1[1:0] + {1'b0, gl1[1:0] < maxglc[1:0]}) & 
	{1'b1, ~gl1[1] | maxglc[0]};
assign gl1_in[1:0] = 
	({2 {take_por_dec_last[1]}} & maxgl	[1:0]) | 
	({2 {take_anr_dec_last[1]}} & gl1_incr	[1:0]) |
	({2 {npc_sel_tnpc     [1]}} & gl_rest	[1:0]) |
        ({2 {update_gl        [1]}} & gl_data	[1:0]) |
	({2 {hold_gl          [1]}} & gl1    	[1:0]) ;

assign gl0_incr[1:0] = 
	(gl0[1:0] + {1'b0, gl0[1:0] < maxglc[1:0]}) & 
	{1'b1, ~gl0[1] | maxglc[0]};
assign gl0_in[1:0] = 
	({2 {take_por_dec_last[0]}} & maxgl	[1:0]) | 
	({2 {take_anr_dec_last[0]}} & gl0_incr	[1:0]) |
	({2 {npc_sel_tnpc     [0]}} & gl_rest	[1:0]) |
        ({2 {update_gl        [0]}} & gl_data	[1:0]) |
	({2 {hold_gl          [0]}} & gl0    	[1:0]) ;

assign trap_gl_in[1:0] = 
	({2 {real_trap[3]}} & gl3[1:0]) |
	({2 {real_trap[2]}} & gl2[1:0]) |
	({2 {real_trap[1]}} & gl1[1:0]) |
	({2 {real_trap[0]}} & gl0[1:0]) ;

tlu_trl_ctl_msff_ctl_macro__width_10 gl_lat  ( 
	.scan_in(gl_lat_wmr_scanin),
	.scan_out(gl_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	({trap_gl_in	[1:0],
		  gl3_in	[1:0],
		  gl2_in	[1:0],
		  gl1_in	[1:0],
		  gl0_in	[1:0]}),
	.dout	({trl_tsa_gl	[1:0],
		  gl3		[1:0],
		  gl2		[1:0],
		  gl1		[1:0],
		  gl0		[1:0]}),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign trl_gl3[1:0] =
       gl3[1:0];
assign trl_gl2[1:0] =
       gl2[1:0];
assign trl_gl1[1:0] =
       gl1[1:0];
assign trl_gl0[1:0] =
       gl0[1:0];

assign tlu_gl3[1:0] =
       gl3[1:0];
assign tlu_gl2[1:0] =
       gl2[1:0];
assign tlu_gl1[1:0] =
       gl1[1:0];
assign tlu_gl0[1:0] =
       gl0[1:0];



////////////////////////////////////////////////////////////////////////////////
// Manage TSA read and write addresses

tlu_trl_ctl_msff_ctl_macro__width_1 mbist_run_lat  (
	.scan_in(mbist_run_lat_scanin),
	.scan_out(mbist_run_lat_scanout),
	.din	(mbi_run	),
	.dout	(mbist_run	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign wr_addr_in_in[4:0] = 
       {5 {| trap_ndr[3:0]}} & 	
       {trap_ndr[3] | trap_ndr[2], trap_ndr[3] | trap_ndr[1], 
	({3 {~next_trap_to_err}} & trap_tl   [2:0]) | 
	({3 { next_trap_to_err}} & trap_tl_m1[2:0])};
assign wr_addr_func_in[4:0] =
       ({5 {~rmw_tsa}} & wr_addr_in_p	[4:0]) | 
       ({5 { rmw_tsa}} & rmw_addr	[4:0]) ;
assign wr_addr_in[4:0] =
       (wr_addr_func_in	[4:0] & {5 {~mbist_run}}) | 
       (asi_mbist_addr	[4:0] & {5 { mbist_run}}) ;

tlu_trl_ctl_msff_ctl_macro__width_10 tsa_wr_addr_lat  (
	.scan_in(tsa_wr_addr_lat_scanin),
	.scan_out(tsa_wr_addr_lat_scanout),
	.din	({wr_addr_in_in	[4:0],
		  wr_addr_in	[4:0]}),
	.dout	({wr_addr_in_p	[4:0],
		  wr_addr	[4:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_tsa_wr_addr[4:0] = 
       wr_addr[4:0];


assign don_ret_tl_m1[2:0] = 
	({3 {don_ret_pre_trap[3]}} & tl3_decr[2:0]) |
	({3 {don_ret_pre_trap[2]}} & tl2_decr[2:0]) |
	({3 {don_ret_pre_trap[1]}} & tl1_decr[2:0]) |
	({3 {don_ret_pre_trap[0]}} & tl0_decr[2:0]) ;

assign rd_addr_in[4:0] = 
        ({5 {~asi_preempt_done_retry}} &
	 {don_ret_pre_trap[3] | don_ret_pre_trap[2], 
	  don_ret_pre_trap[3] | don_ret_pre_trap[1], 
	  don_ret_tl_m1[2:0]}) |
	({5 { asi_preempt_done_retry}} & 
	 {asi_tsa_rd_addr[4:3], 
	  ({3 {~asi_tsa_rd_iqr_ecc}} & rda_tl_m1[2:0]) | 
	  ({3 { asi_tsa_rd_iqr_ecc}} & asi_tsa_rd_addr[2:0])}) ;

tlu_trl_ctl_msff_ctl_macro__width_5 tsa_rd_addr_lat  (
	.scan_in(tsa_rd_addr_lat_scanin),
	.scan_out(tsa_rd_addr_lat_scanout),
	.din	(rd_addr_in	[4:0]	),
	.dout	(rd_addr	[4:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_tsa_rd_addr[4:0] = 
	rd_addr_in[4:0] ;


tlu_trl_ctl_msff_ctl_macro__width_5 rmw_addr_lat  (
	.scan_in(rmw_addr_lat_scanin),
	.scan_out(rmw_addr_lat_scanout),
	.din	(rd_addr	[4:0]),
	.dout	(rmw_addr	[4:0]),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_2 rmw_tsa_lat  (
	.scan_in(rmw_tsa_lat_scanin),
	.scan_out(rmw_tsa_lat_scanout),
	.din	({asi_rmw_tsa, 
		  rmw_next}		),
	.dout	({rmw_next,
		  rmw_tsa}		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_rmw_tsa =
       rmw_tsa;


////////////////////////////////////////////////////////////////////////////////
// Processor Interrupt Level register

assign pil3_in[3:0] =
        ({4 { asi_wr_pil[3]}} & asi_wr_data	[3:0]) |
	({4 {~asi_wr_pil[3]}} & pil3		[3:0]) ;

assign pil2_in[3:0] =
        ({4 { asi_wr_pil[2]}} & asi_wr_data	[3:0]) |
	({4 {~asi_wr_pil[2]}} & pil2		[3:0]) ;

assign pil1_in[3:0] =
        ({4 { asi_wr_pil[1]}} & asi_wr_data	[3:0]) |
	({4 {~asi_wr_pil[1]}} & pil1		[3:0]) ;

assign pil0_in[3:0] =
        ({4 { asi_wr_pil[0]}} & asi_wr_data	[3:0]) |
	({4 {~asi_wr_pil[0]}} & pil0		[3:0]) ;

tlu_trl_ctl_msff_ctl_macro__width_4 pil3_lat  ( 
	.scan_in(pil3_lat_wmr_scanin),
	.scan_out(pil3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pil3_in	[3:0]	),
	.dout	(pil3		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 pil2_lat  ( 
	.scan_in(pil2_lat_wmr_scanin),
	.scan_out(pil2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pil2_in	[3:0]	),
	.dout	(pil2		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 pil1_lat  ( 
	.scan_in(pil1_lat_wmr_scanin),
	.scan_out(pil1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pil1_in	[3:0]	),
	.dout	(pil1		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 pil0_lat  ( 
	.scan_in(pil0_lat_wmr_scanin),
	.scan_out(pil0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(pil0_in	[3:0]	),
	.dout	(pil0		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Softint register

// Encode HSTICK/STICK/TICK data
// 05    = Valid for disrupt ECC exception
// 04:03 = HSTICK/STICK/TICK
// 02    = Valid for precise ECC exception
// 01:00 = TID
assign tic_compare_in[5:0] =
       {(tic_addr[2] == thread_group) & ~tic_not_valid,
	tic_addr[4:3],			
	(tic_addr[2] == thread_group) & tic_match & ~tic_not_valid,
	tic_addr[1:0]};			

tlu_trl_ctl_msff_ctl_macro__width_6 tic_compare_lat  (
	.scan_in(tic_compare_lat_scanin),
	.scan_out(tic_compare_lat_scanout),
	.din	(tic_compare_in	[5:0]	),
	.dout	(tic_compare	[5:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


// STICK_CMPR
assign tick3_compare[16] =
       (tic_compare[4:3] == 2'b01) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b11) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[3]);
// TICK_CMPR
assign tick3_compare[0] =
       (tic_compare[4:3] == 2'b00) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b11) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[3]);
assign tick3_compare[15:1] = 15'h0000;
assign softint3_mux[16:0] =
        ({17 { asi_wr_softint		[3]}} & asi_wr_data	[16:0]	) |
	({17 { asi_wr_set_softint	[3]}} & asi_wr_data	[16:0]	) |
	({17 {~asi_wr_softint		[3]}} & softint3	[16:0]	) |
        ({1'b0, fls_pmu_request[3], {15 {1'b0}}}			) ;
assign softint3_mask[16:0] = 	 
        ({17 {~asi_wr_clear_softint	[3]}} 				) |
	({17 { asi_wr_clear_softint	[3]}} & ~asi_wr_data	[16:0]	) ;
assign softint3_in[16:0] =
       (softint3_mux[16:0] & softint3_mask[16:0]) | tick3_compare[16:0];

// STICK_CMPR
assign tick2_compare[16] =
       (tic_compare[4:3] == 2'b01) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b10) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[2]);
// TICK_CMPR
assign tick2_compare[0] =
       (tic_compare[4:3] == 2'b00) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b10) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[2]);
assign tick2_compare[15:1] = 15'h0000;
assign softint2_mux[16:0] =
        ({17 { asi_wr_softint		[2]}} & asi_wr_data	[16:0]	) |
	({17 { asi_wr_set_softint	[2]}} & asi_wr_data	[16:0]	) |
	({17 {~asi_wr_softint		[2]}} & softint2	[16:0]	) |
        ({1'b0, fls_pmu_request[2], {15 {1'b0}}}			) ;
assign softint2_mask[16:0] = 	 
        ({17 {~asi_wr_clear_softint	[2]}} 				) |
	({17 { asi_wr_clear_softint	[2]}} & ~asi_wr_data	[16:0]	) ;
assign softint2_in[16:0] =
       (softint2_mux[16:0] & softint2_mask[16:0]) | tick2_compare[16:0];

// STICK_CMPR
assign tick1_compare[16] =
       (tic_compare[4:3] == 2'b01) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b01) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[1]);
// TICK_CMPR
assign tick1_compare[0] =
       (tic_compare[4:3] == 2'b00) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b01) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[1]);
assign tick1_compare[15:1] = 15'h0000;
assign softint1_mux[16:0] =
        ({17 { asi_wr_softint		[1]}} & asi_wr_data	[16:0]	) |
	({17 { asi_wr_set_softint	[1]}} & asi_wr_data	[16:0]	) |
	({17 {~asi_wr_softint		[1]}} & softint1	[16:0]	) |
        ({1'b0, fls_pmu_request[1], {15 {1'b0}}}			) ;
assign softint1_mask[16:0] = 	 
        ({17 {~asi_wr_clear_softint	[1]}} 				) |
	({17 { asi_wr_clear_softint	[1]}} & ~asi_wr_data	[16:0]	) ;
assign softint1_in[16:0] =
       (softint1_mux[16:0] & softint1_mask[16:0]) | tick1_compare[16:0];

// STICK_CMPR
assign tick0_compare[16] =
       (tic_compare[4:3] == 2'b01) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b00) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[0]);
// TICK_CMPR
assign tick0_compare[0] =
       (tic_compare[4:3] == 2'b00) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b00) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[0]);
assign tick0_compare[15:1] = 15'h0000;
assign softint0_mux[16:0] =
        ({17 { asi_wr_softint		[0]}} & asi_wr_data	[16:0]	) |
	({17 { asi_wr_set_softint	[0]}} & asi_wr_data	[16:0]	) |
	({17 {~asi_wr_softint		[0]}} & softint0	[16:0]	) |
        ({1'b0, fls_pmu_request[0], {15 {1'b0}}}			) ;
assign softint0_mask[16:0] = 	 
        ({17 {~asi_wr_clear_softint	[0]}} 				) |
	({17 { asi_wr_clear_softint	[0]}} & ~asi_wr_data	[16:0]	) ;
assign softint0_in[16:0] =
       (softint0_mux[16:0] & softint0_mask[16:0]) | tick0_compare[16:0];

tlu_trl_ctl_msff_ctl_macro__width_17 softint3_lat  ( 
	.scan_in(softint3_lat_wmr_scanin),
	.scan_out(softint3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(softint3_in		[16:0]	),
	.dout	(softint3		[16:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_17 softint2_lat  ( 
	.scan_in(softint2_lat_wmr_scanin),
	.scan_out(softint2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(softint2_in		[16:0]	),
	.dout	(softint2		[16:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_17 softint1_lat  ( 
	.scan_in(softint1_lat_wmr_scanin),
	.scan_out(softint1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(softint1_in		[16:0]	),
	.dout	(softint1		[16:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_17 softint0_lat  ( 
	.scan_in(softint0_lat_wmr_scanin),
	.scan_out(softint0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(softint0_in		[16:0]	),
	.dout	(softint0		[16:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// interrupt_level_n
// Only take interrupts that are larger than the value in PIL

tlu_trl_ctl_msff_ctl_macro__width_4 pstate_ie_lat  (
	.scan_in(pstate_ie_lat_scanin),
	.scan_out(pstate_ie_lat_scanout),
	.din	(tsd_pstate_ie		[3:0]	),
	.dout	(pstate_ie		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pil3_mask[15:1] =
       {15 {~hpstate_hpriv[3] & pstate_ie[3] & ~trap_taken3[3]}} &
       {~(( pil3[3] &  pil3[2] &  pil3[1] &  pil3[0]) ),	// 15
	~(( pil3[3] &  pil3[2] &  pil3[1]            ) ),	// 15-14
	~(( pil3[3] &  pil3[2] &  pil3[1]            ) |	
	  ( pil3[3] &  pil3[2] &              pil3[0]) ),	// 15-14,13
	~(( pil3[3] &  pil3[2]                        ) ),	// 15-12
	~(( pil3[3] &  pil3[2]                        ) |
	  ( pil3[3] &              pil3[1] &  pil3[0]) ),	// 15-12,11
	~(( pil3[3] &  pil3[2]                        ) |
	  ( pil3[3] &              pil3[1]            ) ),	// 15-12,11-10
	~(( pil3[3] &  pil3[2]                        ) |
	  ( pil3[3] &              pil3[1]            ) |
	  ( pil3[3] &                          pil3[0]) ),	// 15-12,11-10,9
	~(( pil3[3]                                    ) ),	// 15-8
	~(( pil3[3]                                    ) |
	  (             pil3[2] &  pil3[1] &  pil3[0]) ),	// 15-8,7
	~(( pil3[3]                                    ) |
	  (             pil3[2] &  pil3[1]            ) ),	// 15-8,7-6
	~(( pil3[3]                                    ) |
	  (             pil3[2] &  pil3[1]            ) |
	  (             pil3[2] &              pil3[0]) ),	// 15-8,7-6,5
	~(( pil3[3]                                    ) |
	  (             pil3[2]                        ) ),	// 15-8,7-4
	~(( pil3[3]                                    ) |
	  (             pil3[2]                        ) |
	  (                         pil3[1] &  pil3[0]) ),	// 15-8,7-4,3
	~(( pil3[3]                                    ) |
	  (             pil3[2]                        ) |
	  (                         pil3[1]            ) ),	// 15-8,7-4,3-2
	~(( pil3[3]                                    ) |
	  (             pil3[2]                        ) |
	  (                         pil3[1]            ) |
	  (                                     pil3[0]) )};	//15-8,7-4,3-2,1

assign pil2_mask[15:1] =
       {15 {~hpstate_hpriv[2] & pstate_ie[2] & ~trap_taken3[2]}} &
       {~(( pil2[3] &  pil2[2] &  pil2[1] &  pil2[0]) ),	// 15
	~(( pil2[3] &  pil2[2] &  pil2[1]            ) ),	// 15-14
	~(( pil2[3] &  pil2[2] &  pil2[1]            ) |	
	  ( pil2[3] &  pil2[2] &              pil2[0]) ),	// 15-14,13
	~(( pil2[3] &  pil2[2]                        ) ),	// 15-12
	~(( pil2[3] &  pil2[2]                        ) |
	  ( pil2[3] &              pil2[1] &  pil2[0]) ),	// 15-12,11
	~(( pil2[3] &  pil2[2]                        ) |
	  ( pil2[3] &              pil2[1]            ) ),	// 15-12,11-10
	~(( pil2[3] &  pil2[2]                        ) |
	  ( pil2[3] &              pil2[1]            ) |
	  ( pil2[3] &                          pil2[0]) ),	// 15-12,11-10,9
	~(( pil2[3]                                    ) ),	// 15-8
	~(( pil2[3]                                    ) |
	  (             pil2[2] &  pil2[1] &  pil2[0]) ),	// 15-8,7
	~(( pil2[3]                                    ) |
	  (             pil2[2] &  pil2[1]            ) ),	// 15-8,7-6
	~(( pil2[3]                                    ) |
	  (             pil2[2] &  pil2[1]            ) |
	  (             pil2[2] &              pil2[0]) ),	// 15-8,7-6,5
	~(( pil2[3]                                    ) |
	  (             pil2[2]                        ) ),	// 15-8,7-4
	~(( pil2[3]                                    ) |
	  (             pil2[2]                        ) |
	  (                         pil2[1] &  pil2[0]) ),	// 15-8,7-4,3
	~(( pil2[3]                                    ) |
	  (             pil2[2]                        ) |
	  (                         pil2[1]            ) ),	// 15-8,7-4,3-2
	~(( pil2[3]                                    ) |
	  (             pil2[2]                        ) |
	  (                         pil2[1]            ) |
	  (                                     pil2[0]) )};	//15-8,7-4,3-2,1

assign pil1_mask[15:1] =
       {15 {~hpstate_hpriv[1] & pstate_ie[1] & ~trap_taken3[1]}} &
       {~(( pil1[3] &  pil1[2] &  pil1[1] &  pil1[0]) ),	// 15
	~(( pil1[3] &  pil1[2] &  pil1[1]            ) ),	// 15-14
	~(( pil1[3] &  pil1[2] &  pil1[1]            ) |	
	  ( pil1[3] &  pil1[2] &              pil1[0]) ),	// 15-14,13
	~(( pil1[3] &  pil1[2]                        ) ),	// 15-12
	~(( pil1[3] &  pil1[2]                        ) |
	  ( pil1[3] &              pil1[1] &  pil1[0]) ),	// 15-12,11
	~(( pil1[3] &  pil1[2]                        ) |
	  ( pil1[3] &              pil1[1]            ) ),	// 15-12,11-10
	~(( pil1[3] &  pil1[2]                        ) |
	  ( pil1[3] &              pil1[1]            ) |
	  ( pil1[3] &                          pil1[0]) ),	// 15-12,11-10,9
	~(( pil1[3]                                    ) ),	// 15-8
	~(( pil1[3]                                    ) |
	  (             pil1[2] &  pil1[1] &  pil1[0]) ),	// 15-8,7
	~(( pil1[3]                                    ) |
	  (             pil1[2] &  pil1[1]            ) ),	// 15-8,7-6
	~(( pil1[3]                                    ) |
	  (             pil1[2] &  pil1[1]            ) |
	  (             pil1[2] &              pil1[0]) ),	// 15-8,7-6,5
	~(( pil1[3]                                    ) |
	  (             pil1[2]                        ) ),	// 15-8,7-4
	~(( pil1[3]                                    ) |
	  (             pil1[2]                        ) |
	  (                         pil1[1] &  pil1[0]) ),	// 15-8,7-4,3
	~(( pil1[3]                                    ) |
	  (             pil1[2]                        ) |
	  (                         pil1[1]            ) ),	// 15-8,7-4,3-2
	~(( pil1[3]                                    ) |
	  (             pil1[2]                        ) |
	  (                         pil1[1]            ) |
	  (                                     pil1[0]) )};	//15-8,7-4,3-2,1

assign pil0_mask[15:1] =
       {15 {~hpstate_hpriv[0] & pstate_ie[0] & ~trap_taken3[0]}} &
       {~(( pil0[3] &  pil0[2] &  pil0[1] &  pil0[0]) ),	// 15
	~(( pil0[3] &  pil0[2] &  pil0[1]            ) ),	// 15-14
	~(( pil0[3] &  pil0[2] &  pil0[1]            ) |	
	  ( pil0[3] &  pil0[2] &              pil0[0]) ),	// 15-14,13
	~(( pil0[3] &  pil0[2]                        ) ),	// 15-12
	~(( pil0[3] &  pil0[2]                        ) |
	  ( pil0[3] &              pil0[1] &  pil0[0]) ),	// 15-12,11
	~(( pil0[3] &  pil0[2]                        ) |
	  ( pil0[3] &              pil0[1]            ) ),	// 15-12,11-10
	~(( pil0[3] &  pil0[2]                        ) |
	  ( pil0[3] &              pil0[1]            ) |
	  ( pil0[3] &                          pil0[0]) ),	// 15-12,11-10,9
	~(( pil0[3]                                    ) ),	// 15-8
	~(( pil0[3]                                    ) |
	  (             pil0[2] &  pil0[1] &  pil0[0]) ),	// 15-8,7
	~(( pil0[3]                                    ) |
	  (             pil0[2] &  pil0[1]            ) ),	// 15-8,7-6
	~(( pil0[3]                                    ) |
	  (             pil0[2] &  pil0[1]            ) |
	  (             pil0[2] &              pil0[0]) ),	// 15-8,7-6,5
	~(( pil0[3]                                    ) |
	  (             pil0[2]                        ) ),	// 15-8,7-4
	~(( pil0[3]                                    ) |
	  (             pil0[2]                        ) |
	  (                         pil0[1] &  pil0[0]) ),	// 15-8,7-4,3
	~(( pil0[3]                                    ) |
	  (             pil0[2]                        ) |
	  (                         pil0[1]            ) ),	// 15-8,7-4,3-2
	~(( pil0[3]                                    ) |
	  (             pil0[2]                        ) |
	  (                         pil0[1]            ) |
	  (                                     pil0[0]) )};	//15-8,7-4,3-2,1

assign {pil3_mask[16], pil3_mask[0]} = 
       {pil3_mask[14], pil3_mask[14]};
assign {pil2_mask[16], pil2_mask[0]} = 
       {pil2_mask[14], pil2_mask[14]};
assign {pil1_mask[16], pil1_mask[0]} = 
       {pil1_mask[14], pil1_mask[14]};
assign {pil0_mask[16], pil0_mask[0]} = 
       {pil0_mask[14], pil0_mask[14]};

assign trl_pil_mask_15[3:0] =
       {pil3_mask[15], pil2_mask[15], pil1_mask[15], pil0_mask[15]};

assign pmu_trap_mask_d =
       (pil3_mask[15] &  fls_tid_d[1] &  fls_tid_d[0]) |
       (pil2_mask[15] &  fls_tid_d[1] & ~fls_tid_d[0]) |
       (pil1_mask[15] & ~fls_tid_d[1] &  fls_tid_d[0]) |
       (pil0_mask[15] & ~fls_tid_d[1] & ~fls_tid_d[0]) ;

tlu_trl_ctl_msff_ctl_macro__width_1 pmu_trap_mask_lat  (
	.scan_in(pmu_trap_mask_lat_scanin),
	.scan_out(pmu_trap_mask_lat_scanout),
	.din	(pmu_trap_mask_d		),
	.dout	(pmu_trap_mask_e		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_pmu_trap_mask_e = 
       pmu_trap_mask_e;  

assign sim3[15] =
       softint3[15]    & pil3_mask[15];
assign sim3[14] =
       (softint3[16] & pil3_mask[16]) | 
       (softint3[14] & pil3_mask[14]) | 
       (softint3[0] & pil3_mask[0]);
assign sim3[13:1] =
       softint3[13:1] & pil3_mask[13:1];

assign sim2[15] =
       softint2[15]    & pil2_mask[15];
assign sim2[14] =
       (softint2[16] & pil2_mask[16]) | 
       (softint2[14] & pil2_mask[14]) | 
       (softint2[0] & pil2_mask[0]);
assign sim2[13:1] =
       softint2[13:1] & pil2_mask[13:1];

assign sim1[15] =
       softint1[15]    & pil1_mask[15];
assign sim1[14] =
       (softint1[16] & pil1_mask[16]) | 
       (softint1[14] & pil1_mask[14]) | 
       (softint1[0] & pil1_mask[0]);
assign sim1[13:1] =
       softint1[13:1] & pil1_mask[13:1];

assign sim0[15] =
       softint0[15]    & pil0_mask[15];
assign sim0[14] =
       (softint0[16] & pil0_mask[16]) | 
       (softint0[14] & pil0_mask[14]) | 
       (softint0[0] & pil0_mask[0]);
assign sim0[13:1] =
       softint0[13:1] & pil0_mask[13:1];

assign trl_iln_exc[3:0] =
       {(| sim3[15:1]), (| sim2[15:1]), (| sim1[15:1]), (| sim0[15:1])};

// Encode int level (leading one's detector)
assign int_level_n_3[3] =
       (| sim3[15:8]);

assign int_level_n_3[2] =
       (| sim3[15:12]) | 
       ((| sim3[7:4]) & ~(| sim3[11:8]));

assign int_level_n_3[1] = 
       (| sim3[15:14]) |
       ((| sim3[11:10]) & ~(| sim3[13:12])) |
       ((| sim3[7:6]) & ~(| {sim3[13:12], sim3[9:8]})) |
       ((| sim3[3:2]) & ~(| {sim3[13:12], sim3[9:8], sim3[5:4]}));

assign int_level_n_3[0] =
       sim3[15] |
       (sim3[13] & ~(  {sim3[14]})) |
       (sim3[11] & ~(| {sim3[14], sim3[12]})) |
       (sim3[9] & ~(| {sim3[14], sim3[12], sim3[10]})) |
       (sim3[7] & ~(| {sim3[14], sim3[12], sim3[10], sim3[8]})) |
       (sim3[5] & ~(| {sim3[14], sim3[12], sim3[10], sim3[8], sim3[6]})) |
       (sim3[3] & ~(| {sim3[14], sim3[12], sim3[10], sim3[8], sim3[6], 
			sim3[4]})) |
       (sim3[1] & ~(| {sim3[14], sim3[12], sim3[10], sim3[8], sim3[6], 
			sim3[4], sim3[2]}));

assign int_level_n_2[3] =
       (| sim2[15:8]);

assign int_level_n_2[2] =
       (| sim2[15:12]) | 
       ((| sim2[7:4]) & ~(| sim2[11:8]));

assign int_level_n_2[1] = 
       (| sim2[15:14]) |
       ((| sim2[11:10]) & ~(| sim2[13:12])) |
       ((| sim2[7:6]) & ~(| {sim2[13:12], sim2[9:8]})) |
       ((| sim2[3:2]) & ~(| {sim2[13:12], sim2[9:8], sim2[5:4]}));

assign int_level_n_2[0] =
       sim2[15] |
       (sim2[13] & ~(  {sim2[14]})) |
       (sim2[11] & ~(| {sim2[14], sim2[12]})) |
       (sim2[9] & ~(| {sim2[14], sim2[12], sim2[10]})) |
       (sim2[7] & ~(| {sim2[14], sim2[12], sim2[10], sim2[8]})) |
       (sim2[5] & ~(| {sim2[14], sim2[12], sim2[10], sim2[8], sim2[6]})) |
       (sim2[3] & ~(| {sim2[14], sim2[12], sim2[10], sim2[8], sim2[6], 
			sim2[4]})) |
       (sim2[1] & ~(| {sim2[14], sim2[12], sim2[10], sim2[8], sim2[6], 
			sim2[4], sim2[2]}));

assign int_level_n_1[3] =
       (| sim1[15:8]);

assign int_level_n_1[2] =
       (| sim1[15:12]) | 
       ((| sim1[7:4]) & ~(| sim1[11:8]));

assign int_level_n_1[1] = 
       (| sim1[15:14]) |
       ((| sim1[11:10]) & ~(| sim1[13:12])) |
       ((| sim1[7:6]) & ~(| {sim1[13:12], sim1[9:8]})) |
       ((| sim1[3:2]) & ~(| {sim1[13:12], sim1[9:8], sim1[5:4]}));

assign int_level_n_1[0] =
       sim1[15] |
       (sim1[13] & ~(  {sim1[14]})) |
       (sim1[11] & ~(| {sim1[14], sim1[12]})) |
       (sim1[9] & ~(| {sim1[14], sim1[12], sim1[10]})) |
       (sim1[7] & ~(| {sim1[14], sim1[12], sim1[10], sim1[8]})) |
       (sim1[5] & ~(| {sim1[14], sim1[12], sim1[10], sim1[8], sim1[6]})) |
       (sim1[3] & ~(| {sim1[14], sim1[12], sim1[10], sim1[8], sim1[6], 
			sim1[4]})) |
       (sim1[1] & ~(| {sim1[14], sim1[12], sim1[10], sim1[8], sim1[6], 
			sim1[4], sim1[2]}));

assign int_level_n_0[3] =
       (| sim0[15:8]);

assign int_level_n_0[2] =
       (| sim0[15:12]) | 
       ((| sim0[7:4]) & ~(| sim0[11:8]));

assign int_level_n_0[1] = 
       (| sim0[15:14]) |
       ((| sim0[11:10]) & ~(| sim0[13:12])) |
       ((| sim0[7:6]) & ~(| {sim0[13:12], sim0[9:8]})) |
       ((| sim0[3:2]) & ~(| {sim0[13:12], sim0[9:8], sim0[5:4]}));

assign int_level_n_0[0] =
       sim0[15] |
       (sim0[13] & ~(  {sim0[14]})) |
       (sim0[11] & ~(| {sim0[14], sim0[12]})) |
       (sim0[9] & ~(| {sim0[14], sim0[12], sim0[10]})) |
       (sim0[7] & ~(| {sim0[14], sim0[12], sim0[10], sim0[8]})) |
       (sim0[5] & ~(| {sim0[14], sim0[12], sim0[10], sim0[8], sim0[6]})) |
       (sim0[3] & ~(| {sim0[14], sim0[12], sim0[10], sim0[8], sim0[6], 
			sim0[4]})) |
       (sim0[1] & ~(| {sim0[14], sim0[12], sim0[10], sim0[8], sim0[6], 
			sim0[4], sim0[2]}));



assign int_level_n[3:0] =
       ({4 {real_trap[3]}} & int_level_n_3_last[3:0]) |
       ({4 {real_trap[2]}} & int_level_n_2_last[3:0]) |
       ({4 {real_trap[1]}} & int_level_n_1_last[3:0]) |
       ({4 {real_trap[0]}} & int_level_n_0_last[3:0]) ;

tlu_trl_ctl_msff_ctl_macro__width_16 int_level_n_lat  (
	.scan_in(int_level_n_lat_scanin),
	.scan_out(int_level_n_lat_scanout),
	.din	({int_level_n_3		[3:0],
		  int_level_n_2		[3:0],
		  int_level_n_1		[3:0],
		  int_level_n_0		[3:0]}),
	.dout	({int_level_n_3_last	[3:0],
		  int_level_n_2_last	[3:0],
		  int_level_n_1_last	[3:0],
		  int_level_n_0_last	[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// HINTP

// HSTICK_CMPR
assign hstick3_compare =
       (tic_compare[4:3] == 2'b10) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b11) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[3]);
assign hintp3_in =
        ( asi_wr_hintp[3] & asi_wr_data[0]) | 
	(~asi_wr_hintp[3] & hintp3         ) |
        (                    hstick3_compare) ;

// HSTICK_CMPR
assign hstick2_compare =
       (tic_compare[4:3] == 2'b10) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b10) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[2]);
assign hintp2_in =
        ( asi_wr_hintp[2] & asi_wr_data[0]) | 
	(~asi_wr_hintp[2] & hintp2         ) |
        (                    hstick2_compare) ;

// HSTICK_CMPR
assign hstick1_compare =
       (tic_compare[4:3] == 2'b10) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b01) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[1]);
assign hintp1_in =
        ( asi_wr_hintp[1] & asi_wr_data[0]) | 
	(~asi_wr_hintp[1] & hintp1         ) |
        (                    hstick1_compare) ;

// HSTICK_CMPR
assign hstick0_compare =
       (tic_compare[4:3] == 2'b10) & (tic_compare[2]) &
       (tic_compare[1:0] == 2'b00) &
       ((~cel_tccd & ~cel_tcud) | ~tlu_ceter_de[0]);
assign hintp0_in =
        ( asi_wr_hintp[0] & asi_wr_data[0]) | 
	(~asi_wr_hintp[0] & hintp0         ) |
        (                    hstick0_compare) ;

tlu_trl_ctl_msff_ctl_macro__width_4 hintp_lat  ( 
	.scan_in(hintp_lat_wmr_scanin),
	.scan_out(hintp_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	({hintp3_in,
		  hintp2_in,
		  hintp1_in,
		  hintp0_in	}),
	.dout	({hintp3,
		  hintp2,
		  hintp1,
		  hintp0	}),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign trl_hstick_match[3:0] =
       {hintp3, hintp2, hintp1, hintp0} &
       (~hpstate_hpriv[3:0] | pstate_ie[3:0]) &
       ~hst_req[3:0];

assign trl_unhalt_[3:0] = 
       ~({hintp3, hintp2, hintp1, hintp0} |
         {softint3[16], softint2[16], softint1[16], softint0[16]} | 
         {softint3[0], softint2[0], softint1[0], softint0[0]} );



////////////////////////////////////////////////////////////////////////////////
// TCA (Tick Compare register Array) ECC disrupting exception detection

assign tccd_in[3] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b11) &
       cel_tccd;
assign tccd_in[2] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b10) &
       cel_tccd;
assign tccd_in[1] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b01) &
       cel_tccd;
assign tccd_in[0] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b00) &
       cel_tccd;

assign tcud_in[3] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b11) &
       cel_tcud;
assign tcud_in[2] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b10) &
       cel_tcud;
assign tcud_in[1] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b01) &
       cel_tcud;
assign tcud_in[0] = 
       (tic_compare[5]) &
       (tic_compare[1:0] == 2'b00) &
       cel_tcud;

tlu_trl_ctl_msff_ctl_macro__width_4 tccd_exc_lat  (
	.scan_in(tccd_exc_lat_scanin),
	.scan_out(tccd_exc_lat_scanout),
	.din	(tccd_in	[3:0]	),
	.dout	(tccd		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_4 tcud_exc_lat  (
	.scan_in(tcud_exc_lat_scanin),
	.scan_out(tcud_exc_lat_scanout),
	.din	(tcud_in	[3:0]	),
	.dout	(tcud		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_tccd[3:0] =
       tccd[3:0];

assign tlu_tcud[3:0] =
       tcud[3:0];

tlu_trl_ctl_msff_ctl_macro__width_2 tic_index_lat  (
	.scan_in(tic_index_lat_scanin),
	.scan_out(tic_index_lat_scanout),
	.din	(tic_compare	[4:3]	),
	.dout	(tic_index	[4:3]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_tca_index[1:0] =
       tic_index[4:3];



////////////////////////////////////////////////////////////////////////////////
// TSA done/retry ECC precise exception detection

assign trl_tsacu_en_in[3:0] = 
       tsacu_en_in[3:0];

assign tpe_exc_in[3:0] = 
       tel_tsacu_exc[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 tpe_exc_lat  (
	.scan_in(tpe_exc_lat_scanin),
	.scan_out(tpe_exc_lat_scanout),
	.din	(tpe_exc_in	[3:0]	),
	.dout	(tpe_exc	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_trl_ctl_msff_ctl_macro__width_3 tsa_index_lat  (
	.scan_in(tsa_index_lat_scanin),
	.scan_out(tsa_index_lat_scanout),
	.din	(rmw_addr	[2:0]	),
	.dout	(tsa_index	[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_tsa_index[2:0] =
       tsa_index[2:0];



////////////////////////////////////////////////////////////////////////////////
// ASI read and writes

tlu_trl_ctl_msff_ctl_macro__width_4 p_trap_lat  (
	.scan_in(p_trap_lat_scanin),
	.scan_out(p_trap_lat_scanout),
	.din	(pmu_tlu_trap_m	[3:0]	),
	.dout	(p_trap		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_softint3[16:0] =
       softint3[16:0] | {1'b0, p_trap[3], {15 {1'b0}}};
assign rd_softint2[16:0] =	      
       softint2[16:0] | {1'b0, p_trap[2], {15 {1'b0}}};
assign rd_softint1[16:0] =	      
       softint1[16:0] | {1'b0, p_trap[1], {15 {1'b0}}};
assign rd_softint0[16:0] =	      
       softint0[16:0] | {1'b0, p_trap[0], {15 {1'b0}}};

assign asi_data_in[16:0] =
       ({17 {asi_rd_tl		[3]}} & {14'h0000, tl3		[2:0]}) |
       ({17 {asi_rd_tl		[2]}} & {14'h0000, tl2		[2:0]}) |
       ({17 {asi_rd_tl		[1]}} & {14'h0000, tl1		[2:0]}) |
       ({17 {asi_rd_tl		[0]}} & {14'h0000, tl0		[2:0]}) |
       ({17 {asi_rd_pil		[3]}} & {13'h0000, pil3	[3:0]}) |
       ({17 {asi_rd_pil		[2]}} & {13'h0000, pil2	[3:0]}) |
       ({17 {asi_rd_pil		[1]}} & {13'h0000, pil1	[3:0]}) |
       ({17 {asi_rd_pil		[0]}} & {13'h0000, pil0	[3:0]}) |
       ({17 {asi_rd_gl		[3]}} & {15'h0000, gl3		[1:0]}) |
       ({17 {asi_rd_gl		[2]}} & {15'h0000, gl2		[1:0]}) |
       ({17 {asi_rd_gl		[1]}} & {15'h0000, gl1		[1:0]}) |
       ({17 {asi_rd_gl		[0]}} & {15'h0000, gl0		[1:0]}) |
       ({17 {asi_rd_softint	[3]}} & {rd_softint3		[16:0]}) |
       ({17 {asi_rd_softint	[2]}} & {rd_softint2		[16:0]}) |
       ({17 {asi_rd_softint	[1]}} & {rd_softint1		[16:0]}) |
       ({17 {asi_rd_softint	[0]}} & {rd_softint0		[16:0]}) |
       ({17 {asi_rd_hintp	[3]}} & {16'h0000, hintp3	       }) |
       ({17 {asi_rd_hintp	[2]}} & {16'h0000, hintp2	       }) |
       ({17 {asi_rd_hintp	[1]}} & {16'h0000, hintp1	       }) |
       ({17 {asi_rd_hintp	[0]}} & {16'h0000, hintp0	       }) ;

tlu_trl_ctl_msff_ctl_macro__width_17 asi_data_lat  (
	.scan_in(asi_data_lat_scanin),
	.scan_out(asi_data_lat_scanout),
	.din	(asi_data_in		[16:0]	),
	.dout	(asi_data		[16:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_asi_data[16:0] =
	asi_data[16:0];




////////////////////////////////////////////////////////////////////////////////
// Wait for store buffer empty if entering RED state

assign enter_red_in[3:0] = 
       {(tl3[2:0] == maxtl_minus_one[2:0]) &  hpstate_hpriv[3], 
        (tl2[2:0] == maxtl_minus_one[2:0]) &  hpstate_hpriv[2], 
        (tl1[2:0] == maxtl_minus_one[2:0]) &  hpstate_hpriv[1], 
        (tl0[2:0] == maxtl_minus_one[2:0]) &  hpstate_hpriv[0]}; 
						    
tlu_trl_ctl_msff_ctl_macro__width_4 enter_red_lat  (
	  .scan_in(enter_red_lat_scanin),
	  .scan_out(enter_red_lat_scanout),
	  .din	(enter_red_in		[3:0]	),
	  .dout	(enter_red		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stb_wait[3:0] = 
       enter_red[3:0] & ~stb_empty[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 stb_empty_lat  (
	.scan_in(stb_empty_lat_scanin),
	.scan_out(stb_empty_lat_scanout),
	.din	(lsu_stb_empty	[3:0]	),
	.dout	(stb_empty	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Block dispatch for done and retry
//	First, block from cycle of flush until done/retry wins arbitration
//	Second, block on cycle of redirect
// IRF only does single pass for CWP change, so don't need 
// second block
//  Cycle diagram ( TR - trap redirect  TF - trap flush   CU - TLU-EXU CWP msg
//                  RM - RML decode     RT - RML to IRF   ID - IRF decode
//                  IS - IRF save       IR - IRF restore  EC - EXU CWP update
//                  WB - TLU window block
//                  EB - EXU window block
// 	  	    t - trlX.trap[] signal  r - read TSA   c - check ECC
//		    p - generate redirect PC
//	(Redirect takes at least two cycles because must arbitrate in first 
//	 cycle and then read TSA in second cycle)
//	(IRF requires 0 to NOT be a read or write for this thread)
// TR |           t r c p X                
// BF |                     N
//  F |                       N
//  C |                         N
//  P |                           N
//  D | D           H H     H       N
//  E |   D           H H     H     .
//  M |     D           H H     H   .
//  B |       D           H H     H .
// TF |         X           |     | .
// CU |           t r c X   |     | .
// RT |                   X |     | .
// ID |                     X X   | .  
// IS |                       X   | .
// IR |                         X 0 .
// EC |                       X
// WB |           X X     X 
//
//	Instruction N reads operands from new window, so swap must be
//	complete before it reaches D

assign window_block_in =
       (| pdon_req_in[3:0]) | (| pret_req_in[3:0]) | 
       ccr_cwp_valid;

tlu_trl_ctl_msff_ctl_macro__width_1 window_block_lat  (
	.scan_in(window_block_lat_scanin),
	.scan_out(window_block_lat_scanout),
	.din	(window_block_in	),
	.dout	(tlu_window_block	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



////////////////////////////////////////////////////////////////////////////////
// Block done and retry when EXU needs hole for CWP change or when earlier
// done or retry needs hole for CWP change
// EB |   X
//  P |   H          
//  D |     H        
//  E |       H      
//  M |         H    
//  B |           H  
// TF |           |  
// CU | t r c X   |  
// RT |         X |  
// ID |           0
//
// So window_block doesn't happen until the trap_taken cycle

assign hole_in_p = 
       exu_tlu_window_block;

assign stall_don_ret = don_ret_last_last;



////////////////////////////////////////////////////////////////////////////////
// Assign outputs

tlu_trl_ctl_msff_ctl_macro__width_11 take_lat  (
	.scan_in(take_lat_scanin),
	.scan_out(take_lat_scanout),
	.din	({take_por,
		  take_htd,
		  take_lsr,
		  take_fpe,
		  take_don,
		  take_ret,
		  take_res,
		  take_ssr,
		  take_ssr_por,
		  take_icp,
		  take_nns		       }),
	.dout	({take_por_last,
		  take_htd_last,
		  take_lsr_last,
		  take_fpe_last,
		  ptake_don_last,
		  ptake_ret_last,
		  take_res_last,
		  take_ssr_last,
		  take_ssr_por_last,
		  take_icp_last,
		  take_nns_last		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_don_last =
       ptake_don_last & ~hole_in_p;

assign take_ret_last =
       ptake_ret_last & ~hole_in_p;

assign take_htd_icp_last =
	take_htd_last | take_icp_last;

tlu_trl_ctl_msff_ctl_macro__width_5 take_last_lat  (
	.scan_in(take_last_lat_scanin),
	.scan_out(take_last_lat_scanout),
	.din	({take_htd_icp_last,
		  take_don_last,
		  don_ret_last,
		  take_don_last_last,
		  don_ret_last_last	       }),
	.dout	({take_htd_icp_last_last,
		  take_don_last_last,
		  don_ret_last_last,
		  take_don_last_last_last,
		  don_ret_last_last_last       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign take_lsr_nns_last =
       take_lsr_last | take_nns_last;

tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 thread_sel_lat   (
	.scan_in(thread_sel_lat_scanin),
	.scan_out(thread_sel_lat_scanout),
	.l1clk	({l1clk_pm4		       ,
		  l1clk_pm3		       ,
		  l1clk_pm2		       ,
		  l1clk_pm1		       }),
	.din	(real_trap		[3:0]	),
	.dout	(real_trap_last		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign thread_sel[3:0] =
       real_trap_last[3:0];

assign trl_thread_sel[3:0] =
       thread_sel[3:0];

assign suppress_don_ret_taken_ =
       ~hole_in_p | ~(ptake_don_last | ptake_ret_last);

assign no_pstate_update =
       take_lsr_last | take_fpe_last | 
       take_itw_last | take_htd_last | take_res_last | 
       take_ssr_last | take_nns_last | take_icp_last |
       ptake_don_last | ptake_ret_last;

assign trl_pstate_thread_sel[4:0] =
       {no_pstate_update | ~(| trap_taken3[3:0]),
        {4 {~no_pstate_update}} & trap_taken3[3:0]};

// Create select for TBA / HTBA muxing
// Bits 1:0 are the TID
// Bit 2 is the HTBA select (indicates trap goes to or stays in HPRIV)

assign trl_tba_sel[2] =
       (| (thread_sel[3:0] & hpstate_hpriv[3:0])) |
       other_trap | reset_trap;

assign trl_tba_sel[1] =
       thread_sel[3] | thread_sel[2];			

assign trl_tba_sel[0] =
       thread_sel[3] | thread_sel[1];			

assign trl_pstate_en =
       ((| trap_taken3[3:0]) & suppress_don_ret_taken_ & ~no_pstate_update) |
       asi_trl_pstate_en |
       (| npc_sel_tnpc[3:0]);

// PC and NPC are masked by PSTATE.am before going to TSA
tlu_trl_ctl_msff_ctl_macro__width_4 pstate_am_lat  (
	.scan_in(pstate_am_lat_scanin),
	.scan_out(pstate_am_lat_scanout),
	.din	(tsd_pstate_am		[3:0]	),
	.dout	(pstate_am		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign trl_pc_thread_sel[3:0] =
       trap_taken4[3:0];

assign trl_pc_pstate_am_ =
       ~(| (trap_taken4[3:0] & pstate_am[3:0]));

assign take_ssr_pc_valid =
       take_ssr & (| (trap[3:0] &  fls_pc_valid[3:0]));
assign take_ssr_pc_invalid =
       take_ssr & (| (trap[3:0] & ~fls_pc_valid[3:0]));

assign pc_sel_pc_in =			    
       take_htd | take_res | take_ssr_pc_invalid | take_nns | take_icp;

assign pc_sel_npc_in = 
       take_lsr | take_fpe | take_ssr_pc_valid;

assign pc_sel_trap_in = 
       ~take_htd & ~take_res & ~take_ssr & ~take_nns & ~take_icp & 
       ~take_don_last & 
       ~take_ret_last & ~take_reset & ~take_lsr & ~take_fpe & ~take_itw &
       (| (trap_ndr[3:0] & ~dbz_incoming[3:0] & 
           ~fei_or_fof_incoming[3:0])) & 
       ~take_don & ~take_ret & 
       ~(next_trap_to_red | next_trap_to_err); 

assign pc_sel_reset0_in = 
       ~take_htd & ~take_res & ~take_ssr & ~take_nns & ~take_icp & 
       ~take_don_last & ~take_ret_last & take_reset;
assign pc_sel_reset1_in = 
       next_trap_to_red | next_trap_to_err; 

assign pc_done_in = 
       take_don_last;

assign pc_retry_in = 
       take_ret_last;

assign pc_tte_in =
       take_itw | take_itw_last;

tlu_trl_ctl_msff_ctl_macro__width_8 pc_npc_sel_lat  (
	.scan_in(pc_npc_sel_lat_scanin),
	.scan_out(pc_npc_sel_lat_scanout),
	.din	({pc_sel_pc_in,
		  pc_sel_npc_in,
		  pc_sel_trap_in,
		  pc_sel_reset0_in,
		  pc_sel_reset1_in,
		  pc_done_in,
		  pc_retry_in,
		  pc_tte_in		       }),
	.dout	({pc_sel_pc,
		  pc_sel_npc,
		  pc_sel_trap,
		  pc_sel_reset0,
		  pc_sel_reset1,
		  pc_done,
		  pc_retry,
		  pc_tte		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_pct_trap_pc_en =
       pc_sel_pc | pc_sel_npc | pc_sel_trap | pc_sel_reset0 | pc_sel_reset1 |
       pc_done | pc_retry | pc_tte;

assign trl_pc_sel_pc =
       pc_sel_pc;

assign trl_pc_sel_npc =
       pc_sel_npc;

assign trl_pc_done =
       pc_done;

assign trl_pc_retry =
       pc_retry;

assign trl_pc_tte =
       pc_tte;

assign trl_pc_sel_trap =
       pc_sel_trap & (| trap_taken4[3:0]);

assign trl_pc_sel_reset =
       pc_sel_reset0 | (pc_sel_reset1 & (| trap_taken4[3:0]));

assign wr_en_in_in =
       (take_reset | take_disrupt | take_div | take_long | take_fgu | 
	take_other) & ~take_htd;
assign wr_en_func_in =
       wr_en_in_p | rmw_tsa;
assign wr_en_in = 
       (wr_en_func_in & ~mbist_run) | asi_mbist_tsa_wr_en;

assign rd_en_in = 
	((take_don_ret | asi_preempt_done_retry) & ~mbist_run) | 
	asi_mbist_tsa_rd_en;

tlu_trl_ctl_msff_ctl_macro__width_4 stack_lat  (
	.scan_in(stack_lat_scanin),
	.scan_out(stack_lat_scanout),
	.din	({wr_en_in_in,
		  wr_en_in,
		  rd_en_in,
		  tsa_rd_en	       }),
	.dout	({wr_en_in_p,
		  tsa_wr_en,
		  tsa_rd_en,
		  tsa_rd_en_last       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_tsa_wr_en = 
       tsa_wr_en;
assign trl_tsa_rd_en = 
       rd_en_in;

assign trl_save_tsa = 
       (| check_tsa_ecc_in[3:0]);

assign trl_tsd_tsa_en =
       tsa_rd_en;

assign trl_tsd_tsa_wd_en =
       tsa_rd_en_last | wr_en_in;

assign don_ret_last = 
       take_don_last | take_ret_last;

assign enable_tel_in =
       (| (trap[3:0] & tlu_ceter_pscce[3:0])) | lsu_tlu_pmen;

tlu_trl_ctl_msff_ctl_macro__width_3 check_tel_lat  (
	.scan_in(check_tel_lat_scanin),
	.scan_out(check_tel_lat_scanout),
	.din	({enable_tel_in		       ,
		  enable_tel		       ,
		  check_tel_in		       }),
	.dout	({enable_tel		       ,
		  check_tel_in		       ,
		  check_tel		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_tel_en =
       enable_tel | check_tel_in | check_tel;

assign take_notrap_not_suppressed =
       take_notrap & 
       ~(| (notrap_pre_trap[3:0] & 
	    (dbz_incoming[3:0] | fei_or_fof_incoming[3:0])));

assign m107773_suppress_notrap_ = 
       ~(take_notrap &  
         (| (notrap_pre_trap[3:0] & 
             (fls_ipe_request[3:0] | fls_pra_request[3:0]))));

assign trap_pc_valid_in_in = 
       (take_reset | take_disrupt | take_div | take_long | take_fgu | 
        take_other | take_notrap_not_suppressed) & m107773_suppress_notrap_;

assign trap_pc_valid_in =
       (ccr_cwp_valid | ptrap_pc_valid_in) & ~kill_fpe & ~kill_lsr_nns;

// If floating point predicted exception is "just ahead of" actual exception,
// kill FPE redirect
assign kill_fpe = 
       take_fpe_last & 
       (| ((fls_fei_request[3:0] | 
	    fls_fof_request[3:0]) & trap_taken4[3:0]));

// If LSR is "just ahead of" actual long-latency exception, kill LSR redirect
assign kill_lsr_nns = 
       take_lsr_nns_last & 
       (| ((fls_eer_request[3:0] | 
	    fls_ftt_request[3:0] | fls_ipe_request[3:0] | 
	    fls_fof_request[3:0] | 
	    fls_dbz_request[3:0] | 
	    fls_dae_request[3:0] |
	    fls_ime_request[3:0] | fls_dme_request[3:0] ) & 
	   trap_taken4[3:0]));

//  Also need to suppress LSR "just ahead of" ipe or pra
assign m107773_suppress_pcvi = 
       take_lsr_nns_last & 
         (| (trap_taken4[3:0] & 
             (fls_ipe_request[3:0] | fls_pra_request[3:0])));

assign real_trap_pc_valid_in =
       trap_pc_valid_in & ~m107773_suppress_pcvi;

assign npc_is_nonseq =
       | (trap_ndr[3:0] & pct_npc_is_nonseq[3:0]);

assign htd_res_icp_when_npc_nonseq =
       (take_htd | take_res | take_icp) & npc_is_nonseq;

tlu_trl_ctl_msff_ctl_macro__width_1 htd_res_icp_when_npc_nonseq_last_lat  (
	.scan_in(htd_res_icp_when_npc_nonseq_last_lat_scanin),
	.scan_out(htd_res_icp_when_npc_nonseq_last_lat_scanout),
	.din	(htd_res_icp_when_npc_nonseq	),
	.dout	(htd_res_icp_when_npc_nonseq_last	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign retry_in_in = 
       nns_exc | take_nns | take_ssr | take_ssr_por | 
       htd_res_icp_when_npc_nonseq;

assign retry_in =
       (pretry_in & ~(| {tel_tsacu_exc[3:0]})) | 
       (trap_pc_valid_in & (tcu_ss_mode | tcu_do_mode));

// Create single step complete exception (similar to idle) on single step
assign trl_ssc_exc[3:0] =
       trap_taken4[3:0] & {4 {take_ssr_last | take_ssr_por_last}};

tlu_trl_ctl_msff_ctl_macro__width_4 pc_valid_lat  (
	.scan_in(pc_valid_lat_scanin),
	.scan_out(pc_valid_lat_scanout),
	.din	({trap_pc_valid_in_in	       ,
		  real_trap_pc_valid_in	       ,
		  retry_in_in		       ,
		  retry_in		       }),
	.dout	({ptrap_pc_valid_in	       ,
		  trap_pc_valid		       ,
		  pretry_in		       ,
		  tlu_retry		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_trap_pc_valid =
       trap_pc_valid;

assign trap_tid_in[1:0] =
        ({2 { don_ret_last_last_last}} & ccr_cwp_asi_tid[1:0]) |
	({2 {~don_ret_last_last_last}} & wr_addr_in	[4:3]) ;

tlu_trl_ctl_msff_ctl_macro__width_2 trap_tid_lat  (
	.scan_in(trap_tid_lat_scanin),
	.scan_out(trap_tid_lat_scanout),
	.din	(trap_tid_in		[1:0]	),
	.dout	(trap_tid		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_trap_tid[1:0] = 
       trap_tid[1:0];

tlu_trl_ctl_msff_ctl_macro__width_2 take_itw_last_lat  (
	.scan_in(take_itw_last_lat_scanin),
	.scan_out(take_itw_last_lat_scanout),
	.din	({take_itw		       ,
		  take_itw_last		       }),
	.dout	({take_itw_last		       ,
		  take_itw_last_last	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_itlb_reload = 
       take_itw_last_last;

tlu_trl_ctl_msff_ctl_macro__width_1 icache_perr_lat  (
	.scan_in(icache_perr_lat_scanin),
	.scan_out(icache_perr_lat_scanout),
	.din	(take_icp_last		       	),
	.dout	(take_icp_last_last	       	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_ifu_invalidate =
	take_icp_last_last;

assign reset_trap_in = 
	next_trap_to_red | next_trap_to_err | take_por | take_xir | take_sir;

assign in_red =
       | (tsd_hpstate_red[3:0] & real_trap[3:0]);

assign next_trap_to_red = 
       (((trap_tl[2:0] == maxtl_minus_one[2:0]) & (| real_trap[3:0])) |
	 in_red) & ~take_por & ~next_trap_to_err;

assign next_trap_to_err = 
       (trap_tl[2:0] == maxtl[2:0]) &
       (| real_trap[3:0]) & ~take_por;

assign next_trap_to_hpriv =
       (trap_tl[2:0] >= maxptl[2:0]) & 
       (trap_tl[2:0] < maxtl_minus_one[2:0]) &  // avoid red, err
       ~take_por & ~take_xir & ~take_sir & ~hpriv & ~in_red;

assign hpriv = 
       (| (real_trap[3:0] & hpstate_hpriv[3:0]));

assign hpriv_last = 
       (| (real_trap_last[3:0] & hpstate_hpriv[3:0]));

assign next_trap_in_hpriv =
       hpriv;

assign sip = 
       take_fpd | take_fgu | take_tof | take_clw | take_div | 
       take_snn | take_sno | take_fnn | take_fno | take_pro | take_iln |
       take_pmu | take_mqr | take_dqr | take_rqr | 
       take_tcc_nh |
       take_tct ;

assign stay_in_priv_in =
       sip & ~next_trap_to_red & ~next_trap_to_err & ~next_trap_to_hpriv & 
       ~next_trap_in_hpriv;

assign take_tcc_nh = 
       take_tcc & ~tcc_number[7];

assign take_tcc_h = 
       take_tcc &  tcc_number[7];

assign pre_oti = 
       take_itm | take_ipv | take_inp | take_iua | take_iar | take_irr |
       take_mar | take_mrr |
       take_ade | take_ivt | take_hst | take_sma | 
       take_cwq | take_iae | take_ipe | take_ill | take_ldf | take_stf | 
       take_dap | take_maa | take_pra | take_dia | 
       take_ups | take_dpv | take_dnc |
       take_dnf | take_dso | take_paw | 
       take_dae | take_dtm | take_irt | take_drt | 
       take_tlz | take_him | take_hdm | take_tcc_h | 
       take_ftt | take_eer | take_ime | take_dme |
       take_iit | take_dit | take_ibp |
       take_vaw | take_iaw ;

assign oti = 
       (pre_oti & ~next_trap_to_red & ~next_trap_to_err) | 
       (next_trap_to_hpriv & ~next_trap_to_red & ~next_trap_to_err) | 
       (sip & next_trap_in_hpriv & ~next_trap_to_red & ~next_trap_to_err);

assign other_trap_in =
       oti;

tlu_trl_ctl_msff_ctl_macro__width_3 pstate_sel_lat  (
	.scan_in(pstate_sel_lat_scanin),
	.scan_out(pstate_sel_lat_scanout),
	.din	({reset_trap_in,
		  stay_in_priv_in,
		  other_trap_in		       }),
	.dout	({reset_trap,
		  stay_in_priv,
		  other_trap		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_reset_trap =
       reset_trap;

assign trl_stay_in_priv =
       stay_in_priv;

assign trl_other_trap =
       other_trap;


assign ccr_cwp_valid =
       don_ret_last_last_last & (~(| tel_tsacu_exc[3:0]) | ~check_tel);
 
assign ccr_cwp_valid_per_thread[3:0] =
       {4 {don_ret_last_last_last}} & 
       (~tel_tsacu_exc[3:0] | {4 {~check_tel}});
 
assign tlu_ccr_cwp_valid = 
       ccr_cwp_valid;
assign tlu_asi_valid = 
       ccr_cwp_valid;

assign ccr_cwp_asi_tid_in_in[1:0] =
       {trap_taken[3] | trap_taken[2], 
        trap_taken[3] | trap_taken[1]};

tlu_trl_ctl_msff_ctl_macro__width_4 ccr_cwp_asi_tid_lat  (
	.scan_in(ccr_cwp_asi_tid_lat_scanin),
	.scan_out(ccr_cwp_asi_tid_lat_scanout),
	.din	({ccr_cwp_asi_tid_in_in	[1:0],
		  ccr_cwp_asi_tid_in	[1:0]}),
	.dout	({ccr_cwp_asi_tid_in	[1:0],
		  ccr_cwp_asi_tid	[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_ccr_cwp_tid = 
       ccr_cwp_asi_tid[1:0];
assign tlu_asi_tid[1:0] = 
       ccr_cwp_asi_tid[1:0];

assign trl_asireg_sel[4:0] =
       {~ccr_cwp_valid, 
        ccr_cwp_valid_per_thread[3:0] & 
        { ccr_cwp_asi_tid[1] &  ccr_cwp_asi_tid[0],  
	  ccr_cwp_asi_tid[1] & ~ccr_cwp_asi_tid[0],  
 	 ~ccr_cwp_asi_tid[1] &  ccr_cwp_asi_tid[0],  
	 ~ccr_cwp_asi_tid[1] & ~ccr_cwp_asi_tid[0]}};

assign trl_asireg_en =
       (| asi_wr_asireg[3:0]) | ccr_cwp_valid;



assign tlu_release_tte[3:0] = 
       {4 {take_itw_last}} & trap_taken4[3:0];



//////////////////////////////////////////////////////////////////////
//
// Have to clear lsu_control_reg on any trap that sets HPSTATE.red
//

assign clear_ctl_reg_in[3:0] = 
       {4 {reset_trap}} & trap_taken4[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 clear_ctl_reg_lat  (
	.scan_in(clear_ctl_reg_lat_scanin),
	.scan_out(clear_ctl_reg_lat_scanout),
	.din	(clear_ctl_reg_in	[3:0]	),
	.dout	(clear_ctl_reg		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_lsu_clear_ctl_reg_[3:0] =
       ~clear_ctl_reg[3:0];


//////////////////////////////////////////////////////////////////////
//
// Determine when retry PC, NPC are nonsequential
//


assign pnpc_nonseq_in[3:0] =
       {4 {tsa_tnpc_nonseq & take_ret_last & suppress_don_ret_taken_}} & 
       trap_taken[3:0];

assign npc_nonseq_in[3:0] =
       pnpc_nonseq_in[3:0] | 
       ({4 {htd_res_icp_when_npc_nonseq_last}} & trap_taken[3:0]);

assign nns_exc_in =
       | pnpc_nonseq_in[3:0];

tlu_trl_ctl_msff_ctl_macro__width_5 npc_nonseq_lat  (
	.scan_in(npc_nonseq_lat_scanin),
	.scan_out(npc_nonseq_lat_scanout),
	.din	({npc_nonseq_in		[3:0],
		  nns_exc_in		       }),
	.dout	({npc_nonseq		[3:0],
		  nns_exc		       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_nns_exc[3:0] =
       npc_nonseq[3:0];



////////////////////////////////////////////////////////////////////////////////
//
//  Control load of PC, NPC (on trap, retry, done)
//

assign trap_tid_in_dec[3:0] =
       { trap_tid_in[1] &  trap_tid_in[0],
         trap_tid_in[1] & ~trap_tid_in[0],
        ~trap_tid_in[1] &  trap_tid_in[0],
        ~trap_tid_in[1] & ~trap_tid_in[0]};

// On return from hardware tablewalk, PC and NPC are already correct,
// just need to invalidate them
assign pc_sel_trap_pc_in[3:0] =
       {4 {trap_pc_valid_in & ~take_lsr_last & 
	   ~take_htd_last & ~take_fpe_last & ~take_nns_last & 
	   ~take_icp_last}} & 
       trap_tid_in_dec[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 pc_sel_trap_pc_lat  (
	.scan_in(pc_sel_trap_pc_lat_scanin),
	.scan_out(pc_sel_trap_pc_lat_scanout),
	.din	(pc_sel_trap_pc_in		[3:0]	),
	.dout	(pc_sel_trap_pc			[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_pc_sel_trap_pc[3:0] = 
       pc_sel_trap_pc[3:0];

assign npc_sel_trap_npc_in[3:0] =
       {4 {trap_pc_valid_in & ~don_ret_last_last_last & ~take_lsr_last & 
	   ~take_htd_last & ~take_fpe_last & ~take_res_last & 
	   ~take_ssr_last & ~take_nns_last & ~take_icp_last}} & 
       trap_tid_in_dec[3:0];

tlu_trl_ctl_msff_ctl_macro__width_4 npc_sel_trap_npc_lat  (
	.scan_in(npc_sel_trap_npc_lat_scanin),
	.scan_out(npc_sel_trap_npc_lat_scanout),
	.din	(npc_sel_trap_npc_in		[3:0]	),
	.dout	(npc_sel_trap_npc		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_npc_sel_trap_npc[3:0] = 
       npc_sel_trap_npc[3:0];

assign check_tsa_ecc_in_in[3:0] = 
       {4 {don_ret_last & suppress_don_ret_taken_}} & trap_taken[3:0];

assign tsacu_en_in_in[3:0] =
       check_tsa_ecc_in_in[3:0] & tlu_ceter_pscce[3:0] & 
       {4 {enable_tel}};

tlu_trl_ctl_msff_ctl_macro__width_12 check_tsa_ecc_lat  (
	.scan_in(check_tsa_ecc_lat_scanin),
	.scan_out(check_tsa_ecc_lat_scanout),
	.din	({tsacu_en_in_in		[3:0],
		  check_tsa_ecc_in_in		[3:0],
		  check_tsa_ecc_in		[3:0]}),
	.dout	({tsacu_en_in			[3:0],
		  check_tsa_ecc_in		[3:0],
		  check_tsa_ecc			[3:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_pct_tnpc_en =
       | check_tsa_ecc_in[3:0];

assign trl_fls_npc_en[3:0] =
       check_tsa_ecc[3:0] | npc_sel_trap_npc[3:0];

assign npc_sel_tnpc[3:0] =
       check_tsa_ecc[3:0] & {4 {~(| tel_tsacu_exc[3:0]) | ~check_tel}};

assign trl_don_ret_pstate_sel[3:0] = 
       npc_sel_tnpc[3:0];

assign trl_npc_sel_tnpc[3:0] =
       npc_sel_tnpc[3:0];

assign trap_tid_dec[3:0] =
       { trap_tid[1] &  trap_tid[0],
         trap_tid[1] & ~trap_tid[0],
        ~trap_tid[1] &  trap_tid[0],
        ~trap_tid[1] & ~trap_tid[0]};

assign htd_icp_complete[3:0] = 
       {4 {trap_pc_valid & take_htd_icp_last_last}} & trap_tid_dec[3:0];

assign trl_invalidate_pc[3:0] =
       pc_sel_trap_pc[3:0] | htd_icp_complete[3:0];

assign trl_invalidate_npc[3:0] = 
       ((npc_sel_tnpc[3:0] & ~{4 {take_don_last_last_last}}) | 
	npc_sel_trap_npc[3:0]) |
       htd_icp_complete[3:0];	       



//////////////////////////////////////////////////////////////////////////////
//
// Shadow scan
//

tlu_trl_ctl_msff_ctl_macro__width_3 shscanid_lat  (
	.scan_in(shscanid_lat_scanin),
	.scan_out(shscanid_lat_scanout),
	.din	(tcu_shscanid		[2:0]	),
	.dout	(shscanid		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_shscanid[1:0] =
       shscanid[1:0];

assign trl_shscanid_2 =
       shscanid[2];

assign shadow_tl[2:0] =
       (tl0[2:0] & {3 {~shscanid[1] & ~shscanid[0]}}) |
       (tl1[2:0] & {3 {~shscanid[1] &  shscanid[0]}}) |
       (tl2[2:0] & {3 { shscanid[1] & ~shscanid[0]}}) |
       (tl3[2:0] & {3 { shscanid[1] &  shscanid[0]}}) ;

assign trl_shadow_tl[2:0] =
       shadow_tl[2:0];

// Need to signal when to capture TPC and TT
assign capture_ss_in =
       (real_trap_last[0] & ~shscanid[1] & ~shscanid[0]) |
       (real_trap_last[1] & ~shscanid[1] &  shscanid[0]) |
       (real_trap_last[2] &  shscanid[1] & ~shscanid[0]) |
       (real_trap_last[3] &  shscanid[1] &  shscanid[0]) ;

tlu_trl_ctl_msff_ctl_macro__width_1 capture_ss_lat   (
	.scan_in(capture_ss_lat_scanin),
	.scan_out(capture_ss_lat_scanout),
	.din	(capture_ss_in			),
	.dout	(capture_ss			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign trl_capture_ss =
       capture_ss;

// Also have to capture (new) TL in sync with TPC and TT

assign tl_for_tt_in[2:0] =
       (tl_for_tt[2:0] & {3 {~capture_ss}}) |
       (shadow_tl[2:0] & {3 { capture_ss}}) ;

tlu_trl_ctl_msff_ctl_macro__width_3 tl_for_tt_lat  (
	.scan_in(tl_for_tt_lat_scanin),
	.scan_out(tl_for_tt_lat_scanout),
	.din	(tl_for_tt_in		[2:0]	),
	.dout	(tl_for_tt		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign trl_tl_for_tt[2:0] =
       tl_for_tt[2:0];



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//

// Each pack has one flop
tlu_trl_ctl_spare_ctl_macro__num_16 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk				),
  .siclk(siclk),
  .soclk(soclk)
);


supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// fixscan start:
assign flush_ifu_last_lat_scanin = scan_in                  ;
assign l1en_per_thread_int_lat_scanin = flush_ifu_last_lat_scanout;
assign l1en_don_ret_lat_scanin   = l1en_per_thread_int_lat_scanout;
assign tid_dec_w_lat_scanin      = l1en_don_ret_lat_scanout ;
assign cwq_busy_lat_scanin       = tid_dec_w_lat_scanout    ;
assign quiesced_last_lat_scanin  = cwq_busy_lat_scanout     ;
assign idl_req_lat_scanin        = quiesced_last_lat_scanout;
assign i_quiesce_lat_scanin      = idl_req_lat_scanout      ;
assign p_quiesce_lat_scanin      = i_quiesce_lat_scanout    ;
assign ma_busy_lat_scanin        = p_quiesce_lat_scanout    ;
assign core_running_status_lat_scanin = ma_busy_lat_scanout      ;
assign ever_been_running_lat_scanin = core_running_status_lat_scanout;
assign por_req_lat_scanin        = ever_been_running_lat_scanout;
assign xir_req_lat_scanin        = por_req_lat_scanout      ;
assign eer_req_lat_scanin        = xir_req_lat_scanout      ;
assign icp_req_lat_scanin        = eer_req_lat_scanout      ;
assign ftt_req_lat_scanin        = icp_req_lat_scanout      ;
assign ivt_req_lat_scanin        = ftt_req_lat_scanout      ;
assign mqr_req_lat_scanin        = ivt_req_lat_scanout      ;
assign dqr_req_lat_scanin        = mqr_req_lat_scanout      ;
assign rqr_req_lat_scanin        = dqr_req_lat_scanout      ;
assign res_req_lat_scanin        = rqr_req_lat_scanout      ;
assign ssr_req_lat_scanin        = res_req_lat_scanout      ;
assign ssc_req_lat_scanin        = ssr_req_lat_scanout      ;
assign nns_req_lat_scanin        = ssc_req_lat_scanout      ;
assign sir_req_lat_scanin        = nns_req_lat_scanout      ;
assign itm_req_lat_scanin        = sir_req_lat_scanout      ;
assign i_tte_outofrange_lat_scanin = itm_req_lat_scanout      ;
assign iit_req_lat_scanin        = i_tte_outofrange_lat_scanout;
assign iln_req_lat_scanin        = iit_req_lat_scanout      ;
assign hst_req_lat_scanin        = iln_req_lat_scanout      ;
assign tlz_req_lat_scanin        = hst_req_lat_scanout      ;
assign sma_req_lat_scanin        = tlz_req_lat_scanout      ;
assign cwq_req_lat_scanin        = sma_req_lat_scanout      ;
assign ade_req_lat_scanin        = cwq_req_lat_scanout      ;
assign iae_req_lat_scanin        = ade_req_lat_scanout      ;
assign ipe_req_lat_scanin        = iae_req_lat_scanout      ;
assign ipv_req_lat_scanin        = ipe_req_lat_scanout      ;
assign i_unauth_access_lat_scanin = ipv_req_lat_scanout      ;
assign iua_req_lat_scanin        = i_unauth_access_lat_scanout;
assign inp_req_lat_scanin        = iua_req_lat_scanout      ;
assign iar_req_lat_scanin        = inp_req_lat_scanout      ;
assign irr_req_lat_scanin        = iar_req_lat_scanout      ;
assign mar_req_lat_scanin        = irr_req_lat_scanout      ;
assign mrr_req_lat_scanin        = mar_req_lat_scanout      ;
assign pro_req_lat_scanin        = mrr_req_lat_scanout      ;
assign ill_req_lat_scanin        = pro_req_lat_scanout      ;
assign don_req_lat_scanin        = ill_req_lat_scanout      ;
assign ret_req_lat_scanin        = don_req_lat_scanout      ;
assign fpd_req_lat_scanin        = ret_req_lat_scanout      ;
assign snn_req_lat_scanin        = fpd_req_lat_scanout      ;
assign sno_req_lat_scanin        = snn_req_lat_scanout      ;
assign fnn_req_lat_scanin        = sno_req_lat_scanout      ;
assign fno_req_lat_scanin        = fnn_req_lat_scanout      ;
assign clw_req_lat_scanin        = fno_req_lat_scanout      ;
assign dtm_req_lat_scanin        = clw_req_lat_scanout      ;
assign ldf_req_lat_scanin        = dtm_req_lat_scanout      ;
assign stf_req_lat_scanin        = ldf_req_lat_scanout      ;
assign dap_req_lat_scanin        = stf_req_lat_scanout      ;
assign vaw_req_lat_scanin        = dap_req_lat_scanout      ;
assign iaw_req_lat_scanin        = vaw_req_lat_scanout      ;
assign paw_req_lat_scanin        = iaw_req_lat_scanout      ;
assign maa_req_lat_scanin        = paw_req_lat_scanout      ;
assign fpe_req_lat_scanin        = maa_req_lat_scanout      ;
assign fei_req_lat_scanin        = fpe_req_lat_scanout      ;
assign fof_req_lat_scanin        = fei_req_lat_scanout      ;
assign pra_req_lat_scanin        = fof_req_lat_scanout      ;
assign dia_req_lat_scanin        = pra_req_lat_scanout      ;
assign ups_req_lat_scanin        = dia_req_lat_scanout      ;
assign dpv_req_lat_scanin        = ups_req_lat_scanout      ;
assign dnc_req_lat_scanin        = dpv_req_lat_scanout      ;
assign dnf_req_lat_scanin        = dnc_req_lat_scanout      ;
assign dso_req_lat_scanin        = dnf_req_lat_scanout      ;
assign tof_req_lat_scanin        = dso_req_lat_scanout      ;
assign dbz_req_lat_scanin        = tof_req_lat_scanout      ;
assign tcc_req_lat_scanin        = dbz_req_lat_scanout      ;
assign dae_req_lat_scanin        = tcc_req_lat_scanout      ;
assign lsr_req_lat_scanin        = dae_req_lat_scanout      ;
assign irt_req_lat_scanin        = lsr_req_lat_scanout      ;
assign drt_req_lat_scanin        = irt_req_lat_scanout      ;
assign d_tte_outofrange_lat_scanin = drt_req_lat_scanout      ;
assign dit_req_lat_scanin        = d_tte_outofrange_lat_scanout;
assign pmu_req_lat_scanin        = dit_req_lat_scanout      ;
assign ime_req_lat_scanin        = pmu_req_lat_scanout      ;
assign dme_req_lat_scanin        = ime_req_lat_scanout      ;
assign write_itlb_lat_scanin     = dme_req_lat_scanout      ;
assign itw_req_lat_scanin        = write_itlb_lat_scanout   ;
assign reload_done_lat_scanin    = itw_req_lat_scanout      ;
assign htd_req_lat_scanin        = reload_done_lat_scanout  ;
assign i_tsb_miss_lat_scanin     = htd_req_lat_scanout      ;
assign him_req_lat_scanin        = i_tsb_miss_lat_scanout   ;
assign d_tsb_miss_lat_scanin     = him_req_lat_scanout      ;
assign hdm_req_lat_scanin        = d_tsb_miss_lat_scanout   ;
assign ibp_req_lat_scanin        = hdm_req_lat_scanout      ;
assign tct_req_lat_scanin        = ibp_req_lat_scanout      ;
assign reset_pre_trap_lat_scanin = tct_req_lat_scanout      ;
assign disrupt_pre_trap_lat_scanin = reset_pre_trap_lat_scanout;
assign divide_pre_trap_lat_scanin = disrupt_pre_trap_lat_scanout;
assign long_pre_trap_lat_scanin  = divide_pre_trap_lat_scanout;
assign fgu_pre_trap_lat_scanin   = long_pre_trap_lat_scanout;
assign don_ret_pre_trap_lat_scanin = fgu_pre_trap_lat_scanout ;
assign notrap_pre_trap_lat_scanin = don_ret_pre_trap_lat_scanout;
assign itw_pre_trap_lat_scanin   = notrap_pre_trap_lat_scanout;
assign other_pre_trap_lat_scanin = itw_pre_trap_lat_scanout ;
assign pre_allow_trap_lat_scanin = other_pre_trap_lat_scanout;
assign pre_allow_don_ret_lat_scanin = pre_allow_trap_lat_scanout;
assign take_reset_lat_scanin     = pre_allow_don_ret_lat_scanout;
assign take_disrupt_lat_scanin   = take_reset_lat_scanout   ;
assign take_div_lat_scanin       = take_disrupt_lat_scanout ;
assign take_long_lat_scanin      = take_div_lat_scanout     ;
assign take_fgu_lat_scanin       = take_long_lat_scanout    ;
assign take_other_lat_scanin     = take_fgu_lat_scanout     ;
assign take_don_ret_lat_scanin   = take_other_lat_scanout   ;
assign take_notrap_lat_scanin    = take_don_ret_lat_scanout ;
assign take_itw_lat_scanin       = take_notrap_lat_scanout  ;
assign take_otr_lat_scanin       = take_itw_lat_scanout     ;
assign take_pmu_lat_scanin       = take_otr_lat_scanout     ;
assign take_ivt_lat_scanin       = take_pmu_lat_scanout     ;
assign trap_taken_lat_scanin     = take_ivt_lat_scanout     ;
assign trap_taken0_lat_scanin    = trap_taken_lat_scanout   ;
assign trap_taken1_lat_scanin    = trap_taken0_lat_scanout  ;
assign trap_taken2_lat_scanin    = trap_taken1_lat_scanout  ;
assign trap_taken3_lat_scanin    = trap_taken2_lat_scanout  ;
assign trap_taken4_lat_scanin    = trap_taken3_lat_scanout  ;
assign trap_taken5_lat_scanin    = trap_taken4_lat_scanout  ;
assign trap_itw_taken_lat_scanin = trap_taken5_lat_scanout  ;
assign take_reset_last_lat_scanin = trap_itw_taken_lat_scanout;
assign trap_type_lat_scanin      = take_reset_last_lat_scanout;
assign trap_type_for_pc_lat_scanin = trap_type_lat_scanout    ;
assign hpstate_hpriv_lat_scanin  = trap_type_for_pc_lat_scanout;
assign tl_lat_scanin             = hpstate_hpriv_lat_scanout;
assign tlz_lat_scanin            = tl_lat_scanout           ;
assign tl_gt_0_last_lat_scanin   = tlz_lat_scanout          ;
assign wr_gl_lat_scanin          = tl_gt_0_last_lat_scanout ;
assign gl_rest_lat_scanin        = wr_gl_lat_scanout        ;
assign mbist_run_lat_scanin      = gl_rest_lat_scanout      ;
assign tsa_wr_addr_lat_scanin    = mbist_run_lat_scanout    ;
assign tsa_rd_addr_lat_scanin    = tsa_wr_addr_lat_scanout  ;
assign rmw_addr_lat_scanin       = tsa_rd_addr_lat_scanout  ;
assign rmw_tsa_lat_scanin        = rmw_addr_lat_scanout     ;
assign tic_compare_lat_scanin    = rmw_tsa_lat_scanout      ;
assign pstate_ie_lat_scanin      = tic_compare_lat_scanout  ;
assign pmu_trap_mask_lat_scanin  = pstate_ie_lat_scanout    ;
assign int_level_n_lat_scanin    = pmu_trap_mask_lat_scanout;
assign tccd_exc_lat_scanin       = int_level_n_lat_scanout  ;
assign tcud_exc_lat_scanin       = tccd_exc_lat_scanout     ;
assign tic_index_lat_scanin      = tcud_exc_lat_scanout     ;
assign tpe_exc_lat_scanin        = tic_index_lat_scanout    ;
assign tsa_index_lat_scanin      = tpe_exc_lat_scanout      ;
assign p_trap_lat_scanin         = tsa_index_lat_scanout    ;
assign asi_data_lat_scanin       = p_trap_lat_scanout       ;
assign enter_red_lat_scanin      = asi_data_lat_scanout     ;
assign stb_empty_lat_scanin      = enter_red_lat_scanout    ;
assign window_block_lat_scanin   = stb_empty_lat_scanout    ;
assign take_lat_scanin           = window_block_lat_scanout ;
assign take_last_lat_scanin      = take_lat_scanout         ;
assign thread_sel_lat_scanin     = take_last_lat_scanout    ;
assign pstate_am_lat_scanin      = thread_sel_lat_scanout   ;
assign pc_npc_sel_lat_scanin     = pstate_am_lat_scanout    ;
assign stack_lat_scanin          = pc_npc_sel_lat_scanout   ;
assign check_tel_lat_scanin      = stack_lat_scanout        ;
assign htd_res_icp_when_npc_nonseq_last_lat_scanin = check_tel_lat_scanout    ;
assign pc_valid_lat_scanin       = htd_res_icp_when_npc_nonseq_last_lat_scanout;
assign trap_tid_lat_scanin       = pc_valid_lat_scanout     ;
assign take_itw_last_lat_scanin  = trap_tid_lat_scanout     ;
assign icache_perr_lat_scanin    = take_itw_last_lat_scanout;
assign pstate_sel_lat_scanin     = icache_perr_lat_scanout  ;
assign ccr_cwp_asi_tid_lat_scanin = pstate_sel_lat_scanout   ;
assign clear_ctl_reg_lat_scanin  = ccr_cwp_asi_tid_lat_scanout;
assign npc_nonseq_lat_scanin     = clear_ctl_reg_lat_scanout;
assign pc_sel_trap_pc_lat_scanin = npc_nonseq_lat_scanout   ;
assign npc_sel_trap_npc_lat_scanin = pc_sel_trap_pc_lat_scanout;
assign check_tsa_ecc_lat_scanin  = npc_sel_trap_npc_lat_scanout;
assign shscanid_lat_scanin       = check_tsa_ecc_lat_scanout;
assign capture_ss_lat_scanin     = shscanid_lat_scanout     ;
assign tl_for_tt_lat_scanin      = capture_ss_lat_scanout   ;
assign spares_scanin             = tl_for_tt_lat_scanout    ;
assign scan_out                  = spares_scanout           ;

assign gl_lat_wmr_scanin         = wmr_scan_in              ;
assign pil3_lat_wmr_scanin       = gl_lat_wmr_scanout       ;
assign pil2_lat_wmr_scanin       = pil3_lat_wmr_scanout     ;
assign pil1_lat_wmr_scanin       = pil2_lat_wmr_scanout     ;
assign pil0_lat_wmr_scanin       = pil1_lat_wmr_scanout     ;
assign softint3_lat_wmr_scanin   = pil0_lat_wmr_scanout     ;
assign softint2_lat_wmr_scanin   = softint3_lat_wmr_scanout ;
assign softint1_lat_wmr_scanin   = softint2_lat_wmr_scanout ;
assign softint0_lat_wmr_scanin   = softint1_lat_wmr_scanout ;
assign hintp_lat_wmr_scanin      = softint0_lat_wmr_scanout ;
assign wmr_scan_out              = hintp_lat_wmr_scanout    ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module tlu_trl_ctl_l1clkhdr_ctl_macro (
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

module tlu_trl_ctl_msff_ctl_macro__width_4 (
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

module tlu_trl_ctl_msff_ctl_macro__width_1 (
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

module tlu_trl_ctl_msff_ctl_macro__width_8 (
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

module tlu_trl_ctl_msff_ctl_macro__clockwidth_1__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [3:1] sout;

  input [3:0] din;
  input [3:0] l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






cl_sc1_msff_4x d0_0 (
.l1clk(l1clk[0]),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0]),
.si(sout[1]),
.so(scan_out),
.q(dout[0])
);
cl_sc1_msff_4x d0_1 (
.l1clk(l1clk[1]),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1]),
.si(sout[2]),
.so(sout[1]),
.q(dout[1])
);
cl_sc1_msff_4x d0_2 (
.l1clk(l1clk[2]),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2]),
.si(sout[3]),
.so(sout[2]),
.q(dout[2])
);
cl_sc1_msff_4x d0_3 (
.l1clk(l1clk[3]),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3]),
.si(scan_in),
.so(sout[3]),
.q(dout[3])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_trl_ctl_msff_ctl_macro__width_9 (
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

module tlu_trl_ctl_msff_ctl_macro__width_12 (
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

module tlu_trl_ctl_msff_ctl_macro__width_10 (
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

module tlu_trl_ctl_msff_ctl_macro__width_5 (
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

module tlu_trl_ctl_msff_ctl_macro__width_2 (
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

module tlu_trl_ctl_msff_ctl_macro__width_6 (
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

module tlu_trl_ctl_msff_ctl_macro__width_17 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [16:0] fdin;
wire [15:0] so;

  input [16:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [16:0] dout;
  output scan_out;
assign fdin[16:0] = din[16:0];






dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_trl_ctl_msff_ctl_macro__width_16 (
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

module tlu_trl_ctl_msff_ctl_macro__width_3 (
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

module tlu_trl_ctl_msff_ctl_macro__width_11 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tlu_trl_ctl_spare_ctl_macro__num_16 (
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
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire si_11;
wire so_11;
wire spare11_flop_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;
wire si_12;
wire so_12;
wire spare12_flop_unused;
wire spare12_buf_32x_unused;
wire spare12_nand3_8x_unused;
wire spare12_inv_8x_unused;
wire spare12_aoi22_4x_unused;
wire spare12_buf_8x_unused;
wire spare12_oai22_4x_unused;
wire spare12_inv_16x_unused;
wire spare12_nand2_16x_unused;
wire spare12_nor3_4x_unused;
wire spare12_nand2_8x_unused;
wire spare12_buf_16x_unused;
wire spare12_nor2_16x_unused;
wire spare12_inv_32x_unused;
wire si_13;
wire so_13;
wire spare13_flop_unused;
wire spare13_buf_32x_unused;
wire spare13_nand3_8x_unused;
wire spare13_inv_8x_unused;
wire spare13_aoi22_4x_unused;
wire spare13_buf_8x_unused;
wire spare13_oai22_4x_unused;
wire spare13_inv_16x_unused;
wire spare13_nand2_16x_unused;
wire spare13_nor3_4x_unused;
wire spare13_nand2_8x_unused;
wire spare13_buf_16x_unused;
wire spare13_nor2_16x_unused;
wire spare13_inv_32x_unused;
wire si_14;
wire so_14;
wire spare14_flop_unused;
wire spare14_buf_32x_unused;
wire spare14_nand3_8x_unused;
wire spare14_inv_8x_unused;
wire spare14_aoi22_4x_unused;
wire spare14_buf_8x_unused;
wire spare14_oai22_4x_unused;
wire spare14_inv_16x_unused;
wire spare14_nand2_16x_unused;
wire spare14_nor3_4x_unused;
wire spare14_nand2_8x_unused;
wire spare14_buf_16x_unused;
wire spare14_nor2_16x_unused;
wire spare14_inv_32x_unused;
wire si_15;
wire so_15;
wire spare15_flop_unused;
wire spare15_buf_32x_unused;
wire spare15_nand3_8x_unused;
wire spare15_inv_8x_unused;
wire spare15_aoi22_4x_unused;
wire spare15_buf_8x_unused;
wire spare15_oai22_4x_unused;
wire spare15_inv_16x_unused;
wire spare15_nand2_16x_unused;
wire spare15_nor3_4x_unused;
wire spare15_nand2_8x_unused;
wire spare15_buf_16x_unused;
wire spare15_nor2_16x_unused;
wire spare15_inv_32x_unused;


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

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_sc1_msff_8x spare11_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_11),
                               .so(so_11),
                               .d(1'b0),
                               .q(spare11_flop_unused));
assign si_11 = so_10;

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));

cl_sc1_msff_8x spare12_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_12),
                               .so(so_12),
                               .d(1'b0),
                               .q(spare12_flop_unused));
assign si_12 = so_11;

cl_u1_buf_32x   spare12_buf_32x (.in(1'b1),
                                   .out(spare12_buf_32x_unused));
cl_u1_nand3_8x spare12_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare12_nand3_8x_unused));
cl_u1_inv_8x    spare12_inv_8x (.in(1'b1),
                                  .out(spare12_inv_8x_unused));
cl_u1_aoi22_4x spare12_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_aoi22_4x_unused));
cl_u1_buf_8x    spare12_buf_8x (.in(1'b1),
                                  .out(spare12_buf_8x_unused));
cl_u1_oai22_4x spare12_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_oai22_4x_unused));
cl_u1_inv_16x   spare12_inv_16x (.in(1'b1),
                                   .out(spare12_inv_16x_unused));
cl_u1_nand2_16x spare12_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare12_nand2_16x_unused));
cl_u1_nor3_4x spare12_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare12_nor3_4x_unused));
cl_u1_nand2_8x spare12_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare12_nand2_8x_unused));
cl_u1_buf_16x   spare12_buf_16x (.in(1'b1),
                                   .out(spare12_buf_16x_unused));
cl_u1_nor2_16x spare12_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare12_nor2_16x_unused));
cl_u1_inv_32x   spare12_inv_32x (.in(1'b1),
                                   .out(spare12_inv_32x_unused));

cl_sc1_msff_8x spare13_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_13),
                               .so(so_13),
                               .d(1'b0),
                               .q(spare13_flop_unused));
assign si_13 = so_12;

cl_u1_buf_32x   spare13_buf_32x (.in(1'b1),
                                   .out(spare13_buf_32x_unused));
cl_u1_nand3_8x spare13_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare13_nand3_8x_unused));
cl_u1_inv_8x    spare13_inv_8x (.in(1'b1),
                                  .out(spare13_inv_8x_unused));
cl_u1_aoi22_4x spare13_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_aoi22_4x_unused));
cl_u1_buf_8x    spare13_buf_8x (.in(1'b1),
                                  .out(spare13_buf_8x_unused));
cl_u1_oai22_4x spare13_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_oai22_4x_unused));
cl_u1_inv_16x   spare13_inv_16x (.in(1'b1),
                                   .out(spare13_inv_16x_unused));
cl_u1_nand2_16x spare13_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare13_nand2_16x_unused));
cl_u1_nor3_4x spare13_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare13_nor3_4x_unused));
cl_u1_nand2_8x spare13_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare13_nand2_8x_unused));
cl_u1_buf_16x   spare13_buf_16x (.in(1'b1),
                                   .out(spare13_buf_16x_unused));
cl_u1_nor2_16x spare13_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare13_nor2_16x_unused));
cl_u1_inv_32x   spare13_inv_32x (.in(1'b1),
                                   .out(spare13_inv_32x_unused));

cl_sc1_msff_8x spare14_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_14),
                               .so(so_14),
                               .d(1'b0),
                               .q(spare14_flop_unused));
assign si_14 = so_13;

cl_u1_buf_32x   spare14_buf_32x (.in(1'b1),
                                   .out(spare14_buf_32x_unused));
cl_u1_nand3_8x spare14_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare14_nand3_8x_unused));
cl_u1_inv_8x    spare14_inv_8x (.in(1'b1),
                                  .out(spare14_inv_8x_unused));
cl_u1_aoi22_4x spare14_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_aoi22_4x_unused));
cl_u1_buf_8x    spare14_buf_8x (.in(1'b1),
                                  .out(spare14_buf_8x_unused));
cl_u1_oai22_4x spare14_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_oai22_4x_unused));
cl_u1_inv_16x   spare14_inv_16x (.in(1'b1),
                                   .out(spare14_inv_16x_unused));
cl_u1_nand2_16x spare14_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare14_nand2_16x_unused));
cl_u1_nor3_4x spare14_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare14_nor3_4x_unused));
cl_u1_nand2_8x spare14_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare14_nand2_8x_unused));
cl_u1_buf_16x   spare14_buf_16x (.in(1'b1),
                                   .out(spare14_buf_16x_unused));
cl_u1_nor2_16x spare14_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare14_nor2_16x_unused));
cl_u1_inv_32x   spare14_inv_32x (.in(1'b1),
                                   .out(spare14_inv_32x_unused));

cl_sc1_msff_8x spare15_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_15),
                               .so(so_15),
                               .d(1'b0),
                               .q(spare15_flop_unused));
assign si_15 = so_14;

cl_u1_buf_32x   spare15_buf_32x (.in(1'b1),
                                   .out(spare15_buf_32x_unused));
cl_u1_nand3_8x spare15_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare15_nand3_8x_unused));
cl_u1_inv_8x    spare15_inv_8x (.in(1'b1),
                                  .out(spare15_inv_8x_unused));
cl_u1_aoi22_4x spare15_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_aoi22_4x_unused));
cl_u1_buf_8x    spare15_buf_8x (.in(1'b1),
                                  .out(spare15_buf_8x_unused));
cl_u1_oai22_4x spare15_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_oai22_4x_unused));
cl_u1_inv_16x   spare15_inv_16x (.in(1'b1),
                                   .out(spare15_inv_16x_unused));
cl_u1_nand2_16x spare15_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare15_nand2_16x_unused));
cl_u1_nor3_4x spare15_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare15_nor3_4x_unused));
cl_u1_nand2_8x spare15_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare15_nand2_8x_unused));
cl_u1_buf_16x   spare15_buf_16x (.in(1'b1),
                                   .out(spare15_buf_16x_unused));
cl_u1_nor2_16x spare15_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare15_nor2_16x_unused));
cl_u1_inv_32x   spare15_inv_32x (.in(1'b1),
                                   .out(spare15_inv_32x_unused));
assign scan_out = so_15;



endmodule

