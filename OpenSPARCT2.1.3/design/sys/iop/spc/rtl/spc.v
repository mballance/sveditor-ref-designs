// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc.v
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
module spc (
  gclk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_atpg_mode, 
  rst_wmr_protect, 
  scan_out, 
  tcu_shscan_pce_ov, 
  tcu_shscan_clk_stop, 
  tcu_shscan_aclk, 
  tcu_shscan_bclk, 
  tcu_shscan_scan_in, 
  tcu_shscan_scan_en, 
  tcu_shscanid, 
  spc_shscan_scan_out, 
  cluster_arst_l, 
  tcu_spc_mbist_scan_in, 
  tcu_mbist_bisi_en, 
  tcu_spc_mbist_start, 
  tcu_mbist_user_mode, 
  spc_mbist_fail, 
  spc_mbist_done, 
  spc_tcu_mbist_scan_out, 
  const_cpuid, 
  tcu_ss_mode, 
  tcu_do_mode, 
  tcu_ss_request, 
  ncu_cmp_tick_enable, 
  spc_ss_complete, 
  ncu_wmr_vec_mask, 
  spc_hardstop_request, 
  spc_softstop_request, 
  spc_trigger_pulse, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  efu_spc_fuse_data, 
  efu_spc_fuse_ixfer_en, 
  efu_spc_fuse_dxfer_en, 
  efu_spc_fuse_iclr, 
  efu_spc_fuse_dclr, 
  spc_efu_fuse_ddata, 
  spc_efu_fuse_idata, 
  spc_efu_fuse_ixfer_en, 
  spc_efu_fuse_dxfer_en, 
  vnw_ary0, 
  vnw_ary1, 
  tcu_spc_lbist_start, 
  tcu_spc_lbist_scan_in, 
  tcu_spc_lbist_pgm, 
  tcu_spc_test_mode, 
  spc_tcu_lbist_done, 
  spc_tcu_lbist_scan_out, 
  dmo_din, 
  dmo_coresel, 
  dmo_icmuxctl, 
  dmo_dcmuxctl, 
  dmo_dout, 
  ncu_spc_l2_idx_hash_en, 
  cpx_spc_data_cx, 
  pcx_spc_grant_px, 
  spc_pcx_req_pq, 
  spc_pcx_atm_pq, 
  spc_pcx_data_pa, 
  tcu_core_running, 
  spc_core_running_status, 
  power_throttle, 
  spc_dbg_instr_cmt_grp0, 
  spc_dbg_instr_cmt_grp1, 
  hver_mask_minor_rev, 
  ccu_slow_cmp_sync_en, 
  ccu_cmp_slow_sync_en);
wire lsu_scanin;
wire msf0_scanout;
wire l2clk;
wire lb_se_sc_out;
wire pce_ov_br;
wire lb_scan_en_br;
wire spc_aclk_br;
wire spc_bclk_br;
wire gkt_scanin;
wire msf1_scanout;
wire tcu_spc_lbist_scan_in_buf;
wire spc_tcu_lbist_scan_out_buf;
wire pce_ov_tr;
wire tcu_aclk_buf;
wire tcu_bclk_buf;
wire tcu_scan_en_buf;
wire tcu_se_scancollar_in_buf;
wire tcu_se_scancollar_out_buf;
wire tcu_array_wr_inhibit_buf;
wire tcu_spc_test_mode_buf;
wire [1:0] scan_in_buf;
wire [1:0] scan_out_buf;
wire tcu_spc_lbist_start_buf;
wire tcu_spc_lbist_pgm_buf;
wire lb_lbist_done;
wire lb_lbist_running;
wire wmr_protect_scanin;
wire dmo_scanin;
wire clk_spc_scanin;
wire mmu_scanin;
wire ifu_ibu_scanin;
wire ifu_ftu_scanin;
wire ifu_cmu_scanin;
wire dec_scanin;
wire pku_scanin;
wire exu0_scanin;
wire exu1_scanin;
wire tlu_scanin;
wire spu_scanin;
wire fgu_scanin;
wire mmu_wmr_scanout;
wire dmo_scanout;
wire clk_spc_scanout;
wire pmu_scanout;
wire ifu_ibu_scanout;
wire ifu_ftu_scanout;
wire ifu_cmu_scanout;
wire dec_scanout;
wire pku_scanout;
wire exu0_scanout;
wire exu1_scanout;
wire tlu_scanout;
wire lsu_scanout;
wire spu_scanout;
wire fgu_scanout;
wire gkt_scanout;
wire lb_mb_channel_si;
wire mb2_scanout;
wire tcu_spc_mbist_scan_in_buf;
wire spc_tcu_mbist_scan_out_buf;
wire lb_aclk;
wire lb_bclk;
wire lb_scan_en;
wire lb_se_sc_in;
wire lb_clk_stop;
wire lb_array_wr_inhibit;
wire lb_scan_en_wmr;
wire spc_aclk;
wire spc_aclk_wmr;
wire clk_array_wr_inhibit;
wire spc_bclk;
wire cluster_arst_l_buf;
wire cmp_slow_sync_en;
wire pce_ov;
wire por_unused;
wire rst_wmr_protect_buf;
wire slow_cmp_sync_en;
wire tcu_pce_ov_buf;
wire msf0_atpg_mode_buf;
wire wmr_unused;
wire [3:0] dcc_dmo_parity;
wire [63:0] lsu_exu_ld_data_b;
wire [39:4] mmu_l15_addr;
wire [4:0] mmu_l15_cpkt;
wire [38:3] spu_l15_addr;
wire [12:0] spu_l15_cpkt;
wire [63:0] spu_l15_data;
wire exu1_wmr_scanout;
wire fgu_wmr_scanout;
wire spc_aclk_tr;
wire spc_aclk_wmr_tr;
wire spc_bclk_tr;
wire lb_scan_en_tr;
wire tcu_dectest_buf;
wire tcu_muxtest_buf;
wire exu_fgu_fmov_vld_m;
wire dec_spu_grant_fgu_d;
wire [7:0] tlu_core_running_status;
wire [64:0] pmu_rngl_cdbus;
wire [64:0] fgu_rngl_cdbus;
wire [63:0] lsu_fgu_fld_data_b;
wire [63:0] exu_fgu_rs1_e;
wire [63:0] exu_fgu_rs2_e;
wire [63:0] spu_fgu_rs1_e;
wire [63:0] spu_fgu_rs2_e;
wire [9:0] mb2_addr;
wire mb2_run;
wire [7:0] mb2_write_data;
wire mb2_frf_read_en;
wire mb2_frf_write_en;
wire pce_ov_bl;
wire lb_scan_en_bl;
wire spc_aclk_bl;
wire spc_bclk_bl;
wire lsu_cpx_valid;
wire lsu_wmr_scanout;
wire ifu_ftu_wmr_scanout;
wire spc_aclk_wmr_bl;
wire mb0_run;
wire mb0_ict_write_en;
wire mb0_ict_read_en;
wire mb0_icd_write_en;
wire mb0_icd_read_en;
wire mb0_icv_write_en;
wire mb0_icv_read_en;
wire mb0_itb_write_en;
wire mb0_itb_read_en;
wire [11:0] mb0_addr;
wire [7:0] mb0_write_data;
wire [2:0] mb0_cmpsel;
wire [47:0] exu_address0_e_rep01;
wire [47:0] exu_address1_e_rep01;
wire tlu_trap_pc_0_valid;
wire tlu_trap_pc_1_valid;
wire [47:0] tlu_trap_pc_0;
wire [47:0] tlu_trap_pc_1;
wire [47:2] tlu_npc_w;
wire [64:0] lsu_rngl_cdbus;
wire [64:0] ifu_rngl_cdbus;
wire cmu_inst3_v;
wire cmu_inst2_v;
wire cmu_inst1_v;
wire cmu_inst0_v;
wire efu_spc_fuse_data_buf;
wire efu_spc_fuse_ixfer_en_buf;
wire efu_spc_fuse_iclr_buf;
wire spc_efu_fuse_ixfer_en_buf;
wire spc_efu_fuse_idata_buf;
wire [17:0] lsu_cpx_cpkt;
wire [127:0] lsu_cpx_data;
wire mmu_dtlb_reload_stall;
wire [2:0] power_throttle_buf;
wire lsu_frf_read_pending;
wire msf0_do_mode;
wire [1:0] dec_br_taken_e1;
wire [7:0] tlu_spec_enable;
wire exu0_wmr_scanout;
wire [7:0] del_pick_d;
wire [1:0] dec_tid0_p;
wire dec_inst0_rs1_vld_p;
wire dec_inst0_rs2_vld_p;
wire dec_inst0_rs3_vld_p;
wire [4:0] dec_inst0_rs1_p;
wire [4:0] dec_inst0_rs2_p;
wire [4:0] dec_inst0_rs3_p;
wire [1:0] dec_exu_clken;
wire [32:0] dec_inst0_d;
wire [4:0] dec_inst0_rd_d;
wire dec_decode0_d;
wire [1:0] dec_valid_e;
wire [1:0] dec_flush_m;
wire [1:0] dec_flush_b;
wire [63:0] fgu_exu_result_fx5_rep1;
wire [1:0] fgu_exu_w_vld_fx5;
wire [47:2] tlu_pc_0_d;
wire [1:0] tlu_itlb_bypass_e;
wire [1:0] tlu_flush_exu_b;
wire [7:0] tlu_ccr_0;
wire [2:0] tlu_cwp_0;
wire tlu_ccr_cwp_0_valid;
wire [1:0] tlu_ccr_cwp_0_tid;
wire [7:0] tlu_pstate_am;
wire [1:0] tlu_gl0;
wire [1:0] tlu_gl1;
wire [1:0] tlu_gl2;
wire [1:0] tlu_gl3;
wire tlu_cerer_irf;
wire [7:0] tlu_ceter_pscce;
wire [7:0] mb2_write_data_p1;
wire mb2_irf_write_en;
wire mb2_irf_read_en;
wire mb2_irf_save_en;
wire mb2_irf_restore_en;
wire [31:0] lsu_asi_error_inject;
wire [63:0] lsu_exu_ld_data_b_rep00;
wire [64:0] exu0_rngl_cdbus;
wire [47:0] exu_address0_e;
wire [5:0] exu0_mdp_mux_sel_e;
wire exu_ms_icc0_e;
wire [63:0] exu_rs1_data0_e;
wire [63:0] exu_rs2_data0_e;
wire [63:0] exu_store_data0_e;
wire [3:0] exu0_oddwin_b;
wire [1:0] exu_cecc_m;
wire [1:0] exu_uecc_m;
wire [1:0] exu_misalign_m;
wire [1:0] exu_oor_va_m;
wire [1:0] exu_tcc_m;
wire [1:0] exu_tof_m;
wire [7:0] exu0_trap_number_b;
wire [1:0] exu_spill_b;
wire [1:0] exu_fill_m;
wire [1:0] exu_normal_b;
wire [1:0] exu_cleanwin_b;
wire [2:0] exu0_wstate_b;
wire [7:0] exu0_ccr0;
wire [7:0] exu0_ccr1;
wire [7:0] exu0_ccr2;
wire [7:0] exu0_ccr3;
wire [1:0] exu_ecc_m;
wire [7:0] exu0_ecc_check_m;
wire [4:0] exu0_ecc_addr_m;
wire [31:0] exu_gsr_data0_m;
wire [1:0] exu_gsr_vld0_m;
wire [1:0] exu_cmov_true_m;
wire [1:0] dec_br_taken_e;
wire [1:0] exu_ibp_m;
wire [1:0] exu_lsu_va_error_m;
wire [31:0] exu_y_data0_e;
wire [2:0] exu0_cwp0;
wire [2:0] exu0_cwp1;
wire [2:0] exu0_cwp2;
wire [2:0] exu0_cwp3;
wire exu0_window_block;
wire [1:0] exu_tlu_window_block;
wire [1:0] exu_ecc_winop_flush_m;
wire exu_test_valid0;
wire [1:0] exu_test_tid0;
wire [4:0] exu_test_addr0;
wire [1:0] exu0_mbi_irf_fail_;
wire [1:0] dec_tid1_p;
wire dec_inst1_rs1_vld_p;
wire dec_inst1_rs2_vld_p;
wire dec_inst1_rs3_vld_p;
wire [4:0] dec_inst1_rs1_p;
wire [4:0] dec_inst1_rs2_p;
wire [4:0] dec_inst1_rs3_p;
wire [32:0] dec_inst1_d;
wire [4:0] dec_inst1_rd_d;
wire dec_decode1_d;
wire [63:0] fgu_exu_result_fx5_rep0;
wire [47:2] tlu_pc_1_d;
wire [7:0] tlu_ccr_1;
wire [2:0] tlu_cwp_1;
wire tlu_ccr_cwp_1_valid;
wire [1:0] tlu_ccr_cwp_1_tid;
wire [1:0] tlu_gl4;
wire [1:0] tlu_gl5;
wire [1:0] tlu_gl6;
wire [1:0] tlu_gl7;
wire [63:0] lsu_exu_ld_data_b_rep01;
wire [64:0] exu1_rngl_cdbus;
wire [47:0] exu_address1_e;
wire [5:0] exu1_mdp_mux_sel_e;
wire exu_ms_icc1_e;
wire [63:0] exu_rs1_data1_e;
wire [63:0] exu_rs2_data1_e;
wire [63:0] exu_store_data1_e;
wire [3:0] exu1_oddwin_b;
wire [7:0] exu1_trap_number_b;
wire [2:0] exu1_wstate_b;
wire [7:0] exu1_ccr0;
wire [7:0] exu1_ccr1;
wire [7:0] exu1_ccr2;
wire [7:0] exu1_ccr3;
wire [7:0] exu1_ecc_check_m;
wire [4:0] exu1_ecc_addr_m;
wire [31:0] exu_gsr_data1_m;
wire [1:0] exu_gsr_vld1_m;
wire [31:0] exu_y_data1_e;
wire [2:0] exu1_cwp0;
wire [2:0] exu1_cwp1;
wire [2:0] exu1_cwp2;
wire [2:0] exu1_cwp3;
wire exu1_window_block;
wire exu_test_valid1;
wire [1:0] exu_test_tid1;
wire [4:0] exu_test_addr1;
wire [1:0] exu1_mbi_irf_fail_;
wire tlu_wmr_scanout;
wire pce_ov_tl;
wire lb_scan_en_tl;
wire spc_aclk_tl;
wire spc_aclk_wmr_tl;
wire spc_bclk_tl;
wire [3:0] hver_mask_minor_rev_buf;
wire msf0_cmp_tick_enable;
wire msf0_ss_mode;
wire msf0_ss_request;
wire msf0_wmr_vec_mask;
wire [47:0] exu_address0_e_rep0;
wire [47:0] exu_address1_e_rep0;
wire fgu_cecc_fx2_rep1;
wire fgu_uecc_fx2_rep1;
wire l15_mmu_valid;
wire [17:0] l15_spc_cpkt;
wire [127:0] l15_spc_data1;
wire mb1_tsa0_write_en;
wire mb1_tsa1_write_en;
wire mb1_tca_write_en;
wire [7:0] mb1_addr;
wire mb1_run;
wire [7:0] mb1_write_data;
wire mb1_tsa0_read_en;
wire mb1_tsa1_read_en;
wire mb1_tca_read_en;
wire [4:0] mb1_cmpsel;
wire [7:0] dec_block_store_b;
wire [64:0] lsu_rngf_cdbus;
wire [47:0] lsu_mmu_va_b;
wire [3:0] spu_pmu_ma_busy;
wire spc_shscan_scan_out_buf;
wire tcu_shscan_pce_ov_buf;
wire msf0_shscan_clk_stop;
wire tcu_shscan_aclk_buf;
wire tcu_shscan_bclk_buf;
wire tcu_shscan_scan_en_buf;
wire tcu_shscan_scan_in_buf;
wire [2:0] msf0_shscanid;
wire [7:0] msf0_core_running;
wire dmo_coresel_buff;
wire dmo_dcmuxctl_buf;
wire spc_aclk_wmr_br;
wire [63:0] fgu_lsu_fst_data_fx1;
wire [145:0] cpx_spc_data_cx_rep0;
wire [64:0] tlu_rngf_cdbus;
wire mb0_dca_read_en;
wire mb0_dca_write_en;
wire mb0_dta_read_en;
wire mb0_dta_write_en;
wire mb0_dva_read_en;
wire mb0_dva_write_en;
wire mb0_lru_read_en;
wire mb0_lru_write_en;
wire mb0_dtb_read_en;
wire mb0_dtb_write_en;
wire mb0_stb_cam_read_en;
wire mb0_stb_cam_write_en;
wire mb0_stb_ram_read_en;
wire mb0_stb_ram_write_en;
wire mb0_cpq_read_en;
wire mb0_cpq_write_en;
wire efu_spc_fuse_dxfer_en_buf;
wire efu_spc_fuse_dclr_buf;
wire spc_efu_fuse_ddata_buf;
wire spc_efu_fuse_dxfer_en_buf;
wire [63:0] fgu_mul_result_fx5;
wire dec_spu_grant_d_rep0;
wire [64:0] spu_rngl_cdbus;
wire l15_spu_valid;
wire [7:0] mb2_write_data_p2;
wire mb2_arf_read_en;
wire mb2_arf_write_en;
wire mb2_mam_read_en;
wire mb2_mam_write_en;
wire mb2_rrf_read_en;
wire mb2_rrf_write_en;
wire mmu_scanout;
wire mb1_mra0_write_en;
wire mb1_mra1_write_en;
wire mb1_scp0_write_en;
wire mb1_scp1_write_en;
wire mb1_mra0_read_en;
wire mb1_mra1_read_en;
wire mb1_scp0_read_en;
wire mb1_scp1_read_en;
wire dec_valid0_d;
wire [1:0] dec_tid0_d;
wire [9:0] dec_instr0_type_d;
wire dec_valid1_d;
wire [1:0] dec_tid1_d;
wire [9:0] dec_instr1_type_d;
wire [1:0] dec_pmu_valid_e;
wire [2:0] lsu_dcerr_tid_g;
wire [2:0] lsu_pmu_mem_type_b;
wire mb0_scanin;
wire mb0_scanout;
wire tcu_spc_mbist_start_buf0;
wire msf0_mbist_user_mode_ff;
wire msf0_mbist_bisi_en_ff;
wire mb2_mb0_fail;
wire mb1_mb0_fail;
wire mb2_mb0_done;
wire mb1_mb0_done;
wire spc_mbist_fail_buf;
wire spc_mbist_done_buf;
wire [15:12] mb0_addr_unused;
wire mb1_scanin;
wire mb1_scanout;
wire [15:8] mb1_addr_unused;
wire mb2_scanin;
wire [15:10] mb2_addr_unused;
wire [63:0] fgu_exu_result_fx5;
wire fgu_cecc_fx2;
wire fgu_uecc_fx2;
wire tcu_spc_mbist_start_ff;
wire spc_mbist_fail_ff;
wire spc_mbist_done_ff;
wire [32:0] ftu_instr_0_c;
wire [32:0] ftu_instr_1_c;
wire [32:0] ftu_instr_2_c;
wire [32:0] ftu_instr_3_c;
wire [4:0] ftu_instr_exceptions_c;
wire [32:0] ftu_instr_0_c_rep0;
wire [32:0] ftu_instr_0_c_rep1;
wire [32:0] ftu_instr_0_c_rep2;
wire [32:0] ftu_instr_0_c_rep3;
wire [32:0] ftu_instr_1_c_rep0;
wire [32:0] ftu_instr_1_c_rep1;
wire [32:0] ftu_instr_1_c_rep2;
wire [32:0] ftu_instr_1_c_rep3;
wire [32:0] ftu_instr_2_c_rep0;
wire [32:0] ftu_instr_2_c_rep1;
wire [32:0] ftu_instr_2_c_rep2;
wire [32:0] ftu_instr_2_c_rep3;
wire [32:0] ftu_instr_3_c_rep0;
wire [32:0] ftu_instr_3_c_rep1;
wire [32:0] ftu_instr_3_c_rep2;
wire [32:0] ftu_instr_3_c_rep3;
wire [4:0] ftu_instr_0_exceptions_c_rep0;
wire [4:0] ftu_instr_0_exceptions_c_rep1;
wire [4:0] ftu_instr_0_exceptions_c_rep2;
wire [4:0] ftu_instr_0_exceptions_c_rep3;
wire [4:0] ftu_instr_1_exceptions_c_rep0;
wire [4:0] ftu_instr_1_exceptions_c_rep1;
wire [4:0] ftu_instr_1_exceptions_c_rep2;
wire [4:0] ftu_instr_1_exceptions_c_rep3;
wire [4:0] ftu_instr_2_exceptions_c_rep0;
wire [4:0] ftu_instr_2_exceptions_c_rep1;
wire [4:0] ftu_instr_2_exceptions_c_rep2;
wire [4:0] ftu_instr_2_exceptions_c_rep3;
wire [4:0] ftu_instr_3_exceptions_c_rep0;
wire [4:0] ftu_instr_3_exceptions_c_rep1;
wire [4:0] ftu_instr_3_exceptions_c_rep2;
wire [4:0] ftu_instr_3_exceptions_c_rep3;
wire dec_spu_grant_d;
wire tlu_ss_complete;
wire tlu_hardstop_request;
wire tlu_softstop_request;
wire tlu_trigger_pulse;
wire [1:0] tlu_dbg_instr_cmt_grp0;
wire [1:0] tlu_dbg_instr_cmt_grp1;
wire wmr_protect;
wire core_isolate;
wire [32:0] ic_dmo_rd_data;
wire lsu_gkt_pmen;
wire ifu_l15_valid;
wire mmu_l15_valid;
wire lsu_l15_valid;
wire spu_l15_valid;
wire lsu_l15_lock;
wire [39:0] ifu_l15_addr;
wire [39:0] lsu_l15_addr;
wire [7:0] ifu_l15_cpkt;
wire [25:0] lsu_l15_cpkt;
wire [63:0] lsu_l15_data;
wire l15_ifu_grant;
wire l15_mmu_grant;
wire l15_lsu_grant;
wire l15_spu_grant;
wire [3:0] gkt_ifu_legal;
wire [3:0] gkt_ifu_flip_parity;
wire [6:0] l15_pmu_xbar_optype;
wire [4:0] dec_frf_r1_addr_d;
wire [4:0] dec_frf_r2_addr_d;
wire dec_frf_r1_vld_d;
wire dec_frf_r2_vld_d;
wire dec_frf_r1_32b_d;
wire dec_frf_r2_32b_d;
wire dec_frf_r1_odd32b_d;
wire dec_frf_r2_odd32b_d;
wire dec_frf_w_vld_d;
wire [4:0] dec_frf_w_addr_d;
wire dec_frf_w_32b_d;
wire dec_frf_w_odd32b_d;
wire dec_exu_src_vld_d;
wire [4:0] dec_irf_w_addr_d;
wire dec_frf_store_d;
wire dec_fsr_store_d;
wire [5:0] dec_fgu_op3_d;
wire [7:0] dec_fgu_opf_d;
wire dec_fgu_decode_d;
wire dec_fgu_valid_e;
wire [2:0] dec_fgu_tid_d;
wire dec_flush_f1;
wire dec_flush_f2;
wire [1:0] fgu_cmp_fcc_fx3;
wire [3:0] fgu_cmp_fcc_vld_fx3;
wire [2:0] fgu_cmp_fcc_tid_fx2;
wire [7:0] fgu_fld_fcc_fx3;
wire [1:0] fgu_fld_fcc_vld_fx3;
wire [7:0] fgu_fprs_fef;
wire fgu_fdiv_stall;
wire [1:0] fgu_idiv_stall;
wire [7:0] fgu_divide_completion;
wire tlu_flush_fgu_b;
wire tlu_cerer_frf;
wire fgu_predict_fx2;
wire fgu_pdist_beat2_fx1;
wire [5:0] fgu_ecc_addr_fx2;
wire [13:0] fgu_ecc_check_fx2;
wire fgu_fpx_ieee_trap_fw;
wire fgu_fpd_ieee_trap_fw;
wire fgu_fpx_unfin_fw;
wire fgu_fpd_unfin_fw;
wire fgu_fpd_idiv0_trap_fw;
wire [2:0] fgu_fpx_trap_tid_fw;
wire [2:0] fgu_fpd_trap_tid_fw;
wire [4:0] lsu_fgu_fld_addr_b;
wire lsu_fgu_fld_vld_w;
wire lsu_fgu_fld_b;
wire [2:0] lsu_fgu_fld_tid_b;
wire lsu_fgu_fld_32b_b;
wire lsu_fgu_fld_odd32b_b;
wire lsu_fgu_fsr_load_b;
wire lsu_fgu_exception_w;
wire lsu_block_store_m;
wire lsu_fgu_pmen;
wire lsu_asi_clken;
wire fgu_fst_ecc_error_fx2;
wire [31:0] exu_fgu_gsr_m;
wire [1:0] exu_fgu_gsr_vld_m;
wire exu_fgu_flush_m;
wire [3:0] fgu_exu_icc_fx5;
wire [1:0] fgu_exu_xcc_fx5;
wire fgu_exu_cc_vld_fx5;
wire [1:0] fgu_result_tid_fx5;
wire [4:0] fgu_irf_w_addr_fx5;
wire [6:0] spu_fgu_fpy_ctl_d;
wire fgu_accum_b0_fx5;
wire fgu_mbi_frf_fail;
wire [7:0] pku_flush_buffer0;
wire [7:0] pku_flush_upper_buffer;
wire [7:0] ftu_fetch_thr_c;
wire [7:0] pku_pick_p;
wire ftu_exception_valid_c;
wire ftu_instr_sf_valid_c;
wire [7:0] ftu_ibu_redirect_bf;
wire ftu_ic_no_err_c;
wire ftu_bus_0_is_first;
wire ftu_bus_1_is_first;
wire ftu_bus_2_is_first;
wire ftu_bus_3_is_first;
wire [3:0] ftu_instr_valid_c;
wire lsu_ifu_ibu_pmen;
wire [7:0] ftu_buffer_wr_en_f;
wire [7:0] ifu_buf0_valid_p;
wire [7:0] ifu_upper_buffer_valid_p;
wire [7:0] ibu_empty;
wire [7:0] ibu_room_4ormore;
wire [32:0] ifu_buf0_inst0;
wire [32:0] ifu_buf0_inst1;
wire [32:0] ifu_buf0_inst2;
wire [32:0] ifu_buf0_inst3;
wire [32:0] ifu_buf0_inst4;
wire [32:0] ifu_buf0_inst5;
wire [32:0] ifu_buf0_inst6;
wire [32:0] ifu_buf0_inst7;
wire [4:0] ifu_buf0_excp0;
wire [4:0] ifu_buf0_excp1;
wire [4:0] ifu_buf0_excp2;
wire [4:0] ifu_buf0_excp3;
wire [4:0] ifu_buf0_excp4;
wire [4:0] ifu_buf0_excp5;
wire [4:0] ifu_buf0_excp6;
wire [4:0] ifu_buf0_excp7;
wire mbi_cambist_run;
wire mbi_cambist_shift;
wire mbi_dis_clr_ubit;
wire mbi_init_to_zero;
wire mbi_itb_cam_en_pre;
wire mbi_repl_write;
wire mbi_itb_demap_en;
wire [1:0] mbi_demap_type;
wire ftu_mbi_tlb_data_cmp;
wire ftu_mbi_tlb_cam_hit;
wire ftu_mbi_tlb_cam_mhit;
wire ftu_mbi_tlb_ctxt0_hit;
wire ftu_mbi_tlb_valid;
wire ftu_mbi_tlb_used;
wire lsu_ifu_direct_map;
wire ftu_mbi_ict_fail;
wire ftu_mbi_icd_fail;
wire ftu_mbi_itb_fail;
wire ftu_mbi_icv_fail;
wire [1:0] tlu_retry;
wire [7:0] tlu_ifu_hpstate_hpriv;
wire [7:0] tlu_ifu_pstate_priv;
wire [1:0] tlu_ifu_invalidate;
wire [39:0] cmu_fill_paddr;
wire [7:0] cmu_inval_ack;
wire [1:0] cmu_l2_err;
wire cmu_l2miss;
wire tlu_cerer_ittp;
wire tlu_cerer_itdp;
wire tlu_cerer_ittm;
wire tlu_cerer_icl2c;
wire tlu_cerer_icl2u;
wire tlu_cerer_icl2nd;
wire tlu_cerer_icvp;
wire tlu_cerer_ictp;
wire tlu_cerer_ictm;
wire cmu_icache_invalidate;
wire cmu_evic_invalidate;
wire [2:0] cmu_icache_invalidate_way;
wire [2:0] cmu_icache_inv_way1;
wire [10:5] cmu_icache_invalidate_index;
wire [1:0] dec_load_flush_w;
wire [1:0] tlu_trap_0_tid;
wire [1:0] tlu_trap_1_tid;
wire [7:0] tlu_flush_ifu;
wire [1:0] tlu_itlb_reload;
wire [7:0] tlu_itlb_bypass;
wire [7:0] tlu_tl_gt_0;
wire [7:0] cmu_null_st;
wire [7:0] cmu_dupmiss_st;
wire [7:0] cmu_rst_dupmiss;
wire cmu_any_un_cacheable;
wire cmu_any_data_ready;
wire cmu_thr0_data_ready;
wire cmu_thr1_data_ready;
wire cmu_thr2_data_ready;
wire cmu_thr3_data_ready;
wire cmu_thr4_data_ready;
wire cmu_thr5_data_ready;
wire cmu_thr6_data_ready;
wire cmu_thr7_data_ready;
wire [32:0] cmu_fill_inst0;
wire [32:0] cmu_fill_inst1;
wire [32:0] cmu_fill_inst2;
wire [32:0] cmu_fill_inst3;
wire [7:0] lsu_ic_enable;
wire [7:0] lsu_ifu_no_miss;
wire [12:0] lsu_ifu_ctxt_data;
wire [2:0] lsu_ifu_tid_w;
wire lsu_ifu_wr_p0ctxt;
wire lsu_ifu_wr_p1ctxt;
wire lsu_ifu_wr_pid;
wire [7:0] lsu_immu_enable;
wire lsu_ifu_ftu_pmen;
wire lsu_ic_pmen;
wire [2:0] cmu_fill_wrway;
wire [263:0] cmu_ic_data;
wire [6:0] mmu_index;
wire [2:0] ftu_rep_way;
wire [39:0] ftu_paddr;
wire [7:0] ftu_curr_fetch_thr_f;
wire [7:0] ftu_ifu_quiesce;
wire [7:0] ifu_ibuffer_write_c;
wire [2:0] ftu_excp_way_d;
wire [2:0] ftu_excp_tid_d;
wire ftu_excp_way_valid_d;
wire ftu_thrx_un_cacheable;
wire ftu_agc_thr0_cmiss_c;
wire ftu_agc_thr1_cmiss_c;
wire ftu_agc_thr2_cmiss_c;
wire ftu_agc_thr3_cmiss_c;
wire ftu_agc_thr4_cmiss_c;
wire ftu_agc_thr5_cmiss_c;
wire ftu_agc_thr6_cmiss_c;
wire ftu_agc_thr7_cmiss_c;
wire ftu_thr0_inv_req_c;
wire ftu_thr1_inv_req_c;
wire ftu_thr2_inv_req_c;
wire ftu_thr3_inv_req_c;
wire ftu_thr4_inv_req_c;
wire ftu_thr5_inv_req_c;
wire ftu_thr6_inv_req_c;
wire ftu_thr7_inv_req_c;
wire ftu_thr0_redirect_bf;
wire ftu_thr1_redirect_bf;
wire ftu_thr2_redirect_bf;
wire ftu_thr3_redirect_bf;
wire ftu_thr4_redirect_bf;
wire ftu_thr5_redirect_bf;
wire ftu_thr6_redirect_bf;
wire ftu_thr7_redirect_bf;
wire lsu_ifu_cmu_pmen;
wire [10:5] lsu_ifu_ld_index;
wire ifu_lsu_if_vld;
wire [2:0] ifu_lsu_if_tid;
wire [10:5] ifu_lsu_if_addr;
wire lsu_dec_pmen;
wire lsu_exu_pmen;
wire tlu_cerer_icdp;
wire [7:0] tlu_dec_pstate_pef;
wire [7:0] tlu_dec_hpstate_hpriv;
wire [7:0] tlu_dec_pstate_priv;
wire [1:0] tlu_window_block;
wire lsu_cpq_stall;
wire [7:0] pku_load_flush_w;
wire [1:0] pku_inst_cnt_brtaken00;
wire [1:0] pku_inst_cnt_brtaken01;
wire [1:0] pku_inst_cnt_brtaken02;
wire [1:0] pku_inst_cnt_brtaken03;
wire [1:0] pku_inst_cnt_brtaken04;
wire [1:0] pku_inst_cnt_brtaken05;
wire [1:0] pku_inst_cnt_brtaken06;
wire [1:0] pku_inst_cnt_brtaken07;
wire [1:0] pku_inst_cnt_brtaken10;
wire [1:0] pku_inst_cnt_brtaken11;
wire [1:0] pku_inst_cnt_brtaken12;
wire [1:0] pku_inst_cnt_brtaken13;
wire [1:0] pku_inst_cnt_brtaken14;
wire [1:0] pku_inst_cnt_brtaken15;
wire [1:0] pku_inst_cnt_brtaken16;
wire [1:0] pku_inst_cnt_brtaken17;
wire [7:0] pku_base_pick_p;
wire [3:0] pku_raw_pick0_p;
wire [7:4] pku_raw_pick1_p;
wire [7:0] pku_annul_ds_dcti_brtaken0_e;
wire [7:0] pku_annul_ds_dcti_brtaken1_e;
wire [7:0] pku_valid_e;
wire [7:0] pku_ds_e;
wire [7:0] pku_lsu_p;
wire [7:0] pku_fgu_p;
wire [7:0] pku_pdist_p;
wire [7:0] pku_twocycle_p;
wire [7:0] pku_idest_p;
wire [7:0] pku_fdest_p;
wire [7:0] pku_fsrc_rd_p;
wire [7:0] pku_isrc_rs1_p;
wire [7:0] pku_isrc_rs2_p;
wire [7:0] pku_isrc_rd_p;
wire [7:0] pku_flush_f1;
wire [7:0] pku_flush_f2;
wire [7:0] pku_flush_lm;
wire [7:0] pku_flush_lb;
wire [7:0] pku_flush_m;
wire [7:0] pku_flush_b;
wire spu_mult_request;
wire lsu_block_store_stall;
wire [4:3] lsu_block_store_rd;
wire [2:0] lsu_block_store_tid;
wire dec_rs1_addr0_e;
wire dec_rs1_addr1_e;
wire [1:0] dec_true_valid_e;
wire [7:0] dec_raw_pick_p;
wire dec_flush_lm;
wire dec_flush_lb;
wire [4:0] dec_exc0_m;
wire [4:0] dec_exc1_m;
wire [1:0] dec_inst0_cnt;
wire [1:0] dec_inst1_cnt;
wire [1:0] dec_tid0_m;
wire [1:0] dec_tid1_m;
wire [1:0] dec_inst_valid_m;
wire [1:0] dec_lsu_inst_m;
wire [1:0] dec_fgu_inst_m;
wire [1:0] dec_cti_inst_m;
wire [1:0] dec_illegal_inst_m;
wire [1:0] dec_icache_perr_m;
wire [1:0] dec_priv_exc_m;
wire [1:0] dec_hpriv_exc_m;
wire [1:0] dec_fpdisable_exc_m;
wire [1:0] dec_br_taken_m;
wire [1:0] dec_done_inst_m;
wire [1:0] dec_retry_inst_m;
wire [1:0] dec_sir_inst_m;
wire [1:0] dec_annul_ds_m;
wire [1:0] dec_ds_m;
wire [1:0] dec_fgu_sel_e;
wire [1:0] dec_fgu_sel_m;
wire dec_lsu_sel0_e;
wire dec_lsu_sel1_e;
wire dec_lsu_sel0_lower_e;
wire dec_lsu_sel1_lower_e;
wire dec_lsu_sel0_upper_e;
wire dec_lsu_sel1_upper_e;
wire dec_rs1_addr0_upper_e;
wire dec_rs1_addr1_upper_e;
wire dec_ld_inst_e;
wire dec_st_inst_e;
wire dec_fsr_ldst_e;
wire dec_fpldst_inst_e;
wire dec_ldst_dbl_e;
wire dec_pref_inst_e;
wire dec_flush_inst_e;
wire dec_memstbar_inst_e;
wire [1:0] dec_ldst_sz_e;
wire [4:3] dec_frf_r2_addr_e;
wire dec_sr_inst_e;
wire dec_pr_inst_e;
wire dec_hpr_inst_e;
wire dec_casa_inst_e;
wire dec_ldstub_inst_e;
wire dec_swap_inst_e;
wire dec_altspace_d;
wire dec_sign_ext_e;
wire [4:0] dec_sraddr_e;
wire dec_imm_asi_vld_d;
wire [7:0] dec_imm_asi_d;
wire [1:0] dec_lsu_tid0_d;
wire [1:0] dec_lsu_tid1_d;
wire dec_lsu_tg_d;
wire [4:0] dec_lsu_rd_e;
wire dec_ld_inst_d;
wire dec_lsu_sel0_d;
wire [1:0] dec_ierr_d;
wire [7:0] dec_block_store_stall;
wire [7:0] tlu_halted;
wire lsu_pku_pmen;
wire [7:0] tlu_retry_state;
wire [7:0] lsu_sync;
wire [7:0] lsu_complete;
wire [7:0] lsu_stb_alloc;
wire [7:0] lsu_stb_dealloc;
wire [7:0] lsu_block_store_kill;
wire [7:0] pku_quiesce;
wire lsu_exu_ld_b;
wire [4:0] lsu_exu_rd_m;
wire [2:0] lsu_exu_tid_m;
wire lsu_exu_ld_vld_w;
wire [47:13] lsu_exu_address_e;
wire lsu_sel_lsu_addr_e;
wire [47:0] exu_lsu_address_e;
wire [63:0] exu_lsu_store_data_e;
wire [7:0] exu_lsu_rs2_e;
wire lsu_tlu_pmen;
wire lsu_lddf_align_b;
wire lsu_stdf_align_b;
wire lsu_illegal_inst_b;
wire lsu_daccess_prot_b;
wire lsu_priv_action_b;
wire lsu_va_watchpoint_b;
wire lsu_pa_watchpoint_b;
wire lsu_align_b;
wire lsu_tlb_miss_b_;
wire lsu_dae_invalid_asi_b;
wire lsu_dae_nc_page_b;
wire lsu_dae_nfo_page_b;
wire lsu_dae_priv_viol_b;
wire lsu_dae_so_page;
wire lsu_priv_action_g;
wire [2:0] lsu_tid_g;
wire [7:0] lsu_trap_flush;
wire lsu_tlb_bypass_b;
wire lsu_tlb_real_b;
wire lsu_sync_inst_b;
wire [7:0] lsu_stb_empty;
wire lsu_tlu_twocycle_m;
wire lsu_dcmh_err_g;
wire lsu_dcvp_err_g;
wire lsu_dctp_err_g;
wire lsu_dcdp_err_g;
wire lsu_dcl2c_err_g;
wire lsu_dcl2u_err_g;
wire lsu_dcl2nd_err_g;
wire lsu_dcsoc_err_g;
wire [8:0] lsu_dcerr_sfar_g;
wire lsu_sbdlc_err_g;
wire lsu_sbdlu_err_g;
wire lsu_sbdpc_err_g;
wire lsu_sbdpu_err_g;
wire lsu_sbapp_err_g;
wire lsu_sbdiou_err_g;
wire [2:0] lsu_stberr_tid_g;
wire [2:0] lsu_stberr_index_g;
wire [1:0] lsu_stberr_priv_g;
wire lsu_stb_flush_g;
wire lsu_dttp_err_b;
wire lsu_dtdp_err_b;
wire lsu_dtmh_err_b;
wire lsu_perfmon_trap_b;
wire lsu_perfmon_trap_g;
wire lsu_ext_interrupt;
wire [1:0] lsu_ext_int_type;
wire [5:0] lsu_ext_int_vec;
wire [2:0] lsu_ext_int_tid;
wire [7:0] mmu_hw_tw_enable;
wire [7:0] mmu_write_itlb;
wire [7:0] mmu_reload_done;
wire [7:0] mmu_i_unauth_access;
wire [7:0] mmu_i_tsb_miss;
wire [7:0] mmu_d_tsb_miss;
wire [7:0] mmu_i_tte_outofrange;
wire [7:0] mmu_d_tte_outofrange;
wire [47:0] mmu_itte_tag_data;
wire [64:0] mmu_asi_data;
wire mmu_asi_read;
wire mmu_dae_req;
wire [2:0] mmu_dae_tid;
wire mmu_asi_cecc;
wire mmu_asi_uecc;
wire [2:0] mmu_asi_tid;
wire [10:0] mmu_asi_index;
wire mmu_asi_mra_not_sca;
wire [7:0] mmu_i_l2cerr;
wire [7:0] mmu_d_l2cerr;
wire [7:0] mmu_i_eccerr;
wire [7:0] mmu_d_eccerr;
wire [2:0] mmu_thr0_err_type;
wire [2:0] mmu_thr1_err_type;
wire [2:0] mmu_thr2_err_type;
wire [2:0] mmu_thr3_err_type;
wire [2:0] mmu_thr4_err_type;
wire [2:0] mmu_thr5_err_type;
wire [2:0] mmu_thr6_err_type;
wire [2:0] mmu_thr7_err_type;
wire [2:0] mmu_thr0_err_index;
wire [2:0] mmu_thr1_err_index;
wire [2:0] mmu_thr2_err_index;
wire [2:0] mmu_thr3_err_index;
wire [2:0] mmu_thr4_err_index;
wire [2:0] mmu_thr5_err_index;
wire [2:0] mmu_thr6_err_index;
wire [2:0] mmu_thr7_err_index;
wire spu_tlu_cwq_busy;
wire [10:0] spu_tlu_mamu_err_req;
wire [4:0] spu_tlu_ma_int_req;
wire [3:0] spu_tlu_cwq_int_req;
wire [5:0] spu_tlu_l2_error;
wire [7:0] pmu_tlu_trap_m;
wire [7:0] pmu_tlu_debug_event;
wire tlu_flush_lsu_b;
wire [7:0] tlu_release_tte;
wire tlu_rngf_cdbus_error;
wire [7:0] tlu_asi_0;
wire [7:0] tlu_asi_1;
wire tlu_asi_0_valid;
wire tlu_asi_1_valid;
wire [1:0] tlu_asi_0_tid;
wire [1:0] tlu_asi_1_tid;
wire [7:0] tlu_lsu_clear_ctl_reg_;
wire [7:0] tlu_load_i_tag_access_p;
wire [7:0] tlu_load_i_tag_access_n;
wire [7:0] tlu_load_d_tag_access;
wire [7:0] tlu_load_d_tag_access_r;
wire [47:13] tlu_pc_0_w;
wire [47:13] tlu_pc_1_w;
wire [7:0] tlu_iht_request;
wire [7:0] tlu_dht_request;
wire [7:0] tlu_mmu_tl_gt_0;
wire [1:0] tlu_flush_pmu_b;
wire [1:0] tlu_flush_pmu_w;
wire [7:0] tlu_pmu_trap_taken;
wire [1:0] tlu_pmu_trap_mask_e;
wire [7:0] tlu_lsu_hpstate_hpriv;
wire [7:0] tlu_lsu_pstate_priv;
wire [7:0] tlu_pmu_hpstate_hpriv;
wire [7:0] tlu_pmu_pstate_priv;
wire [7:0] tlu_pstate_cle;
wire tlu_cerer_hwtwmu;
wire tlu_cerer_hwtwl2;
wire tlu_cerer_dttp;
wire tlu_cerer_dttm;
wire tlu_cerer_dtdp;
wire tlu_cerer_dcl2c;
wire tlu_cerer_dcl2u;
wire tlu_cerer_dcl2nd;
wire tlu_cerer_sbdlc;
wire tlu_cerer_sbdlu;
wire tlu_cerer_mrau;
wire tlu_cerer_scac;
wire tlu_cerer_scau;
wire tlu_cerer_sbapp;
wire tlu_cerer_l2c_socc;
wire tlu_cerer_l2u_socu;
wire tlu_cerer_dcvp;
wire tlu_cerer_dctp;
wire tlu_cerer_dctm;
wire tlu_cerer_dcdp;
wire tlu_cerer_sbdpc;
wire tlu_cerer_sbdpu;
wire tlu_cerer_mamu;
wire tlu_cerer_mal2c;
wire tlu_cerer_mal2u;
wire tlu_cerer_mal2nd;
wire tlu_cerer_cwql2c;
wire tlu_cerer_cwql2u;
wire tlu_cerer_cwql2nd;
wire tlu_cerer_sbdiou;
wire [1:0] tlu_tag_access_tid_0_b;
wire tlu_i_tag_access_0_b;
wire tlu_d_tag_access_0_b;
wire [1:0] tlu_tag_access_tid_1_b;
wire tlu_i_tag_access_1_b;
wire tlu_d_tag_access_1_b;
wire tlu_mbi_tsa0_fail;
wire tlu_mbi_tsa1_fail;
wire tlu_mbi_tca_fail;
wire [1:0] lsu_tlu_dsfsr_ct_b;
wire mmu_dtlb_reload;
wire [12:0] lsu_context_b;
wire pmu_lsu_dcmiss_trap_m;
wire pmu_lsu_dtmiss_trap_m;
wire [7:0] pmu_lsu_l2dmiss_trap_m;
wire mbi_ptag_data;
wire lsu_mbi_dca_fail;
wire lsu_mbi_dta_fail;
wire lsu_mbi_dva_fail;
wire lsu_mbi_lru_fail;
wire lsu_mbi_dtb_fail;
wire lsu_mbi_stb_cam_fail;
wire lsu_mbi_stb_ram_fail;
wire lsu_mbi_cpq_fail;
wire mbi_dtb_cam_en_pre;
wire mbi_dtb_demap_en;
wire lsu_mbi_tlb_data_cmp;
wire lsu_mbi_tlb_cam_hit;
wire lsu_mbi_tlb_cam_mhit;
wire lsu_mbi_tlb_ctxt0_hit;
wire lsu_mbi_tlb_valid;
wire lsu_mbi_tlb_used;
wire mbi_scm_cam_en_pre;
wire lsu_mbi_scm_hit;
wire lsu_mbi_scm_mhit;
wire [2:0] lsu_mbi_scm_hit_ptr;
wire lsu_mbi_scm_praw;
wire lsu_spu_pmen;
wire lsu_mmu_pmen;
wire lsu_pmu_pmen;
wire lsu_misc_pmen;
wire spu_mbi_mam_fail_;
wire spu_mbi_mam_fail2_;
wire spu_mbi_arf_fail_;
wire spu_mbi_rrf_fail_;
wire [4:0] spu_pmu_cwq_busy;
wire [2:0] spu_pmu_cwq_tid;
wire mmu_mbi_mra0_fail;
wire mmu_mbi_mra1_fail;
wire mmu_mbi_scp0_fail;
wire mmu_mbi_scp1_fail;
wire mmu_pmu_l2ret;
wire mmu_pmu_l2miss;
wire mmu_pmu_dtlb;
wire [2:0] mmu_pmu_tid;
wire mb2_misc_pmen;

input        gclk;         	// PINDEF:BOT

// scan signals
input  [1:0] scan_in;       	//               arc=l2clk:30 cap=20
input 	     tcu_pce_ov;	// PINDEF:BOT	 arc=l2clk:30 cap=20
input 	     tcu_clk_stop;	// PINDEF:BOT    arc=l2clk:30 cap=20
input 	     tcu_aclk;		// PINDEF:BOT    
input 	     tcu_bclk;		// PINDEF:BOT    
input 	     tcu_dectest;	// PINDEF:BOT    
input 	     tcu_muxtest;	// PINDEF:BOT    
input 	     tcu_scan_en;	// PINDEF:BOT    
input        tcu_array_wr_inhibit;	// PINDEF:BOT    
input        tcu_se_scancollar_in;	// PINDEF:BOT    
input        tcu_se_scancollar_out;	// PINDEF:BOT    
input	     tcu_atpg_mode;
input        rst_wmr_protect;		// PINDEF:BOT

output [1:0] scan_out;	    	// PINDEF:BOT    arc=l2clk:100 drv=32x

// shadow scan signals
input		tcu_shscan_pce_ov;	// PINDEF:BOT
input		tcu_shscan_clk_stop;	// PINDEF:BOT
input		tcu_shscan_aclk;	// PINDEF:BOT
input		tcu_shscan_bclk;	// PINDEF:BOT
input		tcu_shscan_scan_in;	// PINDEF:BOT
input		tcu_shscan_scan_en;	// PINDEF:BOT
input	[2:0]	tcu_shscanid;		// PINDEF:BOT
output		spc_shscan_scan_out;	// PINDEF:BOT

// From RST
input		cluster_arst_l;		// PINDEF:BOT

// MBIST signals
input           tcu_spc_mbist_scan_in;	// PINDEF:BOT 
input           tcu_mbist_bisi_en;	// PINDEF:BOT 
input           tcu_spc_mbist_start;	// PINDEF:BOT 
input           tcu_mbist_user_mode;	// PINDEF:BOT 
output		spc_mbist_fail;		// PINDEF:BOT    
output          spc_mbist_done;		// PINDEF:BOT 
output          spc_tcu_mbist_scan_out;	// PINDEF:BOT 

input	[2:0]	const_cpuid;	// PINDEF:BOT    arc=l2clk:30 cap=20

// Core enable signals from CMP
input		tcu_ss_mode;		// PINDEF:BOT
input		tcu_do_mode;		// PINDEF:BOT
input		tcu_ss_request;		// PINDEF:BOT
input		ncu_cmp_tick_enable;	// PINDEF:BOT
output		spc_ss_complete;	// PINDEF:BOT

// RSTVADDR (POR address) control
input 		ncu_wmr_vec_mask;	// PINDEF:BOT

// Debug signals
output		spc_hardstop_request;	// PINDEF:BOT
output		spc_softstop_request;	// PINDEF:BOT
output		spc_trigger_pulse;	// PINDEF:BOT

// partial core signals
input           ncu_spc_pm;      	// PINDEF:BOT arc=l2clk:50 cap=20
input           ncu_spc_ba01;   	// PINDEF:BOT arc=l2clk:50 cap=20
input           ncu_spc_ba23;   	// PINDEF:BOT arc=l2clk:50 cap=20
input           ncu_spc_ba45;   	// PINDEF:BOT arc=l2clk:50 cap=20
input           ncu_spc_ba67;   	// PINDEF:BOT arc=l2clk:50 cap=20

// EFUSE interface
input		efu_spc_fuse_data;	// PINDEF:BOT
input		efu_spc_fuse_ixfer_en;	// PINDEF:BOT
input		efu_spc_fuse_dxfer_en;	// PINDEF:BOT
input		efu_spc_fuse_iclr;	// PINDEF:BOT
input		efu_spc_fuse_dclr;	// PINDEF:BOT
output		spc_efu_fuse_ddata;	// PINDEF:BOT
output		spc_efu_fuse_idata;	// PINDEF:BOT
output		spc_efu_fuse_ixfer_en;	// PINDEF:BOT
output		spc_efu_fuse_dxfer_en;	// PINDEF:BOT

// VNW inputs
input		vnw_ary0;
input		vnw_ary1;

// Logic BIST signals
input           tcu_spc_lbist_start;    // PINDEF:BOT 
input           tcu_spc_lbist_scan_in;  // PINDEF:BOT 
input           tcu_spc_lbist_pgm;      // PINDEF:BOT 
input           tcu_spc_test_mode;      // PINDEF:BOT 

output          spc_tcu_lbist_done;     // PINDEF:BOT
output          spc_tcu_lbist_scan_out; // PINDEF:BOT

// DMO interface
input	[35:0]	dmo_din;		// PINDEF: RIGHT
input		dmo_coresel;
input		dmo_icmuxctl;
input		dmo_dcmuxctl;

output	[35:0]	dmo_dout;

// l2 index hashing

input           ncu_spc_l2_idx_hash_en; // PINDEF:BOT arc=l2clk:50 cap=20

// gasket <-> CPX interface
// ---------------------------       
// Incoming CPX packet
input   [145:0] cpx_spc_data_cx;	// PINDEF:BOT arc=l2clk:100 cap=20
// 0in known_driven -var cpx_spc_data_cx[144:0] -active cpx_spc_data_cx[145]

// gasket <-> PCX interface
input   [8:0]   pcx_spc_grant_px;	// PINDEF:BOT arc=l2clk:200 cap=20

// PCX request
output  [8:0]   spc_pcx_req_pq; 	// PINDEF:BOT arc=l2clk:200 drv=32x
output  [8:0]   spc_pcx_atm_pq;		// PINDEF:BOT arc=l2clk:200 drv=32x

// PCX packet data
output  [129:0] spc_pcx_data_pa;   	// PINDEF:BOT arc=l2clk:100 drv=32x    

input [7:0] tcu_core_running;   	// PINDEF:BOT arc=l2clk:30 cap=20
output [7:0] spc_core_running_status;   // PINDEF:BOT arc=l2clk:100 drv=32x

input [2:0] power_throttle; // power throttle, [2:0] is encoded number of stalls in 8 cycle window
			    // 000 - no stalls, 001 - 1 stall, ... 111 - 7 stalls

output [1:0] spc_dbg_instr_cmt_grp0;  // Pipe status for debug
output [1:0] spc_dbg_instr_cmt_grp1;  // Pipe status for debug


// Needs to be spc input so that it can be easily changed for metal ECs
input [3:0]  hver_mask_minor_rev;

input        ccu_slow_cmp_sync_en;
input        ccu_cmp_slow_sync_en;


//spc_rep0_dp rep0;	// global repeaters

spc_rep1_dp rep1(
  .exu_address0_e(exu_address0_e[47:0]),
  .exu_address1_e(exu_address1_e[47:0]),
  .exu_address0_e_rep0(exu_address0_e_rep0[47:0]),
  .exu_address1_e_rep0(exu_address1_e_rep0[47:0]),
  .exu_address0_e_rep01(exu_address0_e_rep01[47:0]),
  .exu_address1_e_rep01(exu_address1_e_rep01[47:0]),
  .fgu_exu_result_fx5(fgu_exu_result_fx5[63:0]),
  .fgu_exu_result_fx5_rep0(fgu_exu_result_fx5_rep0[63:0]),
  .fgu_exu_result_fx5_rep1(fgu_exu_result_fx5_rep1[63:0]),
  .lsu_exu_ld_data_b(lsu_exu_ld_data_b[63:0]),
  .lsu_exu_ld_data_b_rep00(lsu_exu_ld_data_b_rep00[63:0]),
  .lsu_exu_ld_data_b_rep01(lsu_exu_ld_data_b_rep01[63:0]),
  .fgu_cecc_fx2(fgu_cecc_fx2),
  .fgu_uecc_fx2(fgu_uecc_fx2),
  .fgu_cecc_fx2_rep1(fgu_cecc_fx2_rep1),
  .fgu_uecc_fx2_rep1(fgu_uecc_fx2_rep1),
  .pce_ov(pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lb_scan_en(lb_scan_en),
  .scan_in(scan_in[1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_scan_en(tcu_scan_en),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .rst_wmr_protect(rst_wmr_protect),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .hver_mask_minor_rev(hver_mask_minor_rev[3:0]),
  .scan_out(scan_out[1:0]),
  .tcu_shscan_pce_ov(tcu_shscan_pce_ov),
  .tcu_shscan_aclk(tcu_shscan_aclk),
  .tcu_shscan_bclk(tcu_shscan_bclk),
  .tcu_shscan_scan_in(tcu_shscan_scan_in),
  .tcu_shscan_scan_en(tcu_shscan_scan_en),
  .spc_shscan_scan_out(spc_shscan_scan_out),
  .cluster_arst_l(cluster_arst_l),
  .tcu_spc_mbist_scan_in(tcu_spc_mbist_scan_in),
  .tcu_spc_mbist_start_ff(tcu_spc_mbist_start_ff),
  .spc_mbist_fail(spc_mbist_fail),
  .spc_mbist_done(spc_mbist_done),
  .spc_tcu_mbist_scan_out(spc_tcu_mbist_scan_out),
  .tcu_spc_lbist_start(tcu_spc_lbist_start),
  .tcu_spc_lbist_scan_in(tcu_spc_lbist_scan_in),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .tcu_spc_test_mode(tcu_spc_test_mode),
  .spc_tcu_lbist_done(spc_tcu_lbist_done),
  .spc_tcu_lbist_scan_out(spc_tcu_lbist_scan_out),
  .scan_in_buf(scan_in_buf[1:0]),
  .tcu_pce_ov_buf(tcu_pce_ov_buf),
  .tcu_aclk_buf(tcu_aclk_buf),
  .tcu_bclk_buf(tcu_bclk_buf),
  .tcu_dectest_buf(tcu_dectest_buf),
  .tcu_muxtest_buf(tcu_muxtest_buf),
  .tcu_scan_en_buf(tcu_scan_en_buf),
  .tcu_array_wr_inhibit_buf(tcu_array_wr_inhibit_buf),
  .tcu_se_scancollar_in_buf(tcu_se_scancollar_in_buf),
  .tcu_se_scancollar_out_buf(tcu_se_scancollar_out_buf),
  .rst_wmr_protect_buf(rst_wmr_protect_buf),
  .dmo_dcmuxctl_buf(dmo_dcmuxctl_buf),
  .hver_mask_minor_rev_buf(hver_mask_minor_rev_buf[3:0]),
  .scan_out_buf(scan_out_buf[1:0]),
  .tcu_shscan_pce_ov_buf(tcu_shscan_pce_ov_buf),
  .tcu_shscan_aclk_buf(tcu_shscan_aclk_buf),
  .tcu_shscan_bclk_buf(tcu_shscan_bclk_buf),
  .tcu_shscan_scan_in_buf(tcu_shscan_scan_in_buf),
  .tcu_shscan_scan_en_buf(tcu_shscan_scan_en_buf),
  .spc_shscan_scan_out_buf(spc_shscan_scan_out_buf),
  .cluster_arst_l_buf(cluster_arst_l_buf),
  .tcu_spc_mbist_scan_in_buf(tcu_spc_mbist_scan_in_buf),
  .tcu_spc_mbist_start_buf0(tcu_spc_mbist_start_buf0),
  .spc_mbist_fail_ff(spc_mbist_fail_ff),
  .spc_mbist_done_ff(spc_mbist_done_ff),
  .spc_tcu_mbist_scan_out_buf(spc_tcu_mbist_scan_out_buf),
  .tcu_spc_lbist_start_buf(tcu_spc_lbist_start_buf),
  .tcu_spc_lbist_scan_in_buf(tcu_spc_lbist_scan_in_buf),
  .tcu_spc_lbist_pgm_buf(tcu_spc_lbist_pgm_buf),
  .tcu_spc_test_mode_buf(tcu_spc_test_mode_buf),
  .lb_lbist_done(lb_lbist_done),
  .spc_tcu_lbist_scan_out_buf(spc_tcu_lbist_scan_out_buf),
  .ftu_instr_0_c(ftu_instr_0_c[32:0]),
  .ftu_instr_1_c(ftu_instr_1_c[32:0]),
  .ftu_instr_2_c(ftu_instr_2_c[32:0]),
  .ftu_instr_3_c(ftu_instr_3_c[32:0]),
  .ftu_instr_exceptions_c(ftu_instr_exceptions_c[4:0]),
  .ftu_instr_0_c_rep0(ftu_instr_0_c_rep0[32:0]),
  .ftu_instr_0_c_rep1(ftu_instr_0_c_rep1[32:0]),
  .ftu_instr_0_c_rep2(ftu_instr_0_c_rep2[32:0]),
  .ftu_instr_0_c_rep3(ftu_instr_0_c_rep3[32:0]),
  .ftu_instr_1_c_rep0(ftu_instr_1_c_rep0[32:0]),
  .ftu_instr_1_c_rep1(ftu_instr_1_c_rep1[32:0]),
  .ftu_instr_1_c_rep2(ftu_instr_1_c_rep2[32:0]),
  .ftu_instr_1_c_rep3(ftu_instr_1_c_rep3[32:0]),
  .ftu_instr_2_c_rep0(ftu_instr_2_c_rep0[32:0]),
  .ftu_instr_2_c_rep1(ftu_instr_2_c_rep1[32:0]),
  .ftu_instr_2_c_rep2(ftu_instr_2_c_rep2[32:0]),
  .ftu_instr_2_c_rep3(ftu_instr_2_c_rep3[32:0]),
  .ftu_instr_3_c_rep0(ftu_instr_3_c_rep0[32:0]),
  .ftu_instr_3_c_rep1(ftu_instr_3_c_rep1[32:0]),
  .ftu_instr_3_c_rep2(ftu_instr_3_c_rep2[32:0]),
  .ftu_instr_3_c_rep3(ftu_instr_3_c_rep3[32:0]),
  .ftu_instr_0_exceptions_c_rep0(ftu_instr_0_exceptions_c_rep0[4:0]),
  .ftu_instr_0_exceptions_c_rep1(ftu_instr_0_exceptions_c_rep1[4:0]),
  .ftu_instr_0_exceptions_c_rep2(ftu_instr_0_exceptions_c_rep2[4:0]),
  .ftu_instr_0_exceptions_c_rep3(ftu_instr_0_exceptions_c_rep3[4:0]),
  .ftu_instr_1_exceptions_c_rep0(ftu_instr_1_exceptions_c_rep0[4:0]),
  .ftu_instr_1_exceptions_c_rep1(ftu_instr_1_exceptions_c_rep1[4:0]),
  .ftu_instr_1_exceptions_c_rep2(ftu_instr_1_exceptions_c_rep2[4:0]),
  .ftu_instr_1_exceptions_c_rep3(ftu_instr_1_exceptions_c_rep3[4:0]),
  .ftu_instr_2_exceptions_c_rep0(ftu_instr_2_exceptions_c_rep0[4:0]),
  .ftu_instr_2_exceptions_c_rep1(ftu_instr_2_exceptions_c_rep1[4:0]),
  .ftu_instr_2_exceptions_c_rep2(ftu_instr_2_exceptions_c_rep2[4:0]),
  .ftu_instr_2_exceptions_c_rep3(ftu_instr_2_exceptions_c_rep3[4:0]),
  .ftu_instr_3_exceptions_c_rep0(ftu_instr_3_exceptions_c_rep0[4:0]),
  .ftu_instr_3_exceptions_c_rep1(ftu_instr_3_exceptions_c_rep1[4:0]),
  .ftu_instr_3_exceptions_c_rep2(ftu_instr_3_exceptions_c_rep2[4:0]),
  .ftu_instr_3_exceptions_c_rep3(ftu_instr_3_exceptions_c_rep3[4:0]),
  .pce_ov_tl(pce_ov_tl),
  .spc_aclk_tl(spc_aclk_tl),
  .spc_bclk_tl(spc_bclk_tl),
  .spc_aclk_wmr_tl(spc_aclk_wmr_tl),
  .lb_scan_en_tl(lb_scan_en_tl),
  .pce_ov_tr(pce_ov_tr),
  .spc_aclk_tr(spc_aclk_tr),
  .spc_bclk_tr(spc_bclk_tr),
  .spc_aclk_wmr_tr(spc_aclk_wmr_tr),
  .lb_scan_en_tr(lb_scan_en_tr),
  .pce_ov_bl(pce_ov_bl),
  .spc_aclk_bl(spc_aclk_bl),
  .spc_bclk_bl(spc_bclk_bl),
  .spc_aclk_wmr_bl(spc_aclk_wmr_bl),
  .lb_scan_en_bl(lb_scan_en_bl),
  .pce_ov_br(pce_ov_br),
  .spc_aclk_br(spc_aclk_br),
  .spc_bclk_br(spc_bclk_br),
  .spc_aclk_wmr_br(spc_aclk_wmr_br),
  .lb_scan_en_br(lb_scan_en_br),
  .dec_spu_grant_d(dec_spu_grant_d),
  .dec_spu_grant_d_rep0(dec_spu_grant_d_rep0));	// global repeaters

spc_msf0_dp msf0 (	// I/O MSFFs for CMP clock domain signals
	// Put in front of lsu
	.scan_in(lsu_scanin),
	.scan_out(msf0_scanout),
	.l2clk(l2clk),
        .tcu_se_scancollar_out(lb_se_sc_out),
	.tcu_pce_ov(pce_ov_br),
        .tcu_scan_en(lb_scan_en_br),
	.spc_aclk(spc_aclk_br),
	.spc_bclk(spc_bclk_br),
  .tcu_atpg_mode(tcu_atpg_mode),
  .lb_lbist_running(lb_lbist_running),
  .slow_cmp_sync_en(slow_cmp_sync_en),
  .cmp_slow_sync_en(cmp_slow_sync_en),
  .ncu_cmp_tick_enable(ncu_cmp_tick_enable),
  .ncu_wmr_vec_mask(ncu_wmr_vec_mask),
  .tcu_ss_mode(tcu_ss_mode),
  .tcu_do_mode(tcu_do_mode),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .tcu_mbist_bisi_en(tcu_mbist_bisi_en),
  .tcu_ss_request(tcu_ss_request),
  .tcu_core_running(tcu_core_running[7:0]),
  .tcu_shscan_clk_stop(tcu_shscan_clk_stop),
  .tcu_shscanid(tcu_shscanid[2:0]),
  .efu_spc_fuse_data(efu_spc_fuse_data),
  .efu_spc_fuse_ixfer_en(efu_spc_fuse_ixfer_en),
  .efu_spc_fuse_dxfer_en(efu_spc_fuse_dxfer_en),
  .efu_spc_fuse_iclr(efu_spc_fuse_iclr),
  .efu_spc_fuse_dclr(efu_spc_fuse_dclr),
  .spc_efu_fuse_ddata(spc_efu_fuse_ddata),
  .spc_efu_fuse_idata(spc_efu_fuse_idata),
  .spc_efu_fuse_ixfer_en(spc_efu_fuse_ixfer_en),
  .spc_efu_fuse_dxfer_en(spc_efu_fuse_dxfer_en),
  .efu_spc_fuse_data_buf(efu_spc_fuse_data_buf),
  .efu_spc_fuse_ixfer_en_buf(efu_spc_fuse_ixfer_en_buf),
  .efu_spc_fuse_dxfer_en_buf(efu_spc_fuse_dxfer_en_buf),
  .efu_spc_fuse_iclr_buf(efu_spc_fuse_iclr_buf),
  .efu_spc_fuse_dclr_buf(efu_spc_fuse_dclr_buf),
  .spc_efu_fuse_ddata_buf(spc_efu_fuse_ddata_buf),
  .spc_efu_fuse_idata_buf(spc_efu_fuse_idata_buf),
  .spc_efu_fuse_ixfer_en_buf(spc_efu_fuse_ixfer_en_buf),
  .spc_efu_fuse_dxfer_en_buf(spc_efu_fuse_dxfer_en_buf),
  .tlu_core_running_status(tlu_core_running_status[7:0]),
  .tlu_ss_complete(tlu_ss_complete),
  .tlu_hardstop_request(tlu_hardstop_request),
  .tlu_softstop_request(tlu_softstop_request),
  .tlu_trigger_pulse(tlu_trigger_pulse),
  .tlu_dbg_instr_cmt_grp0(tlu_dbg_instr_cmt_grp0[1:0]),
  .tlu_dbg_instr_cmt_grp1(tlu_dbg_instr_cmt_grp1[1:0]),
  .msf0_cmp_tick_enable(msf0_cmp_tick_enable),
  .msf0_wmr_vec_mask(msf0_wmr_vec_mask),
  .msf0_ss_mode(msf0_ss_mode),
  .msf0_do_mode(msf0_do_mode),
  .msf0_ss_request(msf0_ss_request),
  .msf0_core_running(msf0_core_running[7:0]),
  .msf0_shscan_clk_stop(msf0_shscan_clk_stop),
  .msf0_shscanid(msf0_shscanid[2:0]),
  .msf0_mbist_user_mode_ff(msf0_mbist_user_mode_ff),
  .msf0_mbist_bisi_en_ff(msf0_mbist_bisi_en_ff),
  .msf0_atpg_mode_buf(msf0_atpg_mode_buf),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .spc_ss_complete(spc_ss_complete),
  .spc_hardstop_request(spc_hardstop_request),
  .spc_softstop_request(spc_softstop_request),
  .spc_trigger_pulse(spc_trigger_pulse),
  .spc_dbg_instr_cmt_grp0(spc_dbg_instr_cmt_grp0[1:0]),
  .spc_dbg_instr_cmt_grp1(spc_dbg_instr_cmt_grp1[1:0]),
  .power_throttle(power_throttle[2:0]),
  .power_throttle_buf(power_throttle_buf[2:0])
);

spc_msf1_dp msf1 (	// I/O MSFFs for mbist start/done/fail and lbist start/done signals
	// Put in front of gkt
	.scan_in(gkt_scanin),
	.scan_out(msf1_scanout),
	.l2clk(l2clk),
        .tcu_se_scancollar_out(lb_se_sc_out),
	.tcu_pce_ov(pce_ov_br),
	.spc_aclk(spc_aclk_br),
	.spc_bclk(spc_bclk_br),
  .tcu_spc_mbist_start(tcu_spc_mbist_start),
  .spc_mbist_fail_buf(spc_mbist_fail_buf),
  .spc_mbist_done_buf(spc_mbist_done_buf),
  .tcu_spc_mbist_start_ff(tcu_spc_mbist_start_ff),
  .spc_mbist_fail_ff(spc_mbist_fail_ff),
  .spc_mbist_done_ff(spc_mbist_done_ff)
);

// LBIST controller
spc_lb_ctl lb (
        .scan_in(tcu_spc_lbist_scan_in_buf),
        .scan_out(spc_tcu_lbist_scan_out_buf),
        .l2clk(gclk),	// not stopped during LBIST...comes from cluster header
        .tcu_pce_ov(pce_ov_tr),
	.aclk(tcu_aclk_buf),
        .bclk(tcu_bclk_buf),
        .scan_en(tcu_scan_en_buf),
        .se_scancollar_in(tcu_se_scancollar_in_buf),
        .se_scancollar_out(tcu_se_scancollar_out_buf),
        .clk_stop(tcu_clk_stop),
        .array_wr_inhibit(tcu_array_wr_inhibit_buf),
        .test_mode(tcu_spc_test_mode_buf),
        .io_si(scan_in_buf[1:0]),							// From pins: Core scan chain for ATPG 
        .io_so(scan_out_buf[1:0]),							// To pins:   Core scan chain for ATPG
        .lbist_start(tcu_spc_lbist_start_buf),
        .lbist_pgm(tcu_spc_lbist_pgm_buf),
        .lbist_done(lb_lbist_done),							// Indicates Logic BIST is done
        .lbist_run(lb_lbist_running),						// Indicates Logic BIST is running
        .channel_si({wmr_protect_scanin, dmo_scanin     , clk_spc_scanin , mmu_scanin,
                     ifu_ibu_scanin    , ifu_ftu_scanin , ifu_cmu_scanin , dec_scanin,
                     pku_scanin        , exu0_scanin    , exu1_scanin    , tlu_scanin,
                     lsu_scanin        , spu_scanin     , fgu_scanin     , gkt_scanin}),
        .channel_so({mmu_wmr_scanout   , dmo_scanout    , clk_spc_scanout, pmu_scanout,
                     ifu_ibu_scanout   , ifu_ftu_scanout, ifu_cmu_scanout, dec_scanout,
                     pku_scanout       , exu0_scanout   , exu1_scanout   , tlu_scanout,
                     lsu_scanout       , spu_scanout    , fgu_scanout    , gkt_scanout}),
        .mb_channel_si(lb_mb_channel_si),
        .mb_channel_so(mb2_scanout),
        .mbist_si(tcu_spc_mbist_scan_in_buf),						// From TCU:  To core's mbist scan chain	
        .mbist_so(spc_tcu_mbist_scan_out_buf),						// To TCU:    From core's mbist scan chain
        .core_aclk(lb_aclk),
        .core_bclk(lb_bclk),
        .core_scan_en(lb_scan_en),
        .core_se_sc_in(lb_se_sc_in),
        .core_se_sc_out(lb_se_sc_out),
        .core_clk_stop(lb_clk_stop),
        .core_awi(lb_array_wr_inhibit),
        .core_scan_en_wmr(lb_scan_en_wmr),
  .wmr_protect(wmr_protect),
  .slow_cmp_sync_en(slow_cmp_sync_en),
  .core_isolate(core_isolate)
);

clkgen_spc_cmp clk_spc (
	.aclk(spc_aclk),
	.aclk_wmr(spc_aclk_wmr),
        .array_wr_inhibit(clk_array_wr_inhibit),
	.bclk(spc_bclk),
	.ccu_cmp_slow_sync_en(ccu_cmp_slow_sync_en),
	.ccu_div_ph(1'b1),
	.ccu_serdes_dtm(1'b0),
	.ccu_slow_cmp_sync_en(ccu_slow_cmp_sync_en),
	.clk_ext(1'b0),
	.cluster_arst_l(cluster_arst_l_buf),
	.cluster_div_en(1'b0),
	.cmp_slow_sync_en(cmp_slow_sync_en),
	.gclk(gclk),
	.l2clk(l2clk),
	.pce_ov(pce_ov),
	.por_(por_unused),
	.rst_por_(1'b1),
	.rst_wmr_(1'b1),
	.rst_wmr_protect(rst_wmr_protect_buf),
	.scan_en(lb_scan_en),
	.scan_in(clk_spc_scanin),
	.scan_out(clk_spc_scanout),
	.slow_cmp_sync_en(slow_cmp_sync_en),
	.tcu_aclk(lb_aclk),
	.tcu_bclk(lb_bclk),
	.tcu_clk_stop(lb_clk_stop),
	.tcu_div_bypass(1'b0),
	.tcu_pce_ov(tcu_pce_ov_buf),
        .tcu_atpg_mode(msf0_atpg_mode_buf),
        .tcu_wr_inhibit(lb_array_wr_inhibit),
	.wmr_(wmr_unused),
  .wmr_protect(wmr_protect) 		
);

dmo_dp dmo (
	.scan_in(dmo_scanin),
        .scan_out(dmo_scanout),
        .tcu_pce_ov(pce_ov),
        .tcu_se_scancollar_out(lb_se_sc_out),
        .lsu_dc_data({dcc_dmo_parity[3:0], lsu_exu_ld_data_b[63:32]}),
  .l2clk(l2clk),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ic_dmo_rd_data(ic_dmo_rd_data[32:0]),
  .dmo_din(dmo_din[35:0]),
  .dmo_coresel(dmo_coresel),
  .dmo_icmuxctl(dmo_icmuxctl),
  .dmo_dout(dmo_dout[35:0]),
  .dmo_coresel_buff(dmo_coresel_buff)
);

gkt gkt (
        .scan_in(msf1_scanout),
        .scan_out(gkt_scanout),
        .l2clk(l2clk),
        .lbist_run(lb_lbist_running),
        .tcu_se_scancollar_out(lb_se_sc_out),
        .slow_cmp_sync_en(slow_cmp_sync_en),
        .tcu_scan_en(lb_scan_en_br),
        .tcu_pce_ov(pce_ov_br),
	.spc_aclk(spc_aclk_br),
	.spc_bclk(spc_bclk_br),
        .mmu_l15_addr(mmu_l15_addr[39:4]),
        .mmu_l15_cpkt(mmu_l15_cpkt[4:0]),
	.spu_l15_addr(spu_l15_addr[38:3]),
	.spu_l15_cpkt(spu_l15_cpkt[12:0]),
	.spu_l15_data(spu_l15_data[63:0]),
  .core_isolate(core_isolate),
  .const_cpuid(const_cpuid[2:0]),
  .lsu_gkt_pmen(lsu_gkt_pmen),
  .ifu_l15_valid(ifu_l15_valid),
  .mmu_l15_valid(mmu_l15_valid),
  .lsu_l15_valid(lsu_l15_valid),
  .spu_l15_valid(spu_l15_valid),
  .lsu_l15_lock(lsu_l15_lock),
  .ifu_l15_addr(ifu_l15_addr[39:0]),
  .lsu_l15_addr(lsu_l15_addr[39:0]),
  .ifu_l15_cpkt(ifu_l15_cpkt[7:0]),
  .lsu_l15_cpkt(lsu_l15_cpkt[25:0]),
  .lsu_l15_data(lsu_l15_data[63:0]),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .ncu_spc_l2_idx_hash_en(ncu_spc_l2_idx_hash_en),
  .cpx_spc_data_cx(cpx_spc_data_cx[145:0]),
  .pcx_spc_grant_px(pcx_spc_grant_px[8:0]),
  .l15_spc_cpkt(l15_spc_cpkt[17:0]),
  .l15_spc_data1(l15_spc_data1[127:0]),
  .cpx_spc_data_cx_rep0(cpx_spc_data_cx_rep0[145:0]),
  .l15_mmu_valid(l15_mmu_valid),
  .l15_spu_valid(l15_spu_valid),
  .l15_ifu_grant(l15_ifu_grant),
  .l15_mmu_grant(l15_mmu_grant),
  .l15_lsu_grant(l15_lsu_grant),
  .l15_spu_grant(l15_spu_grant),
  .gkt_ifu_legal(gkt_ifu_legal[3:0]),
  .gkt_ifu_flip_parity(gkt_ifu_flip_parity[3:0]),
  .l15_pmu_xbar_optype(l15_pmu_xbar_optype[6:0]),
  .spc_pcx_req_pq(spc_pcx_req_pq[8:0]),
  .spc_pcx_atm_pq(spc_pcx_atm_pq[8:0]),
  .spc_pcx_data_pa(spc_pcx_data_pa[129:0])
        );

// To prevent collisions between ASI reads and block stores at the FRF, the
// minimum local ring latency to the FGU must be >= 8 cycles.
// 0in assert_follower -leader ((lsu_rngl_cdbus[64:63] == 2'b11) & (lsu_rngl_cdbus[55:48] == 8'h4E)) -follower ((fgu.in_rngl_cdbus[64:63] == 2'b11) & (fgu.in_rngl_cdbus[55:48] == 8'h4E)) -max 30 -min 8


fgu fgu (
	.scan_in(fgu_scanin),
	.scan_out(fgu_scanout),
        .wmr_scan_in(exu1_wmr_scanout),
        .wmr_scan_out(fgu_wmr_scanout),
	.l2clk(l2clk),
	.spc_aclk(spc_aclk_tr),
	.spc_aclk_wmr(spc_aclk_wmr_tr),
	.spc_bclk(spc_bclk_tr),
        .tcu_pce_ov(pce_ov_tr),
        .tcu_scan_en(lb_scan_en_tr),
        .tcu_se_scancollar_in(lb_se_sc_in),
        .tcu_se_scancollar_out(lb_se_sc_out),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
	.dec_fgu_fmov_vld_m	(exu_fgu_fmov_vld_m),
	.dec_spu_grant_d        (dec_spu_grant_fgu_d),
	.spc_core_running_status(tlu_core_running_status[7:0]),
	.in_rngl_cdbus		(pmu_rngl_cdbus[64:0]),
	.fgu_rngl_cdbus		(fgu_rngl_cdbus[64:0]),
	.lsu_fgu_fld_data_b	(lsu_fgu_fld_data_b[63:0]),
	.exu_fgu_rs1_e		(exu_fgu_rs1_e[63:0]),
	.exu_fgu_rs2_e		(exu_fgu_rs2_e[63:0]),
	.spu_fgu_rs1_e		(spu_fgu_rs1_e[63:0]),
	.spu_fgu_rs2_e		(spu_fgu_rs2_e[63:0]),
	.mbi_addr		(mb2_addr[7:0]),
	.mbi_run		(mb2_run),
	.mbi_wdata		(mb2_write_data[7:0]),
	.mbi_frf_read_en	(mb2_frf_read_en),
	.mbi_frf_write_en	(mb2_frf_write_en),
  .dec_frf_r1_addr_d(dec_frf_r1_addr_d[4:0]),
  .dec_frf_r2_addr_d(dec_frf_r2_addr_d[4:0]),
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
  .dec_exu_src_vld_d(dec_exu_src_vld_d),
  .dec_irf_w_addr_d(dec_irf_w_addr_d[4:0]),
  .dec_frf_store_d(dec_frf_store_d),
  .dec_fsr_store_d(dec_fsr_store_d),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_fgu_op3_d(dec_fgu_op3_d[5:0]),
  .dec_fgu_opf_d(dec_fgu_opf_d[7:0]),
  .dec_fgu_decode_d(dec_fgu_decode_d),
  .dec_fgu_valid_e(dec_fgu_valid_e),
  .dec_fgu_tid_d(dec_fgu_tid_d[2:0]),
  .dec_flush_f1(dec_flush_f1),
  .dec_flush_f2(dec_flush_f2),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0]),
  .fgu_cmp_fcc_tid_fx2(fgu_cmp_fcc_tid_fx2[2:0]),
  .fgu_fld_fcc_fx3(fgu_fld_fcc_fx3[7:0]),
  .fgu_fld_fcc_vld_fx3(fgu_fld_fcc_vld_fx3[1:0]),
  .fgu_fprs_fef(fgu_fprs_fef[7:0]),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .fgu_idiv_stall(fgu_idiv_stall[1:0]),
  .fgu_divide_completion(fgu_divide_completion[7:0]),
  .tlu_flush_fgu_b(tlu_flush_fgu_b),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_cerer_frf(tlu_cerer_frf),
  .fgu_predict_fx2(fgu_predict_fx2),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .fgu_cecc_fx2(fgu_cecc_fx2),
  .fgu_uecc_fx2(fgu_uecc_fx2),
  .fgu_ecc_addr_fx2(fgu_ecc_addr_fx2[5:0]),
  .fgu_ecc_check_fx2(fgu_ecc_check_fx2[13:0]),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .lsu_fgu_fld_addr_b(lsu_fgu_fld_addr_b[4:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .lsu_fgu_fld_b(lsu_fgu_fld_b),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .lsu_fgu_fld_32b_b(lsu_fgu_fld_32b_b),
  .lsu_fgu_fld_odd32b_b(lsu_fgu_fld_odd32b_b),
  .lsu_fgu_fsr_load_b(lsu_fgu_fsr_load_b),
  .lsu_fgu_exception_w(lsu_fgu_exception_w),
  .lsu_block_store_m(lsu_block_store_m),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .lsu_fgu_pmen(lsu_fgu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .fgu_lsu_fst_data_fx1(fgu_lsu_fst_data_fx1[63:0]),
  .fgu_fst_ecc_error_fx2(fgu_fst_ecc_error_fx2),
  .exu_fgu_gsr_m(exu_fgu_gsr_m[31:0]),
  .exu_fgu_gsr_vld_m(exu_fgu_gsr_vld_m[1:0]),
  .exu_fgu_flush_m(exu_fgu_flush_m),
  .fgu_exu_icc_fx5(fgu_exu_icc_fx5[3:0]),
  .fgu_exu_xcc_fx5(fgu_exu_xcc_fx5[1:0]),
  .fgu_exu_cc_vld_fx5(fgu_exu_cc_vld_fx5),
  .fgu_exu_w_vld_fx5(fgu_exu_w_vld_fx5[1:0]),
  .fgu_result_tid_fx5(fgu_result_tid_fx5[1:0]),
  .fgu_irf_w_addr_fx5(fgu_irf_w_addr_fx5[4:0]),
  .fgu_exu_result_fx5(fgu_exu_result_fx5[63:0]),
  .spu_fgu_fpy_ctl_d(spu_fgu_fpy_ctl_d[6:0]),
  .fgu_accum_b0_fx5(fgu_accum_b0_fx5),
  .fgu_mul_result_fx5(fgu_mul_result_fx5[63:0]),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .fgu_mbi_frf_fail(fgu_mbi_frf_fail)
);



ifu_ibu ifu_ibu (
	.scan_in(ifu_ibu_scanin),
	.scan_out(ifu_ibu_scanout),
        .tcu_pce_ov(pce_ov_bl),
        .tcu_scan_en(lb_scan_en_bl),
	.spc_aclk(spc_aclk_bl),
	.spc_bclk(spc_bclk_bl),
	.l15_ifu_valid(lsu_cpx_valid),
	.l2clk(l2clk),
  .pku_flush_buffer0(pku_flush_buffer0[7:0]),
  .pku_flush_upper_buffer(pku_flush_upper_buffer[7:0]),
  .ftu_fetch_thr_c(ftu_fetch_thr_c[7:0]),
  .pku_pick_p(pku_pick_p[7:0]),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .ftu_ibu_redirect_bf(ftu_ibu_redirect_bf[7:0]),
  .ftu_ic_no_err_c(ftu_ic_no_err_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first),
  .ftu_instr_valid_c(ftu_instr_valid_c[3:0]),
  .ftu_instr_0_c_rep0(ftu_instr_0_c_rep0[32:0]),
  .ftu_instr_0_c_rep1(ftu_instr_0_c_rep1[32:0]),
  .ftu_instr_0_c_rep2(ftu_instr_0_c_rep2[32:0]),
  .ftu_instr_0_c_rep3(ftu_instr_0_c_rep3[32:0]),
  .ftu_instr_1_c_rep0(ftu_instr_1_c_rep0[32:0]),
  .ftu_instr_1_c_rep1(ftu_instr_1_c_rep1[32:0]),
  .ftu_instr_1_c_rep2(ftu_instr_1_c_rep2[32:0]),
  .ftu_instr_1_c_rep3(ftu_instr_1_c_rep3[32:0]),
  .ftu_instr_2_c_rep0(ftu_instr_2_c_rep0[32:0]),
  .ftu_instr_2_c_rep1(ftu_instr_2_c_rep1[32:0]),
  .ftu_instr_2_c_rep2(ftu_instr_2_c_rep2[32:0]),
  .ftu_instr_2_c_rep3(ftu_instr_2_c_rep3[32:0]),
  .ftu_instr_3_c_rep0(ftu_instr_3_c_rep0[32:0]),
  .ftu_instr_3_c_rep1(ftu_instr_3_c_rep1[32:0]),
  .ftu_instr_3_c_rep2(ftu_instr_3_c_rep2[32:0]),
  .ftu_instr_3_c_rep3(ftu_instr_3_c_rep3[32:0]),
  .ftu_instr_0_exceptions_c_rep0(ftu_instr_0_exceptions_c_rep0[4:0]),
  .ftu_instr_0_exceptions_c_rep1(ftu_instr_0_exceptions_c_rep1[4:0]),
  .ftu_instr_0_exceptions_c_rep2(ftu_instr_0_exceptions_c_rep2[4:0]),
  .ftu_instr_0_exceptions_c_rep3(ftu_instr_0_exceptions_c_rep3[4:0]),
  .ftu_instr_1_exceptions_c_rep0(ftu_instr_1_exceptions_c_rep0[4:0]),
  .ftu_instr_1_exceptions_c_rep1(ftu_instr_1_exceptions_c_rep1[4:0]),
  .ftu_instr_1_exceptions_c_rep2(ftu_instr_1_exceptions_c_rep2[4:0]),
  .ftu_instr_1_exceptions_c_rep3(ftu_instr_1_exceptions_c_rep3[4:0]),
  .ftu_instr_2_exceptions_c_rep0(ftu_instr_2_exceptions_c_rep0[4:0]),
  .ftu_instr_2_exceptions_c_rep1(ftu_instr_2_exceptions_c_rep1[4:0]),
  .ftu_instr_2_exceptions_c_rep2(ftu_instr_2_exceptions_c_rep2[4:0]),
  .ftu_instr_2_exceptions_c_rep3(ftu_instr_2_exceptions_c_rep3[4:0]),
  .ftu_instr_3_exceptions_c_rep0(ftu_instr_3_exceptions_c_rep0[4:0]),
  .ftu_instr_3_exceptions_c_rep1(ftu_instr_3_exceptions_c_rep1[4:0]),
  .ftu_instr_3_exceptions_c_rep2(ftu_instr_3_exceptions_c_rep2[4:0]),
  .ftu_instr_3_exceptions_c_rep3(ftu_instr_3_exceptions_c_rep3[4:0]),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .ftu_buffer_wr_en_f(ftu_buffer_wr_en_f[7:0]),
  .ifu_buf0_valid_p(ifu_buf0_valid_p[7:0]),
  .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[7:0]),
  .ibu_empty(ibu_empty[7:0]),
  .ibu_room_4ormore(ibu_room_4ormore[7:0]),
  .ifu_buf0_inst0(ifu_buf0_inst0[32:0]),
  .ifu_buf0_inst1(ifu_buf0_inst1[32:0]),
  .ifu_buf0_inst2(ifu_buf0_inst2[32:0]),
  .ifu_buf0_inst3(ifu_buf0_inst3[32:0]),
  .ifu_buf0_inst4(ifu_buf0_inst4[32:0]),
  .ifu_buf0_inst5(ifu_buf0_inst5[32:0]),
  .ifu_buf0_inst6(ifu_buf0_inst6[32:0]),
  .ifu_buf0_inst7(ifu_buf0_inst7[32:0]),
  .ifu_buf0_excp0(ifu_buf0_excp0[4:0]),
  .ifu_buf0_excp1(ifu_buf0_excp1[4:0]),
  .ifu_buf0_excp2(ifu_buf0_excp2[4:0]),
  .ifu_buf0_excp3(ifu_buf0_excp3[4:0]),
  .ifu_buf0_excp4(ifu_buf0_excp4[4:0]),
  .ifu_buf0_excp5(ifu_buf0_excp5[4:0]),
  .ifu_buf0_excp6(ifu_buf0_excp6[4:0]),
  .ifu_buf0_excp7(ifu_buf0_excp7[4:0])
);



ifu_ftu ifu_ftu (
	.scan_in(ifu_ftu_scanin),
	.scan_out(ifu_ftu_scanout),
        .wmr_scan_in(lsu_wmr_scanout),
        .wmr_scan_out(ifu_ftu_wmr_scanout),
	.l2clk(l2clk),
        .tcu_pce_ov(pce_ov_bl),
        .tcu_scan_en(lb_scan_en_bl),
	.spc_aclk(spc_aclk_bl),
	.spc_aclk_wmr(spc_aclk_wmr_bl),
	.spc_bclk(spc_bclk_bl),
        .lbist_run		(lb_lbist_running	),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
        .tcu_se_scancollar_in(lb_se_sc_in),
        .tcu_se_scancollar_out(lb_se_sc_out),
	.vnw_ary(vnw_ary0),
	.mbi_run(mb0_run),
	.mbi_ict_write_en(mb0_ict_write_en),
	.mbi_ict_read_en(mb0_ict_read_en),
	.mbi_icd_write_en(mb0_icd_write_en),
	.mbi_icd_read_en(mb0_icd_read_en),
	.mbi_icv_write_en(mb0_icv_write_en),
	.mbi_icv_read_en(mb0_icv_read_en),
	.mbi_itb_write_en(mb0_itb_write_en),
	.mbi_itb_read_en(mb0_itb_read_en),
	.mbi_addr(mb0_addr[8:0]),
	.mbi_wdata(mb0_write_data[7:0]),
	.mbi_cmpsel(mb0_cmpsel[2:0]),
	.exu_address0_e(exu_address0_e_rep01[47:0]),
	.exu_address1_e(exu_address1_e_rep01[47:0]),
	.tlu_trap_pc_0_valid(tlu_trap_pc_0_valid),
	.tlu_trap_pc_1_valid(tlu_trap_pc_1_valid),
	.tlu_trap_pc_0(tlu_trap_pc_0[47:0]),
	.tlu_trap_pc_1(tlu_trap_pc_1[47:0]),
	.tlu_npc_w(tlu_npc_w[47:2]),
	.in_rngl_cdbus	( lsu_rngl_cdbus[64:0]),
	.ifu_rngl_cdbus ( ifu_rngl_cdbus[64:0]	),
	.cmu_instr_v({cmu_inst3_v, cmu_inst2_v, cmu_inst1_v, cmu_inst0_v}),
        .efu_spc_fuse_data(efu_spc_fuse_data_buf),
        .efu_spc_fuse_ixfer_en(efu_spc_fuse_ixfer_en_buf),
        .efu_spc_fuse_iclr(efu_spc_fuse_iclr_buf),
        .spc_efu_fuse_ixfer_en(spc_efu_fuse_ixfer_en_buf),
        .spc_efu_fuse_idata(spc_efu_fuse_idata_buf),
	.spc_core_running_status(tlu_core_running_status[7:0]),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_cambist_shift(mbi_cambist_shift),
  .mbi_dis_clr_ubit(mbi_dis_clr_ubit),
  .mbi_init_to_zero(mbi_init_to_zero),
  .mbi_itb_cam_en_pre(mbi_itb_cam_en_pre),
  .mbi_repl_write(mbi_repl_write),
  .mbi_itb_demap_en(mbi_itb_demap_en),
  .mbi_demap_type(mbi_demap_type[1:0]),
  .ftu_mbi_tlb_data_cmp(ftu_mbi_tlb_data_cmp),
  .ftu_mbi_tlb_cam_hit(ftu_mbi_tlb_cam_hit),
  .ftu_mbi_tlb_cam_mhit(ftu_mbi_tlb_cam_mhit),
  .ftu_mbi_tlb_ctxt0_hit(ftu_mbi_tlb_ctxt0_hit),
  .ftu_mbi_tlb_valid(ftu_mbi_tlb_valid),
  .ftu_mbi_tlb_used(ftu_mbi_tlb_used),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:28]),
  .lsu_ifu_direct_map(lsu_ifu_direct_map),
  .ftu_mbi_ict_fail(ftu_mbi_ict_fail),
  .ftu_mbi_icd_fail(ftu_mbi_icd_fail),
  .ftu_mbi_itb_fail(ftu_mbi_itb_fail),
  .ftu_mbi_icv_fail(ftu_mbi_icv_fail),
  .tlu_retry(tlu_retry[1:0]),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_ifu_hpstate_hpriv(tlu_ifu_hpstate_hpriv[7:0]),
  .tlu_ifu_pstate_priv(tlu_ifu_pstate_priv[7:0]),
  .tlu_pstate_am(tlu_pstate_am[7:0]),
  .tlu_ifu_invalidate(tlu_ifu_invalidate[1:0]),
  .cmu_fill_paddr(cmu_fill_paddr[39:5]),
  .cmu_inval_ack(cmu_inval_ack[7:0]),
  .cmu_l2_err(cmu_l2_err[1:0]),
  .cmu_l2miss(cmu_l2miss),
  .tlu_cerer_ittp(tlu_cerer_ittp),
  .tlu_cerer_itdp(tlu_cerer_itdp),
  .tlu_cerer_ittm(tlu_cerer_ittm),
  .tlu_cerer_icl2c(tlu_cerer_icl2c),
  .tlu_cerer_icl2u(tlu_cerer_icl2u),
  .tlu_cerer_icl2nd(tlu_cerer_icl2nd),
  .tlu_cerer_icvp(tlu_cerer_icvp),
  .tlu_cerer_ictp(tlu_cerer_ictp),
  .tlu_cerer_ictm(tlu_cerer_ictm),
  .cmu_icache_invalidate(cmu_icache_invalidate),
  .cmu_evic_invalidate(cmu_evic_invalidate),
  .cmu_icache_invalidate_way(cmu_icache_invalidate_way[2:0]),
  .cmu_icache_inv_way1(cmu_icache_inv_way1[2:0]),
  .cmu_icache_invalidate_index(cmu_icache_invalidate_index[10:5]),
  .dec_load_flush_w(dec_load_flush_w[1:0]),
  .dec_tid0_d(dec_tid0_d[1:0]),
  .dec_tid1_d(dec_tid1_d[1:0]),
  .dec_br_taken_e(dec_br_taken_e[1:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .tlu_trap_0_tid(tlu_trap_0_tid[1:0]),
  .tlu_trap_1_tid(tlu_trap_1_tid[1:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .tlu_itlb_reload(tlu_itlb_reload[1:0]),
  .tlu_itlb_bypass(tlu_itlb_bypass[7:0]),
  .tlu_tl_gt_0(tlu_tl_gt_0[7:0]),
  .ibu_empty(ibu_empty[7:0]),
  .ibu_room_4ormore(ibu_room_4ormore[7:0]),
  .cmu_null_st(cmu_null_st[7:0]),
  .cmu_dupmiss_st(cmu_dupmiss_st[7:0]),
  .cmu_rst_dupmiss(cmu_rst_dupmiss[7:0]),
  .cmu_any_un_cacheable(cmu_any_un_cacheable),
  .cmu_any_data_ready(cmu_any_data_ready),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .cmu_fill_inst0(cmu_fill_inst0[32:0]),
  .cmu_fill_inst1(cmu_fill_inst1[32:0]),
  .cmu_fill_inst2(cmu_fill_inst2[32:0]),
  .cmu_fill_inst3(cmu_fill_inst3[32:0]),
  .lsu_ic_enable(lsu_ic_enable[7:0]),
  .lsu_ifu_no_miss(lsu_ifu_no_miss[7:0]),
  .lsu_ifu_ctxt_data(lsu_ifu_ctxt_data[12:0]),
  .lsu_ifu_tid_w(lsu_ifu_tid_w[2:0]),
  .lsu_ifu_wr_p0ctxt(lsu_ifu_wr_p0ctxt),
  .lsu_ifu_wr_p1ctxt(lsu_ifu_wr_p1ctxt),
  .lsu_ifu_wr_pid(lsu_ifu_wr_pid),
  .lsu_immu_enable(lsu_immu_enable[7:0]),
  .lsu_ifu_ftu_pmen(lsu_ifu_ftu_pmen),
  .lsu_ic_pmen(lsu_ic_pmen),
  .cmu_fill_wrway(cmu_fill_wrway[2:0]),
  .cmu_ic_data(cmu_ic_data[263:0]),
  .mmu_index(mmu_index[6:0]),
  .ftu_buffer_wr_en_f(ftu_buffer_wr_en_f[7:0]),
  .ftu_rep_way(ftu_rep_way[2:0]),
  .ftu_paddr(ftu_paddr[39:0]),
  .ftu_instr_0_c(ftu_instr_0_c[32:0]),
  .ftu_instr_1_c(ftu_instr_1_c[32:0]),
  .ftu_instr_2_c(ftu_instr_2_c[32:0]),
  .ftu_instr_3_c(ftu_instr_3_c[32:0]),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_instr_exceptions_c(ftu_instr_exceptions_c[4:0]),
  .ftu_instr_valid_c(ftu_instr_valid_c[3:0]),
  .ftu_fetch_thr_c(ftu_fetch_thr_c[7:0]),
  .ftu_curr_fetch_thr_f(ftu_curr_fetch_thr_f[7:0]),
  .ftu_ifu_quiesce(ftu_ifu_quiesce[7:0]),
  .ifu_ibuffer_write_c(ifu_ibuffer_write_c[7:0]),
  .ftu_ic_no_err_c(ftu_ic_no_err_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .ftu_excp_way_d(ftu_excp_way_d[2:0]),
  .ftu_excp_tid_d(ftu_excp_tid_d[2:0]),
  .ftu_excp_way_valid_d(ftu_excp_way_valid_d),
  .ftu_thrx_un_cacheable(ftu_thrx_un_cacheable),
  .ftu_agc_thr0_cmiss_c(ftu_agc_thr0_cmiss_c),
  .ftu_agc_thr1_cmiss_c(ftu_agc_thr1_cmiss_c),
  .ftu_agc_thr2_cmiss_c(ftu_agc_thr2_cmiss_c),
  .ftu_agc_thr3_cmiss_c(ftu_agc_thr3_cmiss_c),
  .ftu_agc_thr4_cmiss_c(ftu_agc_thr4_cmiss_c),
  .ftu_agc_thr5_cmiss_c(ftu_agc_thr5_cmiss_c),
  .ftu_agc_thr6_cmiss_c(ftu_agc_thr6_cmiss_c),
  .ftu_agc_thr7_cmiss_c(ftu_agc_thr7_cmiss_c),
  .ftu_thr0_inv_req_c(ftu_thr0_inv_req_c),
  .ftu_thr1_inv_req_c(ftu_thr1_inv_req_c),
  .ftu_thr2_inv_req_c(ftu_thr2_inv_req_c),
  .ftu_thr3_inv_req_c(ftu_thr3_inv_req_c),
  .ftu_thr4_inv_req_c(ftu_thr4_inv_req_c),
  .ftu_thr5_inv_req_c(ftu_thr5_inv_req_c),
  .ftu_thr6_inv_req_c(ftu_thr6_inv_req_c),
  .ftu_thr7_inv_req_c(ftu_thr7_inv_req_c),
  .ftu_ibu_redirect_bf(ftu_ibu_redirect_bf[7:0]),
  .ftu_thr0_redirect_bf(ftu_thr0_redirect_bf),
  .ftu_thr1_redirect_bf(ftu_thr1_redirect_bf),
  .ftu_thr2_redirect_bf(ftu_thr2_redirect_bf),
  .ftu_thr3_redirect_bf(ftu_thr3_redirect_bf),
  .ftu_thr4_redirect_bf(ftu_thr4_redirect_bf),
  .ftu_thr5_redirect_bf(ftu_thr5_redirect_bf),
  .ftu_thr6_redirect_bf(ftu_thr6_redirect_bf),
  .ftu_thr7_redirect_bf(ftu_thr7_redirect_bf),
  .ic_dmo_rd_data(ic_dmo_rd_data[32:0]),
  .slow_cmp_sync_en(slow_cmp_sync_en),
  .cmp_slow_sync_en(cmp_slow_sync_en)
);



ifu_cmu ifu_cmu (
	.scan_in(ifu_cmu_scanin),
	.scan_out(ifu_cmu_scanout),
	.l15_spc_cpkt		(lsu_cpx_cpkt[17:0]),
	.l15_spc_data1		(lsu_cpx_data[127:0]),
	.l15_ifu_valid		(lsu_cpx_valid),
	.l2clk(l2clk),
        .tcu_pce_ov(pce_ov_bl),
        .tcu_scan_en(lb_scan_en_bl),
	.spc_aclk(spc_aclk_bl),
	.spc_bclk(spc_bclk_bl),
  .const_cpuid(const_cpuid[2:0]),
  .lsu_ifu_cmu_pmen(lsu_ifu_cmu_pmen),
  .ftu_paddr(ftu_paddr[39:0]),
  .ftu_rep_way(ftu_rep_way[2:0]),
  .ftu_thrx_un_cacheable(ftu_thrx_un_cacheable),
  .ftu_curr_fetch_thr_f(ftu_curr_fetch_thr_f[7:0]),
  .ftu_agc_thr0_cmiss_c(ftu_agc_thr0_cmiss_c),
  .ftu_agc_thr1_cmiss_c(ftu_agc_thr1_cmiss_c),
  .ftu_agc_thr2_cmiss_c(ftu_agc_thr2_cmiss_c),
  .ftu_agc_thr3_cmiss_c(ftu_agc_thr3_cmiss_c),
  .ftu_agc_thr4_cmiss_c(ftu_agc_thr4_cmiss_c),
  .ftu_agc_thr5_cmiss_c(ftu_agc_thr5_cmiss_c),
  .ftu_agc_thr6_cmiss_c(ftu_agc_thr6_cmiss_c),
  .ftu_agc_thr7_cmiss_c(ftu_agc_thr7_cmiss_c),
  .ftu_thr0_inv_req_c(ftu_thr0_inv_req_c),
  .ftu_thr1_inv_req_c(ftu_thr1_inv_req_c),
  .ftu_thr2_inv_req_c(ftu_thr2_inv_req_c),
  .ftu_thr3_inv_req_c(ftu_thr3_inv_req_c),
  .ftu_thr4_inv_req_c(ftu_thr4_inv_req_c),
  .ftu_thr5_inv_req_c(ftu_thr5_inv_req_c),
  .ftu_thr6_inv_req_c(ftu_thr6_inv_req_c),
  .ftu_thr7_inv_req_c(ftu_thr7_inv_req_c),
  .ftu_thr0_redirect_bf(ftu_thr0_redirect_bf),
  .ftu_thr1_redirect_bf(ftu_thr1_redirect_bf),
  .ftu_thr2_redirect_bf(ftu_thr2_redirect_bf),
  .ftu_thr3_redirect_bf(ftu_thr3_redirect_bf),
  .ftu_thr4_redirect_bf(ftu_thr4_redirect_bf),
  .ftu_thr5_redirect_bf(ftu_thr5_redirect_bf),
  .ftu_thr6_redirect_bf(ftu_thr6_redirect_bf),
  .ftu_thr7_redirect_bf(ftu_thr7_redirect_bf),
  .lsu_ifu_ld_index(lsu_ifu_ld_index[10:5]),
  .l15_ifu_grant(l15_ifu_grant),
  .gkt_ifu_legal(gkt_ifu_legal[3:0]),
  .gkt_ifu_flip_parity(gkt_ifu_flip_parity[3:0]),
  .cmu_l2miss(cmu_l2miss),
  .cmu_any_data_ready(cmu_any_data_ready),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .cmu_any_un_cacheable(cmu_any_un_cacheable),
  .cmu_null_st(cmu_null_st[7:0]),
  .cmu_dupmiss_st(cmu_dupmiss_st[7:0]),
  .cmu_rst_dupmiss(cmu_rst_dupmiss[7:0]),
  .cmu_inst0_v(cmu_inst0_v),
  .cmu_inst1_v(cmu_inst1_v),
  .cmu_inst2_v(cmu_inst2_v),
  .cmu_inst3_v(cmu_inst3_v),
  .cmu_fill_wrway(cmu_fill_wrway[2:0]),
  .cmu_fill_paddr(cmu_fill_paddr[39:0]),
  .cmu_fill_inst0(cmu_fill_inst0[32:0]),
  .cmu_fill_inst1(cmu_fill_inst1[32:0]),
  .cmu_fill_inst2(cmu_fill_inst2[32:0]),
  .cmu_fill_inst3(cmu_fill_inst3[32:0]),
  .cmu_ic_data(cmu_ic_data[263:0]),
  .cmu_icache_invalidate(cmu_icache_invalidate),
  .cmu_icache_invalidate_way(cmu_icache_invalidate_way[2:0]),
  .cmu_icache_invalidate_index(cmu_icache_invalidate_index[10:5]),
  .cmu_icache_inv_way1(cmu_icache_inv_way1[2:0]),
  .cmu_evic_invalidate(cmu_evic_invalidate),
  .cmu_inval_ack(cmu_inval_ack[7:0]),
  .cmu_l2_err(cmu_l2_err[1:0]),
  .ifu_l15_valid(ifu_l15_valid),
  .ifu_l15_cpkt(ifu_l15_cpkt[7:0]),
  .ifu_l15_addr(ifu_l15_addr[39:0]),
  .ifu_lsu_if_vld(ifu_lsu_if_vld),
  .ifu_lsu_if_tid(ifu_lsu_if_tid[2:0]),
  .ifu_lsu_if_addr(ifu_lsu_if_addr[10:5])
);



dec dec (
	.scan_in(dec_scanin),
	.scan_out(dec_scanout),
	.l2clk(l2clk),
        .tcu_pce_ov(pce_ov_bl),
        .tcu_scan_en(lb_scan_en_bl),
	.spc_aclk(spc_aclk_bl),
	.spc_bclk(spc_bclk_bl),
	.tlu_dtlb_reload_stall	(mmu_dtlb_reload_stall),
        .power_throttle(power_throttle_buf[2:0]),
	.spc_core_running_status(tlu_core_running_status[7:0]),
	.fgu_ecc_asi_stall(lsu_frf_read_pending),
  .lb_lbist_running(lb_lbist_running),
  .lsu_dec_pmen(lsu_dec_pmen),
  .lsu_exu_pmen(lsu_exu_pmen),
  .exu_test_tid0(exu_test_tid0[1:0]),
  .exu_test_addr0(exu_test_addr0[4:0]),
  .exu_test_valid0(exu_test_valid0),
  .exu_test_tid1(exu_test_tid1[1:0]),
  .exu_test_addr1(exu_test_addr1[4:0]),
  .exu_test_valid1(exu_test_valid1),
  .tlu_cerer_icdp(tlu_cerer_icdp),
  .tlu_dec_pstate_pef(tlu_dec_pstate_pef[7:0]),
  .fgu_fprs_fef(fgu_fprs_fef[7:0]),
  .tlu_dec_hpstate_hpriv(tlu_dec_hpstate_hpriv[7:0]),
  .tlu_dec_pstate_priv(tlu_dec_pstate_priv[7:0]),
  .tlu_pstate_am(tlu_pstate_am[7:0]),
  .tlu_window_block(tlu_window_block[1:0]),
  .exu0_window_block(exu0_window_block),
  .exu1_window_block(exu1_window_block),
  .lsu_cpq_stall(lsu_cpq_stall),
  .ifu_buf0_inst0(ifu_buf0_inst0[32:0]),
  .ifu_buf0_inst1(ifu_buf0_inst1[32:0]),
  .ifu_buf0_inst2(ifu_buf0_inst2[32:0]),
  .ifu_buf0_inst3(ifu_buf0_inst3[32:0]),
  .ifu_buf0_inst4(ifu_buf0_inst4[32:0]),
  .ifu_buf0_inst5(ifu_buf0_inst5[32:0]),
  .ifu_buf0_inst6(ifu_buf0_inst6[32:0]),
  .ifu_buf0_inst7(ifu_buf0_inst7[32:0]),
  .ifu_buf0_excp0(ifu_buf0_excp0[4:0]),
  .ifu_buf0_excp1(ifu_buf0_excp1[4:0]),
  .ifu_buf0_excp2(ifu_buf0_excp2[4:0]),
  .ifu_buf0_excp3(ifu_buf0_excp3[4:0]),
  .ifu_buf0_excp4(ifu_buf0_excp4[4:0]),
  .ifu_buf0_excp5(ifu_buf0_excp5[4:0]),
  .ifu_buf0_excp6(ifu_buf0_excp6[4:0]),
  .ifu_buf0_excp7(ifu_buf0_excp7[4:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .pku_load_flush_w(pku_load_flush_w[7:0]),
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
  .pku_base_pick_p(pku_base_pick_p[7:0]),
  .pku_raw_pick0_p(pku_raw_pick0_p[3:0]),
  .pku_raw_pick1_p(pku_raw_pick1_p[7:4]),
  .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[7:0]),
  .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[7:0]),
  .pku_valid_e(pku_valid_e[7:0]),
  .pku_ds_e(pku_ds_e[7:0]),
  .pku_lsu_p(pku_lsu_p[7:0]),
  .pku_fgu_p(pku_fgu_p[7:0]),
  .pku_pdist_p(pku_pdist_p[7:0]),
  .pku_twocycle_p(pku_twocycle_p[7:0]),
  .pku_idest_p(pku_idest_p[7:0]),
  .pku_fdest_p(pku_fdest_p[7:0]),
  .pku_fsrc_rd_p(pku_fsrc_rd_p[7:0]),
  .pku_isrc_rs1_p(pku_isrc_rs1_p[7:0]),
  .pku_isrc_rs2_p(pku_isrc_rs2_p[7:0]),
  .pku_isrc_rd_p(pku_isrc_rd_p[7:0]),
  .pku_flush_f1(pku_flush_f1[7:0]),
  .pku_flush_f2(pku_flush_f2[7:0]),
  .pku_flush_lm(pku_flush_lm[7:0]),
  .pku_flush_lb(pku_flush_lb[7:0]),
  .pku_flush_m(pku_flush_m[7:0]),
  .pku_flush_b(pku_flush_b[7:0]),
  .spu_mult_request(spu_mult_request),
  .lsu_block_store_stall(lsu_block_store_stall),
  .lsu_block_store_rd(lsu_block_store_rd[4:3]),
  .lsu_block_store_tid(lsu_block_store_tid[2:0]),
  .exu0_oddwin_b(exu0_oddwin_b[3:0]),
  .exu1_oddwin_b(exu1_oddwin_b[3:0]),
  .fgu_idiv_stall(fgu_idiv_stall[1:0]),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .dec_br_taken_e1(dec_br_taken_e1[1:0]),
  .del_pick_d(del_pick_d[7:0]),
  .dec_inst0_rd_d(dec_inst0_rd_d[4:0]),
  .dec_inst1_rd_d(dec_inst1_rd_d[4:0]),
  .dec_rs1_addr0_e(dec_rs1_addr0_e),
  .dec_rs1_addr1_e(dec_rs1_addr1_e),
  .dec_inst0_d(dec_inst0_d[32:0]),
  .dec_inst1_d(dec_inst1_d[32:0]),
  .dec_decode0_d(dec_decode0_d),
  .dec_decode1_d(dec_decode1_d),
  .dec_valid0_d(dec_valid0_d),
  .dec_valid1_d(dec_valid1_d),
  .dec_true_valid_e(dec_true_valid_e[1:0]),
  .dec_tid0_d(dec_tid0_d[1:0]),
  .dec_tid1_d(dec_tid1_d[1:0]),
  .dec_tid0_p(dec_tid0_p[1:0]),
  .dec_tid1_p(dec_tid1_p[1:0]),
  .dec_raw_pick_p(dec_raw_pick_p[7:0]),
  .dec_inst0_rs1_p(dec_inst0_rs1_p[4:0]),
  .dec_inst0_rs2_p(dec_inst0_rs2_p[4:0]),
  .dec_inst0_rs3_p(dec_inst0_rs3_p[4:0]),
  .dec_inst0_rs1_vld_p(dec_inst0_rs1_vld_p),
  .dec_inst0_rs2_vld_p(dec_inst0_rs2_vld_p),
  .dec_inst0_rs3_vld_p(dec_inst0_rs3_vld_p),
  .dec_inst1_rs1_p(dec_inst1_rs1_p[4:0]),
  .dec_inst1_rs2_p(dec_inst1_rs2_p[4:0]),
  .dec_inst1_rs3_p(dec_inst1_rs3_p[4:0]),
  .dec_inst1_rs1_vld_p(dec_inst1_rs1_vld_p),
  .dec_inst1_rs2_vld_p(dec_inst1_rs2_vld_p),
  .dec_inst1_rs3_vld_p(dec_inst1_rs3_vld_p),
  .dec_frf_r1_addr_d(dec_frf_r1_addr_d[4:0]),
  .dec_frf_r2_addr_d(dec_frf_r2_addr_d[4:0]),
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
  .dec_spu_grant_d(dec_spu_grant_d),
  .dec_spu_grant_fgu_d(dec_spu_grant_fgu_d),
  .dec_block_store_b(dec_block_store_b[7:0]),
  .dec_load_flush_w(dec_load_flush_w[1:0]),
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
  .dec_annul_ds_m(dec_annul_ds_m[1:0]),
  .dec_ds_m(dec_ds_m[1:0]),
  .dec_fgu_sel_e(dec_fgu_sel_e[1:0]),
  .dec_fgu_sel_m(dec_fgu_sel_m[1:0]),
  .dec_lsu_sel0_e(dec_lsu_sel0_e),
  .dec_lsu_sel1_e(dec_lsu_sel1_e),
  .dec_lsu_sel0_lower_e(dec_lsu_sel0_lower_e),
  .dec_lsu_sel1_lower_e(dec_lsu_sel1_lower_e),
  .dec_lsu_sel0_upper_e(dec_lsu_sel0_upper_e),
  .dec_lsu_sel1_upper_e(dec_lsu_sel1_upper_e),
  .dec_rs1_addr0_upper_e(dec_rs1_addr0_upper_e),
  .dec_rs1_addr1_upper_e(dec_rs1_addr1_upper_e),
  .dec_ld_inst_e(dec_ld_inst_e),
  .dec_st_inst_e(dec_st_inst_e),
  .dec_fsr_ldst_e(dec_fsr_ldst_e),
  .dec_fpldst_inst_e(dec_fpldst_inst_e),
  .dec_ldst_dbl_e(dec_ldst_dbl_e),
  .dec_pref_inst_e(dec_pref_inst_e),
  .dec_flush_inst_e(dec_flush_inst_e),
  .dec_memstbar_inst_e(dec_memstbar_inst_e),
  .dec_ldst_sz_e(dec_ldst_sz_e[1:0]),
  .dec_frf_r2_addr_e(dec_frf_r2_addr_e[4:3]),
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
  .dec_lsu_tid0_d(dec_lsu_tid0_d[1:0]),
  .dec_lsu_tid1_d(dec_lsu_tid1_d[1:0]),
  .dec_lsu_tg_d(dec_lsu_tg_d),
  .dec_lsu_rd_e(dec_lsu_rd_e[4:0]),
  .dec_ld_inst_d(dec_ld_inst_d),
  .dec_instr0_type_d(dec_instr0_type_d[9:0]),
  .dec_instr1_type_d(dec_instr1_type_d[9:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_pmu_valid_e(dec_pmu_valid_e[1:0]),
  .dec_fgu_valid_e(dec_fgu_valid_e),
  .dec_exu_clken(dec_exu_clken[1:0]),
  .dec_lsu_sel0_d(dec_lsu_sel0_d),
  .dec_ierr_d(dec_ierr_d[1:0]),
  .dec_block_store_stall(dec_block_store_stall[7:0])
);



pku pku (
	.scan_in(pku_scanin),
	.scan_out(pku_scanout),
	.l2clk(l2clk),
        .tcu_pce_ov(pce_ov_bl),
        .tcu_scan_en(lb_scan_en_bl),
        .tcu_do_mode(msf0_do_mode),
	.spc_aclk(spc_aclk_bl),
	.spc_bclk(spc_bclk_bl),
	.dec_br_taken_e(dec_br_taken_e1[1:0]),
	.lsu_spec_enable(tlu_spec_enable[7:0]),
	.spc_core_running_status(tlu_core_running_status[7:0]),
  .tlu_halted(tlu_halted[7:0]),
  .dec_block_store_stall(dec_block_store_stall[7:0]),
  .dec_ierr_d(dec_ierr_d[1:0]),
  .lsu_pku_pmen(lsu_pku_pmen),
  .tlu_retry_state(tlu_retry_state[7:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .dec_true_valid_e(dec_true_valid_e[1:0]),
  .dec_decode0_d(dec_decode0_d),
  .dec_decode1_d(dec_decode1_d),
  .dec_valid0_d(dec_valid0_d),
  .dec_valid1_d(dec_valid1_d),
  .lsu_sync(lsu_sync[7:0]),
  .lsu_complete(lsu_complete[7:0]),
  .fgu_divide_completion(fgu_divide_completion[7:0]),
  .ifu_ibuffer_write_c(ifu_ibuffer_write_c[7:0]),
  .lsu_stb_alloc(lsu_stb_alloc[7:0]),
  .lsu_stb_dealloc(lsu_stb_dealloc[7:0]),
  .lsu_block_store_kill(lsu_block_store_kill[7:0]),
  .ifu_buf0_inst0(ifu_buf0_inst0[31:0]),
  .ifu_buf0_inst1(ifu_buf0_inst1[31:0]),
  .ifu_buf0_inst2(ifu_buf0_inst2[31:0]),
  .ifu_buf0_inst3(ifu_buf0_inst3[31:0]),
  .ifu_buf0_inst4(ifu_buf0_inst4[31:0]),
  .ifu_buf0_inst5(ifu_buf0_inst5[31:0]),
  .ifu_buf0_inst6(ifu_buf0_inst6[31:0]),
  .ifu_buf0_inst7(ifu_buf0_inst7[31:0]),
  .ifu_buf0_valid_p(ifu_buf0_valid_p[7:0]),
  .ifu_upper_buffer_valid_p(ifu_upper_buffer_valid_p[7:0]),
  .pku_raw_pick0_p(pku_raw_pick0_p[3:0]),
  .pku_raw_pick1_p(pku_raw_pick1_p[7:4]),
  .pku_base_pick_p(pku_base_pick_p[7:0]),
  .pku_pick_p(pku_pick_p[7:0]),
  .pku_lsu_p(pku_lsu_p[7:0]),
  .pku_fgu_p(pku_fgu_p[7:0]),
  .pku_pdist_p(pku_pdist_p[7:0]),
  .pku_twocycle_p(pku_twocycle_p[7:0]),
  .pku_idest_p(pku_idest_p[7:0]),
  .pku_fdest_p(pku_fdest_p[7:0]),
  .pku_fsrc_rd_p(pku_fsrc_rd_p[7:0]),
  .pku_isrc_rs1_p(pku_isrc_rs1_p[7:0]),
  .pku_isrc_rs2_p(pku_isrc_rs2_p[7:0]),
  .pku_isrc_rd_p(pku_isrc_rd_p[7:0]),
  .pku_valid_e(pku_valid_e[7:0]),
  .pku_annul_ds_dcti_brtaken0_e(pku_annul_ds_dcti_brtaken0_e[7:0]),
  .pku_annul_ds_dcti_brtaken1_e(pku_annul_ds_dcti_brtaken1_e[7:0]),
  .pku_flush_f1(pku_flush_f1[7:0]),
  .pku_flush_f2(pku_flush_f2[7:0]),
  .pku_flush_lb(pku_flush_lb[7:0]),
  .pku_flush_lm(pku_flush_lm[7:0]),
  .pku_flush_m(pku_flush_m[7:0]),
  .pku_flush_b(pku_flush_b[7:0]),
  .pku_load_flush_w(pku_load_flush_w[7:0]),
  .pku_ds_e(pku_ds_e[7:0]),
  .pku_flush_upper_buffer(pku_flush_upper_buffer[7:0]),
  .pku_flush_buffer0(pku_flush_buffer0[7:0]),
  .pku_quiesce(pku_quiesce[7:0]),
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
  .pku_inst_cnt_brtaken17(pku_inst_cnt_brtaken17[1:0])
);



exu exu0 (
	.scan_in(exu0_scanin),
	.scan_out(exu0_scanout),
	.wmr_scan_in(wmr_protect_scanin),
	.wmr_scan_out(exu0_wmr_scanout),
	.l2clk			(l2clk				),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
        .tcu_pce_ov		(pce_ov_tr			),
        .tcu_scan_en		(lb_scan_en_tr			),
	.spc_aclk               (spc_aclk_tr                    ),
	.spc_aclk_wmr           (spc_aclk_wmr_tr                ),
	.spc_bclk               (spc_bclk_tr                    ),
        .tcu_se_scancollar_in	(lb_se_sc_in			),
	.in_rngl_cdbus		(ifu_rngl_cdbus[64:0]		),
	.dec_pick_d		(del_pick_d[3:0]		),
	.dec_tid_p		(dec_tid0_p[1:0]		),
	.dec_inst_rs1_vld_p	(dec_inst0_rs1_vld_p		),
	.dec_inst_rs2_vld_p	(dec_inst0_rs2_vld_p		),
	.dec_inst_rs3_vld_p	(dec_inst0_rs3_vld_p		),
	.dec_inst_rs1_p		(dec_inst0_rs1_p[4:0]		),
	.dec_inst_rs2_p		(dec_inst0_rs2_p[4:0]		),
	.dec_inst_rs3_p		(dec_inst0_rs3_p[4:0]		),
	.dec_exu_clken		(dec_exu_clken[0]		),
	.dec_inst_d		(dec_inst0_d[31:0]		),
	.dec_inst_rd_d		(dec_inst0_rd_d[4:0]		),
	.dec_decode_d		(dec_decode0_d			),	
	.dec_valid_e		(dec_valid_e[0]			),
	.dec_flush_m		(dec_flush_m[0]			),
	.dec_flush_b		(dec_flush_b[0]			),
	.dec_thread_group	(1'b0				),
	.fgu_exu_result_fx5	(fgu_exu_result_fx5_rep1[63:0]	),
	.fgu_exu_w_vld_fx5	(fgu_exu_w_vld_fx5[0]		),
	.tlu_pc_d		(tlu_pc_0_d[47:2]		),
	.tlu_itlb_bypass_e	(tlu_itlb_bypass_e[0]		),
	.tlu_flush_exu_b	(tlu_flush_exu_b[0]		),
	.tlu_ccr		(tlu_ccr_0[7:0]			),
	.tlu_cwp		(tlu_cwp_0[2:0]			),
	.tlu_ccr_cwp_valid	(tlu_ccr_cwp_0_valid		),
	.tlu_ccr_cwp_tid	(tlu_ccr_cwp_0_tid[1:0]		),
	.tlu_pstate_am		(tlu_pstate_am[3:0]		),
	.tlu_gl_thr0   		(tlu_gl0[1:0] 			),
	.tlu_gl_thr1   		(tlu_gl1[1:0] 			),
	.tlu_gl_thr2   		(tlu_gl2[1:0] 			),
	.tlu_gl_thr3   		(tlu_gl3[1:0] 			),
	.tlu_cerer_irf		(tlu_cerer_irf			),
	.tlu_ceter_pscce	(tlu_ceter_pscce[3:0]		),
	.mbi_run		(mb2_run			),
	.mbi_addr		(mb2_addr[9:0]			),
	.mbi_write_data_p1	(mb2_write_data_p1[7:0]		),
	.mbi_irf_write_en	(mb2_irf_write_en		),
	.mbi_irf_read_en	(mb2_irf_read_en		),
	.mbi_irf_save_en	(mb2_irf_save_en		),
	.mbi_irf_restore_en	(mb2_irf_restore_en		),
	.spc_core_running_status(tlu_core_running_status[3:0]	),
	.lsu_asi_error_inject_b31(lsu_asi_error_inject[31]	),
	.lsu_asi_error_inject_b25(lsu_asi_error_inject[25]	),
	.lsu_exu_ld_data_b	(lsu_exu_ld_data_b_rep00[63:0]	),
	.exu_rngl_cdbus			(exu0_rngl_cdbus[64:0]		),
	.exu_address_e			(exu_address0_e[47:0]		),
	.exu_mdp_mux_sel_e		(exu0_mdp_mux_sel_e[5:0]	),
	.exu_ms_icc_e			(exu_ms_icc0_e			),
	.exu_rs1_data_e			(exu_rs1_data0_e[63:0]		),
	.exu_rs2_data_e			(exu_rs2_data0_e[63:0]		),
	.exu_store_data_e		(exu_store_data0_e[63:0]	),
	.exu_oddwin_b			(exu0_oddwin_b[3:0]		),
	.exu_cecc_m			(exu_cecc_m[0]			),
	.exu_uecc_m			(exu_uecc_m[0]			),
	.exu_misalign_m			(exu_misalign_m[0]		),
	.exu_oor_va_m			(exu_oor_va_m[0]		),
	.exu_tcc_m			(exu_tcc_m[0]			),
	.exu_tof_m			(exu_tof_m[0]			),
	.exu_trap_number_b		(exu0_trap_number_b[7:0]	),
	.exu_spill_b			(exu_spill_b[0]			),
	.exu_fill_m			(exu_fill_m[0]			),
	.exu_normal_b			(exu_normal_b[0]		),
	.exu_cleanwin_b			(exu_cleanwin_b[0]		),
	.exu_wstate_b			(exu0_wstate_b[2:0]		),
	.exu_ccr0			(exu0_ccr0[7:0]			),
	.exu_ccr1			(exu0_ccr1[7:0]			),
	.exu_ccr2			(exu0_ccr2[7:0]			),
	.exu_ccr3			(exu0_ccr3[7:0]			),
	.exu_ecc_m			(exu_ecc_m[0]			),
	.exu_ecc_check_m		(exu0_ecc_check_m[7:0]		),
	.exu_ecc_addr_m			(exu0_ecc_addr_m[4:0]		),
	.exu_gsr_data_m			(exu_gsr_data0_m[31:0]		),
	.exu_gsr_vld_m			(exu_gsr_vld0_m[1:0]		),
	.exu_cmov_true_m		(exu_cmov_true_m[0]		),
	.exu_br_taken_e			(dec_br_taken_e[0]		),
	.exu_br_taken_e1		(dec_br_taken_e1[0]		),
	.exu_ibp_m			(exu_ibp_m[0]			),
	.exu_lsu_va_error_m		(exu_lsu_va_error_m[0]		),
	.exu_y_data_e			(exu_y_data0_e[31:0]		),
	.exu_cwp_thr0			(exu0_cwp0[2:0]			),
	.exu_cwp_thr1			(exu0_cwp1[2:0]			),
	.exu_cwp_thr2			(exu0_cwp2[2:0]			),
	.exu_cwp_thr3			(exu0_cwp3[2:0]			),
        .exu_window_block_m		(exu0_window_block              ),
	.exu_tlu_window_block		(exu_tlu_window_block[0]        ),
	.exu_ecc_winop_flush_m		(exu_ecc_winop_flush_m[0]	),
        .exu_test_valid			(exu_test_valid0		),
	.exu_test_tid			(exu_test_tid0[1:0]		),
	.exu_test_addr			(exu_test_addr0[4:0]		),
	.exu_mbi_irf_fail_		(exu0_mbi_irf_fail_[1:0]	),
  .fgu_exu_icc_fx5(fgu_exu_icc_fx5[3:0]),
  .fgu_exu_xcc_fx5(fgu_exu_xcc_fx5[1:0]),
  .fgu_exu_cc_vld_fx5(fgu_exu_cc_vld_fx5),
  .fgu_result_tid_fx5(fgu_result_tid_fx5[1:0]),
  .fgu_irf_w_addr_fx5(fgu_irf_w_addr_fx5[4:0]),
  .lsu_exu_ld_b(lsu_exu_ld_b),
  .lsu_exu_rd_m(lsu_exu_rd_m[4:0]),
  .lsu_exu_tid_m(lsu_exu_tid_m[2:0]),
  .lsu_exu_ld_vld_w(lsu_exu_ld_vld_w),
  .lsu_asi_error_inject(lsu_asi_error_inject[7:0]),
  .lsu_exu_pmen(lsu_exu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .fgu_fld_fcc_fx3(fgu_fld_fcc_fx3[7:0]),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .fgu_fld_fcc_vld_fx3(fgu_fld_fcc_vld_fx3[1:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_tid_fx2(fgu_cmp_fcc_tid_fx2[2:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0])
);




exu exu1 (
        .scan_in(exu1_scanin),
        .scan_out(exu1_scanout),
	.wmr_scan_in(exu0_wmr_scanout),
	.wmr_scan_out(exu1_wmr_scanout),
        .l2clk(l2clk),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
        .tcu_pce_ov		(pce_ov_tr			),
        .tcu_scan_en		(lb_scan_en_tr			),
	.spc_aclk               (spc_aclk_tr                    ),
	.spc_aclk_wmr           (spc_aclk_wmr_tr                ),
	.spc_bclk               (spc_bclk_tr                    ),
        .tcu_se_scancollar_in   (lb_se_sc_in			),
	.in_rngl_cdbus		(fgu_rngl_cdbus[64:0]		),
	.dec_pick_d		(del_pick_d[7:4]		),
	.dec_tid_p		(dec_tid1_p[1:0]		),
	.dec_inst_rs1_vld_p	(dec_inst1_rs1_vld_p		),
	.dec_inst_rs2_vld_p	(dec_inst1_rs2_vld_p		),
	.dec_inst_rs3_vld_p	(dec_inst1_rs3_vld_p		),
	.dec_inst_rs1_p		(dec_inst1_rs1_p[4:0]		),
	.dec_inst_rs2_p		(dec_inst1_rs2_p[4:0]		),
	.dec_inst_rs3_p		(dec_inst1_rs3_p[4:0]		),
	.dec_exu_clken		(dec_exu_clken[1]		),
	.dec_inst_d		(dec_inst1_d[31:0]		),
	.dec_inst_rd_d		(dec_inst1_rd_d[4:0]		),
	.dec_decode_d		(dec_decode1_d			),	
	.dec_valid_e		(dec_valid_e[1]			),
	.dec_flush_m		(dec_flush_m[1]			),
	.dec_flush_b		(dec_flush_b[1]			),
	.dec_thread_group	(1'b1				),
	.fgu_exu_result_fx5	(fgu_exu_result_fx5_rep0[63:0]	),
	.fgu_exu_w_vld_fx5	(fgu_exu_w_vld_fx5[1]		),
	.tlu_pc_d		(tlu_pc_1_d[47:2]		),
	.tlu_itlb_bypass_e	(tlu_itlb_bypass_e[1]		),
	.tlu_flush_exu_b	(tlu_flush_exu_b[1]		),
	.tlu_ccr		(tlu_ccr_1[7:0]			),
	.tlu_cwp		(tlu_cwp_1[2:0]			),
	.tlu_ccr_cwp_valid	(tlu_ccr_cwp_1_valid		),
	.tlu_ccr_cwp_tid	(tlu_ccr_cwp_1_tid[1:0]		),
	.tlu_pstate_am		(tlu_pstate_am[7:4]		),
	.tlu_gl_thr0   		(tlu_gl4[1:0] 			),
	.tlu_gl_thr1   		(tlu_gl5[1:0] 			),
	.tlu_gl_thr2   		(tlu_gl6[1:0] 			),
	.tlu_gl_thr3   		(tlu_gl7[1:0] 			),
	.tlu_cerer_irf		(tlu_cerer_irf			),
	.tlu_ceter_pscce	(tlu_ceter_pscce[7:4]		),
	.mbi_run		(mb2_run			),
	.mbi_addr		(mb2_addr[9:0]			),
	.mbi_write_data_p1	(mb2_write_data_p1[7:0]		),
	.mbi_irf_write_en	(mb2_irf_write_en		),
	.mbi_irf_read_en	(mb2_irf_read_en		),
	.mbi_irf_save_en	(mb2_irf_save_en		),
	.mbi_irf_restore_en	(mb2_irf_restore_en		),
	.spc_core_running_status(tlu_core_running_status[7:4]	),
	.lsu_asi_error_inject_b31(lsu_asi_error_inject[31]	),
	.lsu_asi_error_inject_b25(lsu_asi_error_inject[25]	),
	.lsu_exu_ld_data_b	(lsu_exu_ld_data_b_rep01[63:0]	),
	.exu_rngl_cdbus			(exu1_rngl_cdbus[64:0]		),
	.exu_address_e			(exu_address1_e[47:0]		),
	.exu_mdp_mux_sel_e		(exu1_mdp_mux_sel_e[5:0]	),
	.exu_ms_icc_e			(exu_ms_icc1_e			),
	.exu_rs1_data_e			(exu_rs1_data1_e[63:0]		),
	.exu_rs2_data_e			(exu_rs2_data1_e[63:0]		),
	.exu_store_data_e		(exu_store_data1_e[63:0]	),
	.exu_oddwin_b			(exu1_oddwin_b[3:0]		),
	.exu_cecc_m			(exu_cecc_m[1]			),
	.exu_uecc_m			(exu_uecc_m[1]			),
	.exu_misalign_m			(exu_misalign_m[1]		),
	.exu_oor_va_m			(exu_oor_va_m[1]		),
	.exu_tcc_m			(exu_tcc_m[1]			),
	.exu_tof_m			(exu_tof_m[1]			),
	.exu_trap_number_b		(exu1_trap_number_b[7:0]	),
	.exu_spill_b			(exu_spill_b[1]			),
	.exu_fill_m			(exu_fill_m[1]			),
	.exu_normal_b			(exu_normal_b[1]		),
	.exu_cleanwin_b			(exu_cleanwin_b[1]		),
	.exu_wstate_b			(exu1_wstate_b[2:0]		),
	.exu_ccr0			(exu1_ccr0[7:0]			),
	.exu_ccr1			(exu1_ccr1[7:0]			),
	.exu_ccr2			(exu1_ccr2[7:0]			),
	.exu_ccr3			(exu1_ccr3[7:0]			),
	.exu_ecc_m			(exu_ecc_m[1]			),
	.exu_ecc_check_m		(exu1_ecc_check_m[7:0]		),
	.exu_ecc_addr_m			(exu1_ecc_addr_m[4:0]		),
	.exu_gsr_data_m			(exu_gsr_data1_m[31:0]		),
	.exu_gsr_vld_m			(exu_gsr_vld1_m[1:0]		),
	.exu_cmov_true_m		(exu_cmov_true_m[1]		),
	.exu_br_taken_e			(dec_br_taken_e[1]		),
	.exu_br_taken_e1		(dec_br_taken_e1[1]		),
	.exu_ibp_m			(exu_ibp_m[1]			),
	.exu_lsu_va_error_m		(exu_lsu_va_error_m[1]		),
	.exu_y_data_e			(exu_y_data1_e[31:0]		),
	.exu_cwp_thr0			(exu1_cwp0[2:0]			),
	.exu_cwp_thr1			(exu1_cwp1[2:0]			),
	.exu_cwp_thr2			(exu1_cwp2[2:0]			),
	.exu_cwp_thr3			(exu1_cwp3[2:0]			),
        .exu_window_block_m		(exu1_window_block              ),
	.exu_tlu_window_block		(exu_tlu_window_block[1]        ),
	.exu_ecc_winop_flush_m		(exu_ecc_winop_flush_m[1]	),
        .exu_test_valid			(exu_test_valid1		),
	.exu_test_tid			(exu_test_tid1[1:0]		),
	.exu_test_addr			(exu_test_addr1[4:0]		),
	.exu_mbi_irf_fail_		(exu1_mbi_irf_fail_[1:0]	),
  .fgu_exu_icc_fx5(fgu_exu_icc_fx5[3:0]),
  .fgu_exu_xcc_fx5(fgu_exu_xcc_fx5[1:0]),
  .fgu_exu_cc_vld_fx5(fgu_exu_cc_vld_fx5),
  .fgu_result_tid_fx5(fgu_result_tid_fx5[1:0]),
  .fgu_irf_w_addr_fx5(fgu_irf_w_addr_fx5[4:0]),
  .lsu_exu_ld_b(lsu_exu_ld_b),
  .lsu_exu_rd_m(lsu_exu_rd_m[4:0]),
  .lsu_exu_tid_m(lsu_exu_tid_m[2:0]),
  .lsu_exu_ld_vld_w(lsu_exu_ld_vld_w),
  .lsu_asi_error_inject(lsu_asi_error_inject[7:0]),
  .lsu_exu_pmen(lsu_exu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .fgu_fld_fcc_fx3(fgu_fld_fcc_fx3[7:0]),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .fgu_fld_fcc_vld_fx3(fgu_fld_fcc_vld_fx3[1:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .fgu_cmp_fcc_fx3(fgu_cmp_fcc_fx3[1:0]),
  .fgu_cmp_fcc_tid_fx2(fgu_cmp_fcc_tid_fx2[2:0]),
  .fgu_cmp_fcc_vld_fx3(fgu_cmp_fcc_vld_fx3[3:0])
);



// not sequential
exu_mdp_dp mdp (.tcu_dectest		(tcu_dectest_buf		),
                .tcu_muxtest		(tcu_muxtest_buf		),
  .dec_fgu_sel_e(dec_fgu_sel_e[1:0]),
  .dec_fgu_sel_m(dec_fgu_sel_m[1:0]),
  .dec_lsu_sel0_e(dec_lsu_sel0_e),
  .dec_lsu_sel1_e(dec_lsu_sel1_e),
  .dec_rs1_addr0_e(dec_rs1_addr0_e),
  .dec_rs1_addr1_e(dec_rs1_addr1_e),
  .dec_lsu_sel0_lower_e(dec_lsu_sel0_lower_e),
  .dec_lsu_sel1_lower_e(dec_lsu_sel1_lower_e),
  .dec_lsu_sel0_upper_e(dec_lsu_sel0_upper_e),
  .dec_lsu_sel1_upper_e(dec_lsu_sel1_upper_e),
  .dec_rs1_addr0_upper_e(dec_rs1_addr0_upper_e),
  .dec_rs1_addr1_upper_e(dec_rs1_addr1_upper_e),
  .exu0_mdp_mux_sel_e(exu0_mdp_mux_sel_e[5:0]),
  .exu1_mdp_mux_sel_e(exu1_mdp_mux_sel_e[5:0]),
  .exu_ms_icc0_e(exu_ms_icc0_e),
  .exu_ms_icc1_e(exu_ms_icc1_e),
  .exu_rs1_data0_e(exu_rs1_data0_e[63:0]),
  .exu_rs1_data1_e(exu_rs1_data1_e[63:0]),
  .exu_rs2_data0_e(exu_rs2_data0_e[63:0]),
  .exu_rs2_data1_e(exu_rs2_data1_e[63:0]),
  .exu_y_data0_e(exu_y_data0_e[31:0]),
  .exu_y_data1_e(exu_y_data1_e[31:0]),
  .exu_address0_e(exu_address0_e[47:0]),
  .exu_address1_e(exu_address1_e[47:0]),
  .exu_store_data0_e(exu_store_data0_e[63:0]),
  .exu_store_data1_e(exu_store_data1_e[63:0]),
  .exu_ecc_winop_flush_m(exu_ecc_winop_flush_m[1:0]),
  .exu_gsr_data0_m(exu_gsr_data0_m[31:0]),
  .exu_gsr_data1_m(exu_gsr_data1_m[31:0]),
  .exu_gsr_vld0_m(exu_gsr_vld0_m[1:0]),
  .exu_gsr_vld1_m(exu_gsr_vld1_m[1:0]),
  .exu_cmov_true_m(exu_cmov_true_m[1:0]),
  .lsu_exu_address_e(lsu_exu_address_e[47:13]),
  .lsu_sel_lsu_addr_e(lsu_sel_lsu_addr_e),
  .exu_fgu_rs1_e(exu_fgu_rs1_e[63:0]),
  .exu_fgu_rs2_e(exu_fgu_rs2_e[63:0]),
  .exu_fgu_gsr_m(exu_fgu_gsr_m[31:0]),
  .exu_fgu_gsr_vld_m(exu_fgu_gsr_vld_m[1:0]),
  .exu_fgu_flush_m(exu_fgu_flush_m),
  .exu_fgu_fmov_vld_m(exu_fgu_fmov_vld_m),
  .exu_lsu_address_e(exu_lsu_address_e[47:0]),
  .exu_lsu_store_data_e(exu_lsu_store_data_e[63:0]),
  .exu_lsu_rs2_e(exu_lsu_rs2_e[7:0])
);

tlu tlu (
	.scan_in(tlu_scanin),
	.scan_out(tlu_scanout),
	.wmr_scan_in(ifu_ftu_wmr_scanout),
	.wmr_scan_out(tlu_wmr_scanout),
	.l2clk			(l2clk				),
        .tcu_pce_ov		(pce_ov_tl			),
        .tcu_scan_en		(lb_scan_en_tl			),
	.spc_aclk               (spc_aclk_tl                    ),
	.spc_aclk_wmr           (spc_aclk_wmr_tl                ),
	.spc_bclk               (spc_bclk_tl                    ),
        .hver_mask_minor_rev	(hver_mask_minor_rev_buf[3:0] ),
        .cmp_tick_enable	(msf0_cmp_tick_enable		),
        .tcu_ss_mode		(msf0_ss_mode			),
        .tcu_do_mode		(msf0_do_mode			),
        .tcu_ss_request		(msf0_ss_request		),
        .tcu_wmr_vec_mask	(msf0_wmr_vec_mask		),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
        .tcu_se_scancollar_in	(lb_se_sc_in			),
	.exu_address0_e		(exu_address0_e_rep0	[47:0]	),
	.exu_address1_e		(exu_address1_e_rep0	[47:0]	),
	.fgu_cecc_fx2		(fgu_cecc_fx2_rep1		),
	.fgu_uecc_fx2		(fgu_uecc_fx2_rep1		),
	.l15_spc_valid		(l15_mmu_valid			),
	.l15_spc_cpkt		(l15_spc_cpkt		[17:0]	),
	.l15_spc_data1		(l15_spc_data1		[15:0]	),
	.mbi_tsa0_write_en	(mb1_tsa0_write_en		),
	.mbi_tsa1_write_en	(mb1_tsa1_write_en		),
	.mbi_tca_write_en	(mb1_tca_write_en		),
	.mbi_addr		(mb1_addr		[4:0]	),
	.mbi_run		(mb1_run			),
	.mbi_wdata		(mb1_write_data		[7:0]	),
	.mbi_tsa0_read_en	(mb1_tsa0_read_en		),
	.mbi_tsa1_read_en	(mb1_tsa1_read_en		),
	.mbi_tca_read_en	(mb1_tca_read_en		),
	.mbi_tlu_cmpsel		(mb1_cmpsel		[3:0]	),
	.lsu_block_store_b      (dec_block_store_b	[7:0]	),
	.lsu_rngf_cdbus		(lsu_rngf_cdbus		[64:0]	),
	.lsu_va_b		(lsu_mmu_va_b		[47:0]	),
	.spu_pmu_ma_busy	(spu_pmu_ma_busy	[3]	),
        .spc_shscan_scan_out    (spc_shscan_scan_out_buf       ),
        .tcu_shscan_pce_ov      (tcu_shscan_pce_ov_buf         ),
        .tcu_shscan_clk_stop    (msf0_shscan_clk_stop		),
        .tcu_shscan_aclk        (tcu_shscan_aclk_buf           ),
        .tcu_shscan_bclk        (tcu_shscan_bclk_buf           ),
        .tcu_shscan_scan_en     (tcu_shscan_scan_en_buf        ),
        .tcu_shscan_scan_in     (tcu_shscan_scan_in_buf        ),
        .tcu_shscanid           (msf0_shscanid                  ),
        .tcu_core_running	(msf0_core_running	[7:0] ),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .ftu_ifu_quiesce(ftu_ifu_quiesce[7:0]),
  .pku_quiesce(pku_quiesce[7:0]),
  .ftu_excp_way_d(ftu_excp_way_d[2:0]),
  .ftu_excp_tid_d(ftu_excp_tid_d[2:0]),
  .ftu_excp_way_valid_d(ftu_excp_way_valid_d),
  .dec_inst0_cnt(dec_inst0_cnt[1:0]),
  .dec_inst1_cnt(dec_inst1_cnt[1:0]),
  .dec_raw_pick_p(dec_raw_pick_p[7:0]),
  .dec_tid0_m(dec_tid0_m[1:0]),
  .dec_tid1_m(dec_tid1_m[1:0]),
  .dec_inst_valid_m(dec_inst_valid_m[1:0]),
  .dec_lsu_inst_m(dec_lsu_inst_m[1:0]),
  .dec_fgu_inst_m(dec_fgu_inst_m[1:0]),
  .dec_illegal_inst_m(dec_illegal_inst_m[1:0]),
  .dec_exc0_m(dec_exc0_m[4:0]),
  .dec_exc1_m(dec_exc1_m[4:0]),
  .dec_done_inst_m(dec_done_inst_m[1:0]),
  .dec_retry_inst_m(dec_retry_inst_m[1:0]),
  .dec_sir_inst_m(dec_sir_inst_m[1:0]),
  .dec_hpriv_exc_m(dec_hpriv_exc_m[1:0]),
  .dec_priv_exc_m(dec_priv_exc_m[1:0]),
  .dec_fpdisable_exc_m(dec_fpdisable_exc_m[1:0]),
  .dec_br_taken_m(dec_br_taken_m[1:0]),
  .dec_annul_ds_m(dec_annul_ds_m[1:0]),
  .dec_ds_m(dec_ds_m[1:0]),
  .dec_icache_perr_m(dec_icache_perr_m[1:0]),
  .dec_cti_inst_m(dec_cti_inst_m[1:0]),
  .dec_flush_b(dec_flush_b[1:0]),
  .exu_ibp_m(exu_ibp_m[1:0]),
  .exu_tcc_m(exu_tcc_m[1:0]),
  .exu_tof_m(exu_tof_m[1:0]),
  .exu_cecc_m(exu_cecc_m[1:0]),
  .exu_uecc_m(exu_uecc_m[1:0]),
  .exu0_ecc_addr_m(exu0_ecc_addr_m[4:0]),
  .exu1_ecc_addr_m(exu1_ecc_addr_m[4:0]),
  .exu0_ecc_check_m(exu0_ecc_check_m[7:0]),
  .exu1_ecc_check_m(exu1_ecc_check_m[7:0]),
  .exu_oor_va_m(exu_oor_va_m[1:0]),
  .exu_misalign_m(exu_misalign_m[1:0]),
  .exu_spill_b(exu_spill_b[1:0]),
  .exu_fill_m(exu_fill_m[1:0]),
  .exu_normal_b(exu_normal_b[1:0]),
  .exu_cleanwin_b(exu_cleanwin_b[1:0]),
  .exu0_wstate_b(exu0_wstate_b[2:0]),
  .exu1_wstate_b(exu1_wstate_b[2:0]),
  .exu0_ccr0(exu0_ccr0[7:0]),
  .exu0_ccr1(exu0_ccr1[7:0]),
  .exu0_ccr2(exu0_ccr2[7:0]),
  .exu0_ccr3(exu0_ccr3[7:0]),
  .exu1_ccr0(exu1_ccr0[7:0]),
  .exu1_ccr1(exu1_ccr1[7:0]),
  .exu1_ccr2(exu1_ccr2[7:0]),
  .exu1_ccr3(exu1_ccr3[7:0]),
  .exu0_cwp0(exu0_cwp0[2:0]),
  .exu0_cwp1(exu0_cwp1[2:0]),
  .exu0_cwp2(exu0_cwp2[2:0]),
  .exu0_cwp3(exu0_cwp3[2:0]),
  .exu1_cwp0(exu1_cwp0[2:0]),
  .exu1_cwp1(exu1_cwp1[2:0]),
  .exu1_cwp2(exu1_cwp2[2:0]),
  .exu1_cwp3(exu1_cwp3[2:0]),
  .exu0_trap_number_b(exu0_trap_number_b[7:0]),
  .exu1_trap_number_b(exu1_trap_number_b[7:0]),
  .exu_tlu_window_block(exu_tlu_window_block[1:0]),
  .lsu_lddf_align_b(lsu_lddf_align_b),
  .lsu_stdf_align_b(lsu_stdf_align_b),
  .lsu_illegal_inst_b(lsu_illegal_inst_b),
  .lsu_daccess_prot_b(lsu_daccess_prot_b),
  .lsu_priv_action_b(lsu_priv_action_b),
  .lsu_va_watchpoint_b(lsu_va_watchpoint_b),
  .lsu_pa_watchpoint_b(lsu_pa_watchpoint_b),
  .lsu_align_b(lsu_align_b),
  .lsu_tlb_miss_b_(lsu_tlb_miss_b_),
  .lsu_dae_invalid_asi_b(lsu_dae_invalid_asi_b),
  .lsu_dae_nc_page_b(lsu_dae_nc_page_b),
  .lsu_dae_nfo_page_b(lsu_dae_nfo_page_b),
  .lsu_dae_priv_viol_b(lsu_dae_priv_viol_b),
  .lsu_dae_so_page(lsu_dae_so_page),
  .lsu_priv_action_g(lsu_priv_action_g),
  .lsu_tid_g(lsu_tid_g[2:0]),
  .lsu_trap_flush(lsu_trap_flush[7:0]),
  .lsu_tlb_bypass_b(lsu_tlb_bypass_b),
  .lsu_tlb_real_b(lsu_tlb_real_b),
  .lsu_sync_inst_b(lsu_sync_inst_b),
  .lsu_stb_empty(lsu_stb_empty[7:0]),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
  .lsu_dcmh_err_g(lsu_dcmh_err_g),
  .lsu_dcvp_err_g(lsu_dcvp_err_g),
  .lsu_dctp_err_g(lsu_dctp_err_g),
  .lsu_dcdp_err_g(lsu_dcdp_err_g),
  .lsu_dcl2c_err_g(lsu_dcl2c_err_g),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_dcsoc_err_g(lsu_dcsoc_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_dcerr_sfar_g(lsu_dcerr_sfar_g[8:0]),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_sbdpc_err_g(lsu_sbdpc_err_g),
  .lsu_sbdpu_err_g(lsu_sbdpu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lsu_stberr_index_g(lsu_stberr_index_g[2:0]),
  .lsu_stberr_priv_g(lsu_stberr_priv_g[1:0]),
  .lsu_stb_flush_g(lsu_stb_flush_g),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_perfmon_trap_b(lsu_perfmon_trap_b),
  .lsu_perfmon_trap_g(lsu_perfmon_trap_g),
  .lsu_ext_interrupt(lsu_ext_interrupt),
  .lsu_ext_int_type(lsu_ext_int_type[1:0]),
  .lsu_ext_int_vec(lsu_ext_int_vec[5:0]),
  .lsu_ext_int_tid(lsu_ext_int_tid[2:0]),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .fgu_pdist_beat2_fx1(fgu_pdist_beat2_fx1),
  .fgu_predict_fx2(fgu_predict_fx2),
  .fgu_ecc_addr_fx2(fgu_ecc_addr_fx2[5:0]),
  .fgu_ecc_check_fx2(fgu_ecc_check_fx2[13:0]),
  .fgu_fpx_ieee_trap_fw(fgu_fpx_ieee_trap_fw),
  .fgu_fpd_ieee_trap_fw(fgu_fpd_ieee_trap_fw),
  .fgu_fpx_unfin_fw(fgu_fpx_unfin_fw),
  .fgu_fpx_trap_tid_fw(fgu_fpx_trap_tid_fw[2:0]),
  .fgu_fpd_unfin_fw(fgu_fpd_unfin_fw),
  .fgu_fpd_idiv0_trap_fw(fgu_fpd_idiv0_trap_fw),
  .fgu_fpd_trap_tid_fw(fgu_fpd_trap_tid_fw[2:0]),
  .mmu_hw_tw_enable(mmu_hw_tw_enable[7:0]),
  .mmu_write_itlb(mmu_write_itlb[7:0]),
  .mmu_reload_done(mmu_reload_done[7:0]),
  .mmu_i_unauth_access(mmu_i_unauth_access[7:0]),
  .mmu_i_tsb_miss(mmu_i_tsb_miss[7:0]),
  .mmu_d_tsb_miss(mmu_d_tsb_miss[7:0]),
  .mmu_i_tte_outofrange(mmu_i_tte_outofrange[7:0]),
  .mmu_d_tte_outofrange(mmu_d_tte_outofrange[7:0]),
  .mmu_itte_tag_data(mmu_itte_tag_data[47:0]),
  .mmu_asi_data(mmu_asi_data[64:0]),
  .mmu_asi_read(mmu_asi_read),
  .mmu_dae_req(mmu_dae_req),
  .mmu_dae_tid(mmu_dae_tid[2:0]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_tid(mmu_asi_tid[2:0]),
  .mmu_asi_index(mmu_asi_index[10:0]),
  .mmu_asi_mra_not_sca(mmu_asi_mra_not_sca),
  .mmu_i_l2cerr(mmu_i_l2cerr[7:0]),
  .mmu_d_l2cerr(mmu_d_l2cerr[7:0]),
  .mmu_i_eccerr(mmu_i_eccerr[7:0]),
  .mmu_d_eccerr(mmu_d_eccerr[7:0]),
  .mmu_thr0_err_type(mmu_thr0_err_type[2:0]),
  .mmu_thr1_err_type(mmu_thr1_err_type[2:0]),
  .mmu_thr2_err_type(mmu_thr2_err_type[2:0]),
  .mmu_thr3_err_type(mmu_thr3_err_type[2:0]),
  .mmu_thr4_err_type(mmu_thr4_err_type[2:0]),
  .mmu_thr5_err_type(mmu_thr5_err_type[2:0]),
  .mmu_thr6_err_type(mmu_thr6_err_type[2:0]),
  .mmu_thr7_err_type(mmu_thr7_err_type[2:0]),
  .mmu_thr0_err_index(mmu_thr0_err_index[2:0]),
  .mmu_thr1_err_index(mmu_thr1_err_index[2:0]),
  .mmu_thr2_err_index(mmu_thr2_err_index[2:0]),
  .mmu_thr3_err_index(mmu_thr3_err_index[2:0]),
  .mmu_thr4_err_index(mmu_thr4_err_index[2:0]),
  .mmu_thr5_err_index(mmu_thr5_err_index[2:0]),
  .mmu_thr6_err_index(mmu_thr6_err_index[2:0]),
  .mmu_thr7_err_index(mmu_thr7_err_index[2:0]),
  .spu_tlu_cwq_busy(spu_tlu_cwq_busy),
  .spu_tlu_mamu_err_req(spu_tlu_mamu_err_req[10:0]),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[4:0]),
  .spu_tlu_cwq_int_req(spu_tlu_cwq_int_req[3:0]),
  .spu_tlu_l2_error(spu_tlu_l2_error[5:0]),
  .pmu_tlu_trap_m(pmu_tlu_trap_m[7:0]),
  .pmu_tlu_debug_event(pmu_tlu_debug_event[7:0]),
  .tlu_core_running_status(tlu_core_running_status[7:0]),
  .tlu_ss_complete(tlu_ss_complete),
  .tlu_hardstop_request(tlu_hardstop_request),
  .tlu_softstop_request(tlu_softstop_request),
  .tlu_trigger_pulse(tlu_trigger_pulse),
  .tlu_dbg_instr_cmt_grp0(tlu_dbg_instr_cmt_grp0[1:0]),
  .tlu_dbg_instr_cmt_grp1(tlu_dbg_instr_cmt_grp1[1:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .tlu_window_block(tlu_window_block[1:0]),
  .tlu_retry_state(tlu_retry_state[7:0]),
  .tlu_halted(tlu_halted[7:0]),
  .tlu_pc_0_d(tlu_pc_0_d[47:2]),
  .tlu_pc_1_d(tlu_pc_1_d[47:2]),
  .tlu_flush_exu_b(tlu_flush_exu_b[1:0]),
  .tlu_ccr_0(tlu_ccr_0[7:0]),
  .tlu_ccr_1(tlu_ccr_1[7:0]),
  .tlu_cwp_0(tlu_cwp_0[2:0]),
  .tlu_cwp_1(tlu_cwp_1[2:0]),
  .tlu_ccr_cwp_0_valid(tlu_ccr_cwp_0_valid),
  .tlu_ccr_cwp_1_valid(tlu_ccr_cwp_1_valid),
  .tlu_ccr_cwp_0_tid(tlu_ccr_cwp_0_tid[1:0]),
  .tlu_ccr_cwp_1_tid(tlu_ccr_cwp_1_tid[1:0]),
  .tlu_gl0(tlu_gl0[1:0]),
  .tlu_gl1(tlu_gl1[1:0]),
  .tlu_gl2(tlu_gl2[1:0]),
  .tlu_gl3(tlu_gl3[1:0]),
  .tlu_gl4(tlu_gl4[1:0]),
  .tlu_gl5(tlu_gl5[1:0]),
  .tlu_gl6(tlu_gl6[1:0]),
  .tlu_gl7(tlu_gl7[1:0]),
  .tlu_itlb_bypass_e(tlu_itlb_bypass_e[1:0]),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .tlu_flush_fgu_b(tlu_flush_fgu_b),
  .tlu_trap_pc_0(tlu_trap_pc_0[47:0]),
  .tlu_trap_pc_0_valid(tlu_trap_pc_0_valid),
  .tlu_trap_0_tid(tlu_trap_0_tid[1:0]),
  .tlu_trap_pc_1(tlu_trap_pc_1[47:0]),
  .tlu_trap_pc_1_valid(tlu_trap_pc_1_valid),
  .tlu_trap_1_tid(tlu_trap_1_tid[1:0]),
  .tlu_retry(tlu_retry[1:0]),
  .tlu_ifu_invalidate(tlu_ifu_invalidate[1:0]),
  .tlu_itlb_reload(tlu_itlb_reload[1:0]),
  .tlu_itlb_bypass(tlu_itlb_bypass[7:0]),
  .tlu_release_tte(tlu_release_tte[7:0]),
  .tlu_rngf_cdbus(tlu_rngf_cdbus[64:0]),
  .tlu_rngf_cdbus_error(tlu_rngf_cdbus_error),
  .tlu_asi_0(tlu_asi_0[7:0]),
  .tlu_asi_1(tlu_asi_1[7:0]),
  .tlu_asi_0_valid(tlu_asi_0_valid),
  .tlu_asi_1_valid(tlu_asi_1_valid),
  .tlu_asi_0_tid(tlu_asi_0_tid[1:0]),
  .tlu_asi_1_tid(tlu_asi_1_tid[1:0]),
  .tlu_tl_gt_0(tlu_tl_gt_0[7:0]),
  .tlu_lsu_clear_ctl_reg_(tlu_lsu_clear_ctl_reg_[7:0]),
  .tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[7:0]),
  .tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[7:0]),
  .tlu_load_d_tag_access(tlu_load_d_tag_access[7:0]),
  .tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[7:0]),
  .tlu_npc_w(tlu_npc_w[47:2]),
  .tlu_pc_0_w(tlu_pc_0_w[47:13]),
  .tlu_pc_1_w(tlu_pc_1_w[47:13]),
  .tlu_iht_request(tlu_iht_request[7:0]),
  .tlu_dht_request(tlu_dht_request[7:0]),
  .tlu_mmu_tl_gt_0(tlu_mmu_tl_gt_0[7:0]),
  .tlu_flush_pmu_b(tlu_flush_pmu_b[1:0]),
  .tlu_flush_pmu_w(tlu_flush_pmu_w[1:0]),
  .tlu_pmu_trap_taken(tlu_pmu_trap_taken[7:0]),
  .tlu_pmu_trap_mask_e(tlu_pmu_trap_mask_e[1:0]),
  .tlu_lsu_hpstate_hpriv(tlu_lsu_hpstate_hpriv[7:0]),
  .tlu_lsu_pstate_priv(tlu_lsu_pstate_priv[7:0]),
  .tlu_ifu_hpstate_hpriv(tlu_ifu_hpstate_hpriv[7:0]),
  .tlu_ifu_pstate_priv(tlu_ifu_pstate_priv[7:0]),
  .tlu_pmu_hpstate_hpriv(tlu_pmu_hpstate_hpriv[7:0]),
  .tlu_pmu_pstate_priv(tlu_pmu_pstate_priv[7:0]),
  .tlu_dec_hpstate_hpriv(tlu_dec_hpstate_hpriv[7:0]),
  .tlu_dec_pstate_priv(tlu_dec_pstate_priv[7:0]),
  .tlu_dec_pstate_pef(tlu_dec_pstate_pef[7:0]),
  .tlu_pstate_cle(tlu_pstate_cle[7:0]),
  .tlu_pstate_am(tlu_pstate_am[7:0]),
  .tlu_cerer_ittp(tlu_cerer_ittp),
  .tlu_cerer_itdp(tlu_cerer_itdp),
  .tlu_cerer_ittm(tlu_cerer_ittm),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu),
  .tlu_cerer_hwtwl2(tlu_cerer_hwtwl2),
  .tlu_cerer_icl2c(tlu_cerer_icl2c),
  .tlu_cerer_icl2u(tlu_cerer_icl2u),
  .tlu_cerer_icl2nd(tlu_cerer_icl2nd),
  .tlu_cerer_irf(tlu_cerer_irf),
  .tlu_cerer_frf(tlu_cerer_frf),
  .tlu_cerer_dttp(tlu_cerer_dttp),
  .tlu_cerer_dttm(tlu_cerer_dttm),
  .tlu_cerer_dtdp(tlu_cerer_dtdp),
  .tlu_cerer_dcl2c(tlu_cerer_dcl2c),
  .tlu_cerer_dcl2u(tlu_cerer_dcl2u),
  .tlu_cerer_dcl2nd(tlu_cerer_dcl2nd),
  .tlu_cerer_sbdlc(tlu_cerer_sbdlc),
  .tlu_cerer_sbdlu(tlu_cerer_sbdlu),
  .tlu_cerer_mrau(tlu_cerer_mrau),
  .tlu_cerer_scac(tlu_cerer_scac),
  .tlu_cerer_scau(tlu_cerer_scau),
  .tlu_cerer_sbapp(tlu_cerer_sbapp),
  .tlu_cerer_l2c_socc(tlu_cerer_l2c_socc),
  .tlu_cerer_l2u_socu(tlu_cerer_l2u_socu),
  .tlu_cerer_icvp(tlu_cerer_icvp),
  .tlu_cerer_ictp(tlu_cerer_ictp),
  .tlu_cerer_ictm(tlu_cerer_ictm),
  .tlu_cerer_icdp(tlu_cerer_icdp),
  .tlu_cerer_dcvp(tlu_cerer_dcvp),
  .tlu_cerer_dctp(tlu_cerer_dctp),
  .tlu_cerer_dctm(tlu_cerer_dctm),
  .tlu_cerer_dcdp(tlu_cerer_dcdp),
  .tlu_cerer_sbdpc(tlu_cerer_sbdpc),
  .tlu_cerer_sbdpu(tlu_cerer_sbdpu),
  .tlu_cerer_mamu(tlu_cerer_mamu),
  .tlu_cerer_mal2c(tlu_cerer_mal2c),
  .tlu_cerer_mal2u(tlu_cerer_mal2u),
  .tlu_cerer_mal2nd(tlu_cerer_mal2nd),
  .tlu_cerer_cwql2c(tlu_cerer_cwql2c),
  .tlu_cerer_cwql2u(tlu_cerer_cwql2u),
  .tlu_cerer_cwql2nd(tlu_cerer_cwql2nd),
  .tlu_cerer_sbdiou(tlu_cerer_sbdiou),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_tag_access_tid_0_b(tlu_tag_access_tid_0_b[1:0]),
  .tlu_i_tag_access_0_b(tlu_i_tag_access_0_b),
  .tlu_d_tag_access_0_b(tlu_d_tag_access_0_b),
  .tlu_tag_access_tid_1_b(tlu_tag_access_tid_1_b[1:0]),
  .tlu_i_tag_access_1_b(tlu_i_tag_access_1_b),
  .tlu_d_tag_access_1_b(tlu_d_tag_access_1_b),
  .tlu_mbi_tsa0_fail(tlu_mbi_tsa0_fail),
  .tlu_mbi_tsa1_fail(tlu_mbi_tsa1_fail),
  .tlu_mbi_tca_fail(tlu_mbi_tca_fail),
  .tlu_spec_enable(tlu_spec_enable[7:0])
);



lsu lsu (
	// I/O flops tacked onto front of LSU chain
	.scan_in(msf0_scanout),
	.scan_out(lsu_scanout),
	.wmr_scan_in(fgu_wmr_scanout),
	.wmr_scan_out(lsu_wmr_scanout),
        .dmo_coresel(dmo_coresel_buff),
	.vnw_ary(vnw_ary1),
	.l2clk(l2clk),
        .tcu_array_wr_inhibit   (clk_array_wr_inhibit),
        .dmo_dcmuxctl		(dmo_dcmuxctl_buf	),
        .tcu_pce_ov		(pce_ov_br		),
        .tcu_scan_en		(lb_scan_en_br		),
	.spc_aclk               (spc_aclk_br            ),
	.spc_aclk_wmr           (spc_aclk_wmr_br        ),
	.spc_bclk               (spc_bclk_br            ),
        .tcu_se_scancollar_in  	(lb_se_sc_in		),
        .tcu_se_scancollar_out	(lb_se_sc_out		),
	.fgu_lsu_fst_data_fx1	(fgu_lsu_fst_data_fx1[63:0]),
	.cpx_spc_data_cx	(cpx_spc_data_cx_rep0[145:0]	),
	.rngl_lsu_cdbus		(exu1_rngl_cdbus[64:0]	),
	.tlu_rngf_cdbus		(tlu_rngf_cdbus[64:0]	),
	.tlu_tte		(tlu_rngf_cdbus[54:0]	),
        .lbist_run		(lb_lbist_running	),
	.mbi_addr		(mb0_addr[8:0]		),
	.mbi_run		(mb0_run		),
	.mbi_wdata		(mb0_write_data[7:0]	),
	.mbi_cmpsel		(mb0_cmpsel[1:0]        ),
	.mbi_dca_read_en	(mb0_dca_read_en        ),
	.mbi_dca_write_en	(mb0_dca_write_en       ),
	.mbi_dta_read_en	(mb0_dta_read_en        ),
	.mbi_dta_write_en	(mb0_dta_write_en       ),
	.mbi_dva_read_en	(mb0_dva_read_en        ),
	.mbi_dva_write_en	(mb0_dva_write_en       ),
	.mbi_lru_read_en	(mb0_lru_read_en        ),
	.mbi_lru_write_en	(mb0_lru_write_en       ),
	.mbi_dtb_read_en	(mb0_dtb_read_en        ),
	.mbi_dtb_write_en	(mb0_dtb_write_en       ),
	.mbi_stb_cam_read_en	(mb0_stb_cam_read_en    ),
	.mbi_stb_cam_write_en	(mb0_stb_cam_write_en   ),
	.mbi_stb_ram_read_en	(mb0_stb_ram_read_en    ),
	.mbi_stb_ram_write_en	(mb0_stb_ram_write_en   ),
	.mbi_cpq_read_en	(mb0_cpq_read_en        ),
	.mbi_cpq_write_en	(mb0_cpq_write_en       ),
        .efu_spc_fuse_data	(efu_spc_fuse_data_buf  ),
        .efu_spc_fuse_dxfer_en	(efu_spc_fuse_dxfer_en_buf),
        .efu_spc_fuse_dclr	(efu_spc_fuse_dclr_buf	),
        .spc_efu_fuse_ddata	(spc_efu_fuse_ddata_buf	),
        .spc_efu_fuse_dxfer_en	(spc_efu_fuse_dxfer_en_buf),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .const_cpuid(const_cpuid[2:0]),
  .ifu_lsu_if_vld(ifu_lsu_if_vld),
  .ifu_lsu_if_tid(ifu_lsu_if_tid[2:0]),
  .ifu_lsu_if_addr(ifu_lsu_if_addr[10:5]),
  .lsu_ifu_ctxt_data(lsu_ifu_ctxt_data[12:0]),
  .lsu_ifu_tid_w(lsu_ifu_tid_w[2:0]),
  .lsu_ifu_wr_p0ctxt(lsu_ifu_wr_p0ctxt),
  .lsu_ifu_wr_p1ctxt(lsu_ifu_wr_p1ctxt),
  .lsu_ifu_wr_pid(lsu_ifu_wr_pid),
  .lsu_immu_enable(lsu_immu_enable[7:0]),
  .lsu_ic_enable(lsu_ic_enable[7:0]),
  .lsu_ifu_ld_index(lsu_ifu_ld_index[10:5]),
  .lsu_ifu_direct_map(lsu_ifu_direct_map),
  .lsu_ifu_no_miss(lsu_ifu_no_miss[7:0]),
  .lsu_cpx_data(lsu_cpx_data[127:0]),
  .lsu_cpx_cpkt(lsu_cpx_cpkt[17:0]),
  .lsu_cpx_valid(lsu_cpx_valid),
  .dec_lsu_tg_d(dec_lsu_tg_d),
  .dec_ld_inst_d(dec_ld_inst_d),
  .dec_ld_inst_e(dec_ld_inst_e),
  .dec_st_inst_e(dec_st_inst_e),
  .dec_fpldst_inst_e(dec_fpldst_inst_e),
  .dec_fsr_ldst_e(dec_fsr_ldst_e),
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
  .dec_ldst_sz_e(dec_ldst_sz_e[1:0]),
  .dec_lsu_rd_e(dec_lsu_rd_e[4:0]),
  .dec_sraddr_e(dec_sraddr_e[4:0]),
  .dec_imm_asi_vld_d(dec_imm_asi_vld_d),
  .dec_imm_asi_d(dec_imm_asi_d[7:0]),
  .dec_frf_r2_addr_e(dec_frf_r2_addr_e[4:3]),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .dec_lsu_tid0_d(dec_lsu_tid0_d[1:0]),
  .dec_lsu_tid1_d(dec_lsu_tid1_d[1:0]),
  .lsu_block_store_stall(lsu_block_store_stall),
  .lsu_block_store_rd(lsu_block_store_rd[4:3]),
  .lsu_block_store_tid(lsu_block_store_tid[2:0]),
  .lsu_cpq_stall(lsu_cpq_stall),
  .lsu_sync(lsu_sync[7:0]),
  .lsu_complete(lsu_complete[7:0]),
  .lsu_stb_alloc(lsu_stb_alloc[7:0]),
  .lsu_stb_dealloc(lsu_stb_dealloc[7:0]),
  .lsu_block_store_kill(lsu_block_store_kill[7:0]),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .tlu_pstate_cle(tlu_pstate_cle[7:0]),
  .tlu_asi_0(tlu_asi_0[7:0]),
  .tlu_asi_1(tlu_asi_1[7:0]),
  .tlu_asi_0_tid(tlu_asi_0_tid[1:0]),
  .tlu_asi_1_tid(tlu_asi_1_tid[1:0]),
  .tlu_asi_0_valid(tlu_asi_0_valid),
  .tlu_asi_1_valid(tlu_asi_1_valid),
  .tlu_lsu_hpstate_hpriv(tlu_lsu_hpstate_hpriv[7:0]),
  .tlu_lsu_pstate_priv(tlu_lsu_pstate_priv[7:0]),
  .tlu_tl_gt_0(tlu_tl_gt_0[7:0]),
  .tlu_lsu_clear_ctl_reg_(tlu_lsu_clear_ctl_reg_[7:0]),
  .tlu_cerer_dttp(tlu_cerer_dttp),
  .tlu_cerer_dttm(tlu_cerer_dttm),
  .tlu_cerer_dtdp(tlu_cerer_dtdp),
  .tlu_cerer_dcvp(tlu_cerer_dcvp),
  .tlu_cerer_dctp(tlu_cerer_dctp),
  .tlu_cerer_dctm(tlu_cerer_dctm),
  .tlu_cerer_dcdp(tlu_cerer_dcdp),
  .tlu_cerer_dcl2c(tlu_cerer_dcl2c),
  .tlu_cerer_dcl2u(tlu_cerer_dcl2u),
  .tlu_cerer_dcl2nd(tlu_cerer_dcl2nd),
  .tlu_cerer_sbdlc(tlu_cerer_sbdlc),
  .tlu_cerer_sbdlu(tlu_cerer_sbdlu),
  .tlu_cerer_sbapp(tlu_cerer_sbapp),
  .tlu_cerer_sbdiou(tlu_cerer_sbdiou),
  .tlu_cerer_sbdpc(tlu_cerer_sbdpc),
  .tlu_cerer_sbdpu(tlu_cerer_sbdpu),
  .tlu_cerer_l2c_socc(tlu_cerer_l2c_socc),
  .tlu_cerer_l2u_socu(tlu_cerer_l2u_socu),
  .lsu_stb_empty(lsu_stb_empty[7:0]),
  .lsu_trap_flush(lsu_trap_flush[7:0]),
  .lsu_tlb_bypass_b(lsu_tlb_bypass_b),
  .lsu_tlb_real_b(lsu_tlb_real_b),
  .lsu_align_b(lsu_align_b),
  .lsu_lddf_align_b(lsu_lddf_align_b),
  .lsu_stdf_align_b(lsu_stdf_align_b),
  .lsu_dae_invalid_asi_b(lsu_dae_invalid_asi_b),
  .lsu_dae_nc_page_b(lsu_dae_nc_page_b),
  .lsu_dae_nfo_page_b(lsu_dae_nfo_page_b),
  .lsu_dae_priv_viol_b(lsu_dae_priv_viol_b),
  .lsu_dae_so_page(lsu_dae_so_page),
  .lsu_priv_action_b(lsu_priv_action_b),
  .lsu_va_watchpoint_b(lsu_va_watchpoint_b),
  .lsu_pa_watchpoint_b(lsu_pa_watchpoint_b),
  .lsu_tlb_miss_b_(lsu_tlb_miss_b_),
  .lsu_illegal_inst_b(lsu_illegal_inst_b),
  .lsu_daccess_prot_b(lsu_daccess_prot_b),
  .lsu_perfmon_trap_b(lsu_perfmon_trap_b),
  .lsu_perfmon_trap_g(lsu_perfmon_trap_g),
  .lsu_priv_action_g(lsu_priv_action_g),
  .lsu_tid_g(lsu_tid_g[2:0]),
  .lsu_tlu_dsfsr_ct_b(lsu_tlu_dsfsr_ct_b[1:0]),
  .lsu_sync_inst_b(lsu_sync_inst_b),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .lsu_dcmh_err_g(lsu_dcmh_err_g),
  .lsu_dcvp_err_g(lsu_dcvp_err_g),
  .lsu_dctp_err_g(lsu_dctp_err_g),
  .lsu_dcdp_err_g(lsu_dcdp_err_g),
  .lsu_dcl2c_err_g(lsu_dcl2c_err_g),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_dcsoc_err_g(lsu_dcsoc_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_dcerr_sfar_g(lsu_dcerr_sfar_g[8:0]),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_sbdpc_err_g(lsu_sbdpc_err_g),
  .lsu_sbdpu_err_g(lsu_sbdpu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lsu_stberr_index_g(lsu_stberr_index_g[2:0]),
  .lsu_stberr_priv_g(lsu_stberr_priv_g[1:0]),
  .lsu_stb_flush_g(lsu_stb_flush_g),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_ext_interrupt(lsu_ext_interrupt),
  .lsu_ext_int_type(lsu_ext_int_type[1:0]),
  .lsu_ext_int_vec(lsu_ext_int_vec[5:0]),
  .lsu_ext_int_tid(lsu_ext_int_tid[2:0]),
  .mmu_dtlb_reload(mmu_dtlb_reload),
  .lsu_mmu_va_b(lsu_mmu_va_b[47:0]),
  .lsu_context_b(lsu_context_b[12:0]),
  .exu_lsu_rs2_e(exu_lsu_rs2_e[7:0]),
  .exu_lsu_address_e(exu_lsu_address_e[47:0]),
  .exu_lsu_store_data_e(exu_lsu_store_data_e[63:0]),
  .exu_lsu_va_error_m(exu_lsu_va_error_m[1:0]),
  .exu_ecc_m(exu_ecc_m[1:0]),
  .lsu_exu_ld_data_b(lsu_exu_ld_data_b[63:0]),
  .lsu_exu_ld_vld_w(lsu_exu_ld_vld_w),
  .lsu_exu_ld_b(lsu_exu_ld_b),
  .lsu_exu_rd_m(lsu_exu_rd_m[4:0]),
  .lsu_exu_tid_m(lsu_exu_tid_m[2:0]),
  .lsu_exu_address_e(lsu_exu_address_e[47:13]),
  .lsu_sel_lsu_addr_e(lsu_sel_lsu_addr_e),
  .fgu_fst_ecc_error_fx2(fgu_fst_ecc_error_fx2),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .lsu_fgu_fld_data_b(lsu_fgu_fld_data_b[63:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .lsu_fgu_fld_b(lsu_fgu_fld_b),
  .lsu_fgu_fld_addr_b(lsu_fgu_fld_addr_b[4:0]),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .lsu_fgu_fld_32b_b(lsu_fgu_fld_32b_b),
  .lsu_fgu_fld_odd32b_b(lsu_fgu_fld_odd32b_b),
  .lsu_fgu_fsr_load_b(lsu_fgu_fsr_load_b),
  .lsu_fgu_exception_w(lsu_fgu_exception_w),
  .lsu_block_store_m(lsu_block_store_m),
  .lsu_frf_read_pending(lsu_frf_read_pending),
  .pmu_lsu_dcmiss_trap_m(pmu_lsu_dcmiss_trap_m),
  .pmu_lsu_dtmiss_trap_m(pmu_lsu_dtmiss_trap_m),
  .pmu_lsu_l2dmiss_trap_m(pmu_lsu_l2dmiss_trap_m[7:0]),
  .lsu_pmu_mem_type_b(lsu_pmu_mem_type_b[2:0]),
  .l15_lsu_grant(l15_lsu_grant),
  .lsu_l15_lock(lsu_l15_lock),
  .lsu_l15_valid(lsu_l15_valid),
  .lsu_l15_addr(lsu_l15_addr[39:0]),
  .lsu_l15_cpkt(lsu_l15_cpkt[25:0]),
  .lsu_l15_data(lsu_l15_data[63:0]),
  .tlu_rngf_cdbus_error(tlu_rngf_cdbus_error),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[64:0]),
  .lsu_rngl_cdbus(lsu_rngl_cdbus[64:0]),
  .mbi_ptag_data(mbi_ptag_data),
  .lsu_mbi_dca_fail(lsu_mbi_dca_fail),
  .lsu_mbi_dta_fail(lsu_mbi_dta_fail),
  .lsu_mbi_dva_fail(lsu_mbi_dva_fail),
  .lsu_mbi_lru_fail(lsu_mbi_lru_fail),
  .lsu_mbi_dtb_fail(lsu_mbi_dtb_fail),
  .lsu_mbi_stb_cam_fail(lsu_mbi_stb_cam_fail),
  .lsu_mbi_stb_ram_fail(lsu_mbi_stb_ram_fail),
  .lsu_mbi_cpq_fail(lsu_mbi_cpq_fail),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_cambist_shift(mbi_cambist_shift),
  .mbi_dis_clr_ubit(mbi_dis_clr_ubit),
  .mbi_init_to_zero(mbi_init_to_zero),
  .mbi_dtb_cam_en_pre(mbi_dtb_cam_en_pre),
  .mbi_repl_write(mbi_repl_write),
  .mbi_dtb_demap_en(mbi_dtb_demap_en),
  .mbi_demap_type(mbi_demap_type[1:0]),
  .lsu_mbi_tlb_data_cmp(lsu_mbi_tlb_data_cmp),
  .lsu_mbi_tlb_cam_hit(lsu_mbi_tlb_cam_hit),
  .lsu_mbi_tlb_cam_mhit(lsu_mbi_tlb_cam_mhit),
  .lsu_mbi_tlb_ctxt0_hit(lsu_mbi_tlb_ctxt0_hit),
  .lsu_mbi_tlb_valid(lsu_mbi_tlb_valid),
  .lsu_mbi_tlb_used(lsu_mbi_tlb_used),
  .mbi_scm_cam_en_pre(mbi_scm_cam_en_pre),
  .lsu_mbi_scm_hit(lsu_mbi_scm_hit),
  .lsu_mbi_scm_mhit(lsu_mbi_scm_mhit),
  .lsu_mbi_scm_hit_ptr(lsu_mbi_scm_hit_ptr[2:0]),
  .lsu_mbi_scm_praw(lsu_mbi_scm_praw),
  .dcc_dmo_parity(dcc_dmo_parity[3:0]),
  .lsu_ic_pmen(lsu_ic_pmen),
  .lsu_ifu_cmu_pmen(lsu_ifu_cmu_pmen),
  .lsu_ifu_ftu_pmen(lsu_ifu_ftu_pmen),
  .lsu_ifu_ibu_pmen(lsu_ifu_ibu_pmen),
  .lsu_dec_pmen(lsu_dec_pmen),
  .lsu_pku_pmen(lsu_pku_pmen),
  .lsu_exu_pmen(lsu_exu_pmen),
  .lsu_fgu_pmen(lsu_fgu_pmen),
  .lsu_tlu_pmen(lsu_tlu_pmen),
  .lsu_gkt_pmen(lsu_gkt_pmen),
  .lsu_spu_pmen(lsu_spu_pmen),
  .lsu_mmu_pmen(lsu_mmu_pmen),
  .lsu_pmu_pmen(lsu_pmu_pmen),
  .lsu_misc_pmen(lsu_misc_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .slow_cmp_sync_en(slow_cmp_sync_en),
  .cmp_slow_sync_en(cmp_slow_sync_en)
);

//assign lsu_rngf_cdbus[64:0] = {lsu_ring_ctl,lsu_rngf_cdbus_b63,lsu_ring_cdbus[62:0]};
//assign lsu_rngl_cdbus[64:0] = {lsu_ring_ctl,lsu_rngl_cdbus_b63,lsu_ring_cdbus[62:0]};


spu spu (
	.scan_in(spu_scanin),
	.scan_out(spu_scanout),
	.l2clk(l2clk),
	.in_rngl_cdbus	( exu0_rngl_cdbus[64:0] ),

  .spu_mbi_mam_fail_(spu_mbi_mam_fail_),
  .spu_mbi_mam_fail2_(spu_mbi_mam_fail2_),
  .spu_mbi_arf_fail_(spu_mbi_arf_fail_),
  .spu_mbi_rrf_fail_(spu_mbi_rrf_fail_),
  .spu_rngl_cdbus	( spu_rngl_cdbus[64:0]		),
  .spu_l15_valid(spu_l15_valid),
  .spu_l15_addr(spu_l15_addr[38:3]),
  .spu_l15_cpkt(spu_l15_cpkt[12:0]),
  .spu_l15_data(spu_l15_data[63:0]),
  .spu_mult_request(spu_mult_request),
  .spu_fgu_rs1_e(spu_fgu_rs1_e[63:0]),
  .spu_fgu_rs2_e(spu_fgu_rs2_e[63:0]),
  .spu_fgu_fpy_ctl_d(spu_fgu_fpy_ctl_d[6:0]),
  .spu_pmu_cwq_busy(spu_pmu_cwq_busy[4:0]),
  .spu_pmu_cwq_tid(spu_pmu_cwq_tid[2:0]),
  .spu_pmu_ma_busy(spu_pmu_ma_busy[3:0]),
  .spu_tlu_cwq_busy(spu_tlu_cwq_busy),
  .spu_tlu_cwq_int_req(spu_tlu_cwq_int_req[3:0]),
  .spu_tlu_ma_int_req(spu_tlu_ma_int_req[4:0]),
  .spu_tlu_mamu_err_req(spu_tlu_mamu_err_req[10:0]),
  .spu_tlu_l2_error(spu_tlu_l2_error[5:0])

);



mmu mmu (
	.scan_in(mmu_scanin),
	.scan_out(mmu_scanout),
	.wmr_scan_in(tlu_wmr_scanout),
	.wmr_scan_out(mmu_wmr_scanout),
	.l2clk			(l2clk				),
        .tcu_dectest		(tcu_dectest_buf		),
        .tcu_muxtest		(tcu_muxtest_buf		),
        .tcu_array_wr_inhibit	(clk_array_wr_inhibit	),
        .tcu_pce_ov		(pce_ov_tl		),
        .tcu_scan_en		(lb_scan_en_tl		),
	.spc_aclk               (spc_aclk_tl            ),
	.spc_aclk_wmr           (spc_aclk_wmr_tl        ),
	.spc_bclk               (spc_bclk_tl            ),
        .tcu_se_scancollar_in	(lb_se_sc_in			),
	.l15_mmu_cpkt		(l15_spc_cpkt[17:0]	),
	.l15_spc_data1		(l15_spc_data1[127:0]	),
	.mbi_mra0_write_en	(mb1_mra0_write_en		),
	.mbi_mra1_write_en	(mb1_mra1_write_en		),
	.mbi_scp0_write_en	(mb1_scp0_write_en		),
	.mbi_scp1_write_en	(mb1_scp1_write_en		),
	.mbi_addr		(mb1_addr[4:0]			),
	.mbi_run		(mb1_run			),
	.mbi_wdata		(mb1_write_data[7:0]		),
	.mbi_mra0_read_en	(mb1_mra0_read_en		),
	.mbi_mra1_read_en	(mb1_mra1_read_en		),
	.mbi_scp0_read_en	(mb1_scp0_read_en		),
	.mbi_scp1_read_en	(mb1_scp1_read_en		),
	.mbi_mmu_cmpsel		(mb1_cmpsel[1:0]		),
	.lsu_va_b		(lsu_mmu_va_b[47:0]	),
	.lsu_rngf_cdbus		(lsu_rngf_cdbus[64:0]	),
	.spc_core_running_status(tlu_core_running_status[7:0]),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .lsu_mmu_pmen(lsu_mmu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .tlu_tag_access_tid_0_b(tlu_tag_access_tid_0_b[1:0]),
  .tlu_i_tag_access_0_b(tlu_i_tag_access_0_b),
  .tlu_d_tag_access_0_b(tlu_d_tag_access_0_b),
  .tlu_tag_access_tid_1_b(tlu_tag_access_tid_1_b[1:0]),
  .tlu_i_tag_access_1_b(tlu_i_tag_access_1_b),
  .tlu_d_tag_access_1_b(tlu_d_tag_access_1_b),
  .lsu_context_b(lsu_context_b[12:0]),
  .lsu_tlu_dsfsr_ct_b(lsu_tlu_dsfsr_ct_b[1:0]),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .tlu_load_i_tag_access_p(tlu_load_i_tag_access_p[7:0]),
  .tlu_load_i_tag_access_n(tlu_load_i_tag_access_n[7:0]),
  .tlu_load_d_tag_access(tlu_load_d_tag_access[7:0]),
  .tlu_load_d_tag_access_r(tlu_load_d_tag_access_r[7:0]),
  .tlu_release_tte(tlu_release_tte[7:0]),
  .tlu_pc_0_w(tlu_pc_0_w[47:13]),
  .tlu_pc_1_w(tlu_pc_1_w[47:13]),
  .tlu_iht_request(tlu_iht_request[7:0]),
  .tlu_dht_request(tlu_dht_request[7:0]),
  .tlu_mmu_tl_gt_0(tlu_mmu_tl_gt_0[7:0]),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_cerer_mrau(tlu_cerer_mrau),
  .tlu_cerer_scac(tlu_cerer_scac),
  .tlu_cerer_scau(tlu_cerer_scau),
  .tlu_cerer_hwtwmu(tlu_cerer_hwtwmu),
  .tlu_cerer_hwtwl2(tlu_cerer_hwtwl2),
  .l15_mmu_grant(l15_mmu_grant),
  .l15_mmu_valid(l15_mmu_valid),
  .mmu_mbi_mra0_fail(mmu_mbi_mra0_fail),
  .mmu_mbi_mra1_fail(mmu_mbi_mra1_fail),
  .mmu_mbi_scp0_fail(mmu_mbi_scp0_fail),
  .mmu_mbi_scp1_fail(mmu_mbi_scp1_fail),
  .mmu_l15_cpkt(mmu_l15_cpkt[4:0]),
  .mmu_l15_addr(mmu_l15_addr[39:4]),
  .mmu_l15_valid(mmu_l15_valid),
  .mmu_write_itlb(mmu_write_itlb[7:0]),
  .mmu_itte_tag_data(mmu_itte_tag_data[47:0]),
  .mmu_asi_data(mmu_asi_data[64:0]),
  .mmu_asi_read(mmu_asi_read),
  .mmu_dae_req(mmu_dae_req),
  .mmu_dae_tid(mmu_dae_tid[2:0]),
  .mmu_dtlb_reload_stall(mmu_dtlb_reload_stall),
  .mmu_dtlb_reload(mmu_dtlb_reload),
  .mmu_hw_tw_enable(mmu_hw_tw_enable[7:0]),
  .mmu_reload_done(mmu_reload_done[7:0]),
  .mmu_i_unauth_access(mmu_i_unauth_access[7:0]),
  .mmu_i_tsb_miss(mmu_i_tsb_miss[7:0]),
  .mmu_d_tsb_miss(mmu_d_tsb_miss[7:0]),
  .mmu_i_tte_outofrange(mmu_i_tte_outofrange[7:0]),
  .mmu_d_tte_outofrange(mmu_d_tte_outofrange[7:0]),
  .mmu_index(mmu_index[6:0]),
  .mmu_asi_cecc(mmu_asi_cecc),
  .mmu_asi_uecc(mmu_asi_uecc),
  .mmu_asi_tid(mmu_asi_tid[2:0]),
  .mmu_asi_index(mmu_asi_index[10:0]),
  .mmu_asi_mra_not_sca(mmu_asi_mra_not_sca),
  .mmu_i_l2cerr(mmu_i_l2cerr[7:0]),
  .mmu_d_l2cerr(mmu_d_l2cerr[7:0]),
  .mmu_i_eccerr(mmu_i_eccerr[7:0]),
  .mmu_d_eccerr(mmu_d_eccerr[7:0]),
  .mmu_thr0_err_type(mmu_thr0_err_type[2:0]),
  .mmu_thr1_err_type(mmu_thr1_err_type[2:0]),
  .mmu_thr2_err_type(mmu_thr2_err_type[2:0]),
  .mmu_thr3_err_type(mmu_thr3_err_type[2:0]),
  .mmu_thr4_err_type(mmu_thr4_err_type[2:0]),
  .mmu_thr5_err_type(mmu_thr5_err_type[2:0]),
  .mmu_thr6_err_type(mmu_thr6_err_type[2:0]),
  .mmu_thr7_err_type(mmu_thr7_err_type[2:0]),
  .mmu_thr0_err_index(mmu_thr0_err_index[2:0]),
  .mmu_thr1_err_index(mmu_thr1_err_index[2:0]),
  .mmu_thr2_err_index(mmu_thr2_err_index[2:0]),
  .mmu_thr3_err_index(mmu_thr3_err_index[2:0]),
  .mmu_thr4_err_index(mmu_thr4_err_index[2:0]),
  .mmu_thr5_err_index(mmu_thr5_err_index[2:0]),
  .mmu_thr6_err_index(mmu_thr6_err_index[2:0]),
  .mmu_thr7_err_index(mmu_thr7_err_index[2:0]),
  .mmu_pmu_l2ret(mmu_pmu_l2ret),
  .mmu_pmu_l2miss(mmu_pmu_l2miss),
  .mmu_pmu_dtlb(mmu_pmu_dtlb),
  .mmu_pmu_tid(mmu_pmu_tid[2:0])
);


pmu pmu (
	.scan_in(mmu_scanout),
	.scan_out(pmu_scanout),
	.l2clk(l2clk),
        .tcu_pce_ov			(pce_ov_tl),
        .tcu_scan_en			(lb_scan_en_tl),
	.spc_aclk               	(spc_aclk_tl),
	.spc_bclk               	(spc_bclk_tl),
        .in_rngl_cdbus			(spu_rngl_cdbus[64:0]),
        .pmu_rngl_cdbus			(pmu_rngl_cdbus[64:0]),
	.dec_pmu_instr0_type_d		({dec_valid0_d,dec_tid0_d[1:0],dec_instr0_type_d[9:0]}),
	.dec_pmu_instr1_type_d		({dec_valid1_d,dec_tid1_d[1:0],dec_instr1_type_d[9:0]}),
	.dec_valid_e			(dec_pmu_valid_e[1:0]),
	.lsu_pmu_mem_type_b		({lsu_dcerr_tid_g[2:0],lsu_pmu_mem_type_b[2:0]}),
  .lsu_pmu_pmen(lsu_pmu_pmen),
  .lsu_asi_clken(lsu_asi_clken),
  .dec_br_taken_e(dec_br_taken_e[1:0]),
  .dec_lsu_sel0_d(dec_lsu_sel0_d),
  .mmu_pmu_l2ret(mmu_pmu_l2ret),
  .mmu_pmu_l2miss(mmu_pmu_l2miss),
  .mmu_pmu_dtlb(mmu_pmu_dtlb),
  .mmu_pmu_tid(mmu_pmu_tid[2:0]),
  .l15_pmu_xbar_optype(l15_pmu_xbar_optype[6:0]),
  .spu_pmu_cwq_busy(spu_pmu_cwq_busy[4:0]),
  .spu_pmu_cwq_tid(spu_pmu_cwq_tid[2:0]),
  .spu_pmu_ma_busy(spu_pmu_ma_busy[3:0]),
  .tlu_pmu_pstate_priv(tlu_pmu_pstate_priv[7:0]),
  .tlu_pmu_hpstate_hpriv(tlu_pmu_hpstate_hpriv[7:0]),
  .tlu_pmu_trap_taken(tlu_pmu_trap_taken[7:0]),
  .tlu_pmu_trap_mask_e(tlu_pmu_trap_mask_e[1:0]),
  .dec_flush_m(dec_flush_m[1:0]),
  .dec_flush_b(dec_flush_b[1:0]),
  .tlu_flush_pmu_b(tlu_flush_pmu_b[1:0]),
  .tlu_flush_pmu_w(tlu_flush_pmu_w[1:0]),
  .pmu_tlu_trap_m(pmu_tlu_trap_m[7:0]),
  .pmu_tlu_debug_event(pmu_tlu_debug_event[7:0]),
  .pmu_lsu_dcmiss_trap_m(pmu_lsu_dcmiss_trap_m),
  .pmu_lsu_dtmiss_trap_m(pmu_lsu_dtmiss_trap_m),
  .pmu_lsu_l2dmiss_trap_m(pmu_lsu_l2dmiss_trap_m[7:0])
);


////////////////////
// MBIST controllers

spc_mb0_ctl mb0 (
	.scan_in(mb0_scanin),
	.scan_out(mb0_scanout),
        .tcu_pce_ov			(pce_ov_br),
        .tcu_scan_en			(lb_scan_en_br),
	.tcu_aclk               	(spc_aclk_br),
	.tcu_bclk               	(spc_bclk_br),
        .tcu_clk_stop(1'b0),
	.l2clk				(l2clk),
	.mbist_start			(tcu_spc_mbist_start_buf0),
	.mbist_user_mode		(msf0_mbist_user_mode_ff),
	.mbist_bisi_mode		(msf0_mbist_bisi_en_ff),
    .mb2_mb0_fail   (mb2_mb0_fail),
    .mb1_mb0_fail   (mb1_mb0_fail),
    .mb2_mb0_done   (mb2_mb0_done),
    .mb1_mb0_done   (mb1_mb0_done),
        .mb0_cmpsel                     (mb0_cmpsel[2:0]),
        .mb0_mbist_fail			(spc_mbist_fail_buf),
        .mb0_done                       (spc_mbist_done_buf),
        .mb0_addr                       ({mb0_addr_unused[15:12],mb0_addr[11:0]}),
  .mb0_run(mb0_run),
  .mb0_ict_read_en(mb0_ict_read_en),
  .mb0_ict_write_en(mb0_ict_write_en),
  .mb0_icd_read_en(mb0_icd_read_en),
  .mb0_icd_write_en(mb0_icd_write_en),
  .mb0_icv_read_en(mb0_icv_read_en),
  .mb0_icv_write_en(mb0_icv_write_en),
  .mb0_itb_read_en(mb0_itb_read_en),
  .mb0_itb_write_en(mb0_itb_write_en),
  .mb0_write_data(mb0_write_data[7:0]),
  .mb0_dca_read_en(mb0_dca_read_en),
  .mb0_dca_write_en(mb0_dca_write_en),
  .mb0_dta_read_en(mb0_dta_read_en),
  .mb0_dta_write_en(mb0_dta_write_en),
  .mb0_dva_read_en(mb0_dva_read_en),
  .mb0_dva_write_en(mb0_dva_write_en),
  .mb0_lru_read_en(mb0_lru_read_en),
  .mb0_lru_write_en(mb0_lru_write_en),
  .mb0_dtb_read_en(mb0_dtb_read_en),
  .mb0_dtb_write_en(mb0_dtb_write_en),
  .mb0_stb_cam_read_en(mb0_stb_cam_read_en),
  .mb0_stb_cam_write_en(mb0_stb_cam_write_en),
  .mb0_stb_ram_read_en(mb0_stb_ram_read_en),
  .mb0_stb_ram_write_en(mb0_stb_ram_write_en),
  .mb0_cpq_read_en(mb0_cpq_read_en),
  .mb0_cpq_write_en(mb0_cpq_write_en),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_cambist_shift(mbi_cambist_shift),
  .mbi_dis_clr_ubit(mbi_dis_clr_ubit),
  .mbi_init_to_zero(mbi_init_to_zero),
  .mbi_dtb_cam_en_pre(mbi_dtb_cam_en_pre),
  .mbi_dtb_demap_en(mbi_dtb_demap_en),
  .mbi_itb_cam_en_pre(mbi_itb_cam_en_pre),
  .mbi_itb_demap_en(mbi_itb_demap_en),
  .mbi_repl_write(mbi_repl_write),
  .mbi_demap_type(mbi_demap_type[1:0]),
  .mbi_ptag_data(mbi_ptag_data),
  .mbi_scm_cam_en_pre(mbi_scm_cam_en_pre),
  .lsu_misc_pmen(lsu_misc_pmen),
  .lsu_mbi_dca_fail(lsu_mbi_dca_fail),
  .lsu_mbi_dta_fail(lsu_mbi_dta_fail),
  .lsu_mbi_dva_fail(lsu_mbi_dva_fail),
  .lsu_mbi_lru_fail(lsu_mbi_lru_fail),
  .lsu_mbi_dtb_fail(lsu_mbi_dtb_fail),
  .lsu_mbi_stb_cam_fail(lsu_mbi_stb_cam_fail),
  .lsu_mbi_stb_ram_fail(lsu_mbi_stb_ram_fail),
  .lsu_mbi_cpq_fail(lsu_mbi_cpq_fail),
  .ftu_mbi_ict_fail(ftu_mbi_ict_fail),
  .ftu_mbi_icd_fail(ftu_mbi_icd_fail),
  .ftu_mbi_itb_fail(ftu_mbi_itb_fail),
  .ftu_mbi_icv_fail(ftu_mbi_icv_fail),
  .lsu_mbi_tlb_data_cmp(lsu_mbi_tlb_data_cmp),
  .lsu_mbi_tlb_cam_hit(lsu_mbi_tlb_cam_hit),
  .lsu_mbi_tlb_cam_mhit(lsu_mbi_tlb_cam_mhit),
  .lsu_mbi_tlb_ctxt0_hit(lsu_mbi_tlb_ctxt0_hit),
  .lsu_mbi_tlb_valid(lsu_mbi_tlb_valid),
  .lsu_mbi_tlb_used(lsu_mbi_tlb_used),
  .lsu_mbi_scm_hit(lsu_mbi_scm_hit),
  .lsu_mbi_scm_mhit(lsu_mbi_scm_mhit),
  .lsu_mbi_scm_hit_ptr(lsu_mbi_scm_hit_ptr[2:0]),
  .lsu_mbi_scm_praw(lsu_mbi_scm_praw),
  .ftu_mbi_tlb_data_cmp(ftu_mbi_tlb_data_cmp),
  .ftu_mbi_tlb_cam_hit(ftu_mbi_tlb_cam_hit),
  .ftu_mbi_tlb_cam_mhit(ftu_mbi_tlb_cam_mhit),
  .ftu_mbi_tlb_ctxt0_hit(ftu_mbi_tlb_ctxt0_hit),
  .ftu_mbi_tlb_valid(ftu_mbi_tlb_valid),
  .ftu_mbi_tlb_used(ftu_mbi_tlb_used)

);

spc_mb1_ctl mb1 (	
	.scan_in(mb1_scanin),
	.scan_out(mb1_scanout),
        .tcu_pce_ov			(pce_ov_tl),
        .tcu_scan_en			(lb_scan_en_tl),
	.tcu_aclk               	(spc_aclk_tl),
	.tcu_bclk               	(spc_bclk_tl),
        .tcu_clk_stop(1'b0),
	.l2clk				(l2clk),
	.mbist_start			(tcu_spc_mbist_start_buf0),
    .mb1_mbist_fail			(mb1_mb0_fail),
	.mbist_user_mode		(msf0_mbist_user_mode_ff),
	.mbist_bisi_mode		(msf0_mbist_bisi_en_ff),
    .mb1_done                       (mb1_mb0_done),
	.mb1_addr                       ({mb1_addr_unused[15:8],mb1_addr[7:0]}),
  .mb1_run(mb1_run),
  .mb1_cmpsel(mb1_cmpsel[4:0]),
  .mb1_write_data(mb1_write_data[7:0]),
  .mb1_tsa0_read_en(mb1_tsa0_read_en),
  .mb1_tsa0_write_en(mb1_tsa0_write_en),
  .mb1_tsa1_read_en(mb1_tsa1_read_en),
  .mb1_tsa1_write_en(mb1_tsa1_write_en),
  .mb1_tca_read_en(mb1_tca_read_en),
  .mb1_tca_write_en(mb1_tca_write_en),
  .mb1_scp0_read_en(mb1_scp0_read_en),
  .mb1_scp0_write_en(mb1_scp0_write_en),
  .mb1_scp1_read_en(mb1_scp1_read_en),
  .mb1_scp1_write_en(mb1_scp1_write_en),
  .mb1_mra0_read_en(mb1_mra0_read_en),
  .mb1_mra0_write_en(mb1_mra0_write_en),
  .mb1_mra1_read_en(mb1_mra1_read_en),
  .mb1_mra1_write_en(mb1_mra1_write_en),
  .mb2_misc_pmen(mb2_misc_pmen),
  .mmu_mbi_mra0_fail(mmu_mbi_mra0_fail),
  .mmu_mbi_mra1_fail(mmu_mbi_mra1_fail),
  .mmu_mbi_scp0_fail(mmu_mbi_scp0_fail),
  .mmu_mbi_scp1_fail(mmu_mbi_scp1_fail),
  .tlu_mbi_tsa0_fail(tlu_mbi_tsa0_fail),
  .tlu_mbi_tsa1_fail(tlu_mbi_tsa1_fail),
  .tlu_mbi_tca_fail(tlu_mbi_tca_fail)
			
);

spc_mb2_ctl mb2 (	
	.scan_in(mb2_scanin),
	.scan_out(mb2_scanout),
        .tcu_pce_ov			(pce_ov_tr),
        .tcu_scan_en			(lb_scan_en_tr),
	.tcu_aclk               	(spc_aclk_tr),
	.tcu_bclk               	(spc_bclk_tr),
        .tcu_clk_stop(1'b0),
	.l2clk				(l2clk),
	.mbist_start			(tcu_spc_mbist_start_buf0),
	.mbist_user_mode		(msf0_mbist_user_mode_ff),
	.mbist_bisi_mode		(msf0_mbist_bisi_en_ff),
    .mb2_mbist_fail			(mb2_mb0_fail),
    .mb2_done               (mb2_mb0_done),
	.mb2_addr               ({mb2_addr_unused[15:10],mb2_addr[9:0]}),
  .mb2_run(mb2_run),
  .mb2_frf_read_en(mb2_frf_read_en),
  .mb2_frf_write_en(mb2_frf_write_en),
  .mb2_arf_read_en(mb2_arf_read_en),
  .mb2_arf_write_en(mb2_arf_write_en),
  .mb2_irf_read_en(mb2_irf_read_en),
  .mb2_irf_write_en(mb2_irf_write_en),
  .mb2_irf_save_en(mb2_irf_save_en),
  .mb2_irf_restore_en(mb2_irf_restore_en),
  .mb2_mam_read_en(mb2_mam_read_en),
  .mb2_mam_write_en(mb2_mam_write_en),
  .mb2_rrf_read_en(mb2_rrf_read_en),
  .mb2_rrf_write_en(mb2_rrf_write_en),
  .mb2_write_data(mb2_write_data[7:0]),
  .mb2_write_data_p1(mb2_write_data_p1[7:0]),
  .mb2_write_data_p2(mb2_write_data_p2[7:0]),
  .mb2_misc_pmen(mb2_misc_pmen),
  .lsu_misc_pmen(lsu_misc_pmen),
  .spu_mbi_mam_fail_(spu_mbi_mam_fail_),
  .spu_mbi_mam_fail2_(spu_mbi_mam_fail2_),
  .spu_mbi_arf_fail_(spu_mbi_arf_fail_),
  .spu_mbi_rrf_fail_(spu_mbi_rrf_fail_),
  .exu0_mbi_irf_fail_(exu0_mbi_irf_fail_[1:0]),
  .exu1_mbi_irf_fail_(exu1_mbi_irf_fail_[1:0]),
  .fgu_mbi_frf_fail(fgu_mbi_frf_fail)
);


// Check that the asi values mirrored in the TLU are consistent with those in the LSU.
// Anytime an instruction decodes for a thread, that's thread's ASI's must be equal.
// 0in custom -fire ((dec_valid0_d & (dec_tid0_d[1:0] == 2'b00)) & ~(lsu.dcs.asi_state0[7:0] == tlu.tsd0.asi0[7:0])) -message "T0 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid0_d & (dec_tid0_d[1:0] == 2'b01)) & ~(lsu.dcs.asi_state1[7:0] == tlu.tsd0.asi1[7:0])) -message "T1 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid0_d & (dec_tid0_d[1:0] == 2'b10)) & ~(lsu.dcs.asi_state2[7:0] == tlu.tsd0.asi2[7:0])) -message "T2 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid0_d & (dec_tid0_d[1:0] == 2'b11)) & ~(lsu.dcs.asi_state3[7:0] == tlu.tsd0.asi3[7:0])) -message "T3 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid1_d & (dec_tid1_d[1:0] == 2'b00)) & ~(lsu.dcs.asi_state4[7:0] == tlu.tsd1.asi0[7:0])) -message "T4 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid1_d & (dec_tid1_d[1:0] == 2'b01)) & ~(lsu.dcs.asi_state5[7:0] == tlu.tsd1.asi1[7:0])) -message "T5 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid1_d & (dec_tid1_d[1:0] == 2'b10)) & ~(lsu.dcs.asi_state6[7:0] == tlu.tsd1.asi2[7:0])) -message "T6 ASI registers are inconsistent"
// 0in custom -fire ((dec_valid1_d & (dec_tid1_d[1:0] == 2'b11)) & ~(lsu.dcs.asi_state7[7:0] == tlu.tsd1.asi3[7:0])) -message "T7 ASI registers are inconsistent"



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power 
// fixscan start:
//assign gkt_scanin                = scan_in[0]               ;
//assign fgu_scanin                = gkt_scanout              ;
//assign ifu_ibu_scanin            = fgu_scanout              ;
//assign ifu_ftu_scanin            = ifu_ibu_scanout          ;
//assign ifu_cmu_scanin            = ifu_ftu_scanout          ;
//assign dec_scanin                = ifu_cmu_scanout          ;
//assign pku_scanin                = dec_scanout              ;
//assign exu0_scanin               = pku_scanout              ;
//assign exu1_scanin               = exu0_scanout             ;
//assign tlu_scanin                = exu1_scanout             ;
//assign lsu_scanin                = tlu_scanout              ;
//assign spu_scanin                = lsu_scanout              ;
//assign mmu_scanin                = spu_scanout              ;
//assign pmu_scanin                = mmu_scanout              ;

// MBIST Scan Chain
assign mb0_scanin                = lb_mb_channel_si;
assign mb1_scanin                = mb0_scanout;
assign mb2_scanin                = mb1_scanout;

// Main Scan Chain
//assign scan_out[0]               = pmu_scanout;

// fixscan end:
endmodule

