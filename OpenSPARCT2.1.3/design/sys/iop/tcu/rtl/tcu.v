// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu.v
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
`define CNT_ADDR_HI 14
`define CNT_ADDR_LO 12
`define IAB_ADDR_HI 11
`define IAB_ADDR_LO 9
`define DAB_ADDR_HI 8
`define DAB_ADDR_LO 6
`define EXT_ADDR_HI 5
`define EXT_ADDR_LO 3
`define AE_ADDR_HI 2
`define AE_ADDR_LO 0

//debug event codes
`define WATCH_POINT 2'b00  
`define HARD_STOP 2'b01
`define SOFT_STOP 2'b10
`define START_COUNT 2'b11

//debug event status bit location
`define CNT 4
`define IAB 3
`define DAB 2
`define EXT 1
`define AE 0

// UCB defines, copied from Niagara iop/include/sys.h or iop.h
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0
`define UCB_READ_ACK         4'b0001
`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_ACK        4'b0010
`define UCB_WRITE_REQ        4'b0101
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BID_TAP          2'b01
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define PCX_SZ_8B    3'b011  // encoding for 8B access

// MBIST Defines
`define NUM_TOTAL_MBIST_M1			47
`define NUM_TOTAL_MBIST				48

`define NUM_TOTAL_LBIST				8
`define NUM_TOTAL_LBIST_M1			7

`define MBIST_IDLE       4'd0
`define POR_CLR_DF       4'd1
`define POR_START        4'd2
`define POR_CLR_START    4'd3
`define POR_END_WAIT     4'd4
`define WMR_DUMMY        4'd5
`define WMR_CLR_DF       4'd6
`define WMR_START        4'd7
`define WMR_CLR_START    4'd8
`define WMR_END_WAIT     4'd9
`define BISX_CLR_DF      4'd10
`define BISX_START       4'd11
`define BISX_CLR_START   4'd12



module tcu (
  gclk, 
  ccu_cmp_io_sync_en, 
  ccu_io_cmp_sync_en, 
  ccu_cmp_io2x_sync_en, 
  ccu_cmp_dr_sync_en, 
  ccu_io_out, 
  cluster_arst_l, 
  tcu_ccu_clk_stop, 
  tcu_ccu_io_clk_stop, 
  io_test_mode, 
  jtag_revid_out, 
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
  io_tms, 
  io_tdi, 
  io_trst_l, 
  io_tck, 
  tcu_mio_tdo, 
  tcu_mio_tdo_en, 
  tcu_ncu_stall, 
  ncu_tcu_vld, 
  ncu_tcu_data, 
  tcu_ncu_vld, 
  tcu_ncu_data, 
  ncu_tcu_stall, 
  tcu_sck_bypass, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_scan_en, 
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
  tcu_spc0_clk_stop, 
  tcu_spc1_clk_stop, 
  tcu_spc2_clk_stop, 
  tcu_spc3_clk_stop, 
  tcu_spc4_clk_stop, 
  tcu_spc5_clk_stop, 
  tcu_spc6_clk_stop, 
  tcu_spc7_clk_stop, 
  tcu_l2d0_clk_stop, 
  tcu_l2d1_clk_stop, 
  tcu_l2d2_clk_stop, 
  tcu_l2d3_clk_stop, 
  tcu_l2d4_clk_stop, 
  tcu_l2d5_clk_stop, 
  tcu_l2d6_clk_stop, 
  tcu_l2d7_clk_stop, 
  tcu_l2t0_clk_stop, 
  tcu_l2t1_clk_stop, 
  tcu_l2t2_clk_stop, 
  tcu_l2t3_clk_stop, 
  tcu_l2t4_clk_stop, 
  tcu_l2t5_clk_stop, 
  tcu_l2t6_clk_stop, 
  tcu_l2t7_clk_stop, 
  tcu_l2b0_clk_stop, 
  tcu_l2b1_clk_stop, 
  tcu_l2b2_clk_stop, 
  tcu_l2b3_clk_stop, 
  tcu_l2b4_clk_stop, 
  tcu_l2b5_clk_stop, 
  tcu_l2b6_clk_stop, 
  tcu_l2b7_clk_stop, 
  tcu_mcu0_clk_stop, 
  tcu_mcu0_dr_clk_stop, 
  tcu_mcu0_io_clk_stop, 
  tcu_mcu0_fbd_clk_stop, 
  tcu_mcu1_clk_stop, 
  tcu_mcu1_dr_clk_stop, 
  tcu_mcu1_io_clk_stop, 
  tcu_mcu1_fbd_clk_stop, 
  tcu_mcu2_clk_stop, 
  tcu_mcu2_dr_clk_stop, 
  tcu_mcu2_io_clk_stop, 
  tcu_mcu2_fbd_clk_stop, 
  tcu_mcu3_clk_stop, 
  tcu_mcu3_dr_clk_stop, 
  tcu_mcu3_io_clk_stop, 
  tcu_mcu3_fbd_clk_stop, 
  tcu_ccx_clk_stop, 
  tcu_sii_clk_stop, 
  tcu_sii_io_clk_stop, 
  tcu_sio_clk_stop, 
  tcu_sio_io_clk_stop, 
  tcu_ncu_clk_stop, 
  tcu_ncu_io_clk_stop, 
  tcu_efu_clk_stop, 
  tcu_efu_io_clk_stop, 
  tcu_rst_clk_stop, 
  tcu_rst_io_clk_stop, 
  tcu_dmu_io_clk_stop, 
  tcu_rdp_io_clk_stop, 
  tcu_mac_io_clk_stop, 
  tcu_rtx_io_clk_stop, 
  tcu_tds_io_clk_stop, 
  tcu_peu_pc_clk_stop, 
  tcu_peu_io_clk_stop, 
  tcu_mcu_testmode, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_sii_data, 
  tcu_sii_vld, 
  sio_tcu_data, 
  sio_tcu_vld, 
  tcu_efu_rowaddr, 
  tcu_efu_coladdr, 
  tcu_efu_read_en, 
  tcu_efu_read_mode, 
  tcu_efu_read_start, 
  tcu_efu_fuse_bypass, 
  tcu_efu_dest_sample, 
  tcu_efu_data_in, 
  efu_tcu_data_out, 
  tcu_efu_updatedr, 
  tcu_efu_shiftdr, 
  tcu_efu_capturedr, 
  tck, 
  tcu_efu_rvclr, 
  tcu_rst_efu_done, 
  tcu_test_protect, 
  tcu_dbr_gateoff, 
  tcu_spc_mbist_start, 
  tcu_mbist_bisi_en, 
  tcu_mbist_user_mode, 
  spc0_tcu_mbist_done, 
  spc0_tcu_mbist_fail, 
  spc0_tcu_mbist_scan_in, 
  tcu_spc0_mbist_scan_out, 
  spc1_tcu_mbist_done, 
  spc1_tcu_mbist_fail, 
  spc1_tcu_mbist_scan_in, 
  tcu_spc1_mbist_scan_out, 
  spc2_tcu_mbist_done, 
  spc2_tcu_mbist_fail, 
  spc2_tcu_mbist_scan_in, 
  tcu_spc2_mbist_scan_out, 
  spc3_tcu_mbist_done, 
  spc3_tcu_mbist_fail, 
  spc3_tcu_mbist_scan_in, 
  tcu_spc3_mbist_scan_out, 
  spc4_tcu_mbist_done, 
  spc4_tcu_mbist_fail, 
  spc4_tcu_mbist_scan_in, 
  tcu_spc4_mbist_scan_out, 
  spc5_tcu_mbist_done, 
  spc5_tcu_mbist_fail, 
  spc5_tcu_mbist_scan_in, 
  tcu_spc5_mbist_scan_out, 
  spc6_tcu_mbist_done, 
  spc6_tcu_mbist_fail, 
  spc6_tcu_mbist_scan_in, 
  tcu_spc6_mbist_scan_out, 
  spc7_tcu_mbist_done, 
  spc7_tcu_mbist_fail, 
  spc7_tcu_mbist_scan_in, 
  tcu_spc7_mbist_scan_out, 
  tcu_sii_mbist_start, 
  tcu_sii_mbist_scan_in, 
  sii_tcu_mbist_done, 
  sii_tcu_mbist_fail, 
  sii_tcu_mbist_scan_out, 
  tcu_sio_mbist_start, 
  tcu_sio_mbist_scan_in, 
  sio_tcu_mbist_done, 
  sio_tcu_mbist_fail, 
  sio_tcu_mbist_scan_out, 
  tcu_ncu_mbist_start, 
  tcu_ncu_mbist_scan_in, 
  ncu_tcu_mbist_done, 
  ncu_tcu_mbist_fail, 
  ncu_tcu_mbist_scan_out, 
  tcu_mcu0_mbist_start, 
  tcu_mcu0_mbist_scan_in, 
  mcu0_tcu_mbist_done, 
  mcu0_tcu_mbist_fail, 
  mcu0_tcu_mbist_scan_out, 
  tcu_mcu1_mbist_start, 
  tcu_mcu1_mbist_scan_in, 
  mcu1_tcu_mbist_done, 
  mcu1_tcu_mbist_fail, 
  mcu1_tcu_mbist_scan_out, 
  tcu_mcu2_mbist_start, 
  tcu_mcu2_mbist_scan_in, 
  mcu2_tcu_mbist_done, 
  mcu2_tcu_mbist_fail, 
  mcu2_tcu_mbist_scan_out, 
  tcu_mcu3_mbist_start, 
  tcu_mcu3_mbist_scan_in, 
  mcu3_tcu_mbist_done, 
  mcu3_tcu_mbist_fail, 
  mcu3_tcu_mbist_scan_out, 
  tcu_l2b0_mbist_start, 
  tcu_l2b0_mbist_scan_in, 
  l2b0_tcu_mbist_done, 
  l2b0_tcu_mbist_fail, 
  l2b0_tcu_mbist_scan_out, 
  tcu_l2b1_mbist_start, 
  tcu_l2b1_mbist_scan_in, 
  l2b1_tcu_mbist_done, 
  l2b1_tcu_mbist_fail, 
  l2b1_tcu_mbist_scan_out, 
  tcu_l2b2_mbist_start, 
  tcu_l2b2_mbist_scan_in, 
  l2b2_tcu_mbist_done, 
  l2b2_tcu_mbist_fail, 
  l2b2_tcu_mbist_scan_out, 
  tcu_l2b3_mbist_start, 
  tcu_l2b3_mbist_scan_in, 
  l2b3_tcu_mbist_done, 
  l2b3_tcu_mbist_fail, 
  l2b3_tcu_mbist_scan_out, 
  tcu_l2b4_mbist_start, 
  tcu_l2b4_mbist_scan_in, 
  l2b4_tcu_mbist_done, 
  l2b4_tcu_mbist_fail, 
  l2b4_tcu_mbist_scan_out, 
  tcu_l2b5_mbist_start, 
  tcu_l2b5_mbist_scan_in, 
  l2b5_tcu_mbist_done, 
  l2b5_tcu_mbist_fail, 
  l2b5_tcu_mbist_scan_out, 
  tcu_l2b6_mbist_start, 
  tcu_l2b6_mbist_scan_in, 
  l2b6_tcu_mbist_done, 
  l2b6_tcu_mbist_fail, 
  l2b6_tcu_mbist_scan_out, 
  tcu_l2b7_mbist_start, 
  tcu_l2b7_mbist_scan_in, 
  l2b7_tcu_mbist_done, 
  l2b7_tcu_mbist_fail, 
  l2b7_tcu_mbist_scan_out, 
  tcu_l2t0_mbist_start, 
  tcu_l2t0_mbist_scan_in, 
  l2t0_tcu_mbist_done, 
  l2t0_tcu_mbist_fail, 
  l2t0_tcu_mbist_scan_out, 
  tcu_l2t1_mbist_start, 
  tcu_l2t1_mbist_scan_in, 
  l2t1_tcu_mbist_done, 
  l2t1_tcu_mbist_fail, 
  l2t1_tcu_mbist_scan_out, 
  tcu_l2t2_mbist_start, 
  tcu_l2t2_mbist_scan_in, 
  l2t2_tcu_mbist_done, 
  l2t2_tcu_mbist_fail, 
  l2t2_tcu_mbist_scan_out, 
  tcu_l2t3_mbist_start, 
  tcu_l2t3_mbist_scan_in, 
  l2t3_tcu_mbist_done, 
  l2t3_tcu_mbist_fail, 
  l2t3_tcu_mbist_scan_out, 
  tcu_l2t4_mbist_start, 
  tcu_l2t4_mbist_scan_in, 
  l2t4_tcu_mbist_done, 
  l2t4_tcu_mbist_fail, 
  l2t4_tcu_mbist_scan_out, 
  tcu_l2t5_mbist_start, 
  tcu_l2t5_mbist_scan_in, 
  l2t5_tcu_mbist_done, 
  l2t5_tcu_mbist_fail, 
  l2t5_tcu_mbist_scan_out, 
  tcu_l2t6_mbist_start, 
  tcu_l2t6_mbist_scan_in, 
  l2t6_tcu_mbist_done, 
  l2t6_tcu_mbist_fail, 
  l2t6_tcu_mbist_scan_out, 
  tcu_l2t7_mbist_start, 
  tcu_l2t7_mbist_scan_in, 
  l2t7_tcu_mbist_done, 
  l2t7_tcu_mbist_fail, 
  l2t7_tcu_mbist_scan_out, 
  tcu_dmu_mbist_start, 
  tcu_dmu_mbist_scan_in, 
  dmu_tcu_mbist_done, 
  dmu_tcu_mbist_fail, 
  dmu_tcu_mbist_scan_out, 
  tcu_peu_mbist_start, 
  tcu_peu_mbist_scan_in, 
  peu_tcu_mbist_done, 
  peu_tcu_mbist_fail, 
  peu_tcu_mbist_scan_out, 
  tcu_rdp_rdmc_mbist_start, 
  tcu_rtx_rxc_ipp0_mbist_start, 
  tcu_rtx_rxc_ipp1_mbist_start, 
  tcu_rtx_rxc_mb5_mbist_start, 
  tcu_rtx_rxc_mb6_mbist_start, 
  tcu_rtx_rxc_zcp0_mbist_start, 
  tcu_rtx_rxc_zcp1_mbist_start, 
  tcu_rtx_txc_txe0_mbist_start, 
  tcu_rtx_txc_txe1_mbist_start, 
  tcu_tds_smx_mbist_start, 
  tcu_tds_tdmc_mbist_start, 
  rtx_mbist_scan_in, 
  rdp_rdmc_mbist_scan_in, 
  tds_mbist_scan_in, 
  rtx_mbist_scan_out, 
  rdp_rdmc_mbist_scan_out, 
  tds_mbist_scan_out, 
  rdp_rdmc_tcu_mbist_done, 
  rtx_rxc_ipp0_tcu_mbist_done, 
  rtx_rxc_ipp1_tcu_mbist_done, 
  rtx_rxc_mb5_tcu_mbist_done, 
  rtx_rxc_mb6_tcu_mbist_done, 
  rtx_rxc_zcp0_tcu_mbist_done, 
  rtx_rxc_zcp1_tcu_mbist_done, 
  rtx_txc_txe0_tcu_mbist_done, 
  rtx_txc_txe1_tcu_mbist_done, 
  tds_smx_tcu_mbist_done, 
  tds_tdmc_tcu_mbist_done, 
  rdp_rdmc_tcu_mbist_fail, 
  rtx_rxc_ipp0_tcu_mbist_fail, 
  rtx_rxc_ipp1_tcu_mbist_fail, 
  rtx_rxc_mb5_tcu_mbist_fail, 
  rtx_rxc_mb6_tcu_mbist_fail, 
  rtx_rxc_zcp0_tcu_mbist_fail, 
  rtx_rxc_zcp1_tcu_mbist_fail, 
  rtx_txc_txe0_tcu_mbist_fail, 
  rtx_txc_txe1_tcu_mbist_fail, 
  tds_smx_tcu_mbist_fail, 
  tds_tdmc_tcu_mbist_fail, 
  dmo_coresel, 
  dmo_dcmuxctl, 
  dmo_icmuxctl, 
  spc4_dmo_dout, 
  spc6_dmo_dout, 
  l2t4_dmo_dout, 
  l2t6_dmo_dout, 
  dmo_l2tsel, 
  dmo_tagmuxctl, 
  rtx_tcu_dmo_data_out, 
  tds_tcu_dmo_dout, 
  rdp_tcu_dmo_dout, 
  tcu_rtx_dmo_ctl, 
  spc0_tcu_shscan_scan_in, 
  tcu_spc0_shscan_scan_out, 
  spc1_tcu_shscan_scan_in, 
  tcu_spc1_shscan_scan_out, 
  spc2_tcu_shscan_scan_in, 
  tcu_spc2_shscan_scan_out, 
  spc3_tcu_shscan_scan_in, 
  tcu_spc3_shscan_scan_out, 
  spc4_tcu_shscan_scan_in, 
  tcu_spc4_shscan_scan_out, 
  spc5_tcu_shscan_scan_in, 
  tcu_spc5_shscan_scan_out, 
  spc6_tcu_shscan_scan_in, 
  tcu_spc6_shscan_scan_out, 
  spc7_tcu_shscan_scan_in, 
  tcu_spc7_shscan_scan_out, 
  tcu_spc_shscan_aclk, 
  tcu_spc_shscan_bclk, 
  tcu_spc_shscan_scan_en, 
  tcu_spc_shscan_pce_ov, 
  tcu_spc0_shscan_clk_stop, 
  tcu_spc1_shscan_clk_stop, 
  tcu_spc2_shscan_clk_stop, 
  tcu_spc3_shscan_clk_stop, 
  tcu_spc4_shscan_clk_stop, 
  tcu_spc5_shscan_clk_stop, 
  tcu_spc6_shscan_clk_stop, 
  tcu_spc7_shscan_clk_stop, 
  tcu_spc_shscanid, 
  l2t0_tcu_shscan_scan_out, 
  tcu_l2t0_shscan_scan_in, 
  l2t1_tcu_shscan_scan_out, 
  tcu_l2t1_shscan_scan_in, 
  l2t2_tcu_shscan_scan_out, 
  tcu_l2t2_shscan_scan_in, 
  l2t3_tcu_shscan_scan_out, 
  tcu_l2t3_shscan_scan_in, 
  l2t4_tcu_shscan_scan_out, 
  tcu_l2t4_shscan_scan_in, 
  l2t5_tcu_shscan_scan_out, 
  tcu_l2t5_shscan_scan_in, 
  l2t6_tcu_shscan_scan_out, 
  tcu_l2t6_shscan_scan_in, 
  l2t7_tcu_shscan_scan_out, 
  tcu_l2t7_shscan_scan_in, 
  tcu_l2t_shscan_aclk, 
  tcu_l2t_shscan_bclk, 
  tcu_l2t_shscan_scan_en, 
  tcu_l2t_shscan_pce_ov, 
  tcu_l2t0_shscan_clk_stop, 
  tcu_l2t1_shscan_clk_stop, 
  tcu_l2t2_shscan_clk_stop, 
  tcu_l2t3_shscan_clk_stop, 
  tcu_l2t4_shscan_clk_stop, 
  tcu_l2t5_shscan_clk_stop, 
  tcu_l2t6_shscan_clk_stop, 
  tcu_l2t7_shscan_clk_stop, 
  tcu_ss_mode, 
  tcu_do_mode, 
  tcu_ss_request, 
  spc0_ss_complete, 
  spc1_ss_complete, 
  spc2_ss_complete, 
  spc3_ss_complete, 
  spc4_ss_complete, 
  spc5_ss_complete, 
  spc6_ss_complete, 
  spc7_ss_complete, 
  spc0_softstop_request, 
  spc1_softstop_request, 
  spc2_softstop_request, 
  spc3_softstop_request, 
  spc4_softstop_request, 
  spc5_softstop_request, 
  spc6_softstop_request, 
  spc7_softstop_request, 
  spc0_hardstop_request, 
  spc1_hardstop_request, 
  spc2_hardstop_request, 
  spc3_hardstop_request, 
  spc4_hardstop_request, 
  spc5_hardstop_request, 
  spc6_hardstop_request, 
  spc7_hardstop_request, 
  spc0_ncu_core_running_status, 
  spc1_ncu_core_running_status, 
  spc2_ncu_core_running_status, 
  spc3_ncu_core_running_status, 
  spc4_ncu_core_running_status, 
  spc5_ncu_core_running_status, 
  spc6_ncu_core_running_status, 
  spc7_ncu_core_running_status, 
  spc0_trigger_pulse, 
  spc1_trigger_pulse, 
  spc2_trigger_pulse, 
  spc3_trigger_pulse, 
  spc4_trigger_pulse, 
  spc5_trigger_pulse, 
  spc6_trigger_pulse, 
  spc7_trigger_pulse, 
  rst_tcu_flush_init_req, 
  rst_tcu_flush_stop_req, 
  rst_tcu_asicflush_stop_req, 
  tcu_rst_asicflush_stop_ack, 
  tcu_rst_flush_init_ack, 
  tcu_rst_flush_stop_ack, 
  rst_wmr_protect, 
  tcu_bisx_done, 
  tcu_rst_scan_mode, 
  POR_, 
  rst_tcu_clk_stop, 
  rst_tcu_dbr_gen, 
  ncu_spc0_core_available, 
  ncu_spc1_core_available, 
  ncu_spc2_core_available, 
  ncu_spc3_core_available, 
  ncu_spc4_core_available, 
  ncu_spc5_core_available, 
  ncu_spc6_core_available, 
  ncu_spc7_core_available, 
  ncu_tcu_bank_avail, 
  ncu_spc0_core_enable_status, 
  ncu_spc1_core_enable_status, 
  ncu_spc2_core_enable_status, 
  ncu_spc3_core_enable_status, 
  ncu_spc4_core_enable_status, 
  ncu_spc5_core_enable_status, 
  ncu_spc6_core_enable_status, 
  ncu_spc7_core_enable_status, 
  ncu_spc_pm, 
  ncu_spc_ba01, 
  ncu_spc_ba23, 
  ncu_spc_ba45, 
  ncu_spc_ba67, 
  tcu_se_scancollar_in, 
  tcu_se_scancollar_out, 
  tcu_array_bypass, 
  tcu_array_wr_inhibit, 
  tcu_mio_pins_scan_out, 
  tcu_mio_dmo_data, 
  tcu_mio_mbist_done, 
  tcu_mio_mbist_fail, 
  tcu_mio_trigout, 
  tcu_mio_jtag_membist_mode, 
  tcu_mio_clk_stop, 
  tcu_mio_bs_scan_in, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_mode_ctl, 
  tcu_mio_dmo_sync, 
  tcu_stciclk, 
  tcu_stcicfg, 
  tcu_stcid, 
  stciq_tcu, 
  tcu_srd_atpgse, 
  tcu_srd_atpgd, 
  tcu_srd_atpgmode, 
  srd_tcu_atpgq, 
  tcu_sbs_enbstx, 
  tcu_sbs_enbsrx, 
  tcu_sbs_scan_en, 
  tcu_sbs_clk, 
  tcu_sbs_aclk, 
  tcu_sbs_bclk, 
  tcu_sbs_uclk, 
  tcu_sbs_scan_in, 
  tcu_sbs_acmode, 
  tcu_sbs_actestsignal, 
  tcu_sbs_enbspt, 
  tcu_sbs_bsinitclk, 
  tcu_peu_entestcfg, 
  sbs_tcu_scan_out, 
  tcu_mio_scan_out31, 
  mio_tcu_scan_in31, 
  mio_tcu_stciclk, 
  mio_tcu_stcicfg, 
  mio_tcu_stcid, 
  tcu_mio_stciq, 
  mio_tcu_io_ac_testmode, 
  mio_tcu_io_ac_testtrig, 
  mio_tcu_io_aclk, 
  mio_tcu_io_bclk, 
  mio_tcu_io_scan_in, 
  mio_tcu_io_scan_en, 
  mio_tcu_trigin, 
  mio_tcu_bs_scan_out, 
  mio_ext_cmp_clk, 
  mio_ext_dr_clk, 
  mio_tcu_peu_clk_ext, 
  mio_tcu_niu_clk_ext, 
  tcu_peu_clk_ext, 
  tcu_ccu_ext_cmp_clk, 
  tcu_ccu_ext_dr_clk, 
  mac_125rx_test_clk, 
  mac_125tx_test_clk, 
  mac_156rx_test_clk, 
  mac_156tx_test_clk, 
  mac_312rx_test_clk, 
  mac_312tx_test_clk, 
  tcu_peu_testmode, 
  tcu_mac_testmode, 
  mio_tcu_divider_bypass, 
  mio_tcu_pll_cmp_bypass, 
  tcu_div_bypass, 
  tcu_ccu_mux_sel, 
  tcu_ccu_clk_stretch, 
  tcu_mio_bs_highz_l, 
  dbg1_tcu_soc_hard_stop, 
  dbg1_tcu_soc_asrt_trigout, 
  tcu_db0_clk_stop, 
  tcu_db1_clk_stop, 
  tcu_spc_lbist_start, 
  tcu_spc_lbist_scan_in, 
  tcu_spc_lbist_pgm, 
  tcu_spc0_test_mode, 
  tcu_spc1_test_mode, 
  tcu_spc2_test_mode, 
  tcu_spc3_test_mode, 
  tcu_spc4_test_mode, 
  tcu_spc5_test_mode, 
  tcu_spc6_test_mode, 
  tcu_spc7_test_mode, 
  tcu_atpg_mode, 
  spc0_tcu_lbist_done, 
  spc1_tcu_lbist_done, 
  spc2_tcu_lbist_done, 
  spc3_tcu_lbist_done, 
  spc4_tcu_lbist_done, 
  spc5_tcu_lbist_done, 
  spc6_tcu_lbist_done, 
  spc7_tcu_lbist_done, 
  spc0_tcu_lbist_scan_out, 
  spc1_tcu_lbist_scan_out, 
  spc2_tcu_lbist_scan_out, 
  spc3_tcu_lbist_scan_out, 
  spc4_tcu_lbist_scan_out, 
  spc5_tcu_lbist_scan_out, 
  spc6_tcu_lbist_scan_out, 
  spc7_tcu_lbist_scan_out);
wire io_aclk;
wire io_bclk;
wire io_scan_en;
wire io_ac_test_mode;
wire io_ac_testtrig;
wire [30:0] io_scan_in;
wire [30:0] tcu_pins_scan_out;
wire l2clk;
wire cmp_io_sync_en;
wire io_cmp_sync_en;
wire cmp_io2x_sync_en;
wire cmp_dr_sync_en;
wire aclk0_unused;
wire bclk0_unused;
wire clkgen_tcu_cmp_scan_out;
wire pce_ov0_unused;
wire aclk_wmr0_unused;
wire wmr_protect0_unused;
wire wmr0_unused;
wire por0_unused;
wire awi0_unused;
wire tcu_int_se;
wire clkgen_tcu_cmp_scan_in;
wire tcu_int_aclk;
wire tcu_int_bclk;
wire iol2clk;
wire cmp_slow_sync_en_unused;
wire slow_cmp_sync_en_unused;
wire aclk1_unused;
wire bclk1_unused;
wire clkgen_tcu_io_scan_out;
wire pce_ov1_unused;
wire aclk_wmr1_unused;
wire wmr_protect1_unused;
wire wmr1_unused;
wire por1_unused;
wire awi1_unused;
wire clkgen_tcu_io_scan_in;
wire [47:0] tcu_mbist_start;
wire sigmux_ctl_scan_in;
wire sigmux_ctl_scan_out;
wire spc0_tap_mb_scan_in;
wire spc1_tap_mb_scan_in;
wire spc2_tap_mb_scan_in;
wire spc3_tap_mb_scan_in;
wire spc4_tap_mb_scan_in;
wire spc5_tap_mb_scan_in;
wire spc6_tap_mb_scan_in;
wire spc7_tap_mb_scan_in;
wire jtag_ctl_scan_in;
wire jtag_ctl_scan_out;
wire mbist_ctl_scan_in;
wire tcu_int_pce_ov;
wire [47:0] mb_tcu_done;
wire [47:0] mb_tcu_fail;
wire [7:0] core_avail;
wire mbist_ctl_scan_out;
wire ucb_ctl_scan_in;
wire ucb_ctl_scan_out;
wire clkstp_ctl_scan_in;
wire clkstp_ctl_scan_out;
wire regs_ctl_scan_in;
wire regs_ctl_scan_out;
wire chop_aclk;
wire chop_bclk;
wire [7:0] lb_tcu_done;
wire tcu_scan_chain;
wire mbist_clk_stop;
wire tck_clk_tree;
wire jtag_sbs_scan_in;
wire jtag_ser_scan_q;
wire clk_stop_ac_trans_counter_initiated;
wire ac_test_mode;
wire [23:0] debug_reg_hard_stop_domain_1st;
wire debug_cycle_counter_stop;
wire debug_event_stop;
wire spc_ss_mode;
wire [7:0] spc_ss_sel;
wire instr_sstop_csmode;
wire jtag_clk_stop_req;
wire jtagclkstop_ov;
wire flush_test_protect;
wire tcu_test_protect_cmp;
wire jtag_sck_byp;
wire jtag_por_enable;
wire jtag_por_status;
wire jtag_efu_clear_instr;
wire [6:0] jtag_efu_rvclr;
wire jt_scan_in;
wire jt_scan_en;
wire jt_scan_aclk;
wire jt_scan_bclk;
wire ser_scan_out;
wire chain_select;
wire [4:0] sel_chain;
wire tap_spc0_mb_aclk;
wire tap_spc0_mb_bclk;
wire tap_spc0_mb_scan_en;
wire tap_spc0_mb_clk_stop;
wire tap_spc1_mb_aclk;
wire tap_spc1_mb_bclk;
wire tap_spc1_mb_scan_en;
wire tap_spc1_mb_clk_stop;
wire tap_spc2_mb_aclk;
wire tap_spc2_mb_bclk;
wire tap_spc2_mb_scan_en;
wire tap_spc2_mb_clk_stop;
wire tap_spc3_mb_aclk;
wire tap_spc3_mb_bclk;
wire tap_spc3_mb_scan_en;
wire tap_spc3_mb_clk_stop;
wire tap_spc4_mb_aclk;
wire tap_spc4_mb_bclk;
wire tap_spc4_mb_scan_en;
wire tap_spc4_mb_clk_stop;
wire tap_spc5_mb_aclk;
wire tap_spc5_mb_bclk;
wire tap_spc5_mb_scan_en;
wire tap_spc5_mb_clk_stop;
wire tap_spc6_mb_aclk;
wire tap_spc6_mb_bclk;
wire tap_spc6_mb_scan_en;
wire tap_spc6_mb_clk_stop;
wire tap_spc7_mb_aclk;
wire tap_spc7_mb_bclk;
wire tap_spc7_mb_scan_en;
wire tap_spc7_mb_clk_stop;
wire tcu_jtag_flush_req;
wire tcu_jtag_flush_dly_req;
wire jtag_mt_enable;
wire tcu_jtag_se;
wire tcu_int_ce;
wire tcu_int_ce_to_ucb;
wire tcu_jtag_aclk;
wire pre_spc0_clk_stop;
wire pre_spc1_clk_stop;
wire pre_spc2_clk_stop;
wire pre_spc3_clk_stop;
wire pre_spc4_clk_stop;
wire pre_spc5_clk_stop;
wire pre_spc6_clk_stop;
wire pre_spc7_clk_stop;
wire pre_bnk0_clk_stop;
wire pre_l2t0_clk_stop;
wire pre_bnk1_clk_stop;
wire pre_l2t1_clk_stop;
wire pre_bnk2_clk_stop;
wire pre_l2t2_clk_stop;
wire pre_bnk3_clk_stop;
wire pre_l2t3_clk_stop;
wire pre_bnk4_clk_stop;
wire pre_l2t4_clk_stop;
wire pre_bnk5_clk_stop;
wire pre_l2t5_clk_stop;
wire pre_bnk6_clk_stop;
wire pre_l2t6_clk_stop;
wire pre_bnk7_clk_stop;
wire pre_l2t7_clk_stop;
wire pre_mcu0_clk_stop;
wire pre_mcu0_io_clk_stop;
wire pre_mcu0_dr_clk_stop;
wire pre_mcu0_fbd_clk_stop;
wire pre_mcu1_clk_stop;
wire pre_mcu1_io_clk_stop;
wire pre_mcu1_dr_clk_stop;
wire pre_mcu1_fbd_clk_stop;
wire pre_mcu2_clk_stop;
wire pre_mcu2_io_clk_stop;
wire pre_mcu2_dr_clk_stop;
wire pre_mcu2_fbd_clk_stop;
wire pre_mcu3_clk_stop;
wire pre_mcu3_io_clk_stop;
wire pre_mcu3_dr_clk_stop;
wire pre_mcu3_fbd_clk_stop;
wire pre_soc0_clk_stop;
wire pre_soc0_io_clk_stop;
wire pre_soc1_io_clk_stop;
wire pre_soc2_io_clk_stop;
wire pre_soc3_clk_stop;
wire pre_soc3_io_clk_stop;
wire ac_trans_test_counter_start;
wire tap_spc0_mb_scan_out;
wire tap_spc1_mb_scan_out;
wire tap_spc2_mb_scan_out;
wire tap_spc3_mb_scan_out;
wire tap_spc4_mb_scan_out;
wire tap_spc5_mb_scan_out;
wire tap_spc6_mb_scan_out;
wire tap_spc7_mb_scan_out;
wire tap_spc0_shscan_scan_out;
wire spc7_tap_shscan_scan_in;
wire [2:0] jtag_spc_shscanid;
wire jtag_spc0_shscan_clk_stop;
wire jtag_spc1_shscan_clk_stop;
wire jtag_spc2_shscan_clk_stop;
wire jtag_spc3_shscan_clk_stop;
wire jtag_spc4_shscan_clk_stop;
wire jtag_spc5_shscan_clk_stop;
wire jtag_spc6_shscan_clk_stop;
wire jtag_spc7_shscan_clk_stop;
wire jtag_spc_shscan_pce_ov;
wire jtag_l2t0_shscan_clk_stop;
wire jtag_l2t1_shscan_clk_stop;
wire jtag_l2t2_shscan_clk_stop;
wire jtag_l2t3_shscan_clk_stop;
wire jtag_l2t4_shscan_clk_stop;
wire jtag_l2t5_shscan_clk_stop;
wire jtag_l2t6_shscan_clk_stop;
wire jtag_l2t7_shscan_clk_stop;
wire jtag_l2t_shscan_pce_ov;
wire [7:0] bank_avail;
wire jtag_upd_cntdly;
wire [6:0] jtag_cntdly_data;
wire [6:0] csdel_data;
wire clkseq_stop;
wire clkseq_strt;
wire cycle_stretch;
wire wmr_two;
wire start_bisx_por;
wire start_bisx_wmr;
wire stop_bisx_wmr;
wire instr_mbist_diag;
wire soc_mbist_aclk;
wire soc_mbist_bclk;
wire soc_mbist_scan_en;
wire soc0_mbist_clk_stop;
wire mcu0_mbist_clk_stop;
wire mcu1_mbist_clk_stop;
wire mcu2_mbist_clk_stop;
wire mcu3_mbist_clk_stop;
wire l2b0_mbist_clk_stop;
wire l2b1_mbist_clk_stop;
wire l2b2_mbist_clk_stop;
wire l2b3_mbist_clk_stop;
wire l2b4_mbist_clk_stop;
wire l2b5_mbist_clk_stop;
wire l2b6_mbist_clk_stop;
wire l2b7_mbist_clk_stop;
wire l2t0_mbist_clk_stop;
wire l2t1_mbist_clk_stop;
wire l2t2_mbist_clk_stop;
wire l2t3_mbist_clk_stop;
wire l2t4_mbist_clk_stop;
wire l2t5_mbist_clk_stop;
wire l2t6_mbist_clk_stop;
wire l2t7_mbist_clk_stop;
wire dmu_mbist_clk_stop;
wire peu_mbist_clk_stop;
wire rdp_mbist_clk_stop;
wire rtx_mbist_clk_stop;
wire tds_mbist_clk_stop;
wire ucb_csr_wr;
wire [5:0] ucb_csr_addr;
wire [63:0] ucb_data_out;
wire instr_mt_scan_rti;
wire [7:0] lb_tcu_done_d;
wire mbist_clkstpen;
wire [47:0] mbist_done;
wire [47:0] mbist_fail;
wire [1:0] mbist_done_fail;
wire [5:0] jtag_csr_addr;
wire jtag_csr_wr;
wire [39:0] jtag_creg_addr;
wire [63:0] jtag_creg_data;
wire jtag_creg_rd_en;
wire jtag_creg_wr_en;
wire jtag_creg_addr_en;
wire jtag_creg_data_en;
wire ucb_jtag_data_rdy;
wire jtag_ucb_data_ack;
wire [47:0] jtag_csr_data;
wire [64:0] l2access;
wire l2data_upd;
wire l2addr_upd;
wire l2rti;
wire instr_l2_wr;
wire instr_l2_rd;
wire [63:0] l2rddata;
wire l2_read_vld;
wire jtag_clock_start;
wire clock_domain_upd;
wire [23:0] clock_domain;
wire [63:0] spc_crs;
wire [7:0] core_sel;
wire core_sel_upd;
wire [31:0] de_count;
wire [31:0] decnt_data;
wire decnt_upd;
wire [63:0] cycle_count;
wire [63:0] cyc_count;
wire cyc_count_upd;
wire [3:0] tcu_dcr;
wire [3:0] tcudcr_data;
wire tcudcr_upd;
wire [63:0] doss_enab;
wire [63:0] dossen;
wire dossen_upd;
wire [1:0] dossmode;
wire dossmode_upd;
wire [1:0] doss_mode;
wire ssreq_upd;
wire [7:0] doss_stat;
wire csmode;
wire csmode_upd;
wire cs_mode;
wire cs_mode_active;
wire [47:0] dmo_cfg;
wire [47:0] jtag_dmo_control;
wire jtag_dmo_control_upd;
wire jtag_dmo_enable;
wire jtag_test_protect;
wire mbist_clk_stop_req;
wire [63:0] csr_ucb_data;
wire debug_cycle_counter_stop_to_mbc;
wire mbist_clk_stop_to_mbc;
wire cycle_stretch_to_mbc;
wire tcu_int_ce_ucb;
wire tcu_tp_sync_2io;
wire dbg_creg_access;
wire [39:0] dbg_creg_addr;
wire [63:0] dbg_creg_data;
wire dbg_creg_wr_en;
wire dbg_creg_addr_en;
wire dbg_creg_data_en;
wire mt_mode_sync;

   input         gclk;

   // CTRL In (For Pipelining)
   input 	 ccu_cmp_io_sync_en;
   input 	 ccu_io_cmp_sync_en;
   input 	 ccu_cmp_io2x_sync_en;
   input         ccu_cmp_dr_sync_en;
   input 	 ccu_io_out;
   input         cluster_arst_l;
   output    tcu_ccu_clk_stop;
   output    tcu_ccu_io_clk_stop;

   input 	 io_test_mode;// PINDEF:TOP

   input [3:0] jtag_revid_out;

   input [1:0] 	 spc0_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc1_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc2_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc3_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc4_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc5_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc6_tcu_scan_in;// PINDEF:BOT
   input [1:0] 	 spc7_tcu_scan_in;// PINDEF:BOT
   input         soca_tcu_scan_in;
   input         socb_tcu_scan_in;
   input         socc_tcu_scan_in;
   input         socd_tcu_scan_in;
   input         soce_tcu_scan_in;
   input         socf_tcu_scan_in;
   input         socg_tcu_scan_in;
   input         soch_tcu_scan_in;
   input 	 soc0_tcu_scan_in;// PINDEF:BOT
   input 	 soc1_tcu_scan_in;// PINDEF:BOT
   input 	 soc2_tcu_scan_in;// PINDEF:BOT
   input 	 soc3_tcu_scan_in;// PINDEF:BOT
   input 	 soc4_tcu_scan_in;// PINDEF:BOT
   input 	 soc5_tcu_scan_in;// PINDEF:BOT
   input 	 soc6_tcu_scan_in;// PINDEF:BOT
   input 	 peu_tcu_scan_in;
   input 	 ccu_tcu_scan_in;
   input 	 io_tms;// PINDEF:TOP
   input 	 io_tdi;// PINDEF:TOP
   input 	 io_trst_l;// PINDEF:TOP
   input 	 io_tck;// PINDEF:TOP

   output 	 tcu_mio_tdo;
   output 	 tcu_mio_tdo_en;
   
   //ucb NCU bus
   output 	 tcu_ncu_stall;// PINDEF:BOT
   input 	 ncu_tcu_vld;// PINDEF:BOT
   input [7:0] 	 ncu_tcu_data;// PINDEF:BOT
   
   output 	 tcu_ncu_vld;// PINDEF:BOT
   output [7:0]  tcu_ncu_data;// PINDEF:BOT
   input 	 ncu_tcu_stall;// PINDEF:BOT

   output   tcu_sck_bypass;

   //scan signals to chip
   //will need multiple versions of signals for different regions
   output 	 tcu_aclk;// PINDEF:BOT
   output 	 tcu_bclk;// PINDEF:BOT
   output 	 tcu_pce_ov;// PINDEF:BOT
   output 	 tcu_scan_en;// PINDEF:BOT
   output [1:0]  tcu_spc0_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc1_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc2_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc3_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc4_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc5_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc6_scan_out;// PINDEF:BOT
   output [1:0]  tcu_spc7_scan_out;// PINDEF:BOT
   output        tcu_soca_scan_out;
   output        tcu_socb_scan_out;
   output        tcu_socc_scan_out;
   output        tcu_socd_scan_out;
   output        tcu_soce_scan_out;
   output        tcu_socf_scan_out;
   output        tcu_socg_scan_out;
   output        tcu_soch_scan_out;
   output 	 tcu_soc0_scan_out;// PINDEF:BOT
   output 	 tcu_soc1_scan_out;// PINDEF:BOT
   output 	 tcu_soc2_scan_out;// PINDEF:BOT
   output 	 tcu_soc3_scan_out;// PINDEF:BOT
   output 	 tcu_soc4_scan_out;// PINDEF:BOT
   output 	 tcu_soc5_scan_out;// PINDEF:BOT
   output 	 tcu_soc6_scan_out;// PINDEF:BOT
   output 	 tcu_peu_scan_out;
   output 	 tcu_rst_scan_out;
   output        tcu_spc0_aclk;              // PINDEF:TOP
   output        tcu_spc0_bclk;              // PINDEF:TOP
   output        tcu_spc0_scan_en;           // PINDEF:TOP
   output        tcu_spc0_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc0_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc0_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC1
   output        tcu_spc1_aclk;              // PINDEF:TOP  
   output        tcu_spc1_bclk;              // PINDEF:TOP
   output        tcu_spc1_scan_en;           // PINDEF:TOP
   output        tcu_spc1_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc1_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc1_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC2
   output        tcu_spc2_aclk;              // PINDEF:TOP  
   output        tcu_spc2_bclk;              // PINDEF:TOP
   output        tcu_spc2_scan_en;           // PINDEF:TOP
   output        tcu_spc2_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc2_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc2_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC3
   output        tcu_spc3_aclk;              // PINDEF:TOP  
   output        tcu_spc3_bclk;              // PINDEF:TOP
   output        tcu_spc3_scan_en;           // PINDEF:TOP
   output        tcu_spc3_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc3_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc3_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC4
   output        tcu_spc4_aclk;              // PINDEF:TOP  
   output        tcu_spc4_bclk;              // PINDEF:TOP
   output        tcu_spc4_scan_en;           // PINDEF:TOP
   output        tcu_spc4_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc4_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc4_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC5
   output        tcu_spc5_aclk;              // PINDEF:TOP  
   output        tcu_spc5_bclk;              // PINDEF:TOP
   output        tcu_spc5_scan_en;           // PINDEF:TOP
   output        tcu_spc5_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc5_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc5_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC6
   output        tcu_spc6_aclk;              // PINDEF:TOP  
   output        tcu_spc6_bclk;              // PINDEF:TOP
   output        tcu_spc6_scan_en;           // PINDEF:TOP
   output        tcu_spc6_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc6_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc6_array_wr_inhibit;  // PINDEF:TOP
   // Scan Controls to SPC7
   output        tcu_spc7_aclk;              // PINDEF:TOP  
   output        tcu_spc7_bclk;              // PINDEF:TOP
   output        tcu_spc7_scan_en;           // PINDEF:TOP
   output        tcu_spc7_se_scancollar_in;  // PINDEF:TOP
   output        tcu_spc7_se_scancollar_out; // PINDEF:TOP
   output        tcu_spc7_array_wr_inhibit;  // PINDEF:TOP

   // Scan Controls to ASICs (NIU, DMU, PEU)
   // NIU is RDP, MAC, RTX, and TDS
   output        tcu_asic_aclk;              
   output        tcu_asic_bclk;              
   output        tcu_asic_scan_en;           
   output        tcu_asic_se_scancollar_in;  
   output        tcu_asic_se_scancollar_out; 
   output        tcu_asic_array_wr_inhibit;  

   //clkstop outputs
   output 	 tcu_spc0_clk_stop;// PINDEF:BOT
   output 	 tcu_spc1_clk_stop;// PINDEF:BOT
   output 	 tcu_spc2_clk_stop;// PINDEF:BOT
   output 	 tcu_spc3_clk_stop;// PINDEF:BOT
   output 	 tcu_spc4_clk_stop;// PINDEF:BOT
   output 	 tcu_spc5_clk_stop;// PINDEF:BOT
   output 	 tcu_spc6_clk_stop;// PINDEF:BOT
   output 	 tcu_spc7_clk_stop;// PINDEF:BOT
   // L2 Clock Stops
   output        tcu_l2d0_clk_stop;
   output        tcu_l2d1_clk_stop;
   output        tcu_l2d2_clk_stop;
   output        tcu_l2d3_clk_stop;
   output        tcu_l2d4_clk_stop;
   output        tcu_l2d5_clk_stop;
   output        tcu_l2d6_clk_stop;
   output        tcu_l2d7_clk_stop;
   output        tcu_l2t0_clk_stop;
   output        tcu_l2t1_clk_stop;
   output        tcu_l2t2_clk_stop;
   output        tcu_l2t3_clk_stop;
   output        tcu_l2t4_clk_stop;
   output        tcu_l2t5_clk_stop;
   output        tcu_l2t6_clk_stop;
   output        tcu_l2t7_clk_stop;
   output        tcu_l2b0_clk_stop;
   output        tcu_l2b1_clk_stop;
   output        tcu_l2b2_clk_stop;
   output        tcu_l2b3_clk_stop;
   output        tcu_l2b4_clk_stop;
   output        tcu_l2b5_clk_stop;
   output        tcu_l2b6_clk_stop;
   output        tcu_l2b7_clk_stop;
   // MCU Clock Stops
   output        tcu_mcu0_clk_stop;
   output        tcu_mcu0_dr_clk_stop;
   output        tcu_mcu0_io_clk_stop;
   output        tcu_mcu0_fbd_clk_stop;
   output        tcu_mcu1_clk_stop;
   output        tcu_mcu1_dr_clk_stop;
   output        tcu_mcu1_io_clk_stop;
   output        tcu_mcu1_fbd_clk_stop;
   output        tcu_mcu2_clk_stop;
   output        tcu_mcu2_dr_clk_stop;
   output        tcu_mcu2_io_clk_stop;
   output        tcu_mcu2_fbd_clk_stop;
   output        tcu_mcu3_clk_stop;
   output        tcu_mcu3_dr_clk_stop;
   output        tcu_mcu3_io_clk_stop;
   output        tcu_mcu3_fbd_clk_stop;
   // Cluster Clock Stops
   output        tcu_ccx_clk_stop;
   output        tcu_sii_clk_stop;
   output        tcu_sii_io_clk_stop;
   output        tcu_sio_clk_stop;
   output        tcu_sio_io_clk_stop;
   output        tcu_ncu_clk_stop;
   output        tcu_ncu_io_clk_stop;
   output        tcu_efu_clk_stop;
   output        tcu_efu_io_clk_stop;
   output        tcu_rst_clk_stop;
   output        tcu_rst_io_clk_stop;
   // DMU Clock Stops
   output        tcu_dmu_io_clk_stop;
   // NIU Clock Stops
   //output        tcu_niu_io_clk_stop;
   output        tcu_rdp_io_clk_stop;
   output        tcu_mac_io_clk_stop;
   output        tcu_rtx_io_clk_stop;
   output        tcu_tds_io_clk_stop;
   //PEU Clock Stops
   output        tcu_peu_pc_clk_stop;
   output        tcu_peu_io_clk_stop;

   // To control fbd logic in MCU
   output        tcu_mcu_testmode;

   // Decoder and Mux test signals
   output        tcu_dectest; // PINDEF:BOT
   output        tcu_muxtest; // PINDEF:BOT

   // L2 Access via JTAG/SIU
   output        tcu_sii_data; // PINDEF:BOT
   output        tcu_sii_vld;  // PINDEF:BOT
   input         sio_tcu_data; // PINDEF:BOT
   input         sio_tcu_vld;  // PINDEF:BOT
   
   // EFuse TCU/JTAG R/W Interface
   output [6:0]  tcu_efu_rowaddr;// PINDEF:RIGHT 
   output [4:0]  tcu_efu_coladdr;// PINDEF:RIGHT 
   output        tcu_efu_read_en;// PINDEF:RIGHT     
   output [2:0]  tcu_efu_read_mode;// PINDEF:RIGHT     
   output        tcu_efu_read_start;// PINDEF:RIGHT    
   output        tcu_efu_fuse_bypass;// PINDEF:RIGHT   
   output        tcu_efu_dest_sample;// PINDEF:RIGHT

   // EFuse TCU/JTAG Shift Interface
   output        tcu_efu_data_in;// PINDEF:RIGHT        
   input         efu_tcu_data_out; // PINDEF:RIGHT      
   output        tcu_efu_updatedr;  // PINDEF:RIGHT     
   output        tcu_efu_shiftdr; // PINDEF:RIGHT      
   output        tcu_efu_capturedr; // PINDEF:RIGHT
   output        tck;         // PINDEF:RIGHT
   output [6:0]  tcu_efu_rvclr; // PINDEF:RIGHT
   output        tcu_rst_efu_done; // PINDEF:RIGHT

   // During mbist, lbist, jtag scan, trans test may want
   // to block tcu, rst and ccu from seeing random activity
   // from ucb (NCU), SPC's, etc.
   // This signal synch'd to ioclk & set via jtag id for blocking
   output        tcu_test_protect;
   // This signal synch'd to ioclk & set during debug reset
   output        tcu_dbr_gateoff;

// PINS for MBIST
// individual mb_aclk, mb_bclk, mb_scan_en have been replaced by 
//  versions for the cluster where the mbist engine lives
// mb_clk_stop to each core will be replaced with spcx_clk_stop signals

   // MBIST START: Start signals from mbist_ctl sequencer to SPC Cores
   output [7:0] tcu_spc_mbist_start; // PINDEF:BOT
   // Global BISI enable - all mbist engines see this one signal
   output       tcu_mbist_bisi_en; // PINDEF:BOT
   output       tcu_mbist_user_mode; // PINDEF:BOT

   // MBIST - SPC0
   input        spc0_tcu_mbist_done; // PINDEF:BOT
   input        spc0_tcu_mbist_fail; // PINDEF:BOT
   input        spc0_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc0_mbist_scan_out; // PINDEF:BOT  
   // MBIST - SPC1
   input        spc1_tcu_mbist_done; // PINDEF:BOT
   input        spc1_tcu_mbist_fail; // PINDEF:BOT
   input        spc1_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc1_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC2
   input        spc2_tcu_mbist_done; // PINDEF:BOT
   input        spc2_tcu_mbist_fail; // PINDEF:BOT
   input        spc2_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc2_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC3
   input        spc3_tcu_mbist_done; // PINDEF:BOT
   input        spc3_tcu_mbist_fail; // PINDEF:BOT
   input        spc3_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc3_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC4
   input        spc4_tcu_mbist_done; // PINDEF:BOT
   input        spc4_tcu_mbist_fail; // PINDEF:BOT
   input        spc4_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc4_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC5
   input        spc5_tcu_mbist_done; // PINDEF:BOT
   input        spc5_tcu_mbist_fail; // PINDEF:BOT
   input        spc5_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc5_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC6
   input        spc6_tcu_mbist_done; // PINDEF:BOT
   input        spc6_tcu_mbist_fail; // PINDEF:BOT
   input        spc6_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc6_mbist_scan_out; // PINDEF:BOT   
   // MBIST - SPC7
   input        spc7_tcu_mbist_done; // PINDEF:BOT
   input        spc7_tcu_mbist_fail; // PINDEF:BOT
   input        spc7_tcu_mbist_scan_in; // PINDEF:BOT
   output       tcu_spc7_mbist_scan_out; // PINDEF:BOT   

   // MBIST - for SII
   output [1:0] tcu_sii_mbist_start;    // PINDEF:BOT
   output       tcu_sii_mbist_scan_in;  // PINDEF:BOT
   input  [1:0] sii_tcu_mbist_done;     // PINDEF:BOT
   input  [1:0] sii_tcu_mbist_fail;     // PINDEF:BOT
   input        sii_tcu_mbist_scan_out; // PINDEF:BOT
   // MBIST - for SIO
   output [1:0] tcu_sio_mbist_start;    // PINDEF:BOT
   output       tcu_sio_mbist_scan_in;  // PINDEF:BOT
   input  [1:0] sio_tcu_mbist_done;     // PINDEF:BOT
   input  [1:0] sio_tcu_mbist_fail;     // PINDEF:BOT
   input        sio_tcu_mbist_scan_out; // PINDEF:BOT
   // MBIST - for NCU
   output [1:0] tcu_ncu_mbist_start;    // PINDEF:BOT
   output       tcu_ncu_mbist_scan_in;  // PINDEF:BOT
   input  [1:0] ncu_tcu_mbist_done;     // PINDEF:BOT
   input  [1:0] ncu_tcu_mbist_fail;     // PINDEF:BOT
   input        ncu_tcu_mbist_scan_out; // PINDEF:BOT
   // MBIST - for MCU (4 instances):
   output       tcu_mcu0_mbist_start;   // PINDEF:BOT // MCU0
   output       tcu_mcu0_mbist_scan_in; // PINDEF:BOT
   input        mcu0_tcu_mbist_done;    // PINDEF:BOT
   input        mcu0_tcu_mbist_fail;    // PINDEF:BOT
   input        mcu0_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_mcu1_mbist_start;   // PINDEF:BOT // MCU1
   output       tcu_mcu1_mbist_scan_in; // PINDEF:BOT
   input        mcu1_tcu_mbist_done;    // PINDEF:BOT
   input        mcu1_tcu_mbist_fail;    // PINDEF:BOT
   input        mcu1_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_mcu2_mbist_start;   // PINDEF:BOT // MCU2
   output       tcu_mcu2_mbist_scan_in; // PINDEF:BOT
   input        mcu2_tcu_mbist_done;    // PINDEF:BOT
   input        mcu2_tcu_mbist_fail;    // PINDEF:BOT
   input        mcu2_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_mcu3_mbist_start;   // PINDEF:BOT // MCU3
   output       tcu_mcu3_mbist_scan_in; // PINDEF:BOT
   input        mcu3_tcu_mbist_done;    // PINDEF:BOT
   input        mcu3_tcu_mbist_fail;    // PINDEF:BOT
   input        mcu3_tcu_mbist_scan_out;// PINDEF:BOT
   // MBIST - for L2B (8 instances):
   output       tcu_l2b0_mbist_start;   // PINDEF:BOT // L2B0
   output       tcu_l2b0_mbist_scan_in; // PINDEF:BOT
   input        l2b0_tcu_mbist_done;    // PINDEF:BOT
   input        l2b0_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b0_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b1_mbist_start;   // PINDEF:BOT // L2B1
   output       tcu_l2b1_mbist_scan_in; // PINDEF:BOT
   input        l2b1_tcu_mbist_done;    // PINDEF:BOT
   input        l2b1_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b1_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b2_mbist_start;   // PINDEF:BOT // L2B2
   output       tcu_l2b2_mbist_scan_in; // PINDEF:BOT
   input        l2b2_tcu_mbist_done;    // PINDEF:BOT
   input        l2b2_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b2_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b3_mbist_start;   // PINDEF:BOT // L2B3
   output       tcu_l2b3_mbist_scan_in; // PINDEF:BOT
   input        l2b3_tcu_mbist_done;    // PINDEF:BOT
   input        l2b3_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b3_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b4_mbist_start;   // PINDEF:BOT // L2B4
   output       tcu_l2b4_mbist_scan_in; // PINDEF:BOT
   input        l2b4_tcu_mbist_done;    // PINDEF:BOT
   input        l2b4_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b4_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b5_mbist_start;   // PINDEF:BOT // L2B5
   output       tcu_l2b5_mbist_scan_in; // PINDEF:BOT
   input        l2b5_tcu_mbist_done;    // PINDEF:BOT
   input        l2b5_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b5_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b6_mbist_start;   // PINDEF:BOT // L2B6
   output       tcu_l2b6_mbist_scan_in; // PINDEF:BOT
   input        l2b6_tcu_mbist_done;    // PINDEF:BOT
   input        l2b6_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b6_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2b7_mbist_start;   // PINDEF:BOT // L2B7
   output       tcu_l2b7_mbist_scan_in; // PINDEF:BOT
   input        l2b7_tcu_mbist_done;    // PINDEF:BOT
   input        l2b7_tcu_mbist_fail;    // PINDEF:BOT
   input        l2b7_tcu_mbist_scan_out;// PINDEF:BOT
   // MBIST - for L2T (8 instances)
   output       tcu_l2t0_mbist_start;   // PINDEF:BOT // L2T0
   output       tcu_l2t0_mbist_scan_in; // PINDEF:BOT
   input        l2t0_tcu_mbist_done;    // PINDEF:BOT
   input        l2t0_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t0_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t1_mbist_start;   // PINDEF:BOT // L2T1
   output       tcu_l2t1_mbist_scan_in; // PINDEF:BOT
   input        l2t1_tcu_mbist_done;    // PINDEF:BOT
   input        l2t1_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t1_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t2_mbist_start;   // PINDEF:BOT // L2T2
   output       tcu_l2t2_mbist_scan_in; // PINDEF:BOT
   input        l2t2_tcu_mbist_done;    // PINDEF:BOT
   input        l2t2_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t2_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t3_mbist_start;   // PINDEF:BOT // L2T3
   output       tcu_l2t3_mbist_scan_in; // PINDEF:BOT
   input        l2t3_tcu_mbist_done;    // PINDEF:BOT
   input        l2t3_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t3_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t4_mbist_start;   // PINDEF:BOT // L2T4
   output       tcu_l2t4_mbist_scan_in; // PINDEF:BOT
   input        l2t4_tcu_mbist_done;    // PINDEF:BOT
   input        l2t4_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t4_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t5_mbist_start;   // PINDEF:BOT // L2T5
   output       tcu_l2t5_mbist_scan_in; // PINDEF:BOT
   input        l2t5_tcu_mbist_done;    // PINDEF:BOT
   input        l2t5_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t5_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t6_mbist_start;   // PINDEF:BOT // L2T6
   output       tcu_l2t6_mbist_scan_in; // PINDEF:BOT
   input        l2t6_tcu_mbist_done;    // PINDEF:BOT
   input        l2t6_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t6_tcu_mbist_scan_out;// PINDEF:BOT
   output       tcu_l2t7_mbist_start;   // PINDEF:BOT // L2T7
   output       tcu_l2t7_mbist_scan_in; // PINDEF:BOT
   input        l2t7_tcu_mbist_done;    // PINDEF:BOT
   input        l2t7_tcu_mbist_fail;    // PINDEF:BOT
   input        l2t7_tcu_mbist_scan_out;// PINDEF:BOT
   // MBIST - for DMU:
   output [1:0] tcu_dmu_mbist_start;    // PINDEF:BOT
   output       tcu_dmu_mbist_scan_in;  // PINDEF:BOT
   input  [1:0] dmu_tcu_mbist_done;     // PINDEF:BOT
   input  [1:0] dmu_tcu_mbist_fail;     // PINDEF:BOT
   input        dmu_tcu_mbist_scan_out; // PINDEF:BOT
   // MBIST - for PEU:
   output       tcu_peu_mbist_start;    // PINDEF:BOT
   output       tcu_peu_mbist_scan_in;  // PINDEF:BOT
   input        peu_tcu_mbist_done;     // PINDEF:BOT
   input        peu_tcu_mbist_fail;     // PINDEF:BOT
   input        peu_tcu_mbist_scan_out; // PINDEF:BOT
   // MBIST - for NIU:
   output       tcu_rdp_rdmc_mbist_start;
   output       tcu_rtx_rxc_ipp0_mbist_start;
   output       tcu_rtx_rxc_ipp1_mbist_start;
   output       tcu_rtx_rxc_mb5_mbist_start;
   output       tcu_rtx_rxc_mb6_mbist_start;
   output       tcu_rtx_rxc_zcp0_mbist_start;
   output       tcu_rtx_rxc_zcp1_mbist_start;
   output       tcu_rtx_txc_txe0_mbist_start;
   output       tcu_rtx_txc_txe1_mbist_start;
   output       tcu_tds_smx_mbist_start;
   output       tcu_tds_tdmc_mbist_start;

   output       rtx_mbist_scan_in;
   output       rdp_rdmc_mbist_scan_in;
   output       tds_mbist_scan_in;

   input        rtx_mbist_scan_out;
   input        rdp_rdmc_mbist_scan_out;
   input        tds_mbist_scan_out;

   input        rdp_rdmc_tcu_mbist_done;
   input        rtx_rxc_ipp0_tcu_mbist_done;
   input        rtx_rxc_ipp1_tcu_mbist_done;
   input        rtx_rxc_mb5_tcu_mbist_done;
   input        rtx_rxc_mb6_tcu_mbist_done;
   input        rtx_rxc_zcp0_tcu_mbist_done;
   input        rtx_rxc_zcp1_tcu_mbist_done;
   input        rtx_txc_txe0_tcu_mbist_done;
   input        rtx_txc_txe1_tcu_mbist_done;
   input        tds_smx_tcu_mbist_done;
   input        tds_tdmc_tcu_mbist_done;

   input        rdp_rdmc_tcu_mbist_fail;
   input        rtx_rxc_ipp0_tcu_mbist_fail;
   input        rtx_rxc_ipp1_tcu_mbist_fail;
   input        rtx_rxc_mb5_tcu_mbist_fail;
   input        rtx_rxc_mb6_tcu_mbist_fail;
   input        rtx_rxc_zcp0_tcu_mbist_fail;
   input        rtx_rxc_zcp1_tcu_mbist_fail;
   input        rtx_txc_txe0_tcu_mbist_fail;
   input        rtx_txc_txe1_tcu_mbist_fail;
   input        tds_smx_tcu_mbist_fail;
   input        tds_tdmc_tcu_mbist_fail;

   // For Memory BIST Direct-Output Observe
   output [5:0]  dmo_coresel;   // to SPC {1,5,4 & 3,7,6}
   output        dmo_dcmuxctl;  // to all SPCs
   output        dmo_icmuxctl;  // to all SPCs

   input [35:0]  spc4_dmo_dout; // Mux'ed data from spc4
   input [35:0]  spc6_dmo_dout; // Mux'ed data from spc6

   input [38:0]  l2t4_dmo_dout; // Mux'ed data from l2t4
   input [38:0]  l2t6_dmo_dout; // Mux'ed data from l2t6

   output [5:0]  dmo_l2tsel;    // to l2t {1,5,4 & 3,7,6}
   output        dmo_tagmuxctl; // to all l2ts

   input [39:0]  rtx_tcu_dmo_data_out; // From RTX (NIU)
   input [39:0]  tds_tcu_dmo_dout;     // From TDS (NIU)
   input [39:0]  rdp_tcu_dmo_dout;     // From RDP (NIU)
   
   output [2:0]  tcu_rtx_dmo_ctl; // Mux Control to RTX


   // PINS for Shadow Scan (SHSCAN)
   input 	spc0_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 0
   output 	tcu_spc0_shscan_scan_out; // PINDEF:BOT  // to core 0
   input 	spc1_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 1
   output 	tcu_spc1_shscan_scan_out; // PINDEF:BOT  // to core 1
   input 	spc2_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 2
   output 	tcu_spc2_shscan_scan_out; // PINDEF:BOT  // to core 2
   input 	spc3_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 3
   output 	tcu_spc3_shscan_scan_out; // PINDEF:BOT  // to core 3
   input 	spc4_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 4
   output 	tcu_spc4_shscan_scan_out; // PINDEF:BOT  // to core 4
   input 	spc5_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 5
   output 	tcu_spc5_shscan_scan_out; // PINDEF:BOT  // to core 5
   input 	spc6_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 6
   output 	tcu_spc6_shscan_scan_out; // PINDEF:BOT  // to core 6
   input 	spc7_tcu_shscan_scan_in;  // PINDEF:BOT  // from core 7
   output 	tcu_spc7_shscan_scan_out; // PINDEF:BOT  // to core 7
   // SHSCAN - SPC Common
   output 	tcu_spc_shscan_aclk;      // PINDEF:BOT  
   output 	tcu_spc_shscan_bclk;      // PINDEF:BOT
   output 	tcu_spc_shscan_scan_en;   // PINDEF:BOT
   output 	tcu_spc_shscan_pce_ov;    // PINDEF:BOT
   output 	tcu_spc0_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc1_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc2_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc3_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc4_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc5_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc6_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_spc7_shscan_clk_stop;  // PINDEF:BOT
   output [2:0] tcu_spc_shscanid;       // PINDEF:BOT

   //================================================================================
   // 
   // PINS for L2T Shadow Scan
   //================================================================================
   input 	l2t0_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 0
   output 	tcu_l2t0_shscan_scan_in; // PINDEF:BOT  // to core 0
   input 	l2t1_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 1
   output 	tcu_l2t1_shscan_scan_in; // PINDEF:BOT  // to core 1
   input 	l2t2_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 2
   output 	tcu_l2t2_shscan_scan_in; // PINDEF:BOT  // to core 2
   input 	l2t3_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 3
   output 	tcu_l2t3_shscan_scan_in; // PINDEF:BOT  // to core 3
   input 	l2t4_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 4
   output 	tcu_l2t4_shscan_scan_in; // PINDEF:BOT  // to core 4
   input 	l2t5_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 5
   output 	tcu_l2t5_shscan_scan_in; // PINDEF:BOT  // to core 5
   input 	l2t6_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 6
   output 	tcu_l2t6_shscan_scan_in; // PINDEF:BOT  // to core 6
   input 	l2t7_tcu_shscan_scan_out;  // PINDEF:BOT  // from core 7
   output 	tcu_l2t7_shscan_scan_in; // PINDEF:BOT  // to core 7

   // SHSCAN - SPC Common
   output 	tcu_l2t_shscan_aclk;      // PINDEF:BOT  
   output 	tcu_l2t_shscan_bclk;      // PINDEF:BOT
   output 	tcu_l2t_shscan_scan_en;   // PINDEF:BOT
   output 	tcu_l2t_shscan_pce_ov;    // PINDEF:BOT
   output 	tcu_l2t0_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t1_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t2_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t3_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t4_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t5_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t6_shscan_clk_stop;  // PINDEF:BOT
   output 	tcu_l2t7_shscan_clk_stop;  // PINDEF:BOT

   // PINS for CORE DEBUG
   output [7:0] tcu_ss_mode;     // PINDEF:BOT  
   output [7:0] tcu_do_mode;     // PINDEF:BOT  
   output [7:0] tcu_ss_request;  // PINDEF:BOT  
   input        spc0_ss_complete; // PINDEF:BOT 
   input        spc1_ss_complete; // PINDEF:BOT 
   input        spc2_ss_complete; // PINDEF:BOT 
   input        spc3_ss_complete; // PINDEF:BOT 
   input        spc4_ss_complete; // PINDEF:BOT 
   input        spc5_ss_complete; // PINDEF:BOT 
   input        spc6_ss_complete; // PINDEF:BOT 
   input        spc7_ss_complete; // PINDEF:BOT 
   input        spc0_softstop_request; // PINDEF:BOT
   input        spc1_softstop_request; // PINDEF:BOT
   input        spc2_softstop_request; // PINDEF:BOT
   input        spc3_softstop_request; // PINDEF:BOT
   input        spc4_softstop_request; // PINDEF:BOT
   input        spc5_softstop_request; // PINDEF:BOT
   input        spc6_softstop_request; // PINDEF:BOT
   input        spc7_softstop_request; // PINDEF:BOT
   input        spc0_hardstop_request; // PINDEF:BOT
   input        spc1_hardstop_request; // PINDEF:BOT
   input        spc2_hardstop_request; // PINDEF:BOT
   input        spc3_hardstop_request; // PINDEF:BOT
   input        spc4_hardstop_request; // PINDEF:BOT
   input        spc5_hardstop_request; // PINDEF:BOT
   input        spc6_hardstop_request; // PINDEF:BOT
   input        spc7_hardstop_request; // PINDEF:BOT
   input  [7:0] spc0_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc1_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc2_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc3_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc4_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc5_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc6_ncu_core_running_status; // PINDEF:BOT
   input  [7:0] spc7_ncu_core_running_status; // PINDEF:BOT
   input        spc0_trigger_pulse; // PINDEF:BOT
   input        spc1_trigger_pulse; // PINDEF:BOT
   input        spc2_trigger_pulse; // PINDEF:BOT
   input        spc3_trigger_pulse; // PINDEF:BOT
   input        spc4_trigger_pulse; // PINDEF:BOT
   input        spc5_trigger_pulse; // PINDEF:BOT
   input        spc6_trigger_pulse; // PINDEF:BOT
   input        spc7_trigger_pulse; // PINDEF:BOT


   // Interaction with Reset Unit (RST)
   input        rst_tcu_flush_init_req    ;// RST Request TCU to   assert se.
   input        rst_tcu_flush_stop_req    ;// RST Request TCU to deassert se.
   // From RST, indicates early release of pseudo-flush for ASICs
   //  active in POR1 or rst_tcu_clk_stop which indicates PLL relock
   input        rst_tcu_asicflush_stop_req; // only in POR1 or rst_tcu_clk_stop
   output       tcu_rst_asicflush_stop_ack; 

   output       tcu_rst_flush_init_ack    ;// RST Request TCU to   assert se.
   output       tcu_rst_flush_stop_ack    ;// RST Request TCU to deassert se.

   input        rst_wmr_protect;
   output       tcu_bisx_done; // PINDEF:BOT  to RST Block
   output       tcu_rst_scan_mode; 

   input        POR_;      // PINDEF:BOT
   // From RST, indicates PLL is re-locking
   input        rst_tcu_clk_stop; 
   // From RST, indicates debug reset
   input        rst_tcu_dbr_gen;

   input        ncu_spc0_core_available; // PINDEF:BOT
   input        ncu_spc1_core_available; // PINDEF:BOT
   input        ncu_spc2_core_available; // PINDEF:BOT
   input        ncu_spc3_core_available; // PINDEF:BOT
   input        ncu_spc4_core_available; // PINDEF:BOT
   input        ncu_spc5_core_available; // PINDEF:BOT
   input        ncu_spc6_core_available; // PINDEF:BOT
   input        ncu_spc7_core_available; // PINDEF:BOT

   input[7:0]   ncu_tcu_bank_avail; // PINDEF:BOT

   input        ncu_spc0_core_enable_status; // PINDEF:BOT
   input        ncu_spc1_core_enable_status; // PINDEF:BOT
   input        ncu_spc2_core_enable_status; // PINDEF:BOT
   input        ncu_spc3_core_enable_status; // PINDEF:BOT
   input        ncu_spc4_core_enable_status; // PINDEF:BOT
   input        ncu_spc5_core_enable_status; // PINDEF:BOT
   input        ncu_spc6_core_enable_status; // PINDEF:BOT
   input        ncu_spc7_core_enable_status; // PINDEF:BOT

   input        ncu_spc_pm;
   input        ncu_spc_ba01; // PINDEF:BOT
   input        ncu_spc_ba23; // PINDEF:BOT
   input        ncu_spc_ba45; // PINDEF:BOT
   input        ncu_spc_ba67; // PINDEF:BOT

   // For control of Arrays during Scan
   output       tcu_se_scancollar_in;   // PINDEF:BOT
   output       tcu_se_scancollar_out;  // PINDEF:BOT
   output       tcu_array_bypass;       // PINDEF:BOT
   output       tcu_array_wr_inhibit;   // PINDEF:BOT

   // Connect io shared pins from debug to internal TCU signals

	//======================
	// 
	// 
	// mio db0 db1 changes
	//======================
   output [30:0] tcu_mio_pins_scan_out;
   output [39:0] tcu_mio_dmo_data;
   output 	 tcu_mio_mbist_done;
   output 	 tcu_mio_mbist_fail;
   output 	 tcu_mio_trigout;
   output 	 tcu_mio_jtag_membist_mode;
   output 	 tcu_mio_clk_stop;
   output 	 tcu_mio_bs_scan_in;
   output 	 tcu_mio_bs_scan_en;
   output 	 tcu_mio_bs_clk;
   output 	 tcu_mio_bs_aclk;
   output 	 tcu_mio_bs_bclk;
   output 	 tcu_mio_bs_uclk;
   output 	 tcu_mio_bs_mode_ctl;
   output 	 tcu_mio_dmo_sync;

   // SerDes STCI Connections: between fsr, psr, esr and TCU
   output 	 tcu_stciclk;     // PINDEF:BOT
   output [1:0]  tcu_stcicfg;     // PINDEF:BOT
   output 	 tcu_stcid;       //   to fsr0
   input 	 stciq_tcu;       // from fsr4

   // SerDes ATPG Connections: between fsr, psr, esr and TCU
   output 	 tcu_srd_atpgse;  
   output 	 tcu_srd_atpgd;   
   output [2:0]  tcu_srd_atpgmode;
   input 	 srd_tcu_atpgq;   

   // SerDes Boundary Scan Connections: between MCU,NIU,PEU and TCU
   output 	 tcu_sbs_enbstx;   // PINDEF:BOT
   output 	 tcu_sbs_enbsrx;   // PINDEF:BOT
   output 	 tcu_sbs_scan_en;  // PINDEF:BOT
   output 	 tcu_sbs_clk;      // PINDEF:BOT
   output 	 tcu_sbs_aclk;     // PINDEF:BOT
   output 	 tcu_sbs_bclk;     // PINDEF:BOT
   output 	 tcu_sbs_uclk;     // PINDEF:BOT
   output 	 tcu_sbs_scan_in;  // PINDEF:BOT
   output    tcu_sbs_acmode;
   output    tcu_sbs_actestsignal;
   output    tcu_sbs_enbspt;
   output    tcu_sbs_bsinitclk;
   output    tcu_peu_entestcfg;
   // SerDes BScan Connection scan out returned from MCU, NIU or PEU
   input 	 sbs_tcu_scan_out;// PINDEF:BOT

   // SerDes Pin Connections, between MIO and TCU
   output 	 tcu_mio_scan_out31; // STCIQ
   input 	 mio_tcu_scan_in31;  // STCID
   input 	 mio_tcu_stciclk;    // STCICLK
   input [1:0] 	 mio_tcu_stcicfg;    // STCICFG
   input 	 mio_tcu_stcid;
   output 	 tcu_mio_stciq;
   
   input 	 mio_tcu_io_ac_testmode;
   input 	 mio_tcu_io_ac_testtrig;
   input 	 mio_tcu_io_aclk;
   input 	 mio_tcu_io_bclk;
   input [30:0]  mio_tcu_io_scan_in;
   input 	 mio_tcu_io_scan_en;
   input 	 mio_tcu_trigin;
   input 	 mio_tcu_bs_scan_out;

   // External Clocks
   input         mio_ext_cmp_clk;
   input 	 mio_ext_dr_clk;   
   input 	 mio_tcu_peu_clk_ext;  
   input [5:0] 	 mio_tcu_niu_clk_ext;  

   output 	 tcu_peu_clk_ext;  
   output 	 tcu_ccu_ext_cmp_clk;
   output 	 tcu_ccu_ext_dr_clk;
   //output [5:0]  tcu_niu_clk_ext;  
   output        mac_125rx_test_clk;
   output        mac_125tx_test_clk;
   output        mac_156rx_test_clk;
   output        mac_156tx_test_clk;
   output        mac_312rx_test_clk;
   output        mac_312tx_test_clk;
   output        tcu_peu_testmode;
   output        tcu_mac_testmode;
   
   input 	 mio_tcu_divider_bypass;
   input 	 mio_tcu_pll_cmp_bypass;
   
   output 	 tcu_div_bypass; //tcu_ccu_divider_bypass;
   output [1:0]  tcu_ccu_mux_sel; // encoded 
   output 	 tcu_ccu_clk_stretch;

   output 	 tcu_mio_bs_highz_l;
   
   input 	 dbg1_tcu_soc_hard_stop;
   input 	 dbg1_tcu_soc_asrt_trigout;
   
   output 	 tcu_db0_clk_stop;
   output 	 tcu_db1_clk_stop;

   assign 	 io_aclk = mio_tcu_io_aclk;
   assign 	 io_bclk = mio_tcu_io_bclk;
   assign 	 io_scan_en = mio_tcu_io_scan_en;
   assign 	 io_ac_test_mode = mio_tcu_io_ac_testmode;
   assign 	 io_ac_testtrig  = mio_tcu_io_ac_testtrig;
   assign 	 io_scan_in[30:0] = mio_tcu_io_scan_in[30:0];
   assign 	 tcu_mio_pins_scan_out[30:0] = tcu_pins_scan_out[30:0];

   // Logic BIST connections: 1 per core 
   output [7:0] tcu_spc_lbist_start;
   output [7:0] tcu_spc_lbist_scan_in;
   output        tcu_spc_lbist_pgm;

   output 	 tcu_spc0_test_mode;
   output 	 tcu_spc1_test_mode;
   output 	 tcu_spc2_test_mode;
   output 	 tcu_spc3_test_mode;
   output 	 tcu_spc4_test_mode;
   output 	 tcu_spc5_test_mode;
   output 	 tcu_spc6_test_mode;
   output 	 tcu_spc7_test_mode;

   output        tcu_atpg_mode;

   input 	 spc0_tcu_lbist_done;
   input 	 spc1_tcu_lbist_done;
   input 	 spc2_tcu_lbist_done;
   input 	 spc3_tcu_lbist_done;
   input 	 spc4_tcu_lbist_done;
   input 	 spc5_tcu_lbist_done;
   input 	 spc6_tcu_lbist_done;
   input 	 spc7_tcu_lbist_done;
   input 	 spc0_tcu_lbist_scan_out;
   input 	 spc1_tcu_lbist_scan_out;
   input 	 spc2_tcu_lbist_scan_out;
   input 	 spc3_tcu_lbist_scan_out;
   input 	 spc4_tcu_lbist_scan_out;
   input 	 spc5_tcu_lbist_scan_out;
   input 	 spc6_tcu_lbist_scan_out;
   input 	 spc7_tcu_lbist_scan_out;

//=============================
// Cluster Headers
//=============================
clkgen_tcu_cmp clkgen_tcu_cmp (
   .l2clk                ( l2clk               ),
   .cmp_slow_sync_en     ( cmp_io_sync_en      ),
   .slow_cmp_sync_en     ( io_cmp_sync_en      ),
   .io2x_sync_en         ( cmp_io2x_sync_en    ),
   .dr_sync_en           ( cmp_dr_sync_en      ),
   .aclk                 ( aclk0_unused        ),
   .bclk                 ( bclk0_unused        ),
   .scan_out             ( clkgen_tcu_cmp_scan_out),
   .pce_ov               ( pce_ov0_unused      ),
   .aclk_wmr             ( aclk_wmr0_unused    ),
   .wmr_protect          ( wmr_protect0_unused ),
   .wmr_                 ( wmr0_unused         ),
   .por_                 ( por0_unused         ),
   .array_wr_inhibit     ( awi0_unused         ),
	
	// Inputs
   .tcu_clk_stop         ( rst_tcu_clk_stop     ),
   .tcu_pce_ov           ( 1'b0                 ),
   .rst_wmr_protect      ( 1'b0                 ),
   .rst_wmr_             ( 1'b1                 ),
   .rst_por_             ( 1'b1                 ),
   .ccu_cmp_slow_sync_en ( ccu_cmp_io_sync_en   ),
   .ccu_slow_cmp_sync_en ( ccu_io_cmp_sync_en   ),
   .ccu_io2x_sync_en     ( ccu_cmp_io2x_sync_en ),
   .ccu_dr_sync_en       ( ccu_cmp_dr_sync_en   ),
   //.tcu_div_bypass       ( 1'b0                 ),
   .tcu_div_bypass       ( tcu_div_bypass       ),
   .ccu_div_ph           ( 1'b1                 ),
   .cluster_div_en       ( 1'b0                 ),
   .gclk                 ( gclk                 ),
   .clk_ext              ( 1'b0                 ),
   .scan_en              ( tcu_int_se           ),
   .scan_in              ( clkgen_tcu_cmp_scan_in),
   .tcu_aclk             ( tcu_int_aclk         ),
   .tcu_bclk             ( tcu_int_bclk         ),
   .cluster_arst_l       ( cluster_arst_l       ),
   .ccu_serdes_dtm       ( 1'b0                 ),
   .tcu_atpg_mode        ( tcu_atpg_mode        ),
   .tcu_wr_inhibit       ( 1'b0                 ));

clkgen_tcu_io clkgen_tcu_io ( 
   .l2clk                ( iol2clk                 ),
   .cmp_slow_sync_en     ( cmp_slow_sync_en_unused ),
   .slow_cmp_sync_en     ( slow_cmp_sync_en_unused ),
   .aclk                 ( aclk1_unused            ),
   .bclk                 ( bclk1_unused            ),
   .scan_out             ( clkgen_tcu_io_scan_out  ),
   .pce_ov               ( pce_ov1_unused          ),
   .aclk_wmr             ( aclk_wmr1_unused        ),
   .wmr_protect          ( wmr_protect1_unused     ),
   .wmr_                 ( wmr1_unused             ),
   .por_                 ( por1_unused             ),
   .array_wr_inhibit     ( awi1_unused             ),

	// Inputs
   .tcu_clk_stop         ( rst_tcu_clk_stop     ),
   .tcu_pce_ov           ( 1'b0                 ),
   .rst_wmr_protect      ( 1'b0                 ),
   .rst_wmr_             ( 1'b1                 ),
   .rst_por_             ( 1'b1                 ),
   .ccu_cmp_slow_sync_en ( 1'b0                 ),
   .ccu_slow_cmp_sync_en ( 1'b0                 ),
   .tcu_div_bypass       ( tcu_div_bypass       ),
   .ccu_div_ph           ( ccu_io_out           ),
   .cluster_div_en       ( 1'b1                 ),
   .gclk                 ( gclk                 ),
   .clk_ext              ( 1'b0                 ),
   .scan_en              ( tcu_int_se           ),
   .scan_in              ( clkgen_tcu_io_scan_in ),
   .tcu_aclk             ( tcu_int_aclk         ),
   .tcu_bclk             ( tcu_int_bclk         ),
   .cluster_arst_l       ( cluster_arst_l       ),
   .ccu_serdes_dtm       ( 1'b0                 ),
   .tcu_atpg_mode        ( tcu_atpg_mode        ),
   .tcu_wr_inhibit       ( 1'b0                 ));

//=============================
// 
// 
// Added SOC MBIST Logic
// Made Actual Connections
// Modified on 20050214
// Changed from 78 to 88
//=============================
assign tcu_rdp_rdmc_mbist_start     = tcu_mbist_start[47];
assign tcu_rtx_rxc_ipp0_mbist_start = tcu_mbist_start[46];
assign tcu_rtx_rxc_ipp1_mbist_start = tcu_mbist_start[45];
assign tcu_rtx_rxc_mb5_mbist_start  = tcu_mbist_start[44];
assign tcu_rtx_rxc_mb6_mbist_start  = tcu_mbist_start[43];
assign tcu_rtx_rxc_zcp0_mbist_start = tcu_mbist_start[42];
assign tcu_rtx_rxc_zcp1_mbist_start = tcu_mbist_start[41];
assign tcu_rtx_txc_txe0_mbist_start = tcu_mbist_start[40];
assign tcu_rtx_txc_txe1_mbist_start = tcu_mbist_start[39];
assign tcu_tds_smx_mbist_start      = tcu_mbist_start[38];
assign tcu_tds_tdmc_mbist_start     = tcu_mbist_start[37];
assign tcu_peu_mbist_start = tcu_mbist_start[36];
assign tcu_dmu_mbist_start = tcu_mbist_start[35:34];
assign tcu_l2t7_mbist_start = tcu_mbist_start[33];
assign tcu_l2t6_mbist_start = tcu_mbist_start[32];
assign tcu_l2t5_mbist_start = tcu_mbist_start[31];
assign tcu_l2t4_mbist_start = tcu_mbist_start[30];
assign tcu_l2t3_mbist_start = tcu_mbist_start[29];
assign tcu_l2t2_mbist_start = tcu_mbist_start[28];
assign tcu_l2t1_mbist_start = tcu_mbist_start[27];
assign tcu_l2t0_mbist_start = tcu_mbist_start[26];
assign tcu_l2b7_mbist_start = tcu_mbist_start[25];
assign tcu_l2b6_mbist_start = tcu_mbist_start[24];
assign tcu_l2b5_mbist_start = tcu_mbist_start[23];
assign tcu_l2b4_mbist_start = tcu_mbist_start[22];
assign tcu_l2b3_mbist_start = tcu_mbist_start[21];
assign tcu_l2b2_mbist_start = tcu_mbist_start[20];
assign tcu_l2b1_mbist_start = tcu_mbist_start[19];
assign tcu_l2b0_mbist_start = tcu_mbist_start[18];
assign tcu_mcu3_mbist_start = tcu_mbist_start[17];
assign tcu_mcu2_mbist_start = tcu_mbist_start[16];
assign tcu_mcu1_mbist_start = tcu_mbist_start[15];
assign tcu_mcu0_mbist_start = tcu_mbist_start[14];
assign tcu_ncu_mbist_start = tcu_mbist_start[13:12];
assign tcu_sio_mbist_start = tcu_mbist_start[11:10];
assign tcu_sii_mbist_start = tcu_mbist_start[9:8];
assign tcu_spc_mbist_start = tcu_mbist_start[7:0];

   
//instantiate submodules

 tcu_sigmux_ctl   sigmux_ctl (
			      //inputs
			      .scan_in(sigmux_ctl_scan_in),
			      .scan_out(sigmux_ctl_scan_out),
			      //outputs
			.tcu_int_aclk		( tcu_int_aclk	),
			.tcu_int_bclk		( tcu_int_bclk	),
			.tcu_int_se			( tcu_int_se	),
                  .tcu_soca_scan_out(tcu_socb_scan_out),
                  .tcu_socb_scan_out(tcu_soca_scan_out),
                              .tcu_spc0_mb_scan_out(tcu_spc0_mbist_scan_out),
                              .tcu_spc1_mb_scan_out(tcu_spc1_mbist_scan_out),
                              .tcu_spc2_mb_scan_out(tcu_spc2_mbist_scan_out),
                              .tcu_spc3_mb_scan_out(tcu_spc3_mbist_scan_out),
                              .tcu_spc4_mb_scan_out(tcu_spc4_mbist_scan_out),
                              .tcu_spc5_mb_scan_out(tcu_spc5_mbist_scan_out),
                              .tcu_spc6_mb_scan_out(tcu_spc6_mbist_scan_out),
                              .tcu_spc7_mb_scan_out(tcu_spc7_mbist_scan_out),
  .mio_ext_cmp_clk(mio_ext_cmp_clk),
  .mio_ext_dr_clk(mio_ext_dr_clk),
  .tcu_ccu_ext_dr_clk(tcu_ccu_ext_dr_clk),
  .tcu_ccu_ext_cmp_clk(tcu_ccu_ext_cmp_clk),
  .tcu_ccu_clk_stop(tcu_ccu_clk_stop),
  .tcu_ccu_io_clk_stop(tcu_ccu_io_clk_stop),
  .tcu_rst_clk_stop(tcu_rst_clk_stop),
  .tcu_rst_io_clk_stop(tcu_rst_io_clk_stop),
  .mbist_clk_stop(mbist_clk_stop),
  .tck_clk_tree(tck_clk_tree),
  .mio_tcu_peu_clk_ext(mio_tcu_peu_clk_ext),
  .tcu_peu_clk_ext(tcu_peu_clk_ext),
  .mio_tcu_niu_clk_ext(mio_tcu_niu_clk_ext[5:0]),
  .mac_125rx_test_clk(mac_125rx_test_clk),
  .mac_125tx_test_clk(mac_125tx_test_clk),
  .mac_156rx_test_clk(mac_156rx_test_clk),
  .mac_156tx_test_clk(mac_156tx_test_clk),
  .mac_312rx_test_clk(mac_312rx_test_clk),
  .mac_312tx_test_clk(mac_312tx_test_clk),
  .mio_tcu_pll_cmp_bypass(mio_tcu_pll_cmp_bypass),
  .mio_tcu_divider_bypass(mio_tcu_divider_bypass),
  .tcu_div_bypass(tcu_div_bypass),
  .cmp_io_sync_en(cmp_io_sync_en),
  .io_cmp_sync_en(io_cmp_sync_en),
  .cmp_dr_sync_en(cmp_dr_sync_en),
  .tcu_peu_testmode(tcu_peu_testmode),
  .tcu_mac_testmode(tcu_mac_testmode),
  .tcu_spc0_test_mode(tcu_spc0_test_mode),
  .tcu_spc1_test_mode(tcu_spc1_test_mode),
  .tcu_spc2_test_mode(tcu_spc2_test_mode),
  .tcu_spc3_test_mode(tcu_spc3_test_mode),
  .tcu_spc4_test_mode(tcu_spc4_test_mode),
  .tcu_spc5_test_mode(tcu_spc5_test_mode),
  .tcu_spc6_test_mode(tcu_spc6_test_mode),
  .tcu_spc7_test_mode(tcu_spc7_test_mode),
  .tcu_rst_scan_mode(tcu_rst_scan_mode),
  .tcu_atpg_mode(tcu_atpg_mode),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .io_aclk(io_aclk),
  .io_bclk(io_bclk),
  .l2clk(l2clk),
  .io_tdi(io_tdi),
  .io_scan_in(io_scan_in[30:0]),
  .spc0_tcu_scan_in(spc0_tcu_scan_in[1:0]),
  .spc1_tcu_scan_in(spc1_tcu_scan_in[1:0]),
  .spc2_tcu_scan_in(spc2_tcu_scan_in[1:0]),
  .spc3_tcu_scan_in(spc3_tcu_scan_in[1:0]),
  .spc4_tcu_scan_in(spc4_tcu_scan_in[1:0]),
  .spc5_tcu_scan_in(spc5_tcu_scan_in[1:0]),
  .spc6_tcu_scan_in(spc6_tcu_scan_in[1:0]),
  .spc7_tcu_scan_in(spc7_tcu_scan_in[1:0]),
  .soca_tcu_scan_in(soca_tcu_scan_in),
  .socb_tcu_scan_in(socb_tcu_scan_in),
  .socc_tcu_scan_in(socc_tcu_scan_in),
  .socd_tcu_scan_in(socd_tcu_scan_in),
  .soce_tcu_scan_in(soce_tcu_scan_in),
  .socf_tcu_scan_in(socf_tcu_scan_in),
  .socg_tcu_scan_in(socg_tcu_scan_in),
  .soch_tcu_scan_in(soch_tcu_scan_in),
  .soc0_tcu_scan_in(soc0_tcu_scan_in),
  .soc1_tcu_scan_in(soc1_tcu_scan_in),
  .soc2_tcu_scan_in(soc2_tcu_scan_in),
  .soc3_tcu_scan_in(soc3_tcu_scan_in),
  .soc4_tcu_scan_in(soc4_tcu_scan_in),
  .soc5_tcu_scan_in(soc5_tcu_scan_in),
  .soc6_tcu_scan_in(soc6_tcu_scan_in),
  .peu_tcu_scan_in(peu_tcu_scan_in),
  .ccu_tcu_scan_in(ccu_tcu_scan_in),
  .jtag_sbs_scan_in(jtag_sbs_scan_in),
  .mio_tcu_bs_scan_out(mio_tcu_bs_scan_out),
  .io_test_mode(io_test_mode),
  .jtag_ser_scan_q(jtag_ser_scan_q),
  .io_scan_en(io_scan_en),
  .clk_stop_ac_trans_counter_initiated(clk_stop_ac_trans_counter_initiated),
  .io_ac_test_mode(io_ac_test_mode),
  .io_ac_testtrig(io_ac_testtrig),
  .ac_test_mode(ac_test_mode),
  .debug_reg_hard_stop_domain_1st(debug_reg_hard_stop_domain_1st[23:0]),
  .debug_cycle_counter_stop(debug_cycle_counter_stop),
  .debug_event_stop(debug_event_stop),
  .spc_ss_mode(spc_ss_mode),
  .spc_ss_sel(spc_ss_sel[7:0]),
  .instr_sstop_csmode(instr_sstop_csmode),
  .tcu_scan_chain(tcu_scan_chain),
  .POR_(POR_),
  .jtag_clk_stop_req(jtag_clk_stop_req),
  .jtagclkstop_ov(jtagclkstop_ov),
  .rst_tcu_flush_init_req(rst_tcu_flush_init_req),
  .rst_tcu_flush_stop_req(rst_tcu_flush_stop_req),
  .rst_tcu_asicflush_stop_req(rst_tcu_asicflush_stop_req),
  .rst_wmr_protect(rst_wmr_protect),
  .rst_tcu_dbr_gen(rst_tcu_dbr_gen),
  .tcu_rst_flush_init_ack(tcu_rst_flush_init_ack),
  .tcu_rst_flush_stop_ack(tcu_rst_flush_stop_ack),
  .tcu_rst_asicflush_stop_ack(tcu_rst_asicflush_stop_ack),
  .tcu_rst_efu_done(tcu_rst_efu_done),
  .flush_test_protect(flush_test_protect),
  .tcu_test_protect_cmp(tcu_test_protect_cmp),
  .jtag_sck_byp(jtag_sck_byp),
  .tcu_sck_bypass(tcu_sck_bypass),
  .jtag_por_enable(jtag_por_enable),
  .jtag_por_status(jtag_por_status),
  .jtag_efu_clear_instr(jtag_efu_clear_instr),
  .jtag_efu_rvclr(jtag_efu_rvclr[6:0]),
  .tcu_efu_read_start(tcu_efu_read_start),
  .tcu_efu_rvclr(tcu_efu_rvclr[6:0]),
  .jt_scan_in(jt_scan_in),
  .jt_scan_en(jt_scan_en),
  .jt_scan_aclk(jt_scan_aclk),
  .jt_scan_bclk(jt_scan_bclk),
  .ser_scan_out(ser_scan_out),
  .chain_select(chain_select),
  .sel_chain(sel_chain[4:0]),
  .tcu_spc_lbist_start(tcu_spc_lbist_start[7:0]),
  .tap_spc0_mb_aclk(tap_spc0_mb_aclk),
  .tap_spc0_mb_bclk(tap_spc0_mb_bclk),
  .tap_spc0_mb_scan_en(tap_spc0_mb_scan_en),
  .tap_spc0_mb_clk_stop(tap_spc0_mb_clk_stop),
  .tap_spc1_mb_aclk(tap_spc1_mb_aclk),
  .tap_spc1_mb_bclk(tap_spc1_mb_bclk),
  .tap_spc1_mb_scan_en(tap_spc1_mb_scan_en),
  .tap_spc1_mb_clk_stop(tap_spc1_mb_clk_stop),
  .tap_spc2_mb_aclk(tap_spc2_mb_aclk),
  .tap_spc2_mb_bclk(tap_spc2_mb_bclk),
  .tap_spc2_mb_scan_en(tap_spc2_mb_scan_en),
  .tap_spc2_mb_clk_stop(tap_spc2_mb_clk_stop),
  .tap_spc3_mb_aclk(tap_spc3_mb_aclk),
  .tap_spc3_mb_bclk(tap_spc3_mb_bclk),
  .tap_spc3_mb_scan_en(tap_spc3_mb_scan_en),
  .tap_spc3_mb_clk_stop(tap_spc3_mb_clk_stop),
  .tap_spc4_mb_aclk(tap_spc4_mb_aclk),
  .tap_spc4_mb_bclk(tap_spc4_mb_bclk),
  .tap_spc4_mb_scan_en(tap_spc4_mb_scan_en),
  .tap_spc4_mb_clk_stop(tap_spc4_mb_clk_stop),
  .tap_spc5_mb_aclk(tap_spc5_mb_aclk),
  .tap_spc5_mb_bclk(tap_spc5_mb_bclk),
  .tap_spc5_mb_scan_en(tap_spc5_mb_scan_en),
  .tap_spc5_mb_clk_stop(tap_spc5_mb_clk_stop),
  .tap_spc6_mb_aclk(tap_spc6_mb_aclk),
  .tap_spc6_mb_bclk(tap_spc6_mb_bclk),
  .tap_spc6_mb_scan_en(tap_spc6_mb_scan_en),
  .tap_spc6_mb_clk_stop(tap_spc6_mb_clk_stop),
  .tap_spc7_mb_aclk(tap_spc7_mb_aclk),
  .tap_spc7_mb_bclk(tap_spc7_mb_bclk),
  .tap_spc7_mb_scan_en(tap_spc7_mb_scan_en),
  .tap_spc7_mb_clk_stop(tap_spc7_mb_clk_stop),
  .tcu_dectest(tcu_dectest),
  .tcu_muxtest(tcu_muxtest),
  .tcu_jtag_flush_req(tcu_jtag_flush_req),
  .tcu_jtag_flush_dly_req(tcu_jtag_flush_dly_req),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .jtag_mt_enable(jtag_mt_enable),
  .tcu_spc0_aclk(tcu_spc0_aclk),
  .tcu_spc0_bclk(tcu_spc0_bclk),
  .tcu_spc0_scan_en(tcu_spc0_scan_en),
  .tcu_spc0_se_scancollar_in(tcu_spc0_se_scancollar_in),
  .tcu_spc0_se_scancollar_out(tcu_spc0_se_scancollar_out),
  .tcu_spc0_array_wr_inhibit(tcu_spc0_array_wr_inhibit),
  .tcu_spc1_aclk(tcu_spc1_aclk),
  .tcu_spc1_bclk(tcu_spc1_bclk),
  .tcu_spc1_scan_en(tcu_spc1_scan_en),
  .tcu_spc1_se_scancollar_in(tcu_spc1_se_scancollar_in),
  .tcu_spc1_se_scancollar_out(tcu_spc1_se_scancollar_out),
  .tcu_spc1_array_wr_inhibit(tcu_spc1_array_wr_inhibit),
  .tcu_spc2_aclk(tcu_spc2_aclk),
  .tcu_spc2_bclk(tcu_spc2_bclk),
  .tcu_spc2_scan_en(tcu_spc2_scan_en),
  .tcu_spc2_se_scancollar_in(tcu_spc2_se_scancollar_in),
  .tcu_spc2_se_scancollar_out(tcu_spc2_se_scancollar_out),
  .tcu_spc2_array_wr_inhibit(tcu_spc2_array_wr_inhibit),
  .tcu_spc3_aclk(tcu_spc3_aclk),
  .tcu_spc3_bclk(tcu_spc3_bclk),
  .tcu_spc3_scan_en(tcu_spc3_scan_en),
  .tcu_spc3_se_scancollar_in(tcu_spc3_se_scancollar_in),
  .tcu_spc3_se_scancollar_out(tcu_spc3_se_scancollar_out),
  .tcu_spc3_array_wr_inhibit(tcu_spc3_array_wr_inhibit),
  .tcu_spc4_aclk(tcu_spc4_aclk),
  .tcu_spc4_bclk(tcu_spc4_bclk),
  .tcu_spc4_scan_en(tcu_spc4_scan_en),
  .tcu_spc4_se_scancollar_in(tcu_spc4_se_scancollar_in),
  .tcu_spc4_se_scancollar_out(tcu_spc4_se_scancollar_out),
  .tcu_spc4_array_wr_inhibit(tcu_spc4_array_wr_inhibit),
  .tcu_spc5_aclk(tcu_spc5_aclk),
  .tcu_spc5_bclk(tcu_spc5_bclk),
  .tcu_spc5_scan_en(tcu_spc5_scan_en),
  .tcu_spc5_se_scancollar_in(tcu_spc5_se_scancollar_in),
  .tcu_spc5_se_scancollar_out(tcu_spc5_se_scancollar_out),
  .tcu_spc5_array_wr_inhibit(tcu_spc5_array_wr_inhibit),
  .tcu_spc6_aclk(tcu_spc6_aclk),
  .tcu_spc6_bclk(tcu_spc6_bclk),
  .tcu_spc6_scan_en(tcu_spc6_scan_en),
  .tcu_spc6_se_scancollar_in(tcu_spc6_se_scancollar_in),
  .tcu_spc6_se_scancollar_out(tcu_spc6_se_scancollar_out),
  .tcu_spc6_array_wr_inhibit(tcu_spc6_array_wr_inhibit),
  .tcu_spc7_aclk(tcu_spc7_aclk),
  .tcu_spc7_bclk(tcu_spc7_bclk),
  .tcu_spc7_scan_en(tcu_spc7_scan_en),
  .tcu_spc7_se_scancollar_in(tcu_spc7_se_scancollar_in),
  .tcu_spc7_se_scancollar_out(tcu_spc7_se_scancollar_out),
  .tcu_spc7_array_wr_inhibit(tcu_spc7_array_wr_inhibit),
  .tcu_asic_aclk(tcu_asic_aclk),
  .tcu_asic_bclk(tcu_asic_bclk),
  .tcu_asic_scan_en(tcu_asic_scan_en),
  .tcu_asic_se_scancollar_in(tcu_asic_se_scancollar_in),
  .tcu_asic_se_scancollar_out(tcu_asic_se_scancollar_out),
  .tcu_asic_array_wr_inhibit(tcu_asic_array_wr_inhibit),
  .tcu_jtag_se(tcu_jtag_se),
  .tcu_int_ce(tcu_int_ce),
  .tcu_int_ce_to_ucb(tcu_int_ce_to_ucb),
  .tcu_int_pce_ov(tcu_int_pce_ov),
  .tcu_jtag_aclk(tcu_jtag_aclk),
  .tcu_spc0_scan_out(tcu_spc0_scan_out[1:0]),
  .tcu_spc1_scan_out(tcu_spc1_scan_out[1:0]),
  .tcu_spc2_scan_out(tcu_spc2_scan_out[1:0]),
  .tcu_spc3_scan_out(tcu_spc3_scan_out[1:0]),
  .tcu_spc4_scan_out(tcu_spc4_scan_out[1:0]),
  .tcu_spc5_scan_out(tcu_spc5_scan_out[1:0]),
  .tcu_spc6_scan_out(tcu_spc6_scan_out[1:0]),
  .tcu_spc7_scan_out(tcu_spc7_scan_out[1:0]),
  .tcu_socc_scan_out(tcu_socc_scan_out),
  .tcu_socd_scan_out(tcu_socd_scan_out),
  .tcu_soce_scan_out(tcu_soce_scan_out),
  .tcu_socf_scan_out(tcu_socf_scan_out),
  .tcu_socg_scan_out(tcu_socg_scan_out),
  .tcu_soch_scan_out(tcu_soch_scan_out),
  .tcu_soc0_scan_out(tcu_soc0_scan_out),
  .tcu_soc1_scan_out(tcu_soc1_scan_out),
  .tcu_soc2_scan_out(tcu_soc2_scan_out),
  .tcu_soc3_scan_out(tcu_soc3_scan_out),
  .tcu_soc4_scan_out(tcu_soc4_scan_out),
  .tcu_soc5_scan_out(tcu_soc5_scan_out),
  .tcu_soc6_scan_out(tcu_soc6_scan_out),
  .tcu_peu_scan_out(tcu_peu_scan_out),
  .tcu_rst_scan_out(tcu_rst_scan_out),
  .tcu_sbs_scan_in(tcu_sbs_scan_in),
  .tcu_pins_scan_out(tcu_pins_scan_out[30:0]),
  .pre_spc0_clk_stop(pre_spc0_clk_stop),
  .pre_spc1_clk_stop(pre_spc1_clk_stop),
  .pre_spc2_clk_stop(pre_spc2_clk_stop),
  .pre_spc3_clk_stop(pre_spc3_clk_stop),
  .pre_spc4_clk_stop(pre_spc4_clk_stop),
  .pre_spc5_clk_stop(pre_spc5_clk_stop),
  .pre_spc6_clk_stop(pre_spc6_clk_stop),
  .pre_spc7_clk_stop(pre_spc7_clk_stop),
  .pre_bnk0_clk_stop(pre_bnk0_clk_stop),
  .pre_l2t0_clk_stop(pre_l2t0_clk_stop),
  .pre_bnk1_clk_stop(pre_bnk1_clk_stop),
  .pre_l2t1_clk_stop(pre_l2t1_clk_stop),
  .pre_bnk2_clk_stop(pre_bnk2_clk_stop),
  .pre_l2t2_clk_stop(pre_l2t2_clk_stop),
  .pre_bnk3_clk_stop(pre_bnk3_clk_stop),
  .pre_l2t3_clk_stop(pre_l2t3_clk_stop),
  .pre_bnk4_clk_stop(pre_bnk4_clk_stop),
  .pre_l2t4_clk_stop(pre_l2t4_clk_stop),
  .pre_bnk5_clk_stop(pre_bnk5_clk_stop),
  .pre_l2t5_clk_stop(pre_l2t5_clk_stop),
  .pre_bnk6_clk_stop(pre_bnk6_clk_stop),
  .pre_l2t6_clk_stop(pre_l2t6_clk_stop),
  .pre_bnk7_clk_stop(pre_bnk7_clk_stop),
  .pre_l2t7_clk_stop(pre_l2t7_clk_stop),
  .pre_mcu0_clk_stop(pre_mcu0_clk_stop),
  .pre_mcu0_io_clk_stop(pre_mcu0_io_clk_stop),
  .pre_mcu0_dr_clk_stop(pre_mcu0_dr_clk_stop),
  .pre_mcu0_fbd_clk_stop(pre_mcu0_fbd_clk_stop),
  .pre_mcu1_clk_stop(pre_mcu1_clk_stop),
  .pre_mcu1_io_clk_stop(pre_mcu1_io_clk_stop),
  .pre_mcu1_dr_clk_stop(pre_mcu1_dr_clk_stop),
  .pre_mcu1_fbd_clk_stop(pre_mcu1_fbd_clk_stop),
  .pre_mcu2_clk_stop(pre_mcu2_clk_stop),
  .pre_mcu2_io_clk_stop(pre_mcu2_io_clk_stop),
  .pre_mcu2_dr_clk_stop(pre_mcu2_dr_clk_stop),
  .pre_mcu2_fbd_clk_stop(pre_mcu2_fbd_clk_stop),
  .pre_mcu3_clk_stop(pre_mcu3_clk_stop),
  .pre_mcu3_io_clk_stop(pre_mcu3_io_clk_stop),
  .pre_mcu3_dr_clk_stop(pre_mcu3_dr_clk_stop),
  .pre_mcu3_fbd_clk_stop(pre_mcu3_fbd_clk_stop),
  .pre_soc0_clk_stop(pre_soc0_clk_stop),
  .pre_soc0_io_clk_stop(pre_soc0_io_clk_stop),
  .pre_soc1_io_clk_stop(pre_soc1_io_clk_stop),
  .pre_soc2_io_clk_stop(pre_soc2_io_clk_stop),
  .pre_soc3_clk_stop(pre_soc3_clk_stop),
  .pre_soc3_io_clk_stop(pre_soc3_io_clk_stop),
  .tcu_pce_ov(tcu_pce_ov),
  .ac_trans_test_counter_start(ac_trans_test_counter_start),
  .spc0_tcu_mbist_scan_in(spc0_tcu_mbist_scan_in),
  .tap_spc0_mb_scan_out(tap_spc0_mb_scan_out),
  .spc0_tap_mb_scan_in(spc0_tap_mb_scan_in),
  .spc1_tcu_mbist_scan_in(spc1_tcu_mbist_scan_in),
  .tap_spc1_mb_scan_out(tap_spc1_mb_scan_out),
  .spc1_tap_mb_scan_in(spc1_tap_mb_scan_in),
  .spc2_tcu_mbist_scan_in(spc2_tcu_mbist_scan_in),
  .tap_spc2_mb_scan_out(tap_spc2_mb_scan_out),
  .spc2_tap_mb_scan_in(spc2_tap_mb_scan_in),
  .spc3_tcu_mbist_scan_in(spc3_tcu_mbist_scan_in),
  .tap_spc3_mb_scan_out(tap_spc3_mb_scan_out),
  .spc3_tap_mb_scan_in(spc3_tap_mb_scan_in),
  .spc4_tcu_mbist_scan_in(spc4_tcu_mbist_scan_in),
  .tap_spc4_mb_scan_out(tap_spc4_mb_scan_out),
  .spc4_tap_mb_scan_in(spc4_tap_mb_scan_in),
  .spc5_tcu_mbist_scan_in(spc5_tcu_mbist_scan_in),
  .tap_spc5_mb_scan_out(tap_spc5_mb_scan_out),
  .spc5_tap_mb_scan_in(spc5_tap_mb_scan_in),
  .spc6_tcu_mbist_scan_in(spc6_tcu_mbist_scan_in),
  .tap_spc6_mb_scan_out(tap_spc6_mb_scan_out),
  .spc6_tap_mb_scan_in(spc6_tap_mb_scan_in),
  .spc7_tcu_mbist_scan_in(spc7_tcu_mbist_scan_in),
  .tap_spc7_mb_scan_out(tap_spc7_mb_scan_out),
  .spc7_tap_mb_scan_in(spc7_tap_mb_scan_in),
  .tcu_sii_mbist_scan_in(tcu_sii_mbist_scan_in),
  .tcu_sio_mbist_scan_in(tcu_sio_mbist_scan_in),
  .tcu_ncu_mbist_scan_in(tcu_ncu_mbist_scan_in),
  .tcu_mcu0_mbist_scan_in(tcu_mcu0_mbist_scan_in),
  .tcu_mcu1_mbist_scan_in(tcu_mcu1_mbist_scan_in),
  .tcu_mcu2_mbist_scan_in(tcu_mcu2_mbist_scan_in),
  .tcu_mcu3_mbist_scan_in(tcu_mcu3_mbist_scan_in),
  .tcu_l2b0_mbist_scan_in(tcu_l2b0_mbist_scan_in),
  .tcu_l2b1_mbist_scan_in(tcu_l2b1_mbist_scan_in),
  .tcu_l2b2_mbist_scan_in(tcu_l2b2_mbist_scan_in),
  .tcu_l2b3_mbist_scan_in(tcu_l2b3_mbist_scan_in),
  .tcu_l2b4_mbist_scan_in(tcu_l2b4_mbist_scan_in),
  .tcu_l2b5_mbist_scan_in(tcu_l2b5_mbist_scan_in),
  .tcu_l2b6_mbist_scan_in(tcu_l2b6_mbist_scan_in),
  .tcu_l2b7_mbist_scan_in(tcu_l2b7_mbist_scan_in),
  .tcu_l2t0_mbist_scan_in(tcu_l2t0_mbist_scan_in),
  .tcu_l2t1_mbist_scan_in(tcu_l2t1_mbist_scan_in),
  .tcu_l2t2_mbist_scan_in(tcu_l2t2_mbist_scan_in),
  .tcu_l2t3_mbist_scan_in(tcu_l2t3_mbist_scan_in),
  .tcu_l2t4_mbist_scan_in(tcu_l2t4_mbist_scan_in),
  .tcu_l2t5_mbist_scan_in(tcu_l2t5_mbist_scan_in),
  .tcu_l2t6_mbist_scan_in(tcu_l2t6_mbist_scan_in),
  .tcu_l2t7_mbist_scan_in(tcu_l2t7_mbist_scan_in),
  .tcu_dmu_mbist_scan_in(tcu_dmu_mbist_scan_in),
  .tcu_peu_mbist_scan_in(tcu_peu_mbist_scan_in),
  .rdp_rdmc_mbist_scan_in(rdp_rdmc_mbist_scan_in),
  .rtx_mbist_scan_in(rtx_mbist_scan_in),
  .tds_mbist_scan_in(tds_mbist_scan_in),
  .sii_tcu_mbist_scan_out(sii_tcu_mbist_scan_out),
  .sio_tcu_mbist_scan_out(sio_tcu_mbist_scan_out),
  .ncu_tcu_mbist_scan_out(ncu_tcu_mbist_scan_out),
  .mcu0_tcu_mbist_scan_out(mcu0_tcu_mbist_scan_out),
  .mcu1_tcu_mbist_scan_out(mcu1_tcu_mbist_scan_out),
  .mcu2_tcu_mbist_scan_out(mcu2_tcu_mbist_scan_out),
  .mcu3_tcu_mbist_scan_out(mcu3_tcu_mbist_scan_out),
  .l2b0_tcu_mbist_scan_out(l2b0_tcu_mbist_scan_out),
  .l2b1_tcu_mbist_scan_out(l2b1_tcu_mbist_scan_out),
  .l2b2_tcu_mbist_scan_out(l2b2_tcu_mbist_scan_out),
  .l2b3_tcu_mbist_scan_out(l2b3_tcu_mbist_scan_out),
  .l2b4_tcu_mbist_scan_out(l2b4_tcu_mbist_scan_out),
  .l2b5_tcu_mbist_scan_out(l2b5_tcu_mbist_scan_out),
  .l2b6_tcu_mbist_scan_out(l2b6_tcu_mbist_scan_out),
  .l2b7_tcu_mbist_scan_out(l2b7_tcu_mbist_scan_out),
  .l2t0_tcu_mbist_scan_out(l2t0_tcu_mbist_scan_out),
  .l2t1_tcu_mbist_scan_out(l2t1_tcu_mbist_scan_out),
  .l2t2_tcu_mbist_scan_out(l2t2_tcu_mbist_scan_out),
  .l2t3_tcu_mbist_scan_out(l2t3_tcu_mbist_scan_out),
  .l2t4_tcu_mbist_scan_out(l2t4_tcu_mbist_scan_out),
  .l2t5_tcu_mbist_scan_out(l2t5_tcu_mbist_scan_out),
  .l2t6_tcu_mbist_scan_out(l2t6_tcu_mbist_scan_out),
  .l2t7_tcu_mbist_scan_out(l2t7_tcu_mbist_scan_out),
  .dmu_tcu_mbist_scan_out(dmu_tcu_mbist_scan_out),
  .peu_tcu_mbist_scan_out(peu_tcu_mbist_scan_out),
  .rdp_rdmc_mbist_scan_out(rdp_rdmc_mbist_scan_out),
  .rtx_mbist_scan_out(rtx_mbist_scan_out),
  .tds_mbist_scan_out(tds_mbist_scan_out),
  .spc0_tcu_lbist_scan_out(spc0_tcu_lbist_scan_out),
  .spc1_tcu_lbist_scan_out(spc1_tcu_lbist_scan_out),
  .spc2_tcu_lbist_scan_out(spc2_tcu_lbist_scan_out),
  .spc3_tcu_lbist_scan_out(spc3_tcu_lbist_scan_out),
  .spc4_tcu_lbist_scan_out(spc4_tcu_lbist_scan_out),
  .spc5_tcu_lbist_scan_out(spc5_tcu_lbist_scan_out),
  .spc6_tcu_lbist_scan_out(spc6_tcu_lbist_scan_out),
  .spc7_tcu_lbist_scan_out(spc7_tcu_lbist_scan_out),
  .tcu_spc_lbist_scan_in(tcu_spc_lbist_scan_in[7:0]),
  .spc0_tcu_shscan_scan_in(spc0_tcu_shscan_scan_in),
  .spc1_tcu_shscan_scan_in(spc1_tcu_shscan_scan_in),
  .spc2_tcu_shscan_scan_in(spc2_tcu_shscan_scan_in),
  .spc3_tcu_shscan_scan_in(spc3_tcu_shscan_scan_in),
  .spc4_tcu_shscan_scan_in(spc4_tcu_shscan_scan_in),
  .spc5_tcu_shscan_scan_in(spc5_tcu_shscan_scan_in),
  .spc6_tcu_shscan_scan_in(spc6_tcu_shscan_scan_in),
  .spc7_tcu_shscan_scan_in(spc7_tcu_shscan_scan_in),
  .tcu_spc0_shscan_scan_out(tcu_spc0_shscan_scan_out),
  .tcu_spc1_shscan_scan_out(tcu_spc1_shscan_scan_out),
  .tcu_spc2_shscan_scan_out(tcu_spc2_shscan_scan_out),
  .tcu_spc3_shscan_scan_out(tcu_spc3_shscan_scan_out),
  .tcu_spc4_shscan_scan_out(tcu_spc4_shscan_scan_out),
  .tcu_spc5_shscan_scan_out(tcu_spc5_shscan_scan_out),
  .tcu_spc6_shscan_scan_out(tcu_spc6_shscan_scan_out),
  .tcu_spc7_shscan_scan_out(tcu_spc7_shscan_scan_out),
  .tap_spc0_shscan_scan_out(tap_spc0_shscan_scan_out),
  .spc7_tap_shscan_scan_in(spc7_tap_shscan_scan_in),
  .jtag_spc_shscanid(jtag_spc_shscanid[2:0]),
  .tcu_spc_shscanid(tcu_spc_shscanid[2:0]),
  .jtag_spc0_shscan_clk_stop(jtag_spc0_shscan_clk_stop),
  .jtag_spc1_shscan_clk_stop(jtag_spc1_shscan_clk_stop),
  .jtag_spc2_shscan_clk_stop(jtag_spc2_shscan_clk_stop),
  .jtag_spc3_shscan_clk_stop(jtag_spc3_shscan_clk_stop),
  .jtag_spc4_shscan_clk_stop(jtag_spc4_shscan_clk_stop),
  .jtag_spc5_shscan_clk_stop(jtag_spc5_shscan_clk_stop),
  .jtag_spc6_shscan_clk_stop(jtag_spc6_shscan_clk_stop),
  .jtag_spc7_shscan_clk_stop(jtag_spc7_shscan_clk_stop),
  .tcu_spc0_shscan_clk_stop(tcu_spc0_shscan_clk_stop),
  .tcu_spc1_shscan_clk_stop(tcu_spc1_shscan_clk_stop),
  .tcu_spc2_shscan_clk_stop(tcu_spc2_shscan_clk_stop),
  .tcu_spc3_shscan_clk_stop(tcu_spc3_shscan_clk_stop),
  .tcu_spc4_shscan_clk_stop(tcu_spc4_shscan_clk_stop),
  .tcu_spc5_shscan_clk_stop(tcu_spc5_shscan_clk_stop),
  .tcu_spc6_shscan_clk_stop(tcu_spc6_shscan_clk_stop),
  .tcu_spc7_shscan_clk_stop(tcu_spc7_shscan_clk_stop),
  .jtag_spc_shscan_pce_ov(jtag_spc_shscan_pce_ov),
  .tcu_spc_shscan_pce_ov(tcu_spc_shscan_pce_ov),
  .jtag_l2t0_shscan_clk_stop(jtag_l2t0_shscan_clk_stop),
  .jtag_l2t1_shscan_clk_stop(jtag_l2t1_shscan_clk_stop),
  .jtag_l2t2_shscan_clk_stop(jtag_l2t2_shscan_clk_stop),
  .jtag_l2t3_shscan_clk_stop(jtag_l2t3_shscan_clk_stop),
  .jtag_l2t4_shscan_clk_stop(jtag_l2t4_shscan_clk_stop),
  .jtag_l2t5_shscan_clk_stop(jtag_l2t5_shscan_clk_stop),
  .jtag_l2t6_shscan_clk_stop(jtag_l2t6_shscan_clk_stop),
  .jtag_l2t7_shscan_clk_stop(jtag_l2t7_shscan_clk_stop),
  .jtag_l2t_shscan_pce_ov(jtag_l2t_shscan_pce_ov),
  .tcu_l2t0_shscan_clk_stop(tcu_l2t0_shscan_clk_stop),
  .tcu_l2t1_shscan_clk_stop(tcu_l2t1_shscan_clk_stop),
  .tcu_l2t2_shscan_clk_stop(tcu_l2t2_shscan_clk_stop),
  .tcu_l2t3_shscan_clk_stop(tcu_l2t3_shscan_clk_stop),
  .tcu_l2t4_shscan_clk_stop(tcu_l2t4_shscan_clk_stop),
  .tcu_l2t5_shscan_clk_stop(tcu_l2t5_shscan_clk_stop),
  .tcu_l2t6_shscan_clk_stop(tcu_l2t6_shscan_clk_stop),
  .tcu_l2t7_shscan_clk_stop(tcu_l2t7_shscan_clk_stop),
  .tcu_l2t_shscan_pce_ov(tcu_l2t_shscan_pce_ov),
  .core_avail(core_avail[7:0]),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .bank_avail(bank_avail[7:0]),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .tcu_se_scancollar_in(tcu_se_scancollar_in),
  .tcu_se_scancollar_out(tcu_se_scancollar_out),
  .tcu_array_bypass(tcu_array_bypass),
  .tcu_array_wr_inhibit(tcu_array_wr_inhibit),
  .jtag_upd_cntdly(jtag_upd_cntdly),
  .jtag_cntdly_data(jtag_cntdly_data[6:0]),
  .csdel_data(csdel_data[6:0]),
  .clkseq_stop(clkseq_stop),
  .clkseq_strt(clkseq_strt),
  .cycle_stretch(cycle_stretch),
  .tcu_ccu_clk_stretch(tcu_ccu_clk_stretch),
  .tcu_ccu_mux_sel(tcu_ccu_mux_sel[1:0]),
  .wmr_two(wmr_two),
  .start_bisx_por(start_bisx_por),
  .start_bisx_wmr(start_bisx_wmr),
  .stop_bisx_wmr(stop_bisx_wmr),
  .instr_mbist_diag(instr_mbist_diag),
  .soc_mbist_aclk(soc_mbist_aclk),
  .soc_mbist_bclk(soc_mbist_bclk),
  .soc_mbist_scan_en(soc_mbist_scan_en),
  .soc0_mbist_clk_stop(soc0_mbist_clk_stop),
  .mcu0_mbist_clk_stop(mcu0_mbist_clk_stop),
  .mcu1_mbist_clk_stop(mcu1_mbist_clk_stop),
  .mcu2_mbist_clk_stop(mcu2_mbist_clk_stop),
  .mcu3_mbist_clk_stop(mcu3_mbist_clk_stop),
  .l2b0_mbist_clk_stop(l2b0_mbist_clk_stop),
  .l2b1_mbist_clk_stop(l2b1_mbist_clk_stop),
  .l2b2_mbist_clk_stop(l2b2_mbist_clk_stop),
  .l2b3_mbist_clk_stop(l2b3_mbist_clk_stop),
  .l2b4_mbist_clk_stop(l2b4_mbist_clk_stop),
  .l2b5_mbist_clk_stop(l2b5_mbist_clk_stop),
  .l2b6_mbist_clk_stop(l2b6_mbist_clk_stop),
  .l2b7_mbist_clk_stop(l2b7_mbist_clk_stop),
  .l2t0_mbist_clk_stop(l2t0_mbist_clk_stop),
  .l2t1_mbist_clk_stop(l2t1_mbist_clk_stop),
  .l2t2_mbist_clk_stop(l2t2_mbist_clk_stop),
  .l2t3_mbist_clk_stop(l2t3_mbist_clk_stop),
  .l2t4_mbist_clk_stop(l2t4_mbist_clk_stop),
  .l2t5_mbist_clk_stop(l2t5_mbist_clk_stop),
  .l2t6_mbist_clk_stop(l2t6_mbist_clk_stop),
  .l2t7_mbist_clk_stop(l2t7_mbist_clk_stop),
  .dmu_mbist_clk_stop(dmu_mbist_clk_stop),
  .peu_mbist_clk_stop(peu_mbist_clk_stop),
  .rdp_mbist_clk_stop(rdp_mbist_clk_stop),
  .rtx_mbist_clk_stop(rtx_mbist_clk_stop),
  .tds_mbist_clk_stop(tds_mbist_clk_stop),
  .tcu_srd_atpgse(tcu_srd_atpgse),
  .tcu_srd_atpgd(tcu_srd_atpgd),
  .tcu_mio_scan_out31(tcu_mio_scan_out31),
  .tcu_srd_atpgmode(tcu_srd_atpgmode[2:0]),
  .mio_tcu_scan_in31(mio_tcu_scan_in31),
  .srd_tcu_atpgq(srd_tcu_atpgq),
  .l2t0_tcu_shscan_scan_out(l2t0_tcu_shscan_scan_out),
  .l2t1_tcu_shscan_scan_out(l2t1_tcu_shscan_scan_out),
  .l2t2_tcu_shscan_scan_out(l2t2_tcu_shscan_scan_out),
  .l2t3_tcu_shscan_scan_out(l2t3_tcu_shscan_scan_out),
  .l2t4_tcu_shscan_scan_out(l2t4_tcu_shscan_scan_out),
  .l2t5_tcu_shscan_scan_out(l2t5_tcu_shscan_scan_out),
  .l2t6_tcu_shscan_scan_out(l2t6_tcu_shscan_scan_out),
  .l2t7_tcu_shscan_scan_out(l2t7_tcu_shscan_scan_out),
  .tcu_l2t0_shscan_scan_in(tcu_l2t0_shscan_scan_in),
  .tcu_l2t1_shscan_scan_in(tcu_l2t1_shscan_scan_in),
  .tcu_l2t2_shscan_scan_in(tcu_l2t2_shscan_scan_in),
  .tcu_l2t3_shscan_scan_in(tcu_l2t3_shscan_scan_in),
  .tcu_l2t4_shscan_scan_in(tcu_l2t4_shscan_scan_in),
  .tcu_l2t5_shscan_scan_in(tcu_l2t5_shscan_scan_in),
  .tcu_l2t6_shscan_scan_in(tcu_l2t6_shscan_scan_in),
  .tcu_l2t7_shscan_scan_in(tcu_l2t7_shscan_scan_in),
  .ucb_csr_wr(ucb_csr_wr),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .ucb_data_out(ucb_data_out[6:0])
			      );

 tcu_jtag_ctl jtag_ctl (
         .jtag_id              ( jtag_revid_out    ),
			//.dmo_cfg (32'b0), // until driven by mbist_ctl
			// MBIST
			.spc0_mb_scan_in      (spc0_tap_mb_scan_in),
			.spc1_mb_scan_in      (spc1_tap_mb_scan_in),	
			.spc2_mb_scan_in      (spc2_tap_mb_scan_in),	       
			.spc3_mb_scan_in      (spc3_tap_mb_scan_in),
			.spc4_mb_scan_in      (spc4_tap_mb_scan_in),
			.spc5_mb_scan_in      (spc5_tap_mb_scan_in),
			.spc6_mb_scan_in      (spc6_tap_mb_scan_in),
			.spc7_mb_scan_in      (spc7_tap_mb_scan_in),
			// SHSCAN
			.spc0_clk_stop        (tcu_spc0_clk_stop),
			.spc1_clk_stop        (tcu_spc1_clk_stop),
			.spc2_clk_stop        (tcu_spc2_clk_stop),
			.spc3_clk_stop        (tcu_spc3_clk_stop),
			.spc4_clk_stop        (tcu_spc4_clk_stop),
			.spc5_clk_stop        (tcu_spc5_clk_stop),
			.spc6_clk_stop        (tcu_spc6_clk_stop),
			.spc7_clk_stop        (tcu_spc7_clk_stop),


			.l2t0_clk_stop        ( tcu_l2t0_clk_stop ),
			.l2t1_clk_stop        ( tcu_l2t1_clk_stop ),
			.l2t2_clk_stop        ( tcu_l2t2_clk_stop ),
			.l2t3_clk_stop        ( tcu_l2t3_clk_stop ),
			.l2t4_clk_stop        ( tcu_l2t4_clk_stop ),
			.l2t5_clk_stop        ( tcu_l2t5_clk_stop ),
			.l2t6_clk_stop        ( tcu_l2t6_clk_stop ),
			.l2t7_clk_stop        ( tcu_l2t7_clk_stop ),

			.tcu_tdo                   ( tcu_mio_tdo                         ),
			.tcu_tdo_en                ( tcu_mio_tdo_en                      ),
			.io_tck                    ( io_tck                              ),
			.io_tck_l                  ( io_tck                              ),
			.scan_in                   ( jtag_ctl_scan_in                    ),
			.scan_out                  ( jtag_ctl_scan_out                   ),
  .io_tdi(io_tdi),
  .io_tms(io_tms),
  .io_trst_l(io_trst_l),
  .io_test_mode(io_test_mode),
  .io_scan_en(io_scan_en),
  .jtag_ser_scan_q(jtag_ser_scan_q),
  .sel_chain(sel_chain[4:0]),
  .chain_select(chain_select),
  .ser_scan_out(ser_scan_out),
  .jt_scan_in(jt_scan_in),
  .tck_clk_tree(tck_clk_tree),
  .instr_mt_scan_rti(instr_mt_scan_rti),
  .tcu_jtag_aclk(tcu_jtag_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_jtag_se(tcu_jtag_se),
  .tap_spc0_shscan_scan_out(tap_spc0_shscan_scan_out),
  .spc7_tap_shscan_scan_in(spc7_tap_shscan_scan_in),
  .tcu_spc_shscan_aclk(tcu_spc_shscan_aclk),
  .tcu_spc_shscan_bclk(tcu_spc_shscan_bclk),
  .tcu_spc_shscan_scan_en(tcu_spc_shscan_scan_en),
  .jtag_spc_shscan_pce_ov(jtag_spc_shscan_pce_ov),
  .jtag_spc0_shscan_clk_stop(jtag_spc0_shscan_clk_stop),
  .jtag_spc1_shscan_clk_stop(jtag_spc1_shscan_clk_stop),
  .jtag_spc2_shscan_clk_stop(jtag_spc2_shscan_clk_stop),
  .jtag_spc3_shscan_clk_stop(jtag_spc3_shscan_clk_stop),
  .jtag_spc4_shscan_clk_stop(jtag_spc4_shscan_clk_stop),
  .jtag_spc5_shscan_clk_stop(jtag_spc5_shscan_clk_stop),
  .jtag_spc6_shscan_clk_stop(jtag_spc6_shscan_clk_stop),
  .jtag_spc7_shscan_clk_stop(jtag_spc7_shscan_clk_stop),
  .jtag_spc_shscanid(jtag_spc_shscanid[2:0]),
  .tcu_l2t_shscan_aclk(tcu_l2t_shscan_aclk),
  .tcu_l2t_shscan_bclk(tcu_l2t_shscan_bclk),
  .tcu_l2t_shscan_scan_en(tcu_l2t_shscan_scan_en),
  .jtag_l2t_shscan_pce_ov(jtag_l2t_shscan_pce_ov),
  .jtag_l2t0_shscan_clk_stop(jtag_l2t0_shscan_clk_stop),
  .jtag_l2t1_shscan_clk_stop(jtag_l2t1_shscan_clk_stop),
  .jtag_l2t2_shscan_clk_stop(jtag_l2t2_shscan_clk_stop),
  .jtag_l2t3_shscan_clk_stop(jtag_l2t3_shscan_clk_stop),
  .jtag_l2t4_shscan_clk_stop(jtag_l2t4_shscan_clk_stop),
  .jtag_l2t5_shscan_clk_stop(jtag_l2t5_shscan_clk_stop),
  .jtag_l2t6_shscan_clk_stop(jtag_l2t6_shscan_clk_stop),
  .jtag_l2t7_shscan_clk_stop(jtag_l2t7_shscan_clk_stop),
  .l2t7_tcu_shscan_scan_out(l2t7_tcu_shscan_scan_out),
  .tcu_efu_rowaddr(tcu_efu_rowaddr[6:0]),
  .tcu_efu_coladdr(tcu_efu_coladdr[4:0]),
  .tcu_efu_read_en(tcu_efu_read_en),
  .tcu_efu_read_mode(tcu_efu_read_mode[2:0]),
  .jtag_efu_clear_instr(jtag_efu_clear_instr),
  .jtag_efu_rvclr(jtag_efu_rvclr[6:0]),
  .tcu_efu_fuse_bypass(tcu_efu_fuse_bypass),
  .tcu_efu_dest_sample(tcu_efu_dest_sample),
  .tcu_efu_data_in(tcu_efu_data_in),
  .tcu_efu_updatedr(tcu_efu_updatedr),
  .tcu_efu_shiftdr(tcu_efu_shiftdr),
  .tcu_efu_capturedr(tcu_efu_capturedr),
  .efu_tcu_data_out(efu_tcu_data_out),
  .chop_aclk(chop_aclk),
  .chop_bclk(chop_bclk),
  .jt_scan_en(jt_scan_en),
  .jt_scan_aclk(jt_scan_aclk),
  .jt_scan_bclk(jt_scan_bclk),
  .mio_tcu_bs_scan_out(mio_tcu_bs_scan_out),
  .tcu_mio_bs_scan_in(tcu_mio_bs_scan_in),
  .tcu_mio_bs_scan_en(tcu_mio_bs_scan_en),
  .tcu_mio_bs_clk(tcu_mio_bs_clk),
  .tcu_mio_bs_aclk(tcu_mio_bs_aclk),
  .tcu_mio_bs_bclk(tcu_mio_bs_bclk),
  .tcu_mio_bs_uclk(tcu_mio_bs_uclk),
  .tcu_mio_bs_mode_ctl(tcu_mio_bs_mode_ctl),
  .tcu_mio_bs_highz_l(tcu_mio_bs_highz_l),
  .tcu_stciclk(tcu_stciclk),
  .tcu_stcicfg(tcu_stcicfg[1:0]),
  .tcu_stcid(tcu_stcid),
  .tcu_mio_stciq(tcu_mio_stciq),
  .mio_tcu_stciclk(mio_tcu_stciclk),
  .mio_tcu_stcicfg(mio_tcu_stcicfg[1:0]),
  .mio_tcu_stcid(mio_tcu_stcid),
  .stciq_tcu(stciq_tcu),
  .sbs_tcu_scan_out(sbs_tcu_scan_out),
  .jtag_sbs_scan_in(jtag_sbs_scan_in),
  .tcu_sbs_acmode(tcu_sbs_acmode),
  .tcu_sbs_actestsignal(tcu_sbs_actestsignal),
  .tcu_sbs_enbspt(tcu_sbs_enbspt),
  .tcu_sbs_bsinitclk(tcu_sbs_bsinitclk),
  .tcu_sbs_scan_en(tcu_sbs_scan_en),
  .tcu_sbs_clk(tcu_sbs_clk),
  .tcu_sbs_aclk(tcu_sbs_aclk),
  .tcu_sbs_bclk(tcu_sbs_bclk),
  .tcu_sbs_uclk(tcu_sbs_uclk),
  .tcu_sbs_enbstx(tcu_sbs_enbstx),
  .tcu_sbs_enbsrx(tcu_sbs_enbsrx),
  .lb_tcu_done_d(lb_tcu_done_d[7:0]),
  .tcu_spc_lbist_pgm(tcu_spc_lbist_pgm),
  .spc0_tcu_lbist_scan_out(spc0_tcu_lbist_scan_out),
  .spc1_tcu_lbist_scan_out(spc1_tcu_lbist_scan_out),
  .spc2_tcu_lbist_scan_out(spc2_tcu_lbist_scan_out),
  .spc3_tcu_lbist_scan_out(spc3_tcu_lbist_scan_out),
  .spc4_tcu_lbist_scan_out(spc4_tcu_lbist_scan_out),
  .spc5_tcu_lbist_scan_out(spc5_tcu_lbist_scan_out),
  .spc6_tcu_lbist_scan_out(spc6_tcu_lbist_scan_out),
  .spc7_tcu_lbist_scan_out(spc7_tcu_lbist_scan_out),
  .mbist_clkstpen(mbist_clkstpen),
  .mbist_done(mbist_done[47:0]),
  .mbist_fail(mbist_fail[47:0]),
  .mbist_done_fail(mbist_done_fail[1:0]),
  .jtag_csr_addr(jtag_csr_addr[5:0]),
  .jtag_csr_wr(jtag_csr_wr),
  .tap_spc0_mb_scan_out(tap_spc0_mb_scan_out),
  .tap_spc0_mb_aclk(tap_spc0_mb_aclk),
  .tap_spc0_mb_bclk(tap_spc0_mb_bclk),
  .tap_spc0_mb_scan_en(tap_spc0_mb_scan_en),
  .tap_spc0_mb_clk_stop(tap_spc0_mb_clk_stop),
  .tap_spc1_mb_scan_out(tap_spc1_mb_scan_out),
  .tap_spc1_mb_aclk(tap_spc1_mb_aclk),
  .tap_spc1_mb_bclk(tap_spc1_mb_bclk),
  .tap_spc1_mb_scan_en(tap_spc1_mb_scan_en),
  .tap_spc1_mb_clk_stop(tap_spc1_mb_clk_stop),
  .tap_spc2_mb_scan_out(tap_spc2_mb_scan_out),
  .tap_spc2_mb_aclk(tap_spc2_mb_aclk),
  .tap_spc2_mb_bclk(tap_spc2_mb_bclk),
  .tap_spc2_mb_scan_en(tap_spc2_mb_scan_en),
  .tap_spc2_mb_clk_stop(tap_spc2_mb_clk_stop),
  .tap_spc3_mb_scan_out(tap_spc3_mb_scan_out),
  .tap_spc3_mb_aclk(tap_spc3_mb_aclk),
  .tap_spc3_mb_bclk(tap_spc3_mb_bclk),
  .tap_spc3_mb_scan_en(tap_spc3_mb_scan_en),
  .tap_spc3_mb_clk_stop(tap_spc3_mb_clk_stop),
  .tap_spc4_mb_scan_out(tap_spc4_mb_scan_out),
  .tap_spc4_mb_aclk(tap_spc4_mb_aclk),
  .tap_spc4_mb_bclk(tap_spc4_mb_bclk),
  .tap_spc4_mb_scan_en(tap_spc4_mb_scan_en),
  .tap_spc4_mb_clk_stop(tap_spc4_mb_clk_stop),
  .tap_spc5_mb_scan_out(tap_spc5_mb_scan_out),
  .tap_spc5_mb_aclk(tap_spc5_mb_aclk),
  .tap_spc5_mb_bclk(tap_spc5_mb_bclk),
  .tap_spc5_mb_scan_en(tap_spc5_mb_scan_en),
  .tap_spc5_mb_clk_stop(tap_spc5_mb_clk_stop),
  .tap_spc6_mb_scan_out(tap_spc6_mb_scan_out),
  .tap_spc6_mb_aclk(tap_spc6_mb_aclk),
  .tap_spc6_mb_bclk(tap_spc6_mb_bclk),
  .tap_spc6_mb_scan_en(tap_spc6_mb_scan_en),
  .tap_spc6_mb_clk_stop(tap_spc6_mb_clk_stop),
  .tap_spc7_mb_scan_out(tap_spc7_mb_scan_out),
  .tap_spc7_mb_aclk(tap_spc7_mb_aclk),
  .tap_spc7_mb_bclk(tap_spc7_mb_bclk),
  .tap_spc7_mb_scan_en(tap_spc7_mb_scan_en),
  .tap_spc7_mb_clk_stop(tap_spc7_mb_clk_stop),
  .sii_tcu_mbist_scan_out(sii_tcu_mbist_scan_out),
  .sio_tcu_mbist_scan_out(sio_tcu_mbist_scan_out),
  .ncu_tcu_mbist_scan_out(ncu_tcu_mbist_scan_out),
  .mcu0_tcu_mbist_scan_out(mcu0_tcu_mbist_scan_out),
  .mcu1_tcu_mbist_scan_out(mcu1_tcu_mbist_scan_out),
  .mcu2_tcu_mbist_scan_out(mcu2_tcu_mbist_scan_out),
  .mcu3_tcu_mbist_scan_out(mcu3_tcu_mbist_scan_out),
  .l2b0_tcu_mbist_scan_out(l2b0_tcu_mbist_scan_out),
  .l2b1_tcu_mbist_scan_out(l2b1_tcu_mbist_scan_out),
  .l2b2_tcu_mbist_scan_out(l2b2_tcu_mbist_scan_out),
  .l2b3_tcu_mbist_scan_out(l2b3_tcu_mbist_scan_out),
  .l2b4_tcu_mbist_scan_out(l2b4_tcu_mbist_scan_out),
  .l2b5_tcu_mbist_scan_out(l2b5_tcu_mbist_scan_out),
  .l2b6_tcu_mbist_scan_out(l2b6_tcu_mbist_scan_out),
  .l2b7_tcu_mbist_scan_out(l2b7_tcu_mbist_scan_out),
  .l2t0_tcu_mbist_scan_out(l2t0_tcu_mbist_scan_out),
  .l2t1_tcu_mbist_scan_out(l2t1_tcu_mbist_scan_out),
  .l2t2_tcu_mbist_scan_out(l2t2_tcu_mbist_scan_out),
  .l2t3_tcu_mbist_scan_out(l2t3_tcu_mbist_scan_out),
  .l2t4_tcu_mbist_scan_out(l2t4_tcu_mbist_scan_out),
  .l2t5_tcu_mbist_scan_out(l2t5_tcu_mbist_scan_out),
  .l2t6_tcu_mbist_scan_out(l2t6_tcu_mbist_scan_out),
  .l2t7_tcu_mbist_scan_out(l2t7_tcu_mbist_scan_out),
  .dmu_tcu_mbist_scan_out(dmu_tcu_mbist_scan_out),
  .peu_tcu_mbist_scan_out(peu_tcu_mbist_scan_out),
  .rdp_rdmc_mbist_scan_out(rdp_rdmc_mbist_scan_out),
  .rtx_mbist_scan_out(rtx_mbist_scan_out),
  .tds_mbist_scan_out(tds_mbist_scan_out),
  .instr_mbist_diag(instr_mbist_diag),
  .soc_mbist_aclk(soc_mbist_aclk),
  .soc_mbist_bclk(soc_mbist_bclk),
  .soc_mbist_scan_en(soc_mbist_scan_en),
  .soc0_mbist_clk_stop(soc0_mbist_clk_stop),
  .mcu0_mbist_clk_stop(mcu0_mbist_clk_stop),
  .mcu1_mbist_clk_stop(mcu1_mbist_clk_stop),
  .mcu2_mbist_clk_stop(mcu2_mbist_clk_stop),
  .mcu3_mbist_clk_stop(mcu3_mbist_clk_stop),
  .l2b0_mbist_clk_stop(l2b0_mbist_clk_stop),
  .l2b1_mbist_clk_stop(l2b1_mbist_clk_stop),
  .l2b2_mbist_clk_stop(l2b2_mbist_clk_stop),
  .l2b3_mbist_clk_stop(l2b3_mbist_clk_stop),
  .l2b4_mbist_clk_stop(l2b4_mbist_clk_stop),
  .l2b5_mbist_clk_stop(l2b5_mbist_clk_stop),
  .l2b6_mbist_clk_stop(l2b6_mbist_clk_stop),
  .l2b7_mbist_clk_stop(l2b7_mbist_clk_stop),
  .l2t0_mbist_clk_stop(l2t0_mbist_clk_stop),
  .l2t1_mbist_clk_stop(l2t1_mbist_clk_stop),
  .l2t2_mbist_clk_stop(l2t2_mbist_clk_stop),
  .l2t3_mbist_clk_stop(l2t3_mbist_clk_stop),
  .l2t4_mbist_clk_stop(l2t4_mbist_clk_stop),
  .l2t5_mbist_clk_stop(l2t5_mbist_clk_stop),
  .l2t6_mbist_clk_stop(l2t6_mbist_clk_stop),
  .l2t7_mbist_clk_stop(l2t7_mbist_clk_stop),
  .dmu_mbist_clk_stop(dmu_mbist_clk_stop),
  .peu_mbist_clk_stop(peu_mbist_clk_stop),
  .rdp_mbist_clk_stop(rdp_mbist_clk_stop),
  .rtx_mbist_clk_stop(rtx_mbist_clk_stop),
  .tds_mbist_clk_stop(tds_mbist_clk_stop),
  .jtag_creg_addr(jtag_creg_addr[39:0]),
  .jtag_creg_data(jtag_creg_data[63:0]),
  .jtag_creg_rd_en(jtag_creg_rd_en),
  .jtag_creg_wr_en(jtag_creg_wr_en),
  .jtag_creg_addr_en(jtag_creg_addr_en),
  .jtag_creg_data_en(jtag_creg_data_en),
  .ucb_csr_wr(ucb_csr_wr),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .ucb_data_out(ucb_data_out[63:0]),
  .ucb_jtag_data_rdy(ucb_jtag_data_rdy),
  .jtag_ucb_data_ack(jtag_ucb_data_ack),
  .jtag_csr_data(jtag_csr_data[47:0]),
  .l2access(l2access[64:0]),
  .l2data_upd(l2data_upd),
  .l2addr_upd(l2addr_upd),
  .l2rti(l2rti),
  .instr_l2_wr(instr_l2_wr),
  .instr_l2_rd(instr_l2_rd),
  .l2rddata(l2rddata[63:0]),
  .l2_read_vld(l2_read_vld),
  .tcu_jtag_flush_req(tcu_jtag_flush_req),
  .tcu_jtag_flush_dly_req(tcu_jtag_flush_dly_req),
  .jtag_clock_start(jtag_clock_start),
  .instr_sstop_csmode(instr_sstop_csmode),
  .jtag_clk_stop_req(jtag_clk_stop_req),
  .clock_domain_upd(clock_domain_upd),
  .clock_domain(clock_domain[23:0]),
  .debug_reg_hard_stop_domain_1st(debug_reg_hard_stop_domain_1st[23:0]),
  .csdel_data(csdel_data[6:0]),
  .jtag_upd_cntdly(jtag_upd_cntdly),
  .jtag_cntdly_data(jtag_cntdly_data[6:0]),
  .clkseq_stop(clkseq_stop),
  .clkseq_strt(clkseq_strt),
  .spc_crs(spc_crs[63:0]),
  .spc_ss_sel(spc_ss_sel[7:0]),
  .core_sel(core_sel[7:0]),
  .core_sel_upd(core_sel_upd),
  .de_count(de_count[31:0]),
  .decnt_data(decnt_data[31:0]),
  .decnt_upd(decnt_upd),
  .cycle_count(cycle_count[63:0]),
  .cyc_count(cyc_count[63:0]),
  .cyc_count_upd(cyc_count_upd),
  .tcu_dcr(tcu_dcr[3:0]),
  .tcudcr_data(tcudcr_data[3:0]),
  .tcudcr_upd(tcudcr_upd),
  .doss_enab(doss_enab[63:0]),
  .dossen(dossen[63:0]),
  .dossen_upd(dossen_upd),
  .dossmode(dossmode[1:0]),
  .dossmode_upd(dossmode_upd),
  .doss_mode(doss_mode[1:0]),
  .ssreq_upd(ssreq_upd),
  .doss_stat(doss_stat[7:0]),
  .csmode(csmode),
  .csmode_upd(csmode_upd),
  .cs_mode(cs_mode),
  .cs_mode_active(cs_mode_active),
  .dmo_cfg(dmo_cfg[47:0]),
  .jtag_dmo_control(jtag_dmo_control[47:0]),
  .jtag_dmo_control_upd(jtag_dmo_control_upd),
  .jtag_dmo_enable(jtag_dmo_enable),
  .jtag_por_status(jtag_por_status),
  .jtag_por_enable(jtag_por_enable),
  .jtag_sck_byp(jtag_sck_byp),
  .jtag_test_protect(jtag_test_protect),
  .jtag_mt_enable(jtag_mt_enable));
   
   tcu_mbist_ctl mbist_ctl (
			    .l2clk                   ( l2clk                                  ),
			    .scan_in                 ( mbist_ctl_scan_in                      ),
			    .tcu_int_aclk            ( tcu_int_aclk                           ),
			    .tcu_int_bclk            ( tcu_int_bclk                           ),
			    .tcu_int_se              ( tcu_int_se                             ),
			    .tcu_pce_ov              ( tcu_int_pce_ov),
			    .ncu_spc0_core_available ( ncu_spc0_core_available                ),
			    .ncu_spc1_core_available ( ncu_spc1_core_available                ),
			    .ncu_spc2_core_available ( ncu_spc2_core_available                ),
			    .ncu_spc3_core_available ( ncu_spc3_core_available                ),
			    .ncu_spc4_core_available ( ncu_spc4_core_available                ),
			    .ncu_spc5_core_available ( ncu_spc5_core_available                ),
			    .ncu_spc6_core_available ( ncu_spc6_core_available                ),
			    .ncu_spc7_core_available ( ncu_spc7_core_available                ),
			    .mb_tcu_done             ( mb_tcu_done[47:0]     ),
			    .mb_tcu_fail             ( mb_tcu_fail[47:0]     ),
			    
			    .core_avail              ( core_avail                             ),
			    .tcu_mb_start            ( tcu_mbist_start[47:0] ),
			    .tcu_mbist_bisi_en       ( tcu_mbist_bisi_en                      ),
			    .scan_out                ( mbist_ctl_scan_out                     ),
  .tcu_int_ce(tcu_int_ce),
  .tcu_rst_flush_init_ack(tcu_rst_flush_init_ack),
  .start_bisx_por(start_bisx_por),
  .start_bisx_wmr(start_bisx_wmr),
  .stop_bisx_wmr(stop_bisx_wmr),
  .tcu_bisx_done(tcu_bisx_done),
  .mbist_clk_stop_req(mbist_clk_stop_req),
  .mbist_done(mbist_done[47:0]),
  .mbist_fail(mbist_fail[47:0]),
  .mbist_done_fail(mbist_done_fail[1:0]),
  .mbist_clkstpen(mbist_clkstpen),
  .lb_tcu_done_d(lb_tcu_done_d[7:0]),
  .tcu_mbist_user_mode(tcu_mbist_user_mode),
  .lb_tcu_done(lb_tcu_done[7:0]),
  .tcu_spc_lbist_start(tcu_spc_lbist_start[7:0]),
  .dmo_coresel(dmo_coresel[5:0]),
  .dmo_dcmuxctl(dmo_dcmuxctl),
  .dmo_icmuxctl(dmo_icmuxctl),
  .spc4_dmo_dout(spc4_dmo_dout[35:0]),
  .spc6_dmo_dout(spc6_dmo_dout[35:0]),
  .l2t4_dmo_dout(l2t4_dmo_dout[38:0]),
  .l2t6_dmo_dout(l2t6_dmo_dout[38:0]),
  .dmo_l2tsel(dmo_l2tsel[5:0]),
  .dmo_tagmuxctl(dmo_tagmuxctl),
  .rtx_tcu_dmo_data_out(rtx_tcu_dmo_data_out[39:0]),
  .tds_tcu_dmo_dout(tds_tcu_dmo_dout[39:0]),
  .rdp_tcu_dmo_dout(rdp_tcu_dmo_dout[39:0]),
  .tcu_rtx_dmo_ctl(tcu_rtx_dmo_ctl[2:0]),
  .tcu_mio_dmo_data(tcu_mio_dmo_data[39:0]),
  .tcu_mio_dmo_sync(tcu_mio_dmo_sync),
  .tcu_mio_mbist_done(tcu_mio_mbist_done),
  .tcu_mio_mbist_fail(tcu_mio_mbist_fail),
  .tcu_mio_jtag_membist_mode(tcu_mio_jtag_membist_mode),
  .jtag_dmo_enable(jtag_dmo_enable),
  .jtag_dmo_control_upd(jtag_dmo_control_upd),
  .jtag_dmo_control(jtag_dmo_control[47:0]),
  .dmo_cfg(dmo_cfg[47:0]),
  .cmp_io2x_sync_en(cmp_io2x_sync_en),
  .io_cmp_sync_en(io_cmp_sync_en),
  .cmp_io_sync_en(cmp_io_sync_en),
  .ncu_spc0_core_enable_status(ncu_spc0_core_enable_status),
  .ncu_spc1_core_enable_status(ncu_spc1_core_enable_status),
  .ncu_spc2_core_enable_status(ncu_spc2_core_enable_status),
  .ncu_spc3_core_enable_status(ncu_spc3_core_enable_status),
  .ncu_spc4_core_enable_status(ncu_spc4_core_enable_status),
  .ncu_spc5_core_enable_status(ncu_spc5_core_enable_status),
  .ncu_spc6_core_enable_status(ncu_spc6_core_enable_status),
  .ncu_spc7_core_enable_status(ncu_spc7_core_enable_status),
  .ncu_spc_pm(ncu_spc_pm),
  .ncu_spc_ba01(ncu_spc_ba01),
  .ncu_spc_ba23(ncu_spc_ba23),
  .ncu_spc_ba45(ncu_spc_ba45),
  .ncu_spc_ba67(ncu_spc_ba67),
  .ncu_tcu_bank_avail(ncu_tcu_bank_avail[7:0]),
  .bank_avail(bank_avail[7:0]),
  .tcu_test_protect(tcu_test_protect),
  .tcu_test_protect_cmp(tcu_test_protect_cmp),
  .jtag_csr_wr(jtag_csr_wr),
  .jtag_csr_addr(jtag_csr_addr[5:0]),
  .jtag_csr_data(jtag_csr_data[47:0]),
  .ucb_csr_wr(ucb_csr_wr),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .ucb_data_out(ucb_data_out[63:0]),
  .ac_test_mode(ac_test_mode),
  .csr_ucb_data(csr_ucb_data[63:0]),
  .csdel_data(csdel_data[6:0]),
  .cycle_count(cycle_count[63:0]),
  .tcu_dcr(tcu_dcr[3:0]),
  .de_count(de_count[31:0]),
  .debug_reg_hard_stop_domain_1st(debug_reg_hard_stop_domain_1st[23:0]),
  .tcu_peu_entestcfg(tcu_peu_entestcfg),
  .debug_cycle_counter_stop_to_mbc(debug_cycle_counter_stop_to_mbc),
  .mbist_clk_stop_to_mbc(mbist_clk_stop_to_mbc),
  .debug_cycle_counter_stop(debug_cycle_counter_stop),
  .mbist_clk_stop(mbist_clk_stop),
  .cycle_stretch_to_mbc(cycle_stretch_to_mbc),
  .cycle_stretch(cycle_stretch));


   tcu_ucb_ctl ucb_ctl(
		       //inputs
		       .scan_in(ucb_ctl_scan_in),
                       .tcu_pce_ov (tcu_int_pce_ov),
		       //outputs
		       .scan_out(ucb_ctl_scan_out),
  .iol2clk(iol2clk),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_se(tcu_int_se),
  .tcu_int_ce_ucb(tcu_int_ce_ucb),
  .tcu_tp_sync_2io(tcu_tp_sync_2io),
  .ac_test_mode(ac_test_mode),
  .tcu_test_protect(tcu_test_protect),
  .jtag_creg_addr(jtag_creg_addr[39:0]),
  .jtag_creg_data(jtag_creg_data[63:0]),
  .jtag_creg_rd_en(jtag_creg_rd_en),
  .jtag_creg_wr_en(jtag_creg_wr_en),
  .jtag_creg_addr_en(jtag_creg_addr_en),
  .jtag_creg_data_en(jtag_creg_data_en),
  .ucb_data_out(ucb_data_out[63:0]),
  .ucb_jtag_data_rdy(ucb_jtag_data_rdy),
  .jtag_ucb_data_ack(jtag_ucb_data_ack),
  .csr_ucb_data(csr_ucb_data[63:0]),
  .ucb_csr_wr(ucb_csr_wr),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .dbg_creg_access(dbg_creg_access),
  .dbg_creg_addr(dbg_creg_addr[39:0]),
  .dbg_creg_data(dbg_creg_data[63:0]),
  .dbg_creg_wr_en(dbg_creg_wr_en),
  .dbg_creg_addr_en(dbg_creg_addr_en),
  .dbg_creg_data_en(dbg_creg_data_en),
  .tcu_ncu_stall(tcu_ncu_stall),
  .ncu_tcu_vld(ncu_tcu_vld),
  .ncu_tcu_data(ncu_tcu_data[7:0]),
  .tcu_ncu_vld(tcu_ncu_vld),
  .tcu_ncu_data(tcu_ncu_data[7:0]),
  .ncu_tcu_stall(ncu_tcu_stall)
		       );

   tcu_clkstp_ctl clkstp_ctl(
			     .scan_in(clkstp_ctl_scan_in),
                             .tcu_pce_ov (tcu_int_pce_ov),
			     .scan_out(clkstp_ctl_scan_out),
  .l2clk(l2clk),
  .tcu_int_se(tcu_int_se),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_ce(tcu_int_ce),
  .cmp_dr_sync_en(cmp_dr_sync_en),
  .mt_mode_sync(mt_mode_sync),
  .instr_mt_scan_rti(instr_mt_scan_rti),
  .pre_spc0_clk_stop(pre_spc0_clk_stop),
  .pre_spc1_clk_stop(pre_spc1_clk_stop),
  .pre_spc2_clk_stop(pre_spc2_clk_stop),
  .pre_spc3_clk_stop(pre_spc3_clk_stop),
  .pre_spc4_clk_stop(pre_spc4_clk_stop),
  .pre_spc5_clk_stop(pre_spc5_clk_stop),
  .pre_spc6_clk_stop(pre_spc6_clk_stop),
  .pre_spc7_clk_stop(pre_spc7_clk_stop),
  .pre_bnk0_clk_stop(pre_bnk0_clk_stop),
  .pre_l2t0_clk_stop(pre_l2t0_clk_stop),
  .pre_bnk1_clk_stop(pre_bnk1_clk_stop),
  .pre_l2t1_clk_stop(pre_l2t1_clk_stop),
  .pre_bnk2_clk_stop(pre_bnk2_clk_stop),
  .pre_l2t2_clk_stop(pre_l2t2_clk_stop),
  .pre_bnk3_clk_stop(pre_bnk3_clk_stop),
  .pre_l2t3_clk_stop(pre_l2t3_clk_stop),
  .pre_bnk4_clk_stop(pre_bnk4_clk_stop),
  .pre_l2t4_clk_stop(pre_l2t4_clk_stop),
  .pre_bnk5_clk_stop(pre_bnk5_clk_stop),
  .pre_l2t5_clk_stop(pre_l2t5_clk_stop),
  .pre_bnk6_clk_stop(pre_bnk6_clk_stop),
  .pre_l2t6_clk_stop(pre_l2t6_clk_stop),
  .pre_bnk7_clk_stop(pre_bnk7_clk_stop),
  .pre_l2t7_clk_stop(pre_l2t7_clk_stop),
  .pre_mcu0_clk_stop(pre_mcu0_clk_stop),
  .pre_mcu0_io_clk_stop(pre_mcu0_io_clk_stop),
  .pre_mcu0_dr_clk_stop(pre_mcu0_dr_clk_stop),
  .pre_mcu0_fbd_clk_stop(pre_mcu0_fbd_clk_stop),
  .pre_mcu1_clk_stop(pre_mcu1_clk_stop),
  .pre_mcu1_io_clk_stop(pre_mcu1_io_clk_stop),
  .pre_mcu1_dr_clk_stop(pre_mcu1_dr_clk_stop),
  .pre_mcu1_fbd_clk_stop(pre_mcu1_fbd_clk_stop),
  .pre_mcu2_clk_stop(pre_mcu2_clk_stop),
  .pre_mcu2_io_clk_stop(pre_mcu2_io_clk_stop),
  .pre_mcu2_dr_clk_stop(pre_mcu2_dr_clk_stop),
  .pre_mcu2_fbd_clk_stop(pre_mcu2_fbd_clk_stop),
  .pre_mcu3_clk_stop(pre_mcu3_clk_stop),
  .pre_mcu3_io_clk_stop(pre_mcu3_io_clk_stop),
  .pre_mcu3_dr_clk_stop(pre_mcu3_dr_clk_stop),
  .pre_mcu3_fbd_clk_stop(pre_mcu3_fbd_clk_stop),
  .pre_soc0_clk_stop(pre_soc0_clk_stop),
  .pre_soc0_io_clk_stop(pre_soc0_io_clk_stop),
  .pre_soc1_io_clk_stop(pre_soc1_io_clk_stop),
  .pre_soc2_io_clk_stop(pre_soc2_io_clk_stop),
  .pre_soc3_clk_stop(pre_soc3_clk_stop),
  .pre_soc3_io_clk_stop(pre_soc3_io_clk_stop),
  .tcu_spc0_clk_stop(tcu_spc0_clk_stop),
  .tcu_spc1_clk_stop(tcu_spc1_clk_stop),
  .tcu_spc2_clk_stop(tcu_spc2_clk_stop),
  .tcu_spc3_clk_stop(tcu_spc3_clk_stop),
  .tcu_spc4_clk_stop(tcu_spc4_clk_stop),
  .tcu_spc5_clk_stop(tcu_spc5_clk_stop),
  .tcu_spc6_clk_stop(tcu_spc6_clk_stop),
  .tcu_spc7_clk_stop(tcu_spc7_clk_stop),
  .tcu_l2d0_clk_stop(tcu_l2d0_clk_stop),
  .tcu_l2d1_clk_stop(tcu_l2d1_clk_stop),
  .tcu_l2d2_clk_stop(tcu_l2d2_clk_stop),
  .tcu_l2d3_clk_stop(tcu_l2d3_clk_stop),
  .tcu_l2d4_clk_stop(tcu_l2d4_clk_stop),
  .tcu_l2d5_clk_stop(tcu_l2d5_clk_stop),
  .tcu_l2d6_clk_stop(tcu_l2d6_clk_stop),
  .tcu_l2d7_clk_stop(tcu_l2d7_clk_stop),
  .tcu_l2b0_clk_stop(tcu_l2b0_clk_stop),
  .tcu_l2b1_clk_stop(tcu_l2b1_clk_stop),
  .tcu_l2b2_clk_stop(tcu_l2b2_clk_stop),
  .tcu_l2b3_clk_stop(tcu_l2b3_clk_stop),
  .tcu_l2b4_clk_stop(tcu_l2b4_clk_stop),
  .tcu_l2b5_clk_stop(tcu_l2b5_clk_stop),
  .tcu_l2b6_clk_stop(tcu_l2b6_clk_stop),
  .tcu_l2b7_clk_stop(tcu_l2b7_clk_stop),
  .tcu_l2t0_clk_stop(tcu_l2t0_clk_stop),
  .tcu_l2t1_clk_stop(tcu_l2t1_clk_stop),
  .tcu_l2t2_clk_stop(tcu_l2t2_clk_stop),
  .tcu_l2t3_clk_stop(tcu_l2t3_clk_stop),
  .tcu_l2t4_clk_stop(tcu_l2t4_clk_stop),
  .tcu_l2t5_clk_stop(tcu_l2t5_clk_stop),
  .tcu_l2t6_clk_stop(tcu_l2t6_clk_stop),
  .tcu_l2t7_clk_stop(tcu_l2t7_clk_stop),
  .tcu_mcu0_clk_stop(tcu_mcu0_clk_stop),
  .tcu_mcu1_clk_stop(tcu_mcu1_clk_stop),
  .tcu_mcu2_clk_stop(tcu_mcu2_clk_stop),
  .tcu_mcu3_clk_stop(tcu_mcu3_clk_stop),
  .tcu_mcu0_dr_clk_stop(tcu_mcu0_dr_clk_stop),
  .tcu_mcu1_dr_clk_stop(tcu_mcu1_dr_clk_stop),
  .tcu_mcu2_dr_clk_stop(tcu_mcu2_dr_clk_stop),
  .tcu_mcu3_dr_clk_stop(tcu_mcu3_dr_clk_stop),
  .tcu_mcu0_io_clk_stop(tcu_mcu0_io_clk_stop),
  .tcu_mcu1_io_clk_stop(tcu_mcu1_io_clk_stop),
  .tcu_mcu2_io_clk_stop(tcu_mcu2_io_clk_stop),
  .tcu_mcu3_io_clk_stop(tcu_mcu3_io_clk_stop),
  .tcu_mcu0_fbd_clk_stop(tcu_mcu0_fbd_clk_stop),
  .tcu_mcu1_fbd_clk_stop(tcu_mcu1_fbd_clk_stop),
  .tcu_mcu2_fbd_clk_stop(tcu_mcu2_fbd_clk_stop),
  .tcu_mcu3_fbd_clk_stop(tcu_mcu3_fbd_clk_stop),
  .tcu_sii_clk_stop(tcu_sii_clk_stop),
  .tcu_sio_clk_stop(tcu_sio_clk_stop),
  .tcu_ncu_clk_stop(tcu_ncu_clk_stop),
  .tcu_ccx_clk_stop(tcu_ccx_clk_stop),
  .tcu_efu_clk_stop(tcu_efu_clk_stop),
  .tcu_sii_io_clk_stop(tcu_sii_io_clk_stop),
  .tcu_sio_io_clk_stop(tcu_sio_io_clk_stop),
  .tcu_ncu_io_clk_stop(tcu_ncu_io_clk_stop),
  .tcu_efu_io_clk_stop(tcu_efu_io_clk_stop),
  .tcu_db0_clk_stop(tcu_db0_clk_stop),
  .tcu_db1_clk_stop(tcu_db1_clk_stop),
  .tcu_mio_clk_stop(tcu_mio_clk_stop),
  .tcu_rdp_io_clk_stop(tcu_rdp_io_clk_stop),
  .tcu_mac_io_clk_stop(tcu_mac_io_clk_stop),
  .tcu_rtx_io_clk_stop(tcu_rtx_io_clk_stop),
  .tcu_tds_io_clk_stop(tcu_tds_io_clk_stop),
  .tcu_dmu_io_clk_stop(tcu_dmu_io_clk_stop),
  .tcu_peu_pc_clk_stop(tcu_peu_pc_clk_stop),
  .tcu_peu_io_clk_stop(tcu_peu_io_clk_stop)
			     );
   
   
   tcu_regs_ctl regs_ctl(
			 .scan_in(regs_ctl_scan_in),
                         .tcu_pce_ov (tcu_int_pce_ov),
			 .scan_out(regs_ctl_scan_out),
  .debug_event_stop(debug_event_stop),
  .l2clk(l2clk),
  .tcu_int_aclk(tcu_int_aclk),
  .tcu_int_bclk(tcu_int_bclk),
  .tcu_int_se(tcu_int_se),
  .tcu_int_ce(tcu_int_ce),
  .tcu_int_ce_to_ucb(tcu_int_ce_to_ucb),
  .tcu_int_ce_ucb(tcu_int_ce_ucb),
  .ac_test_mode(ac_test_mode),
  .cmp_io_sync_en(cmp_io_sync_en),
  .io_cmp_sync_en(io_cmp_sync_en),
  .cmp_io2x_sync_en(cmp_io2x_sync_en),
  .ac_trans_test_counter_start(ac_trans_test_counter_start),
  .jtag_clock_start(jtag_clock_start),
  .clock_domain(clock_domain[23:0]),
  .clock_domain_upd(clock_domain_upd),
  .core_sel(core_sel[7:0]),
  .core_sel_upd(core_sel_upd),
  .decnt_data(decnt_data[31:0]),
  .decnt_upd(decnt_upd),
  .de_count(de_count[31:0]),
  .cyc_count(cyc_count[63:0]),
  .cyc_count_upd(cyc_count_upd),
  .cycle_count(cycle_count[63:0]),
  .tcudcr_data(tcudcr_data[3:0]),
  .tcudcr_upd(tcudcr_upd),
  .tcu_dcr(tcu_dcr[3:0]),
  .dossen(dossen[63:0]),
  .dossen_upd(dossen_upd),
  .doss_enab(doss_enab[63:0]),
  .dossmode(dossmode[1:0]),
  .dossmode_upd(dossmode_upd),
  .doss_mode(doss_mode[1:0]),
  .ssreq_upd(ssreq_upd),
  .csmode(csmode),
  .csmode_upd(csmode_upd),
  .cs_mode(cs_mode),
  .cs_mode_active(cs_mode_active),
  .jtagclkstop_ov(jtagclkstop_ov),
  .jtag_ser_scan_q(jtag_ser_scan_q),
  .jtag_mt_enable(jtag_mt_enable),
  .jtag_test_protect(jtag_test_protect),
  .flush_test_protect(flush_test_protect),
  .tcu_tp_sync_2io(tcu_tp_sync_2io),
  .mt_mode_sync(mt_mode_sync),
  .rst_tcu_dbr_gen(rst_tcu_dbr_gen),
  .tcu_dbr_gateoff(tcu_dbr_gateoff),
  .cycle_stretch_to_mbc(cycle_stretch_to_mbc),
  .spc_crs(spc_crs[63:0]),
  .doss_stat(doss_stat[7:0]),
  .dbg1_tcu_soc_hard_stop(dbg1_tcu_soc_hard_stop),
  .spc0_hardstop_request(spc0_hardstop_request),
  .spc1_hardstop_request(spc1_hardstop_request),
  .spc2_hardstop_request(spc2_hardstop_request),
  .spc3_hardstop_request(spc3_hardstop_request),
  .spc4_hardstop_request(spc4_hardstop_request),
  .spc5_hardstop_request(spc5_hardstop_request),
  .spc6_hardstop_request(spc6_hardstop_request),
  .spc7_hardstop_request(spc7_hardstop_request),
  .clk_stop_ac_trans_counter_initiated(clk_stop_ac_trans_counter_initiated),
  .debug_reg_hard_stop_domain_1st(debug_reg_hard_stop_domain_1st[23:0]),
  .debug_cycle_counter_stop_to_mbc(debug_cycle_counter_stop_to_mbc),
  .spc0_ss_complete(spc0_ss_complete),
  .spc1_ss_complete(spc1_ss_complete),
  .spc2_ss_complete(spc2_ss_complete),
  .spc3_ss_complete(spc3_ss_complete),
  .spc4_ss_complete(spc4_ss_complete),
  .spc5_ss_complete(spc5_ss_complete),
  .spc6_ss_complete(spc6_ss_complete),
  .spc7_ss_complete(spc7_ss_complete),
  .tcu_ss_request(tcu_ss_request[7:0]),
  .tcu_do_mode(tcu_do_mode[7:0]),
  .tcu_ss_mode(tcu_ss_mode[7:0]),
  .spc0_softstop_request(spc0_softstop_request),
  .spc1_softstop_request(spc1_softstop_request),
  .spc2_softstop_request(spc2_softstop_request),
  .spc3_softstop_request(spc3_softstop_request),
  .spc4_softstop_request(spc4_softstop_request),
  .spc5_softstop_request(spc5_softstop_request),
  .spc6_softstop_request(spc6_softstop_request),
  .spc7_softstop_request(spc7_softstop_request),
  .spc0_ncu_core_running_status(spc0_ncu_core_running_status[7:0]),
  .spc1_ncu_core_running_status(spc1_ncu_core_running_status[7:0]),
  .spc2_ncu_core_running_status(spc2_ncu_core_running_status[7:0]),
  .spc3_ncu_core_running_status(spc3_ncu_core_running_status[7:0]),
  .spc4_ncu_core_running_status(spc4_ncu_core_running_status[7:0]),
  .spc5_ncu_core_running_status(spc5_ncu_core_running_status[7:0]),
  .spc6_ncu_core_running_status(spc6_ncu_core_running_status[7:0]),
  .spc7_ncu_core_running_status(spc7_ncu_core_running_status[7:0]),
  .spc0_trigger_pulse(spc0_trigger_pulse),
  .spc1_trigger_pulse(spc1_trigger_pulse),
  .spc2_trigger_pulse(spc2_trigger_pulse),
  .spc3_trigger_pulse(spc3_trigger_pulse),
  .spc4_trigger_pulse(spc4_trigger_pulse),
  .spc5_trigger_pulse(spc5_trigger_pulse),
  .spc6_trigger_pulse(spc6_trigger_pulse),
  .spc7_trigger_pulse(spc7_trigger_pulse),
  .dbg_creg_access(dbg_creg_access),
  .dbg_creg_addr(dbg_creg_addr[39:0]),
  .dbg_creg_data(dbg_creg_data[63:0]),
  .dbg_creg_wr_en(dbg_creg_wr_en),
  .dbg_creg_addr_en(dbg_creg_addr_en),
  .dbg_creg_data_en(dbg_creg_data_en),
  .spc_ss_mode(spc_ss_mode),
  .spc_ss_sel(spc_ss_sel[7:0]),
  .dbg1_tcu_soc_asrt_trigout(dbg1_tcu_soc_asrt_trigout),
  .tcu_mio_trigout(tcu_mio_trigout),
  .mio_tcu_trigin(mio_tcu_trigin),
  .tcu_rst_flush_stop_ack(tcu_rst_flush_stop_ack),
  .wmr_two(wmr_two),
  .mbist_clk_stop_req(mbist_clk_stop_req),
  .mbist_clk_stop_to_mbc(mbist_clk_stop_to_mbc),
  .l2data_upd(l2data_upd),
  .l2addr_upd(l2addr_upd),
  .l2rti(l2rti),
  .instr_l2_wr(instr_l2_wr),
  .instr_l2_rd(instr_l2_rd),
  .sio_tcu_data(sio_tcu_data),
  .sio_tcu_vld(sio_tcu_vld),
  .l2access(l2access[64:0]),
  .tcu_sii_data(tcu_sii_data),
  .tcu_sii_vld(tcu_sii_vld),
  .l2rddata(l2rddata[63:0]),
  .l2_read_vld(l2_read_vld),
  .ucb_csr_wr(ucb_csr_wr),
  .ucb_csr_addr(ucb_csr_addr[5:0]),
  .ucb_data_out(ucb_data_out[63:0])
			 );

   n2_clk_clkchp_4sel_32x_cust tck_clock_chopper_cust 
     (
      .tck          (io_tck),
      .s500         (1'b0),
      .s1000        (1'b0),
      .s1500        (1'b0),
      .s2000        (1'b1),
      .aclk         (chop_aclk),
      .bclk         (chop_bclk)
      );
   
// /////////////////////////////////////////////////////////////////////////////
// Temporary Assigns
// /////////////////////////////////////////////////////////////////////////////

// for jtag_ctl connections
////assign          ser_scan_out = 1'b0; // scan-out of concatenated scan chains
//assign          jtag_id[3:0] = 4'b0000;  // from external to tcu
//assign          iou_bs_scan_out = 1'b0;

// MBIST Connections for SPC Cores

assign mb_tcu_done = {
                        rdp_rdmc_tcu_mbist_done,
                        rtx_rxc_ipp0_tcu_mbist_done,
                        rtx_rxc_ipp1_tcu_mbist_done,
                        rtx_rxc_mb5_tcu_mbist_done,
                        rtx_rxc_mb6_tcu_mbist_done,
                        rtx_rxc_zcp0_tcu_mbist_done,
                        rtx_rxc_zcp1_tcu_mbist_done,
                        rtx_txc_txe0_tcu_mbist_done,
                        rtx_txc_txe1_tcu_mbist_done,
                        tds_smx_tcu_mbist_done,
                        tds_tdmc_tcu_mbist_done,
								peu_tcu_mbist_done,
								dmu_tcu_mbist_done,
								l2t7_tcu_mbist_done,
								l2t6_tcu_mbist_done,
								l2t5_tcu_mbist_done,
								l2t4_tcu_mbist_done,
								l2t3_tcu_mbist_done,
								l2t2_tcu_mbist_done,
								l2t1_tcu_mbist_done,
								l2t0_tcu_mbist_done,
								l2b7_tcu_mbist_done,
								l2b6_tcu_mbist_done,
								l2b5_tcu_mbist_done,
								l2b4_tcu_mbist_done,
								l2b3_tcu_mbist_done,
								l2b2_tcu_mbist_done,
								l2b1_tcu_mbist_done,
								l2b0_tcu_mbist_done,
								mcu3_tcu_mbist_done,
								mcu2_tcu_mbist_done,
								mcu1_tcu_mbist_done,
								mcu0_tcu_mbist_done,
								ncu_tcu_mbist_done,
								sio_tcu_mbist_done,
								sii_tcu_mbist_done,
								spc7_tcu_mbist_done,
								spc6_tcu_mbist_done,
								spc5_tcu_mbist_done,
								spc4_tcu_mbist_done,
								spc3_tcu_mbist_done,
								spc2_tcu_mbist_done,
								spc1_tcu_mbist_done,
								spc0_tcu_mbist_done};

assign mb_tcu_fail = {
                        rdp_rdmc_tcu_mbist_fail,
                        rtx_rxc_ipp0_tcu_mbist_fail,
                        rtx_rxc_ipp1_tcu_mbist_fail,
                        rtx_rxc_mb5_tcu_mbist_fail,
                        rtx_rxc_mb6_tcu_mbist_fail,
                        rtx_rxc_zcp0_tcu_mbist_fail,
                        rtx_rxc_zcp1_tcu_mbist_fail,
                        rtx_txc_txe0_tcu_mbist_fail,
                        rtx_txc_txe1_tcu_mbist_fail,
                        tds_smx_tcu_mbist_fail,
                        tds_tdmc_tcu_mbist_fail,
								peu_tcu_mbist_fail,
								dmu_tcu_mbist_fail,
								l2t7_tcu_mbist_fail,
								l2t6_tcu_mbist_fail,
								l2t5_tcu_mbist_fail,
								l2t4_tcu_mbist_fail,
								l2t3_tcu_mbist_fail,
								l2t2_tcu_mbist_fail,
								l2t1_tcu_mbist_fail,
								l2t0_tcu_mbist_fail,
								l2b7_tcu_mbist_fail,
								l2b6_tcu_mbist_fail,
								l2b5_tcu_mbist_fail,
								l2b4_tcu_mbist_fail,
								l2b3_tcu_mbist_fail,
								l2b2_tcu_mbist_fail,
								l2b1_tcu_mbist_fail,
								l2b0_tcu_mbist_fail,
								mcu3_tcu_mbist_fail,
								mcu2_tcu_mbist_fail,
								mcu1_tcu_mbist_fail,
								mcu0_tcu_mbist_fail,
								ncu_tcu_mbist_fail,
								sio_tcu_mbist_fail,
								sii_tcu_mbist_fail,
								spc7_tcu_mbist_fail,
								spc6_tcu_mbist_fail,
								spc5_tcu_mbist_fail,
								spc4_tcu_mbist_fail,
								spc3_tcu_mbist_fail,
								spc2_tcu_mbist_fail,
								spc1_tcu_mbist_fail,
								spc0_tcu_mbist_fail};

assign lb_tcu_done = { spc7_tcu_lbist_done,
                       spc6_tcu_lbist_done,
                       spc5_tcu_lbist_done,
                       spc4_tcu_lbist_done,
                       spc3_tcu_lbist_done,
                       spc2_tcu_lbist_done,
                       spc1_tcu_lbist_done,
                       spc0_tcu_lbist_done};

   //efu
assign 	tck = io_tck;


// fixscan start:
assign sigmux_ctl_scan_in         = io_scan_in[30];
assign jtag_ctl_scan_in           = sigmux_ctl_scan_out;
assign mbist_ctl_scan_in          = jtag_ctl_scan_out;
assign ucb_ctl_scan_in            = mbist_ctl_scan_out;
assign clkstp_ctl_scan_in         = ucb_ctl_scan_out;
assign regs_ctl_scan_in           = clkstp_ctl_scan_out;
assign clkgen_tcu_cmp_scan_in     = regs_ctl_scan_out;
assign clkgen_tcu_io_scan_in      = clkgen_tcu_cmp_scan_out;
assign tcu_scan_chain             = clkgen_tcu_io_scan_out;
// fixscan end:

endmodule

