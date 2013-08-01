// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu.v
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
module exu (
  l2clk, 
  scan_in, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  spc_aclk_wmr, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_dectest, 
  tcu_muxtest, 
  in_rngl_cdbus, 
  dec_tid_p, 
  dec_inst_rs1_vld_p, 
  dec_inst_rs2_vld_p, 
  dec_inst_rs3_vld_p, 
  dec_inst_rs1_p, 
  dec_inst_rs2_p, 
  dec_inst_rs3_p, 
  dec_exu_clken, 
  dec_inst_rd_d, 
  dec_inst_d, 
  dec_decode_d, 
  dec_thread_group, 
  tlu_pc_d, 
  dec_valid_e, 
  tlu_itlb_bypass_e, 
  dec_flush_m, 
  dec_flush_b, 
  fgu_exu_icc_fx5, 
  fgu_exu_xcc_fx5, 
  fgu_exu_cc_vld_fx5, 
  fgu_exu_result_fx5, 
  fgu_result_tid_fx5, 
  fgu_irf_w_addr_fx5, 
  fgu_exu_w_vld_fx5, 
  lsu_exu_ld_data_b, 
  lsu_exu_ld_b, 
  lsu_exu_rd_m, 
  lsu_exu_tid_m, 
  lsu_exu_ld_vld_w, 
  tlu_flush_exu_b, 
  tlu_ccr, 
  tlu_cwp, 
  tlu_ccr_cwp_valid, 
  tlu_ccr_cwp_tid, 
  tlu_pstate_am, 
  tlu_gl_thr0, 
  tlu_gl_thr1, 
  tlu_gl_thr2, 
  tlu_gl_thr3, 
  tlu_cerer_irf, 
  tlu_ceter_pscce, 
  lsu_asi_error_inject_b31, 
  lsu_asi_error_inject_b25, 
  lsu_asi_error_inject, 
  lsu_exu_pmen, 
  lsu_asi_clken, 
  spc_core_running_status, 
  mbi_run, 
  mbi_addr, 
  mbi_write_data_p1, 
  mbi_irf_read_en, 
  mbi_irf_write_en, 
  mbi_irf_save_en, 
  mbi_irf_restore_en, 
  fgu_fld_fcc_fx3, 
  lsu_fgu_fld_tid_b, 
  fgu_fld_fcc_vld_fx3, 
  lsu_fgu_fld_vld_w, 
  fgu_cmp_fcc_fx3, 
  fgu_cmp_fcc_tid_fx2, 
  fgu_cmp_fcc_vld_fx3, 
  dec_pick_d, 
  exu_rngl_cdbus, 
  exu_oddwin_b, 
  exu_address_e, 
  exu_mdp_mux_sel_e, 
  exu_ms_icc_e, 
  exu_rs1_data_e, 
  exu_rs2_data_e, 
  exu_store_data_e, 
  exu_y_data_e, 
  exu_ecc_m, 
  exu_ecc_winop_flush_m, 
  exu_gsr_data_m, 
  exu_gsr_vld_m, 
  exu_lsu_va_error_m, 
  exu_ibp_m, 
  exu_ecc_addr_m, 
  exu_ecc_check_m, 
  exu_cecc_m, 
  exu_uecc_m, 
  exu_misalign_m, 
  exu_oor_va_m, 
  exu_tcc_m, 
  exu_tof_m, 
  exu_trap_number_b, 
  exu_spill_b, 
  exu_fill_m, 
  exu_normal_b, 
  exu_cleanwin_b, 
  exu_wstate_b, 
  exu_ccr0, 
  exu_ccr1, 
  exu_ccr2, 
  exu_ccr3, 
  exu_cwp_thr0, 
  exu_cwp_thr1, 
  exu_cwp_thr2, 
  exu_cwp_thr3, 
  exu_window_block_m, 
  exu_tlu_window_block, 
  exu_test_valid, 
  exu_test_tid, 
  exu_test_addr, 
  exu_mbi_irf_fail_, 
  exu_br_taken_e, 
  exu_br_taken_e1, 
  exu_cmov_true_m, 
  scan_out, 
  wmr_scan_out);
wire edp_scanin;
wire edp_scanout;
wire ect_wmr_scanin;
wire ect_wmr_scanout;
wire ect_scanin;
wire ect_scanout;
wire [64:0] edp_rng_in_ff;
wire ecc_scanin;
wire ecc_scanout;
wire rml_wmr_scanin;
wire rml_wmr_scanout;
wire rml_scanin;
wire rml_scanout;
wire irf_scanin;
wire irf_scanout;
wire ect_tg_clken;
wire ect_valid_lth_w;
wire [1:0] ect_tid_lth_w;
wire [4:0] ect_rd_lth_w;
wire [7:0] ecc_w_synd_w;
wire [63:0] edp_rd_ff_w;
wire ect_valid_in_w2;
wire [1:0] ect_tid_lth_w2;
wire [4:0] ect_rd_lth_w2;
wire [7:0] ecc_w2_synd_w2;
wire [63:0] edp_rd_ff_w2;
wire [1:0] rml_irf_cwpswap_tid_m;
wire [2:0] rml_irf_old_lo_cwp_m;
wire [2:1] rml_irf_old_e_cwp_m;
wire rml_irf_save_even_m;
wire rml_irf_save_odd_m;
wire rml_irf_save_local_m;
wire [1:0] rml_irf_cwpswap_tid_b;
wire [2:0] rml_irf_new_lo_cwp_b;
wire [2:1] rml_irf_new_e_cwp_b;
wire rml_irf_restore_even_b;
wire rml_irf_restore_odd_b;
wire rml_irf_restore_local_b;
wire rml_irf_save_global;
wire [1:0] rml_irf_global_tid;
wire [1:0] rml_irf_old_agp;
wire rml_irf_restore_global;
wire [1:0] rml_irf_global_tid_ff;
wire [1:0] rml_irf_new_agp_ff;
wire [71:0] irf_rs1_data_d;
wire [71:0] irf_rs2_data_d;
wire [71:0] irf_rs3_data_d;
wire [5:0] rml_rng_data_out;
wire [4:0] rml_rng_rd_ctl;
wire [1:0] rml_rng_ack_ctl;
wire [1:0] rml_rng_ack_cwp_tid;
wire [1:0] rml_rng_ack_ecc_tid;
wire rml_rng_ack_det_vld;
wire rml_rng_wt_imask_ctl;
wire [7:0] rml_irf_ecc_data;
wire rml_rng_ack_sel_ctl;
wire [31:0] rml_rng_y_data;
wire [7:0] ect_rng_ccr_data;
wire ect_mbist_sel;
wire [7:0] ecc_mbist_write_data_p4;
wire [4:0] ect_rs1_early_sel_d;
wire [4:0] ect_rs2_early_sel_d;
wire [4:0] ect_rs3_early_sel_d;
wire [7:0] ect_rs2_imm_sel_d;
wire [3:0] ect_rs1_late_sel_d;
wire [3:0] ect_rs2_late_sel_d;
wire [3:0] ect_rs3_late_sel_d;
wire [3:0] ect_logic_sel_d;
wire [6:0] ect_shift_sel_d;
wire ect_br_taken_z0_e;
wire ect_br_taken_z1_e;
wire ect_alignaddress_little_e;
wire ect_as_clip_e_;
wire ect_as_cin_e;
wire [1:0] ect_array_sel_e;
wire [7:0] ect_edge_lmask_e;
wire [7:0] ect_edge_lrmask_e;
wire ect_pstate_am_e;
wire [5:0] ect_rm_early_sel_e;
wire [2:0] ect_rm_late_sel_e;
wire ect_store_mux_sel_e;
wire ect_ex_emb_clken;
wire [1:0] edp_br_flag_e;
wire [63:0] edp_rcc_data_e;
wire [63:0] edp_rs3_data_e;
wire [7:0] edp_rcc_ecc_e;
wire [7:0] edp_rs2_ecc_e;
wire [7:0] edp_rs3_ecc_e;
wire edp_add_cout64_e;
wire edp_add_data_e_b63;
wire [1:0] edp_add_zdetect_e_;
wire edp_sub_cout64_e;
wire edp_sub_data_e_b63;
wire edp_sub_data_e_b31;
wire [1:0] edp_sub_zdetect_e_;
wire edp_logical_data_e_b63;
wire edp_logical_data_e_b31;
wire [1:0] edp_lg_zdetect_e;
wire [63:47] edp_address_m;
wire [63:47] edp_rd_ff_m;
wire rml_rng_wt_ccr_ctl;
wire rml_test_valid_d;
wire [1:0] ect_tid_lth_e;
wire [4:0] ect_rs1_addr_e;
wire [4:0] ect_rs2_addr_e;
wire [4:0] ect_rs3_addr_e;
wire ect_rs1_valid_e;
wire ect_rs2_valid_e;
wire ect_rs3_valid_e;
wire ect_two_cycle_m;
wire ect_yreg_wr_w;
wire ect_misaligned_error_m;


input		l2clk;
input         	scan_in;
input		wmr_scan_in;
input        	tcu_pce_ov;			// scan signals
input      	spc_aclk;
input     	spc_bclk;
input		spc_aclk_wmr;
input		tcu_scan_en;
input		tcu_array_wr_inhibit;
input		tcu_se_scancollar_in;
input		tcu_dectest;			// Passgate mux test control
input		tcu_muxtest;			// Passgate mux test control

input  [64:0]	in_rngl_cdbus;			// ASI Ring

input  [1:0]	dec_tid_p;
input		dec_inst_rs1_vld_p;
input		dec_inst_rs2_vld_p;
input		dec_inst_rs3_vld_p;
input  [4:0]	dec_inst_rs1_p;
input  [4:0]	dec_inst_rs2_p;
input  [4:0]	dec_inst_rs3_p;

input		dec_exu_clken;			// Powerdown for D->E Flops
input  [4:0]	dec_inst_rd_d;
input  [31:0]	dec_inst_d;
input		dec_decode_d;			// Instruction and TID are valid
input		dec_thread_group;		// Static Signal : Tie UP or DOWN where cloning occurs
input  [47:2]	tlu_pc_d;

input		dec_valid_e;			// Late "E" Stage Valid
input		tlu_itlb_bypass_e;		// Ignore Address Out-Of-Range

input		dec_flush_m;
input		dec_flush_b;

input  [3:0]	fgu_exu_icc_fx5;		// FGU int icc cond code {N,Z,V,C}
input  [1:0]	fgu_exu_xcc_fx5;		// FGU int xcc cond code {N,Z}
input		fgu_exu_cc_vld_fx5;		// FGU int icc/xcc cond code valid
input  [63:0]	fgu_exu_result_fx5;		// FGU Integer results
input  [1:0]	fgu_result_tid_fx5;
input  [4:0]	fgu_irf_w_addr_fx5;
input		fgu_exu_w_vld_fx5;

input  [63:0]	lsu_exu_ld_data_b;
input		lsu_exu_ld_b;
input  [4:0]	lsu_exu_rd_m;
input  [2:0]	lsu_exu_tid_m;
input		lsu_exu_ld_vld_w;

input		tlu_flush_exu_b;		// EXU to flush instr in B stage
input  [7:0]	tlu_ccr;
input  [2:0]	tlu_cwp;
input		tlu_ccr_cwp_valid;
input  [1:0]	tlu_ccr_cwp_tid;
input  [3:0]	tlu_pstate_am;			// 32-bit addressing mode if = 1

input  [1:0]	tlu_gl_thr0;			// From TLU : current GL value to update
input  [1:0]	tlu_gl_thr1;			// From TLU : current GL value to update
input  [1:0]	tlu_gl_thr2;			// From TLU : current GL value to update
input  [1:0]	tlu_gl_thr3;			// From TLU : current GL value to update

input		tlu_cerer_irf;			// IRF ecc error trap enable
input  [3:0]	tlu_ceter_pscce;		// core error trap enable reg precise enable


input		lsu_asi_error_inject_b31;	// [31]=global inject en
input		lsu_asi_error_inject_b25;	// [25]=IRF inject en
input  [7:0]	lsu_asi_error_inject;		// [7:0]=mask
input		lsu_exu_pmen;			// Power Management : Master Enable
input		lsu_asi_clken;			// Power Management : ASI ring
input  [3:0]	spc_core_running_status;	// Power Management : Thread active

input		mbi_run; 			// MBIST
input  [9:0]	mbi_addr; 			// MBIST
input  [7:0]	mbi_write_data_p1; 		// MBIST
input		mbi_irf_read_en; 		// MBIST
input		mbi_irf_write_en; 		// MBIST
input		mbi_irf_save_en;		// MBIST
input		mbi_irf_restore_en;		// MBIST

// *** DEC_CCR Inputs ***

input  [7:0]	fgu_fld_fcc_fx3;		// fcc's from the fgu
input  [2:0]	lsu_fgu_fld_tid_b;
input  [1:0]	fgu_fld_fcc_vld_fx3;
input		lsu_fgu_fld_vld_w;		// Float load valid

input  [1:0]	fgu_cmp_fcc_fx3;		// fcc's from the fgu
input  [2:0]	fgu_cmp_fcc_tid_fx2;
input  [3:0]	fgu_cmp_fcc_vld_fx3;

input  [3:0]	dec_pick_d;			// which stand is valid at d


output [64:0]	exu_rngl_cdbus;			// ASI Ring

output [3:0] 	exu_oddwin_b;			// To Decode
output [47:0]	exu_address_e;			// To IFU and LSU
output [5:0]	exu_mdp_mux_sel_e;		// To MDP
output		exu_ms_icc_e;
output [63:0]	exu_rs1_data_e;			// To MDP
output [63:0]	exu_rs2_data_e;			// To MDP
output [63:0]	exu_store_data_e;		// To LSU
output [31:0]	exu_y_data_e;			// To MDP

output		exu_ecc_m;			// To FGU
output		exu_ecc_winop_flush_m;		// To FGU : signal "1" when ECC or WINOP exception
                                                //          to flush FGU
output [31:0]	exu_gsr_data_m;			// To FGU
output [1:0]	exu_gsr_vld_m;			// To FGU
output		exu_lsu_va_error_m;		// To LSU : Address Out of Range

output		exu_ibp_m;			// To TLU : Raw Intruction Breakpoint
output [4:0]	exu_ecc_addr_m;			// To TLU :
output [7:0]	exu_ecc_check_m;		// To TLU :
output		exu_cecc_m;			// To TLU : Correctable ECC Error
output		exu_uecc_m;			// To TLU : Uncorrectable ECC Error

output		exu_misalign_m;			// To TLU : Misaligned address for Jump,Return
output		exu_oor_va_m;			// To TLU : Address Out of Range
output		exu_tcc_m;			// To TLU : Trap taken
output		exu_tof_m;			// To TLU : Tagged Add TV with overflow
output [7:0]	exu_trap_number_b;		// To TLU

output    	exu_spill_b;                    // To TLU : report window spill exception
output     	exu_fill_m;                     // To TLU : report window fill  exception
output     	exu_normal_b;                   // To TLU : report window spill/fill  exception type
output     	exu_cleanwin_b;	                // To TLU : report clean window exception
output [2:0]	exu_wstate_b;	                // To TLU : report fill/spill vector 

output [7:0]	exu_ccr0;			// To TLU : Architected CCR
output [7:0]	exu_ccr1;			// To TLU : Architected CCR
output [7:0]	exu_ccr2;			// To TLU : Architected CCR
output [7:0]	exu_ccr3;			// To TLU : Architected CCR

output [2:0]	exu_cwp_thr0;                   // To TLU : Current Window Pointer - thr0
output [2:0]	exu_cwp_thr1;                   // To TLU : Current Window Pointer - thr1
output [2:0]	exu_cwp_thr2;                   // To TLU : Current Window Pointer - thr2
output [2:0]	exu_cwp_thr3;                   // To TLU : Current Window Pointer - thr3

output		exu_window_block_m;		// create bubble for SWAP signal for IRF
output		exu_tlu_window_block;		// create bubble for SWAP signal for IRF

output 		exu_test_valid;                 // To PKU : read IRF data 
output [1:0]	exu_test_tid;
output [4:0]	exu_test_addr;

output [1:0]	exu_mbi_irf_fail_;		// MBIST [0] == [63:0];  [1] == [71:64]


// *** DEC_CCR Outputs ***

output		exu_br_taken_e;			// To IFU             : branch is taken
output		exu_br_taken_e1;		// To DEC_DEL and PKU : branch is taken
output		exu_cmov_true_m;

output 		scan_out;
output		wmr_scan_out;



exu_edp_dp   edp (
.scan_in(edp_scanin),
.scan_out(edp_scanout),
.l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .in_rngl_cdbus(in_rngl_cdbus[64:0]),
  .tlu_pc_d(tlu_pc_d[47:2]),
  .dec_inst_d(dec_inst_d[31:0]),
  .dec_thread_group(dec_thread_group),
  .dec_exu_clken(dec_exu_clken),
  .fgu_exu_w_vld_fx5(fgu_exu_w_vld_fx5),
  .fgu_exu_result_fx5(fgu_exu_result_fx5[63:0]),
  .irf_rs1_data_d(irf_rs1_data_d[71:0]),
  .irf_rs2_data_d(irf_rs2_data_d[71:0]),
  .irf_rs3_data_d(irf_rs3_data_d[71:0]),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_exu_ld_data_b(lsu_exu_ld_data_b[63:0]),
  .mbi_write_data_p1(mbi_write_data_p1[7:0]),
  .exu_y_data_e(exu_y_data_e[31:0]),
  .rml_rng_data_out(rml_rng_data_out[5:0]),
  .rml_rng_rd_ctl(rml_rng_rd_ctl[4:0]),
  .rml_rng_ack_ctl(rml_rng_ack_ctl[1:0]),
  .rml_rng_ack_cwp_tid(rml_rng_ack_cwp_tid[1:0]),
  .rml_rng_ack_ecc_tid(rml_rng_ack_ecc_tid[1:0]),
  .rml_rng_ack_det_vld(rml_rng_ack_det_vld),
  .rml_rng_wt_imask_ctl(rml_rng_wt_imask_ctl),
  .rml_irf_ecc_data(rml_irf_ecc_data[7:0]),
  .rml_rng_ack_sel_ctl(rml_rng_ack_sel_ctl),
  .rml_rng_y_data(rml_rng_y_data[31:0]),
  .ect_rng_ccr_data(ect_rng_ccr_data[7:0]),
  .ect_mbist_sel(ect_mbist_sel),
  .ecc_mbist_write_data_p4(ecc_mbist_write_data_p4[7:0]),
  .ect_rs1_early_sel_d(ect_rs1_early_sel_d[4:0]),
  .ect_rs2_early_sel_d(ect_rs2_early_sel_d[4:0]),
  .ect_rs3_early_sel_d(ect_rs3_early_sel_d[4:0]),
  .ect_rs2_imm_sel_d(ect_rs2_imm_sel_d[7:0]),
  .ect_rs1_late_sel_d(ect_rs1_late_sel_d[3:0]),
  .ect_rs2_late_sel_d(ect_rs2_late_sel_d[3:0]),
  .ect_rs3_late_sel_d(ect_rs3_late_sel_d[3:0]),
  .ect_logic_sel_d(ect_logic_sel_d[3:0]),
  .ect_shift_sel_d(ect_shift_sel_d[6:0]),
  .ect_br_taken_z0_e(ect_br_taken_z0_e),
  .ect_br_taken_z1_e(ect_br_taken_z1_e),
  .ect_alignaddress_little_e(ect_alignaddress_little_e),
  .ect_as_clip_e_(ect_as_clip_e_),
  .ect_as_cin_e(ect_as_cin_e),
  .ect_array_sel_e(ect_array_sel_e[1:0]),
  .ect_edge_lmask_e(ect_edge_lmask_e[7:0]),
  .ect_edge_lrmask_e(ect_edge_lrmask_e[7:0]),
  .ect_pstate_am_e(ect_pstate_am_e),
  .ect_rm_early_sel_e(ect_rm_early_sel_e[5:0]),
  .ect_rm_late_sel_e(ect_rm_late_sel_e[2:0]),
  .ect_store_mux_sel_e(ect_store_mux_sel_e),
  .ect_ex_emb_clken(ect_ex_emb_clken),
  .ect_tg_clken(ect_tg_clken),
  .exu_rngl_cdbus(exu_rngl_cdbus[64:0]),
  .exu_br_taken_e(exu_br_taken_e),
  .exu_br_taken_e1(exu_br_taken_e1),
  .exu_address_e(exu_address_e[47:0]),
  .exu_gsr_data_m(exu_gsr_data_m[31:0]),
  .exu_store_data_e(exu_store_data_e[63:0]),
  .exu_ibp_m(exu_ibp_m),
  .exu_trap_number_b(exu_trap_number_b[7:0]),
  .exu_mbi_irf_fail_(exu_mbi_irf_fail_[1:0]),
  .edp_rng_in_ff(edp_rng_in_ff[64:0]),
  .edp_br_flag_e(edp_br_flag_e[1:0]),
  .exu_rs1_data_e(exu_rs1_data_e[63:0]),
  .edp_rcc_data_e(edp_rcc_data_e[63:0]),
  .exu_rs2_data_e(exu_rs2_data_e[63:0]),
  .edp_rs3_data_e(edp_rs3_data_e[63:0]),
  .edp_rcc_ecc_e(edp_rcc_ecc_e[7:0]),
  .edp_rs2_ecc_e(edp_rs2_ecc_e[7:0]),
  .edp_rs3_ecc_e(edp_rs3_ecc_e[7:0]),
  .edp_add_cout64_e(edp_add_cout64_e),
  .edp_add_data_e_b63(edp_add_data_e_b63),
  .edp_add_zdetect_e_(edp_add_zdetect_e_[1:0]),
  .edp_sub_cout64_e(edp_sub_cout64_e),
  .edp_sub_data_e_b63(edp_sub_data_e_b63),
  .edp_sub_data_e_b31(edp_sub_data_e_b31),
  .edp_sub_zdetect_e_(edp_sub_zdetect_e_[1:0]),
  .edp_logical_data_e_b63(edp_logical_data_e_b63),
  .edp_logical_data_e_b31(edp_logical_data_e_b31),
  .edp_lg_zdetect_e(edp_lg_zdetect_e[1:0]),
  .edp_address_m(edp_address_m[63:47]),
  .edp_rd_ff_m(edp_rd_ff_m[63:47]),
  .edp_rd_ff_w(edp_rd_ff_w[63:0]),
  .edp_rd_ff_w2(edp_rd_ff_w2[63:0])
);

exu_ect_ctl  ect (		// FS:wmr_protect
.wmr_scan_in(ect_wmr_scanin),
.wmr_scan_out(ect_wmr_scanout),
.scan_in(ect_scanin),
.scan_out(ect_scanout),
.l2clk(l2clk),
.edp_add_data_e_b0 ( exu_address_e[0]	),
.edp_add_data_e_b1 ( exu_address_e[1]	),
.edp_add_data_e_b31( exu_address_e[31]	),
.edp_rng_in_ff_b57 ( edp_rng_in_ff[57]	),
.edp_rng_in_ff_b56 ( edp_rng_in_ff[56]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_scan_en(tcu_scan_en),
  .dec_tid_p(dec_tid_p[1:0]),
  .dec_inst_rs1_vld_p(dec_inst_rs1_vld_p),
  .dec_inst_rs2_vld_p(dec_inst_rs2_vld_p),
  .dec_inst_rs3_vld_p(dec_inst_rs3_vld_p),
  .dec_inst_rs1_p(dec_inst_rs1_p[4:0]),
  .dec_inst_rs2_p(dec_inst_rs2_p[4:0]),
  .dec_inst_rs3_p(dec_inst_rs3_p[4:0]),
  .dec_inst_rd_d(dec_inst_rd_d[4:0]),
  .dec_inst_d(dec_inst_d[31:5]),
  .dec_decode_d(dec_decode_d),
  .dec_thread_group(dec_thread_group),
  .dec_valid_e(dec_valid_e),
  .tlu_itlb_bypass_e(tlu_itlb_bypass_e),
  .dec_flush_m(dec_flush_m),
  .dec_flush_b(dec_flush_b),
  .fgu_exu_icc_fx5(fgu_exu_icc_fx5[3:0]),
  .fgu_exu_xcc_fx5(fgu_exu_xcc_fx5[1:0]),
  .fgu_exu_cc_vld_fx5(fgu_exu_cc_vld_fx5),
  .fgu_result_tid_fx5(fgu_result_tid_fx5[1:0]),
  .fgu_irf_w_addr_fx5(fgu_irf_w_addr_fx5[4:0]),
  .fgu_exu_w_vld_fx5(fgu_exu_w_vld_fx5),
  .lsu_exu_ld_b(lsu_exu_ld_b),
  .lsu_exu_rd_m(lsu_exu_rd_m[4:0]),
  .lsu_exu_tid_m(lsu_exu_tid_m[2:0]),
  .lsu_exu_ld_vld_w(lsu_exu_ld_vld_w),
  .tlu_flush_exu_b(tlu_flush_exu_b),
  .tlu_ccr(tlu_ccr[7:0]),
  .tlu_ccr_cwp_valid(tlu_ccr_cwp_valid),
  .tlu_ccr_cwp_tid(tlu_ccr_cwp_tid[1:0]),
  .tlu_pstate_am(tlu_pstate_am[3:0]),
  .lsu_exu_pmen(lsu_exu_pmen),
  .spc_core_running_status(spc_core_running_status[3:0]),
  .mbi_run(mbi_run),
  .mbi_addr(mbi_addr[6:0]),
  .mbi_irf_write_en(mbi_irf_write_en),
  .edp_rng_in_ff(edp_rng_in_ff[7:0]),
  .rml_rng_wt_ccr_ctl(rml_rng_wt_ccr_ctl),
  .edp_br_flag_e(edp_br_flag_e[1:0]),
  .exu_rs1_data_e(exu_rs1_data_e[63:0]),
  .exu_rs2_data_e(exu_rs2_data_e[63:0]),
  .edp_add_cout64_e(edp_add_cout64_e),
  .edp_add_data_e_b63(edp_add_data_e_b63),
  .edp_add_zdetect_e_(edp_add_zdetect_e_[1:0]),
  .edp_sub_cout64_e(edp_sub_cout64_e),
  .edp_sub_data_e_b63(edp_sub_data_e_b63),
  .edp_sub_data_e_b31(edp_sub_data_e_b31),
  .edp_sub_zdetect_e_(edp_sub_zdetect_e_[1:0]),
  .edp_logical_data_e_b63(edp_logical_data_e_b63),
  .edp_logical_data_e_b31(edp_logical_data_e_b31),
  .edp_lg_zdetect_e(edp_lg_zdetect_e[1:0]),
  .edp_address_m(edp_address_m[63:47]),
  .edp_rd_ff_m(edp_rd_ff_m[63:47]),
  .exu_ecc_m(exu_ecc_m),
  .rml_test_valid_d(rml_test_valid_d),
  .fgu_fld_fcc_fx3(fgu_fld_fcc_fx3[7:0]),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .fgu_fld_fcc_vld_fx3(fgu_fld_fcc_vld_fx3[1:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_tid_fx2(fgu_cmp_fcc_tid_fx2[2:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0]),
  .dec_pick_d(dec_pick_d[3:0]),
  .exu_mdp_mux_sel_e(exu_mdp_mux_sel_e[5:0]),
  .exu_ms_icc_e(exu_ms_icc_e),
  .exu_gsr_vld_m(exu_gsr_vld_m[1:0]),
  .exu_cmov_true_m(exu_cmov_true_m),
  .exu_lsu_va_error_m(exu_lsu_va_error_m),
  .exu_misalign_m(exu_misalign_m),
  .exu_oor_va_m(exu_oor_va_m),
  .exu_tcc_m(exu_tcc_m),
  .exu_tof_m(exu_tof_m),
  .exu_ccr0(exu_ccr0[7:0]),
  .exu_ccr1(exu_ccr1[7:0]),
  .exu_ccr2(exu_ccr2[7:0]),
  .exu_ccr3(exu_ccr3[7:0]),
  .ect_mbist_sel(ect_mbist_sel),
  .ect_rs1_early_sel_d(ect_rs1_early_sel_d[4:0]),
  .ect_rs2_early_sel_d(ect_rs2_early_sel_d[4:0]),
  .ect_rs3_early_sel_d(ect_rs3_early_sel_d[4:0]),
  .ect_rs2_imm_sel_d(ect_rs2_imm_sel_d[7:0]),
  .ect_rs1_late_sel_d(ect_rs1_late_sel_d[3:0]),
  .ect_rs2_late_sel_d(ect_rs2_late_sel_d[3:0]),
  .ect_rs3_late_sel_d(ect_rs3_late_sel_d[3:0]),
  .ect_logic_sel_d(ect_logic_sel_d[3:0]),
  .ect_shift_sel_d(ect_shift_sel_d[6:0]),
  .ect_br_taken_z0_e(ect_br_taken_z0_e),
  .ect_br_taken_z1_e(ect_br_taken_z1_e),
  .ect_alignaddress_little_e(ect_alignaddress_little_e),
  .ect_as_clip_e_(ect_as_clip_e_),
  .ect_as_cin_e(ect_as_cin_e),
  .ect_array_sel_e(ect_array_sel_e[1:0]),
  .ect_edge_lmask_e(ect_edge_lmask_e[7:0]),
  .ect_edge_lrmask_e(ect_edge_lrmask_e[7:0]),
  .ect_pstate_am_e(ect_pstate_am_e),
  .ect_rm_early_sel_e(ect_rm_early_sel_e[5:0]),
  .ect_rm_late_sel_e(ect_rm_late_sel_e[2:0]),
  .ect_store_mux_sel_e(ect_store_mux_sel_e),
  .ect_tid_lth_e(ect_tid_lth_e[1:0]),
  .ect_rs1_addr_e(ect_rs1_addr_e[4:0]),
  .ect_rs2_addr_e(ect_rs2_addr_e[4:0]),
  .ect_rs3_addr_e(ect_rs3_addr_e[4:0]),
  .ect_rs1_valid_e(ect_rs1_valid_e),
  .ect_rs2_valid_e(ect_rs2_valid_e),
  .ect_rs3_valid_e(ect_rs3_valid_e),
  .ect_two_cycle_m(ect_two_cycle_m),
  .ect_rd_lth_w(ect_rd_lth_w[4:0]),
  .ect_rd_lth_w2(ect_rd_lth_w2[4:0]),
  .ect_tid_lth_w(ect_tid_lth_w[1:0]),
  .ect_tid_lth_w2(ect_tid_lth_w2[1:0]),
  .ect_valid_lth_w(ect_valid_lth_w),
  .ect_valid_in_w2(ect_valid_in_w2),
  .ect_yreg_wr_w(ect_yreg_wr_w),
  .ect_rng_ccr_data(ect_rng_ccr_data[7:0]),
  .ect_misaligned_error_m(ect_misaligned_error_m),
  .ect_ex_emb_clken(ect_ex_emb_clken),
  .ect_tg_clken(ect_tg_clken)
);

exu_ecc_ctl  ecc (
.scan_in(ecc_scanin),
.scan_out(ecc_scanout),
.l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .ect_mbist_sel(ect_mbist_sel),
  .mbi_write_data_p1(mbi_write_data_p1[7:0]),
  .edp_rd_ff_w(edp_rd_ff_w[63:0]),
  .edp_rd_ff_w2(edp_rd_ff_w2[63:0]),
  .tlu_cerer_irf(tlu_cerer_irf),
  .tlu_ceter_pscce(tlu_ceter_pscce[3:0]),
  .lsu_asi_error_inject_b31(lsu_asi_error_inject_b31),
  .lsu_asi_error_inject_b25(lsu_asi_error_inject_b25),
  .lsu_asi_error_inject(lsu_asi_error_inject[7:0]),
  .ecc_w_synd_w(ecc_w_synd_w[7:0]),
  .ecc_w2_synd_w2(ecc_w2_synd_w2[7:0]),
  .ecc_mbist_write_data_p4(ecc_mbist_write_data_p4[7:0]),
  .ect_ex_emb_clken(ect_ex_emb_clken),
  .ect_tg_clken(ect_tg_clken),
  .ect_tid_lth_e(ect_tid_lth_e[1:0]),
  .ect_rs1_valid_e(ect_rs1_valid_e),
  .ect_rs2_valid_e(ect_rs2_valid_e),
  .ect_rs3_valid_e(ect_rs3_valid_e),
  .ect_two_cycle_m(ect_two_cycle_m),
  .ect_rs1_addr_e(ect_rs1_addr_e[4:0]),
  .ect_rs2_addr_e(ect_rs2_addr_e[4:0]),
  .ect_rs3_addr_e(ect_rs3_addr_e[4:0]),
  .edp_rcc_data_e(edp_rcc_data_e[63:0]),
  .exu_rs2_data_e(exu_rs2_data_e[63:0]),
  .edp_rs3_data_e(edp_rs3_data_e[63:0]),
  .edp_rcc_ecc_e(edp_rcc_ecc_e[7:0]),
  .edp_rs2_ecc_e(edp_rs2_ecc_e[7:0]),
  .edp_rs3_ecc_e(edp_rs3_ecc_e[7:0]),
  .dec_valid_e(dec_valid_e),
  .dec_flush_m(dec_flush_m),
  .exu_ecc_check_m(exu_ecc_check_m[7:0]),
  .exu_ecc_addr_m(exu_ecc_addr_m[4:0]),
  .exu_ecc_m(exu_ecc_m),
  .exu_cecc_m(exu_cecc_m),
  .exu_uecc_m(exu_uecc_m)
);

exu_rml_ctl  rml (		// FS:wmr_protect
.wmr_scan_in(rml_wmr_scanin),
.wmr_scan_out(rml_wmr_scanout),
.scan_in(rml_scanin),
.scan_out(rml_scanout),
.l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .spc_aclk_wmr(spc_aclk_wmr),
  .tcu_scan_en(tcu_scan_en),
  .dec_tid_p(dec_tid_p[1:0]),
  .dec_inst_d(dec_inst_d[31:13]),
  .dec_valid_e(dec_valid_e),
  .dec_thread_group(dec_thread_group),
  .tlu_flush_exu_b(tlu_flush_exu_b),
  .dec_flush_m(dec_flush_m),
  .dec_flush_b(dec_flush_b),
  .tlu_gl_thr0(tlu_gl_thr0[1:0]),
  .tlu_gl_thr1(tlu_gl_thr1[1:0]),
  .tlu_gl_thr2(tlu_gl_thr2[1:0]),
  .tlu_gl_thr3(tlu_gl_thr3[1:0]),
  .tlu_ccr_cwp_valid(tlu_ccr_cwp_valid),
  .tlu_ccr_cwp_tid(tlu_ccr_cwp_tid[1:0]),
  .tlu_cwp(tlu_cwp[2:0]),
  .mbi_run(mbi_run),
  .mbi_addr(mbi_addr[9:0]),
  .mbi_irf_read_en(mbi_irf_read_en),
  .mbi_irf_save_en(mbi_irf_save_en),
  .mbi_irf_restore_en(mbi_irf_restore_en),
  .edp_rng_in_ff(edp_rng_in_ff[64:0]),
  .edp_rd_ff_w(edp_rd_ff_w[63:32]),
  .ect_misaligned_error_m(ect_misaligned_error_m),
  .ect_yreg_wr_w(ect_yreg_wr_w),
  .ect_tid_lth_w(ect_tid_lth_w[1:0]),
  .exu_lsu_va_error_m(exu_lsu_va_error_m),
  .exu_ecc_m(exu_ecc_m),
  .edp_rs3_ecc_e(edp_rs3_ecc_e[7:0]),
  .ect_tg_clken(ect_tg_clken),
  .exu_y_data_e(exu_y_data_e[31:0]),
  .exu_fill_m(exu_fill_m),
  .exu_spill_b(exu_spill_b),
  .exu_normal_b(exu_normal_b),
  .exu_cleanwin_b(exu_cleanwin_b),
  .exu_wstate_b(exu_wstate_b[2:0]),
  .exu_cwp_thr0(exu_cwp_thr0[2:0]),
  .exu_cwp_thr1(exu_cwp_thr1[2:0]),
  .exu_cwp_thr2(exu_cwp_thr2[2:0]),
  .exu_cwp_thr3(exu_cwp_thr3[2:0]),
  .exu_oddwin_b(exu_oddwin_b[3:0]),
  .exu_window_block_m(exu_window_block_m),
  .exu_tlu_window_block(exu_tlu_window_block),
  .exu_ecc_winop_flush_m(exu_ecc_winop_flush_m),
  .exu_test_valid(exu_test_valid),
  .exu_test_tid(exu_test_tid[1:0]),
  .exu_test_addr(exu_test_addr[4:0]),
  .rml_test_valid_d(rml_test_valid_d),
  .rml_rng_data_out(rml_rng_data_out[5:0]),
  .rml_rng_rd_ctl(rml_rng_rd_ctl[4:0]),
  .rml_rng_ack_ctl(rml_rng_ack_ctl[1:0]),
  .rml_rng_ack_cwp_tid(rml_rng_ack_cwp_tid[1:0]),
  .rml_rng_ack_ecc_tid(rml_rng_ack_ecc_tid[1:0]),
  .rml_rng_ack_det_vld(rml_rng_ack_det_vld),
  .rml_rng_wt_imask_ctl(rml_rng_wt_imask_ctl),
  .rml_rng_wt_ccr_ctl(rml_rng_wt_ccr_ctl),
  .rml_irf_ecc_data(rml_irf_ecc_data[7:0]),
  .rml_rng_ack_sel_ctl(rml_rng_ack_sel_ctl),
  .rml_rng_y_data(rml_rng_y_data[31:0]),
  .rml_irf_cwpswap_tid_m(rml_irf_cwpswap_tid_m[1:0]),
  .rml_irf_old_lo_cwp_m(rml_irf_old_lo_cwp_m[2:0]),
  .rml_irf_old_e_cwp_m(rml_irf_old_e_cwp_m[2:1]),
  .rml_irf_cwpswap_tid_b(rml_irf_cwpswap_tid_b[1:0]),
  .rml_irf_new_lo_cwp_b(rml_irf_new_lo_cwp_b[2:0]),
  .rml_irf_new_e_cwp_b(rml_irf_new_e_cwp_b[2:1]),
  .rml_irf_save_even_m(rml_irf_save_even_m),
  .rml_irf_save_odd_m(rml_irf_save_odd_m),
  .rml_irf_save_local_m(rml_irf_save_local_m),
  .rml_irf_restore_even_b(rml_irf_restore_even_b),
  .rml_irf_restore_odd_b(rml_irf_restore_odd_b),
  .rml_irf_restore_local_b(rml_irf_restore_local_b),
  .rml_irf_global_tid(rml_irf_global_tid[1:0]),
  .rml_irf_global_tid_ff(rml_irf_global_tid_ff[1:0]),
  .rml_irf_old_agp(rml_irf_old_agp[1:0]),
  .rml_irf_new_agp_ff(rml_irf_new_agp_ff[1:0]),
  .rml_irf_save_global(rml_irf_save_global),
  .rml_irf_restore_global(rml_irf_restore_global)
);




 
//     Note    : All IRF READ/WRITE/SAVE/RESTORE pins are flopped inside the IRF.
//     Note    : The save and restore have one full cycle to decode.  The actual save or restore will occur in the 1st phase of the cycle after decode.
//     Note    : The READ and WRITE decode in the 1st phase and the actual read/write occurs in the 2nd phase.

//     Note    : To delay a signal in a 0in assertion : use    "$0in_delay(signal_name,# of cycles)"     example $0in_delay(a_wr_en_p0,1)


// 0. N2 : Read and Write without bypassing
// 1. N1 : WRITE p0 and WRITE p1 to the same TID in the same cycle
// 2. N2 : Any WRITE   port followed by a SAVE    in the 1st phase of next cycle (coded as the SAVE    pins the same  cycle as the WRITE pins)
// 3. N1 : Any WRITE   port followed by a RESTORE in the 1st phase of next cycle (coded as the RESTORE pins the same  cycle as the WRITE pins)
// 4. N1 : Any READ    port followed by a SAVE    in the 1st phase of next cycle (coded as the SAVE    pins the same  cycle as the READ  pins)
// 5. N1 : Any READ    port followed by a RESTORE in the 1st phase of next cycle (coded as the RESTORE pins the same  cycle as the READ  pins)
// 6. N2 : Any SAVE    port followed by a READ    in the              same cycle (coded as the SAVE    pins one cycle ahead of the READ  pins)
// 7. N2 : Any RESTORE port followed by a READ    in the              same cycle (coded as the RESTORE pins one cycle ahead of the READ  pins)
// 8. N2 : Any SAVE    port followed by a WRITE   in the              same cycle (coded as the SAVE    pins one cycle ahead as the WRITE pins)
// 9. N2 : Any RESTORE port followed by a WRITE   in the              same cycle (coded as the RESTORE pins one cycle ahead as the WRITE pins)


// #0
// 0in custom -fire ( $0in_delay((dec_inst_rs1_vld_p & ect_valid_lth_w & (dec_tid_p[1:0] == ect_tid_lth_w[1:0])  & (dec_inst_rs1_p[4:0] == ect_rd_lth_w[4:0] )),1) & (ect_rs1_late_sel_d[3:1] == 3'b000 )) -message "IRF p0 write & p0 read without bypass" -group core_array
// 0in custom -fire ( $0in_delay((dec_inst_rs2_vld_p & ect_valid_lth_w & (dec_tid_p[1:0] == ect_tid_lth_w[1:0])  & (dec_inst_rs2_p[4:0] == ect_rd_lth_w[4:0] )),1) & (ect_rs2_late_sel_d[3:0] == 4'b0000)) -message "IRF p0 write & p1 read without bypass" -group core_array
// 0in custom -fire ( $0in_delay((dec_inst_rs3_vld_p & ect_valid_lth_w & (dec_tid_p[1:0] == ect_tid_lth_w[1:0])  & (dec_inst_rs3_p[4:0] == ect_rd_lth_w[4:0] )),1) & (ect_rs3_late_sel_d[3:0] == 4'b0000)) -message "IRF p0 write & p2 read without bypass" -group core_array
// 0in custom -fire ( $0in_delay((dec_inst_rs1_vld_p & ect_valid_in_w2 & (dec_tid_p[1:0] == ect_tid_lth_w2[1:0]) & (dec_inst_rs1_p[4:0] == ect_rd_lth_w2[4:0])),1) & (ect_rs1_late_sel_d[3:1] == 3'b000 )) -message "IRF p1 write & p0 read without bypass" -group core_array
// 0in custom -fire ( $0in_delay((dec_inst_rs2_vld_p & ect_valid_in_w2 & (dec_tid_p[1:0] == ect_tid_lth_w2[1:0]) & (dec_inst_rs2_p[4:0] == ect_rd_lth_w2[4:0])),1) & (ect_rs2_late_sel_d[3:0] == 4'b0000)) -message "IRF p1 write & p1 read without bypass" -group core_array
// 0in custom -fire ( $0in_delay((dec_inst_rs3_vld_p & ect_valid_in_w2 & (dec_tid_p[1:0] == ect_tid_lth_w2[1:0]) & (dec_inst_rs3_p[4:0] == ect_rd_lth_w2[4:0])),1) & (ect_rs3_late_sel_d[3:0] == 4'b0000)) -message "IRF p1 write & p2 read without bypass" -group core_array

// #1
// 0in custom -fire (ect_valid_lth_w &  ect_valid_in_w2                                            & (ect_tid_lth_w[1:0]  == ect_tid_lth_w2[1:0])           ) -message "IRF p0 & p1 ports wrote to same TID" -group core_array

// #2
// 0in custom -fire (ect_valid_lth_w & (rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ) & (ect_tid_lth_w[1:0]  == rml_irf_cwpswap_tid_m[1:0])) -message "IRF p0 write & save            to same TID" -group core_array
// 0in custom -fire (ect_valid_in_w2 & (rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ) & (ect_tid_lth_w2[1:0] == rml_irf_cwpswap_tid_m[1:0])) -message "IRF p1 write & save            to same TID" -group core_array
// 0in custom -fire (ect_valid_lth_w &  rml_irf_save_global                                                       & (ect_tid_lth_w[1:0]  == rml_irf_global_tid[1:0])   ) -message "IRF p0 write & save     global to same TID" -group core_array
// 0in custom -fire (ect_valid_in_w2 &  rml_irf_save_global                                                       & (ect_tid_lth_w2[1:0] == rml_irf_global_tid[1:0])   ) -message "IRF p1 write & save     global to same TID" -group core_array

// #3
// 0in custom -fire (ect_valid_lth_w & (rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b) & (ect_tid_lth_w[1:0]  == rml_irf_cwpswap_tid_b[1:0])) -message "IRF p0 write & restore        to same TID" -group core_array
// 0in custom -fire (ect_valid_in_w2 & (rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b) & (ect_tid_lth_w2[1:0] == rml_irf_cwpswap_tid_b[1:0])) -message "IRF p1 write & restore        to same TID" -group core_array
// 0in custom -fire (ect_valid_lth_w &  rml_irf_restore_global                                                    & (ect_tid_lth_w[1:0]  == rml_irf_global_tid_ff[1:0])) -message "IRF p0 write & restore global to same TID" -group core_array
// 0in custom -fire (ect_valid_in_w2 &  rml_irf_restore_global                                                    & (ect_tid_lth_w2[1:0] == rml_irf_global_tid_ff[1:0])) -message "IRF p1 write & restore global to same TID" -group core_array

// #4
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & (rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_m[1:0])),2))) -message "IRF p0 read  & save           to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p &  rml_irf_save_global                                                       & (dec_tid_p[1:0] == rml_irf_global_tid[1:0]   )),2))) -message "IRF p0 read  & save    global to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & (rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_m[1:0])),2))) -message "IRF p1 read  & save           to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p &  rml_irf_save_global                                                       & (dec_tid_p[1:0] == rml_irf_global_tid[1:0]   )),2))) -message "IRF p1 read  & save    global to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & (rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_m[1:0])),2))) -message "IRF p2 read  & save           to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p &  rml_irf_save_global                                                       & (dec_tid_p[1:0] == rml_irf_global_tid[1:0]   )),2))) -message "IRF p2 read  & save    global to same TID" -group core_array


// #5
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & (rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_b[1:0])),2))) -message "IRF p0 read  & restore        to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p &  rml_irf_restore_global                                                    & (dec_tid_p[1:0] == rml_irf_global_tid_ff[1:0])),2))) -message "IRF p0 read  & restore global to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & (rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_b[1:0])),2))) -message "IRF p1 read  & restore        to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p &  rml_irf_restore_global                                                    & (dec_tid_p[1:0] == rml_irf_global_tid_ff[1:0])),2))) -message "IRF p1 read  & restore global to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & (rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b) & (dec_tid_p[1:0] == rml_irf_cwpswap_tid_b[1:0])),2))) -message "IRF p2 read  & restore        to same TID" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p &  rml_irf_restore_global                                                    & (dec_tid_p[1:0] == rml_irf_global_tid_ff[1:0])),2))) -message "IRF p2 read  & restore global to same TID" -group core_array


// #6
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & $0in_delay((rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_m[1:0],1))),2))) -message "IRF p0 read  & save           to same TID in same cycle" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & $0in_delay( rml_irf_save_global                                                      ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid[1:0]   ,1))),2))) -message "IRF p0 read  & save    global to same TID in same cycle" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & $0in_delay((rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_m[1:0],1))),2))) -message "IRF p1 read  & save           to same TID in same cycle" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & $0in_delay( rml_irf_save_global                                                      ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid[1:0]   ,1))),2))) -message "IRF p1 read  & save    global to same TID in same cycle" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & $0in_delay((rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_m[1:0],1))),2))) -message "IRF p2 read  & save           to same TID in same cycle" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & $0in_delay( rml_irf_save_global                                                      ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid[1:0]   ,1))),2))) -message "IRF p2 read  & save    global to same TID in same cycle" -group core_array


// #7    fails isa3_scratchpad_f2.s single thread at 130000
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & $0in_delay((rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_b[1:0],1))),2))) -message "IRF p0 read  & restore        to same TID in same cycle" -name "EXU_7a" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs1_vld_p & $0in_delay( rml_irf_restore_global                                                   ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid_ff[1:0],1))),2))) -message "IRF p0 read  & restore global to same TID in same cycle" -name "EXU_7b" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & $0in_delay((rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_b[1:0],1))),2))) -message "IRF p1 read  & restore        to same TID in same cycle" -name "EXU_7c" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs2_vld_p & $0in_delay( rml_irf_restore_global                                                   ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid_ff[1:0],1))),2))) -message "IRF p1 read  & restore global to same TID in same cycle" -name "EXU_7d" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & $0in_delay((rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b),1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_cwpswap_tid_b[1:0],1))),2))) -message "IRF p2 read  & restore        to same TID in same cycle" -name "EXU_7e" -group core_array
// 0in custom -fire (dec_valid_e & ($0in_delay((dec_inst_rs3_vld_p & $0in_delay( rml_irf_restore_global                                                   ,1) & (dec_tid_p[1:0] == $0in_delay(rml_irf_global_tid_ff[1:0],1))),2))) -message "IRF p2 read  & restore global to same TID in same cycle" -name "EXU_7f" -group core_array


// #8
// 0in custom -fire (ect_valid_lth_w & $0in_delay((rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ),1) & (ect_tid_lth_w[1:0]  == $0in_delay(rml_irf_cwpswap_tid_m[1:0],1))) -message "IRF p0 write & save            to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_in_w2 & $0in_delay((rml_irf_save_odd_m    | rml_irf_save_local_m    | rml_irf_save_even_m   ),1) & (ect_tid_lth_w2[1:0] == $0in_delay(rml_irf_cwpswap_tid_m[1:0],1))) -message "IRF p1 write & save            to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_lth_w & $0in_delay( rml_irf_save_global                                                      ,1) & (ect_tid_lth_w[1:0]  == $0in_delay(rml_irf_global_tid[1:0]   ,1))) -message "IRF p0 write & save     global to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_in_w2 & $0in_delay( rml_irf_save_global                                                      ,1) & (ect_tid_lth_w2[1:0] == $0in_delay(rml_irf_global_tid[1:0]   ,1))) -message "IRF p1 write & save     global to same TID in same cycle" -group core_array

// #9
// 0in custom -fire (ect_valid_lth_w & $0in_delay((rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b),1) & (ect_tid_lth_w[1:0]  == $0in_delay(rml_irf_cwpswap_tid_b[1:0],1))) -message "IRF p0 write & restore        to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_in_w2 & $0in_delay((rml_irf_restore_odd_b | rml_irf_restore_local_b | rml_irf_restore_even_b),1) & (ect_tid_lth_w2[1:0] == $0in_delay(rml_irf_cwpswap_tid_b[1:0],1))) -message "IRF p1 write & restore        to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_lth_w & $0in_delay( rml_irf_restore_global                                                   ,1) & (ect_tid_lth_w[1:0]  == $0in_delay(rml_irf_global_tid_ff[1:0],1))) -message "IRF p0 write & restore global to same TID in same cycle" -group core_array
// 0in custom -fire (ect_valid_in_w2 & $0in_delay( rml_irf_restore_global                                                   ,1) & (ect_tid_lth_w2[1:0] == $0in_delay(rml_irf_global_tid_ff[1:0],1))) -message "IRF p1 write & restore global to same TID in same cycle" -group core_array


n2_irf_mp_128x72_cust irf (

  .scan_in(irf_scanin),
  .scan_out(irf_scanout),
  .l2clk			( l2clk							),
  .tcu_pce_ov			( tcu_pce_ov						),
  .tcu_aclk			( spc_aclk						),
  .tcu_bclk			( spc_bclk						),
  .clken			( ect_tg_clken						),

  .rd_tid			( dec_tid_p[1:0]					),
  .rd_addr_p0			( dec_inst_rs1_p[4:0]					),
  .rd_addr_p1			( dec_inst_rs2_p[4:0]					),
  .rd_addr_p2			( dec_inst_rs3_p[4:0]					),
  .rd_en_p0			( dec_inst_rs1_vld_p					),
  .rd_en_p1			( dec_inst_rs2_vld_p					),
  .rd_en_p2			( dec_inst_rs3_vld_p					),

  .wr_en_p0			( ect_valid_lth_w					),
  .wr_tid_p0			( ect_tid_lth_w[1:0]					),
  .wr_addr_p0			( ect_rd_lth_w[4:0]					),
  .wr_data_p0			({ecc_w_synd_w[7:0]   , edp_rd_ff_w[63:0]}		),
  .wr_en_p1			( ect_valid_in_w2					),
  .wr_tid_p1			( ect_tid_lth_w2[1:0]					),
  .wr_addr_p1			( ect_rd_lth_w2[4:0]					),
  .wr_data_p1			({ecc_w2_synd_w2[7:0] , edp_rd_ff_w2[63:0]}		),

  .save_tid			( rml_irf_cwpswap_tid_m[1:0]       			),
  .save_local_addr	 	( rml_irf_old_lo_cwp_m[2:0]           			),
  .save_even_addr       	( rml_irf_old_e_cwp_m[2:1]            			),
  .save_odd_addr	       	( rml_irf_old_lo_cwp_m[2:1]           			),
  .save_even_en		  	( rml_irf_save_even_m            			),
  .save_odd_en		   	( rml_irf_save_odd_m             			),
  .save_local_en	 	( rml_irf_save_local_m           			),

  .restore_tid			( rml_irf_cwpswap_tid_b[1:0]       			),
  .restore_local_addr		( rml_irf_new_lo_cwp_b[2:0]           			),
  .restore_even_addr       	( rml_irf_new_e_cwp_b[2:1]            			),
  .restore_odd_addr       	( rml_irf_new_lo_cwp_b[2:1]           			),
  .restore_even_en	  	( rml_irf_restore_even_b            			),
  .restore_odd_en	   	( rml_irf_restore_odd_b             			),
  .restore_local_en	 	( rml_irf_restore_local_b           			),

  .save_global_en	  	( rml_irf_save_global            			),
  .save_global_tid	   	( rml_irf_global_tid[1:0]             			),
  .save_global_addr     	( rml_irf_old_agp[1:0]                			),

  .restore_global_en	  	( rml_irf_restore_global            			),
  .restore_global_tid	   	( rml_irf_global_tid_ff[1:0]         			),
  .restore_global_addr      	( rml_irf_new_agp_ff[1:0]                		),


	.dout_p0			( irf_rs1_data_d[71:0]					),
	.dout_p1			( irf_rs2_data_d[71:0]					),
	.dout_p2			( irf_rs3_data_d[71:0]					),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in));


//********************************************************************************
//
//                             Instruction Notes
//
//
//  Opcode         Page   FUNCTION                     Comments                        Implementation
//  ------         ----   ------------------------     -----------------------         --------------
//	           
//                                       Add/Sub
//	           
//  ADD            135     rs1 +  rs2
//  ADDcc          135     rs1 +  rs2                              CCR.icc,xcc
//  ADDC           135     rs1 +  rs2       + icc.c    		    
//  ADDCcc         135     rs1 +  rs2       + icc.c                CCR.icc,xcc
//  ADDi           135     rs1 +  sext(imm)            imm=[12:0]	    
//  ADDcci         135     rs1 +  sext(imm)            imm=[12:0]  CCR.icc,xcc
//  ADDCi          135     rs1 +  sext(imm) + icc.c    imm=[12:0]	    
//  ADDCcci        135     rs1 +  sext(imm) + icc.c    imm=[12:0]  CCR.icc,xcc
//	           
//  SUB            230     rs1 -  rs2
//  SUBcc          230     rs1 -  rs2                              CCR.icc,xcc
//  SUBC           230     rs1 -  rs2       + icc.c    		    
//  SUBCcc         230     rs1 -  rs2       + icc.c                CCR.icc,xcc
//  SUBi           230     rs1 -  sext(imm)            imm=[12:0]	    
//  SUBcci         230     rs1 -  sext(imm)            imm=[12:0]  CCR.icc,xcc
//  SUBCi          230     rs1 -  sext(imm) + icc.c    imm=[12:0]	    
//  SUBCcci        230     rs1 -  sext(imm) + icc.c    imm=[12:0]  CCR.icc,xcc
//	           
//	           
//                                       Logical
//	           
//  AND            181     rs1 &  rs2                                                  lg_sel=1000
//  ANDcc          181     rs1 &  rs2                              CCR.icc,xcc         lg_sel=1000
//  ANDN           181     rs1 & ~rs2	                                                 lg_sel=0100
//  ANDNcc         181     rs1 & ~rs2                              CCR.icc,xcc         lg_sel=0100
//  OR             181     rs1 |  rs2                                                  lg_sel=1110
//  ORcc           181     rs1 |  rs2                              CCR.icc,xcc         lg_sel=1110
//  ORN            181     rs1 | ~rs2	                                                 lg_sel=1101
//  ORNcc          181     rs1 | ~rs2                              CCR.icc,xcc         lg_sel=1101
//  XOR            181     rs1 ^  rs2                           	                 lg_sel=0110
//  XORcc          181     rs1 ^  rs2                              CCR.icc,xcc         lg_sel=0110
//  XORN           181     rs1 ^ ~rs2                                                  lg_sel=1001
//  XORNcc         181     rs1 ^ ~rs2                              CCR.icc,xcc         lg_sel=1001
//  ANDi           181     rs1 &  sext(imm)            imm=[12:0]                      lg_sel=1000
//  ANDcci         181     rs1 &  sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=1000
//  ANDNi          181     rs1 & ~sext(imm)            imm=[12:0]                      lg_sel=0100
//  ANDNcci        181     rs1 & ~sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=0100
//  ORi            181     rs1 |  sext(imm)            imm=[12:0]                      lg_sel=1110
//  ORcci          181     rs1 |  sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=1110
//  ORNi           181     rs1 | ~sext(imm)            imm=[12:0]                      lg_sel=1101
//  ORNcci         181     rs1 | ~sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=1101
//  XORi           181     rs1 ^  sext(imm)            imm=[12:0] 	                 lg_sel=0110
//  XORcci         181     rs1 ^  sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=0110
//  XORNi          181     rs1 ^ ~sext(imm)            imm=[12:0]                      lg_sel=1001
//  XORNcci        181     rs1 ^ ~sext(imm)            imm=[12:0]  CCR.icc,xcc         lg_sel=1001
//	           
//  SETHI          217     {32'b0,imm[21:0],10'b0}     NOP if rd=0 & imm=0
//	           
//	           
//                                       Shift
//	           
//  SLL            218     shift_left(rs1)  fill w/ 0  sa=rs2[4:0]                     sh_sel=0100001
//  SRL            218     shift_right(rs1) fill w/ 0  sa=rs2[4:0] rd[63:32]=32'b0     sh_sel=1000001
//  SRA            218     shift_right(rs1) w/ sext    sa=rs2[4:0] rd[63:32]=rs1[31]   sh_sel=1001001
//  SLLX           218     shift_left(rs1)  fill w/ 0  sa=rs2[5:0]                     sh_sel=0100010
//  SRLX           218     shift_right(rs1) fill w/ 0  sa=rs2[5:0]                     sh_sel=1000100
//  SRAX           218     shift_right(rs1) w/ sext    sa=rs2[5:0]                     sh_sel=1010100
//	           
//  SLLi           218     shift_left(rs1)  fill w/ 0  sa=rs2[4:0]                     sh_sel=0100001
//  SRLi           218     shift_right(rs1) fill w/ 0  sa=rs2[4:0] rd[63:32]=32'b0     sh_sel=1000001
//  SRAi           218     shift_right(rs1) w/ sext    sa=rs2[4:0] rd[63:32]=rs1[31]   sh_sel=1001001
//  SLLXi          218     shift_left(rs1)  fill w/ 0  sa=rs2[5:0]                     sh_sel=0100010
//  SRLXi          218     shift_right(rs1) fill w/ 0  sa=rs2[5:0]                     sh_sel=1000100
//  SRAXi          218     shift_right(rs1) w/ sext    sa=rs2[5:0]                     sh_sel=1010100
//	           
//                 VIS
//  EDGE8          70      Eight  8-bit Edge
//  EDGE8N         70      Eight  8-bit Edge; no CC
//  EDGE8L         70      Eight  8-bit Edge;        Little-Endian
//  EDGE8LN        70      Eight  8-bit Edge; no CC; Little-Endian
//  EDGE16         70      Four  16-bit Edge
//  EDGE16N        70      Four  16-bit Edge; no CC
//  EDGE16L        70      Four  16-bit Edge;        Little-Endian
//  EDGE16LN       70      Four  16-bit Edge; no CC; Little-Endian
//  EDGE32         70      Two   32-bit Edge
//  EDGE32N        70      Two   32-bit Edge; no CC
//  EDGE32L        70      Two   32-bit Edge;        Little-Endian
//  EDGE32LN       70      Two   32-bit Edge; no CC; Little-Endian
//	           
//	           
//  ARRAY8         74      Convert  8-bit 3-D addres to blocked byte address
//  ARRAY16        74      Convert 16-bit 3-D addres to blocked byte address
//  ARRAY32        74      Convert 32-bit 3-D addres to blocked byte address
//
//
//  ALIGNADDRESS   55      RD = rs1 + rs2; clip low 3 bits;  GSR <-  low  3 bits
//  ALIGNADDRESS-little    RD = rs1 + rs2; clip low 3 bits;  GSR <- ~low  3 bits
//  BMASK          55      RD = rs1 + rs2; clip low 3 bits;  GSR <-  low 32 bits



// fixscan start:
assign edp_scanin                = scan_in                  ;
assign ect_scanin                = edp_scanout              ;
assign ecc_scanin                = ect_scanout              ;
assign rml_scanin                = ecc_scanout              ;
assign irf_scanin                = rml_scanout              ;
assign scan_out                  = irf_scanout              ;

assign ect_wmr_scanin            = wmr_scan_in              ;
assign rml_wmr_scanin            = ect_wmr_scanout          ;
assign wmr_scan_out              = rml_wmr_scanout          ;
// fixscan end:
endmodule

