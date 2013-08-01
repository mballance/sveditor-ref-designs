// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_asi_ctl.v
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
module  tlu_asi_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  wmr_scan_in, 
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
  mbd_compare, 
  error_inject_enable, 
  error_inject_tccu, 
  error_inject_tsau, 
  error_inject_mask, 
  lsu_rngf_cdbus, 
  pct0_asi_data, 
  pct1_asi_data, 
  trl0_asi_data, 
  trl1_asi_data, 
  tlu_ceter_pscce, 
  tsd_hpstate_hpriv, 
  tsd_pstate_priv, 
  tsd0_asi_data, 
  tsd1_asi_data, 
  tel0_ecc, 
  tel0_tsac, 
  tel0_tsau, 
  tel1_ecc, 
  tel1_tsac, 
  tel1_tsau, 
  tic_asi_data, 
  cel_ecc, 
  cer_asi_data, 
  cel_tccp, 
  cel_tcup, 
  mmu_asi_data, 
  mmu_asi_read, 
  mmu_asi_cecc, 
  mmu_asi_uecc, 
  dfd_desr_f, 
  dfd_fesr_f, 
  tlu_lsu_clear_ctl_reg_, 
  hver_mask_major_rev, 
  hver_mask_minor_rev, 
  wmr_scan_out, 
  scan_out, 
  asi_error_tccu, 
  asi_error_tsau, 
  asi_error_mask, 
  asi_tsa_rd_addr, 
  asi_tsa_rd_iqr_ecc, 
  asi_tsa_tid, 
  asi_rd_asireg, 
  asi_wr_asireg, 
  asi_rd_tick, 
  asi_wr_tick, 
  asi_rd_pc, 
  asi_wr_set_softint, 
  asi_wr_clear_softint, 
  asi_rd_softint, 
  asi_wr_softint, 
  asi_tca_addr, 
  asi_tca_addr_valid, 
  asi_tca_wr, 
  asi_wr_mondo_head, 
  asi_wr_mondo_tail, 
  asi_wr_device_head, 
  asi_wr_device_tail, 
  asi_wr_res_err_head, 
  asi_wr_res_err_tail, 
  asi_wr_nonres_err_head, 
  asi_wr_nonres_err_tail, 
  asi_rd_iqr_reg, 
  asi_rd_iqr, 
  asi_rd_tpc, 
  asi_wr_tpc, 
  asi_rd_tnpc, 
  asi_wr_tnpc, 
  asi_rd_tstate, 
  asi_wr_tstate, 
  asi_rd_tt, 
  asi_wr_tt, 
  asi_wr_tba, 
  asi_wr_pstate, 
  asi_rd_tl, 
  asi_wr_tl, 
  asi_rd_pil, 
  asi_wr_pil, 
  asi_rd_gl, 
  asi_wr_gl, 
  asi_wr_hpstate, 
  asi_rd_htstate, 
  asi_wr_htstate, 
  asi_rd_hintp, 
  asi_wr_hintp, 
  asi_wr_htba, 
  asi_rd_h_pstate_tba, 
  asi_rd_tba_htba, 
  asi_rd_pstate_hpstate, 
  asi_preempt_trap, 
  asi_preempt_done_retry, 
  asi_rmw_tsa, 
  asi_wr_int_rec, 
  asi_wr_any_int_rec, 
  asi_rd_inc_vec_2, 
  asi_int_rec_mux_sel_in, 
  asi_rd_int_rec, 
  asi_rd_inc_vec, 
  asi_check_qr_exc, 
  asi_tca_wr_data_63, 
  asi_wr_data_0, 
  asi_wr_data_1, 
  asi_tsd0_wr_data_12, 
  asi_tsd0_wr_data_10_08, 
  asi_tsd0_wr_data_05_00, 
  asi_tsd1_wr_data_12, 
  asi_tsd1_wr_data_10_08, 
  asi_tsd1_wr_data_05_00, 
  asi_tsa_wr_data, 
  asi_tsa_wr_data_npc_oor_va, 
  asi_tsa_wr_data_npc_nonseq, 
  asi_rd_cerer, 
  asi_rd_ceter, 
  asi_wr_cerer, 
  asi_ceter_tid, 
  asi_wr_ceter, 
  asi_rd_tid, 
  asi_rd_isfsr, 
  asi_rd_dsfsr, 
  asi_rd_dsfar, 
  asi_rd_desr, 
  asi_rd_fesr, 
  asi_wr_isfsr, 
  asi_wr_dsfsr, 
  asi_wr_dsfar, 
  asi_rd_iaw, 
  asi_wr_iaw, 
  asi_decr, 
  asi_ece_exc, 
  asi_eue_exc, 
  asi_ecc_tid, 
  asi_tsac, 
  asi_tsau, 
  asi_tsacu, 
  asi_tsacu_tid, 
  asi_irl_cleared, 
  asi_rd_stage_1, 
  asi_trl_pstate_en, 
  asi_stg1_en, 
  asi_mbist_ecc_in, 
  asi_mbist_tsa_ecc_in, 
  asi_mbist_run, 
  asi_mbist_cmpsel, 
  asi_mbd_compare_data, 
  asi_mbd_sel_tsd0, 
  asi_mbd_sel_tsd1, 
  asi_mbd_sel_tic, 
  asi_mbist_addr, 
  asi_mbist_tsa_rd_en, 
  asi_mbist_tsa_wr_en, 
  asi_mbist_tel_en, 
  asi_tccup_in, 
  asi_tccud_in, 
  asi_immu_enable, 
  asi_spec_enable, 
  asi_halt, 
  asi_clear_spu_trap_req, 
  tlu_spec_enable, 
  tlu_tca_tid, 
  tlu_tca_index, 
  tlu_mbi_tsa0_fail, 
  tlu_mbi_tsa1_fail, 
  tlu_mbi_tca_fail, 
  tlu_rngf_cdbus, 
  tlu_rngf_cdbus_error);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire pmen_lat_scanin;
wire pmen_lat_scanout;
wire pmen;
wire stg1_en_in;
wire stg1_en_lat_scanin;
wire stg1_en_lat_scanout;
wire stg1_en;
wire stg2_en_in;
wire stg2_en;
wire stg2_en_lat_scanin;
wire stg2_en_lat_scanout;
wire stg3_en_lat_scanin;
wire stg3_en_lat_scanout;
wire stg3_en;
wire stg4_en_lat_scanin;
wire stg4_en_lat_scanout;
wire pstg4_en;
wire stg4_en;
wire [64:0] data_4;
wire pm1_en;
wire mbist_run;
wire l1clk_pm1;
wire pm2_en;
wire l1clk_pm2;
wire mbist_run_lat_scanin;
wire mbist_run_lat_scanout;
wire mbist_tsa0_write_lat_scanin;
wire mbist_tsa0_write_lat_scanout;
wire mbist_tsa0_wr_en;
wire mbist_tsa1_write_lat_scanin;
wire mbist_tsa1_write_lat_scanout;
wire mbist_tsa1_wr_en;
wire mbist_tca_write_lat_scanin;
wire mbist_tca_write_lat_scanout;
wire mbist_tca_wr_en;
wire mbist_addr_lat_scanin;
wire mbist_addr_lat_scanout;
wire [4:0] mbist_addr;
wire [7:0] mbist_wdata;
wire [63:0] data_1;
wire mbist_tsa0_read_lat_scanin;
wire mbist_tsa0_read_lat_scanout;
wire mbist_tsa0_rd_en;
wire mbist_tsa1_read_lat_scanin;
wire mbist_tsa1_read_lat_scanout;
wire mbist_tsa1_rd_en;
wire mbist_tca_read_lat_scanin;
wire mbist_tca_read_lat_scanout;
wire mbist_tca_rd_en;
wire mbist_cmpsel_lat_scanin;
wire mbist_cmpsel_lat_scanout;
wire [3:0] mbist_cmpsel;
wire [7:0] mbist_wdata_2;
wire mbist_tsa1_rd_en_2;
wire mbist_tsa0_rd_en_2;
wire mbist_addr_2_lat_scanin;
wire mbist_addr_2_lat_scanout;
wire [4:0] mbist_addr_2;
wire mbist_tsa0_read_2_lat_scanin;
wire mbist_tsa0_read_2_lat_scanout;
wire mbist_tsa1_read_2_lat_scanin;
wire mbist_tsa1_read_2_lat_scanout;
wire mbist_tca_read_2_lat_scanin;
wire mbist_tca_read_2_lat_scanout;
wire mbist_tca_rd_en_2;
wire mbist_cmpsel_2_lat_scanin;
wire mbist_cmpsel_2_lat_scanout;
wire [3:0] mbist_cmpsel_2;
wire mbist_wdata_2_lat_scanin;
wire mbist_wdata_2_lat_scanout;
wire mbist_tsa0_read_3_lat_scanin;
wire mbist_tsa0_read_3_lat_scanout;
wire mbist_tsa0_rd_en_3;
wire mbist_tsa1_read_3_lat_scanin;
wire mbist_tsa1_read_3_lat_scanout;
wire mbist_tsa1_rd_en_3;
wire mbist_tca_read_3_lat_scanin;
wire mbist_tca_read_3_lat_scanout;
wire mbist_tca_rd_en_3;
wire mbist_wdata_3_lat_scanin;
wire mbist_wdata_3_lat_scanout;
wire [7:0] mbist_wdata_3;
wire rd_tsa_pc_2;
wire rd_tsa_nopc_2;
wire rd_tsa_ecc_2;
wire rd_tsa_pc_3;
wire rd_tsa_nopc_3;
wire rd_tsa_ecc_3;
wire wr_tsa_2;
wire wr_tsa_3;
wire mbist_tsa0_read_4_lat_scanin;
wire mbist_tsa0_read_4_lat_scanout;
wire mbist_tsa0_rd_en_4;
wire mbist_tsa1_read_4_lat_scanin;
wire mbist_tsa1_read_4_lat_scanout;
wire mbist_tsa1_rd_en_4;
wire [7:0] compare_data_in;
wire mbist_tsa_3;
wire compare_data_lat_scanin;
wire compare_data_lat_scanout;
wire [7:0] compare_data;
wire tsa0_fail_in;
wire tsa1_fail_in;
wire tca_fail_in;
wire tsa0_fail_lat_scanin;
wire tsa0_fail_lat_scanout;
wire tsa0_fail;
wire tsa1_fail_lat_scanin;
wire tsa1_fail_lat_scanout;
wire tsa1_fail;
wire tca_fail_lat_scanin;
wire tca_fail_lat_scanout;
wire tca_fail;
wire compare_lat_scanin;
wire compare_lat_scanout;
wire compare;
wire ctl_0;
wire [63:48] data_0;
wire data_0_59_unused;
wire data_0_57_unused;
wire data_0_56_unused;
wire asi_0;
wire pr_0;
wire hpr_0;
wire pr_tstack_0;
wire wr_gl_0;
wire htstate_0;
wire asi_25_0;
wire tsa_diag_0;
wire [1:0] preempt_done_retry_in;
wire [1:0] preempt_trap_in;
wire wr_gl_2;
wire [63:0] data_2;
wire preempt_trap_lat_scanin;
wire preempt_trap_lat_scanout;
wire [1:0] preempt_trap;
wire [1:0] preempt_done_retry;
wire sel_lsu;
wire rd_clesr;
wire rd_clfesr;
wire [63:0] clesr_data;
wire [63:0] clfesr_in;
wire [63:48] clfesr_data;
wire clfesr_lat_wmr_scanin;
wire clfesr_lat_wmr_scanout;
wire [63:0] data_1_in;
wire rng_stg1_data_scanin;
wire rng_stg1_data_scanout;
wire ctl_1_lat_scanin;
wire ctl_1_lat_scanout;
wire ctl_1;
wire rd_stage_1;
wire hpstatehpriv_lat_scanin;
wire hpstatehpriv_lat_scanout;
wire [7:0] hpstatehpriv;
wire pstatepriv_lat_scanin;
wire pstatepriv_lat_scanout;
wire [7:0] pstatepriv;
wire hpstate_hpriv;
wire [7:0] rd_tid_dec;
wire pstate_priv;
wire asi;
wire asr;
wire pr;
wire hpr;
wire asi_2;
wire ctl_2;
wire asr_2;
wire pr_2;
wire hpr_2;
wire fast_asi;
wire superfast_hpr_2;
wire mondo_head;
wire rd_mondo_head;
wire wr_mondo_head;
wire mondo_tail;
wire rd_mondo_tail;
wire wr_mondo_tail;
wire device_head;
wire rd_device_head;
wire wr_device_head;
wire device_tail;
wire rd_device_tail;
wire wr_device_tail;
wire res_err_head;
wire rd_res_err_head;
wire wr_res_err_head;
wire res_err_tail;
wire rd_res_err_tail;
wire wr_res_err_tail;
wire nonres_err_head;
wire rd_nonres_err_head;
wire wr_nonres_err_head;
wire nonres_err_tail;
wire rd_nonres_err_tail;
wire wr_nonres_err_tail;
wire lsu_ctl;
wire wr_lsu_ctl;
wire decr;
wire rd_decr;
wire wr_decr;
wire esr;
wire desr;
wire rd_desr;
wire fesr;
wire rd_fesr;
wire clesr;
wire clfesr;
wire cerer;
wire rd_cerer;
wire wr_cerer;
wire ceter;
wire rd_ceter;
wire wr_ceter;
wire isfsr;
wire rd_isfsr;
wire wr_isfsr;
wire iaw_2;
wire rd_iaw_2;
wire wr_iaw_2;
wire dsfsr;
wire rd_dsfsr;
wire wr_dsfsr;
wire dsfar;
wire rd_dsfar;
wire wr_dsfar;
wire tca_diag;
wire rd_tca_ecc;
wire rd_tca_data;
wire tsa_diag;
wire rd_tsa_ecc;
wire int_rec;
wire rd_int_rec;
wire wr_int_rec;
wire inc_vec;
wire rd_inc_vec;
wire asireg_2;
wire rd_asireg_2;
wire wr_asireg_2;
wire tick;
wire rd_tick;
wire tick_npt_1_;
wire priv_action;
wire wr_tick;
wire [7:0] tick_npt_;
wire pc_2;
wire rd_pc_2;
wire set_softint;
wire wr_set_softint;
wire clear_softint;
wire wr_clear_softint;
wire softint;
wire rd_softint;
wire wr_softint;
wire tick_cmpr;
wire rd_tick_cmpr;
wire wr_tick_cmpr;
wire stick_cmpr;
wire rd_stick_cmpr;
wire wr_stick_cmpr;
wire tpc;
wire rd_tpc;
wire wr_tpc;
wire tnpc;
wire rd_tnpc;
wire wr_tnpc;
wire tstate;
wire rd_tstate;
wire wr_tstate;
wire tt;
wire rd_tt;
wire wr_tt;
wire tba_2;
wire rd_tba_2;
wire wr_tba_2;
wire pstate;
wire wr_pstate;
wire pstate_2;
wire rd_pstate_2;
wire tl;
wire rd_tl;
wire wr_tl;
wire pil;
wire rd_pil;
wire wr_pil;
wire gl;
wire rd_gl;
wire wr_gl;
wire hpstate;
wire wr_hpstate;
wire hpstate_2;
wire rd_hpstate_2;
wire htstate;
wire rd_htstate;
wire wr_htstate;
wire hintp;
wire rd_hintp;
wire wr_hintp;
wire htba_2;
wire rd_htba_2;
wire wr_htba_2;
wire hver;
wire rd_hver;
wire rd_halt;
wire wr_halt;
wire hstick_cmpr;
wire rd_hstick_cmpr;
wire wr_hstick_cmpr;
wire fast_tsa_rd_iqr;
wire fast_rd_tsa_ecc;
wire fast_tsa_rd_iqr_res_nonres;
wire rd_tca;
wire wr_tca;
wire [4:3] tca_rd_addr;
wire [4:0] tca_addr;
wire wr_hstick_cmpr_2;
wire wr_stick_cmpr_2;
wire wr_tca_2;
wire rd_tsa_nopc;
wire rd_tsa_pc;
wire wr_tstate_2;
wire wr_tt_2;
wire wr_htstate_2;
wire wr_mondo_head_2;
wire wr_mondo_tail_2;
wire wr_device_head_2;
wire wr_device_tail_2;
wire wr_res_err_head_2;
wire wr_res_err_tail_2;
wire wr_nonres_err_head_2;
wire wr_nonres_err_tail_2;
wire wr_tpc_2;
wire wr_tnpc_2;
wire wr_tstate_3;
wire wr_tt_3;
wire wr_htstate_3;
wire wr_mondo_head_3;
wire wr_mondo_tail_3;
wire wr_device_head_3;
wire wr_device_tail_3;
wire wr_res_err_head_3;
wire wr_res_err_tail_3;
wire wr_nonres_err_head_3;
wire wr_nonres_err_tail_3;
wire wr_tpc_3;
wire wr_tnpc_3;
wire [2:0] rd_iqr_2;
wire rd_device_head_2;
wire rd_nonres_err_head_2;
wire rd_mondo_tail_2;
wire rd_res_err_tail_2;
wire rd_device_tail_2;
wire rd_nonres_err_tail_2;
wire rd_iqr_reg_2;
wire rd_res_err_head_2;
wire rd_mondo_head_2;
wire rd_tpc_2;
wire rd_tnpc_2;
wire rd_tstate_2;
wire rd_tt_2;
wire rd_htstate_2;
wire rd_cerer_2;
wire rd_ceter_2;
wire rd_inc_vec_2;
wire [7:0] wr_tid_dec;
wire rd_tick_3;
wire rd_cth;
wire rd_trl;
wire rd_tic;
wire rd_tsd_2;
wire rd_tba_htba_2;
wire [1:0] rmw_tsa_in;
wire [63:0] hver_value;
wire [63:0] tic_ecc;
wire [63:0] data_err_1;
wire [63:0] decr_data;
wire [63:46] decr_reg;
wire [63:0] dsfar_data;
wire [63:0] fesr_data;
wire [63:0] desr_data;
wire [63:0] isfsr_data;
wire [63:0] dsfsr_data;
wire sel_data1;
wire rd_hver_2;
wire rd_cth_2;
wire rd_tca_ecc_2;
wire rd_tca_data_2;
wire rd_desr_2;
wire rd_fesr_2;
wire rd_dsfar_2;
wire rd_isfsr_2;
wire rd_dsfsr_2;
wire rd_decr_2;
wire [63:0] data_2_in;
wire [64:0] tic_data;
wire stg2_data_lat_scanin;
wire stg2_data_lat_scanout;
wire stg2_ctl_lat_scanin;
wire stg2_ctl_lat_scanout;
wire rd_tic_2;
wire rd_tick_2;
wire rd_softint_2;
wire rd_tl_2;
wire rd_gl_2;
wire rd_pil_2;
wire rd_hintp_2;
wire rd_trl_2;
wire wr_int_rec_2;
wire wr_tick_2;
wire wr_set_softint_2;
wire wr_clear_softint_2;
wire wr_softint_2;
wire wr_pstate_2;
wire wr_tl_2;
wire wr_pil_2;
wire wr_hpstate_2;
wire wr_hintp_2;
wire wr_cerer_2;
wire wr_ceter_2;
wire wr_isfsr_2;
wire wr_dsfsr_2;
wire wr_dsfar_2;
wire wr_decr_2;
wire wr_lsu_ctl_2;
wire wr_tid_dec_lat_scanin;
wire wr_tid_dec_lat_scanout;
wire [47:0] mbist_tsa_wdata;
wire irl_any_cleared_in;
wire irl_any_cleared_lat_scanin;
wire irl_any_cleared_lat_scanout;
wire irl_any_cleared;
wire [7:0] tid_dec_3;
wire [64:0] data_3;
wire [7:0] tick_npt_in_;
wire tick_npt_inv_lat_scanin;
wire tick_npt_inv_lat_scanout;
wire tick_npt_2_;
wire tick_npt_3_inv_lat_scanin;
wire tick_npt_3_inv_lat_scanout;
wire tick_npt_3_;
wire [63:46] decr_reg_in;
wire decr_lat_scanin;
wire decr_lat_scanout;
wire rd_pct_2;
wire [64:0] trl_data;
wire [64:0] tsd_data;
wire [64:0] tba_htba_data;
wire [64:0] tsa_nopc_data;
wire [64:0] tsa_pc_data;
wire [64:0] tsa_ecc_data;
wire [64:0] tic_data_for_3;
wire [64:0] tick_data;
wire [64:0] pct_data;
wire [64:0] rngf_cdbus_2;
wire no_rd_3;
wire rd_trl_3;
wire rd_tsd_3;
wire rd_tba_htba_3;
wire rd_tic_3;
wire rd_pct_3;
wire [64:0] data_3_in;
wire rd_tca_diag_2;
wire rng_stg3_scanin;
wire rng_stg3_scanout;
wire tsa_wr_lat_scanin;
wire tsa_wr_lat_scanout;
wire rd_tca_diag_3;
wire wr_iqr_3;
wire check_ecc;
wire tsacu_in;
wire kill_write_if_error_in;
wire ecc_lat_scanin;
wire ecc_lat_scanout;
wire ptsacu;
wire kill_write_if_error;
wire tsac;
wire tsau;
wire tca_rd_addr_2_lat_scanin;
wire tca_rd_addr_2_lat_scanout;
wire [4:3] tca_rd_addr_2;
wire tca_rd_addr_3_lat_scanin;
wire tca_rd_addr_3_lat_scanout;
wire [4:3] tca_rd_addr_3;
wire tca_rd_addr_4_lat_scanin;
wire tca_rd_addr_4_lat_scanout;
wire [4:3] tca_rd_addr_4;
wire [64:0] rngf_cdbus_3;
wire [64:0] data_4_in;
wire error_4_in;
wire rng_stg4_scanin;
wire rng_stg4_scanout;
wire error_4_lat_scanin;
wire error_4_lat_scanout;
wire error_4;
wire [3:0] check_qr_exc_in;
wire check_qr_exc_lat_scanin;
wire check_qr_exc_lat_scanout;
wire [3:0] check_qr_exc;
wire error_inject_lat_scanin;
wire error_inject_lat_scanout;
wire error_enable;
wire error_tccu;
wire error_tsau;
wire [7:0] error_mask;
wire [7:0] write_lsu_ctl;
wire [7:0] hold_lsu_ctl;
wire [7:0] spec_enable_in;
wire [7:0] spec_enable;
wire spec_enable_lat_scanin;
wire spec_enable_lat_scanout;
wire [7:0] immu_enable_in;
wire [7:0] immu_enable;
wire immu_enable_lat_scanin;
wire immu_enable_lat_scanout;
wire spares_scanin;
wire spares_scanout;
wire rd_halt_2;
wire wr_halt_2;
wire [6:0] unused;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

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
input		mbd_compare;

input		error_inject_enable;
input		error_inject_tccu;
input		error_inject_tsau;
input	[7:0]	error_inject_mask;

input 	[64:0]	lsu_rngf_cdbus; 	// control/data bus from lsu

input	[48:2]	pct0_asi_data;
input	[48:2]	pct1_asi_data;

input   [16:0]	trl0_asi_data;
input   [16:0]	trl1_asi_data;

input	[7:0]	tlu_ceter_pscce;

input	[7:0]	tsd_hpstate_hpriv;
input	[7:0]	tsd_pstate_priv;
input	[1:0]	tsd0_asi_data;
input	[1:0]	tsd1_asi_data;
input	[15:0]	tel0_ecc;
input		tel0_tsac;
input		tel0_tsau;
input	[15:0]	tel1_ecc;
input		tel1_tsac;
input		tel1_tsau;

input 	[63:0]	tic_asi_data;
input	[7:0] cel_ecc;

input	[63:0]	cer_asi_data;

input		cel_tccp;
input		cel_tcup;

input	[64:0]	mmu_asi_data;		// ASI read data for fast bus
input		mmu_asi_read;		// Valid for MMU ASI read
input		mmu_asi_cecc;		// Correctable ECC error (stg 4)
input		mmu_asi_uecc;		// Uncorrectable ECC error (stg 4)

input	[7:0]	dfd_desr_f;
input	[7:0]	dfd_fesr_f;

input 	[7:0]	tlu_lsu_clear_ctl_reg_;

input	[3:0]	hver_mask_major_rev;	// An input to asi
input	[3:0]	hver_mask_minor_rev;	// An input to spc



output		wmr_scan_out;

output		scan_out;

output		asi_error_tccu;
output		asi_error_tsau;
output	[7:0]	asi_error_mask;

output	[4:0]	asi_tsa_rd_addr;
output		asi_tsa_rd_iqr_ecc;
output	[1:0]	asi_tsa_tid;
output	[7:0]	asi_rd_asireg;		
output	[7:0]	asi_wr_asireg;		
output		asi_rd_tick;		
output		asi_wr_tick;		
output	[7:0]	asi_rd_pc;
output	[7:0]	asi_wr_set_softint;
output	[7:0]	asi_wr_clear_softint;
output	[7:0]	asi_rd_softint;
output	[7:0]	asi_wr_softint;
output	[4:0]	asi_tca_addr;		// Used for [H][S]TICK_CMPR
output		asi_tca_addr_valid;
output		asi_tca_wr;
output	[1:0]	asi_wr_mondo_head;
output	[1:0]	asi_wr_mondo_tail;
output	[1:0]	asi_wr_device_head;
output	[1:0]	asi_wr_device_tail;
output	[1:0]	asi_wr_res_err_head;
output	[1:0]	asi_wr_res_err_tail;
output	[1:0]	asi_wr_nonres_err_head;
output	[1:0]	asi_wr_nonres_err_tail;
output	[1:0]	asi_rd_iqr_reg;
output	[2:0]	asi_rd_iqr;		// Read any interrupt queue reg
output	[1:0]	asi_rd_tpc;		// encoded TID for IQR read
output	[1:0]	asi_wr_tpc;
output	[1:0]	asi_rd_tnpc;
output	[1:0]	asi_wr_tnpc;
output	[1:0]	asi_rd_tstate;
output	[1:0]	asi_wr_tstate;
output	[1:0]	asi_rd_tt;
output	[1:0]	asi_wr_tt;
output	[7:0]	asi_wr_tba;
output	[7:0]	asi_wr_pstate;
output	[7:0]	asi_rd_tl;
output	[7:0]	asi_wr_tl;
output	[7:0]	asi_rd_pil;
output	[7:0]	asi_wr_pil;
output	[7:0]	asi_rd_gl;
output	[7:0]	asi_wr_gl;
output	[7:0]	asi_wr_hpstate;
output	[1:0]	asi_rd_htstate;
output	[1:0]	asi_wr_htstate;
output	[7:0]	asi_rd_hintp;
output	[7:0]	asi_wr_hintp;
output	[7:0]	asi_wr_htba;
output	[2:0]	asi_rd_h_pstate_tba;
output	[1:0]	asi_rd_tba_htba;
output	[1:0]	asi_rd_pstate_hpstate;
output  [1:0]	asi_preempt_trap;
output  [1:0]	asi_preempt_done_retry;
output	[1:0]	asi_rmw_tsa;

output	[7:0]	asi_wr_int_rec;		// Write Interrupt Receive Register
output		asi_wr_any_int_rec;	// Write any Interrupt Receive Register
output 	[7:0]	asi_rd_inc_vec_2;	// Update Interrupt Vector  Register
output 	[2:0]	asi_int_rec_mux_sel_in;
output 		asi_rd_int_rec;		// Read for any thread
output 		asi_rd_inc_vec;		// Read for any thread

output 	[7:0]	asi_check_qr_exc;	// Check for Interrupt Queue Register
					// head vs. tail mismatch

output		asi_tca_wr_data_63;	// stored negative active
output	[63:0] asi_wr_data_0;		// data to write
output	[62:0] asi_wr_data_1;		// data to write
output 		asi_tsd0_wr_data_12;
output 	[10:8]	asi_tsd0_wr_data_10_08;
output 	[5:0]	asi_tsd0_wr_data_05_00;
output 		asi_tsd1_wr_data_12;
output 	[10:8]	asi_tsd1_wr_data_10_08;
output 	[5:0]	asi_tsd1_wr_data_05_00;
output	[47:0] asi_tsa_wr_data;
output		asi_tsa_wr_data_npc_oor_va;
output		asi_tsa_wr_data_npc_nonseq;

output		asi_rd_cerer;
output		asi_rd_ceter;
output		asi_wr_cerer;
output	[2:0]	asi_ceter_tid;
output		asi_wr_ceter;

output	[2:0]	asi_rd_tid;
output		asi_rd_isfsr;
output		asi_rd_dsfsr;
output		asi_rd_dsfar;
output		asi_rd_desr;
output		asi_rd_fesr;
output	[7:0]	asi_wr_isfsr;
output	[7:0]	asi_wr_dsfsr;
output	[7:0]	asi_wr_dsfar;

output		asi_rd_iaw;
output	[1:0]	asi_wr_iaw;

output	[63:46]	asi_decr;

output		asi_ece_exc;		// Correctable ECC error on ASI rd/wr
output		asi_eue_exc;		// Uncorrectable ECC error on ASI rd/wr
output	[2:0]	asi_ecc_tid;		// TID for ECC error

output		asi_tsac;		// For DSFSR
output		asi_tsau;		
output	[1:0]	asi_tsacu;		// For killing TSA writes
output	[2:0]	asi_tsacu_tid;		

output	[7:0] asi_irl_cleared;	// Int_Received Reg had bits cleared

output		asi_rd_stage_1;		// Power management:  read in stage 1
output	[1:0]	asi_trl_pstate_en;	// Power management:  h/pstate flop
output		asi_stg1_en;		// Power management:  TCA wr data flop

output	[7:0]	asi_mbist_ecc_in;	// MBIST
output	[7:0]	asi_mbist_tsa_ecc_in;	// MBIST
output		asi_mbist_run;		// MBIST
output	[3:0]	asi_mbist_cmpsel;	// MBIST
output	[7:0]	asi_mbd_compare_data;	// MBIST
output		asi_mbd_sel_tsd0;	// MBIST
output		asi_mbd_sel_tsd1;	// MBIST
output		asi_mbd_sel_tic;	// MBIST
output	[4:0]	asi_mbist_addr;		// MBIST
output	[1:0]	asi_mbist_tsa_rd_en;	// MBIST
output	[1:0]	asi_mbist_tsa_wr_en;	// MBIST
output	[1:0]	asi_mbist_tel_en;	// MBIST

output		asi_tccup_in;
output		asi_tccud_in;

output	[7:0]	asi_immu_enable;
output	[7:0]	asi_spec_enable;

output	[7:0]	asi_halt;		
output	[7:0]	asi_clear_spu_trap_req;	

output	[7:0]	tlu_spec_enable;

output	[2:0]	tlu_tca_tid;		
output	[1:0]	tlu_tca_index;		// Index for precise TCA errors

output		tlu_mbi_tsa0_fail;	// MBIST
output		tlu_mbi_tsa1_fail;	// MBIST
output		tlu_mbi_tca_fail;	// MBIST

output	[64:0]	tlu_rngf_cdbus;		// 65 bit control/data bus 
					// 64    - ctl/data
					// 63    - valid/hole
					// 62    - ack
					// 61:60 - 00-ASI, 01-ASR, 10-PR,11-HPR
					// 59    - rd/wrx
					// 58:56 - Thread ID
					// 55:48 - ASI field
					// 47:0  - Virtual Address
output 		tlu_rngf_cdbus_error;



//////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;


tlu_asi_ctl_l1clkhdr_ctl_macro free_clken (
	.l2clk	(l2clk),
	.l1en 	(1'b1 ),
	.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
//
//  Power management
//

tlu_asi_ctl_msff_ctl_macro__width_1 pmen_lat  (
	.scan_in(pmen_lat_scanin),
	.scan_out(pmen_lat_scanout),
	.din	(lsu_tlu_pmen			),
	.dout	(pmen				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stg1_en_in =
       lsu_asi_clken;

tlu_asi_ctl_msff_ctl_macro__width_1 stg1_en_lat  (
	.scan_in(stg1_en_lat_scanin),
	.scan_out(stg1_en_lat_scanout),
	.din	(stg1_en_in			),
	.dout	(stg1_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_stg1_en =
       stg1_en;

assign stg2_en_in =
       (lsu_rngf_cdbus[64] & lsu_rngf_cdbus[63]) | 
       (~lsu_rngf_cdbus[64] & stg2_en) |
       ~pmen;

tlu_asi_ctl_msff_ctl_macro__width_1 stg2_en_lat  (
	.scan_in(stg2_en_lat_scanin),
	.scan_out(stg2_en_lat_scanout),
	.din	(stg2_en_in			),
	.dout	(stg2_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 stg3_en_lat  (
	.scan_in(stg3_en_lat_scanin),
	.scan_out(stg3_en_lat_scanout),
	.din	(stg2_en			),
	.dout	(stg3_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 stg4_en_lat  (
	.scan_in(stg4_en_lat_scanin),
	.scan_out(stg4_en_lat_scanout),
	.din	(stg3_en			),
	.dout	(pstg4_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// data_4[64] added to prevent stopping on control packet on MMU ITLB reload
assign stg4_en =
       pstg4_en | mmu_asi_read | data_4[64];

// Have to enable during mbist because the write data goes through
// the functional path
assign pm1_en =
       stg1_en | stg2_en | stg3_en | stg4_en | mbist_run;

tlu_asi_ctl_l1clkhdr_ctl_macro stg4_clken (
	.l2clk	(l2clk				),
	.l1en	(pm1_en				),
	.l1clk	(l1clk_pm1			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


assign pm2_en =
       mbist_run | ~pmen;

tlu_asi_ctl_l1clkhdr_ctl_macro mbist_clken (
	.l2clk	(l2clk				),
	.l1en	(pm2_en				),
	.l1clk	(l1clk_pm2			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
//
//  MBIST
//

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_run_lat 	(
	.scan_in(mbist_run_lat_scanin),
	.scan_out(mbist_run_lat_scanout),
	.din	(mbi_run			),
	.dout	(mbist_run			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbist_run =
       mbist_run;

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa0_write_lat  (
	.scan_in(mbist_tsa0_write_lat_scanin),
	.scan_out(mbist_tsa0_write_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tsa0_write_en		),
	.dout	(mbist_tsa0_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa1_write_lat  (
	.scan_in(mbist_tsa1_write_lat_scanin),
	.scan_out(mbist_tsa1_write_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tsa1_write_en		),
	.dout	(mbist_tsa1_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tca_write_lat  (
	.scan_in(mbist_tca_write_lat_scanin),
	.scan_out(mbist_tca_write_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tca_write_en		),
	.dout	(mbist_tca_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_5 mbist_addr_lat  (
	.scan_in(mbist_addr_lat_scanin),
	.scan_out(mbist_addr_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_addr		[4:0]	),
	.dout	(mbist_addr		[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign mbist_wdata[7:0] =
       data_1[7:0];

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa0_read_lat  (
	.scan_in(mbist_tsa0_read_lat_scanin),
	.scan_out(mbist_tsa0_read_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tsa0_read_en		),
	.dout	(mbist_tsa0_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa1_read_lat  (
	.scan_in(mbist_tsa1_read_lat_scanin),
	.scan_out(mbist_tsa1_read_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tsa1_read_en		),
	.dout	(mbist_tsa1_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tca_read_lat  (
	.scan_in(mbist_tca_read_lat_scanin),
	.scan_out(mbist_tca_read_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tca_read_en		),
	.dout	(mbist_tca_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_4 mbist_cmpsel_lat  (
	.scan_in(mbist_cmpsel_lat_scanin),
	.scan_out(mbist_cmpsel_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_tlu_cmpsel		[3:0]	),
	.dout	(mbist_cmpsel		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbist_ecc_in[7:0] =
       mbist_wdata[7:0] & {8 {mbist_run}};

assign asi_mbist_tsa_ecc_in[7:0] =
       mbist_wdata_2[7:0] & {8 {mbist_run}};

assign asi_mbist_addr[4:0] =
       mbist_addr[4:0];

assign asi_mbist_tsa_rd_en[1:0] =
       {2 {mbist_run}} & {mbist_tsa1_rd_en_2, mbist_tsa0_rd_en_2};

assign asi_mbist_tsa_wr_en[1:0] =
       {2 {mbist_run}} & {mbist_tsa1_wr_en, mbist_tsa0_wr_en};


tlu_asi_ctl_msff_ctl_macro__width_5 mbist_addr_2_lat  (
	.scan_in(mbist_addr_2_lat_scanin),
	.scan_out(mbist_addr_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_addr		[4:0]	),
	.dout	(mbist_addr_2		[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa0_read_2_lat  (
	.scan_in(mbist_tsa0_read_2_lat_scanin),
	.scan_out(mbist_tsa0_read_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa0_rd_en		),
	.dout	(mbist_tsa0_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa1_read_2_lat  (
	.scan_in(mbist_tsa1_read_2_lat_scanin),
	.scan_out(mbist_tsa1_read_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa1_rd_en		),
	.dout	(mbist_tsa1_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tca_read_2_lat  (
	.scan_in(mbist_tca_read_2_lat_scanin),
	.scan_out(mbist_tca_read_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tca_rd_en		),
	.dout	(mbist_tca_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_4 mbist_cmpsel_2_lat  (
	.scan_in(mbist_cmpsel_2_lat_scanin),
	.scan_out(mbist_cmpsel_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_cmpsel		[3:0]	),
	.dout	(mbist_cmpsel_2		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_8 mbist_wdata_2_lat  (
	.scan_in(mbist_wdata_2_lat_scanin),
	.scan_out(mbist_wdata_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_wdata		[7:0]	),
	.dout	(mbist_wdata_2		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbist_cmpsel[3:0] =
       mbist_cmpsel_2[3:0];


tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa0_read_3_lat  (
	.scan_in(mbist_tsa0_read_3_lat_scanin),
	.scan_out(mbist_tsa0_read_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa0_rd_en_2		),
	.dout	(mbist_tsa0_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa1_read_3_lat  (
	.scan_in(mbist_tsa1_read_3_lat_scanin),
	.scan_out(mbist_tsa1_read_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa1_rd_en_2		),
	.dout	(mbist_tsa1_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tca_read_3_lat  (
	.scan_in(mbist_tca_read_3_lat_scanin),
	.scan_out(mbist_tca_read_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tca_rd_en_2		),
	.dout	(mbist_tca_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_8 mbist_wdata_3_lat  (
	.scan_in(mbist_wdata_3_lat_scanin),
	.scan_out(mbist_wdata_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_wdata_2		[7:0]	),
	.dout	(mbist_wdata_3		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbist_tel_en[1:0] =
       {mbist_tsa1_rd_en_3, mbist_tsa0_rd_en_3} | 
       {2 {rd_tsa_pc_2 | rd_tsa_nopc_2 | rd_tsa_ecc_2 | 
	   rd_tsa_pc_3 | rd_tsa_nopc_3 | rd_tsa_ecc_3 ||
           wr_tsa_2    | wr_tsa_3 | ~pmen}};

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa0_read_4_lat  (
	.scan_in(mbist_tsa0_read_4_lat_scanin),
	.scan_out(mbist_tsa0_read_4_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa0_rd_en_3		),
	.dout	(mbist_tsa0_rd_en_4		),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 mbist_tsa1_read_4_lat  (
	.scan_in(mbist_tsa1_read_4_lat_scanin),
	.scan_out(mbist_tsa1_read_4_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_tsa1_rd_en_3		),
	.dout	(mbist_tsa1_rd_en_4		),
  .siclk(siclk),
  .soclk(soclk)
);

assign compare_data_in[7:0] =
       (mbist_wdata_2[7:0] & {8 {~mbist_tsa_3}}) | 
       (mbist_wdata_3[7:0] & {8 { mbist_tsa_3}}) ;

tlu_asi_ctl_msff_ctl_macro__width_8 compare_data_lat  (
	.scan_in(compare_data_lat_scanin),
	.scan_out(compare_data_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(compare_data_in	[7:0]	),
	.dout	(compare_data 		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbd_compare_data[7:0] =
       compare_data[7:0];

assign mbist_tsa_3 =
       mbist_tsa0_rd_en_3 | mbist_tsa1_rd_en_3;

assign asi_mbd_sel_tsd0 =
       mbist_tsa0_rd_en_4;

assign asi_mbd_sel_tsd1 =
       mbist_tsa1_rd_en_4;

assign asi_mbd_sel_tic =
       mbist_tca_rd_en_3;


assign tsa0_fail_in =
       mbist_tsa0_rd_en_4;

assign tsa1_fail_in =
       mbist_tsa1_rd_en_4;

assign tca_fail_in =
       mbist_tca_rd_en_3;

tlu_asi_ctl_msff_ctl_macro__width_1 tsa0_fail_lat  (
	.scan_in(tsa0_fail_lat_scanin),
	.scan_out(tsa0_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(tsa0_fail_in			),
	.dout	(tsa0_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 tsa1_fail_lat  (
	.scan_in(tsa1_fail_lat_scanin),
	.scan_out(tsa1_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(tsa1_fail_in			),
	.dout	(tsa1_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 tca_fail_lat  (
	.scan_in(tca_fail_lat_scanin),
	.scan_out(tca_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(tca_fail_in			),
	.dout	(tca_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 compare_lat  (
	.scan_in(compare_lat_scanin),
	.scan_out(compare_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbd_compare			),
	.dout	(compare			),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_mbi_tsa0_fail =
       tsa0_fail & ~compare;

assign tlu_mbi_tsa1_fail =
       tsa1_fail & ~compare;

assign tlu_mbi_tca_fail =
       tca_fail & ~compare;



//////////////////////////////////////////////////////////////////////////////
//STAGE 0
//////////////////////////////////////////////////////////////////////////////
// Decode preempt_trap/_done_retry so that read controls can go to TSA in 
// cycle 1
// so read can occur in cycle 2
// so ECC error detect can occur in cycle 3
// so packet can transmit in cycle 4

assign ctl_0 =
       lsu_rngf_cdbus[64];

assign data_0[63:48] =
       lsu_rngf_cdbus[63:48];
assign data_0_59_unused =
       data_0[59];
assign data_0_57_unused =
       data_0[57];
assign data_0_56_unused =
       data_0[56];

assign asi_0 = 
	ctl_0 & data_0[63] & ~data_0[62] & (data_0[61:60] == 2'b00);
assign pr_0 = 
	ctl_0 & data_0[63] & ~data_0[62] &  data_0[61] & ~data_0[60];
assign hpr_0 = 
	ctl_0 & data_0[63] & ~data_0[62] & (data_0[61:60] == 2'b11);

// Any PR between 0 and 3 (field is 5 bits)
assign pr_tstack_0 = 
	pr_0 & (data_0[52:50] == 3'b000);

// Note that write to GL must preempt trap because EXU cannot handle 
// multiple GL updates
assign wr_gl_0 = 
	pr_0 & data_0[52] & ~data_0[59];

// HPR is 1, not 0, 3, 5, 6, or 1F
assign htstate_0 = 
	hpr_0 & ~data_0[50] & ~data_0[49] &  data_0[48];

// All queue registers are ASI 25
assign asi_25_0 =
       asi_0 & (data_0[55:48] == 8'h25);

// TSA diagnostic ECC read at ASI 0x5B
assign tsa_diag_0 =
       asi_0 & (data_0[55:48] == 8'h5b);

// The following require access to the trap stack array (TSA)
// Even writes require a read, so block done and retry for both
assign preempt_done_retry_in[1:0] =
       ({2 {pr_tstack_0 | wr_gl_0 | htstate_0 | asi_25_0 | tsa_diag_0}} &
        {data_0[58], ~data_0[58]}) | 
       {2 {mbist_run}};

// Need to preempt traps on writes to GL reg
// but these are held two cycles now so delay by two cycles
assign preempt_trap_in[1:0] =
       {2 {wr_gl_2}} & {data_2[58], ~data_2[58]};

tlu_asi_ctl_msff_ctl_macro__width_4 preempt_trap_lat  (
	.scan_in(preempt_trap_lat_scanin),
	.scan_out(preempt_trap_lat_scanout),
	.din	({preempt_trap_in	[1:0],
		  preempt_done_retry_in	[1:0]}),
	.dout	({preempt_trap		[1:0],
		  preempt_done_retry	[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_preempt_trap[1:0] = 
       preempt_trap[1:0];
assign asi_preempt_done_retry[1:0] = 
       preempt_done_retry[1:0];


//
// Handle fatal deferred and disrupting error registers
//

assign sel_lsu =
       ~rd_clesr & ~rd_clfesr;

assign clesr_data[63:0] =
       {dfd_desr_f[7], dfd_fesr_f[7],
	dfd_desr_f[6], dfd_fesr_f[6],
	dfd_desr_f[5], dfd_fesr_f[5],
	dfd_desr_f[4], dfd_fesr_f[4],
	dfd_desr_f[3], dfd_fesr_f[3],
	dfd_desr_f[2], dfd_fesr_f[2],
	dfd_desr_f[1], dfd_fesr_f[1],
	dfd_desr_f[0], dfd_fesr_f[0],
	{48 {1'b0}}};

assign clfesr_in[63:48] =
       ({16 {~(| clfesr_data[63:48])}} & clesr_data [63:48]) |
       ({16 { (| clesr_data [63:48])}} & clfesr_data[63:48]) ;
assign clfesr_in[47:0] =
       {48 {1'b0}};

tlu_asi_ctl_msff_ctl_macro__width_16 clfesr_lat  ( // FS:wmr_protect
	.scan_in(clfesr_lat_wmr_scanin),
	.scan_out(clfesr_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(clfesr_in		[63:48]	),
	.dout	(clfesr_data		[63:48]	),
  .l1clk(l1clk),
  .soclk(soclk)
);


assign data_1_in[63:0] =
       ({64 {mbist_run}} & {8 {mbi_wdata[7:0]}}) |
       ({64 {sel_lsu  & ~mbist_run}} & lsu_rngf_cdbus	[63:0]) |
       ({64 {rd_clesr & ~mbist_run}} & clesr_data	[63:0]) |
       ({64 {rd_clfesr& ~mbist_run}} & clfesr_in	[63:0]) ;


assign asi_int_rec_mux_sel_in[2:0] =
       data_1        [58:56];



/////////////////////////////////////////////////////////////////////
//STAGE 1
/////////////////////////////////////////////////////////////////////
// Stage the packet coming on the ring
// First cycle of the packet holds control and address information
// Second cycle holds the store/load data

tlu_asi_ctl_msff_ctl_macro__width_64 rng_stg1_data  (
	.scan_in(rng_stg1_data_scanin),
	.scan_out(rng_stg1_data_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(data_1_in		[63:0]	), 
	.dout	(data_1			[63:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// register control bit, bit 64 indicates whether ctl packet or data packet
tlu_asi_ctl_msff_ctl_macro__width_1 ctl_1_lat  (
	.scan_in(ctl_1_lat_scanin),
	.scan_out(ctl_1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(lsu_rngf_cdbus		[64   ]	),
	.dout	(ctl_1				),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_stage_1 =
       ctl_1 & data_1[59];

assign asi_rd_stage_1 =
       rd_stage_1;


// decode the packet

tlu_asi_ctl_msff_ctl_macro__width_8 hpstatehpriv_lat  (
	.scan_in(hpstatehpriv_lat_scanin),
	.scan_out(hpstatehpriv_lat_scanout),
	.din	(tsd_hpstate_hpriv	[7:0]	),
	.dout	(hpstatehpriv		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_8 pstatepriv_lat  (
	.scan_in(pstatepriv_lat_scanin),
	.scan_out(pstatepriv_lat_scanout),
	.din	(tsd_pstate_priv	[7:0]	),
	.dout	(pstatepriv		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign hpstate_hpriv = 
       (| (hpstatehpriv[7:0] & rd_tid_dec[7:0]));

assign pstate_priv = 
       (| (pstatepriv[7:0] & rd_tid_dec[7:0])) | hpstate_hpriv;

assign asi = 
	ctl_1 & data_1[63] & ~data_1[62] & (data_1[61:60] == 2'b00);
assign asr = 
	ctl_1 & data_1[63] & ~data_1[62] & (data_1[61:60] == 2'b01);
assign pr = 
	ctl_1 & data_1[63] & ~data_1[62] & (data_1[61:60] == 2'b10);
assign hpr = 
	ctl_1 & data_1[63] & ~data_1[62] & (data_1[61:60] == 2'b11);

assign asi_2 = 
	ctl_2 & data_2[63] & ~data_2[62] & (data_2[61:60] == 2'b00);
assign asr_2 = 
	ctl_2 & data_2[63] & ~data_2[62] & (data_2[61:60] == 2'b01);
assign pr_2 = 
	  ctl_2 & data_2[63] & ~data_2[62] & (data_2[61:60] == 2'b10);
assign hpr_2 = 
	  ctl_2 & data_2[63] & ~data_2[62] & (data_2[61:60] == 2'b11);

assign fast_asi =
       ~data_1[61] & ~data_1[60];	

assign superfast_hpr_2 =
       data_2[60];		

assign mondo_head =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h0);
assign rd_mondo_head =
       mondo_head &  data_1[59];
assign wr_mondo_head =
       mondo_head & ~data_1[59];

assign mondo_tail =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h1);
assign rd_mondo_tail =
       mondo_tail &  data_1[59];
assign wr_mondo_tail =
       mondo_tail & ~data_1[59];

assign device_head =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h2);
assign rd_device_head =
       device_head &  data_1[59];
assign wr_device_head =
       device_head & ~data_1[59];

assign device_tail =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h3);
assign rd_device_tail =
       device_tail &  data_1[59];
assign wr_device_tail =
       device_tail & ~data_1[59];

assign res_err_head =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h4);
assign rd_res_err_head =
       res_err_head &  data_1[59];
assign wr_res_err_head =
       res_err_head & ~data_1[59];

assign res_err_tail =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h5);
assign rd_res_err_tail =
       res_err_tail &  data_1[59];
assign wr_res_err_tail =
       res_err_tail & ~data_1[59];

assign nonres_err_head =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h6);
assign rd_nonres_err_head =
       nonres_err_head &  data_1[59];
assign wr_nonres_err_head =
       nonres_err_head & ~data_1[59];

assign nonres_err_tail =
       asi & (data_1[55:48] == 8'h25) & (data_1[5:3] == 3'h7);
assign rd_nonres_err_tail =
       nonres_err_tail &  data_1[59];
assign wr_nonres_err_tail =
       nonres_err_tail & ~data_1[59];

// Shadow copy of spec enable and IMMU enable bits in LSU control reg
// Only support write; LSU handles read
assign lsu_ctl = 
       asi & (data_1[55:48] == 8'h45) & ~data_1[4] & ~data_1[3];
assign wr_lsu_ctl =
       lsu_ctl & ~data_1[59];

// DECR (only one per physical core)
assign decr = 
       asi & (data_1[55:48] == 8'h45) & ~data_1[4] & data_1[3];
assign rd_decr =
       decr &  data_1[59];
assign wr_decr =
       decr & ~data_1[59];

// DESR, FESR
assign esr =
       asi & (data_1[55:48] == 8'h4c);
assign desr =
       esr &  (data_1[5:3] == 3'b000);
assign rd_desr =
       desr &  data_1[59];
assign fesr =
       esr &  (data_1[5:3] == 3'b001);
assign rd_fesr =
       fesr &  data_1[59];
assign clesr =
       esr &  (data_1[5:3] == 3'b100);
assign rd_clesr =
       clesr &  data_1[59];
assign clfesr =
       esr &  (data_1[5:3] == 3'b101);
assign rd_clfesr =
       clfesr &  data_1[59];

assign cerer =
       esr & (data_1[5:3] == 3'b010);
assign rd_cerer =
       cerer &  data_1[59];
assign wr_cerer =
       cerer & ~data_1[59];

assign ceter =
       esr & (data_1[5:3] == 3'b011);
assign rd_ceter =
       ceter &  data_1[59];
assign wr_ceter =
       ceter & ~data_1[59];

// ISFSR at 0x50/0x18
// instruction_va_watchpoint at 0x50/0x38
assign isfsr =
       asi & (data_1[55:48] == 8'h50) & (data_1[5:3] == 3'b011);
assign rd_isfsr =
       isfsr &  data_1[59];
assign wr_isfsr =
       isfsr & ~data_1[59];

assign iaw_2 =
       asi_2 & (data_2[55:48] == 8'h50) & (data_2[5:3] == 3'b111);
assign rd_iaw_2 =
       iaw_2 &  data_2[59];
assign wr_iaw_2 =
       iaw_2 & ~data_2[59];

// DSFSR at 0x58/0x18, DSFAR at 0x20
assign dsfsr =
       asi & (data_1[55:48] == 8'h58) & (data_1[5:3] == 3'b011);
assign rd_dsfsr =
       dsfsr &  data_1[59];
assign wr_dsfsr =
       dsfsr & ~data_1[59];
assign dsfar =
       asi & (data_1[55:48] == 8'h58) & (data_1[5:3] == 3'b100);
assign rd_dsfar =
       dsfar &  data_1[59];
assign wr_dsfar =
       dsfar & ~data_1[59];

// Tick compare array ECC / data access at 0x5A/0x00-0x38
assign tca_diag =
       asi & (data_1[55:48] == 8'h5a);
assign rd_tca_ecc =
       tca_diag & ~data_1[5] &  data_1[59];
assign rd_tca_data =
       tca_diag &  data_1[5] &  data_1[59];

// TSA ECC access at 0x5B/0x00-0x18
assign tsa_diag =
       asi & (data_1[55:48] == 8'h5b);
assign rd_tsa_ecc =
       tsa_diag & ~data_1[6] &  data_1[59];

assign int_rec =
       asi & (data_1[55:48] == 8'h72);
assign rd_int_rec =
       int_rec &  data_1[59];
assign wr_int_rec =
       int_rec & ~data_1[59];

assign inc_vec =
       asi & (data_1[55:48] == 8'h74);
assign rd_inc_vec =
       inc_vec &  data_1[59];


assign asireg_2 = 
       asr_2 & (data_2[55:48] == 8'h03);
assign rd_asireg_2 = 
       asireg_2 &  data_2[59];
assign wr_asireg_2 = 
       asireg_2 & ~data_2[59];

// Covers ASR tick, PR tick, and ASR stick
assign tick = 
	((asr | pr) & (data_1[55:48] == 8'h04)) |
	(asr & (data_1[55:48] == 8'h18));
assign rd_tick = 
	tick &  data_1[59] &  (hpstate_hpriv | pstate_priv | tick_npt_1_);
assign priv_action = 
	tick &  data_1[59] & ~(hpstate_hpriv | pstate_priv | tick_npt_1_);
assign wr_tick = 
	tick & ~data_1[59] & hpstate_hpriv;
assign tick_npt_1_ =
       | (tick_npt_[7:0] & rd_tid_dec[7:0]);

assign pc_2 = 
	asr_2 & (data_2[55:48] == 8'h05);
assign rd_pc_2 = 
	pc_2 &  data_2[59];

assign set_softint = 
	asr & (data_1[55:48] == 8'h14);
assign wr_set_softint = 
	set_softint & ~data_1[59];

assign clear_softint = 
	asr & (data_1[55:48] == 8'h15);
assign wr_clear_softint = 
	clear_softint & ~data_1[59];

assign softint = 
	asr & (data_1[55:48] == 8'h16);
assign rd_softint = 
	softint &  data_1[59];
assign wr_softint = 
	softint & ~data_1[59];

assign tick_cmpr = 
	asr & (data_1[55:48] == 8'h17);
assign rd_tick_cmpr = 
	tick_cmpr &  data_1[59];
assign wr_tick_cmpr = 
	tick_cmpr & ~data_1[59];

// ASR stick covered by tick

assign stick_cmpr = 
	asr & (data_1[55:48] == 8'h19);
assign rd_stick_cmpr = 
	stick_cmpr &  data_1[59] & pstate_priv;
assign wr_stick_cmpr = 
	stick_cmpr & ~data_1[59] & pstate_priv;

assign tpc = 
	pr & (data_1[55:48] == 8'h00);
assign rd_tpc = 
	tpc	&  data_1[59];
assign wr_tpc = 
	tpc 	& ~data_1[59];

assign tnpc = 
	pr & (data_1[55:48] == 8'h01);
assign rd_tnpc = 
	tnpc	&  data_1[59];
assign wr_tnpc =
	tnpc 	& ~data_1[59];

assign tstate = 
	pr & (data_1[55:48] == 8'h02);
assign rd_tstate = 
	tstate	&  data_1[59];
assign wr_tstate =
	tstate 	& ~data_1[59];

assign tt = 
	pr & (data_1[55:48] == 8'h03);
assign rd_tt = 
	tt	&  data_1[59];
assign wr_tt =
	tt 	& ~data_1[59];

// tick as PR 0x04 is covered in ASR section

assign tba_2 = 
	pr_2 & (data_2[55:48] == 8'h05);
assign rd_tba_2 = 
	tba_2	&  data_2[59];
assign wr_tba_2 =
	tba_2 	& ~data_2[59];

assign pstate = 
	pr & (data_1[55:48] == 8'h06);
assign wr_pstate = 
	pstate & ~data_1[59];
assign pstate_2 = 
	pr_2 & (data_2[55:48] == 8'h06);
assign rd_pstate_2 = 
	pstate_2 &  data_2[59];

assign tl = 
	pr & (data_1[55:48] == 8'h07);
assign rd_tl = 
	tl	&  data_1[59];
assign wr_tl = 
	tl	& ~data_1[59];

assign pil = 
	pr & (data_1[55:48] == 8'h08);
assign rd_pil = 
	pil	&  data_1[59];
assign wr_pil = 
	pil	& ~data_1[59];

assign gl = 
	pr & (data_1[55:48] == 8'h10);
assign rd_gl = 
	gl	&  data_1[59];
assign wr_gl = 
	gl	& ~data_1[59];

assign hpstate = 
	hpr & (data_1[55:48] == 8'h00);
assign wr_hpstate = 
	hpstate & ~data_1[59];
assign hpstate_2 = 
	hpr_2 & (data_2[55:48] == 8'h00);
assign rd_hpstate_2 = 
	hpstate_2 &  data_2[59];

assign htstate = 
	hpr & (data_1[55:48] == 8'h01);
assign rd_htstate = 
	htstate &  data_1[59];
assign wr_htstate = 
	htstate & ~data_1[59];

assign hintp = 
	hpr & (data_1[55:48] == 8'h03);
assign rd_hintp = 
	hintp &  data_1[59];
assign wr_hintp = 
	hintp & ~data_1[59];

assign htba_2 = 
	hpr_2 & (data_2[55:48] == 8'h05);
assign rd_htba_2 = 
	htba_2 &  data_2[59];
assign wr_htba_2 = 
	htba_2 & ~data_2[59];

assign hver = 
	hpr & (data_1[55:48] == 8'h06);
assign rd_hver = 
	hver &  data_1[59];

assign rd_halt = 
	hpr & (data_1[55:48] == 8'h1e) &  data_1[59];
assign wr_halt = 
	hpr & (data_1[55:48] == 8'h1e) & ~data_1[59];

assign hstick_cmpr = 
	hpr & (data_1[55:48] == 8'h1f);
assign rd_hstick_cmpr = 
	hstick_cmpr &  data_1[59];
assign wr_hstick_cmpr = 
	hstick_cmpr & ~data_1[59];


// address to send to TSA
assign fast_tsa_rd_iqr =
       fast_asi &  data_1[48];
assign fast_rd_tsa_ecc =
       fast_asi & ~data_1[48];
 
assign fast_tsa_rd_iqr_res_nonres =
       fast_tsa_rd_iqr & data_1[5];

assign asi_tsa_rd_iqr_ecc =
       fast_asi | mbist_run;

assign asi_tsa_tid[1:0] =
       data_1[57:56];

assign asi_tsa_rd_addr[4:0] =
       ({5 {~mbist_run}} & 
	{data_1[57:56],
       	 ({3 {fast_tsa_rd_iqr & ~fast_rd_tsa_ecc}} & 3'b110) |
       	 ({3 {fast_tsa_rd_iqr_res_nonres & ~fast_rd_tsa_ecc}} & 3'b111) |
       	 ({3 {                   fast_rd_tsa_ecc}} & data_1[5:3])}) |
       ({5 {mbist_run}} & mbist_addr_2[4:0]) ;


assign rd_tca = 
       rd_tick_cmpr | rd_stick_cmpr | rd_hstick_cmpr | rd_tca_ecc | rd_tca_data;
assign wr_tca = 
       wr_tick_cmpr | wr_stick_cmpr | wr_hstick_cmpr;

// Hold TCA read address for RAS
assign tca_rd_addr[4] =
       rd_hstick_cmpr;
assign tca_rd_addr[3] =
       rd_stick_cmpr;

assign tca_addr[4] =
       tca_rd_addr[4] | wr_hstick_cmpr_2 | (tca_diag & data_1[4]);
assign tca_addr[3] =
       tca_rd_addr[3]  | wr_stick_cmpr_2 | (tca_diag & data_1[3]);
assign tca_addr[2:0] =
       (data_1[58:56] & {3 {rd_tca  }}) |
       (data_2[58:56] & {3 {wr_tca_2}}) ;

assign asi_tca_addr[4:0] =
       ({5 {~mbist_run}} &   tca_addr[4:0]) |
       ({5 { mbist_run}} & mbist_addr[4:0]) ;
	       
assign asi_tca_addr_valid =
       rd_tca | wr_tca_2 | mbist_run;
assign asi_tca_wr =
       (wr_tca_2 & ~mbist_run) | (mbist_tca_wr_en & mbist_run);


assign rd_tid_dec	[7:0] = 
       { data_1[58] &  data_1[57] &  data_1[56], 
         data_1[58] &  data_1[57] & ~data_1[56], 
         data_1[58] & ~data_1[57] &  data_1[56], 
         data_1[58] & ~data_1[57] & ~data_1[56], 
        ~data_1[58] &  data_1[57] &  data_1[56], 
        ~data_1[58] &  data_1[57] & ~data_1[56], 
        ~data_1[58] & ~data_1[57] &  data_1[56], 
        ~data_1[58] & ~data_1[57] & ~data_1[56]};

// For tlu_ras_ctl and tlu_dfd_dp
assign asi_rd_tid[2:0] = 
       data_1[58:56];

// These are stored in the TSA
assign rd_tsa_nopc =
       rd_tstate | rd_tt | rd_htstate | 
       rd_mondo_head | rd_mondo_tail | 
       rd_device_head | rd_device_tail |
       rd_res_err_head | rd_res_err_tail | 
       rd_nonres_err_head | rd_nonres_err_tail;
assign rd_tsa_pc =
       rd_tpc | rd_tnpc;

assign wr_tsa_2 =
       wr_tstate_2 | wr_tt_2 | wr_htstate_2 | 
       wr_mondo_head_2 | wr_mondo_tail_2 | 
       wr_device_head_2 | wr_device_tail_2 |
       wr_res_err_head_2 | wr_res_err_tail_2 | 
       wr_nonres_err_head_2 | wr_nonres_err_tail_2 |
       wr_tpc_2 | wr_tnpc_2;

assign wr_tsa_3 =
       wr_tstate_3 | wr_tt_3 | wr_htstate_3 | 
       wr_mondo_head_3 | wr_mondo_tail_3 | 
       wr_device_head_3 | wr_device_tail_3 |
       wr_res_err_head_3 | wr_res_err_tail_3 | 
       wr_nonres_err_head_3 | wr_nonres_err_tail_3 |
       wr_tpc_3 | wr_tnpc_3;
// 
// no rd_iqr[2:0] for mondo/res head
// rd_iqr[2] for device/nonres head
// rd_iqr[1] for mondo/res tail
// rd_iqr[0] for device/nonres tail
assign rd_iqr_2[2] =
       rd_device_head_2     | rd_nonres_err_head_2 ;
assign rd_iqr_2[1] =
       rd_mondo_tail_2      | rd_res_err_tail_2    ;
assign rd_iqr_2[0] =
       rd_device_tail_2     | rd_nonres_err_tail_2 ;

assign rd_iqr_reg_2 = 
       rd_nonres_err_tail_2 | rd_nonres_err_head_2 | 
       rd_res_err_tail_2    | rd_res_err_head_2    |
       rd_device_tail_2     | rd_device_head_2     |
       rd_mondo_tail_2      | rd_mondo_head_2      ;
// These are flopped in TSD before use
assign asi_rd_iqr		[2:0] =
       rd_iqr_2			[2:0];
assign asi_rd_tpc		[1:0] = 
       {2 {rd_tpc_2}}			& {data_2[58], ~data_2[58]};
assign asi_rd_tnpc		[1:0] = 
       {2 {rd_tnpc_2}}			& {data_2[58], ~data_2[58]};
assign asi_rd_tstate		[1:0] = 
       {2 {rd_tstate_2}}		& {data_2[58], ~data_2[58]};
assign asi_rd_tt		[1:0] = 
       {2 {rd_tt_2}}			& {data_2[58], ~data_2[58]};
assign asi_rd_htstate		[1:0] = 
       {2 {rd_htstate_2}}		& {data_2[58], ~data_2[58]};
assign asi_rd_iqr_reg		[1:0] = 
       {2 {rd_iqr_reg_2}}		& {data_2[58], ~data_2[58]};

assign asi_rd_cerer =
       rd_cerer_2;
assign asi_rd_ceter =
       rd_ceter_2;
assign asi_rd_int_rec =
       rd_int_rec;
assign asi_rd_inc_vec =
       rd_inc_vec;
assign asi_rd_inc_vec_2[7:0] =
	{8 {rd_inc_vec_2}}	&  wr_tid_dec[7:0];
assign asi_rd_asireg[7:0] = 
	{8 {rd_asireg_2}}	&  wr_tid_dec[7:0];
assign asi_rd_tick          = 
       rd_tick_3  		                    ;
assign asi_rd_pc[7:0] = 
       {8 {rd_pc_2}} & wr_tid_dec[7:0];
assign asi_rd_iaw = 
       rd_iaw_2;
assign asi_rd_isfsr	=
       rd_isfsr;
assign asi_rd_dsfsr	=
       rd_dsfsr;

assign asi_rd_h_pstate_tba	[2:0] =
	{superfast_hpr_2, data_2[57:56]};
assign asi_rd_tba_htba		[1:0]	=
       {2 {rd_tba_2 | rd_htba_2}} & {data_2[58], ~data_2[58]};
assign asi_rd_pstate_hpstate	[1:0]	=
       {2 {rd_pstate_2 | rd_hpstate_2}} & {data_2[58], ~data_2[58]};

assign rd_cth =
       rd_int_rec | rd_inc_vec;

assign rd_trl = 
       rd_tl | rd_pil | rd_gl | rd_softint | rd_hintp;

assign rd_tic = 
       rd_tick_cmpr | rd_stick_cmpr | rd_hstick_cmpr;

assign rd_tsd_2 = 
       rd_asireg_2 | rd_pstate_2 | rd_hpstate_2;

assign rd_tba_htba_2 =
       rd_tba_2 | rd_htba_2;

assign rmw_tsa_in[1:0] =
       {2 {wr_tpc | wr_tnpc | wr_tstate | wr_tt | wr_htstate |
	   wr_mondo_head | wr_mondo_tail | wr_device_head | wr_device_tail |
	   wr_res_err_head | wr_res_err_tail | 
	   wr_nonres_err_head | wr_nonres_err_tail}} & 
       {data_1[58], ~data_1[58]} & {2 {~data_1[59]}};

assign asi_rmw_tsa[1:0] =
       rmw_tsa_in[1:0];
				  

// HVER read
// Bits    Field   Contents
// 63:48   manuf   0x003E
// 47:32   impl    0x0024
// 31:24   mask    1
// 23:19   rsvd0   0
// 18:16   maxgl   0x3
// 15:8    maxtl   0x6
// 7:5     rsvd1   0
// 4:0     maxwin  0x7
assign hver_value[63:0] =
       {32'h003e0024, hver_mask_major_rev[3:0], hver_mask_minor_rev[3:0], 
	24'h030607};


// Bit 63 is stored negative active
assign tic_ecc[63:0] =
       { {56 {1'b0}}, cel_ecc[7:0]};
assign data_err_1[63:0] = 
	{data_1[63],
	 data_1[62] | priv_action,
	 data_1[61:56],
	 (data_1[55:48] & ~{8 {priv_action}}) | {{6 {1'b0}}, priv_action, 1'b0},
	 data_1[47:0]};
assign decr_data[63:0] =
	{decr_reg[63:46], {46 {1'b0}}};

// Map of how the various registers get merged into the ASI bus in DFD,CTH,CER
// cer_asi_data	63:48 47:41	40:37	36:19	18:0
// cth_asi_data	63:48 47:41	40:37	36:19	18:0
// dfd_asi_data	63:48 47:41	40:37	36:19	18:0
// dsfar	63:48 47:41	40:37	36:19	18:0
// fesr		       6:0
// desr					        18:0
// dsfsr/{0,isfsr}	         3:0
assign dsfar_data[63:0] =
       {{16 {1'b0}}, cer_asi_data[47:0]};
assign fesr_data[63:0] =
       {{2 {1'b0}}, cer_asi_data[47:41], {55 {1'b0}}};
assign desr_data[63:0] =
       {cer_asi_data[18:11], {45 {1'b0}}, cer_asi_data[10:0]};
assign isfsr_data[63:0] =
       { {61 {1'b0}}, cer_asi_data[39:37]};
assign dsfsr_data[63:0] =
       { {60 {1'b0}}, cer_asi_data[40:37]};
			

assign sel_data1 =
       ~priv_action   & ~rd_hver_2     & ~rd_cth_2   & 
       ~rd_cerer_2 &  
       ~rd_tca_ecc_2  & ~rd_tca_data_2 & ~rd_ceter_2 & 
       ~rd_desr_2 & ~rd_fesr_2 & ~rd_dsfar_2 & 
       ~rd_isfsr_2    & ~rd_dsfsr_2    & ~rd_decr_2  ;

assign data_2_in[63:0] =
       ({64 {sel_data1    }} & data_1		[63:0]) |
       ({64 {priv_action  }} & data_err_1	[63:0]) |
       ({64 {rd_hver_2    }} & hver_value	[63:0]) |
       ({64 {rd_cth_2     }} & cer_asi_data	[63:0]) |
       ({64 {rd_cerer_2   }} & cer_asi_data	[63:0]) |
       ({64 {rd_tca_ecc_2 }} & tic_ecc		[63:0]) |
       ({64 {rd_tca_data_2}} & tic_data		[63:0]) |
       ({64 {rd_ceter_2	  }} & cer_asi_data	[63:0]) |
       ({64 {rd_desr_2    }} & desr_data	[63:0]) |
       ({64 {rd_fesr_2    }} & fesr_data	[63:0]) |
       ({64 {rd_dsfar_2   }} & dsfar_data	[63:0]) |
       ({64 {rd_isfsr_2	  }} & isfsr_data	[63:0]) |
       ({64 {rd_dsfsr_2	  }} & dsfsr_data	[63:0]) |
       ({64 {rd_decr_2	  }} & decr_data	[63:0]) ;
        

/////////////////////////////////////////////////////////////////////
//STAGE 2
/////////////////////////////////////////////////////////////////////
// pipe the packets and decoded control information
tlu_asi_ctl_msff_ctl_macro__width_64 stg2_data_lat  (
	.scan_in(stg2_data_lat_scanin),
	.scan_out(stg2_data_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(data_2_in		[63:0]	), 
	.dout	(data_2			[63:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// register control bit
tlu_asi_ctl_msff_ctl_macro__width_72 stg2_ctl_lat  (
	.scan_in(stg2_ctl_lat_scanin),
	.scan_out(stg2_ctl_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({ctl_1, 
		  rd_cth,
		  rd_tsa_pc,
		  rd_tsa_ecc,
		  rd_tsa_nopc,
		  rd_hver,
		  rd_tic,
		  rd_tca_ecc,
		  rd_tca_data,
		  rd_tick,
		  rd_mondo_head,
		  rd_mondo_tail,
		  rd_device_head,
		  rd_device_tail,
		  rd_res_err_head,
		  rd_res_err_tail,
		  rd_nonres_err_head,
		  rd_nonres_err_tail,
		  rd_tpc,
		  rd_tnpc,
		  rd_tstate,
		  rd_tt,
		  rd_htstate,
		  rd_ceter,
		  rd_inc_vec,
		  rd_decr,
		  rd_softint,
		  rd_tl,
		  rd_gl,
		  rd_pil,
		  rd_hintp,
		  rd_trl,
		  rd_cerer,
		  rd_isfsr,
		  rd_dsfsr,
		  rd_dsfar,
		  rd_desr,
		  rd_fesr,
		  wr_mondo_head,
		  wr_mondo_tail,
		  wr_device_head,
		  wr_device_tail,
		  wr_res_err_head,
		  wr_res_err_tail,
		  wr_nonres_err_head,
		  wr_nonres_err_tail,
		  wr_int_rec,
		  wr_tick,
		  wr_set_softint,
		  wr_clear_softint,
		  wr_softint,
		  wr_tpc,
		  wr_tnpc,
		  wr_tstate,
		  wr_tt,
		  wr_pstate,
		  wr_tl, 
		  wr_pil, 
		  wr_gl,
		  wr_hpstate,
		  wr_htstate,
		  wr_hintp,
		  wr_tca,
		  wr_hstick_cmpr,
		  wr_stick_cmpr,
		  wr_cerer,
		  wr_ceter,
		  wr_isfsr,
		  wr_dsfsr,
		  wr_dsfar,
		  wr_decr,
		  wr_lsu_ctl}),
	.dout	({ctl_2,
		  rd_cth_2,
		  rd_tsa_pc_2,
		  rd_tsa_ecc_2,
		  rd_tsa_nopc_2,
		  rd_hver_2,
		  rd_tic_2,
		  rd_tca_ecc_2,
		  rd_tca_data_2,
		  rd_tick_2,
		  rd_mondo_head_2,
		  rd_mondo_tail_2,
		  rd_device_head_2,
		  rd_device_tail_2,
		  rd_res_err_head_2,
		  rd_res_err_tail_2,
		  rd_nonres_err_head_2,
		  rd_nonres_err_tail_2,
		  rd_tpc_2,
		  rd_tnpc_2,
		  rd_tstate_2,
		  rd_tt_2,
		  rd_htstate_2,
		  rd_ceter_2,
		  rd_inc_vec_2,
		  rd_decr_2,
		  rd_softint_2,
		  rd_tl_2,
		  rd_gl_2,
		  rd_pil_2,
		  rd_hintp_2,
		  rd_trl_2,
		  rd_cerer_2,
		  rd_isfsr_2,
		  rd_dsfsr_2,
		  rd_dsfar_2,
		  rd_desr_2,
		  rd_fesr_2,
		  wr_mondo_head_2,
		  wr_mondo_tail_2,
		  wr_device_head_2,
		  wr_device_tail_2,
		  wr_res_err_head_2,
		  wr_res_err_tail_2,
		  wr_nonres_err_head_2,
		  wr_nonres_err_tail_2,
		  wr_int_rec_2,
		  wr_tick_2,
		  wr_set_softint_2,
		  wr_clear_softint_2,
		  wr_softint_2,
		  wr_tpc_2,
		  wr_tnpc_2,
		  wr_tstate_2,
		  wr_tt_2,
		  wr_pstate_2,
		  wr_tl_2, 
		  wr_pil_2, 
		  wr_gl_2,
		  wr_hpstate_2,
		  wr_htstate_2,
		  wr_hintp_2,
		  wr_tca_2,
		  wr_hstick_cmpr_2,
		  wr_stick_cmpr_2,
		  wr_cerer_2,
		  wr_ceter_2,
		  wr_isfsr_2,
		  wr_dsfsr_2,
		  wr_dsfar_2,
		  wr_decr_2,
		  wr_lsu_ctl_2}),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_8 wr_tid_dec_lat  (
	.scan_in(wr_tid_dec_lat_scanin),
	.scan_out(wr_tid_dec_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(rd_tid_dec		[7:0]	),
	.dout	(wr_tid_dec		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_rd_softint[7:0] = 
	{8 {rd_softint_2}}	&  wr_tid_dec[7:0];
assign asi_rd_tl	[7:0] = 
	{8 {rd_tl_2}}		&  wr_tid_dec[7:0];
assign asi_rd_pil	[7:0] = 
	{8 {rd_pil_2}}		&  wr_tid_dec[7:0];
assign asi_rd_gl	[7:0] = 
	{8 {rd_gl_2}}		&  wr_tid_dec[7:0];
assign asi_rd_hintp	[7:0] =
	{8 {rd_hintp_2}}	&  wr_tid_dec[7:0];


// send the store data out to the unit. Store data is in stage1 when control 
// is in stage 2.
//  The data is accompanied by write control signal.
assign asi_wr_data_0[63:0] =
       data_1[63:0];
assign asi_wr_data_1[62:0] =
       data_1[62:0];
assign asi_tsd0_wr_data_12 = 
       data_1[12];
assign asi_tsd0_wr_data_10_08[10:8] = 
       data_1[10:8];
assign asi_tsd0_wr_data_05_00[5:0] = 
       data_1[5:0];
assign asi_tsd1_wr_data_12 = 
       data_1[12];
assign asi_tsd1_wr_data_10_08[10:8] = 
       data_1[10:8];
assign asi_tsd1_wr_data_05_00[5:0] = 
       data_1[5:0];

assign asi_tca_wr_data_63 =
       (~data_1[63] & ~mbist_run) | (mbist_wdata[7] & mbist_run);
// TSA written one cycles later
assign asi_tsa_wr_data	[47:0] = 
       (data_2		[47:0] & {48 {~mbist_run}}) | 
       (mbist_tsa_wdata	[47:0] & {48 { mbist_run}}) ;
// MBIST data shifted because only store NPC down to bit 2
assign mbist_tsa_wdata[47:0] = 
       {mbist_wdata[5:0], {5 {mbist_wdata[7:0]}}, 2'b00};

// Functionally this should be 0; during MBIST it should be wdata[0]
assign asi_tsa_wr_data_npc_oor_va =
        mbist_run & mbist_wdata[0];
// Functionally this should be 1; during MBIST it should be mbist_wdata[5]
assign asi_tsa_wr_data_npc_nonseq =
       ~mbist_run | mbist_wdata[5];
assign asi_wr_cerer =
       wr_cerer_2;
assign asi_wr_ceter =
       wr_ceter_2;
assign asi_ceter_tid[2:0] =
       data_2[58:56];
assign asi_wr_int_rec	[7:0] =
       {8 {wr_int_rec_2}}	& wr_tid_dec[7:0];
assign asi_wr_any_int_rec	=
       wr_int_rec_2;
assign asi_wr_asireg	[7:0] = 
       {8 {wr_asireg_2}}	& wr_tid_dec[7:0];
assign asi_wr_tick	        = 
           wr_tick_2  		                   ;
assign asi_wr_set_softint[7:0] = 
       {8 {wr_set_softint_2}}	& wr_tid_dec[7:0];
assign asi_wr_clear_softint[7:0] = 
       {8 {wr_clear_softint_2}}	& wr_tid_dec[7:0];
assign asi_wr_softint	[7:0] = 
       {8 {wr_softint_2}}	& wr_tid_dec[7:0];
assign asi_wr_tba	[7:0] = 
       {8 {wr_tba_2}}		& wr_tid_dec[7:0];
// Sent a cycle early and flopped locally to sink
assign asi_wr_pstate	[7:0] = 
       {8 {wr_pstate}}		& rd_tid_dec[7:0];
assign asi_wr_tl	[7:0] = 
       {8 {wr_tl_2}}		& wr_tid_dec[7:0];
assign asi_wr_pil	[7:0] = 
       {8 {wr_pil_2}}		& wr_tid_dec[7:0];
assign asi_wr_gl	[7:0] = 
       {8 {wr_gl_2}}		& wr_tid_dec[7:0];
// Sent a cycle early and flopped locally to sink
assign asi_wr_hpstate	[7:0] = 
       {8 {wr_hpstate}}		& rd_tid_dec[7:0];
assign asi_wr_hintp	[7:0] = 
       {8 {wr_hintp_2}}		& wr_tid_dec[7:0];
assign asi_wr_htba	[7:0] = 
       {8 {wr_htba_2}}		& wr_tid_dec[7:0];
assign asi_rd_dsfar =
       rd_dsfar;
assign asi_rd_desr =
       rd_desr;
assign asi_rd_fesr =
       rd_fesr;
assign asi_wr_isfsr[7:0] =
       {8 {wr_isfsr_2}}		& wr_tid_dec[7:0] ;
assign asi_wr_iaw[1:0] =
       {2 {wr_iaw_2}}		& {data_2[58], ~data_2[58]};
assign asi_wr_dsfsr[7:0] =
       {8 {wr_dsfsr_2}}		& wr_tid_dec[7:0] ;
assign asi_wr_dsfar[7:0] =
       {8 {wr_dsfar_2}}		& wr_tid_dec[7:0] ;

assign asi_trl_pstate_en[1:0] =
       {2 {wr_hpstate_2 | wr_pstate_2}} & {data_2[58], ~data_2[58]};

// Pipe Interrupt Receive Register clear controls to check if the register
// is actually cleared out entirely
assign irl_any_cleared_in =
       rd_inc_vec_2 | wr_int_rec_2;

tlu_asi_ctl_msff_ctl_macro__width_1 irl_any_cleared_lat  (
	.scan_in(irl_any_cleared_lat_scanin),
	.scan_out(irl_any_cleared_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irl_any_cleared_in		),
	.dout	(irl_any_cleared		),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_3[7:0] = 
       { data_3[58] &  data_3[57] &  data_3[56], 
         data_3[58] &  data_3[57] & ~data_3[56], 
         data_3[58] & ~data_3[57] &  data_3[56], 
         data_3[58] & ~data_3[57] & ~data_3[56], 
        ~data_3[58] &  data_3[57] &  data_3[56], 
        ~data_3[58] &  data_3[57] & ~data_3[56], 
        ~data_3[58] & ~data_3[57] &  data_3[56], 
        ~data_3[58] & ~data_3[57] & ~data_3[56]};

assign asi_irl_cleared[7:0] =
       {8 {irl_any_cleared}} & tid_dec_3[7:0];

// Maintain TICK.NPT per thread
// TICK.NPT PORs to a 1, so store negative active
assign tick_npt_in_[7:0] =
       ( (wr_tid_dec[7:0] & {8 {wr_tick_2}}) & {8 {~data_1[63]}}) | 
       (~(wr_tid_dec[7:0] & {8 {wr_tick_2}}) & tick_npt_[7:0]) ; 

tlu_asi_ctl_msff_ctl_macro__width_8 tick_npt_inv_lat  (
	.scan_in(tick_npt_inv_lat_scanin),
	.scan_out(tick_npt_inv_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tick_npt_in_		[7:0]	),
	.dout	(tick_npt_		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tick_npt_2_ =
       | (tick_npt_[7:0] & wr_tid_dec[7:0]);

tlu_asi_ctl_msff_ctl_macro__width_1 tick_npt_3_inv_lat  (
	.scan_in(tick_npt_3_inv_lat_scanin),
	.scan_out(tick_npt_3_inv_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tick_npt_2_			),
	.dout	(tick_npt_3_			),
  .siclk(siclk),
  .soclk(soclk)
);

// Maintain decr
assign decr_reg_in[63:46] =
	({18 {~wr_decr_2}} & decr_reg	[63:46]) |
	({18 { wr_decr_2}} & data_1	[63:46]) ;

tlu_asi_ctl_msff_ctl_macro__width_18 decr_lat  (
	.scan_in(decr_lat_scanin),
	.scan_out(decr_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(decr_reg_in		[63:46]	),
	.dout	(decr_reg		[63:46]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_decr[63:46] =
	decr_reg[63:46];

// Mux ctl and data

assign rd_pct_2 =
       rd_pc_2 | rd_iaw_2;

assign trl_data[64:0] =
       { {48 {1'b0}}, 
	(trl1_asi_data[16:0] & {17 { data_3[58]}}) |
       	(trl0_asi_data[16:0] & {17 {~data_3[58]}})  };

assign tsd_data[64:48] =
       {17 {1'b0}};
assign tsd_data[47:2] = 
       (pct1_asi_data[47:2] & {46 { data_3[58]}}) |
       (pct0_asi_data[47:2] & {46 {~data_3[58]}}) ;
assign tsd_data[1:0] = 
       (tsd1_asi_data[1:0] & { 2 { data_3[58]}}) |
       (tsd0_asi_data[1:0] & { 2 {~data_3[58]}}) ;

assign tba_htba_data[64] =
       tsd_data[64];
assign tba_htba_data[63:48] = 
       {16 {(pct1_asi_data[47] &  data_3[58]) |
            (pct0_asi_data[47] & ~data_3[58])}} ;
assign tba_htba_data[47:0] =
       tsd_data[47:0];

assign tsa_nopc_data[64:0] =
       tsd_data[64:0];

assign tsa_pc_data[64] = 1'b0;
assign tsa_pc_data[63:48] = 
       ({16 { data_3[58]}} & {16 {pct1_asi_data[47   ]}}) |
       ({16 {~data_3[58]}} & {16 {pct0_asi_data[47   ]}}) ;
assign tsa_pc_data[47:0] =
       tsd_data[47:0];

assign tsa_ecc_data[64:0] =
       {{49 {1'b0}}, 
	({16 { data_3[58]}} & tel1_ecc[15:0]) |
	({16 {~data_3[58]}} & tel0_ecc[15:0])  };

assign tic_data[64:0] =
       {1'b0, ~tic_asi_data[63], tic_asi_data[62:0]};
// 
// Force bits 6:0 of %stick to 1s
// Synthesis combined the rd_tic_3 and rd_tick_3 paths for bits 6:0
// rd_tick_3 is required in the data bits
assign tic_data_for_3[64:0] =
       tic_data[64:0] |
       {{58 {1'b0}}, {7 {data_3[52] & rd_tick_3}}};
assign tick_data[64:0] =
       {1'b0, ~tick_npt_3_, tic_asi_data[62:0]} |
       {{58 {1'b0}}, {7 {data_3[52] & rd_tick_3}}};

assign pct_data[64] =
       {1 {1'b0}};
assign pct_data[63:2] =
       ({{16 {pct1_asi_data[47]}}, pct1_asi_data[47:2]} & {62 { data_3[58]}}) |
       ({{16 {pct0_asi_data[47]}}, pct0_asi_data[47:2]} & {62 {~data_3[58]}}) ;
assign pct_data[1] =
       {1 {1'b0}};
assign pct_data[0] =
       (pct1_asi_data[48] &  data_3[58]) |
       (pct0_asi_data[48] & ~data_3[58]) ;

assign rngf_cdbus_2[64:0] =
       {ctl_2, data_2[63:0]};

assign no_rd_3 = ~rd_trl_3 & ~rd_tsd_3 & ~rd_tba_htba_3 & 
       ~rd_tsa_pc_3 & ~rd_tsa_ecc_3 & ~rd_tsa_nopc_3 &
       ~rd_tic_3 & ~rd_tick_3 & ~rd_pct_3;

assign data_3_in[64:0] = 
       ({65 {no_rd_3      }} & rngf_cdbus_2	[64:0]) |
       ({65 {rd_trl_3     }} & trl_data 	[64:0]) |
       ({65 {rd_tsd_3     }} & tsd_data 	[64:0]) |
       ({65 {rd_tba_htba_3}} & tba_htba_data 	[64:0]) |
       ({65 {rd_tsa_pc_3  }} & tsa_pc_data	[64:0]) |
       ({65 {rd_tsa_ecc_3 }} & tsa_ecc_data	[64:0]) |
       ({65 {rd_tsa_nopc_3}} & tsa_nopc_data	[64:0]) |
       ({65 {rd_tic_3     }} & tic_data_for_3	[64:0]) |
       ({65 {rd_tick_3    }} & tick_data	[64:0]) |
       ({65 {rd_pct_3     }} & pct_data 	[64:0]) ;

assign rd_tca_diag_2 =
       rd_tca_ecc_2 | rd_tca_data_2;



/////////////////////////////////////////////////////////////////////
//STAGE 3
/////////////////////////////////////////////////////////////////////
// Mux previous results with TSA reads

tlu_asi_ctl_msff_ctl_macro__width_65 rng_stg3  (
	.scan_in(rng_stg3_scanin),
	.scan_out(rng_stg3_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(data_3_in		[64:0]	),
	.dout	(data_3			[64:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_asi_ctl_msff_ctl_macro__width_23 tsa_wr_lat  (
	.scan_in(tsa_wr_lat_scanin),
	.scan_out(tsa_wr_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({rd_tsa_nopc_2,
		  rd_tsa_pc_2,
		  rd_tsa_ecc_2,
		  rd_tic_2,
		  rd_tick_2,
		  rd_trl_2,
		  rd_pct_2,
		  rd_tsd_2,
		  rd_tba_htba_2,
		  rd_tca_diag_2,
		  wr_mondo_head_2,
		  wr_mondo_tail_2,
		  wr_device_head_2,
		  wr_device_tail_2,
		  wr_res_err_head_2,
		  wr_res_err_tail_2,
		  wr_nonres_err_head_2,
		  wr_nonres_err_tail_2,
		  wr_tpc_2,
		  wr_tnpc_2,
		  wr_tstate_2,
		  wr_tt_2,
		  wr_htstate_2		       }),
	.dout	({rd_tsa_nopc_3,
		  rd_tsa_pc_3,
		  rd_tsa_ecc_3,
		  rd_tic_3,
		  rd_tick_3,
		  rd_trl_3,
		  rd_pct_3,
		  rd_tsd_3,
		  rd_tba_htba_3,
		  rd_tca_diag_3,
		  wr_mondo_head_3,
		  wr_mondo_tail_3,
		  wr_device_head_3,
		  wr_device_tail_3,
		  wr_res_err_head_3,
		  wr_res_err_tail_3,
		  wr_nonres_err_head_3,
		  wr_nonres_err_tail_3,
		  wr_tpc_3,
		  wr_tnpc_3,
		  wr_tstate_3,
		  wr_tt_3,
		  wr_htstate_3		       }),
  .siclk(siclk),
  .soclk(soclk)
);
 

// Since these access the TSA, need to send control one cycles later than
// normal
assign asi_wr_mondo_head	[1:0] = 
       {2 {wr_mondo_head_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_mondo_tail	[1:0] = 
       {2 {wr_mondo_tail_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_device_head	[1:0] = 
       {2 {wr_device_head_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_device_tail	[1:0] = 
       {2 {wr_device_tail_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_res_err_head	[1:0] = 
       {2 {wr_res_err_head_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_res_err_tail	[1:0] = 
       {2 {wr_res_err_tail_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_nonres_err_head	[1:0] = 
       {2 {wr_nonres_err_head_3}}	& {data_3[58], ~data_3[58]};
assign asi_wr_nonres_err_tail	[1:0] = 
       {2 {wr_nonres_err_tail_3}}	& {data_3[58], ~data_3[58]};
assign asi_wr_tpc		[1:0] = 
       {2 {wr_tpc_3}}			& {data_3[58], ~data_3[58]};
assign asi_wr_tnpc		[1:0] = 
       ({2 {wr_tnpc_3}}			& {data_3[58], ~data_3[58]}) |
       {2 {mbist_run}};
assign asi_wr_tstate		[1:0] = 
       {2 {wr_tstate_3}}		& {data_3[58], ~data_3[58]};
assign asi_wr_tt		[1:0] = 
       {2 {wr_tt_3}}			& {data_3[58], ~data_3[58]};
assign asi_wr_htstate		[1:0] = 
       {2 {wr_htstate_3}}		& {data_3[58], ~data_3[58]};


// Do not need to check for interrupt if nonres_err registers are written
assign wr_iqr_3 =
       wr_mondo_head_3 | wr_mondo_tail_3 | wr_device_head_3 | wr_device_tail_3 |
       wr_res_err_head_3 | wr_res_err_tail_3;

// Check for ECC errors
assign check_ecc =
       | (tlu_ceter_pscce[7:0] &
	  { data_3[58] &  data_3[57] &  data_3[56],
            data_3[58] &  data_3[57] & ~data_3[56],
            data_3[58] & ~data_3[57] &  data_3[56],
            data_3[58] & ~data_3[57] & ~data_3[56],
           ~data_3[58] &  data_3[57] &  data_3[56],
           ~data_3[58] &  data_3[57] & ~data_3[56],
           ~data_3[58] & ~data_3[57] &  data_3[56],
           ~data_3[58] & ~data_3[57] & ~data_3[56]});

assign asi_tccup_in =
       rd_tic_3 & ~rd_tick_3 & check_ecc;
assign asi_tccud_in =
       ~(rd_tic_3 & ~rd_tick_3) & ~rd_tca_diag_3;
assign tsacu_in = 
       (rd_tsa_pc_3 | rd_tsa_nopc_3 | wr_tsa_3) & check_ecc;

assign kill_write_if_error_in = 
       wr_tsa_3 & check_ecc;

tlu_asi_ctl_msff_ctl_macro__width_2 ecc_lat  (
	.scan_in(ecc_lat_scanin),
	.scan_out(ecc_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({tsacu_in		       ,
		  kill_write_if_error_in       }),
	.dout	({ptsacu		       ,
		  kill_write_if_error	       }),
  .siclk(siclk),
  .soclk(soclk)
);

assign tsac =
       ((tel0_tsac & ~data_4[58]) | 
        (tel1_tsac &  data_4[58]) ) & ptsacu;

assign tsau =
       ((tel0_tsau & ~data_4[58]) | 
        (tel1_tsau &  data_4[58]) ) & ptsacu;

// For killing trap stack write
assign asi_tsacu[1:0] =
       {(tel1_tsac | tel1_tsau) &  data_4[58] & kill_write_if_error,
        (tel0_tsac | tel0_tsau) & ~data_4[58] & kill_write_if_error};

tlu_asi_ctl_msff_ctl_macro__width_2 tca_rd_addr_2_lat  (
	.scan_in(tca_rd_addr_2_lat_scanin),
	.scan_out(tca_rd_addr_2_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tca_rd_addr		[4:3]	),
	.dout	(tca_rd_addr_2		[4:3]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_2 tca_rd_addr_3_lat  (
	.scan_in(tca_rd_addr_3_lat_scanin),
	.scan_out(tca_rd_addr_3_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tca_rd_addr_2		[4:3]	),
	.dout	(tca_rd_addr_3		[4:3]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_2 tca_rd_addr_4_lat  (
	.scan_in(tca_rd_addr_4_lat_scanin),
	.scan_out(tca_rd_addr_4_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tca_rd_addr_3		[4:3]	),
	.dout	(tca_rd_addr_4		[4:3]	),
  .siclk(siclk),
  .soclk(soclk)
);


assign asi_ece_exc =
       tsac | cel_tccp;
assign asi_eue_exc =
       tsau | cel_tcup;
assign asi_ecc_tid[2:0] =
       data_4[58:56];

// For DSFSR
assign asi_tsac =
       tsac;
assign asi_tsau =
       tsau;
assign asi_tsacu_tid[2:0] =
       data_4[58:56];

assign tlu_tca_tid[2:0] = 
       data_4[58:56];
assign tlu_tca_index[1:0] =
       tca_rd_addr_4[4:3];


assign rngf_cdbus_3[64:0] =
       data_3[64:0];

assign data_4_in[64:0] =
       ({65 {~mmu_asi_read}} & rngf_cdbus_3	[64:0]) |	
       ({65 { mmu_asi_read}} & mmu_asi_data	[64:0]) ;

assign error_4_in =
       mmu_asi_cecc | mmu_asi_uecc | cel_tccp | cel_tcup | tsac | tsau;



/////////////////////////////////////////////////////////////////////
//STAGE 4
/////////////////////////////////////////////////////////////////////
// Output latch

tlu_asi_ctl_msff_ctl_macro__width_65 rng_stg4  (
	.scan_in(rng_stg4_scanin),
	.scan_out(rng_stg4_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(data_4_in		[64:0]	),
	.dout	(data_4			[64:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_asi_ctl_msff_ctl_macro__width_1 error_4_lat  (
	.scan_in(error_4_lat_scanin),
	.scan_out(error_4_lat_scanout),
	.din	(error_4_in			),
	.dout	(error_4			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tlu_rngf_cdbus[64:0] =
       data_4[64:0];

assign tlu_rngf_cdbus_error =
       error_4;

assign check_qr_exc_in[3:0] =
       {wr_iqr_3, data_3[58:56]};

tlu_asi_ctl_msff_ctl_macro__width_4 check_qr_exc_lat  (
	.scan_in(check_qr_exc_lat_scanin),
	.scan_out(check_qr_exc_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(check_qr_exc_in	[3:0]	),
	.dout	(check_qr_exc		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_check_qr_exc[7:0] =
       {8 {check_qr_exc[3]}} & 
       { check_qr_exc[2] &  check_qr_exc[1] &  check_qr_exc[0],
         check_qr_exc[2] &  check_qr_exc[1] & ~check_qr_exc[0],
         check_qr_exc[2] & ~check_qr_exc[1] &  check_qr_exc[0],
         check_qr_exc[2] & ~check_qr_exc[1] & ~check_qr_exc[0],
        ~check_qr_exc[2] &  check_qr_exc[1] &  check_qr_exc[0],
        ~check_qr_exc[2] &  check_qr_exc[1] & ~check_qr_exc[0],
        ~check_qr_exc[2] & ~check_qr_exc[1] &  check_qr_exc[0],
        ~check_qr_exc[2] & ~check_qr_exc[1] & ~check_qr_exc[0]};



//////////////////////////////////////////////////////////////////////////////
//
// Error inject staging
//

tlu_asi_ctl_msff_ctl_macro__width_11 error_inject_lat  (
	.scan_in(error_inject_lat_scanin),
	.scan_out(error_inject_lat_scanout),
	.din	({error_inject_enable,
		  error_inject_tccu,
		  error_inject_tsau,
		  error_inject_mask	[7:0]}),
	.dout	({error_enable,
		  error_tccu,
		  error_tsau,
		  error_mask		[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_error_tccu =
       error_enable & error_tccu;
assign asi_error_tsau =
       error_enable & error_tsau;
assign asi_error_mask[7:0] =
       error_mask[7:0];





//////////////////////////////////////////////////////////////////////////////
//
// LSU control reg shadow copies
//

assign write_lsu_ctl[7:0] = 
       ({8 { wr_lsu_ctl_2}} &  wr_tid_dec[7:0]) & 
       tlu_lsu_clear_ctl_reg_[7:0];

assign hold_lsu_ctl[7:0] = 
       ({8 {~wr_lsu_ctl_2}} | ~wr_tid_dec[7:0]) & 
       tlu_lsu_clear_ctl_reg_[7:0];

assign spec_enable_in[7:0] =
       (write_lsu_ctl[7:0] & {8 {data_1[4]}}) |
       ( hold_lsu_ctl[7:0] & spec_enable[7:0]) ;

tlu_asi_ctl_msff_ctl_macro__width_8 spec_enable_lat  (
	.scan_in(spec_enable_lat_scanin),
	.scan_out(spec_enable_lat_scanout),
	.din	(spec_enable_in		[7:0]	),
	.dout	(spec_enable		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_spec_enable[7:0] =
       spec_enable[7:0];

assign tlu_spec_enable[7:0] =
       spec_enable[7:0];

assign immu_enable_in[7:0] =
       (write_lsu_ctl[7:0] & {8 {data_1[2]}}) |
       ( hold_lsu_ctl[7:0] & immu_enable[7:0]) ;

tlu_asi_ctl_msff_ctl_macro__width_8 immu_enable_lat  (
	.scan_in(immu_enable_lat_scanin),
	.scan_out(immu_enable_lat_scanout),
	.din	(immu_enable_in		[7:0]	),
	.dout	(immu_enable		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_immu_enable[7:0] =
       immu_enable[7:0];



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//

// Use spare flop 7
tlu_asi_ctl_msff_ctl_macro__scanreverse_1__width_9 spare_8_0_lat  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.din	({rd_halt		       , 
		  wr_halt		       ,
		  {7{1'b0}}		       }),
	.dout	({rd_halt_2		       ,
		  wr_halt_2		       ,
		  unused		[6:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_halt[7:0] =
       {8 {wr_halt_2}} & wr_tid_dec[7:0];

assign asi_clear_spu_trap_req[7:0] =
       {8 {rd_halt_2}} & wr_tid_dec[7:0];




supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// fixscan start:
assign pmen_lat_scanin           = scan_in                  ;
assign stg1_en_lat_scanin        = pmen_lat_scanout         ;
assign stg2_en_lat_scanin        = stg1_en_lat_scanout      ;
assign stg3_en_lat_scanin        = stg2_en_lat_scanout      ;
assign stg4_en_lat_scanin        = stg3_en_lat_scanout      ;
assign mbist_run_lat_scanin      = stg4_en_lat_scanout      ;
assign mbist_tsa0_write_lat_scanin = mbist_run_lat_scanout    ;
assign mbist_tsa1_write_lat_scanin = mbist_tsa0_write_lat_scanout;
assign mbist_tca_write_lat_scanin = mbist_tsa1_write_lat_scanout;
assign mbist_addr_lat_scanin     = mbist_tca_write_lat_scanout;
assign mbist_tsa0_read_lat_scanin = mbist_addr_lat_scanout   ;
assign mbist_tsa1_read_lat_scanin = mbist_tsa0_read_lat_scanout;
assign mbist_tca_read_lat_scanin = mbist_tsa1_read_lat_scanout;
assign mbist_cmpsel_lat_scanin   = mbist_tca_read_lat_scanout;
assign mbist_addr_2_lat_scanin   = mbist_cmpsel_lat_scanout ;
assign mbist_tsa0_read_2_lat_scanin = mbist_addr_2_lat_scanout ;
assign mbist_tsa1_read_2_lat_scanin = mbist_tsa0_read_2_lat_scanout;
assign mbist_tca_read_2_lat_scanin = mbist_tsa1_read_2_lat_scanout;
assign mbist_cmpsel_2_lat_scanin = mbist_tca_read_2_lat_scanout;
assign mbist_wdata_2_lat_scanin  = mbist_cmpsel_2_lat_scanout;
assign mbist_tsa0_read_3_lat_scanin = mbist_wdata_2_lat_scanout;
assign mbist_tsa1_read_3_lat_scanin = mbist_tsa0_read_3_lat_scanout;
assign mbist_tca_read_3_lat_scanin = mbist_tsa1_read_3_lat_scanout;
assign mbist_wdata_3_lat_scanin  = mbist_tca_read_3_lat_scanout;
assign mbist_tsa0_read_4_lat_scanin = mbist_wdata_3_lat_scanout;
assign mbist_tsa1_read_4_lat_scanin = mbist_tsa0_read_4_lat_scanout;
assign compare_data_lat_scanin   = mbist_tsa1_read_4_lat_scanout;
assign tsa0_fail_lat_scanin      = compare_data_lat_scanout ;
assign tsa1_fail_lat_scanin      = tsa0_fail_lat_scanout    ;
assign tca_fail_lat_scanin       = tsa1_fail_lat_scanout    ;
assign compare_lat_scanin        = tca_fail_lat_scanout     ;
assign preempt_trap_lat_scanin   = compare_lat_scanout      ;
assign rng_stg1_data_scanin      = preempt_trap_lat_scanout ;
assign ctl_1_lat_scanin          = rng_stg1_data_scanout    ;
assign hpstatehpriv_lat_scanin   = ctl_1_lat_scanout        ;
assign pstatepriv_lat_scanin     = hpstatehpriv_lat_scanout ;
assign stg2_data_lat_scanin      = pstatepriv_lat_scanout   ;
assign stg2_ctl_lat_scanin       = stg2_data_lat_scanout    ;
assign wr_tid_dec_lat_scanin     = stg2_ctl_lat_scanout     ;
assign irl_any_cleared_lat_scanin = wr_tid_dec_lat_scanout   ;
assign tick_npt_inv_lat_scanin   = irl_any_cleared_lat_scanout;
assign tick_npt_3_inv_lat_scanin = tick_npt_inv_lat_scanout ;
assign decr_lat_scanin           = tick_npt_3_inv_lat_scanout;
assign rng_stg3_scanin           = decr_lat_scanout         ;
assign tsa_wr_lat_scanin         = rng_stg3_scanout         ;
assign ecc_lat_scanin            = tsa_wr_lat_scanout       ;
assign tca_rd_addr_2_lat_scanin  = ecc_lat_scanout          ;
assign tca_rd_addr_3_lat_scanin  = tca_rd_addr_2_lat_scanout;
assign tca_rd_addr_4_lat_scanin  = tca_rd_addr_3_lat_scanout;
assign rng_stg4_scanin           = tca_rd_addr_4_lat_scanout;
assign error_4_lat_scanin        = rng_stg4_scanout         ;
assign check_qr_exc_lat_scanin   = error_4_lat_scanout      ;
assign error_inject_lat_scanin   = check_qr_exc_lat_scanout ;
assign spec_enable_lat_scanin    = error_inject_lat_scanout ;
assign immu_enable_lat_scanin    = spec_enable_lat_scanout  ;
assign spares_scanin             = immu_enable_lat_scanout  ;
assign scan_out                  = spares_scanout           ;

assign clfesr_lat_wmr_scanin     = wmr_scan_in              ;
assign wmr_scan_out              = clfesr_lat_wmr_scanout   ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module tlu_asi_ctl_l1clkhdr_ctl_macro (
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

module tlu_asi_ctl_msff_ctl_macro__width_1 (
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

module tlu_asi_ctl_msff_ctl_macro__width_5 (
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

module tlu_asi_ctl_msff_ctl_macro__width_4 (
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

module tlu_asi_ctl_msff_ctl_macro__width_8 (
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

module tlu_asi_ctl_msff_ctl_macro__width_16 (
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

module tlu_asi_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_asi_ctl_msff_ctl_macro__width_72 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [71:0] fdin;
wire [70:0] so;

  input [71:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [71:0] dout;
  output scan_out;
assign fdin[71:0] = din[71:0];






dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_asi_ctl_msff_ctl_macro__width_18 (
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

module tlu_asi_ctl_msff_ctl_macro__width_65 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [64:0] fdin;
wire [63:0] so;

  input [64:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [64:0] dout;
  output scan_out;
assign fdin[64:0] = din[64:0];






dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_asi_ctl_msff_ctl_macro__width_23 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [22:0] fdin;
wire [21:0] so;

  input [22:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [22:0] dout;
  output scan_out;
assign fdin[22:0] = din[22:0];






dff #(23)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[22:0]),
.si({scan_in,so[21:0]}),
.so({so[21:0],scan_out}),
.q(dout[22:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_asi_ctl_msff_ctl_macro__width_2 (
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

module tlu_asi_ctl_msff_ctl_macro__width_11 (
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

module tlu_asi_ctl_msff_ctl_macro__scanreverse_1__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [0:7] so;

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
.si({so[0:7],scan_in}),
.so({scan_out,so[0:7]}),
.q(dout[8:0])
);












endmodule








