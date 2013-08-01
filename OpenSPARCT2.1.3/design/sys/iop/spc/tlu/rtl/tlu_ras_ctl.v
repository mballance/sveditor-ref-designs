// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_ras_ctl.v
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
module tlu_ras_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  spc_aclk_wmr, 
  wmr_scan_in, 
  lsu_tlu_pmen, 
  ftu_excp_way_d, 
  ftu_excp_tid_d, 
  ftu_excp_way_valid_d, 
  dec_exc0_m, 
  dec_exc1_m, 
  dec_icache_perr_m, 
  dec_tid0_m, 
  dec_tid1_m, 
  dec_inst_valid_m, 
  dec_fgu_inst_m, 
  dec_lsu_inst_m, 
  dec_flush_b, 
  fls_irf_cecc_b, 
  fls_irf_uecc_b, 
  fls_kill_irf_ecc_w, 
  exu0_ecc_addr_m, 
  exu1_ecc_addr_m, 
  exu0_ecc_check_m, 
  exu1_ecc_check_m, 
  fls_f_cecc_w, 
  fls_f_uecc_w, 
  fgu_ecc_addr_fx2, 
  fgu_ecc_check_fx2, 
  fgu_pdist_beat2_fx1, 
  lsu_tlu_twocycle_m, 
  lsu_block_store_b, 
  fls_load_dsfar, 
  fls_ipe_dme_request, 
  lsu_dttp_err_b, 
  lsu_dtdp_err_b, 
  lsu_dtmh_err_b, 
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
  cel_tccp, 
  cel_tcup, 
  cel_syndrome, 
  tlu_tca_tid, 
  tlu_tca_index, 
  tlu_tsac, 
  tlu_tsau, 
  asi_tsac, 
  asi_tsau, 
  asi_tsacu_tid, 
  tlu_tccd, 
  tlu_tcud, 
  tlu_tca_index_0, 
  tlu_tca_index_1, 
  tsd_pc_0_w, 
  tsd_pc_1_w, 
  fls_flush, 
  fls_disrupting_flush_w, 
  trl_gl0, 
  trl_gl1, 
  trl_gl2, 
  trl_gl3, 
  trl_gl4, 
  trl_gl5, 
  trl_gl6, 
  trl_gl7, 
  mmu_asi_cecc, 
  mmu_asi_uecc, 
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
  spu_tlu_mamu_err_req_v, 
  spu_tlu_mamu_err_req, 
  spu_tlu_ma_int_req, 
  spu_tlu_cwq_int_req, 
  spu_tlu_l2_error, 
  cxi_l2_soc_sre, 
  cxi_l2_soc_err_type, 
  cxi_l2_soc_tid, 
  cxi_l2_err, 
  cxi_soc_err, 
  asi_rd_isfsr, 
  asi_rd_dsfsr, 
  asi_rd_dsfar, 
  asi_rd_desr, 
  asi_rd_fesr, 
  asi_rd_tid, 
  asi_wr_isfsr, 
  asi_wr_dsfsr, 
  asi_wr_data, 
  dfd_desr_f, 
  dfd_desr_s, 
  dfd_fesr_f, 
  dfd_fesr_priv_0, 
  dfd_fesr_priv_1, 
  dfd_fesr_priv_2, 
  dfd_fesr_priv_3, 
  dfd_fesr_priv_4, 
  dfd_fesr_priv_5, 
  dfd_fesr_priv_6, 
  dfd_fesr_priv_7, 
  wmr_scan_out, 
  scan_out, 
  ras_asi_data, 
  ras_dsfar_0, 
  ras_dsfar_1, 
  ras_dsfar_2, 
  ras_dsfar_3, 
  ras_dsfar_4, 
  ras_dsfar_5, 
  ras_dsfar_6, 
  ras_dsfar_7, 
  ras_dsfar_sel_lsu_va, 
  ras_dsfar_sel_ras, 
  ras_dsfar_sel_tsa, 
  ras_rd_dsfar, 
  ras_desr_et_0, 
  ras_desr_et_1, 
  ras_desr_et_2, 
  ras_desr_et_3, 
  ras_desr_et_4, 
  ras_desr_et_5, 
  ras_desr_et_6, 
  ras_desr_et_7, 
  ras_desr_ea_0, 
  ras_desr_ea_1, 
  ras_desr_ea_2, 
  ras_desr_ea_3, 
  ras_desr_ea_4, 
  ras_desr_ea_5, 
  ras_desr_ea_6, 
  ras_desr_ea_7, 
  ras_desr_me_0, 
  ras_desr_me_1, 
  ras_desr_me_2, 
  ras_desr_me_3, 
  ras_desr_me_4, 
  ras_desr_me_5, 
  ras_desr_me_6, 
  ras_desr_me_7, 
  ras_desr_en, 
  ras_write_desr_1st, 
  ras_write_desr_2nd, 
  ras_rd_desr, 
  ras_fesr_et_0, 
  ras_fesr_et_1, 
  ras_fesr_et_2, 
  ras_fesr_et_3, 
  ras_fesr_et_4, 
  ras_fesr_et_5, 
  ras_fesr_et_6, 
  ras_fesr_et_7, 
  ras_fesr_ea_0, 
  ras_fesr_ea_1, 
  ras_fesr_ea_2, 
  ras_fesr_ea_3, 
  ras_fesr_ea_4, 
  ras_fesr_ea_5, 
  ras_fesr_ea_6, 
  ras_fesr_ea_7, 
  ras_fesr_en, 
  ras_write_fesr, 
  ras_fesr_priv, 
  ras_update_priv, 
  ras_rd_fesr, 
  ras_precise_error, 
  ras_disrupting_error, 
  ras_deferred_error);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire l1en_any_b2w;
wire [1:0] inst_valid_b;
wire w_en;
wire w1_en;
wire l1clk_pm1;
wire l1en_pm2;
wire excp_way_valid;
wire l1clk_pm2;
wire [1:0] twocycle_inst_m;
wire twocycle_inst_b_lat_scanin;
wire twocycle_inst_b_lat_scanout;
wire [1:0] ptwocycle_inst_b;
wire [1:0] twocycle_inst_b;
wire [1:0] fgu_inst_b;
wire [1:0] inst_valid_m;
wire inst_valid_b_lat_scanin;
wire inst_valid_b_lat_scanout;
wire w_en_in;
wire w_en_lat_scanin;
wire w_en_lat_scanout;
wire w1_en_lat_scanin;
wire w1_en_lat_scanout;
wire [1:0] flush_b;
wire [7:0] tid_dec_b;
wire [1:0] inst_valid_w_in;
wire inst_valid_w_lat_scanin;
wire inst_valid_w_lat_scanout;
wire [1:0] pre_inst_valid_w;
wire [7:0] block_store_w_in;
wire block_store_w_lat_scanin;
wire block_store_w_lat_scanout;
wire [7:0] pblock_store_w;
wire [7:0] block_store_w;
wire seen_bsee;
wire [1:0] inst_valid_w;
wire [1:0] tid1_m;
wire [1:0] tid1_b;
wire tid1_b_lat_scanin;
wire tid1_b_lat_scanout;
wire [1:0] tid0_m;
wire [1:0] tid0_b;
wire tid0_b_lat_scanin;
wire tid0_b_lat_scanout;
wire tid1_w_lat_scanin;
wire tid1_w_lat_scanout;
wire [1:0] tid1_w;
wire tid0_w_lat_scanin;
wire tid0_w_lat_scanout;
wire [1:0] tid0_w;
wire [7:0] tid_dec_w;
wire [1:0] fgu_inst_m;
wire fgu_inst_b_lat_scanin;
wire fgu_inst_b_lat_scanout;
wire fgu_inst_w_lat_scanin;
wire fgu_inst_w_lat_scanout;
wire [1:0] pfgu_inst_w;
wire [1:0] fgu_inst_w;
wire [1:0] lsu_inst_m;
wire lsu_inst_b_lat_scanin;
wire lsu_inst_b_lat_scanout;
wire [1:0] lsu_inst_b;
wire [1:0] ittp_m;
wire [1:0] ittm_m;
wire [1:0] itdp_m;
wire [1:0] icl2u_m;
wire [1:0] icl2nd_m;
wire [2:0] i_isfsr1_m;
wire [2:0] i_isfsr0_m;
wire i_isfsr1_b_lat_scanin;
wire i_isfsr1_b_lat_scanout;
wire [2:0] i_isfsr1_b;
wire i_isfsr0_b_lat_scanin;
wire i_isfsr0_b_lat_scanout;
wire [2:0] i_isfsr0_b;
wire [1:0] icvp_m;
wire [1:0] ictp_m;
wire [1:0] ictm_m;
wire [1:0] icl2c_m;
wire [1:0] icdp_m;
wire [3:0] i_desr1_m;
wire [3:0] i_desr0_m;
wire i_desr1_b_lat_scanin;
wire i_desr1_b_lat_scanout;
wire [3:0] i_desr1_b;
wire i_desr0_b_lat_scanin;
wire i_desr0_b_lat_scanout;
wire [3:0] i_desr0_b;
wire irf0_ecc_addr_b_lat_scanin;
wire irf0_ecc_addr_b_lat_scanout;
wire [4:0] irf0_ecc_addr_b;
wire irf1_ecc_addr_b_lat_scanin;
wire irf1_ecc_addr_b_lat_scanout;
wire [4:0] irf1_ecc_addr_b;
wire irf0_ecc_check_b_lat_scanin;
wire irf0_ecc_check_b_lat_scanout;
wire [7:0] irf0_ecc_check_b;
wire irf1_ecc_check_b_lat_scanin;
wire irf1_ecc_check_b_lat_scanout;
wire [7:0] irf1_ecc_check_b;
wire i_isfsr1_w_lat_scanin;
wire i_isfsr1_w_lat_scanout;
wire [2:0] i_isfsr1_w;
wire i_isfsr0_w_lat_scanin;
wire i_isfsr0_w_lat_scanout;
wire [2:0] i_isfsr0_w;
wire i_desr1_w_lat_scanin;
wire i_desr1_w_lat_scanout;
wire [3:0] i_desr1_w;
wire i_desr0_w_lat_scanin;
wire i_desr0_w_lat_scanout;
wire [3:0] i_desr0_w;
wire [1:0] irfu_b;
wire [1:0] irfc_b;
wire [1:0] dtmh_b;
wire [1:0] dttp_b;
wire [1:0] dtdp_b;
wire irfu_w_lat_scanin;
wire irfu_w_lat_scanout;
wire [1:0] pirfu_w;
wire [1:0] irfu_w;
wire irfc_w_lat_scanin;
wire irfc_w_lat_scanout;
wire [1:0] pirfc_w;
wire [1:0] irfc_w;
wire [1:0] pfrfu_w;
wire [1:0] pfrfc_w;
wire [1:0] frfu_w;
wire [1:0] frfc_w;
wire seen_bsee_in;
wire seen_bsee_lat_scanin;
wire seen_bsee_lat_scanout;
wire dttp_w_lat_scanin;
wire dttp_w_lat_scanout;
wire [1:0] pdttp_w;
wire [1:0] dttp_w;
wire dtmh_w_lat_scanin;
wire dtmh_w_lat_scanout;
wire [1:0] pdtmh_w;
wire [1:0] dtmh_w;
wire dtdp_w_lat_scanin;
wire dtdp_w_lat_scanout;
wire [1:0] pdtdp_w;
wire [1:0] dtdp_w;
wire irf0_ecc_addr_w_lat_scanin;
wire irf0_ecc_addr_w_lat_scanout;
wire [4:0] irf0_ecc_addr_w;
wire irf1_ecc_addr_w_lat_scanin;
wire irf1_ecc_addr_w_lat_scanout;
wire [4:0] irf1_ecc_addr_w;
wire irf0_ecc_check_w_lat_scanin;
wire irf0_ecc_check_w_lat_scanout;
wire [7:0] irf0_ecc_check_w;
wire irf1_ecc_check_w_lat_scanin;
wire irf1_ecc_check_w_lat_scanout;
wire [7:0] irf1_ecc_check_w;
wire frf_ecc_addr_w_lat_scanin;
wire frf_ecc_addr_w_lat_scanout;
wire [5:0] frf_ecc_addr_w;
wire frf_ecc_check_w_lat_scanin;
wire frf_ecc_check_w_lat_scanout;
wire [13:0] frf_ecc_check_w;
wire [2:0] pipe_isfsr_7;
wire [2:0] pipe_isfsr_6;
wire [2:0] pipe_isfsr_5;
wire [2:0] pipe_isfsr_4;
wire [2:0] pipe_isfsr_3;
wire [2:0] pipe_isfsr_2;
wire [2:0] pipe_isfsr_1;
wire [2:0] pipe_isfsr_0;
wire [2:0] pipe_dsfsr1_w;
wire [2:0] pipe_dsfsr0_w;
wire [1:0] gl1_w;
wire [1:0] gl0_w;
wire [19:0] pipe_dsfar1_w;
wire [19:0] pipe_dsfar0_w;
wire [1:0] ecc_w;
wire ecc_w1_lat_scanin;
wire ecc_w1_lat_scanout;
wire [1:0] ecc_w1;
wire [1:0] tid1_w1_in;
wire tid1_w1_lat_scanin;
wire tid1_w1_lat_scanout;
wire [1:0] tid1_w1;
wire [1:0] tid0_w1_in;
wire tid0_w1_lat_scanin;
wire tid0_w1_lat_scanout;
wire [1:0] tid0_w1;
wire pipe_dsfsr1_lat_scanin;
wire pipe_dsfsr1_lat_scanout;
wire [2:0] pipe_dsfsr1;
wire pipe_dsfsr0_lat_scanin;
wire pipe_dsfsr0_lat_scanout;
wire [2:0] pipe_dsfsr0;
wire pipe_dsfar1_lat_scanin;
wire pipe_dsfar1_lat_scanout;
wire [19:0] pipe_dsfar1;
wire pipe_dsfar0_lat_scanin;
wire pipe_dsfar0_lat_scanout;
wire [19:0] pipe_dsfar0;
wire [7:0] tid_dec_w1;
wire [2:0] pipe_dsfsr_7;
wire [2:0] pipe_dsfsr_6;
wire [2:0] pipe_dsfsr_5;
wire [2:0] pipe_dsfsr_4;
wire [2:0] pipe_dsfsr_3;
wire [2:0] pipe_dsfsr_2;
wire [2:0] pipe_dsfsr_1;
wire [2:0] pipe_dsfsr_0;
wire [19:0] pipe_dsfar_7;
wire [19:0] pipe_dsfar_6;
wire [19:0] pipe_dsfar_5;
wire [19:0] pipe_dsfar_4;
wire [19:0] pipe_dsfar_3;
wire [19:0] pipe_dsfar_2;
wire [19:0] pipe_dsfar_1;
wire [19:0] pipe_dsfar_0;
wire [7:0] dsfar_sel_lsu_va_for_error;
wire load_dsfar_lat_scanin;
wire load_dsfar_lat_scanout;
wire [7:0] load_dsfar;
wire [3:0] i_desr1_w1_in;
wire [3:0] i_desr0_w1_in;
wire i_desr1_w1_lat_scanin;
wire i_desr1_w1_lat_scanout;
wire [3:0] i_desr1_w1;
wire i_desr0_w1_lat_scanin;
wire i_desr0_w1_lat_scanout;
wire [3:0] i_desr0_w1;
wire [5:0] pipe_desr_et_7;
wire [5:0] pipe_desr_et_6;
wire [5:0] pipe_desr_et_5;
wire [5:0] pipe_desr_et_4;
wire [5:0] pipe_desr_et_3;
wire [5:0] pipe_desr_et_2;
wire [5:0] pipe_desr_et_1;
wire [5:0] pipe_desr_et_0;
wire excp_way_lat_scanin;
wire excp_way_lat_scanout;
wire [2:0] excp_tid;
wire [2:0] excp_way;
wire [7:0] sel_ftu_excp_way;
wire [2:0] ic_way7_in;
wire [2:0] ic_way7;
wire [2:0] ic_way6_in;
wire [2:0] ic_way6;
wire [2:0] ic_way5_in;
wire [2:0] ic_way5;
wire [2:0] ic_way4_in;
wire [2:0] ic_way4;
wire [2:0] ic_way3_in;
wire [2:0] ic_way3;
wire [2:0] ic_way2_in;
wire [2:0] ic_way2;
wire [2:0] ic_way1_in;
wire [2:0] ic_way1;
wire [2:0] ic_way0_in;
wire [2:0] ic_way0;
wire ic_way7_lat_scanin;
wire ic_way7_lat_scanout;
wire ic_way6_lat_scanin;
wire ic_way6_lat_scanout;
wire ic_way5_lat_scanin;
wire ic_way5_lat_scanout;
wire ic_way4_lat_scanin;
wire ic_way4_lat_scanout;
wire ic_way3_lat_scanin;
wire ic_way3_lat_scanout;
wire ic_way2_lat_scanin;
wire ic_way2_lat_scanout;
wire ic_way1_lat_scanin;
wire ic_way1_lat_scanout;
wire ic_way0_lat_scanin;
wire ic_way0_lat_scanout;
wire pc_1_w1_lat_scanin;
wire pc_1_w1_lat_scanout;
wire [10:5] pc_1_w1;
wire pc_0_w1_lat_scanin;
wire pc_0_w1_lat_scanout;
wire [10:5] pc_0_w1;
wire [8:0] pipe_desr_ea_7;
wire [8:0] pipe_desr_ea_6;
wire [8:0] pipe_desr_ea_5;
wire [8:0] pipe_desr_ea_4;
wire [8:0] pipe_desr_ea_3;
wire [8:0] pipe_desr_ea_2;
wire [8:0] pipe_desr_ea_1;
wire [8:0] pipe_desr_ea_0;
wire itmu_7;
wire itmu_6;
wire itmu_5;
wire itmu_4;
wire itmu_3;
wire itmu_2;
wire itmu_1;
wire itmu_0;
wire itl2u_7;
wire itl2u_6;
wire itl2u_5;
wire itl2u_4;
wire itl2u_3;
wire itl2u_2;
wire itl2u_1;
wire itl2u_0;
wire itl2nd_7;
wire itl2nd_6;
wire itl2nd_5;
wire itl2nd_4;
wire itl2nd_3;
wire itl2nd_2;
wire itl2nd_1;
wire itl2nd_0;
wire [2:0] m_isfsr_7;
wire [2:0] m_isfsr_6;
wire [2:0] m_isfsr_5;
wire [2:0] m_isfsr_4;
wire [2:0] m_isfsr_3;
wire [2:0] m_isfsr_2;
wire [2:0] m_isfsr_1;
wire [2:0] m_isfsr_0;
wire dtmu_7;
wire dtmu_6;
wire dtmu_5;
wire dtmu_4;
wire dtmu_3;
wire dtmu_2;
wire dtmu_1;
wire dtmu_0;
wire dtl2u_7;
wire dtl2u_6;
wire dtl2u_5;
wire dtl2u_4;
wire dtl2u_3;
wire dtl2u_2;
wire dtl2u_1;
wire dtl2u_0;
wire dtl2nd_7;
wire dtl2nd_6;
wire dtl2nd_5;
wire dtl2nd_4;
wire dtl2nd_3;
wire dtl2nd_2;
wire dtl2nd_1;
wire dtl2nd_0;
wire [2:0] m_dsfsr_7;
wire [2:0] m_dsfsr_6;
wire [2:0] m_dsfsr_5;
wire [2:0] m_dsfsr_4;
wire [2:0] m_dsfsr_3;
wire [2:0] m_dsfsr_2;
wire [2:0] m_dsfsr_1;
wire [2:0] m_dsfsr_0;
wire [2:0] m_dsfar_7;
wire [2:0] m_dsfar_6;
wire [2:0] m_dsfar_5;
wire [2:0] m_dsfar_4;
wire [2:0] m_dsfar_3;
wire [2:0] m_dsfar_2;
wire [2:0] m_dsfar_1;
wire [2:0] m_dsfar_0;
wire it2lc_lat_scanin;
wire it2lc_lat_scanout;
wire [7:0] m_i_l2cerr;
wire dt2lc_lat_scanin;
wire dt2lc_lat_scanout;
wire [7:0] m_d_l2cerr;
wire itl2c_7;
wire itl2c_6;
wire itl2c_5;
wire itl2c_4;
wire itl2c_3;
wire itl2c_2;
wire itl2c_1;
wire itl2c_0;
wire dtl2c_7;
wire dtl2c_6;
wire dtl2c_5;
wire dtl2c_4;
wire dtl2c_3;
wire dtl2c_2;
wire dtl2c_1;
wire dtl2c_0;
wire [5:0] m_desr_et_7;
wire [5:0] m_desr_et_6;
wire [5:0] m_desr_et_5;
wire [5:0] m_desr_et_4;
wire [5:0] m_desr_et_3;
wire [5:0] m_desr_et_2;
wire [5:0] m_desr_et_1;
wire [5:0] m_desr_et_0;
wire [2:0] a_tid;
wire [7:0] a_dec_tid;
wire mrau;
wire scac;
wire scau;
wire tca_error_lat_scanin;
wire tca_error_lat_scanout;
wire tccp;
wire tcup;
wire [2:0] tca_tid;
wire [7:0] tca_dec_tid;
wire [3:0] a_dsfsr;
wire [3:0] tca_dsfsr;
wire [3:0] a_dsfsr_7;
wire [3:0] a_dsfsr_6;
wire [3:0] a_dsfsr_5;
wire [3:0] a_dsfsr_4;
wire [3:0] a_dsfsr_3;
wire [3:0] a_dsfsr_2;
wire [3:0] a_dsfsr_1;
wire [3:0] a_dsfsr_0;
wire [10:0] a_dsfar;
wire [10:0] tca_dsfar;
wire [10:0] a_dsfar_7;
wire [10:0] a_dsfar_6;
wire [10:0] a_dsfar_5;
wire [10:0] a_dsfar_4;
wire [10:0] a_dsfar_3;
wire [10:0] a_dsfar_2;
wire [10:0] a_dsfar_1;
wire [10:0] a_dsfar_0;
wire [7:0] ta_dec_tid;
wire [7:0] tsac;
wire [7:0] tsau;
wire [3:0] t_dsfsr_7;
wire [3:0] t_dsfsr_6;
wire [3:0] t_dsfsr_5;
wire [3:0] t_dsfsr_4;
wire [3:0] t_dsfsr_3;
wire [3:0] t_dsfsr_2;
wire [3:0] t_dsfsr_1;
wire [3:0] t_dsfsr_0;
wire l_dsfar_lat_scanin;
wire l_dsfar_lat_scanout;
wire [8:0] l_dsfar;
wire l_tid_lat_scanin;
wire l_tid_lat_scanout;
wire [2:0] l_tid;
wire dcl2c_lat_scanin;
wire dcl2c_lat_scanout;
wire dcl2c;
wire dcl2u_lat_scanin;
wire dcl2u_lat_scanout;
wire dcl2u;
wire dcl2nd_lat_scanin;
wire dcl2nd_lat_scanout;
wire dcl2nd;
wire dcsoc_lat_scanin;
wire dcsoc_lat_scanout;
wire dcsoc;
wire [7:0] l_dec_tid;
wire [2:0] l_dsfsr;
wire [2:0] l_dsfsr_7;
wire [2:0] l_dsfsr_6;
wire [2:0] l_dsfsr_5;
wire [2:0] l_dsfsr_4;
wire [2:0] l_dsfsr_3;
wire [2:0] l_dsfsr_2;
wire [2:0] l_dsfsr_1;
wire [2:0] l_dsfsr_0;
wire [8:0] l_dsfar_7;
wire [8:0] l_dsfar_6;
wire [8:0] l_dsfar_5;
wire [8:0] l_dsfar_4;
wire [8:0] l_dsfar_3;
wire [8:0] l_dsfar_2;
wire [8:0] l_dsfar_1;
wire [8:0] l_dsfar_0;
wire [5:0] l_desr_et;
wire [5:0] l_desr_et_7;
wire [5:0] l_desr_et_6;
wire [5:0] l_desr_et_5;
wire [5:0] l_desr_et_4;
wire [5:0] l_desr_et_3;
wire [5:0] l_desr_et_2;
wire [5:0] l_desr_et_1;
wire [5:0] l_desr_et_0;
wire s_dsfar_lat_scanin;
wire s_dsfar_lat_scanout;
wire [1:0] fesr_priv;
wire [2:0] s_dsfar;
wire s_tid_lat_scanin;
wire s_tid_lat_scanout;
wire [2:0] s_tid;
wire stb_flush_lat_scanin;
wire stb_flush_lat_scanout;
wire stb_flush;
wire [7:0] update_priv;
wire [7:0] s_dsfsr_dec_tid_raw;
wire sbdlc_lat_scanin;
wire sbdlc_lat_scanout;
wire sbdlc;
wire sbdlu_lat_scanin;
wire sbdlu_lat_scanout;
wire sbdlu;
wire [7:0] s_dsfsr_dec_tid;
wire [2:0] s_dsfsr;
wire [2:0] s_dsfsr_7;
wire [2:0] s_dsfsr_6;
wire [2:0] s_dsfsr_5;
wire [2:0] s_dsfsr_4;
wire [2:0] s_dsfsr_3;
wire [2:0] s_dsfsr_2;
wire [2:0] s_dsfsr_1;
wire [2:0] s_dsfsr_0;
wire [2:0] s_dsfar_7;
wire [2:0] s_dsfar_6;
wire [2:0] s_dsfar_5;
wire [2:0] s_dsfar_4;
wire [2:0] s_dsfar_3;
wire [2:0] s_dsfar_2;
wire [2:0] s_dsfar_1;
wire [2:0] s_dsfar_0;
wire [2:0] isfsr_7_new_in;
wire [2:0] isfsr_6_new_in;
wire [2:0] isfsr_5_new_in;
wire [2:0] isfsr_4_new_in;
wire [2:0] isfsr_3_new_in;
wire [2:0] isfsr_2_new_in;
wire [2:0] isfsr_1_new_in;
wire [2:0] isfsr_0_new_in;
wire [2:0] isfsr_7_in;
wire [2:0] isfsr_7;
wire [2:0] isfsr_6_in;
wire [2:0] isfsr_6;
wire [2:0] isfsr_5_in;
wire [2:0] isfsr_5;
wire [2:0] isfsr_4_in;
wire [2:0] isfsr_4;
wire [2:0] isfsr_3_in;
wire [2:0] isfsr_3;
wire [2:0] isfsr_2_in;
wire [2:0] isfsr_2;
wire [2:0] isfsr_1_in;
wire [2:0] isfsr_1;
wire [2:0] isfsr_0_in;
wire [2:0] isfsr_0;
wire [7:0] precise_i_error;
wire isfsr_7_lat_wmr_scanin;
wire isfsr_7_lat_wmr_scanout;
wire isfsr_6_lat_wmr_scanin;
wire isfsr_6_lat_wmr_scanout;
wire isfsr_5_lat_wmr_scanin;
wire isfsr_5_lat_wmr_scanout;
wire isfsr_4_lat_wmr_scanin;
wire isfsr_4_lat_wmr_scanout;
wire isfsr_3_lat_wmr_scanin;
wire isfsr_3_lat_wmr_scanout;
wire isfsr_2_lat_wmr_scanin;
wire isfsr_2_lat_wmr_scanout;
wire isfsr_1_lat_wmr_scanin;
wire isfsr_1_lat_wmr_scanout;
wire isfsr_0_lat_wmr_scanin;
wire isfsr_0_lat_wmr_scanout;
wire [3:0] dsfsr_7_new_in;
wire [3:0] dsfsr_6_new_in;
wire [3:0] dsfsr_5_new_in;
wire [3:0] dsfsr_4_new_in;
wire [3:0] dsfsr_3_new_in;
wire [3:0] dsfsr_2_new_in;
wire [3:0] dsfsr_1_new_in;
wire [3:0] dsfsr_0_new_in;
wire [3:0] dsfsr_7_in;
wire [3:0] dsfsr_7;
wire [3:0] dsfsr_6_in;
wire [3:0] dsfsr_6;
wire [3:0] dsfsr_5_in;
wire [3:0] dsfsr_5;
wire [3:0] dsfsr_4_in;
wire [3:0] dsfsr_4;
wire [3:0] dsfsr_3_in;
wire [3:0] dsfsr_3;
wire [3:0] dsfsr_2_in;
wire [3:0] dsfsr_2;
wire [3:0] dsfsr_1_in;
wire [3:0] dsfsr_1;
wire [3:0] dsfsr_0_in;
wire [3:0] dsfsr_0;
wire [7:0] precise_d_error;
wire dsfsr_7_lat_wmr_scanin;
wire dsfsr_7_lat_wmr_scanout;
wire dsfsr_6_lat_wmr_scanin;
wire dsfsr_6_lat_wmr_scanout;
wire dsfsr_5_lat_wmr_scanin;
wire dsfsr_5_lat_wmr_scanout;
wire dsfsr_4_lat_wmr_scanin;
wire dsfsr_4_lat_wmr_scanout;
wire dsfsr_3_lat_wmr_scanin;
wire dsfsr_3_lat_wmr_scanout;
wire dsfsr_2_lat_wmr_scanin;
wire dsfsr_2_lat_wmr_scanout;
wire dsfsr_1_lat_wmr_scanin;
wire dsfsr_1_lat_wmr_scanout;
wire dsfsr_0_lat_wmr_scanin;
wire dsfsr_0_lat_wmr_scanout;
wire asi_rd_ctl_lat_scanin;
wire asi_rd_ctl_lat_scanout;
wire rd_isfsr;
wire rd_dsfsr;
wire rd_dsfar;
wire rd_desr;
wire rd_fesr;
wire [2:0] rd_tid;
wire [7:0] rd_tid_dec;
wire [7:0] rd_isfsr_dec;
wire [7:0] rd_dsfsr_dec;
wire [7:0] rd_desr_dec;
wire dcvp_lat_scanin;
wire dcvp_lat_scanout;
wire dcvp;
wire dctp_lat_scanin;
wire dctp_lat_scanout;
wire dctp;
wire dctm_lat_scanin;
wire dctm_lat_scanout;
wire dctm;
wire dcdp_lat_scanin;
wire dcdp_lat_scanout;
wire dcdp;
wire [7:0] d_dec_tid;
wire [3:0] d_desr_et;
wire [3:0] d_desr_et_7;
wire [3:0] d_desr_et_6;
wire [3:0] d_desr_et_5;
wire [3:0] d_desr_et_4;
wire [3:0] d_desr_et_3;
wire [3:0] d_desr_et_2;
wire [3:0] d_desr_et_1;
wire [3:0] d_desr_et_0;
wire [8:0] d_desr_ea_7;
wire [8:0] d_desr_ea_6;
wire [8:0] d_desr_ea_5;
wire [8:0] d_desr_ea_4;
wire [8:0] d_desr_ea_3;
wire [8:0] d_desr_ea_2;
wire [8:0] d_desr_ea_1;
wire [8:0] d_desr_ea_0;
wire cxi_lat_scanin;
wire cxi_lat_scanout;
wire l2_err;
wire soc_err;
wire [1:0] c_l2_soc_err_type;
wire [2:0] c_l2_soc_tid;
wire c_l2_soc_sre;
wire [7:0] c_l2_soc_dec_tid;
wire [7:0] c_l2_err;
wire [7:0] c_soc_err;
wire [7:0] l2_dec_tid;
wire l2ch;
wire l2cs;
wire soc;
wire l2u;
wire sou;
wire l2nd;
wire [5:0] l2_desr_et;
wire [5:0] l2_desr_et_7;
wire [5:0] l2_desr_et_6;
wire [5:0] l2_desr_et_5;
wire [5:0] l2_desr_et_4;
wire [5:0] l2_desr_et_3;
wire [5:0] l2_desr_et_2;
wire [5:0] l2_desr_et_1;
wire [5:0] l2_desr_et_0;
wire sbdpc_lat_scanin;
wire sbdpc_lat_scanout;
wire sbdpc;
wire sbdpu_lat_scanin;
wire sbdpu_lat_scanout;
wire sbdpu;
wire [7:0] sb_dec_tid;
wire [5:0] s_desr_et;
wire [5:0] s_desr_et_7;
wire [5:0] s_desr_et_6;
wire [5:0] s_desr_et_5;
wire [5:0] s_desr_et_4;
wire [5:0] s_desr_et_3;
wire [5:0] s_desr_et_2;
wire [5:0] s_desr_et_1;
wire [5:0] s_desr_et_0;
wire [2:0] s_desr_ea_7;
wire [2:0] s_desr_ea_6;
wire [2:0] s_desr_ea_5;
wire [2:0] s_desr_ea_4;
wire [2:0] s_desr_ea_3;
wire [2:0] s_desr_ea_2;
wire [2:0] s_desr_ea_1;
wire [2:0] s_desr_ea_0;
wire mamu_err_lat_scanin;
wire mamu_err_lat_scanout;
wire mamu_err_v;
wire [10:0] mamu_err;
wire [7:0] mamu_dec_tid;
wire [7:0] ma_dec_tid;
wire [5:0] mamu_desr_et;
wire [5:0] mamu_desr_et_7;
wire [5:0] mamu_desr_et_6;
wire [5:0] mamu_desr_et_5;
wire [5:0] mamu_desr_et_4;
wire [5:0] mamu_desr_et_3;
wire [5:0] mamu_desr_et_2;
wire [5:0] mamu_desr_et_1;
wire [5:0] mamu_desr_et_0;
wire [10:0] mamu_desr_ea_7;
wire [10:0] mamu_desr_ea_6;
wire [10:0] mamu_desr_ea_5;
wire [10:0] mamu_desr_ea_4;
wire [10:0] mamu_desr_ea_3;
wire [10:0] mamu_desr_ea_2;
wire [10:0] mamu_desr_ea_1;
wire [10:0] mamu_desr_ea_0;
wire ma_tid_lat_scanin;
wire ma_tid_lat_scanout;
wire [2:0] ma_tid;
wire cwq_tid_lat_scanin;
wire cwq_tid_lat_scanout;
wire [2:0] cwq_tid;
wire spu_error_lat_scanin;
wire spu_error_lat_scanout;
wire [5:0] spu_error;
wire [7:0] cwq_dec_tid;
wire mal2c;
wire mal2u;
wire mal2nd;
wire cwql2c;
wire cwql2u;
wire cwql2nd;
wire [5:0] ma_desr_et;
wire [5:0] cwq_desr_et;
wire [5:0] ma_desr_et_7;
wire [5:0] ma_desr_et_6;
wire [5:0] ma_desr_et_5;
wire [5:0] ma_desr_et_4;
wire [5:0] ma_desr_et_3;
wire [5:0] ma_desr_et_2;
wire [5:0] ma_desr_et_1;
wire [5:0] ma_desr_et_0;
wire [5:0] cwq_desr_et_7;
wire [5:0] cwq_desr_et_6;
wire [5:0] cwq_desr_et_5;
wire [5:0] cwq_desr_et_4;
wire [5:0] cwq_desr_et_3;
wire [5:0] cwq_desr_et_2;
wire [5:0] cwq_desr_et_1;
wire [5:0] cwq_desr_et_0;
wire [5:0] t_desr_et_7;
wire [5:0] t_desr_et_6;
wire [5:0] t_desr_et_5;
wire [5:0] t_desr_et_4;
wire [5:0] t_desr_et_3;
wire [5:0] t_desr_et_2;
wire [5:0] t_desr_et_1;
wire [5:0] t_desr_et_0;
wire [9:0] t_desr_ea_7;
wire [9:0] t_desr_ea_6;
wire [9:0] t_desr_ea_5;
wire [9:0] t_desr_ea_4;
wire [9:0] t_desr_ea_3;
wire [9:0] t_desr_ea_2;
wire [9:0] t_desr_ea_1;
wire [9:0] t_desr_ea_0;
wire pipe_desr_exc_7;
wire pipe_desr_exc_6;
wire pipe_desr_exc_5;
wire pipe_desr_exc_4;
wire pipe_desr_exc_3;
wire pipe_desr_exc_2;
wire pipe_desr_exc_1;
wire pipe_desr_exc_0;
wire m_desr_exc_7;
wire m_desr_exc_6;
wire m_desr_exc_5;
wire m_desr_exc_4;
wire m_desr_exc_3;
wire m_desr_exc_2;
wire m_desr_exc_1;
wire m_desr_exc_0;
wire l_desr_exc_7;
wire l_desr_exc_6;
wire l_desr_exc_5;
wire l_desr_exc_4;
wire l_desr_exc_3;
wire l_desr_exc_2;
wire l_desr_exc_1;
wire l_desr_exc_0;
wire d_desr_exc_7;
wire d_desr_exc_6;
wire d_desr_exc_5;
wire d_desr_exc_4;
wire d_desr_exc_3;
wire d_desr_exc_2;
wire d_desr_exc_1;
wire d_desr_exc_0;
wire l2_desr_exc_7;
wire l2_desr_exc_6;
wire l2_desr_exc_5;
wire l2_desr_exc_4;
wire l2_desr_exc_3;
wire l2_desr_exc_2;
wire l2_desr_exc_1;
wire l2_desr_exc_0;
wire s_desr_exc_7;
wire s_desr_exc_6;
wire s_desr_exc_5;
wire s_desr_exc_4;
wire s_desr_exc_3;
wire s_desr_exc_2;
wire s_desr_exc_1;
wire s_desr_exc_0;
wire mamu_desr_exc_7;
wire mamu_desr_exc_6;
wire mamu_desr_exc_5;
wire mamu_desr_exc_4;
wire mamu_desr_exc_3;
wire mamu_desr_exc_2;
wire mamu_desr_exc_1;
wire mamu_desr_exc_0;
wire ma_desr_exc_7;
wire ma_desr_exc_6;
wire ma_desr_exc_5;
wire ma_desr_exc_4;
wire ma_desr_exc_3;
wire ma_desr_exc_2;
wire ma_desr_exc_1;
wire ma_desr_exc_0;
wire cwq_desr_exc_7;
wire cwq_desr_exc_6;
wire cwq_desr_exc_5;
wire cwq_desr_exc_4;
wire cwq_desr_exc_3;
wire cwq_desr_exc_2;
wire cwq_desr_exc_1;
wire cwq_desr_exc_0;
wire t_desr_exc_7;
wire t_desr_exc_6;
wire t_desr_exc_5;
wire t_desr_exc_4;
wire t_desr_exc_3;
wire t_desr_exc_2;
wire t_desr_exc_1;
wire t_desr_exc_0;
wire take_s_7;
wire no_desr_s_7;
wire take_s_6;
wire no_desr_s_6;
wire take_s_5;
wire no_desr_s_5;
wire take_s_4;
wire no_desr_s_4;
wire take_s_3;
wire no_desr_s_3;
wire take_s_2;
wire no_desr_s_2;
wire take_s_1;
wire no_desr_s_1;
wire take_s_0;
wire no_desr_s_0;
wire take_t_7;
wire take_t_6;
wire take_t_5;
wire take_t_4;
wire take_t_3;
wire take_t_2;
wire take_t_1;
wire take_t_0;
wire take_ma_7;
wire take_ma_6;
wire take_ma_5;
wire take_ma_4;
wire take_ma_3;
wire take_ma_2;
wire take_ma_1;
wire take_ma_0;
wire take_mamu_7;
wire take_mamu_6;
wire take_mamu_5;
wire take_mamu_4;
wire take_mamu_3;
wire take_mamu_2;
wire take_mamu_1;
wire take_mamu_0;
wire take_cwq_7;
wire take_cwq_6;
wire take_cwq_5;
wire take_cwq_4;
wire take_cwq_3;
wire take_cwq_2;
wire take_cwq_1;
wire take_cwq_0;
wire take_l2_7;
wire take_l2_6;
wire take_l2_5;
wire take_l2_4;
wire take_l2_3;
wire take_l2_2;
wire take_l2_1;
wire take_l2_0;
wire take_pipe_7;
wire take_pipe_6;
wire take_pipe_5;
wire take_pipe_4;
wire take_pipe_3;
wire take_pipe_2;
wire take_pipe_1;
wire take_pipe_0;
wire take_m_7;
wire take_m_6;
wire take_m_5;
wire take_m_4;
wire take_m_3;
wire take_m_2;
wire take_m_1;
wire take_m_0;
wire take_l_7;
wire take_l_6;
wire take_l_5;
wire take_l_4;
wire take_l_3;
wire take_l_2;
wire take_l_1;
wire take_l_0;
wire take_d_7;
wire take_d_6;
wire take_d_5;
wire take_d_4;
wire take_d_3;
wire take_d_2;
wire take_d_1;
wire take_d_0;
wire [7:0] write_desr;
wire [7:0] write_desr_s;
wire sbdiou_lat_scanin;
wire sbdiou_lat_scanout;
wire sbdiou;
wire sbapp_lat_scanin;
wire sbapp_lat_scanout;
wire sbapp;
wire [7:0] f_dec_tid;
wire [7:0] write_fesr;
wire [7:0] error_event_1_in;
wire [7:0] error_event_0_in;
wire event_1_lat_scanin;
wire event_1_lat_scanout;
wire [7:0] error_event_1;
wire event_0_lat_scanin;
wire event_0_lat_scanout;
wire [7:0] error_event_0;
wire spares_scanin;
wire spares_scanout;
wire spare0_lat_scanin;
wire spare0_lat_scanout;
wire spare0_unused;
wire spare1_lat_scanin;
wire spare1_lat_scanout;
wire spare1_unused;
wire spare2_lat_scanin;
wire spare2_lat_scanout;
wire spare2_unused;
wire spare3_lat_scanin;
wire spare3_lat_scanout;
wire spare3_unused;
wire spare4_lat_scanin;
wire spare4_lat_scanout;
wire spare4_unused;
wire spare5_lat_scanin;
wire spare5_lat_scanout;
wire spare5_unused;
wire spare6_lat_scanin;
wire spare6_lat_scanout;
wire spare6_unused;
wire spare7_lat_scanin;
wire spare7_lat_scanout;
wire spare7_unused;
wire spare8_lat_scanin;
wire spare8_lat_scanout;
wire spare8_unused;
wire spare9_lat_scanin;
wire spare9_lat_scanout;
wire spare9_unused;
wire spare10_lat_scanin;
wire spare10_lat_scanout;
wire spare10_unused;
wire spare11_lat_scanin;
wire spare11_lat_scanout;
wire spare11_unused;
wire spare12_lat_scanin;
wire spare12_lat_scanout;
wire spare12_unused;
wire spare13_lat_scanin;
wire spare13_lat_scanout;
wire spare13_unused;
wire spare14_lat_scanin;
wire spare14_lat_scanout;
wire spare14_unused;
wire spare15_lat_scanin;
wire spare15_lat_scanout;
wire spare15_unused;




input		l2clk;
input		scan_in;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		spc_aclk_wmr;		// Warm reset (non)scan
input		wmr_scan_in;

input		lsu_tlu_pmen;		// Power management

input	[2:0]	ftu_excp_way_d;
input	[2:0]	ftu_excp_tid_d;
input		ftu_excp_way_valid_d;

input	[4:0]	dec_exc0_m;
input	[4:0]	dec_exc1_m;
input	[1:0]	dec_icache_perr_m;
input	[1:0]	dec_tid0_m;
input	[1:0]	dec_tid1_m;
input	[1:0] dec_inst_valid_m;
input	[1:0] dec_fgu_inst_m;
input	[1:0] dec_lsu_inst_m;
input 	[1:0]	dec_flush_b;

input	[1:0]	fls_irf_cecc_b;
input	[1:0]	fls_irf_uecc_b;
input	[1:0]	fls_kill_irf_ecc_w;
input	[4:0]	exu0_ecc_addr_m;
input	[4:0]	exu1_ecc_addr_m;
input	[7:0]	exu0_ecc_check_m;
input	[7:0]	exu1_ecc_check_m;

input		fls_f_cecc_w;
input		fls_f_uecc_w;
input	[5:0]	fgu_ecc_addr_fx2;
input	[13:0]	fgu_ecc_check_fx2;
input		fgu_pdist_beat2_fx1;

input		lsu_tlu_twocycle_m;	// LSU takes extra cycle on this inst
input	[7:0]	lsu_block_store_b;	// LSU reads FRF for block store

input	[7:0]	fls_load_dsfar;         // Trap that loads DSFAR
input	[1:0]	fls_ipe_dme_request;	// Update DSFSR/DSFAR for IRF/FRF ECC
input		lsu_dttp_err_b;         // DTLB tag parity error
input		lsu_dtdp_err_b;         // DTLB data parity error
input		lsu_dtmh_err_b;         // DTLB data parity error 

input		lsu_dcmh_err_g;		// LSU data cache multiple hit
input		lsu_dcvp_err_g;		// LSU data cache valid parity error
input		lsu_dctp_err_g;		// LSU data cache tag parity error
input		lsu_dcdp_err_g;		// LSU data cache parity error
input		lsu_dcl2c_err_g;	// LSU data cache L2 correctable ECC
input		lsu_dcl2u_err_g;	// LSU data cache L2 uncorrectable ECC
input		lsu_dcl2nd_err_g;	// LSU data cache L2 NotData
input		lsu_dcsoc_err_g;	// LSU data cache SOC error
input	[2:0]	lsu_dcerr_tid_g;	// TID for G stage errors (above)
input	[8:0]	lsu_dcerr_sfar_g;	// Contains way and index of the error

input		lsu_sbdlc_err_g;        // STB RAW error (CE)
input		lsu_sbdlu_err_g;        // STB RAW error (UE)
input		lsu_sbdpc_err_g;        // STB read for issue data (CE)
input		lsu_sbdpu_err_g;        // STB read for issue data (UE)
input		lsu_sbapp_err_g;        // STB read for issue addr parity error
input		lsu_sbdiou_err_g;       // STB read for issue IO/ext ASI parity
input	[2:0]	lsu_stberr_tid_g;       // TID of STB error
input	[2:0]	lsu_stberr_index_g;	// Index of STB error
input	[1:0]	lsu_stberr_priv_g;	// Privilege of STB error
input		lsu_stb_flush_g;	// STB entry flushed STB (capture priv)

input		cel_tccp;		
input		cel_tcup;
input	[7:0] cel_syndrome;
input	[2:0]	tlu_tca_tid;		
input	[1:0]	tlu_tca_index;		// Index for precise TCA errors
input	[7:0]	tlu_tsac;		// Only one per TG can report tsa[cu]
input	[7:0]	tlu_tsau;
input		asi_tsac;		// ASI TSA access errors
input		asi_tsau;		
input	[2:0]	asi_tsacu_tid;		// Only one per TG can report tsa[cu]
input	[7:0]	tlu_tccd;
input	[7:0]	tlu_tcud;
input	[1:0]	tlu_tca_index_0;
input	[1:0]	tlu_tca_index_1;
input	[10:5] tsd_pc_0_w;
input	[10:5] tsd_pc_1_w;
input	[7:0]	fls_flush;
input	[1:0]	fls_disrupting_flush_w;
input	[1:0]	trl_gl0;
input	[1:0]	trl_gl1;
input	[1:0]	trl_gl2;
input	[1:0]	trl_gl3;
input	[1:0]	trl_gl4;
input	[1:0]	trl_gl5;
input	[1:0]	trl_gl6;
input	[1:0]	trl_gl7;

input 		mmu_asi_cecc; 		// Correctable ECC error on ASI read
input 		mmu_asi_uecc; 		// Uncorrectable ECC error on ASI read
input	[10:0]	mmu_asi_index;		// Syndrome and index of the failure
input		mmu_asi_mra_not_sca;	// 1: MRA error 0: Scratchpad error
input	[7:0]	mmu_i_l2cerr;
input	[7:0]	mmu_d_l2cerr;
input	[7:0]	mmu_i_eccerr;
input	[7:0]	mmu_d_eccerr;
input	[2:0]	mmu_thr0_err_type;
input	[2:0]	mmu_thr1_err_type;
input	[2:0]	mmu_thr2_err_type;
input	[2:0]	mmu_thr3_err_type;
input	[2:0]	mmu_thr4_err_type;
input	[2:0]	mmu_thr5_err_type;
input	[2:0]	mmu_thr6_err_type;
input	[2:0]	mmu_thr7_err_type;
input	[2:0]	mmu_thr0_err_index;
input	[2:0]	mmu_thr1_err_index;
input	[2:0]	mmu_thr2_err_index;
input	[2:0]	mmu_thr3_err_index;
input	[2:0]	mmu_thr4_err_index;
input	[2:0]	mmu_thr5_err_index;
input	[2:0]	mmu_thr6_err_index;
input	[2:0]	mmu_thr7_err_index;

input		spu_tlu_mamu_err_req_v;	// SPU MAMEM parity error
input	[10:0]	spu_tlu_mamu_err_req;	// SPU MAMEM index
input	[2:0]	spu_tlu_ma_int_req;	// SPU MA  2:0 thread ID
input	[2:0]	spu_tlu_cwq_int_req;	// SPU CWQ 2:0 thread ID
input	[5:0]	spu_tlu_l2_error;	// MAL2[C,U,ND],CWQL2[C,U,ND]

input		cxi_l2_soc_sre;		// software_recoverable_error
input	[1:0]	cxi_l2_soc_err_type;	// C=01, UC=10, ND=11
input	[2:0]	cxi_l2_soc_tid;
input		cxi_l2_err;		// L2 error reported
input		cxi_soc_err;		// SOC error reported

input		asi_rd_isfsr;		// ASI read control in ASI cycle 1
input		asi_rd_dsfsr;		// but actual read is in ASI cycle 2
input		asi_rd_dsfar;
input		asi_rd_desr;
input		asi_rd_fesr;
input	[2:0]	asi_rd_tid;
input	[7:0]	asi_wr_isfsr;
input	[7:0]	asi_wr_dsfsr;
input	[3:0]	asi_wr_data;

input	[7:0]	dfd_desr_f;
input	[7:0]	dfd_desr_s;
input	[7:0]	dfd_fesr_f;
input	[1:0]	dfd_fesr_priv_0;
input	[1:0]	dfd_fesr_priv_1;
input	[1:0]	dfd_fesr_priv_2;
input	[1:0]	dfd_fesr_priv_3;
input	[1:0]	dfd_fesr_priv_4;
input	[1:0]	dfd_fesr_priv_5;
input	[1:0]	dfd_fesr_priv_6;
input	[1:0]	dfd_fesr_priv_7;



output		wmr_scan_out;

output		scan_out;

output	[3:0]	ras_asi_data;

// DSFAR
output	[19:0] ras_dsfar_0;
output	[19:0] ras_dsfar_1;
output	[19:0] ras_dsfar_2;
output	[19:0] ras_dsfar_3;
output	[19:0] ras_dsfar_4;
output	[19:0] ras_dsfar_5;
output	[19:0] ras_dsfar_6;
output	[19:0] ras_dsfar_7;
output	[7:0] ras_dsfar_sel_lsu_va;
output	[7:0] ras_dsfar_sel_ras;
output	[7:0] ras_dsfar_sel_tsa;
output	[7:0] ras_rd_dsfar;

// DESRs
output	[61:56]	ras_desr_et_0;
output	[61:56]	ras_desr_et_1;
output	[61:56]	ras_desr_et_2;
output	[61:56]	ras_desr_et_3;
output	[61:56]	ras_desr_et_4;
output	[61:56]	ras_desr_et_5;
output	[61:56]	ras_desr_et_6;
output	[61:56]	ras_desr_et_7;
output	[10:0]	ras_desr_ea_0;
output	[10:0]	ras_desr_ea_1;
output	[10:0]	ras_desr_ea_2;
output	[10:0]	ras_desr_ea_3;
output	[10:0]	ras_desr_ea_4;
output	[10:0]	ras_desr_ea_5;
output	[10:0]	ras_desr_ea_6;
output	[10:0]	ras_desr_ea_7;
output		ras_desr_me_0;
output		ras_desr_me_1;
output		ras_desr_me_2;
output		ras_desr_me_3;
output		ras_desr_me_4;
output		ras_desr_me_5;
output		ras_desr_me_6;
output		ras_desr_me_7;
output	[7:0]	ras_desr_en;
output	[7:0]	ras_write_desr_1st;
output	[7:0]	ras_write_desr_2nd;
output	[7:0]	ras_rd_desr;

// FESRs
output	[61:60]	ras_fesr_et_0;
output	[61:60]	ras_fesr_et_1;
output	[61:60]	ras_fesr_et_2;
output	[61:60]	ras_fesr_et_3;
output	[61:60]	ras_fesr_et_4;
output	[61:60]	ras_fesr_et_5;
output	[61:60]	ras_fesr_et_6;
output	[61:60]	ras_fesr_et_7;
output	[59:55]	ras_fesr_ea_0;
output	[59:55]	ras_fesr_ea_1;
output	[59:55]	ras_fesr_ea_2;
output	[59:55]	ras_fesr_ea_3;
output	[59:55]	ras_fesr_ea_4;
output	[59:55]	ras_fesr_ea_5;
output	[59:55]	ras_fesr_ea_6;
output	[59:55]	ras_fesr_ea_7;
output	[7:0]	ras_fesr_en;
output	[7:0]	ras_write_fesr;
output	[59:58]	ras_fesr_priv;
output	[7:0]	ras_update_priv;
output	[7:0]	ras_rd_fesr;

output	[7:0]	ras_precise_error;	// For debug events
output	[7:0]	ras_disrupting_error;	// For debug events
output	[7:0]	ras_deferred_error;	// For debug events





//////////////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign se       = tcu_scan_en;



//////////////////////////////////////////////////////////////////////////////
// Clock header

tlu_ras_ctl_l1clkhdr_ctl_macro free_clken (
        .l2clk  (l2clk 			),
        .l1en   (1'b1			),
        .l1clk  (l1clk			),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
// Power management

assign l1en_any_b2w =
       (| {inst_valid_b[1:0], 
           lsu_block_store_b[7:0], 
           w_en, w1_en, ~lsu_tlu_pmen});

tlu_ras_ctl_l1clkhdr_ctl_macro b2w_clken (
        .l2clk  (l2clk 			),
        .l1en   (l1en_any_b2w		),
        .l1clk  (l1clk_pm1		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

assign l1en_pm2 =
       excp_way_valid | ~lsu_tlu_pmen;

tlu_ras_ctl_l1clkhdr_ctl_macro exc_way_clken (
        .l2clk  (l2clk 			),
        .l1en   (l1en_pm2		),
        .l1clk  (l1clk_pm2		),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);



//////////////////////////////////////////////////////////////////////////////
//
//  Pipe TIDs, etc. for in-pipe errors
//

assign twocycle_inst_m[1:0] =
       {2 {lsu_tlu_twocycle_m}} & dec_lsu_inst_m[1:0] & 
       dec_inst_valid_m[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 twocycle_inst_b_lat  (
	.scan_in(twocycle_inst_b_lat_scanin),
	.scan_out(twocycle_inst_b_lat_scanout),
	.din	(twocycle_inst_m	[1:0]	),
	.dout	(ptwocycle_inst_b	[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign twocycle_inst_b[1:0] =
       (ptwocycle_inst_b[1:0] | 
        ({2 {fgu_pdist_beat2_fx1}} & fgu_inst_b[1:0])) & 
       ~dec_flush_b[1:0] & 
       ~fls_irf_cecc_b[1:0] & ~fls_irf_uecc_b[1:0];

assign inst_valid_m[1:0] =
       dec_inst_valid_m[1:0] | twocycle_inst_b[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 inst_valid_b_lat  (
	.scan_in(inst_valid_b_lat_scanin),
	.scan_out(inst_valid_b_lat_scanout),
	.din	(inst_valid_m		[1:0]	),
	.dout	(inst_valid_b		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign w_en_in =
       | {inst_valid_b[1:0], lsu_block_store_b[7:0]};

tlu_ras_ctl_msff_ctl_macro__width_1 w_en_lat  (
	.scan_in(w_en_lat_scanin),
	.scan_out(w_en_lat_scanout),
	.din	(w_en_in			),
	.dout	(w_en				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 w1_en_lat  (
	.scan_in(w1_en_lat_scanin),
	.scan_out(w1_en_lat_scanout),
	.din	(w_en				),
	.dout	(w1_en				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign flush_b[1:0] =
       {(fls_flush[7] & tid_dec_b[7]) |
        (fls_flush[6] & tid_dec_b[6]) |
        (fls_flush[5] & tid_dec_b[5]) |
        (fls_flush[4] & tid_dec_b[4]),
        (fls_flush[3] & tid_dec_b[3]) |
        (fls_flush[2] & tid_dec_b[2]) |
        (fls_flush[1] & tid_dec_b[1]) |
        (fls_flush[0] & tid_dec_b[0])};

assign inst_valid_w_in[1:0] =
       inst_valid_b[1:0] & ~dec_flush_b[1:0] & ~flush_b[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 inst_valid_w_lat  (
	.scan_in(inst_valid_w_lat_scanin),
	.scan_out(inst_valid_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(inst_valid_w_in	[1:0]	),
	.dout	(pre_inst_valid_w	[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// block_store_b is not actually in B, so it can't be flushed
assign block_store_w_in[7:0] =
       lsu_block_store_b[7:0];

tlu_ras_ctl_msff_ctl_macro__width_8 block_store_w_lat  (
	.scan_in(block_store_w_lat_scanin),
	.scan_out(block_store_w_lat_scanout),
	.din	(block_store_w_in	[7:0]	),
	.dout	(pblock_store_w		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign block_store_w[7:0] =
       pblock_store_w[7:0] & ~{8 {seen_bsee}};

assign inst_valid_w[1:0] =
       pre_inst_valid_w[1:0] & ~fls_disrupting_flush_w[1:0];

assign tid1_m[1:0] =
       (dec_tid1_m[1:0] & {2 {~twocycle_inst_b[1]}}) | 
       (    tid1_b[1:0] & {2 { twocycle_inst_b[1]}}) ; 

tlu_ras_ctl_msff_ctl_macro__width_2 tid1_b_lat  (
	.scan_in(tid1_b_lat_scanin),
	.scan_out(tid1_b_lat_scanout),
	.din	(tid1_m			[1:0]	),
	.dout	(tid1_b			[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid0_m[1:0] =
       (dec_tid0_m[1:0] & {2 {~twocycle_inst_b[0]}}) | 
       (    tid0_b[1:0] & {2 { twocycle_inst_b[0]}}) ; 

tlu_ras_ctl_msff_ctl_macro__width_2 tid0_b_lat  (
	.scan_in(tid0_b_lat_scanin),
	.scan_out(tid0_b_lat_scanout),
	.din	(tid0_m			[1:0]	),
	.dout	(tid0_b			[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_b[7:0] = 
       { tid1_b[1] &  tid1_b[0],
         tid1_b[1] & ~tid1_b[0],
        ~tid1_b[1] &  tid1_b[0],
        ~tid1_b[1] & ~tid1_b[0],
         tid0_b[1] &  tid0_b[0],
         tid0_b[1] & ~tid0_b[0],
        ~tid0_b[1] &  tid0_b[0],
        ~tid0_b[1] & ~tid0_b[0]};

tlu_ras_ctl_msff_ctl_macro__width_2 tid1_w_lat  (
	.scan_in(tid1_w_lat_scanin),
	.scan_out(tid1_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tid1_b			[1:0]	),
	.dout	(tid1_w			[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_2 tid0_w_lat  (
	.scan_in(tid0_w_lat_scanin),
	.scan_out(tid0_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tid0_b			[1:0]	),
	.dout	(tid0_w			[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_w[7:0] =
       { tid1_w[1] &  tid1_w[0],
         tid1_w[1] & ~tid1_w[0],
        ~tid1_w[1] &  tid1_w[0],
        ~tid1_w[1] & ~tid1_w[0],
         tid0_w[1] &  tid0_w[0],
         tid0_w[1] & ~tid0_w[0],
        ~tid0_w[1] &  tid0_w[0],
        ~tid0_w[1] & ~tid0_w[0]} & 
       {{4 {inst_valid_w[1]}}, {4 {inst_valid_w[0]}}} | 
       block_store_w[7:0];

assign fgu_inst_m[1:0] =
       (dec_fgu_inst_m[1:0] & dec_inst_valid_m[1:0]) |
       (    fgu_inst_b[1:0] &  twocycle_inst_b[1:0]) ;

tlu_ras_ctl_msff_ctl_macro__width_2 fgu_inst_b_lat  (
	.scan_in(fgu_inst_b_lat_scanin),
	.scan_out(fgu_inst_b_lat_scanout),
	.din	(fgu_inst_m		[1:0]	),
	.dout	(fgu_inst_b		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_2 fgu_inst_w_lat  (
	.scan_in(fgu_inst_w_lat_scanin),
	.scan_out(fgu_inst_w_lat_scanout),
	.din	(fgu_inst_b		[1:0]	),
	.dout	(pfgu_inst_w		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fgu_inst_w[1:0] =
       pfgu_inst_w[1:0] | {| block_store_w[7:4], | block_store_w[3:0]};

// lsu_inst_m doesn't need twocycle stuff because TLB is only accessed once
assign lsu_inst_m[1:0] =
        dec_lsu_inst_m[1:0] & dec_inst_valid_m[1:0]  ;

tlu_ras_ctl_msff_ctl_macro__width_2 lsu_inst_b_lat  (
	.scan_in(lsu_inst_b_lat_scanin),
	.scan_out(lsu_inst_b_lat_scanout),
	.din	(lsu_inst_m		[1:0]	),
	.dout	(lsu_inst_b		[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
//  In-pipe precise errors from M to B
//

// Instruction cache and TLB errors
// The precise errors for ISFSR are encoded in the exc bits as
// ittp   5'b00111
// ittm   5'b01001
// itdp   5'b11111
// icl2u  5'b01111
// icl2nd 5'b10000
//
// but architecturally should be
// ittm		001	1
// ittp		010	2
// itdp		011	3
// icl2u	001	1
// icl2nd	010	2
//
// DESR errors from this source are 
// icl2c  5'b01110
// icvp   5'b01010
// ictp   5'b01011
// ictm   5'b01100
// icdp   5'b01101
//
// but architecturally should be
// icvp		00001	1
// ictp		00010	2
// ictm		00011	3
// icdp		00100	4
// All these have S = 0
// icl2c	00010	0
// This has S = 1

assign ittp_m[1:0] = 
       {dec_exc1_m[4:0] == 5'b00111,
 	dec_exc0_m[4:0] == 5'b00111} & 
       dec_inst_valid_m[1:0];
assign ittm_m[1:0] = 
       {dec_exc1_m[4:0] == 5'b01001,
	dec_exc0_m[4:0] == 5'b01001} & 
       dec_inst_valid_m[1:0];
assign itdp_m[1:0] =
       {dec_exc1_m[4:0] == 5'b11111,
	dec_exc0_m[4:0] == 5'b11111} & 
       dec_inst_valid_m[1:0];
assign icl2u_m[1:0] =
       {dec_exc1_m[4:0] == 5'b01111 | dec_exc1_m[4:0] == 5'b10111,
	dec_exc0_m[4:0] == 5'b01111 | dec_exc0_m[4:0] == 5'b10111} & 
       dec_inst_valid_m[1:0];
assign icl2nd_m[1:0] =
       {dec_exc1_m[4:0] == 5'b10000 | dec_exc1_m[4:0] == 5'b11000,
	dec_exc0_m[4:0] == 5'b10000 | dec_exc0_m[4:0] == 5'b11000} & 
       dec_inst_valid_m[1:0];

assign i_isfsr1_m[2:0] =
       ({3 {  ittm_m[1]}} & 3'b001) |
       ({3 {  ittp_m[1]}} & 3'b010) |
       ({3 {  itdp_m[1]}} & 3'b011) |
       ({3 { icl2u_m[1]}} & 3'b001) |
       ({3 {icl2nd_m[1]}} & 3'b010) ;

assign i_isfsr0_m[2:0] =
       ({3 {  ittm_m[0]}} & 3'b001) |
       ({3 {  ittp_m[0]}} & 3'b010) |
       ({3 {  itdp_m[0]}} & 3'b011) |
       ({3 { icl2u_m[0]}} & 3'b001) |
       ({3 {icl2nd_m[0]}} & 3'b010) ;

tlu_ras_ctl_msff_ctl_macro__width_3 i_isfsr1_b_lat  (
	.scan_in(i_isfsr1_b_lat_scanin),
	.scan_out(i_isfsr1_b_lat_scanout),
	.din	(i_isfsr1_m		[2:0]	),
	.dout	(i_isfsr1_b		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 i_isfsr0_b_lat  (
	.scan_in(i_isfsr0_b_lat_scanin),
	.scan_out(i_isfsr0_b_lat_scanout),
	.din	(i_isfsr0_m		[2:0]	),
	.dout	(i_isfsr0_b		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


assign icvp_m[1:0] = 
       {dec_exc1_m[4:0] == 5'b01010,
	dec_exc0_m[4:0] == 5'b01010} & 
       dec_inst_valid_m[1:0];
assign ictp_m[1:0] = 
       {dec_exc1_m[4:0] == 5'b01011,
	dec_exc0_m[4:0] == 5'b01011} & 
       dec_inst_valid_m[1:0];
assign ictm_m[1:0] = 
       {dec_exc1_m[4:0] == 5'b01100,
	dec_exc0_m[4:0] == 5'b01100} & 
       dec_inst_valid_m[1:0];
assign icl2c_m[1:0] =
       {dec_exc1_m[4:0] == 5'b01110 | dec_exc1_m[4:0] == 5'b11110,
	dec_exc0_m[4:0] == 5'b01110 | dec_exc0_m[4:0] == 5'b11110} & 
       dec_inst_valid_m[1:0];
assign icdp_m[1:0] = 
       dec_icache_perr_m[1:0] & ~icvp_m[1:0] & ~ictp_m[1:0] & 
       ~ictm_m[1:0] & ~ittp_m[1:0] & ~ittm_m[1:0] & ~itdp_m[1:0] &
       ~icl2c_m[1:0] &
       ~{(                  ~dec_exc1_m[2] &  dec_exc1_m[1]                  ) | 
	 (                  ~dec_exc1_m[2] &                    dec_exc1_m[0]) | 
	 (~dec_exc1_m[4] &  dec_exc1_m[2] & ~dec_exc1_m[1] & ~dec_exc1_m[0])  ,
	 (                  ~dec_exc0_m[2] &  dec_exc0_m[1]                  ) | 
	 (                  ~dec_exc0_m[2] &                    dec_exc0_m[0]) | 
	 (~dec_exc0_m[4] &  dec_exc0_m[2] & ~dec_exc0_m[1] & ~dec_exc0_m[0])  } & 
       dec_inst_valid_m[1:0];

assign i_desr1_m[3:0] = 
       ({4 {  icvp_m[1]}} & 4'b0001) |
       ({4 {  ictp_m[1]}} & 4'b0010) |
       ({4 {  ictm_m[1]}} & 4'b0011) |
       ({4 {  icdp_m[1]}} & 4'b0100) |
       ({4 { icl2c_m[1]}} & 4'b1010) ;

assign i_desr0_m[3:0] = 
       ({4 {  icvp_m[0]}} & 4'b0001) |
       ({4 {  ictp_m[0]}} & 4'b0010) |
       ({4 {  ictm_m[0]}} & 4'b0011) |
       ({4 {  icdp_m[0]}} & 4'b0100) |
       ({4 { icl2c_m[0]}} & 4'b1010) ;

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr1_b_lat  (
	.scan_in(i_desr1_b_lat_scanin),
	.scan_out(i_desr1_b_lat_scanout),
	.din	(i_desr1_m		[3:0]	),
	.dout	(i_desr1_b		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr0_b_lat  (
	.scan_in(i_desr0_b_lat_scanin),
	.scan_out(i_desr0_b_lat_scanout),
	.din	(i_desr0_m		[3:0]	),
	.dout	(i_desr0_b		[3:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



// IRF ECC errors
tlu_ras_ctl_msff_ctl_macro__width_5 irf0_ecc_addr_b_lat  (
	.scan_in(irf0_ecc_addr_b_lat_scanin),
	.scan_out(irf0_ecc_addr_b_lat_scanout),
	.din	(exu0_ecc_addr_m	[4:0]	),
	.dout	(irf0_ecc_addr_b	[4:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_5 irf1_ecc_addr_b_lat  (
	.scan_in(irf1_ecc_addr_b_lat_scanin),
	.scan_out(irf1_ecc_addr_b_lat_scanout),
	.din	(exu1_ecc_addr_m	[4:0]	),
	.dout	(irf1_ecc_addr_b	[4:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 irf0_ecc_check_b_lat  (
	.scan_in(irf0_ecc_check_b_lat_scanin),
	.scan_out(irf0_ecc_check_b_lat_scanout),
	.din	(exu0_ecc_check_m	[7:0]	),
	.dout	(irf0_ecc_check_b	[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 irf1_ecc_check_b_lat  (
	.scan_in(irf1_ecc_check_b_lat_scanin),
	.scan_out(irf1_ecc_check_b_lat_scanout),
	.din	(exu1_ecc_check_m	[7:0]	),
	.dout	(irf1_ecc_check_b	[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
//  Flop in-pipe errors from B to W
//

tlu_ras_ctl_msff_ctl_macro__width_3 i_isfsr1_w_lat  (
	.scan_in(i_isfsr1_w_lat_scanin),
	.scan_out(i_isfsr1_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_isfsr1_b		[2:0]	),
	.dout	(i_isfsr1_w		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 i_isfsr0_w_lat  (
	.scan_in(i_isfsr0_w_lat_scanin),
	.scan_out(i_isfsr0_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_isfsr0_b		[2:0]	),
	.dout	(i_isfsr0_w		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr1_w_lat  (
	.scan_in(i_desr1_w_lat_scanin),
	.scan_out(i_desr1_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_desr1_b		[3:0]	),
	.dout	(i_desr1_w		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr0_w_lat  (
	.scan_in(i_desr0_w_lat_scanin),
	.scan_out(i_desr0_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_desr0_b		[3:0]	),
	.dout	(i_desr0_w		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);


//
// Encodings for DSFSR errors
// irfu		0001	1
// irfc 	0010	2
// frfu		0011	3
// frfc		0100	4
// dtmh		0001	1
// dttp		0010	2
// dtdp		0011	3

assign irfu_b[1:0] =
       fls_irf_uecc_b[1:0] & inst_valid_b[1:0];
assign irfc_b[1:0] =
       fls_irf_cecc_b[1:0] & inst_valid_b[1:0];

assign dtmh_b[1:0] =
       ~irfu_b[1:0] & ~irfc_b[1:0] & 
       {2 {lsu_dtmh_err_b}} & 
       lsu_inst_b[1:0] & inst_valid_b[1:0];
assign dttp_b[1:0] =
       ~irfu_b[1:0] & ~irfc_b[1:0] & 
       {2 {~lsu_dtmh_err_b & lsu_dttp_err_b}} & lsu_inst_b[1:0] & 
       inst_valid_b[1:0];
assign dtdp_b[1:0] =
       ~irfu_b[1:0] & ~irfc_b[1:0] & 
       {2 {~lsu_dttp_err_b & ~lsu_dtmh_err_b & lsu_dtdp_err_b}} & 
       lsu_inst_b[1:0] & inst_valid_b[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 irfu_w_lat  (
	.scan_in(irfu_w_lat_scanin),
	.scan_out(irfu_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irfu_b			[1:0]	),
	.dout	(pirfu_w		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign irfu_w[1:0] =
       pirfu_w[1:0] & ~fls_kill_irf_ecc_w[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 irfc_w_lat  (
	.scan_in(irfc_w_lat_scanin),
	.scan_out(irfc_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irfc_b			[1:0]	),
	.dout	(pirfc_w		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign irfc_w[1:0] =
       pirfc_w[1:0] & ~fls_kill_irf_ecc_w[1:0];

assign pfrfu_w[1:0] = 
       {2 {fls_f_uecc_w}} & fgu_inst_w[1:0];

assign pfrfc_w[1:0] = 
       {2 {fls_f_cecc_w}} & fgu_inst_w[1:0];

assign frfu_w[1:0] =
       pfrfu_w[1:0] & 
       ((inst_valid_w[1:0] &
         ~irfu_w[1:0] & ~irfc_w[1:0]) |
	{| block_store_w[7:4], | block_store_w[3:0]});

assign frfc_w[1:0] =
       pfrfc_w[1:0] & 
       ((inst_valid_w[1:0] &
         ~irfu_w[1:0] & ~irfc_w[1:0]) |
	{| block_store_w[7:4], | block_store_w[3:0]});


// Only capture first FGU ECC error on block store
assign seen_bsee_in =
       (| ((pfrfu_w[1:0] | pfrfc_w[1:0]) & 
           {| block_store_w[7:4], | block_store_w[3:0]})) |
       (seen_bsee & (| pblock_store_w[7:0]));
       
tlu_ras_ctl_msff_ctl_macro__width_1 seen_bsee_lat  (
	.scan_in(seen_bsee_lat_scanin),
	.scan_out(seen_bsee_lat_scanout),
	.din	(seen_bsee_in			),
	.dout	(seen_bsee			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);


tlu_ras_ctl_msff_ctl_macro__width_2 dttp_w_lat  (
	.scan_in(dttp_w_lat_scanin),
	.scan_out(dttp_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(dttp_b			[1:0]	),
	.dout	(pdttp_w		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign dttp_w[1:0] =
       pdttp_w[1:0] & ~pfrfc_w[1:0] & ~pfrfu_w[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 dtmh_w_lat  (
	.scan_in(dtmh_w_lat_scanin),
	.scan_out(dtmh_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(dtmh_b			[1:0]	),
	.dout	(pdtmh_w		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign dtmh_w[1:0] =
       pdtmh_w[1:0] & ~pfrfc_w[1:0] & ~pfrfu_w[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 dtdp_w_lat  (
	.scan_in(dtdp_w_lat_scanin),
	.scan_out(dtdp_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(dtdp_b			[1:0]	),
	.dout	(pdtdp_w		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign dtdp_w[1:0] =
       pdtdp_w[1:0] & ~pfrfc_w[1:0] & ~pfrfu_w[1:0];

tlu_ras_ctl_msff_ctl_macro__width_5 irf0_ecc_addr_w_lat  (
	.scan_in(irf0_ecc_addr_w_lat_scanin),
	.scan_out(irf0_ecc_addr_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irf0_ecc_addr_b	[4:0]	),
	.dout	(irf0_ecc_addr_w	[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_5 irf1_ecc_addr_w_lat  (
	.scan_in(irf1_ecc_addr_w_lat_scanin),
	.scan_out(irf1_ecc_addr_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irf1_ecc_addr_b	[4:0]	),
	.dout	(irf1_ecc_addr_w	[4:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 irf0_ecc_check_w_lat  (
	.scan_in(irf0_ecc_check_w_lat_scanin),
	.scan_out(irf0_ecc_check_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irf0_ecc_check_b	[7:0]	),
	.dout	(irf0_ecc_check_w	[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 irf1_ecc_check_w_lat  (
	.scan_in(irf1_ecc_check_w_lat_scanin),
	.scan_out(irf1_ecc_check_w_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(irf1_ecc_check_b	[7:0]	),
	.dout	(irf1_ecc_check_w	[7:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_6 frf_ecc_addr_w_lat  (
	.scan_in(frf_ecc_addr_w_lat_scanin),
	.scan_out(frf_ecc_addr_w_lat_scanout),
	.din	(fgu_ecc_addr_fx2	[5:0]	),
	.dout	(frf_ecc_addr_w		[5:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_14 frf_ecc_check_w_lat  (
	.scan_in(frf_ecc_check_w_lat_scanin),
	.scan_out(frf_ecc_check_w_lat_scanout),
	.din	(fgu_ecc_check_fx2	[13:0]	),
	.dout	(frf_ecc_check_w	[13:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



// Decode in-pipe errors at W

assign pipe_isfsr_7[2:0] =
       i_isfsr1_w[2:0] & {3 {tid_dec_w[7]}};
assign pipe_isfsr_6[2:0] =
       i_isfsr1_w[2:0] & {3 {tid_dec_w[6]}};
assign pipe_isfsr_5[2:0] =
       i_isfsr1_w[2:0] & {3 {tid_dec_w[5]}};
assign pipe_isfsr_4[2:0] =
       i_isfsr1_w[2:0] & {3 {tid_dec_w[4]}};
assign pipe_isfsr_3[2:0] =
       i_isfsr0_w[2:0] & {3 {tid_dec_w[3]}};
assign pipe_isfsr_2[2:0] =
       i_isfsr0_w[2:0] & {3 {tid_dec_w[2]}};
assign pipe_isfsr_1[2:0] =
       i_isfsr0_w[2:0] & {3 {tid_dec_w[1]}};
assign pipe_isfsr_0[2:0] =
       i_isfsr0_w[2:0] & {3 {tid_dec_w[0]}};

assign pipe_dsfsr1_w[2:0] = 
       (({3 {irfu_w[1]}} & 3'b001) |
        ({3 {irfc_w[1]}} & 3'b010) |
        ({3 {frfu_w[1]}} & 3'b011) |
        ({3 {frfc_w[1]}} & 3'b100) |
        ({3 {dtmh_w[1]}} & 3'b001) |
        ({3 {dttp_w[1]}} & 3'b010) |
        ({3 {dtdp_w[1]}} & 3'b011) ) & 
       {3 {fls_ipe_dme_request[1] | (| block_store_w[7:4])}};

assign pipe_dsfsr0_w[2:0] = 
       (({3 {irfu_w[0]}} & 3'b001) |
        ({3 {irfc_w[0]}} & 3'b010) |
        ({3 {frfu_w[0]}} & 3'b011) |
        ({3 {frfc_w[0]}} & 3'b100) |
        ({3 {dtmh_w[0]}} & 3'b001) |
        ({3 {dttp_w[0]}} & 3'b010) |
        ({3 {dtdp_w[0]}} & 3'b011) ) &
       {3 {fls_ipe_dme_request[0] | (| block_store_w[3:0])}};

assign gl1_w[1:0] =
       (trl_gl7[1:0] & {2 {tid_dec_w[7]}}) | 
       (trl_gl6[1:0] & {2 {tid_dec_w[6]}}) | 
       (trl_gl5[1:0] & {2 {tid_dec_w[5]}}) | 
       (trl_gl4[1:0] & {2 {tid_dec_w[4]}}) ;

assign gl0_w[1:0] =
       (trl_gl3[1:0] & {2 {tid_dec_w[3]}}) | 
       (trl_gl2[1:0] & {2 {tid_dec_w[2]}}) | 
       (trl_gl1[1:0] & {2 {tid_dec_w[1]}}) | 
       (trl_gl0[1:0] & {2 {tid_dec_w[0]}}) ;

assign pipe_dsfar1_w[19:0] =
       (({20 {irfu_w[1] | irfc_w[1]}} & 
	 {{5 {1'b0}}, irf1_ecc_check_w[7:0], gl1_w[1:0], 
          irf1_ecc_addr_w[4:0]}) |
	({20 {frfu_w[1] | frfc_w[1]}} & 
	 {frf_ecc_check_w[13:0], frf_ecc_addr_w[5:0]})) & 
	{20 {(| tid_dec_w[7:4]) & 
       (fls_ipe_dme_request[1] | (| block_store_w[7:4]))}};

assign pipe_dsfar0_w[19:0] =
       (({20 {irfu_w[0] | irfc_w[0]}} & 
	 {{5 {1'b0}}, irf0_ecc_check_w[7:0], gl0_w[1:0], 
          irf0_ecc_addr_w[4:0]}) |
	({20 {frfu_w[0] | frfc_w[0]}} & 
	 {frf_ecc_check_w[13:0], frf_ecc_addr_w[5:0]})) & 
	{20 {(| tid_dec_w[3:0]) & 
       (fls_ipe_dme_request[0] | (| block_store_w[3:0]))}};

// Carry pipe DSFSR errors out one more cycle so they only update DSFSR/DSFAR
// if they are the highest priority exceptions

assign ecc_w[1:0] =
       irfu_w[1:0] | irfc_w[1:0] | frfu_w[1:0] | frfc_w[1:0];

tlu_ras_ctl_msff_ctl_macro__width_2 ecc_w1_lat  (
	.scan_in(ecc_w1_lat_scanin),
	.scan_out(ecc_w1_lat_scanout),
	.din	(ecc_w			[1:0]	),
	.dout	(ecc_w1			[1:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid1_w1_in[1:0] =
       (tid1_w[1:0] & ~{2 {| block_store_w[7:4]}}) |
       {block_store_w[7] | block_store_w[6],
	block_store_w[7] | block_store_w[5]};

tlu_ras_ctl_msff_ctl_macro__width_2 tid1_w1_lat  (
	.scan_in(tid1_w1_lat_scanin),
	.scan_out(tid1_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tid1_w1_in		[1:0]	),
	.dout	(tid1_w1		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid0_w1_in[1:0] =
       (tid0_w[1:0] & ~{2 {| block_store_w[3:0]}}) |
       {block_store_w[3] | block_store_w[2],
	block_store_w[3] | block_store_w[1]};

tlu_ras_ctl_msff_ctl_macro__width_2 tid0_w1_lat  (
	.scan_in(tid0_w1_lat_scanin),
	.scan_out(tid0_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tid0_w1_in		[1:0]	),
	.dout	(tid0_w1		[1:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 pipe_dsfsr1_lat  (
	.scan_in(pipe_dsfsr1_lat_scanin),
	.scan_out(pipe_dsfsr1_lat_scanout),
	.din	(pipe_dsfsr1_w		[2:0]	),
	.dout	(pipe_dsfsr1		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 pipe_dsfsr0_lat  (
	.scan_in(pipe_dsfsr0_lat_scanin),
	.scan_out(pipe_dsfsr0_lat_scanout),
	.din	(pipe_dsfsr0_w		[2:0]	),
	.dout	(pipe_dsfsr0		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_20 pipe_dsfar1_lat  (
	.scan_in(pipe_dsfar1_lat_scanin),
	.scan_out(pipe_dsfar1_lat_scanout),
	.din	(pipe_dsfar1_w		[19:0]	),
	.dout	(pipe_dsfar1		[19:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_20 pipe_dsfar0_lat  (
	.scan_in(pipe_dsfar0_lat_scanin),
	.scan_out(pipe_dsfar0_lat_scanout),
	.din	(pipe_dsfar0_w		[19:0]	),
	.dout	(pipe_dsfar0		[19:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tid_dec_w1[7:0] =
       { tid1_w1[1] &  tid1_w1[0],
         tid1_w1[1] & ~tid1_w1[0],
        ~tid1_w1[1] &  tid1_w1[0],
        ~tid1_w1[1] & ~tid1_w1[0],
         tid0_w1[1] &  tid0_w1[0],
         tid0_w1[1] & ~tid0_w1[0],
        ~tid0_w1[1] &  tid0_w1[0],
        ~tid0_w1[1] & ~tid0_w1[0]};



assign pipe_dsfsr_7[2:0] =
       pipe_dsfsr1[2:0] & {3 {tid_dec_w1[7]}};
assign pipe_dsfsr_6[2:0] =
       pipe_dsfsr1[2:0] & {3 {tid_dec_w1[6]}};
assign pipe_dsfsr_5[2:0] =
       pipe_dsfsr1[2:0] & {3 {tid_dec_w1[5]}};
assign pipe_dsfsr_4[2:0] =
       pipe_dsfsr1[2:0] & {3 {tid_dec_w1[4]}};
assign pipe_dsfsr_3[2:0] =
       pipe_dsfsr0[2:0] & {3 {tid_dec_w1[3]}};
assign pipe_dsfsr_2[2:0] =
       pipe_dsfsr0[2:0] & {3 {tid_dec_w1[2]}};
assign pipe_dsfsr_1[2:0] =
       pipe_dsfsr0[2:0] & {3 {tid_dec_w1[1]}};
assign pipe_dsfsr_0[2:0] =
       pipe_dsfsr0[2:0] & {3 {tid_dec_w1[0]}};

assign pipe_dsfar_7[19:0] =
       {20 {ecc_w1[1] & tid_dec_w1[7]}} & pipe_dsfar1[19:0];
assign pipe_dsfar_6[19:0] =
       {20 {ecc_w1[1] & tid_dec_w1[6]}} & pipe_dsfar1[19:0];
assign pipe_dsfar_5[19:0] =
       {20 {ecc_w1[1] & tid_dec_w1[5]}} & pipe_dsfar1[19:0];
assign pipe_dsfar_4[19:0] =
       {20 {ecc_w1[1] & tid_dec_w1[4]}} & pipe_dsfar1[19:0];
assign pipe_dsfar_3[19:0] =
       {20 {ecc_w1[0] & tid_dec_w1[3]}} & pipe_dsfar0[19:0];
assign pipe_dsfar_2[19:0] =
       {20 {ecc_w1[0] & tid_dec_w1[2]}} & pipe_dsfar0[19:0];
assign pipe_dsfar_1[19:0] =
       {20 {ecc_w1[0] & tid_dec_w1[1]}} & pipe_dsfar0[19:0];
assign pipe_dsfar_0[19:0] =
       {20 {ecc_w1[0] & tid_dec_w1[0]}} & pipe_dsfar0[19:0];

assign dsfar_sel_lsu_va_for_error[7:0] = 
       ({{4 {~ecc_w1[1] & (| pipe_dsfsr1[2:0])}},  
	 {4 {~ecc_w1[0] & (| pipe_dsfsr0[2:0])}}} & tid_dec_w1[7:0]) ;

tlu_ras_ctl_msff_ctl_macro__width_8 load_dsfar_lat  (
	.scan_in(load_dsfar_lat_scanin),
	.scan_out(load_dsfar_lat_scanout),
	.din	(fls_load_dsfar		[7:0]	),
	.dout	(load_dsfar		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ras_dsfar_sel_lsu_va[7:0] =
       dsfar_sel_lsu_va_for_error[7:0] |
       load_dsfar[7:0];

// Update DESR in W1

assign i_desr1_w1_in[3:0] =
       i_desr1_w[3:0] & {4 {| tid_dec_w[7:4]}};

assign i_desr0_w1_in[3:0] =
       i_desr0_w[3:0] & {4 {| tid_dec_w[3:0]}};

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr1_w1_lat  (
	.scan_in(i_desr1_w1_lat_scanin),
	.scan_out(i_desr1_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_desr1_w1_in		[3:0]	),
	.dout	(i_desr1_w1		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 i_desr0_w1_lat  (
	.scan_in(i_desr0_w1_lat_scanin),
	.scan_out(i_desr0_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(i_desr0_w1_in		[3:0]	),
	.dout	(i_desr0_w1		[3:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

assign pipe_desr_et_7[5:0] =
       {i_desr1_w1[3], 2'b00, i_desr1_w1[2:0]} & {6 {tid_dec_w1[7]}};
assign pipe_desr_et_6[5:0] =			      
       {i_desr1_w1[3], 2'b00, i_desr1_w1[2:0]} & {6 {tid_dec_w1[6]}};
assign pipe_desr_et_5[5:0] =			      
       {i_desr1_w1[3], 2'b00, i_desr1_w1[2:0]} & {6 {tid_dec_w1[5]}};
assign pipe_desr_et_4[5:0] =			      
       {i_desr1_w1[3], 2'b00, i_desr1_w1[2:0]} & {6 {tid_dec_w1[4]}};
assign pipe_desr_et_3[5:0] =			      
       {i_desr0_w1[3], 2'b00, i_desr0_w1[2:0]} & {6 {tid_dec_w1[3]}};
assign pipe_desr_et_2[5:0] =			      
       {i_desr0_w1[3], 2'b00, i_desr0_w1[2:0]} & {6 {tid_dec_w1[2]}};
assign pipe_desr_et_1[5:0] =			      
       {i_desr0_w1[3], 2'b00, i_desr0_w1[2:0]} & {6 {tid_dec_w1[1]}};
assign pipe_desr_et_0[5:0] =			      
       {i_desr0_w1[3], 2'b00, i_desr0_w1[2:0]} & {6 {tid_dec_w1[0]}};


// Hold exception way
tlu_ras_ctl_msff_ctl_macro__width_7 excp_way_lat  (
	.scan_in(excp_way_lat_scanin),
	.scan_out(excp_way_lat_scanout),
	.din	({ftu_excp_tid_d	[2:0],
		  ftu_excp_way_d	[2:0],
		  ftu_excp_way_valid_d	       }),
	.dout	({excp_tid		[2:0],
		  excp_way		[2:0],
		  excp_way_valid	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign sel_ftu_excp_way[7:0] =
       {(excp_tid[2:0] == 3'b111) & excp_way_valid,
	(excp_tid[2:0] == 3'b110) & excp_way_valid,
	(excp_tid[2:0] == 3'b101) & excp_way_valid,
	(excp_tid[2:0] == 3'b100) & excp_way_valid,
	(excp_tid[2:0] == 3'b011) & excp_way_valid,
	(excp_tid[2:0] == 3'b010) & excp_way_valid,
	(excp_tid[2:0] == 3'b001) & excp_way_valid,
	(excp_tid[2:0] == 3'b000) & excp_way_valid};

assign ic_way7_in[2:0] =
       (excp_way[2:0] & {3 { sel_ftu_excp_way[7]}}) |
       (ic_way7	[2:0] & {3 {~sel_ftu_excp_way[7]}}) ;
			       
assign ic_way6_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[6]}}) |
       (ic_way6	[2:0] & {3 {~sel_ftu_excp_way[6]}}) ;
			       
assign ic_way5_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[5]}}) |
       (ic_way5	[2:0] & {3 {~sel_ftu_excp_way[5]}}) ;
			       
assign ic_way4_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[4]}}) |
       (ic_way4	[2:0] & {3 {~sel_ftu_excp_way[4]}}) ;
			       
assign ic_way3_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[3]}}) |
       (ic_way3	[2:0] & {3 {~sel_ftu_excp_way[3]}}) ;
			       
assign ic_way2_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[2]}}) |
       (ic_way2	[2:0] & {3 {~sel_ftu_excp_way[2]}}) ;
			       
assign ic_way1_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[1]}}) |
       (ic_way1	[2:0] & {3 {~sel_ftu_excp_way[1]}}) ;
			       
assign ic_way0_in[2:0] =     
       (excp_way[2:0] & {3 { sel_ftu_excp_way[0]}}) |
       (ic_way0	[2:0] & {3 {~sel_ftu_excp_way[0]}}) ;

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way7_lat  (
	.scan_in(ic_way7_lat_scanin),
	.scan_out(ic_way7_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way7_in		[2:0]	),
	.dout	(ic_way7		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way6_lat  (
	.scan_in(ic_way6_lat_scanin),
	.scan_out(ic_way6_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way6_in		[2:0]	),
	.dout	(ic_way6		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way5_lat  (
	.scan_in(ic_way5_lat_scanin),
	.scan_out(ic_way5_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way5_in		[2:0]	),
	.dout	(ic_way5		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way4_lat  (
	.scan_in(ic_way4_lat_scanin),
	.scan_out(ic_way4_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way4_in		[2:0]	),
	.dout	(ic_way4		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way3_lat  (
	.scan_in(ic_way3_lat_scanin),
	.scan_out(ic_way3_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way3_in		[2:0]	),
	.dout	(ic_way3		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way2_lat  (
	.scan_in(ic_way2_lat_scanin),
	.scan_out(ic_way2_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way2_in		[2:0]	),
	.dout	(ic_way2		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way1_lat  (
	.scan_in(ic_way1_lat_scanin),
	.scan_out(ic_way1_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way1_in		[2:0]	),
	.dout	(ic_way1		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 ic_way0_lat  (
	.scan_in(ic_way0_lat_scanin),
	.scan_out(ic_way0_lat_scanout),
	.l1clk	(l1clk_pm2			),
	.din	(ic_way0_in		[2:0]	),
	.dout	(ic_way0		[2:0]	),
  .siclk(siclk),
  .soclk(soclk)
);

// Hold pipe DESR address to W1
tlu_ras_ctl_msff_ctl_macro__width_6 pc_1_w1_lat  (
	.scan_in(pc_1_w1_lat_scanin),
	.scan_out(pc_1_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tsd_pc_1_w		[10:5]	),
	.dout	(pc_1_w1		[10:5]	),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_6 pc_0_w1_lat  (
	.scan_in(pc_0_w1_lat_scanin),
	.scan_out(pc_0_w1_lat_scanout),
	.l1clk	(l1clk_pm1			),
	.din	(tsd_pc_0_w		[10:5]	),
	.dout	(pc_0_w1		[10:5]	),
  .siclk(siclk),
  .soclk(soclk)
);


// Force ea to zero for icl2c
assign pipe_desr_ea_7[8:0] = 
       {ic_way7[2:0], pc_1_w1[10:5]} & 
       {9 {(| pipe_desr_et_7[2:0]) & ~pipe_desr_et_7[5]}};
assign pipe_desr_ea_6[8:0] = 
       {ic_way6[2:0], pc_1_w1[10:5]} & 
       {9 {(| pipe_desr_et_6[2:0]) & ~pipe_desr_et_6[5]}};
assign pipe_desr_ea_5[8:0] = 
       {ic_way5[2:0], pc_1_w1[10:5]} & 
       {9 {(| pipe_desr_et_5[2:0]) & ~pipe_desr_et_5[5]}};
assign pipe_desr_ea_4[8:0] = 
       {ic_way4[2:0], pc_1_w1[10:5]} & 
       {9 {(| pipe_desr_et_4[2:0]) & ~pipe_desr_et_4[5]}};
assign pipe_desr_ea_3[8:0] = 
       {ic_way3[2:0], pc_0_w1[10:5]} & 
       {9 {(| pipe_desr_et_3[2:0]) & ~pipe_desr_et_3[5]}};
assign pipe_desr_ea_2[8:0] = 
       {ic_way2[2:0], pc_0_w1[10:5]} & 
       {9 {(| pipe_desr_et_2[2:0]) & ~pipe_desr_et_2[5]}};
assign pipe_desr_ea_1[8:0] = 
       {ic_way1[2:0], pc_0_w1[10:5]} & 
       {9 {(| pipe_desr_et_1[2:0]) & ~pipe_desr_et_1[5]}};
assign pipe_desr_ea_0[8:0] = 
       {ic_way0[2:0], pc_0_w1[10:5]} & 
       {9 {(| pipe_desr_et_0[2:0]) & ~pipe_desr_et_0[5]}};



//////////////////////////////////////////////////////////////////////////////
//
//  Handle out-of-pipe errors (flop, decode, and record)
//

//
// Incoming encoding
// i/dtmu	101
// i/dtl2c	001
// i/dtl2u	010
// i/dtl2nd	011
//
// ISFSR encodings
// itmu         100
// itl2u	101
// itl2nd       110
//
// DSFSR encodings
// dtmu		100
// dtl2u	101
// dtl2nd	110
//
// DESR encodings
// itl2c	001
// dtl2c	011
// Both have S = 1

assign   itmu_7 = mmu_i_eccerr[7] & (mmu_thr7_err_type[2   ] == 1'b1   );
assign   itmu_6 = mmu_i_eccerr[6] & (mmu_thr6_err_type[2   ] == 1'b1   );
assign   itmu_5 = mmu_i_eccerr[5] & (mmu_thr5_err_type[2   ] == 1'b1   );
assign   itmu_4 = mmu_i_eccerr[4] & (mmu_thr4_err_type[2   ] == 1'b1   );
assign   itmu_3 = mmu_i_eccerr[3] & (mmu_thr3_err_type[2   ] == 1'b1   );
assign   itmu_2 = mmu_i_eccerr[2] & (mmu_thr2_err_type[2   ] == 1'b1   );
assign   itmu_1 = mmu_i_eccerr[1] & (mmu_thr1_err_type[2   ] == 1'b1   );
assign   itmu_0 = mmu_i_eccerr[0] & (mmu_thr0_err_type[2   ] == 1'b1   );

assign  itl2u_7 = mmu_i_eccerr[7] & (mmu_thr7_err_type[2:0] == 3'b010 );
assign  itl2u_6 = mmu_i_eccerr[6] & (mmu_thr6_err_type[2:0] == 3'b010 );
assign  itl2u_5 = mmu_i_eccerr[5] & (mmu_thr5_err_type[2:0] == 3'b010 );
assign  itl2u_4 = mmu_i_eccerr[4] & (mmu_thr4_err_type[2:0] == 3'b010 );
assign  itl2u_3 = mmu_i_eccerr[3] & (mmu_thr3_err_type[2:0] == 3'b010 );
assign  itl2u_2 = mmu_i_eccerr[2] & (mmu_thr2_err_type[2:0] == 3'b010 );
assign  itl2u_1 = mmu_i_eccerr[1] & (mmu_thr1_err_type[2:0] == 3'b010 );
assign  itl2u_0 = mmu_i_eccerr[0] & (mmu_thr0_err_type[2:0] == 3'b010 );

assign itl2nd_7 = mmu_i_eccerr[7] & (mmu_thr7_err_type[2:0] == 3'b011 );
assign itl2nd_6 = mmu_i_eccerr[6] & (mmu_thr6_err_type[2:0] == 3'b011 );
assign itl2nd_5 = mmu_i_eccerr[5] & (mmu_thr5_err_type[2:0] == 3'b011 );
assign itl2nd_4 = mmu_i_eccerr[4] & (mmu_thr4_err_type[2:0] == 3'b011 );
assign itl2nd_3 = mmu_i_eccerr[3] & (mmu_thr3_err_type[2:0] == 3'b011 );
assign itl2nd_2 = mmu_i_eccerr[2] & (mmu_thr2_err_type[2:0] == 3'b011 );
assign itl2nd_1 = mmu_i_eccerr[1] & (mmu_thr1_err_type[2:0] == 3'b011 );
assign itl2nd_0 = mmu_i_eccerr[0] & (mmu_thr0_err_type[2:0] == 3'b011 );


assign m_isfsr_7[2:0] =
       ({3 {  itmu_7}} & 3'b100) | 
       ({3 { itl2u_7}} & 3'b101) | 
       ({3 {itl2nd_7}} & 3'b110) ;
assign m_isfsr_6[2:0] =
       ({3 {  itmu_6}} & 3'b100) | 
       ({3 { itl2u_6}} & 3'b101) | 
       ({3 {itl2nd_6}} & 3'b110) ;
assign m_isfsr_5[2:0] =
       ({3 {  itmu_5}} & 3'b100) | 
       ({3 { itl2u_5}} & 3'b101) | 
       ({3 {itl2nd_5}} & 3'b110) ;
assign m_isfsr_4[2:0] =
       ({3 {  itmu_4}} & 3'b100) | 
       ({3 { itl2u_4}} & 3'b101) | 
       ({3 {itl2nd_4}} & 3'b110) ;
assign m_isfsr_3[2:0] =
       ({3 {  itmu_3}} & 3'b100) | 
       ({3 { itl2u_3}} & 3'b101) | 
       ({3 {itl2nd_3}} & 3'b110) ;
assign m_isfsr_2[2:0] =
       ({3 {  itmu_2}} & 3'b100) | 
       ({3 { itl2u_2}} & 3'b101) | 
       ({3 {itl2nd_2}} & 3'b110) ;
assign m_isfsr_1[2:0] =
       ({3 {  itmu_1}} & 3'b100) | 
       ({3 { itl2u_1}} & 3'b101) | 
       ({3 {itl2nd_1}} & 3'b110) ;
assign m_isfsr_0[2:0] =
       ({3 {  itmu_0}} & 3'b100) | 
       ({3 { itl2u_0}} & 3'b101) | 
       ({3 {itl2nd_0}} & 3'b110) ;


assign   dtmu_7 = mmu_d_eccerr[7] & (mmu_thr7_err_type[2  ] == 1'b1  );
assign   dtmu_6 = mmu_d_eccerr[6] & (mmu_thr6_err_type[2  ] == 1'b1  );
assign   dtmu_5 = mmu_d_eccerr[5] & (mmu_thr5_err_type[2  ] == 1'b1  );
assign   dtmu_4 = mmu_d_eccerr[4] & (mmu_thr4_err_type[2  ] == 1'b1  );
assign   dtmu_3 = mmu_d_eccerr[3] & (mmu_thr3_err_type[2  ] == 1'b1  );
assign   dtmu_2 = mmu_d_eccerr[2] & (mmu_thr2_err_type[2  ] == 1'b1  );
assign   dtmu_1 = mmu_d_eccerr[1] & (mmu_thr1_err_type[2  ] == 1'b1  );
assign   dtmu_0 = mmu_d_eccerr[0] & (mmu_thr0_err_type[2  ] == 1'b1  );

assign  dtl2u_7 = mmu_d_eccerr[7] & (mmu_thr7_err_type[2:0] == 3'b010);
assign  dtl2u_6 = mmu_d_eccerr[6] & (mmu_thr6_err_type[2:0] == 3'b010);
assign  dtl2u_5 = mmu_d_eccerr[5] & (mmu_thr5_err_type[2:0] == 3'b010);
assign  dtl2u_4 = mmu_d_eccerr[4] & (mmu_thr4_err_type[2:0] == 3'b010);
assign  dtl2u_3 = mmu_d_eccerr[3] & (mmu_thr3_err_type[2:0] == 3'b010);
assign  dtl2u_2 = mmu_d_eccerr[2] & (mmu_thr2_err_type[2:0] == 3'b010);
assign  dtl2u_1 = mmu_d_eccerr[1] & (mmu_thr1_err_type[2:0] == 3'b010);
assign  dtl2u_0 = mmu_d_eccerr[0] & (mmu_thr0_err_type[2:0] == 3'b010);
								     	
assign dtl2nd_7 = mmu_d_eccerr[7] & (mmu_thr7_err_type[2:0] == 3'b011);
assign dtl2nd_6 = mmu_d_eccerr[6] & (mmu_thr6_err_type[2:0] == 3'b011);
assign dtl2nd_5 = mmu_d_eccerr[5] & (mmu_thr5_err_type[2:0] == 3'b011);
assign dtl2nd_4 = mmu_d_eccerr[4] & (mmu_thr4_err_type[2:0] == 3'b011);
assign dtl2nd_3 = mmu_d_eccerr[3] & (mmu_thr3_err_type[2:0] == 3'b011);
assign dtl2nd_2 = mmu_d_eccerr[2] & (mmu_thr2_err_type[2:0] == 3'b011);
assign dtl2nd_1 = mmu_d_eccerr[1] & (mmu_thr1_err_type[2:0] == 3'b011);
assign dtl2nd_0 = mmu_d_eccerr[0] & (mmu_thr0_err_type[2:0] == 3'b011);

assign m_dsfsr_7[2:0] =
       ({3 {  dtmu_7}} & 3'b100) | 
       ({3 { dtl2u_7}} & 3'b101) | 
       ({3 {dtl2nd_7}} & 3'b110) ;
assign m_dsfsr_6[2:0] =
       ({3 {  dtmu_6}} & 3'b100) | 
       ({3 { dtl2u_6}} & 3'b101) | 
       ({3 {dtl2nd_6}} & 3'b110) ;
assign m_dsfsr_5[2:0] =
       ({3 {  dtmu_5}} & 3'b100) | 
       ({3 { dtl2u_5}} & 3'b101) | 
       ({3 {dtl2nd_5}} & 3'b110) ;
assign m_dsfsr_4[2:0] =
       ({3 {  dtmu_4}} & 3'b100) | 
       ({3 { dtl2u_4}} & 3'b101) | 
       ({3 {dtl2nd_4}} & 3'b110) ;
assign m_dsfsr_3[2:0] =
       ({3 {  dtmu_3}} & 3'b100) | 
       ({3 { dtl2u_3}} & 3'b101) | 
       ({3 {dtl2nd_3}} & 3'b110) ;
assign m_dsfsr_2[2:0] =
       ({3 {  dtmu_2}} & 3'b100) | 
       ({3 { dtl2u_2}} & 3'b101) | 
       ({3 {dtl2nd_2}} & 3'b110) ;
assign m_dsfsr_1[2:0] =
       ({3 {  dtmu_1}} & 3'b100) | 
       ({3 { dtl2u_1}} & 3'b101) | 
       ({3 {dtl2nd_1}} & 3'b110) ;
assign m_dsfsr_0[2:0] =
       ({3 {  dtmu_0}} & 3'b100) | 
       ({3 { dtl2u_0}} & 3'b101) | 
       ({3 {dtl2nd_0}} & 3'b110) ;

assign m_dsfar_7[2:0] =
       mmu_thr7_err_index[2:0] & {3 {mmu_i_eccerr[7] | mmu_d_eccerr[7]}};
assign m_dsfar_6[2:0] =	                                         
       mmu_thr6_err_index[2:0] & {3 {mmu_i_eccerr[6] | mmu_d_eccerr[6]}};
assign m_dsfar_5[2:0] =	                                         
       mmu_thr5_err_index[2:0] & {3 {mmu_i_eccerr[5] | mmu_d_eccerr[5]}};
assign m_dsfar_4[2:0] =	                                         
       mmu_thr4_err_index[2:0] & {3 {mmu_i_eccerr[4] | mmu_d_eccerr[4]}};
assign m_dsfar_3[2:0] =	                                         
       mmu_thr3_err_index[2:0] & {3 {mmu_i_eccerr[3] | mmu_d_eccerr[3]}};
assign m_dsfar_2[2:0] =	                                         
       mmu_thr2_err_index[2:0] & {3 {mmu_i_eccerr[2] | mmu_d_eccerr[2]}};
assign m_dsfar_1[2:0] =	                                         
       mmu_thr1_err_index[2:0] & {3 {mmu_i_eccerr[1] | mmu_d_eccerr[1]}};
assign m_dsfar_0[2:0] =	                                         
       mmu_thr0_err_index[2:0] & {3 {mmu_i_eccerr[0] | mmu_d_eccerr[0]}};


tlu_ras_ctl_msff_ctl_macro__width_8 it2lc_lat  (
	.scan_in(it2lc_lat_scanin),
	.scan_out(it2lc_lat_scanout),
	.din	(mmu_i_l2cerr		[7:0]	),
	.dout	(m_i_l2cerr		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 dt2lc_lat  (
	.scan_in(dt2lc_lat_scanin),
	.scan_out(dt2lc_lat_scanout),
	.din	(mmu_d_l2cerr		[7:0]	),
	.dout	(m_d_l2cerr		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign itl2c_7 = m_i_l2cerr[7];
assign itl2c_6 = m_i_l2cerr[6];
assign itl2c_5 = m_i_l2cerr[5];
assign itl2c_4 = m_i_l2cerr[4];
assign itl2c_3 = m_i_l2cerr[3];
assign itl2c_2 = m_i_l2cerr[2];
assign itl2c_1 = m_i_l2cerr[1];
assign itl2c_0 = m_i_l2cerr[0];
		  
assign dtl2c_7 = m_d_l2cerr[7];
assign dtl2c_6 = m_d_l2cerr[6];
assign dtl2c_5 = m_d_l2cerr[5];
assign dtl2c_4 = m_d_l2cerr[4];
assign dtl2c_3 = m_d_l2cerr[3];
assign dtl2c_2 = m_d_l2cerr[2];
assign dtl2c_1 = m_d_l2cerr[1];
assign dtl2c_0 = m_d_l2cerr[0];

assign m_desr_et_7[5:0] = 
       ({6 { itl2c_7}} & 6'b100001) |
       ({6 { dtl2c_7}} & 6'b100011) ; 
assign m_desr_et_6[5:0] = 
       ({6 { itl2c_6}} & 6'b100001) |
       ({6 { dtl2c_6}} & 6'b100011) ; 
assign m_desr_et_5[5:0] = 
       ({6 { itl2c_5}} & 6'b100001) |
       ({6 { dtl2c_5}} & 6'b100011) ; 
assign m_desr_et_4[5:0] = 
       ({6 { itl2c_4}} & 6'b100001) |
       ({6 { dtl2c_4}} & 6'b100011) ; 
assign m_desr_et_3[5:0] = 
       ({6 { itl2c_3}} & 6'b100001) |
       ({6 { dtl2c_3}} & 6'b100011) ; 
assign m_desr_et_2[5:0] = 
       ({6 { itl2c_2}} & 6'b100001) |
       ({6 { dtl2c_2}} & 6'b100011) ; 
assign m_desr_et_1[5:0] = 
       ({6 { itl2c_1}} & 6'b100001) |
       ({6 { dtl2c_1}} & 6'b100011) ; 
assign m_desr_et_0[5:0] = 
       ({6 { itl2c_0}} & 6'b100001) |
       ({6 { dtl2c_0}} & 6'b100011) ; 

// No desr_ea for L2 correctable errors for MMU



//
// MRA, SCA, and TCA precise but out-of-pipe errors (ASI access)
//
// DSFSR
// mrau		0111
// scac		1010
// scau		1001
// tccp		1100
// tccu(tcup)	1101

// Both sources should have same TID
// but TCA errors take a cycle longer to be recorded due to longer path for
// disrupting TCA errors
assign a_tid[2:0] =
       tlu_tca_tid[2:0];

assign a_dec_tid[7:0] =
       { a_tid[2] &  a_tid[1] &  a_tid[0],
         a_tid[2] &  a_tid[1] & ~a_tid[0],
         a_tid[2] & ~a_tid[1] &  a_tid[0],
         a_tid[2] & ~a_tid[1] & ~a_tid[0],
        ~a_tid[2] &  a_tid[1] &  a_tid[0],
        ~a_tid[2] &  a_tid[1] & ~a_tid[0],
        ~a_tid[2] & ~a_tid[1] &  a_tid[0],
        ~a_tid[2] & ~a_tid[1] & ~a_tid[0]} & 
       {8 {mrau | scac | scau}};


tlu_ras_ctl_msff_ctl_macro__width_5 tca_error_lat  (
	.scan_in(tca_error_lat_scanin),
	.scan_out(tca_error_lat_scanout),
	.din	({cel_tccp		       ,
		  cel_tcup		       ,
		  tlu_tca_tid		[2:0]}),
	.dout	({tccp			       ,
		  tcup			       ,
		  tca_tid		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign tca_dec_tid[7:0] =
       { tca_tid[2] &  tca_tid[1] &  tca_tid[0],
         tca_tid[2] &  tca_tid[1] & ~tca_tid[0],
         tca_tid[2] & ~tca_tid[1] &  tca_tid[0],
         tca_tid[2] & ~tca_tid[1] & ~tca_tid[0],
        ~tca_tid[2] &  tca_tid[1] &  tca_tid[0],
        ~tca_tid[2] &  tca_tid[1] & ~tca_tid[0],
        ~tca_tid[2] & ~tca_tid[1] &  tca_tid[0],
        ~tca_tid[2] & ~tca_tid[1] & ~tca_tid[0]} & 
       {8 {tccp | tcup}};

assign mrau =
       mmu_asi_uecc &  mmu_asi_mra_not_sca;
assign scac =
       mmu_asi_cecc & ~mmu_asi_mra_not_sca;
assign scau =
       mmu_asi_uecc & ~mmu_asi_mra_not_sca;

assign a_dsfsr[3:0] = 
       ({4 {mrau}} & 4'b0111) |
       ({4 {scac}} & 4'b1010) | 
       ({4 {scau}} & 4'b1011) ;
assign tca_dsfsr[3:0] = 
       ({4 {tccp}} & 4'b1100) | 
       ({4 {tcup}} & 4'b1101) ;
assign a_dsfsr_7[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[7]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[7]}}) ;
assign a_dsfsr_6[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[6]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[6]}}) ;
assign a_dsfsr_5[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[5]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[5]}}) ;
assign a_dsfsr_4[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[4]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[4]}}) ;
assign a_dsfsr_3[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[3]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[3]}}) ;
assign a_dsfsr_2[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[2]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[2]}}) ;
assign a_dsfsr_1[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[1]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[1]}}) ;
assign a_dsfsr_0[3:0] =
       (  a_dsfsr[3:0] & {4 {  a_dec_tid[0]}}) |
       (tca_dsfsr[3:0] & {4 {tca_dec_tid[0]}}) ;

assign a_dsfar[10:0] =
       ({11 {scac | scau}} &             mmu_asi_index[10:0] ) |
       ({11 {mrau       }} &{{8 {1'b0}}, mmu_asi_index[2:0]}) ;
assign tca_dsfar[10:0] = 
       ({11 {tccp | tcup}} & 
	{1'b0, cel_syndrome[7:0], tlu_tca_index[1:0]}) ;

assign a_dsfar_7[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[7]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[7]}}) ;
assign a_dsfar_6[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[6]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[6]}}) ;
assign a_dsfar_5[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[5]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[5]}}) ;
assign a_dsfar_4[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[4]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[4]}}) ;
assign a_dsfar_3[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[3]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[3]}}) ;
assign a_dsfar_2[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[2]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[2]}}) ;
assign a_dsfar_1[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[1]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[1]}}) ;
assign a_dsfar_0[10:0] =
       (  a_dsfar[10:0] & {11 {  a_dec_tid[0]}}) |
       (tca_dsfar[10:0] & {11 {tca_dec_tid[0]}}) ;



//
// TSA precise but out-of-pipe errors (ASI access and done and retry)
//
// DSFSR
// tsac 1000
// tsau 1001

assign ta_dec_tid[7:0] = 
       { asi_tsacu_tid[2] &  asi_tsacu_tid[1] &  asi_tsacu_tid[0],
         asi_tsacu_tid[2] &  asi_tsacu_tid[1] & ~asi_tsacu_tid[0],
         asi_tsacu_tid[2] & ~asi_tsacu_tid[1] &  asi_tsacu_tid[0],
         asi_tsacu_tid[2] & ~asi_tsacu_tid[1] & ~asi_tsacu_tid[0],
        ~asi_tsacu_tid[2] &  asi_tsacu_tid[1] &  asi_tsacu_tid[0],
        ~asi_tsacu_tid[2] &  asi_tsacu_tid[1] & ~asi_tsacu_tid[0],
        ~asi_tsacu_tid[2] & ~asi_tsacu_tid[1] &  asi_tsacu_tid[0],
        ~asi_tsacu_tid[2] & ~asi_tsacu_tid[1] & ~asi_tsacu_tid[0]};

assign tsac[7:0] =
       tlu_tsac[7:0] | ({8 {asi_tsac}} & ta_dec_tid[7:0]);

assign tsau[7:0] =
       tlu_tsau[7:0] | ({8 {asi_tsau}} & ta_dec_tid[7:0]);

assign ras_dsfar_sel_tsa[7:0] =
       tsac[7:0] | tsau[7:0];

assign t_dsfsr_7[3:0] =
       ({4 {tsac[7]}} & 4'b1000) |
       ({4 {tsau[7]}} & 4'b1001) ;
assign t_dsfsr_6[3:0] =
       ({4 {tsac[6]}} & 4'b1000) |
       ({4 {tsau[6]}} & 4'b1001) ;
assign t_dsfsr_5[3:0] =
       ({4 {tsac[5]}} & 4'b1000) |
       ({4 {tsau[5]}} & 4'b1001) ;
assign t_dsfsr_4[3:0] =
       ({4 {tsac[4]}} & 4'b1000) |
       ({4 {tsau[4]}} & 4'b1001) ;
assign t_dsfsr_3[3:0] =
       ({4 {tsac[3]}} & 4'b1000) |
       ({4 {tsau[3]}} & 4'b1001) ;
assign t_dsfsr_2[3:0] =
       ({4 {tsac[2]}} & 4'b1000) |
       ({4 {tsau[2]}} & 4'b1001) ;
assign t_dsfsr_1[3:0] =
       ({4 {tsac[1]}} & 4'b1000) |
       ({4 {tsau[1]}} & 4'b1001) ;
assign t_dsfsr_0[3:0] =
       ({4 {tsac[0]}} & 4'b1000) |
       ({4 {tsau[0]}} & 4'b1001) ;

// DSFAR for TSA errors handled in tlu_dfd_dp



//
// Data cache errors on L2
//
// DSFSR
// dcl2u	001
// dcl2nd	010
// socc         011
// socu         100
//
// DESR
// dcl2c       1011
// This has S = 0 
// dcl2c	100
// This has S = 1

tlu_ras_ctl_msff_ctl_macro__width_9 l_dsfar_lat  (
	.scan_in(l_dsfar_lat_scanin),
	.scan_out(l_dsfar_lat_scanout),
	.din	(lsu_dcerr_sfar_g	[8:0]	),
	.dout	(l_dsfar		[8:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 l_tid_lat  (
	.scan_in(l_tid_lat_scanin),
	.scan_out(l_tid_lat_scanout),
	.din	(lsu_dcerr_tid_g	[2:0]	),
	.dout	(l_tid			[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dcl2c_lat  (
	.scan_in(dcl2c_lat_scanin),
	.scan_out(dcl2c_lat_scanout),
	.din	(lsu_dcl2c_err_g		),
	.dout	(dcl2c				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dcl2u_lat  (
	.scan_in(dcl2u_lat_scanin),
	.scan_out(dcl2u_lat_scanout),
	.din	(lsu_dcl2u_err_g		),
	.dout	(dcl2u				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dcl2nd_lat  (
	.scan_in(dcl2nd_lat_scanin),
	.scan_out(dcl2nd_lat_scanout),
	.din	(lsu_dcl2nd_err_g		),
	.dout	(dcl2nd				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dcsoc_lat  (
	.scan_in(dcsoc_lat_scanin),
	.scan_out(dcsoc_lat_scanout),
	.din	(lsu_dcsoc_err_g		),
	.dout	(dcsoc				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign l_dec_tid[7:0] =
       { l_tid[2] &  l_tid[1] &  l_tid[0],
         l_tid[2] &  l_tid[1] & ~l_tid[0],
         l_tid[2] & ~l_tid[1] &  l_tid[0],
         l_tid[2] & ~l_tid[1] & ~l_tid[0],
        ~l_tid[2] &  l_tid[1] &  l_tid[0],
        ~l_tid[2] &  l_tid[1] & ~l_tid[0],
        ~l_tid[2] & ~l_tid[1] &  l_tid[0],
        ~l_tid[2] & ~l_tid[1] & ~l_tid[0]} & {8 {dcl2c | dcl2u | dcl2nd}};

assign l_dsfsr[2:0] =
       ({3 {dcl2u  & ~dcsoc}} & 3'b001) |
       ({3 {dcl2nd & ~dcsoc}} & 3'b010) |
       ({3 {dcl2u  &  dcsoc}} & 3'b100) ;

assign l_dsfsr_7[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[7]}};
assign l_dsfsr_6[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[6]}};
assign l_dsfsr_5[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[5]}};
assign l_dsfsr_4[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[4]}};
assign l_dsfsr_3[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[3]}};
assign l_dsfsr_2[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[2]}};
assign l_dsfsr_1[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[1]}};
assign l_dsfsr_0[2:0] =
       l_dsfsr[2:0] & {3 {l_dec_tid[0]}};

assign l_dsfar_7[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[7]}};
assign l_dsfar_6[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[6]}};
assign l_dsfar_5[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[5]}};
assign l_dsfar_4[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[4]}};
assign l_dsfar_3[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[3]}};
assign l_dsfar_2[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[2]}};
assign l_dsfar_1[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[1]}};
assign l_dsfar_0[8:0] =
       l_dsfar[8:0] & {9 {l_dec_tid[0]}};


assign l_desr_et[5:0] = 
       ({6 {dcl2c  &  dcsoc}} & 6'b001011) |
       ({6 {dcl2c  & ~dcsoc}} & 6'b100100) ;

assign l_desr_et_7[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[7]}};
assign l_desr_et_6[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[6]}};
assign l_desr_et_5[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[5]}};
assign l_desr_et_4[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[4]}};
assign l_desr_et_3[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[3]}};
assign l_desr_et_2[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[2]}};
assign l_desr_et_1[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[1]}};
assign l_desr_et_0[5:0] =
       l_desr_et[5:0] & {6 {l_dec_tid[0]}};



//
// Precise but out-of-pipe store buffer errors
//
// DSFSR
// sbdlc	101
// sbdlu	110

tlu_ras_ctl_msff_ctl_macro__width_5 s_dsfar_lat  (
	.scan_in(s_dsfar_lat_scanin),
	.scan_out(s_dsfar_lat_scanout),
	.din	({lsu_stberr_priv_g	[1:0],
		  lsu_stberr_index_g	[2:0]}),
	.dout	({fesr_priv		[1:0],
		  s_dsfar		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 s_tid_lat  (
	.scan_in(s_tid_lat_scanin),
	.scan_out(s_tid_lat_scanout),
	.din	(lsu_stberr_tid_g	[2:0]	),
	.dout	(s_tid			[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 stb_flush_lat  (
	.scan_in(stb_flush_lat_scanin),
	.scan_out(stb_flush_lat_scanout),
	.din	(lsu_stb_flush_g		),
	.dout	(stb_flush			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign update_priv[7:0] =
       {8 {stb_flush}} & s_dsfsr_dec_tid_raw[7:0] & 
       {(fesr_priv[1] & ~dfd_fesr_priv_7[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_7[1] & ~dfd_fesr_priv_7[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_6[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_6[1] & ~dfd_fesr_priv_6[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_5[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_5[1] & ~dfd_fesr_priv_5[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_4[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_4[1] & ~dfd_fesr_priv_4[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_3[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_3[1] & ~dfd_fesr_priv_3[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_2[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_2[1] & ~dfd_fesr_priv_2[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_1[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_1[1] & ~dfd_fesr_priv_1[0]),
        (fesr_priv[1] & ~dfd_fesr_priv_0[1]                       ) | 
	(fesr_priv[0] & ~dfd_fesr_priv_0[1] & ~dfd_fesr_priv_0[0])  };

assign ras_update_priv[7:0] =
       update_priv[7:0];

assign ras_fesr_priv[59:58] =
       fesr_priv[1:0];

tlu_ras_ctl_msff_ctl_macro__width_1 sbdlc_lat  (
	.scan_in(sbdlc_lat_scanin),
	.scan_out(sbdlc_lat_scanout),
	.din	(lsu_sbdlc_err_g		),
	.dout	(sbdlc				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 sbdlu_lat  (
	.scan_in(sbdlu_lat_scanin),
	.scan_out(sbdlu_lat_scanout),
	.din	(lsu_sbdlu_err_g		),
	.dout	(sbdlu				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign s_dsfsr_dec_tid_raw[7:0] =
       { s_tid[2] &  s_tid[1] &  s_tid[0],
         s_tid[2] &  s_tid[1] & ~s_tid[0],
         s_tid[2] & ~s_tid[1] &  s_tid[0],
         s_tid[2] & ~s_tid[1] & ~s_tid[0],
        ~s_tid[2] &  s_tid[1] &  s_tid[0],
        ~s_tid[2] &  s_tid[1] & ~s_tid[0],
        ~s_tid[2] & ~s_tid[1] &  s_tid[0],
        ~s_tid[2] & ~s_tid[1] & ~s_tid[0]} ;
assign s_dsfsr_dec_tid[7:0] =
       s_dsfsr_dec_tid_raw[7:0] & 
       {8 {sbdlc | sbdlu}};

assign s_dsfsr[2:0] =
       ({3 {sbdlc}} & 3'b101) |
       ({3 {sbdlu}} & 3'b110) ;

assign s_dsfsr_7[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[7]}};
assign s_dsfsr_6[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[6]}};
assign s_dsfsr_5[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[5]}};
assign s_dsfsr_4[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[4]}};
assign s_dsfsr_3[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[3]}};
assign s_dsfsr_2[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[2]}};
assign s_dsfsr_1[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[1]}};
assign s_dsfsr_0[2:0] =
       s_dsfsr[2:0] & {3 {s_dsfsr_dec_tid[0]}};

assign s_dsfar_7[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[7]}};
assign s_dsfar_6[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[6]}};
assign s_dsfar_5[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[5]}};
assign s_dsfar_4[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[4]}};
assign s_dsfar_3[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[3]}};
assign s_dsfar_2[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[2]}};
assign s_dsfar_1[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[1]}};
assign s_dsfar_0[2:0] =
       s_dsfar[2:0] & {3 {s_dsfsr_dec_tid[0]}};



//////////////////////////////////////////////////////////////////////////////
//
//  Instantiate ISFSRs
//

assign isfsr_7_new_in[2:0] = 
       pipe_isfsr_7[2:0] | m_isfsr_7[2:0] ;
assign isfsr_6_new_in[2:0] = 
       pipe_isfsr_6[2:0] | m_isfsr_6[2:0] ;
assign isfsr_5_new_in[2:0] = 
       pipe_isfsr_5[2:0] | m_isfsr_5[2:0] ;
assign isfsr_4_new_in[2:0] = 
       pipe_isfsr_4[2:0] | m_isfsr_4[2:0] ;
assign isfsr_3_new_in[2:0] = 
       pipe_isfsr_3[2:0] | m_isfsr_3[2:0] ;
assign isfsr_2_new_in[2:0] = 
       pipe_isfsr_2[2:0] | m_isfsr_2[2:0] ;
assign isfsr_1_new_in[2:0] = 
       pipe_isfsr_1[2:0] | m_isfsr_1[2:0] ;
assign isfsr_0_new_in[2:0] = 
       pipe_isfsr_0[2:0] | m_isfsr_0[2:0] ;

assign isfsr_7_in[2:0] =
       (isfsr_7_new_in[2:0] & {3 {~asi_wr_isfsr[7]}}) |
       (isfsr_7[2:0] & ~{3 {| {asi_wr_isfsr[7], isfsr_7_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[7]}}) ;
assign isfsr_6_in[2:0] =
       (isfsr_6_new_in[2:0] & {3 {~asi_wr_isfsr[6]}}) |
       (isfsr_6[2:0] & ~{3 {| {asi_wr_isfsr[6], isfsr_6_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[6]}}) ;
assign isfsr_5_in[2:0] =
       (isfsr_5_new_in[2:0] & {3 {~asi_wr_isfsr[5]}}) |
       (isfsr_5[2:0] & ~{3 {| {asi_wr_isfsr[5], isfsr_5_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[5]}}) ;
assign isfsr_4_in[2:0] =
       (isfsr_4_new_in[2:0] & {3 {~asi_wr_isfsr[4]}}) |
       (isfsr_4[2:0] & ~{3 {| {asi_wr_isfsr[4], isfsr_4_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[4]}}) ;
assign isfsr_3_in[2:0] =
       (isfsr_3_new_in[2:0] & {3 {~asi_wr_isfsr[3]}}) |
       (isfsr_3[2:0] & ~{3 {| {asi_wr_isfsr[3], isfsr_3_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[3]}}) ;
assign isfsr_2_in[2:0] =
       (isfsr_2_new_in[2:0] & {3 {~asi_wr_isfsr[2]}}) |
       (isfsr_2[2:0] & ~{3 {| {asi_wr_isfsr[2], isfsr_2_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[2]}}) ;
assign isfsr_1_in[2:0] =
       (isfsr_1_new_in[2:0] & {3 {~asi_wr_isfsr[1]}}) |
       (isfsr_1[2:0] & ~{3 {| {asi_wr_isfsr[1], isfsr_1_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[1]}}) ;
assign isfsr_0_in[2:0] =
       (isfsr_0_new_in[2:0] & {3 {~asi_wr_isfsr[0]}}) |
       (isfsr_0[2:0] & ~{3 {| {asi_wr_isfsr[0], isfsr_0_new_in[2:0]}}}) |
       (asi_wr_data[2:0] & {3 { asi_wr_isfsr[0]}}) ;

assign precise_i_error[7:0] = 
       { | {pipe_isfsr_7[2:0], m_isfsr_7[2:0]}, 
         | {pipe_isfsr_6[2:0], m_isfsr_6[2:0]}, 
         | {pipe_isfsr_5[2:0], m_isfsr_5[2:0]}, 
         | {pipe_isfsr_4[2:0], m_isfsr_4[2:0]}, 
         | {pipe_isfsr_3[2:0], m_isfsr_3[2:0]}, 
         | {pipe_isfsr_2[2:0], m_isfsr_2[2:0]}, 
         | {pipe_isfsr_1[2:0], m_isfsr_1[2:0]}, 
	 | {pipe_isfsr_0[2:0], m_isfsr_0[2:0]} };


tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_7_lat  ( 
	.scan_in(isfsr_7_lat_wmr_scanin),
	.scan_out(isfsr_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_7_in		[2:0]	),
	.dout	(isfsr_7		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_6_lat  ( 
	.scan_in(isfsr_6_lat_wmr_scanin),
	.scan_out(isfsr_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_6_in		[2:0]	),
	.dout	(isfsr_6		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_5_lat  ( 
	.scan_in(isfsr_5_lat_wmr_scanin),
	.scan_out(isfsr_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_5_in		[2:0]	),
	.dout	(isfsr_5		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_4_lat  ( 
	.scan_in(isfsr_4_lat_wmr_scanin),
	.scan_out(isfsr_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_4_in		[2:0]	),
	.dout	(isfsr_4		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_3_lat  ( 
	.scan_in(isfsr_3_lat_wmr_scanin),
	.scan_out(isfsr_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_3_in		[2:0]	),
	.dout	(isfsr_3		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_2_lat  ( 
	.scan_in(isfsr_2_lat_wmr_scanin),
	.scan_out(isfsr_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_2_in		[2:0]	),
	.dout	(isfsr_2		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_1_lat  ( 
	.scan_in(isfsr_1_lat_wmr_scanin),
	.scan_out(isfsr_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_1_in		[2:0]	),
	.dout	(isfsr_1		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 isfsr_0_lat  ( 
	.scan_in(isfsr_0_lat_wmr_scanin),
	.scan_out(isfsr_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(isfsr_0_in		[2:0]	),
	.dout	(isfsr_0		[2:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
//  Instantiate DSFSRs
//

assign dsfsr_7_new_in[3:0] = 
       {1'b0, pipe_dsfsr_7[2:0]} | {1'b0, m_dsfsr_7[2:0]} | 
       a_dsfsr_7[3:0] | t_dsfsr_7[3:0] | {{1 {1'b0}}, l_dsfsr_7[2:0]} | 
       {1'b0, s_dsfsr_7[2:0]} ;
assign dsfsr_6_new_in[3:0] = 
       {1'b0, pipe_dsfsr_6[2:0]} | {1'b0, m_dsfsr_6[2:0]} | 
       a_dsfsr_6[3:0] | t_dsfsr_6[3:0] | {{1 {1'b0}}, l_dsfsr_6[2:0]} | 
       {1'b0, s_dsfsr_6[2:0]} ;
assign dsfsr_5_new_in[3:0] = 
       {1'b0, pipe_dsfsr_5[2:0]} | {1'b0, m_dsfsr_5[2:0]} | 
       a_dsfsr_5[3:0] | t_dsfsr_5[3:0] | {{1 {1'b0}}, l_dsfsr_5[2:0]} | 
       {1'b0, s_dsfsr_5[2:0]} ;
assign dsfsr_4_new_in[3:0] = 
       {1'b0, pipe_dsfsr_4[2:0]} | {1'b0, m_dsfsr_4[2:0]} | 
       a_dsfsr_4[3:0] | t_dsfsr_4[3:0] | {{1 {1'b0}}, l_dsfsr_4[2:0]} | 
       {1'b0, s_dsfsr_4[2:0]} ;
assign dsfsr_3_new_in[3:0] = 
       {1'b0, pipe_dsfsr_3[2:0]} | {1'b0, m_dsfsr_3[2:0]} | 
       a_dsfsr_3[3:0] | t_dsfsr_3[3:0] | {{1 {1'b0}}, l_dsfsr_3[2:0]} | 
       {1'b0, s_dsfsr_3[2:0]} ;
assign dsfsr_2_new_in[3:0] = 
       {1'b0, pipe_dsfsr_2[2:0]} | {1'b0, m_dsfsr_2[2:0]} | 
       a_dsfsr_2[3:0] | t_dsfsr_2[3:0] | {{1 {1'b0}}, l_dsfsr_2[2:0]} | 
       {1'b0, s_dsfsr_2[2:0]} ;
assign dsfsr_1_new_in[3:0] = 
       {1'b0, pipe_dsfsr_1[2:0]} | {1'b0, m_dsfsr_1[2:0]} | 
       a_dsfsr_1[3:0] | t_dsfsr_1[3:0] | {{1 {1'b0}}, l_dsfsr_1[2:0]} | 
       {1'b0, s_dsfsr_1[2:0]} ;
assign dsfsr_0_new_in[3:0] = 
       {1'b0, pipe_dsfsr_0[2:0]} | {1'b0, m_dsfsr_0[2:0]} | 
       a_dsfsr_0[3:0] | t_dsfsr_0[3:0] | {{1 {1'b0}}, l_dsfsr_0[2:0]} | 
       {1'b0, s_dsfsr_0[2:0]} ;

assign dsfsr_7_in[3:0] =
       (dsfsr_7_new_in[3:0] & {4 {~asi_wr_dsfsr[7]}}) |
       (dsfsr_7[3:0] & ~{4 {| {asi_wr_dsfsr[7], dsfsr_7_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[7]}}) ;
assign dsfsr_6_in[3:0] =
       (dsfsr_6_new_in[3:0] & {4 {~asi_wr_dsfsr[6]}}) |
       (dsfsr_6[3:0] & ~{4 {| {asi_wr_dsfsr[6], dsfsr_6_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[6]}}) ;
assign dsfsr_5_in[3:0] =
       (dsfsr_5_new_in[3:0] & {4 {~asi_wr_dsfsr[5]}}) |
       (dsfsr_5[3:0] & ~{4 {| {asi_wr_dsfsr[5], dsfsr_5_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[5]}}) ;
assign dsfsr_4_in[3:0] =
       (dsfsr_4_new_in[3:0] & {4 {~asi_wr_dsfsr[4]}}) |
       (dsfsr_4[3:0] & ~{4 {| {asi_wr_dsfsr[4], dsfsr_4_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[4]}}) ;
assign dsfsr_3_in[3:0] =
       (dsfsr_3_new_in[3:0] & {4 {~asi_wr_dsfsr[3]}}) |
       (dsfsr_3[3:0] & ~{4 {| {asi_wr_dsfsr[3], dsfsr_3_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[3]}}) ;
assign dsfsr_2_in[3:0] =
       (dsfsr_2_new_in[3:0] & {4 {~asi_wr_dsfsr[2]}}) |
       (dsfsr_2[3:0] & ~{4 {| {asi_wr_dsfsr[2], dsfsr_2_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[2]}}) ;
assign dsfsr_1_in[3:0] =
       (dsfsr_1_new_in[3:0] & {4 {~asi_wr_dsfsr[1]}}) |
       (dsfsr_1[3:0] & ~{4 {| {asi_wr_dsfsr[1], dsfsr_1_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[1]}}) ;
assign dsfsr_0_in[3:0] =
       (dsfsr_0_new_in[3:0] & {4 {~asi_wr_dsfsr[0]}}) |
       (dsfsr_0[3:0] & ~{4 {| {asi_wr_dsfsr[0], dsfsr_0_new_in[3:0]}}}) |
       (asi_wr_data[3:0] & {4 { asi_wr_dsfsr[0]}}) ;

assign precise_d_error[7:0] = 
       { | {pipe_dsfsr_7[2:0], m_dsfsr_7[2:0], a_dsfsr_7[3:0],
	    t_dsfsr_7[3:0], l_dsfsr_7[2:0], s_dsfsr_7[2:0]},
         | {pipe_dsfsr_6[2:0], m_dsfsr_6[2:0], a_dsfsr_6[3:0],
	    t_dsfsr_6[3:0], l_dsfsr_6[2:0], s_dsfsr_6[2:0]},
         | {pipe_dsfsr_5[2:0], m_dsfsr_5[2:0], a_dsfsr_5[3:0],
	    t_dsfsr_5[3:0], l_dsfsr_5[2:0], s_dsfsr_5[2:0]},
         | {pipe_dsfsr_4[2:0], m_dsfsr_4[2:0], a_dsfsr_4[3:0],
	    t_dsfsr_4[3:0], l_dsfsr_4[2:0], s_dsfsr_4[2:0]},
         | {pipe_dsfsr_3[2:0], m_dsfsr_3[2:0], a_dsfsr_3[3:0],
	    t_dsfsr_3[3:0], l_dsfsr_3[2:0], s_dsfsr_3[2:0]},
         | {pipe_dsfsr_2[2:0], m_dsfsr_2[2:0], a_dsfsr_2[3:0],
	    t_dsfsr_2[3:0], l_dsfsr_2[2:0], s_dsfsr_2[2:0]},
         | {pipe_dsfsr_1[2:0], m_dsfsr_1[2:0], a_dsfsr_1[3:0],
	    t_dsfsr_1[3:0], l_dsfsr_1[2:0], s_dsfsr_1[2:0]},
         | {pipe_dsfsr_0[2:0], m_dsfsr_0[2:0], a_dsfsr_0[3:0],
	    t_dsfsr_0[3:0], l_dsfsr_0[2:0], s_dsfsr_0[2:0]}};

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_7_lat  ( 
	.scan_in(dsfsr_7_lat_wmr_scanin),
	.scan_out(dsfsr_7_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_7_in		[3:0]	),
	.dout	(dsfsr_7		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_6_lat  ( 
	.scan_in(dsfsr_6_lat_wmr_scanin),
	.scan_out(dsfsr_6_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_6_in		[3:0]	),
	.dout	(dsfsr_6		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_5_lat  ( 
	.scan_in(dsfsr_5_lat_wmr_scanin),
	.scan_out(dsfsr_5_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_5_in		[3:0]	),
	.dout	(dsfsr_5		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_4_lat  ( 
	.scan_in(dsfsr_4_lat_wmr_scanin),
	.scan_out(dsfsr_4_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_4_in		[3:0]	),
	.dout	(dsfsr_4		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_3_lat  ( 
	.scan_in(dsfsr_3_lat_wmr_scanin),
	.scan_out(dsfsr_3_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_3_in		[3:0]	),
	.dout	(dsfsr_3		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_2_lat  ( 
	.scan_in(dsfsr_2_lat_wmr_scanin),
	.scan_out(dsfsr_2_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_2_in		[3:0]	),
	.dout	(dsfsr_2		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_1_lat  ( 
	.scan_in(dsfsr_1_lat_wmr_scanin),
	.scan_out(dsfsr_1_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_1_in		[3:0]	),
	.dout	(dsfsr_1		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_4 dsfsr_0_lat  ( 
	.scan_in(dsfsr_0_lat_wmr_scanin),
	.scan_out(dsfsr_0_lat_wmr_scanout),
	.siclk(spc_aclk_wmr),
	.din	(dsfsr_0_in		[3:0]	),
	.dout	(dsfsr_0		[3:0]	),
  .l1clk(l1clk),
  .soclk(soclk)
);



//////////////////////////////////////////////////////////////////////////////
//
//  ASI reads
//

tlu_ras_ctl_msff_ctl_macro__width_8 asi_rd_ctl_lat  (
	.scan_in(asi_rd_ctl_lat_scanin),
	.scan_out(asi_rd_ctl_lat_scanout),
	.din	({asi_rd_isfsr		       ,
		  asi_rd_dsfsr		       ,
		  asi_rd_dsfar		       ,
		  asi_rd_desr		       ,
		  asi_rd_fesr		       ,
		  asi_rd_tid		[2:0]}),
	.dout	({rd_isfsr		       ,
		  rd_dsfsr		       ,
		  rd_dsfar		       ,
		  rd_desr		       ,
		  rd_fesr		       ,
		  rd_tid		[2:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign rd_tid_dec[7:0] = 
       { rd_tid[2] &  rd_tid[1] &  rd_tid[0],
         rd_tid[2] &  rd_tid[1] & ~rd_tid[0],
         rd_tid[2] & ~rd_tid[1] &  rd_tid[0],
         rd_tid[2] & ~rd_tid[1] & ~rd_tid[0],
        ~rd_tid[2] &  rd_tid[1] &  rd_tid[0],
        ~rd_tid[2] &  rd_tid[1] & ~rd_tid[0],
        ~rd_tid[2] & ~rd_tid[1] &  rd_tid[0],
        ~rd_tid[2] & ~rd_tid[1] & ~rd_tid[0]}; 

assign rd_isfsr_dec[7:0] =
       {8 {rd_isfsr}} & rd_tid_dec[7:0];

assign rd_dsfsr_dec[7:0] =
       {8 {rd_dsfsr}} & rd_tid_dec[7:0];

assign rd_desr_dec[7:0] =
       {8 {rd_desr}} & rd_tid_dec[7:0];

assign ras_rd_dsfar[7:0] =
       {8 {rd_dsfar}} & rd_tid_dec[7:0];

assign ras_rd_desr[7:0] =
       {8 {rd_desr}} & rd_tid_dec[7:0];

assign ras_rd_fesr[7:0] =
       {8 {rd_fesr}} & rd_tid_dec[7:0];

assign ras_asi_data[3:0] =
       ({1'b0, isfsr_7[2:0]} & {4 {rd_isfsr_dec[7]}}) |
       ({1'b0, isfsr_6[2:0]} & {4 {rd_isfsr_dec[6]}}) |
       ({1'b0, isfsr_5[2:0]} & {4 {rd_isfsr_dec[5]}}) |
       ({1'b0, isfsr_4[2:0]} & {4 {rd_isfsr_dec[4]}}) |
       ({1'b0, isfsr_3[2:0]} & {4 {rd_isfsr_dec[3]}}) |
       ({1'b0, isfsr_2[2:0]} & {4 {rd_isfsr_dec[2]}}) |
       ({1'b0, isfsr_1[2:0]} & {4 {rd_isfsr_dec[1]}}) |
       ({1'b0, isfsr_0[2:0]} & {4 {rd_isfsr_dec[0]}}) |
       (       dsfsr_7[3:0]  & {4 {rd_dsfsr_dec[7]}}) |
       (       dsfsr_6[3:0]  & {4 {rd_dsfsr_dec[6]}}) |
       (       dsfsr_5[3:0]  & {4 {rd_dsfsr_dec[5]}}) |
       (       dsfsr_4[3:0]  & {4 {rd_dsfsr_dec[4]}}) |
       (       dsfsr_3[3:0]  & {4 {rd_dsfsr_dec[3]}}) |
       (       dsfsr_2[3:0]  & {4 {rd_dsfsr_dec[2]}}) |
       (       dsfsr_1[3:0]  & {4 {rd_dsfsr_dec[1]}}) |
       (       dsfsr_0[3:0]  & {4 {rd_dsfsr_dec[0]}}) ;


       
//////////////////////////////////////////////////////////////////////////////
//
//  Prepare DSFAR data
//

assign ras_dsfar_7[19:0] =
       pipe_dsfar_7[19:0] |
       {{17 {1'b0}}, m_dsfar_7[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_7[10:0]} | 
       {{11 {1'b0}}, l_dsfar_7[8:0]} | 
       {{17 {1'b0}}, s_dsfar_7[2:0]} ;
assign ras_dsfar_6[19:0] =
       pipe_dsfar_6[19:0] |
       {{17 {1'b0}}, m_dsfar_6[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_6[10:0]} | 
       {{11 {1'b0}}, l_dsfar_6[8:0]} | 
       {{17 {1'b0}}, s_dsfar_6[2:0]} ;
assign ras_dsfar_5[19:0] =
       pipe_dsfar_5[19:0] |
       {{17 {1'b0}}, m_dsfar_5[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_5[10:0]} | 
       {{11 {1'b0}}, l_dsfar_5[8:0]} | 
       {{17 {1'b0}}, s_dsfar_5[2:0]} ;
assign ras_dsfar_4[19:0] =
       pipe_dsfar_4[19:0] |
       {{17 {1'b0}}, m_dsfar_4[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_4[10:0]} | 
       {{11 {1'b0}}, l_dsfar_4[8:0]} | 
       {{17 {1'b0}}, s_dsfar_4[2:0]} ;
assign ras_dsfar_3[19:0] =
       pipe_dsfar_3[19:0] |
       {{17 {1'b0}}, m_dsfar_3[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_3[10:0]} | 
       {{11 {1'b0}}, l_dsfar_3[8:0]} | 
       {{17 {1'b0}}, s_dsfar_3[2:0]} ;
assign ras_dsfar_2[19:0] =
       pipe_dsfar_2[19:0] |
       {{17 {1'b0}}, m_dsfar_2[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_2[10:0]} | 
       {{11 {1'b0}}, l_dsfar_2[8:0]} | 
       {{17 {1'b0}}, s_dsfar_2[2:0]} ;
assign ras_dsfar_1[19:0] =
       pipe_dsfar_1[19:0] |
       {{17 {1'b0}}, m_dsfar_1[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_1[10:0]} | 
       {{11 {1'b0}}, l_dsfar_1[8:0]} | 
       {{17 {1'b0}}, s_dsfar_1[2:0]} ;
assign ras_dsfar_0[19:0] =
       pipe_dsfar_0[19:0] |
       {{17 {1'b0}}, m_dsfar_0[2:0]} |
       {{ 9 {1'b0}}, a_dsfar_0[10:0]} | 
       {{11 {1'b0}}, l_dsfar_0[8:0]} | 
       {{17 {1'b0}}, s_dsfar_0[2:0]} ;

assign ras_dsfar_sel_ras[7:0] =
       {| {dsfsr_7_new_in[3:0], itmu_7, dtmu_7}, 
	| {dsfsr_6_new_in[3:0], itmu_6, dtmu_6},
        | {dsfsr_5_new_in[3:0], itmu_5, dtmu_5}, 
	| {dsfsr_4_new_in[3:0], itmu_4, dtmu_4},
        | {dsfsr_3_new_in[3:0], itmu_3, dtmu_3}, 
	| {dsfsr_2_new_in[3:0], itmu_2, dtmu_2},
        | {dsfsr_1_new_in[3:0], itmu_1, dtmu_1}, 
	| {dsfsr_0_new_in[3:0], itmu_0, dtmu_0}} &
       ~dsfar_sel_lsu_va_for_error[7:0];

       
//////////////////////////////////////////////////////////////////////////////
//
//  Handle disrupting errors
//

// Data cache errors -- long latency and implemented as precise but
//  technically disrupting
//
// DESR
// dcvp		0101
// dctp		0110
// dctm		0111
// dcdp		1000
// All these have S = 0

tlu_ras_ctl_msff_ctl_macro__width_1 dcvp_lat  (
	.scan_in(dcvp_lat_scanin),
	.scan_out(dcvp_lat_scanout),
	.din	(lsu_dcvp_err_g			),
	.dout	(dcvp				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dctp_lat  (
	.scan_in(dctp_lat_scanin),
	.scan_out(dctp_lat_scanout),
	.din	(lsu_dctp_err_g			),
	.dout	(dctp				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dctm_lat  (
	.scan_in(dctm_lat_scanin),
	.scan_out(dctm_lat_scanout),
	.din	(lsu_dcmh_err_g			),
	.dout	(dctm				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 dcdp_lat  (
	.scan_in(dcdp_lat_scanin),
	.scan_out(dcdp_lat_scanout),
	.din	(lsu_dcdp_err_g			),
	.dout	(dcdp				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign d_dec_tid[7:0] =
       { l_tid[2] &  l_tid[1] &  l_tid[0],
         l_tid[2] &  l_tid[1] & ~l_tid[0],
         l_tid[2] & ~l_tid[1] &  l_tid[0],
         l_tid[2] & ~l_tid[1] & ~l_tid[0],
        ~l_tid[2] &  l_tid[1] &  l_tid[0],
        ~l_tid[2] &  l_tid[1] & ~l_tid[0],
        ~l_tid[2] & ~l_tid[1] &  l_tid[0],
        ~l_tid[2] & ~l_tid[1] & ~l_tid[0]} & {8 {dcvp | dctp | dctm | dcdp}};

assign d_desr_et[3:0] =
       ({4 {dcvp}} & 4'b0101) |
       ({4 {dctp}} & 4'b0110) |
       ({4 {dctm}} & 4'b0111) |
       ({4 {dcdp}} & 4'b1000) ;

assign d_desr_et_7[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[7]}};
assign d_desr_et_6[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[6]}};
assign d_desr_et_5[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[5]}};
assign d_desr_et_4[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[4]}};
assign d_desr_et_3[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[3]}};
assign d_desr_et_2[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[2]}};
assign d_desr_et_1[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[1]}};
assign d_desr_et_0[3:0] =
       d_desr_et[3:0] & {4 {d_dec_tid[0]}};

assign d_desr_ea_7[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[7]}};
assign d_desr_ea_6[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[6]}};
assign d_desr_ea_5[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[5]}};
assign d_desr_ea_4[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[4]}};
assign d_desr_ea_3[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[3]}};
assign d_desr_ea_2[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[2]}};
assign d_desr_ea_1[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[1]}};
assign d_desr_ea_0[8:0] =
       l_dsfar[8:0] & {9 {d_dec_tid[0]}};


//  L2 and SOC errors
//
// DESR
// l2ch		01001
// l2u		10000
// l2nd		10001
// soc		01011
// sou		10011
// l2cs		10100
// l2ch and soc has S = 0, others have S = 1

tlu_ras_ctl_msff_ctl_macro__width_8 cxi_lat  (
	.scan_in(cxi_lat_scanin),
	.scan_out(cxi_lat_scanout),
	.din	({cxi_l2_err		       ,
		  cxi_soc_err		       ,
		  cxi_l2_soc_err_type	[1:0],
		  cxi_l2_soc_tid	[2:0],
		  cxi_l2_soc_sre	       }),
	.dout	({l2_err		       ,
		  soc_err		       ,
		  c_l2_soc_err_type	[1:0],
		  c_l2_soc_tid		[2:0],
		  c_l2_soc_sre	       	       }),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign c_l2_soc_dec_tid[7:0] =
       { c_l2_soc_tid[2] &  c_l2_soc_tid[1] &  c_l2_soc_tid[0],
         c_l2_soc_tid[2] &  c_l2_soc_tid[1] & ~c_l2_soc_tid[0],
         c_l2_soc_tid[2] & ~c_l2_soc_tid[1] &  c_l2_soc_tid[0],
         c_l2_soc_tid[2] & ~c_l2_soc_tid[1] & ~c_l2_soc_tid[0],
        ~c_l2_soc_tid[2] &  c_l2_soc_tid[1] &  c_l2_soc_tid[0],
        ~c_l2_soc_tid[2] &  c_l2_soc_tid[1] & ~c_l2_soc_tid[0],
        ~c_l2_soc_tid[2] & ~c_l2_soc_tid[1] &  c_l2_soc_tid[0],
        ~c_l2_soc_tid[2] & ~c_l2_soc_tid[1] & ~c_l2_soc_tid[0]};

assign c_l2_err[7:0] =
       {8 {l2_err}} & c_l2_soc_dec_tid[7:0];
	
assign c_soc_err[7:0] =
       {8 {soc_err}} & c_l2_soc_dec_tid[7:0];
	
assign l2_dec_tid[7:0] =
       c_l2_err[7:0] | c_soc_err[7:0];

assign l2ch =
       (c_l2_soc_err_type[1:0] == 2'b01) & l2_err & ~c_l2_soc_sre;
assign l2cs =
       (c_l2_soc_err_type[1:0] == 2'b01) & l2_err &  c_l2_soc_sre;
assign soc =
       (c_l2_soc_err_type[1:0] == 2'b01) & soc_err;
assign l2u =
       (c_l2_soc_err_type[1:0] == 2'b10) & l2_err;
assign sou =
       (c_l2_soc_err_type[1:0] == 2'b10) & soc_err;
assign l2nd =
       (c_l2_soc_err_type[1:0] == 2'b11) & l2_err;

assign l2_desr_et[5:0] =
       ({6 {l2ch}} & 6'b001001) |
       ({6 {l2u }} & 6'b110000) |
       ({6 {l2nd}} & 6'b110001) |
       ({6 {soc }} & 6'b001011) |
       ({6 {sou }} & 6'b110011) |
       ({6 {l2cs}} & 6'b110100) ;

assign l2_desr_et_7[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[7]}};
assign l2_desr_et_6[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[6]}};
assign l2_desr_et_5[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[5]}};
assign l2_desr_et_4[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[4]}};
assign l2_desr_et_3[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[3]}};
assign l2_desr_et_2[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[2]}};
assign l2_desr_et_1[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[1]}};
assign l2_desr_et_0[5:0] =
       l2_desr_et[5:0] & {6 {l2_dec_tid[0]}};

// No data stored in DESR.EA for L2 or SOC errors



// Store buffer errors
//
// DESR
// sbdpc	01010
// sbdpu	00110
// sbdpu has S = 1

tlu_ras_ctl_msff_ctl_macro__width_1 sbdpc_lat  (
	.scan_in(sbdpc_lat_scanin),
	.scan_out(sbdpc_lat_scanout),
	.din	(lsu_sbdpc_err_g		),
	.dout	(sbdpc				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 sbdpu_lat  (
	.scan_in(sbdpu_lat_scanin),
	.scan_out(sbdpu_lat_scanout),
	.din	(lsu_sbdpu_err_g		),
	.dout	(sbdpu				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign sb_dec_tid[7:0] =
       {s_tid[2:0] == 3'b111,
	s_tid[2:0] == 3'b110,
	s_tid[2:0] == 3'b101,
	s_tid[2:0] == 3'b100,
	s_tid[2:0] == 3'b011,
	s_tid[2:0] == 3'b010,
	s_tid[2:0] == 3'b001,
	s_tid[2:0] == 3'b000} & {8 {sbdpc | sbdpu}};

assign s_desr_et[5:0] =
       {sbdpu, 1'b0, sbdpc, sbdpu, sbdpu | sbdpc, 1'b0};

assign s_desr_et_7[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[7]}};
assign s_desr_et_6[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[6]}};
assign s_desr_et_5[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[5]}};
assign s_desr_et_4[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[4]}};
assign s_desr_et_3[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[3]}};
assign s_desr_et_2[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[2]}};
assign s_desr_et_1[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[1]}};
assign s_desr_et_0[5:0] =
       s_desr_et[5:0] & {6 {sb_dec_tid[0]}};

assign s_desr_ea_7[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[7]}};
assign s_desr_ea_6[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[6]}};
assign s_desr_ea_5[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[5]}};
assign s_desr_ea_4[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[4]}};
assign s_desr_ea_3[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[3]}};
assign s_desr_ea_2[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[2]}};
assign s_desr_ea_1[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[1]}};
assign s_desr_ea_0[2:0] = 
       s_dsfar[2:0] & {3 {sb_dec_tid[0]}};



// SPU errors
//
// DESR
// mamu		00111
// mal2c	01000
// mal2u	01001
// mal2nd	01010
// cwql2c	01011
// cwql2u	01100
// cwql2nd	01101
// All have S = 1

// 10 -  ma_copy; 9:8 - syndrome; 7:0 - MA index
tlu_ras_ctl_msff_ctl_macro__width_12 mamu_err_lat  (
	.scan_in(mamu_err_lat_scanin),
	.scan_out(mamu_err_lat_scanout),
	.din	({spu_tlu_mamu_err_req_v       ,
 		  spu_tlu_mamu_err_req	[10:0]}),
	.dout	({mamu_err_v		       ,
		  mamu_err		[10:0]}),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign mamu_dec_tid[7:0] =
       ma_dec_tid[7:0] & {8 {mamu_err_v}};

assign mamu_desr_et[5:0] =
       6'b100111;

assign mamu_desr_et_7[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[7]}};
assign mamu_desr_et_6[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[6]}};
assign mamu_desr_et_5[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[5]}};
assign mamu_desr_et_4[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[4]}};
assign mamu_desr_et_3[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[3]}};
assign mamu_desr_et_2[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[2]}};
assign mamu_desr_et_1[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[1]}};
assign mamu_desr_et_0[5:0] =
       mamu_desr_et[5:0] & {6 {mamu_dec_tid[0]}};

assign mamu_desr_ea_7[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[7]}};
assign mamu_desr_ea_6[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[6]}};
assign mamu_desr_ea_5[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[5]}};
assign mamu_desr_ea_4[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[4]}};
assign mamu_desr_ea_3[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[3]}};
assign mamu_desr_ea_2[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[2]}};
assign mamu_desr_ea_1[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[1]}};
assign mamu_desr_ea_0[10:0] =
       mamu_err[10:0] & {11 {mamu_dec_tid[0]}};

tlu_ras_ctl_msff_ctl_macro__width_3 ma_tid_lat  (
	.scan_in(ma_tid_lat_scanin),
	.scan_out(ma_tid_lat_scanout),
	.din	(spu_tlu_ma_int_req	[2:0]	),
	.dout	(ma_tid			[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_3 cwq_tid_lat  (
	.scan_in(cwq_tid_lat_scanin),
	.scan_out(cwq_tid_lat_scanout),
	.din	(spu_tlu_cwq_int_req	[2:0]	),
	.dout	(cwq_tid		[2:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_6 spu_error_lat  (
	.scan_in(spu_error_lat_scanin),
	.scan_out(spu_error_lat_scanout),
	.din	(spu_tlu_l2_error	[5:0]	),
	.dout	(spu_error		[5:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ma_dec_tid[7:0] =
       {ma_tid[2:0] == 3'b111,
        ma_tid[2:0] == 3'b110,
        ma_tid[2:0] == 3'b101,
        ma_tid[2:0] == 3'b100,
        ma_tid[2:0] == 3'b011,
        ma_tid[2:0] == 3'b010,
        ma_tid[2:0] == 3'b001,
        ma_tid[2:0] == 3'b000};

assign cwq_dec_tid[7:0] =
       {cwq_tid[2:0] == 3'b111,
        cwq_tid[2:0] == 3'b110,
        cwq_tid[2:0] == 3'b101,
        cwq_tid[2:0] == 3'b100,
        cwq_tid[2:0] == 3'b011,
        cwq_tid[2:0] == 3'b010,
        cwq_tid[2:0] == 3'b001,
        cwq_tid[2:0] == 3'b000};

assign mal2c =
       spu_error[5];
assign mal2u =
       spu_error[4];
assign mal2nd =
       spu_error[3];
assign cwql2c =
       spu_error[2];
assign cwql2u =
       spu_error[1];
assign cwql2nd =
       spu_error[0];

assign ma_desr_et[5:0] =
       ({6 {mal2c  }} & 6'b101000) | 
       ({6 {mal2u  }} & 6'b101001) | 
       ({6 {mal2nd }} & 6'b101010) ;

assign cwq_desr_et[5:0] =
       ({6 {cwql2c }} & 6'b101011) | 
       ({6 {cwql2u }} & 6'b101100) | 
       ({6 {cwql2nd}} & 6'b101101) ;

assign ma_desr_et_7[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[7]}};
assign ma_desr_et_6[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[6]}};
assign ma_desr_et_5[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[5]}};
assign ma_desr_et_4[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[4]}};
assign ma_desr_et_3[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[3]}};
assign ma_desr_et_2[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[2]}};
assign ma_desr_et_1[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[1]}};
assign ma_desr_et_0[5:0] =
       ma_desr_et[5:0] & {6 {ma_dec_tid[0]}};

assign cwq_desr_et_7[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[7]}};
assign cwq_desr_et_6[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[6]}};
assign cwq_desr_et_5[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[5]}};
assign cwq_desr_et_4[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[4]}};
assign cwq_desr_et_3[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[3]}};
assign cwq_desr_et_2[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[2]}};
assign cwq_desr_et_1[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[1]}};
assign cwq_desr_et_0[5:0] =
       cwq_desr_et[5:0] & {6 {cwq_dec_tid[0]}};

// ma and cwq are all L2 errors so no DESR.EA for them



// TCA errors
//
// DESR
// tccd		01110
// tcud		01111
// Both have S = 1

assign t_desr_et_7[5:0] =
       ({6 {tlu_tccd[7]}} & 6'b101110) | 
       ({6 {tlu_tcud[7]}} & 6'b101111) ;
assign t_desr_et_6[5:0] =
       ({6 {tlu_tccd[6]}} & 6'b101110) | 
       ({6 {tlu_tcud[6]}} & 6'b101111) ;
assign t_desr_et_5[5:0] =
       ({6 {tlu_tccd[5]}} & 6'b101110) | 
       ({6 {tlu_tcud[5]}} & 6'b101111) ;
assign t_desr_et_4[5:0] =
       ({6 {tlu_tccd[4]}} & 6'b101110) | 
       ({6 {tlu_tcud[4]}} & 6'b101111) ;
assign t_desr_et_3[5:0] =
       ({6 {tlu_tccd[3]}} & 6'b101110) | 
       ({6 {tlu_tcud[3]}} & 6'b101111) ;
assign t_desr_et_2[5:0] =
       ({6 {tlu_tccd[2]}} & 6'b101110) | 
       ({6 {tlu_tcud[2]}} & 6'b101111) ;
assign t_desr_et_1[5:0] =
       ({6 {tlu_tccd[1]}} & 6'b101110) | 
       ({6 {tlu_tcud[1]}} & 6'b101111) ;
assign t_desr_et_0[5:0] =
       ({6 {tlu_tccd[0]}} & 6'b101110) | 
       ({6 {tlu_tcud[0]}} & 6'b101111) ;

assign t_desr_ea_7[9:0] =
       {10 {tlu_tccd[7] | tlu_tcud[7]}} & 
       {cel_syndrome[7:0], tlu_tca_index_1[1:0]};
assign t_desr_ea_6[9:0] =
       {10 {tlu_tccd[6] | tlu_tcud[6]}} &
       {cel_syndrome[7:0], tlu_tca_index_1[1:0]};
assign t_desr_ea_5[9:0] =
       {10 {tlu_tccd[5] | tlu_tcud[5]}} &
       {cel_syndrome[7:0], tlu_tca_index_1[1:0]};
assign t_desr_ea_4[9:0] =
       {10 {tlu_tccd[4] | tlu_tcud[4]}} &
       {cel_syndrome[7:0], tlu_tca_index_1[1:0]};
assign t_desr_ea_3[9:0] =
       {10 {tlu_tccd[3] | tlu_tcud[3]}} &
       {cel_syndrome[7:0], tlu_tca_index_0[1:0]};
assign t_desr_ea_2[9:0] =
       {10 {tlu_tccd[2] | tlu_tcud[2]}} &
       {cel_syndrome[7:0], tlu_tca_index_0[1:0]};
assign t_desr_ea_1[9:0] =
       {10 {tlu_tccd[1] | tlu_tcud[1]}} &
       {cel_syndrome[7:0], tlu_tca_index_0[1:0]};
assign t_desr_ea_0[9:0] =
       {10 {tlu_tccd[0] | tlu_tcud[0]}} &
       {cel_syndrome[7:0], tlu_tca_index_0[1:0]};
		   



//
// DESRs
//

// Prioritize DESR exceptions
// S = 0, type 1-4, priority 11
// and S = 1, type 2, priority 6
assign pipe_desr_exc_7 = (| pipe_desr_et_7[5:0]);
assign pipe_desr_exc_6 = (| pipe_desr_et_6[5:0]);
assign pipe_desr_exc_5 = (| pipe_desr_et_5[5:0]);
assign pipe_desr_exc_4 = (| pipe_desr_et_4[5:0]);
assign pipe_desr_exc_3 = (| pipe_desr_et_3[5:0]);
assign pipe_desr_exc_2 = (| pipe_desr_et_2[5:0]);
assign pipe_desr_exc_1 = (| pipe_desr_et_1[5:0]);
assign pipe_desr_exc_0 = (| pipe_desr_et_0[5:0]);

// S = 1, type 1&3, priority 6
assign m_desr_exc_7 = m_desr_et_7[5];
assign m_desr_exc_6 = m_desr_et_6[5];
assign m_desr_exc_5 = m_desr_et_5[5];
assign m_desr_exc_4 = m_desr_et_4[5];
assign m_desr_exc_3 = m_desr_et_3[5];
assign m_desr_exc_2 = m_desr_et_2[5];
assign m_desr_exc_1 = m_desr_et_1[5];
assign m_desr_exc_0 = m_desr_et_0[5];

// S = 1, type 4, priority 6
// and S = 0, type 11, priority 15 (shared with l2)
assign l_desr_exc_7 = (| l_desr_et_7[5:0]);
assign l_desr_exc_6 = (| l_desr_et_6[5:0]);
assign l_desr_exc_5 = (| l_desr_et_5[5:0]);
assign l_desr_exc_4 = (| l_desr_et_4[5:0]);
assign l_desr_exc_3 = (| l_desr_et_3[5:0]);
assign l_desr_exc_2 = (| l_desr_et_2[5:0]);
assign l_desr_exc_1 = (| l_desr_et_1[5:0]);
assign l_desr_exc_0 = (| l_desr_et_0[5:0]);

// S = 0, type 5-8, priority 12
assign d_desr_exc_7 = (| d_desr_et_7[3:0]);
assign d_desr_exc_6 = (| d_desr_et_6[3:0]);
assign d_desr_exc_5 = (| d_desr_et_5[3:0]);
assign d_desr_exc_4 = (| d_desr_et_4[3:0]);
assign d_desr_exc_3 = (| d_desr_et_3[3:0]);
assign d_desr_exc_2 = (| d_desr_et_2[3:0]);
assign d_desr_exc_1 = (| d_desr_et_1[3:0]);
assign d_desr_exc_0 = (| d_desr_et_0[3:0]);

// S = 0, type 9, priority 13
// and S = 0, type 11, priority 15 (shared with l)
// and S = 1, type 16-17, priority 5
// and S = 1, type 18-19, priority 7
assign l2_desr_exc_7 = (| l2_desr_et_7[5:0]);
assign l2_desr_exc_6 = (| l2_desr_et_6[5:0]);
assign l2_desr_exc_5 = (| l2_desr_et_5[5:0]);
assign l2_desr_exc_4 = (| l2_desr_et_4[5:0]);
assign l2_desr_exc_3 = (| l2_desr_et_3[5:0]);
assign l2_desr_exc_2 = (| l2_desr_et_2[5:0]);
assign l2_desr_exc_1 = (| l2_desr_et_1[5:0]);
assign l2_desr_exc_0 = (| l2_desr_et_0[5:0]);

// S = 0, type 10, priority 14 
// and S = 1, type 6, priority 1
assign s_desr_exc_7 = (| s_desr_et_7[5:0]);
assign s_desr_exc_6 = (| s_desr_et_6[5:0]);
assign s_desr_exc_5 = (| s_desr_et_5[5:0]);
assign s_desr_exc_4 = (| s_desr_et_4[5:0]);
assign s_desr_exc_3 = (| s_desr_et_3[5:0]);
assign s_desr_exc_2 = (| s_desr_et_2[5:0]);
assign s_desr_exc_1 = (| s_desr_et_1[5:0]);
assign s_desr_exc_0 = (| s_desr_et_0[5:0]);

// S = 1, type 7, priority 3
assign mamu_desr_exc_7 = mamu_desr_et_7[5];
assign mamu_desr_exc_6 = mamu_desr_et_6[5];
assign mamu_desr_exc_5 = mamu_desr_et_5[5];
assign mamu_desr_exc_4 = mamu_desr_et_4[5];
assign mamu_desr_exc_3 = mamu_desr_et_3[5];
assign mamu_desr_exc_2 = mamu_desr_et_2[5];
assign mamu_desr_exc_1 = mamu_desr_et_1[5];
assign mamu_desr_exc_0 = mamu_desr_et_0[5];

// S = 1, type 8-10, priority 3
assign ma_desr_exc_7 = ma_desr_et_7[5];
assign ma_desr_exc_6 = ma_desr_et_6[5];
assign ma_desr_exc_5 = ma_desr_et_5[5];
assign ma_desr_exc_4 = ma_desr_et_4[5];
assign ma_desr_exc_3 = ma_desr_et_3[5];
assign ma_desr_exc_2 = ma_desr_et_2[5];
assign ma_desr_exc_1 = ma_desr_et_1[5];
assign ma_desr_exc_0 = ma_desr_et_0[5];

// S = 1, type 11-13, priority 4
assign cwq_desr_exc_7 = cwq_desr_et_7[5];
assign cwq_desr_exc_6 = cwq_desr_et_6[5];
assign cwq_desr_exc_5 = cwq_desr_et_5[5];
assign cwq_desr_exc_4 = cwq_desr_et_4[5];
assign cwq_desr_exc_3 = cwq_desr_et_3[5];
assign cwq_desr_exc_2 = cwq_desr_et_2[5];
assign cwq_desr_exc_1 = cwq_desr_et_1[5];
assign cwq_desr_exc_0 = cwq_desr_et_0[5];

// S = 1, type 14-15, priority 2
assign t_desr_exc_7 = t_desr_et_7[5];
assign t_desr_exc_6 = t_desr_et_6[5];
assign t_desr_exc_5 = t_desr_et_5[5];
assign t_desr_exc_4 = t_desr_et_4[5];
assign t_desr_exc_3 = t_desr_et_3[5];
assign t_desr_exc_2 = t_desr_et_2[5];
assign t_desr_exc_1 = t_desr_et_1[5];
assign t_desr_exc_0 = t_desr_et_0[5];

assign ras_desr_en[7] =
       pipe_desr_exc_7 | m_desr_exc_7 |    l_desr_exc_7 |  d_desr_exc_7 | 
         l2_desr_exc_7 | s_desr_exc_7 | mamu_desr_exc_7 | ma_desr_exc_7 |
        cwq_desr_exc_7 | t_desr_exc_7 | rd_desr_dec[7];
assign ras_desr_en[6] =
       pipe_desr_exc_6 | m_desr_exc_6 |    l_desr_exc_6 |  d_desr_exc_6 | 
         l2_desr_exc_6 | s_desr_exc_6 | mamu_desr_exc_6 | ma_desr_exc_6 |
        cwq_desr_exc_6 | t_desr_exc_6 | rd_desr_dec[6];
assign ras_desr_en[5] =
       pipe_desr_exc_5 | m_desr_exc_5 |    l_desr_exc_5 |  d_desr_exc_5 | 
         l2_desr_exc_5 | s_desr_exc_5 | mamu_desr_exc_5 | ma_desr_exc_5 |
        cwq_desr_exc_5 | t_desr_exc_5 | rd_desr_dec[5];
assign ras_desr_en[4] =
       pipe_desr_exc_4 | m_desr_exc_4 |    l_desr_exc_4 |  d_desr_exc_4 | 
         l2_desr_exc_4 | s_desr_exc_4 | mamu_desr_exc_4 | ma_desr_exc_4 |
        cwq_desr_exc_4 | t_desr_exc_4 | rd_desr_dec[4];
assign ras_desr_en[3] =
       pipe_desr_exc_3 | m_desr_exc_3 |    l_desr_exc_3 |  d_desr_exc_3 | 
         l2_desr_exc_3 | s_desr_exc_3 | mamu_desr_exc_3 | ma_desr_exc_3 |
        cwq_desr_exc_3 | t_desr_exc_3 | rd_desr_dec[3];
assign ras_desr_en[2] =
       pipe_desr_exc_2 | m_desr_exc_2 |    l_desr_exc_2 |  d_desr_exc_2 | 
         l2_desr_exc_2 | s_desr_exc_2 | mamu_desr_exc_2 | ma_desr_exc_2 |
        cwq_desr_exc_2 | t_desr_exc_2 | rd_desr_dec[2];
assign ras_desr_en[1] =
       pipe_desr_exc_1 | m_desr_exc_1 |    l_desr_exc_1 |  d_desr_exc_1 | 
         l2_desr_exc_1 | s_desr_exc_1 | mamu_desr_exc_1 | ma_desr_exc_1 |
        cwq_desr_exc_1 | t_desr_exc_1 | rd_desr_dec[1];
assign ras_desr_en[0] =
       pipe_desr_exc_0 | m_desr_exc_0 |    l_desr_exc_0 |  d_desr_exc_0 | 
         l2_desr_exc_0 | s_desr_exc_0 | mamu_desr_exc_0 | ma_desr_exc_0 |
        cwq_desr_exc_0 | t_desr_exc_0 | rd_desr_dec[0];
			
// Third term is to catch the case of simultaneous 
// SBDPC (type 10, priority 14) and SOCC (type 11, priority 15)
assign take_s_7 = 
       s_desr_et_7[5] | 
       (s_desr_exc_7 & ~l2_desr_exc_7     & ~d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7) |
       (s_desr_exc_7 &   l2_desr_et_7[1] & ~d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7) ;
assign take_s_6 = 
       s_desr_et_6[5] | 
       (s_desr_exc_6 & ~l2_desr_exc_6     & ~d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6) |
       (s_desr_exc_6 &   l2_desr_et_6[1] & ~d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6) ;
assign take_s_5 = 
       s_desr_et_5[5] | 
       (s_desr_exc_5 & ~l2_desr_exc_5     & ~d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5) |
       (s_desr_exc_5 &   l2_desr_et_5[1] & ~d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5) ;
assign take_s_4 = 
       s_desr_et_4[5] | 
       (s_desr_exc_4 & ~l2_desr_exc_4     & ~d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4) |
       (s_desr_exc_4 &   l2_desr_et_4[1] & ~d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4) ;
assign take_s_3 = 
       s_desr_et_3[5] | 
       (s_desr_exc_3 & ~l2_desr_exc_3     & ~d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3) |
       (s_desr_exc_3 &   l2_desr_et_3[1] & ~d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3) ;
assign take_s_2 = 
       s_desr_et_2[5] | 
       (s_desr_exc_2 & ~l2_desr_exc_2     & ~d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2) |
       (s_desr_exc_2 &   l2_desr_et_2[1] & ~d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2) ;
assign take_s_1 = 
       s_desr_et_1[5] | 
       (s_desr_exc_1 & ~l2_desr_exc_1     & ~d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1) |
       (s_desr_exc_1 &   l2_desr_et_1[1] & ~d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1) ;
assign take_s_0 = 
       s_desr_et_0[5] | 
       (s_desr_exc_0 & ~l2_desr_exc_0     & ~d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0) |
       (s_desr_exc_0 &   l2_desr_et_0[1] & ~d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0) ;

assign take_t_7 = t_desr_exc_7 & ~s_desr_et_7[5];
assign take_t_6 = t_desr_exc_6 & ~s_desr_et_6[5];
assign take_t_5 = t_desr_exc_5 & ~s_desr_et_5[5];
assign take_t_4 = t_desr_exc_4 & ~s_desr_et_4[5];
assign take_t_3 = t_desr_exc_3 & ~s_desr_et_3[5];
assign take_t_2 = t_desr_exc_2 & ~s_desr_et_2[5];
assign take_t_1 = t_desr_exc_1 & ~s_desr_et_1[5];
assign take_t_0 = t_desr_exc_0 & ~s_desr_et_0[5];

assign take_ma_7 = ma_desr_exc_7 & ~t_desr_et_7[5] & ~s_desr_et_7[5];
assign take_ma_6 = ma_desr_exc_6 & ~t_desr_et_6[5] & ~s_desr_et_6[5];
assign take_ma_5 = ma_desr_exc_5 & ~t_desr_et_5[5] & ~s_desr_et_5[5];
assign take_ma_4 = ma_desr_exc_4 & ~t_desr_et_4[5] & ~s_desr_et_4[5];
assign take_ma_3 = ma_desr_exc_3 & ~t_desr_et_3[5] & ~s_desr_et_3[5];
assign take_ma_2 = ma_desr_exc_2 & ~t_desr_et_2[5] & ~s_desr_et_2[5];
assign take_ma_1 = ma_desr_exc_1 & ~t_desr_et_1[5] & ~s_desr_et_1[5];
assign take_ma_0 = ma_desr_exc_0 & ~t_desr_et_0[5] & ~s_desr_et_0[5];

assign take_mamu_7 = mamu_desr_exc_7 & ~ma_desr_exc_7 & ~t_desr_et_7[5] & ~s_desr_et_7[5];
assign take_mamu_6 = mamu_desr_exc_6 & ~ma_desr_exc_6 & ~t_desr_et_6[5] & ~s_desr_et_6[5];
assign take_mamu_5 = mamu_desr_exc_5 & ~ma_desr_exc_5 & ~t_desr_et_5[5] & ~s_desr_et_5[5];
assign take_mamu_4 = mamu_desr_exc_4 & ~ma_desr_exc_4 & ~t_desr_et_4[5] & ~s_desr_et_4[5];
assign take_mamu_3 = mamu_desr_exc_3 & ~ma_desr_exc_3 & ~t_desr_et_3[5] & ~s_desr_et_3[5];
assign take_mamu_2 = mamu_desr_exc_2 & ~ma_desr_exc_2 & ~t_desr_et_2[5] & ~s_desr_et_2[5];
assign take_mamu_1 = mamu_desr_exc_1 & ~ma_desr_exc_1 & ~t_desr_et_1[5] & ~s_desr_et_1[5];
assign take_mamu_0 = mamu_desr_exc_0 & ~ma_desr_exc_0 & ~t_desr_et_0[5] & ~s_desr_et_0[5];

assign take_cwq_7 = cwq_desr_exc_7 & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5];
assign take_cwq_6 = cwq_desr_exc_6 & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5];
assign take_cwq_5 = cwq_desr_exc_5 & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5];
assign take_cwq_4 = cwq_desr_exc_4 & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5];
assign take_cwq_3 = cwq_desr_exc_3 & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5];
assign take_cwq_2 = cwq_desr_exc_2 & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5];
assign take_cwq_1 = cwq_desr_exc_1 & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5];
assign take_cwq_0 = cwq_desr_exc_0 & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5];

assign take_l2_7 = (l2_desr_et_7[5] & ~l2_desr_et_7[1] &                                                              ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) | 
                   (l2_desr_et_7[5] &  l2_desr_et_7[1] & ~pipe_desr_et_7[5]  & ~m_desr_et_7[5] & ~l_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) | 
		   (l2_desr_exc_7 & ~l2_desr_et_7[1] &                 ~d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7) |
		   (l2_desr_exc_7 &  l2_desr_et_7[1] & ~s_desr_exc_7 & ~d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7) ;
assign take_l2_6 = (l2_desr_et_6[5] & ~l2_desr_et_6[1] &          							~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) | 
                   (l2_desr_et_6[5] &  l2_desr_et_6[1] & ~pipe_desr_et_6[5]  & ~m_desr_et_6[5] & ~l_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) | 
		   (l2_desr_exc_6 & ~l2_desr_et_6[1] &                 ~d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6) |
		   (l2_desr_exc_6 &  l2_desr_et_6[1] & ~s_desr_exc_6 & ~d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6) ;
assign take_l2_5 = (l2_desr_et_5[5] & ~l2_desr_et_5[1] &          							~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) | 
                   (l2_desr_et_5[5] &  l2_desr_et_5[1] & ~pipe_desr_et_5[5]  & ~m_desr_et_5[5] & ~l_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) | 
		   (l2_desr_exc_5 & ~l2_desr_et_5[1] &                 ~d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5) |
		   (l2_desr_exc_5 &  l2_desr_et_5[1] & ~s_desr_exc_5 & ~d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5) ;
assign take_l2_4 = (l2_desr_et_4[5] & ~l2_desr_et_4[1] &          							~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) | 
                   (l2_desr_et_4[5] &  l2_desr_et_4[1] & ~pipe_desr_et_4[5]  & ~m_desr_et_4[5] & ~l_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) | 
		   (l2_desr_exc_4 & ~l2_desr_et_4[1] &                 ~d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4) |
		   (l2_desr_exc_4 &  l2_desr_et_4[1] & ~s_desr_exc_4 & ~d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4) ;
assign take_l2_3 = (l2_desr_et_3[5] & ~l2_desr_et_3[1] &          							~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) | 
                   (l2_desr_et_3[5] &  l2_desr_et_3[1] & ~pipe_desr_et_3[5]  & ~m_desr_et_3[5] & ~l_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) | 
		   (l2_desr_exc_3 & ~l2_desr_et_3[1] &                 ~d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3) |
		   (l2_desr_exc_3 &  l2_desr_et_3[1] & ~s_desr_exc_3 & ~d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3) ;
assign take_l2_2 = (l2_desr_et_2[5] & ~l2_desr_et_2[1] &          							~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) | 
                   (l2_desr_et_2[5] &  l2_desr_et_2[1] & ~pipe_desr_et_2[5]  & ~m_desr_et_2[5] & ~l_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) | 
		   (l2_desr_exc_2 & ~l2_desr_et_2[1] &                 ~d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2) |
		   (l2_desr_exc_2 &  l2_desr_et_2[1] & ~s_desr_exc_2 & ~d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2) ;
assign take_l2_1 = (l2_desr_et_1[5] & ~l2_desr_et_1[1] &          							~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) | 
                   (l2_desr_et_1[5] &  l2_desr_et_1[1] & ~pipe_desr_et_1[5]  & ~m_desr_et_1[5] & ~l_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) | 
		   (l2_desr_exc_1 & ~l2_desr_et_1[1] &                 ~d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1) |
		   (l2_desr_exc_1 &  l2_desr_et_1[1] & ~s_desr_exc_1 & ~d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1) ;
assign take_l2_0 = (l2_desr_et_0[5] & ~l2_desr_et_0[1] &          							~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) | 
                   (l2_desr_et_0[5] &  l2_desr_et_0[1] & ~pipe_desr_et_0[5]  & ~m_desr_et_0[5] & ~l_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) | 
		   (l2_desr_exc_0 & ~l2_desr_et_0[1] &                 ~d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0) |
		   (l2_desr_exc_0 &  l2_desr_et_0[1] & ~s_desr_exc_0 & ~d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0) ;

assign take_pipe_7 = (pipe_desr_et_7[5] & ~l2_desr_et_7[5] & ~m_desr_et_7[5] & ~l_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) |
                     (pipe_desr_et_7[5] &  l2_desr_et_7[1] & ~m_desr_et_7[5] & ~l_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) |
                     (pipe_desr_exc_7 & no_desr_s_7);
assign take_pipe_6 = (pipe_desr_et_6[5] & ~l2_desr_et_6[5] & ~m_desr_et_6[5] & ~l_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) | 
                     (pipe_desr_et_6[5] &  l2_desr_et_6[1] & ~m_desr_et_6[5] & ~l_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) | 
                     (pipe_desr_exc_6 & no_desr_s_6);
assign take_pipe_5 = (pipe_desr_et_5[5] & ~l2_desr_et_5[5] & ~m_desr_et_5[5] & ~l_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) | 
                     (pipe_desr_et_5[5] &  l2_desr_et_5[1] & ~m_desr_et_5[5] & ~l_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) | 
                     (pipe_desr_exc_5 & no_desr_s_5);
assign take_pipe_4 = (pipe_desr_et_4[5] & ~l2_desr_et_4[5] & ~m_desr_et_4[5] & ~l_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) | 
                     (pipe_desr_et_4[5] &  l2_desr_et_4[1] & ~m_desr_et_4[5] & ~l_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) | 
                     (pipe_desr_exc_4 & no_desr_s_4);
assign take_pipe_3 = (pipe_desr_et_3[5] & ~l2_desr_et_3[5] & ~m_desr_et_3[5] & ~l_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) | 
                     (pipe_desr_et_3[5] &  l2_desr_et_3[1] & ~m_desr_et_3[5] & ~l_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) | 
                     (pipe_desr_exc_3 & no_desr_s_3);
assign take_pipe_2 = (pipe_desr_et_2[5] & ~l2_desr_et_2[5] & ~m_desr_et_2[5] & ~l_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) | 
                     (pipe_desr_et_2[5] &  l2_desr_et_2[1] & ~m_desr_et_2[5] & ~l_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) | 
                     (pipe_desr_exc_2 & no_desr_s_2);
assign take_pipe_1 = (pipe_desr_et_1[5] & ~l2_desr_et_1[5] & ~m_desr_et_1[5] & ~l_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) | 
                     (pipe_desr_et_1[5] &  l2_desr_et_1[1] & ~m_desr_et_1[5] & ~l_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) | 
                     (pipe_desr_exc_1 & no_desr_s_1);
assign take_pipe_0 = (pipe_desr_et_0[5] & ~l2_desr_et_0[5] & ~m_desr_et_0[5] & ~l_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) | 
                     (pipe_desr_et_0[5] &  l2_desr_et_0[1] & ~m_desr_et_0[5] & ~l_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) | 
                     (pipe_desr_exc_0 & no_desr_s_0);

assign take_m_7 = (m_desr_et_7[5] & ~l2_desr_et_7[5] & ~l_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) |
                  (m_desr_et_7[5] &  l2_desr_et_7[1] & ~l_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) ;
assign take_m_6 = (m_desr_et_6[5] & ~l2_desr_et_6[5] & ~l_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) |
		  (m_desr_et_6[5] &  l2_desr_et_6[1] & ~l_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) ;
assign take_m_5 = (m_desr_et_5[5] & ~l2_desr_et_5[5] & ~l_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) |
		  (m_desr_et_5[5] &  l2_desr_et_5[1] & ~l_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) ;
assign take_m_4 = (m_desr_et_4[5] & ~l2_desr_et_4[5] & ~l_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) |
		  (m_desr_et_4[5] &  l2_desr_et_4[1] & ~l_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) ;
assign take_m_3 = (m_desr_et_3[5] & ~l2_desr_et_3[5] & ~l_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) |
		  (m_desr_et_3[5] &  l2_desr_et_3[1] & ~l_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) ;
assign take_m_2 = (m_desr_et_2[5] & ~l2_desr_et_2[5] & ~l_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) |
		  (m_desr_et_2[5] &  l2_desr_et_2[1] & ~l_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) ;
assign take_m_1 = (m_desr_et_1[5] & ~l2_desr_et_1[5] & ~l_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) |
		  (m_desr_et_1[5] &  l2_desr_et_1[1] & ~l_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) ;
assign take_m_0 = (m_desr_et_0[5] & ~l2_desr_et_0[5] & ~l_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) |
		  (m_desr_et_0[5] &  l2_desr_et_0[1] & ~l_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) ;

assign take_l_7 = (l_desr_et_7[5] & ~l2_desr_et_7[5] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) |
		  (l_desr_et_7[5] &  l2_desr_et_7[1] & ~cwq_desr_et_7[5] & ~mamu_desr_et_7[5] & ~ma_desr_et_7[5] & ~t_desr_et_7[5] & ~s_desr_et_7[5]) |
                  (l_desr_exc_7    & ~l2_desr_exc_7 & ~s_desr_exc_7 & ~d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7);
assign take_l_6 = (l_desr_et_6[5] & ~l2_desr_et_6[5] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) |
		  (l_desr_et_6[5] &  l2_desr_et_6[1] & ~cwq_desr_et_6[5] & ~mamu_desr_et_6[5] & ~ma_desr_et_6[5] & ~t_desr_et_6[5] & ~s_desr_et_6[5]) |
                  (l_desr_exc_6    & ~l2_desr_exc_6 & ~s_desr_exc_6 & ~d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6);
assign take_l_5 = (l_desr_et_5[5] & ~l2_desr_et_5[5] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) |
		  (l_desr_et_5[5] &  l2_desr_et_5[1] & ~cwq_desr_et_5[5] & ~mamu_desr_et_5[5] & ~ma_desr_et_5[5] & ~t_desr_et_5[5] & ~s_desr_et_5[5]) |
                  (l_desr_exc_5    & ~l2_desr_exc_5 & ~s_desr_exc_5 & ~d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5);
assign take_l_4 = (l_desr_et_4[5] & ~l2_desr_et_4[5] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) |
		  (l_desr_et_4[5] &  l2_desr_et_4[1] & ~cwq_desr_et_4[5] & ~mamu_desr_et_4[5] & ~ma_desr_et_4[5] & ~t_desr_et_4[5] & ~s_desr_et_4[5]) |
                  (l_desr_exc_4    & ~l2_desr_exc_4 & ~s_desr_exc_4 & ~d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4);
assign take_l_3 = (l_desr_et_3[5] & ~l2_desr_et_3[5] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) |
		  (l_desr_et_3[5] &  l2_desr_et_3[1] & ~cwq_desr_et_3[5] & ~mamu_desr_et_3[5] & ~ma_desr_et_3[5] & ~t_desr_et_3[5] & ~s_desr_et_3[5]) |
                  (l_desr_exc_3    & ~l2_desr_exc_3 & ~s_desr_exc_3 & ~d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3);
assign take_l_2 = (l_desr_et_2[5] & ~l2_desr_et_2[5] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) |
		  (l_desr_et_2[5] &  l2_desr_et_2[1] & ~cwq_desr_et_2[5] & ~mamu_desr_et_2[5] & ~ma_desr_et_2[5] & ~t_desr_et_2[5] & ~s_desr_et_2[5]) |
                  (l_desr_exc_2    & ~l2_desr_exc_2 & ~s_desr_exc_2 & ~d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2);
assign take_l_1 = (l_desr_et_1[5] & ~l2_desr_et_1[5] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) |
		  (l_desr_et_1[5] &  l2_desr_et_1[1] & ~cwq_desr_et_1[5] & ~mamu_desr_et_1[5] & ~ma_desr_et_1[5] & ~t_desr_et_1[5] & ~s_desr_et_1[5]) |
                  (l_desr_exc_1    & ~l2_desr_exc_1 & ~s_desr_exc_1 & ~d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1);
assign take_l_0 = (l_desr_et_0[5] & ~l2_desr_et_0[5] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) |
		  (l_desr_et_0[5] &  l2_desr_et_0[1] & ~cwq_desr_et_0[5] & ~mamu_desr_et_0[5] & ~ma_desr_et_0[5] & ~t_desr_et_0[5] & ~s_desr_et_0[5]) |
                  (l_desr_exc_0    & ~l2_desr_exc_0 & ~s_desr_exc_0 & ~d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0);

assign take_d_7 = d_desr_exc_7 & ~pipe_desr_exc_7 & no_desr_s_7;
assign take_d_6 = d_desr_exc_6 & ~pipe_desr_exc_6 & no_desr_s_6;
assign take_d_5 = d_desr_exc_5 & ~pipe_desr_exc_5 & no_desr_s_5;
assign take_d_4 = d_desr_exc_4 & ~pipe_desr_exc_4 & no_desr_s_4;
assign take_d_3 = d_desr_exc_3 & ~pipe_desr_exc_3 & no_desr_s_3;
assign take_d_2 = d_desr_exc_2 & ~pipe_desr_exc_2 & no_desr_s_2;
assign take_d_1 = d_desr_exc_1 & ~pipe_desr_exc_1 & no_desr_s_1;
assign take_d_0 = d_desr_exc_0 & ~pipe_desr_exc_0 & no_desr_s_0;



assign no_desr_s_7 =
       ~(pipe_desr_et_7[5] | m_desr_et_7[5] | l_desr_et_7[5] |
	 l2_desr_et_7[5] | s_desr_et_7[5] | mamu_desr_et_7[5] |
	 ma_desr_et_7[5] | cwq_desr_et_7[5] | t_desr_et_7[5]);
assign no_desr_s_6 =
       ~(pipe_desr_et_6[5] | m_desr_et_6[5] | l_desr_et_6[5] |
	 l2_desr_et_6[5] | s_desr_et_6[5] | mamu_desr_et_6[5] |
	 ma_desr_et_6[5] | cwq_desr_et_6[5] | t_desr_et_6[5]);
assign no_desr_s_5 =
       ~(pipe_desr_et_5[5] | m_desr_et_5[5] | l_desr_et_5[5] |
	 l2_desr_et_5[5] | s_desr_et_5[5] | mamu_desr_et_5[5] |
	 ma_desr_et_5[5] | cwq_desr_et_5[5] | t_desr_et_5[5]);
assign no_desr_s_4 =
       ~(pipe_desr_et_4[5] | m_desr_et_4[5] | l_desr_et_4[5] |
	 l2_desr_et_4[5] | s_desr_et_4[5] | mamu_desr_et_4[5] |
	 ma_desr_et_4[5] | cwq_desr_et_4[5] | t_desr_et_4[5]);
assign no_desr_s_3 =
       ~(pipe_desr_et_3[5] | m_desr_et_3[5] | l_desr_et_3[5] |
	 l2_desr_et_3[5] | s_desr_et_3[5] | mamu_desr_et_3[5] |
	 ma_desr_et_3[5] | cwq_desr_et_3[5] | t_desr_et_3[5]);
assign no_desr_s_2 =
       ~(pipe_desr_et_2[5] | m_desr_et_2[5] | l_desr_et_2[5] |
	 l2_desr_et_2[5] | s_desr_et_2[5] | mamu_desr_et_2[5] |
	 ma_desr_et_2[5] | cwq_desr_et_2[5] | t_desr_et_2[5]);
assign no_desr_s_1 =
       ~(pipe_desr_et_1[5] | m_desr_et_1[5] | l_desr_et_1[5] |
	 l2_desr_et_1[5] | s_desr_et_1[5] | mamu_desr_et_1[5] |
	 ma_desr_et_1[5] | cwq_desr_et_1[5] | t_desr_et_1[5]);
assign no_desr_s_0 =
       ~(pipe_desr_et_0[5] | m_desr_et_0[5] | l_desr_et_0[5] |
	 l2_desr_et_0[5] | s_desr_et_0[5] | mamu_desr_et_0[5] |
	 ma_desr_et_0[5] | cwq_desr_et_0[5] | t_desr_et_0[5]);

assign ras_desr_et_7[61:56] =
       (                   pipe_desr_et_7[5:0]  & {6 {take_pipe_7}}) |
       (                      m_desr_et_7[5:0]  & {6 {   take_m_7}}) |
       (                      l_desr_et_7[5:0]  & {6 {   take_l_7}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_7[3:0]} & {6 {   take_d_7}}) |
       (                     l2_desr_et_7[5:0]  & {6 {  take_l2_7}}) |
       (                      s_desr_et_7[5:0]  & {6 {   take_s_7}}) |
       (                   mamu_desr_et_7[5:0]  & {6 {take_mamu_7}}) |
       (                     ma_desr_et_7[5:0]  & {6 {  take_ma_7}}) |
       (                    cwq_desr_et_7[5:0]  & {6 { take_cwq_7}}) |
       (                      t_desr_et_7[5:0]  & {6 {   take_t_7}}) ;

assign ras_desr_et_6[61:56] =
       (                   pipe_desr_et_6[5:0]  & {6 {take_pipe_6}}) |
       (                      m_desr_et_6[5:0]  & {6 {   take_m_6}}) |
       (                      l_desr_et_6[5:0]  & {6 {   take_l_6}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_6[3:0]} & {6 {   take_d_6}}) |
       (                     l2_desr_et_6[5:0]  & {6 {  take_l2_6}}) |
       (                      s_desr_et_6[5:0]  & {6 {   take_s_6}}) |
       (                   mamu_desr_et_6[5:0]  & {6 {take_mamu_6}}) |
       (                     ma_desr_et_6[5:0]  & {6 {  take_ma_6}}) |
       (                    cwq_desr_et_6[5:0]  & {6 { take_cwq_6}}) |
       (                      t_desr_et_6[5:0]  & {6 {   take_t_6}}) ;

assign ras_desr_et_5[61:56] =
       (                   pipe_desr_et_5[5:0]  & {6 {take_pipe_5}}) |
       (                      m_desr_et_5[5:0]  & {6 {   take_m_5}}) |
       (                      l_desr_et_5[5:0]  & {6 {   take_l_5}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_5[3:0]} & {6 {   take_d_5}}) |
       (                     l2_desr_et_5[5:0]  & {6 {  take_l2_5}}) |
       (                      s_desr_et_5[5:0]  & {6 {   take_s_5}}) |
       (                   mamu_desr_et_5[5:0]  & {6 {take_mamu_5}}) |
       (                     ma_desr_et_5[5:0]  & {6 {  take_ma_5}}) |
       (                    cwq_desr_et_5[5:0]  & {6 { take_cwq_5}}) |
       (                      t_desr_et_5[5:0]  & {6 {   take_t_5}}) ;

assign ras_desr_et_4[61:56] =
       (                   pipe_desr_et_4[5:0]  & {6 {take_pipe_4}}) |
       (                      m_desr_et_4[5:0]  & {6 {   take_m_4}}) |
       (                      l_desr_et_4[5:0]  & {6 {   take_l_4}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_4[3:0]} & {6 {   take_d_4}}) |
       (                     l2_desr_et_4[5:0]  & {6 {  take_l2_4}}) |
       (                      s_desr_et_4[5:0]  & {6 {   take_s_4}}) |
       (                   mamu_desr_et_4[5:0]  & {6 {take_mamu_4}}) |
       (                     ma_desr_et_4[5:0]  & {6 {  take_ma_4}}) |
       (                    cwq_desr_et_4[5:0]  & {6 { take_cwq_4}}) |
       (                      t_desr_et_4[5:0]  & {6 {   take_t_4}}) ;

assign ras_desr_et_3[61:56] =
       (                   pipe_desr_et_3[5:0]  & {6 {take_pipe_3}}) |
       (                      m_desr_et_3[5:0]  & {6 {   take_m_3}}) |
       (                      l_desr_et_3[5:0]  & {6 {   take_l_3}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_3[3:0]} & {6 {   take_d_3}}) |
       (                     l2_desr_et_3[5:0]  & {6 {  take_l2_3}}) |
       (                      s_desr_et_3[5:0]  & {6 {   take_s_3}}) |
       (                   mamu_desr_et_3[5:0]  & {6 {take_mamu_3}}) |
       (                     ma_desr_et_3[5:0]  & {6 {  take_ma_3}}) |
       (                    cwq_desr_et_3[5:0]  & {6 { take_cwq_3}}) |
       (                      t_desr_et_3[5:0]  & {6 {   take_t_3}}) ;

assign ras_desr_et_2[61:56] =
       (                   pipe_desr_et_2[5:0]  & {6 {take_pipe_2}}) |
       (                      m_desr_et_2[5:0]  & {6 {   take_m_2}}) |
       (                      l_desr_et_2[5:0]  & {6 {   take_l_2}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_2[3:0]} & {6 {   take_d_2}}) |
       (                     l2_desr_et_2[5:0]  & {6 {  take_l2_2}}) |
       (                      s_desr_et_2[5:0]  & {6 {   take_s_2}}) |
       (                   mamu_desr_et_2[5:0]  & {6 {take_mamu_2}}) |
       (                     ma_desr_et_2[5:0]  & {6 {  take_ma_2}}) |
       (                    cwq_desr_et_2[5:0]  & {6 { take_cwq_2}}) |
       (                      t_desr_et_2[5:0]  & {6 {   take_t_2}}) ;

assign ras_desr_et_1[61:56] =
       (                   pipe_desr_et_1[5:0]  & {6 {take_pipe_1}}) |
       (                      m_desr_et_1[5:0]  & {6 {   take_m_1}}) |
       (                      l_desr_et_1[5:0]  & {6 {   take_l_1}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_1[3:0]} & {6 {   take_d_1}}) |
       (                     l2_desr_et_1[5:0]  & {6 {  take_l2_1}}) |
       (                      s_desr_et_1[5:0]  & {6 {   take_s_1}}) |
       (                   mamu_desr_et_1[5:0]  & {6 {take_mamu_1}}) |
       (                     ma_desr_et_1[5:0]  & {6 {  take_ma_1}}) |
       (                    cwq_desr_et_1[5:0]  & {6 { take_cwq_1}}) |
       (                      t_desr_et_1[5:0]  & {6 {   take_t_1}}) ;

assign ras_desr_et_0[61:56] =
       (                   pipe_desr_et_0[5:0]  & {6 {take_pipe_0}}) |
       (                      m_desr_et_0[5:0]  & {6 {   take_m_0}}) |
       (                      l_desr_et_0[5:0]  & {6 {   take_l_0}}) |
       ({1'b0, {1 {1'b0}},    d_desr_et_0[3:0]} & {6 {   take_d_0}}) |
       (                     l2_desr_et_0[5:0]  & {6 {  take_l2_0}}) |
       (                      s_desr_et_0[5:0]  & {6 {   take_s_0}}) |
       (                   mamu_desr_et_0[5:0]  & {6 {take_mamu_0}}) |
       (                     ma_desr_et_0[5:0]  & {6 {  take_ma_0}}) |
       (                    cwq_desr_et_0[5:0]  & {6 { take_cwq_0}}) |
       (                      t_desr_et_0[5:0]  & {6 {   take_t_0}}) ;


assign write_desr[7:0] = 
       {| ras_desr_et_7[60:56],
	| ras_desr_et_6[60:56],
	| ras_desr_et_5[60:56],
	| ras_desr_et_4[60:56],
	| ras_desr_et_3[60:56],
	| ras_desr_et_2[60:56],
	| ras_desr_et_1[60:56],
	| ras_desr_et_0[60:56]};

assign write_desr_s[7:0] = 
       {ras_desr_et_7[61],
	ras_desr_et_6[61],
	ras_desr_et_5[61],
	ras_desr_et_4[61],
	ras_desr_et_3[61],
	ras_desr_et_2[61],
	ras_desr_et_1[61],
	ras_desr_et_0[61]};

assign ras_write_desr_1st[7:0] =
       (write_desr  [7:0] & ~dfd_desr_f[7:0]) | 
       (write_desr_s[7:0] & ~dfd_desr_s[7:0]) |
       (write_desr  [7:0] & rd_desr_dec[7:0]) ;

assign ras_write_desr_2nd[7:0] =
       (write_desr[7:0] & ~write_desr_s[7:0] & dfd_desr_f[7:0]) |
       (                     write_desr_s[7:0] & dfd_desr_s[7:0]) ;

assign ras_desr_me_7 =
       (({{3 {1'b0}}, pipe_desr_exc_7} +
      	 {{3 {1'b0}},    m_desr_exc_7} +
      	 {{3 {1'b0}},    l_desr_exc_7} +
      	 {{3 {1'b0}},    d_desr_exc_7} +
      	 {{3 {1'b0}},   l2_desr_exc_7} +
      	 {{3 {1'b0}},    s_desr_exc_7} +
      	 {{3 {1'b0}}, mamu_desr_exc_7} +
      	 {{3 {1'b0}},   ma_desr_exc_7} +
      	 {{3 {1'b0}},  cwq_desr_exc_7} +
      	 {{3 {1'b0}},    t_desr_exc_7}) > 4'b0001) | 
	(dfd_desr_f[7] & ~rd_desr_dec[7]);
assign ras_desr_me_6 =
       (({{3 {1'b0}}, pipe_desr_exc_6} +
      	 {{3 {1'b0}},    m_desr_exc_6} +
      	 {{3 {1'b0}},    l_desr_exc_6} +
      	 {{3 {1'b0}},    d_desr_exc_6} +
      	 {{3 {1'b0}},   l2_desr_exc_6} +
      	 {{3 {1'b0}},    s_desr_exc_6} +
      	 {{3 {1'b0}}, mamu_desr_exc_6} +
      	 {{3 {1'b0}},   ma_desr_exc_6} +
      	 {{3 {1'b0}},  cwq_desr_exc_6} +
      	 {{3 {1'b0}},    t_desr_exc_6}) > 4'b0001) | 
	(dfd_desr_f[6] & ~rd_desr_dec[6]);
assign ras_desr_me_5 =
       (({{3 {1'b0}}, pipe_desr_exc_5} +
      	 {{3 {1'b0}},    m_desr_exc_5} +
      	 {{3 {1'b0}},    l_desr_exc_5} +
      	 {{3 {1'b0}},    d_desr_exc_5} +
      	 {{3 {1'b0}},   l2_desr_exc_5} +
      	 {{3 {1'b0}},    s_desr_exc_5} +
      	 {{3 {1'b0}}, mamu_desr_exc_5} +
      	 {{3 {1'b0}},   ma_desr_exc_5} +
      	 {{3 {1'b0}},  cwq_desr_exc_5} +
      	 {{3 {1'b0}},    t_desr_exc_5}) > 4'b0001) | 
	(dfd_desr_f[5] & ~rd_desr_dec[5]);
assign ras_desr_me_4 =		    
       (({{3 {1'b0}}, pipe_desr_exc_4} +
      	 {{3 {1'b0}},    m_desr_exc_4} +
      	 {{3 {1'b0}},    l_desr_exc_4} +
      	 {{3 {1'b0}},    d_desr_exc_4} +
      	 {{3 {1'b0}},   l2_desr_exc_4} +
      	 {{3 {1'b0}},    s_desr_exc_4} +
      	 {{3 {1'b0}}, mamu_desr_exc_4} +
      	 {{3 {1'b0}},   ma_desr_exc_4} +
      	 {{3 {1'b0}},  cwq_desr_exc_4} +
      	 {{3 {1'b0}},    t_desr_exc_4}) > 4'b0001) | 
	(dfd_desr_f[4] & ~rd_desr_dec[4]);
assign ras_desr_me_3 =		    
       (({{3 {1'b0}}, pipe_desr_exc_3} +
      	 {{3 {1'b0}},    m_desr_exc_3} +
      	 {{3 {1'b0}},    l_desr_exc_3} +
      	 {{3 {1'b0}},    d_desr_exc_3} +
      	 {{3 {1'b0}},   l2_desr_exc_3} +
      	 {{3 {1'b0}},    s_desr_exc_3} +
      	 {{3 {1'b0}}, mamu_desr_exc_3} +
      	 {{3 {1'b0}},   ma_desr_exc_3} +
      	 {{3 {1'b0}},  cwq_desr_exc_3} +
      	 {{3 {1'b0}},    t_desr_exc_3}) > 4'b0001) | 
	(dfd_desr_f[3] & ~rd_desr_dec[3]);
assign ras_desr_me_2 =		    
       (({{3 {1'b0}}, pipe_desr_exc_2} +
      	 {{3 {1'b0}},    m_desr_exc_2} +
      	 {{3 {1'b0}},    l_desr_exc_2} +
      	 {{3 {1'b0}},    d_desr_exc_2} +
      	 {{3 {1'b0}},   l2_desr_exc_2} +
      	 {{3 {1'b0}},    s_desr_exc_2} +
      	 {{3 {1'b0}}, mamu_desr_exc_2} +
      	 {{3 {1'b0}},   ma_desr_exc_2} +
      	 {{3 {1'b0}},  cwq_desr_exc_2} +
      	 {{3 {1'b0}},    t_desr_exc_2}) > 4'b0001) | 
	(dfd_desr_f[2] & ~rd_desr_dec[2]);
assign ras_desr_me_1 =		    
       (({{3 {1'b0}}, pipe_desr_exc_1} +
      	 {{3 {1'b0}},    m_desr_exc_1} +
      	 {{3 {1'b0}},    l_desr_exc_1} +
      	 {{3 {1'b0}},    d_desr_exc_1} +
      	 {{3 {1'b0}},   l2_desr_exc_1} +
      	 {{3 {1'b0}},    s_desr_exc_1} +
      	 {{3 {1'b0}}, mamu_desr_exc_1} +
      	 {{3 {1'b0}},   ma_desr_exc_1} +
      	 {{3 {1'b0}},  cwq_desr_exc_1} +
      	 {{3 {1'b0}},    t_desr_exc_1}) > 4'b0001) | 
	(dfd_desr_f[1] & ~rd_desr_dec[1]);
assign ras_desr_me_0 =		    
       (({{3 {1'b0}}, pipe_desr_exc_0} +
      	 {{3 {1'b0}},    m_desr_exc_0} +
      	 {{3 {1'b0}},    l_desr_exc_0} +
      	 {{3 {1'b0}},    d_desr_exc_0} +
      	 {{3 {1'b0}},   l2_desr_exc_0} +
      	 {{3 {1'b0}},    s_desr_exc_0} +
      	 {{3 {1'b0}}, mamu_desr_exc_0} +
      	 {{3 {1'b0}},   ma_desr_exc_0} +
      	 {{3 {1'b0}},  cwq_desr_exc_0} +
      	 {{3 {1'b0}},    t_desr_exc_0}) > 4'b0001) | 
	(dfd_desr_f[0] & ~rd_desr_dec[0]);
			

assign ras_desr_ea_7[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_7[8:0]} & {11 {take_pipe_7}}) |
       ({{2 {1'b0}},    d_desr_ea_7[8:0]} & {11 {   take_d_7}}) |
       ({{8 {1'b0}},    s_desr_ea_7[2:0]} & {11 {   take_s_7}}) |
       (             mamu_desr_ea_7[10:0]  & {11 {take_mamu_7}}) |
       ({{1 {1'b0}},    t_desr_ea_7[9:0]} & {11 {   take_t_7}}) ;
assign ras_desr_ea_6[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_6[8:0]} & {11 {take_pipe_6}}) |
       ({{2 {1'b0}},    d_desr_ea_6[8:0]} & {11 {   take_d_6}}) |
       ({{8 {1'b0}},    s_desr_ea_6[2:0]} & {11 {   take_s_6}}) |
       (             mamu_desr_ea_6[10:0]  & {11 {take_mamu_6}}) |
       ({{1 {1'b0}},    t_desr_ea_6[9:0]} & {11 {   take_t_6}}) ;
assign ras_desr_ea_5[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_5[8:0]} & {11 {take_pipe_5}}) |
       ({{2 {1'b0}},    d_desr_ea_5[8:0]} & {11 {   take_d_5}}) |
       ({{8 {1'b0}},    s_desr_ea_5[2:0]} & {11 {   take_s_5}}) |
       (             mamu_desr_ea_5[10:0]  & {11 {take_mamu_5}}) |
       ({{1 {1'b0}},    t_desr_ea_5[9:0]} & {11 {   take_t_5}}) ;
assign ras_desr_ea_4[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_4[8:0]} & {11 {take_pipe_4}}) |
       ({{2 {1'b0}},    d_desr_ea_4[8:0]} & {11 {   take_d_4}}) |
       ({{8 {1'b0}},    s_desr_ea_4[2:0]} & {11 {   take_s_4}}) |
       (             mamu_desr_ea_4[10:0]  & {11 {take_mamu_4}}) |
       ({{1 {1'b0}},    t_desr_ea_4[9:0]} & {11 {   take_t_4}}) ;
assign ras_desr_ea_3[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_3[8:0]} & {11 {take_pipe_3}}) |
       ({{2 {1'b0}},    d_desr_ea_3[8:0]} & {11 {   take_d_3}}) |
       ({{8 {1'b0}},    s_desr_ea_3[2:0]} & {11 {   take_s_3}}) |
       (             mamu_desr_ea_3[10:0]  & {11 {take_mamu_3}}) |
       ({{1 {1'b0}},    t_desr_ea_3[9:0]} & {11 {   take_t_3}}) ;
assign ras_desr_ea_2[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_2[8:0]} & {11 {take_pipe_2}}) |
       ({{2 {1'b0}},    d_desr_ea_2[8:0]} & {11 {   take_d_2}}) |
       ({{8 {1'b0}},    s_desr_ea_2[2:0]} & {11 {   take_s_2}}) |
       (             mamu_desr_ea_2[10:0]  & {11 {take_mamu_2}}) |
       ({{1 {1'b0}},    t_desr_ea_2[9:0]} & {11 {   take_t_2}}) ;
assign ras_desr_ea_1[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_1[8:0]} & {11 {take_pipe_1}}) |
       ({{2 {1'b0}},    d_desr_ea_1[8:0]} & {11 {   take_d_1}}) |
       ({{8 {1'b0}},    s_desr_ea_1[2:0]} & {11 {   take_s_1}}) |
       (             mamu_desr_ea_1[10:0]  & {11 {take_mamu_1}}) |
       ({{1 {1'b0}},    t_desr_ea_1[9:0]} & {11 {   take_t_1}}) ;
assign ras_desr_ea_0[10:0] =
       ({{2 {1'b0}}, pipe_desr_ea_0[8:0]} & {11 {take_pipe_0}}) |
       ({{2 {1'b0}},    d_desr_ea_0[8:0]} & {11 {   take_d_0}}) |
       ({{8 {1'b0}},    s_desr_ea_0[2:0]} & {11 {   take_s_0}}) |
       (             mamu_desr_ea_0[10:0]  & {11 {take_mamu_0}}) |
       ({{1 {1'b0}},    t_desr_ea_0[9:0]} & {11 {   take_t_0}}) ;



//////////////////////////////////////////////////////////////////////////////
//
//  Handle fatal errors
//
// FESR
// sbdiou 01
// sbapp  10

tlu_ras_ctl_msff_ctl_macro__width_1 sbdiou_lat  (
	.scan_in(sbdiou_lat_scanin),
	.scan_out(sbdiou_lat_scanout),
	.din	(lsu_sbdiou_err_g		),
	.dout	(sbdiou				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 sbapp_lat  (
	.scan_in(sbapp_lat_scanin),
	.scan_out(sbapp_lat_scanout),
	.din	(lsu_sbapp_err_g		),
	.dout	(sbapp				),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign f_dec_tid[7:0] = 
       { s_tid[2] &  s_tid[1] &  s_tid[0],
         s_tid[2] &  s_tid[1] & ~s_tid[0],
         s_tid[2] & ~s_tid[1] &  s_tid[0],
         s_tid[2] & ~s_tid[1] & ~s_tid[0],
        ~s_tid[2] &  s_tid[1] &  s_tid[0],
        ~s_tid[2] &  s_tid[1] & ~s_tid[0],
        ~s_tid[2] & ~s_tid[1] &  s_tid[0],
        ~s_tid[2] & ~s_tid[1] & ~s_tid[0]} & 
       {8 {sbdiou | sbapp}};

assign ras_fesr_et_7[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[7]}};
assign ras_fesr_et_6[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[6]}};
assign ras_fesr_et_5[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[5]}};
assign ras_fesr_et_4[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[4]}};
assign ras_fesr_et_3[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[3]}};
assign ras_fesr_et_2[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[2]}};
assign ras_fesr_et_1[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[1]}};
assign ras_fesr_et_0[61:60] =
       {sbapp, sbdiou} & {2 {f_dec_tid[0]}};

assign write_fesr[7:0] =
       f_dec_tid[7:0];

assign ras_fesr_en[7:0] =
       write_fesr[7:0] | ras_rd_fesr[7:0] | update_priv[7:0];

assign ras_write_fesr[7:0] =
       write_fesr[7:0] & (~dfd_fesr_f[7:0] | ras_rd_fesr[7:0]);

assign ras_fesr_ea_7[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[7]}};
assign ras_fesr_ea_6[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[6]}};
assign ras_fesr_ea_5[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[5]}};
assign ras_fesr_ea_4[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[4]}};
assign ras_fesr_ea_3[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[3]}};
assign ras_fesr_ea_2[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[2]}};
assign ras_fesr_ea_1[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[1]}};
assign ras_fesr_ea_0[59:55] =
       {fesr_priv[1:0], s_dsfar[2:0]} & {5 {f_dec_tid[0]}};



//////////////////////////////////////////////////////////////////////////////
//
//  Support debug event control register function
//
// error_event_1 error_event_0	meaning
//	0		0	no event
//	0		1	precise error
//	1		0	disrupting error
//	1		1	deferred error

assign error_event_1_in[7:0] =
	write_desr[7:0] |
	write_fesr[7:0];

assign error_event_0_in[7:0] =
	precise_i_error[7:0] | precise_d_error[7:0] |
	write_fesr[7:0];

tlu_ras_ctl_msff_ctl_macro__width_8 event_1_lat  (
	.scan_in(event_1_lat_scanin),
	.scan_out(event_1_lat_scanout),
	.din	(error_event_1_in	[7:0]	),
	.dout	(error_event_1		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_8 event_0_lat  (
	.scan_in(event_0_lat_scanin),
	.scan_out(event_0_lat_scanout),
	.din	(error_event_0_in	[7:0]	),
	.dout	(error_event_0		[7:0]	),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign ras_precise_error[7:0] =
	~error_event_1[7:0] &  error_event_0[7:0];

assign ras_disrupting_error[7:0] =
	 error_event_1[7:0] & ~error_event_0[7:0];

assign ras_deferred_error[7:0] =
	 error_event_1[7:0] &  error_event_0[7:0];



//////////////////////////////////////////////////////////////////////////////
//
// Spares
//

// Each pack has one flop
tlu_ras_ctl_spare_ctl_macro__num_16 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk				),
  .siclk(siclk),
  .soclk(soclk)
);


// Add some more flops
// sparex_lat gets placed with spare pack x
tlu_ras_ctl_msff_ctl_macro__width_1 spare0_lat  (
	.scan_in(spare0_lat_scanin),
	.scan_out(spare0_lat_scanout),
	.din	(1'b0				),
	.dout	(spare0_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare1_lat  (
	.scan_in(spare1_lat_scanin),
	.scan_out(spare1_lat_scanout),
	.din	(1'b0				),
	.dout	(spare1_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare2_lat  (
	.scan_in(spare2_lat_scanin),
	.scan_out(spare2_lat_scanout),
	.din	(1'b0				),
	.dout	(spare2_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare3_lat  (
	.scan_in(spare3_lat_scanin),
	.scan_out(spare3_lat_scanout),
	.din	(1'b0				),
	.dout	(spare3_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare4_lat  (
	.scan_in(spare4_lat_scanin),
	.scan_out(spare4_lat_scanout),
	.din	(1'b0				),
	.dout	(spare4_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare5_lat  (
	.scan_in(spare5_lat_scanin),
	.scan_out(spare5_lat_scanout),
	.din	(1'b0				),
	.dout	(spare5_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare6_lat  (
	.scan_in(spare6_lat_scanin),
	.scan_out(spare6_lat_scanout),
	.din	(1'b0				),
	.dout	(spare6_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare7_lat  (
	.scan_in(spare7_lat_scanin),
	.scan_out(spare7_lat_scanout),
	.din	(1'b0				),
	.dout	(spare7_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare8_lat  (
	.scan_in(spare8_lat_scanin),
	.scan_out(spare8_lat_scanout),
	.din	(1'b0				),
	.dout	(spare8_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare9_lat  (
	.scan_in(spare9_lat_scanin),
	.scan_out(spare9_lat_scanout),
	.din	(1'b0				),
	.dout	(spare9_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare10_lat  (
	.scan_in(spare10_lat_scanin),
	.scan_out(spare10_lat_scanout),
	.din	(1'b0				),
	.dout	(spare10_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare11_lat  (
	.scan_in(spare11_lat_scanin),
	.scan_out(spare11_lat_scanout),
	.din	(1'b0				),
	.dout	(spare11_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare12_lat  (
	.scan_in(spare12_lat_scanin),
	.scan_out(spare12_lat_scanout),
	.din	(1'b0				),
	.dout	(spare12_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare13_lat  (
	.scan_in(spare13_lat_scanin),
	.scan_out(spare13_lat_scanout),
	.din	(1'b0				),
	.dout	(spare13_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare14_lat  (
	.scan_in(spare14_lat_scanin),
	.scan_out(spare14_lat_scanout),
	.din	(1'b0				),
	.dout	(spare14_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

tlu_ras_ctl_msff_ctl_macro__width_1 spare15_lat  (
	.scan_in(spare15_lat_scanin),
	.scan_out(spare15_lat_scanout),
	.din	(1'b0				),
	.dout	(spare15_unused			),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);



supply0 vss; // <- port for ground
supply1 vdd; // <- port for power

// fixscan start:
assign twocycle_inst_b_lat_scanin = scan_in                  ;
assign inst_valid_b_lat_scanin   = twocycle_inst_b_lat_scanout;
assign w_en_lat_scanin           = inst_valid_b_lat_scanout ;
assign w1_en_lat_scanin          = w_en_lat_scanout         ;
assign inst_valid_w_lat_scanin   = w1_en_lat_scanout        ;
assign block_store_w_lat_scanin  = inst_valid_w_lat_scanout ;
assign tid1_b_lat_scanin         = block_store_w_lat_scanout;
assign tid0_b_lat_scanin         = tid1_b_lat_scanout       ;
assign tid1_w_lat_scanin         = tid0_b_lat_scanout       ;
assign tid0_w_lat_scanin         = tid1_w_lat_scanout       ;
assign fgu_inst_b_lat_scanin     = tid0_w_lat_scanout       ;
assign fgu_inst_w_lat_scanin     = fgu_inst_b_lat_scanout   ;
assign lsu_inst_b_lat_scanin     = fgu_inst_w_lat_scanout   ;
assign i_isfsr1_b_lat_scanin     = lsu_inst_b_lat_scanout   ;
assign i_isfsr0_b_lat_scanin     = i_isfsr1_b_lat_scanout   ;
assign i_desr1_b_lat_scanin      = i_isfsr0_b_lat_scanout   ;
assign i_desr0_b_lat_scanin      = i_desr1_b_lat_scanout    ;
assign irf0_ecc_addr_b_lat_scanin = i_desr0_b_lat_scanout    ;
assign irf1_ecc_addr_b_lat_scanin = irf0_ecc_addr_b_lat_scanout;
assign irf0_ecc_check_b_lat_scanin = irf1_ecc_addr_b_lat_scanout;
assign irf1_ecc_check_b_lat_scanin = irf0_ecc_check_b_lat_scanout;
assign i_isfsr1_w_lat_scanin     = irf1_ecc_check_b_lat_scanout;
assign i_isfsr0_w_lat_scanin     = i_isfsr1_w_lat_scanout   ;
assign i_desr1_w_lat_scanin      = i_isfsr0_w_lat_scanout   ;
assign i_desr0_w_lat_scanin      = i_desr1_w_lat_scanout    ;
assign irfu_w_lat_scanin         = i_desr0_w_lat_scanout    ;
assign irfc_w_lat_scanin         = irfu_w_lat_scanout       ;
assign seen_bsee_lat_scanin      = irfc_w_lat_scanout       ;
assign dttp_w_lat_scanin         = seen_bsee_lat_scanout    ;
assign dtmh_w_lat_scanin         = dttp_w_lat_scanout       ;
assign dtdp_w_lat_scanin         = dtmh_w_lat_scanout       ;
assign irf0_ecc_addr_w_lat_scanin = dtdp_w_lat_scanout       ;
assign irf1_ecc_addr_w_lat_scanin = irf0_ecc_addr_w_lat_scanout;
assign irf0_ecc_check_w_lat_scanin = irf1_ecc_addr_w_lat_scanout;
assign irf1_ecc_check_w_lat_scanin = irf0_ecc_check_w_lat_scanout;
assign frf_ecc_addr_w_lat_scanin = irf1_ecc_check_w_lat_scanout;
assign frf_ecc_check_w_lat_scanin = frf_ecc_addr_w_lat_scanout;
assign ecc_w1_lat_scanin         = frf_ecc_check_w_lat_scanout;
assign tid1_w1_lat_scanin        = ecc_w1_lat_scanout       ;
assign tid0_w1_lat_scanin        = tid1_w1_lat_scanout      ;
assign pipe_dsfsr1_lat_scanin    = tid0_w1_lat_scanout      ;
assign pipe_dsfsr0_lat_scanin    = pipe_dsfsr1_lat_scanout  ;
assign pipe_dsfar1_lat_scanin    = pipe_dsfsr0_lat_scanout  ;
assign pipe_dsfar0_lat_scanin    = pipe_dsfar1_lat_scanout  ;
assign load_dsfar_lat_scanin     = pipe_dsfar0_lat_scanout  ;
assign i_desr1_w1_lat_scanin     = load_dsfar_lat_scanout   ;
assign i_desr0_w1_lat_scanin     = i_desr1_w1_lat_scanout   ;
assign excp_way_lat_scanin       = i_desr0_w1_lat_scanout   ;
assign ic_way7_lat_scanin        = excp_way_lat_scanout     ;
assign ic_way6_lat_scanin        = ic_way7_lat_scanout      ;
assign ic_way5_lat_scanin        = ic_way6_lat_scanout      ;
assign ic_way4_lat_scanin        = ic_way5_lat_scanout      ;
assign ic_way3_lat_scanin        = ic_way4_lat_scanout      ;
assign ic_way2_lat_scanin        = ic_way3_lat_scanout      ;
assign ic_way1_lat_scanin        = ic_way2_lat_scanout      ;
assign ic_way0_lat_scanin        = ic_way1_lat_scanout      ;
assign pc_1_w1_lat_scanin        = ic_way0_lat_scanout      ;
assign pc_0_w1_lat_scanin        = pc_1_w1_lat_scanout      ;
assign it2lc_lat_scanin          = pc_0_w1_lat_scanout      ;
assign dt2lc_lat_scanin          = it2lc_lat_scanout        ;
assign tca_error_lat_scanin      = dt2lc_lat_scanout        ;
assign l_dsfar_lat_scanin        = tca_error_lat_scanout    ;
assign l_tid_lat_scanin          = l_dsfar_lat_scanout      ;
assign dcl2c_lat_scanin          = l_tid_lat_scanout        ;
assign dcl2u_lat_scanin          = dcl2c_lat_scanout        ;
assign dcl2nd_lat_scanin         = dcl2u_lat_scanout        ;
assign dcsoc_lat_scanin          = dcl2nd_lat_scanout       ;
assign s_dsfar_lat_scanin        = dcsoc_lat_scanout        ;
assign s_tid_lat_scanin          = s_dsfar_lat_scanout      ;
assign stb_flush_lat_scanin      = s_tid_lat_scanout        ;
assign sbdlc_lat_scanin          = stb_flush_lat_scanout    ;
assign sbdlu_lat_scanin          = sbdlc_lat_scanout        ;
assign asi_rd_ctl_lat_scanin     = sbdlu_lat_scanout        ;
assign dcvp_lat_scanin           = asi_rd_ctl_lat_scanout   ;
assign dctp_lat_scanin           = dcvp_lat_scanout         ;
assign dctm_lat_scanin           = dctp_lat_scanout         ;
assign dcdp_lat_scanin           = dctm_lat_scanout         ;
assign cxi_lat_scanin            = dcdp_lat_scanout         ;
assign sbdpc_lat_scanin          = cxi_lat_scanout          ;
assign sbdpu_lat_scanin          = sbdpc_lat_scanout        ;
assign mamu_err_lat_scanin       = sbdpu_lat_scanout        ;
assign ma_tid_lat_scanin         = mamu_err_lat_scanout     ;
assign cwq_tid_lat_scanin        = ma_tid_lat_scanout       ;
assign spu_error_lat_scanin      = cwq_tid_lat_scanout      ;
assign sbdiou_lat_scanin         = spu_error_lat_scanout    ;
assign sbapp_lat_scanin          = sbdiou_lat_scanout       ;
assign event_1_lat_scanin        = sbapp_lat_scanout        ;
assign event_0_lat_scanin        = event_1_lat_scanout      ;
assign spares_scanin             = event_0_lat_scanout      ;
assign spare0_lat_scanin         = spares_scanout           ;
assign spare1_lat_scanin         = spare0_lat_scanout       ;
assign spare2_lat_scanin         = spare1_lat_scanout       ;
assign spare3_lat_scanin         = spare2_lat_scanout       ;
assign spare4_lat_scanin         = spare3_lat_scanout       ;
assign spare5_lat_scanin         = spare4_lat_scanout       ;
assign spare6_lat_scanin         = spare5_lat_scanout       ;
assign spare7_lat_scanin         = spare6_lat_scanout       ;
assign spare8_lat_scanin         = spare7_lat_scanout       ;
assign spare9_lat_scanin         = spare8_lat_scanout       ;
assign spare10_lat_scanin        = spare9_lat_scanout       ;
assign spare11_lat_scanin        = spare10_lat_scanout      ;
assign spare12_lat_scanin        = spare11_lat_scanout      ;
assign spare13_lat_scanin        = spare12_lat_scanout      ;
assign spare14_lat_scanin        = spare13_lat_scanout      ;
assign spare15_lat_scanin        = spare14_lat_scanout      ;
assign scan_out                  = spare15_lat_scanout      ;

assign isfsr_7_lat_wmr_scanin    = wmr_scan_in              ;
assign isfsr_6_lat_wmr_scanin    = isfsr_7_lat_wmr_scanout  ;
assign isfsr_5_lat_wmr_scanin    = isfsr_6_lat_wmr_scanout  ;
assign isfsr_4_lat_wmr_scanin    = isfsr_5_lat_wmr_scanout  ;
assign isfsr_3_lat_wmr_scanin    = isfsr_4_lat_wmr_scanout  ;
assign isfsr_2_lat_wmr_scanin    = isfsr_3_lat_wmr_scanout  ;
assign isfsr_1_lat_wmr_scanin    = isfsr_2_lat_wmr_scanout  ;
assign isfsr_0_lat_wmr_scanin    = isfsr_1_lat_wmr_scanout  ;
assign dsfsr_7_lat_wmr_scanin    = isfsr_0_lat_wmr_scanout  ;
assign dsfsr_6_lat_wmr_scanin    = dsfsr_7_lat_wmr_scanout  ;
assign dsfsr_5_lat_wmr_scanin    = dsfsr_6_lat_wmr_scanout  ;
assign dsfsr_4_lat_wmr_scanin    = dsfsr_5_lat_wmr_scanout  ;
assign dsfsr_3_lat_wmr_scanin    = dsfsr_4_lat_wmr_scanout  ;
assign dsfsr_2_lat_wmr_scanin    = dsfsr_3_lat_wmr_scanout  ;
assign dsfsr_1_lat_wmr_scanin    = dsfsr_2_lat_wmr_scanout  ;
assign dsfsr_0_lat_wmr_scanin    = dsfsr_1_lat_wmr_scanout  ;
assign wmr_scan_out              = dsfsr_0_lat_wmr_scanout  ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module tlu_ras_ctl_l1clkhdr_ctl_macro (
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

module tlu_ras_ctl_msff_ctl_macro__width_2 (
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

module tlu_ras_ctl_msff_ctl_macro__width_1 (
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

module tlu_ras_ctl_msff_ctl_macro__width_8 (
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

module tlu_ras_ctl_msff_ctl_macro__width_3 (
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

module tlu_ras_ctl_msff_ctl_macro__width_4 (
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

module tlu_ras_ctl_msff_ctl_macro__width_5 (
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

module tlu_ras_ctl_msff_ctl_macro__width_6 (
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

module tlu_ras_ctl_msff_ctl_macro__width_14 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = din[13:0];






dff #(14)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[13:0]),
.si({scan_in,so[12:0]}),
.so({so[12:0],scan_out}),
.q(dout[13:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_ras_ctl_msff_ctl_macro__width_20 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = din[19:0];






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tlu_ras_ctl_msff_ctl_macro__width_7 (
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

module tlu_ras_ctl_msff_ctl_macro__width_9 (
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

module tlu_ras_ctl_msff_ctl_macro__width_12 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tlu_ras_ctl_spare_ctl_macro__num_16 (
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
wire si_12;
wire so_12;
wire spare12_flop_unused;
wire spare12_buf_32x_unused;
wire spare12_nand3_8x_unused;
wire spare12_inv_8x_unused;
wire spare12_aoi22_4x_unused;
wire spare12_buf_8x_unused;
wire spare12_oai22_4x_unused;
wire spare12_inv_16x_unused;
wire spare12_nand2_16x_unused;
wire spare12_nor3_4x_unused;
wire spare12_nand2_8x_unused;
wire spare12_buf_16x_unused;
wire spare12_nor2_16x_unused;
wire spare12_inv_32x_unused;
wire si_13;
wire so_13;
wire spare13_flop_unused;
wire spare13_buf_32x_unused;
wire spare13_nand3_8x_unused;
wire spare13_inv_8x_unused;
wire spare13_aoi22_4x_unused;
wire spare13_buf_8x_unused;
wire spare13_oai22_4x_unused;
wire spare13_inv_16x_unused;
wire spare13_nand2_16x_unused;
wire spare13_nor3_4x_unused;
wire spare13_nand2_8x_unused;
wire spare13_buf_16x_unused;
wire spare13_nor2_16x_unused;
wire spare13_inv_32x_unused;
wire si_14;
wire so_14;
wire spare14_flop_unused;
wire spare14_buf_32x_unused;
wire spare14_nand3_8x_unused;
wire spare14_inv_8x_unused;
wire spare14_aoi22_4x_unused;
wire spare14_buf_8x_unused;
wire spare14_oai22_4x_unused;
wire spare14_inv_16x_unused;
wire spare14_nand2_16x_unused;
wire spare14_nor3_4x_unused;
wire spare14_nand2_8x_unused;
wire spare14_buf_16x_unused;
wire spare14_nor2_16x_unused;
wire spare14_inv_32x_unused;
wire si_15;
wire so_15;
wire spare15_flop_unused;
wire spare15_buf_32x_unused;
wire spare15_nand3_8x_unused;
wire spare15_inv_8x_unused;
wire spare15_aoi22_4x_unused;
wire spare15_buf_8x_unused;
wire spare15_oai22_4x_unused;
wire spare15_inv_16x_unused;
wire spare15_nand2_16x_unused;
wire spare15_nor3_4x_unused;
wire spare15_nand2_8x_unused;
wire spare15_buf_16x_unused;
wire spare15_nor2_16x_unused;
wire spare15_inv_32x_unused;


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

cl_sc1_msff_8x spare12_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_12),
                               .so(so_12),
                               .d(1'b0),
                               .q(spare12_flop_unused));
assign si_12 = so_11;

cl_u1_buf_32x   spare12_buf_32x (.in(1'b1),
                                   .out(spare12_buf_32x_unused));
cl_u1_nand3_8x spare12_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare12_nand3_8x_unused));
cl_u1_inv_8x    spare12_inv_8x (.in(1'b1),
                                  .out(spare12_inv_8x_unused));
cl_u1_aoi22_4x spare12_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_aoi22_4x_unused));
cl_u1_buf_8x    spare12_buf_8x (.in(1'b1),
                                  .out(spare12_buf_8x_unused));
cl_u1_oai22_4x spare12_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare12_oai22_4x_unused));
cl_u1_inv_16x   spare12_inv_16x (.in(1'b1),
                                   .out(spare12_inv_16x_unused));
cl_u1_nand2_16x spare12_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare12_nand2_16x_unused));
cl_u1_nor3_4x spare12_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare12_nor3_4x_unused));
cl_u1_nand2_8x spare12_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare12_nand2_8x_unused));
cl_u1_buf_16x   spare12_buf_16x (.in(1'b1),
                                   .out(spare12_buf_16x_unused));
cl_u1_nor2_16x spare12_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare12_nor2_16x_unused));
cl_u1_inv_32x   spare12_inv_32x (.in(1'b1),
                                   .out(spare12_inv_32x_unused));

cl_sc1_msff_8x spare13_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_13),
                               .so(so_13),
                               .d(1'b0),
                               .q(spare13_flop_unused));
assign si_13 = so_12;

cl_u1_buf_32x   spare13_buf_32x (.in(1'b1),
                                   .out(spare13_buf_32x_unused));
cl_u1_nand3_8x spare13_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare13_nand3_8x_unused));
cl_u1_inv_8x    spare13_inv_8x (.in(1'b1),
                                  .out(spare13_inv_8x_unused));
cl_u1_aoi22_4x spare13_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_aoi22_4x_unused));
cl_u1_buf_8x    spare13_buf_8x (.in(1'b1),
                                  .out(spare13_buf_8x_unused));
cl_u1_oai22_4x spare13_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare13_oai22_4x_unused));
cl_u1_inv_16x   spare13_inv_16x (.in(1'b1),
                                   .out(spare13_inv_16x_unused));
cl_u1_nand2_16x spare13_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare13_nand2_16x_unused));
cl_u1_nor3_4x spare13_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare13_nor3_4x_unused));
cl_u1_nand2_8x spare13_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare13_nand2_8x_unused));
cl_u1_buf_16x   spare13_buf_16x (.in(1'b1),
                                   .out(spare13_buf_16x_unused));
cl_u1_nor2_16x spare13_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare13_nor2_16x_unused));
cl_u1_inv_32x   spare13_inv_32x (.in(1'b1),
                                   .out(spare13_inv_32x_unused));

cl_sc1_msff_8x spare14_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_14),
                               .so(so_14),
                               .d(1'b0),
                               .q(spare14_flop_unused));
assign si_14 = so_13;

cl_u1_buf_32x   spare14_buf_32x (.in(1'b1),
                                   .out(spare14_buf_32x_unused));
cl_u1_nand3_8x spare14_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare14_nand3_8x_unused));
cl_u1_inv_8x    spare14_inv_8x (.in(1'b1),
                                  .out(spare14_inv_8x_unused));
cl_u1_aoi22_4x spare14_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_aoi22_4x_unused));
cl_u1_buf_8x    spare14_buf_8x (.in(1'b1),
                                  .out(spare14_buf_8x_unused));
cl_u1_oai22_4x spare14_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare14_oai22_4x_unused));
cl_u1_inv_16x   spare14_inv_16x (.in(1'b1),
                                   .out(spare14_inv_16x_unused));
cl_u1_nand2_16x spare14_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare14_nand2_16x_unused));
cl_u1_nor3_4x spare14_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare14_nor3_4x_unused));
cl_u1_nand2_8x spare14_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare14_nand2_8x_unused));
cl_u1_buf_16x   spare14_buf_16x (.in(1'b1),
                                   .out(spare14_buf_16x_unused));
cl_u1_nor2_16x spare14_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare14_nor2_16x_unused));
cl_u1_inv_32x   spare14_inv_32x (.in(1'b1),
                                   .out(spare14_inv_32x_unused));

cl_sc1_msff_8x spare15_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_15),
                               .so(so_15),
                               .d(1'b0),
                               .q(spare15_flop_unused));
assign si_15 = so_14;

cl_u1_buf_32x   spare15_buf_32x (.in(1'b1),
                                   .out(spare15_buf_32x_unused));
cl_u1_nand3_8x spare15_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare15_nand3_8x_unused));
cl_u1_inv_8x    spare15_inv_8x (.in(1'b1),
                                  .out(spare15_inv_8x_unused));
cl_u1_aoi22_4x spare15_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_aoi22_4x_unused));
cl_u1_buf_8x    spare15_buf_8x (.in(1'b1),
                                  .out(spare15_buf_8x_unused));
cl_u1_oai22_4x spare15_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare15_oai22_4x_unused));
cl_u1_inv_16x   spare15_inv_16x (.in(1'b1),
                                   .out(spare15_inv_16x_unused));
cl_u1_nand2_16x spare15_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare15_nand2_16x_unused));
cl_u1_nor3_4x spare15_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare15_nor3_4x_unused));
cl_u1_nand2_8x spare15_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare15_nand2_8x_unused));
cl_u1_buf_16x   spare15_buf_16x (.in(1'b1),
                                   .out(spare15_buf_16x_unused));
cl_u1_nor2_16x spare15_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare15_nor2_16x_unused));
cl_u1_inv_32x   spare15_inv_32x (.in(1'b1),
                                   .out(spare15_inv_32x_unused));
assign scan_out = so_15;



endmodule

