// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu_ect_ctl.v
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
module exu_ect_ctl (
  l2clk, 
  scan_in, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_aclk_wmr, 
  tcu_scan_en, 
  dec_tid_p, 
  dec_inst_rs1_vld_p, 
  dec_inst_rs2_vld_p, 
  dec_inst_rs3_vld_p, 
  dec_inst_rs1_p, 
  dec_inst_rs2_p, 
  dec_inst_rs3_p, 
  dec_inst_rd_d, 
  dec_inst_d, 
  dec_decode_d, 
  dec_thread_group, 
  dec_valid_e, 
  tlu_itlb_bypass_e, 
  dec_flush_m, 
  dec_flush_b, 
  fgu_exu_icc_fx5, 
  fgu_exu_xcc_fx5, 
  fgu_exu_cc_vld_fx5, 
  fgu_result_tid_fx5, 
  fgu_irf_w_addr_fx5, 
  fgu_exu_w_vld_fx5, 
  lsu_exu_ld_b, 
  lsu_exu_rd_m, 
  lsu_exu_tid_m, 
  lsu_exu_ld_vld_w, 
  tlu_flush_exu_b, 
  tlu_ccr, 
  tlu_ccr_cwp_valid, 
  tlu_ccr_cwp_tid, 
  tlu_pstate_am, 
  lsu_exu_pmen, 
  spc_core_running_status, 
  mbi_run, 
  mbi_addr, 
  mbi_irf_write_en, 
  edp_rng_in_ff, 
  edp_rng_in_ff_b56, 
  edp_rng_in_ff_b57, 
  rml_rng_wt_ccr_ctl, 
  edp_br_flag_e, 
  exu_rs1_data_e, 
  exu_rs2_data_e, 
  edp_add_cout64_e, 
  edp_add_data_e_b63, 
  edp_add_data_e_b31, 
  edp_add_data_e_b1, 
  edp_add_data_e_b0, 
  edp_add_zdetect_e_, 
  edp_sub_cout64_e, 
  edp_sub_data_e_b63, 
  edp_sub_data_e_b31, 
  edp_sub_zdetect_e_, 
  edp_logical_data_e_b63, 
  edp_logical_data_e_b31, 
  edp_lg_zdetect_e, 
  edp_address_m, 
  edp_rd_ff_m, 
  exu_ecc_m, 
  rml_test_valid_d, 
  fgu_fld_fcc_fx3, 
  lsu_fgu_fld_tid_b, 
  fgu_fld_fcc_vld_fx3, 
  lsu_fgu_fld_vld_w, 
  fgu_cmp_fcc_fx3, 
  fgu_cmp_fcc_tid_fx2, 
  fgu_cmp_fcc_vld_fx3, 
  dec_pick_d, 
  exu_mdp_mux_sel_e, 
  exu_ms_icc_e, 
  exu_gsr_vld_m, 
  exu_cmov_true_m, 
  exu_lsu_va_error_m, 
  exu_misalign_m, 
  exu_oor_va_m, 
  exu_tcc_m, 
  exu_tof_m, 
  exu_ccr0, 
  exu_ccr1, 
  exu_ccr2, 
  exu_ccr3, 
  ect_mbist_sel, 
  ect_rs1_early_sel_d, 
  ect_rs2_early_sel_d, 
  ect_rs3_early_sel_d, 
  ect_rs2_imm_sel_d, 
  ect_rs1_late_sel_d, 
  ect_rs2_late_sel_d, 
  ect_rs3_late_sel_d, 
  ect_logic_sel_d, 
  ect_shift_sel_d, 
  ect_br_taken_z0_e, 
  ect_br_taken_z1_e, 
  ect_alignaddress_little_e, 
  ect_as_clip_e_, 
  ect_as_cin_e, 
  ect_array_sel_e, 
  ect_edge_lmask_e, 
  ect_edge_lrmask_e, 
  ect_pstate_am_e, 
  ect_rm_early_sel_e, 
  ect_rm_late_sel_e, 
  ect_store_mux_sel_e, 
  ect_tid_lth_e, 
  ect_rs1_addr_e, 
  ect_rs2_addr_e, 
  ect_rs3_addr_e, 
  ect_rs1_valid_e, 
  ect_rs2_valid_e, 
  ect_rs3_valid_e, 
  ect_two_cycle_m, 
  ect_rd_lth_w, 
  ect_rd_lth_w2, 
  ect_tid_lth_w, 
  ect_tid_lth_w2, 
  ect_valid_lth_w, 
  ect_valid_in_w2, 
  ect_yreg_wr_w, 
  ect_rng_ccr_data, 
  ect_misaligned_error_m, 
  ect_ex_emb_clken, 
  ect_tg_clken, 
  scan_out, 
  wmr_scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire l1clk_pm1;
wire ex_dw1_clken;
wire l1clk_pm2;
wire tg_active;
wire i_pwr0_lth_scanin;
wire i_pwr0_lth_scanout;
wire [2:0] lsu_exu_tid_b;
wire pmen_lth_;
wire tg_active_lth;
wire mbi_run_lth;
wire [2:2] tid_lth_w2;
wire i_pwr1_lth_scanin;
wire i_pwr1_lth_scanout;
wire pwr_m;
wire pwr_b;
wire pwr_w;
wire pwr_e;
wire pwr_w_p1;
wire i_mbist_lth_scanin;
wire i_mbist_lth_scanout;
wire mbi_irf_write_en_p1;
wire [6:0] mbi_addr_p1;
wire as_cin_d;
wire as_cin_set_d;
wire as_cin_ccr0_d;
wire ccr_byp_data_b0;
wire as_cin_ccr1_d;
wire wrxx_d;
wire wrxx_raw_d;
wire rs1_m_cmp;
wire rs1_b_cmp;
wire rs1_w_cmp;
wire rs1_w2_cmp;
wire rs1_w_plus1_cmp;
wire branch_d;
wire rs1_e_cmp;
wire rs1_l_cmp;
wire rs1_byp_early;
wire rs2_imm_sel7_d;
wire rs2_imm_sel6_d;
wire rs2_imm_sel5_d;
wire rs2_imm_sel4_d;
wire rs2_imm_sel3_d;
wire rs2_imm_sel2_d;
wire rs2_imm_sel1_d;
wire rs2_imm_sel0_d;
wire rs2_m_cmp;
wire rs2_b_cmp;
wire rs2_w_cmp;
wire rs2_w2_cmp;
wire rs2_w_plus1_cmp;
wire rs2_imm_data_d;
wire rs2_e_cmp;
wire rs2_l_cmp;
wire rs2_byp_early;
wire rs3_m_cmp;
wire rs3_b_cmp;
wire rs3_w_cmp;
wire rs3_w2_cmp;
wire rs3_w_plus1_cmp;
wire rs1_late_sel4_d;
wire rs3_e_cmp;
wire rs3_l_cmp;
wire rs3_byp_early;
wire [31:5] i;
wire as_subtract_d;
wire as_cc_d;
wire tas_cc_d;
wire tas_tv_d;
wire logic_sel3_d;
wire logic_sel2_d;
wire logic_sel1_d;
wire logic_sel0_d;
wire lg_cc_d;
wire shift_sel6_d;
wire shift_sel5_d;
wire shift_sel4_d;
wire shift_sel3_d;
wire shift_sel2_d;
wire shift_sel1_d;
wire shift_sel0_d;
wire edgele_d;
wire edge08_d;
wire edge16_d;
wire edge32_d;
wire array08_d;
wire array16_d;
wire call_d;
wire mov_cond_d;
wire bmask_d;
wire alignaddress_d;
wire alignaddress_little_d;
wire mux_mdp_sel0_d;
wire mux_mdp_sel1_d;
wire mux_mdp_sel2_d;
wire mux_mdp_sel3_d;
wire mux_mdp_sel4_d;
wire mux_mdp_sel5_d;
wire tcc_d;
wire address_d;
wire exu_op_d;
wire rm_late_sel0_d;
wire rm_late_sel1_d;
wire rm_late_sel2_d;
wire rm_early_sel0_d;
wire rm_early_sel1_d;
wire rm_early_sel2_d;
wire rm_early_sel4_d;
wire misalign_d;
wire ls_special_sel_d;
wire cmov_d;
wire regop_d;
wire specbr_d;
wire callclass_d;
wire movcc_d;
wire movr_d;
wire br_or_tcc_d;
wire bcc_d;
wire bpcc_d;
wire fmov_d;
wire imov_d;
wire fp_d;
wire two_cycle_d;
wire i_estage_lth_scanin;
wire i_estage_lth_scanout;
wire address_e;
wire branch_e;
wire ls_special_sel_e;
wire two_cycle_e;
wire rm_early_sel34;
wire as_subtract_e;
wire as_cc_e;
wire lg_cc_e;
wire misalign_e;
wire mov_cond_e;
wire tas_cc_e;
wire tas_tv_e;
wire tcc_e;
wire bmask_e;
wire alignaddress_e;
wire edge08_e;
wire edge16_e;
wire edge32_e;
wire edgele_e;
wire [1:0] gsr_vld_e_in;
wire address_e_in;
wire br_special_sel_e;
wire two_cycle_e_in;
wire i_mstage_lth_scanin;
wire i_mstage_lth_scanout;
wire address_m;
wire ls_special_sel_m;
wire br_special_sel_m;
wire fgu_valid_b;
wire lsu_valid_w2;
wire lsu_exu_ld_w;
wire valid_in_d;
wire valid_in_e;
wire valid_out_e;
wire valid_in_m;
wire valid_lth_m;
wire address_error_m;
wire valid_in_b;
wire valid_lth_b;
wire tof_b;
wire misalign_b;
wire [1:0] ect_tid_in_b;
wire [1:0] tid_lth_b;
wire [4:0] rd_in_d;
wire [4:0] inst_rs3_d;
wire [4:0] rd_in_m;
wire [4:0] rd_lth_m;
wire [4:0] ect_rd_in_b;
wire [4:0] rd_lth_b;
wire rs1_valid_d;
wire rs1_rd_en_d;
wire rs2_valid_d;
wire rs2_rd_en_d;
wire rs3_valid_d;
wire rs3_rd_en_d;
wire ren_lth_scanin;
wire ren_lth_scanout;
wire rs_lth_scanin;
wire rs_lth_scanout;
wire [4:0] inst_rs1_d;
wire [4:0] inst_rs2_d;
wire i_byp_lth_scanin;
wire i_byp_lth_scanout;
wire [1:0] tid_lth_d;
wire [4:0] rd_lth_e;
wire movcc_true_e;
wire [1:0] tid_lth_m;
wire [4:0] lsu_exu_rd_b;
wire valid_lth_e;
wire valid_lth_w_plus1;
wire [1:0] tid_lth_w_plus1;
wire [4:0] rd_lth_w_plus1;
wire valid_lth_w2_plus1;
wire [1:0] tid_lth_w2_plus1;
wire [4:0] rd_lth_w2_plus1;
wire dec_cmov_z00_e;
wire dec_cmov_z01_e;
wire dec_cmov_z10_e;
wire tas_tv_overflow_e;
wire misalign_error_e;
wire raw_valid_out_e;
wire rs1_w2_plus1_cmp;
wire rs2_w2_plus1_cmp;
wire rs3_w2_plus1_cmp;
wire [7:0] lg_cc;
wire [7:0] as_cc;
wire [7:0] ccr_data_e;
wire [7:0] ccr_data_b;
wire fgu_ccr_valid_b;
wire [7:0] ccr_data_lth_b;
wire ccr_valid_in_d;
wire ccr_valid_in_e;
wire ccr_valid_out_e;
wire ccr_valid_in_m;
wire ccr_valid_lth_m;
wire ccr_valid_in_b;
wire ccr_valid_lth_b;
wire wr_ccr_w_tid0;
wire ccr_valid_lth_w;
wire wr_ccr_w_tid1;
wire wr_ccr_w_tid2;
wire wr_ccr_w_tid3;
wire wr_ccr_tlu0;
wire wr_ccr_tlu1;
wire wr_ccr_tlu2;
wire wr_ccr_tlu3;
wire wr_ccr_asi0;
wire [1:0] rng_tid;
wire wr_ccr_asi1;
wire wr_ccr_asi2;
wire wr_ccr_asi3;
wire [7:0] arch_ccr_tid0_in;
wire [7:0] ccr_data_lth_w;
wire [7:0] arch_ccr_tid0_lth;
wire [7:0] arch_ccr_tid1_in;
wire [7:0] arch_ccr_tid1_lth;
wire [7:0] arch_ccr_tid2_in;
wire [7:0] arch_ccr_tid2_lth;
wire [7:0] arch_ccr_tid3_in;
wire [7:0] arch_ccr_tid3_lth;
wire i_ccr_pipe_lth_scanin;
wire i_ccr_pipe_lth_scanout;
wire [7:0] ccr_data_lth_m;
wire ccr_valid_lth_e;
wire i_ccr_arch_lth_wmr_scanin;
wire i_ccr_arch_lth_wmr_scanout;
wire ccr_e_cmp;
wire ccr_m_cmp;
wire ccr_b_cmp;
wire ccr_w_cmp;
wire ccr_sel_e;
wire ccr_sel_m;
wire ccr_sel_b;
wire ccr_sel_w;
wire ccr_sel_a0;
wire ccr_sel_a1;
wire ccr_sel_a2;
wire ccr_sel_a3;
wire [7:0] exu_ccr_byp_data0;
wire [7:0] exu_ccr_byp_data1;
wire ccr_byp_data_b1;
wire ccr_byp_data_b3;
wire trap_taken_e;
wire tcc_taken_e;
wire trap_taken_m_lth;
wire ms_icc_in;
wire tas_tv_overflow_m_in;
wire tas_tv_overflow_m_lth;
wire normal_va_hole_m_;
wire special_ls_va_hole_m_;
wire special_br_va_hole_m_;
wire va_hole_m;
wire pstate_am_m;
wire itlb_bypass_m;
wire misalign_error_m_in;
wire pstate_am_d;
wire i_tlu_lth_scanin;
wire i_tlu_lth_scanout;
wire yreg_mwr_valid_em3_in;
wire yreg_mwr_valid_em2_in;
wire yreg_mwr_valid_em2_lth;
wire yreg_mwr_valid_em1_in;
wire yreg_mwr_valid_em1_lth;
wire yreg_mwr_valid_e_in;
wire yreg_mwr_valid_e_lth;
wire yreg_mwr_valid_m_in;
wire yreg_mwr_valid_m_lth;
wire yreg_swr_valid_e_in;
wire yreg_swr_valid_m_in;
wire yreg_swr_valid_m_lth;
wire yreg_wr_valid_b_in;
wire yreg_mwr_valid_b_lth;
wire yreg_swr_valid_b_lth;
wire i_yreg_mpipe_lth_scanin;
wire i_yreg_mpipe_lth_scanout;
wire i_yreg_spipe_lth_scanin;
wire i_yreg_spipe_lth_scanout;
wire [7:0] lmask_e;
wire [7:0] rmask_e;
wire [7:0] lrmask_e;
wire [7:0] lmask_le8;
wire [7:0] lmask_le16;
wire [7:0] lmask_le32;
wire [7:0] lrmask_le8;
wire [7:0] lrmask_le16;
wire [7:0] lrmask_le32;
wire [2:0] cctype_d;
wire [3:0] brcond_d;
wire fgu_tid_ff_scanin;
wire fgu_tid_ff_scanout;
wire [2:0] fgu_cmp_fcc_tid_fx3;
wire [2:0] fgu_fld_fcc_tid_fx3;
wire [3:0] fcc_cw_valid;
wire sel_ct0;
wire sel_ct1;
wire sel_ct2;
wire sel_ct3;
wire [3:0] fcc_cw_t0;
wire [3:0] fcc_cw_t1;
wire [3:0] fcc_cw_t2;
wire [3:0] fcc_cw_t3;
wire [1:0] fcc_lw_valid;
wire sel_lt0;
wire sel_lt1;
wire sel_lt2;
wire sel_lt3;
wire [1:0] fcc_lw_t0;
wire [1:0] fcc_lw_t1;
wire [1:0] fcc_lw_t2;
wire [1:0] fcc_lw_t3;
wire [7:0] t0_data_in;
wire [7:0] t0_hold_in;
wire [7:0] fcc_t0_d;
wire [7:0] fcc_nxt_t0;
wire fcc_t0_ff_wmr_scanin;
wire fcc_t0_ff_wmr_scanout;
wire [7:0] t1_data_in;
wire [7:0] t1_hold_in;
wire [7:0] fcc_t1_d;
wire [7:0] fcc_nxt_t1;
wire fcc_t1_ff_wmr_scanin;
wire fcc_t1_ff_wmr_scanout;
wire [7:0] t2_data_in;
wire [7:0] t2_hold_in;
wire [7:0] fcc_t2_d;
wire [7:0] fcc_nxt_t2;
wire fcc_t2_ff_wmr_scanin;
wire fcc_t2_ff_wmr_scanout;
wire [7:0] t3_data_in;
wire [7:0] t3_hold_in;
wire [7:0] fcc_t3_d;
wire [7:0] fcc_nxt_t3;
wire fcc_t3_ff_wmr_scanin;
wire fcc_t3_ff_wmr_scanout;
wire [7:0] fcc_d;
wire use_fcc0_d;
wire use_fcc1_d;
wire use_fcc2_d;
wire use_fcc3_d;
wire [1:0] curr_fcc_d;
wire [3:0] fcc_dec_d;
wire fcce_ff_scanin;
wire fcce_ff_scanout;
wire [3:0] fcc_dec_e;
wire brcond_e_reg_scanin;
wire brcond_e_reg_scanout;
wire [3:0] br_cond_e;
wire use_xcc_d;
wire [7:0] ccr_byp_data;
wire [3:0] cc_d;
wire ccreg_e_scanin;
wire ccreg_e_scanout;
wire [3:0] cc_e;
wire [3:0] brcond_e;
wire ltz_e;
wire [7:0] cc_breval_e;
wire cc_eval0;
wire cc_eval1;
wire [7:0] fp_breval_e;
wire fp_eval0;
wire fp_eval1;
wire cctype_reg_scanin;
wire cctype_reg_scanout;
wire [2:2] cctype_e;
wire fpcond_mvbr_e;
wire cc_eval;
wire cond_true_e;
wire misc_ff_scanin;
wire misc_ff_scanout;
wire callclass_e;
wire specbr_e;
wire cmov_e;
wire regop_e;
wire r_eval1;
wire r_eval0;
wire final_cond_true_z0_e;
wire final_cond_true_z1_e;
wire spares_scanin;
wire spares_scanout;


// *** Global Inputs ***

input		l2clk;
input 		scan_in;
input		wmr_scan_in;
input 		tcu_pce_ov;		// scan signals
input 		spc_aclk;
input 		spc_bclk;
input		spc_aclk_wmr;
input		tcu_scan_en;

input  [1:0]	dec_tid_p;

input		dec_inst_rs1_vld_p;
input		dec_inst_rs2_vld_p;
input		dec_inst_rs3_vld_p;
input  [4:0]	dec_inst_rs1_p;			// window operations must be taken into account
input  [4:0]	dec_inst_rs2_p;
input  [4:0]	dec_inst_rs3_p;
input  [4:0]	dec_inst_rd_d;
input  [31:5]	dec_inst_d;
input		dec_decode_d;			// Instruction and TID are valid
input		dec_thread_group;		// Static Signal : Tie UP or DOWN where cloning occurs

input		dec_valid_e;			// inst is truly valid at e (annul)
input		tlu_itlb_bypass_e;		// Ignore Address Out-Of-Range

input		dec_flush_m;
input		dec_flush_b;

input  [3:0]	fgu_exu_icc_fx5;		// FGU int icc cond code {N,Z,V,C}
input  [1:0]	fgu_exu_xcc_fx5;		// FGU int xcc cond code {N,Z}
input		fgu_exu_cc_vld_fx5;		// FGU int icc/xcc cond code valid
input  [1:0]	fgu_result_tid_fx5;
input  [4:0]	fgu_irf_w_addr_fx5;
input		fgu_exu_w_vld_fx5;

input		lsu_exu_ld_b;
input  [4:0]	lsu_exu_rd_m;
input  [2:0]	lsu_exu_tid_m;
input		lsu_exu_ld_vld_w;

input		tlu_flush_exu_b;		// EXU to flush instr in B stage
input  [7:0]	tlu_ccr;
input		tlu_ccr_cwp_valid;
input  [1:0]	tlu_ccr_cwp_tid;
input  [3:0]	tlu_pstate_am;			// 32-bit addressing mode if = 1

input		lsu_exu_pmen;			// Power Management : Master Enable
input  [3:0]	spc_core_running_status;	// Power Management : Thread active

input		mbi_run; 			// MBIST
input  [6:0]	mbi_addr; 			// MBIST
input		mbi_irf_write_en; 		// MBIST


// *** Local  Inputs ***

input  [7:0]	edp_rng_in_ff;			// ASI Ring : In data flopped
input		edp_rng_in_ff_b56;
input		edp_rng_in_ff_b57;
input		rml_rng_wt_ccr_ctl;

input  [1:0]	edp_br_flag_e;			// [1] : RS1 negative;  [0] : RS1 zero;
input  [63:0]	exu_rs1_data_e;
input  [63:0]	exu_rs2_data_e;

input		edp_add_cout64_e;
input		edp_add_data_e_b63;
input		edp_add_data_e_b31;
input		edp_add_data_e_b1;
input		edp_add_data_e_b0;
input  [1:0]	edp_add_zdetect_e_;

input		edp_sub_cout64_e;
input		edp_sub_data_e_b63;
input		edp_sub_data_e_b31;
input  [1:0]	edp_sub_zdetect_e_;

input		edp_logical_data_e_b63;
input		edp_logical_data_e_b31;
input  [1:0]	edp_lg_zdetect_e;

input  [63:47]	edp_address_m;
input  [63:47]	edp_rd_ff_m;

input		exu_ecc_m;

input 		rml_test_valid_d;


// *** DEC_CCR Inputs ***

input  [7:0]	fgu_fld_fcc_fx3;		// fcc's from the fgu
input  [2:0]	lsu_fgu_fld_tid_b;
input  [1:0]	fgu_fld_fcc_vld_fx3;
input		lsu_fgu_fld_vld_w;		// Float load valid

input  [1:0]	fgu_cmp_fcc_fx3;		// fcc's from the fgu
input  [2:0]	fgu_cmp_fcc_tid_fx2;
input  [3:0]	fgu_cmp_fcc_vld_fx3;

input  [3:0]	dec_pick_d;			// which stand is valid at d


// *** Global Outputs ***

output [5:0]	exu_mdp_mux_sel_e;		// To MDP
output		exu_ms_icc_e;

output [1:0]	exu_gsr_vld_m;
output		exu_cmov_true_m;

output		exu_lsu_va_error_m;		// To LSU : Address Out of Range

output		exu_misalign_m;			// To TLU : Misaligned address for Jump,Return
output		exu_oor_va_m;			// To TLU : Address Out of Range
output		exu_tcc_m;			// To TLU : Trap taken
output		exu_tof_m;			// To TLU : Tagged Add TV with overflow

output [7:0]	exu_ccr0;			// To TLU : Architected CCR 
output [7:0]	exu_ccr1;			// To TLU : Architected CCR 
output [7:0]	exu_ccr2;			// To TLU : Architected CCR 
output [7:0]	exu_ccr3;			// To TLU : Architected CCR 


// *** Local  Outputs ***

output		ect_mbist_sel;

output [4:0]	ect_rs1_early_sel_d;
output [4:0]	ect_rs2_early_sel_d;
output [4:0]	ect_rs3_early_sel_d;
output [7:0]	ect_rs2_imm_sel_d;
output [3:0]	ect_rs1_late_sel_d;
output [3:0]	ect_rs2_late_sel_d;
output [3:0]	ect_rs3_late_sel_d;
output [3:0]	ect_logic_sel_d;
output [6:0]	ect_shift_sel_d;

output		ect_br_taken_z0_e;
output		ect_br_taken_z1_e;
output		ect_alignaddress_little_e;
output		ect_as_clip_e_;			// ALIGNADDRESS clipping of bit [2:0]
output		ect_as_cin_e;
output [1:0]	ect_array_sel_e;
output [7:0]	ect_edge_lmask_e;
output [7:0]	ect_edge_lrmask_e;
output		ect_pstate_am_e;
output [5:0]	ect_rm_early_sel_e;
output [2:0]	ect_rm_late_sel_e;		//  [0] : Sub;  [1] : Add;  [2] : Shift;  Def : Early Mux
output		ect_store_mux_sel_e;
output [1:0]	ect_tid_lth_e;

output [4:0]	ect_rs1_addr_e;
output [4:0]	ect_rs2_addr_e;
output [4:0]	ect_rs3_addr_e;
output		ect_rs1_valid_e;		// Allow ECC checking on RS1
output		ect_rs2_valid_e;		// Allow ECC checking on RS2
output		ect_rs3_valid_e;		// Allow ECC checking on RS3
output		ect_two_cycle_m;		// Allow ECC checking on 2nd cycle of CASA+STD

output [4:0]	ect_rd_lth_w;
output [4:0]	ect_rd_lth_w2;
output [1:0]	ect_tid_lth_w;
output [1:0]	ect_tid_lth_w2;
output		ect_valid_lth_w;
output		ect_valid_in_w2;

output		ect_yreg_wr_w;
output [7:0]	ect_rng_ccr_data;

output 		ect_misaligned_error_m;		// To RML : assert when last 2 bit of address is non "00"

output		ect_ex_emb_clken;		// Power Management
output		ect_tg_clken;			// Power Management


output 		scan_out;
output		wmr_scan_out;


// scan renames
assign pce_ov		= tcu_pce_ov;
assign stop		= 1'b0;
assign siclk		= spc_aclk;
assign soclk		= spc_bclk;
assign se		= tcu_scan_en;
// end scan


 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Power Management !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_ect_ctl_l1clkhdr_ctl_macro clkgen 	(
 .l2clk( l2clk			),
 .l1en ( 1'b1 			),
 .l1clk( l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


exu_ect_ctl_l1clkhdr_ctl_macro clkgen_pm1	(
 .l2clk( l2clk			),
 .l1en ( ect_tg_clken		),
 .l1clk( l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


exu_ect_ctl_l1clkhdr_ctl_macro clkgen_pm2	(
 .l2clk( l2clk			),
 .l1en (     ex_dw1_clken	),
 .l1clk( l1clk_pm2		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


assign tg_active	= (spc_core_running_status[3:0] != 4'b0000);

exu_ect_ctl_msff_ctl_macro__width_5		i_pwr0_lth		 (
 .scan_in(i_pwr0_lth_scanin),
 .scan_out(i_pwr0_lth_scanout),
 .l1clk( l1clk											),
 .din  ({~lsu_exu_pmen , tg_active     , mbi_run     , lsu_exu_tid_m[2] , lsu_exu_tid_b[2]}	),
 .dout ({pmen_lth_     , tg_active_lth , mbi_run_lth , lsu_exu_tid_b[2] , tid_lth_w2[2]}	),
  .siclk(siclk),
  .soclk(soclk));


exu_ect_ctl_msff_ctl_macro__width_5		i_pwr1_lth		 (
 .scan_in(i_pwr1_lth_scanin),
 .scan_out(i_pwr1_lth_scanout),
 .l1clk( l1clk_pm1						),
 .din  ({dec_decode_d , dec_valid_e , pwr_m , pwr_b , pwr_w}	),
 .dout ({pwr_e        ,	pwr_m       , pwr_b , pwr_w , pwr_w_p1}	),
  .siclk(siclk),
  .soclk(soclk));


assign ect_tg_clken	= pmen_lth_ | tg_active_lth | mbi_run_lth;
assign ect_ex_emb_clken	= pmen_lth_ |                 mbi_run_lth |                pwr_e | pwr_m | pwr_b;
assign     ex_dw1_clken	= pmen_lth_ |                 mbi_run_lth | dec_decode_d | pwr_e | pwr_m | pwr_b | pwr_w | pwr_w_p1;

assign ect_mbist_sel	=                             mbi_run_lth;


exu_ect_ctl_msff_ctl_macro__width_8		i_mbist_lth		 (
 .scan_in(i_mbist_lth_scanin),
 .scan_out(i_mbist_lth_scanout),
 .l1clk( l1clk_pm1					),
 .din  ({mbi_irf_write_en    , mbi_addr[6:0]}		),
 .dout ({mbi_irf_write_en_p1 , mbi_addr_p1[6:0]}	),
  .siclk(siclk),
  .soclk(soclk));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Power Management !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Decode       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

// *** WARNING : Full decodes used until unit is functional - then use espresso


//	assign inst[29:25]		= dec_inst_d[29:25];


// *** ADD/SUB ***

//	assign d_add			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0000);
//	assign d_addcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0000);
//	assign d_addc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1000);
//	assign d_addccc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1000);
								      
//	assign d_sub			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0100);
//	assign d_subcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0100);
//	assign d_subc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1100);
//	assign d_subccc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1100);

//	assign d_taddcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0000);		 // pg 234 : Tagged Add
//	assign d_taddcctv		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0010);		 // pg 234 : Tagged Add
//	assign d_tsubcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0001);		 // pg 235 : Tagged Sub
//	assign d_tsubcctv		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0011);		 // pg 235 : Tagged Sub

//	assign d_save			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1100);		 // pg 214 : Save
//	assign d_restore		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1101);		 // pg 214 : Restore

//	assign add_d			= d_add | d_addcc | d_addc  | d_addccc       | d_taddcc | d_taddcctv | bmask_d | alignaddress_d | alignaddress_little_d;
//	assign sub_d			= d_sub | d_subcc | d_subc  | d_subccc       | d_tsubcc | d_tsubcctv;
//	assign addsub_d			= add_d | sub_d   | bmask_d | alignaddress_d | alignaddress_little_d;

//	assign as_subtract_d		= sub_d | edge_d;

//	assign as_cc_d			= d_addcc | d_addccc | d_subcc | d_subccc | d_taddcc | d_taddcctv | d_tsubcc | d_tsubcctv | edge_cc_d;
//	assign tas_cc_d			=                                           d_taddcc | d_taddcctv | d_tsubcc | d_tsubcctv;
//	assign tas_tv_d			=                                                      d_taddcctv |            d_tsubcctv;

//	assign as_cin_d			= ((d_sub    | d_subcc   )                   ) |
//					  ((d_tsubcc | d_tsubcctv)                   ) |
//					  ( edge_d                                   ) |
//					  ((d_subc   | d_subccc  ) & ~ccr_byp_data_b0) |
//					  ((d_addc   | d_addccc  ) &  ccr_byp_data_b0);

	assign as_cin_d			=  as_cin_set_d                      |
					  (as_cin_ccr0_d & ~ccr_byp_data_b0) |
					  (as_cin_ccr1_d &  ccr_byp_data_b0);



// *** LOGICAL
									      
//	assign d_and			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0001);
//	assign d_andcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0001);
//	assign d_andn			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0101);
//	assign d_andncc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0101);
//	assign d_or			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0010);
//	assign d_orcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0010);
//	assign d_orn			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0110);
//	assign d_orncc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0110);
//	assign d_xor			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0011);
//	assign d_xorcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0011);
//	assign d_xorn			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_0111);
//	assign d_xorncc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_0111);

//	assign logic_rs2_d		= sethi_d | mov_cond_d;

//	assign logic_d			= d_and | d_andcc | d_andn | d_andncc | d_or | d_orcc | d_orn | d_orncc | d_xor | d_xorcc | d_xorn | d_xorncc | logic_rs2_d;
//	assign logic_sel_d[3]		= d_and | d_andcc |                     d_or | d_orcc | d_orn | d_orncc |                   d_xorn | d_xorncc | logic_rs2_d | casa_d;
//	assign logic_sel_d[2]		=                   d_andn | d_andncc | d_or | d_orcc | d_orn | d_orncc | d_xor | d_xorcc                                   | casa_d;
//	assign logic_sel_d[1]		=                                       d_or | d_orcc |                   d_xor | d_xorcc                     | logic_rs2_d;
//	assign logic_sel_d[0]		=                                                       d_orn | d_orncc |                   d_xorn | d_xorncc              ;

//	assign lg_cc_d			= d_andcc | d_andncc | d_orcc | d_orncc | d_xorcc | d_xorncc;


// *** SHIFT ***

//	assign d_sll			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0101) & (inst[12] == 1'b0);
//	assign d_srl			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0110) & (inst[12] == 1'b0);
//	assign d_sra			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0111) & (inst[12] == 1'b0);
//	assign d_sllx			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0101) & (inst[12] == 1'b1);
//	assign d_srlx			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0110) & (inst[12] == 1'b1);
//	assign d_srax			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0111) & (inst[12] == 1'b1);

//	assign shift_d			= d_sll | d_srl | d_sra | d_sllx | d_srlx | d_srax;
//	assign shift_sel_d[6]		=         d_srl | d_sra |          d_srlx | d_srax;
//	assign shift_sel_d[5]		= d_sll |                 d_sllx                  ;
//	assign shift_sel_d[4]		=                                           d_srax;
//	assign shift_sel_d[3]		=                 d_sra                           ;
//	assign shift_sel_d[2]		=                                  d_srlx | d_srax;
//	assign shift_sel_d[1]		=                         d_sllx                  ;
//	assign shift_sel_d[0]		= d_sll | d_srl | d_sra                           ;


// *** EDGE ***

//	assign d_edge8			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0000);	// VIS pg. 70
//	assign d_edge8n			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0001);	// VIS pg. 70
//	assign d_edge8l			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0010);	// VIS pg. 70
//	assign d_edge8ln		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0011);	// VIS pg. 70
//	assign d_edge16			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0100);	// VIS pg. 70
//	assign d_edge16n		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0101);	// VIS pg. 70
//	assign d_edge16l		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0110);	// VIS pg. 70
//	assign d_edge16ln		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_0111);	// VIS pg. 70
//	assign d_edge32			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_1000);	// VIS pg. 70
//	assign d_edge32n		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_1001);	// VIS pg. 70
//	assign d_edge32l		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_1010);	// VIS pg. 70
//	assign d_edge32ln		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0000_1011);	// VIS pg. 70

//	assign edge08_d			= d_edge8   | d_edge8n  | d_edge8l  | d_edge8ln;
//	assign edge16_d			= d_edge16  | d_edge16n | d_edge16l | d_edge16ln;
//	assign edge32_d			= d_edge32  | d_edge32n | d_edge32l | d_edge32ln;
//	assign edge_d			= edge08_d  | edge16_d  | edge32_d;
//	assign edgele_d			= d_edge8l  | d_edge8ln | d_edge16l | d_edge16ln | d_edge32l | d_edge32ln;

//	assign edge_cc_d		= d_edge8   | d_edge8l  | d_edge16  | d_edge16l  | d_edge32  | d_edge32l;


// *** ARRAY ***

//	assign array08_d		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0001_0000);	// VIS pg. 74
//	assign array16_d		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0001_0010);	// VIS pg. 74
//	assign array32_d		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:05] == 9'b0_0001_0100);	// VIS pg. 74

//	assign array_d			= array08_d | array16_d | array32_d;


// *** BRANCH ***

//	assign bpr_d			= (inst[31:30] == 2'b00) & (inst[28] == 1'b0) & (inst[24:22] == 3'b011);	// pg 136 : sign_ext{[21:20],[13:0]}
//	assign bicc_d			= (inst[31:30] == 2'b00) &                      (inst[24:22] == 3'b010);	// pg 144 : sign_ext{[21:0]}
//	assign bpcc_d			= (inst[31:30] == 2'b00) &                      (inst[24:22] == 3'b001);	// pg 146 : sign_ext{[18:0]}
//	assign call_d			= (inst[31:30] == 2'b01);							// pg 149 : sign_ext{[29:0]}
//	assign fbfcc_d			= (inst[31:30] == 2'b00) &                      (inst[24:22] == 3'b110);	// pg 138 : sign_ext{[21:0]}
//	assign fbpfcc_d			= (inst[31:30] == 2'b00) &                      (inst[24:22] == 3'b101);	// pg 141 : sign_ext{[18:0]}

//	assign branch_d			= bpr_d | bicc_d | bpcc_d | call_d | fbfcc_d | fbpfcc_d;


// *** Conditional Move ***

//	assign fmovcc_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0101) & (inst[18] == 1'b0);	// pg 185 : Move FP  on Condition Code
//	assign fmovr_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0101) & (inst[13] == 1'b0);	// pg 189 : Move FP  on Integer reg
//	assign movcc_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_1100);				// pg 189 : Move Int on Condition Code
//	assign movr_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_1111);				// pg 189 : Move Int on Integer reg

//	assign mov_cond_d		= movcc_d | movr_d;

// *** LOAD & STORE ***

//	assign d_ldf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0000);		// pg 171 : Load Floating Point
//	assign d_lddf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0011);		// pg 171 : Load Floating Point
//	assign d_ldqf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0010);		// pg 171 : Load Floating Point
//	assign d_ldfsr			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0001);		// pg 171 : Load Floating Point
//	assign d_ldxfsr			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0001);		// pg 171 : Load Floating Point

//	assign d_ldfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0000);		// pg 173 : Load Floating Point from Alternate Space
//	assign d_lddfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0011);		// pg 173 : Load Floating Point from Alternate Space
//	assign d_ldqfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0010);		// pg 173 : Load Floating Point from Alternate Space

//	assign d_ldsb			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1001);		// pg 175 : Load Integer
//	assign d_ldsh			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1010);		// pg 175 : Load Integer
//	assign d_ldsw			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1000);		// pg 175 : Load Integer
//	assign d_ldub			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0001);		// pg 175 : Load Integer
//	assign d_lduh			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0010);		// pg 175 : Load Integer
//	assign d_lduw			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0000);		// pg 175 : Load Integer
//	assign d_ldx			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1011);		// pg 175 : Load Integer
//	assign d_ldd			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0011);		// pg 175 : Load Integer

//	assign d_ldsba			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1001);		// pg 177 : Load Integer from Alternate Space
//	assign d_ldsha			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1010);		// pg 177 : Load Integer from Alternate Space
//	assign d_ldswa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1000);		// pg 177 : Load Integer from Alternate Space
//	assign d_lduba			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0001);		// pg 177 : Load Integer from Alternate Space
//	assign d_lduha			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0010);		// pg 177 : Load Integer from Alternate Space
//	assign d_lduwa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0000);		// pg 177 : Load Integer from Alternate Space
//	assign d_ldxa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1011);		// pg 177 : Load Integer from Alternate Space
//	assign d_ldda			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0011);		// pg 177 : Load Integer from Alternate Space

//	assign d_ldstub			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1101);		// pg 179 : Load-Store
//	assign d_ldstuba		= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1101);		// pg 180 : Load-Store from Alternate Space

//	assign d_prefetch		= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_1101);		// pg 203 : Prefetch Data
//	assign d_prefetcha		= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_1101);		// pg 203 : Prefetch Data from Alternate Space


//	assign load_d			= d_ldf      | d_lddf    | d_ldfsr | d_ldxfsr |
//					  d_ldfa     | d_lddfa   |
//					  d_ldsb     | d_ldsh    | d_ldsw  | d_ldub   | d_lduh  | d_lduw  | d_ldx  |  d_ldd  |
//					  d_ldsba    | d_ldsha   | d_ldswa | d_lduba  | d_lduha | d_lduwa | d_ldxa |  d_ldda |
//					  d_ldstub   | d_ldstuba |
//					  d_prefetch | d_prefetcha;

//	assign int_load_d		= d_ldsb     | d_ldsh    | d_ldsw  | d_ldub   | d_lduh  | d_lduw  | d_ldx  |  d_ldd  |
//					  d_ldsba    | d_ldsha   | d_ldswa | d_lduba  | d_lduha | d_lduwa | d_ldxa |  d_ldda |
//					  d_ldstub   | d_ldstuba;


//	assign d_stf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0100);		// pg 222 : Store Floating Point
//	assign d_stdf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0111);		// pg 222 : Store Floating Point
//	assign d_stqf			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0110);		// pg 222 : Store Floating Point
//	assign d_stfsr			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0101);		// pg 222 : Store Floating Point
//	assign d_stxfsr			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b10_0101);		// pg 222 : Store Floating Point

//	assign d_stfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0100);		// pg 224 : Store Floating Point from Alternate Space
//	assign d_stdfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0111);		// pg 224 : Store Floating Point from Alternate Space
//	assign d_stqfa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_0110);		// pg 224 : Store Floating Point from Alternate Space

//	assign d_stb			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0101);		// pg 226 : Store Integer
//	assign d_sth			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0110);		// pg 226 : Store Integer
//	assign d_stw			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0100);		// pg 226 : Store Integer
//	assign d_stx			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1110);		// pg 226 : Store Integer
//	assign d_std			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_0111);		// pg 226 : Store Integer

//	assign d_stba			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0101);		// pg 226 : Store Integer from Alternate Space
//	assign d_stha			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0110);		// pg 226 : Store Integer from Alternate Space
//	assign d_stwa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0100);		// pg 226 : Store Integer from Alternate Space
//	assign d_stxa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1110);		// pg 226 : Store Integer from Alternate Space
//	assign d_stda			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_0111);		// pg 226 : Store Integer from Alternate Space

//	assign d_swap			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b00_1111);		// pg 231 : Swap Register with Memory
//	assign d_swapa			= (inst[31:30] == 2'b11) & (inst[24:19] == 6'b01_1111);		// pg 232 : Swap Register with Alt Space Memory


//	assign casa_d			=((inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_1100))|	// pg 150 : Compare and Swap
//					 ((inst[31:30] == 2'b11) & (inst[24:19] == 6'b11_1110));	// pg 150 : Compare and Swap


//	assign store_d			= d_stf    | d_stdf   | d_stfsr | d_stxfsr |
//					  d_stfa   | d_stdfa  |
//					  d_stb    | d_sth    | d_stw   |  d_stx   | d_std  |
//					  d_stba   | d_stha   | d_stwa  |  d_stxa  | d_stda |
//					  d_swap   | d_swapa;


// *** VIS ***

//	assign bmask_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:5] == 9'b0_0001_1001);
//	assign alignaddress_d		= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:5] == 9'b0_0001_1000);
//	assign alignaddress_little_d	= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0110) & (inst[13:5] == 9'b0_0001_1010);



// *** FGU ***

//	assign d_udiv			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1110);		// pg 152 : Unsigned Integer Division
//	assign d_sdiv			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1111);		// pg 152 :   Signed Integer Division
//	assign d_udivcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1110);		// pg 152 : Unsigned Integer Division
//	assign d_sdivcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1111);		// pg 152 :   Signed Integer Division

//	assign d_mulx			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1001);		// pg 196 : Multiply (signed or unsigned)
//	assign d_sdivx			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_1101);		// pg 196 :   Signed Divide
//	assign d_udivx			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1101);		// pg 196 : Unsigned Divide

//	assign d_umul			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1010);		// pg 197 : Unsigned Integer Multiply
//	assign d_smul			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b00_1011);		// pg 197 :   Signed Integer Multiply
//	assign d_umulcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1010);		// pg 197 : Unsigned Integer Multiply
//	assign d_smulcc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b01_1011);		// pg 197 :   Signed Integer Multiply

//	assign d_mulscc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_0100);		// pg 199 : Multiply Step

//	assign d_popc			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b10_1110);		// pg 202 : Population Count

//	assign int_to_fgu_d		= d_udiv   | d_sdiv  | d_udivcc | d_sdivcc |
//					  d_mulx   | d_sdivx | d_udivx  |
//					  d_umul   | d_smul  | d_umulcc | d_smulcc |
//					  d_mulscc | d_popc;

//	assign mux_mdp_sel_d[0]		= d_smul   | d_smulcc;
//	assign mux_mdp_sel_d[1]		= d_umul   | d_umulcc;
//	assign mux_mdp_sel_d[2]		= d_udiv   | d_sdiv   | d_udivcc | d_sdivcc;
//	assign mux_mdp_sel_d[3]		= d_mulscc;
//	assign mux_mdp_sel_d[4]		= d_sdiv   | d_sdivcc | d_smul   | d_smulcc;
//	assign mux_mdp_sel_d[5]		= d_udiv   | d_udivcc | d_umul   | d_umulcc | d_mulscc;



// *** MISC ***

//	assign jmpl_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1000);
//	assign return_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1001);
//	assign sethi_d			= (inst[31:30] == 2'b00) & (inst[24:22] == 3'b10_0   );
//	assign sir_d			= (inst[31:30] == 2'b10) & (inst[29:14] == 16'b01111_11_0000_00000);	// pg 220
//	assign tcc_d			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_1010);			// pg 237 : Trap on Integer Condition
//	assign d_wrpr			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0010);			// pg 239 : Write Privileged Register
//	assign d_wry			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0000);			// pg 241 : Write State      Register
//	assign d_wrhpr			= (inst[31:30] == 2'b10) & (inst[24:19] == 6'b11_0011);			//
//	assign wrxx_d			= (d_wrpr  | d_wry  | d_wrhpr) & dec_decode_d;
	assign wrxx_d			=  wrxx_raw_d & dec_decode_d;

//	assign address_d		= branch_d | load_d | store_d | return_d | casa_d;

//	assign exu_op_d			= logic_d | shift_d | add_d | sub_d | jmpl_d | edge_d | array_d;



// *** Operand Selects ***

	assign ect_rs1_early_sel_d[0]	=  rs1_m_cmp;
	assign ect_rs1_early_sel_d[1]	=  rs1_b_cmp;
	assign ect_rs1_early_sel_d[2]	=  rs1_w_cmp;
 	assign ect_rs1_early_sel_d[3]	=  rs1_w2_cmp;
 	assign ect_rs1_early_sel_d[4]	=  rs1_w_plus1_cmp;

	assign ect_rs1_late_sel_d[0]	=  branch_d;								// PC
	assign ect_rs1_late_sel_d[1]	=  rs1_e_cmp;								// E Stage Bypass
	assign ect_rs1_late_sel_d[2]	=  rs1_l_cmp & ~rs1_m_cmp;						// Load    Bypass
	assign ect_rs1_late_sel_d[3]	=  rs1_byp_early;

//	assign ect_rs2_imm_sel_d[0]	=  bpr_d;								// immediate BPr = {[21:20],[13:0]}
//	assign ect_rs2_imm_sel_d[1]	=  bicc_d   | fbfcc_d;							// immediate disp22
//	assign ect_rs2_imm_sel_d[2]	=  bpcc_d   | fbpfcc_d;							// immediate disp19
//	assign ect_rs2_imm_sel_d[3]	=  call_d;								// immediate disp30
//	assign ect_rs2_imm_sel_d[4]	=  sethi_d;								// IMM22
//	assign ect_rs2_imm_sel_d[5]	=  movcc_d;								// SIMM11
//	assign ect_rs2_imm_sel_d[6]	=  movr_d;								// SIMM10
//	assign ect_rs2_imm_sel_d[7]	=  rs2_imm13_data_d;							// SIMM13
	assign ect_rs2_imm_sel_d[7:0]	= {rs2_imm_sel7_d,rs2_imm_sel6_d,rs2_imm_sel5_d,rs2_imm_sel4_d,rs2_imm_sel3_d,rs2_imm_sel2_d,rs2_imm_sel1_d,rs2_imm_sel0_d};


	assign ect_rs2_early_sel_d[0]	=  rs2_m_cmp;
	assign ect_rs2_early_sel_d[1]	=  rs2_b_cmp;
	assign ect_rs2_early_sel_d[2]	=  rs2_w_cmp;
 	assign ect_rs2_early_sel_d[3]	=  rs2_w2_cmp;
 	assign ect_rs2_early_sel_d[4]	=  rs2_w_plus1_cmp;

//	assign rs2_imm13_data_d		= (d_save   | d_restore | logic_d  | add_d  | sub_d   | shift_d | load_d | store_d | jmpl_d |
//					   return_d | sir_d     | tcc_d    | d_wrpr | d_wrhpr | d_wry   | int_to_fgu_d) & inst[13];

//	assign rs2_imm_data_d		=  branch_d | sethi_d | rs2_imm13_data_d;


	assign ect_rs2_late_sel_d[0]	=  rs2_imm_data_d;							// Immediate
	assign ect_rs2_late_sel_d[1]	=  rs2_e_cmp;								// E Stage Bypass
	assign ect_rs2_late_sel_d[2]	=  rs2_l_cmp & ~rs2_m_cmp;						// Load    Bypass
	assign ect_rs2_late_sel_d[3]	=  rs2_byp_early;


	assign ect_rs3_early_sel_d[0]	=  rs3_m_cmp;
	assign ect_rs3_early_sel_d[1]	=  rs3_b_cmp;
	assign ect_rs3_early_sel_d[2]	=  rs3_w_cmp;
 	assign ect_rs3_early_sel_d[3]	=  rs3_w2_cmp;
 	assign ect_rs3_early_sel_d[4]	=  rs3_w_plus1_cmp;

	assign ect_rs3_late_sel_d[0]	=  rs1_late_sel4_d &  dec_decode_d & ~rml_test_valid_d;			// call_d | jmpl_d
	assign ect_rs3_late_sel_d[1]	=  rs3_e_cmp                       & ~rml_test_valid_d;
	assign ect_rs3_late_sel_d[2]	=  rs3_l_cmp       & ~rs3_m_cmp    & ~rml_test_valid_d;
	assign ect_rs3_late_sel_d[3]	=  rs3_byp_early                   & ~rml_test_valid_d;


// *** RESULT MUX ***

//	assign rm_late_sel_d[0]		= sub_d;
//	assign rm_late_sel_d[1]		= add_d | tcc_d | load_d | store_d | return_d | bpr_d | bicc_d | bpcc_d | fbfcc_d | fbpfcc_d;
//	assign rm_late_sel_d[2]		= shift_d;

//	assign rm_early_sel_d[0]	= logic_d | casa_d;
//	assign rm_early_sel_d[1]	= array_d;
//	assign rm_early_sel_d[2]	= edge_d;
//	assign rm_early_sel_d[3]	= d_mulscc;
//	assign rm_early_sel_d[4]	= call_d | jmpl_d;






 

// The ESPRESSO code below was generated from the EXU's "decode" file using the following command :
//
//      ~rg131678/perl/n2decode -i decode -exu > decode.out
//

	assign i[31:5]		= dec_inst_d[31:5];

// --- autogenerated by n2decode view=exu Tue Aug 16 16:43:11 CDT 2005

assign as_subtract_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[12]&!i[11]
    &!i[10]&!i[9]) | (i[31]&!i[30]&i[24]&!i[23]&!i[22]&!i[21]&i[19]) | (
    i[31]&!i[30]&!i[24]&i[21]&!i[20]&!i[19]);

assign as_cc_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[11]&!i[10]&!i[9]
    &!i[5]) | (i[31]&!i[30]&!i[24]&i[23]&!i[20]&!i[19]) | (i[31]&!i[30]
    &i[24]&!i[23]&!i[22]&!i[21]);

assign tas_cc_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&!i[21]);

assign tas_tv_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&!i[21]&i[20]);

assign as_cin_set_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[12]&!i[11]
    &!i[10]&!i[9]) | (i[31]&!i[30]&i[24]&!i[23]&!i[22]&!i[21]&i[19]) | (
    i[31]&!i[30]&!i[24]&!i[22]&i[21]&!i[20]&!i[19]);

assign as_cin_ccr0_d = (i[31]&!i[24]&i[22]&i[21]&!i[20]&!i[19]);

assign as_cin_ccr1_d = (i[31]&!i[30]&!i[24]&i[22]&!i[21]&!i[20]&!i[19]);

assign logic_sel3_d = (i[31]&i[24]&i[23]&i[21]&i[20]&i[19]&!i[13]&i[12]&i[11]
    &!i[10]&!i[9]) | (i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&!i[30]
    &!i[24]&!i[22]&!i[21]&!i[20]&i[19]) | (i[31]&!i[30]&!i[24]&!i[22]
    &i[21]&i[20]) | (i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]) | (
    i[31]&i[24]&i[22]&i[21]&i[20]&i[19]) | (i[31]&!i[30]&!i[24]&!i[22]
    &i[20]&!i[19]) | (!i[31]&!i[30]&!i[23]&!i[22]);

assign logic_sel2_d = (i[31]&i[24]&i[23]&i[21]&i[20]&i[19]&!i[13]&i[12]&i[11]
    &!i[10]&!i[9]) | (i[31]&!i[30]&!i[24]&!i[22]&i[21]&!i[20]&i[19]) | (
    i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&!i[30]&!i[24]&!i[22]&!i[21]
    &i[20]) | (i[31]&!i[30]&!i[24]&!i[22]&i[20]&!i[19]);

assign logic_sel1_d = (i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]) | (i[31]
    &i[24]&i[22]&i[21]&i[20]&i[19]) | (i[31]&!i[30]&!i[24]&!i[22]&!i[21]
    &i[20]) | (!i[31]&!i[30]&!i[23]&!i[22]);

assign logic_sel0_d = (i[31]&!i[30]&!i[24]&!i[22]&i[21]&i[20]);

assign lg_cc_d = (i[31]&!i[30]&!i[24]&i[23]&!i[20]&i[19]) | (i[31]&!i[30]&!i[24]
    &i[23]&!i[22]&i[20]);

assign shift_sel6_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[20]&i[12]) | (
    i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[19]&i[12]);

assign shift_sel5_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[20]);

assign shift_sel4_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&i[19]);

assign shift_sel3_d = (i[31]&!i[30]&i[24]&!i[22]&i[21]&i[20]&i[19]&i[12]);

assign shift_sel2_d = (i[31]&!i[30]&i[24]&!i[22]&i[21]&i[20]&i[19]&!i[12]);

assign shift_sel1_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[20]&i[12]);

assign shift_sel0_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&i[19]&i[12]);

assign edgele_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[11]&!i[10]
    &!i[9]&i[6]);

assign edge08_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[12]&!i[10]
    &!i[9]&!i[8]&!i[7]);

assign edge16_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[10]&!i[9]&!i[8]
    &i[7]);

assign edge32_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[11]&!i[10]
    &!i[9]&i[8]);

assign array08_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[11]&i[9]&!i[8]&!i[7]
    &!i[6]&!i[5]);

assign array16_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[11]&!i[10]&i[9]
    &!i[8]&i[6]);

assign call_d = (!i[31]&i[30]);

assign branch_d = (!i[31]&i[23]) | (!i[31]&i[22]) | (!i[31]&i[30]);

assign mov_cond_d = (i[31]&i[24]&i[22]&i[21]&i[20]&i[19]) | (i[31]&i[24]&!i[23]
    &i[22]&i[21]&!i[20]&!i[19]);

assign bmask_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[10]&i[9]&i[8]&i[5]);

assign alignaddress_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[10]&i[9]&i[8]
    &!i[6]&!i[5]);

assign alignaddress_little_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[10]
    &i[9]&i[8]&i[6]);

assign mux_mdp_sel0_d = (i[31]&!i[30]&!i[24]&i[22]&!i[21]&i[20]&i[19]);

assign mux_mdp_sel1_d = (i[31]&!i[30]&!i[24]&i[22]&!i[21]&i[20]&!i[19]);

assign mux_mdp_sel2_d = (i[31]&!i[30]&!i[24]&i[22]&i[21]&i[20]);

assign mux_mdp_sel3_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&!i[19]);

assign mux_mdp_sel4_d = (i[31]&!i[30]&!i[24]&i[22]&i[20]&i[19]);

assign mux_mdp_sel5_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&!i[19]) | (
    i[31]&!i[30]&!i[24]&i[22]&i[20]&!i[19]);

assign tcc_d = (!i[30]&i[24]&i[23]&i[22]&!i[21]&i[20]&!i[19]);

assign wrxx_raw_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[20]&i[19]) | (i[31]&!i[30]
    &i[24]&i[23]&!i[22]&!i[21]&!i[19]);

assign address_d = (i[30]&i[22]&!i[19]) | (i[30]&!i[22]&i[19]) | (i[30]&!i[20]
    &!i[19]) | (!i[31]&i[22]) | (!i[31]&i[23]) | (i[24]&i[23]&i[22]&!i[21]
    &!i[20]) | (i[30]&!i[24]) | (!i[31]&i[30]);

assign exu_op_d = (i[31]&!i[30]&!i[22]&i[21]&i[20]&!i[12]&!i[11]&!i[10]) | (
    i[31]&i[24]&i[23]&i[22]&!i[21]&!i[20]&!i[19]) | (i[31]&i[24]&i[22]
    &i[21]&i[20]&i[19]) | (i[31]&!i[23]&i[22]&i[21]&!i[20]&!i[19]) | (
    !i[30]&!i[23]&!i[22]&i[19]) | (i[31]&!i[30]&!i[24]&!i[20]&!i[19]) | (
    !i[30]&!i[23]&!i[22]&i[20]) | (i[31]&!i[30]&!i[24]&!i[22]) | (!i[30]
    &!i[23]&!i[22]&!i[21]) | (!i[31]&!i[30]&!i[23]&!i[22]);

assign rs1_late_sel4_d = (i[24]&i[23]&i[22]&!i[21]&!i[20]&!i[19]) | (!i[31]
    &i[30]);

assign rs2_imm_sel0_d = (!i[31]&!i[30]&i[23]&i[22]);

assign rs2_imm_sel1_d = (!i[31]&!i[30]&i[23]&!i[22]);

assign rs2_imm_sel2_d = (!i[31]&!i[30]&!i[23]&i[22]);

assign rs2_imm_sel3_d = (!i[31]&i[30]);

assign rs2_imm_sel4_d = (!i[31]&!i[30]&!i[23]&!i[22]);

assign rs2_imm_sel5_d = (i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]);

assign rs2_imm_sel6_d = (i[31]&i[24]&i[22]&i[21]&i[20]&i[19]);

assign rs2_imm_sel7_d = (i[31]&!i[23]&i[22]&i[21]&i[20]&!i[19]&i[13]) | (i[31]
    &!i[30]&i[23]&!i[21]&!i[19]&i[13]) | (i[31]&i[22]&i[21]&!i[20]&i[19]
    &i[13]) | (!i[30]&i[24]&i[23]&i[22]&!i[20]&i[13]) | (i[31]&!i[22]
    &i[20]&i[19]&i[13]) | (i[31]&i[30]&!i[22]&!i[20]&i[13]) | (i[31]
    &!i[30]&!i[23]&!i[22]&i[13]) | (i[31]&!i[24]&i[13]);

assign rs2_imm_data_d = (i[23]&i[22]&!i[21]&!i[19]&i[13]) | (!i[23]&!i[22]&i[19]
    &i[13]) | (!i[30]&i[23]&i[22]&!i[20]&i[13]) | (!i[30]&!i[22]&i[20]
    &i[13]) | (!i[22]&!i[20]&!i[19]&i[13]) | (!i[30]&!i[23]&i[21]&i[13]) | (
    i[30]&i[19]&i[13]) | (!i[31]) | (!i[24]&i[13]);

assign rm_late_sel0_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&!i[21]&i[19]) | (
    i[31]&!i[30]&!i[24]&i[21]&!i[20]&!i[19]);

assign rm_late_sel1_d = (i[31]&i[30]&!i[20]&i[19]) | (i[31]&i[30]&i[19]&i[13]) | (
    !i[30]&i[24]&i[23]&i[22]&!i[21]&i[20]&!i[19]) | (i[31]&i[30]&i[19]
    &!i[12]) | (!i[30]&!i[24]&!i[21]&!i[20]&!i[19]) | (!i[30]&i[23]&i[22]
    &!i[21]&!i[20]&i[19]) | (i[31]&i[30]&i[19]&!i[11]) | (i[31]&i[30]
    &i[19]&i[10]) | (i[31]&i[30]&i[19]&i[9]) | (!i[30]&i[24]&i[23]&!i[22]
    &i[21]&!i[10]&i[9]&i[8]) | (i[31]&i[30]&!i[23]&i[19]) | (!i[31]&!i[30]
    &i[22]) | (!i[31]&!i[30]&i[23]) | (i[31]&i[30]&!i[24]) | (i[31]&!i[30]
    &i[24]&!i[23]&!i[22]&!i[21]&!i[19]) | (i[31]&i[30]&!i[22]&!i[20]) | (
    i[31]&i[30]&!i[21]&i[19]);

assign rm_late_sel2_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[20]) | (i[31]
    &!i[30]&i[24]&!i[23]&!i[22]&i[21]&i[19]);

assign rm_early_sel0_d = (i[31]&i[24]&i[23]&i[21]&i[20]&i[19]&!i[13]&i[12]&i[11]
    &!i[10]&!i[9]) | (i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&!i[30]
    &!i[24]&!i[22]&i[19]) | (i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]) | (
    i[31]&i[24]&i[22]&i[21]&i[20]&i[19]) | (i[31]&!i[30]&!i[24]&!i[22]
    &i[20]) | (!i[31]&!i[30]&!i[23]&!i[22]);

assign rm_early_sel1_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&!i[11]&!i[10]
    &i[9]&!i[8]);

assign rm_early_sel2_d = (i[31]&!i[30]&i[24]&!i[23]&!i[22]&i[21]&!i[20]&!i[19]);

assign rm_early_sel4_d = (i[31]&!i[30]&i[24]&i[23]&!i[22]&i[21]&i[20]&!i[12]
    &!i[11]&!i[10]&!i[9]);

assign misalign_d = (!i[30]&i[24]&i[23]&i[22]&!i[21]&!i[20]);

assign ls_special_sel_d = (i[31]&i[24]&i[23]&i[21]&i[20]&i[19]&!i[13]&i[12]
    &i[11]&!i[10]&!i[9]) | (i[31]&i[30]&i[24]&i[22]&!i[19]);

assign cmov_d = (i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[5]) | (
    i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[6]) | (i[31]
    &i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]) | (i[31]&i[24]&i[22]&i[21]
    &i[20]&i[19]);

assign regop_d = (i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&i[7]&!i[5]) | (
    i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&i[7]&!i[6]) | (
    !i[31]&!i[30]&i[23]&i[22]) | (i[31]&i[24]&i[22]&i[21]&i[20]&i[19]);

assign specbr_d = (!i[31]&!i[30]&i[23]) | (!i[31]&!i[30]&i[22]);

assign callclass_d = (i[24]&i[23]&i[22]&!i[21]&!i[20]) | (!i[31]&i[30]);

assign movcc_d = (i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[7]&!i[5]) | (
    i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[7]&!i[6]) | (
    i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]);

assign movr_d = (i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&i[7]&!i[5]) | (
    i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&i[7]&!i[6]) | (
    i[31]&i[24]&i[22]&i[21]&i[20]&i[19]);

assign br_or_tcc_d = (!i[30]&i[24]&i[23]&i[22]&!i[21]&i[20]&!i[19]) | (!i[31]
    &!i[30]&i[23]) | (!i[31]&!i[30]&i[22]);

assign bcc_d = (!i[31]&!i[30]&i[23]&!i[22]);

assign bpcc_d = (!i[31]&!i[30]&!i[23]&i[22]);

assign fmov_d = (i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[7]&!i[5]) | (
    i[31]&i[24]&i[23]&!i[22]&i[21]&!i[20]&i[19]&!i[9]&!i[7]&!i[6]) | (
    !i[30]&i[24]&i[23]&i[22]&!i[21]&i[20]&!i[19]);

assign imov_d = (i[31]&i[24]&!i[23]&i[22]&i[21]&!i[20]&!i[19]);

assign fp_d = (!i[31]&!i[30]&i[24]&i[23]) | (!i[31]&!i[30]&i[24]&i[22]);

assign two_cycle_d = (i[31]&i[30]&i[24]&i[22]&!i[19]) | (i[31]&i[30]&!i[24]
    &!i[22]&i[21]&i[20]&i[19]);

// end autogeneration



// *** Embed DECODE.OUT above here ***

assign ect_logic_sel_d[3:0]	= {logic_sel3_d,logic_sel2_d,logic_sel1_d,logic_sel0_d};
assign ect_shift_sel_d[6:0]	= {shift_sel6_d,shift_sel5_d,shift_sel4_d,shift_sel3_d,shift_sel2_d,shift_sel1_d,shift_sel0_d};


exu_ect_ctl_msff_ctl_macro__width_37	i_estage_lth		 (
 .scan_in(i_estage_lth_scanin),
 .scan_out(i_estage_lth_scanout),
 .l1clk( l1clk_pm2			 			),
 .din  ({address_d						,
	 branch_d						,
	 ls_special_sel_d					,
	 two_cycle_d						,
         (~mux_mdp_sel5_d & ~mux_mdp_sel4_d),mux_mdp_sel4_d,mux_mdp_sel3_d,mux_mdp_sel2_d,mux_mdp_sel1_d,mux_mdp_sel0_d,
         rm_early_sel4_d,rs1_late_sel4_d,rm_early_sel2_d,rm_early_sel1_d,rm_early_sel0_d,
         rm_late_sel2_d,rm_late_sel1_d,rm_late_sel0_d,
         as_cin_d						,
         as_subtract_d						,
         as_cc_d,lg_cc_d 					,
	 misalign_d						,
         mov_cond_d						,
         tas_cc_d,tas_tv_d					,
         tcc_d							,
         wrxx_d							,
         bmask_d,alignaddress_d,alignaddress_little_d		,
         array16_d,array08_d					,
         edge08_d,edge16_d,edge32_d ,edgele_d			}),
 .dout ({address_e						,
	 branch_e						,
	 ls_special_sel_e					,
	 two_cycle_e						,
         exu_mdp_mux_sel_e[5:0]					,
         ect_rm_early_sel_e[5],rm_early_sel34,ect_rm_early_sel_e[2:0],
         ect_rm_late_sel_e[2:0] 				,
         ect_as_cin_e						,
         as_subtract_e						,
         as_cc_e,lg_cc_e 					,
	 misalign_e						,
         mov_cond_e						,
         tas_cc_e,tas_tv_e					,
         tcc_e							,
         ect_store_mux_sel_e					,
         bmask_e,alignaddress_e,ect_alignaddress_little_e	,
         ect_array_sel_e[1:0]					,
         edge08_e,edge16_e,edge32_e ,edgele_e			}),
  .siclk(siclk),
  .soclk(soclk));


	assign ect_rm_early_sel_e[3]	= rm_early_sel34 & ~ect_pstate_am_e;
	assign ect_rm_early_sel_e[4]	= rm_early_sel34 &  ect_pstate_am_e;

	assign ect_as_clip_e_	= ~(alignaddress_e | ect_alignaddress_little_e);


	assign gsr_vld_e_in[1]	= dec_valid_e & (alignaddress_e | ect_alignaddress_little_e);
	assign gsr_vld_e_in[0]	= dec_valid_e & bmask_e;

	assign address_e_in	= address_e   & dec_valid_e;

	assign br_special_sel_e	= branch_e    & exu_rs1_data_e[47];

	assign two_cycle_e_in	= dec_valid_e & two_cycle_e;

exu_ect_ctl_msff_ctl_macro__width_6	i_mstage_lth		 (
 .scan_in(i_mstage_lth_scanin),
 .scan_out(i_mstage_lth_scanout),
 .l1clk( l1clk_pm2											),
 .din  ({gsr_vld_e_in[1:0]  , address_e_in , ls_special_sel_e , br_special_sel_e , two_cycle_e_in} 	),
 .dout ({exu_gsr_vld_m[1:0] , address_m    , ls_special_sel_m , br_special_sel_m , ect_two_cycle_m}	),
  .siclk(siclk),
  .soclk(soclk));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Decode       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!





//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Bypass       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


	assign fgu_valid_b	=  fgu_exu_w_vld_fx5  &                                       ~(fgu_irf_w_addr_fx5[4:0] == 5'b00000);
	assign lsu_valid_w2	=  lsu_exu_ld_w       & (dec_thread_group == tid_lth_w2[2]) & ~(ect_rd_lth_w2[4:0]      == 5'b00000);
	assign ect_valid_in_w2	=  lsu_exu_ld_vld_w   & (dec_thread_group == tid_lth_w2[2]) & ~(ect_rd_lth_w2[4:0]      == 5'b00000) & ~ect_mbist_sel;


// *** Valids ***


	assign     valid_in_d	= (exu_op_d & ~(dec_inst_d[29:25] == 5'b00000)) | call_d;	// see SPARC v9, page 30.
	assign     valid_in_e	=  valid_out_e;
	assign     valid_in_m	=  valid_lth_m  & ~dec_flush_m & ~exu_ecc_m       & ~address_error_m;
	assign     valid_in_b	= (valid_lth_b  & ~dec_flush_b & ~tlu_flush_exu_b & ~tof_b & ~misalign_b & ~ect_mbist_sel) |
				  (fgu_valid_b  &                                                          ~ect_mbist_sel) |
				   mbi_irf_write_en_p1;



// *** Tid ***

	assign ect_tid_in_b[1:0]= ({2{~ect_mbist_sel &  fgu_exu_w_vld_fx5}} & fgu_result_tid_fx5[1:0]) |
				  ({2{~ect_mbist_sel & ~fgu_exu_w_vld_fx5}} & tid_lth_b[1:0]         ) |
				  ({2{ ect_mbist_sel                     }} & mbi_addr_p1[6:5]       );

// *** RD ***
	assign rd_in_d[4:0]	= ({5{~two_cycle_e_in}} & dec_inst_rd_d[4:0]) |
				  ({5{ two_cycle_e_in}} & inst_rs3_d[4:0]   );

	assign rd_in_m[4:0]	= rd_lth_m[4:0];

	assign ect_rd_in_b[4:0]	= ({5{~ect_mbist_sel &  fgu_valid_b}} & fgu_irf_w_addr_fx5[4:0]) |
				  ({5{~ect_mbist_sel & ~fgu_valid_b}} & rd_lth_b[4:0]          ) |
				  ({5{ ect_mbist_sel               }} & mbi_addr_p1[4:0]       );


	assign rs1_valid_d	=  (ect_rs1_late_sel_d[3:1] == 3'b000 ) &  rs1_rd_en_d & ~two_cycle_e_in;
	assign rs2_valid_d	=  (ect_rs2_late_sel_d[3:0] == 4'b0000) &  rs2_rd_en_d & ~two_cycle_e_in;
	assign rs3_valid_d	=  (ect_rs3_late_sel_d[3:1] == 3'b000 ) &  rs3_rd_en_d;

exu_ect_ctl_msff_ctl_macro__width_6 ren_lth		 (
 .scan_in(ren_lth_scanin),
 .scan_out(ren_lth_scanout),
 .l1clk( l1clk_pm1						       ),
 .din  ({dec_inst_rs1_vld_p , dec_inst_rs2_vld_p , dec_inst_rs3_vld_p ,
	     rs1_valid_d    ,     rs2_valid_d    ,     rs3_valid_d    }),
 .dout ({rs1_rd_en_d        , rs2_rd_en_d        , rs3_rd_en_d        ,
	 ect_rs1_valid_e    , ect_rs2_valid_e    , ect_rs3_valid_e    }),
  .siclk(siclk),
  .soclk(soclk));




exu_ect_ctl_msff_ctl_macro__width_15	rs_lth			 (
 .scan_in(rs_lth_scanin),
 .scan_out(rs_lth_scanout),
 .l1clk( l1clk_pm1								),
 .din  ({dec_inst_rs1_p[4:0] , dec_inst_rs2_p[4:0] , dec_inst_rs3_p[4:0]}	),
 .dout ({    inst_rs1_d[4:0] ,     inst_rs2_d[4:0] ,     inst_rs3_d[4:0]}	),
  .siclk(siclk),
  .soclk(soclk));


exu_ect_ctl_msff_ctl_macro__width_76	i_byp_lth		 (
 .scan_in(i_byp_lth_scanin),
 .scan_out(i_byp_lth_scanout),
 .l1clk( l1clk_pm1									),
 .din  ({                	  dec_tid_p[1:0]		,
              valid_in_d	,     tid_lth_d[1:0]		,     rd_in_d[4:0]	, inst_rs1_d[4:0]	, inst_rs2_d[4:0]     ,
              valid_in_e	, ect_tid_lth_e[1:0]		,     rd_lth_e[4:0]	, movcc_true_e		,
              valid_in_m	,     tid_lth_m[1:0]		,     rd_in_m[4:0]	,
              valid_in_b	, ect_tid_in_b[1:0]		, ect_rd_in_b[4:0]	,
          ect_valid_lth_w	, ect_tid_lth_w[1:0]		, ect_rd_lth_w[4:0]	,
                                  lsu_exu_tid_m[1:0]		, lsu_exu_rd_m[4:0]	, 
                                  lsu_exu_tid_b[1:0]		, lsu_exu_rd_b[4:0]	, lsu_exu_ld_b		,
          ect_valid_in_w2	, ect_tid_lth_w2[1:0]		, ect_rd_lth_w2[4:0]	}),
 .dout ({                     	      tid_lth_d[1:0]		,
              valid_lth_e	, ect_tid_lth_e[1:0]		,     rd_lth_e[4:0]	, ect_rs1_addr_e[4:0]	, ect_rs2_addr_e[4:0] ,
              valid_lth_m	,     tid_lth_m[1:0]		,     rd_lth_m[4:0]	, exu_cmov_true_m	,
              valid_lth_b	,     tid_lth_b[1:0]		,     rd_lth_b[4:0]	,
          ect_valid_lth_w	, ect_tid_lth_w[1:0]		, ect_rd_lth_w[4:0]	,
              valid_lth_w_plus1	,     tid_lth_w_plus1[1:0]	,     rd_lth_w_plus1[4:0],
                                  lsu_exu_tid_b[1:0]		, lsu_exu_rd_b[4:0]	, 
                                  ect_tid_lth_w2[1:0]		, ect_rd_lth_w2[4:0]	, lsu_exu_ld_w		,
              valid_lth_w2_plus1,     tid_lth_w2_plus1[1:0]	,     rd_lth_w2_plus1[4:0]}),
  .siclk(siclk),
  .soclk(soclk));


	assign ect_rs3_addr_e[4:0] = rd_lth_e[4:0];


// M, B, W, and W2 priority built into the PGPE mux in the datapath

	//                                   ZN         RS1 zero            RS1 negative
	assign movcc_true_e	= (dec_cmov_z00_e & ~edp_br_flag_e[0] & ~edp_br_flag_e[1]) |
				  (dec_cmov_z01_e & ~edp_br_flag_e[0] &  edp_br_flag_e[1]) |
				  (dec_cmov_z10_e &  edp_br_flag_e[0] & ~edp_br_flag_e[1]);

	assign valid_out_e	=      valid_lth_e & dec_valid_e & ~(mov_cond_e & ~movcc_true_e) & ~tas_tv_overflow_e & ~misalign_error_e;
	assign raw_valid_out_e	=      valid_lth_e & dec_valid_e & ~(mov_cond_e & ~movcc_true_e);

	assign rs1_e_cmp	=  raw_valid_out_e        & (ect_tid_lth_e[1:0]        == tid_lth_d[1:0]) & (rd_lth_e[4:0]        == inst_rs1_d[4:0]);
	assign rs1_m_cmp	=      valid_lth_m        & (    tid_lth_m[1:0]        == tid_lth_d[1:0]) & (rd_lth_m[4:0]        == inst_rs1_d[4:0]);
	assign rs1_b_cmp	=      valid_lth_b        & (    tid_lth_b[1:0]        == tid_lth_d[1:0]) & (rd_lth_b[4:0]        == inst_rs1_d[4:0]);
	assign rs1_w_cmp	=  ect_valid_lth_w        & (ect_tid_lth_w[1:0]        == tid_lth_d[1:0]) & (ect_rd_lth_w[4:0]    == inst_rs1_d[4:0]);
	assign rs1_w2_cmp	=  lsu_valid_w2           & (ect_tid_lth_w2[1:0]       == tid_lth_d[1:0]) & (ect_rd_lth_w2[4:0]   == inst_rs1_d[4:0]);
	assign rs1_w_plus1_cmp	=      valid_lth_w_plus1  & (    tid_lth_w_plus1[1:0]  == tid_lth_d[1:0]) & (rd_lth_w_plus1[4:0]  == inst_rs1_d[4:0]);
	assign rs1_w2_plus1_cmp	=      valid_lth_w2_plus1 & (    tid_lth_w2_plus1[1:0] == tid_lth_d[1:0]) & (rd_lth_w2_plus1[4:0] == inst_rs1_d[4:0]);
				   	      	       					 
	assign rs2_e_cmp	=  raw_valid_out_e        & (ect_tid_lth_e[1:0]        == tid_lth_d[1:0]) & (rd_lth_e[4:0]        == inst_rs2_d[4:0]);
	assign rs2_m_cmp	=      valid_lth_m        & (    tid_lth_m[1:0]        == tid_lth_d[1:0]) & (rd_lth_m[4:0]        == inst_rs2_d[4:0]);
	assign rs2_b_cmp	=      valid_lth_b        & (    tid_lth_b[1:0]        == tid_lth_d[1:0]) & (rd_lth_b[4:0]        == inst_rs2_d[4:0]);
	assign rs2_w_cmp	=  ect_valid_lth_w        & (ect_tid_lth_w[1:0]        == tid_lth_d[1:0]) & (ect_rd_lth_w[4:0]    == inst_rs2_d[4:0]);
	assign rs2_w2_cmp	=  lsu_valid_w2           & (ect_tid_lth_w2[1:0]       == tid_lth_d[1:0]) & (ect_rd_lth_w2[4:0]   == inst_rs2_d[4:0]);
	assign rs2_w_plus1_cmp	=      valid_lth_w_plus1  & (    tid_lth_w_plus1[1:0]  == tid_lth_d[1:0]) & (rd_lth_w_plus1[4:0]  == inst_rs2_d[4:0]);
	assign rs2_w2_plus1_cmp	=      valid_lth_w2_plus1 & (    tid_lth_w2_plus1[1:0] == tid_lth_d[1:0]) & (rd_lth_w2_plus1[4:0] == inst_rs2_d[4:0]);
				   	      	       					 
	assign rs3_e_cmp	=  raw_valid_out_e        & (ect_tid_lth_e[1:0]        == tid_lth_d[1:0]) & (rd_lth_e[4:0]        == inst_rs3_d[4:0]);
	assign rs3_m_cmp	=      valid_lth_m        & (    tid_lth_m[1:0]        == tid_lth_d[1:0]) & (rd_lth_m[4:0]        == inst_rs3_d[4:0]);
	assign rs3_b_cmp	=      valid_lth_b        & (    tid_lth_b[1:0]        == tid_lth_d[1:0]) & (rd_lth_b[4:0]        == inst_rs3_d[4:0]);
	assign rs3_w_cmp	=  ect_valid_lth_w        & (ect_tid_lth_w[1:0]        == tid_lth_d[1:0]) & (ect_rd_lth_w[4:0]    == inst_rs3_d[4:0]);
	assign rs3_w2_cmp	=  lsu_valid_w2           & (ect_tid_lth_w2[1:0]       == tid_lth_d[1:0]) & (ect_rd_lth_w2[4:0]   == inst_rs3_d[4:0]);
	assign rs3_w_plus1_cmp	=      valid_lth_w_plus1  & (    tid_lth_w_plus1[1:0]  == tid_lth_d[1:0]) & (rd_lth_w_plus1[4:0]  == inst_rs3_d[4:0]);
	assign rs3_w2_plus1_cmp	=      valid_lth_w2_plus1 & (    tid_lth_w2_plus1[1:0] == tid_lth_d[1:0]) & (rd_lth_w2_plus1[4:0] == inst_rs3_d[4:0]);
				   
			
	assign rs1_l_cmp	=   lsu_exu_ld_b                                             &
				   (lsu_exu_tid_b[2:0] == {dec_thread_group,tid_lth_d[1:0]}) &
				   (lsu_exu_rd_b[4:0]  == inst_rs1_d[4:0]                  ) &
				  ~(lsu_exu_rd_b[4:0]  == 5'b00000                         );
						       
	assign rs2_l_cmp	=   lsu_exu_ld_b                                             &
				   (lsu_exu_tid_b[2:0] == {dec_thread_group,tid_lth_d[1:0]}) &
				   (lsu_exu_rd_b[4:0]  == inst_rs2_d[4:0]                  ) &
				  ~(lsu_exu_rd_b[4:0]  == 5'b00000                         );
						       
	assign rs3_l_cmp	=   lsu_exu_ld_b                                             &
				   (lsu_exu_tid_b[2:0] == {dec_thread_group,tid_lth_d[1:0]}) &
				   (lsu_exu_rd_b[4:0]  == inst_rs3_d[4:0]                  ) &
				  ~(lsu_exu_rd_b[4:0]  == 5'b00000                         );

	assign rs1_byp_early	= rs1_m_cmp | rs1_b_cmp | rs1_w_cmp | rs1_w2_cmp | rs1_w_plus1_cmp | rs1_w2_plus1_cmp;
	assign rs2_byp_early	= rs2_m_cmp | rs2_b_cmp | rs2_w_cmp | rs2_w2_cmp | rs2_w_plus1_cmp | rs2_w2_plus1_cmp;
	assign rs3_byp_early	= rs3_m_cmp | rs3_b_cmp | rs3_w_cmp | rs3_w2_cmp | rs3_w_plus1_cmp | rs3_w2_plus1_cmp;



//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Bypass       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Flags        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


// *** E Stage Flag generation ***

	assign lg_cc[7]		=   edp_logical_data_e_b63;							// N
	assign lg_cc[6]		=   edp_lg_zdetect_e[1]    &  edp_lg_zdetect_e[0];				// Z : [63:0] == 0
	assign lg_cc[5]		=  1'b0;									// V : always 0
	assign lg_cc[4]		=  1'b0;									// C : always 0

	assign lg_cc[3]		=   edp_logical_data_e_b31;							// N
	assign lg_cc[2]		=                             edp_lg_zdetect_e[0];				// Z : [31:0] == 0
	assign lg_cc[1]		=  1'b0;									// V : always 0
	assign lg_cc[0]		=  1'b0;									// C : always 0


	assign as_cc[7]		= (    ~as_subtract_e &                                                  edp_add_data_e_b63   ) |	// N
				  (     as_subtract_e &                                                  edp_sub_data_e_b63   );
	assign as_cc[6]		= (    ~as_subtract_e &                        ~edp_add_zdetect_e_[1] & ~edp_add_zdetect_e_[0]) |	// Z : [63:0] == 0
				  (     as_subtract_e &                        ~edp_sub_zdetect_e_[1] & ~edp_sub_zdetect_e_[0]);
	assign as_cc[5]		= (    ~as_subtract_e &  ~exu_rs1_data_e[63] & ~exu_rs2_data_e[63]    &  edp_add_data_e_b63   ) |	// V
				  (    ~as_subtract_e &   exu_rs1_data_e[63] &  exu_rs2_data_e[63]    & ~edp_add_data_e_b63   ) |
				  (     as_subtract_e &  ~exu_rs1_data_e[63] &  exu_rs2_data_e[63]    &  edp_sub_data_e_b63   ) |
				  (     as_subtract_e &   exu_rs1_data_e[63] & ~exu_rs2_data_e[63]    & ~edp_sub_data_e_b63   );
	assign as_cc[4]		= (    ~as_subtract_e &                                                  edp_add_cout64_e     ) |	// C
				  (     as_subtract_e &                                                 ~edp_sub_cout64_e     );

	assign as_cc[3]		= (    ~as_subtract_e &                                                  edp_add_data_e_b31   ) |	// N
				  (     as_subtract_e &                                                  edp_sub_data_e_b31   );
	assign as_cc[2]		= (    ~as_subtract_e &                                                 ~edp_add_zdetect_e_[0]) |	// Z : [31:0] == 0
				  (     as_subtract_e &                                                 ~edp_sub_zdetect_e_[0]);
	assign as_cc[1]		= (    ~as_subtract_e &  ~exu_rs1_data_e[31] & ~exu_rs2_data_e[31]    &  edp_add_data_e_b31   ) |	// V
				  (    ~as_subtract_e &   exu_rs1_data_e[31] &  exu_rs2_data_e[31]    & ~edp_add_data_e_b31   ) |
				  (     as_subtract_e &  ~exu_rs1_data_e[31] &  exu_rs2_data_e[31]    &  edp_sub_data_e_b31   ) |
				  (     as_subtract_e &   exu_rs1_data_e[31] & ~exu_rs2_data_e[31]    & ~edp_sub_data_e_b31   ) |
				  (     tas_cc_e      & ( exu_rs1_data_e[0] |  exu_rs2_data_e[0])                           ) |
				  (     tas_cc_e      & ( exu_rs1_data_e[1] |  exu_rs2_data_e[1])                           );
        assign as_cc[0]		= (    ~as_subtract_e & ( exu_rs1_data_e[31] &  exu_rs2_data_e[31])                           ) |	// C
				  (    ~as_subtract_e & ( exu_rs1_data_e[31] |  exu_rs2_data_e[31])   & ~edp_add_data_e_b31   ) |
				  (     as_subtract_e & (~exu_rs1_data_e[31] &  exu_rs2_data_e[31])                          ) |
				  (     as_subtract_e & (~exu_rs1_data_e[31] |  exu_rs2_data_e[31])   &  edp_sub_data_e_b31   );


	assign ccr_data_e[7:0]	= ({8{as_cc_e  }} & as_cc[7:0]  ) |
				  ({8{lg_cc_e  }} & lg_cc[7:0]  );


	assign ccr_data_b[7:0]	= ({8{~fgu_ccr_valid_b}} & ccr_data_lth_b[7:0]                              ) |
				  ({8{ fgu_ccr_valid_b}} & {fgu_exu_xcc_fx5[1:0],2'b00,fgu_exu_icc_fx5[3:0]});

	assign fgu_ccr_valid_b	=  fgu_exu_cc_vld_fx5  & fgu_exu_w_vld_fx5;

	assign ccr_valid_in_d	= (as_cc_d | lg_cc_d);
	assign ccr_valid_in_e	=  ccr_valid_out_e;
	assign ccr_valid_in_m	=  ccr_valid_lth_m & ~dec_flush_m & ~exu_ecc_m       & ~address_error_m;
	assign ccr_valid_in_b	= (ccr_valid_lth_b & ~dec_flush_b & ~tlu_flush_exu_b & ~tof_b & ~misalign_b) | fgu_ccr_valid_b;



	assign wr_ccr_w_tid0		=  ccr_valid_lth_w    & (ect_tid_lth_w[1:0]   == 2'b00);
	assign wr_ccr_w_tid1		=  ccr_valid_lth_w    & (ect_tid_lth_w[1:0]   == 2'b01);
	assign wr_ccr_w_tid2		=  ccr_valid_lth_w    & (ect_tid_lth_w[1:0]   == 2'b10);
	assign wr_ccr_w_tid3		=  ccr_valid_lth_w    & (ect_tid_lth_w[1:0]   == 2'b11);

	assign wr_ccr_tlu0		=  tlu_ccr_cwp_valid  & (tlu_ccr_cwp_tid[1:0] == 2'b00);
	assign wr_ccr_tlu1		=  tlu_ccr_cwp_valid  & (tlu_ccr_cwp_tid[1:0] == 2'b01);
	assign wr_ccr_tlu2		=  tlu_ccr_cwp_valid  & (tlu_ccr_cwp_tid[1:0] == 2'b10);
	assign wr_ccr_tlu3		=  tlu_ccr_cwp_valid  & (tlu_ccr_cwp_tid[1:0] == 2'b11);

	assign wr_ccr_asi0		=  rml_rng_wt_ccr_ctl & (rng_tid[1:0]         == 2'b00);
	assign wr_ccr_asi1		=  rml_rng_wt_ccr_ctl & (rng_tid[1:0]         == 2'b01);
	assign wr_ccr_asi2		=  rml_rng_wt_ccr_ctl & (rng_tid[1:0]         == 2'b10);
	assign wr_ccr_asi3		=  rml_rng_wt_ccr_ctl & (rng_tid[1:0]         == 2'b11);


	assign arch_ccr_tid0_in[7:0]	= ({8{ wr_ccr_w_tid0                              }} & ccr_data_lth_w[7:0]   ) |
					  ({8{                  wr_ccr_tlu0               }} & tlu_ccr[7:0]          ) |
					  ({8{                                 wr_ccr_asi0}} & edp_rng_in_ff[7:0]    ) |
					  ({8{~wr_ccr_w_tid0 & ~wr_ccr_tlu0 & ~wr_ccr_asi0}} & arch_ccr_tid0_lth[7:0]);


	assign arch_ccr_tid1_in[7:0]	= ({8{ wr_ccr_w_tid1                              }} & ccr_data_lth_w[7:0]   ) |
					  ({8{                  wr_ccr_tlu1               }} & tlu_ccr[7:0]          ) |
					  ({8{                                 wr_ccr_asi1}} & edp_rng_in_ff[7:0]    ) |
					  ({8{~wr_ccr_w_tid1 & ~wr_ccr_tlu1 & ~wr_ccr_asi1}} & arch_ccr_tid1_lth[7:0]);


	assign arch_ccr_tid2_in[7:0]	= ({8{ wr_ccr_w_tid2                              }} & ccr_data_lth_w[7:0]   ) |
					  ({8{                  wr_ccr_tlu2               }} & tlu_ccr[7:0]          ) |
					  ({8{                                 wr_ccr_asi2}} & edp_rng_in_ff[7:0]    ) |
					  ({8{~wr_ccr_w_tid2 & ~wr_ccr_tlu2 & ~wr_ccr_asi2}} & arch_ccr_tid2_lth[7:0]);


	assign arch_ccr_tid3_in[7:0]	= ({8{ wr_ccr_w_tid3                              }} & ccr_data_lth_w[7:0]   ) |
					  ({8{                  wr_ccr_tlu3               }} & tlu_ccr[7:0]          ) |
					  ({8{                                 wr_ccr_asi3}} & edp_rng_in_ff[7:0]    ) |
					  ({8{~wr_ccr_w_tid3 & ~wr_ccr_tlu3 & ~wr_ccr_asi3}} & arch_ccr_tid3_lth[7:0]);


exu_ect_ctl_msff_ctl_macro__width_28	i_ccr_pipe_lth		 (
 .scan_in(i_ccr_pipe_lth_scanin),
 .scan_out(i_ccr_pipe_lth_scanout),
 .l1clk( l1clk_pm1					),
 .din  ({ ccr_valid_in_d   ,
          ccr_valid_in_e   ,     ccr_data_e[7:0]	,
          ccr_valid_in_m   ,     ccr_data_lth_m[7:0]	,
          ccr_valid_in_b   ,     ccr_data_b[7:0]	}),
 .dout ({ ccr_valid_lth_e  ,
          ccr_valid_lth_m  ,     ccr_data_lth_m[7:0]	,
          ccr_valid_lth_b  ,     ccr_data_lth_b[7:0]	,
          ccr_valid_lth_w  ,     ccr_data_lth_w[7:0]	}),
  .siclk(siclk),
  .soclk(soclk));


exu_ect_ctl_msff_ctl_macro__width_32	i_ccr_arch_lth		 (		// FS:wmr_protect
 .scan_in(i_ccr_arch_lth_wmr_scanin),
 .scan_out(i_ccr_arch_lth_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk( l1clk_pm1											 ),
 .din  ({arch_ccr_tid0_in[7:0] , arch_ccr_tid1_in[7:0] , arch_ccr_tid2_in[7:0] , arch_ccr_tid3_in[7:0]	}),
 .dout ({arch_ccr_tid0_lth[7:0], arch_ccr_tid1_lth[7:0], arch_ccr_tid2_lth[7:0], arch_ccr_tid3_lth[7:0]	}),
  .soclk(soclk));


	assign ccr_valid_out_e		= ccr_valid_lth_e & dec_valid_e & ~tas_tv_overflow_e;

	assign ccr_e_cmp		= ccr_valid_lth_e & (tid_lth_d[1:0] == ect_tid_lth_e[1:0]);
	assign ccr_m_cmp		= ccr_valid_lth_m & (tid_lth_d[1:0] ==     tid_lth_m[1:0]);
	assign ccr_b_cmp		= ccr_valid_lth_b & (tid_lth_d[1:0] ==     tid_lth_b[1:0]);
	assign ccr_w_cmp		= ccr_valid_lth_w & (tid_lth_d[1:0] == ect_tid_lth_w[1:0]);

	assign ccr_sel_e		=  ccr_e_cmp;
	assign ccr_sel_m		=               ccr_m_cmp;
	assign ccr_sel_b		=              ~ccr_m_cmp &  ccr_b_cmp;
	assign ccr_sel_w		=              ~ccr_m_cmp & ~ccr_b_cmp &  ccr_w_cmp;
	assign ccr_sel_a0		=              ~ccr_m_cmp & ~ccr_b_cmp & ~ccr_w_cmp & (tid_lth_d[1:0] == 2'b00);
	assign ccr_sel_a1		=              ~ccr_m_cmp & ~ccr_b_cmp & ~ccr_w_cmp & (tid_lth_d[1:0] == 2'b01);
	assign ccr_sel_a2		=              ~ccr_m_cmp & ~ccr_b_cmp & ~ccr_w_cmp & (tid_lth_d[1:0] == 2'b10);
	assign ccr_sel_a3		=              ~ccr_m_cmp & ~ccr_b_cmp & ~ccr_w_cmp & (tid_lth_d[1:0] == 2'b11);

	assign exu_ccr_byp_data0[7:0]	= ({8{             ccr_sel_m }} & ccr_data_lth_m[7:0]   ) |
					  ({8{             ccr_sel_b }} & ccr_data_lth_b[7:0]   ) |
					  ({8{             ccr_sel_w }} & ccr_data_lth_w[7:0]   ) |
					  ({8{             ccr_sel_a0}} & arch_ccr_tid0_lth[7:0]) |
					  ({8{             ccr_sel_a1}} & arch_ccr_tid1_lth[7:0]) |
					  ({8{             ccr_sel_a2}} & arch_ccr_tid2_lth[7:0]) |
					  ({8{             ccr_sel_a3}} & arch_ccr_tid3_lth[7:0]);

	assign exu_ccr_byp_data1[7:0]	= ({8{ ccr_sel_e             }} & ccr_data_e[7:0]       ) |
					  ({8{~ccr_sel_e & ccr_sel_m }} & ccr_data_lth_m[7:0]   ) |
					  ({8{~ccr_sel_e & ccr_sel_b }} & ccr_data_lth_b[7:0]   ) |
					  ({8{~ccr_sel_e & ccr_sel_w }} & ccr_data_lth_w[7:0]   ) |
					  ({8{~ccr_sel_e & ccr_sel_a0}} & arch_ccr_tid0_lth[7:0]) |
					  ({8{~ccr_sel_e & ccr_sel_a1}} & arch_ccr_tid1_lth[7:0]) |
					  ({8{~ccr_sel_e & ccr_sel_a2}} & arch_ccr_tid2_lth[7:0]) |
					  ({8{~ccr_sel_e & ccr_sel_a3}} & arch_ccr_tid3_lth[7:0]);

	assign     ccr_byp_data_b0	= (  {~dec_valid_e}  & exu_ccr_byp_data0[0]) |
					  (  { dec_valid_e}  & exu_ccr_byp_data1[0]);

	assign     ccr_byp_data_b1	= (  {~dec_valid_e}  & exu_ccr_byp_data0[1]) |
					  (  { dec_valid_e}  & exu_ccr_byp_data1[1]);

	assign     ccr_byp_data_b3	= (  {~dec_valid_e}  & exu_ccr_byp_data0[3]) |
					  (  { dec_valid_e}  & exu_ccr_byp_data1[3]);



	assign exu_ccr0[7:0] =  arch_ccr_tid0_lth[7:0];
	assign exu_ccr1[7:0] =	arch_ccr_tid1_lth[7:0];
	assign exu_ccr2[7:0] =	arch_ccr_tid2_lth[7:0];
	assign exu_ccr3[7:0] =	arch_ccr_tid3_lth[7:0];

	assign ect_rng_ccr_data[7:0]	= ({8{rng_tid[1:0] == 2'b00}} & arch_ccr_tid0_lth[7:0]) |
					  ({8{rng_tid[1:0] == 2'b01}} & arch_ccr_tid1_lth[7:0]) |
					  ({8{rng_tid[1:0] == 2'b10}} & arch_ccr_tid2_lth[7:0]) |
					  ({8{rng_tid[1:0] == 2'b11}} & arch_ccr_tid3_lth[7:0]);


	assign trap_taken_e		=  dec_valid_e & tcc_e & tcc_taken_e;

	assign exu_tcc_m		=  trap_taken_m_lth;


// pg. 199 Multiply Step -> CCR.icc.n XOR CCR.icc.v

	assign ms_icc_in		= ccr_byp_data_b3 ^ ccr_byp_data_b1;

	assign tas_tv_overflow_e	= (dec_valid_e & tas_tv_e & as_cc[1]);		// Tagged Add TV with overflow
	assign tas_tv_overflow_m_in	=  tas_tv_overflow_m_lth & ~dec_flush_m;
	assign exu_tof_m		=  tas_tv_overflow_m_lth;


	assign normal_va_hole_m_	=   edp_address_m[63:48] == {16{edp_address_m[47]}};
	assign special_ls_va_hole_m_	=   edp_rd_ff_m[63:48]   == {16{edp_rd_ff_m[47]}};
	assign special_br_va_hole_m_	= ((edp_address_m[63:48] == 16'h0001) & ~edp_address_m[47]) |
					  ((edp_address_m[63:48] == 16'h0000) &  edp_address_m[47]);

	assign va_hole_m		= ( ls_special_sel_m                     & ~special_ls_va_hole_m_) |
					  (                     br_special_sel_m & ~special_br_va_hole_m_) |
					  (~ls_special_sel_m & ~br_special_sel_m & ~normal_va_hole_m_    );

	assign exu_lsu_va_error_m	= (va_hole_m & address_m & ~pstate_am_m                 );
	assign exu_oor_va_m		= (va_hole_m & address_m                                );
	assign address_error_m		= (va_hole_m & address_m & ~pstate_am_m & ~itlb_bypass_m);


	assign misalign_error_e		=  misalign_e  & dec_valid_e & (edp_add_data_e_b1 | edp_add_data_e_b0);

	assign misalign_error_m_in	=  ect_misaligned_error_m    & ~dec_flush_m;
	assign exu_misalign_m	 	=  ect_misaligned_error_m;

	assign pstate_am_d		= (tlu_pstate_am[0] & (tid_lth_d[1:0] == 2'b00)) |
					  (tlu_pstate_am[1] & (tid_lth_d[1:0] == 2'b01)) |
					  (tlu_pstate_am[2] & (tid_lth_d[1:0] == 2'b10)) |
					  (tlu_pstate_am[3] & (tid_lth_d[1:0] == 2'b11));


exu_ect_ctl_msff_ctl_macro__width_9	i_tlu_lth			 (
 .scan_in(i_tlu_lth_scanin),
 .scan_out(i_tlu_lth_scanout),
 .l1clk( l1clk_pm2		),
 .din  ({trap_taken_e		,
	 ms_icc_in		,
	 tas_tv_overflow_e	,
	 tas_tv_overflow_m_in	,
	 misalign_error_e	,
	 misalign_error_m_in	,
	 pstate_am_d		,
	 ect_pstate_am_e	,
	 tlu_itlb_bypass_e	}),
 .dout ({trap_taken_m_lth	,
	 exu_ms_icc_e		,
	 tas_tv_overflow_m_lth	,
	 tof_b			,
	 ect_misaligned_error_m	,
	 misalign_b		,
	 ect_pstate_am_e	,
	 pstate_am_m		,
	 itlb_bypass_m		}),
  .siclk(siclk),
  .soclk(soclk));



//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Flags        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Y Register   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

	assign yreg_mwr_valid_em3_in	=  dec_valid_e            & (exu_mdp_mux_sel_e[0] | exu_mdp_mux_sel_e[1]);	// UMUL(cc), SMUL(cc)
	assign yreg_mwr_valid_em2_in	=  yreg_mwr_valid_em2_lth & ~dec_flush_m & ~exu_ecc_m;
	assign yreg_mwr_valid_em1_in	=  yreg_mwr_valid_em1_lth & ~dec_flush_b & ~tlu_flush_exu_b;
	assign yreg_mwr_valid_e_in	=  yreg_mwr_valid_e_lth;
	assign yreg_mwr_valid_m_in	=  yreg_mwr_valid_m_lth;

	assign yreg_swr_valid_e_in	=  dec_valid_e            &  exu_mdp_mux_sel_e[3];				// MULScc
	assign yreg_swr_valid_m_in	=  yreg_swr_valid_m_lth   & ~dec_flush_m & ~exu_ecc_m;

	assign yreg_wr_valid_b_in	=  yreg_mwr_valid_b_lth |
					  (yreg_swr_valid_b_lth   & ~dec_flush_b & ~tlu_flush_exu_b);


exu_ect_ctl_msff_ctl_macro__width_5	i_yreg_mpipe_lth	 (
 .scan_in(i_yreg_mpipe_lth_scanin),
 .scan_out(i_yreg_mpipe_lth_scanout),
 .l1clk( l1clk_pm1														),
 .din  ({yreg_mwr_valid_em3_in  , yreg_mwr_valid_em2_in  , yreg_mwr_valid_em1_in  , yreg_mwr_valid_e_in  , yreg_mwr_valid_m_in }),
 .dout ({yreg_mwr_valid_em2_lth , yreg_mwr_valid_em1_lth , yreg_mwr_valid_e_lth   , yreg_mwr_valid_m_lth , yreg_mwr_valid_b_lth}),
  .siclk(siclk),
  .soclk(soclk));

exu_ect_ctl_msff_ctl_macro__width_5	i_yreg_spipe_lth	 (
 .scan_in(i_yreg_spipe_lth_scanin),
 .scan_out(i_yreg_spipe_lth_scanout),
 .l1clk( l1clk_pm1													),
 .din  ({yreg_swr_valid_e_in  , yreg_swr_valid_m_in  , yreg_wr_valid_b_in , edp_rng_in_ff_b57,edp_rng_in_ff_b56}	),
 .dout ({yreg_swr_valid_m_lth , yreg_swr_valid_b_lth , ect_yreg_wr_w      , rng_tid[1:0]}				),
  .siclk(siclk),
  .soclk(soclk));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Y Register   !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Edge         !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

//				   Edge Mask Specification
//
//                                        Big-endian                 Little-endian                    
//                                                                                     
//      Edge Size    A2..A0        Left Edge   Right Edge        Left Edge   Right Edge
//      ---------    ------        ---------   ----------        ---------   ----------
//          8          000         1111_1111    1000_0000        1111_1111    0000_0001
//          8          001         0111_1111    1100_0000        1111_1110    0000_0011
//          8          010         0011_1111    1110_0000        1111_1100    0000_0111
//          8          011         0001_1111    1111_0000        1111_1000    0000_1111
//          8          100         0000_1111    1111_1000        1111_0000    0001_1111
//          8          101         0000_0111    1111_1100        1110_0000    0011_1111
//          8          110         0000_0011    1111_1110        1100_0000    0111_1111
//          8          111         0000_0001    1111_1111        1000_0000    1111_1111
//                                                                                     
//         16          00x              1111         1000             1111         0001
//         16          01x              0111         1100             1110         0011
//         16          10x              0011         1110             1100         0111
//         16          11x              0001         1111             1000         1111
//                                                                                     
//         32          0xx                11           10               11           01
//         32          1xx                01           11               10           11



// 				   Algorithm
//
// 1. The left  edge is computed from the 3 least significant bits of RS1 and
//    the right edge is computed from the 3 least significant bits of RS2.
//
// 2. If 32-bit address masking is disabled (PSTATE.AM == 0, 64-bit addressing) and
//    the (RS1[63:3] == RS2[63:3]), then RD = right edge mask ANDed with the left edge mask.
//
//				   OR
//
//    If 32-bit address masking is  enabled (PSTATE.AM == 1, 32-bit addressing) and
//    the (RS1[31:3] == RS2[31:3]), then RD = right edge mask ANDed with the left edge mask.
//
// 3. Otherwise, RD = left edge mask.


// Format :
//
//  31:30   29:25   24:19    18:14   13:05   04:00
//  -----   -----   ------   -----   -----   -----
//    10      rd    110110    rs1     opf     rs2
//
//
// OPCODE         opf        comment
// --------   -----------    ----------------------------
// edge8      0 0000 0000
// edge8N     0 0000 0001    no icc,xcc update;
// edge8L     0 0000 0010			Little-Endian
// edge8LN    0 0000 0011    no icc,xcc update;	Little-Endian
// edge16     0 0000 0100
// edge16N    0 0000 0101    no icc,xcc update;
// edge16L    0 0000 0110			Little-Endian
// edge16LN   0 0000 0111    no icc,xcc update;	Little-Endian
// edge32     0 0000 1000
// edge32N    0 0000 1001    no icc,xcc update;
// edge32L    0 0000 1010			Little-Endian
// edge32LN   0 0000 1011    no icc,xcc update;	Little-Endian



	// E0: XOR rs1 rs2 for eq det. Also take pstate_am into account
//	assign zdet_in_e[63:32]	= {32{~ect_pstate_am_e}} & (exu_rs1_data_e[63:32] ^ exu_rs2_data_e[63:32]);
//	assign zdet_in_e[31:3]	=                           exu_rs1_data_e[31:3]  ^ exu_rs2_data_e[31:3];

//	assign neq_zdet_e	= | zdet_in_e[63:3];
//	assign neq_zdet_e	= ~(( edp_rs1_x_rs2_cmp_e[1] &  edp_rs1_x_rs2_cmp_e[0]) |
//				    ( ect_pstate_am_e        &  edp_rs1_x_rs2_cmp_e[0]));


// *** Generate left mask ***
											// EDGE8                             EDGE16             EDGE32
	assign lmask_e[7]	=  edge08_e & ~exu_rs1_data_e[2] & ~exu_rs1_data_e[1] & ~exu_rs1_data_e[0] ;	// 000

	assign lmask_e[6]	=  edge08_e & ~exu_rs1_data_e[2] & ~exu_rs1_data_e[1]                      ;	// 000 001

	assign lmask_e[5]	= (edge08_e & ~exu_rs1_data_e[2] & ~exu_rs1_data_e[1]                     ) |	// 000 001
				  (edge08_e & ~exu_rs1_data_e[2] &                      ~exu_rs1_data_e[0]);	//         010

	assign lmask_e[4]	=  edge08_e & ~exu_rs1_data_e[2]                                           ;	// 000 001 010 011

	assign lmask_e[3]	= (edge08_e & ~exu_rs1_data_e[2]                                          ) |	// 000 001 010 011
				  (edge08_e &                      ~exu_rs1_data_e[1] & ~exu_rs1_data_e[0]) |	//                 100
				  (edge16_e & ~exu_rs1_data_e[2] & ~exu_rs1_data_e[1]                     );	//                                   00x

	assign lmask_e[2]	= (edge08_e & ~exu_rs1_data_e[2]                                          ) |	// 000 001 010 011
				  (edge08_e &                      ~exu_rs1_data_e[1]                     ) |	//                 100 101
				  (edge16_e & ~exu_rs1_data_e[2]                                          );	//                                   00x 01x

	assign lmask_e[1]	= (edge08_e & ~exu_rs1_data_e[2]                                          ) |	// 000 001 010 011
				  (edge08_e &                      ~exu_rs1_data_e[1]                     ) |	//                 100 101
				  (edge08_e &                                           ~exu_rs1_data_e[0]) |	//                         110
				  (edge16_e & ~exu_rs1_data_e[2]                                          ) |	//                                   00x 01x
				  (edge16_e &                      ~exu_rs1_data_e[1]                     ) |	//                                           10x
				  (edge32_e & ~exu_rs1_data_e[2]                                          );	//                                                      0xx

	assign lmask_e[0]	= 1'b1;



// *** Generate right mask ***
											// EDGE8                             EDGE16             EDGE32
	assign rmask_e[7]	= 1'b1;

	assign rmask_e[6]	= (edge08_e &  exu_rs2_data_e[2]                                          ) |	//                 100 101 110 111
				  (edge08_e &                       exu_rs2_data_e[1]                     ) |	//         010 011
				  (edge08_e &                                            exu_rs2_data_e[0]);	//     001

	assign rmask_e[5]	= (edge08_e &  exu_rs2_data_e[2]                                          ) |	//                 100 101 110 111
				  (edge08_e &                       exu_rs2_data_e[1]                     );	//         010 011

	assign rmask_e[4]	= (edge08_e &  exu_rs2_data_e[2]                                          ) |	//                 100 101 110 111
				  (edge08_e &                       exu_rs2_data_e[1] &  exu_rs2_data_e[0]);	//             011

	assign rmask_e[3]	= (edge08_e &  exu_rs2_data_e[2]                                          ) |	//                 100 101 110 111
				   edge16_e                                                                ;	//                                   00x 01x 10x 11x

	assign rmask_e[2]	= (edge08_e &  exu_rs2_data_e[2] &  exu_rs2_data_e[1]                     ) |	//                         110 111
				  (edge08_e &  exu_rs2_data_e[2] &                       exu_rs2_data_e[0]) |	//                     101
				  (edge16_e &  exu_rs2_data_e[2]                                          ) |	//                                           10x 11x
				  (edge16_e &                       exu_rs2_data_e[1]                     );	//                                       01x

	assign rmask_e[1]	= (edge08_e &  exu_rs2_data_e[2] &  exu_rs2_data_e[1]                     ) |	//                         110 111
				  (edge16_e &  exu_rs2_data_e[2]                                          ) |	//                                           10x 11x
				   edge32_e                                                                ;	//                                                      0xx 1xx

	assign rmask_e[0]	= (edge08_e &  exu_rs2_data_e[2] &  exu_rs2_data_e[1] &  exu_rs2_data_e[0]) |	//                             111
				  (edge16_e &  exu_rs2_data_e[2] &  exu_rs2_data_e[1]                     ) |	//                                               11x
				  (edge32_e &  exu_rs2_data_e[2]                                          );	//                                                          1xx



	assign lrmask_e[7:0]	=  lmask_e[7:0] & rmask_e[7:0];

	assign lmask_le8[7:0]	= { lmask_e[0],  lmask_e[1],  lmask_e[2],  lmask_e[3],  lmask_e[4],  lmask_e[5],  lmask_e[6],  lmask_e[7]};
	assign lmask_le16[7:0]	= { 1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  lmask_e[0],  lmask_e[1],  lmask_e[2],  lmask_e[3]};
	assign lmask_le32[7:0]	= { 1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  lmask_e[0],  lmask_e[1]};

	assign lrmask_le8[7:0]	= {lrmask_e[0], lrmask_e[1], lrmask_e[2], lrmask_e[3], lrmask_e[4], lrmask_e[5], lrmask_e[6], lrmask_e[7]};
	assign lrmask_le16[7:0]	= { 1'b0      ,  1'b0      ,  1'b0      ,  1'b0      , lrmask_e[0], lrmask_e[1], lrmask_e[2], lrmask_e[3]};
	assign lrmask_le32[7:0]	= { 1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  1'b0      ,  1'b0      , lrmask_e[0], lrmask_e[1]};


	assign ect_edge_lmask_e[7:0]  = ({8{~edgele_e           }} & lmask_e[7:0]    ) |
				        ({8{ edgele_e & edge08_e}} & lmask_le8[7:0]  ) |
				        ({8{ edgele_e & edge16_e}} & lmask_le16[7:0] ) |
				        ({8{ edgele_e & edge32_e}} & lmask_le32[7:0] );

	assign ect_edge_lrmask_e[7:0] = ({8{~edgele_e           }} & lrmask_e[7:0]   ) |
				        ({8{ edgele_e & edge08_e}} & lrmask_le8[7:0] ) |
				        ({8{ edgele_e & edge16_e}} & lrmask_le16[7:0]) |
				        ({8{ edgele_e & edge32_e}} & lrmask_le32[7:0]);


//	assign ect_edge_res_e[7:0]  = ({8{ neq_zdet_e}} & lmask_endian_e[7:0] ) |
//				      ({8{~neq_zdet_e}} & lrmask_endian_e[7:0]);


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Edge         !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : DEC_CCR_CTL  !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

//  Description:        Condition code resolution logic
//


//------------------
// CC Logic for BCC
//------------------
// Choose appropriate CCs
//
// cctype is 3 bits
// 10X  icc
// 11X  xcc
// 000  fcc0
// 001  fcc1
// 010  fcc2
// 011  fcc3

assign cctype_d[2:0]	= ({3{imov_d}} & {i[18], i[12:11]}        ) |
			  ({3{fmov_d}} & {i[13] | tcc_d, i[12:11]}) |
			  ({3{bpcc_d}} & {~fp_d, i[21:20]}        ) |
			  ({3{bcc_d}}  & {~fp_d, 2'b00}           );

assign brcond_d[3:0]	= ({4{movcc_d}}     & i[17:14]       ) |
			  ({4{movr_d}}      & {1'b0,i[12:10]}) |
			  ({4{br_or_tcc_d}} & i[28:25]       );


// cctype is 3 bits
// 10X  icc
// 11X  xcc
// 000  fcc0
// 001  fcc1
// 010  fcc2
// 011  fcc3



exu_ect_ctl_msff_ctl_macro__width_6 fgu_tid_ff  (
 .scan_in(fgu_tid_ff_scanin),
 .scan_out(fgu_tid_ff_scanout),
 .l1clk(l1clk),
 .din  ({fgu_cmp_fcc_tid_fx2[2:0] , lsu_fgu_fld_tid_b[2:0]}),
 .dout ({fgu_cmp_fcc_tid_fx3[2:0] , fgu_fld_fcc_tid_fx3[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
);



// fcc data

// modeled this after N1, it assumes the data is available 1 cycle earlier than POR

assign fcc_cw_valid[3:0] = fgu_cmp_fcc_vld_fx3[3:0];

assign sel_ct0 = (fgu_cmp_fcc_tid_fx3[2:0] == {dec_thread_group,2'b00});
assign sel_ct1 = (fgu_cmp_fcc_tid_fx3[2:0] == {dec_thread_group,2'b01});
assign sel_ct2 = (fgu_cmp_fcc_tid_fx3[2:0] == {dec_thread_group,2'b10});
assign sel_ct3 = (fgu_cmp_fcc_tid_fx3[2:0] == {dec_thread_group,2'b11});

assign fcc_cw_t0[3:0] = {4{sel_ct0}} & fcc_cw_valid[3:0];
assign fcc_cw_t1[3:0] = {4{sel_ct1}} & fcc_cw_valid[3:0];
assign fcc_cw_t2[3:0] = {4{sel_ct2}} & fcc_cw_valid[3:0];
assign fcc_cw_t3[3:0] = {4{sel_ct3}} & fcc_cw_valid[3:0];

assign fcc_lw_valid[1:0] = {2{lsu_fgu_fld_vld_w}} & fgu_fld_fcc_vld_fx3[1:0];

assign sel_lt0 = (fgu_fld_fcc_tid_fx3[2:0] == {dec_thread_group,2'b00});
assign sel_lt1 = (fgu_fld_fcc_tid_fx3[2:0] == {dec_thread_group,2'b01});
assign sel_lt2 = (fgu_fld_fcc_tid_fx3[2:0] == {dec_thread_group,2'b10});
assign sel_lt3 = (fgu_fld_fcc_tid_fx3[2:0] == {dec_thread_group,2'b11});

assign fcc_lw_t0[1:0] = {2{sel_lt0}} & fcc_lw_valid[1:0];
assign fcc_lw_t1[1:0] = {2{sel_lt1}} & fcc_lw_valid[1:0];
assign fcc_lw_t2[1:0] = {2{sel_lt2}} & fcc_lw_valid[1:0];
assign fcc_lw_t3[1:0] = {2{sel_lt3}} & fcc_lw_valid[1:0];


assign t0_data_in[7:0] = {
			  ({2{fcc_lw_t0[1]}} & fgu_fld_fcc_fx3[7:6]) | ({2{fcc_cw_t0[3]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t0[1]}} & fgu_fld_fcc_fx3[5:4]) | ({2{fcc_cw_t0[2]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t0[1]}} & fgu_fld_fcc_fx3[3:2]) | ({2{fcc_cw_t0[1]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t0[0]}} & fgu_fld_fcc_fx3[1:0]) | ({2{fcc_cw_t0[0]}} & fgu_cmp_fcc_fx3[1:0])
			 };
assign t0_hold_in[7:0] = {
			  {2{~fcc_lw_t0[1] & ~fcc_cw_t0[3]}} & fcc_t0_d[7:6],
			  {2{~fcc_lw_t0[1] & ~fcc_cw_t0[2]}} & fcc_t0_d[5:4],
			  {2{~fcc_lw_t0[1] & ~fcc_cw_t0[1]}} & fcc_t0_d[3:2],
			  {2{~fcc_lw_t0[0] & ~fcc_cw_t0[0]}} & fcc_t0_d[1:0]
			 };

assign fcc_nxt_t0[7:0] = t0_data_in[7:0] | t0_hold_in[7:0];

exu_ect_ctl_msff_ctl_macro__width_8 fcc_t0_ff  (		// FS:wmr_protect
 .scan_in(fcc_t0_ff_wmr_scanin),
 .scan_out(fcc_t0_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  (fcc_nxt_t0[7:0]),
 .dout (fcc_t0_d[7:0]),
  .soclk(soclk)
);

assign t1_data_in[7:0] = {
			  ({2{fcc_lw_t1[1]}} & fgu_fld_fcc_fx3[7:6]) | ({2{fcc_cw_t1[3]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t1[1]}} & fgu_fld_fcc_fx3[5:4]) | ({2{fcc_cw_t1[2]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t1[1]}} & fgu_fld_fcc_fx3[3:2]) | ({2{fcc_cw_t1[1]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t1[0]}} & fgu_fld_fcc_fx3[1:0]) | ({2{fcc_cw_t1[0]}} & fgu_cmp_fcc_fx3[1:0])
			 };
assign t1_hold_in[7:0] = {
			  {2{~fcc_lw_t1[1] & ~fcc_cw_t1[3]}} & fcc_t1_d[7:6],
			  {2{~fcc_lw_t1[1] & ~fcc_cw_t1[2]}} & fcc_t1_d[5:4],
			  {2{~fcc_lw_t1[1] & ~fcc_cw_t1[1]}} & fcc_t1_d[3:2],
			  {2{~fcc_lw_t1[0] & ~fcc_cw_t1[0]}} & fcc_t1_d[1:0]
			 };

assign fcc_nxt_t1[7:0] = t1_data_in[7:0] | t1_hold_in[7:0];

exu_ect_ctl_msff_ctl_macro__width_8 fcc_t1_ff  (		// FS:wmr_protect
 .scan_in(fcc_t1_ff_wmr_scanin),
 .scan_out(fcc_t1_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  (fcc_nxt_t1[7:0]),
 .dout (fcc_t1_d[7:0]),
  .soclk(soclk)
);

assign t2_data_in[7:0] = {
			  ({2{fcc_lw_t2[1]}} & fgu_fld_fcc_fx3[7:6]) | ({2{fcc_cw_t2[3]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t2[1]}} & fgu_fld_fcc_fx3[5:4]) | ({2{fcc_cw_t2[2]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t2[1]}} & fgu_fld_fcc_fx3[3:2]) | ({2{fcc_cw_t2[1]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t2[0]}} & fgu_fld_fcc_fx3[1:0]) | ({2{fcc_cw_t2[0]}} & fgu_cmp_fcc_fx3[1:0])
			 };
assign t2_hold_in[7:0] = {
			  {2{~fcc_lw_t2[1] & ~fcc_cw_t2[3]}} & fcc_t2_d[7:6],
			  {2{~fcc_lw_t2[1] & ~fcc_cw_t2[2]}} & fcc_t2_d[5:4],
			  {2{~fcc_lw_t2[1] & ~fcc_cw_t2[1]}} & fcc_t2_d[3:2],
			  {2{~fcc_lw_t2[0] & ~fcc_cw_t2[0]}} & fcc_t2_d[1:0]
			 };

assign fcc_nxt_t2[7:0] = t2_data_in[7:0] | t2_hold_in[7:0];

exu_ect_ctl_msff_ctl_macro__width_8 fcc_t2_ff  (		// FS:wmr_protect
 .scan_in(fcc_t2_ff_wmr_scanin),
 .scan_out(fcc_t2_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  (fcc_nxt_t2[7:0]),
 .dout (fcc_t2_d[7:0]),
  .soclk(soclk)
);

assign t3_data_in[7:0] = {
			  ({2{fcc_lw_t3[1]}} & fgu_fld_fcc_fx3[7:6]) | ({2{fcc_cw_t3[3]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t3[1]}} & fgu_fld_fcc_fx3[5:4]) | ({2{fcc_cw_t3[2]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t3[1]}} & fgu_fld_fcc_fx3[3:2]) | ({2{fcc_cw_t3[1]}} & fgu_cmp_fcc_fx3[1:0]),
			  ({2{fcc_lw_t3[0]}} & fgu_fld_fcc_fx3[1:0]) | ({2{fcc_cw_t3[0]}} & fgu_cmp_fcc_fx3[1:0])
			 };
assign t3_hold_in[7:0] = {
			  {2{~fcc_lw_t3[1] & ~fcc_cw_t3[3]}} & fcc_t3_d[7:6],
			  {2{~fcc_lw_t3[1] & ~fcc_cw_t3[2]}} & fcc_t3_d[5:4],
			  {2{~fcc_lw_t3[1] & ~fcc_cw_t3[1]}} & fcc_t3_d[3:2],
			  {2{~fcc_lw_t3[0] & ~fcc_cw_t3[0]}} & fcc_t3_d[1:0]
			 };

assign fcc_nxt_t3[7:0] = t3_data_in[7:0] | t3_hold_in[7:0];

exu_ect_ctl_msff_ctl_macro__width_8 fcc_t3_ff  (		// FS:wmr_protect
 .scan_in(fcc_t3_ff_wmr_scanin),
 .scan_out(fcc_t3_ff_wmr_scanout),
 .siclk(spc_aclk_wmr),
 .l1clk(l1clk_pm1),
 .din  (fcc_nxt_t3[7:0]),
 .dout (fcc_t3_d[7:0]),
  .soclk(soclk)
);


// use current tid to pick the right thread

// 0in value -var dec_pick_d[3:0] -val 0 1 2 4 8

assign fcc_d[7:0] = ({8{dec_pick_d[0]}} & fcc_t0_d[7:0]) |
		    ({8{dec_pick_d[1]}} & fcc_t1_d[7:0]) |
		    ({8{dec_pick_d[2]}} & fcc_t2_d[7:0]) |
		    ({8{dec_pick_d[3]}} & fcc_t3_d[7:0]);

//---------------------------
// FCC Logic
//--------------------------
// choose current fcc
assign use_fcc0_d = ~cctype_d[1] & ~cctype_d[0];
assign use_fcc1_d = ~cctype_d[1] &  cctype_d[0];
assign use_fcc2_d =  cctype_d[1] & ~cctype_d[0];
assign use_fcc3_d =  cctype_d[1] &  cctype_d[0];

assign curr_fcc_d[1:0] = ({2{use_fcc0_d}} & fcc_d[1:0]) |
			 ({2{use_fcc1_d}} & fcc_d[3:2]) |
			 ({2{use_fcc2_d}} & fcc_d[5:4]) |
			 ({2{use_fcc3_d}} & fcc_d[7:6]);

// decode to make next step easier
assign fcc_dec_d[0] = ~curr_fcc_d[1] & ~curr_fcc_d[0];
assign fcc_dec_d[1] = ~curr_fcc_d[1] &  curr_fcc_d[0];
assign fcc_dec_d[2] =  curr_fcc_d[1] & ~curr_fcc_d[0];
assign fcc_dec_d[3] =  curr_fcc_d[1] &  curr_fcc_d[0];

exu_ect_ctl_msff_ctl_macro__width_4 fcce_ff  (
 .scan_in(fcce_ff_scanin),
 .scan_out(fcce_ff_scanout),
 .l1clk(l1clk_pm1),
 .din  (fcc_dec_d[3:0]),
 .dout (fcc_dec_e[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

exu_ect_ctl_msff_ctl_macro__width_4 brcond_e_reg  (
 .scan_in(brcond_e_reg_scanin),
 .scan_out(brcond_e_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (brcond_d[3:0]),
 .dout (br_cond_e[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign use_xcc_d = cctype_d[2] & cctype_d[1];


assign ccr_byp_data[7:0] = dec_valid_e ? exu_ccr_byp_data1[7:0] :
                                         exu_ccr_byp_data0[7:0];

// mux between xcc and icc
assign cc_d[3:0] =  use_xcc_d ?  ccr_byp_data[7:4] :      // xcc
			         ccr_byp_data[3:0];       // icc

exu_ect_ctl_msff_ctl_macro__width_4 ccreg_e  (
 .scan_in(ccreg_e_scanin),
 .scan_out(ccreg_e_scanout),
 .l1clk(l1clk_pm1),
 .din  (cc_d[3:0]),
 .dout (cc_e[3:0]),
  .siclk(siclk),
  .soclk(soclk)
);

// Branch Type Decode
assign brcond_e[0]  =  ~br_cond_e[1] & ~br_cond_e[0];
assign brcond_e[1]  =  ~br_cond_e[1] &  br_cond_e[0];
assign brcond_e[2]  =   br_cond_e[1] & ~br_cond_e[0];
assign brcond_e[3]  =   br_cond_e[1] &  br_cond_e[0];

// Evaluate potential integer CC branches
assign ltz_e = (cc_e[3] ^ cc_e[1]);

assign cc_breval_e[0] = 1'b0;			// BPN
assign cc_breval_e[1] = cc_e[2];		// BPE
assign cc_breval_e[2] = cc_e[2] | ltz_e;        // BPLE
assign cc_breval_e[3] = ltz_e;			// BPL
assign cc_breval_e[4] = cc_e[2] | cc_e[0];	// BPLEU
assign cc_breval_e[5] = cc_e[0];		// BPCS
assign cc_breval_e[6] = cc_e[3];		// BPNEG
assign cc_breval_e[7] = cc_e[1];		// BPVS 

// mux to choose right condition
assign cc_eval0 = cc_breval_e[0] & brcond_e[0] |
		  cc_breval_e[1] & brcond_e[1] |
		  cc_breval_e[2] & brcond_e[2] |
		  cc_breval_e[3] & brcond_e[3];

assign cc_eval1 = cc_breval_e[4] & brcond_e[0] |
		  cc_breval_e[5] & brcond_e[1] |
		  cc_breval_e[6] & brcond_e[2] |
		  cc_breval_e[7] & brcond_e[3];

// Evaluate FP CC branches
assign fp_breval_e[0] =  1'b0;				// FBN  / A
assign fp_breval_e[1] = ~fcc_dec_e[0];			// FBNE / E
assign fp_breval_e[2] =  fcc_dec_e[1] | fcc_dec_e[2];	// FBLG / UE
assign fp_breval_e[3] =  fcc_dec_e[1] | fcc_dec_e[3];	// FBUL / GE
assign fp_breval_e[4] =  fcc_dec_e[1];			// FBL  / UGE
assign fp_breval_e[5] =  fcc_dec_e[3] | fcc_dec_e[2];	// FBUG / LE
assign fp_breval_e[6] =  fcc_dec_e[2];			// FBG  / ULE
assign fp_breval_e[7] =  fcc_dec_e[3];			// FBU  / O

assign fp_eval0 = fp_breval_e[0] & brcond_e[0] |
		  fp_breval_e[1] & brcond_e[1] |
		  fp_breval_e[2] & brcond_e[2] |
		  fp_breval_e[3] & brcond_e[3];

assign fp_eval1 = fp_breval_e[4] & brcond_e[0] |
		  fp_breval_e[5] & brcond_e[1] |
		  fp_breval_e[6] & brcond_e[2] |
		  fp_breval_e[7] & brcond_e[3];


exu_ect_ctl_msff_ctl_macro__width_1 cctype_reg  (
 .scan_in(cctype_reg_scanin),
 .scan_out(cctype_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  (cctype_d[2]),
 .dout (cctype_e[2]),
  .siclk(siclk),
  .soclk(soclk)
);

assign fpcond_mvbr_e = ~cctype_e[2];

// merge eval0, eval1 and fp condition codes
assign cc_eval = (~fpcond_mvbr_e & ~br_cond_e[2] & cc_eval0) |
		 (~fpcond_mvbr_e &  br_cond_e[2] & cc_eval1) | 
		 ( fpcond_mvbr_e & ~br_cond_e[2] & fp_eval0) | 
	         ( fpcond_mvbr_e &  br_cond_e[2] & fp_eval1);

// invert branch condition if this is an inverted br type
assign cond_true_e = cc_eval ^ br_cond_e[3];  

exu_ect_ctl_msff_ctl_macro__width_4 misc_ff  (
 .scan_in(misc_ff_scanin),
 .scan_out(misc_ff_scanout),
 .l1clk(l1clk_pm1),
 .din  ({callclass_d , specbr_d , cmov_d , regop_d}),
 .dout ({callclass_e , specbr_e , cmov_e , regop_e}),
  .siclk(siclk),
  .soclk(soclk)
);

//--------------
// For BRZ
// -------------
// Calculate Cond Assuming Z=1 And Z=0.  Then Mux
assign r_eval1 = (edp_br_flag_e[1] | ~br_cond_e[1]  | ~br_cond_e[0]) ^ br_cond_e[2];

assign r_eval0 = (edp_br_flag_e[1] &  br_cond_e[1]) ^ br_cond_e[2];


// Evaluate Final Branch condition
// 3:1 mux

assign final_cond_true_z0_e = 	(~regop_e & cond_true_e) |
				( regop_e & r_eval0    );

assign final_cond_true_z1_e = 	(~regop_e & cond_true_e) |
				( regop_e & r_eval1    );

// valid_e takes annul into account


// 0in value -var {callclass_e & dec_valid_e,cmov_e & dec_valid_e,tcc_e & dec_valid_e} -val 0 1 2 4 			

assign ect_br_taken_z0_e = (callclass_e | (specbr_e & final_cond_true_z0_e));
assign ect_br_taken_z1_e = (callclass_e | (specbr_e & final_cond_true_z1_e));


// 3 cases for {zero,neg} are 00, 01, 10 (11 illegal)

assign dec_cmov_z00_e = cmov_e & ((~regop_e & cond_true_e) | (regop_e & br_cond_e[2]));                 // 00 case

assign dec_cmov_z01_e = cmov_e & ((~regop_e & cond_true_e) | (regop_e & (br_cond_e[1] ^ br_cond_e[2])));  // 01 case

assign dec_cmov_z10_e = cmov_e & ((~regop_e & cond_true_e) | (regop_e & ((~br_cond_e[1] | ~br_cond_e[0]) ^ br_cond_e[2]))); // 10 case


assign tcc_taken_e    = (tcc_e & final_cond_true_z0_e & ~edp_br_flag_e[0]) |
                        (tcc_e & final_cond_true_z1_e &  edp_br_flag_e[0]);


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : DEC_CCR_CTL  !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_ect_ctl_spare_ctl_macro__num_6 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk));


supply0 vss;
supply1 vdd;

// fixscan start:
assign i_pwr0_lth_scanin         = scan_in                  ;
assign i_pwr1_lth_scanin         = i_pwr0_lth_scanout       ;
assign i_mbist_lth_scanin        = i_pwr1_lth_scanout       ;
assign i_estage_lth_scanin       = i_mbist_lth_scanout      ;
assign i_mstage_lth_scanin       = i_estage_lth_scanout     ;
assign ren_lth_scanin            = i_mstage_lth_scanout     ;
assign rs_lth_scanin             = ren_lth_scanout          ;
assign i_byp_lth_scanin          = rs_lth_scanout           ;
assign i_ccr_pipe_lth_scanin     = i_byp_lth_scanout        ;
assign i_tlu_lth_scanin          = i_ccr_pipe_lth_scanout   ;
assign i_yreg_mpipe_lth_scanin   = i_tlu_lth_scanout        ;
assign i_yreg_spipe_lth_scanin   = i_yreg_mpipe_lth_scanout ;
assign fgu_tid_ff_scanin         = i_yreg_spipe_lth_scanout ;
assign fcce_ff_scanin            = fgu_tid_ff_scanout       ;
assign brcond_e_reg_scanin       = fcce_ff_scanout          ;
assign ccreg_e_scanin            = brcond_e_reg_scanout     ;
assign cctype_reg_scanin         = ccreg_e_scanout          ;
assign misc_ff_scanin            = cctype_reg_scanout       ;
assign spares_scanin             = misc_ff_scanout          ;
assign scan_out                  = spares_scanout           ;

assign i_ccr_arch_lth_wmr_scanin = wmr_scan_in              ;
assign fcc_t0_ff_wmr_scanin      = i_ccr_arch_lth_wmr_scanout;
assign fcc_t1_ff_wmr_scanin      = fcc_t0_ff_wmr_scanout    ;
assign fcc_t2_ff_wmr_scanin      = fcc_t1_ff_wmr_scanout    ;
assign fcc_t3_ff_wmr_scanin      = fcc_t2_ff_wmr_scanout    ;
assign wmr_scan_out              = fcc_t3_ff_wmr_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module exu_ect_ctl_l1clkhdr_ctl_macro (
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

module exu_ect_ctl_msff_ctl_macro__width_5 (
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

module exu_ect_ctl_msff_ctl_macro__width_8 (
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

module exu_ect_ctl_msff_ctl_macro__width_37 (
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

module exu_ect_ctl_msff_ctl_macro__width_6 (
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

module exu_ect_ctl_msff_ctl_macro__width_15 (
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

module exu_ect_ctl_msff_ctl_macro__width_76 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [75:0] fdin;
wire [74:0] so;

  input [75:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = din[75:0];






dff #(76)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75:0]),
.si({scan_in,so[74:0]}),
.so({so[74:0],scan_out}),
.q(dout[75:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_ect_ctl_msff_ctl_macro__width_28 (
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

module exu_ect_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module exu_ect_ctl_msff_ctl_macro__width_9 (
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

module exu_ect_ctl_msff_ctl_macro__width_4 (
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

module exu_ect_ctl_msff_ctl_macro__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module exu_ect_ctl_spare_ctl_macro__num_6 (
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
assign scan_out = so_5;



endmodule

