// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: dec.v
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
module dec (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  power_throttle, 
  lb_lbist_running, 
  lsu_dec_pmen, 
  lsu_exu_pmen, 
  spc_core_running_status, 
  exu_test_tid0, 
  exu_test_addr0, 
  exu_test_valid0, 
  exu_test_tid1, 
  exu_test_addr1, 
  exu_test_valid1, 
  tlu_cerer_icdp, 
  tlu_dec_pstate_pef, 
  fgu_fprs_fef, 
  tlu_dec_hpstate_hpriv, 
  tlu_dec_pstate_priv, 
  tlu_pstate_am, 
  tlu_window_block, 
  exu0_window_block, 
  exu1_window_block, 
  lsu_cpq_stall, 
  ifu_buf0_inst0, 
  ifu_buf0_inst1, 
  ifu_buf0_inst2, 
  ifu_buf0_inst3, 
  ifu_buf0_inst4, 
  ifu_buf0_inst5, 
  ifu_buf0_inst6, 
  ifu_buf0_inst7, 
  ifu_buf0_excp0, 
  ifu_buf0_excp1, 
  ifu_buf0_excp2, 
  ifu_buf0_excp3, 
  ifu_buf0_excp4, 
  ifu_buf0_excp5, 
  ifu_buf0_excp6, 
  ifu_buf0_excp7, 
  tlu_flush_ifu, 
  pku_load_flush_w, 
  pku_inst_cnt_brtaken00, 
  pku_inst_cnt_brtaken01, 
  pku_inst_cnt_brtaken02, 
  pku_inst_cnt_brtaken03, 
  pku_inst_cnt_brtaken04, 
  pku_inst_cnt_brtaken05, 
  pku_inst_cnt_brtaken06, 
  pku_inst_cnt_brtaken07, 
  pku_inst_cnt_brtaken10, 
  pku_inst_cnt_brtaken11, 
  pku_inst_cnt_brtaken12, 
  pku_inst_cnt_brtaken13, 
  pku_inst_cnt_brtaken14, 
  pku_inst_cnt_brtaken15, 
  pku_inst_cnt_brtaken16, 
  pku_inst_cnt_brtaken17, 
  pku_base_pick_p, 
  pku_raw_pick0_p, 
  pku_raw_pick1_p, 
  pku_annul_ds_dcti_brtaken0_e, 
  pku_annul_ds_dcti_brtaken1_e, 
  pku_valid_e, 
  pku_ds_e, 
  pku_lsu_p, 
  pku_fgu_p, 
  pku_pdist_p, 
  pku_twocycle_p, 
  pku_idest_p, 
  pku_fdest_p, 
  pku_fsrc_rd_p, 
  pku_isrc_rs1_p, 
  pku_isrc_rs2_p, 
  pku_isrc_rd_p, 
  pku_flush_f1, 
  pku_flush_f2, 
  pku_flush_lm, 
  pku_flush_lb, 
  pku_flush_m, 
  pku_flush_b, 
  spu_mult_request, 
  lsu_block_store_stall, 
  lsu_block_store_rd, 
  lsu_block_store_tid, 
  tlu_dtlb_reload_stall, 
  fgu_ecc_asi_stall, 
  exu0_oddwin_b, 
  exu1_oddwin_b, 
  fgu_idiv_stall, 
  fgu_fdiv_stall, 
  dec_br_taken_e1, 
  del_pick_d, 
  dec_inst0_rd_d, 
  dec_inst1_rd_d, 
  dec_rs1_addr0_e, 
  dec_rs1_addr1_e, 
  dec_inst0_d, 
  dec_inst1_d, 
  dec_decode0_d, 
  dec_decode1_d, 
  dec_valid0_d, 
  dec_valid1_d, 
  dec_true_valid_e, 
  dec_tid0_d, 
  dec_tid1_d, 
  dec_tid0_p, 
  dec_tid1_p, 
  dec_raw_pick_p, 
  dec_inst0_rs1_p, 
  dec_inst0_rs2_p, 
  dec_inst0_rs3_p, 
  dec_inst0_rs1_vld_p, 
  dec_inst0_rs2_vld_p, 
  dec_inst0_rs3_vld_p, 
  dec_inst1_rs1_p, 
  dec_inst1_rs2_p, 
  dec_inst1_rs3_p, 
  dec_inst1_rs1_vld_p, 
  dec_inst1_rs2_vld_p, 
  dec_inst1_rs3_vld_p, 
  dec_frf_r1_addr_d, 
  dec_frf_r2_addr_d, 
  dec_frf_r1_vld_d, 
  dec_frf_r2_vld_d, 
  dec_frf_r1_32b_d, 
  dec_frf_r2_32b_d, 
  dec_frf_r1_odd32b_d, 
  dec_frf_r2_odd32b_d, 
  dec_frf_w_addr_d, 
  dec_frf_w_vld_d, 
  dec_frf_w_32b_d, 
  dec_frf_w_odd32b_d, 
  dec_exu_src_vld_d, 
  dec_irf_w_addr_d, 
  dec_frf_store_d, 
  dec_fsr_store_d, 
  dec_fgu_op3_d, 
  dec_fgu_opf_d, 
  dec_fgu_decode_d, 
  dec_fgu_tid_d, 
  dec_flush_f1, 
  dec_flush_f2, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_flush_m, 
  dec_flush_b, 
  dec_spu_grant_d, 
  dec_spu_grant_fgu_d, 
  dec_block_store_b, 
  dec_load_flush_w, 
  dec_exc0_m, 
  dec_exc1_m, 
  dec_inst0_cnt, 
  dec_inst1_cnt, 
  dec_tid0_m, 
  dec_tid1_m, 
  dec_inst_valid_m, 
  dec_lsu_inst_m, 
  dec_fgu_inst_m, 
  dec_cti_inst_m, 
  dec_illegal_inst_m, 
  dec_icache_perr_m, 
  dec_priv_exc_m, 
  dec_hpriv_exc_m, 
  dec_fpdisable_exc_m, 
  dec_br_taken_m, 
  dec_done_inst_m, 
  dec_retry_inst_m, 
  dec_sir_inst_m, 
  dec_annul_ds_m, 
  dec_ds_m, 
  dec_fgu_sel_e, 
  dec_fgu_sel_m, 
  dec_lsu_sel0_e, 
  dec_lsu_sel1_e, 
  dec_lsu_sel0_lower_e, 
  dec_lsu_sel1_lower_e, 
  dec_lsu_sel0_upper_e, 
  dec_lsu_sel1_upper_e, 
  dec_rs1_addr0_upper_e, 
  dec_rs1_addr1_upper_e, 
  dec_ld_inst_e, 
  dec_st_inst_e, 
  dec_fsr_ldst_e, 
  dec_fpldst_inst_e, 
  dec_ldst_dbl_e, 
  dec_pref_inst_e, 
  dec_flush_inst_e, 
  dec_memstbar_inst_e, 
  dec_ldst_sz_e, 
  dec_frf_r2_addr_e, 
  dec_sr_inst_e, 
  dec_pr_inst_e, 
  dec_hpr_inst_e, 
  dec_casa_inst_e, 
  dec_ldstub_inst_e, 
  dec_swap_inst_e, 
  dec_altspace_d, 
  dec_sign_ext_e, 
  dec_sraddr_e, 
  dec_imm_asi_vld_d, 
  dec_imm_asi_d, 
  dec_lsu_tid0_d, 
  dec_lsu_tid1_d, 
  dec_lsu_tg_d, 
  dec_lsu_rd_e, 
  dec_ld_inst_d, 
  dec_instr0_type_d, 
  dec_instr1_type_d, 
  dec_valid_e, 
  dec_pmu_valid_e, 
  dec_fgu_valid_e, 
  dec_exu_clken, 
  dec_lsu_sel0_d, 
  dec_ierr_d, 
  dec_block_store_stall, 
  scan_out);
wire del_scanin;
wire del_scanout;
wire ded0_scanin;
wire ded0_scanout;
wire [1:0] del_tg_clken;
wire del_test0_sel_p;
wire del_twocycle0_std_p;
wire del_twocycle0_rs2_p;
wire del_default0_sel_p;
wire [4:0] del_test_addr0_p;
wire del_noshift0_d;
wire [1:0] ded_ferr_p;
wire [1:0] ded_perr_p;
wire [1:0] ded_ferr_d;
wire [1:0] ded_perr_d;
wire [1:0] ded_legal_p;
wire ded_oddwin0_d;
wire [4:0] ded_exc0_d;
wire ded1_scanin;
wire ded1_scanout;
wire del_test1_sel_p;
wire del_twocycle1_std_p;
wire del_twocycle1_rs2_p;
wire del_default1_sel_p;
wire [4:0] del_test_addr1_p;
wire del_noshift1_d;
wire ded_oddwin1_d;
wire [4:0] ded_exc1_d;
wire [1:0] dcd_sir_d;
wire [1:0] dcd_stdfa_d;
wire [1:0] dcd_save_restore_d;
wire [1:0] dcd_exu_src_d;
wire [1:0] dcd_killfgu_d;
wire [1:0] dcd_lsize0_d;
wire [1:0] dcd_lsu_sign_ext_d;
wire [1:0] dcd_load_d;
wire [1:0] dcd_store_d;
wire [1:0] dcd_lsdouble_d;
wire [1:0] dcd_prefetch_d;
wire [1:0] dcd_flush_d;
wire [1:0] dcd_memstbar_d;
wire [1:0] dcd_hpr_d;
wire [1:0] dcd_pr_d;
wire [1:0] dcd_priv_d;
wire [1:0] dcd_sr_d;
wire [1:0] dcd_casa_d;
wire [1:0] dcd_ldstub_d;
wire [1:0] dcd_alt_d;
wire [1:0] dcd_alti_d;
wire [1:0] dcd_swap_d;
wire [1:0] dcd_done_d;
wire [1:0] dcd_retry_d;
wire [1:0] dcd_fsrc_rs1_d;
wire [1:0] dcd_fsrc_rs2_d;
wire [1:0] dcd_fpdest_single_d;
wire [1:0] dcd_fp_rs1_single_d;
wire [1:0] dcd_fp_rs2_single_d;
wire [1:0] dcd_fsrsync_d;
wire [1:0] dcd_callclass_d;
wire [1:0] dcd_specbr_d;
wire [1:0] dcd_specfp_d;
wire [1:0] dcd_tcc_d;
wire [1:0] dcd_sethi_d;
wire [1:0] dcd_fpdisable_d;
wire [1:0] dcd_wrtick_d;
wire [1:0] dcd_lsize1_d;

   input l2clk;
   input scan_in;
   input tcu_pce_ov;		// scan signals
   input spc_aclk;
   input spc_bclk;
   input tcu_scan_en;

   input [2:0] power_throttle; // power throttle, [2:0] is encoded number of stalls in 8 cycle window
			       // 000 - no stalls, 001 - 1 stall, ... 111 - 7 stalls 

   input lb_lbist_running;

   input lsu_dec_pmen;		// power management enable for dec
   input lsu_exu_pmen;		// power management enable for exu

   input [7:0] spc_core_running_status;	// active bits for each of the threads

   input [1:0] exu_test_tid0;		// exu test interface to the irf (bist or ecc errors) 
   input [4:0] exu_test_addr0;
   input exu_test_valid0;

   input [1:0] exu_test_tid1;		// exu test interface to the irf (bist or ecc errors)
   input [4:0] exu_test_addr1;
   input exu_test_valid1;

   input tlu_cerer_icdp;		// enable for icdp perr

   input [7:0] tlu_dec_pstate_pef;     	// pstate enable fp bit
   input [7:0] fgu_fprs_fef;	       	// fprs enable fp bit
   input [7:0] tlu_dec_hpstate_hpriv;  	// hpriv bits
   input [7:0] tlu_dec_pstate_priv;    	// priv bits

   input [7:0] tlu_pstate_am;		// address mask bit from the pstate register

   input [1:0] tlu_window_block;	// tlu is doing a window operation and needs a hole created

   input exu0_window_block;		// exu0 is doing a window operation and needs a hole created
   input exu1_window_block;      	// exu1 is doing a window operation and needs a hole created

   input lsu_cpq_stall;			// lsu stalls all other lsu ops at decode

   input [32:0] ifu_buf0_inst0;		// instructions for each of the threads
   input [32:0] ifu_buf0_inst1;
   input [32:0] ifu_buf0_inst2;
   input [32:0] ifu_buf0_inst3;
   input [32:0] ifu_buf0_inst4;
   input [32:0] ifu_buf0_inst5;
   input [32:0] ifu_buf0_inst6;
   input [32:0] ifu_buf0_inst7;

   input [4:0] ifu_buf0_excp0;		// encoding of the various fetch exceptions that can occur
   input [4:0] ifu_buf0_excp1;
   input [4:0] ifu_buf0_excp2;
   input [4:0] ifu_buf0_excp3;
   input [4:0] ifu_buf0_excp4;
   input [4:0] ifu_buf0_excp5;
   input [4:0] ifu_buf0_excp6;
   input [4:0] ifu_buf0_excp7;

   input [7:0]  tlu_flush_ifu;

   input [7:0]  pku_load_flush_w;

   input [1:0]  pku_inst_cnt_brtaken00;		// count of instructions at e,m,b stages needed to compute the PC at decode (to tlu)
   input [1:0]  pku_inst_cnt_brtaken01;
   input [1:0]  pku_inst_cnt_brtaken02;
   input [1:0]  pku_inst_cnt_brtaken03;
   input [1:0]  pku_inst_cnt_brtaken04;
   input [1:0]  pku_inst_cnt_brtaken05;
   input [1:0]  pku_inst_cnt_brtaken06;
   input [1:0]  pku_inst_cnt_brtaken07;

   input [1:0]  pku_inst_cnt_brtaken10;		// count of instructions at e,m,b stages needed to compute the PC at decode (to tlu)
   input [1:0]  pku_inst_cnt_brtaken11;
   input [1:0]  pku_inst_cnt_brtaken12;
   input [1:0]  pku_inst_cnt_brtaken13;
   input [1:0]  pku_inst_cnt_brtaken14;
   input [1:0]  pku_inst_cnt_brtaken15;
   input [1:0]  pku_inst_cnt_brtaken16;
   input [1:0]  pku_inst_cnt_brtaken17;

   input [7:0]  pku_base_pick_p;   // base pick signals with swl_cancel_pick but not decode cancel

   input [3:0]  pku_raw_pick0_p;   // raw pick signals to ifu to mux pc addresses (no swl_cancel_pick or decode cancel)
   input [7:4]  pku_raw_pick1_p;   

   input [7:0]  pku_annul_ds_dcti_brtaken0_e;	// the DS of the dcti at the e stage is annulled this cycle
   input [7:0]  pku_annul_ds_dcti_brtaken1_e;	// the DS of the dcti at the e stage is annulled this cycle

   input [7:0] 	pku_valid_e;		// inst at e stage is valid (takes annul into account)

   input [7:0]  pku_ds_e;  		// inst at e stage is a DS (tlu)

   input [7:0] 	pku_lsu_p;		// lsu op at pick
   input [7:0] 	pku_fgu_p;		// fgu op at pick
   input [7:0] 	pku_pdist_p;		// pdist op at pick
   input [7:0] 	pku_twocycle_p;		// twocycle op at pick (std or casa)
   input [7:0] 	pku_idest_p;		// inst at p has int dest
   input [7:0] 	pku_fdest_p;		// inst at p has fp dest

   input [7:0] 	pku_fsrc_rd_p;		// inst at p has fp rd src
   input [7:0] 	pku_isrc_rs1_p;		// inst at p has rs1 src
   input [7:0] 	pku_isrc_rs2_p;		// inst at p has rs2 src
   input [7:0] 	pku_isrc_rd_p;		// inst at p has rd src

   input [7:0] 	pku_flush_f1;		// flush inst at f1 in the fgu pipe
   input [7:0] 	pku_flush_f2;		// flush inst at f2 in the fgu pipe
   input [7:0] 	pku_flush_lm;		// flush inst at m in the lsu pipe
   input [7:0] 	pku_flush_lb;		// flush inst at b in the lsu pipe
   input [7:0] 	pku_flush_m;		// flush inst at m in the integer pipe
   input [7:0] 	pku_flush_b;		// flush inst at b in the integer pipe

   input 	spu_mult_request;	// spu is requesting a hole be created for running a crypto multiply through the fgu pipe

   input       lsu_block_store_stall;   // stall decode to read the sources of the store
   input [4:3] lsu_block_store_rd;	// rd of the block store
   input [2:0] lsu_block_store_tid;	// tid of the block store

   input 	tlu_dtlb_reload_stall;  // stall decode of lsu ops due to dtlb fill operation
   
   input fgu_ecc_asi_stall;		// fgu ecc stall

   input [3:0]  exu0_oddwin_b;		// is the current window odd or not for TG0           
   input [3:0]  exu1_oddwin_b;		// is the current window odd or not for TG1           

   input [1:0]	fgu_idiv_stall;    	// integer divide stall; no int ops to FGU
   input fgu_fdiv_stall;    		// float divide stall; no float loads to the LSU

   input [1:0]  dec_br_taken_e1;

   // exu interface
   output [7:0]	del_pick_d;

   output [4:0] dec_inst0_rd_d;		// rd for TG0 at decode
   output [4:0] dec_inst1_rd_d;		// rd for TG1 at decode

   output dec_rs1_addr0_e;		// tell exu to put rs1 onto the lsu address bus for casa
   output dec_rs1_addr1_e;	

   output [32:0] dec_inst0_d;		// inst for TG0 at decode
   output [32:0] dec_inst1_d;		// inst for TG1 at decode

   output 	 dec_decode0_d;		// inst at d stage for TG0 is decoded this cycle
   output 	 dec_decode1_d;		// inst at d stage for TG1 is decoded this cycle
   output 	 dec_valid0_d;		// inst at d stage for TG0 is valid this cycle
   output 	 dec_valid1_d;		// inst at d stage for TG1 is valid this cycle

   output [1:0]	 dec_true_valid_e;	// inst at E are valid taking exceptions into account

   output [1:0]  dec_tid0_d;		// TID for exu0
   output [1:0]  dec_tid1_d;		// TID for exu1
   output [1:0]  dec_tid0_p;		// TID for IRF
   output [1:0]  dec_tid1_p;

   output [7:0]  dec_raw_pick_p;	// fast signals for tlu address calculations

   output [4:0]  dec_inst0_rs1_p;	// TG0 rs1      
   output [4:0]  dec_inst0_rs2_p;	// TG0 rs2      
   output [4:0]  dec_inst0_rs3_p;	// TG0 rs3      
   output 	 dec_inst0_rs1_vld_p;	// TG0 rs1 valid
   output 	 dec_inst0_rs2_vld_p;	// TG0 rs2 valid	
   output 	 dec_inst0_rs3_vld_p;	// TG0 rs3 valid

   output [4:0]  dec_inst1_rs1_p;	// TG1 rs1      
   output [4:0]  dec_inst1_rs2_p;	// TG1 rs2      
   output [4:0]  dec_inst1_rs3_p;	// TG1 rs3      
   output 	 dec_inst1_rs1_vld_p;	// TG1 rs1 valid
   output 	 dec_inst1_rs2_vld_p;	// TG1 rs2 valid
   output 	 dec_inst1_rs3_vld_p;	// TG1 rs3 valid

   // fgu interface
   output [4:0]  dec_frf_r1_addr_d;	// FRF r1 read addr
   output [4:0]  dec_frf_r2_addr_d;	// FRF r2 read addr (including store-floats)
   output 	 dec_frf_r1_vld_d;	// FRF r1 read valid
   output 	 dec_frf_r2_vld_d;	// FRF r2 read valid
   output 	 dec_frf_r1_32b_d;	// FRF rs1 source is single-precision
   output 	 dec_frf_r2_32b_d;	// FRF rs2 source is single-precision
   output 	 dec_frf_r1_odd32b_d;	// FRF rs1 source is single-precision and odd
   output 	 dec_frf_r2_odd32b_d;	// FRF rs2 source is single-precision and odd
   output [4:0]  dec_frf_w_addr_d;	// FRF write addr
   output 	 dec_frf_w_vld_d;	// FRF write addr is valid
   output 	 dec_frf_w_32b_d;	// FRF write is single precision
   output 	 dec_frf_w_odd32b_d;	// FRF write is single precision; rd is odd
   output 	 dec_exu_src_vld_d;	// FGU op has any valid exu src
   output [4:0]  dec_irf_w_addr_d;      // RD for an integer op executed by the FGU
   output 	 dec_frf_store_d;	// store-float of FRF data
   output 	 dec_fsr_store_d;	// store-float of FSR data
   output [5:0]  dec_fgu_op3_d;		// op3 field
   output [7:0]  dec_fgu_opf_d;		// opf field
   output 	 dec_fgu_decode_d;	// FGU op decoded this cycle
   output [2:0]  dec_fgu_tid_d;		// TID for FGU op
   output 	 dec_flush_f1;		// Flush f1 stage of the FGU
   output 	 dec_flush_f2;		// Flush f2 stage of the FGU
   output 	 dec_flush_lm;		// Flush the m stage of a load
   output 	 dec_flush_lb;		// Flush the bypass stage of a load
   output [1:0]  dec_flush_m;           // Flush the m stage of the exu's
   output [1:0]  dec_flush_b;           // Flush the b stage of the exu's
   output 	 dec_spu_grant_d;	// SPU grant for a crypto multiply
   output 	 dec_spu_grant_fgu_d;	// SPU grant for a crypto multiply
   output [7:0]  dec_block_store_b;     // to the TLU
   output [1:0]  dec_load_flush_w;	// to IFU
   
   
   // tlu interface
   output [4:0] dec_exc0_m;             // encoded exception status to tlu
   output [4:0] dec_exc1_m;

   output [1:0]  dec_inst0_cnt;	 		// count of instructions at e,m,b stages for inst at decode (TG0)
   output [1:0]  dec_inst1_cnt;     		// count of instructions at e,m,b stages for inst at decode (TG1)

   output [1:0]  dec_tid0_m;			// TID for inst TG0
   output [1:0]  dec_tid1_m;			// TID for inst TG1
   output [1:0]  dec_inst_valid_m;		// valid inst
   output [1:0]  dec_lsu_inst_m;		// lsu inst
   output [1:0]  dec_fgu_inst_m;		// fgu inst
   output [1:0]  dec_cti_inst_m;		// cti inst

   output [1:0]  dec_illegal_inst_m;		// illegal inst
   output [1:0]  dec_icache_perr_m;	        // icache parity error at m stage
   output [1:0]  dec_priv_exc_m;		// priv exception
   output [1:0]  dec_hpriv_exc_m;		// hpriv exception
   output [1:0]  dec_fpdisable_exc_m;   	// fp disable exception
   output [1:0]  dec_br_taken_m;		// br is taken at m stage	
   output [1:0]  dec_done_inst_m;		// DONE
   output [1:0]  dec_retry_inst_m;		// RETRY
   output [1:0]  dec_sir_inst_m;		// SIR

   output [1:0]  dec_annul_ds_m;		// DS of branch is annuled
   output [1:0]  dec_ds_m;			// this inst is DS

   output [1:0]  dec_fgu_sel_e;			// mux select between TG's for fgu ops
   output [1:0]	 dec_fgu_sel_m;			// mux select between TG's for fgu ops

   output 	 dec_lsu_sel0_e;		// mux select between TG's for lsu ops
   output 	 dec_lsu_sel1_e;

   output 	 dec_lsu_sel0_lower_e;		// mux selects taking pstate AM into account (exu)
   output 	 dec_lsu_sel1_lower_e;

   output 	 dec_lsu_sel0_upper_e;		// mux selects taking pstate AM into account (exu)
   output 	 dec_lsu_sel1_upper_e;

   output 	 dec_rs1_addr0_upper_e;
   output 	 dec_rs1_addr1_upper_e;

   // lsu interface
   output 	 dec_ld_inst_e;         	// operation is a load or load-like
   output 	 dec_st_inst_e;         	// operation is a store or store-like
   output 	 dec_fsr_ldst_e;         	// ldfsr, stfsr inst
   output 	 dec_fpldst_inst_e;     	// FP load or store
   output 	 dec_ldst_dbl_e;        	// ldd inst
   output 	 dec_pref_inst_e;       	// prefetch inst
   output 	 dec_flush_inst_e;      	// flush inst
   output 	 dec_memstbar_inst_e;		// membar, stbar inst
   output [1:0]  dec_ldst_sz_e;			// size of the memory reference
   output [4:3]  dec_frf_r2_addr_e;		// FRF r2 read addr 
   output 	 dec_sr_inst_e;        		// state register instruction
   output 	 dec_pr_inst_e;        		// privileged instruction
   output 	 dec_hpr_inst_e;        	// hypervisor instruction
   output 	 dec_casa_inst_e;       	// casa inst
   output 	 dec_ldstub_inst_e;     	// ldstub inst
   output 	 dec_swap_inst_e;       	// swap inst
   output 	 dec_altspace_d;		// is an alternate inst
   output 	 dec_sign_ext_e;        	// is a signed load
   output [4:0]  dec_sraddr_e;          	// register number for rdasr inst
   output 	 dec_imm_asi_vld_d;     	// immediate form of ASI's
   output [7:0]  dec_imm_asi_d;         	// value of ASI access
   output [1:0]  dec_lsu_tid0_d;		// lsu tid at d; real lsu
   output [1:0]  dec_lsu_tid1_d;		// lsu tid at d; real lsu
   output        dec_lsu_tg_d;			// lsu thread group at d
   output [4:0]  dec_lsu_rd_e;			// lsu rd at e
   output 	 dec_ld_inst_d;			// load inst decoded

   // pmu interface
   output [9:0] dec_instr0_type_d;		// pmu stuff thread group 0
   output [9:0] dec_instr1_type_d;		// pmu stuff thread group 1

   output [1:0]  dec_valid_e;			// valid for inst at e stage (takes annul into account)
   output [1:0]  dec_pmu_valid_e;		// valid for inst at e stage (takes annul into account); dont include ifetch_err
   output 	 dec_fgu_valid_e;		// fgu is valid at e stage (takes annul into account)


   output [1:0] dec_exu_clken;			// clk enable signals to the exu
   output       dec_lsu_sel0_d;                 // to the pmu to decide which tid to use for lsu at d stage

   output [1:0] dec_ierr_d;  		// tell pku that an inst error has occurred: illegal, parity error or ifetch error

   output [7:0] dec_block_store_stall;  // prevent window ops from coming too early after a block store 

   output        scan_out;

   dec_del_ctl del (
		    .scan_in(del_scanin),
		    .scan_out(del_scanout),
		    .l2clk(l2clk),
		    .dec_inst0_rs1_d(dec_inst0_d[18:14]),
		    .dec_inst0_rs2_d(dec_inst0_d[4:0]),
		    .dec_inst0_b31(dec_inst0_d[31]),
		    .dec_inst0_raw_rd_d(dec_inst0_d[29:25]),
		    .dec_inst0_op3_d(dec_inst0_d[24:19]),
		    .dec_inst0_opf_d(dec_inst0_d[12:5]),
		    .dec_inst1_rs1_d(dec_inst1_d[18:14]),
		    .dec_inst1_rs2_d(dec_inst1_d[4:0]),
		    .dec_inst1_b31(dec_inst1_d[31]),
		    .dec_inst1_raw_rd_d(dec_inst1_d[29:25]),
		    .dec_inst1_op3_d(dec_inst1_d[24:19]),
		    .dec_inst1_opf_d(dec_inst1_d[12:5]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .lsu_dec_pmen(lsu_dec_pmen),
  .lsu_exu_pmen(lsu_exu_pmen),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .power_throttle(power_throttle[2:0]),
  .lb_lbist_running(lb_lbist_running),
  .pku_idest_p(pku_idest_p[7:0]),
  .pku_fdest_p(pku_fdest_p[7:0]),
  .pku_fsrc_rd_p(pku_fsrc_rd_p[7:0]),
  .pku_lsu_p(pku_lsu_p[7:0]),
  .pku_fgu_p(pku_fgu_p[7:0]),
  .pku_pdist_p(pku_pdist_p[7:0]),
  .pku_twocycle_p(pku_twocycle_p[7:0]),
  .pku_inst_cnt_brtaken00(pku_inst_cnt_brtaken00[1:0]),
  .pku_inst_cnt_brtaken01(pku_inst_cnt_brtaken01[1:0]),
  .pku_inst_cnt_brtaken02(pku_inst_cnt_brtaken02[1:0]),
  .pku_inst_cnt_brtaken03(pku_inst_cnt_brtaken03[1:0]),
  .pku_inst_cnt_brtaken04(pku_inst_cnt_brtaken04[1:0]),
  .pku_inst_cnt_brtaken05(pku_inst_cnt_brtaken05[1:0]),
  .pku_inst_cnt_brtaken06(pku_inst_cnt_brtaken06[1:0]),
  .pku_inst_cnt_brtaken07(pku_inst_cnt_brtaken07[1:0]),
  .pku_inst_cnt_brtaken10(pku_inst_cnt_brtaken10[1:0]),
  .pku_inst_cnt_brtaken11(pku_inst_cnt_brtaken11[1:0]),
  .pku_inst_cnt_brtaken12(pku_inst_cnt_brtaken12[1:0]),
  .pku_inst_cnt_brtaken13(pku_inst_cnt_brtaken13[1:0]),
  .pku_inst_cnt_brtaken14(pku_inst_cnt_brtaken14[1:0]),
  .pku_inst_cnt_brtaken15(pku_inst_cnt_brtaken15[1:0]),
  .pku_inst_cnt_brtaken16(pku_inst_cnt_brtaken16[1:0]),
  .pku_inst_cnt_brtaken17(pku_inst_cnt_brtaken17[1:0]),
  .exu_test_tid0(exu_test_tid0[1:0]),
  .exu_test_addr0(exu_test_addr0[4:0]),
  .exu_test_valid0(exu_test_valid0),
  .exu_test_tid1(exu_test_tid1[1:0]),
  .exu_test_addr1(exu_test_addr1[4:0]),
  .exu_test_valid1(exu_test_valid1),
  .ded_exc0_d(ded_exc0_d[4:0]),
  .ded_exc1_d(ded_exc1_d[4:0]),
  .tlu_dec_pstate_pef(tlu_dec_pstate_pef[7:0]),
  .fgu_fprs_fef(fgu_fprs_fef[7:0]),
  .tlu_dec_hpstate_hpriv(tlu_dec_hpstate_hpriv[7:0]),
  .tlu_dec_pstate_priv(tlu_dec_pstate_priv[7:0]),
  .dcd_wrtick_d(dcd_wrtick_d[1:0]),
  .lsu_cpq_stall(lsu_cpq_stall),
  .dcd_callclass_d(dcd_callclass_d[1:0]),
  .dcd_tcc_d(dcd_tcc_d[1:0]),
  .dcd_specbr_d(dcd_specbr_d[1:0]),
  .dcd_specfp_d(dcd_specfp_d[1:0]),
  .dcd_exu_src_d(dcd_exu_src_d[1:0]),
  .dcd_killfgu_d(dcd_killfgu_d[1:0]),
  .dcd_sir_d(dcd_sir_d[1:0]),
  .dcd_stdfa_d(dcd_stdfa_d[1:0]),
  .pku_valid_e(pku_valid_e[7:0]),
  .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[7:0]),
  .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[7:0]),
  .exu0_window_block(exu0_window_block),
  .exu1_window_block(exu1_window_block),
  .tlu_window_block(tlu_window_block[1:0]),
  .fgu_idiv_stall(fgu_idiv_stall[1:0]),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .fgu_ecc_asi_stall(fgu_ecc_asi_stall),
  .dcd_fpdisable_d(dcd_fpdisable_d[1:0]),
  .dcd_lsize0_d(dcd_lsize0_d[1:0]),
  .dcd_lsize1_d(dcd_lsize1_d[1:0]),
  .dcd_lsu_sign_ext_d(dcd_lsu_sign_ext_d[1:0]),
  .dcd_load_d(dcd_load_d[1:0]),
  .dcd_store_d(dcd_store_d[1:0]),
  .dcd_sethi_d(dcd_sethi_d[1:0]),
  .dcd_lsdouble_d(dcd_lsdouble_d[1:0]),
  .dcd_prefetch_d(dcd_prefetch_d[1:0]),
  .dcd_flush_d(dcd_flush_d[1:0]),
  .dcd_memstbar_d(dcd_memstbar_d[1:0]),
  .dcd_pr_d(dcd_pr_d[1:0]),
  .dcd_priv_d(dcd_priv_d[1:0]),
  .dcd_hpr_d(dcd_hpr_d[1:0]),
  .dcd_sr_d(dcd_sr_d[1:0]),
  .dcd_casa_d(dcd_casa_d[1:0]),
  .dcd_ldstub_d(dcd_ldstub_d[1:0]),
  .dcd_alt_d(dcd_alt_d[1:0]),
  .dcd_alti_d(dcd_alti_d[1:0]),
  .dcd_swap_d(dcd_swap_d[1:0]),
  .dcd_fsrc_rs1_d(dcd_fsrc_rs1_d[1:0]),
  .dcd_fsrc_rs2_d(dcd_fsrc_rs2_d[1:0]),
  .dcd_fpdest_single_d(dcd_fpdest_single_d[1:0]),
  .dcd_fp_rs1_single_d(dcd_fp_rs1_single_d[1:0]),
  .dcd_fp_rs2_single_d(dcd_fp_rs2_single_d[1:0]),
  .dcd_fsrsync_d(dcd_fsrsync_d[1:0]),
  .dcd_done_d(dcd_done_d[1:0]),
  .dcd_retry_d(dcd_retry_d[1:0]),
  .dcd_save_restore_d(dcd_save_restore_d[1:0]),
  .ded_oddwin0_d(ded_oddwin0_d),
  .ded_oddwin1_d(ded_oddwin1_d),
  .ded_perr_p(ded_perr_p[1:0]),
  .ded_ferr_p(ded_ferr_p[1:0]),
  .ded_legal_p(ded_legal_p[1:0]),
  .pku_base_pick_p(pku_base_pick_p[7:0]),
  .pku_raw_pick0_p(pku_raw_pick0_p[3:0]),
  .pku_raw_pick1_p(pku_raw_pick1_p[7:4]),
  .pku_ds_e(pku_ds_e[7:0]),
  .pku_load_flush_w(pku_load_flush_w[7:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .pku_flush_f1(pku_flush_f1[7:0]),
  .pku_flush_f2(pku_flush_f2[7:0]),
  .pku_flush_lm(pku_flush_lm[7:0]),
  .pku_flush_lb(pku_flush_lb[7:0]),
  .pku_flush_m(pku_flush_m[7:0]),
  .pku_flush_b(pku_flush_b[7:0]),
  .dec_br_taken_e1(dec_br_taken_e1[1:0]),
  .spu_mult_request(spu_mult_request),
  .lsu_block_store_stall(lsu_block_store_stall),
  .lsu_block_store_rd(lsu_block_store_rd[4:3]),
  .lsu_block_store_tid(lsu_block_store_tid[2:0]),
  .tlu_dtlb_reload_stall(tlu_dtlb_reload_stall),
  .tlu_pstate_am(tlu_pstate_am[7:0]),
  .dec_valid0_d(dec_valid0_d),
  .dec_valid1_d(dec_valid1_d),
  .dec_decode0_d(dec_decode0_d),
  .dec_decode1_d(dec_decode1_d),
  .del_noshift0_d(del_noshift0_d),
  .del_noshift1_d(del_noshift1_d),
  .dec_inst0_rd_d(dec_inst0_rd_d[4:0]),
  .dec_inst1_rd_d(dec_inst1_rd_d[4:0]),
  .dec_tid0_d(dec_tid0_d[1:0]),
  .dec_tid1_d(dec_tid1_d[1:0]),
  .dec_tid0_p(dec_tid0_p[1:0]),
  .dec_tid1_p(dec_tid1_p[1:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_pmu_valid_e(dec_pmu_valid_e[1:0]),
  .dec_fgu_valid_e(dec_fgu_valid_e),
  .dec_frf_r1_addr_d(dec_frf_r1_addr_d[4:0]),
  .dec_frf_r2_addr_d(dec_frf_r2_addr_d[4:0]),
  .dec_frf_r2_addr_e(dec_frf_r2_addr_e[4:3]),
  .dec_frf_r1_vld_d(dec_frf_r1_vld_d),
  .dec_frf_r2_vld_d(dec_frf_r2_vld_d),
  .dec_frf_r1_32b_d(dec_frf_r1_32b_d),
  .dec_frf_r2_32b_d(dec_frf_r2_32b_d),
  .dec_frf_r1_odd32b_d(dec_frf_r1_odd32b_d),
  .dec_frf_r2_odd32b_d(dec_frf_r2_odd32b_d),
  .dec_frf_w_addr_d(dec_frf_w_addr_d[4:0]),
  .dec_frf_w_vld_d(dec_frf_w_vld_d),
  .dec_frf_w_32b_d(dec_frf_w_32b_d),
  .dec_frf_w_odd32b_d(dec_frf_w_odd32b_d),
  .dec_spu_grant_d(dec_spu_grant_d),
  .dec_spu_grant_fgu_d(dec_spu_grant_fgu_d),
  .dec_exu_src_vld_d(dec_exu_src_vld_d),
  .dec_irf_w_addr_d(dec_irf_w_addr_d[4:0]),
  .dec_frf_store_d(dec_frf_store_d),
  .dec_fsr_store_d(dec_fsr_store_d),
  .dec_fgu_op3_d(dec_fgu_op3_d[5:0]),
  .dec_fgu_opf_d(dec_fgu_opf_d[7:0]),
  .dec_fgu_decode_d(dec_fgu_decode_d),
  .dec_fgu_tid_d(dec_fgu_tid_d[2:0]),
  .dec_flush_f1(dec_flush_f1),
  .dec_flush_f2(dec_flush_f2),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .dec_flush_m(dec_flush_m[1:0]),
  .dec_flush_b(dec_flush_b[1:0]),
  .dec_block_store_b(dec_block_store_b[7:0]),
  .dec_exc0_m(dec_exc0_m[4:0]),
  .dec_exc1_m(dec_exc1_m[4:0]),
  .dec_inst0_cnt(dec_inst0_cnt[1:0]),
  .dec_inst1_cnt(dec_inst1_cnt[1:0]),
  .dec_tid0_m(dec_tid0_m[1:0]),
  .dec_tid1_m(dec_tid1_m[1:0]),
  .dec_inst_valid_m(dec_inst_valid_m[1:0]),
  .dec_lsu_inst_m(dec_lsu_inst_m[1:0]),
  .dec_fgu_inst_m(dec_fgu_inst_m[1:0]),
  .dec_cti_inst_m(dec_cti_inst_m[1:0]),
  .dec_illegal_inst_m(dec_illegal_inst_m[1:0]),
  .dec_icache_perr_m(dec_icache_perr_m[1:0]),
  .dec_priv_exc_m(dec_priv_exc_m[1:0]),
  .dec_hpriv_exc_m(dec_hpriv_exc_m[1:0]),
  .dec_fpdisable_exc_m(dec_fpdisable_exc_m[1:0]),
  .dec_br_taken_m(dec_br_taken_m[1:0]),
  .dec_done_inst_m(dec_done_inst_m[1:0]),
  .dec_retry_inst_m(dec_retry_inst_m[1:0]),
  .dec_sir_inst_m(dec_sir_inst_m[1:0]),
  .dec_ds_m(dec_ds_m[1:0]),
  .dec_annul_ds_m(dec_annul_ds_m[1:0]),
  .dec_fgu_sel_e(dec_fgu_sel_e[1:0]),
  .dec_fgu_sel_m(dec_fgu_sel_m[1:0]),
  .dec_lsu_sel0_e(dec_lsu_sel0_e),
  .dec_lsu_sel1_e(dec_lsu_sel1_e),
  .dec_rs1_addr0_e(dec_rs1_addr0_e),
  .dec_rs1_addr1_e(dec_rs1_addr1_e),
  .dec_lsu_sel0_upper_e(dec_lsu_sel0_upper_e),
  .dec_lsu_sel1_upper_e(dec_lsu_sel1_upper_e),
  .dec_lsu_sel0_lower_e(dec_lsu_sel0_lower_e),
  .dec_lsu_sel1_lower_e(dec_lsu_sel1_lower_e),
  .dec_rs1_addr0_upper_e(dec_rs1_addr0_upper_e),
  .dec_rs1_addr1_upper_e(dec_rs1_addr1_upper_e),
  .del_pick_d(del_pick_d[7:0]),
  .dec_ld_inst_e(dec_ld_inst_e),
  .dec_st_inst_e(dec_st_inst_e),
  .dec_fsr_ldst_e(dec_fsr_ldst_e),
  .dec_fpldst_inst_e(dec_fpldst_inst_e),
  .dec_ldst_dbl_e(dec_ldst_dbl_e),
  .dec_pref_inst_e(dec_pref_inst_e),
  .dec_flush_inst_e(dec_flush_inst_e),
  .dec_memstbar_inst_e(dec_memstbar_inst_e),
  .dec_sr_inst_e(dec_sr_inst_e),
  .dec_pr_inst_e(dec_pr_inst_e),
  .dec_hpr_inst_e(dec_hpr_inst_e),
  .dec_casa_inst_e(dec_casa_inst_e),
  .dec_ldstub_inst_e(dec_ldstub_inst_e),
  .dec_swap_inst_e(dec_swap_inst_e),
  .dec_altspace_d(dec_altspace_d),
  .dec_sign_ext_e(dec_sign_ext_e),
  .dec_sraddr_e(dec_sraddr_e[4:0]),
  .dec_imm_asi_vld_d(dec_imm_asi_vld_d),
  .dec_imm_asi_d(dec_imm_asi_d[7:0]),
  .dec_ldst_sz_e(dec_ldst_sz_e[1:0]),
  .dec_ld_inst_d(dec_ld_inst_d),
  .dec_lsu_tid0_d(dec_lsu_tid0_d[1:0]),
  .dec_lsu_tid1_d(dec_lsu_tid1_d[1:0]),
  .dec_lsu_tg_d(dec_lsu_tg_d),
  .dec_lsu_rd_e(dec_lsu_rd_e[4:0]),
  .del_test0_sel_p(del_test0_sel_p),
  .del_twocycle0_std_p(del_twocycle0_std_p),
  .del_twocycle0_rs2_p(del_twocycle0_rs2_p),
  .del_default0_sel_p(del_default0_sel_p),
  .del_test1_sel_p(del_test1_sel_p),
  .del_twocycle1_std_p(del_twocycle1_std_p),
  .del_twocycle1_rs2_p(del_twocycle1_rs2_p),
  .del_default1_sel_p(del_default1_sel_p),
  .del_test_addr0_p(del_test_addr0_p[4:0]),
  .del_test_addr1_p(del_test_addr1_p[4:0]),
  .dec_instr0_type_d(dec_instr0_type_d[9:0]),
  .dec_instr1_type_d(dec_instr1_type_d[9:0]),
  .dec_exu_clken(dec_exu_clken[1:0]),
  .del_tg_clken(del_tg_clken[1:0]),
  .dec_true_valid_e(dec_true_valid_e[1:0]),
  .dec_load_flush_w(dec_load_flush_w[1:0]),
  .dec_lsu_sel0_d(dec_lsu_sel0_d),
  .dec_raw_pick_p(dec_raw_pick_p[7:0]),
  .dec_ierr_d(dec_ierr_d[1:0]),
  .dec_block_store_stall(dec_block_store_stall[7:0])
		    );


   dec_ded_ctl ded0 (
		.scan_in(ded0_scanin),
		.scan_out(ded0_scanout),
		.l2clk(l2clk),
	        .clken(del_tg_clken[0]),
		.del_test_sel_p(del_test0_sel_p),	
		.del_twocycle_std_p(del_twocycle0_std_p),	
		.del_twocycle_rs2_p(del_twocycle0_rs2_p),	
		.del_default_sel_p(del_default0_sel_p),	
		.del_test_addr_p(del_test_addr0_p),	
		.ifu_buf0_inst0(ifu_buf0_inst0[32:0]),	
		.ifu_buf0_inst1(ifu_buf0_inst1[32:0]),	
		.ifu_buf0_inst2(ifu_buf0_inst2[32:0]),	
		.ifu_buf0_inst3(ifu_buf0_inst3[32:0]),	
		.ifu_buf0_excp0(ifu_buf0_excp0[4:0]),	
		.ifu_buf0_excp1(ifu_buf0_excp1[4:0]),	
		.ifu_buf0_excp2(ifu_buf0_excp2[4:0]),	
		.ifu_buf0_excp3(ifu_buf0_excp3[4:0]),	
		.del_noshift_d(del_noshift0_d),	
		.pku_raw_pick_p(pku_raw_pick0_p[3:0]),     	
		.pku_isrc_rs1_p(pku_isrc_rs1_p[3:0]),	
		.pku_isrc_rs2_p(pku_isrc_rs2_p[3:0]),	
		.pku_isrc_rd_p(pku_isrc_rd_p[3:0]),	
		.exu_oddwin_b(exu0_oddwin_b[3:0]),	
		.ded_ferr_p(ded_ferr_p[0]),	
		.ded_perr_p(ded_perr_p[0]),	
		.ded_ferr_d(ded_ferr_d[0]),	
		.ded_perr_d(ded_perr_d[0]),	
		.ded_legal_p(ded_legal_p[0]),
		.ded_oddwin_d(ded_oddwin0_d),	
		.dec_inst_d(dec_inst0_d[32:0]),
		.dec_inst_rs1_p(dec_inst0_rs1_p[4:0]),
		.dec_inst_rs2_p(dec_inst0_rs2_p[4:0]),
		.dec_inst_rs3_p(dec_inst0_rs3_p[4:0]),
		.dec_inst_rs1_vld_p(dec_inst0_rs1_vld_p),
		.dec_inst_rs2_vld_p(dec_inst0_rs2_vld_p),
		.dec_inst_rs3_vld_p(dec_inst0_rs3_vld_p),
		.ded_exc_d(ded_exc0_d[4:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_icdp(tlu_cerer_icdp)
		);		

   dec_ded_ctl ded1 (
		.scan_in(ded1_scanin),
		.scan_out(ded1_scanout),
		.l2clk(l2clk),
	        .clken(del_tg_clken[1]),
		.del_test_sel_p(del_test1_sel_p),	
		.del_twocycle_std_p(del_twocycle1_std_p),	
		.del_twocycle_rs2_p(del_twocycle1_rs2_p),	
		.del_default_sel_p(del_default1_sel_p),	
		.del_test_addr_p(del_test_addr1_p),	
		.ifu_buf0_inst0(ifu_buf0_inst4[32:0]),	
		.ifu_buf0_inst1(ifu_buf0_inst5[32:0]),	
		.ifu_buf0_inst2(ifu_buf0_inst6[32:0]),	
		.ifu_buf0_inst3(ifu_buf0_inst7[32:0]),	
		.ifu_buf0_excp0(ifu_buf0_excp4[4:0]),	
		.ifu_buf0_excp1(ifu_buf0_excp5[4:0]),	
		.ifu_buf0_excp2(ifu_buf0_excp6[4:0]),	
		.ifu_buf0_excp3(ifu_buf0_excp7[4:0]),	
		.del_noshift_d(del_noshift1_d),	
		.pku_raw_pick_p(pku_raw_pick1_p[7:4]),     	
		.pku_isrc_rs1_p(pku_isrc_rs1_p[7:4]),	
		.pku_isrc_rs2_p(pku_isrc_rs2_p[7:4]),	
		.pku_isrc_rd_p(pku_isrc_rd_p[7:4]),	
		.exu_oddwin_b(exu1_oddwin_b[3:0]),	
		.ded_ferr_p(ded_ferr_p[1]),	
		.ded_perr_p(ded_perr_p[1]),	
		.ded_ferr_d(ded_ferr_d[1]),	
		.ded_perr_d(ded_perr_d[1]),	
		.ded_legal_p(ded_legal_p[1]),
		.ded_oddwin_d(ded_oddwin1_d),	
		.dec_inst_d(dec_inst1_d[32:0]),
		.dec_inst_rs1_p(dec_inst1_rs1_p[4:0]),
		.dec_inst_rs2_p(dec_inst1_rs2_p[4:0]),
		.dec_inst_rs3_p(dec_inst1_rs3_p[4:0]),
		.dec_inst_rs1_vld_p(dec_inst1_rs1_vld_p),
		.dec_inst_rs2_vld_p(dec_inst1_rs2_vld_p),
		.dec_inst_rs3_vld_p(dec_inst1_rs3_vld_p),
		.ded_exc_d(ded_exc1_d[4:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_icdp(tlu_cerer_icdp)
		);		



   dec_dcd_ctl dcd0 (
		     .ded_ferr_d(ded_ferr_d[0]),	
		     .ded_perr_d(ded_perr_d[0]),	
		     .dec_inst_d(dec_inst0_d[31:0]),
		     .dcd_sir_d(dcd_sir_d[0]),
		     .dcd_stdfa_d(dcd_stdfa_d[0]),
		     .dcd_save_restore_d(dcd_save_restore_d[0]),
		     .dcd_exu_src_d(dcd_exu_src_d[0]),
		     .dcd_killfgu_d(dcd_killfgu_d[0]),
		     .dcd_lsize_d(dcd_lsize0_d[1:0]),
		     .dcd_lsu_sign_ext_d(dcd_lsu_sign_ext_d[0]),
		     .dcd_load_d(dcd_load_d[0]),
		     .dcd_store_d(dcd_store_d[0]),
		     .dcd_lsdouble_d(dcd_lsdouble_d[0]),
		     .dcd_prefetch_d(dcd_prefetch_d[0]),
		     .dcd_flush_d(dcd_flush_d[0]),
		     .dcd_memstbar_d(dcd_memstbar_d[0]),
		     .dcd_hpr_d(dcd_hpr_d[0]),
		     .dcd_pr_d(dcd_pr_d[0]),
		     .dcd_priv_d(dcd_priv_d[0]),
		     .dcd_sr_d(dcd_sr_d[0]),
		     .dcd_casa_d(dcd_casa_d[0]),
		     .dcd_ldstub_d(dcd_ldstub_d[0]),
		     .dcd_alt_d(dcd_alt_d[0]),
		     .dcd_alti_d(dcd_alti_d[0]),
		     .dcd_swap_d(dcd_swap_d[0]),
		     .dcd_done_d(dcd_done_d[0]),
		     .dcd_retry_d(dcd_retry_d[0]),
		     .dcd_fsrc_rs1_d(dcd_fsrc_rs1_d[0]),
		     .dcd_fsrc_rs2_d(dcd_fsrc_rs2_d[0]),
		     .dcd_fpdest_single_d(dcd_fpdest_single_d[0]),
		     .dcd_fp_rs1_single_d(dcd_fp_rs1_single_d[0]),
		     .dcd_fp_rs2_single_d(dcd_fp_rs2_single_d[0]),
		     .dcd_fsrsync_d(dcd_fsrsync_d[0]),
		     .dcd_callclass_d(dcd_callclass_d[0]),
		     .dcd_specbr_d(dcd_specbr_d[0]),
		     .dcd_specfp_d(dcd_specfp_d[0]),
		     .dcd_tcc_d(dcd_tcc_d[0]),
		     .dcd_sethi_d(dcd_sethi_d[0]),
		     .dcd_fpdisable_d(dcd_fpdisable_d[0]),
		     .dcd_wrtick_d(dcd_wrtick_d[0])
		     );

   dec_dcd_ctl dcd1 (
		     .ded_ferr_d(ded_ferr_d[1]),	
		     .ded_perr_d(ded_perr_d[1]),	
		     .dec_inst_d(dec_inst1_d[31:0]),
		     .dcd_sir_d(dcd_sir_d[1]),
		     .dcd_stdfa_d(dcd_stdfa_d[1]),
		     .dcd_save_restore_d(dcd_save_restore_d[1]),
		     .dcd_exu_src_d(dcd_exu_src_d[1]),
		     .dcd_killfgu_d(dcd_killfgu_d[1]),
		     .dcd_lsize_d(dcd_lsize1_d[1:0]),
		     .dcd_lsu_sign_ext_d(dcd_lsu_sign_ext_d[1]),
		     .dcd_load_d(dcd_load_d[1]),
		     .dcd_store_d(dcd_store_d[1]),
		     .dcd_lsdouble_d(dcd_lsdouble_d[1]),
		     .dcd_prefetch_d(dcd_prefetch_d[1]),
		     .dcd_flush_d(dcd_flush_d[1]),
		     .dcd_memstbar_d(dcd_memstbar_d[1]),
		     .dcd_hpr_d(dcd_hpr_d[1]),
		     .dcd_pr_d(dcd_pr_d[1]),
		     .dcd_priv_d(dcd_priv_d[1]),
		     .dcd_sr_d(dcd_sr_d[1]),
		     .dcd_casa_d(dcd_casa_d[1]),
		     .dcd_ldstub_d(dcd_ldstub_d[1]),
		     .dcd_alt_d(dcd_alt_d[1]),
		     .dcd_alti_d(dcd_alti_d[1]),
		     .dcd_swap_d(dcd_swap_d[1]),
		     .dcd_done_d(dcd_done_d[1]),
		     .dcd_retry_d(dcd_retry_d[1]),
		     .dcd_fsrc_rs1_d(dcd_fsrc_rs1_d[1]),
		     .dcd_fsrc_rs2_d(dcd_fsrc_rs2_d[1]),
		     .dcd_fpdest_single_d(dcd_fpdest_single_d[1]),
		     .dcd_fp_rs1_single_d(dcd_fp_rs1_single_d[1]),
		     .dcd_fp_rs2_single_d(dcd_fp_rs2_single_d[1]),
		     .dcd_fsrsync_d(dcd_fsrsync_d[1]),
		     .dcd_callclass_d(dcd_callclass_d[1]),
		     .dcd_specbr_d(dcd_specbr_d[1]),
		     .dcd_specfp_d(dcd_specfp_d[1]),
		     .dcd_tcc_d(dcd_tcc_d[1]),
		     .dcd_sethi_d(dcd_sethi_d[1]),
		     .dcd_fpdisable_d(dcd_fpdisable_d[1]),
		     .dcd_wrtick_d(dcd_wrtick_d[1])
		     );

// fixscan start:
assign del_scanin                = scan_in                  ;
assign ded0_scanin               = del_scanout              ;
assign ded1_scanin               = ded0_scanout             ;
assign scan_out                  = ded1_scanout             ;
// fixscan end:
endmodule

