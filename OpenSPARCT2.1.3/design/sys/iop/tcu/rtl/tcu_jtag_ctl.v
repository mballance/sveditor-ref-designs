// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_jtag_ctl.v
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





//*****************************
// JTAG TAP state machine
// - tap states (tap_state[3:0]) mapped to common industry usage
//*****************************
`define TAP_RESET       4'hF 
`define TAP_CAP_IR      4'hE
`define TAP_UPDATE_IR   4'hD
`define TAP_RTI         4'hC
`define TAP_PAUSE_IR    4'hB
`define TAP_SHIFT_IR    4'hA
`define TAP_EXIT1_IR    4'h9
`define TAP_EXIT2_IR    4'h8
`define TAP_SEL_DR      4'h7
`define TAP_CAP_DR      4'h6
`define TAP_UPDATE_DR   4'h5
`define TAP_SEL_IR      4'h4
`define TAP_PAUSE_DR    4'h3
`define TAP_SHIFT_DR    4'h2
`define TAP_EXIT1_DR    4'h1
`define TAP_EXIT2_DR    4'h0

//*****************************
// JTAG IDCODE - bits 27:1 need to be UPDATED
//   31:28 = jtag_id[3:0]           Version     = 4 bits   
//   27:12 = 0bxxxx_xxxx_xxxx_xxxx  Part Number = 16 bits 
//   11:1  = 0b000_0011_1110        Manuf. Id.  = 11 bits; Sun=0x03e
//      0  = 1'b1           lsb is constant one = 1 bit
//*****************************
`define PART_ID        16'h2aaa
`define MANUF_ID       11'h3e

//*****************************
// JTAG Instruction Opcodes
//*****************************

`define TAP_EXTEST            8'h00
`define TAP_BYPASS            8'hff
`define TAP_IDCODE            8'h01
`define TAP_SAMPLE_PRELOAD    8'h02
`define TAP_HIGHZ             8'h03
`define TAP_CLAMP             8'h04
`define TAP_EXTEST_PULSE      8'h05
`define TAP_EXTEST_TRAIN      8'h06

`define TAP_CREG_ADDR         8'h08
`define TAP_CREG_WDATA        8'h09
`define TAP_CREG_RDATA        8'h0a
`define TAP_CREG_SCRATCH      8'h0b
`define TAP_NCU_WR            8'h0c
`define TAP_NCU_RD            8'h0d
`define TAP_NCU_WADDR         8'h0e
`define TAP_NCU_WDATA         8'h0f
`define TAP_NCU_RADDR         8'h10

`define TAP_SERSCAN           8'h80
`define TAP_CHAINSEL          8'h81
`define TAP_MT_ACCESS         8'h82
`define TAP_MT_CLEAR          8'h83
`define TAP_MT_SCAN           8'h84

`define TAP_TP_ACCESS         8'h88
`define TAP_TP_CLEAR          8'h89

`define TAP_FUSE_READ         8'h28
`define TAP_FUSE_BYPASS_DATA  8'h29
`define TAP_FUSE_BYPASS       8'h2a
`define TAP_FUSE_ROW_ADDR     8'h2b
`define TAP_FUSE_COL_ADDR     8'h2c
`define TAP_FUSE_READ_MODE    8'h2d
`define TAP_FUSE_DEST_SAMPLE  8'h2e
`define TAP_FUSE_RVCLR        8'h2f

`define TAP_MBIST_CLKSTPEN    8'h13
`define TAP_MBIST_BYPASS      8'h14
`define TAP_MBIST_MODE        8'h15
`define TAP_MBIST_START       8'h16
`define TAP_MBIST_RESULT      8'h18
`define TAP_MBIST_DIAG        8'h19
`define TAP_MBIST_GETDONE     8'h1a
`define TAP_MBIST_GETFAIL     8'h1b
`define TAP_DMO_ACCESS        8'h1c
`define TAP_DMO_CLEAR         8'h1d
`define TAP_DMO_CONFIG        8'h1e
`define TAP_MBIST_ABORT       8'h1f

`define TAP_SPC_SHSCAN        5'b00110
`define TAP_SPCTHR0_SHSCAN    8'h30
`define TAP_SPCTHR1_SHSCAN    8'h31
`define TAP_SPCTHR2_SHSCAN    8'h32
`define TAP_SPCTHR3_SHSCAN    8'h33
`define TAP_SPCTHR4_SHSCAN    8'h34
`define TAP_SPCTHR5_SHSCAN    8'h35
`define TAP_SPCTHR6_SHSCAN    8'h36
`define TAP_SPCTHR7_SHSCAN    8'h37
`define TAP_L2T_SHSCAN        8'h38

`define TAP_CLOCK_SSTOP       8'h40
`define TAP_CLOCK_HSTOP       8'h41
`define TAP_CLOCK_START       8'h42
`define TAP_CLOCK_DOMAIN      8'h43
`define TAP_CLOCK_STATUS      8'h44
`define TAP_CLKSTP_DELAY      8'h45
`define TAP_CORE_SELECT       8'h46

`define TAP_DE_COUNT          8'h48
`define TAP_CYCLE_COUNT       8'h49
`define TAP_TCU_DCR           8'h4A
`define TAP_CORE_RUN_STATUS   8'h4C
`define TAP_DOSS_ENABLE       8'h4D
`define TAP_DOSS_MODE         8'h4E
`define TAP_SS_REQUEST        8'h4F

`define TAP_DOSS_STATUS       8'h50
`define TAP_CS_MODE           8'h51
`define TAP_CS_STATUS         8'h52

`define TAP_L2_ADDR           8'h58
`define TAP_L2_WRDATA         8'h59
`define TAP_L2_WR             8'h5A
`define TAP_L2_RD             8'h5B

`define TAP_LBIST_START       8'h60
`define TAP_LBIST_BYPASS      8'h61
`define TAP_LBIST_MODE        8'h62
`define TAP_LBIST_ACCESS      8'h63
`define TAP_LBIST_GETDONE     8'h64
`define TAP_LBIST_ABORT       8'h65

`define TAP_STCI_ACCESS       8'h90
`define TAP_STCI_CLEAR        8'h91

`define TAP_JTPOR_ACCESS      8'hA0
`define TAP_JTPOR_CLEAR       8'hA1
`define TAP_JTPOR_STATUS      8'hA2
`define TAP_SCKBYP_ACCESS     8'hA3
`define TAP_SCKBYP_CLEAR      8'hA4




module tcu_jtag_ctl (
  io_tdi, 
  io_tms, 
  io_trst_l, 
  io_tck, 
  io_tck_l, 
  tcu_tdo, 
  tcu_tdo_en, 
  io_test_mode, 
  io_scan_en, 
  jtag_ser_scan_q, 
  sel_chain, 
  chain_select, 
  ser_scan_out, 
  jt_scan_in, 
  tck_clk_tree, 
  instr_mt_scan_rti, 
  jtag_id, 
  scan_in, 
  scan_out, 
  tcu_jtag_aclk, 
  tcu_int_bclk, 
  tcu_jtag_se, 
  tap_spc0_shscan_scan_out, 
  spc7_tap_shscan_scan_in, 
  tcu_spc_shscan_aclk, 
  tcu_spc_shscan_bclk, 
  tcu_spc_shscan_scan_en, 
  jtag_spc_shscan_pce_ov, 
  jtag_spc0_shscan_clk_stop, 
  jtag_spc1_shscan_clk_stop, 
  jtag_spc2_shscan_clk_stop, 
  jtag_spc3_shscan_clk_stop, 
  jtag_spc4_shscan_clk_stop, 
  jtag_spc5_shscan_clk_stop, 
  jtag_spc6_shscan_clk_stop, 
  jtag_spc7_shscan_clk_stop, 
  jtag_spc_shscanid, 
  tcu_l2t_shscan_aclk, 
  tcu_l2t_shscan_bclk, 
  tcu_l2t_shscan_scan_en, 
  jtag_l2t_shscan_pce_ov, 
  jtag_l2t0_shscan_clk_stop, 
  jtag_l2t1_shscan_clk_stop, 
  jtag_l2t2_shscan_clk_stop, 
  jtag_l2t3_shscan_clk_stop, 
  jtag_l2t4_shscan_clk_stop, 
  jtag_l2t5_shscan_clk_stop, 
  jtag_l2t6_shscan_clk_stop, 
  jtag_l2t7_shscan_clk_stop, 
  l2t7_tcu_shscan_scan_out, 
  spc0_clk_stop, 
  spc1_clk_stop, 
  spc2_clk_stop, 
  spc3_clk_stop, 
  spc4_clk_stop, 
  spc5_clk_stop, 
  spc6_clk_stop, 
  spc7_clk_stop, 
  l2t0_clk_stop, 
  l2t1_clk_stop, 
  l2t2_clk_stop, 
  l2t3_clk_stop, 
  l2t4_clk_stop, 
  l2t5_clk_stop, 
  l2t6_clk_stop, 
  l2t7_clk_stop, 
  tcu_efu_rowaddr, 
  tcu_efu_coladdr, 
  tcu_efu_read_en, 
  tcu_efu_read_mode, 
  jtag_efu_clear_instr, 
  jtag_efu_rvclr, 
  tcu_efu_fuse_bypass, 
  tcu_efu_dest_sample, 
  tcu_efu_data_in, 
  tcu_efu_updatedr, 
  tcu_efu_shiftdr, 
  tcu_efu_capturedr, 
  efu_tcu_data_out, 
  chop_aclk, 
  chop_bclk, 
  jt_scan_en, 
  jt_scan_aclk, 
  jt_scan_bclk, 
  mio_tcu_bs_scan_out, 
  tcu_mio_bs_scan_in, 
  tcu_mio_bs_scan_en, 
  tcu_mio_bs_clk, 
  tcu_mio_bs_aclk, 
  tcu_mio_bs_bclk, 
  tcu_mio_bs_uclk, 
  tcu_mio_bs_mode_ctl, 
  tcu_mio_bs_highz_l, 
  tcu_stciclk, 
  tcu_stcicfg, 
  tcu_stcid, 
  tcu_mio_stciq, 
  mio_tcu_stciclk, 
  mio_tcu_stcicfg, 
  mio_tcu_stcid, 
  stciq_tcu, 
  sbs_tcu_scan_out, 
  jtag_sbs_scan_in, 
  tcu_sbs_acmode, 
  tcu_sbs_actestsignal, 
  tcu_sbs_enbspt, 
  tcu_sbs_bsinitclk, 
  tcu_sbs_scan_en, 
  tcu_sbs_clk, 
  tcu_sbs_aclk, 
  tcu_sbs_bclk, 
  tcu_sbs_uclk, 
  tcu_sbs_enbstx, 
  tcu_sbs_enbsrx, 
  lb_tcu_done_d, 
  tcu_spc_lbist_pgm, 
  spc0_tcu_lbist_scan_out, 
  spc1_tcu_lbist_scan_out, 
  spc2_tcu_lbist_scan_out, 
  spc3_tcu_lbist_scan_out, 
  spc4_tcu_lbist_scan_out, 
  spc5_tcu_lbist_scan_out, 
  spc6_tcu_lbist_scan_out, 
  spc7_tcu_lbist_scan_out, 
  mbist_clkstpen, 
  mbist_done, 
  mbist_fail, 
  mbist_done_fail, 
  jtag_csr_addr, 
  jtag_csr_wr, 
  spc0_mb_scan_in, 
  tap_spc0_mb_scan_out, 
  tap_spc0_mb_aclk, 
  tap_spc0_mb_bclk, 
  tap_spc0_mb_scan_en, 
  tap_spc0_mb_clk_stop, 
  spc1_mb_scan_in, 
  tap_spc1_mb_scan_out, 
  tap_spc1_mb_aclk, 
  tap_spc1_mb_bclk, 
  tap_spc1_mb_scan_en, 
  tap_spc1_mb_clk_stop, 
  spc2_mb_scan_in, 
  tap_spc2_mb_scan_out, 
  tap_spc2_mb_aclk, 
  tap_spc2_mb_bclk, 
  tap_spc2_mb_scan_en, 
  tap_spc2_mb_clk_stop, 
  spc3_mb_scan_in, 
  tap_spc3_mb_scan_out, 
  tap_spc3_mb_aclk, 
  tap_spc3_mb_bclk, 
  tap_spc3_mb_scan_en, 
  tap_spc3_mb_clk_stop, 
  spc4_mb_scan_in, 
  tap_spc4_mb_scan_out, 
  tap_spc4_mb_aclk, 
  tap_spc4_mb_bclk, 
  tap_spc4_mb_scan_en, 
  tap_spc4_mb_clk_stop, 
  spc5_mb_scan_in, 
  tap_spc5_mb_scan_out, 
  tap_spc5_mb_aclk, 
  tap_spc5_mb_bclk, 
  tap_spc5_mb_scan_en, 
  tap_spc5_mb_clk_stop, 
  spc6_mb_scan_in, 
  tap_spc6_mb_scan_out, 
  tap_spc6_mb_aclk, 
  tap_spc6_mb_bclk, 
  tap_spc6_mb_scan_en, 
  tap_spc6_mb_clk_stop, 
  spc7_mb_scan_in, 
  tap_spc7_mb_scan_out, 
  tap_spc7_mb_aclk, 
  tap_spc7_mb_bclk, 
  tap_spc7_mb_scan_en, 
  tap_spc7_mb_clk_stop, 
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
  jtag_creg_addr, 
  jtag_creg_data, 
  jtag_creg_rd_en, 
  jtag_creg_wr_en, 
  jtag_creg_addr_en, 
  jtag_creg_data_en, 
  ucb_csr_wr, 
  ucb_csr_addr, 
  ucb_data_out, 
  ucb_jtag_data_rdy, 
  jtag_ucb_data_ack, 
  jtag_csr_data, 
  l2access, 
  l2data_upd, 
  l2addr_upd, 
  l2rti, 
  instr_l2_wr, 
  instr_l2_rd, 
  l2rddata, 
  l2_read_vld, 
  tcu_jtag_flush_req, 
  tcu_jtag_flush_dly_req, 
  jtag_clock_start, 
  instr_sstop_csmode, 
  jtag_clk_stop_req, 
  clock_domain_upd, 
  clock_domain, 
  debug_reg_hard_stop_domain_1st, 
  csdel_data, 
  jtag_upd_cntdly, 
  jtag_cntdly_data, 
  clkseq_stop, 
  clkseq_strt, 
  spc_crs, 
  spc_ss_sel, 
  core_sel, 
  core_sel_upd, 
  de_count, 
  decnt_data, 
  decnt_upd, 
  cycle_count, 
  cyc_count, 
  cyc_count_upd, 
  tcu_dcr, 
  tcudcr_data, 
  tcudcr_upd, 
  doss_enab, 
  dossen, 
  dossen_upd, 
  dossmode, 
  dossmode_upd, 
  doss_mode, 
  ssreq_upd, 
  doss_stat, 
  csmode, 
  csmode_upd, 
  cs_mode, 
  cs_mode_active, 
  dmo_cfg, 
  jtag_dmo_control, 
  jtag_dmo_control_upd, 
  jtag_dmo_enable, 
  jtag_por_status, 
  jtag_por_enable, 
  jtag_sck_byp, 
  jtag_test_protect, 
  jtag_mt_enable);
wire tck_l;
wire pin_scanmode;
wire pin_scan_en;
wire l1en;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1tck;
wire ucb_jtag_data_rdy_sync_reg_scanin;
wire ucb_jtag_data_rdy_sync_reg_scanout;
wire ucb_jtag_data_rdy_sync;
wire flush;
wire flush_dly;
wire jtag_dr_tdo;
wire [31:0] new_idcode;
wire instr_idcode;
wire [5:0] selchain;
wire instr_chainsel;
wire [6:0] new_rvclr;
wire instr_rvclr;
wire [47:0] new_mbibypass;
wire instr_mbist_bypass;
wire [47:0] mbist_get_done_fail;
wire instr_mbist66;
wire [1:0] mbist_result;
wire instr_mbist_result;
wire [3:0] mbist_mode;
wire instr_mbist_mode;
wire [7:0] new_lbist_bypass;
wire instr_lbist_bypass;
wire [7:0] lbist_done;
wire instr_lbist_getdone;
wire [1:0] lbist_mode;
wire instr_lbist_mode;
wire [39:0] creg_addr;
wire creg_addr_instr;
wire [63:0] creg_wdata;
wire creg_wdata_instr;
wire creg_rdrtrn_out;
wire instr_creg_rdata;
wire [31:0] new_gen32;
wire instr_gen32;
wire [63:0] new_gen64;
wire instr_gen64;
wire [6:0] clkstopdly;
wire instr_clkstopdly;
wire [1:0] clkseqstat;
wire instr_clkseq_stat;
wire [7:0] coresel;
wire instr_core_sel;
wire [3:0] tcudcr;
wire instr_tcu_dcr;
wire instr_doss_mode;
wire [7:0] dossstat;
wire instr_doss_status;
wire instr_cs_mode;
wire csstat;
wire instr_cs_status;
wire jtporstat;
wire instr_jtpor_status;
wire stciq_tdo;
wire stci_val_instr;
wire [47:0] dmocfg;
wire instr_dmo_config;
wire tap_tdo;
wire tap_tdo_en;
wire ext_dr_tdo;
wire bs_instr;
wire jtag_ser_scan;
wire fuse_dout;
wire fuse_instr;
wire mbist_scan_out;
wire spcshscan_scan_out;
wire instr_spc_shscan;
wire l2tshscan_scan_out;
wire instr_l2t_shscan;
wire ext_jtag_instr;
wire scan_instr;
wire ext_jtag_ll_reg_scanin;
wire ext_jtag_ll_reg_scanout_unused;
wire next_fuse_dout;
wire [2:0] new_fusemode;
wire instr_fuse_read_mode;
wire [6:0] new_fuserowaddr;
wire instr_fuse_row_addr;
wire [4:0] new_fusecoladdr;
wire instr_fuse_col_addr;
wire instr_fuse_read;
wire instr_fuse_dest_sample;
wire instr_fuse_bypass_data;
wire bypass_sel;
wire [3:0] tap_state;
wire [7:0] instr;
wire capture_dr_state;
wire shift_dr_state;
wire update_dr_state;
wire update_ireg_unused;
wire tlr_state;
wire tap_scan_in;
wire tap_scan_out;
wire instr_highz;
wire instr_clamp;
wire instr_bypass;
wire instr_extest;
wire instr_sample_pl;
wire instr_extest_pulse;
wire instr_extest_train;
wire instr_ser_scan;
wire instr_mt_scan;
wire instr_fuse_bypass;
wire instr_mbist_clkstpen;
wire instr_mbist_getdone;
wire instr_mbist_getfail;
wire instr_mbist_start;
wire instr_mbist_abort;
wire instr_lbist_start;
wire instr_lbist_access;
wire instr_lbist_abort;
wire instr_creg_addr;
wire instr_creg_wdata;
wire instr_ncu_wr;
wire instr_ncu_rd;
wire instr_ncu_waddr;
wire instr_ncu_wdata;
wire instr_ncu_raddr;
wire instr_clock_sstop;
wire instr_clock_hstop;
wire instr_clock_start;
wire instr_clock_domain;
wire instr_l2_addr;
wire instr_l2_wrdata;
wire instr_de_count;
wire instr_cycle_count;
wire instr_core_run_stat;
wire instr_doss_enable;
wire instr_ss_request;
wire instr_stci_access;
wire instr_jtpor_access;
wire instr_jtpor_clear;
wire instr_sckbyp_access;
wire instr_sckbyp_clear;
wire instr_mt_access;
wire instr_mt_clear;
wire instr_stci_clear;
wire instr_dmo_access;
wire instr_dmo_clear;
wire instr_tp_access;
wire instr_tp_clear;
wire ucb_jtag_sel_mbist_mode;
wire ucb_jtag_sel_mbist_bypass;
wire ucb_jtag_sel_mbist_abort;
wire ucb_jtag_sel_lbist_mode;
wire ucb_jtag_sel_lbist_bypass;
wire ucb_wr_mbist_mode;
wire ucb_wr_mbist_bypass;
wire ucb_wr_mbist_abort;
wire ucb_wr_lbist_mode;
wire ucb_wr_lbist_bypass;
wire jtag_csr_wr_din;
wire upd_ir_state;
wire jtag_csr_wr_reg_scanin;
wire jtag_csr_wr_reg_scanout;
wire jtag_csr_data_reg_scanin;
wire jtag_csr_data_reg_scanout;
wire clock_chop_aclk;
wire clock_chop_bclk;
wire pre_tcu_sbs_enbstx;
wire pre_tcu_sbs_enbsrx;
wire pre_tcu_sbs_acmode;
wire actest_out;
wire pre_tcu_sbs_enbspt;
wire tck_bsinitclk;
wire tck_l_bsinitclk;
wire bs_scan_en;
wire bs_clk;
wire bs_aclk;
wire bs_bclk;
wire bs_uclk;
wire bs_actest_reg_scanout_unused;
wire actest_in;
wire rti_state;
wire actest_toggle;
wire actest_gen;
wire ex_state;
wire ex1_dr_state;
wire ex2_dr_state;
wire extest_active;
wire pre_tcu_mio_bs_mode_ctl;
wire bs_mode_ctl;
wire pre_tcu_mio_bs_highz_l;
wire bs_aclk_en;
wire bs_bclk_en;
wire bs_scan_en_pre;
wire bs_scan_enne_reg_scanin;
wire bs_scan_enne_reg_scanout_unused;
wire bs_scan_en_ne;
wire bs_scan_enpe_reg_scanin;
wire bs_scan_enpe_reg_scanout;
wire bs_scan_en_pe;
wire soclk_buf;
wire soclk_l;
wire bs_update;
wire tap_idcode_reg_scanin;
wire tap_idcode_reg_scanout;
wire [31:0] next_idcode;
wire [31:0] idcode_data;
wire tap_chainsel_reg_scanin;
wire tap_chainsel_reg_scanout;
wire [5:0] next_selchain;
wire tap_fusemode_shift_reg_scanin;
wire tap_fusemode_shift_reg_scanout;
wire [2:0] next_new_fusemode;
wire [2:0] fusemode;
wire tap_fusemode_upd_reg_scanin;
wire tap_fusemode_upd_reg_scanout_unused;
wire [2:0] next_fusemode;
wire tap_fuserowaddr_shift_reg_scanin;
wire tap_fuserowaddr_shift_reg_scanout;
wire [6:0] next_new_fuserowaddr;
wire [6:0] fuserowaddr;
wire tap_fuserowaddr_upd_reg_scanin;
wire tap_fuserowaddr_upd_reg_scanout_unused;
wire [6:0] next_fuserowaddr;
wire tap_fusecoladdr_shift_reg_scanin;
wire tap_fusecoladdr_shift_reg_scanout;
wire [4:0] next_new_fusecoladdr;
wire [4:0] fusecoladdr;
wire tap_fusecoladdr_upd_reg_scanin;
wire tap_fusecoladdr_upd_reg_scanout_unused;
wire [4:0] next_fusecoladdr;
wire tap_fusereaden_reg_scanin;
wire tap_fusereaden_reg_scanout;
wire next_fusereaden;
wire new_fusereaden;
wire tap_fusedestsample_reg_scanin;
wire tap_fusedestsample_reg_scanout;
wire next_fusedestsample;
wire new_fusedestsample;
wire tap_fusebypass_reg_scanin;
wire tap_fusebypass_reg_scanout;
wire next_fusebypass;
wire new_fusebypass;
wire fuse_capshft;
wire tap_rvclr_shift_reg_scanin;
wire tap_rvclr_shift_reg_scanout;
wire [6:0] next_new_rvclr;
wire [6:0] rvclr;
wire tap_rvclr_upd_reg_scanin;
wire tap_rvclr_upd_reg_scanout;
wire [6:0] next_rvclr;
wire efu_clear_upd;
wire tap_mbibypass_shift_reg_scanin;
wire tap_mbibypass_shift_reg_scanout;
wire [47:0] mbibypass;
wire tap_mbibypass_upd_reg_scanin;
wire tap_mbibypass_upd_reg_scanout;
wire tap_mbist_get_done_fail_shift_reg_scanin;
wire tap_mbist_get_done_fail_shift_reg_scanout;
wire [47:0] next_mbist_get_done_fail;
wire tap_mbist_result_reg_scanin;
wire tap_mbist_result_reg_scanout;
wire tap_mbist_mode_reg_scanin;
wire tap_mbist_mode_reg_scanout;
wire [3:0] next_mbist_mode;
wire tap_mbist_clkstpen_reg_scanin;
wire tap_mbist_clkstpen_reg_scanout;
wire clkstpen_clear;
wire mbist_cyc_count_en;
wire mbist_clkstpen_q;
wire mbi_shiftdr;
wire mbi_a_scan_en_reg_scanin;
wire mbi_a_scan_en_reg_scanout_unused;
wire mbi_a_scan_en_q;
wire mbi_a_scan_en;
wire mbi_b_scan_en_reg_scanin;
wire mbi_b_scan_en_reg_scanout;
wire mbi_b_scan_en_q;
wire mbi_b_scan_en;
wire mbi_scan_en;
wire pause_dr_state;
wire soclk_off;
wire mbi_spc0;
wire spc0_mb_aclk;
wire spc0_mb_bclk;
wire spc0_mb_scan_en;
wire spc0_mb_clk_stop;
wire [7:0] spc_lb_aclk;
wire [7:0] spc_lb_bclk;
wire [7:0] spc_lb_scan_en;
wire tap_spc0_mb_clk_stop_din;
wire [7:0] spc_lb_clk_stop;
wire mbi_spc1;
wire spc1_mb_aclk;
wire spc1_mb_bclk;
wire spc1_mb_scan_en;
wire spc1_mb_clk_stop;
wire tap_spc1_mb_clk_stop_din;
wire mbi_spc2;
wire spc2_mb_aclk;
wire spc2_mb_bclk;
wire spc2_mb_scan_en;
wire spc2_mb_clk_stop;
wire tap_spc2_mb_clk_stop_din;
wire mbi_spc3;
wire spc3_mb_aclk;
wire spc3_mb_bclk;
wire spc3_mb_scan_en;
wire spc3_mb_clk_stop;
wire tap_spc3_mb_clk_stop_din;
wire mbi_spc4;
wire spc4_mb_aclk;
wire spc4_mb_bclk;
wire spc4_mb_scan_en;
wire spc4_mb_clk_stop;
wire tap_spc4_mb_clk_stop_din;
wire mbi_spc5;
wire spc5_mb_aclk;
wire spc5_mb_bclk;
wire spc5_mb_scan_en;
wire spc5_mb_clk_stop;
wire tap_spc5_mb_clk_stop_din;
wire mbi_spc6;
wire spc6_mb_aclk;
wire spc6_mb_bclk;
wire spc6_mb_scan_en;
wire spc6_mb_clk_stop;
wire tap_spc6_mb_clk_stop_din;
wire mbi_spc7;
wire spc7_mb_aclk;
wire spc7_mb_bclk;
wire spc7_mb_scan_en;
wire spc7_mb_clk_stop;
wire tap_spc7_mb_clk_stop_din;
wire mbist_sii;
wire mbist_sio;
wire mbist_ncu;
wire mbist_mcu0;
wire mbist_mcu1;
wire mbist_mcu2;
wire mbist_mcu3;
wire mbist_l2b0;
wire mbist_l2b1;
wire mbist_l2b2;
wire mbist_l2b3;
wire mbist_l2b4;
wire mbist_l2b5;
wire mbist_l2b6;
wire mbist_l2b7;
wire mbist_l2t0;
wire mbist_l2t1;
wire mbist_l2t2;
wire mbist_l2t3;
wire mbist_l2t4;
wire mbist_l2t5;
wire mbist_l2t6;
wire mbist_l2t7;
wire mbist_dmu;
wire mbist_peu;
wire mbist_tds_tdmc;
wire mbist_rtx;
wire mbist_rdp_rdmc;
wire mbist_sii_n;
wire mbist_sio_n;
wire mbist_ncu_n;
wire mbist_mcu0_n;
wire mbist_mcu1_n;
wire mbist_mcu2_n;
wire mbist_mcu3_n;
wire mbist_l2b0_n;
wire mbist_l2b1_n;
wire mbist_l2b2_n;
wire mbist_l2b3_n;
wire mbist_l2b4_n;
wire mbist_l2b5_n;
wire mbist_l2b6_n;
wire mbist_l2b7_n;
wire mbist_l2t0_n;
wire mbist_l2t1_n;
wire mbist_l2t2_n;
wire mbist_l2t3_n;
wire mbist_l2t4_n;
wire mbist_l2t5_n;
wire mbist_l2t6_n;
wire mbist_l2t7_n;
wire mbist_dmu_n;
wire mbist_peu_n;
wire mbist_tds_tdmc_n;
wire mbist_rtx_n;
wire mbist_rdp_rdmc_n;
wire soc0_mbist_clk_stop_din;
wire mcu0_mbist_clk_stop_din;
wire mcu1_mbist_clk_stop_din;
wire mcu2_mbist_clk_stop_din;
wire mcu3_mbist_clk_stop_din;
wire l2b0_mbist_clk_stop_din;
wire l2b1_mbist_clk_stop_din;
wire l2b2_mbist_clk_stop_din;
wire l2b3_mbist_clk_stop_din;
wire l2b4_mbist_clk_stop_din;
wire l2b5_mbist_clk_stop_din;
wire l2b6_mbist_clk_stop_din;
wire l2b7_mbist_clk_stop_din;
wire l2t0_mbist_clk_stop_din;
wire l2t1_mbist_clk_stop_din;
wire l2t2_mbist_clk_stop_din;
wire l2t3_mbist_clk_stop_din;
wire l2t4_mbist_clk_stop_din;
wire l2t5_mbist_clk_stop_din;
wire l2t6_mbist_clk_stop_din;
wire l2t7_mbist_clk_stop_din;
wire dmu_mbist_clk_stop_din;
wire peu_mbist_clk_stop_din;
wire rdp_mbist_clk_stop_din;
wire rtx_mbist_clk_stop_din;
wire tds_mbist_clk_stop_din;
wire [7:0] lbist_spc;
wire [36:0] jtag_output_flops_din;
wire jtag_dmo_enable_din;
wire jtag_mt_enable_din;
wire jtag_por_enable_din;
wire jtag_output_flops_reg_scanin;
wire jtag_output_flops_reg_scanout;
wire [36:0] jtag_output_flops;
wire tstmode_not_tlr;
wire tap_lbist_bypass_shift_reg_scanin;
wire tap_lbist_bypass_shift_reg_scanout;
wire [7:0] next_new_lbist_bypass;
wire [7:0] lbist_bypass;
wire tap_lbist_bypass_upd_reg_scanin;
wire tap_lbist_bypass_upd_reg_scanout;
wire [7:0] next_lbist_bypass;
wire [7:0] lbist_bypass_q;
wire tap_lbist_mode_reg_scanin;
wire tap_lbist_mode_reg_scanout;
wire [1:0] next_lbist_mode;
wire tap_lbist_done_reg_scanin;
wire tap_lbist_done_reg_scanout;
wire [7:0] next_lbist_done;
wire tap_lbist_start_reg_scanin;
wire tap_lbist_start_reg_scanout;
wire next_lbist_start;
wire lbist_start_q;
wire lbist_start;
wire lbist_shiftdr;
wire tap_lbist_a_scan_en_reg_scanin;
wire tap_lbist_a_scan_en_reg_scanout_unused;
wire lbist_a_scan_en_q;
wire lbist_a_scan_en;
wire tap_lbist_b_scan_en_reg_scanin;
wire tap_lbist_b_scan_en_reg_scanout;
wire lbist_b_scan_en_q;
wire lbist_b_scan_en;
wire [7:0] lbist_scan_en_8;
wire [7:0] lbist_a_scan_en_8;
wire [7:0] lbist_b_scan_en_8;
wire [7:0] lbist_b_scan_en_q_8;
wire [7:0] clock_chop_aclk_8;
wire [7:0] clock_chop_bclk_8;
wire [7:0] soclk_off_8;
wire [7:0] instr_lbist_access_8;
wire next_jtag_creg_addr_en;
wire next_jtag_creg_wr_en;
wire next_jtag_creg_rd_en;
wire next_jtag_creg_data_en;
wire tap_cregaddr_shift_reg_scanin;
wire tap_cregaddr_shift_reg_scanout;
wire [39:0] next_creg_addr;
wire tap_cregwdata_reg_scanin;
wire tap_cregwdata_reg_scanout;
wire [63:0] next_creg_wdata;
wire creg_rdrtrn_load;
wire ucb_jtag_data_rdy_d2;
wire creg_rdrtrn_load_d1;
wire creg_rdrtrn_shift;
wire creg_rdrtrn_vld;
wire tap_cregrdrtrn_reg_scanin;
wire tap_cregrdrtrn_reg_scanout;
wire [64:0] next_creg_rdrtrn;
wire [64:0] creg_rdrtrn;
wire clear_creg_rdrtrn_vld;
wire instr_ncu_rd_d1;
wire instr_ncu_raddr_d1;
wire next_creg_rdrtrn_vld;
wire tap_cregaddren_reg_scanin;
wire tap_cregaddren_reg_scanout;
wire jtag_creg_addr_en_q;
wire tap_cregwren_reg_scanin;
wire tap_cregwren_reg_scanout;
wire jtag_creg_wr_en_q;
wire tap_cregrden_reg_scanin;
wire tap_cregrden_reg_scanout;
wire jtag_creg_rd_en_q;
wire tap_cregdataen_reg_scanin;
wire tap_cregdataen_reg_scanout;
wire jtag_creg_data_en_q;
wire tap_cregrdrtrnvld_reg_scanin;
wire tap_cregrdrtrnvld_reg_scanout;
wire tap_ucb_jtag_data_rdy_d_reg_scanin;
wire tap_ucb_jtag_data_rdy_d_reg_scanout;
wire ucb_jtag_data_rdy_d;
wire tap_ucb_jtag_data_rdy_d2_reg_scanin;
wire tap_ucb_jtag_data_rdy_d2_reg_scanout;
wire tap_cregrdrtrnload_reg_scanin;
wire tap_cregrdrtrnload_reg_scanout;
wire tap_ncurd_reg_scanin;
wire tap_ncurd_reg_scanout;
wire tap_ncuraddr_reg_scanin;
wire tap_ncuraddr_reg_scanout;
wire spcshscan_shiftdr;
wire spcshscan_a_scan_en_reg_scanin;
wire spcshscan_a_scan_en_reg_scanout_unused;
wire spcshscan_a_scan_en_q;
wire spcshscan_a_scan_en;
wire spcshscan_b_scan_en_reg_scanin;
wire spcshscan_b_scan_en_reg_scanout;
wire spcshscan_b_scan_en_q;
wire spcshscan_b_scan_en;
wire spcshscan_scan_en;
wire spc_shscan_aclk;
wire spc_shscan_bclk;
wire spc_shscan_pce_ov;
wire spc_shscan_clk_stop;
wire tcu_spc_shscan_clk_stop_ps;
wire l2tshscan_shiftdr;
wire l2tshscan_a_scan_en_reg_scanin;
wire l2tshscan_a_scan_en_reg_scanout_unused;
wire l2tshscan_a_scan_en_q;
wire l2tshscan_a_scan_en;
wire l2tshscan_b_scan_en_reg_scanin;
wire l2tshscan_b_scan_en_reg_scanout;
wire l2tshscan_b_scan_en_q;
wire l2tshscan_b_scan_en;
wire l2tshscan_scan_en;
wire l2t_shscan_aclk;
wire l2t_shscan_bclk;
wire l2t_shscan_pce_ov;
wire l2t_shscan_clk_stop;
wire tcu_l2t_shscan_clk_stop_ps;
wire tap_jtagclkstop_reg_scanin;
wire tap_jtagclkstop_reg_scanout;
wire clear_jtag_clk_stop;
wire next_jtag_clk_stop;
wire jtag_clk_stop;
wire sstop_ready;
wire instr_sstop_csmode_din;
wire tap_gen32_shift_reg_scanin;
wire tap_gen32_shift_reg_scanout;
wire [31:0] next_new_gen32;
wire [23:0] debug_reg_hs_domain;
wire tap_gen64_shift_reg_scanin;
wire tap_gen64_shift_reg_scanout;
wire [63:0] next_new_gen64;
wire serscan_shiftdr;
wire serscan_a_scan_en_reg_scanin;
wire serscan_a_scan_en_reg_scanout_unused;
wire serscan_a_scan_en_q;
wire serscan_a_scan_en;
wire serscan_b_scan_en_reg_scanin;
wire serscan_b_scan_en_reg_scanout;
wire serscan_b_scan_en_q;
wire serscan_b_scan_en;
wire instr_l2access;
wire tap_l2access_shift_reg_scanin;
wire tap_l2access_shift_reg_scanout;
wire [64:0] next_l2access;
wire l2data_cap;
wire tap_clkstopdly_shift_reg_scanin;
wire tap_clkstopdly_shift_reg_scanout;
wire [6:0] next_clkstopdly;
wire csdelay_cap;
wire tap_clkseqstat_reg_scanin;
wire tap_clkseqstat_reg_scanout;
wire [1:0] next_clkseqstat;
wire [1:0] clkseq;
wire tap_coresel_shift_reg_scanin;
wire tap_coresel_shift_reg_scanout;
wire [7:0] next_coresel;
wire coresel_cap;
wire tap_tcudcr_shift_reg_scanin;
wire tap_tcudcr_shift_reg_scanout;
wire [3:0] next_tcudcr;
wire tcudcr_cap;
wire tap_dossmode_shift_reg_scanin;
wire tap_dossmode_shift_reg_scanout;
wire [1:0] next_dossmode;
wire dossmode_cap;
wire tap_dossstat_shift_reg_scanin;
wire tap_dossstat_shift_reg_scanout;
wire [7:0] next_dossstat;
wire dossstat_cap;
wire tap_csmode_shift_reg_scanin;
wire tap_csmode_shift_reg_scanout;
wire next_csmode;
wire csmode_cap;
wire tap_csstat_shift_reg_scanin;
wire tap_csstat_shift_reg_scanout;
wire next_csstat;
wire csstat_cap;
wire tap_stciaccess_reg_scanin;
wire tap_stciaccess_reg_scanout;
wire next_stciaccess;
wire stciaccess;
wire stci_acc_mode;
wire stci_shft_clk;
wire updatedr;
wire clockdr;
wire shiftdr;
wire stci_cfg0;
wire stci_cfg1;
wire tap_stcicfg1_reg_scanin;
wire tap_stcicfg1_reg_scanout;
wire stcicfg1_clear;
wire stcicfg1_en;
wire tap_shiftdr_reg_scanout_unused;
wire tap_dmoaccess_reg_scanin;
wire tap_dmoaccess_reg_scanout;
wire next_dmoaccess;
wire dmoaccess;
wire tap_dmocfg_shift_reg_scanin;
wire tap_dmocfg_shift_reg_scanout;
wire [47:0] next_dmocfg;
wire dmocfg_cap;
wire tap_mtaccess_reg_scanin;
wire tap_mtaccess_reg_scanout;
wire next_mtaccess;
wire mtaccess;
wire pin_macrotest;
wire jtag_macrotest;
wire tap_jtporaccess_reg_scanin;
wire tap_jtporaccess_reg_scanout;
wire next_jtporaccess;
wire jtporaccess;
wire tap_jtporstat_shift_reg_scanin;
wire tap_jtporstat_shift_reg_scanout;
wire next_jtporstat;
wire jtporstat_cap;
wire tap_jtsckbyp_reg_scanin;
wire tap_jtsckbyp_reg_scanout;
wire next_jtsckbyp;
wire jtsckbyp;
wire tap_tpaccess_reg_scanin;
wire tap_tpaccess_reg_scanout;
wire next_tpaccess;
wire tpaccess;
wire ex1_ir_state;
wire ex2_ir_state;
wire exit_ir;
wire next_state_updir;
wire active_upd_ir;
wire jtss_next_instr_dec;
wire [7:0] next_instr;
wire jtss_next_instr;
wire jtss_active;
wire jtss_active_window;
wire jtss_active_dly;
wire spare_flops_scanin;
wire spare_flops_scanout;
wire [11:0] spare_flops_d;
wire [11:0] spare_flops_q;
wire spare11_flop_d;
wire spare10_flop_d;
wire spare9_flop_d;
wire spare8_flop_d;
wire spare11_flop_q;
wire spare10_flop_q;
wire spare9_flop_q;
wire spare8_flop_q;
wire [7:0] spare_flops_unused;
wire flush_scanout;


   //JTAG chip interface
   input       io_tdi;
   input       io_tms;
   input       io_trst_l;
   input       io_tck;
   input       io_tck_l;
   
   output      tcu_tdo; 
   output      tcu_tdo_en;
   
   // controls for ATPG scan
   input       io_test_mode; //pin_scanmode;
   input       io_scan_en;   //pin_scan_en;
   // serial scan 
   output       jtag_ser_scan_q; // indicates serial scan mode // ECO yyyyyy
   output [4:0] sel_chain;       // selects 1 or 32 chains to scan; bypassing in TCU
   output 	chain_select;    // enables sel_chain reg.
   input 	ser_scan_out;    // from one or all 32 chains cat'd together; scan dump
   output 	jt_scan_in;      // to one or all 32 chains cat'd together; scan dump
   // JTAG Macrotest
   output 	tck_clk_tree;    // TCK during RTI, for jtag MacroTest
   output 	instr_mt_scan_rti;   // updateDR state 
   
   // id info
   input [3:0] 	jtag_id;
   // scan
   input 	scan_in;
   output 	scan_out;
   input 	tcu_jtag_aclk;
   input 	tcu_int_bclk;
   input 	tcu_jtag_se;
   
   // shadow scan interface: SHSCAN
   output 	tap_spc0_shscan_scan_out; // to core 0
   input 	spc7_tap_shscan_scan_in;    // from core 7

   output 	tcu_spc_shscan_aclk;
   output 	tcu_spc_shscan_bclk;
   output 	tcu_spc_shscan_scan_en;
   output 	jtag_spc_shscan_pce_ov;
   output 	jtag_spc0_shscan_clk_stop;
   output 	jtag_spc1_shscan_clk_stop;
   output 	jtag_spc2_shscan_clk_stop;
   output 	jtag_spc3_shscan_clk_stop;
   output 	jtag_spc4_shscan_clk_stop;
   output 	jtag_spc5_shscan_clk_stop;
   output 	jtag_spc6_shscan_clk_stop;
   output 	jtag_spc7_shscan_clk_stop;
   output [2:0] jtag_spc_shscanid;

	//================================================================================
	// 
	// Added on 20041119
	// Added L2T Shadow Scan Signals
	//================================================================================
   output 	tcu_l2t_shscan_aclk;
   output 	tcu_l2t_shscan_bclk;
   output 	tcu_l2t_shscan_scan_en;
   output 	jtag_l2t_shscan_pce_ov;
   output 	jtag_l2t0_shscan_clk_stop;
   output 	jtag_l2t1_shscan_clk_stop;
   output 	jtag_l2t2_shscan_clk_stop;
   output 	jtag_l2t3_shscan_clk_stop;
   output 	jtag_l2t4_shscan_clk_stop;
   output 	jtag_l2t5_shscan_clk_stop;
   output 	jtag_l2t6_shscan_clk_stop;
   output 	jtag_l2t7_shscan_clk_stop;

   input 	l2t7_tcu_shscan_scan_out;

   // inputs from sigmux_ctl for coordination of clock_stops, a, bclks to scan chains
   input        spc0_clk_stop;
   input        spc1_clk_stop;
   input        spc2_clk_stop;
   input        spc3_clk_stop;
   input        spc4_clk_stop;
   input        spc5_clk_stop;
   input        spc6_clk_stop;
   input        spc7_clk_stop;

	//================================================================================
	// 
	// Added on 20041119
	// Added L2T Shadow Scan Signals
	//================================================================================
   input        l2t0_clk_stop;
   input        l2t1_clk_stop;
   input        l2t2_clk_stop;
   input        l2t3_clk_stop;
   input        l2t4_clk_stop;
   input        l2t5_clk_stop;
   input        l2t6_clk_stop;
   input        l2t7_clk_stop;

   // EFuse Control Interface
   output [6:0] tcu_efu_rowaddr;     // row for read/write
   output [4:0] tcu_efu_coladdr;     // column for write
   output       tcu_efu_read_en;     // read enable, one TCK cycle 
   output [2:0] tcu_efu_read_mode;   // indicates mode
   output       jtag_efu_clear_instr; // to tcu_sigmux_ctl; indicates jtag clear active
   output [6:0] jtag_efu_rvclr;       // to tcu_sigmux_ctl; redundancy value clear ID
   output       tcu_efu_fuse_bypass; // one TCK cycle to set bypass mode
   output       tcu_efu_dest_sample; // one TCK cycle to sample data
   // EFuse Shift Interface
   output       tcu_efu_data_in;     // serial scan_in to EFU
   output       tcu_efu_updatedr;    // transfer data from TCK reg. into EFUSE register
   output       tcu_efu_shiftdr;     // shift JTAG data to TCK reg. in EFU
   output       tcu_efu_capturedr;   // transfer EFUSE reg. into TCK reg.
   input        efu_tcu_data_out;    // serial scan_out from EFU

   // JTAG Serial Scan
   input        chop_aclk;           // from tck clock chopper
   input        chop_bclk;           // from tck clock chopper
   output       jt_scan_en;
   output       jt_scan_aclk;
   output       jt_scan_bclk;
   
   // Boundary Scan
   input 	mio_tcu_bs_scan_out;   
   output 	tcu_mio_bs_scan_in;
   output 	tcu_mio_bs_scan_en;
   output 	tcu_mio_bs_clk;
   output 	tcu_mio_bs_aclk;
   output 	tcu_mio_bs_bclk;
   output 	tcu_mio_bs_uclk;  // update clock for copy latches in bscan register
   output 	tcu_mio_bs_mode_ctl;
   output 	tcu_mio_bs_highz_l;
   
   // Serdes STCI Control
   output       tcu_stciclk;      // to SerDes macro
   output [1:0] tcu_stcicfg;      // to SerDes macro
   output       tcu_stcid;        // to SerDes macro
   output 	tcu_mio_stciq;    // to pin
   input        mio_tcu_stciclk;  // from pin
   input  [1:0] mio_tcu_stcicfg;  // from pin
   input 	mio_tcu_stcid;    // from pin
   input        stciq_tcu;        // from SerDes macro

   // Serdes Boundary Scan and ATPG
   input 	sbs_tcu_scan_out;
   output 	jtag_sbs_scan_in;  // to boundary scan chain scan-in
   output 	tcu_sbs_acmode;
   output 	tcu_sbs_actestsignal;
   output 	tcu_sbs_enbspt;
   output 	tcu_sbs_bsinitclk;
   output 	tcu_sbs_scan_en;
   output 	tcu_sbs_clk;
   output 	tcu_sbs_aclk;
   output 	tcu_sbs_bclk;
   output 	tcu_sbs_uclk;

   output       tcu_sbs_enbstx;   // to SerDes SOC counterpart
   output 	tcu_sbs_enbsrx;   // to SerDes SOC counterpart

   // LBIST
   input [`NUM_TOTAL_LBIST-1:0]  lb_tcu_done_d;
   output                        tcu_spc_lbist_pgm;
   input                         spc0_tcu_lbist_scan_out; // Core 0 Scan Out
   input                         spc1_tcu_lbist_scan_out; // Core 1 Scan Out
   input                         spc2_tcu_lbist_scan_out; // Core 2 Scan Out
   input                         spc3_tcu_lbist_scan_out; // Core 3 Scan Out
   input                         spc4_tcu_lbist_scan_out; // Core 4 Scan Out
   input                         spc5_tcu_lbist_scan_out; // Core 5 Scan Out
   input                         spc6_tcu_lbist_scan_out; // Core 6 Scan Out
   input                         spc7_tcu_lbist_scan_out; // Core 7 Scan Out

   // MBIST
   output         mbist_clkstpen;
   input [47:0]   mbist_done;
   input [47:0]   mbist_fail;
   input [1:0]    mbist_done_fail;
   output [5:0]   jtag_csr_addr;
   output         jtag_csr_wr;

   reg [5:0]      jtag_csr_addr;
   reg [47:0]     jtag_csr_data_din;

   // MBIST - SPC0
   input 	spc0_mb_scan_in;    // from core 0
   output 	tap_spc0_mb_scan_out; // to core 0
   output 	tap_spc0_mb_aclk;
   output 	tap_spc0_mb_bclk ;
   output 	tap_spc0_mb_scan_en;
   output 	tap_spc0_mb_clk_stop;
   // MBIST - SPC1
   input 	spc1_mb_scan_in;    // from core 1
   output 	tap_spc1_mb_scan_out; // to core 1
   output 	tap_spc1_mb_aclk;
   output 	tap_spc1_mb_bclk ;
   output 	tap_spc1_mb_scan_en;
   output 	tap_spc1_mb_clk_stop;
   // MBIST - SPC2
   input 	spc2_mb_scan_in;    // from core 2
   output 	tap_spc2_mb_scan_out; // to core 2
   output 	tap_spc2_mb_aclk;
   output 	tap_spc2_mb_bclk ;
   output 	tap_spc2_mb_scan_en;
   output 	tap_spc2_mb_clk_stop;
   // MBIST - SPC3
   input 	spc3_mb_scan_in;    // from core 3
   output 	tap_spc3_mb_scan_out; // to core 3
   output 	tap_spc3_mb_aclk;
   output 	tap_spc3_mb_bclk ;
   output 	tap_spc3_mb_scan_en;
   output 	tap_spc3_mb_clk_stop;
   // MBIST - SPC4
   input 	spc4_mb_scan_in;    // from core 4
   output 	tap_spc4_mb_scan_out; // to core 4
   output 	tap_spc4_mb_aclk;
   output 	tap_spc4_mb_bclk ;
   output 	tap_spc4_mb_scan_en;
   output 	tap_spc4_mb_clk_stop;
   // MBIST - SPC5
   input 	spc5_mb_scan_in;    // from core 5
   output 	tap_spc5_mb_scan_out; // to core 5
   output 	tap_spc5_mb_aclk;
   output 	tap_spc5_mb_bclk ;
   output 	tap_spc5_mb_scan_en;
   output 	tap_spc5_mb_clk_stop;
   // MBIST - SPC6
   input 	spc6_mb_scan_in;    // from core 6
   output 	tap_spc6_mb_scan_out; // to core 6
   output 	tap_spc6_mb_aclk;
   output 	tap_spc6_mb_bclk ;
   output 	tap_spc6_mb_scan_en;
   output 	tap_spc6_mb_clk_stop;
   // MBIST - SPC7
   input 	spc7_mb_scan_in;    // from core 7
   output 	tap_spc7_mb_scan_out; // to core 7
   output 	tap_spc7_mb_aclk;
   output 	tap_spc7_mb_bclk ;
   output 	tap_spc7_mb_scan_en;
   output 	tap_spc7_mb_clk_stop;

   // SOC MBIST Scan Inputs to TCU
   input    sii_tcu_mbist_scan_out;
   input    sio_tcu_mbist_scan_out;
   input    ncu_tcu_mbist_scan_out;
   input    mcu0_tcu_mbist_scan_out;
   input    mcu1_tcu_mbist_scan_out;
   input    mcu2_tcu_mbist_scan_out;
   input    mcu3_tcu_mbist_scan_out;
   input    l2b0_tcu_mbist_scan_out;
   input    l2b1_tcu_mbist_scan_out;
   input    l2b2_tcu_mbist_scan_out;
   input    l2b3_tcu_mbist_scan_out;
   input    l2b4_tcu_mbist_scan_out;
   input    l2b5_tcu_mbist_scan_out;
   input    l2b6_tcu_mbist_scan_out;
   input    l2b7_tcu_mbist_scan_out;
   input    l2t0_tcu_mbist_scan_out;
   input    l2t1_tcu_mbist_scan_out;
   input    l2t2_tcu_mbist_scan_out;
   input    l2t3_tcu_mbist_scan_out;
   input    l2t4_tcu_mbist_scan_out;
   input    l2t5_tcu_mbist_scan_out;
   input    l2t6_tcu_mbist_scan_out;
   input    l2t7_tcu_mbist_scan_out;
   input    dmu_tcu_mbist_scan_out;
   input    peu_tcu_mbist_scan_out;
   input    rdp_rdmc_mbist_scan_out;
   input    rtx_mbist_scan_out;
   input    tds_mbist_scan_out;

   output   instr_mbist_diag;
   output   soc_mbist_aclk;
   output   soc_mbist_bclk;
   output   soc_mbist_scan_en;

   output   soc0_mbist_clk_stop;
   output   mcu0_mbist_clk_stop;
   output   mcu1_mbist_clk_stop;
   output   mcu2_mbist_clk_stop;
   output   mcu3_mbist_clk_stop;

   output   l2b0_mbist_clk_stop;
   output   l2b1_mbist_clk_stop;
   output   l2b2_mbist_clk_stop;
   output   l2b3_mbist_clk_stop;
   output   l2b4_mbist_clk_stop;
   output   l2b5_mbist_clk_stop;
   output   l2b6_mbist_clk_stop;
   output   l2b7_mbist_clk_stop;

   output   l2t0_mbist_clk_stop;
   output   l2t1_mbist_clk_stop;
   output   l2t2_mbist_clk_stop;
   output   l2t3_mbist_clk_stop;
   output   l2t4_mbist_clk_stop;
   output   l2t5_mbist_clk_stop;
   output   l2t6_mbist_clk_stop;
   output   l2t7_mbist_clk_stop;

   output   dmu_mbist_clk_stop;
   output   peu_mbist_clk_stop;

   output   rdp_mbist_clk_stop;
   output   rtx_mbist_clk_stop;
   output   tds_mbist_clk_stop;

   // CREG R/W interface
   output [39:0] jtag_creg_addr;  //address of internal register
   output [63:0] jtag_creg_data;  //data to load into internal register
   output 	 jtag_creg_rd_en;
   output 	 jtag_creg_wr_en;
   output 	 jtag_creg_addr_en;
   output 	 jtag_creg_data_en;

   //input [63:0]  creg_jtag_scratch_data;
   
	// UCB
   input         ucb_csr_wr;
   input [5:0]   ucb_csr_addr;
   input [63:0]  ucb_data_out;
   input         ucb_jtag_data_rdy;
   output        jtag_ucb_data_ack;
   output [47:0] jtag_csr_data;

   // L2 R/W interface (via SIU, through tcu_ucb_ctl)
   output [64:0] l2access;  // either wrdata or address for L2
   output        l2data_upd;
   output        l2addr_upd;
   output        l2rti;
   output        instr_l2_wr;
   output        instr_l2_rd; 
   input  [63:0] l2rddata; // from SIO via ucb_ctl
   input         l2_read_vld; // indicates valid data during read

   // Scan Flush
   input 	 tcu_jtag_flush_req; // from sigmux_ctl, indicates flush active
   input 	 tcu_jtag_flush_dly_req; // from sigmux_ctl, delayed flush

   // Clock Stopping
   output        jtag_clock_start;
   output        instr_sstop_csmode;
   output 	 jtag_clk_stop_req;
   output        clock_domain_upd;
   output [23:0] clock_domain;
   input  [23:0] debug_reg_hard_stop_domain_1st;
   // Clock Stopping - Delay (interval) Counter
   input [6:0] 	 csdel_data;
   output        jtag_upd_cntdly;
   output [6:0]  jtag_cntdly_data;
   // Clock Stopping - Clock Status
   input  	 clkseq_stop;
   input 	 clkseq_strt;

   // Debug Register Access
   input [63:0]  spc_crs; // core_run_status - read only
   input [7:0]   spc_ss_sel; // core_select
   output [7:0]  core_sel; 
   output        core_sel_upd; 
   input [31:0]  de_count; // debug_event counter
   output [31:0] decnt_data; 
   output        decnt_upd; 
   input [63:0]  cycle_count;
   output [63:0] cyc_count;
   output        cyc_count_upd;
   input [3:0]   tcu_dcr;
   output [3:0]  tcudcr_data;
   output        tcudcr_upd;
   input [63:0]  doss_enab;
   output [63:0] dossen;
   output 	 dossen_upd;
   output [1:0]  dossmode;
   output 	 dossmode_upd;
   input [1:0] 	 doss_mode;
   output 	 ssreq_upd; 
   input [7:0] 	 doss_stat;
   output 	 csmode;
   output 	 csmode_upd;
   input 	 cs_mode;
   input 	 cs_mode_active;

   // DMO Control Register
   input [47:0]  dmo_cfg;
   output [47:0] jtag_dmo_control; 
   output        jtag_dmo_control_upd;
   output        jtag_dmo_enable; 

   // JTAG Access during POR
   input         jtag_por_status;
   output        jtag_por_enable;
  
   // JTAG SCK Counter Bypass to NCU 
   output        jtag_sck_byp;
   // Test Protect signal for mbist, lbist, whenver test mode needs it
   output        jtag_test_protect;

   output 	 jtag_mt_enable;
   
   wire [`NUM_TOTAL_MBIST_M1:0] next_new_mbibypass;
   wire [`NUM_TOTAL_MBIST_M1:0] next_mbibypass;
   wire [`NUM_TOTAL_MBIST_M1:0] next_mbist_result;

   assign 	tck_l = ~io_tck_l;
 
   assign 	pin_scanmode = io_test_mode;
   assign 	pin_scan_en  = io_scan_en;

   // Scan reassigns
   assign 	 l1en   = 1'b1; // this is "ce" or "pce"   
   assign        pce_ov = 1'b1;
   assign        stop   = 1'b0;
   assign 	 se     = tcu_jtag_se;
   assign        siclk = tcu_jtag_aclk;
   assign        soclk = tcu_int_bclk;
   
   tcu_jtag_ctl_l1clkhdr_ctl_macro jtag_clkgen 
     (
      .l2clk  (io_tck),
      .l1clk  (l1tck  ),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
      );
   // end scan

   cl_sc1_clksyncff_4x ucb_jtag_data_rdy_sync_reg (
      .si    ( ucb_jtag_data_rdy_sync_reg_scanin  ),
      .so    ( ucb_jtag_data_rdy_sync_reg_scanout ),
      .l1clk ( l1tck                              ),
      .d	    ( ucb_jtag_data_rdy                  ),
      .q	    ( ucb_jtag_data_rdy_sync             ),
  .siclk(siclk),
  .soclk(soclk));
   

   // Reassigns for Flush Scan Mode
   assign 	 flush = tcu_jtag_flush_req; // for aclk
   assign        flush_dly = tcu_jtag_flush_dly_req; // for se
   
   //********************************************************************
   // JTAG Data Register path to TDO - these go through bypass lockup latch
   //  - they are shifted with TCK
   //********************************************************************

   assign       jtag_dr_tdo = 
		(  
		   (new_idcode[0]             & instr_idcode)       |
		   (l2access[0]               & instr_l2_rd)       |
		   (selchain[0]               & instr_chainsel)     |
		   (new_rvclr[0]              & instr_rvclr)        |
		   (new_mbibypass[0]          & instr_mbist_bypass) |
		   (mbist_get_done_fail[0]    & instr_mbist66)      |
		   (mbist_result[0]            & instr_mbist_result) |
		   (mbist_mode[0]              & instr_mbist_mode)   |
		   (new_lbist_bypass[0]        & instr_lbist_bypass) |
		   (lbist_done[0]              & instr_lbist_getdone)|
		   (lbist_mode[0]              & instr_lbist_mode)    
		   | (creg_addr[0]             & creg_addr_instr)    //instr_creg_addr)
		   | (creg_wdata[0]            & creg_wdata_instr)   //instr_creg_wdata) 
		   //| (creg_scratch[0]          & instr_creg_scratch)
		   | (creg_rdrtrn_out          & instr_creg_rdata) 
                   | (new_gen32[0]             & instr_gen32)
                   | (new_gen64[0]             & instr_gen64)
		   | (clkstopdly[0]            & instr_clkstopdly)
		   | (clkseqstat[0]            & instr_clkseq_stat)
		   | (coresel[0]               & instr_core_sel)
		   | (tcudcr[0]                & instr_tcu_dcr)
		   | (dossmode[0]              & instr_doss_mode)
		   | (dossstat[0]              & instr_doss_status)
		   | (csmode                   & instr_cs_mode)
		   | (csstat                   & instr_cs_status)
		   | (jtporstat                & instr_jtpor_status)
                   | (stciq_tdo                & stci_val_instr)
                   | (dmocfg[0]                & instr_dmo_config)
		   );

   assign 	tcu_tdo    = tap_tdo;
   assign 	tcu_tdo_en = tap_tdo_en;
   
   //********************************************************************
   // External Data Register path to TDO
   //  - they are shifted with aclk/bclk created off of TCK (chopped)
   //  - except efuse logic (fuse_dout), it uses TCK directly
   //********************************************************************
   assign 	ext_dr_tdo = 
		(  
		   (mio_tcu_bs_scan_out     & bs_instr)         |
		   (ser_scan_out            & jtag_ser_scan)   |
                   (fuse_dout               & fuse_instr)       |
		   (mbist_scan_out          & instr_mbist_diag) |
		   (spcshscan_scan_out      & instr_spc_shscan) |
		   (l2tshscan_scan_out      & instr_l2t_shscan) 
		   );

   assign       ext_jtag_instr = scan_instr | fuse_instr | instr_mbist_diag 
                               | instr_spc_shscan | instr_l2t_shscan; 
   // ext_jtag_instr indicates instr has data reg outside of TAP

   // provide lockup latch for jtag data regs that shift with TCK outside of TAP
   // - does not need trst_l, but can use it
   tcu_jtag_ctl_msff_ctl_macro__width_1 ext_jtag_ll_reg 
   (
    .scan_in(ext_jtag_ll_reg_scanin),
    .scan_out(ext_jtag_ll_reg_scanout_unused),
    .l1clk       (tck_l),                         
    .din         (next_fuse_dout), 
    .dout        (fuse_dout),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign        next_fuse_dout = (new_fusemode[0]	 & instr_fuse_read_mode) |
                                  (new_fuserowaddr[0] & instr_fuse_row_addr)  |
                                  (new_fusecoladdr[0] & instr_fuse_col_addr)  |
                                  (efu_tcu_data_out   & 
                                    (instr_fuse_read | instr_fuse_dest_sample | instr_fuse_bypass_data)
                                   )
                                ; 

   //********************************************************************
   // TAP State Machine, Instruction and Bypass Registers
   //********************************************************************
   tcu_jtag_tap_ctl tcu_jtag_tap_ctl
     (
      //inputs
      .io_tdi            (io_tdi),
      .io_tms            (io_tms),
      .io_tck            (io_tck),
      .io_trst_l         (io_trst_l),
      .jtag_dr_tdo       (jtag_dr_tdo),
      .ext_dr_tdo        (ext_dr_tdo),
      .bypass_sel        (bypass_sel),
      .ext_jtag_instr    (ext_jtag_instr), //(scan_instr),
      
      //output
      .tap_tdo           (tap_tdo),
      .tap_tdo_en        (tap_tdo_en),
      .tap_state         (tap_state[3:0]),
      .instr             (instr[7:0]),
      .capture_dr_state  (capture_dr_state),
      .shift_dr_state    (shift_dr_state),
      .update_dr_state   (update_dr_state),
      .update_ireg       (update_ireg_unused),
      .tlr_state         (tlr_state),

      //scan
      .tap_scan_in       (tap_scan_in),
      .siclk             (siclk),
      .soclk             (soclk),
      .tap_scan_out      (tap_scan_out),
  .next_instr(next_instr[7:0]),
  .tcu_jtag_se(tcu_jtag_se)
      );

   //********************************************************************
   // instruction decode
   //********************************************************************
   
   assign 	bypass_sel   = (
				(instr_highz  |  instr_clamp  |  instr_bypass)
                             	//| (instr_mbist_start | instr_mbist_mode)
                             	| ( ~instr_extest & ~instr_idcode & ~instr_sample_pl
				    & ~instr_extest_pulse & ~instr_extest_train
				    & ~instr_ser_scan & ~instr_chainsel
				    & ~instr_mt_scan
				    & ~instr_fuse_read & ~instr_fuse_bypass_data & ~instr_fuse_bypass
				    & ~instr_fuse_row_addr & ~instr_fuse_col_addr 
				    & ~instr_fuse_read_mode & ~instr_fuse_dest_sample
				    & ~instr_rvclr
                                    & ~instr_mbist_clkstpen
				    & ~instr_mbist_bypass & ~instr_mbist_result & ~instr_mbist_getdone
				    & ~instr_mbist_getfail & ~instr_mbist_mode & ~instr_mbist_diag
				    & ~instr_mbist_start & ~instr_mbist_abort
				    & ~instr_lbist_start & ~instr_lbist_bypass & ~instr_lbist_mode
				    & ~instr_lbist_access & ~instr_lbist_getdone & ~instr_lbist_abort
				    & ~instr_creg_addr & ~instr_creg_wdata
				    //& ~instr_creg_rdata & ~instr_creg_scratch 
				    & ~instr_creg_rdata
				    & ~instr_ncu_wr & ~instr_ncu_rd 
				    & ~instr_ncu_waddr & ~instr_ncu_wdata & ~instr_ncu_raddr
				    & ~instr_spc_shscan
				    & ~instr_l2t_shscan
                                    & ~instr_clock_sstop & ~instr_clock_hstop
                                    & ~instr_clock_start & ~instr_clock_domain
                                    & ~instr_l2_addr & ~instr_l2_wrdata
                                    & ~instr_l2_wr & ~instr_l2_rd
				    & ~instr_clkstopdly & ~instr_clkseq_stat
                                    & ~instr_core_sel & ~instr_de_count
                                    & ~instr_cycle_count & ~instr_core_run_stat
                                    & ~instr_tcu_dcr   & ~instr_doss_enable
				    & ~instr_doss_mode & ~instr_ss_request
				    & ~instr_doss_status & ~instr_cs_mode
				    & ~instr_cs_status   & ~instr_stci_access
				    //& ~instr_dmo_access  & ~instr_dmo_clear
				    & ~instr_dmo_config
				    & ~instr_jtpor_access & ~instr_jtpor_clear & ~instr_jtpor_status
				    & ~instr_sckbyp_access & ~instr_sckbyp_clear 
                                   )
                               	);

   //assign 	instr_bypass    = tap_instructions[TAP_CMD_HI:TAP_CMD_LO] == {`TAP_CMD_WIDTH{1'b1}}
   //             | (tap_instructions[TAP_CMD_HI:TAP_CMD_HI-3] == 4'b0001   // 0x05 thru 0x07
   //                & (|tap_instructions[TAP_CMD_HI-4:TAP_CMD_LO]))
   //             | (tap_instructions[TAP_CMD_HI:TAP_CMD_HI-3] == 4'b0100   // 0x11 thru 0x13
   //                & (|tap_instructions[TAP_CMD_HI-4:TAP_CMD_LO]))
   //             | tap_instructions[TAP_CMD_HI:TAP_CMD_LO] == 6'h19
   //             | tap_instructions[TAP_CMD_HI:TAP_CMD_LO] == 6'h27
   //             | tap_instructions[TAP_CMD_HI:TAP_CMD_LO] == 6'h2F
   //             | tap_instructions[TAP_CMD_HI:TAP_CMD_HI-1] == 2'd3;
   
   assign 	instr_extest    = instr[7:0] == `TAP_EXTEST;
   assign 	instr_bypass    = instr[7:0] == `TAP_BYPASS;
   assign 	instr_idcode    = instr[7:0] == `TAP_IDCODE;
   assign 	instr_sample_pl = instr[7:0] == `TAP_SAMPLE_PRELOAD;
   assign 	instr_highz     = instr[7:0] == `TAP_HIGHZ;
   assign 	instr_clamp     = instr[7:0] == `TAP_CLAMP;
   assign       instr_extest_pulse  = instr[7:0] == `TAP_EXTEST_PULSE;
   assign       instr_extest_train  = instr[7:0] == `TAP_EXTEST_TRAIN;
   assign 	instr_ser_scan      = instr[7:0] == `TAP_SERSCAN;
   assign 	instr_chainsel      = instr[7:0] == `TAP_CHAINSEL;
   assign 	instr_mt_access     = instr[7:0] == `TAP_MT_ACCESS;
   assign 	instr_mt_clear      = instr[7:0] == `TAP_MT_CLEAR;
   assign 	instr_mt_scan       = instr[7:0] == `TAP_MT_SCAN;
   
   assign 	instr_creg_addr     = instr[7:0] == `TAP_CREG_ADDR;
   assign 	instr_creg_wdata    = instr[7:0] == `TAP_CREG_WDATA;
   assign 	instr_creg_rdata    = instr[7:0] == `TAP_CREG_RDATA;
   //assign 	instr_creg_scratch  = instr[7:0] == `TAP_CREG_SCRATCH;
   assign       instr_ncu_wr           = instr[7:0] == `TAP_NCU_WR;
   assign       instr_ncu_rd           = instr[7:0] == `TAP_NCU_RD;
   assign       instr_ncu_waddr        = instr[7:0] == `TAP_NCU_WADDR;
   assign       instr_ncu_wdata        = instr[7:0] == `TAP_NCU_WDATA;
   assign       instr_ncu_raddr        = instr[7:0] == `TAP_NCU_RADDR;

   assign	instr_fuse_read	        = instr[7:0] == `TAP_FUSE_READ;
   assign	instr_fuse_bypass_data 	= instr[7:0] == `TAP_FUSE_BYPASS_DATA;
   assign	instr_fuse_bypass       = instr[7:0] == `TAP_FUSE_BYPASS;
   assign	instr_fuse_row_addr     = instr[7:0] == `TAP_FUSE_ROW_ADDR;
   assign	instr_fuse_col_addr     = instr[7:0] == `TAP_FUSE_COL_ADDR;
   assign	instr_fuse_read_mode    = instr[7:0] == `TAP_FUSE_READ_MODE;
   assign	instr_fuse_dest_sample  = instr[7:0] == `TAP_FUSE_DEST_SAMPLE;
   assign	instr_rvclr             = instr[7:0] == `TAP_FUSE_RVCLR;

   assign	instr_mbist_clkstpen    = instr[7:0] == `TAP_MBIST_CLKSTPEN;
   assign	instr_mbist_bypass      = instr[7:0] == `TAP_MBIST_BYPASS;
   assign	instr_mbist_mode        = instr[7:0] == `TAP_MBIST_MODE;
   assign	instr_mbist_start       = instr[7:0] == `TAP_MBIST_START;
   assign	instr_mbist_result      = instr[7:0] == `TAP_MBIST_RESULT;
   assign	instr_mbist_diag        = instr[7:0] == `TAP_MBIST_DIAG;
   assign	instr_mbist_getdone     = instr[7:0] == `TAP_MBIST_GETDONE;
   assign	instr_mbist_getfail     = instr[7:0] == `TAP_MBIST_GETFAIL;
   assign	instr_mbist_abort       = instr[7:0] == `TAP_MBIST_ABORT;
   assign 	instr_spc_shscan        = instr[7:3] == `TAP_SPC_SHSCAN;
   assign 	instr_l2t_shscan        = instr[7:0] == `TAP_L2T_SHSCAN;

   assign 	instr_clock_sstop       = instr[7:0] == `TAP_CLOCK_SSTOP;
   assign 	instr_clock_hstop       = instr[7:0] == `TAP_CLOCK_HSTOP;
   assign 	instr_clock_start       = instr[7:0] == `TAP_CLOCK_START;
   assign 	instr_clock_domain      = instr[7:0] == `TAP_CLOCK_DOMAIN;
   assign 	instr_cycle_count       = instr[7:0] == `TAP_CYCLE_COUNT;
		
   assign 	instr_l2_addr           = instr[7:0] == `TAP_L2_ADDR;
   assign 	instr_l2_wrdata         = instr[7:0] == `TAP_L2_WRDATA;
   assign 	instr_l2_wr             = instr[7:0] == `TAP_L2_WR;
   assign 	instr_l2_rd             = instr[7:0] == `TAP_L2_RD;
   assign 	instr_clkstopdly        = instr[7:0] == `TAP_CLKSTP_DELAY;
   assign 	instr_clkseq_stat       = instr[7:0] == `TAP_CLOCK_STATUS;
   assign 	instr_core_sel          = instr[7:0] == `TAP_CORE_SELECT;
   assign 	instr_de_count          = instr[7:0] == `TAP_DE_COUNT;
   assign 	instr_core_run_stat     = instr[7:0] == `TAP_CORE_RUN_STATUS;
   assign 	instr_tcu_dcr           = instr[7:0] == `TAP_TCU_DCR;

   assign	instr_lbist_start     = instr[7:0] == `TAP_LBIST_START;
   assign	instr_lbist_bypass    = instr[7:0] == `TAP_LBIST_BYPASS;
   assign	instr_lbist_mode      = instr[7:0] == `TAP_LBIST_MODE;
   assign	instr_lbist_access    = instr[7:0] == `TAP_LBIST_ACCESS;
   assign	instr_lbist_getdone   = instr[7:0] == `TAP_LBIST_GETDONE;
   assign	instr_lbist_abort     = instr[7:0] == `TAP_LBIST_ABORT;

   assign 	instr_doss_enable       = instr[7:0] == `TAP_DOSS_ENABLE;
   assign 	instr_doss_mode         = instr[7:0] == `TAP_DOSS_MODE;
   assign 	instr_ss_request        = instr[7:0] == `TAP_SS_REQUEST;
   assign 	instr_doss_status       = instr[7:0] == `TAP_DOSS_STATUS;
   assign 	instr_cs_mode           = instr[7:0] == `TAP_CS_MODE;
   assign 	instr_cs_status         = instr[7:0] == `TAP_CS_STATUS;
   assign 	instr_stci_access       = instr[7:0] == `TAP_STCI_ACCESS;
   assign 	instr_stci_clear        = instr[7:0] == `TAP_STCI_CLEAR;
   assign 	instr_dmo_access        = instr[7:0] == `TAP_DMO_ACCESS;
   assign 	instr_dmo_clear         = instr[7:0] == `TAP_DMO_CLEAR;
   assign 	instr_dmo_config        = instr[7:0] == `TAP_DMO_CONFIG;
   assign 	instr_jtpor_access      = instr[7:0] == `TAP_JTPOR_ACCESS;
   assign 	instr_jtpor_clear       = instr[7:0] == `TAP_JTPOR_CLEAR;
   assign 	instr_jtpor_status      = instr[7:0] == `TAP_JTPOR_STATUS;
   assign 	instr_sckbyp_access     = instr[7:0] == `TAP_SCKBYP_ACCESS;
   assign 	instr_sckbyp_clear      = instr[7:0] == `TAP_SCKBYP_CLEAR;
   assign 	instr_tp_access         = instr[7:0] == `TAP_TP_ACCESS;
   assign 	instr_tp_clear          = instr[7:0] == `TAP_TP_CLEAR;

   //==================================================
   // Decode UCB Write Registers
   //==================================================
	assign ucb_jtag_sel_mbist_mode        = (ucb_csr_addr == 6'h0);
	assign ucb_jtag_sel_mbist_bypass      = (ucb_csr_addr == 6'h1);
	assign ucb_jtag_sel_mbist_abort       = (ucb_csr_addr == 6'h3);
	assign ucb_jtag_sel_lbist_mode        = (ucb_csr_addr == 6'h8);
	assign ucb_jtag_sel_lbist_bypass      = (ucb_csr_addr == 6'h9);

	assign ucb_wr_mbist_mode   = ucb_csr_wr && ucb_jtag_sel_mbist_mode;
	assign ucb_wr_mbist_bypass = ucb_csr_wr && ucb_jtag_sel_mbist_bypass;
	assign ucb_wr_mbist_abort  = ucb_csr_wr && ucb_jtag_sel_mbist_abort;
	assign ucb_wr_lbist_mode   = ucb_csr_wr && ucb_jtag_sel_lbist_mode;
	assign ucb_wr_lbist_bypass = ucb_csr_wr && ucb_jtag_sel_lbist_bypass;

   always @(instr)
   begin
      case (instr)
         `TAP_MBIST_MODE:    jtag_csr_addr = 6'h0;
         `TAP_MBIST_BYPASS:  jtag_csr_addr = 6'h1;
         `TAP_MBIST_START:   jtag_csr_addr = 6'h2;
         `TAP_MBIST_ABORT:   jtag_csr_addr = 6'h3;
         `TAP_LBIST_MODE:    jtag_csr_addr = 6'h8;
         `TAP_LBIST_BYPASS:  jtag_csr_addr = 6'h9;
         `TAP_LBIST_START:   jtag_csr_addr = 6'hA;
         `TAP_LBIST_ABORT:   jtag_csr_addr = 6'hB;
         default:            jtag_csr_addr = 6'hF;
      endcase
   end

   assign jtag_csr_wr_din = update_dr_state ||
                            ((instr==`TAP_MBIST_START ||
                             instr==`TAP_MBIST_ABORT ||
                             instr==`TAP_LBIST_START ||
                             instr==`TAP_LBIST_ABORT) && upd_ir_state);

   always @(instr or mbist_mode or new_mbibypass or lbist_mode or new_lbist_bypass)
   begin
      case (instr)
         `TAP_MBIST_MODE:    jtag_csr_data_din[47:0] = {44'h0, mbist_mode[3:0]};
         `TAP_MBIST_BYPASS:  jtag_csr_data_din[47:0] = new_mbibypass[47:0];
         `TAP_LBIST_MODE:    jtag_csr_data_din[47:0] = {46'h0, lbist_mode[1:0]};
         `TAP_LBIST_BYPASS:  jtag_csr_data_din[47:0] = {40'h0, new_lbist_bypass[7:0]};
         default:            jtag_csr_data_din[47:0] = 48'h0;
      endcase
   end

   tcu_jtag_ctl_msff_ctl_macro__width_1 jtag_csr_wr_reg  (
      .scan_in  ( jtag_csr_wr_reg_scanin  ),
      .scan_out ( jtag_csr_wr_reg_scanout ),
      .l1clk    ( l1tck                   ),			       
      .din      ( jtag_csr_wr_din         ),
      .dout     ( jtag_csr_wr             ),
  .siclk(siclk),
  .soclk(soclk));

   tcu_jtag_ctl_msff_ctl_macro__width_48 jtag_csr_data_reg  (
      .scan_in  ( jtag_csr_data_reg_scanin  ),
      .scan_out ( jtag_csr_data_reg_scanout ),
      .l1clk    ( l1tck                     ),			       
      .din      ( jtag_csr_data_din[47:0]  ), 
      .dout     ( jtag_csr_data[47:0]       ),
  .siclk(siclk),
  .soclk(soclk));

   //********************************************************************
   // Clock chopper
   //********************************************************************
   //n2_clk_clkchp_4sel_32x_cust tck_clock_chopper_cust
   //(
   // .tck             (io_tck),
   // .aclk            (chop_aclk),  // output
   // .bclk            (chop_bclk),  // output
   // .s500            (1'b0),       // select 500 pS pulse width
   // .s1000           (1'b0),       // select 1000 pS pulse width
   // .s1500           (1'b0),       // select 1500 pS pulse width
   // .s2000           (1'b1)        // select 2000 pS pulse width
   //);
   // Clock chopper now placed at tcu.sv level  
   assign       clock_chop_aclk      =  ~tlr_state & chop_aclk;
   assign       clock_chop_bclk      =  ~tlr_state & chop_bclk;

   //********************************************************************
   // SerDes Boundary Scan control logic 
   //********************************************************************
   // Serdes 1149.1
   assign 	pre_tcu_sbs_enbstx = instr_clamp | instr_extest | instr_extest_pulse | instr_extest_train;//ECO xxxxxx
   assign 	pre_tcu_sbs_enbsrx = instr_clamp | instr_extest | instr_extest_pulse | instr_extest_train;//ECO xxxxxx
   // Serdes 1149.6
   assign 	pre_tcu_sbs_acmode   = instr_extest_pulse | instr_extest_train; // ECO xxxxxx
   assign 	tcu_sbs_actestsignal = pre_tcu_sbs_acmode & actest_out;         // ECO xxxxxx
   assign 	pre_tcu_sbs_enbspt   = instr_extest_pulse | instr_extest_train; // ECO xxxxxx
   assign 	tcu_sbs_bsinitclk    = tck_bsinitclk      | tck_l_bsinitclk;

   //assign 	tcu_sbs_clk      = bs_clk;
   //assign 	tcu_sbs_aclk     = bs_aclk;
   //assign 	tcu_sbs_uclk     = bs_uclk;

   cl_u1_buf_4x tcu_sbs_se_buf   ( .in(bs_scan_en),  .out(tcu_sbs_scan_en) );
   cl_u1_buf_4x tcu_sbs_clk_buf  ( .in(bs_clk),  .out(tcu_sbs_clk) );
   cl_u1_buf_4x tcu_sbs_aclk_buf ( .in(bs_aclk), .out(tcu_sbs_aclk) );
   cl_u1_buf_4x tcu_sbs_bclk_buf ( .in(bs_bclk), .out(tcu_sbs_bclk) );
   cl_u1_buf_4x tcu_sbs_uclk_buf ( .in(bs_uclk), .out(tcu_sbs_uclk) );

   
   tcu_jtag_ctl_msff_ctl_macro__width_1 bs_actest_reg  
   (
    .scan_in(1'b0),
    .scan_out(bs_actest_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (actest_in), 
    .dout     (actest_out),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign 	actest_in     =    rti_state  & actest_toggle;
   assign       actest_toggle =  ~(actest_out & actest_gen);
   assign 	actest_gen    =   (~instr_extest_pulse  |  instr_extest_train);

   assign 	ex_state        =  ex1_dr_state       |  ex2_dr_state;
   assign 	extest_active   =  instr_extest_pulse |  instr_extest_train;
   assign 	tck_bsinitclk   =  l1tck & ex_state            &  extest_active;
   assign 	tck_l_bsinitclk =  tck_l & capture_dr_state    &  instr_extest;
   
   //********************************************************************
   // Boundary Scan control logic and clock generation - to MIO
   //********************************************************************
   assign 	tcu_mio_bs_scan_en  =  bs_scan_en;
   assign 	tcu_mio_bs_clk      =  bs_clk;
   assign 	tcu_mio_bs_aclk     =  bs_aclk;
   assign 	tcu_mio_bs_bclk     =  bs_bclk;
   assign 	tcu_mio_bs_uclk     =  bs_uclk;
   assign 	pre_tcu_mio_bs_mode_ctl =  bs_mode_ctl | pin_scanmode; // ECO xxxxxx
   assign 	tcu_mio_bs_scan_in  =  sbs_tcu_scan_out;
   assign 	pre_tcu_mio_bs_highz_l  = ~instr_highz; // ECO xxxxxx
   
   assign 	bs_instr      = instr_extest | instr_sample_pl | instr_extest_pulse | instr_extest_train;
   assign 	scan_instr    =  bs_instr | jtag_ser_scan;
   assign 	bs_mode_ctl   = ~(instr_extest | instr_extest_pulse | instr_extest_train | instr_clamp | instr_highz);


   assign 	bs_clk  = pin_scanmode ? l1tck   : (~bs_instr | (io_tck | ~capture_dr_state));
   assign 	bs_aclk = pin_scanmode ? siclk 
                                         : bs_aclk_en ? clock_chop_aclk
                                         : 1'b0;
   assign 	bs_bclk = pin_scanmode ? soclk 
		                         : (bs_scan_en & ~bs_bclk_en) ? 1'b1
                                         : bs_bclk_en ? ~clock_chop_bclk
                                         : 1'b0;
   
   assign 	bs_scan_en_pre = scan_instr & shift_dr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 bs_scan_enne_reg  
   (
    .scan_in(bs_scan_enne_reg_scanin),
    .scan_out(bs_scan_enne_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (bs_scan_en_pre), 
    .dout     (bs_scan_en_ne),
  .siclk(siclk),
  .soclk(soclk)       
   );  
   tcu_jtag_ctl_msff_ctl_macro__width_1 bs_scan_enpe_reg  
   (
    .scan_in(bs_scan_enpe_reg_scanin),
    .scan_out(bs_scan_enpe_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (bs_scan_en_pre), 
    .dout     (bs_scan_en_pe),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign 	bs_scan_en = pin_scanmode ? pin_scan_en 
                           : tlr_state    ? 1'b0
                           : bs_scan_en_ne; 
   assign       bs_aclk_en = scan_instr & bs_scan_en_ne;
   assign 	bs_bclk_en = tlr_state    ? 1'b0
                           : scan_instr & bs_scan_en_pe;

   cl_u1_buf_4x tcu_sbs_soclk_buf ( .in(soclk),   .out(soclk_buf   ) );
   assign       soclk_l   = ~soclk_buf;
   assign 	bs_update = bs_instr & update_dr_state;
   assign 	bs_uclk   = ~pin_scanmode ? (bs_update & clock_chop_bclk)
                                            : bs_scan_en ? soclk_l : l1tck;

   // Scan out connection to tdi or to serial scan chain (one/all of 32 scan chains)
   assign 	jtag_sbs_scan_in = bs_instr ? io_tdi : ser_scan_out;
   assign 	jt_scan_in = io_tdi;	

   //********************************************************************
   // IDCODE
   //********************************************************************
   // this is the IDCODE register; capture and shift only, no update reg.
   //  - capture on TCK rising edge in capDR after tlr, this will be idcode instr.
   //  - does not need trst_l
   
   tcu_jtag_ctl_msff_ctl_macro__width_32 tap_idcode_reg  
   (
    .scan_in(tap_idcode_reg_scanin),
    .scan_out(tap_idcode_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (next_idcode[31:0]), 
    .dout     (new_idcode[31:0]),
  .siclk(siclk),
  .soclk(soclk)       
    );
   
   assign 	idcode_data[31:0] = {jtag_id[3:0], `PART_ID, `MANUF_ID, 1'b1};
   assign 	next_idcode[31:0] = (instr_idcode & shift_dr_state) ? {io_tdi, new_idcode[31:1]}
	                            : (instr_idcode & capture_dr_state) ? idcode_data[31:0]
				    : new_idcode;

   //********************************************************************
   // Select Chains for SERIAL Scan: Either all or only one between TDI & TDO
   //********************************************************************
   // this is the register to specify one of 32 chains to select
   //  - msb = enable bit
   //  - serial chain shifts only; we don't want to capture or update the serial scan reg.
   //  - does not need trst_l
   
   tcu_jtag_ctl_msff_ctl_macro__width_6 tap_chainsel_reg  
   (
    .scan_in(tap_chainsel_reg_scanin),
    .scan_out(tap_chainsel_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (next_selchain[5:0]), 
    .dout     (selchain[5:0]),
  .siclk(siclk),
  .soclk(soclk)       
    );

   // TLR ECO
   //assign 	next_selchain[5:0] = (instr_chainsel & shift_dr_state) ? {io_tdi, selchain[5:1]}
   //                              : (instr_chainsel & capture_dr_state) ? selchain[5:0] //6'b000000
   //                              : tlr_state ? 6'b000000 
   //				   : selchain[5:0];

   assign 	next_selchain[5:0] = ({6{(instr_chainsel & shift_dr_state)}} & {io_tdi, selchain[5:1]}) |
                                       ({6{(~(instr_chainsel & shift_dr_state) & ~tlr_state)}} & selchain[5:0]);

   assign 	sel_chain[4:0]  = selchain[4:0];
   assign 	chain_select    = selchain[5];

   //********************************************************************
   // EFuse Support - FUSE_READ_MODE
   //********************************************************************
   //  - update reg needs trst_l; can capture previously scanned value for inspection
   // fuse_read_mode
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_3 tap_fusemode_shift_reg 
   (
    .scan_in(tap_fusemode_shift_reg_scanin),
    .scan_out(tap_fusemode_shift_reg_scanout),
    .l1clk      (l1tck),
    .din	(next_new_fusemode[2:0]),
    .dout	(new_fusemode[2:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign	next_new_fusemode[2:0] = (instr_fuse_read_mode & shift_dr_state) ? {io_tdi, new_fusemode[2:1]}
                                        :(instr_fuse_read_mode & capture_dr_state) ? fusemode[2:0]
                                        : new_fusemode[2:0];
   // this is the UPDATE register - gets tck_l
   tcu_jtag_ctl_msff_ctl_macro__width_3 tap_fusemode_upd_reg  
   (
    .scan_in(tap_fusemode_upd_reg_scanin),
    .scan_out(tap_fusemode_upd_reg_scanout_unused),
    .l1clk      (tck_l),                         
    .din        (next_fusemode[2:0]), 
    .dout       (fusemode[2:0]),
  .siclk(siclk),
  .soclk(soclk)       
   );
   // this performs update
   assign       next_fusemode[2:0] = (instr_fuse_read_mode & update_dr_state) ? new_fusemode[2:0] 
                                   : tlr_state ? 3'b000 : fusemode[2:0];
   assign       tcu_efu_read_mode[2:0] = {3{~tlr_state}} & fusemode[2:0];

   //********************************************************************
   // EFuse Support - FUSE_ROW_ADDR
   //********************************************************************
   //  - update reg needs trst_l; can capture previously scanned value for inspection
   // fuse_row_addr
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_7 tap_fuserowaddr_shift_reg 
   (
    .scan_in(tap_fuserowaddr_shift_reg_scanin),
    .scan_out(tap_fuserowaddr_shift_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_new_fuserowaddr[6:0]),
    .dout	(new_fuserowaddr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	next_new_fuserowaddr[6:0] = (instr_fuse_row_addr & shift_dr_state) 
                                          ? {io_tdi, new_fuserowaddr[6:1]}
                                          :(instr_fuse_row_addr & capture_dr_state) 
                                          ? fuserowaddr[6:0] : new_fuserowaddr[6:0];
   
   // this is the UPDATE register - gets tck_l
   tcu_jtag_ctl_msff_ctl_macro__width_7 tap_fuserowaddr_upd_reg 
   (
    .scan_in(tap_fuserowaddr_upd_reg_scanin),
    .scan_out(tap_fuserowaddr_upd_reg_scanout_unused),
    .l1clk      (tck_l),
    .din	(next_fuserowaddr[6:0]),
    .dout	(fuserowaddr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // this performs update
   assign	next_fuserowaddr[6:0] = (instr_fuse_row_addr & update_dr_state) ? new_fuserowaddr[6:0]
                                      : tlr_state ? 7'b0000000 : fuserowaddr[6:0];
   assign	tcu_efu_rowaddr[6:0]  = {7{~tlr_state}} & fuserowaddr[6:0];

   //********************************************************************
   // EFuse Support - FUSE_COl_ADDR
   //********************************************************************
   //  - update reg needs trst_l; can capture previously scanned value for inspection
   // fuse_col_addr
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_5 tap_fusecoladdr_shift_reg 
   (
    .scan_in(tap_fusecoladdr_shift_reg_scanin),
    .scan_out(tap_fusecoladdr_shift_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_new_fusecoladdr[4:0]),
    .dout	(new_fusecoladdr[4:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	next_new_fusecoladdr[4:0] = (instr_fuse_col_addr & shift_dr_state) ? {io_tdi, new_fusecoladdr[4:1]}
                                           :(instr_fuse_col_addr & capture_dr_state) ? fusecoladdr[4:0]
                                           : new_fusecoladdr[4:0];
   // this is the UPDATE register - gets tck_l
   tcu_jtag_ctl_msff_ctl_macro__width_5 tap_fusecoladdr_upd_reg 
   (
    .scan_in(tap_fusecoladdr_upd_reg_scanin),
    .scan_out(tap_fusecoladdr_upd_reg_scanout_unused),
    .l1clk      (tck_l),
    .din        (next_fusecoladdr[4:0]),
    .dout       (fusecoladdr[4:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // this performs update
   assign        next_fusecoladdr[4:0] = (instr_fuse_col_addr & update_dr_state) ? new_fusecoladdr[4:0]
                                       : tlr_state ? 5'b00000 : fusecoladdr[4:0];
   assign	 tcu_efu_coladdr[4:0]  = {5{~tlr_state}} & fusecoladdr[4:0];

   //********************************************************************
   // EFuse Support - FUSE_READ instruction
   //********************************************************************
   //  - no shift or update regs involved
   // single bit to pulse tcu_efu_read_en for one TCK cycle
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_fusereaden_reg 
   (
    .scan_in(tap_fusereaden_reg_scanin),
    .scan_out(tap_fusereaden_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_fusereaden),
    .dout	(new_fusereaden),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	 next_fusereaden = instr_fuse_read & rti_state;
   assign        tcu_efu_read_en = ~new_fusereaden & next_fusereaden;

   //********************************************************************
   // EFuse Support - FUSE_DEST_SAMPLE instruction
   //********************************************************************
   //  - no shift or update regs involved
   // single bit to pulse tcu_efu_dest_sample for one TCK cycle
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_fusedestsample_reg 
   (
    .scan_in(tap_fusedestsample_reg_scanin),
    .scan_out(tap_fusedestsample_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_fusedestsample),
    .dout	(new_fusedestsample),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	 next_fusedestsample = instr_fuse_dest_sample & rti_state;
   assign	 tcu_efu_dest_sample = ~new_fusedestsample & next_fusedestsample;

   //********************************************************************
   // EFuse Support - FUSE_BYPASS instruction
   //********************************************************************
   //  - no shift or update regs involved
   // single bit to pulse tcu_efu_fuse_bypass for one TCK cycle
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_fusebypass_reg 
   (
    .scan_in(tap_fusebypass_reg_scanin),
    .scan_out(tap_fusebypass_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_fusebypass),
    .dout	(new_fusebypass),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	 next_fusebypass      = instr_fuse_bypass & rti_state;
   assign	 tcu_efu_fuse_bypass  = ~new_fusebypass & next_fusebypass;

   // common EFuse assigns
   assign        fuse_capshft       = instr_fuse_read | instr_fuse_dest_sample; 
   assign	 tcu_efu_capturedr  = fuse_capshft & capture_dr_state;
   assign	 tcu_efu_shiftdr    = (fuse_capshft | instr_fuse_bypass_data) & shift_dr_state;
   assign	 tcu_efu_updatedr   = instr_fuse_bypass_data & update_dr_state;

   assign        rti_state  = (tap_state[3:0] == `TAP_RTI);
 //assign        tlr_state  = (tap_state[3:0] == `TAP_RESET);
   assign        tcu_efu_data_in = io_tdi;
   assign        fuse_instr = instr_fuse_read_mode | instr_fuse_row_addr | instr_fuse_col_addr
                            | instr_fuse_read | instr_fuse_dest_sample | instr_fuse_bypass_data;

   //********************************************************************
   // EFuse Support - Redundancy Value Clear - to tcu_sigmux_ctl
   //********************************************************************
   //  can capture previously scanned value for inspection
   // bit[6]=enable; bits[5:0]=RV_ID
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_7 tap_rvclr_shift_reg 
   (
    .scan_in(tap_rvclr_shift_reg_scanin),
    .scan_out(tap_rvclr_shift_reg_scanout),
    .l1clk	(l1tck),
    .din	(next_new_rvclr[6:0]),
    .dout	(new_rvclr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	next_new_rvclr[6:0] = (instr_rvclr & shift_dr_state)   ? {io_tdi, new_rvclr[6:1]}
                                    : (instr_rvclr & capture_dr_state) ? rvclr[6:0]
                                    : tlr_state                        ? 7'b0000000 
                                    : new_rvclr[6:0];
   // this is the UPDATE register - gets tck_l
   tcu_jtag_ctl_msff_ctl_macro__width_7 tap_rvclr_upd_reg 
   (
    .scan_in(tap_rvclr_upd_reg_scanin),
    .scan_out(tap_rvclr_upd_reg_scanout),
    .l1clk      (l1tck),  // don't need tck_l since not a tck domain data register
    .din        (next_rvclr[6:0]),
    .dout       (rvclr[6:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // this performs update
   assign        next_rvclr[6:0] = efu_clear_upd  ? new_rvclr[6:0]
                                 : tlr_state ? 7'b0000000 : rvclr[6:0];

   assign        efu_clear_upd        = instr_rvclr & update_dr_state; 
   //assign        jtag_efu_rvclr[6:0]  = {7{~tlr_state}} & new_rvclr[6:0];// to tcu_sigmux_ctl; redundancy value clear ID // TLR ECO
   assign        jtag_efu_rvclr[6:0]  = new_rvclr[6:0]; // TLR ECO
   //assign        jtag_efu_clear_instr = ~tlr_state & efu_clear_upd; // to tcu_sigmux_ctl; indicates jtag clear active
   assign        jtag_efu_clear_instr = efu_clear_upd; // TLR ECO // to tcu_sigmux_ctl; indicates jtag clear active
   //jtag_efu_rvclr update reg value sent to efuse changed to output of shift reg to avoid sending old value during update dr
   //********************************************************************
   // MBIST: Bypass register:  88 bypass bits, 1=bypass mbist engine
   //********************************************************************
   // Update register specifies which mbist engines to bypass 
   // Capture into shift reg enabled
   //  - update reg only needs trst_l; default is to bypass no mbist engines (all selected)
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_48 tap_mbibypass_shift_reg 
   (
    .scan_in  (tap_mbibypass_shift_reg_scanin),
    .scan_out (tap_mbibypass_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_new_mbibypass[`NUM_TOTAL_MBIST_M1:0]),
    .dout     (new_mbibypass[`NUM_TOTAL_MBIST_M1:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	 next_new_mbibypass = (instr_mbist_bypass & shift_dr_state) ? {io_tdi, new_mbibypass[`NUM_TOTAL_MBIST_M1:1]} 
				    : (instr_mbist_bypass & capture_dr_state) ? mbibypass
				    : new_mbibypass;
		 
   // this is the UPDATE register 
   tcu_jtag_ctl_msff_ctl_macro__width_48 tap_mbibypass_upd_reg 
   (
    .scan_in  (tap_mbibypass_upd_reg_scanin),
    .scan_out (tap_mbibypass_upd_reg_scanout),
    .l1clk    (l1tck), //(tck_l),
    .din      (next_mbibypass[`NUM_TOTAL_MBIST_M1:0]),
    .dout     (mbibypass[`NUM_TOTAL_MBIST_M1:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // this performs update
   assign next_mbibypass = (instr_mbist_bypass & update_dr_state) ? new_mbibypass 
                         : (ucb_wr_mbist_abort || tlr_state) ? {`NUM_TOTAL_MBIST{1'b0}} 
                         :  ucb_wr_mbist_bypass ? ucb_data_out[47:0] 
		         :  mbibypass;

   //********************************************************************
   // MBIST: Done register:    66 done bits from MBIST engines
   //        Fail register:    66 fail bits from MBIST engines
   //********************************************************************
   // No update, capture/shift only
   // If MBIST GETDONE instruction active, captures 66 done status bits from the mbist engines
   // If MBIST GETFAIL instruction active, captures 66 fail status bits from the mbist engines
   //  - this register is shared by the TAP_MBIST_GETDONE and TAP_MBIST_GETFAIL instructions
   //  - capture into shift reg only for getdone/getfail
   //  does not need trst_l

   assign 	 instr_mbist66 = instr_mbist_getdone | instr_mbist_getfail;
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_48 tap_mbist_get_done_fail_shift_reg 
   (
    .scan_in  (tap_mbist_get_done_fail_shift_reg_scanin),
    .scan_out (tap_mbist_get_done_fail_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_mbist_get_done_fail[`NUM_TOTAL_MBIST_M1:0]),
    .dout     (mbist_get_done_fail[`NUM_TOTAL_MBIST_M1:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	 next_mbist_get_done_fail = (instr_mbist66 & shift_dr_state) ?
												{io_tdi, mbist_get_done_fail[`NUM_TOTAL_MBIST_M1:1]}
		                        : (instr_mbist_getdone & capture_dr_state) ? mbist_done
		                        : (instr_mbist_getfail & capture_dr_state) ? mbist_fail
				        : mbist_get_done_fail;
   
   //********************************************************************
   // MBIST: Result register
   //********************************************************************
   // captures 2 bits: done, fail for all 66 mbist engines, to shift out (no update reg.)
   //  - does not need trst_l
   // bit 1=diag mode, bit 0=serial/parallel mode (bit0=1-->parallel mode)
   
   tcu_jtag_ctl_msff_ctl_macro__width_2 tap_mbist_result_reg  
   (
    .scan_in  (tap_mbist_result_reg_scanin),
    .scan_out (tap_mbist_result_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (next_mbist_result[1:0]), 
    .dout     (mbist_result[1:0]),
  .siclk(siclk),
  .soclk(soclk)       
    );
   assign 	 next_mbist_result[1:0] = (instr_mbist_result & shift_dr_state) ? {io_tdi, mbist_result[1]}
	                               : (instr_mbist_result & capture_dr_state) ? mbist_done_fail[1:0]
				       : mbist_result[1:0];

   //********************************************************************
   // MBIST: Mode
   //********************************************************************
   //  - no capture, only shift (contents gated by mbist_start); needs trst_l
   // dual bits to store diag/serial bits until cleared by TAP_MBIST_ABORT/TLR
   tcu_jtag_ctl_msff_ctl_macro__width_4 tap_mbist_mode_reg 
   (
    .scan_in  (tap_mbist_mode_reg_scanin),
    .scan_out (tap_mbist_mode_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_mbist_mode[3:0]),
    .dout     (mbist_mode[3:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign next_mbist_mode[3:0] = (instr_mbist_mode & shift_dr_state) ?  {io_tdi, mbist_mode[3:1]}
		                     : (instr_mbist_abort | tlr_state | ucb_wr_mbist_abort) ? 4'b00
	           	            : ucb_wr_mbist_mode ? ucb_data_out[3:0] : mbist_mode;

   //********************************************************************
   // MBIST Enable for Clock Stop via Cycle Counter  
   //********************************************************************
   // When mbist controller is started, it sends a start signal to the cycle
   //  counter if this register is set. When the cycle counter reaches zero,
   //  a hard clock stop is initiated, so that a scan dump can be performed.
   // single bit to store start signal until cleared by TAP_CLOCK_START/TLR
   tcu_jtag_ctl_msff_ctl_macro__clr_1__en_1__width_1 tap_mbist_clkstpen_reg 
   (
    .scan_in  (tap_mbist_clkstpen_reg_scanin),
    .scan_out (tap_mbist_clkstpen_reg_scanout),
    .l1clk    (l1tck),
    .clr      (clkstpen_clear),
    .en       (mbist_cyc_count_en),
    .din      (instr_mbist_clkstpen),
    .dout     (mbist_clkstpen_q),
  .siclk(siclk),
  .soclk(soclk));
   assign mbist_clkstpen   =  mbist_clkstpen_q; // TLR ECO //  & ~tlr_state;
   assign clkstpen_clear   =  instr_clock_start | tlr_state;
   assign mbist_cyc_count_en = ~mbist_clkstpen_q & ~tlr_state;

   //********************************************************************
   // MBIST: Diagnostics
   //********************************************************************
   // This places one mbist engine (out of 66) between TDI & TDO
   // It is for shifting only, no need to capture or update since we use clock_stop
   //  to the header to control activity.
   // To use: 1. program tap_mbist_bypass & bypass all but one mbist engine (or 3 per core)
   // 2. program tap_mbist_diag, and shift data out TDO
   // The logic below first stops the clock to the targeted mbist engine
   //  then it puts soclk "high" to turn off slave (assumes clock stops low)
   //  then it activates scan_en (shiftDR)
   //  then it sends siclk & soclk via chopped TCK to the target mbist engine
   // Scan is destructive; to program mbist you must scan in valid data, then
   //  reverse the above: put soclk "high", turn off scan_en, then turn off stop

   // General MBIST logic
   assign 	mbi_shiftdr = instr_mbist_diag & shift_dr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 mbi_ascan_en_reg  
   (
    .scan_in  (mbi_a_scan_en_reg_scanin),
    .scan_out (mbi_a_scan_en_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (mbi_shiftdr), 
    .dout     (mbi_a_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );  
   assign     mbi_a_scan_en = mbi_a_scan_en_q & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 mbi_bscan_en_reg  
   (
    .scan_in  (mbi_b_scan_en_reg_scanin),
    .scan_out (mbi_b_scan_en_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (mbi_shiftdr), 
    .dout     (mbi_b_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign     mbi_b_scan_en = mbi_b_scan_en_q & ~tlr_state;

   assign 	mbi_scan_en = mbi_a_scan_en | mbi_b_scan_en;
   assign 	ex1_dr_state    = (tap_state[3:0] == `TAP_EXIT1_DR);
   assign 	pause_dr_state  = (tap_state[3:0] == `TAP_PAUSE_DR);
   assign 	ex2_dr_state    = (tap_state[3:0] == `TAP_EXIT2_DR);
   assign 	soclk_off = shift_dr_state | ex1_dr_state | pause_dr_state | ex2_dr_state | update_dr_state;
   
	/*
   assign spc_mbist_en[7:0] = ~mbibypass[7:0];

   assign spc_mb_aclk[7:0] = (spc_mbist_en[7:0] & {8{mbi_a_scan_en}}) ?
                                 {8{clock_chop_aclk}} : 8'b0;
   assign spc_mb_bclk[7:0] = (spc_mbist_en[7:0] & {8{mbi_b_scan_en}}) ?
                                 {8{!clock_chop_bclk}} :
                                 (spc_mbist_en[7:0] & {8{instr_mbist_diag}} & {8{soclk_off}}) ?
                                     8'hFF :
                                     8'h0;
   assign spc_mb_scan_en[7:0] = spc_mbist_en[7:0] & {8{mbi_scan_en}};
   assign spc_mb_clk_stop[7:0] = spc_mbist_en[7:0] & {8{instr_mbist_diag}};
   
   assign tap_spc_mb_aclk[7:0]        = instr_mbist_diag ? spc_mb_aclk[7:0] : spc_lb_aclk[7:0];
   assign tap_spc_mb_bclk[7:0]        = instr_mbist_diag ? spc_mb_bclk[7:0] : spc_lb_bclk[7:0];
   assign tap_spc_mb_scan_en[7:0]     = instr_mbist_diag ? spc_mb_scan_en[7:0] : spc_lb_scan_en[7:0];
   assign tap_spc_mb_clk_stop_ps[7:0] = instr_mbist_diag ? spc_mb_clk_stop[7:0] : spc_lb_clk_stop[7:0];
   assign tap_spc_mb_clk_stop[0]      = tap_spc0_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[1]      = tap_spc1_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[2]      = tap_spc2_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[3]      = tap_spc3_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[4]      = tap_spc4_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[5]      = tap_spc5_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[6]      = tap_spc6_mb_clk_stop_sync;
   assign tap_spc_mb_clk_stop[7]      = tap_spc7_mb_clk_stop_sync;
*/



   // ******* For SPC0, mbist engine 0-2 ********************************
   assign 	mbi_spc0 = !mbibypass[0] & ~tlr_state;   // |mbibypass[2:0];
   assign 	spc0_mb_aclk     = (mbi_spc0 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc0_mb_bclk     = (mbi_spc0 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc0 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc0_mb_scan_en  = (mbi_spc0 & mbi_scan_en);
   assign 	spc0_mb_clk_stop = (mbi_spc0 & instr_mbist_diag);
   
   //assign 	tap_spc0_mb_aclk     = pin_scanmode ? siclk       : (flush | spc0_mb_aclk | jt_scan_aclk);
   //assign 	tap_spc0_mb_bclk     = pin_scanmode ? soclk       : (spc0_mb_bclk | jt_scan_bclk);
   //assign 	tap_spc0_mb_scan_en  = pin_scanmode ? pin_scan_en : (flush_dly | spc0_mb_scan_en | jt_scan_en);
   //assign 	tap_spc0_mb_clk_stop_ps = pin_scanmode ? 1'b0        : spc0_mb_clk_stop;
   //assign 	tap_spc0_mb_clk_stop = spc0_clk_stop | tap_spc0_mb_clk_stop_sync;
   assign 	tap_spc0_mb_aclk        = instr_mbist_diag ? spc0_mb_aclk : spc_lb_aclk[0];
   assign 	tap_spc0_mb_bclk        = instr_mbist_diag ? spc0_mb_bclk : spc_lb_bclk[0];
   assign 	tap_spc0_mb_scan_en     = instr_mbist_diag ? spc0_mb_scan_en : spc_lb_scan_en[0];
   assign 	tap_spc0_mb_clk_stop_din = instr_mbist_diag ? spc0_mb_clk_stop : spc_lb_clk_stop[0];
   assign 	tap_spc0_mb_scan_out    = io_tdi;
   // ******* For SPC1, mbist engine 0-2 ******************************** 
   assign 	mbi_spc1 = !mbibypass[1] & ~tlr_state;
   assign 	spc1_mb_aclk     = (mbi_spc1 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc1_mb_bclk     = (mbi_spc1 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc1 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc1_mb_scan_en  = (mbi_spc1 & mbi_scan_en);
   assign 	spc1_mb_clk_stop = (mbi_spc1 & instr_mbist_diag);

   assign 	tap_spc1_mb_aclk        = instr_mbist_diag ? spc1_mb_aclk : spc_lb_aclk[1];
   assign 	tap_spc1_mb_bclk        = instr_mbist_diag ? spc1_mb_bclk : spc_lb_bclk[1];
   assign 	tap_spc1_mb_scan_en     = instr_mbist_diag ? spc1_mb_scan_en : spc_lb_scan_en[1];
   assign 	tap_spc1_mb_clk_stop_din = instr_mbist_diag ? spc1_mb_clk_stop : spc_lb_clk_stop[1];
   assign 	tap_spc1_mb_scan_out    = io_tdi;
   // ******* For SPC2, mbist engine 0-2 ********************************
   assign 	mbi_spc2 = !mbibypass[2] & ~tlr_state;
   assign 	spc2_mb_aclk     = (mbi_spc2 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc2_mb_bclk     = (mbi_spc2 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc2 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc2_mb_scan_en  = (mbi_spc2 & mbi_scan_en);
   assign 	spc2_mb_clk_stop = (mbi_spc2 & instr_mbist_diag);

   assign 	tap_spc2_mb_aclk        = instr_mbist_diag ? spc2_mb_aclk : spc_lb_aclk[2];
   assign 	tap_spc2_mb_bclk        = instr_mbist_diag ? spc2_mb_bclk : spc_lb_bclk[2];
   assign 	tap_spc2_mb_scan_en     = instr_mbist_diag ? spc2_mb_scan_en : spc_lb_scan_en[2];
   assign 	tap_spc2_mb_clk_stop_din = instr_mbist_diag ? spc2_mb_clk_stop : spc_lb_clk_stop[2];
   assign 	tap_spc2_mb_scan_out    = io_tdi;
   // ******* For SPC3, mbist engine 0-2 ********************************
   assign 	mbi_spc3 = !mbibypass[3] & ~tlr_state;
   assign 	spc3_mb_aclk     = (mbi_spc3 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc3_mb_bclk     = (mbi_spc3 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc3 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc3_mb_scan_en  = (mbi_spc3 & mbi_scan_en);
   assign 	spc3_mb_clk_stop = (mbi_spc3 & instr_mbist_diag);

   assign 	tap_spc3_mb_aclk        = instr_mbist_diag ? spc3_mb_aclk : spc_lb_aclk[3];
   assign 	tap_spc3_mb_bclk        = instr_mbist_diag ? spc3_mb_bclk : spc_lb_bclk[3];
   assign 	tap_spc3_mb_scan_en     = instr_mbist_diag ? spc3_mb_scan_en : spc_lb_scan_en[3];
   assign 	tap_spc3_mb_clk_stop_din = instr_mbist_diag ? spc3_mb_clk_stop : spc_lb_clk_stop[3];
   assign 	tap_spc3_mb_scan_out    = io_tdi;
   // ******* For SPC4, mbist engine 0-2 ********************************
   assign 	mbi_spc4 = !mbibypass[4] & ~tlr_state;
   assign 	spc4_mb_aclk     = (mbi_spc4 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc4_mb_bclk     = (mbi_spc4 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc4 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc4_mb_scan_en  = (mbi_spc4 & mbi_scan_en);
   assign 	spc4_mb_clk_stop = (mbi_spc4 & instr_mbist_diag);

   assign 	tap_spc4_mb_aclk        = instr_mbist_diag ? spc4_mb_aclk : spc_lb_aclk[4];
   assign 	tap_spc4_mb_bclk        = instr_mbist_diag ? spc4_mb_bclk : spc_lb_bclk[4];
   assign 	tap_spc4_mb_scan_en     = instr_mbist_diag ? spc4_mb_scan_en : spc_lb_scan_en[4];
   assign 	tap_spc4_mb_clk_stop_din = instr_mbist_diag ? spc4_mb_clk_stop : spc_lb_clk_stop[4];
   assign 	tap_spc4_mb_scan_out    = io_tdi;
   // ******* For SPC5, mbist engine 0-2 ********************************
   assign 	mbi_spc5 = !mbibypass[5] & ~tlr_state;
   assign 	spc5_mb_aclk     = (mbi_spc5 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc5_mb_bclk     = (mbi_spc5 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc5 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc5_mb_scan_en  = (mbi_spc5 & mbi_scan_en);
   assign 	spc5_mb_clk_stop = (mbi_spc5 & instr_mbist_diag);

   assign 	tap_spc5_mb_aclk        = instr_mbist_diag ? spc5_mb_aclk : spc_lb_aclk[5];
   assign 	tap_spc5_mb_bclk        = instr_mbist_diag ? spc5_mb_bclk : spc_lb_bclk[5];
   assign 	tap_spc5_mb_scan_en     = instr_mbist_diag ? spc5_mb_scan_en : spc_lb_scan_en[5];
   assign 	tap_spc5_mb_clk_stop_din = instr_mbist_diag ? spc5_mb_clk_stop : spc_lb_clk_stop[5];
   assign 	tap_spc5_mb_scan_out    = io_tdi;
   // ******* For SPC6, mbist engine 0-2 ********************************
   assign 	mbi_spc6 = !mbibypass[6] & ~tlr_state;
   assign 	spc6_mb_aclk     = (mbi_spc6 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc6_mb_bclk     = (mbi_spc6 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc6 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc6_mb_scan_en  = (mbi_spc6 & mbi_scan_en);
   assign 	spc6_mb_clk_stop = (mbi_spc6 & instr_mbist_diag);

   assign 	tap_spc6_mb_aclk        = instr_mbist_diag ? spc6_mb_aclk : spc_lb_aclk[6];
   assign 	tap_spc6_mb_bclk        = instr_mbist_diag ? spc6_mb_bclk : spc_lb_bclk[6];
   assign 	tap_spc6_mb_scan_en     = instr_mbist_diag ? spc6_mb_scan_en : spc_lb_scan_en[6];
   assign 	tap_spc6_mb_clk_stop_din = instr_mbist_diag ? spc6_mb_clk_stop : spc_lb_clk_stop[6];
   assign 	tap_spc6_mb_scan_out    = io_tdi;
   // ******* For SPC7, mbist engine 0-2 ********************************
   assign 	mbi_spc7 = !mbibypass[7] & ~tlr_state;
   assign 	spc7_mb_aclk     = (mbi_spc7 & mbi_a_scan_en) ?  clock_chop_aclk : 1'b0;
   assign 	spc7_mb_bclk     = (mbi_spc7 & mbi_b_scan_en) ? ~clock_chop_bclk
		                 : (mbi_spc7 & instr_mbist_diag & soclk_off) ? 1'b1
                                 : 1'b0; 
   assign 	spc7_mb_scan_en  = (mbi_spc7 & mbi_scan_en);
   assign 	spc7_mb_clk_stop = (mbi_spc7 & instr_mbist_diag);

   assign 	tap_spc7_mb_aclk        = instr_mbist_diag ? spc7_mb_aclk : spc_lb_aclk[7];
   assign 	tap_spc7_mb_bclk        = instr_mbist_diag ? spc7_mb_bclk : spc_lb_bclk[7];
   assign 	tap_spc7_mb_scan_en     = instr_mbist_diag ? spc7_mb_scan_en : spc_lb_scan_en[7];
   assign 	tap_spc7_mb_clk_stop_din = instr_mbist_diag ? spc7_mb_clk_stop : spc_lb_clk_stop[7];
   assign 	tap_spc7_mb_scan_out    = io_tdi;


   assign 	mbist_sii          = !(&mbibypass[9:8]) & ~tlr_state;
   assign 	mbist_sio          = !(&mbibypass[11:10]) & ~tlr_state;
   assign 	mbist_ncu          = !(&mbibypass[13:12]) & ~tlr_state;
   assign 	mbist_mcu0         = !mbibypass[14] & ~tlr_state;
   assign 	mbist_mcu1         = !mbibypass[15] & ~tlr_state;
   assign 	mbist_mcu2         = !mbibypass[16] & ~tlr_state;
   assign 	mbist_mcu3         = !mbibypass[17] & ~tlr_state;
   assign 	mbist_l2b0         = !mbibypass[18] & ~tlr_state;
   assign 	mbist_l2b1         = !mbibypass[19] & ~tlr_state;
   assign 	mbist_l2b2         = !mbibypass[20] & ~tlr_state;
   assign 	mbist_l2b3         = !mbibypass[21] & ~tlr_state;
   assign 	mbist_l2b4         = !mbibypass[22] & ~tlr_state;
   assign 	mbist_l2b5         = !mbibypass[23] & ~tlr_state;
   assign 	mbist_l2b6         = !mbibypass[24] & ~tlr_state;
   assign 	mbist_l2b7         = !mbibypass[25] & ~tlr_state;
   assign 	mbist_l2t0         = !mbibypass[26] & ~tlr_state;
   assign 	mbist_l2t1         = !mbibypass[27] & ~tlr_state;
   assign 	mbist_l2t2         = !mbibypass[28] & ~tlr_state;
   assign 	mbist_l2t3         = !mbibypass[29] & ~tlr_state;
   assign 	mbist_l2t4         = !mbibypass[30] & ~tlr_state;
   assign 	mbist_l2t5         = !mbibypass[31] & ~tlr_state;
   assign 	mbist_l2t6         = !mbibypass[32] & ~tlr_state;
   assign 	mbist_l2t7         = !mbibypass[33] & ~tlr_state;
   assign 	mbist_dmu          = !(&mbibypass[35:34]) & ~tlr_state;
   assign 	mbist_peu          = !mbibypass[36] & ~tlr_state;
   assign 	mbist_tds_tdmc     = !(&mbibypass[38:37]) & ~tlr_state;
   assign 	mbist_rtx          = !(&mbibypass[46:39]) & ~tlr_state;
   assign 	mbist_rdp_rdmc     = !mbibypass[47] & ~tlr_state;

   // TLR ECO
      assign       mbist_sii_n          = !(&mbibypass[9:8]) ;
   assign       mbist_sio_n          = !(&mbibypass[11:10]) ;
   assign       mbist_ncu_n          = !(&mbibypass[13:12]) ;
   assign       mbist_mcu0_n         = !mbibypass[14] ;
   assign       mbist_mcu1_n         = !mbibypass[15] ;
   assign       mbist_mcu2_n         = !mbibypass[16] ;
   assign       mbist_mcu3_n         = !mbibypass[17] ;
   assign       mbist_l2b0_n         = !mbibypass[18] ;
   assign       mbist_l2b1_n         = !mbibypass[19] ;
   assign       mbist_l2b2_n         = !mbibypass[20] ;
   assign       mbist_l2b3_n         = !mbibypass[21] ;
   assign       mbist_l2b4_n         = !mbibypass[22] ;
   assign       mbist_l2b5_n         = !mbibypass[23] ;
   assign       mbist_l2b6_n         = !mbibypass[24] ;
   assign       mbist_l2b7_n         = !mbibypass[25] ;
   assign       mbist_l2t0_n         = !mbibypass[26] ;
   assign       mbist_l2t1_n         = !mbibypass[27] ;
   assign       mbist_l2t2_n         = !mbibypass[28] ;
   assign       mbist_l2t3_n         = !mbibypass[29] ;
   assign       mbist_l2t4_n         = !mbibypass[30] ;
   assign       mbist_l2t5_n         = !mbibypass[31] ;
   assign       mbist_l2t6_n         = !mbibypass[32] ;
   assign       mbist_l2t7_n         = !mbibypass[33] ;
   assign       mbist_dmu_n          = !(&mbibypass[35:34]) ;
   assign       mbist_peu_n          = !mbibypass[36] ;
   assign       mbist_tds_tdmc_n     = !(&mbibypass[38:37]) ;
   assign       mbist_rtx_n          = !(&mbibypass[46:39]) ;
   assign       mbist_rdp_rdmc_n     = !mbibypass[47] ;

   assign soc_mbist_aclk = mbi_a_scan_en && clock_chop_aclk;
   assign soc_mbist_bclk = mbi_b_scan_en ? !clock_chop_bclk :
                                         (instr_mbist_diag && soclk_off);
   assign soc_mbist_scan_en = &mbibypass[7:0] && mbi_scan_en;

   assign soc0_mbist_clk_stop_din = instr_mbist_diag &
                                    (mbist_sii || mbist_sio || mbist_ncu);
   assign mcu0_mbist_clk_stop_din = instr_mbist_diag & mbist_mcu0;
   assign mcu1_mbist_clk_stop_din = instr_mbist_diag & mbist_mcu1;
   assign mcu2_mbist_clk_stop_din = instr_mbist_diag & mbist_mcu2;
   assign mcu3_mbist_clk_stop_din = instr_mbist_diag & mbist_mcu3;

   assign l2b0_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b0;
   assign l2b1_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b1;
   assign l2b2_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b2;
   assign l2b3_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b3;
   assign l2b4_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b4;
   assign l2b5_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b5;
   assign l2b6_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b6;
   assign l2b7_mbist_clk_stop_din = instr_mbist_diag & mbist_l2b7;

   assign l2t0_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t0;
   assign l2t1_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t1;
   assign l2t2_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t2;
   assign l2t3_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t3;
   assign l2t4_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t4;
   assign l2t5_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t5;
   assign l2t6_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t6;
   assign l2t7_mbist_clk_stop_din = instr_mbist_diag & mbist_l2t7;

   assign dmu_mbist_clk_stop_din = instr_mbist_diag & mbist_dmu;
   assign peu_mbist_clk_stop_din = instr_mbist_diag & mbist_peu;

   assign rdp_mbist_clk_stop_din = instr_mbist_diag & mbist_rdp_rdmc;
   assign rtx_mbist_clk_stop_din = instr_mbist_diag & mbist_rtx;
   assign tds_mbist_clk_stop_din = instr_mbist_diag & mbist_tds_tdmc;

   // TLR ECO:  remove tlr_state from the mbist_* signals at the bottom of mbist_scan_out
   assign mbist_scan_out = mbi_spc0       ? spc0_mb_scan_in :
                           mbi_spc1       ? spc1_mb_scan_in :
                           mbi_spc2       ? spc2_mb_scan_in :
                           mbi_spc3       ? spc3_mb_scan_in :
                           mbi_spc4       ? spc4_mb_scan_in :
                           mbi_spc5       ? spc5_mb_scan_in :
                           mbi_spc6       ? spc6_mb_scan_in :
                           mbi_spc7       ? spc7_mb_scan_in :
                           (instr_lbist_access && lbist_spc[0]) ? spc0_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[1]) ? spc1_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[2]) ? spc2_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[3]) ? spc3_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[4]) ? spc4_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[5]) ? spc5_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[6]) ? spc6_tcu_lbist_scan_out  :
                           (instr_lbist_access && lbist_spc[7]) ? spc7_tcu_lbist_scan_out  :
                           mbist_sii_n      ? sii_tcu_mbist_scan_out :
                           mbist_sio_n      ? sio_tcu_mbist_scan_out :
                           mbist_ncu_n      ? ncu_tcu_mbist_scan_out :
                           mbist_mcu0_n     ? mcu0_tcu_mbist_scan_out :
                           mbist_mcu1_n     ? mcu1_tcu_mbist_scan_out :
                           mbist_mcu2_n     ? mcu2_tcu_mbist_scan_out :
                           mbist_mcu3_n     ? mcu3_tcu_mbist_scan_out :
                           mbist_l2b0_n     ? l2b0_tcu_mbist_scan_out :
                           mbist_l2b1_n     ? l2b1_tcu_mbist_scan_out :
                           mbist_l2b2_n     ? l2b2_tcu_mbist_scan_out :
                           mbist_l2b3_n     ? l2b3_tcu_mbist_scan_out :
                           mbist_l2b4_n     ? l2b4_tcu_mbist_scan_out :
                           mbist_l2b5_n     ? l2b5_tcu_mbist_scan_out :
                           mbist_l2b6_n     ? l2b6_tcu_mbist_scan_out :
                           mbist_l2b7_n     ? l2b7_tcu_mbist_scan_out :
                           mbist_l2t0_n     ? l2t0_tcu_mbist_scan_out :
                           mbist_l2t1_n     ? l2t1_tcu_mbist_scan_out :
                           mbist_l2t2_n     ? l2t2_tcu_mbist_scan_out :
                           mbist_l2t3_n     ? l2t3_tcu_mbist_scan_out :
                           mbist_l2t4_n     ? l2t4_tcu_mbist_scan_out :
                           mbist_l2t5_n     ? l2t5_tcu_mbist_scan_out :
                           mbist_l2t6_n     ? l2t6_tcu_mbist_scan_out :
                           mbist_l2t7_n     ? l2t7_tcu_mbist_scan_out :
                           mbist_dmu_n      ? dmu_tcu_mbist_scan_out :
                           mbist_peu_n      ? peu_tcu_mbist_scan_out :
                           mbist_rdp_rdmc_n ? rdp_rdmc_mbist_scan_out :
                           mbist_rtx_n      ? rtx_mbist_scan_out :
                           mbist_tds_tdmc_n ? tds_mbist_scan_out :
                           1'b0;

   //============================================================
   // Output Flops
   // These signals go into a synchronizer in other modules
   // So they need to be coming straight out from a flop
   //============================================================
   assign jtag_output_flops_din[36:0] = {
                jtag_dmo_enable_din,
                jtag_mt_enable_din,
                jtag_por_enable_din,
                rdp_mbist_clk_stop_din, rtx_mbist_clk_stop_din, tds_mbist_clk_stop_din,
                peu_mbist_clk_stop_din,
                dmu_mbist_clk_stop_din,
                l2t7_mbist_clk_stop_din, l2t6_mbist_clk_stop_din,
                l2t5_mbist_clk_stop_din, l2t4_mbist_clk_stop_din,
                l2t3_mbist_clk_stop_din, l2t2_mbist_clk_stop_din,
                l2t1_mbist_clk_stop_din, l2t0_mbist_clk_stop_din,
                l2b7_mbist_clk_stop_din, l2b6_mbist_clk_stop_din,
                l2b5_mbist_clk_stop_din, l2b4_mbist_clk_stop_din,
                l2b3_mbist_clk_stop_din, l2b2_mbist_clk_stop_din,
                l2b1_mbist_clk_stop_din, l2b0_mbist_clk_stop_din,
                mcu3_mbist_clk_stop_din, mcu2_mbist_clk_stop_din,
                mcu1_mbist_clk_stop_din, mcu0_mbist_clk_stop_din,
                soc0_mbist_clk_stop_din,
                tap_spc7_mb_clk_stop_din, tap_spc6_mb_clk_stop_din,
                tap_spc5_mb_clk_stop_din, tap_spc4_mb_clk_stop_din,
                tap_spc3_mb_clk_stop_din, tap_spc2_mb_clk_stop_din,
                tap_spc1_mb_clk_stop_din, tap_spc0_mb_clk_stop_din};
                                   

   tcu_jtag_ctl_msff_ctl_macro__width_37 jtag_output_flops_reg  (
    .scan_in  ( jtag_output_flops_reg_scanin  ),
    .scan_out ( jtag_output_flops_reg_scanout ),
    .l1clk    ( l1tck                         ),
    .din      ( jtag_output_flops_din[36:0]   ),
    .dout     ( jtag_output_flops[36:0]       ),
  .siclk(siclk),
  .soclk(soclk));

   assign {
           //jtag_dmo_enable, // TLR ECO
			  //jtag_mt_enable, // TLR ECO
           //jtag_por_enable, // TLR ECO
           rdp_mbist_clk_stop, rtx_mbist_clk_stop, tds_mbist_clk_stop,
           peu_mbist_clk_stop,
           dmu_mbist_clk_stop,
           l2t7_mbist_clk_stop, l2t6_mbist_clk_stop,
           l2t5_mbist_clk_stop, l2t4_mbist_clk_stop,
           l2t3_mbist_clk_stop, l2t2_mbist_clk_stop,
           l2t1_mbist_clk_stop, l2t0_mbist_clk_stop,
           l2b7_mbist_clk_stop, l2b6_mbist_clk_stop,
           l2b5_mbist_clk_stop, l2b4_mbist_clk_stop,
           l2b3_mbist_clk_stop, l2b2_mbist_clk_stop,
           l2b1_mbist_clk_stop, l2b0_mbist_clk_stop,
           mcu3_mbist_clk_stop, mcu2_mbist_clk_stop,
           mcu1_mbist_clk_stop, mcu0_mbist_clk_stop,
           soc0_mbist_clk_stop,
           tap_spc7_mb_clk_stop, tap_spc6_mb_clk_stop,
           tap_spc5_mb_clk_stop, tap_spc4_mb_clk_stop,
           tap_spc3_mb_clk_stop, tap_spc2_mb_clk_stop,
         //tap_spc1_mb_clk_stop, tap_spc0_mb_clk_stop} = tlr_state ? 37'h0 : jtag_output_flops[36:0];
           //tap_spc1_mb_clk_stop, tap_spc0_mb_clk_stop} = tstmode_not_tlr ? jtag_output_flops[36:0] : 37'h0; // TLR ECO
           tap_spc1_mb_clk_stop, tap_spc0_mb_clk_stop} = tstmode_not_tlr ? jtag_output_flops[33:0] : 34'h0; // TLR ECO

   assign jtag_dmo_enable  = jtag_output_flops[36]; // TLR ECO
   assign jtag_mt_enable   = jtag_output_flops[35]; // TLR ECO
   assign jtag_por_enable  = jtag_output_flops[34]; // TLR ECO
                                   
   assign       tstmode_not_tlr   =  pin_scanmode  | ~tlr_state;

   //==============================================================================
	// 
	// Added on 20050328
	// Added LBIST Registers
   //==============================================================================
	//==============================================================================
	// LBIST Bypass Shift Registers
	// 8-bit shifting register to hold the value shifted in during Shift-DR
	// 1 means bypass
	// Default to 0 (NOT Bypass)
	//==============================================================================
   
   tcu_jtag_ctl_msff_ctl_macro__width_8 tap_lbist_bypass_shift_reg 
   (
    .scan_in  ( tap_lbist_bypass_shift_reg_scanin           ),
    .scan_out ( tap_lbist_bypass_shift_reg_scanout          ),
    .l1clk    ( l1tck                                       ),
    .din      ( next_new_lbist_bypass[`NUM_TOTAL_LBIST-1:0] ),
    .dout     ( new_lbist_bypass[`NUM_TOTAL_LBIST-1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign next_new_lbist_bypass = (instr_lbist_bypass & shift_dr_state) ? {io_tdi, new_lbist_bypass[`NUM_TOTAL_LBIST-1:1]} 
                                : (instr_lbist_bypass & capture_dr_state) ? lbist_bypass 
                                : new_lbist_bypass;

	//==============================================================================
	// LBIST Bypass Update Registers
	// This Update Register gets the value of the shift register during Update-DR
	//==============================================================================
   tcu_jtag_ctl_msff_ctl_macro__width_8 tap_lbist_bypass_upd_reg 
   (
    .scan_in  ( tap_lbist_bypass_upd_reg_scanin          ),
    .scan_out ( tap_lbist_bypass_upd_reg_scanout         ),
    .l1clk    ( l1tck                                    ), // tck_l
    .din      ( next_lbist_bypass[`NUM_TOTAL_LBIST-1:0]  ),
    .dout     ( lbist_bypass_q[`NUM_TOTAL_LBIST-1:0]     ),
  .siclk(siclk),
  .soclk(soclk));

   assign next_lbist_bypass = (instr_lbist_bypass & update_dr_state) ?
	                              new_lbist_bypass :
										  ucb_wr_lbist_bypass ? ucb_data_out[7:0] :
							   			tlr_state ? {`NUM_TOTAL_LBIST{1'b0}} : lbist_bypass;
   assign lbist_bypass[`NUM_TOTAL_LBIST-1:0] = lbist_bypass_q[`NUM_TOTAL_LBIST-1:0] & {`NUM_TOTAL_LBIST{~tlr_state}};
	//==============================================================================
	// LBIST Mode Register
	//==============================================================================
   //  - no capture, only shift (contents gated by mbist_start); needs trst_l
   // dual bits to store diag/serial bits until cleared by TAP_MBIST_ABORT/TLR
   tcu_jtag_ctl_msff_ctl_macro__width_2 tap_lbist_mode_reg 
   (
    .scan_in  ( tap_lbist_mode_reg_scanin  ),
    .scan_out ( tap_lbist_mode_reg_scanout ),
    .l1clk    ( l1tck                      ),
    .din      ( next_lbist_mode[1:0]       ),
    .dout     ( lbist_mode[1:0]            ),
  .siclk(siclk),
  .soclk(soclk));

   assign next_lbist_mode[1:0] = (instr_lbist_mode & shift_dr_state) ?
                                    {io_tdi, lbist_mode[1]} :
											   ucb_wr_lbist_mode ? ucb_data_out[1:0] : 
											   (instr_lbist_abort | tlr_state) ?
                                       2'b00 :
                                       lbist_mode;

   assign tcu_spc_lbist_pgm = lbist_mode[1] & ~tlr_state;

	//==============================================================================
	// LBIST Done Register
	//==============================================================================
   // No update, capture/shift only
   // If MBIST GETDONE instruction active, captures 66 done status bits from the mbist engines
   // If MBIST GETFAIL instruction active, captures 66 fail status bits from the mbist engines
   //  - this register is shared by the TAP_MBIST_GETDONE and TAP_MBIST_GETFAIL instructions
   //  - capture into shift reg only for getdone/getfail
   //  does not need trst_l

   tcu_jtag_ctl_msff_ctl_macro__width_8 tap_lbist_done_reg 
   (
    .scan_in  ( tap_lbist_done_reg_scanin             ),
    .scan_out ( tap_lbist_done_reg_scanout            ),
    .l1clk    ( l1tck                                 ),
    .din      ( next_lbist_done[`NUM_TOTAL_LBIST-1:0] ),
    .dout     ( lbist_done[`NUM_TOTAL_LBIST-1:0]      ),
  .siclk(siclk),
  .soclk(soclk));

   assign next_lbist_done = (instr_lbist_getdone & shift_dr_state) ?
	                             {io_tdi, lbist_done[`NUM_TOTAL_LBIST-1:1]} :
                                   (instr_lbist_getdone & capture_dr_state) ?
                                      lb_tcu_done_d :
												  lbist_done;

	//==============================================================================
	// LBIST Start Signal
	//==============================================================================
   // single bit to store start signal until cleared by TAP_MBIST_ABORT/TLR
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_lbist_start_reg 
   (
    .scan_in  ( tap_lbist_start_reg_scanin  ),
    .scan_out ( tap_lbist_start_reg_scanout ),
    .l1clk    ( l1tck                       ),
    .din      ( next_lbist_start            ),
    .dout     ( lbist_start_q               ),
  .siclk(siclk),
  .soclk(soclk));
   assign lbist_start  =  lbist_start_q  &  ~tlr_state;
   assign next_lbist_start = (instr_lbist_start & rti_state) ?
                               1'b1 :
										 (instr_lbist_abort | tlr_state) ?
										    1'b0 :
											 lbist_start;

	//==============================================================================
	// LBIST Access Scanning
	//==============================================================================
   assign 	lbist_shiftdr = instr_lbist_access & shift_dr_state;

   tcu_jtag_ctl_msff_ctl_macro__width_1 lbist_ascan_en_reg 
   (
    .scan_in  (tap_lbist_a_scan_en_reg_scanin),
    .scan_out (tap_lbist_a_scan_en_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (lbist_shiftdr), 
    .dout     (lbist_a_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );  
   assign     lbist_a_scan_en = lbist_a_scan_en_q & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 lbist_bscan_en_reg  
   (
    .scan_in  (tap_lbist_b_scan_en_reg_scanin),
    .scan_out (tap_lbist_b_scan_en_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (lbist_shiftdr), 
    .dout     (lbist_b_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign     lbist_b_scan_en = lbist_b_scan_en_q & ~tlr_state;

   assign lbist_scan_en_8[`NUM_TOTAL_LBIST-1:0]      = {`NUM_TOTAL_LBIST{(lbist_a_scan_en | lbist_b_scan_en)}};

   assign lbist_a_scan_en_8[`NUM_TOTAL_LBIST-1:0]    = {`NUM_TOTAL_LBIST{lbist_a_scan_en}};
   assign lbist_b_scan_en_8[`NUM_TOTAL_LBIST-1:0]    = {`NUM_TOTAL_LBIST{lbist_b_scan_en}};
   assign lbist_b_scan_en_q_8[`NUM_TOTAL_LBIST-1:0]    = {`NUM_TOTAL_LBIST{lbist_b_scan_en_q}}; // TLR ECO
   assign clock_chop_aclk_8[`NUM_TOTAL_LBIST-1:0]    = {`NUM_TOTAL_LBIST{clock_chop_aclk}};
   assign clock_chop_bclk_8[`NUM_TOTAL_LBIST-1:0]    = {`NUM_TOTAL_LBIST{clock_chop_bclk}};
   assign soclk_off_8[`NUM_TOTAL_LBIST-1:0]          = {`NUM_TOTAL_LBIST{soclk_off}};
   assign instr_lbist_access_8[`NUM_TOTAL_LBIST-1:0] = {`NUM_TOTAL_LBIST{instr_lbist_access}};

   assign lbist_spc[`NUM_TOTAL_LBIST-1:0]       = ~lbist_bypass;
   assign spc_lb_aclk[`NUM_TOTAL_LBIST-1:0]     = lbist_spc & lbist_a_scan_en_8 & clock_chop_aclk_8;
   // TLR ECO
   //assign spc_lb_bclk[`NUM_TOTAL_LBIST-1:0]     = lbist_spc &
   //                                               ((lbist_b_scan_en_8 & clock_chop_bclk_8) |
   //                                               (~lbist_b_scan_en_8 & instr_lbist_access_8 & soclk_off_8));
   assign spc_lb_bclk[`NUM_TOTAL_LBIST-1:0]     = lbist_spc &
                                                  ((lbist_b_scan_en_8 & clock_chop_bclk_8) |
                                                  (~lbist_b_scan_en_q_8 & instr_lbist_access_8 & soclk_off_8));
   assign spc_lb_scan_en[`NUM_TOTAL_LBIST-1:0]  = lbist_spc & lbist_scan_en_8;
   assign spc_lb_clk_stop[`NUM_TOTAL_LBIST-1:0] = lbist_spc & instr_lbist_access_8;

   
   //********************************************************************
   // CREG Logic: based on Niagara logic
   //********************************************************************
 
   //********************************************************************
   // - generate enables to creg block
   //********************************************************************
   assign 	next_jtag_creg_addr_en = update_dr_state & creg_addr_instr;
   
   assign 	next_jtag_creg_wr_en   = instr_ncu_wr
                                       | (update_dr_state & ( instr_ncu_wdata | instr_ncu_waddr));
   
   assign 	next_jtag_creg_rd_en   = instr_ncu_rd | (update_dr_state & instr_ncu_raddr);
   
   assign 	next_jtag_creg_data_en = update_dr_state & creg_wdata_instr;

   //********************************************************************
   // CREG Address 
   //********************************************************************
   // Shift register only, no capture
   // Update register is in tcu_ucb_ctl block in TCU
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_40 tap_cregaddr_shift_reg 
   (
    .scan_in  (tap_cregaddr_shift_reg_scanin),
    .scan_out (tap_cregaddr_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_creg_addr[39:0]),
    .dout     (creg_addr[39:0]),
  .siclk(siclk),
  .soclk(soclk)
   );

   assign 	creg_addr_instr = instr_creg_addr
	   	                | instr_ncu_waddr
			        | instr_ncu_raddr;

   // TLR ECO
   //assign 	next_creg_addr[39:0] = tlr_state ? 40'h0 : (creg_addr_instr & shift_dr_state) ? {io_tdi, creg_addr[39:1]}
   //				     : creg_addr[39:0];
   assign       next_creg_addr[39:0] = ({40{(creg_addr_instr & shift_dr_state)}} & {io_tdi, creg_addr[39:1]}) |
                                         ({40{(~tlr_state & ~(creg_addr_instr & shift_dr_state))}} & creg_addr[39:0]);

   assign 	jtag_creg_addr = creg_addr[39:0];

   //********************************************************************
   // CREG Write Data	
   //********************************************************************
   // Shift register only, no capture
   // Update register is in tcu_ucb_ctl block in TCU
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_64 tap_cregwdata_shift_reg 
   (
    .scan_in  (tap_cregwdata_reg_scanin),
    .scan_out (tap_cregwdata_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_creg_wdata[63:0]),
    .dout     (creg_wdata[63:0]),
  .siclk(siclk),
  .soclk(soclk)
    );
   
   assign 	creg_wdata_instr = instr_creg_wdata | instr_ncu_wdata;

   // TLR ECO
   //assign 	next_creg_wdata[63:0] = tlr_state ? 64'h0 : (creg_wdata_instr & shift_dr_state) ? {io_tdi, creg_wdata[63:1]}
   //				      : creg_wdata[63:0];
   assign       next_creg_wdata[63:0] = ({64{(creg_wdata_instr & shift_dr_state)}} & {io_tdi, creg_wdata[63:1]}) |
					  ({64{~(creg_wdata_instr & shift_dr_state) & ~tlr_state}} & creg_wdata[63:0]);


   assign 	jtag_creg_data = creg_wdata[63:0];

   //********************************************************************
   // CREG Read Return
   //********************************************************************
   // Shift register, with capture - data comes from tcu_ucb_ctl block in TCU
   // Handshake with creg
   //   - load_l is generated on rising edge on ucb_jtag_data_rdy
   //   - load delayed by one provides the output handshake to ctu_creg

   // capture condition
   assign 	creg_rdrtrn_load = ucb_jtag_data_rdy_sync & ~ucb_jtag_data_rdy_d2;

   assign 	jtag_ucb_data_ack =  creg_rdrtrn_load_d1 & ~tlr_state;

   // shift condition: start shifting out read data once it is valid
   assign 	creg_rdrtrn_shift = instr_creg_rdata & shift_dr_state & creg_rdrtrn_vld;
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_65 tap_cregrdrtrn_shift_reg 
   (
    .scan_in  (tap_cregrdrtrn_reg_scanin),
    .scan_out (tap_cregrdrtrn_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_creg_rdrtrn[64:0]),
    .dout     (creg_rdrtrn[64:0]),
  .siclk(siclk),
  .soclk(soclk)
    );

   // TLR ECO
   //assign 	next_creg_rdrtrn[64:0] = tlr_state ? 65'h0 : creg_rdrtrn_shift ? {io_tdi, creg_rdrtrn[64:1]}
   //                              : creg_rdrtrn_load  ? {ucb_data_out[63:0], 1'b1}
   //                              : creg_rdrtrn[64:0];

   assign       next_creg_rdrtrn[64:0] = ({65{creg_rdrtrn_shift}} & {io_tdi, creg_rdrtrn[64:1]}) |
					 ({65{~creg_rdrtrn_shift & creg_rdrtrn_load & ~tlr_state}} & {ucb_data_out[63:0], 1'b1}) |
					 ({65{~creg_rdrtrn_shift & ~creg_rdrtrn_load & ~tlr_state}} & creg_rdrtrn[64:0]);


   // set when load data into read-return_reg
   assign 	clear_creg_rdrtrn_vld = (instr_ncu_rd	  & ~instr_ncu_rd_d1)
                                      | (instr_ncu_raddr & ~instr_ncu_raddr_d1);
   assign 	next_creg_rdrtrn_vld = tlr_state ? 1'b0 :
                                               (creg_rdrtrn_load | (creg_rdrtrn_vld & ~clear_creg_rdrtrn_vld));

   assign 	creg_rdrtrn_out = creg_rdrtrn[0] & creg_rdrtrn_vld;

   //********************************************************************
   // Scratch Register
   //********************************************************************
   // Shift register, with capture - data comes from tcu_ucb_ctl block in TCU

   // this is the SHIFT register
   //msff_ctl_macro tap_cregscratch_reg (width=64)
   //(
    //.scan_in  (tap_cregscratch_reg_scanin),
    //.scan_out (tap_cregscratch_reg_scanout),
    //.l1clk    (l1tck),
    //.din      (next_creg_scratch[63:0]),
    //.dout     (creg_scratch[63:0])
    //);
   
   //assign 	next_creg_scratch[63:0] = (instr_creg_scratch & shift_dr_state) ? {io_tdi, creg_scratch[63:1]}
                                        //: (instr_creg_scratch & capture_dr_state) ? {creg_jtag_scratch_data}
                                        //: creg_scratch[63:0];

   //********************************************************************
   // Flops for Various CREG Support Signals 
   //********************************************************************
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_addr_en_reg 
   (
    .scan_in  (tap_cregaddren_reg_scanin),
    .scan_out (tap_cregaddren_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtag_creg_addr_en),
    .dout     (jtag_creg_addr_en_q),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign 	jtag_creg_addr_en  = jtag_creg_addr_en_q; // TLR ECO //  & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_wr_en_reg 
   (
    .scan_in  (tap_cregwren_reg_scanin),
    .scan_out (tap_cregwren_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtag_creg_wr_en),
    .dout     (jtag_creg_wr_en_q),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign 	jtag_creg_wr_en  = jtag_creg_wr_en_q; // TLR ECO //  & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_rd_en_reg 
   (
    .scan_in  (tap_cregrden_reg_scanin),
    .scan_out (tap_cregrden_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtag_creg_rd_en),
    .dout     (jtag_creg_rd_en_q),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign 	jtag_creg_rd_en  = jtag_creg_rd_en_q; // TLR ECO //  & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_data_en_reg 
   (
    .scan_in  (tap_cregdataen_reg_scanin),
    .scan_out (tap_cregdataen_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtag_creg_data_en),
    .dout     (jtag_creg_data_en_q),
  .siclk(siclk),
  .soclk(soclk)
    );
   assign 	jtag_creg_data_en  = jtag_creg_data_en_q; // TLR ECO //  & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_rdrtrn_vld_reg 
   (
    .scan_in  (tap_cregrdrtrnvld_reg_scanin),
    .scan_out (tap_cregrdrtrnvld_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_creg_rdrtrn_vld),
    .dout     (creg_rdrtrn_vld),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_ucb_jtag_data_rdy_d_reg 
   (
    .scan_in  (tap_ucb_jtag_data_rdy_d_reg_scanin),
    .scan_out (tap_ucb_jtag_data_rdy_d_reg_scanout),
    .l1clk    (l1tck),
    .din      (ucb_jtag_data_rdy_sync),
    .dout     (ucb_jtag_data_rdy_d),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_ucb_jtag_data_rdy_d2_reg 
   (
    .scan_in  (tap_ucb_jtag_data_rdy_d2_reg_scanin),
    .scan_out (tap_ucb_jtag_data_rdy_d2_reg_scanout),
    .l1clk    (l1tck),
    .din      (ucb_jtag_data_rdy_d),
    .dout     (ucb_jtag_data_rdy_d2),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_creg_rdrtrn_load_reg 
   (
    .scan_in  (tap_cregrdrtrnload_reg_scanin),
    .scan_out (tap_cregrdrtrnload_reg_scanout),
    .l1clk    (l1tck),
    .din      (creg_rdrtrn_load),
    .dout     (creg_rdrtrn_load_d1),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_ncu_rd_reg 
   (
    .scan_in  (tap_ncurd_reg_scanin),
    .scan_out (tap_ncurd_reg_scanout),
    .l1clk    (l1tck),
    .din      (instr_ncu_rd),
    .dout     (instr_ncu_rd_d1),
  .siclk(siclk),
  .soclk(soclk)
    );
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_ncu_raddr_reg 
   (
    .scan_in  (tap_ncuraddr_reg_scanin),
    .scan_out (tap_ncuraddr_reg_scanout),
    .l1clk    (l1tck),
    .din      (instr_ncu_raddr),
    .dout     (instr_ncu_raddr_d1),
  .siclk(siclk),
  .soclk(soclk)
    );

   //********************************************************************
   // Core Shadow Scan Logic: SHSCAN
   //********************************************************************
   // This places the core shadow scan chains between TDI & TDO
   // It is for shifting only, no need to capture or update since we use clock_stop
   //  to the header to control activity.
   // To use: 1. program tap_spcthrx_shscan with x=thread id to capture in all cores
   // 2. shift data out TDO; unavailable cores will be skipped
   // The logic below first stops the clock to the core shadow scans
   //  then it puts soclk "high" to turn off slave (assumes clock stops low)
   //  then it activates scan_en (shiftDR)
   //  then it sends siclk & soclk via chopped TCK to the core shadow scans
   // Scan is destructive; to program the core shadow scans you must scan in valid data, then
   //  reverse the above: put soclk "high", turn off scan_en, then turn off stop

   // To control timing and put distance between clk_stop changing and shscan_bclk changing,
   //  restrict sequence through tap states to 6-2-1-3-0-5; i.e., make transition directly from 
   //  state 1 (exit1DR) to state 5 (updDR) illegal; this allows shscan_bclk to be turned off
   //  in state 0(ex2dr) and still separates it from clk_stop changing in state 5
   //  - this only applies to shadow scan operations; mbist is not affected. This is needed to
   //    allow shadow scan to cycle through capDR/ShiftDR repeatedly, so we need clk_stop off
   //    during capDR to allow the capture to occur. Since state 7 always occurs before state 6,
   //    we use state 7 as the last time clk_stop is off before clk_stop is activated in state 6,
   //    so capture actually occurs as clk_stop is activated entering state 6.

   // General Core Shadow Scan logic
   assign 	spcshscan_shiftdr = instr_spc_shscan & shift_dr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 spcshscan_ascan_en_reg 
   (
    .scan_in  (spcshscan_a_scan_en_reg_scanin),
    .scan_out (spcshscan_a_scan_en_reg_scanout_unused),
    .l1clk    (tck_l),			       
    .din      (spcshscan_shiftdr), 
    .dout     (spcshscan_a_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );  
   assign     spcshscan_a_scan_en = spcshscan_a_scan_en_q & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 spcshscan_bscan_en_reg  
   (
    .scan_in  (spcshscan_b_scan_en_reg_scanin),
    .scan_out (spcshscan_b_scan_en_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (spcshscan_shiftdr), 
    .dout     (spcshscan_b_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign     spcshscan_b_scan_en = spcshscan_b_scan_en_q & ~tlr_state;
   assign 	spcshscan_scan_en = spcshscan_a_scan_en | spcshscan_b_scan_en;

   //assign 	mbi_spc0 = ~(&mbibypass[2:0]);   // |mbibypass[2:0];
   assign 	spc_shscan_aclk     = (instr_spc_shscan & spcshscan_a_scan_en) ?  clock_chop_aclk : 1'b0;
   // TLR ECO
   //assign 	spc_shscan_bclk     = (instr_spc_shscan & spcshscan_b_scan_en) ? ~clock_chop_bclk
   //		                      : (instr_spc_shscan & soclk_off & ~ex2_dr_state & ~update_dr_state) ? 1'b1
   //                                 : 1'b0;
   assign       spc_shscan_bclk     = (instr_spc_shscan & spcshscan_b_scan_en & ~clock_chop_bclk) |
                                      (~spcshscan_b_scan_en_q & instr_spc_shscan & soclk_off & ~ex2_dr_state & ~update_dr_state);

   //assign 	spc_shscan_pce_ov   = instr_spc_shscan & capture_dr_state;
   //assign 	spc_shscan_clk_stop = instr_spc_shscan;
   assign 	spc_shscan_pce_ov   = instr_spc_shscan; // & capture_dr_state;
   assign 	spc_shscan_clk_stop = instr_spc_shscan & (capture_dr_state | shift_dr_state
                                      | ex1_dr_state | pause_dr_state | ex2_dr_state
                                      | update_dr_state);

   assign 	tcu_spc_shscan_aclk        = pin_scanmode ? siclk : (flush | spc_shscan_aclk | jt_scan_aclk);
   assign 	tcu_spc_shscan_bclk        = pin_scanmode ? soclk : (spc_shscan_bclk | jt_scan_bclk);
   assign 	jtag_spc_shscan_pce_ov     = pin_scanmode ? 1'b0  : spc_shscan_pce_ov;
   assign 	tcu_spc_shscan_clk_stop_ps = pin_scanmode ? 1'b0  : spc_shscan_clk_stop;
   assign 	tcu_spc_shscan_scan_en     = pin_scanmode ? pin_scan_en : (flush_dly | spcshscan_scan_en | jt_scan_en);
   assign 	jtag_spc_shscanid[2:0]     = {3{instr_spc_shscan}} & instr[2:0];

   assign 	jtag_spc0_shscan_clk_stop = (spc0_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc1_shscan_clk_stop = (spc1_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc2_shscan_clk_stop = (spc2_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc3_shscan_clk_stop = (spc3_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc4_shscan_clk_stop = (spc4_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc5_shscan_clk_stop = (spc5_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc6_shscan_clk_stop = (spc6_clk_stop | tcu_spc_shscan_clk_stop_ps);
   assign 	jtag_spc7_shscan_clk_stop = (spc7_clk_stop | tcu_spc_shscan_clk_stop_ps);

	//================================================================================
	// 
	// Added on 20041119
	// Added L2T Shadow Scan Signals
	//================================================================================
   // General Core Shadow Scan logic
   assign 	l2tshscan_shiftdr = instr_l2t_shscan & shift_dr_state;

   tcu_jtag_ctl_msff_ctl_macro__width_1 l2tshscan_ascan_en_reg 
   (
    .scan_in  (l2tshscan_a_scan_en_reg_scanin),
    .scan_out (l2tshscan_a_scan_en_reg_scanout_unused),		// Floating
    .l1clk    (tck_l),			       
    .din      (l2tshscan_shiftdr), 
    .dout     (l2tshscan_a_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );  
   assign     l2tshscan_a_scan_en = l2tshscan_a_scan_en_q & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 l2tshscan_bscan_en_reg  
   (
    .scan_in  (l2tshscan_b_scan_en_reg_scanin),
    .scan_out (l2tshscan_b_scan_en_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (l2tshscan_shiftdr), 
    .dout     (l2tshscan_b_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)       
   );
   assign     l2tshscan_b_scan_en = l2tshscan_b_scan_en_q & ~tlr_state;

   assign 	l2tshscan_scan_en = l2tshscan_a_scan_en | l2tshscan_b_scan_en;

   assign 	l2t_shscan_aclk     = (instr_l2t_shscan & l2tshscan_a_scan_en) ?  clock_chop_aclk : 1'b0;
   // TLR ECO
   //assign 	l2t_shscan_bclk     = (instr_l2t_shscan & l2tshscan_b_scan_en) ? ~clock_chop_bclk
   //		                      : (instr_l2t_shscan & soclk_off & ~ex2_dr_state & ~update_dr_state) ? 1'b1
   //                                 : 1'b0;
   assign       l2t_shscan_bclk     = (instr_l2t_shscan & l2tshscan_b_scan_en & ~clock_chop_bclk) |
                                      (~l2tshscan_b_scan_en_q & instr_l2t_shscan & soclk_off & ~ex2_dr_state & ~update_dr_state);
   assign 	l2t_shscan_pce_ov   = instr_l2t_shscan; // & capture_dr_state;
   assign 	l2t_shscan_clk_stop = instr_l2t_shscan & (capture_dr_state | shift_dr_state
                                      | ex1_dr_state | pause_dr_state | ex2_dr_state
                                      | update_dr_state);

   assign 	tcu_l2t_shscan_aclk        = pin_scanmode ? siclk : (flush | l2t_shscan_aclk | jt_scan_aclk);
   assign 	tcu_l2t_shscan_bclk        = pin_scanmode ? soclk : (l2t_shscan_bclk | jt_scan_bclk);
   assign 	jtag_l2t_shscan_pce_ov   = pin_scanmode ? 1'b0  : l2t_shscan_pce_ov;
   assign 	tcu_l2t_shscan_clk_stop_ps = pin_scanmode ? 1'b0  : l2t_shscan_clk_stop;
   assign 	tcu_l2t_shscan_scan_en     = pin_scanmode ? pin_scan_en : (flush_dly | l2tshscan_scan_en | jt_scan_en);

   assign 	jtag_l2t0_shscan_clk_stop = (l2t0_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t1_shscan_clk_stop = (l2t1_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t2_shscan_clk_stop = (l2t2_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t3_shscan_clk_stop = (l2t3_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t4_shscan_clk_stop = (l2t4_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t5_shscan_clk_stop = (l2t5_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t6_shscan_clk_stop = (l2t6_clk_stop | tcu_l2t_shscan_clk_stop_ps);
   assign 	jtag_l2t7_shscan_clk_stop = (l2t7_clk_stop | tcu_l2t_shscan_clk_stop_ps);


   // Send TDI to each core shadow scan via tcu_sigmux_ctl
   assign 	tap_spc0_shscan_scan_out = io_tdi;
   // Receive spc7 shscan scan out, to TDO 
   assign 	spcshscan_scan_out  = instr_spc_shscan ? spc7_tap_shscan_scan_in : 1'b0;

   assign 	l2tshscan_scan_out  = instr_l2t_shscan ? l2t7_tcu_shscan_scan_out : 1'b0;


   //********************************************************************
   // Clock Stop - Supports Scan Dump, Debug
   //********************************************************************
   //  - no shift or update regs involved
   // Flop set with TAP_CLOCK_HSTOP or _SSTOP, reset with TAP_CLOCK_START
   tcu_jtag_ctl_msff_ctl_macro__clr_1__width_1 tap_jtagclkstop_reg 
   (
    .scan_in(tap_jtagclkstop_reg_scanin),
    .scan_out(tap_jtagclkstop_reg_scanout),
    .l1clk	(l1tck),
    .clr        (clear_jtag_clk_stop),
    .din	(next_jtag_clk_stop),
    .dout	(jtag_clk_stop),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	clear_jtag_clk_stop = instr_clock_start | tlr_state;
   assign 	sstop_ready         = |spc_ss_sel[7:0];
   assign 	next_jtag_clk_stop  = (instr_clock_hstop | (instr_clock_sstop & sstop_ready)) ? 1'b1
		                    : jtag_clk_stop;
   assign 	jtag_clk_stop_req   = jtag_clk_stop ; // TLR ECO //& ~tlr_state;
   // jtagclkstop_ov comes from cycle-step debug logic and turns off jtag_clk_stop while in 
   //  cycle step mode and cycle counter is running
   //assign       instr_sstop_csmode = !tlr_state && (instr_clock_sstop | instr_cs_mode); // TLR ECO
   assign       instr_sstop_csmode_din = (instr_clock_sstop | instr_cs_mode); // TLR ECO

   // Use this to turn on clocks while stopped during a debug event
   // It should turn off the debug event that is active, thus restarting clocks
   assign       jtag_clock_start    = instr_clock_start; //  &  rti_state;

   //********************************************************************
   // GENERIC 32-bit Shift Register: Gate the output at the Update Register
   //********************************************************************
   // This is a generic 32-bit register
   // Capture into shift reg enabled
   // Used for Clock Domain; Debug Event Counter

   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_32 tap_gen32_shift_reg 
   (
    .scan_in  (tap_gen32_shift_reg_scanin),
    .scan_out (tap_gen32_shift_reg_scanout),
    .l1clk    (l1tck),
    .din	(next_new_gen32[31:0]),
    .dout	(new_gen32[31:0]),
  .siclk(siclk),
  .soclk(soclk)
   );

   // TLR ECO
   //assign 	next_new_gen32[31:0] = tlr_state ? 32'h0 : (instr_gen32 & shift_dr_state) ? {io_tdi, new_gen32[31:1]}
   //                                   : (instr_clock_domain & capture_dr_state) ? {8'b0,debug_reg_hs_domain[23:0]}
   //                                   : (instr_de_count     & capture_dr_state) ? {de_count[31:0]}
   //                                   : new_gen32[31:0];
   assign 	next_new_gen32[31:0] = ({32{(instr_gen32 & shift_dr_state)}} & {io_tdi, new_gen32[31:1]}) |
				       ({32{(instr_clock_domain & capture_dr_state)}} & {8'b0,debug_reg_hs_domain[23:0]}) |
			    	       ({32{(~instr_clock_domain & instr_de_count     & capture_dr_state)}} & {de_count[31:0]}) |
                                       ({32{~(instr_gen32 & shift_dr_state) & ~(instr_clock_domain & capture_dr_state) & 
                                         ~(~instr_clock_domain & instr_de_count & capture_dr_state) & ~tlr_state}}  & new_gen32[31:0]);

   assign        instr_gen32        = instr_clock_domain | instr_de_count;
   // TAP_CLOCK_DOMAIN: 24-bit reg to control starting point for clock stop/start
   assign        debug_reg_hs_domain[23:0] = debug_reg_hard_stop_domain_1st[23:0]; // input from regs_ctl
   assign        clock_domain[23:0] = new_gen32[23:0]; // output to regs_ctl
   assign        clock_domain_upd   = instr_clock_domain & update_dr_state; // output to regs_ctl
   // DEBUG_EVENT CNTR: 32-bit reg for counting debug event occurrences
   assign        decnt_data[31:0]   = new_gen32[31:0]; // output to regs_ctl
   assign        decnt_upd          = instr_de_count     & update_dr_state; // output to regs_ctl

   //********************************************************************
   // GENERIC 64-bit Shift Register: Gate the output at the Update Register
   //********************************************************************
   // This is a generic 64-bit register
   // Capture into shift reg enabled
   // Used for Cycle Counter; Core Run Status; DOSS Enable

   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_64 tap_gen64_shift_reg 
   (
    .scan_in  (tap_gen64_shift_reg_scanin),
    .scan_out (tap_gen64_shift_reg_scanout),
    .l1clk    (l1tck),
    .din	(next_new_gen64[63:0]),
    .dout	(new_gen64[63:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_new_gen64[63:0] = tlr_state ? 64'h0 : (instr_gen64 & shift_dr_state) ? {io_tdi, new_gen64[63:1]}
   //                                   : (instr_cycle_count    & capture_dr_state) ? {cycle_count[63:0]}
   //                                   : (instr_core_run_stat  & capture_dr_state) ? {spc_crs[63:0]}
   //	 	                      : (instr_doss_enable    & capture_dr_state) ? doss_enab[63:0]
   //                                   : new_gen64[63:0];

   assign 	 next_new_gen64[63:0] = ({64{(instr_gen64 & shift_dr_state)}} & {io_tdi, new_gen64[63:1]}) |
					({64{(instr_cycle_count & capture_dr_state)}} &  {cycle_count[63:0]}) |
					({64{(~instr_cycle_count & instr_core_run_stat  & capture_dr_state)}} & {spc_crs[63:0]}) |
                                        ({64{(~instr_cycle_count & ~instr_core_run_stat & instr_doss_enable & capture_dr_state)}} & doss_enab[63:0]) |
                                        ({64{~(instr_gen64 & shift_dr_state) &
                                             ~(instr_cycle_count & capture_dr_state)  &
                                             ~(~instr_cycle_count & instr_core_run_stat  & capture_dr_state) &
                                             ~(~instr_cycle_count & ~instr_core_run_stat & instr_doss_enable & capture_dr_state) &
                                             ~tlr_state}} & new_gen64[63:0]);

   assign        instr_gen64        = instr_cycle_count  | instr_core_run_stat   | instr_doss_enable;
   // TAP_CYCLE_COUNT: 64-bit reg for counting cmp clock cycles for debug events
   assign        cyc_count[63:0]    = new_gen64[63:0];                      // output to regs_ctl
   assign        cyc_count_upd      = instr_cycle_count  & update_dr_state; // output to regs_ctl
   // CORE_RUN_STATUS: 64-bit reg - Read Only - gets core run status from cores via regs_ctl
   // DOSS_ENABLE: 64-bit reg for Disable Overlap or Single Step Enabling
   assign 	 dossen             = new_gen64[63:0];                      // output to regs_ctl
   assign        dossen_upd         = instr_doss_enable  & update_dr_state; // output to regs_ctl

   //********************************************************************
   // JTAG Serial Scan Logic
   //********************************************************************
   // This places all 32 scan chains between TDI & TDO
   // It is for shifting only, no need to capture or update since we use clock_stop
   //  to the header to control activity.
   // To use: 1. stop the clocks with TAP_CLOCK_HSTOP or TAP_CLOCK_SSTOP
   // 2. unload: shift data out TDO; unavailable cores will be skipped
   // 3. re-start clocks with TAP_CLOCK_START
   // The logic below first puts bclk (soclk) "high" to turn off slave (assumes clock stops low)
   //  then it activates scan_en (shiftDR)
   //  then it sends aclk(siclk) & bclk(soclk) via chopped TCK to the 32 scan chains
   // Scan is destructive; you must reload with desired data after unloading

   // General JTAG Serial Scan logic
   assign	serscan_shiftdr = jtag_ser_scan & shift_dr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 serscan_ascan_en_reg 
   (
    .scan_in  (serscan_a_scan_en_reg_scanin),
    .scan_out (serscan_a_scan_en_reg_scanout_unused),
    .l1clk    (tck_l),
    .din	(serscan_shiftdr),
    .dout	(serscan_a_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign     serscan_a_scan_en = serscan_a_scan_en_q & ~tlr_state;
   tcu_jtag_ctl_msff_ctl_macro__width_1 serscan_bscan_en_reg 
   (
    .scan_in  (serscan_b_scan_en_reg_scanin),
    .scan_out (serscan_b_scan_en_reg_scanout),
    .l1clk    (l1tck),
    .din	(serscan_shiftdr),
    .dout	(serscan_b_scan_en_q),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign     serscan_b_scan_en = serscan_b_scan_en_q & ~tlr_state;
   assign	jt_scan_en          =  serscan_a_scan_en | serscan_b_scan_en;

   assign	jt_scan_aclk	    = serscan_a_scan_en ?  clock_chop_aclk : 1'b0;
   assign	jt_scan_bclk	    = serscan_b_scan_en ? ~clock_chop_bclk
	                            : (jtag_ser_scan & soclk_off) ? 1'b1
                                    : 1'b0;
   //assign	jt_scan_pce_ov   = instr_spc_shscan & capture_dr_state;

   //********************************************************************
   // SIU Interface to Access L2
   //********************************************************************
   // Update register is in UCB_CTL, here is capture/shift only
   // Four Instructions: 
   //  TAP_L2_ADDR   - fills 64-bit header which contains address for L2
   //  TAP_L2_WRDATA - fills 64-bit data 
   //  TAP_L2_WR     - writes data to L2 addr via SIU; pulses tcu_sii_vld coincident with bit 0
   //                   of both addr and data; shifts addr & data out lsb first 
   //  TAP_L2_RD     - reads data from L2 addr via SIU; pulses tcu_sii_vld coincident with bit 0
   //                   of L2 addr to SIU, then waits until SIU returns data to shift register
   //  This reg. is used for shifting both data and address, then updated into regs
   //   in ucb_ctl; also this reg. captures data from sio for l2 reads

   assign 	instr_l2access = instr_l2_addr | instr_l2_wrdata | instr_l2_rd;
   
   // this is the SHIFT register; bit 0 used only to indicate valid data during READ
   tcu_jtag_ctl_msff_ctl_macro__width_65 tap_l2access_shift_reg 
   (
    .scan_in  (tap_l2access_shift_reg_scanin),
    .scan_out (tap_l2access_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_l2access[64:0]),
    .dout     (l2access[64:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_l2access[64:0] = (instr_l2access & shift_dr_state) ? {io_tdi, l2access[64:1]}
		                    : l2data_cap ? {l2rddata[63:0],l2_read_vld}
                                    : tlr_state ? 65'b0
			            : l2access[64:0];
   
   assign       l2data_upd = instr_l2_wrdata & update_dr_state; // must be synchronized in ucb_ctl
   assign       l2addr_upd = instr_l2_addr   & update_dr_state; // must be synchronized in ucb_ctl
   assign       l2rti = (instr_l2_wr | instr_l2_rd) & rti_state; // must be synchronized in ucb_ctl

   assign       l2data_cap = instr_l2_rd & capture_dr_state; 

   //********************************************************************
   // Clock Stop Interval Delay 
   //********************************************************************
   // Update register is in SIGMUX_CTL, here is capture/shift only
   //  TAP_CLKSTOP_DELAY  - fills 7-bit interval delay reg. in sigmux_ctl
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_7 tap_clkstopdly_shift_reg 
   (
    .scan_in  (tap_clkstopdly_shift_reg_scanin),
    .scan_out (tap_clkstopdly_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_clkstopdly[6:0]),
    .dout     (clkstopdly[6:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_clkstopdly[6:0] = (instr_clkstopdly & shift_dr_state) ? {io_tdi, clkstopdly[6:1]}
		                     : csdelay_cap ? csdel_data[6:0]
                                     : tlr_state   ? 7'b0
			             : clkstopdly[6:0];
   
   assign       jtag_upd_cntdly = instr_clkstopdly & update_dr_state; // must be synchronized in sigmux_ctl

   assign       csdelay_cap = instr_clkstopdly & capture_dr_state; 
   assign 	jtag_cntdly_data[6:0] = clkstopdly[6:0];

   //********************************************************************
   // Clock Stop: Clock Sequencer Status
   //********************************************************************
   // captures 2 bits: status of sigmux_ctl clock sequencer, to shift out (no update reg.)
   // bits = 00 --> clock sequencer is running
   // bits = 01 --> clock sequencer has started all clocks
   // bits = 10 --> clock sequencer has stopped all clocks
   // bits = 11 --> should not happen; indeterminate
   
   tcu_jtag_ctl_msff_ctl_macro__width_2 tap_clkseqstat_reg  
   (
    .scan_in  (tap_clkseqstat_reg_scanin),
    .scan_out (tap_clkseqstat_reg_scanout),
    .l1clk    (l1tck),			       
    .din      (next_clkseqstat[1:0]), 
    .dout     (clkseqstat[1:0]),
  .siclk(siclk),
  .soclk(soclk)       
    );
   assign 	 clkseq[0] = clkseq_strt;
   assign 	 clkseq[1] = clkseq_stop;
   assign 	 next_clkseqstat[1:0] = (instr_clkseq_stat & shift_dr_state) ? {io_tdi, clkseqstat[1]}
	                              : (instr_clkseq_stat & capture_dr_state) ? clkseq[1:0]
				      : clkseqstat[1:0];

   //********************************************************************
   // Core Select 
   //********************************************************************
   // Update register is in regs_ctl.dbg_ctl, here is capture/shift only
   //  TAP_CORE_SEL  - fills 8-bit core select register for soft stopping clocks
   //  only to cores specified in this reg.
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_8 tap_coresel_shift_reg 
   (
    .scan_in  (tap_coresel_shift_reg_scanin),
    .scan_out (tap_coresel_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_coresel[7:0]),
    .dout     (coresel[7:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_coresel[7:0] = (instr_core_sel & shift_dr_state) ? {io_tdi, coresel[7:1]}
		                  : coresel_cap ? spc_ss_sel[7:0]
                                  : tlr_state   ? 8'b0
			          : coresel[7:0];
   
   assign       core_sel_upd  = instr_core_sel & update_dr_state; // must be synchronized in dbg_ctl

   assign       coresel_cap   = instr_core_sel & capture_dr_state; 
   assign 	core_sel[7:0] = coresel[7:0];

   //********************************************************************
   // TCU Debug Control Register (TAP_TCU_DCR)
   //********************************************************************
   // Update register is in regs_ctl.dbg_ctl, here is capture/shift only
   //  TAP_TCU_DCR - fills 4-bit DCR register for control of reset debug events
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_4 tap_tcudcr_shift_reg 
   (
    .scan_in  (tap_tcudcr_shift_reg_scanin),
    .scan_out (tap_tcudcr_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_tcudcr[3:0]),
    .dout     (tcudcr[3:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_tcudcr[3:0] = (instr_tcu_dcr & shift_dr_state) ? {io_tdi, tcudcr[3:1]}
		                 : tcudcr_cap  ? tcu_dcr[3:0]
                                 : tlr_state   ? 4'b0
			         : tcudcr[3:0];
   
   assign       tcudcr_upd       = instr_tcu_dcr & update_dr_state; // must be synchronized in dbg_ctl

   assign       tcudcr_cap       = instr_tcu_dcr & capture_dr_state; 
   assign 	tcudcr_data[3:0] = tcudcr[3:0];

   //********************************************************************
   // DOSS Mode
   //********************************************************************
   // Update register is in regs_ctl.dbg_ctl, here is capture/shift only
   //  TAP_DOSS_MODE - fills 2-bit DOSS Mode, specifies Disable Overlap or Single Step Mode
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_2 tap_dossmode_shift_reg 
   (
    .scan_in  (tap_dossmode_shift_reg_scanin),
    .scan_out (tap_dossmode_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_dossmode[1:0]),
    .dout     (dossmode[1:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_dossmode[1:0] = (instr_doss_mode & shift_dr_state) ? {io_tdi, dossmode[1]}
		                   : dossmode_cap  ? doss_mode[1:0]
                                   : tlr_state     ? 2'b0
			           : dossmode[1:0];
   
   assign       dossmode_upd       = instr_doss_mode & update_dr_state; // must be synch'd in dbg_ctl

   assign       dossmode_cap       = instr_doss_mode & capture_dr_state;

   //********************************************************************
   // Single Step - Generate Single Step Request Pulse
   //********************************************************************
   // there is no flop for this instruction
   assign 	ssreq_upd          = instr_ss_request & update_dr_state; // synch'd in regs_ctl

   //********************************************************************
   // DOSS Status
   //********************************************************************
   //  TAP_DOSS_STATUS  - Read Only
   // this is the CAPTURE/SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_8 tap_dossstat_shift_reg 
   (
    .scan_in  (tap_dossstat_shift_reg_scanin),
    .scan_out (tap_dossstat_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_dossstat[7:0]),
    .dout     (dossstat[7:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_dossstat[7:0] = (instr_doss_status & shift_dr_state) ? {io_tdi, dossstat[7:1]}
		                   : dossstat_cap ? doss_stat[7:0]
                                   : tlr_state   ? 8'b0
			           : dossstat[7:0];
   
   assign       dossstat_cap       = instr_doss_status & capture_dr_state; 

   //********************************************************************
   // Cycle Step Mode
   //********************************************************************
   // Update register is in regs_ctl.dbg_ctl, here is capture/shift only
   //  TAP_CS_MODE - fills 1-bit CS Mode
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_csmode_shift_reg 
   (
    .scan_in  (tap_csmode_shift_reg_scanin),
    .scan_out (tap_csmode_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_csmode),
    .dout     (csmode),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign 	next_csmode   = (instr_cs_mode & shift_dr_state) ? io_tdi
   //		              : csmode_cap  ? cs_mode
   //                           : tlr_state   ? 1'b0
   //			      : csmode;
   assign       next_csmode   = ((~tlr_state & instr_cs_mode & shift_dr_state) & io_tdi) |
                                ((~tlr_state & csmode_cap) & cs_mode) |
                                ((~tlr_state & ~csmode_cap & ~(instr_cs_mode & shift_dr_state)) & csmode);
   
   assign       csmode_upd    = instr_cs_mode & update_dr_state; // must be synch'd in dbg_ctl
   assign       csmode_cap    = instr_cs_mode & capture_dr_state;

   //********************************************************************
   // Cycle Step Status
   //********************************************************************
   //  TAP_CS_STATUS  - Read Only
   
   // this is the CAPTURE/SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_csstat_shift_reg 
   (
    .scan_in  (tap_csstat_shift_reg_scanin),
    .scan_out (tap_csstat_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_csstat),
    .dout     (csstat),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign 	next_csstat   = (instr_cs_status & shift_dr_state) ? io_tdi
   //		              : csstat_cap   ? cs_mode_active
   //                           : tlr_state    ? 1'b0
   //			      : csstat;
   assign       next_csstat   = ((~tlr_state & instr_cs_status & shift_dr_state) & io_tdi) |
                                ((~tlr_state & csstat_cap) & cs_mode_active) |
                                ((~tlr_state & ~csstat_cap & ~(instr_cs_status & shift_dr_state)) & csstat);
   
   assign       csstat_cap    = instr_cs_status & capture_dr_state; 

   //********************************************************************
   // SerDes: ACCESS Mode 
   //********************************************************************
   //  - no JTAG_shift or update regs involved; needs trst_l
   // single bit to store access mode signal; set by TAP_STCI_ACCESS
   // and cleared by TAP_STCI_CLEAR or TLR
   // This instruction places STCI Chain between TDI & TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_stciaccess_reg 
   (
    .scan_in  (tap_stciaccess_reg_scanin),
    .scan_out (tap_stciaccess_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_stciaccess),
    .dout     (stciaccess),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_stciaccess      = (instr_stci_access & upd_ir_state) ? 1'b1
   //		                      : (instr_stci_clear  | tlr_state)    ? 1'b0
   //	           	              : stciaccess;
   assign 	next_stciaccess      = (instr_stci_access & upd_ir_state & ~tlr_state) |
                                       (~(instr_stci_access & upd_ir_state) & ~instr_stci_clear  & ~tlr_state & stciaccess);

   assign 	 stci_acc_mode   =  stciaccess        & ~pin_scanmode & ~tlr_state & stci_val_instr;

   assign        upd_ir_state    = (tap_state[3:0] == `TAP_UPDATE_IR);


   assign        stci_val_instr  =  instr_stci_access; // OR other instrs valid during stci here
   assign 	 stci_shft_clk   = ~updatedr          & (clockdr | ~shiftdr);
   assign        stci_cfg0       = ~shiftdr;
   assign 	 updatedr        =   update_dr_state & tck_l;
   assign 	 clockdr         = ~(tck_l  & (shift_dr_state  | capture_dr_state));

   assign 	 tcu_stciclk     =  stci_acc_mode     ?  stci_shft_clk  :  mio_tcu_stciclk;
   assign        tcu_stcicfg[1]  =  stci_acc_mode     ?  stci_cfg1      :  mio_tcu_stcicfg[1];
   assign        tcu_stcicfg[0]  =  stci_acc_mode     ?  stci_cfg0      :  mio_tcu_stcicfg[0];
   assign        tcu_stcid       =  stci_acc_mode     ?  io_tdi         :  mio_tcu_stcid;
   assign        stciq_tdo       =  stci_acc_mode     &  stciq_tcu;
   assign 	 tcu_mio_stciq   =  stciq_tcu; // ECO stciq_tdo;

   tcu_jtag_ctl_msff_ctl_macro__clr_1__en_1__width_1 tap_stcicfg1_reg 
   (
    .scan_in  (tap_stcicfg1_reg_scanin),
    .scan_out (tap_stcicfg1_reg_scanout),
    .l1clk    (l1tck),
    .clr      (stcicfg1_clear),
    .en       (stcicfg1_en),
    .din      (capture_dr_state),
    .dout     (stci_cfg1),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign        stcicfg1_clear  = ~stci_acc_mode;
   assign        stcicfg1_en     =  stci_acc_mode     & ~stci_cfg1;
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_shiftdr_reg 
   (
    .scan_in  (1'b0),
    .scan_out (tap_shiftdr_reg_scanout_unused),
    .l1clk    (tck_l),
    .din      (shift_dr_state),
    .dout     (shiftdr),
  .siclk(siclk),
  .soclk(soclk)
   );

   //********************************************************************
   // DMO: ACCESS Mode 
   //********************************************************************
   //  - no JTAG_shift or update regs involved; needs trst_l
   // single bit to store dmo mode signal; set by TAP_DMO_ACCESS
   // and cleared by TAP_DMO_CLEAR or TLR
   // This instruction places no register between TDI/TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_dmoaccess_reg 
   (
    .scan_in  (tap_dmoaccess_reg_scanin),
    .scan_out (tap_dmoaccess_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_dmoaccess),
    .dout     (dmoaccess),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_dmoaccess      = (instr_dmo_access  & upd_ir_state) ? 1'b1
   //		                     : (instr_dmo_clear   | tlr_state)    ? 1'b0
   //	           	             : dmoaccess;
   assign        next_dmoaccess      = (instr_dmo_access  & upd_ir_state & ~tlr_state) |
                                       (~(instr_dmo_access  & upd_ir_state) & ~instr_dmo_clear & ~tlr_state & dmoaccess);

   assign 	 jtag_dmo_enable_din =  dmoaccess        & ~pin_scanmode & ~tlr_state;

   //********************************************************************
   // DMO Control Register
   //********************************************************************
   // Update register is in mbist_ctl.dmo_ctl, here is capture/shift only
   //  TAP_DMO_CONFIG - fills 32-bit DMO Config register for control of DMO
   
   // this is the SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_48 tap_dmocfg_shift_reg 
   (
    .scan_in  (tap_dmocfg_shift_reg_scanin),
    .scan_out (tap_dmocfg_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_dmocfg[47:0]),
    .dout     (dmocfg[47:0]),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign 	next_dmocfg[47:0] = (instr_dmo_config & shift_dr_state) ? {io_tdi, dmocfg[47:1]}
		                  : dmocfg_cap  ? dmo_cfg[47:0]
                                  : tlr_state   ? 48'b0
			          : dmocfg[47:0];
   
   assign       dmocfg_cap        = instr_dmo_config & capture_dr_state;
   
   assign       jtag_dmo_control_upd   = instr_dmo_config & update_dr_state; // must be synch'd in mbist_ctl
   assign 	jtag_dmo_control[47:0] = dmocfg[47:0];


   //********************************************************************
   // Macro Test: ACCESS Mode 
   //********************************************************************
   //  - no JTAG_shift or update regs involved; needs trst_l
   // single bit to store MACRO TEST mode signal; set by TAP_MT_ACCESS
   // and cleared by TAP_MT_CLEAR or TLR
   // This instruction places no register between TDI/TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_mtaccess_reg 
   (
    .scan_in  (tap_mtaccess_reg_scanin),
    .scan_out (tap_mtaccess_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_mtaccess),
    .dout     (mtaccess),
  .siclk(siclk),
  .soclk(soclk)
   );
   assign	 next_mtaccess       = pin_scanmode                      ? mtaccess
                                     : (instr_mt_access  & upd_ir_state) ? 1'b1
		                     : (instr_mt_clear   | tlr_state)    ? 1'b0
	           	             : mtaccess;
   //assign      jtag_mt_enable  =  mtaccess         & ~pin_scanmode & ~tlr_state;
   assign        pin_macrotest   =  mtaccess;
   assign        jtag_macrotest  =  mtaccess & ~tlr_state;
   assign        jtag_mt_enable_din	 =  pin_scanmode ? pin_macrotest : jtag_macrotest;
   assign        tck_clk_tree    = ~instr_mt_scan    | ~rti_state        | (rti_state  &  l1tck);

   assign        jtag_ser_scan   =  instr_mt_scan    |  instr_ser_scan;
   // Only difference between instr_mt_scan and instr_ser_scan is that instr_mt_scan
   //  allows tck out on RTI; they are separate instructions in case their behavior 
   //  needs to diverge in the future
   assign        instr_mt_scan_rti = instr_mt_scan &  rti_state;
   
   // ********************************************************************
   // JTAG During POR: ACCESS Mode
   // ********************************************************************
   //  - no JTAG_shift or update regs involved; needs trst_l
   // single bit to store jtpor mode signal; set by TAP_JTPOR_ACCESS
   // and cleared by TAP_JTPOR_CLEAR or TLR
   // This instruction places no register between TDI/TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_jtporaccess_reg 
   (
    .scan_in  (tap_jtporaccess_reg_scanin),
    .scan_out (tap_jtporaccess_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtporaccess),
    .dout     (jtporaccess),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_jtporaccess    = (instr_jtpor_access  & upd_ir_state) ? 1'b1
   //		                     : (instr_jtpor_clear   | tlr_state)    ? 1'b0
   //	           	             : jtporaccess;
   assign        next_jtporaccess    = (instr_jtpor_access  & upd_ir_state & ~tlr_state) |
					 (~(instr_jtpor_clear   | tlr_state) & ~instr_jtpor_clear & ~tlr_state & jtporaccess);
   
   assign 	 jtag_por_enable_din =  jtporaccess      & ~pin_scanmode & ~tlr_state;

   // ********************************************************************
   // JTAG During POR: Status
   // ********************************************************************
   //  TAP_JTPOR_STATUS  - Read Only
   
   // this is the CAPTURE/SHIFT register
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_jtporstat_shift_reg 
   (
    .scan_in  (tap_jtporstat_shift_reg_scanin),
    .scan_out (tap_jtporstat_shift_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtporstat),
    .dout     (jtporstat),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign 	next_jtporstat = (instr_jtpor_status & shift_dr_state) ? io_tdi
   //		               : jtporstat_cap       ? jtag_por_status
   //                            : tlr_state    ? 1'b0
   //			       : jtporstat;
   assign 	 next_jtporstat = ((~tlr_state & instr_jtpor_status & shift_dr_state) & io_tdi) |
                                    ((~tlr_state & jtporstat_cap) & jtag_por_status) |
				      ((~tlr_state & ~jtporstat_cap & ~(instr_jtpor_status & shift_dr_state)) & jtporstat);

   assign       jtporstat_cap  = instr_jtpor_status & capture_dr_state; 

   // ********************************************************************
   // JTAG SCK Counter Bypass: ACCESS Mode
   // ********************************************************************
   //  - no JTAG_shift or update regs involved; needs trst_l
   // single bit to store jtag_sck_byp signal; set by TAP_SCKBYP_ACCESS
   // and cleared by TAP_SCKBYP_CLEAR or TLR
   // This instruction places no register between TDI/TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_jtsckbyp_reg 
   (
    .scan_in  (tap_jtsckbyp_reg_scanin),
    .scan_out (tap_jtsckbyp_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_jtsckbyp),
    .dout     (jtsckbyp),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_jtsckbyp   = (instr_sckbyp_access  & upd_ir_state) ? 1'b1
   //		                 : (instr_sckbyp_clear   | tlr_state)    ? 1'b0
   //	           	         : jtsckbyp;
   assign 	next_jtsckbyp   = (instr_sckbyp_access  & upd_ir_state & ~tlr_state) |
                                    (~(instr_sckbyp_access  & upd_ir_state) & ~instr_sckbyp_clear & ~tlr_state & jtsckbyp);

   assign 	 jtag_sck_byp    =  jtsckbyp;

   // ********************************************************************
   // JTAG Test Protect: ACCESS Mode
   // ********************************************************************
   //  - no JTAG_shift or update regs involved
   // single bit to store test protect mode signal; set by TAP_TP_ACCESS
   // and cleared by TAP_TP_CLEAR or TLR
   // This instruction places no register between TDI/TDO
   tcu_jtag_ctl_msff_ctl_macro__width_1 tap_tpaccess_reg 
   (
    .scan_in  (tap_tpaccess_reg_scanin),
    .scan_out (tap_tpaccess_reg_scanout),
    .l1clk    (l1tck),
    .din      (next_tpaccess),
    .dout     (tpaccess),
  .siclk(siclk),
  .soclk(soclk)
   );
   // TLR ECO
   //assign	 next_tpaccess       = (instr_tp_access     & upd_ir_state) ? 1'b1
   //	                             : (instr_tp_clear      | tlr_state)    ? 1'b0
   //                                :  tpaccess;
   assign 	 next_tpaccess       = (instr_tp_access & upd_ir_state & ~tlr_state) |
					 (~(instr_tp_access     & upd_ir_state) & ~instr_tp_clear & ~tlr_state & tpaccess);

   assign 	 jtag_test_protect   =  tpaccess; // TLR ECO //      &  ~tlr_state;
   

   // ********************************************************************
   // ********************************************************************

   assign 	ex1_ir_state    = (tap_state[3:0] == `TAP_EXIT1_IR);
   assign 	ex2_ir_state    = (tap_state[3:0] == `TAP_EXIT2_IR);

   assign       exit_ir         =  ex1_ir_state  |  ex2_ir_state;
   assign       next_state_updir = exit_ir & io_tms; // next state will be update IR

   assign       tcu_mio_bs_mode_ctl     =    active_upd_ir  |  pre_tcu_mio_bs_mode_ctl ;
   assign       tcu_sbs_enbstx          =   ~active_upd_ir  &  pre_tcu_sbs_enbstx      ;
   assign       tcu_sbs_enbsrx          =   ~active_upd_ir  &  pre_tcu_sbs_enbsrx      ;
   assign 	tcu_sbs_acmode          =   ~active_upd_ir  &  pre_tcu_sbs_acmode      ;
   assign 	tcu_sbs_enbspt          =   ~active_upd_ir  &  pre_tcu_sbs_enbspt      ;
   assign 	tcu_mio_bs_highz_l      =    active_upd_ir  |  pre_tcu_mio_bs_highz_l  ;

   //END of ECO xxxxxx

   // ----- ECO yyyyyy ---------
 
   assign 	jtss_next_instr_dec     =   (next_instr[7:0] == `TAP_MT_SCAN) 
                                          | (next_instr[7:0] == `TAP_SERSCAN);

   assign       jtss_next_instr         =   (next_state_updir |  tlr_state)  ?  jtss_next_instr_dec : jtss_active;

   assign       jtss_active_window      =   (jtss_active      |  jtss_active_dly);
   assign       jtag_ser_scan_q         =    jtss_active_window  &  jtag_ser_scan;

   //END of ECO yyyyyy

// ----------------------------------------------------------------------
// Removed for ECO to make flops visible in SunV
//spare_ctl_macro spare (num=12) (
//   .l1clk    ( l1tck         ),
//   .scan_in  ( spare_scanin  ),
//   .scan_out ( spare_scanout ));
 
// Added for ECO to make flops visible

// - this is an expansion of spare_ctl_macro with just the gates
tcu_jtag_ctl_spare_ctl_macro__flops_0__num_12 spare_gates  (
);

tcu_jtag_ctl_msff_ctl_macro__scanreverse_1__width_12 spare_flops  (
   .scan_in(spare_flops_scanin),
   .scan_out(spare_flops_scanout),
   .l1clk(l1tck),
   .din  (spare_flops_d[11:0]),
   .dout (spare_flops_q[11:0]),
  .siclk(siclk),
  .soclk(soclk)
);

assign   spare_flops_d[11]        =  spare11_flop_d;
assign   spare_flops_d[10]        =  spare10_flop_d; // ECO yyyyyy
assign   spare_flops_d[9]         =  spare9_flop_d;  // TLR ECO
assign   spare_flops_d[8]         =  spare8_flop_d;  // ECO yyyyyy
assign   spare_flops_d[7]         =  1'b0;
assign   spare_flops_d[6]         =  1'b0;
assign   spare_flops_d[5]         =  1'b0;
assign   spare_flops_d[4]         =  1'b0;
assign   spare_flops_d[3]         =  1'b0;
assign   spare_flops_d[2]         =  1'b0;
assign   spare_flops_d[1]         =  1'b0;
assign   spare_flops_d[0]         =  1'b0;

assign   spare11_flop_q           =  spare_flops_q[11];  
assign   spare10_flop_q           =  spare_flops_q[10]; // ECO yyyyyy 
assign   spare9_flop_q            =  spare_flops_q[9];  // TLR ECO
assign   spare8_flop_q            =  spare_flops_q[8];  // ECO yyyyyy
assign   spare_flops_unused[7]    =  spare_flops_q[7];  
assign   spare_flops_unused[6]    =  spare_flops_q[6];  
assign   spare_flops_unused[5]    =  spare_flops_q[5];  
assign   spare_flops_unused[4]    =  spare_flops_q[4];  
assign   spare_flops_unused[3]    =  spare_flops_q[3];  
assign   spare_flops_unused[2]    =  spare_flops_q[2];  
assign   spare_flops_unused[1]    =  spare_flops_q[1];  
assign   spare_flops_unused[0]    =  spare_flops_q[0];  

assign   spare10_flop_d         =  jtss_next_instr;  // ECO yyyyyy
assign   jtss_active            =  spare10_flop_q  ; // ECO yyyyyy
assign   spare8_flop_d          =  jtss_active    ;  // ECO yyyyyy
assign   jtss_active_dly        =  spare8_flop_q  ;  // ECO yyyyyy

assign   spare11_flop_d         =  next_state_updir; // ECO xxxxxx
assign   active_upd_ir          =  spare11_flop_q  ; // ECO xxxxxx

assign   spare9_flop_d          =  instr_sstop_csmode_din; // TLR ECO
assign   instr_sstop_csmode     =  spare9_flop_q  ;        // TLR ECO

// ----------------------------------------------------------------------
   
// fixscan start: bypass tck_l flops
assign tap_scan_in    = scan_in                  ;
assign ext_jtag_ll_reg_scanin    = 1'b0;
assign bs_scan_enne_reg_scanin   = 1'b0;
assign ucb_jtag_data_rdy_sync_reg_scanin = tap_scan_out;
assign jtag_csr_wr_reg_scanin   = ucb_jtag_data_rdy_sync_reg_scanout;
assign jtag_csr_data_reg_scanin = jtag_csr_wr_reg_scanout;
assign bs_scan_enpe_reg_scanin   = jtag_csr_data_reg_scanout;
assign tap_idcode_reg_scanin     = bs_scan_enpe_reg_scanout ;
assign tap_chainsel_reg_scanin   = tap_idcode_reg_scanout   ;
assign tap_fusemode_shift_reg_scanin = tap_chainsel_reg_scanout ;
assign tap_fusemode_upd_reg_scanin = 1'b0;
assign tap_fuserowaddr_shift_reg_scanin = tap_fusemode_shift_reg_scanout; 
assign tap_fuserowaddr_upd_reg_scanin = 1'b0;
assign tap_fusecoladdr_shift_reg_scanin = tap_fuserowaddr_shift_reg_scanout;
assign tap_fusecoladdr_upd_reg_scanin = 1'b0;
assign tap_fusereaden_reg_scanin = tap_fusecoladdr_shift_reg_scanout;
assign tap_fusedestsample_reg_scanin = tap_fusereaden_reg_scanout;
assign tap_fusebypass_reg_scanin = tap_fusedestsample_reg_scanout;
assign tap_rvclr_shift_reg_scanin     = tap_fusebypass_reg_scanout;
assign tap_rvclr_upd_reg_scanin       = tap_rvclr_shift_reg_scanout;
assign tap_mbibypass_shift_reg_scanin = tap_rvclr_upd_reg_scanout;
assign tap_mbibypass_upd_reg_scanin = tap_mbibypass_shift_reg_scanout;
assign tap_mbist_get_done_fail_shift_reg_scanin = tap_mbibypass_upd_reg_scanout;
assign tap_mbist_result_reg_scanin = tap_mbist_get_done_fail_shift_reg_scanout;
assign tap_mbist_mode_reg_scanin = tap_mbist_result_reg_scanout;
assign tap_mbist_clkstpen_reg_scanin  = tap_mbist_mode_reg_scanout;
assign mbi_a_scan_en_reg_scanin = 1'b0;
assign mbi_b_scan_en_reg_scanin = tap_mbist_clkstpen_reg_scanout;
assign jtag_output_flops_reg_scanin          = mbi_b_scan_en_reg_scanout;
assign tap_lbist_bypass_shift_reg_scanin     = jtag_output_flops_reg_scanout;
assign tap_lbist_bypass_upd_reg_scanin       = tap_lbist_bypass_shift_reg_scanout;
assign tap_lbist_mode_reg_scanin             = tap_lbist_bypass_upd_reg_scanout;
assign tap_lbist_done_reg_scanin             = tap_lbist_mode_reg_scanout;
assign tap_lbist_start_reg_scanin            = tap_lbist_done_reg_scanout;
assign tap_lbist_a_scan_en_reg_scanin        = 1'b0; //tap_lbist_start_reg_scanout;
assign tap_lbist_b_scan_en_reg_scanin        = tap_lbist_start_reg_scanout;
assign tap_cregaddr_shift_reg_scanin         = tap_lbist_b_scan_en_reg_scanout;
assign tap_cregwdata_reg_scanin = tap_cregaddr_shift_reg_scanout;
assign tap_cregrdrtrn_reg_scanin = tap_cregwdata_reg_scanout;
assign tap_cregaddren_reg_scanin = tap_cregrdrtrn_reg_scanout;
assign tap_cregwren_reg_scanin = tap_cregaddren_reg_scanout;
assign tap_cregrden_reg_scanin = tap_cregwren_reg_scanout;
assign tap_cregdataen_reg_scanin = tap_cregrden_reg_scanout;
assign tap_cregrdrtrnvld_reg_scanin = tap_cregdataen_reg_scanout;
assign tap_ucb_jtag_data_rdy_d_reg_scanin = tap_cregrdrtrnvld_reg_scanout;
assign tap_ucb_jtag_data_rdy_d2_reg_scanin = tap_ucb_jtag_data_rdy_d_reg_scanout;
assign tap_cregrdrtrnload_reg_scanin = tap_ucb_jtag_data_rdy_d2_reg_scanout;
assign tap_ncurd_reg_scanin = tap_cregrdrtrnload_reg_scanout;
assign tap_ncuraddr_reg_scanin = tap_ncurd_reg_scanout;
assign spcshscan_a_scan_en_reg_scanin = 1'b0;
assign spcshscan_b_scan_en_reg_scanin = tap_ncuraddr_reg_scanout;
assign l2tshscan_a_scan_en_reg_scanin = 1'b0;
assign l2tshscan_b_scan_en_reg_scanin = spcshscan_b_scan_en_reg_scanout;
   assign tap_jtagclkstop_reg_scanin = l2tshscan_b_scan_en_reg_scanout;
   assign tap_gen32_shift_reg_scanin = tap_jtagclkstop_reg_scanout;
   assign tap_gen64_shift_reg_scanin = tap_gen32_shift_reg_scanout;
   assign serscan_a_scan_en_reg_scanin = 1'b0; // tck_l
   assign serscan_b_scan_en_reg_scanin = tap_gen64_shift_reg_scanout;
assign tap_l2access_shift_reg_scanin = serscan_b_scan_en_reg_scanout;
   assign tap_clkstopdly_shift_reg_scanin = tap_l2access_shift_reg_scanout;
   assign tap_clkseqstat_reg_scanin = tap_clkstopdly_shift_reg_scanout;
   assign tap_coresel_shift_reg_scanin = tap_clkseqstat_reg_scanout;
   assign tap_tcudcr_shift_reg_scanin  = tap_coresel_shift_reg_scanout;
   assign tap_dossmode_shift_reg_scanin  = tap_tcudcr_shift_reg_scanout;
   assign tap_dossstat_shift_reg_scanin  = tap_dossmode_shift_reg_scanout;
   assign tap_csmode_shift_reg_scanin  = tap_dossstat_shift_reg_scanout;
   assign tap_csstat_shift_reg_scanin  = tap_csmode_shift_reg_scanout;
   assign tap_stciaccess_reg_scanin    = tap_csstat_shift_reg_scanout;
   assign tap_stcicfg1_reg_scanin      = tap_stciaccess_reg_scanout;
   assign tap_dmoaccess_reg_scanin     = tap_stcicfg1_reg_scanout;
   assign tap_dmocfg_shift_reg_scanin  = tap_dmoaccess_reg_scanout;
   assign tap_mtaccess_reg_scanin      = tap_dmocfg_shift_reg_scanout;
assign tap_jtporaccess_reg_scanin      = tap_mtaccess_reg_scanout;
assign tap_jtporstat_shift_reg_scanin  = tap_jtporaccess_reg_scanout;
assign tap_jtsckbyp_reg_scanin         = tap_jtporstat_shift_reg_scanout;
assign tap_tpaccess_reg_scanin         = tap_jtsckbyp_reg_scanout;
assign spare_flops_scanin              = tap_tpaccess_reg_scanout;

assign flush_scanout = spare_flops_scanout & ~flush_dly;
assign scan_out = io_test_mode ? spare_flops_scanout : flush_scanout;

// fixscan end:
   
endmodule






// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_l1clkhdr_ctl_macro (
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

module tcu_jtag_ctl_msff_ctl_macro__width_1 (
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

module tcu_jtag_ctl_msff_ctl_macro__jtag_1__width_4 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff_jtag #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__fs_1__jtag_1__width_8 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;

  input [7:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input [7:0] scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output [7:0] scan_out;
assign fdin[7:0] = din[7:0];






dff_jtag #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si(scan_in[7:0]),
.so(scan_out[7:0]),
.q(dout[7:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__jtag_1__width_1 (
  din, 
  reset, 
  updateclk, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input reset;
  input updateclk;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff_jtag #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0]),
  .reset(reset),
  .updateclk(updateclk)
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__width_48 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [47:0] fdin;
wire [46:0] so;

  input [47:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [47:0] dout;
  output scan_out;
assign fdin[47:0] = din[47:0];






dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__width_32 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_6 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_3 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_7 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_5 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_2 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_4 (
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

module tcu_jtag_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_37 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [36:0] fdin;
wire [35:0] so;

  input [36:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [36:0] dout;
  output scan_out;
assign fdin[36:0] = din[36:0];






dff #(37)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[36:0]),
.si({scan_in,so[35:0]}),
.so({so[35:0],scan_out}),
.q(dout[36:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__width_8 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_40 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [39:0] fdin;
wire [38:0] so;

  input [39:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [39:0] dout;
  output scan_out;
assign fdin[39:0] = din[39:0];






dff #(40)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[39:0]),
.si({scan_in,so[38:0]}),
.so({so[38:0],scan_out}),
.q(dout[39:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__width_64 (
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

module tcu_jtag_ctl_msff_ctl_macro__width_65 (
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

module tcu_jtag_ctl_msff_ctl_macro__clr_1__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module tcu_jtag_ctl_spare_ctl_macro__flops_0__num_12;
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



endmodule






// any PARAMS parms go into naming of macro

module tcu_jtag_ctl_msff_ctl_macro__scanreverse_1__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [0:10] so;

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
.si({so[0:10],scan_in}),
.so({scan_out,so[0:10]}),
.q(dout[11:0])
);












endmodule








