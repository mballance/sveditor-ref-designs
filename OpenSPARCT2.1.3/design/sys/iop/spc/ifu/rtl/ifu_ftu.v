// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_ftu.v
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
`define  IC_ARR_HI      63   // (16Kb / 8 ways) / 32 bytes/line = 64 lines/way
`define  IC_ARR_INDX_HI 10   // log2(IC_SZ/IC_WAYS)-1=log2(16Kb/8ways)-1=log2(2048)-1 = 11-1 =10;
`define  IC_ARR_INDX_LO  5   // log2(IC_LINE_SZ)    = log2(32)  = 5
`define  IC_NUM_WAYS     8   // Number of ways;
`define  IC_WAY_HI       2   // log2(IC_NUM_WAYS) - 1 = log2(8)-1 = 3-1 = 2
`define  IC_TAG_SZ      29   


module ifu_ftu (
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  wmr_scan_out, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  lbist_run, 
  mbi_run, 
  mbi_ict_write_en, 
  mbi_ict_read_en, 
  mbi_icd_write_en, 
  mbi_icd_read_en, 
  mbi_itb_write_en, 
  mbi_itb_read_en, 
  mbi_icv_write_en, 
  mbi_icv_read_en, 
  mbi_cambist_run, 
  mbi_cambist_shift, 
  mbi_dis_clr_ubit, 
  mbi_init_to_zero, 
  mbi_itb_cam_en_pre, 
  mbi_repl_write, 
  mbi_itb_demap_en, 
  mbi_demap_type, 
  ftu_mbi_tlb_data_cmp, 
  ftu_mbi_tlb_cam_hit, 
  ftu_mbi_tlb_cam_mhit, 
  ftu_mbi_tlb_ctxt0_hit, 
  ftu_mbi_tlb_valid, 
  ftu_mbi_tlb_used, 
  lsu_asi_error_inject, 
  lsu_ifu_direct_map, 
  mbi_addr, 
  mbi_wdata, 
  mbi_cmpsel, 
  ftu_mbi_ict_fail, 
  ftu_mbi_icd_fail, 
  ftu_mbi_itb_fail, 
  ftu_mbi_icv_fail, 
  spc_core_running_status, 
  in_rngl_cdbus, 
  exu_address0_e, 
  exu_address1_e, 
  tlu_retry, 
  tlu_ceter_pscce, 
  tlu_trap_pc_0, 
  tlu_trap_pc_1, 
  tlu_npc_w, 
  tlu_ifu_hpstate_hpriv, 
  tlu_ifu_pstate_priv, 
  tlu_pstate_am, 
  tlu_ifu_invalidate, 
  cmu_fill_paddr, 
  cmu_inval_ack, 
  cmu_l2_err, 
  cmu_l2miss, 
  tlu_cerer_ittp, 
  tlu_cerer_itdp, 
  tlu_cerer_ittm, 
  tlu_cerer_icl2c, 
  tlu_cerer_icl2u, 
  tlu_cerer_icl2nd, 
  tlu_cerer_icvp, 
  tlu_cerer_ictp, 
  tlu_cerer_ictm, 
  cmu_icache_invalidate, 
  cmu_evic_invalidate, 
  cmu_icache_invalidate_way, 
  cmu_icache_inv_way1, 
  cmu_icache_invalidate_index, 
  dec_load_flush_w, 
  dec_tid0_d, 
  dec_tid1_d, 
  dec_br_taken_e, 
  dec_valid_e, 
  tlu_trap_pc_0_valid, 
  tlu_trap_pc_1_valid, 
  tlu_trap_0_tid, 
  tlu_trap_1_tid, 
  tlu_flush_ifu, 
  tlu_itlb_reload, 
  tlu_itlb_bypass, 
  tlu_tl_gt_0, 
  ibu_empty, 
  ibu_room_4ormore, 
  cmu_null_st, 
  cmu_dupmiss_st, 
  cmu_rst_dupmiss, 
  cmu_any_un_cacheable, 
  cmu_any_data_ready, 
  cmu_thr0_data_ready, 
  cmu_thr1_data_ready, 
  cmu_thr2_data_ready, 
  cmu_thr3_data_ready, 
  cmu_thr4_data_ready, 
  cmu_thr5_data_ready, 
  cmu_thr6_data_ready, 
  cmu_thr7_data_ready, 
  cmu_fill_inst0, 
  cmu_fill_inst1, 
  cmu_fill_inst2, 
  cmu_fill_inst3, 
  lsu_ic_enable, 
  lsu_ifu_no_miss, 
  lsu_ifu_ctxt_data, 
  lsu_ifu_tid_w, 
  lsu_ifu_wr_p0ctxt, 
  lsu_ifu_wr_p1ctxt, 
  lsu_ifu_wr_pid, 
  lsu_immu_enable, 
  lsu_ifu_ftu_pmen, 
  lsu_ic_pmen, 
  cmu_fill_wrway, 
  cmu_instr_v, 
  cmu_ic_data, 
  mmu_index, 
  ftu_buffer_wr_en_f, 
  ifu_rngl_cdbus, 
  ftu_rep_way, 
  ftu_paddr, 
  ftu_instr_0_c, 
  ftu_instr_1_c, 
  ftu_instr_2_c, 
  ftu_instr_3_c, 
  ftu_exception_valid_c, 
  ftu_instr_exceptions_c, 
  ftu_instr_valid_c, 
  ftu_fetch_thr_c, 
  ftu_curr_fetch_thr_f, 
  ftu_ifu_quiesce, 
  ifu_ibuffer_write_c, 
  ftu_ic_no_err_c, 
  ftu_bus_0_is_first, 
  ftu_bus_1_is_first, 
  ftu_bus_2_is_first, 
  ftu_bus_3_is_first, 
  ftu_instr_sf_valid_c, 
  ftu_excp_way_d, 
  ftu_excp_tid_d, 
  ftu_excp_way_valid_d, 
  ftu_thrx_un_cacheable, 
  ftu_agc_thr0_cmiss_c, 
  ftu_agc_thr1_cmiss_c, 
  ftu_agc_thr2_cmiss_c, 
  ftu_agc_thr3_cmiss_c, 
  ftu_agc_thr4_cmiss_c, 
  ftu_agc_thr5_cmiss_c, 
  ftu_agc_thr6_cmiss_c, 
  ftu_agc_thr7_cmiss_c, 
  ftu_thr0_inv_req_c, 
  ftu_thr1_inv_req_c, 
  ftu_thr2_inv_req_c, 
  ftu_thr3_inv_req_c, 
  ftu_thr4_inv_req_c, 
  ftu_thr5_inv_req_c, 
  ftu_thr6_inv_req_c, 
  ftu_thr7_inv_req_c, 
  ftu_ibu_redirect_bf, 
  ftu_thr0_redirect_bf, 
  ftu_thr1_redirect_bf, 
  ftu_thr2_redirect_bf, 
  ftu_thr3_redirect_bf, 
  ftu_thr4_redirect_bf, 
  ftu_thr5_redirect_bf, 
  ftu_thr6_redirect_bf, 
  ftu_thr7_redirect_bf, 
  ic_dmo_rd_data, 
  scan_out, 
  efu_spc_fuse_data, 
  efu_spc_fuse_ixfer_en, 
  slow_cmp_sync_en, 
  cmp_slow_sync_en, 
  efu_spc_fuse_iclr, 
  spc_efu_fuse_idata, 
  spc_efu_fuse_ixfer_en, 
  vnw_ary);
wire pce;
wire io_cmp_sync_en;
wire cmp_io_sync_en;
wire [10:0] ifu_ftu_agd_pc_bf_unused;
wire [47:0] ifu_agd_pc_bf;
wire ftu_agd_dp_scanin;
wire ftu_agd_dp_scanout;
wire [68:0] itd_tag;
wire ftu_ctx_dp_wmr_scanin;
wire ftu_ctx_dp_wmr_scanout;
wire ftu_ctx_dp_scanin;
wire ftu_ctx_dp_scanout;
wire ftu_agc_ctl_scanin;
wire ftu_agc_ctl_scanout;
wire [37:0] itb_tte_data;
wire [39:37] ftu_paddr_unq;
wire [32:0] asi_wr_data;
wire ftu_cms_ctl_scanin;
wire ftu_cms_ctl_scanout;
wire [32:0] word2_reordered;
wire [7:0] cms_ic_modified_parity;
wire [32:0] word3_reordered;
wire [32:0] word6_reordered;
wire [32:0] word7_reordered;
wire [5:0] hdr_sram_rvalue;
wire [3:0] hdr_sram_rid;
wire hdr_sram_wr_en;
wire hdr_sram_red_clr;
wire [5:0] sram_hdr_read_data;
wire red_en_unused;
wire [32:0] icd_bus_2_instr_c;
wire [32:0] icd_bus_3_instr_c;
wire ftu_icd_cust_scanin;
wire ftu_icd_cust_scanout;
wire hdr_scanin;
wire hdr_scanout;
wire [10:5] agd_ict_index_bf;
wire ftu_ict_cust_scanin;
wire ftu_ict_cust_scanout;
wire ftu_icv_cust_scanin;
wire ftu_icv_cust_scanout;
wire [31:0] agc_icv_wren_bf;
wire agc_icv_wr_req_bf;
wire ftp_iv_rd_req_bf;
wire [10:2] agd_ic_index_bf;
wire [10:6] agd_icv_windex_bf;
wire [31:0] agc_icv_wrdata_bf;
wire [31:0] icv_valid_f;
wire tte_ubit;
wire itc_tte_ubit;
wire ftu_itb_cust_scanin;
wire ftu_itb_cust_scanout;
wire itc_dis_clr_ubit;
wire itc_bypass_bf;
wire itc_wr_u_en;
wire itc_itlb_rd_vld_bf;
wire ftp_itlb_cam_vld_bf;
wire [5:0] itd_rw_index;
wire itc_rw_index_vld;
wire itc_demap;
wire itc_demap_context;
wire itc_demap_all;
wire itc_demap_real;
wire [37:0] itd_data;
wire [28:0] ict_itlb_way_0_tag_f_rep0;
wire [28:0] ict_itlb_way_1_tag_f_rep0;
wire [28:0] ict_itlb_way_2_tag_f_rep0;
wire [28:0] ict_itlb_way_3_tag_f_rep0;
wire [28:0] ict_itlb_way_4_tag_f_rep0;
wire [28:0] ict_itlb_way_5_tag_f_rep0;
wire [28:0] ict_itlb_way_6_tag_f_rep0;
wire [28:0] ict_itlb_way_7_tag_f_rep0;
wire [7:0] agd_itlb_valid_fast_f;
wire [7:0] itb_icd_waysel_c;
wire itb_chit_c;
wire itb_cam_hit_c;
wire itb_itb_mhit_c;
wire [39:13] pa_unflopped_unused;
wire [65:0] itb_tte_tag;
wire itb_tte_u_bit;
wire itb_tte_data_parity;
wire itb_tte_p_c;
wire [39:3] asi_addr_bf;
wire ftu_itc_ctl_scanin;
wire ftu_itc_ctl_scanout;
wire ftu_itd_dp_scanin;
wire ftu_itd_dp_scanout;
wire [2:0] ftp_curr_pid_bf;
wire itc_ra_to_pa_bf;
wire [13:0] ctx_cntx_0_to_write_bf;
wire [13:0] ctx_cntx_1_to_write_bf;
wire [12:0] ctx_curr_cntx_0_bf;
wire [12:0] ctx_curr_cntx_1_bf;
wire ftu_ftp_ctl_scanin;
wire ftu_ftp_ctl_scanout;
wire ftu_tfc_ctl_scanin;
wire ftu_tfc_ctl_scanout;
wire ftu_byp_dp_scanin;
wire ftu_byp_dp_scanout;
wire ftu_asi_ctl_scanin;
wire ftu_asi_ctl_scanout;
wire [2:0] ftp_thr0_trprdpc_sel_bf;
wire [2:0] ftp_thr1_trprdpc_sel_bf;
wire [2:0] ftp_thr2_trprdpc_sel_bf;
wire [2:0] ftp_thr3_trprdpc_sel_bf;
wire [2:0] ftp_thr4_trprdpc_sel_bf;
wire [2:0] ftp_thr5_trprdpc_sel_bf;
wire [2:0] ftp_thr6_trprdpc_sel_bf;
wire [2:0] ftp_thr7_trprdpc_sel_bf;
wire [3:0] agc_thr0_pcf_sel_bf;
wire [3:0] agc_thr1_pcf_sel_bf;
wire [3:0] agc_thr2_pcf_sel_bf;
wire [3:0] agc_thr3_pcf_sel_bf;
wire [3:0] agc_thr4_pcf_sel_bf;
wire [3:0] agc_thr5_pcf_sel_bf;
wire [3:0] agc_thr6_pcf_sel_bf;
wire [3:0] agc_thr7_pcf_sel_bf;
wire [1:0] agc_thr0_pcf_sel_last_bf;
wire [1:0] agc_thr1_pcf_sel_last_bf;
wire [1:0] agc_thr2_pcf_sel_last_bf;
wire [1:0] agc_thr3_pcf_sel_last_bf;
wire [1:0] agc_thr4_pcf_sel_last_bf;
wire [1:0] agc_thr5_pcf_sel_last_bf;
wire [1:0] agc_thr6_pcf_sel_last_bf;
wire [1:0] agc_thr7_pcf_sel_last_bf;
wire ftp_thr0_sel_br_bf;
wire ftp_thr1_sel_br_bf;
wire ftp_thr2_sel_br_bf;
wire ftp_thr3_sel_br_bf;
wire ftp_thr4_sel_br_bf;
wire ftp_thr5_sel_br_bf;
wire ftp_thr6_sel_br_bf;
wire ftp_thr7_sel_br_bf;
wire [3:0] agc_sel_inv_index;
wire [3:0] agc_pc_sel_for_c;
wire agc_thr0_byp_incr_bit5;
wire agc_thr1_byp_incr_bit5;
wire agc_thr2_byp_incr_bit5;
wire agc_thr3_byp_incr_bit5;
wire agc_thr4_byp_incr_bit5;
wire agc_thr5_byp_incr_bit5;
wire agc_thr6_byp_incr_bit5;
wire agc_thr7_byp_incr_bit5;
wire [4:2] agc_thr0_byp_pc_update_bf;
wire [4:2] agc_thr1_byp_pc_update_bf;
wire [4:2] agc_thr2_byp_pc_update_bf;
wire [4:2] agc_thr3_byp_pc_update_bf;
wire [4:2] agc_thr4_byp_pc_update_bf;
wire [4:2] agc_thr5_byp_pc_update_bf;
wire [4:2] agc_thr6_byp_pc_update_bf;
wire [4:2] agc_thr7_byp_pc_update_bf;
wire [7:0] ftp_new_thr_sel_bf;
wire [2:0] ftp_ict_data_sel_bf;
wire [5:0] ftp_pc_sel_am;
wire [2:0] ftp_pc_sel_tag_part1;
wire [3:0] ftp_pc_sel_tag_part2;
wire [1:0] ftp_pc_sel_tag_pc_bot;
wire [1:0] ftp_pc_sel_tag_pc_top;
wire ftp_any_thr_clken;
wire ftp_sel_icv_mbist_addr;
wire [4:0] ftp_icaddr_sel_first_mux;
wire [2:0] agd_direct_map_rep_way;
wire [7:0] agd_itlb_valid_f;
wire [7:0] agd_itlb_valid_dupl_f;
wire [47:2] ifu_agd_pc_f;
wire [4:2] agd_thr0_pc_4_2_f;
wire [4:2] agd_thr1_pc_4_2_f;
wire [4:2] agd_thr2_pc_4_2_f;
wire [4:2] agd_thr3_pc_4_2_f;
wire [4:2] agd_thr4_pc_4_2_f;
wire [4:2] agd_thr5_pc_4_2_f;
wire [4:2] agd_thr6_pc_4_2_f;
wire [4:2] agd_thr7_pc_4_2_f;
wire [29:0] agd_ict_wrtag_bf;
wire [32:0] agd_asi_bist_wrdata;
wire [7:0] agd_mbist_wdata_bf;
wire agd_va_hole_excp_f;
wire [4:2] agd_address0_m;
wire [4:2] agd_address1_m;
wire agc_thr0_cntx_0_sel_ff;
wire agc_thr0_cntx_1_sel_ff;
wire agc_thr1_cntx_0_sel_ff;
wire agc_thr1_cntx_1_sel_ff;
wire agc_thr2_cntx_0_sel_ff;
wire agc_thr2_cntx_1_sel_ff;
wire agc_thr3_cntx_0_sel_ff;
wire agc_thr3_cntx_1_sel_ff;
wire agc_thr4_cntx_0_sel_ff;
wire agc_thr4_cntx_1_sel_ff;
wire agc_thr5_cntx_0_sel_ff;
wire agc_thr5_cntx_1_sel_ff;
wire agc_thr6_cntx_0_sel_ff;
wire agc_thr6_cntx_1_sel_ff;
wire agc_thr7_cntx_0_sel_ff;
wire agc_thr7_cntx_1_sel_ff;
wire [1:0] agc_thr0_cntx_0_sel;
wire [1:0] agc_thr0_cntx_1_sel;
wire [1:0] agc_thr1_cntx_0_sel;
wire [1:0] agc_thr1_cntx_1_sel;
wire [1:0] agc_thr2_cntx_0_sel;
wire [1:0] agc_thr2_cntx_1_sel;
wire [1:0] agc_thr3_cntx_0_sel;
wire [1:0] agc_thr3_cntx_1_sel;
wire [1:0] agc_thr4_cntx_0_sel;
wire [1:0] agc_thr4_cntx_1_sel;
wire [1:0] agc_thr5_cntx_0_sel;
wire [1:0] agc_thr5_cntx_1_sel;
wire [1:0] agc_thr6_cntx_0_sel;
wire [1:0] agc_thr6_cntx_1_sel;
wire [1:0] agc_thr7_cntx_0_sel;
wire [1:0] agc_thr7_cntx_1_sel;
wire [7:0] ftp_itb_fetch_thr_bf;
wire [7:0] itc_thr_to_write;
wire ftp_itlb_probe_req_l;
wire asi_ith_det_req;
wire ftp_asi_tg_wr_req_hold;
wire ftp_itlb_cam_vld_f;
wire [2:0] asi_way_bf;
wire itc_demap_next;
wire [7:0] ftp_curr_fetch_thr_f;
wire [7:0] ftp_fetch_thr_q_f;
wire ftp_fill_req_q_bf;
wire [3:0] err_w0_8b_parity_f;
wire [3:0] err_w1_8b_parity_f;
wire [3:0] err_w2_8b_parity_f;
wire [3:0] err_w3_8b_parity_f;
wire [3:0] err_w4_8b_parity_f;
wire [3:0] err_w5_8b_parity_f;
wire [3:0] err_w6_8b_parity_f;
wire [3:0] err_w7_8b_parity_f;
wire tsm_thr0_ignore_by_pass;
wire tsm_thr1_ignore_by_pass;
wire tsm_thr2_ignore_by_pass;
wire tsm_thr3_ignore_by_pass;
wire tsm_thr4_ignore_by_pass;
wire tsm_thr5_ignore_by_pass;
wire tsm_thr6_ignore_by_pass;
wire tsm_thr7_ignore_by_pass;
wire tsm_thr0_no_new_miss;
wire tsm_thr1_no_new_miss;
wire tsm_thr2_no_new_miss;
wire tsm_thr3_no_new_miss;
wire tsm_thr4_no_new_miss;
wire tsm_thr5_no_new_miss;
wire tsm_thr6_no_new_miss;
wire tsm_thr7_no_new_miss;
wire [1:0] ftp_tid0_e;
wire [1:0] ftp_tid1_e;
wire ftp_fetch_v_f;
wire ftp_asi_mbist_access_bf;
wire itd_prty_256m;
wire itd_prty_4m;
wire itd_prty_64k;
wire itd_prty_8k;
wire itd_prty_ctxt0;
wire itd_prty_ctxt1;
wire tlb_context0_hit;
wire agc_itb_tag_perr_c;
wire [1:0] agc_vl_data_c;
wire [3:0] agc_asi_sel_word_c;
wire [7:0] agc_sel_tg_data_f;
wire [7:0] agc_word_en_bf;
wire [7:0] agc_by_pass_update_lru_bf;
wire [7:0] agc_invalidation_req_ff;
wire agc_any_invalidation_req_f;
wire agc_thr0_sf_valid_f;
wire agc_thr1_sf_valid_f;
wire agc_thr2_sf_valid_f;
wire agc_thr3_sf_valid_f;
wire agc_thr4_sf_valid_f;
wire agc_thr5_sf_valid_f;
wire agc_thr6_sf_valid_f;
wire agc_thr7_sf_valid_f;
wire agc_thr0_micro_flush_unq_c;
wire agc_thr1_micro_flush_unq_c;
wire agc_thr2_micro_flush_unq_c;
wire agc_thr3_micro_flush_unq_c;
wire agc_thr4_micro_flush_unq_c;
wire agc_thr5_micro_flush_unq_c;
wire agc_thr6_micro_flush_unq_c;
wire agc_thr7_micro_flush_unq_c;
wire agc_thr0_err_detect_c;
wire agc_thr1_err_detect_c;
wire agc_thr2_err_detect_c;
wire agc_thr3_err_detect_c;
wire agc_thr4_err_detect_c;
wire agc_thr5_err_detect_c;
wire agc_thr6_err_detect_c;
wire agc_thr7_err_detect_c;
wire agc_thr0_cmiss_stm_c;
wire agc_thr1_cmiss_stm_c;
wire agc_thr2_cmiss_stm_c;
wire agc_thr3_cmiss_stm_c;
wire agc_thr4_cmiss_stm_c;
wire agc_thr5_cmiss_stm_c;
wire agc_thr6_cmiss_stm_c;
wire agc_thr7_cmiss_stm_c;
wire [2:0] agc_fill_wrway_bf;
wire agc_thr0_lsu_no_ic_miss;
wire agc_thr1_lsu_no_ic_miss;
wire agc_thr2_lsu_no_ic_miss;
wire agc_thr3_lsu_no_ic_miss;
wire agc_thr4_lsu_no_ic_miss;
wire agc_thr5_lsu_no_ic_miss;
wire agc_thr6_lsu_no_ic_miss;
wire agc_thr7_lsu_no_ic_miss;
wire agc_thr0_itb_miss_c;
wire agc_thr1_itb_miss_c;
wire agc_thr2_itb_miss_c;
wire agc_thr3_itb_miss_c;
wire agc_thr4_itb_miss_c;
wire agc_thr5_itb_miss_c;
wire agc_thr6_itb_miss_c;
wire agc_thr7_itb_miss_c;
wire agc_thr0_tlu_redirect_bf;
wire agc_thr1_tlu_redirect_bf;
wire agc_thr2_tlu_redirect_bf;
wire agc_thr3_tlu_redirect_bf;
wire agc_thr4_tlu_redirect_bf;
wire agc_thr5_tlu_redirect_bf;
wire agc_thr6_tlu_redirect_bf;
wire agc_thr7_tlu_redirect_bf;
wire agc_kill_fetch_cv_c;
wire [2:0] agc_instr_bp_sel_c;
wire ftp_icd_quad_0_en_bf;
wire ftp_icd_quad_1_en_bf;
wire ftp_icd_quad_2_en_bf;
wire ftp_icd_quad_3_en_bf;
wire ftp_ic_rd_req_bf;
wire ftp_ic_wr_req_bf;
wire ftp_ic_wr_ps_en_bf;
wire [32:0] icd_bus_0_instr_c;
wire [32:0] icd_bus_1_instr_c;
wire ftp_tg_rd_req_bf;
wire ftp_tg_wr_req_bf;
wire ftp_tg_clk_en;
wire [29:0] ict_itlb_way_0_tag_f;
wire [29:0] ict_itlb_way_1_tag_f;
wire [29:0] ict_itlb_way_2_tag_f;
wire [29:0] ict_itlb_way_3_tag_f;
wire [29:0] ict_itlb_way_4_tag_f;
wire [29:0] ict_itlb_way_5_tag_f;
wire [29:0] ict_itlb_way_6_tag_f;
wire [29:0] ict_itlb_way_7_tag_f;
wire itd_index_valid_in;
wire ftp_itt_rd_req_bf;
wire ftp_itd_rd_req_bf;
wire ftp_ith_det_req_bf;
wire itc_sel_trap_pc_0;
wire itc_sel_trap_pc_1;
wire itc_sel_demap_tag_d;
wire itc_sel_demap_tag_c0;
wire itc_sel_demap_tag_c1;
wire itc_sel_write_tag;
wire itc_sel_write_tag_indexed;
wire itc_sel_default;
wire itc_tag_error_inj;
wire itc_data_error_inj;
wire itc_write_next;
wire itc_sel_mbist;
wire itc_mbi_itb_read_en;
wire itc_itb_data_sz_1;
wire [2:0] ftp_thr0_pid_data;
wire [2:0] ftp_thr1_pid_data;
wire [2:0] ftp_thr2_pid_data;
wire [2:0] ftp_thr3_pid_data;
wire [2:0] ftp_thr4_pid_data;
wire [2:0] ftp_thr5_pid_data;
wire [2:0] ftp_thr6_pid_data;
wire [2:0] ftp_thr7_pid_data;
wire tsm_thr0_ready_hp_bf_in;
wire tsm_thr1_ready_hp_bf_in;
wire tsm_thr2_ready_hp_bf_in;
wire tsm_thr3_ready_hp_bf_in;
wire tsm_thr4_ready_hp_bf_in;
wire tsm_thr5_ready_hp_bf_in;
wire tsm_thr6_ready_hp_bf_in;
wire tsm_thr7_ready_hp_bf_in;
wire tsm_thr0_fill_rdy0;
wire tsm_thr1_fill_rdy0;
wire tsm_thr2_fill_rdy0;
wire tsm_thr3_fill_rdy0;
wire tsm_thr4_fill_rdy0;
wire tsm_thr5_fill_rdy0;
wire tsm_thr6_fill_rdy0;
wire tsm_thr7_fill_rdy0;
wire asi_ic_wr_req;
wire asi_ic_rd_req;
wire asi_tg_wr_req;
wire asi_tg_rd_req;
wire asi_itd_rd_req;
wire asi_itt_rd_req;
wire [2:0] asi_tid;
wire ftp_asi_rd_done;
wire ftp_asi_wr_done;
wire ftp_reset_fill_wait;
wire ftp_sel_mbist_itb_cycle0;
wire ftp_sel_mbist_itb_cycle1;
wire ftp_sel_mbist_itb_cycle2;
wire ftp_sel_mbist_itb_cycle3;
wire ftp_sel_itlb_tag_cntx0_c;
wire ftp_sel_itlb_tag_cntx1_c;
wire ftp_sel_itlb_data_c;
wire ftp_sel_itlb_pa_c;
wire ftp_asi_it_rd_done;
wire ftp_asi_ic_rd_done;
wire ftp_asi_ic_wr_done;
wire ftp_asi_tg_rd_done;
wire ftp_asi_tg_wr_done;
wire ftp_thr0_room_is_less_t_3;
wire ftp_thr1_room_is_less_t_3;
wire ftp_thr2_room_is_less_t_3;
wire ftp_thr3_room_is_less_t_3;
wire ftp_thr4_room_is_less_t_3;
wire ftp_thr5_room_is_less_t_3;
wire ftp_thr6_room_is_less_t_3;
wire ftp_thr7_room_is_less_t_3;
wire ftp_thr0_go_to_sf_wait;
wire ftp_thr1_go_to_sf_wait;
wire ftp_thr2_go_to_sf_wait;
wire ftp_thr3_go_to_sf_wait;
wire ftp_thr4_go_to_sf_wait;
wire ftp_thr5_go_to_sf_wait;
wire ftp_thr6_go_to_sf_wait;
wire ftp_thr7_go_to_sf_wait;
wire ftp_mbi_icd_read_en_bf;
wire ftp_mbi_ict_read_en_bf;
wire asi_wr_request;
wire asi_rd_request;
wire [32:0] ic_rd_data;
wire [29:0] tg_rd_data;
wire [63:0] it_rd_data;

 input        tcu_scan_en;
 input        l2clk;
 input        scan_in;		

 input           spc_aclk_wmr;
 input           wmr_scan_in;
 output          wmr_scan_out;


 input tcu_pce_ov;		// scan signals
 input spc_aclk;
 input spc_bclk;
 input tcu_muxtest;
 input tcu_dectest;
 input tcu_array_wr_inhibit;
 input tcu_se_scancollar_in;
 input tcu_se_scancollar_out;

 input	lbist_run;
 input	mbi_run;
 input	mbi_ict_write_en;
 input	mbi_ict_read_en;
 input	mbi_icd_write_en;
 input	mbi_icd_read_en;
 input	mbi_itb_write_en;
 input	mbi_itb_read_en;
 input	mbi_icv_write_en; 
 input	mbi_icv_read_en;

 input            mbi_cambist_run;
 input            mbi_cambist_shift;
 input            mbi_dis_clr_ubit;
 input            mbi_init_to_zero;
 input            mbi_itb_cam_en_pre;

 input            mbi_repl_write;
 input            mbi_itb_demap_en;
 input     [1:0]  mbi_demap_type;


 output       ftu_mbi_tlb_data_cmp;
 output       ftu_mbi_tlb_cam_hit;
 output       ftu_mbi_tlb_cam_mhit;
 output       ftu_mbi_tlb_ctxt0_hit;
 output       ftu_mbi_tlb_valid;
 output       ftu_mbi_tlb_used;

 input [31:28]  lsu_asi_error_inject;
 input  lsu_ifu_direct_map;

 input [8:0]	   mbi_addr;
 input [7:0]	   mbi_wdata;
 input [2:0] 	   mbi_cmpsel;


 output	  ftu_mbi_ict_fail;
 output	  ftu_mbi_icd_fail;
 output	  ftu_mbi_itb_fail;
 output	  ftu_mbi_icv_fail;


input [7:0] spc_core_running_status;


 input [64:0] in_rngl_cdbus;
 input [47:0] exu_address0_e;
 input [47:0] exu_address1_e;
 input [1:0]  tlu_retry ;
 input [7:0]  tlu_ceter_pscce ;
 input [47:0] tlu_trap_pc_0;
 input [47:0] tlu_trap_pc_1;
 input [47:2] tlu_npc_w;
 input [7:0]  tlu_ifu_hpstate_hpriv;
 input [7:0]  tlu_ifu_pstate_priv;
 input [7:0]  tlu_pstate_am;
 input [1:0] tlu_ifu_invalidate     ;

 input [39:5] cmu_fill_paddr;
  input [7:0]  cmu_inval_ack;
 input  [1:0] cmu_l2_err;
 input        cmu_l2miss;
// Error enables                      //
 input        tlu_cerer_ittp         ;
 input        tlu_cerer_itdp         ;
 input        tlu_cerer_ittm         ;
 input        tlu_cerer_icl2c     ;
 input        tlu_cerer_icl2u     ; 
 input        tlu_cerer_icl2nd    ; 
 input        tlu_cerer_icvp         ;
 input        tlu_cerer_ictp         ;
 input        tlu_cerer_ictm         ;

 input cmu_icache_invalidate;
 input cmu_evic_invalidate;

 input [2:0] cmu_icache_invalidate_way;
 input [2:0] cmu_icache_inv_way1;
 input [10:5] cmu_icache_invalidate_index;



 input [1:0]  dec_load_flush_w;


 input [1:0]  dec_tid0_d;
 input [1:0]  dec_tid1_d;
 input [1:0]  dec_br_taken_e;
 input [1:0]  dec_valid_e;


 input       tlu_trap_pc_0_valid;
 input       tlu_trap_pc_1_valid;
 input [1:0] tlu_trap_0_tid;
 input [1:0] tlu_trap_1_tid;
 input [7:0] tlu_flush_ifu;
 input [1:0] tlu_itlb_reload;
 input [7:0] tlu_itlb_bypass;
 input [7:0] tlu_tl_gt_0;


 input [7:0] ibu_empty;
 input [7:0] ibu_room_4ormore;

 input [7:0] cmu_null_st;
 input [7:0] cmu_dupmiss_st;
 input [7:0] cmu_rst_dupmiss;

   
 input       cmu_any_un_cacheable;

 input       cmu_any_data_ready;
 input       cmu_thr0_data_ready;
 input       cmu_thr1_data_ready;
 input       cmu_thr2_data_ready;
 input       cmu_thr3_data_ready;
 input       cmu_thr4_data_ready;
 input       cmu_thr5_data_ready;
 input       cmu_thr6_data_ready;
 input       cmu_thr7_data_ready;
 input       [32:0] cmu_fill_inst0;
 input       [32:0] cmu_fill_inst1;
 input       [32:0] cmu_fill_inst2;
 input       [32:0] cmu_fill_inst3;

 input  [7:0]	lsu_ic_enable;
 input  [7:0]	lsu_ifu_no_miss;
 input  [12:0]  lsu_ifu_ctxt_data;
 input  [2:0]   lsu_ifu_tid_w;
 input          lsu_ifu_wr_p0ctxt;
 input          lsu_ifu_wr_p1ctxt;
 input          lsu_ifu_wr_pid;
 input	[7:0]	lsu_immu_enable;
 input 	        lsu_ifu_ftu_pmen;
 input 	        lsu_ic_pmen;

input        [2:0] cmu_fill_wrway;
input        [3:0] cmu_instr_v;

 input [263:0] cmu_ic_data;

input	[6:0]	mmu_index;		// valid and index from data_access

output [7:0]  ftu_buffer_wr_en_f ;

output [64:0] ifu_rngl_cdbus;
output [2:0]  ftu_rep_way ;
output [39:0] ftu_paddr ;
output [32:0] ftu_instr_0_c ;
output [32:0] ftu_instr_1_c ;
output [32:0] ftu_instr_2_c ;
output [32:0] ftu_instr_3_c ;
output        ftu_exception_valid_c ;
output [4:0]  ftu_instr_exceptions_c ;
output [3:0]  ftu_instr_valid_c ;
output [7:0]  ftu_fetch_thr_c ;
output [7:0]  ftu_curr_fetch_thr_f ;
output [7:0]  ftu_ifu_quiesce ;
output [7:0]  ifu_ibuffer_write_c ;
output	      ftu_ic_no_err_c   ;	     // Data being by_passed does not have an error
output        ftu_bus_0_is_first ;           // bus 0 contains first instr
output        ftu_bus_1_is_first ;           // bus 1 contains first instr
output        ftu_bus_2_is_first ;           // bus 2 contains first instr
output        ftu_bus_3_is_first ;           // bus 3 contains first instr
output        ftu_instr_sf_valid_c ;         



output [2:0] ftu_excp_way_d;
output [2:0] ftu_excp_tid_d;
output       ftu_excp_way_valid_d;




output        ftu_thrx_un_cacheable ;

output        ftu_agc_thr0_cmiss_c ;
output        ftu_agc_thr1_cmiss_c ;
output        ftu_agc_thr2_cmiss_c ;
output        ftu_agc_thr3_cmiss_c ;
output        ftu_agc_thr4_cmiss_c ;
output        ftu_agc_thr5_cmiss_c ;
output        ftu_agc_thr6_cmiss_c ;
output        ftu_agc_thr7_cmiss_c ;

output        ftu_thr0_inv_req_c ;
output        ftu_thr1_inv_req_c ;
output        ftu_thr2_inv_req_c ;
output        ftu_thr3_inv_req_c ;
output        ftu_thr4_inv_req_c ;
output        ftu_thr5_inv_req_c ;
output        ftu_thr6_inv_req_c ;
output        ftu_thr7_inv_req_c ;


output [7:0]  ftu_ibu_redirect_bf;
output        ftu_thr0_redirect_bf ;
output        ftu_thr1_redirect_bf ;
output        ftu_thr2_redirect_bf ;
output        ftu_thr3_redirect_bf ;
output        ftu_thr4_redirect_bf ;
output        ftu_thr5_redirect_bf ;
output        ftu_thr6_redirect_bf ;
output        ftu_thr7_redirect_bf ;

output	[32:0]	ic_dmo_rd_data;

output		scan_out;

// EFU interface

input		efu_spc_fuse_data;
input		efu_spc_fuse_ixfer_en;

input           slow_cmp_sync_en;
input           cmp_slow_sync_en;
input		efu_spc_fuse_iclr;
output		spc_efu_fuse_idata;
output		spc_efu_fuse_ixfer_en;

input		vnw_ary;

assign pce = 1'b1;

assign     io_cmp_sync_en = slow_cmp_sync_en;
assign     cmp_io_sync_en = cmp_slow_sync_en;
assign     ifu_ftu_agd_pc_bf_unused[10:0] = ifu_agd_pc_bf[10:0] ;



ifu_ftu_agd_dp ftu_agd_dp (
  .scan_in(ftu_agd_dp_scanin),
  .scan_out(ftu_agd_dp_scanout),
  .l2clk(l2clk),
  .itc_va({itd_tag[51:32],
	   itd_tag[31:26],
	   itd_tag[23:18],
	   itd_tag[16:14]}),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_muxtest(tcu_muxtest),
  .mbi_addr(mbi_addr[5:0]),
  .mbi_cmpsel(mbi_cmpsel[2:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_icv_read_en(mbi_icv_read_en),
  .ftp_thr0_trprdpc_sel_bf(ftp_thr0_trprdpc_sel_bf[2:0]),
  .ftp_thr1_trprdpc_sel_bf(ftp_thr1_trprdpc_sel_bf[2:0]),
  .ftp_thr2_trprdpc_sel_bf(ftp_thr2_trprdpc_sel_bf[2:0]),
  .ftp_thr3_trprdpc_sel_bf(ftp_thr3_trprdpc_sel_bf[2:0]),
  .ftp_thr4_trprdpc_sel_bf(ftp_thr4_trprdpc_sel_bf[2:0]),
  .ftp_thr5_trprdpc_sel_bf(ftp_thr5_trprdpc_sel_bf[2:0]),
  .ftp_thr6_trprdpc_sel_bf(ftp_thr6_trprdpc_sel_bf[2:0]),
  .ftp_thr7_trprdpc_sel_bf(ftp_thr7_trprdpc_sel_bf[2:0]),
  .agc_thr0_pcf_sel_bf(agc_thr0_pcf_sel_bf[3:0]),
  .agc_thr1_pcf_sel_bf(agc_thr1_pcf_sel_bf[3:0]),
  .agc_thr2_pcf_sel_bf(agc_thr2_pcf_sel_bf[3:0]),
  .agc_thr3_pcf_sel_bf(agc_thr3_pcf_sel_bf[3:0]),
  .agc_thr4_pcf_sel_bf(agc_thr4_pcf_sel_bf[3:0]),
  .agc_thr5_pcf_sel_bf(agc_thr5_pcf_sel_bf[3:0]),
  .agc_thr6_pcf_sel_bf(agc_thr6_pcf_sel_bf[3:0]),
  .agc_thr7_pcf_sel_bf(agc_thr7_pcf_sel_bf[3:0]),
  .agc_thr0_pcf_sel_last_bf(agc_thr0_pcf_sel_last_bf[1:0]),
  .agc_thr1_pcf_sel_last_bf(agc_thr1_pcf_sel_last_bf[1:0]),
  .agc_thr2_pcf_sel_last_bf(agc_thr2_pcf_sel_last_bf[1:0]),
  .agc_thr3_pcf_sel_last_bf(agc_thr3_pcf_sel_last_bf[1:0]),
  .agc_thr4_pcf_sel_last_bf(agc_thr4_pcf_sel_last_bf[1:0]),
  .agc_thr5_pcf_sel_last_bf(agc_thr5_pcf_sel_last_bf[1:0]),
  .agc_thr6_pcf_sel_last_bf(agc_thr6_pcf_sel_last_bf[1:0]),
  .agc_thr7_pcf_sel_last_bf(agc_thr7_pcf_sel_last_bf[1:0]),
  .ftp_thr0_sel_br_bf(ftp_thr0_sel_br_bf),
  .ftp_thr1_sel_br_bf(ftp_thr1_sel_br_bf),
  .ftp_thr2_sel_br_bf(ftp_thr2_sel_br_bf),
  .ftp_thr3_sel_br_bf(ftp_thr3_sel_br_bf),
  .ftp_thr4_sel_br_bf(ftp_thr4_sel_br_bf),
  .ftp_thr5_sel_br_bf(ftp_thr5_sel_br_bf),
  .ftp_thr6_sel_br_bf(ftp_thr6_sel_br_bf),
  .ftp_thr7_sel_br_bf(ftp_thr7_sel_br_bf),
  .agc_sel_inv_index(agc_sel_inv_index[3:0]),
  .agc_pc_sel_for_c(agc_pc_sel_for_c[3:0]),
  .icv_valid_f(icv_valid_f[31:0]),
  .asi_addr_bf(asi_addr_bf[39:3]),
  .agc_thr0_byp_incr_bit5(agc_thr0_byp_incr_bit5),
  .agc_thr1_byp_incr_bit5(agc_thr1_byp_incr_bit5),
  .agc_thr2_byp_incr_bit5(agc_thr2_byp_incr_bit5),
  .agc_thr3_byp_incr_bit5(agc_thr3_byp_incr_bit5),
  .agc_thr4_byp_incr_bit5(agc_thr4_byp_incr_bit5),
  .agc_thr5_byp_incr_bit5(agc_thr5_byp_incr_bit5),
  .agc_thr6_byp_incr_bit5(agc_thr6_byp_incr_bit5),
  .agc_thr7_byp_incr_bit5(agc_thr7_byp_incr_bit5),
  .agc_thr0_byp_pc_update_bf(agc_thr0_byp_pc_update_bf[4:2]),
  .agc_thr1_byp_pc_update_bf(agc_thr1_byp_pc_update_bf[4:2]),
  .agc_thr2_byp_pc_update_bf(agc_thr2_byp_pc_update_bf[4:2]),
  .agc_thr3_byp_pc_update_bf(agc_thr3_byp_pc_update_bf[4:2]),
  .agc_thr4_byp_pc_update_bf(agc_thr4_byp_pc_update_bf[4:2]),
  .agc_thr5_byp_pc_update_bf(agc_thr5_byp_pc_update_bf[4:2]),
  .agc_thr6_byp_pc_update_bf(agc_thr6_byp_pc_update_bf[4:2]),
  .agc_thr7_byp_pc_update_bf(agc_thr7_byp_pc_update_bf[4:2]),
  .ftp_new_thr_sel_bf(ftp_new_thr_sel_bf[7:0]),
  .ftp_ict_data_sel_bf(ftp_ict_data_sel_bf[2:0]),
  .ftp_pc_sel_am(ftp_pc_sel_am[5:0]),
  .ftp_pc_sel_tag_part1(ftp_pc_sel_tag_part1[2:0]),
  .ftp_pc_sel_tag_part2(ftp_pc_sel_tag_part2[3:0]),
  .ftp_pc_sel_tag_pc_bot(ftp_pc_sel_tag_pc_bot[1:0]),
  .ftp_pc_sel_tag_pc_top(ftp_pc_sel_tag_pc_top[1:0]),
  .ftp_any_thr_clken(ftp_any_thr_clken),
  .ftp_sel_icv_mbist_addr(ftp_sel_icv_mbist_addr),
  .ftp_icaddr_sel_first_mux(ftp_icaddr_sel_first_mux[4:0]),
  .tlu_trap_pc_0(tlu_trap_pc_0[47:2]),
  .tlu_trap_pc_1(tlu_trap_pc_1[47:2]),
  .exu_address0_e(exu_address0_e[47:0]),
  .exu_address1_e(exu_address1_e[47:0]),
  .tlu_npc_w(tlu_npc_w[47:2]),
  .cmu_fill_paddr(cmu_fill_paddr[39:5]),
  .asi_wr_data(asi_wr_data[32:0]),
  .cmu_icache_invalidate_index(cmu_icache_invalidate_index[10:6]),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .agd_direct_map_rep_way(agd_direct_map_rep_way[2:0]),
  .agd_itlb_valid_f(agd_itlb_valid_f[7:0]),
  .agd_itlb_valid_fast_f(agd_itlb_valid_fast_f[7:0]),
  .agd_itlb_valid_dupl_f(agd_itlb_valid_dupl_f[7:0]),
  .ifu_agd_pc_bf(ifu_agd_pc_bf[47:0]),
  .agd_ict_index_bf(agd_ict_index_bf[10:5]),
  .agd_ic_index_bf(agd_ic_index_bf[10:2]),
  .agd_icv_windex_bf(agd_icv_windex_bf[10:6]),
  .ifu_agd_pc_f(ifu_agd_pc_f[47:2]),
  .agd_thr0_pc_4_2_f(agd_thr0_pc_4_2_f[4:2]),
  .agd_thr1_pc_4_2_f(agd_thr1_pc_4_2_f[4:2]),
  .agd_thr2_pc_4_2_f(agd_thr2_pc_4_2_f[4:2]),
  .agd_thr3_pc_4_2_f(agd_thr3_pc_4_2_f[4:2]),
  .agd_thr4_pc_4_2_f(agd_thr4_pc_4_2_f[4:2]),
  .agd_thr5_pc_4_2_f(agd_thr5_pc_4_2_f[4:2]),
  .agd_thr6_pc_4_2_f(agd_thr6_pc_4_2_f[4:2]),
  .agd_thr7_pc_4_2_f(agd_thr7_pc_4_2_f[4:2]),
  .agd_ict_wrtag_bf(agd_ict_wrtag_bf[29:0]),
  .agd_asi_bist_wrdata(agd_asi_bist_wrdata[32:0]),
  .agd_mbist_wdata_bf(agd_mbist_wdata_bf[7:0]),
  .ftu_paddr(ftu_paddr[12:0]),
  .ftu_mbi_icv_fail(ftu_mbi_icv_fail),
  .agd_va_hole_excp_f(agd_va_hole_excp_f),
  .agd_address0_m(agd_address0_m[4:2]),
  .agd_address1_m(agd_address1_m[4:2])
);
                                                          
ifu_ftu_ctx_dp ftu_ctx_dp ( 
  .wmr_scan_in(ftu_ctx_dp_wmr_scanin),
  .wmr_scan_out(ftu_ctx_dp_wmr_scanout),
  .scan_in(ftu_ctx_dp_scanin),
  .scan_out(ftu_ctx_dp_scanout),
  .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .spc_aclk_wmr(spc_aclk_wmr),
  .lsu_ifu_ctxt_data(lsu_ifu_ctxt_data[12:0]),
  .agc_thr0_cntx_0_sel_ff(agc_thr0_cntx_0_sel_ff),
  .agc_thr0_cntx_1_sel_ff(agc_thr0_cntx_1_sel_ff),
  .agc_thr1_cntx_0_sel_ff(agc_thr1_cntx_0_sel_ff),
  .agc_thr1_cntx_1_sel_ff(agc_thr1_cntx_1_sel_ff),
  .agc_thr2_cntx_0_sel_ff(agc_thr2_cntx_0_sel_ff),
  .agc_thr2_cntx_1_sel_ff(agc_thr2_cntx_1_sel_ff),
  .agc_thr3_cntx_0_sel_ff(agc_thr3_cntx_0_sel_ff),
  .agc_thr3_cntx_1_sel_ff(agc_thr3_cntx_1_sel_ff),
  .agc_thr4_cntx_0_sel_ff(agc_thr4_cntx_0_sel_ff),
  .agc_thr4_cntx_1_sel_ff(agc_thr4_cntx_1_sel_ff),
  .agc_thr5_cntx_0_sel_ff(agc_thr5_cntx_0_sel_ff),
  .agc_thr5_cntx_1_sel_ff(agc_thr5_cntx_1_sel_ff),
  .agc_thr6_cntx_0_sel_ff(agc_thr6_cntx_0_sel_ff),
  .agc_thr6_cntx_1_sel_ff(agc_thr6_cntx_1_sel_ff),
  .agc_thr7_cntx_0_sel_ff(agc_thr7_cntx_0_sel_ff),
  .agc_thr7_cntx_1_sel_ff(agc_thr7_cntx_1_sel_ff),
  .agc_thr0_cntx_0_sel(agc_thr0_cntx_0_sel[1:0]),
  .agc_thr0_cntx_1_sel(agc_thr0_cntx_1_sel[1:0]),
  .agc_thr1_cntx_0_sel(agc_thr1_cntx_0_sel[1:0]),
  .agc_thr1_cntx_1_sel(agc_thr1_cntx_1_sel[1:0]),
  .agc_thr2_cntx_0_sel(agc_thr2_cntx_0_sel[1:0]),
  .agc_thr2_cntx_1_sel(agc_thr2_cntx_1_sel[1:0]),
  .agc_thr3_cntx_0_sel(agc_thr3_cntx_0_sel[1:0]),
  .agc_thr3_cntx_1_sel(agc_thr3_cntx_1_sel[1:0]),
  .agc_thr4_cntx_0_sel(agc_thr4_cntx_0_sel[1:0]),
  .agc_thr4_cntx_1_sel(agc_thr4_cntx_1_sel[1:0]),
  .agc_thr5_cntx_0_sel(agc_thr5_cntx_0_sel[1:0]),
  .agc_thr5_cntx_1_sel(agc_thr5_cntx_1_sel[1:0]),
  .agc_thr6_cntx_0_sel(agc_thr6_cntx_0_sel[1:0]),
  .agc_thr6_cntx_1_sel(agc_thr6_cntx_1_sel[1:0]),
  .agc_thr7_cntx_0_sel(agc_thr7_cntx_0_sel[1:0]),
  .agc_thr7_cntx_1_sel(agc_thr7_cntx_1_sel[1:0]),
  .ftp_itb_fetch_thr_bf(ftp_itb_fetch_thr_bf[7:0]),
  .itc_thr_to_write(itc_thr_to_write[7:0]),
  .tlu_tl_gt_0(tlu_tl_gt_0[7:0]),
  .ftp_itlb_probe_req_l(ftp_itlb_probe_req_l),
  .ctx_curr_cntx_0_bf(ctx_curr_cntx_0_bf[12:0]),
  .ctx_curr_cntx_1_bf(ctx_curr_cntx_1_bf[12:0]),
  .ctx_cntx_0_to_write_bf(ctx_cntx_0_to_write_bf[13:0]),
  .ctx_cntx_1_to_write_bf(ctx_cntx_1_to_write_bf[13:0])
);
                                                          
ifu_ftu_agc_ctl ftu_agc_ctl( 
  .scan_in(ftu_agc_ctl_scanin),
  .scan_out(ftu_agc_ctl_scanout),
  .l2clk(l2clk),
  .tlb_pgsize({itb_tte_data[17],itb_tte_data[10],itb_tte_data[6]}),
  .itb_tte_tag_parity(itb_tte_data[37]),
  .fill_paddr_bit_5(cmu_fill_paddr[5]) ,
  .tlb_nfo(itb_tte_data[5]) ,
  .itc_real_bf(itd_tag[52]) ,
  .ftu_paddr_unq_39(ftu_paddr_unq[39]) ,
  .asi_vl_arr_data(asi_wr_data[31:30]) ,
  .inv_paddr_bit_5(cmu_icache_invalidate_index[5]),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tlu_trap_pc_0_valid(tlu_trap_pc_0_valid),
  .tlu_retry(tlu_retry[1:0]),
  .tlu_ceter_pscce(tlu_ceter_pscce[7:0]),
  .tlu_trap_pc_1_valid(tlu_trap_pc_1_valid),
  .tlu_ifu_invalidate(tlu_ifu_invalidate[1:0]),
  .tlu_trap_0_tid(tlu_trap_0_tid[1:0]),
  .tlu_trap_1_tid(tlu_trap_1_tid[1:0]),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_addr(mbi_addr[8:6]),
  .mbi_cmpsel(mbi_cmpsel[2:0]),
  .mbi_run(mbi_run),
  .mbi_icv_write_en(mbi_icv_write_en),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .tlu_ifu_hpstate_hpriv(tlu_ifu_hpstate_hpriv[7:0]),
  .tlu_ifu_pstate_priv(tlu_ifu_pstate_priv[7:0]),
  .tlu_cerer_ittp(tlu_cerer_ittp),
  .tlu_cerer_itdp(tlu_cerer_itdp),
  .tlu_cerer_ittm(tlu_cerer_ittm),
  .tlu_cerer_icl2c(tlu_cerer_icl2c),
  .tlu_cerer_icl2u(tlu_cerer_icl2u),
  .tlu_cerer_icl2nd(tlu_cerer_icl2nd),
  .tlu_cerer_icvp(tlu_cerer_icvp),
  .tlu_cerer_ictp(tlu_cerer_ictp),
  .tlu_cerer_ictm(tlu_cerer_ictm),
  .agd_va_hole_excp_f(agd_va_hole_excp_f),
  .agd_itlb_valid_f(agd_itlb_valid_f[7:0]),
  .agd_itlb_valid_dupl_f(agd_itlb_valid_dupl_f[7:0]),
  .asi_ith_det_req(asi_ith_det_req),
  .ftp_asi_tg_wr_req_hold(ftp_asi_tg_wr_req_hold),
  .ftp_itlb_cam_vld_f(ftp_itlb_cam_vld_f),
  .asi_addr_bf(asi_addr_bf[6:3]),
  .asi_way_bf(asi_way_bf[2:0]),
  .ifu_agd_pc_f(ifu_agd_pc_f[47:2]),
  .agd_thr0_pc_4_2_f(agd_thr0_pc_4_2_f[4:2]),
  .agd_thr1_pc_4_2_f(agd_thr1_pc_4_2_f[4:2]),
  .agd_thr2_pc_4_2_f(agd_thr2_pc_4_2_f[4:2]),
  .agd_thr3_pc_4_2_f(agd_thr3_pc_4_2_f[4:2]),
  .agd_thr4_pc_4_2_f(agd_thr4_pc_4_2_f[4:2]),
  .agd_thr5_pc_4_2_f(agd_thr5_pc_4_2_f[4:2]),
  .agd_thr6_pc_4_2_f(agd_thr6_pc_4_2_f[4:2]),
  .agd_thr7_pc_4_2_f(agd_thr7_pc_4_2_f[4:2]),
  .dec_load_flush_w(dec_load_flush_w[1:0]),
  .itc_bypass_bf(itc_bypass_bf),
  .itc_demap_next(itc_demap_next),
  .ftp_curr_fetch_thr_f(ftp_curr_fetch_thr_f[7:0]),
  .ftp_fetch_thr_q_f(ftp_fetch_thr_q_f[7:0]),
  .ftp_fill_req_q_bf(ftp_fill_req_q_bf),
  .ftp_any_thr_clken(ftp_any_thr_clken),
  .err_w0_8b_parity_f(err_w0_8b_parity_f[3:0]),
  .err_w1_8b_parity_f(err_w1_8b_parity_f[3:0]),
  .err_w2_8b_parity_f(err_w2_8b_parity_f[3:0]),
  .err_w3_8b_parity_f(err_w3_8b_parity_f[3:0]),
  .err_w4_8b_parity_f(err_w4_8b_parity_f[3:0]),
  .err_w5_8b_parity_f(err_w5_8b_parity_f[3:0]),
  .err_w6_8b_parity_f(err_w6_8b_parity_f[3:0]),
  .err_w7_8b_parity_f(err_w7_8b_parity_f[3:0]),
  .tsm_thr0_ignore_by_pass(tsm_thr0_ignore_by_pass),
  .tsm_thr1_ignore_by_pass(tsm_thr1_ignore_by_pass),
  .tsm_thr2_ignore_by_pass(tsm_thr2_ignore_by_pass),
  .tsm_thr3_ignore_by_pass(tsm_thr3_ignore_by_pass),
  .tsm_thr4_ignore_by_pass(tsm_thr4_ignore_by_pass),
  .tsm_thr5_ignore_by_pass(tsm_thr5_ignore_by_pass),
  .tsm_thr6_ignore_by_pass(tsm_thr6_ignore_by_pass),
  .tsm_thr7_ignore_by_pass(tsm_thr7_ignore_by_pass),
  .tsm_thr0_no_new_miss(tsm_thr0_no_new_miss),
  .tsm_thr1_no_new_miss(tsm_thr1_no_new_miss),
  .tsm_thr2_no_new_miss(tsm_thr2_no_new_miss),
  .tsm_thr3_no_new_miss(tsm_thr3_no_new_miss),
  .tsm_thr4_no_new_miss(tsm_thr4_no_new_miss),
  .tsm_thr5_no_new_miss(tsm_thr5_no_new_miss),
  .tsm_thr6_no_new_miss(tsm_thr6_no_new_miss),
  .tsm_thr7_no_new_miss(tsm_thr7_no_new_miss),
  .cmu_any_data_ready(cmu_any_data_ready),
  .cmu_any_un_cacheable(cmu_any_un_cacheable),
  .cmu_l2_err(cmu_l2_err[1:0]),
  .cmu_l2miss(cmu_l2miss),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .cmu_fill_wrway(cmu_fill_wrway[2:0]),
  .cmu_icache_invalidate(cmu_icache_invalidate),
  .cmu_evic_invalidate(cmu_evic_invalidate),
  .cmu_icache_invalidate_way(cmu_icache_invalidate_way[2:0]),
  .cmu_icache_inv_way1(cmu_icache_inv_way1[2:0]),
  .cmu_instr_v(cmu_instr_v[3:0]),
  .dec_br_taken_e(dec_br_taken_e[1:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .ftp_tid0_e(ftp_tid0_e[1:0]),
  .ftp_tid1_e(ftp_tid1_e[1:0]),
  .ftp_fetch_v_f(ftp_fetch_v_f),
  .itb_chit_c(itb_chit_c),
  .itb_cam_hit_c(itb_cam_hit_c),
  .itb_tte_p_c(itb_tte_p_c),
  .itb_itb_mhit_c(itb_itb_mhit_c),
  .itb_tte_data_parity(itb_tte_data_parity),
  .itb_icd_waysel_c(itb_icd_waysel_c[7:0]),
  .lsu_ifu_tid_w(lsu_ifu_tid_w[2:0]),
  .lsu_ifu_wr_p0ctxt(lsu_ifu_wr_p0ctxt),
  .lsu_ifu_wr_p1ctxt(lsu_ifu_wr_p1ctxt),
  .lsu_ifu_no_miss(lsu_ifu_no_miss[7:0]),
  .lsu_ic_enable(lsu_ic_enable[7:0]),
  .cmu_inval_ack(cmu_inval_ack[7:0]),
  .ftp_asi_mbist_access_bf(ftp_asi_mbist_access_bf),
  .itd_prty_256m(itd_prty_256m),
  .itd_prty_4m(itd_prty_4m),
  .itd_prty_64k(itd_prty_64k),
  .itd_prty_8k(itd_prty_8k),
  .itd_prty_ctxt0(itd_prty_ctxt0),
  .itd_prty_ctxt1(itd_prty_ctxt1),
  .tlb_context0_hit(tlb_context0_hit),
  .ftu_buffer_wr_en_f(ftu_buffer_wr_en_f[7:0]),
  .agc_itb_tag_perr_c(agc_itb_tag_perr_c),
  .agc_vl_data_c(agc_vl_data_c[1:0]),
  .agc_asi_sel_word_c(agc_asi_sel_word_c[3:0]),
  .agc_sel_tg_data_f(agc_sel_tg_data_f[7:0]),
  .agc_word_en_bf(agc_word_en_bf[7:0]),
  .agc_by_pass_update_lru_bf(agc_by_pass_update_lru_bf[7:0]),
  .agc_invalidation_req_ff(agc_invalidation_req_ff[7:0]),
  .agc_any_invalidation_req_f(agc_any_invalidation_req_f),
  .agc_thr0_sf_valid_f(agc_thr0_sf_valid_f),
  .agc_thr1_sf_valid_f(agc_thr1_sf_valid_f),
  .agc_thr2_sf_valid_f(agc_thr2_sf_valid_f),
  .agc_thr3_sf_valid_f(agc_thr3_sf_valid_f),
  .agc_thr4_sf_valid_f(agc_thr4_sf_valid_f),
  .agc_thr5_sf_valid_f(agc_thr5_sf_valid_f),
  .agc_thr6_sf_valid_f(agc_thr6_sf_valid_f),
  .agc_thr7_sf_valid_f(agc_thr7_sf_valid_f),
  .agc_thr0_micro_flush_unq_c(agc_thr0_micro_flush_unq_c),
  .agc_thr1_micro_flush_unq_c(agc_thr1_micro_flush_unq_c),
  .agc_thr2_micro_flush_unq_c(agc_thr2_micro_flush_unq_c),
  .agc_thr3_micro_flush_unq_c(agc_thr3_micro_flush_unq_c),
  .agc_thr4_micro_flush_unq_c(agc_thr4_micro_flush_unq_c),
  .agc_thr5_micro_flush_unq_c(agc_thr5_micro_flush_unq_c),
  .agc_thr6_micro_flush_unq_c(agc_thr6_micro_flush_unq_c),
  .agc_thr7_micro_flush_unq_c(agc_thr7_micro_flush_unq_c),
  .agc_thr0_err_detect_c(agc_thr0_err_detect_c),
  .agc_thr1_err_detect_c(agc_thr1_err_detect_c),
  .agc_thr2_err_detect_c(agc_thr2_err_detect_c),
  .agc_thr3_err_detect_c(agc_thr3_err_detect_c),
  .agc_thr4_err_detect_c(agc_thr4_err_detect_c),
  .agc_thr5_err_detect_c(agc_thr5_err_detect_c),
  .agc_thr6_err_detect_c(agc_thr6_err_detect_c),
  .agc_thr7_err_detect_c(agc_thr7_err_detect_c),
  .agc_thr0_cmiss_stm_c(agc_thr0_cmiss_stm_c),
  .agc_thr1_cmiss_stm_c(agc_thr1_cmiss_stm_c),
  .agc_thr2_cmiss_stm_c(agc_thr2_cmiss_stm_c),
  .agc_thr3_cmiss_stm_c(agc_thr3_cmiss_stm_c),
  .agc_thr4_cmiss_stm_c(agc_thr4_cmiss_stm_c),
  .agc_thr5_cmiss_stm_c(agc_thr5_cmiss_stm_c),
  .agc_thr6_cmiss_stm_c(agc_thr6_cmiss_stm_c),
  .agc_thr7_cmiss_stm_c(agc_thr7_cmiss_stm_c),
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
  .ifu_ibuffer_write_c(ifu_ibuffer_write_c[7:0]),
  .ftu_fetch_thr_c(ftu_fetch_thr_c[7:0]),
  .ftu_instr_sf_valid_c(ftu_instr_sf_valid_c),
  .ftu_excp_way_d(ftu_excp_way_d[2:0]),
  .ftu_excp_tid_d(ftu_excp_tid_d[2:0]),
  .ftu_excp_way_valid_d(ftu_excp_way_valid_d),
  .agc_fill_wrway_bf(agc_fill_wrway_bf[2:0]),
  .agc_sel_inv_index(agc_sel_inv_index[3:0]),
  .agc_thr0_lsu_no_ic_miss(agc_thr0_lsu_no_ic_miss),
  .agc_thr1_lsu_no_ic_miss(agc_thr1_lsu_no_ic_miss),
  .agc_thr2_lsu_no_ic_miss(agc_thr2_lsu_no_ic_miss),
  .agc_thr3_lsu_no_ic_miss(agc_thr3_lsu_no_ic_miss),
  .agc_thr4_lsu_no_ic_miss(agc_thr4_lsu_no_ic_miss),
  .agc_thr5_lsu_no_ic_miss(agc_thr5_lsu_no_ic_miss),
  .agc_thr6_lsu_no_ic_miss(agc_thr6_lsu_no_ic_miss),
  .agc_thr7_lsu_no_ic_miss(agc_thr7_lsu_no_ic_miss),
  .agc_thr0_itb_miss_c(agc_thr0_itb_miss_c),
  .agc_thr1_itb_miss_c(agc_thr1_itb_miss_c),
  .agc_thr2_itb_miss_c(agc_thr2_itb_miss_c),
  .agc_thr3_itb_miss_c(agc_thr3_itb_miss_c),
  .agc_thr4_itb_miss_c(agc_thr4_itb_miss_c),
  .agc_thr5_itb_miss_c(agc_thr5_itb_miss_c),
  .agc_thr6_itb_miss_c(agc_thr6_itb_miss_c),
  .agc_thr7_itb_miss_c(agc_thr7_itb_miss_c),
  .ftu_ic_no_err_c(ftu_ic_no_err_c),
  .ftu_bus_0_is_first(ftu_bus_0_is_first),
  .ftu_bus_1_is_first(ftu_bus_1_is_first),
  .ftu_bus_2_is_first(ftu_bus_2_is_first),
  .ftu_bus_3_is_first(ftu_bus_3_is_first),
  .ftu_instr_valid_c(ftu_instr_valid_c[3:0]),
  .ftu_exception_valid_c(ftu_exception_valid_c),
  .ftu_instr_exceptions_c(ftu_instr_exceptions_c[4:0]),
  .agc_thr0_pcf_sel_bf(agc_thr0_pcf_sel_bf[3:0]),
  .agc_thr1_pcf_sel_bf(agc_thr1_pcf_sel_bf[3:0]),
  .agc_thr2_pcf_sel_bf(agc_thr2_pcf_sel_bf[3:0]),
  .agc_thr3_pcf_sel_bf(agc_thr3_pcf_sel_bf[3:0]),
  .agc_thr4_pcf_sel_bf(agc_thr4_pcf_sel_bf[3:0]),
  .agc_thr5_pcf_sel_bf(agc_thr5_pcf_sel_bf[3:0]),
  .agc_thr6_pcf_sel_bf(agc_thr6_pcf_sel_bf[3:0]),
  .agc_thr7_pcf_sel_bf(agc_thr7_pcf_sel_bf[3:0]),
  .agc_thr0_pcf_sel_last_bf(agc_thr0_pcf_sel_last_bf[1:0]),
  .agc_thr1_pcf_sel_last_bf(agc_thr1_pcf_sel_last_bf[1:0]),
  .agc_thr2_pcf_sel_last_bf(agc_thr2_pcf_sel_last_bf[1:0]),
  .agc_thr3_pcf_sel_last_bf(agc_thr3_pcf_sel_last_bf[1:0]),
  .agc_thr4_pcf_sel_last_bf(agc_thr4_pcf_sel_last_bf[1:0]),
  .agc_thr5_pcf_sel_last_bf(agc_thr5_pcf_sel_last_bf[1:0]),
  .agc_thr6_pcf_sel_last_bf(agc_thr6_pcf_sel_last_bf[1:0]),
  .agc_thr7_pcf_sel_last_bf(agc_thr7_pcf_sel_last_bf[1:0]),
  .agc_icv_wr_req_bf(agc_icv_wr_req_bf),
  .agc_icv_wrdata_bf(agc_icv_wrdata_bf[31:0]),
  .agc_icv_wren_bf(agc_icv_wren_bf[31:0]),
  .ftu_thr0_redirect_bf(ftu_thr0_redirect_bf),
  .ftu_thr1_redirect_bf(ftu_thr1_redirect_bf),
  .ftu_thr2_redirect_bf(ftu_thr2_redirect_bf),
  .ftu_thr3_redirect_bf(ftu_thr3_redirect_bf),
  .ftu_thr4_redirect_bf(ftu_thr4_redirect_bf),
  .ftu_thr5_redirect_bf(ftu_thr5_redirect_bf),
  .ftu_thr6_redirect_bf(ftu_thr6_redirect_bf),
  .ftu_thr7_redirect_bf(ftu_thr7_redirect_bf),
  .ftu_ibu_redirect_bf(ftu_ibu_redirect_bf[7:0]),
  .agc_thr0_tlu_redirect_bf(agc_thr0_tlu_redirect_bf),
  .agc_thr1_tlu_redirect_bf(agc_thr1_tlu_redirect_bf),
  .agc_thr2_tlu_redirect_bf(agc_thr2_tlu_redirect_bf),
  .agc_thr3_tlu_redirect_bf(agc_thr3_tlu_redirect_bf),
  .agc_thr4_tlu_redirect_bf(agc_thr4_tlu_redirect_bf),
  .agc_thr5_tlu_redirect_bf(agc_thr5_tlu_redirect_bf),
  .agc_thr6_tlu_redirect_bf(agc_thr6_tlu_redirect_bf),
  .agc_thr7_tlu_redirect_bf(agc_thr7_tlu_redirect_bf),
  .agc_kill_fetch_cv_c(agc_kill_fetch_cv_c),
  .agc_pc_sel_for_c(agc_pc_sel_for_c[3:0]),
  .agc_instr_bp_sel_c(agc_instr_bp_sel_c[2:0]),
  .agc_thr0_byp_incr_bit5(agc_thr0_byp_incr_bit5),
  .agc_thr1_byp_incr_bit5(agc_thr1_byp_incr_bit5),
  .agc_thr2_byp_incr_bit5(agc_thr2_byp_incr_bit5),
  .agc_thr3_byp_incr_bit5(agc_thr3_byp_incr_bit5),
  .agc_thr4_byp_incr_bit5(agc_thr4_byp_incr_bit5),
  .agc_thr5_byp_incr_bit5(agc_thr5_byp_incr_bit5),
  .agc_thr6_byp_incr_bit5(agc_thr6_byp_incr_bit5),
  .agc_thr7_byp_incr_bit5(agc_thr7_byp_incr_bit5),
  .agc_thr0_byp_pc_update_bf(agc_thr0_byp_pc_update_bf[4:2]),
  .agc_thr1_byp_pc_update_bf(agc_thr1_byp_pc_update_bf[4:2]),
  .agc_thr2_byp_pc_update_bf(agc_thr2_byp_pc_update_bf[4:2]),
  .agc_thr3_byp_pc_update_bf(agc_thr3_byp_pc_update_bf[4:2]),
  .agc_thr4_byp_pc_update_bf(agc_thr4_byp_pc_update_bf[4:2]),
  .agc_thr5_byp_pc_update_bf(agc_thr5_byp_pc_update_bf[4:2]),
  .agc_thr6_byp_pc_update_bf(agc_thr6_byp_pc_update_bf[4:2]),
  .agc_thr7_byp_pc_update_bf(agc_thr7_byp_pc_update_bf[4:2]),
  .agc_thr0_cntx_0_sel(agc_thr0_cntx_0_sel[1:0]),
  .agc_thr0_cntx_1_sel(agc_thr0_cntx_1_sel[1:0]),
  .agc_thr1_cntx_0_sel(agc_thr1_cntx_0_sel[1:0]),
  .agc_thr1_cntx_1_sel(agc_thr1_cntx_1_sel[1:0]),
  .agc_thr2_cntx_0_sel(agc_thr2_cntx_0_sel[1:0]),
  .agc_thr2_cntx_1_sel(agc_thr2_cntx_1_sel[1:0]),
  .agc_thr3_cntx_0_sel(agc_thr3_cntx_0_sel[1:0]),
  .agc_thr3_cntx_1_sel(agc_thr3_cntx_1_sel[1:0]),
  .agc_thr4_cntx_0_sel(agc_thr4_cntx_0_sel[1:0]),
  .agc_thr4_cntx_1_sel(agc_thr4_cntx_1_sel[1:0]),
  .agc_thr5_cntx_0_sel(agc_thr5_cntx_0_sel[1:0]),
  .agc_thr5_cntx_1_sel(agc_thr5_cntx_1_sel[1:0]),
  .agc_thr6_cntx_0_sel(agc_thr6_cntx_0_sel[1:0]),
  .agc_thr6_cntx_1_sel(agc_thr6_cntx_1_sel[1:0]),
  .agc_thr7_cntx_0_sel(agc_thr7_cntx_0_sel[1:0]),
  .agc_thr7_cntx_1_sel(agc_thr7_cntx_1_sel[1:0]),
  .agc_thr0_cntx_0_sel_ff(agc_thr0_cntx_0_sel_ff),
  .agc_thr0_cntx_1_sel_ff(agc_thr0_cntx_1_sel_ff),
  .agc_thr1_cntx_0_sel_ff(agc_thr1_cntx_0_sel_ff),
  .agc_thr1_cntx_1_sel_ff(agc_thr1_cntx_1_sel_ff),
  .agc_thr2_cntx_0_sel_ff(agc_thr2_cntx_0_sel_ff),
  .agc_thr2_cntx_1_sel_ff(agc_thr2_cntx_1_sel_ff),
  .agc_thr3_cntx_0_sel_ff(agc_thr3_cntx_0_sel_ff),
  .agc_thr3_cntx_1_sel_ff(agc_thr3_cntx_1_sel_ff),
  .agc_thr4_cntx_0_sel_ff(agc_thr4_cntx_0_sel_ff),
  .agc_thr4_cntx_1_sel_ff(agc_thr4_cntx_1_sel_ff),
  .agc_thr5_cntx_0_sel_ff(agc_thr5_cntx_0_sel_ff),
  .agc_thr5_cntx_1_sel_ff(agc_thr5_cntx_1_sel_ff),
  .agc_thr6_cntx_0_sel_ff(agc_thr6_cntx_0_sel_ff),
  .agc_thr6_cntx_1_sel_ff(agc_thr6_cntx_1_sel_ff),
  .agc_thr7_cntx_0_sel_ff(agc_thr7_cntx_0_sel_ff),
  .agc_thr7_cntx_1_sel_ff(agc_thr7_cntx_1_sel_ff),
  .ftu_mbi_tlb_cam_hit(ftu_mbi_tlb_cam_hit),
  .ftu_mbi_tlb_ctxt0_hit(ftu_mbi_tlb_ctxt0_hit),
  .ftu_mbi_tlb_cam_mhit(ftu_mbi_tlb_cam_mhit));                                                        

ifu_ftu_cms_ctl ftu_cms_ctl( 
  .scan_in(ftu_cms_ctl_scanin),
  .scan_out(ftu_cms_ctl_scanout),
  .l2clk(l2clk),
  .itb_tte_cp_c(itb_tte_data[3]),
  .cmu_ic_data_parity({cmu_ic_data[263],cmu_ic_data[230],cmu_ic_data[197],cmu_ic_data[164],
                       cmu_ic_data[131],cmu_ic_data[98],cmu_ic_data[65],cmu_ic_data[32]}),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lsu_ic_enable(lsu_ic_enable[7:0]),
  .lsu_ifu_direct_map(lsu_ifu_direct_map),
  .agd_direct_map_rep_way(agd_direct_map_rep_way[2:0]),
  .ftp_curr_fetch_thr_f(ftp_curr_fetch_thr_f[7:0]),
  .ftu_agc_thr0_cmiss_c(ftu_agc_thr0_cmiss_c),
  .ftu_agc_thr1_cmiss_c(ftu_agc_thr1_cmiss_c),
  .ftu_agc_thr2_cmiss_c(ftu_agc_thr2_cmiss_c),
  .ftu_agc_thr3_cmiss_c(ftu_agc_thr3_cmiss_c),
  .ftu_agc_thr4_cmiss_c(ftu_agc_thr4_cmiss_c),
  .ftu_agc_thr5_cmiss_c(ftu_agc_thr5_cmiss_c),
  .ftu_agc_thr6_cmiss_c(ftu_agc_thr6_cmiss_c),
  .ftu_agc_thr7_cmiss_c(ftu_agc_thr7_cmiss_c),
  .ftu_paddr_unq(ftu_paddr_unq[39:37]),
  .agc_any_invalidation_req_f(agc_any_invalidation_req_f),
  .itc_bypass_bf(itc_bypass_bf),
  .cmu_l2_err(cmu_l2_err[1:0]),
  .tlu_cerer_icl2u(tlu_cerer_icl2u),
  .tlu_cerer_icl2nd(tlu_cerer_icl2nd),
  .ftu_thrx_un_cacheable(ftu_thrx_un_cacheable),
  .ftu_rep_way(ftu_rep_way[2:0]),
  .cms_ic_modified_parity(cms_ic_modified_parity[7:0]),
  .ftu_paddr(ftu_paddr[39:37])) ;


////////////////////////////////////////////////////////////////////////
// Icache Data                                                        //
////////////////////////////////////////////////////////////////////////

assign word2_reordered[32:0] = {cmu_ic_data[66],cmu_ic_data[67],cmu_ic_data[68],cmu_ic_data[69],
                                cmu_ic_data[70],cmu_ic_data[71],cmu_ic_data[72],cmu_ic_data[73],
                                cmu_ic_data[74],cmu_ic_data[75],cmu_ic_data[76],cmu_ic_data[77],
                                cmu_ic_data[78],cmu_ic_data[79],cmu_ic_data[80],cmu_ic_data[81],
                                cmu_ic_data[82],cmu_ic_data[83],cmu_ic_data[84],cmu_ic_data[85],
                                cmu_ic_data[86],cmu_ic_data[87],cmu_ic_data[88],cmu_ic_data[89],
                                cmu_ic_data[90],cmu_ic_data[91],cmu_ic_data[92],cmu_ic_data[93],
                                cmu_ic_data[94],cmu_ic_data[95],cmu_ic_data[96],cmu_ic_data[97],
                                cms_ic_modified_parity[2]};

assign word3_reordered[32:0] = {cmu_ic_data[99],cmu_ic_data[100],cmu_ic_data[101],cmu_ic_data[102],
                                cmu_ic_data[103],cmu_ic_data[104],cmu_ic_data[105],cmu_ic_data[106],
                                cmu_ic_data[107],cmu_ic_data[108],cmu_ic_data[109],cmu_ic_data[110],
                                cmu_ic_data[111],cmu_ic_data[112],cmu_ic_data[113],cmu_ic_data[114],
                                cmu_ic_data[115],cmu_ic_data[116],cmu_ic_data[117],cmu_ic_data[118],
                                cmu_ic_data[119],cmu_ic_data[120],cmu_ic_data[121],cmu_ic_data[122],
                                cmu_ic_data[123],cmu_ic_data[124],cmu_ic_data[125],cmu_ic_data[126],
                                cmu_ic_data[127],cmu_ic_data[128],cmu_ic_data[129],cmu_ic_data[130],
                                cms_ic_modified_parity[3]};

assign word6_reordered[32:0] = {cmu_ic_data[198],cmu_ic_data[199],cmu_ic_data[200],cmu_ic_data[201],
                                cmu_ic_data[202],cmu_ic_data[203],cmu_ic_data[204],cmu_ic_data[205],
                                cmu_ic_data[206],cmu_ic_data[207],cmu_ic_data[208],cmu_ic_data[209],
                                cmu_ic_data[210],cmu_ic_data[211],cmu_ic_data[212],cmu_ic_data[213],
                                cmu_ic_data[214],cmu_ic_data[215],cmu_ic_data[216],cmu_ic_data[217],
                                cmu_ic_data[218],cmu_ic_data[219],cmu_ic_data[220],cmu_ic_data[221],
                                cmu_ic_data[222],cmu_ic_data[223],cmu_ic_data[224],cmu_ic_data[225],
                                cmu_ic_data[226],cmu_ic_data[227],cmu_ic_data[228],cmu_ic_data[229],
                                cms_ic_modified_parity[6]};

assign word7_reordered[32:0] = {cmu_ic_data[231],cmu_ic_data[232],cmu_ic_data[233],cmu_ic_data[234],
                                cmu_ic_data[235],cmu_ic_data[236],cmu_ic_data[237],cmu_ic_data[238],
                                cmu_ic_data[239],cmu_ic_data[240],cmu_ic_data[241],cmu_ic_data[242],
                                cmu_ic_data[243],cmu_ic_data[244],cmu_ic_data[245],cmu_ic_data[246],
                                cmu_ic_data[247],cmu_ic_data[248],cmu_ic_data[249],cmu_ic_data[250],
                                cmu_ic_data[251],cmu_ic_data[252],cmu_ic_data[253],cmu_ic_data[254],
                                cmu_ic_data[255],cmu_ic_data[256],cmu_ic_data[257],cmu_ic_data[258],
                                cmu_ic_data[259],cmu_ic_data[260],cmu_ic_data[261],cmu_ic_data[262],
                                cms_ic_modified_parity[7]};

n2_icd_sp_16p5kb_cust ftu_icd_cust( 
   .red_en_in({2{hdr_sram_rvalue[0]}}) ,
   .red_d_in(hdr_sram_rvalue[5:1]) ,
   .rid_in(hdr_sram_rid[3:0]) ,
   .red_wen(hdr_sram_wr_en) ,
   .red_arst(hdr_sram_red_clr) ,
   .red_d_out(sram_hdr_read_data[5:1]),
   .red_en_out({red_en_unused,sram_hdr_read_data[0]}),
   .tcu_aclk(spc_aclk),
   .tcu_bclk(spc_bclk),
   .cmu_ic_data({word7_reordered[32:0],
                 word6_reordered[32:0],
                 cms_ic_modified_parity[5],cmu_ic_data[196:165],
                 cms_ic_modified_parity[4],cmu_ic_data[163:132],
                 word3_reordered[32:0],
                 word2_reordered[32:0],
                 cms_ic_modified_parity[1],cmu_ic_data[64:33]  ,
                 cms_ic_modified_parity[0],cmu_ic_data[31:0]  }),
   .icd_bus_2_instr_c({icd_bus_2_instr_c [0],icd_bus_2_instr_c [1],icd_bus_2_instr_c [2],icd_bus_2_instr_c [3],
                       icd_bus_2_instr_c [4],icd_bus_2_instr_c [5],icd_bus_2_instr_c [6],icd_bus_2_instr_c [7],
                       icd_bus_2_instr_c [8],icd_bus_2_instr_c [9],icd_bus_2_instr_c[10],icd_bus_2_instr_c[11],
                       icd_bus_2_instr_c[12],icd_bus_2_instr_c[13],icd_bus_2_instr_c[14],icd_bus_2_instr_c[15],
                       icd_bus_2_instr_c[16],icd_bus_2_instr_c[17],icd_bus_2_instr_c[18],icd_bus_2_instr_c[19],
                       icd_bus_2_instr_c[20],icd_bus_2_instr_c[21],icd_bus_2_instr_c[22],icd_bus_2_instr_c[23],
                       icd_bus_2_instr_c[24],icd_bus_2_instr_c[25],icd_bus_2_instr_c[26],icd_bus_2_instr_c[27],
                       icd_bus_2_instr_c[28],icd_bus_2_instr_c[29],icd_bus_2_instr_c[30],icd_bus_2_instr_c[31],
                       icd_bus_2_instr_c[32]}),
   .icd_bus_3_instr_c({icd_bus_3_instr_c [0],icd_bus_3_instr_c [1],icd_bus_3_instr_c [2],icd_bus_3_instr_c [3],
                       icd_bus_3_instr_c [4],icd_bus_3_instr_c [5],icd_bus_3_instr_c [6],icd_bus_3_instr_c [7],
                       icd_bus_3_instr_c [8],icd_bus_3_instr_c [9],icd_bus_3_instr_c[10],icd_bus_3_instr_c[11],
                       icd_bus_3_instr_c[12],icd_bus_3_instr_c[13],icd_bus_3_instr_c[14],icd_bus_3_instr_c[15],
                       icd_bus_3_instr_c[16],icd_bus_3_instr_c[17],icd_bus_3_instr_c[18],icd_bus_3_instr_c[19],
                       icd_bus_3_instr_c[20],icd_bus_3_instr_c[21],icd_bus_3_instr_c[22],icd_bus_3_instr_c[23],
                       icd_bus_3_instr_c[24],icd_bus_3_instr_c[25],icd_bus_3_instr_c[26],icd_bus_3_instr_c[27],
                       icd_bus_3_instr_c[28],icd_bus_3_instr_c[29],icd_bus_3_instr_c[30],icd_bus_3_instr_c[31],
                       icd_bus_3_instr_c[32]}),
   .scan_in(ftu_icd_cust_scanin),
   .scan_out(ftu_icd_cust_scanout),
   .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_scan_en(tcu_scan_en),
  .ftp_icd_quad_0_en_bf(ftp_icd_quad_0_en_bf),
  .ftp_icd_quad_1_en_bf(ftp_icd_quad_1_en_bf),
  .ftp_icd_quad_2_en_bf(ftp_icd_quad_2_en_bf),
  .ftp_icd_quad_3_en_bf(ftp_icd_quad_3_en_bf),
  .agd_ic_index_bf(agd_ic_index_bf[10:2]),
  .agc_fill_wrway_bf(agc_fill_wrway_bf[2:0]),
  .agd_asi_bist_wrdata(agd_asi_bist_wrdata[32:0]),
  .itb_icd_waysel_c(itb_icd_waysel_c[7:0]),
  .agc_word_en_bf(agc_word_en_bf[7:0]),
  .ftp_ic_rd_req_bf(ftp_ic_rd_req_bf),
  .ftp_ic_wr_req_bf(ftp_ic_wr_req_bf),
  .ftp_ic_wr_ps_en_bf(ftp_ic_wr_ps_en_bf),
  .ftp_asi_mbist_access_bf(ftp_asi_mbist_access_bf),
  .vnw_ary(vnw_ary),
  .icd_bus_0_instr_c(icd_bus_0_instr_c[32:0]),
  .icd_bus_1_instr_c(icd_bus_1_instr_c[32:0]) 
) ;

////////////////////////////////////////////////////////////////////////
// Redundancy header for I$
////////////////////////////////////////////////////////////////////////
ifu_ftu_red_ctl hdr (
   .scan_in(hdr_scanin),
   .scan_out(hdr_scanout),
   .l2clk		(l2clk),
  .efu_spc_fuse_data(efu_spc_fuse_data),
  .efu_spc_fuse_ixfer_en(efu_spc_fuse_ixfer_en),
  .efu_spc_fuse_iclr(efu_spc_fuse_iclr),
  .io_cmp_sync_en(io_cmp_sync_en),
  .cmp_io_sync_en(cmp_io_sync_en),
  .spc_efu_fuse_idata(spc_efu_fuse_idata),
  .spc_efu_fuse_ixfer_en(spc_efu_fuse_ixfer_en),
  .hdr_sram_rvalue(hdr_sram_rvalue[5:0]),
  .hdr_sram_rid(hdr_sram_rid[3:0]),
  .hdr_sram_wr_en(hdr_sram_wr_en),
  .hdr_sram_red_clr(hdr_sram_red_clr),
  .sram_hdr_read_data(sram_hdr_read_data[5:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en) 
);

////////////////////////////////////////////////////////////////////////
// tag ARRAYS                                                      //
////////////////////////////////////////////////////////////////////////
n2_ict_sp_1920b_cust  ftu_ict_cust  (
   .tcu_aclk(spc_aclk),
   .tcu_bclk(spc_bclk),
   .agd_ic_index_bf(agd_ict_index_bf[10:5]), 
   .scan_in(ftu_ict_cust_scanin),
   .scan_out(ftu_ict_cust_scanout),
   .l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .agc_fill_wrway_bf(agc_fill_wrway_bf[2:0]),
  .ftp_tg_rd_req_bf(ftp_tg_rd_req_bf),
  .ftp_tg_wr_req_bf(ftp_tg_wr_req_bf),
  .ftp_tg_clk_en(ftp_tg_clk_en),
  .agd_ict_wrtag_bf(agd_ict_wrtag_bf[29:0]),
  .ict_itlb_way_0_tag_f(ict_itlb_way_0_tag_f[29:0]),
  .ict_itlb_way_1_tag_f(ict_itlb_way_1_tag_f[29:0]),
  .ict_itlb_way_2_tag_f(ict_itlb_way_2_tag_f[29:0]),
  .ict_itlb_way_3_tag_f(ict_itlb_way_3_tag_f[29:0]),
  .ict_itlb_way_4_tag_f(ict_itlb_way_4_tag_f[29:0]),
  .ict_itlb_way_5_tag_f(ict_itlb_way_5_tag_f[29:0]),
  .ict_itlb_way_6_tag_f(ict_itlb_way_6_tag_f[29:0]),
  .ict_itlb_way_7_tag_f(ict_itlb_way_7_tag_f[29:0]) 
  );


////////////////////////////////////////////////////////////////////////
// icache valid bits.                                              //
////////////////////////////////////////////////////////////////////////
n2_dva_dp_32x32_cust  ftu_icv_cust ( 
   .tcu_aclk(spc_aclk),
   .tcu_bclk(spc_bclk),
   .scan_in(ftu_icv_cust_scanin),
   .scan_out(ftu_icv_cust_scanout),
   .l2clk(l2clk),
   .bit_wen(agc_icv_wren_bf[31:0]),
   .wr_en(agc_icv_wr_req_bf),
   .rd_en(ftp_iv_rd_req_bf),
   .rd_addr(agd_ic_index_bf[`IC_ARR_INDX_HI:6]) ,
   .wr_addr(agd_icv_windex_bf[`IC_ARR_INDX_HI:6]), 
   .din(agc_icv_wrdata_bf[31:0]),
   .dout(icv_valid_f[31:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_scan_en(tcu_scan_en),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .pce(pce) 
  
   );


////////////////////////////////////////////////////////////////////////
// ITLB                                                               //
////////////////////////////////////////////////////////////////////////
assign tte_ubit = itc_tte_ubit;


n2_tlb_tl_64x59_cust ftu_itb_cust ( 
   .tcu_aclk(spc_aclk),
   .tcu_bclk(spc_bclk),
   .scan_in(ftu_itb_cust_scanin),
   .scan_out(ftu_itb_cust_scanout),
   .l2clk(l2clk),
// Inputs

   .disable_clear_ubit  (itc_dis_clr_ubit),
   .tlb_bypass		(itc_bypass_bf),
   .tlb_wr_vld		(itc_wr_u_en),
   .tlb_rd_vld		(itc_itlb_rd_vld_bf),
   .tlb_cam_vld		(ftp_itlb_cam_vld_bf),
   .tlb_rw_index	(itd_rw_index[5:0]),
   .tlb_rw_index_vld	(itc_rw_index_vld),
   .tlb_demap		(itc_demap),
   .tlb_demap_context	(itc_demap_context),
   .tlb_demap_all	(itc_demap_all),
   .tlb_demap_real	(itc_demap_real),
   // Separate page size mask from tag proper
   .tte_tag		({itd_tag[68:52],ifu_agd_pc_bf[47:22],itd_tag[24],
			  ifu_agd_pc_bf[21:16],ifu_agd_pc_bf[15:13],
			  itd_tag[12:0]}),
   .tte_page_size_mask	({itd_tag[25],itd_tag[17],itd_tag[13]}),
   .tte_data		(itd_data[37:0]),
   .tlb_va		(ifu_agd_pc_bf[12:11]),
   .cache_ptag_w0	(ict_itlb_way_0_tag_f_rep0[28:0]),
   .cache_ptag_w1	(ict_itlb_way_1_tag_f_rep0[28:0]),
   .cache_ptag_w2	(ict_itlb_way_2_tag_f_rep0[28:0]),
   .cache_ptag_w3	(ict_itlb_way_3_tag_f_rep0[28:0]),
   .cache_ptag_w4	(ict_itlb_way_4_tag_f_rep0[28:0]),
   .cache_ptag_w5	(ict_itlb_way_5_tag_f_rep0[28:0]),
   .cache_ptag_w6	(ict_itlb_way_6_tag_f_rep0[28:0]),
   .cache_ptag_w7	(ict_itlb_way_7_tag_f_rep0[28:0]),
   .cache_set_vld	(agd_itlb_valid_fast_f[7:0]),
// Outputs
   .cache_way_hit	(itb_icd_waysel_c[7:0]),
   .cache_hit		(itb_chit_c),
   .tlb_cam_hit		(itb_cam_hit_c),
   .tlb_cam_mhit	(itb_itb_mhit_c),
   .tlb_pgnum_crit	(pa_unflopped_unused[39:13]),
   .tlb_pgnum		({ftu_paddr_unq[39:37],ftu_paddr[36:13]}),
   .tlb_tte_data	(itb_tte_data[37:0]),
   .tlb_tte_tag		(itb_tte_tag[65:0]),
   .tlb_tte_u_bit       (itb_tte_u_bit),
   .tlb_tte_data_parity	(itb_tte_data_parity),
  .tcu_pce_ov(tcu_pce_ov),
  .pce(pce),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en),
  .tte_ubit(tte_ubit),
  .tlb_context0_hit(tlb_context0_hit)
);

assign itb_tte_p_c = itb_tte_data[1];


ifu_ftu_itc_ctl ftu_itc_ctl (
   .asi_real_bf(asi_addr_bf[4]),
   .mbi_wdata_6(mbi_wdata[6]),
   .mbi_wdata_0(mbi_wdata[0]),
   .tlu_trap_pc_0_45_43(tlu_trap_pc_0[45:43]) ,
   .tlu_trap_pc_1_45_43(tlu_trap_pc_1[45:43]) ,
   .itb_tte_data_v_27_22(itb_tte_data[17]) ,
   .itb_tte_data_v_21_16(itb_tte_data[10]) ,
   .lsu_asi_error_inject_b31(lsu_asi_error_inject[31]),
   .lsu_asi_error_inject_b29(lsu_asi_error_inject[29]),
   .lsu_asi_error_inject_b28(lsu_asi_error_inject[28]),
   .tlu_trap_pc_0(tlu_trap_pc_0[37:35]),
   .tlu_trap_pc_1(tlu_trap_pc_1[37:35]),
   .scan_in(ftu_itc_ctl_scanin),
   .scan_out(ftu_itc_ctl_scanout),
   .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tlu_itlb_reload(tlu_itlb_reload[1:0]),
  .itd_index_valid_in(itd_index_valid_in),
  .ftp_itt_rd_req_bf(ftp_itt_rd_req_bf),
  .ftp_itd_rd_req_bf(ftp_itd_rd_req_bf),
  .tlu_itlb_bypass(tlu_itlb_bypass[7:0]),
  .lsu_immu_enable(lsu_immu_enable[7:0]),
  .ftp_itb_fetch_thr_bf(ftp_itb_fetch_thr_bf[7:0]),
  .ftp_ith_det_req_bf(ftp_ith_det_req_bf),
  .mbi_run(mbi_run),
  .lbist_run(lbist_run),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_itb_demap_en(mbi_itb_demap_en),
  .mbi_demap_type(mbi_demap_type[1:0]),
  .mbi_dis_clr_ubit(mbi_dis_clr_ubit),
  .mbi_repl_write(mbi_repl_write),
  .mbi_itb_cam_en_pre(mbi_itb_cam_en_pre),
  .mbi_itb_write_en(mbi_itb_write_en),
  .mbi_itb_read_en(mbi_itb_read_en),
  .itc_wr_u_en(itc_wr_u_en),
  .itc_rw_index_vld(itc_rw_index_vld),
  .itc_demap(itc_demap),
  .itc_demap_context(itc_demap_context),
  .itc_demap_all(itc_demap_all),
  .itc_demap_real(itc_demap_real),
  .itc_tte_ubit(itc_tte_ubit),
  .itc_sel_trap_pc_0(itc_sel_trap_pc_0),
  .itc_sel_trap_pc_1(itc_sel_trap_pc_1),
  .itc_sel_demap_tag_d(itc_sel_demap_tag_d),
  .itc_sel_demap_tag_c0(itc_sel_demap_tag_c0),
  .itc_sel_demap_tag_c1(itc_sel_demap_tag_c1),
  .itc_sel_write_tag(itc_sel_write_tag),
  .itc_sel_write_tag_indexed(itc_sel_write_tag_indexed),
  .itc_sel_default(itc_sel_default),
  .itc_itlb_rd_vld_bf(itc_itlb_rd_vld_bf),
  .itc_bypass_bf(itc_bypass_bf),
  .itc_ra_to_pa_bf(itc_ra_to_pa_bf),
  .itc_tag_error_inj(itc_tag_error_inj),
  .itc_data_error_inj(itc_data_error_inj),
  .itc_dis_clr_ubit(itc_dis_clr_ubit),
  .itc_write_next(itc_write_next),
  .itc_demap_next(itc_demap_next),
  .itc_sel_mbist(itc_sel_mbist),
  .itc_mbi_itb_read_en(itc_mbi_itb_read_en),
  .itc_thr_to_write(itc_thr_to_write[7:0]),
  .itc_itb_data_sz_1(itc_itb_data_sz_1)
);
	     
ifu_ftu_itd_dp ftu_itd_dp (
   .scan_in(ftu_itd_dp_scanin),
   .scan_out(ftu_itd_dp_scanout),
   .l2clk(l2clk),
   .default_pid(ftp_curr_pid_bf[2:0]),
   .default_r(itc_ra_to_pa_bf),
   .write_context_0(ctx_cntx_0_to_write_bf[13:0]),
   .write_context_1(ctx_cntx_1_to_write_bf[13:0]),
   .default_context_0(ctx_curr_cntx_0_bf[12:0]),
   .default_context_1(ctx_curr_cntx_1_bf[12:0]),
  .tcu_scan_en(tcu_scan_en),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .itc_sel_trap_pc_0(itc_sel_trap_pc_0),
  .itc_sel_trap_pc_1(itc_sel_trap_pc_1),
  .itc_sel_demap_tag_d(itc_sel_demap_tag_d),
  .itc_sel_demap_tag_c0(itc_sel_demap_tag_c0),
  .itc_sel_demap_tag_c1(itc_sel_demap_tag_c1),
  .itc_sel_write_tag(itc_sel_write_tag),
  .itc_sel_default(itc_sel_default),
  .itc_sel_write_tag_indexed(itc_sel_write_tag_indexed),
  .itc_tag_error_inj(itc_tag_error_inj),
  .itc_data_error_inj(itc_data_error_inj),
  .ifu_agd_pc_bf(ifu_agd_pc_bf[47:13]),
  .tlu_trap_pc_0(tlu_trap_pc_0[47:0]),
  .tlu_trap_pc_1(tlu_trap_pc_1[47:0]),
  .mmu_index(mmu_index[6:0]),
  .ftp_thr0_pid_data(ftp_thr0_pid_data[2:0]),
  .ftp_thr1_pid_data(ftp_thr1_pid_data[2:0]),
  .ftp_thr2_pid_data(ftp_thr2_pid_data[2:0]),
  .ftp_thr3_pid_data(ftp_thr3_pid_data[2:0]),
  .ftp_thr4_pid_data(ftp_thr4_pid_data[2:0]),
  .ftp_thr5_pid_data(ftp_thr5_pid_data[2:0]),
  .ftp_thr6_pid_data(ftp_thr6_pid_data[2:0]),
  .ftp_thr7_pid_data(ftp_thr7_pid_data[2:0]),
  .asi_addr_bf(asi_addr_bf[8:3]),
  .mbi_addr(mbi_addr[5:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_run(mbi_run),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_cambist_shift(mbi_cambist_shift),
  .mbi_init_to_zero(mbi_init_to_zero),
  .itc_sel_mbist(itc_sel_mbist),
  .itc_write_next(itc_write_next),
  .itd_tag(itd_tag[68:0]),
  .itd_data(itd_data[37:0]),
  .itd_index_valid_in(itd_index_valid_in),
  .itd_rw_index(itd_rw_index[5:0]),
  .itd_prty_256m(itd_prty_256m),
  .itd_prty_4m(itd_prty_4m),
  .itd_prty_64k(itd_prty_64k),
  .itd_prty_8k(itd_prty_8k),
  .itd_prty_ctxt0(itd_prty_ctxt0),
  .itd_prty_ctxt1(itd_prty_ctxt1)
);	     

////////////////////////////////////////////////////////////////////////
// Fetch pick logic
////////////////////////////////////////////////////////////////////////
ifu_ftu_ftp_ctl ftu_ftp_ctl (
   .lsu_ifu_pid_data(lsu_ifu_ctxt_data[2:0]),
   .asi_sel_cntx_0(asi_addr_bf[10]),
   .scan_in(ftu_ftp_ctl_scanin),
   .scan_out(ftu_ftp_ctl_scanout),
   .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .spc_core_running_status(spc_core_running_status[7:0]),
  .tlu_pstate_am(tlu_pstate_am[7:0]),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .tlu_itlb_bypass(tlu_itlb_bypass[7:0]),
  .tlu_trap_0_tid(tlu_trap_0_tid[1:0]),
  .tlu_trap_1_tid(tlu_trap_1_tid[1:0]),
  .tlu_trap_pc_0_valid(tlu_trap_pc_0_valid),
  .tlu_trap_pc_1_valid(tlu_trap_pc_1_valid),
  .dec_br_taken_e(dec_br_taken_e[1:0]),
  .dec_valid_e(dec_valid_e[1:0]),
  .dec_tid0_d(dec_tid0_d[1:0]),
  .dec_tid1_d(dec_tid1_d[1:0]),
  .itc_demap_next(itc_demap_next),
  .mbi_run(mbi_run),
  .mbi_itb_cam_en_pre(mbi_itb_cam_en_pre),
  .mbi_cmpsel(mbi_cmpsel[1:0]),
  .mbi_ict_read_en(mbi_ict_read_en),
  .mbi_ict_write_en(mbi_ict_write_en),
  .mbi_icd_read_en(mbi_icd_read_en),
  .mbi_icd_write_en(mbi_icd_write_en),
  .mbi_icv_read_en(mbi_icv_read_en),
  .mbi_icv_write_en(mbi_icv_write_en),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .tsm_thr0_ignore_by_pass(tsm_thr0_ignore_by_pass),
  .tsm_thr1_ignore_by_pass(tsm_thr1_ignore_by_pass),
  .tsm_thr2_ignore_by_pass(tsm_thr2_ignore_by_pass),
  .tsm_thr3_ignore_by_pass(tsm_thr3_ignore_by_pass),
  .tsm_thr4_ignore_by_pass(tsm_thr4_ignore_by_pass),
  .tsm_thr5_ignore_by_pass(tsm_thr5_ignore_by_pass),
  .tsm_thr6_ignore_by_pass(tsm_thr6_ignore_by_pass),
  .tsm_thr7_ignore_by_pass(tsm_thr7_ignore_by_pass),
  .dec_load_flush_w(dec_load_flush_w[1:0]),
  .tsm_thr0_ready_hp_bf_in(tsm_thr0_ready_hp_bf_in),
  .tsm_thr1_ready_hp_bf_in(tsm_thr1_ready_hp_bf_in),
  .tsm_thr2_ready_hp_bf_in(tsm_thr2_ready_hp_bf_in),
  .tsm_thr3_ready_hp_bf_in(tsm_thr3_ready_hp_bf_in),
  .tsm_thr4_ready_hp_bf_in(tsm_thr4_ready_hp_bf_in),
  .tsm_thr5_ready_hp_bf_in(tsm_thr5_ready_hp_bf_in),
  .tsm_thr6_ready_hp_bf_in(tsm_thr6_ready_hp_bf_in),
  .tsm_thr7_ready_hp_bf_in(tsm_thr7_ready_hp_bf_in),
  .tsm_thr0_fill_rdy0(tsm_thr0_fill_rdy0),
  .tsm_thr1_fill_rdy0(tsm_thr1_fill_rdy0),
  .tsm_thr2_fill_rdy0(tsm_thr2_fill_rdy0),
  .tsm_thr3_fill_rdy0(tsm_thr3_fill_rdy0),
  .tsm_thr4_fill_rdy0(tsm_thr4_fill_rdy0),
  .tsm_thr5_fill_rdy0(tsm_thr5_fill_rdy0),
  .tsm_thr6_fill_rdy0(tsm_thr6_fill_rdy0),
  .tsm_thr7_fill_rdy0(tsm_thr7_fill_rdy0),
  .cmu_icache_invalidate(cmu_icache_invalidate),
  .cmu_any_un_cacheable(cmu_any_un_cacheable),
  .cmu_any_data_ready(cmu_any_data_ready),
  .ibu_empty(ibu_empty[7:0]),
  .ibu_room_4ormore(ibu_room_4ormore[7:0]),
  .agc_by_pass_update_lru_bf(agc_by_pass_update_lru_bf[7:0]),
  .agc_invalidation_req_ff(agc_invalidation_req_ff[7:0]),
  .agc_kill_fetch_cv_c(agc_kill_fetch_cv_c),
  .agc_thr0_micro_flush_unq_c(agc_thr0_micro_flush_unq_c),
  .agc_thr1_micro_flush_unq_c(agc_thr1_micro_flush_unq_c),
  .agc_thr2_micro_flush_unq_c(agc_thr2_micro_flush_unq_c),
  .agc_thr3_micro_flush_unq_c(agc_thr3_micro_flush_unq_c),
  .agc_thr4_micro_flush_unq_c(agc_thr4_micro_flush_unq_c),
  .agc_thr5_micro_flush_unq_c(agc_thr5_micro_flush_unq_c),
  .agc_thr6_micro_flush_unq_c(agc_thr6_micro_flush_unq_c),
  .agc_thr7_micro_flush_unq_c(agc_thr7_micro_flush_unq_c),
  .agc_thr0_sf_valid_f(agc_thr0_sf_valid_f),
  .agc_thr1_sf_valid_f(agc_thr1_sf_valid_f),
  .agc_thr2_sf_valid_f(agc_thr2_sf_valid_f),
  .agc_thr3_sf_valid_f(agc_thr3_sf_valid_f),
  .agc_thr4_sf_valid_f(agc_thr4_sf_valid_f),
  .agc_thr5_sf_valid_f(agc_thr5_sf_valid_f),
  .agc_thr6_sf_valid_f(agc_thr6_sf_valid_f),
  .agc_thr7_sf_valid_f(agc_thr7_sf_valid_f),
  .asi_ic_wr_req(asi_ic_wr_req),
  .asi_ic_rd_req(asi_ic_rd_req),
  .asi_tg_wr_req(asi_tg_wr_req),
  .asi_tg_rd_req(asi_tg_rd_req),
  .asi_itd_rd_req(asi_itd_rd_req),
  .asi_itt_rd_req(asi_itt_rd_req),
  .asi_ith_det_req(asi_ith_det_req),
  .asi_tid(asi_tid[2:0]),
  .agd_address0_m(agd_address0_m[4:2]),
  .agd_address1_m(agd_address1_m[4:2]),
  .agd_thr0_pc_4_2_f(agd_thr0_pc_4_2_f[4:2]),
  .agd_thr1_pc_4_2_f(agd_thr1_pc_4_2_f[4:2]),
  .agd_thr2_pc_4_2_f(agd_thr2_pc_4_2_f[4:2]),
  .agd_thr3_pc_4_2_f(agd_thr3_pc_4_2_f[4:2]),
  .agd_thr4_pc_4_2_f(agd_thr4_pc_4_2_f[4:2]),
  .agd_thr5_pc_4_2_f(agd_thr5_pc_4_2_f[4:2]),
  .agd_thr6_pc_4_2_f(agd_thr6_pc_4_2_f[4:2]),
  .agd_thr7_pc_4_2_f(agd_thr7_pc_4_2_f[4:2]),
  .ifu_agd_pc_f(ifu_agd_pc_f[4:2]),
  .asi_addr_bf(asi_addr_bf[5:3]),
  .lsu_ifu_ftu_pmen(lsu_ifu_ftu_pmen),
  .lsu_ic_pmen(lsu_ic_pmen),
  .lsu_ifu_wr_pid(lsu_ifu_wr_pid),
  .lsu_ifu_tid_w(lsu_ifu_tid_w[2:0]),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .ftp_reset_fill_wait(ftp_reset_fill_wait),
  .ftp_ic_rd_req_bf(ftp_ic_rd_req_bf),
  .ftp_ic_wr_ps_en_bf(ftp_ic_wr_ps_en_bf),
  .ftp_ic_wr_req_bf(ftp_ic_wr_req_bf),
  .ftp_tg_rd_req_bf(ftp_tg_rd_req_bf),
  .ftp_tg_wr_req_bf(ftp_tg_wr_req_bf),
  .ftp_iv_rd_req_bf(ftp_iv_rd_req_bf),
  .ftp_itt_rd_req_bf(ftp_itt_rd_req_bf),
  .ftp_itd_rd_req_bf(ftp_itd_rd_req_bf),
  .ftp_itlb_cam_vld_bf(ftp_itlb_cam_vld_bf),
  .ftp_itlb_cam_vld_f(ftp_itlb_cam_vld_f),
  .ftp_ith_det_req_bf(ftp_ith_det_req_bf),
  .ftp_itlb_probe_req_l(ftp_itlb_probe_req_l),
  .ftp_sel_icv_mbist_addr(ftp_sel_icv_mbist_addr),
  .ftp_sel_mbist_itb_cycle0(ftp_sel_mbist_itb_cycle0),
  .ftp_sel_mbist_itb_cycle1(ftp_sel_mbist_itb_cycle1),
  .ftp_sel_mbist_itb_cycle2(ftp_sel_mbist_itb_cycle2),
  .ftp_sel_mbist_itb_cycle3(ftp_sel_mbist_itb_cycle3),
  .ftp_sel_itlb_tag_cntx0_c(ftp_sel_itlb_tag_cntx0_c),
  .ftp_sel_itlb_tag_cntx1_c(ftp_sel_itlb_tag_cntx1_c),
  .ftp_sel_itlb_data_c(ftp_sel_itlb_data_c),
  .ftp_sel_itlb_pa_c(ftp_sel_itlb_pa_c),
  .ftp_asi_mbist_access_bf(ftp_asi_mbist_access_bf),
  .ftp_asi_it_rd_done(ftp_asi_it_rd_done),
  .ftp_asi_ic_rd_done(ftp_asi_ic_rd_done),
  .ftp_asi_ic_wr_done(ftp_asi_ic_wr_done),
  .ftp_asi_tg_rd_done(ftp_asi_tg_rd_done),
  .ftp_asi_tg_wr_done(ftp_asi_tg_wr_done),
  .ftp_asi_tg_wr_req_hold(ftp_asi_tg_wr_req_hold),
  .ftp_thr0_room_is_less_t_3(ftp_thr0_room_is_less_t_3),
  .ftp_thr1_room_is_less_t_3(ftp_thr1_room_is_less_t_3),
  .ftp_thr2_room_is_less_t_3(ftp_thr2_room_is_less_t_3),
  .ftp_thr3_room_is_less_t_3(ftp_thr3_room_is_less_t_3),
  .ftp_thr4_room_is_less_t_3(ftp_thr4_room_is_less_t_3),
  .ftp_thr5_room_is_less_t_3(ftp_thr5_room_is_less_t_3),
  .ftp_thr6_room_is_less_t_3(ftp_thr6_room_is_less_t_3),
  .ftp_thr7_room_is_less_t_3(ftp_thr7_room_is_less_t_3),
  .ftp_thr0_go_to_sf_wait(ftp_thr0_go_to_sf_wait),
  .ftp_thr1_go_to_sf_wait(ftp_thr1_go_to_sf_wait),
  .ftp_thr2_go_to_sf_wait(ftp_thr2_go_to_sf_wait),
  .ftp_thr3_go_to_sf_wait(ftp_thr3_go_to_sf_wait),
  .ftp_thr4_go_to_sf_wait(ftp_thr4_go_to_sf_wait),
  .ftp_thr5_go_to_sf_wait(ftp_thr5_go_to_sf_wait),
  .ftp_thr6_go_to_sf_wait(ftp_thr6_go_to_sf_wait),
  .ftp_thr7_go_to_sf_wait(ftp_thr7_go_to_sf_wait),
  .ftp_thr0_trprdpc_sel_bf(ftp_thr0_trprdpc_sel_bf[2:0]),
  .ftp_thr1_trprdpc_sel_bf(ftp_thr1_trprdpc_sel_bf[2:0]),
  .ftp_thr2_trprdpc_sel_bf(ftp_thr2_trprdpc_sel_bf[2:0]),
  .ftp_thr3_trprdpc_sel_bf(ftp_thr3_trprdpc_sel_bf[2:0]),
  .ftp_thr4_trprdpc_sel_bf(ftp_thr4_trprdpc_sel_bf[2:0]),
  .ftp_thr5_trprdpc_sel_bf(ftp_thr5_trprdpc_sel_bf[2:0]),
  .ftp_thr6_trprdpc_sel_bf(ftp_thr6_trprdpc_sel_bf[2:0]),
  .ftp_thr7_trprdpc_sel_bf(ftp_thr7_trprdpc_sel_bf[2:0]),
  .ftp_thr0_sel_br_bf(ftp_thr0_sel_br_bf),
  .ftp_thr1_sel_br_bf(ftp_thr1_sel_br_bf),
  .ftp_thr2_sel_br_bf(ftp_thr2_sel_br_bf),
  .ftp_thr3_sel_br_bf(ftp_thr3_sel_br_bf),
  .ftp_thr4_sel_br_bf(ftp_thr4_sel_br_bf),
  .ftp_thr5_sel_br_bf(ftp_thr5_sel_br_bf),
  .ftp_thr6_sel_br_bf(ftp_thr6_sel_br_bf),
  .ftp_thr7_sel_br_bf(ftp_thr7_sel_br_bf),
  .ftp_icd_quad_0_en_bf(ftp_icd_quad_0_en_bf),
  .ftp_icd_quad_1_en_bf(ftp_icd_quad_1_en_bf),
  .ftp_icd_quad_2_en_bf(ftp_icd_quad_2_en_bf),
  .ftp_icd_quad_3_en_bf(ftp_icd_quad_3_en_bf),
  .ftp_tg_clk_en(ftp_tg_clk_en),
  .ftp_pc_sel_am(ftp_pc_sel_am[5:0]),
  .ftp_pc_sel_tag_part1(ftp_pc_sel_tag_part1[2:0]),
  .ftp_pc_sel_tag_part2(ftp_pc_sel_tag_part2[3:0]),
  .ftp_pc_sel_tag_pc_bot(ftp_pc_sel_tag_pc_bot[1:0]),
  .ftp_pc_sel_tag_pc_top(ftp_pc_sel_tag_pc_top[1:0]),
  .ftp_icaddr_sel_first_mux(ftp_icaddr_sel_first_mux[4:0]),
  .ftp_itb_fetch_thr_bf(ftp_itb_fetch_thr_bf[7:0]),
  .ftp_new_thr_sel_bf(ftp_new_thr_sel_bf[7:0]),
  .ftu_curr_fetch_thr_f(ftu_curr_fetch_thr_f[7:0]),
  .ftp_curr_fetch_thr_f(ftp_curr_fetch_thr_f[7:0]),
  .ftp_fetch_thr_q_f(ftp_fetch_thr_q_f[7:0]),
  .ftp_tid0_e(ftp_tid0_e[1:0]),
  .ftp_tid1_e(ftp_tid1_e[1:0]),
  .ftp_fetch_v_f(ftp_fetch_v_f),
  .ftp_fill_req_q_bf(ftp_fill_req_q_bf),
  .ftp_mbi_icd_read_en_bf(ftp_mbi_icd_read_en_bf),
  .ftp_mbi_ict_read_en_bf(ftp_mbi_ict_read_en_bf),
  .ftp_ict_data_sel_bf(ftp_ict_data_sel_bf[2:0]),
  .ftp_any_thr_clken(ftp_any_thr_clken),
  .ftp_curr_pid_bf(ftp_curr_pid_bf[2:0]),
  .ftp_thr7_pid_data(ftp_thr7_pid_data[2:0]),
  .ftp_thr6_pid_data(ftp_thr6_pid_data[2:0]),
  .ftp_thr5_pid_data(ftp_thr5_pid_data[2:0]),
  .ftp_thr4_pid_data(ftp_thr4_pid_data[2:0]),
  .ftp_thr3_pid_data(ftp_thr3_pid_data[2:0]),
  .ftp_thr2_pid_data(ftp_thr2_pid_data[2:0]),
  .ftp_thr1_pid_data(ftp_thr1_pid_data[2:0]),
  .ftp_thr0_pid_data(ftp_thr0_pid_data[2:0])
);



//////////////////////////////////////////////////////
// Thread fetch control has all the logic to control//
// which threads are eligible for fetch.            //
//////////////////////////////////////////////////////
ifu_ftu_tfc_ctl ftu_tfc_ctl (
   .scan_in(ftu_tfc_ctl_scanin),
   .scan_out(ftu_tfc_ctl_scanout),
   .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_pce_ov(tcu_pce_ov),
  .ftu_thr0_redirect_bf(ftu_thr0_redirect_bf),
  .ftu_thr1_redirect_bf(ftu_thr1_redirect_bf),
  .ftu_thr2_redirect_bf(ftu_thr2_redirect_bf),
  .ftu_thr3_redirect_bf(ftu_thr3_redirect_bf),
  .ftu_thr4_redirect_bf(ftu_thr4_redirect_bf),
  .ftu_thr5_redirect_bf(ftu_thr5_redirect_bf),
  .ftu_thr6_redirect_bf(ftu_thr6_redirect_bf),
  .ftu_thr7_redirect_bf(ftu_thr7_redirect_bf),
  .agc_thr0_err_detect_c(agc_thr0_err_detect_c),
  .agc_thr1_err_detect_c(agc_thr1_err_detect_c),
  .agc_thr2_err_detect_c(agc_thr2_err_detect_c),
  .agc_thr3_err_detect_c(agc_thr3_err_detect_c),
  .agc_thr4_err_detect_c(agc_thr4_err_detect_c),
  .agc_thr5_err_detect_c(agc_thr5_err_detect_c),
  .agc_thr6_err_detect_c(agc_thr6_err_detect_c),
  .agc_thr7_err_detect_c(agc_thr7_err_detect_c),
  .ftu_thr0_inv_req_c(ftu_thr0_inv_req_c),
  .ftu_thr1_inv_req_c(ftu_thr1_inv_req_c),
  .ftu_thr2_inv_req_c(ftu_thr2_inv_req_c),
  .ftu_thr3_inv_req_c(ftu_thr3_inv_req_c),
  .ftu_thr4_inv_req_c(ftu_thr4_inv_req_c),
  .ftu_thr5_inv_req_c(ftu_thr5_inv_req_c),
  .ftu_thr6_inv_req_c(ftu_thr6_inv_req_c),
  .ftu_thr7_inv_req_c(ftu_thr7_inv_req_c),
  .agc_thr0_lsu_no_ic_miss(agc_thr0_lsu_no_ic_miss),
  .agc_thr1_lsu_no_ic_miss(agc_thr1_lsu_no_ic_miss),
  .agc_thr2_lsu_no_ic_miss(agc_thr2_lsu_no_ic_miss),
  .agc_thr3_lsu_no_ic_miss(agc_thr3_lsu_no_ic_miss),
  .agc_thr4_lsu_no_ic_miss(agc_thr4_lsu_no_ic_miss),
  .agc_thr5_lsu_no_ic_miss(agc_thr5_lsu_no_ic_miss),
  .agc_thr6_lsu_no_ic_miss(agc_thr6_lsu_no_ic_miss),
  .agc_thr7_lsu_no_ic_miss(agc_thr7_lsu_no_ic_miss),
  .agc_thr0_tlu_redirect_bf(agc_thr0_tlu_redirect_bf),
  .agc_thr1_tlu_redirect_bf(agc_thr1_tlu_redirect_bf),
  .agc_thr2_tlu_redirect_bf(agc_thr2_tlu_redirect_bf),
  .agc_thr3_tlu_redirect_bf(agc_thr3_tlu_redirect_bf),
  .agc_thr4_tlu_redirect_bf(agc_thr4_tlu_redirect_bf),
  .agc_thr5_tlu_redirect_bf(agc_thr5_tlu_redirect_bf),
  .agc_thr6_tlu_redirect_bf(agc_thr6_tlu_redirect_bf),
  .agc_thr7_tlu_redirect_bf(agc_thr7_tlu_redirect_bf),
  .ftp_thr0_go_to_sf_wait(ftp_thr0_go_to_sf_wait),
  .ftp_thr1_go_to_sf_wait(ftp_thr1_go_to_sf_wait),
  .ftp_thr2_go_to_sf_wait(ftp_thr2_go_to_sf_wait),
  .ftp_thr3_go_to_sf_wait(ftp_thr3_go_to_sf_wait),
  .ftp_thr4_go_to_sf_wait(ftp_thr4_go_to_sf_wait),
  .ftp_thr5_go_to_sf_wait(ftp_thr5_go_to_sf_wait),
  .ftp_thr6_go_to_sf_wait(ftp_thr6_go_to_sf_wait),
  .ftp_thr7_go_to_sf_wait(ftp_thr7_go_to_sf_wait),
  .cmu_inval_ack(cmu_inval_ack[7:0]),
  .cmu_rst_dupmiss(cmu_rst_dupmiss[7:0]),
  .cmu_null_st(cmu_null_st[7:0]),
  .cmu_dupmiss_st(cmu_dupmiss_st[7:0]),
  .cmu_thr0_data_ready(cmu_thr0_data_ready),
  .cmu_thr1_data_ready(cmu_thr1_data_ready),
  .cmu_thr2_data_ready(cmu_thr2_data_ready),
  .cmu_thr3_data_ready(cmu_thr3_data_ready),
  .cmu_thr4_data_ready(cmu_thr4_data_ready),
  .cmu_thr5_data_ready(cmu_thr5_data_ready),
  .cmu_thr6_data_ready(cmu_thr6_data_ready),
  .cmu_thr7_data_ready(cmu_thr7_data_ready),
  .agc_thr0_cmiss_stm_c(agc_thr0_cmiss_stm_c),
  .agc_thr1_cmiss_stm_c(agc_thr1_cmiss_stm_c),
  .agc_thr2_cmiss_stm_c(agc_thr2_cmiss_stm_c),
  .agc_thr3_cmiss_stm_c(agc_thr3_cmiss_stm_c),
  .agc_thr4_cmiss_stm_c(agc_thr4_cmiss_stm_c),
  .agc_thr5_cmiss_stm_c(agc_thr5_cmiss_stm_c),
  .agc_thr6_cmiss_stm_c(agc_thr6_cmiss_stm_c),
  .agc_thr7_cmiss_stm_c(agc_thr7_cmiss_stm_c),
  .agc_thr0_itb_miss_c(agc_thr0_itb_miss_c),
  .agc_thr1_itb_miss_c(agc_thr1_itb_miss_c),
  .agc_thr2_itb_miss_c(agc_thr2_itb_miss_c),
  .agc_thr3_itb_miss_c(agc_thr3_itb_miss_c),
  .agc_thr4_itb_miss_c(agc_thr4_itb_miss_c),
  .agc_thr5_itb_miss_c(agc_thr5_itb_miss_c),
  .agc_thr6_itb_miss_c(agc_thr6_itb_miss_c),
  .agc_thr7_itb_miss_c(agc_thr7_itb_miss_c),
  .cmu_any_data_ready(cmu_any_data_ready),
  .ftp_reset_fill_wait(ftp_reset_fill_wait),
  .ftp_thr0_room_is_less_t_3(ftp_thr0_room_is_less_t_3),
  .ftp_thr1_room_is_less_t_3(ftp_thr1_room_is_less_t_3),
  .ftp_thr2_room_is_less_t_3(ftp_thr2_room_is_less_t_3),
  .ftp_thr3_room_is_less_t_3(ftp_thr3_room_is_less_t_3),
  .ftp_thr4_room_is_less_t_3(ftp_thr4_room_is_less_t_3),
  .ftp_thr5_room_is_less_t_3(ftp_thr5_room_is_less_t_3),
  .ftp_thr6_room_is_less_t_3(ftp_thr6_room_is_less_t_3),
  .ftp_thr7_room_is_less_t_3(ftp_thr7_room_is_less_t_3),
  .itc_demap_next(itc_demap_next),
  .tlu_flush_ifu(tlu_flush_ifu[7:0]),
  .asi_wr_request(asi_wr_request),
  .asi_rd_request(asi_rd_request),
  .ftp_asi_rd_done(ftp_asi_rd_done),
  .ftp_asi_wr_done(ftp_asi_wr_done),
  .tsm_thr0_fill_rdy0(tsm_thr0_fill_rdy0),
  .tsm_thr1_fill_rdy0(tsm_thr1_fill_rdy0),
  .tsm_thr2_fill_rdy0(tsm_thr2_fill_rdy0),
  .tsm_thr3_fill_rdy0(tsm_thr3_fill_rdy0),
  .tsm_thr4_fill_rdy0(tsm_thr4_fill_rdy0),
  .tsm_thr5_fill_rdy0(tsm_thr5_fill_rdy0),
  .tsm_thr6_fill_rdy0(tsm_thr6_fill_rdy0),
  .tsm_thr7_fill_rdy0(tsm_thr7_fill_rdy0),
  .tsm_thr0_no_new_miss(tsm_thr0_no_new_miss),
  .tsm_thr1_no_new_miss(tsm_thr1_no_new_miss),
  .tsm_thr2_no_new_miss(tsm_thr2_no_new_miss),
  .tsm_thr3_no_new_miss(tsm_thr3_no_new_miss),
  .tsm_thr4_no_new_miss(tsm_thr4_no_new_miss),
  .tsm_thr5_no_new_miss(tsm_thr5_no_new_miss),
  .tsm_thr6_no_new_miss(tsm_thr6_no_new_miss),
  .tsm_thr7_no_new_miss(tsm_thr7_no_new_miss),
  .tsm_thr0_ignore_by_pass(tsm_thr0_ignore_by_pass),
  .tsm_thr1_ignore_by_pass(tsm_thr1_ignore_by_pass),
  .tsm_thr2_ignore_by_pass(tsm_thr2_ignore_by_pass),
  .tsm_thr3_ignore_by_pass(tsm_thr3_ignore_by_pass),
  .tsm_thr4_ignore_by_pass(tsm_thr4_ignore_by_pass),
  .tsm_thr5_ignore_by_pass(tsm_thr5_ignore_by_pass),
  .tsm_thr6_ignore_by_pass(tsm_thr6_ignore_by_pass),
  .tsm_thr7_ignore_by_pass(tsm_thr7_ignore_by_pass),
  .tsm_thr0_ready_hp_bf_in(tsm_thr0_ready_hp_bf_in),
  .tsm_thr1_ready_hp_bf_in(tsm_thr1_ready_hp_bf_in),
  .tsm_thr2_ready_hp_bf_in(tsm_thr2_ready_hp_bf_in),
  .tsm_thr3_ready_hp_bf_in(tsm_thr3_ready_hp_bf_in),
  .tsm_thr4_ready_hp_bf_in(tsm_thr4_ready_hp_bf_in),
  .tsm_thr5_ready_hp_bf_in(tsm_thr5_ready_hp_bf_in),
  .tsm_thr6_ready_hp_bf_in(tsm_thr6_ready_hp_bf_in),
  .tsm_thr7_ready_hp_bf_in(tsm_thr7_ready_hp_bf_in),
  .ftu_ifu_quiesce(ftu_ifu_quiesce[7:0])
); 

////////////////////////////////////////////////////////////
// Bypass data to IB buffers.
// This file muxes the instructions from the IC and the
// Instruction being by_passed from the cache_miss unit. 
////////////////////////////////////////////////////////////
ifu_ftu_byp_dp  ftu_byp_dp (
   .scan_in(ftu_byp_dp_scanin),
   .scan_out(ftu_byp_dp_scanout),
   .l2clk(l2clk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_muxtest(tcu_muxtest),
  .tcu_dectest(tcu_dectest),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_addr(mbi_addr[5:0]),
  .agd_mbist_wdata_bf(agd_mbist_wdata_bf[7:0]),
  .ftp_mbi_icd_read_en_bf(ftp_mbi_icd_read_en_bf),
  .ftp_mbi_ict_read_en_bf(ftp_mbi_ict_read_en_bf),
  .itc_mbi_itb_read_en(itc_mbi_itb_read_en),
  .cmu_fill_inst0(cmu_fill_inst0[32:0]),
  .cmu_fill_inst1(cmu_fill_inst1[32:0]),
  .cmu_fill_inst2(cmu_fill_inst2[32:0]),
  .cmu_fill_inst3(cmu_fill_inst3[32:0]),
  .icd_bus_0_instr_c(icd_bus_0_instr_c[32:0]),
  .icd_bus_1_instr_c(icd_bus_1_instr_c[32:0]),
  .icd_bus_2_instr_c(icd_bus_2_instr_c[32:0]),
  .icd_bus_3_instr_c(icd_bus_3_instr_c[32:0]),
  .agc_instr_bp_sel_c(agc_instr_bp_sel_c[2:0]),
  .agc_asi_sel_word_c(agc_asi_sel_word_c[3:0]),
  .agc_sel_tg_data_f(agc_sel_tg_data_f[7:0]),
  .ict_itlb_way_0_tag_f(ict_itlb_way_0_tag_f[29:0]),
  .ict_itlb_way_1_tag_f(ict_itlb_way_1_tag_f[29:0]),
  .ict_itlb_way_2_tag_f(ict_itlb_way_2_tag_f[29:0]),
  .ict_itlb_way_3_tag_f(ict_itlb_way_3_tag_f[29:0]),
  .ict_itlb_way_4_tag_f(ict_itlb_way_4_tag_f[29:0]),
  .ict_itlb_way_5_tag_f(ict_itlb_way_5_tag_f[29:0]),
  .ict_itlb_way_6_tag_f(ict_itlb_way_6_tag_f[29:0]),
  .ict_itlb_way_7_tag_f(ict_itlb_way_7_tag_f[29:0]),
  .itb_tte_data(itb_tte_data[37:0]),
  .itb_tte_tag(itb_tte_tag[65:0]),
  .itb_tte_u_bit(itb_tte_u_bit),
  .ftu_paddr(ftu_paddr[39:13]),
  .itb_cam_hit_c(itb_cam_hit_c),
  .itb_itb_mhit_c(itb_itb_mhit_c),
  .itb_tte_data_parity(itb_tte_data_parity),
  .agc_itb_tag_perr_c(agc_itb_tag_perr_c),
  .itc_itb_data_sz_1(itc_itb_data_sz_1),
  .ftp_sel_mbist_itb_cycle0(ftp_sel_mbist_itb_cycle0),
  .ftp_sel_mbist_itb_cycle1(ftp_sel_mbist_itb_cycle1),
  .ftp_sel_mbist_itb_cycle2(ftp_sel_mbist_itb_cycle2),
  .ftp_sel_mbist_itb_cycle3(ftp_sel_mbist_itb_cycle3),
  .ftp_sel_itlb_tag_cntx0_c(ftp_sel_itlb_tag_cntx0_c),
  .ftp_sel_itlb_tag_cntx1_c(ftp_sel_itlb_tag_cntx1_c),
  .ftp_sel_itlb_data_c(ftp_sel_itlb_data_c),
  .ftp_sel_itlb_pa_c(ftp_sel_itlb_pa_c),
  .ftu_instr_0_c(ftu_instr_0_c[32:0]),
  .ftu_instr_1_c(ftu_instr_1_c[32:0]),
  .ftu_instr_2_c(ftu_instr_2_c[32:0]),
  .ftu_instr_3_c(ftu_instr_3_c[32:0]),
  .ic_rd_data(ic_rd_data[32:0]),
  .ic_dmo_rd_data(ic_dmo_rd_data[32:0]),
  .tg_rd_data(tg_rd_data[29:0]),
  .it_rd_data(it_rd_data[63:0]),
  .ftu_mbi_ict_fail(ftu_mbi_ict_fail),
  .ftu_mbi_icd_fail(ftu_mbi_icd_fail),
  .ftu_mbi_itb_fail(ftu_mbi_itb_fail),
  .ftu_mbi_tlb_data_cmp(ftu_mbi_tlb_data_cmp),
  .ftu_mbi_tlb_used(ftu_mbi_tlb_used),
  .ftu_mbi_tlb_valid(ftu_mbi_tlb_valid),
  .ict_itlb_way_0_tag_f_rep0(ict_itlb_way_0_tag_f_rep0[28:0]),
  .ict_itlb_way_1_tag_f_rep0(ict_itlb_way_1_tag_f_rep0[28:0]),
  .ict_itlb_way_2_tag_f_rep0(ict_itlb_way_2_tag_f_rep0[28:0]),
  .ict_itlb_way_3_tag_f_rep0(ict_itlb_way_3_tag_f_rep0[28:0]),
  .ict_itlb_way_4_tag_f_rep0(ict_itlb_way_4_tag_f_rep0[28:0]),
  .ict_itlb_way_5_tag_f_rep0(ict_itlb_way_5_tag_f_rep0[28:0]),
  .ict_itlb_way_6_tag_f_rep0(ict_itlb_way_6_tag_f_rep0[28:0]),
  .ict_itlb_way_7_tag_f_rep0(ict_itlb_way_7_tag_f_rep0[28:0])
);
        

////////////////////////////////////////////////////////////
// parity error generation block                          //
////////////////////////////////////////////////////////////
ifu_ftu_err_dp ftu_err_dp (.ict_itlb_way_0_tag_f(ict_itlb_way_0_tag_f[29:0]),
  .ict_itlb_way_1_tag_f(ict_itlb_way_1_tag_f[29:0]),
  .ict_itlb_way_2_tag_f(ict_itlb_way_2_tag_f[29:0]),
  .ict_itlb_way_3_tag_f(ict_itlb_way_3_tag_f[29:0]),
  .ict_itlb_way_4_tag_f(ict_itlb_way_4_tag_f[29:0]),
  .ict_itlb_way_5_tag_f(ict_itlb_way_5_tag_f[29:0]),
  .ict_itlb_way_6_tag_f(ict_itlb_way_6_tag_f[29:0]),
  .ict_itlb_way_7_tag_f(ict_itlb_way_7_tag_f[29:0]),
  .err_w0_8b_parity_f(err_w0_8b_parity_f[3:0]),
  .err_w1_8b_parity_f(err_w1_8b_parity_f[3:0]),
  .err_w2_8b_parity_f(err_w2_8b_parity_f[3:0]),
  .err_w3_8b_parity_f(err_w3_8b_parity_f[3:0]),
  .err_w4_8b_parity_f(err_w4_8b_parity_f[3:0]),
  .err_w5_8b_parity_f(err_w5_8b_parity_f[3:0]),
  .err_w6_8b_parity_f(err_w6_8b_parity_f[3:0]),
  .err_w7_8b_parity_f(err_w7_8b_parity_f[3:0])
 );

ifu_ftu_asi_ctl ftu_asi_ctl (
   .scan_in(ftu_asi_ctl_scanin),
   .scan_out(ftu_asi_ctl_scanout),
   .l2clk(l2clk),
   .rng_in_cdbus(in_rngl_cdbus),
  .tcu_scan_en(tcu_scan_en),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ic_rd_data(ic_rd_data[32:0]),
  .tg_rd_data(tg_rd_data[29:0]),
  .it_rd_data(it_rd_data[63:0]),
  .agc_vl_data_c(agc_vl_data_c[1:0]),
  .ftp_asi_ic_rd_done(ftp_asi_ic_rd_done),
  .ftp_asi_ic_wr_done(ftp_asi_ic_wr_done),
  .ftp_asi_tg_rd_done(ftp_asi_tg_rd_done),
  .ftp_asi_tg_wr_done(ftp_asi_tg_wr_done),
  .ftp_asi_it_rd_done(ftp_asi_it_rd_done),
  .asi_wr_data(asi_wr_data[32:0]),
  .asi_ic_rd_req(asi_ic_rd_req),
  .asi_ic_wr_req(asi_ic_wr_req),
  .asi_tg_rd_req(asi_tg_rd_req),
  .asi_tg_wr_req(asi_tg_wr_req),
  .asi_itd_rd_req(asi_itd_rd_req),
  .asi_itt_rd_req(asi_itt_rd_req),
  .asi_ith_det_req(asi_ith_det_req),
  .asi_wr_request(asi_wr_request),
  .asi_rd_request(asi_rd_request),
  .asi_addr_bf(asi_addr_bf[39:3]),
  .asi_way_bf(asi_way_bf[2:0]),
  .asi_tid(asi_tid[2:0]),
  .ifu_rngl_cdbus(ifu_rngl_cdbus[64:0]));
  

// fixscan start:
assign ftu_agd_dp_scanin         = scan_in                  ;
assign ftu_ctx_dp_scanin         = ftu_agd_dp_scanout       ;
assign ftu_agc_ctl_scanin        = ftu_ctx_dp_scanout       ;
assign ftu_cms_ctl_scanin        = ftu_agc_ctl_scanout      ;
assign ftu_icd_cust_scanin       = ftu_cms_ctl_scanout      ;
assign hdr_scanin                = ftu_icd_cust_scanout     ;
assign ftu_ict_cust_scanin       = hdr_scanout              ;
assign ftu_icv_cust_scanin       = ftu_ict_cust_scanout     ;
assign ftu_itb_cust_scanin       = ftu_icv_cust_scanout     ;
assign ftu_itc_ctl_scanin        = ftu_itb_cust_scanout     ;
assign ftu_itd_dp_scanin         = ftu_itc_ctl_scanout      ;
assign ftu_ftp_ctl_scanin        = ftu_itd_dp_scanout       ;
assign ftu_tfc_ctl_scanin        = ftu_ftp_ctl_scanout      ;
assign ftu_byp_dp_scanin         = ftu_tfc_ctl_scanout      ;
assign ftu_asi_ctl_scanin        = ftu_byp_dp_scanout       ;
assign scan_out                  = ftu_asi_ctl_scanout      ;

assign ftu_ctx_dp_wmr_scanin     = wmr_scan_in              ;
assign wmr_scan_out              = ftu_ctx_dp_wmr_scanout   ;
// fixscan end:
endmodule

