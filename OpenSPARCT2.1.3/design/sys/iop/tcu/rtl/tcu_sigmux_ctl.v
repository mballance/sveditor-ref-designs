// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_sigmux_ctl.v
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
module tcu_sigmux_ctl (
  mio_ext_cmp_clk, 
  mio_ext_dr_clk, 
  tcu_ccu_ext_dr_clk, 
  tcu_ccu_ext_cmp_clk, 
  tcu_ccu_clk_stop, 
  tcu_ccu_io_clk_stop, 
  tcu_rst_clk_stop, 
  tcu_rst_io_clk_stop, 
  mbist_clk_stop, 
  tck_clk_tree, 
  mio_tcu_peu_clk_ext, 
  tcu_peu_clk_ext, 
  mio_tcu_niu_clk_ext, 
  mac_125rx_test_clk, 
  mac_125tx_test_clk, 
  mac_156rx_test_clk, 
  mac_156tx_test_clk, 
  mac_312rx_test_clk, 
  mac_312tx_test_clk, 
  mio_tcu_pll_cmp_bypass, 
  mio_tcu_divider_bypass, 
  tcu_div_bypass, 
  cmp_io_sync_en, 
  io_cmp_sync_en, 
  cmp_dr_sync_en, 
  tcu_peu_testmode, 
  tcu_mac_testmode, 
  tcu_spc0_test_mode, 
  tcu_spc1_test_mode, 
  tcu_spc2_test_mode, 
  tcu_spc3_test_mode, 
  tcu_spc4_test_mode, 
  tcu_spc5_test_mode, 
  tcu_spc6_test_mode, 
  tcu_spc7_test_mode, 
  tcu_rst_scan_mode, 
  tcu_atpg_mode, 
  tcu_mcu_testmode, 
  io_aclk, 
  io_bclk, 
  l2clk, 
  io_tdi, 
  io_scan_in, 
  spc0_tcu_scan_in, 
  spc1_tcu_scan_in, 
  spc2_tcu_scan_in, 
  spc3_tcu_scan_in, 
  spc4_tcu_scan_in, 
  spc5_tcu_scan_in, 
  spc6_tcu_scan_in, 
  spc7_tcu_scan_in, 
  soca_tcu_scan_in, 
  socb_tcu_scan_in, 
  socc_tcu_scan_in, 
  socd_tcu_scan_in, 
  soce_tcu_scan_in, 
  socf_tcu_scan_in, 
  socg_tcu_scan_in, 
  soch_tcu_scan_in, 
  soc0_tcu_scan_in, 
  soc1_tcu_scan_in, 
  soc2_tcu_scan_in, 
  soc3_tcu_scan_in, 
  soc4_tcu_scan_in, 
  soc5_tcu_scan_in, 
  soc6_tcu_scan_in, 
  peu_tcu_scan_in, 
  ccu_tcu_scan_in, 
  jtag_sbs_scan_in, 
  mio_tcu_bs_scan_out, 
  io_test_mode, 
  jtag_ser_scan_q, 
  io_scan_en, 
  clk_stop_ac_trans_counter_initiated, 
  io_ac_test_mode, 
  io_ac_testtrig, 
  ac_test_mode, 
  debug_reg_hard_stop_domain_1st, 
  debug_cycle_counter_stop, 
  debug_event_stop, 
  spc_ss_mode, 
  spc_ss_sel, 
  instr_sstop_csmode, 
  tcu_scan_chain, 
  POR_, 
  jtag_clk_stop_req, 
  jtagclkstop_ov, 
  rst_tcu_flush_init_req, 
  rst_tcu_flush_stop_req, 
  rst_tcu_asicflush_stop_req, 
  rst_wmr_protect, 
  rst_tcu_dbr_gen, 
  tcu_rst_flush_init_ack, 
  tcu_rst_flush_stop_ack, 
  tcu_rst_asicflush_stop_ack, 
  tcu_rst_efu_done, 
  flush_test_protect, 
  tcu_test_protect_cmp, 
  jtag_sck_byp, 
  tcu_sck_bypass, 
  jtag_por_enable, 
  jtag_por_status, 
  jtag_efu_clear_instr, 
  jtag_efu_rvclr, 
  tcu_efu_read_start, 
  tcu_efu_rvclr, 
  jt_scan_in, 
  jt_scan_en, 
  jt_scan_aclk, 
  jt_scan_bclk, 
  ser_scan_out, 
  chain_select, 
  sel_chain, 
  tcu_spc_lbist_start, 
  tap_spc0_mb_aclk, 
  tap_spc0_mb_bclk, 
  tap_spc0_mb_scan_en, 
  tap_spc0_mb_clk_stop, 
  tap_spc1_mb_aclk, 
  tap_spc1_mb_bclk, 
  tap_spc1_mb_scan_en, 
  tap_spc1_mb_clk_stop, 
  tap_spc2_mb_aclk, 
  tap_spc2_mb_bclk, 
  tap_spc2_mb_scan_en, 
  tap_spc2_mb_clk_stop, 
  tap_spc3_mb_aclk, 
  tap_spc3_mb_bclk, 
  tap_spc3_mb_scan_en, 
  tap_spc3_mb_clk_stop, 
  tap_spc4_mb_aclk, 
  tap_spc4_mb_bclk, 
  tap_spc4_mb_scan_en, 
  tap_spc4_mb_clk_stop, 
  tap_spc5_mb_aclk, 
  tap_spc5_mb_bclk, 
  tap_spc5_mb_scan_en, 
  tap_spc5_mb_clk_stop, 
  tap_spc6_mb_aclk, 
  tap_spc6_mb_bclk, 
  tap_spc6_mb_scan_en, 
  tap_spc6_mb_clk_stop, 
  tap_spc7_mb_aclk, 
  tap_spc7_mb_bclk, 
  tap_spc7_mb_scan_en, 
  tap_spc7_mb_clk_stop, 
  scan_in, 
  scan_out, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_jtag_flush_req, 
  tcu_jtag_flush_dly_req, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  jtag_mt_enable, 
  tcu_spc0_aclk, 
  tcu_spc0_bclk, 
  tcu_spc0_scan_en, 
  tcu_spc0_se_scancollar_in, 
  tcu_spc0_se_scancollar_out, 
  tcu_spc0_array_wr_inhibit, 
  tcu_spc1_aclk, 
  tcu_spc1_bclk, 
  tcu_spc1_scan_en, 
  tcu_spc1_se_scancollar_in, 
  tcu_spc1_se_scancollar_out, 
  tcu_spc1_array_wr_inhibit, 
  tcu_spc2_aclk, 
  tcu_spc2_bclk, 
  tcu_spc2_scan_en, 
  tcu_spc2_se_scancollar_in, 
  tcu_spc2_se_scancollar_out, 
  tcu_spc2_array_wr_inhibit, 
  tcu_spc3_aclk, 
  tcu_spc3_bclk, 
  tcu_spc3_scan_en, 
  tcu_spc3_se_scancollar_in, 
  tcu_spc3_se_scancollar_out, 
  tcu_spc3_array_wr_inhibit, 
  tcu_spc4_aclk, 
  tcu_spc4_bclk, 
  tcu_spc4_scan_en, 
  tcu_spc4_se_scancollar_in, 
  tcu_spc4_se_scancollar_out, 
  tcu_spc4_array_wr_inhibit, 
  tcu_spc5_aclk, 
  tcu_spc5_bclk, 
  tcu_spc5_scan_en, 
  tcu_spc5_se_scancollar_in, 
  tcu_spc5_se_scancollar_out, 
  tcu_spc5_array_wr_inhibit, 
  tcu_spc6_aclk, 
  tcu_spc6_bclk, 
  tcu_spc6_scan_en, 
  tcu_spc6_se_scancollar_in, 
  tcu_spc6_se_scancollar_out, 
  tcu_spc6_array_wr_inhibit, 
  tcu_spc7_aclk, 
  tcu_spc7_bclk, 
  tcu_spc7_scan_en, 
  tcu_spc7_se_scancollar_in, 
  tcu_spc7_se_scancollar_out, 
  tcu_spc7_array_wr_inhibit, 
  tcu_asic_aclk, 
  tcu_asic_bclk, 
  tcu_asic_scan_en, 
  tcu_asic_se_scancollar_in, 
  tcu_asic_se_scancollar_out, 
  tcu_asic_array_wr_inhibit, 
  tcu_int_se, 
  tcu_jtag_se, 
  tcu_int_aclk, 
  tcu_int_bclk, 
  tcu_int_ce, 
  tcu_int_ce_to_ucb, 
  tcu_int_pce_ov, 
  tcu_jtag_aclk, 
  tcu_spc0_scan_out, 
  tcu_spc1_scan_out, 
  tcu_spc2_scan_out, 
  tcu_spc3_scan_out, 
  tcu_spc4_scan_out, 
  tcu_spc5_scan_out, 
  tcu_spc6_scan_out, 
  tcu_spc7_scan_out, 
  tcu_soca_scan_out, 
  tcu_socb_scan_out, 
  tcu_socc_scan_out, 
  tcu_socd_scan_out, 
  tcu_soce_scan_out, 
  tcu_socf_scan_out, 
  tcu_socg_scan_out, 
  tcu_soch_scan_out, 
  tcu_soc0_scan_out, 
  tcu_soc1_scan_out, 
  tcu_soc2_scan_out, 
  tcu_soc3_scan_out, 
  tcu_soc4_scan_out, 
  tcu_soc5_scan_out, 
  tcu_soc6_scan_out, 
  tcu_peu_scan_out, 
  tcu_rst_scan_out, 
  tcu_sbs_scan_in, 
  tcu_pins_scan_out, 
  pre_spc0_clk_stop, 
  pre_spc1_clk_stop, 
  pre_spc2_clk_stop, 
  pre_spc3_clk_stop, 
  pre_spc4_clk_stop, 
  pre_spc5_clk_stop, 
  pre_spc6_clk_stop, 
  pre_spc7_clk_stop, 
  pre_bnk0_clk_stop, 
  pre_l2t0_clk_stop, 
  pre_bnk1_clk_stop, 
  pre_l2t1_clk_stop, 
  pre_bnk2_clk_stop, 
  pre_l2t2_clk_stop, 
  pre_bnk3_clk_stop, 
  pre_l2t3_clk_stop, 
  pre_bnk4_clk_stop, 
  pre_l2t4_clk_stop, 
  pre_bnk5_clk_stop, 
  pre_l2t5_clk_stop, 
  pre_bnk6_clk_stop, 
  pre_l2t6_clk_stop, 
  pre_bnk7_clk_stop, 
  pre_l2t7_clk_stop, 
  pre_mcu0_clk_stop, 
  pre_mcu0_io_clk_stop, 
  pre_mcu0_dr_clk_stop, 
  pre_mcu0_fbd_clk_stop, 
  pre_mcu1_clk_stop, 
  pre_mcu1_io_clk_stop, 
  pre_mcu1_dr_clk_stop, 
  pre_mcu1_fbd_clk_stop, 
  pre_mcu2_clk_stop, 
  pre_mcu2_io_clk_stop, 
  pre_mcu2_dr_clk_stop, 
  pre_mcu2_fbd_clk_stop, 
  pre_mcu3_clk_stop, 
  pre_mcu3_io_clk_stop, 
  pre_mcu3_dr_clk_stop, 
  pre_mcu3_fbd_clk_stop, 
  pre_soc0_clk_stop, 
  pre_soc0_io_clk_stop, 
  pre_soc1_io_clk_stop, 
  pre_soc2_io_clk_stop, 
  pre_soc3_clk_stop, 
  pre_soc3_io_clk_stop, 
  tcu_pce_ov, 
  ac_trans_test_counter_start, 
  spc0_tcu_mbist_scan_in, 
  tap_spc0_mb_scan_out, 
  tcu_spc0_mb_scan_out, 
  spc0_tap_mb_scan_in, 
  spc1_tcu_mbist_scan_in, 
  tap_spc1_mb_scan_out, 
  tcu_spc1_mb_scan_out, 
  spc1_tap_mb_scan_in, 
  spc2_tcu_mbist_scan_in, 
  tap_spc2_mb_scan_out, 
  tcu_spc2_mb_scan_out, 
  spc2_tap_mb_scan_in, 
  spc3_tcu_mbist_scan_in, 
  tap_spc3_mb_scan_out, 
  tcu_spc3_mb_scan_out, 
  spc3_tap_mb_scan_in, 
  spc4_tcu_mbist_scan_in, 
  tap_spc4_mb_scan_out, 
  tcu_spc4_mb_scan_out, 
  spc4_tap_mb_scan_in, 
  spc5_tcu_mbist_scan_in, 
  tap_spc5_mb_scan_out, 
  tcu_spc5_mb_scan_out, 
  spc5_tap_mb_scan_in, 
  spc6_tcu_mbist_scan_in, 
  tap_spc6_mb_scan_out, 
  tcu_spc6_mb_scan_out, 
  spc6_tap_mb_scan_in, 
  spc7_tcu_mbist_scan_in, 
  tap_spc7_mb_scan_out, 
  tcu_spc7_mb_scan_out, 
  spc7_tap_mb_scan_in, 
  tcu_sii_mbist_scan_in, 
  tcu_sio_mbist_scan_in, 
  tcu_ncu_mbist_scan_in, 
  tcu_mcu0_mbist_scan_in, 
  tcu_mcu1_mbist_scan_in, 
  tcu_mcu2_mbist_scan_in, 
  tcu_mcu3_mbist_scan_in, 
  tcu_l2b0_mbist_scan_in, 
  tcu_l2b1_mbist_scan_in, 
  tcu_l2b2_mbist_scan_in, 
  tcu_l2b3_mbist_scan_in, 
  tcu_l2b4_mbist_scan_in, 
  tcu_l2b5_mbist_scan_in, 
  tcu_l2b6_mbist_scan_in, 
  tcu_l2b7_mbist_scan_in, 
  tcu_l2t0_mbist_scan_in, 
  tcu_l2t1_mbist_scan_in, 
  tcu_l2t2_mbist_scan_in, 
  tcu_l2t3_mbist_scan_in, 
  tcu_l2t4_mbist_scan_in, 
  tcu_l2t5_mbist_scan_in, 
  tcu_l2t6_mbist_scan_in, 
  tcu_l2t7_mbist_scan_in, 
  tcu_dmu_mbist_scan_in, 
  tcu_peu_mbist_scan_in, 
  rdp_rdmc_mbist_scan_in, 
  rtx_mbist_scan_in, 
  tds_mbist_scan_in, 
  sii_tcu_mbist_scan_out, 
  sio_tcu_mbist_scan_out, 
  ncu_tcu_mbist_scan_out, 
  mcu0_tcu_mbist_scan_out, 
  mcu1_tcu_mbist_scan_out, 
  mcu2_tcu_mbist_scan_out, 
  mcu3_tcu_mbist_scan_out, 
  l2b0_tcu_mbist_scan_out, 
  l2b1_tcu_mbist_scan_out, 
  l2b2_tcu_mbist_scan_out, 
  l2b3_tcu_mbist_scan_out, 
  l2b4_tcu_mbist_scan_out, 
  l2b5_tcu_mbist_scan_out, 
  l2b6_tcu_mbist_scan_out, 
  l2b7_tcu_mbist_scan_out, 
  l2t0_tcu_mbist_scan_out, 
  l2t1_tcu_mbist_scan_out, 
  l2t2_tcu_mbist_scan_out, 
  l2t3_tcu_mbist_scan_out, 
  l2t4_tcu_mbist_scan_out, 
  l2t5_tcu_mbist_scan_out, 
  l2t6_tcu_mbist_scan_out, 
  l2t7_tcu_mbist_scan_out, 
  dmu_tcu_mbist_scan_out, 
  peu_tcu_mbist_scan_out, 
  rdp_rdmc_mbist_scan_out, 
  rtx_mbist_scan_out, 
  tds_mbist_scan_out, 
  spc0_tcu_lbist_scan_out, 
  spc1_tcu_lbist_scan_out, 
  spc2_tcu_lbist_scan_out, 
  spc3_tcu_lbist_scan_out, 
  spc4_tcu_lbist_scan_out, 
  spc5_tcu_lbist_scan_out, 
  spc6_tcu_lbist_scan_out, 
  spc7_tcu_lbist_scan_out, 
  tcu_spc_lbist_scan_in, 
  spc0_tcu_shscan_scan_in, 
  spc1_tcu_shscan_scan_in, 
  spc2_tcu_shscan_scan_in, 
  spc3_tcu_shscan_scan_in, 
  spc4_tcu_shscan_scan_in, 
  spc5_tcu_shscan_scan_in, 
  spc6_tcu_shscan_scan_in, 
  spc7_tcu_shscan_scan_in, 
  tcu_spc0_shscan_scan_out, 
  tcu_spc1_shscan_scan_out, 
  tcu_spc2_shscan_scan_out, 
  tcu_spc3_shscan_scan_out, 
  tcu_spc4_shscan_scan_out, 
  tcu_spc5_shscan_scan_out, 
  tcu_spc6_shscan_scan_out, 
  tcu_spc7_shscan_scan_out, 
  tap_spc0_shscan_scan_out, 
  spc7_tap_shscan_scan_in, 
  jtag_spc_shscanid, 
  tcu_spc_shscanid, 
  jtag_spc0_shscan_clk_stop, 
  jtag_spc1_shscan_clk_stop, 
  jtag_spc2_shscan_clk_stop, 
  jtag_spc3_shscan_clk_stop, 
  jtag_spc4_shscan_clk_stop, 
  jtag_spc5_shscan_clk_stop, 
  jtag_spc6_shscan_clk_stop, 
  jtag_spc7_shscan_clk_stop, 
  tcu_spc0_shscan_clk_stop, 
  tcu_spc1_shscan_clk_stop, 
  tcu_spc2_shscan_clk_stop, 
  tcu_spc3_shscan_clk_stop, 
  tcu_spc4_shscan_clk_stop, 
  tcu_spc5_shscan_clk_stop, 
  tcu_spc6_shscan_clk_stop, 
  tcu_spc7_shscan_clk_stop, 
  jtag_spc_shscan_pce_ov, 
  tcu_spc_shscan_pce_ov, 
  jtag_l2t0_shscan_clk_stop, 
  jtag_l2t1_shscan_clk_stop, 
  jtag_l2t2_shscan_clk_stop, 
  jtag_l2t3_shscan_clk_stop, 
  jtag_l2t4_shscan_clk_stop, 
  jtag_l2t5_shscan_clk_stop, 
  jtag_l2t6_shscan_clk_stop, 
  jtag_l2t7_shscan_clk_stop, 
  jtag_l2t_shscan_pce_ov, 
  tcu_l2t0_shscan_clk_stop, 
  tcu_l2t1_shscan_clk_stop, 
  tcu_l2t2_shscan_clk_stop, 
  tcu_l2t3_shscan_clk_stop, 
  tcu_l2t4_shscan_clk_stop, 
  tcu_l2t5_shscan_clk_stop, 
  tcu_l2t6_shscan_clk_stop, 
  tcu_l2t7_shscan_clk_stop, 
  tcu_l2t_shscan_pce_ov, 
  core_avail, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  bank_avail, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_bypass, 
  tcu_array_wr_inhibit, 
  jtag_upd_cntdly, 
  jtag_cntdly_data, 
  csdel_data, 
  clkseq_stop, 
  clkseq_strt, 
  cycle_stretch, 
  tcu_ccu_clk_stretch, 
  tcu_ccu_mux_sel, 
  wmr_two, 
  start_bisx_por, 
  start_bisx_wmr, 
  stop_bisx_wmr, 
  instr_mbist_diag, 
  soc_mbist_aclk, 
  soc_mbist_bclk, 
  soc_mbist_scan_en, 
  soc0_mbist_clk_stop, 
  mcu0_mbist_clk_stop, 
  mcu1_mbist_clk_stop, 
  mcu2_mbist_clk_stop, 
  mcu3_mbist_clk_stop, 
  l2b0_mbist_clk_stop, 
  l2b1_mbist_clk_stop, 
  l2b2_mbist_clk_stop, 
  l2b3_mbist_clk_stop, 
  l2b4_mbist_clk_stop, 
  l2b5_mbist_clk_stop, 
  l2b6_mbist_clk_stop, 
  l2b7_mbist_clk_stop, 
  l2t0_mbist_clk_stop, 
  l2t1_mbist_clk_stop, 
  l2t2_mbist_clk_stop, 
  l2t3_mbist_clk_stop, 
  l2t4_mbist_clk_stop, 
  l2t5_mbist_clk_stop, 
  l2t6_mbist_clk_stop, 
  l2t7_mbist_clk_stop, 
  dmu_mbist_clk_stop, 
  peu_mbist_clk_stop, 
  rdp_mbist_clk_stop, 
  rtx_mbist_clk_stop, 
  tds_mbist_clk_stop, 
  tcu_srd_atpgse, 
  tcu_srd_atpgd, 
  tcu_mio_scan_out31, 
  tcu_srd_atpgmode, 
  mio_tcu_scan_in31, 
  srd_tcu_atpgq, 
  l2t0_tcu_shscan_scan_out, 
  l2t1_tcu_shscan_scan_out, 
  l2t2_tcu_shscan_scan_out, 
  l2t3_tcu_shscan_scan_out, 
  l2t4_tcu_shscan_scan_out, 
  l2t5_tcu_shscan_scan_out, 
  l2t6_tcu_shscan_scan_out, 
  l2t7_tcu_shscan_scan_out, 
  tcu_l2t0_shscan_scan_in, 
  tcu_l2t1_shscan_scan_in, 
  tcu_l2t2_shscan_scan_in, 
  tcu_l2t3_shscan_scan_in, 
  tcu_l2t4_shscan_scan_in, 
  tcu_l2t5_shscan_scan_in, 
  tcu_l2t6_shscan_scan_in, 
  tcu_l2t7_shscan_scan_in, 
  ucb_csr_wr, 
  ucb_csr_addr, 
  ucb_data_out);
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire ucb_csr_wr_sync_reg_scanin;
wire ucb_csr_wr_sync_reg_scanout;
wire io_cmp_sync_en_local;
wire ucb_csr_wr_sync;
wire ucb_sel_clkstp_delay;
wire ucb_wr_clkstp_delay;
wire por_one;
wire int_flush_d6;
wire ac_tt_trigger_fr;
wire test_mode_block;
wire test_mode_gated;
wire pin_aclk;
wire pin_bclk;
wire pin_scan_en;
wire jt_scan_spc0;
wire jt_scan_spc1;
wire jt_scan_spc2;
wire jt_scan_spc3;
wire jt_scan_spc4;
wire jt_scan_spc5;
wire jt_scan_spc6;
wire jt_scan_spc7;
wire por_two;
wire jt_scan_mtmode;
wire pll_bypass;
wire spc0_stopped;
wire spc1_stopped;
wire spc2_stopped;
wire spc3_stopped;
wire spc4_stopped;
wire spc5_stopped;
wire spc6_stopped;
wire spc7_stopped;
wire bnk0_stopped;
wire l2t0_stopped;
wire bnk1_stopped;
wire l2t1_stopped;
wire bnk2_stopped;
wire l2t2_stopped;
wire bnk3_stopped;
wire l2t3_stopped;
wire bnk4_stopped;
wire l2t4_stopped;
wire bnk5_stopped;
wire l2t5_stopped;
wire bnk6_stopped;
wire l2t6_stopped;
wire bnk7_stopped;
wire l2t7_stopped;
wire mcu0_stopped_tt;
wire mcu1_stopped_tt;
wire mcu2_stopped_tt;
wire mcu3_stopped_tt;
wire soc0_stopped_tt;
wire soc1_stopped_tt;
wire soc2_stopped_tt;
wire soc3_stopped_tt;
wire tt_cmp_mode;
wire tt_io_clk;
wire tt_io_mode;
wire tt_dr_mode;
wire [1:0] pre_tcu_spc0_scan_out;
wire [1:0] pre_tcu_spc1_scan_out;
wire [1:0] pre_tcu_spc2_scan_out;
wire [1:0] pre_tcu_spc3_scan_out;
wire [1:0] pre_tcu_spc4_scan_out;
wire [1:0] pre_tcu_spc5_scan_out;
wire [1:0] pre_tcu_spc6_scan_out;
wire [1:0] pre_tcu_spc7_scan_out;
wire pre_tcu_soca_scan_out;
wire pre_tcu_socb_scan_out;
wire pre_tcu_socc_scan_out;
wire pre_tcu_socd_scan_out;
wire pre_tcu_soce_scan_out;
wire pre_tcu_socf_scan_out;
wire pre_tcu_socg_scan_out;
wire pre_tcu_soch_scan_out;
wire pre_tcu_soc0_scan_out;
wire pre_tcu_soc1_scan_out;
wire pre_tcu_soc2_scan_out;
wire pre_tcu_soc3_scan_out;
wire pre_tcu_soc4_scan_out;
wire pre_tcu_soc5_scan_out;
wire pre_tcu_soc6_scan_out;
wire jt_scan;
wire miobscan_or_peu_scan;
wire tcu_int_nfse;
wire tcu_int_nfce;
wire nf_l1clk;
wire rst_flush_req;
wire flush_tcu;
wire rst_tcu_flush_init_req_hold;
wire rst_tcu_flush_stop_req_hold;
wire fr_l1clk;
wire ok_to_flush;
wire cntstop_equal_max_q;
wire flush_q0;
wire flush;
wire tcusig_foncnt_nf_reg_scanin;
wire tcusig_foncnt_nf_reg_scanout;
wire tcu_int_nfaclk;
wire tcu_int_nfbclk;
wire clear_flush_on_counter;
wire [6:0] flush_oncnt_din;
wire [6:0] flush_oncnt;
wire flush_on_24;
wire flush_on_48;
wire flush_on_72;
wire flush_on_96;
wire tcusig_foffcnt_nf_reg_scanin;
wire tcusig_foffcnt_nf_reg_scanout;
wire clear_flush_off_counter;
wire [6:0] flush_offcnt_din;
wire [6:0] flush_offcnt;
wire flush_off_24;
wire flush_off_48;
wire flush_off_72;
wire flush_off_96;
wire tcusig_fq24_nf_reg_scanin;
wire tcusig_fq24_nf_reg_scanout;
wire enable_flush_q24_delay;
wire flush_q24;
wire tcusig_fq48_nf_reg_scanin;
wire tcusig_fq48_nf_reg_scanout;
wire enable_flush_q48_delay;
wire flush_q48;
wire tcusig_fq72_nf_reg_scanin;
wire tcusig_fq72_nf_reg_scanout;
wire enable_flush_q72_delay;
wire flush_q72;
wire tcusig_fq96_nf_reg_scanin;
wire tcusig_fq96_nf_reg_scanout;
wire enable_flush_q96_delay;
wire flush_q96;
wire flush_off;
wire flush_go;
wire flush_start;
wire tcusig_cstopq48_nf_reg_scanin;
wire tcusig_cstopq48_nf_reg_scanout;
wire enable_cstop_q48_delay;
wire clk_stop_loops_all_off;
wire clk_stop_loops_all_off_q48;
wire clk_stop_loops_all_off_q128;
wire tcusig_flushdly_reg_scanin;
wire tcusig_flushdly_reg_scanout;
wire cntstart;
wire clk_stop_loops_all_on;
wire cntstop_equal_max;
wire tcusig_fireq_reg_scanin;
wire tcusig_fireq_reg_scanout;
wire fireq;
wire tcusig_fsreq_reg_scanin;
wire tcusig_fsreq_reg_scanout;
wire int_flush_d12;
wire tcusig_rstsm_nf_reg_scanin;
wire tcusig_rstsm_nf_reg_scanout;
wire [1:0] rst_sm_new;
wire [1:0] rst_sm_dout;
wire [1:0] rst_sm;
wire wmr_one;
wire tcusig_fiack_reg_scanin;
wire tcusig_fiack_reg_scanout;
wire tcu_rst_flush_init_ack_int;
wire tcu_rst_flush_init_ack_pre;
wire flush_clk_stop_active;
wire tcusig_tcuf_nf_reg_scanin;
wire tcusig_tcuf_nf_reg_scanout;
wire flush_tcu_req;
wire flush_tcu_req_hld;
wire tcusig_tcuasicf_nf_reg_scanin;
wire tcusig_tcuasicf_nf_reg_scanout;
wire asicflush_tcu;
wire asicflush_tcu_req;
wire asicflush_tcu_req_hld;
wire tcusig_intflush_nf_reg_scanin;
wire tcusig_intflush_nf_reg_scanout;
wire int_flush;
wire int_flush_d;
wire int_flush_d2;
wire int_flush_d3;
wire int_flush_d4;
wire int_flush_d5;
wire int_flush_d7;
wire int_flush_d8;
wire int_flush_d9;
wire int_flush_d10;
wire int_flush_d11;
wire tcusig_efctl_reg_scanin;
wire tcusig_efctl_reg_scanout;
wire efctl_clear;
wire [5:0] efctl_din;
wire [5:0] efctl_dout;
wire efu_clr_ok;
wire efctl_hold;
wire tcusig_efcnt_reg_scanin;
wire tcusig_efcnt_reg_scanout;
wire efcnt_clear;
wire [14:0] efcnt_din;
wire [14:0] efcnt_dout;
wire efcnt_pre_hold;
wire efcnt_hold;
wire jtag_efu_clear_instr_sync;
wire efu_done_int;
wire jtag_por_active;
wire strt_cnt_clr_;
wire hard_stop_via_reg_din;
wire clock_stop_active;
wire hard_stop_via_reg;
wire coreavail_clk_stop_active;
wire jtag_clk_stop_active;
wire debug_stop_req;
wire stop_req;
wire jtmb_clk_stop;
wire tcusig_clkstopviareg_reg_scanin;
wire tcusig_clkstopviareg_reg_scanout;
wire clk_stop_loops_off;
wire tcusig_jtagclkstop_reg_scanin;
wire tcusig_jtagclkstop_reg_scanout;
wire jtag_clk_stop_clear_;
wire jtag_clk_stop;
wire tcusig_flushclkstop_reg_scanin;
wire tcusig_flushclkstop_reg_scanout;
wire flush_clk_stop_in;
wire flush_clk_stop_active_l;
wire flush_clk_stop;
wire flush_clear_;
wire tcusig_warmrp_reg_scanin;
wire tcusig_warmrp_reg_scanout;
wire rst_wmr_protect_d;
wire rst_wmr_protect_d2;
wire rst_wmr_protect_sync;
wire tcusig_coreavailclkstop_reg_scanin;
wire tcusig_coreavailclkstop_reg_scanout;
wire coreavail_clear;
wire coreavail_clk_stop;
wire coreavail_clk_stop_active_dout;
wire core_avail_qualified;
wire [7:0] core_avail_pre_hold;
wire [7:0] bank_avail_pre_hold;
wire [7:0] core_avail_pre_hold_l;
wire [7:0] bank_avail_pre_hold_l;
wire tcusig_ca_reg_scanin;
wire tcusig_ca_reg_scanout;
wire ca_enable;
wire [7:0] bank_avail_hold_l;
wire [7:0] core_avail_hold_l;
wire [7:0] core_avail_hold;
wire [7:0] bank_avail_hold;
wire ca_hold;
wire all_cores_available;
wire [7:0] spc_avail;
wire [7:0] l2bnk_avail;
wire ces_enable;
wire tcusig_coreavailclear_reg_scanin;
wire tcusig_coreavailclear_reg_scanout;
wire mcu3_clk_stop_loop;
wire coreavail_clear_dout;
wire tcusig_enstat_reg_scanin;
wire tcusig_enstat_reg_scanout;
wire enstat_en;
wire ncu_spc7_core_enable_status_io;
wire ncu_spc6_core_enable_status_io;
wire ncu_spc5_core_enable_status_io;
wire ncu_spc4_core_enable_status_io;
wire ncu_spc3_core_enable_status_io;
wire ncu_spc2_core_enable_status_io;
wire ncu_spc1_core_enable_status_io;
wire ncu_spc0_core_enable_status_io;
wire ncu_spc_pm_io;
wire ncu_spc_ba67_io;
wire ncu_spc_ba45_io;
wire ncu_spc_ba23_io;
wire ncu_spc_ba01_io;
wire ncu_ba67;
wire ncu_ba45;
wire ncu_ba23;
wire ncu_ba01;
wire [11:0] core_en_status;
wire core_enstat_qual_l;
wire core_enstat_qual;
wire tcusig_cesq_reg_scanin;
wire tcusig_cesq_reg_scanout;
wire core_enstat_qual_dly;
wire [11:0] core_en_status_pre_hold;
wire tcusig_ces_reg_scanin;
wire tcusig_ces_reg_scanout;
wire [11:0] core_en_status_hold_l;
wire [11:0] core_en_status_hold;
wire mcu3_avail_hold;
wire mcu2_avail_hold;
wire mcu1_avail_hold;
wire mcu0_avail_hold;
wire clk_stop_seq_scanin;
wire clk_stop_seq_scanout;
wire cntstop;
wire [6:0] cntstop_dout;
wire [6:0] cntdly_dout;
wire cntstart_equal_max;
wire [6:0] cntstart_dout;
wire [6:0] cntstop_din;
wire [6:0] cntstart_din;
wire tcusig_cntdly_reg_scanin;
wire tcusig_cntdly_reg_scanout;
wire [6:0] cntdly_din_l;
wire [6:0] cntdly_dout_l;
wire [6:0] cntdly_din;
wire jtag_upd_cntdly_sync;
wire tcusig_cntstop_reg_scanin;
wire tcusig_cntstop_reg_scanout;
wire stop_cnt_en;
wire tcusig_cntstart_reg_scanin;
wire tcusig_cntstart_reg_scanout;
wire strt_cnt_en;
wire tcusig_ssmode_reg_scanin;
wire tcusig_ssmode_reg_scanout;
wire ssmode_en;
wire ss_req;
wire ss_mode;
wire core_sel_reg_nonzero;
wire instr_sstop_csmode_sync;
wire tcusig_sssel_reg_scanin;
wire tcusig_sssel_reg_scanout;
wire sssel_en;
wire [7:0] spc_ss_sel_d;
wire [7:0] spc_ss_sel_qual;
wire spc0_clk_stop_cavail;
wire spc0_clk_stop_loop;
wire spc0_clk_stop_prepresync;
wire spc0_clk_stop_presync;
wire spc0_clk_stop_sync;
wire spc1_clk_stop_cavail;
wire spc1_clk_stop_loop;
wire spc1_clk_stop_prepresync;
wire spc1_clk_stop_presync;
wire spc1_clk_stop_sync;
wire spc2_clk_stop_cavail;
wire spc2_clk_stop_loop;
wire spc2_clk_stop_prepresync;
wire spc2_clk_stop_presync;
wire spc2_clk_stop_sync;
wire spc3_clk_stop_cavail;
wire spc3_clk_stop_loop;
wire spc3_clk_stop_prepresync;
wire spc3_clk_stop_presync;
wire spc3_clk_stop_sync;
wire spc4_clk_stop_cavail;
wire spc4_clk_stop_loop;
wire spc4_clk_stop_prepresync;
wire spc4_clk_stop_presync;
wire spc4_clk_stop_sync;
wire spc5_clk_stop_cavail;
wire spc5_clk_stop_loop;
wire spc5_clk_stop_prepresync;
wire spc5_clk_stop_presync;
wire spc5_clk_stop_sync;
wire spc6_clk_stop_cavail;
wire spc6_clk_stop_loop;
wire spc6_clk_stop_prepresync;
wire spc6_clk_stop_presync;
wire spc6_clk_stop_sync;
wire spc7_clk_stop_cavail;
wire spc7_clk_stop_loop;
wire spc7_clk_stop_prepresync;
wire spc7_clk_stop_presync;
wire spc7_clk_stop_sync;
wire bnk0_clk_stop_cavail;
wire bnk0_clk_stop_loop;
wire bnk0_clk_stop_prepresync;
wire bnk0_clk_stop_presync;
wire bnk0_clk_stop_sync;
wire l2t0_clk_stop_prepresync;
wire l2t0_clk_stop_presync;
wire l2t0_clk_stop_sync;
wire bnk1_clk_stop_cavail;
wire bnk1_clk_stop_loop;
wire bnk1_clk_stop_prepresync;
wire bnk1_clk_stop_presync;
wire bnk1_clk_stop_sync;
wire l2t1_clk_stop_prepresync;
wire l2t1_clk_stop_presync;
wire l2t1_clk_stop_sync;
wire bnk2_clk_stop_cavail;
wire bnk2_clk_stop_loop;
wire bnk2_clk_stop_prepresync;
wire bnk2_clk_stop_presync;
wire bnk2_clk_stop_sync;
wire l2t2_clk_stop_prepresync;
wire l2t2_clk_stop_presync;
wire l2t2_clk_stop_sync;
wire bnk3_clk_stop_cavail;
wire bnk3_clk_stop_loop;
wire bnk3_clk_stop_prepresync;
wire bnk3_clk_stop_presync;
wire bnk3_clk_stop_sync;
wire l2t3_clk_stop_prepresync;
wire l2t3_clk_stop_presync;
wire l2t3_clk_stop_sync;
wire bnk4_clk_stop_cavail;
wire bnk4_clk_stop_loop;
wire bnk4_clk_stop_prepresync;
wire bnk4_clk_stop_presync;
wire bnk4_clk_stop_sync;
wire l2t4_clk_stop_prepresync;
wire l2t4_clk_stop_presync;
wire l2t4_clk_stop_sync;
wire bnk5_clk_stop_cavail;
wire bnk5_clk_stop_loop;
wire bnk5_clk_stop_prepresync;
wire bnk5_clk_stop_presync;
wire bnk5_clk_stop_sync;
wire l2t5_clk_stop_prepresync;
wire l2t5_clk_stop_presync;
wire l2t5_clk_stop_sync;
wire bnk6_clk_stop_cavail;
wire bnk6_clk_stop_loop;
wire bnk6_clk_stop_prepresync;
wire bnk6_clk_stop_presync;
wire bnk6_clk_stop_sync;
wire l2t6_clk_stop_prepresync;
wire l2t6_clk_stop_presync;
wire l2t6_clk_stop_sync;
wire bnk7_clk_stop_cavail;
wire bnk7_clk_stop_loop;
wire bnk7_clk_stop_prepresync;
wire bnk7_clk_stop_presync;
wire bnk7_clk_stop_sync;
wire l2t7_clk_stop_prepresync;
wire l2t7_clk_stop_presync;
wire l2t7_clk_stop_sync;
wire mcu0_clk_stop_cavail;
wire mcu0_clk_stop_loop;
wire mcu0_clk_stop_prepresync;
wire mcu0_clk_stop_presync;
wire mcu0_clk_stop_sync;
wire mcu1_clk_stop_cavail;
wire mcu1_clk_stop_loop;
wire mcu1_clk_stop_prepresync;
wire mcu1_clk_stop_presync;
wire mcu1_clk_stop_sync;
wire mcu2_clk_stop_cavail;
wire mcu2_clk_stop_loop;
wire mcu2_clk_stop_prepresync;
wire mcu2_clk_stop_presync;
wire mcu2_clk_stop_sync;
wire mcu3_clk_stop_cavail;
wire mcu3_clk_stop_prepresync;
wire mcu3_clk_stop_presync;
wire mcu3_clk_stop_sync;
wire soc0_clk_stop_presync;
wire soc0_clk_stop_sync;
wire soc0_clk_stop_loop;
wire soc1_clk_stop_presync;
wire soc1_clk_stop_sync;
wire soc1_clk_stop_loop;
wire soc2_clk_stop_presync;
wire soc2_clk_stop_sync;
wire soc2_clk_stop_loop;
wire soc3_clk_stop_presync;
wire soc3_clk_stop_sync;
wire soc3_clk_stop_loop;
wire io_ac_tt_trigger;
wire tt_hold;
wire ac_tt_trigger;
wire sync_ff_ac_tt_trigger_fr_scanout_unused;
wire sync_ff_ac_tt_trigger_scanin;
wire sync_ff_ac_tt_trigger_scanout;
wire ac_tt_trigger_fr_sync_unused;
wire spc0_clk_stop;
wire spc0_clk_stop_q;
wire spc1_clk_stop;
wire spc1_clk_stop_q;
wire spc2_clk_stop;
wire spc2_clk_stop_q;
wire spc3_clk_stop;
wire spc3_clk_stop_q;
wire spc4_clk_stop;
wire spc4_clk_stop_q;
wire spc5_clk_stop;
wire spc5_clk_stop_q;
wire spc6_clk_stop;
wire spc6_clk_stop_q;
wire spc7_clk_stop;
wire spc7_clk_stop_q;
wire bnk0_clk_stop;
wire bnk0_clk_stop_q;
wire l2t0_clk_stop;
wire bnk1_clk_stop;
wire bnk1_clk_stop_q;
wire l2t1_clk_stop;
wire bnk2_clk_stop;
wire bnk2_clk_stop_q;
wire l2t2_clk_stop;
wire bnk3_clk_stop;
wire bnk3_clk_stop_q;
wire l2t3_clk_stop;
wire bnk4_clk_stop;
wire bnk4_clk_stop_q;
wire l2t4_clk_stop;
wire bnk5_clk_stop;
wire bnk5_clk_stop_q;
wire l2t5_clk_stop;
wire bnk6_clk_stop;
wire bnk6_clk_stop_q;
wire l2t6_clk_stop;
wire bnk7_clk_stop;
wire bnk7_clk_stop_q;
wire l2t7_clk_stop;
wire mcu0_clk_stop;
wire mcu0_clk_stop_q;
wire mcu1_clk_stop;
wire mcu1_clk_stop_q;
wire mcu2_clk_stop;
wire mcu2_clk_stop_q;
wire mcu3_clk_stop;
wire mcu3_clk_stop_q;
wire sync_ff_clk_stop_spc0_0_scanin;
wire sync_ff_clk_stop_spc0_0_scanout;
wire spc0_clk_stop_sync_l;
wire sync_ff_clk_stop_spc0_1_scanin;
wire sync_ff_clk_stop_spc0_1_scanout;
wire spc0_stopped_l;
wire sync_ff_clk_stop_spc1_0_scanin;
wire sync_ff_clk_stop_spc1_0_scanout;
wire spc1_clk_stop_sync_l;
wire sync_ff_clk_stop_spc1_1_scanin;
wire sync_ff_clk_stop_spc1_1_scanout;
wire spc1_stopped_l;
wire sync_ff_clk_stop_spc2_0_scanin;
wire sync_ff_clk_stop_spc2_0_scanout;
wire spc2_clk_stop_sync_l;
wire sync_ff_clk_stop_spc2_1_scanin;
wire sync_ff_clk_stop_spc2_1_scanout;
wire spc2_stopped_l;
wire sync_ff_clk_stop_spc3_0_scanin;
wire sync_ff_clk_stop_spc3_0_scanout;
wire spc3_clk_stop_sync_l;
wire sync_ff_clk_stop_spc3_1_scanin;
wire sync_ff_clk_stop_spc3_1_scanout;
wire spc3_stopped_l;
wire sync_ff_clk_stop_spc4_0_scanin;
wire sync_ff_clk_stop_spc4_0_scanout;
wire spc4_clk_stop_sync_l;
wire sync_ff_clk_stop_spc4_1_scanin;
wire sync_ff_clk_stop_spc4_1_scanout;
wire spc4_stopped_l;
wire sync_ff_clk_stop_spc5_0_scanin;
wire sync_ff_clk_stop_spc5_0_scanout;
wire spc5_clk_stop_sync_l;
wire sync_ff_clk_stop_spc5_1_scanin;
wire sync_ff_clk_stop_spc5_1_scanout;
wire spc5_stopped_l;
wire sync_ff_clk_stop_spc6_0_scanin;
wire sync_ff_clk_stop_spc6_0_scanout;
wire spc6_clk_stop_sync_l;
wire sync_ff_clk_stop_spc6_1_scanin;
wire sync_ff_clk_stop_spc6_1_scanout;
wire spc6_stopped_l;
wire sync_ff_clk_stop_spc7_0_scanin;
wire sync_ff_clk_stop_spc7_0_scanout;
wire spc7_clk_stop_sync_l;
wire sync_ff_clk_stop_spc7_1_scanin;
wire sync_ff_clk_stop_spc7_1_scanout;
wire spc7_stopped_l;
wire sync_ff_clk_stop_bnk0_0_scanin;
wire sync_ff_clk_stop_bnk0_0_scanout;
wire bnk0_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk0_1_scanin;
wire sync_ff_clk_stop_bnk0_1_scanout;
wire bnk0_stopped_l;
wire sync_ff_clk_stop_l2t0_0_scanin;
wire sync_ff_clk_stop_l2t0_0_scanout;
wire l2t0_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t0_1_scanin;
wire sync_ff_clk_stop_l2t0_1_scanout;
wire l2t0_stopped_l;
wire sync_ff_clk_stop_bnk1_0_scanin;
wire sync_ff_clk_stop_bnk1_0_scanout;
wire bnk1_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk1_1_scanin;
wire sync_ff_clk_stop_bnk1_1_scanout;
wire bnk1_stopped_l;
wire sync_ff_clk_stop_l2t1_0_scanin;
wire sync_ff_clk_stop_l2t1_0_scanout;
wire l2t1_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t1_1_scanin;
wire sync_ff_clk_stop_l2t1_1_scanout;
wire l2t1_stopped_l;
wire sync_ff_clk_stop_bnk2_0_scanin;
wire sync_ff_clk_stop_bnk2_0_scanout;
wire bnk2_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk2_1_scanin;
wire sync_ff_clk_stop_bnk2_1_scanout;
wire bnk2_stopped_l;
wire sync_ff_clk_stop_l2t2_0_scanin;
wire sync_ff_clk_stop_l2t2_0_scanout;
wire l2t2_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t2_1_scanin;
wire sync_ff_clk_stop_l2t2_1_scanout;
wire l2t2_stopped_l;
wire sync_ff_clk_stop_bnk3_0_scanin;
wire sync_ff_clk_stop_bnk3_0_scanout;
wire bnk3_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk3_1_scanin;
wire sync_ff_clk_stop_bnk3_1_scanout;
wire bnk3_stopped_l;
wire sync_ff_clk_stop_l2t3_0_scanin;
wire sync_ff_clk_stop_l2t3_0_scanout;
wire l2t3_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t3_1_scanin;
wire sync_ff_clk_stop_l2t3_1_scanout;
wire l2t3_stopped_l;
wire sync_ff_clk_stop_bnk4_0_scanin;
wire sync_ff_clk_stop_bnk4_0_scanout;
wire bnk4_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk4_1_scanin;
wire sync_ff_clk_stop_bnk4_1_scanout;
wire bnk4_stopped_l;
wire sync_ff_clk_stop_l2t4_0_scanin;
wire sync_ff_clk_stop_l2t4_0_scanout;
wire l2t4_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t4_1_scanin;
wire sync_ff_clk_stop_l2t4_1_scanout;
wire l2t4_stopped_l;
wire sync_ff_clk_stop_bnk5_0_scanin;
wire sync_ff_clk_stop_bnk5_0_scanout;
wire bnk5_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk5_1_scanin;
wire sync_ff_clk_stop_bnk5_1_scanout;
wire bnk5_stopped_l;
wire sync_ff_clk_stop_l2t5_0_scanin;
wire sync_ff_clk_stop_l2t5_0_scanout;
wire l2t5_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t5_1_scanin;
wire sync_ff_clk_stop_l2t5_1_scanout;
wire l2t5_stopped_l;
wire sync_ff_clk_stop_bnk6_0_scanin;
wire sync_ff_clk_stop_bnk6_0_scanout;
wire bnk6_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk6_1_scanin;
wire sync_ff_clk_stop_bnk6_1_scanout;
wire bnk6_stopped_l;
wire sync_ff_clk_stop_l2t6_0_scanin;
wire sync_ff_clk_stop_l2t6_0_scanout;
wire l2t6_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t6_1_scanin;
wire sync_ff_clk_stop_l2t6_1_scanout;
wire l2t6_stopped_l;
wire sync_ff_clk_stop_bnk7_0_scanin;
wire sync_ff_clk_stop_bnk7_0_scanout;
wire bnk7_clk_stop_sync_l;
wire sync_ff_clk_stop_bnk7_1_scanin;
wire sync_ff_clk_stop_bnk7_1_scanout;
wire bnk7_stopped_l;
wire sync_ff_clk_stop_l2t7_0_scanin;
wire sync_ff_clk_stop_l2t7_0_scanout;
wire l2t7_clk_stop_sync_l;
wire sync_ff_clk_stop_l2t7_1_scanin;
wire sync_ff_clk_stop_l2t7_1_scanout;
wire l2t7_stopped_l;
wire sync_ff_clk_stop_mcu0_0_scanin;
wire sync_ff_clk_stop_mcu0_0_scanout;
wire mcu0_clk_stop_sync_l;
wire sync_ff_clk_stop_mcu0_1_scanin;
wire sync_ff_clk_stop_mcu0_1_scanout;
wire mcu0_cmp_clk_stop_l;
wire mcu0_stopped_l;
wire sync_ff_ioclk_stop_mcu0_1_scanin;
wire sync_ff_ioclk_stop_mcu0_1_scanout;
wire cmp_io_sync_en_local;
wire mcu0_io_clk_stop_l;
wire mcu0_io_stopped_l;
wire sync_ff_drclk_stop_mcu0_1_scanin;
wire sync_ff_drclk_stop_mcu0_1_scanout;
wire mcu0_dr_clk_stop_l;
wire mcu0_dr_stopped_l;
wire mcu0_stopped;
wire mcu0_io_stopped;
wire mcu0_dr_stopped;
wire sync_ff_clk_stop_mcu1_0_scanin;
wire sync_ff_clk_stop_mcu1_0_scanout;
wire mcu1_clk_stop_sync_l;
wire sync_ff_clk_stop_mcu1_1_scanin;
wire sync_ff_clk_stop_mcu1_1_scanout;
wire mcu1_cmp_clk_stop_l;
wire mcu1_stopped_l;
wire sync_ff_ioclk_stop_mcu1_1_scanin;
wire sync_ff_ioclk_stop_mcu1_1_scanout;
wire mcu1_io_clk_stop_l;
wire mcu1_io_stopped_l;
wire sync_ff_drclk_stop_mcu1_1_scanin;
wire sync_ff_drclk_stop_mcu1_1_scanout;
wire mcu1_dr_clk_stop_l;
wire mcu1_dr_stopped_l;
wire mcu1_stopped;
wire mcu1_io_stopped;
wire mcu1_dr_stopped;
wire sync_ff_clk_stop_mcu2_0_scanin;
wire sync_ff_clk_stop_mcu2_0_scanout;
wire mcu2_clk_stop_sync_l;
wire sync_ff_clk_stop_mcu2_1_scanin;
wire sync_ff_clk_stop_mcu2_1_scanout;
wire mcu2_cmp_clk_stop_l;
wire mcu2_stopped_l;
wire sync_ff_ioclk_stop_mcu2_1_scanin;
wire sync_ff_ioclk_stop_mcu2_1_scanout;
wire mcu2_io_clk_stop_l;
wire mcu2_io_stopped_l;
wire sync_ff_drclk_stop_mcu2_1_scanin;
wire sync_ff_drclk_stop_mcu2_1_scanout;
wire mcu2_dr_clk_stop_l;
wire mcu2_dr_stopped_l;
wire mcu2_stopped;
wire mcu2_io_stopped;
wire mcu2_dr_stopped;
wire sync_ff_clk_stop_mcu3_0_scanin;
wire sync_ff_clk_stop_mcu3_0_scanout;
wire mcu3_clk_stop_sync_l;
wire sync_ff_clk_stop_mcu3_1_scanin;
wire sync_ff_clk_stop_mcu3_1_scanout;
wire mcu3_cmp_clk_stop_l;
wire mcu3_stopped_l;
wire sync_ff_ioclk_stop_mcu3_1_scanin;
wire sync_ff_ioclk_stop_mcu3_1_scanout;
wire mcu3_io_clk_stop_l;
wire mcu3_io_stopped_l;
wire sync_ff_drclk_stop_mcu3_1_scanin;
wire sync_ff_drclk_stop_mcu3_1_scanout;
wire mcu3_dr_clk_stop_l;
wire mcu3_dr_stopped_l;
wire mcu3_stopped;
wire mcu3_io_stopped;
wire mcu3_dr_stopped;
wire sync_ff_clk_stop_soc0_0_scanin;
wire sync_ff_clk_stop_soc0_0_scanout;
wire soc0_clk_stop_sync_l;
wire soc0_clk_stop;
wire sync_ff_clk_stop_soc0_1_scanin;
wire sync_ff_clk_stop_soc0_1_scanout;
wire soc0_cmp_clk_stop_l;
wire soc0_stopped_l;
wire sync_ff_ioclk_stop_soc0_1_scanin;
wire sync_ff_ioclk_stop_soc0_1_scanout;
wire soc0_io_clk_stop_l;
wire soc0_io_stopped_l;
wire soc0_stopped;
wire soc0_io_stopped;
wire sync_ff_clk_stop_soc1_0_scanin;
wire sync_ff_clk_stop_soc1_0_scanout;
wire soc1_clk_stop_sync_l;
wire soc1_clk_stop;
wire sync_ff_ioclk_stop_soc1_1_scanin;
wire sync_ff_ioclk_stop_soc1_1_scanout;
wire soc1_io_clk_stop_l;
wire soc1_io_stopped_l;
wire soc1_io_stopped;
wire sync_ff_clk_stop_soc2_0_scanin;
wire sync_ff_clk_stop_soc2_0_scanout;
wire soc2_clk_stop_sync_l;
wire soc2_clk_stop;
wire sync_ff_ioclk_stop_soc2_1_scanin;
wire sync_ff_ioclk_stop_soc2_1_scanout;
wire soc2_io_clk_stop_l;
wire soc2_io_stopped_l;
wire soc2_io_stopped;
wire sync_ff_clk_stop_soc3_0_scanin;
wire sync_ff_clk_stop_soc3_0_scanout;
wire soc3_clk_stop_sync_l;
wire soc3_clk_stop;
wire sync_ff_clk_stop_soc3_1_scanin;
wire sync_ff_clk_stop_soc3_1_scanout;
wire soc3_cmp_clk_stop_l;
wire soc3_stopped_l;
wire sync_ff_ioclk_stop_soc3_1_scanin;
wire sync_ff_ioclk_stop_soc3_1_scanout;
wire soc3_io_clk_stop_l;
wire soc3_io_stopped_l;
wire soc3_stopped;
wire soc3_io_stopped;
wire tcusig_ttclksel_reg_scanin;
wire tcusig_ttclksel_reg_scanout;
wire tap_spc0_mb_clk_stop_sync;
wire tap_spc1_mb_clk_stop_sync;
wire tap_spc2_mb_clk_stop_sync;
wire tap_spc3_mb_clk_stop_sync;
wire tap_spc4_mb_clk_stop_sync;
wire tap_spc5_mb_clk_stop_sync;
wire tap_spc6_mb_clk_stop_sync;
wire tap_spc7_mb_clk_stop_sync;
wire l2b0_mbist_clk_stop_sync;
wire l2t0_mbist_clk_stop_sync;
wire l2b1_mbist_clk_stop_sync;
wire l2t1_mbist_clk_stop_sync;
wire l2b2_mbist_clk_stop_sync;
wire l2t2_mbist_clk_stop_sync;
wire l2b3_mbist_clk_stop_sync;
wire l2t3_mbist_clk_stop_sync;
wire l2b4_mbist_clk_stop_sync;
wire l2t4_mbist_clk_stop_sync;
wire l2b5_mbist_clk_stop_sync;
wire l2t5_mbist_clk_stop_sync;
wire l2b6_mbist_clk_stop_sync;
wire l2t6_mbist_clk_stop_sync;
wire l2b7_mbist_clk_stop_sync;
wire l2t7_mbist_clk_stop_sync;
wire mcu0_mbist_clk_stop_sync;
wire mcu1_mbist_clk_stop_sync;
wire mcu2_mbist_clk_stop_sync;
wire mcu3_mbist_clk_stop_sync;
wire soc0_mbist_clk_stop_sync;
wire asic_stop_en;
wire asic_por_stop;
wire rdp_mbist_clk_stop_sync;
wire rtx_mbist_clk_stop_sync;
wire tds_mbist_clk_stop_sync;
wire dmu_mbist_clk_stop_sync;
wire peu_mbist_clk_stop_sync;
wire spc0_mb_scan_out;
wire flush_drive_0;
wire ser_scan_spc0_ch0;
wire spc1_mb_scan_out;
wire ser_scan_spc1_ch0;
wire byp_spc0_ch1_so;
wire spc2_mb_scan_out;
wire ser_scan_spc2_ch0;
wire byp_spc1_ch1_so;
wire spc3_mb_scan_out;
wire ser_scan_spc3_ch0;
wire byp_spc2_ch1_so;
wire spc4_mb_scan_out;
wire ser_scan_spc4_ch0;
wire byp_spc3_ch1_so;
wire spc5_mb_scan_out;
wire ser_scan_spc5_ch0;
wire byp_spc4_ch1_so;
wire spc6_mb_scan_out;
wire ser_scan_spc6_ch0;
wire byp_spc5_ch1_so;
wire spc7_mb_scan_out;
wire ser_scan_spc7_ch0;
wire byp_spc6_ch1_so;
wire not_flush_and_io_tdi;
wire spc0_shscan_scan_out;
wire ser_scan_spc0_ch1;
wire byp_spc0_tcu_shscan_scan_in;
wire byp_spc0_ch0_so;
wire spc1_shscan_scan_out;
wire ser_scan_spc1_ch1;
wire byp_spc1_tcu_shscan_scan_in;
wire byp_spc1_ch0_so;
wire spc2_shscan_scan_out;
wire ser_scan_spc2_ch1;
wire byp_spc2_tcu_shscan_scan_in;
wire byp_spc2_ch0_so;
wire spc3_shscan_scan_out;
wire ser_scan_spc3_ch1;
wire byp_spc3_tcu_shscan_scan_in;
wire byp_spc3_ch0_so;
wire spc4_shscan_scan_out;
wire ser_scan_spc4_ch1;
wire byp_spc4_tcu_shscan_scan_in;
wire byp_spc4_ch0_so;
wire spc5_shscan_scan_out;
wire ser_scan_spc5_ch1;
wire byp_spc5_tcu_shscan_scan_in;
wire byp_spc5_ch0_so;
wire spc6_shscan_scan_out;
wire ser_scan_spc6_ch1;
wire byp_spc6_tcu_shscan_scan_in;
wire byp_spc6_ch0_so;
wire spc7_shscan_scan_out;
wire ser_scan_spc7_ch1;
wire byp_spc7_tcu_shscan_scan_in;
wire byp_spc7_ch0_so;
wire byp_spc7_ch1_so;
wire byp_soca_so;
wire byp_socb_so;
wire byp_socc_so;
wire byp_socd_so;
wire byp_soce_so;
wire byp_socf_so;
wire byp_socg_so;
wire byp_soch_so;
wire byp_soc0_so;
wire byp_soc1_so;
wire byp_soc2_so;
wire byp_soc3_so;
wire byp_soc4_so;
wire byp_soc5_so;
wire sel_spc0_chains;
wire sel_spc1_chains;
wire sel_spc2_chains;
wire sel_spc3_chains;
wire sel_spc4_chains;
wire sel_spc5_chains;
wire sel_spc6_chains;
wire sel_spc7_chains;
wire byp_spc0_ch0;
wire byp_spc0_ch1;
wire byp_spc1_ch0;
wire byp_spc1_ch1;
wire byp_spc2_ch0;
wire byp_spc2_ch1;
wire byp_spc3_ch0;
wire byp_spc3_ch1;
wire byp_spc4_ch0;
wire byp_spc4_ch1;
wire byp_spc5_ch0;
wire byp_spc5_ch1;
wire byp_spc6_ch0;
wire byp_spc6_ch1;
wire byp_spc7_ch0;
wire byp_spc7_ch1;
wire byp_soca;
wire byp_socb;
wire byp_socc;
wire byp_socd;
wire byp_soce;
wire byp_socf;
wire byp_socg;
wire byp_soch;
wire byp_soc0;
wire byp_soc1;
wire byp_soc2;
wire byp_soc3;
wire byp_soc4;
wire byp_soc5;
wire byp_soc6;
wire byp_soc6_so;
wire mt_mode;
wire sel_only_spc_scan;
wire fm_scan_en;
wire flush_mode;
wire fm_aclk;
wire fm_bclk;
wire atpg_dectest;
wire atpg_muxtest;
wire sel_spc0;
wire sel_spc1;
wire sel_spc2;
wire sel_spc3;
wire sel_spc4;
wire sel_spc5;
wire sel_spc6;
wire sel_spc7;
wire jt_spc0_scan_en;
wire jt_spc1_scan_en;
wire jt_spc2_scan_en;
wire jt_spc3_scan_en;
wire jt_spc4_scan_en;
wire jt_spc5_scan_en;
wire jt_spc6_scan_en;
wire jt_spc7_scan_en;
wire fm_asic_scan_en;
wire jt_spc0_aclk;
wire jt_spc1_aclk;
wire jt_spc2_aclk;
wire jt_spc3_aclk;
wire jt_spc4_aclk;
wire jt_spc5_aclk;
wire jt_spc6_aclk;
wire jt_spc7_aclk;
wire jt_spc0_bclk;
wire jt_spc1_bclk;
wire jt_spc2_bclk;
wire jt_spc3_bclk;
wire jt_spc4_bclk;
wire jt_spc5_bclk;
wire jt_spc6_bclk;
wire jt_spc7_bclk;
wire atpg_pce_ov;
wire int_scan_in;
wire jtag_clk_stop_req_sync;
wire serdes_ac_mode_1;
wire serdes_ac_mode_0;
wire tcusig_srdacmode_reg_scanin;
wire tcusig_srdacmode_reg_scanout;
wire tcusig_cmpdrsync_reg_scanin;
wire tcusig_cmpdrsync_reg_scanout;
wire cmp_dr_sync_en_local_unused;
wire tcusig_pceov_reg_scanin;
wire tcusig_pceov_reg_scanout;
wire tcusig_ccu_clk_stop_reg_scanin;
wire tcusig_ccu_clk_stop_reg_scanout;
wire tcu_ccu_clk_stop_din;
wire tcu_ccu_clk_stop_dout;
wire tcusig_ccu_io_clk_stop_reg_scanin;
wire tcusig_ccu_io_clk_stop_reg_scanout;
wire tcu_ccu_io_clk_stop_din;
wire tcu_ccu_io_clk_stop_dout;
wire tcusig_rst_clk_stop_reg_scanin;
wire tcusig_rst_clk_stop_reg_scanout;
wire tcu_rst_clk_stop_din;
wire tcu_rst_clk_stop_dout;
wire tcusig_rst_io_clk_stop_reg_scanin;
wire tcusig_rst_io_clk_stop_reg_scanout;
wire tcu_rst_io_clk_stop_din;
wire tcu_rst_io_clk_stop_dout;
wire sync_ff_jtagporacc_scanin;
wire sync_ff_jtagporacc_scanout;
wire jtag_por_enable_sync;
wire sync_ff_sckbyp_scanin;
wire sync_ff_sckbyp_scanout;
wire jtag_sck_byp_sync;
wire pre_sck_bypass;
wire tcusig_sck_reg_scanin;
wire tcusig_sck_reg_scanout;
wire tap_spc7_mb_cs_sync_reg_scanin;
wire tap_spc7_mb_cs_sync_reg_scanout;
wire tap_spc6_mb_cs_sync_reg_scanin;
wire tap_spc6_mb_cs_sync_reg_scanout;
wire tap_spc5_mb_cs_sync_reg_scanin;
wire tap_spc5_mb_cs_sync_reg_scanout;
wire tap_spc4_mb_cs_sync_reg_scanin;
wire tap_spc4_mb_cs_sync_reg_scanout;
wire tap_spc3_mb_cs_sync_reg_scanin;
wire tap_spc3_mb_cs_sync_reg_scanout;
wire tap_spc2_mb_cs_sync_reg_scanin;
wire tap_spc2_mb_cs_sync_reg_scanout;
wire tap_spc1_mb_cs_sync_reg_scanin;
wire tap_spc1_mb_cs_sync_reg_scanout;
wire tap_spc0_mb_cs_sync_reg_scanin;
wire tap_spc0_mb_cs_sync_reg_scanout;
wire l2t7_mbist_cs_sync_reg_scanin;
wire l2t7_mbist_cs_sync_reg_scanout;
wire l2t6_mbist_cs_sync_reg_scanin;
wire l2t6_mbist_cs_sync_reg_scanout;
wire l2t5_mbist_cs_sync_reg_scanin;
wire l2t5_mbist_cs_sync_reg_scanout;
wire l2t4_mbist_cs_sync_reg_scanin;
wire l2t4_mbist_cs_sync_reg_scanout;
wire l2t3_mbist_cs_sync_reg_scanin;
wire l2t3_mbist_cs_sync_reg_scanout;
wire l2t2_mbist_cs_sync_reg_scanin;
wire l2t2_mbist_cs_sync_reg_scanout;
wire l2t1_mbist_cs_sync_reg_scanin;
wire l2t1_mbist_cs_sync_reg_scanout;
wire l2t0_mbist_cs_sync_reg_scanin;
wire l2t0_mbist_cs_sync_reg_scanout;
wire l2b7_mbist_cs_sync_reg_scanin;
wire l2b7_mbist_cs_sync_reg_scanout;
wire l2b6_mbist_cs_sync_reg_scanin;
wire l2b6_mbist_cs_sync_reg_scanout;
wire l2b5_mbist_cs_sync_reg_scanin;
wire l2b5_mbist_cs_sync_reg_scanout;
wire l2b4_mbist_cs_sync_reg_scanin;
wire l2b4_mbist_cs_sync_reg_scanout;
wire l2b3_mbist_cs_sync_reg_scanin;
wire l2b3_mbist_cs_sync_reg_scanout;
wire l2b2_mbist_cs_sync_reg_scanin;
wire l2b2_mbist_cs_sync_reg_scanout;
wire l2b1_mbist_cs_sync_reg_scanin;
wire l2b1_mbist_cs_sync_reg_scanout;
wire l2b0_mbist_cs_sync_reg_scanin;
wire l2b0_mbist_cs_sync_reg_scanout;
wire soc0_mbist_cs_sync_reg_scanin;
wire soc0_mbist_cs_sync_reg_scanout;
wire mcu3_mbist_cs_sync_reg_scanin;
wire mcu3_mbist_cs_sync_reg_scanout;
wire mcu2_mbist_cs_sync_reg_scanin;
wire mcu2_mbist_cs_sync_reg_scanout;
wire mcu1_mbist_cs_sync_reg_scanin;
wire mcu1_mbist_cs_sync_reg_scanout;
wire mcu0_mbist_cs_sync_reg_scanin;
wire mcu0_mbist_cs_sync_reg_scanout;
wire dmu_mbist_cs_sync_reg_scanin;
wire dmu_mbist_cs_sync_reg_scanout;
wire peu_mbist_cs_sync_reg_scanin;
wire peu_mbist_cs_sync_reg_scanout;
wire rdp_mbist_cs_sync_reg_scanin;
wire rdp_mbist_cs_sync_reg_scanout;
wire rtx_mbist_cs_sync_reg_scanin;
wire rtx_mbist_cs_sync_reg_scanout;
wire tds_mbist_cs_sync_reg_scanin;
wire tds_mbist_cs_sync_reg_scanout;
wire jtag_spc7_ss_cs_sync_reg_scanin;
wire jtag_spc7_ss_cs_sync_reg_scanout;
wire jtag_spc7_shscan_clk_stop_sync;
wire jtag_spc6_ss_cs_sync_reg_scanin;
wire jtag_spc6_ss_cs_sync_reg_scanout;
wire jtag_spc6_shscan_clk_stop_sync;
wire jtag_spc5_ss_cs_sync_reg_scanin;
wire jtag_spc5_ss_cs_sync_reg_scanout;
wire jtag_spc5_shscan_clk_stop_sync;
wire jtag_spc4_ss_cs_sync_reg_scanin;
wire jtag_spc4_ss_cs_sync_reg_scanout;
wire jtag_spc4_shscan_clk_stop_sync;
wire jtag_spc3_ss_cs_sync_reg_scanin;
wire jtag_spc3_ss_cs_sync_reg_scanout;
wire jtag_spc3_shscan_clk_stop_sync;
wire jtag_spc2_ss_cs_sync_reg_scanin;
wire jtag_spc2_ss_cs_sync_reg_scanout;
wire jtag_spc2_shscan_clk_stop_sync;
wire jtag_spc1_ss_cs_sync_reg_scanin;
wire jtag_spc1_ss_cs_sync_reg_scanout;
wire jtag_spc1_shscan_clk_stop_sync;
wire jtag_spc0_ss_cs_sync_reg_scanin;
wire jtag_spc0_ss_cs_sync_reg_scanout;
wire jtag_spc0_shscan_clk_stop_sync;
wire jtag_l2t7_ss_cs_sync_reg_scanin;
wire jtag_l2t7_ss_cs_sync_reg_scanout;
wire jtag_l2t7_shscan_clk_stop_sync;
wire jtag_l2t6_ss_cs_sync_reg_scanin;
wire jtag_l2t6_ss_cs_sync_reg_scanout;
wire jtag_l2t6_shscan_clk_stop_sync;
wire jtag_l2t5_ss_cs_sync_reg_scanin;
wire jtag_l2t5_ss_cs_sync_reg_scanout;
wire jtag_l2t5_shscan_clk_stop_sync;
wire jtag_l2t4_ss_cs_sync_reg_scanin;
wire jtag_l2t4_ss_cs_sync_reg_scanout;
wire jtag_l2t4_shscan_clk_stop_sync;
wire jtag_l2t3_ss_cs_sync_reg_scanin;
wire jtag_l2t3_ss_cs_sync_reg_scanout;
wire jtag_l2t3_shscan_clk_stop_sync;
wire jtag_l2t2_ss_cs_sync_reg_scanin;
wire jtag_l2t2_ss_cs_sync_reg_scanout;
wire jtag_l2t2_shscan_clk_stop_sync;
wire jtag_l2t1_ss_cs_sync_reg_scanin;
wire jtag_l2t1_ss_cs_sync_reg_scanout;
wire jtag_l2t1_shscan_clk_stop_sync;
wire jtag_l2t0_ss_cs_sync_reg_scanin;
wire jtag_l2t0_ss_cs_sync_reg_scanout;
wire jtag_l2t0_shscan_clk_stop_sync;
wire jtag_spc_ss_pce_ov_sync_reg_scanin;
wire jtag_spc_ss_pce_ov_sync_reg_scanout;
wire jtag_spc_shscan_pce_ov_sync;
wire jtag_l2t_ss_pce_ov_sync_reg_scanin;
wire jtag_l2t_ss_pce_ov_sync_reg_scanout;
wire jtag_l2t_shscan_pce_ov_sync;
wire jtag_clk_stop_req_sync_reg_scanin;
wire jtag_clk_stop_req_sync_reg_scanout;
wire jtag_efu_clear_instr_sync_reg_scanin;
wire jtag_efu_clear_instr_sync_reg_scanout;
wire instr_sstop_csmode_sync_reg_scanin;
wire instr_sstop_csmode_sync_reg_scanout;
wire sync_ff_jtagclkdlyupd_scanin;
wire sync_ff_jtagclkdlyupd_scanout;
wire jtag_serscan_sync_reg_scanin;
wire jtag_serscan_sync_reg_scanout;
wire jt_scan_mtmode_sync;
wire [20:0] shscan_clk_stop_sync;
wire shscan_clk_stop_io_sync_reg_scanin;
wire shscan_clk_stop_io_sync_reg_scanout;
wire [20:0] shscan_clk_stop_io;
wire spare_scanin;
wire spare_scanout;
wire [8:0] spare_flops_d;
wire [8:0] spare_flops_q;
wire [8:1] spare_flops_unused;
wire [0:0] spare0_flop_unused;
wire tcusig_noflush_scanout;

    
`define CSDEL 7
`define CSDEL_MSB 6
`define CSDEL_MAX 7'b1111111

   // External Clocks - to CCU
   input         mio_ext_cmp_clk;
   input 	 mio_ext_dr_clk;
   output        tcu_ccu_ext_dr_clk;
   output        tcu_ccu_ext_cmp_clk;
   output        tcu_ccu_clk_stop;
   output        tcu_ccu_io_clk_stop;
   output        tcu_rst_clk_stop;
   output        tcu_rst_io_clk_stop;

   input         mbist_clk_stop;

   // External Clock for JTAG Macrotest
   input         tck_clk_tree;
   // External Clocks - for PEU
   input         mio_tcu_peu_clk_ext;
   output        tcu_peu_clk_ext;  
   // External Clocks - for NIU
   input [5:0]   mio_tcu_niu_clk_ext;
   output        mac_125rx_test_clk; 
   output        mac_125tx_test_clk; 
   output        mac_156rx_test_clk; 
   output        mac_156tx_test_clk; 
   output        mac_312rx_test_clk; 
   output        mac_312tx_test_clk; 
   // PLL Bypass from Pins
   input         mio_tcu_pll_cmp_bypass;
   // Divider Bypass to cluster headers
   input         mio_tcu_divider_bypass;
   output        tcu_div_bypass;

   // Synchronization enable
   input 	 cmp_io_sync_en; // enable io_clk_stops with this
   input 	 io_cmp_sync_en; // enable bank_enable (_baxx)
   input 	 cmp_dr_sync_en; // enable dr_clk_stops with this

   // Enable for PEU Test Congif Port
   output 	 tcu_peu_testmode;
   // Testmode for NIU
   output 	 tcu_mac_testmode;
   // Testmode for SPC Cores
   output        tcu_spc0_test_mode;
   output        tcu_spc1_test_mode;
   output        tcu_spc2_test_mode;
   output        tcu_spc3_test_mode;
   output        tcu_spc4_test_mode;
   output        tcu_spc5_test_mode;
   output        tcu_spc6_test_mode;
   output        tcu_spc7_test_mode;
   // Testmode for RST
   output        tcu_rst_scan_mode;
   // ATPG Test mode excluding Trans. Test
   output        tcu_atpg_mode;

   // To control fbd logic in MCU
   output        tcu_mcu_testmode;

   
   //inputs
   input         io_aclk;
   input 	 io_bclk;
   input 	 l2clk;
   input 	 io_tdi;
   input [30:0]  io_scan_in;

   input [1:0] 	 spc0_tcu_scan_in;
   input [1:0] 	 spc1_tcu_scan_in;
   input [1:0] 	 spc2_tcu_scan_in;
   input [1:0] 	 spc3_tcu_scan_in;
   input [1:0] 	 spc4_tcu_scan_in;
   input [1:0] 	 spc5_tcu_scan_in;
   input [1:0] 	 spc6_tcu_scan_in;
   input [1:0] 	 spc7_tcu_scan_in;
   input 	 soca_tcu_scan_in;
   input 	 socb_tcu_scan_in;
   input 	 socc_tcu_scan_in;
   input 	 socd_tcu_scan_in;
   input 	 soce_tcu_scan_in;
   input 	 socf_tcu_scan_in;
   input 	 socg_tcu_scan_in;
   input 	 soch_tcu_scan_in;   
   input 	 soc0_tcu_scan_in;
   input 	 soc1_tcu_scan_in;
   input 	 soc2_tcu_scan_in;
   input 	 soc3_tcu_scan_in;
   input 	 soc4_tcu_scan_in;
   input 	 soc5_tcu_scan_in;
   input 	 soc6_tcu_scan_in;
   input         peu_tcu_scan_in;
   input         ccu_tcu_scan_in;
   input         jtag_sbs_scan_in;
   input         mio_tcu_bs_scan_out;
   //input 	 srdes_tcu_scan_in;
   input 	 io_test_mode;
   input 	 jtag_ser_scan_q; // decoded signal from jtag ECO yyyyyy
   input 	 io_scan_en;
   input 	 clk_stop_ac_trans_counter_initiated;
   input 	 io_ac_test_mode;
   input         io_ac_testtrig;
   output 	 ac_test_mode; 	 
   input [23:0]  debug_reg_hard_stop_domain_1st;
   input 	 debug_cycle_counter_stop;
   input 	 debug_event_stop;
   input         spc_ss_mode;
   input [7:0] 	 spc_ss_sel;
   //input         instr_clock_sstop;
   input         instr_sstop_csmode;
   input 	 tcu_scan_chain;
   // Reset Support
   input         POR_;
   input         jtag_clk_stop_req;
   input         jtagclkstop_ov;
   input         rst_tcu_flush_init_req;
   input         rst_tcu_flush_stop_req;
   input         rst_tcu_asicflush_stop_req;
   input         rst_wmr_protect; 
   input         rst_tcu_dbr_gen;
   output        tcu_rst_flush_init_ack;
   output        tcu_rst_flush_stop_ack;
   output        tcu_rst_asicflush_stop_ack; 
   output        tcu_rst_efu_done;
   // Send signal to protect live blocks during scan flush
   output        flush_test_protect;
   // To block inputs when in test protect mode
   input         tcu_test_protect_cmp;
   // JTAG SCK Counter Bypass Signal
   input         jtag_sck_byp;
   output        tcu_sck_bypass;
   // JTAG Access during POR
   input         jtag_por_enable;
   output        jtag_por_status;
   // Clear and Start EFU during POR
   input         jtag_efu_clear_instr; // From JTAG
   input  [6:0]  jtag_efu_rvclr;       // From JTAG
   output        tcu_efu_read_start;   // Start EFuse shifting rows 
   output [6:0]  tcu_efu_rvclr;        // Tell EFuse to clear destinations
   // Serial Scan via JTAG (for scandump)
   input 	 jt_scan_in;   // from TDI, via jtag ser_scan instruction
   input 	 jt_scan_en;   // from jtag ser_scan instruction
   input 	 jt_scan_aclk; // from jtag ser_scan instruction
   input 	 jt_scan_bclk; // from jtag ser_scan instruction
   output 	 ser_scan_out; // to jtag, then to TDO
   input 	 chain_select; // enables sel_chain register for scandump
   input [4:0] 	 sel_chain;    // selects one of 32 chains, others bypassed
   // LBIST start signals, so array write inhibit can be generated from them
   input [7:0]   tcu_spc_lbist_start;
   // Control of MBIST scan chains for SPC cores 
   input         tap_spc0_mb_aclk;
   input         tap_spc0_mb_bclk;
   input         tap_spc0_mb_scan_en;
   input         tap_spc0_mb_clk_stop;
   input         tap_spc1_mb_aclk;
   input         tap_spc1_mb_bclk;
   input         tap_spc1_mb_scan_en;
   input         tap_spc1_mb_clk_stop;
   input         tap_spc2_mb_aclk;
   input         tap_spc2_mb_bclk;
   input         tap_spc2_mb_scan_en;
   input         tap_spc2_mb_clk_stop;
   input         tap_spc3_mb_aclk;
   input         tap_spc3_mb_bclk;
   input         tap_spc3_mb_scan_en;
   input         tap_spc3_mb_clk_stop;
   input         tap_spc4_mb_aclk;
   input         tap_spc4_mb_bclk;
   input         tap_spc4_mb_scan_en;
   input         tap_spc4_mb_clk_stop;
   input         tap_spc5_mb_aclk;
   input         tap_spc5_mb_bclk;
   input         tap_spc5_mb_scan_en;
   input         tap_spc5_mb_clk_stop;
   input         tap_spc6_mb_aclk;
   input         tap_spc6_mb_bclk;
   input         tap_spc6_mb_scan_en;
   input         tap_spc6_mb_clk_stop;
   input         tap_spc7_mb_aclk;
   input         tap_spc7_mb_bclk;
   input         tap_spc7_mb_scan_en;
   input         tap_spc7_mb_clk_stop;
   
   //scan
   input 	 scan_in;
   output 	 scan_out;
   // Test Signals for MFG ATPG Scan
   output        tcu_dectest;
   output        tcu_muxtest;
  
   //outputs
   output        tcu_jtag_flush_req;
   output        tcu_jtag_flush_dly_req;
   output 	 tcu_aclk;  
   output 	 tcu_bclk;  
   output 	 tcu_scan_en;
   input         jtag_mt_enable; // enable for macrotest
   // Scan controls to SPC0
   output        tcu_spc0_aclk;
   output        tcu_spc0_bclk;
   output        tcu_spc0_scan_en;
   output        tcu_spc0_se_scancollar_in;
   output        tcu_spc0_se_scancollar_out;
   output        tcu_spc0_array_wr_inhibit;
   // Scan controls to SPC1
   output        tcu_spc1_aclk;
   output        tcu_spc1_bclk;
   output        tcu_spc1_scan_en;
   output        tcu_spc1_se_scancollar_in;
   output        tcu_spc1_se_scancollar_out;
   output        tcu_spc1_array_wr_inhibit;
   // Scan controls to SPC2
   output        tcu_spc2_aclk;
   output        tcu_spc2_bclk;
   output        tcu_spc2_scan_en;
   output        tcu_spc2_se_scancollar_in;
   output        tcu_spc2_se_scancollar_out;
   output        tcu_spc2_array_wr_inhibit;
   // Scan controls to SPC3
   output        tcu_spc3_aclk;
   output        tcu_spc3_bclk;
   output        tcu_spc3_scan_en;
   output        tcu_spc3_se_scancollar_in;
   output        tcu_spc3_se_scancollar_out;
   output        tcu_spc3_array_wr_inhibit;
   // Scan controls to SPC4
   output        tcu_spc4_aclk;
   output        tcu_spc4_bclk;
   output        tcu_spc4_scan_en;
   output        tcu_spc4_se_scancollar_in;
   output        tcu_spc4_se_scancollar_out;
   output        tcu_spc4_array_wr_inhibit;
   // Scan controls to SPC5
   output        tcu_spc5_aclk;
   output        tcu_spc5_bclk;
   output        tcu_spc5_scan_en;
   output        tcu_spc5_se_scancollar_in;
   output        tcu_spc5_se_scancollar_out;
   output        tcu_spc5_array_wr_inhibit;
   // Scan controls to SPC6
   output        tcu_spc6_aclk;
   output        tcu_spc6_bclk;
   output        tcu_spc6_scan_en;
   output        tcu_spc6_se_scancollar_in;
   output        tcu_spc6_se_scancollar_out;
   output        tcu_spc6_array_wr_inhibit;
   // Scan controls to SPC7
   output        tcu_spc7_aclk;
   output        tcu_spc7_bclk;
   output        tcu_spc7_scan_en;
   output        tcu_spc7_se_scancollar_in;
   output        tcu_spc7_se_scancollar_out;
   output        tcu_spc7_array_wr_inhibit;

   // Scan Controls to ASICs (NIU, DMU, PEU)
   // NIU is RDP, MAC, RTX, and TDS
   output        tcu_asic_aclk;			 
   output	 tcu_asic_bclk;			 
   output	 tcu_asic_scan_en;		 
   output	 tcu_asic_se_scancollar_in;  
   output	 tcu_asic_se_scancollar_out; 
   output	 tcu_asic_array_wr_inhibit;  

   output 	 tcu_int_se;   // scan enable for TCU only
   output 	 tcu_jtag_se;  // scan enable for jtag only
   output 	 tcu_int_aclk; // aclk for TCU only
   output 	 tcu_int_bclk; // bclk for TCU only 
   output        tcu_int_ce;   // pce for TCU only
   output        tcu_int_ce_to_ucb;// pce for TCU UCB only  ECO A
   output        tcu_int_pce_ov;// pce override for TCU only
   output 	 tcu_jtag_aclk; // aclk for jtag only
   output [1:0]  tcu_spc0_scan_out;
   output [1:0]  tcu_spc1_scan_out;
   output [1:0]  tcu_spc2_scan_out;
   output [1:0]  tcu_spc3_scan_out;
   output [1:0]  tcu_spc4_scan_out;
   output [1:0]  tcu_spc5_scan_out;
   output [1:0]  tcu_spc6_scan_out;
   output [1:0]  tcu_spc7_scan_out;
   output 	 tcu_soca_scan_out;
   output 	 tcu_socb_scan_out;
   output 	 tcu_socc_scan_out;
   output 	 tcu_socd_scan_out;
   output 	 tcu_soce_scan_out;
   output 	 tcu_socf_scan_out;
   output 	 tcu_socg_scan_out;
   output 	 tcu_soch_scan_out;
   output 	 tcu_soc0_scan_out;
   output 	 tcu_soc1_scan_out;
   output 	 tcu_soc2_scan_out;
   output 	 tcu_soc3_scan_out;
   output 	 tcu_soc4_scan_out;
   output 	 tcu_soc5_scan_out;
   output 	 tcu_soc6_scan_out;
   output        tcu_peu_scan_out;
   output        tcu_rst_scan_out;
   output        tcu_sbs_scan_in;
   output [30:0] tcu_pins_scan_out;

   output        pre_spc0_clk_stop;
   output        pre_spc1_clk_stop;
   output        pre_spc2_clk_stop;
   output        pre_spc3_clk_stop;
   output        pre_spc4_clk_stop;
   output        pre_spc5_clk_stop;
   output        pre_spc6_clk_stop;
   output        pre_spc7_clk_stop;
   
   output        pre_bnk0_clk_stop; 
   output        pre_l2t0_clk_stop;
   output        pre_bnk1_clk_stop; 
   output        pre_l2t1_clk_stop; 
   output        pre_bnk2_clk_stop; 
   output        pre_l2t2_clk_stop; 
   output        pre_bnk3_clk_stop; 
   output        pre_l2t3_clk_stop; 
   output        pre_bnk4_clk_stop; 
   output        pre_l2t4_clk_stop; 
   output        pre_bnk5_clk_stop; 
   output        pre_l2t5_clk_stop; 
   output        pre_bnk6_clk_stop; 
   output        pre_l2t6_clk_stop; 
   output        pre_bnk7_clk_stop; 
   output        pre_l2t7_clk_stop;


   output 	 pre_mcu0_clk_stop;
   output 	 pre_mcu0_io_clk_stop;
   output 	 pre_mcu0_dr_clk_stop;
   output 	 pre_mcu0_fbd_clk_stop;
   
   output 	 pre_mcu1_clk_stop;
   output 	 pre_mcu1_io_clk_stop;
   output 	 pre_mcu1_dr_clk_stop;
   output 	 pre_mcu1_fbd_clk_stop;
   
   output 	 pre_mcu2_clk_stop;
   output 	 pre_mcu2_io_clk_stop;
   output 	 pre_mcu2_dr_clk_stop;
   output 	 pre_mcu2_fbd_clk_stop;
 
   output 	 pre_mcu3_clk_stop;
   output 	 pre_mcu3_io_clk_stop;
   output 	 pre_mcu3_dr_clk_stop;
   output 	 pre_mcu3_fbd_clk_stop;
   
   output 	 pre_soc0_clk_stop;
   output 	 pre_soc0_io_clk_stop;
   
   output 	 pre_soc1_io_clk_stop;
   output 	 pre_soc2_io_clk_stop;
   output 	 pre_soc3_clk_stop;
   output 	 pre_soc3_io_clk_stop;
   
   output 	 tcu_pce_ov;
   output 	 ac_trans_test_counter_start;
   
   //These are for mbist to allow JTAG to control
   // a portion of the scan chain when not in test mode
   input 	 spc0_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc0_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc0_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc0_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc1_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc1_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc1_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc1_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc2_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc2_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc2_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc2_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc3_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc3_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc3_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc3_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc4_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc4_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc4_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc4_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc5_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc5_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc5_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc5_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc6_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc6_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc6_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc6_tap_mb_scan_in;  // goes to JTAG tdo 
   input 	 spc7_tcu_mbist_scan_in;  // from core mbist, goes to tdo or back to core 
   input 	 tap_spc7_mb_scan_out; // from JTAG, muxed to core mbist 
   output 	 tcu_spc7_mb_scan_out; // mux either JTAG or pad si; goes to core mbist
   output 	 spc7_tap_mb_scan_in;  // goes to JTAG tdo

   // SOC MBIST Scan Outputs From TCU
   output   tcu_sii_mbist_scan_in;
   output   tcu_sio_mbist_scan_in;
   output   tcu_ncu_mbist_scan_in;
   output   tcu_mcu0_mbist_scan_in;
   output   tcu_mcu1_mbist_scan_in;
   output   tcu_mcu2_mbist_scan_in;
   output   tcu_mcu3_mbist_scan_in;
   output   tcu_l2b0_mbist_scan_in;
   output   tcu_l2b1_mbist_scan_in;
   output   tcu_l2b2_mbist_scan_in;
   output   tcu_l2b3_mbist_scan_in;
   output   tcu_l2b4_mbist_scan_in;
   output   tcu_l2b5_mbist_scan_in;
   output   tcu_l2b6_mbist_scan_in;
   output   tcu_l2b7_mbist_scan_in;
   output   tcu_l2t0_mbist_scan_in;
   output   tcu_l2t1_mbist_scan_in;
   output   tcu_l2t2_mbist_scan_in;
   output   tcu_l2t3_mbist_scan_in;
   output   tcu_l2t4_mbist_scan_in;
   output   tcu_l2t5_mbist_scan_in;
   output   tcu_l2t6_mbist_scan_in;
   output   tcu_l2t7_mbist_scan_in;
   output   tcu_dmu_mbist_scan_in;
   output   tcu_peu_mbist_scan_in;
   output   rdp_rdmc_mbist_scan_in;
   output   rtx_mbist_scan_in;
   output   tds_mbist_scan_in;

   // SOC MBIST Scan Input To TCU
   input sii_tcu_mbist_scan_out;
   input sio_tcu_mbist_scan_out;
   input ncu_tcu_mbist_scan_out;
   input mcu0_tcu_mbist_scan_out;
   input mcu1_tcu_mbist_scan_out;
   input mcu2_tcu_mbist_scan_out;
   input mcu3_tcu_mbist_scan_out;
   input l2b0_tcu_mbist_scan_out;
   input l2b1_tcu_mbist_scan_out;
   input l2b2_tcu_mbist_scan_out;
   input l2b3_tcu_mbist_scan_out;
   input l2b4_tcu_mbist_scan_out;
   input l2b5_tcu_mbist_scan_out;
   input l2b6_tcu_mbist_scan_out;
   input l2b7_tcu_mbist_scan_out;
   input l2t0_tcu_mbist_scan_out;
   input l2t1_tcu_mbist_scan_out;
   input l2t2_tcu_mbist_scan_out;
   input l2t3_tcu_mbist_scan_out;
   input l2t4_tcu_mbist_scan_out;
   input l2t5_tcu_mbist_scan_out;
   input l2t6_tcu_mbist_scan_out;
   input l2t7_tcu_mbist_scan_out;
   input dmu_tcu_mbist_scan_out;
   input peu_tcu_mbist_scan_out;
   input rdp_rdmc_mbist_scan_out;
   input rtx_mbist_scan_out;
   input tds_mbist_scan_out;

	input        spc0_tcu_lbist_scan_out;
	input        spc1_tcu_lbist_scan_out;
	input        spc2_tcu_lbist_scan_out;
	input        spc3_tcu_lbist_scan_out;
	input        spc4_tcu_lbist_scan_out;
	input        spc5_tcu_lbist_scan_out;
	input        spc6_tcu_lbist_scan_out;
	input        spc7_tcu_lbist_scan_out;
   output [7:0] tcu_spc_lbist_scan_in;

   //These are for Shadow scan (SHSCAN) to allow JTAG to control
   // a portion of the scan chain when not in test mode
   input 	 spc0_tcu_shscan_scan_in; // from core 0
   input 	 spc1_tcu_shscan_scan_in;
   input 	 spc2_tcu_shscan_scan_in;
   input 	 spc3_tcu_shscan_scan_in;
   input 	 spc4_tcu_shscan_scan_in;
   input 	 spc5_tcu_shscan_scan_in;
   input 	 spc6_tcu_shscan_scan_in;
   input 	 spc7_tcu_shscan_scan_in;  // from core 7, also to jtag
   output 	 tcu_spc0_shscan_scan_out; // to core 0
   output 	 tcu_spc1_shscan_scan_out;
   output 	 tcu_spc2_shscan_scan_out;
   output 	 tcu_spc3_shscan_scan_out;
   output 	 tcu_spc4_shscan_scan_out;
   output 	 tcu_spc5_shscan_scan_out;
   output 	 tcu_spc6_shscan_scan_out;
   output 	 tcu_spc7_shscan_scan_out;
   input 	 tap_spc0_shscan_scan_out; // from jtag TDI
   output 	 spc7_tap_shscan_scan_in;  // to jtag TDO
   // Shadow Scan ID and Clock-Stop Transferred to IO CLK Domain
   input [2:0]   jtag_spc_shscanid;         // from jtag
   output [2:0]  tcu_spc_shscanid;          // to SPC's in IO CLK Domain
   input         jtag_spc0_shscan_clk_stop; // from jtag
   input         jtag_spc1_shscan_clk_stop; // from jtag
   input         jtag_spc2_shscan_clk_stop; // from jtag
   input         jtag_spc3_shscan_clk_stop; // from jtag
   input         jtag_spc4_shscan_clk_stop; // from jtag
   input         jtag_spc5_shscan_clk_stop; // from jtag
   input         jtag_spc6_shscan_clk_stop; // from jtag
   input         jtag_spc7_shscan_clk_stop; // from jtag
   output        tcu_spc0_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc1_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc2_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc3_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc4_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc5_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc6_shscan_clk_stop;  // to SPC in IO CLK Domain
   output        tcu_spc7_shscan_clk_stop;  // to SPC in IO CLK Domain
   input         jtag_spc_shscan_pce_ov;   // from jtag
   output        tcu_spc_shscan_pce_ov;    // to SPC in IO CLK Domain

   input         jtag_l2t0_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t1_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t2_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t3_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t4_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t5_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t6_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t7_shscan_clk_stop; // From tcu_jtag_ctl
   input         jtag_l2t_shscan_pce_ov;    // From tcu_jtag_ctl
   output        tcu_l2t0_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t1_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t2_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t3_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t4_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t5_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t6_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t7_shscan_clk_stop;  // To L2T in IO CLK Domain
   output        tcu_l2t_shscan_pce_ov;     // To L2T in IO CLK Domain

   // Core and L2 Bank Available and Enable Status
   input [7:0] 	 core_avail; // CMP Core Available, from EFuse
   input         ncu_spc0_core_enable_status; // core_en updated
   input         ncu_spc1_core_enable_status; // via SW and 
   input         ncu_spc2_core_enable_status; // recognized after
   input         ncu_spc3_core_enable_status; // WMR2
   input         ncu_spc4_core_enable_status;
   input         ncu_spc5_core_enable_status;
   input         ncu_spc6_core_enable_status;
   input         ncu_spc7_core_enable_status;
   input [7:0]   bank_avail;   // L2 Bank Available, from EFuse
   input         ncu_spc_pm;
   input         ncu_spc_ba01; // Bank_enables; 01 affects
   input         ncu_spc_ba23; // L2 banks 0, 1 and mcu0
   input         ncu_spc_ba45;
   input         ncu_spc_ba67;
   
   // Control of arrays during scan
   output 	 tcu_se_scancollar_in;
   output 	 tcu_se_scancollar_out;
   output 	 tcu_array_bypass;
   output 	 tcu_array_wr_inhibit;

   // JTAG interface for clock stop & debug support
   input 	 jtag_upd_cntdly;
   input [`CSDEL_MSB:0] jtag_cntdly_data;
   output [`CSDEL_MSB:0] csdel_data;
   output 	 clkseq_stop;
   output 	 clkseq_strt;

   // Cycle (Clock) Stretch
   input         cycle_stretch; // from dbg_ctl
   output        tcu_ccu_clk_stretch;
   // Select signal to Mux in CCU
   output [1:0]  tcu_ccu_mux_sel;

   // To regs_ctl for debug support
   output        wmr_two;

   output        start_bisx_por;
   output        start_bisx_wmr;
   output        stop_bisx_wmr;

   input    instr_mbist_diag;
   input    soc_mbist_aclk;
   input    soc_mbist_bclk;
   input    soc_mbist_scan_en;

   input    soc0_mbist_clk_stop;
   input    mcu0_mbist_clk_stop;
   input    mcu1_mbist_clk_stop;
   input    mcu2_mbist_clk_stop;
   input    mcu3_mbist_clk_stop;

   input    l2b0_mbist_clk_stop;
   input    l2b1_mbist_clk_stop;
   input    l2b2_mbist_clk_stop;
   input    l2b3_mbist_clk_stop;
   input    l2b4_mbist_clk_stop;
   input    l2b5_mbist_clk_stop;
   input    l2b6_mbist_clk_stop;
   input    l2b7_mbist_clk_stop;

   input    l2t0_mbist_clk_stop;
   input    l2t1_mbist_clk_stop;
   input    l2t2_mbist_clk_stop;
   input    l2t3_mbist_clk_stop;
   input    l2t4_mbist_clk_stop;
   input    l2t5_mbist_clk_stop;
   input    l2t6_mbist_clk_stop;
   input    l2t7_mbist_clk_stop;

   input    dmu_mbist_clk_stop;
   input    peu_mbist_clk_stop;

   input    rdp_mbist_clk_stop;
   input    rtx_mbist_clk_stop;
   input    tds_mbist_clk_stop;

   // Serdes ATPG
   output        tcu_srd_atpgse;
   output 	 tcu_srd_atpgd;
   output 	 tcu_mio_scan_out31;
   output [2:0]  tcu_srd_atpgmode;
   input 	 mio_tcu_scan_in31;
   input 	 srd_tcu_atpgq;

   input    l2t0_tcu_shscan_scan_out;
   input    l2t1_tcu_shscan_scan_out;
   input    l2t2_tcu_shscan_scan_out;
   input    l2t3_tcu_shscan_scan_out;
   input    l2t4_tcu_shscan_scan_out;
   input    l2t5_tcu_shscan_scan_out;
   input    l2t6_tcu_shscan_scan_out;
   input    l2t7_tcu_shscan_scan_out;
   output   tcu_l2t0_shscan_scan_in;
   output   tcu_l2t1_shscan_scan_in;
   output   tcu_l2t2_shscan_scan_in;
   output   tcu_l2t3_shscan_scan_in;
   output   tcu_l2t4_shscan_scan_in;
   output   tcu_l2t5_shscan_scan_in;
   output   tcu_l2t6_shscan_scan_in;
   output   tcu_l2t7_shscan_scan_in;

   // CSR (From/To mbist_ctl)
   input         ucb_csr_wr;
   input [5:0]   ucb_csr_addr;
   input [6:0]   ucb_data_out;

   // Scan reassigns
   assign   l1en   = tcu_int_ce; // 1'b1; // this is "ce" or "pce"     
   assign   pce_ov = tcu_int_pce_ov;
   assign   stop   = 1'b0;
   assign   se     = tcu_int_se;
   assign   siclk = tcu_int_aclk; // tcu_scan_aclk;
   assign   soclk = tcu_int_bclk; // tcu_scan_bclk;

   //create clock headers
   tcu_sigmux_ctl_l1clkhdr_ctl_macro cmp_clkgen (
				  .l2clk  (l2clk   ),
				  .l1clk  (l1clk   ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));


   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 ucb_csr_wr_sync_reg   (
      .scan_in  ( ucb_csr_wr_sync_reg_scanin  ),
      .scan_out ( ucb_csr_wr_sync_reg_scanout ),
      .l1clk    ( l1clk                       ),
      .en       ( io_cmp_sync_en_local        ),
      .din      ( ucb_csr_wr                  ),
      .dout     ( ucb_csr_wr_sync             ),
  .siclk(siclk),
  .soclk(soclk));

   assign ucb_sel_clkstp_delay = (ucb_csr_addr == 6'h24);
   assign ucb_wr_clkstp_delay  = ucb_csr_wr_sync && ucb_sel_clkstp_delay;


   // Create a pce signal for TCU to use internally; it blocks clocks
   //  during the time TCU is flushing itself in POR1
   // It goes to all non jtag flop headers in TCU except for those
   //  in sigmux_ctl that need to control the initial flush
   // Also, during TT it allows tcu to be scanned gracefully
   assign   tcu_int_ce        = (POR_ & ~(por_one & int_flush_d6) & ~ac_test_mode) | (ac_test_mode & ac_tt_trigger_fr);

   // Added via ECO to flop this path to UCB flop headers for timing ECO A
   assign   tcu_int_ce_to_ucb = (POR_ & ~(por_one & int_flush_d6) & ~ac_test_mode) | (ac_test_mode & ac_tt_trigger_fr);
  
   // ********************************************************************
   // Protect logic when transitioning into Transition Test (TT or AC) Test Mode
   // ********************************************************************
   // Used TDI as a convenient dedicated pin to block scan controls
   // Block these scan control signals until decide if in TT mode or not
   // To run ATPG, io_tdi must be low
   // To enter TT, io_tdi must be high when io_test_mode goes high and held
   //  until io_ac_test_mode can stabilize, then brought low
   assign   test_mode_block    =  io_tdi; 
   assign   test_mode_gated    =  io_test_mode      & ~test_mode_block;
   assign   pin_aclk           =  test_mode_gated   &  io_aclk;
   assign   pin_bclk           =  test_mode_gated   &  io_bclk;
   assign   pin_scan_en        =  test_mode_gated   &  io_scan_en;

   // Block shared pins from MIO if io_test_mode is 1'b0
   assign    ac_test_mode      =  test_mode_gated   &  io_ac_test_mode;
   
   //serdes control signal
   //assign   tcu_srdes_scancfg = io_test_mode ? io_srdes_scancfg : 2'b0;

   // To put peu in testmode to allow external clocks to be used
   assign   tcu_peu_testmode  = io_test_mode;
   assign   tcu_mac_testmode  = io_test_mode;
   assign   tcu_spc0_test_mode = io_test_mode  |  jt_scan_spc0;
   assign   tcu_spc1_test_mode = io_test_mode  |  jt_scan_spc1;
   assign   tcu_spc2_test_mode = io_test_mode  |  jt_scan_spc2;
   assign   tcu_spc3_test_mode = io_test_mode  |  jt_scan_spc3;
   assign   tcu_spc4_test_mode = io_test_mode  |  jt_scan_spc4;
   assign   tcu_spc5_test_mode = io_test_mode  |  jt_scan_spc5;
   assign   tcu_spc6_test_mode = io_test_mode  |  jt_scan_spc6;
   assign   tcu_spc7_test_mode = io_test_mode  |  jt_scan_spc7;
   assign   tcu_rst_scan_mode  = tcu_atpg_mode;
   
   // disable fbd scan chain in MCU when tcu_mcu_testmode is off
   //  so, scan chain active when in atpg mode, or flush reset for por1, por2 
   assign   tcu_mcu_testmode  = io_test_mode  |  (por_one | por_two);

   // This signal goes to Cluster Headers only, it should be active when
   //  io_test_mode is active but not transition test or LBist
   //  During macrotest needs to be off to allow write inhibit to get to arrays
   assign   tcu_atpg_mode       = test_mode_gated & ~io_ac_test_mode; 
                              //& (~mt_mode | (mt_mode & io_scan_en));

   // ********************************************************************
   // External clocks from pins, to be used during testmode
   // ********************************************************************
   assign   tcu_ccu_ext_cmp_clk = jt_scan_mtmode ? tck_clk_tree    : mio_ext_cmp_clk ;
   assign   tcu_ccu_ext_dr_clk  = jt_scan_mtmode ? tck_clk_tree    : mio_ext_dr_clk  ;

   assign   mac_125rx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[0] : 1'b0;
   assign   mac_125tx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[1] : 1'b0;
   assign   mac_156rx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[2] : 1'b0;
   assign   mac_156tx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[3] : 1'b0;
   assign   mac_312rx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[4] : 1'b0;
   assign   mac_312tx_test_clk  = test_mode_gated ? mio_tcu_niu_clk_ext[5] : 1'b0;
   
   assign   tcu_peu_clk_ext     = test_mode_gated ? mio_tcu_peu_clk_ext    : 1'b0;

   assign   tcu_div_bypass      = (test_mode_gated & ~io_ac_test_mode)
                                ?  mio_tcu_divider_bypass : 1'b0;

   assign   pll_bypass           =  mio_tcu_pll_cmp_bypass;
   assign   tcu_ccu_clk_stretch  =  cycle_stretch;
   // mux_sel: 00==PLL, 11==JTAG_Macrotest (TCK), 10=Ext_Clk, 01=Cycle_Stretch_Clk
   //          Ref_Clk not used
   assign   tcu_ccu_mux_sel[1:0] =   pll_bypass                       ? 2'b10
                                 : ( test_mode_gated & ~io_ac_test_mode) ? 2'b10
                                 : ( test_mode_gated &  io_ac_test_mode) ? 2'b00
                                 :   tcu_ccu_clk_stretch              ? 2'b01
                                 : ( jt_scan_mtmode                 ) ? 2'b11
                                 :   2'b00; // default - select PLL output

   // ********************************************************************
   // Transition Test
   // ********************************************************************
   //create signal to start ac trans counter off de-assertion of sync
   //io clock stops
   assign   ac_trans_test_counter_start = 
	    ~(spc0_stopped &
	      spc1_stopped &
	      spc2_stopped &
	      spc3_stopped &
	      spc4_stopped &
	      spc5_stopped &
	      spc6_stopped &
	      spc7_stopped &
	      bnk0_stopped &
	      l2t0_stopped &
	      bnk1_stopped &
	      l2t1_stopped &
	      bnk2_stopped &
	      l2t2_stopped &
	      bnk3_stopped &
	      l2t3_stopped &
	      bnk4_stopped &
	      l2t4_stopped &
	      bnk5_stopped &
	      l2t5_stopped &
	      bnk6_stopped &
	      l2t6_stopped &
	      bnk7_stopped &
	      l2t7_stopped &
	      mcu0_stopped_tt &
	      mcu1_stopped_tt &
	      mcu2_stopped_tt &
	      mcu3_stopped_tt &
	      soc0_stopped_tt &
	      soc1_stopped_tt &
	      soc2_stopped_tt &
	      soc3_stopped_tt); //tcu_soc8en_clk_stop_sync_enclk);

   // Use these to block clock stops going out on unintended clock domains
   //  during Transition Test; set tt_io_clk with scan-only flop
   // One or more CMP clock domains can be tested at same time
   // One or more IO clock domains can be tested at same time
   // Cannot test CMP and IO clock domains together
   // No DR clock domain can be tested
   assign   tt_cmp_mode         = ~(~ac_test_mode | ~tt_io_clk);
   assign   tt_io_mode          = ~(~ac_test_mode |  tt_io_clk);
   assign   tt_dr_mode          = ~(~ac_test_mode);

   // ********************************************************************
   // Scan Chain Muxing
   // ********************************************************************
   //later will have to add chain flexibility for jtag
   // - use chain 0 for mbist
   assign   pre_tcu_spc0_scan_out[1:0] = io_test_mode ? io_scan_in[1:0] : 2'b0;
   assign   pre_tcu_spc1_scan_out[1:0] = io_test_mode ? io_scan_in[3:2] : 2'b0;
   assign   pre_tcu_spc2_scan_out[1:0] = io_test_mode ? io_scan_in[5:4] : 2'b0;
   assign   pre_tcu_spc3_scan_out[1:0] = io_test_mode ? io_scan_in[7:6] : 2'b0;
   assign   pre_tcu_spc4_scan_out[1:0] = io_test_mode ? io_scan_in[9:8] : 2'b0;
   assign   pre_tcu_spc5_scan_out[1:0] = io_test_mode ? io_scan_in[11:10] : 2'b0;
   assign   pre_tcu_spc6_scan_out[1:0] = io_test_mode ? io_scan_in[13:12] : 2'b0;
   assign   pre_tcu_spc7_scan_out[1:0] = io_test_mode ? io_scan_in[15:14] : 2'b0;
   //need to assign tcu chain to part of soc
   //mfg scan chain 30 first goes through tcu in manufac. scan
   assign   pre_tcu_soca_scan_out = io_test_mode ? io_scan_in[16] : 1'b0;
   assign   pre_tcu_socb_scan_out = io_test_mode ? io_scan_in[17] : 1'b0;
   assign   pre_tcu_socc_scan_out = io_test_mode ? io_scan_in[18] : 1'b0;
   assign   pre_tcu_socd_scan_out = io_test_mode ? io_scan_in[19] : 1'b0;
   assign   pre_tcu_soce_scan_out = io_test_mode ? io_scan_in[20] : 1'b0;
   assign   pre_tcu_socf_scan_out = io_test_mode ? io_scan_in[21] : 1'b0;
   assign   pre_tcu_socg_scan_out = io_test_mode ? io_scan_in[22] : 1'b0;
   assign   pre_tcu_soch_scan_out = io_test_mode ? io_scan_in[23] : 1'b0;
   assign   pre_tcu_soc0_scan_out = io_test_mode ? io_scan_in[24] : 1'b0;
   assign   pre_tcu_soc1_scan_out = io_test_mode ? io_scan_in[25] : 1'b0;
   assign   pre_tcu_soc2_scan_out = io_test_mode ? io_scan_in[26] : 1'b0;
   assign   pre_tcu_soc3_scan_out = io_test_mode ? io_scan_in[27] : 1'b0;
   assign   pre_tcu_soc4_scan_out = io_test_mode ? io_scan_in[28] : 1'b0;
   assign   pre_tcu_soc5_scan_out = io_test_mode ? io_scan_in[29] : 1'b0;
   assign   pre_tcu_soc6_scan_out = io_test_mode ? tcu_scan_chain : 1'b0;

   // Connect PEU into chain 30: first peu mbist, then peu scan chain
   //  then connect RST -> CCU scan chains into chain 30
   assign   tcu_peu_scan_out      = (io_test_mode | jt_scan) & peu_tcu_mbist_scan_out;
   assign   tcu_rst_scan_out      =  io_test_mode            & peu_tcu_scan_in;
   assign   miobscan_or_peu_scan  =  tcu_atpg_mode ? mio_tcu_bs_scan_out  :  peu_tcu_scan_in;  

   // Connect in Boundary Scan during ATPG mode only (to chain 30, after CCU)
   //  BScan goes from TCU to MCU0, MCU1, PEU, MAC, MCU3, MCU2, then MIO and back to TCU
   assign   tcu_sbs_scan_in       =  tcu_atpg_mode ? ccu_tcu_scan_in  :  jtag_sbs_scan_in;
   
   //assign   tcu_pins_scan_out[1:0] = io_test_mode ? spc0_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[3:2] = io_test_mode ? spc1_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[5:4] = io_test_mode ? spc2_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[7:6] = io_test_mode ? spc3_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[9:8] = io_test_mode ? spc4_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[11:10] = io_test_mode ? spc5_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[13:12] = io_test_mode ? spc6_tcu_scan_in[1:0] : 2'b0;
   //assign   tcu_pins_scan_out[15:14] = io_test_mode ? spc7_tcu_scan_in[1:0] : 2'b0;

   assign   tcu_pins_scan_out[1:0] = io_test_mode ? {spc0_tcu_scan_in[1], spc0_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[3:2] = io_test_mode ? {spc1_tcu_scan_in[1], spc1_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[5:4] = io_test_mode ? {spc2_tcu_scan_in[1], spc2_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[7:6] = io_test_mode ? {spc3_tcu_scan_in[1], spc3_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[9:8] = io_test_mode ? {spc4_tcu_scan_in[1], spc4_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[11:10] = io_test_mode ? {spc5_tcu_scan_in[1], spc5_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[13:12] = io_test_mode ? {spc6_tcu_scan_in[1], spc6_tcu_lbist_scan_out} : 2'b0;
   assign   tcu_pins_scan_out[15:14] = io_test_mode ? {spc7_tcu_scan_in[1], spc7_tcu_lbist_scan_out} : 2'b0;

   assign   tcu_pins_scan_out[16] = io_test_mode ? soca_tcu_scan_in : 1'b0;
   assign   tcu_pins_scan_out[17] = io_test_mode ? socb_tcu_scan_in : 1'b0;

   //assign   tcu_pins_scan_out[18] = io_test_mode ? socc_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[19] = io_test_mode ? socd_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[20] = io_test_mode ? soce_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[21] = io_test_mode ? socf_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[22] = io_test_mode ? socg_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[23] = io_test_mode ? soch_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[24] = io_test_mode ? soc0_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[25] = io_test_mode ? soc1_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[26] = io_test_mode ? soc2_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[27] = io_test_mode ? soc3_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[28] = io_test_mode ? soc4_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[29] = io_test_mode ? soc5_tcu_scan_in : 1'b0;
   //assign   tcu_pins_scan_out[30] = io_test_mode ? soc6_tcu_scan_in : 1'b0;

   assign   tcu_pins_scan_out[18] = io_test_mode ? mcu3_tcu_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[19] = io_test_mode ? dmu_tcu_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[20] = io_test_mode ? rdp_rdmc_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[21] = io_test_mode ? rtx_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[22] = io_test_mode ? sio_tcu_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[23] = io_test_mode ? l2b7_tcu_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[24] = io_test_mode ? l2t1_tcu_shscan_scan_out : 1'b0;
   assign   tcu_pins_scan_out[25] = io_test_mode ? l2t3_tcu_shscan_scan_out : 1'b0;
   assign   tcu_pins_scan_out[26] = io_test_mode ? l2t5_tcu_shscan_scan_out : 1'b0;
   assign   tcu_pins_scan_out[27] = io_test_mode ? l2t7_tcu_shscan_scan_out : 1'b0;
   assign   tcu_pins_scan_out[28] = io_test_mode ? tds_mbist_scan_out : 1'b0;
   assign   tcu_pins_scan_out[29] = io_test_mode ? soc5_tcu_scan_in : 1'b0;
   assign   tcu_pins_scan_out[30] = io_test_mode ? miobscan_or_peu_scan  : 1'b0;

   //assign   tcu_pin_srdes_scan_out = io_test_mode ? srdes_tcu_scan_in : 1'b0;

   // ********************************************************************
   // RST: Reset Sequence Support
   // ********************************************************************
   // - These flops are Non-flushable, so they need a separate clock header
   tcu_sigmux_ctl_l1clkhdr_ctl_macro nonflush_clkgen (
      .l2clk  (l2clk   ),
      .se     (tcu_int_nfse),
      .l1en   (tcu_int_nfce),
      .pce_ov (1'b0),
      .l1clk  (nf_l1clk   ),
  .stop(stop));
   assign   tcu_int_nfce = ~ac_test_mode;
   assign rst_flush_req = flush_tcu 
                        | (rst_tcu_flush_init_req_hold & ~rst_tcu_flush_stop_req_hold);
   // ********************************************************************
   // Free-running l1clk during ATPG Mode
   // ********************************************************************
   tcu_sigmux_ctl_l1clkhdr_ctl_macro freerun_clkgen (
      .l2clk  (l2clk   ),
      .se     (1'b0), //tcu_int_frse),
      .l1en   (1'b1),
      .pce_ov (1'b1),
      .l1clk  (fr_l1clk   ),
  .stop(stop));

   // ********************************************************************
   // FLUSH Reset Sequence Support
   // ********************************************************************
   // Flop flush_req and delay by various cycles, to separate aclk, bclk and se changing
   //  so when flush_req changes, bclk sees it first, then se 48 cycles later
   //  and then aclk 24 cycles after that. Also, due to latencies in cluster header
   //  and global staging of clock stops after they leave tcu (5 pipeline stages), addt'l
   //  delays are needed in these boundary conditions:
   //  1.  when last clock stop asserts from TCU to when flush begins (48 cycles total) 
   //  2.  when flush ends with scan_en deasserting to first clock stop deasserting from TCU 
   //  3.  when last clock stop deasserts from TCU to tcu_rst_flush_stop_ack asserting
   // - 24 cycles chosen to cover poorly timed aclk, bclk and scan_en routing

   // When a rst_tcu_flush_init_req is received by TCU from RST, it generates a signal
   //  flush_q0. This is then delayed by various amounts to allow separation of the
   //  signals required for flushing the scan chains deterministically

   assign     ok_to_flush = cntstop_equal_max_q | flush_tcu;
   assign     flush_q0    = ~POR_ ? 1'b1 : (flush & ok_to_flush);

   // Counter starts when flush_q0 goes high; tap off counter values to delay flush_q0
   // Flush On Counter
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_7 tcusig_foncnt_nf_reg 
   (
     .scan_in(tcusig_foncnt_nf_reg_scanin),
     .scan_out(tcusig_foncnt_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .clr     (clear_flush_on_counter),
     .din     (flush_oncnt_din[6:0]),
     .dout    (flush_oncnt[6:0]    )
   );
   assign     flush_oncnt_din[6:0]    =  flush_oncnt[6:0] + 7'b1;
   assign     clear_flush_on_counter  = ~flush_q0 | ~POR_;
   assign     flush_on_24             =  flush_oncnt[6:0]  == 7'b0011000;
   assign     flush_on_48             =  flush_oncnt[6:0]  == 7'b0110000;
   assign     flush_on_72             =  flush_oncnt[6:0]  == 7'b1001000;
   assign     flush_on_96             =  flush_oncnt[6:0]  == 7'b1100000;

   // Counter starts when flush_q0 goes low; tap off counter values to delay flush_q0
   // Flush Off Counter
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_7 tcusig_foffcnt_nf_reg 
   (
     .scan_in(tcusig_foffcnt_nf_reg_scanin),
     .scan_out(tcusig_foffcnt_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .clr     (clear_flush_off_counter),
     .din     (flush_offcnt_din[6:0]),
     .dout    (flush_offcnt[6:0]    )
   );
   assign     flush_offcnt_din[6:0]   =  flush_offcnt[6:0] + 7'b1;
   assign     clear_flush_off_counter =  flush_q0 & ok_to_flush; //| ~POR_;
   assign     flush_off_24            =  flush_offcnt[6:0] == 7'b0011000;
   assign     flush_off_48            =  flush_offcnt[6:0] == 7'b0110000;
   assign     flush_off_72            =  flush_offcnt[6:0] == 7'b1001000;
   assign     flush_off_96            =  flush_offcnt[6:0] == 7'b1100000;

   // Delay flush_q0 based on counter value
   // Delay of 24 cycles
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_fq24_nf_reg 
   (
     .scan_in(tcusig_fq24_nf_reg_scanin),
     .scan_out(tcusig_fq24_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .en      (enable_flush_q24_delay),
     .din     (flush_q0),
     .dout    (flush_q24)
   );
   assign     enable_flush_q24_delay =  ~POR_ | (flush_q0  ?  flush_on_24 :  flush_off_24);
   // Delay of 48 cycles
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_fq48_nf_reg 
   (
     .scan_in(tcusig_fq48_nf_reg_scanin),
     .scan_out(tcusig_fq48_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .en      (enable_flush_q48_delay),
     .din     (flush_q0),
     .dout    (flush_q48)
   );
   assign     enable_flush_q48_delay =  ~POR_ | (flush_q0  ?  flush_on_48 :  flush_off_48);
   // Delay of 72 cycles
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_fq72_nf_reg 
   (
     .scan_in(tcusig_fq72_nf_reg_scanin),
     .scan_out(tcusig_fq72_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .en      (enable_flush_q72_delay),
     .din     (flush_q0),
     .dout    (flush_q72)
   );
   assign     enable_flush_q72_delay =  ~POR_ | (flush_q0  ?  flush_on_72 :  flush_off_72);
   // Delay of 96 cycles
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_fq96_nf_reg 
   (
     .scan_in(tcusig_fq96_nf_reg_scanin),
     .scan_out(tcusig_fq96_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .en      (enable_flush_q96_delay),
     .din     (flush_q0),
     .dout    (flush_q96)
   );
   assign     enable_flush_q96_delay =  ~POR_ | (flush_q0  ?  flush_on_96 :  flush_off_96);

   assign flush_off              = io_test_mode ? 1'b0 : (~POR_ | (flush_q72 | flush_go));
   assign tcu_jtag_flush_dly_req = flush_off; // to jtag
   assign flush_start            = ~POR_ | flush_q96;
   assign flush_go               = ~POR_ | flush_q48;

   assign flush_test_protect     = ~por_one & (flush_q24 | flush_q96);

   // Delay of at least 128 cycles - for delaying tcu_rst_flush_stop_ack generation by delaying
   //  recognition of all clock stops going off
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_2 tcusig_cstopq48_nf_reg 
   (
     .scan_in(tcusig_cstopq48_nf_reg_scanin),
     .scan_out(tcusig_cstopq48_nf_reg_scanout),
     .l1clk   (nf_l1clk),
     .siclk   (tcu_int_nfaclk),
     .soclk   (tcu_int_nfbclk),
     .en      (enable_cstop_q48_delay),
     .din     ({clk_stop_loops_all_off,     clk_stop_loops_all_off_q48 }),
     .dout    ({clk_stop_loops_all_off_q48, clk_stop_loops_all_off_q128})
   );
   assign     enable_cstop_q48_delay =  ~POR_ | (clk_stop_loops_all_off ?  flush_off_48 :  flush_on_48);

   // This flop delays start of se, aclk high for flush by flopping the stop 
   //  counter output when equal to max value; Counter hits max count after all clocks have
   //  been stopped, then this flop grabs that and holds it for duration of flush
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__en_1__width_1 tcusig_flushdly_reg    
   ( 
     .scan_in(tcusig_flushdly_reg_scanin),
     .scan_out(tcusig_flushdly_reg_scanout),
     .l1clk    (l1clk),
     .clr      (cntstart),
     .en       (clk_stop_loops_all_on & ~cntstop_equal_max_q),
     .din      (cntstop_equal_max),
     .dout     (cntstop_equal_max_q),
  .siclk(siclk),
  .soclk(soclk)
    );

   // ********************************************************************
   // END of FLUSH Reset Sequence Support
   // ********************************************************************

   // ********************************************************************
   // Hold and Create pulse when receiving rst_tcu_flush_init_req
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__en_1__width_1 tcusig_fireq_reg 
   (
     .scan_in(tcusig_fireq_reg_scanin),
     .scan_out(tcusig_fireq_reg_scanout),
     .l1clk    (l1clk),
     .en       (~rst_tcu_flush_init_req_hold),
     .clr      (rst_tcu_flush_stop_req),
     .din      (rst_tcu_flush_init_req),
     .dout     (rst_tcu_flush_init_req_hold),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign   fireq      = rst_tcu_flush_init_req & ~rst_tcu_flush_init_req_hold;
   // ********************************************************************
   // Hold when receiving rst_tcu_flush_stop_req
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__en_1__width_1 tcusig_fsreq_reg 
   (
     .scan_in(tcusig_fsreq_reg_scanin),
     .scan_out(tcusig_fsreq_reg_scanout),
     .l1clk    (l1clk),
     .en       (~rst_tcu_flush_stop_req_hold),
     .clr      (rst_tcu_flush_init_req),
     .din      (rst_tcu_flush_stop_req),
     .dout     (rst_tcu_flush_stop_req_hold),
  .siclk(siclk),
  .soclk(soclk)
   );

   // ********************************************************************
   // Return acknowledge to RST
   assign   tcu_rst_asicflush_stop_ack = POR_ & (por_one & ~int_flush_d12) & ~ac_test_mode;

   // ********************************************************************
   // Detect por1, por2, wmr1, wmr2; non-scan flops
   tcu_sigmux_ctl_msff_ctl_macro__clr__1__width_2 tcusig_rstsm_nf_reg 
   (
     .scan_in(tcusig_rstsm_nf_reg_scanin),
     .scan_out(tcusig_rstsm_nf_reg_scanout),
     .l1clk	(nf_l1clk),
     .siclk     (tcu_int_nfaclk), //(1'b0),
     .soclk     (tcu_int_nfbclk), //(1'b0),
     .clr_      (POR_),
     .din	(rst_sm_new[1:0]),
     .dout	(rst_sm_dout[1:0])
   );
   assign   rst_sm[1:0] = ({2{ POR_ }} & rst_sm_dout[1:0]); 
   assign   rst_sm_new =  (rst_sm == 2'b11)        ?  fireq ? 2'b10 : rst_sm[1:0]
                       :  fireq                    ? (rst_sm[1:0]  + 2'b1) 
                       :  rst_sm[1:0];
   assign   por_one    = ~rst_sm[1] & ~rst_sm[0];
   assign   por_two    = ~rst_sm[1] &  rst_sm[0];
   assign   wmr_one    =  rst_sm[1] & ~rst_sm[0];
   assign   wmr_two    =  rst_sm[1] &  rst_sm[0];

   // ********************************************************************
   // Return handshake signal to RST indicating flush has started
   //  flush init ack
   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_fiack_reg  (
      .scan_in  ( tcusig_fiack_reg_scanin    ),
      .scan_out ( tcusig_fiack_reg_scanout   ),
      .l1clk    ( l1clk                      ),
      .din      ( tcu_rst_flush_init_ack_int ),
      .dout     ( tcu_rst_flush_init_ack_pre ),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign   tcu_rst_flush_init_ack   =  tcu_rst_flush_init_ack_pre  & ~ac_test_mode;
  // If not asserted, assert it when flush_go and not in POR1
  // Deassert it when stop_ack comes
   assign tcu_rst_flush_init_ack_int = !tcu_rst_flush_init_ack ? (!por_one & flush_start)
                                     :  tcu_rst_flush_stop_ack ?  1'b0 
                                     :  tcu_rst_flush_init_ack;

	// Start POR BISX after EFU is done
   assign start_bisx_por = por_one && tcu_rst_efu_done;

	// Start WMR BISX when RST requested a flush stop and TCU acks it
   assign start_bisx_wmr = wmr_one && rst_tcu_flush_stop_req && tcu_rst_flush_stop_ack;

	// Stop WMR BISX when RST enters WMR2
   assign stop_bisx_wmr  = wmr_two;

   // ********************************************************************
   // Return handshake signal to RST indicating flush has stopped
   // This signal already flopped
   assign   tcu_rst_flush_stop_ack     = ~flush_clk_stop_active  |  ac_test_mode; 

   // ********************************************************************
   // Tell tcu to flush, but only once
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_tcuf_nf_reg 
   (
     .scan_in(tcusig_tcuf_nf_reg_scanin),
     .scan_out(tcusig_tcuf_nf_reg_scanout),
     .l1clk	(nf_l1clk),
     .siclk     (tcu_int_nfaclk), //(1'b0),
     .soclk     (tcu_int_nfbclk), //(1'b0),
     .en        (flush_tcu),
     .din	(flush_tcu_req),
     .dout	(flush_tcu_req_hld)
   );
   assign   flush_tcu_req =  por_one     & ~rst_tcu_flush_stop_req; 
                          //& ~(rst_tcu_flush_stop_req | rst_tcu_flush_stop_req_hold);
   assign   flush_tcu     = ~POR_        |  flush_tcu_req_hld;

   // ********************************************************************
   // This is new signal to tell tcu to flush
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_tcuasicf_nf_reg 
   (
     .scan_in(tcusig_tcuasicf_nf_reg_scanin),
     .scan_out(tcusig_tcuasicf_nf_reg_scanout),
     .l1clk	(nf_l1clk),
     .siclk     (tcu_int_nfaclk), //(1'b0),
     .soclk     (tcu_int_nfbclk), //(1'b0),
     .en        (asicflush_tcu),
     .din	(asicflush_tcu_req),
     .dout	(asicflush_tcu_req_hld)
   );
   assign   asicflush_tcu_req =  por_one     & ~rst_tcu_asicflush_stop_req; 
   assign   asicflush_tcu     = ~POR_        |  asicflush_tcu_req_hld;
   // These flops generate internal scan_en and aclk for TCU flush
   tcu_sigmux_ctl_msff_ctl_macro__width_12 tcusig_intflush_nf_reg 
   (
     .scan_in(tcusig_intflush_nf_reg_scanin),
     .scan_out(tcusig_intflush_nf_reg_scanout),
     .l1clk     (nf_l1clk),
     .siclk     (tcu_int_nfaclk), //(1'b0),
     .soclk     (tcu_int_nfbclk), //(1'b0),
     .din       ({int_flush,    int_flush_d,  int_flush_d2, int_flush_d3,  int_flush_d4,  int_flush_d5,
                  int_flush_d6, int_flush_d7, int_flush_d8, int_flush_d9,  int_flush_d10, int_flush_d11}),
     .dout      ({int_flush_d,  int_flush_d2, int_flush_d3, int_flush_d4,  int_flush_d5, int_flush_d6,
                  int_flush_d7, int_flush_d8, int_flush_d9, int_flush_d10, int_flush_d11, int_flush_d12})
   );
   assign   int_flush         =  asicflush_tcu_req_hld | ~POR_; 

   // ********************************************************************
   // Tell EFUSE to Start, but first send a CLEAR signal 
   // Active only during POR sequence; JTAG accessible tcu_efu_rvclr[6:0]
   //  tcu_efu_rvclr[6]   = 1 enables a clear
   //  tcu_efu_rvclr[5:0] = block_id per efuse spec selects Redundancy Value to clear
   //  tcu_efu_rvclr[5:0] = 11_1111 will tell efuse to clear all RV's
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_6 tcusig_efctl_reg // sends all clear, then start
   (
     .scan_in(tcusig_efctl_reg_scanin),
     .scan_out(tcusig_efctl_reg_scanout),
     .l1clk    (l1clk),
     .clr      (efctl_clear),
     .din      (efctl_din[5:0]),
     .dout     (efctl_dout[5:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign   efu_clr_ok          =  efctl_dout[5]        & ~efctl_dout[4] & ~efctl_dout[3] 
                                                        & ~efctl_clear;
   assign   efctl_clear         = (por_one | por_two)   &  flush_clk_stop_active;
   assign   efctl_hold          =  efctl_dout[5]        &  efctl_dout[4]  & efctl_dout[3];
   assign   efctl_din[5:0]      =  efctl_hold           ?  efctl_dout[5:0]  
                                : (efctl_dout[5:0]      +  6'b1);
   
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_15 tcusig_efcnt_reg // counts for efuse Xfer time
   (
     .scan_in(tcusig_efcnt_reg_scanin),
     .scan_out(tcusig_efcnt_reg_scanout),
     .l1clk    (l1clk),
     .clr      (efcnt_clear),
     .din      (efcnt_din[14:0]),
     .dout     (efcnt_dout[14:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign   efcnt_clear         = ~efctl_hold; // stop counting at 0x4801
   assign   efcnt_pre_hold      = efcnt_dout[14] & efcnt_dout[11]; //&efcnt_dout[14:1];
   assign   efcnt_hold          = efcnt_pre_hold & efcnt_dout[0];
   assign   efcnt_din[14:0]     =  efcnt_hold           ?  efcnt_dout[14:0] 
                                : (efcnt_dout[14:0]      +  15'b1);

   assign   tcu_efu_rvclr[6:0]  =  jtag_efu_clear_instr_sync ? jtag_efu_rvclr[6:0]
                                : {7{efu_clr_ok}};
   assign   tcu_efu_read_start  = efctl_dout[5]         &  efctl_dout[4]  & ~efctl_dout[3]; 
   assign   efu_done_int        = efcnt_hold;
   assign   tcu_rst_efu_done    = (efu_done_int  & ~jtag_por_active) | ac_test_mode;


   // ********************************************************************
   // Clock Stop Logic
   // ********************************************************************
   // 24 clock domains; stop in staggered fashion with starting point
   //  selected via a 24-bit register in tcu_regs_ctl

   assign strt_cnt_clr_ = ~flush_tcu;
   
   //create signals for which domain to stop first from register value 
   assign   hard_stop_via_reg_din = {|debug_reg_hard_stop_domain_1st};
   assign   clock_stop_active = hard_stop_via_reg | flush_clk_stop_active | coreavail_clk_stop_active
	    | jtag_clk_stop_active;
   assign   debug_stop_req = debug_cycle_counter_stop | debug_event_stop;
   assign   stop_req       = debug_stop_req | coreavail_clk_stop_active  | jtmb_clk_stop
                           | ((~por_one & (flush | flush_start)) | (por_one & flush_start)); 
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__en_1__width_1 tcusig_clkstopviareg_reg   
   (
     .scan_in(tcusig_clkstopviareg_reg_scanin),
     .scan_out(tcusig_clkstopviareg_reg_scanout),
     .l1clk    (l1clk),
     .clr       (clk_stop_loops_off),
     .en	(debug_stop_req),
     .din	(hard_stop_via_reg_din),
     .dout	(hard_stop_via_reg),
  .siclk(siclk),
  .soclk(soclk)
    );
   // ********************************************************************
   // JTAG Clock Stop mode - holds clock stop active until all clocks are restarted
   tcu_sigmux_ctl_msff_ctl_macro__clr__1__width_1 tcusig_jtagclkstop_reg   
   ( 
     .scan_in(tcusig_jtagclkstop_reg_scanin),
     .scan_out(tcusig_jtagclkstop_reg_scanout),
     .l1clk    (l1clk),
     .clr_     (jtag_clk_stop_clear_),
     .din      (jtag_clk_stop),
     .dout     (jtag_clk_stop_active),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   jtag_clk_stop_clear_ = ~clk_stop_loops_all_off | jtmb_clk_stop;
   //assign   jtag_clk_stop_clear_ = soc8_stopped | jtag_clk_stop_req_sync;
   assign   jtag_clk_stop = jtmb_clk_stop | jtag_clk_stop_active;
   // ********************************************************************
   // FLUSH mode - holds flush clock stop active until all clocks are restarted
   //  - all clocks restarted signaled by soc3 clk stop going low (last in sequence)
   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_flushclkstop_reg  
   ( 
     .scan_in(tcusig_flushclkstop_reg_scanin),
     .scan_out(tcusig_flushclkstop_reg_scanout),
     .l1clk    (l1clk),
     .din      (flush_clk_stop_in),      // invert din, dout since flush to zero
     .dout     (flush_clk_stop_active_l),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   flush_clk_stop_in  = ~flush_clk_stop | ~flush_clear_;
   assign   flush_clk_stop_active = ~flush_clk_stop_active_l;
 //assign   flush_clear_ = soc3_stopped | flush;
   assign   flush_clear_ = ~clk_stop_loops_all_off_q128 | flush;
   assign   flush_clk_stop = flush | flush_clk_stop_active;
   // ********************************************************************
   // Flop and delay rst_wmr_protect by a few io clock cycles to allow time
   //  for core_enable_status and bank_enable_status (baxx) to settle
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_3 tcusig_warmrp_reg  
   (
     .scan_in(tcusig_warmrp_reg_scanin),
     .scan_out(tcusig_warmrp_reg_scanout),
     .l1clk    (l1clk),
     .en       (io_cmp_sync_en_local),
     .din      ({rst_wmr_protect,   rst_wmr_protect_d,  rst_wmr_protect_d2  }),
     .dout     ({rst_wmr_protect_d, rst_wmr_protect_d2, rst_wmr_protect_sync}),
  .siclk(siclk),
  .soclk(soclk)
    );
   // ********************************************************************
   // CORE_AVAILABLE mode - stop clocks based on core_available bits that are '0'
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_1 tcusig_coreavailclkstop_reg  
   (
     .scan_in(tcusig_coreavailclkstop_reg_scanin),
     .scan_out(tcusig_coreavailclkstop_reg_scanout),
     .l1clk    (l1clk),
     .clr      (coreavail_clear),
     .din      (coreavail_clk_stop),
     .dout     (coreavail_clk_stop_active_dout),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   coreavail_clk_stop_active = ~ac_test_mode   & coreavail_clk_stop_active_dout;
   assign   core_avail_qualified      = ~efcnt_pre_hold | ac_test_mode;
   
   // Core_Avail and Bank_Avail are treated similarly
   assign   core_avail_pre_hold[7:0]   =  core_avail[7:0] | {8{core_avail_qualified}};
   assign   bank_avail_pre_hold[7:0]   =  bank_avail[7:0] | {8{core_avail_qualified}};
   assign   core_avail_pre_hold_l[7:0] = ~core_avail_pre_hold[7:0];
   assign   bank_avail_pre_hold_l[7:0] = ~bank_avail_pre_hold[7:0];
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_16 tcusig_ca_reg 
   (
     .scan_in(tcusig_ca_reg_scanin),
     .scan_out(tcusig_ca_reg_scanout),
     .l1clk    (l1clk),
     .en       (ca_enable),
     .din      ({bank_avail_pre_hold_l[7:0],core_avail_pre_hold_l[7:0]}),
     .dout     ({bank_avail_hold_l[7:0],    core_avail_hold_l[7:0]}),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign   core_avail_hold[7:0] = ~core_avail_hold_l[7:0];
   assign   bank_avail_hold[7:0] = ~bank_avail_hold_l[7:0];
   assign   ca_hold        =  tcu_rst_efu_done;  // update core_avail with POR1/2
   assign   ca_enable      = ~ca_hold;

   assign   all_cores_available = (&spc_avail) & (&l2bnk_avail);
   assign   coreavail_clk_stop = ~all_cores_available & ~ces_enable; // sequence if core_avail or core_en_st 
   // clear signal for core available mode
   tcu_sigmux_ctl_msff_ctl_macro__clr__1__width_1 tcusig_coreavailclear_reg  
   (
     .scan_in(tcusig_coreavailclear_reg_scanin),
     .scan_out(tcusig_coreavailclear_reg_scanout),
     .l1clk    (l1clk),
     .clr_     (coreavail_clk_stop),
     .din      (mcu3_clk_stop_loop | coreavail_clear), // this was: --> spc7_clk_stop_loop
     .dout     (coreavail_clear_dout),
  .siclk(siclk),
  .soclk(soclk)
    );
    assign  coreavail_clear = ~ac_test_mode & coreavail_clear_dout; 
   // ********************************************************************
   // CORE_ENABLE_STATUS - also stop clocks based on core_enable_status bits that are '0'
   //  but only after wmr_two events
   // Both core_en_status (8 bits) and L2_bank_en_status (4 bits) are included here

   // first, flop inputs and sync to io clock; these are core_enable and bank_enable combined
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_13 tcusig_enstat_reg 
   (
     .scan_in(tcusig_enstat_reg_scanin),
     .scan_out(tcusig_enstat_reg_scanout),
     .l1clk    (l1clk),
     .en       (enstat_en), //io_cmp_sync_en_local),
     .din      ({ncu_spc7_core_enable_status, ncu_spc6_core_enable_status, ncu_spc5_core_enable_status, 
                 ncu_spc4_core_enable_status, ncu_spc3_core_enable_status, ncu_spc2_core_enable_status,
                 ncu_spc1_core_enable_status, ncu_spc0_core_enable_status, 
                 ncu_spc_pm,    ncu_spc_ba67,    ncu_spc_ba45,    ncu_spc_ba23,    ncu_spc_ba01}),
     .dout     ({ncu_spc7_core_enable_status_io, ncu_spc6_core_enable_status_io, ncu_spc5_core_enable_status_io, 
                 ncu_spc4_core_enable_status_io, ncu_spc3_core_enable_status_io, ncu_spc2_core_enable_status_io,
                 ncu_spc1_core_enable_status_io, ncu_spc0_core_enable_status_io, 
                 ncu_spc_pm_io, ncu_spc_ba67_io, ncu_spc_ba45_io, ncu_spc_ba23_io, ncu_spc_ba01_io}),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   enstat_en   = ~tcu_test_protect_cmp & io_cmp_sync_en_local;

   assign   ncu_ba67    = ~ncu_spc_pm_io | ncu_spc_ba67_io;
   assign   ncu_ba45    = ~ncu_spc_pm_io | ncu_spc_ba45_io;
   assign   ncu_ba23    = ~ncu_spc_pm_io | ncu_spc_ba23_io;
   assign   ncu_ba01    = ~ncu_spc_pm_io | ncu_spc_ba01_io;

   assign   core_en_status[11:0] =
	    { ncu_ba67, ncu_ba45, ncu_ba23, ncu_ba01,
	      ncu_spc7_core_enable_status_io,ncu_spc6_core_enable_status_io,
              ncu_spc5_core_enable_status_io,ncu_spc4_core_enable_status_io,
              ncu_spc3_core_enable_status_io,ncu_spc2_core_enable_status_io,
              ncu_spc1_core_enable_status_io,ncu_spc0_core_enable_status_io
            };
   assign   core_enstat_qual_l    =  wmr_two & ~rst_wmr_protect_sync & tcu_rst_flush_stop_ack;
   assign   core_enstat_qual      = ~core_enstat_qual_l;
   // One-cycle pulse to allow core_en_stat value to be flopped and held
   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_cesq_reg 
   (
     .scan_in(tcusig_cesq_reg_scanin),
     .scan_out(tcusig_cesq_reg_scanout),
     .l1clk    (l1clk),
     .din      (core_enstat_qual),
     .dout     (core_enstat_qual_dly),
  .siclk(siclk),
  .soclk(soclk)
    );

   assign   core_en_status_pre_hold[11:0] = core_en_status[11:0] | {12{core_enstat_qual}};
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_12 tcusig_ces_reg 
   (
     .scan_in(tcusig_ces_reg_scanin),
     .scan_out(tcusig_ces_reg_scanout),
     .l1clk    (l1clk),
     .en       (ces_enable),
     .din      (~core_en_status_pre_hold[11:0]),
     .dout     (core_en_status_hold_l[11:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   core_en_status_hold[11:0] = ~core_en_status_hold_l[11:0];
   assign   ces_enable    = ~core_enstat_qual & core_enstat_qual_dly; // only update core_en_stat with WMR2

   assign   spc_avail[7:0]   =  core_avail_hold[7:0]   &    core_en_status_hold[7:0]  ;

   assign   l2bnk_avail[7:6] =  bank_avail_hold[7:6]   & {2{core_en_status_hold[11] }};
   assign   l2bnk_avail[5:4] =  bank_avail_hold[5:4]   & {2{core_en_status_hold[10] }};
   assign   l2bnk_avail[3:2] =  bank_avail_hold[3:2]   & {2{core_en_status_hold[9]  }};
   assign   l2bnk_avail[1:0] =  bank_avail_hold[1:0]   & {2{core_en_status_hold[8]  }};

   assign   mcu3_avail_hold  =  bank_avail_hold[7]     &    bank_avail_hold[6];
   assign   mcu2_avail_hold  =  bank_avail_hold[5]     &    bank_avail_hold[4];
   assign   mcu1_avail_hold  =  bank_avail_hold[3]     &    bank_avail_hold[2];
   assign   mcu0_avail_hold  =  bank_avail_hold[1]     &    bank_avail_hold[0];
   
   //assign   mcu3_avail       =  mcu3_avail_hold        &    core_en_status_hold[11];
   //assign   mcu2_avail       =  mcu2_avail_hold        &    core_en_status_hold[10];
   //assign   mcu1_avail       =  mcu1_avail_hold        &    core_en_status_hold[9] ;
   //assign   mcu0_avail       =  mcu0_avail_hold        &    core_en_status_hold[8] ;  

   
   // ********************************************************************
   // Clock Sequencer
   // ********************************************************************
   
   tcu_clkseq_ctl clkseq_ctl
     (
      .debug_reg_hard_stop_domain_1st (debug_reg_hard_stop_domain_1st[23:0]),
      .tcu_pce_ov (tcu_int_pce_ov),
      .scan_in  (clk_stop_seq_scanin),
      .scan_out (clk_stop_seq_scanout),
  .tcu_int_se(tcu_int_se),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_ce(tcu_int_ce),
  .l2clk(l2clk),
  .clock_stop_active(clock_stop_active),
  .hard_stop_via_reg_din(hard_stop_via_reg_din),
  .test_mode_gated(test_mode_gated),
  .io_ac_test_mode(io_ac_test_mode),
  .stop_req(stop_req),
  .cntstart_equal_max(cntstart_equal_max),
  .cntstop_equal_max(cntstop_equal_max),
  .cntstart(cntstart),
  .cntstop(cntstop),
  .spc0_clk_stop_loop(spc0_clk_stop_loop),
  .spc1_clk_stop_loop(spc1_clk_stop_loop),
  .spc2_clk_stop_loop(spc2_clk_stop_loop),
  .spc3_clk_stop_loop(spc3_clk_stop_loop),
  .spc4_clk_stop_loop(spc4_clk_stop_loop),
  .spc5_clk_stop_loop(spc5_clk_stop_loop),
  .spc6_clk_stop_loop(spc6_clk_stop_loop),
  .spc7_clk_stop_loop(spc7_clk_stop_loop),
  .bnk0_clk_stop_loop(bnk0_clk_stop_loop),
  .bnk1_clk_stop_loop(bnk1_clk_stop_loop),
  .bnk2_clk_stop_loop(bnk2_clk_stop_loop),
  .bnk3_clk_stop_loop(bnk3_clk_stop_loop),
  .bnk4_clk_stop_loop(bnk4_clk_stop_loop),
  .bnk5_clk_stop_loop(bnk5_clk_stop_loop),
  .bnk6_clk_stop_loop(bnk6_clk_stop_loop),
  .bnk7_clk_stop_loop(bnk7_clk_stop_loop),
  .mcu0_clk_stop_loop(mcu0_clk_stop_loop),
  .mcu1_clk_stop_loop(mcu1_clk_stop_loop),
  .mcu2_clk_stop_loop(mcu2_clk_stop_loop),
  .mcu3_clk_stop_loop(mcu3_clk_stop_loop),
  .soc0_clk_stop_loop(soc0_clk_stop_loop),
  .soc1_clk_stop_loop(soc1_clk_stop_loop),
  .soc2_clk_stop_loop(soc2_clk_stop_loop),
  .soc3_clk_stop_loop(soc3_clk_stop_loop),
  .clk_stop_loops_all_on(clk_stop_loops_all_on),
  .clk_stop_loops_all_off(clk_stop_loops_all_off)
      );

   assign   clk_stop_loops_off = clk_stop_loops_all_off & ~debug_stop_req;
   assign   clkseq_stop = clk_stop_loops_all_on;  // to jtag
   assign   clkseq_strt = clk_stop_loops_all_off; // to jtag

   // ********************************************************************
   // Delay each clock stop before sending it on to synchronizers
   // ********************************************************************
   assign   cntstop  =  stop_req & clock_stop_active; 
   assign   cntstart = ~stop_req & clock_stop_active;
   assign   cntstop_equal_max  = (cntstop_dout[`CSDEL_MSB:0]  == cntdly_dout[`CSDEL_MSB:0]);
   assign   cntstart_equal_max = (cntstart_dout[`CSDEL_MSB:0] == cntdly_dout[`CSDEL_MSB:0]);
   
   assign   cntstop_din[`CSDEL_MSB:0]  = cntstop  ? (cntstop_dout[`CSDEL_MSB:0]  + `CSDEL'b1) 
                                       : cntstop_dout[`CSDEL_MSB:0];
   assign   cntstart_din[`CSDEL_MSB:0] = cntstart ? (cntstart_dout[`CSDEL_MSB:0] + `CSDEL'b1) 
                                       : cntstart_dout[`CSDEL_MSB:0];

   
   // ********************************************************************
   // 2 counters; to insure common delay between starting/stopping clock
   // domains; set `CSDEL=7 for 128 l2clk delays, `CSDEL_MSB=6
   // ********************************************************************
   // ******************************************************************** 
   // Register to set programmable delay between starts/stops
   // ********************************************************************
   tcu_sigmux_ctl_msff_ctl_macro__width_7 tcusig_cntdly_reg 
   ( 
     .scan_in(tcusig_cntdly_reg_scanin),
     .scan_out(tcusig_cntdly_reg_scanout),
     .l1clk    (l1clk),
     .din      (cntdly_din_l[`CSDEL_MSB:0]),
     .dout     (cntdly_dout_l[`CSDEL_MSB:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   cntdly_din_l[`CSDEL_MSB:0] = ucb_wr_clkstp_delay ? ucb_data_out[`CSDEL_MSB:0] :
                                         ~cntdly_din[`CSDEL_MSB:0];
   assign   cntdly_dout[`CSDEL_MSB:0]  = ~cntdly_dout_l[`CSDEL_MSB:0];
   
   assign   cntdly_din[`CSDEL_MSB:0] = jtag_upd_cntdly_sync ? jtag_cntdly_data[`CSDEL_MSB:0]
                                     : cntdly_dout[`CSDEL_MSB:0];
   assign   csdel_data[`CSDEL_MSB:0] = cntdly_dout[`CSDEL_MSB:0];

   // ******************************************************************** 
   // This COUNTER counts to STOP CLOCKS: turn clocks OFF
   // ********************************************************************
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_7 tcusig_cntstop_reg 
   ( 
     .scan_in(tcusig_cntstop_reg_scanin),
     .scan_out(tcusig_cntstop_reg_scanout),
     .l1clk    (l1clk),
     .clr      (cntstop_equal_max),
     .din      ({`CSDEL{stop_cnt_en}} & cntstop_din[`CSDEL_MSB:0]),
     .dout     (cntstop_dout[`CSDEL_MSB:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   stop_cnt_en = stop_req;
   // ********************************************************************
   // This COUNTER counts to START CLOCKS: turn clocks ON
   // ********************************************************************
   tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_7 tcusig_cntstart_reg 
   ( 
     .scan_in(tcusig_cntstart_reg_scanin),
     .scan_out(tcusig_cntstart_reg_scanout),
     .l1clk    (l1clk),
     .clr      (cntstart_equal_max),
     .din      ({`CSDEL{strt_cnt_en}} & cntstart_din[`CSDEL_MSB:0]),
     .dout     (cntstart_dout[`CSDEL_MSB:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   strt_cnt_en = ~stop_req & strt_cnt_clr_;
   
   // ********************************************************************
   // Flop soft-stop mode, hold until clock sequencer turns all spc clocks on again
   // ********************************************************************
   // This allows clk seq. time to finish its operation 
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 tcusig_ssmode_reg 
   ( 
     .scan_in(tcusig_ssmode_reg_scanin),
     .scan_out(tcusig_ssmode_reg_scanout),
     .l1clk    (l1clk),
     .en       (ssmode_en),
     .din      (ss_req),
     .dout     (ss_mode),
  .siclk(siclk),
  .soclk(soclk)
    );
   //assign   ss_req    =  spc_ss_mode | instr_clock_sstop  |  instr_cs_mode;
   assign   core_sel_reg_nonzero = |spc_ss_sel[7:0];
   assign   ss_req    =  spc_ss_mode | instr_sstop_csmode_sync   |  core_sel_reg_nonzero;
   assign   ssmode_en =  ss_req      | clk_stop_loops_all_off;

   // ********************************************************************
   // Flop soft-stop requests
   // ********************************************************************
   // This allows signals to be extended until clk sequencer finishes
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_8 tcusig_sssel_reg 
   ( 
     .scan_in(tcusig_sssel_reg_scanin),
     .scan_out(tcusig_sssel_reg_scanout),
     .l1clk    (l1clk),
     .en       (sssel_en),
     .din      (spc_ss_sel[7:0]),
     .dout     (spc_ss_sel_d[7:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign   sssel_en  = ~ss_mode;
   assign   spc_ss_sel_qual[7:0] = spc_ss_sel[7:0] | spc_ss_sel_d[7:0];

   // ********************************************************************
   // ********************************************************************
   // Generation of clock stops before synchronizing them 
   // ********************************************************************
   assign   spc0_clk_stop_cavail = spc0_clk_stop_loop & ~spc_avail[0];
   assign   spc0_clk_stop_prepresync = coreavail_clk_stop_active ? spc0_clk_stop_cavail : spc0_clk_stop_loop;
   assign   spc0_clk_stop_presync = (coreavail_clear & ~spc_avail[0]) ? 1'b1
                                  : ac_test_mode    ? spc0_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc0_clk_stop_loop & wmr_two ? spc0_clk_stop_sync
                                  : ss_mode & ~spc_ss_sel_qual[0] ? 1'b0	    
                                  : spc0_clk_stop_prepresync;
   
   assign   spc1_clk_stop_cavail = spc1_clk_stop_loop & ~spc_avail[1];
   assign   spc1_clk_stop_prepresync = coreavail_clk_stop_active ? spc1_clk_stop_cavail : spc1_clk_stop_loop;
   assign   spc1_clk_stop_presync = (coreavail_clear & ~spc_avail[1]) ? 1'b1
                                  : ac_test_mode    ? spc1_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc1_clk_stop_loop & wmr_two ? spc1_clk_stop_sync
                                  : ss_mode & ~spc_ss_sel_qual[1] ? 1'b0	    
                                  : spc1_clk_stop_prepresync;

   assign   spc2_clk_stop_cavail = spc2_clk_stop_loop & ~spc_avail[2];
   assign   spc2_clk_stop_prepresync = coreavail_clk_stop_active ? spc2_clk_stop_cavail : spc2_clk_stop_loop;
   assign   spc2_clk_stop_presync = (coreavail_clear & ~spc_avail[2]) ? 1'b1
                                  : ac_test_mode    ? spc2_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc2_clk_stop_loop & wmr_two ? spc2_clk_stop_sync
                                  : ss_mode & ~spc_ss_sel_qual[2] ? 1'b0	    
                                  : spc2_clk_stop_prepresync;

   assign   spc3_clk_stop_cavail = spc3_clk_stop_loop & ~spc_avail[3];
   assign   spc3_clk_stop_prepresync = coreavail_clk_stop_active ? spc3_clk_stop_cavail : spc3_clk_stop_loop;
   assign   spc3_clk_stop_presync = (coreavail_clear & ~spc_avail[3]) ? 1'b1
                                  : ac_test_mode    ? spc3_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc3_clk_stop_loop & wmr_two ? spc3_clk_stop_sync
                                  : ss_mode & ~spc_ss_sel_qual[3] ? 1'b0
                                  : spc3_clk_stop_prepresync;

   assign   spc4_clk_stop_cavail = spc4_clk_stop_loop & ~spc_avail[4];
   assign   spc4_clk_stop_prepresync = coreavail_clk_stop_active ? spc4_clk_stop_cavail : spc4_clk_stop_loop;
   assign   spc4_clk_stop_presync = (coreavail_clear & ~spc_avail[4]) ? 1'b1
                                  : ac_test_mode    ? spc4_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc4_clk_stop_loop & wmr_two ? spc4_clk_stop_sync
	    	                  : ss_mode & ~spc_ss_sel_qual[4] ? 1'b0
                                  : spc4_clk_stop_prepresync;

   assign   spc5_clk_stop_cavail = spc5_clk_stop_loop & ~spc_avail[5];
   assign   spc5_clk_stop_prepresync = coreavail_clk_stop_active ? spc5_clk_stop_cavail : spc5_clk_stop_loop;
   assign   spc5_clk_stop_presync = (coreavail_clear & ~spc_avail[5]) ? 1'b1
                                  : ac_test_mode    ? spc5_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc5_clk_stop_loop & wmr_two ? spc5_clk_stop_sync
	    	                  : ss_mode & ~spc_ss_sel_qual[5] ? 1'b0
                                  : spc5_clk_stop_prepresync;

   assign   spc6_clk_stop_cavail = spc6_clk_stop_loop & ~spc_avail[6];
   assign   spc6_clk_stop_prepresync = coreavail_clk_stop_active? spc6_clk_stop_cavail : spc6_clk_stop_loop;
   assign   spc6_clk_stop_presync = (coreavail_clear & ~spc_avail[6]) ? 1'b1
                                  : ac_test_mode    ? spc6_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc6_clk_stop_loop & wmr_two ? spc6_clk_stop_sync 
                                  : ss_mode & ~spc_ss_sel_qual[6] ? 1'b0
                                  : spc6_clk_stop_prepresync;

   assign   spc7_clk_stop_cavail = spc7_clk_stop_loop & ~spc_avail[7];
   assign   spc7_clk_stop_prepresync = coreavail_clk_stop_active ? spc7_clk_stop_cavail : spc7_clk_stop_loop;
   assign   spc7_clk_stop_presync = (coreavail_clear & ~spc_avail[7]) ? 1'b1
                                  : ac_test_mode    ? spc7_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~spc7_clk_stop_loop & wmr_two ? spc7_clk_stop_sync
	                          : ss_mode & ~spc_ss_sel_qual[7] ? 1'b0
                                  : spc7_clk_stop_prepresync;

   //soc
   assign   bnk0_clk_stop_cavail = bnk0_clk_stop_loop & ~l2bnk_avail[0];
   assign   bnk0_clk_stop_prepresync = coreavail_clk_stop_active ? bnk0_clk_stop_cavail : bnk0_clk_stop_loop;
   assign   bnk0_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[0]) ? 1'b1
                                  : ac_test_mode    ? bnk0_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk0_clk_stop_loop & wmr_two ? bnk0_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : bnk0_clk_stop_prepresync;

   assign   l2t0_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk0_clk_stop_loop;
   assign   l2t0_clk_stop_presync = ac_test_mode    ? l2t0_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk0_clk_stop_loop & wmr_two ? l2t0_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t0_clk_stop_prepresync;

   assign   bnk1_clk_stop_cavail = bnk1_clk_stop_loop & ~l2bnk_avail[1];
   assign   bnk1_clk_stop_prepresync = coreavail_clk_stop_active ? bnk1_clk_stop_cavail : bnk1_clk_stop_loop;
   assign   bnk1_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[1]) ? 1'b1
                                  : ac_test_mode    ? bnk1_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk1_clk_stop_loop & wmr_two ? bnk1_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : bnk1_clk_stop_prepresync;

   assign   l2t1_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk1_clk_stop_loop;
   assign   l2t1_clk_stop_presync = ac_test_mode    ? l2t1_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk1_clk_stop_loop & wmr_two ? l2t1_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t1_clk_stop_prepresync;

   assign   bnk2_clk_stop_cavail = bnk2_clk_stop_loop & ~l2bnk_avail[2];
   assign   bnk2_clk_stop_prepresync = coreavail_clk_stop_active ? bnk2_clk_stop_cavail : bnk2_clk_stop_loop;
   assign   bnk2_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[2]) ? 1'b1
                                  : ac_test_mode    ? bnk2_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk2_clk_stop_loop & wmr_two ? bnk2_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk2_clk_stop_prepresync;

   assign   l2t2_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk2_clk_stop_loop;
   assign   l2t2_clk_stop_presync = ac_test_mode    ? l2t2_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk2_clk_stop_loop & wmr_two ? l2t2_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t2_clk_stop_prepresync;

   assign   bnk3_clk_stop_cavail = bnk3_clk_stop_loop & ~l2bnk_avail[3];
   assign   bnk3_clk_stop_prepresync = coreavail_clk_stop_active ? bnk3_clk_stop_cavail : bnk3_clk_stop_loop;
   assign   bnk3_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[3]) ? 1'b1
                                  : ac_test_mode    ? bnk3_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk3_clk_stop_loop & wmr_two ? bnk3_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk3_clk_stop_prepresync;

   assign   l2t3_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk3_clk_stop_loop;
   assign   l2t3_clk_stop_presync = ac_test_mode    ? l2t3_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk3_clk_stop_loop & wmr_two ? l2t3_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t3_clk_stop_prepresync;

   assign   bnk4_clk_stop_cavail = bnk4_clk_stop_loop & ~l2bnk_avail[4];
   assign   bnk4_clk_stop_prepresync = coreavail_clk_stop_active ? bnk4_clk_stop_cavail : bnk4_clk_stop_loop;
   assign   bnk4_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[4]) ? 1'b1
                                  : ac_test_mode    ? bnk4_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk4_clk_stop_loop & wmr_two ? bnk4_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk4_clk_stop_prepresync;

   assign   l2t4_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk4_clk_stop_loop;
   assign   l2t4_clk_stop_presync = ac_test_mode    ? l2t4_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk4_clk_stop_loop & wmr_two ? l2t4_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t4_clk_stop_prepresync;

   assign   bnk5_clk_stop_cavail = bnk5_clk_stop_loop & ~l2bnk_avail[5];
   assign   bnk5_clk_stop_prepresync = coreavail_clk_stop_active ? bnk5_clk_stop_cavail : bnk5_clk_stop_loop;
   assign   bnk5_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[5]) ? 1'b1
                                  : ac_test_mode    ? bnk5_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk5_clk_stop_loop & wmr_two ? bnk5_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk5_clk_stop_prepresync;

   assign   l2t5_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk5_clk_stop_loop;
   assign   l2t5_clk_stop_presync = ac_test_mode    ? l2t5_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk5_clk_stop_loop & wmr_two ? l2t5_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t5_clk_stop_prepresync;

   assign   bnk6_clk_stop_cavail = bnk6_clk_stop_loop & ~l2bnk_avail[6];
   assign   bnk6_clk_stop_prepresync = coreavail_clk_stop_active ? bnk6_clk_stop_cavail : bnk6_clk_stop_loop;
   assign   bnk6_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[6]) ? 1'b1
                                  : ac_test_mode    ? bnk6_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk6_clk_stop_loop & wmr_two ? bnk6_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk6_clk_stop_prepresync;

   assign   l2t6_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk6_clk_stop_loop;
   assign   l2t6_clk_stop_presync = ac_test_mode    ? l2t6_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk6_clk_stop_loop & wmr_two ? l2t6_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t6_clk_stop_prepresync;

   assign   bnk7_clk_stop_cavail = bnk7_clk_stop_loop & ~l2bnk_avail[7];
   assign   bnk7_clk_stop_prepresync = coreavail_clk_stop_active ? bnk7_clk_stop_cavail : bnk7_clk_stop_loop;
   assign   bnk7_clk_stop_presync = (coreavail_clear & ~l2bnk_avail[7]) ? 1'b1
                                  : ac_test_mode    ? bnk7_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk7_clk_stop_loop & wmr_two ? bnk7_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : bnk7_clk_stop_prepresync;

   assign   l2t7_clk_stop_prepresync = coreavail_clk_stop_active ? 1'b0 : bnk7_clk_stop_loop;
   assign   l2t7_clk_stop_presync = ac_test_mode    ? l2t7_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~bnk7_clk_stop_loop & wmr_two ? l2t7_clk_stop_sync
                                  : ss_mode ? 1'b0
                                  : l2t7_clk_stop_prepresync;

   assign   mcu0_clk_stop_cavail = mcu0_clk_stop_loop & (~l2bnk_avail[0] | ~l2bnk_avail[1]);
   assign   mcu0_clk_stop_prepresync = coreavail_clk_stop_active ? mcu0_clk_stop_cavail : mcu0_clk_stop_loop;
   assign   mcu0_clk_stop_presync = (coreavail_clear & (~l2bnk_avail[0] | ~l2bnk_avail[1])) ? 1'b1
                                  : ac_test_mode    ? mcu0_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~mcu0_clk_stop_loop & wmr_two ? mcu0_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : mcu0_clk_stop_prepresync;

   assign   mcu1_clk_stop_cavail = mcu1_clk_stop_loop & (~l2bnk_avail[2] | ~l2bnk_avail[3]);
   assign   mcu1_clk_stop_prepresync = coreavail_clk_stop_active ? mcu1_clk_stop_cavail : mcu1_clk_stop_loop;
   assign   mcu1_clk_stop_presync = (coreavail_clear & (~l2bnk_avail[2] | ~l2bnk_avail[3])) ? 1'b1
                                  : ac_test_mode    ? mcu1_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~mcu1_clk_stop_loop & wmr_two ? mcu1_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : mcu1_clk_stop_prepresync;

   assign   mcu2_clk_stop_cavail = mcu2_clk_stop_loop & (~l2bnk_avail[4] | ~l2bnk_avail[5]);
   assign   mcu2_clk_stop_prepresync = coreavail_clk_stop_active ? mcu2_clk_stop_cavail : mcu2_clk_stop_loop;
   assign   mcu2_clk_stop_presync = (coreavail_clear & (~l2bnk_avail[4] | ~l2bnk_avail[5])) ? 1'b1
                                  : ac_test_mode    ? mcu2_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~mcu2_clk_stop_loop & wmr_two ? mcu2_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : mcu2_clk_stop_prepresync;

   assign   mcu3_clk_stop_cavail = mcu3_clk_stop_loop & (~l2bnk_avail[6] | ~l2bnk_avail[7]);
   assign   mcu3_clk_stop_prepresync = coreavail_clk_stop_active ? mcu3_clk_stop_cavail : mcu3_clk_stop_loop;
   assign   mcu3_clk_stop_presync = (coreavail_clear & (~l2bnk_avail[6] | ~l2bnk_avail[7])) ? 1'b1
                                  : ac_test_mode    ? mcu3_clk_stop_sync // hold data
                                  : (~all_cores_available & ~coreavail_clear) & ~mcu3_clk_stop_loop & wmr_two ? mcu3_clk_stop_sync
	                          : ss_mode ? 1'b0
                                  : mcu3_clk_stop_prepresync;   
   
   assign   soc0_clk_stop_presync = ac_test_mode        ? soc0_clk_stop_sync
	                          : ss_mode             ? 1'b0
                                  : soc0_clk_stop_loop;
   assign   soc1_clk_stop_presync = ac_test_mode        ? soc1_clk_stop_sync
	                          : ss_mode             ? 1'b0
                                  : soc1_clk_stop_loop;
   assign   soc2_clk_stop_presync = ac_test_mode        ? soc2_clk_stop_sync
                                  : ss_mode             ? 1'b0 
                                  : soc2_clk_stop_loop;
   assign   soc3_clk_stop_presync = ac_test_mode        ? soc3_clk_stop_sync
	                          : ss_mode             ? 1'b0
                                  : soc3_clk_stop_loop;

   // ********************************************************************
   // Synchronizers for transition test trigger from package pin
   // ********************************************************************
   assign   io_ac_tt_trigger = io_ac_testtrig & test_mode_gated;
   assign   tt_hold     = ac_test_mode    & ~ac_tt_trigger;
   // synch flop is free running, non-scanned
   cl_sc1_clksyncff_4x sync_ff_ac_tt_trigger_fr
     (.si (1'b0), //(sync_ff_ac_tt_trigger_fr_scanin),
      .so (sync_ff_ac_tt_trigger_fr_scanout_unused),
      .l1clk (fr_l1clk),
      .siclk (1'b0),
      .soclk (1'b0),
      .d     (io_ac_tt_trigger),
      .q     (ac_tt_trigger_fr)
      );
   // this is now observe flop for tt_trigger
   cl_sc1_clksyncff_4x sync_ff_ac_tt_trigger
     (.si (sync_ff_ac_tt_trigger_scanin),
      .so (sync_ff_ac_tt_trigger_scanout),
      .l1clk (l1clk),
      .d     (ac_tt_trigger_fr),
      .q     (ac_tt_trigger_fr_sync_unused),
  .siclk(siclk),
  .soclk(soclk) //(ac_tt_trigger)
      );
   assign   ac_tt_trigger   = ac_tt_trigger_fr; 
   // ********************************************************************
   // Synchronizers for Clock Stops
   // ********************************************************************
   // - These are not synchronizers anymore; all signals sent out in cmp clock domain
   
   assign   spc0_clk_stop   = tt_hold ? 1'b1 : spc0_clk_stop_q;
   assign   spc0_clk_stop_q = (spc0_clk_stop_sync  | (~core_avail_hold[0] & wmr_two & ~ac_test_mode   ));
   assign   spc1_clk_stop   = tt_hold ? 1'b1 : spc1_clk_stop_q;
   assign   spc1_clk_stop_q = (spc1_clk_stop_sync  | (~core_avail_hold[1] & wmr_two & ~ac_test_mode   ));
   assign   spc2_clk_stop   = tt_hold ? 1'b1 : spc2_clk_stop_q;
   assign   spc2_clk_stop_q = (spc2_clk_stop_sync  | (~core_avail_hold[2] & wmr_two & ~ac_test_mode   ));
   assign   spc3_clk_stop   = tt_hold ? 1'b1 : spc3_clk_stop_q;
   assign   spc3_clk_stop_q = (spc3_clk_stop_sync  | (~core_avail_hold[3] & wmr_two & ~ac_test_mode   ));
   assign   spc4_clk_stop   = tt_hold ? 1'b1 : spc4_clk_stop_q;
   assign   spc4_clk_stop_q = (spc4_clk_stop_sync  | (~core_avail_hold[4] & wmr_two & ~ac_test_mode   ));
   assign   spc5_clk_stop   = tt_hold ? 1'b1 : spc5_clk_stop_q;
   assign   spc5_clk_stop_q = (spc5_clk_stop_sync  | (~core_avail_hold[5] & wmr_two & ~ac_test_mode   ));
   assign   spc6_clk_stop   = tt_hold ? 1'b1 : spc6_clk_stop_q;
   assign   spc6_clk_stop_q = (spc6_clk_stop_sync  | (~core_avail_hold[6] & wmr_two & ~ac_test_mode   ));
   assign   spc7_clk_stop   = tt_hold ? 1'b1 : spc7_clk_stop_q;
   assign   spc7_clk_stop_q = (spc7_clk_stop_sync  | (~core_avail_hold[7] & wmr_two & ~ac_test_mode   ));

   assign   bnk0_clk_stop   = tt_hold ? 1'b1 : bnk0_clk_stop_q;
   assign   bnk0_clk_stop_q = (bnk0_clk_stop_sync  | (~bank_avail_hold[0] & wmr_two & ~ac_test_mode   ));
   assign   l2t0_clk_stop   = tt_hold ? 1'b1 : l2t0_clk_stop_sync;
   assign   bnk1_clk_stop   = tt_hold ? 1'b1 : bnk1_clk_stop_q;
   assign   bnk1_clk_stop_q = (bnk1_clk_stop_sync  | (~bank_avail_hold[1] & wmr_two & ~ac_test_mode   ));
   assign   l2t1_clk_stop   = tt_hold ? 1'b1 : l2t1_clk_stop_sync;
   assign   bnk2_clk_stop   = tt_hold ? 1'b1 : bnk2_clk_stop_q;
   assign   bnk2_clk_stop_q = (bnk2_clk_stop_sync  | (~bank_avail_hold[2] & wmr_two & ~ac_test_mode   ));
   assign   l2t2_clk_stop   = tt_hold ? 1'b1 : l2t2_clk_stop_sync;
   assign   bnk3_clk_stop   = tt_hold ? 1'b1 : bnk3_clk_stop_q;
   assign   bnk3_clk_stop_q = (bnk3_clk_stop_sync  | (~bank_avail_hold[3] & wmr_two & ~ac_test_mode   ));
   assign   l2t3_clk_stop   = tt_hold ? 1'b1 : l2t3_clk_stop_sync;
   assign   bnk4_clk_stop   = tt_hold ? 1'b1 : bnk4_clk_stop_q;
   assign   bnk4_clk_stop_q = (bnk4_clk_stop_sync  | (~bank_avail_hold[4] & wmr_two & ~ac_test_mode   ));
   assign   l2t4_clk_stop   = tt_hold ? 1'b1 : l2t4_clk_stop_sync;
   assign   bnk5_clk_stop   = tt_hold ? 1'b1 : bnk5_clk_stop_q;
   assign   bnk5_clk_stop_q = (bnk5_clk_stop_sync  | (~bank_avail_hold[5] & wmr_two & ~ac_test_mode   ));
   assign   l2t5_clk_stop   = tt_hold ? 1'b1 : l2t5_clk_stop_sync;
   assign   bnk6_clk_stop   = tt_hold ? 1'b1 : bnk6_clk_stop_q;
   assign   bnk6_clk_stop_q = (bnk6_clk_stop_sync  | (~bank_avail_hold[6] & wmr_two & ~ac_test_mode   ));
   assign   l2t6_clk_stop   = tt_hold ? 1'b1 : l2t6_clk_stop_sync;
   assign   bnk7_clk_stop   = tt_hold ? 1'b1 : bnk7_clk_stop_q;
   assign   bnk7_clk_stop_q = (bnk7_clk_stop_sync  | (~bank_avail_hold[7] & wmr_two & ~ac_test_mode   ));
   assign   l2t7_clk_stop   = tt_hold ? 1'b1 : l2t7_clk_stop_sync;

   assign   mcu0_clk_stop   = tt_hold ? 1'b1 : mcu0_clk_stop_q;
   assign   mcu0_clk_stop_q = (mcu0_clk_stop_sync  | (~mcu0_avail_hold    & wmr_two & ~ac_test_mode   ));
   assign   mcu1_clk_stop   = tt_hold ? 1'b1 : mcu1_clk_stop_q;
   assign   mcu1_clk_stop_q = (mcu1_clk_stop_sync  | (~mcu1_avail_hold    & wmr_two & ~ac_test_mode   ));
   assign   mcu2_clk_stop   = tt_hold ? 1'b1 : mcu2_clk_stop_q;
   assign   mcu2_clk_stop_q = (mcu2_clk_stop_sync  | (~mcu2_avail_hold    & wmr_two & ~ac_test_mode   ));
   assign   mcu3_clk_stop   = tt_hold ? 1'b1 : mcu3_clk_stop_q;
   assign   mcu3_clk_stop_q = (mcu3_clk_stop_sync  | (~mcu3_avail_hold    & wmr_two & ~ac_test_mode   ));

   // ******** sync spc0 clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc0_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc0_0_scanin),
     .scan_out(sync_ff_clk_stop_spc0_0_scanout),
     .din      (~spc0_clk_stop_presync),
     .dout     (spc0_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc0_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc0_1_scanin),
     .scan_out(sync_ff_clk_stop_spc0_1_scanout),
     .din      (~spc0_clk_stop),
     .dout     (spc0_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc0_clk_stop_sync  =  ~spc0_clk_stop_sync_l;
   assign   spc0_stopped        =  ~spc0_stopped_l;
   // ******** sync spc1 clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc1_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc1_0_scanin),
     .scan_out(sync_ff_clk_stop_spc1_0_scanout),
     .din      (~spc1_clk_stop_presync),
     .dout     (spc1_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc1_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc1_1_scanin),
     .scan_out(sync_ff_clk_stop_spc1_1_scanout),
     .din      (~spc1_clk_stop),
     .dout     (spc1_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc1_clk_stop_sync  =  ~spc1_clk_stop_sync_l;
   assign   spc1_stopped        =  ~spc1_stopped_l;
   // ******** sync spc2 clk stop *******************  
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc2_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc2_0_scanin),
     .scan_out(sync_ff_clk_stop_spc2_0_scanout),
     .din      (~spc2_clk_stop_presync),
     .dout     (spc2_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc2_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc2_1_scanin),
     .scan_out(sync_ff_clk_stop_spc2_1_scanout),
     .din      (~spc2_clk_stop),
     .dout     (spc2_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc2_clk_stop_sync  =  ~spc2_clk_stop_sync_l;
   assign   spc2_stopped        =  ~spc2_stopped_l;
   // ******** sync spc3_clk stop *******************   
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc3_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc3_0_scanin),
     .scan_out(sync_ff_clk_stop_spc3_0_scanout),
     .din      (~spc3_clk_stop_presync),
     .dout     (spc3_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc3_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc3_1_scanin),
     .scan_out(sync_ff_clk_stop_spc3_1_scanout),
     .din      (~spc3_clk_stop),
     .dout     (spc3_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc3_clk_stop_sync  =  ~spc3_clk_stop_sync_l;
   assign   spc3_stopped        =  ~spc3_stopped_l;
   // ******** sync spc4_clk stop *******************      
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc4_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc4_0_scanin),
     .scan_out(sync_ff_clk_stop_spc4_0_scanout),
     .din      (~spc4_clk_stop_presync),
     .dout     (spc4_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc4_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc4_1_scanin),
     .scan_out(sync_ff_clk_stop_spc4_1_scanout),
     .din      (~spc4_clk_stop),
     .dout     (spc4_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc4_clk_stop_sync  =  ~spc4_clk_stop_sync_l;
   assign   spc4_stopped        =  ~spc4_stopped_l;
   // ******** sync spc5_clk stop *******************         
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc5_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc5_0_scanin),
     .scan_out(sync_ff_clk_stop_spc5_0_scanout),
     .din      (~spc5_clk_stop_presync),
     .dout     (spc5_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc5_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc5_1_scanin),
     .scan_out(sync_ff_clk_stop_spc5_1_scanout),
     .din      (~spc5_clk_stop),
     .dout     (spc5_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc5_clk_stop_sync  =  ~spc5_clk_stop_sync_l;
   assign   spc5_stopped        =  ~spc5_stopped_l;
   // ******** sync spc6_clk stop *******************         
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc6_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc6_0_scanin),
     .scan_out(sync_ff_clk_stop_spc6_0_scanout),
     .din      (~spc6_clk_stop_presync),
     .dout     (spc6_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc6_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc6_1_scanin),
     .scan_out(sync_ff_clk_stop_spc6_1_scanout),
     .din      (~spc6_clk_stop),
     .dout     (spc6_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc6_clk_stop_sync  =  ~spc6_clk_stop_sync_l;
   assign   spc6_stopped        =  ~spc6_stopped_l;
   // ******** sync spc7_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc7_0 
   ( 
     .scan_in(sync_ff_clk_stop_spc7_0_scanin),
     .scan_out(sync_ff_clk_stop_spc7_0_scanout),
     .din      (~spc7_clk_stop_presync),
     .dout     (spc7_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_spc7_1  
   ( 
     .scan_in(sync_ff_clk_stop_spc7_1_scanin),
     .scan_out(sync_ff_clk_stop_spc7_1_scanout),
     .din      (~spc7_clk_stop),
     .dout     (spc7_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   spc7_clk_stop_sync  =  ~spc7_clk_stop_sync_l;
   assign   spc7_stopped        =  ~spc7_stopped_l;
   // ******** sync bnk0_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk0_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk0_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk0_0_scanout),
     .din      (~bnk0_clk_stop_presync),
     .dout     (bnk0_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk0_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk0_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk0_1_scanout),
     .din      (~bnk0_clk_stop),
     .dout     (bnk0_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk0_clk_stop_sync  =  ~bnk0_clk_stop_sync_l;
   assign   bnk0_stopped        =  ~bnk0_stopped_l;
   // ******** sync l2t0_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t0_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t0_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t0_0_scanout),
     .din      (~l2t0_clk_stop_presync),
     .dout     (l2t0_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t0_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t0_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t0_1_scanout),
     .din      (~l2t0_clk_stop),
     .dout     (l2t0_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t0_clk_stop_sync  =  ~l2t0_clk_stop_sync_l;
   assign   l2t0_stopped        =  ~l2t0_stopped_l;
   // ******** sync bnk1_clk stop *******************    
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk1_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk1_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk1_0_scanout),
     .din      (~bnk1_clk_stop_presync),
     .dout     (bnk1_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk1_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk1_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk1_1_scanout),
     .din      (~bnk1_clk_stop),
     .dout     (bnk1_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk1_clk_stop_sync  =  ~bnk1_clk_stop_sync_l;
   assign   bnk1_stopped        =  ~bnk1_stopped_l;
   // ******** sync l2t1_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t1_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t1_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t1_0_scanout),
     .din      (~l2t1_clk_stop_presync),
     .dout     (l2t1_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t1_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t1_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t1_1_scanout),
     .din      (~l2t1_clk_stop),
     .dout     (l2t1_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t1_clk_stop_sync  =  ~l2t1_clk_stop_sync_l;
   assign   l2t1_stopped        =  ~l2t1_stopped_l;
   // ******** sync bnk2_clk stop *******************    
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk2_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk2_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk2_0_scanout),
     .din      (~bnk2_clk_stop_presync),
     .dout     (bnk2_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk2_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk2_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk2_1_scanout),
     .din      (~bnk2_clk_stop),
     .dout     (bnk2_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk2_clk_stop_sync  =  ~bnk2_clk_stop_sync_l;
   assign   bnk2_stopped        =  ~bnk2_stopped_l;
   // ******** sync l2t2_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t2_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t2_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t2_0_scanout),
     .din      (~l2t2_clk_stop_presync),
     .dout     (l2t2_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t2_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t2_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t2_1_scanout),
     .din      (~l2t2_clk_stop),
     .dout     (l2t2_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t2_clk_stop_sync  =  ~l2t2_clk_stop_sync_l;
   assign   l2t2_stopped        =  ~l2t2_stopped_l;
   // ******** sync bnk3_clk stop *******************    
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk3_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk3_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk3_0_scanout),
     .din      (~bnk3_clk_stop_presync),
     .dout     (bnk3_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk3_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk3_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk3_1_scanout),
     .din      (~bnk3_clk_stop),
     .dout     (bnk3_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk3_clk_stop_sync  =  ~bnk3_clk_stop_sync_l;
   assign   bnk3_stopped        =  ~bnk3_stopped_l;
   // ******** sync l2t3_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t3_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t3_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t3_0_scanout),
     .din      (~l2t3_clk_stop_presync),
     .dout     (l2t3_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t3_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t3_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t3_1_scanout),
     .din      (~l2t3_clk_stop),
     .dout     (l2t3_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t3_clk_stop_sync  =  ~l2t3_clk_stop_sync_l;
   assign   l2t3_stopped        =  ~l2t3_stopped_l;
   // ******** sync bnk4_clk stop *******************    
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk4_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk4_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk4_0_scanout),
     .din      (~bnk4_clk_stop_presync),
     .dout     (bnk4_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk4_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk4_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk4_1_scanout),
     .din      (~bnk4_clk_stop),
     .dout     (bnk4_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk4_clk_stop_sync  =  ~bnk4_clk_stop_sync_l;
   assign   bnk4_stopped        =  ~bnk4_stopped_l;
   // ******** sync l2t4_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t4_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t4_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t4_0_scanout),
     .din      (~l2t4_clk_stop_presync),
     .dout     (l2t4_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t4_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t4_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t4_1_scanout),
     .din      (~l2t4_clk_stop),
     .dout     (l2t4_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t4_clk_stop_sync  =  ~l2t4_clk_stop_sync_l;
   assign   l2t4_stopped        =  ~l2t4_stopped_l;
   // ******** sync bnk5_clk stop *******************    
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk5_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk5_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk5_0_scanout),
     .din      (~bnk5_clk_stop_presync),
     .dout     (bnk5_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk5_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk5_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk5_1_scanout),
     .din      (~bnk5_clk_stop),
     .dout     (bnk5_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk5_clk_stop_sync  =  ~bnk5_clk_stop_sync_l;
   assign   bnk5_stopped        =  ~bnk5_stopped_l;
   // ******** sync l2t5_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t5_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t5_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t5_0_scanout),
     .din      (~l2t5_clk_stop_presync),
     .dout     (l2t5_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t5_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t5_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t5_1_scanout),
     .din      (~l2t5_clk_stop),
     .dout     (l2t5_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t5_clk_stop_sync  =  ~l2t5_clk_stop_sync_l;
   assign   l2t5_stopped        =  ~l2t5_stopped_l;
   // ******** sync bnk6_clk stop *******************   
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk6_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk6_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk6_0_scanout),
     .din      (~bnk6_clk_stop_presync),
     .dout     (bnk6_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk6_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk6_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk6_1_scanout),
     .din      (~bnk6_clk_stop),
     .dout     (bnk6_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk6_clk_stop_sync  =  ~bnk6_clk_stop_sync_l;
   assign   bnk6_stopped        =  ~bnk6_stopped_l;
   // ******** sync l2t6_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t6_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t6_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t6_0_scanout),
     .din      (~l2t6_clk_stop_presync),
     .dout     (l2t6_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t6_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t6_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t6_1_scanout),
     .din      (~l2t6_clk_stop),
     .dout     (l2t6_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t6_clk_stop_sync  =  ~l2t6_clk_stop_sync_l;
   assign   l2t6_stopped        =  ~l2t6_stopped_l;
   // ******** sync bnk7_clk stop ******************* 
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk7_0 
   ( 
     .scan_in(sync_ff_clk_stop_bnk7_0_scanin),
     .scan_out(sync_ff_clk_stop_bnk7_0_scanout),
     .din      (~bnk7_clk_stop_presync),
     .dout     (bnk7_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_bnk7_1  
   ( 
     .scan_in(sync_ff_clk_stop_bnk7_1_scanin),
     .scan_out(sync_ff_clk_stop_bnk7_1_scanout),
     .din      (~bnk7_clk_stop),
     .dout     (bnk7_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   bnk7_clk_stop_sync  =  ~bnk7_clk_stop_sync_l;
   assign   bnk7_stopped        =  ~bnk7_stopped_l;
   // ******** sync l2t7_clk stop *******************        
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t7_0 
   ( 
     .scan_in(sync_ff_clk_stop_l2t7_0_scanin),
     .scan_out(sync_ff_clk_stop_l2t7_0_scanout),
     .din      (~l2t7_clk_stop_presync),
     .dout     (l2t7_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_l2t7_1  
   ( 
     .scan_in(sync_ff_clk_stop_l2t7_1_scanin),
     .scan_out(sync_ff_clk_stop_l2t7_1_scanout),
     .din      (~l2t7_clk_stop),
     .dout     (l2t7_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   assign   l2t7_clk_stop_sync  =  ~l2t7_clk_stop_sync_l;
   assign   l2t7_stopped        =  ~l2t7_stopped_l;
   // ******** sync mcu0_clk stop *******************   
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu0_0 
   ( 
     .scan_in(sync_ff_clk_stop_mcu0_0_scanin),
     .scan_out(sync_ff_clk_stop_mcu0_0_scanout),
     .din      (~mcu0_clk_stop_presync),
     .dout     (mcu0_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu0_1  
   ( 
     .scan_in(sync_ff_clk_stop_mcu0_1_scanin),
     .scan_out(sync_ff_clk_stop_mcu0_1_scanout),
     .din      (mcu0_cmp_clk_stop_l),
     .dout     (mcu0_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_mcu0_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_mcu0_1_scanin),
     .scan_out(sync_ff_ioclk_stop_mcu0_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (mcu0_io_clk_stop_l),
     .dout     (mcu0_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_drclk_stop_mcu0_1 //,en=1) 
   ( // dr clock domain
     .scan_in(sync_ff_drclk_stop_mcu0_1_scanin),
     .scan_out(sync_ff_drclk_stop_mcu0_1_scanout),
   //.en       (cmp_dr_sync_en_local),
     .din      (mcu0_dr_clk_stop_l),
     .dout     (mcu0_dr_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign   mcu0_cmp_clk_stop_l = ~( tt_cmp_mode | mcu0_clk_stop );
   assign   mcu0_io_clk_stop_l  = ~( tt_io_mode  | mcu0_clk_stop );
   assign   mcu0_dr_clk_stop_l  = ~( tt_dr_mode  | mcu0_clk_stop );
   
   assign   mcu0_clk_stop_sync  =  ~mcu0_clk_stop_sync_l;
   assign   mcu0_stopped        =  ~mcu0_stopped_l;
   assign   mcu0_io_stopped     =  ~mcu0_io_stopped_l;
   assign   mcu0_dr_stopped     =  ~mcu0_dr_stopped_l;
   assign   mcu0_stopped_tt     =  tt_io_clk ? mcu0_io_stopped : mcu0_stopped;
   // ******** sync mcu1_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu1_0 
   ( 
     .scan_in(sync_ff_clk_stop_mcu1_0_scanin),
     .scan_out(sync_ff_clk_stop_mcu1_0_scanout),
     .din      (~mcu1_clk_stop_presync),
     .dout     (mcu1_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu1_1  
   ( 
     .scan_in(sync_ff_clk_stop_mcu1_1_scanin),
     .scan_out(sync_ff_clk_stop_mcu1_1_scanout),
     .din      (mcu1_cmp_clk_stop_l),
     .dout     (mcu1_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_mcu1_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_mcu1_1_scanin),
     .scan_out(sync_ff_ioclk_stop_mcu1_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (mcu1_io_clk_stop_l),
     .dout     (mcu1_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_drclk_stop_mcu1_1 //,en=1) 
   ( // dr clock domain
     .scan_in(sync_ff_drclk_stop_mcu1_1_scanin),
     .scan_out(sync_ff_drclk_stop_mcu1_1_scanout),
   //.en       (cmp_dr_sync_en_local),
     .din      (mcu1_dr_clk_stop_l),
     .dout     (mcu1_dr_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   
   assign   mcu1_cmp_clk_stop_l = ~( tt_cmp_mode | mcu1_clk_stop );
   assign   mcu1_io_clk_stop_l  = ~( tt_io_mode  | mcu1_clk_stop );
   assign   mcu1_dr_clk_stop_l  = ~( tt_dr_mode  | mcu1_clk_stop );
   
   assign   mcu1_clk_stop_sync  =  ~mcu1_clk_stop_sync_l;
   assign   mcu1_stopped        =  ~mcu1_stopped_l;
   assign   mcu1_io_stopped     =  ~mcu1_io_stopped_l;
   assign   mcu1_dr_stopped     =  ~mcu1_dr_stopped_l;
   assign   mcu1_stopped_tt     =  tt_io_clk ? mcu1_io_stopped : mcu1_stopped;
   // ******** sync mcu2_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu2_0 
   ( 
     .scan_in(sync_ff_clk_stop_mcu2_0_scanin),
     .scan_out(sync_ff_clk_stop_mcu2_0_scanout),
     .din      (~mcu2_clk_stop_presync),
     .dout     (mcu2_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu2_1  
   ( 
     .scan_in(sync_ff_clk_stop_mcu2_1_scanin),
     .scan_out(sync_ff_clk_stop_mcu2_1_scanout),
     .din      (mcu2_cmp_clk_stop_l),
     .dout     (mcu2_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_mcu2_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_mcu2_1_scanin),
     .scan_out(sync_ff_ioclk_stop_mcu2_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (mcu2_io_clk_stop_l),
     .dout     (mcu2_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_drclk_stop_mcu2_1 //,en=1) 
   ( // dr clock domain
     .scan_in(sync_ff_drclk_stop_mcu2_1_scanin),
     .scan_out(sync_ff_drclk_stop_mcu2_1_scanout),
   //.en       (cmp_dr_sync_en_local),
     .din      (mcu2_dr_clk_stop_l),
     .dout     (mcu2_dr_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   
   assign   mcu2_cmp_clk_stop_l = ~( tt_cmp_mode | mcu2_clk_stop );
   assign   mcu2_io_clk_stop_l  = ~( tt_io_mode  | mcu2_clk_stop );
   assign   mcu2_dr_clk_stop_l  = ~( tt_dr_mode  | mcu2_clk_stop );
   
   assign   mcu2_clk_stop_sync  =  ~mcu2_clk_stop_sync_l;
   assign   mcu2_stopped        =  ~mcu2_stopped_l;
   assign   mcu2_io_stopped     =  ~mcu2_io_stopped_l;
   assign   mcu2_dr_stopped     =  ~mcu2_dr_stopped_l;
   assign   mcu2_stopped_tt     =  tt_io_clk ? mcu2_io_stopped : mcu2_stopped;
   // ******** sync mcu3_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu3_0 
   ( 
     .scan_in(sync_ff_clk_stop_mcu3_0_scanin),
     .scan_out(sync_ff_clk_stop_mcu3_0_scanout),
     .din      (~mcu3_clk_stop_presync),
     .dout     (mcu3_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_mcu3_1  
   ( 
     .scan_in(sync_ff_clk_stop_mcu3_1_scanin),
     .scan_out(sync_ff_clk_stop_mcu3_1_scanout),
     .din      (mcu3_cmp_clk_stop_l),
     .dout     (mcu3_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_mcu3_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_mcu3_1_scanin),
     .scan_out(sync_ff_ioclk_stop_mcu3_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (mcu3_io_clk_stop_l),
     .dout     (mcu3_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_drclk_stop_mcu3_1 //,en=1) 
   ( // dr clock domain
     .scan_in(sync_ff_drclk_stop_mcu3_1_scanin),
     .scan_out(sync_ff_drclk_stop_mcu3_1_scanout),
   //.en       (cmp_dr_sync_en_local),
     .din      (mcu3_dr_clk_stop_l),
     .dout     (mcu3_dr_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   
   assign   mcu3_cmp_clk_stop_l = ~( tt_cmp_mode | mcu3_clk_stop );
   assign   mcu3_io_clk_stop_l  = ~( tt_io_mode  | mcu3_clk_stop );
   assign   mcu3_dr_clk_stop_l  = ~( tt_dr_mode  | mcu3_clk_stop );
   
   assign   mcu3_clk_stop_sync  =  ~mcu3_clk_stop_sync_l;
   assign   mcu3_stopped        =  ~mcu3_stopped_l;
   assign   mcu3_io_stopped     =  ~mcu3_io_stopped_l;
   assign   mcu3_dr_stopped     =  ~mcu3_dr_stopped_l;
   assign   mcu3_stopped_tt     =  tt_io_clk ? mcu3_io_stopped : mcu3_stopped;
   // ******** sync soc0_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc0_0 
   ( 
     .scan_in(sync_ff_clk_stop_soc0_0_scanin),
     .scan_out(sync_ff_clk_stop_soc0_0_scanout),
     .din      (~soc0_clk_stop_presync),
     .dout     (soc0_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   assign   soc0_clk_stop = tt_hold ? 1'b1 : soc0_clk_stop_sync;
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc0_1  
   ( 
     .scan_in(sync_ff_clk_stop_soc0_1_scanin),
     .scan_out(sync_ff_clk_stop_soc0_1_scanout),
     .din      (soc0_cmp_clk_stop_l),
     .dout     (soc0_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_soc0_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_soc0_1_scanin),
     .scan_out(sync_ff_ioclk_stop_soc0_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (soc0_io_clk_stop_l),
     .dout     (soc0_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   //msff_ctl_macro  sync_ff_drclk_stop_soc0_1 (width=1,en=1) 
   //( // dr clock domain
   //  .scan_in(sync_ff_drclk_stop_soc0_1_scanin),
   //  .scan_out(sync_ff_drclk_stop_soc0_1_scanout),
   //  .en       (cmp_dr_sync_en_local),
   //  .din      (~soc0_clk_stop),
   //  .dout     (soc0_dr_stopped_l),  
   //  .l1clk    (l1clk)); 
   
   assign   soc0_cmp_clk_stop_l = ~( tt_cmp_mode | soc0_clk_stop );
   assign   soc0_io_clk_stop_l  = ~( tt_io_mode  | soc0_clk_stop );
   
   assign   soc0_clk_stop_sync  =  ~soc0_clk_stop_sync_l;
   assign   soc0_stopped        =  ~soc0_stopped_l;
   assign   soc0_io_stopped     =  ~soc0_io_stopped_l;
   //assign   soc0_dr_stopped     =  ~soc0_dr_stopped_l;
   assign   soc0_stopped_tt     =  tt_io_clk ? soc0_io_stopped : soc0_stopped;
   // ******** sync soc1_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc1_0 
   ( 
     .scan_in(sync_ff_clk_stop_soc1_0_scanin),
     .scan_out(sync_ff_clk_stop_soc1_0_scanout),
     .din      (~soc1_clk_stop_presync),
     .dout     (soc1_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   assign   soc1_clk_stop = tt_hold ? 1'b1 : soc1_clk_stop_sync;
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_soc1_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_soc1_1_scanin),
     .scan_out(sync_ff_ioclk_stop_soc1_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (soc1_io_clk_stop_l),
     .dout     (soc1_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign   soc1_io_clk_stop_l  = ~( tt_io_mode  | soc1_clk_stop );
   
   assign   soc1_clk_stop_sync  =  ~soc1_clk_stop_sync_l;
   assign   soc1_io_stopped     =  ~soc1_io_stopped_l;
   //assign   soc1_stopped        =   soc1_io_stopped; 
   assign   soc1_stopped_tt     =  tt_io_clk ? soc1_io_stopped : 1'b1;
   // ******** sync soc2_clk stop *******************   
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc2_0 
   ( 
     .scan_in(sync_ff_clk_stop_soc2_0_scanin),
     .scan_out(sync_ff_clk_stop_soc2_0_scanout),
     .din      (~soc2_clk_stop_presync),
     .dout     (soc2_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   assign   soc2_clk_stop = tt_hold ? 1'b1 : soc2_clk_stop_sync;
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_soc2_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_soc2_1_scanin),
     .scan_out(sync_ff_ioclk_stop_soc2_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (soc2_io_clk_stop_l),
     .dout     (soc2_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign   soc2_io_clk_stop_l  = ~( tt_io_mode  | soc2_clk_stop );
   
   assign   soc2_clk_stop_sync  =  ~soc2_clk_stop_sync_l;
   assign   soc2_io_stopped     =  ~soc2_io_stopped_l;
   //assign   soc2_stopped        =   soc2_io_stopped;
   assign   soc2_stopped_tt     =  tt_io_clk ? soc2_io_stopped : 1'b1;
   // ******** sync soc3_clk stop *******************
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc3_0  
   ( 
     .scan_in(sync_ff_clk_stop_soc3_0_scanin),
     .scan_out(sync_ff_clk_stop_soc3_0_scanout),
     .din      (~soc3_clk_stop_presync),
     .dout     (soc3_clk_stop_sync_l),
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   assign   soc3_clk_stop = tt_hold ? 1'b1 : soc3_clk_stop_sync;
   tcu_sigmux_ctl_msff_ctl_macro__width_1  sync_ff_clk_stop_soc3_1  
   ( 
     .scan_in(sync_ff_clk_stop_soc3_1_scanin),
     .scan_out(sync_ff_clk_stop_soc3_1_scanout),
     .din      (soc3_cmp_clk_stop_l),
     .dout     (soc3_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  sync_ff_ioclk_stop_soc3_1  
   ( // io clock domain
     .scan_in(sync_ff_ioclk_stop_soc3_1_scanin),
     .scan_out(sync_ff_ioclk_stop_soc3_1_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (soc3_io_clk_stop_l),
     .dout     (soc3_io_stopped_l),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   
   assign   soc3_cmp_clk_stop_l = ~( tt_cmp_mode | soc3_clk_stop );
   assign   soc3_io_clk_stop_l  = ~( tt_io_mode  | soc3_clk_stop );
   
   assign   soc3_clk_stop_sync  =  ~soc3_clk_stop_sync_l;
   assign   soc3_stopped        =  ~soc3_stopped_l;
   assign   soc3_io_stopped     =  ~soc3_io_stopped_l;
   assign   soc3_stopped_tt     =  tt_io_clk ? soc3_io_stopped : soc3_stopped;
   

   // ********************************************************************
   // clock domain selection bit for transition test, to select between
   // cmp and io domains; set by scan
   // ********************************************************************
   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_ttclksel_reg 
   ( 
     .scan_in(tcusig_ttclksel_reg_scanin),
     .scan_out(tcusig_ttclksel_reg_scanout),
     .din      (tt_io_clk),
     .dout     (tt_io_clk),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk)); 
   
   // ********************************************************************
   //clk_stops going out of TCU; need to gate with core_available for cores
   //will have to have local clk stop for jtag mode and such
   // ********************************************************************
   //cores
   assign   pre_spc0_clk_stop    = spc0_stopped | clk_stop_ac_trans_counter_initiated | tap_spc0_mb_clk_stop_sync;
   assign   pre_spc1_clk_stop    = spc1_stopped | clk_stop_ac_trans_counter_initiated | tap_spc1_mb_clk_stop_sync;
   assign   pre_spc2_clk_stop    = spc2_stopped | clk_stop_ac_trans_counter_initiated | tap_spc2_mb_clk_stop_sync;
   assign   pre_spc3_clk_stop    = spc3_stopped | clk_stop_ac_trans_counter_initiated | tap_spc3_mb_clk_stop_sync;
   assign   pre_spc4_clk_stop    = spc4_stopped | clk_stop_ac_trans_counter_initiated | tap_spc4_mb_clk_stop_sync;
   assign   pre_spc5_clk_stop    = spc5_stopped | clk_stop_ac_trans_counter_initiated | tap_spc5_mb_clk_stop_sync;
   assign   pre_spc6_clk_stop    = spc6_stopped | clk_stop_ac_trans_counter_initiated | tap_spc6_mb_clk_stop_sync;
   assign   pre_spc7_clk_stop    = spc7_stopped | clk_stop_ac_trans_counter_initiated | tap_spc7_mb_clk_stop_sync;
   //soc clk_stops going out of TCU
   assign   pre_bnk0_clk_stop    = bnk0_stopped | clk_stop_ac_trans_counter_initiated | l2b0_mbist_clk_stop_sync;
   assign   pre_l2t0_clk_stop    = l2t0_stopped | clk_stop_ac_trans_counter_initiated | l2t0_mbist_clk_stop_sync;
   assign   pre_bnk1_clk_stop    = bnk1_stopped | clk_stop_ac_trans_counter_initiated | l2b1_mbist_clk_stop_sync;
   assign   pre_l2t1_clk_stop    = l2t1_stopped | clk_stop_ac_trans_counter_initiated | l2t1_mbist_clk_stop_sync;
   assign   pre_bnk2_clk_stop    = bnk2_stopped | clk_stop_ac_trans_counter_initiated | l2b2_mbist_clk_stop_sync;
   assign   pre_l2t2_clk_stop    = l2t2_stopped | clk_stop_ac_trans_counter_initiated | l2t2_mbist_clk_stop_sync;
   assign   pre_bnk3_clk_stop    = bnk3_stopped | clk_stop_ac_trans_counter_initiated | l2b3_mbist_clk_stop_sync;
   assign   pre_l2t3_clk_stop    = l2t3_stopped | clk_stop_ac_trans_counter_initiated | l2t3_mbist_clk_stop_sync;
   assign   pre_bnk4_clk_stop    = bnk4_stopped | clk_stop_ac_trans_counter_initiated | l2b4_mbist_clk_stop_sync;
   assign   pre_l2t4_clk_stop    = l2t4_stopped | clk_stop_ac_trans_counter_initiated | l2t4_mbist_clk_stop_sync;
   assign   pre_bnk5_clk_stop    = bnk5_stopped | clk_stop_ac_trans_counter_initiated | l2b5_mbist_clk_stop_sync;
   assign   pre_l2t5_clk_stop    = l2t5_stopped | clk_stop_ac_trans_counter_initiated | l2t5_mbist_clk_stop_sync;
   assign   pre_bnk6_clk_stop    = bnk6_stopped | clk_stop_ac_trans_counter_initiated | l2b6_mbist_clk_stop_sync;
   assign   pre_l2t6_clk_stop    = l2t6_stopped | clk_stop_ac_trans_counter_initiated | l2t6_mbist_clk_stop_sync;
   assign   pre_bnk7_clk_stop    = bnk7_stopped | clk_stop_ac_trans_counter_initiated | l2b7_mbist_clk_stop_sync;
   assign   pre_l2t7_clk_stop    = l2t7_stopped | clk_stop_ac_trans_counter_initiated | l2t7_mbist_clk_stop_sync;

   assign   pre_mcu0_clk_stop    = mcu0_stopped    | clk_stop_ac_trans_counter_initiated | mcu0_mbist_clk_stop_sync;
   assign   pre_mcu0_io_clk_stop = mcu0_io_stopped | clk_stop_ac_trans_counter_initiated | mcu0_mbist_clk_stop_sync;
   assign   pre_mcu0_dr_clk_stop = mcu0_dr_stopped | clk_stop_ac_trans_counter_initiated | mcu0_mbist_clk_stop_sync;
   assign   pre_mcu0_fbd_clk_stop = (mcu0_io_stopped  & ~ac_test_mode & (por_one | por_two | ~mcu0_avail_hold | ~l2bnk_avail[0] | ~l2bnk_avail[1]))
                                  | (pre_mcu0_io_clk_stop  &  ac_test_mode);
   
   assign   pre_mcu1_clk_stop    = mcu1_stopped    | clk_stop_ac_trans_counter_initiated | mcu1_mbist_clk_stop_sync;
   assign   pre_mcu1_io_clk_stop = mcu1_io_stopped | clk_stop_ac_trans_counter_initiated | mcu1_mbist_clk_stop_sync;
   assign   pre_mcu1_dr_clk_stop = mcu1_dr_stopped | clk_stop_ac_trans_counter_initiated | mcu1_mbist_clk_stop_sync;
   assign   pre_mcu1_fbd_clk_stop = (mcu1_io_stopped  & ~ac_test_mode & (por_one | por_two | ~mcu1_avail_hold | ~l2bnk_avail[2] | ~l2bnk_avail[3]))
                                  | (pre_mcu1_io_clk_stop  &  ac_test_mode);
   
   assign   pre_mcu2_clk_stop    = mcu2_stopped    | clk_stop_ac_trans_counter_initiated | mcu2_mbist_clk_stop_sync;
   assign   pre_mcu2_io_clk_stop = mcu2_io_stopped | clk_stop_ac_trans_counter_initiated | mcu2_mbist_clk_stop_sync;
   assign   pre_mcu2_dr_clk_stop = mcu2_dr_stopped | clk_stop_ac_trans_counter_initiated | mcu2_mbist_clk_stop_sync;
   assign   pre_mcu2_fbd_clk_stop = (mcu2_io_stopped  & ~ac_test_mode & (por_one | por_two | ~mcu2_avail_hold | ~l2bnk_avail[4] | ~l2bnk_avail[5]))
                                  | (pre_mcu2_io_clk_stop  &  ac_test_mode);
 
   assign   pre_mcu3_clk_stop    = mcu3_stopped    | clk_stop_ac_trans_counter_initiated | mcu3_mbist_clk_stop_sync;
   assign   pre_mcu3_io_clk_stop = mcu3_io_stopped | clk_stop_ac_trans_counter_initiated | mcu3_mbist_clk_stop_sync;
   assign   pre_mcu3_dr_clk_stop = mcu3_dr_stopped | clk_stop_ac_trans_counter_initiated | mcu3_mbist_clk_stop_sync;
   assign   pre_mcu3_fbd_clk_stop = (mcu3_io_stopped  & ~ac_test_mode & (por_one | por_two | ~mcu3_avail_hold | ~l2bnk_avail[6] | ~l2bnk_avail[7]))
                                  | (pre_mcu3_io_clk_stop  &  ac_test_mode);
   
   assign   pre_soc0_clk_stop    = soc0_stopped    | clk_stop_ac_trans_counter_initiated | soc0_mbist_clk_stop_sync;
   assign   pre_soc0_io_clk_stop = soc0_io_stopped | clk_stop_ac_trans_counter_initiated | soc0_mbist_clk_stop_sync;
   
   assign   pre_soc1_io_clk_stop =(soc1_io_stopped & asic_stop_en) | clk_stop_ac_trans_counter_initiated | asic_por_stop |
                                   rdp_mbist_clk_stop_sync | rtx_mbist_clk_stop_sync | tds_mbist_clk_stop_sync;
   assign   pre_soc2_io_clk_stop =(soc2_io_stopped & asic_stop_en) | clk_stop_ac_trans_counter_initiated | dmu_mbist_clk_stop_sync | asic_por_stop;
   assign   pre_soc3_clk_stop    =(soc3_stopped    & asic_stop_en) | clk_stop_ac_trans_counter_initiated | peu_mbist_clk_stop_sync | asic_por_stop;
   assign   pre_soc3_io_clk_stop =(soc3_io_stopped & asic_stop_en) | clk_stop_ac_trans_counter_initiated | peu_mbist_clk_stop_sync | asic_por_stop;



   
   // ********************************************************************
   // MBIST Scan Chain Multiplexing
   // ********************************************************************
   // When test_mode=1, put mbist scan chain into core scan chain
   // else, put it between tdi and tdo
   assign   spc0_mb_scan_out = io_test_mode ? pre_tcu_spc0_scan_out[0]
                                 : (~flush_drive_0 & tap_spc0_mb_scan_out);
   assign   spc0_tap_mb_scan_in  = spc0_tcu_mbist_scan_in;
   assign   tcu_spc0_scan_out[0] = io_test_mode ? spc0_tcu_mbist_scan_in : ser_scan_spc0_ch0;
   assign   tcu_spc0_mb_scan_out = jt_scan ? jt_scan_in : spc0_mb_scan_out;   
	assign   tcu_spc_lbist_scan_in[0] = (io_test_mode || jt_scan) ? spc0_tcu_scan_in[0] : 1'b0;

   assign   spc1_mb_scan_out = io_test_mode ? pre_tcu_spc1_scan_out[0]
                                 : (~flush_drive_0 & tap_spc1_mb_scan_out);
   assign   spc1_tap_mb_scan_in  = spc1_tcu_mbist_scan_in;
   assign   tcu_spc1_scan_out[0] = io_test_mode ? spc1_tcu_mbist_scan_in : ser_scan_spc1_ch0;
   assign   tcu_spc1_mb_scan_out = jt_scan ? byp_spc0_ch1_so : spc1_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[1] = (io_test_mode || jt_scan) ? spc1_tcu_scan_in[0] : 1'b0;

   assign   spc2_mb_scan_out = io_test_mode ? pre_tcu_spc2_scan_out[0]
                                 : (~flush_drive_0 & tap_spc2_mb_scan_out);
   assign   spc2_tap_mb_scan_in  = spc2_tcu_mbist_scan_in;
   assign   tcu_spc2_scan_out[0] = io_test_mode ? spc2_tcu_mbist_scan_in : ser_scan_spc2_ch0;
   assign   tcu_spc2_mb_scan_out = jt_scan ? byp_spc1_ch1_so : spc2_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[2] = (io_test_mode || jt_scan) ? spc2_tcu_scan_in[0] : 1'b0;

   assign   spc3_mb_scan_out = io_test_mode ? pre_tcu_spc3_scan_out[0]
                                 : (~flush_drive_0 & tap_spc3_mb_scan_out);
   assign   spc3_tap_mb_scan_in  = spc3_tcu_mbist_scan_in;
   assign   tcu_spc3_scan_out[0] = io_test_mode ? spc3_tcu_mbist_scan_in : ser_scan_spc3_ch0;
   assign   tcu_spc3_mb_scan_out = jt_scan ? byp_spc2_ch1_so : spc3_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[3] = (io_test_mode || jt_scan) ? spc3_tcu_scan_in[0] : 1'b0;

   assign   spc4_mb_scan_out = io_test_mode ? pre_tcu_spc4_scan_out[0]
                                 : (~flush_drive_0 & tap_spc4_mb_scan_out);
   assign   spc4_tap_mb_scan_in  = spc4_tcu_mbist_scan_in;
   assign   tcu_spc4_scan_out[0] = io_test_mode ? spc4_tcu_mbist_scan_in : ser_scan_spc4_ch0;
   assign   tcu_spc4_mb_scan_out = jt_scan ? byp_spc3_ch1_so : spc4_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[4] = (io_test_mode || jt_scan) ? spc4_tcu_scan_in[0] : 1'b0;

   assign   spc5_mb_scan_out = io_test_mode ? pre_tcu_spc5_scan_out[0]
                                 : (~flush_drive_0 & tap_spc5_mb_scan_out);
   assign   spc5_tap_mb_scan_in  = spc5_tcu_mbist_scan_in;
   assign   tcu_spc5_scan_out[0] = io_test_mode ? spc5_tcu_mbist_scan_in : ser_scan_spc5_ch0;
   assign   tcu_spc5_mb_scan_out = jt_scan ? byp_spc4_ch1_so : spc5_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[5] = (io_test_mode || jt_scan) ? spc5_tcu_scan_in[0] : 1'b0;

   assign   spc6_mb_scan_out = io_test_mode ? pre_tcu_spc6_scan_out[0]
                                 : (~flush_drive_0 & tap_spc6_mb_scan_out);
   assign   spc6_tap_mb_scan_in  = spc6_tcu_mbist_scan_in;
   assign   tcu_spc6_scan_out[0] = io_test_mode ? spc6_tcu_mbist_scan_in : ser_scan_spc6_ch0;
   assign   tcu_spc6_mb_scan_out = jt_scan ? byp_spc5_ch1_so : spc6_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[6] = (io_test_mode || jt_scan) ? spc6_tcu_scan_in[0] : 1'b0;

   assign   spc7_mb_scan_out = io_test_mode ? pre_tcu_spc7_scan_out[0]
                                 : (~flush_drive_0 & tap_spc7_mb_scan_out);
   assign   spc7_tap_mb_scan_in  = spc7_tcu_mbist_scan_in;
   assign   tcu_spc7_scan_out[0] = io_test_mode ? spc7_tcu_mbist_scan_in : ser_scan_spc7_ch0;
   assign   tcu_spc7_mb_scan_out = jt_scan ? byp_spc6_ch1_so : spc7_mb_scan_out;
	assign   tcu_spc_lbist_scan_in[7] = (io_test_mode || jt_scan) ? spc7_tcu_scan_in[0] : 1'b0;

   assign not_flush_and_io_tdi = !flush_drive_0 && io_tdi;

   assign tcu_sii_mbist_scan_in = (io_test_mode || jt_scan) ? ncu_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_sio_mbist_scan_in = (io_test_mode || jt_scan) ? sii_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_ncu_mbist_scan_in = (io_test_mode || jt_scan) ? socg_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_mcu0_mbist_scan_in = (io_test_mode || jt_scan) ? socc_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_mcu1_mbist_scan_in = (io_test_mode || jt_scan) ? mcu0_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_mcu2_mbist_scan_in = (io_test_mode || jt_scan) ? mcu1_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_mcu3_mbist_scan_in = (io_test_mode || jt_scan) ? mcu2_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b0_mbist_scan_in = (io_test_mode || jt_scan) ? soch_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_l2b1_mbist_scan_in = (io_test_mode || jt_scan) ? l2b0_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b2_mbist_scan_in = (io_test_mode || jt_scan) ? l2b1_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b3_mbist_scan_in = (io_test_mode || jt_scan) ? l2b2_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b4_mbist_scan_in = (io_test_mode || jt_scan) ? l2b3_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b5_mbist_scan_in = (io_test_mode || jt_scan) ? l2b4_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b6_mbist_scan_in = (io_test_mode || jt_scan) ? l2b5_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2b7_mbist_scan_in = (io_test_mode || jt_scan) ? l2b6_tcu_mbist_scan_out : not_flush_and_io_tdi;

   assign tcu_l2t0_mbist_scan_in = (io_test_mode || jt_scan) ? soc0_tcu_scan_in : not_flush_and_io_tdi;
	assign tcu_l2t1_mbist_scan_in = (io_test_mode || jt_scan) ? l2t0_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2t2_mbist_scan_in = (io_test_mode || jt_scan) ? soc1_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_l2t3_mbist_scan_in = (io_test_mode || jt_scan) ? l2t2_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2t4_mbist_scan_in = (io_test_mode || jt_scan) ? soc2_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_l2t5_mbist_scan_in = (io_test_mode || jt_scan) ? l2t4_tcu_mbist_scan_out : not_flush_and_io_tdi;
   assign tcu_l2t6_mbist_scan_in = (io_test_mode || jt_scan) ? soc3_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_l2t7_mbist_scan_in = (io_test_mode || jt_scan) ? l2t6_tcu_mbist_scan_out : not_flush_and_io_tdi;

   assign tcu_l2t0_shscan_scan_in = (io_test_mode || jt_scan) ? l2t1_tcu_mbist_scan_out : not_flush_and_io_tdi;
	assign tcu_l2t1_shscan_scan_in = l2t0_tcu_shscan_scan_out;
   assign tcu_l2t2_shscan_scan_in = (io_test_mode || jt_scan) ? l2t3_tcu_mbist_scan_out : l2t1_tcu_shscan_scan_out;
   assign tcu_l2t3_shscan_scan_in = l2t2_tcu_shscan_scan_out;
   assign tcu_l2t4_shscan_scan_in = (io_test_mode || jt_scan) ? l2t5_tcu_mbist_scan_out : l2t3_tcu_shscan_scan_out;
   assign tcu_l2t5_shscan_scan_in = l2t4_tcu_shscan_scan_out;
   assign tcu_l2t6_shscan_scan_in = (io_test_mode || jt_scan) ? l2t7_tcu_mbist_scan_out : l2t5_tcu_shscan_scan_out;
   assign tcu_l2t7_shscan_scan_in = l2t6_tcu_shscan_scan_out;

   assign tcu_dmu_mbist_scan_in = (io_test_mode || jt_scan) ? socd_tcu_scan_in : not_flush_and_io_tdi;
   assign tcu_peu_mbist_scan_in = (io_test_mode || jt_scan) ? soc6_tcu_scan_in :not_flush_and_io_tdi;
   assign rdp_rdmc_mbist_scan_in = (io_test_mode || jt_scan) ? soce_tcu_scan_in : not_flush_and_io_tdi;
   assign rtx_mbist_scan_in = (io_test_mode || jt_scan) ? socf_tcu_scan_in : not_flush_and_io_tdi;
   assign tds_mbist_scan_in = (io_test_mode || jt_scan) ? soc4_tcu_scan_in : not_flush_and_io_tdi;

   
   // ********************************************************************
   // SHSCAN Scan Chain Multiplexing
   // ********************************************************************
   // When test_mode=1, put SHSCAN scan chain into core scan chain
   // else, put it between tdi and tdo
   // - only cores at this time, add SOC later
   // - need to put in actual logic later

   assign   spc0_shscan_scan_out = io_test_mode ? pre_tcu_spc0_scan_out[1]
                                     : (~flush_drive_0 & tap_spc0_shscan_scan_out);
   assign   tcu_spc0_scan_out[1] = io_test_mode ? spc0_tcu_shscan_scan_in : ser_scan_spc0_ch1;
   assign   byp_spc0_tcu_shscan_scan_in = core_avail[0] ? spc0_tcu_shscan_scan_in
	      	                        : spc0_shscan_scan_out;
   assign   tcu_spc0_shscan_scan_out = jt_scan ? byp_spc0_ch0_so : spc0_shscan_scan_out;
   
   assign   spc1_shscan_scan_out = io_test_mode ? pre_tcu_spc1_scan_out[1]
                                     : (~flush_drive_0 & byp_spc0_tcu_shscan_scan_in);
   assign   tcu_spc1_scan_out[1] = io_test_mode ? spc1_tcu_shscan_scan_in : ser_scan_spc1_ch1;
   assign   byp_spc1_tcu_shscan_scan_in = core_avail[1] ? spc1_tcu_shscan_scan_in
	      	                        : spc1_shscan_scan_out;
   assign   tcu_spc1_shscan_scan_out = jt_scan ? byp_spc1_ch0_so : spc1_shscan_scan_out;

   assign   spc2_shscan_scan_out = io_test_mode ? pre_tcu_spc2_scan_out[1]
                                     : (~flush_drive_0 & byp_spc1_tcu_shscan_scan_in);
   assign   tcu_spc2_scan_out[1] = io_test_mode ? spc2_tcu_shscan_scan_in : ser_scan_spc2_ch1;
   assign   byp_spc2_tcu_shscan_scan_in = core_avail[2] ? spc2_tcu_shscan_scan_in
	      	                        : spc2_shscan_scan_out;
   assign   tcu_spc2_shscan_scan_out = jt_scan ? byp_spc2_ch0_so : spc2_shscan_scan_out;

   assign   spc3_shscan_scan_out = io_test_mode ? pre_tcu_spc3_scan_out[1]
                                     : (~flush_drive_0 & byp_spc2_tcu_shscan_scan_in);
   assign   tcu_spc3_scan_out[1] = io_test_mode ? spc3_tcu_shscan_scan_in : ser_scan_spc3_ch1;
   assign   byp_spc3_tcu_shscan_scan_in = core_avail[3] ? spc3_tcu_shscan_scan_in
	      	                        : spc3_shscan_scan_out;
   assign   tcu_spc3_shscan_scan_out = jt_scan ? byp_spc3_ch0_so : spc3_shscan_scan_out;
   
   assign   spc4_shscan_scan_out = io_test_mode ? pre_tcu_spc4_scan_out[1]
                                     : (~flush_drive_0 & byp_spc3_tcu_shscan_scan_in);
   assign   tcu_spc4_scan_out[1] = io_test_mode ? spc4_tcu_shscan_scan_in : ser_scan_spc4_ch1;
   assign   byp_spc4_tcu_shscan_scan_in = core_avail[4] ? spc4_tcu_shscan_scan_in
	      	                        : spc4_shscan_scan_out;
   assign   tcu_spc4_shscan_scan_out = jt_scan ? byp_spc4_ch0_so : spc4_shscan_scan_out;

   assign   spc5_shscan_scan_out = io_test_mode ? pre_tcu_spc5_scan_out[1]
                                     : (~flush_drive_0 & byp_spc4_tcu_shscan_scan_in);
   assign   tcu_spc5_scan_out[1] = io_test_mode ? spc5_tcu_shscan_scan_in : ser_scan_spc5_ch1;
   assign   byp_spc5_tcu_shscan_scan_in = core_avail[5] ? spc5_tcu_shscan_scan_in
	      	                        : spc5_shscan_scan_out;
   assign   tcu_spc5_shscan_scan_out = jt_scan ? byp_spc5_ch0_so : spc5_shscan_scan_out;
   
   assign   spc6_shscan_scan_out = io_test_mode ? pre_tcu_spc6_scan_out[1]
                                     : (~flush_drive_0 & byp_spc5_tcu_shscan_scan_in);
   assign   tcu_spc6_scan_out[1] = io_test_mode ? spc6_tcu_shscan_scan_in : ser_scan_spc6_ch1;
   assign   byp_spc6_tcu_shscan_scan_in = core_avail[6] ? spc6_tcu_shscan_scan_in
	      	                        : spc6_shscan_scan_out;
   assign   tcu_spc6_shscan_scan_out = jt_scan ? byp_spc6_ch0_so : spc6_shscan_scan_out;

   assign   spc7_shscan_scan_out = io_test_mode ? pre_tcu_spc7_scan_out[1]
                                     : (~flush_drive_0 & byp_spc6_tcu_shscan_scan_in);
   assign   tcu_spc7_scan_out[1] = io_test_mode ? spc7_tcu_shscan_scan_in : ser_scan_spc7_ch1;
   assign   byp_spc7_tcu_shscan_scan_in = core_avail[7] ? spc7_tcu_shscan_scan_in
	      	                        : spc7_shscan_scan_out;
   assign   tcu_spc7_shscan_scan_out = jt_scan ? byp_spc7_ch0_so : spc7_shscan_scan_out;
   
   assign   spc7_tap_shscan_scan_in = byp_spc7_tcu_shscan_scan_in;

   // ********************************************************************
   // JTAG Serial Scan Chain Multiplexing - Concatenate all chains
   // ********************************************************************
   // When test_mode=1, turn off jt_scan mode
   // When jt_scan = 1, concatenate all chains
   // - only cores at this time, add SOC later
   
   assign   ser_scan_spc0_ch0 = jt_scan ? spc0_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc1_ch0 = jt_scan ? spc1_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc2_ch0 = jt_scan ? spc2_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc3_ch0 = jt_scan ? spc3_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc4_ch0 = jt_scan ? spc4_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc5_ch0 = jt_scan ? spc5_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc6_ch0 = jt_scan ? spc6_tcu_mbist_scan_in : 1'b0;
   assign   ser_scan_spc7_ch0 = jt_scan ? spc7_tcu_mbist_scan_in : 1'b0;
   
   
   assign   ser_scan_spc0_ch1 = jt_scan ? spc0_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc1_ch1 = jt_scan ? spc1_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc2_ch1 = jt_scan ? spc2_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc3_ch1 = jt_scan ? spc3_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc4_ch1 = jt_scan ? spc4_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc5_ch1 = jt_scan ? spc5_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc6_ch1 = jt_scan ? spc6_tcu_shscan_scan_in : 1'b0;
   assign   ser_scan_spc7_ch1 = jt_scan ? spc7_tcu_shscan_scan_in : 1'b0;
   
   
   //assign   tcu_spc0_scan_out[2] = jt_scan ? byp_spc0_ch1_so : pre_tcu_spc0_scan_out[2];
   //assign   tcu_spc1_scan_out[2] = jt_scan ? byp_spc1_ch1_so : pre_tcu_spc1_scan_out[2];
   //assign   tcu_spc2_scan_out[2] = jt_scan ? byp_spc2_ch1_so : pre_tcu_spc2_scan_out[2];
   //assign   tcu_spc3_scan_out[2] = jt_scan ? byp_spc3_ch1_so : pre_tcu_spc3_scan_out[2];
   //assign   tcu_spc4_scan_out[2] = jt_scan ? byp_spc4_ch1_so : pre_tcu_spc4_scan_out[2];
   //assign   tcu_spc5_scan_out[2] = jt_scan ? byp_spc5_ch1_so : pre_tcu_spc5_scan_out[2];
   //assign   tcu_spc6_scan_out[2] = jt_scan ? byp_spc6_ch1_so : pre_tcu_spc6_scan_out[2];
   //assign   tcu_spc7_scan_out[2] = jt_scan ? byp_spc7_ch1_so : pre_tcu_spc7_scan_out[2];

   assign   tcu_soca_scan_out = jt_scan ? byp_spc7_ch1_so : pre_tcu_soca_scan_out;
   assign   tcu_socb_scan_out = jt_scan ? byp_soca_so     : pre_tcu_socb_scan_out;
   assign   tcu_socc_scan_out = jt_scan ? byp_socb_so     : pre_tcu_socc_scan_out;
   assign   tcu_socd_scan_out = jt_scan ? byp_socc_so     : pre_tcu_socd_scan_out;
   assign   tcu_soce_scan_out = jt_scan ? byp_socd_so     : pre_tcu_soce_scan_out;
   assign   tcu_socf_scan_out = jt_scan ? byp_soce_so     : pre_tcu_socf_scan_out;
   assign   tcu_socg_scan_out = jt_scan ? byp_socf_so     : pre_tcu_socg_scan_out;
   assign   tcu_soch_scan_out = jt_scan ? byp_socg_so     : pre_tcu_soch_scan_out;
   
   assign   tcu_soc0_scan_out = jt_scan ? byp_soch_so     : pre_tcu_soc0_scan_out;
   assign   tcu_soc1_scan_out = jt_scan ? byp_soc0_so     : pre_tcu_soc1_scan_out;
   assign   tcu_soc2_scan_out = jt_scan ? byp_soc1_so     : pre_tcu_soc2_scan_out;
   assign   tcu_soc3_scan_out = jt_scan ? byp_soc2_so     : pre_tcu_soc3_scan_out;
   assign   tcu_soc4_scan_out = jt_scan ? byp_soc3_so     : pre_tcu_soc4_scan_out;
   assign   tcu_soc5_scan_out = jt_scan ? byp_soc4_so     : pre_tcu_soc5_scan_out;
   assign   tcu_soc6_scan_out = jt_scan ? byp_soc5_so     : pre_tcu_soc6_scan_out;
   //assign   tcu_srdes_scan_out = jt_scan ? byp_soc6_so   : pre_tcu_srdes_scan_out;
   

   // bypass chains
   // bypass all but the selected chain
   assign   sel_spc0_chains = ((sel_chain[4:0] == 5'b00000)|(sel_chain[4:0] == 5'b00001));
   assign   sel_spc1_chains = ((sel_chain[4:0] == 5'b00010)|(sel_chain[4:0] == 5'b00011));
   assign   sel_spc2_chains = ((sel_chain[4:0] == 5'b00100)|(sel_chain[4:0] == 5'b00101));
   assign   sel_spc3_chains = ((sel_chain[4:0] == 5'b00110)|(sel_chain[4:0] == 5'b00111));
   assign   sel_spc4_chains = ((sel_chain[4:0] == 5'b01000)|(sel_chain[4:0] == 5'b01001));
   assign   sel_spc5_chains = ((sel_chain[4:0] == 5'b01010)|(sel_chain[4:0] == 5'b01011));
   assign   sel_spc6_chains = ((sel_chain[4:0] == 5'b01100)|(sel_chain[4:0] == 5'b01101));
   assign   sel_spc7_chains = ((sel_chain[4:0] == 5'b01110)|(sel_chain[4:0] == 5'b01111));

   assign   byp_spc0_ch0 = chain_select & ~sel_spc0_chains; //~(sel_chain[4:0] == 5'b00000);
   assign   byp_spc0_ch1 = chain_select & ~sel_spc0_chains; //~(sel_chain[4:0] == 5'b00001);
   //assign   byp_spc0_ch2 = chain_select & ~sel_spc0_chains; //~(sel_chain[4:0] == 5'b00010);
   assign   byp_spc1_ch0 = chain_select & ~sel_spc1_chains; //~(sel_chain[4:0] == 5'b00011);
   assign   byp_spc1_ch1 = chain_select & ~sel_spc1_chains; //~(sel_chain[4:0] == 5'b00100);
   //assign   byp_spc1_ch2 = chain_select & ~sel_spc1_chains; //~(sel_chain[4:0] == 5'b00101);
   assign   byp_spc2_ch0 = chain_select & ~sel_spc2_chains; //~(sel_chain[4:0] == 5'b00110);
   assign   byp_spc2_ch1 = chain_select & ~sel_spc2_chains; //~(sel_chain[4:0] == 5'b00111);
   //assign   byp_spc2_ch2 = chain_select & ~sel_spc2_chains; //~(sel_chain[4:0] == 5'b01000);
   assign   byp_spc3_ch0 = chain_select & ~sel_spc3_chains; //~(sel_chain[4:0] == 5'b01001);
   assign   byp_spc3_ch1 = chain_select & ~sel_spc3_chains; //~(sel_chain[4:0] == 5'b01010);
   //assign   byp_spc3_ch2 = chain_select & ~sel_spc3_chains; //~(sel_chain[4:0] == 5'b01011);
   assign   byp_spc4_ch0 = chain_select & ~sel_spc4_chains; //~(sel_chain[4:0] == 5'b01100);
   assign   byp_spc4_ch1 = chain_select & ~sel_spc4_chains; //~(sel_chain[4:0] == 5'b01101);
   //assign   byp_spc4_ch2 = chain_select & ~sel_spc4_chains; //~(sel_chain[4:0] == 5'b01110);
   assign   byp_spc5_ch0 = chain_select & ~sel_spc5_chains; //~(sel_chain[4:0] == 5'b01111);
   assign   byp_spc5_ch1 = chain_select & ~sel_spc5_chains; //~(sel_chain[4:0] == 5'b10000);
   //assign   byp_spc5_ch2 = chain_select & ~sel_spc5_chains; //~(sel_chain[4:0] == 5'b10001);
   assign   byp_spc6_ch0 = chain_select & ~sel_spc6_chains; //~(sel_chain[4:0] == 5'b10010);
   assign   byp_spc6_ch1 = chain_select & ~sel_spc6_chains; //~(sel_chain[4:0] == 5'b10011);
   //assign   byp_spc6_ch2 = chain_select & ~sel_spc6_chains; //~(sel_chain[4:0] == 5'b10100);
   assign   byp_spc7_ch0 = chain_select & ~sel_spc7_chains; //~(sel_chain[4:0] == 5'b10101);
   assign   byp_spc7_ch1 = chain_select & ~sel_spc7_chains; //~(sel_chain[4:0] == 5'b10110);
   //assign   byp_spc7_ch2 = chain_select & ~sel_spc7_chains; //~(sel_chain[4:0] == 5'b10111);
   assign   byp_soca = chain_select & ~(sel_chain[4:0] == 5'b10000); // old chain 2 of spc0
   assign   byp_socb = chain_select & ~(sel_chain[4:0] == 5'b10001); // old chain 2 of spc1
   assign   byp_socc = chain_select & ~(sel_chain[4:0] == 5'b10010); // etc.
   assign   byp_socd = chain_select & ~(sel_chain[4:0] == 5'b10011);
   assign   byp_soce = chain_select & ~(sel_chain[4:0] == 5'b10100);
   assign   byp_socf = chain_select & ~(sel_chain[4:0] == 5'b10101);
   assign   byp_socg = chain_select & ~(sel_chain[4:0] == 5'b10110);
   assign   byp_soch = chain_select & ~(sel_chain[4:0] == 5'b10111);
   assign   byp_soc0 = chain_select & ~(sel_chain[4:0] == 5'b11000);
   assign   byp_soc1 = chain_select & ~(sel_chain[4:0] == 5'b11001);
   assign   byp_soc2 = chain_select & ~(sel_chain[4:0] == 5'b11010);
   assign   byp_soc3 = chain_select & ~(sel_chain[4:0] == 5'b11011);
   assign   byp_soc4 = chain_select & ~(sel_chain[4:0] == 5'b11100);
   assign   byp_soc5 = chain_select & ~(sel_chain[4:0] == 5'b11101);
   assign   byp_soc6 = chain_select & ~(sel_chain[4:0] == 5'b11110);

   //assign   byp_srdes = chain_select & ~(sel_chain[4:0] == 5'b11111);

   
   //assign   byp_spc0_ch0_so = byp_spc0_ch0 ? tcu_spc0_mb_scan_out     : spc0_tcu_scan_in[0];
   assign   byp_spc0_ch0_so = byp_spc0_ch0 ? tcu_spc0_mb_scan_out     : spc0_tcu_lbist_scan_out;
   assign   byp_spc0_ch1_so = byp_spc0_ch1 ? tcu_spc0_shscan_scan_out : spc0_tcu_scan_in[1];
   //assign   byp_spc0_ch2_so = byp_spc0_ch2 ? tcu_spc0_scan_out[2]     : spc0_tcu_scan_in[2];

   //assign   byp_spc1_ch0_so = byp_spc1_ch0 ? tcu_spc1_mb_scan_out     : spc1_tcu_scan_in[0];
   assign   byp_spc1_ch0_so = byp_spc1_ch0 ? tcu_spc1_mb_scan_out     : spc1_tcu_lbist_scan_out;
   assign   byp_spc1_ch1_so = byp_spc1_ch1 ? tcu_spc1_shscan_scan_out : spc1_tcu_scan_in[1];
   //assign   byp_spc1_ch2_so = byp_spc1_ch2 ? tcu_spc1_scan_out[2]     : spc1_tcu_scan_in[2]; 

   //assign   byp_spc2_ch0_so = byp_spc2_ch0 ? tcu_spc2_mb_scan_out     : spc2_tcu_scan_in[0];
   assign   byp_spc2_ch0_so = byp_spc2_ch0 ? tcu_spc2_mb_scan_out     : spc2_tcu_lbist_scan_out;
   assign   byp_spc2_ch1_so = byp_spc2_ch1 ? tcu_spc2_shscan_scan_out : spc2_tcu_scan_in[1];
   //assign   byp_spc2_ch2_so = byp_spc2_ch2 ? tcu_spc2_scan_out[2]     : spc2_tcu_scan_in[2];

   //assign   byp_spc3_ch0_so = byp_spc3_ch0 ? tcu_spc3_mb_scan_out     : spc3_tcu_scan_in[0];
   assign   byp_spc3_ch0_so = byp_spc3_ch0 ? tcu_spc3_mb_scan_out     : spc3_tcu_lbist_scan_out;
   assign   byp_spc3_ch1_so = byp_spc3_ch1 ? tcu_spc3_shscan_scan_out : spc3_tcu_scan_in[1];
   //assign   byp_spc3_ch2_so = byp_spc3_ch2 ? tcu_spc3_scan_out[2]     : spc3_tcu_scan_in[2]; 

   //assign   byp_spc4_ch0_so = byp_spc4_ch0 ? tcu_spc4_mb_scan_out     : spc4_tcu_scan_in[0];
   assign   byp_spc4_ch0_so = byp_spc4_ch0 ? tcu_spc4_mb_scan_out     : spc4_tcu_lbist_scan_out;
   assign   byp_spc4_ch1_so = byp_spc4_ch1 ? tcu_spc4_shscan_scan_out : spc4_tcu_scan_in[1];
   //assign   byp_spc4_ch2_so = byp_spc4_ch2 ? tcu_spc4_scan_out[2]     : spc4_tcu_scan_in[2];

   //assign   byp_spc5_ch0_so = byp_spc5_ch0 ? tcu_spc5_mb_scan_out     : spc5_tcu_scan_in[0];
   assign   byp_spc5_ch0_so = byp_spc5_ch0 ? tcu_spc5_mb_scan_out     : spc5_tcu_lbist_scan_out;
   assign   byp_spc5_ch1_so = byp_spc5_ch1 ? tcu_spc5_shscan_scan_out : spc5_tcu_scan_in[1];
   //assign   byp_spc5_ch2_so = byp_spc5_ch2 ? tcu_spc5_scan_out[2]     : spc5_tcu_scan_in[2]; 

   //assign   byp_spc6_ch0_so = byp_spc6_ch0 ? tcu_spc6_mb_scan_out     : spc6_tcu_scan_in[0];
   assign   byp_spc6_ch0_so = byp_spc6_ch0 ? tcu_spc6_mb_scan_out     : spc6_tcu_lbist_scan_out;
   assign   byp_spc6_ch1_so = byp_spc6_ch1 ? tcu_spc6_shscan_scan_out : spc6_tcu_scan_in[1];
   //assign   byp_spc6_ch2_so = byp_spc6_ch2 ? tcu_spc6_scan_out[2]     : spc6_tcu_scan_in[2];

   //assign   byp_spc7_ch0_so = byp_spc7_ch0 ? tcu_spc7_mb_scan_out     : spc7_tcu_scan_in[0];
   assign   byp_spc7_ch0_so = byp_spc7_ch0 ? tcu_spc7_mb_scan_out     : spc7_tcu_lbist_scan_out;
   assign   byp_spc7_ch1_so = byp_spc7_ch1 ? tcu_spc7_shscan_scan_out : spc7_tcu_scan_in[1];
   //assign   byp_spc7_ch2_so = byp_spc7_ch2 ? tcu_spc7_scan_out[2]     : spc7_tcu_scan_in[2]; 

   assign   byp_soca_so     = byp_soca ? tcu_soca_scan_out     : soca_tcu_scan_in;
   assign   byp_socb_so     = byp_socb ? tcu_socb_scan_out     : socb_tcu_scan_in;

   //assign   byp_socc_so     = byp_socc ? tcu_socc_scan_out     : socc_tcu_scan_in;
   //assign   byp_socd_so     = byp_socd ? tcu_socd_scan_out     : socd_tcu_scan_in;
   //assign   byp_soce_so     = byp_soce ? tcu_soce_scan_out     : soce_tcu_scan_in;
   //assign   byp_socf_so     = byp_socf ? tcu_socf_scan_out     : socf_tcu_scan_in;
   //assign   byp_socg_so     = byp_socg ? tcu_socg_scan_out     : socg_tcu_scan_in;
   //assign   byp_soch_so     = byp_soch ? tcu_soch_scan_out     : soch_tcu_scan_in;

   //assign   byp_soc0_so     = byp_soc0 ? tcu_soc0_scan_out     : soc0_tcu_scan_in;
   //assign   byp_soc1_so     = byp_soc1 ? tcu_soc1_scan_out     : soc1_tcu_scan_in;
   //assign   byp_soc2_so     = byp_soc2 ? tcu_soc2_scan_out     : soc2_tcu_scan_in;
   //assign   byp_soc3_so     = byp_soc3 ? tcu_soc3_scan_out     : soc3_tcu_scan_in;
   //assign   byp_soc4_so     = byp_soc4 ? tcu_soc4_scan_out     : soc4_tcu_scan_in;
   //assign   byp_soc5_so     = byp_soc5 ? tcu_soc5_scan_out     : soc5_tcu_scan_in;
   //assign   byp_soc6_so     = byp_soc6 ? tcu_soc6_scan_out     : soc6_tcu_scan_in;
   assign   byp_socc_so     = byp_socc ? tcu_socc_scan_out     : mcu3_tcu_mbist_scan_out;
   assign   byp_socd_so     = byp_socd ? tcu_socd_scan_out     : dmu_tcu_mbist_scan_out;
   assign   byp_soce_so     = byp_soce ? tcu_soce_scan_out     : rdp_rdmc_mbist_scan_out;
   assign   byp_socf_so     = byp_socf ? tcu_socf_scan_out     : rtx_mbist_scan_out;
   assign   byp_socg_so     = byp_socg ? tcu_socg_scan_out     : sio_tcu_mbist_scan_out;
   assign   byp_soch_so     = byp_soch ? tcu_soch_scan_out     : l2b7_tcu_mbist_scan_out;
   assign   byp_soc0_so     = byp_soc0 ? tcu_soc0_scan_out     : l2t1_tcu_shscan_scan_out;
   assign   byp_soc1_so     = byp_soc1 ? tcu_soc1_scan_out     : l2t3_tcu_shscan_scan_out;
   assign   byp_soc2_so     = byp_soc2 ? tcu_soc2_scan_out     : l2t5_tcu_shscan_scan_out;
   assign   byp_soc3_so     = byp_soc3 ? tcu_soc3_scan_out     : l2t7_tcu_shscan_scan_out;
   assign   byp_soc4_so     = byp_soc4 ? tcu_soc4_scan_out     : tds_mbist_scan_out;
   assign   byp_soc5_so     = byp_soc5 ? tcu_soc5_scan_out     : soc5_tcu_scan_in;
   assign   byp_soc6_so     = byp_soc6 ? tcu_soc6_scan_out     : miobscan_or_peu_scan;

   //assign   byp_srdes_so    = byp_srdes ? tcu_srdes_scan_out : srdes_tcu_scan_in;

   //assign   ser_scan_out = byp_srdes_so; // goes to jtag TDO for serial scan
   assign   ser_scan_out    = byp_soc6_so;
   
   // ********************************************************************
   // Scan Controls
   // io_test_mode ==> ATPG
   // jt_scan      ==> JTAG scan (no capture, load/unload only)
   // flush_mode   ==> Flush the scan chains (TCU only in POR1)
   // mt_mode      ==> MacroTest enable flop in jtag_ctl
   // lbist_mode   ==> Logic BIST; handled by lbist_ctl in SPC cores
   // tt_mode      ==> Transition Test (AC scan) - covered by io_test_mode
   // ********************************************************************
   assign   mt_mode     =  jtag_mt_enable;
   assign   jt_scan = jtag_ser_scan_q & ~io_test_mode;  // ECO yyyyyy
   assign   jt_scan_mtmode  = jt_scan &  mt_mode;
   
   assign   tcu_scan_en = 
	    io_test_mode ? pin_scan_en 
	    : jt_scan    ? (jt_scan_en & ~sel_only_spc_scan)
            : instr_mbist_diag ? soc_mbist_scan_en
	    : fm_scan_en;
   assign   tcu_int_se   = io_test_mode ? pin_scan_en : (~POR_ | (por_one & int_flush_d3)); 
   assign   tcu_int_nfse = io_test_mode ? pin_scan_en : 1'b0;
   //assign   tcu_int_frse = ac_test_mode ? 1'b0        : pin_scan_en;
   assign   tcu_jtag_se  = io_test_mode ? pin_scan_en : 1'b0;

   assign   tcu_se_scancollar_in = 
   	    io_test_mode ? pin_scan_en | mt_mode // includes tt_mode
	    : jt_scan    ? ((jt_scan_en | mt_mode)  & ~sel_only_spc_scan)
	    : flush_mode ? fm_scan_en  //1'b1
	    : 1'b0;
   
   assign   tcu_se_scancollar_out = 
	    io_test_mode ? pin_scan_en // includes tt_mode
	    : jt_scan    ? (jt_scan_en & ~sel_only_spc_scan)
	    : flush_mode   ? fm_scan_en  //1'b1
	    : 1'b0;

   assign   tcu_array_bypass = io_test_mode ? ~mt_mode  //1'b1 
	                   //: jt_scan      ? ~mt_mode  //1'b1
	                     : 1'b0;

   assign   tcu_array_wr_inhibit = 
	    io_test_mode ? pin_scan_en | ~mt_mode //1'b1 // includes tt_mode
	    : jt_scan    ? ((jt_scan_en | ~mt_mode) & ~sel_only_spc_scan) //1'b1
	    : flush_mode ? fm_scan_en
	    : 1'b0;
   
   //mux scan clocks based on testmode
   assign   tcu_aclk = 
	    io_test_mode ? pin_aclk
	    : jt_scan    ? (jt_scan_aclk  & ~sel_only_spc_scan) 
	    : instr_mbist_diag ? soc_mbist_aclk
	    : fm_aclk; 

   assign   tcu_bclk = 
	    io_test_mode ? pin_bclk
	    : jt_scan    ? (jt_scan_bclk & ~sel_only_spc_scan)
	    : instr_mbist_diag ? soc_mbist_bclk
	    : fm_bclk; //1'b0;

   assign   flush_mode = flush_off;

   assign   tcu_dectest =  // active low
            io_test_mode ? atpg_dectest //1'b0 // includes tt_mode
            : 1'b1;

   assign   tcu_muxtest =  // active low
            io_test_mode ? atpg_muxtest // ECO MUXTEST //1'b0 // includes tt_mode
            : 1'b1;
   
   // ********* Assign CONSTANT SCAN CONTROL values here ***********
   // ********* Assign CORE-UNIQUE SCAN CONTROL values here ***********
   assign   sel_spc0  =  sel_spc0_chains | ~chain_select;
   assign   sel_spc1  =  sel_spc1_chains | ~chain_select;
   assign   sel_spc2  =  sel_spc2_chains | ~chain_select;
   assign   sel_spc3  =  sel_spc3_chains | ~chain_select;
   assign   sel_spc4  =  sel_spc4_chains | ~chain_select;
   assign   sel_spc5  =  sel_spc5_chains | ~chain_select;
   assign   sel_spc6  =  sel_spc6_chains | ~chain_select;
   assign   sel_spc7  =  sel_spc7_chains | ~chain_select;

   assign   sel_only_spc_scan  = (sel_spc0_chains | sel_spc1_chains | sel_spc2_chains | sel_spc3_chains
                               |  sel_spc4_chains | sel_spc5_chains | sel_spc6_chains | sel_spc7_chains)
                               &  chain_select;
   
   assign   jt_scan_spc0  =  jt_scan & sel_spc0;
   assign   jt_scan_spc1  =  jt_scan & sel_spc1;
   assign   jt_scan_spc2  =  jt_scan & sel_spc2;
   assign   jt_scan_spc3  =  jt_scan & sel_spc3;
   assign   jt_scan_spc4  =  jt_scan & sel_spc4;
   assign   jt_scan_spc5  =  jt_scan & sel_spc5;
   assign   jt_scan_spc6  =  jt_scan & sel_spc6;
   assign   jt_scan_spc7  =  jt_scan & sel_spc7;

   // Values for SCAN_EN generation
   assign   jt_spc0_scan_en  =  jt_scan_en  &  sel_spc0;
   assign   jt_spc1_scan_en  =  jt_scan_en  &  sel_spc1;
   assign   jt_spc2_scan_en  =  jt_scan_en  &  sel_spc2;
   assign   jt_spc3_scan_en  =  jt_scan_en  &  sel_spc3;
   assign   jt_spc4_scan_en  =  jt_scan_en  &  sel_spc4;
   assign   jt_spc5_scan_en  =  jt_scan_en  &  sel_spc5;
   assign   jt_spc6_scan_en  =  jt_scan_en  &  sel_spc6;
   assign   jt_spc7_scan_en  =  jt_scan_en  &  sel_spc7;
   assign   fm_scan_en       =  ~POR_ | flush_q72; 
   assign   fm_asic_scan_en  =  ~POR_ | int_flush;  
   // Values for ACLK generation
   assign   jt_spc0_aclk  =  jt_scan_aclk  &  sel_spc0;
   assign   jt_spc1_aclk  =  jt_scan_aclk  &  sel_spc1;
   assign   jt_spc2_aclk  =  jt_scan_aclk  &  sel_spc2;
   assign   jt_spc3_aclk  =  jt_scan_aclk  &  sel_spc3;
   assign   jt_spc4_aclk  =  jt_scan_aclk  &  sel_spc4;
   assign   jt_spc5_aclk  =  jt_scan_aclk  &  sel_spc5;
   assign   jt_spc6_aclk  =  jt_scan_aclk  &  sel_spc6;
   assign   jt_spc7_aclk  =  jt_scan_aclk  &  sel_spc7;
   assign   fm_aclk       =  ~POR_  |  (flush_go &  flush_start);   // FLUSH_mode Aclk
   // Values for BCLK generation
   assign   jt_spc0_bclk  =  jt_scan_bclk  &  sel_spc0;
   assign   jt_spc1_bclk  =  jt_scan_bclk  &  sel_spc1;
   assign   jt_spc2_bclk  =  jt_scan_bclk  &  sel_spc2;
   assign   jt_spc3_bclk  =  jt_scan_bclk  &  sel_spc3;
   assign   jt_spc4_bclk  =  jt_scan_bclk  &  sel_spc4;
   assign   jt_spc5_bclk  =  jt_scan_bclk  &  sel_spc5;
   assign   jt_spc6_bclk  =  jt_scan_bclk  &  sel_spc6;
   assign   jt_spc7_bclk  =  jt_scan_bclk  &  sel_spc7;
   assign   fm_bclk       =  flush_go & ~flush_start;   // FLUSH_mode Bclk
   // ******************** For SPC0 ************************
   assign   tcu_spc0_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc0 ? jt_spc0_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc0_mb_scan_en;

   assign   tcu_spc0_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc0 ? jt_spc0_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc0_mb_aclk;

   assign   tcu_spc0_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc0 ? jt_spc0_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc0_mb_bclk;

   assign   tcu_spc0_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc0 ? jt_spc0_scan_en | mt_mode 
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc0_mb_scan_en;

   assign   tcu_spc0_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc0 ? jt_spc0_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc0_mb_scan_en;

   assign   tcu_spc0_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc0 ? jt_spc0_scan_en | ~mt_mode //jt_awi_spc0
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[0] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC1 ************************
   assign   tcu_spc1_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc1 ? jt_spc1_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc1_mb_scan_en;

   assign   tcu_spc1_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc1 ? jt_spc1_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc1_mb_aclk;

   assign   tcu_spc1_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc1 ? jt_spc1_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc1_mb_bclk;

   assign   tcu_spc1_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc1 ? jt_spc1_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc1_mb_scan_en;

   assign   tcu_spc1_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc1 ? jt_spc1_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc1_mb_scan_en;

   assign   tcu_spc1_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc1 ? jt_spc1_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[1] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC2 ************************
   assign   tcu_spc2_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc2 ? jt_spc2_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc2_mb_scan_en;

   assign   tcu_spc2_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc2 ? jt_spc2_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc2_mb_aclk;

   assign   tcu_spc2_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc2 ? jt_spc2_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc2_mb_bclk;

   assign   tcu_spc2_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc2 ? jt_spc2_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc2_mb_scan_en;

   assign   tcu_spc2_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc2 ? jt_spc2_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc2_mb_scan_en;

   assign   tcu_spc2_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc2 ? jt_spc2_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[2] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC3 ************************
   assign   tcu_spc3_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc3 ? jt_spc3_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc3_mb_scan_en;

   assign   tcu_spc3_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc3 ? jt_spc3_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc3_mb_aclk;

   assign   tcu_spc3_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc3 ? jt_spc3_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc3_mb_bclk;

   assign   tcu_spc3_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc3 ? jt_spc3_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc3_mb_scan_en;

   assign   tcu_spc3_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc3 ? jt_spc3_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc3_mb_scan_en;

   assign   tcu_spc3_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc3 ? jt_spc3_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[3] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC4 ************************
   assign   tcu_spc4_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc4 ? jt_spc4_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc4_mb_scan_en;

   assign   tcu_spc4_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc4 ? jt_spc4_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc4_mb_aclk;

   assign   tcu_spc4_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc4 ? jt_spc4_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc4_mb_bclk;

   assign   tcu_spc4_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc4 ? jt_spc4_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc4_mb_scan_en;

   assign   tcu_spc4_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc4 ? jt_spc4_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc4_mb_scan_en;

   assign   tcu_spc4_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc4 ? jt_spc4_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[4] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC5 ************************
   assign   tcu_spc5_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc5 ? jt_spc5_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc5_mb_scan_en;

   assign   tcu_spc5_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc5 ? jt_spc5_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc5_mb_aclk;

   assign   tcu_spc5_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc5 ? jt_spc5_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc5_mb_bclk;

   assign   tcu_spc5_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc5 ? jt_spc5_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc5_mb_scan_en;

   assign   tcu_spc5_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc5 ? jt_spc5_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc5_mb_scan_en;

   assign   tcu_spc5_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc5 ? jt_spc5_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[5] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC6 ************************
   assign   tcu_spc6_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc6 ? jt_spc6_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc6_mb_scan_en;

   assign   tcu_spc6_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc6 ? jt_spc6_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc6_mb_aclk;

   assign   tcu_spc6_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc6 ? jt_spc6_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc6_mb_bclk;

   assign   tcu_spc6_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc6 ? jt_spc6_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc6_mb_scan_en;

   assign   tcu_spc6_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc6 ? jt_spc6_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc6_mb_scan_en;

   assign   tcu_spc6_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc6 ? jt_spc6_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[6] ? 1'b1
	                              : 1'b0;
   // ******************** For SPC7 ************************
   assign   tcu_spc7_scan_en = io_test_mode ? pin_scan_en
	                     : jt_scan_spc7 ? jt_spc7_scan_en
	                     : flush_mode   ? fm_scan_en
	                     : tap_spc7_mb_scan_en;

   assign   tcu_spc7_aclk    = io_test_mode ? pin_aclk
	                     : jt_scan_spc7 ? jt_spc7_aclk
	                     : flush_mode   ? fm_aclk
	                     : tap_spc7_mb_aclk;

   assign   tcu_spc7_bclk    = io_test_mode ? pin_bclk
	                     : jt_scan_spc7 ? jt_spc7_bclk
	                     : flush_mode   ? fm_bclk
	                     : tap_spc7_mb_bclk;

   assign   tcu_spc7_se_scancollar_in  = io_test_mode ? pin_scan_en  | mt_mode
	                               : jt_scan_spc7 ? jt_spc7_scan_en | mt_mode
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc7_mb_scan_en;

   assign   tcu_spc7_se_scancollar_out = io_test_mode ? pin_scan_en 
	                               : jt_scan_spc7 ? jt_spc7_scan_en
	                               : flush_mode   ? fm_scan_en
	                               : tap_spc7_mb_scan_en;

   assign   tcu_spc7_array_wr_inhibit = io_test_mode ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan_spc7 ? jt_spc7_scan_en | ~mt_mode
	                              : flush_mode   ? fm_scan_en
                                      : tcu_spc_lbist_start[7] ? 1'b1
	                              : 1'b0;
   // *********** End of SPC Scan Controls *****************

   // ******************** For ASICs ************************
   // NIU (MAC, RDP, RTX, TDS), DMU and PEU
   //assign   asic_active      = (por_one | rst_tcu_clk_stop | jtag_clk_stop_active) & ~io_test_mode;
 //assign   asic_stop_en     =  (wmr_one | wmr_two | jtag_clk_stop_active) & ~io_test_mode & ~rst_tcu_dbr_gen;
   assign   asic_stop_en     = ((wmr_one | wmr_two | jtag_clk_stop_active) & ~rst_tcu_dbr_gen) | ac_test_mode;
   assign   asic_por_stop    = (~POR_ | (por_one & int_flush_d6)) & ~io_test_mode;

   assign   tcu_asic_scan_en = io_test_mode     ? pin_scan_en
	                     : jt_scan          ? jt_scan_en & ~sel_only_spc_scan
	                     : flush_mode       ? fm_asic_scan_en // & ~sel_only_spc_scan
                             : instr_mbist_diag ? soc_mbist_scan_en
	                     : 1'b0;

   assign   tcu_asic_aclk    = io_test_mode     ? pin_aclk
	                     : jt_scan          ? jt_scan_aclk & ~sel_only_spc_scan
	                     : flush_mode       ? 1'b0   // fm_aclk - don't flush ASICs
	                     : instr_mbist_diag ? soc_mbist_aclk
	                     : 1'b0;

   assign   tcu_asic_bclk    = io_test_mode     ? pin_bclk
	                     : jt_scan          ? jt_scan_bclk & ~sel_only_spc_scan
	                     : flush_mode       ? 1'b0   // don't flush ASICs
	                     : instr_mbist_diag ? soc_mbist_bclk
	                     : 1'b0;

   assign   tcu_asic_se_scancollar_in  = io_test_mode     ? pin_scan_en | mt_mode
	                               : jt_scan          ? ((jt_scan_en | mt_mode) & ~sel_only_spc_scan)
	                               : flush_mode       ? fm_asic_scan_en
                                       : instr_mbist_diag ? soc_mbist_scan_en
	                               : 1'b0;

   assign   tcu_asic_se_scancollar_out = io_test_mode     ? pin_scan_en 
	                               : jt_scan          ? jt_scan_en & ~sel_only_spc_scan
	                               : flush_mode       ? fm_asic_scan_en
                                       : instr_mbist_diag ? soc_mbist_scan_en
	                               : 1'b0;

   assign   tcu_asic_array_wr_inhibit = io_test_mode     ? pin_scan_en | ~mt_mode //1'b1
	                              : jt_scan          ? ((jt_scan_en | ~mt_mode) & ~sel_only_spc_scan)
	                              : flush_mode       ? fm_asic_scan_en
	                              : 1'b0;
   // *********** End of ASIC Scan Controls *****************

   
   assign   tcu_int_aclk  = io_test_mode ? pin_aclk : (~POR_ | por_one & int_flush);
   assign   tcu_int_bclk  = io_test_mode ? pin_bclk : 1'b0;
   assign   tcu_jtag_aclk = io_test_mode ? pin_aclk : 1'b0;

   assign   tcu_int_nfaclk = io_test_mode ? pin_aclk : 1'b0;
   assign   tcu_int_nfbclk = io_test_mode ? pin_bclk : 1'b0;
   
   //over ride power saving pce signal
   assign   tcu_pce_ov    = io_test_mode ? atpg_pce_ov : 1'b0;
   assign   tcu_int_pce_ov= ac_test_mode ? 1'b0        : tcu_pce_ov;
   
   // Flush scan chains when requested by reset unit
   assign   flush         = io_test_mode ? 1'b0 : rst_flush_req;
   assign   tcu_jtag_flush_req = flush_go; // to jtag
   assign   flush_drive_0 =  flush_mode & fm_scan_en;   // si to zero needs to follow flush scan enable
   
   // for Scan Flush, drive scan_in to low if not in test_mode
   assign   int_scan_in   = io_test_mode ? scan_in : 1'b0;

   // ********************************************************************
   // Synchronizer for JTAG Stop Request
   // ********************************************************************
   // jtag can request a clock stop, or mbist can request clk stop but mbist
   // request is gated by cycle counter
   assign   jtmb_clk_stop = (jtag_clk_stop_req_sync && !jtagclkstop_ov) |  mbist_clk_stop;

   // ********************************************************************
   // SerDes ATPG Logic - to Serdes Macros, not SOC's
   // ********************************************************************   
   assign   tcu_srd_atpgse        = io_test_mode & pin_scan_en;

   assign   tcu_srd_atpgmode[2]   = io_test_mode;
   assign   tcu_srd_atpgmode[1:0] = ac_test_mode ? {serdes_ac_mode_1,serdes_ac_mode_0}
                                  : 2'b00;
   assign   tcu_srd_atpgd         = io_test_mode & mio_tcu_scan_in31;
   assign   tcu_mio_scan_out31    = srd_tcu_atpgq;

   tcu_sigmux_ctl_msff_ctl_macro__width_2 tcusig_srdacmode_reg 
   ( 
     .scan_in(tcusig_srdacmode_reg_scanin),
     .scan_out(tcusig_srdacmode_reg_scanout),
     .l1clk    (l1clk),
     .din      ({serdes_ac_mode_1, serdes_ac_mode_0}),
     .dout     ({serdes_ac_mode_1, serdes_ac_mode_0}),
  .siclk(siclk),
  .soclk(soclk)
    );

   // ********************************************************************
   // Synchronizer Enable Pulses from cluster header
   // ********************************************************************
   tcu_sigmux_ctl_msff_ctl_macro__width_3 tcusig_cmpdrsync_reg 
   ( 
     .scan_in(tcusig_cmpdrsync_reg_scanin),
     .scan_out(tcusig_cmpdrsync_reg_scanout),
     .l1clk    (l1clk),
     .din      ({cmp_io_sync_en,       io_cmp_sync_en,        cmp_dr_sync_en      }), 
     .dout     ({cmp_io_sync_en_local, io_cmp_sync_en_local,  cmp_dr_sync_en_local_unused}),
  .siclk(siclk),
  .soclk(soclk)
     );
   
   // ********************************************************************
   // PCE_OV - want a scan-only flop for control
   // DECTEST - also scan-only flop
   // ********************************************************************   
   // For ATPG, scan in desired value
   tcu_sigmux_ctl_msff_ctl_macro__width_2 tcusig_pceov_reg 
   ( 
     .scan_in(tcusig_pceov_reg_scanin),
     .scan_out(tcusig_pceov_reg_scanout),
     .l1clk    (l1clk),
     .din      ({atpg_pce_ov, atpg_dectest}), 
     .dout     ({atpg_pce_ov, atpg_dectest}),
  .siclk(siclk),
  .soclk(soclk)
     );

   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_ccu_clk_stop_reg  ( 
     .scan_in  ( tcusig_ccu_clk_stop_reg_scanin  ),
     .scan_out ( tcusig_ccu_clk_stop_reg_scanout ),
     .l1clk    ( l1clk                           ),
     .din      ( tcu_ccu_clk_stop_din            ), 
     .dout     ( tcu_ccu_clk_stop_dout           ),
  .siclk(siclk),
  .soclk(soclk));

   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_ccu_io_clk_stop_reg  ( 
     .scan_in  ( tcusig_ccu_io_clk_stop_reg_scanin  ),
     .scan_out ( tcusig_ccu_io_clk_stop_reg_scanout ),
     .l1clk    ( l1clk                              ),
     .din      ( tcu_ccu_io_clk_stop_din            ), 
     .dout     ( tcu_ccu_io_clk_stop_dout           ),
  .siclk(siclk),
  .soclk(soclk));

   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_rst_clk_stop_reg  ( 
     .scan_in  ( tcusig_rst_clk_stop_reg_scanin  ),
     .scan_out ( tcusig_rst_clk_stop_reg_scanout ),
     .l1clk    ( l1clk                           ),
     .din      ( tcu_rst_clk_stop_din            ), 
     .dout     ( tcu_rst_clk_stop_dout           ),
  .siclk(siclk),
  .soclk(soclk));

   tcu_sigmux_ctl_msff_ctl_macro__width_1 tcusig_rst_io_clk_stop_reg  ( 
     .scan_in  ( tcusig_rst_io_clk_stop_reg_scanin  ),
     .scan_out ( tcusig_rst_io_clk_stop_reg_scanout ),
     .l1clk    ( l1clk                              ),
     .din      ( tcu_rst_io_clk_stop_din            ), 
     .dout     ( tcu_rst_io_clk_stop_dout           ),
  .siclk(siclk),
  .soclk(soclk));

   assign   tcu_ccu_clk_stop_din    =  tcu_ccu_clk_stop_dout;
   assign   tcu_ccu_io_clk_stop_din =  tcu_ccu_io_clk_stop_dout;
   assign   tcu_rst_clk_stop_din    =  tcu_rst_clk_stop_dout;
   assign   tcu_rst_io_clk_stop_din =  tcu_rst_io_clk_stop_dout;

   assign   tcu_ccu_clk_stop        =  tcu_ccu_clk_stop_dout     &  ~ac_test_mode;
   assign   tcu_ccu_io_clk_stop     =  tcu_ccu_io_clk_stop_dout  &  ~ac_test_mode;
   assign   tcu_rst_clk_stop        =  tcu_rst_clk_stop_dout     &  ~ac_test_mode;
   assign   tcu_rst_io_clk_stop     =  tcu_rst_io_clk_stop_dout  &  ~ac_test_mode;

   // ********************************************************************
   // Synchronizer for JTAG Access during POR
   // ********************************************************************
   cl_sc1_clksyncff_4x sync_ff_jtag_por_acc
     (.si (sync_ff_jtagporacc_scanin),
      .so (sync_ff_jtagporacc_scanout),
      .l1clk (l1clk),
      .d     (jtag_por_enable),
      .q     (jtag_por_enable_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   
   assign   jtag_por_active = jtag_por_enable_sync &  por_two;
   assign   jtag_por_status = jtag_por_active;

   // ********************************************************************
   // Synchronizer for NCU SCK Counter Bypass, signal generated via JTAG
   // ********************************************************************
   cl_sc1_clksyncff_4x sync_ff_sck_byp
     (.si (sync_ff_sckbyp_scanin),
      .so (sync_ff_sckbyp_scanout),
      .l1clk (l1clk),
      .d     (jtag_sck_byp),
      .q     (jtag_sck_byp_sync),
  .siclk(siclk),
  .soclk(soclk)
     );
   
   assign   pre_sck_bypass  = jtag_sck_byp_sync;
   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1  tcusig_sck_reg  
   ( 
     .scan_in(tcusig_sck_reg_scanin),
     .scan_out(tcusig_sck_reg_scanout),
     .en       (cmp_io_sync_en_local),
     .din      (pre_sck_bypass),
     .dout     (tcu_sck_bypass),  
     .l1clk    (l1clk),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // Synchronizers
   // From TCK to IO
   //==================================================
   //==================================================
   // SPC MBIST Clock Stop
   //==================================================
   cl_sc1_clksyncff_4x tap_spc7_mb_cs_sync_reg (
      .si    ( tap_spc7_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc7_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc7_mb_clk_stop            ),
      .q     ( tap_spc7_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc6_mb_cs_sync_reg (
      .si    ( tap_spc6_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc6_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc6_mb_clk_stop            ),
      .q     ( tap_spc6_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc5_mb_cs_sync_reg (
      .si    ( tap_spc5_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc5_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc5_mb_clk_stop            ),
      .q     ( tap_spc5_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc4_mb_cs_sync_reg (
      .si    ( tap_spc4_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc4_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc4_mb_clk_stop            ),
      .q     ( tap_spc4_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc3_mb_cs_sync_reg (
      .si    ( tap_spc3_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc3_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc3_mb_clk_stop            ),
      .q     ( tap_spc3_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc2_mb_cs_sync_reg (
      .si    ( tap_spc2_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc2_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc2_mb_clk_stop            ),
      .q     ( tap_spc2_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc1_mb_cs_sync_reg (
      .si    ( tap_spc1_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc1_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc1_mb_clk_stop            ),
      .q     ( tap_spc1_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tap_spc0_mb_cs_sync_reg (
      .si    ( tap_spc0_mb_cs_sync_reg_scanin  ),
      .so    ( tap_spc0_mb_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( tap_spc0_mb_clk_stop            ),
      .q     ( tap_spc0_mb_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // L2T MBIST Clock Stop
   //==================================================

   cl_sc1_clksyncff_4x l2t7_mbist_cs_sync_reg (
      .si    ( l2t7_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t7_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t7_mbist_clk_stop            ),
      .q     ( l2t7_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t6_mbist_cs_sync_reg (
      .si    ( l2t6_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t6_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t6_mbist_clk_stop            ),
      .q     ( l2t6_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t5_mbist_cs_sync_reg (
      .si    ( l2t5_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t5_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t5_mbist_clk_stop            ),
      .q     ( l2t5_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t4_mbist_cs_sync_reg (
      .si    ( l2t4_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t4_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t4_mbist_clk_stop            ),
      .q     ( l2t4_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t3_mbist_cs_sync_reg (
      .si    ( l2t3_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t3_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t3_mbist_clk_stop            ),
      .q     ( l2t3_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t2_mbist_cs_sync_reg (
      .si    ( l2t2_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t2_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t2_mbist_clk_stop            ),
      .q     ( l2t2_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t1_mbist_cs_sync_reg (
      .si    ( l2t1_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t1_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t1_mbist_clk_stop            ),
      .q     ( l2t1_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2t0_mbist_cs_sync_reg (
      .si    ( l2t0_mbist_cs_sync_reg_scanin  ),
      .so    ( l2t0_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2t0_mbist_clk_stop            ),
      .q     ( l2t0_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // L2B MBIST Clock Stop
   //==================================================
   cl_sc1_clksyncff_4x l2b7_mbist_cs_sync_reg (
      .si    ( l2b7_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b7_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b7_mbist_clk_stop            ),
      .q     ( l2b7_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b6_mbist_cs_sync_reg (
      .si    ( l2b6_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b6_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b6_mbist_clk_stop            ),
      .q     ( l2b6_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b5_mbist_cs_sync_reg (
      .si    ( l2b5_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b5_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( l2b5_mbist_clk_stop            ),
      .q     ( l2b5_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b4_mbist_cs_sync_reg (
      .si    ( l2b4_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b4_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b4_mbist_clk_stop            ),
      .q     ( l2b4_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b3_mbist_cs_sync_reg (
      .si    ( l2b3_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b3_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b3_mbist_clk_stop            ),
      .q     ( l2b3_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b2_mbist_cs_sync_reg (
      .si    ( l2b2_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b2_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                           ),
      .d     ( l2b2_mbist_clk_stop            ),
      .q     ( l2b2_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b1_mbist_cs_sync_reg (
      .si    ( l2b1_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b1_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b1_mbist_clk_stop            ),
      .q     ( l2b1_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x l2b0_mbist_cs_sync_reg (
      .si    ( l2b0_mbist_cs_sync_reg_scanin  ),
      .so    ( l2b0_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( l2b0_mbist_clk_stop            ),
      .q     ( l2b0_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // Other SOC MBIST Clock Stop
   //==================================================
   cl_sc1_clksyncff_4x soc0_mbist_cs_sync_reg (
      .si    ( soc0_mbist_cs_sync_reg_scanin  ),
      .so    ( soc0_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( soc0_mbist_clk_stop            ),
      .q     ( soc0_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x mcu3_mbist_cs_sync_reg (
      .si    ( mcu3_mbist_cs_sync_reg_scanin  ),
      .so    ( mcu3_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( mcu3_mbist_clk_stop            ),
      .q     ( mcu3_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x mcu2_mbist_cs_sync_reg (
      .si    ( mcu2_mbist_cs_sync_reg_scanin  ),
      .so    ( mcu2_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( mcu2_mbist_clk_stop            ),
      .q     ( mcu2_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x mcu1_mbist_cs_sync_reg (
      .si    ( mcu1_mbist_cs_sync_reg_scanin  ),
      .so    ( mcu1_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( mcu1_mbist_clk_stop            ),
      .q     ( mcu1_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x mcu0_mbist_cs_sync_reg (
      .si    ( mcu0_mbist_cs_sync_reg_scanin  ),
      .so    ( mcu0_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                          ),
      .d     ( mcu0_mbist_clk_stop            ),
      .q     ( mcu0_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x dmu_mbist_cs_sync_reg (
      .si    ( dmu_mbist_cs_sync_reg_scanin  ),
      .so    ( dmu_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( dmu_mbist_clk_stop            ),
      .q     ( dmu_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x peu_mbist_cs_sync_reg (
      .si    ( peu_mbist_cs_sync_reg_scanin  ),
      .so    ( peu_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( peu_mbist_clk_stop            ),
      .q     ( peu_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x rdp_mbist_cs_sync_reg (
      .si    ( rdp_mbist_cs_sync_reg_scanin  ),
      .so    ( rdp_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( rdp_mbist_clk_stop            ),
      .q     ( rdp_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x rtx_mbist_cs_sync_reg (
      .si    ( rtx_mbist_cs_sync_reg_scanin  ),
      .so    ( rtx_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( rtx_mbist_clk_stop            ),
      .q     ( rtx_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x tds_mbist_cs_sync_reg (
      .si    ( tds_mbist_cs_sync_reg_scanin  ),
      .so    ( tds_mbist_cs_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( tds_mbist_clk_stop            ),
      .q     ( tds_mbist_clk_stop_sync       ),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // SPC Shadow Scan Clock Stop
   //==================================================
   cl_sc1_clksyncff_4x jtag_spc7_ss_cs_sync_reg (
      .si    ( jtag_spc7_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc7_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc7_shscan_clk_stop        ),
      .q     ( jtag_spc7_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc6_ss_cs_sync_reg (
      .si    ( jtag_spc6_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc6_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc6_shscan_clk_stop        ),
      .q     ( jtag_spc6_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc5_ss_cs_sync_reg (
      .si    ( jtag_spc5_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc5_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc5_shscan_clk_stop        ),
      .q     ( jtag_spc5_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc4_ss_cs_sync_reg (
      .si    ( jtag_spc4_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc4_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc4_shscan_clk_stop        ),
      .q     ( jtag_spc4_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc3_ss_cs_sync_reg (
      .si    ( jtag_spc3_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc3_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc3_shscan_clk_stop        ),
      .q     ( jtag_spc3_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc2_ss_cs_sync_reg (
      .si    ( jtag_spc2_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc2_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc2_shscan_clk_stop        ),
      .q     ( jtag_spc2_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc1_ss_cs_sync_reg (
      .si    ( jtag_spc1_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc1_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc1_shscan_clk_stop        ),
      .q     ( jtag_spc1_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc0_ss_cs_sync_reg (
      .si    ( jtag_spc0_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_spc0_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_spc0_shscan_clk_stop        ),
      .q     ( jtag_spc0_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   //==================================================
   // L2T Shadow Scan Clock Stop
   //==================================================
   cl_sc1_clksyncff_4x jtag_l2t7_ss_cs_sync_reg (
      .si    ( jtag_l2t7_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t7_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t7_shscan_clk_stop        ),
      .q     ( jtag_l2t7_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t6_ss_cs_sync_reg (
      .si    ( jtag_l2t6_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t6_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t6_shscan_clk_stop        ),
      .q     ( jtag_l2t6_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t5_ss_cs_sync_reg (
      .si    ( jtag_l2t5_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t5_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t5_shscan_clk_stop        ),
      .q     ( jtag_l2t5_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t4_ss_cs_sync_reg (
      .si    ( jtag_l2t4_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t4_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t4_shscan_clk_stop        ),
      .q     ( jtag_l2t4_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t3_ss_cs_sync_reg (
      .si    ( jtag_l2t3_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t3_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t3_shscan_clk_stop        ),
      .q     ( jtag_l2t3_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t2_ss_cs_sync_reg (
      .si    ( jtag_l2t2_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t2_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t2_shscan_clk_stop        ),
      .q     ( jtag_l2t2_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t1_ss_cs_sync_reg (
      .si    ( jtag_l2t1_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t1_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t1_shscan_clk_stop        ),
      .q     ( jtag_l2t1_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t0_ss_cs_sync_reg (
      .si    ( jtag_l2t0_ss_cs_sync_reg_scanin  ),
      .so    ( jtag_l2t0_ss_cs_sync_reg_scanout ),
      .l1clk ( l1clk                            ),
      .d     ( jtag_l2t0_shscan_clk_stop        ),
      .q     ( jtag_l2t0_shscan_clk_stop_sync   ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_spc_ss_pce_ov_sync_reg (
      .si    ( jtag_spc_ss_pce_ov_sync_reg_scanin  ),
      .so    ( jtag_spc_ss_pce_ov_sync_reg_scanout ),
      .l1clk ( l1clk                               ),
      .d     ( jtag_spc_shscan_pce_ov              ),
      .q     ( jtag_spc_shscan_pce_ov_sync         ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_l2t_ss_pce_ov_sync_reg (
      .si    ( jtag_l2t_ss_pce_ov_sync_reg_scanin  ),
      .so    ( jtag_l2t_ss_pce_ov_sync_reg_scanout ),
      .l1clk ( l1clk                               ),
      .d     ( jtag_l2t_shscan_pce_ov              ),
      .q     ( jtag_l2t_shscan_pce_ov_sync         ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_clk_stop_req_sync_reg (
      .si    ( jtag_clk_stop_req_sync_reg_scanin  ),
      .so    ( jtag_clk_stop_req_sync_reg_scanout ),
      .l1clk ( l1clk                              ),
      .d     ( jtag_clk_stop_req                  ),
      .q     ( jtag_clk_stop_req_sync             ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x jtag_efu_clear_instr_sync_reg (
      .si    ( jtag_efu_clear_instr_sync_reg_scanin  ),
      .so    ( jtag_efu_clear_instr_sync_reg_scanout ),
      .l1clk ( l1clk                                 ),
      .d     ( jtag_efu_clear_instr                  ),
      .q     ( jtag_efu_clear_instr_sync             ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x instr_sstop_csmode_sync_reg (
      .si    ( instr_sstop_csmode_sync_reg_scanin  ),
      .so    ( instr_sstop_csmode_sync_reg_scanout ),
      .l1clk ( l1clk                               ),
      .d     ( instr_sstop_csmode                  ),
      .q     ( instr_sstop_csmode_sync             ),
  .siclk(siclk),
  .soclk(soclk));

   cl_sc1_clksyncff_4x sync_ff_jtag_clkdly_upd (
      .si    ( sync_ff_jtagclkdlyupd_scanin  ),
      .so    ( sync_ff_jtagclkdlyupd_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( jtag_upd_cntdly               ),
      .q     ( jtag_upd_cntdly_sync          ),
  .siclk(siclk),
  .soclk(soclk));
   //==================================================
   // Synchronize jtag serial scan to send to ccu mux select
   //==================================================
   cl_sc1_clksyncff_4x jtag_serscan_sync_reg (
      .si    ( jtag_serscan_sync_reg_scanin  ),
      .so    ( jtag_serscan_sync_reg_scanout ),
      .l1clk ( l1clk                         ),
      .d     ( jt_scan_mtmode                ),
      .q     ( jt_scan_mtmode_sync           ),
  .siclk(siclk),
  .soclk(soclk));


   //======================================================================
   // Transfer Signals to L2T Using IO Clock
   // Shadow Scan Clock Stops, Shadow Scan PCE OV & Shadow Scan ID
   //======================================================================
   assign shscan_clk_stop_sync[20:0] = {
                    jtag_spc7_shscan_clk_stop_sync, jtag_spc6_shscan_clk_stop_sync,
                    jtag_spc5_shscan_clk_stop_sync, jtag_spc4_shscan_clk_stop_sync,
                    jtag_spc3_shscan_clk_stop_sync, jtag_spc2_shscan_clk_stop_sync,
                    jtag_spc1_shscan_clk_stop_sync, jtag_spc0_shscan_clk_stop_sync,
                    jtag_l2t7_shscan_clk_stop_sync, jtag_l2t6_shscan_clk_stop_sync,
                    jtag_l2t5_shscan_clk_stop_sync, jtag_l2t4_shscan_clk_stop_sync,
                    jtag_l2t3_shscan_clk_stop_sync, jtag_l2t2_shscan_clk_stop_sync,
                    jtag_l2t1_shscan_clk_stop_sync, jtag_l2t0_shscan_clk_stop_sync,
                    jtag_spc_shscan_pce_ov_sync,    jtag_l2t_shscan_pce_ov_sync,
                    jtag_spc_shscanid};

   tcu_sigmux_ctl_msff_ctl_macro__en_1__width_21 shscan_clk_stop_io_sync_reg  ( 
      .scan_in  ( shscan_clk_stop_io_sync_reg_scanin  ),
      .scan_out ( shscan_clk_stop_io_sync_reg_scanout ),
      .en       ( io_cmp_sync_en_local                ),
      .din      ( shscan_clk_stop_sync[20:0]          ),
      .dout     ( shscan_clk_stop_io[20:0]            ),
      .l1clk    ( l1clk                               ),
  .siclk(siclk),
  .soclk(soclk));

   assign {
           tcu_spc7_shscan_clk_stop, tcu_spc6_shscan_clk_stop,
           tcu_spc5_shscan_clk_stop, tcu_spc4_shscan_clk_stop,
           tcu_spc3_shscan_clk_stop, tcu_spc2_shscan_clk_stop,
           tcu_spc1_shscan_clk_stop, tcu_spc0_shscan_clk_stop,
           tcu_l2t7_shscan_clk_stop, tcu_l2t6_shscan_clk_stop,
           tcu_l2t5_shscan_clk_stop, tcu_l2t4_shscan_clk_stop,
           tcu_l2t3_shscan_clk_stop, tcu_l2t2_shscan_clk_stop,
           tcu_l2t1_shscan_clk_stop, tcu_l2t0_shscan_clk_stop,
           tcu_spc_shscan_pce_ov,    tcu_l2t_shscan_pce_ov,
           tcu_spc_shscanid}
                             = shscan_clk_stop_io;

//==================================================
// Spare Gates
//==================================================
// ----------------------------------------------------------------------
// Removed for ECO to make flops visible in SunV
//
//spare_ctl_macro spare (num=9) (
//   .l1clk    ( l1clk         ),
//   .scan_in  ( spare_scanin  ),
//   .scan_out ( spare_scanout ));
   
// Added for ECO to make flops visible

// - this is an expansion of spare_ctl_macro with just the gates
tcu_sigmux_ctl_spare_ctl_macro__flops_0__num_9 spare_gates  (
);

tcu_sigmux_ctl_msff_ctl_macro__scanreverse_1__width_9 spare_flops  (
   .scan_in(spare_scanin),
   .scan_out(spare_scanout),
   .l1clk(l1clk),
   .din  (spare_flops_d[8:0]),
   .dout (spare_flops_q[8:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign   spare_flops_d[8]         =  1'b0;
assign   spare_flops_d[7]         =  1'b0;
assign   spare_flops_d[6]         =  1'b0;
assign   spare_flops_d[5]         =  1'b0;
assign   spare_flops_d[4]         =  1'b0;
assign   spare_flops_d[3]         =  atpg_muxtest;  // ECO MUXTEST
assign   spare_flops_d[2]         =  1'b0;
assign   spare_flops_d[1]         =  1'b0;
assign   spare_flops_d[0]         =  1'b0;

assign   spare_flops_unused[8]    =  spare_flops_q[8];  
assign   spare_flops_unused[7]    =  spare_flops_q[7];  
assign   spare_flops_unused[6]    =  spare_flops_q[6];  
assign   spare_flops_unused[5]    =  spare_flops_q[5];  
assign   spare_flops_unused[4]    =  spare_flops_q[4];  
assign   atpg_muxtest             =  spare_flops_q[3];    // ECO MUXTEST
assign   spare_flops_unused[2]    =  spare_flops_q[2];  
assign   spare_flops_unused[1]    =  spare_flops_q[1];  
assign   spare0_flop_unused[0]    =  spare_flops_q[0];  

// ----------------------------------------------------------------------

//  -hand modified to stitch non-scan (except for mfg mode) flops
// fixscan start:

// These are flops that are "No-Flush" (_nf_), excluded from flush reset
//assign tcusig_fgo_nf_reg_scanin       = int_scan_in                    ;
//assign tcusig_flush_nf_reg_scanin     = tcusig_fgo_nf_reg_scanout      ;

//assign tcusig_foncnt_nf_reg_scanin    = tcusig_flush_nf_reg_scanout    ;
assign ucb_csr_wr_sync_reg_scanin     = int_scan_in                    ;
assign tcusig_foncnt_nf_reg_scanin    = ucb_csr_wr_sync_reg_scanout    ;
assign tcusig_foffcnt_nf_reg_scanin   = tcusig_foncnt_nf_reg_scanout   ;
assign tcusig_fq24_nf_reg_scanin      = tcusig_foffcnt_nf_reg_scanout  ;
assign tcusig_fq48_nf_reg_scanin      = tcusig_fq24_nf_reg_scanout     ;
assign tcusig_fq72_nf_reg_scanin      = tcusig_fq48_nf_reg_scanout     ;
assign tcusig_fq96_nf_reg_scanin      = tcusig_fq72_nf_reg_scanout     ;
assign tcusig_cstopq48_nf_reg_scanin  = tcusig_fq96_nf_reg_scanout     ;

assign tcusig_rstsm_nf_reg_scanin     = tcusig_cstopq48_nf_reg_scanout ;
assign tcusig_tcuf_nf_reg_scanin      = tcusig_rstsm_nf_reg_scanout    ;
assign tcusig_tcuasicf_nf_reg_scanin  = tcusig_tcuf_nf_reg_scanout     ;
assign tcusig_intflush_nf_reg_scanin  = tcusig_tcuasicf_nf_reg_scanout ;

assign tcusig_noflush_scanout = io_test_mode ? tcusig_intflush_nf_reg_scanout : int_scan_in;

assign tcusig_flushdly_reg_scanin = tcusig_noflush_scanout; //int_scan_in; 
assign tcusig_fireq_reg_scanin   = tcusig_flushdly_reg_scanout;
assign tcusig_fsreq_reg_scanin   = tcusig_fireq_reg_scanout ;
//assign tcusig_afsreq_reg_scanin  = tcusig_fsreq_reg_scanout;
assign tcusig_fiack_reg_scanin   = tcusig_fsreq_reg_scanout; 
assign tcusig_efctl_reg_scanin   = tcusig_fiack_reg_scanout;
assign tcusig_efcnt_reg_scanin   = tcusig_efctl_reg_scanout ;
assign tcusig_clkstopviareg_reg_scanin = tcusig_efcnt_reg_scanout ;
assign tcusig_jtagclkstop_reg_scanin = tcusig_clkstopviareg_reg_scanout;
assign tcusig_flushclkstop_reg_scanin = tcusig_jtagclkstop_reg_scanout;
assign tcusig_warmrp_reg_scanin	      = tcusig_flushclkstop_reg_scanout;
assign tcusig_coreavailclkstop_reg_scanin = tcusig_warmrp_reg_scanout;
assign tcusig_ca_reg_scanin      = tcusig_coreavailclkstop_reg_scanout;
assign tcusig_coreavailclear_reg_scanin = tcusig_ca_reg_scanout    ;
assign tcusig_enstat_reg_scanin  = tcusig_coreavailclear_reg_scanout;
assign tcusig_cesq_reg_scanin    = tcusig_enstat_reg_scanout;
assign tcusig_ces_reg_scanin     = tcusig_cesq_reg_scanout  ;
assign clk_stop_seq_scanin       =  tcusig_ces_reg_scanout;
assign tcusig_cntdly_reg_scanin  =  clk_stop_seq_scanout;
assign tcusig_cntstop_reg_scanin =  tcusig_cntdly_reg_scanout; 
assign tcusig_cntstart_reg_scanin = tcusig_cntstop_reg_scanout;

assign tcusig_ssmode_reg_scanin     = tcusig_cntstart_reg_scanout;
assign tcusig_sssel_reg_scanin      = tcusig_ssmode_reg_scanout;

//assign sync_ff_ac_tt_trigger_ce_scanin = tcusig_sssel_reg_scanout;
//assign sync_ff_ac_tt_trigger_scanin    = sync_ff_ac_tt_trigger_ce_scanout;
assign sync_ff_ac_tt_trigger_scanin    = tcusig_sssel_reg_scanout;
   
assign sync_ff_clk_stop_spc0_0_scanin = sync_ff_ac_tt_trigger_scanout;
assign sync_ff_clk_stop_spc0_1_scanin = sync_ff_clk_stop_spc0_0_scanout;
assign sync_ff_clk_stop_spc1_0_scanin = sync_ff_clk_stop_spc0_1_scanout;
assign sync_ff_clk_stop_spc1_1_scanin = sync_ff_clk_stop_spc1_0_scanout;
assign sync_ff_clk_stop_spc2_0_scanin = sync_ff_clk_stop_spc1_1_scanout;
assign sync_ff_clk_stop_spc2_1_scanin = sync_ff_clk_stop_spc2_0_scanout;
assign sync_ff_clk_stop_spc3_0_scanin = sync_ff_clk_stop_spc2_1_scanout;
assign sync_ff_clk_stop_spc3_1_scanin = sync_ff_clk_stop_spc3_0_scanout;
assign sync_ff_clk_stop_spc4_0_scanin = sync_ff_clk_stop_spc3_1_scanout;
assign sync_ff_clk_stop_spc4_1_scanin = sync_ff_clk_stop_spc4_0_scanout;
assign sync_ff_clk_stop_spc5_0_scanin = sync_ff_clk_stop_spc4_1_scanout;
assign sync_ff_clk_stop_spc5_1_scanin = sync_ff_clk_stop_spc5_0_scanout;
assign sync_ff_clk_stop_spc6_0_scanin = sync_ff_clk_stop_spc5_1_scanout;
assign sync_ff_clk_stop_spc6_1_scanin = sync_ff_clk_stop_spc6_0_scanout;
assign sync_ff_clk_stop_spc7_0_scanin = sync_ff_clk_stop_spc6_1_scanout;
assign sync_ff_clk_stop_spc7_1_scanin = sync_ff_clk_stop_spc7_0_scanout;
assign sync_ff_clk_stop_bnk0_0_scanin = sync_ff_clk_stop_spc7_1_scanout;
assign sync_ff_clk_stop_bnk0_1_scanin = sync_ff_clk_stop_bnk0_0_scanout;
assign sync_ff_clk_stop_l2t0_0_scanin = sync_ff_clk_stop_bnk0_1_scanout;
assign sync_ff_clk_stop_l2t0_1_scanin = sync_ff_clk_stop_l2t0_0_scanout;
assign sync_ff_clk_stop_bnk1_0_scanin = sync_ff_clk_stop_l2t0_1_scanout;
assign sync_ff_clk_stop_bnk1_1_scanin = sync_ff_clk_stop_bnk1_0_scanout;
assign sync_ff_clk_stop_l2t1_0_scanin = sync_ff_clk_stop_bnk1_1_scanout;
assign sync_ff_clk_stop_l2t1_1_scanin = sync_ff_clk_stop_l2t1_0_scanout;
assign sync_ff_clk_stop_bnk2_0_scanin = sync_ff_clk_stop_l2t1_1_scanout;
assign sync_ff_clk_stop_bnk2_1_scanin = sync_ff_clk_stop_bnk2_0_scanout;
assign sync_ff_clk_stop_l2t2_0_scanin = sync_ff_clk_stop_bnk2_1_scanout;
assign sync_ff_clk_stop_l2t2_1_scanin = sync_ff_clk_stop_l2t2_0_scanout;
assign sync_ff_clk_stop_bnk3_0_scanin = sync_ff_clk_stop_l2t2_1_scanout;
assign sync_ff_clk_stop_bnk3_1_scanin = sync_ff_clk_stop_bnk3_0_scanout;
assign sync_ff_clk_stop_l2t3_0_scanin = sync_ff_clk_stop_bnk3_1_scanout;
assign sync_ff_clk_stop_l2t3_1_scanin = sync_ff_clk_stop_l2t3_0_scanout;
assign sync_ff_clk_stop_bnk4_0_scanin = sync_ff_clk_stop_l2t3_1_scanout;
assign sync_ff_clk_stop_bnk4_1_scanin = sync_ff_clk_stop_bnk4_0_scanout;
assign sync_ff_clk_stop_l2t4_0_scanin = sync_ff_clk_stop_bnk4_1_scanout;
assign sync_ff_clk_stop_l2t4_1_scanin = sync_ff_clk_stop_l2t4_0_scanout;
assign sync_ff_clk_stop_bnk5_0_scanin = sync_ff_clk_stop_l2t4_1_scanout;
assign sync_ff_clk_stop_bnk5_1_scanin = sync_ff_clk_stop_bnk5_0_scanout;
assign sync_ff_clk_stop_l2t5_0_scanin = sync_ff_clk_stop_bnk5_1_scanout;
assign sync_ff_clk_stop_l2t5_1_scanin = sync_ff_clk_stop_l2t5_0_scanout;
assign sync_ff_clk_stop_bnk6_0_scanin = sync_ff_clk_stop_l2t5_1_scanout;
assign sync_ff_clk_stop_bnk6_1_scanin = sync_ff_clk_stop_bnk6_0_scanout;
assign sync_ff_clk_stop_l2t6_0_scanin = sync_ff_clk_stop_bnk6_1_scanout;
assign sync_ff_clk_stop_l2t6_1_scanin = sync_ff_clk_stop_l2t6_0_scanout;
assign sync_ff_clk_stop_bnk7_0_scanin = sync_ff_clk_stop_l2t6_1_scanout;
assign sync_ff_clk_stop_bnk7_1_scanin = sync_ff_clk_stop_bnk7_0_scanout;
assign sync_ff_clk_stop_l2t7_0_scanin = sync_ff_clk_stop_bnk7_1_scanout;
assign sync_ff_clk_stop_l2t7_1_scanin = sync_ff_clk_stop_l2t7_0_scanout;
   
assign sync_ff_clk_stop_mcu0_0_scanin   = sync_ff_clk_stop_l2t7_1_scanout;
assign sync_ff_clk_stop_mcu0_1_scanin   = sync_ff_clk_stop_mcu0_0_scanout;
assign sync_ff_ioclk_stop_mcu0_1_scanin = sync_ff_clk_stop_mcu0_1_scanout;
assign sync_ff_drclk_stop_mcu0_1_scanin = sync_ff_ioclk_stop_mcu0_1_scanout;
   
assign sync_ff_clk_stop_mcu1_0_scanin   = sync_ff_drclk_stop_mcu0_1_scanout;
assign sync_ff_clk_stop_mcu1_1_scanin   = sync_ff_clk_stop_mcu1_0_scanout;
assign sync_ff_ioclk_stop_mcu1_1_scanin = sync_ff_clk_stop_mcu1_1_scanout;
assign sync_ff_drclk_stop_mcu1_1_scanin = sync_ff_ioclk_stop_mcu1_1_scanout;
   
assign sync_ff_clk_stop_mcu2_0_scanin   = sync_ff_drclk_stop_mcu1_1_scanout;
assign sync_ff_clk_stop_mcu2_1_scanin   = sync_ff_clk_stop_mcu2_0_scanout;
assign sync_ff_ioclk_stop_mcu2_1_scanin = sync_ff_clk_stop_mcu2_1_scanout;
assign sync_ff_drclk_stop_mcu2_1_scanin = sync_ff_ioclk_stop_mcu2_1_scanout;
   
assign sync_ff_clk_stop_mcu3_0_scanin   = sync_ff_drclk_stop_mcu2_1_scanout;
assign sync_ff_clk_stop_mcu3_1_scanin   = sync_ff_clk_stop_mcu3_0_scanout;
assign sync_ff_ioclk_stop_mcu3_1_scanin = sync_ff_clk_stop_mcu3_1_scanout;
assign sync_ff_drclk_stop_mcu3_1_scanin = sync_ff_ioclk_stop_mcu3_1_scanout;
   
assign sync_ff_clk_stop_soc0_0_scanin   = sync_ff_drclk_stop_mcu3_1_scanout;
assign sync_ff_clk_stop_soc0_1_scanin   = sync_ff_clk_stop_soc0_0_scanout;
assign sync_ff_ioclk_stop_soc0_1_scanin = sync_ff_clk_stop_soc0_1_scanout;
//assign sync_ff_drclk_stop_soc0_1_scanin = sync_ff_ioclk_stop_soc0_1_scanout;
   
//assign sync_ff_clk_stop_soc1_0_scanin   = sync_ff_drclk_stop_soc0_1_scanout;
assign sync_ff_clk_stop_soc1_0_scanin   = sync_ff_ioclk_stop_soc0_1_scanout;
assign sync_ff_ioclk_stop_soc1_1_scanin = sync_ff_clk_stop_soc1_0_scanout;
assign sync_ff_clk_stop_soc2_0_scanin   = sync_ff_ioclk_stop_soc1_1_scanout;
assign sync_ff_ioclk_stop_soc2_1_scanin = sync_ff_clk_stop_soc2_0_scanout;
assign sync_ff_clk_stop_soc3_0_scanin   = sync_ff_ioclk_stop_soc2_1_scanout;
assign sync_ff_clk_stop_soc3_1_scanin   = sync_ff_clk_stop_soc3_0_scanout;
assign sync_ff_ioclk_stop_soc3_1_scanin = sync_ff_clk_stop_soc3_1_scanout;
assign tcusig_ttclksel_reg_scanin       = sync_ff_ioclk_stop_soc3_1_scanout;
assign tcusig_srdacmode_reg_scanin    = tcusig_ttclksel_reg_scanout;
assign tcusig_cmpdrsync_reg_scanin    = tcusig_srdacmode_reg_scanout;
assign tcusig_pceov_reg_scanin        = tcusig_cmpdrsync_reg_scanout;
assign tcusig_ccu_clk_stop_reg_scanin    = tcusig_pceov_reg_scanout;
assign tcusig_ccu_io_clk_stop_reg_scanin = tcusig_ccu_clk_stop_reg_scanout;
assign tcusig_rst_clk_stop_reg_scanin    = tcusig_ccu_io_clk_stop_reg_scanout;
assign tcusig_rst_io_clk_stop_reg_scanin = tcusig_rst_clk_stop_reg_scanout;
assign sync_ff_jtagporacc_scanin         = tcusig_rst_io_clk_stop_reg_scanout;
assign sync_ff_sckbyp_scanin          = sync_ff_jtagporacc_scanout;
assign tcusig_sck_reg_scanin          = sync_ff_sckbyp_scanout;
assign tap_spc7_mb_cs_sync_reg_scanin       = tcusig_sck_reg_scanout;
assign tap_spc6_mb_cs_sync_reg_scanin       = tap_spc7_mb_cs_sync_reg_scanout;
assign tap_spc5_mb_cs_sync_reg_scanin       = tap_spc6_mb_cs_sync_reg_scanout;
assign tap_spc4_mb_cs_sync_reg_scanin       = tap_spc5_mb_cs_sync_reg_scanout;
assign tap_spc3_mb_cs_sync_reg_scanin       = tap_spc4_mb_cs_sync_reg_scanout;
assign tap_spc2_mb_cs_sync_reg_scanin       = tap_spc3_mb_cs_sync_reg_scanout;
assign tap_spc1_mb_cs_sync_reg_scanin       = tap_spc2_mb_cs_sync_reg_scanout;
assign tap_spc0_mb_cs_sync_reg_scanin       = tap_spc1_mb_cs_sync_reg_scanout;
assign l2t7_mbist_cs_sync_reg_scanin        = tap_spc0_mb_cs_sync_reg_scanout;
assign l2t6_mbist_cs_sync_reg_scanin        = l2t7_mbist_cs_sync_reg_scanout;
assign l2t5_mbist_cs_sync_reg_scanin        = l2t6_mbist_cs_sync_reg_scanout;
assign l2t4_mbist_cs_sync_reg_scanin        = l2t5_mbist_cs_sync_reg_scanout;
assign l2t3_mbist_cs_sync_reg_scanin        = l2t4_mbist_cs_sync_reg_scanout;
assign l2t2_mbist_cs_sync_reg_scanin        = l2t3_mbist_cs_sync_reg_scanout;
assign l2t1_mbist_cs_sync_reg_scanin        = l2t2_mbist_cs_sync_reg_scanout;
assign l2t0_mbist_cs_sync_reg_scanin        = l2t1_mbist_cs_sync_reg_scanout;
assign l2b7_mbist_cs_sync_reg_scanin        = l2t0_mbist_cs_sync_reg_scanout;
assign l2b6_mbist_cs_sync_reg_scanin        = l2b7_mbist_cs_sync_reg_scanout;
assign l2b5_mbist_cs_sync_reg_scanin        = l2b6_mbist_cs_sync_reg_scanout;
assign l2b4_mbist_cs_sync_reg_scanin        = l2b5_mbist_cs_sync_reg_scanout;
assign l2b3_mbist_cs_sync_reg_scanin        = l2b4_mbist_cs_sync_reg_scanout;
assign l2b2_mbist_cs_sync_reg_scanin        = l2b3_mbist_cs_sync_reg_scanout;
assign l2b1_mbist_cs_sync_reg_scanin        = l2b2_mbist_cs_sync_reg_scanout;
assign l2b0_mbist_cs_sync_reg_scanin        = l2b1_mbist_cs_sync_reg_scanout;
assign soc0_mbist_cs_sync_reg_scanin        = l2b0_mbist_cs_sync_reg_scanout;
assign mcu3_mbist_cs_sync_reg_scanin        = soc0_mbist_cs_sync_reg_scanout;
assign mcu2_mbist_cs_sync_reg_scanin        = mcu3_mbist_cs_sync_reg_scanout;
assign mcu1_mbist_cs_sync_reg_scanin        = mcu2_mbist_cs_sync_reg_scanout;
assign mcu0_mbist_cs_sync_reg_scanin        = mcu1_mbist_cs_sync_reg_scanout;
assign dmu_mbist_cs_sync_reg_scanin         = mcu0_mbist_cs_sync_reg_scanout;
assign peu_mbist_cs_sync_reg_scanin         = dmu_mbist_cs_sync_reg_scanout;
assign rdp_mbist_cs_sync_reg_scanin         = peu_mbist_cs_sync_reg_scanout;
assign rtx_mbist_cs_sync_reg_scanin         = rdp_mbist_cs_sync_reg_scanout;
assign tds_mbist_cs_sync_reg_scanin         = rtx_mbist_cs_sync_reg_scanout;
assign jtag_spc7_ss_cs_sync_reg_scanin      = tds_mbist_cs_sync_reg_scanout;
assign jtag_spc6_ss_cs_sync_reg_scanin      = jtag_spc7_ss_cs_sync_reg_scanout;
assign jtag_spc5_ss_cs_sync_reg_scanin      = jtag_spc6_ss_cs_sync_reg_scanout;
assign jtag_spc4_ss_cs_sync_reg_scanin      = jtag_spc5_ss_cs_sync_reg_scanout;
assign jtag_spc3_ss_cs_sync_reg_scanin      = jtag_spc4_ss_cs_sync_reg_scanout;
assign jtag_spc2_ss_cs_sync_reg_scanin      = jtag_spc3_ss_cs_sync_reg_scanout;
assign jtag_spc1_ss_cs_sync_reg_scanin      = jtag_spc2_ss_cs_sync_reg_scanout;
assign jtag_spc0_ss_cs_sync_reg_scanin      = jtag_spc1_ss_cs_sync_reg_scanout;
assign jtag_l2t7_ss_cs_sync_reg_scanin      = jtag_spc0_ss_cs_sync_reg_scanout;
assign jtag_l2t6_ss_cs_sync_reg_scanin      = jtag_l2t7_ss_cs_sync_reg_scanout;
assign jtag_l2t5_ss_cs_sync_reg_scanin      = jtag_l2t6_ss_cs_sync_reg_scanout;
assign jtag_l2t4_ss_cs_sync_reg_scanin      = jtag_l2t5_ss_cs_sync_reg_scanout;
assign jtag_l2t3_ss_cs_sync_reg_scanin      = jtag_l2t4_ss_cs_sync_reg_scanout;
assign jtag_l2t2_ss_cs_sync_reg_scanin      = jtag_l2t3_ss_cs_sync_reg_scanout;
assign jtag_l2t1_ss_cs_sync_reg_scanin      = jtag_l2t2_ss_cs_sync_reg_scanout;
assign jtag_l2t0_ss_cs_sync_reg_scanin      = jtag_l2t1_ss_cs_sync_reg_scanout;
assign jtag_spc_ss_pce_ov_sync_reg_scanin   = jtag_l2t0_ss_cs_sync_reg_scanout;
assign jtag_l2t_ss_pce_ov_sync_reg_scanin   = jtag_spc_ss_pce_ov_sync_reg_scanout;
assign jtag_clk_stop_req_sync_reg_scanin    = jtag_l2t_ss_pce_ov_sync_reg_scanout;
assign jtag_efu_clear_instr_sync_reg_scanin = jtag_clk_stop_req_sync_reg_scanout;
assign instr_sstop_csmode_sync_reg_scanin   = jtag_efu_clear_instr_sync_reg_scanout;
assign sync_ff_jtagclkdlyupd_scanin         = instr_sstop_csmode_sync_reg_scanout;
assign jtag_serscan_sync_reg_scanin         = sync_ff_jtagclkdlyupd_scanout;
assign shscan_clk_stop_io_sync_reg_scanin   = jtag_serscan_sync_reg_scanout;
assign spare_scanin                         = shscan_clk_stop_io_sync_reg_scanout;
assign scan_out                             = spare_scanout;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module tcu_sigmux_ctl_l1clkhdr_ctl_macro (
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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_7 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0] & ~{7{clr}};






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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_2 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = (din[1:0] & {2{en}}) | (dout[1:0] & ~{2{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}} & ~{1{clr}}) | (dout[0:0] & ~{1{en}} & ~{1{clr}});






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

module tcu_sigmux_ctl_msff_ctl_macro__clr__1__width_2 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0] & ~{2{(~clr_)}};






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

module tcu_sigmux_ctl_msff_ctl_macro__width_1 (
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

module tcu_sigmux_ctl_msff_ctl_macro__width_12 (
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

module tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_6 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0] & ~{6{clr}};






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

module tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_15 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = din[14:0] & ~{15{clr}};






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

module tcu_sigmux_ctl_msff_ctl_macro__clr__1__width_1 (
  din, 
  clr_, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr_;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{(~clr_)}};






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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__clr_1__width_1 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0] & ~{1{clr}};






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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_16 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = (din[15:0] & {16{en}}) | (dout[15:0] & ~{16{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_13 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = (din[12:0] & {13{en}}) | (dout[12:0] & ~{13{en}});






dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__width_7 (
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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_8 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}}) | (dout[7:0] & ~{8{en}});






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

module tcu_sigmux_ctl_msff_ctl_macro__width_2 (
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

module tcu_sigmux_ctl_msff_ctl_macro__width_3 (
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

module tcu_sigmux_ctl_msff_ctl_macro__en_1__width_21 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [20:0] fdin;
wire [19:0] so;

  input [20:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [20:0] dout;
  output scan_out;
assign fdin[20:0] = (din[20:0] & {21{en}}) | (dout[20:0] & ~{21{en}});






dff #(21)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[20:0]),
.si({scan_in,so[19:0]}),
.so({so[19:0],scan_out}),
.q(dout[20:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tcu_sigmux_ctl_spare_ctl_macro__flops_0__num_9;
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



endmodule






// any PARAMS parms go into naming of macro

module tcu_sigmux_ctl_msff_ctl_macro__scanreverse_1__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [0:7] so;

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
.si({so[0:7],scan_in}),
.so({scan_out,so[0:7]}),
.q(dout[8:0])
);












endmodule








