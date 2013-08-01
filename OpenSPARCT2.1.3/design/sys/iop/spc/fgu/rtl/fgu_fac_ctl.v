// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu_fac_ctl.v
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
module fgu_fac_ctl (
  dec_frf_r1_addr_d, 
  dec_frf_r1_vld_d, 
  dec_frf_r2_vld_d, 
  dec_frf_r1_32b_d, 
  dec_frf_r2_32b_d, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  dec_frf_w_vld_d, 
  dec_frf_w_addr_d, 
  dec_frf_w_32b_d, 
  dec_frf_w_odd32b_d, 
  dec_fgu_valid_e, 
  dec_exu_src_vld_d, 
  dec_irf_w_addr_d, 
  dec_spu_grant_d, 
  dec_frf_store_d, 
  dec_fsr_store_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  dec_fgu_op3_d, 
  dec_fgu_opf_d, 
  dec_fgu_decode_d, 
  dec_fgu_tid_d, 
  fgu_cmp_fcc_tid_fx2, 
  fgu_fld_fcc_vld_fx3, 
  fgu_fprs_fef, 
  fgu_divide_completion, 
  tlu_flush_fgu_b, 
  tlu_ceter_pscce, 
  tlu_cerer_frf, 
  spc_core_running_status, 
  fgu_fpx_trap_tid_fw, 
  fgu_fpd_trap_tid_fw, 
  fpc_pre_div_flush_fx2, 
  fpc_div_default_res_fx2, 
  fpc_fsr_w1_vld_fx5, 
  fpc_fcc_vld_fx5, 
  fpc_fpx_unfin_fb, 
  fpc_fpd_unfin_fb, 
  fpc_stfsr_en_fx3to5, 
  fac_tlu_flush_fx3, 
  fac_dec_valid_fx1, 
  fac_fpx_itype_fx1, 
  fac_fpx_dtype_fx1, 
  fac_fpx_stype_fx1, 
  fac_fpx_sign_instr_fx1, 
  fac_fpx_rnd_trunc_fx1, 
  fac_fpx_mulscc_fx1, 
  fac_fpx_saverestore_fx1, 
  fac_fpx_nv_vld_fx1, 
  fac_fpx_of_vld_fx1, 
  fac_fpx_uf_vld_fx1, 
  fac_fpx_dz_vld_fx1, 
  fac_fpx_nx_vld_fx1, 
  fac_fpx_unfin_vld_fx1, 
  fac_fpx_sp_dest_fx1, 
  fac_fpx_sp_src_fx1, 
  fac_fgx_instr_fx4, 
  fac_w1_vld_fx1, 
  fac_w1_odd32b_fx1, 
  fac_gsr_w_vld_fx2, 
  fac_dec_valid_noflush_fx5, 
  fgd_gsr_asr_mask_fx4_b31, 
  fac_fgx_mvcond_fx2, 
  fac_fgx_mvucond_fx2, 
  fac_fgx_abs_fx2, 
  fac_fgx_neg_fx2, 
  fac_fgx_logical_fx2, 
  fac_fgx_expand_fx2, 
  fac_fgx_merge_fx2, 
  fac_fgx_align_fx2, 
  fac_fgx_shuffle_fx2, 
  fac_fgx_pack16_fx2, 
  fac_fgx_pack32_fx2, 
  fac_fgx_packfix_fx2, 
  fac_fgx_pdist_fx1, 
  fac_fgx_popc_fx2, 
  fac_fgx_siam_fx2, 
  fac_fgx_pack_sel_fx2, 
  fac_opf_fx2, 
  fac_gsr_asr_tid_fx2, 
  fac_tid_fx2, 
  fac_rng_fprs, 
  fac_rng_rd_fprs_4f, 
  fac_rng_wr_gsr_3f, 
  fac_rng_rd_gsr_4f, 
  fac_rng_rd_ecc_4f, 
  fac_rng_rd_or_wr_3f, 
  fad_w1_tid_fw, 
  fad_w1_vld_fw, 
  fad_w2_addr_fw1_b4, 
  fad_w2_tid_fw1, 
  fad_w2_vld_fw1, 
  fac_frf_r1_addr_e, 
  fac_tid_e, 
  fac_aman_fmt_sel_e, 
  fac_bman_fmt_sel_e, 
  fac_fst_fmt_sel_fx1, 
  fac_w1_addr_fb, 
  fac_fpd_addr_fb, 
  fac_w1_32b_fb, 
  fac_fpd_32b_fb, 
  fac_w1_odd32b_fb, 
  fac_fpd_odd32b_fb, 
  fac_w1_tid_fb, 
  fac_fpd_tid_fb, 
  fac_fsr_store_fx2, 
  fac_exu_src_e, 
  fac_fsr0_sel_fw, 
  fac_fsr1_sel_fw, 
  fac_fsr2_sel_fw, 
  fac_fsr3_sel_fw, 
  fac_fsr4_sel_fw, 
  fac_fsr5_sel_fw, 
  fac_fsr6_sel_fw, 
  fac_fsr7_sel_fw, 
  fac_pre_fcc_vld_fx2, 
  fac_fcmpe_fx1, 
  fac_rs2_rotate_sel_e, 
  fac_i2f_sel_e, 
  fac_force_swap_blta_fx1, 
  fac_force_noswap_blta_fx1, 
  fac_xr_mode_fx1, 
  fac_rs1_sel_fx1, 
  fac_rs2_sel_fx1, 
  fac_8x16_rnd_fx3, 
  fac_scff_sel_fx3, 
  fac_accum_sel_fx3, 
  fac_result_sel_fx4, 
  fac_ma_result_en_fx4, 
  fdc_finish_int_early, 
  fdc_finish_fltd_early, 
  fdc_finish_flts_early, 
  fac_div_flush_fx3, 
  fac_div_valid_fx1, 
  fac_divq_valid_fx1, 
  fac_div_control_fx1, 
  fac_aexp_fmt_sel_e, 
  fac_bexp_fmt_sel_e, 
  fac_aux_cin_fx1, 
  lsu_fgu_fld_vld_w, 
  lsu_fgu_fld_b, 
  lsu_fgu_fld_tid_b, 
  lsu_fgu_fld_32b_b, 
  lsu_fgu_fsr_load_b, 
  lsu_fgu_pmen, 
  lsu_asi_clken, 
  exu_fgu_gsr_vld_m, 
  exu_fgu_flush_m, 
  fgu_result_tid_fx5, 
  fgu_irf_w_addr_fx5, 
  fgu_exu_cc_vld_fx5, 
  fgu_exu_w_vld_fx5, 
  fec_cecc_fx2, 
  fec_uecc_fx2, 
  fac_r1_vld_fx1, 
  fac_r2_vld_fx1, 
  fac_ecc_trap_en_fx1, 
  fac_tid_d, 
  fac_frf_r1_addr_d, 
  fac_frf_r1_vld_d, 
  spu_fgu_fpy_ctl_d, 
  main_clken, 
  main_clken0, 
  mul_clken, 
  div_clken, 
  vis_clken, 
  asi_clken, 
  coreon_clken, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  mbi_frf_read_en, 
  mbi_addr, 
  mbi_run, 
  in_rngl_cdbus, 
  fac_mbist_addr_1f, 
  fgu_rngl_cdbus_b64, 
  fgu_rngl_cdbus_b63, 
  scan_out, 
  wmr_scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire l1clk_pm2;
wire main_clken_local;
wire l1clk_pm1;
wire spares_scanin;
wire spares_scanout;
wire fgu_pmen_e;
wire mbist_run_1f;
wire [7:0] core_running_status_1f;
wire fgu_decode_e;
wire spu_grant_e;
wire frf_store_fx1;
wire frf_store_fx2;
wire fsr_store_fx1;
wire fpc_stfsr_en_fb;
wire fpc_stfsr_en_fw;
wire fgu_fld_fx3;
wire fgu_fld_fx4;
wire fgu_fld_fx5;
wire fgu_fld_fb;
wire fgu_decode_fx1;
wire gsr_w_vld_fx2;
wire gsr_w_vld_fx3;
wire gsr_w_vld_fx4;
wire rng_rd_or_wr_1f;
wire rng_rd_or_wr_2f;
wire rng_rd_or_wr_4f;
wire rng_rd_or_wr_5f;
wire dec_valid_fx2;
wire dec_valid_fx3;
wire dec_valid_noflush_fx4;
wire dec_valid_noflush_fb;
wire dec_valid_noflush_fw;
wire dec_valid_noflush_fw1;
wire dec_valid_noflush_fw2;
wire spu_grant_fx1;
wire spu_grant_fx2;
wire spu_grant_fx3;
wire spu_grant_fx4;
wire spu_grant_fx5;
wire div_engine_busy_fx1;
wire div_engine_busy_fx2;
wire divq_occupied_fx1;
wire div_finish_fb;
wire div_finish_fw;
wire div_finish_fw1;
wire div_finish_fw2;
wire div_finish_fw3;
wire fpx_itype_mul_e;
wire itype_mul_fx1;
wire itype_mul_fx2;
wire itype_mul_fx3;
wire dec_valid_imul_noflush_fx4;
wire dec_valid_imul_noflush_fx5;
wire dec_valid_imul_noflush_fb;
wire dec_valid_imul_noflush_fw;
wire dec_valid_imul_noflush_fw1;
wire dec_valid_imul_noflush_fw2;
wire fpx_itype_div_e;
wire fgx_instr_e;
wire fgx_instr_fx1;
wire fgx_instr_fx2;
wire fgx_instr_fx3;
wire fgx_instr_fx5;
wire fgx_instr_fb;
wire fgx_instr_fw;
wire fgx_instr_fw1;
wire fgx_instr_fw2;
wire global_asi_clken;
wire rng_rd_ecc_2f;
wire [2:0] rng_wr_tid_2f;
wire [7:0] rng_data_2f_b7_0;
wire mbist_frf_read_en_1f;
wire e_00_scanin;
wire e_00_scanout;
wire e_01_scanin;
wire e_01_scanout;
wire [5:0] op3_e;
wire [7:0] opf_e;
wire r1_vld_e;
wire r2_vld_e;
wire r1_32b_e;
wire r2_32b_e;
wire r1_odd32b_e;
wire r2_odd32b_e;
wire frf_store_e;
wire fsr_store_e;
wire [4:0] irf_w_addr_e;
wire [6:0] spu_fpy_ctl_e;
wire e_02_scanin;
wire e_02_scanout;
wire w1_vld_e;
wire [4:0] w1_addr_e;
wire w1_32b_e;
wire w1_odd32b_e;
wire exu_w_vld_e;
wire e_03_scanin;
wire e_03_scanout;
wire [24:5] i;
wire [4:0] aman_fmt_sel_e;
wire [3:0] bman_fmt_sel_e;
wire [9:0] aexp_fmt_sel_e;
wire [7:0] bexp_fmt_sel_e;
wire [2:0] fpx_itype_e;
wire [2:0] fpx_dtype_e;
wire [1:0] fpx_stype_e;
wire fpx_sign_instr_e;
wire fpx_rnd_trunc_e;
wire fpx_mulscc_e;
wire fpx_saverestore_e;
wire fpx_int_cc_vld_e;
wire fpx_fmul8x16_e;
wire fpx_fmul8x16au_e;
wire fpx_fmul8x16al_e;
wire fpx_fmul8sux16_e;
wire fpx_fmul8ulx16_e;
wire fpx_fmuld8sux16_e;
wire fpx_fmuld8ulx16_e;
wire fpx_nv_vld_e;
wire fpx_of_vld_e;
wire fpx_uf_vld_e;
wire fpx_dz_vld_e;
wire fpx_nx_vld_e;
wire fpx_unfin_vld_e;
wire fgx_mvcond_e;
wire fgx_mvucond_e;
wire fgx_abs_e;
wire fgx_neg_e;
wire fgx_logical_e;
wire fgx_expand_e;
wire fgx_merge_e;
wire fgx_align_e;
wire fgx_shuffle_e;
wire fgx_pack16_e;
wire fgx_pack32_e;
wire fgx_packfix_e;
wire fgx_pdist_e;
wire fgx_popc_e;
wire fgx_siam_e;
wire q_fgx_pdist_e;
wire [3:0] fst_fmt_sel_e;
wire [4:1] q_aman_fmt_sel_e;
wire [3:0] q_bman_fmt_sel_e;
wire [8:1] q_aexp_fmt_sel_e;
wire [3:1] q_bexp_fmt_sel_e;
wire fpx_sp_dest_e;
wire [1:0] q_w1_vld_e;
wire [1:0] cc_target_e;
wire [3:0] pre_fcc_vld_e;
wire [2:0] i_fsr_w2_vld_fb;
wire div_finish_fltd_fb;
wire div_finish_flts_fb;
wire fsr_w1_qvld_fb;
wire [1:0] fsr_w1_vld_fb;
wire pre_fcc_vld_fb;
wire [3:0] fcc_vld_fb;
wire fsr_w2_qvld_fb;
wire [5:0] fsr0_sel_fb;
wire [5:0] fsr1_sel_fb;
wire [5:0] fsr2_sel_fb;
wire [5:0] fsr3_sel_fb;
wire [5:0] fsr4_sel_fb;
wire [5:0] fsr5_sel_fb;
wire [5:0] fsr6_sel_fb;
wire [5:0] fsr7_sel_fb;
wire [1:0] q_r1_vld_e;
wire [1:0] q_r2_vld_e;
wire force_swap_blta_e;
wire force_noswap_blta_e;
wire xr_mode_e;
wire [4:0] rs1_sel_e;
wire [3:0] rs2_sel_e;
wire [1:0] rnd_8x16_e;
wire [5:0] result_sel_e;
wire div_valid_e;
wire pre_div_flush_fx3;
wire div_dec_issue_fx3;
wire divq_valid_e;
wire div_engine_busy_e;
wire div_finish_early;
wire div_dec_issue_e;
wire div_divq_issue_e;
wire div_divq_load_e;
wire div_hold_e;
wire divq_occupied_e;
wire [2:0] div_tid_in_e;
wire [2:0] divq_tid_fx1;
wire [2:0] div_tid_fx1;
wire [4:0] div_irf_addr_in_e;
wire [4:0] divq_irf_addr_fx1;
wire [4:0] div_irf_addr_fx1;
wire div_cc_vld_in_e;
wire divq_cc_vld_fx1;
wire div_cc_vld_fx1;
wire div_odd32b_in_e;
wire divq_odd32b_fx1;
wire div_odd32b_fx1;
wire div_32b_in_e;
wire divq_32b_fx1;
wire div_32b_fx1;
wire [4:0] div_frf_addr_in_e;
wire [4:0] divq_frf_addr_fx1;
wire [4:0] div_frf_addr_fx1;
wire [2:0] divq_tid_in_e;
wire [4:0] divq_irf_addr_in_e;
wire divq_cc_vld_in_e;
wire divq_odd32b_in_e;
wire divq_32b_in_e;
wire [4:0] divq_frf_addr_in_e;
wire [4:0] div_control_e;
wire fx1_00_scanin;
wire fx1_00_scanout;
wire [4:1] opf_fx1;
wire fpx_int_cc_vld_fx1;
wire fgx_mvcond_fx1;
wire fgx_mvucond_fx1;
wire fgx_abs_fx1;
wire fgx_neg_fx1;
wire fgx_logical_fx1;
wire fgx_expand_fx1;
wire fgx_merge_fx1;
wire fgx_align_fx1;
wire fgx_shuffle_fx1;
wire fgx_pack16_fx1;
wire fgx_pack32_fx1;
wire fgx_packfix_fx1;
wire fgx_popc_fx1;
wire i_fgx_siam_fx1;
wire [1:0] rnd_8x16_fx1;
wire [5:0] result_sel_fx1;
wire i_exu_w_vld_fx1;
wire [4:0] irf_w_addr_fx1;
wire div_dec_issue_fx1;
wire div_divq_issue_fx1;
wire [5:0] spu_fpy_ctl_fx1;
wire fx1_01_scanin;
wire fx1_01_scanout;
wire [4:0] w1_addr_fx1;
wire w1_32b_fx1;
wire [2:0] tid_fx1;
wire [1:0] q_w1_vld_fx1;
wire cerer_frf_fx1;
wire [7:0] ceter_pscce_fx1;
wire fx1_02_scanin;
wire fx1_02_scanout;
wire [3:0] pre_fcc_vld_fx1;
wire fgx_pack_sel_fx1;
wire fgx_moves_fx1;
wire fgx_siam_fx1;
wire exu_w_vld_fx1;
wire q_div_default_res_fx3;
wire div_default_res_fx3;
wire dec_flush_fx3;
wire [7:0] divide_completion_fx1;
wire [2:0] tid_fx3;
wire fx2_00_scanin;
wire fx2_00_scanout;
wire [4:0] w1_addr_fx2;
wire w1_32b_fx2;
wire w1_odd32b_fx2;
wire [2:0] tid_fx2;
wire i_exu_w_vld_fx2;
wire [4:0] irf_w_addr_fx2;
wire fx2_01_scanin;
wire fx2_01_scanout;
wire [1:0] rnd_8x16_fx2;
wire [5:0] result_sel_fx2;
wire fpx_int_cc_vld_fx2;
wire dec_flush_fx2;
wire [3:0] i_pre_fcc_vld_fx2;
wire div_dec_issue_fx2;
wire div_divq_issue_fx2;
wire [2:0] itype_fx2;
wire [5:0] spu_fpy_ctl_fx2;
wire rs2_sel_fx2_b2;
wire fx2_02_scanin;
wire fx2_02_scanout;
wire exu_flush_fx2;
wire [2:0] rng_wr_tid_3f;
wire dec_valid_noflush_fx2;
wire exu_w_vld_fx2;
wire pre_fcc_vld_fx2;
wire [1:0] i_fld_fcc_vld_fx2;
wire [3:0] scff_sel_fx2;
wire [6:0] accum_sel_fx2;
wire fx3_00_scanin;
wire fx3_00_scanout;
wire [4:0] w1_addr_fx3;
wire w1_32b_fx3;
wire w1_odd32b_fx3;
wire [5:0] result_sel_fx3;
wire i_exu_w_vld_fx3;
wire [4:0] irf_w_addr_fx3;
wire fpx_int_cc_vld_fx3;
wire i_pre_div_flush_fx3;
wire [2:0] itype_fx3;
wire [5:5] spu_fpy_ctl_fx3;
wire i_pre_fcc_vld_fx3;
wire i_dec_valid_noflush_fx3;
wire fx3_01_scanin;
wire fx3_01_scanout;
wire pre_fcc_vld_fx3;
wire dec_valid_noflush_fx3;
wire dec_valid_imul_noflush_fx3;
wire exu_w_vld_fx3;
wire fx4_00_scanin;
wire fx4_00_scanout;
wire [4:0] w1_addr_fx4;
wire w1_32b_fx4;
wire w1_odd32b_fx4;
wire [2:0] tid_fx4;
wire exu_w_vld_fx4;
wire [4:0] i_irf_w_addr_fx4;
wire i_int_cc_vld_fx4;
wire [5:5] spu_fpy_ctl_fx4;
wire pre_fcc_vld_fx4;
wire [2:0] irf_result_tid_fx4;
wire [4:0] irf_w_addr_fx4;
wire exu_cc_vld_fx4;
wire fx5_00_scanin;
wire fx5_00_scanout;
wire [4:0] w1_addr_fx5;
wire w1_32b_fx5;
wire w1_odd32b_fx5;
wire [2:0] tid_fx5;
wire i_exu_w_vld_fx5;
wire irf_result_tid_fx5_b2;
wire exu_cc_vld_fx5;
wire pre_fcc_vld_fx5;
wire div_finish_int_fb;
wire fb_00_scanin;
wire fb_00_scanout;
wire fw_00_scanin;
wire fw_00_scanout;
wire w1_addr_fw_b4;
wire fw_01_scanin;
wire fw_01_scanout;
wire [3:0] i_fsr0_sel_fw;
wire [3:0] i_fsr1_sel_fw;
wire [3:0] i_fsr2_sel_fw;
wire [3:0] i_fsr3_sel_fw;
wire [3:0] i_fsr4_sel_fw;
wire [3:0] i_fsr5_sel_fw;
wire [3:0] i_fsr6_sel_fw;
wire [3:0] i_fsr7_sel_fw;
wire [2:0] lsu_fgu_fld_tid_fw;
wire [1:0] i_fsr_w2_vld_fw;
wire [1:0] fsr_w2_vld_fw;
wire fprs_frf_ctl_scanin;
wire fprs_frf_ctl_scanout;
wire [4:4] fprs_w1_addr;
wire [2:0] fprs_w1_tid;
wire [1:0] fprs_w1_vld;
wire [4:4] fprs_w2_addr;
wire [2:0] fprs_w2_tid;
wire [1:0] fprs_w2_vld;
wire [3:0] fprs_tid0_sel;
wire rng_wr_fprs_3f;
wire [2:0] din_fprs_tid0;
wire [2:0] fprs_tid0;
wire fprstid0_wmr_scanin;
wire fprstid0_wmr_scanout;
wire [2:2] fprs_tid0_;
wire [3:0] fprs_tid1_sel;
wire [2:0] din_fprs_tid1;
wire [2:0] fprs_tid1;
wire fprstid1_wmr_scanin;
wire fprstid1_wmr_scanout;
wire [2:2] fprs_tid1_;
wire [3:0] fprs_tid2_sel;
wire [2:0] din_fprs_tid2;
wire [2:0] fprs_tid2;
wire fprstid2_wmr_scanin;
wire fprstid2_wmr_scanout;
wire [2:2] fprs_tid2_;
wire [3:0] fprs_tid3_sel;
wire [2:0] din_fprs_tid3;
wire [2:0] fprs_tid3;
wire fprstid3_wmr_scanin;
wire fprstid3_wmr_scanout;
wire [2:2] fprs_tid3_;
wire [3:0] fprs_tid4_sel;
wire [2:0] din_fprs_tid4;
wire [2:0] fprs_tid4;
wire fprstid4_wmr_scanin;
wire fprstid4_wmr_scanout;
wire [2:2] fprs_tid4_;
wire [3:0] fprs_tid5_sel;
wire [2:0] din_fprs_tid5;
wire [2:0] fprs_tid5;
wire fprstid5_wmr_scanin;
wire fprstid5_wmr_scanout;
wire [2:2] fprs_tid5_;
wire [3:0] fprs_tid6_sel;
wire [2:0] din_fprs_tid6;
wire [2:0] fprs_tid6;
wire fprstid6_wmr_scanin;
wire fprstid6_wmr_scanout;
wire [2:2] fprs_tid6_;
wire [3:0] fprs_tid7_sel;
wire [2:0] din_fprs_tid7;
wire [2:0] fprs_tid7;
wire fprstid7_wmr_scanin;
wire fprstid7_wmr_scanout;
wire [2:2] fprs_tid7_;
wire [2:0] din_rng_fprs;
wire fprs_rng_scanin;
wire fprs_rng_scanout;
wire rng_stg1_scanin;
wire rng_stg1_scanout;
wire rng_ctl_1f;
wire rng_valid_1f;
wire [62:48] rng_data_1f;
wire [7:0] rng_data_1f_b7_0;
wire rng_rd_1f;
wire rng_wr_1f;
wire rng_rd_gsr_1f;
wire rng_wr_gsr_1f;
wire rng_rd_fprs_1f;
wire rng_wr_fprs_1f;
wire rng_rd_ecc_1f;
wire rng_stg2_scanin;
wire rng_stg2_scanout;
wire rng_wr_gsr_2f;
wire rng_rd_gsr_2f;
wire rng_rd_fprs_2f;
wire rng_wr_fprs_2f;
wire rng_6463_scanin;
wire rng_6463_scanout;
wire rng_ctl_2f;
wire rng_valid_2f;
wire rng_ctl_3f;
wire rng_cdbus_3f_b63;
wire rng_valid_3f;
wire rng_stg3_scanin;
wire rng_stg3_scanout;
wire rng_rd_gsr_3f;
wire rng_rd_fprs_3f;
wire rng_rd_ecc_3f;
wire rng_b64_default_sel;
wire rng_stg4_scanin;
wire rng_stg4_scanout;



// ----------------------------------------------------------------------------
// Interface with DEC
// ----------------------------------------------------------------------------

input    [4:0] dec_frf_r1_addr_d;
input          dec_frf_r1_vld_d;
input          dec_frf_r2_vld_d;
input          dec_frf_r1_32b_d;
input          dec_frf_r2_32b_d;
input          dec_frf_r1_odd32b_d;
input          dec_frf_r2_odd32b_d;

input          dec_frf_w_vld_d;
input    [4:0] dec_frf_w_addr_d;
input          dec_frf_w_32b_d;
input          dec_frf_w_odd32b_d;

input          dec_fgu_valid_e;
input          dec_exu_src_vld_d;
input    [4:0] dec_irf_w_addr_d;

input          dec_spu_grant_d;
input          dec_frf_store_d;
input          dec_fsr_store_d;

input          dec_flush_f1;           // flush fx2 (xmit in fx1/m)
input          dec_flush_f2;           // flush fx3 (xmit in fx2/b)

input    [5:0] dec_fgu_op3_d;
input    [7:0] dec_fgu_opf_d;
input          dec_fgu_decode_d;       // FGU instr issue valid (d stage)
input    [2:0] dec_fgu_tid_d;

output   [2:0] fgu_cmp_fcc_tid_fx2;    // fcmp  fcc data TID
output   [1:0] fgu_fld_fcc_vld_fx3;    // ldfsr fcc data valid {fcc3, fcc2, fcc1}, fcc0
output   [7:0] fgu_fprs_fef;           // FPRS.fef for each TID

output   [7:0] fgu_divide_completion;  // FPD completion/TID

// ----------------------------------------------------------------------------
// Interface with TLU
// ----------------------------------------------------------------------------

input          tlu_flush_fgu_b;        // flush fx3, non-load (xmit in fx2/b)
input    [7:0] tlu_ceter_pscce;        // core error trap enable reg precise enable
input          tlu_cerer_frf;          // FRF ecc error trap enable
input    [7:0] spc_core_running_status; // thread active

output   [2:0] fgu_fpx_trap_tid_fw;
output   [2:0] fgu_fpd_trap_tid_fw;

// ----------------------------------------------------------------------------
// Interface with FPC
// ----------------------------------------------------------------------------

input          fpc_pre_div_flush_fx2;
input          fpc_div_default_res_fx2; // fdiv/fsqrt default result
input    [1:0] fpc_fsr_w1_vld_fx5;     // FSR w1 write valid
input    [3:0] fpc_fcc_vld_fx5;
input          fpc_fpx_unfin_fb;
input          fpc_fpd_unfin_fb;
input          fpc_stfsr_en_fx3to5;    // store FSR clears ftt

output         fac_tlu_flush_fx3;
output         fac_dec_valid_fx1;
output   [2:0] fac_fpx_itype_fx1;      // instr type:
                                       // add=000, fpfp=001, fpint=010, intfp=011, cmp=100, mul=101, div=110, sqrt=111
output   [2:0] fac_fpx_dtype_fx1;      // destination type:
                                       // sp=000, dp=001, 16bit=010, 32bit=011, 64bit=100
output   [1:0] fac_fpx_stype_fx1;      // source type (for conversions & FsMULd/FMULd):
                                       // sp=00, dp=01, 32bit=10, 64bit=11
output         fac_fpx_sign_instr_fx1; // sign of the instr (1 if: FSUB(s,d),
                                       // FPSUB{16,32}{s})
output         fac_fpx_rnd_trunc_fx1;  // force rnd mode to truncate
                                       // (1 if: F(s,d)TOi, F(s,d)TOx,
                                       // FPADD{16,32}{s}, FPSUB{16,32}{s},
                                       // IMUL, IDIV, MULScc, 8x16 mul, SAVE, RESTORE
output         fac_fpx_mulscc_fx1;     // MULScc
output         fac_fpx_saverestore_fx1;// SAVE or RESTORE
output         fac_fpx_nv_vld_fx1;     // set if instr updates invalid exception flag
output         fac_fpx_of_vld_fx1;     // set if instr updates overflow exception flag
output         fac_fpx_uf_vld_fx1;     // set if instr updates underflow exception flag
output         fac_fpx_dz_vld_fx1;     // set if instr updates divide by zero exception flag
output         fac_fpx_nx_vld_fx1;     // set if instr updates inexact exception flag
output         fac_fpx_unfin_vld_fx1;  // set if instr can generate unfinished_FPop

output         fac_fpx_sp_dest_fx1;    // sp destination
output         fac_fpx_sp_src_fx1;     // sp source
output         fac_fgx_instr_fx4;      // FGX instr decoded
output   [1:0] fac_w1_vld_fx1;
output         fac_w1_odd32b_fx1;
output   [1:0] fac_gsr_w_vld_fx2;
output         fac_dec_valid_noflush_fx5;

// ----------------------------------------------------------------------------
// Interface with FGD
// ----------------------------------------------------------------------------

input          fgd_gsr_asr_mask_fx4_b31;

output         fac_fgx_mvcond_fx2;     // FMOV (conditional upon cc or r)
output         fac_fgx_mvucond_fx2;    // FMOV (unconditional)
output         fac_fgx_abs_fx2;        // FABS
output         fac_fgx_neg_fx2;        // FNEG
output         fac_fgx_logical_fx2;    // logical instructions
output         fac_fgx_expand_fx2;     // FEXPAND
output         fac_fgx_merge_fx2;      // FPMERGE
output         fac_fgx_align_fx2;      // FALIGNDATA
output         fac_fgx_shuffle_fx2;    // BSHUFFLE
output         fac_fgx_pack16_fx2;     // FPACK16
output         fac_fgx_pack32_fx2;     // FPACK32
output         fac_fgx_packfix_fx2;    // FPACKFIX
output         fac_fgx_pdist_fx1;      // PDIST
output         fac_fgx_popc_fx2;       // POPC
output         fac_fgx_siam_fx2;       // SIAM

output         fac_fgx_pack_sel_fx2;   // FPACK16,FPACK32,FPACKFIX

output   [4:1] fac_opf_fx2;            // instr opf field
output   [2:0] fac_gsr_asr_tid_fx2;
output   [2:0] fac_tid_fx2;

output   [2:0] fac_rng_fprs;           // ASR FPRS read data
output         fac_rng_rd_fprs_4f;     // ASR FPRS read
output         fac_rng_wr_gsr_3f;      // ASR GSR  write valid
output         fac_rng_rd_gsr_4f;      // ASR GSR  read
output         fac_rng_rd_ecc_4f;      // ASI FRF ECC read
output         fac_rng_rd_or_wr_3f;    // ASR GSR/FPRS read or write decoded

// ----------------------------------------------------------------------------
// Interface with FAD
// ----------------------------------------------------------------------------

input    [2:0] fad_w1_tid_fw;          // FRF w1 write TID
input    [1:0] fad_w1_vld_fw;          // FRF w1 write valid (qualified)
input          fad_w2_addr_fw1_b4;     // FRF w2 write addr
input    [2:0] fad_w2_tid_fw1;         // FRF w2 write TID
input    [1:0] fad_w2_vld_fw1;         // FRF w2 write valid (qualified)

output   [4:0] fac_frf_r1_addr_e;
output   [2:0] fac_tid_e;
output   [4:0] fac_aman_fmt_sel_e;     // aop mantissa format mux select
output   [4:0] fac_bman_fmt_sel_e;     // bop mantissa format mux select
output   [3:0] fac_fst_fmt_sel_fx1;    // store format mux select

output   [4:0] fac_w1_addr_fb;         // FRF w1 write addr
output   [4:0] fac_fpd_addr_fb;        // FRF w2 write addr (div/sqrt)
output         fac_w1_32b_fb;          // FRF w1 is 32-bit dest
output         fac_fpd_32b_fb;         // FRF w2 is 32-bit dest (div/sqrt)
output         fac_w1_odd32b_fb;       // FRF w1 is odd 32-bit dest (32 LSBs)
output         fac_fpd_odd32b_fb;      // FRF w2 is odd 32-bit dest (32 LSBs) (div/sqrt)

output   [2:0] fac_w1_tid_fb;          // FRF w1 TID
output   [2:0] fac_fpd_tid_fb;         // FRF w2 TID (div/sqrt)

output         fac_fsr_store_fx2;

output         fac_exu_src_e;

output   [5:0] fac_fsr0_sel_fw;
output   [5:0] fac_fsr1_sel_fw;
output   [5:0] fac_fsr2_sel_fw;
output   [5:0] fac_fsr3_sel_fw;
output   [5:0] fac_fsr4_sel_fw;
output   [5:0] fac_fsr5_sel_fw;
output   [5:0] fac_fsr6_sel_fw;
output   [5:0] fac_fsr7_sel_fw;

// ----------------------------------------------------------------------------
// Interface with FPF
// ----------------------------------------------------------------------------

output   [3:0] fac_pre_fcc_vld_fx2;    // must clear fcc_vld if (nv & TEM)
output         fac_fcmpe_fx1;          // FCMPE, not FCMP
output   [4:0] fac_rs2_rotate_sel_e;   // 001=odd FiTO(s,d), 010=even FiTO(s,d), 100=FiTO(s,d)
output   [1:0] fac_i2f_sel_e;          // 01=F(i,x)TO(s,d), 10=~F(i,x)TO(s,d)
output         fac_force_swap_blta_fx1; // force the swap_blta condition
output         fac_force_noswap_blta_fx1; // force the ~swap_blta condition

// ----------------------------------------------------------------------------
// Interface with FPY
// ----------------------------------------------------------------------------

output	       fac_xr_mode_fx1;	       //  0  : Int or Float
			               //  1  : XOR mult

output   [4:0] fac_rs1_sel_fx1;	       // [0] : FMUL8SUx16 or FMULD8SUx16
				       // [1] : FMUL8x16   or FMUL8x16AU  or FMUL8x16AL
				       // [2] : FMUL8ULx16 or FMULD8ULx16
				       // [3] : MA Int / XOR   forward of last MA result
				       // [4] : MA Int / XOR unforwarded
				       // Def : 64 * 64 Multiply

output   [3:0] fac_rs2_sel_fx1;	       // [0] : FMUL8x16AU
				       // [1] : FMUL8x16AL
				       // [2] : all 8x16
				       // [3] : MA Int / XOR
				       // Def : 64 * 64 Multiply

output   [1:0] fac_8x16_rnd_fx3;       // [0] : FMUL8x16 or FMUL8x16AU or FMUL8x16AL or FMUL8SUx16
				       // [1] : FMUL8ULx16

output   [3:0] fac_scff_sel_fx3;       // [0] : Int, Float, MA Int
				       // [1] : all 8x16
				       // [2] : MA Int   * 2
				       // [3] : XOR mult
				       // Def : XOR mult * 2

output   [6:0] fac_accum_sel_fx3;      // [0] : Write ACCUM with result
				       // [1] : Add ACCUM to Mult product
				       // [2] : XOR Mult w/        ACCUM
				       // [3] : XOR Mult w/        ACCUM >> 64
				       // [4] : XOR Mult       w/o ACCUM
				       // [5] : XOR Mult       w/o ACCUM >> 64
				       // [6] : Int Mult w/ or w/o ACCUM
 				       // Def : Int Mult w/ or w/o ACCUM >> 64

output   [5:0] fac_result_sel_fx4;     // [0] : FMUL8x16   or FMUL8x16AU or FMUL8x16AL or FMUL8SUx16
				       // [1] : FMUL8ULx16
				       // [2] : FMULD8SUx16
				       // [3] : FMULD8ULx16
				       // [4] : XOR multiply w/ ACCUMUMATE
				       // [5] : Float
				       // Def : Integer, MA Integer w/ and w/o ACCUMULATE, XOR w/o ACCUMULATE

output	       fac_ma_result_en_fx4;   //  1  : Save last MA result in shadow flop

// ----------------------------------------------------------------------------
// Interface with FDC
// ----------------------------------------------------------------------------

input          fdc_finish_int_early;
input 	       fdc_finish_fltd_early;
input          fdc_finish_flts_early;
output         fac_div_flush_fx3;
output         fac_div_valid_fx1;
output         fac_divq_valid_fx1;
output   [4:0] fac_div_control_fx1;    // [4:0]  :
                                       //  0000  : Float Divide Single
                                       //  0010  : Float Divide Double
                                       //  0100  : Integer Unsigned - 32 bit
                                       //  0101  : Integer   Signed - 32 bit
                                       //  0110  : Integer Unsigned - 64 bit
                                       //  0111  : Integer   Signed - 64 bit
                                       //  1000  : Float SQRT   Single
                                       //  1010  : Float SQRT   Double

// ----------------------------------------------------------------------------
// Interface with FPE
// ----------------------------------------------------------------------------

output   [9:0] fac_aexp_fmt_sel_e;     // aop exponent format mux select
output   [7:0] fac_bexp_fmt_sel_e;     // bop exponent format mux select
output         fac_aux_cin_fx1;        // aux exp adder cin

// ----------------------------------------------------------------------------
// Interface with LSU
// ----------------------------------------------------------------------------

input          lsu_fgu_fld_vld_w;
input          lsu_fgu_fld_b;          // FRF load data (unqualified)
input    [2:0] lsu_fgu_fld_tid_b;
input          lsu_fgu_fld_32b_b;
input          lsu_fgu_fsr_load_b;
input          lsu_fgu_pmen;
input          lsu_asi_clken;

// ----------------------------------------------------------------------------
// Interface with EXU
// ----------------------------------------------------------------------------

input    [1:0] exu_fgu_gsr_vld_m;      // GSR data valid {align,mask}
input          exu_fgu_flush_m;        // EXU{1,0} src has bad ECC or exception, FGU must flush instr
output   [1:0] fgu_result_tid_fx5;
output   [4:0] fgu_irf_w_addr_fx5;
output         fgu_exu_cc_vld_fx5;
output   [1:0] fgu_exu_w_vld_fx5;

// ----------------------------------------------------------------------------
// Interface with FEC
// ----------------------------------------------------------------------------

input          fec_cecc_fx2;
input          fec_uecc_fx2;
output   [1:0] fac_r1_vld_fx1;         // FRF r1 read valid (unqualified)
output   [1:0] fac_r2_vld_fx1;         // FRF r2 read valid (unqualified)
output         fac_ecc_trap_en_fx1;

// ----------------------------------------------------------------------------
// Interface with FRF
// ----------------------------------------------------------------------------

output   [2:0] fac_tid_d;
output   [4:0] fac_frf_r1_addr_d;
output         fac_frf_r1_vld_d;

// ----------------------------------------------------------------------------
// Interface with SPU
// ----------------------------------------------------------------------------

input    [6:0] spu_fgu_fpy_ctl_d;      // Mult control

// ----------------------------------------------------------------------------
// Power Management Signals
// ----------------------------------------------------------------------------

output         main_clken;             // main clken: controls fad,fec,fpf,fpe,fac,fic,fpc
output         main_clken0;            // main clken: controls fad,fec,fpf,fpe,fac,fic,fpc
output         mul_clken;              // multiply clken: controls fpy
output         div_clken;              // divide clken: controls fdc,fdd
output         vis_clken;              // vis clken: controls fgd
output         asi_clken;              // asi clken: controls ASI ring stage flops in fgd
output         coreon_clken;           // coreon_clken: controls all "free running" flops in fac,fec,fpc,fad,fgd

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input	       scan_in;
input          spc_aclk_wmr;
input          wmr_scan_in;
input	       tcu_pce_ov;	       // scan signals
input	       spc_aclk;
input	       spc_bclk;
input          tcu_scan_en;
input          mbi_frf_read_en;        // MBIST
input    [7:0] mbi_addr;               // MBIST
input          mbi_run;                // MBIST
input   [64:0] in_rngl_cdbus;          // ASI local ring

output   [7:0] fac_mbist_addr_1f;      // MBIST
output         fgu_rngl_cdbus_b64;     // ASI local ring
output         fgu_rngl_cdbus_b63;     // ASI local ring
output 	       scan_out;
output         wmr_scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop   = 1'b0;
assign siclk  = spc_aclk;
assign soclk  = spc_bclk;
assign se     = tcu_scan_en;
// end scan


fgu_fac_ctl_l1clkhdr_ctl_macro clkgen_freerun (
  .l2clk(l2clk),
  .l1en (1'b1),
  .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fac_ctl_l1clkhdr_ctl_macro clkgen_coreon (
  .l2clk(l2clk),
  .l1en (coreon_clken),
  .l1clk(l1clk_pm2),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fac_ctl_l1clkhdr_ctl_macro clkgen_main (
  .l2clk(l2clk),
  .l1en (main_clken_local),
  .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
  );

fgu_fac_ctl_spare_ctl_macro__num_5 spares  (  // spares: 13 gates + 1 flop for each "num"
  .scan_in(spares_scanin),
  .scan_out(spares_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
  );


// ------------------------------------
// Power management
//   Wakeup conditions:
//   - DEC issues FGU instr (includes frf_store, fsr_store)
//   - DEC grants SPU access to FGU
//   - LSU presents frf_load or fsr_load data
//   - EXU presents bmask or alignaddress data
//   - ASI ring accesses FGU resource (FPRS, GSR, FRF ECC check bits)
//   - WARNING - wakeup for MBIST, Macro Test, other?
//   Remain active conditions:
//   - FGU instr active in any pipe stage
//   - SPU instr active in any pipe stage
//   - divide engine is busy (incl pre and post engine)
//   - ASI ring bypassing non-FGU ctl/data
//   Note: Generally, clks are allowed to remain active for 1 more cyc
//         than the min solution to ensure that any state which controls
//         the update of an architected facility is allowed to clear.
//         Otherwise, when clks are re-enabled, an extra write of the
//         architected facility may occur (but would write that same data).
// ------------------------------------

// coreon_clken: controls all "free running" flops in fac,fec,fpc,fad,fgd

assign  coreon_clken =

  ~fgu_pmen_e               |      // force clken=1 if FGU global power management isn't enabled
  mbist_run_1f              |      // MBIST
  (|core_running_status_1f[7:0]);  // any of the 8 threads are active

// 0in custom -fire ((mul_clken | div_clken | vis_clken) & ~main_clken) -message "Invalid FGU power management state"

// main clken: controls fad,fec,fpf,fpe,fac,fic,fpc

assign  main_clken =  // may be used to turn on fx1 flops

  ~fgu_pmen_e               |  // force clken=1 if FGU global power management isn't enabled

  mbist_run_1f              |  // MBIST

  fgu_decode_e              |  // includes frf_store, fsr_store, bmask, alignaddress
  spu_grant_e               |

  frf_store_fx1             |  // active 1 xtra cyc
  frf_store_fx2             |  // active 2nd xtra cyc to allow fgu_{u,c}ecc_fx2 to clear

  fsr_store_fx1             |
  fac_fsr_store_fx2         |
  fpc_stfsr_en_fx3to5       |  // store FSR clears ftt
  fpc_stfsr_en_fb           |  // allow FSR update
  fpc_stfsr_en_fw           |  // active 1 xtra cyc

  fgu_fld_fx3               |  // frf_load doesn't need to turn on bypass flops because the
                               //   instr in E needing the bypass will take care of that.
                               // fsr_load needs clks on the cyc following lsu_fgu_fsr_load_b
                               //   so the arch fsr is captured.
  fgu_fld_fx4               |  // allow FPRS update
  fgu_fld_fx5               |  // allow FPRS update
  fgu_fld_fb                |  // active 1 xtra cyc

  fgu_decode_fx1            |  // bmask or alignaddress
  gsr_w_vld_fx2             |  // exu_fgu_gsr_vld_m[1:0] needs fx3 and fx4 flop clks on so the
  gsr_w_vld_fx3             |  //   arch gsr (fx4 flop) is captured
  gsr_w_vld_fx4             |  // active 1 xtra cyc

  rng_rd_or_wr_1f           |  // ASI ring accesses FGU resource
  rng_rd_or_wr_2f           |
  fac_rng_rd_or_wr_3f       |  // FRF ECC check bits rd/wr occurs during 3f
  rng_rd_or_wr_4f           |
  rng_rd_or_wr_5f           |  // active 1 xtra cyc

  fac_dec_valid_fx1         |  // E stage is covered in this eq. by fgu_decode_e
  dec_valid_fx2             |
  dec_valid_fx3             |
  dec_valid_noflush_fx4     |
  fac_dec_valid_noflush_fx5 |
  dec_valid_noflush_fb      |
  dec_valid_noflush_fw      |  // allow FPRS update
  dec_valid_noflush_fw1     |  // allow FPRS update
  dec_valid_noflush_fw2     |  // active 1 xtra cyc

  spu_grant_fx1             |  // E stage is covered in this eq. by spu_grant_e
  spu_grant_fx2             |
  spu_grant_fx3             |
  spu_grant_fx4             |
  spu_grant_fx5             |  // active 1 xtra cyc

  div_engine_busy_fx1       |  // cyc prior to engine_busy are covered in this eq. by fgu_decode_e
  div_engine_busy_fx2       |  // ensure fdc internal engine_running_lth has 1 cyc to clear
  divq_occupied_fx1         |
  div_finish_fb             |
  div_finish_fw             |
  div_finish_fw1            |  // allow FPRS update
  div_finish_fw2            |  // allow FPRS update
  div_finish_fw3            ;  // active 1 xtra cyc

assign  main_clken0      = main_clken;
assign  main_clken_local = main_clken;

// multiply clken: controls fpy

assign  mul_clken =

  ~fgu_pmen_e               |  // force clken=1 if FGU global power management isn't enabled

  (fgu_decode_e              & fpx_itype_mul_e  ) |
  (fac_dec_valid_fx1         &     itype_mul_fx1) |
  (dec_valid_fx2             &     itype_mul_fx2) |
  (dec_valid_fx3             &     itype_mul_fx3) |
  dec_valid_imul_noflush_fx4 |
  dec_valid_imul_noflush_fx5 |
  dec_valid_imul_noflush_fb  |
  dec_valid_imul_noflush_fw  |  // allow FPRS update
  dec_valid_imul_noflush_fw1 |  // allow FPRS update
  dec_valid_imul_noflush_fw2 |  // active 1 xtra cyc

  spu_grant_e               |
  spu_grant_fx1             |
  spu_grant_fx2             |
  spu_grant_fx3             |
  spu_grant_fx4             |
  spu_grant_fx5             ;  // active 1 xtra cyc

// divide clken: controls fdc,fdd

assign  div_clken =

  ~fgu_pmen_e               |  // force clken=1 if FGU global power management isn't enabled

  (fgu_decode_e              &      fpx_itype_div_e              ) |
  div_engine_busy_fx1       |
  div_engine_busy_fx2       |  // ensure fdc internal engine_running_lth has 1 cyc to clear
  divq_occupied_fx1         |
  div_finish_fb             |
  div_finish_fw             |
  div_finish_fw1            |  // allow FPRS update
  div_finish_fw2            |  // allow FPRS update
  div_finish_fw3            ;  // active 1 xtra cyc

// vis clken: controls fgd

assign  vis_clken =

  ~fgu_pmen_e               |  // force clken=1 if FGU global power management isn't enabled

  fgu_decode_fx1            |  // bmask or alignaddress
  gsr_w_vld_fx2             |  // exu_fgu_gsr_vld_m[1:0] needs fx3 and fx4 flop clks on so the
  gsr_w_vld_fx3             |  //   arch gsr (fx4 flop) is captured
  gsr_w_vld_fx4             |  // active 1 xtra cyc

  rng_rd_or_wr_1f           |  // ASI ring accesses FGU resource
  rng_rd_or_wr_2f           |
  fac_rng_rd_or_wr_3f       |  // FRF ECC check bits rd/wr occurs during 3f
  rng_rd_or_wr_4f           |
  rng_rd_or_wr_5f           |  // active 1 xtra cyc

  (fgu_decode_e              &      fgx_instr_e                  ) |
  (fac_dec_valid_fx1         &      fgx_instr_fx1                ) |
  (dec_valid_fx2             &      fgx_instr_fx2                ) |
  (dec_valid_fx3             &      fgx_instr_fx3                ) |
  (dec_valid_noflush_fx4     &  fac_fgx_instr_fx4                ) |
  (fac_dec_valid_noflush_fx5 &      fgx_instr_fx5                ) |
  (dec_valid_noflush_fb      &      fgx_instr_fb                 ) |
  (dec_valid_noflush_fw      &      fgx_instr_fw                 ) |  // allow FPRS update
  (dec_valid_noflush_fw1     &      fgx_instr_fw1                ) |  // allow FPRS update
  (dec_valid_noflush_fw2     &      fgx_instr_fw2                ) ;  // active 1 xtra cyc


// ASI clken: controls ASI ring stage flops in fgd

assign  asi_clken = global_asi_clken;  // can be forced active via ASI_SPARC_PWR_MGMT.misc


// ----------------------------------------------------------------------------
//                               D stage
// ----------------------------------------------------------------------------

assign  fac_tid_d[2:0] =
  ({3{ mbist_run_1f                 }} & fac_mbist_addr_1f[7:5]) |  // MBIST
  ({3{~mbist_run_1f &  rng_rd_ecc_2f}} & rng_wr_tid_2f[2:0]    ) |  // ASI
  ({3{~mbist_run_1f & ~rng_rd_ecc_2f}} & dec_fgu_tid_d[2:0]    ) ;  // functional

assign  fac_frf_r1_addr_d[4:0] =
  ({5{ mbist_run_1f                 }} & fac_mbist_addr_1f[4:0]) |  // MBIST
  ({5{~mbist_run_1f &  rng_rd_ecc_2f}} & rng_data_2f_b7_0[7:3] ) |  // ASI
  ({5{~mbist_run_1f & ~rng_rd_ecc_2f}} & dec_frf_r1_addr_d[4:0]) ;  // functional

assign  fac_frf_r1_vld_d =
  (    mbist_run_1f                    & mbist_frf_read_en_1f  ) |  // MBIST
  (   ~mbist_run_1f &  rng_rd_ecc_2f                           ) |  // ASI
  (   ~mbist_run_1f & ~rng_rd_ecc_2f   & dec_frf_r1_vld_d      ) ;  // functional

// 0in custom -fire (rng_rd_ecc_2f & (dec_frf_r1_vld_d | dec_frf_r2_vld_d) & (dec_fgu_decode_d | dec_frf_store_d | (fgx_pdist_e & dec_fgu_valid_e))) -message "FRF_ECC ASI collision with FPop"


// ----------------------------------------------------------------------------
//                               E stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_10 e_00  (
  .scan_in(e_00_scanin),
  .scan_out(e_00_scanout),
  .l1clk(l1clk),
  .din ({mbi_run,      spc_core_running_status[7:0],    lsu_fgu_pmen  }),  // requires free running clk
  .dout({mbist_run_1f,     core_running_status_1f[7:0],     fgu_pmen_e}),
  .siclk(siclk),
  .soclk(soclk)  // requires free running clk
  );

fgu_fac_ctl_msff_ctl_macro__width_37 e_01  (
  .scan_in(e_01_scanin),
  .scan_out(e_01_scanout),
  .l1clk(l1clk_pm2),
  .din ({dec_fgu_op3_d[5:0],      // requires free running clk or dec_fgu_decode_d en
         dec_fgu_opf_d[7:0],      // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_vld_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_vld_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         dec_frf_r2_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         dec_frf_store_d,         // requires free running clk or dec_fgu_decode_d en
         dec_fsr_store_d,         // requires free running clk or dec_fgu_decode_d en
         dec_irf_w_addr_d[4:0],   // requires free running clk or dec_fgu_decode_d en
         dec_spu_grant_d,         // requires free running clk or dec_fgu_decode_d en
         spu_fgu_fpy_ctl_d[6:0],  // requires free running clk or dec_fgu_decode_d en
         dec_fgu_decode_d,        // requires free running clk or dec_fgu_decode_d en
         lsu_asi_clken}),         // requires free running clk
  .dout({        op3_e[5:0],
                 opf_e[7:0],
                 r1_vld_e,
                 r2_vld_e,
                 r1_32b_e,
                 r2_32b_e,
                 r1_odd32b_e,
                 r2_odd32b_e,
             frf_store_e,
             fsr_store_e,
             irf_w_addr_e[4:0],
             spu_grant_e,
             spu_fpy_ctl_e[6:0],
                 fgu_decode_e,
         global_asi_clken}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_17 e_02  (
  .scan_in(e_02_scanin),
  .scan_out(e_02_scanout),
  .l1clk(l1clk_pm2),
  .din ({dec_frf_w_vld_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_w_addr_d[4:0],  // requires free running clk or dec_fgu_decode_d en
         dec_frf_w_32b_d,        // requires free running clk or dec_fgu_decode_d en
         dec_frf_w_odd32b_d,     // requires free running clk or dec_fgu_decode_d en
         dec_fgu_tid_d[2:0],     // requires free running clk or dec_fgu_decode_d en
         dec_frf_r1_addr_d[4:0], // requires free running clk or dec_fgu_decode_d en
         dec_exu_src_vld_d}),    // requires free running clk or dec_fgu_decode_d en
  .dout({        w1_vld_e,
                 w1_addr_e[4:0],
                 w1_32b_e,
                 w1_odd32b_e,
         fac_tid_e[2:0],
         fac_frf_r1_addr_e[4:0],
             exu_w_vld_e}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_9 e_03  (
  .scan_in(e_03_scanin),
  .scan_out(e_03_scanout),
  .l1clk(l1clk_pm1),
  .din ({mbi_frf_read_en,      mbi_addr[7:0]         }),
  .dout({mbist_frf_read_en_1f, fac_mbist_addr_1f[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign i[24:19] = op3_e[5:0];
assign i[12:5] = opf_e[7:0];

// ------------------------------------
// Begin auto/program generated code
// ------------------------------------

assign aman_fmt_sel_e[4] = (!i[12]&!i[11]&!i[10]) | (i[22]) | (i[19]&!i[9]) | (
    i[20]) | (!i[23]);

assign aman_fmt_sel_e[3] = (!i[22]&i[20]&!i[11]&i[9]&!i[7]&!i[6]) | (i[23]&!i[22]
    &!i[12]&!i[11]&!i[10]&i[5]) | (!i[22]&i[19]&!i[9]&i[5]) | (!i[22]
    &i[20]&i[11]&i[10]&i[5]) | (!i[22]&i[20]&!i[8]&i[7]&!i[6]&i[5]) | (
    !i[22]&i[20]&i[11]&i[6]&i[5]) | (!i[22]&i[20]&!i[12]&!i[8]&!i[7]&i[5]);

assign aman_fmt_sel_e[2] = (!i[22]&i[19]&i[9]&i[5]) | (i[23]&!i[22]&!i[20]&!i[19]
    &!i[12]&i[11]&i[5]);

assign aman_fmt_sel_e[1] = (!i[22]&i[19]&i[9]&i[5]) | (i[23]&!i[22]&!i[20]&!i[19]
    &!i[12]&i[11]&i[5]);

assign aman_fmt_sel_e[0] = (!i[22]&i[19]&i[9]&!i[5]) | (i[23]&!i[22]&!i[20]
    &!i[19]&!i[12]&i[11]&!i[5]);

// assign bman_fmt_sel_e[4] = (!i[6]&!i[5]) | (!i[12]&!i[11]&!i[10]) | (i[22]) | (
//     i[19]&!i[9]) | (i[20]) | (!i[23]);

assign bman_fmt_sel_e[3] = (!i[22]&i[20]&!i[8]&!i[7]&i[6]&i[5]) | (i[23]&!i[22]
    &i[12]&i[11]&!i[6]&!i[5]) | (!i[22]&i[20]&!i[8]&i[7]&!i[6]&i[5]) | (
    !i[22]&i[20]&!i[11]&i[9]&i[8]&!i[7]&!i[6]) | (i[23]&!i[22]&!i[12]
    &!i[11]&!i[10]&i[5]) | (!i[22]&i[19]&!i[9]&i[5]) | (!i[22]&i[20]
    &i[11]&i[5]);

assign bman_fmt_sel_e[2] = (!i[22]&i[19]&i[9]&i[5]) | (i[23]&!i[22]&!i[20]&!i[19]
    &i[12]&i[5]) | (i[23]&!i[22]&!i[20]&i[10]&!i[7]&i[5]) | (i[23]&!i[22]
    &!i[20]&!i[19]&i[11]&i[5]);

assign bman_fmt_sel_e[1] = (!i[22]&i[19]&i[9]&i[5]) | (i[23]&!i[22]&!i[20]&!i[19]
    &i[12]&i[5]) | (i[23]&!i[22]&!i[20]&i[10]&!i[7]&i[5]) | (i[23]&!i[22]
    &!i[20]&!i[19]&i[11]&i[5]);

assign bman_fmt_sel_e[0] = (!i[22]&i[19]&i[9]&!i[5]) | (i[23]&!i[22]&!i[20]
    &i[10]&!i[7]&!i[5]) | (i[23]&!i[22]&!i[19]&i[12]&i[6]) | (i[23]&!i[22]
    &!i[20]&!i[19]&i[11]&i[6]);

assign aexp_fmt_sel_e[6] = (!i[6]);

assign aexp_fmt_sel_e[5] = (!i[11]&i[6]);

assign aexp_fmt_sel_e[4] = (!i[11]&i[5]);

assign aexp_fmt_sel_e[3] = (!i[12]);

assign aexp_fmt_sel_e[2] = (!i[12]&i[5]);

assign aexp_fmt_sel_e[1] = (!i[12]&i[5]);

assign aexp_fmt_sel_e[0] = (i[12]&i[7]&i[6]) | (i[12]&i[8]&i[5]) | (i[22]) | (
    i[19]&!i[9]) | (i[20]) | (!i[12]&!i[11]) | (!i[23]);

assign bexp_fmt_sel_e[2] = (i[5]);

assign bexp_fmt_sel_e[1] = (i[5]);

assign bexp_fmt_sel_e[0] = (!i[6]&!i[5]) | (!i[12]&!i[11]&!i[10]) | (i[22]) | (
    i[19]&!i[9]) | (i[20]) | (!i[23]);

assign fpx_itype_e[2] = (!i[22]&i[19]&i[9]) | (i[23]&i[20]&!i[11]&i[9]&!i[7]
    &!i[6]) | (i[23]&i[20]&!i[11]&i[9]&!i[8]) | (i[23]&!i[22]&!i[20]
    &!i[12]&i[11]&i[8]) | (!i[23]&i[19]) | (i[23]&!i[22]&!i[19]&!i[11]
    &i[10]&!i[9]) | (!i[24]);

assign fpx_itype_e[1] = (i[23]&!i[22]&!i[20]&!i[11]&i[10]&!i[7]) | (i[23]&!i[22]
    &i[12]&!i[6]&!i[5]) | (i[23]&!i[22]&!i[20]&!i[19]&i[12]&!i[8]&!i[7]) | (
    !i[23]&i[21]&i[19]) | (i[23]&!i[22]&!i[20]&i[8]&i[7]) | (!i[24]&i[21]);

assign fpx_itype_e[0] = (i[23]&!i[22]&!i[19]&i[12]&i[7]) | (!i[22]&i[20]&!i[11]
    &i[9]&!i[7]&!i[6]) | (i[23]&!i[22]&i[12]&!i[6]&!i[5]) | (!i[22]&i[20]
    &!i[11]&i[9]&!i[8]) | (i[23]&!i[22]&!i[20]&i[10]&!i[7]) | (i[23]
    &!i[22]&!i[20]&i[11]&i[8]&!i[7]) | (!i[21]);

assign fpx_dtype_e[2] = (!i[20]&!i[11]&!i[8]&!i[7]) | (!i[22]&i[10]&i[9]) | (
    !i[23]&!i[20]) | (i[22]&!i[20]) | (!i[21]);

assign fpx_dtype_e[1] = (i[23]&!i[22]&!i[19]&!i[10]&i[9]) | (i[22]&i[21]&i[20]) | (
    i[21]&i[20]&!i[9]);

assign fpx_dtype_e[0] = (!i[22]&i[20]&!i[9]&i[7]) | (i[23]&!i[22]&i[12]&i[11]
    &!i[7]) | (i[23]&!i[22]&!i[12]&!i[10]&i[6]) | (i[23]&!i[22]&!i[20]
    &i[8]&!i[5]) | (i[22]&i[21]&i[20]) | (i[23]&!i[22]&i[11]&i[10]);

assign fpx_stype_e[1] = (!i[6]&!i[5]);

assign fpx_stype_e[0] = (!i[11]&!i[5]) | (i[6]);

assign fpx_sign_instr_e = (i[23]&!i[22]&!i[19]&!i[12]&!i[10]&i[7]);

assign fpx_rnd_trunc_e = (i[12]&!i[8]&!i[7]) | (!i[12]&!i[11]&!i[10]) | (i[22]) | (
    i[19]) | (i[20]) | (!i[23]);

assign fpx_mulscc_e = (!i[23]&!i[22]);

assign fpx_saverestore_e = (i[23]&i[22]&!i[20]);

assign fpx_int_cc_vld_e = (!i[23]&!i[22]) | (!i[24]&i[23]);

assign fpx_fmul8x16_e = (!i[22]&i[20]&!i[11]&i[9]&!i[8]&!i[7]&!i[6]);

assign fpx_fmul8x16au_e = (!i[22]&i[20]&!i[11]&!i[8]&!i[7]&i[6]&i[5]);

assign fpx_fmul8x16al_e = (!i[22]&i[20]&!i[11]&i[9]&!i[8]&i[7]&!i[6]);

assign fpx_fmul8sux16_e = (!i[22]&i[20]&!i[11]&i[9]&!i[8]&!i[5]);

assign fpx_fmul8ulx16_e = (!i[22]&i[20]&!i[11]&i[7]&i[6]&i[5]);

assign fpx_fmuld8sux16_e = (!i[22]&i[20]&!i[11]&i[9]&!i[6]&!i[5]);

assign fpx_fmuld8ulx16_e = (!i[22]&i[20]&!i[11]&i[8]&!i[7]&!i[6]&i[5]);

assign fpx_nv_vld_e = (!i[22]&i[19]&i[9]) | (i[23]&!i[22]&!i[20]&i[10]&!i[7]) | (
    i[23]&!i[22]&!i[20]&!i[19]&i[11]&i[6]) | (i[23]&!i[22]&!i[20]&!i[19]
    &i[11]&i[5]) | (i[23]&!i[22]&!i[20]&!i[19]&i[12]&!i[8]&!i[7]);

assign fpx_of_vld_e = (i[23]&!i[22]&!i[20]&!i[19]&!i[12]&i[11]&!i[10]) | (i[23]
    &!i[22]&!i[20]&!i[19]&i[11]&!i[9]&i[6]);

assign fpx_uf_vld_e = (i[23]&!i[22]&!i[20]&!i[19]&!i[12]&i[11]&!i[10]) | (i[23]
    &!i[22]&!i[20]&!i[19]&i[11]&!i[9]&i[6]);

assign fpx_dz_vld_e = (i[23]&!i[22]&!i[20]&i[8]&i[7]);

assign fpx_nx_vld_e = (i[23]&!i[22]&i[12]&i[8]&i[5]) | (i[23]&!i[22]&!i[20]
    &i[10]&!i[7]) | (i[23]&!i[22]&!i[20]&!i[19]&i[12]&!i[11]) | (i[23]
    &!i[22]&!i[20]&!i[19]&i[11]&!i[8]) | (i[23]&!i[22]&!i[20]&!i[12]
    &i[11]&i[8]);

assign fpx_unfin_vld_e = (i[23]&!i[22]&!i[20]&i[10]&!i[7]) | (i[23]&!i[22]&!i[20]
    &!i[19]&i[11]&i[6]) | (i[23]&!i[22]&!i[20]&!i[19]&i[12]&!i[8]&!i[7]) | (
    i[23]&!i[22]&!i[20]&!i[19]&i[11]&i[5]);

assign fgx_mvcond_e = (!i[22]&i[19]&!i[9]);

assign fgx_mvucond_e = (i[23]&!i[22]&!i[19]&!i[12]&!i[11]&!i[10]&!i[8]&!i[7]);

assign fgx_abs_e = (i[23]&!i[22]&!i[12]&!i[11]&!i[10]&i[8]);

assign fgx_neg_e = (i[23]&!i[22]&!i[12]&!i[11]&!i[10]&i[7]);

assign fgx_logical_e = (!i[22]&i[20]&i[11]&i[10]);

assign fgx_expand_e = (!i[22]&i[20]&!i[10]&i[8]&!i[6]&i[5]);

assign fgx_merge_e = (!i[22]&i[20]&!i[10]&i[8]&i[6]);

assign fgx_align_e = (!i[22]&i[20]&!i[10]&i[8]&!i[7]&!i[5]);

assign fgx_shuffle_e = (!i[22]&i[20]&!i[10]&i[8]&i[7]&!i[5]);

assign fgx_pack16_e = (!i[22]&i[20]&!i[11]&i[8]&i[6]&i[5]);

assign fgx_pack32_e = (!i[22]&i[20]&!i[11]&i[9]&!i[7]&i[6]&!i[5]);

assign fgx_packfix_e = (!i[22]&i[20]&!i[11]&i[8]&i[7]&i[5]);

assign fgx_pdist_e = (!i[22]&i[20]&!i[11]&i[9]&i[8]&i[7]&!i[5]);

assign fgx_popc_e = (i[24]&i[22]&i[20]);

assign fgx_siam_e = (!i[22]&i[20]&i[12]);

assign fpx_itype_mul_e = (!i[22]&i[20]&!i[11]&i[9]&!i[7]&!i[6]) | (i[23]&!i[22]
    &!i[20]&!i[12]&i[11]&i[8]&!i[7]) | (!i[22]&i[20]&!i[11]&i[9]&!i[8]) | (
    !i[21]);

assign fpx_itype_div_e = (i[23]&!i[22]&!i[20]&!i[11]&i[10]&!i[7]) | (!i[23]
    &i[21]&i[19]) | (i[23]&!i[22]&!i[20]&i[8]&i[7]) | (!i[24]&i[21]);

assign fgx_instr_e = (i[24]&i[22]&i[20]) | (!i[22]&i[20]&i[9]&i[8]&i[7]) | (
    !i[22]&i[20]&i[9]&i[8]&i[6]) | (i[23]&!i[22]&!i[12]&!i[11]&!i[10]) | (
    !i[22]&i[20]&i[11]&i[10]) | (!i[22]&i[20]&!i[10]&!i[9]) | (!i[22]
    &i[19]&!i[9]);

// ------------------------------------
// End auto/program generated code
// ------------------------------------

// For single source (or no source) fgu ops that read frf
// ensure that unneeded frf read port isn't enabled by DEC
// Note:
// dec_spu_grant_d, dec_exu_src_vld_d have no frf source
// dec_frf_store_d, dec_fsr_store_d   have rs2 only
//
// rs1 only: FSRC1{s}, FNOT1{s}
// rs2 only: FABS(s,d), FiTO(s,d), FMOV(s,d), FMOV(s,d)cc, FMOV(s,d)r, FNEG(s,d), FSQRT(s,d), F(s,d)TOi,
//           F(s,d)TO(d,s), F(s,d)TOx, FxTO(s,d), FSRC2{s}, FNOT2{s}, FEXPAND, FPACK16, FPACKFIX, PDIST(beat2)
// no frf source: FZERO{s}, FONE{s}, SIAM
//
// 0in custom -fire ( dec_fgu_valid_e & r2_vld_e & ((fgx_logical_e & (opf_e[7:1]==7'b0111010)) | (fgx_logical_e & (opf_e[7:1]==7'b0110101)) )) -message "Invalid FRF rs2 read enable"
//
// 0in custom -fire ( dec_fgu_valid_e & r1_vld_e & (fgx_abs_e | fgx_neg_e | fgx_mvcond_e | fgx_mvucond_e | (fpx_itype_e[2:0]==3'b001) | (fpx_itype_e[2:0]==3'b010) | (fpx_itype_e[2:0]==3'b011) | (fpx_itype_e[2:0]==3'b111) | fgx_expand_e | fgx_pack16_e | fgx_packfix_e | (fgx_logical_e & (opf_e[7:1]==7'b0111100)) | (fgx_logical_e & (opf_e[7:1]==7'b0110011)) )) -message "Invalid FRF rs1 read enable"
//
// 0in custom -fire ($0in_delay(fac_fgx_pdist_fx1,1) & dec_valid_fx2 & $0in_delay(r1_vld_e,1)) -message "Invalid FRF rs1 read enable during PDIST 2nd beat"
//
// 0in custom -fire ( dec_fgu_valid_e & (r1_vld_e | r2_vld_e) & ( fgx_siam_e | (fgx_logical_e & (opf_e[7:1]==7'b0110000)) | (fgx_logical_e & (opf_e[7:1]==7'b0111111)) )) -message "Invalid FRF rs1 or rs2 read enable"
//
// 0in custom -fire (exu_w_vld_e & dec_fgu_valid_e & (r1_vld_e | r2_vld_e)) -message "Invalid FRF read enable during EXU op"
//
// 0in custom -fire (spu_grant_e & (r1_vld_e | r2_vld_e)) -message "Invalid FRF read enable during SPU op"

assign  fac_exu_src_e   = exu_w_vld_e & ~mbist_run_1f;

assign  q_fgx_pdist_e = fgx_pdist_e & fgu_decode_e;  // pdist 2nd beat has fgu_decode_e=1'b0

assign  fst_fmt_sel_e[0] = frf_store_e &  r2_odd32b_e & fgu_decode_e;  // pwr mgmt: aomux free zeros
assign  fst_fmt_sel_e[1] = frf_store_e & ~r2_odd32b_e & fgu_decode_e;  // pwr mgmt: aomux free zeros
assign  fst_fmt_sel_e[2] = fsr_store_e & ~r2_32b_e    & fgu_decode_e;  // pwr mgmt: aomux free zeros
assign  fst_fmt_sel_e[3] = fsr_store_e &  r2_32b_e    & fgu_decode_e;  // pwr mgmt: aomux free zeros

// odd address and store handling equations
// these equations use predecode signals to qualify the auto/program generated format selects

assign  q_aman_fmt_sel_e[1] = aman_fmt_sel_e[1] &  r1_odd32b_e;
assign  q_aman_fmt_sel_e[2] = aman_fmt_sel_e[2] & ~r1_odd32b_e;
assign  q_aman_fmt_sel_e[3] = aman_fmt_sel_e[3] &  r1_odd32b_e;
assign  q_aman_fmt_sel_e[4] = aman_fmt_sel_e[4] & ~r1_odd32b_e;

assign  q_bman_fmt_sel_e[0] =
   fgu_decode_e &  // pdist 2nd beat has fgu_decode_e=1'b0
   bman_fmt_sel_e[0];

assign  q_bman_fmt_sel_e[1] =
   fgu_decode_e &  // pdist 2nd beat has fgu_decode_e=1'b0
   bman_fmt_sel_e[1] &  r2_odd32b_e;

assign  q_bman_fmt_sel_e[2] =
   fgu_decode_e &  // pdist 2nd beat has fgu_decode_e=1'b0
   bman_fmt_sel_e[2] & ~r2_odd32b_e;

assign  q_bman_fmt_sel_e[3] =
   fgu_decode_e &  // pdist 2nd beat has fgu_decode_e=1'b0
   bman_fmt_sel_e[3] &  r2_odd32b_e;

assign  fac_aman_fmt_sel_e[4:0] = {q_aman_fmt_sel_e[4:1], aman_fmt_sel_e[0]};
assign  fac_bman_fmt_sel_e[3:0] =  q_bman_fmt_sel_e[3:0];
assign  fac_bman_fmt_sel_e[4]   = ~(|fac_bman_fmt_sel_e[3:0]);

assign  q_aexp_fmt_sel_e[1] = aexp_fmt_sel_e[1] & r1_odd32b_e;
assign  q_bexp_fmt_sel_e[1] = bexp_fmt_sel_e[1] & r2_odd32b_e;

assign    aexp_fmt_sel_e[7] = (fpx_itype_e[2:0] == 3'b001);        // FdTOs

assign  q_aexp_fmt_sel_e[8] =
  aexp_fmt_sel_e[1] & r1_odd32b_e & (opf_e[6:5] == 2'b11);         // FsMULd

assign    aexp_fmt_sel_e[9] =
  aexp_fmt_sel_e[2]               & (opf_e[6:5] == 2'b11);         // FsMULd

assign  fac_aexp_fmt_sel_e[9:0] = 
  {  aexp_fmt_sel_e[9],
   q_aexp_fmt_sel_e[8],
     aexp_fmt_sel_e[7:2],
   q_aexp_fmt_sel_e[1],
     aexp_fmt_sel_e[0]   };

assign  q_bexp_fmt_sel_e[3] =
  bexp_fmt_sel_e[1] & r2_odd32b_e & (fpx_itype_e[2:0] == 3'b110);  // FDIV

assign    bexp_fmt_sel_e[4] =
  bexp_fmt_sel_e[2]               & (fpx_itype_e[2:0] == 3'b110);  // FDIV

assign    bexp_fmt_sel_e[5] =       (fpx_itype_e[2:0] == 3'b110);  // FDIV

assign    bexp_fmt_sel_e[6] =
  bexp_fmt_sel_e[1] & r2_odd32b_e & (opf_e[6:5] == 2'b11);         // FsMULd

assign    bexp_fmt_sel_e[7] =
  bexp_fmt_sel_e[2]               & (opf_e[6:5] == 2'b11);         // FsMULd

assign  fac_bexp_fmt_sel_e[7:0] = 
  {  bexp_fmt_sel_e[7:4],
   q_bexp_fmt_sel_e[3],
     bexp_fmt_sel_e[2],
   q_bexp_fmt_sel_e[1],
     bexp_fmt_sel_e[0]   };

assign  fpx_sp_dest_e =
  (fpx_dtype_e[2:0] == 3'b000) |  // sp
  (fpx_dtype_e[2:0] == 3'b011) ;  // 32-bit

assign  q_w1_vld_e[0] = w1_vld_e & (~w1_32b_e | (w1_32b_e &  w1_odd32b_e));
assign  q_w1_vld_e[1] = w1_vld_e & (~w1_32b_e | (w1_32b_e & ~w1_odd32b_e));

// for FCMP: w1_addr_e[4]=cc[0], w1_addr_e[0]=cc[1]
assign  cc_target_e[1:0] = {w1_addr_e[0], w1_addr_e[4]};

// must later clear fcc_vld if (nv & TEM) | flush

assign  pre_fcc_vld_e[3] =
  dec_fgu_valid_e &
  (cc_target_e[1:0] == 2'b11)  &
  (fpx_itype_e[2:0] == 3'b100) & (fpx_dtype_e[2:1] == 2'b00);          // FCMP,FCMPE

assign  pre_fcc_vld_e[2] =
  dec_fgu_valid_e &
  (cc_target_e[1:0] == 2'b10)  &
  (fpx_itype_e[2:0] == 3'b100) & (fpx_dtype_e[2:1] == 2'b00);          // FCMP,FCMPE

assign  pre_fcc_vld_e[1] =
  dec_fgu_valid_e &
  (cc_target_e[1:0] == 2'b01)  &
  (fpx_itype_e[2:0] == 3'b100) & (fpx_dtype_e[2:1] == 2'b00);          // FCMP,FCMPE

assign  pre_fcc_vld_e[0] =
  dec_fgu_valid_e &
  (cc_target_e[1:0] == 2'b00)  & 
  (fpx_itype_e[2:0] == 3'b100) & (fpx_dtype_e[2:1] == 2'b00);          // FCMP,FCMPE

assign  i_fsr_w2_vld_fb[0] =                                           // load FSR 32b
  lsu_fgu_fsr_load_b &  lsu_fgu_fld_32b_b;

assign  i_fsr_w2_vld_fb[1] =                                           // load FSR 64b
  lsu_fgu_fsr_load_b & ~lsu_fgu_fld_32b_b;

assign  i_fsr_w2_vld_fb[2] =
  div_finish_fltd_fb | div_finish_flts_fb;                             // div/sqrt, load FSR doesn't update ftt

// 0in custom -fire ((lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & div_engine_busy_e & (lsu_fgu_fld_tid_b[2:0]==div_tid_in_e[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & (div_finish_fltd_fb | div_finish_flts_fb) & (lsu_fgu_fld_tid_b[2:0]==fac_fpd_tid_fb[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & dec_fgu_valid_e & (lsu_fgu_fld_tid_b[2:0]==fac_tid_e[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & fac_dec_valid_fx1 & (lsu_fgu_fld_tid_b[2:0]==tid_fx1[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & dec_valid_fx2 & (lsu_fgu_fld_tid_b[2:0]==tid_fx2[2:0])),1))) | (lsu_fgu_fld_vld_w & ($0in_delay((lsu_fgu_fsr_load_b & dec_valid_fx3 & (lsu_fgu_fld_tid_b[2:0]==tid_fx3[2:0])),1)))) -message "LDFSR collision with FPop"

assign  fsr_w1_qvld_fb =  // other FPop w1 or fcmp with trap, not unfin
  ~fpc_fpx_unfin_fb &
  (fsr_w1_vld_fb[0] | (pre_fcc_vld_fb & ~(|fcc_vld_fb[3:0])));

assign  fsr_w2_qvld_fb =
  ~fpc_fpd_unfin_fb &
   i_fsr_w2_vld_fb[2];

// ----------------
// FSR tid0 selects
// ----------------

assign  fsr0_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd0);

assign  fsr0_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd0);

assign  fsr0_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd0)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd0)) ;

assign  fsr0_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd0))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd0))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd0))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid1 selects
// ----------------

assign  fsr1_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd1);

assign  fsr1_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd1);

assign  fsr1_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd1)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd1)) ;

assign  fsr1_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd1))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd1))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd1))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid2 selects
// ----------------

assign  fsr2_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd2);

assign  fsr2_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd2);

assign  fsr2_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd2)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd2)) ;

assign  fsr2_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd2))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd2))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd2))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid3 selects
// ----------------

assign  fsr3_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd3);

assign  fsr3_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd3);

assign  fsr3_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd3)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd3)) ;

assign  fsr3_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd3))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd3))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd3))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid4 selects
// ----------------

assign  fsr4_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd4);

assign  fsr4_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd4);

assign  fsr4_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd4)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd4)) ;

assign  fsr4_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd4))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd4))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd4))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid5 selects
// ----------------

assign  fsr5_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd5);

assign  fsr5_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd5);

assign  fsr5_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd5)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd5)) ;

assign  fsr5_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd5))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd5))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd5))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid6 selects
// ----------------

assign  fsr6_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd6);

assign  fsr6_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd6);

assign  fsr6_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd6)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd6)) ;

assign  fsr6_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd6))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd6))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd6))}} & 3'd7) ;  // other FPop FDIV/FSQRT

// ----------------
// FSR tid7 selects
// ----------------

assign  fsr7_sel_fb[5] =
      i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd7);

assign  fsr7_sel_fb[4] =    // select w1 {ftt,aexc,cexc}, not fpd {ftt,aexc,cexc}
  (( |fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd7);

assign  fsr7_sel_fb[3] =    // enable flop
  (   i_fsr_w2_vld_fb[2]                    & (fac_fpd_tid_fb[2:0]    == 3'd7)) |
  (((|fsr_w1_vld_fb[1:0]) | pre_fcc_vld_fb) & (fac_w1_tid_fb[2:0]     == 3'd7)) ;

assign  fsr7_sel_fb[2:0] =
  ({3{(fsr_w1_vld_fb[1] & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd2) |  // ST(X)FSR
  ({3{(fpc_fpx_unfin_fb & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd2) |  // unfin w1
  ({3{(fpc_fpd_unfin_fb & (fac_fpd_tid_fb[2:0]    == 3'd7))}} & 3'd2) |  // unfin FDIV/FSQRT
  ({3{(fcc_vld_fb[0]    & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd3) |  // FCMP(E) fcc0
  ({3{(fcc_vld_fb[1]    & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd4) |  // FCMP(E) fcc1
  ({3{(fcc_vld_fb[2]    & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd5) |  // FCMP(E) fcc2
  ({3{(fcc_vld_fb[3]    & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd6) |  // FCMP(E) fcc3
  ({3{(fsr_w1_qvld_fb   & (fac_w1_tid_fb[2:0]     == 3'd7))}} & 3'd7) |  // other FPop w1
  ({3{(fsr_w2_qvld_fb   & (fac_fpd_tid_fb[2:0]    == 3'd7))}} & 3'd7) ;  // other FPop FDIV/FSQRT

assign  q_r1_vld_e[0] = r1_vld_e & (~r1_32b_e | (r1_32b_e &  r1_odd32b_e));
assign  q_r1_vld_e[1] = r1_vld_e & (~r1_32b_e | (r1_32b_e & ~r1_odd32b_e));
assign  q_r2_vld_e[0] = r2_vld_e & (~r2_32b_e | (r2_32b_e &  r2_odd32b_e));
assign  q_r2_vld_e[1] = r2_vld_e & (~r2_32b_e | (r2_32b_e & ~r2_odd32b_e));

assign  fac_rs2_rotate_sel_e[0] =  // odd  FiTO(s,d)
  (fpx_itype_e[2:0] == 3'b011) & (fpx_stype_e[1:0] == 2'b10) &  r2_odd32b_e;

assign  fac_rs2_rotate_sel_e[1] =  // even FiTO(s,d)
  (fpx_itype_e[2:0] == 3'b011) & (fpx_stype_e[1:0] == 2'b10) & ~r2_odd32b_e;

assign  fac_rs2_rotate_sel_e[2] =  //      FiTO(s,d)
  (fpx_itype_e[2:0] == 3'b011) & (fpx_stype_e[1:0] == 2'b10);

assign  fac_rs2_rotate_sel_e[3] =  // odd
  ~fac_rs2_rotate_sel_e[2]                                   &  r2_odd32b_e;

assign  fac_rs2_rotate_sel_e[4] =  // even
  ~fac_rs2_rotate_sel_e[2]                                   & ~r2_odd32b_e;

assign  fac_i2f_sel_e[0] =         //      F(i,x)TO(s,d)
  (fpx_itype_e[2:0] == 3'b011);

assign  fac_i2f_sel_e[1] =         //     ~F(i,x)TO(s,d)
 ~(fpx_itype_e[2:0] == 3'b011);

// ------------------------------------
// Instructions which depend on appropriate steering
// of rs1/rs2 thru Mse/Mle:
//
// instr            desired behavior  default behavior
// ---------------------------------------------------
// F(i,x)TO(s,d)     rs2=Mse  (B<A)       ~(B<A) ??? <= rs1 is unknown
// F(s,d)TO(i,x)     rs2=Mse  (B<A)       ~(B<A) ??? <= rs1 is unknown
// MULScc            rs2=Mse  (B<A)       ~(B<A)
// SAVE              rs2=Mse  (B<A)       ~(B<A)
// RESTORE           rs2=Mse  (B<A)       ~(B<A)
// FPSUB{16,32}{s}   rs2=Mse  (B<A)       ~(B<A)
// F(s,d)TO(d,s)     rs2=Mle ~(B<A)       ~(B<A) ??? <= rs1 is unknown
// FADD(s,d)               src dependent             <= no action required
// FSUB(s,d)               src dependent             <= no action required
//
// These required for NaN steering only:
// FsMULd                  src dependent             <= no action required
// FMUL(s,d)               src dependent             <= no action required
// FDIV(s,d)               src dependent             <= no action required
// FSQRT(s,d)        rs2=Mle ~(B<A)       ~(B<A) ??? <= rs1 is unknown
//
// ------------------------------------

assign  force_swap_blta_e =
  (fpx_itype_e[2:0] == 3'b010) |                     // F(s,d)TO(i,x)
  (fpx_itype_e[2:0] == 3'b011) |                     // F(i,x)TO(s,d)
  (fpx_mulscc_e              ) |                     // MULScc
  (fpx_saverestore_e         ) |                     // SAVE or RESTORE
  ((fpx_dtype_e[2:1] == 2'b01) & fpx_sign_instr_e);  // FPSUB{16,32}{s}

assign  force_noswap_blta_e =
  (fpx_itype_e[2:0] == 3'b001) |                     // F(s,d)TO(d,s)
  (fpx_itype_e[2:0] == 3'b111) ;                     // FSQRT(s,d)

// ------------------------------------
// FPY control
// ------------------------------------

// spu_fgu_fpy_ctl_d[6:0]:
//
//            [0]     [1]             [2]             [3]             [4]     [5]                       [6]
//            ---     ------------    --------------  -----------     -----   -----------------------   --------------------
// if == 1    XOR     Add Accum       Write Accum     2*(rs1*rs2)     >> 64   write MA result flop      bypass result to rs1
// if == 0    Int     No Add Accum    No Write Accum    (rs1*rs2)     >> 0    no write MA result flop   no bypass result

assign  xr_mode_e    =  spu_grant_e & spu_fpy_ctl_e[0];

assign  rs1_sel_e[0] = ~spu_grant_e & (fpx_fmul8sux16_e | fpx_fmuld8sux16_e);
assign  rs1_sel_e[1] = ~spu_grant_e & (fpx_fmul8x16_e   | fpx_fmul8x16au_e | fpx_fmul8x16al_e);
assign  rs1_sel_e[2] = ~spu_grant_e & (fpx_fmul8ulx16_e | fpx_fmuld8ulx16_e);
assign  rs1_sel_e[3] =  spu_grant_e & spu_fpy_ctl_e[6];
assign  rs1_sel_e[4] =  spu_grant_e;

assign  rs2_sel_e[0] = ~spu_grant_e & fpx_fmul8x16au_e;
assign  rs2_sel_e[1] = ~spu_grant_e & fpx_fmul8x16al_e;

assign  rs2_sel_e[2] =  // all 8x16
  ~spu_grant_e & 
  (fpx_fmul8x16_e   | fpx_fmul8x16au_e | fpx_fmul8x16al_e  |
   fpx_fmul8sux16_e | fpx_fmul8ulx16_e | fpx_fmuld8sux16_e | fpx_fmuld8ulx16_e);

assign  rs2_sel_e[3] =  spu_grant_e;

assign  rnd_8x16_e[0] =
  ~spu_grant_e &
  (fpx_fmul8x16_e   | fpx_fmul8x16au_e | fpx_fmul8x16al_e  | fpx_fmul8sux16_e);

assign  rnd_8x16_e[1] = ~spu_grant_e & fpx_fmul8ulx16_e;

assign  result_sel_e[0] =
  ~spu_grant_e &
  (fpx_fmul8x16_e   | fpx_fmul8x16au_e | fpx_fmul8x16al_e  |
   fpx_fmul8sux16_e);

assign  result_sel_e[1] = ~spu_grant_e & fpx_fmul8ulx16_e;
assign  result_sel_e[2] = ~spu_grant_e & fpx_fmuld8sux16_e;
assign  result_sel_e[3] = ~spu_grant_e & fpx_fmuld8ulx16_e;
assign  result_sel_e[4] =  spu_grant_e & spu_fpy_ctl_e[0] & spu_fpy_ctl_e[1];  // XOR mult w/ ACCUM
assign  result_sel_e[5] = ~spu_grant_e & (fpx_dtype_e[2:1] == 2'b00);          // dp or sp float

// ------------------------------------
// FPD control
// ------------------------------------

assign  div_valid_e =   // start div engine
  (~div_engine_busy_fx1 &
   (fpx_itype_e[2:1] == 2'b11) & dec_fgu_valid_e) |  // DEC  issued div/sqrt
  (~div_engine_busy_fx1 & divq_occupied_fx1 &        // divq issued div/sqrt
   ~(pre_div_flush_fx3 & ~div_dec_issue_fx3)    ) ;  //        and divq not flushed

assign  divq_valid_e =  // load divq or start div engine from divq
  ( div_engine_busy_fx1 &
   (fpx_itype_e[2:1] == 2'b11) & dec_fgu_valid_e) |  // divq load
  (~div_engine_busy_fx1 & divq_occupied_fx1 &        // divq issued div/sqrt
   ~(pre_div_flush_fx3 & ~div_dec_issue_fx3)    ) ;  //        and divq not flushed

assign  div_engine_busy_e =
  ( div_valid_e                                 ) |  // set   (DEC/divq issued div/sqrt)
  ((~div_finish_early &                              // clear (if finish)
						     // clear (if flush)
    ~fac_div_flush_fx3 ) & div_engine_busy_fx1  ) ;

// 0in assert_timer -var div_engine_busy_e -max 50 -message "Divide engine busy > 50 cycles"; custom -fire ((dec_fgu_decode_d & div_engine_busy_e & (dec_fgu_tid_d[2:0]==div_tid_in_e[2:0])) | (dec_fgu_decode_d & (div_finish_fltd_fb | div_finish_flts_fb) & (dec_fgu_tid_d[2:0]==fac_fpd_tid_fb[2:0]))) -message "Divide engine collision with other FPop"

assign  div_dec_issue_e  =  div_valid_e & ~divq_valid_e;
assign  div_divq_issue_e =  div_valid_e &  divq_valid_e;
assign  div_divq_load_e  = ~div_valid_e &  divq_valid_e;
assign  div_hold_e       = ~div_dec_issue_e & ~div_divq_issue_e;

assign  divq_occupied_e =
  ( div_engine_busy_fx1 &
   (fpx_itype_e[2:1] == 2'b11) & dec_fgu_valid_e) |  // set   (divq load)
  ((~div_divq_issue_e &                              // clear (if divq issued div/sqrt)
                                                     // clear (if flush divq)
    ~(pre_div_flush_fx3 & ~div_dec_issue_fx3)) & divq_occupied_fx1);

// 0in custom -fire ((dec_fgu_decode_d & divq_occupied_e & (dec_fgu_tid_d[2:0]==divq_tid_in_e[2:0]))) -message "Divide queue collision with other FPop"

// ------------
// capture data for instr that is entering the div engine
// ------------

assign  div_tid_in_e[2:0] =
  ( {3{div_dec_issue_e }} & fac_tid_e[2:0]        ) |  // load from DEC  issue
  ( {3{div_divq_issue_e}} & divq_tid_fx1[2:0]     ) |  // load from divq issue
  ( {3{div_hold_e      }} & div_tid_fx1[2:0]      ) ;  // hold

assign  div_irf_addr_in_e[4:0] =
  ( {5{div_dec_issue_e }} & irf_w_addr_e[4:0]     ) |  // load from DEC  issue
  ( {5{div_divq_issue_e}} & divq_irf_addr_fx1[4:0]) |  // load from divq issue
  ( {5{div_hold_e      }} & div_irf_addr_fx1[4:0] ) ;  // hold

assign  div_cc_vld_in_e =
  (    div_dec_issue_e    & fpx_int_cc_vld_e      ) |  // load from DEC  issue
  (    div_divq_issue_e   & divq_cc_vld_fx1       ) |  // load from divq issue
  (    div_hold_e         & div_cc_vld_fx1        ) ;  // hold

assign  div_odd32b_in_e =
  (    div_dec_issue_e    & w1_odd32b_e           ) |  // load from DEC  issue
  (    div_divq_issue_e   & divq_odd32b_fx1       ) |  // load from divq issue
  (    div_hold_e         & div_odd32b_fx1        ) ;  // hold

assign  div_32b_in_e =
  (    div_dec_issue_e    & w1_32b_e              ) |  // load from DEC  issue
  (    div_divq_issue_e   & divq_32b_fx1          ) |  // load from divq issue
  (    div_hold_e         & div_32b_fx1           ) ;  // hold

assign  div_frf_addr_in_e[4:0] =
  ( {5{div_dec_issue_e }} & w1_addr_e[4:0]        ) |  // load from DEC  issue
  ( {5{div_divq_issue_e}} & divq_frf_addr_fx1[4:0]) |  // load from divq issue
  ( {5{div_hold_e      }} & div_frf_addr_fx1[4:0] ) ;  // hold

// ------------
// capture data for instr that is entering the div queue
// ------------

assign  divq_tid_in_e[2:0] =
  ( {3{ div_divq_load_e}} & fac_tid_e[2:0]        ) |  // load from DEC  issue
  ( {3{~div_divq_load_e}} & divq_tid_fx1[2:0]     ) ;  // hold

assign  divq_irf_addr_in_e[4:0] =
  ( {5{ div_divq_load_e}} & irf_w_addr_e[4:0]     ) |  // load from DEC  issue
  ( {5{~div_divq_load_e}} & divq_irf_addr_fx1[4:0]) ;  // hold

assign  divq_cc_vld_in_e =
  (     div_divq_load_e   & fpx_int_cc_vld_e      ) |  // load from DEC  issue
  (    ~div_divq_load_e   & divq_cc_vld_fx1       ) ;  // hold

assign  divq_odd32b_in_e =
  (     div_divq_load_e   & w1_odd32b_e           ) |  // load from DEC  issue
  (    ~div_divq_load_e   & divq_odd32b_fx1       ) ;  // hold

assign  divq_32b_in_e =
  (     div_divq_load_e   & w1_32b_e              ) |  // load from DEC  issue
  (    ~div_divq_load_e   & divq_32b_fx1          ) ;  // hold

assign  divq_frf_addr_in_e[4:0] =
  ( {5{ div_divq_load_e}} & w1_addr_e[4:0]        ) |  // load from DEC  issue
  ( {5{~div_divq_load_e}} & divq_frf_addr_fx1[4:0]) ;  // hold

// ------------
// FDC captures and holds these controls in the div queue as needed
// ------------

assign  div_control_e[4] = fac_tid_e[2];

assign  div_control_e[3] = (fpx_itype_e[2:0] == 3'b111);  // sqrt

assign  div_control_e[2] =
  (fpx_dtype_e[2:0] == 3'b100) |
  (fpx_dtype_e[2:0] == 3'b011) ;                          // idiv (32/64b dest)

assign  div_control_e[1] =
  (fpx_dtype_e[2:0] == 3'b001) |
  (fpx_dtype_e[2:0] == 3'b100) ;                          // DP/64b dest

assign  div_control_e[0] =
  ((fpx_dtype_e[2:0] == 3'b011) & op3_e[0]) |             // sdiv  (32b dest)
  ((fpx_dtype_e[2:0] == 3'b100) & op3_e[5]) ;             // sdivx (64b dest)


// ----------------------------------------------------------------------------
//                               FX1 stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_128 fx1_00  (
  .scan_in(fx1_00_scanin),
  .scan_out(fx1_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({opf_e[4:1],
         dec_fgu_valid_e,
         fpx_itype_e[2:0],
         fpx_dtype_e[2:0],
         fpx_stype_e[1:0],
         fpx_itype_mul_e,
         fpx_sign_instr_e,
         fpx_rnd_trunc_e,
         fpx_mulscc_e,
         fpx_saverestore_e,
         fpx_int_cc_vld_e,
         fpx_nv_vld_e,
         fpx_of_vld_e,
         fpx_uf_vld_e,
         fpx_dz_vld_e,
         fpx_nx_vld_e,
         fpx_unfin_vld_e,
         fgx_mvcond_e,
         fgx_mvucond_e,
         fgx_abs_e,
         fgx_neg_e,
         fgx_logical_e,
         fgx_expand_e,
         fgx_merge_e,
         fgx_align_e,
         fgx_shuffle_e,
         fgx_pack16_e,
         fgx_pack32_e,
         fgx_packfix_e,
         q_fgx_pdist_e,
         fgx_popc_e,
         fgx_siam_e,
         fpx_sp_dest_e,
         rs1_sel_e[4:0],
         rs2_sel_e[3:0],
         rnd_8x16_e[1:0],
         result_sel_e[5:0],
         exu_w_vld_e,
         irf_w_addr_e[4:0],
         q_r1_vld_e[1:0],
         q_r2_vld_e[1:0],
         spu_grant_e,
         div_valid_e,
         divq_valid_e,
         divq_occupied_e,
         div_control_e[4:0],
         div_tid_in_e[2:0],
         div_irf_addr_in_e[4:0],
         div_frf_addr_in_e[4:0],
         div_cc_vld_in_e,
         div_odd32b_in_e,
         div_32b_in_e,
         divq_tid_in_e[2:0],
         divq_irf_addr_in_e[4:0],
         divq_frf_addr_in_e[4:0],
         divq_cc_vld_in_e,
         divq_odd32b_in_e,
         divq_32b_in_e,
         div_engine_busy_e,
         div_dec_issue_e,
         div_divq_issue_e,
         force_swap_blta_e,
         force_noswap_blta_e,
         fsr_store_e,
         xr_mode_e,
         spu_fpy_ctl_e[5:0],
         frf_store_e,
             fst_fmt_sel_e[3:0],
         fgu_decode_e}),
  .dout({opf_fx1[4:1],
         fac_dec_valid_fx1,
         fac_fpx_itype_fx1[2:0],
         fac_fpx_dtype_fx1[2:0],
         fac_fpx_stype_fx1[1:0],
             itype_mul_fx1,
         fac_fpx_sign_instr_fx1,
         fac_fpx_rnd_trunc_fx1,
         fac_fpx_mulscc_fx1,
         fac_fpx_saverestore_fx1,
         fpx_int_cc_vld_fx1,
         fac_fpx_nv_vld_fx1,
         fac_fpx_of_vld_fx1,
         fac_fpx_uf_vld_fx1,
         fac_fpx_dz_vld_fx1,
         fac_fpx_nx_vld_fx1,
         fac_fpx_unfin_vld_fx1,
         fgx_mvcond_fx1,
         fgx_mvucond_fx1,
         fgx_abs_fx1,
         fgx_neg_fx1,
         fgx_logical_fx1,
         fgx_expand_fx1,
         fgx_merge_fx1,
         fgx_align_fx1,
         fgx_shuffle_fx1,
         fgx_pack16_fx1,
         fgx_pack32_fx1,
         fgx_packfix_fx1,
         fac_fgx_pdist_fx1,
         fgx_popc_fx1,
         i_fgx_siam_fx1,
         fac_fpx_sp_dest_fx1,
         fac_rs1_sel_fx1[4:0],
         fac_rs2_sel_fx1[3:0],
         rnd_8x16_fx1[1:0],
         result_sel_fx1[5:0],
         i_exu_w_vld_fx1,
         irf_w_addr_fx1[4:0],
         fac_r1_vld_fx1[1:0],
         fac_r2_vld_fx1[1:0],
         spu_grant_fx1,
         fac_div_valid_fx1,
         fac_divq_valid_fx1,
         divq_occupied_fx1,
         fac_div_control_fx1[4:0],
         div_tid_fx1[2:0],
         div_irf_addr_fx1[4:0],
         div_frf_addr_fx1[4:0],
         div_cc_vld_fx1,
         div_odd32b_fx1,
         div_32b_fx1,
         divq_tid_fx1[2:0],
         divq_irf_addr_fx1[4:0],
         divq_frf_addr_fx1[4:0],
         divq_cc_vld_fx1,
         divq_odd32b_fx1,
         divq_32b_fx1,
         div_engine_busy_fx1,
         div_dec_issue_fx1,
         div_divq_issue_fx1,
         fac_force_swap_blta_fx1,
         fac_force_noswap_blta_fx1,
         fsr_store_fx1,
         fac_xr_mode_fx1,
         spu_fpy_ctl_fx1[5:0],
         frf_store_fx1,
         fac_fst_fmt_sel_fx1[3:0],
         fgu_decode_fx1}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_21 fx1_01  (
  .scan_in(fx1_01_scanin),
  .scan_out(fx1_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_addr_e[4:0],
        w1_32b_e,
        w1_odd32b_e,
        fac_tid_e[2:0],
        q_w1_vld_e[1:0],
        tlu_cerer_frf,
        tlu_ceter_pscce[7:0]}),
  .dout({w1_addr_fx1[4:0],
        w1_32b_fx1,
        fac_w1_odd32b_fx1,
        tid_fx1[2:0],
        q_w1_vld_fx1[1:0],
            cerer_frf_fx1,
            ceter_pscce_fx1[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_4 fx1_02  (
  .scan_in(fx1_02_scanin),
  .scan_out(fx1_02_scanout),
  .l1clk(l1clk_pm1),
  .din (pre_fcc_vld_e[3:0]  ),
  .dout(pre_fcc_vld_fx1[3:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fgx_instr_fx1 =  // note: this eq. doesn't include siam
      fgx_logical_fx1  |
      fgx_expand_fx1   |
      fgx_merge_fx1    |
      fgx_align_fx1    |
      fgx_shuffle_fx1  |
  fac_fgx_pdist_fx1    |
      fgx_pack_sel_fx1 |
      fgx_moves_fx1    |
      fgx_popc_fx1     ;

assign  fac_ecc_trap_en_fx1 =
  cerer_frf_fx1 &
  (((tid_fx1[2:0] == 3'd0) & ceter_pscce_fx1[0]) |
   ((tid_fx1[2:0] == 3'd1) & ceter_pscce_fx1[1]) |
   ((tid_fx1[2:0] == 3'd2) & ceter_pscce_fx1[2]) |
   ((tid_fx1[2:0] == 3'd3) & ceter_pscce_fx1[3]) |
   ((tid_fx1[2:0] == 3'd4) & ceter_pscce_fx1[4]) |
   ((tid_fx1[2:0] == 3'd5) & ceter_pscce_fx1[5]) |
   ((tid_fx1[2:0] == 3'd6) & ceter_pscce_fx1[6]) |
   ((tid_fx1[2:0] == 3'd7) & ceter_pscce_fx1[7])  );

assign  fgx_siam_fx1 = i_fgx_siam_fx1 & fac_dec_valid_fx1;

assign  fac_w1_vld_fx1[1:0] = q_w1_vld_fx1[1:0] & {2{fac_dec_valid_fx1}};

assign  exu_w_vld_fx1 =
  fac_dec_valid_fx1 &
  (fgx_popc_fx1            |                                   // popc
   fac_fpx_mulscc_fx1      |                                   // mulscc
   fac_fpx_saverestore_fx1 |                                   // save or restore
   ((fac_fpx_itype_fx1[2:0] == 3'b101) & i_exu_w_vld_fx1) |    // imul
   ((fac_fpx_itype_fx1[2:0] == 3'b100) &
    (fac_fpx_dtype_fx1[2:1] == 2'b01 )  )                  );  // vis fcmp

assign  fac_fcmpe_fx1 = opf_fx1[2];  // FCMPE, not FCMP

assign  fac_fpx_sp_src_fx1 =
  ((fac_fpx_dtype_fx1[2:0] == 3'b000) &
   ~((fac_fpx_itype_fx1[2:0] == 3'b001) &     // ~FdTOs
     (fac_fpx_stype_fx1[1:0] == 2'b01 )) ) |
  ((fac_fpx_itype_fx1[2:0] == 3'b001) &
   (fac_fpx_dtype_fx1[2:0] == 3'b001)    ) |  //  FsTOd
  ((fac_fpx_itype_fx1[2:0] == 3'b101) &
   (fac_fpx_stype_fx1[1:0] == 2'b00 ) &
   (fac_fpx_dtype_fx1[2:0] == 3'b001)    ) |  //  FsMULd
  ((fac_fpx_itype_fx1[2:0] == 3'b010) &
   (fac_fpx_stype_fx1[1:0] == 2'b00 )    ) ;  //  FsTO(i,x)

assign  fgx_moves_fx1    = fgx_mvcond_fx1 | fgx_mvucond_fx1 | fgx_abs_fx1 | fgx_neg_fx1;
assign  fgx_pack_sel_fx1 = fgx_pack16_fx1 | fgx_pack32_fx1 | fgx_packfix_fx1;


// ------------------------------------
// FPD control
// ------------------------------------

assign  fac_aux_cin_fx1 = ~(fac_fpx_itype_fx1[2:0] == 3'b110);  // ~div

assign  q_div_default_res_fx3 = 
   div_default_res_fx3 &
  ~dec_flush_fx3       &
  ~fac_tlu_flush_fx3   ;

assign  div_finish_early =
  fdc_finish_flts_early | fdc_finish_fltd_early | fdc_finish_int_early;

assign  divide_completion_fx1[0] =
  ((div_tid_fx1[2:0] == 3'b000) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b000) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[1] =	  
  ((div_tid_fx1[2:0] == 3'b001) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b001) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[2] =	  
  ((div_tid_fx1[2:0] == 3'b010) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b010) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[3] =	  
  ((div_tid_fx1[2:0] == 3'b011) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b011) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[4] =	  
  ((div_tid_fx1[2:0] == 3'b100) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b100) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[5] =	  
  ((div_tid_fx1[2:0] == 3'b101) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b101) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[6] =	  
  ((div_tid_fx1[2:0] == 3'b110) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b110) & q_div_default_res_fx3) ;
				  
assign  divide_completion_fx1[7] =	  
  ((div_tid_fx1[2:0] == 3'b111) & div_finish_early     ) |
  ((    tid_fx3[2:0] == 3'b111) & q_div_default_res_fx3) ;


// ----------------------------------------------------------------------------
//                               FX2 stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_16 fx2_00  (
  .scan_in(fx2_00_scanin),
  .scan_out(fx2_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_addr_fx1[4:0],
         w1_32b_fx1,
         fac_w1_odd32b_fx1,
         tid_fx1[2:0],
         exu_w_vld_fx1,
         irf_w_addr_fx1[4:0]}),
  .dout({w1_addr_fx2[4:0],
         w1_32b_fx2,
         w1_odd32b_fx2,
         tid_fx2[2:0],
         i_exu_w_vld_fx2,
         irf_w_addr_fx2[4:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_60 fx2_01  (
  .scan_in(fx2_01_scanin),
  .scan_out(fx2_01_scanout),
  .l1clk(l1clk_pm1),
  .din ({opf_fx1[4:1],
         fgx_mvcond_fx1,
         fgx_mvucond_fx1,
         fgx_abs_fx1,
         fgx_neg_fx1,
         fgx_logical_fx1,
         fgx_expand_fx1,
         fgx_merge_fx1,
         fgx_align_fx1,
         fgx_shuffle_fx1,
         fgx_pack16_fx1,
         fgx_pack32_fx1,
         fgx_packfix_fx1,
         fgx_popc_fx1,
         fgx_siam_fx1,
         fgx_pack_sel_fx1,
         rnd_8x16_fx1[1:0],
         result_sel_fx1[5:0],
         divide_completion_fx1[7:0],
         fpx_int_cc_vld_fx1,
         dec_flush_f1,
         pre_fcc_vld_fx1[3:0],
         div_dec_issue_fx1,
         div_divq_issue_fx1,
         fac_dec_valid_fx1,
         fac_fpx_itype_fx1[2:0],
         itype_mul_fx1,
             fsr_store_fx1,
         spu_grant_fx1,
         spu_fpy_ctl_fx1[5:0],
         fac_rs2_sel_fx1[2],
         fgx_instr_fx1,
         div_engine_busy_fx1,
         frf_store_fx1}),
  .dout({fac_opf_fx2[4:1],
         fac_fgx_mvcond_fx2,
         fac_fgx_mvucond_fx2,
         fac_fgx_abs_fx2,
         fac_fgx_neg_fx2,
         fac_fgx_logical_fx2,
         fac_fgx_expand_fx2,
         fac_fgx_merge_fx2,
         fac_fgx_align_fx2,
         fac_fgx_shuffle_fx2,
         fac_fgx_pack16_fx2,
         fac_fgx_pack32_fx2,
         fac_fgx_packfix_fx2,
         fac_fgx_popc_fx2,
         fac_fgx_siam_fx2,
         fac_fgx_pack_sel_fx2,
         rnd_8x16_fx2[1:0],
         result_sel_fx2[5:0],
         fgu_divide_completion[7:0],
         fpx_int_cc_vld_fx2,
         dec_flush_fx2,
         i_pre_fcc_vld_fx2[3:0],
         div_dec_issue_fx2,
         div_divq_issue_fx2,
         dec_valid_fx2,
                 itype_fx2[2:0],
         itype_mul_fx2,
         fac_fsr_store_fx2,
         spu_grant_fx2,
         spu_fpy_ctl_fx2[5:0],
         rs2_sel_fx2_b2,
         fgx_instr_fx2,
         div_engine_busy_fx2,
         frf_store_fx2}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_3 fx2_02  (
  .scan_in(fx2_02_scanin),
  .scan_out(fx2_02_scanout),
  .l1clk(l1clk_pm2),
  .din ({exu_fgu_flush_m,           // requires free running clk
         exu_fgu_gsr_vld_m[1:0]}),  // requires free running clk
  .dout({exu_flush_fx2,
         fac_gsr_w_vld_fx2[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fac_gsr_asr_tid_fx2[2:0] = rng_wr_tid_3f[2:0];
assign  fac_tid_fx2[2:0]         = tid_fx2[2:0];
assign  gsr_w_vld_fx2 = |fac_gsr_w_vld_fx2[1:0];

assign  dec_valid_noflush_fx2 =
  dec_valid_fx2  &
  ~dec_flush_fx2 ;

// 0in custom -fire ($0in_delay(fac_fgx_pdist_fx1,1) & dec_valid_fx2 & fac_dec_valid_fx1) -message "PDIST 2nd beat collision with other FPop"

assign  exu_w_vld_fx2 =
  i_exu_w_vld_fx2 &
  ~dec_flush_fx2  &
  ~exu_flush_fx2  &
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  fac_pre_fcc_vld_fx2[3] =
  i_pre_fcc_vld_fx2[3] &
  ~dec_flush_fx2       &
  ~exu_flush_fx2       &
  ~dec_flush_f2        &
//~tlu_flush_fgu_b     &
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  fac_pre_fcc_vld_fx2[2] =
  i_pre_fcc_vld_fx2[2] &
  ~dec_flush_fx2       &
  ~exu_flush_fx2       &
  ~dec_flush_f2        &
//~tlu_flush_fgu_b     &
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  fac_pre_fcc_vld_fx2[1] =
  i_pre_fcc_vld_fx2[1] &
  ~dec_flush_fx2       &
  ~exu_flush_fx2       &
  ~dec_flush_f2        &
//~tlu_flush_fgu_b     &
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  fac_pre_fcc_vld_fx2[0] =
  i_pre_fcc_vld_fx2[0] &
  ~dec_flush_fx2       &
  ~exu_flush_fx2       &
  ~dec_flush_f2        &
//~tlu_flush_fgu_b     &
  ~(fec_uecc_fx2 | fec_cecc_fx2);

assign  pre_fcc_vld_fx2 = |fac_pre_fcc_vld_fx2[3:0];

assign  i_fld_fcc_vld_fx2[1] =  // load FSR 64b
  lsu_fgu_fsr_load_b &
  ~lsu_fgu_fld_32b_b ;

assign  i_fld_fcc_vld_fx2[0] =  // load FSR 32/64b
  lsu_fgu_fsr_load_b;

// ------------------------------------
// FPY control
// ------------------------------------

// spu_fgu_fpy_ctl_d[6:0]:
//
//            [0]     [1]             [2]             [3]             [4]     [5]                       [6]
//            ---     ------------    --------------  -----------     -----   -----------------------   --------------------
// if == 1    XOR     Add Accum       Write Accum     2*(rs1*rs2)     >> 64   write MA result flop      bypass result to rs1
// if == 0    Int     No Add Accum    No Write Accum    (rs1*rs2)     >> 0    no write MA result flop   no bypass result

assign  scff_sel_fx2[0] =
  (~spu_grant_fx2 & ~rs2_sel_fx2_b2) |                           // ~spu & ~8x16
  ( spu_grant_fx2 & ~spu_fpy_ctl_fx2[0] & ~spu_fpy_ctl_fx2[3]);  //  spu &  MA Int * 1

assign  scff_sel_fx2[1] =
  (~spu_grant_fx2 &  rs2_sel_fx2_b2);                            //  all 8x16

assign  scff_sel_fx2[2] =
  ( spu_grant_fx2 & ~spu_fpy_ctl_fx2[0] &  spu_fpy_ctl_fx2[3]);  //  spu &  MA Int * 2

assign  scff_sel_fx2[3] =
  ( spu_grant_fx2 &  spu_fpy_ctl_fx2[0] & ~spu_fpy_ctl_fx2[3]);  //  spu &  XOR    * 1

// fac_accum_sel_fx3[6:0]:
//
// [0] : Write ACCUM with result
// [1] : Add ACCUM to Mult product
// [2] : XOR Mult w/        ACCUM
// [3] : XOR Mult w/        ACCUM >> 64
// [4] : XOR Mult       w/o ACCUM
// [5] : XOR Mult       w/o ACCUM >> 64
// [6] : Int Mult w/ or w/o ACCUM
// Def : Int Mult w/ or w/o ACCUM >> 64

assign  accum_sel_fx2[0] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[2]);
assign  accum_sel_fx2[1] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[1]);
assign  accum_sel_fx2[2] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[0] &  spu_fpy_ctl_fx2[1] & ~spu_fpy_ctl_fx2[4]);
assign  accum_sel_fx2[3] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[0] &  spu_fpy_ctl_fx2[1] &  spu_fpy_ctl_fx2[4]);
assign  accum_sel_fx2[4] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[0] & ~spu_fpy_ctl_fx2[1] & ~spu_fpy_ctl_fx2[4]);
assign  accum_sel_fx2[5] = ( spu_grant_fx2 &  spu_fpy_ctl_fx2[0] & ~spu_fpy_ctl_fx2[1] &  spu_fpy_ctl_fx2[4]);
assign  accum_sel_fx2[6] = ( spu_grant_fx2 & ~spu_fpy_ctl_fx2[0] &                       ~spu_fpy_ctl_fx2[4]);


// ----------------------------------------------------------------------------
//                               FX3 stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_52 fx3_00  (
  .scan_in(fx3_00_scanin),
  .scan_out(fx3_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_addr_fx2[4:0],
         w1_32b_fx2,
         w1_odd32b_fx2,
         tid_fx2[2:0],
             rnd_8x16_fx2[1:0],
             scff_sel_fx2[3:0],
         result_sel_fx2[5:0],
         exu_w_vld_fx2,
         irf_w_addr_fx2[4:0],
         fpx_int_cc_vld_fx2,
         dec_flush_f2,
         tlu_flush_fgu_b,
         div_dec_issue_fx2,
         fpc_pre_div_flush_fx2,
         fpc_div_default_res_fx2,
         dec_valid_fx2,
         itype_fx2[2:0],
         itype_mul_fx2,
         gsr_w_vld_fx2,
         spu_grant_fx2,
             accum_sel_fx2,
         spu_fpy_ctl_fx2[5],
         pre_fcc_vld_fx2,
         fgx_instr_fx2,
         dec_valid_noflush_fx2}),
  .dout({w1_addr_fx3[4:0],
         w1_32b_fx3,
         w1_odd32b_fx3,
         tid_fx3[2:0],
         fac_8x16_rnd_fx3[1:0],
         fac_scff_sel_fx3[3:0],
         result_sel_fx3[5:0],
         i_exu_w_vld_fx3,
         irf_w_addr_fx3[4:0],
         fpx_int_cc_vld_fx3,
         dec_flush_fx3,
         fac_tlu_flush_fx3,
         div_dec_issue_fx3,
           i_pre_div_flush_fx3,
             div_default_res_fx3,
         dec_valid_fx3,
         itype_fx3[2:0],
         itype_mul_fx3,
         gsr_w_vld_fx3,
         spu_grant_fx3,
         fac_accum_sel_fx3,
         spu_fpy_ctl_fx3[5],
         i_pre_fcc_vld_fx3,
         fgx_instr_fx3,
         i_dec_valid_noflush_fx3}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_3 fx3_01  (
  .scan_in(fx3_01_scanin),
  .scan_out(fx3_01_scanout),
  .l1clk(l1clk_pm2),
  .din ({lsu_fgu_fld_b,              // requires free running clk
         i_fld_fcc_vld_fx2[1:0]}),   // requires free running clk
  .dout({    fgu_fld_fx3,
             fgu_fld_fcc_vld_fx3[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  pre_fcc_vld_fx3 = i_pre_fcc_vld_fx3 & ~fac_tlu_flush_fx3;

assign  dec_valid_noflush_fx3 =
  i_dec_valid_noflush_fx3 &
  ~dec_flush_fx3          &
  ~fac_tlu_flush_fx3      ;

assign  dec_valid_imul_noflush_fx3 = dec_valid_noflush_fx3 & (itype_fx3[2:0] == 3'b101);  // mul

assign  fgu_cmp_fcc_tid_fx2[2:0] = tid_fx2[2:0];

assign  exu_w_vld_fx3 =
  i_exu_w_vld_fx3   &
  ~dec_flush_fx3    &
  ~fac_tlu_flush_fx3;

assign  pre_div_flush_fx3 =
  (itype_fx3[2:1] == 2'b11) &  // div/sqrt
  dec_valid_fx3 &
  (i_pre_div_flush_fx3 |
   div_default_res_fx3 |
   dec_flush_fx3       |
   fac_tlu_flush_fx3      ) ;

assign  fac_div_flush_fx3 =
  pre_div_flush_fx3 &
  (div_dec_issue_fx3  |    // DEC  issued div/sqrt
   div_divq_issue_fx1 |    // divq issued div/sqrt
   div_divq_issue_fx2  );  // divq issued div/sqrt


// ----------------------------------------------------------------------------
//                               FX4 stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_31 fx4_00  (
  .scan_in(fx4_00_scanin),
  .scan_out(fx4_00_scanout),
  .l1clk(l1clk_pm1), 
  .din ({w1_addr_fx3[4:0],
         w1_32b_fx3,
         w1_odd32b_fx3,
         tid_fx3[2:0],
             result_sel_fx3[5:0],
         exu_w_vld_fx3,
         irf_w_addr_fx3[4:0],
         fpx_int_cc_vld_fx3,
         spu_grant_fx3,
         spu_fpy_ctl_fx3[5],
         pre_fcc_vld_fx3,
         dec_valid_noflush_fx3,
         fgu_fld_fx3,
         gsr_w_vld_fx3,
         dec_valid_imul_noflush_fx3,
             fgx_instr_fx3}),
  .dout({w1_addr_fx4[4:0],
         w1_32b_fx4,
         w1_odd32b_fx4,
         tid_fx4[2:0],
         fac_result_sel_fx4[5:0],
         exu_w_vld_fx4,
         i_irf_w_addr_fx4[4:0],
         i_int_cc_vld_fx4,
         spu_grant_fx4,
         spu_fpy_ctl_fx4[5],
         pre_fcc_vld_fx4,
         dec_valid_noflush_fx4,
         fgu_fld_fx4,
         gsr_w_vld_fx4,
         dec_valid_imul_noflush_fx4,
         fac_fgx_instr_fx4}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fac_ma_result_en_fx4 = spu_grant_fx4 & spu_fpy_ctl_fx4[5];

assign  irf_result_tid_fx4[2:0] =
  ({3{~exu_w_vld_fx4}} & div_tid_fx1[2:0]     ) |
  ({3{ exu_w_vld_fx4}} & tid_fx4[2:0]         ) ;

assign  irf_w_addr_fx4[4:0] =
  ({5{~exu_w_vld_fx4}} & div_irf_addr_fx1[4:0]) |
  ({5{ exu_w_vld_fx4}} & i_irf_w_addr_fx4[4:0]) ;

assign  exu_cc_vld_fx4 =
  (   ~exu_w_vld_fx4   & div_cc_vld_fx1       ) |
  (    exu_w_vld_fx4   & i_int_cc_vld_fx4     ) ;


// ----------------------------------------------------------------------------
//                               FX5 stage
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_26 fx5_00  (
  .scan_in(fx5_00_scanin),
  .scan_out(fx5_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_addr_fx4[4:0],
         w1_32b_fx4,
         w1_odd32b_fx4,
         tid_fx4[2:0],
         exu_w_vld_fx4,
         irf_w_addr_fx4[4:0],
         irf_result_tid_fx4[2:0],
         exu_cc_vld_fx4,
         pre_fcc_vld_fx4,
         dec_valid_noflush_fx4,
         spu_grant_fx4,
         fgu_fld_fx4,
         dec_valid_imul_noflush_fx4,
         fac_fgx_instr_fx4}),
  .dout({w1_addr_fx5[4:0],
         w1_32b_fx5,
         w1_odd32b_fx5,
         tid_fx5[2:0],
         i_exu_w_vld_fx5,
         fgu_irf_w_addr_fx5[4:0],
         irf_result_tid_fx5_b2, fgu_result_tid_fx5[1:0],
         exu_cc_vld_fx5,
         pre_fcc_vld_fx5,
         fac_dec_valid_noflush_fx5,
         spu_grant_fx5,
         fgu_fld_fx5,
         dec_valid_imul_noflush_fx5,
             fgx_instr_fx5}),
  .siclk(siclk),
  .soclk(soclk)
  );


// Note: no need for idiv0 to clear exu_w_vld or exu_cc_vld
//       since idiv0 clears fdc_finish_int_early

assign  fgu_exu_w_vld_fx5[0] =
  (i_exu_w_vld_fx5 | div_finish_int_fb) & ~irf_result_tid_fx5_b2;  // exu thread group 0

assign  fgu_exu_w_vld_fx5[1] =
  (i_exu_w_vld_fx5 | div_finish_int_fb) &  irf_result_tid_fx5_b2;  // exu thread group 1

assign  fgu_exu_cc_vld_fx5 = exu_cc_vld_fx5 & (i_exu_w_vld_fx5 | div_finish_int_fb);


// ----------------------------------------------------------------------------
//                               FB stage 
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_25 fb_00  (
  .scan_in(fb_00_scanin),
  .scan_out(fb_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({    w1_addr_fx5[4:0],
             w1_32b_fx5,
             w1_odd32b_fx5,
                tid_fx5[2:0],
         fpc_fsr_w1_vld_fx5[1:0],
         pre_fcc_vld_fx5,
         fpc_fcc_vld_fx5,
         fdc_finish_int_early,
         fdc_finish_flts_early,
         fdc_finish_fltd_early,
         fac_dec_valid_noflush_fx5,
         fgu_fld_fx5,
         dec_valid_imul_noflush_fx5,
         fgx_instr_fx5,
         fpc_stfsr_en_fx3to5}),
  .dout({fac_w1_addr_fb[4:0],
         fac_w1_32b_fb,
         fac_w1_odd32b_fb,
         fac_w1_tid_fb[2:0],
             fsr_w1_vld_fb[1:0],
         pre_fcc_vld_fb,
             fcc_vld_fb,
         div_finish_int_fb,
         div_finish_flts_fb,
         div_finish_fltd_fb,
             dec_valid_noflush_fb,
         fgu_fld_fb,
         dec_valid_imul_noflush_fb,
         fgx_instr_fb,
         fpc_stfsr_en_fb}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fac_fpd_addr_fb[4:0] = div_frf_addr_fx1[4:0];
assign  fac_fpd_32b_fb       = div_32b_fx1;
assign  fac_fpd_odd32b_fb    = div_odd32b_fx1;
assign  fac_fpd_tid_fb[2:0]  = div_tid_fx1[2:0];

assign  div_finish_fb = div_finish_int_fb | div_finish_flts_fb | div_finish_fltd_fb;


// ----------------------------------------------------------------------------
//                               FW stage 
// ----------------------------------------------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_21 fw_00  (
  .scan_in(fw_00_scanin),
  .scan_out(fw_00_scanout),
  .l1clk(l1clk_pm1),
  .din ({fac_fpd_tid_fb[2:0],
         fac_w1_tid_fb[2:0],
         fac_w1_addr_fb[4],
         dec_valid_noflush_fb,
         dec_valid_noflush_fw,
         dec_valid_noflush_fw1,
         div_finish_fb,
         div_finish_fw,
         div_finish_fw1,
         div_finish_fw2,
         dec_valid_imul_noflush_fb,
         dec_valid_imul_noflush_fw,
         dec_valid_imul_noflush_fw1,
         fgx_instr_fb,
         fgx_instr_fw,
         fgx_instr_fw1,
         fpc_stfsr_en_fb}),
  .dout({fgu_fpd_trap_tid_fw[2:0],
         fgu_fpx_trap_tid_fw[2:0],
           w1_addr_fw_b4,
         dec_valid_noflush_fw,
         dec_valid_noflush_fw1,
         dec_valid_noflush_fw2,
         div_finish_fw,
         div_finish_fw1,
         div_finish_fw2,
         div_finish_fw3,
         dec_valid_imul_noflush_fw,
         dec_valid_imul_noflush_fw1,
         dec_valid_imul_noflush_fw2,
         fgx_instr_fw,
         fgx_instr_fw1,
         fgx_instr_fw2,
         fpc_stfsr_en_fw}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_53 fw_01  (
  .scan_in(fw_01_scanin),
  .scan_out(fw_01_scanout),
  .l1clk(l1clk_pm2),
  .din ({    fsr0_sel_fb[5:0],    // requires free running clk
             fsr1_sel_fb[5:0],    // requires free running clk
             fsr2_sel_fb[5:0],    // requires free running clk
             fsr3_sel_fb[5:0],    // requires free running clk
             fsr4_sel_fb[5:0],    // requires free running clk
             fsr5_sel_fb[5:0],    // requires free running clk
             fsr6_sel_fb[5:0],    // requires free running clk
             fsr7_sel_fb[5:0],    // requires free running clk
         lsu_fgu_fld_tid_b[2:0],  // requires free running clk
         i_fsr_w2_vld_fb[1:0]}),  // requires free running clk
  .dout({fac_fsr0_sel_fw[5:4], i_fsr0_sel_fw[3], fac_fsr0_sel_fw[2:1], i_fsr0_sel_fw[0],
         fac_fsr1_sel_fw[5:4], i_fsr1_sel_fw[3], fac_fsr1_sel_fw[2:1], i_fsr1_sel_fw[0],
         fac_fsr2_sel_fw[5:4], i_fsr2_sel_fw[3], fac_fsr2_sel_fw[2:1], i_fsr2_sel_fw[0],
         fac_fsr3_sel_fw[5:4], i_fsr3_sel_fw[3], fac_fsr3_sel_fw[2:1], i_fsr3_sel_fw[0],
         fac_fsr4_sel_fw[5:4], i_fsr4_sel_fw[3], fac_fsr4_sel_fw[2:1], i_fsr4_sel_fw[0],
         fac_fsr5_sel_fw[5:4], i_fsr5_sel_fw[3], fac_fsr5_sel_fw[2:1], i_fsr5_sel_fw[0],
         fac_fsr6_sel_fw[5:4], i_fsr6_sel_fw[3], fac_fsr6_sel_fw[2:1], i_fsr6_sel_fw[0],
         fac_fsr7_sel_fw[5:4], i_fsr7_sel_fw[3], fac_fsr7_sel_fw[2:1], i_fsr7_sel_fw[0],
         lsu_fgu_fld_tid_fw[2:0],
         i_fsr_w2_vld_fw[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  fsr_w2_vld_fw[0] =                 // load FSR 32b
  i_fsr_w2_vld_fw[0] & lsu_fgu_fld_vld_w;

assign  fsr_w2_vld_fw[1] =                 // load FSR 64b
  i_fsr_w2_vld_fw[1] & lsu_fgu_fld_vld_w;

assign  fac_fsr0_sel_fw[3] =    // enable flop
  i_fsr0_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd0)) ;

assign  fac_fsr1_sel_fw[3] =    // enable flop
  i_fsr1_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd1)) ;

assign  fac_fsr2_sel_fw[3] =    // enable flop
  i_fsr2_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd2)) ;

assign  fac_fsr3_sel_fw[3] =    // enable flop
  i_fsr3_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd3)) ;

assign  fac_fsr4_sel_fw[3] =    // enable flop
  i_fsr4_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd4)) ;

assign  fac_fsr5_sel_fw[3] =    // enable flop
  i_fsr5_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd5)) ;

assign  fac_fsr6_sel_fw[3] =    // enable flop
  i_fsr6_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd6)) ;

assign  fac_fsr7_sel_fw[3] =    // enable flop
  i_fsr7_sel_fw[3]                                             |
  (( |fsr_w2_vld_fw[1:0]) & (lsu_fgu_fld_tid_fw[2:0] == 3'd7)) ;

assign  fac_fsr0_sel_fw[0] =
  i_fsr0_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd0))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd0))         ) ;  // LDXFSR

assign  fac_fsr1_sel_fw[0] =
  i_fsr1_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd1))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd1))         ) ;  // LDXFSR

assign  fac_fsr2_sel_fw[0] =
  i_fsr2_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd2))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd2))         ) ;  // LDXFSR

assign  fac_fsr3_sel_fw[0] =
  i_fsr3_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd3))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd3))         ) ;  // LDXFSR

assign  fac_fsr4_sel_fw[0] =
  i_fsr4_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd4))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd4))         ) ;  // LDXFSR

assign  fac_fsr5_sel_fw[0] =
  i_fsr5_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd5))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd5))         ) ;  // LDXFSR

assign  fac_fsr6_sel_fw[0] =
  i_fsr6_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd6))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd6))         ) ;  // LDXFSR

assign  fac_fsr7_sel_fw[0] =
  i_fsr7_sel_fw[0]                                                      |
//(   (fsr_w2_vld_fw[0] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd7))   & 1'b0) |  // LDFSR
  (   (fsr_w2_vld_fw[1] & (lsu_fgu_fld_tid_fw[2:0]  == 3'd7))         ) ;  // LDXFSR

// ------------------------------------
// FPRS
//
// FPRS[2:0] = {fef, du, dl}
// ------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_12 fprs_frf_ctl  (
  .scan_in(fprs_frf_ctl_scanin),
  .scan_out(fprs_frf_ctl_scanout),
  .l1clk(l1clk_pm1),
  .din ({w1_addr_fw_b4,
         fad_w1_tid_fw[2:0],
         fad_w1_vld_fw[1:0],
         fad_w2_addr_fw1_b4,
         fad_w2_tid_fw1[2:0],
         fad_w2_vld_fw1[1:0]}),
  .dout({fprs_w1_addr[4],
         fprs_w1_tid[2:0],
         fprs_w1_vld[1:0],
         fprs_w2_addr[4],
         fprs_w2_tid[2:0],
         fprs_w2_vld[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

// ----------
// FPRS tid0
// ----------

assign  fprs_tid0_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd0);  // ASR FPRS write
assign  fprs_tid0_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd0);  // FRF w1   write
assign  fprs_tid0_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd0);  // FRF w2   write
assign  fprs_tid0_sel[3] = ~(|fprs_tid0_sel[2:0]);                            // hold

assign din_fprs_tid0[0] =  // dirty lower
  ( fprs_tid0_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid0_sel[1] & (fprs_tid0[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid0_sel[2] & (fprs_tid0[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid0_sel[3] &  fprs_tid0[0]                    ) ;  // hold

assign din_fprs_tid0[1] =  // dirty upper
  ( fprs_tid0_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid0_sel[1] & (fprs_tid0[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid0_sel[2] & (fprs_tid0[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid0_sel[3] &  fprs_tid0[1]                    ) ;  // hold

assign din_fprs_tid0[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid0_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid0_sel[0] &  fprs_tid0[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid0  (				// FS:wmr_protect
  .scan_in(fprstid0_wmr_scanin),
  .scan_out(fprstid0_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid0[2:0]),
  .dout({fprs_tid0_[2], fprs_tid0[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid0[2] = ~fprs_tid0_[2];

// ----------
// FPRS tid1
// ----------

assign  fprs_tid1_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd1);  // ASR FPRS write
assign  fprs_tid1_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd1);  // FRF w1   write
assign  fprs_tid1_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd1);  // FRF w2   write
assign  fprs_tid1_sel[3] = ~(|fprs_tid1_sel[2:0]);                            // hold

assign din_fprs_tid1[0] =  // dirty lower
  ( fprs_tid1_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid1_sel[1] & (fprs_tid1[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid1_sel[2] & (fprs_tid1[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid1_sel[3] &  fprs_tid1[0]                    ) ;  // hold

assign din_fprs_tid1[1] =  // dirty upper
  ( fprs_tid1_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid1_sel[1] & (fprs_tid1[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid1_sel[2] & (fprs_tid1[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid1_sel[3] &  fprs_tid1[1]                    ) ;  // hold

assign din_fprs_tid1[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid1_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid1_sel[0] &  fprs_tid1[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid1  (				// FS:wmr_protect
  .scan_in(fprstid1_wmr_scanin),
  .scan_out(fprstid1_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid1[2:0]),
  .dout({fprs_tid1_[2], fprs_tid1[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid1[2] = ~fprs_tid1_[2];

// ----------
// FPRS tid2
// ----------

assign  fprs_tid2_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd2);  // ASR FPRS write
assign  fprs_tid2_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd2);  // FRF w1   write
assign  fprs_tid2_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd2);  // FRF w2   write
assign  fprs_tid2_sel[3] = ~(|fprs_tid2_sel[2:0]);                            // hold

assign din_fprs_tid2[0] =  // dirty lower
  ( fprs_tid2_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid2_sel[1] & (fprs_tid2[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid2_sel[2] & (fprs_tid2[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid2_sel[3] &  fprs_tid2[0]                    ) ;  // hold

assign din_fprs_tid2[1] =  // dirty upper
  ( fprs_tid2_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid2_sel[1] & (fprs_tid2[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid2_sel[2] & (fprs_tid2[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid2_sel[3] &  fprs_tid2[1]                    ) ;  // hold

assign din_fprs_tid2[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid2_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid2_sel[0] &  fprs_tid2[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid2  (				// FS:wmr_protect
  .scan_in(fprstid2_wmr_scanin),
  .scan_out(fprstid2_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid2[2:0]),
  .dout({fprs_tid2_[2], fprs_tid2[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid2[2] = ~fprs_tid2_[2];

// ----------
// FPRS tid3
// ----------

assign  fprs_tid3_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd3);  // ASR FPRS write
assign  fprs_tid3_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd3);  // FRF w1   write
assign  fprs_tid3_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd3);  // FRF w2   write
assign  fprs_tid3_sel[3] = ~(|fprs_tid3_sel[2:0]);                            // hold

assign din_fprs_tid3[0] =  // dirty lower
  ( fprs_tid3_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid3_sel[1] & (fprs_tid3[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid3_sel[2] & (fprs_tid3[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid3_sel[3] &  fprs_tid3[0]                    ) ;  // hold

assign din_fprs_tid3[1] =  // dirty upper
  ( fprs_tid3_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid3_sel[1] & (fprs_tid3[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid3_sel[2] & (fprs_tid3[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid3_sel[3] &  fprs_tid3[1]                    ) ;  // hold

assign din_fprs_tid3[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid3_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid3_sel[0] &  fprs_tid3[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid3  (				// FS:wmr_protect
  .scan_in(fprstid3_wmr_scanin),
  .scan_out(fprstid3_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid3[2:0]),
  .dout({fprs_tid3_[2], fprs_tid3[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid3[2] = ~fprs_tid3_[2];

// ----------
// FPRS tid4
// ----------

assign  fprs_tid4_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd4);  // ASR FPRS write
assign  fprs_tid4_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd4);  // FRF w1   write
assign  fprs_tid4_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd4);  // FRF w2   write
assign  fprs_tid4_sel[3] = ~(|fprs_tid4_sel[2:0]);                            // hold

assign din_fprs_tid4[0] =  // dirty lower
  ( fprs_tid4_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid4_sel[1] & (fprs_tid4[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid4_sel[2] & (fprs_tid4[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid4_sel[3] &  fprs_tid4[0]                    ) ;  // hold

assign din_fprs_tid4[1] =  // dirty upper
  ( fprs_tid4_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid4_sel[1] & (fprs_tid4[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid4_sel[2] & (fprs_tid4[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid4_sel[3] &  fprs_tid4[1]                    ) ;  // hold

assign din_fprs_tid4[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid4_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid4_sel[0] &  fprs_tid4[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid4  (				// FS:wmr_protect
  .scan_in(fprstid4_wmr_scanin),
  .scan_out(fprstid4_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid4[2:0]),
  .dout({fprs_tid4_[2], fprs_tid4[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid4[2] = ~fprs_tid4_[2];

// ----------
// FPRS tid5
// ----------

assign  fprs_tid5_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd5);  // ASR FPRS write
assign  fprs_tid5_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd5);  // FRF w1   write
assign  fprs_tid5_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd5);  // FRF w2   write
assign  fprs_tid5_sel[3] = ~(|fprs_tid5_sel[2:0]);                            // hold

assign din_fprs_tid5[0] =  // dirty lower
  ( fprs_tid5_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid5_sel[1] & (fprs_tid5[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid5_sel[2] & (fprs_tid5[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid5_sel[3] &  fprs_tid5[0]                    ) ;  // hold

assign din_fprs_tid5[1] =  // dirty upper
  ( fprs_tid5_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid5_sel[1] & (fprs_tid5[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid5_sel[2] & (fprs_tid5[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid5_sel[3] &  fprs_tid5[1]                    ) ;  // hold

assign din_fprs_tid5[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid5_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid5_sel[0] &  fprs_tid5[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid5  (				// FS:wmr_protect
  .scan_in(fprstid5_wmr_scanin),
  .scan_out(fprstid5_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid5[2:0]),
  .dout({fprs_tid5_[2], fprs_tid5[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid5[2] = ~fprs_tid5_[2];

// ----------
// FPRS tid6
// ----------

assign  fprs_tid6_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd6);  // ASR FPRS write
assign  fprs_tid6_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd6);  // FRF w1   write
assign  fprs_tid6_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd6);  // FRF w2   write
assign  fprs_tid6_sel[3] = ~(|fprs_tid6_sel[2:0]);                            // hold

assign din_fprs_tid6[0] =  // dirty lower
  ( fprs_tid6_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid6_sel[1] & (fprs_tid6[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid6_sel[2] & (fprs_tid6[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid6_sel[3] &  fprs_tid6[0]                    ) ;  // hold

assign din_fprs_tid6[1] =  // dirty upper
  ( fprs_tid6_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid6_sel[1] & (fprs_tid6[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid6_sel[2] & (fprs_tid6[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid6_sel[3] &  fprs_tid6[1]                    ) ;  // hold

assign din_fprs_tid6[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid6_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid6_sel[0] &  fprs_tid6[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid6  (				// FS:wmr_protect
  .scan_in(fprstid6_wmr_scanin),
  .scan_out(fprstid6_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid6[2:0]),
  .dout({fprs_tid6_[2], fprs_tid6[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid6[2] = ~fprs_tid6_[2];

// ----------
// FPRS tid7
// ----------

assign  fprs_tid7_sel[0] =  rng_wr_fprs_3f   & (rng_wr_tid_3f[2:0] == 3'd7);  // ASR FPRS write
assign  fprs_tid7_sel[1] = |fprs_w1_vld[1:0] & (fprs_w1_tid[2:0]   == 3'd7);  // FRF w1   write
assign  fprs_tid7_sel[2] = |fprs_w2_vld[1:0] & (fprs_w2_tid[2:0]   == 3'd7);  // FRF w2   write
assign  fprs_tid7_sel[3] = ~(|fprs_tid7_sel[2:0]);                            // hold

assign din_fprs_tid7[0] =  // dirty lower
  ( fprs_tid7_sel[0] &  rng_data_2f_b7_0[0]             ) |  // ASR FPRS write
  ( fprs_tid7_sel[1] & (fprs_tid7[0] | ~fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid7_sel[2] & (fprs_tid7[0] | ~fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid7_sel[3] &  fprs_tid7[0]                    ) ;  // hold

assign din_fprs_tid7[1] =  // dirty upper
  ( fprs_tid7_sel[0] &  rng_data_2f_b7_0[1]             ) |  // ASR FPRS write
  ( fprs_tid7_sel[1] & (fprs_tid7[1] |  fprs_w1_addr[4])) |  // FRF w1   write
  ( fprs_tid7_sel[2] & (fprs_tid7[1] |  fprs_w2_addr[4])) |  // FRF w2   write
  ( fprs_tid7_sel[3] &  fprs_tid7[1]                    ) ;  // hold

assign din_fprs_tid7[2] =  // enable fp (POR value is 1'b1)
  ~(( fprs_tid7_sel[0] &  rng_data_2f_b7_0[2]) |    // ASR FPRS write
    (~fprs_tid7_sel[0] &  fprs_tid7[2]       )  );  // hold

fgu_fac_ctl_msff_ctl_macro__width_3 fprstid7  (				// FS:wmr_protect
  .scan_in(fprstid7_wmr_scanin),
  .scan_out(fprstid7_wmr_scanout),
  .siclk(spc_aclk_wmr),
  .l1clk(l1clk_pm1),
  .din (din_fprs_tid7[2:0]),
  .dout({fprs_tid7_[2], fprs_tid7[1:0]}),
  .soclk(soclk)
  );

assign  fprs_tid7[2] = ~fprs_tid7_[2];

assign  fgu_fprs_fef[7:0] =
  {fprs_tid7[2],
   fprs_tid6[2],
   fprs_tid5[2],
   fprs_tid4[2],
   fprs_tid3[2],
   fprs_tid2[2],
   fprs_tid1[2],
   fprs_tid0[2]};

// ----------
// ASR FPRS read data
// ----------

assign  din_rng_fprs[2:0] =
  ({3{(rng_wr_tid_3f[2:0] == 3'd0)}} & fprs_tid0[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd1)}} & fprs_tid1[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd2)}} & fprs_tid2[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd3)}} & fprs_tid3[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd4)}} & fprs_tid4[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd5)}} & fprs_tid5[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd6)}} & fprs_tid6[2:0]) |
  ({3{(rng_wr_tid_3f[2:0] == 3'd7)}} & fprs_tid7[2:0]) ;

fgu_fac_ctl_msff_ctl_macro__width_3 fprs_rng  (
  .scan_in(fprs_rng_scanin),
  .scan_out(fprs_rng_scanout),
  .l1clk(l1clk_pm1),
  .din (din_rng_fprs[2:0]),
  .dout(fac_rng_fprs[2:0]),
  .siclk(siclk),
  .soclk(soclk)
  );

// ----------------------------------------------------------------------------
//    FGU ASI local ring control - ASR GSR/FPRS access, ASI FRF ECC access
// ----------------------------------------------------------------------------
//
//
// ASI access should not happen for a given thread when there is a valid instr
// in the pipeline for that thread.
//
//   A packet is transmitted on the ring over 2 cycles. First cycle
//   carries control and address information. Second cycle carries data.
//   -Determinate write packets go through the pipe unmodified. The write data
//    is used by the unit.
//   -Determinate read packets have their data portion modified 
//    by the target unit.
//
//                    65-bit control/data bus output from the ring:
//                               64    - ctl/data
//                               63    - valid/hole
//                               62    - ack
//                               61:60 - 00-ASI, 01-ASR, 10-PR, 11-HPR   
//                               59    - rd/wr
//                               58:56 - Thread ID
//                               55:48 - ASI field
//                               47:0  - Virtual Address
//
////////////////////////////////////////////////////////////////////////////////
//
// PIPELINE STRUCTURE
//
//                                            rng_in_cdbus
//                                                 |
//                                                 |
//                                           -------------    
//                                          | stage1 reg  |   
//                                           -------------    
//                                                 |        
//                         ------------------------|---------> Store Data
//                         |                       v          
//                         |                 -------------  
//                         |                |    Decode   | 
//                         |                |             | ---------> Load request           
//                         |                |             | 
//                         |                 -------------  
//                         |                       |
//                         |                       |
//                         v                       v
//                 ---------------           -------------    
//                |stage2 data reg|        |stage2 ctl reg|   
//                 ---------------          ------------- 
//   load data             |                       |            
//       -------------     |                       |        
//indet load data     |    |                       |---------> Store control
//       ---------    |    |                       |          
//                |   |    |                       |
//                v   v    v                       |
//             ----------------                    |
//             \  input mux   /                    |
//              --------------    -----------------
//                    |          |
//                    |          |
//                    |          |
//                    v          v
//                  ----------------   
//                  \ data/ctl mux /   
//                   --------------    
//                          |            
//                          v            
//                    -------------      
//                   | stage3 reg  |     
//                    -------------       
//                          |            
//                          |
//                          v
//                    rng_out_cdbus
//
//////////////////////////////////////////////////////////////////////

`define FRF_ADDR  8'd73  // FRF ECC address
`define GSR_ADDR  8'd19  // GSR  address
`define FPRS_ADDR 8'd6   // FPRS address
`define ASI       2'b00
`define ASR       2'b01

// ------------------------------------
// STAGE 1
// ------------------------------------

// First cycle of the packet holds control and address information
// Second cycle holds the read/write data

// bit 64 indicates whether ctl packet or data packet
fgu_fac_ctl_msff_ctl_macro__width_25 rng_stg1  (
  .scan_in(rng_stg1_scanin),
  .scan_out(rng_stg1_scanout),
  .l1clk(l1clk_pm2),
  .din	({in_rngl_cdbus[64:48], in_rngl_cdbus[7:0]}),  // requires free running clk or rng_data_1f[63] en
  .dout	({rng_ctl_1f, rng_valid_1f, rng_data_1f[62:48], rng_data_1f_b7_0[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

// decode the packet for ASR GSR/FPRS read or ASI ECC read
assign  rng_rd_1f =
  rng_ctl_1f                   &  // ctl packet (not data)
  rng_valid_1f                 &  // valid
  ~rng_data_1f[62]             &  // ~ack
  rng_data_1f[59]              ;  // read (not write)

// decode the packet for ASR GSR/FPRS write
assign  rng_wr_1f =
  rng_ctl_1f                   &  // ctl packet (not data)
  rng_valid_1f                 &  // valid
  ~rng_data_1f[62]             &  // ~ack
  (rng_data_1f[61:60] == `ASR) &  // ASR
  ~rng_data_1f[59]             ;  // write (not read)

assign  rng_rd_gsr_1f  = rng_rd_1f & (rng_data_1f[61:60] == `ASR) & (rng_data_1f[55:48] == `GSR_ADDR );
assign  rng_wr_gsr_1f  = rng_wr_1f &                                (rng_data_1f[55:48] == `GSR_ADDR );
assign  rng_rd_fprs_1f = rng_rd_1f & (rng_data_1f[61:60] == `ASR) & (rng_data_1f[55:48] == `FPRS_ADDR);
assign  rng_wr_fprs_1f = rng_wr_1f &                                (rng_data_1f[55:48] == `FPRS_ADDR);
assign  rng_rd_ecc_1f  = rng_rd_1f & (rng_data_1f[61:60] == `ASI) & (rng_data_1f[55:48] == `FRF_ADDR );

assign  rng_rd_or_wr_1f =
  rng_rd_gsr_1f  | rng_wr_gsr_1f  |
  rng_rd_fprs_1f | rng_wr_fprs_1f |
  rng_rd_ecc_1f;

// 0in custom -fire ((rng_rd_or_wr_1f & div_engine_busy_e & (rng_data_1f[58:56]==div_tid_in_e[2:0])) | (rng_rd_or_wr_1f & (div_finish_fltd_fb | div_finish_flts_fb) & (rng_data_1f[58:56]==fac_fpd_tid_fb[2:0])) | (rng_rd_or_wr_1f & dec_fgu_valid_e & (rng_data_1f[58:56]==fac_tid_e[2:0])) | (rng_rd_or_wr_1f & fac_dec_valid_fx1 & (rng_data_1f[58:56]==tid_fx1[2:0])) | (rng_rd_or_wr_1f & dec_valid_fx2 & (rng_data_1f[58:56]==tid_fx2[2:0])) | (rng_rd_or_wr_1f & dec_valid_fx3 & (rng_data_1f[58:56]==tid_fx3[2:0])) | (rng_rd_or_wr_1f & (|fad_w1_vld_fw[1:0]) & (rng_data_1f[58:56]==fad_w1_tid_fw[2:0]))) -message "GSR or FPRS or FRF_ECC ASI collision with FPop"

// ------------------------------------
// STAGE 2
// ------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_17 rng_stg2  (
  .scan_in(rng_stg2_scanin),
  .scan_out(rng_stg2_scanout),
  .l1clk(l1clk_pm1),
  .din ({rng_data_1f[58:56],
         rng_wr_gsr_1f,
         rng_rd_or_wr_1f,
         rng_rd_gsr_1f,
         rng_rd_fprs_1f,
         rng_wr_fprs_1f,
         rng_rd_ecc_1f,
         rng_data_1f_b7_0[7:0]}),
  .dout({rng_wr_tid_2f[2:0],
         rng_wr_gsr_2f,
         rng_rd_or_wr_2f,
         rng_rd_gsr_2f,
         rng_rd_fprs_2f,
         rng_wr_fprs_2f,
         rng_rd_ecc_2f,
         rng_data_2f_b7_0[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
  );

fgu_fac_ctl_msff_ctl_macro__width_6 rng_6463  (
  .scan_in(rng_6463_scanin),
  .scan_out(rng_6463_scanout),
  .l1clk(l1clk_pm2),
  .din ({rng_ctl_1f,
         rng_valid_1f,
         rng_ctl_2f,
         rng_valid_2f,
             rng_ctl_3f,
             rng_cdbus_3f_b63}),
  .dout({rng_ctl_2f,                // requires free running clk
         rng_valid_2f,              // requires free running clk
         rng_ctl_3f,                // requires free running clk
         rng_valid_3f,              // requires free running clk
         fgu_rngl_cdbus_b64,        // requires free running clk
         fgu_rngl_cdbus_b63}),
  .siclk(siclk),
  .soclk(soclk)       // requires free running clk
  );

// ------------------------------------
// STAGE 3
// ------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_9 rng_stg3  (
  .scan_in(rng_stg3_scanin),
  .scan_out(rng_stg3_scanout),
  .l1clk(l1clk_pm1),
  .din ({rng_wr_tid_2f[2:0],
             rng_wr_gsr_2f,
             rng_rd_or_wr_2f,
         rng_rd_gsr_2f,
         rng_rd_fprs_2f,
         rng_wr_fprs_2f,
         rng_rd_ecc_2f}),
  .dout({rng_wr_tid_3f[2:0],
         fac_rng_wr_gsr_3f,
         fac_rng_rd_or_wr_3f,
         rng_rd_gsr_3f,
         rng_rd_fprs_3f,
         rng_wr_fprs_3f,
         rng_rd_ecc_3f}),
  .siclk(siclk),
  .soclk(soclk)
  );

assign  rng_b64_default_sel =
  ~fac_rng_rd_or_wr_3f &
  ~fac_rng_rd_gsr_4f   &
  ~fac_rng_rd_fprs_4f  &
  ~fac_rng_rd_ecc_4f   ;

assign  rng_cdbus_3f_b63 =
  (fac_rng_rd_or_wr_3f & rng_valid_3f            ) |
  (fac_rng_rd_gsr_4f   & fgd_gsr_asr_mask_fx4_b31) |
  (rng_b64_default_sel & rng_valid_3f            ) ;

// ------------------------------------
// STAGE 4
// ------------------------------------

fgu_fac_ctl_msff_ctl_macro__width_5 rng_stg4  (
  .scan_in(rng_stg4_scanin),
  .scan_out(rng_stg4_scanout),
  .l1clk(l1clk_pm1),
  .din ({    rng_rd_gsr_3f,
             rng_rd_fprs_3f,
             rng_rd_ecc_3f,
         fac_rng_rd_or_wr_3f,
         rng_rd_or_wr_4f}),
  .dout({fac_rng_rd_gsr_4f,
         fac_rng_rd_fprs_4f,
         fac_rng_rd_ecc_4f,
             rng_rd_or_wr_4f,
         rng_rd_or_wr_5f}),
  .siclk(siclk),
  .soclk(soclk)
  );


supply0 vss;
supply1 vdd;
// fixscan start:
assign spares_scanin             = scan_in                  ;
assign e_00_scanin               = spares_scanout           ;
assign e_01_scanin               = e_00_scanout             ;
assign e_02_scanin               = e_01_scanout             ;
assign e_03_scanin               = e_02_scanout             ;
assign fx1_00_scanin             = e_03_scanout             ;
assign fx1_01_scanin             = fx1_00_scanout           ;
assign fx1_02_scanin             = fx1_01_scanout           ;
assign fx2_00_scanin             = fx1_02_scanout           ;
assign fx2_01_scanin             = fx2_00_scanout           ;
assign fx2_02_scanin             = fx2_01_scanout           ;
assign fx3_00_scanin             = fx2_02_scanout           ;
assign fx3_01_scanin             = fx3_00_scanout           ;
assign fx4_00_scanin             = fx3_01_scanout           ;
assign fx5_00_scanin             = fx4_00_scanout           ;
assign fb_00_scanin              = fx5_00_scanout           ;
assign fw_00_scanin              = fb_00_scanout            ;
assign fw_01_scanin              = fw_00_scanout            ;
assign fprs_frf_ctl_scanin       = fw_01_scanout            ;
assign fprs_rng_scanin           = fprs_frf_ctl_scanout     ;
assign rng_stg1_scanin           = fprs_rng_scanout         ;
assign rng_stg2_scanin           = rng_stg1_scanout         ;
assign rng_6463_scanin           = rng_stg2_scanout         ;
assign rng_stg3_scanin           = rng_6463_scanout         ;
assign rng_stg4_scanin           = rng_stg3_scanout         ;
assign scan_out                  = rng_stg4_scanout         ;

assign fprstid0_wmr_scanin       = wmr_scan_in              ;
assign fprstid1_wmr_scanin       = fprstid0_wmr_scanout     ;
assign fprstid2_wmr_scanin       = fprstid1_wmr_scanout     ;
assign fprstid3_wmr_scanin       = fprstid2_wmr_scanout     ;
assign fprstid4_wmr_scanin       = fprstid3_wmr_scanout     ;
assign fprstid5_wmr_scanin       = fprstid4_wmr_scanout     ;
assign fprstid6_wmr_scanin       = fprstid5_wmr_scanout     ;
assign fprstid7_wmr_scanin       = fprstid6_wmr_scanout     ;
assign wmr_scan_out              = fprstid7_wmr_scanout     ;
// fixscan end:
endmodule  // fgu_fac_ctl








// any PARAMS parms go into naming of macro

module fgu_fac_ctl_l1clkhdr_ctl_macro (
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


module fgu_fac_ctl_spare_ctl_macro__num_5 (
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
assign scan_out = so_4;



endmodule






// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_10 (
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

module fgu_fac_ctl_msff_ctl_macro__width_37 (
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

module fgu_fac_ctl_msff_ctl_macro__width_17 (
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

module fgu_fac_ctl_msff_ctl_macro__width_9 (
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

module fgu_fac_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_21 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [20:0] fdin;
wire [19:0] so;

  input [20:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [20:0] dout;
  output scan_out;
assign fdin[20:0] = din[20:0];






dff #(21)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20:0]),
.si({scan_in,so[19:0]}),
.so({so[19:0],scan_out}),
.q(dout[20:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_4 (
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

module fgu_fac_ctl_msff_ctl_macro__width_16 (
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

module fgu_fac_ctl_msff_ctl_macro__width_60 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [59:0] fdin;
wire [58:0] so;

  input [59:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [59:0] dout;
  output scan_out;
assign fdin[59:0] = din[59:0];






dff #(60)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[59:0]),
.si({scan_in,so[58:0]}),
.so({so[58:0],scan_out}),
.q(dout[59:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_3 (
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

module fgu_fac_ctl_msff_ctl_macro__width_52 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [51:0] fdin;
wire [50:0] so;

  input [51:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [51:0] dout;
  output scan_out;
assign fdin[51:0] = din[51:0];






dff #(52)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[51:0]),
.si({scan_in,so[50:0]}),
.so({so[50:0],scan_out}),
.q(dout[51:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_31 (
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













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_26 (
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

module fgu_fac_ctl_msff_ctl_macro__width_25 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [24:0] fdin;
wire [23:0] so;

  input [24:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [24:0] dout;
  output scan_out;
assign fdin[24:0] = din[24:0];






dff #(25)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[24:0]),
.si({scan_in,so[23:0]}),
.so({so[23:0],scan_out}),
.q(dout[24:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_53 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [52:0] fdin;
wire [51:0] so;

  input [52:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [52:0] dout;
  output scan_out;
assign fdin[52:0] = din[52:0];






dff #(53)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[52:0]),
.si({scan_in,so[51:0]}),
.so({so[51:0],scan_out}),
.q(dout[52:0])
);












endmodule













// any PARAMS parms go into naming of macro

module fgu_fac_ctl_msff_ctl_macro__width_12 (
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

module fgu_fac_ctl_msff_ctl_macro__width_6 (
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

module fgu_fac_ctl_msff_ctl_macro__width_5 (
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








