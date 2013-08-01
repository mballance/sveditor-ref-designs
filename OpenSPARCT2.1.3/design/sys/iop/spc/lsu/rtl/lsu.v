// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu.v
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
module lsu (
  l2clk, 
  scan_in, 
  wmr_scan_in, 
  tcu_pce_ov, 
  spc_aclk_wmr, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  tcu_array_wr_inhibit, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  lb_scan_en_wmr, 
  scan_out, 
  wmr_scan_out, 
  const_cpuid, 
  ifu_lsu_if_vld, 
  ifu_lsu_if_tid, 
  ifu_lsu_if_addr, 
  lsu_ifu_ctxt_data, 
  lsu_ifu_tid_w, 
  lsu_ifu_wr_p0ctxt, 
  lsu_ifu_wr_p1ctxt, 
  lsu_ifu_wr_pid, 
  lsu_immu_enable, 
  lsu_ic_enable, 
  lsu_ifu_ld_index, 
  lsu_ifu_direct_map, 
  lsu_ifu_no_miss, 
  lsu_cpx_data, 
  lsu_cpx_cpkt, 
  lsu_cpx_valid, 
  dec_lsu_tg_d, 
  dec_ld_inst_d, 
  dec_ld_inst_e, 
  dec_st_inst_e, 
  dec_fpldst_inst_e, 
  dec_fsr_ldst_e, 
  dec_ldst_dbl_e, 
  dec_pref_inst_e, 
  dec_flush_inst_e, 
  dec_memstbar_inst_e, 
  dec_sr_inst_e, 
  dec_pr_inst_e, 
  dec_hpr_inst_e, 
  dec_casa_inst_e, 
  dec_ldstub_inst_e, 
  dec_swap_inst_e, 
  dec_altspace_d, 
  dec_sign_ext_e, 
  dec_ldst_sz_e, 
  dec_lsu_rd_e, 
  dec_sraddr_e, 
  dec_imm_asi_vld_d, 
  dec_imm_asi_d, 
  dec_frf_r2_addr_e, 
  dec_flush_lm, 
  dec_flush_lb, 
  dec_lsu_tid0_d, 
  dec_lsu_tid1_d, 
  lsu_block_store_stall, 
  lsu_block_store_rd, 
  lsu_block_store_tid, 
  lsu_cpq_stall, 
  lsu_sync, 
  lsu_complete, 
  lsu_stb_alloc, 
  lsu_stb_dealloc, 
  lsu_block_store_kill, 
  tlu_flush_lsu_b, 
  tlu_pstate_cle, 
  tlu_asi_0, 
  tlu_asi_1, 
  tlu_asi_0_tid, 
  tlu_asi_1_tid, 
  tlu_asi_0_valid, 
  tlu_asi_1_valid, 
  tlu_lsu_hpstate_hpriv, 
  tlu_lsu_pstate_priv, 
  tlu_tl_gt_0, 
  tlu_lsu_clear_ctl_reg_, 
  tlu_tte, 
  tlu_cerer_dttp, 
  tlu_cerer_dttm, 
  tlu_cerer_dtdp, 
  tlu_cerer_dcvp, 
  tlu_cerer_dctp, 
  tlu_cerer_dctm, 
  tlu_cerer_dcdp, 
  tlu_cerer_dcl2c, 
  tlu_cerer_dcl2u, 
  tlu_cerer_dcl2nd, 
  tlu_cerer_sbdlc, 
  tlu_cerer_sbdlu, 
  tlu_cerer_sbapp, 
  tlu_cerer_sbdiou, 
  tlu_cerer_sbdpc, 
  tlu_cerer_sbdpu, 
  tlu_cerer_l2c_socc, 
  tlu_cerer_l2u_socu, 
  lsu_stb_empty, 
  lsu_trap_flush, 
  lsu_tlb_bypass_b, 
  lsu_tlb_real_b, 
  lsu_align_b, 
  lsu_lddf_align_b, 
  lsu_stdf_align_b, 
  lsu_dae_invalid_asi_b, 
  lsu_dae_nc_page_b, 
  lsu_dae_nfo_page_b, 
  lsu_dae_priv_viol_b, 
  lsu_dae_so_page, 
  lsu_priv_action_b, 
  lsu_va_watchpoint_b, 
  lsu_pa_watchpoint_b, 
  lsu_tlb_miss_b_, 
  lsu_illegal_inst_b, 
  lsu_daccess_prot_b, 
  lsu_perfmon_trap_b, 
  lsu_perfmon_trap_g, 
  lsu_priv_action_g, 
  lsu_tid_g, 
  lsu_tlu_dsfsr_ct_b, 
  lsu_sync_inst_b, 
  lsu_tlu_twocycle_m, 
  lsu_asi_error_inject, 
  lsu_dcmh_err_g, 
  lsu_dcvp_err_g, 
  lsu_dctp_err_g, 
  lsu_dcdp_err_g, 
  lsu_dcl2c_err_g, 
  lsu_dcl2u_err_g, 
  lsu_dcl2nd_err_g, 
  lsu_dcsoc_err_g, 
  lsu_dcerr_tid_g, 
  lsu_dcerr_sfar_g, 
  lsu_sbdlc_err_g, 
  lsu_sbdlu_err_g, 
  lsu_sbdpc_err_g, 
  lsu_sbdpu_err_g, 
  lsu_sbapp_err_g, 
  lsu_sbdiou_err_g, 
  lsu_stberr_tid_g, 
  lsu_stberr_index_g, 
  lsu_stberr_priv_g, 
  lsu_stb_flush_g, 
  lsu_dttp_err_b, 
  lsu_dtdp_err_b, 
  lsu_dtmh_err_b, 
  lsu_ext_interrupt, 
  lsu_ext_int_type, 
  lsu_ext_int_vec, 
  lsu_ext_int_tid, 
  mmu_dtlb_reload, 
  lsu_mmu_va_b, 
  lsu_context_b, 
  exu_lsu_rs2_e, 
  exu_lsu_address_e, 
  exu_lsu_store_data_e, 
  exu_lsu_va_error_m, 
  exu_ecc_m, 
  lsu_exu_ld_data_b, 
  lsu_exu_ld_vld_w, 
  lsu_exu_ld_b, 
  lsu_exu_rd_m, 
  lsu_exu_tid_m, 
  lsu_exu_address_e, 
  lsu_sel_lsu_addr_e, 
  fgu_lsu_fst_data_fx1, 
  fgu_fst_ecc_error_fx2, 
  fgu_fdiv_stall, 
  lsu_fgu_fld_data_b, 
  lsu_fgu_fld_vld_w, 
  lsu_fgu_fld_b, 
  lsu_fgu_fld_addr_b, 
  lsu_fgu_fld_tid_b, 
  lsu_fgu_fld_32b_b, 
  lsu_fgu_fld_odd32b_b, 
  lsu_fgu_fsr_load_b, 
  lsu_fgu_exception_w, 
  lsu_block_store_m, 
  lsu_frf_read_pending, 
  pmu_lsu_dcmiss_trap_m, 
  pmu_lsu_dtmiss_trap_m, 
  pmu_lsu_l2dmiss_trap_m, 
  lsu_pmu_mem_type_b, 
  l15_lsu_grant, 
  lsu_l15_lock, 
  lsu_l15_valid, 
  lsu_l15_addr, 
  lsu_l15_cpkt, 
  lsu_l15_data, 
  cpx_spc_data_cx, 
  tlu_rngf_cdbus, 
  tlu_rngf_cdbus_error, 
  rngl_lsu_cdbus, 
  lsu_rngf_cdbus, 
  lsu_rngl_cdbus, 
  lbist_run, 
  mbi_addr, 
  mbi_run, 
  mbi_wdata, 
  mbi_ptag_data, 
  mbi_cmpsel, 
  mbi_dca_read_en, 
  mbi_dca_write_en, 
  lsu_mbi_dca_fail, 
  mbi_dta_read_en, 
  mbi_dta_write_en, 
  lsu_mbi_dta_fail, 
  mbi_dva_read_en, 
  mbi_dva_write_en, 
  lsu_mbi_dva_fail, 
  mbi_lru_read_en, 
  mbi_lru_write_en, 
  lsu_mbi_lru_fail, 
  mbi_dtb_read_en, 
  mbi_dtb_write_en, 
  lsu_mbi_dtb_fail, 
  mbi_stb_cam_read_en, 
  mbi_stb_cam_write_en, 
  lsu_mbi_stb_cam_fail, 
  mbi_stb_ram_read_en, 
  mbi_stb_ram_write_en, 
  lsu_mbi_stb_ram_fail, 
  mbi_cpq_read_en, 
  mbi_cpq_write_en, 
  lsu_mbi_cpq_fail, 
  mbi_cambist_run, 
  mbi_cambist_shift, 
  mbi_dis_clr_ubit, 
  mbi_init_to_zero, 
  mbi_dtb_cam_en_pre, 
  mbi_repl_write, 
  mbi_dtb_demap_en, 
  mbi_demap_type, 
  lsu_mbi_tlb_data_cmp, 
  lsu_mbi_tlb_cam_hit, 
  lsu_mbi_tlb_cam_mhit, 
  lsu_mbi_tlb_ctxt0_hit, 
  lsu_mbi_tlb_valid, 
  lsu_mbi_tlb_used, 
  mbi_scm_cam_en_pre, 
  lsu_mbi_scm_hit, 
  lsu_mbi_scm_mhit, 
  lsu_mbi_scm_hit_ptr, 
  lsu_mbi_scm_praw, 
  dmo_coresel, 
  dmo_dcmuxctl, 
  dcc_dmo_parity, 
  lsu_ic_pmen, 
  lsu_ifu_cmu_pmen, 
  lsu_ifu_ftu_pmen, 
  lsu_ifu_ibu_pmen, 
  lsu_dec_pmen, 
  lsu_pku_pmen, 
  lsu_exu_pmen, 
  lsu_fgu_pmen, 
  lsu_tlu_pmen, 
  lsu_gkt_pmen, 
  lsu_spu_pmen, 
  lsu_mmu_pmen, 
  lsu_pmu_pmen, 
  lsu_misc_pmen, 
  lsu_asi_clken, 
  efu_spc_fuse_data, 
  efu_spc_fuse_dxfer_en, 
  efu_spc_fuse_dclr, 
  slow_cmp_sync_en, 
  cmp_slow_sync_en, 
  spc_efu_fuse_ddata, 
  spc_efu_fuse_dxfer_en, 
  vnw_ary);
wire tcu_aclk;
wire tcu_bclk;
wire pce;
wire rd_pce;
wire wr_pce;
wire bist_clk_mux_sel;
wire [129:0] spc_pcx_data_pa;
wire lsu_dc_pmen;
wire [15:0] lsu_asi_pwr_mgmt;
wire lsu_lsu_pmen;
wire arc_scanin;
wire arc_scanout;
wire ard_scanin;
wire ard_scanout;
wire dcd_scanin;
wire dcd_scanout;
wire [7:0] dac_bist_cmp_data;
wire dac_scanin;
wire dac_scanout;
wire [3:0] cache_way_hit_top_b;
wire dcache_bypass_e_;
wire dcc_dca_bypass_e_;
wire dcache_clk_en_e;
wire dcc_dca_clk_en_e;
wire dcache_rclk_en_m;
wire dcc_dca_rclk_en_m;
wire dcache_wclk_en_e;
wire dcc_dca_wclk_en_e;
wire [10:4] exu_lsu_address_e_rep0;
wire [10:3] dcc_dca_fill_addr_e;
wire dcc_alt_addr_sel_e;
wire dcc_dca_rvld_e;
wire dcc_dca_wvld_e;
wire [15:0] dcp_parity;
wire [127:0] dcp_fill_data_e;
wire [1:0] dcc_dca_fill_way_e;
wire [15:0] dcc_dca_byte_wr_en_e;
wire [3:0] dcc_alt_rsel_way_m;
wire dcc_alt_way_sel_m;
wire [3:0] tlb_cache_way_hit_b;
wire dca_scanin;
wire dca_scanout;
wire [63:0] dca_ld_data_b;
wire [7:0] dca_rparity_b;
wire dca_perr_w0_b;
wire dca_perr_w1_b;
wire dca_perr_w2_b;
wire dca_perr_w3_b;
wire [63:0] lmd_fill_or_byp_data_m_rep1;
wire [7:0] dca_msb_w0_b;
wire [7:0] dca_msb_w1_b;
wire [7:0] dca_msb_w2_b;
wire [7:0] dca_msb_w3_b;
wire [6:0] hdr_sram_rvalue;
wire [1:0] hdr_sram_rid;
wire hdr_sram_wr_en;
wire hdr_sram_red_clr;
wire [5:0] dca_fuse_repair_value;
wire [1:1] dca_fuse_repair_en_unused;
wire dca_fuse_repair_en;
wire dcc_mbi_run;
wire [3:0] lru_unused;
wire [3:0] lru_parity_unused;
wire [23:0] lru_rdata_m;
wire lru_scanin;
wire lru_scanout;
wire [10:6] tgc_dva_rd_addr_e;
wire dcc_lru_rvld_e;
wire [10:6] dcc_lru_wr_addr_w;
wire dcc_lru_wvld_w;
wire [3:0] dcc_lru_wen_w;
wire [5:0] dcc_lru_wdata_w;
wire [39:13] tlb_pgnum;
wire [47:0] sbd_st_predata_b_rep0;
wire tlb_tte_ie_b_rep01;
wire [3:0] tgc_cache_way_vld2_m;
wire [3:0] cache_way_hit_bot_b;
wire dcc_scanin;
wire dcc_scanout;
wire dcs_wmr_scanin;
wire dcs_wmr_scanout;
wire dcs_scanin;
wire dcs_scanout;
wire [63:0] sbd_st_data2_b_rep0;
wire [63:0] stb_ram_data_rep0;
wire lmd_scanin;
wire lmd_scanout;
wire [1:0] lmd_fill_way_m;
wire [10:4] lmd_fill_addr_m;
wire lmc_scanin;
wire lmc_scanout;
wire [60:40] dcc_ld_miss_ctl;
wire stb_cam_hit_rep0;
wire [39:3] lmd_fill_addr_e;
wire [2:0] cid_tid_unbuf;
wire sbc_pic_kill_store_p4_;
wire pic_scanin;
wire pic_scanout;
wire [4:0] cic_cpq_wptr;
wire cic_cpq_wr_en;
wire [4:0] cic_cpq_rptr;
wire cic_cpq_rd_en;
wire [151:0] cpq_din;
wire cpq_scanin;
wire cpq_scanout;
wire [151:0] cpq_dout;
wire [145:0] cid_cpq_wdata;
wire [145:0] cpq_rdata;
wire [5:0] cpq_unused;
wire cid_scanin;
wire cid_scanout;
wire cic_mbi_run;
wire red_scanin;
wire red_scanout;
wire cic_scanin;
wire cic_scanout;
wire cid_atomic_unbuf;
wire asc_scanin;
wire asc_scanout;
wire asd_scanin;
wire asd_scanout;
wire pid_scanin;
wire pid_scanout;
wire [63:0] stb_ram_data_corr;
wire [44:0] stb_cam_data_rep0;
wire sbs0_scanin;
wire sbs0_scanout;
wire tlb_tte_ie_b_rep00;
wire [7:0] sbc_cam_wvld_m;
wire [7:0] sbc_st_sel_p3;
wire [7:0] lsu_block_store_b;
wire [7:0] cic_st_ack;
wire [7:0] cic_st_dequeue;
wire [7:0] cic_rmo_dequeue;
wire [7:0] dcc_sync_inst_w;
wire [7:0] dcc_asi_rtn_vld;
wire [2:0] sbs0_stb_wptr_m;
wire [2:0] sbs0_stb_rptr;
wire [7:0] sbs0_state_vld;
wire [7:0] sbs0_state_ced;
wire [7:0] sbs_state_asi_rngf;
wire [7:0] sbs_pcx_pst_ie_p4;
wire [7:0] sbs_all_commited;
wire [7:0] sbs_stb_empty;
wire [7:0] sbs_stb_full;
wire [7:0] sbs_bst_req;
wire [7:0] sbc_bst_sel;
wire [7:0] sbc_st_addr_new;
wire [7:0] sbs_asi_indet_req;
wire [7:0] sbs_asi_indet_retire;
wire [7:0] sbs_rmo_st_p4;
wire [7:0] sbs_blk_st_p4;
wire [1:0] sbs0_st_type;
wire [7:0] sbs_asi_rq_vld;
wire [7:0] sbs_atm_rq_vld;
wire [7:0] sbs_pcx_rq_vld;
wire sbs1_scanin;
wire sbs1_scanout;
wire [2:0] sbs1_stb_wptr_m;
wire [2:0] sbs1_stb_rptr;
wire [7:0] sbs1_state_vld;
wire [7:0] sbs1_state_ced;
wire [1:0] sbs1_st_type;
wire sbs2_scanin;
wire sbs2_scanout;
wire [2:0] sbs2_stb_wptr_m;
wire [2:0] sbs2_stb_rptr;
wire [7:0] sbs2_state_vld;
wire [7:0] sbs2_state_ced;
wire [1:0] sbs2_st_type;
wire sbs3_scanin;
wire sbs3_scanout;
wire [2:0] sbs3_stb_wptr_m;
wire [2:0] sbs3_stb_rptr;
wire [7:0] sbs3_state_vld;
wire [7:0] sbs3_state_ced;
wire [1:0] sbs3_st_type;
wire sbs4_scanin;
wire sbs4_scanout;
wire [2:0] sbs4_stb_wptr_m;
wire [2:0] sbs4_stb_rptr;
wire [7:0] sbs4_state_vld;
wire [7:0] sbs4_state_ced;
wire [1:0] sbs4_st_type;
wire sbs5_scanin;
wire sbs5_scanout;
wire [2:0] sbs5_stb_wptr_m;
wire [2:0] sbs5_stb_rptr;
wire [7:0] sbs5_state_vld;
wire [7:0] sbs5_state_ced;
wire [1:0] sbs5_st_type;
wire sbs6_scanin;
wire sbs6_scanout;
wire [2:0] sbs6_stb_wptr_m;
wire [2:0] sbs6_stb_rptr;
wire [7:0] sbs6_state_vld;
wire [7:0] sbs6_state_ced;
wire [1:0] sbs6_st_type;
wire sbs7_scanin;
wire sbs7_scanout;
wire [2:0] sbs7_stb_wptr_m;
wire [2:0] sbs7_stb_rptr;
wire [7:0] sbs7_state_vld;
wire [7:0] sbs7_state_ced;
wire [1:0] sbs7_st_type;
wire sbc_scanin;
wire sbc_scanout;
wire spd_scanin;
wire spd_scanout;
wire sec_scanin;
wire sec_scanout;
wire [63:0] sec_corr_bit;
wire stb_cecc_err;
wire stb_uecc_err;
wire sed_scanin;
wire sed_scanout;
wire [7:0] bist_cmp_data_rep0;
wire sbc_mbi_run;
wire sbd_scanin;
wire sbd_scanout;
wire [63:0] exu_lsu_store_data_e_rep0;
wire [39:3] stb_st_addr_m;
wire [7:0] dcc_ldst_bmask;
wire dcc_stb_cam_vld_m;
wire [2:0] sbc_cam_tid;
wire [7:0] stb_cam_line_en_b;
wire [5:0] sbc_cam_rwptr;
wire sbc_cam_wptr_vld_m;
wire sbc_cam_rptr_vld;
wire dcc_stb_quad_ld_cam;
wire stb_cam_scanin;
wire stb_cam_scanout;
wire [44:0] stb_cam_data;
wire stb_ld_part_raw;
wire [2:0] stb_cam_hit_ptr;
wire stb_cam_hit;
wire stb_cam_mhit;
wire [5:0] sbc_ram_rptr;
wire sbc_ram_rptr_vld;
wire sbc_ram_wptr_vld_b;
wire [5:0] sbc_ram_wptr;
wire [83:0] stb_ram_din;
wire stb_ram_scanin;
wire stb_ram_scanout;
wire [83:0] stb_ram_dout;
wire [63:0] sbd_st_datab_b;
wire [13:0] sed_ecc_b;
wire [2:0] sbc_stb_ctl_data;
wire stb_cparity;
wire [63:0] stb_ram_rd_data;
wire [1:0] stb_ram_unused;
wire [13:0] stb_ram_rd_ecc;
wire [2:0] stb_ram_rd_ctl;
wire stb_ram_rd_cparity;
wire dta_clken;
wire dcc_dta_clken;
wire [29:0] dta_rdata_w0_m;
wire [29:0] dta_rdata_w1_m;
wire [29:0] dta_rdata_w2_m;
wire [29:0] dta_rdata_w3_m;
wire dta_scanin;
wire dta_scanout;
wire [10:4] dcc_dta_fill_addr_e;
wire dcc_dta_index1_sel_e;
wire [1:0] dcc_dta_fill_way_e;
wire dcc_dta_rvld_e;
wire dcc_dta_wvld_e;
wire dcc_dta_parity;
wire [15:0] dva_valid2_m;
wire [15:0] dva_valid_m;
wire dva_scanin;
wire dva_scanout;
wire dcc_dva_rvld_e;
wire [10:6] dcc_dva_wr_addr_e;
wire dcc_dva_wvld_e;
wire [15:0] dcc_dva_bit_wen_e;
wire [31:0] tgc_dva_din;
wire tgc_scanin;
wire tgc_scanout;
wire [47:0] lsu_va_m;
wire tgd_scanin;
wire tgd_scanout;
wire tte_ubit;
wire tld_ubit;
wire dcc_tlb_bypass;
wire tlc_wr_u_en;
wire dcc_tlb_rd_e;
wire [6:0] tld_rw_index;
wire tlc_rw_index_vld;
wire dcc_tlb_lookup;
wire tlc_demap;
wire tlc_demap_context;
wire tlc_demap_all;
wire tlc_demap_real;
wire [12:0] tgd_tag_c1;
wire [2:0] tld_tag_pid;
wire tld_tag_real;
wire tld_tag_valid;
wire [12:0] tgd_tag_c0;
wire [2:0] tld_tag_mask;
wire [37:0] tld_data;
wire tlc_dis_clr_ubit;
wire [28:0] dta_rdata_w0_rep;
wire [28:0] dta_rdata_w1_rep;
wire [28:0] dta_rdata_w2_rep;
wire [28:0] dta_rdata_w3_rep;
wire [3:0] tgc_cache_way_vld_m;
wire tlb_cache_hit_b;
wire tlb_scanin;
wire tlb_scanout;
wire tld_scanin;
wire tld_scanout;
wire [2:0] dcs_pid_e;
wire dcc_tlb_real;
wire tlc_scanin;
wire tlc_scanout;
wire tld_mbi_dtb_write_en;
wire tld_mbi_repl_write;
wire tld_mbi_dis_clr_ubit;
wire tld_mbi_dtb_demap_en;
wire [1:0] tld_mbi_demap_type;
wire ard_retl_ctl_1f;
wire ard_retl_vld_1f;
wire ard_retl_rd_1f;
wire [2:0] ard_retl_tid_1f;
wire ard_retl_ack_1f;
wire [1:0] ard_retl_exc_1f;
wire ard_retf_ctl_1f;
wire ard_retf_vld_1f;
wire ard_retf_rd_1f;
wire [2:0] ard_retf_tid_1f;
wire ard_retf_ack_1f;
wire [1:0] ard_retf_exc_1f;
wire arc_retl_vld_2f;
wire arc_retf_vld_2f;
wire arc_sel_fast;
wire [6:0] arc_pid_ctl_2f;
wire [63:0] ard_pid_data;
wire [7:1] dac_byte_one_extend;
wire [7:1] dac_byte_sel_data;
wire dac_swap7_byte0_l;
wire dac_swap7_byte3_l;
wire dac_swap7_byte4_l;
wire dac_swap7_byte7_l;
wire dac_swap6_byte1_l;
wire dac_swap6_byte2_l;
wire dac_swap6_byte5_l;
wire dac_swap6_byte6_l;
wire dac_swap5_byte1_l;
wire dac_swap5_byte2_l;
wire dac_swap5_byte5_l;
wire dac_swap5_byte6_l;
wire dac_swap4_byte0_l;
wire dac_swap4_byte3_l;
wire dac_swap4_byte4_l;
wire dac_swap4_byte7_l;
wire dac_swap3_byte0_r;
wire dac_swap3_byte3_r;
wire dac_swap3_byte4_r;
wire dac_swap3_byte7_r;
wire dac_swap2_byte1_r;
wire dac_swap2_byte2_r;
wire dac_swap2_byte5_r;
wire dac_swap2_byte6_r;
wire dac_swap1_byte0_r;
wire dac_swap1_byte1_r;
wire dac_swap1_byte2_r;
wire dac_swap1_byte3_r;
wire dac_swap1_byte4_r;
wire dac_swap1_byte5_r;
wire dac_swap1_byte6_r;
wire dac_swap1_byte7_r;
wire dac_swap0_byte0_r;
wire dac_swap0_byte1_r;
wire dac_swap0_byte2_r;
wire dac_swap0_byte3_r;
wire dac_swap0_byte4_r;
wire dac_swap0_byte5_r;
wire dac_swap0_byte6_r;
wire dac_swap0_byte7_r;
wire [1:0] dcd_dca_data_compare;
wire dcs_memref_m;
wire [47:0] lsu_mmu_va_m;
wire dcc_ld_inst_vld_m;
wire dcc_l2fill_vld_m;
wire dcc_lendian_pre_m;
wire dcc_bendian_byp_m;
wire [2:0] dcc_baddr_m;
wire [1:0] dcc_ld_sz_m;
wire dcc_signed_m;
wire lmc_asi_bypass_m;
wire lmc_byp_vld_m;
wire [7:0] lmd_misc_msb_m;
wire [7:0] bist_wdata_1;
wire lsu_lsu_pmen_;
wire [127:0] lmd_fill_data_e;
wire [7:0] dcc_parity_invert;
wire tlc_use_primary_context_c0;
wire tlc_use_secondary_context_c0;
wire [2:0] tld_tid;
wire tlc_wr_or_demap;
wire tld_va_m_eq_zero;
wire [1:0] lmd_sz_m;
wire lmd_fpld_m;
wire lmd_sxt_fsr_m;
wire [4:0] lmd_rd_m;
wire lmd_fpodd32b_m;
wire lmd_fp32b_m;
wire lmd_bendian_m;
wire [2:0] lmd_ld_addr_m;
wire [1:0] lmd_fill_way_e;
wire lmd_wrtag_parity_e;
wire [2:0] lmc_cpq_tid_m;
wire [7:0] lmc_thrd_byp_sel_e;
wire [2:0] lmc_byp_tid_m;
wire [7:0] lmc_pref_issued;
wire lmc_bld_annul;
wire lmc_bld_last_e;
wire lmc_bld_miss_e;
wire lmc_full_raw_w;
wire lmc_ld_stall;
wire lmc_l2_err_noup;
wire lmc_l2_uerr;
wire tlb_tte_cp_b;
wire tlb_tte_wbit_b;
wire tlb_tte_ebit_b;
wire tlb_tte_pbit_b;
wire tlb_tte_nfo_b;
wire tlb_cam_hit;
wire tlb_cam_mhit;
wire [2:0] tlb_pgsize;
wire tlb_context0_hit;
wire tlb_tag_parity;
wire tlb_tte_data_parity;
wire [7:0] dcs_asi_d;
wire [7:0] dcs_wpt_mask_m;
wire [1:0] dcs_wpt_enable_m;
wire [1:0] dcs_wpt_mode_m;
wire [7:0] dcs_dc_enable;
wire dcs_dmmu_enable_d;
wire [20:0] lsu_va_b;
wire cic_l2fill_vld_e;
wire cic_cpq_ld_sel;
wire cic_invalidate_e;
wire cic_xinval_e;
wire cic_st_update_e;
wire cic_rtn_cmplt;
wire cic_oddrd_e;
wire [15:0] cic_inv_wen_e;
wire cic_cpq_stall;
wire [2:0] cid_tid;
wire [1:0] cid_xway;
wire [10:3] cid_st_addr;
wire [1:0] cid_st_way;
wire [7:0] cid_st_bmask;
wire [10:6] cid_inv_index;
wire cid_ncache;
wire cid_atomic;
wire cid_l2miss;
wire sbc_bst_in_prog_m;
wire [2:0] sbc_tid_m;
wire [7:0] lsu_block_store_alloc;
wire tgd_w0_parity_b;
wire tgd_w1_parity_b;
wire tgd_w2_parity_b;
wire tgd_w3_parity_b;
wire tgd_va_wp_47_16;
wire tgd_va_wp_15_3;
wire tgd_pa_wp_39_16;
wire tgd_pa_wp_15_3;
wire tgd_prty_256m_b;
wire tgd_prty_4m_b;
wire tgd_prty_64k_b;
wire tgd_prty_8k_b;
wire tgd_prty_ctxt0_b;
wire tgd_prty_ctxt1_b;
wire [3:0] tgc_verr_b;
wire [7:0] bist_cmp_data;
wire [1:0] bist_cmpsel_1;
wire [8:5] bist_addr_1;
wire bist_srm_rd_1;
wire bist_scm_rd_1;
wire dcc_exception_flush_b;
wire dcc_asi_load_m;
wire dcc_asi_load_b;
wire dcc_asi_store_b;
wire dcc_asi_iomap_m;
wire dcc_asi_iomap_b;
wire dcc_asi_rngf_b;
wire dcc_asi_indet_b;
wire dcc_binit_st_b;
wire dcc_dva_din_e;
wire dcc_dva_din2_e;
wire dcc_cache_diag_wr_m;
wire dcc_cache_diag_wr_b;
wire dcc_bmask_parity_b;
wire dcc_ld_miss_b;
wire dcc_early_ld_b;
wire [1:0] dcc_ctxt_tid0_d;
wire [1:0] dcc_ctxt_tid1_d;
wire dcc_ctxt_tg_d;
wire [2:0] dcc_tid_e;
wire [2:0] dcc_tid_m;
wire [2:0] dcc_tid_b;
wire [7:0] dcc_asi_m;
wire dcc_ld_inst_unqual_e;
wire dcc_pref_inst_m;
wire dcc_std_inst_m;
wire dcc_ldstub_inst_m;
wire dcc_atomic_b;
wire dcc_casa_inst_b;
wire dcc_pst_asi_b;
wire dcc_tte_vld_m;
wire [1:0] dcc_ldst_sz_m;
wire dcc_fp32b_sel_m;
wire dcc_blk_inst_m;
wire dcc_blk_inst_b;
wire dcc_ldbl_b;
wire dcc_ncache_b;
wire [1:0] dcc_st_rq_type_w;
wire dcc_sync_pipe_w;
wire dcc_priv_b;
wire dcc_hpriv_b;
wire dcc_pctxt_sel_e;
wire dcc_sctxt_sel_e;
wire dcc_ld_miss_ldd;
wire [7:0] dcc_asi_reload_sel;
wire [7:0] dcc_wr_wtchpt;
wire [7:0] dcc_wr_lsu_ctl_reg;
wire dcc_wr_pwr_mgmt;
wire dcc_ceter_wr_w;
wire dcc_p0ctxt_rd_m;
wire dcc_p1ctxt_rd_m;
wire dcc_s0ctxt_rd_m;
wire dcc_s1ctxt_rd_m;
wire dcc_pid_rd_m;
wire dcc_wtchpt_sel_m;
wire dcc_demap_asi_m;
wire dcc_wtchpt_rd_b;
wire dcc_rd_lsu_ctl_reg_b;
wire dcc_rd_diag_reg_b;
wire dcc_rd_diag_dca_b;
wire dcc_rd_core_id_b;
wire dcc_rd_intr_id_b;
wire dcc_rd_dt_diag_m;
wire dcc_rd_dt_diag_b;
wire dcc_stb_diag_rd_m;
wire dcc_rd_error_inj_b;
wire dcc_rd_pwr_mgmt_b;
wire dcc_wr_error_inj_m;
wire dcc_wr_error_inj_w;
wire dcc_tlb_data_read_b;
wire dcc_tlb_tag0_read_b;
wire dcc_tlb_tag1_read_b;
wire dcc_tlb_rw_index_e;
wire dcc_rd_rhs_asi_b;
wire dcc_lsu_asi_rd_b;
wire dcc_lsu_asi_sel_w;
wire dcc_stb_diag_sel_w3;
wire dcc_stb_data_rd_w3;
wire dcc_stb_ecc_rd_w3;
wire dcc_stb_ctl_rd_w3;
wire dcc_stb_addr_sel_w3;
wire dcc_stb_ptr_rd_w3;
wire dcc_direct_map;
wire dcc_dcs_memref_e;
wire dcc_perror_b;
wire [1:0] dcc_perr_enc_b;
wire [12:3] lsu_va_w;
wire dcc_sbd_e_clken;
wire dcc_sbd_m_clken;
wire dcc_ldst_m_clken;
wire dcc_asi_rtn_excp;
wire dcc_asi_rtn_rd;
wire [7:0] asc_wr_p0ctxt;
wire [7:0] asc_wr_p1ctxt;
wire [7:0] asc_wr_s0ctxt;
wire [7:0] asc_wr_s1ctxt;
wire [7:0] asc_wr_pid;
wire [7:0] asc_wrasi;
wire [63:0] tgd_ldxa_asi_data_b;
wire [12:0] dcs_context0_e;
wire [12:0] dcs_context1_e;
wire [63:0] dcs_ldxa_asi_data_w;
wire [47:3] dcs_watchpoint_m;
wire [7:0] lmc_lmq_enable_b;
wire [7:0] lmc_lmq_bypass_en;
wire [7:0] lmc_pcx_sel_p4;
wire [7:0] lmc_byp_sel_e;
wire [7:0] lmc_thrd_byp_sel_m;
wire [4:0] lmc_lmq0_byp_sel;
wire [4:0] lmc_lmq1_byp_sel;
wire [4:0] lmc_lmq2_byp_sel;
wire [4:0] lmc_lmq3_byp_sel;
wire [4:0] lmc_lmq4_byp_sel;
wire [4:0] lmc_lmq5_byp_sel;
wire [4:0] lmc_lmq6_byp_sel;
wire [4:0] lmc_lmq7_byp_sel;
wire [1:0] lmc_bld_addr54;
wire lmc_bld_req;
wire lmc_bld_req_;
wire lmc_lmd_ncache_b;
wire [7:0] lmc_rd_update;
wire [7:0] lmc_ld_unfilled;
wire lmc_bist_or_diag_e;
wire lmc_byp_data_hi;
wire lmc_byp_data_enable;
wire [39:13] stb_st_addr_b;
wire [39:3] sbd_st_addr_b;
wire [63:0] stb_ldxa_asi_data_w;
wire [127:0] cid_fill_data_e;
wire cid_st_data_sel;
wire cic_diag_data_sel_e;
wire lmc_mbi_run;
wire lmd_addrb2;
wire [7:0] lmd_asi_ld;
wire [7:0] lmd_asi_indet;
wire [7:0] lmd_sec_cmp_b;
wire lmd_fill_sz_b0_e;
wire [2:1] lmd_rd_e;
wire [63:0] lmd_bypass_data_m;
wire [63:0] lmd_fill_or_byp_data_m;
wire [2:0] lmd_pcx_rqtyp;
wire lmd_pcx_nc;
wire lmd_pcx_pref;
wire [1:0] lmd_pcx_rway;
wire [39:0] lmd_pcx_addr;
wire lmd_asi_rngf;
wire [1:0] lmd_asi_type;
wire [7:0] lmd_asi_asi;
wire lmd_sz_b1;
wire lmd_sz_b0;
wire lmd_ldbl;
wire [1:0] lmd_dc_err_e;
wire pic_casa_squash_req;
wire pic_early_ld_b_sel_p3;
wire pic_no_load_p3;
wire pic_asi_busy;
wire cic_cpq_ld_rdy;
wire cic_cpq_ld_rdy_;
wire cic_div_stall_d;
wire [7:0] cic_xinval;
wire cic_set_inval;
wire cic_ext_interrupt;
wire [1:0] cid_err;
wire cid_dcsoc_err_e;
wire [7:0] sbc_st_atom_p3;
wire [7:0] sbc_rawp_rst;
wire [2:0] sbc_st_sel_tid_p4;
wire sbc_force_inv;
wire lmc_pcx_rq_vld;
wire lmc_asi_rq_vld;
wire lmc_ld_rq_p3;
wire lmc_ld_vld_p4;
wire lmc_ld_no_req_p4;
wire lmc_ld_inv_p4;
wire [2:0] lmc_ld_tid;
wire [7:0] lmc_ldd_vld;
wire [4:0] lmc_ld_sz;
wire lmc_ld_inst_w;
wire lmc_asi_indet_retire;
wire sbc_asi_rq_p3;
wire sbc_pcx_rq_p3;
wire sbc_st_atomic_p2;
wire sbc_st_rq_p2;
wire sbc_indet_block_p3;
wire asc_pid_ack;
wire lsu_ring_ctl;
wire pic_ld_pcx_sel_p4;
wire pic_st_pcx_sel_p3;
wire pic_st_pcx_sel_p4;
wire pic_st_asi_sel_p3;
wire pic_st_asi_p4;
wire pic_ld_asi_p4;
wire pic_st_sel_p3;
wire pic_asi_sel_p4;
wire pic_asi_req;
wire cic_byp_sel;
wire cic_d1_sel;
wire cic_cpq_sel;
wire cic_fifo_sel;
wire cic_fifo_clken;
wire [4:0] cid_pkt_type;
wire [2:0] cid_cpuid;
wire cid_xinval;
wire cid_pref;
wire [15:0] cid_st_vector;
wire [17:0] cid_inv_vec;
wire cid_rmo_ack;
wire cid_set_inval;
wire cid_set_icinval;
wire [4:0] cid_d1_rtntyp;
wire [2:0] cid_d1_tid;
wire [2:0] cid_d1_cpuid;
wire cid_d1_wv;
wire cid_d1_rmo;
wire cid_d1_pref;
wire [1:0] cid_d1_inval;
wire cid_cpq_cmp_1;
wire cid_cpq_cmp_2;
wire cid_cpq_cmp_3;
wire bist_cmpsel_2;
wire asd_p2a_vld;
wire asd_p2a_fast;
wire [63:56] asd_ring_ctl;
wire [7:0] asd_ring_asi;
wire [8:3] asd_ring_addr;
wire sbc_pid_kill_store_p4_;
wire asc_ring_ctl;
wire asc_ring_data;
wire asc_ring_local;
wire asc_ring_fast;
wire [127:0] pid_asi_pkt;
wire sbc_st_pcx_nc;
wire sbc_st_asi_fs;
wire [7:0] sbc_pcx_bmask;
wire [2:0] sbc_pcx_addr;
wire sbc_pcx_rmo_st;
wire sbc_pcx_blk_st;
wire [2:0] sbc_st_type_p4;
wire sbc_rmo_st_b;
wire sbc_bst_in_prog_b;
wire sbc_fgu_ecc_b;
wire sbc_bst_rd_err;
wire sbc_sbs_kill_store_p4_;
wire sbc_tte_vld_b;
wire sbc_blk_inst_b;
wire spd_st_line_match;
wire [2:0] stb_ram_ctl;
wire stb_cam_perr;
wire sed_bist_cmp_0;
wire sed_bist_cmp_1;
wire sed_bist_cmp_2;
wire sed_bist_cmp_3;
wire [7:0] sbc_thread_b;
wire sbc_st_int_sel_m;
wire sbc_std_le_m;
wire sbc_st_le_if_ie_m;
wire sbc_st_le_not_ie_m;
wire [1:0] sbc_st_sz_m;
wire sbc_inv_addr_prty;
wire [6:0] sbc_inv_ecc;
wire sbc_twocycle_inst_w;
wire [7:0] sbc_cam_line_en_m;
wire [2:0] sbc_diag_wptr_w3;
wire sbc_spd_clken;
wire sbc_ramout_clken;
wire sbc_tidb_eq_tidw;
wire sbc_load_bst_addr;
wire [2:0] sbc_bst_offset;
wire stb_ram_cparity;
wire stb_cparity_calc;
wire [1:0] sed_c1_lo;
wire [1:0] sed_c1_hi;
wire [1:0] sed_c2_lo;
wire [1:0] sed_c2_hi;
wire [1:0] sed_c4_lo;
wire [1:0] sed_c4_hi;
wire [1:0] sed_c8_lo;
wire [1:0] sed_c8_hi;
wire [1:0] sed_c16_lo;
wire [1:0] sed_c16_hi;
wire [2:0] sed_cf_lo;
wire [2:0] sed_cf_hi;
wire sed_c32_hi;
wire sed_c32_lo;
wire sec_st_sz_dw_std_le_b;
wire sec_st_sz_dw_le_not_ie_b;
wire sec_st_sz_dw_be_not_ie_b;
wire sec_st_sz_word_le_not_ie_b;
wire sec_st_sz_word_be_not_ie_b;
wire sec_st_sz_hw_le_not_ie_b;
wire sec_st_sz_hw_be_not_ie_b;
wire sec_st_sz_dw_le_if_ie_b;
wire sec_st_sz_dw_be_if_ie_b;
wire sec_st_sz_word_le_if_ie_b;
wire sec_st_sz_word_be_if_ie_b;
wire sec_st_sz_hw_le_if_ie_b;
wire sec_st_sz_hw_be_if_ie_b;
wire sec_st_sz_byte_b;
wire [63:0] sbd_st_data_b;
wire [63:0] stb_ram_data;
wire [39:13] tlb_pgnum_crit;
wire tlb_tte_ie_b;
wire [63:0] sbd_st_data2_b;
wire [47:0] sbd_st_predata_b;
wire tgd_bist_compare;
wire [1:0] tgc_way_sel_m;
wire bist_dta_cmp_en;
wire [37:0] tlb_tte_data;
wire [65:0] tlb_tte_tag;
wire tlb_tte_u_bit;
wire tld_prty_256m;
wire tld_prty_4m;
wire tld_prty_64k;
wire tld_prty_8k;
wire tld_prty_ctxt0;
wire tld_prty_ctxt1;
wire [12:0] tld_tag_c0;
wire [12:0] tld_tag_c1;
wire tlc_sel_tte_tag;
wire tlc_sel_demap_tag_c0;
wire tlc_sel_demap_tag_c1;
wire tlc_sel_write_tag;
wire tlc_sel_dm_tag;
wire tlc_sel_wr_dm_bist;
wire tlc_write_next;
wire tlc_tte0_clken;
wire tlc_tte1_clken;
wire tlc_tag_error_inj;
wire tlc_data_error_inj;
wire tlc_mbi_run;
wire [2:0] tld_demap_control0;
wire [3:0] tld_demap_control1;
wire tld_use_secondary_context0;
wire tld_index_valid;


input		l2clk;
input 		scan_in;
input 		wmr_scan_in;
input 		tcu_pce_ov;		// scan signals
input 		spc_aclk_wmr;
input 		spc_aclk;
input 		spc_bclk;
input		tcu_scan_en;
input		tcu_array_wr_inhibit;
input		tcu_se_scancollar_in;
input		tcu_se_scancollar_out;
input		lb_scan_en_wmr;
output		scan_out;
output		wmr_scan_out;

input	[2:0]	const_cpuid;		// hardwired CPU ID

////////////////////
// IFU interface

input		ifu_lsu_if_vld;		// indicates ifetch to L2 (used for xinval)
input	[2:0]	ifu_lsu_if_tid;		// indicates ifetch tid (used for xinval)
input	[10:5]	ifu_lsu_if_addr;	// index of ifetch request

output	[12:0]	lsu_ifu_ctxt_data;	// Value to write into context register
output	[2:0]	lsu_ifu_tid_w;		// TID for context write
output		lsu_ifu_wr_p0ctxt;	// Update primary context0
output		lsu_ifu_wr_p1ctxt;	// Update primary context1
output		lsu_ifu_wr_pid;		// Update partition ID
output	[7:0]	lsu_immu_enable;	// ASI_LSU_CTL_REG.IM
output	[7:0]	lsu_ic_enable;		// ASI_LSU_CTL_REG.IC
output	[10:5]	lsu_ifu_ld_index;	// Index of load being returned (for xinval)
output		lsu_ifu_direct_map;	// ASI_LSU_DIAG_REG.IASSOCDIS
output	[7:0]	lsu_ifu_no_miss;	// IFU must wait to handle a miss until xinval is done

// Flopped versions to IFU
output  [127:0] lsu_cpx_data;
output  [17:0]  lsu_cpx_cpkt;
output          lsu_cpx_valid;

////////////////////
// DEC interface

// 0in assert_leader -leader dec_ld_inst_d -follower dec_ld_inst_e -min 1 -max 1

input		dec_lsu_tg_d;		// Thread group of instruction in D
input		dec_ld_inst_d;		// Load instruction in D
input		dec_ld_inst_e;		// Load instruction in E
input		dec_st_inst_e;		// Store instruction in E
input		dec_fpldst_inst_e;	// Float ldst instruction in E
input		dec_fsr_ldst_e;		// LDFSR/STFSR instruction in E
input		dec_ldst_dbl_e;		// LDD/STD instruction in E
input		dec_pref_inst_e;	// Prefetch instruction in E
input		dec_flush_inst_e;	// Flush instruction in E
input		dec_memstbar_inst_e;	// Membar/stbar instruction in E
input		dec_sr_inst_e;		// Rd/wr State register instruction in E
input		dec_pr_inst_e;		// Rd/wr priv. register instruction in E
input		dec_hpr_inst_e;		// Rd/wr hyper priv. register instruction in E
input		dec_casa_inst_e;	// CASA instruction in E
input		dec_ldstub_inst_e;	// LDSTUB instruction in E
input		dec_swap_inst_e;	// SWAP instruction in E
input		dec_altspace_d;		// Memory access to alternate space
input		dec_sign_ext_e;		// Instruction requiring sign extension of data (op3[3:2]==10)
input	[1:0]	dec_ldst_sz_e;		// Size bits for the instruction in E
input	[4:0]	dec_lsu_rd_e;		// Dest. register for load data
input	[4:0]	dec_sraddr_e;		// State register address for instruction in E
input		dec_imm_asi_vld_d;	// Instruction in D uses immediate ASI 
input	[7:0]	dec_imm_asi_d;		// Value of the immediate ASI
input	[4:3]	dec_frf_r2_addr_e;	// Register offset for block store burst
input		dec_flush_lm;		// Flush the instruction in M
input		dec_flush_lb;		// Flush the instruction in B
input	[1:0]	dec_lsu_tid0_d;		// TID for TG0
input	[1:0]	dec_lsu_tid1_d;		// TID for TG1

output		lsu_block_store_stall;	// Initiate block store burst sequence
output	[4:3]	lsu_block_store_rd;	// Value of Rd for block store burst
output	[2:0]	lsu_block_store_tid;	// Thread ID of block store burst
output		lsu_cpq_stall;		// Halt decode of load instructions so cpq can drain


////////////////////
// PKU interface

output	[7:0]	lsu_sync;		// Switch out thread
output	[7:0]	lsu_complete;		// Resume thread
output	[7:0]	lsu_stb_alloc;		// Entry committed in STB
output	[7:0]	lsu_stb_dealloc;	// Entry dequeued from STB
output	[7:0]	lsu_block_store_kill;	// Reset spec and committed counters to zero

////////////////////
// TLU interface

input		tlu_flush_lsu_b;	// Flush the instruction in B
input	[7:0]	tlu_pstate_cle;		// PSTATE.CLE bit for the 8 threads
input	[7:0]	tlu_asi_0;		// Value for ASI reload
input	[7:0]	tlu_asi_1;		// Value for ASI reload
input	[1:0]	tlu_asi_0_tid;		// Thread for ASI reload
input	[1:0]	tlu_asi_1_tid;		// Thread for ASI reload
input		tlu_asi_0_valid;	// Enable ASI reload
input		tlu_asi_1_valid;	// Enable ASI reload
input	[7:0]	tlu_lsu_hpstate_hpriv;	// HPSTATE.HPRIV setting
input	[7:0]	tlu_lsu_pstate_priv;	// PSTATE.PRIV setting
input	[7:0]	tlu_tl_gt_0;		// Indicates TL>0
input	[7:0]	tlu_lsu_clear_ctl_reg_;	// Clear ASI_LSU_CONTROL_REG
input	[54:0]	tlu_tte;		// (Really just a copy of the fast ring)

input		tlu_cerer_dttp;
input		tlu_cerer_dttm;
input		tlu_cerer_dtdp;
input		tlu_cerer_dcvp;
input		tlu_cerer_dctp;
input		tlu_cerer_dctm;
input		tlu_cerer_dcdp;
input		tlu_cerer_dcl2c;
input		tlu_cerer_dcl2u;
input		tlu_cerer_dcl2nd;
input		tlu_cerer_sbdlc;
input		tlu_cerer_sbdlu;
input		tlu_cerer_sbapp;
input		tlu_cerer_sbdiou;
input		tlu_cerer_sbdpc;
input		tlu_cerer_sbdpu;
input		tlu_cerer_l2c_socc;
input		tlu_cerer_l2u_socu;


output	[7:0]	lsu_stb_empty;		// STB is empty
output	[7:0]	lsu_trap_flush;		// Initiate Trap flush 
output		lsu_tlb_bypass_b;	// Inst in B bypassed TLB
output		lsu_tlb_real_b;		// Inst in B did RA->PA translation
output		lsu_align_b;		// mem_address_not_aligned exception
output		lsu_lddf_align_b;	// LDDF_mem_address_not_aligned
output		lsu_stdf_align_b;	// STDF_mem_address_not_aligned
output		lsu_dae_invalid_asi_b;
output		lsu_dae_nc_page_b;
output		lsu_dae_nfo_page_b;
output		lsu_dae_priv_viol_b;
output		lsu_dae_so_page;
output		lsu_priv_action_b;	// privileged_action
output		lsu_va_watchpoint_b;	// VA_watchpoint
output		lsu_pa_watchpoint_b;	// PA_watchpoint
output 		lsu_tlb_miss_b_;	// TLB access missed (TLU figures trap type)
output 		lsu_illegal_inst_b;	// illegal_instruction
output		lsu_daccess_prot_b;	// data_access_protection
output		lsu_perfmon_trap_b;	// performance monitor trap
output		lsu_perfmon_trap_g;	// performance monitor trap
output		lsu_priv_action_g;	// privileged_opcode for long latency op
output	[2:0]	lsu_tid_g;		// TID for late priv_action exception
output	[1:0]	lsu_tlu_dsfsr_ct_b;

output		lsu_sync_inst_b;	// Inst in B is synchronizing
output		lsu_tlu_twocycle_m;
output	[31:0]	lsu_asi_error_inject;

// D$ parity error reporting
output		lsu_dcmh_err_g;		// D$ valid parity error
output		lsu_dcvp_err_g;		// D$ valid parity error
output		lsu_dctp_err_g;		// D$ tag parity error
output		lsu_dcdp_err_g;		// D$ data parity error

// Reporting L2 ecc errors for loads
output		lsu_dcl2c_err_g;	// L2 correctable error
output		lsu_dcl2u_err_g;	// L2 uncorrectable error
output		lsu_dcl2nd_err_g;	// L2 NotData error
output		lsu_dcsoc_err_g;	// Indicates error was from SOC (vs. L2)

// 0in bits_on -var {lsu_dcmh_err_g,lsu_dcvp_err_g,lsu_dctp_err_g,lsu_dcdp_err_g,lsu_dcl2c_err_g,lsu_dcl2u_err_g,lsu_dcl2nd_err_g} -max 1 -message "multiple DC errors reported"

// This tid is for D$ and L2 errors - only one can occur at a time.
output	[2:0]	lsu_dcerr_tid_g;	// TID of D$ error
output	[8:0]	lsu_dcerr_sfar_g;	// Contains the way and index of the error

// STB errors
output		lsu_sbdlc_err_g;	// STB RAW error (CE)
output		lsu_sbdlu_err_g;	// STB RAW error (UE)
output		lsu_sbdpc_err_g;	// STB read for issue data ECC error (CE)
output		lsu_sbdpu_err_g;	// STB read for issue data ECC error (UE)
output		lsu_sbapp_err_g;	// STB read for issue address parity error
output		lsu_sbdiou_err_g;	// STB read for issue UE error on IO or ASI
output	[2:0]	lsu_stberr_tid_g;	// TID of STB error
output	[2:0]	lsu_stberr_index_g;	// Index of STB error
output	[1:0]	lsu_stberr_priv_g;	// Encoded priv level of store (00=user, 01=priv, 10=hpriv, 11=error)
output		lsu_stb_flush_g;	// A store is being flushed from the STB

// TLB errors
output		lsu_dttp_err_b;		// DTLB tag parity error
output		lsu_dtdp_err_b;		// DTLB data parity error
output		lsu_dtmh_err_b;		// DTLB data parity error

// 0in assert_leader -leader lsu_complete[0] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd0)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[1] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd1)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[2] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd2)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[3] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd3)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[4] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd4)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[5] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd5)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[6] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd6)) -max 1 -min 1
// 0in assert_leader -leader lsu_complete[7] -follower (lsu_perfmon_trap_g & (lsu_dcerr_tid_g[2:0] == 3'd7)) -max 1 -min 1

output		lsu_ext_interrupt;
output	[1:0]	lsu_ext_int_type;
output	[5:0]	lsu_ext_int_vec;
output	[2:0]	lsu_ext_int_tid;

////////////////////
// MMU interface
input 		mmu_dtlb_reload;	// DTLB reload operation
output	[47:0]	lsu_mmu_va_b;		// virtual address in B
output	[12:0]	lsu_context_b;		// context of access in B

////////////////////
// EXU interface

input	[7:0]	exu_lsu_rs2_e;		// RS2 data for partial stores
input	[47:0]	exu_lsu_address_e;	// Calculated EA
input	[63:0]	exu_lsu_store_data_e;	// Store data from IRF
input	[1:0]	exu_lsu_va_error_m;	// VA error requiring a flush
input	[1:0]	exu_ecc_m;		// ECC error requiring a flush

output	[63:0]	lsu_exu_ld_data_b;	// IRF load return data
output		lsu_exu_ld_vld_w;	// IRF load return is valid
output		lsu_exu_ld_b;		// IRF load return is coming (but may be flushed)
output	[4:0]	lsu_exu_rd_m;		// Address of destination register
output	[2:0]	lsu_exu_tid_m;		// Thread ID of load return

output	[47:13]	lsu_exu_address_e;
output		lsu_sel_lsu_addr_e;

////////////////////
// FGU interface

input	[63:0]	fgu_lsu_fst_data_fx1;	// Store data from FRF
input		fgu_fst_ecc_error_fx2;	// FRF read encountered ECC error
input		fgu_fdiv_stall;		// Divide completing soon (see lsu_cic_ctl for timing)

output	[63:0]	lsu_fgu_fld_data_b;	// FRF load return data
output		lsu_fgu_fld_vld_w;	// FRF load return is valid
output		lsu_fgu_fld_b;		// FRF load return is coming (but may be flushed)
output	[4:0]	lsu_fgu_fld_addr_b;	// Register address for load data
output	[2:0]	lsu_fgu_fld_tid_b;	// FRF load data thread ID
output		lsu_fgu_fld_32b_b;	// FRF load return is 32 bits
output		lsu_fgu_fld_odd32b_b;	// FRF load return to odd 32b dest
output		lsu_fgu_fsr_load_b;	// FP load dest is %fsr, not FRF
output		lsu_fgu_exception_w;	// Signal exceptions to FGU (for STFSR)
output		lsu_block_store_m;	// Block store data transfer in "M" stage
output		lsu_frf_read_pending;

////////////////////
// PMU interface
input		pmu_lsu_dcmiss_trap_m;	// Enable D$ miss perfmon trap
input		pmu_lsu_dtmiss_trap_m;	// Enable DTLB miss perfmon trap
input	[7:0]	pmu_lsu_l2dmiss_trap_m;	// Enable L2 load miss permon trap
output	[2:0]	lsu_pmu_mem_type_b;	// Perfmon event {5:3 - tid ; 2:0 - {l2 d-miss, dt_miss, d-cache miss}}

///////////////////////////////////
// External gasket interface
input		l15_lsu_grant;		// One packet released to PCX

output		lsu_l15_lock;		// Request is atomic
output		lsu_l15_valid;		// LSU requests PCX access
output	[39:0]	lsu_l15_addr;		// PCX request address
output	[25:0]	lsu_l15_cpkt;		// PCX request control
output	[63:0]	lsu_l15_data;		// PCX request data

input	[145:0]	cpx_spc_data_cx;

///////////////////////////////////
// External ASI interfaces
input	[64:0]	tlu_rngf_cdbus; 	// 65 bit control/data bus from the fast ring
input		tlu_rngf_cdbus_error; 	// error signaled on same cycle as data 
input	[64:0]	rngl_lsu_cdbus; 	// 65 bit control/data bus from the local ring

//output	[62:0]	lsu_ring_cdbus; 	// 65 bit control/data bus to the local ring
//output		lsu_rngf_cdbus_b63; 	// 65 bit control/data bus to the fast ring
//output		lsu_rngl_cdbus_b63; 	// 65 bit control/data bus to the fast ring
//output		lsu_ring_ctl;
output	[64:0]	lsu_rngf_cdbus; 	// 65 bit control/data bus to the local ring
output	[64:0]	lsu_rngl_cdbus; 	// 65 bit control/data bus to the local ring

///////////////////////////////////
// BIST interface
input		lbist_run;
input	[8:0]	mbi_addr;
input		mbi_run;
input	[7:0]	mbi_wdata;
input		mbi_ptag_data;
input	[1:0]	mbi_cmpsel;

input		mbi_dca_read_en;
input		mbi_dca_write_en;
output		lsu_mbi_dca_fail;

input		mbi_dta_read_en;
input		mbi_dta_write_en;
output		lsu_mbi_dta_fail;

input		mbi_dva_read_en;
input		mbi_dva_write_en;
output		lsu_mbi_dva_fail;

input		mbi_lru_read_en;
input		mbi_lru_write_en;
output		lsu_mbi_lru_fail;

input		mbi_dtb_read_en;
input		mbi_dtb_write_en;
output		lsu_mbi_dtb_fail;

input		mbi_stb_cam_read_en;
input		mbi_stb_cam_write_en;
output		lsu_mbi_stb_cam_fail;

input		mbi_stb_ram_read_en;
input		mbi_stb_ram_write_en;
output		lsu_mbi_stb_ram_fail;

input		mbi_cpq_read_en;
input		mbi_cpq_write_en;
output		lsu_mbi_cpq_fail;

input		mbi_cambist_run;
input		mbi_cambist_shift;
input		mbi_dis_clr_ubit;
input		mbi_init_to_zero;
input		mbi_dtb_cam_en_pre;
input		mbi_repl_write;
input		mbi_dtb_demap_en;
input	[1:0]	mbi_demap_type;

output		lsu_mbi_tlb_data_cmp;
output		lsu_mbi_tlb_cam_hit;
output		lsu_mbi_tlb_cam_mhit;
output		lsu_mbi_tlb_ctxt0_hit;
output		lsu_mbi_tlb_valid;
output		lsu_mbi_tlb_used;

input		mbi_scm_cam_en_pre;

output		lsu_mbi_scm_hit;
output		lsu_mbi_scm_mhit;
output	[2:0]	lsu_mbi_scm_hit_ptr;
output		lsu_mbi_scm_praw;

input		dmo_coresel;
input		dmo_dcmuxctl;

output	[3:0]	dcc_dmo_parity;

///////////////////////////////////
// Power management signals
output		lsu_ic_pmen;
output		lsu_ifu_cmu_pmen;
output		lsu_ifu_ftu_pmen;
output		lsu_ifu_ibu_pmen;
output		lsu_dec_pmen    ;
output		lsu_pku_pmen    ;
output		lsu_exu_pmen    ;
output		lsu_fgu_pmen    ;
output		lsu_tlu_pmen    ;
output		lsu_gkt_pmen    ;
output		lsu_spu_pmen    ;
output		lsu_mmu_pmen    ;
output		lsu_pmu_pmen    ;
output		lsu_misc_pmen   ;
output		lsu_asi_clken;

/////////////////////////////////////
// EFU interface

input		efu_spc_fuse_data;
input		efu_spc_fuse_dxfer_en;
input		efu_spc_fuse_dclr;
input		slow_cmp_sync_en;
input		cmp_slow_sync_en;
output		spc_efu_fuse_ddata;
output		spc_efu_fuse_dxfer_en;

input		vnw_ary;


assign tcu_aclk = spc_aclk;
assign tcu_bclk = spc_bclk;
assign pce = 1'b1;
assign rd_pce = 1'b1;
assign wr_pce = 1'b1;
assign bist_clk_mux_sel = 1'b0;

// Reassign gasket interface to match existing ccx interfaces
//assign cpx_spc_data_cx[145:0] = {l15_spc_valid,l15_spc_cpkt[17:13],l15_spc_cpkt[11:0],l15_spc_data1[127:0]};
assign lsu_l15_cpkt[25:0] = spc_pcx_data_pa[129:104];
assign lsu_l15_addr[39:0] = spc_pcx_data_pa[103:64];
assign lsu_l15_data[63:0] = spc_pcx_data_pa[63:0];

assign lsu_dc_pmen      = lsu_asi_pwr_mgmt[15];
assign lsu_ic_pmen      = lsu_asi_pwr_mgmt[14];
assign lsu_ifu_cmu_pmen = lsu_asi_pwr_mgmt[13];
assign lsu_ifu_ftu_pmen = lsu_asi_pwr_mgmt[12];
assign lsu_ifu_ibu_pmen = lsu_asi_pwr_mgmt[11];
assign lsu_dec_pmen     = lsu_asi_pwr_mgmt[10];
assign lsu_pku_pmen     = lsu_asi_pwr_mgmt[9];
assign lsu_lsu_pmen     = lsu_asi_pwr_mgmt[8];
assign lsu_exu_pmen     = lsu_asi_pwr_mgmt[7];
assign lsu_fgu_pmen     = lsu_asi_pwr_mgmt[6];
assign lsu_tlu_pmen     = lsu_asi_pwr_mgmt[5];
assign lsu_gkt_pmen     = lsu_asi_pwr_mgmt[4];
assign lsu_spu_pmen     = lsu_asi_pwr_mgmt[3];
assign lsu_mmu_pmen     = lsu_asi_pwr_mgmt[2];
assign lsu_pmu_pmen     = lsu_asi_pwr_mgmt[1];
assign lsu_misc_pmen    = lsu_asi_pwr_mgmt[0];

lsu_arc_ctl arc (
	.scan_in(arc_scanin),
	.scan_out(arc_scanout),
	.l2clk		(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .ard_retl_ctl_1f(ard_retl_ctl_1f),
  .ard_retl_vld_1f(ard_retl_vld_1f),
  .ard_retl_rd_1f(ard_retl_rd_1f),
  .ard_retl_tid_1f(ard_retl_tid_1f[2:0]),
  .ard_retl_ack_1f(ard_retl_ack_1f),
  .ard_retl_exc_1f(ard_retl_exc_1f[1:0]),
  .ard_retf_ctl_1f(ard_retf_ctl_1f),
  .ard_retf_vld_1f(ard_retf_vld_1f),
  .ard_retf_rd_1f(ard_retf_rd_1f),
  .ard_retf_tid_1f(ard_retf_tid_1f[2:0]),
  .ard_retf_ack_1f(ard_retf_ack_1f),
  .ard_retf_exc_1f(ard_retf_exc_1f[1:0]),
  .lsu_asi_clken(lsu_asi_clken),
  .tlu_rngf_cdbus_error(tlu_rngf_cdbus_error),
  .arc_retl_vld_2f(arc_retl_vld_2f),
  .arc_retf_vld_2f(arc_retf_vld_2f),
  .arc_sel_fast(arc_sel_fast),
  .arc_pid_ctl_2f(arc_pid_ctl_2f[6:0]),
  .lsu_priv_action_g(lsu_priv_action_g),
  .lsu_tid_g(lsu_tid_g[2:0])
);

lsu_ard_dp ard (
	.scan_in(ard_scanin),
	.scan_out(ard_scanout),
	.l2clk		(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .rngl_lsu_cdbus(rngl_lsu_cdbus[64:0]),
  .tlu_rngf_cdbus(tlu_rngf_cdbus[64:0]),
  .arc_retl_vld_2f(arc_retl_vld_2f),
  .arc_retf_vld_2f(arc_retf_vld_2f),
  .arc_sel_fast(arc_sel_fast),
  .lsu_asi_clken(lsu_asi_clken),
  .ard_retl_ctl_1f(ard_retl_ctl_1f),
  .ard_retl_vld_1f(ard_retl_vld_1f),
  .ard_retl_rd_1f(ard_retl_rd_1f),
  .ard_retl_tid_1f(ard_retl_tid_1f[2:0]),
  .ard_retl_ack_1f(ard_retl_ack_1f),
  .ard_retl_exc_1f(ard_retl_exc_1f[1:0]),
  .ard_retf_ctl_1f(ard_retf_ctl_1f),
  .ard_retf_vld_1f(ard_retf_vld_1f),
  .ard_retf_rd_1f(ard_retf_rd_1f),
  .ard_retf_tid_1f(ard_retf_tid_1f[2:0]),
  .ard_retf_ack_1f(ard_retf_ack_1f),
  .ard_retf_exc_1f(ard_retf_exc_1f[1:0]),
  .ard_pid_data(ard_pid_data[63:0])
);

lsu_dcd_dp dcd (
	.scan_in(dcd_scanin),
	.scan_out(dcd_scanout),
	.l2clk		(l2clk),
	.bist_cmp_data		(dac_bist_cmp_data[7:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .dca_ld_data_b(dca_ld_data_b[63:0]),
  .dac_byte_one_extend(dac_byte_one_extend[7:1]),
  .dac_byte_sel_data(dac_byte_sel_data[7:1]),
  .dac_swap7_byte0_l(dac_swap7_byte0_l),
  .dac_swap7_byte3_l(dac_swap7_byte3_l),
  .dac_swap7_byte4_l(dac_swap7_byte4_l),
  .dac_swap7_byte7_l(dac_swap7_byte7_l),
  .dac_swap6_byte1_l(dac_swap6_byte1_l),
  .dac_swap6_byte2_l(dac_swap6_byte2_l),
  .dac_swap6_byte5_l(dac_swap6_byte5_l),
  .dac_swap6_byte6_l(dac_swap6_byte6_l),
  .dac_swap5_byte1_l(dac_swap5_byte1_l),
  .dac_swap5_byte2_l(dac_swap5_byte2_l),
  .dac_swap5_byte5_l(dac_swap5_byte5_l),
  .dac_swap5_byte6_l(dac_swap5_byte6_l),
  .dac_swap4_byte0_l(dac_swap4_byte0_l),
  .dac_swap4_byte3_l(dac_swap4_byte3_l),
  .dac_swap4_byte4_l(dac_swap4_byte4_l),
  .dac_swap4_byte7_l(dac_swap4_byte7_l),
  .dac_swap3_byte0_r(dac_swap3_byte0_r),
  .dac_swap3_byte3_r(dac_swap3_byte3_r),
  .dac_swap3_byte4_r(dac_swap3_byte4_r),
  .dac_swap3_byte7_r(dac_swap3_byte7_r),
  .dac_swap2_byte1_r(dac_swap2_byte1_r),
  .dac_swap2_byte2_r(dac_swap2_byte2_r),
  .dac_swap2_byte5_r(dac_swap2_byte5_r),
  .dac_swap2_byte6_r(dac_swap2_byte6_r),
  .dac_swap1_byte0_r(dac_swap1_byte0_r),
  .dac_swap1_byte1_r(dac_swap1_byte1_r),
  .dac_swap1_byte2_r(dac_swap1_byte2_r),
  .dac_swap1_byte3_r(dac_swap1_byte3_r),
  .dac_swap1_byte4_r(dac_swap1_byte4_r),
  .dac_swap1_byte5_r(dac_swap1_byte5_r),
  .dac_swap1_byte6_r(dac_swap1_byte6_r),
  .dac_swap1_byte7_r(dac_swap1_byte7_r),
  .dac_swap0_byte0_r(dac_swap0_byte0_r),
  .dac_swap0_byte1_r(dac_swap0_byte1_r),
  .dac_swap0_byte2_r(dac_swap0_byte2_r),
  .dac_swap0_byte3_r(dac_swap0_byte3_r),
  .dac_swap0_byte4_r(dac_swap0_byte4_r),
  .dac_swap0_byte5_r(dac_swap0_byte5_r),
  .dac_swap0_byte6_r(dac_swap0_byte6_r),
  .dac_swap0_byte7_r(dac_swap0_byte7_r),
  .lsu_exu_ld_data_b(lsu_exu_ld_data_b[63:0]),
  .lsu_fgu_fld_data_b(lsu_fgu_fld_data_b[63:0]),
  .dcd_dca_data_compare(dcd_dca_data_compare[1:0]),
  .dcs_memref_m(dcs_memref_m),
  .lsu_mmu_va_m(lsu_mmu_va_m[47:0]),
  .lsu_mmu_va_b(lsu_mmu_va_b[47:0])
);

lsu_dac_ctl dac (
	.scan_in(dac_scanin),
	.scan_out(dac_scanout),
	.l2clk			(l2clk),
	.tlb_cache_way_hit_b	(cache_way_hit_top_b[3:0]),
  .dcc_ld_inst_vld_m(dcc_ld_inst_vld_m),
  .dcc_l2fill_vld_m(dcc_l2fill_vld_m),
  .dcc_lendian_pre_m(dcc_lendian_pre_m),
  .dcc_bendian_byp_m(dcc_bendian_byp_m),
  .dcc_baddr_m(dcc_baddr_m[2:0]),
  .dcc_ld_sz_m(dcc_ld_sz_m[1:0]),
  .dcc_signed_m(dcc_signed_m),
  .lmc_asi_bypass_m(lmc_asi_bypass_m),
  .lmc_byp_vld_m(lmc_byp_vld_m),
  .lmd_misc_msb_m(lmd_misc_msb_m[7:0]),
  .dca_msb_w0_b(dca_msb_w0_b[7:0]),
  .dca_msb_w1_b(dca_msb_w1_b[7:0]),
  .dca_msb_w2_b(dca_msb_w2_b[7:0]),
  .dca_msb_w3_b(dca_msb_w3_b[7:0]),
  .dac_swap7_byte0_l(dac_swap7_byte0_l),
  .dac_swap7_byte3_l(dac_swap7_byte3_l),
  .dac_swap7_byte4_l(dac_swap7_byte4_l),
  .dac_swap7_byte7_l(dac_swap7_byte7_l),
  .dac_swap6_byte1_l(dac_swap6_byte1_l),
  .dac_swap6_byte2_l(dac_swap6_byte2_l),
  .dac_swap6_byte5_l(dac_swap6_byte5_l),
  .dac_swap6_byte6_l(dac_swap6_byte6_l),
  .dac_swap5_byte1_l(dac_swap5_byte1_l),
  .dac_swap5_byte2_l(dac_swap5_byte2_l),
  .dac_swap5_byte5_l(dac_swap5_byte5_l),
  .dac_swap5_byte6_l(dac_swap5_byte6_l),
  .dac_swap4_byte0_l(dac_swap4_byte0_l),
  .dac_swap4_byte3_l(dac_swap4_byte3_l),
  .dac_swap4_byte4_l(dac_swap4_byte4_l),
  .dac_swap4_byte7_l(dac_swap4_byte7_l),
  .dac_swap3_byte0_r(dac_swap3_byte0_r),
  .dac_swap3_byte3_r(dac_swap3_byte3_r),
  .dac_swap3_byte4_r(dac_swap3_byte4_r),
  .dac_swap3_byte7_r(dac_swap3_byte7_r),
  .dac_swap2_byte1_r(dac_swap2_byte1_r),
  .dac_swap2_byte2_r(dac_swap2_byte2_r),
  .dac_swap2_byte5_r(dac_swap2_byte5_r),
  .dac_swap2_byte6_r(dac_swap2_byte6_r),
  .dac_swap1_byte0_r(dac_swap1_byte0_r),
  .dac_swap1_byte1_r(dac_swap1_byte1_r),
  .dac_swap1_byte2_r(dac_swap1_byte2_r),
  .dac_swap1_byte3_r(dac_swap1_byte3_r),
  .dac_swap1_byte4_r(dac_swap1_byte4_r),
  .dac_swap1_byte5_r(dac_swap1_byte5_r),
  .dac_swap1_byte6_r(dac_swap1_byte6_r),
  .dac_swap1_byte7_r(dac_swap1_byte7_r),
  .dac_swap0_byte0_r(dac_swap0_byte0_r),
  .dac_swap0_byte1_r(dac_swap0_byte1_r),
  .dac_swap0_byte2_r(dac_swap0_byte2_r),
  .dac_swap0_byte3_r(dac_swap0_byte3_r),
  .dac_swap0_byte4_r(dac_swap0_byte4_r),
  .dac_swap0_byte5_r(dac_swap0_byte5_r),
  .dac_swap0_byte6_r(dac_swap0_byte6_r),
  .dac_swap0_byte7_r(dac_swap0_byte7_r),
  .dac_byte_one_extend(dac_byte_one_extend[7:1]),
  .dac_byte_sel_data(dac_byte_sel_data[7:1]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lbist_run(lbist_run),
  .mbi_run(mbi_run),
  .bist_wdata_1(bist_wdata_1[7:0]),
  .dac_bist_cmp_data(dac_bist_cmp_data[7:0]),
  .lsu_lsu_pmen_(lsu_lsu_pmen_),
  .dmo_coresel(dmo_coresel),
  .dmo_dcmuxctl(dmo_dcmuxctl)
);

assign dcache_bypass_e_ = dcc_dca_bypass_e_;
assign dcache_clk_en_e = dcc_dca_clk_en_e;
assign dcache_rclk_en_m = dcc_dca_rclk_en_m;
assign dcache_wclk_en_e = dcc_dca_wclk_en_e;

n2_dca_sp_9kb_cust dca (
	.dcache_rd_addr_e	({exu_lsu_address_e_rep0[10:4],exu_lsu_address_e[3]}),
	.dcache_alt_addr_e	(dcc_dca_fill_addr_e[10:3]),
	.dcache_alt_addr_sel_e	(dcc_alt_addr_sel_e),
	.dcache_rvld_e		(dcc_dca_rvld_e),
	.dcache_wvld_e		(dcc_dca_wvld_e),
	.dcache_wdata_e		({dcp_parity[15],dcp_fill_data_e[127:120],
                                  dcp_parity[14],dcp_fill_data_e[119:112],
                                  dcp_parity[13],dcp_fill_data_e[111:104],
                                  dcp_parity[12],dcp_fill_data_e[103:96],
                                  dcp_parity[11],dcp_fill_data_e[95:88],
                                  dcp_parity[10],dcp_fill_data_e[87:80],
                                  dcp_parity[9],dcp_fill_data_e[79:72],
                                  dcp_parity[8],dcp_fill_data_e[71:64],
                                  dcp_parity[7],dcp_fill_data_e[63:56],
                                  dcp_parity[6],dcp_fill_data_e[55:48],
                                  dcp_parity[5],dcp_fill_data_e[47:40],
                                  dcp_parity[4],dcp_fill_data_e[39:32],
                                  dcp_parity[3],dcp_fill_data_e[31:24],
                                  dcp_parity[2],dcp_fill_data_e[23:16],
                                  dcp_parity[1],dcp_fill_data_e[15:8],
                                  dcp_parity[0],dcp_fill_data_e[7:0] }),
	.dcache_wr_way_e	(dcc_dca_fill_way_e[1:0]),
	.dcache_byte_wr_en_e	(dcc_dca_byte_wr_en_e[15:0]),
	.dcache_alt_rsel_way_m	(dcc_alt_rsel_way_m[3:0]),
	.dcache_alt_way_sel_m	(dcc_alt_way_sel_m),
	.dcache_rsel_way_b	(tlb_cache_way_hit_b[3:0]),
	.scan_in(dca_scanin),
	.scan_out(dca_scanout),
	.l2clk			(l2clk),
	.dcache_rdata_b		(dca_ld_data_b[63:0]),
	.dcache_rparity_b	(dca_rparity_b[7:0]),
	.dcache_perr_w0_b	(dca_perr_w0_b),
	.dcache_perr_w1_b	(dca_perr_w1_b),
	.dcache_perr_w2_b	(dca_perr_w2_b),
	.dcache_perr_w3_b	(dca_perr_w3_b),
	.lsu_l2fill_or_byp_data_m (lmd_fill_or_byp_data_m_rep1[63:0]),
	.dcache_rdata_msb_w0_b	(dca_msb_w0_b[7:0]),
	.dcache_rdata_msb_w1_b	(dca_msb_w1_b[7:0]),
	.dcache_rdata_msb_w2_b	(dca_msb_w2_b[7:0]),
	.dcache_rdata_msb_w3_b	(dca_msb_w3_b[7:0]),
	.fuse_dca_repair_value	(hdr_sram_rvalue[6:1]),
	.fuse_dca_repair_en	({2{hdr_sram_rvalue[0]}}),
	.fuse_dca_rid		(hdr_sram_rid[1:0]),
	.fuse_dca_wen		(hdr_sram_wr_en),
	.fuse_red_reset		(hdr_sram_red_clr),
	.dca_fuse_repair_value	(dca_fuse_repair_value[5:0]),
	.dca_fuse_repair_en	({dca_fuse_repair_en_unused[1],dca_fuse_repair_en}),
  .dcache_clk_en_e(dcache_clk_en_e),
  .dcache_wclk_en_e(dcache_wclk_en_e),
  .dcache_rclk_en_m(dcache_rclk_en_m),
  .dcache_bypass_e_(dcache_bypass_e_),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .vnw_ary(vnw_ary)

);

lsu_dcp_dp dcp (
	.mbi_run		(dcc_mbi_run),
  .lmd_fill_data_e(lmd_fill_data_e[127:0]),
  .dcc_parity_invert(dcc_parity_invert[7:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .dcp_fill_data_e(dcp_fill_data_e[127:0]),
  .dcp_parity(dcp_parity[15:0])
);

n2_dva_dp_32x32_cust lru (
	.dout		({lru_unused[3],lru_parity_unused[3],lru_rdata_m[23:18],
			  lru_unused[2],lru_parity_unused[2],lru_rdata_m[17:12],
			  lru_unused[1],lru_parity_unused[1],lru_rdata_m[11:6],
			  lru_unused[0],lru_parity_unused[0],lru_rdata_m[5:0]}),
	.scan_in(lru_scanin),
	.scan_out(lru_scanout),
	.l2clk	(l2clk),
	.rd_addr	(tgc_dva_rd_addr_e[10:6]),
	.rd_en		(dcc_lru_rvld_e),
	.wr_addr	(dcc_lru_wr_addr_w[10:6]),
	.wr_en		(dcc_lru_wvld_w),
	.bit_wen	({{8{dcc_lru_wen_w[3]}},{8{dcc_lru_wen_w[2]}},{8{dcc_lru_wen_w[1]}},{8{dcc_lru_wen_w[0]}}}),
	.din		({4{2'b00,dcc_lru_wdata_w[5:0]}}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_scan_en(tcu_scan_en),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .pce(pce)
);

lsu_dcc_ctl dcc (		
	.tlb_pgnum_b39		(tlb_pgnum[39]),
	.sbd_st_data_b		(sbd_st_predata_b_rep0[1:0]),
	.mbi_cmpsel		(mbi_cmpsel[0]),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep01),
	.tgc_cache_way_vld_m	(tgc_cache_way_vld2_m[3:0]),
	.tlb_cache_way_hit_b	(cache_way_hit_bot_b[3:0]),
	.scan_in(dcc_scanin),
	.scan_out(dcc_scanout),
	.l2clk(l2clk),
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
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .dec_lsu_tid0_d(dec_lsu_tid0_d[1:0]),
  .dec_lsu_tid1_d(dec_lsu_tid1_d[1:0]),
  .tlu_pstate_cle(tlu_pstate_cle[7:0]),
  .tlu_asi_0_tid(tlu_asi_0_tid[1:0]),
  .tlu_asi_1_tid(tlu_asi_1_tid[1:0]),
  .tlu_asi_0_valid(tlu_asi_0_valid),
  .tlu_asi_1_valid(tlu_asi_1_valid),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
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
  .tlc_use_primary_context_c0(tlc_use_primary_context_c0),
  .tlc_use_secondary_context_c0(tlc_use_secondary_context_c0),
  .tld_tid(tld_tid[2:0]),
  .tlc_wr_or_demap(tlc_wr_or_demap),
  .tld_va_m_eq_zero(tld_va_m_eq_zero),
  .exu_lsu_va_error_m(exu_lsu_va_error_m[1:0]),
  .exu_ecc_m(exu_ecc_m[1:0]),
  .exu_lsu_rs2_e(exu_lsu_rs2_e[7:0]),
  .fgu_fst_ecc_error_fx2(fgu_fst_ecc_error_fx2),
  .lmd_sz_m(lmd_sz_m[1:0]),
  .lmd_fpld_m(lmd_fpld_m),
  .lmd_sxt_fsr_m(lmd_sxt_fsr_m),
  .lmd_rd_m(lmd_rd_m[4:0]),
  .lmd_fpodd32b_m(lmd_fpodd32b_m),
  .lmd_fp32b_m(lmd_fp32b_m),
  .lmd_bendian_m(lmd_bendian_m),
  .lmd_fill_addr_e(lmd_fill_addr_e[10:3]),
  .lmd_ld_addr_m(lmd_ld_addr_m[2:0]),
  .lmd_fill_way_e(lmd_fill_way_e[1:0]),
  .lmd_wrtag_parity_e(lmd_wrtag_parity_e),
  .lmc_cpq_tid_m(lmc_cpq_tid_m[2:0]),
  .lmc_thrd_byp_sel_e(lmc_thrd_byp_sel_e[7:0]),
  .lmc_byp_tid_m(lmc_byp_tid_m[2:0]),
  .lmc_byp_vld_m(lmc_byp_vld_m),
  .lmc_asi_bypass_m(lmc_asi_bypass_m),
  .lmc_pref_issued(lmc_pref_issued[7:0]),
  .lmc_bld_annul(lmc_bld_annul),
  .lmc_bld_last_e(lmc_bld_last_e),
  .lmc_bld_miss_e(lmc_bld_miss_e),
  .lmc_full_raw_w(lmc_full_raw_w),
  .lmc_ld_stall(lmc_ld_stall),
  .lmc_l2_err_noup(lmc_l2_err_noup),
  .lmc_l2_uerr(lmc_l2_uerr),
  .tlb_tte_cp_b(tlb_tte_cp_b),
  .tlb_tte_wbit_b(tlb_tte_wbit_b),
  .tlb_tte_ebit_b(tlb_tte_ebit_b),
  .tlb_tte_pbit_b(tlb_tte_pbit_b),
  .tlb_tte_nfo_b(tlb_tte_nfo_b),
  .tlb_cache_hit_b(tlb_cache_hit_b),
  .tlb_cam_hit(tlb_cam_hit),
  .tlb_cam_mhit(tlb_cam_mhit),
  .tlb_pgsize(tlb_pgsize[2:0]),
  .tlb_context0_hit(tlb_context0_hit),
  .tlb_tag_parity(tlb_tag_parity),
  .tlb_tte_data_parity(tlb_tte_data_parity),
  .dcs_asi_d(dcs_asi_d[7:0]),
  .dcs_wpt_mask_m(dcs_wpt_mask_m[7:0]),
  .dcs_wpt_enable_m(dcs_wpt_enable_m[1:0]),
  .dcs_wpt_mode_m(dcs_wpt_mode_m[1:0]),
  .dcs_dc_enable(dcs_dc_enable[7:0]),
  .dcs_dmmu_enable_d(dcs_dmmu_enable_d),
  .lsu_va_m(lsu_va_m[15:0]),
  .lsu_va_b(lsu_va_b[20:3]),
  .cic_l2fill_vld_e(cic_l2fill_vld_e),
  .cic_cpq_ld_sel(cic_cpq_ld_sel),
  .cic_invalidate_e(cic_invalidate_e),
  .cic_xinval_e(cic_xinval_e),
  .cic_st_update_e(cic_st_update_e),
  .cic_rtn_cmplt(cic_rtn_cmplt),
  .cic_oddrd_e(cic_oddrd_e),
  .cic_inv_wen_e(cic_inv_wen_e[15:0]),
  .cic_cpq_stall(cic_cpq_stall),
  .cid_tid(cid_tid[2:0]),
  .cid_xway(cid_xway[1:0]),
  .cid_st_addr(cid_st_addr[10:3]),
  .cid_st_way(cid_st_way[1:0]),
  .cid_st_bmask(cid_st_bmask[7:0]),
  .cid_inv_index(cid_inv_index[10:6]),
  .cid_ncache(cid_ncache),
  .cid_atomic(cid_atomic),
  .cid_l2miss(cid_l2miss),
  .stb_cam_hit(stb_cam_hit),
  .sbc_bst_in_prog_m(sbc_bst_in_prog_m),
  .sbc_tid_m(sbc_tid_m[2:0]),
  .lsu_block_store_alloc(lsu_block_store_alloc[7:0]),
  .lsu_block_store_kill(lsu_block_store_kill[7:0]),
  .tgd_w0_parity_b(tgd_w0_parity_b),
  .tgd_w1_parity_b(tgd_w1_parity_b),
  .tgd_w2_parity_b(tgd_w2_parity_b),
  .tgd_w3_parity_b(tgd_w3_parity_b),
  .tgd_va_wp_47_16(tgd_va_wp_47_16),
  .tgd_va_wp_15_3(tgd_va_wp_15_3),
  .tgd_pa_wp_39_16(tgd_pa_wp_39_16),
  .tgd_pa_wp_15_3(tgd_pa_wp_15_3),
  .tgd_prty_256m_b(tgd_prty_256m_b),
  .tgd_prty_4m_b(tgd_prty_4m_b),
  .tgd_prty_64k_b(tgd_prty_64k_b),
  .tgd_prty_8k_b(tgd_prty_8k_b),
  .tgd_prty_ctxt0_b(tgd_prty_ctxt0_b),
  .tgd_prty_ctxt1_b(tgd_prty_ctxt1_b),
  .tgc_verr_b(tgc_verr_b[3:0]),
  .dca_perr_w0_b(dca_perr_w0_b),
  .dca_perr_w1_b(dca_perr_w1_b),
  .dca_perr_w2_b(dca_perr_w2_b),
  .dca_perr_w3_b(dca_perr_w3_b),
  .dca_rparity_b(dca_rparity_b[7:0]),
  .lru_rdata_m(lru_rdata_m[23:0]),
  .ifu_lsu_if_vld(ifu_lsu_if_vld),
  .ifu_lsu_if_tid(ifu_lsu_if_tid[2:0]),
  .ifu_lsu_if_addr(ifu_lsu_if_addr[10:5]),
  .arc_pid_ctl_2f(arc_pid_ctl_2f[6:0]),
  .dcd_dca_data_compare(dcd_dca_data_compare[1:0]),
  .lbist_run(lbist_run),
  .mbi_addr(mbi_addr[8:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_run(mbi_run),
  .mbi_dca_read_en(mbi_dca_read_en),
  .mbi_dca_write_en(mbi_dca_write_en),
  .mbi_dta_read_en(mbi_dta_read_en),
  .mbi_dta_write_en(mbi_dta_write_en),
  .mbi_dva_read_en(mbi_dva_read_en),
  .mbi_dva_write_en(mbi_dva_write_en),
  .mbi_lru_read_en(mbi_lru_read_en),
  .mbi_lru_write_en(mbi_lru_write_en),
  .mbi_dtb_read_en(mbi_dtb_read_en),
  .mbi_dtb_cam_en_pre(mbi_dtb_cam_en_pre),
  .mbi_scm_cam_en_pre(mbi_scm_cam_en_pre),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .bist_cmp_data(bist_cmp_data[7:0]),
  .bist_cmpsel_1(bist_cmpsel_1[1:0]),
  .bist_addr_1(bist_addr_1[8:5]),
  .bist_srm_rd_1(bist_srm_rd_1),
  .bist_scm_rd_1(bist_scm_rd_1),
  .lsu_trap_flush(lsu_trap_flush[7:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .dcc_asi_load_m(dcc_asi_load_m),
  .dcc_asi_load_b(dcc_asi_load_b),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_m(dcc_asi_iomap_m),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_binit_st_b(dcc_binit_st_b),
  .dcc_dca_rvld_e(dcc_dca_rvld_e),
  .dcc_dca_wvld_e(dcc_dca_wvld_e),
  .dcc_dca_clk_en_e(dcc_dca_clk_en_e),
  .dcc_dca_wclk_en_e(dcc_dca_wclk_en_e),
  .dcc_dca_rclk_en_m(dcc_dca_rclk_en_m),
  .dcc_dca_bypass_e_(dcc_dca_bypass_e_),
  .dcc_dca_fill_way_e(dcc_dca_fill_way_e[1:0]),
  .dcc_dca_fill_addr_e(dcc_dca_fill_addr_e[10:3]),
  .dcc_dca_byte_wr_en_e(dcc_dca_byte_wr_en_e[15:0]),
  .dcc_parity_invert(dcc_parity_invert[7:0]),
  .dcc_dta_parity(dcc_dta_parity),
  .dcc_alt_addr_sel_e(dcc_alt_addr_sel_e),
  .dcc_alt_way_sel_m(dcc_alt_way_sel_m),
  .dcc_alt_rsel_way_m(dcc_alt_rsel_way_m[3:0]),
  .dcc_dta_fill_addr_e(dcc_dta_fill_addr_e[10:4]),
  .dcc_dta_fill_way_e(dcc_dta_fill_way_e[1:0]),
  .dcc_dta_wvld_e(dcc_dta_wvld_e),
  .dcc_dta_rvld_e(dcc_dta_rvld_e),
  .dcc_dta_index1_sel_e(dcc_dta_index1_sel_e),
  .dcc_dta_clken(dcc_dta_clken),
  .dcc_dva_wvld_e(dcc_dva_wvld_e),
  .dcc_dva_rvld_e(dcc_dva_rvld_e),
  .dcc_dva_din_e(dcc_dva_din_e),
  .dcc_dva_din2_e(dcc_dva_din2_e),
  .dcc_dva_wr_addr_e(dcc_dva_wr_addr_e[10:6]),
  .dcc_dva_bit_wen_e(dcc_dva_bit_wen_e[15:0]),
  .dcc_cache_diag_wr_m(dcc_cache_diag_wr_m),
  .dcc_cache_diag_wr_b(dcc_cache_diag_wr_b),
  .dcc_lru_rvld_e(dcc_lru_rvld_e),
  .dcc_lru_wvld_w(dcc_lru_wvld_w),
  .dcc_lru_wdata_w(dcc_lru_wdata_w[5:0]),
  .dcc_lru_wen_w(dcc_lru_wen_w[3:0]),
  .dcc_lru_wr_addr_w(dcc_lru_wr_addr_w[10:6]),
  .dcc_ldst_bmask(dcc_ldst_bmask[7:0]),
  .dcc_bmask_parity_b(dcc_bmask_parity_b),
  .dcc_ld_miss_b(dcc_ld_miss_b),
  .dcc_early_ld_b(dcc_early_ld_b),
  .dcc_stb_quad_ld_cam(dcc_stb_quad_ld_cam),
  .dcc_l2fill_vld_m(dcc_l2fill_vld_m),
  .dcc_ctxt_tid0_d(dcc_ctxt_tid0_d[1:0]),
  .dcc_ctxt_tid1_d(dcc_ctxt_tid1_d[1:0]),
  .dcc_ctxt_tg_d(dcc_ctxt_tg_d),
  .dcc_tid_e(dcc_tid_e[2:0]),
  .dcc_tid_m(dcc_tid_m[2:0]),
  .dcc_tid_b(dcc_tid_b[2:0]),
  .dcc_asi_m(dcc_asi_m[7:0]),
  .dcc_ld_inst_unqual_e(dcc_ld_inst_unqual_e),
  .dcc_ld_inst_vld_m(dcc_ld_inst_vld_m),
  .dcc_stb_cam_vld_m(dcc_stb_cam_vld_m),
  .dcc_baddr_m(dcc_baddr_m[2:0]),
  .dcc_signed_m(dcc_signed_m),
  .dcc_pref_inst_m(dcc_pref_inst_m),
  .dcc_std_inst_m(dcc_std_inst_m),
  .dcc_ldstub_inst_m(dcc_ldstub_inst_m),
  .dcc_atomic_b(dcc_atomic_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_lendian_pre_m(dcc_lendian_pre_m),
  .dcc_bendian_byp_m(dcc_bendian_byp_m),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_tte_vld_m(dcc_tte_vld_m),
  .dcc_ldst_sz_m(dcc_ldst_sz_m[1:0]),
  .dcc_ld_sz_m(dcc_ld_sz_m[1:0]),
  .dcc_fp32b_sel_m(dcc_fp32b_sel_m),
  .dcc_blk_inst_m(dcc_blk_inst_m),
  .dcc_blk_inst_b(dcc_blk_inst_b),
  .dcc_ldbl_b(dcc_ldbl_b),
  .dcc_ncache_b(dcc_ncache_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_sync_pipe_w(dcc_sync_pipe_w),
  .dcc_priv_b(dcc_priv_b),
  .dcc_hpriv_b(dcc_hpriv_b),
  .dcc_pctxt_sel_e(dcc_pctxt_sel_e),
  .dcc_sctxt_sel_e(dcc_sctxt_sel_e),
  .dcc_ld_miss_ldd(dcc_ld_miss_ldd),
  .dcc_ld_miss_ctl(dcc_ld_miss_ctl[60:40]),
  .dcc_sync_inst_w(dcc_sync_inst_w[7:0]),
  .dcc_asi_reload_sel(dcc_asi_reload_sel[7:0]),
  .dcc_wr_wtchpt(dcc_wr_wtchpt[7:0]),
  .dcc_wr_lsu_ctl_reg(dcc_wr_lsu_ctl_reg[7:0]),
  .dcc_wr_pwr_mgmt(dcc_wr_pwr_mgmt),
  .dcc_ceter_wr_w(dcc_ceter_wr_w),
  .dcc_p0ctxt_rd_m(dcc_p0ctxt_rd_m),
  .dcc_p1ctxt_rd_m(dcc_p1ctxt_rd_m),
  .dcc_s0ctxt_rd_m(dcc_s0ctxt_rd_m),
  .dcc_s1ctxt_rd_m(dcc_s1ctxt_rd_m),
  .dcc_pid_rd_m(dcc_pid_rd_m),
  .dcc_wtchpt_sel_m(dcc_wtchpt_sel_m),
  .dcc_demap_asi_m(dcc_demap_asi_m),
  .dcc_wtchpt_rd_b(dcc_wtchpt_rd_b),
  .dcc_rd_lsu_ctl_reg_b(dcc_rd_lsu_ctl_reg_b),
  .dcc_rd_diag_reg_b(dcc_rd_diag_reg_b),
  .dcc_rd_diag_dca_b(dcc_rd_diag_dca_b),
  .dcc_rd_core_id_b(dcc_rd_core_id_b),
  .dcc_rd_intr_id_b(dcc_rd_intr_id_b),
  .dcc_rd_dt_diag_m(dcc_rd_dt_diag_m),
  .dcc_rd_dt_diag_b(dcc_rd_dt_diag_b),
  .dcc_stb_diag_rd_m(dcc_stb_diag_rd_m),
  .dcc_rd_error_inj_b(dcc_rd_error_inj_b),
  .dcc_rd_pwr_mgmt_b(dcc_rd_pwr_mgmt_b),
  .dcc_wr_error_inj_m(dcc_wr_error_inj_m),
  .dcc_wr_error_inj_w(dcc_wr_error_inj_w),
  .dcc_tlb_data_read_b(dcc_tlb_data_read_b),
  .dcc_tlb_tag0_read_b(dcc_tlb_tag0_read_b),
  .dcc_tlb_tag1_read_b(dcc_tlb_tag1_read_b),
  .dcc_tlb_rw_index_e(dcc_tlb_rw_index_e),
  .dcc_rd_rhs_asi_b(dcc_rd_rhs_asi_b),
  .dcc_lsu_asi_rd_b(dcc_lsu_asi_rd_b),
  .dcc_lsu_asi_sel_w(dcc_lsu_asi_sel_w),
  .dcc_stb_diag_sel_w3(dcc_stb_diag_sel_w3),
  .dcc_stb_data_rd_w3(dcc_stb_data_rd_w3),
  .dcc_stb_ecc_rd_w3(dcc_stb_ecc_rd_w3),
  .dcc_stb_ctl_rd_w3(dcc_stb_ctl_rd_w3),
  .dcc_stb_addr_sel_w3(dcc_stb_addr_sel_w3),
  .dcc_stb_ptr_rd_w3(dcc_stb_ptr_rd_w3),
  .dcc_direct_map(dcc_direct_map),
  .dcc_dcs_memref_e(dcc_dcs_memref_e),
  .dcc_tlb_lookup(dcc_tlb_lookup),
  .dcc_tlb_bypass(dcc_tlb_bypass),
  .dcc_tlb_real(dcc_tlb_real),
  .dcc_tlb_rd_e(dcc_tlb_rd_e),
  .dcc_perror_b(dcc_perror_b),
  .dcc_perr_enc_b(dcc_perr_enc_b[1:0]),
  .dcc_dmo_parity(dcc_dmo_parity[3:0]),
  .lsu_va_w(lsu_va_w[12:3]),
  .dcc_sbd_e_clken(dcc_sbd_e_clken),
  .dcc_sbd_m_clken(dcc_sbd_m_clken),
  .dcc_ldst_m_clken(dcc_ldst_m_clken),
  .dcc_asi_rtn_vld(dcc_asi_rtn_vld[7:0]),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_exu_ld_vld_w(lsu_exu_ld_vld_w),
  .lsu_exu_ld_b(lsu_exu_ld_b),
  .lsu_exu_tid_m(lsu_exu_tid_m[2:0]),
  .lsu_exu_rd_m(lsu_exu_rd_m[4:0]),
  .lsu_fgu_fld_vld_w(lsu_fgu_fld_vld_w),
  .lsu_fgu_fld_b(lsu_fgu_fld_b),
  .lsu_fgu_fld_32b_b(lsu_fgu_fld_32b_b),
  .lsu_fgu_fld_odd32b_b(lsu_fgu_fld_odd32b_b),
  .lsu_fgu_fsr_load_b(lsu_fgu_fsr_load_b),
  .lsu_fgu_fld_tid_b(lsu_fgu_fld_tid_b[2:0]),
  .lsu_fgu_fld_addr_b(lsu_fgu_fld_addr_b[4:0]),
  .lsu_fgu_exception_w(lsu_fgu_exception_w),
  .lsu_sync(lsu_sync[7:0]),
  .lsu_complete(lsu_complete[7:0]),
  .lsu_cpq_stall(lsu_cpq_stall),
  .lsu_tlu_twocycle_m(lsu_tlu_twocycle_m),
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
  .lsu_illegal_inst_b(lsu_illegal_inst_b),
  .lsu_daccess_prot_b(lsu_daccess_prot_b),
  .lsu_tlb_miss_b_(lsu_tlb_miss_b_),
  .lsu_perfmon_trap_b(lsu_perfmon_trap_b),
  .lsu_perfmon_trap_g(lsu_perfmon_trap_g),
  .lsu_tlu_dsfsr_ct_b(lsu_tlu_dsfsr_ct_b[1:0]),
  .lsu_sync_inst_b(lsu_sync_inst_b),
  .lsu_dttp_err_b(lsu_dttp_err_b),
  .lsu_dtdp_err_b(lsu_dtdp_err_b),
  .lsu_dtmh_err_b(lsu_dtmh_err_b),
  .lsu_ifu_direct_map(lsu_ifu_direct_map),
  .dcc_mbi_run(dcc_mbi_run),
  .lsu_mbi_dca_fail(lsu_mbi_dca_fail),
  .lsu_mbi_lru_fail(lsu_mbi_lru_fail),
  .pmu_lsu_dcmiss_trap_m(pmu_lsu_dcmiss_trap_m),
  .pmu_lsu_dtmiss_trap_m(pmu_lsu_dtmiss_trap_m),
  .pmu_lsu_l2dmiss_trap_m(pmu_lsu_l2dmiss_trap_m[7:0]),
  .lsu_pmu_mem_type_b(lsu_pmu_mem_type_b[2:0]),
  .lsu_dc_pmen(lsu_dc_pmen),
  .lsu_lsu_pmen(lsu_lsu_pmen),
  .lsu_lsu_pmen_(lsu_lsu_pmen_),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

lsu_dcs_dp dcs (	// FS:wmr_prot
	.sbd_st_data_b		(sbd_st_predata_b_rep0[47:0]),
	.asd_asi_data		(lsu_rngf_cdbus[12:0]),
	.wmr_scan_in(dcs_wmr_scanin),
	.wmr_scan_out(dcs_wmr_scanout),
	.scan_in(dcs_scanin),
	.scan_out(dcs_scanout),
	.l2clk			(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk_wmr(spc_aclk_wmr),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lb_scan_en_wmr(lb_scan_en_wmr),
  .const_cpuid(const_cpuid[2:0]),
  .dec_lsu_tid0_d(dec_lsu_tid0_d[1:0]),
  .dec_lsu_tid1_d(dec_lsu_tid1_d[1:0]),
  .dec_lsu_tg_d(dec_lsu_tg_d),
  .dcc_ld_inst_unqual_e(dcc_ld_inst_unqual_e),
  .dcc_ctxt_tid0_d(dcc_ctxt_tid0_d[1:0]),
  .dcc_ctxt_tid1_d(dcc_ctxt_tid1_d[1:0]),
  .dcc_ctxt_tg_d(dcc_ctxt_tg_d),
  .dcc_tid_m(dcc_tid_m[2:0]),
  .dcc_tid_b(dcc_tid_b[2:0]),
  .dcc_asi_reload_sel(dcc_asi_reload_sel[7:0]),
  .dcc_wr_wtchpt(dcc_wr_wtchpt[7:0]),
  .dcc_wr_lsu_ctl_reg(dcc_wr_lsu_ctl_reg[7:0]),
  .dcc_wr_pwr_mgmt(dcc_wr_pwr_mgmt),
  .dcc_rd_lsu_ctl_reg_b(dcc_rd_lsu_ctl_reg_b),
  .dcc_rd_diag_reg_b(dcc_rd_diag_reg_b),
  .dcc_rd_core_id_b(dcc_rd_core_id_b),
  .dcc_rd_intr_id_b(dcc_rd_intr_id_b),
  .dcc_rd_rhs_asi_b(dcc_rd_rhs_asi_b),
  .dcc_rd_diag_dca_b(dcc_rd_diag_dca_b),
  .dcc_rd_error_inj_b(dcc_rd_error_inj_b),
  .dcc_rd_pwr_mgmt_b(dcc_rd_pwr_mgmt_b),
  .dcc_wr_error_inj_w(dcc_wr_error_inj_w),
  .dcc_p0ctxt_rd_m(dcc_p0ctxt_rd_m),
  .dcc_p1ctxt_rd_m(dcc_p1ctxt_rd_m),
  .dcc_s0ctxt_rd_m(dcc_s0ctxt_rd_m),
  .dcc_s1ctxt_rd_m(dcc_s1ctxt_rd_m),
  .dcc_pid_rd_m(dcc_pid_rd_m),
  .dcc_wtchpt_sel_m(dcc_wtchpt_sel_m),
  .dcc_wtchpt_rd_b(dcc_wtchpt_rd_b),
  .dcc_pctxt_sel_e(dcc_pctxt_sel_e),
  .dcc_sctxt_sel_e(dcc_sctxt_sel_e),
  .dcc_dcs_memref_e(dcc_dcs_memref_e),
  .dcc_direct_map(dcc_direct_map),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_load_m(dcc_asi_load_m),
  .dcc_asi_load_b(dcc_asi_load_b),
  .lsu_ifu_direct_map(lsu_ifu_direct_map),
  .asc_wr_p0ctxt(asc_wr_p0ctxt[7:0]),
  .asc_wr_p1ctxt(asc_wr_p1ctxt[7:0]),
  .asc_wr_s0ctxt(asc_wr_s0ctxt[7:0]),
  .asc_wr_s1ctxt(asc_wr_s1ctxt[7:0]),
  .asc_wr_pid(asc_wr_pid[7:0]),
  .asc_wrasi(asc_wrasi[7:0]),
  .tlu_asi_0(tlu_asi_0[7:0]),
  .tlu_asi_1(tlu_asi_1[7:0]),
  .tlu_lsu_clear_ctl_reg_(tlu_lsu_clear_ctl_reg_[7:0]),
  .dca_rparity_b(dca_rparity_b[7:0]),
  .tgd_ldxa_asi_data_b(tgd_ldxa_asi_data_b[63:0]),
  .lsu_va_m(lsu_va_m[20:0]),
  .lsu_va_b(lsu_va_b[20:0]),
  .dcs_asi_d(dcs_asi_d[7:0]),
  .dcs_context0_e(dcs_context0_e[12:0]),
  .dcs_context1_e(dcs_context1_e[12:0]),
  .dcs_pid_e(dcs_pid_e[2:0]),
  .dcs_ldxa_asi_data_w(dcs_ldxa_asi_data_w[63:0]),
  .dcs_watchpoint_m(dcs_watchpoint_m[47:3]),
  .dcs_dc_enable(dcs_dc_enable[7:0]),
  .dcs_wpt_mask_m(dcs_wpt_mask_m[7:0]),
  .dcs_wpt_enable_m(dcs_wpt_enable_m[1:0]),
  .dcs_wpt_mode_m(dcs_wpt_mode_m[1:0]),
  .dcs_dmmu_enable_d(dcs_dmmu_enable_d),
  .lsu_immu_enable(lsu_immu_enable[7:0]),
  .lsu_ic_enable(lsu_ic_enable[7:0]),
  .lsu_context_b(lsu_context_b[12:0]),
  .lsu_asi_error_inject(lsu_asi_error_inject[31:0]),
  .lsu_asi_pwr_mgmt(lsu_asi_pwr_mgmt[15:0]),
  .dcs_memref_m(dcs_memref_m)
);

lsu_lmd_dp lmd (
	.sbd_st_data_b		(sbd_st_data2_b_rep0[63:0]),
	.stb_ram_data		(stb_ram_data_rep0[63:0]),
	.scan_in(lmd_scanin),
	.scan_out(lmd_scanout),
	.l2clk			(l2clk),
  .lmc_lmq_enable_b(lmc_lmq_enable_b[7:0]),
  .lmc_lmq_bypass_en(lmc_lmq_bypass_en[7:0]),
  .lmc_pcx_sel_p4(lmc_pcx_sel_p4[7:0]),
  .lmc_byp_sel_e(lmc_byp_sel_e[7:0]),
  .lmc_thrd_byp_sel_m(lmc_thrd_byp_sel_m[7:0]),
  .lmc_lmq0_byp_sel(lmc_lmq0_byp_sel[4:0]),
  .lmc_lmq1_byp_sel(lmc_lmq1_byp_sel[4:0]),
  .lmc_lmq2_byp_sel(lmc_lmq2_byp_sel[4:0]),
  .lmc_lmq3_byp_sel(lmc_lmq3_byp_sel[4:0]),
  .lmc_lmq4_byp_sel(lmc_lmq4_byp_sel[4:0]),
  .lmc_lmq5_byp_sel(lmc_lmq5_byp_sel[4:0]),
  .lmc_lmq6_byp_sel(lmc_lmq6_byp_sel[4:0]),
  .lmc_lmq7_byp_sel(lmc_lmq7_byp_sel[4:0]),
  .lmc_bld_addr54(lmc_bld_addr54[1:0]),
  .lmc_bld_req(lmc_bld_req),
  .lmc_bld_req_(lmc_bld_req_),
  .lmc_lmd_ncache_b(lmc_lmd_ncache_b),
  .lmc_rd_update(lmc_rd_update[7:0]),
  .lmc_ld_unfilled(lmc_ld_unfilled[7:0]),
  .lmc_bist_or_diag_e(lmc_bist_or_diag_e),
  .lmc_byp_data_hi(lmc_byp_data_hi),
  .lmc_byp_data_enable(lmc_byp_data_enable),
  .dcc_ld_miss_ctl(dcc_ld_miss_ctl[60:40]),
  .dcc_perr_enc_b(dcc_perr_enc_b[1:0]),
  .dcc_l2fill_vld_m(dcc_l2fill_vld_m),
  .dcc_cache_diag_wr_b(dcc_cache_diag_wr_b),
  .ard_pid_data(ard_pid_data[63:0]),
  .stb_st_addr_b(stb_st_addr_b[39:13]),
  .sbd_st_addr_b(sbd_st_addr_b[12:11]),
  .stb_ldxa_asi_data_w(stb_ldxa_asi_data_w[63:0]),
  .lsu_va_b(lsu_va_b[12:0]),
  .lsu_va_w(lsu_va_w[12:3]),
  .cid_fill_data_e(cid_fill_data_e[127:0]),
  .cid_st_data_sel(cid_st_data_sel),
  .cid_tid(cid_tid[2:0]),
  .lsu_cpx_cpkt(lsu_cpx_cpkt[8:6]),
  .dcs_ldxa_asi_data_w(dcs_ldxa_asi_data_w[63:0]),
  .cic_diag_data_sel_e(cic_diag_data_sel_e),
  .mbi_wdata(mbi_wdata[7:0]),
  .lmc_mbi_run(lmc_mbi_run),
  .lmd_addrb2(lmd_addrb2),
  .lmd_asi_ld(lmd_asi_ld[7:0]),
  .lmd_asi_indet(lmd_asi_indet[7:0]),
  .lmd_sec_cmp_b(lmd_sec_cmp_b[7:0]),
  .lmd_ld_addr_m(lmd_ld_addr_m[2:0]),
  .lmd_fill_sz_b0_e(lmd_fill_sz_b0_e),
  .lmd_bendian_m(lmd_bendian_m),
  .lmd_sxt_fsr_m(lmd_sxt_fsr_m),
  .lmd_fill_way_e(lmd_fill_way_e[1:0]),
  .lmd_fill_way_m(lmd_fill_way_m[1:0]),
  .lmd_sz_m(lmd_sz_m[1:0]),
  .lmd_fpld_m(lmd_fpld_m),
  .lmd_rd_e(lmd_rd_e[2:1]),
  .lmd_rd_m(lmd_rd_m[4:0]),
  .lmd_fpodd32b_m(lmd_fpodd32b_m),
  .lmd_fp32b_m(lmd_fp32b_m),
  .lmd_bypass_data_m(lmd_bypass_data_m[63:0]),
  .lmd_fill_data_e(lmd_fill_data_e[127:0]),
  .lmd_fill_or_byp_data_m(lmd_fill_or_byp_data_m[63:0]),
  .lmd_misc_msb_m(lmd_misc_msb_m[7:0]),
  .lmd_fill_addr_e(lmd_fill_addr_e[39:3]),
  .lmd_fill_addr_m(lmd_fill_addr_m[10:4]),
  .lmd_wrtag_parity_e(lmd_wrtag_parity_e),
  .lmd_pcx_rqtyp(lmd_pcx_rqtyp[2:0]),
  .lmd_pcx_nc(lmd_pcx_nc),
  .lmd_pcx_pref(lmd_pcx_pref),
  .lmd_pcx_rway(lmd_pcx_rway[1:0]),
  .lmd_pcx_addr(lmd_pcx_addr[39:0]),
  .lmd_asi_rngf(lmd_asi_rngf),
  .lmd_asi_type(lmd_asi_type[1:0]),
  .lmd_asi_asi(lmd_asi_asi[7:0]),
  .lmd_sz_b1(lmd_sz_b1),
  .lmd_sz_b0(lmd_sz_b0),
  .lmd_ldbl(lmd_ldbl),
  .lmd_dc_err_e(lmd_dc_err_e[1:0]),
  .lsu_ifu_ld_index(lsu_ifu_ld_index[10:5]),
  .lsu_ext_int_type(lsu_ext_int_type[1:0]),
  .lsu_ext_int_vec(lsu_ext_int_vec[5:0]),
  .lsu_ext_int_tid(lsu_ext_int_tid[2:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

assign lsu_dcerr_sfar_g[8:0] = {lmd_fill_way_m[1:0],lmd_fill_addr_m[10:4]};

lsu_lmc_ctl lmc (
	.scan_in(lmc_scanin),
	.scan_out(lmc_scanout),
	.l2clk(l2clk),
	.tlb_pgnum_b39		(tlb_pgnum[39]),
	.dcc_ld_miss_ctl_b43	(dcc_ld_miss_ctl[43]),
	.stb_cam_hit		(stb_cam_hit_rep0),
	.lmd_fill_addr_b3_e	(lmd_fill_addr_e[3]),
	.cid_tid		(cid_tid_unbuf[2:0]),
	.sbd_st_data_b_62	(sbd_st_data2_b_rep0[62]),
	.sbc_kill_store_p4_	(sbc_pic_kill_store_p4_),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .dcc_tid_m(dcc_tid_m[2:0]),
  .dcc_ld_inst_vld_m(dcc_ld_inst_vld_m),
  .dcc_pref_inst_m(dcc_pref_inst_m),
  .dcc_ld_miss_b(dcc_ld_miss_b),
  .dcc_ld_miss_ldd(dcc_ld_miss_ldd),
  .dcc_asi_load_b(dcc_asi_load_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_blk_inst_b(dcc_blk_inst_b),
  .dcc_ldbl_b(dcc_ldbl_b),
  .dcc_ncache_b(dcc_ncache_b),
  .dcc_atomic_b(dcc_atomic_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_lsu_asi_rd_b(dcc_lsu_asi_rd_b),
  .dcc_lsu_asi_sel_w(dcc_lsu_asi_sel_w),
  .dcc_ceter_wr_w(dcc_ceter_wr_w),
  .dcc_stb_diag_sel_w3(dcc_stb_diag_sel_w3),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .dcc_perror_b(dcc_perror_b),
  .dcc_sync_pipe_w(dcc_sync_pipe_w),
  .dcc_cache_diag_wr_b(dcc_cache_diag_wr_b),
  .dcc_asi_rtn_vld(dcc_asi_rtn_vld[7:0]),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .pic_casa_squash_req(pic_casa_squash_req),
  .pic_early_ld_b_sel_p3(pic_early_ld_b_sel_p3),
  .pic_no_load_p3(pic_no_load_p3),
  .pic_asi_busy(pic_asi_busy),
  .lmd_pcx_pref(lmd_pcx_pref),
  .lmd_asi_ld(lmd_asi_ld[7:0]),
  .lmd_asi_indet(lmd_asi_indet[7:0]),
  .lmd_sec_cmp_b(lmd_sec_cmp_b[7:0]),
  .lmd_addrb2(lmd_addrb2),
  .lmd_sz_b1(lmd_sz_b1),
  .lmd_sz_b0(lmd_sz_b0),
  .lmd_ldbl(lmd_ldbl),
  .lmd_rd_e(lmd_rd_e[2:1]),
  .lmd_dc_err_e(lmd_dc_err_e[1:0]),
  .lmd_fill_sz_b0_e(lmd_fill_sz_b0_e),
  .tlb_cam_mhit(tlb_cam_mhit),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .tlu_cerer_sbdlc(tlu_cerer_sbdlc),
  .tlu_cerer_sbdlu(tlu_cerer_sbdlu),
  .tlu_cerer_dcl2c(tlu_cerer_dcl2c),
  .tlu_cerer_dcl2u(tlu_cerer_dcl2u),
  .tlu_cerer_dcl2nd(tlu_cerer_dcl2nd),
  .tlu_cerer_l2c_socc(tlu_cerer_l2c_socc),
  .tlu_cerer_l2u_socu(tlu_cerer_l2u_socu),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .dec_ld_inst_d(dec_ld_inst_d),
  .cic_l2fill_vld_e(cic_l2fill_vld_e),
  .cic_cpq_ld_rdy(cic_cpq_ld_rdy),
  .cic_cpq_ld_rdy_(cic_cpq_ld_rdy_),
  .cic_div_stall_d(cic_div_stall_d),
  .cic_oddrd_e(cic_oddrd_e),
  .cic_xinval_e(cic_xinval_e),
  .cic_xinval(cic_xinval[7:0]),
  .cic_set_inval(cic_set_inval),
  .cic_rtn_cmplt(cic_rtn_cmplt),
  .cic_cpq_stall(cic_cpq_stall),
  .cic_ext_interrupt(cic_ext_interrupt),
  .cid_err(cid_err[1:0]),
  .cid_dcsoc_err_e(cid_dcsoc_err_e),
  .cid_l2miss(cid_l2miss),
  .stb_cam_mhit(stb_cam_mhit),
  .stb_ld_part_raw(stb_ld_part_raw),
  .stb_cecc_err(stb_cecc_err),
  .stb_uecc_err(stb_uecc_err),
  .sbs_all_commited(sbs_all_commited[7:0]),
  .sbc_st_atom_p3(sbc_st_atom_p3[7:0]),
  .sbc_rawp_rst(sbc_rawp_rst[7:0]),
  .sbc_st_sel_tid_p4(sbc_st_sel_tid_p4[2:0]),
  .sbc_force_inv(sbc_force_inv),
  .lsu_lsu_pmen(lsu_lsu_pmen),
  .lmc_lmq_enable_b(lmc_lmq_enable_b[7:0]),
  .lmc_pcx_sel_p4(lmc_pcx_sel_p4[7:0]),
  .lmc_pcx_rq_vld(lmc_pcx_rq_vld),
  .lmc_asi_rq_vld(lmc_asi_rq_vld),
  .lmc_ld_rq_p3(lmc_ld_rq_p3),
  .lmc_ld_vld_p4(lmc_ld_vld_p4),
  .lmc_ld_no_req_p4(lmc_ld_no_req_p4),
  .lmc_ld_inv_p4(lmc_ld_inv_p4),
  .lmc_ld_tid(lmc_ld_tid[2:0]),
  .lmc_byp_sel_e(lmc_byp_sel_e[7:0]),
  .lmc_cpq_tid_m(lmc_cpq_tid_m[2:0]),
  .lmc_lmq_bypass_en(lmc_lmq_bypass_en[7:0]),
  .lmc_asi_bypass_m(lmc_asi_bypass_m),
  .lmc_bld_addr54(lmc_bld_addr54[1:0]),
  .lmc_bld_req(lmc_bld_req),
  .lmc_bld_req_(lmc_bld_req_),
  .lmc_bld_annul(lmc_bld_annul),
  .lmc_bld_miss_e(lmc_bld_miss_e),
  .lmc_bld_last_e(lmc_bld_last_e),
  .lmc_rd_update(lmc_rd_update[7:0]),
  .lmc_pref_issued(lmc_pref_issued[7:0]),
  .lmc_ldd_vld(lmc_ldd_vld[7:0]),
  .lmc_ld_unfilled(lmc_ld_unfilled[7:0]),
  .lmc_lmd_ncache_b(lmc_lmd_ncache_b),
  .lmc_ld_sz(lmc_ld_sz[4:0]),
  .lmc_ld_inst_w(lmc_ld_inst_w),
  .lmc_full_raw_w(lmc_full_raw_w),
  .lmc_ld_stall(lmc_ld_stall),
  .lmc_l2_err_noup(lmc_l2_err_noup),
  .lmc_l2_uerr(lmc_l2_uerr),
  .lmc_byp_data_hi(lmc_byp_data_hi),
  .lmc_byp_data_enable(lmc_byp_data_enable),
  .lmc_thrd_byp_sel_e(lmc_thrd_byp_sel_e[7:0]),
  .lmc_thrd_byp_sel_m(lmc_thrd_byp_sel_m[7:0]),
  .lmc_byp_tid_m(lmc_byp_tid_m[2:0]),
  .lmc_byp_vld_m(lmc_byp_vld_m),
  .lmc_lmq0_byp_sel(lmc_lmq0_byp_sel[4:0]),
  .lmc_lmq1_byp_sel(lmc_lmq1_byp_sel[4:0]),
  .lmc_lmq2_byp_sel(lmc_lmq2_byp_sel[4:0]),
  .lmc_lmq3_byp_sel(lmc_lmq3_byp_sel[4:0]),
  .lmc_lmq4_byp_sel(lmc_lmq4_byp_sel[4:0]),
  .lmc_lmq5_byp_sel(lmc_lmq5_byp_sel[4:0]),
  .lmc_lmq6_byp_sel(lmc_lmq6_byp_sel[4:0]),
  .lmc_lmq7_byp_sel(lmc_lmq7_byp_sel[4:0]),
  .lmc_asi_indet_retire(lmc_asi_indet_retire),
  .lsu_ifu_no_miss(lsu_ifu_no_miss[7:0]),
  .lsu_dcmh_err_g(lsu_dcmh_err_g),
  .lsu_dcvp_err_g(lsu_dcvp_err_g),
  .lsu_dctp_err_g(lsu_dctp_err_g),
  .lsu_dcdp_err_g(lsu_dcdp_err_g),
  .lsu_dcerr_tid_g(lsu_dcerr_tid_g[2:0]),
  .lsu_dcl2c_err_g(lsu_dcl2c_err_g),
  .lsu_dcl2u_err_g(lsu_dcl2u_err_g),
  .lsu_dcl2nd_err_g(lsu_dcl2nd_err_g),
  .lsu_sbdlc_err_g(lsu_sbdlc_err_g),
  .lsu_sbdlu_err_g(lsu_sbdlu_err_g),
  .lsu_stberr_tid_g(lsu_stberr_tid_g[2:0]),
  .lbist_run(lbist_run),
  .mbi_run(mbi_run),
  .lmc_mbi_run(lmc_mbi_run),
  .lmc_bist_or_diag_e(lmc_bist_or_diag_e)
);

lsu_pic_ctl pic (
	.scan_in(pic_scanin),
	.scan_out(pic_scanout),
	.l2clk		(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lmc_pcx_rq_vld(lmc_pcx_rq_vld),
  .lmc_asi_rq_vld(lmc_asi_rq_vld),
  .lmc_ld_rq_p3(lmc_ld_rq_p3),
  .lmc_ld_no_req_p4(lmc_ld_no_req_p4),
  .tlb_cache_hit_b(tlb_cache_hit_b),
  .dcc_early_ld_b(dcc_early_ld_b),
  .sbc_asi_rq_p3(sbc_asi_rq_p3),
  .sbc_pcx_rq_p3(sbc_pcx_rq_p3),
  .sbc_st_atomic_p2(sbc_st_atomic_p2),
  .sbc_st_rq_p2(sbc_st_rq_p2),
  .sbc_pic_kill_store_p4_(sbc_pic_kill_store_p4_),
  .sbc_indet_block_p3(sbc_indet_block_p3),
  .sbs_stb_full(sbs_stb_full[7:0]),
  .asc_pid_ack(asc_pid_ack),
  .dcc_asi_rtn_vld(dcc_asi_rtn_vld[7:0]),
  .lsu_ring_ctl(lsu_ring_ctl),
  .lsu_misc_pmen(lsu_misc_pmen),
  .pic_ld_pcx_sel_p4(pic_ld_pcx_sel_p4),
  .pic_st_pcx_sel_p3(pic_st_pcx_sel_p3),
  .pic_st_pcx_sel_p4(pic_st_pcx_sel_p4),
  .pic_st_asi_sel_p3(pic_st_asi_sel_p3),
  .pic_st_asi_p4(pic_st_asi_p4),
  .pic_ld_asi_p4(pic_ld_asi_p4),
  .pic_st_sel_p3(pic_st_sel_p3),
  .pic_asi_sel_p4(pic_asi_sel_p4),
  .pic_asi_req(pic_asi_req),
  .pic_casa_squash_req(pic_casa_squash_req),
  .pic_early_ld_b_sel_p3(pic_early_ld_b_sel_p3),
  .pic_no_load_p3(pic_no_load_p3),
  .pic_asi_busy(pic_asi_busy),
  .l15_lsu_grant(l15_lsu_grant),
  .lsu_l15_valid(lsu_l15_valid),
  .lsu_l15_lock(lsu_l15_lock),
  .lsu_asi_clken(lsu_asi_clken)
);

n2_com_dp_32x152_cust cpq (
	.wr_adr	(cic_cpq_wptr[4:0]),
	.wr_en	(cic_cpq_wr_en),
	.rd_adr	(cic_cpq_rptr[4:0]),
	.rd_en	(cic_cpq_rd_en),
	.din	(cpq_din[151:0]),
	.scan_in(cpq_scanin),
	.scan_out(cpq_scanout),
	.rdclk	(l2clk),
	.wrclk	(l2clk),
	.dout	(cpq_dout[151:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);

assign cpq_din[151:0] = {
 cid_cpq_wdata[127], cid_cpq_wdata[63], cid_cpq_wdata[126], cid_cpq_wdata[62],
 cid_cpq_wdata[125], cid_cpq_wdata[61], cid_cpq_wdata[124], cid_cpq_wdata[60],
 cid_cpq_wdata[123], cid_cpq_wdata[59], cid_cpq_wdata[122], cid_cpq_wdata[58],
 cid_cpq_wdata[121], cid_cpq_wdata[57], cid_cpq_wdata[120], cid_cpq_wdata[56],
 cid_cpq_wdata[119], cid_cpq_wdata[55], cid_cpq_wdata[118], cid_cpq_wdata[54],
 cid_cpq_wdata[117], cid_cpq_wdata[53], cid_cpq_wdata[116], cid_cpq_wdata[52],
 cid_cpq_wdata[115], cid_cpq_wdata[51], cid_cpq_wdata[114], cid_cpq_wdata[50],
 cid_cpq_wdata[113], cid_cpq_wdata[49], cid_cpq_wdata[112], cid_cpq_wdata[48],
 cid_cpq_wdata[111], cid_cpq_wdata[47], cid_cpq_wdata[110], cid_cpq_wdata[46],
 cid_cpq_wdata[109], cid_cpq_wdata[45], cid_cpq_wdata[108], cid_cpq_wdata[44],
 cid_cpq_wdata[107], cid_cpq_wdata[43], cid_cpq_wdata[106], cid_cpq_wdata[42],
 cid_cpq_wdata[105], cid_cpq_wdata[41], cid_cpq_wdata[104], cid_cpq_wdata[40],
 cid_cpq_wdata[103], cid_cpq_wdata[39], cid_cpq_wdata[102], cid_cpq_wdata[38],
 cid_cpq_wdata[101], cid_cpq_wdata[37], cid_cpq_wdata[100], cid_cpq_wdata[36],
 cid_cpq_wdata[99],  cid_cpq_wdata[35], cid_cpq_wdata[98],  cid_cpq_wdata[34],
 cid_cpq_wdata[97],  cid_cpq_wdata[33], cid_cpq_wdata[96],  cid_cpq_wdata[32],
 cid_cpq_wdata[95],  cid_cpq_wdata[31], cid_cpq_wdata[94],  cid_cpq_wdata[30],
 cid_cpq_wdata[93],  cid_cpq_wdata[29], cid_cpq_wdata[92],  cid_cpq_wdata[28],
 cid_cpq_wdata[91],  cid_cpq_wdata[27], cid_cpq_wdata[90],  cid_cpq_wdata[26],
 cid_cpq_wdata[89],  cid_cpq_wdata[25], cid_cpq_wdata[88],  cid_cpq_wdata[24],
 cid_cpq_wdata[87],  cid_cpq_wdata[23], cid_cpq_wdata[86],  cid_cpq_wdata[22],
 cid_cpq_wdata[85],  cid_cpq_wdata[21], cid_cpq_wdata[84],  cid_cpq_wdata[20],
 cid_cpq_wdata[83],  cid_cpq_wdata[19], cid_cpq_wdata[82],  cid_cpq_wdata[18],
 cid_cpq_wdata[81],  cid_cpq_wdata[17], cid_cpq_wdata[80],  cid_cpq_wdata[16],
 cid_cpq_wdata[79],  cid_cpq_wdata[15], cid_cpq_wdata[78],  cid_cpq_wdata[14],
 cid_cpq_wdata[77],  cid_cpq_wdata[13], cid_cpq_wdata[76],  cid_cpq_wdata[12],
 cid_cpq_wdata[75],  cid_cpq_wdata[11], cid_cpq_wdata[74],  cid_cpq_wdata[10],
 cid_cpq_wdata[73],  cid_cpq_wdata[9], cid_cpq_wdata[72],  cid_cpq_wdata[8],
 cid_cpq_wdata[71],  cid_cpq_wdata[7], cid_cpq_wdata[70],  cid_cpq_wdata[6],
 cid_cpq_wdata[69],  cid_cpq_wdata[5], cid_cpq_wdata[68],  cid_cpq_wdata[4],
 cid_cpq_wdata[67],  cid_cpq_wdata[3], cid_cpq_wdata[66],  cid_cpq_wdata[2],
 cid_cpq_wdata[65],  cid_cpq_wdata[1], cid_cpq_wdata[64],  cid_cpq_wdata[0],
 2'b00,
 cid_cpq_wdata[128], cid_cpq_wdata[129], cid_cpq_wdata[130], cid_cpq_wdata[131], 
 cid_cpq_wdata[132], cid_cpq_wdata[133], cid_cpq_wdata[134], cid_cpq_wdata[135], 
 cid_cpq_wdata[136], cid_cpq_wdata[137], cid_cpq_wdata[138], cid_cpq_wdata[139], 
 cid_cpq_wdata[140], cid_cpq_wdata[141], cid_cpq_wdata[142], cid_cpq_wdata[143], 
 cid_cpq_wdata[144], cid_cpq_wdata[145], 4'b0
 };

assign {
 cpq_rdata[127], cpq_rdata[63], cpq_rdata[126], cpq_rdata[62],
 cpq_rdata[125], cpq_rdata[61], cpq_rdata[124], cpq_rdata[60],
 cpq_rdata[123], cpq_rdata[59], cpq_rdata[122], cpq_rdata[58],
 cpq_rdata[121], cpq_rdata[57], cpq_rdata[120], cpq_rdata[56],
 cpq_rdata[119], cpq_rdata[55], cpq_rdata[118], cpq_rdata[54],
 cpq_rdata[117], cpq_rdata[53], cpq_rdata[116], cpq_rdata[52],
 cpq_rdata[115], cpq_rdata[51], cpq_rdata[114], cpq_rdata[50],
 cpq_rdata[113], cpq_rdata[49], cpq_rdata[112], cpq_rdata[48],
 cpq_rdata[111], cpq_rdata[47], cpq_rdata[110], cpq_rdata[46],
 cpq_rdata[109], cpq_rdata[45], cpq_rdata[108], cpq_rdata[44],
 cpq_rdata[107], cpq_rdata[43], cpq_rdata[106], cpq_rdata[42],
 cpq_rdata[105], cpq_rdata[41], cpq_rdata[104], cpq_rdata[40],
 cpq_rdata[103], cpq_rdata[39], cpq_rdata[102], cpq_rdata[38],
 cpq_rdata[101], cpq_rdata[37], cpq_rdata[100], cpq_rdata[36],
 cpq_rdata[99],  cpq_rdata[35], cpq_rdata[98],  cpq_rdata[34],
 cpq_rdata[97],  cpq_rdata[33], cpq_rdata[96],  cpq_rdata[32],
 cpq_rdata[95],  cpq_rdata[31], cpq_rdata[94],  cpq_rdata[30],
 cpq_rdata[93],  cpq_rdata[29], cpq_rdata[92],  cpq_rdata[28],
 cpq_rdata[91],  cpq_rdata[27], cpq_rdata[90],  cpq_rdata[26],
 cpq_rdata[89],  cpq_rdata[25], cpq_rdata[88],  cpq_rdata[24],
 cpq_rdata[87],  cpq_rdata[23], cpq_rdata[86],  cpq_rdata[22],
 cpq_rdata[85],  cpq_rdata[21], cpq_rdata[84],  cpq_rdata[20],
 cpq_rdata[83],  cpq_rdata[19], cpq_rdata[82],  cpq_rdata[18],
 cpq_rdata[81],  cpq_rdata[17], cpq_rdata[80],  cpq_rdata[16],
 cpq_rdata[79],  cpq_rdata[15], cpq_rdata[78],  cpq_rdata[14],
 cpq_rdata[77],  cpq_rdata[13], cpq_rdata[76],  cpq_rdata[12],
 cpq_rdata[75],  cpq_rdata[11], cpq_rdata[74],  cpq_rdata[10],
 cpq_rdata[73],  cpq_rdata[9], cpq_rdata[72],  cpq_rdata[8],
 cpq_rdata[71],  cpq_rdata[7], cpq_rdata[70],  cpq_rdata[6],
 cpq_rdata[69],  cpq_rdata[5], cpq_rdata[68],  cpq_rdata[4],
 cpq_rdata[67],  cpq_rdata[3], cpq_rdata[66],  cpq_rdata[2],
 cpq_rdata[65],  cpq_rdata[1], cpq_rdata[64],  cpq_rdata[0],
 cpq_unused[1:0],
 cpq_rdata[128], cpq_rdata[129], cpq_rdata[130], cpq_rdata[131], 
 cpq_rdata[132], cpq_rdata[133], cpq_rdata[134], cpq_rdata[135], 
 cpq_rdata[136], cpq_rdata[137], cpq_rdata[138], cpq_rdata[139], 
 cpq_rdata[140], cpq_rdata[141], cpq_rdata[142], cpq_rdata[143], 
 cpq_rdata[144], cpq_rdata[145], cpq_unused[5:2]
} = cpq_dout[151:0];

lsu_cid_dp cid (
	.scan_in(cid_scanin),
	.scan_out(cid_scanout),
	.l2clk			(l2clk),
	.mbi_run		(cic_mbi_run),
  .cpq_rdata(cpq_rdata[145:0]),
  .cpx_spc_data_cx(cpx_spc_data_cx[145:0]),
  .cic_byp_sel(cic_byp_sel),
  .cic_d1_sel(cic_d1_sel),
  .cic_cpq_sel(cic_cpq_sel),
  .cic_fifo_sel(cic_fifo_sel),
  .cic_fifo_clken(cic_fifo_clken),
  .cid_fill_data_e(cid_fill_data_e[127:0]),
  .cid_l2miss(cid_l2miss),
  .cid_pkt_type(cid_pkt_type[4:0]),
  .cid_tid(cid_tid[2:0]),
  .cid_tid_unbuf(cid_tid_unbuf[2:0]),
  .cid_cpuid(cid_cpuid[2:0]),
  .cid_st_data_sel(cid_st_data_sel),
  .cid_xinval(cid_xinval),
  .cid_pref(cid_pref),
  .cid_err(cid_err[1:0]),
  .cid_xway(cid_xway[1:0]),
  .cid_st_addr(cid_st_addr[10:3]),
  .cid_st_vector(cid_st_vector[15:0]),
  .cid_st_bmask(cid_st_bmask[7:0]),
  .cid_st_way(cid_st_way[1:0]),
  .cid_inv_vec(cid_inv_vec[17:0]),
  .cid_inv_index(cid_inv_index[10:6]),
  .cid_ncache(cid_ncache),
  .cid_atomic(cid_atomic),
  .cid_atomic_unbuf(cid_atomic_unbuf),
  .cid_rmo_ack(cid_rmo_ack),
  .cid_set_inval(cid_set_inval),
  .cid_set_icinval(cid_set_icinval),
  .cid_cpq_wdata(cid_cpq_wdata[145:0]),
  .cid_dcsoc_err_e(cid_dcsoc_err_e),
  .cid_d1_rtntyp(cid_d1_rtntyp[4:0]),
  .cid_d1_tid(cid_d1_tid[2:0]),
  .cid_d1_cpuid(cid_d1_cpuid[2:0]),
  .cid_d1_wv(cid_d1_wv),
  .cid_d1_rmo(cid_d1_rmo),
  .cid_d1_pref(cid_d1_pref),
  .cid_d1_inval(cid_d1_inval[1:0]),
  .cid_cpq_cmp_1(cid_cpq_cmp_1),
  .cid_cpq_cmp_2(cid_cpq_cmp_2),
  .cid_cpq_cmp_3(cid_cpq_cmp_3),
  .lsu_cpx_data(lsu_cpx_data[127:0]),
  .lsu_cpx_cpkt(lsu_cpx_cpkt[17:0]),
  .lsu_cpx_valid(lsu_cpx_valid),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .const_cpuid(const_cpuid[2:0]),
  .mbi_wdata(mbi_wdata[7:0]),
  .bist_wdata_1(bist_wdata_1[7:0]),
  .bist_cmpsel_2(bist_cmpsel_2)
);

lsu_red_ctl red (
	.scan_in(red_scanin),
	.scan_out(red_scanout),
        .io_cmp_sync_en(slow_cmp_sync_en),
        .cmp_io_sync_en(cmp_slow_sync_en),
	.l2clk			(l2clk),
	.sram_hdr_read_data	({dca_fuse_repair_value[5:0],dca_fuse_repair_en}),
  .efu_spc_fuse_data(efu_spc_fuse_data),
  .efu_spc_fuse_dxfer_en(efu_spc_fuse_dxfer_en),
  .efu_spc_fuse_dclr(efu_spc_fuse_dclr),
  .spc_efu_fuse_ddata(spc_efu_fuse_ddata),
  .spc_efu_fuse_dxfer_en(spc_efu_fuse_dxfer_en),
  .hdr_sram_rvalue(hdr_sram_rvalue[6:0]),
  .hdr_sram_rid(hdr_sram_rid[1:0]),
  .hdr_sram_wr_en(hdr_sram_wr_en),
  .hdr_sram_red_clr(hdr_sram_red_clr),
  .tcu_pce_ov(tcu_pce_ov),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Atomic ack should never have set inval bits on
// 0in custom -fire ((cpx_spc_data_cx[145:141] == 5'b10100) & cpx_spc_data_cx[129] & |(cpx_spc_data_cx[124:123])) -message "ATOMIC load rtn packet expects NC=1"

lsu_cic_ctl cic (
	.scan_in(cic_scanin),
	.scan_out(cic_scanout),
	.l2clk			(l2clk),
	.cpx_pkt_vld		(cpx_spc_data_cx[145]),
	.cid_tid		(cid_tid_unbuf[2:0]),
	.cid_atomic		(cid_atomic_unbuf),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .const_cpuid(const_cpuid[2:0]),
  .cid_d1_rtntyp(cid_d1_rtntyp[4:0]),
  .cid_d1_wv(cid_d1_wv),
  .cid_d1_tid(cid_d1_tid[2:0]),
  .cid_d1_rmo(cid_d1_rmo),
  .cid_d1_pref(cid_d1_pref),
  .cid_d1_cpuid(cid_d1_cpuid[2:0]),
  .cid_d1_inval(cid_d1_inval[1:0]),
  .cid_cpuid(cid_cpuid[2:0]),
  .cid_pkt_type(cid_pkt_type[4:0]),
  .cid_xinval(cid_xinval),
  .cid_pref(cid_pref),
  .cid_inv_vec(cid_inv_vec[17:0]),
  .cid_rmo_ack(cid_rmo_ack),
  .cid_set_inval(cid_set_inval),
  .cid_set_icinval(cid_set_icinval),
  .cid_st_addr(cid_st_addr[5:4]),
  .cid_st_vector(cid_st_vector[15:0]),
  .cid_cpq_cmp_1(cid_cpq_cmp_1),
  .cid_cpq_cmp_2(cid_cpq_cmp_2),
  .cid_cpq_cmp_3(cid_cpq_cmp_3),
  .dcc_cache_diag_wr_b(dcc_cache_diag_wr_b),
  .dec_ld_inst_d(dec_ld_inst_d),
  .fgu_fdiv_stall(fgu_fdiv_stall),
  .lmc_ldd_vld(lmc_ldd_vld[7:0]),
  .sbc_bst_sel(sbc_bst_sel[7:0]),
  .mbi_run(mbi_run),
  .mbi_cpq_read_en(mbi_cpq_read_en),
  .mbi_cpq_write_en(mbi_cpq_write_en),
  .mbi_addr(mbi_addr[4:0]),
  .lbist_run(lbist_run),
  .cic_cpq_wptr(cic_cpq_wptr[4:0]),
  .cic_cpq_rptr(cic_cpq_rptr[4:0]),
  .cic_cpq_rd_en(cic_cpq_rd_en),
  .cic_cpq_wr_en(cic_cpq_wr_en),
  .cic_d1_sel(cic_d1_sel),
  .cic_cpq_sel(cic_cpq_sel),
  .cic_fifo_sel(cic_fifo_sel),
  .cic_byp_sel(cic_byp_sel),
  .cic_fifo_clken(cic_fifo_clken),
  .cic_l2fill_vld_e(cic_l2fill_vld_e),
  .cic_cpq_ld_rdy(cic_cpq_ld_rdy),
  .cic_cpq_ld_rdy_(cic_cpq_ld_rdy_),
  .cic_cpq_ld_sel(cic_cpq_ld_sel),
  .cic_div_stall_d(cic_div_stall_d),
  .cic_st_update_e(cic_st_update_e),
  .cic_rtn_cmplt(cic_rtn_cmplt),
  .cic_invalidate_e(cic_invalidate_e),
  .cic_xinval_e(cic_xinval_e),
  .cic_set_inval(cic_set_inval),
  .cic_xinval(cic_xinval[7:0]),
  .cic_oddrd_e(cic_oddrd_e),
  .cic_st_dequeue(cic_st_dequeue[7:0]),
  .cic_rmo_dequeue(cic_rmo_dequeue[7:0]),
  .cic_st_ack(cic_st_ack[7:0]),
  .cic_inv_wen_e(cic_inv_wen_e[15:0]),
  .cic_cpq_stall(cic_cpq_stall),
  .cic_diag_data_sel_e(cic_diag_data_sel_e),
  .cic_ext_interrupt(cic_ext_interrupt),
  .lsu_dcsoc_err_g(lsu_dcsoc_err_g),
  .lsu_ext_interrupt(lsu_ext_interrupt),
  .cic_mbi_run(cic_mbi_run),
  .lsu_mbi_cpq_fail(lsu_mbi_cpq_fail)
);

lsu_asc_ctl asc (
	.scan_in(asc_scanin),
	.scan_out(asc_scanout),
	.l2clk		(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .asd_p2a_vld(asd_p2a_vld),
  .asd_p2a_fast(asd_p2a_fast),
  .asd_ring_ctl(asd_ring_ctl[63:56]),
  .asd_ring_asi(asd_ring_asi[7:0]),
  .asd_ring_addr(asd_ring_addr[8:3]),
  .lsu_asi_clken(lsu_asi_clken),
  .sbc_pid_kill_store_p4_(sbc_pid_kill_store_p4_),
  .pic_st_asi_p4(pic_st_asi_p4),
  .asc_ring_ctl(asc_ring_ctl),
  .asc_ring_data(asc_ring_data),
  .asc_ring_local(asc_ring_local),
  .asc_ring_fast(asc_ring_fast),
  .asc_wr_p0ctxt(asc_wr_p0ctxt[7:0]),
  .asc_wr_p1ctxt(asc_wr_p1ctxt[7:0]),
  .asc_wr_s0ctxt(asc_wr_s0ctxt[7:0]),
  .asc_wr_s1ctxt(asc_wr_s1ctxt[7:0]),
  .asc_wr_pid(asc_wr_pid[7:0]),
  .asc_wrasi(asc_wrasi[7:0]),
  .asc_pid_ack(asc_pid_ack),
  .lsu_ring_ctl(lsu_ring_ctl),
  .lsu_ifu_tid_w(lsu_ifu_tid_w[2:0]),
  .lsu_ifu_wr_p0ctxt(lsu_ifu_wr_p0ctxt),
  .lsu_ifu_wr_p1ctxt(lsu_ifu_wr_p1ctxt),
  .lsu_ifu_wr_pid(lsu_ifu_wr_pid)
);

lsu_asd_dp asd (
.scan_in(asd_scanin),
.scan_out(asd_scanout),
.l2clk(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .pid_asi_pkt(pid_asi_pkt[127:0]),
  .asc_ring_ctl(asc_ring_ctl),
  .asc_ring_data(asc_ring_data),
  .asc_ring_local(asc_ring_local),
  .asc_ring_fast(asc_ring_fast),
  .lsu_asi_clken(lsu_asi_clken),
  .lsu_ring_ctl(lsu_ring_ctl),
  .asd_p2a_vld(asd_p2a_vld),
  .asd_p2a_fast(asd_p2a_fast),
  .lsu_rngf_cdbus(lsu_rngf_cdbus[64:0]),
  .lsu_rngl_cdbus(lsu_rngl_cdbus[64:0]),
  .lsu_ifu_ctxt_data(lsu_ifu_ctxt_data[12:0]),
  .asd_ring_ctl(asd_ring_ctl[63:56]),
  .asd_ring_asi(asd_ring_asi[7:0]),
  .asd_ring_addr(asd_ring_addr[8:3])
);

lsu_pid_dp pid (
	.scan_in(pid_scanin),
	.scan_out(pid_scanout),
	.l2clk		(l2clk),
	.stb_ram_data	(stb_ram_data_corr[63:0]),
	.stb_cam_data	(stb_cam_data_rep0[44:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .const_cpuid(const_cpuid[2:0]),
  .lmd_bypass_data_m(lmd_bypass_data_m[63:0]),
  .lmc_ld_tid(lmc_ld_tid[2:0]),
  .lmc_ld_sz(lmc_ld_sz[4:0]),
  .lmd_pcx_rqtyp(lmd_pcx_rqtyp[2:0]),
  .lmd_pcx_nc(lmd_pcx_nc),
  .lmd_pcx_pref(lmd_pcx_pref),
  .lmd_pcx_rway(lmd_pcx_rway[1:0]),
  .lmd_pcx_addr(lmd_pcx_addr[39:0]),
  .lmd_asi_rngf(lmd_asi_rngf),
  .lmd_asi_type(lmd_asi_type[1:0]),
  .lmd_asi_asi(lmd_asi_asi[7:0]),
  .lmc_ld_vld_p4(lmc_ld_vld_p4),
  .lmc_ld_inv_p4(lmc_ld_inv_p4),
  .sbc_st_sel_tid_p4(sbc_st_sel_tid_p4[2:0]),
  .sbc_st_pcx_nc(sbc_st_pcx_nc),
  .sbc_st_asi_fs(sbc_st_asi_fs),
  .sbc_pcx_bmask(sbc_pcx_bmask[7:0]),
  .sbc_pcx_addr(sbc_pcx_addr[2:0]),
  .sbc_pcx_rmo_st(sbc_pcx_rmo_st),
  .sbc_pcx_blk_st(sbc_pcx_blk_st),
  .sbc_pid_kill_store_p4_(sbc_pid_kill_store_p4_),
  .sbc_force_inv(sbc_force_inv),
  .sbc_st_type_p4(sbc_st_type_p4[2:0]),
  .pic_ld_pcx_sel_p4(pic_ld_pcx_sel_p4),
  .pic_st_pcx_sel_p4(pic_st_pcx_sel_p4),
  .pic_st_asi_p4(pic_st_asi_p4),
  .pic_ld_asi_p4(pic_ld_asi_p4),
  .pic_asi_sel_p4(pic_asi_sel_p4),
  .pic_asi_req(pic_asi_req),
  .spc_pcx_data_pa(spc_pcx_data_pa[129:0]),
  .pid_asi_pkt(pid_asi_pkt[127:0])
);

lsu_sbs_ctl sbs0 (
	.scan_in(sbs0_scanin),
	.scan_out(sbs0_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[0]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[0]),
	.sbc_bst_b		(lsu_block_store_b[0]),
	.cic_st_ack		(cic_st_ack[0]),
	.cic_st_dequeue		(cic_st_dequeue[0]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[0]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[0]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[0]),
	.sbs_stb_wptr_m		(sbs0_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs0_stb_rptr[2:0]),
	.sbs_state_vld		(sbs0_state_vld[7:0]),
	.sbs_state_ced		(sbs0_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[0]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[0]),
	.sbs_all_commited	(sbs_all_commited[0]),
	.sbs_stb_empty		(sbs_stb_empty[0]),
	.lsu_stb_empty		(lsu_stb_empty[0]),
	.sbs_stb_full		(sbs_stb_full[0]),
	.sbs_bst_req		(sbs_bst_req[0]),
	.sbc_bst_sel		(sbc_bst_sel[0]),
	.sbc_st_addr_new	(sbc_st_addr_new[0]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[0]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[0]),
	.sbs_sync		(lsu_trap_flush[0]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[0]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[0]),
	.sbs_st_type		(sbs0_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[0]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[0]),
	.lsu_block_store_kill	(lsu_block_store_kill[0]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[0]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[0]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs1 (
	.scan_in(sbs1_scanin),
	.scan_out(sbs1_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[1]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[1]),
	.sbc_bst_b		(lsu_block_store_b[1]),
	.cic_st_ack		(cic_st_ack[1]),
	.cic_st_dequeue		(cic_st_dequeue[1]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[1]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[1]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[1]),
	.sbs_stb_wptr_m		(sbs1_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs1_stb_rptr[2:0]),
	.sbs_state_vld		(sbs1_state_vld[7:0]),
	.sbs_state_ced		(sbs1_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[1]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[1]),
	.sbs_all_commited	(sbs_all_commited[1]),
	.sbs_stb_empty		(sbs_stb_empty[1]),
	.lsu_stb_empty		(lsu_stb_empty[1]),
	.sbs_stb_full		(sbs_stb_full[1]),
	.sbs_bst_req		(sbs_bst_req[1]),
	.sbc_bst_sel		(sbc_bst_sel[1]),
	.sbc_st_addr_new	(sbc_st_addr_new[1]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[1]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[1]),
	.sbs_sync		(lsu_trap_flush[1]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[1]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[1]),
	.sbs_st_type		(sbs1_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[1]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[1]),
	.lsu_block_store_kill	(lsu_block_store_kill[1]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[1]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[1]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[1]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs2 (
	.scan_in(sbs2_scanin),
	.scan_out(sbs2_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[2]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[2]),
	.sbc_bst_b		(lsu_block_store_b[2]),
	.cic_st_ack		(cic_st_ack[2]),
	.cic_st_dequeue		(cic_st_dequeue[2]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[2]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[2]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[2]),
	.sbs_stb_wptr_m		(sbs2_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs2_stb_rptr[2:0]),
	.sbs_state_vld		(sbs2_state_vld[7:0]),
	.sbs_state_ced		(sbs2_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[2]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[2]),
	.sbs_all_commited	(sbs_all_commited[2]),
	.sbs_stb_empty		(sbs_stb_empty[2]),
	.lsu_stb_empty		(lsu_stb_empty[2]),
	.sbs_stb_full		(sbs_stb_full[2]),
	.sbs_bst_req		(sbs_bst_req[2]),
	.sbc_bst_sel		(sbc_bst_sel[2]),
	.sbc_st_addr_new	(sbc_st_addr_new[2]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[2]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[2]),
	.sbs_sync		(lsu_trap_flush[2]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[2]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[2]),
	.sbs_st_type		(sbs2_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[2]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[2]),
	.lsu_block_store_kill	(lsu_block_store_kill[2]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[2]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[2]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[2]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs3 (
	.scan_in(sbs3_scanin),
	.scan_out(sbs3_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[3]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[3]),
	.sbc_bst_b		(lsu_block_store_b[3]),
	.cic_st_ack		(cic_st_ack[3]),
	.cic_st_dequeue		(cic_st_dequeue[3]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[3]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[3]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[3]),
	.sbs_stb_wptr_m		(sbs3_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs3_stb_rptr[2:0]),
	.sbs_state_vld		(sbs3_state_vld[7:0]),
	.sbs_state_ced		(sbs3_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[3]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[3]),
	.sbs_all_commited	(sbs_all_commited[3]),
	.sbs_stb_empty		(sbs_stb_empty[3]),
	.lsu_stb_empty		(lsu_stb_empty[3]),
	.sbs_stb_full		(sbs_stb_full[3]),
	.sbs_bst_req		(sbs_bst_req[3]),
	.sbc_bst_sel		(sbc_bst_sel[3]),
	.sbc_st_addr_new	(sbc_st_addr_new[3]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[3]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[3]),
	.sbs_sync		(lsu_trap_flush[3]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[3]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[3]),
	.sbs_st_type		(sbs3_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[3]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[3]),
	.lsu_block_store_kill	(lsu_block_store_kill[3]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[3]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[3]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[3]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs4 (
	.scan_in(sbs4_scanin),
	.scan_out(sbs4_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[4]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[4]),
	.sbc_bst_b		(lsu_block_store_b[4]),
	.cic_st_ack		(cic_st_ack[4]),
	.cic_st_dequeue		(cic_st_dequeue[4]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[4]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[4]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[4]),
	.sbs_stb_wptr_m		(sbs4_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs4_stb_rptr[2:0]),
	.sbs_state_vld		(sbs4_state_vld[7:0]),
	.sbs_state_ced		(sbs4_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[4]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[4]),
	.sbs_all_commited	(sbs_all_commited[4]),
	.sbs_stb_empty		(sbs_stb_empty[4]),
	.lsu_stb_empty		(lsu_stb_empty[4]),
	.sbs_stb_full		(sbs_stb_full[4]),
	.sbs_bst_req		(sbs_bst_req[4]),
	.sbc_bst_sel		(sbc_bst_sel[4]),
	.sbc_st_addr_new	(sbc_st_addr_new[4]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[4]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[4]),
	.sbs_sync		(lsu_trap_flush[4]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[4]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[4]),
	.sbs_st_type		(sbs4_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[4]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[4]),
	.lsu_block_store_kill	(lsu_block_store_kill[4]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[4]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[4]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[4]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs5 (
	.scan_in(sbs5_scanin),
	.scan_out(sbs5_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[5]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[5]),
	.sbc_bst_b		(lsu_block_store_b[5]),
	.cic_st_ack		(cic_st_ack[5]),
	.cic_st_dequeue		(cic_st_dequeue[5]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[5]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[5]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[5]),
	.sbs_stb_wptr_m		(sbs5_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs5_stb_rptr[2:0]),
	.sbs_state_vld		(sbs5_state_vld[7:0]),
	.sbs_state_ced		(sbs5_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[5]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[5]),
	.sbs_all_commited	(sbs_all_commited[5]),
	.sbs_stb_empty		(sbs_stb_empty[5]),
	.lsu_stb_empty		(lsu_stb_empty[5]),
	.sbs_stb_full		(sbs_stb_full[5]),
	.sbs_bst_req		(sbs_bst_req[5]),
	.sbc_bst_sel		(sbc_bst_sel[5]),
	.sbc_st_addr_new	(sbc_st_addr_new[5]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[5]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[5]),
	.sbs_sync		(lsu_trap_flush[5]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[5]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[5]),
	.sbs_st_type		(sbs5_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[5]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[5]),
	.lsu_block_store_kill	(lsu_block_store_kill[5]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[5]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[5]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[5]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs6 (
	.scan_in(sbs6_scanin),
	.scan_out(sbs6_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[6]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[6]),
	.sbc_bst_b		(lsu_block_store_b[6]),
	.cic_st_ack		(cic_st_ack[6]),
	.cic_st_dequeue		(cic_st_dequeue[6]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[6]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[6]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[6]),
	.sbs_stb_wptr_m		(sbs6_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs6_stb_rptr[2:0]),
	.sbs_state_vld		(sbs6_state_vld[7:0]),
	.sbs_state_ced		(sbs6_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[6]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[6]),
	.sbs_all_commited	(sbs_all_commited[6]),
	.sbs_stb_empty		(sbs_stb_empty[6]),
	.lsu_stb_empty		(lsu_stb_empty[6]),
	.sbs_stb_full		(sbs_stb_full[6]),
	.sbs_bst_req		(sbs_bst_req[6]),
	.sbc_bst_sel		(sbc_bst_sel[6]),
	.sbc_st_addr_new	(sbc_st_addr_new[6]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[6]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[6]),
	.sbs_sync		(lsu_trap_flush[6]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[6]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[6]),
	.sbs_st_type		(sbs6_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[6]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[6]),
	.lsu_block_store_kill	(lsu_block_store_kill[6]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[6]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[6]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[6]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbs_ctl sbs7 (
	.scan_in(sbs7_scanin),
	.scan_out(sbs7_scanout),
	.l2clk(l2clk),
	.tlb_tte_ie_b		(tlb_tte_ie_b_rep00),
	.sbc_cam_wvld_m		(sbc_cam_wvld_m[7]),
	.sbc_st_sel_p3		(sbc_st_sel_p3[7]),
	.sbc_bst_b		(lsu_block_store_b[7]),
	.cic_st_ack		(cic_st_ack[7]),
	.cic_st_dequeue		(cic_st_dequeue[7]),
	.cic_rmo_dequeue	(cic_rmo_dequeue[7]),
	.dcc_sync_inst_w	(dcc_sync_inst_w[7]),
	.dcc_asi_rtn_vld	(dcc_asi_rtn_vld[7]),
	.sbs_stb_wptr_m		(sbs7_stb_wptr_m[2:0]),
	.sbs_stb_rptr		(sbs7_stb_rptr[2:0]),
	.sbs_state_vld		(sbs7_state_vld[7:0]),
	.sbs_state_ced		(sbs7_state_ced[7:0]),
	.sbs_state_asi_rngf	(sbs_state_asi_rngf[7]),
	.sbs_pcx_pst_ie_p4	(sbs_pcx_pst_ie_p4[7]),
	.sbs_all_commited	(sbs_all_commited[7]),
	.sbs_stb_empty		(sbs_stb_empty[7]),
	.lsu_stb_empty		(lsu_stb_empty[7]),
	.sbs_stb_full		(sbs_stb_full[7]),
	.sbs_bst_req		(sbs_bst_req[7]),
	.sbc_bst_sel		(sbc_bst_sel[7]),
	.sbc_st_addr_new	(sbc_st_addr_new[7]),
	.sbs_asi_indet_req	(sbs_asi_indet_req[7]),
	.sbs_asi_indet_retire	(sbs_asi_indet_retire[7]),
	.sbs_sync		(lsu_trap_flush[7]),
	.sbs_rmo_st_p4		(sbs_rmo_st_p4[7]),
	.sbs_blk_st_p4		(sbs_blk_st_p4[7]),
	.sbs_st_type		(sbs7_st_type[1:0]),
	.lsu_stb_alloc		(lsu_stb_alloc[7]),
	.lsu_stb_dealloc	(lsu_stb_dealloc[7]),
	.lsu_block_store_kill	(lsu_block_store_kill[7]),
	.sbs_asi_rq_vld		(sbs_asi_rq_vld[7]),
	.sbs_atm_rq_vld		(sbs_atm_rq_vld[7]),
	.sbs_pcx_rq_vld		(sbs_pcx_rq_vld[7]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .spd_st_line_match(spd_st_line_match),
  .dcc_asi_store_b(dcc_asi_store_b),
  .dcc_asi_iomap_b(dcc_asi_iomap_b),
  .dcc_asi_rngf_b(dcc_asi_rngf_b),
  .dcc_asi_indet_b(dcc_asi_indet_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_pst_asi_b(dcc_pst_asi_b),
  .dcc_st_rq_type_w(dcc_st_rq_type_w[1:0]),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .pic_st_sel_p3(pic_st_sel_p3),
  .dcc_asi_rtn_excp(dcc_asi_rtn_excp),
  .dcc_asi_rtn_rd(dcc_asi_rtn_rd),
  .lsu_lsu_pmen_(lsu_lsu_pmen_)
);

lsu_sbc_ctl sbc (
	.scan_in(sbc_scanin),
	.scan_out(sbc_scanout),
	.l2clk		(l2clk),
	.tlb_pgnum_b39			(tlb_pgnum[39]),
	.tlb_tte_ie_b			(tlb_tte_ie_b_rep00),
	.stb_cam_hit			(stb_cam_hit_rep0),
	.lsu_asi_error_inject_b17	(lsu_asi_error_inject[17]),
	.lsu_asi_error_inject_b19	(lsu_asi_error_inject[19]),
	.lsu_asi_error_inject_b31	(lsu_asi_error_inject[31]),
	.stb_cam_addr_b39		(stb_cam_data_rep0[44]),
	.stb_cam_data			(stb_cam_data_rep0[7:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .dec_st_inst_e(dec_st_inst_e),
  .dec_fpldst_inst_e(dec_fpldst_inst_e),
  .dec_flush_lm(dec_flush_lm),
  .dec_flush_lb(dec_flush_lb),
  .dec_frf_r2_addr_e(dec_frf_r2_addr_e[4:3]),
  .dcc_lendian_pre_m(dcc_lendian_pre_m),
  .dcc_tte_vld_m(dcc_tte_vld_m),
  .dcc_ldst_sz_m(dcc_ldst_sz_m[1:0]),
  .dcc_tid_e(dcc_tid_e[2:0]),
  .dcc_blk_inst_m(dcc_blk_inst_m),
  .dcc_std_inst_m(dcc_std_inst_m),
  .dcc_asi_load_m(dcc_asi_load_m),
  .dcc_binit_st_b(dcc_binit_st_b),
  .dcc_casa_inst_b(dcc_casa_inst_b),
  .dcc_exception_flush_b(dcc_exception_flush_b),
  .dcc_priv_b(dcc_priv_b),
  .dcc_hpriv_b(dcc_hpriv_b),
  .dcc_stb_diag_rd_m(dcc_stb_diag_rd_m),
  .dcc_wr_error_inj_m(dcc_wr_error_inj_m),
  .dcc_sync_pipe_w(dcc_sync_pipe_w),
  .lsu_va_b(lsu_va_b[5:3]),
  .lsu_asi_error_inject(lsu_asi_error_inject[6:0]),
  .lsu_lsu_pmen(lsu_lsu_pmen),
  .tlu_flush_lsu_b(tlu_flush_lsu_b),
  .tlu_cerer_sbdpc(tlu_cerer_sbdpc),
  .tlu_cerer_sbdpu(tlu_cerer_sbdpu),
  .tlu_cerer_sbapp(tlu_cerer_sbapp),
  .tlu_cerer_sbdiou(tlu_cerer_sbdiou),
  .sbs0_stb_wptr_m(sbs0_stb_wptr_m[2:0]),
  .sbs1_stb_wptr_m(sbs1_stb_wptr_m[2:0]),
  .sbs2_stb_wptr_m(sbs2_stb_wptr_m[2:0]),
  .sbs3_stb_wptr_m(sbs3_stb_wptr_m[2:0]),
  .sbs4_stb_wptr_m(sbs4_stb_wptr_m[2:0]),
  .sbs5_stb_wptr_m(sbs5_stb_wptr_m[2:0]),
  .sbs6_stb_wptr_m(sbs6_stb_wptr_m[2:0]),
  .sbs7_stb_wptr_m(sbs7_stb_wptr_m[2:0]),
  .sbs0_stb_rptr(sbs0_stb_rptr[2:0]),
  .sbs1_stb_rptr(sbs1_stb_rptr[2:0]),
  .sbs2_stb_rptr(sbs2_stb_rptr[2:0]),
  .sbs3_stb_rptr(sbs3_stb_rptr[2:0]),
  .sbs4_stb_rptr(sbs4_stb_rptr[2:0]),
  .sbs5_stb_rptr(sbs5_stb_rptr[2:0]),
  .sbs6_stb_rptr(sbs6_stb_rptr[2:0]),
  .sbs7_stb_rptr(sbs7_stb_rptr[2:0]),
  .sbs_pcx_rq_vld(sbs_pcx_rq_vld[7:0]),
  .sbs_atm_rq_vld(sbs_atm_rq_vld[7:0]),
  .sbs_asi_rq_vld(sbs_asi_rq_vld[7:0]),
  .sbs0_state_vld(sbs0_state_vld[7:0]),
  .sbs1_state_vld(sbs1_state_vld[7:0]),
  .sbs2_state_vld(sbs2_state_vld[7:0]),
  .sbs3_state_vld(sbs3_state_vld[7:0]),
  .sbs4_state_vld(sbs4_state_vld[7:0]),
  .sbs5_state_vld(sbs5_state_vld[7:0]),
  .sbs6_state_vld(sbs6_state_vld[7:0]),
  .sbs7_state_vld(sbs7_state_vld[7:0]),
  .sbs0_state_ced(sbs0_state_ced[7:0]),
  .sbs1_state_ced(sbs1_state_ced[7:0]),
  .sbs2_state_ced(sbs2_state_ced[7:0]),
  .sbs3_state_ced(sbs3_state_ced[7:0]),
  .sbs4_state_ced(sbs4_state_ced[7:0]),
  .sbs5_state_ced(sbs5_state_ced[7:0]),
  .sbs6_state_ced(sbs6_state_ced[7:0]),
  .sbs7_state_ced(sbs7_state_ced[7:0]),
  .sbs0_st_type(sbs0_st_type[1:0]),
  .sbs1_st_type(sbs1_st_type[1:0]),
  .sbs2_st_type(sbs2_st_type[1:0]),
  .sbs3_st_type(sbs3_st_type[1:0]),
  .sbs4_st_type(sbs4_st_type[1:0]),
  .sbs5_st_type(sbs5_st_type[1:0]),
  .sbs6_st_type(sbs6_st_type[1:0]),
  .sbs7_st_type(sbs7_st_type[1:0]),
  .sbs_state_asi_rngf(sbs_state_asi_rngf[7:0]),
  .sbs_pcx_pst_ie_p4(sbs_pcx_pst_ie_p4[7:0]),
  .sbs_bst_req(sbs_bst_req[7:0]),
  .sbs_asi_indet_req(sbs_asi_indet_req[7:0]),
  .sbs_asi_indet_retire(sbs_asi_indet_retire[7:0]),
  .sbs_rmo_st_p4(sbs_rmo_st_p4[7:0]),
  .sbs_blk_st_p4(sbs_blk_st_p4[7:0]),
  .sbs_stb_empty(sbs_stb_empty[7:0]),
  .stb_cam_mhit(stb_cam_mhit),
  .stb_ld_part_raw(stb_ld_part_raw),
  .stb_cam_hit_ptr(stb_cam_hit_ptr[2:0]),
  .stb_cecc_err(stb_cecc_err),
  .stb_uecc_err(stb_uecc_err),
  .stb_ram_ctl(stb_ram_ctl[2:0]),
  .stb_cam_perr(stb_cam_perr),
  .lmd_asi_asi(lmd_asi_asi[7:0]),
  .lmd_asi_type(lmd_asi_type[1:0]),
  .lmc_ld_inst_w(lmc_ld_inst_w),
  .lmc_asi_indet_retire(lmc_asi_indet_retire),
  .pic_st_pcx_sel_p3(pic_st_pcx_sel_p3),
  .pic_st_asi_sel_p3(pic_st_asi_sel_p3),
  .pic_asi_sel_p4(pic_asi_sel_p4),
  .tlb_cam_mhit(tlb_cam_mhit),
  .fgu_fst_ecc_error_fx2(fgu_fst_ecc_error_fx2),
  .sed_bist_cmp_0(sed_bist_cmp_0),
  .sed_bist_cmp_1(sed_bist_cmp_1),
  .sed_bist_cmp_2(sed_bist_cmp_2),
  .sed_bist_cmp_3(sed_bist_cmp_3),
  .lbist_run(lbist_run),
  .mbi_run(mbi_run),
  .mbi_addr(mbi_addr[5:0]),
  .mbi_wdata(mbi_wdata[2:0]),
  .mbi_stb_cam_read_en(mbi_stb_cam_read_en),
  .mbi_stb_cam_write_en(mbi_stb_cam_write_en),
  .mbi_stb_ram_read_en(mbi_stb_ram_read_en),
  .mbi_stb_ram_write_en(mbi_stb_ram_write_en),
  .bist_srm_rd_1(bist_srm_rd_1),
  .bist_scm_rd_1(bist_scm_rd_1),
  .sbc_thread_b(sbc_thread_b[7:0]),
  .sbc_st_int_sel_m(sbc_st_int_sel_m),
  .sbc_std_le_m(sbc_std_le_m),
  .sbc_st_le_if_ie_m(sbc_st_le_if_ie_m),
  .sbc_st_le_not_ie_m(sbc_st_le_not_ie_m),
  .sbc_st_sz_m(sbc_st_sz_m[1:0]),
  .sbc_inv_addr_prty(sbc_inv_addr_prty),
  .sbc_inv_ecc(sbc_inv_ecc[6:0]),
  .sbc_stb_ctl_data(sbc_stb_ctl_data[2:0]),
  .sbc_twocycle_inst_w(sbc_twocycle_inst_w),
  .sbc_tte_vld_b(sbc_tte_vld_b),
  .sbc_cam_wvld_m(sbc_cam_wvld_m[7:0]),
  .sbc_cam_wptr_vld_m(sbc_cam_wptr_vld_m),
  .sbc_cam_rptr_vld(sbc_cam_rptr_vld),
  .sbc_cam_rwptr(sbc_cam_rwptr[5:0]),
  .sbc_cam_line_en_m(sbc_cam_line_en_m[7:0]),
  .sbc_ram_wptr_vld_b(sbc_ram_wptr_vld_b),
  .sbc_ram_rptr_vld(sbc_ram_rptr_vld),
  .sbc_ram_wptr(sbc_ram_wptr[5:0]),
  .sbc_ram_rptr(sbc_ram_rptr[5:0]),
  .sbc_cam_tid(sbc_cam_tid[2:0]),
  .sbc_diag_wptr_w3(sbc_diag_wptr_w3[2:0]),
  .sbc_st_rq_p2(sbc_st_rq_p2),
  .sbc_st_atomic_p2(sbc_st_atomic_p2),
  .sbc_pcx_rq_p3(sbc_pcx_rq_p3),
  .sbc_asi_rq_p3(sbc_asi_rq_p3),
  .sbc_st_sel_p3(sbc_st_sel_p3[7:0]),
  .sbc_bst_sel(sbc_bst_sel[7:0]),
  .sbc_st_sel_tid_p4(sbc_st_sel_tid_p4[2:0]),
  .sbc_st_pcx_nc(sbc_st_pcx_nc),
  .sbc_pcx_bmask(sbc_pcx_bmask[7:0]),
  .sbc_pcx_addr(sbc_pcx_addr[2:0]),
  .sbc_pcx_rmo_st(sbc_pcx_rmo_st),
  .sbc_pcx_blk_st(sbc_pcx_blk_st),
  .sbc_st_asi_fs(sbc_st_asi_fs),
  .sbc_st_addr_new(sbc_st_addr_new[7:0]),
  .sbc_spd_clken(sbc_spd_clken),
  .sbc_ramout_clken(sbc_ramout_clken),
  .sbc_tidb_eq_tidw(sbc_tidb_eq_tidw),
  .sbc_tid_m(sbc_tid_m[2:0]),
  .sbc_st_atom_p3(sbc_st_atom_p3[7:0]),
  .sbc_load_bst_addr(sbc_load_bst_addr),
  .sbc_bst_in_prog_m(sbc_bst_in_prog_m),
  .sbc_bst_in_prog_b(sbc_bst_in_prog_b),
  .sbc_bst_offset(sbc_bst_offset[2:0]),
  .sbc_rmo_st_b(sbc_rmo_st_b),
  .sbc_rawp_rst(sbc_rawp_rst[7:0]),
  .sbc_fgu_ecc_b(sbc_fgu_ecc_b),
  .sbc_bst_rd_err(sbc_bst_rd_err),
  .sbc_pid_kill_store_p4_(sbc_pid_kill_store_p4_),
  .sbc_pic_kill_store_p4_(sbc_pic_kill_store_p4_),
  .sbc_sbs_kill_store_p4_(sbc_sbs_kill_store_p4_),
  .sbc_force_inv(sbc_force_inv),
  .sbc_st_type_p4(sbc_st_type_p4[2:0]),
  .sbc_blk_inst_b(sbc_blk_inst_b),
  .sbc_indet_block_p3(sbc_indet_block_p3),
  .lsu_block_store_stall(lsu_block_store_stall),
  .lsu_block_store_rd(lsu_block_store_rd[4:3]),
  .lsu_block_store_tid(lsu_block_store_tid[2:0]),
  .lsu_block_store_alloc(lsu_block_store_alloc[7:0]),
  .lsu_block_store_b(lsu_block_store_b[7:0]),
  .lsu_block_store_m(lsu_block_store_m),
  .lsu_sbdpc_err_g(lsu_sbdpc_err_g),
  .lsu_sbdpu_err_g(lsu_sbdpu_err_g),
  .lsu_sbapp_err_g(lsu_sbapp_err_g),
  .lsu_sbdiou_err_g(lsu_sbdiou_err_g),
  .lsu_stberr_index_g(lsu_stberr_index_g[2:0]),
  .lsu_stberr_priv_g(lsu_stberr_priv_g[1:0]),
  .lsu_stb_flush_g(lsu_stb_flush_g),
  .lsu_frf_read_pending(lsu_frf_read_pending),
  .sbc_mbi_run(sbc_mbi_run),
  .lsu_mbi_stb_cam_fail(lsu_mbi_stb_cam_fail),
  .lsu_mbi_stb_ram_fail(lsu_mbi_stb_ram_fail),
  .lsu_mbi_scm_hit(lsu_mbi_scm_hit),
  .lsu_mbi_scm_mhit(lsu_mbi_scm_mhit),
  .lsu_mbi_scm_hit_ptr(lsu_mbi_scm_hit_ptr[2:0]),
  .lsu_mbi_scm_praw(lsu_mbi_scm_praw)
);

lsu_spd_dp spd (
.scan_in(spd_scanin),
.scan_out(spd_scanout),
.l2clk(l2clk),
  .sbd_st_addr_b(sbd_st_addr_b[39:3]),
  .sbc_st_addr_new(sbc_st_addr_new[7:0]),
  .sbc_thread_b(sbc_thread_b[7:0]),
  .sbc_spd_clken(sbc_spd_clken),
  .sbc_tidb_eq_tidw(sbc_tidb_eq_tidw),
  .sbc_inv_addr_prty(sbc_inv_addr_prty),
  .sbc_cam_line_en_m(sbc_cam_line_en_m[7:0]),
  .stb_cam_data(stb_cam_data[44:0]),
  .stb_ram_cparity(stb_ram_cparity),
  .dcc_bmask_parity_b(dcc_bmask_parity_b),
  .spd_st_line_match(spd_st_line_match),
  .stb_cam_perr(stb_cam_perr),
  .stb_cparity_calc(stb_cparity_calc),
  .stb_cam_line_en_b(stb_cam_line_en_b[7:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

lsu_sec_ctl sec (
	.scan_in(sec_scanin),
	.scan_out(sec_scanout),
	.l2clk		(l2clk),
	.corr_bit	(sec_corr_bit[63:0]),
	.cecc_err	(stb_cecc_err),
	.uecc_err	(stb_uecc_err),
	.mbi_wdata_b3	(mbi_wdata[3]),
  .sed_c1_lo(sed_c1_lo[1:0]),
  .sed_c1_hi(sed_c1_hi[1:0]),
  .sed_c2_lo(sed_c2_lo[1:0]),
  .sed_c2_hi(sed_c2_hi[1:0]),
  .sed_c4_lo(sed_c4_lo[1:0]),
  .sed_c4_hi(sed_c4_hi[1:0]),
  .sed_c8_lo(sed_c8_lo[1:0]),
  .sed_c8_hi(sed_c8_hi[1:0]),
  .sed_c16_lo(sed_c16_lo[1:0]),
  .sed_c16_hi(sed_c16_hi[1:0]),
  .sed_cf_lo(sed_cf_lo[2:0]),
  .sed_cf_hi(sed_cf_hi[2:0]),
  .sed_c32_hi(sed_c32_hi),
  .sed_c32_lo(sed_c32_lo),
  .sbc_twocycle_inst_w(sbc_twocycle_inst_w),
  .stb_cparity_calc(stb_cparity_calc),
  .sbc_st_sz_m(sbc_st_sz_m[1:0]),
  .sbc_std_le_m(sbc_std_le_m),
  .sbc_st_le_if_ie_m(sbc_st_le_if_ie_m),
  .sbc_st_le_not_ie_m(sbc_st_le_not_ie_m),
  .sbc_spd_clken(sbc_spd_clken),
  .mbi_run(mbi_run),
  .stb_cparity(stb_cparity),
  .sec_st_sz_dw_std_le_b(sec_st_sz_dw_std_le_b),
  .sec_st_sz_dw_le_not_ie_b(sec_st_sz_dw_le_not_ie_b),
  .sec_st_sz_dw_be_not_ie_b(sec_st_sz_dw_be_not_ie_b),
  .sec_st_sz_word_le_not_ie_b(sec_st_sz_word_le_not_ie_b),
  .sec_st_sz_word_be_not_ie_b(sec_st_sz_word_be_not_ie_b),
  .sec_st_sz_hw_le_not_ie_b(sec_st_sz_hw_le_not_ie_b),
  .sec_st_sz_hw_be_not_ie_b(sec_st_sz_hw_be_not_ie_b),
  .sec_st_sz_dw_le_if_ie_b(sec_st_sz_dw_le_if_ie_b),
  .sec_st_sz_dw_be_if_ie_b(sec_st_sz_dw_be_if_ie_b),
  .sec_st_sz_word_le_if_ie_b(sec_st_sz_word_le_if_ie_b),
  .sec_st_sz_word_be_if_ie_b(sec_st_sz_word_be_if_ie_b),
  .sec_st_sz_hw_le_if_ie_b(sec_st_sz_hw_le_if_ie_b),
  .sec_st_sz_hw_be_if_ie_b(sec_st_sz_hw_be_if_ie_b),
  .sec_st_sz_byte_b(sec_st_sz_byte_b),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

lsu_sed_dp sed (
	.scan_in(sed_scanin),
	.scan_out(sed_scanout),
	.l2clk			(l2clk),
	.bist_cmp_data		(bist_cmp_data_rep0[7:0]),
	.stb_cam_data		(stb_cam_data_rep0[44:0]),
	.mbi_run		(sbc_mbi_run),
  .sbc_ramout_clken(sbc_ramout_clken),
  .sbc_diag_wptr_w3(sbc_diag_wptr_w3[2:0]),
  .sbc_inv_ecc(sbc_inv_ecc[6:0]),
  .stb_ram_rd_data(stb_ram_rd_data[63:0]),
  .sec_corr_bit(sec_corr_bit[63:0]),
  .stb_ram_rd_ecc(stb_ram_rd_ecc[13:0]),
  .stb_ram_rd_cparity(stb_ram_rd_cparity),
  .stb_ram_rd_ctl(stb_ram_rd_ctl[2:0]),
  .sbd_st_data_b(sbd_st_data_b[63:0]),
  .dcc_stb_data_rd_w3(dcc_stb_data_rd_w3),
  .dcc_stb_ecc_rd_w3(dcc_stb_ecc_rd_w3),
  .dcc_stb_ctl_rd_w3(dcc_stb_ctl_rd_w3),
  .dcc_stb_addr_sel_w3(dcc_stb_addr_sel_w3),
  .dcc_stb_ptr_rd_w3(dcc_stb_ptr_rd_w3),
  .mbi_wdata(mbi_wdata[7:0]),
  .stb_ram_data(stb_ram_data[63:0]),
  .stb_ram_data_corr(stb_ram_data_corr[63:0]),
  .stb_ram_ctl(stb_ram_ctl[2:0]),
  .stb_ram_cparity(stb_ram_cparity),
  .sed_ecc_b(sed_ecc_b[13:0]),
  .sed_c1_lo(sed_c1_lo[1:0]),
  .sed_c1_hi(sed_c1_hi[1:0]),
  .sed_c2_lo(sed_c2_lo[1:0]),
  .sed_c2_hi(sed_c2_hi[1:0]),
  .sed_c4_lo(sed_c4_lo[1:0]),
  .sed_c4_hi(sed_c4_hi[1:0]),
  .sed_c8_lo(sed_c8_lo[1:0]),
  .sed_c8_hi(sed_c8_hi[1:0]),
  .sed_c16_lo(sed_c16_lo[1:0]),
  .sed_c16_hi(sed_c16_hi[1:0]),
  .sed_cf_lo(sed_cf_lo[2:0]),
  .sed_cf_hi(sed_cf_hi[2:0]),
  .sed_c32_hi(sed_c32_hi),
  .sed_c32_lo(sed_c32_lo),
  .stb_ldxa_asi_data_w(stb_ldxa_asi_data_w[63:0]),
  .sed_bist_cmp_0(sed_bist_cmp_0),
  .sed_bist_cmp_1(sed_bist_cmp_1),
  .sed_bist_cmp_2(sed_bist_cmp_2),
  .sed_bist_cmp_3(sed_bist_cmp_3),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

lsu_sbd_dp sbd (
	.scan_in(sbd_scanin),
	.scan_out(sbd_scanout),
	.l2clk			(l2clk),
	.exu_lsu_store_data_e	(exu_lsu_store_data_e_rep0[63:0]),
	.mbi_run		(sbc_mbi_run),
  .const_cpuid(const_cpuid[2:0]),
  .lsu_va_m(lsu_va_m[47:3]),
  .fgu_lsu_fst_data_fx1(fgu_lsu_fst_data_fx1[63:0]),
  .tlb_pgnum_crit(tlb_pgnum_crit[39:13]),
  .tlb_tte_ie_b(tlb_tte_ie_b),
  .sbc_st_int_sel_m(sbc_st_int_sel_m),
  .sbc_bst_offset(sbc_bst_offset[2:0]),
  .sbc_bst_in_prog_m(sbc_bst_in_prog_m),
  .sbc_load_bst_addr(sbc_load_bst_addr),
  .sec_st_sz_dw_std_le_b(sec_st_sz_dw_std_le_b),
  .sec_st_sz_dw_le_not_ie_b(sec_st_sz_dw_le_not_ie_b),
  .sec_st_sz_dw_be_not_ie_b(sec_st_sz_dw_be_not_ie_b),
  .sec_st_sz_word_le_not_ie_b(sec_st_sz_word_le_not_ie_b),
  .sec_st_sz_word_be_not_ie_b(sec_st_sz_word_be_not_ie_b),
  .sec_st_sz_hw_le_not_ie_b(sec_st_sz_hw_le_not_ie_b),
  .sec_st_sz_hw_be_not_ie_b(sec_st_sz_hw_be_not_ie_b),
  .sec_st_sz_dw_le_if_ie_b(sec_st_sz_dw_le_if_ie_b),
  .sec_st_sz_dw_be_if_ie_b(sec_st_sz_dw_be_if_ie_b),
  .sec_st_sz_word_le_if_ie_b(sec_st_sz_word_le_if_ie_b),
  .sec_st_sz_word_be_if_ie_b(sec_st_sz_word_be_if_ie_b),
  .sec_st_sz_hw_le_if_ie_b(sec_st_sz_hw_le_if_ie_b),
  .sec_st_sz_hw_be_if_ie_b(sec_st_sz_hw_be_if_ie_b),
  .sec_st_sz_byte_b(sec_st_sz_byte_b),
  .dcc_tid_m(dcc_tid_m[2:0]),
  .dcc_asi_m(dcc_asi_m[7:0]),
  .dcc_sbd_e_clken(dcc_sbd_e_clken),
  .dcc_sbd_m_clken(dcc_sbd_m_clken),
  .dcc_std_inst_m(dcc_std_inst_m),
  .dcc_fp32b_sel_m(dcc_fp32b_sel_m),
  .dcc_asi_iomap_m(dcc_asi_iomap_m),
  .dcc_cache_diag_wr_m(dcc_cache_diag_wr_m),
  .dcc_demap_asi_m(dcc_demap_asi_m),
  .dcc_ldstub_inst_m(dcc_ldstub_inst_m),
  .stb_cam_data(stb_cam_data[44:11]),
  .dcs_memref_m(dcs_memref_m),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_ptag_data(mbi_ptag_data),
  .mbi_init_to_zero(mbi_init_to_zero),
  .mbi_cambist_shift(mbi_cambist_shift),
  .sbd_st_data_b(sbd_st_data_b[63:0]),
  .sbd_st_data2_b(sbd_st_data2_b[63:0]),
  .sbd_st_datab_b(sbd_st_datab_b[63:0]),
  .sbd_st_predata_b(sbd_st_predata_b[47:0]),
  .sbd_st_addr_b(sbd_st_addr_b[39:3]),
  .stb_st_addr_m(stb_st_addr_m[39:3]),
  .stb_st_addr_b(stb_st_addr_b[39:13]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

n2_stb_cm_64x45_cust stb_cam (
	.stb_camwr_data		({stb_st_addr_m[39:3],dcc_ldst_bmask[7:0]}),
	.stb_cam_vld		(dcc_stb_cam_vld_m),
	.stb_cam_cm_tid		(sbc_cam_tid[2:0]),
	.stb_cam_line_en	(stb_cam_line_en_b[7:0]),
	.stb_cam_rw_ptr		(sbc_cam_rwptr[2:0]),
	.stb_cam_wptr_vld	(sbc_cam_wptr_vld_m),
	.stb_cam_rptr_vld	(sbc_cam_rptr_vld),
	.stb_cam_rw_tid		(sbc_cam_rwptr[5:3]),
	.stb_quad_ld_cam	(dcc_stb_quad_ld_cam),
	.scan_in(stb_cam_scanin),
	.scan_out(stb_cam_scanout),
	.l2clk			(l2clk),
	.stb_rdata_ramc		(stb_cam_data[44:0]),
	.stb_ld_partial_raw	(stb_ld_part_raw),
	.stb_cam_hit_ptr	(stb_cam_hit_ptr[2:0]),
	.stb_cam_hit		(stb_cam_hit),
	.stb_cam_mhit		(stb_cam_mhit),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .pce(pce)
);

n2_com_dp_64x84_cust stb_ram (
	.rd_adr	(sbc_ram_rptr[5:0]),
	.rd_en	(sbc_ram_rptr_vld),
	.wr_en	(sbc_ram_wptr_vld_b),
	.wr_adr	(sbc_ram_wptr[5:0]),
	.din	(stb_ram_din[83:0]),
	.scan_in(stb_ram_scanin),
	.scan_out(stb_ram_scanout),
	.rdclk	(l2clk),
	.wrclk	(l2clk),
	.dout	(stb_ram_dout[83:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .bist_clk_mux_sel(bist_clk_mux_sel),
  .rd_pce(rd_pce),
  .wr_pce(wr_pce)
);

// Reorder nets for physical layout (array pins go from LSB to MSB left to right)
assign stb_ram_din[83:0] = {
 sbd_st_datab_b[0], sbd_st_datab_b[32], sbd_st_datab_b[1], sbd_st_datab_b[33],
 sbd_st_datab_b[2], sbd_st_datab_b[34], sbd_st_datab_b[3], sbd_st_datab_b[35],
 sbd_st_datab_b[4], sbd_st_datab_b[36], sbd_st_datab_b[5], sbd_st_datab_b[37],
 sbd_st_datab_b[6], sbd_st_datab_b[38], sbd_st_datab_b[7], sbd_st_datab_b[39],
 sbd_st_datab_b[8], sbd_st_datab_b[40], sbd_st_datab_b[9], sbd_st_datab_b[41],
 sbd_st_datab_b[10], sbd_st_datab_b[42], sbd_st_datab_b[11], sbd_st_datab_b[43],
 sbd_st_datab_b[12], sbd_st_datab_b[44], sbd_st_datab_b[13], sbd_st_datab_b[45],
 sbd_st_datab_b[14], sbd_st_datab_b[46], sbd_st_datab_b[15], sbd_st_datab_b[47],
 2'b00,
 sed_ecc_b[0], sed_ecc_b[7], sed_ecc_b[1], sed_ecc_b[8], sed_ecc_b[2], sed_ecc_b[9],
 sed_ecc_b[3], sed_ecc_b[10], sed_ecc_b[4], sed_ecc_b[11], sed_ecc_b[5], sed_ecc_b[12],
 sed_ecc_b[6], sed_ecc_b[13],
 sbd_st_datab_b[16], sbd_st_datab_b[48], sbd_st_datab_b[17], sbd_st_datab_b[49],
 sbd_st_datab_b[18], sbd_st_datab_b[50], sbd_st_datab_b[19], sbd_st_datab_b[51],
 sbd_st_datab_b[20], sbd_st_datab_b[52], sbd_st_datab_b[21], sbd_st_datab_b[53],
 sbd_st_datab_b[22], sbd_st_datab_b[54], sbd_st_datab_b[23], sbd_st_datab_b[55],
 sbd_st_datab_b[24], sbd_st_datab_b[56], sbd_st_datab_b[25], sbd_st_datab_b[57],
 sbd_st_datab_b[26], sbd_st_datab_b[58], sbd_st_datab_b[27], sbd_st_datab_b[59],
 sbd_st_datab_b[28], sbd_st_datab_b[60], sbd_st_datab_b[29], sbd_st_datab_b[61],
 sbd_st_datab_b[30], sbd_st_datab_b[62], sbd_st_datab_b[31], sbd_st_datab_b[63],
 sbc_stb_ctl_data[0], sbc_stb_ctl_data[2], sbc_stb_ctl_data[1], stb_cparity
};

assign {
 stb_ram_rd_data[0], stb_ram_rd_data[32], stb_ram_rd_data[1], stb_ram_rd_data[33],
 stb_ram_rd_data[2], stb_ram_rd_data[34], stb_ram_rd_data[3], stb_ram_rd_data[35],
 stb_ram_rd_data[4], stb_ram_rd_data[36], stb_ram_rd_data[5], stb_ram_rd_data[37],
 stb_ram_rd_data[6], stb_ram_rd_data[38], stb_ram_rd_data[7], stb_ram_rd_data[39],
 stb_ram_rd_data[8], stb_ram_rd_data[40], stb_ram_rd_data[9], stb_ram_rd_data[41],
 stb_ram_rd_data[10], stb_ram_rd_data[42], stb_ram_rd_data[11], stb_ram_rd_data[43],
 stb_ram_rd_data[12], stb_ram_rd_data[44], stb_ram_rd_data[13], stb_ram_rd_data[45],
 stb_ram_rd_data[14], stb_ram_rd_data[46], stb_ram_rd_data[15], stb_ram_rd_data[47],
 stb_ram_unused[1:0],
 stb_ram_rd_ecc[0], stb_ram_rd_ecc[7], stb_ram_rd_ecc[1], stb_ram_rd_ecc[8],
 stb_ram_rd_ecc[2], stb_ram_rd_ecc[9], stb_ram_rd_ecc[3], stb_ram_rd_ecc[10],
 stb_ram_rd_ecc[4], stb_ram_rd_ecc[11], stb_ram_rd_ecc[5], stb_ram_rd_ecc[12],
 stb_ram_rd_ecc[6], stb_ram_rd_ecc[13],
 stb_ram_rd_data[16], stb_ram_rd_data[48], stb_ram_rd_data[17], stb_ram_rd_data[49],
 stb_ram_rd_data[18], stb_ram_rd_data[50], stb_ram_rd_data[19], stb_ram_rd_data[51],
 stb_ram_rd_data[20], stb_ram_rd_data[52], stb_ram_rd_data[21], stb_ram_rd_data[53],
 stb_ram_rd_data[22], stb_ram_rd_data[54], stb_ram_rd_data[23], stb_ram_rd_data[55],
 stb_ram_rd_data[24], stb_ram_rd_data[56], stb_ram_rd_data[25], stb_ram_rd_data[57],
 stb_ram_rd_data[26], stb_ram_rd_data[58], stb_ram_rd_data[27], stb_ram_rd_data[59],
 stb_ram_rd_data[28], stb_ram_rd_data[60], stb_ram_rd_data[29], stb_ram_rd_data[61],
 stb_ram_rd_data[30], stb_ram_rd_data[62], stb_ram_rd_data[31], stb_ram_rd_data[63],
 stb_ram_rd_ctl[0], stb_ram_rd_ctl[2], stb_ram_rd_ctl[1], stb_ram_rd_cparity
} = stb_ram_dout[83:0];

assign dta_clken = dcc_dta_clken;

n2_dta_sp_1920b_cust dta (
	.rdtag_w0_y	(dta_rdata_w0_m[29:0]),
	.rdtag_w1_y	(dta_rdata_w1_m[29:0]),
	.rdtag_w2_y	(dta_rdata_w2_m[29:0]),
	.rdtag_w3_y	(dta_rdata_w3_m[29:0]),
	.scan_in(dta_scanin),
	.scan_out(dta_scanout),
	.l2clk		(l2clk),
	.index0_x	(exu_lsu_address_e_rep0[10:4]),
	.index1_x	(dcc_dta_fill_addr_e[10:4]),
	.index_sel_x	(dcc_dta_index1_sel_e),
	.wrway_x	(dcc_dta_fill_way_e[1:0]),
	.rdreq_x	(dcc_dta_rvld_e),
	.wrreq_x	(dcc_dta_wvld_e),
	.wrtag_x	({dcc_dta_parity,lmd_fill_addr_e[39:11]}),
  .dta_clken(dta_clken),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_scan_en(tcu_scan_en),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit)
);

n2_dva_dp_32x32_cust dva (
	.dout		({dva_valid2_m[15:0],dva_valid_m[15:0]}),
	.scan_in(dva_scanin),
	.scan_out(dva_scanout),
	.l2clk	(l2clk),
	.rd_addr	(tgc_dva_rd_addr_e[10:6]),
	.rd_en		(dcc_dva_rvld_e),
	.wr_addr	(dcc_dva_wr_addr_e[10:6]),
	.wr_en		(dcc_dva_wvld_e),
	.bit_wen	({2{dcc_dva_bit_wen_e[15:0]}}),
	.din		(tgc_dva_din[31:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_scan_en(tcu_scan_en),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .pce(pce)
);

lsu_tgc_ctl tgc (
	.scan_in(tgc_scanin),
	.scan_out(tgc_scanout),
	.l2clk		(l2clk),
	.lsu_va_b12to11_m	(lsu_va_m[12:11]),
	.exu_lsu_address_e	(exu_lsu_address_e_rep0[10:6]),
  .dva_valid_m(dva_valid_m[15:0]),
  .dva_valid2_m(dva_valid2_m[15:0]),
  .lsu_va_m(lsu_va_m[5:4]),
  .dcc_ld_inst_vld_m(dcc_ld_inst_vld_m),
  .dcc_dva_din_e(dcc_dva_din_e),
  .dcc_dva_din2_e(dcc_dva_din2_e),
  .tgd_bist_compare(tgd_bist_compare),
  .tgc_cache_way_vld_m(tgc_cache_way_vld_m[3:0]),
  .tgc_cache_way_vld2_m(tgc_cache_way_vld2_m[3:0]),
  .tgc_verr_b(tgc_verr_b[3:0]),
  .tgc_way_sel_m(tgc_way_sel_m[1:0]),
  .tgc_dva_rd_addr_e(tgc_dva_rd_addr_e[10:6]),
  .tgc_dva_din(tgc_dva_din[31:0]),
  .lsu_mbi_dva_fail(lsu_mbi_dva_fail),
  .lsu_mbi_dta_fail(lsu_mbi_dta_fail),
  .lsu_mbi_dtb_fail(lsu_mbi_dtb_fail),
  .mbi_run(mbi_run),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_cmpsel(mbi_cmpsel[1:0]),
  .mbi_addr(mbi_addr[8:0]),
  .mbi_dta_read_en(mbi_dta_read_en),
  .mbi_dva_read_en(mbi_dva_read_en),
  .mbi_dtb_read_en(mbi_dtb_read_en),
  .bist_wdata_1(bist_wdata_1[7:0]),
  .bist_cmp_data(bist_cmp_data[7:0]),
  .bist_cmpsel_1(bist_cmpsel_1[1:0]),
  .bist_cmpsel_2(bist_cmpsel_2),
  .bist_addr_1(bist_addr_1[8:5]),
  .bist_dta_cmp_en(bist_dta_cmp_en),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .lsu_lsu_pmen(lsu_lsu_pmen)
);

lsu_tgd_dp tgd (
	.scan_in(tgd_scanin),
	.scan_out(tgd_scanout),
	.l2clk		(l2clk),
  .dta_rdata_w0_m(dta_rdata_w0_m[29:0]),
  .dta_rdata_w1_m(dta_rdata_w1_m[29:0]),
  .dta_rdata_w2_m(dta_rdata_w2_m[29:0]),
  .dta_rdata_w3_m(dta_rdata_w3_m[29:0]),
  .tgc_cache_way_vld_m(tgc_cache_way_vld_m[3:0]),
  .tgc_cache_way_vld2_m(tgc_cache_way_vld2_m[3:0]),
  .tgc_way_sel_m(tgc_way_sel_m[1:0]),
  .dcs_watchpoint_m(dcs_watchpoint_m[47:3]),
  .dcs_context0_e(dcs_context0_e[12:0]),
  .dcs_context1_e(dcs_context1_e[12:0]),
  .dcc_rd_dt_diag_m(dcc_rd_dt_diag_m),
  .dcc_rd_dt_diag_b(dcc_rd_dt_diag_b),
  .dcc_tlb_tag0_read_b(dcc_tlb_tag0_read_b),
  .dcc_tlb_tag1_read_b(dcc_tlb_tag1_read_b),
  .dcc_tlb_data_read_b(dcc_tlb_data_read_b),
  .dcc_ld_inst_vld_m(dcc_ld_inst_vld_m),
  .dcc_ldst_m_clken(dcc_ldst_m_clken),
  .tlb_pgnum(tlb_pgnum[39:13]),
  .tlb_tte_data(tlb_tte_data[37:0]),
  .tlb_tte_tag(tlb_tte_tag[65:0]),
  .tlb_tte_u_bit(tlb_tte_u_bit),
  .tlb_cam_hit(tlb_cam_hit),
  .tlb_context0_hit(tlb_context0_hit),
  .tlb_cam_mhit(tlb_cam_mhit),
  .tld_prty_256m(tld_prty_256m),
  .tld_prty_4m(tld_prty_4m),
  .tld_prty_64k(tld_prty_64k),
  .tld_prty_8k(tld_prty_8k),
  .tld_prty_ctxt0(tld_prty_ctxt0),
  .tld_prty_ctxt1(tld_prty_ctxt1),
  .tld_tag_c0(tld_tag_c0[12:0]),
  .tld_tag_c1(tld_tag_c1[12:0]),
  .tlc_sel_tte_tag(tlc_sel_tte_tag),
  .tlc_sel_demap_tag_c0(tlc_sel_demap_tag_c0),
  .tlc_sel_demap_tag_c1(tlc_sel_demap_tag_c1),
  .bist_cmp_data(bist_cmp_data[7:0]),
  .bist_dta_cmp_en(bist_dta_cmp_en),
  .bist_cmpsel_2(bist_cmpsel_2),
  .lsu_va_m(lsu_va_m[47:3]),
  .tgd_w0_parity_b(tgd_w0_parity_b),
  .tgd_w1_parity_b(tgd_w1_parity_b),
  .tgd_w2_parity_b(tgd_w2_parity_b),
  .tgd_w3_parity_b(tgd_w3_parity_b),
  .dta_rdata_w0_rep(dta_rdata_w0_rep[28:0]),
  .dta_rdata_w1_rep(dta_rdata_w1_rep[28:0]),
  .dta_rdata_w2_rep(dta_rdata_w2_rep[28:0]),
  .dta_rdata_w3_rep(dta_rdata_w3_rep[28:0]),
  .tgd_prty_256m_b(tgd_prty_256m_b),
  .tgd_prty_4m_b(tgd_prty_4m_b),
  .tgd_prty_64k_b(tgd_prty_64k_b),
  .tgd_prty_8k_b(tgd_prty_8k_b),
  .tgd_prty_ctxt0_b(tgd_prty_ctxt0_b),
  .tgd_prty_ctxt1_b(tgd_prty_ctxt1_b),
  .tgd_va_wp_47_16(tgd_va_wp_47_16),
  .tgd_va_wp_15_3(tgd_va_wp_15_3),
  .tgd_pa_wp_39_16(tgd_pa_wp_39_16),
  .tgd_pa_wp_15_3(tgd_pa_wp_15_3),
  .tgd_tag_c0(tgd_tag_c0[12:0]),
  .tgd_tag_c1(tgd_tag_c1[12:0]),
  .tlb_tag_parity(tlb_tag_parity),
  .tlb_pgsize(tlb_pgsize[2:0]),
  .tlb_tte_nfo_b(tlb_tte_nfo_b),
  .tlb_tte_ie_b(tlb_tte_ie_b),
  .tlb_tte_cp_b(tlb_tte_cp_b),
  .tlb_tte_ebit_b(tlb_tte_ebit_b),
  .tlb_tte_pbit_b(tlb_tte_pbit_b),
  .tlb_tte_wbit_b(tlb_tte_wbit_b),
  .tgd_ldxa_asi_data_b(tgd_ldxa_asi_data_b[63:0]),
  .tgd_bist_compare(tgd_bist_compare),
  .lsu_mbi_tlb_data_cmp(lsu_mbi_tlb_data_cmp),
  .lsu_mbi_tlb_cam_hit(lsu_mbi_tlb_cam_hit),
  .lsu_mbi_tlb_cam_mhit(lsu_mbi_tlb_cam_mhit),
  .lsu_mbi_tlb_ctxt0_hit(lsu_mbi_tlb_ctxt0_hit),
  .lsu_mbi_tlb_valid(lsu_mbi_tlb_valid),
  .lsu_mbi_tlb_used(lsu_mbi_tlb_used),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk)
);

assign tte_ubit = tld_ubit;

n2_tlb_tl_128x59_cust tlb (
	.tlb_bypass	(dcc_tlb_bypass),
	.tlb_wr_vld	(tlc_wr_u_en),
	.tlb_rd_vld	(dcc_tlb_rd_e),
	.tlb_rw_index	(tld_rw_index[6:0]),
	.tlb_rw_index_vld(tlc_rw_index_vld),
	.tlb_cam_vld	(dcc_tlb_lookup),
	.tlb_demap	(tlc_demap),
	.tlb_demap_context(tlc_demap_context),
	.tlb_demap_all	(tlc_demap_all),
	.tlb_demap_real	(tlc_demap_real),
	// Separate page size mask from tag proper
	.tte_tag	({tgd_tag_c1[12:0],		// C1
			  tld_tag_pid[2:0],		// PID
			  tld_tag_real,			// REAL
			  exu_lsu_address_e[47:22],	// VA[47:22]
			  tld_tag_valid,			// VALID
			  exu_lsu_address_e[21:13],	// VA[21:13]
			  tgd_tag_c0[12:0]}),		// C0
	.tte_page_size_mask(tld_tag_mask[2:0]),
	.tte_data	(tld_data[37:0]),
	.tlb_va		(exu_lsu_address_e[12:11]),
	.disable_clear_ubit(tlc_dis_clr_ubit),
	.cache_ptag_w0	(dta_rdata_w0_rep[28:0]),
	.cache_ptag_w1	(dta_rdata_w1_rep[28:0]),
	.cache_ptag_w2	(dta_rdata_w2_rep[28:0]),
	.cache_ptag_w3	(dta_rdata_w3_rep[28:0]),
	.cache_set_vld	(tgc_cache_way_vld_m[3:0]),
	.cache_way_hit	(tlb_cache_way_hit_b[3:0]),
	.cache_hit	(tlb_cache_hit_b),
	.scan_in(tlb_scanin),
	.scan_out(tlb_scanout),
	.l2clk		(l2clk),
  .tcu_pce_ov(tcu_pce_ov),
  .pce(pce),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .tcu_scan_en(tcu_scan_en),
  .tte_ubit(tte_ubit),
  .tlb_cam_hit(tlb_cam_hit),
  .tlb_cam_mhit(tlb_cam_mhit),
  .tlb_context0_hit(tlb_context0_hit),
  .tlb_pgnum_crit(tlb_pgnum_crit[39:13]),
  .tlb_pgnum(tlb_pgnum[39:13]),
  .tlb_tte_data(tlb_tte_data[37:0]),
  .tlb_tte_tag(tlb_tte_tag[65:0]),
  .tlb_tte_u_bit(tlb_tte_u_bit),
  .tlb_tte_data_parity(tlb_tte_data_parity)
);

lsu_tld_dp tld (
	.scan_in(tld_scanin),
	.scan_out(tld_scanout),
	.l2clk		(l2clk),
	.default_tag	({dcs_pid_e[2:0],
			  dcc_tlb_real,
			  exu_lsu_address_e[47:22],
			  1'b1,
			  1'b1,			// tag valid
			  exu_lsu_address_e[21:16],
			  1'b1,
			  exu_lsu_address_e[15:13],
			  1'b1
			}),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .exu_lsu_address_e(exu_lsu_address_e[47:0]),
  .tlc_sel_write_tag(tlc_sel_write_tag),
  .tlc_sel_dm_tag(tlc_sel_dm_tag),
  .tlc_sel_wr_dm_bist(tlc_sel_wr_dm_bist),
  .tlc_write_next(tlc_write_next),
  .tlc_tte0_clken(tlc_tte0_clken),
  .tlc_tte1_clken(tlc_tte1_clken),
  .tlc_tag_error_inj(tlc_tag_error_inj),
  .tlc_data_error_inj(tlc_data_error_inj),
  .tlu_tte(tlu_tte[54:0]),
  .tlc_mbi_run(tlc_mbi_run),
  .mbi_wdata(mbi_wdata[7:0]),
  .mbi_addr(mbi_addr[6:0]),
  .mbi_cambist_run(mbi_cambist_run),
  .mbi_cambist_shift(mbi_cambist_shift),
  .mbi_init_to_zero(mbi_init_to_zero),
  .mbi_dtb_write_en(mbi_dtb_write_en),
  .mbi_repl_write(mbi_repl_write),
  .mbi_dis_clr_ubit(mbi_dis_clr_ubit),
  .mbi_dtb_demap_en(mbi_dtb_demap_en),
  .mbi_demap_type(mbi_demap_type[1:0]),
  .tld_mbi_dtb_write_en(tld_mbi_dtb_write_en),
  .tld_mbi_repl_write(tld_mbi_repl_write),
  .tld_mbi_dis_clr_ubit(tld_mbi_dis_clr_ubit),
  .tld_mbi_dtb_demap_en(tld_mbi_dtb_demap_en),
  .tld_mbi_demap_type(tld_mbi_demap_type[1:0]),
  .tgd_tag_c0(tgd_tag_c0[12:0]),
  .tgd_tag_c1(tgd_tag_c1[12:0]),
  .tld_ubit(tld_ubit),
  .tld_tag_pid(tld_tag_pid[2:0]),
  .tld_tag_c0(tld_tag_c0[12:0]),
  .tld_tag_c1(tld_tag_c1[12:0]),
  .tld_tag_real(tld_tag_real),
  .tld_tag_valid(tld_tag_valid),
  .tld_tag_mask(tld_tag_mask[2:0]),
  .tld_data(tld_data[37:0]),
  .tld_demap_control0(tld_demap_control0[2:0]),
  .tld_demap_control1(tld_demap_control1[3:0]),
  .tld_use_secondary_context0(tld_use_secondary_context0),
  .tld_tid(tld_tid[2:0]),
  .tld_index_valid(tld_index_valid),
  .tld_rw_index(tld_rw_index[6:0]),
  .tld_prty_256m(tld_prty_256m),
  .tld_prty_4m(tld_prty_4m),
  .tld_prty_64k(tld_prty_64k),
  .tld_prty_8k(tld_prty_8k),
  .tld_prty_ctxt0(tld_prty_ctxt0),
  .tld_prty_ctxt1(tld_prty_ctxt1),
  .tld_va_m_eq_zero(tld_va_m_eq_zero),
  .lsu_va_m(lsu_va_m[47:0]),
  .lsu_mmu_va_m(lsu_mmu_va_m[47:0]),
  .lsu_exu_address_e(lsu_exu_address_e[47:13])
);

lsu_tlc_ctl tlc (
	.scan_in(tlc_scanin),
	.scan_out(tlc_scanout),
	.l2clk		(l2clk),
	.lsu_asi_error_inject_b31(lsu_asi_error_inject[31]),
	.lsu_asi_error_inject_b27(lsu_asi_error_inject[27]),
	.lsu_asi_error_inject_b26(lsu_asi_error_inject[26]),
	.mbi_dtb_write_en	(tld_mbi_dtb_write_en),
	.mbi_repl_write		(tld_mbi_repl_write),
	.mbi_dis_clr_ubit	(tld_mbi_dis_clr_ubit),
	.mbi_dtb_demap_en	(tld_mbi_dtb_demap_en),
	.mbi_demap_type		(tld_mbi_demap_type[1:0]),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_scan_en(tcu_scan_en),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk),
  .mmu_dtlb_reload(mmu_dtlb_reload),
  .tld_demap_control0(tld_demap_control0[2:0]),
  .tld_demap_control1(tld_demap_control1[3:0]),
  .tld_use_secondary_context0(tld_use_secondary_context0),
  .tld_index_valid(tld_index_valid),
  .lsu_lsu_pmen_(lsu_lsu_pmen_),
  .dcc_tlb_rw_index_e(dcc_tlb_rw_index_e),
  .lbist_run(lbist_run),
  .mbi_run(mbi_run),
  .mbi_cambist_run(mbi_cambist_run),
  .tlc_wr_u_en(tlc_wr_u_en),
  .tlc_rw_index_vld(tlc_rw_index_vld),
  .tlc_demap(tlc_demap),
  .tlc_demap_context(tlc_demap_context),
  .tlc_demap_all(tlc_demap_all),
  .tlc_demap_real(tlc_demap_real),
  .tlc_sel_demap_tag_c0(tlc_sel_demap_tag_c0),
  .tlc_sel_demap_tag_c1(tlc_sel_demap_tag_c1),
  .tlc_sel_write_tag(tlc_sel_write_tag),
  .tlc_sel_dm_tag(tlc_sel_dm_tag),
  .tlc_sel_wr_dm_bist(tlc_sel_wr_dm_bist),
  .tlc_sel_tte_tag(tlc_sel_tte_tag),
  .tlc_use_primary_context_c0(tlc_use_primary_context_c0),
  .tlc_use_secondary_context_c0(tlc_use_secondary_context_c0),
  .tlc_wr_or_demap(tlc_wr_or_demap),
  .tlc_write_next(tlc_write_next),
  .tlc_tte0_clken(tlc_tte0_clken),
  .tlc_tte1_clken(tlc_tte1_clken),
  .tlc_tag_error_inj(tlc_tag_error_inj),
  .tlc_data_error_inj(tlc_data_error_inj),
  .tlc_mbi_run(tlc_mbi_run),
  .tlc_dis_clr_ubit(tlc_dis_clr_ubit),
  .lsu_sel_lsu_addr_e(lsu_sel_lsu_addr_e)
);


lsu_rep_dp rep (.lmd_fill_or_byp_data_m(lmd_fill_or_byp_data_m[63:0]),
  .lmd_fill_or_byp_data_m_rep1(lmd_fill_or_byp_data_m_rep1[63:0]),
  .stb_ram_data(stb_ram_data[63:0]),
  .stb_ram_data_rep0(stb_ram_data_rep0[63:0]),
  .stb_cam_data(stb_cam_data[44:0]),
  .stb_cam_data_rep0(stb_cam_data_rep0[44:0]),
  .sbd_st_data2_b(sbd_st_data2_b[63:0]),
  .sbd_st_data2_b_rep0(sbd_st_data2_b_rep0[63:0]),
  .sbd_st_predata_b(sbd_st_predata_b[47:0]),
  .sbd_st_predata_b_rep0(sbd_st_predata_b_rep0[47:0]),
  .bist_cmp_data(bist_cmp_data[7:0]),
  .bist_cmp_data_rep0(bist_cmp_data_rep0[7:0]),
  .tlb_tte_ie_b(tlb_tte_ie_b),
  .tlb_tte_ie_b_rep00(tlb_tte_ie_b_rep00),
  .tlb_tte_ie_b_rep01(tlb_tte_ie_b_rep01),
  .stb_cam_hit(stb_cam_hit),
  .stb_cam_hit_rep0(stb_cam_hit_rep0),
  .tlb_cache_way_hit_b(tlb_cache_way_hit_b[3:0]),
  .cache_way_hit_top_b(cache_way_hit_top_b[3:0]),
  .cache_way_hit_bot_b(cache_way_hit_bot_b[3:0]),
  .exu_lsu_store_data_e(exu_lsu_store_data_e[63:0]),
  .exu_lsu_store_data_e_rep0(exu_lsu_store_data_e_rep0[63:0]),
  .exu_lsu_address_e(exu_lsu_address_e[10:4]),
  .exu_lsu_address_e_rep0(exu_lsu_address_e_rep0[10:4])
);

// fixscan start:
assign arc_scanin                = scan_in                  ;
assign ard_scanin                = arc_scanout              ;
assign dcd_scanin                = ard_scanout              ;
assign dac_scanin                = dcd_scanout              ;
assign dca_scanin                = dac_scanout              ;
assign lru_scanin                = dca_scanout              ;
assign dcc_scanin                = lru_scanout              ;
assign dcs_scanin                = dcc_scanout              ;
assign lmd_scanin                = dcs_scanout              ;
assign lmc_scanin                = lmd_scanout              ;
assign pic_scanin                = lmc_scanout              ;
assign cpq_scanin                = pic_scanout              ;
assign cid_scanin                = cpq_scanout              ;
assign red_scanin                = cid_scanout              ;
assign cic_scanin                = red_scanout              ;
assign asc_scanin                = cic_scanout              ;
assign asd_scanin                = asc_scanout              ;
assign pid_scanin                = asd_scanout              ;
assign sbs0_scanin               = pid_scanout              ;
assign sbs1_scanin               = sbs0_scanout             ;
assign sbs2_scanin               = sbs1_scanout             ;
assign sbs3_scanin               = sbs2_scanout             ;
assign sbs4_scanin               = sbs3_scanout             ;
assign sbs5_scanin               = sbs4_scanout             ;
assign sbs6_scanin               = sbs5_scanout             ;
assign sbs7_scanin               = sbs6_scanout             ;
assign sbc_scanin                = sbs7_scanout             ;
assign spd_scanin                = sbc_scanout              ;
assign sec_scanin                = spd_scanout              ;
assign sed_scanin                = sec_scanout              ;
assign sbd_scanin                = sed_scanout              ;
assign stb_cam_scanin            = sbd_scanout              ;
assign stb_ram_scanin            = stb_cam_scanout          ;
assign dta_scanin                = stb_ram_scanout          ;
assign dva_scanin                = dta_scanout              ;
assign tgc_scanin                = dva_scanout              ;
assign tgd_scanin                = tgc_scanout              ;
assign tlb_scanin                = tgd_scanout              ;
assign tld_scanin                = tlb_scanout              ;
assign tlc_scanin                = tld_scanout              ;
assign scan_out                  = tlc_scanout              ;

assign dcs_wmr_scanin            = wmr_scan_in              ;
assign wmr_scan_out              = dcs_wmr_scanout          ;
// fixscan end:
endmodule

