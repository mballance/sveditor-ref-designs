// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fpc_ctl.v
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
module fgu_fpc_ctl (
  fpc_fpd_ieee_trap_fb, 
  fpc_fpx_unfin_fb, 
  fpc_fpd_unfin_fb, 
  fgu_fpx_ieee_trap_fw, 
  fgu_fpd_ieee_trap_fw, 
  fgu_fpx_unfin_fw, 
  fgu_fpd_unfin_fw, 
  fgu_fpd_idiv0_trap_fw, 
  fgu_predict_fx2, 
  lsu_fgu_exception_w, 
  lsu_block_store_m, 
  exu_fgu_flush_m, 
  exu_fgu_gsr_m, 
  fgu_exu_icc_fx5, 
  fgu_exu_xcc_fx5, 
  fad_rs1_fx1, 
  fad_rs2_fx1, 
  fad_fsr_rd_fx1, 
  fad_fsr_tem_fx1, 
  fad_fsr_ns_fx1, 
  fad_rs1_fmt_fx1_b62, 
  fad_rs2_fmt_fx1_b62, 
  fad_gsr_imirnd_fx1, 
  fpc_w1_vld_fb, 
  fpc_w1_ul_vld_fb, 
  fpc_fsr_w1_vld_fx5, 
  fpc_fsr_w1_result_fw, 
  fpc_fsr_w2_result_fw, 
  fpc_fpd_exp_res, 
  fpc_fpd_sign_res, 
  fpc_fpd_const_sel, 
  fpc_fcc_fw, 
  fpf_b_gteq_a_fx2, 
  fpf_b_eq_a_fx2, 
  fgu_cmp_fcc_fx3, 
  fgu_cmp_fcc_vld_fx3, 
  fpf_hi_aof_fx1, 
  fpf_lo_aof_fx1, 
  fpf_azf_fx1, 
  fpf_bzf_fx1, 
  fpf_aoe_fx1, 
  fpf_boe_fx1, 
  fpf_aze_fx1, 
  fpf_bze_fx1, 
  fpf_ma_sum_fx4, 
  fpf_ma_cout_fx4, 
  fpf_cmp_swap_blta_fx2, 
  fpf_align_sticky_fx4_l, 
  fpf_byte_unsure_x_sp_fx3, 
  fpf_byte_unsure_x_dp_fx3, 
  fpf_rcout_fb, 
  fpf_implied_bit_fx5, 
  fpc_result_sel_fx5, 
  fpc_ovf_if_rcout_fx5, 
  fpc_vis_cmp_result_fx5, 
  fpc_int_res_sel_fx4, 
  fpc_ma_fmt_sel_fx4, 
  fpc_int_sel_fx5, 
  fpc_fconst_sel_fx5, 
  fpc_fp_cin00_fx2, 
  fpc_cin00_fx2, 
  fpc_cin16_48_fx2, 
  fpc_cin32_fx2, 
  fpc_prop16_48_fx2, 
  fpc_prop32_fx2, 
  fpc_mle_sel_fx2, 
  fpc_mse_sel_fx2, 
  fpc_sign_fx5, 
  fpc_sign_fb, 
  fpc_rd_mode_fx3, 
  fpc_emin_fx3, 
  fpc_sp_dest_fx4, 
  fpc_fadd_eac_enable_fx2, 
  fpc_i2f_sel_fx1, 
  fpc_rinc_sel_fx5, 
  fpc_qthenan_fx4, 
  fpc_den2nor_sp_fb, 
  fpc_den2nor_dp_fb, 
  fpe_aux_rs2_fmt_fx1_b0, 
  fpe_aux_eint_fx1, 
  fpe_align_sel_fx2, 
  fpe_rs1_fmt_fx1, 
  fpe_rs2_fmt_fx1, 
  fpe_einty_adj_cout_fx5, 
  fpe_einty_eq_eadj_fx5, 
  fpc_exp_sel_mul_fx5, 
  fpc_eintx_sel_fx2, 
  fpc_eadjx_sel_fx2, 
  fpc_q_rinc_sel_fx5, 
  fac_tlu_flush_fx3, 
  fac_tid_e, 
  fac_dec_valid_fx1, 
  fac_fpx_itype_fx1, 
  fac_fpx_dtype_fx1, 
  fac_fpx_stype_fx1, 
  fac_fpx_sign_instr_fx1, 
  fac_fpx_rnd_trunc_fx1, 
  fac_fcmpe_fx1, 
  fac_fpx_mulscc_fx1, 
  fac_fpx_saverestore_fx1, 
  fac_fgx_pdist_fx1, 
  fac_fgx_popc_fx2, 
  fac_fgx_mvcond_fx2, 
  fac_fgx_mvucond_fx2, 
  fac_fgx_abs_fx2, 
  fac_fgx_neg_fx2, 
  fac_fpx_nv_vld_fx1, 
  fac_fpx_of_vld_fx1, 
  fac_fpx_uf_vld_fx1, 
  fac_fpx_dz_vld_fx1, 
  fac_fpx_nx_vld_fx1, 
  fac_fpx_unfin_vld_fx1, 
  fac_fgx_instr_fx4, 
  fac_w1_vld_fx1, 
  fac_w1_odd32b_fx1, 
  fac_opf_fx2, 
  fac_fgx_siam_fx2, 
  fac_div_valid_fx1, 
  fac_divq_valid_fx1, 
  fac_fsr_store_fx2, 
  fac_gsr_asr_tid_fx2, 
  fac_rng_wr_gsr_3f, 
  fac_gsr_w_vld_fx2, 
  fac_dec_valid_noflush_fx5, 
  fac_exu_src_e, 
  main_clken, 
  coreon_clken, 
  fpc_fcc_vld_fx5, 
  fpc_stfsr_en_fx3to5, 
  fic_norm_eadj_fx5, 
  fic_mulscc_iccz_fx4, 
  fic_mulscc_xccz_fx4, 
  fic_convert_sticky_fx4, 
  fic_fxtod_sticky_fx4, 
  fic_ftoi_nx_fx4, 
  fic_ftox_nx_fx4, 
  fic_bzf31msb_fx2, 
  fic_bzf32lsb_fx2, 
  fic_bof22msb_fx2, 
  fpc_lzd_override_fx4, 
  fpc_sp_source_fx3, 
  fdc_finish_fltd_early, 
  fdc_finish_flts_early, 
  fdc_finish_int_early, 
  fdc_flt_inexact, 
  fdc_xicc_z_early, 
  fdc_icc_v_early, 
  fdc_dec_exp_early, 
  fpc_pre_div_flush_fx2, 
  fpc_div_default_res_fx2, 
  fdd_result, 
  fdd_pte_cla_early_b63, 
  fgu_mul_result_fx5, 
  fpy_sticky_dp_fx5, 
  fpy_sticky_sp_fx5, 
  fpy_xicc_z_fx5, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  dec_fgu_fmov_vld_m, 
  dec_valid_e, 
  dec_frf_store_d, 
  fec_cecc_fx2, 
  fec_uecc_fx2, 
  fpc_frf_store_vld_fx1, 
  fpc_gsr0_mask_sel_fx3, 
  fpc_gsr1_mask_sel_fx3, 
  fpc_gsr2_mask_sel_fx3, 
  fpc_gsr3_mask_sel_fx3, 
  fpc_gsr4_mask_sel_fx3, 
  fpc_gsr5_mask_sel_fx3, 
  fpc_gsr6_mask_sel_fx3, 
  fpc_gsr7_mask_sel_fx3, 
  fpc_gsr_scale_fx4, 
  fpc_gsr_align_fx4, 
  fpc_gsr_asr_11bits_fx4, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  mbi_run, 
  in_rngl_cdbus, 
  scan_out, 
  wmr_scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk_pm2;
wire l1clk_pm1;
wire spares_scanin;
wire spares_scanout;
wire e_00_scanin;
wire e_00_scanout;
wire r1_odd32b_e;
wire r2_odd32b_e;
wire frf_store_e;
wire fx1_00_scanin;
wire fx1_00_scanout;
wire [1:0] i_fst_valid_fx1;
wire fx1_01_scanin;
wire fx1_01_scanout;
wire r1_odd32b_fx1;
wire r2_odd32b_fx1;
wire [2:0] tid_fx1;
wire frf_store_fx1;
wire exu_src_fx1;
wire mbist_run_1f;
wire fst_valid_fx1;
wire int_rs2_zero_fx1;
wire idiv0_trap_fx1;
wire [3:0] eintx_sel_fx1;
wire fp_dual_source_fx1;
wire fp_source_fx1;
wire [2:0] eadjx_sel_fx1;
wire [1:0] rd_mode_fx1;
wire gsr_im_fx3;
wire [1:0] gsr_irnd_fx3;
wire ns_mode_fx1;
wire rs1_sign_fx1;
wire rs2_sign_fx1;
wire fadd_logical_sub_fx1;
wire logical_sub_fx1;
wire fadd_logical_add_fx1;
wire aux_enable_ovf_fx1;
wire fmul_enable_ovf_predict_fx1;
wire aux_eint_ovf_fx1;
wire aux_eint_emax_fx1;
wire aux_eint_emaxp1_fx1;
wire fadd_ovf_predict_fx1;
wire fdtos_ovf_predict_fx1;
wire fdtos_ovf_detect_fx1;
wire fmul_ovf_predict_fx1;
wire fmul_ovf_detect_fx1;
wire fdiv_ovf_predict_fx1;
wire fdiv_ovf_detect_fx1;
wire aux_enable_unf_fx1;
wire fdiv_enable_unf_predict_fx1;
wire aux_eint_unf_fx1;
wire aux_eint_emin_fx1;
wire aux_eint_eminm1_fx1;
wire aux_eint_eminm2_fx1;
wire fdtos_guf_detect_fx1;
wire fmul_guf_detect_fx1;
wire fdiv_guf_detect_fx1;
wire fdtos_unf_predict_fx1;
wire fdtos_unf_detect_fx1;
wire fmul_unf_predict_fx1;
wire fmul_unf_detect_fx1;
wire fdiv_unf_predict_fx1;
wire fdiv_unf_detect_fx1;
wire snan_or_inf_fx1;
wire nan_or_inf_fx1;
wire large_maxint_predict_fx1;
wire fadd_unf_predict_fx1;
wire fadd_fcvt_denorm_detect_fx1;
wire fmul_denorm_detect_fx1;
wire q_fmul_unf_predict_fx1;
wire i_predict_fx1;
wire fx2_00_scanin;
wire fx2_00_scanout;
wire [2:0] itype_fx2;
wire [2:0] dtype_fx2;
wire [1:0] stype_fx2;
wire sign_instr_fx2;
wire i_idiv0_trap_fx2;
wire dec_flush_fx2;
wire dec_valid_fx2;
wire fmov_vld_fx2;
wire div_valid_fx2;
wire divq_valid_fx2;
wire [0:0] aux_rs2_fmt_fx2;
wire fpx_nv_vld_fx2;
wire fpx_of_vld_fx2;
wire fpx_uf_vld_fx2;
wire fpx_dz_vld_fx2;
wire fpx_nx_vld_fx2;
wire fpx_unfin_vld_fx2;
wire fcmpe_fx2;
wire fp_source_fx2;
wire fp_dual_source_fx2;
wire rs1_sign_fx2;
wire rs2_sign_fx2;
wire fadd_logical_sub_fx2;
wire logical_sub_fx2;
wire fadd_logical_add_fx2;
wire hi_aof_fx2;
wire lo_aof_fx2;
wire aux_eint_eminm1_fx2;
wire aux_eint_eminm2_fx2;
wire aux_enable_unf_fx2;
wire [1:0] rd_mode_fx2;
wire ns_mode_fx2;
wire fst_valid_fx2;
wire [2:0] gsr_imirnd_fx2;
wire fgx_pdist_fx2;
wire exu_src_fx2;
wire fx2_01_scanin;
wire fx2_01_scanout;
wire mulscc_fx2;
wire mulscc_y_src_fx2_b0;
wire [10:0] rs2_exp_fx2;
wire saverestore_fx2;
wire fx2_02_scanin;
wire fx2_02_scanout;
wire [1:0] i_w1_vld_fx2;
wire w1_odd32b_fx2;
wire [10:0] aux_eint_fx2;
wire [2:0] tid_fx2;
wire fx2_03_scanin;
wire fx2_03_scanout;
wire rs1_fx2_b63;
wire rs1_fx2_b47;
wire rs1_fx2_b31;
wire rs1_fx2_b15;
wire fx2_04_scanin;
wire fx2_04_scanout;
wire rs2_fx2_b63;
wire rs2_fx2_b47;
wire rs2_fx2_b31;
wire rs2_fx2_b15;
wire fx2_05_scanin;
wire fx2_05_scanout;
wire azf_fx2;
wire bzf_fx2;
wire aoe_fx2;
wire boe_fx2;
wire aze_fx2;
wire bze_fx2;
wire fx2_06_scanin;
wire fx2_06_scanout;
wire [4:0] fsr_tem_fx2;
wire [62:62] rs1_fmt_fx2;
wire [62:62] rs2_fmt_fx2;
wire fx2_07_scanin;
wire fx2_07_scanout;
wire fadd_ovf_predict_fx2;
wire fdtos_ovf_predict_fx2;
wire fdtos_ovf_detect_fx2;
wire fmul_ovf_predict_fx2;
wire fmul_ovf_detect_fx2;
wire fdiv_ovf_predict_fx2;
wire fdiv_ovf_detect_fx2;
wire fdtos_unf_predict_fx2;
wire fdtos_unf_detect_fx2;
wire fmul_unf_predict_fx2;
wire fmul_unf_detect_fx2;
wire fdiv_unf_predict_fx2;
wire fdiv_unf_detect_fx2;
wire fdtos_guf_detect_fx2;
wire fmul_guf_detect_fx2;
wire fdiv_guf_detect_fx2;
wire i_predict_fx2;
wire fmul_denorm_detect_fx2;
wire q_fmul_unf_predict_fx2;
wire fadd_fcvt_denorm_detect_fx2;
wire fx2_08_scanin;
wire fx2_08_scanout;
wire [27:0] in_rngl_cdbus_1f;
wire exu_flush_fx2;
wire [2:0] gsr_align_fx2;
wire [1:0] w1_vld_fx2;
wire [1:0] fsr_w1_vld_fx2;
wire [1:0] gsr_w_vld_fx2;
wire fgx_siam_fx2;
wire sign_nan_fx2;
wire nan_rs2prop_fx2;
wire nan_rs1prop_fx2;
wire [4:0] sign_inter_sel_fx2;
wire a_nan_fx2;
wire b_nan_fx2;
wire sign_inter_fx2;
wire sp_odd_exp_fx2;
wire sp_even_exp_fx2;
wire dp_odd_exp_fx2;
wire dp_even_exp_fx2;
wire [10:0] fpd_eint_fx2;
wire [3:0] fcmpgt16_fx2;
wire [1:0] gt32_fx2;
wire [1:0] fcmpgt32_fx2;
wire [3:0] fcmple16_fx2;
wire [1:0] le32_fx2;
wire [1:0] fcmple32_fx2;
wire [3:0] fcmpeq16_fx2;
wire [1:0] fcmpeq32_fx2;
wire [3:0] fcmpne16_fx2;
wire [1:0] fcmpne32_fx2;
wire fcmpgt16_sel_fx2;
wire fcmpgt32_sel_fx2;
wire fcmple16_sel_fx2;
wire fcmple32_sel_fx2;
wire fcmpne16_sel_fx2;
wire fcmpne32_sel_fx2;
wire fcmpeq16_sel_fx2;
wire fcmpeq32_sel_fx2;
wire [3:0] vis_cmp_result_fx2;
wire a_zero_fx2;
wire a_denorm_fx2;
wire a_inf_fx2;
wire a_snan_fx2;
wire b_zero_fx2;
wire b_denorm_fx2;
wire b_inf_fx2;
wire b_snan_fx2;
wire b_qnan_fx2;
wire unfin_src_fx2;
wire inf_src_result_fx2;
wire zero_src_result_fx2;
wire inf_maxint_result_fx2;
wire nan_maxint_result_fx2;
wire nan_default_result_fx2;
wire fpx_dzc_fx2;
wire i_fxp_nvc_fx2;
wire fcmp_nvc_fx2;
wire local_predict_fx2;
wire qthenan_fx2;
wire rm_near_dp_fx2;
wire rm_directed_dp_fx2;
wire rm_near_sp_fx2;
wire rm_directed_sp_fx2;
wire fdiv_aof_bzf_fx2;
wire fmul_den2nor_m2_predict_fx2;
wire fdiv_den2nor_m1_predict_fx2;
wire fdiv_den2nor_sp_fx2;
wire fdiv_den2nor_dp_fx2;
wire mse_zeros_fx2;
wire mse_ones_fx2;
wire mle_zeros_fx2;
wire mass_align_fx2;
wire mass_align_sticky_fx2;
wire [5:1] int_res_sel_fx2;
wire i_pre_div_flush_fx2;
wire idiv0_trap_fx2;
wire aboe_fx2;
wire abze_fx2;
wire [1:0] gsr0_mask_sel_fx2;
wire [1:0] gsr1_mask_sel_fx2;
wire [1:0] gsr2_mask_sel_fx2;
wire [1:0] gsr3_mask_sel_fx2;
wire [1:0] gsr4_mask_sel_fx2;
wire [1:0] gsr5_mask_sel_fx2;
wire [1:0] gsr6_mask_sel_fx2;
wire [1:0] gsr7_mask_sel_fx2;
wire sp_source_fx2;
wire ecc_trap_fx2;
wire fx3_00_scanin;
wire fx3_00_scanout;
wire [1:0] i_w1_vld_fx3;
wire [2:0] itype_fx3;
wire [2:0] dtype_fx3;
wire [1:0] stype_fx3;
wire [2:0] tid_fx3;
wire fx3_01_scanin;
wire fx3_01_scanout;
wire [3:0] vis_cmp_result_fx3;
wire [5:1] int_res_sel_fx3;
wire [10:0] fpd_eint_fx3;
wire fx3_02_scanin;
wire fx3_02_scanout;
wire rs1_fx3_b31;
wire rs2_fx3_b31;
wire [10:0] rs2_exp_fx3;
wire fx3_03_scanin;
wire fx3_03_scanout;
wire bzf_fx3;
wire bze_fx3;
wire a_nan_fx3;
wire b_nan_fx3;
wire fx3_04_scanin;
wire fx3_04_scanout;
wire [4:0] fsr_tem_fx3;
wire fx3_05_scanin;
wire fx3_05_scanout;
wire inf_src_result_fx3;
wire zero_src_result_fx3;
wire inf_maxint_result_fx3;
wire nan_maxint_result_fx3;
wire nan_default_result_fx3;
wire qthenan_fx3;
wire bzf31msb_fx3;
wire fmul_den2nor_m2_predict_fx3;
wire fdiv_den2nor_sp_fx3;
wire fdiv_den2nor_dp_fx3;
wire fx3_06_scanin;
wire fx3_06_scanout;
wire i_idiv0_trap_fx3;
wire dec_flush_fx3;
wire sign_inter_fx3;
wire div_valid_fx3;
wire divq_valid_fx3;
wire logical_sub_fx3;
wire [1:0] i_fsr_w1_vld_fx3;
wire w1_odd32b_fx3;
wire mass_align_sticky_fx3;
wire fadd_logical_sub_fx3;
wire fsr_store_fx3;
wire i_fgx_siam_fx3;
wire [1:1] i_gsr_w_vld_fx3;
wire [2:0] gsr_asr_tid_fx3;
wire rm_near_sp_fx3;
wire rm_near_dp_fx3;
wire rm_directed_sp_fx3;
wire rm_directed_dp_fx3;
wire aboe_fx3;
wire abze_fx3;
wire div_default_res_fx3;
wire fgx_pdist_fx3;
wire fx3_07_scanin;
wire fx3_07_scanout;
wire fadd_ovf_predict_fx3;
wire fdtos_ovf_predict_fx3;
wire fdtos_ovf_detect_fx3;
wire fmul_ovf_predict_fx3;
wire fmul_ovf_detect_fx3;
wire fdiv_ovf_predict_fx3;
wire fdiv_ovf_detect_fx3;
wire fdtos_unf_predict_fx3;
wire fdtos_unf_detect_fx3;
wire fmul_unf_predict_fx3;
wire fmul_unf_detect_fx3;
wire fdiv_unf_predict_fx3;
wire fdiv_unf_detect_fx3;
wire bof22msb_fx3;
wire fdtos_guf_detect_fx3;
wire fmul_guf_detect_fx3;
wire fdiv_guf_detect_fx3;
wire unfin_src_fx3;
wire fx3_08_scanin;
wire fx3_08_scanout;
wire [1:0] gsr0_mask_sel_fx3;
wire [1:0] gsr1_mask_sel_fx3;
wire [1:0] gsr2_mask_sel_fx3;
wire [1:0] gsr3_mask_sel_fx3;
wire [1:0] gsr4_mask_sel_fx3;
wire [1:0] gsr5_mask_sel_fx3;
wire [1:0] gsr6_mask_sel_fx3;
wire [1:0] gsr7_mask_sel_fx3;
wire fx3_09_scanin;
wire fx3_09_scanout;
wire [2:0] in_rngl_cdbus_2f_b27_25;
wire [7:0] in_rngl_cdbus_2f;
wire [2:0] gsr_align_fx3;
wire [2:0] gsr_imirnd_fx3;
wire fx3_10_scanin;
wire fx3_10_scanout;
wire fpx_unfin_vld_fx3;
wire ns_mode_fx3;
wire fpx_of_vld_fx3;
wire fpx_uf_vld_fx3;
wire fpx_nx_vld_fx3;
wire ecc_trap_fx3;
wire fpx_dzc_fx3;
wire i_fxp_nvc_fx3;
wire rng_wr_gsr_4f;
wire [1:1] gsr_w_vld_fx3;
wire fgx_siam_fx3;
wire idiv0_trap_fx3;
wire [1:0] w1_vld_fx3;
wire [1:0] fsr_w1_vld_fx3;
wire lzd_override_fx3;
wire div_dec_issue_fx3;
wire div_divq_issue_fx3;
wire div_divq_load_fx3;
wire div_hold_fx3;
wire fdiv_ovf_predict_inf_fx3;
wire fdiv_ovf_predict_max_fx3;
wire [18:0] div_eint_in_fx3;
wire [18:0] divq_eint_fx4;
wire [18:0] div_eint_fx4;
wire [18:0] divq_eint_in_fx3;
wire dpint_zero_fx3;
wire spint_zero_fx3;
wire fpint_zero_fx3;
wire dp_large_maxint_result_fx3;
wire sp_large_maxint_result_fx3;
wire maxint_result_fx3;
wire fpx_nvc_fx3;
wire [10:0] gsr0_11bits_fx3;
wire [2:0] in_rngl_cdbus_3f_b27_25;
wire [7:0] in_rngl_cdbus_3f;
wire [10:0] gsr0_11bits_fx4;
wire [10:0] gsr1_11bits_fx3;
wire [10:0] gsr1_11bits_fx4;
wire [10:0] gsr2_11bits_fx3;
wire [10:0] gsr2_11bits_fx4;
wire [10:0] gsr3_11bits_fx3;
wire [10:0] gsr3_11bits_fx4;
wire [10:0] gsr4_11bits_fx3;
wire [10:0] gsr4_11bits_fx4;
wire [10:0] gsr5_11bits_fx3;
wire [10:0] gsr5_11bits_fx4;
wire [10:0] gsr6_11bits_fx3;
wire [10:0] gsr6_11bits_fx4;
wire [10:0] gsr7_11bits_fx3;
wire [10:0] gsr7_11bits_fx4;
wire [7:0] gsr_11bits_fx3;
wire [10:0] gsr_asr_11bits_fx3;
wire [2:0] gsr_imirnd_held_fx3;
wire siam_1ahead_sel_fx3;
wire siam_2ahead_sel_fx3;
wire siam_none_sel_fx3;
wire fx4_00_scanin;
wire fx4_00_scanout;
wire rs1_fx4_b31;
wire rs2_fx4_b31;
wire [1:0] rd_mode_fx4;
wire fx4_01_scanin;
wire fx4_01_scanout;
wire [1:0] i_w1_vld_fx4;
wire [1:0] fcc_fx4;
wire [3:0] fcc_vld_fx4;
wire idiv0_trap_fx4;
wire sign_inter_fx4;
wire logical_sub_fx4;
wire fpint_zero_fx4;
wire [1:0] i_fsr_w1_vld_fx4;
wire a_nan_fx4;
wire b_nan_fx4;
wire [1:0] byte_unsure_x_dp_fx4;
wire [1:0] byte_unsure_x_sp_fx4;
wire w1_odd32b_fx4;
wire mass_align_sticky_fx4;
wire fadd_logical_sub_fx4;
wire fsr_store_fx4;
wire fmul_den2nor_m2_predict_fx4;
wire fdiv_den2nor_sp_fx4;
wire fdiv_den2nor_dp_fx4;
wire rm_near_sp_fx4;
wire rm_near_dp_fx4;
wire rm_directed_sp_fx4;
wire rm_directed_dp_fx4;
wire aboe_fx4;
wire abze_fx4;
wire div_default_res_fx4;
wire dec_flush_fx4;
wire tlu_flush_fgu_fx4;
wire fx4_02_scanin;
wire fx4_02_scanout;
wire [3:0] vis_cmp_result_fx4;
wire [2:0] itype_fx4;
wire [2:0] dtype_fx4;
wire fx4_03_scanin;
wire fx4_03_scanout;
wire fx4_04_scanin;
wire fx4_04_scanout;
wire [4:0] fsr_tem_fx4;
wire fx4_05_scanin;
wire fx4_05_scanout;
wire inf_src_result_fx4;
wire zero_src_result_fx4;
wire nan_default_result_fx4;
wire maxint_result_fx4;
wire fx4_06_scanin;
wire fx4_06_scanout;
wire fadd_ovf_predict_fx4;
wire fdtos_ovf_predict_fx4;
wire fdtos_ovf_detect_fx4;
wire fmul_ovf_predict_fx4;
wire fmul_ovf_detect_fx4;
wire fdiv_ovf_detect_fx4;
wire fdtos_unf_predict_fx4;
wire fdtos_unf_detect_fx4;
wire fmul_unf_predict_fx4;
wire fmul_unf_detect_fx4;
wire fdiv_unf_detect_fx4;
wire bof22msb_fx4;
wire fdtos_guf_detect_fx4;
wire fmul_guf_detect_fx4;
wire fdiv_guf_detect_fx4;
wire unfin_src_fx4;
wire fx4_07_wmr_scanin;
wire fx4_07_wmr_scanout;
wire fx4_08_scanin;
wire fx4_08_scanout;
wire fpx_unfin_vld_fx4;
wire ns_mode_fx4;
wire fpx_of_vld_fx4;
wire fpx_uf_vld_fx4;
wire fpx_nx_vld_fx4;
wire ecc_trap_fx4;
wire fpx_dzc_fx4;
wire fpx_nvc_fx4;
wire fx4_09_scanin;
wire fx4_09_scanout;
wire fx4_10_scanin;
wire fx4_10_scanout;
wire stfsr_exception_fx4;
wire fx4_11_scanin;
wire fx4_11_scanout;
wire maxpos_result_fx4;
wire maxneg_result_fx4;
wire [3:0] int_sel_fx4;
wire mulscc_iccn_fx4;
wire mulscc_iccc_fx4;
wire mulscc_iccv_fx4;
wire exp_sel_mul_fx4;
wire [1:0] fpd_const_sel;
wire [10:0] fpd_exp_res;
wire sign_retain_zero_fx4;
wire sign_zero_fx4;
wire add_ma_cout_fx4;
wire convert_fmt_1xx_fx4;
wire convert_fmt_01x_fx4;
wire fxtod_fmt_1xx_fx4;
wire fxtod_fmt_01x_fx4;
wire add_fmt_1xx_fx4;
wire add_fmt_01x_fx4;
wire add_fmt_001_fx4;
wire aln_fmt_1xx_fx4;
wire aln_fmt_01x_fx4;
wire add_lsb_bit_dp_fx4;
wire add_g_bit_dp_fx4;
wire add_lsb_bit_sp_fx4;
wire add_g_bit_sp_fx4;
wire align_x_bit_dp_fx4;
wire align_x_bit_sp_fx4;
wire convert_x_bit_sp_fx4;
wire fxtod_x_bit_dp_fx4;
wire add_x_bit_dp_fx4;
wire add_x_bit_sp_fx4;
wire fpint_nxc_i_fx4;
wire fpint_nxc_x_fx4;
wire fpint_nxc_fx4;
wire fdtos_den2nor_fx4;
wire fdiv_fdtos_den2nor_sp_fx4;
wire [1:0] w1_vld_fx4;
wire [1:0] fsr_w1_vld_fx4;
wire fx5_00_scanin;
wire fx5_00_scanout;
wire [1:0] w1_vld_fx5;
wire [1:0] fcc_fx5;
wire fx5_01_scanin;
wire fx5_01_scanout;
wire [2:0] itype_fx5;
wire [2:0] dtype_fx5;
wire [1:0] rd_mode_fx5;
wire fx5_02_scanin;
wire fx5_02_scanout;
wire int_res_sel_fx5_b2;
wire ma_fmt_sel_fx5_b0;
wire idiv0_trap_fx5;
wire mulscc_iccn_fx5;
wire mulscc_iccz_fx5;
wire mulscc_iccv_fx5;
wire mulscc_iccc_fx5;
wire mulscc_xccz_fx5;
wire idiv_xccz_fx5;
wire idiv_iccz_fx5;
wire idiv_iccv_fx5;
wire sign_inter_fx5;
wire sign_zero_fx5;
wire ma_sum_fx5_b10;
wire fgx_instr_fx5;
wire w1_odd32b_fx5;
wire ma_cout_fx5;
wire fadd_logical_sub_fx5;
wire fsr_store_fx5;
wire fmul_den2nor_m2_predict_fx5;
wire fdiv_fdtos_den2nor_sp_fx5;
wire fdiv_den2nor_dp_fx5;
wire aboe_fx5;
wire fpint_nxc_fx5;
wire fx5_04_scanin;
wire fx5_04_scanout;
wire [4:0] fsr_tem_fx5;
wire fx5_05_scanin;
wire fx5_05_scanout;
wire rm_near_dp_fx5;
wire rm_near_sp_fx5;
wire rm_directed_dp_fx5;
wire rm_directed_sp_fx5;
wire fx5_06_scanin;
wire fx5_06_scanout;
wire add_g_bit_sp_fx5;
wire add_g_bit_dp_fx5;
wire add_lsb_bit_sp_fx5;
wire add_lsb_bit_dp_fx5;
wire add_x_bit_sp_fx5;
wire add_x_bit_dp_fx5;
wire fx5_07_scanin;
wire fx5_07_scanout;
wire inf_src_result_fx5;
wire zero_src_result_fx5;
wire nan_default_result_fx5;
wire maxint_result_fx5;
wire fx5_08_scanin;
wire fx5_08_scanout;
wire fadd_ovf_predict_fx5;
wire fdtos_ovf_predict_fx5;
wire fdtos_ovf_detect_fx5;
wire fmul_ovf_predict_fx5;
wire fmul_ovf_detect_fx5;
wire fdiv_ovf_detect_fx5;
wire fdtos_unf_predict_fx5;
wire fdtos_unf_detect_fx5;
wire fmul_unf_predict_fx5;
wire fmul_unf_detect_fx5;
wire fdiv_unf_detect_fx5;
wire fdtos_guf_detect_fx5;
wire fmul_guf_detect_fx5;
wire fdiv_guf_detect_fx5;
wire unfin_src_fx5;
wire fx5_09_scanin;
wire fx5_09_scanout;
wire fpx_unfin_vld_fx5;
wire ns_mode_fx5;
wire fpx_of_vld_fx5;
wire fpx_uf_vld_fx5;
wire fpx_nx_vld_fx5;
wire ecc_trap_fx5;
wire fpx_dzc_fx5;
wire fpx_nvc_fx5;
wire dp_zero_mant_fx5;
wire sp_zero_mant_fx5;
wire zero_mant_fx5;
wire ovf_detect_inf_fx5;
wire ovf_predict_inf_fx5;
wire ovf_detect_max_fx5;
wire ovf_predict_max_fx5;
wire unf_detect_fx5;
wire unf_predict_fx5;
wire unfin_early_fx5;
wire fpd_unfin_fx5;
wire fdiv_den2nor_m0_fx5;
wire i_fpx_ofc_fx5;
wire i_fpx_ufc_fx5;
wire eadj_unf_if_norcout_fx5;
wire mul_fmt_1xx_fx5;
wire mul_fmt_01x_fx5;
wire mul_fmt_m2_fx5;
wire mul_lsb_bit_dp_fx5;
wire mul_g_bit_dp_fx5;
wire mul_x_bit_dp_fx5;
wire mul_lsb_bit_sp_fx5;
wire mul_g_bit_sp_fx5;
wire mul_x_bit_sp_fx5;
wire mul_rinc_dp_fx5;
wire mul_rinc_sp_fx5;
wire mul_rinc_sel_fx5;
wire add_rinc_dp_fx5;
wire add_rinc_sp_fx5;
wire add_rinc_sel_fx5;
wire ovf_if_rcout_fx5;
wire fmul_unf_if_nocorl_fx5;
wire fmul_unf_if_nocorl_sp_fx5;
wire fmul_unf_if_nocorl_dp_fx5;
wire i_fpx_nxc_fx5;
wire div_finish_int_fb;
wire fb_00_scanin;
wire fb_00_scanout;
wire [1:0] fcc_fb;
wire idiv0_trap_fb;
wire ovf_if_rcout_fb;
wire fmul_unf_if_nocorl_sp_fb;
wire fmul_unf_if_nocorl_dp_fb;
wire fmul_unf_if_nocorl_fb;
wire eadj_unf_if_norcout_fb;
wire implied_bit_fb;
wire fsr_store_fb;
wire dec_valid_noflush_fb;
wire sp_zero_mant_fb;
wire dp_zero_mant_fb;
wire div_finish_fltd_fb;
wire div_finish_flts_fb;
wire fb_01_scanin;
wire fb_01_scanout;
wire [1:0] i_w1_vld_fb;
wire fb_03_scanin;
wire fb_03_scanout;
wire fpx_unfin_vld_fb;
wire ns_mode_fb;
wire unfin_early_fb;
wire fpx_of_vld_fb;
wire fpx_uf_vld_fb;
wire ecc_trap_fb;
wire fpx_dzc_fb;
wire fpx_nvc_fb;
wire i_fpx_ofc_fb;
wire i_fpx_ufc_fb;
wire i_fpx_nxc_fb;
wire fdiv_fdtos_den2nor_sp_fb;
wire fdiv_den2nor_dp_fb;
wire fdiv_den2nor_m0_fb;
wire div_dec_exp_fb;
wire fb_04_scanin;
wire fb_04_scanout;
wire [4:0] fsr_tem_fb;
wire fb_05_scanin;
wire fb_05_scanout;
wire i_fpc_fpd_exp_res_b0;
wire fpd_fsr_ofm_fb;
wire fpd_fsr_ufm_fb;
wire fpd_fsr_nxm_fb;
wire fpx_ofc_fb;
wire fpx_ufc_fb;
wire fpx_nxc_fb;
wire fpd_ofc_fb;
wire fpd_ufc_fb;
wire fpd_nxc_fb;
wire fpx_ieee_trap_fb;
wire [1:0] fpx_ftt_fb;
wire [1:0] fpd_ftt_fb;
wire [4:0] fpx_aexc_fb;
wire [4:0] fpd_aexc_fb;
wire [11:0] fsr_w1_result_fb;
wire [11:0] fsr_w2_result_fb;
wire fw_00_scanin;
wire fw_00_scanout;



// ----------------------------------------------------------------------------
// Interface with TLU
// ----------------------------------------------------------------------------

output         fpc_fpd_ieee_trap_fb;
output         fpc_fpx_unfin_fb;
output         fpc_fpd_unfin_fb;

output         fgu_fpx_ieee_trap_fw;
output         fgu_fpd_ieee_trap_fw;
output         fgu_fpx_unfin_fw;
output         fgu_fpd_unfin_fw;
output         fgu_fpd_idiv0_trap_fw;
output         fgu_predict_fx2;        // exception trap predicted

// ----------------------------------------------------------------------------
// Interface with LSU
// ----------------------------------------------------------------------------

input          lsu_fgu_exception_w;    // store exception detected
input          lsu_block_store_m;      // block store in progress

// ----------------------------------------------------------------------------
// Interface with EXU
// ----------------------------------------------------------------------------

input          exu_fgu_flush_m;        // EXU{1,0} src has bad ECC or exception, FGU must flush instr
input    [2:0] exu_fgu_gsr_m;          // GSR.align data:
                                       //   [31:3] = don't care
                                       //   [2:0]  = GSR.align
                                       //   GSR.mask data:
                                       //   [31:0] = GSR.mask

output   [3:0] fgu_exu_icc_fx5;
output   [1:0] fgu_exu_xcc_fx5;

// ----------------------------------------------------------------------------
// Interface with FAD
// ----------------------------------------------------------------------------

input  [63:15] fad_rs1_fx1;            // rs1 unformatted
input  [63:15] fad_rs2_fx1;            // rs2 unformatted
input    [1:0] fad_fsr_rd_fx1;
input    [4:0] fad_fsr_tem_fx1;
input          fad_fsr_ns_fx1;
input          fad_rs1_fmt_fx1_b62;
input          fad_rs2_fmt_fx1_b62;
input    [2:0] fad_gsr_imirnd_fx1;     // {GSR.im,GSR.irnd[1:0]}

output   [1:0] fpc_w1_vld_fb;          // FRF w1 write valid (qualified), [63:32],[31:0]
output         fpc_w1_ul_vld_fb;       // FRF w1 write valid (qualified), upper or lower
output   [1:0] fpc_fsr_w1_vld_fx5;     // FSR w1 write valid
output  [11:0] fpc_fsr_w1_result_fw;   // FSR w1 write data  {ftt,aexc,cexc}
output  [11:0] fpc_fsr_w2_result_fw;   // FSR w2 write data  {ftt,aexc,cexc}
output  [10:0] fpc_fpd_exp_res;        // FPD exponent result
output         fpc_fpd_sign_res;       // FPD sign result
output   [1:0] fpc_fpd_const_sel;      // 10=ones frac, 01=fdd frac, 00=zero frac
output   [1:0] fpc_fcc_fw;

// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

input    [3:0] fpf_b_gteq_a_fx2;       // FCMP (B-A) cout, doesn't account for MSB
input    [3:0] fpf_b_eq_a_fx2;         // FCMP (B=A), doesn't account for MSB
input    [1:0] fgu_cmp_fcc_fx3;        // fcmp  fcc data {fccX[1:0]}
input    [3:0] fgu_cmp_fcc_vld_fx3;    // fcmp  fcc data valid {fcc3, fcc2, fcc1, fcc0}
input          fpf_hi_aof_fx1;
input          fpf_lo_aof_fx1;
input          fpf_azf_fx1;            // rs1[62:0]==63'b0, must acct for rs1[63]
input          fpf_bzf_fx1;            // rs2[62:0]==63'b0, must acct for rs2[63]
input          fpf_aoe_fx1;
input          fpf_boe_fx1;
input          fpf_aze_fx1;
input          fpf_bze_fx1;
input   [63:9] fpf_ma_sum_fx4;         // main adder sum
input          fpf_ma_cout_fx4;        // main adder cout
input          fpf_cmp_swap_blta_fx2;
input          fpf_align_sticky_fx4_l;
input    [1:0] fpf_byte_unsure_x_sp_fx3;
input    [1:0] fpf_byte_unsure_x_dp_fx3;
input          fpf_rcout_fb;
input          fpf_implied_bit_fx5;

output   [5:0] fpc_result_sel_fx5;     // result select
output   [1:0] fpc_ovf_if_rcout_fx5;   // result select qualification for rcout
output   [3:0] fpc_vis_cmp_result_fx5; // vis cmp result data
output   [5:1] fpc_int_res_sel_fx4;    // select result for EXU{1,0}
output   [4:0] fpc_ma_fmt_sel_fx4;
output   [3:0] fpc_int_sel_fx5;        // 10=vis paritioned add or F(s,d)TO(i,x), 01=F(s,d)TO(i,x) zero result
output   [4:0] fpc_fconst_sel_fx5;
output         fpc_fp_cin00_fx2;       // main adder control
output         fpc_cin00_fx2;          // main adder control
output         fpc_cin16_48_fx2;       // main adder control
output         fpc_cin32_fx2;          // main adder control
output         fpc_prop16_48_fx2;      // main adder control
output         fpc_prop32_fx2;         // main adder control
output         fpc_mle_sel_fx2;
output   [2:0] fpc_mse_sel_fx2;
output         fpc_sign_fx5;           // result sign
output         fpc_sign_fb;            // result sign
output   [1:0] fpc_rd_mode_fx3;        // merged GSR.irnd, FSR.rd
output         fpc_emin_fx3;           // FDIV Eint=Emin
output         fpc_sp_dest_fx4;        // SP result dest
output         fpc_fadd_eac_enable_fx2;
output   [3:2] fpc_i2f_sel_fx1;        // 10=F(i,x)TO(s,d) 2's comp, 01=F(i,x)TO(s,d) not 2's comp
output         fpc_rinc_sel_fx5;
output         fpc_qthenan_fx4;        // quiet the propagating NaN, set frac MSB=1
output         fpc_den2nor_sp_fb;      // denorm intermediate result rounded to norm
output         fpc_den2nor_dp_fb;      // denorm intermediate result rounded to norm

// ----------------------------------------------------------------------------
// Interface with FPE
// ----------------------------------------------------------------------------

input          fpe_aux_rs2_fmt_fx1_b0;
input   [11:0] fpe_aux_eint_fx1;
input   [10:0] fpe_align_sel_fx2;
input   [10:0] fpe_rs1_fmt_fx1;
input   [10:0] fpe_rs2_fmt_fx1;
input          fpe_einty_adj_cout_fx5;
input          fpe_einty_eq_eadj_fx5;
output         fpc_exp_sel_mul_fx5;
output   [3:0] fpc_eintx_sel_fx2;      // FxTOs|FiTOs=001, FxTOd|FiTOd=010, F(s)MUL(s,d)=100
output   [2:0] fpc_eadjx_sel_fx2;      // F(i,x)TO(s,d)=001, FsTOd=010, FdTOs=100
output         fpc_q_rinc_sel_fx5;     // rinc_sel and ~logical_sub 00.1X

// ----------------------------------------------------------------------------
// Interface with FAC
// ----------------------------------------------------------------------------

input          fac_tlu_flush_fx3;
input    [2:0] fac_tid_e;
input          fac_dec_valid_fx1;
input    [2:0] fac_fpx_itype_fx1;      // instr type:
                                       // add=000, fpfp=001, fpint=010, intfp=011, cmp=100, mul=101, div=110, sqrt=111
input    [2:0] fac_fpx_dtype_fx1;      // destination type:
                                       // sp=000, dp=001, 16bit=010, 32bit=011, 64bit=100
input    [1:0] fac_fpx_stype_fx1;      // source type (for conversions & FsMULd/FMULd):
                                       // sp=00, dp=01, 32bit=10, 64bit=11
input          fac_fpx_sign_instr_fx1; // sign of the instr (1 if: FSUB(s,d),
                                       // FPSUB{16,32}{s})
input          fac_fpx_rnd_trunc_fx1;  // force rnd mode to truncate
                                       // (1 if: F(s,d)TOi, F(s,d)TOx,
                                       // FPADD{16,32}{s}, FPSUB{16,32}{s},
                                       // IMUL, IDIV, MULScc, 8x16 mul, SAVE, RESTORE
input          fac_fcmpe_fx1;          // FCMPE, not FCMP
input          fac_fpx_mulscc_fx1;     // MULScc
input          fac_fpx_saverestore_fx1;// SAVE or RESTORE
input          fac_fgx_pdist_fx1;      // PDIST
input          fac_fgx_popc_fx2;       // POPC
input          fac_fgx_mvcond_fx2;     // FMOV (conditional upon cc or r)
input          fac_fgx_mvucond_fx2;    // FMOV (unconditional)
input          fac_fgx_abs_fx2;        // FABS
input          fac_fgx_neg_fx2;        // FNEG
input          fac_fpx_nv_vld_fx1;     // set if instr updates invalid exception flag
input          fac_fpx_of_vld_fx1;     // set if instr updates overflow exception flag
input          fac_fpx_uf_vld_fx1;     // set if instr updates underflow exception flag
input          fac_fpx_dz_vld_fx1;     // set if instr updates divide by zero exception flag
input          fac_fpx_nx_vld_fx1;     // set if instr updates inexact exception flag
input          fac_fpx_unfin_vld_fx1;  // set if instr can generate unfinished_FPop

input          fac_fgx_instr_fx4;      // FGX instr decoded
input    [1:0] fac_w1_vld_fx1;
input          fac_w1_odd32b_fx1;

input    [3:1] fac_opf_fx2;            // instr opf field
input          fac_fgx_siam_fx2;       // SIAM
input          fac_div_valid_fx1;
input          fac_divq_valid_fx1;
input          fac_fsr_store_fx2;

input    [2:0] fac_gsr_asr_tid_fx2;
input          fac_rng_wr_gsr_3f;      // ASR GSR  write valid
input    [1:0] fac_gsr_w_vld_fx2;
input          fac_dec_valid_noflush_fx5;
input          fac_exu_src_e;

input          main_clken;             // main clken
input          coreon_clken;           // controls all "free running" flops

output   [3:0] fpc_fcc_vld_fx5;
output         fpc_stfsr_en_fx3to5;    // store FSR clears ftt

// ----------------------------------------------------------------------------
// Interface with FIC
// ----------------------------------------------------------------------------

input    [5:0] fic_norm_eadj_fx5;
input          fic_mulscc_iccz_fx4;
input          fic_mulscc_xccz_fx4;
input          fic_convert_sticky_fx4; // sticky for FxTOs, FiTOs, FdTOs
input          fic_fxtod_sticky_fx4;   // sticky for FxTOd
input          fic_ftoi_nx_fx4;        // inexact for FsTOi, FdTOi
input          fic_ftox_nx_fx4;        // inexact for FsTOx, FdTOx
input          fic_bzf31msb_fx2;       // rs2 frac 31 MSBs all zeros
input          fic_bzf32lsb_fx2;       // rs2 frac 32 LSBs all zeros
input          fic_bof22msb_fx2;       // rs2 frac 22 MSBs all ones
output         fpc_lzd_override_fx4;
output         fpc_sp_source_fx3;

// ----------------------------------------------------------------------------
// Interface with FDC
// ----------------------------------------------------------------------------

input 	       fdc_finish_fltd_early;
input          fdc_finish_flts_early;
input          fdc_finish_int_early;
input          fdc_flt_inexact;
input    [1:0] fdc_xicc_z_early;       // {xcc.z, icc.z} (one cyc before result data)
input          fdc_icc_v_early;        // icc.v          (one cyc before result data)
input          fdc_dec_exp_early;      // decrement Eint (one cyc before result data)
output         fpc_pre_div_flush_fx2;
output         fpc_div_default_res_fx2; // fdiv/fsqrt default result

// ----------------------------------------------------------------------------
// Interface with FDD
// ----------------------------------------------------------------------------

input  [63:31] fdd_result;
input          fdd_pte_cla_early_b63;

// ----------------------------------------------------------------------------
// Interface with FPY
// ----------------------------------------------------------------------------

input   [63:9] fgu_mul_result_fx5;
input          fpy_sticky_dp_fx5;
input          fpy_sticky_sp_fx5;
input    [1:0] fpy_xicc_z_fx5;         // {xcc.z, icc.z}

// ----------------------------------------------------------------------------
// Interface with DEC
// ----------------------------------------------------------------------------

input          dec_frf_r1_odd32b_d;
input          dec_frf_r2_odd32b_d;
input          dec_flush_f1;           // flush fx2 (xmit in fx1/m)
input          dec_flush_f2;           // flush fx3 (xmit in fx2/b)
input          dec_fgu_fmov_vld_m;     // FMOV condition is true
input    [1:0] dec_valid_e;            // used by FGU to qual store FSR update of FSR.ftt
input          dec_frf_store_d;

// ----------------------------------------------------------------------------
// Interface with FEC
// ----------------------------------------------------------------------------

input          fec_cecc_fx2;
input          fec_uecc_fx2;
output         fpc_frf_store_vld_fx1;

// ----------------------------------------------------------------------------
// Interface with FGD
// ----------------------------------------------------------------------------

output   [1:0] fpc_gsr0_mask_sel_fx3;
output   [1:0] fpc_gsr1_mask_sel_fx3;
output   [1:0] fpc_gsr2_mask_sel_fx3;
output   [1:0] fpc_gsr3_mask_sel_fx3;
output   [1:0] fpc_gsr4_mask_sel_fx3;
output   [1:0] fpc_gsr5_mask_sel_fx3;
output   [1:0] fpc_gsr6_mask_sel_fx3;
output   [1:0] fpc_gsr7_mask_sel_fx3;
output   [4:0] fpc_gsr_scale_fx4;
output   [2:0] fpc_gsr_align_fx4;
output  [10:0] fpc_gsr_asr_11bits_fx4;

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input  	       scan_in;
input          spc_aclk_wmr;
input          wmr_scan_in;
input  	       tcu_pce_ov;	       // scan signals
input  	       spc_aclk;
input  	       spc_bclk;
input	       tcu_scan_en;
input          mbi_run;                // MBIST
input   [27:0] in_rngl_cdbus;          // ASI local ring

output 	       scan_out;
output         wmr_scan_out;


// scan renames
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign siclk  = spc_aclk;
assign soclk  = spc_bclk;
assign se     = tcu_scan_en;
// end scan


fgu_fpc_ctl_l1clkhdr_ctl_macro clkgen_coreon (
  .l2clk(l2clk),
  .l1en (coreon_clken),
  .l1clk(l1clk_pm2),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fpc_ctl_l1clkhdr_ctl_macro clkgen_main (
  .l2clk(l2clk),
  .l1en (main_clken),
  .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fpc_ctl_spare_ctl_macro__num_9 spares  (  // spares: 13 gates + 1 flop for each "num"
  .scan_in(spares_scanin),
  .scan_out(spares_scanout),
  .l1clk(l1clk_pm2),
  .siclk(siclk),
  .soclk(soclk)
  );


// ----------------------------------------------------------------------------
//                               E stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_3 e_00  (
  .scan_in(e_00_scanin),
  .scan_out(e_00_scanout),
  .l1clk(l1clk_pm2),
  .din ({dec_frf_r1_odd32b_d,  // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_odd32b_d,  // requires free running clk or dec_fgu_decode_d en
         dec_frf_store_d}),    // requires free running clk or dec_fgu_decode_d en
  .dout({        r1_odd32b_e,
                 r2_odd32b_e,
             frf_store_e}),
  .siclk(siclk),
  .soclk(soclk)
  );


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_2 fx1_00  (
  .scan_in(fx1_00_scanin),
  .scan_out(fx1_00_scanout),
  .l1clk(l1clk_pm1),
  .din (dec_valid_e[1:0]    ),
  .dout(i_fst_valid_fx1[1:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_8 fx1_01  (
  .scan_in(fx1_01_scanin),
  .scan_out(fx1_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({r1_odd32b_e,
         r2_odd32b_e,
         fac_tid_e[2:0],
         frf_store_e,
         fac_exu_src_e,
         mbi_run}),
  .dout({r1_odd32b_fx1,
         r2_odd32b_fx1,
         tid_fx1[2:0],
         frf_store_fx1,
             exu_src_fx1,
         mbist_run_1f}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fst_valid_fx1 =
  (i_fst_valid_fx1[0] & (tid_fx1[2:0] <= 3'd3)) |
  (i_fst_valid_fx1[1] & (tid_fx1[2:0] >= 3'd4)) ;

assign  fpc_frf_store_vld_fx1 =  (fst_valid_fx1 | lsu_block_store_m) & frf_store_fx1;

assign  int_rs2_zero_fx1 = fpf_bzf_fx1 & ~fad_rs2_fx1[63];

assign  idiv0_trap_fx1 =
  fac_dec_valid_fx1 &
  int_rs2_zero_fx1  &
  (fac_fpx_itype_fx1[2:1] == 2'b11) &      // div/sqrt
  ((fac_fpx_dtype_fx1[2:0] == 3'b011) |
   (fac_fpx_dtype_fx1[2:0] == 3'b100)  );  // (32/64b dest)

assign  eintx_sel_fx1[3] =  // F(s)MUL(s,d)
  (fac_fpx_itype_fx1[2:0] == 3'b101);

assign  eintx_sel_fx1[2] =  // F(i,x)TOd
  (fac_fpx_itype_fx1[2:0] == 3'b011) &
  (fac_fpx_dtype_fx1[0]   == 1'b1  ) ;

assign  eintx_sel_fx1[1] =  // F(i,x)TOs
  (fac_fpx_itype_fx1[2:0] == 3'b011) &
  (fac_fpx_dtype_fx1[0]   == 1'b0  ) ;

assign  eintx_sel_fx1[0] =  // NaN (or inf)
  (fp_dual_source_fx1 & fpf_aoe_fx1) |
  (fp_source_fx1      & fpf_boe_fx1) ;

assign  eadjx_sel_fx1[2] =  // FdTOs
  (fac_fpx_itype_fx1[2:0] == 3'b001) &
  (fac_fpx_dtype_fx1[0]   == 1'b0  ) &
  (~fpf_boe_fx1                    ) ;  // don't adj exp if NaN (or inf)

assign  eadjx_sel_fx1[1] =  // FsTOd
  (fac_fpx_itype_fx1[2:0] == 3'b001) &
  (fac_fpx_dtype_fx1[0]   == 1'b1  ) &
  (~fpf_boe_fx1                    ) ;  // don't adj exp if NaN (or inf)

assign  eadjx_sel_fx1[0] =  // F(i,x)TO(s,d)
  (fac_fpx_itype_fx1[2:0] == 3'b011) ;

assign  fpc_i2f_sel_fx1[2] =  // F(i,x)TO(s,d) not 2's comp
  ~((~r2_odd32b_fx1 & fad_rs2_fx1[63]) |
    ( r2_odd32b_fx1 & fad_rs2_fx1[31])  ) &
  (fac_fpx_itype_fx1[2:0] == 3'b011);

assign  fpc_i2f_sel_fx1[3] =  // F(i,x)TO(s,d) 2's comp
   ((~r2_odd32b_fx1 & fad_rs2_fx1[63]) |
    ( r2_odd32b_fx1 & fad_rs2_fx1[31])  ) &
  (fac_fpx_itype_fx1[2:0] == 3'b011);

assign  fp_source_fx1 =
  ((fac_fpx_itype_fx1[2:0] == 3'b000) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // add/sub
  ((fac_fpx_itype_fx1[2:0] == 3'b100) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // cmp
  ((fac_fpx_itype_fx1[2:0] == 3'b110) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // div
  ((fac_fpx_itype_fx1[2:0] == 3'b111) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // sqrt
  ((fac_fpx_itype_fx1[2:0] == 3'b101) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // mul
  ((fac_fpx_itype_fx1[2:0] == 3'b001)                                    ) | // fpfp
  ((fac_fpx_itype_fx1[2:0] == 3'b010)                                    ) ; // fpint

assign  fp_dual_source_fx1 =
  ((fac_fpx_itype_fx1[2:0] == 3'b000) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // add/sub
  ((fac_fpx_itype_fx1[2:0] == 3'b100) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // cmp
  ((fac_fpx_itype_fx1[2:0] == 3'b110) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) | // div
  ((fac_fpx_itype_fx1[2:0] == 3'b101) & (fac_fpx_dtype_fx1[2:1] == 2'b00)) ; // mul

// ------------------------------------
// Merge GSR.irnd, FSR.rd
//   - force round mode to truncate (2'b01) if rnd_trunc
// ------------------------------------

assign  rd_mode_fx1[1:0] =
  ({2{ fac_fpx_rnd_trunc_fx1              }} & (2'b01              )) |
  ({2{~fac_fpx_rnd_trunc_fx1 &  gsr_im_fx3}} & (gsr_irnd_fx3[1:0]  )) |
  ({2{~fac_fpx_rnd_trunc_fx1 & ~gsr_im_fx3}} & (fad_fsr_rd_fx1[1:0])) ;

assign  ns_mode_fx1 =  // mask FSR.ns if GSR.im=1
  ~gsr_im_fx3 & fad_fsr_ns_fx1;

// ------------------------------------
// logical subtract (effective subtract)
// = ((Sa xor Sb) xor Si) and SP add/sub or DP add/sub
// OR fpint and negative source
// OR intfp and negative source
// OR partitioned subtract
// ------------------------------------

assign  rs1_sign_fx1 =
  (~r1_odd32b_fx1 & fad_rs1_fx1[63]) |
  ( r1_odd32b_fx1 & fad_rs1_fx1[31]) ;

assign  rs2_sign_fx1 =
  (~r2_odd32b_fx1 & fad_rs2_fx1[63]) |
  ( r2_odd32b_fx1 & fad_rs2_fx1[31]) ;

assign  fadd_logical_sub_fx1 =
  ((fac_fpx_itype_fx1[2:0] == 3'b000) &
   (fac_fpx_dtype_fx1[2:1] == 2'b00 ) &  // SP/DP add/sub
   ((rs1_sign_fx1 ^ rs2_sign_fx1) ^ fac_fpx_sign_instr_fx1));

assign  logical_sub_fx1 =
  fadd_logical_sub_fx1 |
  ((fac_fpx_itype_fx1[2:1] == 2'b01 ) &  // fpint/intfp
    rs2_sign_fx1                                 ) |
  ((fac_fpx_itype_fx1[2:0] == 3'b000) &
   (fac_fpx_dtype_fx1[2:1] == 2'b01 ) &  // 16/32b add/sub
                                    fac_fpx_sign_instr_fx1 );

assign  fadd_logical_add_fx1 =
  ((fac_fpx_itype_fx1[2:0] == 3'b000) &
   (fac_fpx_dtype_fx1[2:1] == 2'b00 ) &  // SP/DP add/sub
  ~((rs1_sign_fx1 ^ rs2_sign_fx1) ^ fac_fpx_sign_instr_fx1));

// ------------------------------------
// Exponent overflow prediction FADD/FSUB, FdTOs
// Exponent overflow detection  FdTOs
// Exponent overflow prediction FMUL
// Exponent overflow detection  FMUL
// Note: FDIV is not required to participate in exception trap prediction
// Exponent overflow prediction FDIV
// Exponent overflow detection  FDIV
// ------------------------------------

assign  aux_enable_ovf_fx1 =           // ensure overflow, not underflow
  (fad_rs1_fx1[62] & ~r1_odd32b_fx1) |
  (fad_rs1_fx1[30] &  r1_odd32b_fx1) ;

assign  fmul_enable_ovf_predict_fx1 =  // ensure overflow, not underflow
  ((fad_rs1_fx1[62:52] == 11'b01111111111) &  fac_fpx_dtype_fx1[0]                 ) |
  ((fad_rs1_fx1[62:55] ==  8'b01111111   ) & ~fac_fpx_dtype_fx1[0] & ~r1_odd32b_fx1) |
  ((fad_rs1_fx1[30:23] ==  8'b01111111   ) & ~fac_fpx_dtype_fx1[0] &  r1_odd32b_fx1) ;

assign  aux_eint_ovf_fx1 =  // FDIV/FMUL overflow detection
  aux_enable_ovf_fx1 &
  (( fpe_aux_eint_fx1[8] & ~fac_fpx_dtype_fx1[0]) |     // sp eint cout
   ( fpe_aux_eint_fx1[11] &  fac_fpx_dtype_fx1[0])  ) &  // dp eint cout
  ((~fpe_aux_eint_fx1[7] & ~fac_fpx_dtype_fx1[0]) |     // sp
   (~fpe_aux_eint_fx1[10] &  fac_fpx_dtype_fx1[0])  ) ;  // dp

assign  aux_eint_emax_fx1 =
  ((fpe_aux_eint_fx1[7:0] ==  8'b11111110   ) & ~fac_fpx_dtype_fx1[0]) |  // sp eint Emax
  ((fpe_aux_eint_fx1[10:0] == 11'b11111111110) &  fac_fpx_dtype_fx1[0]) ;  // dp eint Emax

assign  aux_eint_emaxp1_fx1 =
  ((fpe_aux_eint_fx1[7:0] ==  8'b11111111   ) & ~fac_fpx_dtype_fx1[0]) |  // sp eint Emax+1
  ((fpe_aux_eint_fx1[10:0] == 11'b11111111111) &  fac_fpx_dtype_fx1[0]) ;  // dp eint Emax+1

assign  fadd_ovf_predict_fx1 =
  fadd_logical_add_fx1                                &  // req. for correct dpmax-dpmax=0 result
  ~(fpf_aoe_fx1                                     ) &  // Ea != (nan | inf), req. for correct ofc result
  ~(fpf_boe_fx1                                     ) &  // Eb != (nan | inf), req. for correct ofc result
  ~(fpf_aze_fx1                                     ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                                     ) &  // Eb != (zero| den)
  (((~fac_fpx_dtype_fx1[0] | (&fpe_rs1_fmt_fx1[10:8])) &
    (fpe_rs1_fmt_fx1[7:0] == 8'b11111110)               ) |    // FADD/FSUB Ea=Emax
   ((~fac_fpx_dtype_fx1[0] | (&fpe_rs2_fmt_fx1[10:8])) &
    (fpe_rs2_fmt_fx1[7:0] == 8'b11111110)               )  );  // FADD/FSUB Eb=Emax

// 0in bits_on -max 1 -var {fadd_ovf_predict_fx1, fdtos_ovf_predict_fx1, fdtos_ovf_detect_fx1, fmul_ovf_predict_fx1, fmul_ovf_detect_fx1, fdiv_ovf_predict_fx1, fdiv_ovf_detect_fx1, fdtos_unf_detect_fx1, fmul_unf_predict_fx1, fmul_unf_detect_fx1, fdiv_unf_predict_fx1, fdiv_unf_detect_fx1} -active (fac_dec_valid_fx1 & fp_source_fx1)

assign  fdtos_ovf_predict_fx1 =
   (fpe_rs2_fmt_fx1[10:0]  == 11'b10001111110) &  // 2^(Emax_sp+896=1150)
   (fac_fpx_itype_fx1[2:0] ==  3'b001        ) ;  // fpfp

assign  fdtos_ovf_detect_fx1 =
   (fpe_rs2_fmt_fx1[10:0]  >  11'b10001111110) &  // 2^(Emax_sp+896>1150)
  ~(fpf_boe_fx1                              ) &  // Eb != (nan | inf)
   (fac_fpx_itype_fx1[2:0] ==  3'b001        ) ;  // fpfp

assign  fmul_ovf_predict_fx1 =
   (aux_eint_emax_fx1                               ) &  // FMUL Eint=Emax
   (aux_enable_ovf_fx1 | fmul_enable_ovf_predict_fx1) &  // ensure overflow, not underflow
  ~(fpf_aoe_fx1                                     ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                                     ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                                     ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                                     ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b101              ) ;  // mul

assign  fmul_ovf_detect_fx1 =
   (aux_eint_emaxp1_fx1 |                                // FMUL Eint=Emax+1
    aux_eint_ovf_fx1                                ) &  // FMUL Eint>Emax+1
   (aux_enable_ovf_fx1                              ) &  // ensure overflow, not underflow
  ~(fpf_aoe_fx1                                     ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                                     ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                                     ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                                     ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b101              ) ;  // mul

assign  fdiv_ovf_predict_fx1 =
    (aux_eint_emaxp1_fx1                      ) &     // FDIV Eint=Emax+1
    (aux_enable_ovf_fx1                       ) &     // ensure overflow, not underflow
   ~(fpf_aoe_fx1                              ) &     // Ea != (nan | inf)
   ~(fpf_boe_fx1                              ) &     // Eb != (nan | inf)
   ~(fpf_aze_fx1                              ) &     // Ea != (zero| den)
   ~(fpf_bze_fx1                              ) &     // Eb != (zero| den)
    (fac_fpx_itype_fx1[2:0] ==  3'b110        ) ;     // div

assign  fdiv_ovf_detect_fx1 =
  ( (aux_eint_ovf_fx1                         ) &     // FDIV Eint>Emax+1
   ~(fpf_aoe_fx1                              ) &     // Ea != (nan | inf)
   ~(fpf_boe_fx1                              ) &     // Eb != (nan | inf)
   ~(fpf_aze_fx1                              ) &     // Ea != (zero| den)
   ~(fpf_bze_fx1                              ) &     // Eb != (zero| den)
    (fac_fpx_itype_fx1[2:0] ==  3'b110        )  ) |  // div
// Note: norm divided by denorm will never produce 0.XX frac, thus Eint=Emax+1
//       prediction based on 0.XX frac is not required
  ( (fpf_bze_fx1 & ~fpf_bzf_fx1 & ~ns_mode_fx1) &     // FDIV Eb=den
    (fpe_rs1_fmt_fx1[10:0]  >= 11'b10000000001) &     // Ea = 11'h401
   ~(fpf_aoe_fx1                              ) &     // Ea != (nan | inf)
    (fac_fpx_dtype_fx1[0]   ==  1'b1          ) &     // dp
    (fac_fpx_itype_fx1[2:0] ==  3'b110        )  ) |  // div
  ( (fpf_bze_fx1 & ~fpf_bzf_fx1 & ~ns_mode_fx1) &     // FDIV Eb=den
    (fpe_rs1_fmt_fx1[7:0]  >=  8'b10000001   ) &     // Ea =  8'h81
   ~(fpf_aoe_fx1                              ) &     // Ea != (nan | inf)
    (fac_fpx_dtype_fx1[0]   ==  1'b0          ) &     // sp
    (fac_fpx_itype_fx1[2:0] ==  3'b110        )  ) ;  // div

// ------------------------------------
// Exponent       underflow prediction FdTOs
// Exponent       underflow detection  FdTOs
// Exponent gross underflow detection  FdTOs
// Exponent       underflow prediction FMUL
// Exponent       underflow detection  FMUL
// Note: FDIV is not required to participate in exception trap prediction
// Exponent       underflow prediction FDIV
// Exponent       underflow detection  FDIV
// ------------------------------------

assign  aux_enable_unf_fx1 =           // ensure underflow, not overflow
  (~fad_rs1_fx1[62] & ~r1_odd32b_fx1) |
  (~fad_rs1_fx1[30] &  r1_odd32b_fx1) ;

assign  fdiv_enable_unf_predict_fx1 =  // ensure underflow, not overflow
  ((fad_rs1_fx1[62:52] == 11'b10000000000) &  fac_fpx_dtype_fx1[0]                 ) |
  ((fad_rs1_fx1[62:55] ==  8'b10000000   ) & ~fac_fpx_dtype_fx1[0] & ~r1_odd32b_fx1) |
  ((fad_rs1_fx1[30:23] ==  8'b10000000   ) & ~fac_fpx_dtype_fx1[0] &  r1_odd32b_fx1) ;

assign  aux_eint_unf_fx1 =  // FDIV/FMUL underflow detection
  aux_enable_unf_fx1 &
  ((~fpe_aux_eint_fx1[8] & ~fac_fpx_dtype_fx1[0]) |     // sp eint ~cout
   (~fpe_aux_eint_fx1[11] &  fac_fpx_dtype_fx1[0])  ) &  // dp eint ~cout
  (( fpe_aux_eint_fx1[7] & ~fac_fpx_dtype_fx1[0]) |     // sp
   ( fpe_aux_eint_fx1[10] &  fac_fpx_dtype_fx1[0])  ) ;  // dp

assign  aux_eint_emin_fx1 =
  ((fpe_aux_eint_fx1[7:0] ==  8'b00000001   ) & ~fac_fpx_dtype_fx1[0]) |     // sp eint Emin
  ((fpe_aux_eint_fx1[10:0] == 11'b00000000001) &  fac_fpx_dtype_fx1[0]) ;     // dp eint Emin

assign  aux_eint_eminm1_fx1 =
  ((fpe_aux_eint_fx1[7:0] ==  8'b00000000   ) & ~fac_fpx_dtype_fx1[0]) |     // sp eint Emin-1
  ((fpe_aux_eint_fx1[10:0] == 11'b00000000000) &  fac_fpx_dtype_fx1[0]) ;     // dp eint Emin-1

assign  aux_eint_eminm2_fx1 =
  aux_eint_unf_fx1 &
  (((fpe_aux_eint_fx1[7:0] ==  8'b11111111   ) & ~fac_fpx_dtype_fx1[0]) |    // sp eint Emin-2
   ((fpe_aux_eint_fx1[10:0] == 11'b11111111111) &  fac_fpx_dtype_fx1[0])  );  // dp eint Emin-2

// Gross underflow detection:
// - Unnorm Eint is used for guf detection
// - For guf calculation, denorm Ea/Eb is treated as zero, not Emin
// - For fmul guf calculation, 1X.XX intermediate format has no effect
// - fdiv:  Eint=Ea-Eb+bias-1
// - fmul:  Eint=Ea+Eb-bias
// - fdtos: Eint=Eb-896
// - gross unf (sp exp <= -25, dp exp <= -54)

assign  fdtos_guf_detect_fx1 =
  (fpe_rs2_fmt_fx1[10:0]  <  11'b01101101000               ) &  // 2^(872), 871-896=-25
 ~((fpe_rs2_fmt_fx1[10:0] == 11'b00000000000) & fpf_bzf_fx1) &  // ~zero src
 ~((rd_mode_fx1[1:0]      ==  2'b10) & ~fad_rs2_fx1[63]    ) &  // ~(pos. & rnd=+inf)
 ~((rd_mode_fx1[1:0]      ==  2'b11) &  fad_rs2_fx1[63]    ) &  // ~(neg. & rnd=-inf)
 ~(ns_mode_fx1                                             ) &
  (fac_fpx_itype_fx1[2:0] ==  3'b001                       ) &  // fpfp
  (fac_fpx_dtype_fx1[0]   ==  1'b0                         ) ;  // sp

assign  fmul_guf_detect_fx1 =
  aux_eint_unf_fx1 &                                          // Eint<Emin-1
  (fac_fpx_itype_fx1[2:0]   ==  3'b101) &                     // mul
  (fac_fpx_dtype_fx1[2:1]   ==  2'b00 ) &                     // sp/dp
 ~(fpf_aoe_fx1                        ) &                     // Ea != (nan | inf)
 ~(fpf_boe_fx1                        ) &                     // Eb != (nan | inf)
 ~(fpf_aze_fx1 & fpf_azf_fx1          ) &                     //  a !=  zero
 ~(fpf_bze_fx1 & fpf_bzf_fx1          ) &                     //  b !=  zero
 ~((rd_mode_fx1[1:0] == 2'b10) & ~(rs1_sign_fx1 ^ rs2_sign_fx1)) &  // ~(pos. & rnd=+inf)
 ~((rd_mode_fx1[1:0] == 2'b11) &  (rs1_sign_fx1 ^ rs2_sign_fx1)) &  // ~(neg. & rnd=-inf)
 ~(ns_mode_fx1                                             ) &
  (((fpe_aux_eint_fx1[7:0] <=  8'b11100111   ) & ~fac_fpx_dtype_fx1[0]) |    // sp Eint<=-25 (Eint=Ea+Eb-bias)
   ((fpe_aux_eint_fx1[10:0] <= 11'b11111001010) &  fac_fpx_dtype_fx1[0])  );  // dp Eint<=-54 (Eint=Ea+Eb-bias)

assign  fdiv_guf_detect_fx1 =
  aux_eint_unf_fx1 &                                          // Eint<Emin-1
  (fac_fpx_itype_fx1[2:0]   ==  3'b110) &                     // div
  (fac_fpx_dtype_fx1[2:1]   ==  2'b00 ) &                     // sp/dp
 ~(fpf_aoe_fx1                        ) &                     // Ea != (nan | inf)
 ~(fpf_boe_fx1                        ) &                     // Eb != (nan | inf)
 ~(fpf_aze_fx1 & fpf_azf_fx1          ) &                     //  a !=  zero
 ~(fpf_bze_fx1 & fpf_bzf_fx1          ) &                     //  b !=  zero
 ~((rd_mode_fx1[1:0] == 2'b10) & ~(rs1_sign_fx1 ^ rs2_sign_fx1)) &  // ~(pos. & rnd=+inf)
 ~((rd_mode_fx1[1:0] == 2'b11) &  (rs1_sign_fx1 ^ rs2_sign_fx1)) &  // ~(neg. & rnd=-inf)
 ~(ns_mode_fx1                                             ) &
  (((fpe_aux_eint_fx1[7:0] <=  8'b11101000   ) & ~fac_fpx_dtype_fx1[0]) |    // sp Eint<=-24 (Eint=Ea-Eb+bias-1)
   ((fpe_aux_eint_fx1[10:0] <= 11'b11111001011) &  fac_fpx_dtype_fx1[0])  );  // dp Eint<=-53 (Eint=Ea-Eb+bias-1)

assign  fdtos_unf_predict_fx1 =
  (fpe_rs2_fmt_fx1[10:0]  == 11'b01110000000) &  // 2^(896)
  (fac_fpx_itype_fx1[2:0] ==  3'b001        ) ;  // fpfp

assign  fdtos_unf_detect_fx1 =
  (fpe_rs2_fmt_fx1[10:0]  <  11'b01110000000) &  // 2^(896)
 ~(fpe_rs2_fmt_fx1[10:0]  == 11'b00000000000) &  // ~(zero|denorm)
  (fac_fpx_itype_fx1[2:0] ==  3'b001        ) &  // fpfp
  (fac_fpx_dtype_fx1[0]   ==  1'b0          ) ;  // sp

assign  fmul_unf_predict_fx1 =
   (aux_eint_eminm1_fx1               ) &  // FMUL Eint=Emin-1
   (aux_enable_unf_fx1                ) &  // ensure underflow, not overflow
  ~(fpf_aoe_fx1                       ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                       ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                       ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                       ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b101) &  // mul
   (fac_fpx_dtype_fx1[2:1]  ==  2'b00 ) ;  // sp/dp

assign  fmul_unf_detect_fx1 =	        
   (aux_eint_unf_fx1                  ) &  // FMUL Eint<Emin-1
  ~(fpf_aoe_fx1                       ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                       ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                       ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                       ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b101) &  // mul
   (fac_fpx_dtype_fx1[2:1]  ==  2'b00 ) ;  // sp/dp

assign  fdiv_unf_predict_fx1 =			  
   (aux_eint_emin_fx1                               ) &  // FDIV Eint=Emin
   (aux_enable_unf_fx1 | fdiv_enable_unf_predict_fx1) &  // ensure underflow, not overflow
  ~(fpf_aoe_fx1                                     ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                                     ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                                     ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                                     ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b110              ) ;  // div
						  
assign  fdiv_unf_detect_fx1 =
   (aux_eint_eminm1_fx1 |                                // FDIV Eint=Emin-1
    aux_eint_unf_fx1                                ) &  // FDIV Eint<Emin-1
   (aux_enable_unf_fx1                              ) &  // ensure underflow, not overflow
  ~(fpf_aoe_fx1                                     ) &  // Ea != (nan | inf)
  ~(fpf_boe_fx1                                     ) &  // Eb != (nan | inf)
  ~(fpf_aze_fx1                                     ) &  // Ea != (zero| den)
  ~(fpf_bze_fx1                                     ) &  // Eb != (zero| den)
   (fac_fpx_itype_fx1[2:0]  ==  3'b110              ) ;  // div

// ------------------------------------
// Exception trap prediction
// - IDIV, FDIV, FSQRT do not participate in exception trap prediction.
//   Once an FPD instr has been issued, no other instr from that thread
//   can be issued until the older FPD instr has completed or has been flushed.
// ------------------------------------

assign  snan_or_inf_fx1 =
  (fpf_aoe_fx1 & fp_dual_source_fx1 & ~fad_rs1_fmt_fx1_b62) |
  (fpf_boe_fx1 &                      ~fad_rs2_fmt_fx1_b62) ;

assign  nan_or_inf_fx1 =
  (fac_fcmpe_fx1 &
   (fac_fpx_itype_fx1[2:0] == 3'b100) & (fac_fpx_dtype_fx1[2:1] == 2'b00) &     // FCMPE(s,d)
                                        (fpf_aoe_fx1 | fpf_boe_fx1)        ) |
  ((fac_fpx_itype_fx1[2:0] == 3'b010) &                fpf_boe_fx1         ) ;  // F(s,d)TO(i,x)

assign  large_maxint_predict_fx1 =

  ((fpe_rs2_fmt_fx1[10:0] >= 11'b10000111110) &     // 2^(63+1023)
   (fac_fpx_itype_fx1[2:0] == 3'b010) &
   (fac_fpx_stype_fx1[1:0] == 2'b01 ) &
   (fac_fpx_dtype_fx1[2:0] == 3'b100)          ) |  // FdTOx

  ((fpe_rs2_fmt_fx1[7:0]  >=     8'b10111110) &     // 2^(63+ 127)
   (fac_fpx_itype_fx1[2:0] == 3'b010) &
   (fac_fpx_stype_fx1[1:0] == 2'b00 ) &
   (fac_fpx_dtype_fx1[2:0] == 3'b100)          ) |  // FsTOx

  ((fpe_rs2_fmt_fx1[10:0] >= 11'b10000011110) &     // 2^(31+1023)
   (fac_fpx_itype_fx1[2:0] == 3'b010) &
   (fac_fpx_stype_fx1[1:0] == 2'b01 ) &
   (fac_fpx_dtype_fx1[2:0] == 3'b011)          ) |  // FdTOi

  ((fpe_rs2_fmt_fx1[7:0]  >=     8'b10011110) &     // 2^(31+ 127)
   (fac_fpx_itype_fx1[2:0] == 3'b010) &
   (fac_fpx_stype_fx1[1:0] == 2'b00 ) &
   (fac_fpx_dtype_fx1[2:0] == 3'b011)          ) ;  // FsTOi

assign  fadd_unf_predict_fx1 =

  fadd_logical_sub_fx1 &
  ~fpf_aze_fx1         &                        // Ea != (zero| den)
  ~fpf_bze_fx1         &                        // Eb != (zero| den)

  (( fpe_rs1_fmt_fx1[10:1]          ==
     fpe_rs2_fmt_fx1[10:1]              ) |     // shift count (SC) = 0 (or possibly 1)
   ((fpe_rs1_fmt_fx1[10:0] + 11'd1) ==
     fpe_rs2_fmt_fx1[10:0]              ) |     // Ea+1=Eb     (SC) = 1
   ((fpe_rs2_fmt_fx1[10:0] + 11'd1) ==
     fpe_rs1_fmt_fx1[10:0]              )  ) &  // Eb+1=Ea     (SC) = 1

  ((~fac_fpx_dtype_fx1[0]              &        // SP
    ~(fpe_rs1_fmt_fx1[7:0]  >=  8'd25) &        // Ea !>=25
    ~(fpe_rs2_fmt_fx1[7:0]  >=  8'd25)  ) |     // Eb !>=25

   ( fac_fpx_dtype_fx1[0]              &        // DP
    ~(fpe_rs1_fmt_fx1[10:0] >= 11'd54) &        // Ea !>=54
    ~(fpe_rs2_fmt_fx1[10:0] >= 11'd54)  )  ) ;  // Eb !>=54

assign  fadd_fcvt_denorm_detect_fx1 =
  ~ns_mode_fx1 &

  ((((fpf_aze_fx1 & ~fpf_azf_fx1) | (fpf_bze_fx1 & ~fpf_bzf_fx1)) &     // denorm a or b
    (fac_fpx_itype_fx1[2:0] == 3'b000) &
    (fac_fpx_dtype_fx1[2:1] == 2'b00 ) &                                // FADD/FSUB
    fac_fpx_unfin_vld_fx1                                          ) |  // must not include FMOV/FABS/FNEG
   
   (                                (fpf_bze_fx1 & ~fpf_bzf_fx1)  &     // denorm      b
    (fac_fpx_itype_fx1[2:0] == 3'b010)                             ) |  // F(s,d)TO(i,x)

   (                                (fpf_bze_fx1 & ~fpf_bzf_fx1)  &     // denorm      b
    ~(~fad_fsr_tem_fx1[2] & fdtos_guf_detect_fx1) &                     // ~(gross_unf and UFM=0)
    (fac_fpx_itype_fx1[2:0] == 3'b001)                             ));  // F(s,d)TO(d,s)

assign  fmul_denorm_detect_fx1 =
  ~ns_mode_fx1 &
   ( ((fpf_aze_fx1 & ~fpf_azf_fx1) | (fpf_bze_fx1 & ~fpf_bzf_fx1)) &    //   denorm a or b
    ~(~fad_fsr_tem_fx1[2] & fmul_guf_detect_fx1 ) &                     // ~(gross_unf & UFM=0)
    ~((fpf_aze_fx1 &  fpf_azf_fx1) | (fpf_bze_fx1 &  fpf_bzf_fx1)) &    // ~(zero   a or b)
    (fac_fpx_itype_fx1[2:0] == 3'b101) &                                // note: FsMULd never underflows
    (fac_fpx_dtype_fx1[2:1] == 2'b00 )                             );   // FsMULd, FMUL(s,d)

assign  q_fmul_unf_predict_fx1 =
   (                          ( fad_fsr_tem_fx1[2] | ~ns_mode_fx1)
                           &  (fmul_unf_predict_fx1 | fmul_unf_detect_fx1)
                           & ~(~fad_fsr_tem_fx1[2] & fmul_guf_detect_fx1 )    ) ;

assign  i_predict_fx1 =

  ( fac_fpx_nv_vld_fx1 & ~(fac_fpx_itype_fx1[2:1] == 2'b11)        // not div/sqrt
                          &    fad_fsr_tem_fx1[4] & snan_or_inf_fx1          ) |
  (                            fad_fsr_tem_fx1[4] &  nan_or_inf_fx1          ) |
  (                            fad_fsr_tem_fx1[4] & large_maxint_predict_fx1 ) |

  ( fac_fpx_of_vld_fx1    &    fad_fsr_tem_fx1[3] & fadd_ovf_predict_fx1     ) |
  ( fac_fpx_of_vld_fx1    &    fad_fsr_tem_fx1[3] & fmul_ovf_predict_fx1     ) |
  ( fac_fpx_of_vld_fx1    &    fad_fsr_tem_fx1[3] & fmul_ovf_detect_fx1      ) |
  ( fac_fpx_of_vld_fx1    &    fad_fsr_tem_fx1[3] & fdtos_ovf_predict_fx1    ) |
  ( fac_fpx_of_vld_fx1    &    fad_fsr_tem_fx1[3] & fdtos_ovf_detect_fx1     ) |
   
  ( fac_fpx_uf_vld_fx1    &  ( fad_fsr_tem_fx1[2] | ~ns_mode_fx1)
                                                  & fadd_unf_predict_fx1     ) |
  (                          ( fad_fsr_tem_fx1[2] | ~ns_mode_fx1)
                                                  & fdtos_unf_predict_fx1    ) |
  ((                         ( fad_fsr_tem_fx1[2] | ~ns_mode_fx1)
                                                  & fdtos_unf_detect_fx1    )
                          & ~(~fad_fsr_tem_fx1[2] & fdtos_guf_detect_fx1)    ) |

//( fac_fpx_dz_vld_fx1    &    fad_fsr_tem_fx1[1]                            ) |

  ( fac_fpx_nx_vld_fx1 & ~( fac_fpx_itype_fx1[2:1] == 2'b11  )     // not div/sqrt
                       & ~((fac_fpx_itype_fx1[2:0] == 3'b001)  &
                           (fac_fpx_dtype_fx1[0]   == 1'b1  ))     // not FsTOd
                       & ~((fac_fpx_itype_fx1[2:0] == 3'b101)  &
                           (fac_fpx_stype_fx1[1:0] == 2'b00 )  &
                           (fac_fpx_dtype_fx1[2:0] == 3'b001))     // not FsMULd
                          &    fad_fsr_tem_fx1[0]                            ) |
  ( fac_fpx_nx_vld_fx1 & (( fpf_bze_fx1                        &
                           (fac_fpx_itype_fx1[2:0] == 3'b001)  &
                           (fac_fpx_dtype_fx1[0]   == 1'b1  )) |   //     FsTOd
                          ((fpf_aze_fx1 | fpf_bze_fx1       )  &
                           (fac_fpx_itype_fx1[2:0] == 3'b101)  &
                           (fac_fpx_stype_fx1[1:0] == 2'b00 )  &
                           (fac_fpx_dtype_fx1[2:0] == 3'b001))  )  //     FsMULd
                          &    fad_fsr_tem_fx1[0] &  ns_mode_fx1             );


// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_51 fx2_00  (
  .scan_in(fx2_00_scanin),
  .scan_out(fx2_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({fac_fpx_itype_fx1[2:0],
         fac_fpx_dtype_fx1[2:0],
         fac_fpx_stype_fx1[1:0],
         fac_fpx_sign_instr_fx1,
         idiv0_trap_fx1,
         dec_flush_f1,
         fac_dec_valid_fx1,
         dec_fgu_fmov_vld_m,
         fac_div_valid_fx1,
         fac_divq_valid_fx1,
         fpe_aux_rs2_fmt_fx1_b0,
             eintx_sel_fx1[3:0],
             eadjx_sel_fx1[2:0],
         fac_fpx_nv_vld_fx1,
         fac_fpx_of_vld_fx1,
         fac_fpx_uf_vld_fx1,
         fac_fpx_dz_vld_fx1,
         fac_fpx_nx_vld_fx1,
         fac_fpx_unfin_vld_fx1,
         fac_fcmpe_fx1,
         fp_source_fx1,
         fp_dual_source_fx1,
         rs1_sign_fx1,
         rs2_sign_fx1,
         fadd_logical_sub_fx1,
         logical_sub_fx1,
         fadd_logical_add_fx1,
         fpf_hi_aof_fx1,
         fpf_lo_aof_fx1,
         aux_eint_eminm1_fx1,
         aux_eint_eminm2_fx1,
         aux_enable_unf_fx1,
         rd_mode_fx1[1:0],
         ns_mode_fx1,
         fst_valid_fx1,
         fad_gsr_imirnd_fx1[2:0],
         fac_fgx_pdist_fx1,
         exu_src_fx1}),
  .dout({        itype_fx2[2:0],
                 dtype_fx2[2:0],
                 stype_fx2[1:0],
                 sign_instr_fx2,
         i_idiv0_trap_fx2,
         dec_flush_fx2,
         dec_valid_fx2,
         fmov_vld_fx2,
             div_valid_fx2,
             divq_valid_fx2,
             aux_rs2_fmt_fx2[0],
         fpc_eintx_sel_fx2[3:0],
         fpc_eadjx_sel_fx2[2:0],
             fpx_nv_vld_fx2,
             fpx_of_vld_fx2,
             fpx_uf_vld_fx2,
             fpx_dz_vld_fx2,
             fpx_nx_vld_fx2,
             fpx_unfin_vld_fx2,
             fcmpe_fx2,
         fp_source_fx2,
         fp_dual_source_fx2,
         rs1_sign_fx2,
         rs2_sign_fx2,
         fadd_logical_sub_fx2,
         logical_sub_fx2,
         fadd_logical_add_fx2,
             hi_aof_fx2,
             lo_aof_fx2,
         aux_eint_eminm1_fx2,
         aux_eint_eminm2_fx2,
         aux_enable_unf_fx2,
         rd_mode_fx2[1:0],
         ns_mode_fx2,
         fst_valid_fx2,
         gsr_imirnd_fx2[2:0],
             fgx_pdist_fx2,
         exu_src_fx2}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_14 fx2_01  (
  .scan_in(fx2_01_scanin),
  .scan_out(fx2_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({fac_fpx_mulscc_fx1,
         fad_rs1_fx1[33],
         fpe_rs2_fmt_fx1[10:0],
         fac_fpx_saverestore_fx1}),
  .dout({        mulscc_fx2,
          mulscc_y_src_fx2_b0,
             rs2_exp_fx2[10:0],
                 saverestore_fx2}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_17 fx2_02  (
  .scan_in(fx2_02_scanin),
  .scan_out(fx2_02_scanout),
  .l1clk(l1clk_pm1),
  .din ({fac_w1_vld_fx1[1:0], fac_w1_odd32b_fx1, fpe_aux_eint_fx1[10:0], tid_fx1[2:0]}),
  .dout({  i_w1_vld_fx2[1:0],     w1_odd32b_fx2,     aux_eint_fx2[10:0], tid_fx2[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_4 fx2_03  (
  .scan_in(fx2_03_scanin),
  .scan_out(fx2_03_scanout),
  .l1clk(l1clk_pm1),
  .din ({fad_rs1_fx1[63], fad_rs1_fx1[47], fad_rs1_fx1[31], fad_rs1_fx1[15]}),
  .dout({    rs1_fx2_b63,     rs1_fx2_b47,     rs1_fx2_b31,     rs1_fx2_b15}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_4 fx2_04  (
  .scan_in(fx2_04_scanin),
  .scan_out(fx2_04_scanout),
  .l1clk(l1clk_pm1),
  .din ({fad_rs2_fx1[63], fad_rs2_fx1[47], fad_rs2_fx1[31], fad_rs2_fx1[15]}),
  .dout({    rs2_fx2_b63,     rs2_fx2_b47,     rs2_fx2_b31,     rs2_fx2_b15}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_6 fx2_05  (
  .scan_in(fx2_05_scanin),
  .scan_out(fx2_05_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpf_azf_fx1, fpf_bzf_fx1, fpf_aoe_fx1, fpf_boe_fx1, fpf_aze_fx1, fpf_bze_fx1}),
  .dout({    azf_fx2,     bzf_fx2,     aoe_fx2,     boe_fx2,     aze_fx2,     bze_fx2}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_7 fx2_06  (
  .scan_in(fx2_06_scanin),
  .scan_out(fx2_06_scanout),
  .l1clk(l1clk_pm1),
  .din ({fad_fsr_tem_fx1[4:0],
         fad_rs1_fmt_fx1_b62,
         fad_rs2_fmt_fx1_b62}),
  .dout({    fsr_tem_fx2[4:0],
             rs1_fmt_fx2[62],
             rs2_fmt_fx2[62]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_20 fx2_07  (
  .scan_in(fx2_07_scanin),
  .scan_out(fx2_07_scanout),
  .l1clk(l1clk_pm1),
  .din ({fadd_ovf_predict_fx1,
         fdtos_ovf_predict_fx1,
         fdtos_ovf_detect_fx1,
         fmul_ovf_predict_fx1,
         fmul_ovf_detect_fx1,
         fdiv_ovf_predict_fx1,
         fdiv_ovf_detect_fx1,
         fdtos_unf_predict_fx1,
         fdtos_unf_detect_fx1,
         fmul_unf_predict_fx1,
         fmul_unf_detect_fx1,
         fdiv_unf_predict_fx1,
         fdiv_unf_detect_fx1,
         fdtos_guf_detect_fx1,
         fmul_guf_detect_fx1,
         fdiv_guf_detect_fx1,
         i_predict_fx1,
         fmul_denorm_detect_fx1,
         q_fmul_unf_predict_fx1,
         fadd_fcvt_denorm_detect_fx1}),
  .dout({fadd_ovf_predict_fx2,
         fdtos_ovf_predict_fx2,
         fdtos_ovf_detect_fx2,
         fmul_ovf_predict_fx2,
         fmul_ovf_detect_fx2,
         fdiv_ovf_predict_fx2,
         fdiv_ovf_detect_fx2,
         fdtos_unf_predict_fx2,
         fdtos_unf_detect_fx2,
         fmul_unf_predict_fx2,
         fmul_unf_detect_fx2,
         fdiv_unf_predict_fx2,
         fdiv_unf_detect_fx2,
         fdtos_guf_detect_fx2,
         fmul_guf_detect_fx2,
         fdiv_guf_detect_fx2,
         i_predict_fx2,
         fmul_denorm_detect_fx2,
         q_fmul_unf_predict_fx2,
         fadd_fcvt_denorm_detect_fx2}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_15 fx2_08  (
  .scan_in(fx2_08_scanin),
  .scan_out(fx2_08_scanout),
  .l1clk(l1clk_pm2),
  .din ({in_rngl_cdbus[27:25],  // requires free running clk or rng_data_1f[63] en
         in_rngl_cdbus[7:0],    // requires free running clk or rng_data_1f[63] en
         exu_fgu_flush_m,       // requires free running clk
         exu_fgu_gsr_m[2:0]}),  // requires free running clk
  .dout({in_rngl_cdbus_1f[27:25],
         in_rngl_cdbus_1f[7:0],
         exu_flush_fx2,
         gsr_align_fx2[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  w1_vld_fx2[1:0] =
  i_w1_vld_fx2[1:0] &
  {2{~(fac_fgx_mvcond_fx2 & ~fmov_vld_fx2)}} &
  {2{~dec_flush_fx2}} &
  {2{~exu_flush_fx2}} &        // required for conditional FMOV
  {2{~(fec_uecc_fx2 | fec_cecc_fx2)}};

assign  fsr_w1_vld_fx2[0] =    // fsr write valid, not cleared for mvcond with cond=false
  dec_valid_fx2             &
 ~(itype_fx2 == 3'b100)     &  // ~FCMP(E)
  (fpx_nv_vld_fx2        |
   fpx_of_vld_fx2        |
   fpx_uf_vld_fx2        |
   fpx_dz_vld_fx2        |
   fpx_nx_vld_fx2        |
   fpx_unfin_vld_fx2     |
   fac_fgx_mvcond_fx2    |
   fac_fgx_mvucond_fx2   |
   (itype_fx2 == 3'b011) |     // ensure FiTOd is included
   fac_fgx_abs_fx2       |
   fac_fgx_neg_fx2        ) &
  ~dec_flush_fx2            &
  ~exu_flush_fx2            &  // required for conditional FMOV
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  fsr_w1_vld_fx2[1] =
  fst_valid_fx2     &         // store FSR 32/64b clears ftt in fw stage via w1      
  fac_fsr_store_fx2 &
  ~dec_flush_fx2    &
  ~exu_flush_fx2    &          // required for conditional FMOV
  ~(fec_uecc_fx2 | fec_cecc_fx2);

// 0in custom -fire (((fac_fsr_store_fx2 & fst_valid_fx2) & ($0in_delay(dec_valid_fx2,1)) & (tid_fx2[2:0]==tid_fx3[2:0])) | ((fac_fsr_store_fx2 & fst_valid_fx2) & ($0in_delay(dec_valid_fx2,2)) & (tid_fx2[2:0]==($0in_delay(tid_fx3[2:0],1)))) | ((fac_fsr_store_fx2 & fst_valid_fx2) & ($0in_delay(dec_valid_fx2,3)) & (tid_fx2[2:0]==($0in_delay(tid_fx3[2:0],2)))) | ((fac_fsr_store_fx2 & fst_valid_fx2) & ($0in_delay(dec_valid_fx2,4)) & (tid_fx2[2:0]==($0in_delay(tid_fx3[2:0],3))))) -message "STFSR collision with FPop"

assign gsr_w_vld_fx2[1:0] =  // gsr write valids
  fac_gsr_w_vld_fx2[1:0] &
  {2{~dec_flush_fx2}}    &
//{2{~dec_flush_f2}}     &
//{2{~tlu_flush_fgu_b}}  &
  {2{~exu_flush_fx2}}    ;

assign fgx_siam_fx2 =        // gsr write valids
  fac_fgx_siam_fx2       &
     ~dec_flush_fx2      &
//   ~dec_flush_f2       &
//   ~tlu_flush_fgu_b    &
     ~exu_flush_fx2      ;

// ------------------------------------
// floating point intermediate sign
// Note:
// (1) intermediate sign for sqrt is always 1'b0, unless rs2 is
//     -0 or -denorm
// (2) rs1 - rs2 = +norm - +nan = -nan is incorrect, must pass rs2[63,31]
//     if rs1 or rs2 is a nan
// (3) pass rs2[63,31] if fpfp instr (needed for rs2=0 case)
// ------------------------------------

assign  sign_nan_fx2 =
  (nan_rs2prop_fx2 & rs2_sign_fx2) |
  (nan_rs1prop_fx2 & rs1_sign_fx2) ;

assign  sign_inter_sel_fx2[0] =
  ~(itype_fx2[2:0] == 3'b101) &  // mul
  ~(itype_fx2[2:0] == 3'b110) &  // div
  ~(itype_fx2[2:0] == 3'b111) &  // sqrt
  ~(a_nan_fx2 | b_nan_fx2)    &
   (~fpf_cmp_swap_blta_fx2 |  (itype_fx2[2:0] == 3'b001)    // fpfp
                           |  (itype_fx2[2:0] == 3'b010)    // fpint
                           |  (itype_fx2[2:0] == 3'b011));  // intfp

assign  sign_inter_sel_fx2[1] =
  ~(itype_fx2[2:0] == 3'b101) &  // mul
  ~(itype_fx2[2:0] == 3'b110) &  // div
  ~(itype_fx2[2:0] == 3'b111) &  // sqrt
  ~(a_nan_fx2 | b_nan_fx2)    &
   ( fpf_cmp_swap_blta_fx2 & ~(itype_fx2[2:0] == 3'b001)    // fpfp
                           & ~(itype_fx2[2:0] == 3'b010)    // fpint
                           & ~(itype_fx2[2:0] == 3'b011));  // intfp

assign  sign_inter_sel_fx2[2] =
   ((itype_fx2[2:0] == 3'b101) |     // mul
    (itype_fx2[2:0] == 3'b110)  ) &  // div
  ~(a_nan_fx2 | b_nan_fx2);

assign  sign_inter_sel_fx2[3] =
   (itype_fx2[2:0] == 3'b111) &      // sqrt
  ~(a_nan_fx2 | b_nan_fx2);

assign  sign_inter_sel_fx2[4] =
   (a_nan_fx2 | b_nan_fx2);

assign  sign_inter_fx2 =
  (sign_inter_sel_fx2[0] & (rs2_sign_fx2 ^ sign_instr_fx2)) |
  (sign_inter_sel_fx2[1] & (rs1_sign_fx2                 )) |
  (sign_inter_sel_fx2[2] & (rs1_sign_fx2 ^ rs2_sign_fx2  )) |
  (sign_inter_sel_fx2[3] & (rs2_sign_fx2 & bze_fx2       )) |
  (sign_inter_sel_fx2[4] & (sign_nan_fx2                 )) ;  // 0in bits_on -max 1 -var sign_inter_sel_fx2[4:0] -active dec_valid_fx2

// ------------------------------------
// Final FSQRT intermediate exponent (Eint) calculation, and mux with FDIV Eint
// ------------------------------------

assign  sp_odd_exp_fx2  = itype_fx2[0] & ~dtype_fx2[0] & ~aux_rs2_fmt_fx2[0];  // fsqrts odd  exp
assign  sp_even_exp_fx2 = itype_fx2[0] & ~dtype_fx2[0] &  aux_rs2_fmt_fx2[0];  // fsqrts even exp
assign  dp_odd_exp_fx2  = itype_fx2[0] &  dtype_fx2[0] & ~aux_rs2_fmt_fx2[0];  // fsqrtd odd  exp
assign  dp_even_exp_fx2 = itype_fx2[0] &  dtype_fx2[0] &  aux_rs2_fmt_fx2[0];  // fsqrtd even exp

assign  fpd_eint_fx2[10:0] =
  ({11{dp_even_exp_fx2}} & ({        aux_eint_fx2[10], aux_eint_fx2[10:1]} + 11'b01111111111)) |  // fsqrt +bias
  ({11{dp_odd_exp_fx2 }} & ({        aux_eint_fx2[10], aux_eint_fx2[10:1]} + 11'b10000000000)) |  // fsqrt +bias+1
  ({11{sp_even_exp_fx2}} & ({3'b000, aux_eint_fx2[7], aux_eint_fx2[7:1]} + 11'b00001111111)) |  // fsqrt +bias
  ({11{sp_odd_exp_fx2 }} & ({3'b000, aux_eint_fx2[7], aux_eint_fx2[7:1]} + 11'b00010000000)) |  // fsqrt +bias+1
  ({11{~itype_fx2[0]  }} & (                           aux_eint_fx2[10:0]                   )) ;  // fdiv

// ------------------------------------
// VIS partitioned compares:
// FCMPEQ(16,32), FCMPGT(16,32), FCMPLE(16,32), FCMPNE(16,32)
//
// gt if rs1 >  rs2
// le if rs1 <= rs2
// ne if rs1 != rs2
// eq if rs1  = rs2
//
// Where rs1 and rs2 are signed values.
//
// Note: fpf_b_gteq_a_fx2[3] and fpf_b_eq_a_fx2[3] don't yet
//       account for rs1[63] and rs2[63]
// ------------------------------------

// ------------------------------------
// gt16, gt32
// ------------------------------------

assign  fcmpgt16_fx2[3] =
  (~rs1_fx2_b63 &  rs2_fx2_b63                       ) |
  ( rs1_fx2_b63 &  rs2_fx2_b63 & ~fpf_b_gteq_a_fx2[3]) |
  (~rs1_fx2_b63 & ~rs2_fx2_b63 & ~fpf_b_gteq_a_fx2[3]) ;

assign  fcmpgt16_fx2[2] =
  (~rs1_fx2_b47 &  rs2_fx2_b47                       ) |
  ( rs1_fx2_b47 &  rs2_fx2_b47 & ~fpf_b_gteq_a_fx2[2]) |
  (~rs1_fx2_b47 & ~rs2_fx2_b47 & ~fpf_b_gteq_a_fx2[2]) ;

assign  fcmpgt16_fx2[1] =
  (~rs1_fx2_b31 &  rs2_fx2_b31                       ) |
  ( rs1_fx2_b31 &  rs2_fx2_b31 & ~fpf_b_gteq_a_fx2[1]) |
  (~rs1_fx2_b31 & ~rs2_fx2_b31 & ~fpf_b_gteq_a_fx2[1]) ;

assign  fcmpgt16_fx2[0] =
  (~rs1_fx2_b15 &  rs2_fx2_b15                       ) |
  ( rs1_fx2_b15 &  rs2_fx2_b15 & ~fpf_b_gteq_a_fx2[0]) |
  (~rs1_fx2_b15 & ~rs2_fx2_b15 & ~fpf_b_gteq_a_fx2[0]) ;

assign  gt32_fx2[1] =
  ~fpf_b_gteq_a_fx2[3] | (fpf_b_eq_a_fx2[3] & ~fpf_b_gteq_a_fx2[2]);

assign  gt32_fx2[0] =
  ~fpf_b_gteq_a_fx2[1] | (fpf_b_eq_a_fx2[1] & ~fpf_b_gteq_a_fx2[0]);

assign  fcmpgt32_fx2[1] =
  (~rs1_fx2_b63 &  rs2_fx2_b63                       ) |
  ( rs1_fx2_b63 &  rs2_fx2_b63 &          gt32_fx2[1]) |
  (~rs1_fx2_b63 & ~rs2_fx2_b63 &          gt32_fx2[1]) ;

assign  fcmpgt32_fx2[0] =
  (~rs1_fx2_b31 &  rs2_fx2_b31                       ) |
  ( rs1_fx2_b31 &  rs2_fx2_b31 &          gt32_fx2[0]) |
  (~rs1_fx2_b31 & ~rs2_fx2_b31 &          gt32_fx2[0]) ;

// ------------------------------------
// le16, le32
// ------------------------------------

assign  fcmple16_fx2[3] =
  ( rs1_fx2_b63 & ~rs2_fx2_b63                       ) |
  ( rs1_fx2_b63 &  rs2_fx2_b63 &  fpf_b_gteq_a_fx2[3]) |
  (~rs1_fx2_b63 & ~rs2_fx2_b63 &  fpf_b_gteq_a_fx2[3]) ;

assign  fcmple16_fx2[2] =
  ( rs1_fx2_b47 & ~rs2_fx2_b47                       ) |
  ( rs1_fx2_b47 &  rs2_fx2_b47 &  fpf_b_gteq_a_fx2[2]) |
  (~rs1_fx2_b47 & ~rs2_fx2_b47 &  fpf_b_gteq_a_fx2[2]) ;

assign  fcmple16_fx2[1] =
  ( rs1_fx2_b31 & ~rs2_fx2_b31                       ) |
  ( rs1_fx2_b31 &  rs2_fx2_b31 &  fpf_b_gteq_a_fx2[1]) |
  (~rs1_fx2_b31 & ~rs2_fx2_b31 &  fpf_b_gteq_a_fx2[1]) ;

assign  fcmple16_fx2[0] =
  ( rs1_fx2_b15 & ~rs2_fx2_b15                       ) |
  ( rs1_fx2_b15 &  rs2_fx2_b15 &  fpf_b_gteq_a_fx2[0]) |
  (~rs1_fx2_b15 & ~rs2_fx2_b15 &  fpf_b_gteq_a_fx2[0]) ;

assign  le32_fx2[1] =
   fpf_b_gteq_a_fx2[3] & (~fpf_b_eq_a_fx2[3] |
                          (fpf_b_eq_a_fx2[3] & fpf_b_gteq_a_fx2[2]));

assign  le32_fx2[0] =
   fpf_b_gteq_a_fx2[1] & (~fpf_b_eq_a_fx2[1] |
                          (fpf_b_eq_a_fx2[1] & fpf_b_gteq_a_fx2[0]));

assign  fcmple32_fx2[1] =
  ( rs1_fx2_b63 & ~rs2_fx2_b63                       ) |
  ( rs1_fx2_b63 &  rs2_fx2_b63 &          le32_fx2[1]) |
  (~rs1_fx2_b63 & ~rs2_fx2_b63 &          le32_fx2[1]) ;

assign  fcmple32_fx2[0] =
  ( rs1_fx2_b31 & ~rs2_fx2_b31                       ) |
  ( rs1_fx2_b31 &  rs2_fx2_b31 &          le32_fx2[0]) |
  (~rs1_fx2_b31 & ~rs2_fx2_b31 &          le32_fx2[0]) ;

// ------------------------------------
// eq16, eq32
// ------------------------------------

assign  fcmpeq16_fx2[3] = fpf_b_eq_a_fx2[3] &
                          (rs1_fx2_b63 == rs2_fx2_b63);
assign  fcmpeq16_fx2[2] = fpf_b_eq_a_fx2[2];
assign  fcmpeq16_fx2[1] = fpf_b_eq_a_fx2[1];
assign  fcmpeq16_fx2[0] = fpf_b_eq_a_fx2[0];

assign  fcmpeq32_fx2[1] = fpf_b_eq_a_fx2[3] & fpf_b_eq_a_fx2[2] &
                          (rs1_fx2_b63 == rs2_fx2_b63);
assign  fcmpeq32_fx2[0] = fpf_b_eq_a_fx2[1] & fpf_b_eq_a_fx2[0];

// ------------------------------------
// ne16, ne32
// ------------------------------------

assign  fcmpne16_fx2[3] = ~fcmpeq16_fx2[3];
assign  fcmpne16_fx2[2] = ~fcmpeq16_fx2[2];
assign  fcmpne16_fx2[1] = ~fcmpeq16_fx2[1];
assign  fcmpne16_fx2[0] = ~fcmpeq16_fx2[0];
			  
assign  fcmpne32_fx2[1] = ~fcmpeq32_fx2[1];
assign  fcmpne32_fx2[0] = ~fcmpeq32_fx2[0];

// ------------------------------------
// mux vis compre results
// ------------------------------------

assign  fcmpgt16_sel_fx2 = (fac_opf_fx2[3:1] == 3'b100);
assign  fcmpgt32_sel_fx2 = (fac_opf_fx2[3:1] == 3'b110);
assign  fcmple16_sel_fx2 = (fac_opf_fx2[3:1] == 3'b000);
assign  fcmple32_sel_fx2 = (fac_opf_fx2[3:1] == 3'b010);
assign  fcmpne16_sel_fx2 = (fac_opf_fx2[3:1] == 3'b001);
assign  fcmpne32_sel_fx2 = (fac_opf_fx2[3:1] == 3'b011);
assign  fcmpeq16_sel_fx2 = (fac_opf_fx2[3:1] == 3'b101);
assign  fcmpeq32_sel_fx2 = (fac_opf_fx2[3:1] == 3'b111);

assign  vis_cmp_result_fx2[3:0] =
  ({4{fcmpgt16_sel_fx2}} &        fcmpgt16_fx2[3:0] ) |
  ({4{fcmpgt32_sel_fx2}} & {2'b0, fcmpgt32_fx2[1:0]}) |
  ({4{fcmple16_sel_fx2}} &        fcmple16_fx2[3:0] ) |
  ({4{fcmple32_sel_fx2}} & {2'b0, fcmple32_fx2[1:0]}) |
  ({4{fcmpne16_sel_fx2}} &        fcmpne16_fx2[3:0] ) |
  ({4{fcmpne32_sel_fx2}} & {2'b0, fcmpne32_fx2[1:0]}) |
  ({4{fcmpeq16_sel_fx2}} &        fcmpeq16_fx2[3:0] ) |
  ({4{fcmpeq32_sel_fx2}} & {2'b0, fcmpeq32_fx2[1:0]}) ;

// ------------------------------------
// Detect infinity result, NaN result,
//        zero source, denorm source,
//        unfinished_FPop due to denorm source
// - given from exp:  AZE, BZE, AOE, BOE
// - given from mant: AZF, BZF
// ------------------------------------

assign  a_zero_fx2   = (aze_fx2 &  azf_fx2 & fp_dual_source_fx2                   ) |
                       (aze_fx2            & fp_dual_source_fx2 &  ns_mode_fx2    ) ;
assign  a_denorm_fx2 = (aze_fx2 & ~azf_fx2 & fp_dual_source_fx2 & ~ns_mode_fx2    ) ;
assign  a_inf_fx2    = (aoe_fx2 &  azf_fx2 & fp_dual_source_fx2                   ) ;
assign  a_nan_fx2    = (aoe_fx2 & ~azf_fx2 & fp_dual_source_fx2                   ) ;
assign  a_snan_fx2   = (aoe_fx2 & ~azf_fx2 & fp_dual_source_fx2 & ~rs1_fmt_fx2[62]) ;
			       		  	           
assign  b_zero_fx2   = (bze_fx2 &  bzf_fx2 & fp_source_fx2                        ) |
                       (bze_fx2            & fp_source_fx2      &  ns_mode_fx2    ) ;
assign  b_denorm_fx2 = (bze_fx2 & ~bzf_fx2 & fp_source_fx2      & ~ns_mode_fx2    ) ;
assign  b_inf_fx2    = (boe_fx2 &  bzf_fx2 & fp_source_fx2                        ) ;
assign  b_nan_fx2    = (boe_fx2 & ~bzf_fx2 & fp_source_fx2                        ) ;
assign  b_snan_fx2   = (boe_fx2 & ~bzf_fx2 & fp_source_fx2      & ~rs2_fmt_fx2[62]) ;
assign  b_qnan_fx2   = (boe_fx2            & fp_source_fx2      &  rs2_fmt_fx2[62]) ;

// ------------------------------------
// Detect "unfinished source"
// - unfin_src will set unfinished_FPop if ~ns_mode and ~guf
// - unfin_src will set inexact flag if ~unfinished_FPop, independent of ns_mode
// ------------------------------------

assign  unfin_src_fx2 =

  ( (itype_fx2[2:0] == 3'b000) &           // FSUB(s,d),FADD(s,d)
    (dtype_fx2[2:1] == 2'b00 ) &
    ( (a_denorm_fx2 | b_denorm_fx2) &
     ~(a_inf_fx2  | b_inf_fx2 |            // not unifn if denrom +/- nan or inf
       a_nan_fx2  | b_nan_fx2  )     )) |

  ( (itype_fx2[2:0] == 3'b000) &           // FSUB(s,d),FADD(s,d)
    (dtype_fx2[2:1] == 2'b00 ) &
     ~(a_inf_fx2  | b_inf_fx2 |            // not inexact if rs1/rs2 is nan or inf
       a_nan_fx2  | b_nan_fx2  ) &
    ((aze_fx2 & ~azf_fx2 & ns_mode_fx2) |
     (bze_fx2 & ~bzf_fx2 & ns_mode_fx2)  )) |  // denorm rs1/rs2 in ns_mode may set inexact

  ( ((itype_fx2[2:0] == 3'b010) |          // fpint
     (itype_fx2[2:0] == 3'b001)  ) &       // fpfp
    ~fdtos_guf_detect_fx2          &
    b_denorm_fx2                      ) |

  ( ((itype_fx2[2:0] == 3'b010) |           // fpint
     (itype_fx2[2:0] == 3'b001)  ) &        // fpfp
    ( bze_fx2 & ~bzf_fx2 & ns_mode_fx2)   ) |  // denorm rs2 in ns_mode sets inexact

  ( (itype_fx2[2:0] == 3'b101) &           // f(s)mul
    (dtype_fx2[2:1] == 2'b00 ) &
    ~fmul_guf_detect_fx2       &
    ( (a_denorm_fx2 | b_denorm_fx2) &
     ~(a_inf_fx2  | b_inf_fx2 |            // not unifn if denrom * nan or inf or zero
       a_nan_fx2  | b_nan_fx2 |
       a_zero_fx2 | b_zero_fx2 )     )) |

  ( (itype_fx2[2:0] == 3'b101) &           // f(s)mul
    (dtype_fx2[2:1] == 2'b00 ) &
     ~(a_inf_fx2  | b_inf_fx2 |            // not inexact if rs1/rs2 is zero, nan, or inf
       a_nan_fx2  | b_nan_fx2 |
       (aze_fx2 & azf_fx2) |
       (bze_fx2 & bzf_fx2)     ) &
    ((aze_fx2 & ~azf_fx2 & ns_mode_fx2) |
     (bze_fx2 & ~bzf_fx2 & ns_mode_fx2)  )) |  // denorm rs1/rs2 in ns_mode may set inexact

  ( (itype_fx2[2:0] == 3'b110) &           // fdiv
    (dtype_fx2[2:1] == 2'b00 ) &
    ~fdiv_guf_detect_fx2       &
    ~(fdiv_ovf_detect_fx2 |
      fdiv_ovf_predict_fx2   ) &           // not fdiv overflow
    ( (a_denorm_fx2 | b_denorm_fx2) &
     ~(a_inf_fx2  | b_inf_fx2 |            // not unifn if nan, inf or zero src
       a_nan_fx2  | b_nan_fx2 |
       a_zero_fx2 | b_zero_fx2 )     )) |

  ( (itype_fx2[2:0] == 3'b110) &           // fdiv
    (dtype_fx2[2:1] == 2'b00 ) &
    ~(b_zero_fx2 | b_nan_fx2 | b_inf_fx2)  &  // not inexact if rs2 is zero, denorm, nan, or inf
    (aze_fx2 & ~azf_fx2 & ns_mode_fx2)) |  // denorm rs1 in ns_mode may set inexact

  ( (itype_fx2[2:0] == 3'b111)     &       // fsqrt
    ((b_denorm_fx2 & ~rs2_sign_fx2) |      // +denorm may signal unfin
     (bze_fx2 & ~bzf_fx2 & ns_mode_fx2))); // +/-denorm in ns_mode must set inexact

// 0in bits_on -max 1 -var {(unfin_src_fx2 | zero_src_result_fx2), inf_src_result_fx2, inf_maxint_result_fx2, nan_maxint_result_fx2, nan_default_result_fx2, fmul_den2nor_m2_predict_fx2, fdiv_den2nor_m1_predict_fx2} -active dec_valid_fx2

assign  inf_src_result_fx2 =

  ( ((itype_fx2[2:0] == 3'b000) |                    // add/sub
     (itype_fx2[2:0] == 3'b001)              ) &     // fpfp
    (a_inf_fx2  | b_inf_fx2                  ) &
   ~(a_inf_fx2  & b_inf_fx2 & logical_sub_fx2) &     // inf   - inf = nan (default)
   ~(a_nan_fx2  | b_nan_fx2                  )  ) |  // inf +/- nan = nan

  ( (itype_fx2[2:0] == 3'b101)                 &     // mul
    (a_inf_fx2  | b_inf_fx2                  ) &
   ~(a_zero_fx2 | b_zero_fx2                 ) &     // inf   * 0   = nan (default)
   ~(a_nan_fx2  | b_nan_fx2                  )  ) |  // inf   * nan = nan

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    (a_inf_fx2                               ) &     // inf   / b   = inf
   ~(             b_inf_fx2                  ) &     // inf   / inf = nan (default)
   ~(             b_nan_fx2                  )  ) |  // inf   / nan = nan

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    (             b_zero_fx2                 ) &     // a     / 0   = inf
   ~(a_zero_fx2                              ) &     // 0     / 0   = nan (default)
   ~(a_nan_fx2                               )  ) |  // nan   / 0   = nan

  ( (itype_fx2[2:0] == 3'b111)                 &     // sqrt
    (             b_inf_fx2                  ) &
   ~(                         rs2_sign_fx2   )  ) ;  // sqrt   -inf = nan (default)

assign  zero_src_result_fx2 =

  ( (itype_fx2[2:0] == 3'b011)                 &     // FxTO(s,d)
    (stype_fx2[1:0] == 2'b11 )                 &
    (bze_fx2 & bzf_fx2 & ~rs2_fx2_b63        )  ) |  //

  ( (itype_fx2[2:0] == 3'b011)                 &     // FiTO(s,d)
    (stype_fx2[1:0] == 2'b10 )                 &
    (fic_bzf32lsb_fx2                        )  ) |  //

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    (             b_inf_fx2                  ) &     // a     / inf = 0
   ~(a_inf_fx2                               ) &     // inf   / inf = nan (default)
   ~(a_nan_fx2                               )  ) |  // nan   / inf = nan

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    (a_zero_fx2                              ) &     // 0     / b   = 0
   ~(             b_zero_fx2                 ) &     // 0     / 0   = nan (default)
   ~(             b_nan_fx2                  )  ) |  // 0     / nan = nan

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    (a_denorm_fx2 | b_denorm_fx2             ) &     //
   ~(a_nan_fx2  | b_nan_fx2                  ) &     // den   / nan = nan
   ~(a_inf_fx2                               ) &     // inf   / den = inf
   ~(             b_zero_fx2                 ) &     // den   / 0   = inf
   ~(fdiv_ovf_detect_fx2 |
     fdiv_ovf_predict_fx2                    )  ) |  // not fdiv overflow

  ( (itype_fx2[2:0] == 3'b101)                 &     // mul
    (a_zero_fx2 | b_zero_fx2                 ) &     //
   ~(a_nan_fx2  | b_nan_fx2                  ) &     // 0     * nan = nan
   ~(a_inf_fx2  | b_inf_fx2                  )  ) |  // 0     * inf = nan (default)

  ( (itype_fx2[2:0] == 3'b101)                 &     // mul
    (a_denorm_fx2 | b_denorm_fx2             ) &     //
   ~(a_nan_fx2  | b_nan_fx2                  ) &     // den   * nan = nan
   ~(a_inf_fx2  | b_inf_fx2                  )  ) |  // den   * inf = inf

  ( (itype_fx2[2:0] == 3'b111)                 &     // sqrt
    (             b_zero_fx2                 )  ) |

  ( (itype_fx2[2:0] == 3'b111)                 &     // sqrt
    (             b_denorm_fx2 & ~rs2_sign_fx2) ) ;

assign  inf_maxint_result_fx2 =
  (itype_fx2[2:0] == 3'b011) &  // fpint
  (b_inf_fx2               ) ;  // rs2  =  inf

assign  nan_maxint_result_fx2 =
  (itype_fx2[2:0] == 3'b011) &  // fpint
  (b_nan_fx2               ) ;  // rs2  =  nan

assign  nan_default_result_fx2 =

  ( (itype_fx2[2:0] == 3'b000)                 &     // add/sub
    (a_inf_fx2  & b_inf_fx2 & logical_sub_fx2)  ) |  // inf   - inf = nan (default)

  ( (itype_fx2[2:0] == 3'b101)                 &     // mul
    (a_inf_fx2  | b_inf_fx2                  ) &
    (a_zero_fx2 | b_zero_fx2                 )  ) |  // inf   * 0   = nan (default)

  ( (itype_fx2[2:0] == 3'b110)                 &     // div
    ((a_inf_fx2  & b_inf_fx2 ) |                     // inf   / inf = nan (default)
     (a_zero_fx2 & b_zero_fx2)  )               ) |  // 0     / 0   = nan (default)

  ( (itype_fx2[2:0] == 3'b111)                 &     // sqrt
    (~b_nan_fx2 & ~b_zero_fx2 & rs2_sign_fx2 )  ) ;  // sqrt   -src = nan (default)

assign  nan_rs1prop_fx2 =
   (a_nan_fx2  & ~b_nan_fx2 ) |  // rs1 =  nan, rs2 != nan
   (a_snan_fx2 & ~b_snan_fx2) ;  // rs1 = snan, rs2 != snan

assign  nan_rs2prop_fx2 =
   (b_snan_fx2              ) |  // rs2 = snan
   (b_qnan_fx2 & ~a_snan_fx2) ;  // rs2 = qnan, rs1 != snan

// ------------------------------------
// floating point exception fields {cexc}
// ------------------------------------

assign  fpx_dzc_fx2 =
   fpx_dz_vld_fx2 &
   b_zero_fx2     &
  ~a_zero_fx2     &
  ~a_nan_fx2      &
  ~a_inf_fx2      ;

assign  i_fxp_nvc_fx2 =
  fcmp_nvc_fx2 |
  (fpx_nv_vld_fx2 &
   (a_snan_fx2 |
    b_snan_fx2 |
    nan_default_result_fx2));

// ------------------------------------
// Exception trap prediction
// ------------------------------------

assign  local_predict_fx2 =
  dec_valid_fx2 &
  (i_predict_fx2 | fmul_denorm_detect_fx2 | q_fmul_unf_predict_fx2 | fadd_fcvt_denorm_detect_fx2) &
  ~dec_flush_fx2 ;

assign  fgu_predict_fx2 = local_predict_fx2;

// Note: needs 0-In fix again? V2.1c fails vector FAIL_0in.tvo.
// zeroin assert_leader -leader local_predict_fx2 -follower ((fgu_fpx_ieee_trap_fw | fgu_fpx_unfin_fw) & $0in_delay((~(itype_fx5[2:1]==2'b11)),2)) -min 4 -max 4 -message "FP exception trap (non-FPD) w/out prediction"

// 0in assert -var $0in_delay(local_predict_fx2,5) -active ($0in_delay((~(itype_fx5[2:1]==2'b11)),2) & (fgu_fpx_ieee_trap_fw | fgu_fpx_unfin_fw)) -message "FP exception trap (non-FPD) w/out prediction"

// 0in assert -var $0in_delay((~local_predict_fx2),5) -active ($0in_delay((itype_fx5[2:1]==2'b11),2) & (fgu_fpx_ieee_trap_fw | fgu_fpx_unfin_fw | fgu_fpd_ieee_trap_fw | fgu_fpd_unfin_fw | fgu_fpd_idiv0_trap_fw)) -message "IDIV/FDIV/FSQRT exception trap w/ prediction"

// ------------------------------------
// Determine if the mantissa must quiet the
// propagating NaN (set frac MSB=1)
// ------------------------------------

assign  qthenan_fx2 = a_nan_fx2 | b_nan_fx2;

// ------------------------------------
// Round mode calculation
// - must force round mode to truncate if nan, otherwise
//   a propagating nan may attempt to round
// ------------------------------------

assign  rm_near_dp_fx2 =
   (dtype_fx2[2:0] == 3'b001   ) &  // dp
  ~(a_nan_fx2    | b_nan_fx2   ) &  // ~nan
  ~(a_zero_fx2   | b_zero_fx2  ) &  // ~zero
  ~(a_denorm_fx2 | b_denorm_fx2) &  // ~denorm
   (rd_mode_fx2[1:0] == 2'b00  ) ;  // nearest

assign  rm_directed_dp_fx2 =
   (dtype_fx2[2:0] == 3'b001   ) &  // dp
  ~(a_nan_fx2    | b_nan_fx2   ) &  // ~nan
  ~(a_zero_fx2   | b_zero_fx2  ) &  // ~zero
  ~(a_denorm_fx2 | b_denorm_fx2) &  // ~denorm
   (((rd_mode_fx2[1:0] == 2'b10) & ~sign_inter_fx2) |    // +inf
    ((rd_mode_fx2[1:0] == 2'b11) &  sign_inter_fx2)  );  // -inf

assign  rm_near_sp_fx2 =
   (dtype_fx2[2:0] == 3'b000   ) &  // sp
  ~(a_nan_fx2    | b_nan_fx2   ) &  // ~nan
  ~(a_zero_fx2   | b_zero_fx2  ) &  // ~zero
  ~(a_denorm_fx2 | b_denorm_fx2) &  // ~denorm
   (rd_mode_fx2[1:0] == 2'b00  ) ;  // nearest

assign  rm_directed_sp_fx2 =
   (dtype_fx2[2:0] == 3'b000   ) &  // sp
  ~(a_nan_fx2    | b_nan_fx2   ) &  // ~nan
  ~(a_zero_fx2   | b_zero_fx2  ) &  // ~zero
  ~(a_denorm_fx2 | b_denorm_fx2) &  // ~denorm
   (((rd_mode_fx2[1:0] == 2'b10) & ~sign_inter_fx2) |    // +inf
    ((rd_mode_fx2[1:0] == 2'b11) &  sign_inter_fx2)  );  // -inf

// ------------------------------------
// Detect if denorm fmul/fdiv intermediate
// result may round to norm
// ------------------------------------

assign  fdiv_aof_bzf_fx2 =
  ((dtype_fx2[2:0] == 3'b000) &
   (hi_aof_fx2 & bzf_fx2    )         ) |  // sp
  ((dtype_fx2[2:0] == 3'b001) &
   (hi_aof_fx2 & lo_aof_fx2 & bzf_fx2)) ;  // dp

assign  fmul_den2nor_m2_predict_fx2 =
   (aux_eint_eminm2_fx2     ) &  // FMUL Eint=Emin-2
  ~(aoe_fx2                 ) &  // Ea != (nan | inf)
  ~(boe_fx2                 ) &  // Eb != (nan | inf)
  ~(aze_fx2                 ) &  // Ea != (zero| den)
  ~(bze_fx2                 ) &  // Eb != (zero| den)
   (itype_fx2[2:0] == 3'b101) &  // fmul
   (dtype_fx2[2:1] == 2'b00 ) ;

assign  fdiv_den2nor_m1_predict_fx2 =
   (aux_eint_eminm1_fx2     ) &  // FDIV Eint=Emin-1
   (fdiv_aof_bzf_fx2        ) &  // FDIV ones frac / zero frac
   (aux_enable_unf_fx2      ) &  // ensure underflow, not overflow
  ~(aoe_fx2                 ) &  // Ea != (nan | inf)
  ~(boe_fx2                 ) &  // Eb != (nan | inf)
  ~(aze_fx2                 ) &  // Ea != (zero| den)
  ~(bze_fx2                 ) &  // Eb != (zero| den)
   (itype_fx2[2:0] == 3'b110) ;  // div

assign  fdiv_den2nor_sp_fx2 =
  (fdiv_den2nor_m1_predict_fx2 & rm_near_sp_fx2    ) |
  (fdiv_den2nor_m1_predict_fx2 & rm_directed_sp_fx2) ;

assign  fdiv_den2nor_dp_fx2 =
  (fdiv_den2nor_m1_predict_fx2 & rm_near_dp_fx2    ) |
  (fdiv_den2nor_m1_predict_fx2 & rm_directed_dp_fx2) ;

// ------------------------------------
// Force zero into Mle/Mse for zero/denorm source, or nan propagation
// set m{l,s}e_{zeros,ones}
// Note: (1) a non-fp source will always have a non-zero (1'b1) exponent
//       (2) a propagating NaN will enter the aligner (as Mse) only if
//           Ea=Eb=b'111...111', in which case SC=0.
//       (3) if rs1=rs2=NaN, the only case in which rs1 is chosen for the
//           propagating NaN (and not rs2) is if rs1=SNaN and rs2=QNaN.
//           See SPARC V9 manual section B.2.
// ------------------------------------

assign  mse_zeros_fx2 =
  (bze_fx2         & fp_source_fx2      & ~logical_sub_fx2 &  fpf_cmp_swap_blta_fx2) |
  (aze_fx2         & fp_dual_source_fx2 & ~logical_sub_fx2 & ~fpf_cmp_swap_blta_fx2) |
  (nan_rs2prop_fx2 &                      ~logical_sub_fx2 & ~fpf_cmp_swap_blta_fx2) |
  (nan_rs1prop_fx2 &                      ~logical_sub_fx2 &  fpf_cmp_swap_blta_fx2) ;

assign  mse_ones_fx2  =	       
  (bze_fx2         & fp_source_fx2      &  logical_sub_fx2 &  fpf_cmp_swap_blta_fx2) |
  (aze_fx2         & fp_dual_source_fx2 &  logical_sub_fx2 & ~fpf_cmp_swap_blta_fx2) |
  (nan_rs2prop_fx2 &                       logical_sub_fx2 & ~fpf_cmp_swap_blta_fx2) |
  (nan_rs1prop_fx2 &                       logical_sub_fx2 &  fpf_cmp_swap_blta_fx2) ;
				       
assign  mle_zeros_fx2 =
  (bze_fx2         & fp_source_fx2      &                    ~fpf_cmp_swap_blta_fx2) |
  (aze_fx2         & fp_dual_source_fx2 &                     fpf_cmp_swap_blta_fx2) |
  (nan_rs2prop_fx2 &                                          fpf_cmp_swap_blta_fx2) |
  (nan_rs1prop_fx2 &                                         ~fpf_cmp_swap_blta_fx2) ;

// ------------------------------------
// Mle/Mse format mux selects
// - logical subtract (fp,vis)
// - massive alignment shift
//   (entire mantissa shifted past G bit, actually we use past R bit due to 0.1X case)
// - NaN,zero handling
// - MULScc and Y[0]=0
// - SP/DP pad LSBs to prop. main adder cin
//
// Massive alignment shift detection is also used by align sticky calculation
// to force align sticky to one. However, if exp is zero then align sticky will
// not be one. If either exp is zero we know a zero mantissa proceeds thru aligner,
// and align sticky will not be one.
//
// Detect when the alignment sticky bit will be zero due to zero/denorm or nan
// source (even though a massive alignment shift may occur). Inf source is
// a don't care.
// ------------------------------------

assign  mass_align_fx2 =
  (~(itype_fx2[2:0] == 3'b011) &                                        // ~intfp
    (dtype_fx2[2:0] == 3'b000) & (fpe_align_sel_fx2[10:0] > 11'd25)) |  // sp
  (~(itype_fx2[2:0] == 3'b011) &                                        // ~intfp
    (dtype_fx2[2:0] == 3'b001) & (fpe_align_sel_fx2[10:0] > 11'd54)) ;  // dp

assign  mass_align_sticky_fx2 =
  mass_align_fx2               &
  ~(itype_fx2[2:0] == 3'b001)  &  // ~fpfp
  ~(aze_fx2 | bze_fx2 |
    aoe_fx2 | boe_fx2  );

assign  fpc_fadd_eac_enable_fx2 =
  fadd_logical_add_fx2  |  // required for proper sticky bit calculation
  (fadd_logical_sub_fx2 &
   ~(mass_align_fx2 & mass_align_sticky_fx2));  // 0in custom -fire (fadd_logical_sub_fx4 & ~fpf_ma_cout_fx4 & ~(a_nan_fx4 | b_nan_fx4) & ~fac_fgx_instr_fx4 & (|w1_vld_fx4[1:0]))

assign  fpc_mse_sel_fx2[0] =             // force Mse to zero
  mse_zeros_fx2 |                        // zero/denorm source or nan propagation
  (mulscc_fx2 & ~mulscc_y_src_fx2_b0) |  // MULScc and Y[0]=0
  (~logical_sub_fx2 & mass_align_fx2) ;  // add massive align shift

assign  fpc_mse_sel_fx2[1] =             // force Mse to one
  mse_ones_fx2 |                         // zero/denorm source or nan propagation
  ( logical_sub_fx2 & mass_align_fx2) ;  // sub massive align shift

assign  fpc_mse_sel_fx2[2] =             // pass inv aligner data thru
  logical_sub_fx2 &                      // logical subtract
  ~(itype_fx2[2:0] == 3'b011) &          // ~intfp
  ~(a_nan_fx2 | b_nan_fx2);              // ~NaN

assign  fpc_mle_sel_fx2 =                // force Mle to zero
  mle_zeros_fx2;                         // zero/denorm source or nan propagation

// ------------------------------------
// Main adder control
//
// For FADD/FSUB:
// EAC = logical_subtract & cout & ~align_sticky
// because a full exp and frac compare is performed, cout=1 if logical_subtract
// ------------------------------------

assign  fpc_fp_cin00_fx2 =
  (fadd_logical_sub_fx2 & (a_nan_fx2 | b_nan_fx2)) |                       //  FADD/FSUB logical_sub with nan propagation
  (fadd_logical_sub_fx2 & (aze_fx2   | bze_fx2  )) |                       //  FADD/FSUB logical_sub with zero source
  (logical_sub_fx2 &
   ~((itype_fx2[2:0] == 3'b000) & (dtype_fx2[2:1] == 2'b00 )));            // ~FADD/FSUB

assign  fpc_cin00_fx2    =
   logical_sub_fx2 &
   ~((itype_fx2[2:0] == 3'b010) & (dtype_fx2[2:0] == 3'b011));             // ~F(s,d)TOi

assign  fpc_cin16_48_fx2 =  logical_sub_fx2 & (dtype_fx2[2:0] == 3'b010);  // 16b sub
assign  fpc_cin32_fx2    =  logical_sub_fx2 & (dtype_fx2[2:1] == 2'b01 );  // 16/32b dest, incl. F(s,d)TOi

assign  fpc_prop16_48_fx2 = ~(dtype_fx2[2:0] == 3'b010);                   // ~16b    operation
assign  fpc_prop32_fx2 =    ~(dtype_fx2[2:1] == 2'b01 );                   // ~16/32b operation

// ------------------------------------
// FCMP(E) invalid detection
// ------------------------------------

assign  fcmp_nvc_fx2 =
  ((a_snan_fx2 | b_snan_fx2)  &
   (itype_fx2[2:0] == 3'b100) & (dtype_fx2[2:1] == 2'b00 ) & ~fcmpe_fx2) |  // FCMP(s,d)
  ((a_nan_fx2  | b_nan_fx2 )  &
   (itype_fx2[2:0] == 3'b100) & (dtype_fx2[2:1] == 2'b00 ) &  fcmpe_fx2) ;  // FCMPE(s,d)

assign  int_res_sel_fx2[1] = saverestore_fx2  & dec_valid_fx2;  // pwr mgmt: aomux free zeros
assign  int_res_sel_fx2[2] = mulscc_fx2       & dec_valid_fx2;  // pwr mgmt: aomux free zeros
assign  int_res_sel_fx2[3] = fac_fgx_popc_fx2 & dec_valid_fx2;  // pwr mgmt: aomux free zeros

                                   // pwr mgmt: aomux free zeros
assign  int_res_sel_fx2[4] =       // vis cmp
  (itype_fx2[2:0] == 3'b100) &     // cmp
  (dtype_fx2[2:1] == 2'b01 ) &     // 16bit or 32bit
  dec_valid_fx2              ;

                                   // pwr mgmt: aomux free zeros
assign  int_res_sel_fx2[5] =       // imul
  (itype_fx2[2:0] == 3'b101) &     // mul
  dec_valid_fx2              &
  exu_src_fx2                ;

assign  i_pre_div_flush_fx2 =
  dec_flush_fx2  |
  (fec_uecc_fx2 | fec_cecc_fx2) |
  exu_flush_fx2  ;

assign  idiv0_trap_fx2 =
  i_idiv0_trap_fx2 &
  ~dec_flush_fx2   &
  ~exu_flush_fx2   ;

assign  fpc_pre_div_flush_fx2 =
  idiv0_trap_fx2                |
  ((itype_fx2[2:1] == 2'b11) &
   dec_valid_fx2             &
   i_pre_div_flush_fx2        ) |
  ((itype_fx2[2:1] == 2'b11) &     // fdiv/fsqrt qualified unfin_src
   dec_valid_fx2             &
   fpx_unfin_vld_fx2         &
   unfin_src_fx2             &
   ~ns_mode_fx2               ) |
  ((itype_fx2[2:1] == 2'b11) &     // fdiv/fsqrt qualified unfin_early
   dec_valid_fx2             &
   fpx_unfin_vld_fx2         &
   fdiv_unf_detect_fx2       &
   ~fdiv_guf_detect_fx2      &
   ~fdiv_den2nor_sp_fx2      &
   ~fdiv_den2nor_dp_fx2      &
   ~ns_mode_fx2               ) ;

assign  fpc_div_default_res_fx2 =
  (itype_fx2[2:1] == 2'b11) &
  dec_valid_fx2        &
  ~i_pre_div_flush_fx2 &
  ((fp_source_fx2 &
    (inf_src_result_fx2     |
     nan_default_result_fx2 | zero_src_result_fx2 |
     nan_rs1prop_fx2        | nan_rs2prop_fx2     |
     fdiv_ovf_detect_fx2    | fdiv_unf_detect_fx2 |
                              fdiv_guf_detect_fx2  )) | idiv0_trap_fx2);

assign  aboe_fx2 = (aoe_fx2 & fp_dual_source_fx2) | boe_fx2;
assign  abze_fx2 = (aze_fx2 & fp_dual_source_fx2) | bze_fx2;

// ------------------------------------
// GSR.mask flop selects/enables
// ------------------------------------

assign  gsr0_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd0) & gsr_w_vld_fx2[0] ) ;

assign  gsr1_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd1) & gsr_w_vld_fx2[0] ) ;

assign  gsr2_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd2) & gsr_w_vld_fx2[0] ) ;

assign  gsr3_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd3) & gsr_w_vld_fx2[0] ) ;

assign  gsr4_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd4) & gsr_w_vld_fx2[0] ) ;

assign  gsr5_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd5) & gsr_w_vld_fx2[0] ) ;

assign  gsr6_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd6) & gsr_w_vld_fx2[0] ) ;

assign  gsr7_mask_sel_fx2[0] =
  ((            tid_fx2[2:0] == 3'd7) & gsr_w_vld_fx2[0] ) ;

assign  gsr0_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd0) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd0) & gsr_w_vld_fx2[0] ) ;

assign  gsr1_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd1) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd1) & gsr_w_vld_fx2[0] ) ;

assign  gsr2_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd2) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd2) & gsr_w_vld_fx2[0] ) ;

assign  gsr3_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd3) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd3) & gsr_w_vld_fx2[0] ) ;

assign  gsr4_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd4) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd4) & gsr_w_vld_fx2[0] ) ;

assign  gsr5_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd5) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd5) & gsr_w_vld_fx2[0] ) ;

assign  gsr6_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd6) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd6) & gsr_w_vld_fx2[0] ) ;

assign  gsr7_mask_sel_fx2[1] =
  ((fac_gsr_asr_tid_fx2[2:0] == 3'd7) & fac_rng_wr_gsr_3f) |
  ((            tid_fx2[2:0] == 3'd7) & gsr_w_vld_fx2[0] ) ;

assign  sp_source_fx2 = (stype_fx2[1:0] == 2'b00);

assign  ecc_trap_fx2 = (fec_uecc_fx2 | fec_cecc_fx2);


// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_13 fx3_00  (
  .scan_in(fx3_00_scanin),
  .scan_out(fx3_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({  w1_vld_fx2[1:0], itype_fx2[2:0], dtype_fx2[2:0], stype_fx2[1:0], tid_fx2[2:0]}),
  .dout({i_w1_vld_fx3[1:0], itype_fx3[2:0], dtype_fx3[2:0], stype_fx3[1:0], tid_fx3[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_20 fx3_01  (
  .scan_in(fx3_01_scanin),
  .scan_out(fx3_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({vis_cmp_result_fx2[3:0], int_res_sel_fx2[5:1], fpd_eint_fx2[10:0]}),
  .dout({vis_cmp_result_fx3[3:0], int_res_sel_fx3[5:1], fpd_eint_fx3[10:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_13 fx3_02  (
  .scan_in(fx3_02_scanin),
  .scan_out(fx3_02_scanout),
  .l1clk(l1clk_pm1),
  .din ({rs1_fx2_b31, rs2_fx2_b31, rs2_exp_fx2[10:0]}),
  .dout({rs1_fx3_b31, rs2_fx3_b31, rs2_exp_fx3[10:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_4 fx3_03  (
  .scan_in(fx3_03_scanin),
  .scan_out(fx3_03_scanout),
  .l1clk(l1clk_pm1),
  .din ({bzf_fx2,
         bze_fx2,
         a_nan_fx2,
         b_nan_fx2}),
  .dout({bzf_fx3,
         bze_fx3,
         a_nan_fx3,
         b_nan_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_5 fx3_04  (
  .scan_in(fx3_04_scanin),
  .scan_out(fx3_04_scanout),
  .l1clk(l1clk_pm1),
  .din (fsr_tem_fx2[4:0]),
  .dout(fsr_tem_fx3[4:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_10 fx3_05  (
  .scan_in(fx3_05_scanin),
  .scan_out(fx3_05_scanout),
  .l1clk(l1clk_pm1),
  .din ({inf_src_result_fx2,
         zero_src_result_fx2,
         inf_maxint_result_fx2,
         nan_maxint_result_fx2,
         nan_default_result_fx2,
         qthenan_fx2,
         fic_bzf31msb_fx2,
         fmul_den2nor_m2_predict_fx2,
         fdiv_den2nor_sp_fx2,
         fdiv_den2nor_dp_fx2}),
  .dout({inf_src_result_fx3,
         zero_src_result_fx3,
         inf_maxint_result_fx3,
         nan_maxint_result_fx3,
         nan_default_result_fx3,
         qthenan_fx3,
             bzf31msb_fx3,
         fmul_den2nor_m2_predict_fx3,
         fdiv_den2nor_sp_fx3,
         fdiv_den2nor_dp_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_28 fx3_06  (
  .scan_in(fx3_06_scanin),
  .scan_out(fx3_06_scanout),
  .l1clk(l1clk_pm1),
  .din ({idiv0_trap_fx2,
         dec_flush_f2,
         sign_inter_fx2,
         div_valid_fx2,
         divq_valid_fx2,
         logical_sub_fx2,
         fsr_w1_vld_fx2[1:0],
         w1_odd32b_fx2,
         mass_align_sticky_fx2,
         fadd_logical_sub_fx2,
         fac_fsr_store_fx2,
         fgx_siam_fx2,
         gsr_w_vld_fx2[1],
         fac_gsr_asr_tid_fx2[2:0],
             rd_mode_fx2[1:0],
         rm_near_sp_fx2,
         rm_near_dp_fx2,
         rm_directed_sp_fx2,
         rm_directed_dp_fx2,
         aboe_fx2,
         abze_fx2,
             sp_source_fx2,
         fpc_div_default_res_fx2,
         fgx_pdist_fx2}),
  .dout({i_idiv0_trap_fx3,
         dec_flush_fx3,
         sign_inter_fx3,
         div_valid_fx3,
         divq_valid_fx3,
         logical_sub_fx3,
         i_fsr_w1_vld_fx3[1:0],
         w1_odd32b_fx3,
         mass_align_sticky_fx3,
         fadd_logical_sub_fx3,
         fsr_store_fx3,
         i_fgx_siam_fx3,
         i_gsr_w_vld_fx3[1],
             gsr_asr_tid_fx3[2:0],
         fpc_rd_mode_fx3[1:0],
         rm_near_sp_fx3,
         rm_near_dp_fx3,
         rm_directed_sp_fx3,
         rm_directed_dp_fx3,
         aboe_fx3,
         abze_fx3,
         fpc_sp_source_fx3,
             div_default_res_fx3,
         fgx_pdist_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_18 fx3_07  (
  .scan_in(fx3_07_scanin),
  .scan_out(fx3_07_scanout),
  .l1clk(l1clk_pm1),
  .din ({fadd_ovf_predict_fx2,
         fdtos_ovf_predict_fx2,
         fdtos_ovf_detect_fx2,
         fmul_ovf_predict_fx2,
         fmul_ovf_detect_fx2,
         fdiv_ovf_predict_fx2,
         fdiv_ovf_detect_fx2,
         fdtos_unf_predict_fx2,
         fdtos_unf_detect_fx2,
         fmul_unf_predict_fx2,
         fmul_unf_detect_fx2,
         fdiv_unf_predict_fx2,
         fdiv_unf_detect_fx2,
         fic_bof22msb_fx2,
         fdtos_guf_detect_fx2,
         fmul_guf_detect_fx2,
         fdiv_guf_detect_fx2,
         unfin_src_fx2}),
  .dout({fadd_ovf_predict_fx3,
         fdtos_ovf_predict_fx3,
         fdtos_ovf_detect_fx3,
         fmul_ovf_predict_fx3,
         fmul_ovf_detect_fx3,
         fdiv_ovf_predict_fx3,
         fdiv_ovf_detect_fx3,
         fdtos_unf_predict_fx3,
         fdtos_unf_detect_fx3,
         fmul_unf_predict_fx3,
         fmul_unf_detect_fx3,
         fdiv_unf_predict_fx3,
         fdiv_unf_detect_fx3,
             bof22msb_fx3,
         fdtos_guf_detect_fx3,
         fmul_guf_detect_fx3,
         fdiv_guf_detect_fx3,
         unfin_src_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_16 fx3_08  (
  .scan_in(fx3_08_scanin),
  .scan_out(fx3_08_scanout),
  .l1clk(l1clk_pm1),
  .din ({gsr0_mask_sel_fx2[1:0],
         gsr1_mask_sel_fx2[1:0],
         gsr2_mask_sel_fx2[1:0],
         gsr3_mask_sel_fx2[1:0],
         gsr4_mask_sel_fx2[1:0],
         gsr5_mask_sel_fx2[1:0],
         gsr6_mask_sel_fx2[1:0],
         gsr7_mask_sel_fx2[1:0]}),
  .dout({gsr0_mask_sel_fx3[1:0],
         gsr1_mask_sel_fx3[1:0],
         gsr2_mask_sel_fx3[1:0],
         gsr3_mask_sel_fx3[1:0],
         gsr4_mask_sel_fx3[1:0],
         gsr5_mask_sel_fx3[1:0],
         gsr6_mask_sel_fx3[1:0],
         gsr7_mask_sel_fx3[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_17 fx3_09  (
  .scan_in(fx3_09_scanin),
  .scan_out(fx3_09_scanout),
  .l1clk(l1clk_pm1),
  .din ({in_rngl_cdbus_1f[27:25],
         in_rngl_cdbus_1f[7:0],
         gsr_align_fx2[2:0],
         gsr_imirnd_fx2[2:0]}),
  .dout({in_rngl_cdbus_2f_b27_25[2:0],
         in_rngl_cdbus_2f[7:0],
         gsr_align_fx3[2:0],
         gsr_imirnd_fx3[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_8 fx3_10  (
  .scan_in(fx3_10_scanin),
  .scan_out(fx3_10_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpx_unfin_vld_fx2,
         ns_mode_fx2,
         fpx_of_vld_fx2,
         fpx_uf_vld_fx2,
         fpx_nx_vld_fx2,
         ecc_trap_fx2,
         fpx_dzc_fx2,
         i_fxp_nvc_fx2}),
  .dout({fpx_unfin_vld_fx3,
         ns_mode_fx3,
         fpx_of_vld_fx3,
         fpx_uf_vld_fx3,
         fpx_nx_vld_fx3,
         ecc_trap_fx3,
         fpx_dzc_fx3,
         i_fxp_nvc_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fpc_emin_fx3 = fdiv_unf_predict_fx3;

assign  fpc_gsr0_mask_sel_fx3[1:0] =
  gsr0_mask_sel_fx3[1:0] & 
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd0)))}};

assign  fpc_gsr1_mask_sel_fx3[1:0] =
  gsr1_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd1)))}};

assign  fpc_gsr2_mask_sel_fx3[1:0] =
  gsr2_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd2)))}};

assign  fpc_gsr3_mask_sel_fx3[1:0] =
  gsr3_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd3)))}};

assign  fpc_gsr4_mask_sel_fx3[1:0] =
  gsr4_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd4)))}};

assign  fpc_gsr5_mask_sel_fx3[1:0] =
  gsr5_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd5)))}};

assign  fpc_gsr6_mask_sel_fx3[1:0] =
  gsr6_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd6)))}};

assign  fpc_gsr7_mask_sel_fx3[1:0] =
  gsr7_mask_sel_fx3[1:0] &
  {2{~((fac_tlu_flush_fx3 | dec_flush_fx3) & (~rng_wr_gsr_4f | (gsr_asr_tid_fx3[2:0] != 3'd7)))}};

assign  gsr_w_vld_fx3[1] = i_gsr_w_vld_fx3[1] & ~fac_tlu_flush_fx3 & ~dec_flush_fx3;
assign  fgx_siam_fx3     = i_fgx_siam_fx3     & ~fac_tlu_flush_fx3 & ~dec_flush_fx3;

assign  idiv0_trap_fx3 =
  i_idiv0_trap_fx3   &
  ~dec_flush_fx3     &
  ~fac_tlu_flush_fx3 ;

assign  w1_vld_fx3[1:0] =
  i_w1_vld_fx3[1:0]       &
  {2{~dec_flush_fx3}}     &
  {2{~fac_tlu_flush_fx3}} &
  {2{~((fec_uecc_fx2 | fec_cecc_fx2) & fgx_pdist_fx3)}};  // pdist 2nd beat ecc error

assign  fsr_w1_vld_fx3[0] =
  i_fsr_w1_vld_fx3[0] &
  ~dec_flush_fx3      &
  ~fac_tlu_flush_fx3  ;

assign  fsr_w1_vld_fx3[1] =
  i_fsr_w1_vld_fx3[1] &
  ~dec_flush_fx3      &
  ~fac_tlu_flush_fx3  ;

assign  lzd_override_fx3 =
  (~logical_sub_fx3 &              // covers mul and logical_add with 1X.XX
   ~(itype_fx3[2:0] == 3'b001)) |  // never override if fpfp
  (itype_fx3[2:0] == 3'b011);      // intfp (prevent zero_mant detection due to 10.00 case.
                                   //        intfp 10.00 may result from 2's comp)

// ------------------------------------
// FDIV/FSQRT intermediate exponent (Eint) capture
//            result sign capture
// ------------------------------------

assign  div_dec_issue_fx3  =  div_valid_fx3 & ~divq_valid_fx3;
assign  div_divq_issue_fx3 =  div_valid_fx3 &  divq_valid_fx3;
assign  div_divq_load_fx3  = ~div_valid_fx3 &  divq_valid_fx3;
assign  div_hold_fx3       = ~div_dec_issue_fx3 & ~div_divq_issue_fx3;

assign  fdiv_ovf_predict_inf_fx3 =
  fdiv_ovf_predict_fx3 &
  ( (fpc_rd_mode_fx3[1:0] == 2'b00)                    |    // nearest
   ((fpc_rd_mode_fx3[1:0] == 2'b10) & ~sign_inter_fx3) |    // +inf
   ((fpc_rd_mode_fx3[1:0] == 2'b11) &  sign_inter_fx3)  );  // -inf

assign  fdiv_ovf_predict_max_fx3 =
  fdiv_ovf_predict_fx3 &
  ( (fpc_rd_mode_fx3[1:0] == 2'b01)                    |    // trunc
   ((fpc_rd_mode_fx3[1:0] == 2'b10) &  sign_inter_fx3) |    // +inf
   ((fpc_rd_mode_fx3[1:0] == 2'b11) & ~sign_inter_fx3)  );  // -inf

// ------------
// capture data for instr that is entering the div engine
// ------------

assign  div_eint_in_fx3[18:0] =
  ({19{div_dec_issue_fx3 }} & {fsr_tem_fx3[3], fsr_tem_fx3[2], fsr_tem_fx3[0],
                               ns_mode_fx3,
                               fdiv_ovf_predict_inf_fx3,
                               fdiv_ovf_predict_max_fx3,
                               fdiv_unf_predict_fx3,
                               sign_inter_fx3,
                                  fpd_eint_fx3[10:0]}) |  // load from DEC  issue
  ({19{div_divq_issue_fx3}} &    divq_eint_fx4[18:0] ) |  // load from divq issue
  ({19{div_hold_fx3      }} &     div_eint_fx4[18:0] ) ;  // hold

// ------------
// capture data for instr that is entering the div queue
// ------------

assign  divq_eint_in_fx3[18:0] =
  ({19{ div_divq_load_fx3}} & {fsr_tem_fx3[3], fsr_tem_fx3[2], fsr_tem_fx3[0],
                               ns_mode_fx3,
                               fdiv_ovf_predict_inf_fx3,
                               fdiv_ovf_predict_max_fx3,
                               fdiv_unf_predict_fx3,
                               sign_inter_fx3,
                                  fpd_eint_fx3[10:0]}) |  // load from DEC  issue
  ({19{~div_divq_load_fx3}} &    divq_eint_fx4[18:0] ) ;  // hold

// ------------------------------------
// Exponent fpint detection
// - fpint "small source" detection
//   If DP exp is < 11'h3ff, or SP exp is < 8'h7f
//   then fpint result must be forced to zero
// - fpint "large source" detection
//   max +DP source =  (2^63)-1
//   max +SP source =  (2^31)-1
//   max -DP source = -(2^63)
//   max -SP source = -(2^31)
// ------------------------------------

assign  dpint_zero_fx3 =
  ~rs2_exp_fx3[10]                        &
  ~(rs2_exp_fx3[10:0] == 11'b01111111111) &
  ~(bze_fx3 & bzf_fx3                   ) &  // ~zero src (simplifies inexact eq. later)
   (itype_fx3[2:0]    == 3'b010         ) &
					     // FdTO(i,x)
   (stype_fx3[0]      == 1'b1           ) ;  // 0in bits_on -max 1 -var {dpint_zero_fx3, spint_zero_fx3, dp_large_maxint_result_fx3, sp_large_maxint_result_fx3} -active (|w1_vld_fx3[1:0])

assign  spint_zero_fx3 =
  ~rs2_exp_fx3[7]                         &
  ~(rs2_exp_fx3[7:0] == 8'b01111111     ) &
  ~(bze_fx3 & bzf_fx3                   ) &  // ~zero src (simplifies inexact eq. later)
   (itype_fx3[2:0]   == 3'b010          ) &
   (stype_fx3[0]     == 1'b0            ) ;  // FsTO(i,x)

assign  fpint_zero_fx3 = dpint_zero_fx3 | spint_zero_fx3;

assign  dp_large_maxint_result_fx3 =

  ((((rs2_exp_fx3[10:0] >  11'b10000111110)                  ) |       // 2^(63+1023)
    ((rs2_exp_fx3[10:0] == 11'b10000111110) & ~sign_inter_fx3) |       // 2^(63+1023)
    ((rs2_exp_fx3[10:0] == 11'b10000111110) &  sign_inter_fx3          // 2^(63+1023)
                                            & ~bzf_fx3       )  ) &
   ((itype_fx3[2:0] == 3'b010) &
    (stype_fx3[1:0] == 2'b01 ) &
    (dtype_fx3[2:0] == 3'b100)                                  )  ) | // FdTOx

  ((((rs2_exp_fx3[7:0]  >      8'b10111110)                  ) |       // 2^(63+ 127)
    ((rs2_exp_fx3[7:0]  ==     8'b10111110) & ~sign_inter_fx3) |       // 2^(63+ 127)
    ((rs2_exp_fx3[7:0]  ==     8'b10111110) &  sign_inter_fx3          // 2^(63+ 127)
                                            & ~bzf_fx3       )  ) &
   ((itype_fx3[2:0] == 3'b010) &
    (stype_fx3[1:0] == 2'b00 ) &
    (dtype_fx3[2:0] == 3'b100)                                  )  ) | // FsTOx

  ((((rs2_exp_fx3[10:0] >  11'b10000011110)                  ) |       // 2^(31+1023)
    ((rs2_exp_fx3[10:0] == 11'b10000011110) & ~sign_inter_fx3) |       // 2^(31+1023)
    ((rs2_exp_fx3[10:0] == 11'b10000011110) &  sign_inter_fx3          // 2^(31+1023)
// Note: must return inexact (not invalid) as long as most signif 31-bits of frac are zero
                                            & ~bzf31msb_fx3  )  ) &
   ((itype_fx3[2:0] == 3'b010) &
    (stype_fx3[1:0] == 2'b01 ) &
    (dtype_fx3[2:0] == 3'b011)                                  )  ) ; // FdTOi

assign  sp_large_maxint_result_fx3 =

  ((((rs2_exp_fx3[7:0]  >      8'b10011110)                  ) |       // 2^(31+ 127)
    ((rs2_exp_fx3[7:0]  ==     8'b10011110) & ~sign_inter_fx3) |       // 2^(31+ 127)
    ((rs2_exp_fx3[7:0]  ==     8'b10011110) &  sign_inter_fx3          // 2^(31+ 127)
                                            & ~bzf_fx3       )  ) &
   ((itype_fx3[2:0] == 3'b010) &
    (stype_fx3[1:0] == 2'b00 ) &
    (dtype_fx3[2:0] == 3'b011)                                  )  ) ; // FsTOi

assign  maxint_result_fx3  =
  (nan_maxint_result_fx3      | inf_maxint_result_fx3 |
   dp_large_maxint_result_fx3 | sp_large_maxint_result_fx3);

assign  fpx_nvc_fx3 = i_fxp_nvc_fx3 | maxint_result_fx3;

// ------------------------------------
// GSR{im,irnd,scale,align} ASR/SIAM/ALIGNADDRESS/hold mux
//
// - architected GSR is an fx4 flop
// - the ASR/SIAM/ALIGNADDRESS/hold mux function is done in fx3
// - the instr performing the read uses the fx4 data during fx3
// ------------------------------------

assign  gsr0_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd0)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd0)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr0_11bits_fx4[7:3],  gsr0_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd0)}}                                      // ALIGNADDRESS
    & {gsr0_11bits_fx4[10:8],        gsr0_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd0))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd0)))}}  // hold
    & {gsr0_11bits_fx4[10:8],        gsr0_11bits_fx4[7:3],  gsr0_11bits_fx4[2:0]  }) ;

assign  gsr1_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd1)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd1)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr1_11bits_fx4[7:3],  gsr1_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd1)}}                                      // ALIGNADDRESS
    & {gsr1_11bits_fx4[10:8],        gsr1_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd1))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd1)))}}  // hold
    & {gsr1_11bits_fx4[10:8],        gsr1_11bits_fx4[7:3],  gsr1_11bits_fx4[2:0]  }) ;

assign  gsr2_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd2)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd2)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr2_11bits_fx4[7:3],  gsr2_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd2)}}                                      // ALIGNADDRESS
    & {gsr2_11bits_fx4[10:8],        gsr2_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd2))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd2)))}}  // hold
    & {gsr2_11bits_fx4[10:8],        gsr2_11bits_fx4[7:3],  gsr2_11bits_fx4[2:0]  }) ;

assign  gsr3_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd3)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd3)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr3_11bits_fx4[7:3],  gsr3_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd3)}}                                      // ALIGNADDRESS
    & {gsr3_11bits_fx4[10:8],        gsr3_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd3))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd3)))}}  // hold
    & {gsr3_11bits_fx4[10:8],        gsr3_11bits_fx4[7:3],  gsr3_11bits_fx4[2:0]  }) ;

assign  gsr4_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd4)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd4)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr4_11bits_fx4[7:3],  gsr4_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd4)}}                                      // ALIGNADDRESS
    & {gsr4_11bits_fx4[10:8],        gsr4_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd4))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd4)))}}  // hold
    & {gsr4_11bits_fx4[10:8],        gsr4_11bits_fx4[7:3],  gsr4_11bits_fx4[2:0]  }) ;

assign  gsr5_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd5)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd5)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr5_11bits_fx4[7:3],  gsr5_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd5)}}                                      // ALIGNADDRESS
    & {gsr5_11bits_fx4[10:8],        gsr5_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd5))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd5)))}}  // hold
    & {gsr5_11bits_fx4[10:8],       gsr5_11bits_fx4[7:3],  gsr5_11bits_fx4[2:0]  }) ;

assign  gsr6_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd6)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd6)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr6_11bits_fx4[7:3],  gsr6_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd6)}}                                      // ALIGNADDRESS
    & {gsr6_11bits_fx4[10:8],        gsr6_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd6))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd6)))}}  // hold
    & {gsr6_11bits_fx4[10:8],        gsr6_11bits_fx4[7:3],  gsr6_11bits_fx4[2:0]  }) ;

assign  gsr7_11bits_fx3[10:0] =
  ({11{rng_wr_gsr_4f    & (gsr_asr_tid_fx3[2:0] == 3'd7)}}                                      // ASR
    & {in_rngl_cdbus_3f_b27_25[2:0], in_rngl_cdbus_3f[7:3], in_rngl_cdbus_3f[2:0] }) |
  ({11{fgx_siam_fx3     & (        tid_fx3[2:0] == 3'd7)}}                                      // SIAM
    & {gsr_imirnd_fx3[2:0],          gsr7_11bits_fx4[7:3],  gsr7_11bits_fx4[2:0]  }) |
  ({11{gsr_w_vld_fx3[1] & (        tid_fx3[2:0] == 3'd7)}}                                      // ALIGNADDRESS
    & {gsr7_11bits_fx4[10:8],        gsr7_11bits_fx4[7:3],  gsr_align_fx3[2:0]    }) |
  ({11{(~rng_wr_gsr_4f | (rng_wr_gsr_4f & (gsr_asr_tid_fx3[2:0] != 3'd7))) &
       ((~fgx_siam_fx3 & ~gsr_w_vld_fx3[1]) | ((fgx_siam_fx3 | gsr_w_vld_fx3[1]) & (tid_fx3[2:0] != 3'd7)))}}  // hold
    & {gsr7_11bits_fx4[10:8],        gsr7_11bits_fx4[7:3],  gsr7_11bits_fx4[2:0]  }) ;

assign  gsr_11bits_fx3[7:0] =
  ({ 8{(            tid_fx2[2:0] == 3'd0)}} & gsr0_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd1)}} & gsr1_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd2)}} & gsr2_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd3)}} & gsr3_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd4)}} & gsr4_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd5)}} & gsr5_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd6)}} & gsr6_11bits_fx3[7:0] ) |
  ({ 8{(            tid_fx2[2:0] == 3'd7)}} & gsr7_11bits_fx3[7:0] ) ;

assign  gsr_asr_11bits_fx3[10:0] =
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd0)}} & gsr0_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd1)}} & gsr1_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd2)}} & gsr2_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd3)}} & gsr3_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd4)}} & gsr4_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd5)}} & gsr5_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd6)}} & gsr6_11bits_fx3[10:0]) |
  ({11{(fac_gsr_asr_tid_fx2[2:0] == 3'd7)}} & gsr7_11bits_fx3[10:0]) ;

assign  gsr_imirnd_held_fx3[2:0] =
  ({ 3{(            tid_fx1[2:0] == 3'd0)}} & gsr0_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd1)}} & gsr1_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd2)}} & gsr2_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd3)}} & gsr3_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd4)}} & gsr4_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd5)}} & gsr5_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd6)}} & gsr6_11bits_fx4[10:8]) |
  ({ 3{(            tid_fx1[2:0] == 3'd7)}} & gsr7_11bits_fx4[10:8]) ;

assign  siam_1ahead_sel_fx3 =
  fac_fgx_siam_fx2 & (tid_fx1[2:0] == tid_fx2[2:0]);  // note: this siam not qual by flushes

assign  siam_2ahead_sel_fx3 =
  ~siam_1ahead_sel_fx3 &
  fgx_siam_fx3     & (tid_fx1[2:0] == tid_fx3[2:0]);

assign  siam_none_sel_fx3 =
  ~siam_1ahead_sel_fx3 &
  ~siam_2ahead_sel_fx3 ;

assign  {gsr_im_fx3, gsr_irnd_fx3[1:0]} =
  ({3{siam_1ahead_sel_fx3}} & gsr_imirnd_fx2[2:0]     ) |
  ({3{siam_2ahead_sel_fx3}} & gsr_imirnd_fx3[2:0]     ) |
  ({3{siam_none_sel_fx3  }} & gsr_imirnd_held_fx3[2:0]) ;


// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_4 fx4_00  (
  .scan_in(fx4_00_scanin),
  .scan_out(fx4_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({rs1_fx3_b31, rs2_fx3_b31, fpc_rd_mode_fx3[1:0]}),
  .dout({rs1_fx4_b31, rs2_fx4_b31,     rd_mode_fx4[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_37 fx4_01  (
  .scan_in(fx4_01_scanin),
  .scan_out(fx4_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_vld_fx3[1:0],
         fgu_cmp_fcc_fx3[1:0],
         fgu_cmp_fcc_vld_fx3[3:0],
         idiv0_trap_fx3,
         sign_inter_fx3,
             lzd_override_fx3,
         logical_sub_fx3,
         fpint_zero_fx3,
         fsr_w1_vld_fx3[1:0],
         a_nan_fx3,
         b_nan_fx3,
         fpf_byte_unsure_x_dp_fx3[1:0],
         fpf_byte_unsure_x_sp_fx3[1:0],
         w1_odd32b_fx3,
         mass_align_sticky_fx3,
         fadd_logical_sub_fx3,
         fsr_store_fx3,
         fmul_den2nor_m2_predict_fx3,
         fdiv_den2nor_sp_fx3,
         fdiv_den2nor_dp_fx3,
         rm_near_sp_fx3,
         rm_near_dp_fx3,
         rm_directed_sp_fx3,
         rm_directed_dp_fx3,
         aboe_fx3,
         abze_fx3,
         div_default_res_fx3,
         dec_flush_fx3,
         fac_tlu_flush_fx3}),
  .dout({i_w1_vld_fx4[1:0],
                 fcc_fx4[1:0],
                 fcc_vld_fx4[3:0],
         idiv0_trap_fx4,
         sign_inter_fx4,
         fpc_lzd_override_fx4,
         logical_sub_fx4,
         fpint_zero_fx4,
         i_fsr_w1_vld_fx4[1:0],
         a_nan_fx4,
         b_nan_fx4,
             byte_unsure_x_dp_fx4[1:0],
             byte_unsure_x_sp_fx4[1:0],
         w1_odd32b_fx4,
         mass_align_sticky_fx4,
         fadd_logical_sub_fx4,
         fsr_store_fx4,
         fmul_den2nor_m2_predict_fx4,
         fdiv_den2nor_sp_fx4,
         fdiv_den2nor_dp_fx4,
         rm_near_sp_fx4,
         rm_near_dp_fx4,
         rm_directed_sp_fx4,
         rm_directed_dp_fx4,
         aboe_fx4,
         abze_fx4,
         div_default_res_fx4,
         dec_flush_fx4,
         tlu_flush_fgu_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_15 fx4_02  (
  .scan_in(fx4_02_scanin),
  .scan_out(fx4_02_scanout),
  .l1clk(l1clk_pm1),
  .din ({vis_cmp_result_fx3[3:0],     int_res_sel_fx3[5:1], itype_fx3[2:0], dtype_fx3[2:0]}),
  .dout({vis_cmp_result_fx4[3:0], fpc_int_res_sel_fx4[5:1], itype_fx4[2:0], dtype_fx4[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_38 fx4_03  (
  .scan_in(fx4_03_scanin),
  .scan_out(fx4_03_scanout),
  .l1clk(l1clk_pm1),
  .din ({div_eint_in_fx3[18:0], divq_eint_in_fx3[18:0]}),
  .dout({div_eint_fx4[18:0],    divq_eint_fx4[18:0]   }),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_5 fx4_04  (
  .scan_in(fx4_04_scanin),
  .scan_out(fx4_04_scanout),
  .l1clk(l1clk_pm1),
  .din (fsr_tem_fx3[4:0]),
  .dout(fsr_tem_fx4[4:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_5 fx4_05  (
  .scan_in(fx4_05_scanin),
  .scan_out(fx4_05_scanout),
  .l1clk(l1clk_pm1),
  .din ({inf_src_result_fx3,
         zero_src_result_fx3,
         nan_default_result_fx3,
         qthenan_fx3,
         maxint_result_fx3}),
  .dout({inf_src_result_fx4,
         zero_src_result_fx4,
         nan_default_result_fx4,
         fpc_qthenan_fx4,
         maxint_result_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_16 fx4_06  (
  .scan_in(fx4_06_scanin),
  .scan_out(fx4_06_scanout),
  .l1clk(l1clk_pm1),
  .din ({fadd_ovf_predict_fx3,
         fdtos_ovf_predict_fx3,
         fdtos_ovf_detect_fx3,
         fmul_ovf_predict_fx3,
         fmul_ovf_detect_fx3,
         fdiv_ovf_detect_fx3,
         fdtos_unf_predict_fx3,
         fdtos_unf_detect_fx3,
         fmul_unf_predict_fx3,
         fmul_unf_detect_fx3,
         fdiv_unf_detect_fx3,
         bof22msb_fx3,
         fdtos_guf_detect_fx3,
         fmul_guf_detect_fx3,
         fdiv_guf_detect_fx3,
         unfin_src_fx3}),
  .dout({fadd_ovf_predict_fx4,
         fdtos_ovf_predict_fx4,
         fdtos_ovf_detect_fx4,
         fmul_ovf_predict_fx4,
         fmul_ovf_detect_fx4,
         fdiv_ovf_detect_fx4,
         fdtos_unf_predict_fx4,
         fdtos_unf_detect_fx4,
         fmul_unf_predict_fx4,
         fmul_unf_detect_fx4,
         fdiv_unf_detect_fx4,
         bof22msb_fx4,
         fdtos_guf_detect_fx4,
         fmul_guf_detect_fx4,
         fdiv_guf_detect_fx4,
         unfin_src_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_88 fx4_07  (				// FS:wmr_protect
  .scan_in(fx4_07_wmr_scanin),
  .scan_out(fx4_07_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din ({gsr0_11bits_fx3[10:0],
         gsr1_11bits_fx3[10:0],
         gsr2_11bits_fx3[10:0],
         gsr3_11bits_fx3[10:0],
         gsr4_11bits_fx3[10:0],
         gsr5_11bits_fx3[10:0],
         gsr6_11bits_fx3[10:0],
         gsr7_11bits_fx3[10:0]}),
  .dout({gsr0_11bits_fx4[10:0],
         gsr1_11bits_fx4[10:0],
         gsr2_11bits_fx4[10:0],
         gsr3_11bits_fx4[10:0],
         gsr4_11bits_fx4[10:0],
         gsr5_11bits_fx4[10:0],
         gsr6_11bits_fx4[10:0],
         gsr7_11bits_fx4[10:0]}),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_8 fx4_08  (
  .scan_in(fx4_08_scanin),
  .scan_out(fx4_08_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpx_unfin_vld_fx3,
         ns_mode_fx3,
         fpx_of_vld_fx3,
         fpx_uf_vld_fx3,
         fpx_nx_vld_fx3,
         ecc_trap_fx3,
         fpx_dzc_fx3,
         fpx_nvc_fx3}),
  .dout({fpx_unfin_vld_fx4,
         ns_mode_fx4,
         fpx_of_vld_fx4,
         fpx_uf_vld_fx4,
         fpx_nx_vld_fx4,
         ecc_trap_fx4,
         fpx_dzc_fx4,
         fpx_nvc_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_11 fx4_09  (
  .scan_in(fx4_09_scanin),
  .scan_out(fx4_09_scanout),
  .l1clk(l1clk_pm1),
  .din ({in_rngl_cdbus_2f_b27_25[2:0],
         in_rngl_cdbus_2f[7:0]}),
  .dout({in_rngl_cdbus_3f_b27_25[2:0],
         in_rngl_cdbus_3f[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_1 fx4_10  (
  .scan_in(fx4_10_scanin),
  .scan_out(fx4_10_scanout),
  .l1clk(l1clk_pm2),
  .din ({lsu_fgu_exception_w}),  // requires free running clk
  .dout({stfsr_exception_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_19 fx4_11  (
  .scan_in(fx4_11_scanin),
  .scan_out(fx4_11_scanout),
  .l1clk(l1clk_pm1),
  .din ({gsr_11bits_fx3[7:0],
             gsr_asr_11bits_fx3[10:0]}),
  .dout({fpc_gsr_scale_fx4[4:0], fpc_gsr_align_fx4[2:0],
         fpc_gsr_asr_11bits_fx4[10:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

// ------------------------------------
// Main adder output format mux selects
// ------------------------------------

assign  fpc_ma_fmt_sel_fx4[0] =    // logical_sub 00.1X, not possible for logical_add
  ( logical_sub_fx4        ) &
  (itype_fx4[2:0] == 3'b000) &
  (dtype_fx4[2:1] == 2'b00 ) &
  (fpf_ma_sum_fx4[63:62] == 2'b01);

assign  fpc_ma_fmt_sel_fx4[1] =
  ((~logical_sub_fx4        ) &    // logical_add 1X.XX
   (itype_fx4[2:0] == 3'b000) &
   (dtype_fx4[2:1] == 2'b00 ) &
   (fpf_ma_cout_fx4         )  ) |
  ((itype_fx4[2:0] == 3'b011) &    // intfp 10.00 (may result from 2's comp)
   (fpf_ma_cout_fx4         )  ) ;

assign  fpc_ma_fmt_sel_fx4[2] =    // default for non fmul
  fpc_qthenan_fx4                | // ensure nan propagation for fmul, fdiv, fsqrt
  ~(itype_fx4[2:0] == 3'b101);     // ~mul

assign  fpc_ma_fmt_sel_fx4[3] =
  fmul_den2nor_m2_predict_fx4;     // fmul 11.XX, Eint=Emin-2, denorm inter. result may rnd to norm

assign  fpc_ma_fmt_sel_fx4[4] =
  fmul_unf_predict_fx4;            // fmul 01.XX, Eint=Emin-1, denorm inter. result may rnd to norm

// ------------------------------------
// Integer output constant mux selects
// ------------------------------------

assign  maxpos_result_fx4  = maxint_result_fx4  & ~sign_inter_fx4;
assign  maxneg_result_fx4  = maxint_result_fx4  &  sign_inter_fx4;

assign  int_sel_fx4[0] =                                      // 64'h0000000000000000
  (itype_fx4[2:0] == 3'b010) &                                // F(s,d)TO(i,x)
  fpint_zero_fx4;                                             // zero result

assign  int_sel_fx4[1] = maxneg_result_fx4;                   // 64'h8000000000000000

assign  int_sel_fx4[2] =                                      // 64'h7fffffffffffffff
  nan_default_result_fx4 | maxpos_result_fx4;

assign  int_sel_fx4[3] =
  ((itype_fx4[2:0] == 3'b000) & (dtype_fx4[2:1] == 2'b01)) |  // vis partitioned add
  ((itype_fx4[2:0] == 3'b010)                            ) ;  // F(s,d)TO(i,x)

assign  mulscc_iccn_fx4 =  fpf_ma_sum_fx4[31];
assign  mulscc_iccc_fx4 =  fpf_ma_sum_fx4[32];

// overflow if both oprands have same sign and sign of sum is different
assign  mulscc_iccv_fx4 =
  ( rs1_fx4_b31 &  rs2_fx4_b31 & ~fpf_ma_sum_fx4[31]) |
  (~rs1_fx4_b31 & ~rs2_fx4_b31 &  fpf_ma_sum_fx4[31]) ;

assign  exp_sel_mul_fx4 = (itype_fx4[2:0] == 3'b101) & ~(a_nan_fx4 | b_nan_fx4);  // mul
assign  fpc_sp_dest_fx4 = (dtype_fx4[2:0] == 3'b000);  // sp

// ------------------------------------
// FDIV/FSQRT result exponent (Eresult)
//   Eresult=Eint-Eadj
// ------------------------------------

assign  fpc_fpd_sign_res = div_eint_fx4[11];

assign  fpd_const_sel[0] =  // select fdd frac and not fdiv underflow/overflow
  ~( div_eint_fx4[12]    &  fdc_dec_exp_early) &  // ~(fdiv_unf_predict => detect)
  ~(|div_eint_fx4[14:13] & ~fdc_dec_exp_early) ;  // ~(fdiv_ovf_predict => detect)

assign  fpd_const_sel[1] =  // select fdiv overflow +/-max (frac=ff..ff)
   ( div_eint_fx4[13]    & ~fdc_dec_exp_early) ;  //  (fdiv_ovf_predict => detect)

// 0in bits_on -max 1 -var fpd_const_sel[1:0]

assign  fpd_exp_res[10:0] =
  ({11{~fdc_dec_exp_early     & fpd_const_sel[0]}} & (div_eint_fx4[10:0]                  )) |  // Eresult=Eint-0
  ({11{ fdc_dec_exp_early     & fpd_const_sel[0]}} & (div_eint_fx4[10:0] + 11'b11111111111)) |  // Eresult=Eint-1
  ({11{~(|fpd_const_sel[1:0]) & div_eint_fx4[12]}} & (                     11'b00000000000)) |  // Eresult=zero
  ({11{~(|fpd_const_sel[1:0]) & div_eint_fx4[14]}} & (                     11'b11111111111)) |  // Eresult=inf
  ({11{ fpd_const_sel[1]                        }} & (                     11'b11111111110)) ;  // Eresult=max

// ------------------------------------
// floating point zero sign
// ------------------------------------

assign  sign_retain_zero_fx4 = ~logical_sub_fx4;

assign  sign_zero_fx4 =
  (~sign_retain_zero_fx4 & (rd_mode_fx4[1:0] == 2'b11)) |  // rnd -inf
  ( sign_retain_zero_fx4 &  sign_inter_fx4            ) ;

// ------------------------------------
// Add pipe Rinc calculation
// - FADD(s,d), FSUB(s,d), FiTOs, FxTO(s,d), FdTOs
// - Determine if LSB should be inc due to round
//
// Rounding equations:
//
// Rinc = 
//   (near &  G    & (LSB | X)) |
//   (+inf & ~sign & (G   | X)) |
//   (-inf &  sign & (G   | X)) ;
//
// directed = 
//   (+inf & ~sign) |
//   (-inf &  sign) ;
//
// Rinc =  // nand3-nand4 delay
//   (near     & G & LSB) |
//   (near     & G & X  ) |
//   (directed & G      ) |
//   (directed     & X  ) ;
//
// ------------------------------------

// ignore cout if logical_sub
assign  add_ma_cout_fx4 = ~(logical_sub_fx4 & (itype_fx4 == 3'b000)) & fpf_ma_cout_fx4;

assign  convert_fmt_1xx_fx4 =
   fpf_ma_cout_fx4 &                                         // 1X.XX
  (((itype_fx4[2:0] == 3'b011) |                             // FxTOs, FiTOs, FdTOs
    (itype_fx4[2:0] == 3'b001)  ) &
   (dtype_fx4       == 3'b000)     );

assign  convert_fmt_01x_fx4 =
  ~fpf_ma_cout_fx4 &                                         // 01.XX
  (((itype_fx4[2:0] == 3'b011) |                             // FxTOs, FiTOs, FdTOs
    (itype_fx4[2:0] == 3'b001)  ) &
   (dtype_fx4       == 3'b000)     );

assign  fxtod_fmt_1xx_fx4 =
   fpf_ma_cout_fx4 &                                         // 1X.XX
  ((itype_fx4[2:0]  == 3'b011) &                             // FxTOd
   (dtype_fx4       == 3'b001)     );

assign  fxtod_fmt_01x_fx4 =
  ~fpf_ma_cout_fx4 &                                         // 01.XX
  ((itype_fx4[2:0]  == 3'b011) &                             // FxTOd
   (dtype_fx4       == 3'b001)     );

assign  add_fmt_1xx_fx4 =
  convert_fmt_1xx_fx4 | fxtod_fmt_1xx_fx4 |                  // FxTOs, FiTOs, FdTOs, FxTOd
  (({add_ma_cout_fx4                       } == 1'b1  ) &    // 1X.XX
   (itype_fx4[2:0] == 3'b000)                            );  // add

assign  add_fmt_01x_fx4 =
  convert_fmt_01x_fx4 | fxtod_fmt_01x_fx4 |                  // FxTOs, FiTOs, FdTOs, FxTOd
  (({add_ma_cout_fx4, fpf_ma_sum_fx4[63]   } == 2'b01 ) &    // 01.XX
   (itype_fx4[2:0] == 3'b000)                            );  // add

assign  add_fmt_001_fx4 =
  (({add_ma_cout_fx4, fpf_ma_sum_fx4[63:62]} == 3'b001) &    // 00.1X
   (itype_fx4[2:0] == 3'b000)                            );  // add

assign  aln_fmt_1xx_fx4 =
  (({add_ma_cout_fx4                       } == 1'b1  ) &    // 1X.XX
   (itype_fx4[2:0] == 3'b000)                            );  // add

assign  aln_fmt_01x_fx4 =
  (({add_ma_cout_fx4, fpf_ma_sum_fx4[63]   } == 2'b01 ) &    // 01.XX
   (itype_fx4[2:0] == 3'b000)                            );  // add

assign  add_lsb_bit_dp_fx4 =
  (add_fmt_1xx_fx4 &   fpf_ma_sum_fx4[12]   ) |  // 1X.XX
  (add_fmt_01x_fx4 &   fpf_ma_sum_fx4[11]   ) |  // 01.XX
  (add_fmt_001_fx4 &   fpf_ma_sum_fx4[10]   ) ;  // 00.1X

assign  add_g_bit_dp_fx4 =
  (add_fmt_1xx_fx4 &   fpf_ma_sum_fx4[11]   ) |  // 1X.XX
  (add_fmt_01x_fx4 &   fpf_ma_sum_fx4[10]   ) |  // 01.XX
  (add_fmt_001_fx4 &   fpf_ma_sum_fx4[9]   ) ;  // 00.1X

assign  add_lsb_bit_sp_fx4 =
  (add_fmt_1xx_fx4 &   fpf_ma_sum_fx4[41]   ) |  // 1X.XX
  (add_fmt_01x_fx4 &   fpf_ma_sum_fx4[40]   ) |  // 01.XX
  (add_fmt_001_fx4 &   fpf_ma_sum_fx4[39]   ) ;  // 00.1X

assign  add_g_bit_sp_fx4 =
  (add_fmt_1xx_fx4 &   fpf_ma_sum_fx4[40]   ) |  // 1X.XX
  (add_fmt_01x_fx4 &   fpf_ma_sum_fx4[39]   ) |  // 01.XX
  (add_fmt_001_fx4 &   fpf_ma_sum_fx4[38]   ) ;  // 00.1X

assign  align_x_bit_dp_fx4 =
  (aln_fmt_1xx_fx4 & ( byte_unsure_x_dp_fx4[1] |   // 1X.XX
                       byte_unsure_x_dp_fx4[0] |
                       fpf_ma_sum_fx4[10]      |
                       fpf_ma_sum_fx4[9]      |
                      ~fpf_align_sticky_fx4_l)) |
  (aln_fmt_01x_fx4 & ( mass_align_sticky_fx4   |   // 01.XX
                       byte_unsure_x_dp_fx4[0] |
                       fpf_ma_sum_fx4[9]      |
                      (~fpf_align_sticky_fx4_l & ~abze_fx4))) |  // ignore sticky if zero exp (must be fmt_01x)
  (add_fmt_001_fx4 & (~fpf_align_sticky_fx4_l)) ;  // 00.1X

assign  align_x_bit_sp_fx4 =
  (aln_fmt_1xx_fx4 & ( byte_unsure_x_sp_fx4[1] |   // 1X.XX
                       byte_unsure_x_sp_fx4[0] |
                       fpf_ma_sum_fx4[39]      |
                       fpf_ma_sum_fx4[38]      |
                      ~fpf_align_sticky_fx4_l)) |
  (aln_fmt_01x_fx4 & ( mass_align_sticky_fx4   |   // 01.XX
                       byte_unsure_x_sp_fx4[0] |
                       fpf_ma_sum_fx4[38]      |
                      (~fpf_align_sticky_fx4_l & ~abze_fx4))) |  // ignore sticky if zero exp (must be fmt_01x)
  (add_fmt_001_fx4 & (~fpf_align_sticky_fx4_l)) ;  // 00.1X

assign  convert_x_bit_sp_fx4 =
  (convert_fmt_1xx_fx4 & (fpf_ma_sum_fx4[39] |        // 1X.XX
                          fic_convert_sticky_fx4)) |
  (convert_fmt_01x_fx4 & (fic_convert_sticky_fx4)) ;  // 01.XX

assign  fxtod_x_bit_dp_fx4 =
  (fxtod_fmt_1xx_fx4   & (fpf_ma_sum_fx4[10] |        // 1X.XX
                          fic_fxtod_sticky_fx4  )) |
  (fxtod_fmt_01x_fx4   & (fic_fxtod_sticky_fx4  )) ;  // 01.XX

assign  add_x_bit_dp_fx4 = align_x_bit_dp_fx4 | fxtod_x_bit_dp_fx4;
assign  add_x_bit_sp_fx4 = align_x_bit_sp_fx4 | convert_x_bit_sp_fx4;

// ------------------------------------
// fpint inexact result calculation
// - inexact = G | (R | X)
// - set inexact for fpint "small source" detection
//   If DP exp is < 11'h3ff, or SP exp is < 8'h7f
//   then fpint result must be forced to zero and
//   inexact set
// ------------------------------------

assign  fpint_nxc_i_fx4 =
  ~maxint_result_fx4         &  // ~invalid (nan,inf,large)
  (dtype_fx4[2:0] == 3'b011) &
  (itype_fx4[2:0] == 3'b010) &  // FsTOi, FdTOi
  fic_ftoi_nx_fx4            ;

assign  fpint_nxc_x_fx4 =
  ~maxint_result_fx4         &  // ~invalid (nan,inf,large)
  (dtype_fx4[2:0] == 3'b100) &
  (itype_fx4[2:0] == 3'b010) &  // FsTOx, FdTOx
  fic_ftox_nx_fx4            ;

assign  fpint_nxc_fx4 =
  fpint_nxc_i_fx4 |
  fpint_nxc_x_fx4 |
  fpint_zero_fx4;               // fpint "small source"

// ------------------------------------
// Detect all cases where intermediate denorm rounds to norm
// ------------------------------------

assign  fdtos_den2nor_fx4 =
  fdtos_unf_predict_fx4 &
                                           // post-denorm LSB is included in bof22msb
   ((rm_near_sp_fx4     & (bof22msb_fx4 &   fpf_ma_sum_fx4[40]                             )) |
    (rm_directed_sp_fx4 & (bof22msb_fx4 & (|fpf_ma_sum_fx4[40:39] | fic_convert_sticky_fx4)))  );

assign  fdiv_fdtos_den2nor_sp_fx4 = fdiv_den2nor_sp_fx4 | fdtos_den2nor_fx4;

assign  w1_vld_fx4[1:0] =
  i_w1_vld_fx4[1:0] &
  ({2{~(itype_fx4[2:1] == 2'b11) |        // ~div/sqrt
       ((itype_fx4[2:1] == 2'b11) &
         div_default_res_fx4      &
         ~dec_flush_fx4           &
         ~tlu_flush_fgu_fx4        )}});  //  div/sqrt and default result

assign  fsr_w1_vld_fx4[0] =
  i_fsr_w1_vld_fx4[0] &
  (   ~(itype_fx4[2:1] == 2'b11) |        // ~div/sqrt
       ((itype_fx4[2:1] == 2'b11) &
         div_default_res_fx4      &
         ~dec_flush_fx4           &
         ~tlu_flush_fgu_fx4        )  );  //  div/sqrt and default result

assign  fsr_w1_vld_fx4[1] =
  i_fsr_w1_vld_fx4[1] &
  ~(fsr_store_fx4 & stfsr_exception_fx4);  // ensure stfsr completes without error


// ----------------------------------------------------------------------------
//                               FX5 stage
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_8 fx5_00  (
  .scan_in(fx5_00_scanin),
  .scan_out(fx5_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_vld_fx4[1:0], fcc_fx4[1:0],     fcc_vld_fx4[3:0]}),
  .dout({w1_vld_fx5[1:0], fcc_fx5[1:0], fpc_fcc_vld_fx5[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_8 fx5_01  (
  .scan_in(fx5_01_scanin),
  .scan_out(fx5_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({itype_fx4[2:0], dtype_fx4[2:0], rd_mode_fx4[1:0]}),
  .dout({itype_fx5[2:0], dtype_fx5[2:0], rd_mode_fx5[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_36 fx5_02  (
  .scan_in(fx5_02_scanin),
  .scan_out(fx5_02_scanout),
  .l1clk(l1clk_pm1),
  .din ({    int_sel_fx4[3:0],
             vis_cmp_result_fx4[3:0],
         fpc_int_res_sel_fx4[2],
         fpc_ma_fmt_sel_fx4[0],
         idiv0_trap_fx4,
         mulscc_iccn_fx4,
         fic_mulscc_iccz_fx4,
         mulscc_iccv_fx4,
         mulscc_iccc_fx4,
         fic_mulscc_xccz_fx4,
         fdc_xicc_z_early[1:0],
         fdc_icc_v_early,
         exp_sel_mul_fx4,
         sign_inter_fx4,
         sign_zero_fx4,
         fpf_ma_sum_fx4[10],
         fsr_w1_vld_fx4[1:0],
         fac_fgx_instr_fx4,
         w1_odd32b_fx4,
         fpf_ma_cout_fx4,
         fadd_logical_sub_fx4,
         fsr_store_fx4,
         fmul_den2nor_m2_predict_fx4,
         fdiv_fdtos_den2nor_sp_fx4,
         fdiv_den2nor_dp_fx4,
         aboe_fx4,
         fpint_nxc_fx4,
         fac_rng_wr_gsr_3f}),
  .dout({fpc_int_sel_fx5[3:0],
         fpc_vis_cmp_result_fx5[3:0],
             int_res_sel_fx5_b2,
             ma_fmt_sel_fx5_b0,
         idiv0_trap_fx5,
         mulscc_iccn_fx5,
         mulscc_iccz_fx5,
         mulscc_iccv_fx5,
         mulscc_iccc_fx5,
         mulscc_xccz_fx5,
         idiv_xccz_fx5, idiv_iccz_fx5,
         idiv_iccv_fx5,
         fpc_exp_sel_mul_fx5,
         sign_inter_fx5,
         sign_zero_fx5,
             ma_sum_fx5_b10,
         fpc_fsr_w1_vld_fx5[1:0],
             fgx_instr_fx5,
         w1_odd32b_fx5,
             ma_cout_fx5,
         fadd_logical_sub_fx5,
         fsr_store_fx5,
         fmul_den2nor_m2_predict_fx5,
         fdiv_fdtos_den2nor_sp_fx5,
         fdiv_den2nor_dp_fx5,
         aboe_fx5,
         fpint_nxc_fx5,
         rng_wr_gsr_4f}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_5 fx5_04  (
  .scan_in(fx5_04_scanin),
  .scan_out(fx5_04_scanout),
  .l1clk(l1clk_pm1),
  .din (fsr_tem_fx4[4:0]),
  .dout(fsr_tem_fx5[4:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_4 fx5_05  (
  .scan_in(fx5_05_scanin),
  .scan_out(fx5_05_scanout),
  .l1clk(l1clk_pm1),
  .din ({rm_near_dp_fx4, rm_near_sp_fx4, rm_directed_dp_fx4, rm_directed_sp_fx4}),
  .dout({rm_near_dp_fx5, rm_near_sp_fx5, rm_directed_dp_fx5, rm_directed_sp_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_6 fx5_06  (
  .scan_in(fx5_06_scanin),
  .scan_out(fx5_06_scanout),
  .l1clk(l1clk_pm1),
  .din ({add_g_bit_sp_fx4,
         add_g_bit_dp_fx4,
         add_lsb_bit_sp_fx4,
         add_lsb_bit_dp_fx4,
         add_x_bit_sp_fx4,
         add_x_bit_dp_fx4}),
  .dout({add_g_bit_sp_fx5,
         add_g_bit_dp_fx5,
         add_lsb_bit_sp_fx5,
         add_lsb_bit_dp_fx5,
         add_x_bit_sp_fx5,
         add_x_bit_dp_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_4 fx5_07  (
  .scan_in(fx5_07_scanin),
  .scan_out(fx5_07_scanout),
  .l1clk(l1clk_pm1),
  .din ({inf_src_result_fx4,
         zero_src_result_fx4,
         nan_default_result_fx4,
         maxint_result_fx4}),
  .dout({inf_src_result_fx5,
         zero_src_result_fx5,
         nan_default_result_fx5,
         maxint_result_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_15 fx5_08  (
  .scan_in(fx5_08_scanin),
  .scan_out(fx5_08_scanout),
  .l1clk(l1clk_pm1),
  .din ({fadd_ovf_predict_fx4,
         fdtos_ovf_predict_fx4,
         fdtos_ovf_detect_fx4,
         fmul_ovf_predict_fx4,
         fmul_ovf_detect_fx4,
         fdiv_ovf_detect_fx4,
         fdtos_unf_predict_fx4,
         fdtos_unf_detect_fx4,
         fmul_unf_predict_fx4,
         fmul_unf_detect_fx4,
         fdiv_unf_detect_fx4,
         fdtos_guf_detect_fx4,
         fmul_guf_detect_fx4,
         fdiv_guf_detect_fx4,
         unfin_src_fx4}),
  .dout({fadd_ovf_predict_fx5,
         fdtos_ovf_predict_fx5,
         fdtos_ovf_detect_fx5,
         fmul_ovf_predict_fx5,
         fmul_ovf_detect_fx5,
         fdiv_ovf_detect_fx5,
         fdtos_unf_predict_fx5,
         fdtos_unf_detect_fx5,
         fmul_unf_predict_fx5,
         fmul_unf_detect_fx5,
         fdiv_unf_detect_fx5,
         fdtos_guf_detect_fx5,
         fmul_guf_detect_fx5,
         fdiv_guf_detect_fx5,
         unfin_src_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_8 fx5_09  (
  .scan_in(fx5_09_scanin),
  .scan_out(fx5_09_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpx_unfin_vld_fx4,
         ns_mode_fx4,
         fpx_of_vld_fx4,
         fpx_uf_vld_fx4,
         fpx_nx_vld_fx4,
         ecc_trap_fx4,
         fpx_dzc_fx4,
         fpx_nvc_fx4}),
  .dout({fpx_unfin_vld_fx5,
         ns_mode_fx5,
         fpx_of_vld_fx5,
         fpx_uf_vld_fx5,
         fpx_nx_vld_fx5,
         ecc_trap_fx5,
         fpx_dzc_fx5,
         fpx_nvc_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fpc_stfsr_en_fx3to5 =
  fsr_store_fx3 | i_fsr_w1_vld_fx4[1] | fpc_fsr_w1_vld_fx5[1];

// ------------------------------------
// Determine if zero result
// - exponent related detection won't apply to fmul/fdiv/fsqrt
//   because eadj is forced to zero
// ------------------------------------

assign  dp_zero_mant_fx5 =
    ( dtype_fx5[2:0]         == 3'b001) &     // DP
    ( fic_norm_eadj_fx5[5:4] == 2'b11 ) &
    ( fic_norm_eadj_fx5[2]            ) &
    ( fic_norm_eadj_fx5[0]            ) &     // massive norm shift, mant bits C,63:11 are 0
    (~ma_sum_fx5_b10                  ) &     // mantissa bit 10 is zero (G)
    (~nan_default_result_fx5          ) &     // avoid improper inf-inf=0
    (~inf_src_result_fx5              ) ;     // avoid improper max-inf=0

assign  sp_zero_mant_fx5 =
    ( dtype_fx5[2:0]         == 3'b000) &     // SP
    ( fic_norm_eadj_fx5[5:0] >  6'd24 ) &     // massive norm shift, mant bits C,63:40,G are 0
    (~nan_default_result_fx5          ) &     // avoid improper inf-inf=0
    (~inf_src_result_fx5              ) ;     // avoid improper max-inf=0

assign  zero_mant_fx5 =
  zero_src_result_fx5 | dp_zero_mant_fx5 | sp_zero_mant_fx5;

// ------------------------------------
// floating point result sign
// ------------------------------------

assign  fpc_sign_fx5 =
  (~zero_mant_fx5 & sign_inter_fx5) |
  ( zero_mant_fx5 & sign_zero_fx5 ) ;

// ------------------------------------
// Exponent overflow prediction & detection
// - does not include Rcout qualification
// ------------------------------------

assign  ovf_detect_inf_fx5 =
  ((fadd_ovf_predict_fx5 & ma_cout_fx5           ) |
   (fmul_ovf_predict_fx5 & fgu_mul_result_fx5[63]) |
   fdtos_ovf_detect_fx5 | fmul_ovf_detect_fx5 | fdiv_ovf_detect_fx5) &
  (  (rd_mode_fx5[1:0] == 2'b00)                    |    // nearest
    ((rd_mode_fx5[1:0] == 2'b10) & ~sign_inter_fx5) |    // +inf
    ((rd_mode_fx5[1:0] == 2'b11) &  sign_inter_fx5)  );  // -inf

assign  ovf_predict_inf_fx5 =
  (fadd_ovf_predict_fx5 | fdtos_ovf_predict_fx5 | fmul_ovf_predict_fx5) &
  (  (rd_mode_fx5[1:0] == 2'b00)                    |    // nearest
    ((rd_mode_fx5[1:0] == 2'b10) & ~sign_inter_fx5) |    // +inf
    ((rd_mode_fx5[1:0] == 2'b11) &  sign_inter_fx5)  );  // -inf

assign  ovf_detect_max_fx5 =
  ((fadd_ovf_predict_fx5 & ma_cout_fx5       ) |
   (fmul_ovf_predict_fx5 & fgu_mul_result_fx5[63]) |
   fdtos_ovf_detect_fx5 | fmul_ovf_detect_fx5 | fdiv_ovf_detect_fx5) &
  (  (rd_mode_fx5[1:0] == 2'b01)                    |    // trunc
    ((rd_mode_fx5[1:0] == 2'b10) &  sign_inter_fx5) |    // +inf
    ((rd_mode_fx5[1:0] == 2'b11) & ~sign_inter_fx5)  );  // -inf

assign  ovf_predict_max_fx5 =
  (fadd_ovf_predict_fx5 | fdtos_ovf_predict_fx5 | fmul_ovf_predict_fx5) &
  (  (rd_mode_fx5[1:0] == 2'b01)                    |    // trunc
    ((rd_mode_fx5[1:0] == 2'b10) &  sign_inter_fx5) |    // +inf
    ((rd_mode_fx5[1:0] == 2'b11) & ~sign_inter_fx5)  );  // -inf

assign  unf_detect_fx5 =
  fdtos_unf_detect_fx5  |
  fmul_unf_detect_fx5   | fdiv_unf_detect_fx5  |
  fdtos_guf_detect_fx5  | fmul_guf_detect_fx5  |
  fdiv_guf_detect_fx5;

assign  unf_predict_fx5 =
  fdtos_unf_predict_fx5 |
  (fmul_unf_predict_fx5        & ~fgu_mul_result_fx5[63]) |  // FMUL Eint=Emin-1
  (fmul_den2nor_m2_predict_fx5                          ) ;  // FMUL Eint=Emin-2

assign  unfin_early_fx5 =

  unfin_src_fx5 |

  (fmul_unf_predict_fx5        & ~fgu_mul_result_fx5[63] & ~fpc_rinc_sel_fx5    ) |  // fmul
  (fmul_unf_detect_fx5         & ~fmul_guf_detect_fx5                                // fmul
                               & ~fmul_den2nor_m2_predict_fx5                   ) |
  (fmul_den2nor_m2_predict_fx5                           & ~fpc_rinc_sel_fx5    ) |  // fmul

  ((fdtos_unf_predict_fx5 | fdtos_unf_detect_fx5) &                               // fdtos
   ~fdtos_guf_detect_fx5 &
   ~fdiv_fdtos_den2nor_sp_fx5                                                ) |

  (fdiv_unf_detect_fx5   &                                                        // fdiv
   ~fdiv_guf_detect_fx5  &
   ~fdiv_fdtos_den2nor_sp_fx5 &
   ~fdiv_den2nor_dp_fx5                                                      ) |

  (~(dp_zero_mant_fx5 | sp_zero_mant_fx5) &
   ((~fpe_einty_adj_cout_fx5 &                     fadd_logical_sub_fx5  ) |      // fadd/fsub eadj unf
    ( fpe_einty_eq_eadj_fx5  & ~fpc_rinc_sel_fx5 & fadd_logical_sub_fx5  )  )) ;  // fadd/fsub eadj unf

assign  fpd_unfin_fx5 =  // if (Eint=Emin & 0.1X intermediate result & 1.XX rounded result & fdiv) then override fpd_unfin
  div_eint_fx4[12]       &                           // unf_predict   (Eint=Emin)
  fdc_dec_exp_early      &                           // decrement exp (0.1X intermediate result)
  ~fdd_pte_cla_early_b63 &                           //              ~(1.XX rounded      result)
  (fdc_finish_fltd_early | fdc_finish_flts_early) &  // FDIV  finished
  ~div_eint_fx4[15]      ;                           // ~ns_mode

// ------------------------------------
// Detect if denorm fdiv intermediate
// result rounds to norm
// ------------------------------------

assign  fdiv_den2nor_m0_fx5 =
  div_eint_fx4[12]       &                           // unf_predict   (Eint=Emin)
  fdc_dec_exp_early      &                           // decrement exp (0.1X intermediate result)
  fdd_pte_cla_early_b63  &                           //               (1.XX rounded      result)
  (fdc_finish_fltd_early | fdc_finish_flts_early);   // FDIV  finished

// ------------------------------------
// floating point exception fields {cexc}
// ------------------------------------

assign  i_fpx_ofc_fx5 = ovf_detect_inf_fx5 | ovf_detect_max_fx5;

assign  i_fpx_ufc_fx5 =
   unf_detect_fx5  |
   unf_predict_fx5 |                                      // ufc is detected before round
   (~(dp_zero_mant_fx5 | sp_zero_mant_fx5) &
    (eadj_unf_if_norcout_fx5 |                            // fadd/fsub eadj unf detected before round
     (~fpe_einty_adj_cout_fx5 & fadd_logical_sub_fx5)));  // fadd/fsub eadj unf

// ------------------------------------
// Integer/Float_Constant mux selects
// ------------------------------------

assign  fpc_fconst_sel_fx5[0] =				// SP inf
  (inf_src_result_fx5 |
   ovf_detect_inf_fx5 |
   ovf_predict_inf_fx5 ) & (dtype_fx5[2:0] == 3'b000);

assign  fpc_fconst_sel_fx5[1] =                         // DP inf
  (inf_src_result_fx5 |
   ovf_detect_inf_fx5 |
   ovf_predict_inf_fx5 ) & (dtype_fx5[2:0] == 3'b001);

assign  fpc_fconst_sel_fx5[2] =                         // SP max
  (ovf_detect_max_fx5 |
   ovf_predict_max_fx5 ) & (dtype_fx5[2:0] == 3'b000);

assign  fpc_fconst_sel_fx5[3] =                         // DP max
  (ovf_detect_max_fx5 |
   ovf_predict_max_fx5 ) & (dtype_fx5[2:0] == 3'b001);

assign  fpc_fconst_sel_fx5[4] =                         // SP/DP zero
  zero_mant_fx5 | unf_detect_fx5 | unf_predict_fx5 |
  (fadd_logical_sub_fx5 & ~fpc_int_sel_fx5[2]);  // choose zero fconst in case
                                                 // of eadj unf, unless default NaN

// ------------------------------------
// Final result mux selects
// ------------------------------------

assign  fpc_result_sel_fx5[0] = fgx_instr_fx5 & w1_odd32b_fx5;
assign  fpc_result_sel_fx5[1] = fgx_instr_fx5;

// Note: fpc_result_sel_fx5[2] must still be conditioned during fb stage as follows:
//       i_result_sel_fb[2] | (rcout_fb & ovf_if_rcout_fb & w1_odd32b_fb);
assign  fpc_result_sel_fx5[2] =
  ((dtype_fx5[2:1] == 2'b01 ) & w1_odd32b_fx5) |         // odd 32b int/const (non-float) result
  ( inf_src_result_fx5        & w1_odd32b_fx5) |         // odd SP inf  result
  ( nan_default_result_fx5    & w1_odd32b_fx5) |         // odd SP nan  result
  ( zero_mant_fx5             & w1_odd32b_fx5) |         // odd SP zero result
  ( maxint_result_fx5         & w1_odd32b_fx5) |         // odd maxint  result
  ( ovf_detect_inf_fx5        & w1_odd32b_fx5) |         // odd SP inf  result
  ( ovf_detect_max_fx5        & w1_odd32b_fx5) |         // odd SP max  result
  ( unf_detect_fx5            & w1_odd32b_fx5) |         // odd SP zero result
  ( unf_predict_fx5           & w1_odd32b_fx5) |         // odd SP min  result (or unfin/dont_care)
  ( eadj_unf_if_norcout_fx5   & w1_odd32b_fx5) |         // odd SP min  result (or unfin/dont_care)
  (~fpe_einty_adj_cout_fx5 &
    fadd_logical_sub_fx5      & w1_odd32b_fx5) |         // odd SP zero result (eadj unf)
  ( fpe_einty_eq_eadj_fx5  &
   ~fpc_rinc_sel_fx5       &
    fadd_logical_sub_fx5      & w1_odd32b_fx5) ;         // odd SP zero result (eadj unf)

assign  fpc_result_sel_fx5[3] =
   (dtype_fx5[2:0] == 3'b000) & w1_odd32b_fx5;           // odd SP result

// Note: fpc_result_sel_fx5[4] must still be conditioned during fb stage as follows:
//       i_result_sel_fb[4] | (rcout_fb & ovf_if_rcout_fb);
assign  fpc_result_sel_fx5[4] =
  ((dtype_fx5[2:1] == 2'b01) |
   (dtype_fx5[2:1] == 2'b10)                 ) |         // 32b or 64b int/const (non-float) result
  ( inf_src_result_fx5                       ) |         // SP/DP  inf  result
  ( nan_default_result_fx5                   ) |         // SP/DP  nan  result
  ( zero_mant_fx5                            ) |         // SP/DP  zero result
  ( maxint_result_fx5                        ) |         // maxint      result
  ( ovf_detect_inf_fx5                       ) |         // SP/DP  inf  result
  ( ovf_detect_max_fx5                       ) |         // SP/DP  max  result
  ( unf_detect_fx5                           ) |         // SP/DP  zero result
  ( unf_predict_fx5                          ) |         // SP/DP  min  result (or unfin/dont_care)
  ( eadj_unf_if_norcout_fx5                  ) |         // SP/DP  min  result (or unfin/dont_care)
  (~fpe_einty_adj_cout_fx5 &
    fadd_logical_sub_fx5                     ) |         // SP/DP  zero result (eadj unf)
  ( fpe_einty_eq_eadj_fx5  &
   ~fpc_rinc_sel_fx5       &
    fadd_logical_sub_fx5                     ) ;         // SP/DP  zero result (eadj unf)

assign  fpc_result_sel_fx5[5] = (dtype_fx5[2:0] == 3'b001);  // DP

// ------------------------------------
// Mul pipe Rinc calculation
// - FMUL(s,d), FsMULd
// - Determine if LSB should be inc due to round
//
// Rounding equations:
//
// Rinc = 
//   (near &  G    & (LSB | X)) |
//   (+inf & ~sign & (G   | X)) |
//   (-inf &  sign & (G   | X)) ;
//
// directed = 
//   (+inf & ~sign) |
//   (-inf &  sign) ;
//
// Rinc =  // nand3-nand4 delay
//   (near     & G & LSB) |
//   (near     & G & X  ) |
//   (directed & G      ) |
//   (directed     & X  ) ;
//
// ------------------------------------

assign  mul_fmt_1xx_fx5 = 
   (fgu_mul_result_fx5[63] |    // 1X.XX
    fmul_unf_predict_fx5) &     // 01.XX, Eint=Emin-1, denorm inter. result may rnd to norm
   (itype_fx5[2:0] == 3'b101);  // mul

assign  mul_fmt_01x_fx5 =       // 01.XX
  ~fgu_mul_result_fx5[63] &
  ~fmul_unf_predict_fx5   &
   (itype_fx5[2:0] == 3'b101);  // mul

assign  mul_fmt_m2_fx5 =        // 11.XX, Eint=Emin-2, denorm inter. result may rnd to norm
   fmul_den2nor_m2_predict_fx5;

assign  mul_lsb_bit_dp_fx5 =
  (mul_fmt_m2_fx5  &   fgu_mul_result_fx5[12]   ) |  //          Eint=Emin-2
  (mul_fmt_1xx_fx5 &   fgu_mul_result_fx5[11]   ) |  // 1X.XX or Eint=Emin-1
  (mul_fmt_01x_fx5 &   fgu_mul_result_fx5[10]   ) ;  // 01.XX

assign  mul_g_bit_dp_fx5 =
  (mul_fmt_m2_fx5  &   fgu_mul_result_fx5[11]   ) |  //          Eint=Emin-2
  (mul_fmt_1xx_fx5 &   fgu_mul_result_fx5[10]   ) |  // 1X.XX or Eint=Emin-1
  (mul_fmt_01x_fx5 &   fgu_mul_result_fx5[9]   ) ;  // 01.XX

assign  mul_x_bit_dp_fx5 =
  (mul_fmt_m2_fx5  & ( fgu_mul_result_fx5[10] |      //          Eint=Emin-2
                       fgu_mul_result_fx5[9] |
                       fpy_sticky_dp_fx5   )) |
  (mul_fmt_1xx_fx5 & ( fgu_mul_result_fx5[9] |      // 1X.XX or Eint=Emin-1
                       fpy_sticky_dp_fx5   )) |
  (mul_fmt_01x_fx5 & ( fpy_sticky_dp_fx5   )) ;      // 01.XX

assign  mul_lsb_bit_sp_fx5 =
  (mul_fmt_m2_fx5  &   fgu_mul_result_fx5[41]   ) |  //          Eint=Emin-2
  (mul_fmt_1xx_fx5 &   fgu_mul_result_fx5[40]   ) |  // 1X.XX or Eint=Emin-1
  (mul_fmt_01x_fx5 &   fgu_mul_result_fx5[39]   ) ;  // 01.XX

assign  mul_g_bit_sp_fx5 =
  (mul_fmt_m2_fx5  &   fgu_mul_result_fx5[40]   ) |  //          Eint=Emin-2
  (mul_fmt_1xx_fx5 &   fgu_mul_result_fx5[39]   ) |  // 1X.XX or Eint=Emin-1
  (mul_fmt_01x_fx5 &   fgu_mul_result_fx5[38]   ) ;  // 01.XX

assign  mul_x_bit_sp_fx5 =
  (mul_fmt_m2_fx5  & ( fgu_mul_result_fx5[39] |      //          Eint=Emin-2
                       fgu_mul_result_fx5[38] |
                       fpy_sticky_sp_fx5   )) |
  (mul_fmt_1xx_fx5 & ( fgu_mul_result_fx5[38] |      // 1X.XX or Eint=Emin-1
                       fpy_sticky_sp_fx5   )) |
  (mul_fmt_01x_fx5 & ( fpy_sticky_sp_fx5   )) ;      // 01.XX

assign  mul_rinc_dp_fx5 =
  (rm_near_dp_fx5     & mul_g_bit_dp_fx5 & mul_lsb_bit_dp_fx5) |
  (rm_near_dp_fx5     & mul_g_bit_dp_fx5 &   mul_x_bit_dp_fx5) |
  (rm_directed_dp_fx5 & mul_g_bit_dp_fx5                     ) |
  (rm_directed_dp_fx5                    &   mul_x_bit_dp_fx5) ;

assign  mul_rinc_sp_fx5 =
  (rm_near_sp_fx5     & mul_g_bit_sp_fx5 & mul_lsb_bit_sp_fx5) |
  (rm_near_sp_fx5     & mul_g_bit_sp_fx5 &   mul_x_bit_sp_fx5) |
  (rm_directed_sp_fx5 & mul_g_bit_sp_fx5                     ) |
  (rm_directed_sp_fx5                    &   mul_x_bit_sp_fx5) ;

assign  mul_rinc_sel_fx5   = mul_rinc_dp_fx5  | mul_rinc_sp_fx5;

// ------------------------------------
// Add pipe Rinc calculation
// - FADD(s,d), FSUB(s,d), FiTOs, FxTO(s,d), FdTOs
// - Determine if LSB should be inc due to round
//
// Rounding equations:
//
// Rinc = 
//   (near &  G    & (LSB | X)) |
//   (+inf & ~sign & (G   | X)) |
//   (-inf &  sign & (G   | X)) ;
//
// directed = 
//   (+inf & ~sign) |
//   (-inf &  sign) ;
//
// Rinc =  // nand3-nand4 delay
//   (near     & G & LSB) |
//   (near     & G & X  ) |
//   (directed & G      ) |
//   (directed     & X  ) ;
//
// ------------------------------------

assign  add_rinc_dp_fx5 =
  (rm_near_dp_fx5     & add_g_bit_dp_fx5 & add_lsb_bit_dp_fx5) |
  (rm_near_dp_fx5     & add_g_bit_dp_fx5 &   add_x_bit_dp_fx5) |
  (rm_directed_dp_fx5 & add_g_bit_dp_fx5                     ) |
  (rm_directed_dp_fx5                    &   add_x_bit_dp_fx5) ;

assign  add_rinc_sp_fx5 =
  (rm_near_sp_fx5     & add_g_bit_sp_fx5 & add_lsb_bit_sp_fx5) |
  (rm_near_sp_fx5     & add_g_bit_sp_fx5 &   add_x_bit_sp_fx5) |
  (rm_directed_sp_fx5 & add_g_bit_sp_fx5                     ) |
  (rm_directed_sp_fx5                    &   add_x_bit_sp_fx5) ;

assign  add_rinc_sel_fx5 = add_rinc_dp_fx5 | add_rinc_sp_fx5;

assign  fpc_rinc_sel_fx5 = add_rinc_sel_fx5 | mul_rinc_sel_fx5;

assign  fpc_q_rinc_sel_fx5 =
  mul_rinc_sel_fx5 |
  (add_rinc_sel_fx5 & ~ma_fmt_sel_fx5_b0);  // ~logical_sub 00.1X

assign  ovf_if_rcout_fx5 =
  fpc_rinc_sel_fx5 &
  (fadd_ovf_predict_fx5  |
   fdtos_ovf_predict_fx5 |
   fmul_ovf_predict_fx5   );

assign  fpc_ovf_if_rcout_fx5[1] = ovf_if_rcout_fx5;
assign  fpc_ovf_if_rcout_fx5[0] = ovf_if_rcout_fx5 & w1_odd32b_fx5;

assign  fmul_unf_if_nocorl_fx5 =  // No C or L, where C=Rcout, L=implied_bit
  (fmul_unf_predict_fx5 & ~fgu_mul_result_fx5[63]) | fmul_den2nor_m2_predict_fx5;

assign  fmul_unf_if_nocorl_sp_fx5 =
  fmul_unf_if_nocorl_fx5 & ~dtype_fx5[0] & fpc_rinc_sel_fx5;

assign  fmul_unf_if_nocorl_dp_fx5 =
  fmul_unf_if_nocorl_fx5 &  dtype_fx5[0] & fpc_rinc_sel_fx5;

assign  eadj_unf_if_norcout_fx5 =
  fpe_einty_eq_eadj_fx5 & fadd_logical_sub_fx5;

// ------------------------------------
// Inexact result calculation
// - inexact = G | (R | X)
// - must force inexact to zero if nan, otherwise
//   a propagating nan may signal inexact
// - must force inexact to zero if inf source, otherwise
//   inexact may by improperly signaled
// - unfin_src will set inexact flag if ~unfinished_FPop, independent of ns_mode
// ------------------------------------

assign  i_fpx_nxc_fx5 =

  fpx_nx_vld_fx5 &
  ~(aboe_fx5 & ~(itype_fx5[2:0] == 3'b011)) &  // sources aren't ones exp (inf or nan) if ~intfp

  (((dtype_fx5[2:0] == 3'b000) &  // sp
    (add_g_bit_sp_fx5 | add_x_bit_sp_fx5 | mul_g_bit_sp_fx5 | mul_x_bit_sp_fx5)) |
   ((dtype_fx5[2:0] == 3'b001) &  // dp
    (add_g_bit_dp_fx5 | add_x_bit_dp_fx5 | mul_g_bit_dp_fx5 | mul_x_bit_dp_fx5)) |

   fdtos_guf_detect_fx5 | fmul_guf_detect_fx5 | fdiv_guf_detect_fx5 |
   unfin_src_fx5 |
   fpint_nxc_fx5);

// ------------------------------------
// icc/xcc final result mux
// ------------------------------------

assign  fgu_exu_icc_fx5[3:0] =  // icc cond code {N,Z,V,C}
  ({4{ div_finish_int_fb}}  & {fdd_result[31],          // idiv   icc.n
                               idiv_iccz_fx5,           // idiv   icc.z
                               idiv_iccv_fx5,           // idiv   icc.v
                               1'b0               }) |  // idiv   icc.c
  ({4{~div_finish_int_fb &
       int_res_sel_fx5_b2}} & {mulscc_iccn_fx5,         // mulscc icc.n
                               mulscc_iccz_fx5,         // mulscc icc.z
                               mulscc_iccv_fx5,         // mulscc icc.v
                               mulscc_iccc_fx5    }) |  // mulscc icc.c
  ({4{~div_finish_int_fb &
      ~int_res_sel_fx5_b2}} & {fgu_mul_result_fx5[31],  // imul   icc.n
                               fpy_xicc_z_fx5[0],       // imul   icc.z
                               1'b0,                    // imul   icc.v
                               1'b0               }) ;  // imul   icc.c

assign  fgu_exu_xcc_fx5[1:0] =                          // xcc cond code {N,Z}
  ({2{ div_finish_int_fb}}  & {fdd_result[63],          // idiv   xcc.n
                               idiv_xccz_fx5      }) |  // idiv   xcc.z
  ({2{~div_finish_int_fb &
       int_res_sel_fx5_b2}} & {1'b0,                    // mulscc xcc.n
                               mulscc_xccz_fx5    }) |  // mulscc xcc.z
  ({2{~div_finish_int_fb &
      ~int_res_sel_fx5_b2}} & {fgu_mul_result_fx5[63],  // imul   xcc.n
                               fpy_xicc_z_fx5[1]  }) ;  // imul   xcc.z


// ----------------------------------------------------------------------------
//                               FB stage 
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_16 fb_00  (
  .scan_in(fb_00_scanin),
  .scan_out(fb_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({fcc_fx5[1:0],
         idiv0_trap_fx5,
         ovf_if_rcout_fx5,
         fmul_unf_if_nocorl_sp_fx5,
         fmul_unf_if_nocorl_dp_fx5,
         fmul_unf_if_nocorl_fx5,
         eadj_unf_if_norcout_fx5,
         fpf_implied_bit_fx5,
         fsr_store_fx5,
         fac_dec_valid_noflush_fx5,
         sp_zero_mant_fx5,
         dp_zero_mant_fx5,
         fdc_finish_fltd_early,
         fdc_finish_flts_early,
         fdc_finish_int_early}),
  .dout({fcc_fb[1:0],
         idiv0_trap_fb,
         ovf_if_rcout_fb,
         fmul_unf_if_nocorl_sp_fb,
         fmul_unf_if_nocorl_dp_fb,
         fmul_unf_if_nocorl_fb,
         eadj_unf_if_norcout_fb,
         implied_bit_fb,
         fsr_store_fb,
             dec_valid_noflush_fb,
         sp_zero_mant_fb,
         dp_zero_mant_fb,
         div_finish_fltd_fb,
         div_finish_flts_fb,
         div_finish_int_fb}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_3 fb_01  (
  .scan_in(fb_01_scanin),
  .scan_out(fb_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({  w1_vld_fx5[1:0], fpc_sign_fx5}),
  .dout({i_w1_vld_fb[1:0],  fpc_sign_fb }),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_16 fb_03  (
  .scan_in(fb_03_scanin),
  .scan_out(fb_03_scanout),
  .l1clk(l1clk_pm1),
  .din ({fpx_unfin_vld_fx5,
         ns_mode_fx5,
         unfin_early_fx5,
         fpd_unfin_fx5,
         fpx_of_vld_fx5,
         fpx_uf_vld_fx5,
         ecc_trap_fx5,
         fpx_dzc_fx5,
         fpx_nvc_fx5,
         i_fpx_ofc_fx5,
         i_fpx_ufc_fx5,
         i_fpx_nxc_fx5,
         fdiv_fdtos_den2nor_sp_fx5,
         fdiv_den2nor_dp_fx5,
         fdiv_den2nor_m0_fx5,
         fdc_dec_exp_early}),
  .dout({fpx_unfin_vld_fb,
         ns_mode_fb,
         unfin_early_fb,
         fpc_fpd_unfin_fb,
         fpx_of_vld_fb,
         fpx_uf_vld_fb,
         ecc_trap_fb,
         fpx_dzc_fb,
         fpx_nvc_fb,
         i_fpx_ofc_fb,
         i_fpx_ufc_fb,
         i_fpx_nxc_fb,
         fdiv_fdtos_den2nor_sp_fb,
         fdiv_den2nor_dp_fb,
         fdiv_den2nor_m0_fb,
         div_dec_exp_fb}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_5 fb_04  (
  .scan_in(fb_04_scanin),
  .scan_out(fb_04_scanout),
  .l1clk(l1clk_pm1),
  .din (fsr_tem_fx5[4:0]),
  .dout(fsr_tem_fb[4:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fpc_ctl_msff_ctl_macro__width_13 fb_05  (
  .scan_in(fb_05_scanin),
  .scan_out(fb_05_scanout),
  .l1clk(l1clk_pm1),
  .din ({    fpd_exp_res[10:1],       fpd_exp_res[0],     fpd_const_sel[1:0]}),
  .dout({fpc_fpd_exp_res[10:1], i_fpc_fpd_exp_res_b0, fpc_fpd_const_sel[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fpc_fpd_exp_res[0] = i_fpc_fpd_exp_res_b0 | fdiv_den2nor_m0_fb;

assign  fpc_den2nor_sp_fb =     //     32b min result
  fdiv_fdtos_den2nor_sp_fb |
  ((fpf_rcout_fb | implied_bit_fb) & fmul_unf_if_nocorl_sp_fb);

assign  fpc_den2nor_dp_fb =     // 64b     min result
  fdiv_den2nor_dp_fb       |
  ((fpf_rcout_fb | implied_bit_fb) & fmul_unf_if_nocorl_dp_fb);

// ------------------------------------
// Determine if unfinished_FPop trap
// ------------------------------------

assign  fpc_fpx_unfin_fb =
  ~ecc_trap_fb          &
   dec_valid_noflush_fb &
   fpx_unfin_vld_fb     &
  ~ns_mode_fb           &
  (unfin_early_fb |
   (~fpf_rcout_fb & ~implied_bit_fb & fmul_unf_if_nocorl_fb) |    // fmul
   (~fpf_rcout_fb & eadj_unf_if_norcout_fb &                      // fadd/fsub eadj unf
    ~(dp_zero_mant_fb | sp_zero_mant_fb))                 );

// ------------------------------------
// floating point exception fields {ftt,aexc,cexc}
// - must clear FSR.ofc (FSR.ufc) if overflow (underflow) exception traps
//   and FSR.OFM (FSR.UFM) is not set and FSR.NXM is set
// - must clear FSR.nxc if overflow (underflow) exception does trap
//   because FSR.OFM (FSR.UFM) is set, regardless of whether FSR.NXM is set
// ------------------------------------

assign  fpd_fsr_ofm_fb = div_eint_fx4[18];
assign  fpd_fsr_ufm_fb = div_eint_fx4[17];
assign  fpd_fsr_nxm_fb = div_eint_fx4[16];

assign  fpx_ofc_fb =
  ~(~fsr_tem_fb[3] & fsr_tem_fb[0])   &  // disabled of and enabled nx
  fpx_of_vld_fb &
  (i_fpx_ofc_fb | (fpf_rcout_fb & ovf_if_rcout_fb));

assign  fpx_ufc_fb =
  ~(~fsr_tem_fb[2] & fsr_tem_fb[0])   &  // disabled uf and enabled nx
  fpx_uf_vld_fb &
  ~fpc_fpx_unfin_fb &
  i_fpx_ufc_fb;

assign  fpx_nxc_fb =
  ~((fpx_ofc_fb & fsr_tem_fb[3]) | (fpx_ufc_fb & fsr_tem_fb[2])) &    // enabled of or enabled uf
  ((~fpc_fpx_unfin_fb & i_fpx_nxc_fb)              |    // inexact
   (fpx_of_vld_fb &                                     // of
    (i_fpx_ofc_fb | (fpf_rcout_fb & ovf_if_rcout_fb))) |
   (fpx_uf_vld_fb &                                     // uf
    ~fpc_fpx_unfin_fb &
    i_fpx_ufc_fb)                                   );

assign  fpd_ofc_fb =  // fdiv_ovf_predict => detect
  ~(~fpd_fsr_ofm_fb & fpd_fsr_nxm_fb) &  // disabled of and enabled nx
  ((|div_eint_fx4[14:13] & ~div_dec_exp_fb) & (div_finish_fltd_fb | div_finish_flts_fb));

assign  fpd_ufc_fb =  // fdiv_unf_predict => detect
  ~(~fpd_fsr_ufm_fb & fpd_fsr_nxm_fb) &  // disabled of and enabled nx
  ~fpc_fpd_unfin_fb &
  ((  div_eint_fx4[12]    &  div_dec_exp_fb) & (div_finish_fltd_fb | div_finish_flts_fb));

assign  fpd_nxc_fb =
  ~((fpd_ofc_fb & fpd_fsr_ofm_fb) | (fpd_ufc_fb & fpd_fsr_ufm_fb)) &  // enabled of or enabled uf
  ~fpc_fpd_unfin_fb &
  ((fdc_flt_inexact                          & (div_finish_fltd_fb | div_finish_flts_fb)) |    // inexact
   ((|div_eint_fx4[14:13] & ~div_dec_exp_fb) & (div_finish_fltd_fb | div_finish_flts_fb)) |    // of
   (( div_eint_fx4[12]    &  div_dec_exp_fb) & (div_finish_fltd_fb | div_finish_flts_fb))  );  // uf

assign  fpx_ieee_trap_fb =   // FPX enabled ieee 754 exception detected
  ~ecc_trap_fb         &
  dec_valid_noflush_fb &
  ((    fsr_tem_fb[4] & fpx_nvc_fb) |
   (    fsr_tem_fb[3] & fpx_ofc_fb) |
   (    fsr_tem_fb[2] & fpx_ufc_fb) |
   (    fsr_tem_fb[1] & fpx_dzc_fb) |
   (    fsr_tem_fb[0] & fpx_nxc_fb)  );

assign  fpc_fpd_ieee_trap_fb =   // FPD enabled ieee 754 exception detected
  ((fpd_fsr_ofm_fb    & fpd_ofc_fb) |
   (fpd_fsr_ufm_fb    & fpd_ufc_fb) |
   (fpd_fsr_nxm_fb    & fpd_nxc_fb)  );

// 0in bits_on -max 1 -var {    fpx_ieee_trap_fb, fpc_fpx_unfin_fb}
// 0in bits_on -max 1 -var {fpc_fpd_ieee_trap_fb, fpc_fpd_unfin_fb}

assign  fpx_ftt_fb[1:0] =
  ({2{    fpx_ieee_trap_fb}} & 2'd1) |  // IEEE_754_exception
  ({2{fpc_fpx_unfin_fb    }} & 2'd2) ;  // unfinished_FPop

assign  fpd_ftt_fb[1:0] =
  ({2{fpc_fpd_ieee_trap_fb}} & 2'd1) |  // IEEE_754_exception
  ({2{fpc_fpd_unfin_fb    }} & 2'd2) ;  // unfinished_FPop

assign  fpx_aexc_fb[4:0] =
  {(    ~fsr_tem_fb[4] & fpx_nvc_fb),    // nva
   (    ~fsr_tem_fb[3] & fpx_ofc_fb),    // ofa
   (    ~fsr_tem_fb[2] & fpx_ufc_fb),    // ufa
   (    ~fsr_tem_fb[1] & fpx_dzc_fb),    // dza
   (    ~fsr_tem_fb[0] & fpx_nxc_fb) };  // nxa

assign  fpd_aexc_fb[4:0] =
  {1'b0,                                 // nva
   (~fpd_fsr_ofm_fb    & fpd_ofc_fb),    // ofa
   (~fpd_fsr_ufm_fb    & fpd_ufc_fb),    // ufa
   1'b0,                                 // dza
   (~fpd_fsr_nxm_fb    & fpd_nxc_fb) };  // nxa

assign  fsr_w1_result_fb[11:0] =
  // ST(X)FSR clears ftt, {aexc,cexc} aren't written by ST(X)FSR because those enables are off
  {(fpx_ftt_fb[1:0] & {2{~fsr_store_fb}}),
   fpx_aexc_fb[4:0],
   fpx_nvc_fb,
   fpx_ofc_fb,
   fpx_ufc_fb,
   fpx_dzc_fb,
   fpx_nxc_fb};

assign  fsr_w2_result_fb[11:0] =
  {fpd_ftt_fb[1:0],
   fpd_aexc_fb[4:0],
   1'b0,         // fpd nvc always uses w1 port
   fpd_ofc_fb,
   fpd_ufc_fb,
   1'b0,         // fpd dzc always uses w1 port
   fpd_nxc_fb};

assign  fpc_w1_vld_fb[1:0] =
  {2{~mbist_run_1f     &
     ~fpx_ieee_trap_fb &
     ~fpc_fpx_unfin_fb  }} & i_w1_vld_fb[1:0];

// 0in custom -fire ((|fpc_w1_vld_fb[1:0]) & (fpx_ieee_trap_fb | fpc_fpx_unfin_fb)) -message "FRF written during FP trap"
// 0in custom -fire (($0in_delay((|fpc_fcc_vld_fx5[3:0]),1)) & (fpx_ieee_trap_fb | fpc_fpx_unfin_fb)) -message "FSR.fcc written during FP trap"

assign  fpc_w1_ul_vld_fb   = |fpc_w1_vld_fb[1:0];


// ----------------------------------------------------------------------------
//                               FW stage 
// ----------------------------------------------------------------------------

fgu_fpc_ctl_msff_ctl_macro__width_31 fw_00  (
  .scan_in(fw_00_scanin),
  .scan_out(fw_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({    fpx_ieee_trap_fb,
         fpc_fpd_ieee_trap_fb,
         fpc_fpx_unfin_fb,
         fpc_fpd_unfin_fb,
                 idiv0_trap_fb,
             fcc_fb[1:0],
             fsr_w1_result_fb[11:0],
             fsr_w2_result_fb[11:0]}),
  .dout({fgu_fpx_ieee_trap_fw,
         fgu_fpd_ieee_trap_fw,
         fgu_fpx_unfin_fw,
         fgu_fpd_unfin_fw,
         fgu_fpd_idiv0_trap_fw,
         fpc_fcc_fw[1:0],
         fpc_fsr_w1_result_fw[11:0],
         fpc_fsr_w2_result_fw[11:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );


supply0 vss;
supply1 vdd;
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign e_00_scanin               = spares_scanout           ;
assign fx1_00_scanin             = e_00_scanout             ;
assign fx1_01_scanin             = fx1_00_scanout           ;
assign fx2_00_scanin             = fx1_01_scanout           ;
assign fx2_01_scanin             = fx2_00_scanout           ;
assign fx2_02_scanin             = fx2_01_scanout           ;
assign fx2_03_scanin             = fx2_02_scanout           ;
assign fx2_04_scanin             = fx2_03_scanout           ;
assign fx2_05_scanin             = fx2_04_scanout           ;
assign fx2_06_scanin             = fx2_05_scanout           ;
assign fx2_07_scanin             = fx2_06_scanout           ;
assign fx2_08_scanin             = fx2_07_scanout           ;
assign fx3_00_scanin             = fx2_08_scanout           ;
assign fx3_01_scanin             = fx3_00_scanout           ;
assign fx3_02_scanin             = fx3_01_scanout           ;
assign fx3_03_scanin             = fx3_02_scanout           ;
assign fx3_04_scanin             = fx3_03_scanout           ;
assign fx3_05_scanin             = fx3_04_scanout           ;
assign fx3_06_scanin             = fx3_05_scanout           ;
assign fx3_07_scanin             = fx3_06_scanout           ;
assign fx3_08_scanin             = fx3_07_scanout           ;
assign fx3_09_scanin             = fx3_08_scanout           ;
assign fx3_10_scanin             = fx3_09_scanout           ;
assign fx4_00_scanin             = fx3_10_scanout           ;
assign fx4_01_scanin             = fx4_00_scanout           ;
assign fx4_02_scanin             = fx4_01_scanout           ;
assign fx4_03_scanin             = fx4_02_scanout           ;
assign fx4_04_scanin             = fx4_03_scanout           ;
assign fx4_05_scanin             = fx4_04_scanout           ;
assign fx4_06_scanin             = fx4_05_scanout           ;
assign fx4_08_scanin             = fx4_06_scanout           ;
assign fx4_09_scanin             = fx4_08_scanout           ;
assign fx4_10_scanin             = fx4_09_scanout           ;
assign fx4_11_scanin             = fx4_10_scanout           ;
assign fx5_00_scanin             = fx4_11_scanout           ;
assign fx5_01_scanin             = fx5_00_scanout           ;
assign fx5_02_scanin             = fx5_01_scanout           ;
assign fx5_04_scanin             = fx5_02_scanout           ;
assign fx5_05_scanin             = fx5_04_scanout           ;
assign fx5_06_scanin             = fx5_05_scanout           ;
assign fx5_07_scanin             = fx5_06_scanout           ;
assign fx5_08_scanin             = fx5_07_scanout           ;
assign fx5_09_scanin             = fx5_08_scanout           ;
assign fb_00_scanin              = fx5_09_scanout           ;
assign fb_01_scanin              = fb_00_scanout            ;
assign fb_03_scanin              = fb_01_scanout            ;
assign fb_04_scanin              = fb_03_scanout            ;
assign fb_05_scanin              = fb_04_scanout            ;
assign fw_00_scanin              = fb_05_scanout            ;
assign scan_out                  = fw_00_scanout            ;

assign fx4_07_wmr_scanin         = wmr_scan_in              ;
assign wmr_scan_out              = fx4_07_wmr_scanout       ;
// fixscan end:
endmodule  // fgu_fpc_ctl






// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_l1clkhdr_ctl_macro (
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


module fgu_fpc_ctl_spare_ctl_macro__num_9 (
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






// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_3 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_2 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_8 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_51 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [50:0] fdin;
wire [49:0] so;

  input [50:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [50:0] dout;
  output scan_out;
assign fdin[50:0] = din[50:0];






dff #(51)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[50:0]),
.si({scan_in,so[49:0]}),
.so({so[49:0],scan_out}),
.q(dout[50:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_14 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_17 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_4 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_6 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_7 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_20 (
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













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_15 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_13 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_5 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_10 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_28 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [27:0] fdin;
wire [26:0] so;

  input [27:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [27:0] dout;
  output scan_out;
assign fdin[27:0] = din[27:0];






dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_18 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_16 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_37 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [36:0] fdin;
wire [35:0] so;

  input [36:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [36:0] dout;
  output scan_out;
assign fdin[36:0] = din[36:0];






dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_38 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [37:0] fdin;
wire [36:0] so;

  input [37:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [37:0] dout;
  output scan_out;
assign fdin[37:0] = din[37:0];






dff #(38)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[37:0]),
.si({scan_in,so[36:0]}),
.so({so[36:0],scan_out}),
.q(dout[37:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_88 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [87:0] fdin;
wire [86:0] so;

  input [87:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [87:0] dout;
  output scan_out;
assign fdin[87:0] = din[87:0];






dff #(88)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[87:0]),
.si({scan_in,so[86:0]}),
.so({so[86:0],scan_out}),
.q(dout[87:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_11 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_1 (
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

module fgu_fpc_ctl_msff_ctl_macro__width_19 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [18:0] fdin;
wire [17:0] so;

  input [18:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [18:0] dout;
  output scan_out;
assign fdin[18:0] = din[18:0];






dff #(19)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[18:0]),
.si({scan_in,so[17:0]}),
.so({so[17:0],scan_out}),
.q(dout[18:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_36 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = din[35:0];






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fpc_ctl_msff_ctl_macro__width_31 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [30:0] fdin;
wire [29:0] so;

  input [30:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [30:0] dout;
  output scan_out;
assign fdin[30:0] = din[30:0];






dff #(31)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[30:0]),
.si({scan_in,so[29:0]}),
.so({so[29:0],scan_out}),
.q(dout[30:0])
);












endmodule








