// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: exu_edp_dp.v
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
module exu_edp_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_dectest, 
  tcu_muxtest, 
  in_rngl_cdbus, 
  tlu_pc_d, 
  dec_inst_d, 
  dec_thread_group, 
  dec_exu_clken, 
  fgu_exu_w_vld_fx5, 
  fgu_exu_result_fx5, 
  irf_rs1_data_d, 
  irf_rs2_data_d, 
  irf_rs3_data_d, 
  lsu_asi_clken, 
  lsu_exu_ld_data_b, 
  mbi_write_data_p1, 
  exu_y_data_e, 
  rml_rng_data_out, 
  rml_rng_rd_ctl, 
  rml_rng_ack_ctl, 
  rml_rng_ack_cwp_tid, 
  rml_rng_ack_ecc_tid, 
  rml_rng_ack_det_vld, 
  rml_rng_wt_imask_ctl, 
  rml_irf_ecc_data, 
  rml_rng_ack_sel_ctl, 
  rml_rng_y_data, 
  ect_rng_ccr_data, 
  ect_mbist_sel, 
  ecc_mbist_write_data_p4, 
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
  ect_ex_emb_clken, 
  ect_tg_clken, 
  exu_rngl_cdbus, 
  exu_br_taken_e, 
  exu_br_taken_e1, 
  exu_address_e, 
  exu_gsr_data_m, 
  exu_store_data_e, 
  exu_ibp_m, 
  exu_trap_number_b, 
  exu_mbi_irf_fail_, 
  edp_rng_in_ff, 
  edp_br_flag_e, 
  exu_rs1_data_e, 
  edp_rcc_data_e, 
  exu_rs2_data_e, 
  edp_rs3_data_e, 
  edp_rcc_ecc_e, 
  edp_rs2_ecc_e, 
  edp_rs3_ecc_e, 
  edp_add_cout64_e, 
  edp_add_data_e_b63, 
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
  edp_rd_ff_w, 
  edp_rd_ff_w2, 
  scan_out);
wire stop;
wire test;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [63:0] rd_ff_m;
wire [63:0] rd_ff_b;
wire [63:0] rd_ff_w_plus1;
wire [63:0] rd_ff_w2_plus1;
wire [63:0] early_rs1_data;
wire i_bp_ff_rcc_scanin;
wire i_bp_ff_rcc_scanout;
wire [63:0] rd_data_e;
wire [71:0] rcc_data_e;
wire [4:0] rs1_psel;
wire i_bp_ff_rs1_scanin;
wire i_bp_ff_rs1_scanout;
wire [63:0] rs1_data_e;
wire br_flag_e0_;
wire br_taken_nand0;
wire br_taken_nand1;
wire inst_d_09_buf;
wire inst_d_10_buf;
wire inst_d_12_buf;
wire inst_d_18_buf;
wire inst_d_21_buf0;
wire inst_d_21_buf1;
wire inst_d_29_buf;
wire [63:0] imm_rs2_data;
wire [63:0] early_byp_rs2_data;
wire i_bp_ff_rs2_scanin;
wire i_bp_ff_rs2_scanout;
wire [71:0] rs2_data_e;
wire [63:0] early_rs3_data;
wire [4:0] rs3_psel;
wire i_bp_ff_rs3_scanin;
wire i_bp_ff_rs3_scanout;
wire [71:0] rs3_data_e;
wire [63:0] wrxx_xor;
wire [63:0] store_data_e;
wire [1:0] rs1_x_rs2_cmp_e;
wire [1:0] rs1_x_rs2_cmp_e_;
wire pstate_am_e_;
wire [1:0] edge_lr_nand3_;
wire edge_l_nand3_;
wire edge_l_nand2_;
wire edge_lr_sel_e;
wire edge_l_sel_e;
wire [1:0] cmp_mbi_irf_fail_;
wire rs3_data_e_b47_buf;
wire [63:0] logical_data_e;
wire [32:0] array_res_e;
wire [63:0] early_rd_data;
wire [2:2] tcu_muxtest_rep0;
wire [63:0] sub_data_e;
wire [63:0] add_data_e;
wire [2:0] add_clip;
wire [63:0] shifter_data_e;
wire i_rm_ff_m_scanin;
wire i_rm_ff_m_scanout;
wire [2:0] addsub_inc;
wire [2:0] addsub_data_m;
wire i_rm_ff_b_scanin;
wire i_rm_ff_b_scanout;
wire i_rm_ff_w_scanin;
wire i_rm_ff_w_scanout;
wire [63:0] rd_ff_w;
wire i_rm_ff_w_plus1_scanin;
wire i_rm_ff_w_plus1_scanout;
wire i_rm_ff_w2_scanin;
wire i_rm_ff_w2_scanout;
wire ibe_trap_d;
wire ibe_trap_e;
wire ibp_m;
wire [63:0] rd_ff_w2;
wire i_rm_ff_w2_plus1_scanin;
wire i_rm_ff_w2_plus1_scanout;
wire [3:0] logic_sel_e;
wire [3:0] logic_hsel_e;
wire [3:0] logic_lsel_e;
wire [63:0] rs1_data_e_;
wire [63:0] log_rs2_data_e_;
wire [63:0] logical_11_;
wire [63:0] logical_10_;
wire [63:0] logical_01_;
wire [63:0] logical_00_;
wire i_misc_ff_scanin;
wire i_misc_ff_scanout;
wire [6:0] shift_sel_e;
wire sh_sel_rshift;
wire sh_sel_lshift;
wire sh_sel_rax;
wire sh_sel_ra;
wire sh_sel_rshiftx;
wire sh_sel_llx;
wire [63:0] sh_rs1_buf;
wire sh_rs1_63_;
wire sh_rs1_31_;
wire sel_rshift00;
wire sel_lshift00;
wire sel_rshiftx00;
wire sel_ra00;
wire sel_rax00;
wire sh_rs1_00_63;
wire sh_rs1_00_31;
wire [70:0] mask_mux00;
wire sel_rshift08;
wire sel_lshift08;
wire sel_rshiftx08;
wire sel_ra08;
wire sel_rax08;
wire sh_rs1_08_63;
wire sh_rs1_08_31;
wire [70:0] mask_mux08;
wire sel_rshift16;
wire sel_lshift16;
wire sel_rshiftx16;
wire sel_ra16;
wire sel_rax16;
wire sh_rs1_16_63;
wire sh_rs1_16_31;
wire [70:0] mask_mux16;
wire sel_rshift24;
wire sel_lshift24;
wire sel_rshiftx24;
wire sel_ra24;
wire sel_rax24;
wire sh_rs1_24_63;
wire sh_rs1_24_31;
wire [70:0] mask_mux24;
wire sel_rshiftx32;
wire sel_rax32;
wire sel_llx32;
wire sh_rs1_32_63;
wire [70:0] mask_mux32;
wire sel_rshiftx40;
wire sel_rax40;
wire sel_llx40;
wire sh_rs1_40_63;
wire [70:0] mask_mux40;
wire sel_rshiftx48;
wire sel_rax48;
wire sel_llx48;
wire sh_rs1_48_63;
wire [70:0] mask_mux48;
wire sel_rshiftx56;
wire sel_rax56;
wire sel_llx56;
wire sh_rs1_56_63;
wire [70:0] mask_mux56;
wire rs2_5;
wire [70:0] sht_by8;
wire [70:0] sht_by8_buf;
wire [2:0] rs2_;
wire [2:0] rs2_mux;
wire [63:0] rs2_data_e_;
wire [2:0] addsub_xor;
wire [1:0] i_as_cla_inc_unused;
wire [63:0] cla_ea;
wire i_asi0_ff_scanin;
wire i_asi0_ff_scanout;
wire [64:0] rng_ack_data;
wire i_asi1_ff_scanin;
wire i_asi1_ff_scanout;
wire [38:0] asi_inst_mask_reg;
wire [64:0] rng_out_ff;
wire i_asi_imask_ff_scanin;
wire i_asi_imask_ff_scanout;
wire [6:0] inst_mask_sel_;
wire [6:0] inst_mask_sel;
wire [31:0] imask_cmp_data;
wire ibe_cmp8_d_;
wire ibe_cmp32_d;
wire ibe_cmp8_d;
wire [8:0] zint_e;
wire [10:0] yint_e;
wire [10:0] xint_e;
wire [13:0] array_upper_data0;
wire [13:0] array_upper_data1;
wire [13:0] array_upper_data2;
wire [13:0] array_upper_data3;
wire [13:0] array_upper_data4;
wire [13:0] array_upper_data5;
wire [13:0] array_upper_e;
wire [11:0] array_middle_e;
wire [4:0] array_lower_e;
wire [32:0] array08_data;
wire [32:0] array16_data;
wire [32:0] array32_data;


// *** Global Inputs ***

input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;			// scan signals
input 		spc_aclk;
input 		spc_bclk;
input		tcu_scan_en;
input		tcu_dectest;			// Passgate mux test control
input		tcu_muxtest;			// Passgate mux test control

input  [64:0]	in_rngl_cdbus;			// ASI Ring

input  [47:2]	tlu_pc_d;
input  [31:0]	dec_inst_d;
input		dec_thread_group;		// Static Signal : Tie UP or DOWN where cloning occurs
input		dec_exu_clken;

input		fgu_exu_w_vld_fx5;
input  [63:0]	fgu_exu_result_fx5;		// FGU Integer results

input  [71:0]	irf_rs1_data_d;
input  [71:0]	irf_rs2_data_d;
input  [71:0]	irf_rs3_data_d;

input		lsu_asi_clken;
input  [63:0]	lsu_exu_ld_data_b;

input  [7:0]	mbi_write_data_p1;		// MBIST


// *** Local  Inputs ***

input  [31:0]	exu_y_data_e;

input  [5:0]	rml_rng_data_out;		// ASI Read data from RML
input  [4:0]	rml_rng_rd_ctl;			// ASI Read Select
input  [1:0]	rml_rng_ack_ctl;		// ASI Read Ack Select
input  [1:0]	rml_rng_ack_cwp_tid;		// ASI Write CWP tid
input  [1:0]	rml_rng_ack_ecc_tid;		// ASI Read ECC tid
input  		rml_rng_ack_det_vld;		// ASI Read Ack vld Select
input		rml_rng_wt_imask_ctl;		// Enable for ASI write to Instruction mask reg
input  [7:0]	rml_irf_ecc_data;               // Saved irf ECC data for indet. ASI access
input		rml_rng_ack_sel_ctl;            // Sel ack type onto ASI rng 
input [31:0]	rml_rng_y_data;
input [7:0]	ect_rng_ccr_data;

input		ect_mbist_sel;			// MBIST
input  [7:0]	ecc_mbist_write_data_p4;	// MBIST

input  [4:0]	ect_rs1_early_sel_d;
input  [4:0]	ect_rs2_early_sel_d;
input  [4:0]	ect_rs3_early_sel_d;
input  [7:0]	ect_rs2_imm_sel_d;
input  [3:0]	ect_rs1_late_sel_d;
input  [3:0]	ect_rs2_late_sel_d;
input  [3:0]	ect_rs3_late_sel_d;
input  [3:0]	ect_logic_sel_d;
input  [6:0]	ect_shift_sel_d;

input		ect_br_taken_z0_e;
input		ect_br_taken_z1_e;
input		ect_alignaddress_little_e;
input		ect_as_clip_e_;			// ALIGNADDRESS clipping of bit [2:0]
input		ect_as_cin_e;
input  [1:0]	ect_array_sel_e;
input  [7:0]	ect_edge_lmask_e;
input  [7:0]	ect_edge_lrmask_e;
input		ect_pstate_am_e;
input  [5:0]	ect_rm_early_sel_e;
input  [2:0]	ect_rm_late_sel_e;		//  [0] : AddSub;  [1] : Shift;  [2] : Logicals;  Def : Early Mux;
input		ect_store_mux_sel_e;

input		ect_ex_emb_clken;		// Power Management
input		ect_tg_clken;			// Power Management


// *** Global Outputs ***

output [64:0]	exu_rngl_cdbus;			// ASI Ring

output		exu_br_taken_e;			// To IFU             : branch is taken
output		exu_br_taken_e1;		// To DEC_DEL and PKU : branch is taken
output [47:0]	exu_address_e;			// To IFU and LSU
output [31:0]	exu_gsr_data_m;			// To FGU
output [63:0]	exu_store_data_e;		// To LSU

output		exu_ibp_m;			// To TLU : Raw Intruction Breakpoint
output [7:0]	exu_trap_number_b;		// To TLU

output [1:0]	exu_mbi_irf_fail_;		// MBIST


// *** Local  Outputs ***

output [64:0]	edp_rng_in_ff;			// ASI Ring : In data flopped

output [1:0]	edp_br_flag_e;			// To IFU    [1] : RS1 negative;  [0] : RS1 zero;
output [63:0]	exu_rs1_data_e;
output [63:0]	edp_rcc_data_e;			// To ECC: rs1 equivalent for ECC checks
output [63:0]	exu_rs2_data_e;
output [63:0]	edp_rs3_data_e;
output [7:0]	edp_rcc_ecc_e;			// To ECC: rs1 equivalent for ECC checks
output [7:0]	edp_rs2_ecc_e;
output [7:0]	edp_rs3_ecc_e;

output		edp_add_cout64_e;
output		edp_add_data_e_b63;
output [1:0]	edp_add_zdetect_e_;

output		edp_sub_cout64_e;
output		edp_sub_data_e_b63;
output		edp_sub_data_e_b31;
output [1:0]	edp_sub_zdetect_e_;

output		edp_logical_data_e_b63;
output		edp_logical_data_e_b31;
output [1:0]	edp_lg_zdetect_e;

output [63:47]	edp_address_m;			// Used for address_error checking
output [63:47]	edp_rd_ff_m;

output [63:0]	edp_rd_ff_w;
output [63:0]	edp_rd_ff_w2;

output		scan_out;


// scan/test renames
assign stop		= 1'b0;
assign test		= tcu_dectest;
// end scan/test renames


exu_edp_dp_buff_macro__dbuff_32x__stack_none__width_4	scan_rep0		 (
  .din ({tcu_scan_en , tcu_pce_ov , spc_aclk , spc_bclk}	),
  .dout({se          , pce_ov     , siclk    , soclk}		));



//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Bypass       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



// *** RS1 ***

exu_edp_dp_mux_macro__mux_aope__ports_6__stack_72c__width_64	i_bp_mux_rs1_early	 (
  .din0 ( rd_ff_m[63:0]		 						),	// M  Stage
  .din1 ( rd_ff_b[63:0]			 					),	// B  Stage
  .din2 ( edp_rd_ff_w[63:0]						 	),	// W  Stage
  .din3 ( edp_rd_ff_w2[63:0]		 					),	// W2 Stage
  .din4 (     rd_ff_w_plus1[63:0]						),	// W_plus1  Stage
  .din5 (     rd_ff_w2_plus1[63:0]		 				),	// W2_plus2 Stage
  .sel0 ( ect_rs1_early_sel_d[0]	 					),
  .sel1 ( ect_rs1_early_sel_d[1]	 					),
  .sel2 ( ect_rs1_early_sel_d[2]	 					),
  .sel3 ( ect_rs1_early_sel_d[3]	 					),
  .sel4 ( ect_rs1_early_sel_d[4]	 					),
  .dout ( early_rs1_data[63:0]		 					));


exu_edp_dp_msff_macro__mux_aope__ports_4__stack_72c__width_72	i_bp_ff_rcc		 (
  .scan_in(i_bp_ff_rcc_scanin),
  .scan_out(i_bp_ff_rcc_scanout),
  .clk  ( l2clk									),
  .en   ( dec_exu_clken								),
  .din0 ({{8{1'b0}},rd_data_e[63:0]}						),	// Execute Stage
  .din1 ({{8{1'b0}},lsu_exu_ld_data_b[63:0]}					),	// Load Data
  .din2 ({{8{1'b0}},early_rs1_data[63:0]}					),	// Early Mux
  .din3 ( irf_rs1_data_d[71:0]							),
  .sel0 ( ect_rs1_late_sel_d[1]							),
  .sel1 ( ect_rs1_late_sel_d[2]							),
  .sel2 ( ect_rs1_late_sel_d[3]							),
  .dout ( rcc_data_e[71:0]							),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



cl_dp1_penc5_64x	i_bp_ff_rs1_penc (
  .sel0 ( ect_rs1_late_sel_d[0]							),
  .sel1 ( ect_rs1_late_sel_d[1]							),
  .sel2 ( ect_rs1_late_sel_d[2]							),
  .sel3 ( ect_rs1_late_sel_d[3]							),
  .psel0( rs1_psel[0]								),
  .psel1( rs1_psel[1]								),
  .psel2( rs1_psel[2]								),
  .psel3( rs1_psel[3]								),
  .psel4( rs1_psel[4]								),
  .test(test));


exu_edp_dp_msff_macro__buffsel_none__mux_aonpe__ports_5__stack_72c__width_64	i_bp_ff_rs1		 (
  .scan_in(i_bp_ff_rs1_scanin),
  .scan_out(i_bp_ff_rs1_scanout),
  .clk  ( l2clk									),
  .en   ( dec_exu_clken								),
  .din0 (            rd_data_e[63:0]						),	// Execute Stage
  .din1 (            lsu_exu_ld_data_b[63:0]					),	// Load Data
  .din2 (            early_rs1_data[63:0] 					),	// Early Mux
  .din3 (            irf_rs1_data_d[63:0]					),	// IRF
  .din4 (            {{16{1'b0}}, tlu_pc_d[47:2], 2'b00}			),	// PC
  .sel0 ( rs1_psel[1]								),
  .sel1 ( rs1_psel[2]								),
  .sel2 ( rs1_psel[3]								),
  .sel3 ( rs1_psel[4]								),
  .sel4 ( rs1_psel[0]								),
  .dout ( rs1_data_e[63:0]							),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_64	i_bp_buf_rs1		 (
  .din  ( rs1_data_e[63:0]							),
  .dout ( exu_rs1_data_e[63:0]							));

exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_72	i_bp_buf_rcc		 (
  .din  ({rcc_data_e[71:64]  , rcc_data_e[63:0]}				),
  .dout ({edp_rcc_ecc_e[7:0] , edp_rcc_data_e[63:0]}				));


exu_edp_dp_zero_macro__width_64	i_bp_cmp_rcc		 (
  .din ( rcc_data_e[63:0]							),
  .dout( edp_br_flag_e[0]							));


exu_edp_dp_inv_macro__dinv_12x__stack_72c__width_1	i_br_taken_inv		 (
  .din ( edp_br_flag_e[0]							),
  .dout(     br_flag_e0_							));

//mux_macro	i_br_taken_mux		(width=1,ports=2,mux=aonpe,buffsel=none,left=1,stack=72c) (
//  .din0( ect_br_taken_z0_e							),
//  .din1( ect_br_taken_z1_e							),
//  .sel0(     br_flag_e0_							),
//  .sel1( edp_br_flag_e[0]							),
//  .dout( br_taken_mux_e							));

exu_edp_dp_nand_macro__dnand_16x__left_1__ports_2__stack_72c__width_1	i_br_taken_nand0	 (
  .din0 ( br_flag_e0_								),
  .din1 ( ect_br_taken_z0_e							),
  .dout ( br_taken_nand0							));

exu_edp_dp_nand_macro__ports_2__stack_72c__width_1	i_br_taken_nand1	 (
  .din0 ( edp_br_flag_e[0]							),
  .din1 ( ect_br_taken_z1_e							),
  .dout ( br_taken_nand1							));

exu_edp_dp_nand_macro__dnand_32x__left_1__ports_2__stack_72c__width_2	i_br_taken_nand23	 (
  .din0 ({ br_taken_nand0 , br_taken_nand0} 					),
  .din1 ({ br_taken_nand1 , br_taken_nand1} 					),
  .dout ({ exu_br_taken_e , exu_br_taken_e1}					));


exu_edp_dp_buff_macro__stack_72c__width_1	i_bp_buf_flag		 (
  .din  ( rcc_data_e[63]							),
  .dout ( edp_br_flag_e[1]							));




// *** RS2 ***

exu_edp_dp_buff_macro__stack_72c__width_7	i_bp_imm_buf		 (
  .din ({ dec_inst_d[9] , dec_inst_d[10] , dec_inst_d[12] , 
          dec_inst_d[18] , dec_inst_d[21] , dec_inst_d[21] , dec_inst_d[29]}	),
  .dout({ inst_d_09_buf  , inst_d_10_buf  , inst_d_12_buf  , 
          inst_d_18_buf  , inst_d_21_buf0 , inst_d_21_buf1 , inst_d_29_buf}	));


exu_edp_dp_mux_macro__mux_aonpe__ports_8__stack_72c__width_64	i_bp_mux_rs2_imm	 (
  .din0 ({{46{inst_d_21_buf0}}, dec_inst_d[21:20],dec_inst_d[13:0] ,2'b00	}),	// BPr  = 4 * sign_ext{d16hi,d16lo} = 4 * sign_ext{inst[21:20],inst[13:0]}
  .din1 ({{40{inst_d_21_buf1}}, dec_inst_d[21:0] ,                  2'b00	}),	// Bicc = 4 * sign_ext{disp22}      = 4 * sign_ext{inst[21:0]}
  .din2 ({{43{inst_d_18_buf }}, dec_inst_d[18:0] ,                  2'b00	}),	// BPcc = 4 * sign_ext{disp19}      = 4 * sign_ext{inst[18:0]}
  .din3 ({{32{inst_d_29_buf }}, dec_inst_d[29:0] ,                  2'b00	}),	// Call = 4 * sign_ext{disp30}      = 4 * sign_ext{inst[29:0]}
  .din4 ({{32{1'b0}}          , dec_inst_d[21:0] ,                  {10{1'b0}}	}),	// IMM22
  .din5 ({{53{inst_d_10_buf }}, dec_inst_d[10:0]				}),	// SIMM11
  .din6 ({{54{inst_d_09_buf }}, dec_inst_d[9:0]				}),	// SIMM10
  .din7 ({{51{inst_d_12_buf }}, dec_inst_d[12:0]				}),	// SIMM13
  .sel0 ( ect_rs2_imm_sel_d[0]	 						 ),
  .sel1 ( ect_rs2_imm_sel_d[1]	 						 ),
  .sel2 ( ect_rs2_imm_sel_d[2]	 						 ),
  .sel3 ( ect_rs2_imm_sel_d[3]	 						 ),
  .sel4 ( ect_rs2_imm_sel_d[4]	 						 ),
  .sel5 ( ect_rs2_imm_sel_d[5]	 						 ),
  .sel6 ( ect_rs2_imm_sel_d[6]	 						 ),
  .sel7 ( ect_rs2_imm_sel_d[7]	 						 ),
  .dout ( imm_rs2_data[63:0]		 					 ));


exu_edp_dp_mux_macro__mux_aope__ports_6__stack_72c__width_64	i_bp_mux_rs2_early_byp	 (
  .din0 ( rd_ff_m[63:0]								),	// M  Stage
  .din1 ( rd_ff_b[63:0]			 					),	// B  Stage
  .din2 ( edp_rd_ff_w[63:0]			 				),	// W  Stage
  .din3 ( edp_rd_ff_w2[63:0]		 					),	// W2 Stage
  .din4 (     rd_ff_w_plus1[63:0]						),	// W_plus1  Stage
  .din5 (     rd_ff_w2_plus1[63:0]		 				),	// W2_plus1 Stage
  .sel0 ( ect_rs2_early_sel_d[0]	 					),
  .sel1 ( ect_rs2_early_sel_d[1]	 					),
  .sel2 ( ect_rs2_early_sel_d[2]	 					),
  .sel3 ( ect_rs2_early_sel_d[3]	 					),
  .sel4 ( ect_rs2_early_sel_d[4]	 					),
  .dout ( early_byp_rs2_data[63:0]		 				));


exu_edp_dp_msff_macro__mux_aope__ports_5__stack_72c__width_72	i_bp_ff_rs2		 (
  .scan_in(i_bp_ff_rs2_scanin),
  .scan_out(i_bp_ff_rs2_scanout),
  .clk  ( l2clk									),
  .en   ( dec_exu_clken								),
  .din0 ({{8{1'b0}} ,imm_rs2_data[63:0]}					),	// Immediate Data
  .din1 ({{8{1'b0}} ,rd_data_e[63:0]}						),	// Execute Stage
  .din2 ({{8{1'b0}} ,lsu_exu_ld_data_b[63:0]}					),	// Load Data
  .din3 ({{8{1'b0}} ,early_byp_rs2_data[63:0]}					),	// Early Mux
  .din4 ( irf_rs2_data_d[71:0]							),
  .sel0 ( ect_rs2_late_sel_d[0]							),
  .sel1 ( ect_rs2_late_sel_d[1]							),
  .sel2 ( ect_rs2_late_sel_d[2]							),
  .sel3 ( ect_rs2_late_sel_d[3]							),
  .dout ( rs2_data_e[71:0]							),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_72	i_bp_buf_rs2		 (
  .din ( rs2_data_e[71:0]							),
  .dout({edp_rs2_ecc_e[7:0] , exu_rs2_data_e[63:0]}				));



// *** RS3 ***

exu_edp_dp_mux_macro__mux_aope__ports_6__stack_72c__width_64	i_bp_mux_rs3_early	 (
  .din0 ( rd_ff_m[63:0]		 						),	// M  Stage
  .din1 ( rd_ff_b[63:0]						 		),	// B  Stage
  .din2 ( edp_rd_ff_w[63:0]						 	),	// W  Stage
  .din3 ( edp_rd_ff_w2[63:0]					 		),	// W2 Stage
  .din4 (     rd_ff_w_plus1[63:0]						),	// W_plus1  Stage
  .din5 (     rd_ff_w2_plus1[63:0]		 				),	// W2_plus1 Stage
  .sel0 ( ect_rs3_early_sel_d[0]				 		),
  .sel1 ( ect_rs3_early_sel_d[1]				 		),
  .sel2 ( ect_rs3_early_sel_d[2]				 		),
  .sel3 ( ect_rs3_early_sel_d[3]	 					),
  .sel4 ( ect_rs3_early_sel_d[4]	 					),
  .dout ( early_rs3_data[63:0]					 		));



cl_dp1_penc5_64x	i_bp_ff_rs3_penc (
  .sel0 ( ect_rs3_late_sel_d[0]							),
  .sel1 ( ect_rs3_late_sel_d[1]							),
  .sel2 ( ect_rs3_late_sel_d[2]							),
  .sel3 ( ect_rs3_late_sel_d[3]							),
  .psel0( rs3_psel[0]								),
  .psel1( rs3_psel[1]								),
  .psel2( rs3_psel[2]								),
  .psel3( rs3_psel[3]								),
  .psel4( rs3_psel[4]								),
  .test(test));


exu_edp_dp_msff_macro__buffsel_none__mux_aonpe__ports_5__stack_72c__width_72	i_bp_ff_rs3		 (
  .scan_in(i_bp_ff_rs3_scanin),
  .scan_out(i_bp_ff_rs3_scanout),
  .clk  ( l2clk									),
  .en   ( dec_exu_clken								),
  .din0 ({{8{1'b0}},rd_data_e[63:0]}						),	// Execute Stage
  .din1 ({{8{1'b0}},lsu_exu_ld_data_b[63:0]}					),	// Load Data
  .din2 ({{8{1'b0}},early_rs3_data[63:0]}					),	// Early Mux
  .din3 ( irf_rs3_data_d[71:0]							),	// IRF
  .din4 ({{8{1'b0}},{16{1'b0}}, tlu_pc_d[47:2], 2'b00}				),	// PC : CALL & JUMP
  .sel0 ( rs3_psel[1]								),
  .sel1 ( rs3_psel[2]								),
  .sel2 ( rs3_psel[3]								),
  .sel3 ( rs3_psel[4]								),
  .sel4 ( rs3_psel[0]								),
  .dout ( rs3_data_e[71:0]							),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_72	i_bp_buf_rs3		 (
  .din ( rs3_data_e[71:0]							),
  .dout({edp_rs3_ecc_e[7:0] , edp_rs3_data_e[63:0]}				));


exu_edp_dp_xor_macro__ports_2__stack_72c__width_64	i_bp_xor_wrxx		 (
  .din0( exu_rs1_data_e[63:0]							),
  .din1( exu_rs2_data_e[63:0]							),
  .dout( wrxx_xor[63:0]								));

exu_edp_dp_mux_macro__mux_aope__ports_2__stack_72c__width_64	i_bp_mux_store		 (
  .din0( wrxx_xor[63:0]								),	// Write Privileded (239) and Write State (241)
  .din1( edp_rs3_data_e[63:0]							),
  .sel0( ect_store_mux_sel_e							),
  .dout( store_data_e[63:0]							));

exu_edp_dp_buff_macro__stack_72c__width_64	i_bp_buf_store		 (
  .din ( store_data_e[63:0]							),
  .dout( exu_store_data_e[63:0]							));


exu_edp_dp_cmp_macro__width_32	i_bp_cmp1		 (
  .din0( rs1_data_e[63:32]							),
  .din1( rs2_data_e[63:32]							),
  .dout( rs1_x_rs2_cmp_e[1]							));

exu_edp_dp_cmp_macro__width_32	i_bp_cmp0		 (
  .din0({rs1_data_e[31:3] , 3'b000}						),
  .din1({rs2_data_e[31:3] , 3'b000}						),
  .dout( rs1_x_rs2_cmp_e[0]							));


exu_edp_dp_inv_macro__stack_72c__width_3	i_mask_inv		 (
  .din ({rs1_x_rs2_cmp_e[1:0]  , ect_pstate_am_e}				),
  .dout({rs1_x_rs2_cmp_e_[1:0] ,     pstate_am_e_}				));

exu_edp_dp_nand_macro__ports_3__stack_72c__width_3	i_mask_nand3		 (
  .din0({rs1_x_rs2_cmp_e[1]    , ect_pstate_am_e       ,     pstate_am_e_    }	),
  .din1({rs1_x_rs2_cmp_e[0]    , rs1_x_rs2_cmp_e[0]    , rs1_x_rs2_cmp_e_[1] }	),
  .din2({ect_rm_early_sel_e[5] , ect_rm_early_sel_e[5] , ect_rm_early_sel_e[5]}	),
  .dout({edge_lr_nand3_[1]     , edge_lr_nand3_[0]     , edge_l_nand3_       }	));

exu_edp_dp_nand_macro__ports_2__stack_72c__width_3	i_mask_nand2		 (
  .din0({edge_lr_nand3_[1]     , rs1_x_rs2_cmp_e_[0]   , edge_l_nand3_       }	),
  .din1({edge_lr_nand3_[0]     , ect_rm_early_sel_e[5] , edge_l_nand2_       }	),
  .dout({edge_lr_sel_e         , edge_l_nand2_         , edge_l_sel_e        }	));



exu_edp_dp_cmp_macro__width_64	i_mbist_cmp0		 (
  .din0 ({8{ecc_mbist_write_data_p4[7:0]}}					),
  .din1 ( edp_rs3_data_e[63:0]							),
  .dout ( cmp_mbi_irf_fail_[0]							));


exu_edp_dp_cmp_macro__width_8	i_mbist_cmp1		 (
  .din0 ( ecc_mbist_write_data_p4[7:0]						),
  .din1 ( edp_rs3_ecc_e[7:0]							),
  .dout ( cmp_mbi_irf_fail_[1]							));


exu_edp_dp_buff_macro__dbuff_32x__stack_72c__width_2	i_mbist_buf		 (
  .din  ( cmp_mbi_irf_fail_[1:0]						),
  .dout ( exu_mbi_irf_fail_[1:0]						));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Bypass       !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Result Mux/FF *!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

exu_edp_dp_buff_macro__dbuff_32x__stack_72c__width_1	i_rm_mux_buf		 (
  .din  ( edp_rs3_data_e[47]					),
  .dout ( rs3_data_e_b47_buf					));

exu_edp_dp_mux_macro__mux_aonpe__ports_7__stack_72c__width_64	i_rm_mux_early		 (
  .din0 ( logical_data_e[63:0]			 		),	// Logical
  .din1 ({{31{1'b0}},array_res_e[32:0]}				),
  .din2 ({exu_rs1_data_e[0],exu_y_data_e[31:1],{32{1'b0}}}	),	// MULScc
  .din3 ({{17{rs3_data_e_b47_buf}} , edp_rs3_data_e[46:0]}	),	// CALL & JUMP - w/ pstate_am=0 + pc extension
  .din4 ({{32{1'b0}}               , edp_rs3_data_e[31:0]}	),	// CALL & JUMP - w/ pstate_am=1
  .din5 ({{56{1'b0}},ect_edge_lrmask_e[7:0]}			),
  .din6 ({{56{1'b0}},ect_edge_lmask_e[7:0]}			),
  .sel0 ( ect_rm_early_sel_e[0]		 			),
  .sel1 ( ect_rm_early_sel_e[1]		 			),
  .sel2 ( ect_rm_early_sel_e[2]		 			),
  .sel3 ( ect_rm_early_sel_e[3]					),
  .sel4 ( ect_rm_early_sel_e[4]					),
  .sel5 ( edge_lr_sel_e						),
  .sel6 ( edge_l_sel_e						),
  .dout ( early_rd_data[63:0]		 			));


exu_edp_dp_mux_macro__mux_pgpe__ports_4__stack_72c__width_64	i_rm_mux_late		 (
  .muxtst (tcu_muxtest_rep0				),
  .din0 ( sub_data_e[63:0]				),	// Sub
  .din1 ({add_data_e[63:3],add_clip[2:0]}		),	// Add
  .din2 ( shifter_data_e[63:0]		 		),	// Shift
  .din3 ( early_rd_data[63:0]		 		),	// Early Mux
  .sel0 ( ect_rm_late_sel_e[0]		 		),
  .sel1 ( ect_rm_late_sel_e[1]		 		),
  .sel2 ( ect_rm_late_sel_e[2]		 		),
  .dout ( rd_data_e[63:0]				),
  .test(test));


exu_edp_dp_msff_macro__stack_72c__width_67	i_rm_ff_m		 (
  .scan_in(i_rm_ff_m_scanin),
  .scan_out(i_rm_ff_m_scanout),
  .clk ( l2clk						),
  .en  ( ect_ex_emb_clken				),
  .din ({addsub_inc[2:0]    , rd_data_e[63:0]}		),
  .dout({addsub_data_m[2:0] , rd_ff_m[63:0]}		),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

  assign exu_gsr_data_m[31:0]	= {rd_ff_m[31:3],addsub_data_m[2:0]};
  assign edp_rd_ff_m[63:47]	= rd_ff_m[63:47];


exu_edp_dp_msff_macro__minbuff_1__stack_72c__width_64	i_rm_ff_b		 (
  .scan_in(i_rm_ff_b_scanin),
  .scan_out(i_rm_ff_b_scanout),
  .clk ( l2clk						),
  .en  ( ect_ex_emb_clken				),
  .din ( rd_ff_m[63:0]					),
  .dout( rd_ff_b[63:0]					),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

  assign exu_trap_number_b[7:0]	= rd_ff_b[7:0];


exu_edp_dp_msff_macro__mux_aope__ports_3__stack_72c__width_64	i_rm_ff_w		 (
  .scan_in(i_rm_ff_w_scanin),
  .scan_out(i_rm_ff_w_scanout),
  .clk ( l2clk						),
  .en  ( ect_tg_clken					),
  .din0({8{mbi_write_data_p1[7:0]}	}		),	// MBIST
  .din1( fgu_exu_result_fx5[63:0]			),	// Float point integer result
  .din2( rd_ff_b[63:0]					),	// Normal EXU data
  .sel0( ect_mbist_sel					),
  .sel1( fgu_exu_w_vld_fx5				),
  .dout(     rd_ff_w[63:0]				),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_64	i_rm_buf_w		 (
  .din (     rd_ff_w[63:0]				),
  .dout( edp_rd_ff_w[63:0]				));


exu_edp_dp_msff_macro__minbuff_1__stack_72c__width_64	i_rm_ff_w_plus1		 (
  .scan_in(i_rm_ff_w_plus1_scanin),
  .scan_out(i_rm_ff_w_plus1_scanout),
  .clk ( l2clk						),
  .en  ( ect_tg_clken					),
  .din ( edp_rd_ff_w[63:0]				),
  .dout( rd_ff_w_plus1[63:0]				),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


exu_edp_dp_msff_macro__stack_72c__width_66	i_rm_ff_w2		 (
  .scan_in(i_rm_ff_w2_scanin),
  .scan_out(i_rm_ff_w2_scanout),
  .clk ( l2clk							),
  .en  ( ect_tg_clken						),
  .din ({ibe_trap_d , ibe_trap_e , lsu_exu_ld_data_b[63:0]}	),	// Load Data
  .dout({ibe_trap_e , ibp_m      ,    rd_ff_w2[63:0]}		),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_65	i_rm_buf_w2		 (
  .din ({ibp_m     ,    rd_ff_w2[63:0]}				),
  .dout({exu_ibp_m , edp_rd_ff_w2[63:0]}			));


exu_edp_dp_msff_macro__minbuff_1__stack_72c__width_64	i_rm_ff_w2_plus1		 (
  .scan_in(i_rm_ff_w2_plus1_scanin),
  .scan_out(i_rm_ff_w2_plus1_scanout),
  .clk ( l2clk						),
  .en  ( ect_tg_clken					),
  .din ( edp_rd_ff_w2[63:0]				),	// Load Data Delayed
  .dout(     rd_ff_w2_plus1[63:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Result Mux/FF *!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Logicals     !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_edp_dp_buff_macro__stack_72c__width_8	i_lg_buf_sel		 (
  .din ({2{logic_sel_e[3:0]}			       }),
  .dout({logic_hsel_e[3:0],logic_lsel_e[3:0]	       }));


exu_edp_dp_inv_macro__stack_72c__width_64	i_lg_inv_rs1		 (
  .din ( exu_rs1_data_e[63:0]				),
  .dout( rs1_data_e_[63:0]				));

exu_edp_dp_inv_macro__stack_72c__width_64	i_lg_inv_rs2		 (
  .din ( exu_rs2_data_e[63:0]				),
  .dout( log_rs2_data_e_[63:0]				));


exu_edp_dp_nand_macro__ports_3__stack_72c__width_64	i_lg_nand1_11		 (
  .din0( exu_rs1_data_e[63:0]				),
  .din1( exu_rs2_data_e[63:0]				),
  .din2({{32{logic_hsel_e[3]}}, {32{logic_lsel_e[3]}}  }),
  .dout( logical_11_[63:0]				));

exu_edp_dp_nand_macro__ports_3__stack_72c__width_64	i_lg_nand1_10		 (
  .din0( exu_rs1_data_e[63:0]				),
  .din1( log_rs2_data_e_[63:0]				),
  .din2({{32{logic_hsel_e[2]}}, {32{logic_lsel_e[2]}}  }),
  .dout( logical_10_[63:0]				));

exu_edp_dp_nand_macro__ports_3__stack_72c__width_64	i_lg_nand1_01		 (
  .din0( rs1_data_e_[63:0]				),
  .din1( exu_rs2_data_e[63:0]				),
  .din2({{32{logic_hsel_e[1]}}, {32{logic_lsel_e[1]}}  }),
  .dout( logical_01_[63:0]				));

exu_edp_dp_nand_macro__ports_3__stack_72c__width_64	i_lg_nand1_00		 (
  .din0( rs1_data_e_[63:0]				),
  .din1( log_rs2_data_e_[63:0]				),
  .din2({{32{logic_hsel_e[0]}}, {32{logic_lsel_e[0]}}  }),
  .dout( logical_00_[63:0]				));


exu_edp_dp_nand_macro__ports_4__stack_72c__width_64	i_lg_nand2		 (
  .din0( logical_00_[63:0]				),
  .din1( logical_01_[63:0]				),
  .din2( logical_10_[63:0]				),
  .din3( logical_11_[63:0]				),
  .dout( logical_data_e[63:0]				));


exu_edp_dp_buff_macro__stack_72c__width_2	i_lg_buf_data		 (
  .din ({logical_data_e[63],logical_data_e[31]}		),
  .dout({edp_logical_data_e_b63,edp_logical_data_e_b31}	));


exu_edp_dp_zero_macro__width_32	i_lg_cmp_upper		 (
  .din ( logical_data_e[63:32]				),
  .dout( edp_lg_zdetect_e[1]				));

exu_edp_dp_zero_macro__width_32	i_lg_cmp_lower		 (
  .din ( logical_data_e[31:0]				),
  .dout( edp_lg_zdetect_e[0]				));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Logicals     !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Shift        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


//
//  Operation    sel_rshift   sel_lshift   sel_rax   sel_ra   sel_rshiftx   sel_llx   sel_32shift
//  -----------|------------|------------|---------|--------|-------------|---------|------------
//     SLL     |     0      |     1      |    0    |   0    |    0        |    0    |     1
//     SLX     |     0      |     1      |    0    |   0    |    0        |    1    |     0
//     SRAX?   |     1      |     0      |    1    |   0    |    1        |    0    |     0
//     SRA     |     1      |     0      |    0    |   1    |    0        |    0    |     1
//     SRLX?   |     1      |     0      |    0    |   0    |    1        |    0    |     0
//     SRL     |     1      |     0      |    0    |   0    |    0        |    0    |     1
//      -      |     1      |     1      |    x    |   x    |    x        |    x    |     x
//      0 **   |     0      |     0      |    x    |   x    |    x        |    x    |     x
//
// ** This will only hold for a dynamic implementation

exu_edp_dp_msff_macro__left_32__stack_72c__width_28	i_misc_ff		 (
  .scan_in(i_misc_ff_scanin),
  .scan_out(i_misc_ff_scanout),
  .clk  ( l2clk									),
  .en   ( ect_tg_clken								),
  .din  ({add_data_e[63:47]    , ect_shift_sel_d[6:0] , ect_logic_sel_d[3:0]}	),
  .dout ({edp_address_m[63:47] ,     shift_sel_e[6:0] ,     logic_sel_e[3:0]}	),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


	assign sh_sel_rshift	= shift_sel_e[5];
	assign sh_sel_lshift	= shift_sel_e[4];
	assign sh_sel_rax	= shift_sel_e[3];
	assign sh_sel_ra	= shift_sel_e[2];
	assign sh_sel_rshiftx	= shift_sel_e[1];
	assign sh_sel_llx	= shift_sel_e[0];


exu_edp_dp_buff_macro__stack_72c__width_64	i_sh_buf_rs1		 (
  .din ( rs1_data_e[63:0]			),
  .dout( sh_rs1_buf[63:0]		 	));

exu_edp_dp_inv_macro__stack_72c__width_2	i_sh_inv_rs1		 (
  .din ({rs1_data_e[63] , rs1_data_e[31]}	),
  .dout({sh_rs1_63_     , sh_rs1_31_	      	}));


 
// *** MASK MUX ***


// The MASK MUXes are built using AO muxes with the highest number of ports being 3:1


// assign rs1z7[7:0] = {rs1[00],{7{1'b0}}};
//
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux00[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  rs1[63:57] ,  rs1[56:49] ,  rs1[48:41] ,  rs1[40:33] ,  rs1[32:25]  }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  rs1[63:56] ,  rs1[55:48] ,  rs1[47:40] ,  rs1[39:32]  }) |
//                            ({39{sel_ra     }} & { {7{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}} }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}},  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_llx    }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux00[31:00] = ({32{sel_rshift }} & {  rs1[31:24] ,  rs1[23:16] ,  rs1[15:08] ,  rs1[07:00] }) |
//                            ({32{sel_lshift }} & {  rs1[24:17] ,  rs1[16:09] ,  rs1[08:01] ,  rs1z7[7:0] }) |
//                            ({32{sel_rshiftx}} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_ra     }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_rax    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  });


exu_edp_dp_buff_macro__width_5	i_sh_buf00		 (
  .din ({sh_sel_rshift,
         sh_sel_lshift,
         sh_sel_rshiftx,
         sh_sel_ra,
         sh_sel_rax			}),
  .dout({sel_rshift00,
         sel_lshift00,
         sel_rshiftx00,
         sel_ra00,
         sel_rax00			}));

exu_edp_dp_inv_macro__stack_72c__width_2	i_sh_inv00		 (
  .din ({sh_rs1_63_    ,sh_rs1_31_	}),
  .dout({sh_rs1_00_63  ,sh_rs1_00_31	}));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_7	i_sh_mux00_88		 (
  .din0( sh_rs1_buf[63:57]		 ),
  .din1({ 7{sh_rs1_00_31}		}),
  .din2({ 7{sh_rs1_00_63}		}),
  .sel0( sel_lshift00         		 ),
  .sel1( sel_ra00             		 ),
  .sel2( sel_rax00            		 ),
  .dout( mask_mux00[70:64]    		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_32	i_sh_mux00_74		 (
  .din0( sh_rs1_buf[56:25]		 ),
  .din1( sh_rs1_buf[63:32]		 ),
  .din2({32{sh_rs1_00_31}		}),
  .sel0( sel_lshift00			 ),
  .sel1( sel_rshiftx00			 ),
  .sel2( sel_ra00			 ),
  .dout( mask_mux00[63:32]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_32	i_sh_mux00_30		 (
  .din0( sh_rs1_buf[31:0]           	 ),
  .din1({sh_rs1_buf[24:0],{7{1'b0}}	}),
  .sel0( sel_rshift00			 ),
  .sel1( sel_lshift00			 ),
  .dout( mask_mux00[31:0]		 ));


 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux08[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  rs1[55:49] ,  rs1[48:41] ,  rs1[40:33] ,  rs1[32:25] ,  rs1[24:17]  }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  rs1[63:56] ,  rs1[55:48] ,  rs1[47:40]  }) |
//                            ({39{sel_ra     }} & { {7{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}} }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}},  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_llx    }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux08[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  rs1[31:24] ,  rs1[23:16] ,  rs1[15:08] }) |
//                            ({32{sel_lshift }} & {  rs1[16:09] ,  rs1[08:01] ,  rs1z7[7:0] ,  {8{1'b0}}  }) |
//                            ({32{sel_rshiftx}} & {  rs1[39:32] ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_ra     }} & { {8{rs1[31]}},  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_rax    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  });


exu_edp_dp_buff_macro__width_5	i_sh_buf08		 (
  .din ({sh_sel_rshift,
         sh_sel_lshift,
         sh_sel_rshiftx,
         sh_sel_ra,
         sh_sel_rax		}),
  .dout({sel_rshift08,
         sel_lshift08,
         sel_rshiftx08,
         sel_ra08,
         sel_rax08			}));

exu_edp_dp_inv_macro__stack_72c__width_2	i_sh_inv08		 (
  .din ({sh_rs1_63_    ,sh_rs1_31_	}),
  .dout({sh_rs1_08_63  ,sh_rs1_08_31	}));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_15	i_sh_mux08_87		 (
  .din0( sh_rs1_buf[55:41]		 ),
  .din1({15{sh_rs1_08_31}		}),
  .din2({15{sh_rs1_08_63}		}),
  .sel0( sel_lshift08			 ),
  .sel1( sel_ra08			 ),
  .sel2( sel_rax08			 ),
  .dout( mask_mux08[70:56]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_32	i_sh_mux08_63		 (
  .din0( sh_rs1_buf[40:9]		 ),
  .din1( sh_rs1_buf[63:32]		 ),
  .din2({32{sh_rs1_08_31}		}),
  .sel0( sel_lshift08			 ),
  .sel1( sel_rshiftx08			 ),
  .sel2( sel_ra08			 ),
  .dout( mask_mux08[55:24]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16	i_sh_mux08_21		 (
  .din0( sh_rs1_buf[31:16]		 ),
  .din1({sh_rs1_buf[8:0],{7{1'b0}}}),
  .sel0( sel_rshift08			 ),
  .sel1( sel_lshift08			 ),
  .dout( mask_mux08[23:8]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8	i_sh_mux08_00		 (
  .din0( sh_rs1_buf[15:8]		 ),
  .din1({8{1'b0}			}),
  .sel0( sel_rshift08			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux08[7:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux16[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  rs1[47:41] ,  rs1[40:33] ,  rs1[32:25] ,  rs1[24:17] ,  rs1[16:09]  }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[63:56] ,  rs1[55:48]  }) |
//                            ({39{sel_ra     }} & { {7{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}} }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}},  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_llx    }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux16[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[31:24] ,  rs1[23:16] }) |
//                            ({32{sel_lshift }} & {  rs1[08:01] ,  rs1z7[7:0] ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_rshiftx}} & {  rs1[47:40] ,  rs1[39:32] ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_ra     }} & { {8{rs1[31]}}, {8{rs1[31]}},  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_rax    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  });


exu_edp_dp_buff_macro__width_5	i_sh_buf16		 (
  .din ({sh_sel_rshift,
         sh_sel_lshift,
         sh_sel_rshiftx,
         sh_sel_ra,
         sh_sel_rax		}),
  .dout({sel_rshift16,
         sel_lshift16,
         sel_rshiftx16,
         sel_ra16,
         sel_rax16			}));

exu_edp_dp_inv_macro__stack_72c__width_2	i_sh_inv16		 (
  .din ({sh_rs1_63_    ,sh_rs1_31_	}),
  .dout({sh_rs1_16_63  ,sh_rs1_16_31	}));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_23	i_sh_mux16_86		 (
  .din0( sh_rs1_buf[47:25]		 ),
  .din1({23{sh_rs1_16_31}		}),
  .din2({23{sh_rs1_16_63}		}),
  .sel0( sel_lshift16			 ),
  .sel1( sel_ra16			 ),
  .sel2( sel_rax16			 ),
  .dout( mask_mux16[70:48]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_32	i_sh_mux16_52		 (
  .din0({sh_rs1_buf[24:0],{7{1'b0}}	}),
  .din1( sh_rs1_buf[63:32]		 ),
  .din2({32{sh_rs1_16_31}		}),
  .sel0( sel_lshift16			 ),
  .sel1( sel_rshiftx16			 ),
  .sel2( sel_ra16			 ),
  .dout( mask_mux16[47:16]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16	i_sh_mux16_00		 (
  .din0( sh_rs1_buf[31:16]		 ),
  .din1({16{1'b0}			}),
  .sel0( sel_rshift16			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux16[15:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux24[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  rs1[39:33] ,  rs1[32:25] ,  rs1[24:17] ,  rs1[16:09] ,  rs1[08:01]  }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[63:56]  }) |
//                            ({39{sel_ra     }} & { {7{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}} }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}},  {8{1'b0}}   }) |
//                            ({39{sel_llx    }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux24[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[31:24] }) |
//                            ({32{sel_lshift }} & {  rs1z7[7:0] ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_rshiftx}} & {  rs1[55:48] ,  rs1[47:40] ,  rs1[39:32] ,  {8{1'b0}}  }) |
//                            ({32{sel_ra     }} & { {8{rs1[31]}}, {8{rs1[31]}}, {8{rs1[31]}},  {8{1'b0}}  }) |
//                            ({32{sel_rax    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  });


exu_edp_dp_buff_macro__width_5	i_sh_buf24		 (
  .din ({sh_sel_rshift,
         sh_sel_lshift,
         sh_sel_rshiftx,
         sh_sel_ra,
         sh_sel_rax		}),
  .dout({sel_rshift24,
         sel_lshift24,
         sel_rshiftx24,
         sel_ra24,
         sel_rax24			}));

exu_edp_dp_inv_macro__stack_72c__width_2	i_sh_inv24		 (
  .din ({sh_rs1_63_    ,sh_rs1_31_	}),
  .dout({sh_rs1_24_63  ,sh_rs1_24_31	}));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_31	i_sh_mux24_85		 (
  .din0( sh_rs1_buf[39:9]		 ),
  .din1({31{sh_rs1_24_31}		}),
  .din2({31{sh_rs1_24_63}		}),
  .sel0( sel_lshift24			 ),
  .sel1( sel_ra24			 ),
  .sel2( sel_rax24			 ),
  .dout( mask_mux24[70:40]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_16	i_sh_mux24_43		 (
  .din0({sh_rs1_buf[8:0],{7{1'b0}}}),
  .din1( sh_rs1_buf[63:48]		 ),
  .din2({16{sh_rs1_24_31}		}),
  .sel0( sel_lshift24			 ),
  .sel1( sel_rshiftx24			 ),
  .sel2( sel_ra24			 ),
  .dout( mask_mux24[39:24]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16	i_sh_mux24_21		 (
  .din0( sh_rs1_buf[47:32]		 ),
  .din1({16{sh_rs1_24_31}		}),
  .sel0( sel_rshiftx24			 ),
  .sel1( sel_ra24			 ),
  .dout( mask_mux24[23:8]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8	i_sh_mux24_00		 (
  .din0( sh_rs1_buf[31:24]		 ),
  .din1({8{1'b0}			}),
  .sel0( sel_rshift24			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux24[7:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux32[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_ra     }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}} }) |
//                            ({39{sel_llx    }} & {  rs1[31:25] ,  rs1[24:17] ,  rs1[16:09] ,  rs1[08:01] ,  rs1z7[7:0]  });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux32[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_lshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rshiftx}} & {  rs1[63:56] ,  rs1[55:48] ,  rs1[47:40] ,  rs1[39:32]  }) |
//                            ({32{sel_ra     }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rax    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });


exu_edp_dp_buff_macro__width_3	i_sh_buf32		 (
  .din ({sh_sel_rshiftx,
         sh_sel_rax,
         sh_sel_llx		}),
  .dout({sel_rshiftx32,
         sel_rax32,
         sel_llx32			}));

exu_edp_dp_inv_macro__stack_72c__width_1	i_sh_inv32		 (
  .din ( sh_rs1_63_			 ),
  .dout( sh_rs1_32_63			 ));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_39	i_sh_mux32_84		 (
  .din0({39{sh_rs1_32_63}		}),
  .din1({sh_rs1_buf[31:0],{7{1'b0}}	}),
  .sel0( sel_rax32			 ),
  .sel1( sel_llx32			 ),
  .dout( mask_mux32[70:32]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_32	i_sh_mux32_30		 (
  .din0( sh_rs1_buf[63:32]		 ),
  .din1({32{1'b0}			}),
  .sel0( sel_rshiftx32			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux32[31:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux40[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_ra     }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}} }) |
//                            ({39{sel_llx    }} & {  rs1[23:17] ,  rs1[16:09] ,  rs1[08:01] ,  rs1z7[7:0] ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux40[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_lshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rshiftx}} & {  {8{1'b0}}  ,  rs1[63:56] ,  rs1[55:48] ,  rs1[47:40]  }) |
//                            ({32{sel_ra     }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rax    }} & { {8{rs1[63]}},  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });


exu_edp_dp_buff_macro__width_3	i_sh_buf40		 (
  .din ({sh_sel_rshiftx,
         sh_sel_rax,
         sh_sel_llx		}),
  .dout({sel_rshiftx40,
         sel_rax40,
         sel_llx40			}));

exu_edp_dp_inv_macro__stack_72c__width_1	i_sh_inv40		 (
  .din ( sh_rs1_63_			 ),
  .dout( sh_rs1_40_63			 ));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_31	i_sh_mux40_85		 (
  .din0({31{sh_rs1_40_63}		}),
  .din1({sh_rs1_buf[23:0],{7{1'b0}}	}),
  .sel0( sel_rax40			 ),
  .sel1( sel_llx40			 ),
  .dout( mask_mux40[70:40]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16	i_sh_mux40_43		 (
  .din0({16{sh_rs1_40_63}		}),
  .din1({16{1'b0}			}),
  .sel0( sel_rax40			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux40[39:24]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_24	i_sh_mux40_20		 (
  .din0( sh_rs1_buf[63:40]		 ),
  .din1({24{1'b0}			}),
  .sel0( sel_rshiftx40			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux40[23:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux48[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_ra     }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}} }) |
//                            ({39{sel_llx    }} & {  rs1[15:09] ,  rs1[08:01] ,  rs1z7[7:0] ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux48[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_lshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rshiftx}} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[63:56] ,  rs1[55:48]  }) |
//                            ({32{sel_ra     }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rax    }} & { {8{rs1[63]}}, {8{rs1[63]}},  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });


exu_edp_dp_buff_macro__width_3	i_sh_buf48		 (
  .din ({sh_sel_rshiftx,
         sh_sel_rax,
         sh_sel_llx		}),
  .dout({sel_rshiftx48,
         sel_rax48,
         sel_llx48			}));

exu_edp_dp_inv_macro__stack_72c__width_1	i_sh_inv48		 (
  .din ( sh_rs1_63_			 ),
  .dout( sh_rs1_48_63			 ));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_23	i_sh_mux48_86		 (
  .din0({23{sh_rs1_48_63}		}),
  .din1({sh_rs1_buf[15:0],{7{1'b0}}	}),
  .sel0( sel_rax48			 ),
  .sel1( sel_llx48			 ),
  .dout( mask_mux48[70:48]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_32	i_sh_mux48_52		 (
  .din0({32{sh_rs1_48_63}		}),
  .din1({32{1'b0}			}),
  .sel0( sel_rax48			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux48[47:16]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16	i_sh_mux48_10		 (
  .din0( sh_rs1_buf[63:48]		 ),
  .din1({16{1'b0}			}),
  .sel0( sel_rshiftx48			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux48[15:0]		 ));

 
//                                                     70:64         63:56         55:48         47:40         39:32     
// assign mask_mux56[70:32] = ({39{sel_rshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_lshift }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rshiftx}} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_ra     }} & {  {7{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({39{sel_rax    }} & { {7{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}} }) |
//                            ({39{sel_llx    }} & {  rs1[07:01] ,  rs1z7[7:0] ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });

//                                                     31:24         23:16         15:08         07:00
// assign mask_mux56[31:00] = ({32{sel_rshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_lshift }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rshiftx}} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  rs1[63:56]  }) |
//                            ({32{sel_ra     }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   }) |
//                            ({32{sel_rax    }} & { {8{rs1[63]}}, {8{rs1[63]}}, {8{rs1[63]}},  {8{1'b0}}   }) |
//                            ({32{sel_llx    }} & {  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}  ,  {8{1'b0}}   });


exu_edp_dp_buff_macro__width_3	i_sh_buf56		 (
  .din ({sh_sel_rshiftx,
         sh_sel_rax,
         sh_sel_llx		}),
  .dout({sel_rshiftx56,
         sel_rax56,
         sel_llx56			}));

exu_edp_dp_inv_macro__stack_72c__width_1	i_sh_inv56		 (
  .din ( sh_rs1_63_			 ),
  .dout( sh_rs1_56_63			 ));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_15	i_sh_mux56_87		 (
  .din0({15{sh_rs1_56_63}		}),
  .din1({sh_rs1_buf[7:0],{7{1'b0}}	}),
  .sel0( sel_rax56 			 ),
  .sel1( sel_llx56			 ),
  .dout( mask_mux56[70:56]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_48	i_sh_mux56_61		 (
  .din0({48{sh_rs1_56_63}		}),
  .din1({48{1'b0}			}),
  .sel0( sel_rax56			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux56[55:8]		 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8	i_sh_mux56_10		 (
  .din0( sh_rs1_buf[63:56]		 ),
  .din1({8{1'b0}			}),
  .sel0( sel_rshiftx56			 ),
  .sel1( 1'b0				 ),
  .dout( mask_mux56[7:0]		 ));


 
// *** 1st Level Shifter (right by 8) ***


// If timing requires, we could use a 64/32 pin to replace the 2-way OR
// assign rs2_5     = rs2[5] & (sel_rshiftx | sel_llx);

exu_edp_dp_and_macro__dinv_16x__dnand_6x__ports_2__width_1	i_sh_sh8_mux5		 (
  .din0( exu_rs2_data_e[5]		 ),
  .din1( shift_sel_e[6]                  ),
  .dout( rs2_5				 ));


// assign sel1_sh00 = ~rs2_5 & ~rs2[4] & ~rs2[3];
// assign sel1_sh08 = ~rs2_5 & ~rs2[4] &  rs2[3];
// assign sel1_sh16 = ~rs2_5 &  rs2[4] & ~rs2[3];
// assign sel1_sh24 = ~rs2_5 &  rs2[4] &  rs2[3];
// assign sel1_sh32 =  rs2_5 & ~rs2[4] & ~rs2[3];
// assign sel1_sh40 =  rs2_5 & ~rs2[4] &  rs2[3];
// assign sel1_sh48 =  rs2_5 &  rs2[4] & ~rs2[3];
// assign sel1_sh56 =  rs2_5 &  rs2[4] &  rs2[3];
//
// assign sht_by8[70:00]    = ({71{sel1_sh00}} & mask_mux00[70:00]) |
//                            ({71{sel1_sh08}} & mask_mux08[70:00]) |
//                            ({71{sel1_sh16}} & mask_mux16[70:00]) |
//                            ({71{sel1_sh24}} & mask_mux24[70:00]) |
//                            ({71{sel1_sh32}} & mask_mux32[70:00]) |
//                            ({71{sel1_sh40}} & mask_mux40[70:00]) |
//                            ({71{sel1_sh48}} & mask_mux48[70:00]) |
//                            ({71{sel1_sh56}} & mask_mux56[70:00]);

exu_edp_dp_buff_macro__dbuff_48x__width_1	tst_mux_rep0		 (
  .din ( tcu_muxtest			 ),
  .dout( tcu_muxtest_rep0		 ));


exu_edp_dp_mux_macro__mux_aodec__ports_8__stack_72c__width_71	i_sh_sh8_mux		 (
  .din0 ( mask_mux00[70:0]		 ),
  .din1 ( mask_mux08[70:0]		 ),
  .din2 ( mask_mux16[70:0]		 ),
  .din3 ( mask_mux24[70:0]		 ),
  .din4 ( mask_mux32[70:0]		 ),
  .din5 ( mask_mux40[70:0]		 ),
  .din6 ( mask_mux48[70:0]		 ),
  .din7 ( mask_mux56[70:0]		 ),
  .sel  ({rs2_5,exu_rs2_data_e[4:3]	}),
  .dout ( sht_by8[70:0]		 ));

exu_edp_dp_buff_macro__stack_72c__width_71	i_sh_sh8_buf		 (
  .din  ( sht_by8[70:0]			 ),
  .dout ( sht_by8_buf[70:0]		 ));

 
// *** 2nd Level Shifter (by 1) ***

// assign sel2_sh0  = ( sel_rshift & ~rs2[2] & ~rs2[1] & ~rs2[0]) |
//                    ( sel_lshift &  rs2[2] &  rs2[1] &  rs2[0]);
// 
// assign sel2_sh1  = ( sel_rshift & ~rs2[2] & ~rs2[1] &  rs2[0]) |
//                    ( sel_lshift &  rs2[2] &  rs2[1] & ~rs2[0]);
// 
// assign sel2_sh2  = ( sel_rshift & ~rs2[2] &  rs2[1] & ~rs2[0]) |
//                    ( sel_lshift &  rs2[2] & ~rs2[1] &  rs2[0]);
// 
// assign sel2_sh3  = ( sel_rshift & ~rs2[2] &  rs2[1] &  rs2[0]) |
//                    ( sel_lshift &  rs2[2] & ~rs2[1] & ~rs2[0]);
// 
// assign sel2_sh4  = ( sel_rshift &  rs2[2] & ~rs2[1] & ~rs2[0]) |
//                    ( sel_lshift & ~rs2[2] &  rs2[1] &  rs2[0]);
// 
// assign sel2_sh5  = ( sel_rshift &  rs2[2] & ~rs2[1] &  rs2[0]) |
//                    ( sel_lshift & ~rs2[2] &  rs2[1] & ~rs2[0]);
// 
// assign sel2_sh6  = ( sel_rshift &  rs2[2] &  rs2[1] & ~rs2[0]) |
//                    ( sel_lshift & ~rs2[2] & ~rs2[1] &  rs2[0]);
// 
// assign sel2_sh7  = ( sel_rshift &  rs2[2] &  rs2[1] &  rs2[0]) |
//                    ( sel_lshift & ~rs2[2] & ~rs2[1] & ~rs2[0]);
// 
// 
// assign shifter_out_e0[63:0] = ({64{sel2_sh0}} & sht_by8[63:00]) |
//                               ({64{sel2_sh1}} & sht_by8[64:01]) |
//                               ({64{sel2_sh2}} & sht_by8[65:02]) |
//                               ({64{sel2_sh3}} & sht_by8[66:03]) |
//                               ({64{sel2_sh4}} & sht_by8[67:04]) |
//                               ({64{sel2_sh5}} & sht_by8[68:05]) |
//                               ({64{sel2_sh6}} & sht_by8[69:06]) |
//                               ({64{sel2_sh7}} & sht_by8[70:07]);

exu_edp_dp_inv_macro__dinv_6x__width_3	i_sh_rs2_inv		 (
  .din ( exu_rs2_data_e[2:0]		 ),
  .dout( rs2_[2:0]			 ));

exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3	i_sh_rs2l_mux		 (
  .din0( exu_rs2_data_e[2:0]		 ),
  .din1( rs2_[2:0]			 ),
  .sel0( sh_sel_rshift			 ),
  .sel1( sh_sel_lshift			 ),
  .dout( rs2_mux[2:0]			 ));

exu_edp_dp_mux_macro__mux_aodec__ports_8__stack_72c__width_64	i_sh_sh1_mux		 (
  .din0 ( sht_by8_buf[63:0]		 ),
  .din1 ( sht_by8_buf[64:1]		 ),
  .din2 ( sht_by8_buf[65:2]		 ),
  .din3 ( sht_by8_buf[66:3]		 ),
  .din4 ( sht_by8_buf[67:4]		 ),
  .din5 ( sht_by8_buf[68:5]		 ),
  .din6 ( sht_by8_buf[69:6]		 ),
  .din7 ( sht_by8_buf[70:7]		 ),
  .sel  ( rs2_mux[2:0]			 ),
  .dout ( shifter_data_e[63:0]		 ));


//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Shift        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Add/Sub      !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_edp_dp_inv_macro__stack_72c__width_64	i_as_inv_rs2		 (
  .din ( rs2_data_e[63:0]				 ),
  .dout( rs2_data_e_[63:0]				 ));


exu_edp_dp_cla_macro__width_64	i_as_cla		 (
  .din0( rs1_data_e[63:0]				 ),
  .din1( rs2_data_e_[63:0]				 ),
  .cin ( ect_as_cin_e					 ),
  .cout( edp_sub_cout64_e				 ),
  .dout( sub_data_e[63:0]				 ));


// NOTE : Since the 8 LSB's from the CLA are faster than the remaining bit,
//        this ALIGNADDRESS clipping should not be in the critical path.
//        If that is not the case, then add an additional port on to the
//        late result mux with the low 3 bits tied down.

exu_edp_dp_and_macro__ports_2__stack_72c__width_3	i_as_cla_clip		 (
  .din0( add_data_e[2:0]				 ),
  .din1({3{ect_as_clip_e_}				}),
  .dout( add_clip[2:0]					 ));


exu_edp_dp_xor_macro__ports_2__stack_72c__width_3	i_as_cla_xor		 (
  .din0( exu_address_e[2:0]				 ),
  .din1({3{ect_alignaddress_little_e}}			 ),
  .dout( addsub_xor[2:0]				 ));

exu_edp_dp_increment_macro__width_4	i_as_cla_inc		 (
  .din ({1'b0,addsub_xor[2:0]}				 ),
  .cin ( ect_alignaddress_little_e			 ),
  .cout( i_as_cla_inc_unused[0]				 ),
  .dout({i_as_cla_inc_unused[1],addsub_inc[2:0]}	 ));


exu_edp_dp_cla_macro__width_64	i_as_cla_ea		 (
  .din0( rs1_data_e[63:0]				 ),
  .din1( rs2_data_e[63:0]				 ),
  .cin ( ect_as_cin_e					 ),
  .cout( edp_add_cout64_e				 ),
  .dout( cla_ea[63:0]					 ));

exu_edp_dp_buff_macro__stack_64c__width_64	i_as_buf_ea		 (
  .din  ( cla_ea[63:0]					 ),
  .dout ( add_data_e[63:0]				 ));

assign exu_address_e[47:0]	= add_data_e[47:0];



cl_dp1_zdt64_8x	zdt_add			           (
  .din0( exu_rs1_data_e[63:0]				 ),
  .din1( exu_rs2_data_e[63:0]				 ),
  .cin ( ect_as_cin_e					 ),
    .zdt_z32_ ( edp_add_zdetect_e_[0]			 ),
    .zdt_z64_ ( edp_add_zdetect_e_[1]			 ));


cl_dp1_zdt64_8x	zdt_sub			           (
  .din0( exu_rs1_data_e[63:0]				 ),
  .din1( rs2_data_e_[63:0]				 ),
  .cin ( ect_as_cin_e					 ),
    .zdt_z32_ ( edp_sub_zdetect_e_[0]			 ),
    .zdt_z64_ ( edp_sub_zdetect_e_[1]			 ));


// To compute COUT32 : use XOR 3-port
//
//	rs1[32]		rs2[32]		result[32]	|	COUT32
//      -------         -------         ----------      |	------
//	   0		   0		    0		|	   0
//	   0		   0		    1		|	   1
//	   0		   1		    0		|	   1
//	   0		   1		    1		|	   0
//	   1		   0		    0		|	   1
//	   1		   0		    1		|	   0
//	   1		   1		    0		|	   0
//	   1		   1		    1		|	   1



//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Add/Sub      !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : ASI Ring     !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!


exu_edp_dp_msff_macro__stack_72c__width_65	i_asi0_ff		 (
  .scan_in(i_asi0_ff_scanin),
  .scan_out(i_asi0_ff_scanout),
  .clk ( l2clk						),
  .en  ( lsu_asi_clken					),
  .din ( in_rngl_cdbus[64:0]				),
  .dout( edp_rng_in_ff[64:0]				),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));



exu_edp_dp_mux_macro__mux_aope__ports_3__stack_72c__width_65	i_asi_ack_mux		 (
  .din0 ({edp_rng_in_ff[64],rml_rng_ack_det_vld,1'b1,		// set ACK (bit 62)
         edp_rng_in_ff[61:56],8'h00,edp_rng_in_ff[47:0]}),	// clear exceptions (bits 55:48)
  .din1({6'b111100, dec_thread_group,	 			// ack for CWP write completion
         rml_rng_ack_cwp_tid[1:0],8'h00,edp_rng_in_ff[47:0]}),	// clear exceptions (bits 55:48)
  .din2({6'b111001, dec_thread_group,	 			// ack for IRF_ECC read completion
         rml_rng_ack_ecc_tid[1:0],56'h00000000000000}	),	// clear exceptions (bits 55:48)
  .sel0( rml_rng_ack_ctl[0]				),
  .sel1( rml_rng_ack_ctl[1]				),
  .dout( rng_ack_data[64:0]				));


exu_edp_dp_msff_macro__mux_aope__ports_7__stack_72c__width_65	i_asi1_ff		 (
  .scan_in(i_asi1_ff_scanin),
  .scan_out(i_asi1_ff_scanout),
  .clk ( l2clk						),
  .en  ( lsu_asi_clken					),
  .din0({{59{1'b0}} , rml_rng_data_out[5:0]}		),
  .din1({{57{1'b0}} , ect_rng_ccr_data[7:0]}		),
  .din2({{33{1'b0}} , rml_rng_y_data[31:0]}		),
  .din3({{26{1'b0}} , asi_inst_mask_reg[38:0]}		),
  .din4({{57{1'b0}} , rml_irf_ecc_data[7:0]}            ),
  .din5( rng_ack_data[64:0]                             ),
  .din6( edp_rng_in_ff[64:0]				),
  .sel0( rml_rng_rd_ctl[0]				),
  .sel1( rml_rng_rd_ctl[1]				),
  .sel2( rml_rng_rd_ctl[2]				),
  .sel3( rml_rng_rd_ctl[3]				),
  .sel4( rml_rng_rd_ctl[4]				),
  .sel5( rml_rng_ack_sel_ctl				),
  .dout( rng_out_ff[64:0]				),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_65	i_asi1_buf		 (
  .din ( rng_out_ff[64:0]				),
  .dout( exu_rngl_cdbus[64:0]				));


// *** Start : Instruction Break Point logic ***


exu_edp_dp_msff_macro__stack_72c__width_39	i_asi_imask_ff		 (
  .scan_in(i_asi_imask_ff_scanin),
  .scan_out(i_asi_imask_ff_scanout),
  .clk ( l2clk						),
  .en  ( rml_rng_wt_imask_ctl				),
  .din ( edp_rng_in_ff[38:0]				),
  .dout( asi_inst_mask_reg[38:0]			),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));


exu_edp_dp_inv_macro__stack_72c__width_7	i_asi_imask_inv		 (
  .din ( asi_inst_mask_reg[38:32]			),
  .dout( inst_mask_sel_[6:0]				));


exu_edp_dp_buff_macro__stack_72c__width_7	i_asi_imask_buff	 (
  .din ( asi_inst_mask_reg[38:32]			),
  .dout( inst_mask_sel[6:0]				));



exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_2	i_asi_imask_mux31_30	 (
  .din0( dec_inst_d[31:30]				),
  .din1( asi_inst_mask_reg[31:30]			),
  .sel0( inst_mask_sel[6]				),
  .sel1( inst_mask_sel_[6]				),
  .dout( imask_cmp_data[31:30]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_5	i_asi_imask_mux29_25	 (
  .din0( dec_inst_d[29:25]				),
  .din1( asi_inst_mask_reg[29:25]			),
  .sel0( inst_mask_sel[5]				),
  .sel1( inst_mask_sel_[5]				),
  .dout( imask_cmp_data[29:25]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_6	i_asi_imask_mux24_19	 (
  .din0( dec_inst_d[24:19]				),
  .din1( asi_inst_mask_reg[24:19]			),
  .sel0( inst_mask_sel[4]				),
  .sel1( inst_mask_sel_[4]				),
  .dout( imask_cmp_data[24:19]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_5	i_asi_imask_mux18_14	 (
  .din0( dec_inst_d[18:14]				),
  .din1( asi_inst_mask_reg[18:14]			),
  .sel0( inst_mask_sel[3]				),
  .sel1( inst_mask_sel_[3]				),
  .dout( imask_cmp_data[18:14]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_1	i_asi_imask_mux13	 (
  .din0( dec_inst_d[13]					),
  .din1( asi_inst_mask_reg[13]				),
  .sel0( inst_mask_sel[2]				),
  .sel1( inst_mask_sel_[2]				),
  .dout( imask_cmp_data[13]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_8	i_asi_imask_mux12_5	 (
  .din0( dec_inst_d[12:5]				),
  .din1( asi_inst_mask_reg[12:5]			),
  .sel0( inst_mask_sel[1]				),
  .sel1( inst_mask_sel_[1]				),
  .dout( imask_cmp_data[12:5]				));


exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_5	i_asi_imask_mux4_0	 (
  .din0( dec_inst_d[4:0]				),
  .din1( asi_inst_mask_reg[4:0]				),
  .sel0( inst_mask_sel[0]				),
  .sel1( inst_mask_sel_[0]				),
  .dout( imask_cmp_data[4:0]				));



exu_edp_dp_zero_macro__width_8	i_asi_ibe_cmp8		 (
  .din ({1'b0 , inst_mask_sel[6:0]}			),
  .dout( ibe_cmp8_d_					));

exu_edp_dp_cmp_macro__width_32	i_asi_ibe_cmp32		 (
  .din0( imask_cmp_data[31:0]				),
  .din1( asi_inst_mask_reg[31:0]			),
  .dout( ibe_cmp32_d					));

exu_edp_dp_inv_macro__stack_72c__width_1	i_asi_ibe_inv		 (
  .din ( ibe_cmp8_d_					),
  .dout( ibe_cmp8_d					));

exu_edp_dp_and_macro__ports_2__stack_72c__width_1	i_asi_ibe_and		 (
  .din0( ibe_cmp32_d					),
  .din1( ibe_cmp8_d					),
  .dout( ibe_trap_d					));

// *** End   : Instruction Break Point logic ***



//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : ASI Ring     !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!



 
//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! Start : Array        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!

//			Three-Dimensional Array Addressing Instructions
//
// 3D Array Fixed-Point Address Format
//
//    63:55         54:44         43:33         32:22         21:11         10:00
//  ----------    ----------    ----------    ----------    ----------    ----------
//  Z integer     Z fraction    Y integer     Y fraction    X integer     X fraction
//
//
//    rs2      |
//  Size 'n'   |   Number of Elements
//  -----------|---------------------
//     0       |          64
//     1       |         128
//     2       |         256
//     3       |         512
//     4       |        1024
//     5       |        2048
//
//
// Result Format
//
//      Array8
//      
//      |           upper           |       middle       |       lower        |
//      |---------------------------|--------------------|--------------------|
//      |    Z    |   Y    |   X    |  Z   |  Y   |  X   |  Z   |  Y   |  X   |
//      | 20   17 |     17 |     17 |   13 |    9 |    5 |    4 |    2 |    0 |
//      |+2n  +2n |    + n |        |      |      |      |      |      |      |
//
//
//      Array16
//      
//      |           upper           |       middle       |       lower        |      |
//      |---------------------------|--------------------|--------------------|------|
//      |    Z    |   Y    |   X    |  Z   |  Y   |  X   |  Z   |  Y   |  X   | "0"  |
//      | 21   18 |     18 |     18 |   14 |   10 |    6 |    5 |    3 |    1 |    0 |
//      |+2n  +2n |    + n |        |      |      |      |      |      |      |      |
//
//
//      Array32
//      
//      |           upper           |       middle       |       lower        |      |
//      |---------------------------|--------------------|--------------------|------|
//      |    Z    |   Y    |   X    |  Z   |  Y   |  X   |  Z   |  Y   |  X   | "00" |
//      | 22   19 |     19 |     19 |   15 |   11 |    7 |    6 |    4 |    2 |    0 |
//      |+2n  +2n |    + n |        |      |      |      |      |      |      |      |


	// Split rs1 into fixed point address fields
	assign zint_e[8:0]		= exu_rs1_data_e[63:55];
	assign yint_e[10:0]		= exu_rs1_data_e[43:33];
	assign xint_e[10:0]		= exu_rs1_data_e[21:11];


	// decode n from rs2
	// VIS 2.04: implementation dep: cases 6, 7 are illegal and result is undefined,
	// but in accordance with previous implementations, we implement 6, 7 as case 5.

//	assign array_upper_sel_e[0] 	= ~exu_rs2_data_e[2] & ~exu_rs2_data_e[1] & ~exu_rs2_data_e[0];
//	assign array_upper_sel_e[1] 	= ~exu_rs2_data_e[2] & ~exu_rs2_data_e[1] &  exu_rs2_data_e[0];
//	assign array_upper_sel_e[2] 	= ~exu_rs2_data_e[2] &  exu_rs2_data_e[1] & ~exu_rs2_data_e[0];
//	assign array_upper_sel_e[3] 	= ~exu_rs2_data_e[2] &  exu_rs2_data_e[1] &  exu_rs2_data_e[0];
//	assign array_upper_sel_e[4] 	=  exu_rs2_data_e[2] & ~exu_rs2_data_e[1] & ~exu_rs2_data_e[0];
//	assign array_upper_sel_e[5] 	=  exu_rs2_data_e[2] & (exu_rs2_data_e[1] |  exu_rs2_data_e[0]);
//
	assign array_upper_data0[13:0]	= {10'b0000000000, zint_e[8:5]                            };
	assign array_upper_data1[13:0]	= {   8'b00000000, zint_e[8:5], yint_e[6]   , xint_e[6]   };
	assign array_upper_data2[13:0]	= {     6'b000000, zint_e[8:5], yint_e[7:6] , xint_e[7:6] };
	assign array_upper_data3[13:0]	= {       4'b0000, zint_e[8:5], yint_e[8:6] , xint_e[8:6] };
	assign array_upper_data4[13:0]	= {         2'b00, zint_e[8:5], yint_e[9:6] , xint_e[9:6] };
	assign array_upper_data5[13:0]	= {                zint_e[8:5], yint_e[10:6], xint_e[10:6]};
//
//
//	// select upper, middle, and lower fields
//	assign array_upper_e[13:0]	= ({14{array_upper_sel_e[0]}} & array_upper_data0[13:0]) |
//					  ({14{array_upper_sel_e[1]}} & array_upper_data1[13:0]) |
//					  ({14{array_upper_sel_e[2]}} & array_upper_data2[13:0]) |
//					  ({14{array_upper_sel_e[3]}} & array_upper_data3[13:0]) |
//					  ({14{array_upper_sel_e[4]}} & array_upper_data4[13:0]) |
//					  ({14{array_upper_sel_e[5]}} & array_upper_data5[13:0]);



exu_edp_dp_mux_macro__mux_pgdec__ports_8__stack_72c__width_14	i_array_mux1		 (
  .muxtst (tcu_muxtest_rep0[2]			),
  .din0 ( array_upper_data0[13:0]		),
  .din1 ( array_upper_data1[13:0]		),
  .din2 ( array_upper_data2[13:0]		),
  .din3 ( array_upper_data3[13:0]		),
  .din4 ( array_upper_data4[13:0]		),
  .din5 ( array_upper_data5[13:0]		),
  .din6 ( array_upper_data5[13:0]		),
  .din7 ( array_upper_data5[13:0]		),
  .sel  ( exu_rs2_data_e[2:0]			),
  .dout ( array_upper_e[13:0]			),
  .test(test));



	assign array_middle_e[11:0]	= {zint_e[4:1], yint_e[5:2], xint_e[5:2]};

	assign array_lower_e[4:0]	= {zint_e[0]  , yint_e[1:0], xint_e[1:0]};


	// shift array result based on array instruction type

	assign array08_data[32:0]	= {2'b00, array_upper_e[13:0], array_middle_e[11:0], array_lower_e[4:0]       };
	assign array16_data[32:0]	= {1'b0 , array_upper_e[13:0], array_middle_e[11:0], array_lower_e[4:0], 1'b0 };
	assign array32_data[32:0]	= {       array_upper_e[13:0], array_middle_e[11:0], array_lower_e[4:0], 2'b00};

//	assign ect_array_res_e[32:0]	= ({33{array08_e}} & array08_data[32:0]) |
//					  ({33{array16_e}} & array16_data[32:0]) |
//					  ({33{array32_e}} & array32_data[32:0]);



exu_edp_dp_mux_macro__mux_aope__ports_3__stack_72c__width_33	i_array_mux2		 (
  .din0 ( array08_data[32:0]			),
  .din1 ( array16_data[32:0]			),
  .din2 ( array32_data[32:0]			),
  .sel0 ( ect_array_sel_e[0]			),
  .sel1 ( ect_array_sel_e[1]			),
  .dout ( array_res_e[32:0]			));




//!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*! End   : Array        !*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!




// NOSINK rename section

assign edp_add_data_e_b63	= add_data_e[63];
assign edp_sub_data_e_b63	= sub_data_e[63];
assign edp_sub_data_e_b31	= sub_data_e[31];


// fixscan start:
assign i_bp_ff_rcc_scanin        = scan_in                  ;
assign i_bp_ff_rs1_scanin        = i_bp_ff_rcc_scanout      ;
assign i_bp_ff_rs2_scanin        = i_bp_ff_rs1_scanout      ;
assign i_bp_ff_rs3_scanin        = i_bp_ff_rs2_scanout      ;
assign i_rm_ff_m_scanin          = i_bp_ff_rs3_scanout      ;
assign i_rm_ff_b_scanin          = i_rm_ff_m_scanout        ;
assign i_rm_ff_w_scanin          = i_rm_ff_b_scanout        ;
assign i_rm_ff_w_plus1_scanin    = i_rm_ff_w_scanout        ;
assign i_rm_ff_w2_scanin         = i_rm_ff_w_plus1_scanout  ;
assign i_rm_ff_w2_plus1_scanin   = i_rm_ff_w2_scanout       ;
assign i_misc_ff_scanin          = i_rm_ff_w2_plus1_scanout ;
assign i_asi0_ff_scanin          = i_misc_ff_scanout        ;
assign i_asi1_ff_scanin          = i_asi0_ff_scanout        ;
assign i_asi_imask_ff_scanin     = i_asi1_ff_scanout        ;
assign scan_out                  = i_asi_imask_ff_scanout   ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_32x__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aope__ports_6__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  output [63:0] dout;





cl_dp1_penc6_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5)
);

mux6s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__mux_aope__ports_4__stack_72c__width_72 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire [71:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din0;
  input [71:0] din1;
  input [71:0] din2;
  input [71:0] din3;
  input sel0;
  input sel1;
  input sel2;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


  output scan_out;




cl_dp1_penc4_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3)
);

mux4s #(72)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
.dout(muxout[71:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__buffsel_none__mux_aonpe__ports_5__stack_72c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




mux5s #(64)  d1_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .sel4(sel4),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_72 (
  din, 
  dout);
  input [71:0] din;
  output [71:0] dout;






buff #(72)  d0_0 (
.in(din[71:0]),
.out(dout[71:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_zero_macro__width_64 (
  din, 
  dout);
  input [63:0] din;
  output dout;






zero #(64)  m0_0 (
.in(din[63:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module exu_edp_dp_inv_macro__dinv_12x__stack_72c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__dnand_16x__left_1__ports_2__stack_72c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__ports_2__stack_72c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nand2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__dnand_32x__left_1__ports_2__stack_72c__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






nand2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_7 (
  din, 
  dout);
  input [6:0] din;
  output [6:0] dout;






buff #(7)  d0_0 (
.in(din[6:0]),
.out(dout[6:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aonpe__ports_8__stack_72c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;
  input [63:0] din5;
  input sel5;
  input [63:0] din6;
  input sel6;
  input [63:0] din7;
  input sel7;
  output [63:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__mux_aope__ports_5__stack_72c__width_72 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire [71:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din0;
  input [71:0] din1;
  input [71:0] din2;
  input [71:0] din3;
  input [71:0] din4;
  input sel0;
  input sel1;
  input sel2;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


  output scan_out;




cl_dp1_penc5_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4)
);

mux5s #(72)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
  .in4(din4[71:0]),
.dout(muxout[71:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__buffsel_none__mux_aonpe__ports_5__stack_72c__width_72 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire [71:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [70:0] so;

  input [71:0] din0;
  input sel0;
  input [71:0] din1;
  input sel1;
  input [71:0] din2;
  input sel2;
  input [71:0] din3;
  input sel3;
  input [71:0] din4;
  input sel4;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [71:0] dout;


  output scan_out;




mux5s #(72)  d1_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .sel3(sel3),
  .sel4(sel4),
  .in0(din0[71:0]),
  .in1(din1[71:0]),
  .in2(din2[71:0]),
  .in3(din3[71:0]),
  .in4(din4[71:0]),
.dout(muxout[71:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);




















endmodule









//
//   xor macro for ports = 2,3
//
//





module exu_edp_dp_xor_macro__ports_2__stack_72c__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;





xor2 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aope__ports_2__stack_72c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_cmp_macro__width_32 (
  din0, 
  din1, 
  dout);
  input [31:0] din0;
  input [31:0] din1;
  output dout;






cmp #(32)  m0_0 (
.in0(din0[31:0]),
.in1(din1[31:0]),
.out(dout)
);










endmodule





//
//   invert macro
//
//





module exu_edp_dp_inv_macro__stack_72c__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__ports_3__stack_72c__width_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  input [2:0] din2;
  output [2:0] dout;






nand3 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.in2(din2[2:0]),
.out(dout[2:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__ports_2__stack_72c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






nand2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_cmp_macro__width_64 (
  din0, 
  din1, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  output dout;






cmp #(64)  m0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout)
);










endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_cmp_macro__width_8 (
  din0, 
  din1, 
  dout);
  input [7:0] din0;
  input [7:0] din1;
  output dout;






cmp #(8)  m0_0 (
.in0(din0[7:0]),
.in1(din1[7:0]),
.out(dout)
);










endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_32x__stack_72c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_32x__stack_72c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aonpe__ports_7__stack_72c__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  input [63:0] din2;
  input sel2;
  input [63:0] din3;
  input sel3;
  input [63:0] din4;
  input sel4;
  input [63:0] din5;
  input sel5;
  input [63:0] din6;
  input sel6;
  output [63:0] dout;





cl_dp1_muxbuff7_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6)
);
mux7s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
.dout(dout[63:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_pgpe__ports_4__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  sel0, 
  sel1, 
  sel2, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input sel0;
  input sel1;
  input sel2;
  input muxtst;
  input test;
  output [63:0] dout;





cl_dp1_penc4_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
  .test(test)
);

mux4 #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule






// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__stack_72c__width_67 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [65:0] so;

  input [66:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [66:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(67)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[66:0]),
.si({scan_in,so[65:0]}),
.so({so[65:0],scan_out}),
.q(dout[66:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__minbuff_1__stack_72c__width_64 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__mux_aope__ports_3__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire [63:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [62:0] so;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(64)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(muxout[63:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__stack_72c__width_66 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [64:0] so;

  input [65:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [65:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);




















endmodule









//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_24x__stack_72c__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_8 (
  din, 
  dout);
  input [7:0] din;
  output [7:0] dout;






buff #(8)  d0_0 (
.in(din[7:0]),
.out(dout[7:0])
);








endmodule





//
//   invert macro
//
//





module exu_edp_dp_inv_macro__stack_72c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






inv #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__ports_3__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  output [63:0] dout;






nand3 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.in2(din2[63:0]),
.out(dout[63:0])
);









endmodule





//
//   nand macro for ports = 2,3,4
//
//





module exu_edp_dp_nand_macro__ports_4__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  output [63:0] dout;






nand4 #(64)  d0_0 (
.in0(din0[63:0]),
.in1(din1[63:0]),
.in2(din2[63:0]),
.in3(din3[63:0]),
.out(dout[63:0])
);









endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






buff #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);








endmodule





//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_zero_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;






zero #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__left_32__stack_72c__width_28 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [26:0] so;

  input [27:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [27:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);




















endmodule









//
//   invert macro
//
//





module exu_edp_dp_inv_macro__stack_72c__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__width_5 (
  din, 
  dout);
  input [4:0] din;
  output [4:0] dout;






buff #(5)  d0_0 (
.in(din[4:0]),
.out(dout[4:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_7 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [6:0] din0;
  input sel0;
  input [6:0] din1;
  input sel1;
  input [6:0] din2;
  input sel2;
  output [6:0] dout;





mux3s #(7)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[6:0]),
  .in1(din1[6:0]),
  .in2(din2[6:0]),
.dout(dout[6:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  input [31:0] din2;
  input sel2;
  output [31:0] dout;





mux3s #(32)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
  .in2(din2[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_32 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [31:0] din0;
  input sel0;
  input [31:0] din1;
  input sel1;
  output [31:0] dout;





mux2s #(32)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[31:0]),
  .in1(din1[31:0]),
.dout(dout[31:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_15 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [14:0] din0;
  input sel0;
  input [14:0] din1;
  input sel1;
  input [14:0] din2;
  input sel2;
  output [14:0] dout;





mux3s #(15)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[14:0]),
  .in1(din1[14:0]),
  .in2(din2[14:0]),
.dout(dout[14:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  output [15:0] dout;





mux2s #(16)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
.dout(dout[15:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





mux2s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_23 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [22:0] din0;
  input sel0;
  input [22:0] din1;
  input sel1;
  input [22:0] din2;
  input sel2;
  output [22:0] dout;





mux3s #(23)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[22:0]),
  .in1(din1[22:0]),
  .in2(din2[22:0]),
.dout(dout[22:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_31 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [30:0] din0;
  input sel0;
  input [30:0] din1;
  input sel1;
  input [30:0] din2;
  input sel2;
  output [30:0] dout;





mux3s #(31)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[30:0]),
  .in1(din1[30:0]),
  .in2(din2[30:0]),
.dout(dout[30:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_3__width_16 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  dout);
  input [15:0] din0;
  input sel0;
  input [15:0] din1;
  input sel1;
  input [15:0] din2;
  input sel2;
  output [15:0] dout;





mux3s #(16)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .sel2(sel2),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
.dout(dout[15:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_edp_dp_buff_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






buff #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);








endmodule





//
//   invert macro
//
//





module exu_edp_dp_inv_macro__stack_72c__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_39 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [38:0] din0;
  input sel0;
  input [38:0] din1;
  input sel1;
  output [38:0] dout;





mux2s #(39)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[38:0]),
  .in1(din1[38:0]),
.dout(dout[38:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_31 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [30:0] din0;
  input sel0;
  input [30:0] din1;
  input sel1;
  output [30:0] dout;





mux2s #(31)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[30:0]),
  .in1(din1[30:0]),
.dout(dout[30:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_24 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [23:0] din0;
  input sel0;
  input [23:0] din1;
  input sel1;
  output [23:0] dout;





mux2s #(24)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[23:0]),
  .in1(din1[23:0]),
.dout(dout[23:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_23 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [22:0] din0;
  input sel0;
  input [22:0] din1;
  input sel1;
  output [22:0] dout;





mux2s #(23)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[22:0]),
  .in1(din1[22:0]),
.dout(dout[22:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_15 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [14:0] din0;
  input sel0;
  input [14:0] din1;
  input sel1;
  output [14:0] dout;





mux2s #(15)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[14:0]),
  .in1(din1[14:0]),
.dout(dout[14:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_48 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [47:0] din0;
  input sel0;
  input [47:0] din1;
  input sel1;
  output [47:0] dout;





mux2s #(48)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[47:0]),
  .in1(din1[47:0]),
.dout(dout[47:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module exu_edp_dp_and_macro__dinv_16x__dnand_6x__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__dbuff_48x__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aodec__ports_8__stack_72c__width_71 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [70:0] din0;
  input [70:0] din1;
  input [70:0] din2;
  input [70:0] din3;
  input [70:0] din4;
  input [70:0] din5;
  input [70:0] din6;
  input [70:0] din7;
  input [2:0] sel;
  output [70:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(71)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[70:0]),
  .in1(din1[70:0]),
  .in2(din2[70:0]),
  .in3(din3[70:0]),
  .in4(din4[70:0]),
  .in5(din5[70:0]),
  .in6(din6[70:0]),
  .in7(din7[70:0]),
.dout(dout[70:0])
);









  



endmodule


//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_72c__width_71 (
  din, 
  dout);
  input [70:0] din;
  output [70:0] dout;






buff #(71)  d0_0 (
.in(din[70:0]),
.out(dout[70:0])
);








endmodule





//
//   invert macro
//
//





module exu_edp_dp_inv_macro__dinv_6x__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__width_3 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [2:0] din0;
  input sel0;
  input [2:0] din1;
  input sel1;
  output [2:0] dout;





mux2s #(3)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[2:0]),
  .in1(din1[2:0]),
.dout(dout[2:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aodec__ports_8__stack_72c__width_64 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input [63:0] din3;
  input [63:0] din4;
  input [63:0] din5;
  input [63:0] din6;
  input [63:0] din7;
  input [2:0] sel;
  output [63:0] dout;





cl_dp1_pdec8_8x  c0_0 (
  .test(1'b1),
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7)
);

mux8s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
  .in3(din3[63:0]),
  .in4(din4[63:0]),
  .in5(din5[63:0]),
  .in6(din6[63:0]),
  .in7(din7[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   cla macro
//
//





module exu_edp_dp_cla_macro__width_64 (
  cin, 
  din0, 
  din1, 
  dout, 
  cout);
  input cin;
  input [63:0] din0;
  input [63:0] din1;
  output [63:0] dout;
  output cout;







cla #(64)  m0_0 (
.cin(cin),
.in0(din0[63:0]),
.in1(din1[63:0]),
.out(dout[63:0]),
.cout(cout)
);












endmodule





//  
//   and macro for ports = 2,3,4
//
//





module exu_edp_dp_and_macro__ports_2__stack_72c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






and2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//
//   xor macro for ports = 2,3
//
//





module exu_edp_dp_xor_macro__ports_2__stack_72c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;





xor2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);








endmodule





//
//   increment macro 
//
//





module exu_edp_dp_increment_macro__width_4 (
  din, 
  cin, 
  dout, 
  cout);
  input [3:0] din;
  input cin;
  output [3:0] dout;
  output cout;






incr #(4)  m0_0 (
.cin(cin),
.in(din[3:0]),
.out(dout[3:0]),
.cout(cout)
);











endmodule





//
//   buff macro
//
//





module exu_edp_dp_buff_macro__stack_64c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule









// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__stack_72c__width_65 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aope__ports_3__stack_72c__width_65 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [64:0] din0;
  input [64:0] din1;
  input [64:0] din2;
  input sel0;
  input sel1;
  output [64:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(65)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
.dout(dout[64:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__mux_aope__ports_7__stack_72c__width_65 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  sel0, 
  sel1, 
  sel2, 
  sel3, 
  sel4, 
  sel5, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire [64:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [63:0] so;

  input [64:0] din0;
  input [64:0] din1;
  input [64:0] din2;
  input [64:0] din3;
  input [64:0] din4;
  input [64:0] din5;
  input [64:0] din6;
  input sel0;
  input sel1;
  input sel2;
  input sel3;
  input sel4;
  input sel5;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


  output scan_out;




cl_dp1_penc7_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .sel2(sel2),
 .sel3(sel3),
 .sel4(sel4),
 .sel5(sel5),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6)
);

mux7s #(65)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
  .in2(din2[64:0]),
  .in3(din3[64:0]),
  .in4(din4[64:0]),
  .in5(din5[64:0]),
  .in6(din6[64:0]),
.dout(muxout[64:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module exu_edp_dp_msff_macro__stack_72c__width_39 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [37:0] so;

  input [38:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [38:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(39)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[38:0]),
.si({scan_in,so[37:0]}),
.so({so[37:0],scan_out}),
.q(dout[38:0])
);




















endmodule









//
//   invert macro
//
//





module exu_edp_dp_inv_macro__stack_72c__width_7 (
  din, 
  dout);
  input [6:0] din;
  output [6:0] dout;






inv #(7)  d0_0 (
.in(din[6:0]),
.out(dout[6:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_2 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [1:0] din0;
  input sel0;
  input [1:0] din1;
  input sel1;
  output [1:0] dout;





mux2s #(2)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[1:0]),
  .in1(din1[1:0]),
.dout(dout[1:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_5 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [4:0] din0;
  input sel0;
  input [4:0] din1;
  input sel1;
  output [4:0] dout;





mux2s #(5)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[4:0]),
  .in1(din1[4:0]),
.dout(dout[4:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_6 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [5:0] din0;
  input sel0;
  input [5:0] din1;
  input sel1;
  output [5:0] dout;





mux2s #(6)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[5:0]),
  .in1(din1[5:0]),
.dout(dout[5:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_1 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__buffsel_none__mux_aonpe__ports_2__stack_72c__width_8 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [7:0] din0;
  input sel0;
  input [7:0] din1;
  input sel1;
  output [7:0] dout;





mux2s #(8)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[7:0]),
  .in1(din1[7:0]),
.dout(dout[7:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module exu_edp_dp_zero_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;






zero #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//  
//   and macro for ports = 2,3,4
//
//





module exu_edp_dp_and_macro__ports_2__stack_72c__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_pgdec__ports_8__stack_72c__width_14 (
  din0, 
  din1, 
  din2, 
  din3, 
  din4, 
  din5, 
  din6, 
  din7, 
  sel, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;
wire psel3;
wire psel4;
wire psel5;
wire psel6;
wire psel7;

  input [13:0] din0;
  input [13:0] din1;
  input [13:0] din2;
  input [13:0] din3;
  input [13:0] din4;
  input [13:0] din5;
  input [13:0] din6;
  input [13:0] din7;
  input [2:0] sel;
  input muxtst;
  input test;
  output [13:0] dout;





cl_dp1_pdec8_8x  c0_0 (
 .sel0(sel[0]),
 .sel1(sel[1]),
 .sel2(sel[2]),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
 .psel3(psel3),
 .psel4(psel4),
 .psel5(psel5),
 .psel6(psel6),
 .psel7(psel7),
  .test(test)
);

mux8 #(14)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .sel3(psel3),
  .sel4(psel4),
  .sel5(psel5),
  .sel6(psel6),
  .sel7(psel7),
  .in0(din0[13:0]),
  .in1(din1[13:0]),
  .in2(din2[13:0]),
  .in3(din3[13:0]),
  .in4(din4[13:0]),
  .in5(din5[13:0]),
  .in6(din6[13:0]),
  .in7(din7[13:0]),
.dout(dout[13:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module exu_edp_dp_mux_macro__mux_aope__ports_3__stack_72c__width_33 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [32:0] din0;
  input [32:0] din1;
  input [32:0] din2;
  input sel0;
  input sel1;
  output [32:0] dout;





cl_dp1_penc3_8x  c0_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(33)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
.dout(dout[32:0])
);









  



endmodule

