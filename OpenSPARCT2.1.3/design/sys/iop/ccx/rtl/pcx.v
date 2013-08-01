// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcx.v
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
`ifndef FPGA
module pcx (
  pcx_fpio_data_px2, 
  pcx_fpio_data_rdy_px1, 
  pcx_sctag0_atm_px1, 
  pcx_sctag0_data_px2, 
  pcx_sctag0_data_rdy_px1, 
  pcx_sctag1_atm_px1, 
  pcx_sctag1_data_px2, 
  pcx_sctag1_data_rdy_px1, 
  pcx_sctag2_atm_px1, 
  pcx_sctag2_data_px2, 
  pcx_sctag2_data_rdy_px1, 
  pcx_sctag3_atm_px1, 
  pcx_sctag3_data_px2, 
  pcx_sctag3_data_rdy_px1, 
  pcx_sctag4_atm_px1, 
  pcx_sctag4_data_px2, 
  pcx_sctag4_data_rdy_px1, 
  pcx_sctag5_atm_px1, 
  pcx_sctag5_data_px2, 
  pcx_sctag5_data_rdy_px1, 
  pcx_sctag6_atm_px1, 
  pcx_sctag6_data_px2, 
  pcx_sctag6_data_rdy_px1, 
  pcx_sctag7_atm_px1, 
  pcx_sctag7_data_px2, 
  pcx_sctag7_data_rdy_px1, 
  pcx_spc0_grant_px, 
  pcx_spc1_grant_px, 
  pcx_spc2_grant_px, 
  pcx_spc3_grant_px, 
  pcx_spc4_grant_px, 
  pcx_spc5_grant_px, 
  pcx_spc6_grant_px, 
  pcx_spc7_grant_px, 
  io_pcx_stall_pq, 
  sctag0_pcx_stall_pq, 
  sctag1_pcx_stall_pq, 
  sctag2_pcx_stall_pq, 
  sctag3_pcx_stall_pq, 
  sctag4_pcx_stall_pq, 
  sctag5_pcx_stall_pq, 
  sctag6_pcx_stall_pq, 
  sctag7_pcx_stall_pq, 
  spc0_pcx_data_pa, 
  spc0_pcx_req_pq, 
  spc0_pcx_atm_pq, 
  spc1_pcx_data_pa, 
  spc1_pcx_req_pq, 
  spc1_pcx_atm_pq, 
  spc2_pcx_data_pa, 
  spc2_pcx_req_pq, 
  spc2_pcx_atm_pq, 
  spc3_pcx_data_pa, 
  spc3_pcx_req_pq, 
  spc3_pcx_atm_pq, 
  spc4_pcx_data_pa, 
  spc4_pcx_req_pq, 
  spc4_pcx_atm_pq, 
  spc5_pcx_data_pa, 
  spc5_pcx_req_pq, 
  spc5_pcx_atm_pq, 
  spc6_pcx_data_pa, 
  spc6_pcx_req_pq, 
  spc6_pcx_atm_pq, 
  spc7_pcx_data_pa, 
  spc7_pcx_req_pq, 
  spc7_pcx_atm_pq, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out);
wire [129:0] pcx_fpio_data_px2_0;
wire pcx_sctag1_data_rdy_px1_0;
wire pcx_sctag1_atm_px1_0;
wire pcx_sctag3_data_rdy_px1_0;
wire pcx_sctag3_atm_px1_0;
wire pcx_sctag5_data_rdy_px1_0;
wire pcx_sctag5_atm_px1_0;
wire pcx_sctag7_data_rdy_px1_0;
wire pcx_sctag7_atm_px1_0;
wire [8:0] pcx_spc0_grant_a;
wire [8:0] pcx_spc0_grant_a_0;
wire [8:0] pcx_spc1_grant_a;
wire [8:0] pcx_spc1_grant_a_0;
wire [8:0] pcx_spc2_grant_a;
wire [8:0] pcx_spc2_grant_a_0;
wire [8:0] pcx_spc3_grant_a;
wire [8:0] pcx_spc3_grant_a_0;
wire [8:0] pcx_spc4_grant_a;
wire [8:0] pcx_spc4_grant_a_0;
wire [8:0] pcx_spc5_grant_a;
wire [8:0] pcx_spc5_grant_a_0;
wire [8:0] pcx_spc6_grant_a;
wire [8:0] pcx_spc6_grant_a_0;
wire [8:0] pcx_spc7_grant_a;
wire [8:0] pcx_spc7_grant_a_0;
wire io_pcx_stall_pq_buf;
wire fpio_atm1_unused;
wire fpio_atm2_unused;
wire rdy8_1_unused;
wire io_pcx_stall_pq_d1;
wire [8:0] grant8_unused;
wire tcu_scan_en_bfg_8_unused;
wire tcu_pce_ov_bfg_8_unused;
wire ccx_aclk_bfg_8_unused;
wire ccx_bclk_bfg_8_unused;
wire pcx_fpio_data_rdy_a;
wire bfg8_scanin;
wire bfg8_scanout;
wire tcu_scan_en_bfd_lt;
wire tcu_pce_ov_bfd_lt;
wire ccx_aclk_bfd_lt;
wire ccx_bclk_bfd_lt;
wire sctag0_pcx_stall_pq_buf;
wire sctag0_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_0_unused;
wire tcu_pce_ov_bfg_0_unused;
wire ccx_aclk_bfg_0_unused;
wire ccx_bclk_bfg_0_unused;
wire pcx_sctag0_atm_a;
wire pcx_sctag1_atm_a;
wire pcx_sctag0_data_rdy_a;
wire pcx_sctag1_data_rdy_a;
wire bfg0_scanin;
wire bfg0_scanout;
wire sctag1_pcx_stall_pq_buf;
wire atm10_unused;
wire atm11_unused;
wire rdy10_unused;
wire rdy11_unused;
wire sctag1_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_1_unused;
wire tcu_pce_ov_bfg_1_unused;
wire ccx_aclk_bfg_1_unused;
wire ccx_bclk_bfg_1_unused;
wire bfg1_scanin;
wire bfg1_scanout;
wire tcu_scan_en_bfd_t;
wire tcu_pce_ov_bfd_t;
wire ccx_aclk_bfd_t;
wire ccx_bclk_bfd_t;
wire sctag2_pcx_stall_pq_buf;
wire sctag2_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_2_unused;
wire tcu_pce_ov_bfg_2_unused;
wire ccx_aclk_bfg_2_unused;
wire ccx_bclk_bfg_2_unused;
wire pcx_sctag2_atm_a;
wire pcx_sctag3_atm_a;
wire pcx_sctag2_data_rdy_a;
wire pcx_sctag3_data_rdy_a;
wire bfg2_scanin;
wire bfg2_scanout;
wire tcu_scan_en_bfd_lb;
wire tcu_pce_ov_bfd_lb;
wire ccx_aclk_bfd_lb;
wire ccx_bclk_bfd_lb;
wire sctag3_pcx_stall_pq_buf;
wire atm30_unused;
wire atm31_unused;
wire rdy30_unused;
wire rdy31_unused;
wire sctag3_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_3_unused;
wire tcu_pce_ov_bfg_3_unused;
wire ccx_aclk_bfg_3_unused;
wire ccx_bclk_bfg_3_unused;
wire bfg3_scanin;
wire bfg3_scanout;
wire tcu_scan_en_bfd_b;
wire tcu_pce_ov_bfd_b;
wire ccx_aclk_bfd_b;
wire ccx_bclk_bfd_b;
wire sctag4_pcx_stall_pq_buf;
wire sctag4_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_4_unused;
wire tcu_pce_ov_bfg_4_unused;
wire ccx_aclk_bfg_4_unused;
wire ccx_bclk_bfg_4_unused;
wire pcx_sctag4_atm_a;
wire pcx_sctag5_atm_a;
wire pcx_sctag4_data_rdy_a;
wire pcx_sctag5_data_rdy_a;
wire bfg4_scanin;
wire bfg4_scanout;
wire tcu_scan_en_bfd_rt;
wire tcu_pce_ov_bfd_rt;
wire ccx_aclk_bfd_rt;
wire ccx_bclk_bfd_rt;
wire sctag5_pcx_stall_pq_buf;
wire atm50_unused;
wire atm51_unused;
wire rdy50_unused;
wire rdy51_unused;
wire sctag5_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_5_unused;
wire tcu_pce_ov_bfg_5_unused;
wire ccx_aclk_bfg_5_unused;
wire ccx_bclk_bfg_5_unused;
wire bfg5_scanin;
wire bfg5_scanout;
wire sctag6_pcx_stall_pq_buf;
wire sctag6_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_6_unused;
wire tcu_pce_ov_bfg_6_unused;
wire ccx_aclk_bfg_6_unused;
wire ccx_bclk_bfg_6_unused;
wire pcx_sctag6_atm_a;
wire pcx_sctag7_atm_a;
wire pcx_sctag6_data_rdy_a;
wire pcx_sctag7_data_rdy_a;
wire bfg6_scanin;
wire bfg6_scanout;
wire tcu_scan_en_bfd_rb;
wire tcu_pce_ov_bfd_rb;
wire ccx_aclk_bfd_rb;
wire ccx_bclk_bfd_rb;
wire sctag7_pcx_stall_pq_buf;
wire atm70_unused;
wire atm71_unused;
wire rdy70_unused;
wire rdy71_unused;
wire sctag7_pcx_stall_pq_d1;
wire tcu_scan_en_bfg_7_unused;
wire tcu_pce_ov_bfg_7_unused;
wire ccx_aclk_bfg_7_unused;
wire ccx_bclk_bfg_7_unused;
wire bfg7_scanin;
wire bfg7_scanout;
wire [8:0] spc0_pcx_req_pq_l_0;
wire [8:0] spc0_pcx_atm_pq_l_0;
wire [8:0] spc0_pcx_req_pq_r_0;
wire [8:0] spc0_pcx_atm_pq_r_0;
wire [8:0] spc1_pcx_req_pq_l_0;
wire [8:0] spc1_pcx_atm_pq_l_0;
wire [8:0] spc1_pcx_req_pq_r_0;
wire [8:0] spc1_pcx_atm_pq_r_0;
wire [8:0] spc2_pcx_req_pq_l_0;
wire [8:0] spc2_pcx_atm_pq_l_0;
wire [8:0] spc2_pcx_req_pq_r_0;
wire [8:0] spc2_pcx_atm_pq_r_0;
wire [8:0] spc3_pcx_req_pq_l_0;
wire [8:0] spc3_pcx_atm_pq_l_0;
wire [8:0] spc3_pcx_req_pq_r_0;
wire [8:0] spc3_pcx_atm_pq_r_0;
wire [8:0] spc4_pcx_req_pq_l_0;
wire [8:0] spc4_pcx_atm_pq_l_0;
wire [8:0] spc4_pcx_req_pq_r_0;
wire [8:0] spc4_pcx_atm_pq_r_0;
wire [8:0] spc5_pcx_req_pq_l_0;
wire [8:0] spc5_pcx_atm_pq_l_0;
wire [8:0] spc5_pcx_req_pq_r_0;
wire [8:0] spc5_pcx_atm_pq_r_0;
wire [8:0] spc6_pcx_req_pq_l_0;
wire [8:0] spc6_pcx_atm_pq_l_0;
wire [8:0] spc6_pcx_req_pq_r_0;
wire [8:0] spc6_pcx_atm_pq_r_0;
wire [8:0] spc7_pcx_req_pq_l_0;
wire [8:0] spc7_pcx_atm_pq_l_0;
wire [8:0] spc7_pcx_req_pq_r_0;
wire [8:0] spc7_pcx_atm_pq_r_0;
wire [129:0] spc0_pcx_data_a;
wire [129:0] spc1_pcx_data_a;
wire [129:0] spc2_pcx_data_a;
wire [129:0] spc3_pcx_data_a;
wire [129:0] spc4_pcx_data_a;
wire [129:0] spc5_pcx_data_a;
wire [129:0] spc6_pcx_data_a;
wire [129:0] spc7_pcx_data_a;
wire ccx_aclk_dpa_t;
wire ccx_bclk_dpa_t;
wire tcu_pce_ov_dpa_t;
wire tcu_scan_en_dpa_t;
wire ccx_aclk_dpa_b;
wire ccx_bclk_dpa_b;
wire tcu_pce_ov_dpa_b;
wire tcu_scan_en_dpa_b;
wire [129:0] pcx_fpio_data_x_l;
wire [129:0] pcx_scache0_data_x_l;
wire [129:0] pcx_scache1_data_x_l;
wire [129:0] pcx_scache2_data_x_l;
wire [129:0] pcx_scache3_data_x_l;
wire [129:0] pcx_scache4_data_x_l;
wire [129:0] pcx_scache5_data_x_l;
wire [129:0] pcx_scache6_data_x_l;
wire [129:0] pcx_scache7_data_x_l;
wire [8:0] arb0_grant_l_a;
wire [8:0] arb0_q0_holdbar_l_a;
wire [8:0] arb0_qsel0_l_a;
wire [8:0] arb0_qsel1_l_a;
wire [8:0] arb0_shift_l_a;
wire [8:0] arb1_grant_l_a;
wire [8:0] arb1_q0_holdbar_l_a;
wire [8:0] arb1_qsel0_l_a;
wire [8:0] arb1_qsel1_l_a;
wire [8:0] arb1_shift_l_a;
wire [8:0] arb2_grant_l_a;
wire [8:0] arb2_q0_holdbar_l_a;
wire [8:0] arb2_qsel0_l_a;
wire [8:0] arb2_qsel1_l_a;
wire [8:0] arb2_shift_l_a;
wire [8:0] arb3_grant_l_a;
wire [8:0] arb3_q0_holdbar_l_a;
wire [8:0] arb3_qsel0_l_a;
wire [8:0] arb3_qsel1_l_a;
wire [8:0] arb3_shift_l_a;
wire [8:0] arb4_grant_l_a;
wire [8:0] arb4_q0_holdbar_l_a;
wire [8:0] arb4_qsel0_l_a;
wire [8:0] arb4_qsel1_l_a;
wire [8:0] arb4_shift_l_a;
wire [8:0] arb5_grant_l_a;
wire [8:0] arb5_q0_holdbar_l_a;
wire [8:0] arb5_qsel0_l_a;
wire [8:0] arb5_qsel1_l_a;
wire [8:0] arb5_shift_l_a;
wire [8:0] arb6_grant_l_a;
wire [8:0] arb6_q0_holdbar_l_a;
wire [8:0] arb6_qsel0_l_a;
wire [8:0] arb6_qsel1_l_a;
wire [8:0] arb6_shift_l_a;
wire [8:0] arb7_grant_l_a;
wire [8:0] arb7_q0_holdbar_l_a;
wire [8:0] arb7_qsel0_l_a;
wire [8:0] arb7_qsel1_l_a;
wire [8:0] arb7_shift_l_a;
wire [8:0] arb8_grant_l_a;
wire [8:0] arb8_q0_holdbar_l_a;
wire [8:0] arb8_qsel0_l_a;
wire [8:0] arb8_qsel1_l_a;
wire [8:0] arb8_shift_l_a;
wire [8:0] arb0_grant_r_a;
wire [8:0] arb0_q0_holdbar_r_a;
wire [8:0] arb0_qsel0_r_a;
wire [8:0] arb0_qsel1_r_a;
wire [8:0] arb0_shift_r_a;
wire [8:0] arb1_grant_r_a;
wire [8:0] arb1_q0_holdbar_r_a;
wire [8:0] arb1_qsel0_r_a;
wire [8:0] arb1_qsel1_r_a;
wire [8:0] arb1_shift_r_a;
wire [8:0] arb2_grant_r_a;
wire [8:0] arb2_q0_holdbar_r_a;
wire [8:0] arb2_qsel0_r_a;
wire [8:0] arb2_qsel1_r_a;
wire [8:0] arb2_shift_r_a;
wire [8:0] arb3_grant_r_a;
wire [8:0] arb3_q0_holdbar_r_a;
wire [8:0] arb3_qsel0_r_a;
wire [8:0] arb3_qsel1_r_a;
wire [8:0] arb3_shift_r_a;
wire [8:0] arb4_grant_r_a;
wire [8:0] arb4_q0_holdbar_r_a;
wire [8:0] arb4_qsel0_r_a;
wire [8:0] arb4_qsel1_r_a;
wire [8:0] arb4_shift_r_a;
wire [8:0] arb5_grant_r_a;
wire [8:0] arb5_q0_holdbar_r_a;
wire [8:0] arb5_qsel0_r_a;
wire [8:0] arb5_qsel1_r_a;
wire [8:0] arb5_shift_r_a;
wire [8:0] arb6_grant_r_a;
wire [8:0] arb6_q0_holdbar_r_a;
wire [8:0] arb6_qsel0_r_a;
wire [8:0] arb6_qsel1_r_a;
wire [8:0] arb6_shift_r_a;
wire [8:0] arb7_grant_r_a;
wire [8:0] arb7_q0_holdbar_r_a;
wire [8:0] arb7_qsel0_r_a;
wire [8:0] arb7_qsel1_r_a;
wire [8:0] arb7_shift_r_a;
wire [8:0] arb8_grant_r_a;
wire [8:0] arb8_q0_holdbar_r_a;
wire [8:0] arb8_qsel0_r_a;
wire [8:0] arb8_qsel1_r_a;
wire [8:0] arb8_shift_r_a;
wire pcx_dpa_scanin;
wire pcx_dpa_scanout;
wire bfd_io_scanin;
wire bfd_io_scanout;
wire tcu_scan_en_bfd_0;
wire tcu_pce_ov_bfd_0;
wire ccx_aclk_bfd_0;
wire ccx_bclk_bfd_0;
wire [129:0] pcx_sctag0_data_px2_prebuf;
wire bfd0_scanin;
wire bfd0_scanout;
wire tcu_scan_en_bfd_1;
wire tcu_pce_ov_bfd_1;
wire ccx_aclk_bfd_1;
wire ccx_bclk_bfd_1;
wire [129:0] pcx_sctag1_data_px2_prebuf;
wire bfd1_scanin;
wire bfd1_scanout;
wire [129:0] pcx_sctag2_data_px2_prebuf;
wire bfd2_scanin;
wire bfd2_scanout;
wire tcu_scan_en_bfd_3;
wire tcu_pce_ov_bfd_3;
wire ccx_aclk_bfd_3;
wire ccx_bclk_bfd_3;
wire [129:0] pcx_sctag3_data_px2_prebuf;
wire bfd3_scanin;
wire bfd3_scanout;
wire [129:0] pcx_sctag4_data_px2_prebuf;
wire bfd4_scanin;
wire bfd4_scanout;
wire tcu_scan_en_bfd_5;
wire tcu_pce_ov_bfd_5;
wire ccx_aclk_bfd_5;
wire ccx_bclk_bfd_5;
wire [129:0] pcx_sctag5_data_px2_prebuf;
wire bfd5_scanin;
wire bfd5_scanout;
wire [129:0] pcx_sctag6_data_px2_prebuf;
wire bfd6_scanin;
wire bfd6_scanout;
wire tcu_scan_en_bfd_7;
wire tcu_pce_ov_bfd_7;
wire ccx_aclk_bfd_7;
wire ccx_bclk_bfd_7;
wire [129:0] pcx_sctag7_data_px2_prebuf;
wire bfd7_scanin;
wire bfd7_scanout;
wire [8:0] arb_grant_l_unused;
wire [8:0] arb_q0_hold_l_unused;
wire [8:0] arb_qsel0_l_unused;
wire [8:0] arb_qsel1_l_unused;
wire [8:0] arb_shift_l_unused;
wire [8:0] arb_grant_r_unused;
wire [8:0] arb_q0_hold_r_unused;
wire [8:0] arb_qsel0_r_unused;
wire [8:0] arb_qsel1_r_unused;
wire [8:0] arb_shift_r_unused;
wire sctag0_pcx_stall_lq_d1;
wire [8:0] spc0_pcx_req_lq;
wire [8:0] spc0_pcx_atm_lq;
wire sctag1_pcx_stall_lq_d1;
wire [8:0] spc1_pcx_req_lq;
wire [8:0] spc1_pcx_atm_lq;
wire io_pcx_stall_lq_d1;
wire sctag2_pcx_stall_lq_d1;
wire [8:0] spc2_pcx_req_lq;
wire [8:0] spc2_pcx_atm_lq;
wire sctag3_pcx_stall_lq_d1;
wire [8:0] spc3_pcx_req_lq;
wire [8:0] spc3_pcx_atm_lq;
wire sctag4_pcx_stall_lq_d1;
wire [8:0] spc4_pcx_req_lq;
wire [8:0] spc4_pcx_atm_lq;
wire sctag5_pcx_stall_lq_d1;
wire [8:0] spc5_pcx_req_lq;
wire [8:0] spc5_pcx_atm_lq;
wire sctag6_pcx_stall_lq_d1;
wire [8:0] spc6_pcx_req_lq;
wire [8:0] spc6_pcx_atm_lq;
wire sctag7_pcx_stall_lq_d1;
wire [8:0] spc7_pcx_req_lq;
wire [8:0] spc7_pcx_atm_lq;
wire ccx_aclk_arb_lt;
wire ccx_bclk_arb_lt;
wire tcu_pce_ov_arb_lt;
wire tcu_scan_en_arb_lt;
wire ccx_aclk_arb_lb;
wire ccx_bclk_arb_lb;
wire tcu_pce_ov_arb_lb;
wire tcu_scan_en_arb_lb;
wire ccx_aclk_arb_rt;
wire ccx_bclk_arb_rt;
wire tcu_pce_ov_arb_rt;
wire tcu_scan_en_arb_rt;
wire ccx_aclk_arb_rb;
wire ccx_bclk_arb_rb;
wire tcu_pce_ov_arb_rb;
wire tcu_scan_en_arb_rb;
wire [8:0] pcx_spc4_grant_a_unused;
wire [8:0] pcx_spc5_grant_a_unused;
wire [8:0] pcx_spc6_grant_a_unused;
wire [8:0] pcx_spc7_grant_a_unused;
wire arb0_src8_grant_l_unused;
wire pcx_arbl0_scanin;
wire pcx_arbl0_scanout;
wire arb1_src8_grant_l_unused;
wire pcx_arbl1_scanin;
wire pcx_arbl1_scanout;
wire arb2_src8_grant_l_unused;
wire pcx_arbl2_scanin;
wire pcx_arbl2_scanout;
wire arb3_src8_grant_l_unused;
wire pcx_arbl3_scanin;
wire pcx_arbl3_scanout;
wire arb4_src8_grant_l_unused;
wire pcx_sctag4_atm_a_unused;
wire pcx_sctag4_data_rdy_a_unused;
wire pcx_arbl4_scanin;
wire pcx_arbl4_scanout;
wire arb5_src8_grant_l_unused;
wire pcx_sctag5_atm_a_unused;
wire pcx_sctag5_data_rdy_a_unused;
wire pcx_arbl5_scanin;
wire pcx_arbl5_scanout;
wire arb6_src8_grant_l_unused;
wire pcx_sctag6_atm_a_unused;
wire pcx_sctag6_data_rdy_a_unused;
wire pcx_arbl6_scanin;
wire pcx_arbl6_scanout;
wire arb7_src8_grant_l_unused;
wire pcx_sctag7_atm_a_unused;
wire pcx_sctag7_data_rdy_a_unused;
wire pcx_arbl7_scanin;
wire pcx_arbl7_scanout;
wire arb8_src8_grant_l_unused;
wire arb8_dest_atom_l_unused;
wire pcx_arbl8_scanin;
wire pcx_arbl8_scanout;
wire sctag0_pcx_stall_rq_d1;
wire [8:0] spc0_pcx_req_rq;
wire [8:0] spc0_pcx_atm_rq;
wire sctag1_pcx_stall_rq_d1;
wire [8:0] spc1_pcx_req_rq;
wire [8:0] spc1_pcx_atm_rq;
wire io_pcx_stall_rq_d1;
wire sctag2_pcx_stall_rq_d1;
wire [8:0] spc2_pcx_req_rq;
wire [8:0] spc2_pcx_atm_rq;
wire sctag3_pcx_stall_rq_d1;
wire [8:0] spc3_pcx_req_rq;
wire [8:0] spc3_pcx_atm_rq;
wire sctag4_pcx_stall_rq_d1;
wire [8:0] spc4_pcx_req_rq;
wire [8:0] spc4_pcx_atm_rq;
wire sctag5_pcx_stall_rq_d1;
wire [8:0] spc5_pcx_req_rq;
wire [8:0] spc5_pcx_atm_rq;
wire sctag6_pcx_stall_rq_d1;
wire [8:0] spc6_pcx_req_rq;
wire [8:0] spc6_pcx_atm_rq;
wire sctag7_pcx_stall_rq_d1;
wire [8:0] spc7_pcx_req_rq;
wire [8:0] spc7_pcx_atm_rq;
wire [8:0] pcx_spc0_grant_a_unused;
wire [8:0] pcx_spc1_grant_a_unused;
wire [8:0] pcx_spc2_grant_a_unused;
wire [8:0] pcx_spc3_grant_a_unused;
wire arb0_src8_grant_r_unused;
wire pcx_sctag0_atm_a_unused;
wire pcx_sctag0_data_rdy_a_unused;
wire pcx_arbr0_scanin;
wire pcx_arbr0_scanout;
wire arb1_src8_grant_r_unused;
wire pcx_sctag1_atm_a_unused;
wire pcx_sctag1_data_rdy_a_unused;
wire pcx_arbr1_scanin;
wire pcx_arbr1_scanout;
wire arb2_src8_grant_r_unused;
wire pcx_sctag2_atm_a_unused;
wire pcx_sctag2_data_rdy_a_unused;
wire pcx_arbr2_scanin;
wire pcx_arbr2_scanout;
wire arb3_src8_grant_r_unused;
wire pcx_sctag3_atm_a_unused;
wire pcx_sctag3_data_rdy_a_unused;
wire pcx_arbr3_scanin;
wire pcx_arbr3_scanout;
wire arb4_src8_grant_r_unused;
wire pcx_arbr4_scanin;
wire pcx_arbr4_scanout;
wire arb5_src8_grant_r_unused;
wire pcx_arbr5_scanin;
wire pcx_arbr5_scanout;
wire arb6_src8_grant_r_unused;
wire pcx_arbr6_scanin;
wire pcx_arbr6_scanout;
wire arb7_src8_grant_r_unused;
wire pcx_arbr7_scanin;
wire pcx_arbr7_scanout;
wire arb8_src8_grant_r_unused;
wire arb8_dest_atom_r_unused;
wire pcx_fpio_data_rdy_a_unused;
wire pcx_arbr8_scanin;
wire pcx_arbr8_scanout;


output [129:0]          pcx_fpio_data_px2;      // From fpio_buf of pcx_bfd_dp.v
output                  pcx_fpio_data_rdy_px1;  // From arb8 of ccx_arb.v
output                  pcx_sctag0_atm_px1;     // From arb0 of ccx_arb.v
output [129:0]          pcx_sctag0_data_px2;    // From sc_buf0 of pcx_bfd_dp.v
output                  pcx_sctag0_data_rdy_px1;// From arb0 of ccx_arb.v
output                  pcx_sctag1_atm_px1;     // From arb1 of ccx_arb.v
output [129:0]          pcx_sctag1_data_px2;    // From sc_buf1 of pcx_bfd_dp.v
output                  pcx_sctag1_data_rdy_px1;// From arb1 of ccx_arb.v
output                  pcx_sctag2_atm_px1;     // From arb2 of ccx_arb.v
output [129:0]          pcx_sctag2_data_px2;    // From sc_buf2 of pcx_bfd_dp.v
output                  pcx_sctag2_data_rdy_px1;// From arb2 of ccx_arb.v
output                  pcx_sctag3_atm_px1;     // From arb3 of ccx_arb.v
output [129:0]          pcx_sctag3_data_px2;    // From sc_buf3 of pcx_bfd_dp.v
output                  pcx_sctag3_data_rdy_px1;// From arb3 of ccx_arb.v
output                  pcx_sctag4_atm_px1;     // From arb4 of ccx_arb.v
output [129:0]          pcx_sctag4_data_px2;    // From sc_buf4 of pcx_bfd_dp.v
output                  pcx_sctag4_data_rdy_px1;// From arb4 of ccx_arb.v
output                  pcx_sctag5_atm_px1;     // From arb5 of ccx_arb.v
output [129:0]          pcx_sctag5_data_px2;    // From sc_buf5 of pcx_bfd_dp.v
output                  pcx_sctag5_data_rdy_px1;// From arb5 of ccx_arb.v
output                  pcx_sctag6_atm_px1;     // From arb6 of ccx_arb.v
output [129:0]          pcx_sctag6_data_px2;    // From sc_buf6 of pcx_bfd_dp.v
output                  pcx_sctag6_data_rdy_px1;// From arb6 of ccx_arb.v
output                  pcx_sctag7_atm_px1;     // From arb7 of ccx_arb.v
output [129:0]          pcx_sctag7_data_px2;    // From sc_buf7 of pcx_bfd_dp.v
output                  pcx_sctag7_data_rdy_px1;// From arb7 of ccx_arb.v
output [8:0]            pcx_spc0_grant_px;      // From spc_buf0 of pcx_bfg_dp.v
output [8:0]            pcx_spc1_grant_px;      // From spc_buf1 of pcx_bfg_dp.v
output [8:0]            pcx_spc2_grant_px;      // From spc_buf2 of pcx_bfg_dp.v
output [8:0]            pcx_spc3_grant_px;      // From spc_buf3 of pcx_bfg_dp.v
output [8:0]            pcx_spc4_grant_px;      // From spc_buf4 of pcx_bfg_dp.v
output [8:0]            pcx_spc5_grant_px;      // From spc_buf5 of pcx_bfg_dp.v
output [8:0]            pcx_spc6_grant_px;      // From spc_buf6 of pcx_bfg_dp.v
output [8:0]            pcx_spc7_grant_px;      // From spc_buf7 of pcx_bfg_dp.v
// End of automatics


input                   io_pcx_stall_pq;        // To arb8 of ccx_arb.v
input                   sctag0_pcx_stall_pq;    // To arb0 of ccx_arb.v
input                   sctag1_pcx_stall_pq;    // To arb1 of ccx_arb.v
input                   sctag2_pcx_stall_pq;    // To arb2 of ccx_arb.v
input                   sctag3_pcx_stall_pq;    // To arb3 of ccx_arb.v
input                   sctag4_pcx_stall_pq;    // To arb4 of ccx_arb.v
input                   sctag5_pcx_stall_pq;    // To arb5 of ccx_arb.v
input                   sctag6_pcx_stall_pq;    // To arb6 of ccx_arb.v
input                   sctag7_pcx_stall_pq;    // To arb7 of ccx_arb.v
input [129:0]           spc0_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc0_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc0_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc1_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc1_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc1_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc2_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc2_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc2_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc3_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc3_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc3_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc4_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc4_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc4_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc5_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc5_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc5_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc6_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc6_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc6_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
input [129:0]           spc7_pcx_data_pa;       // To pcx_dpa of pcx_dpa.v
input [8:0]             spc7_pcx_req_pq;        // To arb0 of ccx_arb.v, ...
input [8:0]             spc7_pcx_atm_pq;       // To arb0 of ccx_arb.v, ...
// End of automatics

//globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;

// buffer io data
pcx_buff_macro__dbuff_32x__rep_1__stack_150c__width_130 i_bufd_io     (
	.din	(pcx_fpio_data_px2_0[129:0]),
	.dout	(pcx_fpio_data_px2[129:0])
);


// buffer data rdy and atm signals above the arbiters
// signals going to spc1, spc3, spc5, and spc7 will have an
// extra level off buffers

pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct1_1     (
	.din	({pcx_sctag1_data_rdy_px1_0, pcx_sctag1_atm_px1_0}),
	.dout	({pcx_sctag1_data_rdy_px1, pcx_sctag1_atm_px1})
);

pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct3_1     (
	.din	({pcx_sctag3_data_rdy_px1_0, pcx_sctag3_atm_px1_0}),
	.dout	({pcx_sctag3_data_rdy_px1, pcx_sctag3_atm_px1})
);

pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct5_1     (
	.din	({pcx_sctag5_data_rdy_px1_0, pcx_sctag5_atm_px1_0}),
	.dout	({pcx_sctag5_data_rdy_px1, pcx_sctag5_atm_px1})
);

pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct7_1     (
	.din	({pcx_sctag7_data_rdy_px1_0, pcx_sctag7_atm_px1_0}),
	.dout	({pcx_sctag7_data_rdy_px1, pcx_sctag7_atm_px1})
);


// buffer output grant signals
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc0     (
	.din	(pcx_spc0_grant_a[8:0]),
	.dout	(pcx_spc0_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc1     (
	.din	(pcx_spc1_grant_a[8:0]),
	.dout	(pcx_spc1_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc2     (
	.din	(pcx_spc2_grant_a[8:0]),
	.dout	(pcx_spc2_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc3     (
	.din	(pcx_spc3_grant_a[8:0]),
	.dout	(pcx_spc3_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc4     (
	.din	(pcx_spc4_grant_a[8:0]),
	.dout	(pcx_spc4_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc5     (
	.din	(pcx_spc5_grant_a[8:0]),
	.dout	(pcx_spc5_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc6     (
	.din	(pcx_spc6_grant_a[8:0]),
	.dout	(pcx_spc6_grant_a_0[8:0])
);
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc7     (
	.din	(pcx_spc7_grant_a[8:0]),
	.dout	(pcx_spc7_grant_a_0[8:0])
);



/*
 pcx_bfg_dp AUTO_TEMPLATE(
 .pcx_spc_grant_px (pcx_spc@_grant_px_0[8:0]),
 .pcx_spc_grant_pa (pcx_spc@_grant_a[8:0]),
);
   */

//To meet timing, stall_pq is being flopped.
pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_io_stall     (
.din (io_pcx_stall_pq),
.dout(io_pcx_stall_pq_buf)                                                                 
);
                                                                 
pcx_bfg_dp bfg8 (
                 .pcx_spc_grant_px      ({fpio_atm1_unused, fpio_atm2_unused, pcx_fpio_data_rdy_px1,rdy8_1_unused ,io_pcx_stall_pq_d1,grant8_unused[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_8_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_8_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_8_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_8_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({2'b0,pcx_fpio_data_rdy_a,1'b0,io_pcx_stall_pq_buf,9'b0}), // Templated
                 .scan_in(bfg8_scanin),
                 .scan_out(bfg8_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_lt),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_lt),
                 .ccx_aclk                (ccx_aclk_bfd_lt),
                 .ccx_bclk                (ccx_bclk_bfd_lt)
                 );

pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct0_stall     (
.din (sctag0_pcx_stall_pq),
.dout(sctag0_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg0 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({pcx_sctag0_atm_px1, pcx_sctag1_atm_px1_0,pcx_sctag0_data_rdy_px1, pcx_sctag1_data_rdy_px1_0,sctag0_pcx_stall_pq_d1,pcx_spc0_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_0_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_0_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_0_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_0_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({pcx_sctag0_atm_a,pcx_sctag1_atm_a,pcx_sctag0_data_rdy_a,pcx_sctag1_data_rdy_a,sctag0_pcx_stall_pq_buf,pcx_spc0_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg0_scanin),
                 .scan_out(bfg0_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_lt),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_lt),
                 .ccx_aclk                (ccx_aclk_bfd_lt),
                 .ccx_bclk                (ccx_bclk_bfd_lt)
                 );

pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct1_stall     (
.din (sctag1_pcx_stall_pq),
.dout(sctag1_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg1 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({atm10_unused, atm11_unused, rdy10_unused, rdy11_unused,sctag1_pcx_stall_pq_d1,pcx_spc1_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_1_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_1_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_1_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_1_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({4'b0,sctag1_pcx_stall_pq_buf,pcx_spc1_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg1_scanin),
                 .scan_out(bfg1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );

pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct2_stall     (
.din (sctag2_pcx_stall_pq),
.dout(sctag2_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg2 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({pcx_sctag2_atm_px1, pcx_sctag3_atm_px1_0,pcx_sctag2_data_rdy_px1, pcx_sctag3_data_rdy_px1_0,sctag2_pcx_stall_pq_d1,pcx_spc2_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_2_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_2_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_2_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_2_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({pcx_sctag2_atm_a,pcx_sctag3_atm_a,pcx_sctag2_data_rdy_a,pcx_sctag3_data_rdy_a,sctag2_pcx_stall_pq_buf,pcx_spc2_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg2_scanin),
                 .scan_out(bfg2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_lb),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_lb),
                 .ccx_aclk                (ccx_aclk_bfd_lb),
                 .ccx_bclk                (ccx_bclk_bfd_lb)
                 );

pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct3_stall     (
.din (sctag3_pcx_stall_pq),
.dout(sctag3_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg3 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({atm30_unused, atm31_unused, rdy30_unused, rdy31_unused,sctag3_pcx_stall_pq_d1,pcx_spc3_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_3_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_3_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_3_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_3_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({4'b0,sctag3_pcx_stall_pq_buf,pcx_spc3_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg3_scanin),
                 .scan_out(bfg3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );


pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct4_stall     (
.din (sctag4_pcx_stall_pq),
.dout(sctag4_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg4 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({pcx_sctag4_atm_px1, pcx_sctag5_atm_px1_0,pcx_sctag4_data_rdy_px1, pcx_sctag5_data_rdy_px1_0,sctag4_pcx_stall_pq_d1,pcx_spc4_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_4_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_4_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_4_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_4_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({pcx_sctag4_atm_a,pcx_sctag5_atm_a,pcx_sctag4_data_rdy_a,pcx_sctag5_data_rdy_a,sctag4_pcx_stall_pq_buf,pcx_spc4_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg4_scanin),
                 .scan_out(bfg4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_rt),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_rt),
                 .ccx_aclk                (ccx_aclk_bfd_rt),
                 .ccx_bclk                (ccx_bclk_bfd_rt)
                 );


pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct5_stall     (
.din (sctag5_pcx_stall_pq),
.dout(sctag5_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg5 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({atm50_unused, atm51_unused, rdy50_unused, rdy51_unused,sctag5_pcx_stall_pq_d1,pcx_spc5_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_5_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_5_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_5_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_5_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({4'b0,sctag5_pcx_stall_pq_buf,pcx_spc5_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg5_scanin),
                 .scan_out(bfg5_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );


pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct6_stall     (
.din (sctag6_pcx_stall_pq),
.dout(sctag6_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg6 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({pcx_sctag6_atm_px1,pcx_sctag7_atm_px1_0,pcx_sctag6_data_rdy_px1,pcx_sctag7_data_rdy_px1_0,sctag6_pcx_stall_pq_d1,pcx_spc6_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_6_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_6_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_6_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_6_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({pcx_sctag6_atm_a,pcx_sctag7_atm_a,pcx_sctag6_data_rdy_a,pcx_sctag7_data_rdy_a,sctag6_pcx_stall_pq_buf,pcx_spc6_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg6_scanin),
                 .scan_out(bfg6_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_rb),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_rb),
                 .ccx_aclk                (ccx_aclk_bfd_rb),
                 .ccx_bclk                (ccx_bclk_bfd_rb)
                 );


pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct7_stall     (
.din (sctag7_pcx_stall_pq),
.dout (sctag7_pcx_stall_pq_buf)                                                                 
);
pcx_bfg_dp bfg7 (/*AUTOINST*/
                 // Outputs
                 .pcx_spc_grant_px      ({atm70_unused, atm71_unused, rdy70_unused, rdy71_unused,sctag7_pcx_stall_pq_d1,pcx_spc7_grant_px[8:0]}), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_7_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_7_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_7_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_7_unused),
                 // Inputs
                 .pcx_spc_grant_pa      ({4'b0,sctag7_pcx_stall_pq_buf,pcx_spc7_grant_a_0[8:0]}), // Templated
                 .scan_in(bfg7_scanin),
                 .scan_out(bfg7_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );


// buffer req and atm signals at the pins
pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc0_l     (
	.din	({spc0_pcx_req_pq[8:0],spc0_pcx_atm_pq[8:0]}),
	.dout	({spc0_pcx_req_pq_l_0[8:0],spc0_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc0_r     (
	.din	({spc0_pcx_req_pq[8:0],spc0_pcx_atm_pq[8:0]}),
	.dout	({spc0_pcx_req_pq_r_0[8:0],spc0_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc1_l     (
	.din	({spc1_pcx_req_pq[8:0],spc1_pcx_atm_pq[8:0]}),
	.dout	({spc1_pcx_req_pq_l_0[8:0],spc1_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc1_r     (
	.din	({spc1_pcx_req_pq[8:0],spc1_pcx_atm_pq[8:0]}),
	.dout	({spc1_pcx_req_pq_r_0[8:0],spc1_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc2_l     (
	.din	({spc2_pcx_req_pq[8:0],spc2_pcx_atm_pq[8:0]}),
	.dout	({spc2_pcx_req_pq_l_0[8:0],spc2_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc2_r     (
	.din	({spc2_pcx_req_pq[8:0],spc2_pcx_atm_pq[8:0]}),
	.dout	({spc2_pcx_req_pq_r_0[8:0],spc2_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc3_l     (
	.din	({spc3_pcx_req_pq[8:0],spc3_pcx_atm_pq[8:0]}),
	.dout	({spc3_pcx_req_pq_l_0[8:0],spc3_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc3_r     (
	.din	({spc3_pcx_req_pq[8:0],spc3_pcx_atm_pq[8:0]}),
	.dout	({spc3_pcx_req_pq_r_0[8:0],spc3_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc4_l     (
	.din	({spc4_pcx_req_pq[8:0],spc4_pcx_atm_pq[8:0]}),
	.dout	({spc4_pcx_req_pq_l_0[8:0],spc4_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc4_r     (
	.din	({spc4_pcx_req_pq[8:0],spc4_pcx_atm_pq[8:0]}),
	.dout	({spc4_pcx_req_pq_r_0[8:0],spc4_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc5_l     (
	.din	({spc5_pcx_req_pq[8:0],spc5_pcx_atm_pq[8:0]}),
	.dout	({spc5_pcx_req_pq_l_0[8:0],spc5_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc5_r     (
	.din	({spc5_pcx_req_pq[8:0],spc5_pcx_atm_pq[8:0]}),
	.dout	({spc5_pcx_req_pq_r_0[8:0],spc5_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc6_l     (
	.din	({spc6_pcx_req_pq[8:0],spc6_pcx_atm_pq[8:0]}),
	.dout	({spc6_pcx_req_pq_l_0[8:0],spc6_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc6_r     (
	.din	({spc6_pcx_req_pq[8:0],spc6_pcx_atm_pq[8:0]}),
	.dout	({spc6_pcx_req_pq_r_0[8:0],spc6_pcx_atm_pq_r_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc7_l     (
	.din	({spc7_pcx_req_pq[8:0],spc7_pcx_atm_pq[8:0]}),
	.dout	({spc7_pcx_req_pq_l_0[8:0],spc7_pcx_atm_pq_l_0[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc7_r     (
	.din	({spc7_pcx_req_pq[8:0],spc7_pcx_atm_pq[8:0]}),
	.dout	({spc7_pcx_req_pq_r_0[8:0],spc7_pcx_atm_pq_r_0[8:0]})
);






// buffer all the inputs at the input column
pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc0_1     (
	.din	(spc0_pcx_data_pa[129:0]),
	.dout	(spc0_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc1_1     (
	.din	(spc1_pcx_data_pa[129:0]),
	.dout	(spc1_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc2_1     (
	.din	(spc2_pcx_data_pa[129:0]),
	.dout	(spc2_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc3_1     (
	.din	(spc3_pcx_data_pa[129:0]),
	.dout	(spc3_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc4_1     (
	.din	(spc4_pcx_data_pa[129:0]),
	.dout	(spc4_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc5_1     (
	.din	(spc5_pcx_data_pa[129:0]),
	.dout	(spc5_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc6_1     (
	.din	(spc6_pcx_data_pa[129:0]),
	.dout	(spc6_pcx_data_a[129:0])
);

pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc7_1     (
	.din	(spc7_pcx_data_pa[129:0]),
	.dout	(spc7_pcx_data_a[129:0])
);


//buffer the high fanout signals going to dpa top
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_t     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_dpa_t,ccx_bclk_dpa_t,tcu_pce_ov_dpa_t,tcu_scan_en_dpa_t})
);
//buffer the high fanout signals going to bfd_dp/bfg_dp top
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_t     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_bfd_t,ccx_bclk_bfd_t,tcu_pce_ov_bfd_t,tcu_scan_en_bfd_t})
);

//buffer the high fanout signals going to dpa bottom
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_b     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_dpa_b,ccx_bclk_dpa_b,tcu_pce_ov_dpa_b,tcu_scan_en_dpa_b})
);
//buffer the high fanout signals going to bfd_dp/bfg_dp bottom
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_b     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_bfd_b,ccx_bclk_bfd_b,tcu_pce_ov_bfd_b,tcu_scan_en_bfd_b})
);


// Beginning of automatic inputs (from unused autoinst inputs)

 /*
  pcx_dpa AUTO_TEMPLATE(
  .pcx_io_data_x_(pcx_fpio_data_x_l[129:0]),
  .pcx_scache0_data_x_(pcx_scache0_data_x_l[129:0]),
  .pcx_scache1_data_x_(pcx_scache1_data_x_l[129:0]),
  .pcx_scache2_data_x_(pcx_scache2_data_x_l[129:0]),
  .pcx_scache3_data_x_(pcx_scache3_data_x_l[129:0]),
  .pcx_scache4_data_x_(pcx_scache4_data_x_l[129:0]),
  .pcx_scache5_data_x_(pcx_scache5_data_x_l[129:0]),
  .pcx_scache6_data_x_(pcx_scache6_data_x_l[129:0]),
  .pcx_scache7_data_x_(pcx_scache7_data_x_l[129:0]));
  */

pcx_dpa pcx_dpa (
/*AUTOINST*/
                 // Outputs
                 .pcx_io_data_x_        (pcx_fpio_data_x_l[129:0]), // Templated
                 .pcx_scache0_data_x_   (pcx_scache0_data_x_l[129:0]), // Templated
                 .pcx_scache1_data_x_   (pcx_scache1_data_x_l[129:0]), // Templated
                 .pcx_scache2_data_x_   (pcx_scache2_data_x_l[129:0]), // Templated
                 .pcx_scache3_data_x_   (pcx_scache3_data_x_l[129:0]), // Templated
                 .pcx_scache4_data_x_   (pcx_scache4_data_x_l[129:0]), // Templated
                 .pcx_scache5_data_x_   (pcx_scache5_data_x_l[129:0]), // Templated
                 .pcx_scache6_data_x_   (pcx_scache6_data_x_l[129:0]), // Templated
                 .pcx_scache7_data_x_   (pcx_scache7_data_x_l[129:0]), // Templated
                 // Inputs
                 .arb0_grant_l_a          (arb0_grant_l_a[7:0]),
                 .arb0_q0_holdbar_l_a     (arb0_q0_holdbar_l_a[7:0]),
                 .arb0_qsel0_l_a          (arb0_qsel0_l_a[7:0]),
                 .arb0_qsel1_l_a          (arb0_qsel1_l_a[7:0]),
                 .arb0_shift_l_a          (arb0_shift_l_a[7:0]),
                 .arb1_grant_l_a          (arb1_grant_l_a[7:0]),
                 .arb1_q0_holdbar_l_a     (arb1_q0_holdbar_l_a[7:0]),
                 .arb1_qsel0_l_a          (arb1_qsel0_l_a[7:0]),
                 .arb1_qsel1_l_a          (arb1_qsel1_l_a[7:0]),
                 .arb1_shift_l_a          (arb1_shift_l_a[7:0]),
                 .arb2_grant_l_a          (arb2_grant_l_a[7:0]),
                 .arb2_q0_holdbar_l_a     (arb2_q0_holdbar_l_a[7:0]),
                 .arb2_qsel0_l_a          (arb2_qsel0_l_a[7:0]),
                 .arb2_qsel1_l_a          (arb2_qsel1_l_a[7:0]),
                 .arb2_shift_l_a          (arb2_shift_l_a[7:0]),
                 .arb3_grant_l_a          (arb3_grant_l_a[7:0]),
                 .arb3_q0_holdbar_l_a     (arb3_q0_holdbar_l_a[7:0]),
                 .arb3_qsel0_l_a          (arb3_qsel0_l_a[7:0]),
                 .arb3_qsel1_l_a          (arb3_qsel1_l_a[7:0]),
                 .arb3_shift_l_a          (arb3_shift_l_a[7:0]),
                 .arb4_grant_l_a          (arb4_grant_l_a[7:0]),
                 .arb4_q0_holdbar_l_a     (arb4_q0_holdbar_l_a[7:0]),
                 .arb4_qsel0_l_a          (arb4_qsel0_l_a[7:0]),
                 .arb4_qsel1_l_a          (arb4_qsel1_l_a[7:0]),
                 .arb4_shift_l_a          (arb4_shift_l_a[7:0]),
                 .arb5_grant_l_a          (arb5_grant_l_a[7:0]),
                 .arb5_q0_holdbar_l_a     (arb5_q0_holdbar_l_a[7:0]),
                 .arb5_qsel0_l_a          (arb5_qsel0_l_a[7:0]),
                 .arb5_qsel1_l_a          (arb5_qsel1_l_a[7:0]),
                 .arb5_shift_l_a          (arb5_shift_l_a[7:0]),
                 .arb6_grant_l_a          (arb6_grant_l_a[7:0]),
                 .arb6_q0_holdbar_l_a     (arb6_q0_holdbar_l_a[7:0]),
                 .arb6_qsel0_l_a          (arb6_qsel0_l_a[7:0]),
                 .arb6_qsel1_l_a          (arb6_qsel1_l_a[7:0]),
                 .arb6_shift_l_a          (arb6_shift_l_a[7:0]),
                 .arb7_grant_l_a          (arb7_grant_l_a[7:0]),
                 .arb7_q0_holdbar_l_a     (arb7_q0_holdbar_l_a[7:0]),
                 .arb7_qsel0_l_a          (arb7_qsel0_l_a[7:0]),
                 .arb7_qsel1_l_a          (arb7_qsel1_l_a[7:0]),
                 .arb7_shift_l_a          (arb7_shift_l_a[7:0]),
                 .arb8_grant_l_a          (arb8_grant_l_a[7:0]),
                 .arb8_q0_holdbar_l_a     (arb8_q0_holdbar_l_a[7:0]),
                 .arb8_qsel0_l_a          (arb8_qsel0_l_a[7:0]),
                 .arb8_qsel1_l_a          (arb8_qsel1_l_a[7:0]),
                 .arb8_shift_l_a          (arb8_shift_l_a[7:0]),
                 .arb0_grant_r_a          (arb0_grant_r_a[7:0]),
                 .arb0_q0_holdbar_r_a     (arb0_q0_holdbar_r_a[7:0]),
                 .arb0_qsel0_r_a          (arb0_qsel0_r_a[7:0]),
                 .arb0_qsel1_r_a          (arb0_qsel1_r_a[7:0]),
                 .arb0_shift_r_a          (arb0_shift_r_a[7:0]),
                 .arb1_grant_r_a          (arb1_grant_r_a[7:0]),
                 .arb1_q0_holdbar_r_a     (arb1_q0_holdbar_r_a[7:0]),
                 .arb1_qsel0_r_a          (arb1_qsel0_r_a[7:0]),
                 .arb1_qsel1_r_a          (arb1_qsel1_r_a[7:0]),
                 .arb1_shift_r_a          (arb1_shift_r_a[7:0]),
                 .arb2_grant_r_a          (arb2_grant_r_a[7:0]),
                 .arb2_q0_holdbar_r_a     (arb2_q0_holdbar_r_a[7:0]),
                 .arb2_qsel0_r_a          (arb2_qsel0_r_a[7:0]),
                 .arb2_qsel1_r_a          (arb2_qsel1_r_a[7:0]),
                 .arb2_shift_r_a          (arb2_shift_r_a[7:0]),
                 .arb3_grant_r_a          (arb3_grant_r_a[7:0]),
                 .arb3_q0_holdbar_r_a     (arb3_q0_holdbar_r_a[7:0]),
                 .arb3_qsel0_r_a          (arb3_qsel0_r_a[7:0]),
                 .arb3_qsel1_r_a          (arb3_qsel1_r_a[7:0]),
                 .arb3_shift_r_a          (arb3_shift_r_a[7:0]),
                 .arb4_grant_r_a          (arb4_grant_r_a[7:0]),
                 .arb4_q0_holdbar_r_a     (arb4_q0_holdbar_r_a[7:0]),
                 .arb4_qsel0_r_a          (arb4_qsel0_r_a[7:0]),
                 .arb4_qsel1_r_a          (arb4_qsel1_r_a[7:0]),
                 .arb4_shift_r_a          (arb4_shift_r_a[7:0]),
                 .arb5_grant_r_a          (arb5_grant_r_a[7:0]),
                 .arb5_q0_holdbar_r_a     (arb5_q0_holdbar_r_a[7:0]),
                 .arb5_qsel0_r_a          (arb5_qsel0_r_a[7:0]),
                 .arb5_qsel1_r_a          (arb5_qsel1_r_a[7:0]),
                 .arb5_shift_r_a          (arb5_shift_r_a[7:0]),
                 .arb6_grant_r_a          (arb6_grant_r_a[7:0]),
                 .arb6_q0_holdbar_r_a     (arb6_q0_holdbar_r_a[7:0]),
                 .arb6_qsel0_r_a          (arb6_qsel0_r_a[7:0]),
                 .arb6_qsel1_r_a          (arb6_qsel1_r_a[7:0]),
                 .arb6_shift_r_a          (arb6_shift_r_a[7:0]),
                 .arb7_grant_r_a          (arb7_grant_r_a[7:0]),
                 .arb7_q0_holdbar_r_a     (arb7_q0_holdbar_r_a[7:0]),
                 .arb7_qsel0_r_a          (arb7_qsel0_r_a[7:0]),
                 .arb7_qsel1_r_a          (arb7_qsel1_r_a[7:0]),
                 .arb7_shift_r_a          (arb7_shift_r_a[7:0]),
                 .arb8_grant_r_a          (arb8_grant_r_a[7:0]),
                 .arb8_q0_holdbar_r_a     (arb8_q0_holdbar_r_a[7:0]),
                 .arb8_qsel0_r_a          (arb8_qsel0_r_a[7:0]),
                 .arb8_qsel1_r_a          (arb8_qsel1_r_a[7:0]),
                 .arb8_shift_r_a          (arb8_shift_r_a[7:0]),
                 .spc0_pcx_data_a         (spc0_pcx_data_a[129:0]), // Templated
                 .spc1_pcx_data_a         (spc1_pcx_data_a[129:0]), // Templated
                 .spc2_pcx_data_a         (spc2_pcx_data_a[129:0]), // Templated
                 .spc3_pcx_data_a         (spc3_pcx_data_a[129:0]), // Templated
                 .spc4_pcx_data_a         (spc4_pcx_data_a[129:0]), // Templated
                 .spc5_pcx_data_a         (spc5_pcx_data_a[129:0]), // Templated
                 .spc6_pcx_data_a         (spc6_pcx_data_a[129:0]), // Templated
                 .spc7_pcx_data_a         (spc7_pcx_data_a[129:0]), // Templated
                 .scan_in                 (pcx_dpa_scanin),
                 .scan_out                (pcx_dpa_scanout),
                 .l2clk                   (l2clk),
                 .tcu_scan_en_t             (tcu_scan_en_dpa_t),
                 .tcu_pce_ov_t              (tcu_pce_ov_dpa_t),
                 .ccx_aclk_t                (ccx_aclk_dpa_t),
                 .ccx_bclk_t                (ccx_bclk_dpa_t),
                 .tcu_scan_en_b             (tcu_scan_en_dpa_b),
                 .tcu_pce_ov_b              (tcu_pce_ov_dpa_b),
                 .ccx_aclk_b                (ccx_aclk_dpa_b),
                 .ccx_bclk_b                (ccx_bclk_dpa_b)
                 );


// invert and flop the output signals
// These are placed right next to the CCX core datapath

pcx_bfd_dp bfd_io (
/*AUTOINST*/
                   // Outputs
                   .pcx_sctag_data_px2  (pcx_fpio_data_px2_0[129:0]), // Templated
                   .tcu_scan_en_out       (tcu_scan_en_bfd_lt),
                   .tcu_pce_ov_out        (tcu_pce_ov_bfd_lt),
                   .ccx_aclk_out          (ccx_aclk_bfd_lt),
                   .ccx_bclk_out          (ccx_bclk_bfd_lt),
                   // Inputs
                   .pcx_scache_data_px_ (pcx_fpio_data_x_l[129:0]), // Templated
                   .scan_in(bfd_io_scanin),
                   .scan_out(bfd_io_scanout),
                   .l2clk               (l2clk),
                   .tcu_scan_en       (tcu_scan_en_bfd_0),
                   .tcu_pce_ov       (tcu_pce_ov_bfd_0),
                   .ccx_aclk         (ccx_aclk_bfd_0),
                   .ccx_bclk          (ccx_bclk_bfd_0)
                   );




pcx_bfd_dp bfd0 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag0_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_0),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_0),
                 .ccx_aclk_out          (ccx_aclk_bfd_0),
                 .ccx_bclk_out          (ccx_bclk_bfd_0),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache0_data_x_l[129:0]), // Templated
                 .scan_in(bfd0_scanin),
                 .scan_out(bfd0_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_1),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_1),
                 .ccx_aclk          (ccx_aclk_bfd_1),
                 .ccx_bclk          (ccx_bclk_bfd_1)
                 );


// Output buffer at the pins
pcx_ob1_dp ob_0 (
                  .pcx_sctag_data_px2        (pcx_sctag0_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag0_data_px2_prebuf[129:0])
                  );


pcx_bfd_dp bfd1 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag1_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_1),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_1),
                 .ccx_aclk_out          (ccx_aclk_bfd_1),
                 .ccx_bclk_out          (ccx_bclk_bfd_1),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache1_data_x_l[129:0]), // Templated
                 .scan_in(bfd1_scanin),
                 .scan_out(bfd1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );

// Output buffer at the pins
pcx_ob1_dp ob_1 (
                  .pcx_sctag_data_px2        (pcx_sctag1_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag1_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd2 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag2_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_lb),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_lb),
                 .ccx_aclk_out          (ccx_aclk_bfd_lb),
                 .ccx_bclk_out          (ccx_bclk_bfd_lb),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache2_data_x_l[129:0]), // Templated
                 .scan_in(bfd2_scanin),
                 .scan_out(bfd2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_3),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_3),
                 .ccx_aclk                (ccx_aclk_bfd_3),
                 .ccx_bclk                (ccx_bclk_bfd_3)
                 );

// Output buffer at the pins
pcx_ob1_dp ob_2 (
                  .pcx_sctag_data_px2        (pcx_sctag2_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag2_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd3 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag3_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_3),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_3),
                 .ccx_aclk_out          (ccx_aclk_bfd_3),
                 .ccx_bclk_out          (ccx_bclk_bfd_3),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache3_data_x_l[129:0]), // Templated
                 .scan_in(bfd3_scanin),
                 .scan_out(bfd3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );

// Output buffer at the pins
pcx_ob1_dp ob_3 (
                  .pcx_sctag_data_px2        (pcx_sctag3_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag3_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd4 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag4_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_rt),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_rt),
                 .ccx_aclk_out          (ccx_aclk_bfd_rt),
                 .ccx_bclk_out          (ccx_bclk_bfd_rt),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache4_data_x_l[129:0]), // Templated
                 .scan_in(bfd4_scanin),
                 .scan_out(bfd4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_5),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_5),
                 .ccx_aclk                (ccx_aclk_bfd_5),
                 .ccx_bclk                (ccx_bclk_bfd_5)
                 );


// Output buffer at the pins
pcx_ob1_dp ob_4 (
                  .pcx_sctag_data_px2        (pcx_sctag4_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag4_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd5 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag5_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_5),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_5),
                 .ccx_aclk_out          (ccx_aclk_bfd_5),
                 .ccx_bclk_out          (ccx_bclk_bfd_5),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache5_data_x_l[129:0]), // Templated
                 .scan_in(bfd5_scanin),
                 .scan_out(bfd5_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );


// Output buffer at the pins
pcx_ob1_dp ob_5 (
                  .pcx_sctag_data_px2        (pcx_sctag5_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag5_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd6 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag6_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_rb),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_rb),
                 .ccx_aclk_out          (ccx_aclk_bfd_rb),
                 .ccx_bclk_out          (ccx_bclk_bfd_rb),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache6_data_x_l[129:0]), // Templated
                 .scan_in(bfd6_scanin),
                 .scan_out(bfd6_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_7),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_7),
                 .ccx_aclk                (ccx_aclk_bfd_7),
                 .ccx_bclk                (ccx_bclk_bfd_7)
                 );

// Output buffer at the pins
pcx_ob1_dp ob_6 (
                  .pcx_sctag_data_px2        (pcx_sctag6_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag6_data_px2_prebuf[129:0])
                  );

pcx_bfd_dp bfd7 (
                 // Outputs
                 .pcx_sctag_data_px2    (pcx_sctag7_data_px2_prebuf[129:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_7),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_7),
                 .ccx_aclk_out          (ccx_aclk_bfd_7),
                 .ccx_bclk_out          (ccx_bclk_bfd_7),
                 // Inputs
                 .pcx_scache_data_px_   (pcx_scache7_data_x_l[129:0]), // Templated
                 .scan_in(bfd7_scanin),
                 .scan_out(bfd7_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );

// Output buffer at the pins
pcx_ob1_dp ob_7 (
                  .pcx_sctag_data_px2        (pcx_sctag7_data_px2[129:0]),
                  .pcx_sctag_data_px2_prebuf (pcx_sctag7_data_px2_prebuf[129:0])
                  );


assign arb_grant_l_unused[8:0] = {arb8_grant_l_a[8],arb7_grant_l_a[8],arb6_grant_l_a[8],arb5_grant_l_a[8],
                                arb4_grant_l_a[8],arb3_grant_l_a[8],arb2_grant_l_a[8],arb1_grant_l_a[8],arb0_grant_l_a[8]};

assign arb_q0_hold_l_unused[8:0] = {arb8_q0_holdbar_l_a[8],arb7_q0_holdbar_l_a[8],arb6_q0_holdbar_l_a[8],arb5_q0_holdbar_l_a[8],
                                arb4_q0_holdbar_l_a[8],arb3_q0_holdbar_l_a[8],arb2_q0_holdbar_l_a[8],arb1_q0_holdbar_l_a[8],arb0_q0_holdbar_l_a[8]};

assign arb_qsel0_l_unused[8:0] = {arb8_qsel0_l_a[8],arb7_qsel0_l_a[8],arb6_qsel0_l_a[8],arb5_qsel0_l_a[8],
                                arb4_qsel0_l_a[8],arb3_qsel0_l_a[8],arb2_qsel0_l_a[8],arb1_qsel0_l_a[8],arb0_qsel0_l_a[8]};

assign arb_qsel1_l_unused[8:0] = {arb8_qsel1_l_a[8],arb7_qsel1_l_a[8],arb6_qsel1_l_a[8],arb5_qsel1_l_a[8],
                                arb4_qsel1_l_a[8],arb3_qsel1_l_a[8],arb2_qsel1_l_a[8],arb1_qsel1_l_a[8],arb0_qsel1_l_a[8]};

assign arb_shift_l_unused[8:0] = {arb8_shift_l_a[8],arb7_shift_l_a[8],arb6_shift_l_a[8],arb5_shift_l_a[8],
                                arb4_shift_l_a[8],arb3_shift_l_a[8],arb2_shift_l_a[8],arb1_shift_l_a[8],arb0_shift_l_a[8]};

assign arb_grant_r_unused[8:0] = {arb8_grant_r_a[8],arb7_grant_r_a[8],arb6_grant_r_a[8],arb5_grant_r_a[8],
                                arb4_grant_r_a[8],arb3_grant_r_a[8],arb2_grant_r_a[8],arb1_grant_r_a[8],arb0_grant_r_a[8]};

assign arb_q0_hold_r_unused[8:0] = {arb8_q0_holdbar_r_a[8],arb7_q0_holdbar_r_a[8],arb6_q0_holdbar_r_a[8],arb5_q0_holdbar_r_a[8],
                                arb4_q0_holdbar_r_a[8],arb3_q0_holdbar_r_a[8],arb2_q0_holdbar_r_a[8],arb1_q0_holdbar_r_a[8],arb0_q0_holdbar_r_a[8]};

assign arb_qsel0_r_unused[8:0] = {arb8_qsel0_r_a[8],arb7_qsel0_r_a[8],arb6_qsel0_r_a[8],arb5_qsel0_r_a[8],
                                arb4_qsel0_r_a[8],arb3_qsel0_r_a[8],arb2_qsel0_r_a[8],arb1_qsel0_r_a[8],arb0_qsel0_r_a[8]};

assign arb_qsel1_r_unused[8:0] = {arb8_qsel1_r_a[8],arb7_qsel1_r_a[8],arb6_qsel1_r_a[8],arb5_qsel1_r_a[8],
                                arb4_qsel1_r_a[8],arb3_qsel1_r_a[8],arb2_qsel1_r_a[8],arb1_qsel1_r_a[8],arb0_qsel1_r_a[8]};

assign arb_shift_r_unused[8:0] = {arb8_shift_r_a[8],arb7_shift_r_a[8],arb6_shift_r_a[8],arb5_shift_r_a[8],
                                arb4_shift_r_a[8],arb3_shift_r_a[8],arb2_shift_r_a[8],arb1_shift_r_a[8],arb0_shift_r_a[8]};


// buffer req signals feeding left arbiters
pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc0     (
	.din	({sctag0_pcx_stall_pq_d1, spc0_pcx_req_pq_l_0[8:0],spc0_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag0_pcx_stall_lq_d1,   spc0_pcx_req_lq[8:0],spc0_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc1     (
	.din	({sctag1_pcx_stall_pq_d1, spc1_pcx_req_pq_l_0[8:0],spc1_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag1_pcx_stall_lq_d1,   spc1_pcx_req_lq[8:0],spc1_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_20 i_bufq_l_spc2     (
	.din	({io_pcx_stall_pq_d1, sctag2_pcx_stall_pq_d1, spc2_pcx_req_pq_l_0[8:0],spc2_pcx_atm_pq_l_0[8:0]}),
	.dout	({io_pcx_stall_lq_d1,   sctag2_pcx_stall_lq_d1,   spc2_pcx_req_lq[8:0],spc2_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc3     (
	.din	({sctag3_pcx_stall_pq_d1, spc3_pcx_req_pq_l_0[8:0],spc3_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag3_pcx_stall_lq_d1,   spc3_pcx_req_lq[8:0],spc3_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc4     (
	.din	({sctag4_pcx_stall_pq_d1, spc4_pcx_req_pq_l_0[8:0],spc4_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag4_pcx_stall_lq_d1,   spc4_pcx_req_lq[8:0],spc4_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc5     (
	.din	({sctag5_pcx_stall_pq_d1, spc5_pcx_req_pq_l_0[8:0],spc5_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag5_pcx_stall_lq_d1,   spc5_pcx_req_lq[8:0],spc5_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc6     (
	.din	({sctag6_pcx_stall_pq_d1, spc6_pcx_req_pq_l_0[8:0],spc6_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag6_pcx_stall_lq_d1,   spc6_pcx_req_lq[8:0],spc6_pcx_atm_lq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc7     (
	.din	({sctag7_pcx_stall_pq_d1, spc7_pcx_req_pq_l_0[8:0],spc7_pcx_atm_pq_l_0[8:0]}),
	.dout	({sctag7_pcx_stall_lq_d1,   spc7_pcx_req_lq[8:0],spc7_pcx_atm_lq[8:0]})
);

//buffer the high fanout signals going to arb top left
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lt     (
	.din	({ccx_aclk_bfd_lt,ccx_bclk_bfd_lt, tcu_pce_ov_bfd_lt, tcu_scan_en_bfd_lt}),
	.dout	({ccx_aclk_arb_lt,ccx_bclk_arb_lt,tcu_pce_ov_arb_lt,tcu_scan_en_arb_lt})
);

//buffer the high fanout signals going to arb bot left
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lb     (
	.din	({ccx_aclk_bfd_lb,ccx_bclk_bfd_lb, tcu_pce_ov_bfd_lb, tcu_scan_en_bfd_lb}),
	.dout	({ccx_aclk_arb_lb,ccx_bclk_arb_lb,tcu_pce_ov_arb_lb,tcu_scan_en_arb_lb})
);

//buffer the high fanout signals going to arb top right
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rt     (
	.din	({ccx_aclk_bfd_rt,ccx_bclk_bfd_rt, tcu_pce_ov_bfd_rt, tcu_scan_en_bfd_rt}),
	.dout	({ccx_aclk_arb_rt,ccx_bclk_arb_rt,tcu_pce_ov_arb_rt,tcu_scan_en_arb_rt})
);

//buffer the high fanout signals going to arb bot right
pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rb     (
	.din	({ccx_aclk_bfd_rb,ccx_bclk_bfd_rb, tcu_pce_ov_bfd_rb, tcu_scan_en_bfd_rb}),
	.dout	({ccx_aclk_arb_rb,ccx_bclk_arb_rb,tcu_pce_ov_arb_rb,tcu_scan_en_arb_rb})
);


/*
 ccx_arb  AUTO_TEMPLATE(
 // Outputs
 .arb_grant_a		(arb@_grant_l_a[8:0]),
 .arb_q0_holdbar_a		(arb@_q0_holdbar_l_a[8:0]),
 .arb_qsel0_a		(arb@_qsel0_l_a[8:0]),
 .arb_qsel1_a		(arb@_qsel1_l_a[8:0]),
 .arb_shift_a		(arb@_shift_l_a[8:0]),
 .arb_src0_grant_a		(pcx_spc0_grant_a[@]),
 .arb_src1_grant_a		(pcx_spc1_grant_a[@]),
 .arb_src2_grant_a		(pcx_spc2_grant_a[@]),
 .arb_src3_grant_a		(pcx_spc3_grant_a[@]),
 .arb_src4_grant_a		(pcx_spc4_grant_a[@]),
 .arb_src5_grant_a		(pcx_spc5_grant_a[@]),
 .arb_src6_grant_a		(pcx_spc6_grant_a[@]),
 .arb_src7_grant_a		(pcx_spc7_grant_a[@]),
 .arb_src8_grant_a		(arb@_src8_grant_l_unused),
 .ccx_dest_data_rdy_a	(pcx_sctag@_data_rdy_a),
 .ccx_dest_atom_a	(pcx_sctag@_atm_a),
 // Inputs
 .src0_arb_atom_q		(spc0_pcx_atm_lq[@]),
 .src0_arb_req_q		(spc0_pcx_req_lq[@]),
 .src1_arb_atom_q		(spc1_pcx_atm_lq[@]),
 .src1_arb_req_q		(spc1_pcx_req_lq[@]),
 .src2_arb_atom_q		(spc2_pcx_atm_lq[@]),
 .src2_arb_req_q		(spc2_pcx_req_lq[@]),
 .src3_arb_atom_q		(spc3_pcx_atm_lq[@]),
 .src3_arb_req_q		(spc3_pcx_req_lq[@]),
 .src4_arb_atom_q		(spc4_pcx_atm_lq[@]),
 .src4_arb_req_q		(spc4_pcx_req_lq[@]),
 .src5_arb_atom_q		(spc5_pcx_atm_lq[@]),
 .src5_arb_req_q		(spc5_pcx_req_lq[@]),
 .src6_arb_atom_q		(spc6_pcx_atm_lq[@]),
 .src6_arb_req_q		(spc6_pcx_req_lq[@]),
 .src7_arb_atom_q		(spc7_pcx_atm_lq[@]),
 .src7_arb_req_q		(spc7_pcx_req_lq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(1'b0),
 .stall_q_d1			(sctag@_pcx_stall_lq_d1),
);
 */

ccx_arb pcx_arbl0 (
                  // Outputs
                  .arb_grant_a          (arb0_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb0_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb0_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb0_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb0_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (pcx_spc0_grant_a[0]),   // Templated
                  .arb_src1_grant_a     (pcx_spc1_grant_a[0]),   // Templated
                  .arb_src2_grant_a     (pcx_spc2_grant_a[0]),   // Templated
                  .arb_src3_grant_a     (pcx_spc3_grant_a[0]),   // Templated
                  .arb_src4_grant_a     (pcx_spc4_grant_a_unused[0]),   // Templated
                  .arb_src5_grant_a     (pcx_spc5_grant_a_unused[0]),   // Templated
                  .arb_src6_grant_a     (pcx_spc6_grant_a_unused[0]),   // Templated
                  .arb_src7_grant_a     (pcx_spc7_grant_a_unused[0]),   // Templated
                  .arb_src8_grant_a     (arb0_src8_grant_l_unused), // Templated
                  .ccx_dest_atom_a      (pcx_sctag0_atm_a),    // Templated
                  .ccx_dest_data_rdy_a  (pcx_sctag0_data_rdy_a), // Templated
                  // Inputs
                  .src0_arb_atom_q      (spc0_pcx_atm_lq[0]),    // Templated
                  .src0_arb_req_q       (spc0_pcx_req_lq[0]),    // Templated
                  .src1_arb_atom_q      (spc1_pcx_atm_lq[0]),    // Templated
                  .src1_arb_req_q       (spc1_pcx_req_lq[0]),    // Templated
                  .src2_arb_atom_q      (spc2_pcx_atm_lq[0]),    // Templated
                  .src2_arb_req_q       (spc2_pcx_req_lq[0]),    // Templated
                  .src3_arb_atom_q      (spc3_pcx_atm_lq[0]),    // Templated
                  .src3_arb_req_q       (spc3_pcx_req_lq[0]),    // Templated
                  .src4_arb_atom_q      (spc4_pcx_atm_lq[0]),    // Templated
                  .src4_arb_req_q       (spc4_pcx_req_lq[0]),    // Templated
                  .src5_arb_atom_q      (spc5_pcx_atm_lq[0]),    // Templated
                  .src5_arb_req_q       (spc5_pcx_req_lq[0]),    // Templated
                  .src6_arb_atom_q      (spc6_pcx_atm_lq[0]),    // Templated
                  .src6_arb_req_q       (spc6_pcx_req_lq[0]),    // Templated
                  .src7_arb_atom_q      (spc7_pcx_atm_lq[0]),    // Templated
                  .src7_arb_req_q       (spc7_pcx_req_lq[0]),    // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (1'b0),                  // Templated
                  .stall_q_d1              (sctag0_pcx_stall_lq_d1),   // Templated
                  .scan_in(pcx_arbl0_scanin),
                  .scan_out(pcx_arbl0_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );

ccx_arb pcx_arbl1(
                 // Outputs
                 .arb_grant_a           (arb1_grant_l_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb1_q0_holdbar_l_a[8:0]), // Templated
                 .arb_qsel0_a           (arb1_qsel0_l_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb1_qsel1_l_a[8:0]),     // Templated
                 .arb_shift_a           (arb1_shift_l_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a[1]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a[1]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a[1]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a[1]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a_unused[1]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a_unused[1]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a_unused[1]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a_unused[1]),   // Templated
                 .arb_src8_grant_a      (arb1_src8_grant_l_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag1_atm_a),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag1_data_rdy_a), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_lq[1]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_lq[1]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_lq[1]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_lq[1]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_lq[1]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_lq[1]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_lq[1]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_lq[1]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_lq[1]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_lq[1]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_lq[1]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_lq[1]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_lq[1]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_lq[1]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_lq[1]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_lq[1]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag1_pcx_stall_lq_d1),   // Templated
                 .scan_in(pcx_arbl1_scanin),
                 .scan_out(pcx_arbl1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );

ccx_arb pcx_arbl2(
                 // Outputs
                 .arb_grant_a           (arb2_grant_l_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb2_q0_holdbar_l_a[8:0]), // Templated
                 .arb_qsel0_a           (arb2_qsel0_l_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb2_qsel1_l_a[8:0]),     // Templated
                 .arb_shift_a           (arb2_shift_l_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a[2]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a[2]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a[2]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a[2]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a_unused[2]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a_unused[2]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a_unused[2]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a_unused[2]),   // Templated
                 .arb_src8_grant_a      (arb2_src8_grant_l_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag2_atm_a),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag2_data_rdy_a), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_lq[2]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_lq[2]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_lq[2]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_lq[2]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_lq[2]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_lq[2]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_lq[2]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_lq[2]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_lq[2]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_lq[2]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_lq[2]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_lq[2]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_lq[2]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_lq[2]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_lq[2]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_lq[2]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag2_pcx_stall_lq_d1),   // Templated
                 .scan_in(pcx_arbl2_scanin),
                 .scan_out(pcx_arbl2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );

ccx_arb pcx_arbl3(
                 // Outputs
                 .arb_grant_a           (arb3_grant_l_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb3_q0_holdbar_l_a[8:0]), // Templated
                 .arb_qsel0_a           (arb3_qsel0_l_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb3_qsel1_l_a[8:0]),     // Templated
                 .arb_shift_a           (arb3_shift_l_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a[3]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a[3]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a[3]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a[3]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a_unused[3]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a_unused[3]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a_unused[3]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a_unused[3]),   // Templated
                 .arb_src8_grant_a      (arb3_src8_grant_l_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag3_atm_a),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag3_data_rdy_a), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_lq[3]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_lq[3]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_lq[3]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_lq[3]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_lq[3]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_lq[3]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_lq[3]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_lq[3]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_lq[3]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_lq[3]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_lq[3]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_lq[3]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_lq[3]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_lq[3]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_lq[3]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_lq[3]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag3_pcx_stall_lq_d1),   // Templated
                 .scan_in(pcx_arbl3_scanin),
                 .scan_out(pcx_arbl3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );

ccx_arb pcx_arbl4(
                 // Outputs
                 .arb_grant_a           (arb4_grant_l_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb4_q0_holdbar_l_a[8:0]), // Templated
                 .arb_qsel0_a           (arb4_qsel0_l_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb4_qsel1_l_a[8:0]),     // Templated
                 .arb_shift_a           (arb4_shift_l_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a[4]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a[4]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a[4]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a[4]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a_unused[4]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a_unused[4]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a_unused[4]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a_unused[4]),   // Templated
                 .arb_src8_grant_a      (arb4_src8_grant_l_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag4_atm_a_unused),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag4_data_rdy_a_unused), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_lq[4]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_lq[4]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_lq[4]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_lq[4]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_lq[4]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_lq[4]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_lq[4]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_lq[4]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_lq[4]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_lq[4]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_lq[4]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_lq[4]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_lq[4]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_lq[4]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_lq[4]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_lq[4]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag4_pcx_stall_lq_d1),   // Templated
                 .scan_in(pcx_arbl4_scanin),
                 .scan_out(pcx_arbl4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );

ccx_arb pcx_arbl5  (
                   // Outputs
                   .arb_grant_a         (arb5_grant_l_a[8:0]),     // Templated
                   .arb_q0_holdbar_a    (arb5_q0_holdbar_l_a[8:0]), // Templated
                   .arb_qsel0_a         (arb5_qsel0_l_a[8:0]),     // Templated
                   .arb_qsel1_a         (arb5_qsel1_l_a[8:0]),     // Templated
                   .arb_shift_a         (arb5_shift_l_a[8:0]),     // Templated
                   .arb_src0_grant_a    (pcx_spc0_grant_a[5]),   // Templated
                   .arb_src1_grant_a    (pcx_spc1_grant_a[5]),   // Templated
                   .arb_src2_grant_a    (pcx_spc2_grant_a[5]),   // Templated
                   .arb_src3_grant_a    (pcx_spc3_grant_a[5]),   // Templated
                   .arb_src4_grant_a    (pcx_spc4_grant_a_unused[5]),   // Templated
                   .arb_src5_grant_a    (pcx_spc5_grant_a_unused[5]),   // Templated
                   .arb_src6_grant_a    (pcx_spc6_grant_a_unused[5]),   // Templated
                   .arb_src7_grant_a    (pcx_spc7_grant_a_unused[5]),   // Templated
                   .arb_src8_grant_a    (arb5_src8_grant_l_unused), // Templated
                   .ccx_dest_atom_a     (pcx_sctag5_atm_a_unused),    // Templated
                   .ccx_dest_data_rdy_a (pcx_sctag5_data_rdy_a_unused), // Templated
                   // Inputs
                   .src0_arb_atom_q     (spc0_pcx_atm_lq[5]),    // Templated
                   .src0_arb_req_q      (spc0_pcx_req_lq[5]),    // Templated
                   .src1_arb_atom_q     (spc1_pcx_atm_lq[5]),    // Templated
                   .src1_arb_req_q      (spc1_pcx_req_lq[5]),    // Templated
                   .src2_arb_atom_q     (spc2_pcx_atm_lq[5]),    // Templated
                   .src2_arb_req_q      (spc2_pcx_req_lq[5]),    // Templated
                   .src3_arb_atom_q     (spc3_pcx_atm_lq[5]),    // Templated
                   .src3_arb_req_q      (spc3_pcx_req_lq[5]),    // Templated
                   .src4_arb_atom_q     (spc4_pcx_atm_lq[5]),    // Templated
                   .src4_arb_req_q      (spc4_pcx_req_lq[5]),    // Templated
                   .src5_arb_atom_q     (spc5_pcx_atm_lq[5]),    // Templated
                   .src5_arb_req_q      (spc5_pcx_req_lq[5]),    // Templated
                   .src6_arb_atom_q     (spc6_pcx_atm_lq[5]),    // Templated
                   .src6_arb_req_q      (spc6_pcx_req_lq[5]),    // Templated
                   .src7_arb_atom_q     (spc7_pcx_atm_lq[5]),    // Templated
                   .src7_arb_req_q      (spc7_pcx_req_lq[5]),    // Templated
                   .src8_arb_atom_q     (1'b0),                  // Templated
                   .src8_arb_req_q      (1'b0),                  // Templated
                   .stall_q_d1             (sctag5_pcx_stall_lq_d1),   // Templated
                   .scan_in(pcx_arbl5_scanin),
                   .scan_out(pcx_arbl5_scanout),
                   .l2clk               (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );

ccx_arb pcx_arbl6  (
                   // Outputs
                   .arb_grant_a         (arb6_grant_l_a[8:0]),     // Templated
                   .arb_q0_holdbar_a    (arb6_q0_holdbar_l_a[8:0]), // Templated
                   .arb_qsel0_a         (arb6_qsel0_l_a[8:0]),     // Templated
                   .arb_qsel1_a         (arb6_qsel1_l_a[8:0]),     // Templated
                   .arb_shift_a         (arb6_shift_l_a[8:0]),     // Templated
                   .arb_src0_grant_a    (pcx_spc0_grant_a[6]),   // Templated
                   .arb_src1_grant_a    (pcx_spc1_grant_a[6]),   // Templated
                   .arb_src2_grant_a    (pcx_spc2_grant_a[6]),   // Templated
                   .arb_src3_grant_a    (pcx_spc3_grant_a[6]),   // Templated
                   .arb_src4_grant_a    (pcx_spc4_grant_a_unused[6]),   // Templated
                   .arb_src5_grant_a    (pcx_spc5_grant_a_unused[6]),   // Templated
                   .arb_src6_grant_a    (pcx_spc6_grant_a_unused[6]),   // Templated
                   .arb_src7_grant_a    (pcx_spc7_grant_a_unused[6]),   // Templated
                   .arb_src8_grant_a    (arb6_src8_grant_l_unused), // Templated
                   .ccx_dest_atom_a     (pcx_sctag6_atm_a_unused),    // Templated
                   .ccx_dest_data_rdy_a (pcx_sctag6_data_rdy_a_unused), // Templated
                   // Inputs
                   .src0_arb_atom_q     (spc0_pcx_atm_lq[6]),    // Templated
                   .src0_arb_req_q      (spc0_pcx_req_lq[6]),    // Templated
                   .src1_arb_atom_q     (spc1_pcx_atm_lq[6]),    // Templated
                   .src1_arb_req_q      (spc1_pcx_req_lq[6]),    // Templated
                   .src2_arb_atom_q     (spc2_pcx_atm_lq[6]),    // Templated
                   .src2_arb_req_q      (spc2_pcx_req_lq[6]),    // Templated
                   .src3_arb_atom_q     (spc3_pcx_atm_lq[6]),    // Templated
                   .src3_arb_req_q      (spc3_pcx_req_lq[6]),    // Templated
                   .src4_arb_atom_q     (spc4_pcx_atm_lq[6]),    // Templated
                   .src4_arb_req_q      (spc4_pcx_req_lq[6]),    // Templated
                   .src5_arb_atom_q     (spc5_pcx_atm_lq[6]),    // Templated
                   .src5_arb_req_q      (spc5_pcx_req_lq[6]),    // Templated
                   .src6_arb_atom_q     (spc6_pcx_atm_lq[6]),    // Templated
                   .src6_arb_req_q      (spc6_pcx_req_lq[6]),    // Templated
                   .src7_arb_atom_q     (spc7_pcx_atm_lq[6]),    // Templated
                   .src7_arb_req_q      (spc7_pcx_req_lq[6]),    // Templated
                   .src8_arb_atom_q     (1'b0),                  // Templated
                   .src8_arb_req_q      (1'b0),                  // Templated
                   .stall_q_d1             (sctag6_pcx_stall_lq_d1),   // Templated
                   .scan_in(pcx_arbl6_scanin),
                   .scan_out(pcx_arbl6_scanout),
                   .l2clk               (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );

ccx_arb pcx_arbl7 (
                  // Outputs
                  .arb_grant_a          (arb7_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb7_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb7_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb7_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb7_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (pcx_spc0_grant_a[7]),   // Templated
                  .arb_src1_grant_a     (pcx_spc1_grant_a[7]),   // Templated
                  .arb_src2_grant_a     (pcx_spc2_grant_a[7]),   // Templated
                  .arb_src3_grant_a     (pcx_spc3_grant_a[7]),   // Templated
                  .arb_src4_grant_a     (pcx_spc4_grant_a_unused[7]),   // Templated
                  .arb_src5_grant_a     (pcx_spc5_grant_a_unused[7]),   // Templated
                  .arb_src6_grant_a     (pcx_spc6_grant_a_unused[7]),   // Templated
                  .arb_src7_grant_a     (pcx_spc7_grant_a_unused[7]),   // Templated
                  .arb_src8_grant_a     (arb7_src8_grant_l_unused), // Templated
                  .ccx_dest_atom_a      (pcx_sctag7_atm_a_unused),    // Templated
                  .ccx_dest_data_rdy_a  (pcx_sctag7_data_rdy_a_unused), // Templated
                  // Inputs
                  .src0_arb_atom_q      (spc0_pcx_atm_lq[7]),    // Templated
                  .src0_arb_req_q       (spc0_pcx_req_lq[7]),    // Templated
                  .src1_arb_atom_q      (spc1_pcx_atm_lq[7]),    // Templated
                  .src1_arb_req_q       (spc1_pcx_req_lq[7]),    // Templated
                  .src2_arb_atom_q      (spc2_pcx_atm_lq[7]),    // Templated
                  .src2_arb_req_q       (spc2_pcx_req_lq[7]),    // Templated
                  .src3_arb_atom_q      (spc3_pcx_atm_lq[7]),    // Templated
                  .src3_arb_req_q       (spc3_pcx_req_lq[7]),    // Templated
                  .src4_arb_atom_q      (spc4_pcx_atm_lq[7]),    // Templated
                  .src4_arb_req_q       (spc4_pcx_req_lq[7]),    // Templated
                  .src5_arb_atom_q      (spc5_pcx_atm_lq[7]),    // Templated
                  .src5_arb_req_q       (spc5_pcx_req_lq[7]),    // Templated
                  .src6_arb_atom_q      (spc6_pcx_atm_lq[7]),    // Templated
                  .src6_arb_req_q       (spc6_pcx_req_lq[7]),    // Templated
                  .src7_arb_atom_q      (spc7_pcx_atm_lq[7]),    // Templated
                  .src7_arb_req_q       (spc7_pcx_req_lq[7]),    // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (1'b0),                  // Templated
                  .stall_q_d1              (sctag7_pcx_stall_lq_d1),   // Templated
                  .scan_in(pcx_arbl7_scanin),
                  .scan_out(pcx_arbl7_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );

/*
 ccx_arb  AUTO_TEMPLATE(
 // Outputs
 .arb_grant_a		(arb@_grant_l_a[8:0]),
 .arb_q0_holdbar_a		(arb@_q0_holdbar_l_a[8:0]),
 .arb_qsel0_a		(arb@_qsel0_l_a[8:0]),
 .arb_qsel1_a		(arb@_qsel1_l_a[8:0]),
 .arb_shift_a		(arb@_shift_l_a[8:0]),
 .arb_src0_grant_a		(pcx_spc0_grant_a[@]),
 .arb_src1_grant_a		(pcx_spc1_grant_a[@]),
 .arb_src2_grant_a		(pcx_spc2_grant_a[@]),
 .arb_src3_grant_a		(pcx_spc3_grant_a[@]),
 .arb_src4_grant_a		(pcx_spc4_grant_a[@]),
 .arb_src5_grant_a		(pcx_spc5_grant_a[@]),
 .arb_src6_grant_a		(pcx_spc6_grant_a[@]),
 .arb_src7_grant_a		(pcx_spc7_grant_a[@]),
 .arb_src8_grant_a		(arb8_src8_grant_l_unused),
 .ccx_dest_data_rdy_a	(pcx_fpio_data_rdy_a),
 .ccx_dest_atom_x	(arb8_dest_atom_l_unused),
 // Inputs
 .src0_arb_atom_q		(spc0_pcx_atm_lq[@]),
 .src0_arb_req_q		(spc0_pcx_req_lq[@]),
 .src1_arb_atom_q		(spc1_pcx_atm_lq[@]),
 .src1_arb_req_q		(spc1_pcx_req_lq[@]),
 .src2_arb_atom_q		(spc2_pcx_atm_lq[@]),
 .src2_arb_req_q		(spc2_pcx_req_lq[@]),
 .src3_arb_atom_q		(spc3_pcx_atm_lq[@]),
 .src3_arb_req_q		(spc3_pcx_req_lq[@]),
 .src4_arb_atom_q		(spc4_pcx_atm_lq[@]),
 .src4_arb_req_q		(spc4_pcx_req_lq[@]),
 .src5_arb_atom_q		(spc5_pcx_atm_lq[@]),
 .src5_arb_req_q		(spc5_pcx_req_lq[@]),
 .src6_arb_atom_q		(spc6_pcx_atm_lq[@]),
 .src6_arb_req_q		(spc6_pcx_req_lq[@]),
 .src7_arb_atom_q		(spc7_pcx_atm_lq[@]),
 .src7_arb_req_q		(spc7_pcx_req_lq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(1'b0),
 .stall_q_d1			(io_pcx_stall_lq_d1),
);
 */
//
ccx_arb pcx_arbl8 (
                  // Outputs
                  .arb_grant_a          (arb8_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb8_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb8_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb8_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb8_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (pcx_spc0_grant_a[8]),   // Templated
                  .arb_src1_grant_a     (pcx_spc1_grant_a[8]),   // Templated
                  .arb_src2_grant_a     (pcx_spc2_grant_a[8]),   // Templated
                  .arb_src3_grant_a     (pcx_spc3_grant_a[8]),   // Templated
                  .arb_src4_grant_a     (pcx_spc4_grant_a_unused[8]),   // Templated
                  .arb_src5_grant_a     (pcx_spc5_grant_a_unused[8]),   // Templated
                  .arb_src6_grant_a     (pcx_spc6_grant_a_unused[8]),   // Templated
                  .arb_src7_grant_a     (pcx_spc7_grant_a_unused[8]),   // Templated
                  .arb_src8_grant_a     (arb8_src8_grant_l_unused), // Templated
                  .ccx_dest_atom_a      (arb8_dest_atom_l_unused), // Templated
                  .ccx_dest_data_rdy_a  (pcx_fpio_data_rdy_a), // Templated
                  // Inputs
                  .src0_arb_atom_q      (spc0_pcx_atm_lq[8]),    // Templated
                  .src0_arb_req_q       (spc0_pcx_req_lq[8]),    // Templated
                  .src1_arb_atom_q      (spc1_pcx_atm_lq[8]),    // Templated
                  .src1_arb_req_q       (spc1_pcx_req_lq[8]),    // Templated
                  .src2_arb_atom_q      (spc2_pcx_atm_lq[8]),    // Templated
                  .src2_arb_req_q       (spc2_pcx_req_lq[8]),    // Templated
                  .src3_arb_atom_q      (spc3_pcx_atm_lq[8]),    // Templated
                  .src3_arb_req_q       (spc3_pcx_req_lq[8]),    // Templated
                  .src4_arb_atom_q      (spc4_pcx_atm_lq[8]),    // Templated
                  .src4_arb_req_q       (spc4_pcx_req_lq[8]),    // Templated
                  .src5_arb_atom_q      (spc5_pcx_atm_lq[8]),    // Templated
                  .src5_arb_req_q       (spc5_pcx_req_lq[8]),    // Templated
                  .src6_arb_atom_q      (spc6_pcx_atm_lq[8]),    // Templated
                  .src6_arb_req_q       (spc6_pcx_req_lq[8]),    // Templated
                  .src7_arb_atom_q      (spc7_pcx_atm_lq[8]),    // Templated
                  .src7_arb_req_q       (spc7_pcx_req_lq[8]),    // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (1'b0),                  // Templated
                  .stall_q_d1              (io_pcx_stall_lq_d1),       // Templated
                  .scan_in(pcx_arbl8_scanin),
                  .scan_out(pcx_arbl8_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );



// buffer req signals feeding right arbiters
pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc0     (
	.din	({sctag0_pcx_stall_pq_d1, spc0_pcx_req_pq_r_0[8:0],spc0_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag0_pcx_stall_rq_d1,   spc0_pcx_req_rq[8:0],spc0_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc1     (
	.din	({sctag1_pcx_stall_pq_d1, spc1_pcx_req_pq_r_0[8:0],spc1_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag1_pcx_stall_rq_d1,   spc1_pcx_req_rq[8:0],spc1_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_20 i_bufq_r_spc2     (
	.din	({io_pcx_stall_pq_d1, sctag2_pcx_stall_pq_d1, spc2_pcx_req_pq_r_0[8:0],spc2_pcx_atm_pq_r_0[8:0]}),
	.dout	({io_pcx_stall_rq_d1,   sctag2_pcx_stall_rq_d1,   spc2_pcx_req_rq[8:0],spc2_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc3     (
	.din	({sctag3_pcx_stall_pq_d1, spc3_pcx_req_pq_r_0[8:0],spc3_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag3_pcx_stall_rq_d1,   spc3_pcx_req_rq[8:0],spc3_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc4     (
	.din	({sctag4_pcx_stall_pq_d1, spc4_pcx_req_pq_r_0[8:0],spc4_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag4_pcx_stall_rq_d1,   spc4_pcx_req_rq[8:0],spc4_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc5     (
	.din	({sctag5_pcx_stall_pq_d1, spc5_pcx_req_pq_r_0[8:0],spc5_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag5_pcx_stall_rq_d1,   spc5_pcx_req_rq[8:0],spc5_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc6     (
	.din	({sctag6_pcx_stall_pq_d1, spc6_pcx_req_pq_r_0[8:0],spc6_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag6_pcx_stall_rq_d1,   spc6_pcx_req_rq[8:0],spc6_pcx_atm_rq[8:0]})
);

pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc7     (
	.din	({sctag7_pcx_stall_pq_d1 , spc7_pcx_req_pq_r_0[8:0],spc7_pcx_atm_pq_r_0[8:0]}),
	.dout	({sctag7_pcx_stall_rq_d1,   spc7_pcx_req_rq[8:0],spc7_pcx_atm_rq[8:0]})
);


/*
 ccx_arb  AUTO_TEMPLATE(
 // Outputs
 .arb_grant_a		(arb@_grant_r_a[8:0]),
 .arb_q0_holdbar_a		(arb@_q0_holdbar_r_a[8:0]),
 .arb_qsel0_a		(arb@_qsel0_r_a[8:0]),
 .arb_qsel1_a		(arb@_qsel1_r_a[8:0]),
 .arb_shift_a		(arb@_shift_r_a[8:0]),
 .arb_src0_grant_a		(pcx_spc0_grant_a_unused[@]),
 .arb_src1_grant_a		(pcx_spc1_grant_a_unused[@]),
 .arb_src2_grant_a		(pcx_spc2_grant_a_unused[@]),
 .arb_src3_grant_a		(pcx_spc3_grant_a_unused[@]),
 .arb_src4_grant_a		(pcx_spc4_grant_a_unused[@]),
 .arb_src5_grant_a		(pcx_spc5_grant_a_unused[@]),
 .arb_src6_grant_a		(pcx_spc6_grant_a_unused[@]),
 .arb_src7_grant_a		(pcx_spc7_grant_a_unused[@]),
 .arb_src8_grant_a		(arb@_src8_grant_r_unused),
 .ccx_dest_data_rdy_a	(pcx_sctag@_data_rdy_a_unused),
 .ccx_dest_atom_x	(pcx_sctag@_atm_px1_unused),
 // Inputs
 .src0_arb_atom_q		(spc0_pcx_atm_rq[@]),
 .src0_arb_req_q		(spc0_pcx_req_rq[@]),
 .src1_arb_atom_q		(spc1_pcx_atm_rq[@]),
 .src1_arb_req_q		(spc1_pcx_req_rq[@]),
 .src2_arb_atom_q		(spc2_pcx_atm_rq[@]),
 .src2_arb_req_q		(spc2_pcx_req_rq[@]),
 .src3_arb_atom_q		(spc3_pcx_atm_rq[@]),
 .src3_arb_req_q		(spc3_pcx_req_rq[@]),
 .src4_arb_atom_q		(spc4_pcx_atm_rq[@]),
 .src4_arb_req_q		(spc4_pcx_req_rq[@]),
 .src5_arb_atom_q		(spc5_pcx_atm_rq[@]),
 .src5_arb_req_q		(spc5_pcx_req_rq[@]),
 .src6_arb_atom_q		(spc6_pcx_atm_rq[@]),
 .src6_arb_req_q		(spc6_pcx_req_rq[@]),
 .src7_arb_atom_q		(spc7_pcx_atm_rq[@]),
 .src7_arb_req_q		(spc7_pcx_req_rq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(1'b0),
 .stall_q_d1			(sctag@_pcx_stall_rq_d1),
);
 */

ccx_arb pcx_arbr0 (
                  // Outputs
                  .arb_grant_a          (arb0_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb0_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb0_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb0_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb0_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (pcx_spc0_grant_a_unused[0]),   // Templated
                  .arb_src1_grant_a     (pcx_spc1_grant_a_unused[0]),   // Templated
                  .arb_src2_grant_a     (pcx_spc2_grant_a_unused[0]),   // Templated
                  .arb_src3_grant_a     (pcx_spc3_grant_a_unused[0]),   // Templated
                  .arb_src4_grant_a     (pcx_spc4_grant_a[0]),   // Templated
                  .arb_src5_grant_a     (pcx_spc5_grant_a[0]),   // Templated
                  .arb_src6_grant_a     (pcx_spc6_grant_a[0]),   // Templated
                  .arb_src7_grant_a     (pcx_spc7_grant_a[0]),   // Templated
                  .arb_src8_grant_a     (arb0_src8_grant_r_unused), // Templated
                  .ccx_dest_atom_a      (pcx_sctag0_atm_a_unused),    // Templated
                  .ccx_dest_data_rdy_a  (pcx_sctag0_data_rdy_a_unused), // Templated
                  // Inputs
                  .src0_arb_atom_q      (spc0_pcx_atm_rq[0]),    // Templated
                  .src0_arb_req_q       (spc0_pcx_req_rq[0]),    // Templated
                  .src1_arb_atom_q      (spc1_pcx_atm_rq[0]),    // Templated
                  .src1_arb_req_q       (spc1_pcx_req_rq[0]),    // Templated
                  .src2_arb_atom_q      (spc2_pcx_atm_rq[0]),    // Templated
                  .src2_arb_req_q       (spc2_pcx_req_rq[0]),    // Templated
                  .src3_arb_atom_q      (spc3_pcx_atm_rq[0]),    // Templated
                  .src3_arb_req_q       (spc3_pcx_req_rq[0]),    // Templated
                  .src4_arb_atom_q      (spc4_pcx_atm_rq[0]),    // Templated
                  .src4_arb_req_q       (spc4_pcx_req_rq[0]),    // Templated
                  .src5_arb_atom_q      (spc5_pcx_atm_rq[0]),    // Templated
                  .src5_arb_req_q       (spc5_pcx_req_rq[0]),    // Templated
                  .src6_arb_atom_q      (spc6_pcx_atm_rq[0]),    // Templated
                  .src6_arb_req_q       (spc6_pcx_req_rq[0]),    // Templated
                  .src7_arb_atom_q      (spc7_pcx_atm_rq[0]),    // Templated
                  .src7_arb_req_q       (spc7_pcx_req_rq[0]),    // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (1'b0),                  // Templated
                  .stall_q_d1              (sctag0_pcx_stall_rq_d1),   // Templated
                  .scan_in(pcx_arbr0_scanin),
                  .scan_out(pcx_arbr0_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb pcx_arbr1(
                 // Outputs
                 .arb_grant_a           (arb1_grant_r_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb1_q0_holdbar_r_a[8:0]), // Templated
                 .arb_qsel0_a           (arb1_qsel0_r_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb1_qsel1_r_a[8:0]),     // Templated
                 .arb_shift_a           (arb1_shift_r_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a_unused[1]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a_unused[1]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a_unused[1]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a_unused[1]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a[1]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a[1]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a[1]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a[1]),   // Templated
                 .arb_src8_grant_a      (arb1_src8_grant_r_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag1_atm_a_unused),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag1_data_rdy_a_unused), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_rq[1]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_rq[1]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_rq[1]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_rq[1]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_rq[1]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_rq[1]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_rq[1]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_rq[1]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_rq[1]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_rq[1]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_rq[1]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_rq[1]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_rq[1]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_rq[1]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_rq[1]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_rq[1]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag1_pcx_stall_rq_d1),   // Templated
                 .scan_in(pcx_arbr1_scanin),
                 .scan_out(pcx_arbr1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb pcx_arbr2(
                 // Outputs
                 .arb_grant_a           (arb2_grant_r_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb2_q0_holdbar_r_a[8:0]), // Templated
                 .arb_qsel0_a           (arb2_qsel0_r_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb2_qsel1_r_a[8:0]),     // Templated
                 .arb_shift_a           (arb2_shift_r_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a_unused[2]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a_unused[2]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a_unused[2]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a_unused[2]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a[2]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a[2]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a[2]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a[2]),   // Templated
                 .arb_src8_grant_a      (arb2_src8_grant_r_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag2_atm_a_unused),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag2_data_rdy_a_unused), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_rq[2]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_rq[2]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_rq[2]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_rq[2]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_rq[2]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_rq[2]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_rq[2]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_rq[2]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_rq[2]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_rq[2]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_rq[2]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_rq[2]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_rq[2]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_rq[2]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_rq[2]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_rq[2]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag2_pcx_stall_rq_d1),   // Templated
                 .scan_in(pcx_arbr2_scanin),
                 .scan_out(pcx_arbr2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb pcx_arbr3(
                 // Outputs
                 .arb_grant_a           (arb3_grant_r_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb3_q0_holdbar_r_a[8:0]), // Templated
                 .arb_qsel0_a           (arb3_qsel0_r_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb3_qsel1_r_a[8:0]),     // Templated
                 .arb_shift_a           (arb3_shift_r_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a_unused[3]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a_unused[3]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a_unused[3]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a_unused[3]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a[3]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a[3]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a[3]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a[3]),   // Templated
                 .arb_src8_grant_a      (arb3_src8_grant_r_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag3_atm_a_unused),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag3_data_rdy_a_unused), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_rq[3]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_rq[3]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_rq[3]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_rq[3]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_rq[3]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_rq[3]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_rq[3]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_rq[3]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_rq[3]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_rq[3]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_rq[3]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_rq[3]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_rq[3]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_rq[3]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_rq[3]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_rq[3]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag3_pcx_stall_rq_d1),   // Templated
                 .scan_in(pcx_arbr3_scanin),
                 .scan_out(pcx_arbr3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb pcx_arbr4(
                 // Outputs
                 .arb_grant_a           (arb4_grant_r_a[8:0]),     // Templated
                 .arb_q0_holdbar_a      (arb4_q0_holdbar_r_a[8:0]), // Templated
                 .arb_qsel0_a           (arb4_qsel0_r_a[8:0]),     // Templated
                 .arb_qsel1_a           (arb4_qsel1_r_a[8:0]),     // Templated
                 .arb_shift_a           (arb4_shift_r_a[8:0]),     // Templated
                 .arb_src0_grant_a      (pcx_spc0_grant_a_unused[4]),   // Templated
                 .arb_src1_grant_a      (pcx_spc1_grant_a_unused[4]),   // Templated
                 .arb_src2_grant_a      (pcx_spc2_grant_a_unused[4]),   // Templated
                 .arb_src3_grant_a      (pcx_spc3_grant_a_unused[4]),   // Templated
                 .arb_src4_grant_a      (pcx_spc4_grant_a[4]),   // Templated
                 .arb_src5_grant_a      (pcx_spc5_grant_a[4]),   // Templated
                 .arb_src6_grant_a      (pcx_spc6_grant_a[4]),   // Templated
                 .arb_src7_grant_a      (pcx_spc7_grant_a[4]),   // Templated
                 .arb_src8_grant_a      (arb4_src8_grant_r_unused), // Templated
                 .ccx_dest_atom_a       (pcx_sctag4_atm_a),    // Templated
                 .ccx_dest_data_rdy_a   (pcx_sctag4_data_rdy_a), // Templated
                 // Inputs
                 .src0_arb_atom_q       (spc0_pcx_atm_rq[4]),    // Templated
                 .src0_arb_req_q        (spc0_pcx_req_rq[4]),    // Templated
                 .src1_arb_atom_q       (spc1_pcx_atm_rq[4]),    // Templated
                 .src1_arb_req_q        (spc1_pcx_req_rq[4]),    // Templated
                 .src2_arb_atom_q       (spc2_pcx_atm_rq[4]),    // Templated
                 .src2_arb_req_q        (spc2_pcx_req_rq[4]),    // Templated
                 .src3_arb_atom_q       (spc3_pcx_atm_rq[4]),    // Templated
                 .src3_arb_req_q        (spc3_pcx_req_rq[4]),    // Templated
                 .src4_arb_atom_q       (spc4_pcx_atm_rq[4]),    // Templated
                 .src4_arb_req_q        (spc4_pcx_req_rq[4]),    // Templated
                 .src5_arb_atom_q       (spc5_pcx_atm_rq[4]),    // Templated
                 .src5_arb_req_q        (spc5_pcx_req_rq[4]),    // Templated
                 .src6_arb_atom_q       (spc6_pcx_atm_rq[4]),    // Templated
                 .src6_arb_req_q        (spc6_pcx_req_rq[4]),    // Templated
                 .src7_arb_atom_q       (spc7_pcx_atm_rq[4]),    // Templated
                 .src7_arb_req_q        (spc7_pcx_req_rq[4]),    // Templated
                 .src8_arb_atom_q       (1'b0),                  // Templated
                 .src8_arb_req_q        (1'b0),                  // Templated
                 .stall_q_d1               (sctag4_pcx_stall_rq_d1),   // Templated
                 .scan_in(pcx_arbr4_scanin),
                 .scan_out(pcx_arbr4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb pcx_arbr5  (
                   // Outputs
                   .arb_grant_a         (arb5_grant_r_a[8:0]),     // Templated
                   .arb_q0_holdbar_a    (arb5_q0_holdbar_r_a[8:0]), // Templated
                   .arb_qsel0_a         (arb5_qsel0_r_a[8:0]),     // Templated
                   .arb_qsel1_a         (arb5_qsel1_r_a[8:0]),     // Templated
                   .arb_shift_a         (arb5_shift_r_a[8:0]),     // Templated
                   .arb_src0_grant_a    (pcx_spc0_grant_a_unused[5]),   // Templated
                   .arb_src1_grant_a    (pcx_spc1_grant_a_unused[5]),   // Templated
                   .arb_src2_grant_a    (pcx_spc2_grant_a_unused[5]),   // Templated
                   .arb_src3_grant_a    (pcx_spc3_grant_a_unused[5]),   // Templated
                   .arb_src4_grant_a    (pcx_spc4_grant_a[5]),   // Templated
                   .arb_src5_grant_a    (pcx_spc5_grant_a[5]),   // Templated
                   .arb_src6_grant_a    (pcx_spc6_grant_a[5]),   // Templated
                   .arb_src7_grant_a    (pcx_spc7_grant_a[5]),   // Templated
                   .arb_src8_grant_a    (arb5_src8_grant_r_unused), // Templated
                   .ccx_dest_atom_a     (pcx_sctag5_atm_a),    // Templated
                   .ccx_dest_data_rdy_a (pcx_sctag5_data_rdy_a), // Templated
                   // Inputs
                   .src0_arb_atom_q     (spc0_pcx_atm_rq[5]),    // Templated
                   .src0_arb_req_q      (spc0_pcx_req_rq[5]),    // Templated
                   .src1_arb_atom_q     (spc1_pcx_atm_rq[5]),    // Templated
                   .src1_arb_req_q      (spc1_pcx_req_rq[5]),    // Templated
                   .src2_arb_atom_q     (spc2_pcx_atm_rq[5]),    // Templated
                   .src2_arb_req_q      (spc2_pcx_req_rq[5]),    // Templated
                   .src3_arb_atom_q     (spc3_pcx_atm_rq[5]),    // Templated
                   .src3_arb_req_q      (spc3_pcx_req_rq[5]),    // Templated
                   .src4_arb_atom_q     (spc4_pcx_atm_rq[5]),    // Templated
                   .src4_arb_req_q      (spc4_pcx_req_rq[5]),    // Templated
                   .src5_arb_atom_q     (spc5_pcx_atm_rq[5]),    // Templated
                   .src5_arb_req_q      (spc5_pcx_req_rq[5]),    // Templated
                   .src6_arb_atom_q     (spc6_pcx_atm_rq[5]),    // Templated
                   .src6_arb_req_q      (spc6_pcx_req_rq[5]),    // Templated
                   .src7_arb_atom_q     (spc7_pcx_atm_rq[5]),    // Templated
                   .src7_arb_req_q      (spc7_pcx_req_rq[5]),    // Templated
                   .src8_arb_atom_q     (1'b0),                  // Templated
                   .src8_arb_req_q      (1'b0),                  // Templated
                   .stall_q_d1             (sctag5_pcx_stall_rq_d1),   // Templated
                   .scan_in(pcx_arbr5_scanin),
                   .scan_out(pcx_arbr5_scanout),
                   .l2clk               (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb pcx_arbr6  (
                   // Outputs
                   .arb_grant_a         (arb6_grant_r_a[8:0]),     // Templated
                   .arb_q0_holdbar_a    (arb6_q0_holdbar_r_a[8:0]), // Templated
                   .arb_qsel0_a         (arb6_qsel0_r_a[8:0]),     // Templated
                   .arb_qsel1_a         (arb6_qsel1_r_a[8:0]),     // Templated
                   .arb_shift_a         (arb6_shift_r_a[8:0]),     // Templated
                   .arb_src0_grant_a    (pcx_spc0_grant_a_unused[6]),   // Templated
                   .arb_src1_grant_a    (pcx_spc1_grant_a_unused[6]),   // Templated
                   .arb_src2_grant_a    (pcx_spc2_grant_a_unused[6]),   // Templated
                   .arb_src3_grant_a    (pcx_spc3_grant_a_unused[6]),   // Templated
                   .arb_src4_grant_a    (pcx_spc4_grant_a[6]),   // Templated
                   .arb_src5_grant_a    (pcx_spc5_grant_a[6]),   // Templated
                   .arb_src6_grant_a    (pcx_spc6_grant_a[6]),   // Templated
                   .arb_src7_grant_a    (pcx_spc7_grant_a[6]),   // Templated
                   .arb_src8_grant_a    (arb6_src8_grant_r_unused), // Templated
                   .ccx_dest_atom_a     (pcx_sctag6_atm_a),    // Templated
                   .ccx_dest_data_rdy_a (pcx_sctag6_data_rdy_a), // Templated
                   // Inputs
                   .src0_arb_atom_q     (spc0_pcx_atm_rq[6]),    // Templated
                   .src0_arb_req_q      (spc0_pcx_req_rq[6]),    // Templated
                   .src1_arb_atom_q     (spc1_pcx_atm_rq[6]),    // Templated
                   .src1_arb_req_q      (spc1_pcx_req_rq[6]),    // Templated
                   .src2_arb_atom_q     (spc2_pcx_atm_rq[6]),    // Templated
                   .src2_arb_req_q      (spc2_pcx_req_rq[6]),    // Templated
                   .src3_arb_atom_q     (spc3_pcx_atm_rq[6]),    // Templated
                   .src3_arb_req_q      (spc3_pcx_req_rq[6]),    // Templated
                   .src4_arb_atom_q     (spc4_pcx_atm_rq[6]),    // Templated
                   .src4_arb_req_q      (spc4_pcx_req_rq[6]),    // Templated
                   .src5_arb_atom_q     (spc5_pcx_atm_rq[6]),    // Templated
                   .src5_arb_req_q      (spc5_pcx_req_rq[6]),    // Templated
                   .src6_arb_atom_q     (spc6_pcx_atm_rq[6]),    // Templated
                   .src6_arb_req_q      (spc6_pcx_req_rq[6]),    // Templated
                   .src7_arb_atom_q     (spc7_pcx_atm_rq[6]),    // Templated
                   .src7_arb_req_q      (spc7_pcx_req_rq[6]),    // Templated
                   .src8_arb_atom_q     (1'b0),                  // Templated
                   .src8_arb_req_q      (1'b0),                  // Templated
                   .stall_q_d1             (sctag6_pcx_stall_rq_d1),   // Templated
                   .scan_in(pcx_arbr6_scanin),
                   .scan_out(pcx_arbr6_scanout),
                   .l2clk               (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb pcx_arbr7 (
                  // Outputs
                  .arb_grant_a          (arb7_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb7_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb7_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb7_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb7_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (pcx_spc0_grant_a_unused[7]),   // Templated
                  .arb_src1_grant_a     (pcx_spc1_grant_a_unused[7]),   // Templated
                  .arb_src2_grant_a     (pcx_spc2_grant_a_unused[7]),   // Templated
                  .arb_src3_grant_a     (pcx_spc3_grant_a_unused[7]),   // Templated
                  .arb_src4_grant_a     (pcx_spc4_grant_a[7]),   // Templated
                  .arb_src5_grant_a     (pcx_spc5_grant_a[7]),   // Templated
                  .arb_src6_grant_a     (pcx_spc6_grant_a[7]),   // Templated
                  .arb_src7_grant_a     (pcx_spc7_grant_a[7]),   // Templated
                  .arb_src8_grant_a     (arb7_src8_grant_r_unused), // Templated
                  .ccx_dest_atom_a      (pcx_sctag7_atm_a),    // Templated
                  .ccx_dest_data_rdy_a  (pcx_sctag7_data_rdy_a), // Templated
                  // Inputs
                  .src0_arb_atom_q      (spc0_pcx_atm_rq[7]),    // Templated
                  .src0_arb_req_q       (spc0_pcx_req_rq[7]),    // Templated
                  .src1_arb_atom_q      (spc1_pcx_atm_rq[7]),    // Templated
                  .src1_arb_req_q       (spc1_pcx_req_rq[7]),    // Templated
                  .src2_arb_atom_q      (spc2_pcx_atm_rq[7]),    // Templated
                  .src2_arb_req_q       (spc2_pcx_req_rq[7]),    // Templated
                  .src3_arb_atom_q      (spc3_pcx_atm_rq[7]),    // Templated
                  .src3_arb_req_q       (spc3_pcx_req_rq[7]),    // Templated
                  .src4_arb_atom_q      (spc4_pcx_atm_rq[7]),    // Templated
                  .src4_arb_req_q       (spc4_pcx_req_rq[7]),    // Templated
                  .src5_arb_atom_q      (spc5_pcx_atm_rq[7]),    // Templated
                  .src5_arb_req_q       (spc5_pcx_req_rq[7]),    // Templated
                  .src6_arb_atom_q      (spc6_pcx_atm_rq[7]),    // Templated
                  .src6_arb_req_q       (spc6_pcx_req_rq[7]),    // Templated
                  .src7_arb_atom_q      (spc7_pcx_atm_rq[7]),    // Templated
                  .src7_arb_req_q       (spc7_pcx_req_rq[7]),    // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (1'b0),                  // Templated
                  .stall_q_d1              (sctag7_pcx_stall_rq_d1),   // Templated
                  .scan_in(pcx_arbr7_scanin),
                  .scan_out(pcx_arbr7_scanout),
                  .l2clk                (l2clk),
                   .tcu_scan_en             (tcu_scan_en_arb_rb),
                   .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                   .ccx_aclk                (ccx_aclk_arb_rb),
                   .ccx_bclk                (ccx_bclk_arb_rb)
                   );

/*
 ccx_arb  AUTO_TEMPLATE(
 // Outputs
 .arb_grant_a		(arb@_grant_r_a[8:0]),
 .arb_q0_holdbar_a		(arb@_q0_holdbar_r_a[8:0]),
 .arb_qsel0_a		(arb@_qsel0_r_a[8:0]),
 .arb_qsel1_a		(arb@_qsel1_r_a[8:0]),
 .arb_shift_a		(arb@_shift_r_a[8:0]),
 .arb_src0_grant_a		(pcx_spc0_grant_a_unused[@]),
 .arb_src1_grant_a		(pcx_spc1_grant_a_unused[@]),
 .arb_src2_grant_a		(pcx_spc2_grant_a_unused[@]),
 .arb_src3_grant_a		(pcx_spc3_grant_a_unused[@]),
 .arb_src4_grant_a		(pcx_spc4_grant_a_unused[@]),
 .arb_src5_grant_a		(pcx_spc5_grant_a_unused[@]),
 .arb_src6_grant_a		(pcx_spc6_grant_a_unused[@]),
 .arb_src7_grant_a		(pcx_spc7_grant_a_unused[@]),
 .arb_src8_grant_a		(arb8_src8_grant_r_unused),
 .ccx_dest_data_rdy_a	(pcx_fpio_data_rdy_unused_px1),
 .ccx_dest_atom_x	(arb8_dest_atom_r_unused),
 // Inputs
 .src0_arb_atom_q		(spc0_pcx_atm_rq[@]),
 .src0_arb_req_q		(spc0_pcx_req_rq[@]),
 .src1_arb_atom_q		(spc1_pcx_atm_rq[@]),
 .src1_arb_req_q		(spc1_pcx_req_rq[@]),
 .src2_arb_atom_q		(spc2_pcx_atm_rq[@]),
 .src2_arb_req_q		(spc2_pcx_req_rq[@]),
 .src3_arb_atom_q		(spc3_pcx_atm_rq[@]),
 .src3_arb_req_q		(spc3_pcx_req_rq[@]),
 .src4_arb_atom_q		(spc4_pcx_atm_rq[@]),
 .src4_arb_req_q		(spc4_pcx_req_rq[@]),
 .src5_arb_atom_q		(spc5_pcx_atm_rq[@]),
 .src5_arb_req_q		(spc5_pcx_req_rq[@]),
 .src6_arb_atom_q		(spc6_pcx_atm_rq[@]),
 .src6_arb_req_q		(spc6_pcx_req_rq[@]),
 .src7_arb_atom_q		(spc7_pcx_atm_rq[@]),
 .src7_arb_req_q		(spc7_pcx_req_rq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(1'b0),
 .stall_q_d1			(io_pcx_stall_rq_d1),
);
 */
//
ccx_arb pcx_arbr8 (
                  // Outputs
                   .arb_grant_a          (arb8_grant_r_a[8:0]),     // Templated
                   .arb_q0_holdbar_a     (arb8_q0_holdbar_r_a[8:0]), // Templated
                   .arb_qsel0_a          (arb8_qsel0_r_a[8:0]),     // Templated
                   .arb_qsel1_a          (arb8_qsel1_r_a[8:0]),     // Templated
                   .arb_shift_a          (arb8_shift_r_a[8:0]),     // Templated
                   .arb_src0_grant_a     (pcx_spc0_grant_a_unused[8]),   // Templated
                   .arb_src1_grant_a     (pcx_spc1_grant_a_unused[8]),   // Templated
                   .arb_src2_grant_a     (pcx_spc2_grant_a_unused[8]),   // Templated
                   .arb_src3_grant_a     (pcx_spc3_grant_a_unused[8]),   // Templated
                   .arb_src4_grant_a     (pcx_spc4_grant_a[8]),   // Templated
                   .arb_src5_grant_a     (pcx_spc5_grant_a[8]),   // Templated
                   .arb_src6_grant_a     (pcx_spc6_grant_a[8]),   // Templated
                   .arb_src7_grant_a     (pcx_spc7_grant_a[8]),   // Templated
                   .arb_src8_grant_a     (arb8_src8_grant_r_unused), // Templated
                   .ccx_dest_atom_a      (arb8_dest_atom_r_unused), // Templated
                   .ccx_dest_data_rdy_a  (pcx_fpio_data_rdy_a_unused), // Templated
                   // Inputs
                   .src0_arb_atom_q      (spc0_pcx_atm_rq[8]),    // Templated
                   .src0_arb_req_q       (spc0_pcx_req_rq[8]),    // Templated
                   .src1_arb_atom_q      (spc1_pcx_atm_rq[8]),    // Templated
                   .src1_arb_req_q       (spc1_pcx_req_rq[8]),    // Templated
                   .src2_arb_atom_q      (spc2_pcx_atm_rq[8]),    // Templated
                   .src2_arb_req_q       (spc2_pcx_req_rq[8]),    // Templated
                   .src3_arb_atom_q      (spc3_pcx_atm_rq[8]),    // Templated
                   .src3_arb_req_q       (spc3_pcx_req_rq[8]),    // Templated
                   .src4_arb_atom_q      (spc4_pcx_atm_rq[8]),    // Templated
                   .src4_arb_req_q       (spc4_pcx_req_rq[8]),    // Templated
                   .src5_arb_atom_q      (spc5_pcx_atm_rq[8]),    // Templated
                   .src5_arb_req_q       (spc5_pcx_req_rq[8]),    // Templated
                   .src6_arb_atom_q      (spc6_pcx_atm_rq[8]),    // Templated
                   .src6_arb_req_q       (spc6_pcx_req_rq[8]),    // Templated
                   .src7_arb_atom_q      (spc7_pcx_atm_rq[8]),    // Templated
                   .src7_arb_req_q       (spc7_pcx_req_rq[8]),    // Templated
                   .src8_arb_atom_q      (1'b0),                  // Templated
                   .src8_arb_req_q       (1'b0),                  // Templated
                   .stall_q_d1              (io_pcx_stall_rq_d1),       // Templated
                   .scan_in(pcx_arbr8_scanin),
                   .scan_out(pcx_arbr8_scanout),
                   .l2clk                (l2clk),
                   .tcu_scan_en             (tcu_scan_en_arb_rt),
                   .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                   .ccx_aclk                (ccx_aclk_arb_rt),
                   .ccx_bclk                (ccx_bclk_arb_rt)
                   );



// fixscan start:
assign bfd4_scanin               = scan_in                  ;
assign bfd5_scanin               = bfd4_scanout             ;
assign bfg4_scanin               = bfd5_scanout             ;
assign bfg1_scanin               = bfg4_scanout             ;
assign bfd1_scanin               = bfg1_scanout             ;
assign bfd0_scanin               = bfd1_scanout             ;
assign bfd_io_scanin             = bfd0_scanout             ;
assign bfg8_scanin               = bfd_io_scanout           ;
assign bfg0_scanin               = bfg8_scanout           ;
assign pcx_arbl0_scanin          = bfg0_scanout             ;
assign pcx_arbl4_scanin          = pcx_arbl0_scanout        ;
assign pcx_arbl8_scanin          = pcx_arbl4_scanout        ;
assign pcx_arbl3_scanin          = pcx_arbl8_scanout        ;
assign pcx_arbl5_scanin          = pcx_arbl3_scanout        ;
assign pcx_arbl1_scanin          = pcx_arbl5_scanout        ;
assign pcx_arbl7_scanin          = pcx_arbl1_scanout        ;
assign pcx_arbl2_scanin          = pcx_arbl7_scanout        ;
assign pcx_arbl6_scanin          = pcx_arbl2_scanout        ;
assign bfg2_scanin               = pcx_arbl6_scanout        ;
assign bfd2_scanin               = bfg2_scanout             ;
assign bfd3_scanin               = bfd2_scanout             ;
assign bfg3_scanin               = bfd3_scanout             ;
assign bfg7_scanin               = bfg3_scanout             ;
assign bfd7_scanin               = bfg7_scanout             ;
assign bfd6_scanin               = bfd7_scanout             ;
assign bfg6_scanin               = bfd6_scanout             ;
assign pcx_arbr6_scanin          = bfg6_scanout             ;
assign pcx_arbr2_scanin          = pcx_arbr6_scanout        ;
assign pcx_arbr7_scanin          = pcx_arbr2_scanout        ;
assign pcx_arbr1_scanin          = pcx_arbr7_scanout        ;
assign pcx_arbr5_scanin          = pcx_arbr1_scanout        ;
assign pcx_arbr3_scanin          = pcx_arbr5_scanout        ;
assign pcx_arbr8_scanin          = pcx_arbr3_scanout        ;
assign pcx_arbr4_scanin          = pcx_arbr8_scanout        ;
assign pcx_arbr0_scanin          = pcx_arbr4_scanout        ;
assign bfg5_scanin               = pcx_arbr0_scanout        ;
assign pcx_dpa_scanin            = bfg5_scanout             ;
assign scan_out                  = pcx_dpa_scanout          ;

// fixscan end:
endmodule


//
//   buff macro
//
//





module pcx_buff_macro__dbuff_40x__rep_1__stack_130c__width_130 (
  din, 
  dout);
  input [129:0] din;
  output [129:0] dout;






buff #(130)  d0_0 (
.in(din[129:0]),
.out(dout[129:0])
);








endmodule


//
//   buff macro
//
//





module pcx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 (
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





module pcx_buff_macro__dbuff_48x__rep_1__stack_none__width_18 (
  din, 
  dout);
  input [17:0] din;
  output [17:0] dout;






buff #(18)  d0_0 (
.in(din[17:0]),
.out(dout[17:0])
);








endmodule



//
//   buff macro
//
//





module pcx_buff_macro__dbuff_32x__rep_1__stack_150c__width_130 (
  din, 
  dout);
  input [129:0] din;
  output [129:0] dout;






buff #(130)  d0_0 (
.in(din[129:0]),
.out(dout[129:0])
);








endmodule



//
//   buff macro
//
//





module pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_19 (
  din, 
  dout);
  input [18:0] din;
  output [18:0] dout;






buff #(19)  d0_0 (
.in(din[18:0]),
.out(dout[18:0])
);








endmodule




//
//   buff macro
//
//





module pcx_buff_macro__dbuff_48x__rep_1__stack_20r__width_20 (
  din, 
  dout);
  input [19:0] din;
  output [19:0] dout;






buff #(20)  d0_0 (
.in(din[19:0]),
.out(dout[19:0])
);








endmodule





//
//   buff macro
//
//





module pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 (
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





module pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule




//
//   buff macro
//
//





module pcx_buff_macro__dbuff_32x__rep_1__stack_none__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule

`endif // `ifndef FPGA

`ifdef FPGA
`timescale 1 ns / 100 ps
module pcx(pcx_fpio_data_px2, pcx_fpio_data_rdy_px1, pcx_sctag0_atm_px1, 
	pcx_sctag0_data_px2, pcx_sctag0_data_rdy_px1, pcx_sctag1_atm_px1, 
	pcx_sctag1_data_px2, pcx_sctag1_data_rdy_px1, pcx_sctag2_atm_px1, 
	pcx_sctag2_data_px2, pcx_sctag2_data_rdy_px1, pcx_sctag3_atm_px1, 
	pcx_sctag3_data_px2, pcx_sctag3_data_rdy_px1, pcx_sctag4_atm_px1, 
	pcx_sctag4_data_px2, pcx_sctag4_data_rdy_px1, pcx_sctag5_atm_px1, 
	pcx_sctag5_data_px2, pcx_sctag5_data_rdy_px1, pcx_sctag6_atm_px1, 
	pcx_sctag6_data_px2, pcx_sctag6_data_rdy_px1, pcx_sctag7_atm_px1, 
	pcx_sctag7_data_px2, pcx_sctag7_data_rdy_px1, pcx_spc0_grant_px, 
	pcx_spc1_grant_px, pcx_spc2_grant_px, pcx_spc3_grant_px, 
	pcx_spc4_grant_px, pcx_spc5_grant_px, pcx_spc6_grant_px, 
	pcx_spc7_grant_px, io_pcx_stall_pq, sctag0_pcx_stall_pq, 
	sctag1_pcx_stall_pq, sctag2_pcx_stall_pq, sctag3_pcx_stall_pq, 
	sctag4_pcx_stall_pq, sctag5_pcx_stall_pq, sctag6_pcx_stall_pq, 
	sctag7_pcx_stall_pq, spc0_pcx_data_pa, spc0_pcx_req_pq, spc0_pcx_atm_pq,
	spc1_pcx_data_pa, spc1_pcx_req_pq, spc1_pcx_atm_pq, spc2_pcx_data_pa, 
	spc2_pcx_req_pq, spc2_pcx_atm_pq, spc3_pcx_data_pa, spc3_pcx_req_pq, 
	spc3_pcx_atm_pq, spc4_pcx_data_pa, spc4_pcx_req_pq, spc4_pcx_atm_pq, 
	spc5_pcx_data_pa, spc5_pcx_req_pq, spc5_pcx_atm_pq, spc6_pcx_data_pa, 
	spc6_pcx_req_pq, spc6_pcx_atm_pq, spc7_pcx_data_pa, spc7_pcx_req_pq, 
	spc7_pcx_atm_pq, tcu_scan_en, l2clk, scan_in, tcu_pce_ov, ccx_aclk, 
	ccx_bclk, scan_out);

	output	[129:0]		pcx_fpio_data_px2;
	output			pcx_fpio_data_rdy_px1;
	output			pcx_sctag0_atm_px1;
	output	[129:0]		pcx_sctag0_data_px2;
	output			pcx_sctag0_data_rdy_px1;
	output			pcx_sctag1_atm_px1;
	output	[129:0]		pcx_sctag1_data_px2;
	output			pcx_sctag1_data_rdy_px1;
	output			pcx_sctag2_atm_px1;
	output	[129:0]		pcx_sctag2_data_px2;
	output			pcx_sctag2_data_rdy_px1;
	output			pcx_sctag3_atm_px1;
	output	[129:0]		pcx_sctag3_data_px2;
	output			pcx_sctag3_data_rdy_px1;
	output			pcx_sctag4_atm_px1;
	output	[129:0]		pcx_sctag4_data_px2;
	output			pcx_sctag4_data_rdy_px1;
	output			pcx_sctag5_atm_px1;
	output	[129:0]		pcx_sctag5_data_px2;
	output			pcx_sctag5_data_rdy_px1;
	output			pcx_sctag6_atm_px1;
	output	[129:0]		pcx_sctag6_data_px2;
	output			pcx_sctag6_data_rdy_px1;
	output			pcx_sctag7_atm_px1;
	output	[129:0]		pcx_sctag7_data_px2;
	output			pcx_sctag7_data_rdy_px1;
	output	[8:0]		pcx_spc0_grant_px;
	output	[8:0]		pcx_spc1_grant_px;
	output	[8:0]		pcx_spc2_grant_px;
	output	[8:0]		pcx_spc3_grant_px;
	output	[8:0]		pcx_spc4_grant_px;
	output	[8:0]		pcx_spc5_grant_px;
	output	[8:0]		pcx_spc6_grant_px;
	output	[8:0]		pcx_spc7_grant_px;
	input			io_pcx_stall_pq;
	input			sctag0_pcx_stall_pq;
	input			sctag1_pcx_stall_pq;
	input			sctag2_pcx_stall_pq;
	input			sctag3_pcx_stall_pq;
	input			sctag4_pcx_stall_pq;
	input			sctag5_pcx_stall_pq;
	input			sctag6_pcx_stall_pq;
	input			sctag7_pcx_stall_pq;
	input	[129:0]		spc0_pcx_data_pa;
	input	[8:0]		spc0_pcx_req_pq;
	input	[8:0]		spc0_pcx_atm_pq;
	input	[129:0]		spc1_pcx_data_pa;
	input	[8:0]		spc1_pcx_req_pq;
	input	[8:0]		spc1_pcx_atm_pq;
	input	[129:0]		spc2_pcx_data_pa;
	input	[8:0]		spc2_pcx_req_pq;
	input	[8:0]		spc2_pcx_atm_pq;
	input	[129:0]		spc3_pcx_data_pa;
	input	[8:0]		spc3_pcx_req_pq;
	input	[8:0]		spc3_pcx_atm_pq;
	input	[129:0]		spc4_pcx_data_pa;
	input	[8:0]		spc4_pcx_req_pq;
	input	[8:0]		spc4_pcx_atm_pq;
	input	[129:0]		spc5_pcx_data_pa;
	input	[8:0]		spc5_pcx_req_pq;
	input	[8:0]		spc5_pcx_atm_pq;
	input	[129:0]		spc6_pcx_data_pa;
	input	[8:0]		spc6_pcx_req_pq;
	input	[8:0]		spc6_pcx_atm_pq;
	input	[129:0]		spc7_pcx_data_pa;
	input	[8:0]		spc7_pcx_req_pq;
	input	[8:0]		spc7_pcx_atm_pq;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;

	wire	[129:0]		pcx_fpio_data_px2_0;
	wire			pcx_sctag1_data_rdy_px1_0;
	wire			pcx_sctag1_atm_px1_0;
	wire			pcx_sctag3_data_rdy_px1_0;
	wire			pcx_sctag3_atm_px1_0;
	wire			pcx_sctag5_data_rdy_px1_0;
	wire			pcx_sctag5_atm_px1_0;
	wire			pcx_sctag7_data_rdy_px1_0;
	wire			pcx_sctag7_atm_px1_0;
	wire	[8:0]		pcx_spc0_grant_a;
	wire	[8:0]		pcx_spc0_grant_a_0;
	wire	[8:0]		pcx_spc1_grant_a;
	wire	[8:0]		pcx_spc1_grant_a_0;
	wire	[8:0]		pcx_spc2_grant_a;
	wire	[8:0]		pcx_spc2_grant_a_0;
	wire	[8:0]		pcx_spc3_grant_a;
	wire	[8:0]		pcx_spc3_grant_a_0;
	wire	[8:0]		pcx_spc4_grant_a;
	wire	[8:0]		pcx_spc4_grant_a_0;
	wire	[8:0]		pcx_spc5_grant_a;
	wire	[8:0]		pcx_spc5_grant_a_0;
	wire	[8:0]		pcx_spc6_grant_a;
	wire	[8:0]		pcx_spc6_grant_a_0;
	wire	[8:0]		pcx_spc7_grant_a;
	wire	[8:0]		pcx_spc7_grant_a_0;
	wire			io_pcx_stall_pq_buf;
	wire			fpio_atm1_unused;
	wire			fpio_atm2_unused;
	wire			rdy8_1_unused;
	wire			io_pcx_stall_pq_d1;
	wire	[8:0]		grant8_unused;
	wire			tcu_scan_en_bfg_8_unused;
	wire			tcu_pce_ov_bfg_8_unused;
	wire			ccx_aclk_bfg_8_unused;
	wire			ccx_bclk_bfg_8_unused;
	wire			pcx_fpio_data_rdy_a;
	wire			bfg8_scanin;
	wire			bfg8_scanout;
	wire			tcu_scan_en_bfd_lt;
	wire			tcu_pce_ov_bfd_lt;
	wire			ccx_aclk_bfd_lt;
	wire			ccx_bclk_bfd_lt;
	wire			sctag0_pcx_stall_pq_buf;
	wire			sctag0_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_0_unused;
	wire			tcu_pce_ov_bfg_0_unused;
	wire			ccx_aclk_bfg_0_unused;
	wire			ccx_bclk_bfg_0_unused;
	wire			pcx_sctag0_atm_a;
	wire			pcx_sctag1_atm_a;
	wire			pcx_sctag0_data_rdy_a;
	wire			pcx_sctag1_data_rdy_a;
	wire			bfg0_scanin;
	wire			bfg0_scanout;
	wire			sctag1_pcx_stall_pq_buf;
	wire			atm10_unused;
	wire			atm11_unused;
	wire			rdy10_unused;
	wire			rdy11_unused;
	wire			sctag1_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_1_unused;
	wire			tcu_pce_ov_bfg_1_unused;
	wire			ccx_aclk_bfg_1_unused;
	wire			ccx_bclk_bfg_1_unused;
	wire			bfg1_scanin;
	wire			bfg1_scanout;
	wire			tcu_scan_en_bfd_t;
	wire			tcu_pce_ov_bfd_t;
	wire			ccx_aclk_bfd_t;
	wire			ccx_bclk_bfd_t;
	wire			sctag2_pcx_stall_pq_buf;
	wire			sctag2_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_2_unused;
	wire			tcu_pce_ov_bfg_2_unused;
	wire			ccx_aclk_bfg_2_unused;
	wire			ccx_bclk_bfg_2_unused;
	wire			pcx_sctag2_atm_a;
	wire			pcx_sctag3_atm_a;
	wire			pcx_sctag2_data_rdy_a;
	wire			pcx_sctag3_data_rdy_a;
	wire			bfg2_scanin;
	wire			bfg2_scanout;
	wire			tcu_scan_en_bfd_lb;
	wire			tcu_pce_ov_bfd_lb;
	wire			ccx_aclk_bfd_lb;
	wire			ccx_bclk_bfd_lb;
	wire			sctag3_pcx_stall_pq_buf;
	wire			atm30_unused;
	wire			atm31_unused;
	wire			rdy30_unused;
	wire			rdy31_unused;
	wire			sctag3_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_3_unused;
	wire			tcu_pce_ov_bfg_3_unused;
	wire			ccx_aclk_bfg_3_unused;
	wire			ccx_bclk_bfg_3_unused;
	wire			bfg3_scanin;
	wire			bfg3_scanout;
	wire			tcu_scan_en_bfd_b;
	wire			tcu_pce_ov_bfd_b;
	wire			ccx_aclk_bfd_b;
	wire			ccx_bclk_bfd_b;
	wire			sctag4_pcx_stall_pq_buf;
	wire			sctag4_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_4_unused;
	wire			tcu_pce_ov_bfg_4_unused;
	wire			ccx_aclk_bfg_4_unused;
	wire			ccx_bclk_bfg_4_unused;
	wire			pcx_sctag4_atm_a;
	wire			pcx_sctag5_atm_a;
	wire			pcx_sctag4_data_rdy_a;
	wire			pcx_sctag5_data_rdy_a;
	wire			bfg4_scanin;
	wire			bfg4_scanout;
	wire			tcu_scan_en_bfd_rt;
	wire			tcu_pce_ov_bfd_rt;
	wire			ccx_aclk_bfd_rt;
	wire			ccx_bclk_bfd_rt;
	wire			sctag5_pcx_stall_pq_buf;
	wire			atm50_unused;
	wire			atm51_unused;
	wire			rdy50_unused;
	wire			rdy51_unused;
	wire			sctag5_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_5_unused;
	wire			tcu_pce_ov_bfg_5_unused;
	wire			ccx_aclk_bfg_5_unused;
	wire			ccx_bclk_bfg_5_unused;
	wire			bfg5_scanin;
	wire			bfg5_scanout;
	wire			sctag6_pcx_stall_pq_buf;
	wire			sctag6_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_6_unused;
	wire			tcu_pce_ov_bfg_6_unused;
	wire			ccx_aclk_bfg_6_unused;
	wire			ccx_bclk_bfg_6_unused;
	wire			pcx_sctag6_atm_a;
	wire			pcx_sctag7_atm_a;
	wire			pcx_sctag6_data_rdy_a;
	wire			pcx_sctag7_data_rdy_a;
	wire			bfg6_scanin;
	wire			bfg6_scanout;
	wire			tcu_scan_en_bfd_rb;
	wire			tcu_pce_ov_bfd_rb;
	wire			ccx_aclk_bfd_rb;
	wire			ccx_bclk_bfd_rb;
	wire			sctag7_pcx_stall_pq_buf;
	wire			atm70_unused;
	wire			atm71_unused;
	wire			rdy70_unused;
	wire			rdy71_unused;
	wire			sctag7_pcx_stall_pq_d1;
	wire			tcu_scan_en_bfg_7_unused;
	wire			tcu_pce_ov_bfg_7_unused;
	wire			ccx_aclk_bfg_7_unused;
	wire			ccx_bclk_bfg_7_unused;
	wire			bfg7_scanin;
	wire			bfg7_scanout;
	wire	[8:0]		spc0_pcx_req_pq_l_0;
	wire	[8:0]		spc0_pcx_atm_pq_l_0;
	wire	[8:0]		spc0_pcx_req_pq_r_0;
	wire	[8:0]		spc0_pcx_atm_pq_r_0;
	wire	[8:0]		spc1_pcx_req_pq_l_0;
	wire	[8:0]		spc1_pcx_atm_pq_l_0;
	wire	[8:0]		spc1_pcx_req_pq_r_0;
	wire	[8:0]		spc1_pcx_atm_pq_r_0;
	wire	[8:0]		spc2_pcx_req_pq_l_0;
	wire	[8:0]		spc2_pcx_atm_pq_l_0;
	wire	[8:0]		spc2_pcx_req_pq_r_0;
	wire	[8:0]		spc2_pcx_atm_pq_r_0;
	wire	[8:0]		spc3_pcx_req_pq_l_0;
	wire	[8:0]		spc3_pcx_atm_pq_l_0;
	wire	[8:0]		spc3_pcx_req_pq_r_0;
	wire	[8:0]		spc3_pcx_atm_pq_r_0;
	wire	[8:0]		spc4_pcx_req_pq_l_0;
	wire	[8:0]		spc4_pcx_atm_pq_l_0;
	wire	[8:0]		spc4_pcx_req_pq_r_0;
	wire	[8:0]		spc4_pcx_atm_pq_r_0;
	wire	[8:0]		spc5_pcx_req_pq_l_0;
	wire	[8:0]		spc5_pcx_atm_pq_l_0;
	wire	[8:0]		spc5_pcx_req_pq_r_0;
	wire	[8:0]		spc5_pcx_atm_pq_r_0;
	wire	[8:0]		spc6_pcx_req_pq_l_0;
	wire	[8:0]		spc6_pcx_atm_pq_l_0;
	wire	[8:0]		spc6_pcx_req_pq_r_0;
	wire	[8:0]		spc6_pcx_atm_pq_r_0;
	wire	[8:0]		spc7_pcx_req_pq_l_0;
	wire	[8:0]		spc7_pcx_atm_pq_l_0;
	wire	[8:0]		spc7_pcx_req_pq_r_0;
	wire	[8:0]		spc7_pcx_atm_pq_r_0;
	wire	[129:0]		spc0_pcx_data_a;
	wire	[129:0]		spc1_pcx_data_a;
	wire	[129:0]		spc2_pcx_data_a;
	wire	[129:0]		spc3_pcx_data_a;
	wire	[129:0]		spc4_pcx_data_a;
	wire	[129:0]		spc5_pcx_data_a;
	wire	[129:0]		spc6_pcx_data_a;
	wire	[129:0]		spc7_pcx_data_a;
	wire			ccx_aclk_dpa_t;
	wire			ccx_bclk_dpa_t;
	wire			tcu_pce_ov_dpa_t;
	wire			tcu_scan_en_dpa_t;
	wire			ccx_aclk_dpa_b;
	wire			ccx_bclk_dpa_b;
	wire			tcu_pce_ov_dpa_b;
	wire			tcu_scan_en_dpa_b;
	wire	[129:0]		pcx_fpio_data_x_l;
	wire	[129:0]		pcx_scache0_data_x_l;
	wire	[129:0]		pcx_scache1_data_x_l;
	wire	[129:0]		pcx_scache2_data_x_l;
	wire	[129:0]		pcx_scache3_data_x_l;
	wire	[129:0]		pcx_scache4_data_x_l;
	wire	[129:0]		pcx_scache5_data_x_l;
	wire	[129:0]		pcx_scache6_data_x_l;
	wire	[129:0]		pcx_scache7_data_x_l;
	wire	[8:0]		arb0_grant_l_a;
	wire	[8:0]		arb0_q0_holdbar_l_a;
	wire	[8:0]		arb0_qsel0_l_a;
	wire	[8:0]		arb0_qsel1_l_a;
	wire	[8:0]		arb0_shift_l_a;
	wire	[8:0]		arb1_grant_l_a;
	wire	[8:0]		arb1_q0_holdbar_l_a;
	wire	[8:0]		arb1_qsel0_l_a;
	wire	[8:0]		arb1_qsel1_l_a;
	wire	[8:0]		arb1_shift_l_a;
	wire	[8:0]		arb2_grant_l_a;
	wire	[8:0]		arb2_q0_holdbar_l_a;
	wire	[8:0]		arb2_qsel0_l_a;
	wire	[8:0]		arb2_qsel1_l_a;
	wire	[8:0]		arb2_shift_l_a;
	wire	[8:0]		arb3_grant_l_a;
	wire	[8:0]		arb3_q0_holdbar_l_a;
	wire	[8:0]		arb3_qsel0_l_a;
	wire	[8:0]		arb3_qsel1_l_a;
	wire	[8:0]		arb3_shift_l_a;
	wire	[8:0]		arb4_grant_l_a;
	wire	[8:0]		arb4_q0_holdbar_l_a;
	wire	[8:0]		arb4_qsel0_l_a;
	wire	[8:0]		arb4_qsel1_l_a;
	wire	[8:0]		arb4_shift_l_a;
	wire	[8:0]		arb5_grant_l_a;
	wire	[8:0]		arb5_q0_holdbar_l_a;
	wire	[8:0]		arb5_qsel0_l_a;
	wire	[8:0]		arb5_qsel1_l_a;
	wire	[8:0]		arb5_shift_l_a;
	wire	[8:0]		arb6_grant_l_a;
	wire	[8:0]		arb6_q0_holdbar_l_a;
	wire	[8:0]		arb6_qsel0_l_a;
	wire	[8:0]		arb6_qsel1_l_a;
	wire	[8:0]		arb6_shift_l_a;
	wire	[8:0]		arb7_grant_l_a;
	wire	[8:0]		arb7_q0_holdbar_l_a;
	wire	[8:0]		arb7_qsel0_l_a;
	wire	[8:0]		arb7_qsel1_l_a;
	wire	[8:0]		arb7_shift_l_a;
	wire	[8:0]		arb8_grant_l_a;
	wire	[8:0]		arb8_q0_holdbar_l_a;
	wire	[8:0]		arb8_qsel0_l_a;
	wire	[8:0]		arb8_qsel1_l_a;
	wire	[8:0]		arb8_shift_l_a;
	wire	[8:0]		arb0_grant_r_a;
	wire	[8:0]		arb0_q0_holdbar_r_a;
	wire	[8:0]		arb0_qsel0_r_a;
	wire	[8:0]		arb0_qsel1_r_a;
	wire	[8:0]		arb0_shift_r_a;
	wire	[8:0]		arb1_grant_r_a;
	wire	[8:0]		arb1_q0_holdbar_r_a;
	wire	[8:0]		arb1_qsel0_r_a;
	wire	[8:0]		arb1_qsel1_r_a;
	wire	[8:0]		arb1_shift_r_a;
	wire	[8:0]		arb2_grant_r_a;
	wire	[8:0]		arb2_q0_holdbar_r_a;
	wire	[8:0]		arb2_qsel0_r_a;
	wire	[8:0]		arb2_qsel1_r_a;
	wire	[8:0]		arb2_shift_r_a;
	wire	[8:0]		arb3_grant_r_a;
	wire	[8:0]		arb3_q0_holdbar_r_a;
	wire	[8:0]		arb3_qsel0_r_a;
	wire	[8:0]		arb3_qsel1_r_a;
	wire	[8:0]		arb3_shift_r_a;
	wire	[8:0]		arb4_grant_r_a;
	wire	[8:0]		arb4_q0_holdbar_r_a;
	wire	[8:0]		arb4_qsel0_r_a;
	wire	[8:0]		arb4_qsel1_r_a;
	wire	[8:0]		arb4_shift_r_a;
	wire	[8:0]		arb5_grant_r_a;
	wire	[8:0]		arb5_q0_holdbar_r_a;
	wire	[8:0]		arb5_qsel0_r_a;
	wire	[8:0]		arb5_qsel1_r_a;
	wire	[8:0]		arb5_shift_r_a;
	wire	[8:0]		arb6_grant_r_a;
	wire	[8:0]		arb6_q0_holdbar_r_a;
	wire	[8:0]		arb6_qsel0_r_a;
	wire	[8:0]		arb6_qsel1_r_a;
	wire	[8:0]		arb6_shift_r_a;
	wire	[8:0]		arb7_grant_r_a;
	wire	[8:0]		arb7_q0_holdbar_r_a;
	wire	[8:0]		arb7_qsel0_r_a;
	wire	[8:0]		arb7_qsel1_r_a;
	wire	[8:0]		arb7_shift_r_a;
	wire	[8:0]		arb8_grant_r_a;
	wire	[8:0]		arb8_q0_holdbar_r_a;
	wire	[8:0]		arb8_qsel0_r_a;
	wire	[8:0]		arb8_qsel1_r_a;
	wire	[8:0]		arb8_shift_r_a;
	wire			pcx_dpa_scanin;
	wire			pcx_dpa_scanout;
	wire			bfd_io_scanin;
	wire			bfd_io_scanout;
	wire			tcu_scan_en_bfd_0;
	wire			tcu_pce_ov_bfd_0;
	wire			ccx_aclk_bfd_0;
	wire			ccx_bclk_bfd_0;
	wire	[129:0]		pcx_sctag0_data_px2_prebuf;
	wire			bfd0_scanin;
	wire			bfd0_scanout;
	wire			tcu_scan_en_bfd_1;
	wire			tcu_pce_ov_bfd_1;
	wire			ccx_aclk_bfd_1;
	wire			ccx_bclk_bfd_1;
	wire	[129:0]		pcx_sctag1_data_px2_prebuf;
	wire			bfd1_scanin;
	wire			bfd1_scanout;
	wire	[129:0]		pcx_sctag2_data_px2_prebuf;
	wire			bfd2_scanin;
	wire			bfd2_scanout;
	wire			tcu_scan_en_bfd_3;
	wire			tcu_pce_ov_bfd_3;
	wire			ccx_aclk_bfd_3;
	wire			ccx_bclk_bfd_3;
	wire	[129:0]		pcx_sctag3_data_px2_prebuf;
	wire			bfd3_scanin;
	wire			bfd3_scanout;
	wire	[129:0]		pcx_sctag4_data_px2_prebuf;
	wire			bfd4_scanin;
	wire			bfd4_scanout;
	wire			tcu_scan_en_bfd_5;
	wire			tcu_pce_ov_bfd_5;
	wire			ccx_aclk_bfd_5;
	wire			ccx_bclk_bfd_5;
	wire	[129:0]		pcx_sctag5_data_px2_prebuf;
	wire			bfd5_scanin;
	wire			bfd5_scanout;
	wire	[129:0]		pcx_sctag6_data_px2_prebuf;
	wire			bfd6_scanin;
	wire			bfd6_scanout;
	wire			tcu_scan_en_bfd_7;
	wire			tcu_pce_ov_bfd_7;
	wire			ccx_aclk_bfd_7;
	wire			ccx_bclk_bfd_7;
	wire	[129:0]		pcx_sctag7_data_px2_prebuf;
	wire			bfd7_scanin;
	wire			bfd7_scanout;
	wire	[8:0]		arb_grant_l_unused;
	wire	[8:0]		arb_q0_hold_l_unused;
	wire	[8:0]		arb_qsel0_l_unused;
	wire	[8:0]		arb_qsel1_l_unused;
	wire	[8:0]		arb_shift_l_unused;
	wire	[8:0]		arb_grant_r_unused;
	wire	[8:0]		arb_q0_hold_r_unused;
	wire	[8:0]		arb_qsel0_r_unused;
	wire	[8:0]		arb_qsel1_r_unused;
	wire	[8:0]		arb_shift_r_unused;
	wire			sctag0_pcx_stall_lq_d1;
	wire	[8:0]		spc0_pcx_req_lq;
	wire	[8:0]		spc0_pcx_atm_lq;
	wire			sctag1_pcx_stall_lq_d1;
	wire	[8:0]		spc1_pcx_req_lq;
	wire	[8:0]		spc1_pcx_atm_lq;
	wire			io_pcx_stall_lq_d1;
	wire			sctag2_pcx_stall_lq_d1;
	wire	[8:0]		spc2_pcx_req_lq;
	wire	[8:0]		spc2_pcx_atm_lq;
	wire			sctag3_pcx_stall_lq_d1;
	wire	[8:0]		spc3_pcx_req_lq;
	wire	[8:0]		spc3_pcx_atm_lq;
	wire			sctag4_pcx_stall_lq_d1;
	wire	[8:0]		spc4_pcx_req_lq;
	wire	[8:0]		spc4_pcx_atm_lq;
	wire			sctag5_pcx_stall_lq_d1;
	wire	[8:0]		spc5_pcx_req_lq;
	wire	[8:0]		spc5_pcx_atm_lq;
	wire			sctag6_pcx_stall_lq_d1;
	wire	[8:0]		spc6_pcx_req_lq;
	wire	[8:0]		spc6_pcx_atm_lq;
	wire			sctag7_pcx_stall_lq_d1;
	wire	[8:0]		spc7_pcx_req_lq;
	wire	[8:0]		spc7_pcx_atm_lq;
	wire			ccx_aclk_arb_lt;
	wire			ccx_bclk_arb_lt;
	wire			tcu_pce_ov_arb_lt;
	wire			tcu_scan_en_arb_lt;
	wire			ccx_aclk_arb_lb;
	wire			ccx_bclk_arb_lb;
	wire			tcu_pce_ov_arb_lb;
	wire			tcu_scan_en_arb_lb;
	wire			ccx_aclk_arb_rt;
	wire			ccx_bclk_arb_rt;
	wire			tcu_pce_ov_arb_rt;
	wire			tcu_scan_en_arb_rt;
	wire			ccx_aclk_arb_rb;
	wire			ccx_bclk_arb_rb;
	wire			tcu_pce_ov_arb_rb;
	wire			tcu_scan_en_arb_rb;
	wire	[8:0]		pcx_spc4_grant_a_unused;
	wire	[8:0]		pcx_spc5_grant_a_unused;
	wire	[8:0]		pcx_spc6_grant_a_unused;
	wire	[8:0]		pcx_spc7_grant_a_unused;
	wire			arb0_src8_grant_l_unused;
	wire			pcx_arbl0_scanin;
	wire			pcx_arbl0_scanout;
	wire			arb1_src8_grant_l_unused;
	wire			pcx_arbl1_scanin;
	wire			pcx_arbl1_scanout;
	wire			arb2_src8_grant_l_unused;
	wire			pcx_arbl2_scanin;
	wire			pcx_arbl2_scanout;
	wire			arb3_src8_grant_l_unused;
	wire			pcx_arbl3_scanin;
	wire			pcx_arbl3_scanout;
	wire			arb4_src8_grant_l_unused;
	wire			pcx_sctag4_atm_a_unused;
	wire			pcx_sctag4_data_rdy_a_unused;
	wire			pcx_arbl4_scanin;
	wire			pcx_arbl4_scanout;
	wire			arb5_src8_grant_l_unused;
	wire			pcx_sctag5_atm_a_unused;
	wire			pcx_sctag5_data_rdy_a_unused;
	wire			pcx_arbl5_scanin;
	wire			pcx_arbl5_scanout;
	wire			arb6_src8_grant_l_unused;
	wire			pcx_sctag6_atm_a_unused;
	wire			pcx_sctag6_data_rdy_a_unused;
	wire			pcx_arbl6_scanin;
	wire			pcx_arbl6_scanout;
	wire			arb7_src8_grant_l_unused;
	wire			pcx_sctag7_atm_a_unused;
	wire			pcx_sctag7_data_rdy_a_unused;
	wire			pcx_arbl7_scanin;
	wire			pcx_arbl7_scanout;
	wire			arb8_src8_grant_l_unused;
	wire			arb8_dest_atom_l_unused;
	wire			pcx_arbl8_scanin;
	wire			pcx_arbl8_scanout;
	wire			sctag0_pcx_stall_rq_d1;
	wire	[8:0]		spc0_pcx_req_rq;
	wire	[8:0]		spc0_pcx_atm_rq;
	wire			sctag1_pcx_stall_rq_d1;
	wire	[8:0]		spc1_pcx_req_rq;
	wire	[8:0]		spc1_pcx_atm_rq;
	wire			io_pcx_stall_rq_d1;
	wire			sctag2_pcx_stall_rq_d1;
	wire	[8:0]		spc2_pcx_req_rq;
	wire	[8:0]		spc2_pcx_atm_rq;
	wire			sctag3_pcx_stall_rq_d1;
	wire	[8:0]		spc3_pcx_req_rq;
	wire	[8:0]		spc3_pcx_atm_rq;
	wire			sctag4_pcx_stall_rq_d1;
	wire	[8:0]		spc4_pcx_req_rq;
	wire	[8:0]		spc4_pcx_atm_rq;
	wire			sctag5_pcx_stall_rq_d1;
	wire	[8:0]		spc5_pcx_req_rq;
	wire	[8:0]		spc5_pcx_atm_rq;
	wire			sctag6_pcx_stall_rq_d1;
	wire	[8:0]		spc6_pcx_req_rq;
	wire	[8:0]		spc6_pcx_atm_rq;
	wire			sctag7_pcx_stall_rq_d1;
	wire	[8:0]		spc7_pcx_req_rq;
	wire	[8:0]		spc7_pcx_atm_rq;
	wire	[8:0]		pcx_spc0_grant_a_unused;
	wire	[8:0]		pcx_spc1_grant_a_unused;
	wire	[8:0]		pcx_spc2_grant_a_unused;
	wire	[8:0]		pcx_spc3_grant_a_unused;
	wire			arb0_src8_grant_r_unused;
	wire			pcx_sctag0_atm_a_unused;
	wire			pcx_sctag0_data_rdy_a_unused;
	wire			pcx_arbr0_scanin;
	wire			pcx_arbr0_scanout;
	wire			arb1_src8_grant_r_unused;
	wire			pcx_sctag1_atm_a_unused;
	wire			pcx_sctag1_data_rdy_a_unused;
	wire			pcx_arbr1_scanin;
	wire			pcx_arbr1_scanout;
	wire			arb2_src8_grant_r_unused;
	wire			pcx_sctag2_atm_a_unused;
	wire			pcx_sctag2_data_rdy_a_unused;
	wire			pcx_arbr2_scanin;
	wire			pcx_arbr2_scanout;
	wire			arb3_src8_grant_r_unused;
	wire			pcx_sctag3_atm_a_unused;
	wire			pcx_sctag3_data_rdy_a_unused;
	wire			pcx_arbr3_scanin;
	wire			pcx_arbr3_scanout;
	wire			arb4_src8_grant_r_unused;
	wire			pcx_arbr4_scanin;
	wire			pcx_arbr4_scanout;
	wire			arb5_src8_grant_r_unused;
	wire			pcx_arbr5_scanin;
	wire			pcx_arbr5_scanout;
	wire			arb6_src8_grant_r_unused;
	wire			pcx_arbr6_scanin;
	wire			pcx_arbr6_scanout;
	wire			arb7_src8_grant_r_unused;
	wire			pcx_arbr7_scanin;
	wire			pcx_arbr7_scanout;
	wire			arb8_src8_grant_r_unused;
	wire			arb8_dest_atom_r_unused;
	wire			pcx_fpio_data_rdy_a_unused;
	wire			pcx_arbr8_scanin;
	wire			pcx_arbr8_scanout;

	assign arb_grant_l_unused[8:0] = {arb8_grant_l_a[8], arb7_grant_l_a[8], 
		arb6_grant_l_a[8], arb5_grant_l_a[8], arb4_grant_l_a[8], 
		arb3_grant_l_a[8], arb2_grant_l_a[8], arb1_grant_l_a[8], 
		arb0_grant_l_a[8]};
	assign arb_q0_hold_l_unused[8:0] = {arb8_q0_holdbar_l_a[8], 
		arb7_q0_holdbar_l_a[8], arb6_q0_holdbar_l_a[8], 
		arb5_q0_holdbar_l_a[8], arb4_q0_holdbar_l_a[8], 
		arb3_q0_holdbar_l_a[8], arb2_q0_holdbar_l_a[8], 
		arb1_q0_holdbar_l_a[8], arb0_q0_holdbar_l_a[8]};
	assign arb_qsel0_l_unused[8:0] = {arb8_qsel0_l_a[8], arb7_qsel0_l_a[8], 
		arb6_qsel0_l_a[8], arb5_qsel0_l_a[8], arb4_qsel0_l_a[8], 
		arb3_qsel0_l_a[8], arb2_qsel0_l_a[8], arb1_qsel0_l_a[8], 
		arb0_qsel0_l_a[8]};
	assign arb_qsel1_l_unused[8:0] = {arb8_qsel1_l_a[8], arb7_qsel1_l_a[8], 
		arb6_qsel1_l_a[8], arb5_qsel1_l_a[8], arb4_qsel1_l_a[8], 
		arb3_qsel1_l_a[8], arb2_qsel1_l_a[8], arb1_qsel1_l_a[8], 
		arb0_qsel1_l_a[8]};
	assign arb_shift_l_unused[8:0] = {arb8_shift_l_a[8], arb7_shift_l_a[8], 
		arb6_shift_l_a[8], arb5_shift_l_a[8], arb4_shift_l_a[8], 
		arb3_shift_l_a[8], arb2_shift_l_a[8], arb1_shift_l_a[8], 
		arb0_shift_l_a[8]};
	assign arb_grant_r_unused[8:0] = {arb8_grant_r_a[8], arb7_grant_r_a[8], 
		arb6_grant_r_a[8], arb5_grant_r_a[8], arb4_grant_r_a[8], 
		arb3_grant_r_a[8], arb2_grant_r_a[8], arb1_grant_r_a[8], 
		arb0_grant_r_a[8]};
	assign arb_q0_hold_r_unused[8:0] = {arb8_q0_holdbar_r_a[8], 
		arb7_q0_holdbar_r_a[8], arb6_q0_holdbar_r_a[8], 
		arb5_q0_holdbar_r_a[8], arb4_q0_holdbar_r_a[8], 
		arb3_q0_holdbar_r_a[8], arb2_q0_holdbar_r_a[8], 
		arb1_q0_holdbar_r_a[8], arb0_q0_holdbar_r_a[8]};
	assign arb_qsel0_r_unused[8:0] = {arb8_qsel0_r_a[8], arb7_qsel0_r_a[8], 
		arb6_qsel0_r_a[8], arb5_qsel0_r_a[8], arb4_qsel0_r_a[8], 
		arb3_qsel0_r_a[8], arb2_qsel0_r_a[8], arb1_qsel0_r_a[8], 
		arb0_qsel0_r_a[8]};
	assign arb_qsel1_r_unused[8:0] = {arb8_qsel1_r_a[8], arb7_qsel1_r_a[8], 
		arb6_qsel1_r_a[8], arb5_qsel1_r_a[8], arb4_qsel1_r_a[8], 
		arb3_qsel1_r_a[8], arb2_qsel1_r_a[8], arb1_qsel1_r_a[8], 
		arb0_qsel1_r_a[8]};
	assign arb_shift_r_unused[8:0] = {arb8_shift_r_a[8], arb7_shift_r_a[8], 
		arb6_shift_r_a[8], arb5_shift_r_a[8], arb4_shift_r_a[8], 
		arb3_shift_r_a[8], arb2_shift_r_a[8], arb1_shift_r_a[8], 
		arb0_shift_r_a[8]};
	assign bfd4_scanin = scan_in;
	assign bfd5_scanin = bfd4_scanout;
	assign bfg4_scanin = bfd5_scanout;
	assign bfg1_scanin = bfg4_scanout;
	assign bfd1_scanin = bfg1_scanout;
	assign bfd0_scanin = bfd1_scanout;
	assign bfd_io_scanin = bfd0_scanout;
	assign bfg8_scanin = bfd_io_scanout;
	assign bfg0_scanin = bfg8_scanout;
	assign pcx_arbl0_scanin = bfg0_scanout;
	assign pcx_arbl4_scanin = pcx_arbl0_scanout;
	assign pcx_arbl8_scanin = pcx_arbl4_scanout;
	assign pcx_arbl3_scanin = pcx_arbl8_scanout;
	assign pcx_arbl5_scanin = pcx_arbl3_scanout;
	assign pcx_arbl1_scanin = pcx_arbl5_scanout;
	assign pcx_arbl7_scanin = pcx_arbl1_scanout;
	assign pcx_arbl2_scanin = pcx_arbl7_scanout;
	assign pcx_arbl6_scanin = pcx_arbl2_scanout;
	assign bfg2_scanin = pcx_arbl6_scanout;
	assign bfd2_scanin = bfg2_scanout;
	assign bfd3_scanin = bfd2_scanout;
	assign bfg3_scanin = bfd3_scanout;
	assign bfg7_scanin = bfg3_scanout;
	assign bfd7_scanin = bfg7_scanout;
	assign bfd6_scanin = bfd7_scanout;
	assign bfg6_scanin = bfd6_scanout;
	assign pcx_arbr6_scanin = bfg6_scanout;
	assign pcx_arbr2_scanin = pcx_arbr6_scanout;
	assign pcx_arbr7_scanin = pcx_arbr2_scanout;
	assign pcx_arbr1_scanin = pcx_arbr7_scanout;
	assign pcx_arbr5_scanin = pcx_arbr1_scanout;
	assign pcx_arbr3_scanin = pcx_arbr5_scanout;
	assign pcx_arbr8_scanin = pcx_arbr3_scanout;
	assign pcx_arbr4_scanin = pcx_arbr8_scanout;
	assign pcx_arbr0_scanin = pcx_arbr4_scanout;
	assign bfg5_scanin = pcx_arbr0_scanout;
	assign pcx_dpa_scanin = bfg5_scanout;
	assign scan_out = pcx_dpa_scanout;

	buff_macro__dbuff_32x__rep_1__stack_150c__width_130 i_bufd_io(
		.din				(pcx_fpio_data_px2_0[129:0]), 
		.dout				(pcx_fpio_data_px2[129:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct1_1(
		.din				({pcx_sctag1_data_rdy_px1_0,
		pcx_sctag1_atm_px1_0}), 
		.dout				({pcx_sctag1_data_rdy_px1,
		pcx_sctag1_atm_px1}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct3_1(
		.din				({pcx_sctag3_data_rdy_px1_0,
		pcx_sctag3_atm_px1_0}), 
		.dout				({pcx_sctag3_data_rdy_px1,
		pcx_sctag3_atm_px1}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct5_1(
		.din				({pcx_sctag5_data_rdy_px1_0,
		pcx_sctag5_atm_px1_0}), 
		.dout				({pcx_sctag5_data_rdy_px1,
		pcx_sctag5_atm_px1}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_2 i_bufd_sct7_1(
		.din				({pcx_sctag7_data_rdy_px1_0,
		pcx_sctag7_atm_px1_0}), 
		.dout				({pcx_sctag7_data_rdy_px1,
		pcx_sctag7_atm_px1}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc0(
		.din				(pcx_spc0_grant_a[8:0]), 
		.dout				(pcx_spc0_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc1(
		.din				(pcx_spc1_grant_a[8:0]), 
		.dout				(pcx_spc1_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc2(
		.din				(pcx_spc2_grant_a[8:0]), 
		.dout				(pcx_spc2_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc3(
		.din				(pcx_spc3_grant_a[8:0]), 
		.dout				(pcx_spc3_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc4(
		.din				(pcx_spc4_grant_a[8:0]), 
		.dout				(pcx_spc4_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc5(
		.din				(pcx_spc5_grant_a[8:0]), 
		.dout				(pcx_spc5_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc6(
		.din				(pcx_spc6_grant_a[8:0]), 
		.dout				(pcx_spc6_grant_a_0[8:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_9 i_bufg_spc7(
		.din				(pcx_spc7_grant_a[8:0]), 
		.dout				(pcx_spc7_grant_a_0[8:0]));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_io_stall(
		.din				(io_pcx_stall_pq), 
		.dout				(io_pcx_stall_pq_buf));
	pcx_bfg_dp bfg8(
		.pcx_spc_grant_px		({fpio_atm1_unused,
		fpio_atm2_unused, pcx_fpio_data_rdy_px1, rdy8_1_unused,
		io_pcx_stall_pq_d1, grant8_unused[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_8_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_8_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_8_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_8_unused), 
		.pcx_spc_grant_pa		({2'b0, pcx_fpio_data_rdy_a,
		1'b0, io_pcx_stall_pq_buf, 9'b0}), 
		.scan_in			(bfg8_scanin), 
		.scan_out			(bfg8_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk			(ccx_aclk_bfd_lt), 
		.ccx_bclk			(ccx_bclk_bfd_lt));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct0_stall(
		.din				(sctag0_pcx_stall_pq), 
		.dout				(sctag0_pcx_stall_pq_buf));
	pcx_bfg_dp bfg0(
		.pcx_spc_grant_px		({pcx_sctag0_atm_px1,
		pcx_sctag1_atm_px1_0, pcx_sctag0_data_rdy_px1,
		pcx_sctag1_data_rdy_px1_0, sctag0_pcx_stall_pq_d1,
		pcx_spc0_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_0_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_0_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_0_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_0_unused), 
		.pcx_spc_grant_pa		({pcx_sctag0_atm_a,
		pcx_sctag1_atm_a, pcx_sctag0_data_rdy_a, pcx_sctag1_data_rdy_a,
		sctag0_pcx_stall_pq_buf, pcx_spc0_grant_a_0[8:0]}), 
		.scan_in			(bfg0_scanin), 
		.scan_out			(bfg0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk			(ccx_aclk_bfd_lt), 
		.ccx_bclk			(ccx_bclk_bfd_lt));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct1_stall(
		.din				(sctag1_pcx_stall_pq), 
		.dout				(sctag1_pcx_stall_pq_buf));
	pcx_bfg_dp bfg1(
		.pcx_spc_grant_px		({atm10_unused, atm11_unused,
		rdy10_unused, rdy11_unused, sctag1_pcx_stall_pq_d1,
		pcx_spc1_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_1_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_1_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_1_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_1_unused), 
		.pcx_spc_grant_pa		({4'b0, sctag1_pcx_stall_pq_buf,
		pcx_spc1_grant_a_0[8:0]}), 
		.scan_in			(bfg1_scanin), 
		.scan_out			(bfg1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct2_stall(
		.din				(sctag2_pcx_stall_pq), 
		.dout				(sctag2_pcx_stall_pq_buf));
	pcx_bfg_dp bfg2(
		.pcx_spc_grant_px		({pcx_sctag2_atm_px1,
		pcx_sctag3_atm_px1_0, pcx_sctag2_data_rdy_px1,
		pcx_sctag3_data_rdy_px1_0, sctag2_pcx_stall_pq_d1,
		pcx_spc2_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_2_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_2_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_2_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_2_unused), 
		.pcx_spc_grant_pa		({pcx_sctag2_atm_a,
		pcx_sctag3_atm_a, pcx_sctag2_data_rdy_a, pcx_sctag3_data_rdy_a,
		sctag2_pcx_stall_pq_buf, pcx_spc2_grant_a_0[8:0]}), 
		.scan_in			(bfg2_scanin), 
		.scan_out			(bfg2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lb), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lb), 
		.ccx_aclk			(ccx_aclk_bfd_lb), 
		.ccx_bclk			(ccx_bclk_bfd_lb));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct3_stall(
		.din				(sctag3_pcx_stall_pq), 
		.dout				(sctag3_pcx_stall_pq_buf));
	pcx_bfg_dp bfg3(
		.pcx_spc_grant_px		({atm30_unused, atm31_unused,
		rdy30_unused, rdy31_unused, sctag3_pcx_stall_pq_d1,
		pcx_spc3_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_3_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_3_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_3_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_3_unused), 
		.pcx_spc_grant_pa		({4'b0, sctag3_pcx_stall_pq_buf,
		pcx_spc3_grant_a_0[8:0]}), 
		.scan_in			(bfg3_scanin), 
		.scan_out			(bfg3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct4_stall(
		.din				(sctag4_pcx_stall_pq), 
		.dout				(sctag4_pcx_stall_pq_buf));
	pcx_bfg_dp bfg4(
		.pcx_spc_grant_px		({pcx_sctag4_atm_px1,
		pcx_sctag5_atm_px1_0, pcx_sctag4_data_rdy_px1,
		pcx_sctag5_data_rdy_px1_0, sctag4_pcx_stall_pq_d1,
		pcx_spc4_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_4_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_4_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_4_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_4_unused), 
		.pcx_spc_grant_pa		({pcx_sctag4_atm_a,
		pcx_sctag5_atm_a, pcx_sctag4_data_rdy_a, pcx_sctag5_data_rdy_a,
		sctag4_pcx_stall_pq_buf, pcx_spc4_grant_a_0[8:0]}), 
		.scan_in			(bfg4_scanin), 
		.scan_out			(bfg4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_rt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_rt), 
		.ccx_aclk			(ccx_aclk_bfd_rt), 
		.ccx_bclk			(ccx_bclk_bfd_rt));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct5_stall(
		.din				(sctag5_pcx_stall_pq), 
		.dout				(sctag5_pcx_stall_pq_buf));
	pcx_bfg_dp bfg5(
		.pcx_spc_grant_px		({atm50_unused, atm51_unused,
		rdy50_unused, rdy51_unused, sctag5_pcx_stall_pq_d1,
		pcx_spc5_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_5_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_5_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_5_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_5_unused), 
		.pcx_spc_grant_pa		({4'b0, sctag5_pcx_stall_pq_buf,
		pcx_spc5_grant_a_0[8:0]}), 
		.scan_in			(bfg5_scanin), 
		.scan_out			(bfg5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct6_stall(
		.din				(sctag6_pcx_stall_pq), 
		.dout				(sctag6_pcx_stall_pq_buf));
	pcx_bfg_dp bfg6(
		.pcx_spc_grant_px		({pcx_sctag6_atm_px1,
		pcx_sctag7_atm_px1_0, pcx_sctag6_data_rdy_px1,
		pcx_sctag7_data_rdy_px1_0, sctag6_pcx_stall_pq_d1,
		pcx_spc6_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_6_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_6_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_6_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_6_unused), 
		.pcx_spc_grant_pa		({pcx_sctag6_atm_a,
		pcx_sctag7_atm_a, pcx_sctag6_data_rdy_a, pcx_sctag7_data_rdy_a,
		sctag6_pcx_stall_pq_buf, pcx_spc6_grant_a_0[8:0]}), 
		.scan_in			(bfg6_scanin), 
		.scan_out			(bfg6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_rb), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_rb), 
		.ccx_aclk			(ccx_aclk_bfd_rb), 
		.ccx_bclk			(ccx_bclk_bfd_rb));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_sct7_stall(
		.din				(sctag7_pcx_stall_pq), 
		.dout				(sctag7_pcx_stall_pq_buf));
	pcx_bfg_dp bfg7(
		.pcx_spc_grant_px		({atm70_unused, atm71_unused,
		rdy70_unused, rdy71_unused, sctag7_pcx_stall_pq_d1,
		pcx_spc7_grant_px[8:0]}), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_7_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_7_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_7_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_7_unused), 
		.pcx_spc_grant_pa		({4'b0, sctag7_pcx_stall_pq_buf,
		pcx_spc7_grant_a_0[8:0]}), 
		.scan_in			(bfg7_scanin), 
		.scan_out			(bfg7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc0_l(
		.din				({spc0_pcx_req_pq[8:0],
		spc0_pcx_atm_pq[8:0]}), 
		.dout				({spc0_pcx_req_pq_l_0[8:0],
		spc0_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc0_r(
		.din				({spc0_pcx_req_pq[8:0],
		spc0_pcx_atm_pq[8:0]}), 
		.dout				({spc0_pcx_req_pq_r_0[8:0],
		spc0_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc1_l(
		.din				({spc1_pcx_req_pq[8:0],
		spc1_pcx_atm_pq[8:0]}), 
		.dout				({spc1_pcx_req_pq_l_0[8:0],
		spc1_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc1_r(
		.din				({spc1_pcx_req_pq[8:0],
		spc1_pcx_atm_pq[8:0]}), 
		.dout				({spc1_pcx_req_pq_r_0[8:0],
		spc1_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc2_l(
		.din				({spc2_pcx_req_pq[8:0],
		spc2_pcx_atm_pq[8:0]}), 
		.dout				({spc2_pcx_req_pq_l_0[8:0],
		spc2_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc2_r(
		.din				({spc2_pcx_req_pq[8:0],
		spc2_pcx_atm_pq[8:0]}), 
		.dout				({spc2_pcx_req_pq_r_0[8:0],
		spc2_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc3_l(
		.din				({spc3_pcx_req_pq[8:0],
		spc3_pcx_atm_pq[8:0]}), 
		.dout				({spc3_pcx_req_pq_l_0[8:0],
		spc3_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc3_r(
		.din				({spc3_pcx_req_pq[8:0],
		spc3_pcx_atm_pq[8:0]}), 
		.dout				({spc3_pcx_req_pq_r_0[8:0],
		spc3_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc4_l(
		.din				({spc4_pcx_req_pq[8:0],
		spc4_pcx_atm_pq[8:0]}), 
		.dout				({spc4_pcx_req_pq_l_0[8:0],
		spc4_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc4_r(
		.din				({spc4_pcx_req_pq[8:0],
		spc4_pcx_atm_pq[8:0]}), 
		.dout				({spc4_pcx_req_pq_r_0[8:0],
		spc4_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc5_l(
		.din				({spc5_pcx_req_pq[8:0],
		spc5_pcx_atm_pq[8:0]}), 
		.dout				({spc5_pcx_req_pq_l_0[8:0],
		spc5_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc5_r(
		.din				({spc5_pcx_req_pq[8:0],
		spc5_pcx_atm_pq[8:0]}), 
		.dout				({spc5_pcx_req_pq_r_0[8:0],
		spc5_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc6_l(
		.din				({spc6_pcx_req_pq[8:0],
		spc6_pcx_atm_pq[8:0]}), 
		.dout				({spc6_pcx_req_pq_l_0[8:0],
		spc6_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc6_r(
		.din				({spc6_pcx_req_pq[8:0],
		spc6_pcx_atm_pq[8:0]}), 
		.dout				({spc6_pcx_req_pq_r_0[8:0],
		spc6_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc7_l(
		.din				({spc7_pcx_req_pq[8:0],
		spc7_pcx_atm_pq[8:0]}), 
		.dout				({spc7_pcx_req_pq_l_0[8:0],
		spc7_pcx_atm_pq_l_0[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_none__width_18 i_bufq_spc7_r(
		.din				({spc7_pcx_req_pq[8:0],
		spc7_pcx_atm_pq[8:0]}), 
		.dout				({spc7_pcx_req_pq_r_0[8:0],
		spc7_pcx_atm_pq_r_0[8:0]}));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc0_1(
		.din				(spc0_pcx_data_pa[129:0]), 
		.dout				(spc0_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc1_1(
		.din				(spc1_pcx_data_pa[129:0]), 
		.dout				(spc1_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc2_1(
		.din				(spc2_pcx_data_pa[129:0]), 
		.dout				(spc2_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc3_1(
		.din				(spc3_pcx_data_pa[129:0]), 
		.dout				(spc3_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc4_1(
		.din				(spc4_pcx_data_pa[129:0]), 
		.dout				(spc4_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc5_1(
		.din				(spc5_pcx_data_pa[129:0]), 
		.dout				(spc5_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc6_1(
		.din				(spc6_pcx_data_pa[129:0]), 
		.dout				(spc6_pcx_data_a[129:0]));
	buff_macro__dbuff_40x__rep_1__stack_130c__width_130 i_bufd_spc7_1(
		.din				(spc7_pcx_data_pa[129:0]), 
		.dout				(spc7_pcx_data_a[129:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_t(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_dpa_t,
		ccx_bclk_dpa_t, tcu_pce_ov_dpa_t, tcu_scan_en_dpa_t}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_t(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_bfd_t,
		ccx_bclk_bfd_t, tcu_pce_ov_bfd_t, tcu_scan_en_bfd_t}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_b(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_dpa_b,
		ccx_bclk_dpa_b, tcu_pce_ov_dpa_b, tcu_scan_en_dpa_b}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_b(
		.din				({ccx_aclk, ccx_bclk,
		tcu_pce_ov, tcu_scan_en}), 
		.dout				({ccx_aclk_bfd_b,
		ccx_bclk_bfd_b, tcu_pce_ov_bfd_b, tcu_scan_en_bfd_b}));
	pcx_dpa pcx_dpa(
		.pcx_io_data_x_			(pcx_fpio_data_x_l[129:0]), 
		.pcx_scache0_data_x_		(pcx_scache0_data_x_l[129:0]), 
		.pcx_scache1_data_x_		(pcx_scache1_data_x_l[129:0]), 
		.pcx_scache2_data_x_		(pcx_scache2_data_x_l[129:0]), 
		.pcx_scache3_data_x_		(pcx_scache3_data_x_l[129:0]), 
		.pcx_scache4_data_x_		(pcx_scache4_data_x_l[129:0]), 
		.pcx_scache5_data_x_		(pcx_scache5_data_x_l[129:0]), 
		.pcx_scache6_data_x_		(pcx_scache6_data_x_l[129:0]), 
		.pcx_scache7_data_x_		(pcx_scache7_data_x_l[129:0]), 
		.arb0_grant_l_a			(arb0_grant_l_a[7:0]), 
		.arb0_q0_holdbar_l_a		(arb0_q0_holdbar_l_a[7:0]), 
		.arb0_qsel0_l_a			(arb0_qsel0_l_a[7:0]), 
		.arb0_qsel1_l_a			(arb0_qsel1_l_a[7:0]), 
		.arb0_shift_l_a			(arb0_shift_l_a[7:0]), 
		.arb1_grant_l_a			(arb1_grant_l_a[7:0]), 
		.arb1_q0_holdbar_l_a		(arb1_q0_holdbar_l_a[7:0]), 
		.arb1_qsel0_l_a			(arb1_qsel0_l_a[7:0]), 
		.arb1_qsel1_l_a			(arb1_qsel1_l_a[7:0]), 
		.arb1_shift_l_a			(arb1_shift_l_a[7:0]), 
		.arb2_grant_l_a			(arb2_grant_l_a[7:0]), 
		.arb2_q0_holdbar_l_a		(arb2_q0_holdbar_l_a[7:0]), 
		.arb2_qsel0_l_a			(arb2_qsel0_l_a[7:0]), 
		.arb2_qsel1_l_a			(arb2_qsel1_l_a[7:0]), 
		.arb2_shift_l_a			(arb2_shift_l_a[7:0]), 
		.arb3_grant_l_a			(arb3_grant_l_a[7:0]), 
		.arb3_q0_holdbar_l_a		(arb3_q0_holdbar_l_a[7:0]), 
		.arb3_qsel0_l_a			(arb3_qsel0_l_a[7:0]), 
		.arb3_qsel1_l_a			(arb3_qsel1_l_a[7:0]), 
		.arb3_shift_l_a			(arb3_shift_l_a[7:0]), 
		.arb4_grant_l_a			(arb4_grant_l_a[7:0]), 
		.arb4_q0_holdbar_l_a		(arb4_q0_holdbar_l_a[7:0]), 
		.arb4_qsel0_l_a			(arb4_qsel0_l_a[7:0]), 
		.arb4_qsel1_l_a			(arb4_qsel1_l_a[7:0]), 
		.arb4_shift_l_a			(arb4_shift_l_a[7:0]), 
		.arb5_grant_l_a			(arb5_grant_l_a[7:0]), 
		.arb5_q0_holdbar_l_a		(arb5_q0_holdbar_l_a[7:0]), 
		.arb5_qsel0_l_a			(arb5_qsel0_l_a[7:0]), 
		.arb5_qsel1_l_a			(arb5_qsel1_l_a[7:0]), 
		.arb5_shift_l_a			(arb5_shift_l_a[7:0]), 
		.arb6_grant_l_a			(arb6_grant_l_a[7:0]), 
		.arb6_q0_holdbar_l_a		(arb6_q0_holdbar_l_a[7:0]), 
		.arb6_qsel0_l_a			(arb6_qsel0_l_a[7:0]), 
		.arb6_qsel1_l_a			(arb6_qsel1_l_a[7:0]), 
		.arb6_shift_l_a			(arb6_shift_l_a[7:0]), 
		.arb7_grant_l_a			(arb7_grant_l_a[7:0]), 
		.arb7_q0_holdbar_l_a		(arb7_q0_holdbar_l_a[7:0]), 
		.arb7_qsel0_l_a			(arb7_qsel0_l_a[7:0]), 
		.arb7_qsel1_l_a			(arb7_qsel1_l_a[7:0]), 
		.arb7_shift_l_a			(arb7_shift_l_a[7:0]), 
		.arb8_grant_l_a			(arb8_grant_l_a[7:0]), 
		.arb8_q0_holdbar_l_a		(arb8_q0_holdbar_l_a[7:0]), 
		.arb8_qsel0_l_a			(arb8_qsel0_l_a[7:0]), 
		.arb8_qsel1_l_a			(arb8_qsel1_l_a[7:0]), 
		.arb8_shift_l_a			(arb8_shift_l_a[7:0]), 
		.arb0_grant_r_a			(arb0_grant_r_a[7:0]), 
		.arb0_q0_holdbar_r_a		(arb0_q0_holdbar_r_a[7:0]), 
		.arb0_qsel0_r_a			(arb0_qsel0_r_a[7:0]), 
		.arb0_qsel1_r_a			(arb0_qsel1_r_a[7:0]), 
		.arb0_shift_r_a			(arb0_shift_r_a[7:0]), 
		.arb1_grant_r_a			(arb1_grant_r_a[7:0]), 
		.arb1_q0_holdbar_r_a		(arb1_q0_holdbar_r_a[7:0]), 
		.arb1_qsel0_r_a			(arb1_qsel0_r_a[7:0]), 
		.arb1_qsel1_r_a			(arb1_qsel1_r_a[7:0]), 
		.arb1_shift_r_a			(arb1_shift_r_a[7:0]), 
		.arb2_grant_r_a			(arb2_grant_r_a[7:0]), 
		.arb2_q0_holdbar_r_a		(arb2_q0_holdbar_r_a[7:0]), 
		.arb2_qsel0_r_a			(arb2_qsel0_r_a[7:0]), 
		.arb2_qsel1_r_a			(arb2_qsel1_r_a[7:0]), 
		.arb2_shift_r_a			(arb2_shift_r_a[7:0]), 
		.arb3_grant_r_a			(arb3_grant_r_a[7:0]), 
		.arb3_q0_holdbar_r_a		(arb3_q0_holdbar_r_a[7:0]), 
		.arb3_qsel0_r_a			(arb3_qsel0_r_a[7:0]), 
		.arb3_qsel1_r_a			(arb3_qsel1_r_a[7:0]), 
		.arb3_shift_r_a			(arb3_shift_r_a[7:0]), 
		.arb4_grant_r_a			(arb4_grant_r_a[7:0]), 
		.arb4_q0_holdbar_r_a		(arb4_q0_holdbar_r_a[7:0]), 
		.arb4_qsel0_r_a			(arb4_qsel0_r_a[7:0]), 
		.arb4_qsel1_r_a			(arb4_qsel1_r_a[7:0]), 
		.arb4_shift_r_a			(arb4_shift_r_a[7:0]), 
		.arb5_grant_r_a			(arb5_grant_r_a[7:0]), 
		.arb5_q0_holdbar_r_a		(arb5_q0_holdbar_r_a[7:0]), 
		.arb5_qsel0_r_a			(arb5_qsel0_r_a[7:0]), 
		.arb5_qsel1_r_a			(arb5_qsel1_r_a[7:0]), 
		.arb5_shift_r_a			(arb5_shift_r_a[7:0]), 
		.arb6_grant_r_a			(arb6_grant_r_a[7:0]), 
		.arb6_q0_holdbar_r_a		(arb6_q0_holdbar_r_a[7:0]), 
		.arb6_qsel0_r_a			(arb6_qsel0_r_a[7:0]), 
		.arb6_qsel1_r_a			(arb6_qsel1_r_a[7:0]), 
		.arb6_shift_r_a			(arb6_shift_r_a[7:0]), 
		.arb7_grant_r_a			(arb7_grant_r_a[7:0]), 
		.arb7_q0_holdbar_r_a		(arb7_q0_holdbar_r_a[7:0]), 
		.arb7_qsel0_r_a			(arb7_qsel0_r_a[7:0]), 
		.arb7_qsel1_r_a			(arb7_qsel1_r_a[7:0]), 
		.arb7_shift_r_a			(arb7_shift_r_a[7:0]), 
		.arb8_grant_r_a			(arb8_grant_r_a[7:0]), 
		.arb8_q0_holdbar_r_a		(arb8_q0_holdbar_r_a[7:0]), 
		.arb8_qsel0_r_a			(arb8_qsel0_r_a[7:0]), 
		.arb8_qsel1_r_a			(arb8_qsel1_r_a[7:0]), 
		.arb8_shift_r_a			(arb8_shift_r_a[7:0]), 
		.spc0_pcx_data_a		(spc0_pcx_data_a[129:0]), 
		.spc1_pcx_data_a		(spc1_pcx_data_a[129:0]), 
		.spc2_pcx_data_a		(spc2_pcx_data_a[129:0]), 
		.spc3_pcx_data_a		(spc3_pcx_data_a[129:0]), 
		.spc4_pcx_data_a		(spc4_pcx_data_a[129:0]), 
		.spc5_pcx_data_a		(spc5_pcx_data_a[129:0]), 
		.spc6_pcx_data_a		(spc6_pcx_data_a[129:0]), 
		.spc7_pcx_data_a		(spc7_pcx_data_a[129:0]), 
		.scan_in			(pcx_dpa_scanin), 
		.scan_out			(pcx_dpa_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en_t			(tcu_scan_en_dpa_t), 
		.tcu_pce_ov_t			(tcu_pce_ov_dpa_t), 
		.ccx_aclk_t			(ccx_aclk_dpa_t), 
		.ccx_bclk_t			(ccx_bclk_dpa_t), 
		.tcu_scan_en_b			(tcu_scan_en_dpa_b), 
		.tcu_pce_ov_b			(tcu_pce_ov_dpa_b), 
		.ccx_aclk_b			(ccx_aclk_dpa_b), 
		.ccx_bclk_b			(ccx_bclk_dpa_b));
	pcx_bfd_dp bfd_io(
		.pcx_sctag_data_px2		(pcx_fpio_data_px2_0[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk_out			(ccx_aclk_bfd_lt), 
		.ccx_bclk_out			(ccx_bclk_bfd_lt), 
		.pcx_scache_data_px_		(pcx_fpio_data_x_l[129:0]), 
		.scan_in			(bfd_io_scanin), 
		.scan_out			(bfd_io_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_0), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_0), 
		.ccx_aclk			(ccx_aclk_bfd_0), 
		.ccx_bclk			(ccx_bclk_bfd_0));
	pcx_bfd_dp bfd0(
		.pcx_sctag_data_px2		
		(pcx_sctag0_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_0), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_0), 
		.ccx_aclk_out			(ccx_aclk_bfd_0), 
		.ccx_bclk_out			(ccx_bclk_bfd_0), 
		.pcx_scache_data_px_		(pcx_scache0_data_x_l[129:0]), 
		.scan_in			(bfd0_scanin), 
		.scan_out			(bfd0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_1), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_1), 
		.ccx_aclk			(ccx_aclk_bfd_1), 
		.ccx_bclk			(ccx_bclk_bfd_1));
	pcx_ob1_dp ob_0(
		.pcx_sctag_data_px2		(pcx_sctag0_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag0_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd1(
		.pcx_sctag_data_px2		
		(pcx_sctag1_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_1), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_1), 
		.ccx_aclk_out			(ccx_aclk_bfd_1), 
		.ccx_bclk_out			(ccx_bclk_bfd_1), 
		.pcx_scache_data_px_		(pcx_scache1_data_x_l[129:0]), 
		.scan_in			(bfd1_scanin), 
		.scan_out			(bfd1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	pcx_ob1_dp ob_1(
		.pcx_sctag_data_px2		(pcx_sctag1_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag1_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd2(
		.pcx_sctag_data_px2		
		(pcx_sctag2_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_lb), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_lb), 
		.ccx_aclk_out			(ccx_aclk_bfd_lb), 
		.ccx_bclk_out			(ccx_bclk_bfd_lb), 
		.pcx_scache_data_px_		(pcx_scache2_data_x_l[129:0]), 
		.scan_in			(bfd2_scanin), 
		.scan_out			(bfd2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_3), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_3), 
		.ccx_aclk			(ccx_aclk_bfd_3), 
		.ccx_bclk			(ccx_bclk_bfd_3));
	pcx_ob1_dp ob_2(
		.pcx_sctag_data_px2		(pcx_sctag2_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag2_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd3(
		.pcx_sctag_data_px2		
		(pcx_sctag3_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_3), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_3), 
		.ccx_aclk_out			(ccx_aclk_bfd_3), 
		.ccx_bclk_out			(ccx_bclk_bfd_3), 
		.pcx_scache_data_px_		(pcx_scache3_data_x_l[129:0]), 
		.scan_in			(bfd3_scanin), 
		.scan_out			(bfd3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	pcx_ob1_dp ob_3(
		.pcx_sctag_data_px2		(pcx_sctag3_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag3_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd4(
		.pcx_sctag_data_px2		
		(pcx_sctag4_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_rt), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_rt), 
		.ccx_aclk_out			(ccx_aclk_bfd_rt), 
		.ccx_bclk_out			(ccx_bclk_bfd_rt), 
		.pcx_scache_data_px_		(pcx_scache4_data_x_l[129:0]), 
		.scan_in			(bfd4_scanin), 
		.scan_out			(bfd4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_5), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_5), 
		.ccx_aclk			(ccx_aclk_bfd_5), 
		.ccx_bclk			(ccx_bclk_bfd_5));
	pcx_ob1_dp ob_4(
		.pcx_sctag_data_px2		(pcx_sctag4_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag4_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd5(
		.pcx_sctag_data_px2		
		(pcx_sctag5_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_5), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_5), 
		.ccx_aclk_out			(ccx_aclk_bfd_5), 
		.ccx_bclk_out			(ccx_bclk_bfd_5), 
		.pcx_scache_data_px_		(pcx_scache5_data_x_l[129:0]), 
		.scan_in			(bfd5_scanin), 
		.scan_out			(bfd5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	pcx_ob1_dp ob_5(
		.pcx_sctag_data_px2		(pcx_sctag5_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag5_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd6(
		.pcx_sctag_data_px2		
		(pcx_sctag6_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_rb), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_rb), 
		.ccx_aclk_out			(ccx_aclk_bfd_rb), 
		.ccx_bclk_out			(ccx_bclk_bfd_rb), 
		.pcx_scache_data_px_		(pcx_scache6_data_x_l[129:0]), 
		.scan_in			(bfd6_scanin), 
		.scan_out			(bfd6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_7), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_7), 
		.ccx_aclk			(ccx_aclk_bfd_7), 
		.ccx_bclk			(ccx_bclk_bfd_7));
	pcx_ob1_dp ob_6(
		.pcx_sctag_data_px2		(pcx_sctag6_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag6_data_px2_prebuf[129:0]));
	pcx_bfd_dp bfd7(
		.pcx_sctag_data_px2		
		(pcx_sctag7_data_px2_prebuf[129:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_7), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_7), 
		.ccx_aclk_out			(ccx_aclk_bfd_7), 
		.ccx_bclk_out			(ccx_bclk_bfd_7), 
		.pcx_scache_data_px_		(pcx_scache7_data_x_l[129:0]), 
		.scan_in			(bfd7_scanin), 
		.scan_out			(bfd7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	pcx_ob1_dp ob_7(
		.pcx_sctag_data_px2		(pcx_sctag7_data_px2[129:0]), 
		.pcx_sctag_data_px2_prebuf	
		(pcx_sctag7_data_px2_prebuf[129:0]));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc0(
		.din				({sctag0_pcx_stall_pq_d1,
		spc0_pcx_req_pq_l_0[8:0], spc0_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag0_pcx_stall_lq_d1,
		spc0_pcx_req_lq[8:0], spc0_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc1(
		.din				({sctag1_pcx_stall_pq_d1,
		spc1_pcx_req_pq_l_0[8:0], spc1_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag1_pcx_stall_lq_d1,
		spc1_pcx_req_lq[8:0], spc1_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_20 i_bufq_l_spc2(
		.din				({io_pcx_stall_pq_d1,
		sctag2_pcx_stall_pq_d1, spc2_pcx_req_pq_l_0[8:0],
		spc2_pcx_atm_pq_l_0[8:0]}), 
		.dout				({io_pcx_stall_lq_d1,
		sctag2_pcx_stall_lq_d1, spc2_pcx_req_lq[8:0],
		spc2_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc3(
		.din				({sctag3_pcx_stall_pq_d1,
		spc3_pcx_req_pq_l_0[8:0], spc3_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag3_pcx_stall_lq_d1,
		spc3_pcx_req_lq[8:0], spc3_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc4(
		.din				({sctag4_pcx_stall_pq_d1,
		spc4_pcx_req_pq_l_0[8:0], spc4_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag4_pcx_stall_lq_d1,
		spc4_pcx_req_lq[8:0], spc4_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc5(
		.din				({sctag5_pcx_stall_pq_d1,
		spc5_pcx_req_pq_l_0[8:0], spc5_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag5_pcx_stall_lq_d1,
		spc5_pcx_req_lq[8:0], spc5_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc6(
		.din				({sctag6_pcx_stall_pq_d1,
		spc6_pcx_req_pq_l_0[8:0], spc6_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag6_pcx_stall_lq_d1,
		spc6_pcx_req_lq[8:0], spc6_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_l_spc7(
		.din				({sctag7_pcx_stall_pq_d1,
		spc7_pcx_req_pq_l_0[8:0], spc7_pcx_atm_pq_l_0[8:0]}), 
		.dout				({sctag7_pcx_stall_lq_d1,
		spc7_pcx_req_lq[8:0], spc7_pcx_atm_lq[8:0]}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lt(
		.din				({ccx_aclk_bfd_lt,
		ccx_bclk_bfd_lt, tcu_pce_ov_bfd_lt, tcu_scan_en_bfd_lt}), 
		.dout				({ccx_aclk_arb_lt,
		ccx_bclk_arb_lt, tcu_pce_ov_arb_lt, tcu_scan_en_arb_lt}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lb(
		.din				({ccx_aclk_bfd_lb,
		ccx_bclk_bfd_lb, tcu_pce_ov_bfd_lb, tcu_scan_en_bfd_lb}), 
		.dout				({ccx_aclk_arb_lb,
		ccx_bclk_arb_lb, tcu_pce_ov_arb_lb, tcu_scan_en_arb_lb}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rt(
		.din				({ccx_aclk_bfd_rt,
		ccx_bclk_bfd_rt, tcu_pce_ov_bfd_rt, tcu_scan_en_bfd_rt}), 
		.dout				({ccx_aclk_arb_rt,
		ccx_bclk_arb_rt, tcu_pce_ov_arb_rt, tcu_scan_en_arb_rt}));
	buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rb(
		.din				({ccx_aclk_bfd_rb,
		ccx_bclk_bfd_rb, tcu_pce_ov_bfd_rb, tcu_scan_en_bfd_rb}), 
		.dout				({ccx_aclk_arb_rb,
		ccx_bclk_arb_rb, tcu_pce_ov_arb_rb, tcu_scan_en_arb_rb}));
	ccx_arb pcx_arbl0(
		.arb_grant_a			(arb0_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb0_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb0_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb0_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb0_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[0]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[0]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[0]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[0]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[0]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[0]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[0]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[0]), 
		.arb_src8_grant_a		(arb0_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag0_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag0_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[0]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[0]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[0]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[0]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[0]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[0]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[0]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[0]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[0]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[0]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[0]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[0]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[0]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[0]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[0]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[0]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag0_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl0_scanin), 
		.scan_out			(pcx_arbl0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb pcx_arbl1(
		.arb_grant_a			(arb1_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb1_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb1_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb1_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb1_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[1]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[1]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[1]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[1]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[1]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[1]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[1]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[1]), 
		.arb_src8_grant_a		(arb1_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag1_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag1_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[1]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[1]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[1]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[1]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[1]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[1]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[1]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[1]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[1]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[1]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[1]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[1]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[1]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[1]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[1]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[1]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag1_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl1_scanin), 
		.scan_out			(pcx_arbl1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb pcx_arbl2(
		.arb_grant_a			(arb2_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb2_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb2_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb2_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb2_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[2]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[2]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[2]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[2]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[2]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[2]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[2]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[2]), 
		.arb_src8_grant_a		(arb2_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag2_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag2_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[2]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[2]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[2]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[2]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[2]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[2]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[2]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[2]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[2]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[2]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[2]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[2]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[2]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[2]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[2]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[2]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag2_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl2_scanin), 
		.scan_out			(pcx_arbl2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb pcx_arbl3(
		.arb_grant_a			(arb3_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb3_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb3_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb3_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb3_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[3]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[3]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[3]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[3]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[3]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[3]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[3]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[3]), 
		.arb_src8_grant_a		(arb3_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag3_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag3_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[3]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[3]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[3]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[3]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[3]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[3]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[3]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[3]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[3]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[3]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[3]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[3]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[3]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[3]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[3]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[3]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag3_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl3_scanin), 
		.scan_out			(pcx_arbl3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb pcx_arbl4(
		.arb_grant_a			(arb4_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb4_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb4_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb4_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb4_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[4]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[4]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[4]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[4]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[4]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[4]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[4]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[4]), 
		.arb_src8_grant_a		(arb4_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag4_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag4_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[4]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[4]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[4]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[4]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[4]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[4]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[4]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[4]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[4]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[4]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[4]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[4]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[4]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[4]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[4]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[4]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag4_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl4_scanin), 
		.scan_out			(pcx_arbl4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb pcx_arbl5(
		.arb_grant_a			(arb5_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb5_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb5_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb5_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb5_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[5]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[5]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[5]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[5]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[5]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[5]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[5]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[5]), 
		.arb_src8_grant_a		(arb5_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag5_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag5_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[5]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[5]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[5]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[5]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[5]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[5]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[5]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[5]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[5]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[5]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[5]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[5]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[5]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[5]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[5]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[5]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag5_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl5_scanin), 
		.scan_out			(pcx_arbl5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb pcx_arbl6(
		.arb_grant_a			(arb6_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb6_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb6_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb6_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb6_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[6]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[6]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[6]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[6]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[6]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[6]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[6]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[6]), 
		.arb_src8_grant_a		(arb6_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag6_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag6_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[6]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[6]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[6]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[6]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[6]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[6]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[6]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[6]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[6]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[6]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[6]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[6]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[6]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[6]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[6]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[6]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag6_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl6_scanin), 
		.scan_out			(pcx_arbl6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb pcx_arbl7(
		.arb_grant_a			(arb7_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb7_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb7_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb7_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb7_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[7]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[7]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[7]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[7]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[7]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[7]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[7]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[7]), 
		.arb_src8_grant_a		(arb7_src8_grant_l_unused), 
		.ccx_dest_atom_a		(pcx_sctag7_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag7_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[7]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[7]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[7]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[7]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[7]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[7]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[7]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[7]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[7]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[7]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[7]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[7]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[7]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[7]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[7]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[7]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag7_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl7_scanin), 
		.scan_out			(pcx_arbl7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb pcx_arbl8(
		.arb_grant_a			(arb8_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb8_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb8_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb8_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb8_shift_l_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a[8]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a[8]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a[8]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a[8]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a_unused[8]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a_unused[8]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a_unused[8]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a_unused[8]), 
		.arb_src8_grant_a		(arb8_src8_grant_l_unused), 
		.ccx_dest_atom_a		(arb8_dest_atom_l_unused), 
		.ccx_dest_data_rdy_a		(pcx_fpio_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_lq[8]), 
		.src0_arb_req_q			(spc0_pcx_req_lq[8]), 
		.src1_arb_atom_q		(spc1_pcx_atm_lq[8]), 
		.src1_arb_req_q			(spc1_pcx_req_lq[8]), 
		.src2_arb_atom_q		(spc2_pcx_atm_lq[8]), 
		.src2_arb_req_q			(spc2_pcx_req_lq[8]), 
		.src3_arb_atom_q		(spc3_pcx_atm_lq[8]), 
		.src3_arb_req_q			(spc3_pcx_req_lq[8]), 
		.src4_arb_atom_q		(spc4_pcx_atm_lq[8]), 
		.src4_arb_req_q			(spc4_pcx_req_lq[8]), 
		.src5_arb_atom_q		(spc5_pcx_atm_lq[8]), 
		.src5_arb_req_q			(spc5_pcx_req_lq[8]), 
		.src6_arb_atom_q		(spc6_pcx_atm_lq[8]), 
		.src6_arb_req_q			(spc6_pcx_req_lq[8]), 
		.src7_arb_atom_q		(spc7_pcx_atm_lq[8]), 
		.src7_arb_req_q			(spc7_pcx_req_lq[8]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(io_pcx_stall_lq_d1), 
		.scan_in			(pcx_arbl8_scanin), 
		.scan_out			(pcx_arbl8_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc0(
		.din				({sctag0_pcx_stall_pq_d1,
		spc0_pcx_req_pq_r_0[8:0], spc0_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag0_pcx_stall_rq_d1,
		spc0_pcx_req_rq[8:0], spc0_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc1(
		.din				({sctag1_pcx_stall_pq_d1,
		spc1_pcx_req_pq_r_0[8:0], spc1_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag1_pcx_stall_rq_d1,
		spc1_pcx_req_rq[8:0], spc1_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_20 i_bufq_r_spc2(
		.din				({io_pcx_stall_pq_d1,
		sctag2_pcx_stall_pq_d1, spc2_pcx_req_pq_r_0[8:0],
		spc2_pcx_atm_pq_r_0[8:0]}), 
		.dout				({io_pcx_stall_rq_d1,
		sctag2_pcx_stall_rq_d1, spc2_pcx_req_rq[8:0],
		spc2_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc3(
		.din				({sctag3_pcx_stall_pq_d1,
		spc3_pcx_req_pq_r_0[8:0], spc3_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag3_pcx_stall_rq_d1,
		spc3_pcx_req_rq[8:0], spc3_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc4(
		.din				({sctag4_pcx_stall_pq_d1,
		spc4_pcx_req_pq_r_0[8:0], spc4_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag4_pcx_stall_rq_d1,
		spc4_pcx_req_rq[8:0], spc4_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc5(
		.din				({sctag5_pcx_stall_pq_d1,
		spc5_pcx_req_pq_r_0[8:0], spc5_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag5_pcx_stall_rq_d1,
		spc5_pcx_req_rq[8:0], spc5_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc6(
		.din				({sctag6_pcx_stall_pq_d1,
		spc6_pcx_req_pq_r_0[8:0], spc6_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag6_pcx_stall_rq_d1,
		spc6_pcx_req_rq[8:0], spc6_pcx_atm_rq[8:0]}));
	buff_macro__dbuff_48x__rep_1__stack_20r__width_19 i_bufq_r_spc7(
		.din				({sctag7_pcx_stall_pq_d1,
		spc7_pcx_req_pq_r_0[8:0], spc7_pcx_atm_pq_r_0[8:0]}), 
		.dout				({sctag7_pcx_stall_rq_d1,
		spc7_pcx_req_rq[8:0], spc7_pcx_atm_rq[8:0]}));
	ccx_arb pcx_arbr0(
		.arb_grant_a			(arb0_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb0_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb0_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb0_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb0_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[0]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[0]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[0]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[0]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[0]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[0]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[0]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[0]), 
		.arb_src8_grant_a		(arb0_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag0_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag0_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[0]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[0]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[0]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[0]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[0]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[0]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[0]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[0]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[0]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[0]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[0]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[0]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[0]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[0]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[0]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[0]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag0_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr0_scanin), 
		.scan_out			(pcx_arbr0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb pcx_arbr1(
		.arb_grant_a			(arb1_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb1_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb1_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb1_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb1_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[1]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[1]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[1]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[1]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[1]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[1]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[1]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[1]), 
		.arb_src8_grant_a		(arb1_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag1_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag1_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[1]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[1]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[1]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[1]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[1]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[1]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[1]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[1]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[1]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[1]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[1]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[1]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[1]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[1]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[1]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[1]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag1_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr1_scanin), 
		.scan_out			(pcx_arbr1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb pcx_arbr2(
		.arb_grant_a			(arb2_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb2_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb2_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb2_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb2_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[2]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[2]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[2]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[2]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[2]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[2]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[2]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[2]), 
		.arb_src8_grant_a		(arb2_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag2_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag2_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[2]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[2]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[2]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[2]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[2]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[2]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[2]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[2]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[2]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[2]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[2]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[2]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[2]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[2]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[2]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[2]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag2_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr2_scanin), 
		.scan_out			(pcx_arbr2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb pcx_arbr3(
		.arb_grant_a			(arb3_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb3_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb3_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb3_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb3_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[3]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[3]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[3]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[3]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[3]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[3]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[3]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[3]), 
		.arb_src8_grant_a		(arb3_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag3_atm_a_unused), 
		.ccx_dest_data_rdy_a		(pcx_sctag3_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[3]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[3]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[3]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[3]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[3]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[3]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[3]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[3]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[3]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[3]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[3]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[3]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[3]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[3]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[3]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[3]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag3_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr3_scanin), 
		.scan_out			(pcx_arbr3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb pcx_arbr4(
		.arb_grant_a			(arb4_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb4_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb4_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb4_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb4_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[4]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[4]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[4]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[4]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[4]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[4]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[4]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[4]), 
		.arb_src8_grant_a		(arb4_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag4_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag4_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[4]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[4]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[4]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[4]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[4]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[4]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[4]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[4]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[4]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[4]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[4]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[4]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[4]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[4]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[4]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[4]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag4_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr4_scanin), 
		.scan_out			(pcx_arbr4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb pcx_arbr5(
		.arb_grant_a			(arb5_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb5_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb5_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb5_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb5_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[5]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[5]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[5]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[5]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[5]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[5]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[5]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[5]), 
		.arb_src8_grant_a		(arb5_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag5_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag5_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[5]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[5]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[5]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[5]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[5]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[5]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[5]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[5]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[5]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[5]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[5]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[5]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[5]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[5]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[5]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[5]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag5_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr5_scanin), 
		.scan_out			(pcx_arbr5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb pcx_arbr6(
		.arb_grant_a			(arb6_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb6_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb6_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb6_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb6_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[6]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[6]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[6]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[6]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[6]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[6]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[6]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[6]), 
		.arb_src8_grant_a		(arb6_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag6_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag6_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[6]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[6]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[6]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[6]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[6]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[6]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[6]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[6]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[6]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[6]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[6]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[6]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[6]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[6]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[6]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[6]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag6_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr6_scanin), 
		.scan_out			(pcx_arbr6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb pcx_arbr7(
		.arb_grant_a			(arb7_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb7_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb7_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb7_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb7_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[7]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[7]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[7]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[7]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[7]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[7]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[7]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[7]), 
		.arb_src8_grant_a		(arb7_src8_grant_r_unused), 
		.ccx_dest_atom_a		(pcx_sctag7_atm_a), 
		.ccx_dest_data_rdy_a		(pcx_sctag7_data_rdy_a), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[7]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[7]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[7]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[7]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[7]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[7]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[7]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[7]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[7]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[7]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[7]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[7]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[7]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[7]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[7]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[7]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(sctag7_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr7_scanin), 
		.scan_out			(pcx_arbr7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb pcx_arbr8(
		.arb_grant_a			(arb8_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb8_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb8_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb8_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb8_shift_r_a[8:0]), 
		.arb_src0_grant_a		(pcx_spc0_grant_a_unused[8]), 
		.arb_src1_grant_a		(pcx_spc1_grant_a_unused[8]), 
		.arb_src2_grant_a		(pcx_spc2_grant_a_unused[8]), 
		.arb_src3_grant_a		(pcx_spc3_grant_a_unused[8]), 
		.arb_src4_grant_a		(pcx_spc4_grant_a[8]), 
		.arb_src5_grant_a		(pcx_spc5_grant_a[8]), 
		.arb_src6_grant_a		(pcx_spc6_grant_a[8]), 
		.arb_src7_grant_a		(pcx_spc7_grant_a[8]), 
		.arb_src8_grant_a		(arb8_src8_grant_r_unused), 
		.ccx_dest_atom_a		(arb8_dest_atom_r_unused), 
		.ccx_dest_data_rdy_a		(pcx_fpio_data_rdy_a_unused), 
		.src0_arb_atom_q		(spc0_pcx_atm_rq[8]), 
		.src0_arb_req_q			(spc0_pcx_req_rq[8]), 
		.src1_arb_atom_q		(spc1_pcx_atm_rq[8]), 
		.src1_arb_req_q			(spc1_pcx_req_rq[8]), 
		.src2_arb_atom_q		(spc2_pcx_atm_rq[8]), 
		.src2_arb_req_q			(spc2_pcx_req_rq[8]), 
		.src3_arb_atom_q		(spc3_pcx_atm_rq[8]), 
		.src3_arb_req_q			(spc3_pcx_req_rq[8]), 
		.src4_arb_atom_q		(spc4_pcx_atm_rq[8]), 
		.src4_arb_req_q			(spc4_pcx_req_rq[8]), 
		.src5_arb_atom_q		(spc5_pcx_atm_rq[8]), 
		.src5_arb_req_q			(spc5_pcx_req_rq[8]), 
		.src6_arb_atom_q		(spc6_pcx_atm_rq[8]), 
		.src6_arb_req_q			(spc6_pcx_req_rq[8]), 
		.src7_arb_atom_q		(spc7_pcx_atm_rq[8]), 
		.src7_arb_req_q			(spc7_pcx_req_rq[8]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(1'b0), 
		.stall_q_d1			(io_pcx_stall_rq_d1), 
		.scan_in			(pcx_arbr8_scanin), 
		.scan_out			(pcx_arbr8_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
endmodule
`endcelldefine

module buff_macro__dbuff_48x__rep_1__stack_20r__width_19(din, dout);

        input   [18:0]          din;
        output  [18:0]          dout;

        buff #(19) d0_0(
                .in                             (din[18:0]),
                .out                            (dout[18:0]));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_none__width_4(din, dout);

        input   [3:0]           din;
        output  [3:0]           dout;

        buff #(4) d0_0(
                .in                             (din[3:0]),
                .out                            (dout[3:0]));
endmodule
module buff_macro__dbuff_40x__rep_1__stack_130c__width_130(din, dout);

        input   [129:0]         din;
        output  [129:0]         dout;

        buff #(130) d0_0(
                .in                             (din[129:0]),
                .out                            (dout[129:0]));
endmodule


module buff_macro__dbuff_48x__rep_1__stack_none__width_18(din, dout);

        input   [17:0]          din;
        output  [17:0]          dout;

        buff #(18) d0_0(
                .in                             (din[17:0]),
                .out                            (dout[17:0]));
endmodule

module buff_macro__dbuff_16x__rep_1__stack_none__width_1(din, dout);

        input   [0:0]           din;
        output  [0:0]           dout;

        buff #(1) d0_0(
                .in                             (din[0]),
                .out                            (dout[0]));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_none__width_2(din, dout);

        input   [1:0]           din;
        output  [1:0]           dout;

        buff #(2) d0_0(
                .in                             (din[1:0]),
                .out                            (dout[1:0]));
endmodule

module buff_macro__dbuff_48x__rep_1__stack_20r__width_20(din, dout);

        input   [19:0]          din;
        output  [19:0]          dout;

        buff #(20) d0_0(
                .in                             (din[19:0]),
                .out                            (dout[19:0]));
endmodule


module buff_macro__dbuff_32x__rep_1__stack_150c__width_130(din, dout);

        input   [129:0]         din;
        output  [129:0]         dout;

        buff #(130) d0_0(
                .in                             (din[129:0]),
                .out                            (dout[129:0]));
endmodule





`endif // `ifdef FPGA

