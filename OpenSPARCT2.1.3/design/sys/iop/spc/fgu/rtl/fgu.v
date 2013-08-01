// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fgu.v
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
module fgu (
  dec_frf_r1_addr_d, 
  dec_frf_r2_addr_d, 
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
  dec_spu_grant_d, 
  dec_exu_src_vld_d, 
  dec_irf_w_addr_d, 
  dec_frf_store_d, 
  dec_fsr_store_d, 
  dec_valid_e, 
  dec_fgu_op3_d, 
  dec_fgu_opf_d, 
  dec_fgu_fmov_vld_m, 
  dec_fgu_decode_d, 
  dec_fgu_valid_e, 
  dec_fgu_tid_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  fgu_cmp_fcc_fx3, 
  fgu_cmp_fcc_vld_fx3, 
  fgu_cmp_fcc_tid_fx2, 
  fgu_fld_fcc_fx3, 
  fgu_fld_fcc_vld_fx3, 
  fgu_fprs_fef, 
  fgu_fdiv_stall, 
  fgu_idiv_stall, 
  fgu_divide_completion, 
  tlu_flush_fgu_b, 
  tlu_ceter_pscce, 
  tlu_cerer_frf, 
  spc_core_running_status, 
  fgu_predict_fx2, 
  fgu_pdist_beat2_fx1, 
  fgu_cecc_fx2, 
  fgu_uecc_fx2, 
  fgu_ecc_addr_fx2, 
  fgu_ecc_check_fx2, 
  fgu_fpx_ieee_trap_fw, 
  fgu_fpd_ieee_trap_fw, 
  fgu_fpx_unfin_fw, 
  fgu_fpd_unfin_fw, 
  fgu_fpd_idiv0_trap_fw, 
  fgu_fpx_trap_tid_fw, 
  fgu_fpd_trap_tid_fw, 
  lsu_fgu_fld_data_b, 
  lsu_fgu_fld_addr_b, 
  lsu_fgu_fld_vld_w, 
  lsu_fgu_fld_b, 
  lsu_fgu_fld_tid_b, 
  lsu_fgu_fld_32b_b, 
  lsu_fgu_fld_odd32b_b, 
  lsu_fgu_fsr_load_b, 
  lsu_fgu_exception_w, 
  lsu_block_store_m, 
  lsu_asi_error_inject, 
  lsu_fgu_pmen, 
  lsu_asi_clken, 
  fgu_lsu_fst_data_fx1, 
  fgu_fst_ecc_error_fx2, 
  exu_fgu_rs1_e, 
  exu_fgu_rs2_e, 
  exu_fgu_gsr_m, 
  exu_fgu_gsr_vld_m, 
  exu_fgu_flush_m, 
  fgu_exu_icc_fx5, 
  fgu_exu_xcc_fx5, 
  fgu_exu_cc_vld_fx5, 
  fgu_exu_w_vld_fx5, 
  fgu_result_tid_fx5, 
  fgu_irf_w_addr_fx5, 
  fgu_exu_result_fx5, 
  spu_fgu_fpy_ctl_d, 
  spu_fgu_rs1_e, 
  spu_fgu_rs2_e, 
  fgu_accum_b0_fx5, 
  fgu_mul_result_fx5, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lb_scan_en_wmr, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  mbi_frf_read_en, 
  mbi_frf_write_en, 
  mbi_addr, 
  mbi_wdata, 
  mbi_run, 
  in_rngl_cdbus, 
  fgu_mbi_frf_fail, 
  fgu_rngl_cdbus, 
  scan_out, 
  wmr_scan_out);
wire fpf_scanin;
wire fpf_scanout;
wire [4:0] fad_fsr_tem_fx1;
wire fpy_scanin;
wire fpy_scanout;
wire fpe_scanin;
wire fpe_scanout;
wire fpc_wmr_scanin;
wire fpc_wmr_scanout;
wire fpc_scanin;
wire fpc_scanout;
wire [63:0] fad_rs1_fmt_fx1;
wire [63:0] fad_rs2_fmt_fx1;
wire fdc_finish_int_early_rep0;
wire fdc_finish_fltd_early_rep0;
wire fdc_finish_flts_early_rep0;
wire fpf_bze0_fx1;
wire fpf_boe0_fx1;
wire fpf_bzf0_fx1;
wire fpf_aze0_fx1;
wire fpf_aoe0_fx1;
wire fpf_azf0_fx1;
wire main_clken0;
wire fic_scanin;
wire fic_scanout;
wire fgd_wmr_scanin;
wire fgd_wmr_scanout;
wire fgd_scanin;
wire fgd_scanout;
wire fdd_scanin;
wire fdd_scanout;
wire fdc_scanin;
wire fdc_scanout;
wire fpf_hi_bof_fx1_rep0;
wire fpf_lo_bof_fx1_rep0;
wire fpe_rs2_fmt_fx1_b0_rep0;
wire div_clken_rep0;
wire fac_div_valid_fx1_rep0;
wire fac_divq_valid_fx1_rep0;
wire [4:0] fac_div_control_fx1_rep0;
wire fad_wmr_scanin;
wire fad_wmr_scanout;
wire fad_scanin;
wire fad_scanout;
wire fac_wmr_scanin;
wire fac_wmr_scanout;
wire fac_scanin;
wire fac_scanout;
wire fec_scanin;
wire fec_scanout;
wire frf_scanin;
wire frf_scanout;
wire [4:0] fac_w1_addr_fb;
wire [2:0] fac_w1_tid_fb;
wire [1:0] fpc_w1_vld_fb;
wire [4:0] fad_w2_addr_fw;
wire [2:0] fad_w2_tid_fw;
wire [1:0] fad_w2_vld_fw;
wire [63:0] fpf_w1_result_fb;
wire [13:0] fpf_w1_synd_fb;
wire [63:0] fad_w2_result_fw;
wire [13:0] fec_w2_synd_fw;
wire [2:0] fac_tid_d;
wire fac_frf_r1_vld_d;
wire [4:0] fac_frf_r1_addr_d;
wire [63:0] frf_r1_data_e;
wire [13:0] frf_r1_ecc_e;
wire [63:0] frf_r2_data_e;
wire [13:0] frf_r2_ecc_e;
wire [63:0] fad_rs1_fmt_fx1_rep0;
wire [63:0] fad_rs1_fmt_fx1_rep01;
wire [63:0] fad_rs2_fmt_fx1_rep0;
wire [63:0] fad_rs2_fmt_fx1_rep01;
wire [63:0] fad_rs2_fmt_fx1_rep1;
wire [63:0] fdd_result;
wire [62:11] fdd_result_rep0;
wire fpf_hi_bof_fx1;
wire fpf_lo_bof_fx1;
wire [10:0] fpe_rs2_fmt_fx1;
wire mul_clken;
wire div_clken;
wire mul_clken_rep0;
wire mul_clken_rep01;
wire fac_div_valid_fx1;
wire fac_divq_valid_fx1;
wire [4:0] fac_div_control_fx1;
wire fdc_finish_int_early;
wire fdc_finish_fltd_early;
wire fdc_finish_flts_early;
wire [63:0] fad_rs1_fx1;
wire [63:0] fad_rs2_fx1;
wire fad_r1_odd32b_fx1;
wire [63:0] fgd_result_fx5;
wire [5:1] fpc_int_res_sel_fx4;
wire [3:0] fpc_vis_cmp_result_fx5;
wire [5:0] fpc_result_sel_fx5;
wire [1:0] fpc_ovf_if_rcout_fx5;
wire [4:0] fpc_ma_fmt_sel_fx4;
wire [3:0] fpc_int_sel_fx5;
wire [4:0] fpc_fconst_sel_fx5;
wire fpc_fp_cin00_fx2;
wire fpc_cin00_fx2;
wire fpc_cin16_48_fx2;
wire fpc_cin32_fx2;
wire fpc_prop16_48_fx2;
wire fpc_prop32_fx2;
wire fpc_mle_sel_fx2;
wire [2:0] fpc_mse_sel_fx2;
wire fpc_sign_fx5;
wire fpc_sign_fb;
wire fpc_sp_dest_fx4;
wire fpc_fadd_eac_enable_fx2;
wire [3:2] fpc_i2f_sel_fx1;
wire fpc_rinc_sel_fx5;
wire fpc_qthenan_fx4;
wire fpc_den2nor_sp_fb;
wire fpc_den2nor_dp_fb;
wire [3:0] fpf_b_gteq_a_fx2;
wire [3:0] fpf_b_eq_a_fx2;
wire fpf_hi_aof_fx1;
wire fpf_lo_aof_fx1;
wire [63:0] fpf_ma_sum_fx4;
wire fpf_ma_cout_fx4;
wire fpf_cmp_swap_blta_fx2;
wire fpf_align_sticky_fx4_l;
wire [1:0] fpf_byte_unsure_x_sp_fx3;
wire [1:0] fpf_byte_unsure_x_dp_fx3;
wire [5:0] fic_norm_eadj_fx5;
wire [5:0] fic_i2f_align_sel_fx2;
wire [63:0] fpf_rs2_cmp_din_fx1;
wire [38:32] fpf_man_se_byte_fx3_b38_32;
wire [6:0] fpf_man_se_byte_fx3_b6_0;
wire fac_tlu_flush_fx3;
wire fac_fpx_sp_dest_fx1;
wire fac_fpx_sp_src_fx1;
wire [3:0] fac_pre_fcc_vld_fx2;
wire fac_fcmpe_fx1;
wire [4:0] fac_rs2_rotate_sel_e;
wire [1:0] fac_i2f_sel_e;
wire fac_force_swap_blta_fx1;
wire fac_force_noswap_blta_fx1;
wire main_clken;
wire fpy_fp_result_fx4_b63;
wire fpf_sa_xor_sb_fx1;
wire [10:0] fpe_exp_res_fb;
wire [10:0] fpe_align_sel_fx2;
wire fpf_rcout_fx5;
wire fpf_rcout_fb;
wire fpf_implied_bit_fx5;
wire [6:0] fec_w1_ecc_inject_fb;
wire fac_xr_mode_fx1;
wire [4:0] fac_rs1_sel_fx1;
wire [3:0] fac_rs2_sel_fx1;
wire [1:0] fac_8x16_rnd_fx3;
wire [3:0] fac_scff_sel_fx3;
wire [6:0] fac_accum_sel_fx3;
wire [5:0] fac_result_sel_fx4;
wire fac_ma_result_en_fx4;
wire fpy_sticky_dp_fx5;
wire fpy_sticky_sp_fx5;
wire [1:0] fpy_xicc_z_fx5;
wire [9:0] fac_aexp_fmt_sel_e;
wire [7:0] fac_bexp_fmt_sel_e;
wire fac_aux_cin_fx1;
wire fpc_exp_sel_mul_fx5;
wire [3:0] fpc_eintx_sel_fx2;
wire [2:0] fpc_eadjx_sel_fx2;
wire fpc_q_rinc_sel_fx5;
wire fpe_aux_rs2_fmt_fx1_b0;
wire [11:0] fpe_aux_eint_fx1;
wire [10:0] fpe_rs1_fmt_fx1;
wire fpe_einty_adj_cout_fx5;
wire fpe_einty_eq_eadj_fx5;
wire [5:0] fic_i2f_eadj_fx2;
wire fpc_fpd_ieee_trap_fb;
wire fpc_fpx_unfin_fb;
wire fpc_fpd_unfin_fb;
wire [1:0] fad_fsr_rd_fx1;
wire fad_fsr_ns_fx1;
wire [2:0] fad_gsr_imirnd_fx1;
wire fpc_w1_ul_vld_fb;
wire [1:0] fpc_fsr_w1_vld_fx5;
wire [11:0] fpc_fsr_w1_result_fw;
wire [11:0] fpc_fsr_w2_result_fw;
wire [10:0] fpc_fpd_exp_res;
wire fpc_fpd_sign_res;
wire [1:0] fpc_fpd_const_sel;
wire [1:0] fpc_fcc_fw;
wire [1:0] fpc_rd_mode_fx3;
wire fpc_emin_fx3;
wire [2:0] fac_tid_e;
wire fac_dec_valid_fx1;
wire [2:0] fac_fpx_itype_fx1;
wire [2:0] fac_fpx_dtype_fx1;
wire [1:0] fac_fpx_stype_fx1;
wire fac_fpx_sign_instr_fx1;
wire fac_fpx_rnd_trunc_fx1;
wire fac_fpx_mulscc_fx1;
wire fac_fpx_saverestore_fx1;
wire fac_fgx_pdist_fx1;
wire fac_fgx_popc_fx2;
wire fac_fgx_mvcond_fx2;
wire fac_fgx_mvucond_fx2;
wire fac_fgx_abs_fx2;
wire fac_fgx_neg_fx2;
wire fac_fpx_nv_vld_fx1;
wire fac_fpx_of_vld_fx1;
wire fac_fpx_uf_vld_fx1;
wire fac_fpx_dz_vld_fx1;
wire fac_fpx_nx_vld_fx1;
wire fac_fpx_unfin_vld_fx1;
wire fac_fgx_instr_fx4;
wire [1:0] fac_w1_vld_fx1;
wire fac_w1_odd32b_fx1;
wire [4:1] fac_opf_fx2;
wire fac_fgx_siam_fx2;
wire fac_fsr_store_fx2;
wire [2:0] fac_gsr_asr_tid_fx2;
wire fac_rng_wr_gsr_3f;
wire [1:0] fac_gsr_w_vld_fx2;
wire fac_dec_valid_noflush_fx5;
wire fac_exu_src_e;
wire coreon_clken;
wire [3:0] fpc_fcc_vld_fx5;
wire fpc_stfsr_en_fx3to5;
wire fic_mulscc_iccz_fx4;
wire fic_mulscc_xccz_fx4;
wire fic_convert_sticky_fx4;
wire fic_fxtod_sticky_fx4;
wire fic_ftoi_nx_fx4;
wire fic_ftox_nx_fx4;
wire fic_bzf31msb_fx2;
wire fic_bzf32lsb_fx2;
wire fic_bof22msb_fx2;
wire fpc_lzd_override_fx4;
wire fpc_sp_source_fx3;
wire fdc_flt_inexact;
wire [1:0] fdc_xicc_z_early;
wire fdc_icc_v_early;
wire fdc_dec_exp_early;
wire fpc_pre_div_flush_fx2;
wire fpc_div_default_res_fx2;
wire fdd_pte_cla_early_b63;
wire fec_cecc_fx2;
wire fec_uecc_fx2;
wire fpc_frf_store_vld_fx1;
wire [1:0] fpc_gsr0_mask_sel_fx3;
wire [1:0] fpc_gsr1_mask_sel_fx3;
wire [1:0] fpc_gsr2_mask_sel_fx3;
wire [1:0] fpc_gsr3_mask_sel_fx3;
wire [1:0] fpc_gsr4_mask_sel_fx3;
wire [1:0] fpc_gsr5_mask_sel_fx3;
wire [1:0] fpc_gsr6_mask_sel_fx3;
wire [1:0] fpc_gsr7_mask_sel_fx3;
wire [4:0] fpc_gsr_scale_fx4;
wire [2:0] fpc_gsr_align_fx4;
wire [10:0] fpc_gsr_asr_11bits_fx4;
wire [62:0] fgd_rngl_cdbus_3f;
wire vis_clken;
wire fac_fgx_logical_fx2;
wire fac_fgx_expand_fx2;
wire fac_fgx_merge_fx2;
wire fac_fgx_align_fx2;
wire fac_fgx_shuffle_fx2;
wire fac_fgx_pack16_fx2;
wire fac_fgx_pack32_fx2;
wire fac_fgx_packfix_fx2;
wire fac_fgx_pack_sel_fx2;
wire [2:0] fac_tid_fx2;
wire [2:0] fac_rng_fprs;
wire fac_rng_rd_fprs_4f;
wire fac_rng_rd_gsr_4f;
wire [13:0] fec_r1_ecc_fx1;
wire fac_rng_rd_ecc_4f;
wire fac_rng_rd_or_wr_3f;
wire asi_clken;
wire fgd_gsr_asr_mask_fx4_b31;
wire fdc_asign_lth;
wire fdc_bsign_lth;
wire fdc_bsign_lth_;
wire fdc_pe_cycle3;
wire fdc_pe_cmux_sel;
wire [2:0] fdc_pe_smux_sel;
wire [5:0] fdc_pe_xsht_ctl;
wire fdc_ie_fsqrt_valid_even;
wire fdc_ie_fsqrt_valid_even_;
wire fdc_ie_fsqrt_valid_odd;
wire fdc_ie_fsqrt_valid_odd_;
wire [4:0] fdc_ie_rmux_sel;
wire [2:0] fdc_ie_dmux_sel;
wire fdc_flt_increment;
wire [1:0] fdc_pte_clasel;
wire fdc_pte_csa_cin;
wire fdc_pte_cycle2;
wire fdc_emin_lth;
wire [2:0] fdc_pte_qsel;
wire fdc_pte_stall_;
wire [1:0] fdc_flt_round;
wire [4:0] fdc_idiv_ctl;
wire fdc_fdx_cin_in;
wire [2:0] fdc_qsel00;
wire [2:0] fdc_qsel1;
wire [1:0] fdc_q_in;
wire [1:0] fdc_qm1_in;
wire [63:0] fdd_pe_clth;
wire fdd_cla_zero32_;
wire fdd_cla_zero64_;
wire fdd_fdx_din0;
wire fdd_fdx_din1;
wire fdd_fdx_cin64;
wire [4:0] fdd_fdq00_10_sum;
wire [4:0] fdd_fdq00_10_carry;
wire [3:0] fdd_fdq1p_sum;
wire [3:0] fdd_fdq1p_carry;
wire [3:0] fdd_fdq1n_sum;
wire [3:0] fdd_fdq1n_carry;
wire fac_div_flush_fx3;
wire [4:0] fac_frf_r1_addr_e;
wire [4:0] fac_aman_fmt_sel_e;
wire [4:0] fac_bman_fmt_sel_e;
wire [3:0] fac_fst_fmt_sel_fx1;
wire [4:0] fac_fpd_addr_fb;
wire fac_w1_32b_fb;
wire fac_fpd_32b_fb;
wire fac_w1_odd32b_fb;
wire fac_fpd_odd32b_fb;
wire [2:0] fac_fpd_tid_fb;
wire [5:0] fac_fsr0_sel_fw;
wire [5:0] fac_fsr1_sel_fw;
wire [5:0] fac_fsr2_sel_fw;
wire [5:0] fac_fsr3_sel_fw;
wire [5:0] fac_fsr4_sel_fw;
wire [5:0] fac_fsr5_sel_fw;
wire [5:0] fac_fsr6_sel_fw;
wire [5:0] fac_fsr7_sel_fw;
wire fad_w2_addr_fw1_b4;
wire [2:0] fad_w2_tid_fw1;
wire [1:0] fad_w2_vld_fw1;
wire [2:0] fad_w1_tid_fw;
wire [1:0] fad_w1_vld_fw;
wire [63:0] fad_nombi_w2_result_fw;
wire fad_r1_byp_hit_fx1;
wire fad_r2_byp_hit_fx1;
wire fad_i_parity_2e_fx1;
wire fad_i_parity_2o_fx1;
wire fad_i_parity_1e_fx1;
wire fad_i_parity_1o_fx1;
wire [7:0] fac_mbist_addr_1f;
wire [7:0] fec_mbist_wdata_1f;
wire [7:0] fec_mbist_wdata_3f;
wire fad_mbist_cmp64_fx1;
wire [1:0] fac_r1_vld_fx1;
wire [1:0] fac_r2_vld_fx1;
wire fac_ecc_trap_en_fx1;



// ----------------------------------------------------------------------------
// Interface with DEC
// ----------------------------------------------------------------------------

input    [4:0] dec_frf_r1_addr_d;      // FRF r1 read addr
input    [4:0] dec_frf_r2_addr_d;      // FRF r2 read addr (incl. STF,STDF)
input          dec_frf_r1_vld_d;       // FRF r1 read valid
input          dec_frf_r2_vld_d;       // FRF r2 read valid (incl. STF,STDF)
input          dec_frf_r1_32b_d;       // FRF r1 is 32-bit source
input          dec_frf_r2_32b_d;       // FRF r2 is 32-bit source
input          dec_frf_r1_odd32b_d;    // 0in custom -fire (dec_frf_r1_odd32b_d & ~dec_frf_r1_32b_d)
				       // FRF r1 is odd 32-bit source (32 LSBs)
input          dec_frf_r2_odd32b_d;    // 0in custom -fire (dec_frf_r2_odd32b_d & ~dec_frf_r2_32b_d)
				       // FRF r2 is odd 32-bit source (32 LSBs) (incl. STF,STDF)

input          dec_frf_w_vld_d;        // FRF target
input    [4:0] dec_frf_w_addr_d;       // FRF write addr
input          dec_frf_w_32b_d;        // FRF write is 32-bit dest
input          dec_frf_w_odd32b_d;     // 0in custom -fire (dec_frf_w_odd32b_d & ~dec_frf_w_32b_d)
				       // FRF write is odd 32-bit dest (32 LSBs)

input          dec_spu_grant_d;        // 0in custom -fire (($0in_delay(dec_spu_grant_d,1)) & dec_fgu_valid_e)
				       // SPU sources are valid next cycle (frf/e)
input          dec_exu_src_vld_d;      // FGU instr issued has EXU{1,0} source(s)
input    [4:0] dec_irf_w_addr_d;       // IRF write addr for EXU{1,0}

input          dec_frf_store_d;        // FGU instr issued is a store of FRF data
input          dec_fsr_store_d;        // FGU instr issued is a store of FSR data
input    [1:0] dec_valid_e;            // used by FGU to qual store FSR update of FSR.ftt

input    [5:0] dec_fgu_op3_d;          // 6-bit op3 field = instr[24:19]
input    [7:0] dec_fgu_opf_d;          // 9-bit opf field = instr[13:5] = fpop type (bit 13 is unused)
input          dec_fgu_fmov_vld_m;     // FMOV condition is true
input          dec_fgu_decode_d;       // 0in known_driven; assert_leader -leader dec_fgu_decode_d -follower dec_fgu_valid_e -min 1 -max 1
				       // FGU instr issue valid (d stage), also asserts for ST(X)FSR
input          dec_fgu_valid_e;        // 0in known_driven
				       // FGU instr issue valid (e stage), doesn't assert for ST(X)FSR
input    [2:0] dec_fgu_tid_d;          // FGU instr TID

input          dec_flush_f1;           // flush fx2 (xmit in fx1/m)
input          dec_flush_f2;           // flush fx3 (xmit in fx2/b)

output   [1:0] fgu_cmp_fcc_fx3;        // fcmp  fcc data {fccX[1:0]}
output   [3:0] fgu_cmp_fcc_vld_fx3;    // 0in bits_on -max 1
				       // fcmp  fcc data valid {fcc3, fcc2, fcc1, fcc0}
output   [2:0] fgu_cmp_fcc_tid_fx2;    // fcmp  fcc data TID
output   [7:0] fgu_fld_fcc_fx3;        // ldfsr fcc data {fcc3[1:0], fcc2[1:0], fcc1[1:0], fcc0[1:0]}
output   [1:0] fgu_fld_fcc_vld_fx3;    // 0in value -val 2'b00 2'b01 2'b11
				       // ldfsr fcc data valid {fcc3, fcc2, fcc1}, fcc0
output   [7:0] fgu_fprs_fef;           // FPRS.fef for each TID

output         fgu_fdiv_stall;         // FPD needs bubble to avoid FRF w2 port conflict
output   [1:0] fgu_idiv_stall;         // 0in bits_on -max 1
				       // FPD needs bubble to avoid FGU/IRF result bus conflict
output   [7:0] fgu_divide_completion;  // 0in bits_on -max 2
				       // FPD completion/TID

// ----------------------------------------------------------------------------
// Interface with TLU
// ----------------------------------------------------------------------------

input          tlu_flush_fgu_b;        // flush fx3, non-load (xmit in fx2/b)
input    [7:0] tlu_ceter_pscce;        // core error trap enable reg precise enable
input          tlu_cerer_frf;          // FRF ecc error trap enable
input    [7:0] spc_core_running_status; // thread active

output         fgu_predict_fx2;        // exception trap predicted
output         fgu_pdist_beat2_fx1;    // 2nd beat (bubble) of PDIST instr
output         fgu_cecc_fx2;           // FRF ECC correctable error
output         fgu_uecc_fx2;           // FRF ECC uncorrectable error
output   [5:0] fgu_ecc_addr_fx2;       // FRF cecc/uecc address (6-bit reg number format)
output  [13:0] fgu_ecc_check_fx2;      // FRF ECC check bits {even[6:0],odd[6:0]}

output         fgu_fpx_ieee_trap_fw;   // FPX enabled ieee 754 exception detected
output         fgu_fpd_ieee_trap_fw;   // FPD enabled ieee 754 exception detected
output         fgu_fpx_unfin_fw;       // unfinished_FPop
output         fgu_fpd_unfin_fw;       // unfinished_FPop
output         fgu_fpd_idiv0_trap_fw;  // integer division by zero detected
output   [2:0] fgu_fpx_trap_tid_fw;    // FPX trap TID
output   [2:0] fgu_fpd_trap_tid_fw;    // FPD trap TID

// ----------------------------------------------------------------------------
// Interface with LSU
// ----------------------------------------------------------------------------

input   [63:0] lsu_fgu_fld_data_b;     // FRF/FSR load data
input    [4:0] lsu_fgu_fld_addr_b;     // FRF     w2 write addr (fload hit/miss)
input          lsu_fgu_fld_vld_w;      // 0in custom -fire (lsu_fgu_fld_vld_w & ($0in_delay((~lsu_fgu_fld_b),1)))
				       // FRF/FSR load data valid (fload hit/miss), LSU qualified with dec_flush_lb, tlu_flush_fld_b, lsu_ldhit_b
input          lsu_fgu_fld_b;          // FRF/FSR load data (unqualified)
input    [2:0] lsu_fgu_fld_tid_b;      // FRF/FSR load data TID (fload hit/miss)
input          lsu_fgu_fld_32b_b;      // FRF/FSR is 32-bit dest (fload hit/miss)
input          lsu_fgu_fld_odd32b_b;   // 0in custom -fire (lsu_fgu_fld_odd32b_b & ~lsu_fgu_fld_32b_b)
				       // FRF     w2 is odd 32-bit dest (32 LSBs) (fload hit/miss)
input          lsu_fgu_fsr_load_b;     //     FSR is target of the load (not FRF) (unqualified)
input          lsu_fgu_exception_w;    // store exception detected
input          lsu_block_store_m;      // block store in progress

input   [31:0] lsu_asi_error_inject;   // [31]=global inject en, [24]=FRF inject en, [7:0]=mask
input          lsu_fgu_pmen;           // FGU global power management enable
input          lsu_asi_clken;          // ASI ring clk enable

output  [63:0] fgu_lsu_fst_data_fx1;   // FRF/FSR store data
output         fgu_fst_ecc_error_fx2;  // store float FRF ECC correctable/uncorrectable error

// ----------------------------------------------------------------------------
// Interface with EXUs
// ----------------------------------------------------------------------------

input   [63:0] exu_fgu_rs1_e;          // rs1 source from EXU{1,0}
                                       //   MULScc format: {30'b0,Y[0],1'b0,icc.nXORicc.v,rs1[31:1]}
input   [63:0] exu_fgu_rs2_e;          // rs2 source from EXU{1,0}

input   [31:0] exu_fgu_gsr_m;          // GSR.align data:
                                       //   [31:3] = don't care
                                       //   [2:0]  = GSR.align
                                       //   GSR.mask data:
                                       //   [31:0] = GSR.mask
input    [1:0] exu_fgu_gsr_vld_m;      // 0in bits_on -max 1
				       // GSR data valid {align,mask}
input          exu_fgu_flush_m;        // EXU{1,0} src has bad ECC or exception, FGU must flush instr

output   [3:0] fgu_exu_icc_fx5;        // int icc cond code {N,Z,V,C}
output   [1:0] fgu_exu_xcc_fx5;        // int xcc cond code {N,Z}
output         fgu_exu_cc_vld_fx5;     // int icc/xcc cond code valid
output   [1:0] fgu_exu_w_vld_fx5;      // 0in bits_on -max 1
				       // FGU data result valid for EXU{1,0} w port
output   [1:0] fgu_result_tid_fx5;     // FGU result TID for EXU{1,0} or SPU
output   [4:0] fgu_irf_w_addr_fx5;     // IRF w1 write addr
output  [63:0] fgu_exu_result_fx5;     // FGU result for EXU{1,0}

// ----------------------------------------------------------------------------
// Interface with SPU
// ----------------------------------------------------------------------------

input    [6:0] spu_fgu_fpy_ctl_d;      // Mult control
input   [63:0] spu_fgu_rs1_e;          // rs1 source from SPU
input   [63:0] spu_fgu_rs2_e;          // rs2 source from SPU

output         fgu_accum_b0_fx5;
output  [63:0] fgu_mul_result_fx5;     // FGU result for SPU

// ----------------------------------------------------------------------------
// Global Signals
// ----------------------------------------------------------------------------

input          l2clk;                  // clock input
input	       scan_in;
input          spc_aclk_wmr;
input          wmr_scan_in;
input          lb_scan_en_wmr;
input	       tcu_pce_ov;	       // scan signals
input	       spc_aclk;
input	       spc_bclk;
input          tcu_muxtest;
input 	       tcu_dectest;
input 	       tcu_scan_en;
input          tcu_array_wr_inhibit;
input          tcu_se_scancollar_in;
input          tcu_se_scancollar_out;
input          mbi_frf_read_en;        // MBIST
input          mbi_frf_write_en;       // MBIST
input    [7:0] mbi_addr;               // MBIST
input    [7:0] mbi_wdata;              // MBIST
input          mbi_run;                // MBIST
input   [64:0] in_rngl_cdbus;          // ASI local ring

output         fgu_mbi_frf_fail;       // MBIST
output  [64:0] fgu_rngl_cdbus;         // ASI local ring
output 	       scan_out;
output         wmr_scan_out;

// ----------------------------------------------------------------------------
// Instantiate sub-units
// ----------------------------------------------------------------------------

fgu_rep_dp    rep (.fad_rs1_fmt_fx1(fad_rs1_fmt_fx1[63:0]),
  .fad_rs2_fmt_fx1(fad_rs2_fmt_fx1[63:0]),
  .fad_rs1_fmt_fx1_rep0(fad_rs1_fmt_fx1_rep0[63:0]),
  .fad_rs1_fmt_fx1_rep01(fad_rs1_fmt_fx1_rep01[63:0]),
  .fad_rs2_fmt_fx1_rep0(fad_rs2_fmt_fx1_rep0[63:0]),
  .fad_rs2_fmt_fx1_rep01(fad_rs2_fmt_fx1_rep01[63:0]),
  .fad_rs2_fmt_fx1_rep1(fad_rs2_fmt_fx1_rep1[63:0]),
  .fdd_result(fdd_result[62:11]),
  .fdd_result_rep0(fdd_result_rep0[62:11]),
  .fpf_hi_bof_fx1(fpf_hi_bof_fx1),
  .fpf_lo_bof_fx1(fpf_lo_bof_fx1),
  .fpf_hi_bof_fx1_rep0(fpf_hi_bof_fx1_rep0),
  .fpf_lo_bof_fx1_rep0(fpf_lo_bof_fx1_rep0),
  .fpe_rs2_fmt_fx1(fpe_rs2_fmt_fx1[0:0]),
  .fpe_rs2_fmt_fx1_b0_rep0(fpe_rs2_fmt_fx1_b0_rep0),
  .mul_clken(mul_clken),
  .div_clken(div_clken),
  .mul_clken_rep0(mul_clken_rep0),
  .mul_clken_rep01(mul_clken_rep01),
  .div_clken_rep0(div_clken_rep0),
  .fac_div_valid_fx1(fac_div_valid_fx1),
  .fac_divq_valid_fx1(fac_divq_valid_fx1),
  .fac_div_control_fx1(fac_div_control_fx1[4:0]),
  .fac_div_valid_fx1_rep0(fac_div_valid_fx1_rep0),
  .fac_divq_valid_fx1_rep0(fac_divq_valid_fx1_rep0),
  .fac_div_control_fx1_rep0(fac_div_control_fx1_rep0[4:0]),
  .fdc_finish_int_early(fdc_finish_int_early),
  .fdc_finish_fltd_early(fdc_finish_fltd_early),
  .fdc_finish_flts_early(fdc_finish_flts_early),
  .fdc_finish_int_early_rep0(fdc_finish_int_early_rep0),
  .fdc_finish_fltd_early_rep0(fdc_finish_fltd_early_rep0),
  .fdc_finish_flts_early_rep0(fdc_finish_flts_early_rep0)
 );

fgu_fpf_dp    fpf (
 .scan_in(fpf_scanin),
 .scan_out(fpf_scanout),
 .l2clk(l2clk),
 .fad_fsr_tem_fx1_b4     (fad_fsr_tem_fx1[4]),
  .fad_rs1_fmt_fx1(fad_rs1_fmt_fx1[63:0]),
  .fad_rs2_fmt_fx1(fad_rs2_fmt_fx1[63:0]),
  .fad_rs1_fx1(fad_rs1_fx1[63:0]),
  .fad_rs2_fx1(fad_rs2_fx1[63:0]),
  .fad_r1_odd32b_fx1(fad_r1_odd32b_fx1),
  .fpf_w1_result_fb(fpf_w1_result_fb[63:0]),
  .fgu_exu_result_fx5(fgu_exu_result_fx5[63:0]),
  .fgd_result_fx5(fgd_result_fx5[63:0]),
  .fpc_int_res_sel_fx4(fpc_int_res_sel_fx4[5:1]),
  .fpc_vis_cmp_result_fx5(fpc_vis_cmp_result_fx5[3:0]),
  .fpc_result_sel_fx5(fpc_result_sel_fx5[5:0]),
  .fpc_ovf_if_rcout_fx5(fpc_ovf_if_rcout_fx5[1:0]),
  .fpc_ma_fmt_sel_fx4(fpc_ma_fmt_sel_fx4[4:0]),
  .fpc_int_sel_fx5(fpc_int_sel_fx5[3:0]),
  .fpc_fconst_sel_fx5(fpc_fconst_sel_fx5[4:0]),
  .fpc_fp_cin00_fx2(fpc_fp_cin00_fx2),
  .fpc_cin00_fx2(fpc_cin00_fx2),
  .fpc_cin16_48_fx2(fpc_cin16_48_fx2),
  .fpc_cin32_fx2(fpc_cin32_fx2),
  .fpc_prop16_48_fx2(fpc_prop16_48_fx2),
  .fpc_prop32_fx2(fpc_prop32_fx2),
  .fpc_mle_sel_fx2(fpc_mle_sel_fx2),
  .fpc_mse_sel_fx2(fpc_mse_sel_fx2[2:0]),
  .fpc_sign_fx5(fpc_sign_fx5),
  .fpc_sign_fb(fpc_sign_fb),
  .fpc_sp_dest_fx4(fpc_sp_dest_fx4),
  .fpc_fadd_eac_enable_fx2(fpc_fadd_eac_enable_fx2),
  .fpc_i2f_sel_fx1(fpc_i2f_sel_fx1[3:2]),
  .fpc_rinc_sel_fx5(fpc_rinc_sel_fx5),
  .fpc_qthenan_fx4(fpc_qthenan_fx4),
  .fpc_den2nor_sp_fb(fpc_den2nor_sp_fb),
  .fpc_den2nor_dp_fb(fpc_den2nor_dp_fb),
  .fpf_b_gteq_a_fx2(fpf_b_gteq_a_fx2[3:0]),
  .fpf_b_eq_a_fx2(fpf_b_eq_a_fx2[3:0]),
  .fpf_hi_aof_fx1(fpf_hi_aof_fx1),
  .fpf_hi_bof_fx1(fpf_hi_bof_fx1),
  .fpf_lo_aof_fx1(fpf_lo_aof_fx1),
  .fpf_lo_bof_fx1(fpf_lo_bof_fx1),
  .fpf_azf0_fx1(fpf_azf0_fx1),
  .fpf_bzf0_fx1(fpf_bzf0_fx1),
  .fpf_aoe0_fx1(fpf_aoe0_fx1),
  .fpf_boe0_fx1(fpf_boe0_fx1),
  .fpf_aze0_fx1(fpf_aze0_fx1),
  .fpf_bze0_fx1(fpf_bze0_fx1),
  .fpf_ma_sum_fx4(fpf_ma_sum_fx4[63:0]),
  .fpf_ma_cout_fx4(fpf_ma_cout_fx4),
  .fpf_cmp_swap_blta_fx2(fpf_cmp_swap_blta_fx2),
  .fpf_align_sticky_fx4_l(fpf_align_sticky_fx4_l),
  .fpf_byte_unsure_x_sp_fx3(fpf_byte_unsure_x_sp_fx3[1:0]),
  .fpf_byte_unsure_x_dp_fx3(fpf_byte_unsure_x_dp_fx3[1:0]),
  .fic_norm_eadj_fx5(fic_norm_eadj_fx5[5:0]),
  .fic_i2f_align_sel_fx2(fic_i2f_align_sel_fx2[5:0]),
  .fpf_rs2_cmp_din_fx1(fpf_rs2_cmp_din_fx1[63:0]),
  .fpf_man_se_byte_fx3_b38_32(fpf_man_se_byte_fx3_b38_32[38:32]),
  .fpf_man_se_byte_fx3_b6_0(fpf_man_se_byte_fx3_b6_0[6:0]),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0]),
  .fac_tlu_flush_fx3(fac_tlu_flush_fx3),
  .fac_fpx_sp_dest_fx1(fac_fpx_sp_dest_fx1),
  .fac_fpx_sp_src_fx1(fac_fpx_sp_src_fx1),
  .fac_pre_fcc_vld_fx2(fac_pre_fcc_vld_fx2[3:0]),
  .fac_fcmpe_fx1(fac_fcmpe_fx1),
  .fac_rs2_rotate_sel_e(fac_rs2_rotate_sel_e[4:0]),
  .fac_i2f_sel_e(fac_i2f_sel_e[1:0]),
  .fac_force_swap_blta_fx1(fac_force_swap_blta_fx1),
  .fac_force_noswap_blta_fx1(fac_force_noswap_blta_fx1),
  .main_clken(main_clken),
  .fgu_mul_result_fx5(fgu_mul_result_fx5[63:0]),
  .fpy_fp_result_fx4_b63(fpy_fp_result_fx4_b63),
  .fdc_finish_int_early(fdc_finish_int_early),
  .fdd_result(fdd_result[63:0]),
  .fpf_sa_xor_sb_fx1(fpf_sa_xor_sb_fx1),
  .fpe_exp_res_fb(fpe_exp_res_fb[10:0]),
  .fpe_align_sel_fx2(fpe_align_sel_fx2[5:0]),
  .fpf_rcout_fx5(fpf_rcout_fx5),
  .fpf_rcout_fb(fpf_rcout_fb),
  .fpf_implied_bit_fx5(fpf_implied_bit_fx5),
  .fec_w1_ecc_inject_fb(fec_w1_ecc_inject_fb[6:0]),
  .fpf_w1_synd_fb(fpf_w1_synd_fb[13:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en)
 );

fgu_fpy_dp    fpy (
 .scan_in(fpy_scanin),
 .scan_out(fpy_scanout),
 .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .mul_clken_rep0(mul_clken_rep0),
  .mul_clken_rep01(mul_clken_rep01),
  .spu_fgu_rs1_e(spu_fgu_rs1_e[63:0]),
  .spu_fgu_rs2_e(spu_fgu_rs2_e[63:0]),
  .fad_rs1_fmt_fx1_rep0(fad_rs1_fmt_fx1_rep0[63:0]),
  .fad_rs2_fmt_fx1_rep0(fad_rs2_fmt_fx1_rep0[63:0]),
  .fad_rs2_fmt_fx1_rep1(fad_rs2_fmt_fx1_rep1[63:0]),
  .fac_xr_mode_fx1(fac_xr_mode_fx1),
  .fac_rs1_sel_fx1(fac_rs1_sel_fx1[4:0]),
  .fac_rs2_sel_fx1(fac_rs2_sel_fx1[3:0]),
  .fac_8x16_rnd_fx3(fac_8x16_rnd_fx3[1:0]),
  .fac_scff_sel_fx3(fac_scff_sel_fx3[3:0]),
  .fac_accum_sel_fx3(fac_accum_sel_fx3[6:0]),
  .fac_result_sel_fx4(fac_result_sel_fx4[5:0]),
  .fac_ma_result_en_fx4(fac_ma_result_en_fx4),
  .fgu_mul_result_fx5(fgu_mul_result_fx5[63:0]),
  .fpy_sticky_dp_fx5(fpy_sticky_dp_fx5),
  .fpy_sticky_sp_fx5(fpy_sticky_sp_fx5),
  .fpy_fp_result_fx4_b63(fpy_fp_result_fx4_b63),
  .fpy_xicc_z_fx5(fpy_xicc_z_fx5[1:0]),
  .fgu_accum_b0_fx5(fgu_accum_b0_fx5)
 );

fgu_fpe_dp    fpe (
 .scan_in(fpe_scanin),
 .scan_out(fpe_scanout),
 .l2clk(l2clk),
 .fgu_mul_result_fx5_b63(fgu_mul_result_fx5[63]),
  .fad_rs1_fx1(fad_rs1_fx1[62:23]),
  .fad_rs2_fx1(fad_rs2_fx1[62:23]),
  .fac_aexp_fmt_sel_e(fac_aexp_fmt_sel_e[9:0]),
  .fac_bexp_fmt_sel_e(fac_bexp_fmt_sel_e[7:0]),
  .fac_aux_cin_fx1(fac_aux_cin_fx1),
  .main_clken(main_clken),
  .fpc_exp_sel_mul_fx5(fpc_exp_sel_mul_fx5),
  .fpc_eintx_sel_fx2(fpc_eintx_sel_fx2[3:0]),
  .fpc_eadjx_sel_fx2(fpc_eadjx_sel_fx2[2:0]),
  .fpc_ma_fmt_sel_fx4(fpc_ma_fmt_sel_fx4[1:0]),
  .fpc_rinc_sel_fx5(fpc_rinc_sel_fx5),
  .fpc_q_rinc_sel_fx5(fpc_q_rinc_sel_fx5),
  .fpe_aux_rs2_fmt_fx1_b0(fpe_aux_rs2_fmt_fx1_b0),
  .fpe_aux_eint_fx1(fpe_aux_eint_fx1[11:0]),
  .fpe_rs1_fmt_fx1(fpe_rs1_fmt_fx1[10:0]),
  .fpe_rs2_fmt_fx1(fpe_rs2_fmt_fx1[10:0]),
  .fpe_einty_adj_cout_fx5(fpe_einty_adj_cout_fx5),
  .fpe_einty_eq_eadj_fx5(fpe_einty_eq_eadj_fx5),
  .fpf_rcout_fx5(fpf_rcout_fx5),
  .fpe_exp_res_fb(fpe_exp_res_fb[10:0]),
  .fpe_align_sel_fx2(fpe_align_sel_fx2[10:0]),
  .fic_i2f_eadj_fx2(fic_i2f_eadj_fx2[5:0]),
  .fic_norm_eadj_fx5(fic_norm_eadj_fx5[5:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en)
 );

fgu_fpc_ctl   fpc (							// FS:wmr_protect
 .wmr_scan_in(fpc_wmr_scanin),
 .wmr_scan_out(fpc_wmr_scanout),
 .scan_in(fpc_scanin),
 .scan_out(fpc_scanout),
 .l2clk(l2clk),
 .fad_rs1_fmt_fx1_b62    (fad_rs1_fmt_fx1[62]),
 .fad_rs2_fmt_fx1_b62    (fad_rs2_fmt_fx1[62]),
 .fdc_finish_int_early   (fdc_finish_int_early_rep0),    // fgu global buff rename
 .fdc_finish_fltd_early  (fdc_finish_fltd_early_rep0),   // fgu global buff rename
 .fdc_finish_flts_early  (fdc_finish_flts_early_rep0),   // fgu global buff rename
 .fpf_bze_fx1            (fpf_bze0_fx1),                 // fgu global buff rename
 .fpf_boe_fx1            (fpf_boe0_fx1),                 // fgu global buff rename
 .fpf_bzf_fx1            (fpf_bzf0_fx1),                 // fgu global buff rename
 .fpf_aze_fx1            (fpf_aze0_fx1),                 // fgu global buff rename
 .fpf_aoe_fx1            (fpf_aoe0_fx1),                 // fgu global buff rename
 .fpf_azf_fx1            (fpf_azf0_fx1),                 // fgu global buff rename
 .main_clken             (main_clken0),
  .fpc_fpd_ieee_trap_fb(fpc_fpd_ieee_trap_fb),
  .fpc_fpx_unfin_fb(fpc_fpx_unfin_fb),
  .fpc_fpd_unfin_fb(fpc_fpd_unfin_fb),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_predict_fx2(fgu_predict_fx2),
  .lsu_fgu_exception_w(lsu_fgu_exception_w),
  .lsu_block_store_m(lsu_block_store_m),
  .exu_fgu_flush_m(exu_fgu_flush_m),
  .exu_fgu_gsr_m(exu_fgu_gsr_m[2:0]),
  .fgu_exu_icc_fx5(fgu_exu_icc_fx5[3:0]),
  .fgu_exu_xcc_fx5(fgu_exu_xcc_fx5[1:0]),
  .fad_rs1_fx1(fad_rs1_fx1[63:15]),
  .fad_rs2_fx1(fad_rs2_fx1[63:15]),
  .fad_fsr_rd_fx1(fad_fsr_rd_fx1[1:0]),
  .fad_fsr_tem_fx1(fad_fsr_tem_fx1[4:0]),
  .fad_fsr_ns_fx1(fad_fsr_ns_fx1),
  .fad_gsr_imirnd_fx1(fad_gsr_imirnd_fx1[2:0]),
  .fpc_w1_vld_fb(fpc_w1_vld_fb[1:0]),
  .fpc_w1_ul_vld_fb(fpc_w1_ul_vld_fb),
  .fpc_fsr_w1_vld_fx5(fpc_fsr_w1_vld_fx5[1:0]),
  .fpc_fsr_w1_result_fw(fpc_fsr_w1_result_fw[11:0]),
  .fpc_fsr_w2_result_fw(fpc_fsr_w2_result_fw[11:0]),
  .fpc_fpd_exp_res(fpc_fpd_exp_res[10:0]),
  .fpc_fpd_sign_res(fpc_fpd_sign_res),
  .fpc_fpd_const_sel(fpc_fpd_const_sel[1:0]),
  .fpc_fcc_fw(fpc_fcc_fw[1:0]),
  .fpf_b_gteq_a_fx2(fpf_b_gteq_a_fx2[3:0]),
  .fpf_b_eq_a_fx2(fpf_b_eq_a_fx2[3:0]),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0]),
  .fpf_hi_aof_fx1(fpf_hi_aof_fx1),
  .fpf_lo_aof_fx1(fpf_lo_aof_fx1),
  .fpf_ma_sum_fx4(fpf_ma_sum_fx4[63:9]),
  .fpf_ma_cout_fx4(fpf_ma_cout_fx4),
  .fpf_cmp_swap_blta_fx2(fpf_cmp_swap_blta_fx2),
  .fpf_align_sticky_fx4_l(fpf_align_sticky_fx4_l),
  .fpf_byte_unsure_x_sp_fx3(fpf_byte_unsure_x_sp_fx3[1:0]),
  .fpf_byte_unsure_x_dp_fx3(fpf_byte_unsure_x_dp_fx3[1:0]),
  .fpf_rcout_fb(fpf_rcout_fb),
  .fpf_implied_bit_fx5(fpf_implied_bit_fx5),
  .fpc_result_sel_fx5(fpc_result_sel_fx5[5:0]),
  .fpc_ovf_if_rcout_fx5(fpc_ovf_if_rcout_fx5[1:0]),
  .fpc_vis_cmp_result_fx5(fpc_vis_cmp_result_fx5[3:0]),
  .fpc_int_res_sel_fx4(fpc_int_res_sel_fx4[5:1]),
  .fpc_ma_fmt_sel_fx4(fpc_ma_fmt_sel_fx4[4:0]),
  .fpc_int_sel_fx5(fpc_int_sel_fx5[3:0]),
  .fpc_fconst_sel_fx5(fpc_fconst_sel_fx5[4:0]),
  .fpc_fp_cin00_fx2(fpc_fp_cin00_fx2),
  .fpc_cin00_fx2(fpc_cin00_fx2),
  .fpc_cin16_48_fx2(fpc_cin16_48_fx2),
  .fpc_cin32_fx2(fpc_cin32_fx2),
  .fpc_prop16_48_fx2(fpc_prop16_48_fx2),
  .fpc_prop32_fx2(fpc_prop32_fx2),
  .fpc_mle_sel_fx2(fpc_mle_sel_fx2),
  .fpc_mse_sel_fx2(fpc_mse_sel_fx2[2:0]),
  .fpc_sign_fx5(fpc_sign_fx5),
  .fpc_sign_fb(fpc_sign_fb),
  .fpc_rd_mode_fx3(fpc_rd_mode_fx3[1:0]),
  .fpc_emin_fx3(fpc_emin_fx3),
  .fpc_sp_dest_fx4(fpc_sp_dest_fx4),
  .fpc_fadd_eac_enable_fx2(fpc_fadd_eac_enable_fx2),
  .fpc_i2f_sel_fx1(fpc_i2f_sel_fx1[3:2]),
  .fpc_rinc_sel_fx5(fpc_rinc_sel_fx5),
  .fpc_qthenan_fx4(fpc_qthenan_fx4),
  .fpc_den2nor_sp_fb(fpc_den2nor_sp_fb),
  .fpc_den2nor_dp_fb(fpc_den2nor_dp_fb),
  .fpe_aux_rs2_fmt_fx1_b0(fpe_aux_rs2_fmt_fx1_b0),
  .fpe_aux_eint_fx1(fpe_aux_eint_fx1[11:0]),
  .fpe_align_sel_fx2(fpe_align_sel_fx2[10:0]),
  .fpe_rs1_fmt_fx1(fpe_rs1_fmt_fx1[10:0]),
  .fpe_rs2_fmt_fx1(fpe_rs2_fmt_fx1[10:0]),
  .fpe_einty_adj_cout_fx5(fpe_einty_adj_cout_fx5),
  .fpe_einty_eq_eadj_fx5(fpe_einty_eq_eadj_fx5),
  .fpc_exp_sel_mul_fx5(fpc_exp_sel_mul_fx5),
  .fpc_eintx_sel_fx2(fpc_eintx_sel_fx2[3:0]),
  .fpc_eadjx_sel_fx2(fpc_eadjx_sel_fx2[2:0]),
  .fpc_q_rinc_sel_fx5(fpc_q_rinc_sel_fx5),
  .fac_tlu_flush_fx3(fac_tlu_flush_fx3),
  .fac_tid_e(fac_tid_e[2:0]),
  .fac_dec_valid_fx1(fac_dec_valid_fx1),
  .fac_fpx_itype_fx1(fac_fpx_itype_fx1[2:0]),
  .fac_fpx_dtype_fx1(fac_fpx_dtype_fx1[2:0]),
  .fac_fpx_stype_fx1(fac_fpx_stype_fx1[1:0]),
  .fac_fpx_sign_instr_fx1(fac_fpx_sign_instr_fx1),
  .fac_fpx_rnd_trunc_fx1(fac_fpx_rnd_trunc_fx1),
  .fac_fcmpe_fx1(fac_fcmpe_fx1),
  .fac_fpx_mulscc_fx1(fac_fpx_mulscc_fx1),
  .fac_fpx_saverestore_fx1(fac_fpx_saverestore_fx1),
  .fac_fgx_pdist_fx1(fac_fgx_pdist_fx1),
  .fac_fgx_popc_fx2(fac_fgx_popc_fx2),
  .fac_fgx_mvcond_fx2(fac_fgx_mvcond_fx2),
  .fac_fgx_mvucond_fx2(fac_fgx_mvucond_fx2),
  .fac_fgx_abs_fx2(fac_fgx_abs_fx2),
  .fac_fgx_neg_fx2(fac_fgx_neg_fx2),
  .fac_fpx_nv_vld_fx1(fac_fpx_nv_vld_fx1),
  .fac_fpx_of_vld_fx1(fac_fpx_of_vld_fx1),
  .fac_fpx_uf_vld_fx1(fac_fpx_uf_vld_fx1),
  .fac_fpx_dz_vld_fx1(fac_fpx_dz_vld_fx1),
  .fac_fpx_nx_vld_fx1(fac_fpx_nx_vld_fx1),
  .fac_fpx_unfin_vld_fx1(fac_fpx_unfin_vld_fx1),
  .fac_fgx_instr_fx4(fac_fgx_instr_fx4),
  .fac_w1_vld_fx1(fac_w1_vld_fx1[1:0]),
  .fac_w1_odd32b_fx1(fac_w1_odd32b_fx1),
  .fac_opf_fx2(fac_opf_fx2[3:1]),
  .fac_fgx_siam_fx2(fac_fgx_siam_fx2),
  .fac_div_valid_fx1(fac_div_valid_fx1),
  .fac_divq_valid_fx1(fac_divq_valid_fx1),
  .fac_fsr_store_fx2(fac_fsr_store_fx2),
  .fac_gsr_asr_tid_fx2(fac_gsr_asr_tid_fx2[2:0]),
  .fac_rng_wr_gsr_3f(fac_rng_wr_gsr_3f),
  .fac_gsr_w_vld_fx2(fac_gsr_w_vld_fx2[1:0]),
  .fac_dec_valid_noflush_fx5(fac_dec_valid_noflush_fx5),
  .fac_exu_src_e(fac_exu_src_e),
  .coreon_clken(coreon_clken),
  .fpc_fcc_vld_fx5(fpc_fcc_vld_fx5[3:0]),
  .fpc_stfsr_en_fx3to5(fpc_stfsr_en_fx3to5),
  .fic_norm_eadj_fx5(fic_norm_eadj_fx5[5:0]),
  .fic_mulscc_iccz_fx4(fic_mulscc_iccz_fx4),
  .fic_mulscc_xccz_fx4(fic_mulscc_xccz_fx4),
  .fic_convert_sticky_fx4(fic_convert_sticky_fx4),
  .fic_fxtod_sticky_fx4(fic_fxtod_sticky_fx4),
  .fic_ftoi_nx_fx4(fic_ftoi_nx_fx4),
  .fic_ftox_nx_fx4(fic_ftox_nx_fx4),
  .fic_bzf31msb_fx2(fic_bzf31msb_fx2),
  .fic_bzf32lsb_fx2(fic_bzf32lsb_fx2),
  .fic_bof22msb_fx2(fic_bof22msb_fx2),
  .fpc_lzd_override_fx4(fpc_lzd_override_fx4),
  .fpc_sp_source_fx3(fpc_sp_source_fx3),
  .fdc_flt_inexact(fdc_flt_inexact),
  .fdc_xicc_z_early(fdc_xicc_z_early[1:0]),
  .fdc_icc_v_early(fdc_icc_v_early),
  .fdc_dec_exp_early(fdc_dec_exp_early),
  .fpc_pre_div_flush_fx2(fpc_pre_div_flush_fx2),
  .fpc_div_default_res_fx2(fpc_div_default_res_fx2),
  .fdd_result(fdd_result[63:31]),
  .fdd_pte_cla_early_b63(fdd_pte_cla_early_b63),
  .fgu_mul_result_fx5(fgu_mul_result_fx5[63:9]),
  .fpy_sticky_dp_fx5(fpy_sticky_dp_fx5),
  .fpy_sticky_sp_fx5(fpy_sticky_sp_fx5),
  .fpy_xicc_z_fx5(fpy_xicc_z_fx5[1:0]),
  .dec_frf_r1_odd32b_d(dec_frf_r1_odd32b_d),
  .dec_frf_r2_odd32b_d(dec_frf_r2_odd32b_d),
  .dec_flush_f1(dec_flush_f1),
  .dec_flush_f2(dec_flush_f2),
  .dec_fgu_fmov_vld_m(dec_fgu_fmov_vld_m),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_frf_store_d(dec_frf_store_d),
  .fec_cecc_fx2(fec_cecc_fx2),
  .fec_uecc_fx2(fec_uecc_fx2),
  .fpc_frf_store_vld_fx1(fpc_frf_store_vld_fx1),
  .fpc_gsr0_mask_sel_fx3(fpc_gsr0_mask_sel_fx3[1:0]),
  .fpc_gsr1_mask_sel_fx3(fpc_gsr1_mask_sel_fx3[1:0]),
  .fpc_gsr2_mask_sel_fx3(fpc_gsr2_mask_sel_fx3[1:0]),
  .fpc_gsr3_mask_sel_fx3(fpc_gsr3_mask_sel_fx3[1:0]),
  .fpc_gsr4_mask_sel_fx3(fpc_gsr4_mask_sel_fx3[1:0]),
  .fpc_gsr5_mask_sel_fx3(fpc_gsr5_mask_sel_fx3[1:0]),
  .fpc_gsr6_mask_sel_fx3(fpc_gsr6_mask_sel_fx3[1:0]),
  .fpc_gsr7_mask_sel_fx3(fpc_gsr7_mask_sel_fx3[1:0]),
  .fpc_gsr_scale_fx4(fpc_gsr_scale_fx4[4:0]),
  .fpc_gsr_align_fx4(fpc_gsr_align_fx4[2:0]),
  .fpc_gsr_asr_11bits_fx4(fpc_gsr_asr_11bits_fx4[10:0]),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .mbi_run(mbi_run),
  .in_rngl_cdbus(in_rngl_cdbus[27:0])
 );

fgu_fic_ctl   fic (
 .scan_in(fic_scanin),
 .scan_out(fic_scanout),
 .l2clk(l2clk),
  .fpf_rs2_cmp_din_fx1(fpf_rs2_cmp_din_fx1[63:0]),
  .fpf_ma_sum_fx4(fpf_ma_sum_fx4[63:0]),
  .fpf_man_se_byte_fx3_b38_32(fpf_man_se_byte_fx3_b38_32[38:32]),
  .fpf_man_se_byte_fx3_b6_0(fpf_man_se_byte_fx3_b6_0[6:0]),
  .fic_norm_eadj_fx5(fic_norm_eadj_fx5[5:0]),
  .fic_i2f_align_sel_fx2(fic_i2f_align_sel_fx2[5:0]),
  .fpe_align_sel_fx2(fpe_align_sel_fx2[5:0]),
  .fic_i2f_eadj_fx2(fic_i2f_eadj_fx2[5:0]),
  .fpc_lzd_override_fx4(fpc_lzd_override_fx4),
  .fpc_sp_source_fx3(fpc_sp_source_fx3),
  .fic_mulscc_iccz_fx4(fic_mulscc_iccz_fx4),
  .fic_mulscc_xccz_fx4(fic_mulscc_xccz_fx4),
  .fic_convert_sticky_fx4(fic_convert_sticky_fx4),
  .fic_fxtod_sticky_fx4(fic_fxtod_sticky_fx4),
  .fic_ftoi_nx_fx4(fic_ftoi_nx_fx4),
  .fic_ftox_nx_fx4(fic_ftox_nx_fx4),
  .fic_bzf31msb_fx2(fic_bzf31msb_fx2),
  .fic_bzf32lsb_fx2(fic_bzf32lsb_fx2),
  .fic_bof22msb_fx2(fic_bof22msb_fx2),
  .main_clken(main_clken),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
 );

fgu_fgd_dp    fgd (							// FS:wmr_protect
 .wmr_scan_in(fgd_wmr_scanin),
 .wmr_scan_out(fgd_wmr_scanout),
 .scan_in(fgd_scanin),
 .scan_out(fgd_scanout),
 .l2clk(l2clk),
  .fad_rs1_fmt_fx1(fad_rs1_fmt_fx1[63:0]),
  .fad_rs2_fmt_fx1(fad_rs2_fmt_fx1[63:0]),
  .fgd_rngl_cdbus_3f(fgd_rngl_cdbus_3f[62:0]),
  .fgd_result_fx5(fgd_result_fx5[63:0]),
  .vis_clken(vis_clken),
  .coreon_clken(coreon_clken),
  .fac_fgx_abs_fx2(fac_fgx_abs_fx2),
  .fac_fgx_neg_fx2(fac_fgx_neg_fx2),
  .fac_fgx_logical_fx2(fac_fgx_logical_fx2),
  .fac_fgx_expand_fx2(fac_fgx_expand_fx2),
  .fac_fgx_merge_fx2(fac_fgx_merge_fx2),
  .fac_fgx_align_fx2(fac_fgx_align_fx2),
  .fac_fgx_shuffle_fx2(fac_fgx_shuffle_fx2),
  .fac_fgx_pack16_fx2(fac_fgx_pack16_fx2),
  .fac_fgx_pack32_fx2(fac_fgx_pack32_fx2),
  .fac_fgx_packfix_fx2(fac_fgx_packfix_fx2),
  .fac_fgx_pdist_fx1(fac_fgx_pdist_fx1),
  .fac_fgx_popc_fx2(fac_fgx_popc_fx2),
  .fac_fgx_pack_sel_fx2(fac_fgx_pack_sel_fx2),
  .fac_opf_fx2(fac_opf_fx2[4:1]),
  .fac_gsr_asr_tid_fx2(fac_gsr_asr_tid_fx2[2:0]),
  .fac_tid_fx2(fac_tid_fx2[2:0]),
  .fac_rng_fprs(fac_rng_fprs[2:0]),
  .fac_rng_rd_fprs_4f(fac_rng_rd_fprs_4f),
  .fac_rng_rd_gsr_4f(fac_rng_rd_gsr_4f),
  .fec_r1_ecc_fx1(fec_r1_ecc_fx1[13:0]),
  .fac_rng_rd_ecc_4f(fac_rng_rd_ecc_4f),
  .fac_rng_rd_or_wr_3f(fac_rng_rd_or_wr_3f),
  .asi_clken(asi_clken),
  .fgd_gsr_asr_mask_fx4_b31(fgd_gsr_asr_mask_fx4_b31),
  .fpc_gsr0_mask_sel_fx3(fpc_gsr0_mask_sel_fx3[1:0]),
  .fpc_gsr1_mask_sel_fx3(fpc_gsr1_mask_sel_fx3[1:0]),
  .fpc_gsr2_mask_sel_fx3(fpc_gsr2_mask_sel_fx3[1:0]),
  .fpc_gsr3_mask_sel_fx3(fpc_gsr3_mask_sel_fx3[1:0]),
  .fpc_gsr4_mask_sel_fx3(fpc_gsr4_mask_sel_fx3[1:0]),
  .fpc_gsr5_mask_sel_fx3(fpc_gsr5_mask_sel_fx3[1:0]),
  .fpc_gsr6_mask_sel_fx3(fpc_gsr6_mask_sel_fx3[1:0]),
  .fpc_gsr7_mask_sel_fx3(fpc_gsr7_mask_sel_fx3[1:0]),
  .fpc_gsr_scale_fx4(fpc_gsr_scale_fx4[4:0]),
  .fpc_gsr_align_fx4(fpc_gsr_align_fx4[2:0]),
  .fpc_gsr_asr_11bits_fx4(fpc_gsr_asr_11bits_fx4[10:0]),
  .exu_fgu_gsr_m(exu_fgu_gsr_m[31:0]),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en),
  .in_rngl_cdbus(in_rngl_cdbus[63:0])
 );

fgu_fdd_dp    fdd (
 .scan_in(fdd_scanin),
 .scan_out(fdd_scanout),
 .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .div_clken_rep0(div_clken_rep0),
  .fad_rs1_fmt_fx1_rep01(fad_rs1_fmt_fx1_rep01[63:0]),
  .fad_rs2_fmt_fx1_rep01(fad_rs2_fmt_fx1_rep01[63:0]),
  .fac_div_valid_fx1_rep0(fac_div_valid_fx1_rep0),
  .fac_divq_valid_fx1_rep0(fac_divq_valid_fx1_rep0),
  .fdc_asign_lth(fdc_asign_lth),
  .fdc_bsign_lth(fdc_bsign_lth),
  .fdc_bsign_lth_(fdc_bsign_lth_),
  .fdc_pe_cycle3(fdc_pe_cycle3),
  .fdc_pe_cmux_sel(fdc_pe_cmux_sel),
  .fdc_pe_smux_sel(fdc_pe_smux_sel[2:0]),
  .fdc_pe_xsht_ctl(fdc_pe_xsht_ctl[5:0]),
  .fdc_ie_fsqrt_valid_even(fdc_ie_fsqrt_valid_even),
  .fdc_ie_fsqrt_valid_even_(fdc_ie_fsqrt_valid_even_),
  .fdc_ie_fsqrt_valid_odd(fdc_ie_fsqrt_valid_odd),
  .fdc_ie_fsqrt_valid_odd_(fdc_ie_fsqrt_valid_odd_),
  .fdc_ie_rmux_sel(fdc_ie_rmux_sel[4:0]),
  .fdc_ie_dmux_sel(fdc_ie_dmux_sel[2:0]),
  .fdc_flt_increment(fdc_flt_increment),
  .fdc_pte_clasel(fdc_pte_clasel[1:0]),
  .fdc_pte_csa_cin(fdc_pte_csa_cin),
  .fdc_pte_cycle2(fdc_pte_cycle2),
  .fdc_emin_lth(fdc_emin_lth),
  .fdc_pte_qsel(fdc_pte_qsel[2:0]),
  .fdc_pte_stall_(fdc_pte_stall_),
  .fdc_flt_round(fdc_flt_round[1:0]),
  .fdc_idiv_ctl(fdc_idiv_ctl[4:0]),
  .fdc_fdx_cin_in(fdc_fdx_cin_in),
  .fdc_qsel00(fdc_qsel00[2:0]),
  .fdc_qsel1(fdc_qsel1[2:0]),
  .fdc_q_in(fdc_q_in[1:0]),
  .fdc_qm1_in(fdc_qm1_in[1:0]),
  .fdd_result(fdd_result[63:0]),
  .fdd_pte_cla_early_b63(fdd_pte_cla_early_b63),
  .fdd_pe_clth(fdd_pe_clth[63:0]),
  .fdd_cla_zero32_(fdd_cla_zero32_),
  .fdd_cla_zero64_(fdd_cla_zero64_),
  .fdd_fdx_din0(fdd_fdx_din0),
  .fdd_fdx_din1(fdd_fdx_din1),
  .fdd_fdx_cin64(fdd_fdx_cin64),
  .fdd_fdq00_10_sum(fdd_fdq00_10_sum[4:0]),
  .fdd_fdq00_10_carry(fdd_fdq00_10_carry[4:0]),
  .fdd_fdq1p_sum(fdd_fdq1p_sum[3:0]),
  .fdd_fdq1p_carry(fdd_fdq1p_carry[3:0]),
  .fdd_fdq1n_sum(fdd_fdq1n_sum[3:0]),
  .fdd_fdq1n_carry(fdd_fdq1n_carry[3:0])
 );

fgu_fdc_ctl   fdc (
 .scan_in(fdc_scanin),
 .scan_out(fdc_scanout),
 .l2clk(l2clk),
 .fpf_hi_bof_fx1         (fpf_hi_bof_fx1_rep0),          // fgu global buff rename
 .fpf_lo_bof_fx1         (fpf_lo_bof_fx1_rep0),          // fgu global buff rename
 .fpe_rs2_fmt_fx1_b0     (fpe_rs2_fmt_fx1_b0_rep0),      // fgu global buff rename
 .div_clken              (div_clken_rep0),               // fgu global buff rename
 .fac_div_valid_fx1      (fac_div_valid_fx1_rep0),       // fgu global buff rename
 .fac_divq_valid_fx1     (fac_divq_valid_fx1_rep0),      // fgu global buff rename
 .fac_div_control_fx1    (fac_div_control_fx1_rep0[4:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .fac_div_flush_fx3(fac_div_flush_fx3),
  .fpf_sa_xor_sb_fx1(fpf_sa_xor_sb_fx1),
  .fpc_rd_mode_fx3(fpc_rd_mode_fx3[1:0]),
  .fpc_emin_fx3(fpc_emin_fx3),
  .fdd_pe_clth(fdd_pe_clth[63:0]),
  .fdd_cla_zero32_(fdd_cla_zero32_),
  .fdd_cla_zero64_(fdd_cla_zero64_),
  .fdd_result(fdd_result[63:9]),
  .fdd_fdx_din0(fdd_fdx_din0),
  .fdd_fdx_din1(fdd_fdx_din1),
  .fdd_fdx_cin64(fdd_fdx_cin64),
  .fdd_fdq00_10_sum(fdd_fdq00_10_sum[4:0]),
  .fdd_fdq00_10_carry(fdd_fdq00_10_carry[4:0]),
  .fdd_fdq1p_sum(fdd_fdq1p_sum[3:0]),
  .fdd_fdq1p_carry(fdd_fdq1p_carry[3:0]),
  .fdd_fdq1n_sum(fdd_fdq1n_sum[3:0]),
  .fdd_fdq1n_carry(fdd_fdq1n_carry[3:0]),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .fgu_idiv_stall(fgu_idiv_stall[1:0]),
  .fdc_dec_exp_early(fdc_dec_exp_early),
  .fdc_icc_v_early(fdc_icc_v_early),
  .fdc_xicc_z_early(fdc_xicc_z_early[1:0]),
  .fdc_finish_int_early(fdc_finish_int_early),
  .fdc_finish_fltd_early(fdc_finish_fltd_early),
  .fdc_finish_flts_early(fdc_finish_flts_early),
  .fdc_flt_inexact(fdc_flt_inexact),
  .fdc_asign_lth(fdc_asign_lth),
  .fdc_bsign_lth(fdc_bsign_lth),
  .fdc_bsign_lth_(fdc_bsign_lth_),
  .fdc_pe_cycle3(fdc_pe_cycle3),
  .fdc_pe_cmux_sel(fdc_pe_cmux_sel),
  .fdc_pe_smux_sel(fdc_pe_smux_sel[2:0]),
  .fdc_pe_xsht_ctl(fdc_pe_xsht_ctl[5:0]),
  .fdc_ie_fsqrt_valid_even(fdc_ie_fsqrt_valid_even),
  .fdc_ie_fsqrt_valid_even_(fdc_ie_fsqrt_valid_even_),
  .fdc_ie_fsqrt_valid_odd(fdc_ie_fsqrt_valid_odd),
  .fdc_ie_fsqrt_valid_odd_(fdc_ie_fsqrt_valid_odd_),
  .fdc_ie_rmux_sel(fdc_ie_rmux_sel[4:0]),
  .fdc_ie_dmux_sel(fdc_ie_dmux_sel[2:0]),
  .fdc_flt_increment(fdc_flt_increment),
  .fdc_pte_clasel(fdc_pte_clasel[1:0]),
  .fdc_pte_csa_cin(fdc_pte_csa_cin),
  .fdc_pte_cycle2(fdc_pte_cycle2),
  .fdc_emin_lth(fdc_emin_lth),
  .fdc_pte_qsel(fdc_pte_qsel[2:0]),
  .fdc_pte_stall_(fdc_pte_stall_),
  .fdc_flt_round(fdc_flt_round[1:0]),
  .fdc_idiv_ctl(fdc_idiv_ctl[4:0]),
  .fdc_fdx_cin_in(fdc_fdx_cin_in),
  .fdc_qsel00(fdc_qsel00[2:0]),
  .fdc_qsel1(fdc_qsel1[2:0]),
  .fdc_q_in(fdc_q_in[1:0]),
  .fdc_qm1_in(fdc_qm1_in[1:0]) // fgu global buff rename
 );

fgu_fad_dp    fad (							// FS:wmr_protect
 .wmr_scan_in(fad_wmr_scanin),
 .wmr_scan_out(fad_wmr_scanout),
 .scan_in(fad_scanin),
 .scan_out(fad_scanout),
 .l2clk(l2clk),
  .dec_frf_r2_addr_d(dec_frf_r2_addr_d[4:0]),
  .dec_frf_r1_32b_d(dec_frf_r1_32b_d),
  .dec_frf_r2_32b_d(dec_frf_r2_32b_d),
  .dec_frf_r1_odd32b_d(dec_frf_r1_odd32b_d),
  .dec_frf_r2_odd32b_d(dec_frf_r2_odd32b_d),
  .fgu_fld_fcc_fx3(fgu_fld_fcc_fx3[7:0]),
  .lsu_fgu_fld_data_b(lsu_fgu_fld_data_b[63:0]),
  .lsu_fgu_fld_addr_b(lsu_fgu_fld_addr_b[4:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .lsu_fgu_fld_b(lsu_fgu_fld_b),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .lsu_fgu_fld_32b_b(lsu_fgu_fld_32b_b),
  .lsu_fgu_fld_odd32b_b(lsu_fgu_fld_odd32b_b),
  .lsu_fgu_fsr_load_b(lsu_fgu_fsr_load_b),
  .fgu_lsu_fst_data_fx1(fgu_lsu_fst_data_fx1[63:0]),
  .exu_fgu_rs1_e(exu_fgu_rs1_e[63:0]),
  .exu_fgu_rs2_e(exu_fgu_rs2_e[63:0]),
  .fac_frf_r1_addr_e(fac_frf_r1_addr_e[4:0]),
  .fac_tid_e(fac_tid_e[2:0]),
  .fac_aman_fmt_sel_e(fac_aman_fmt_sel_e[4:0]),
  .fac_bman_fmt_sel_e(fac_bman_fmt_sel_e[4:0]),
  .fac_fst_fmt_sel_fx1(fac_fst_fmt_sel_fx1[3:0]),
  .fac_exu_src_e(fac_exu_src_e),
  .fac_w1_addr_fb(fac_w1_addr_fb[4:0]),
  .fac_fpd_addr_fb(fac_fpd_addr_fb[4:0]),
  .fac_w1_32b_fb(fac_w1_32b_fb),
  .fac_fpd_32b_fb(fac_fpd_32b_fb),
  .fac_w1_odd32b_fb(fac_w1_odd32b_fb),
  .fac_fpd_odd32b_fb(fac_fpd_odd32b_fb),
  .fac_w1_tid_fb(fac_w1_tid_fb[2:0]),
  .fac_fpd_tid_fb(fac_fpd_tid_fb[2:0]),
  .fac_fsr0_sel_fw(fac_fsr0_sel_fw[5:0]),
  .fac_fsr1_sel_fw(fac_fsr1_sel_fw[5:0]),
  .fac_fsr2_sel_fw(fac_fsr2_sel_fw[5:0]),
  .fac_fsr3_sel_fw(fac_fsr3_sel_fw[5:0]),
  .fac_fsr4_sel_fw(fac_fsr4_sel_fw[5:0]),
  .fac_fsr5_sel_fw(fac_fsr5_sel_fw[5:0]),
  .fac_fsr6_sel_fw(fac_fsr6_sel_fw[5:0]),
  .fac_fsr7_sel_fw(fac_fsr7_sel_fw[5:0]),
  .main_clken(main_clken),
  .asi_clken(asi_clken),
  .coreon_clken(coreon_clken),
  .fad_w2_addr_fw1_b4(fad_w2_addr_fw1_b4),
  .fad_w2_tid_fw1(fad_w2_tid_fw1[2:0]),
  .fad_w2_vld_fw1(fad_w2_vld_fw1[1:0]),
  .fpc_w1_vld_fb(fpc_w1_vld_fb[1:0]),
  .fpc_w1_ul_vld_fb(fpc_w1_ul_vld_fb),
  .fpc_fsr_w1_result_fw(fpc_fsr_w1_result_fw[11:0]),
  .fpc_fsr_w2_result_fw(fpc_fsr_w2_result_fw[11:0]),
  .fpc_fpd_exp_res(fpc_fpd_exp_res[10:0]),
  .fpc_fpd_sign_res(fpc_fpd_sign_res),
  .fpc_fpd_const_sel(fpc_fpd_const_sel[1:0]),
  .fpc_fcc_fw(fpc_fcc_fw[1:0]),
  .fpc_fpd_ieee_trap_fb(fpc_fpd_ieee_trap_fb),
  .fpc_fpd_unfin_fb(fpc_fpd_unfin_fb),
  .fad_gsr_imirnd_fx1(fad_gsr_imirnd_fx1[2:0]),
  .frf_r1_data_e(frf_r1_data_e[63:0]),
  .frf_r2_data_e(frf_r2_data_e[63:0]),
  .fad_w1_tid_fw(fad_w1_tid_fw[2:0]),
  .fad_w1_vld_fw(fad_w1_vld_fw[1:0]),
  .fad_w2_result_fw(fad_w2_result_fw[63:0]),
  .fad_w2_addr_fw(fad_w2_addr_fw[4:0]),
  .fad_w2_tid_fw(fad_w2_tid_fw[2:0]),
  .fad_w2_vld_fw(fad_w2_vld_fw[1:0]),
  .fad_nombi_w2_result_fw(fad_nombi_w2_result_fw[63:0]),
  .fad_r1_byp_hit_fx1(fad_r1_byp_hit_fx1),
  .fad_r2_byp_hit_fx1(fad_r2_byp_hit_fx1),
  .fad_i_parity_2e_fx1(fad_i_parity_2e_fx1),
  .fad_i_parity_2o_fx1(fad_i_parity_2o_fx1),
  .fad_i_parity_1e_fx1(fad_i_parity_1e_fx1),
  .fad_i_parity_1o_fx1(fad_i_parity_1o_fx1),
  .fpf_w1_result_fb(fpf_w1_result_fb[63:0]),
  .fad_rs1_fmt_fx1(fad_rs1_fmt_fx1[63:0]),
  .fad_rs2_fmt_fx1(fad_rs2_fmt_fx1[63:0]),
  .fad_rs1_fx1(fad_rs1_fx1[63:0]),
  .fad_rs2_fx1(fad_rs2_fx1[63:0]),
  .fad_r1_odd32b_fx1(fad_r1_odd32b_fx1),
  .fad_fsr_rd_fx1(fad_fsr_rd_fx1[1:0]),
  .fad_fsr_tem_fx1(fad_fsr_tem_fx1[4:0]),
  .fad_fsr_ns_fx1(fad_fsr_ns_fx1),
  .fdd_result_rep0(fdd_result_rep0[62:11]),
  .fdc_finish_fltd_early_rep0(fdc_finish_fltd_early_rep0),
  .fdc_finish_flts_early_rep0(fdc_finish_flts_early_rep0),
  .fgd_rngl_cdbus_3f(fgd_rngl_cdbus_3f[62:0]),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .mbi_run(mbi_run),
  .mbi_frf_write_en(mbi_frf_write_en),
  .fac_mbist_addr_1f(fac_mbist_addr_1f[7:0]),
  .fec_mbist_wdata_1f(fec_mbist_wdata_1f[7:0]),
  .fec_mbist_wdata_3f(fec_mbist_wdata_3f[7:0]),
  .fad_mbist_cmp64_fx1(fad_mbist_cmp64_fx1),
  .fgu_rngl_cdbus(fgu_rngl_cdbus[62:0])
 );

fgu_fac_ctl   fac (							// FS:wmr_protect
 .wmr_scan_in(fac_wmr_scanin),
 .wmr_scan_out(fac_wmr_scanout),
 .scan_in(fac_scanin),
 .scan_out(fac_scanout),
 .l2clk(l2clk),
 .fdc_finish_int_early   (fdc_finish_int_early_rep0),    // fgu global buff rename
 .fdc_finish_fltd_early  (fdc_finish_fltd_early_rep0),   // fgu global buff rename
 .fdc_finish_flts_early  (fdc_finish_flts_early_rep0),   // fgu global buff rename
 .fgu_rngl_cdbus_b64     (fgu_rngl_cdbus[64]),
 .fgu_rngl_cdbus_b63     (fgu_rngl_cdbus[63]),
  .dec_frf_r1_addr_d(dec_frf_r1_addr_d[4:0]),
  .dec_frf_r1_vld_d(dec_frf_r1_vld_d),
  .dec_frf_r2_vld_d(dec_frf_r2_vld_d),
  .dec_frf_r1_32b_d(dec_frf_r1_32b_d),
  .dec_frf_r2_32b_d(dec_frf_r2_32b_d),
  .dec_frf_r1_odd32b_d(dec_frf_r1_odd32b_d),
  .dec_frf_r2_odd32b_d(dec_frf_r2_odd32b_d),
  .dec_frf_w_vld_d(dec_frf_w_vld_d),
  .dec_frf_w_addr_d(dec_frf_w_addr_d[4:0]),
  .dec_frf_w_32b_d(dec_frf_w_32b_d),
  .dec_frf_w_odd32b_d(dec_frf_w_odd32b_d),
  .dec_fgu_valid_e(dec_fgu_valid_e),
  .dec_exu_src_vld_d(dec_exu_src_vld_d),
  .dec_irf_w_addr_d(dec_irf_w_addr_d[4:0]),
  .dec_spu_grant_d(dec_spu_grant_d),
  .dec_frf_store_d(dec_frf_store_d),
  .dec_fsr_store_d(dec_fsr_store_d),
  .dec_flush_f1(dec_flush_f1),
  .dec_flush_f2(dec_flush_f2),
  .dec_fgu_op3_d(dec_fgu_op3_d[5:0]),
  .dec_fgu_opf_d(dec_fgu_opf_d[7:0]),
  .dec_fgu_decode_d(dec_fgu_decode_d),
  .dec_fgu_tid_d(dec_fgu_tid_d[2:0]),
  .fgu_cmp_fcc_tid_fx2(fgu_cmp_fcc_tid_fx2[2:0]),
  .fgu_fld_fcc_vld_fx3(fgu_fld_fcc_vld_fx3[1:0]),
  .fgu_fprs_fef(fgu_fprs_fef[7:0]),
  .fgu_divide_completion(fgu_divide_completion[7:0]),
  .tlu_flush_fgu_b(tlu_flush_fgu_b),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_cerer_frf(tlu_cerer_frf),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .fpc_pre_div_flush_fx2(fpc_pre_div_flush_fx2),
  .fpc_div_default_res_fx2(fpc_div_default_res_fx2),
  .fpc_fsr_w1_vld_fx5(fpc_fsr_w1_vld_fx5[1:0]),
  .fpc_fcc_vld_fx5(fpc_fcc_vld_fx5[3:0]),
  .fpc_fpx_unfin_fb(fpc_fpx_unfin_fb),
  .fpc_fpd_unfin_fb(fpc_fpd_unfin_fb),
  .fpc_stfsr_en_fx3to5(fpc_stfsr_en_fx3to5),
  .fac_tlu_flush_fx3(fac_tlu_flush_fx3),
  .fac_dec_valid_fx1(fac_dec_valid_fx1),
  .fac_fpx_itype_fx1(fac_fpx_itype_fx1[2:0]),
  .fac_fpx_dtype_fx1(fac_fpx_dtype_fx1[2:0]),
  .fac_fpx_stype_fx1(fac_fpx_stype_fx1[1:0]),
  .fac_fpx_sign_instr_fx1(fac_fpx_sign_instr_fx1),
  .fac_fpx_rnd_trunc_fx1(fac_fpx_rnd_trunc_fx1),
  .fac_fpx_mulscc_fx1(fac_fpx_mulscc_fx1),
  .fac_fpx_saverestore_fx1(fac_fpx_saverestore_fx1),
  .fac_fpx_nv_vld_fx1(fac_fpx_nv_vld_fx1),
  .fac_fpx_of_vld_fx1(fac_fpx_of_vld_fx1),
  .fac_fpx_uf_vld_fx1(fac_fpx_uf_vld_fx1),
  .fac_fpx_dz_vld_fx1(fac_fpx_dz_vld_fx1),
  .fac_fpx_nx_vld_fx1(fac_fpx_nx_vld_fx1),
  .fac_fpx_unfin_vld_fx1(fac_fpx_unfin_vld_fx1),
  .fac_fpx_sp_dest_fx1(fac_fpx_sp_dest_fx1),
  .fac_fpx_sp_src_fx1(fac_fpx_sp_src_fx1),
  .fac_fgx_instr_fx4(fac_fgx_instr_fx4),
  .fac_w1_vld_fx1(fac_w1_vld_fx1[1:0]),
  .fac_w1_odd32b_fx1(fac_w1_odd32b_fx1),
  .fac_gsr_w_vld_fx2(fac_gsr_w_vld_fx2[1:0]),
  .fac_dec_valid_noflush_fx5(fac_dec_valid_noflush_fx5),
  .fgd_gsr_asr_mask_fx4_b31(fgd_gsr_asr_mask_fx4_b31),
  .fac_fgx_mvcond_fx2(fac_fgx_mvcond_fx2),
  .fac_fgx_mvucond_fx2(fac_fgx_mvucond_fx2),
  .fac_fgx_abs_fx2(fac_fgx_abs_fx2),
  .fac_fgx_neg_fx2(fac_fgx_neg_fx2),
  .fac_fgx_logical_fx2(fac_fgx_logical_fx2),
  .fac_fgx_expand_fx2(fac_fgx_expand_fx2),
  .fac_fgx_merge_fx2(fac_fgx_merge_fx2),
  .fac_fgx_align_fx2(fac_fgx_align_fx2),
  .fac_fgx_shuffle_fx2(fac_fgx_shuffle_fx2),
  .fac_fgx_pack16_fx2(fac_fgx_pack16_fx2),
  .fac_fgx_pack32_fx2(fac_fgx_pack32_fx2),
  .fac_fgx_packfix_fx2(fac_fgx_packfix_fx2),
  .fac_fgx_pdist_fx1(fac_fgx_pdist_fx1),
  .fac_fgx_popc_fx2(fac_fgx_popc_fx2),
  .fac_fgx_siam_fx2(fac_fgx_siam_fx2),
  .fac_fgx_pack_sel_fx2(fac_fgx_pack_sel_fx2),
  .fac_opf_fx2(fac_opf_fx2[4:1]),
  .fac_gsr_asr_tid_fx2(fac_gsr_asr_tid_fx2[2:0]),
  .fac_tid_fx2(fac_tid_fx2[2:0]),
  .fac_rng_fprs(fac_rng_fprs[2:0]),
  .fac_rng_rd_fprs_4f(fac_rng_rd_fprs_4f),
  .fac_rng_wr_gsr_3f(fac_rng_wr_gsr_3f),
  .fac_rng_rd_gsr_4f(fac_rng_rd_gsr_4f),
  .fac_rng_rd_ecc_4f(fac_rng_rd_ecc_4f),
  .fac_rng_rd_or_wr_3f(fac_rng_rd_or_wr_3f),
  .fad_w1_tid_fw(fad_w1_tid_fw[2:0]),
  .fad_w1_vld_fw(fad_w1_vld_fw[1:0]),
  .fad_w2_addr_fw1_b4(fad_w2_addr_fw1_b4),
  .fad_w2_tid_fw1(fad_w2_tid_fw1[2:0]),
  .fad_w2_vld_fw1(fad_w2_vld_fw1[1:0]),
  .fac_frf_r1_addr_e(fac_frf_r1_addr_e[4:0]),
  .fac_tid_e(fac_tid_e[2:0]),
  .fac_aman_fmt_sel_e(fac_aman_fmt_sel_e[4:0]),
  .fac_bman_fmt_sel_e(fac_bman_fmt_sel_e[4:0]),
  .fac_fst_fmt_sel_fx1(fac_fst_fmt_sel_fx1[3:0]),
  .fac_w1_addr_fb(fac_w1_addr_fb[4:0]),
  .fac_fpd_addr_fb(fac_fpd_addr_fb[4:0]),
  .fac_w1_32b_fb(fac_w1_32b_fb),
  .fac_fpd_32b_fb(fac_fpd_32b_fb),
  .fac_w1_odd32b_fb(fac_w1_odd32b_fb),
  .fac_fpd_odd32b_fb(fac_fpd_odd32b_fb),
  .fac_w1_tid_fb(fac_w1_tid_fb[2:0]),
  .fac_fpd_tid_fb(fac_fpd_tid_fb[2:0]),
  .fac_fsr_store_fx2(fac_fsr_store_fx2),
  .fac_exu_src_e(fac_exu_src_e),
  .fac_fsr0_sel_fw(fac_fsr0_sel_fw[5:0]),
  .fac_fsr1_sel_fw(fac_fsr1_sel_fw[5:0]),
  .fac_fsr2_sel_fw(fac_fsr2_sel_fw[5:0]),
  .fac_fsr3_sel_fw(fac_fsr3_sel_fw[5:0]),
  .fac_fsr4_sel_fw(fac_fsr4_sel_fw[5:0]),
  .fac_fsr5_sel_fw(fac_fsr5_sel_fw[5:0]),
  .fac_fsr6_sel_fw(fac_fsr6_sel_fw[5:0]),
  .fac_fsr7_sel_fw(fac_fsr7_sel_fw[5:0]),
  .fac_pre_fcc_vld_fx2(fac_pre_fcc_vld_fx2[3:0]),
  .fac_fcmpe_fx1(fac_fcmpe_fx1),
  .fac_rs2_rotate_sel_e(fac_rs2_rotate_sel_e[4:0]),
  .fac_i2f_sel_e(fac_i2f_sel_e[1:0]),
  .fac_force_swap_blta_fx1(fac_force_swap_blta_fx1),
  .fac_force_noswap_blta_fx1(fac_force_noswap_blta_fx1),
  .fac_xr_mode_fx1(fac_xr_mode_fx1),
  .fac_rs1_sel_fx1(fac_rs1_sel_fx1[4:0]),
  .fac_rs2_sel_fx1(fac_rs2_sel_fx1[3:0]),
  .fac_8x16_rnd_fx3(fac_8x16_rnd_fx3[1:0]),
  .fac_scff_sel_fx3(fac_scff_sel_fx3[3:0]),
  .fac_accum_sel_fx3(fac_accum_sel_fx3[6:0]),
  .fac_result_sel_fx4(fac_result_sel_fx4[5:0]),
  .fac_ma_result_en_fx4(fac_ma_result_en_fx4),
  .fac_div_flush_fx3(fac_div_flush_fx3),
  .fac_div_valid_fx1(fac_div_valid_fx1),
  .fac_divq_valid_fx1(fac_divq_valid_fx1),
  .fac_div_control_fx1(fac_div_control_fx1[4:0]),
  .fac_aexp_fmt_sel_e(fac_aexp_fmt_sel_e[9:0]),
  .fac_bexp_fmt_sel_e(fac_bexp_fmt_sel_e[7:0]),
  .fac_aux_cin_fx1(fac_aux_cin_fx1),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .lsu_fgu_fld_b(lsu_fgu_fld_b),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .lsu_fgu_fld_32b_b(lsu_fgu_fld_32b_b),
  .lsu_fgu_fsr_load_b(lsu_fgu_fsr_load_b),
  .lsu_fgu_pmen(lsu_fgu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .exu_fgu_gsr_vld_m(exu_fgu_gsr_vld_m[1:0]),
  .exu_fgu_flush_m(exu_fgu_flush_m),
  .fgu_result_tid_fx5(fgu_result_tid_fx5[1:0]),
  .fgu_irf_w_addr_fx5(fgu_irf_w_addr_fx5[4:0]),
  .fgu_exu_cc_vld_fx5(fgu_exu_cc_vld_fx5),
  .fgu_exu_w_vld_fx5(fgu_exu_w_vld_fx5[1:0]),
  .fec_cecc_fx2(fec_cecc_fx2),
  .fec_uecc_fx2(fec_uecc_fx2),
  .fac_r1_vld_fx1(fac_r1_vld_fx1[1:0]),
  .fac_r2_vld_fx1(fac_r2_vld_fx1[1:0]),
  .fac_ecc_trap_en_fx1(fac_ecc_trap_en_fx1),
  .fac_tid_d(fac_tid_d[2:0]),
  .fac_frf_r1_addr_d(fac_frf_r1_addr_d[4:0]),
  .fac_frf_r1_vld_d(fac_frf_r1_vld_d),
  .spu_fgu_fpy_ctl_d(spu_fgu_fpy_ctl_d[6:0]),
  .main_clken(main_clken),
  .main_clken0(main_clken0),
  .mul_clken(mul_clken),
  .div_clken(div_clken),
  .vis_clken(vis_clken),
  .asi_clken(asi_clken),
  .coreon_clken(coreon_clken),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .mbi_frf_read_en(mbi_frf_read_en),
  .mbi_addr(mbi_addr[7:0]),
  .mbi_run(mbi_run),
  .in_rngl_cdbus(in_rngl_cdbus[64:0]),
  .fac_mbist_addr_1f(fac_mbist_addr_1f[7:0])
 );

fgu_fec_ctl   fec (
 .scan_in(fec_scanin),
 .scan_out(fec_scanout),
 .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .mbi_frf_read_en(mbi_frf_read_en),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_run(mbi_run),
  .fad_mbist_cmp64_fx1(fad_mbist_cmp64_fx1),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .fad_nombi_w2_result_fw(fad_nombi_w2_result_fw[63:0]),
  .fec_w1_ecc_inject_fb(fec_w1_ecc_inject_fb[6:0]),
  .fec_w2_synd_fw(fec_w2_synd_fw[13:0]),
  .fec_r1_ecc_fx1(fec_r1_ecc_fx1[13:0]),
  .fec_mbist_wdata_1f(fec_mbist_wdata_1f[7:0]),
  .fec_mbist_wdata_3f(fec_mbist_wdata_3f[7:0]),
  .main_clken(main_clken),
  .coreon_clken(coreon_clken),
  .fac_frf_r1_addr_e(fac_frf_r1_addr_e[4:0]),
  .fac_dec_valid_fx1(fac_dec_valid_fx1),
  .fac_fgx_pdist_fx1(fac_fgx_pdist_fx1),
  .fac_ecc_trap_en_fx1(fac_ecc_trap_en_fx1),
  .fac_r1_vld_fx1(fac_r1_vld_fx1[1:0]),
  .fac_r2_vld_fx1(fac_r2_vld_fx1[1:0]),
  .fad_r1_byp_hit_fx1(fad_r1_byp_hit_fx1),
  .fad_r2_byp_hit_fx1(fad_r2_byp_hit_fx1),
  .fpc_frf_store_vld_fx1(fpc_frf_store_vld_fx1),
  .dec_frf_r2_addr_d(dec_frf_r2_addr_d[4:0]),
  .dec_frf_r1_32b_d(dec_frf_r1_32b_d),
  .dec_frf_r2_32b_d(dec_frf_r2_32b_d),
  .dec_frf_r1_odd32b_d(dec_frf_r1_odd32b_d),
  .dec_frf_r2_odd32b_d(dec_frf_r2_odd32b_d),
  .dec_flush_f1(dec_flush_f1),
  .dec_flush_f2(dec_flush_f2),
  .tlu_flush_fgu_b(tlu_flush_fgu_b),
  .fad_rs1_fx1(fad_rs1_fx1[63:0]),
  .fad_rs2_fx1(fad_rs2_fx1[63:0]),
  .fad_i_parity_2e_fx1(fad_i_parity_2e_fx1),
  .fad_i_parity_2o_fx1(fad_i_parity_2o_fx1),
  .fad_i_parity_1e_fx1(fad_i_parity_1e_fx1),
  .fad_i_parity_1o_fx1(fad_i_parity_1o_fx1),
  .frf_r1_ecc_e(frf_r1_ecc_e[13:0]),
  .frf_r2_ecc_e(frf_r2_ecc_e[13:0]),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .fgu_ecc_addr_fx2(fgu_ecc_addr_fx2[5:0]),
  .fgu_ecc_check_fx2(fgu_ecc_check_fx2[13:0]),
  .fgu_cecc_fx2(fgu_cecc_fx2),
  .fec_cecc_fx2(fec_cecc_fx2),
  .fgu_uecc_fx2(fgu_uecc_fx2),
  .fec_uecc_fx2(fec_uecc_fx2),
  .fgu_fst_ecc_error_fx2(fgu_fst_ecc_error_fx2),
  .fgu_mbi_frf_fail(fgu_mbi_frf_fail)
 );

// ------------------------------------
// floating point regfile
// ------------------------------------



// 0in custom -fire ( $0in_delay((fpc_w1_vld_fb[0] & fac_frf_r1_vld_d & (fac_w1_tid_fb[2:0] == fac_tid_d[2:0]) & (fac_w1_addr_fb[4:0] == fac_frf_r1_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r1_fld_hit_fb | fad.r1_w1_hit_fb | fad.r1_w2_hit_fw | fad.r1_w2_hit_fw1 | fad.r1_w1_hit_fw | (fad.r1_32b_e & ~fad.r1_odd32b_e))) -message "FRF w1[0] = r1 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fpc_w1_vld_fb[1] & fac_frf_r1_vld_d & (fac_w1_tid_fb[2:0] == fac_tid_d[2:0]) & (fac_w1_addr_fb[4:0] == fac_frf_r1_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r1_fld_hit_fb | fad.r1_w1_hit_fb | fad.r1_w2_hit_fw | fad.r1_w2_hit_fw1 | fad.r1_w1_hit_fw | (fad.r1_32b_e &  fad.r1_odd32b_e))) -message "FRF w1[1] = r1 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fad_w2_vld_fw[0] & fac_frf_r1_vld_d & (fad_w2_tid_fw[2:0] == fac_tid_d[2:0]) & (fad_w2_addr_fw[4:0] == fac_frf_r1_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r1_fld_hit_fb | fad.r1_w1_hit_fb | fad.r1_w2_hit_fw | fad.r1_w2_hit_fw1 | fad.r1_w1_hit_fw | (fad.r1_32b_e & ~fad.r1_odd32b_e))) -message "FRF w2[0] = r1 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fad_w2_vld_fw[1] & fac_frf_r1_vld_d & (fad_w2_tid_fw[2:0] == fac_tid_d[2:0]) & (fad_w2_addr_fw[4:0] == fac_frf_r1_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r1_fld_hit_fb | fad.r1_w1_hit_fb | fad.r1_w2_hit_fw | fad.r1_w2_hit_fw1 | fad.r1_w1_hit_fw | (fad.r1_32b_e &  fad.r1_odd32b_e))) -message "FRF w2[1] = r1 without bypass" -group core_array


// 0in custom -fire ( $0in_delay((fpc_w1_vld_fb[0] & dec_frf_r2_vld_d & (fac_w1_tid_fb[2:0] == fac_tid_d[2:0]) & (fac_w1_addr_fb[4:0] == dec_frf_r2_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r2_fld_hit_fb | fad.r2_w1_hit_fb | fad.r2_w2_hit_fw | fad.r2_w2_hit_fw1 | fad.r2_w1_hit_fw | (fad.r2_32b_e & ~fad.r2_odd32b_e))) -message "FRF w1[0] = r2 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fpc_w1_vld_fb[1] & dec_frf_r2_vld_d & (fac_w1_tid_fb[2:0] == fac_tid_d[2:0]) & (fac_w1_addr_fb[4:0] == dec_frf_r2_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r2_fld_hit_fb | fad.r2_w1_hit_fb | fad.r2_w2_hit_fw | fad.r2_w2_hit_fw1 | fad.r2_w1_hit_fw | (fad.r2_32b_e &  fad.r2_odd32b_e))) -message "FRF w1[1] = r2 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fad_w2_vld_fw[0] & dec_frf_r2_vld_d & (fad_w2_tid_fw[2:0] == fac_tid_d[2:0]) & (fad_w2_addr_fw[4:0] == dec_frf_r2_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r2_fld_hit_fb | fad.r2_w1_hit_fb | fad.r2_w2_hit_fw | fad.r2_w2_hit_fw1 | fad.r2_w1_hit_fw | (fad.r2_32b_e & ~fad.r2_odd32b_e))) -message "FRF w2[0] = r2 without bypass" -group core_array

// 0in custom -fire ( $0in_delay((fad_w2_vld_fw[1] & dec_frf_r2_vld_d & (fad_w2_tid_fw[2:0] == fac_tid_d[2:0]) & (fad_w2_addr_fw[4:0] == dec_frf_r2_addr_d[4:0])),1) & ~(fad.fac_exu_src_e | fad.r2_fld_hit_fb | fad.r2_w1_hit_fb | fad.r2_w2_hit_fw | fad.r2_w2_hit_fw1 | fad.r2_w1_hit_fw | (fad.r2_32b_e &  fad.r2_odd32b_e))) -message "FRF w2[1] = r2 without bypass" -group core_array


n2_frf_mp_256x78_cust  frf (

 .scan_in(frf_scanin),
 .scan_out(frf_scanout),
 .l2clk		( l2clk				),
 .pce		( 1'b1				),

 .tcu_aclk	( spc_aclk			),
 .tcu_bclk	( spc_bclk			),

 .w1_addr	( fac_w1_addr_fb[4:0]		),
 .w1_tid	( fac_w1_tid_fb [2:0]		),
 .w1_valid	( fpc_w1_vld_fb [1:0]		),
 .w2_addr	( fad_w2_addr_fw[4:0]		),
 .w2_tid	( fad_w2_tid_fw[2:0]		),
 .w2_valid	( fad_w2_vld_fw[1:0]		),

 .w1_data	( fpf_w1_result_fb[63:0]	),
 .w1_ecc	( fpf_w1_synd_fb[13:0]		),
 .w2_data	( fad_w2_result_fw[63:0]	),
 .w2_ecc	( fec_w2_synd_fw[13:0]		),

 .r_tid		( fac_tid_d[2:0]		),
 .r1_valid	( fac_frf_r1_vld_d		),
 .r1_addr	( fac_frf_r1_addr_d[4:0]	),
 .r2_valid	( dec_frf_r2_vld_d		),
 .r2_addr	( dec_frf_r2_addr_d[4:0]	),

	       	 
   .frf_r1_data		( frf_r1_data_e[63:0]		),
   .frf_r1_ecc		( frf_r1_ecc_e[13:0]		),
   .frf_r2_data		( frf_r2_data_e[63:0]		),
   .frf_r2_ecc		( frf_r2_ecc_e[13:0]		),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .main_clken(main_clken)

 );


// fixscan start:
assign fpf_scanin                = scan_in                  ;
assign fpy_scanin                = fpf_scanout              ;
assign fpe_scanin                = fpy_scanout              ;
assign fpc_scanin                = fpe_scanout              ;
assign fic_scanin                = fpc_scanout              ;
assign fgd_scanin                = fic_scanout              ;
assign fdd_scanin                = fgd_scanout              ;
assign fdc_scanin                = fdd_scanout              ;
assign fad_scanin                = fdc_scanout              ;
assign fac_scanin                = fad_scanout              ;
assign fec_scanin                = fac_scanout              ;
assign frf_scanin                = fec_scanout              ;
assign scan_out                  = frf_scanout              ;

assign fpc_wmr_scanin            = wmr_scan_in              ;
assign fgd_wmr_scanin            = fpc_wmr_scanout          ;
assign fad_wmr_scanin            = fgd_wmr_scanout          ;
assign fac_wmr_scanin            = fad_wmr_scanout          ;
assign wmr_scan_out              = fac_wmr_scanout          ;
// fixscan end:
endmodule // fgu
