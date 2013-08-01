// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_asi_ctl.v
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
module  mmu_asi_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  htc_itlb_clken, 
  htc_dtlb_clken, 
  lsu_asi_clken, 
  lsu_mmu_pmen, 
  tlu_tag_access_tid_0_b, 
  tlu_i_tag_access_0_b, 
  tlu_d_tag_access_0_b, 
  tlu_tag_access_tid_1_b, 
  tlu_i_tag_access_1_b, 
  tlu_d_tag_access_1_b, 
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
  mbd_compare, 
  error_inject_enable, 
  error_inject_mrau, 
  error_inject_scau, 
  error_inject_mask, 
  lsu_rngf_cdbus, 
  tlu_iht_request, 
  tlu_dht_request, 
  tlu_release_tte, 
  tlu_ceter_pscce, 
  scp0_data, 
  scp1_data, 
  scp0_ecc, 
  scp1_ecc, 
  sel_scac, 
  sel_scau, 
  ase_mra_rd_data, 
  mel0_parity, 
  mel1_parity, 
  mel0_parity_err, 
  mel1_parity_err, 
  asd0_asi_rd_data, 
  asd1_asi_rd_data, 
  asd0_dtte_tag, 
  asd1_dtte_tag, 
  asd0_dtte_data, 
  asd1_dtte_data, 
  asd0_itte_index, 
  asd1_itte_index, 
  asd0_asi_zero_context, 
  asd1_asi_zero_context, 
  htd_tsbptr, 
  htc_mra_addr_in, 
  htc_mra_rd_en, 
  htc_wr_itlb_data_in, 
  htc_wr_dtlb_data_in, 
  mmu_i_unauth_access, 
  mmu_i_tsb_miss, 
  mmu_d_tsb_miss, 
  mmu_i_tte_outofrange, 
  mmu_d_tte_outofrange, 
  mmu_i_eccerr, 
  mmu_d_eccerr, 
  scan_out, 
  wmr_scan_out, 
  asi_error_scau, 
  asi_error_mrau, 
  asi_error_mask, 
  asi_scp_addr, 
  asi_scp_wr_en, 
  asi_scp_rd_en, 
  asi_rd_scp0, 
  asi_mra_rd_addr_0, 
  asi_mra_rd_addr_1, 
  asi_mra_rd_en, 
  asi_mra_wr_addr, 
  asi_mra_wr_en, 
  asi_mra_rd_en_last, 
  asi_rd_tsb_cfg_0_2, 
  asi_rd_tsb_cfg_1_3, 
  asi_rd_tsb_ptr_, 
  asi_rd_real_range, 
  asi_rd_physical_offset, 
  asi_sel_mra_0_in, 
  asi_mra_wr_en_next, 
  asi_rd_immu_tag_target, 
  asi_rd_immu_tag_access, 
  asi_rd_dmmu_tag_target, 
  asi_rd_dmmu_tag_access, 
  asi_rd_i_access_target, 
  asi_rd_d_access_target, 
  asi_rd_access_target, 
  asi_rd_itte_tag, 
  asi_rd_itte_data, 
  asi_rd_dtte, 
  asi_wr_immu_tag_access, 
  asi_wr_itlb_data_in, 
  asi_wr_itlb_data_access, 
  asi_wr_immu_demap, 
  asi_wr_immu_demap_p, 
  asi_wr_immu_demap_n, 
  asi_wr_dmmu_tag_access, 
  asi_wr_dtlb_data_in, 
  asi_wr_dtlb_data_access, 
  asi_wr_partition_id, 
  asi_wr_dmmu_demap, 
  asi_wr_dmmu_demap_p, 
  asi_wr_dmmu_demap_s_n, 
  asi_dmmu_demap_s, 
  asi_wr_p_context_0, 
  asi_p_context_0_en, 
  asi_tag_access_sel, 
  asi_tsb_ptr_req_valid, 
  asi_tsb_ptr_req, 
  asi_tsb_ptr_number, 
  asi_tsb_hwtw_enable_0, 
  asi_tsb_hwtw_enable_1, 
  asi_data_in_real, 
  asi_seg_wr_data, 
  asi_wr_data, 
  asi_mra_wr_data, 
  asi_mra_req_grant, 
  asi_demap_r_bit, 
  asi_rd_data, 
  asi_hwtw_config_0, 
  asi_hwtw_config_1, 
  asi_hwtw_config_2, 
  asi_hwtw_config_3, 
  asi_hwtw_config_4, 
  asi_hwtw_config_5, 
  asi_hwtw_config_6, 
  asi_hwtw_config_7, 
  asi_sel_en, 
  asi_i_tag_access_en, 
  asi_d_tag_access_en, 
  asi_i_data_in_en, 
  asi_d_data_in_en, 
  asi_mbist_wdata, 
  asi_ase_compare_data, 
  asi_compare_data, 
  asi_mbd_scp_data, 
  asi_mbd_sel_scp, 
  asi_mbist_ecc_in, 
  asi_mbist_ecc, 
  asi_mbist_run, 
  asi_ecc_cmpsel_in, 
  asi_ase_cmpsel_in, 
  mmu_asi_data, 
  mmu_asi_read, 
  mmu_write_itlb, 
  mmu_dtlb_reload_stall, 
  mmu_dtlb_reload, 
  mmu_hw_tw_enable, 
  mmu_asi_cecc, 
  mmu_asi_uecc, 
  mmu_asi_tid, 
  mmu_asi_index, 
  mmu_asi_mra_not_sca, 
  mmu_dae_req, 
  mmu_dae_tid, 
  mmu_reload_done, 
  mmu_index, 
  mmu_mbi_mra0_fail, 
  mmu_mbi_mra1_fail, 
  mmu_mbi_scp0_fail, 
  mmu_mbi_scp1_fail);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire stg1_en_in;
wire stg1_en_lat_scanin;
wire stg1_en_lat_scanout;
wire stg1_en;
wire stg2_en_in;
wire stg2_en;
wire mbist_run;
wire stg2_en_lat_scanin;
wire stg2_en_lat_scanout;
wire pstg2_en;
wire [7:0] prd_itte;
wire [7:0] prd_dtte;
wire [7:0] rd_dtte_hwtw;
wire stg3_en_lat_scanin;
wire stg3_en_lat_scanout;
wire stg3_en;
wire stg4_en_lat_scanin;
wire stg4_en_lat_scanout;
wire stg4_en;
wire stg1_4_en;
wire l1clk_pm1;
wire pm2_en;
wire l1clk_pm2;
wire mbist_run_lat_scanin;
wire mbist_run_lat_scanout;
wire mra0_wr_en_lat_scanin;
wire mra0_wr_en_lat_scanout;
wire mbist_mra0_wr_en;
wire mra1_wr_en_lat_scanin;
wire mra1_wr_en_lat_scanout;
wire mbist_mra1_wr_en;
wire scp0_wr_en_lat_scanin;
wire scp0_wr_en_lat_scanout;
wire mbist_scp0_wr_en;
wire scp1_wr_en_lat_scanin;
wire scp1_wr_en_lat_scanout;
wire mbist_scp1_wr_en;
wire mbist_addr_lat_scanin;
wire mbist_addr_lat_scanout;
wire [4:0] mbist_addr;
wire mbist_wdata_lat_scanin;
wire mbist_wdata_lat_scanout;
wire [7:0] mbist_wdata;
wire mra0_rd_en_lat_scanin;
wire mra0_rd_en_lat_scanout;
wire mbist_mra0_rd_en;
wire mra1_rd_en_lat_scanin;
wire mra1_rd_en_lat_scanout;
wire mbist_mra1_rd_en;
wire scp0_rd_en_lat_scanin;
wire scp0_rd_en_lat_scanout;
wire mbist_scp0_rd_en;
wire scp1_rd_en_lat_scanin;
wire scp1_rd_en_lat_scanout;
wire mbist_scp1_rd_en;
wire mbist_cmpsel_lat_scanin;
wire mbist_cmpsel_lat_scanout;
wire [1:0] mbist_cmpsel;
wire [63:0] mbist_wr_data;
wire [7:0] mbist_wdata_2;
wire mra0_wr_en_2_lat_scanin;
wire mra0_wr_en_2_lat_scanout;
wire mbist_mra0_wr_en_2;
wire mra1_wr_en_2_lat_scanin;
wire mra1_wr_en_2_lat_scanout;
wire mbist_mra1_wr_en_2;
wire mra0_rd_en_2_lat_scanin;
wire mra0_rd_en_2_lat_scanout;
wire mbist_mra0_rd_en_2;
wire mra1_rd_en_2_lat_scanin;
wire mra1_rd_en_2_lat_scanout;
wire mbist_mra1_rd_en_2;
wire scp0_rd_en_2_lat_scanin;
wire scp0_rd_en_2_lat_scanout;
wire mbist_scp0_rd_en_2;
wire scp1_rd_en_2_lat_scanin;
wire scp1_rd_en_2_lat_scanout;
wire mbist_scp1_rd_en_2;
wire mbist_addr_2_lat_scanin;
wire mbist_addr_2_lat_scanout;
wire [4:0] mbist_addr_2;
wire mbist_cmpsel_2_lat_scanin;
wire mbist_cmpsel_2_lat_scanout;
wire [1:0] mbist_cmpsel_2;
wire mbist_compare_data_lat_scanin;
wire mbist_compare_data_lat_scanout;
wire [7:0] compare_data_in;
wire [7:0] mbist_wdata_3;
wire [7:0] compare_data;
wire mbist_mra_rd_en_3;
wire mbist_mra0_rd_en_3;
wire mbist_mra1_rd_en_3;
wire mbist_scp0_0_rd_en;
wire mbist_scp0_1_rd_en;
wire mbist_scp0_2_rd_en;
wire mbist_scp1_0_rd_en;
wire mbist_scp1_1_rd_en;
wire mbist_scp1_2_rd_en;
wire mra0_rd_en_3_lat_scanin;
wire mra0_rd_en_3_lat_scanout;
wire mra1_rd_en_3_lat_scanin;
wire mra1_rd_en_3_lat_scanout;
wire scp0_rd_en_3_lat_scanin;
wire scp0_rd_en_3_lat_scanout;
wire mbist_scp0_rd_en_3;
wire scp1_rd_en_3_lat_scanin;
wire scp1_rd_en_3_lat_scanout;
wire mbist_scp1_rd_en_3;
wire mra0_rd_en_4_lat_scanin;
wire mra0_rd_en_4_lat_scanout;
wire mbist_mra0_rd_en_4;
wire mra1_rd_en_4_lat_scanin;
wire mra1_rd_en_4_lat_scanout;
wire mbist_mra1_rd_en_4;
wire mra0_fail_in;
wire mra1_fail_in;
wire scp0_fail_in;
wire scp1_fail_in;
wire mra0_fail_lat_scanin;
wire mra0_fail_lat_scanout;
wire mra0_fail;
wire mra1_fail_lat_scanin;
wire mra1_fail_lat_scanout;
wire mra1_fail;
wire scp0_fail_lat_scanin;
wire scp0_fail_lat_scanout;
wire scp0_fail;
wire scp1_fail_lat_scanin;
wire scp1_fail_lat_scanout;
wire scp1_fail;
wire [1:0] hwtw_config_0_in;
wire [7:0] wr_hwtw_config_dec;
wire [63:0] data_1;
wire [1:0] hwtw_config_0;
wire [1:0] hwtw_config_1_in;
wire [1:0] hwtw_config_1;
wire [1:0] hwtw_config_2_in;
wire [1:0] hwtw_config_2;
wire [1:0] hwtw_config_3_in;
wire [1:0] hwtw_config_3;
wire [1:0] hwtw_config_4_in;
wire [1:0] hwtw_config_4;
wire [1:0] hwtw_config_5_in;
wire [1:0] hwtw_config_5;
wire [1:0] hwtw_config_6_in;
wire [1:0] hwtw_config_6;
wire [1:0] hwtw_config_7_in;
wire [1:0] hwtw_config_7;
wire hwtw_config_0_lat_wmr_scanin;
wire hwtw_config_0_lat_wmr_scanout;
wire hwtw_config_1_lat_wmr_scanin;
wire hwtw_config_1_lat_wmr_scanout;
wire hwtw_config_2_lat_wmr_scanin;
wire hwtw_config_2_lat_wmr_scanout;
wire hwtw_config_3_lat_wmr_scanin;
wire hwtw_config_3_lat_wmr_scanout;
wire hwtw_config_4_lat_wmr_scanin;
wire hwtw_config_4_lat_wmr_scanout;
wire hwtw_config_5_lat_wmr_scanin;
wire hwtw_config_5_lat_wmr_scanout;
wire hwtw_config_6_lat_wmr_scanin;
wire hwtw_config_6_lat_wmr_scanout;
wire hwtw_config_7_lat_wmr_scanin;
wire hwtw_config_7_lat_wmr_scanout;
wire [63:0] hwtw_config_muxed;
wire [7:0] rd_hwtw_config_dec;
wire [63:0] data_1_in;
wire rng_stg1_data_scanin;
wire rng_stg1_data_scanout;
wire ctl_1_lat_scanin;
wire ctl_1_lat_scanout;
wire ctl_1;
wire asi;
wire scratchpad;
wire rd_scratchpad;
wire wr_scratchpad;
wire context;
wire p_context_0;
wire wr_p_context_0;
wire asi_50;
wire rd_asi_50;
wire immu_tag_target;
wire rd_immu_tag_target;
wire immu_tag_access;
wire rd_immu_tag_access;
wire wr_immu_tag_access;
wire range_offset;
wire rd_range_offset;
wire real_range_0;
wire real_range_1;
wire real_range_2;
wire real_range_3;
wire physical_offset_0;
wire physical_offset_1;
wire physical_offset_2;
wire physical_offset_3;
wire asi_54;
wire rd_asi_54;
wire itlb_data_in;
wire wr_itlb_data_in;
wire z_tsb_cfg_0;
wire z_tsb_cfg_1;
wire z_tsb_cfg_2;
wire z_tsb_cfg_3;
wire nz_tsb_cfg_0;
wire nz_tsb_cfg_1;
wire nz_tsb_cfg_2;
wire nz_tsb_cfg_3;
wire wr_z_tsb_cfg_0;
wire wr_z_tsb_cfg_1;
wire wr_z_tsb_cfg_2;
wire wr_z_tsb_cfg_3;
wire wr_nz_tsb_cfg_0;
wire wr_nz_tsb_cfg_1;
wire wr_nz_tsb_cfg_2;
wire wr_nz_tsb_cfg_3;
wire itsb_ptr_0;
wire itsb_ptr_1;
wire itsb_ptr_2;
wire itsb_ptr_3;
wire dtsb_ptr_0;
wire dtsb_ptr_1;
wire dtsb_ptr_2;
wire dtsb_ptr_3;
wire asi_2;
wire ctl_2;
wire [63:0] data_2;
wire asi_54_2;
wire t_p_c_2;
wire t_p_s_2;
wire rd_t_p_c_2;
wire wr_t_p_c_2;
wire rd_t_p_s_2;
wire legal_data_in_page_size;
wire wr_itlb_data_in_2;
wire wr_dtlb_data_in_2;
wire wr_itlb_data_access_2;
wire wr_dtlb_data_access_2;
wire [7:0] clear_data_in_write_;
wire [7:0] wr_tid_dec;
wire legal_tsb_cfg_page_size;
wire fast_dtsb_ptr;
wire itsb_ptr;
wire dtsb_ptr;
wire rd_tsb_ptr_1;
wire mra_diag;
wire rd_mra_parity;
wire itlb_data_access;
wire rd_itlb_data_access;
wire wr_itlb_data_access;
wire itlb_tag_read;
wire rd_itlb_tag_read;
wire immu_demap;
wire legal_i_demap;
wire wr_immu_demap;
wire dmmu_demap;
wire legal_d_demap;
wire wr_dmmu_demap;
wire asi_58;
wire rd_asi_58;
wire rd_asi_58_not_sfr;
wire dmmu_tag_target;
wire rd_dmmu_tag_target;
wire dmmu_tag_access;
wire rd_dmmu_tag_access;
wire wr_dmmu_tag_access;
wire hwtwconfig;
wire partition_id;
wire wr_partition_id;
wire sca_diag;
wire rd_sca_ecc;
wire rd_sca_data;
wire dtlb_data_in;
wire wr_dtlb_data_in;
wire dtlb_data_access;
wire rd_dtlb_data_access;
wire wr_dtlb_data_access;
wire dtlb_tag_read;
wire rd_dtlb_tag_read;
wire mmu_asi_rd_1;
wire [4:0] scp_addr;
wire wr_scratchpad_2;
wire [1:0] scp_rd_en_2;
wire rd_scratchpad_2;
wire [1:0] scp_wr_en;
wire [1:0] rd_sca_data_en_2;
wire rd_sca_data_2;
wire [1:0] rd_sca_ecc_en_2;
wire rd_sca_ecc_2;
wire scp_ctl_lat_scanin;
wire scp_ctl_lat_scanout;
wire rd_scratchpad_3;
wire rd_scratchpad_4_in;
wire check_ecc;
wire rd_scratchpad_4_lat_scanin;
wire rd_scratchpad_4_lat_scanout;
wire rd_scratchpad_4;
wire [1:0] scp_rden;
wire [1:0] mra_rd_en_1;
wire [4:0] mra_rd_addr;
wire [4:0] mra_rd_addr0;
wire [4:0] mra_rd_addr1;
wire [1:0] mra_addr_sel_rd;
wire [1:0] mra_avail;
wire [1:0] mra_addr_sel_hw_tw;
wire req_grant_in;
wire req_grant_lat_scanin;
wire req_grant_lat_scanout;
wire req_grant;
wire [4:0] mra_rd_addr_1;
wire [4:0] mra_rd_addr_0;
wire zero_context;
wire [1:1] tsb_ptr_addr;
wire [4:0] mra_addr_1;
wire mra_addr_lat_scanin;
wire mra_addr_lat_scanout;
wire [4:0] mra_addr_2;
wire [4:0] mra_addr_3;
wire [4:0] mra_addr_4;
wire [1:0] mra_rd_en;
wire [1:0] mra_to_r3_in_in;
wire [1:0] mra_to_r3_in;
wire [1:0] pmra_to_r3_in;
wire mra_rd_en_lat_scanin;
wire mra_rd_en_lat_scanout;
wire [1:0] mra_rd_en_last;
wire [1:0] pmra_to_r3;
wire [1:0] mra_wr_en_1;
wire [1:0] mra_wr_en_3_in;
wire [1:0] mra_wr_en_2;
wire mra_sel_tsb_cfg_2;
wire mra_sel_tsb_cfg_0_2_2;
wire mra_sel_tsb_cfg_1_3_2;
wire mra_wr_en_lat_scanin;
wire mra_wr_en_lat_scanout;
wire [1:0] mra_wr_en_3;
wire mra_wr_en_4_lat_scanin;
wire mra_wr_en_4_lat_scanout;
wire [1:0] mra_wr_en_4;
wire [1:0] mra_wr_en_out;
wire mra_uecc_4;
wire mra_sel_tsb_cfg_0_2_1;
wire mra_sel_tsb_cfg_1_3_1;
wire mra_sel_real_range_1;
wire mra_sel_physical_offset_1;
wire mra_sel_lat_scanin;
wire mra_sel_lat_scanout;
wire mra_sel_real_range_2;
wire mra_sel_physical_offset_2;
wire mra_sel_tsb_cfg_0_2_3;
wire mra_sel_tsb_cfg_1_3_3;
wire mra_sel_real_range_3;
wire mra_sel_physical_offset_3;
wire rd_tsb_cfg_3;
wire demap_context_2;
wire [7:0] rd_tid_dec;
wire [63:0] dtlb0_tte_tag;
wire [63:0] dtlb1_tte_tag;
wire [63:0] scp0_ecc_bus;
wire [63:0] scp1_ecc_bus;
wire [63:0] mbist_scp0_0;
wire [63:0] mbist_scp0_1;
wire [63:0] mbist_scp0_2;
wire [63:0] mbist_scp1_0;
wire [63:0] mbist_scp1_1;
wire [63:0] mbist_scp1_2;
wire sel_data_1;
wire [1:0] use_dtlb_window;
wire [1:0] asd_asi_sel;
wire rd_hwtw_config_2;
wire asd_asi_rd_2;
wire asd_asi_rd_1;
wire [63:0] data_2_in;
wire [63:0] rd_t_p_c_data;
wire [63:0] rd_t_p_s_data;
wire stg2_data_lat_scanin;
wire stg2_data_lat_scanout;
wire stg2_ctl_lat_scanin;
wire stg2_ctl_lat_scanout;
wire mmu_asi_rd_2;
wire rd_tsb_ptr_2;
wire rd_mra_parity_2;
wire wr_immu_tag_access_2;
wire wr_immu_demap_2;
wire wr_dmmu_tag_access_2;
wire wr_dmmu_demap_2;
wire wr_p_context_0_2;
wire wr_partition_id_2;
wire hwtwconfig_2;
wire [7:0] a_wr_immu_tag_access;
wire [7:0] a_wr_itlb_data_in;
wire [7:0] a_wr_itlb_data_access;
wire [7:0] a_wr_immu_demap;
wire [7:0] a_wr_dmmu_tag_access;
wire [7:0] a_wr_dtlb_data_in;
wire [7:0] a_wr_dtlb_data_access;
wire [7:0] a_wr_dmmu_demap;
wire suppress_write_2;
wire dae_req_lat_scanin;
wire dae_req_lat_scanout;
wire suppress_write_3;
wire [64:0] data_3;
wire check_ecc_in;
wire check_ecc_lat_scanin;
wire check_ecc_lat_scanout;
wire [1:0] pmra_to_r4_in;
wire pmra_to_r4_lat_scanin;
wire pmra_to_r4_lat_scanout;
wire [1:0] pmra_to_r4;
wire cecc_4;
wire uecc_4;
wire tid_4_lat_scanin;
wire tid_4_lat_scanout;
wire [2:0] tid_4;
wire sca_index_lat_scanin;
wire sca_index_lat_scanout;
wire [2:0] sca_index;
wire [64:0] rngf_cdbus_2;
wire [64:0] mra_data;
wire [64:0] mra_tsb_cfg;
wire tsb_hwtw_en_3;
wire [64:0] mra_parity;
wire [64:0] dtlb0_tte_data;
wire [64:0] dtlb1_tte_data;
wire [64:0] tsb_ptr_data;
wire mra_to_r3;
wire mra_not_tsb_cfg;
wire rd_mra_parity_3;
wire rd_tsb_ptr_3;
wire mra_sel_tsb_cfg;
wire sel_cdbus_2;
wire [64:0] data_3_in;
wire rng_stg3_scanin;
wire rng_stg3_scanout;
wire ctl_3;
wire stg3_ctl_lat_scanin;
wire stg3_ctl_lat_scanout;
wire mmu_asi_rd_3;
wire asi_read_lat_scanin;
wire asi_read_lat_scanout;
wire asi_read_in;
wire asi_read;
wire dtlb_window_used;
wire dtlb_window_used_last;
wire idata_in_data_access;
wire ddata_in_data_access;
wire [7:0] rd_itte_in;
wire [7:0] rd_itte;
wire [7:0] rd_dtte_in;
wire [7:0] wrote_dtlb_in;
wire sel_rd_dtte_hwtw_in;
wire [7:0] rd_dtte_hwtw_in;
wire rd_tte_lat_scanin;
wire rd_tte_lat_scanout;
wire sel_rd_dtte_hwtw;
wire idata_in_data_access_2_lat_scanin;
wire idata_in_data_access_2_lat_scanout;
wire idata_in_data_access_2;
wire [7:0] rd_dtte;
wire [1:0] dtlb_window;
wire [7:0] rd_itte_last_in;
wire [7:0] rd_itte_last_last_in;
wire [7:0] rd_itte_last;
wire [7:0] rd_itte_data_in;
wire [7:0] rd_itte_last_last;
wire [7:0] rd_itte_tag_in;
wire [7:0] rd_itte_data;
wire rd_itte_lat_scanin;
wire rd_itte_lat_scanout;
wire [7:0] prd_itte_last;
wire [7:0] rd_itte_tag;
wire dtlb_window_used_last_lat_scanin;
wire dtlb_window_used_last_lat_scanout;
wire wrote_dtlb_tg1_lat_scanin;
wire wrote_dtlb_tg1_lat_scanout;
wire [7:0] wrote_dtlb;
wire wrote_dtlb_tg0_lat_scanin;
wire wrote_dtlb_tg0_lat_scanout;
wire [7:0] reload_done_in;
wire reload_done_tg1_lat_scanin;
wire reload_done_tg1_lat_scanout;
wire [7:0] reload_done;
wire reload_done_tg0_lat_scanin;
wire reload_done_tg0_lat_scanout;
wire dtlb_reload_stall_in;
wire dtlb_reload;
wire dtlb_reload_stall_lat_scanin;
wire dtlb_reload_stall_lat_scanout;
wire dtlb_reload_stall;
wire dtlb_reload_in;
wire dtlb_reload_lat_scanin;
wire dtlb_reload_lat_scanout;
wire [3:0] wr_tsb_cfg_enc;
wire wr_tsb_cfg_lat_scanin;
wire wr_tsb_cfg_lat_scanout;
wire [3:0] wr_tsb_cfg_enc_2;
wire [3:0] wr_tsb_cfg_enc_3;
wire [3:0] wr_tsb_cfg_enc_4;
wire wr_z_tsb_cfg_3_4;
wire wr_z_tsb_cfg_2_4;
wire wr_z_tsb_cfg_1_4;
wire wr_z_tsb_cfg_0_4;
wire wr_nz_tsb_cfg_3_4;
wire wr_nz_tsb_cfg_2_4;
wire wr_nz_tsb_cfg_1_4;
wire wr_nz_tsb_cfg_0_4;
wire [7:0] tid_dec_4;
wire [3:0] t7_e_z_in;
wire [3:0] t7_e_z;
wire [3:0] t7_e_nz_in;
wire [3:0] t7_e_nz;
wire [3:0] t6_e_z_in;
wire [3:0] t6_e_z;
wire [3:0] t6_e_nz_in;
wire [3:0] t6_e_nz;
wire [3:0] t5_e_z_in;
wire [3:0] t5_e_z;
wire [3:0] t5_e_nz_in;
wire [3:0] t5_e_nz;
wire [3:0] t4_e_z_in;
wire [3:0] t4_e_z;
wire [3:0] t4_e_nz_in;
wire [3:0] t4_e_nz;
wire [3:0] t3_e_z_in;
wire [3:0] t3_e_z;
wire [3:0] t3_e_nz_in;
wire [3:0] t3_e_nz;
wire [3:0] t2_e_z_in;
wire [3:0] t2_e_z;
wire [3:0] t2_e_nz_in;
wire [3:0] t2_e_nz;
wire [3:0] t1_e_z_in;
wire [3:0] t1_e_z;
wire [3:0] t1_e_nz_in;
wire [3:0] t1_e_nz;
wire [3:0] t0_e_z_in;
wire [3:0] t0_e_z;
wire [3:0] t0_e_nz_in;
wire [3:0] t0_e_nz;
wire hw_tw_e_lat_wmr_scanin;
wire hw_tw_e_lat_wmr_scanout;
wire [7:0] hwtw_enables;
wire tsb_hwtw_en_1;
wire tsb_hwtw_en_lat_scanin;
wire tsb_hwtw_en_lat_scanout;
wire tsb_hwtw_en_2;
wire htc_mra_addr_lat_scanin;
wire htc_mra_addr_lat_scanout;
wire [4:0] htc_mra_addr;
wire [3:0] htc_tid_dec;
wire [7:0] htc_enables_1_2;
wire [7:0] htc_enables_0_2;
wire [3:0] htc_sel_tsb_cfg;
wire [1:0] htc_hwtw_en_1_2;
wire [1:0] htc_hwtw_en_0_2;
wire [6:0] index_in;
wire data_access_index_lat_scanin;
wire data_access_index_lat_scanout;
wire error_inject_lat_scanin;
wire error_inject_lat_scanout;
wire error_enable;
wire error_scau;
wire error_mrau;
wire [7:0] error_mask;
wire tag_access_tid_0_lat_scanin;
wire tag_access_tid_0_lat_scanout;
wire [1:0] tag_access_tid_0;
wire i_tag_access_0_lat_scanin;
wire i_tag_access_0_lat_scanout;
wire i_tag_access_0;
wire d_tag_access_0_lat_scanin;
wire d_tag_access_0_lat_scanout;
wire d_tag_access_0;
wire tag_access_tid_1_lat_scanin;
wire tag_access_tid_1_lat_scanout;
wire [1:0] tag_access_tid_1;
wire i_tag_access_1_lat_scanin;
wire i_tag_access_1_lat_scanout;
wire i_tag_access_1;
wire d_tag_access_1_lat_scanin;
wire d_tag_access_1_lat_scanout;
wire d_tag_access_1;
wire [7:0] i_tag_access_exc;
wire [7:0] d_tag_access_exc;
wire [7:0] write_stp;
wire [7:0] stp_in;
wire [7:0] stp;
wire stp_lat_scanin;
wire stp_lat_scanout;
wire [7:0] set_htp;
wire [7:0] clr_htp;
wire [7:0] htp_in;
wire [7:0] htp;
wire htp_lat_scanin;
wire htp_lat_scanout;
wire spares_scanin;
wire spares_scanout;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

// Power management
input	[7:0] htc_itlb_clken;
input	[7:0] htc_dtlb_clken;
input		lsu_asi_clken;
input		lsu_mmu_pmen;
input	[1:0]	tlu_tag_access_tid_0_b;	// Tag access power management
input		tlu_i_tag_access_0_b;	// Tag access power management
input		tlu_d_tag_access_0_b;	// Tag access power management
input	[1:0]	tlu_tag_access_tid_1_b;	// Tag access power management
input		tlu_i_tag_access_1_b;	// Tag access power management
input		tlu_d_tag_access_1_b;	// Tag access power management

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
input		mbd_compare;		// MBIST compare result

input		error_inject_enable;
input		error_inject_mrau;
input		error_inject_scau;
input	[7:0]	error_inject_mask;

input 	[64:0]	lsu_rngf_cdbus; 	// control/data bus from lsu

input 	[7:0]	tlu_iht_request;	// ITLB hardware tablewalk request
input 	[7:0]	tlu_dht_request;	// DTLB hardware tablewalk request
input 	[7:0]	tlu_release_tte;	// TTE write has been transmitted
input	[7:0]	tlu_ceter_pscce;

input	[63:0]	scp0_data;
input	[63:0]	scp1_data;
input	[7:0]	scp0_ecc;
input	[7:0]	scp1_ecc;
input		sel_scac;		// Correctable error on scratchpad
input		sel_scau;		// Uncorrectable error on scratchpad

input	[63:0]	ase_mra_rd_data;
input	[1:0]	mel0_parity;
input	[1:0]	mel1_parity;
input 		mel0_parity_err;
input 		mel1_parity_err;

input	[63:0]	asd0_asi_rd_data;
input	[63:0]	asd1_asi_rd_data;
input 	[47:0]	asd0_dtte_tag;
input 	[47:0]	asd1_dtte_tag;
input 	[54:0]	asd0_dtte_data;
input 	[54:0]	asd1_dtte_data;
input 	[6:0]	asd0_itte_index;	// Flop and send to IFU
input 	[6:0]	asd1_itte_index;	// Flop and send to IFU

input 		asd0_asi_zero_context;
input 		asd1_asi_zero_context;

input	[39:4]	htd_tsbptr;

input	[4:0]	htc_mra_addr_in;
input 	[1:0]	htc_mra_rd_en;

input	[7:0]	htc_wr_itlb_data_in;
input	[7:0]	htc_wr_dtlb_data_in;
input	[7:0]	mmu_i_unauth_access;
input	[7:0]	mmu_i_tsb_miss;
input	[7:0]	mmu_d_tsb_miss;
input	[7:0]	mmu_i_tte_outofrange;
input	[7:0]	mmu_d_tte_outofrange;
input	[7:0]	mmu_i_eccerr;		// HW TW had MRA or L2 error on I rld
input	[7:0]	mmu_d_eccerr;		// HW TW had MRA or L2 error on D rld



output		scan_out;
output		wmr_scan_out;

output		asi_error_scau;
output		asi_error_mrau;
output	[7:0]	asi_error_mask;

output	[4:0]	asi_scp_addr;
output	[1:0]	asi_scp_wr_en;
output	[1:0]	asi_scp_rd_en;
output		asi_rd_scp0;

output	[4:0]	asi_mra_rd_addr_0;	// For reads (flops now in array)
output	[4:0]	asi_mra_rd_addr_1;	// For reads (flops now in array)
output	[1:0]	asi_mra_rd_en;		//           (flops now in array)
output	[4:0]	asi_mra_wr_addr;
output	[1:0]	asi_mra_wr_en;
output	[1:0]	asi_mra_rd_en_last;	// to capture read data for rd-modify-wr
output		asi_rd_tsb_cfg_0_2;
output		asi_rd_tsb_cfg_1_3;
output		asi_rd_tsb_ptr_;
output		asi_rd_real_range;
output		asi_rd_physical_offset;
output		asi_sel_mra_0_in;	// Active in cycle 2
output		asi_mra_wr_en_next;	// Power management for rd-mod-wr flops

output	[7:0]	asi_rd_immu_tag_target;
output	[7:0]	asi_rd_immu_tag_access;
output	[7:0]	asi_rd_dmmu_tag_target;
output	[7:0]	asi_rd_dmmu_tag_access;
output	[1:0]	asi_rd_i_access_target;
output	[1:0]	asi_rd_d_access_target;
output	[1:0]	asi_rd_access_target;
output 	[7:0]	asi_rd_itte_tag;
output 	[7:0]	asi_rd_itte_data;
output 	[6:0]	asi_rd_dtte;

output	[7:0]	asi_wr_immu_tag_access;
output	[7:0]	asi_wr_itlb_data_in;
output	[7:0]	asi_wr_itlb_data_access;
output	[7:0]	asi_wr_immu_demap;
output	[7:0]	asi_wr_immu_demap_p;
output	[7:0]	asi_wr_immu_demap_n;
output	[7:0]	asi_wr_dmmu_tag_access;
output	[7:0]	asi_wr_dtlb_data_in;
output	[7:0]	asi_wr_dtlb_data_access;
output	[7:0]	asi_wr_partition_id;
output	[7:0]	asi_wr_dmmu_demap;
output	[7:0]	asi_wr_dmmu_demap_p;
output	[7:0]	asi_wr_dmmu_demap_s_n;
output		asi_dmmu_demap_s;
output	[7:0]	asi_wr_p_context_0;
output	[1:0]	asi_p_context_0_en;

output	[2:0]	asi_tag_access_sel;
output		asi_tsb_ptr_req_valid;
output	[2:0] asi_tsb_ptr_req;	// HW TW: which thread gets tag access
output	[1:0] asi_tsb_ptr_number;	// HW TW: which config reg to use

output	[1:0]	asi_tsb_hwtw_enable_0;	// TSB_CFG[63]; same timing as MRA output
output	[1:0]	asi_tsb_hwtw_enable_1;	// TSB_CFG[63]; same timing as MRA output
output 		asi_data_in_real;

output	[63:0] asi_seg_wr_data;
output	[63:0] asi_wr_data;
output	[63:0] asi_mra_wr_data;
output		asi_mra_req_grant;	// Hardware tablewalk request granted

output 		asi_demap_r_bit;

output	[63:0]	asi_rd_data;

output	[1:0]	asi_hwtw_config_0;
output	[1:0]	asi_hwtw_config_1;
output	[1:0]	asi_hwtw_config_2;
output	[1:0]	asi_hwtw_config_3;
output	[1:0]	asi_hwtw_config_4;
output	[1:0]	asi_hwtw_config_5;
output	[1:0]	asi_hwtw_config_6;
output	[1:0]	asi_hwtw_config_7;

output		asi_sel_en;		// Clock enable for scratchpad ECC check
output	[7:0] asi_i_tag_access_en;
output	[7:0] asi_d_tag_access_en;
output	[7:0] asi_i_data_in_en;
output	[7:0] asi_d_data_in_en;

output	[7:0]	asi_mbist_wdata;	// MBIST
output	[7:0]	asi_ase_compare_data;	// MBIST
output	[7:0]	asi_compare_data;	// MBIST
output	[31:0]	asi_mbd_scp_data;	// MBIST
output		asi_mbd_sel_scp;	// MBIST
output	[7:0]	asi_mbist_ecc_in;	// MBIST
output	[3:2]	asi_mbist_ecc;		// MBIST
output		asi_mbist_run;		// MBIST
output		asi_ecc_cmpsel_in;	// MBIST
output	[1:0]	asi_ase_cmpsel_in;	// MBIST

output	[64:0]	mmu_asi_data;		// ASI read data for fast bus (to TLU)
output		mmu_asi_read;		// Valid for MMU ASI read

output 	[7:0]	mmu_write_itlb;

output 		mmu_dtlb_reload_stall;
output 		mmu_dtlb_reload;

output 	[7:0]	mmu_hw_tw_enable;

output 		mmu_asi_cecc; 		// Correctable ECC error on ASI read
output 		mmu_asi_uecc; 		// Uncorrectable ECC error on ASI read
output	[2:0]	mmu_asi_tid;		// Thread for reported error
output	[2:0]	mmu_asi_index;		// Index of the failure (rest is TID)
output		mmu_asi_mra_not_sca;	// 1: MRA error 0: Scratchpad error

output		mmu_dae_req;		// data_access_exception for bad pg size
output	[2:0]	mmu_dae_tid;		

output 	[7:0]	mmu_reload_done;

output	[6:0]	mmu_index;		// Index and valid from idata_access

output		mmu_mbi_mra0_fail;	// MBIST
output		mmu_mbi_mra1_fail;	// MBIST
output		mmu_mbi_scp0_fail;	// MBIST
output		mmu_mbi_scp1_fail;	// MBIST



//////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;


mmu_asi_ctl_l1clkhdr_ctl_macro free_clken (
	.l2clk(l2clk),
	.l1en (1'b1 ),
	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
// Power management

assign stg1_en_in =
       lsu_asi_clken;

mmu_asi_ctl_msff_ctl_macro__width_1 stg1_en_lat  (
	.scan_in(stg1_en_lat_scanin),
	.scan_out(stg1_en_lat_scanout),
	.din	(stg1_en_in			),
	.dout	(stg1_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stg2_en_in =
       (lsu_rngf_cdbus[64] & lsu_rngf_cdbus[63]) | 
       (~lsu_rngf_cdbus[64] & stg2_en) |
       mbist_run |
       ~lsu_mmu_pmen;

mmu_asi_ctl_msff_ctl_macro__width_1 stg2_en_lat  (
	.scan_in(stg2_en_lat_scanin),
	.scan_out(stg2_en_lat_scanout),
	.din	(stg2_en_in			),
	.dout	(pstg2_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stg2_en =
       | {pstg2_en, prd_itte[7:0], prd_dtte[7:0], rd_dtte_hwtw[7:0]};

mmu_asi_ctl_msff_ctl_macro__width_1 stg3_en_lat  (
	.scan_in(stg3_en_lat_scanin),
	.scan_out(stg3_en_lat_scanout),
	.din	(stg2_en			),
	.dout	(stg3_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 stg4_en_lat  (
	.scan_in(stg4_en_lat_scanin),
	.scan_out(stg4_en_lat_scanout),
	.din	(stg3_en			),
	.dout	(stg4_en			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign stg1_4_en =
       stg1_en | stg2_en | stg3_en | stg4_en;

mmu_asi_ctl_l1clkhdr_ctl_macro stg1_4_clken (
	.l2clk	(l2clk				),
	.l1en	(stg1_4_en			),
	.l1clk	(l1clk_pm1			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


assign pm2_en =
       mbist_run | ~lsu_mmu_pmen;

mmu_asi_ctl_l1clkhdr_ctl_macro mbist_clken (
	.l2clk	(l2clk				),
	.l1en	(pm2_en				),
	.l1clk	(l1clk_pm2			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
// MBIST

// Note:  mbist_run is used to control power management,
// so do not power manage this flop
mmu_asi_ctl_msff_ctl_macro__width_1 mbist_run_lat  (					
	.scan_in(mbist_run_lat_scanin),
	.scan_out(mbist_run_lat_scanout),
	.din	(mbi_run			),
	.dout	(mbist_run			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra0_wr_en_lat  (
	.scan_in(mra0_wr_en_lat_scanin),
	.scan_out(mra0_wr_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_mra0_write_en		),
	.dout	(mbist_mra0_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_wr_en_lat  (
	.scan_in(mra1_wr_en_lat_scanin),
	.scan_out(mra1_wr_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_mra1_write_en		),
	.dout	(mbist_mra1_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp0_wr_en_lat  (
	.scan_in(scp0_wr_en_lat_scanin),
	.scan_out(scp0_wr_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_scp0_write_en		),
	.dout	(mbist_scp0_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp1_wr_en_lat  (
	.scan_in(scp1_wr_en_lat_scanin),
	.scan_out(scp1_wr_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_scp1_write_en		),
	.dout	(mbist_scp1_wr_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_5 mbist_addr_lat  (
	.scan_in(mbist_addr_lat_scanin),
	.scan_out(mbist_addr_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_addr		[4:0]	),
	.dout	(mbist_addr		[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_8 mbist_wdata_lat  (
	.scan_in(mbist_wdata_lat_scanin),
	.scan_out(mbist_wdata_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_wdata		[7:0]	),
	.dout	(mbist_wdata		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra0_rd_en_lat  (
	.scan_in(mra0_rd_en_lat_scanin),
	.scan_out(mra0_rd_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_mra0_read_en		),
	.dout	(mbist_mra0_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_rd_en_lat  (
	.scan_in(mra1_rd_en_lat_scanin),
	.scan_out(mra1_rd_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_mra1_read_en		),
	.dout	(mbist_mra1_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp0_rd_en_lat  (
	.scan_in(scp0_rd_en_lat_scanin),
	.scan_out(scp0_rd_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_scp0_read_en		),
	.dout	(mbist_scp0_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp1_rd_en_lat  (
	.scan_in(scp1_rd_en_lat_scanin),
	.scan_out(scp1_rd_en_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_scp1_read_en		),
	.dout	(mbist_scp1_rd_en		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_2 mbist_cmpsel_lat  (
	.scan_in(mbist_cmpsel_lat_scanin),
	.scan_out(mbist_cmpsel_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbi_mmu_cmpsel		[1:0]	),
	.dout	(mbist_cmpsel		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign mbist_wr_data[63:0] =
       {8 {mbist_wdata[7:0]}};

assign asi_mbist_wdata[7:0] =
       mbist_wdata[7:0];

assign asi_mbist_ecc_in[7:0] =
       mbist_wdata[7:0] & {8 {mbist_run}};

assign asi_mbist_ecc[3:2] =
       mbist_wdata_2[3:2] & {2 {mbist_run}};

assign asi_mbist_run =
       mbist_run;



mmu_asi_ctl_msff_ctl_macro__width_1 mra0_wr_en_2_lat  (
	.scan_in(mra0_wr_en_2_lat_scanin),
	.scan_out(mra0_wr_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra0_wr_en		),
	.dout	(mbist_mra0_wr_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_wr_en_2_lat  (
	.scan_in(mra1_wr_en_2_lat_scanin),
	.scan_out(mra1_wr_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra1_wr_en		),
	.dout	(mbist_mra1_wr_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra0_rd_en_2_lat  (
	.scan_in(mra0_rd_en_2_lat_scanin),
	.scan_out(mra0_rd_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra0_rd_en		),
	.dout	(mbist_mra0_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_rd_en_2_lat  (
	.scan_in(mra1_rd_en_2_lat_scanin),
	.scan_out(mra1_rd_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra1_rd_en		),
	.dout	(mbist_mra1_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp0_rd_en_2_lat  (
	.scan_in(scp0_rd_en_2_lat_scanin),
	.scan_out(scp0_rd_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_scp0_rd_en		),
	.dout	(mbist_scp0_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp1_rd_en_2_lat  (
	.scan_in(scp1_rd_en_2_lat_scanin),
	.scan_out(scp1_rd_en_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_scp1_rd_en		),
	.dout	(mbist_scp1_rd_en_2		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_5 mbist_addr_2_lat  (
	.scan_in(mbist_addr_2_lat_scanin),
	.scan_out(mbist_addr_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_addr		[4:0]	),
	.dout	(mbist_addr_2		[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_2 mbist_cmpsel_2_lat  (
	.scan_in(mbist_cmpsel_2_lat_scanin),
	.scan_out(mbist_cmpsel_2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_cmpsel		[1:0]	),
	.dout	(mbist_cmpsel_2		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_24 mbist_compare_data_lat  (
	.scan_in(mbist_compare_data_lat_scanin),
	.scan_out(mbist_compare_data_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	({mbist_wdata		[7:0],
		  mbist_wdata_2		[7:0],
		  compare_data_in	[7:0]}),
	.dout	({mbist_wdata_2  	[7:0],
		  mbist_wdata_3		[7:0],
		  compare_data		[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign mbist_mra_rd_en_3 =
       mbist_mra0_rd_en_3 | mbist_mra1_rd_en_3;

assign compare_data_in[7:0] =
       (mbist_wdata_2[7:0] & {8 {~mbist_mra_rd_en_3}}) |
       (mbist_wdata_3[7:0] & {8 { mbist_mra_rd_en_3}}) ;

assign asi_ase_compare_data[7:0] =
       compare_data_in[7:0];

assign asi_compare_data[7:0] =
       compare_data[7:0];

assign mbist_scp0_0_rd_en =
       mbist_scp0_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b00);
assign mbist_scp0_1_rd_en =
       mbist_scp0_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b01);
assign mbist_scp0_2_rd_en =
       mbist_scp0_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b10);
assign mbist_scp1_0_rd_en =
       mbist_scp1_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b00);
assign mbist_scp1_1_rd_en =
       mbist_scp1_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b01);
assign mbist_scp1_2_rd_en =
       mbist_scp1_rd_en_2 & (mbist_cmpsel_2[1:0] == 2'b10);

assign asi_ase_cmpsel_in[1:0] =
       mbist_cmpsel_2[1:0];


mmu_asi_ctl_msff_ctl_macro__width_1 mra0_rd_en_3_lat  (
	.scan_in(mra0_rd_en_3_lat_scanin),
	.scan_out(mra0_rd_en_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra0_rd_en_2		),
	.dout	(mbist_mra0_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_rd_en_3_lat  (
	.scan_in(mra1_rd_en_3_lat_scanin),
	.scan_out(mra1_rd_en_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra1_rd_en_2		),
	.dout	(mbist_mra1_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp0_rd_en_3_lat  (
	.scan_in(scp0_rd_en_3_lat_scanin),
	.scan_out(scp0_rd_en_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_scp0_rd_en_2		),
	.dout	(mbist_scp0_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp1_rd_en_3_lat  (
	.scan_in(scp1_rd_en_3_lat_scanin),
	.scan_out(scp1_rd_en_3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_scp1_rd_en_2		),
	.dout	(mbist_scp1_rd_en_3		),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mbd_sel_scp =
       mbist_scp0_rd_en_3 | mbist_scp1_rd_en_3;

mmu_asi_ctl_msff_ctl_macro__width_1 mra0_rd_en_4_lat  (
	.scan_in(mra0_rd_en_4_lat_scanin),
	.scan_out(mra0_rd_en_4_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra0_rd_en_3		),
	.dout	(mbist_mra0_rd_en_4		),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_rd_en_4_lat  (
	.scan_in(mra1_rd_en_4_lat_scanin),
	.scan_out(mra1_rd_en_4_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mbist_mra1_rd_en_3		),
	.dout	(mbist_mra1_rd_en_4		),
  .siclk(siclk),
  .soclk(soclk)
);

assign mra0_fail_in =
       ~mbd_compare & mbist_mra0_rd_en_4;
assign mra1_fail_in =
       ~mbd_compare & mbist_mra1_rd_en_4;
assign scp0_fail_in =
       ~mbd_compare & mbist_scp0_rd_en_3;
assign scp1_fail_in =
       ~mbd_compare & mbist_scp1_rd_en_3;
// Generate select for MRA ECC muxing for MBIST
assign asi_ecc_cmpsel_in =
       mbist_mra0_rd_en_3;

mmu_asi_ctl_msff_ctl_macro__width_1 mra0_fail_lat  (
	.scan_in(mra0_fail_lat_scanin),
	.scan_out(mra0_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mra0_fail_in			),
	.dout	(mra0_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 mra1_fail_lat  (
	.scan_in(mra1_fail_lat_scanin),
	.scan_out(mra1_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(mra1_fail_in			),
	.dout	(mra1_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp0_fail_lat  (
	.scan_in(scp0_fail_lat_scanin),
	.scan_out(scp0_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(scp0_fail_in			),
	.dout	(scp0_fail			),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 scp1_fail_lat  (
	.scan_in(scp1_fail_lat_scanin),
	.scan_out(scp1_fail_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(scp1_fail_in			),
	.dout	(scp1_fail			),
  .siclk(siclk),
  .soclk(soclk)
);


assign mmu_mbi_mra0_fail =
       mra0_fail;
assign mmu_mbi_mra1_fail =
       mra1_fail;
assign mmu_mbi_scp0_fail =
       scp0_fail;
assign mmu_mbi_scp1_fail =
       scp1_fail;



//////////////////////////////////////////////////////////////////////////////
// HW TW config

assign hwtw_config_0_in[1:0] =
       ({2 { wr_hwtw_config_dec[0]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[0]}} & hwtw_config_0	[1:0]) ;
assign hwtw_config_1_in[1:0] =
       ({2 { wr_hwtw_config_dec[1]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[1]}} & hwtw_config_1	[1:0]) ;
assign hwtw_config_2_in[1:0] =
       ({2 { wr_hwtw_config_dec[2]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[2]}} & hwtw_config_2	[1:0]) ;
assign hwtw_config_3_in[1:0] =
       ({2 { wr_hwtw_config_dec[3]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[3]}} & hwtw_config_3	[1:0]) ;
assign hwtw_config_4_in[1:0] =
       ({2 { wr_hwtw_config_dec[4]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[4]}} & hwtw_config_4	[1:0]) ;
assign hwtw_config_5_in[1:0] =
       ({2 { wr_hwtw_config_dec[5]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[5]}} & hwtw_config_5	[1:0]) ;
assign hwtw_config_6_in[1:0] =
       ({2 { wr_hwtw_config_dec[6]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[6]}} & hwtw_config_6	[1:0]) ;
assign hwtw_config_7_in[1:0] =
       ({2 { wr_hwtw_config_dec[7]}} & data_1		[1:0]) |
       ({2 {~wr_hwtw_config_dec[7]}} & hwtw_config_7	[1:0]) ;

mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_0_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_0_lat_wmr_scanin),
	.scan_out(hwtw_config_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_0_in	[1:0]	),
	.dout	(hwtw_config_0		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_1_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_1_lat_wmr_scanin),
	.scan_out(hwtw_config_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_1_in	[1:0]	),
	.dout	(hwtw_config_1		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_2_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_2_lat_wmr_scanin),
	.scan_out(hwtw_config_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_2_in	[1:0]	),
	.dout	(hwtw_config_2		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_3_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_3_lat_wmr_scanin),
	.scan_out(hwtw_config_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_3_in	[1:0]	),
	.dout	(hwtw_config_3		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_4_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_4_lat_wmr_scanin),
	.scan_out(hwtw_config_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_4_in	[1:0]	),
	.dout	(hwtw_config_4		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_5_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_5_lat_wmr_scanin),
	.scan_out(hwtw_config_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_5_in	[1:0]	),
	.dout	(hwtw_config_5		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_6_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_6_lat_wmr_scanin),
	.scan_out(hwtw_config_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_6_in	[1:0]	),
	.dout	(hwtw_config_6		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);
mmu_asi_ctl_msff_ctl_macro__width_2 hwtw_config_7_lat  ( // FS:wmr_protect
	.scan_in(hwtw_config_7_lat_wmr_scanin),
	.scan_out(hwtw_config_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(hwtw_config_7_in	[1:0]	),
	.dout	(hwtw_config_7		[1:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign asi_hwtw_config_0[1:0] =
       hwtw_config_0[1:0];
assign asi_hwtw_config_1[1:0] =
       hwtw_config_1[1:0];
assign asi_hwtw_config_2[1:0] =
       hwtw_config_2[1:0];
assign asi_hwtw_config_3[1:0] =
       hwtw_config_3[1:0];
assign asi_hwtw_config_4[1:0] =
       hwtw_config_4[1:0];
assign asi_hwtw_config_5[1:0] =
       hwtw_config_5[1:0];
assign asi_hwtw_config_6[1:0] =
       hwtw_config_6[1:0];
assign asi_hwtw_config_7[1:0] =
       hwtw_config_7[1:0];

assign hwtw_config_muxed[63:2] =
       {62 {1'b0}};
assign hwtw_config_muxed[1:0] =
       ({2 {rd_hwtw_config_dec[0]}} & hwtw_config_0[1:0]) |
       ({2 {rd_hwtw_config_dec[1]}} & hwtw_config_1[1:0]) |
       ({2 {rd_hwtw_config_dec[2]}} & hwtw_config_2[1:0]) |
       ({2 {rd_hwtw_config_dec[3]}} & hwtw_config_3[1:0]) |
       ({2 {rd_hwtw_config_dec[4]}} & hwtw_config_4[1:0]) |
       ({2 {rd_hwtw_config_dec[5]}} & hwtw_config_5[1:0]) |
       ({2 {rd_hwtw_config_dec[6]}} & hwtw_config_6[1:0]) |
       ({2 {rd_hwtw_config_dec[7]}} & hwtw_config_7[1:0]) ;

//////////////////////////////////////////////////////////////////////////////
//STAGE 0

assign data_1_in[63:0] =
       lsu_rngf_cdbus[63:0];



/////////////////////////////////////////////////////////////////////
//STAGE 1
/////////////////////////////////////////////////////////////////////
// Stage the packet coming on the ring

mmu_asi_ctl_msff_ctl_macro__width_64 rng_stg1_data  (
	.scan_in(rng_stg1_data_scanin),
	.scan_out(rng_stg1_data_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(data_1_in		[63:0]	), 
	.dout	(data_1			[63:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// register control bit, bit 64 indicates whether ctl packet or data packet
mmu_asi_ctl_msff_ctl_macro__width_1 ctl_1_lat  (
	.scan_in(ctl_1_lat_scanin),
	.scan_out(ctl_1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(lsu_rngf_cdbus		[64   ]	),
	.dout	(ctl_1				),
  .siclk(siclk),
  .soclk(soclk)
);

// decode the packet

assign asi = 
	ctl_1 & data_1[63] & ~data_1[62] & (data_1[61:60] == 2'b00);


// Scratchpad address is data_1[05:03] for regs 0 to 7
assign scratchpad =
       asi & ((data_1[55:48] == 8'h20) | (data_1[55:48] == 8'h4F)) ;
assign rd_scratchpad = 
       scratchpad &  data_1[59];
assign wr_scratchpad = 	       
       scratchpad & ~data_1[59];

// Context registers at 0x08, 0x10, 0x108, 0x110
assign context =
       asi & (data_1[55:48] == 8'h21);
assign p_context_0 =
       context & ~data_1[8] & ~data_1[4] &  data_1[3];
assign wr_p_context_0 =
       p_context_0 & ~data_1[59];

// IMMU tag target at 0x00, IMMU SFSR at 0x18, IMMU tag access at 0x30
// Note that ISFSR is in TLU, not MMU
assign asi_50 =
       asi & (data_1[55:48] == 8'h50);
assign rd_asi_50 =
       asi_50 &  data_1[59] & ~data_1[3];
assign immu_tag_target =
       asi_50 & (data_1[7:3] == 5'b00000);
assign rd_immu_tag_target =
       immu_tag_target &  data_1[59];
assign immu_tag_access =
       asi_50 & (data_1[7:3] == 5'b00110);
assign rd_immu_tag_access =
       immu_tag_access &  data_1[59];
assign wr_immu_tag_access =
       immu_tag_access & ~data_1[59];

// Real range at 0x108, 110, 118, 120; physical offset at 0x208, 210, 218, 220
assign range_offset = 
       asi & (data_1[55:48] == 8'h52);
assign rd_range_offset =
       range_offset &  data_1[59];
assign real_range_0 =
       range_offset & (data_1[9:8] == 2'b01) & (data_1[5:3] == 3'b001);
assign real_range_1 =
       range_offset & (data_1[9:8] == 2'b01) & (data_1[5:3] == 3'b010);
assign real_range_2 =
       range_offset & (data_1[9:8] == 2'b01) & (data_1[5:3] == 3'b011);
assign real_range_3 =
       range_offset & (data_1[9:8] == 2'b01) & (data_1[5:3] == 3'b100);
assign physical_offset_0 =
       range_offset & (data_1[9:8] == 2'b10) & (data_1[5:3] == 3'b001);
assign physical_offset_1 =
       range_offset & (data_1[9:8] == 2'b10) & (data_1[5:3] == 3'b010);
assign physical_offset_2 =
       range_offset & (data_1[9:8] == 2'b10) & (data_1[5:3] == 3'b011);
assign physical_offset_3 =
       range_offset & (data_1[9:8] == 2'b10) & (data_1[5:3] == 3'b100);

// ITLB data in reg at 0x00, TSB configurations at 0x[1-4][0,8],
// TSB pointers at 0x[5-8][0,8],
// tablewalk in progress registers at 0x90, 0x98
assign asi_54 = 
       asi & (data_1[55:48] == 8'h54);
assign rd_asi_54 =
       asi_54 &  data_1[59];
assign itlb_data_in =
       asi_54 & (data_1[7:3] == 5'b00000);
assign wr_itlb_data_in =
       itlb_data_in & ~data_1[59];
assign z_tsb_cfg_0 =
       asi_54 & (data_1[7:3] == 5'b00010);
assign z_tsb_cfg_1 =
       asi_54 & (data_1[7:3] == 5'b00011);
assign z_tsb_cfg_2 =
       asi_54 & (data_1[7:3] == 5'b00100);
assign z_tsb_cfg_3 =
       asi_54 & (data_1[7:3] == 5'b00101);
assign nz_tsb_cfg_0 =
       asi_54 & (data_1[7:3] == 5'b00110);
assign nz_tsb_cfg_1 =
       asi_54 & (data_1[7:3] == 5'b00111);
assign nz_tsb_cfg_2 =
       asi_54 & (data_1[7:3] == 5'b01000);
assign nz_tsb_cfg_3 =
       asi_54 & (data_1[7:3] == 5'b01001);
assign wr_z_tsb_cfg_0 =
       z_tsb_cfg_0 & ~data_1[59];
assign wr_z_tsb_cfg_1 =
       z_tsb_cfg_1 & ~data_1[59];
assign wr_z_tsb_cfg_2 =
       z_tsb_cfg_2 & ~data_1[59];
assign wr_z_tsb_cfg_3 =
       z_tsb_cfg_3 & ~data_1[59];
assign wr_nz_tsb_cfg_0 =
       nz_tsb_cfg_0 & ~data_1[59];
assign wr_nz_tsb_cfg_1 =
       nz_tsb_cfg_1 & ~data_1[59];
assign wr_nz_tsb_cfg_2 =
       nz_tsb_cfg_2 & ~data_1[59];
assign wr_nz_tsb_cfg_3 =
       nz_tsb_cfg_3 & ~data_1[59];
assign itsb_ptr_0 =
       asi_54 & (data_1[7:3] == 5'b01010);
assign itsb_ptr_1 =
       asi_54 & (data_1[7:3] == 5'b01011);
assign itsb_ptr_2 =
       asi_54 & (data_1[7:3] == 5'b01100);
assign itsb_ptr_3 =
       asi_54 & (data_1[7:3] == 5'b01101);
assign dtsb_ptr_0 =
       asi_54 & (data_1[7:3] == 5'b01110);
assign dtsb_ptr_1 =
       asi_54 & (data_1[7:3] == 5'b01111);
assign dtsb_ptr_2 =
       asi_54 & (data_1[7:3] == 5'b10000);
assign dtsb_ptr_3 =
       asi_54 & (data_1[7:3] == 5'b10001);
assign asi_2 = 
       ctl_2 & data_2[63] & ~data_2[62] & (data_2[61:60] == 2'b00);
assign asi_54_2 = 
       asi_2 & (data_2[55:48] == 8'h54);
assign t_p_c_2 = // tablewalk_pending_control
       asi_54_2 & (data_2[7:3] == 5'b10010);
assign t_p_s_2 = // tablewalk_pending_status
       asi_54_2 & (data_2[7:3] == 5'b10011);
assign rd_t_p_c_2 = 
       t_p_c_2 &  data_2[59] & ~mbist_run;
assign wr_t_p_c_2 =
       t_p_c_2 & ~data_2[59];
assign rd_t_p_s_2 =
       t_p_s_2 &  data_2[59] & ~mbist_run;

assign legal_data_in_page_size = // 0000, 0001, 0011, 0101
        ((~data_1[3] & ~data_1[2] & ~data_1[1]) |   // 0000, 0001
         (~data_1[3] & ~data_1[2] &  data_1[0]) |   // 0001, 0011
         (~data_1[3] & ~data_1[1] &  data_1[0]) ) | // 0001, 0101
       (~(wr_itlb_data_in_2 | wr_dtlb_data_in_2 | 
	  wr_itlb_data_access_2 | wr_dtlb_data_access_2));

assign clear_data_in_write_[7:0] =
       ({8 {legal_data_in_page_size}} & wr_tid_dec[7:0]) | 
       ~wr_tid_dec[7:0];

assign legal_tsb_cfg_page_size = // 0000, 0001, 0011, 0101
       (~data_1[7] & ~data_1[6] & ~data_1[5]) | // 0000, 0001
       (~data_1[7] & ~data_1[6] &  data_1[4]) | // 0001, 0011
       (~data_1[7] & ~data_1[5] &  data_1[4]) | // 0001, 0101
       data_2[59]; // read -- don't check for legal size on read!

// fast_dtsb_ptr distinguishes dtsb_ptr from itsb_ptr
assign fast_dtsb_ptr =
       (data_1[5] & data_1[4]) | data_1[7];

assign asi_tag_access_sel[2:0] =
       {fast_dtsb_ptr, data_1[57:56]};

assign asi_tsb_ptr_req_valid =
       itsb_ptr_0 | itsb_ptr_1 | itsb_ptr_2 | itsb_ptr_3 |
       dtsb_ptr_0 | dtsb_ptr_1 | dtsb_ptr_2 | dtsb_ptr_3 ;

assign itsb_ptr =
       itsb_ptr_0 | itsb_ptr_1 | itsb_ptr_2 | itsb_ptr_3;

assign dtsb_ptr = 
       dtsb_ptr_0 | dtsb_ptr_1 | dtsb_ptr_2 | dtsb_ptr_3;

assign asi_tsb_ptr_req[2:0] =
       {data_1[58:56]};

assign asi_tsb_ptr_number[1:0] =
       {dtsb_ptr_3 | dtsb_ptr_2 | itsb_ptr_3 | itsb_ptr_2,
	dtsb_ptr_3 | dtsb_ptr_1 | itsb_ptr_3 | itsb_ptr_1};

assign rd_tsb_ptr_1 = 
       itsb_ptr | dtsb_ptr;

assign asi_rd_tsb_ptr_ =
       ~(rd_tsb_ptr_1 & ~mbist_run);

// MRA diagnostic access at ASI 0x51, addr 0x00 - 0x38
assign mra_diag =
       asi & (data_1[55:48] == 8'h51);
assign rd_mra_parity =
       mra_diag & data_1[59];

// ITLB data access reg at 0x000 - 0x1F8
assign itlb_data_access = 
       asi & (data_1[55:48] == 8'h55);
assign rd_itlb_data_access =
       itlb_data_access &  data_1[59];
assign wr_itlb_data_access =
       itlb_data_access & ~data_1[59];
       
// ITLB tag read reg at 0x000 - 0x1F8
assign itlb_tag_read = 
       asi & (data_1[55:48] == 8'h56);
assign rd_itlb_tag_read =
       itlb_tag_read &  data_1[59];
       
// IMMU demap at address 0x0 (data holds command)
assign immu_demap = 
       asi & (data_1[55:48] == 8'h57) & legal_i_demap;
assign wr_immu_demap =
       immu_demap & ~data_1[59];
assign legal_i_demap = 
       data_1[7] |  // all, real
       ~data_1[4];  // primary, nucleus
       
// DMMU demap at address 0x0 (data holds command)
assign dmmu_demap = 
       asi & (data_1[55:48] == 8'h5f) & legal_d_demap;
assign wr_dmmu_demap =
       dmmu_demap & ~data_1[59];
assign legal_d_demap = 
       data_1[7] |  // all, real
       ~data_1[5] | // primary, secondary
       ~data_1[4];  // primary, nucleus
       
// DMMU tag target at 0x00, DMMU SFSR at 0x18, DMMU SFAR at 0x20,
// DMMU tag access at 0x30, hwtw_config at 0x40, partition ID at 0x80, 
assign asi_58 = 
       asi & (data_1[55:48] == 8'h58);
assign rd_asi_58 =
       asi_58 &  data_1[59];
// MMU owns ASI 0x58 except sync fault registers (addr 0x18 & 0x20)
assign rd_asi_58_not_sfr =
       rd_asi_58 & ((data_1[5:4] == 2'b00) | (data_1[5:4] == 2'b11));
assign dmmu_tag_target =
       asi_58 & (data_1[7:3] == 5'b00000);
assign rd_dmmu_tag_target =
       dmmu_tag_target &  data_1[59];
assign dmmu_tag_access =
       asi_58 & (data_1[7:3] == 5'b00110);
assign rd_dmmu_tag_access =
       dmmu_tag_access &  data_1[59];
assign wr_dmmu_tag_access =
       dmmu_tag_access & ~data_1[59];
assign hwtwconfig =
       asi_58 & (data_1[7:3] == 5'b01000);
assign partition_id =
       asi_58 & (data_1[7:3] == 5'b10000);
assign wr_partition_id =
       partition_id & ~data_1[59];

// Scratchpad diagnostic access at ASI 0x59, addr 0x00 - 0x78
assign sca_diag =
       asi & (data_1[55:48] == 8'h59);
assign rd_sca_ecc =
       sca_diag & ~data_1[6] &  data_1[59];
assign rd_sca_data =
       sca_diag &  data_1[6] &  data_1[59];

// DTLB data in reg at 0x00
assign dtlb_data_in =
       asi & (data_1[55:48] == 8'h5c);
assign wr_dtlb_data_in =
       dtlb_data_in & ~data_1[59];

// DTLB data access reg at 0x000 - 0x1F8
assign dtlb_data_access =
       asi & (data_1[55:48] == 8'h5d);
assign rd_dtlb_data_access =
       dtlb_data_access &  data_1[59];
assign wr_dtlb_data_access =
       dtlb_data_access & ~data_1[59];
       
// DTLB tag read reg at 0x000 - 0x1F8
assign dtlb_tag_read =
       asi & (data_1[55:48] == 8'h5e);
assign rd_dtlb_tag_read =
       dtlb_tag_read &  data_1[59];
       

assign mmu_asi_rd_1 = 
       rd_scratchpad | rd_asi_50 | rd_range_offset | rd_asi_54 |
       rd_itlb_data_access | rd_itlb_tag_read | rd_asi_58_not_sfr | 
       rd_dtlb_data_access | rd_dtlb_tag_read | rd_sca_ecc | rd_sca_data;



// Three classes of register:
//	1.  Scratchpad registers
// 	2.  Registers stored in MMU register array (MRA)
//	3.  Individual registers present in MMU
//		or
//	    calculations performed within MMU
//


//
// Scratchpad registers
// These are stored in SCP
//
assign scp_addr[4:0] =
       ({5 {rd_scratchpad   & ~mbist_run}} & {data_1[57:56], data_1[5:3]}) |
       ({5 {wr_scratchpad_2 & ~mbist_run}} & {data_2[57:56], data_2[5:3]}) |
       ({5 {rd_sca_ecc      & ~mbist_run}} & {data_1[57:56], data_1[5:3]}) |
       ({5 {rd_sca_data     & ~mbist_run}} & {data_1[57:56], data_1[5:3]}) |
       ({5 {                   mbist_run}} & mbist_addr[4:0]             ) ;

assign scp_rd_en_2[1:0] =
       {2 {rd_scratchpad_2 & ~mbist_run}} & {data_2[58], ~data_2[58]};
assign scp_wr_en[1:0] =
       ({2 {wr_scratchpad_2 & ~mbist_run}} & {data_2[58], ~data_2[58]}) | 
       ({2 {mbist_run}} & {mbist_scp1_wr_en, mbist_scp0_wr_en}) ;

assign rd_sca_data_en_2[1:0] =
       {2 {rd_sca_data_2 & ~mbist_run}} & {data_2[58], ~data_2[58]};
assign rd_sca_ecc_en_2[1:0] =
       {2 {rd_sca_ecc_2  & ~mbist_run}} & {data_2[58], ~data_2[58]};

mmu_asi_ctl_msff_ctl_macro__width_5 scp_ctl_lat  (
	.scan_in(scp_ctl_lat_scanin),
	.scan_out(scp_ctl_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	({rd_sca_ecc	       ,
		  rd_sca_data	       ,
		  rd_scratchpad	       ,
		  rd_scratchpad_2      ,
		  wr_scratchpad        }),
	.dout	({rd_sca_ecc_2	       ,
		  rd_sca_data_2	       ,
		  rd_scratchpad_2      ,
		  rd_scratchpad_3      ,
		  wr_scratchpad_2      }),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_sel_en =
       rd_scratchpad_2 | rd_scratchpad_3;

assign rd_scratchpad_4_in =
       rd_scratchpad_3 & check_ecc;

mmu_asi_ctl_msff_ctl_macro__width_1 rd_scratchpad_4_lat  (
	.scan_in(rd_scratchpad_4_lat_scanin),
	.scan_out(rd_scratchpad_4_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(rd_scratchpad_4_in	),
	.dout	(rd_scratchpad_4	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_scp_addr[4:0] =
       scp_addr[4:0];

assign asi_scp_wr_en[1:0] =
       scp_wr_en[1:0];

assign scp_rden[1:0] =
       ({2 {(rd_scratchpad | rd_sca_ecc | rd_sca_data) & ~mbist_run}} & 
	{data_1[58], ~data_1[58]}) |
       ({2 {mbist_run}} & {mbist_scp1_rd_en, mbist_scp0_rd_en}) ;

assign asi_scp_rd_en[1:0] =
       scp_rden[1:0];



//
// MMU register array (MRA)
//		z TSB cfg 0,1				address 0
//		z TSB cfg 2,3				address 1
//		nz TSB cfg 0,1				address 2
//		nz TSB cfg 2,3				address 3
//		Real range, physical offset pair 0	address 4
//		Real range, physical offset pair 1	address 5
//		Real range, physical offset pair 2	address 6
//		Real range, physical offset pair 3	address 7
// Since registers must be reformatted, read takes two cycles 
// (read of array and then format of data)
//
// Note that reads of the TSB pointers are calculations that depend on
// the TSB configuration registers (and therefore read them)
//
// All registers are written by
//
// Prioritizes between
// ASI access (highest)
// HW TW access (lowest)

assign mra_rd_en_1[1:0] =
       {data_1[58], ~data_1[58]} &
       {2 {z_tsb_cfg_0 | z_tsb_cfg_1 | 
	   z_tsb_cfg_2 | z_tsb_cfg_3 |
	   nz_tsb_cfg_0 | nz_tsb_cfg_1 | 
	   nz_tsb_cfg_2 | nz_tsb_cfg_3 |
	   itsb_ptr_0 | itsb_ptr_1 | 
	   itsb_ptr_2 | itsb_ptr_3 |
	   dtsb_ptr_0 | dtsb_ptr_1 | 
	   dtsb_ptr_2 | dtsb_ptr_3 |
	   real_range_0 | real_range_1 | 
	   real_range_2 | real_range_3 |
	   physical_offset_0 | physical_offset_1 | 
	   physical_offset_2 | physical_offset_3 | 
           rd_mra_parity}};

assign mra_rd_addr[4:3] =
       data_1[57:56];

assign mra_rd_addr[2] = // 4, 5, 6, 7
       real_range_0 | real_range_1 | 
       real_range_2 | real_range_3 |
       physical_offset_0 | physical_offset_1 | 
       physical_offset_2 | physical_offset_3 |
       (rd_mra_parity & data_1[5]);

assign mra_rd_addr0[1] = // 2, 3, 6, 7
       nz_tsb_cfg_0 | nz_tsb_cfg_1 | 
       nz_tsb_cfg_2 | nz_tsb_cfg_3 | 
       real_range_2 | real_range_3 |
       physical_offset_2 | physical_offset_3 |
       (rd_mra_parity & data_1[4]);

assign mra_rd_addr1[1] = // 2, 3, 6, 7
       nz_tsb_cfg_0 | nz_tsb_cfg_1 | 
       nz_tsb_cfg_2 | nz_tsb_cfg_3 | 
       real_range_2 | real_range_3 |
       physical_offset_2 | physical_offset_3 |
       (rd_mra_parity & data_1[4]);

assign mra_rd_addr[0] = // 1, 3, 5, 7
       z_tsb_cfg_2 | z_tsb_cfg_3 |
       nz_tsb_cfg_2 | nz_tsb_cfg_3 |
       itsb_ptr_2 | itsb_ptr_3 | 
       dtsb_ptr_2 | dtsb_ptr_3 | 
       real_range_1 | real_range_3 |
       physical_offset_1 | physical_offset_3 |
       (rd_mra_parity & data_1[3]);

assign mra_rd_addr0[4:2] =
       mra_rd_addr[4:2];
assign mra_rd_addr1[4:2] =
       mra_rd_addr[4:2];
assign mra_rd_addr[1] =
       mra_rd_addr0[1] | mra_rd_addr1[1];
assign mra_rd_addr0[0] =
       mra_rd_addr[0];
assign mra_rd_addr1[0] =
       mra_rd_addr[0];


assign mra_addr_sel_rd[1:0] = 
       mra_rd_en_1[1:0] & {2 {~mbist_run}};
assign mra_avail[1:0] = 
       ~mra_rd_en_1[1:0] & {2 {~mbist_run}};
// Prevent any HW TW access to MRA when tsb ptr read occurs
assign mra_addr_sel_hw_tw[1:0] = 
       htc_mra_rd_en[1:0] & mra_avail[1:0] & {2 {~rd_tsb_ptr_1}};

assign req_grant_in =
       | mra_addr_sel_hw_tw[1:0];

mmu_asi_ctl_msff_ctl_macro__width_1 req_grant_lat  (
	.scan_in(req_grant_lat_scanin),
	.scan_out(req_grant_lat_scanout),
	.din	(req_grant_in			),
	.dout	(req_grant			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mra_req_grant = // To hardware tablewalk
       req_grant;

// 0in bits_on -var {mra_addr_sel_rd[01], mra_addr_sel_hw_tw[01], mbist_run} -max 1
// 0in bits_on -var {mra_addr_sel_rd[00], mra_addr_sel_hw_tw[00], mbist_run} -max 1
assign mra_rd_addr_1[4:0] =
        ({5 {mra_addr_sel_rd   [1]}} & mra_rd_addr1	[4:0]) | 
        ({5 {mra_addr_sel_hw_tw[1]}} & htc_mra_addr_in	[4:0]) | 
        ({5 {mbist_run		   }} & mbist_addr_2	[4:0]) ;

assign mra_rd_addr_0[4:0] =
        ({5 {mra_addr_sel_rd   [0]}} & mra_rd_addr0	[4:0]) | 
        ({5 {mra_addr_sel_hw_tw[0]}} & htc_mra_addr_in	[4:0]) | 
        ({5 {mbist_run		   }} & mbist_addr_2	[4:0]) ;

assign asi_mra_rd_addr_1[4:0] =
       mra_rd_addr_1[4:0];

assign asi_mra_rd_addr_0[4:0] =
       mra_rd_addr_0[4:0];

// Account for logic in mmu_asd_dp
assign zero_context =
       (asd1_asi_zero_context &  data_1[58]) |
       (asd0_asi_zero_context & ~data_1[58]) ;
assign tsb_ptr_addr[1] = 
       ~zero_context & rd_tsb_ptr_1;

assign mra_addr_1[4:2] = 
       mra_rd_addr[4:2];
assign mra_addr_1[1] = 
       mra_rd_addr[1] | tsb_ptr_addr[1];
assign mra_addr_1[0] = 
       mra_rd_addr[0];

mmu_asi_ctl_msff_ctl_macro__width_15 mra_addr_lat  (
	.scan_in(mra_addr_lat_scanin),
	.scan_out(mra_addr_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({mra_addr_1		[4:0],
		  mra_addr_2		[4:0],
		  mra_addr_3		[4:0]}),
	.dout	({mra_addr_2		[4:0],
		  mra_addr_3		[4:0],
		  mra_addr_4		[4:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mra_wr_addr[4:0] =
       (mra_addr_4	[4:0] & {5 {~mbist_run}}) | 
       (mbist_addr_2	[4:0] & {5 { mbist_run}}) ;

assign mra_rd_en[1:0] = 
       (    mra_rd_en_1[1:0]                   & {2 {~mbist_run}}) | 
       (htc_mra_rd_en  [1:0]                   & {2 {~mbist_run}}) | 
       ({mbist_mra1_rd_en_2, mbist_mra0_rd_en_2} & {2 { mbist_run}}) ;

assign asi_mra_rd_en[1:0] =
       mra_rd_en[1:0];

assign mra_to_r3_in_in[1:0] = 
       mra_addr_sel_rd[1:0];

assign mra_to_r3_in[1:0] =
       {pmra_to_r3_in[1], 
	(pmra_to_r3_in[0] & ~mbist_run) | (mbist_mra0_rd_en_3 & mbist_run)};

mmu_asi_ctl_msff_ctl_macro__width_6 mra_rd_en_lat  (
	.scan_in(mra_rd_en_lat_scanin),
	.scan_out(mra_rd_en_lat_scanout),
	.din	({mra_rd_en		[1:0],
		  mra_to_r3_in_in	[1:0],
		  mra_to_r3_in		[1:0]}),
	.dout	({mra_rd_en_last	[1:0],
		  pmra_to_r3_in		[1:0],
		  pmra_to_r3		[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_sel_mra_0_in =
       mra_to_r3_in[0];

assign asi_mra_rd_en_last[1:0] =
       mra_rd_en_last[1:0];

assign mra_wr_en_1[1:0] =
       mra_addr_sel_rd[1:0] & {2 {~data_1[59]}};

assign mra_wr_en_3_in[1:0] =
       mra_wr_en_2[1:0] & 
       (~mra_to_r3_in[1:0] | 
	(mra_to_r3_in[1:0] & 
	 {2 {((mra_sel_tsb_cfg_2 & legal_tsb_cfg_page_size) | 
	      ~mra_sel_tsb_cfg_2)}}));

assign mra_sel_tsb_cfg_2 =
       mra_sel_tsb_cfg_0_2_2 | mra_sel_tsb_cfg_1_3_2;

mmu_asi_ctl_msff_ctl_macro__width_4 mra_wr_en_lat  (
	.scan_in(mra_wr_en_lat_scanin),
	.scan_out(mra_wr_en_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({mra_wr_en_1		[1:0],
		  mra_wr_en_3_in   	[1:0]}),
	.dout	({mra_wr_en_2   	[1:0],
		  mra_wr_en_3  		[1:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_2 mra_wr_en_4_lat  (
	.scan_in(mra_wr_en_4_lat_scanin),
	.scan_out(mra_wr_en_4_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(mra_wr_en_3   		[1:0]	),
	.dout	(mra_wr_en_4   		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_mra_wr_en_next =
       (| mra_wr_en_3[1:0]) | mbist_run;

assign mra_wr_en_out[1:0] =
       (mra_wr_en_4[1:0] & {2 {~mra_uecc_4 & ~mbist_run}}) |
       ({mbist_mra1_wr_en_2, mbist_mra0_wr_en_2} & {2 { mbist_run}}) ;

assign asi_mra_wr_en[1:0] =
       mra_wr_en_out[1:0];

// Generate controls for readmux and modify cycles
assign mra_sel_tsb_cfg_0_2_1 =
       z_tsb_cfg_0 | z_tsb_cfg_2 | 
       nz_tsb_cfg_0 | nz_tsb_cfg_2 ;
assign mra_sel_tsb_cfg_1_3_1 =
       z_tsb_cfg_1 | z_tsb_cfg_3 | 
       nz_tsb_cfg_1 | nz_tsb_cfg_3 ;
assign mra_sel_real_range_1 =
       real_range_0 | real_range_1 | real_range_2 | real_range_3;
assign mra_sel_physical_offset_1 =
       physical_offset_0 | physical_offset_1 | 
       physical_offset_2 | physical_offset_3;

mmu_asi_ctl_msff_ctl_macro__width_8 mra_sel_lat  (
	.scan_in(mra_sel_lat_scanin),
	.scan_out(mra_sel_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	({mra_sel_tsb_cfg_0_2_1,
		  mra_sel_tsb_cfg_1_3_1,
		  mra_sel_real_range_1,
		  mra_sel_physical_offset_1,
		  mra_sel_tsb_cfg_0_2_2,
		  mra_sel_tsb_cfg_1_3_2,
		  mra_sel_real_range_2,
		  mra_sel_physical_offset_2}),
	.dout	({mra_sel_tsb_cfg_0_2_2,
		  mra_sel_tsb_cfg_1_3_2,
		  mra_sel_real_range_2,
		  mra_sel_physical_offset_2,
		  mra_sel_tsb_cfg_0_2_3,
		  mra_sel_tsb_cfg_1_3_3,
		  mra_sel_real_range_3,
		  mra_sel_physical_offset_3}),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_rd_tsb_cfg_0_2 = 
       mra_sel_tsb_cfg_0_2_3;
assign asi_rd_tsb_cfg_1_3 = 
       mra_sel_tsb_cfg_1_3_3;
assign asi_rd_real_range = 
       mra_sel_real_range_3;
assign asi_rd_physical_offset = 
       mra_sel_physical_offset_3;

assign rd_tsb_cfg_3 =
       mra_sel_tsb_cfg_0_2_3 | mra_sel_tsb_cfg_1_3_3;

assign asi_mra_wr_data[63:0] =
       data_2[63:0];

assign asi_demap_r_bit =
       data_2[10] & ~demap_context_2;
assign demap_context_2 =
       ~data_2[7] & data_2[6];		     


//
// Individual register reads (write controls from cycle 2)
//
assign rd_tid_dec	[7:0] = 
       { data_1[58] &  data_1[57] &  data_1[56], 
         data_1[58] &  data_1[57] & ~data_1[56], 
         data_1[58] & ~data_1[57] &  data_1[56], 
         data_1[58] & ~data_1[57] & ~data_1[56], 
        ~data_1[58] &  data_1[57] &  data_1[56], 
        ~data_1[58] &  data_1[57] & ~data_1[56], 
        ~data_1[58] & ~data_1[57] &  data_1[56], 
        ~data_1[58] & ~data_1[57] & ~data_1[56]};

assign asi_rd_immu_tag_target[7:0] =
       {8 {rd_immu_tag_target}} & rd_tid_dec[7:0];
assign asi_rd_immu_tag_access[7:0] =
       {8 {rd_immu_tag_access}} & rd_tid_dec[7:0];
assign asi_rd_i_access_target[1:0] =
       {2 {rd_immu_tag_target | rd_immu_tag_access}} &
       {data_1[58], ~data_1[58]};
assign asi_rd_dmmu_tag_target[7:0] =
       {8 {rd_dmmu_tag_target}} & rd_tid_dec[7:0];
assign asi_rd_dmmu_tag_access[7:0] =
       {8 {rd_dmmu_tag_access}} & rd_tid_dec[7:0];
assign asi_rd_d_access_target[1:0] =
       {2 {rd_dmmu_tag_target | rd_dmmu_tag_access}} &
       {data_1[58], ~data_1[58]};
assign asi_rd_access_target[1:0] =
       {2 {rd_immu_tag_target | rd_immu_tag_access | 
	   rd_dmmu_tag_target | rd_dmmu_tag_access }} &
       {data_1[58], ~data_1[58]};


assign dtlb0_tte_tag[63:0] =
       {{16 {1'b0}}, asd0_dtte_tag[47:0]};
assign dtlb1_tte_tag[63:0] =
       {{16 {1'b0}}, asd1_dtte_tag[47:0]};
assign scp0_ecc_bus[63:0] =
       {{56 {1'b0}}, scp0_ecc[7:0]};
assign scp1_ecc_bus[63:0] =
       {{56 {1'b0}}, scp1_ecc[7:0]};
assign mbist_scp0_0[63:0] =
       {{32 {1'b0}}, scp0_data[31:0]};
assign mbist_scp0_1[63:0] =
       {{32 {1'b0}}, scp0_data[63:32]};
assign mbist_scp0_2[63:0] =
       {{32 {1'b0}}, {4 {scp0_ecc[7:0]}}};
assign mbist_scp1_0[63:0] =
       {{32 {1'b0}}, scp1_data[31:0]};
assign mbist_scp1_1[63:0] =
       {{32 {1'b0}}, scp1_data[63:32]};
assign mbist_scp1_2[63:0] =
       {{32 {1'b0}}, {4 {scp1_ecc[7:0]}}};

assign sel_data_1 =
       ~(| {use_dtlb_window[1:0], asd_asi_sel[1:0], scp_rd_en_2[1:0],
	 rd_sca_ecc_en_2[1:0], rd_sca_data_en_2[1:0], 
	 mbist_scp0_rd_en_2, mbist_scp1_rd_en_2, rd_hwtw_config_2,
         rd_t_p_c_2, rd_t_p_s_2});

assign asd_asi_sel[1:0] =
       {2 {asd_asi_rd_2 & ~mbist_run}} & {data_2[58], ~data_2[58]};
assign asd_asi_rd_1 = 
       rd_immu_tag_target | rd_immu_tag_access |
       rd_dmmu_tag_target | rd_dmmu_tag_access; 


// 0in bits_on -var {sel_data_1, use_dtlb_window[01:00], asd_asi_sel[01:00], scp_rd_en_2[01:00], rd_sca_ecc_en_2[01:00], rd_hwtw_config_2, rd_sca_data_en_2[01:00]} -max 1
assign data_2_in[63:0] =
       ({64 {sel_data_1       	 }} & data_1		[63:0]) |
       ({64 {use_dtlb_window[0] }} & dtlb0_tte_tag	[63:0]) |
       ({64 {use_dtlb_window[1] }} & dtlb1_tte_tag	[63:0]) |
       ({64 {asd_asi_sel[0]  	 }} & asd0_asi_rd_data	[63:0]) |
       ({64 {asd_asi_sel[1]  	 }} & asd1_asi_rd_data	[63:0]) |
       ({64 {scp_rd_en_2[0]  	 }} & scp0_data		[63:0]) |
       ({64 {scp_rd_en_2[1]  	 }} & scp1_data		[63:0]) |
       ({64 {rd_sca_data_en_2[0]}} & scp0_data		[63:0]) |
       ({64 {rd_sca_data_en_2[1]}} & scp1_data		[63:0]) |
       ({64 {rd_sca_ecc_en_2[0] }} & scp0_ecc_bus	[63:0]) |
       ({64 {rd_sca_ecc_en_2[1] }} & scp1_ecc_bus	[63:0]) |
       ({64 {rd_hwtw_config_2    }} & hwtw_config_muxed	[63:0]) |
       ({64 {mbist_scp0_0_rd_en  }} & mbist_scp0_0	[63:0]) |
       ({64 {mbist_scp0_1_rd_en  }} & mbist_scp0_1	[63:0]) |
       ({64 {mbist_scp0_2_rd_en  }} & mbist_scp0_2	[63:0]) |
       ({64 {mbist_scp1_0_rd_en  }} & mbist_scp1_0	[63:0]) |
       ({64 {mbist_scp1_1_rd_en  }} & mbist_scp1_1	[63:0]) |
       ({64 {mbist_scp1_2_rd_en  }} & mbist_scp1_2	[63:0]) |
       ({64 {rd_t_p_c_2          }} & rd_t_p_c_data	[63:0]) |
       ({64 {rd_t_p_s_2          }} & rd_t_p_s_data	[63:0]) ;

// For muxing of ECC bits in mmu_sel_dp
assign asi_rd_scp0 =
       scp_rd_en_2[0];



/////////////////////////////////////////////////////////////////////
//STAGE 2
/////////////////////////////////////////////////////////////////////
// pipe the packets and decoded control information
mmu_asi_ctl_msff_ctl_macro__width_64 stg2_data_lat  (
	.scan_in(stg2_data_lat_scanin),
	.scan_out(stg2_data_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(data_2_in	[63:0]	), 
	.dout	(data_2		[63:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


assign asi_mbd_scp_data[31:0] =
       data_2[31:0];

// register control bit
mmu_asi_ctl_msff_ctl_macro__width_16 stg2_ctl_lat  (
	.scan_in(stg2_ctl_lat_scanin),
	.scan_out(stg2_ctl_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	({ctl_1,
		  mmu_asi_rd_1,
		  asd_asi_rd_1,
		  rd_tsb_ptr_1,
		  rd_mra_parity,
		  wr_immu_tag_access,
		  wr_itlb_data_in,
		  wr_itlb_data_access,
		  wr_immu_demap,
		  wr_dmmu_tag_access,
		  wr_dmmu_demap,
		  wr_dtlb_data_in,
		  wr_dtlb_data_access,
		  wr_p_context_0,
		  wr_partition_id,
		  hwtwconfig}),
	.dout	({ctl_2,
		  mmu_asi_rd_2,
		  asd_asi_rd_2,
		  rd_tsb_ptr_2,
		  rd_mra_parity_2,
		  wr_immu_tag_access_2,
		  wr_itlb_data_in_2,
		  wr_itlb_data_access_2,
		  wr_immu_demap_2, 
		  wr_dmmu_tag_access_2,
		  wr_dmmu_demap_2, 
		  wr_dtlb_data_in_2,
		  wr_dtlb_data_access_2,
		  wr_p_context_0_2,
		  wr_partition_id_2, 
		  hwtwconfig_2}),
  .siclk(siclk),
  .soclk(soclk)
);

// send the store data out to the unit. Store data is in stage1 when control 
// is in stage 2.
assign asi_seg_wr_data	[63:0] = 
       data_1		[63:0] ;
assign asi_wr_data	[63:0] = 
       (data_1		[63:0] & {64 {~mbist_run}}) | 
       (mbist_wr_data	[63:0] & {64 { mbist_run}}) ;

assign wr_tid_dec	[7:0] = 
       { data_2[58] &  data_2[57] &  data_2[56], 
         data_2[58] &  data_2[57] & ~data_2[56], 
         data_2[58] & ~data_2[57] &  data_2[56], 
         data_2[58] & ~data_2[57] & ~data_2[56], 
        ~data_2[58] &  data_2[57] &  data_2[56], 
        ~data_2[58] &  data_2[57] & ~data_2[56], 
        ~data_2[58] & ~data_2[57] &  data_2[56], 
        ~data_2[58] & ~data_2[57] & ~data_2[56]};

assign a_wr_immu_tag_access[7:0] =
       {8 { wr_immu_tag_access_2}} & wr_tid_dec[7:0] ;
assign asi_wr_immu_tag_access[7:0] =
       a_wr_immu_tag_access[7:0];
assign a_wr_itlb_data_in[7:0] =
       {8 { wr_itlb_data_in_2 & legal_data_in_page_size}} & wr_tid_dec[7:0] ;
assign asi_wr_itlb_data_in[7:0] =
       a_wr_itlb_data_in[7:0];
assign a_wr_itlb_data_access[7:0] =
       {8 { wr_itlb_data_access_2 & legal_data_in_page_size}} & 
       wr_tid_dec[7:0] ;
assign asi_wr_itlb_data_access[7:0] =
       a_wr_itlb_data_access[7:0];
assign a_wr_immu_demap[7:0] =
       {8 {wr_immu_demap_2}} & wr_tid_dec[7:0] ;
assign asi_wr_immu_demap[7:0] =
       a_wr_immu_demap[7:0];
// Demap uses address, not data, so use data_2 here
assign asi_wr_immu_demap_p[7:0] =
       {8 {wr_immu_demap_2 & ~data_2[5] & ~data_2[4] }} & wr_tid_dec[7:0] ;
assign asi_wr_immu_demap_n[7:0] =
       {8 {wr_immu_demap_2 & (data_2[5] |  data_2[4])}} & wr_tid_dec[7:0] ;
assign a_wr_dmmu_tag_access[7:0] =
       {8 { wr_dmmu_tag_access_2}} & wr_tid_dec[7:0] ;
assign asi_wr_dmmu_tag_access[7:0] =
       a_wr_dmmu_tag_access[7:0];
assign a_wr_dtlb_data_in[7:0] =
       {8 { wr_dtlb_data_in_2 & legal_data_in_page_size}} & wr_tid_dec[7:0] ;
assign asi_wr_dtlb_data_in[7:0] =
       a_wr_dtlb_data_in[7:0];
assign a_wr_dtlb_data_access[7:0] =
       {8 { wr_dtlb_data_access_2 & legal_data_in_page_size}} & 
       wr_tid_dec[7:0] ;
assign asi_wr_dtlb_data_access[7:0] =
       a_wr_dtlb_data_access[7:0];
assign asi_wr_partition_id[7:0] =
       {8 {wr_partition_id_2}} & wr_tid_dec[7:0] ;
assign a_wr_dmmu_demap[7:0] =
       {8 {wr_dmmu_demap_2}} & wr_tid_dec[7:0] ;
assign asi_wr_dmmu_demap[7:0] =
       a_wr_dmmu_demap[7:0];
// Demap uses address, not data, so use data_2 here
assign asi_wr_dmmu_demap_p[7:0] =
       {8 {wr_dmmu_demap_2 & ~data_2[5] & ~data_2[4] }} & wr_tid_dec[7:0] ;
assign asi_wr_dmmu_demap_s_n[7:0] =
       {8 {wr_dmmu_demap_2 & (data_2[5] |  data_2[4])}} & wr_tid_dec[7:0] ;
assign asi_dmmu_demap_s =
       ~data_2[5] & data_2[4];

// Write of p_context shadows for immu_tag_access reg
assign asi_wr_p_context_0[7:0] =
       {8 {wr_p_context_0_2}} & wr_tid_dec[7:0];

assign asi_p_context_0_en[1:0] =
       {2 {wr_p_context_0_2}} & {data_2[58], ~data_2[58]};

assign rd_hwtw_config_2 =
       hwtwconfig_2 &  data_2[59] & ~mbist_run;
assign rd_hwtw_config_dec =
       {8 {hwtwconfig_2 &  data_2[59]}} & wr_tid_dec[7:0];
assign wr_hwtw_config_dec =
       {8 {hwtwconfig_2 & ~data_2[59]}} & wr_tid_dec[7:0];

assign suppress_write_2 = 
       ((wr_itlb_data_in_2 | wr_dtlb_data_in_2 | 
	 wr_itlb_data_access_2 | wr_dtlb_data_access_2) & 
	~legal_data_in_page_size) |
       ((| mra_to_r3_in[1:0]) & mra_sel_tsb_cfg_2 & ~legal_tsb_cfg_page_size);

mmu_asi_ctl_msff_ctl_macro__width_1 dae_req_lat  (
	.scan_in(dae_req_lat_scanin),
	.scan_out(dae_req_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(suppress_write_2		),
	.dout	(suppress_write_3		),
  .siclk(siclk),
  .soclk(soclk)
		  
);

assign mmu_dae_req =
       suppress_write_3;
assign mmu_dae_tid[2:0] =
       data_3[58:56];

// Real bit for data_in and data_access is encoded in address bit 10
assign asi_data_in_real =
       data_2[10];



// Set error bit for ECC problems
assign check_ecc_in =
       | (tlu_ceter_pscce[7:0] &
	  { data_2[58] &  data_2[57] &  data_2[56],
            data_2[58] &  data_2[57] & ~data_2[56],
            data_2[58] & ~data_2[57] &  data_2[56],
            data_2[58] & ~data_2[57] & ~data_2[56],
           ~data_2[58] &  data_2[57] &  data_2[56],
           ~data_2[58] &  data_2[57] & ~data_2[56],
           ~data_2[58] & ~data_2[57] &  data_2[56],
           ~data_2[58] & ~data_2[57] & ~data_2[56]});

mmu_asi_ctl_msff_ctl_macro__width_1 check_ecc_lat  (
	.scan_in(check_ecc_lat_scanin),
	.scan_out(check_ecc_lat_scanout),
	.din	(check_ecc_in			),
	.dout	(check_ecc			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign pmra_to_r4_in[1:0] =
	pmra_to_r3[1:0] & {2 {check_ecc}};

mmu_asi_ctl_msff_ctl_macro__width_2 pmra_to_r4_lat  (
	.scan_in(pmra_to_r4_lat_scanin),
	.scan_out(pmra_to_r4_lat_scanout),
	.din	(pmra_to_r4_in		[1:0]	),
	.dout	(pmra_to_r4		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
		  

assign cecc_4 =
       (sel_scac  & rd_scratchpad_4) ;

assign uecc_4 =
       (sel_scau  & rd_scratchpad_4) |
       (mel0_parity_err	& pmra_to_r4[0] ) |
       (mel1_parity_err	& pmra_to_r4[1] ) ;

assign mra_uecc_4 = 
       (mel0_parity_err	& pmra_to_r4[0] ) |
       (mel1_parity_err	& pmra_to_r4[1] ) ;

mmu_asi_ctl_msff_ctl_macro__width_3 tid_4_lat  (
	.scan_in(tid_4_lat_scanin),
	.scan_out(tid_4_lat_scanout),
	.din	(data_3			[58:56]	),
	.dout	(tid_4			[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_asi_cecc =
       cecc_4;
assign mmu_asi_uecc =
       uecc_4;
assign mmu_asi_tid[2:0] =
       tid_4[2:0];

assign mmu_asi_mra_not_sca =
       ~rd_scratchpad_4;

mmu_asi_ctl_msff_ctl_macro__width_3 sca_index_lat  (
	.scan_in(sca_index_lat_scanin),
	.scan_out(sca_index_lat_scanout),
	.din	(data_3			[5:3]	),
	.dout	(sca_index		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_asi_index[2:0] = 
       ({3 {~rd_scratchpad_4}} & mra_addr_4[2:0]) | 
       ({3 { rd_scratchpad_4}} & sca_index [2:0]) ;

// Mux ctl and data
assign rngf_cdbus_2[64:0] =
       {ctl_2,	data_2[63:0]};
assign mra_data[64:0] =
       {1'b0, ase_mra_rd_data[63:0]};
assign mra_tsb_cfg[64:0] =
       {1'b0, tsb_hwtw_en_3, ase_mra_rd_data[62:0]};
assign mra_parity[64:0] =
       {{63 {1'b0}}, 
        (mel0_parity[1:0] & {2 {~data_3[59]}}) |
        (mel1_parity[1:0] & {2 { data_3[59]}}) };
assign dtlb0_tte_data[64:0] =
       {1'b0, {8 {1'b0}}, 1'b0, asd0_dtte_data[54:0]};
assign dtlb1_tte_data[64:0] =
       {1'b0, {8 {1'b0}}, 1'b0, asd1_dtte_data[54:0]};
assign tsb_ptr_data[64:0] =
       {1'b0, {24 {1'b0}}, htd_tsbptr[39:4], {4 {1'b0}}};
assign mra_to_r3 =
       (| pmra_to_r3[1:0]) & data_3[59];
assign mra_not_tsb_cfg =
       mra_to_r3 & ~rd_tsb_cfg_3 & ~rd_mra_parity_3 & ~rd_tsb_ptr_3;
assign mra_sel_tsb_cfg = 
       mra_to_r3 &  rd_tsb_cfg_3 & ~rd_mra_parity_3 & ~rd_tsb_ptr_3;

assign sel_cdbus_2 = 
       ~(| ({use_dtlb_window[1:0], mra_not_tsb_cfg, mra_sel_tsb_cfg, 
             rd_mra_parity_3, rd_tsb_ptr_3}));

// 0in bits_on -var {use_dtlb_window[01:00], sel_cdbus_2, mra_not_tsb_cfg, mra_sel_tsb_cfg, rd_mra_parity_3, rd_tsb_ptr_3} -max 1
assign data_3_in[64:0] =
       ({65 {use_dtlb_window[0]}} & dtlb0_tte_data	[64:0]) |
       ({65 {use_dtlb_window[1]}} & dtlb1_tte_data	[64:0]) |
       ({65 {sel_cdbus_2        }} & rngf_cdbus_2	[64:0]) |
       ({65 {mra_not_tsb_cfg    }} & mra_data		[64:0]) |
       ({65 {mra_sel_tsb_cfg    }} & mra_tsb_cfg	[64:0]) |
       ({65 {rd_mra_parity_3    }} & mra_parity		[64:0]) |
       ({65 {rd_tsb_ptr_3       }} & tsb_ptr_data	[64:0]) ;

		      


/////////////////////////////////////////////////////////////////////
//STAGE 3
/////////////////////////////////////////////////////////////////////
// Mux previous results with TSA reads
// Transmit to TLU

mmu_asi_ctl_msff_ctl_macro__width_65 rng_stg3  (
	.scan_in(rng_stg3_scanin),
	.scan_out(rng_stg3_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(data_3_in	[64:0]	),
	.dout	(data_3		[64:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign ctl_3 =
       data_3[64];

assign asi_rd_data[63:0] =
       data_2[63:0];

mmu_asi_ctl_msff_ctl_macro__width_3 stg3_ctl_lat  (
	.scan_in(stg3_ctl_lat_scanin),
	.scan_out(stg3_ctl_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	({mmu_asi_rd_2,
		  rd_tsb_ptr_2,
		  rd_mra_parity_2}),
	.dout	({mmu_asi_rd_3,
		  rd_tsb_ptr_3,
		  rd_mra_parity_3}),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 asi_read_lat  (
	.scan_in(asi_read_lat_scanin),
	.scan_out(asi_read_lat_scanout),
	.din	(asi_read_in		),
	.dout	(asi_read		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_asi_data[64:0] =
       {data_3[64:63],
	data_3[62] | suppress_write_3,
	data_3[61:50],
	(data_3[49:48] & ~{2 {suppress_write_3}}) | {1'b0, suppress_write_3},
	data_3[47:0]};
assign asi_read_in = 
       mmu_asi_rd_3 | dtlb_window_used | dtlb_window_used_last | 
       suppress_write_2;
assign mmu_asi_read = 
       asi_read;




//////////////////////////////////////////////////////////////////////
//
// TTE Management
//
// Once a data_in or data_access register write occurs, the tag and data
// must be transmitted to the TLB and written.
//

assign idata_in_data_access =
       wr_itlb_data_in | wr_itlb_data_access | wr_immu_demap;
assign ddata_in_data_access =
       wr_dtlb_data_in | wr_dtlb_data_access | wr_dmmu_demap;

assign rd_itte_in[7:0] =
       (rd_tid_dec[7:0] & {8 {idata_in_data_access}}) |
       (htc_wr_itlb_data_in[7:0]) |
       (rd_itte   [7:0] & ~tlu_release_tte[7:0]);

assign rd_dtte_in[7:0] =
       (rd_tid_dec[7:0] & {8 {ddata_in_data_access}}) |
       (prd_dtte  [7:0] & clear_data_in_write_[7:0] & ~wrote_dtlb_in[7:0]);

assign sel_rd_dtte_hwtw_in =
       ~(| rd_dtte_in[7:0]);

assign rd_dtte_hwtw_in[7:0] =
	(htc_wr_dtlb_data_in[7:0]) |
	(rd_dtte_hwtw[7:0] & ~wrote_dtlb_in[7:0]) ;
       
mmu_asi_ctl_msff_ctl_macro__width_25 rd_tte_lat  (
	.scan_in(rd_tte_lat_scanin),
	.scan_out(rd_tte_lat_scanout),
	.din	({rd_itte_in		[7:0],
		  rd_dtte_in		[7:0],
		  sel_rd_dtte_hwtw_in	       ,
		  rd_dtte_hwtw_in	[7:0]}),
	.dout	({prd_itte		[7:0],
		  prd_dtte		[7:0],
		  sel_rd_dtte_hwtw	       ,
		  rd_dtte_hwtw		[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 idata_in_data_access_2_lat  (
	.scan_in(idata_in_data_access_2_lat_scanin),
	.scan_out(idata_in_data_access_2_lat_scanout),
	.din	(idata_in_data_access		),
	.dout	(idata_in_data_access_2		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_itte[7:0] =
       prd_itte[7:0] & clear_data_in_write_[7:0];

assign rd_dtte[7:0] =
       ({8 {~sel_rd_dtte_hwtw}} & prd_dtte[7:0] & 
	clear_data_in_write_[7:0]) |
       ({8 { sel_rd_dtte_hwtw}} & rd_dtte_hwtw[7:0] & 
        {{4 {dtlb_window[1]}}, {4 {dtlb_window[0]}}});

assign rd_itte_last_in[7:0] = 
	(rd_itte[7:0] & ~tlu_release_tte[7:0]) | htc_wr_itlb_data_in[7:0];

// data must be read same cycle as tlu_release_tte, but no time to control
//	directly
// tag must be read the cycle after tlu_release_tte
assign rd_itte_last_last_in[7:0] = 
       {rd_itte_last[7] & ~(| rd_itte_last[6:0]),
        rd_itte_last[6] & ~(| rd_itte_last[5:0]),
        rd_itte_last[5] & ~(| rd_itte_last[4:0]),
        rd_itte_last[4] & ~(| rd_itte_last[3:0]),
        rd_itte_last[3] & ~(| rd_itte_last[2:0]),
        rd_itte_last[2] & ~(| rd_itte_last[1:0]),
        rd_itte_last[1] & ~(  rd_itte_last[0   ]),
        rd_itte_last[0]                           };

assign rd_itte_data_in[7:0] = 
       rd_itte_last_last[7:0] & {8 {~(| tlu_release_tte[7:0])}};

assign rd_itte_tag_in[7:0] = 
       rd_itte_data[7:0] & tlu_release_tte[7:0];

mmu_asi_ctl_msff_ctl_macro__width_32 rd_itte_lat  (
	.scan_in(rd_itte_lat_scanin),
	.scan_out(rd_itte_lat_scanout),
	.din	({rd_itte_last_in		[7:0],
		  rd_itte_last_last_in		[7:0],
		  rd_itte_data_in		[7:0],
		  rd_itte_tag_in		[7:0]}),
	.dout	({prd_itte_last			[7:0],
		  rd_itte_last_last		[7:0],
		  rd_itte_data			[7:0],
		  rd_itte_tag			[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_itte_last[7:0] =
       prd_itte_last[7:0] & ~tlu_release_tte[7:0];

assign asi_rd_itte_tag[7:0] =
       rd_itte_tag[7:0];

assign asi_rd_itte_data[7:0] =
       rd_itte_data[7:0];

assign asi_rd_dtte[6:0] =
       ({7 {~sel_rd_dtte_hwtw}} & prd_dtte    [6:0]) | 
       ({7 { sel_rd_dtte_hwtw}} & rd_dtte_hwtw[6:0]) ;

// Send ITLB reload request to TLU; only assert for one cycle
// Sent in cycle 2 of access
assign mmu_write_itlb[7:0] =
       (wr_tid_dec[7:0] & 
	{8 {idata_in_data_access_2 & legal_data_in_page_size}}) |
       htc_wr_itlb_data_in[7:0];

// Detect hole sufficient for DTLB reload
// If three cycles occur without a control packet, then DTLB write can use the
// last two cycles; the last two cycles are the DTLB window
// The tag and data will be loaded into the stage 2 and 3 flops.
// Bus is idle on a given cycle if ctl and valid are not both 1
assign dtlb_window[1:0] =
       {2 {~(ctl_1 & data_1[63]) & ~(ctl_2 & data_2[63]) & 
	   ~(ctl_3 & data_3[63]) & ~dtlb_window_used_last}};
// 0in req_ack -req wr_dtlb_data_in -ack (| {use_dtlb_window[01:00], (wr_itlb_data_in_2 | wr_itlb_data_access_2 | wr_dtlb_data_in_2 | wr_dtlb_data_access_2) & ~legal_data_in_page_size}) -single_ack off -message "Multiple DTLB updates outstanding for ASI bus from MMU to LSU"

assign use_dtlb_window[1:0] = 
       dtlb_window[1:0] & 
       {(| rd_dtte[7:4]) & ~(| rd_dtte[3:0]),
	(| rd_dtte[3:0])} & {2 {~mbist_run}};

assign dtlb_window_used = 
       | use_dtlb_window[1:0];

mmu_asi_ctl_msff_ctl_macro__width_1 dtlb_window_used_last_lat  (
	.scan_in(dtlb_window_used_last_lat_scanin),
	.scan_out(dtlb_window_used_last_lat_scanout),
	.din	(dtlb_window_used	),
	.dout	(dtlb_window_used_last	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign wrote_dtlb_in[7] = 
       use_dtlb_window[1] & rd_dtte[7] & ~(| rd_dtte[6:4]);
assign wrote_dtlb_in[6] = 
       use_dtlb_window[1] & rd_dtte[6] & ~(| rd_dtte[5:4]);
assign wrote_dtlb_in[5] = 
       use_dtlb_window[1] & rd_dtte[5] & ~   rd_dtte[4   ] ;
assign wrote_dtlb_in[4] = 
       use_dtlb_window[1] & rd_dtte[4]                      ;

assign wrote_dtlb_in[3] = 
       use_dtlb_window[0] & rd_dtte[3] & ~(| rd_dtte[2:0]);
assign wrote_dtlb_in[2] = 
       use_dtlb_window[0] & rd_dtte[2] & ~(| rd_dtte[1:0]);
assign wrote_dtlb_in[1] = 
       use_dtlb_window[0] & rd_dtte[1] & ~   rd_dtte[0   ] ;
assign wrote_dtlb_in[0] = 
       use_dtlb_window[0] & rd_dtte[0]                      ;

// 0in assert_follower -leader ($0in_rising_edge(prd_dtte[07:00]&clear_data_in_write_[07:00])) -follower ($0in_rising_edge(wrote_dtlb_in[07:00])) -min 2 -max 2 -message "DTLB updates are being reordered!"

mmu_asi_ctl_msff_ctl_macro__width_4 wrote_dtlb_tg1_lat  (
	.scan_in(wrote_dtlb_tg1_lat_scanin),
	.scan_out(wrote_dtlb_tg1_lat_scanout),
	.din	(wrote_dtlb_in	[7:4]	),
	.dout	(wrote_dtlb	[7:4]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_4 wrote_dtlb_tg0_lat  (
	.scan_in(wrote_dtlb_tg0_lat_scanin),
	.scan_out(wrote_dtlb_tg0_lat_scanout),
	.din	(wrote_dtlb_in	[3:0]	),
	.dout	(wrote_dtlb	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign reload_done_in[7:0] = 
       htc_wr_itlb_data_in[7:0] | 
       (rd_dtte_hwtw[7:0] & wrote_dtlb_in[7:0]) ;

mmu_asi_ctl_msff_ctl_macro__width_4 reload_done_tg1_lat  (
	.scan_in(reload_done_tg1_lat_scanin),
	.scan_out(reload_done_tg1_lat_scanout),
	.din	(reload_done_in	[7:4]	),
	.dout	(reload_done	[7:4]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_4 reload_done_tg0_lat  (
	.scan_in(reload_done_tg0_lat_scanin),
	.scan_out(reload_done_tg0_lat_scanout),
	.din	(reload_done_in	[3:0]	),
	.dout	(reload_done	[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_reload_done[7:0] =
       reload_done[7:0];


// Block dispatch for DTLB reload
//
// Cycle			0 1 2 3 4 5 6 
//--------------------------------------------------------------------
// dtlb_window          	X
// mmu_asi_data			  X
// tlu_rngf_cdbus       	    X X
// DTLB demap           	          X
// DTLB write           	            X
// hole_in_m            	          X X
// hole_in_e            	        X X
// hole_in_d            	      X X
// mmu_dtlb_reload_stall	    X X
// mmu_dtlb_reload                  X 

assign dtlb_reload_stall_in =
       (| {wrote_dtlb[7:0], dtlb_reload});

mmu_asi_ctl_msff_ctl_macro__width_1 dtlb_reload_stall_lat  (
	.scan_in(dtlb_reload_stall_lat_scanin),
	.scan_out(dtlb_reload_stall_lat_scanout),
	.din	(dtlb_reload_stall_in		),
	.dout	(dtlb_reload_stall		),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_dtlb_reload_stall =
       dtlb_reload_stall;

assign dtlb_reload_in =
       (| wrote_dtlb[7:0]);

mmu_asi_ctl_msff_ctl_macro__width_1 dtlb_reload_lat  (
	.scan_in(dtlb_reload_lat_scanin),
	.scan_out(dtlb_reload_lat_scanout),
	.din	(dtlb_reload_in			),
	.dout	(dtlb_reload			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mmu_dtlb_reload =
       dtlb_reload;



//////////////////////////////////////////////////////////////////////
//
// Maintain hardware tablewalk enables
//

// Pipe write signals to stage 4 to match write of MRA

assign wr_tsb_cfg_enc[3:0] =
       {wr_z_tsb_cfg_0  | wr_z_tsb_cfg_1  | wr_z_tsb_cfg_2  | wr_z_tsb_cfg_3  |
        wr_nz_tsb_cfg_0 | wr_nz_tsb_cfg_1 | wr_nz_tsb_cfg_2 | wr_nz_tsb_cfg_3 ,
        wr_nz_tsb_cfg_0 | wr_nz_tsb_cfg_1 | wr_nz_tsb_cfg_2 | wr_nz_tsb_cfg_3 ,
        wr_z_tsb_cfg_2  | wr_z_tsb_cfg_3  | wr_nz_tsb_cfg_2 | wr_nz_tsb_cfg_3 ,
        wr_z_tsb_cfg_1  | wr_z_tsb_cfg_3  | wr_nz_tsb_cfg_1 | wr_nz_tsb_cfg_3 
       };

mmu_asi_ctl_msff_ctl_macro__width_12 wr_tsb_cfg_lat  (
	.scan_in(wr_tsb_cfg_lat_scanin),
	.scan_out(wr_tsb_cfg_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	({wr_tsb_cfg_enc	[3:0],
		  wr_tsb_cfg_enc_2	[3:0],
		  wr_tsb_cfg_enc_3	[3:0]}),
	.dout	({wr_tsb_cfg_enc_2	[3:0],
		  wr_tsb_cfg_enc_3	[3:0],
		  wr_tsb_cfg_enc_4	[3:0]}),
  .siclk(siclk),
  .soclk(soclk)
);

assign wr_z_tsb_cfg_3_4 =
        wr_tsb_cfg_enc_4[3] & ~wr_tsb_cfg_enc_4[2] & 
        wr_tsb_cfg_enc_4[1] &  wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_z_tsb_cfg_2_4 =
        wr_tsb_cfg_enc_4[3] & ~wr_tsb_cfg_enc_4[2] & 
        wr_tsb_cfg_enc_4[1] & ~wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_z_tsb_cfg_1_4 =
        wr_tsb_cfg_enc_4[3] & ~wr_tsb_cfg_enc_4[2] & 
       ~wr_tsb_cfg_enc_4[1] &  wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_z_tsb_cfg_0_4 =
        wr_tsb_cfg_enc_4[3] & ~wr_tsb_cfg_enc_4[2] & 
       ~wr_tsb_cfg_enc_4[1] & ~wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_nz_tsb_cfg_3_4 =
        wr_tsb_cfg_enc_4[3] &  wr_tsb_cfg_enc_4[2] & 
        wr_tsb_cfg_enc_4[1] &  wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_nz_tsb_cfg_2_4 =
        wr_tsb_cfg_enc_4[3] &  wr_tsb_cfg_enc_4[2] & 
        wr_tsb_cfg_enc_4[1] & ~wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_nz_tsb_cfg_1_4 =
        wr_tsb_cfg_enc_4[3] &  wr_tsb_cfg_enc_4[2] & 
       ~wr_tsb_cfg_enc_4[1] &  wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign wr_nz_tsb_cfg_0_4 =
        wr_tsb_cfg_enc_4[3] &  wr_tsb_cfg_enc_4[2] & 
       ~wr_tsb_cfg_enc_4[1] & ~wr_tsb_cfg_enc_4[0] & (| mra_wr_en_out[1:0]);

assign tid_dec_4[7:0] = 
       { tid_4[2] &  tid_4[1] &  tid_4[0], 
         tid_4[2] &  tid_4[1] & ~tid_4[0], 
         tid_4[2] & ~tid_4[1] &  tid_4[0], 
         tid_4[2] & ~tid_4[1] & ~tid_4[0], 
        ~tid_4[2] &  tid_4[1] &  tid_4[0], 
        ~tid_4[2] &  tid_4[1] & ~tid_4[0], 
        ~tid_4[2] & ~tid_4[1] &  tid_4[0], 
        ~tid_4[2] & ~tid_4[1] & ~tid_4[0]};

assign t7_e_z_in [3] =
        (t7_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[7])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[7])) ;
assign t7_e_z_in [2] =			    
        (t7_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[7])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[7])) ;
assign t7_e_z_in [1] =			    
        (t7_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[7])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[7])) ;
assign t7_e_z_in [0] =			    
        (t7_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[7])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[7])) ;
assign t7_e_nz_in[3] =
        (t7_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[7])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[7])) ;
assign t7_e_nz_in[2] =
        (t7_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[7])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[7])) ;
assign t7_e_nz_in[1] =
        (t7_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[7])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[7])) ;
assign t7_e_nz_in[0] =
        (t7_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[7])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[7])) ;

assign t6_e_z_in [3] =
        (t6_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[6])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[6])) ;
assign t6_e_z_in [2] =			    
        (t6_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[6])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[6])) ;
assign t6_e_z_in [1] =			    
        (t6_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[6])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[6])) ;
assign t6_e_z_in [0] =			    
        (t6_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[6])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[6])) ;
assign t6_e_nz_in[3] =
        (t6_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[6])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[6])) ;
assign t6_e_nz_in[2] =
        (t6_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[6])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[6])) ;
assign t6_e_nz_in[1] =
        (t6_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[6])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[6])) ;
assign t6_e_nz_in[0] =
        (t6_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[6])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[6])) ;

assign t5_e_z_in [3] =
        (t5_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[5])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[5])) ;
assign t5_e_z_in [2] =			    
        (t5_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[5])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[5])) ;
assign t5_e_z_in [1] =			    
        (t5_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[5])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[5])) ;
assign t5_e_z_in [0] =			    
        (t5_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[5])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[5])) ;
assign t5_e_nz_in[3] =
        (t5_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[5])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[5])) ;
assign t5_e_nz_in[2] =
        (t5_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[5])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[5])) ;
assign t5_e_nz_in[1] =
        (t5_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[5])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[5])) ;
assign t5_e_nz_in[0] =
        (t5_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[5])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[5])) ;
	
assign t4_e_z_in [3] =
        (t4_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[4])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[4])) ;
assign t4_e_z_in [2] =			    
        (t4_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[4])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[4])) ;
assign t4_e_z_in [1] =			    
        (t4_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[4])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[4])) ;
assign t4_e_z_in [0] =			    
        (t4_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[4])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[4])) ;
assign t4_e_nz_in[3] =
        (t4_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[4])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[4])) ;
assign t4_e_nz_in[2] =
        (t4_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[4])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[4])) ;
assign t4_e_nz_in[1] =
        (t4_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[4])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[4])) ;
assign t4_e_nz_in[0] =
        (t4_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[4])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[4])) ;

assign t3_e_z_in [3] =
        (t3_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[3])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[3])) ;
assign t3_e_z_in [2] =			    
        (t3_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[3])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[3])) ;
assign t3_e_z_in [1] =			    
        (t3_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[3])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[3])) ;
assign t3_e_z_in [0] =			    
        (t3_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[3])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[3])) ;
assign t3_e_nz_in[3] =
        (t3_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[3])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[3])) ;
assign t3_e_nz_in[2] =
        (t3_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[3])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[3])) ;
assign t3_e_nz_in[1] =
        (t3_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[3])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[3])) ;
assign t3_e_nz_in[0] =
        (t3_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[3])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[3])) ;

assign t2_e_z_in [3] =
        (t2_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[2])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[2])) ;
assign t2_e_z_in [2] =			    
        (t2_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[2])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[2])) ;
assign t2_e_z_in [1] =			    
        (t2_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[2])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[2])) ;
assign t2_e_z_in [0] =			    
        (t2_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[2])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[2])) ;
assign t2_e_nz_in[3] =
        (t2_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[2])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[2])) ;
assign t2_e_nz_in[2] =
        (t2_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[2])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[2])) ;
assign t2_e_nz_in[1] =
        (t2_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[2])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[2])) ;
assign t2_e_nz_in[0] =
        (t2_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[2])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[2])) ;

assign t1_e_z_in [3] =
        (t1_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[1])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[1])) ;
assign t1_e_z_in [2] =			    
        (t1_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[1])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[1])) ;
assign t1_e_z_in [1] =			    
        (t1_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[1])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[1])) ;
assign t1_e_z_in [0] =			    
        (t1_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[1])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[1])) ;
assign t1_e_nz_in[3] =
        (t1_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[1])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[1])) ;
assign t1_e_nz_in[2] =
        (t1_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[1])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[1])) ;
assign t1_e_nz_in[1] =
        (t1_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[1])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[1])) ;
assign t1_e_nz_in[0] =
        (t1_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[1])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[1])) ;

assign t0_e_z_in [3] =
        (t0_e_z  [3] & ~(wr_z_tsb_cfg_3_4  & tid_dec_4[0])) |
	(data_3  [63] &  (wr_z_tsb_cfg_3_4  & tid_dec_4[0])) ;
assign t0_e_z_in [2] =			    
        (t0_e_z  [2] & ~(wr_z_tsb_cfg_2_4  & tid_dec_4[0])) |
	(data_3  [63] &  (wr_z_tsb_cfg_2_4  & tid_dec_4[0])) ;
assign t0_e_z_in [1] =			    
        (t0_e_z  [1] & ~(wr_z_tsb_cfg_1_4  & tid_dec_4[0])) |
	(data_3  [63] &  (wr_z_tsb_cfg_1_4  & tid_dec_4[0])) ;
assign t0_e_z_in [0] =			    
        (t0_e_z  [0] & ~(wr_z_tsb_cfg_0_4  & tid_dec_4[0])) |
	(data_3  [63] &  (wr_z_tsb_cfg_0_4  & tid_dec_4[0])) ;
assign t0_e_nz_in[3] =
        (t0_e_nz [3] & ~(wr_nz_tsb_cfg_3_4 & tid_dec_4[0])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_3_4 & tid_dec_4[0])) ;
assign t0_e_nz_in[2] =
        (t0_e_nz [2] & ~(wr_nz_tsb_cfg_2_4 & tid_dec_4[0])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_2_4 & tid_dec_4[0])) ;
assign t0_e_nz_in[1] =
        (t0_e_nz [1] & ~(wr_nz_tsb_cfg_1_4 & tid_dec_4[0])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_1_4 & tid_dec_4[0])) ;
assign t0_e_nz_in[0] =
        (t0_e_nz [0] & ~(wr_nz_tsb_cfg_0_4 & tid_dec_4[0])) |
	(data_3  [63] &  (wr_nz_tsb_cfg_0_4 & tid_dec_4[0])) ;

mmu_asi_ctl_msff_ctl_macro__width_64 hw_tw_e_lat  ( // FS:wmr_protect
	.scan_in(hw_tw_e_lat_wmr_scanin),
	.scan_out(hw_tw_e_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	({t7_e_z_in	[3:0],
		  t7_e_nz_in	[3:0],
		  t6_e_z_in	[3:0],
		  t6_e_nz_in	[3:0],
		  t5_e_z_in	[3:0],
		  t5_e_nz_in	[3:0],
		  t4_e_z_in	[3:0],
		  t4_e_nz_in	[3:0],
		  t3_e_z_in	[3:0],
		  t3_e_nz_in	[3:0],
		  t2_e_z_in	[3:0],
		  t2_e_nz_in	[3:0],
		  t1_e_z_in	[3:0],
		  t1_e_nz_in	[3:0],
		  t0_e_z_in	[3:0],
		  t0_e_nz_in	[3:0]}),
	.dout	({t7_e_z   	[3:0],
		  t7_e_nz   	[3:0],
		  t6_e_z   	[3:0],
		  t6_e_nz   	[3:0],
		  t5_e_z   	[3:0],
		  t5_e_nz   	[3:0],
		  t4_e_z   	[3:0],
		  t4_e_nz   	[3:0],
		  t3_e_z   	[3:0],
		  t3_e_nz   	[3:0],
		  t2_e_z   	[3:0],
		  t2_e_nz   	[3:0],
		  t1_e_z   	[3:0],
		  t1_e_nz   	[3:0],
		  t0_e_z   	[3:0],
		  t0_e_nz   	[3:0]}),
  .l1clk(l1clk),
  .soclk(soclk)
);

assign mmu_hw_tw_enable[7] =
	(| {t7_e_z[3:0], t7_e_nz[3:0]});
assign mmu_hw_tw_enable[6] =
	(| {t6_e_z[3:0], t6_e_nz[3:0]});
assign mmu_hw_tw_enable[5] =
	(| {t5_e_z[3:0], t5_e_nz[3:0]});
assign mmu_hw_tw_enable[4] =
	(| {t4_e_z[3:0], t4_e_nz[3:0]});
assign mmu_hw_tw_enable[3] =
	(| {t3_e_z[3:0], t3_e_nz[3:0]});
assign mmu_hw_tw_enable[2] =
	(| {t2_e_z[3:0], t2_e_nz[3:0]});
assign mmu_hw_tw_enable[1] =
	(| {t1_e_z[3:0], t1_e_nz[3:0]});
assign mmu_hw_tw_enable[0] =
	(| {t0_e_z[3:0], t0_e_nz[3:0]});

// Mux the enables for ASI read
assign hwtw_enables[7:0] =
       ({t7_e_z[3:0], t7_e_nz[3:0]} & {8 {rd_tid_dec[7]}}) |
       ({t6_e_z[3:0], t6_e_nz[3:0]} & {8 {rd_tid_dec[6]}}) |
       ({t5_e_z[3:0], t5_e_nz[3:0]} & {8 {rd_tid_dec[5]}}) |
       ({t4_e_z[3:0], t4_e_nz[3:0]} & {8 {rd_tid_dec[4]}}) |
       ({t3_e_z[3:0], t3_e_nz[3:0]} & {8 {rd_tid_dec[3]}}) |
       ({t2_e_z[3:0], t2_e_nz[3:0]} & {8 {rd_tid_dec[2]}}) |
       ({t1_e_z[3:0], t1_e_nz[3:0]} & {8 {rd_tid_dec[1]}}) |
       ({t0_e_z[3:0], t0_e_nz[3:0]} & {8 {rd_tid_dec[0]}}) ;
       
assign tsb_hwtw_en_1 =
       (hwtw_enables[7] &  z_tsb_cfg_3) |
       (hwtw_enables[6] &  z_tsb_cfg_2) |
       (hwtw_enables[5] &  z_tsb_cfg_1) |
       (hwtw_enables[4] &  z_tsb_cfg_0) |
       (hwtw_enables[3] & nz_tsb_cfg_3) |
       (hwtw_enables[2] & nz_tsb_cfg_2) |
       (hwtw_enables[1] & nz_tsb_cfg_1) |
       (hwtw_enables[0] & nz_tsb_cfg_0) ;

mmu_asi_ctl_msff_ctl_macro__width_2 tsb_hwtw_en_lat  (
	.scan_in(tsb_hwtw_en_lat_scanin),
	.scan_out(tsb_hwtw_en_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	({tsb_hwtw_en_1	       ,
		  tsb_hwtw_en_2	       }),
	.dout	({tsb_hwtw_en_2	       ,
		  tsb_hwtw_en_3	       }),
  .siclk(siclk),
  .soclk(soclk)
);

// Mux the enables for HW TW read
mmu_asi_ctl_msff_ctl_macro__width_4 htc_mra_addr_lat  (
	.scan_in(htc_mra_addr_lat_scanin),
	.scan_out(htc_mra_addr_lat_scanout),
	.din	({htc_mra_addr_in	[4:3],
		  htc_mra_addr_in	[1:0]}),
	.dout	({htc_mra_addr		[4:3],
		  htc_mra_addr		[1:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign htc_tid_dec[3:0] =
       { htc_mra_addr[4] &  htc_mra_addr[3], 
         htc_mra_addr[4] & ~htc_mra_addr[3], 
        ~htc_mra_addr[4] &  htc_mra_addr[3], 
        ~htc_mra_addr[4] & ~htc_mra_addr[3]}; 

assign htc_enables_1_2[7:0] =
       ({t7_e_z[3:0], t7_e_nz[3:0]} & {8 {htc_tid_dec[3]}}) |
       ({t6_e_z[3:0], t6_e_nz[3:0]} & {8 {htc_tid_dec[2]}}) |
       ({t5_e_z[3:0], t5_e_nz[3:0]} & {8 {htc_tid_dec[1]}}) |
       ({t4_e_z[3:0], t4_e_nz[3:0]} & {8 {htc_tid_dec[0]}}) ;

assign htc_enables_0_2[7:0] =
       ({t3_e_z[3:0], t3_e_nz[3:0]} & {8 {htc_tid_dec[3]}}) |
       ({t2_e_z[3:0], t2_e_nz[3:0]} & {8 {htc_tid_dec[2]}}) |
       ({t1_e_z[3:0], t1_e_nz[3:0]} & {8 {htc_tid_dec[1]}}) |
       ({t0_e_z[3:0], t0_e_nz[3:0]} & {8 {htc_tid_dec[0]}}) ;

assign htc_sel_tsb_cfg[3:0] =
       {~htc_mra_addr[1] &  htc_mra_addr[0], 
        ~htc_mra_addr[1] & ~htc_mra_addr[0], 
         htc_mra_addr[1] &  htc_mra_addr[0], 
         htc_mra_addr[1] & ~htc_mra_addr[0]}; 

assign htc_hwtw_en_1_2[1:0] =
       (htc_enables_1_2[7:6] & {2 {htc_sel_tsb_cfg[3]}}) | 
       (htc_enables_1_2[5:4] & {2 {htc_sel_tsb_cfg[2]}}) | 
       (htc_enables_1_2[3:2] & {2 {htc_sel_tsb_cfg[1]}}) | 
       (htc_enables_1_2[1:0] & {2 {htc_sel_tsb_cfg[0]}}) ;

assign htc_hwtw_en_0_2[1:0] =
       (htc_enables_0_2[7:6] & {2 {htc_sel_tsb_cfg[3]}}) | 
       (htc_enables_0_2[5:4] & {2 {htc_sel_tsb_cfg[2]}}) | 
       (htc_enables_0_2[3:2] & {2 {htc_sel_tsb_cfg[1]}}) | 
       (htc_enables_0_2[1:0] & {2 {htc_sel_tsb_cfg[0]}}) ;

assign asi_tsb_hwtw_enable_1[1:0] =
       htc_hwtw_en_1_2[1:0];

assign asi_tsb_hwtw_enable_0[1:0] =
       htc_hwtw_en_0_2[1:0];



//////////////////////////////////////////////////////////////////////////////
//
// Flop data_access index & valid and send to IFU
//

assign index_in[6:0] =
       asd0_itte_index[6:0] | asd1_itte_index[6:0];

mmu_asi_ctl_msff_ctl_macro__width_7 data_access_index_lat  (
	.scan_in(data_access_index_lat_scanin),
	.scan_out(data_access_index_lat_scanout),
	.din	(index_in		[6:0]	),
	.dout	(mmu_index		[6:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
// 
//

mmu_asi_ctl_msff_ctl_macro__width_11 error_inject_lat  (
	.scan_in(error_inject_lat_scanin),
	.scan_out(error_inject_lat_scanout),
	.din	({error_inject_enable,
		  error_inject_scau,
		  error_inject_mrau,
		  error_inject_mask	[7:0]}),
	.dout	({error_enable,
		  error_scau,
		  error_mrau,
		  error_mask		[7:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign asi_error_scau =
       error_enable & error_scau;
assign asi_error_mrau =
       error_enable & error_mrau;
assign asi_error_mask[7:0] =
       error_mask[7:0];



//////////////////////////////////////////////////////////////////////////////
//
//  Tag access power management
//

mmu_asi_ctl_msff_ctl_macro__width_2 tag_access_tid_0_lat  (
	.scan_in(tag_access_tid_0_lat_scanin),
	.scan_out(tag_access_tid_0_lat_scanout),
	.din	(tlu_tag_access_tid_0_b	[1:0]	),
	.dout	(tag_access_tid_0	[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 i_tag_access_0_lat  (
	.scan_in(i_tag_access_0_lat_scanin),
	.scan_out(i_tag_access_0_lat_scanout),
	.din	(tlu_i_tag_access_0_b		),
	.dout	(i_tag_access_0			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 d_tag_access_0_lat  (
	.scan_in(d_tag_access_0_lat_scanin),
	.scan_out(d_tag_access_0_lat_scanout),
	.din	(tlu_d_tag_access_0_b		),
	.dout	(d_tag_access_0			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_2 tag_access_tid_1_lat  (
	.scan_in(tag_access_tid_1_lat_scanin),
	.scan_out(tag_access_tid_1_lat_scanout),
	.din	(tlu_tag_access_tid_1_b	[1:0]	),
	.dout	(tag_access_tid_1	[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 i_tag_access_1_lat  (
	.scan_in(i_tag_access_1_lat_scanin),
	.scan_out(i_tag_access_1_lat_scanout),
	.din	(tlu_i_tag_access_1_b		),
	.dout	(i_tag_access_1			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

mmu_asi_ctl_msff_ctl_macro__width_1 d_tag_access_1_lat  (
	.scan_in(d_tag_access_1_lat_scanin),
	.scan_out(d_tag_access_1_lat_scanout),
	.din	(tlu_d_tag_access_1_b		),
	.dout	(d_tag_access_1			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign i_tag_access_exc[7:0] =
       {(tag_access_tid_1[1:0] == 2'b11) & i_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b10) & i_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b01) & i_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b00) & i_tag_access_1,
	(tag_access_tid_0[1:0] == 2'b11) & i_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b10) & i_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b01) & i_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b00) & i_tag_access_0};

assign d_tag_access_exc[7:0] =
       {(tag_access_tid_1[1:0] == 2'b11) & d_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b10) & d_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b01) & d_tag_access_1,
	(tag_access_tid_1[1:0] == 2'b00) & d_tag_access_1,
	(tag_access_tid_0[1:0] == 2'b11) & d_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b10) & d_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b01) & d_tag_access_0,
	(tag_access_tid_0[1:0] == 2'b00) & d_tag_access_0};

assign asi_i_tag_access_en[7:0] =
       i_tag_access_exc[7:0] | 
       a_wr_immu_tag_access[7:0] |
       a_wr_immu_demap[7:0] |
       htc_itlb_clken[7:0];

assign asi_d_tag_access_en[7:0] =
       d_tag_access_exc[7:0] | 
       a_wr_dmmu_tag_access[7:0] |
       a_wr_dmmu_demap[7:0] |
       htc_dtlb_clken[7:0];



//////////////////////////////////////////////////////////////////////////////
//
//  Data in power management
//

assign asi_i_data_in_en[7:0] =
       a_wr_itlb_data_in[7:0] |
       a_wr_itlb_data_access[7:0] |
       a_wr_immu_demap[7:0] |
       htc_itlb_clken[7:0];

assign asi_d_data_in_en[7:0] =
       a_wr_dtlb_data_in[7:0] |
       a_wr_dtlb_data_access[7:0] |
       a_wr_dmmu_demap[7:0] |
       htc_dtlb_clken[7:0];



//////////////////////////////////////////////////////////////////////////////
//
// Tablewalk in progress registers
//

assign write_stp[7:0] =
       {8 {wr_t_p_c_2}} & wr_tid_dec[7:0];

assign stp_in[7:0] =
       ( write_stp[7:0] & {8 {data_1[0]}}) |
       (~write_stp[7:0] & stp[7:0]      ) ;

mmu_asi_ctl_msff_ctl_macro__width_8 stp_lat  (
	.scan_in(stp_lat_scanin),
	.scan_out(stp_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(stp_in		[7:0]	),
	.dout	(stp		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign set_htp[7:0] = 
       tlu_iht_request[7:0] | tlu_dht_request[7:0];

// Can clear htp when hardware tablewalk fails
// but on successful hardware tablewalk, must wait until the write to the
// TLB is in progress and no longer pending
assign clr_htp[7:0] =
       tlu_release_tte[7:0] | 
       (rd_dtte_hwtw[7:0] & wrote_dtlb_in[7:0]) |
       mmu_i_unauth_access[7:0] |  
       mmu_i_tsb_miss[7:0] | mmu_d_tsb_miss[7:0] |
       mmu_i_tte_outofrange[7:0] | mmu_d_tte_outofrange[7:0] |
       mmu_i_eccerr[7:0] | mmu_d_eccerr[7:0];

assign htp_in[7:0] =
       set_htp[7:0] | (htp[7:0] & ~clr_htp[7:0]);

mmu_asi_ctl_msff_ctl_macro__width_8 htp_lat  (
	.scan_in(htp_lat_scanin),
	.scan_out(htp_lat_scanout),
	.l1clk	(l1clk_pm1		),
	.din	(htp_in		[7:0]	),
	.dout	(htp		[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_t_p_c_data[63:0] =
       {{63 {1'b0}}, | (stp[7:0] & wr_tid_dec[7:0])};

assign rd_t_p_s_data[63:0] =
       {{24 {1'b0}}, htp[7:0], {24 {1'b0}}, stp[7:0]};



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//

mmu_asi_ctl_spare_ctl_macro__num_12 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk				),
  .siclk(siclk),
  .soclk(soclk)
);





supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign stg1_en_lat_scanin        = scan_in                  ;
assign stg2_en_lat_scanin        = stg1_en_lat_scanout      ;
assign stg3_en_lat_scanin        = stg2_en_lat_scanout      ;
assign stg4_en_lat_scanin        = stg3_en_lat_scanout      ;
assign mbist_run_lat_scanin      = stg4_en_lat_scanout      ;
assign mra0_wr_en_lat_scanin     = mbist_run_lat_scanout    ;
assign mra1_wr_en_lat_scanin     = mra0_wr_en_lat_scanout   ;
assign scp0_wr_en_lat_scanin     = mra1_wr_en_lat_scanout   ;
assign scp1_wr_en_lat_scanin     = scp0_wr_en_lat_scanout   ;
assign mbist_addr_lat_scanin     = scp1_wr_en_lat_scanout   ;
assign mbist_wdata_lat_scanin    = mbist_addr_lat_scanout   ;
assign mra0_rd_en_lat_scanin     = mbist_wdata_lat_scanout  ;
assign mra1_rd_en_lat_scanin     = mra0_rd_en_lat_scanout   ;
assign scp0_rd_en_lat_scanin     = mra1_rd_en_lat_scanout   ;
assign scp1_rd_en_lat_scanin     = scp0_rd_en_lat_scanout   ;
assign mbist_cmpsel_lat_scanin   = scp1_rd_en_lat_scanout   ;
assign mra0_wr_en_2_lat_scanin   = mbist_cmpsel_lat_scanout ;
assign mra1_wr_en_2_lat_scanin   = mra0_wr_en_2_lat_scanout ;
assign mra0_rd_en_2_lat_scanin   = mra1_wr_en_2_lat_scanout ;
assign mra1_rd_en_2_lat_scanin   = mra0_rd_en_2_lat_scanout ;
assign scp0_rd_en_2_lat_scanin   = mra1_rd_en_2_lat_scanout ;
assign scp1_rd_en_2_lat_scanin   = scp0_rd_en_2_lat_scanout ;
assign mbist_addr_2_lat_scanin   = scp1_rd_en_2_lat_scanout ;
assign mbist_cmpsel_2_lat_scanin = mbist_addr_2_lat_scanout ;
assign mbist_compare_data_lat_scanin = mbist_cmpsel_2_lat_scanout;
assign mra0_rd_en_3_lat_scanin   = mbist_compare_data_lat_scanout;
assign mra1_rd_en_3_lat_scanin   = mra0_rd_en_3_lat_scanout ;
assign scp0_rd_en_3_lat_scanin   = mra1_rd_en_3_lat_scanout ;
assign scp1_rd_en_3_lat_scanin   = scp0_rd_en_3_lat_scanout ;
assign mra0_rd_en_4_lat_scanin   = scp1_rd_en_3_lat_scanout ;
assign mra1_rd_en_4_lat_scanin   = mra0_rd_en_4_lat_scanout ;
assign mra0_fail_lat_scanin      = mra1_rd_en_4_lat_scanout ;
assign mra1_fail_lat_scanin      = mra0_fail_lat_scanout    ;
assign scp0_fail_lat_scanin      = mra1_fail_lat_scanout    ;
assign scp1_fail_lat_scanin      = scp0_fail_lat_scanout    ;
assign rng_stg1_data_scanin      = scp1_fail_lat_scanout    ;
assign ctl_1_lat_scanin          = rng_stg1_data_scanout    ;
assign scp_ctl_lat_scanin        = ctl_1_lat_scanout        ;
assign rd_scratchpad_4_lat_scanin = scp_ctl_lat_scanout      ;
assign req_grant_lat_scanin      = rd_scratchpad_4_lat_scanout;
assign mra_addr_lat_scanin       = req_grant_lat_scanout    ;
assign mra_rd_en_lat_scanin      = mra_addr_lat_scanout     ;
assign mra_wr_en_lat_scanin      = mra_rd_en_lat_scanout    ;
assign mra_wr_en_4_lat_scanin    = mra_wr_en_lat_scanout    ;
assign mra_sel_lat_scanin        = mra_wr_en_4_lat_scanout  ;
assign stg2_data_lat_scanin      = mra_sel_lat_scanout      ;
assign stg2_ctl_lat_scanin       = stg2_data_lat_scanout    ;
assign dae_req_lat_scanin        = stg2_ctl_lat_scanout     ;
assign check_ecc_lat_scanin      = dae_req_lat_scanout      ;
assign pmra_to_r4_lat_scanin     = check_ecc_lat_scanout    ;
assign tid_4_lat_scanin          = pmra_to_r4_lat_scanout   ;
assign sca_index_lat_scanin      = tid_4_lat_scanout        ;
assign rng_stg3_scanin           = sca_index_lat_scanout    ;
assign stg3_ctl_lat_scanin       = rng_stg3_scanout         ;
assign asi_read_lat_scanin       = stg3_ctl_lat_scanout     ;
assign rd_tte_lat_scanin         = asi_read_lat_scanout     ;
assign idata_in_data_access_2_lat_scanin = rd_tte_lat_scanout       ;
assign rd_itte_lat_scanin        = idata_in_data_access_2_lat_scanout;
assign dtlb_window_used_last_lat_scanin = rd_itte_lat_scanout      ;
assign wrote_dtlb_tg1_lat_scanin = dtlb_window_used_last_lat_scanout;
assign wrote_dtlb_tg0_lat_scanin = wrote_dtlb_tg1_lat_scanout;
assign reload_done_tg1_lat_scanin = wrote_dtlb_tg0_lat_scanout;
assign reload_done_tg0_lat_scanin = reload_done_tg1_lat_scanout;
assign dtlb_reload_stall_lat_scanin = reload_done_tg0_lat_scanout;
assign dtlb_reload_lat_scanin    = dtlb_reload_stall_lat_scanout;
assign wr_tsb_cfg_lat_scanin     = dtlb_reload_lat_scanout  ;
assign tsb_hwtw_en_lat_scanin    = wr_tsb_cfg_lat_scanout   ;
assign htc_mra_addr_lat_scanin   = tsb_hwtw_en_lat_scanout  ;
assign data_access_index_lat_scanin = htc_mra_addr_lat_scanout ;
assign error_inject_lat_scanin   = data_access_index_lat_scanout;
assign tag_access_tid_0_lat_scanin = error_inject_lat_scanout ;
assign i_tag_access_0_lat_scanin = tag_access_tid_0_lat_scanout;
assign d_tag_access_0_lat_scanin = i_tag_access_0_lat_scanout;
assign tag_access_tid_1_lat_scanin = d_tag_access_0_lat_scanout;
assign i_tag_access_1_lat_scanin = tag_access_tid_1_lat_scanout;
assign d_tag_access_1_lat_scanin = i_tag_access_1_lat_scanout;
assign stp_lat_scanin            = d_tag_access_1_lat_scanout;
assign htp_lat_scanin            = stp_lat_scanout          ;
assign spares_scanin             = htp_lat_scanout          ;
assign scan_out                  = spares_scanout           ;

assign hwtw_config_0_lat_wmr_scanin = wmr_scan_in              ;
assign hwtw_config_1_lat_wmr_scanin = hwtw_config_0_lat_wmr_scanout;
assign hwtw_config_2_lat_wmr_scanin = hwtw_config_1_lat_wmr_scanout;
assign hwtw_config_3_lat_wmr_scanin = hwtw_config_2_lat_wmr_scanout;
assign hwtw_config_4_lat_wmr_scanin = hwtw_config_3_lat_wmr_scanout;
assign hwtw_config_5_lat_wmr_scanin = hwtw_config_4_lat_wmr_scanout;
assign hwtw_config_6_lat_wmr_scanin = hwtw_config_5_lat_wmr_scanout;
assign hwtw_config_7_lat_wmr_scanin = hwtw_config_6_lat_wmr_scanout;
assign hw_tw_e_lat_wmr_scanin    = hwtw_config_7_lat_wmr_scanout;
assign wmr_scan_out              = hw_tw_e_lat_wmr_scanout  ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module mmu_asi_ctl_l1clkhdr_ctl_macro (
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

module mmu_asi_ctl_msff_ctl_macro__width_1 (
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













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_5 (
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

module mmu_asi_ctl_msff_ctl_macro__width_8 (
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

module mmu_asi_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_24 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = din[23:0];






dff #(24)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[23:0]),
.si({scan_in,so[22:0]}),
.so({so[22:0],scan_out}),
.q(dout[23:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_64 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [63:0] fdin;
wire [62:0] so;

  input [63:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [63:0] dout;
  output scan_out;
assign fdin[63:0] = din[63:0];






dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_15 (
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

module mmu_asi_ctl_msff_ctl_macro__width_6 (
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

module mmu_asi_ctl_msff_ctl_macro__width_4 (
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

module mmu_asi_ctl_msff_ctl_macro__width_16 (
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

module mmu_asi_ctl_msff_ctl_macro__width_3 (
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

module mmu_asi_ctl_msff_ctl_macro__width_65 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [64:0] fdin;
wire [63:0] so;

  input [64:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [64:0] dout;
  output scan_out;
assign fdin[64:0] = din[64:0];






dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_25 (
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

module mmu_asi_ctl_msff_ctl_macro__width_32 (
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

module mmu_asi_ctl_msff_ctl_macro__width_12 (
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

module mmu_asi_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mmu_asi_ctl_msff_ctl_macro__width_11 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = din[10:0];






dff #(11)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[10:0]),
.si({scan_in,so[9:0]}),
.so({so[9:0],scan_out}),
.q(dout[10:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mmu_asi_ctl_spare_ctl_macro__num_12 (
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
wire si_6;
wire so_6;
wire spare6_flop_unused;
wire spare6_buf_32x_unused;
wire spare6_nand3_8x_unused;
wire spare6_inv_8x_unused;
wire spare6_aoi22_4x_unused;
wire spare6_buf_8x_unused;
wire spare6_oai22_4x_unused;
wire spare6_inv_16x_unused;
wire spare6_nand2_16x_unused;
wire spare6_nor3_4x_unused;
wire spare6_nand2_8x_unused;
wire spare6_buf_16x_unused;
wire spare6_nor2_16x_unused;
wire spare6_inv_32x_unused;
wire si_7;
wire so_7;
wire spare7_flop_unused;
wire spare7_buf_32x_unused;
wire spare7_nand3_8x_unused;
wire spare7_inv_8x_unused;
wire spare7_aoi22_4x_unused;
wire spare7_buf_8x_unused;
wire spare7_oai22_4x_unused;
wire spare7_inv_16x_unused;
wire spare7_nand2_16x_unused;
wire spare7_nor3_4x_unused;
wire spare7_nand2_8x_unused;
wire spare7_buf_16x_unused;
wire spare7_nor2_16x_unused;
wire spare7_inv_32x_unused;
wire si_8;
wire so_8;
wire spare8_flop_unused;
wire spare8_buf_32x_unused;
wire spare8_nand3_8x_unused;
wire spare8_inv_8x_unused;
wire spare8_aoi22_4x_unused;
wire spare8_buf_8x_unused;
wire spare8_oai22_4x_unused;
wire spare8_inv_16x_unused;
wire spare8_nand2_16x_unused;
wire spare8_nor3_4x_unused;
wire spare8_nand2_8x_unused;
wire spare8_buf_16x_unused;
wire spare8_nor2_16x_unused;
wire spare8_inv_32x_unused;
wire si_9;
wire so_9;
wire spare9_flop_unused;
wire spare9_buf_32x_unused;
wire spare9_nand3_8x_unused;
wire spare9_inv_8x_unused;
wire spare9_aoi22_4x_unused;
wire spare9_buf_8x_unused;
wire spare9_oai22_4x_unused;
wire spare9_inv_16x_unused;
wire spare9_nand2_16x_unused;
wire spare9_nor3_4x_unused;
wire spare9_nand2_8x_unused;
wire spare9_buf_16x_unused;
wire spare9_nor2_16x_unused;
wire spare9_inv_32x_unused;
wire si_10;
wire so_10;
wire spare10_flop_unused;
wire spare10_buf_32x_unused;
wire spare10_nand3_8x_unused;
wire spare10_inv_8x_unused;
wire spare10_aoi22_4x_unused;
wire spare10_buf_8x_unused;
wire spare10_oai22_4x_unused;
wire spare10_inv_16x_unused;
wire spare10_nand2_16x_unused;
wire spare10_nor3_4x_unused;
wire spare10_nand2_8x_unused;
wire spare10_buf_16x_unused;
wire spare10_nor2_16x_unused;
wire spare10_inv_32x_unused;
wire si_11;
wire so_11;
wire spare11_flop_unused;
wire spare11_buf_32x_unused;
wire spare11_nand3_8x_unused;
wire spare11_inv_8x_unused;
wire spare11_aoi22_4x_unused;
wire spare11_buf_8x_unused;
wire spare11_oai22_4x_unused;
wire spare11_inv_16x_unused;
wire spare11_nand2_16x_unused;
wire spare11_nor3_4x_unused;
wire spare11_nand2_8x_unused;
wire spare11_buf_16x_unused;
wire spare11_nor2_16x_unused;
wire spare11_inv_32x_unused;


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

cl_sc1_msff_8x spare6_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_6),
                               .so(so_6),
                               .d(1'b0),
                               .q(spare6_flop_unused));
assign si_6 = so_5;

cl_u1_buf_32x   spare6_buf_32x (.in(1'b1),
                                   .out(spare6_buf_32x_unused));
cl_u1_nand3_8x spare6_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare6_nand3_8x_unused));
cl_u1_inv_8x    spare6_inv_8x (.in(1'b1),
                                  .out(spare6_inv_8x_unused));
cl_u1_aoi22_4x spare6_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_aoi22_4x_unused));
cl_u1_buf_8x    spare6_buf_8x (.in(1'b1),
                                  .out(spare6_buf_8x_unused));
cl_u1_oai22_4x spare6_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare6_oai22_4x_unused));
cl_u1_inv_16x   spare6_inv_16x (.in(1'b1),
                                   .out(spare6_inv_16x_unused));
cl_u1_nand2_16x spare6_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare6_nand2_16x_unused));
cl_u1_nor3_4x spare6_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare6_nor3_4x_unused));
cl_u1_nand2_8x spare6_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare6_nand2_8x_unused));
cl_u1_buf_16x   spare6_buf_16x (.in(1'b1),
                                   .out(spare6_buf_16x_unused));
cl_u1_nor2_16x spare6_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare6_nor2_16x_unused));
cl_u1_inv_32x   spare6_inv_32x (.in(1'b1),
                                   .out(spare6_inv_32x_unused));

cl_sc1_msff_8x spare7_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_7),
                               .so(so_7),
                               .d(1'b0),
                               .q(spare7_flop_unused));
assign si_7 = so_6;

cl_u1_buf_32x   spare7_buf_32x (.in(1'b1),
                                   .out(spare7_buf_32x_unused));
cl_u1_nand3_8x spare7_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare7_nand3_8x_unused));
cl_u1_inv_8x    spare7_inv_8x (.in(1'b1),
                                  .out(spare7_inv_8x_unused));
cl_u1_aoi22_4x spare7_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_aoi22_4x_unused));
cl_u1_buf_8x    spare7_buf_8x (.in(1'b1),
                                  .out(spare7_buf_8x_unused));
cl_u1_oai22_4x spare7_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare7_oai22_4x_unused));
cl_u1_inv_16x   spare7_inv_16x (.in(1'b1),
                                   .out(spare7_inv_16x_unused));
cl_u1_nand2_16x spare7_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare7_nand2_16x_unused));
cl_u1_nor3_4x spare7_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare7_nor3_4x_unused));
cl_u1_nand2_8x spare7_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare7_nand2_8x_unused));
cl_u1_buf_16x   spare7_buf_16x (.in(1'b1),
                                   .out(spare7_buf_16x_unused));
cl_u1_nor2_16x spare7_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare7_nor2_16x_unused));
cl_u1_inv_32x   spare7_inv_32x (.in(1'b1),
                                   .out(spare7_inv_32x_unused));

cl_sc1_msff_8x spare8_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_8),
                               .so(so_8),
                               .d(1'b0),
                               .q(spare8_flop_unused));
assign si_8 = so_7;

cl_u1_buf_32x   spare8_buf_32x (.in(1'b1),
                                   .out(spare8_buf_32x_unused));
cl_u1_nand3_8x spare8_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare8_nand3_8x_unused));
cl_u1_inv_8x    spare8_inv_8x (.in(1'b1),
                                  .out(spare8_inv_8x_unused));
cl_u1_aoi22_4x spare8_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_aoi22_4x_unused));
cl_u1_buf_8x    spare8_buf_8x (.in(1'b1),
                                  .out(spare8_buf_8x_unused));
cl_u1_oai22_4x spare8_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare8_oai22_4x_unused));
cl_u1_inv_16x   spare8_inv_16x (.in(1'b1),
                                   .out(spare8_inv_16x_unused));
cl_u1_nand2_16x spare8_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare8_nand2_16x_unused));
cl_u1_nor3_4x spare8_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare8_nor3_4x_unused));
cl_u1_nand2_8x spare8_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare8_nand2_8x_unused));
cl_u1_buf_16x   spare8_buf_16x (.in(1'b1),
                                   .out(spare8_buf_16x_unused));
cl_u1_nor2_16x spare8_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare8_nor2_16x_unused));
cl_u1_inv_32x   spare8_inv_32x (.in(1'b1),
                                   .out(spare8_inv_32x_unused));

cl_sc1_msff_8x spare9_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_9),
                               .so(so_9),
                               .d(1'b0),
                               .q(spare9_flop_unused));
assign si_9 = so_8;

cl_u1_buf_32x   spare9_buf_32x (.in(1'b1),
                                   .out(spare9_buf_32x_unused));
cl_u1_nand3_8x spare9_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare9_nand3_8x_unused));
cl_u1_inv_8x    spare9_inv_8x (.in(1'b1),
                                  .out(spare9_inv_8x_unused));
cl_u1_aoi22_4x spare9_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_aoi22_4x_unused));
cl_u1_buf_8x    spare9_buf_8x (.in(1'b1),
                                  .out(spare9_buf_8x_unused));
cl_u1_oai22_4x spare9_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare9_oai22_4x_unused));
cl_u1_inv_16x   spare9_inv_16x (.in(1'b1),
                                   .out(spare9_inv_16x_unused));
cl_u1_nand2_16x spare9_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare9_nand2_16x_unused));
cl_u1_nor3_4x spare9_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare9_nor3_4x_unused));
cl_u1_nand2_8x spare9_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare9_nand2_8x_unused));
cl_u1_buf_16x   spare9_buf_16x (.in(1'b1),
                                   .out(spare9_buf_16x_unused));
cl_u1_nor2_16x spare9_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare9_nor2_16x_unused));
cl_u1_inv_32x   spare9_inv_32x (.in(1'b1),
                                   .out(spare9_inv_32x_unused));

cl_sc1_msff_8x spare10_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_10),
                               .so(so_10),
                               .d(1'b0),
                               .q(spare10_flop_unused));
assign si_10 = so_9;

cl_u1_buf_32x   spare10_buf_32x (.in(1'b1),
                                   .out(spare10_buf_32x_unused));
cl_u1_nand3_8x spare10_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare10_nand3_8x_unused));
cl_u1_inv_8x    spare10_inv_8x (.in(1'b1),
                                  .out(spare10_inv_8x_unused));
cl_u1_aoi22_4x spare10_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_aoi22_4x_unused));
cl_u1_buf_8x    spare10_buf_8x (.in(1'b1),
                                  .out(spare10_buf_8x_unused));
cl_u1_oai22_4x spare10_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare10_oai22_4x_unused));
cl_u1_inv_16x   spare10_inv_16x (.in(1'b1),
                                   .out(spare10_inv_16x_unused));
cl_u1_nand2_16x spare10_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare10_nand2_16x_unused));
cl_u1_nor3_4x spare10_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare10_nor3_4x_unused));
cl_u1_nand2_8x spare10_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare10_nand2_8x_unused));
cl_u1_buf_16x   spare10_buf_16x (.in(1'b1),
                                   .out(spare10_buf_16x_unused));
cl_u1_nor2_16x spare10_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare10_nor2_16x_unused));
cl_u1_inv_32x   spare10_inv_32x (.in(1'b1),
                                   .out(spare10_inv_32x_unused));

cl_sc1_msff_8x spare11_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_11),
                               .so(so_11),
                               .d(1'b0),
                               .q(spare11_flop_unused));
assign si_11 = so_10;

cl_u1_buf_32x   spare11_buf_32x (.in(1'b1),
                                   .out(spare11_buf_32x_unused));
cl_u1_nand3_8x spare11_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare11_nand3_8x_unused));
cl_u1_inv_8x    spare11_inv_8x (.in(1'b1),
                                  .out(spare11_inv_8x_unused));
cl_u1_aoi22_4x spare11_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_aoi22_4x_unused));
cl_u1_buf_8x    spare11_buf_8x (.in(1'b1),
                                  .out(spare11_buf_8x_unused));
cl_u1_oai22_4x spare11_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare11_oai22_4x_unused));
cl_u1_inv_16x   spare11_inv_16x (.in(1'b1),
                                   .out(spare11_inv_16x_unused));
cl_u1_nand2_16x spare11_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare11_nand2_16x_unused));
cl_u1_nor3_4x spare11_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare11_nor3_4x_unused));
cl_u1_nand2_8x spare11_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare11_nand2_8x_unused));
cl_u1_buf_16x   spare11_buf_16x (.in(1'b1),
                                   .out(spare11_buf_16x_unused));
cl_u1_nor2_16x spare11_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare11_nor2_16x_unused));
cl_u1_inv_32x   spare11_inv_32x (.in(1'b1),
                                   .out(spare11_inv_32x_unused));
assign scan_out = so_11;



endmodule

