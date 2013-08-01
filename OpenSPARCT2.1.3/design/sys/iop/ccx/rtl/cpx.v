// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: cpx.v
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
module cpx (
  cpx_io_grant_cx, 
  cpx_sctag0_grant_cx, 
  cpx_sctag1_grant_cx, 
  cpx_sctag2_grant_cx, 
  cpx_sctag3_grant_cx, 
  cpx_sctag4_grant_cx, 
  cpx_sctag5_grant_cx, 
  cpx_sctag6_grant_cx, 
  cpx_sctag7_grant_cx, 
  cpx_spc0_data_cx2, 
  cpx_spc1_data_cx2, 
  cpx_spc2_data_cx2, 
  cpx_spc3_data_cx2, 
  cpx_spc4_data_cx2, 
  cpx_spc5_data_cx2, 
  cpx_spc6_data_cx2, 
  cpx_spc7_data_cx2, 
  io_cpx_data_ca, 
  io_cpx_req_cq, 
  sctag0_cpx_atom_cq, 
  sctag0_cpx_data_ca, 
  sctag0_cpx_req_cq, 
  sctag1_cpx_atom_cq, 
  sctag1_cpx_data_ca, 
  sctag1_cpx_req_cq, 
  sctag2_cpx_atom_cq, 
  sctag2_cpx_data_ca, 
  sctag2_cpx_req_cq, 
  sctag3_cpx_atom_cq, 
  sctag3_cpx_data_ca, 
  sctag3_cpx_req_cq, 
  sctag4_cpx_atom_cq, 
  sctag4_cpx_data_ca, 
  sctag4_cpx_req_cq, 
  sctag5_cpx_atom_cq, 
  sctag5_cpx_data_ca, 
  sctag5_cpx_req_cq, 
  sctag6_cpx_atom_cq, 
  sctag6_cpx_data_ca, 
  sctag6_cpx_req_cq, 
  sctag7_cpx_atom_cq, 
  sctag7_cpx_data_ca, 
  sctag7_cpx_req_cq, 
  tcu_scan_en, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  ccx_aclk, 
  ccx_bclk, 
  scan_out);
wire [7:0] cpx_sctag0_grant_a;
wire [7:0] cpx_sctag0_grant_a_0;
wire [7:0] cpx_sctag1_grant_a;
wire [7:0] cpx_sctag1_grant_a_0;
wire [7:0] cpx_sctag2_grant_a;
wire [7:0] cpx_sctag2_grant_a_0;
wire [7:0] cpx_sctag3_grant_a;
wire [7:0] cpx_sctag3_grant_a_0;
wire [7:0] cpx_sctag4_grant_a;
wire [7:0] cpx_sctag4_grant_a_0;
wire [7:0] cpx_sctag5_grant_a;
wire [7:0] cpx_sctag5_grant_a_0;
wire [7:0] cpx_sctag6_grant_a;
wire [7:0] cpx_sctag6_grant_a_0;
wire [7:0] cpx_sctag7_grant_a;
wire [7:0] cpx_sctag7_grant_a_0;
wire [7:0] cpx_io_grant_a;
wire [7:0] cpx_io_grant_a_0;
wire tcu_scan_en_bfg_0;
wire tcu_pce_ov_bfg_0;
wire ccx_aclk_bfg_0;
wire ccx_bclk_bfg_0;
wire bfg0_scanin;
wire bfg0_scanout;
wire tcu_scan_en_bfd_lt;
wire tcu_pce_ov_bfd_lt;
wire ccx_aclk_bfd_lt;
wire ccx_bclk_bfd_lt;
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
wire tcu_scan_en_bfg_2_unused;
wire tcu_pce_ov_bfg_2_unused;
wire ccx_aclk_bfg_2_unused;
wire ccx_bclk_bfg_2_unused;
wire bfg2_scanin;
wire bfg2_scanout;
wire tcu_scan_en_bfd_lb;
wire tcu_pce_ov_bfd_lb;
wire ccx_aclk_bfd_lb;
wire ccx_bclk_bfd_lb;
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
wire tcu_scan_en_bfg_4_unused;
wire tcu_pce_ov_bfg_4_unused;
wire ccx_aclk_bfg_4_unused;
wire ccx_bclk_bfg_4_unused;
wire bfg4_scanin;
wire bfg4_scanout;
wire tcu_scan_en_bfd_rt;
wire tcu_pce_ov_bfd_rt;
wire ccx_aclk_bfd_rt;
wire ccx_bclk_bfd_rt;
wire tcu_scan_en_bfg_5_unused;
wire tcu_pce_ov_bfg_5_unused;
wire ccx_aclk_bfg_5_unused;
wire ccx_bclk_bfg_5_unused;
wire bfg5_scanin;
wire bfg5_scanout;
wire tcu_scan_en_bfg_6_unused;
wire tcu_pce_ov_bfg_6_unused;
wire ccx_aclk_bfg_6_unused;
wire ccx_bclk_bfg_6_unused;
wire bfg6_scanin;
wire bfg6_scanout;
wire tcu_scan_en_bfd_rb;
wire tcu_pce_ov_bfd_rb;
wire ccx_aclk_bfd_rb;
wire ccx_bclk_bfd_rb;
wire tcu_scan_en_bfg_7_unused;
wire tcu_pce_ov_bfg_7_unused;
wire ccx_aclk_bfg_7_unused;
wire ccx_bclk_bfg_7_unused;
wire bfg7_scanin;
wire bfg7_scanout;
wire tcu_scan_en_bfg_8_unused;
wire tcu_pce_ov_bfg_8_unused;
wire ccx_aclk_bfg_8_unused;
wire ccx_bclk_bfg_8_unused;
wire bfg8_scanin;
wire bfg8_scanout;
wire [145:0] io_cpx_data_ca_buf;
wire [145:0] io_cpx_data_ca_d1_;
wire tcu_scan_en_bfd_io_unused;
wire tcu_pce_ov_bfd_io_unused;
wire ccx_aclk_bfd_io_unused;
wire ccx_bclk_bfd_io_unused;
wire bfd_io_scanin;
wire bfd_io_scanout;
wire [7:0] sctag0_cpx_req_cq_0_l;
wire sctag0_cpx_atom_cq_0_l;
wire [7:0] sctag0_cpx_req_cq_0_r;
wire sctag0_cpx_atom_cq_0_r;
wire [7:0] sctag1_cpx_req_cq_0_l;
wire sctag1_cpx_atom_cq_0_l;
wire [7:0] sctag1_cpx_req_cq_0_r;
wire sctag1_cpx_atom_cq_0_r;
wire [7:0] sctag2_cpx_req_cq_0_l;
wire sctag2_cpx_atom_cq_0_l;
wire [7:0] sctag2_cpx_req_cq_0_r;
wire sctag2_cpx_atom_cq_0_r;
wire [7:0] sctag3_cpx_req_cq_0_l;
wire sctag3_cpx_atom_cq_0_l;
wire [7:0] sctag3_cpx_req_cq_0_r;
wire sctag3_cpx_atom_cq_0_r;
wire [7:0] sctag4_cpx_req_cq_0_l;
wire sctag4_cpx_atom_cq_0_l;
wire [7:0] sctag4_cpx_req_cq_0_r;
wire sctag4_cpx_atom_cq_0_r;
wire [7:0] sctag5_cpx_req_cq_0_l;
wire sctag5_cpx_atom_cq_0_l;
wire [7:0] sctag5_cpx_req_cq_0_r;
wire sctag5_cpx_atom_cq_0_r;
wire [7:0] sctag6_cpx_req_cq_0_l;
wire sctag6_cpx_atom_cq_0_l;
wire [7:0] sctag6_cpx_req_cq_0_r;
wire sctag6_cpx_atom_cq_0_r;
wire [7:0] sctag7_cpx_req_cq_0_l;
wire sctag7_cpx_atom_cq_0_l;
wire [7:0] sctag7_cpx_req_cq_0_r;
wire sctag7_cpx_atom_cq_0_r;
wire [7:0] io_cpx_req_cq_buf;
wire [7:0] io_cpx_req_cq_d1;
wire tcu_scan_en_bfg_req_8_unused;
wire tcu_pce_ov_bfg_req_8_unused;
wire ccx_aclk_bfg_req_8_unused;
wire ccx_bclk_bfg_req_8_unused;
wire bfg8_req_scanin;
wire bfg8_req_scanout;
wire [149:0] sctag0_cpx_data_a_;
wire [149:0] sctag0_cpx_data_a;
wire [149:0] sctag1_cpx_data_a_;
wire [149:0] sctag1_cpx_data_a;
wire [149:0] sctag2_cpx_data_a_;
wire [149:0] sctag2_cpx_data_a;
wire [149:0] sctag3_cpx_data_a_;
wire [149:0] sctag3_cpx_data_a;
wire [149:0] sctag4_cpx_data_a_;
wire [149:0] sctag4_cpx_data_a;
wire [149:0] sctag5_cpx_data_a_;
wire [149:0] sctag5_cpx_data_a;
wire [149:0] sctag6_cpx_data_a_;
wire [149:0] sctag6_cpx_data_a;
wire [149:0] sctag7_cpx_data_a_;
wire [149:0] sctag7_cpx_data_a;
wire [149:0] io_cpx_data_a_;
wire [149:0] io_cpx_data_a;
wire ccx_aclk_dpa_t;
wire ccx_bclk_dpa_t;
wire tcu_pce_ov_dpa_t;
wire tcu_scan_en_dpa_t;
wire ccx_aclk_dpa_b;
wire ccx_bclk_dpa_b;
wire tcu_pce_ov_dpa_b;
wire tcu_scan_en_dpa_b;
wire [3:0] cpx_spc0_data_x_unused;
wire [149:0] cpx_spc0_data_x_;
wire [3:0] cpx_spc1_data_x_unused;
wire [149:0] cpx_spc1_data_x_;
wire [3:0] cpx_spc2_data_x_unused;
wire [149:0] cpx_spc2_data_x_;
wire [3:0] cpx_spc3_data_x_unused;
wire [149:0] cpx_spc3_data_x_;
wire [3:0] cpx_spc4_data_x_unused;
wire [149:0] cpx_spc4_data_x_;
wire [3:0] cpx_spc5_data_x_unused;
wire [149:0] cpx_spc5_data_x_;
wire [3:0] cpx_spc6_data_x_unused;
wire [149:0] cpx_spc6_data_x_;
wire [3:0] cpx_spc7_data_x_unused;
wire [149:0] cpx_spc7_data_x_;
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
wire cpx_dpa_scanin;
wire cpx_dpa_scanout;
wire [145:0] cpx_spc0_data_cx2_prebuf;
wire bfd0_scanin;
wire bfd0_scanout;
wire tcu_scan_en_bfd_1;
wire tcu_pce_ov_bfd_1;
wire ccx_aclk_bfd_1;
wire ccx_bclk_bfd_1;
wire [145:0] cpx_spc1_data_cx2_prebuf;
wire bfd1_scanin;
wire bfd1_scanout;
wire [145:0] cpx_spc2_data_cx2_prebuf;
wire bfd2_scanin;
wire bfd2_scanout;
wire tcu_scan_en_bfd_3;
wire tcu_pce_ov_bfd_3;
wire ccx_aclk_bfd_3;
wire ccx_bclk_bfd_3;
wire [145:0] cpx_spc3_data_cx2_prebuf;
wire bfd3_scanin;
wire bfd3_scanout;
wire [145:0] cpx_spc4_data_cx2_prebuf;
wire bfd4_scanin;
wire bfd4_scanout;
wire tcu_scan_en_bfd_5;
wire tcu_pce_ov_bfd_5;
wire ccx_aclk_bfd_5;
wire ccx_bclk_bfd_5;
wire [145:0] cpx_spc5_data_cx2_prebuf;
wire bfd5_scanin;
wire bfd5_scanout;
wire [145:0] cpx_spc6_data_cx2_prebuf;
wire bfd6_scanin;
wire bfd6_scanout;
wire tcu_scan_en_bfd_7;
wire tcu_pce_ov_bfd_7;
wire ccx_aclk_bfd_7;
wire ccx_bclk_bfd_7;
wire [145:0] cpx_spc7_data_cx2_prebuf;
wire bfd7_scanin;
wire bfd7_scanout;
wire [7:0] sctag0_cpx_req_lq;
wire sctag0_cpx_atom_lq_t;
wire sctag0_cpx_atom_lq_b;
wire [7:0] sctag1_cpx_req_lq;
wire sctag1_cpx_atom_lq_t;
wire sctag1_cpx_atom_lq_b;
wire [7:0] sctag2_cpx_req_lq;
wire sctag2_cpx_atom_lq_t;
wire sctag2_cpx_atom_lq_b;
wire [7:0] sctag3_cpx_req_lq;
wire sctag3_cpx_atom_lq_t;
wire sctag3_cpx_atom_lq_b;
wire [7:0] sctag4_cpx_req_lq;
wire sctag4_cpx_atom_lq_t;
wire sctag4_cpx_atom_lq_b;
wire [7:0] sctag5_cpx_req_lq;
wire sctag5_cpx_atom_lq_t;
wire sctag5_cpx_atom_lq_b;
wire [7:0] sctag6_cpx_req_lq;
wire sctag6_cpx_atom_lq_t;
wire sctag6_cpx_atom_lq_b;
wire [7:0] sctag7_cpx_req_lq;
wire sctag7_cpx_atom_lq_t;
wire sctag7_cpx_atom_lq_b;
wire [7:0] io_cpx_req_lq;
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
wire [7:0] cpx_sctag4_grant_a_unused;
wire [7:0] cpx_sctag5_grant_a_unused;
wire [7:0] cpx_sctag6_grant_a_unused;
wire [7:0] cpx_sctag7_grant_a_unused;
wire [7:0] ccx_dest_atom_a_l_unused;
wire [7:0] ccx_dest_data_rdy_a_l_unused;
wire cpx_arbl0_scanin;
wire cpx_arbl0_scanout;
wire cpx_arbl1_scanin;
wire cpx_arbl1_scanout;
wire cpx_arbl2_scanin;
wire cpx_arbl2_scanout;
wire cpx_arbl3_scanin;
wire cpx_arbl3_scanout;
wire cpx_arbl4_scanin;
wire cpx_arbl4_scanout;
wire cpx_arbl5_scanin;
wire cpx_arbl5_scanout;
wire cpx_arbl6_scanin;
wire cpx_arbl6_scanout;
wire cpx_arbl7_scanin;
wire cpx_arbl7_scanout;
wire [7:0] sctag0_cpx_req_rq;
wire sctag0_cpx_atom_rq_t;
wire sctag0_cpx_atom_rq_b;
wire [7:0] sctag1_cpx_req_rq;
wire sctag1_cpx_atom_rq_t;
wire sctag1_cpx_atom_rq_b;
wire [7:0] sctag2_cpx_req_rq;
wire sctag2_cpx_atom_rq_t;
wire sctag2_cpx_atom_rq_b;
wire [7:0] sctag3_cpx_req_rq;
wire sctag3_cpx_atom_rq_t;
wire sctag3_cpx_atom_rq_b;
wire [7:0] sctag4_cpx_req_rq;
wire sctag4_cpx_atom_rq_t;
wire sctag4_cpx_atom_rq_b;
wire [7:0] sctag5_cpx_req_rq;
wire sctag5_cpx_atom_rq_t;
wire sctag5_cpx_atom_rq_b;
wire [7:0] sctag6_cpx_req_rq;
wire sctag6_cpx_atom_rq_t;
wire sctag6_cpx_atom_rq_b;
wire [7:0] sctag7_cpx_req_rq;
wire sctag7_cpx_atom_rq_t;
wire sctag7_cpx_atom_rq_b;
wire [7:0] io_cpx_req_rq;
wire [7:0] cpx_sctag0_grant_a_unused;
wire [7:0] cpx_sctag1_grant_a_unused;
wire [7:0] cpx_sctag2_grant_a_unused;
wire [7:0] cpx_sctag3_grant_a_unused;
wire [7:0] cpx_sctag8_grant_a_unused;
wire [7:0] ccx_dest_atom_a_r_unused;
wire [7:0] ccx_dest_data_rdy_a_r_unused;
wire cpx_arbr0_scanin;
wire cpx_arbr0_scanout;
wire cpx_arbr1_scanin;
wire cpx_arbr1_scanout;
wire cpx_arbr2_scanin;
wire cpx_arbr2_scanout;
wire cpx_arbr3_scanin;
wire cpx_arbr3_scanout;
wire cpx_arbr4_scanin;
wire cpx_arbr4_scanout;
wire cpx_arbr5_scanin;
wire cpx_arbr5_scanout;
wire cpx_arbr6_scanin;
wire cpx_arbr6_scanout;
wire cpx_arbr7_scanin;
wire cpx_arbr7_scanout;
wire scan_out_prebuf;


output [7:0]            cpx_io_grant_cx;        // From sctag_buf8 of cpx_bfs_dp.v
output [7:0]            cpx_sctag0_grant_cx;    // From sctag_buf0 of cpx_bfs_dp.v
output [7:0]            cpx_sctag1_grant_cx;    // From sctag_buf1 of cpx_bfs_dp.v
output [7:0]            cpx_sctag2_grant_cx;    // From sctag_buf2 of cpx_bfs_dp.v
output [7:0]            cpx_sctag3_grant_cx;    // From sctag_buf3 of cpx_bfs_dp.v
output [7:0]            cpx_sctag4_grant_cx;    // From sctag_buf4 of cpx_bfs_dp.v
output [7:0]            cpx_sctag5_grant_cx;    // From sctag_buf5 of cpx_bfs_dp.v
output [7:0]            cpx_sctag6_grant_cx;    // From sctag_buf6 of cpx_bfs_dp.v
output [7:0]            cpx_sctag7_grant_cx;    // From sctag_buf7 of cpx_bfs_dp.v
output [145:0]          cpx_spc0_data_cx2;      // From spc_buf0 of cpx_bfc_dp.v
output [145:0]          cpx_spc1_data_cx2;      // From spc_buf1 of cpx_bfc_dp.v
output [145:0]          cpx_spc2_data_cx2;      // From spc_buf2 of cpx_bfc_dp.v
output [145:0]          cpx_spc3_data_cx2;      // From spc_buf3 of cpx_bfc_dp.v
output [145:0]          cpx_spc4_data_cx2;      // From spc_buf4 of cpx_bfc_dp.v
output [145:0]          cpx_spc5_data_cx2;      // From spc_buf5 of cpx_bfc_dp.v
output [145:0]          cpx_spc6_data_cx2;      // From spc_buf6 of cpx_bfc_dp.v
output [145:0]          cpx_spc7_data_cx2;      // From spc_buf7 of cpx_bfc_dp.v


input [145:0]           io_cpx_data_ca;         // To cpx_dpa of cpx_dpa.v
input [7:0]             io_cpx_req_cq;          // To arb0 of ccx_arb.v, ...
input                   sctag0_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag0_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag0_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag1_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag1_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag1_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag2_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag2_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag2_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag3_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag3_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag3_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag4_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag4_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag4_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag5_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag5_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag5_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag6_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag6_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag6_cpx_req_cq;      // To arb0 of ccx_arb.v, ...
input                   sctag7_cpx_atom_cq;     // To arb0 of ccx_arb.v, ...
input [145:0]           sctag7_cpx_data_ca;     // To cpx_dpa of cpx_dpa.v
input [7:0]             sctag7_cpx_req_cq;      // To arb0 of ccx_arb.v, ...

// Extra inputs which exist in N1

// globals
input tcu_scan_en ;
input           l2clk;
input           scan_in;
input           tcu_pce_ov;             // scan signals
input           ccx_aclk;
input           ccx_bclk;
output          scan_out;


// buffer output grant signals
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct0     (
	.din	(cpx_sctag0_grant_a[7:0]),
	.dout	(cpx_sctag0_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct1     (
	.din	(cpx_sctag1_grant_a[7:0]),
	.dout	(cpx_sctag1_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct2     (
	.din	(cpx_sctag2_grant_a[7:0]),
	.dout	(cpx_sctag2_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct3     (
	.din	(cpx_sctag3_grant_a[7:0]),
	.dout	(cpx_sctag3_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct4     (
	.din	(cpx_sctag4_grant_a[7:0]),
	.dout	(cpx_sctag4_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct5     (
	.din	(cpx_sctag5_grant_a[7:0]),
	.dout	(cpx_sctag5_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct6     (
	.din	(cpx_sctag6_grant_a[7:0]),
	.dout	(cpx_sctag6_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct7     (
	.din	(cpx_sctag7_grant_a[7:0]),
	.dout	(cpx_sctag7_grant_a_0[7:0])
);

cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_io     (
	.din	(cpx_io_grant_a[7:0]),
	.dout	(cpx_io_grant_a_0[7:0])
);

/*
 cpx_bfg_dp AUTO_TEMPLATE(
 .cpx_sctag_grant_cx (cpx_sctag@_grant_cx_0[7:0]),
 .cpx_sctag_grant_ca (cpx_sctag@_grant_a[7:0]));
   */

cpx_bfg_dp bfg0 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag0_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_0),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_0),
                 .ccx_aclk_out          (ccx_aclk_bfg_0),
                 .ccx_bclk_out          (ccx_bclk_bfg_0),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag0_grant_a_0[7:0]), // Templated
                 .scan_in(bfg0_scanin),
                 .scan_out(bfg0_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_lt),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_lt),
                 .ccx_aclk                (ccx_aclk_bfd_lt),
                 .ccx_bclk                (ccx_bclk_bfd_lt)
                 );

cpx_bfg_dp bfg1 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag1_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_1_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_1_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_1_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_1_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag1_grant_a_0[7:0]), // Templated
                 .scan_in(bfg1_scanin),
                 .scan_out(bfg1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );

cpx_bfg_dp bfg2 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag2_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_2_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_2_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_2_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_2_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag2_grant_a_0[7:0]), // Templated
                 .scan_in(bfg2_scanin),
                 .scan_out(bfg2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_lb),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_lb),
                 .ccx_aclk                (ccx_aclk_bfd_lb),
                 .ccx_bclk                (ccx_bclk_bfd_lb)
                 );

cpx_bfg_dp bfg3 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag3_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_3_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_3_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_3_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_3_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag3_grant_a_0[7:0]), // Templated
                 .scan_in(bfg3_scanin),
                 .scan_out(bfg3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );

cpx_bfg_dp bfg4 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag4_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_4_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_4_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_4_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_4_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag4_grant_a_0[7:0]), // Templated
                 .scan_in(bfg4_scanin),
                 .scan_out(bfg4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_rt),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_rt),
                 .ccx_aclk                (ccx_aclk_bfd_rt),
                 .ccx_bclk                (ccx_bclk_bfd_rt)
                 );

cpx_bfg_dp bfg5 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag5_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_5_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_5_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_5_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_5_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag5_grant_a_0[7:0]), // Templated
                 .scan_in(bfg5_scanin),
                 .scan_out(bfg5_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_t),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_t),
                 .ccx_aclk                (ccx_aclk_bfd_t),
                 .ccx_bclk                (ccx_bclk_bfd_t)
                 );

cpx_bfg_dp bfg6 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag6_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_6_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_6_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_6_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_6_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag6_grant_a_0[7:0]), // Templated
                 .scan_in(bfg6_scanin),
                 .scan_out(bfg6_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_rb),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_rb),
                 .ccx_aclk                (ccx_aclk_bfd_rb),
                 .ccx_bclk                (ccx_bclk_bfd_rb)
                 );

cpx_bfg_dp bfg7 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_sctag7_grant_cx[7:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_7_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_7_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_7_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_7_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_sctag7_grant_a_0[7:0]), // Templated
                 .scan_in(bfg7_scanin),
                 .scan_out(bfg7_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfd_b),
                 .tcu_pce_ov              (tcu_pce_ov_bfd_b),
                 .ccx_aclk                (ccx_aclk_bfd_b),
                 .ccx_bclk                (ccx_bclk_bfd_b)
                 );

/*
 cpx_bfg_dp AUTO_TEMPLATE(
 .cpx_sctag_grant_cx (cpx_io_grant_cx_0[7:0]),
 .cpx_sctag_grant_ca (cpx_io_grant_a[7:0]));
  */

cpx_bfg_dp bfg8 (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (cpx_io_grant_cx[7:0]),  // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_8_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_8_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_8_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_8_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (cpx_io_grant_a_0[7:0]),   // Templated
                 .scan_in(bfg8_scanin),
                 .scan_out(bfg8_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfg_0),
                 .tcu_pce_ov              (tcu_pce_ov_bfg_0),
                 .ccx_aclk                (ccx_aclk_bfg_0),
                 .ccx_bclk                (ccx_bclk_bfg_0)
                 );




// flop data coming from NCU.
// Even though data signals are named data_ca, they are launched 1 cycle early.
// Flopping at pins, solves ccx timing path.
// use bfd_dp to do the flopping and buffering. This is an inverting flop (normally used to buffer outgoing signals)
// Signal polarity changes to active low.

// First pass through an isolation buffer
cpx_ob1_dp buf_io (
.cpx_spc_data_cx2_prebuf (io_cpx_data_ca[145:0]),
.cpx_spc_data_cx2       (io_cpx_data_ca_buf[145:0])
);
                   
cpx_bfd_dp bfd_io (
                 // Outputs
                 .cpx_spc_data_cx2      (io_cpx_data_ca_d1_[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_io_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_io_unused),
                 .ccx_aclk_out          (ccx_aclk_bfd_io_unused),
                 .ccx_bclk_out          (ccx_bclk_bfd_io_unused),
                 // Inputs
                 .cpx_spc_data_x_       (io_cpx_data_ca_buf[145:0]), // Templated
                 .scan_in(bfd_io_scanin),
                 .scan_out(bfd_io_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_lt),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_lt),
                 .ccx_aclk          (ccx_aclk_bfd_lt),
                 .ccx_bclk          (ccx_bclk_bfd_lt)
                 );


// buffer input data from  io at the pins
//buff_macro i_bufd_io_0 (dbuff=32x, width=146, stack=150c) (
//	.din	(io_cpx_data_ca[145:0]),
//	.dout	(io_cpx_data_ca_0[145:0]),
//);


// buffer req and atm signals at the pins
cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct0_l     (
	.din	({sctag0_cpx_req_cq[7:0],sctag0_cpx_atom_cq}),
	.dout	({sctag0_cpx_req_cq_0_l[7:0],sctag0_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct0_r     (
	.din	({sctag0_cpx_req_cq[7:0],sctag0_cpx_atom_cq}),
	.dout	({sctag0_cpx_req_cq_0_r[7:0],sctag0_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct1_l     (
	.din	({sctag1_cpx_req_cq[7:0],sctag1_cpx_atom_cq}),
	.dout	({sctag1_cpx_req_cq_0_l[7:0],sctag1_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct1_r     (
	.din	({sctag1_cpx_req_cq[7:0],sctag1_cpx_atom_cq}),
	.dout	({sctag1_cpx_req_cq_0_r[7:0],sctag1_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct2_l     (
	.din	({sctag2_cpx_req_cq[7:0],sctag2_cpx_atom_cq}),
	.dout	({sctag2_cpx_req_cq_0_l[7:0],sctag2_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct2_r     (
	.din	({sctag2_cpx_req_cq[7:0],sctag2_cpx_atom_cq}),
	.dout	({sctag2_cpx_req_cq_0_r[7:0],sctag2_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct3_l     (
	.din	({sctag3_cpx_req_cq[7:0],sctag3_cpx_atom_cq}),
	.dout	({sctag3_cpx_req_cq_0_l[7:0],sctag3_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct3_r     (
	.din	({sctag3_cpx_req_cq[7:0],sctag3_cpx_atom_cq}),
	.dout	({sctag3_cpx_req_cq_0_r[7:0],sctag3_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct4_l     (
	.din	({sctag4_cpx_req_cq[7:0],sctag4_cpx_atom_cq}),
	.dout	({sctag4_cpx_req_cq_0_l[7:0],sctag4_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct4_r     (
	.din	({sctag4_cpx_req_cq[7:0],sctag4_cpx_atom_cq}),
	.dout	({sctag4_cpx_req_cq_0_r[7:0],sctag4_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct5_l     (
	.din	({sctag5_cpx_req_cq[7:0],sctag5_cpx_atom_cq}),
	.dout	({sctag5_cpx_req_cq_0_l[7:0],sctag5_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct5_r     (
	.din	({sctag5_cpx_req_cq[7:0],sctag5_cpx_atom_cq}),
	.dout	({sctag5_cpx_req_cq_0_r[7:0],sctag5_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct6_l     (
	.din	({sctag6_cpx_req_cq[7:0],sctag6_cpx_atom_cq}),
	.dout	({sctag6_cpx_req_cq_0_l[7:0],sctag6_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct6_r     (
	.din	({sctag6_cpx_req_cq[7:0],sctag6_cpx_atom_cq}),
	.dout	({sctag6_cpx_req_cq_0_r[7:0],sctag6_cpx_atom_cq_0_r})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct7_l     (
	.din	({sctag7_cpx_req_cq[7:0],sctag7_cpx_atom_cq}),
	.dout	({sctag7_cpx_req_cq_0_l[7:0],sctag7_cpx_atom_cq_0_l})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct7_r     (
	.din	({sctag7_cpx_req_cq[7:0],sctag7_cpx_atom_cq}),
	.dout	({sctag7_cpx_req_cq_0_r[7:0],sctag7_cpx_atom_cq_0_r})
);


// flop req signal coming from NCU.
// Even though req signals are named req_cq, they are launched 1 cycle early.
// Flopping at pins, solves ccx timing path.
// use bfg_dp to do the flopping and buffering.

cpx_buff_macro__dbuff_16x__rep_1__stack_none__width_8 buf8_req     (
	.din	(io_cpx_req_cq[7:0]),
	.dout	(io_cpx_req_cq_buf[7:0])
);

cpx_bfg_dp bfg8_req (
/*AUTOINST*/
                 // Outputs
                 .cpx_sctag_grant_cx    (io_cpx_req_cq_d1[7:0]),  // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfg_req_8_unused),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfg_req_8_unused),
                 .ccx_aclk_out          (ccx_aclk_bfg_req_8_unused),
                 .ccx_bclk_out          (ccx_bclk_bfg_req_8_unused),
                 // Inputs
                 .cpx_sctag_grant_ca    (io_cpx_req_cq_buf[7:0]),   // Templated
                 .scan_in(bfg8_req_scanin),
                 .scan_out(bfg8_req_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en             (tcu_scan_en_bfg_0),
                 .tcu_pce_ov              (tcu_pce_ov_bfg_0),
                 .ccx_aclk                (ccx_aclk_bfg_0),
                 .ccx_bclk                (ccx_bclk_bfg_0)
                 );



// buffer all the inputs at the column
// changed the buffers to inverters to help timing
cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct0_0    (
	.din	({4'b0,sctag0_cpx_data_ca[145:0]}),
	.dout	(sctag0_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct0_1    (
	.din	({sctag0_cpx_data_a_[149:0]}),
	.dout	(sctag0_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct1_0    (
	.din	({4'b0,sctag1_cpx_data_ca[145:0]}),
	.dout	(sctag1_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct1_1    (
	.din	({sctag1_cpx_data_a_[149:0]}),
	.dout	(sctag1_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct2_0    (
	.din	({4'b0,sctag2_cpx_data_ca[145:0]}),
	.dout	(sctag2_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct2_1    (
	.din	({sctag2_cpx_data_a_[149:0]}),
	.dout	(sctag2_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct3_0    (
	.din	({4'b0,sctag3_cpx_data_ca[145:0]}),
	.dout	(sctag3_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct3_1    (
	.din	({sctag3_cpx_data_a_[149:0]}),
	.dout	(sctag3_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct4_0    (
	.din	({4'b0,sctag4_cpx_data_ca[145:0]}),
	.dout	(sctag4_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct4_1    (
	.din	({sctag4_cpx_data_a_[149:0]}),
	.dout	(sctag4_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct5_0    (
	.din	({4'b0,sctag5_cpx_data_ca[145:0]}),
	.dout	(sctag5_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct5_1    (
	.din	({sctag5_cpx_data_a_[149:0]}),
	.dout	(sctag5_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct6_0    (
	.din	({4'b0,sctag6_cpx_data_ca[145:0]}),
	.dout	(sctag6_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct6_1    (
	.din	({sctag6_cpx_data_a_[149:0]}),
	.dout	(sctag6_cpx_data_a[149:0])
);

cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct7_0    (
	.din	({4'b0,sctag7_cpx_data_ca[145:0]}),
	.dout	(sctag7_cpx_data_a_[149:0])
);

cpx_inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct7_1    (
	.din	({sctag7_cpx_data_a_[149:0]}),
	.dout	(sctag7_cpx_data_a[149:0])
);

cpx_buff_macro__dbuff_8x__minbuff_1__stack_150c__width_150 i_bufd_io_1     (
	.din	({4'b0,io_cpx_data_ca_d1_[145:0]}),
	.dout	(io_cpx_data_a_[149:0])
);
cpx_inv_macro__dinv_32x__stack_150c__width_150 i_inv_io_1    (
	.din	({io_cpx_data_a_[149:0]}),
	.dout	(io_cpx_data_a[149:0])
);

//buffer the high fanout signals going to dpa top
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_t     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_dpa_t,ccx_bclk_dpa_t,tcu_pce_ov_dpa_t,tcu_scan_en_dpa_t})
);
//buffer the high fanout signals going to bfd_dp/bfg_dp top
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_t     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_bfd_t,ccx_bclk_bfd_t,tcu_pce_ov_bfd_t,tcu_scan_en_bfd_t})
);
//buffer the high fanout signals going to dpa bottom
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_dpa_b     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_dpa_b,ccx_bclk_dpa_b,tcu_pce_ov_dpa_b,tcu_scan_en_dpa_b})
);
//buffer the high fanout signals going to bfd_dp/bfg_dp bottom
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_bfd_b     (
	.din	({ccx_aclk,ccx_bclk, tcu_pce_ov, tcu_scan_en}),
	.dout	({ccx_aclk_bfd_b,ccx_bclk_bfd_b,tcu_pce_ov_bfd_b,tcu_scan_en_bfd_b})
);

 /*
  cpx_dpa AUTO_TEMPLATE(
  .io_cpx_data_a(io_cpx_data_a[149:0]),
  .scache0_cpx_data_a(sctag0_cpx_data_a[149:0]),  
  .scache1_cpx_data_a(sctag1_cpx_data_a[149:0]),  
  .scache2_cpx_data_a(sctag2_cpx_data_a[149:0]),  
  .scache3_cpx_data_a(sctag3_cpx_data_a[149:0]),  
  .scache4_cpx_data_a(sctag4_cpx_data_a[149:0]),  
  .scache5_cpx_data_a(sctag5_cpx_data_a[149:0]),  
  .scache7_cpx_data_a(sctag7_cpx_data_a[149:0]),
  .scache6_cpx_data_a(sctag6_cpx_data_a[149:0]),  
  );  
  */

assign cpx_spc0_data_x_unused[3:0] = cpx_spc0_data_x_[149:146];
assign cpx_spc1_data_x_unused[3:0] = cpx_spc1_data_x_[149:146];
assign cpx_spc2_data_x_unused[3:0] = cpx_spc2_data_x_[149:146];
assign cpx_spc3_data_x_unused[3:0] = cpx_spc3_data_x_[149:146];
assign cpx_spc4_data_x_unused[3:0] = cpx_spc4_data_x_[149:146];
assign cpx_spc5_data_x_unused[3:0] = cpx_spc5_data_x_[149:146];
assign cpx_spc6_data_x_unused[3:0] = cpx_spc6_data_x_[149:146];
assign cpx_spc7_data_x_unused[3:0] = cpx_spc7_data_x_[149:146];

cpx_dpa cpx_dpa (
   /*AUTOINST*/
                 // Outputs
                 .cpx_spc0_data_x_      (cpx_spc0_data_x_[149:0]),
                 .cpx_spc1_data_x_      (cpx_spc1_data_x_[149:0]),
                 .cpx_spc2_data_x_      (cpx_spc2_data_x_[149:0]),
                 .cpx_spc3_data_x_      (cpx_spc3_data_x_[149:0]),
                 .cpx_spc4_data_x_      (cpx_spc4_data_x_[149:0]),
                 .cpx_spc5_data_x_      (cpx_spc5_data_x_[149:0]),
                 .cpx_spc6_data_x_      (cpx_spc6_data_x_[149:0]),
                 .cpx_spc7_data_x_      (cpx_spc7_data_x_[149:0]),
                 // Inputs
                 .arb0_grant_l_a          (arb0_grant_l_a[8:0]),
                 .arb0_q0_holdbar_l_a     (arb0_q0_holdbar_l_a[8:0]),
                 .arb0_qsel0_l_a          (arb0_qsel0_l_a[8:0]),
                 .arb0_qsel1_l_a          (arb0_qsel1_l_a[8:0]),
                 .arb0_shift_l_a          (arb0_shift_l_a[8:0]),
                 .arb1_grant_l_a          (arb1_grant_l_a[8:0]),
                 .arb1_q0_holdbar_l_a     (arb1_q0_holdbar_l_a[8:0]),
                 .arb1_qsel0_l_a          (arb1_qsel0_l_a[8:0]),
                 .arb1_qsel1_l_a          (arb1_qsel1_l_a[8:0]),
                 .arb1_shift_l_a          (arb1_shift_l_a[8:0]),
                 .arb2_grant_l_a          (arb2_grant_l_a[8:0]),
                 .arb2_q0_holdbar_l_a     (arb2_q0_holdbar_l_a[8:0]),
                 .arb2_qsel0_l_a          (arb2_qsel0_l_a[8:0]),
                 .arb2_qsel1_l_a          (arb2_qsel1_l_a[8:0]),
                 .arb2_shift_l_a          (arb2_shift_l_a[8:0]),
                 .arb3_grant_l_a          (arb3_grant_l_a[8:0]),
                 .arb3_q0_holdbar_l_a     (arb3_q0_holdbar_l_a[8:0]),
                 .arb3_qsel0_l_a          (arb3_qsel0_l_a[8:0]),
                 .arb3_qsel1_l_a          (arb3_qsel1_l_a[8:0]),
                 .arb3_shift_l_a          (arb3_shift_l_a[8:0]),
                 .arb4_grant_l_a          (arb4_grant_l_a[8:0]),
                 .arb4_q0_holdbar_l_a     (arb4_q0_holdbar_l_a[8:0]),
                 .arb4_qsel0_l_a          (arb4_qsel0_l_a[8:0]),
                 .arb4_qsel1_l_a          (arb4_qsel1_l_a[8:0]),
                 .arb4_shift_l_a          (arb4_shift_l_a[8:0]),
                 .arb5_grant_l_a          (arb5_grant_l_a[8:0]),
                 .arb5_q0_holdbar_l_a     (arb5_q0_holdbar_l_a[8:0]),
                 .arb5_qsel0_l_a          (arb5_qsel0_l_a[8:0]),
                 .arb5_qsel1_l_a          (arb5_qsel1_l_a[8:0]),
                 .arb5_shift_l_a          (arb5_shift_l_a[8:0]),
                 .arb6_grant_l_a          (arb6_grant_l_a[8:0]),
                 .arb6_q0_holdbar_l_a     (arb6_q0_holdbar_l_a[8:0]),
                 .arb6_qsel0_l_a          (arb6_qsel0_l_a[8:0]),
                 .arb6_qsel1_l_a          (arb6_qsel1_l_a[8:0]),
                 .arb6_shift_l_a          (arb6_shift_l_a[8:0]),
                 .arb7_grant_l_a          (arb7_grant_l_a[8:0]),
                 .arb7_q0_holdbar_l_a     (arb7_q0_holdbar_l_a[8:0]),
                 .arb7_qsel0_l_a          (arb7_qsel0_l_a[8:0]),
                 .arb7_qsel1_l_a          (arb7_qsel1_l_a[8:0]),
                 .arb7_shift_l_a          (arb7_shift_l_a[8:0]),
                 .arb0_grant_r_a          (arb0_grant_r_a[8:0]),
                 .arb0_q0_holdbar_r_a     (arb0_q0_holdbar_r_a[8:0]),
                 .arb0_qsel0_r_a          (arb0_qsel0_r_a[8:0]),
                 .arb0_qsel1_r_a          (arb0_qsel1_r_a[8:0]),
                 .arb0_shift_r_a          (arb0_shift_r_a[8:0]),
                 .arb1_grant_r_a          (arb1_grant_r_a[8:0]),
                 .arb1_q0_holdbar_r_a     (arb1_q0_holdbar_r_a[8:0]),
                 .arb1_qsel0_r_a          (arb1_qsel0_r_a[8:0]),
                 .arb1_qsel1_r_a          (arb1_qsel1_r_a[8:0]),
                 .arb1_shift_r_a          (arb1_shift_r_a[8:0]),
                 .arb2_grant_r_a          (arb2_grant_r_a[8:0]),
                 .arb2_q0_holdbar_r_a     (arb2_q0_holdbar_r_a[8:0]),
                 .arb2_qsel0_r_a          (arb2_qsel0_r_a[8:0]),
                 .arb2_qsel1_r_a          (arb2_qsel1_r_a[8:0]),
                 .arb2_shift_r_a          (arb2_shift_r_a[8:0]),
                 .arb3_grant_r_a          (arb3_grant_r_a[8:0]),
                 .arb3_q0_holdbar_r_a     (arb3_q0_holdbar_r_a[8:0]),
                 .arb3_qsel0_r_a          (arb3_qsel0_r_a[8:0]),
                 .arb3_qsel1_r_a          (arb3_qsel1_r_a[8:0]),
                 .arb3_shift_r_a          (arb3_shift_r_a[8:0]),
                 .arb4_grant_r_a          (arb4_grant_r_a[8:0]),
                 .arb4_q0_holdbar_r_a     (arb4_q0_holdbar_r_a[8:0]),
                 .arb4_qsel0_r_a          (arb4_qsel0_r_a[8:0]),
                 .arb4_qsel1_r_a          (arb4_qsel1_r_a[8:0]),
                 .arb4_shift_r_a          (arb4_shift_r_a[8:0]),
                 .arb5_grant_r_a          (arb5_grant_r_a[8:0]),
                 .arb5_q0_holdbar_r_a     (arb5_q0_holdbar_r_a[8:0]),
                 .arb5_qsel0_r_a          (arb5_qsel0_r_a[8:0]),
                 .arb5_qsel1_r_a          (arb5_qsel1_r_a[8:0]),
                 .arb5_shift_r_a          (arb5_shift_r_a[8:0]),
                 .arb6_grant_r_a          (arb6_grant_r_a[8:0]),
                 .arb6_q0_holdbar_r_a     (arb6_q0_holdbar_r_a[8:0]),
                 .arb6_qsel0_r_a          (arb6_qsel0_r_a[8:0]),
                 .arb6_qsel1_r_a          (arb6_qsel1_r_a[8:0]),
                 .arb6_shift_r_a          (arb6_shift_r_a[8:0]),
                 .arb7_grant_r_a          (arb7_grant_r_a[8:0]),
                 .arb7_q0_holdbar_r_a     (arb7_q0_holdbar_r_a[8:0]),
                 .arb7_qsel0_r_a          (arb7_qsel0_r_a[8:0]),
                 .arb7_qsel1_r_a          (arb7_qsel1_r_a[8:0]),
                 .arb7_shift_r_a          (arb7_shift_r_a[8:0]),
                 .io_cpx_data_a           (io_cpx_data_a[149:0]), // Templated
                 .scache0_cpx_data_a      (sctag0_cpx_data_a[149:0]), // Templated
                 .scache1_cpx_data_a      (sctag1_cpx_data_a[149:0]), // Templated
                 .scache2_cpx_data_a      (sctag2_cpx_data_a[149:0]), // Templated
                 .scache3_cpx_data_a      (sctag3_cpx_data_a[149:0]), // Templated
                 .scache4_cpx_data_a      (sctag4_cpx_data_a[149:0]), // Templated
                 .scache5_cpx_data_a      (sctag5_cpx_data_a[149:0]), // Templated
                 .scache6_cpx_data_a      (sctag6_cpx_data_a[149:0]), // Templated
                 .scache7_cpx_data_a      (sctag7_cpx_data_a[149:0]), // Templated
                 .scan_in                 (cpx_dpa_scanin),
                 .scan_out                (cpx_dpa_scanout),
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

cpx_bfd_dp bfd0 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc0_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_lt),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_lt),
                 .ccx_aclk_out          (ccx_aclk_bfd_lt),
                 .ccx_bclk_out          (ccx_bclk_bfd_lt),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc0_data_x_[145:0]), // Templated
                 .scan_in(bfd0_scanin),
                 .scan_out(bfd0_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_1),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_1),
                 .ccx_aclk          (ccx_aclk_bfd_1),
                 .ccx_bclk          (ccx_bclk_bfd_1)
                 );

// Output buffer at the pins
cpx_ob1_dp ob_0 (
                  .cpx_spc_data_cx2        (cpx_spc0_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc0_data_cx2_prebuf[145:0])
                  );


cpx_bfd_dp bfd1 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc1_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_1),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_1),
                 .ccx_aclk_out          (ccx_aclk_bfd_1),
                 .ccx_bclk_out          (ccx_bclk_bfd_1),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc1_data_x_[145:0]), // Templated
                 .scan_in(bfd1_scanin),
                 .scan_out(bfd1_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_t),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_t),
                 .ccx_aclk          (ccx_aclk_bfd_t),
                 .ccx_bclk          (ccx_bclk_bfd_t)
                 );

// Output buffer at the pins
cpx_ob1_dp ob_1 (
                  .cpx_spc_data_cx2        (cpx_spc1_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc1_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd2 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc2_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_lb),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_lb),
                 .ccx_aclk_out          (ccx_aclk_bfd_lb),
                 .ccx_bclk_out          (ccx_bclk_bfd_lb),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc2_data_x_[145:0]), // Templated
                 .scan_in(bfd2_scanin),
                 .scan_out(bfd2_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_3),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_3),
                 .ccx_aclk          (ccx_aclk_bfd_3),
                 .ccx_bclk          (ccx_bclk_bfd_3)
                 );

// Output buffer at the pins
cpx_ob1_dp ob_2 (
                  .cpx_spc_data_cx2        (cpx_spc2_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc2_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd3 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc3_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_3),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_3),
                 .ccx_aclk_out          (ccx_aclk_bfd_3),
                 .ccx_bclk_out          (ccx_bclk_bfd_3),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc3_data_x_[145:0]), // Templated
                 .scan_in(bfd3_scanin),
                 .scan_out(bfd3_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_b),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_b),
                 .ccx_aclk          (ccx_aclk_bfd_b),
                 .ccx_bclk          (ccx_bclk_bfd_b)
                 );

// Output buffer at the pins
cpx_ob1_dp ob_3 (
                  .cpx_spc_data_cx2        (cpx_spc3_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc3_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd4 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc4_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_rt),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_rt),
                 .ccx_aclk_out          (ccx_aclk_bfd_rt),
                 .ccx_bclk_out          (ccx_bclk_bfd_rt),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc4_data_x_[145:0]), // Templated
                 .scan_in(bfd4_scanin),
                 .scan_out(bfd4_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_5),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_5),
                 .ccx_aclk          (ccx_aclk_bfd_5),
                 .ccx_bclk          (ccx_bclk_bfd_5)
                 );

// Output buffer at the pins
cpx_ob2_dp ob_4 (
                  .cpx_spc_data_cx2        (cpx_spc4_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc4_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd5 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc5_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_5),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_5),
                 .ccx_aclk_out          (ccx_aclk_bfd_5),
                 .ccx_bclk_out          (ccx_bclk_bfd_5),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc5_data_x_[145:0]), // Templated
                 .scan_in(bfd5_scanin),
                 .scan_out(bfd5_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_t),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_t),
                 .ccx_aclk          (ccx_aclk_bfd_t),
                 .ccx_bclk          (ccx_bclk_bfd_t)
                 );

// Output buffer at the pins
cpx_ob2_dp ob_5 (
                  .cpx_spc_data_cx2        (cpx_spc5_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc5_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd6 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc6_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_rb),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_rb),
                 .ccx_aclk_out          (ccx_aclk_bfd_rb),
                 .ccx_bclk_out          (ccx_bclk_bfd_rb),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc6_data_x_[145:0]), // Templated
                 .scan_in(bfd6_scanin),
                 .scan_out(bfd6_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_7),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_7),
                 .ccx_aclk          (ccx_aclk_bfd_7),
                 .ccx_bclk          (ccx_bclk_bfd_7)
                 );

// Output buffer at the pins
cpx_ob2_dp ob_6 (
                  .cpx_spc_data_cx2        (cpx_spc6_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc6_data_cx2_prebuf[145:0])
                  );

cpx_bfd_dp bfd7 (
                 // Outputs
                 .cpx_spc_data_cx2      (cpx_spc7_data_cx2_prebuf[145:0]), // Templated
                 .tcu_scan_en_out       (tcu_scan_en_bfd_7),
                 .tcu_pce_ov_out        (tcu_pce_ov_bfd_7),
                 .ccx_aclk_out          (ccx_aclk_bfd_7),
                 .ccx_bclk_out          (ccx_bclk_bfd_7),
                 // Inputs
                 .cpx_spc_data_x_       (cpx_spc7_data_x_[145:0]), // Templated
                 .scan_in(bfd7_scanin),
                 .scan_out(bfd7_scanout),
                 .l2clk                 (l2clk),
                 .tcu_scan_en       (tcu_scan_en_bfd_b),
                 .tcu_pce_ov        (tcu_pce_ov_bfd_b),
                 .ccx_aclk          (ccx_aclk_bfd_b),
                 .ccx_bclk          (ccx_bclk_bfd_b)
                 );

// Output buffer at the pins
cpx_ob2_dp ob_7 (
                  .cpx_spc_data_cx2        (cpx_spc7_data_cx2[145:0]),
                  .cpx_spc_data_cx2_prebuf (cpx_spc7_data_cx2_prebuf[145:0])
                  );


// buffer req signals feeding left arbiters
cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct0     (
	.din	({sctag0_cpx_req_cq_0_l[7:0],sctag0_cpx_atom_cq_0_l,sctag0_cpx_atom_cq_0_l}),
	.dout	({sctag0_cpx_req_lq[7:0],  sctag0_cpx_atom_lq_t,sctag0_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct1     (
	.din	({sctag1_cpx_req_cq_0_l[7:0],sctag1_cpx_atom_cq_0_l,sctag1_cpx_atom_cq_0_l}),
	.dout	({sctag1_cpx_req_lq[7:0],  sctag1_cpx_atom_lq_t,sctag1_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct2     (
	.din	({sctag2_cpx_req_cq_0_l[7:0],sctag2_cpx_atom_cq_0_l,sctag2_cpx_atom_cq_0_l}),
	.dout	({sctag2_cpx_req_lq[7:0],  sctag2_cpx_atom_lq_t,sctag2_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct3     (
	.din	({sctag3_cpx_req_cq_0_l[7:0],sctag3_cpx_atom_cq_0_l,sctag3_cpx_atom_cq_0_l}),
	.dout	({sctag3_cpx_req_lq[7:0],  sctag3_cpx_atom_lq_t,sctag3_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct4     (
	.din	({sctag4_cpx_req_cq_0_l[7:0],sctag4_cpx_atom_cq_0_l,sctag4_cpx_atom_cq_0_l}),
	.dout	({sctag4_cpx_req_lq[7:0],  sctag4_cpx_atom_lq_t,sctag4_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct5     (
	.din	({sctag5_cpx_req_cq_0_l[7:0],sctag5_cpx_atom_cq_0_l,sctag5_cpx_atom_cq_0_l}),
	.dout	({sctag5_cpx_req_lq[7:0],  sctag5_cpx_atom_lq_t,sctag5_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct6     (
	.din	({sctag6_cpx_req_cq_0_l[7:0],sctag6_cpx_atom_cq_0_l,sctag6_cpx_atom_cq_0_l}),
	.dout	({sctag6_cpx_req_lq[7:0],  sctag6_cpx_atom_lq_t,sctag6_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct7     (
	.din	({sctag7_cpx_req_cq_0_l[7:0],sctag7_cpx_atom_cq_0_l,sctag7_cpx_atom_cq_0_l}),
	.dout	({sctag7_cpx_req_lq[7:0],  sctag7_cpx_atom_lq_t,sctag7_cpx_atom_lq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_8 i_bufq_l_io     (
	.din	({io_cpx_req_cq_d1[7:0]}),
	.dout	({io_cpx_req_lq[7:0]})
);


//buffer the high fanout signals going to arb top left
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lt     (
	.din	({ccx_aclk_bfd_lt,ccx_bclk_bfd_lt, tcu_pce_ov_bfd_lt, tcu_scan_en_bfd_lt}),
	.dout	({ccx_aclk_arb_lt,ccx_bclk_arb_lt,tcu_pce_ov_arb_lt,tcu_scan_en_arb_lt})
);

//buffer the high fanout signals going to arb bot left
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_lb     (
	.din	({ccx_aclk_bfd_lb,ccx_bclk_bfd_lb, tcu_pce_ov_bfd_lb, tcu_scan_en_bfd_lb}),
	.dout	({ccx_aclk_arb_lb,ccx_bclk_arb_lb,tcu_pce_ov_arb_lb,tcu_scan_en_arb_lb})
);

//buffer the high fanout signals going to arb top right
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rt     (
	.din	({ccx_aclk_bfd_rt,ccx_bclk_bfd_rt, tcu_pce_ov_bfd_rt, tcu_scan_en_bfd_rt}),
	.dout	({ccx_aclk_arb_rt,ccx_bclk_arb_rt,tcu_pce_ov_arb_rt,tcu_scan_en_arb_rt})
);

//buffer the high fanout signals going to arb bot right
cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 buf_hfn_arb_rb     (
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
 .arb_src0_grant_a		(cpx_sctag0_grant_a[@]),
 .arb_src1_grant_a		(cpx_sctag1_grant_a[@]),
 .arb_src2_grant_a		(cpx_sctag2_grant_a[@]),
 .arb_src3_grant_a		(cpx_sctag3_grant_a[@]),
 .arb_src4_grant_a		(cpx_sctag4_grant_a[@]),
 .arb_src5_grant_a		(cpx_sctag5_grant_a[@]),
 .arb_src6_grant_a		(cpx_sctag6_grant_a[@]),
 .arb_src7_grant_a		(cpx_sctag7_grant_a[@]),
 .arb_src8_grant_a		(cpx_io_grant_a[@]),
 .ccx_dest_data_rdy_a	(),
 .ccx_dest_atom_a	(),
 // Inputs
 .src0_arb_atom_q		(sctag0_cpx_atom_lq),
 .src0_arb_req_q		(sctag0_cpx_req_lq[@]),
 .src1_arb_atom_q		(sctag1_cpx_atom_lq),
 .src1_arb_req_q		(sctag1_cpx_req_lq[@]),
 .src2_arb_atom_q		(sctag2_cpx_atom_lq),
 .src2_arb_req_q		(sctag2_cpx_req_lq[@]),
 .src3_arb_atom_q		(sctag3_cpx_atom_lq),
 .src3_arb_req_q		(sctag3_cpx_req_lq[@]),
 .src4_arb_atom_q		(sctag4_cpx_atom_lq),
 .src4_arb_req_q		(sctag4_cpx_req_lq[@]),
 .src5_arb_atom_q		(sctag5_cpx_atom_lq),
 .src5_arb_req_q		(sctag5_cpx_req_lq[@]),
 .src6_arb_atom_q		(sctag6_cpx_atom_lq),
 .src6_arb_req_q		(sctag6_cpx_req_lq[@]),
 .src7_arb_atom_q		(sctag7_cpx_atom_lq),
 .src7_arb_req_q		(sctag7_cpx_req_lq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(io_cpx_req_lq[@]),
 .stall_q_d1			(1'b0));
 */
//

ccx_arb cpx_arbl0 (
                  // Outputs
                  .arb_grant_a          (arb0_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb0_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb0_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb0_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb0_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[0]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[0]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[0]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[0]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[0]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[0]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[0]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[0]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[0]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[0]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[0]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[0]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[0]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[0]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[0]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[0]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[0]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[0]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[0]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[0]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl0_scanin),
                  .scan_out(cpx_arbl0_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );

ccx_arb cpx_arbl1 (
                  // Outputs
                  .arb_grant_a          (arb1_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb1_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb1_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb1_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb1_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[1]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[1]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[1]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[1]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[1]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[1]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[1]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[1]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[1]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[1]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[1]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[1]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[1]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[1]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[1]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[1]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[1]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[1]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[1]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[1]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl1_scanin),
                  .scan_out(cpx_arbl1_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );


ccx_arb cpx_arbl2 (
                  // Outputs
                  .arb_grant_a          (arb2_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb2_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb2_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb2_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb2_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[2]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[2]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[2]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[2]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[2]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[2]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[2]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[2]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[2]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[2]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[2]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[2]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[2]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[2]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[2]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[2]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[2]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[2]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[2]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[2]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl2_scanin),
                  .scan_out(cpx_arbl2_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );


ccx_arb cpx_arbl3 (
                  // Outputs
                  .arb_grant_a          (arb3_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb3_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb3_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb3_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb3_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[3]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[3]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[3]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[3]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[3]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[3]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[3]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[3]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[3]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[3]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[3]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[3]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[3]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[3]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[3]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[3]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[3]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[3]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[3]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[3]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl3_scanin),
                  .scan_out(cpx_arbl3_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );


ccx_arb cpx_arbl4 (
                  // Outputs
                  .arb_grant_a          (arb4_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb4_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb4_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb4_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb4_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[4]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[4]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[4]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[4]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[4]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[4]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[4]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[4]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[4]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[4]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[4]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[4]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[4]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[4]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[4]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[4]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[4]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[4]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[4]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[4]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl4_scanin),
                  .scan_out(cpx_arbl4_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );


ccx_arb cpx_arbl5 (
                  // Outputs
                  .arb_grant_a          (arb5_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb5_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb5_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb5_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb5_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[5]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[5]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[5]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[5]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[5]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[5]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[5]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[5]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[5]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[5]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[5]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[5]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[5]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[5]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[5]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[5]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[5]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[5]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[5]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[5]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl5_scanin),
                  .scan_out(cpx_arbl5_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lt),
                 .ccx_aclk                (ccx_aclk_arb_lt),
                 .ccx_bclk                (ccx_bclk_arb_lt)
                 );


ccx_arb cpx_arbl6 (
                  // Outputs
                  .arb_grant_a          (arb6_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb6_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb6_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb6_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb6_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[6]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[6]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[6]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[6]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[6]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[6]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[6]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[6]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[6]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[6]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[6]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[6]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[6]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[6]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[6]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[6]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[6]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[6]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[6]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[6]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl6_scanin),
                  .scan_out(cpx_arbl6_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );


ccx_arb cpx_arbl7 (
                  // Outputs
                  .arb_grant_a          (arb7_grant_l_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb7_q0_holdbar_l_a[8:0]), // Templated
                  .arb_qsel0_a          (arb7_qsel0_l_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb7_qsel1_l_a[8:0]),     // Templated
                  .arb_shift_a          (arb7_shift_l_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a[7]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a[7]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a[7]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a[7]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a_unused[7]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a_unused[7]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a_unused[7]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a_unused[7]), // Templated
                  .arb_src8_grant_a     (cpx_io_grant_a[7]),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_l_unused[7]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_l_unused[7]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_lq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_lq[7]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_lq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_lq[7]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_lq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_lq[7]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_lq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_lq[7]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_lq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_lq[7]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_lq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_lq[7]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_lq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_lq[7]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_lq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_lq[7]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_lq[7]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbl7_scanin),
                  .scan_out(cpx_arbl7_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_lb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_lb),
                 .ccx_aclk                (ccx_aclk_arb_lb),
                 .ccx_bclk                (ccx_bclk_arb_lb)
                 );

// buffer req signals feeding right arbiters
cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct0     (
	.din	({sctag0_cpx_req_cq_0_r[7:0],sctag0_cpx_atom_cq_0_r,sctag0_cpx_atom_cq_0_r}),
	.dout	({sctag0_cpx_req_rq[7:0],  sctag0_cpx_atom_rq_t,sctag0_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct1     (
	.din	({sctag1_cpx_req_cq_0_r[7:0],sctag1_cpx_atom_cq_0_r,sctag1_cpx_atom_cq_0_r}),
	.dout	({sctag1_cpx_req_rq[7:0],  sctag1_cpx_atom_rq_t,sctag1_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct2     (
	.din	({sctag2_cpx_req_cq_0_r[7:0],sctag2_cpx_atom_cq_0_r,sctag2_cpx_atom_cq_0_r}),
	.dout	({sctag2_cpx_req_rq[7:0],  sctag2_cpx_atom_rq_t,sctag2_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct3     (
	.din	({sctag3_cpx_req_cq_0_r[7:0],sctag3_cpx_atom_cq_0_r,sctag3_cpx_atom_cq_0_r}),
	.dout	({sctag3_cpx_req_rq[7:0],  sctag3_cpx_atom_rq_t,sctag3_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct4     (
	.din	({sctag4_cpx_req_cq_0_r[7:0],sctag4_cpx_atom_cq_0_r,sctag4_cpx_atom_cq_0_r}),
	.dout	({sctag4_cpx_req_rq[7:0],  sctag4_cpx_atom_rq_t,sctag4_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct5     (
	.din	({sctag5_cpx_req_cq_0_r[7:0],sctag5_cpx_atom_cq_0_r,sctag5_cpx_atom_cq_0_r}),
	.dout	({sctag5_cpx_req_rq[7:0],  sctag5_cpx_atom_rq_t,sctag5_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct6     (
	.din	({sctag6_cpx_req_cq_0_r[7:0],sctag6_cpx_atom_cq_0_r,sctag6_cpx_atom_cq_0_r}),
	.dout	({sctag6_cpx_req_rq[7:0],  sctag6_cpx_atom_rq_t,sctag6_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct7     (
	.din	({sctag7_cpx_req_cq_0_r[7:0],sctag7_cpx_atom_cq_0_r,sctag7_cpx_atom_cq_0_r}),
	.dout	({sctag7_cpx_req_rq[7:0],  sctag7_cpx_atom_rq_t,sctag7_cpx_atom_rq_b})
);

cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_8 i_bufq_r_io     (
	.din	({io_cpx_req_cq_d1[7:0]}),
	.dout	({io_cpx_req_rq[7:0]})
);


/*
 ccx_arb  AUTO_TEMPLATE(
 // Outputs
 .arb_grant_a		(arb@_grant_r_a[8:0]),
 .arb_q0_holdbar_a		(arb@_q0_holdbar_r_a[8:0]),
 .arb_qsel0_a		(arb@_qsel0_r_a[8:0]),
 .arb_qsel1_a		(arb@_qsel1_r_a[8:0]),
 .arb_shift_a		(arb@_shift_r_a[8:0]),
 .arb_src0_grant_a		(),
 .arb_src1_grant_a		(),
 .arb_src2_grant_a		(),
 .arb_src3_grant_a		(),
 .arb_src4_grant_a		(),
 .arb_src5_grant_a		(),
 .arb_src6_grant_a		(),
 .arb_src7_grant_a		(),
 .arb_src8_grant_a		(),
 .ccx_dest_data_rdy_a	(),
 .ccx_dest_atom_a	(),
 // Inputs
 .src0_arb_atom_q		(sctag0_cpx_atom_rq),
 .src0_arb_req_q		(sctag0_cpx_req_rq[@]),
 .src1_arb_atom_q		(sctag1_cpx_atom_rq),
 .src1_arb_req_q		(sctag1_cpx_req_rq[@]),
 .src2_arb_atom_q		(sctag2_cpx_atom_rq),
 .src2_arb_req_q		(sctag2_cpx_req_rq[@]),
 .src3_arb_atom_q		(sctag3_cpx_atom_rq),
 .src3_arb_req_q		(sctag3_cpx_req_rq[@]),
 .src4_arb_atom_q		(sctag4_cpx_atom_rq),
 .src4_arb_req_q		(sctag4_cpx_req_rq[@]),
 .src5_arb_atom_q		(sctag5_cpx_atom_rq),
 .src5_arb_req_q		(sctag5_cpx_req_rq[@]),
 .src6_arb_atom_q		(sctag6_cpx_atom_rq),
 .src6_arb_req_q		(sctag6_cpx_req_rq[@]),
 .src7_arb_atom_q		(sctag7_cpx_atom_rq),
 .src7_arb_req_q		(sctag7_cpx_req_rq[@]),
 .src8_arb_atom_q		(1'b0),
 .src8_arb_req_q		(io_cpx_req_rq[@]),
 .stall_q_d1			(1'b0));
 */
//

ccx_arb cpx_arbr0 (
                  // Outputs
                  .arb_grant_a          (arb0_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb0_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb0_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb0_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb0_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[0]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[0]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[0]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[0]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[0]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[0]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[0]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[0]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[0]          ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[0]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[0]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[0]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[0]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[0]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[0]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[0]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[0]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[0]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[0]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[0]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr0_scanin),
                  .scan_out(cpx_arbr0_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );


ccx_arb cpx_arbr1 (
                  // Outputs
                  .arb_grant_a          (arb1_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb1_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb1_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb1_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb1_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[1]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[1]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[1]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[1]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[1]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[1]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[1]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[1]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[1]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[1]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[1]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[1]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[1]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[1]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[1]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[1]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[1]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[1]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[1]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[1]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr1_scanin),
                  .scan_out(cpx_arbr1_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb cpx_arbr2 (
                  // Outputs
                  .arb_grant_a          (arb2_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb2_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb2_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb2_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb2_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[2]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[2]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[2]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[2]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[2]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[2]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[2]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[2]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[2]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[2]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[2]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[2]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[2]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[2]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[2]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[2]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[2]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[2]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[2]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[2]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr2_scanin),
                  .scan_out(cpx_arbr2_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb cpx_arbr3 (
                  // Outputs
                  .arb_grant_a          (arb3_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb3_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb3_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb3_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb3_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[3]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[3]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[3]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[3]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[3]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[3]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[3]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[3]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[3]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[3]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[3]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[3]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[3]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[3]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[3]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[3]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[3]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[3]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[3]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[3]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr3_scanin),
                  .scan_out(cpx_arbr3_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb cpx_arbr4 (
                  // Outputs
                  .arb_grant_a          (arb4_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb4_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb4_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb4_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb4_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[4]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[4]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[4]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[4]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[4]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[4]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[4]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[4]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[4]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[4]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[4]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[4]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[4]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[4]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[4]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[4]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[4]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[4]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[4]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[4]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr4_scanin),
                  .scan_out(cpx_arbr4_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb cpx_arbr5 (
                  // Outputs
                  .arb_grant_a          (arb5_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb5_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb5_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb5_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb5_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[5]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[5]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[5]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[5]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[5]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[5]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[5]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[5]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[5]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[5]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[5]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_t),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[5]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_t),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[5]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_t),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[5]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_t),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[5]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_t),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[5]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_t),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[5]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_t),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[5]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_t),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[5]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[5]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr5_scanin),
                  .scan_out(cpx_arbr5_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rt),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rt),
                 .ccx_aclk                (ccx_aclk_arb_rt),
                 .ccx_bclk                (ccx_bclk_arb_rt)
                 );

ccx_arb cpx_arbr6 (
                  // Outputs
                  .arb_grant_a          (arb6_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb6_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb6_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb6_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb6_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[6]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[6]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[6]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[6]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[6]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[6]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[6]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[6]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[6]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[6]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[6]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[6]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[6]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[6]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[6]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[6]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[6]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[6]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[6]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[6]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr6_scanin),
                  .scan_out(cpx_arbr6_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );

ccx_arb cpx_arbr7 (
                  // Outputs
                  .arb_grant_a          (arb7_grant_r_a[8:0]),     // Templated
                  .arb_q0_holdbar_a     (arb7_q0_holdbar_r_a[8:0]), // Templated
                  .arb_qsel0_a          (arb7_qsel0_r_a[8:0]),     // Templated
                  .arb_qsel1_a          (arb7_qsel1_r_a[8:0]),     // Templated
                  .arb_shift_a          (arb7_shift_r_a[8:0]),     // Templated
                  .arb_src0_grant_a     (cpx_sctag0_grant_a_unused[7]), // Templated
                  .arb_src1_grant_a     (cpx_sctag1_grant_a_unused[7]), // Templated
                  .arb_src2_grant_a     (cpx_sctag2_grant_a_unused[7]), // Templated
                  .arb_src3_grant_a     (cpx_sctag3_grant_a_unused[7]), // Templated
                  .arb_src4_grant_a     (cpx_sctag4_grant_a[7]), // Templated
                  .arb_src5_grant_a     (cpx_sctag5_grant_a[7]), // Templated
                  .arb_src6_grant_a     (cpx_sctag6_grant_a[7]), // Templated
                  .arb_src7_grant_a     (cpx_sctag7_grant_a[7]), // Templated
                  .arb_src8_grant_a     (cpx_sctag8_grant_a_unused[7]   ),     // Templated
                  .ccx_dest_atom_a      (ccx_dest_atom_a_r_unused[7]    ),                      // Templated
                  .ccx_dest_data_rdy_a  (ccx_dest_data_rdy_a_r_unused[7]),                      // Templated
                  // Inputs
                  .src0_arb_atom_q      (sctag0_cpx_atom_rq_b),    // Templated
                  .src0_arb_req_q       (sctag0_cpx_req_rq[7]),  // Templated
                  .src1_arb_atom_q      (sctag1_cpx_atom_rq_b),    // Templated
                  .src1_arb_req_q       (sctag1_cpx_req_rq[7]),  // Templated
                  .src2_arb_atom_q      (sctag2_cpx_atom_rq_b),    // Templated
                  .src2_arb_req_q       (sctag2_cpx_req_rq[7]),  // Templated
                  .src3_arb_atom_q      (sctag3_cpx_atom_rq_b),    // Templated
                  .src3_arb_req_q       (sctag3_cpx_req_rq[7]),  // Templated
                  .src4_arb_atom_q      (sctag4_cpx_atom_rq_b),    // Templated
                  .src4_arb_req_q       (sctag4_cpx_req_rq[7]),  // Templated
                  .src5_arb_atom_q      (sctag5_cpx_atom_rq_b),    // Templated
                  .src5_arb_req_q       (sctag5_cpx_req_rq[7]),  // Templated
                  .src6_arb_atom_q      (sctag6_cpx_atom_rq_b),    // Templated
                  .src6_arb_req_q       (sctag6_cpx_req_rq[7]),  // Templated
                  .src7_arb_atom_q      (sctag7_cpx_atom_rq_b),    // Templated
                  .src7_arb_req_q       (sctag7_cpx_req_rq[7]),  // Templated
                  .src8_arb_atom_q      (1'b0),                  // Templated
                  .src8_arb_req_q       (io_cpx_req_rq[7]),      // Templated
                  .stall_q_d1              (1'b0),                  // Templated
                  .scan_in(cpx_arbr7_scanin),
                  .scan_out(cpx_arbr7_scanout),
                  .l2clk                (l2clk),
                 .tcu_scan_en             (tcu_scan_en_arb_rb),
                 .tcu_pce_ov              (tcu_pce_ov_arb_rb),
                 .ccx_aclk                (ccx_aclk_arb_rb),
                 .ccx_bclk                (ccx_bclk_arb_rb)
                 );


//buffer scan out
cpx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_scanout     (
	.din	(scan_out_prebuf),
	.dout	(scan_out)
);

// fixscan start:
assign bfd4_scanin               = scan_in                  ;
assign bfd5_scanin               = bfd4_scanout             ;
assign bfg4_scanin               = bfd5_scanout             ;
assign bfg1_scanin               = bfg4_scanout             ;
assign bfd1_scanin               = bfg1_scanout             ;
assign bfd0_scanin               = bfd1_scanout             ;
assign bfg0_scanin               = bfd0_scanout           ;
assign bfg8_req_scanin           = bfg0_scanout             ;
assign bfg8_scanin               = bfg8_req_scanout         ;
assign bfd_io_scanin             = bfg8_scanout             ;
assign cpx_arbl0_scanin          = bfd_io_scanout             ;
assign cpx_arbl4_scanin          = cpx_arbl0_scanout        ;
assign cpx_arbl5_scanin          = cpx_arbl4_scanout        ;
assign cpx_arbl1_scanin          = cpx_arbl5_scanout        ;
assign cpx_arbl3_scanin          = cpx_arbl1_scanout        ;
assign cpx_arbl7_scanin          = cpx_arbl3_scanout        ;
assign cpx_arbl2_scanin          = cpx_arbl7_scanout        ;
assign cpx_arbl6_scanin          = cpx_arbl2_scanout        ;
assign bfg2_scanin               = cpx_arbl6_scanout        ;
assign bfd2_scanin               = bfg2_scanout             ;
assign bfd3_scanin               = bfd2_scanout             ;
assign bfg3_scanin               = bfd3_scanout             ;
assign bfg7_scanin               = bfg3_scanout             ;
assign bfd7_scanin               = bfg7_scanout             ;
assign bfd6_scanin               = bfd7_scanout             ;
assign bfg6_scanin               = bfd6_scanout             ;
assign cpx_arbr6_scanin          = bfg6_scanout             ;
assign cpx_arbr2_scanin          = cpx_arbr6_scanout        ;
assign cpx_arbr7_scanin          = cpx_arbr2_scanout        ;
assign cpx_arbr3_scanin          = cpx_arbr7_scanout        ;
assign cpx_arbr1_scanin          = cpx_arbr3_scanout        ;
assign cpx_arbr5_scanin          = cpx_arbr1_scanout        ;
assign cpx_arbr4_scanin          = cpx_arbr5_scanout        ;
assign cpx_arbr0_scanin          = cpx_arbr4_scanout        ;
assign bfg5_scanin               = cpx_arbr0_scanout        ;
assign cpx_dpa_scanin            = bfg5_scanout             ;
assign scan_out_prebuf           = cpx_dpa_scanout          ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_8 (
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
//   buff macro
//
//





module cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_9 (
  din, 
  dout);
  input [8:0] din;
  output [8:0] dout;






buff #(9)  d0_0 (
.in(din[8:0]),
.out(dout[8:0])
);








endmodule




//
//   invert macro
//
//





module cpx_inv_diode_macro__dinv_16x__stack_150c__width_150 (
  din, 
  dout);
  input [149:0] din;
  output [149:0] dout;






inv #(150)  d0_0 (
.in(din[149:0]),
.out(dout[149:0])
);









endmodule




//
//   buff macro
//
//





module cpx_buff_macro__dbuff_8x__minbuff_1__stack_150c__width_150 (
  din, 
  dout);
  input [149:0] din;
  output [149:0] dout;






buff #(150)  d0_0 (
.in(din[149:0]),
.out(dout[149:0])
);








endmodule



//
//   buff macro
//
//





module cpx_buff_macro__dbuff_16x__rep_1__stack_none__width_1 (
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





module cpx_buff_macro__dbuff_16x__rep_1__stack_none__width_8 (
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
//   buff macro
//
//





module cpx_buff_macro__dbuff_48x__rep_1__stack_10r__width_10 (
  din, 
  dout);
  input [9:0] din;
  output [9:0] dout;






buff #(10)  d0_0 (
.in(din[9:0]),
.out(dout[9:0])
);








endmodule





//
//   buff macro
//
//





module cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_2 (
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





module cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_8 (
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
//   buff macro
//
//





module cpx_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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
//   invert macro
//
//





module cpx_inv_macro__dinv_40x__stack_150c__width_150 (
  din, 
  dout);
  input [149:0] din;
  output [149:0] dout;






inv #(150)  d0_0 (
.in(din[149:0]),
.out(dout[149:0])
);









endmodule



//
//   invert macro
//
//





module cpx_inv_macro__dinv_32x__stack_150c__width_150 (
  din, 
  dout);
  input [149:0] din;
  output [149:0] dout;






inv #(150)  d0_0 (
.in(din[149:0]),
.out(dout[149:0])
);









endmodule

`endif // `ifndef FPGA

`ifdef FPGA

`timescale 1 ns / 100 ps
module cpx(cpx_io_grant_cx, cpx_sctag0_grant_cx, cpx_sctag1_grant_cx, 
	cpx_sctag2_grant_cx, cpx_sctag3_grant_cx, cpx_sctag4_grant_cx, 
	cpx_sctag5_grant_cx, cpx_sctag6_grant_cx, cpx_sctag7_grant_cx, 
	cpx_spc0_data_cx2, cpx_spc1_data_cx2, cpx_spc2_data_cx2, 
	cpx_spc3_data_cx2, cpx_spc4_data_cx2, cpx_spc5_data_cx2, 
	cpx_spc6_data_cx2, cpx_spc7_data_cx2, io_cpx_data_ca, io_cpx_req_cq, 
	sctag0_cpx_atom_cq, sctag0_cpx_data_ca, sctag0_cpx_req_cq, 
	sctag1_cpx_atom_cq, sctag1_cpx_data_ca, sctag1_cpx_req_cq, 
	sctag2_cpx_atom_cq, sctag2_cpx_data_ca, sctag2_cpx_req_cq, 
	sctag3_cpx_atom_cq, sctag3_cpx_data_ca, sctag3_cpx_req_cq, 
	sctag4_cpx_atom_cq, sctag4_cpx_data_ca, sctag4_cpx_req_cq, 
	sctag5_cpx_atom_cq, sctag5_cpx_data_ca, sctag5_cpx_req_cq, 
	sctag6_cpx_atom_cq, sctag6_cpx_data_ca, sctag6_cpx_req_cq, 
	sctag7_cpx_atom_cq, sctag7_cpx_data_ca, sctag7_cpx_req_cq, tcu_scan_en, 
	l2clk, scan_in, tcu_pce_ov, ccx_aclk, ccx_bclk, scan_out);

	output	[7:0]		cpx_io_grant_cx;
	output	[7:0]		cpx_sctag0_grant_cx;
	output	[7:0]		cpx_sctag1_grant_cx;
	output	[7:0]		cpx_sctag2_grant_cx;
	output	[7:0]		cpx_sctag3_grant_cx;
	output	[7:0]		cpx_sctag4_grant_cx;
	output	[7:0]		cpx_sctag5_grant_cx;
	output	[7:0]		cpx_sctag6_grant_cx;
	output	[7:0]		cpx_sctag7_grant_cx;
	output	[145:0]		cpx_spc0_data_cx2;
	output	[145:0]		cpx_spc1_data_cx2;
	output	[145:0]		cpx_spc2_data_cx2;
	output	[145:0]		cpx_spc3_data_cx2;
	output	[145:0]		cpx_spc4_data_cx2;
	output	[145:0]		cpx_spc5_data_cx2;
	output	[145:0]		cpx_spc6_data_cx2;
	output	[145:0]		cpx_spc7_data_cx2;
	input	[145:0]		io_cpx_data_ca;
	input	[7:0]		io_cpx_req_cq;
	input			sctag0_cpx_atom_cq;
	input	[145:0]		sctag0_cpx_data_ca;
	input	[7:0]		sctag0_cpx_req_cq;
	input			sctag1_cpx_atom_cq;
	input	[145:0]		sctag1_cpx_data_ca;
	input	[7:0]		sctag1_cpx_req_cq;
	input			sctag2_cpx_atom_cq;
	input	[145:0]		sctag2_cpx_data_ca;
	input	[7:0]		sctag2_cpx_req_cq;
	input			sctag3_cpx_atom_cq;
	input	[145:0]		sctag3_cpx_data_ca;
	input	[7:0]		sctag3_cpx_req_cq;
	input			sctag4_cpx_atom_cq;
	input	[145:0]		sctag4_cpx_data_ca;
	input	[7:0]		sctag4_cpx_req_cq;
	input			sctag5_cpx_atom_cq;
	input	[145:0]		sctag5_cpx_data_ca;
	input	[7:0]		sctag5_cpx_req_cq;
	input			sctag6_cpx_atom_cq;
	input	[145:0]		sctag6_cpx_data_ca;
	input	[7:0]		sctag6_cpx_req_cq;
	input			sctag7_cpx_atom_cq;
	input	[145:0]		sctag7_cpx_data_ca;
	input	[7:0]		sctag7_cpx_req_cq;
	input			tcu_scan_en;
	input			l2clk;
	input			scan_in;
	input			tcu_pce_ov;
	input			ccx_aclk;
	input			ccx_bclk;
	output			scan_out;

	wire	[7:0]		cpx_sctag0_grant_a;
	wire	[7:0]		cpx_sctag0_grant_a_0;
	wire	[7:0]		cpx_sctag1_grant_a;
	wire	[7:0]		cpx_sctag1_grant_a_0;
	wire	[7:0]		cpx_sctag2_grant_a;
	wire	[7:0]		cpx_sctag2_grant_a_0;
	wire	[7:0]		cpx_sctag3_grant_a;
	wire	[7:0]		cpx_sctag3_grant_a_0;
	wire	[7:0]		cpx_sctag4_grant_a;
	wire	[7:0]		cpx_sctag4_grant_a_0;
	wire	[7:0]		cpx_sctag5_grant_a;
	wire	[7:0]		cpx_sctag5_grant_a_0;
	wire	[7:0]		cpx_sctag6_grant_a;
	wire	[7:0]		cpx_sctag6_grant_a_0;
	wire	[7:0]		cpx_sctag7_grant_a;
	wire	[7:0]		cpx_sctag7_grant_a_0;
	wire	[7:0]		cpx_io_grant_a;
	wire	[7:0]		cpx_io_grant_a_0;
	wire			tcu_scan_en_bfg_0;
	wire			tcu_pce_ov_bfg_0;
	wire			ccx_aclk_bfg_0;
	wire			ccx_bclk_bfg_0;
	wire			bfg0_scanin;
	wire			bfg0_scanout;
	wire			tcu_scan_en_bfd_lt;
	wire			tcu_pce_ov_bfd_lt;
	wire			ccx_aclk_bfd_lt;
	wire			ccx_bclk_bfd_lt;
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
	wire			tcu_scan_en_bfg_2_unused;
	wire			tcu_pce_ov_bfg_2_unused;
	wire			ccx_aclk_bfg_2_unused;
	wire			ccx_bclk_bfg_2_unused;
	wire			bfg2_scanin;
	wire			bfg2_scanout;
	wire			tcu_scan_en_bfd_lb;
	wire			tcu_pce_ov_bfd_lb;
	wire			ccx_aclk_bfd_lb;
	wire			ccx_bclk_bfd_lb;
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
	wire			tcu_scan_en_bfg_4_unused;
	wire			tcu_pce_ov_bfg_4_unused;
	wire			ccx_aclk_bfg_4_unused;
	wire			ccx_bclk_bfg_4_unused;
	wire			bfg4_scanin;
	wire			bfg4_scanout;
	wire			tcu_scan_en_bfd_rt;
	wire			tcu_pce_ov_bfd_rt;
	wire			ccx_aclk_bfd_rt;
	wire			ccx_bclk_bfd_rt;
	wire			tcu_scan_en_bfg_5_unused;
	wire			tcu_pce_ov_bfg_5_unused;
	wire			ccx_aclk_bfg_5_unused;
	wire			ccx_bclk_bfg_5_unused;
	wire			bfg5_scanin;
	wire			bfg5_scanout;
	wire			tcu_scan_en_bfg_6_unused;
	wire			tcu_pce_ov_bfg_6_unused;
	wire			ccx_aclk_bfg_6_unused;
	wire			ccx_bclk_bfg_6_unused;
	wire			bfg6_scanin;
	wire			bfg6_scanout;
	wire			tcu_scan_en_bfd_rb;
	wire			tcu_pce_ov_bfd_rb;
	wire			ccx_aclk_bfd_rb;
	wire			ccx_bclk_bfd_rb;
	wire			tcu_scan_en_bfg_7_unused;
	wire			tcu_pce_ov_bfg_7_unused;
	wire			ccx_aclk_bfg_7_unused;
	wire			ccx_bclk_bfg_7_unused;
	wire			bfg7_scanin;
	wire			bfg7_scanout;
	wire			tcu_scan_en_bfg_8_unused;
	wire			tcu_pce_ov_bfg_8_unused;
	wire			ccx_aclk_bfg_8_unused;
	wire			ccx_bclk_bfg_8_unused;
	wire			bfg8_scanin;
	wire			bfg8_scanout;
	wire	[145:0]		io_cpx_data_ca_buf;
	wire	[145:0]		io_cpx_data_ca_d1_;
	wire			tcu_scan_en_bfd_io_unused;
	wire			tcu_pce_ov_bfd_io_unused;
	wire			ccx_aclk_bfd_io_unused;
	wire			ccx_bclk_bfd_io_unused;
	wire			bfd_io_scanin;
	wire			bfd_io_scanout;
	wire	[7:0]		sctag0_cpx_req_cq_0_l;
	wire			sctag0_cpx_atom_cq_0_l;
	wire	[7:0]		sctag0_cpx_req_cq_0_r;
	wire			sctag0_cpx_atom_cq_0_r;
	wire	[7:0]		sctag1_cpx_req_cq_0_l;
	wire			sctag1_cpx_atom_cq_0_l;
	wire	[7:0]		sctag1_cpx_req_cq_0_r;
	wire			sctag1_cpx_atom_cq_0_r;
	wire	[7:0]		sctag2_cpx_req_cq_0_l;
	wire			sctag2_cpx_atom_cq_0_l;
	wire	[7:0]		sctag2_cpx_req_cq_0_r;
	wire			sctag2_cpx_atom_cq_0_r;
	wire	[7:0]		sctag3_cpx_req_cq_0_l;
	wire			sctag3_cpx_atom_cq_0_l;
	wire	[7:0]		sctag3_cpx_req_cq_0_r;
	wire			sctag3_cpx_atom_cq_0_r;
	wire	[7:0]		sctag4_cpx_req_cq_0_l;
	wire			sctag4_cpx_atom_cq_0_l;
	wire	[7:0]		sctag4_cpx_req_cq_0_r;
	wire			sctag4_cpx_atom_cq_0_r;
	wire	[7:0]		sctag5_cpx_req_cq_0_l;
	wire			sctag5_cpx_atom_cq_0_l;
	wire	[7:0]		sctag5_cpx_req_cq_0_r;
	wire			sctag5_cpx_atom_cq_0_r;
	wire	[7:0]		sctag6_cpx_req_cq_0_l;
	wire			sctag6_cpx_atom_cq_0_l;
	wire	[7:0]		sctag6_cpx_req_cq_0_r;
	wire			sctag6_cpx_atom_cq_0_r;
	wire	[7:0]		sctag7_cpx_req_cq_0_l;
	wire			sctag7_cpx_atom_cq_0_l;
	wire	[7:0]		sctag7_cpx_req_cq_0_r;
	wire			sctag7_cpx_atom_cq_0_r;
	wire	[7:0]		io_cpx_req_cq_buf;
	wire	[7:0]		io_cpx_req_cq_d1;
	wire			tcu_scan_en_bfg_req_8_unused;
	wire			tcu_pce_ov_bfg_req_8_unused;
	wire			ccx_aclk_bfg_req_8_unused;
	wire			ccx_bclk_bfg_req_8_unused;
	wire			bfg8_req_scanin;
	wire			bfg8_req_scanout;
	wire	[149:0]		sctag0_cpx_data_a_;
	wire	[149:0]		sctag0_cpx_data_a;
	wire	[149:0]		sctag1_cpx_data_a_;
	wire	[149:0]		sctag1_cpx_data_a;
	wire	[149:0]		sctag2_cpx_data_a_;
	wire	[149:0]		sctag2_cpx_data_a;
	wire	[149:0]		sctag3_cpx_data_a_;
	wire	[149:0]		sctag3_cpx_data_a;
	wire	[149:0]		sctag4_cpx_data_a_;
	wire	[149:0]		sctag4_cpx_data_a;
	wire	[149:0]		sctag5_cpx_data_a_;
	wire	[149:0]		sctag5_cpx_data_a;
	wire	[149:0]		sctag6_cpx_data_a_;
	wire	[149:0]		sctag6_cpx_data_a;
	wire	[149:0]		sctag7_cpx_data_a_;
	wire	[149:0]		sctag7_cpx_data_a;
	wire	[149:0]		io_cpx_data_a_;
	wire	[149:0]		io_cpx_data_a;
	wire			ccx_aclk_dpa_t;
	wire			ccx_bclk_dpa_t;
	wire			tcu_pce_ov_dpa_t;
	wire			tcu_scan_en_dpa_t;
	wire			ccx_aclk_dpa_b;
	wire			ccx_bclk_dpa_b;
	wire			tcu_pce_ov_dpa_b;
	wire			tcu_scan_en_dpa_b;
	wire	[3:0]		cpx_spc0_data_x_unused;
	wire	[149:0]		cpx_spc0_data_x_;
	wire	[3:0]		cpx_spc1_data_x_unused;
	wire	[149:0]		cpx_spc1_data_x_;
	wire	[3:0]		cpx_spc2_data_x_unused;
	wire	[149:0]		cpx_spc2_data_x_;
	wire	[3:0]		cpx_spc3_data_x_unused;
	wire	[149:0]		cpx_spc3_data_x_;
	wire	[3:0]		cpx_spc4_data_x_unused;
	wire	[149:0]		cpx_spc4_data_x_;
	wire	[3:0]		cpx_spc5_data_x_unused;
	wire	[149:0]		cpx_spc5_data_x_;
	wire	[3:0]		cpx_spc6_data_x_unused;
	wire	[149:0]		cpx_spc6_data_x_;
	wire	[3:0]		cpx_spc7_data_x_unused;
	wire	[149:0]		cpx_spc7_data_x_;
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
	wire			cpx_dpa_scanin;
	wire			cpx_dpa_scanout;
	wire	[145:0]		cpx_spc0_data_cx2_prebuf;
	wire			bfd0_scanin;
	wire			bfd0_scanout;
	wire			tcu_scan_en_bfd_1;
	wire			tcu_pce_ov_bfd_1;
	wire			ccx_aclk_bfd_1;
	wire			ccx_bclk_bfd_1;
	wire	[145:0]		cpx_spc1_data_cx2_prebuf;
	wire			bfd1_scanin;
	wire			bfd1_scanout;
	wire	[145:0]		cpx_spc2_data_cx2_prebuf;
	wire			bfd2_scanin;
	wire			bfd2_scanout;
	wire			tcu_scan_en_bfd_3;
	wire			tcu_pce_ov_bfd_3;
	wire			ccx_aclk_bfd_3;
	wire			ccx_bclk_bfd_3;
	wire	[145:0]		cpx_spc3_data_cx2_prebuf;
	wire			bfd3_scanin;
	wire			bfd3_scanout;
	wire	[145:0]		cpx_spc4_data_cx2_prebuf;
	wire			bfd4_scanin;
	wire			bfd4_scanout;
	wire			tcu_scan_en_bfd_5;
	wire			tcu_pce_ov_bfd_5;
	wire			ccx_aclk_bfd_5;
	wire			ccx_bclk_bfd_5;
	wire	[145:0]		cpx_spc5_data_cx2_prebuf;
	wire			bfd5_scanin;
	wire			bfd5_scanout;
	wire	[145:0]		cpx_spc6_data_cx2_prebuf;
	wire			bfd6_scanin;
	wire			bfd6_scanout;
	wire			tcu_scan_en_bfd_7;
	wire			tcu_pce_ov_bfd_7;
	wire			ccx_aclk_bfd_7;
	wire			ccx_bclk_bfd_7;
	wire	[145:0]		cpx_spc7_data_cx2_prebuf;
	wire			bfd7_scanin;
	wire			bfd7_scanout;
	wire	[7:0]		sctag0_cpx_req_lq;
	wire			sctag0_cpx_atom_lq_t;
	wire			sctag0_cpx_atom_lq_b;
	wire	[7:0]		sctag1_cpx_req_lq;
	wire			sctag1_cpx_atom_lq_t;
	wire			sctag1_cpx_atom_lq_b;
	wire	[7:0]		sctag2_cpx_req_lq;
	wire			sctag2_cpx_atom_lq_t;
	wire			sctag2_cpx_atom_lq_b;
	wire	[7:0]		sctag3_cpx_req_lq;
	wire			sctag3_cpx_atom_lq_t;
	wire			sctag3_cpx_atom_lq_b;
	wire	[7:0]		sctag4_cpx_req_lq;
	wire			sctag4_cpx_atom_lq_t;
	wire			sctag4_cpx_atom_lq_b;
	wire	[7:0]		sctag5_cpx_req_lq;
	wire			sctag5_cpx_atom_lq_t;
	wire			sctag5_cpx_atom_lq_b;
	wire	[7:0]		sctag6_cpx_req_lq;
	wire			sctag6_cpx_atom_lq_t;
	wire			sctag6_cpx_atom_lq_b;
	wire	[7:0]		sctag7_cpx_req_lq;
	wire			sctag7_cpx_atom_lq_t;
	wire			sctag7_cpx_atom_lq_b;
	wire	[7:0]		io_cpx_req_lq;
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
	wire	[7:0]		cpx_sctag4_grant_a_unused;
	wire	[7:0]		cpx_sctag5_grant_a_unused;
	wire	[7:0]		cpx_sctag6_grant_a_unused;
	wire	[7:0]		cpx_sctag7_grant_a_unused;
	wire	[7:0]		ccx_dest_atom_a_l_unused;
	wire	[7:0]		ccx_dest_data_rdy_a_l_unused;
	wire			cpx_arbl0_scanin;
	wire			cpx_arbl0_scanout;
	wire			cpx_arbl1_scanin;
	wire			cpx_arbl1_scanout;
	wire			cpx_arbl2_scanin;
	wire			cpx_arbl2_scanout;
	wire			cpx_arbl3_scanin;
	wire			cpx_arbl3_scanout;
	wire			cpx_arbl4_scanin;
	wire			cpx_arbl4_scanout;
	wire			cpx_arbl5_scanin;
	wire			cpx_arbl5_scanout;
	wire			cpx_arbl6_scanin;
	wire			cpx_arbl6_scanout;
	wire			cpx_arbl7_scanin;
	wire			cpx_arbl7_scanout;
	wire	[7:0]		sctag0_cpx_req_rq;
	wire			sctag0_cpx_atom_rq_t;
	wire			sctag0_cpx_atom_rq_b;
	wire	[7:0]		sctag1_cpx_req_rq;
	wire			sctag1_cpx_atom_rq_t;
	wire			sctag1_cpx_atom_rq_b;
	wire	[7:0]		sctag2_cpx_req_rq;
	wire			sctag2_cpx_atom_rq_t;
	wire			sctag2_cpx_atom_rq_b;
	wire	[7:0]		sctag3_cpx_req_rq;
	wire			sctag3_cpx_atom_rq_t;
	wire			sctag3_cpx_atom_rq_b;
	wire	[7:0]		sctag4_cpx_req_rq;
	wire			sctag4_cpx_atom_rq_t;
	wire			sctag4_cpx_atom_rq_b;
	wire	[7:0]		sctag5_cpx_req_rq;
	wire			sctag5_cpx_atom_rq_t;
	wire			sctag5_cpx_atom_rq_b;
	wire	[7:0]		sctag6_cpx_req_rq;
	wire			sctag6_cpx_atom_rq_t;
	wire			sctag6_cpx_atom_rq_b;
	wire	[7:0]		sctag7_cpx_req_rq;
	wire			sctag7_cpx_atom_rq_t;
	wire			sctag7_cpx_atom_rq_b;
	wire	[7:0]		io_cpx_req_rq;
	wire	[7:0]		cpx_sctag0_grant_a_unused;
	wire	[7:0]		cpx_sctag1_grant_a_unused;
	wire	[7:0]		cpx_sctag2_grant_a_unused;
	wire	[7:0]		cpx_sctag3_grant_a_unused;
	wire	[7:0]		cpx_sctag8_grant_a_unused;
	wire	[7:0]		ccx_dest_atom_a_r_unused;
	wire	[7:0]		ccx_dest_data_rdy_a_r_unused;
	wire			cpx_arbr0_scanin;
	wire			cpx_arbr0_scanout;
	wire			cpx_arbr1_scanin;
	wire			cpx_arbr1_scanout;
	wire			cpx_arbr2_scanin;
	wire			cpx_arbr2_scanout;
	wire			cpx_arbr3_scanin;
	wire			cpx_arbr3_scanout;
	wire			cpx_arbr4_scanin;
	wire			cpx_arbr4_scanout;
	wire			cpx_arbr5_scanin;
	wire			cpx_arbr5_scanout;
	wire			cpx_arbr6_scanin;
	wire			cpx_arbr6_scanout;
	wire			cpx_arbr7_scanin;
	wire			cpx_arbr7_scanout;
	wire			scan_out_prebuf;

	assign cpx_spc0_data_x_unused[3:0] = cpx_spc0_data_x_[149:146];
	assign cpx_spc1_data_x_unused[3:0] = cpx_spc1_data_x_[149:146];
	assign cpx_spc2_data_x_unused[3:0] = cpx_spc2_data_x_[149:146];
	assign cpx_spc3_data_x_unused[3:0] = cpx_spc3_data_x_[149:146];
	assign cpx_spc4_data_x_unused[3:0] = cpx_spc4_data_x_[149:146];
	assign cpx_spc5_data_x_unused[3:0] = cpx_spc5_data_x_[149:146];
	assign cpx_spc6_data_x_unused[3:0] = cpx_spc6_data_x_[149:146];
	assign cpx_spc7_data_x_unused[3:0] = cpx_spc7_data_x_[149:146];
	assign bfd4_scanin = scan_in;
	assign bfd5_scanin = bfd4_scanout;
	assign bfg4_scanin = bfd5_scanout;
	assign bfg1_scanin = bfg4_scanout;
	assign bfd1_scanin = bfg1_scanout;
	assign bfd0_scanin = bfd1_scanout;
	assign bfg0_scanin = bfd0_scanout;
	assign bfg8_req_scanin = bfg0_scanout;
	assign bfg8_scanin = bfg8_req_scanout;
	assign bfd_io_scanin = bfg8_scanout;
	assign cpx_arbl0_scanin = bfd_io_scanout;
	assign cpx_arbl4_scanin = cpx_arbl0_scanout;
	assign cpx_arbl5_scanin = cpx_arbl4_scanout;
	assign cpx_arbl1_scanin = cpx_arbl5_scanout;
	assign cpx_arbl3_scanin = cpx_arbl1_scanout;
	assign cpx_arbl7_scanin = cpx_arbl3_scanout;
	assign cpx_arbl2_scanin = cpx_arbl7_scanout;
	assign cpx_arbl6_scanin = cpx_arbl2_scanout;
	assign bfg2_scanin = cpx_arbl6_scanout;
	assign bfd2_scanin = bfg2_scanout;
	assign bfd3_scanin = bfd2_scanout;
	assign bfg3_scanin = bfd3_scanout;
	assign bfg7_scanin = bfg3_scanout;
	assign bfd7_scanin = bfg7_scanout;
	assign bfd6_scanin = bfd7_scanout;
	assign bfg6_scanin = bfd6_scanout;
	assign cpx_arbr6_scanin = bfg6_scanout;
	assign cpx_arbr2_scanin = cpx_arbr6_scanout;
	assign cpx_arbr7_scanin = cpx_arbr2_scanout;
	assign cpx_arbr3_scanin = cpx_arbr7_scanout;
	assign cpx_arbr1_scanin = cpx_arbr3_scanout;
	assign cpx_arbr5_scanin = cpx_arbr1_scanout;
	assign cpx_arbr4_scanin = cpx_arbr5_scanout;
	assign cpx_arbr0_scanin = cpx_arbr4_scanout;
	assign bfg5_scanin = cpx_arbr0_scanout;
	assign cpx_dpa_scanin = bfg5_scanout;
	assign scan_out_prebuf = cpx_dpa_scanout;

	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct0(
		.din				(cpx_sctag0_grant_a[7:0]), 
		.dout				(cpx_sctag0_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct1(
		.din				(cpx_sctag1_grant_a[7:0]), 
		.dout				(cpx_sctag1_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct2(
		.din				(cpx_sctag2_grant_a[7:0]), 
		.dout				(cpx_sctag2_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct3(
		.din				(cpx_sctag3_grant_a[7:0]), 
		.dout				(cpx_sctag3_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct4(
		.din				(cpx_sctag4_grant_a[7:0]), 
		.dout				(cpx_sctag4_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct5(
		.din				(cpx_sctag5_grant_a[7:0]), 
		.dout				(cpx_sctag5_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct6(
		.din				(cpx_sctag6_grant_a[7:0]), 
		.dout				(cpx_sctag6_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_sct7(
		.din				(cpx_sctag7_grant_a[7:0]), 
		.dout				(cpx_sctag7_grant_a_0[7:0]));
	buff_macro__dbuff_32x__rep_1__stack_none__width_8 i_bufg_io(
		.din				(cpx_io_grant_a[7:0]), 
		.dout				(cpx_io_grant_a_0[7:0]));
	cpx_bfg_dp bfg0(
		.cpx_sctag_grant_cx		(cpx_sctag0_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_0), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_0), 
		.ccx_aclk_out			(ccx_aclk_bfg_0), 
		.ccx_bclk_out			(ccx_bclk_bfg_0), 
		.cpx_sctag_grant_ca		(cpx_sctag0_grant_a_0[7:0]), 
		.scan_in			(bfg0_scanin), 
		.scan_out			(bfg0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk			(ccx_aclk_bfd_lt), 
		.ccx_bclk			(ccx_bclk_bfd_lt));
	cpx_bfg_dp bfg1(
		.cpx_sctag_grant_cx		(cpx_sctag1_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_1_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_1_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_1_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_1_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag1_grant_a_0[7:0]), 
		.scan_in			(bfg1_scanin), 
		.scan_out			(bfg1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	cpx_bfg_dp bfg2(
		.cpx_sctag_grant_cx		(cpx_sctag2_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_2_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_2_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_2_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_2_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag2_grant_a_0[7:0]), 
		.scan_in			(bfg2_scanin), 
		.scan_out			(bfg2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lb), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lb), 
		.ccx_aclk			(ccx_aclk_bfd_lb), 
		.ccx_bclk			(ccx_bclk_bfd_lb));
	cpx_bfg_dp bfg3(
		.cpx_sctag_grant_cx		(cpx_sctag3_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_3_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_3_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_3_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_3_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag3_grant_a_0[7:0]), 
		.scan_in			(bfg3_scanin), 
		.scan_out			(bfg3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	cpx_bfg_dp bfg4(
		.cpx_sctag_grant_cx		(cpx_sctag4_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_4_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_4_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_4_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_4_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag4_grant_a_0[7:0]), 
		.scan_in			(bfg4_scanin), 
		.scan_out			(bfg4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_rt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_rt), 
		.ccx_aclk			(ccx_aclk_bfd_rt), 
		.ccx_bclk			(ccx_bclk_bfd_rt));
	cpx_bfg_dp bfg5(
		.cpx_sctag_grant_cx		(cpx_sctag5_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_5_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_5_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_5_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_5_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag5_grant_a_0[7:0]), 
		.scan_in			(bfg5_scanin), 
		.scan_out			(bfg5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	cpx_bfg_dp bfg6(
		.cpx_sctag_grant_cx		(cpx_sctag6_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_6_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_6_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_6_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_6_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag6_grant_a_0[7:0]), 
		.scan_in			(bfg6_scanin), 
		.scan_out			(bfg6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_rb), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_rb), 
		.ccx_aclk			(ccx_aclk_bfd_rb), 
		.ccx_bclk			(ccx_bclk_bfd_rb));
	cpx_bfg_dp bfg7(
		.cpx_sctag_grant_cx		(cpx_sctag7_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_7_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_7_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_7_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_7_unused), 
		.cpx_sctag_grant_ca		(cpx_sctag7_grant_a_0[7:0]), 
		.scan_in			(bfg7_scanin), 
		.scan_out			(bfg7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	cpx_bfg_dp bfg8(
		.cpx_sctag_grant_cx		(cpx_io_grant_cx[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_8_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_8_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_8_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_8_unused), 
		.cpx_sctag_grant_ca		(cpx_io_grant_a_0[7:0]), 
		.scan_in			(bfg8_scanin), 
		.scan_out			(bfg8_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfg_0), 
		.tcu_pce_ov			(tcu_pce_ov_bfg_0), 
		.ccx_aclk			(ccx_aclk_bfg_0), 
		.ccx_bclk			(ccx_bclk_bfg_0));
	cpx_ob1_dp buf_io(
		.cpx_spc_data_cx2_prebuf	(io_cpx_data_ca[145:0]), 
		.cpx_spc_data_cx2		(io_cpx_data_ca_buf[145:0]));
	cpx_bfd_dp bfd_io(
		.cpx_spc_data_cx2		(io_cpx_data_ca_d1_[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_io_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_io_unused), 
		.ccx_aclk_out			(ccx_aclk_bfd_io_unused), 
		.ccx_bclk_out			(ccx_bclk_bfd_io_unused), 
		.cpx_spc_data_x_		(io_cpx_data_ca_buf[145:0]), 
		.scan_in			(bfd_io_scanin), 
		.scan_out			(bfd_io_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk			(ccx_aclk_bfd_lt), 
		.ccx_bclk			(ccx_bclk_bfd_lt));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct0_l(
		.din				({sctag0_cpx_req_cq[7:0],
		sctag0_cpx_atom_cq}), 
		.dout				({sctag0_cpx_req_cq_0_l[7:0],
		sctag0_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct0_r(
		.din				({sctag0_cpx_req_cq[7:0],
		sctag0_cpx_atom_cq}), 
		.dout				({sctag0_cpx_req_cq_0_r[7:0],
		sctag0_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct1_l(
		.din				({sctag1_cpx_req_cq[7:0],
		sctag1_cpx_atom_cq}), 
		.dout				({sctag1_cpx_req_cq_0_l[7:0],
		sctag1_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct1_r(
		.din				({sctag1_cpx_req_cq[7:0],
		sctag1_cpx_atom_cq}), 
		.dout				({sctag1_cpx_req_cq_0_r[7:0],
		sctag1_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct2_l(
		.din				({sctag2_cpx_req_cq[7:0],
		sctag2_cpx_atom_cq}), 
		.dout				({sctag2_cpx_req_cq_0_l[7:0],
		sctag2_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct2_r(
		.din				({sctag2_cpx_req_cq[7:0],
		sctag2_cpx_atom_cq}), 
		.dout				({sctag2_cpx_req_cq_0_r[7:0],
		sctag2_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct3_l(
		.din				({sctag3_cpx_req_cq[7:0],
		sctag3_cpx_atom_cq}), 
		.dout				({sctag3_cpx_req_cq_0_l[7:0],
		sctag3_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct3_r(
		.din				({sctag3_cpx_req_cq[7:0],
		sctag3_cpx_atom_cq}), 
		.dout				({sctag3_cpx_req_cq_0_r[7:0],
		sctag3_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct4_l(
		.din				({sctag4_cpx_req_cq[7:0],
		sctag4_cpx_atom_cq}), 
		.dout				({sctag4_cpx_req_cq_0_l[7:0],
		sctag4_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct4_r(
		.din				({sctag4_cpx_req_cq[7:0],
		sctag4_cpx_atom_cq}), 
		.dout				({sctag4_cpx_req_cq_0_r[7:0],
		sctag4_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct5_l(
		.din				({sctag5_cpx_req_cq[7:0],
		sctag5_cpx_atom_cq}), 
		.dout				({sctag5_cpx_req_cq_0_l[7:0],
		sctag5_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct5_r(
		.din				({sctag5_cpx_req_cq[7:0],
		sctag5_cpx_atom_cq}), 
		.dout				({sctag5_cpx_req_cq_0_r[7:0],
		sctag5_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct6_l(
		.din				({sctag6_cpx_req_cq[7:0],
		sctag6_cpx_atom_cq}), 
		.dout				({sctag6_cpx_req_cq_0_l[7:0],
		sctag6_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct6_r(
		.din				({sctag6_cpx_req_cq[7:0],
		sctag6_cpx_atom_cq}), 
		.dout				({sctag6_cpx_req_cq_0_r[7:0],
		sctag6_cpx_atom_cq_0_r}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct7_l(
		.din				({sctag7_cpx_req_cq[7:0],
		sctag7_cpx_atom_cq}), 
		.dout				({sctag7_cpx_req_cq_0_l[7:0],
		sctag7_cpx_atom_cq_0_l}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_9 i_bufq_sct7_r(
		.din				({sctag7_cpx_req_cq[7:0],
		sctag7_cpx_atom_cq}), 
		.dout				({sctag7_cpx_req_cq_0_r[7:0],
		sctag7_cpx_atom_cq_0_r}));
	buff_macro__dbuff_16x__rep_1__stack_none__width_8 buf8_req(
		.din				(io_cpx_req_cq[7:0]), 
		.dout				(io_cpx_req_cq_buf[7:0]));
	cpx_bfg_dp bfg8_req(
		.cpx_sctag_grant_cx		(io_cpx_req_cq_d1[7:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfg_req_8_unused), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfg_req_8_unused), 
		.ccx_aclk_out			(ccx_aclk_bfg_req_8_unused), 
		.ccx_bclk_out			(ccx_bclk_bfg_req_8_unused), 
		.cpx_sctag_grant_ca		(io_cpx_req_cq_buf[7:0]), 
		.scan_in			(bfg8_req_scanin), 
		.scan_out			(bfg8_req_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfg_0), 
		.tcu_pce_ov			(tcu_pce_ov_bfg_0), 
		.ccx_aclk			(ccx_aclk_bfg_0), 
		.ccx_bclk			(ccx_bclk_bfg_0));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct0_0(
		.din				({4'b0,
		sctag0_cpx_data_ca[145:0]}), 
		.dout				(sctag0_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct0_1(
		.din				({sctag0_cpx_data_a_[149:0]}), 
		.dout				(sctag0_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct1_0(
		.din				({4'b0,
		sctag1_cpx_data_ca[145:0]}), 
		.dout				(sctag1_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct1_1(
		.din				({sctag1_cpx_data_a_[149:0]}), 
		.dout				(sctag1_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct2_0(
		.din				({4'b0,
		sctag2_cpx_data_ca[145:0]}), 
		.dout				(sctag2_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct2_1(
		.din				({sctag2_cpx_data_a_[149:0]}), 
		.dout				(sctag2_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct3_0(
		.din				({4'b0,
		sctag3_cpx_data_ca[145:0]}), 
		.dout				(sctag3_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct3_1(
		.din				({sctag3_cpx_data_a_[149:0]}), 
		.dout				(sctag3_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct4_0(
		.din				({4'b0,
		sctag4_cpx_data_ca[145:0]}), 
		.dout				(sctag4_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct4_1(
		.din				({sctag4_cpx_data_a_[149:0]}), 
		.dout				(sctag4_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct5_0(
		.din				({4'b0,
		sctag5_cpx_data_ca[145:0]}), 
		.dout				(sctag5_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct5_1(
		.din				({sctag5_cpx_data_a_[149:0]}), 
		.dout				(sctag5_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct6_0(
		.din				({4'b0,
		sctag6_cpx_data_ca[145:0]}), 
		.dout				(sctag6_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct6_1(
		.din				({sctag6_cpx_data_a_[149:0]}), 
		.dout				(sctag6_cpx_data_a[149:0]));
	inv_diode_macro__dinv_16x__stack_150c__width_150 i_inv_sct7_0(
		.din				({4'b0,
		sctag7_cpx_data_ca[145:0]}), 
		.dout				(sctag7_cpx_data_a_[149:0]));
	inv_macro__dinv_40x__stack_150c__width_150 i_inv_sct7_1(
		.din				({sctag7_cpx_data_a_[149:0]}), 
		.dout				(sctag7_cpx_data_a[149:0]));
	buff_macro__dbuff_8x__minbuff_1__stack_150c__width_150 i_bufd_io_1(
		.din				({4'b0,
		io_cpx_data_ca_d1_[145:0]}), 
		.dout				(io_cpx_data_a_[149:0]));
	inv_macro__dinv_32x__stack_150c__width_150 i_inv_io_1(
		.din				({io_cpx_data_a_[149:0]}), 
		.dout				(io_cpx_data_a[149:0]));
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
	cpx_dpa cpx_dpa(
		.cpx_spc0_data_x_		(cpx_spc0_data_x_[149:0]), 
		.cpx_spc1_data_x_		(cpx_spc1_data_x_[149:0]), 
		.cpx_spc2_data_x_		(cpx_spc2_data_x_[149:0]), 
		.cpx_spc3_data_x_		(cpx_spc3_data_x_[149:0]), 
		.cpx_spc4_data_x_		(cpx_spc4_data_x_[149:0]), 
		.cpx_spc5_data_x_		(cpx_spc5_data_x_[149:0]), 
		.cpx_spc6_data_x_		(cpx_spc6_data_x_[149:0]), 
		.cpx_spc7_data_x_		(cpx_spc7_data_x_[149:0]), 
		.arb0_grant_l_a			(arb0_grant_l_a[8:0]), 
		.arb0_q0_holdbar_l_a		(arb0_q0_holdbar_l_a[8:0]), 
		.arb0_qsel0_l_a			(arb0_qsel0_l_a[8:0]), 
		.arb0_qsel1_l_a			(arb0_qsel1_l_a[8:0]), 
		.arb0_shift_l_a			(arb0_shift_l_a[8:0]), 
		.arb1_grant_l_a			(arb1_grant_l_a[8:0]), 
		.arb1_q0_holdbar_l_a		(arb1_q0_holdbar_l_a[8:0]), 
		.arb1_qsel0_l_a			(arb1_qsel0_l_a[8:0]), 
		.arb1_qsel1_l_a			(arb1_qsel1_l_a[8:0]), 
		.arb1_shift_l_a			(arb1_shift_l_a[8:0]), 
		.arb2_grant_l_a			(arb2_grant_l_a[8:0]), 
		.arb2_q0_holdbar_l_a		(arb2_q0_holdbar_l_a[8:0]), 
		.arb2_qsel0_l_a			(arb2_qsel0_l_a[8:0]), 
		.arb2_qsel1_l_a			(arb2_qsel1_l_a[8:0]), 
		.arb2_shift_l_a			(arb2_shift_l_a[8:0]), 
		.arb3_grant_l_a			(arb3_grant_l_a[8:0]), 
		.arb3_q0_holdbar_l_a		(arb3_q0_holdbar_l_a[8:0]), 
		.arb3_qsel0_l_a			(arb3_qsel0_l_a[8:0]), 
		.arb3_qsel1_l_a			(arb3_qsel1_l_a[8:0]), 
		.arb3_shift_l_a			(arb3_shift_l_a[8:0]), 
		.arb4_grant_l_a			(arb4_grant_l_a[8:0]), 
		.arb4_q0_holdbar_l_a		(arb4_q0_holdbar_l_a[8:0]), 
		.arb4_qsel0_l_a			(arb4_qsel0_l_a[8:0]), 
		.arb4_qsel1_l_a			(arb4_qsel1_l_a[8:0]), 
		.arb4_shift_l_a			(arb4_shift_l_a[8:0]), 
		.arb5_grant_l_a			(arb5_grant_l_a[8:0]), 
		.arb5_q0_holdbar_l_a		(arb5_q0_holdbar_l_a[8:0]), 
		.arb5_qsel0_l_a			(arb5_qsel0_l_a[8:0]), 
		.arb5_qsel1_l_a			(arb5_qsel1_l_a[8:0]), 
		.arb5_shift_l_a			(arb5_shift_l_a[8:0]), 
		.arb6_grant_l_a			(arb6_grant_l_a[8:0]), 
		.arb6_q0_holdbar_l_a		(arb6_q0_holdbar_l_a[8:0]), 
		.arb6_qsel0_l_a			(arb6_qsel0_l_a[8:0]), 
		.arb6_qsel1_l_a			(arb6_qsel1_l_a[8:0]), 
		.arb6_shift_l_a			(arb6_shift_l_a[8:0]), 
		.arb7_grant_l_a			(arb7_grant_l_a[8:0]), 
		.arb7_q0_holdbar_l_a		(arb7_q0_holdbar_l_a[8:0]), 
		.arb7_qsel0_l_a			(arb7_qsel0_l_a[8:0]), 
		.arb7_qsel1_l_a			(arb7_qsel1_l_a[8:0]), 
		.arb7_shift_l_a			(arb7_shift_l_a[8:0]), 
		.arb0_grant_r_a			(arb0_grant_r_a[8:0]), 
		.arb0_q0_holdbar_r_a		(arb0_q0_holdbar_r_a[8:0]), 
		.arb0_qsel0_r_a			(arb0_qsel0_r_a[8:0]), 
		.arb0_qsel1_r_a			(arb0_qsel1_r_a[8:0]), 
		.arb0_shift_r_a			(arb0_shift_r_a[8:0]), 
		.arb1_grant_r_a			(arb1_grant_r_a[8:0]), 
		.arb1_q0_holdbar_r_a		(arb1_q0_holdbar_r_a[8:0]), 
		.arb1_qsel0_r_a			(arb1_qsel0_r_a[8:0]), 
		.arb1_qsel1_r_a			(arb1_qsel1_r_a[8:0]), 
		.arb1_shift_r_a			(arb1_shift_r_a[8:0]), 
		.arb2_grant_r_a			(arb2_grant_r_a[8:0]), 
		.arb2_q0_holdbar_r_a		(arb2_q0_holdbar_r_a[8:0]), 
		.arb2_qsel0_r_a			(arb2_qsel0_r_a[8:0]), 
		.arb2_qsel1_r_a			(arb2_qsel1_r_a[8:0]), 
		.arb2_shift_r_a			(arb2_shift_r_a[8:0]), 
		.arb3_grant_r_a			(arb3_grant_r_a[8:0]), 
		.arb3_q0_holdbar_r_a		(arb3_q0_holdbar_r_a[8:0]), 
		.arb3_qsel0_r_a			(arb3_qsel0_r_a[8:0]), 
		.arb3_qsel1_r_a			(arb3_qsel1_r_a[8:0]), 
		.arb3_shift_r_a			(arb3_shift_r_a[8:0]), 
		.arb4_grant_r_a			(arb4_grant_r_a[8:0]), 
		.arb4_q0_holdbar_r_a		(arb4_q0_holdbar_r_a[8:0]), 
		.arb4_qsel0_r_a			(arb4_qsel0_r_a[8:0]), 
		.arb4_qsel1_r_a			(arb4_qsel1_r_a[8:0]), 
		.arb4_shift_r_a			(arb4_shift_r_a[8:0]), 
		.arb5_grant_r_a			(arb5_grant_r_a[8:0]), 
		.arb5_q0_holdbar_r_a		(arb5_q0_holdbar_r_a[8:0]), 
		.arb5_qsel0_r_a			(arb5_qsel0_r_a[8:0]), 
		.arb5_qsel1_r_a			(arb5_qsel1_r_a[8:0]), 
		.arb5_shift_r_a			(arb5_shift_r_a[8:0]), 
		.arb6_grant_r_a			(arb6_grant_r_a[8:0]), 
		.arb6_q0_holdbar_r_a		(arb6_q0_holdbar_r_a[8:0]), 
		.arb6_qsel0_r_a			(arb6_qsel0_r_a[8:0]), 
		.arb6_qsel1_r_a			(arb6_qsel1_r_a[8:0]), 
		.arb6_shift_r_a			(arb6_shift_r_a[8:0]), 
		.arb7_grant_r_a			(arb7_grant_r_a[8:0]), 
		.arb7_q0_holdbar_r_a		(arb7_q0_holdbar_r_a[8:0]), 
		.arb7_qsel0_r_a			(arb7_qsel0_r_a[8:0]), 
		.arb7_qsel1_r_a			(arb7_qsel1_r_a[8:0]), 
		.arb7_shift_r_a			(arb7_shift_r_a[8:0]), 
		.io_cpx_data_a			(io_cpx_data_a[149:0]), 
		.scache0_cpx_data_a		(sctag0_cpx_data_a[149:0]), 
		.scache1_cpx_data_a		(sctag1_cpx_data_a[149:0]), 
		.scache2_cpx_data_a		(sctag2_cpx_data_a[149:0]), 
		.scache3_cpx_data_a		(sctag3_cpx_data_a[149:0]), 
		.scache4_cpx_data_a		(sctag4_cpx_data_a[149:0]), 
		.scache5_cpx_data_a		(sctag5_cpx_data_a[149:0]), 
		.scache6_cpx_data_a		(sctag6_cpx_data_a[149:0]), 
		.scache7_cpx_data_a		(sctag7_cpx_data_a[149:0]), 
		.scan_in			(cpx_dpa_scanin), 
		.scan_out			(cpx_dpa_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en_t			(tcu_scan_en_dpa_t), 
		.tcu_pce_ov_t			(tcu_pce_ov_dpa_t), 
		.ccx_aclk_t			(ccx_aclk_dpa_t), 
		.ccx_bclk_t			(ccx_bclk_dpa_t), 
		.tcu_scan_en_b			(tcu_scan_en_dpa_b), 
		.tcu_pce_ov_b			(tcu_pce_ov_dpa_b), 
		.ccx_aclk_b			(ccx_aclk_dpa_b), 
		.ccx_bclk_b			(ccx_bclk_dpa_b));
	cpx_bfd_dp bfd0(
		.cpx_spc_data_cx2		
		(cpx_spc0_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_lt), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_lt), 
		.ccx_aclk_out			(ccx_aclk_bfd_lt), 
		.ccx_bclk_out			(ccx_bclk_bfd_lt), 
		.cpx_spc_data_x_		(cpx_spc0_data_x_[145:0]), 
		.scan_in			(bfd0_scanin), 
		.scan_out			(bfd0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_1), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_1), 
		.ccx_aclk			(ccx_aclk_bfd_1), 
		.ccx_bclk			(ccx_bclk_bfd_1));
	cpx_ob1_dp ob_0(
		.cpx_spc_data_cx2		(cpx_spc0_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc0_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd1(
		.cpx_spc_data_cx2		
		(cpx_spc1_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_1), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_1), 
		.ccx_aclk_out			(ccx_aclk_bfd_1), 
		.ccx_bclk_out			(ccx_bclk_bfd_1), 
		.cpx_spc_data_x_		(cpx_spc1_data_x_[145:0]), 
		.scan_in			(bfd1_scanin), 
		.scan_out			(bfd1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	cpx_ob1_dp ob_1(
		.cpx_spc_data_cx2		(cpx_spc1_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc1_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd2(
		.cpx_spc_data_cx2		
		(cpx_spc2_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_lb), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_lb), 
		.ccx_aclk_out			(ccx_aclk_bfd_lb), 
		.ccx_bclk_out			(ccx_bclk_bfd_lb), 
		.cpx_spc_data_x_		(cpx_spc2_data_x_[145:0]), 
		.scan_in			(bfd2_scanin), 
		.scan_out			(bfd2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_3), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_3), 
		.ccx_aclk			(ccx_aclk_bfd_3), 
		.ccx_bclk			(ccx_bclk_bfd_3));
	cpx_ob1_dp ob_2(
		.cpx_spc_data_cx2		(cpx_spc2_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc2_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd3(
		.cpx_spc_data_cx2		
		(cpx_spc3_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_3), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_3), 
		.ccx_aclk_out			(ccx_aclk_bfd_3), 
		.ccx_bclk_out			(ccx_bclk_bfd_3), 
		.cpx_spc_data_x_		(cpx_spc3_data_x_[145:0]), 
		.scan_in			(bfd3_scanin), 
		.scan_out			(bfd3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	cpx_ob1_dp ob_3(
		.cpx_spc_data_cx2		(cpx_spc3_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc3_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd4(
		.cpx_spc_data_cx2		
		(cpx_spc4_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_rt), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_rt), 
		.ccx_aclk_out			(ccx_aclk_bfd_rt), 
		.ccx_bclk_out			(ccx_bclk_bfd_rt), 
		.cpx_spc_data_x_		(cpx_spc4_data_x_[145:0]), 
		.scan_in			(bfd4_scanin), 
		.scan_out			(bfd4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_5), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_5), 
		.ccx_aclk			(ccx_aclk_bfd_5), 
		.ccx_bclk			(ccx_bclk_bfd_5));
	cpx_ob2_dp ob_4(
		.cpx_spc_data_cx2		(cpx_spc4_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc4_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd5(
		.cpx_spc_data_cx2		
		(cpx_spc5_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_5), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_5), 
		.ccx_aclk_out			(ccx_aclk_bfd_5), 
		.ccx_bclk_out			(ccx_bclk_bfd_5), 
		.cpx_spc_data_x_		(cpx_spc5_data_x_[145:0]), 
		.scan_in			(bfd5_scanin), 
		.scan_out			(bfd5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_t), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_t), 
		.ccx_aclk			(ccx_aclk_bfd_t), 
		.ccx_bclk			(ccx_bclk_bfd_t));
	cpx_ob2_dp ob_5(
		.cpx_spc_data_cx2		(cpx_spc5_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc5_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd6(
		.cpx_spc_data_cx2		
		(cpx_spc6_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_rb), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_rb), 
		.ccx_aclk_out			(ccx_aclk_bfd_rb), 
		.ccx_bclk_out			(ccx_bclk_bfd_rb), 
		.cpx_spc_data_x_		(cpx_spc6_data_x_[145:0]), 
		.scan_in			(bfd6_scanin), 
		.scan_out			(bfd6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_7), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_7), 
		.ccx_aclk			(ccx_aclk_bfd_7), 
		.ccx_bclk			(ccx_bclk_bfd_7));
	cpx_ob2_dp ob_6(
		.cpx_spc_data_cx2		(cpx_spc6_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc6_data_cx2_prebuf[145:0]));
	cpx_bfd_dp bfd7(
		.cpx_spc_data_cx2		
		(cpx_spc7_data_cx2_prebuf[145:0]), 
		.tcu_scan_en_out		(tcu_scan_en_bfd_7), 
		.tcu_pce_ov_out			(tcu_pce_ov_bfd_7), 
		.ccx_aclk_out			(ccx_aclk_bfd_7), 
		.ccx_bclk_out			(ccx_bclk_bfd_7), 
		.cpx_spc_data_x_		(cpx_spc7_data_x_[145:0]), 
		.scan_in			(bfd7_scanin), 
		.scan_out			(bfd7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_bfd_b), 
		.tcu_pce_ov			(tcu_pce_ov_bfd_b), 
		.ccx_aclk			(ccx_aclk_bfd_b), 
		.ccx_bclk			(ccx_bclk_bfd_b));
	cpx_ob2_dp ob_7(
		.cpx_spc_data_cx2		(cpx_spc7_data_cx2[145:0]), 
		.cpx_spc_data_cx2_prebuf	
		(cpx_spc7_data_cx2_prebuf[145:0]));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct0(
		.din				({sctag0_cpx_req_cq_0_l[7:0],
		sctag0_cpx_atom_cq_0_l, sctag0_cpx_atom_cq_0_l}), 
		.dout				({sctag0_cpx_req_lq[7:0],
		sctag0_cpx_atom_lq_t, sctag0_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct1(
		.din				({sctag1_cpx_req_cq_0_l[7:0],
		sctag1_cpx_atom_cq_0_l, sctag1_cpx_atom_cq_0_l}), 
		.dout				({sctag1_cpx_req_lq[7:0],
		sctag1_cpx_atom_lq_t, sctag1_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct2(
		.din				({sctag2_cpx_req_cq_0_l[7:0],
		sctag2_cpx_atom_cq_0_l, sctag2_cpx_atom_cq_0_l}), 
		.dout				({sctag2_cpx_req_lq[7:0],
		sctag2_cpx_atom_lq_t, sctag2_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct3(
		.din				({sctag3_cpx_req_cq_0_l[7:0],
		sctag3_cpx_atom_cq_0_l, sctag3_cpx_atom_cq_0_l}), 
		.dout				({sctag3_cpx_req_lq[7:0],
		sctag3_cpx_atom_lq_t, sctag3_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct4(
		.din				({sctag4_cpx_req_cq_0_l[7:0],
		sctag4_cpx_atom_cq_0_l, sctag4_cpx_atom_cq_0_l}), 
		.dout				({sctag4_cpx_req_lq[7:0],
		sctag4_cpx_atom_lq_t, sctag4_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct5(
		.din				({sctag5_cpx_req_cq_0_l[7:0],
		sctag5_cpx_atom_cq_0_l, sctag5_cpx_atom_cq_0_l}), 
		.dout				({sctag5_cpx_req_lq[7:0],
		sctag5_cpx_atom_lq_t, sctag5_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct6(
		.din				({sctag6_cpx_req_cq_0_l[7:0],
		sctag6_cpx_atom_cq_0_l, sctag6_cpx_atom_cq_0_l}), 
		.dout				({sctag6_cpx_req_lq[7:0],
		sctag6_cpx_atom_lq_t, sctag6_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_l_sct7(
		.din				({sctag7_cpx_req_cq_0_l[7:0],
		sctag7_cpx_atom_cq_0_l, sctag7_cpx_atom_cq_0_l}), 
		.dout				({sctag7_cpx_req_lq[7:0],
		sctag7_cpx_atom_lq_t, sctag7_cpx_atom_lq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_8 i_bufq_l_io(
		.din				({io_cpx_req_cq_d1[7:0]}), 
		.dout				({io_cpx_req_lq[7:0]}));
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
	ccx_arb cpx_arbl0(
		.arb_grant_a			(arb0_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb0_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb0_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb0_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb0_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[0]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[0]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[0]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[0]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[0]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[0]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[0]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[0]), 
		.arb_src8_grant_a		(cpx_io_grant_a[0]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[0]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[0]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[0]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[0]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[0]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[0]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[0]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[0]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[0]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[0]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[0]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl0_scanin), 
		.scan_out			(cpx_arbl0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb cpx_arbl1(
		.arb_grant_a			(arb1_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb1_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb1_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb1_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb1_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[1]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[1]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[1]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[1]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[1]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[1]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[1]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[1]), 
		.arb_src8_grant_a		(cpx_io_grant_a[1]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[1]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[1]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[1]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[1]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[1]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[1]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[1]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[1]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[1]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[1]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[1]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl1_scanin), 
		.scan_out			(cpx_arbl1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb cpx_arbl2(
		.arb_grant_a			(arb2_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb2_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb2_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb2_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb2_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[2]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[2]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[2]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[2]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[2]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[2]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[2]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[2]), 
		.arb_src8_grant_a		(cpx_io_grant_a[2]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[2]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[2]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[2]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[2]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[2]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[2]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[2]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[2]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[2]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[2]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[2]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl2_scanin), 
		.scan_out			(cpx_arbl2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb cpx_arbl3(
		.arb_grant_a			(arb3_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb3_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb3_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb3_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb3_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[3]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[3]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[3]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[3]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[3]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[3]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[3]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[3]), 
		.arb_src8_grant_a		(cpx_io_grant_a[3]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[3]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[3]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[3]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[3]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[3]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[3]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[3]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[3]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[3]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[3]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[3]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl3_scanin), 
		.scan_out			(cpx_arbl3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb cpx_arbl4(
		.arb_grant_a			(arb4_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb4_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb4_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb4_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb4_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[4]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[4]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[4]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[4]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[4]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[4]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[4]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[4]), 
		.arb_src8_grant_a		(cpx_io_grant_a[4]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[4]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[4]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[4]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[4]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[4]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[4]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[4]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[4]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[4]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[4]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[4]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl4_scanin), 
		.scan_out			(cpx_arbl4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb cpx_arbl5(
		.arb_grant_a			(arb5_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb5_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb5_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb5_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb5_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[5]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[5]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[5]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[5]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[5]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[5]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[5]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[5]), 
		.arb_src8_grant_a		(cpx_io_grant_a[5]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[5]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[5]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[5]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[5]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[5]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[5]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[5]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[5]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[5]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[5]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[5]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl5_scanin), 
		.scan_out			(cpx_arbl5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lt), 
		.ccx_aclk			(ccx_aclk_arb_lt), 
		.ccx_bclk			(ccx_bclk_arb_lt));
	ccx_arb cpx_arbl6(
		.arb_grant_a			(arb6_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb6_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb6_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb6_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb6_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[6]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[6]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[6]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[6]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[6]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[6]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[6]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[6]), 
		.arb_src8_grant_a		(cpx_io_grant_a[6]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[6]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[6]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[6]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[6]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[6]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[6]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[6]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[6]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[6]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[6]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[6]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl6_scanin), 
		.scan_out			(cpx_arbl6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	ccx_arb cpx_arbl7(
		.arb_grant_a			(arb7_grant_l_a[8:0]), 
		.arb_q0_holdbar_a		(arb7_q0_holdbar_l_a[8:0]), 
		.arb_qsel0_a			(arb7_qsel0_l_a[8:0]), 
		.arb_qsel1_a			(arb7_qsel1_l_a[8:0]), 
		.arb_shift_a			(arb7_shift_l_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a[7]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a[7]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a[7]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a[7]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a_unused[7]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a_unused[7]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a_unused[7]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a_unused[7]), 
		.arb_src8_grant_a		(cpx_io_grant_a[7]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_l_unused[7]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_l_unused[7]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_lq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_lq[7]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_lq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_lq[7]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_lq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_lq[7]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_lq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_lq[7]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_lq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_lq[7]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_lq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_lq[7]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_lq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_lq[7]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_lq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_lq[7]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_lq[7]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbl7_scanin), 
		.scan_out			(cpx_arbl7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_lb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_lb), 
		.ccx_aclk			(ccx_aclk_arb_lb), 
		.ccx_bclk			(ccx_bclk_arb_lb));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct0(
		.din				({sctag0_cpx_req_cq_0_r[7:0],
		sctag0_cpx_atom_cq_0_r, sctag0_cpx_atom_cq_0_r}), 
		.dout				({sctag0_cpx_req_rq[7:0],
		sctag0_cpx_atom_rq_t, sctag0_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct1(
		.din				({sctag1_cpx_req_cq_0_r[7:0],
		sctag1_cpx_atom_cq_0_r, sctag1_cpx_atom_cq_0_r}), 
		.dout				({sctag1_cpx_req_rq[7:0],
		sctag1_cpx_atom_rq_t, sctag1_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct2(
		.din				({sctag2_cpx_req_cq_0_r[7:0],
		sctag2_cpx_atom_cq_0_r, sctag2_cpx_atom_cq_0_r}), 
		.dout				({sctag2_cpx_req_rq[7:0],
		sctag2_cpx_atom_rq_t, sctag2_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct3(
		.din				({sctag3_cpx_req_cq_0_r[7:0],
		sctag3_cpx_atom_cq_0_r, sctag3_cpx_atom_cq_0_r}), 
		.dout				({sctag3_cpx_req_rq[7:0],
		sctag3_cpx_atom_rq_t, sctag3_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct4(
		.din				({sctag4_cpx_req_cq_0_r[7:0],
		sctag4_cpx_atom_cq_0_r, sctag4_cpx_atom_cq_0_r}), 
		.dout				({sctag4_cpx_req_rq[7:0],
		sctag4_cpx_atom_rq_t, sctag4_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct5(
		.din				({sctag5_cpx_req_cq_0_r[7:0],
		sctag5_cpx_atom_cq_0_r, sctag5_cpx_atom_cq_0_r}), 
		.dout				({sctag5_cpx_req_rq[7:0],
		sctag5_cpx_atom_rq_t, sctag5_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct6(
		.din				({sctag6_cpx_req_cq_0_r[7:0],
		sctag6_cpx_atom_cq_0_r, sctag6_cpx_atom_cq_0_r}), 
		.dout				({sctag6_cpx_req_rq[7:0],
		sctag6_cpx_atom_rq_t, sctag6_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_10 i_bufq_r_sct7(
		.din				({sctag7_cpx_req_cq_0_r[7:0],
		sctag7_cpx_atom_cq_0_r, sctag7_cpx_atom_cq_0_r}), 
		.dout				({sctag7_cpx_req_rq[7:0],
		sctag7_cpx_atom_rq_t, sctag7_cpx_atom_rq_b}));
	buff_macro__dbuff_48x__rep_1__stack_10r__width_8 i_bufq_r_io(
		.din				({io_cpx_req_cq_d1[7:0]}), 
		.dout				({io_cpx_req_rq[7:0]}));
	ccx_arb cpx_arbr0(
		.arb_grant_a			(arb0_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb0_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb0_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb0_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb0_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[0]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[0]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[0]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[0]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[0]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[0]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[0]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[0]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[0]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[0]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[0]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[0]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[0]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[0]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[0]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[0]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[0]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[0]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[0]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[0]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr0_scanin), 
		.scan_out			(cpx_arbr0_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb cpx_arbr1(
		.arb_grant_a			(arb1_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb1_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb1_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb1_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb1_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[1]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[1]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[1]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[1]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[1]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[1]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[1]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[1]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[1]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[1]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[1]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[1]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[1]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[1]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[1]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[1]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[1]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[1]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[1]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[1]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr1_scanin), 
		.scan_out			(cpx_arbr1_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb cpx_arbr2(
		.arb_grant_a			(arb2_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb2_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb2_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb2_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb2_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[2]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[2]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[2]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[2]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[2]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[2]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[2]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[2]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[2]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[2]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[2]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[2]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[2]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[2]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[2]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[2]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[2]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[2]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[2]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[2]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr2_scanin), 
		.scan_out			(cpx_arbr2_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb cpx_arbr3(
		.arb_grant_a			(arb3_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb3_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb3_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb3_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb3_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[3]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[3]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[3]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[3]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[3]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[3]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[3]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[3]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[3]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[3]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[3]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[3]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[3]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[3]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[3]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[3]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[3]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[3]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[3]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[3]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr3_scanin), 
		.scan_out			(cpx_arbr3_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb cpx_arbr4(
		.arb_grant_a			(arb4_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb4_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb4_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb4_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb4_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[4]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[4]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[4]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[4]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[4]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[4]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[4]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[4]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[4]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[4]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[4]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[4]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[4]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[4]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[4]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[4]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[4]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[4]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[4]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[4]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr4_scanin), 
		.scan_out			(cpx_arbr4_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb cpx_arbr5(
		.arb_grant_a			(arb5_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb5_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb5_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb5_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb5_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[5]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[5]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[5]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[5]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[5]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[5]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[5]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[5]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[5]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[5]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[5]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_t), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[5]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_t), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[5]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_t), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[5]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_t), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[5]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_t), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[5]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_t), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[5]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_t), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[5]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_t), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[5]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[5]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr5_scanin), 
		.scan_out			(cpx_arbr5_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rt), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rt), 
		.ccx_aclk			(ccx_aclk_arb_rt), 
		.ccx_bclk			(ccx_bclk_arb_rt));
	ccx_arb cpx_arbr6(
		.arb_grant_a			(arb6_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb6_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb6_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb6_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb6_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[6]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[6]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[6]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[6]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[6]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[6]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[6]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[6]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[6]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[6]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[6]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[6]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[6]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[6]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[6]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[6]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[6]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[6]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[6]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[6]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr6_scanin), 
		.scan_out			(cpx_arbr6_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	ccx_arb cpx_arbr7(
		.arb_grant_a			(arb7_grant_r_a[8:0]), 
		.arb_q0_holdbar_a		(arb7_q0_holdbar_r_a[8:0]), 
		.arb_qsel0_a			(arb7_qsel0_r_a[8:0]), 
		.arb_qsel1_a			(arb7_qsel1_r_a[8:0]), 
		.arb_shift_a			(arb7_shift_r_a[8:0]), 
		.arb_src0_grant_a		(cpx_sctag0_grant_a_unused[7]), 
		.arb_src1_grant_a		(cpx_sctag1_grant_a_unused[7]), 
		.arb_src2_grant_a		(cpx_sctag2_grant_a_unused[7]), 
		.arb_src3_grant_a		(cpx_sctag3_grant_a_unused[7]), 
		.arb_src4_grant_a		(cpx_sctag4_grant_a[7]), 
		.arb_src5_grant_a		(cpx_sctag5_grant_a[7]), 
		.arb_src6_grant_a		(cpx_sctag6_grant_a[7]), 
		.arb_src7_grant_a		(cpx_sctag7_grant_a[7]), 
		.arb_src8_grant_a		(cpx_sctag8_grant_a_unused[7]), 
		.ccx_dest_atom_a		(ccx_dest_atom_a_r_unused[7]), 
		.ccx_dest_data_rdy_a		
		(ccx_dest_data_rdy_a_r_unused[7]), 
		.src0_arb_atom_q		(sctag0_cpx_atom_rq_b), 
		.src0_arb_req_q			(sctag0_cpx_req_rq[7]), 
		.src1_arb_atom_q		(sctag1_cpx_atom_rq_b), 
		.src1_arb_req_q			(sctag1_cpx_req_rq[7]), 
		.src2_arb_atom_q		(sctag2_cpx_atom_rq_b), 
		.src2_arb_req_q			(sctag2_cpx_req_rq[7]), 
		.src3_arb_atom_q		(sctag3_cpx_atom_rq_b), 
		.src3_arb_req_q			(sctag3_cpx_req_rq[7]), 
		.src4_arb_atom_q		(sctag4_cpx_atom_rq_b), 
		.src4_arb_req_q			(sctag4_cpx_req_rq[7]), 
		.src5_arb_atom_q		(sctag5_cpx_atom_rq_b), 
		.src5_arb_req_q			(sctag5_cpx_req_rq[7]), 
		.src6_arb_atom_q		(sctag6_cpx_atom_rq_b), 
		.src6_arb_req_q			(sctag6_cpx_req_rq[7]), 
		.src7_arb_atom_q		(sctag7_cpx_atom_rq_b), 
		.src7_arb_req_q			(sctag7_cpx_req_rq[7]), 
		.src8_arb_atom_q		(1'b0), 
		.src8_arb_req_q			(io_cpx_req_rq[7]), 
		.stall_q_d1			(1'b0), 
		.scan_in			(cpx_arbr7_scanin), 
		.scan_out			(cpx_arbr7_scanout), 
		.l2clk				(l2clk), 
		.tcu_scan_en			(tcu_scan_en_arb_rb), 
		.tcu_pce_ov			(tcu_pce_ov_arb_rb), 
		.ccx_aclk			(ccx_aclk_arb_rb), 
		.ccx_bclk			(ccx_bclk_arb_rb));
	buff_macro__dbuff_16x__rep_1__stack_none__width_1 buf_scanout(
		.din				(scan_out_prebuf), 
		.dout				(scan_out));
endmodule

module buff_macro__dbuff_48x__rep_1__stack_10r__width_10(din, dout);

        input   [9:0]           din;
        output  [9:0]           dout;

        buff #(10) d0_0(
                .in                             (din[9:0]),
                .out                            (dout[9:0]));
endmodule

module buff_macro__dbuff_48x__rep_1__stack_10r__width_8(din, dout);

        input   [7:0]           din;
        output  [7:0]           dout;

        buff #(8) d0_0(
                .in                             (din[7:0]),
                .out                            (dout[7:0]));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_none__width_9(din, dout);

        input   [8:0]           din;
        output  [8:0]           dout;

        buff #(9) d0_0(
                .in                             (din[8:0]),
                .out                            (dout[8:0]));
endmodule

module inv_macro__dinv_40x__stack_150c__width_150(din, dout);

        input   [149:0]         din;
        output  [149:0]         dout;

        inv #(150) d0_0(
                .in                             (din[149:0]),
                .out                            (dout[149:0]));
endmodule

module inv_diode_macro__dinv_16x__stack_150c__width_150(din, dout);

        input   [149:0]         din;
        output  [149:0]         dout;

        inv #(150) d0_0(
                .in                             (din[149:0]),
                .out                            (dout[149:0]));
endmodule

module buff_macro__dbuff_48x__rep_1__stack_10r__width_9(din, dout);

        input   [8:0]           din;
        output  [8:0]           dout;

        buff #(9) d0_0(
                .in                             (din[8:0]),
                .out                            (dout[8:0]));
endmodule

module buff_macro__dbuff_16x__rep_1__stack_none__width_8(din, dout);

        input   [7:0]           din;
        output  [7:0]           dout;

        buff #(8) d0_0(
                .in                             (din[7:0]),
                .out                            (dout[7:0]));
endmodule

module buff_macro__dbuff_32x__rep_1__stack_none__width_8(din, dout);

        input   [7:0]           din;
        output  [7:0]           dout;

        buff #(8) d0_0(
                .in                             (din[7:0]),
                .out                            (dout[7:0]));
endmodule

module buff_macro__dbuff_8x__minbuff_1__stack_150c__width_150(din, dout);

        input   [149:0]         din;
        output  [149:0]         dout;

        buff #(150) d0_0(
                .in                             (din[149:0]),
                .out                            (dout[149:0]));
endmodule

module inv_macro__dinv_32x__stack_150c__width_150(din, dout);

        input   [149:0]         din;
        output  [149:0]         dout;

        inv #(150) d0_0(
                .in                             (din[149:0]),
                .out                            (dout[149:0]));
endmodule


`endif // `ifdef FPGA
