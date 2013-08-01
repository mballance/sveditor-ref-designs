// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu.v
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
module mmu (
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
  lb_scan_en_wmr, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_mmu_pmen, 
  lsu_asi_clken, 
  tlu_tag_access_tid_0_b, 
  tlu_i_tag_access_0_b, 
  tlu_d_tag_access_0_b, 
  tlu_tag_access_tid_1_b, 
  tlu_i_tag_access_1_b, 
  tlu_d_tag_access_1_b, 
  spc_core_running_status, 
  mbi_mra0_write_en, 
  mbi_mra1_write_en, 
  mbi_scp0_write_en, 
  mbi_scp1_write_en, 
  mbi_addr, 
  mbi_run, 
  mbi_wdata, 
  mbi_mra0_read_en, 
  mbi_mra1_read_en, 
  mbi_scp0_read_en, 
  mbi_scp1_read_en, 
  mbi_mmu_cmpsel, 
  lsu_rngf_cdbus, 
  lsu_va_b, 
  lsu_context_b, 
  lsu_tlu_dsfsr_ct_b, 
  lsu_asi_error_inject, 
  tlu_load_i_tag_access_p, 
  tlu_load_i_tag_access_n, 
  tlu_load_d_tag_access, 
  tlu_load_d_tag_access_r, 
  tlu_release_tte, 
  tlu_pc_0_w, 
  tlu_pc_1_w, 
  tlu_iht_request, 
  tlu_dht_request, 
  tlu_mmu_tl_gt_0, 
  tlu_ceter_pscce, 
  tlu_cerer_mrau, 
  tlu_cerer_scac, 
  tlu_cerer_scau, 
  tlu_cerer_hwtwmu, 
  tlu_cerer_hwtwl2, 
  l15_mmu_grant, 
  l15_spc_data1, 
  l15_mmu_cpkt, 
  l15_mmu_valid, 
  scan_out, 
  wmr_scan_out, 
  mmu_mbi_mra0_fail, 
  mmu_mbi_mra1_fail, 
  mmu_mbi_scp0_fail, 
  mmu_mbi_scp1_fail, 
  mmu_l15_cpkt, 
  mmu_l15_addr, 
  mmu_l15_valid, 
  mmu_write_itlb, 
  mmu_itte_tag_data, 
  mmu_asi_data, 
  mmu_asi_read, 
  mmu_dae_req, 
  mmu_dae_tid, 
  mmu_dtlb_reload_stall, 
  mmu_dtlb_reload, 
  mmu_hw_tw_enable, 
  mmu_reload_done, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  mmu_index, 
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
  mmu_pmu_l2ret, 
  mmu_pmu_l2miss, 
  mmu_pmu_dtlb, 
  mmu_pmu_tid);
wire rd_pce;
wire wr_pce;
wire bist_clk_mux_sel;
wire tcu_scan_en_wmr;
wire [30:8] error_inject_unused;
wire asi_wmr_scanin;
wire asi_wmr_scanout;
wire asi_scanin;
wire asi_scanout;
wire [3:3] asi_rd_dtte_unused;
wire [6:0] asi_rd_dtte;
wire asd0_wmr_scanin;
wire asd0_wmr_scanout;
wire asd0_scanin;
wire asd0_scanout;
wire [47:13] asd_pc_0_w;
wire [1:0] asi_mra_rd_en_last;
wire [7:0] asi_rd_immu_tag_target;
wire [7:0] asi_rd_immu_tag_access;
wire [7:0] asi_rd_dmmu_tag_target;
wire [7:0] asi_rd_dmmu_tag_access;
wire [1:0] asi_rd_i_access_target;
wire [1:0] asi_rd_d_access_target;
wire [1:0] asi_rd_access_target;
wire [7:0] asi_rd_itte_tag;
wire [7:0] asi_rd_itte_data;
wire [7:0] asi_wr_immu_tag_access;
wire [7:0] asi_i_tag_access_en;
wire [7:0] asi_wr_itlb_data_in;
wire [7:0] asi_wr_itlb_data_access;
wire [7:0] asi_wr_immu_demap;
wire [7:0] asi_wr_immu_demap_p;
wire [7:0] asi_wr_immu_demap_n;
wire [7:0] asi_i_data_in_en;
wire [7:0] asi_wr_dmmu_tag_access;
wire [7:0] asi_d_tag_access_en;
wire [7:0] asi_wr_dtlb_data_in;
wire [7:0] asi_wr_dtlb_data_access;
wire [7:0] asi_wr_dmmu_demap;
wire [7:0] asi_wr_dmmu_demap_p;
wire [7:0] asi_wr_dmmu_demap_s_n;
wire [7:0] asi_d_data_in_en;
wire [7:0] asi_wr_p_context_0;
wire [1:0] asi_p_context_0_en;
wire [4:0] asi_mra_rd_addr_0;
wire [81:0] mra0_data;
wire [7:0] htc_wr_itlb_data_in;
wire [7:0] htc_wr_dtlb_data_in;
wire [81:0] asd0_rd_data;
wire [63:0] asd0_asi_rd_data;
wire [47:0] asd0_dtte_tag;
wire [54:0] asd0_dtte_data;
wire [47:0] asd0_itte_tag_data_;
wire [6:0] asd0_itte_index;
wire [12:0] asd_i_p_ctx_0_0;
wire [12:0] asd_i_p_ctx_0_1;
wire [12:0] asd_i_p_ctx_0_2;
wire [12:0] asd_i_p_ctx_0_3;
wire [47:0] asd0_tag_access;
wire asd0_zero_context;
wire asd0_asi_zero_context;
wire asd0_mra_rd_addr_bit_1;
wire asd1_wmr_scanin;
wire asd1_wmr_scanout;
wire asd1_scanin;
wire asd1_scanout;
wire [47:13] asd_pc_1_w;
wire [4:0] asi_mra_rd_addr_1;
wire [81:0] mra1_data;
wire [81:0] asd1_rd_data;
wire [63:0] asd1_asi_rd_data;
wire [47:0] asd1_dtte_tag;
wire [54:0] asd1_dtte_data;
wire [47:0] asd1_itte_tag_data_;
wire [6:0] asd1_itte_index;
wire [12:0] asd_i_p_ctx_0_4;
wire [12:0] asd_i_p_ctx_0_5;
wire [12:0] asd_i_p_ctx_0_6;
wire [12:0] asd_i_p_ctx_0_7;
wire [47:0] asd1_tag_access;
wire asd1_zero_context;
wire asd1_asi_zero_context;
wire asd1_mra_rd_addr_bit_1;
wire ase_scanin;
wire ase_scanout;
wire [81:0] ase_mra_wr_data;
wire [1:0] meg_parity;
wire meg1_parity_err_unused;
wire meg0_parity_err_unused;
wire asi_error_mrau;
wire [3:2] asi_mbist_ecc;
wire [1:0] mem_parity;
wire mel0_scanin;
wire mel0_scanout;
wire [1:0] mra0_parity;
wire med00_parity_err;
wire med01_parity_err;
wire [1:0] mel0_crit_parity;
wire [1:0] mel0_parity;
wire mel0_parity_err;
wire mel0_htc_parity_err;
wire med01_parity_out_unused;
wire med00_parity_out_unused;
wire mra0_scanin;
wire mra0_scanout;
wire [1:0] asi_mra_rd_en;
wire [4:0] asi_mra_wr_addr;
wire [1:0] asi_mra_wr_en;
wire [81:0] ase_mra_wr_data_minbuf;
wire mel1_scanin;
wire mel1_scanout;
wire [1:0] mra1_parity;
wire med10_parity_err;
wire med11_parity_err;
wire [1:0] mel1_crit_parity;
wire [1:0] mel1_parity;
wire mel1_parity_err;
wire mel1_htc_parity_err;
wire med11_parity_out_unused;
wire med10_parity_out_unused;
wire mra1_scanin;
wire mra1_scanout;
wire [63:0] asi_seg_wr_data;
wire [7:0] seg_ecc;
wire asi_error_scau;
wire [7:0] sem_ecc;
wire sel_scanin;
wire sel_scanout;
wire [63:0] asi_rd_data;
wire [7:0] sel_crit_ecc;
wire [7:0] sed_syndrome;
wire sed_cecc_err;
wire sed_uecc_err;
wire scp0_scanin;
wire scp0_scanout;
wire [4:0] asi_scp_addr;
wire [1:0] asi_scp_rd_en;
wire [1:0] asi_scp_wr_en;
wire [63:0] asi_wr_data;
wire [7:0] scp0_ecc;
wire [63:0] scp0_data;
wire scp1_scanin;
wire scp1_scanout;
wire [7:0] scp1_ecc;
wire [63:0] scp1_data;
wire htc_wmr_scanin;
wire htc_wmr_scanout;
wire htc_scanin;
wire htc_scanout;
wire [7:0] mmu_reload_done_unused;
wire htd_scanin;
wire htd_scanout;
wire tmc_scanin;
wire tmc_scanout;
wire trc_scanin;
wire trc_scanout;
wire [7:0] htc_itlb_clken;
wire [7:0] htc_dtlb_clken;
wire mbd_compare;
wire sel_scac;
wire sel_scau;
wire [63:0] ase_mra_rd_data;
wire [39:4] htd_tsbptr;
wire [4:0] htc_mra_addr_in;
wire [1:0] htc_mra_rd_en;
wire [7:0] asi_error_mask;
wire asi_rd_scp0;
wire asi_rd_tsb_cfg_0_2;
wire asi_rd_tsb_cfg_1_3;
wire asi_rd_tsb_ptr_;
wire asi_rd_real_range;
wire asi_rd_physical_offset;
wire asi_sel_mra_0_in;
wire asi_mra_wr_en_next;
wire [7:0] asi_wr_partition_id;
wire asi_dmmu_demap_s;
wire [2:0] asi_tag_access_sel;
wire asi_tsb_ptr_req_valid;
wire [2:0] asi_tsb_ptr_req;
wire [1:0] asi_tsb_ptr_number;
wire [1:0] asi_tsb_hwtw_enable_0;
wire [1:0] asi_tsb_hwtw_enable_1;
wire asi_data_in_real;
wire [63:0] asi_mra_wr_data;
wire asi_mra_req_grant;
wire asi_demap_r_bit;
wire [1:0] asi_hwtw_config_0;
wire [1:0] asi_hwtw_config_1;
wire [1:0] asi_hwtw_config_2;
wire [1:0] asi_hwtw_config_3;
wire [1:0] asi_hwtw_config_4;
wire [1:0] asi_hwtw_config_5;
wire [1:0] asi_hwtw_config_6;
wire [1:0] asi_hwtw_config_7;
wire asi_sel_en;
wire [7:0] asi_mbist_wdata;
wire [7:0] asi_ase_compare_data;
wire [7:0] asi_compare_data;
wire [31:0] asi_mbd_scp_data;
wire asi_mbd_sel_scp;
wire [7:0] asi_mbist_ecc_in;
wire asi_mbist_run;
wire asi_ecc_cmpsel_in;
wire [1:0] asi_ase_cmpsel_in;
wire [47:13] ase_lsu_va_w;
wire [12:0] ase_lsu_context_w;
wire [47:0] htd_tagaccess_din;
wire [38:0] htd_tlbdatain_din;
wire mmu_use_context_0;
wire mmu_use_context_1;
wire mmu_sec_context;
wire [31:0] ase_mbd_mbist_data;
wire htd_ra2pa_lower_hit_hw4;
wire htd_ra2pa_upper_hit_hw4;
wire htd_razero_hw4;
wire htd_range_en_hw4;
wire [7:0] htd_zeroctx_m0;
wire htd_zeroctx_hw1;
wire htd_usectx0_hw1;
wire htd_usectx1_hw1;
wire htd_ranotpa_hw1;
wire htd_ptr_hit0_hw1;
wire htd_ptr_hit1_hw1;
wire htd_ptr_hit2_hw1;
wire htd_ctx_hit_hw1;
wire htd_tte_ep_hw1;
wire htd_dmiss_hw1;
wire [5:0] htd_pred0_idx_m0;
wire [5:0] htd_pred1_idx_m0;
wire [15:0] htd_pred0_m0;
wire [15:0] htd_pred1_m0;
wire [7:0] htd_dmiss;
wire [7:0] htd_sec_ctx;
wire [7:0] tsm_rqv;
wire [7:0] tsm_tsb_miss_hw2;
wire [7:0] trs_rqv;
wire [7:0] trs_null_st;
wire [7:0] trs_waitrr3_st;
wire [7:0] trs_ecc_err;
wire [7:0] trs_ep_err;
wire [2:0] trs0_err_type;
wire [2:0] trs1_err_type;
wire [2:0] trs2_err_type;
wire [2:0] trs3_err_type;
wire [2:0] trs4_err_type;
wire [2:0] trs5_err_type;
wire [2:0] trs6_err_type;
wire [2:0] trs7_err_type;
wire [2:0] trs0_err_index;
wire [2:0] trs1_err_index;
wire [2:0] trs2_err_index;
wire [2:0] trs3_err_index;
wire [2:0] trs4_err_index;
wire [2:0] trs5_err_index;
wire [2:0] trs6_err_index;
wire [2:0] trs7_err_index;
wire [7:0] htc_core_running;
wire htc_m1_clken;
wire htc_hw3_clken;
wire htc_hw4_clken;
wire htc_zero_ctx_m2;
wire [5:3] htc_upd_pred_idx_hw2;
wire [7:0] htc_upd_grp;
wire [7:0] htc_upd_grp_x;
wire [1:0] htc_new_pred_bit;
wire htc_wrpred0_hw2;
wire htc_wrpred1_hw2;
wire htc_wrpred2_hw2;
wire htc_wrpred3_hw2;
wire [7:0] htc_tlb_miss_m;
wire htc_l15_en;
wire htc_wr_q0new_nogrant;
wire htc_wr_q0new_grant;
wire htc_wr_q1new;
wire htc_shift_q1_grant;
wire htc_wr_m3new;
wire htc_wr_m3q0;
wire htc_mra_sel_0;
wire htc_sel_mra_lo;
wire [1:0] htc_conf_index_m2;
wire [7:0] htc_vld_tsbptr_m2;
wire [7:0] htc_rd_tteq;
wire [7:0] htc_ra2pahit_hw5;
wire [7:0] htc_ranotpax_hw5;
wire [7:0] htc_cindex_bit0;
wire [7:0] htc_cindex_bit1;
wire [7:0] htc_rrindex_bit0;
wire [7:0] htc_rrindex_bit1;
wire [2:0] htc_pid0_m0;
wire [2:0] htc_pid1_m0;
wire [7:0] htc_tsbrd_valid_m0;
wire [7:0] htc_thr_valid_hw3;
wire [7:0] htc_thr_prevalid_hw3;
wire [7:0] htc_va_rd_m2_in;
wire htc_ranotpa_hw4;
wire [7:0] htc_data_rcvd_hw1;
wire [7:0] htc_tsb_hit_hw1;
wire [7:0] htc_tsb_done_hw2;
wire [7:0] htc_thr_valid_m1;
wire [7:0] htc_thr_valid_m0;
wire [7:0] htc_hwtw_burst;
wire [1:0] rr_ecc_err_type;
wire [1:0] cfg_ecc_err_type;
wire [1:0] l2_ecc_err_type;
wire [7:0] rr_ecc_err_hw5;
wire [7:0] cfg_ecc_err_m3;
wire [7:0] l2_ecc_err_hw1;
wire [7:0] htc_ep_miss_hw1;
wire [2:0] cfg_ecc_err_index;
wire [2:0] rr_ecc_err_index;
wire [7:0] trs_eperr_st;
wire [7:0] trs_eccerr_st;
wire [7:0] tsm_waitfortte;




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

input		lb_scan_en_wmr;
input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

// Power management
input           lsu_mmu_pmen;
input		lsu_asi_clken;
input	[1:0]	tlu_tag_access_tid_0_b;	// Tag access power management
input		tlu_i_tag_access_0_b;	// Tag access power management
input		tlu_d_tag_access_0_b;	// Tag access power management
input	[1:0]	tlu_tag_access_tid_1_b;	// Tag access power management
input		tlu_i_tag_access_1_b;	// Tag access power management
input		tlu_d_tag_access_1_b;	// Tag access power management
input 	[7:0]	spc_core_running_status;

// MBIST
input		mbi_mra0_write_en;	// MBIST write control
input		mbi_mra1_write_en;	// MBIST write control
input		mbi_scp0_write_en;	// MBIST write control
input		mbi_scp1_write_en;	// MBIST write control
input	[4:0]	mbi_addr;		// 32 entry addressability for MBIST
input		mbi_run;		// Select MBIST controls
input	[7:0]	mbi_wdata;		// MBIST write data
input		mbi_mra0_read_en;	// MBIST read control
input		mbi_mra1_read_en;	// MBIST read control
input		mbi_scp0_read_en;	// MBIST read control
input		mbi_scp1_read_en;	// MBIST read control
input	[1:0]	mbi_mmu_cmpsel;		// Mux (DEC) between 32 bit chunks 

input	[64:0]	lsu_rngf_cdbus;
input 	[47:0]	lsu_va_b;
input 	[12:0]	lsu_context_b;
input	[1:0]	lsu_tlu_dsfsr_ct_b;	// Indicates pri/sec context to HWTW

input 	[31:0]	lsu_asi_error_inject; 	// 31:Enb 23:SCAU 20:MRAU 7:0 ECCMASK

input 	[7:0]	tlu_load_i_tag_access_p;
input 	[7:0]	tlu_load_i_tag_access_n;
input 	[7:0]	tlu_load_d_tag_access;
input 	[7:0]	tlu_load_d_tag_access_r;
input 	[7:0]	tlu_release_tte;
input 	[47:13]	tlu_pc_0_w;
input 	[47:13]	tlu_pc_1_w;
input 	[7:0]	tlu_iht_request;	// ITLB hardware tablewalk request
input 	[7:0]	tlu_dht_request;	// DTLB hardware tablewalk request
input	[7:0]	tlu_mmu_tl_gt_0;	// Load '0' as ITLB context
input	[7:0]	tlu_ceter_pscce;		
input		tlu_cerer_mrau;
input		tlu_cerer_scac;
input		tlu_cerer_scau;
input		tlu_cerer_hwtwmu;
input		tlu_cerer_hwtwl2;

input           l15_mmu_grant;
input   [127:0] l15_spc_data1;   // 16 bytes of return data from L2
input   [17:0] l15_mmu_cpkt;    // Control part of cpx packet
input           l15_mmu_valid;




output		scan_out;

output		wmr_scan_out;		// Warm reset (non)scan

// MBIST
output		mmu_mbi_mra0_fail;	// MBIST fail
output		mmu_mbi_mra1_fail;	// MBIST fail
output		mmu_mbi_scp0_fail;	// MBIST fail
output		mmu_mbi_scp1_fail;	// MBIST fail

output  [4:0] mmu_l15_cpkt;
output  [39:4] mmu_l15_addr;
output          mmu_l15_valid;

output 	[7:0]	mmu_write_itlb;
output 	[47:0]	mmu_itte_tag_data;

output	[64:0]	mmu_asi_data;		// ASI read data for fast bus
output		mmu_asi_read;		// Valid for MMU ASI read

output		mmu_dae_req;		// data_access_exception for bad pg size
output	[2:0]	mmu_dae_tid;		

output 		mmu_dtlb_reload_stall;
output 		mmu_dtlb_reload;

output 	[7:0]	mmu_hw_tw_enable;
output	[7:0]	mmu_reload_done;
output	[7:0]	mmu_i_unauth_access;
output	[7:0]	mmu_i_tsb_miss;
output	[7:0]	mmu_d_tsb_miss;

output	[7:0]	mmu_i_tte_outofrange;	// RA out of range
output	[7:0]	mmu_d_tte_outofrange;	// RA out of range

output	[6:0]	mmu_index;		// Index and valid from idata_access

output 		mmu_asi_cecc; 		// Correctable ECC error on ASI read
output 		mmu_asi_uecc; 		// Uncorrectable ECC error on ASI read
output	[2:0]	mmu_asi_tid;		// Thread for reported error
output	[10:0]	mmu_asi_index;		// Syndrome and index of the failure 
output		mmu_asi_mra_not_sca;	// 1: MRA error 0: Scratchpad error
output	[7:0]	mmu_i_l2cerr;		// HW TW had L2 correctable error on I rld
output	[7:0]	mmu_d_l2cerr;		// HW TW had L2 correctable error on D rld
output	[7:0]	mmu_i_eccerr;		// HW TW had MRA or L2 error on I rld
output	[7:0]	mmu_d_eccerr;		// HW TW had MRA or L2 error on D rld
output	[2:0]	mmu_thr0_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr1_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr2_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr3_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr4_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr5_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr6_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr7_err_type;	// [2]: 1-MRA 0-L2 [1:0] ND U C - (3-0)
output	[2:0]	mmu_thr0_err_index;	
output	[2:0]	mmu_thr1_err_index;	
output	[2:0]	mmu_thr2_err_index;	
output	[2:0]	mmu_thr3_err_index;	
output	[2:0]	mmu_thr4_err_index;	
output	[2:0]	mmu_thr5_err_index;	
output	[2:0]	mmu_thr6_err_index;	
output	[2:0]	mmu_thr7_err_index;	

output          mmu_pmu_l2ret;
output          mmu_pmu_l2miss;
output          mmu_pmu_dtlb;
output [2:0]    mmu_pmu_tid;



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// assertions
// Cannot send out a request to gkt, if in null state
/* 0in assert -var (~(tmc.tsm0.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b000)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 0" */

/* 0in assert -var (~(tmc.tsm1.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b001)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 1" */

/* 0in assert -var (~(tmc.tsm2.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b010)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 2" */

/* 0in assert -var (~(tmc.tsm3.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b011)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 3" */

/* 0in assert -var (~(tmc.tsm4.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b100)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 4" */

/* 0in assert -var (~(tmc.tsm5.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b101)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 5" */

/* 0in assert -var (~(tmc.tsm6.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b110)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 6" */

/* 0in assert -var (~(tmc.tsm7.null_state & mmu_l15_valid & (mmu_l15_cpkt[2:0] == 3'b111)))
 -message "mmu.mmu_tsm_ctl: Valid request sent to gkt in null state, thread 7" */

// Cannot receive pkt from gkt, if in null state
/* 0in assert -var (~(tmc.tsm0.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[0]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 0" */

/* 0in assert -var (~(tmc.tsm1.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[1]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 1" */

/* 0in assert -var (~(tmc.tsm2.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[2]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 2" */

/* 0in assert -var (~(tmc.tsm3.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[3]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 3" */

/* 0in assert -var (~(tmc.tsm4.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[4]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 4" */

/* 0in assert -var (~(tmc.tsm5.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[5]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 5" */

/* 0in assert -var (~(tmc.tsm6.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[6]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 6" */

/* 0in assert -var (~(tmc.tsm7.null_state & htc.load_ret_hw0 & htc.ret_tid_hw0[7]))
 -message "mmu.mmu_htc_ctl: Pkt received from gkt in null state, thread 7" */

//////////////////////////////////////////////////////////////////////////////
assign rd_pce = 1'b1;
assign wr_pce = 1'b1;
assign bist_clk_mux_sel = 1'b0;
assign tcu_scan_en_wmr = lb_scan_en_wmr;



assign error_inject_unused[30:24] =
       lsu_asi_error_inject[30:24];
assign error_inject_unused[22:21] =
       lsu_asi_error_inject[22:21];
assign error_inject_unused[19:8] =
       lsu_asi_error_inject[19:8];



//////////////////////////////////////////////////////////////////////////////



mmu_asi_ctl asi ( // FS:wmr_protect
	.wmr_scan_in(asi_wmr_scanin),
	.wmr_scan_out(asi_wmr_scanout),
	.scan_in(asi_scanin),
	.scan_out(asi_scanout),
	.l2clk			(l2clk				),
	.error_inject_enable	(lsu_asi_error_inject	[31   ]	),
	.error_inject_scau	(lsu_asi_error_inject	[23   ]	),
	.error_inject_mrau	(lsu_asi_error_inject	[20   ]	),
	.error_inject_mask	(lsu_asi_error_inject	[7:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .htc_itlb_clken(htc_itlb_clken[7:0]),
  .htc_dtlb_clken(htc_dtlb_clken[7:0]),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_mmu_pmen(lsu_mmu_pmen),
  .tlu_tag_access_tid_0_b(tlu_tag_access_tid_0_b[1:0]),
  .tlu_i_tag_access_0_b(tlu_i_tag_access_0_b),
  .tlu_d_tag_access_0_b(tlu_d_tag_access_0_b),
  .tlu_tag_access_tid_1_b(tlu_tag_access_tid_1_b[1:0]),
  .tlu_i_tag_access_1_b(tlu_i_tag_access_1_b),
  .tlu_d_tag_access_1_b(tlu_d_tag_access_1_b),
  .mbi_mra0_write_en(mbi_mra0_write_en),
  .mbi_mra1_write_en(mbi_mra1_write_en),
  .mbi_scp0_write_en(mbi_scp0_write_en),
  .mbi_scp1_write_en(mbi_scp1_write_en),
  .mbi_addr(mbi_addr[4:0]),
  .mbi_run(mbi_run),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_mra0_read_en(mbi_mra0_read_en),
  .mbi_mra1_read_en(mbi_mra1_read_en),
  .mbi_scp0_read_en(mbi_scp0_read_en),
  .mbi_scp1_read_en(mbi_scp1_read_en),
  .mbi_mmu_cmpsel(mbi_mmu_cmpsel[1:0]),
  .mbd_compare(mbd_compare),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[64:0]),
  .tlu_iht_request(tlu_iht_request[7:0]),
  .tlu_dht_request(tlu_dht_request[7:0]),
  .tlu_release_tte(tlu_release_tte[7:0]),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .scp0_data(scp0_data[63:0]),
  .scp1_data(scp1_data[63:0]),
  .scp0_ecc(scp0_ecc[7:0]),
  .scp1_ecc(scp1_ecc[7:0]),
  .sel_scac(sel_scac),
  .sel_scau(sel_scau),
  .ase_mra_rd_data(ase_mra_rd_data[63:0]),
  .mel0_parity(mel0_parity[1:0]),
  .mel1_parity(mel1_parity[1:0]),
  .mel0_parity_err(mel0_parity_err),
  .mel1_parity_err(mel1_parity_err),
  .asd0_asi_rd_data(asd0_asi_rd_data[63:0]),
  .asd1_asi_rd_data(asd1_asi_rd_data[63:0]),
  .asd0_dtte_tag(asd0_dtte_tag[47:0]),
  .asd1_dtte_tag(asd1_dtte_tag[47:0]),
  .asd0_dtte_data(asd0_dtte_data[54:0]),
  .asd1_dtte_data(asd1_dtte_data[54:0]),
  .asd0_itte_index(asd0_itte_index[6:0]),
  .asd1_itte_index(asd1_itte_index[6:0]),
  .asd0_asi_zero_context(asd0_asi_zero_context),
  .asd1_asi_zero_context(asd1_asi_zero_context),
  .htd_tsbptr(htd_tsbptr[39:4]),
  .htc_mra_addr_in(htc_mra_addr_in[4:0]),
  .htc_mra_rd_en(htc_mra_rd_en[1:0]),
  .htc_wr_itlb_data_in(htc_wr_itlb_data_in[7:0]),
  .htc_wr_dtlb_data_in(htc_wr_dtlb_data_in[7:0]),
  .mmu_i_unauth_access(mmu_i_unauth_access[7:0]),
  .mmu_i_tsb_miss(mmu_i_tsb_miss[7:0]),
  .mmu_d_tsb_miss(mmu_d_tsb_miss[7:0]),
  .mmu_i_tte_outofrange(mmu_i_tte_outofrange[7:0]),
  .mmu_d_tte_outofrange(mmu_d_tte_outofrange[7:0]),
  .mmu_i_eccerr(mmu_i_eccerr[7:0]),
  .mmu_d_eccerr(mmu_d_eccerr[7:0]),
  .asi_error_scau(asi_error_scau),
  .asi_error_mrau(asi_error_mrau),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_scp_addr(asi_scp_addr[4:0]),
  .asi_scp_wr_en(asi_scp_wr_en[1:0]),
  .asi_scp_rd_en(asi_scp_rd_en[1:0]),
  .asi_rd_scp0(asi_rd_scp0),
  .asi_mra_rd_addr_0(asi_mra_rd_addr_0[4:0]),
  .asi_mra_rd_addr_1(asi_mra_rd_addr_1[4:0]),
  .asi_mra_rd_en(asi_mra_rd_en[1:0]),
  .asi_mra_wr_addr(asi_mra_wr_addr[4:0]),
  .asi_mra_wr_en(asi_mra_wr_en[1:0]),
  .asi_mra_rd_en_last(asi_mra_rd_en_last[1:0]),
  .asi_rd_tsb_cfg_0_2(asi_rd_tsb_cfg_0_2),
  .asi_rd_tsb_cfg_1_3(asi_rd_tsb_cfg_1_3),
  .asi_rd_tsb_ptr_(asi_rd_tsb_ptr_),
  .asi_rd_real_range(asi_rd_real_range),
  .asi_rd_physical_offset(asi_rd_physical_offset),
  .asi_sel_mra_0_in(asi_sel_mra_0_in),
  .asi_mra_wr_en_next(asi_mra_wr_en_next),
  .asi_rd_immu_tag_target(asi_rd_immu_tag_target[7:0]),
  .asi_rd_immu_tag_access(asi_rd_immu_tag_access[7:0]),
  .asi_rd_dmmu_tag_target(asi_rd_dmmu_tag_target[7:0]),
  .asi_rd_dmmu_tag_access(asi_rd_dmmu_tag_access[7:0]),
  .asi_rd_i_access_target(asi_rd_i_access_target[1:0]),
  .asi_rd_d_access_target(asi_rd_d_access_target[1:0]),
  .asi_rd_access_target(asi_rd_access_target[1:0]),
  .asi_rd_itte_tag(asi_rd_itte_tag[7:0]),
  .asi_rd_itte_data(asi_rd_itte_data[7:0]),
  .asi_rd_dtte(asi_rd_dtte[6:0]),
  .asi_wr_immu_tag_access(asi_wr_immu_tag_access[7:0]),
  .asi_wr_itlb_data_in(asi_wr_itlb_data_in[7:0]),
  .asi_wr_itlb_data_access(asi_wr_itlb_data_access[7:0]),
  .asi_wr_immu_demap(asi_wr_immu_demap[7:0]),
  .asi_wr_immu_demap_p(asi_wr_immu_demap_p[7:0]),
  .asi_wr_immu_demap_n(asi_wr_immu_demap_n[7:0]),
  .asi_wr_dmmu_tag_access(asi_wr_dmmu_tag_access[7:0]),
  .asi_wr_dtlb_data_in(asi_wr_dtlb_data_in[7:0]),
  .asi_wr_dtlb_data_access(asi_wr_dtlb_data_access[7:0]),
  .asi_wr_partition_id(asi_wr_partition_id[7:0]),
  .asi_wr_dmmu_demap(asi_wr_dmmu_demap[7:0]),
  .asi_wr_dmmu_demap_p(asi_wr_dmmu_demap_p[7:0]),
  .asi_wr_dmmu_demap_s_n(asi_wr_dmmu_demap_s_n[7:0]),
  .asi_dmmu_demap_s(asi_dmmu_demap_s),
  .asi_wr_p_context_0(asi_wr_p_context_0[7:0]),
  .asi_p_context_0_en(asi_p_context_0_en[1:0]),
  .asi_tag_access_sel(asi_tag_access_sel[2:0]),
  .asi_tsb_ptr_req_valid(asi_tsb_ptr_req_valid),
  .asi_tsb_ptr_req(asi_tsb_ptr_req[2:0]),
  .asi_tsb_ptr_number(asi_tsb_ptr_number[1:0]),
  .asi_tsb_hwtw_enable_0(asi_tsb_hwtw_enable_0[1:0]),
  .asi_tsb_hwtw_enable_1(asi_tsb_hwtw_enable_1[1:0]),
  .asi_data_in_real(asi_data_in_real),
  .asi_seg_wr_data(asi_seg_wr_data[63:0]),
  .asi_wr_data(asi_wr_data[63:0]),
  .asi_mra_wr_data(asi_mra_wr_data[63:0]),
  .asi_mra_req_grant(asi_mra_req_grant),
  .asi_demap_r_bit(asi_demap_r_bit),
  .asi_rd_data(asi_rd_data[63:0]),
  .asi_hwtw_config_0(asi_hwtw_config_0[1:0]),
  .asi_hwtw_config_1(asi_hwtw_config_1[1:0]),
  .asi_hwtw_config_2(asi_hwtw_config_2[1:0]),
  .asi_hwtw_config_3(asi_hwtw_config_3[1:0]),
  .asi_hwtw_config_4(asi_hwtw_config_4[1:0]),
  .asi_hwtw_config_5(asi_hwtw_config_5[1:0]),
  .asi_hwtw_config_6(asi_hwtw_config_6[1:0]),
  .asi_hwtw_config_7(asi_hwtw_config_7[1:0]),
  .asi_sel_en(asi_sel_en),
  .asi_i_tag_access_en(asi_i_tag_access_en[7:0]),
  .asi_d_tag_access_en(asi_d_tag_access_en[7:0]),
  .asi_i_data_in_en(asi_i_data_in_en[7:0]),
  .asi_d_data_in_en(asi_d_data_in_en[7:0]),
  .asi_mbist_wdata(asi_mbist_wdata[7:0]),
  .asi_ase_compare_data(asi_ase_compare_data[7:0]),
  .asi_compare_data(asi_compare_data[7:0]),
  .asi_mbd_scp_data(asi_mbd_scp_data[31:0]),
  .asi_mbd_sel_scp(asi_mbd_sel_scp),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_ecc(asi_mbist_ecc[3:2]),
  .asi_mbist_run(asi_mbist_run),
  .asi_ecc_cmpsel_in(asi_ecc_cmpsel_in),
  .asi_ase_cmpsel_in(asi_ase_cmpsel_in[1:0]),
  .mmu_asi_data(mmu_asi_data[64:0]),
  .mmu_asi_read(mmu_asi_read),
  .mmu_write_itlb(mmu_write_itlb[7:0]),
  .mmu_dtlb_reload_stall(mmu_dtlb_reload_stall),
  .mmu_dtlb_reload(mmu_dtlb_reload),
  .mmu_hw_tw_enable(mmu_hw_tw_enable[7:0]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_tid(mmu_asi_tid[2:0]),
  .mmu_asi_index(mmu_asi_index[2:0]),
  .mmu_asi_mra_not_sca(mmu_asi_mra_not_sca),
  .mmu_dae_req(mmu_dae_req),
  .mmu_dae_tid(mmu_dae_tid[2:0]),
  .mmu_reload_done(mmu_reload_done[7:0]),
  .mmu_index(mmu_index[6:0]),
  .mmu_mbi_mra0_fail(mmu_mbi_mra0_fail),
  .mmu_mbi_mra1_fail(mmu_mbi_mra1_fail),
  .mmu_mbi_scp0_fail(mmu_mbi_scp0_fail),
  .mmu_mbi_scp1_fail(mmu_mbi_scp1_fail)
);

assign asi_rd_dtte_unused[3] =
       asi_rd_dtte[3];

mmu_asd_dp asd0 ( // FS:wmr_protect
	.wmr_scan_in(asd0_wmr_scanin),
	.wmr_scan_out(asd0_wmr_scanout),
	.scan_in(asd0_scanin),
	.scan_out(asd0_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b0				),
	.asd_pc_w		(asd_pc_0_w		[47:13]	),
	.asi_mra_rd_en_last	(asi_mra_rd_en_last	[0   ] ),
        .asi_rd_immu_tag_target	(asi_rd_immu_tag_target	[3:0]	),
        .asi_rd_immu_tag_access	(asi_rd_immu_tag_access	[3:0]	),
        .asi_rd_dmmu_tag_target	(asi_rd_dmmu_tag_target	[3:0]	),
        .asi_rd_dmmu_tag_access	(asi_rd_dmmu_tag_access	[3:0]	),
        .asi_rd_i_access_target	(asi_rd_i_access_target	[0   ]	),
        .asi_rd_d_access_target	(asi_rd_d_access_target	[0   ]	),
        .asi_rd_access_target	(asi_rd_access_target	[0   ]	),
        .asi_rd_itte_tag	(asi_rd_itte_tag	[3:0]	),
        .asi_rd_itte_data	(asi_rd_itte_data	[3:0]	),
        .asi_rd_dtte		(asi_rd_dtte		[2:0]	),
        .asi_wr_immu_tag_access	(asi_wr_immu_tag_access	[3:0]	),
        .asi_i_tag_access_en	(asi_i_tag_access_en	[3:0]	),
        .asi_wr_itlb_data_in	(asi_wr_itlb_data_in	[3:0]	),
        .asi_wr_itlb_data_access(asi_wr_itlb_data_access[3:0]	),
        .asi_wr_immu_demap	(asi_wr_immu_demap	[3:0]	),
        .asi_wr_immu_demap_p	(asi_wr_immu_demap_p	[3:0]	),
        .asi_wr_immu_demap_n	(asi_wr_immu_demap_n	[3:0]	),
        .asi_i_data_in_en	(asi_i_data_in_en	[3:0]	),
        .asi_wr_dmmu_tag_access	(asi_wr_dmmu_tag_access	[3:0]	),
        .asi_d_tag_access_en	(asi_d_tag_access_en	[3:0]	),
        .asi_wr_dtlb_data_in	(asi_wr_dtlb_data_in	[3:0]	),
        .asi_wr_dtlb_data_access(asi_wr_dtlb_data_access[3:0]	),
        .asi_wr_dmmu_demap	(asi_wr_dmmu_demap	[3:0]	),
        .asi_wr_dmmu_demap_p	(asi_wr_dmmu_demap_p	[3:0]	),
        .asi_wr_dmmu_demap_s_n	(asi_wr_dmmu_demap_s_n	[3:0]	),
        .asi_d_data_in_en	(asi_d_data_in_en	[3:0]	),
        .asi_wr_p_context_0	(asi_wr_p_context_0	[3:0]	),
        .asi_p_context_0_en	(asi_p_context_0_en	[0   ]	),
        .tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[3:0]	),
        .tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[3:0]	),
        .asi_mra_rd_addr_bit_1	(asi_mra_rd_addr_0	[1   ]	),
        .mra_data		(mra0_data		[81:0]	),
        .tlu_pc_w		(tlu_pc_0_w		[47:13]	),
        .tlu_load_d_tag_access	(tlu_load_d_tag_access	[3:0]	),
        .tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[3:0]	),
	.htc_wr_itlb_data_in	(htc_wr_itlb_data_in	[3:0]	),
	.htc_wr_dtlb_data_in	(htc_wr_dtlb_data_in	[3:0]	),
	.asd_rd_data		(asd0_rd_data		[81:0] ),
	.asd_asi_rd_data	(asd0_asi_rd_data	[63:0] ),
	.asd_dtte_tag		(asd0_dtte_tag		[47:0] ),
	.asd_dtte_data		(asd0_dtte_data		[54:0] ),
	.asd_itte_tag_data_	(asd0_itte_tag_data_	[47:0] ),
	.asd_itte_index		(asd0_itte_index	[6:0]	),
	.asd_iht_p_ctx_0_0	(asd_i_p_ctx_0_0	[12:0] ),
	.asd_iht_p_ctx_0_1	(asd_i_p_ctx_0_1	[12:0] ),
	.asd_iht_p_ctx_0_2	(asd_i_p_ctx_0_2	[12:0] ),
	.asd_iht_p_ctx_0_3	(asd_i_p_ctx_0_3	[12:0] ),
	.asd_tag_access		(asd0_tag_access	[47:0] ),
	.asd_zero_context	(asd0_zero_context		),
	.asd_asi_zero_context	(asd0_asi_zero_context		),
        .asd_mra_rd_addr_bit_1	(asd0_mra_rd_addr_bit_1		),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .ase_lsu_va_w(ase_lsu_va_w[47:13]),
  .ase_lsu_context_w(ase_lsu_context_w[12:0]),
  .asi_wr_data(asi_wr_data[63:0]),
  .asi_dmmu_demap_s(asi_dmmu_demap_s),
  .asi_data_in_real(asi_data_in_real),
  .asi_tag_access_sel(asi_tag_access_sel[2:0]),
  .asi_mra_wr_data(asi_mra_wr_data[39:0]),
  .asi_demap_r_bit(asi_demap_r_bit),
  .asi_rd_tsb_ptr_(asi_rd_tsb_ptr_),
  .htd_tagaccess_din(htd_tagaccess_din[47:0]),
  .htd_tlbdatain_din(htd_tlbdatain_din[38:0]),
  .mmu_use_context_0(mmu_use_context_0),
  .mmu_use_context_1(mmu_use_context_1),
  .mmu_sec_context(mmu_sec_context)

);	

mmu_asd_dp asd1 ( // FS:wmr_protect
	.wmr_scan_in(asd1_wmr_scanin),
	.wmr_scan_out(asd1_wmr_scanout),
	.scan_in(asd1_scanin),
	.scan_out(asd1_scanout),
	.l2clk			(l2clk				),
	.thread_group		(1'b1				),
        .asd_pc_w 		(asd_pc_1_w		[47:13]	),
	.asi_mra_rd_en_last	(asi_mra_rd_en_last	[1   ] ),
        .asi_rd_immu_tag_target	(asi_rd_immu_tag_target	[7:4]	),
        .asi_rd_immu_tag_access	(asi_rd_immu_tag_access	[7:4]	),
        .asi_rd_dmmu_tag_target	(asi_rd_dmmu_tag_target	[7:4]	),
        .asi_rd_dmmu_tag_access	(asi_rd_dmmu_tag_access	[7:4]	),
        .asi_rd_i_access_target	(asi_rd_i_access_target	[1   ]	),
        .asi_rd_d_access_target	(asi_rd_d_access_target	[1   ]	),
        .asi_rd_access_target	(asi_rd_access_target	[1   ]	),
        .asi_rd_itte_tag	(asi_rd_itte_tag	[7:4]	),
        .asi_rd_itte_data	(asi_rd_itte_data	[7:4]	),
        .asi_rd_dtte		(asi_rd_dtte		[6:4]	),
        .asi_wr_immu_tag_access	(asi_wr_immu_tag_access	[7:4]	),
        .asi_i_tag_access_en	(asi_i_tag_access_en	[7:4]	),
        .asi_wr_itlb_data_in	(asi_wr_itlb_data_in	[7:4]	),
        .asi_wr_itlb_data_access(asi_wr_itlb_data_access[7:4]	),
        .asi_wr_immu_demap	(asi_wr_immu_demap	[7:4]	),
        .asi_wr_immu_demap_p	(asi_wr_immu_demap_p	[7:4]	),
        .asi_wr_immu_demap_n	(asi_wr_immu_demap_n	[7:4]	),
        .asi_i_data_in_en	(asi_i_data_in_en	[7:4]	),
        .asi_wr_dmmu_tag_access	(asi_wr_dmmu_tag_access	[7:4]	),
        .asi_d_tag_access_en	(asi_d_tag_access_en	[7:4]	),
        .asi_wr_dtlb_data_in	(asi_wr_dtlb_data_in	[7:4]	),
        .asi_wr_dtlb_data_access(asi_wr_dtlb_data_access[7:4]	),
        .asi_wr_dmmu_demap	(asi_wr_dmmu_demap	[7:4]	),
        .asi_wr_dmmu_demap_p	(asi_wr_dmmu_demap_p	[7:4]	),
        .asi_wr_dmmu_demap_s_n	(asi_wr_dmmu_demap_s_n	[7:4]	),
        .asi_d_data_in_en	(asi_d_data_in_en	[7:4]	),
        .asi_wr_p_context_0	(asi_wr_p_context_0	[7:4]	),
        .asi_p_context_0_en	(asi_p_context_0_en	[1   ]	),
        .tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[7:4]	),
        .tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[7:4]	),
        .asi_mra_rd_addr_bit_1	(asi_mra_rd_addr_1	[1   ]	),
        .mra_data		(mra1_data		[81:0]	),
        .tlu_pc_w		(tlu_pc_1_w		[47:13]	),
        .tlu_load_d_tag_access	(tlu_load_d_tag_access	[7:4]	),
        .tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[7:4]	),
	.htc_wr_itlb_data_in	(htc_wr_itlb_data_in	[7:4]	),
	.htc_wr_dtlb_data_in	(htc_wr_dtlb_data_in	[7:4]	),
	.asd_rd_data		(asd1_rd_data		[81:0]	),
	.asd_asi_rd_data	(asd1_asi_rd_data	[63:0] ),
	.asd_dtte_tag		(asd1_dtte_tag		[47:0] ),
	.asd_dtte_data		(asd1_dtte_data		[54:0] ),
	.asd_itte_tag_data_	(asd1_itte_tag_data_	[47:0] ),
	.asd_itte_index		(asd1_itte_index	[6:0]	),
	.asd_iht_p_ctx_0_0	(asd_i_p_ctx_0_4	[12:0] ),
	.asd_iht_p_ctx_0_1	(asd_i_p_ctx_0_5	[12:0] ),
	.asd_iht_p_ctx_0_2	(asd_i_p_ctx_0_6	[12:0] ),
	.asd_iht_p_ctx_0_3	(asd_i_p_ctx_0_7	[12:0] ),
	.asd_tag_access		(asd1_tag_access	[47:0] ),
	.asd_zero_context	(asd1_zero_context		),
	.asd_asi_zero_context	(asd1_asi_zero_context		),
        .asd_mra_rd_addr_bit_1	(asd1_mra_rd_addr_bit_1		),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_scan_en_wmr(tcu_scan_en_wmr),
  .spc_aclk_wmr(spc_aclk_wmr),
  .ase_lsu_va_w(ase_lsu_va_w[47:13]),
  .ase_lsu_context_w(ase_lsu_context_w[12:0]),
  .asi_wr_data(asi_wr_data[63:0]),
  .asi_dmmu_demap_s(asi_dmmu_demap_s),
  .asi_data_in_real(asi_data_in_real),
  .asi_tag_access_sel(asi_tag_access_sel[2:0]),
  .asi_mra_wr_data(asi_mra_wr_data[39:0]),
  .asi_demap_r_bit(asi_demap_r_bit),
  .asi_rd_tsb_ptr_(asi_rd_tsb_ptr_),
  .htd_tagaccess_din(htd_tagaccess_din[47:0]),
  .htd_tlbdatain_din(htd_tlbdatain_din[38:0]),
  .mmu_use_context_0(mmu_use_context_0),
  .mmu_use_context_1(mmu_use_context_1),
  .mmu_sec_context(mmu_sec_context)
);	

mmu_ase_dp ase (
        .scan_in(ase_scanin),
        .scan_out(ase_scanout),
        .l2clk			(l2clk				),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .lsu_va_b(lsu_va_b[47:0]),
  .lsu_context_b(lsu_context_b[12:0]),
  .asi_rd_tsb_cfg_0_2(asi_rd_tsb_cfg_0_2),
  .asi_rd_tsb_cfg_1_3(asi_rd_tsb_cfg_1_3),
  .asi_rd_real_range(asi_rd_real_range),
  .asi_rd_physical_offset(asi_rd_physical_offset),
  .asi_sel_mra_0_in(asi_sel_mra_0_in),
  .asi_mra_wr_en_next(asi_mra_wr_en_next),
  .asi_mra_wr_data(asi_mra_wr_data[63:0]),
  .asd0_rd_data(asd0_rd_data[81:0]),
  .asd1_rd_data(asd1_rd_data[81:0]),
  .asd0_itte_tag_data_(asd0_itte_tag_data_[47:0]),
  .asd1_itte_tag_data_(asd1_itte_tag_data_[47:0]),
  .asi_mbist_run(asi_mbist_run),
  .asi_ecc_cmpsel_in(asi_ecc_cmpsel_in),
  .asi_ase_cmpsel_in(asi_ase_cmpsel_in[1:0]),
  .asi_mbist_wdata(asi_mbist_wdata[7:0]),
  .asi_ase_compare_data(asi_ase_compare_data[7:0]),
  .mel0_parity(mel0_parity[1:0]),
  .mel1_parity(mel1_parity[1:0]),
  .ase_mra_wr_data(ase_mra_wr_data[81:0]),
  .ase_mra_wr_data_minbuf(ase_mra_wr_data_minbuf[81:0]),
  .ase_mra_rd_data(ase_mra_rd_data[63:0]),
  .ase_lsu_va_w(ase_lsu_va_w[47:13]),
  .ase_lsu_context_w(ase_lsu_context_w[12:0]),
  .ase_mbd_mbist_data(ase_mbd_mbist_data[31:0]),
  .mmu_itte_tag_data(mmu_itte_tag_data[47:0])
);


// Parity generation for both MRAs (only one write source:  ASI bus)
mmu_mec_dp meg1 (
	.data_in		(ase_mra_wr_data	[81:41]	),
	.parity_in		({1 {1'b0}}			),
	.parity_out		(meg_parity		[1   ]	),
	.parity_err		(meg1_parity_err_unused		)
);

mmu_mec_dp meg0 (
	.data_in		(ase_mra_wr_data	[40:0]	),
	.parity_in		({1 {1'b0}}			),
	.parity_out		(meg_parity		[0   ]	),
	.parity_err		(meg0_parity_err_unused		)
);

mmu_mem_dp mem1 (
	.asi_error_inject	(asi_error_mrau			),
	.asi_error_mask		(1'b1				),
	.asi_mbist_ecc		(asi_mbist_ecc		[3   ]	),
	.parity_in		(meg_parity		[1   ]	),
	.parity_out		(mem_parity		[1   ]	),
  .asi_mbist_run(asi_mbist_run)
);

mmu_mem_dp mem0 (
	.asi_error_inject	(asi_error_mrau			),
	.asi_error_mask		(1'b1				),
	.asi_mbist_ecc		(asi_mbist_ecc		[2   ]	),
	.parity_in		(meg_parity		[0   ]	),
	.parity_out		(mem_parity		[0   ]	),
  .asi_mbist_run(asi_mbist_run)
);

// Parity error detection for MRA
mmu_mel_dp mel0 (
	.scan_in(mel0_scanin),
	.scan_out(mel0_scanout),
	.l2clk			(l2clk				),
	.mra_parity		(mra0_parity		[1:0]	),
	.med0_parity_err	(med00_parity_err		),
	.med1_parity_err	(med01_parity_err		),
	.mel_crit_parity	(mel0_crit_parity	[1:0]	),
	.mel_parity		(mel0_parity		[1:0]	),
	.mel_parity_err		(mel0_parity_err		),
	.mel_htc_parity_err	(mel0_htc_parity_err		),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_mrau(tlu_cerer_mrau),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu)
);

mmu_mec_dp med01 (
	.data_in		(asd0_rd_data		[81:41]	),
	.parity_in		(mel0_crit_parity	[1   ]	),
	.parity_out		(med01_parity_out_unused	),
	.parity_err		(med01_parity_err		)
);

mmu_mec_dp med00 (
	.data_in		(asd0_rd_data		[40:0]	),
	.parity_in		(mel0_crit_parity	[0   ]	),
	.parity_out		(med00_parity_out_unused	),
	.parity_err		(med00_parity_err		)
);

n2_com_dp_32x84_cust mra0 (
        .tcu_aclk		(spc_aclk			),
        .tcu_bclk		(spc_bclk			),
        .scan_in(mra0_scanin),
        .scan_out(mra0_scanout),
        .rdclk			(l2clk				),
        .wrclk			(l2clk				),
	.rd_adr			({asi_mra_rd_addr_0	[4:2],
				  asd0_mra_rd_addr_bit_1       ,
				  asi_mra_rd_addr_0	[0   ]}),
	.rd_en			(asi_mra_rd_en		[0   ]	),
	.wr_adr			(asi_mra_wr_addr	[4:0]	),
	.wr_en			(asi_mra_wr_en		[0   ] ),
	.din			({mem_parity		[1:0],
				  ase_mra_wr_data_minbuf	[81:0]}),
	.dout			({mra0_parity		[1:0],
				  mra0_data		[81:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);

// ECC error detection for MRA
mmu_mel_dp mel1 (
	.scan_in(mel1_scanin),
	.scan_out(mel1_scanout),
	.l2clk			(l2clk				),
	.mra_parity		(mra1_parity		[1:0]	),
	.med0_parity_err	(med10_parity_err		),
	.med1_parity_err	(med11_parity_err		),
	.mel_crit_parity	(mel1_crit_parity	[1:0]	),
	.mel_parity		(mel1_parity		[1:0]	),
	.mel_parity_err		(mel1_parity_err		),
	.mel_htc_parity_err	(mel1_htc_parity_err		),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_mrau(tlu_cerer_mrau),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu)
);

mmu_mec_dp med11 (
	.data_in		(asd1_rd_data		[81:41]	),
	.parity_in		(mel1_crit_parity	[1   ]	),
	.parity_out		(med11_parity_out_unused	),
	.parity_err		(med11_parity_err		)
);

mmu_mec_dp med10 (
	.data_in		(asd1_rd_data		[40:0]	),
	.parity_in		(mel1_crit_parity	[0   ]	),
	.parity_out		(med10_parity_out_unused	),
	.parity_err		(med10_parity_err		)
);

n2_com_dp_32x84_cust mra1 (
        .tcu_aclk		(spc_aclk			),
        .tcu_bclk		(spc_bclk			),
        .scan_in(mra1_scanin),
        .scan_out(mra1_scanout),
        .rdclk			(l2clk				),
        .wrclk			(l2clk				),
	.rd_adr			({asi_mra_rd_addr_1	[4:2],
				  asd1_mra_rd_addr_bit_1       ,
				  asi_mra_rd_addr_1	[0   ]}),
	.rd_en			(asi_mra_rd_en		[1   ]	),
	.wr_adr			(asi_mra_wr_addr	[4:0]	),
	.wr_en			(asi_mra_wr_en		[1   ] ),
	.din			({mem_parity		[1:0],
				  ase_mra_wr_data_minbuf	[81:0]}),
	.dout			({mra1_parity		[1:0],
				  mra1_data		[81:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);


// ECC generation for scratchpad arrays
mmu_seg_dp seg (
	.data_in		({{3 {1'b0}}		       ,
				 asi_seg_wr_data	[63:0]}),
	.ecc_out		(seg_ecc		[7:0]	)
);

mmu_eem_dp sem (
	.asi_error_inject	(asi_error_scau			),
	.ecc_in			(seg_ecc		[7:0]	),
	.ecc_out		(sem_ecc		[7:0]	),
  .asi_error_mask(asi_error_mask[7:0]),
  .asi_mbist_ecc_in(asi_mbist_ecc_in[7:0]),
  .asi_mbist_run(asi_mbist_run)
);

// ECC error detection for scratchpad arrays
mmu_sel_dp sel (
	.scan_in(sel_scanin),
	.scan_out(sel_scanout),
	.l2clk			(l2clk				),
	.sel_syndrome		(mmu_asi_index		[10:3]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tlu_cerer_scac(tlu_cerer_scac),
  .tlu_cerer_scau(tlu_cerer_scau),
  .asi_sel_en(asi_sel_en),
  .asi_rd_scp0(asi_rd_scp0),
  .sed_syndrome(sed_syndrome[7:0]),
  .scp0_ecc(scp0_ecc[7:0]),
  .scp1_ecc(scp1_ecc[7:0]),
  .sed_cecc_err(sed_cecc_err),
  .sed_uecc_err(sed_uecc_err),
  .sel_crit_ecc(sel_crit_ecc[7:0]),
  .sel_scac(sel_scac),
  .sel_scau(sel_scau)
);

mmu_sed_dp sed (
	.data_in		({{3 {1'b0}}		       ,
				 asi_rd_data		[63:0]}),
	.ecc_in			(sel_crit_ecc		[7:0]	),
	.syndrome		(sed_syndrome		[7:0]	),
	.cecc_err		(sed_cecc_err			),
	.uecc_err		(sed_uecc_err			)
);

n2_com_dp_32x72_cust scp0 (
        .tcu_aclk		(spc_aclk			),
        .tcu_bclk		(spc_bclk			),
        .scan_in(scp0_scanin),
        .scan_out(scp0_scanout),
        .rdclk			(l2clk				),
        .wrclk			(l2clk				),
	.rd_adr			(asi_scp_addr		[4:0]	),
	.rd_en			(asi_scp_rd_en		[0   ]	),
	.wr_adr			(asi_scp_addr		[4:0]	),
	.wr_en			(asi_scp_wr_en		[0   ]	),
	.din			({sem_ecc		[7:0],
				  asi_wr_data		[63:0]}),
	.dout			({scp0_ecc		[7:0],
				  scp0_data		[63:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);

n2_com_dp_32x72_cust scp1 (
        .tcu_aclk		(spc_aclk			),
        .tcu_bclk		(spc_bclk			),
        .scan_in(scp1_scanin),
        .scan_out(scp1_scanout),
        .rdclk			(l2clk				),
        .wrclk			(l2clk				),
	.rd_adr			(asi_scp_addr		[4:0]	),
	.rd_en			(asi_scp_rd_en		[1   ]	),
	.wr_adr			(asi_scp_addr		[4:0]	),
	.wr_en			(asi_scp_wr_en		[1   ]	),
	.din			({sem_ecc		[7:0],
				  asi_wr_data		[63:0]}),
	.dout			({scp1_ecc		[7:0],
				  scp1_data		[63:0]}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);

mmu_htc_ctl htc ( // FS:wmr_protect
    .wmr_scan_in(htc_wmr_scanin),
    .wmr_scan_out(htc_wmr_scanout),
    .scan_in(htc_scanin),
    .scan_out(htc_scanout),
    .l2clk(l2clk),
    .mel0_parity_err    (mel0_htc_parity_err),
    .mel1_parity_err    (mel1_htc_parity_err),
    .mmu_reload_done	(mmu_reload_done_unused		[7:0]	),
    .htc_thr0_err_type	(mmu_thr0_err_type		[2:0]	),
    .htc_thr1_err_type	(mmu_thr1_err_type		[2:0]	),
    .htc_thr2_err_type	(mmu_thr2_err_type		[2:0]	),
    .htc_thr3_err_type	(mmu_thr3_err_type		[2:0]	),
    .htc_thr4_err_type	(mmu_thr4_err_type		[2:0]	),
    .htc_thr5_err_type	(mmu_thr5_err_type		[2:0]	),
    .htc_thr6_err_type	(mmu_thr6_err_type		[2:0]	),
    .htc_thr7_err_type	(mmu_thr7_err_type		[2:0]	),
    .htc_thr0_err_index	(mmu_thr0_err_index		[2:0]	),
    .htc_thr1_err_index	(mmu_thr1_err_index		[2:0]	),
    .htc_thr2_err_index	(mmu_thr2_err_index		[2:0]	),
    .htc_thr3_err_index	(mmu_thr3_err_index		[2:0]	),
    .htc_thr4_err_index	(mmu_thr4_err_index		[2:0]	),
    .htc_thr5_err_index	(mmu_thr5_err_index		[2:0]	),
    .htc_thr6_err_index	(mmu_thr6_err_index		[2:0]	),
    .htc_thr7_err_index	(mmu_thr7_err_index		[2:0]	),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .lsu_mmu_pmen(lsu_mmu_pmen),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .l15_mmu_cpkt(l15_mmu_cpkt[17:0]),
  .l15_mmu_valid(l15_mmu_valid),
  .asi_tsb_ptr_req_valid(asi_tsb_ptr_req_valid),
  .asi_tsb_ptr_req(asi_tsb_ptr_req[2:0]),
  .asi_tsb_ptr_number(asi_tsb_ptr_number[1:0]),
  .asd0_zero_context(asd0_zero_context),
  .asd1_zero_context(asd1_zero_context),
  .asi_wr_partition_id(asi_wr_partition_id[7:0]),
  .asi_wr_data(asi_wr_data[2:0]),
  .asi_hwtw_config_0(asi_hwtw_config_0[1:0]),
  .asi_hwtw_config_1(asi_hwtw_config_1[1:0]),
  .asi_hwtw_config_2(asi_hwtw_config_2[1:0]),
  .asi_hwtw_config_3(asi_hwtw_config_3[1:0]),
  .asi_hwtw_config_4(asi_hwtw_config_4[1:0]),
  .asi_hwtw_config_5(asi_hwtw_config_5[1:0]),
  .asi_hwtw_config_6(asi_hwtw_config_6[1:0]),
  .asi_hwtw_config_7(asi_hwtw_config_7[1:0]),
  .asi_tsb_hwtw_enable_0(asi_tsb_hwtw_enable_0[1:0]),
  .asi_tsb_hwtw_enable_1(asi_tsb_hwtw_enable_1[1:0]),
  .htd_ra2pa_lower_hit_hw4(htd_ra2pa_lower_hit_hw4),
  .htd_ra2pa_upper_hit_hw4(htd_ra2pa_upper_hit_hw4),
  .htd_razero_hw4(htd_razero_hw4),
  .htd_range_en_hw4(htd_range_en_hw4),
  .htd_zeroctx_m0(htd_zeroctx_m0[7:0]),
  .htd_zeroctx_hw1(htd_zeroctx_hw1),
  .htd_usectx0_hw1(htd_usectx0_hw1),
  .htd_usectx1_hw1(htd_usectx1_hw1),
  .htd_ranotpa_hw1(htd_ranotpa_hw1),
  .htd_ptr_hit0_hw1(htd_ptr_hit0_hw1),
  .htd_ptr_hit1_hw1(htd_ptr_hit1_hw1),
  .htd_ptr_hit2_hw1(htd_ptr_hit2_hw1),
  .htd_ctx_hit_hw1(htd_ctx_hit_hw1),
  .htd_tte_ep_hw1(htd_tte_ep_hw1),
  .htd_dmiss_hw1(htd_dmiss_hw1),
  .htd_pred0_idx_m0(htd_pred0_idx_m0[5:0]),
  .htd_pred1_idx_m0(htd_pred1_idx_m0[5:0]),
  .htd_pred0_m0(htd_pred0_m0[15:0]),
  .htd_pred1_m0(htd_pred1_m0[15:0]),
  .htd_dmiss(htd_dmiss[7:0]),
  .htd_sec_ctx(htd_sec_ctx[7:0]),
  .tlu_iht_request(tlu_iht_request[7:0]),
  .tlu_dht_request(tlu_dht_request[7:0]),
  .l15_mmu_grant(l15_mmu_grant),
  .asi_mra_req_grant(asi_mra_req_grant),
  .tsm_rqv(tsm_rqv[7:0]),
  .tsm_tsb_miss_hw2(tsm_tsb_miss_hw2[7:0]),
  .trs_rqv(trs_rqv[7:0]),
  .trs_null_st(trs_null_st[7:0]),
  .trs_waitrr3_st(trs_waitrr3_st[7:0]),
  .trs_ecc_err(trs_ecc_err[7:0]),
  .trs_ep_err(trs_ep_err[7:0]),
  .trs0_err_type(trs0_err_type[2:0]),
  .trs1_err_type(trs1_err_type[2:0]),
  .trs2_err_type(trs2_err_type[2:0]),
  .trs3_err_type(trs3_err_type[2:0]),
  .trs4_err_type(trs4_err_type[2:0]),
  .trs5_err_type(trs5_err_type[2:0]),
  .trs6_err_type(trs6_err_type[2:0]),
  .trs7_err_type(trs7_err_type[2:0]),
  .trs0_err_index(trs0_err_index[2:0]),
  .trs1_err_index(trs1_err_index[2:0]),
  .trs2_err_index(trs2_err_index[2:0]),
  .trs3_err_index(trs3_err_index[2:0]),
  .trs4_err_index(trs4_err_index[2:0]),
  .trs5_err_index(trs5_err_index[2:0]),
  .trs6_err_index(trs6_err_index[2:0]),
  .trs7_err_index(trs7_err_index[2:0]),
  .tlu_cerer_hwtwl2(tlu_cerer_hwtwl2),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu),
  .htc_core_running(htc_core_running[7:0]),
  .htc_m1_clken(htc_m1_clken),
  .htc_hw3_clken(htc_hw3_clken),
  .htc_hw4_clken(htc_hw4_clken),
  .mmu_i_unauth_access(mmu_i_unauth_access[7:0]),
  .mmu_i_tsb_miss(mmu_i_tsb_miss[7:0]),
  .mmu_d_tsb_miss(mmu_d_tsb_miss[7:0]),
  .mmu_use_context_0(mmu_use_context_0),
  .mmu_use_context_1(mmu_use_context_1),
  .mmu_sec_context(mmu_sec_context),
  .htc_mra_addr_in(htc_mra_addr_in[4:0]),
  .htc_mra_rd_en(htc_mra_rd_en[1:0]),
  .htc_wr_itlb_data_in(htc_wr_itlb_data_in[7:0]),
  .htc_wr_dtlb_data_in(htc_wr_dtlb_data_in[7:0]),
  .htc_dtlb_clken(htc_dtlb_clken[7:0]),
  .htc_itlb_clken(htc_itlb_clken[7:0]),
  .htc_zero_ctx_m2(htc_zero_ctx_m2),
  .htc_upd_pred_idx_hw2(htc_upd_pred_idx_hw2[5:3]),
  .htc_upd_grp(htc_upd_grp[7:0]),
  .htc_upd_grp_x(htc_upd_grp_x[7:0]),
  .htc_new_pred_bit(htc_new_pred_bit[1:0]),
  .htc_wrpred0_hw2(htc_wrpred0_hw2),
  .htc_wrpred1_hw2(htc_wrpred1_hw2),
  .htc_wrpred2_hw2(htc_wrpred2_hw2),
  .htc_wrpred3_hw2(htc_wrpred3_hw2),
  .htc_tlb_miss_m(htc_tlb_miss_m[7:0]),
  .mmu_l15_cpkt(mmu_l15_cpkt[4:0]),
  .htc_l15_en(htc_l15_en),
  .mmu_l15_valid(mmu_l15_valid),
  .htc_wr_q0new_nogrant(htc_wr_q0new_nogrant),
  .htc_wr_q0new_grant(htc_wr_q0new_grant),
  .htc_wr_q1new(htc_wr_q1new),
  .htc_shift_q1_grant(htc_shift_q1_grant),
  .htc_wr_m3new(htc_wr_m3new),
  .htc_wr_m3q0(htc_wr_m3q0),
  .htc_mra_sel_0(htc_mra_sel_0),
  .htc_sel_mra_lo(htc_sel_mra_lo),
  .htc_conf_index_m2(htc_conf_index_m2[1:0]),
  .htc_vld_tsbptr_m2(htc_vld_tsbptr_m2[7:0]),
  .htc_rd_tteq(htc_rd_tteq[7:0]),
  .htc_ra2pahit_hw5(htc_ra2pahit_hw5[7:0]),
  .htc_ranotpax_hw5(htc_ranotpax_hw5[7:0]),
  .htc_cindex_bit0(htc_cindex_bit0[7:0]),
  .htc_cindex_bit1(htc_cindex_bit1[7:0]),
  .htc_rrindex_bit0(htc_rrindex_bit0[7:0]),
  .htc_rrindex_bit1(htc_rrindex_bit1[7:0]),
  .htc_pid0_m0(htc_pid0_m0[2:0]),
  .htc_pid1_m0(htc_pid1_m0[2:0]),
  .htc_tsbrd_valid_m0(htc_tsbrd_valid_m0[7:0]),
  .htc_thr_valid_hw3(htc_thr_valid_hw3[7:0]),
  .htc_thr_prevalid_hw3(htc_thr_prevalid_hw3[7:0]),
  .htc_va_rd_m2_in(htc_va_rd_m2_in[7:0]),
  .htc_ranotpa_hw4(htc_ranotpa_hw4),
  .htc_data_rcvd_hw1(htc_data_rcvd_hw1[7:0]),
  .htc_tsb_hit_hw1(htc_tsb_hit_hw1[7:0]),
  .htc_tsb_done_hw2(htc_tsb_done_hw2[7:0]),
  .htc_thr_valid_m1(htc_thr_valid_m1[7:0]),
  .htc_thr_valid_m0(htc_thr_valid_m0[7:0]),
  .htc_hwtw_burst(htc_hwtw_burst[7:0]),
  .mmu_i_tte_outofrange(mmu_i_tte_outofrange[7:0]),
  .mmu_d_tte_outofrange(mmu_d_tte_outofrange[7:0]),
  .rr_ecc_err_type(rr_ecc_err_type[1:0]),
  .cfg_ecc_err_type(cfg_ecc_err_type[1:0]),
  .l2_ecc_err_type(l2_ecc_err_type[1:0]),
  .rr_ecc_err_hw5(rr_ecc_err_hw5[7:0]),
  .cfg_ecc_err_m3(cfg_ecc_err_m3[7:0]),
  .l2_ecc_err_hw1(l2_ecc_err_hw1[7:0]),
  .htc_ep_miss_hw1(htc_ep_miss_hw1[7:0]),
  .cfg_ecc_err_index(cfg_ecc_err_index[2:0]),
  .rr_ecc_err_index(rr_ecc_err_index[2:0]),
  .mmu_i_eccerr(mmu_i_eccerr[7:0]),
  .mmu_d_eccerr(mmu_d_eccerr[7:0]),
  .mmu_i_l2cerr(mmu_i_l2cerr[7:0]),
  .mmu_d_l2cerr(mmu_d_l2cerr[7:0]),
  .mmu_pmu_l2ret(mmu_pmu_l2ret),
  .mmu_pmu_l2miss(mmu_pmu_l2miss),
  .mmu_pmu_dtlb(mmu_pmu_dtlb),
  .mmu_pmu_tid(mmu_pmu_tid[2:0]),
  .spc_aclk_wmr(spc_aclk_wmr)
);

mmu_htd_dp htd (
    .scan_in(htd_scanin),
    .scan_out(htd_scanout),
    .l2clk(l2clk),
    .asi_data_in_real(1'b0),
    .tlu_pc_0_w(asd_pc_0_w[47:13]),
    .tlu_pc_1_w(asd_pc_1_w[47:13]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .htc_core_running(htc_core_running[7:0]),
  .htc_m1_clken(htc_m1_clken),
  .htc_hw3_clken(htc_hw3_clken),
  .htc_hw4_clken(htc_hw4_clken),
  .asd0_tag_access(asd0_tag_access[47:0]),
  .asd1_tag_access(asd1_tag_access[47:0]),
  .htc_tsbrd_valid_m0(htc_tsbrd_valid_m0[7:0]),
  .ase_lsu_va_w(ase_lsu_va_w[47:13]),
  .lsu_context_b(lsu_context_b[12:0]),
  .lsu_tlu_dsfsr_ct_b(lsu_tlu_dsfsr_ct_b[1:0]),
  .l15_spc_data1(l15_spc_data1[127:0]),
  .l15_mmu_cpkt(l15_mmu_cpkt[8:3]),
  .l15_mmu_grant(l15_mmu_grant),
  .htc_zero_ctx_m2(htc_zero_ctx_m2),
  .htc_ranotpa_hw4(htc_ranotpa_hw4),
  .htc_pid0_m0(htc_pid0_m0[2:0]),
  .htc_pid1_m0(htc_pid1_m0[2:0]),
  .htc_thr_prevalid_hw3(htc_thr_prevalid_hw3[7:0]),
  .htc_va_rd_m2_in(htc_va_rd_m2_in[7:0]),
  .htc_l15_en(htc_l15_en),
  .htc_vld_tsbptr_m2(htc_vld_tsbptr_m2[7:0]),
  .trs_null_st(trs_null_st[7:0]),
  .htc_mra_sel_0(htc_mra_sel_0),
  .htc_sel_mra_lo(htc_sel_mra_lo),
  .mra0_data(mra0_data[81:0]),
  .mra1_data(mra1_data[81:0]),
  .htc_conf_index_m2(htc_conf_index_m2[1:0]),
  .htc_upd_pred_idx_hw2(htc_upd_pred_idx_hw2[5:3]),
  .htc_upd_grp(htc_upd_grp[7:0]),
  .htc_upd_grp_x(htc_upd_grp_x[7:0]),
  .htc_new_pred_bit(htc_new_pred_bit[1:0]),
  .htc_wrpred0_hw2(htc_wrpred0_hw2),
  .htc_wrpred1_hw2(htc_wrpred1_hw2),
  .htc_wrpred2_hw2(htc_wrpred2_hw2),
  .htc_wrpred3_hw2(htc_wrpred3_hw2),
  .htc_wr_q0new_nogrant(htc_wr_q0new_nogrant),
  .htc_wr_q0new_grant(htc_wr_q0new_grant),
  .htc_wr_q1new(htc_wr_q1new),
  .htc_shift_q1_grant(htc_shift_q1_grant),
  .htc_wr_m3new(htc_wr_m3new),
  .htc_wr_m3q0(htc_wr_m3q0),
  .htc_rd_tteq(htc_rd_tteq[7:0]),
  .tlu_iht_request(tlu_iht_request[7:0]),
  .tlu_dht_request(tlu_dht_request[7:0]),
  .tlu_mmu_tl_gt_0(tlu_mmu_tl_gt_0[7:0]),
  .asd_i_p_ctx_0_0(asd_i_p_ctx_0_0[12:0]),
  .asd_i_p_ctx_0_1(asd_i_p_ctx_0_1[12:0]),
  .asd_i_p_ctx_0_2(asd_i_p_ctx_0_2[12:0]),
  .asd_i_p_ctx_0_3(asd_i_p_ctx_0_3[12:0]),
  .asd_i_p_ctx_0_4(asd_i_p_ctx_0_4[12:0]),
  .asd_i_p_ctx_0_5(asd_i_p_ctx_0_5[12:0]),
  .asd_i_p_ctx_0_6(asd_i_p_ctx_0_6[12:0]),
  .asd_i_p_ctx_0_7(asd_i_p_ctx_0_7[12:0]),
  .htd_range_en_hw4(htd_range_en_hw4),
  .htd_zeroctx_hw1(htd_zeroctx_hw1),
  .htd_usectx0_hw1(htd_usectx0_hw1),
  .htd_usectx1_hw1(htd_usectx1_hw1),
  .htd_ranotpa_hw1(htd_ranotpa_hw1),
  .htd_ptr_hit0_hw1(htd_ptr_hit0_hw1),
  .htd_ptr_hit1_hw1(htd_ptr_hit1_hw1),
  .htd_ptr_hit2_hw1(htd_ptr_hit2_hw1),
  .htd_ctx_hit_hw1(htd_ctx_hit_hw1),
  .htd_tte_ep_hw1(htd_tte_ep_hw1),
  .htd_dmiss_hw1(htd_dmiss_hw1),
  .htd_ra2pa_lower_hit_hw4(htd_ra2pa_lower_hit_hw4),
  .htd_ra2pa_upper_hit_hw4(htd_ra2pa_upper_hit_hw4),
  .htd_razero_hw4(htd_razero_hw4),
  .htd_tagaccess_din(htd_tagaccess_din[47:0]),
  .htd_tlbdatain_din(htd_tlbdatain_din[38:0]),
  .mmu_l15_addr(mmu_l15_addr[39:4]),
  .htd_dmiss(htd_dmiss[7:0]),
  .htd_sec_ctx(htd_sec_ctx[7:0]),
  .htd_pred0_idx_m0(htd_pred0_idx_m0[5:0]),
  .htd_pred1_idx_m0(htd_pred1_idx_m0[5:0]),
  .htd_pred0_m0(htd_pred0_m0[15:0]),
  .htd_pred1_m0(htd_pred1_m0[15:0]),
  .htd_tsbptr(htd_tsbptr[39:4]),
  .htd_zeroctx_m0(htd_zeroctx_m0[7:0])                
);

mmu_tmc_ctl tmc (
    .scan_in(tmc_scanin),
    .scan_out(tmc_scanout),
    .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .htc_data_rcvd_hw1(htc_data_rcvd_hw1[7:0]),
  .htc_tlb_miss_m(htc_tlb_miss_m[7:0]),
  .htc_tsb_done_hw2(htc_tsb_done_hw2[7:0]),
  .htc_vld_tsbptr_m2(htc_vld_tsbptr_m2[7:0]),
  .htc_thr_valid_m1(htc_thr_valid_m1[7:0]),
  .htc_thr_valid_m0(htc_thr_valid_m0[7:0]),
  .htc_hwtw_burst(htc_hwtw_burst[7:0]),
  .htc_cindex_bit0(htc_cindex_bit0[7:0]),
  .htc_cindex_bit1(htc_cindex_bit1[7:0]),
  .trs_eperr_st(trs_eperr_st[7:0]),
  .trs_eccerr_st(trs_eccerr_st[7:0]),
  .tsm_tsb_miss_hw2(tsm_tsb_miss_hw2[7:0]),
  .tsm_rqv(tsm_rqv[7:0]),
  .tsm_waitfortte(tsm_waitfortte[7:0])
);

mmu_trc_ctl trc (
    .scan_in(trc_scanin),
    .scan_out(trc_scanout),
    .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en),
  .htc_tsb_hit_hw1(htc_tsb_hit_hw1[7:0]),
  .htc_thr_valid_hw3(htc_thr_valid_hw3[7:0]),
  .htc_ra2pahit_hw5(htc_ra2pahit_hw5[7:0]),
  .htc_ranotpax_hw5(htc_ranotpax_hw5[7:0]),
  .tsm_waitfortte(tsm_waitfortte[7:0]),
  .htc_ep_miss_hw1(htc_ep_miss_hw1[7:0]),
  .htc_rrindex_bit0(htc_rrindex_bit0[7:0]),
  .htc_rrindex_bit1(htc_rrindex_bit1[7:0]),
  .l2_ecc_err_hw1(l2_ecc_err_hw1[7:0]),
  .cfg_ecc_err_m3(cfg_ecc_err_m3[7:0]),
  .rr_ecc_err_hw5(rr_ecc_err_hw5[7:0]),
  .l2_ecc_err_type(l2_ecc_err_type[1:0]),
  .cfg_ecc_err_type(cfg_ecc_err_type[1:0]),
  .rr_ecc_err_type(rr_ecc_err_type[1:0]),
  .cfg_ecc_err_index(cfg_ecc_err_index[2:0]),
  .rr_ecc_err_index(rr_ecc_err_index[2:0]),
  .trs_rqv(trs_rqv[7:0]),
  .trs_null_st(trs_null_st[7:0]),
  .trs_waitrr3_st(trs_waitrr3_st[7:0]),
  .trs_ep_err(trs_ep_err[7:0]),
  .trs_ecc_err(trs_ecc_err[7:0]),
  .trs0_err_type(trs0_err_type[2:0]),
  .trs1_err_type(trs1_err_type[2:0]),
  .trs2_err_type(trs2_err_type[2:0]),
  .trs3_err_type(trs3_err_type[2:0]),
  .trs4_err_type(trs4_err_type[2:0]),
  .trs5_err_type(trs5_err_type[2:0]),
  .trs6_err_type(trs6_err_type[2:0]),
  .trs7_err_type(trs7_err_type[2:0]),
  .trs0_err_index(trs0_err_index[2:0]),
  .trs1_err_index(trs1_err_index[2:0]),
  .trs2_err_index(trs2_err_index[2:0]),
  .trs3_err_index(trs3_err_index[2:0]),
  .trs4_err_index(trs4_err_index[2:0]),
  .trs5_err_index(trs5_err_index[2:0]),
  .trs6_err_index(trs6_err_index[2:0]),
  .trs7_err_index(trs7_err_index[2:0]),
  .trs_eccerr_st(trs_eccerr_st[7:0]),
  .trs_eperr_st(trs_eperr_st[7:0])
);



//////////////////////////////////////////////////////////////////////////////
// MBIST datapath
mmu_mbd_dp mbd(
  .asi_mbd_scp_data(asi_mbd_scp_data[31:0]),
  .asi_compare_data(asi_compare_data[7:0]),
  .asi_mbd_sel_scp(asi_mbd_sel_scp),
  .ase_mbd_mbist_data(ase_mbd_mbist_data[31:0]),
  .mbd_compare(mbd_compare));


////////////////////////////////////////////////////////////////////////////////
// Scan patch panel
// fixscan start:
assign asi_scanin                = scan_in                  ;
assign asd0_scanin               = asi_scanout              ;
assign asd1_scanin               = asd0_scanout             ;
assign ase_scanin                = asd1_scanout             ;
assign mel0_scanin               = ase_scanout              ;
assign mra0_scanin               = mel0_scanout             ;
assign mel1_scanin               = mra0_scanout             ;
assign mra1_scanin               = mel1_scanout             ;
assign sel_scanin                = mra1_scanout             ;
assign scp0_scanin               = sel_scanout              ;
assign scp1_scanin               = scp0_scanout             ;
assign htc_scanin                = scp1_scanout             ;
assign htd_scanin                = htc_scanout              ;
assign tmc_scanin                = htd_scanout              ;
assign trc_scanin                = tmc_scanout              ;
assign scan_out                  = trc_scanout              ;

assign asi_wmr_scanin            = wmr_scan_in              ;
assign asd0_wmr_scanin           = asi_wmr_scanout          ;
assign asd1_wmr_scanin           = asd0_wmr_scanout         ;
assign htc_wmr_scanin            = asd1_wmr_scanout         ;
assign wmr_scan_out              = htc_wmr_scanout          ;
// fixscan end:
endmodule

