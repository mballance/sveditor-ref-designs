// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fbdic_ctl.v
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
`define DRIF_MCU_STATE_00  5'd0
`define DRIF_MCU_STATE_01  5'd1
`define DRIF_MCU_STATE_02  5'd2
`define DRIF_MCU_STATE_03  5'd3
`define DRIF_MCU_STATE_04  5'd4
`define DRIF_MCU_STATE_05  5'd5
`define DRIF_MCU_STATE_06  5'd6
`define DRIF_MCU_STATE_07  5'd7
`define DRIF_MCU_STATE_08  5'd8
`define DRIF_MCU_STATE_09  5'd9
`define DRIF_MCU_STATE_10  5'd10
`define DRIF_MCU_STATE_11  5'd11
`define DRIF_MCU_STATE_12  5'd12
`define DRIF_MCU_STATE_13  5'd13
`define DRIF_MCU_STATE_14  5'd14
`define DRIF_MCU_STATE_15  5'd15
`define DRIF_MCU_STATE_16  5'd16
`define DRIF_MCU_STATE_17  5'd17
`define DRIF_MCU_STATE_18  5'd18
`define DRIF_MCU_STATE_19  5'd19
`define DRIF_MCU_STATE_20  5'd20
`define DRIF_MCU_STATE_21  5'd21
`define DRIF_MCU_STATE_22  5'd22
`define DRIF_MCU_STATE_23  5'd23
`define DRIF_MCU_STATE_24  5'd24
`define DRIF_MCU_STATE_25  5'd25
`define DRIF_MCU_STATE_26  5'd26

`define DRIF_MCU_STATE_MAX 4
`define DRIF_MCU_STATE_WIDTH 5

//
// UCB Packet Type
// ===============
//
`define UCB_READ_NACK        4'b0000    // ack/nack types
`define UCB_READ_ACK         4'b0001
`define UCB_WRITE_ACK        4'b0010
`define UCB_IFILL_ACK        4'b0011
`define UCB_IFILL_NACK       4'b0111

`define UCB_READ_REQ         4'b0100    // req types
`define UCB_WRITE_REQ        4'b0101
`define UCB_IFILL_REQ        4'b0110

`define UCB_INT              4'b1000    // plain interrupt
`define UCB_INT_VEC          4'b1100    // interrupt with vector
`define UCB_RESET_VEC        4'b1101    // reset with vector
`define UCB_IDLE_VEC         4'b1110    // idle with vector
`define UCB_RESUME_VEC       4'b1111    // resume with vector


//
// UCB Data Packet Format
// ======================
//
`define UCB_NOPAY_PKT_WIDTH   64        // packet without payload
`define UCB_64PAY_PKT_WIDTH  128        // packet with 64 bit payload
`define UCB_128PAY_PKT_WIDTH 192        // packet with 128 bit payload

`define UCB_DATA_EXT_HI      191        // (64) extended data
`define UCB_DATA_EXT_LO      128
`define UCB_DATA_HI          127        // (64) data
`define UCB_DATA_LO           64
`define UCB_RSV_HI            63        // (9) reserved bits
`define UCB_RSV_LO            55
`define UCB_ADDR_HI           54        // (40) bit address
`define UCB_ADDR_LO           15
`define UCB_SIZE_HI           14        // (3) request size
`define UCB_SIZE_LO           12
`define UCB_BUF_HI            11        // (2) buffer ID
`define UCB_BUF_LO            10
`define UCB_THR_HI             9        // (6) cpu/thread ID
`define UCB_THR_LO             4
`define UCB_PKT_HI             3        // (4) packet type
`define UCB_PKT_LO             0

`define UCB_DATA_EXT_WIDTH    64
`define UCB_DATA_WIDTH        64
`define UCB_RSV_WIDTH          9
`define UCB_ADDR_WIDTH        40 
`define UCB_SIZE_WIDTH         3
`define UCB_BUF_WIDTH          2
`define UCB_THR_WIDTH          6
`define UCB_PKT_WIDTH          4

// Size encoding for the UCB_SIZE_HI/LO field
// 000 - byte
// 001 - half-word
// 010 - word
// 011 - double-word
`define UCB_SIZE_1B          3'b000
`define UCB_SIZE_2B          3'b001
`define UCB_SIZE_4B          3'b010
`define UCB_SIZE_8B          3'b011
`define UCB_SIZE_16B         3'b100


//
// UCB Interrupt Packet Format
// ===========================
//
`define UCB_INT_PKT_WIDTH     64

`define UCB_INT_RSV_HI        63        // (7) reserved bits
`define UCB_INT_RSV_LO        57
`define UCB_INT_VEC_HI        56        // (6) interrupt vector
`define UCB_INT_VEC_LO        51
`define UCB_INT_STAT_HI       50        // (32) interrupt status
`define UCB_INT_STAT_LO       19
`define UCB_INT_DEV_HI        18        // (9) device ID
`define UCB_INT_DEV_LO        10
//`define UCB_THR_HI             9      // (6) cpu/thread ID shared with
//`define UCB_THR_LO             4             data packet format
//`define UCB_PKT_HI             3      // (4) packet type shared with
//`define UCB_PKT_LO             0      //     data packet format

`define UCB_INT_RSV_WIDTH      7
`define UCB_INT_VEC_WIDTH      6
`define UCB_INT_STAT_WIDTH    32
`define UCB_INT_DEV_WIDTH      9


`define MCU_CAS_BIT2_SEL_PA10 4'h1
`define MCU_CAS_BIT2_SEL_PA32 4'h2
`define MCU_CAS_BIT2_SEL_PA33 4'h4
`define MCU_CAS_BIT2_SEL_PA34 4'h8

`define MCU_CAS_BIT3_SEL_PA11 4'h1
`define MCU_CAS_BIT3_SEL_PA33 4'h2
`define MCU_CAS_BIT3_SEL_PA34 4'h4
`define MCU_CAS_BIT3_SEL_PA35 4'h8

`define MCU_CAS_BIT4_SEL_PA12 3'h1
`define MCU_CAS_BIT4_SEL_PA35 3'h2
`define MCU_CAS_BIT4_SEL_PA36 3'h4

`define MCU_DIMMHI_SEL_ZERO 6'h01
`define MCU_DIMMHI_SEL_PA32 6'h02
`define MCU_DIMMHI_SEL_PA33 6'h04
`define MCU_DIMMHI_SEL_PA34 6'h08
`define MCU_DIMMHI_SEL_PA35 6'h10
`define MCU_DIMMHI_SEL_PA36 6'h20

`define MCU_DIMMLO_SEL_ZERO 4'h1
`define MCU_DIMMLO_SEL_PA10 4'h2
`define MCU_DIMMLO_SEL_PA11 4'h4
`define MCU_DIMMLO_SEL_PA12 4'h8

`define MCU_RANK_SEL_ZERO 7'h01
`define MCU_RANK_SEL_PA32 7'h02
`define MCU_RANK_SEL_PA33 7'h04
`define MCU_RANK_SEL_PA34 7'h08
`define MCU_RANK_SEL_PA35 7'h10
`define MCU_RANK_SEL_PA10 7'h20
`define MCU_RANK_SEL_PA11 7'h40

`define MCU_ADDR_ERR_SEL_39_32 6'h01
`define MCU_ADDR_ERR_SEL_39_33 6'h02
`define MCU_ADDR_ERR_SEL_39_34 6'h04
`define MCU_ADDR_ERR_SEL_39_35 6'h08
`define MCU_ADDR_ERR_SEL_39_36 6'h10
`define MCU_ADDR_ERR_SEL_39_37 6'h20

`define DRIF_ERR_IDLE 0
`define DRIF_ERR_IDLE_ST 5'h1
`define DRIF_ERR_READ0 1
`define DRIF_ERR_READ0_ST 5'h2
`define DRIF_ERR_WRITE 2
`define DRIF_ERR_WRITE_ST 5'h4
`define DRIF_ERR_READ1 3
`define DRIF_ERR_READ1_ST 5'h8
`define DRIF_ERR_CRC_FR 4
`define DRIF_ERR_CRC_FR_ST 5'h10

`define MCU_WDQ_RF_DATA_WIDTH 72
`define MCU_WDQ_RF_ADDR_WIDTH 5
`define MCU_WDQ_RF_DEPTH 32

// FBDIMM header defines
`define FBD_TS0_HDR 12'hbfe
`define FBD_TS1_HDR 12'hffe
`define FBD_TS2_HDR 12'h7fe
`define FBD_TS3_HDR 12'h3fe

// MCU FBDIMM Channel commands
`define FBD_DRAM_CMD_NOP 3'h0
`define FBD_DRAM_CMD_OTHER 3'h1
`define FBD_DRAM_CMD_RD  3'h2
`define FBD_DRAM_CMD_WR  3'h3
`define FBD_DRAM_CMD_ACT 3'h4
`define FBD_DRAM_CMD_WDATA 3'h5

`define FBD_DRAM_CMD_OTHER_REF 3'h5
`define FBD_DRAM_CMD_OTHER_SRE 3'h4
`define FBD_DRAM_CMD_OTHER_PDE 3'h2
`define FBD_DRAM_CMD_OTHER_SRPDX 3'h3

`define FBD_CHNL_CMD_NOP   2'h0
`define FBD_CHNL_CMD_SYNC  2'h1
`define FBD_CHNL_CMD_SCRST 2'h2

`define FBDIC_ERR_IDLE_ST 7'h01
`define FBDIC_ERR_IDLE 0

`define FBDIC_ERR_STS_ST 7'h02
`define FBDIC_ERR_STS 1

`define FBDIC_ERR_SCRST_ST 7'h04
`define FBDIC_ERR_SCRST 2

`define FBDIC_ERR_SCRST_STS_ST 7'h08
`define FBDIC_ERR_SCRST_STS 3

`define FBDIC_ERR_STS2_ST 7'h10
`define FBDIC_ERR_STS2 4

`define FBDIC_ERR_FASTRST_ST 7'h20
`define FBDIC_ERR_FASTRST 5

`define FBDIC_ERR_FASTRST_STS_ST 7'h40
`define FBDIC_ERR_FASTRST_STS 6


// IBIST DEFINITION

`define L_2_0  12'h555
`define L_2_1  12'h555
`define L_4_0  12'h333
`define L_4_1  12'h333
`define L_6_0  12'h1c7
`define L_6_1  12'h1c7
`define L_8_0  12'h0f0
`define L_8_1  12'hf0f
`define L_24_0 12'h000
`define L_24_1 12'hfff

`define idle            4'h0

`define error_0         4'h1
`define error_1         4'h2

`define start1_0        4'h3
`define start1_1        4'h4
`define start2_0        4'h5
`define start2_1        4'h6

`define pat1_0          4'h7
`define pat1_1          4'h8

`define clkpat_0        4'h9
`define clkpat_1        4'ha

`define const_0         4'hb
`define const_1         4'hc

`define stop1_0         4'h1
`define stop1_1         4'h2

`define stop2_0         4'hd
`define stop2_1         4'he
`define error           4'hf

`define IBTX_STATE_IDLE 0
`define IBTX_STATE_PATT 1
`define IBTX_STATE_MODN 2
`define IBTX_STATE_CONST 3

`define IBRX_STATE_IDLE 0
`define IBRX_STATE_PATT 1
`define IBRX_STATE_MODN 2
`define IBRX_STATE_CONST 3



module mcu_fbdic_ctl (
  fbdic_data_sel, 
  fbdic0_ts_data, 
  fbdic1_ts_data, 
  fbdic_ibist_data, 
  fbdic_f, 
  fbdic_f_1_l, 
  fbdic0_chnl_disable, 
  fbdic1_chnl_disable, 
  fbdic_a_cmd, 
  fbdic_bc_cmd, 
  fbdic0_cmd_crc_sel, 
  fbdic0_data_crc_sel, 
  fbdic0_sb_failover, 
  fbdic0_sb_failover_l, 
  fbdic0_sb_failover_mask, 
  fbdic0_sb_failover_mask_l, 
  fbdic0_nb_failover, 
  fbdic0_nb_failover_l, 
  fbdic0_nb_failover_mask, 
  fbdic0_nb_failover_mask_l, 
  fbdic1_cmd_crc_sel, 
  fbdic1_data_crc_sel, 
  fbdic1_sb_failover, 
  fbdic1_sb_failover_l, 
  fbdic1_sb_failover_mask, 
  fbdic1_sb_failover_mask_l, 
  fbdic1_nb_failover, 
  fbdic1_nb_failover_l, 
  fbdic1_nb_failover_mask, 
  fbdic1_nb_failover_mask_l, 
  fbdic_ucb_rd_data, 
  fbdic_train_state, 
  fbdic_disable_state, 
  fbdic_enable_sync_count, 
  fbdic_sync_frame_req_early3, 
  fbdic_sync_frame_req_early2, 
  fbdic_sync_frame_req_early1, 
  fbdic_sync_frame_req, 
  fbdic_sync_frame_req_d1, 
  fbdic_scr_frame_req_d4, 
  fbdic_l0_state, 
  fbdic_l0s_lfsr_stall, 
  fbdic_err_fast_reset_done, 
  fbdic_chnl_reset_error, 
  fbdic_chnl_reset_error_mode, 
  fbdic_special_cmd, 
  fbdic_special_cmd_l, 
  fbdic_ibrx_data_sel, 
  fbdic_ibrx_data_sel_l, 
  fbdic_rddata_vld, 
  fbdic_rddata_vld_l, 
  fbdic_woq_free, 
  fbdic_clear_wrq_ent, 
  fbdic_error_mode, 
  fbdic_fbd_error, 
  fbdic_crc_error, 
  fbdic_err_unrecov, 
  fbdic_err_recov, 
  fbdic_err_fbr, 
  fbdic0_inc_wptr, 
  fbdic0_inc_rptr, 
  fbdic0_clr_ptrs, 
  fbdic1_inc_wptr, 
  fbdic1_inc_rptr, 
  fbdic1_clr_ptrs, 
  fbdic_idle_lfsr_reset, 
  mcu_fsr0_cfgpll_enpll, 
  mcu_fsr1_cfgpll_enpll, 
  mcu_fsr01_cfgpll_lb, 
  mcu_fsr01_cfgpll_mpy, 
  mcu_fsr0_cfgrx_enrx, 
  mcu_fsr1_cfgrx_enrx, 
  mcu_fsr0_cfgrx_entest, 
  mcu_fsr1_cfgrx_entest, 
  mcu_fsr0_cfgrx_align, 
  mcu_fsr1_cfgrx_align, 
  mcu_fsr0_cfgrx_invpair, 
  mcu_fsr1_cfgrx_invpair, 
  mcu_fsr01_cfgrx_eq, 
  mcu_fsr01_cfgrx_cdr, 
  mcu_fsr01_cfgrx_term, 
  mcu_fsr0_cfgtx_entx, 
  mcu_fsr1_cfgtx_entx, 
  mcu_fsr0_cfgtx_entest, 
  mcu_fsr1_cfgtx_entest, 
  mcu_fsr0_cfgtx_enidl, 
  mcu_fsr1_cfgtx_enidl, 
  mcu_fsr0_cfgtx_invpair, 
  mcu_fsr1_cfgtx_invpair, 
  mcu_fsr01_cfgtx_enftp, 
  mcu_fsr01_cfgtx_de, 
  mcu_fsr01_cfgtx_swing, 
  mcu_fsr01_cfgtx_cm, 
  mcu_fsr01_cfgrtx_rate, 
  mcu_fsr0_testcfg, 
  mcu_fsr1_testcfg, 
  fbdic_link_cnt_en, 
  fbdic_link_cnt_reset, 
  rdpctl_kp_lnk_up, 
  rdpctl_kp_lnk_up_clr, 
  fbdic_serdes_dtm, 
  fbdic_srds_dtm_muxsel, 
  fbdic_cfgrd_crc_error, 
  fbdic_mcu_idle, 
  fbd0_elect_idle, 
  fbd1_elect_idle, 
  fbd0_frame_lock, 
  fbd1_frame_lock, 
  fbd0_testfail, 
  fbd1_testfail, 
  drif_ucb_wr_req_vld, 
  drif_ucb_rd_req_vld, 
  drif_ucb_addr, 
  drif_ucb_data, 
  lndskw0_data, 
  lndskw1_data, 
  fbdird_ibrx_data, 
  drif_dram_cmd_a, 
  drif_dram_addr_a, 
  drif_dram_bank_a, 
  drif_dram_dimm_a, 
  drif_dram_rank_a, 
  drif_dram_cmd_b, 
  drif_dram_addr_b, 
  drif_dram_bank_b, 
  drif_dram_dimm_b, 
  drif_dram_rank_b, 
  drif_wdata_wsn, 
  woq_err_st_wait_free, 
  drif_dram_cmd_c, 
  drif_dram_addr_c, 
  drif_dram_bank_c, 
  drif_dram_dimm_c, 
  drif_dram_rank_c, 
  drif_single_channel_mode, 
  drif_branch_disabled, 
  drif_mcu_idle, 
  drif_cke_reg, 
  drif_stacked_dimm, 
  drif_num_dimms, 
  rdpctl_fifo_empty, 
  rdpctl_crc_recov_err, 
  rdpctl_crc_unrecov_err, 
  rdpctl_mask_err, 
  drif_dbg_trig_reg_ld, 
  fdout_link_cnt, 
  drif_err_state_crc_fr, 
  rdata_err_fbui, 
  rdata_err_fbri, 
  fbdird_crc_cmp0_0, 
  fbdird_crc_cmp0_1, 
  fbdird_crc_cmp1_0, 
  fbdird_crc_cmp1_1, 
  lndskw0_ts0_hdr_match, 
  lndskw1_ts0_hdr_match, 
  lndskw0_status_parity, 
  lndskw1_status_parity, 
  lndskw0_idle_match, 
  lndskw1_idle_match, 
  lndskw0_alert_match, 
  lndskw1_alert_match, 
  lndskw0_alert_asserted, 
  lndskw1_alert_asserted, 
  lndskw0_nbde, 
  lndskw1_nbde, 
  lndskw0_thermal_trip, 
  lndskw1_thermal_trip, 
  fbdird0_cnfgreg_data, 
  fbdird1_cnfgreg_data, 
  fsr0_mcu_stspll_lock, 
  fsr1_mcu_stspll_lock, 
  fsr0_mcu_ststx_testfail, 
  fsr1_mcu_ststx_testfail, 
  rdpctl_dtm_atspeed, 
  ccu_serdes_dtm, 
  mcu_gnd, 
  drl2clk, 
  scan_in, 
  scan_out, 
  wmr_scan_in, 
  fbdic_wmr_scanout, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  aclk_wmr, 
  tcu_scan_en, 
  wmr_protect, 
  tcu_mcu_testmode, 
  fbdtm_si, 
  fbdtm_so, 
  fbdtm_wmr_si, 
  fbdtm_wmr_so);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire fbdic_fbd_state_ld;
wire fbdic_fbd_state_en;
wire fbdic_fbd_chnl_init_seq;
wire [7:0] fbdic_fbd_state;
wire fbdic_tdisable_done;
wire fbdic_tcalibrate_done;
wire [1:0] fbdic_tclktrain_done;
wire fbdic_tclktrain_to_done;
wire [1:0] fbdic_testing_done;
wire fbdic_testing_to_done;
wire [1:0] fbdic_polling_done;
wire fbdic_polling_to_done;
wire [1:0] fbdic_config_done;
wire fbdic_config_to_done;
wire fbdic_sync_frame_req_d4;
wire fbdic_chnl_reset_ld;
wire fbdic_ibtx_start_ld;
wire fbdic_dtm_fbd_state0_en;
wire fbdic_dtm_fbd_state2_en;
wire fbdic_dtm_fbd_state6_en;
wire [1:0] fbdic_chnl_reset;
wire fbdic_ibtx_start;
wire fbdic_ibist_done;
wire [7:0] fbdic_fbd_state_in;
wire fbdic_fast_reset;
wire fbdic_sbcaliben;
wire pff_fbd_state_wmr_scanin;
wire pff_fbd_state_wmr_scanout;
wire ff_fbd_state_scanin;
wire ff_fbd_state_scanout;
wire fbdic_calibrate_state;
wire fbdic_testing_state;
wire fbdic_polling_state;
wire fbdic_config_state;
wire fbdic_fast_reset_en;
wire [3:0] fbdic_fast_reset_in;
wire fbdic_fast_reset_3_en;
wire fbdic_sync_ier_enable;
wire pff_fast_reset_wmr_scanin;
wire pff_fast_reset_3_wmr_scanout;
wire pff_fast_reset_wmr_scanout;
wire [1:0] fbdic_sync_r;
wire fbdic_sync_ier_in;
wire ff_sync_ier_scanin;
wire ff_sync_ier_scanout;
wire fbdic_sync_ier;
wire fbdic_fr_issued_in;
wire fbdic_err_fast_chnl_reset;
wire fast_reset_err;
wire [6:0] fbdic_err_state;
wire fbdic_fr_issued;
wire ff_fr_issued_scanin;
wire ff_fr_issued_scanout;
wire fbdic_sync_erc;
wire fast_reset_err_on_first_sync;
wire fbdic_idle_lfsr_reset_d1;
wire fbdic_idle_frame;
wire fbdic_chnl_reset_en;
wire fbdic_chnl_reset_clr;
wire [1:0] fbdic_chnl_reset_in;
wire pff_chnl_reset1_wmr_scanin;
wire pff_chnl_reset1_wmr_scanout;
wire pff_chnl_reset0_scanin;
wire pff_chnl_reset0_scanout;
wire fbdic_chnl_reset_error_mode_in;
wire ff_chnl_reset_error_mode_scanin;
wire ff_chnl_reset_error_mode_scanout;
wire fbdic_sb2nb_map_en;
wire [3:0] fbdic_sb2nb_map_in;
wire pff_sb2nb_map_wmr_scanin;
wire pff_sb2nb_map_wmr_scanout;
wire [3:0] fbdic_sb2nb_map;
wire fbdic_amb_test_param_en;
wire [23:0] fbdic_amb_test_param_in;
wire pff_amb_test_param_wmr_scanin;
wire pff_amb_test_param_wmr_scanout;
wire [23:0] fbdic_amb_test_param;
wire fbdic_failover_config_en;
wire [15:0] fbdic_failover_config_in;
wire [15:0] inv_fbdic_failover_config_in;
wire [15:0] fbdic_failover_config;
wire [15:0] inv_fbdic_failover_config;
wire pff_failover_config_wmr_scanin;
wire pff_failover_config_wmr_scanout;
wire [27:0] inv_fbdic_elect_idle_detect_in;
wire [27:0] fbdic_elect_idle_detect;
wire [27:0] inv_fbdic_elect_idle_detect;
wire ff_elect_idle_detect_scanin;
wire ff_elect_idle_detect_scanout;
wire fbdic_tdisable_period_en;
wire [9:0] fbdic_tdisable_period_in;
wire [7:0] inv_fbdic_tdisable_period_in;
wire [9:0] fbdic_tdisable_period;
wire [7:0] inv_fbdic_tdisable_period;
wire pff_tdisable_period_wmr_scanin;
wire pff_tdisable_period_wmr_scanout;
wire fbdic_enter_disable_state;
wire fbdic_tdisable_done_en;
wire [9:0] fbdic_tdisable_cnt;
wire fbdic_tdisable_done_in;
wire ff_tdisable_done_scanin;
wire ff_tdisable_done_scanout;
wire [9:0] fbdic_tdisable_cnt_in;
wire fbdic_tdisable_start;
wire [9:0] fbdic_sbdiscnt;
wire [9:0] inv_fbdic_tdisable_cnt_in;
wire [9:0] inv_fbdic_tdisable_cnt;
wire ff_tdisable_cnt_scanin;
wire ff_tdisable_cnt_scanout;
wire fbdic_tdisable_start_in;
wire ff_tdisable_start_scanin;
wire ff_tdisable_start_scanout;
wire fbdic_tcalibrate_period_en;
wire [19:0] fbdic_tcalibrate_period_in;
wire pff_tcalibrate_period_wmr_scanin;
wire pff_tcalibrate_period_wmr_scanout;
wire [19:0] fbdic_tcalibrate_period;
wire fbdic_tcalibrate_done_en;
wire [19:0] fbdic_tcalibrate_cnt;
wire fbdic_tcalibrate_done_in;
wire ff_tcalibrate_done_scanin;
wire ff_tcalibrate_done_scanout;
wire [19:0] fbdic_tcalibrate_cnt_in;
wire [19:0] fbdic_sbibistcalperiod;
wire ff_tcalibrate_cnt_scanin;
wire ff_tcalibrate_cnt_scanout;
wire fbdic_tclktrain_min_en;
wire [15:0] fbdic_tclktrain_min_in;
wire [7:0] inv_fbdic_tclktrain_min_in;
wire [15:0] fbdic_tclktrain_min;
wire [7:0] inv_fbdic_tclktrain_min;
wire pff_tclktrain_min_wmr_scanin;
wire pff_tclktrain_min_wmr_scanout;
wire [15:0] fbdic_tclktrain_min_cnt_in;
wire [15:0] fbdic_tclktrain_min_cnt;
wire ff_tclktrain_min_cnt_scanin;
wire ff_tclktrain_min_cnt_scanout;
wire fbdic_enable_sync_count_in;
wire [1:0] fbdic_loopback;
wire ff_enable_sync_count_scanin;
wire ff_enable_sync_count_scanout;
wire fbdic_tclktrain_rst_done;
wire [3:0] fbdic0_ts_match_cnt;
wire [15:0] fbdic_tclktrain_timeout_cnt;
wire fbdic_tclktrain_ibst_done;
wire [9:0] fbdic_sbts_cnt;
wire fbdic_tclktrain_done_en;
wire [1:0] fbdic_tclktrain_done_in;
wire ff_tclktrain_done_scanin;
wire ff_tclktrain_done_scanout;
wire fbdic_tclktrain_timeout_en;
wire [15:0] fbdic_tclktrain_timeout_in;
wire [15:0] inv_fbdic_tclktrain_timeout_in;
wire [15:0] fbdic_tclktrain_timeout;
wire [15:0] inv_fbdic_tclktrain_timeout;
wire pff_tclktrain_timeout_wmr_scanin;
wire pff_tclktrain_timeout_wmr_scanout;
wire [15:0] fbdic_tclktrain_timeout_cnt_in;
wire fbdic_ibist_data_mode;
wire ff_tclktrain_timeout_cnt_scanin;
wire ff_tclktrain_timeout_cnt_scanout;
wire fbdic_testing_rst_done;
wire [7:0] fbdic_testing_timeout_cnt;
wire fbdic_testing_ibst_done;
wire ibtx_done;
wire fbdic_testing_done_en;
wire [1:0] fbdic_testing_done_in;
wire ff_testing_done_scanin;
wire ff_testing_done_scanout;
wire fbdic_testing_timeout_en;
wire [7:0] fbdic_testing_timeout_in;
wire [7:0] inv_fbdic_testing_timeout_in;
wire [7:0] fbdic_testing_timeout;
wire [7:0] inv_fbdic_testing_timeout;
wire pff_testing_timeout_wmr_scanin;
wire pff_testing_timeout_wmr_scanout;
wire [7:0] fbdic_testing_timeout_cnt_in;
wire ff_testing_timeout_cnt_scanin;
wire ff_testing_timeout_cnt_scanout;
wire fbdic_polling_rst_done;
wire [7:0] fbdic_polling_timeout_cnt;
wire fbdic_polling_ibst_done;
wire fbdic_polling_done_en;
wire [1:0] fbdic_polling_done_in;
wire ff_polling_done_scanin;
wire ff_polling_done_scanout;
wire fbdic_polling_timeout_en;
wire [7:0] fbdic_polling_timeout_in;
wire [7:0] inv_fbdic_polling_timeout_in;
wire [7:0] fbdic_polling_timeout;
wire [7:0] inv_fbdic_polling_timeout;
wire pff_polling_timeout_wmr_scanin;
wire pff_polling_timeout_wmr_scanout;
wire [7:0] fbdic_polling_timeout_cnt_in;
wire ff_polling_timeout_cnt_scanin;
wire ff_polling_timeout_cnt_scanout;
wire fbdic_config_rst_done;
wire [7:0] fbdic_config_timeout_cnt;
wire fbdic_config_ibst_done;
wire fbdic_config_done_en;
wire [1:0] fbdic_config_done_in;
wire ff_config_done_scanin;
wire ff_config_done_scanout;
wire fbdic_config_timeout_en;
wire [7:0] fbdic_config_timeout_in;
wire [7:0] inv_fbdic_config_timeout_in;
wire [7:0] fbdic_config_timeout;
wire [7:0] inv_fbdic_config_timeout;
wire pff_config_timeout_wmr_scanin;
wire pff_config_timeout_wmr_scanout;
wire [7:0] fbdic_config_timeout_cnt_in;
wire ff_config_timeout_cnt_scanin;
wire ff_config_timeout_cnt_scanout;
wire fbdic_per_rank_cke_en;
wire [15:0] fbdic_per_rank_cke_in;
wire [15:0] inv_fbdic_per_rank_cke_in;
wire [15:0] fbdic_per_rank_cke;
wire [15:0] inv_fbdic_per_rank_cke;
wire pff_per_rank_cke_wmr_scanin;
wire pff_per_rank_cke_wmr_scanout;
wire fbdic_cke_cmd_pend_in;
wire fbdic_cke_reg_d1;
wire fbdic_scr_frame_req_d5;
wire fbdic_issue_cke_cmd;
wire fbdic_cke_cmd_pend;
wire fbdic_config_reg_access_rdy;
wire ff_cke_reg_d1_scanin;
wire ff_cke_reg_d1_scanout;
wire [23:0] fbdic_lower_cke_cmd;
wire [23:0] fbdic_upper_cke_cmd;
wire fbdic_l0s_time_en;
wire [6:0] fbdic_l0s_time_in;
wire [6:0] fbdic_l0s_time;
wire [6:0] fbdic_l0s_time_out;
wire pff_l0s_time_wmr_scanin;
wire pff_l0s_time_wmr_scanout;
wire fbdic_l0s_enable;
wire fbdic_sync_el0s;
wire fbdic_l0s_stall_in;
wire fbdic_l0s_stall;
wire fbdic_mcu_idle_in;
wire ff_l0s_stall_scanin;
wire ff_l0s_stall_scanout;
wire fbdic_loopback_en;
wire [1:0] fbdic_loopback_in;
wire ff_loopback_scanin;
wire ff_loopback_scanout;
wire [5:0] fbdic_sds_pll_status;
wire sync_stspll5_scanin;
wire sync_stspll5_scanout;
wire sync_stspll4_scanin;
wire sync_stspll4_scanout;
wire sync_stspll3_scanin;
wire sync_stspll3_scanout;
wire sync_stspll2_scanin;
wire sync_stspll2_scanout;
wire sync_stspll1_scanin;
wire sync_stspll1_scanout;
wire sync_stspll0_scanin;
wire sync_stspll0_scanout;
wire [29:0] fbdic_sds_config;
wire [47:0] fbdic_sds_invert;
wire [31:0] fbdic_sds_testcfg;
wire ff_sds_test_status_scanin;
wire ff_sds_test_status_scanout;
wire [47:0] fbdic_sds_test_status;
wire fbdic_config_reg_addr_en;
wire [15:2] fbdic_config_reg_addr_in;
wire ff_config_reg_addr_scanin;
wire ff_config_reg_addr_scanout;
wire [15:2] fbdic_config_reg_addr;
wire fbdic_cnfgreg_wr_pend_in;
wire fbdic_config_reg_write;
wire fbdic_cnfgreg_wr_pend;
wire fbdic_cnfgreg_rd_pend_in;
wire fbdic_config_reg_read;
wire fbdic_cnfgreg_rd_pend;
wire fbdic_inj_crc_err;
wire fbdic_cnfgreg_rddata_vld;
wire ff_cnfg_access_pending_scanin;
wire ff_cnfg_access_pending_scanout;
wire [31:0] fbdic_cnfgreg_wr_data_in;
wire fbdic_cnfgreg_wr_data_en;
wire ff_cnfgreg_wr_data_scanin;
wire ff_cnfgreg_wr_data_scanout;
wire [31:0] fbdic_cnfgreg_wr_data;
wire [1:0] fbdic_sync_sd;
wire ff_config_reg_write_d1_scanin;
wire ff_config_reg_write_d1_scanout;
wire fbdic_config_reg_write_d1;
wire [47:0] fbdic_thermal_trip_in;
wire fbdic_thermal_trip_en;
wire fbdic_status_frame;
wire fbdic_status_parity_error_en;
wire ff_thermal_trip_scanin;
wire ff_thermal_trip_scanout;
wire [47:0] fbdic_thermal_trip;
wire fbdic_mcu_syndrome_en;
wire [30:0] fbdic_mcu_syndrome;
wire fbdic_fbu_error;
wire fbdic_aa;
wire fbdic_mcu_synd_aa;
wire [30:0] fbdic_mcu_syndrome_in;
wire [11:0] fbdic1_chnl_alert;
wire [11:0] fbdic0_chnl_alert;
wire fbdic_scr;
wire fbdic_fr;
wire fbdic_spe;
wire fbdic_af;
wire pff_mcu_syndrome_wmr_scanin;
wire pff_mcu_syndrome_wmr_scanout;
wire fbdic_mcu_synd_valid;
wire fbdic_mcu_synd_fr;
wire fbdic_fbu_error_in;
wire ff_fbu_error_scanin;
wire ff_fbu_error_scanout;
wire fbdic_inj_err_src_en;
wire [1:0] fbdic_inj_err_src_in;
wire pff_inj_err_src_wmr_scanin;
wire pff_inj_err_src_wmr_scanout;
wire [1:0] fbdic_inj_err_src;
wire fbdic_fbr_count_en;
wire [16:0] fbdic_fbr_count;
wire [16:0] fbdic_fbr_count_in;
wire pff_fbr_count_wmr_scanin;
wire pff_fbr_count_wmr_scanout;
wire fbdic_err_fbr_in;
wire ff_err_fbr_scanin;
wire ff_err_fbr_scanout;
wire ff_ts_data_scanin;
wire ff_ts_data_scanout;
wire [11:0] fbdic0_ts_data_in;
wire [11:0] fbdic1_ts_data_in;
wire [119:0] ibist_txdata;
wire [7:0] init_state;
wire [3:0] amb_id;
wire [11:0] fbdic_amb_mask;
wire fbdic_l0_state_in;
wire ts3_cnt_en;
wire [2:0] fbdic_l0_state_dly;
wire ff_l0_state_scanin;
wire ff_l0_state_scanout;
wire [2:0] fbdic_l0_state_dly_in;
wire ff_l0_state_dly_scanin;
wire ff_l0_state_dly_scanout;
wire [11:0] fbdic_ts_data_in;
wire ts0_cnt_en;
wire [11:0] ts0_data;
wire ts1_cnt_en;
wire [11:0] ts1_data;
wire ts2_cnt_en;
wire [11:0] ts2_data;
wire [11:0] ts3_data0;
wire [11:0] ts3_data1;
wire [3:0] ts0_cnt_in;
wire [3:0] ts0_cnt;
wire ff_ts0_cnt_scanin;
wire ff_ts0_cnt_scanout;
wire [5:0] ts1_cnt_in;
wire [5:0] ts1_cnt;
wire ff_ts1_cnt_scanin;
wire ff_ts1_cnt_scanout;
wire [2:0] ts2_cnt_in;
wire [2:0] ts2_cnt;
wire ff_ts2_cnt_scanin;
wire ff_ts2_cnt_scanout;
wire [3:0] ts2_seq_id;
wire [3:0] ts2_seq_id_in;
wire ts2_seq_id_en;
wire ts2_seq_id_clr;
wire ff_ts2_seq_id_scanin;
wire ff_ts2_seq_id_scanout;
wire [2:0] ts3_cnt_in;
wire [2:0] ts3_cnt;
wire ff_ts3_cnt_scanin;
wire ff_ts3_cnt_scanout;
wire [11:0] fbdic0_nb_data;
wire [11:0] fbdic1_nb_data;
wire [3:0] fbdic_sequence_en;
wire [1:0] fbdic_sequence_in;
wire [1:0] fbdic_sequence;
wire ff_sequence_scanin;
wire ff_sequence_scanout;
wire [11:0] fbdic0_ts_exp_data_in;
wire [11:0] fbdic0_ts0_exp_in;
wire [11:0] fbdic0_ts1_exp_in;
wire [11:0] fbdic0_ts2_exp_in;
wire [11:0] fbdic0_ts3_exp_in;
wire [11:0] fbdic1_ts_exp_data_in;
wire [11:0] fbdic1_ts0_exp_in;
wire [11:0] fbdic1_ts1_exp_in;
wire [11:0] fbdic1_ts2_exp_in;
wire [11:0] fbdic1_ts3_exp_in;
wire ff_ts_exp_data_scanin;
wire ff_ts_exp_data_scanout;
wire [11:0] fbdic0_ts_exp_data;
wire [11:0] fbdic1_ts_exp_data;
wire [5:0] fbdic0_nb_ts_cnt;
wire [4:0] fbdic_ch0_cap_reg;
wire [3:0] fbdic0_nb_ts2_seq_id;
wire [3:0] fbdic0_nb_ts2_seq_id_in;
wire fbdic0_nb_ts2_seq_id_en;
wire fbdic0_nb_ts2_seq_id_clr;
wire ff_nb_ts2_seq_id0_scanin;
wire ff_nb_ts2_seq_id0_scanout;
wire fbdic0_hdr_match;
wire [5:0] fbdic0_nb_ts_cnt_in;
wire fbdic0_nb_ts_cnt_en;
wire ff_nb_ts_cnt0_scanin;
wire ff_nb_ts_cnt0_scanout;
wire fbdic0_lane0_match;
wire fbdic0_lane1_match;
wire fbdic0_lane2_match;
wire fbdic0_ts_match_in;
wire fbdic0_ts_match;
wire ff_ts_match0_scanin;
wire ff_ts_match0_scanout;
wire [3:0] fbdic0_ts_match_cnt_in;
wire ff_ts_match0_cnt_scanin;
wire ff_ts_match0_cnt_scanout;
wire [5:0] fbdic1_nb_ts_cnt;
wire [4:0] fbdic_ch1_cap_reg;
wire [3:0] fbdic1_nb_ts2_seq_id;
wire [3:0] fbdic1_nb_ts2_seq_id_in;
wire fbdic1_nb_ts2_seq_id_en;
wire fbdic1_nb_ts2_seq_id_clr;
wire ff_nb_ts2_seq_id1_scanin;
wire ff_nb_ts2_seq_id1_scanout;
wire fbdic1_hdr_match;
wire [5:0] fbdic1_nb_ts_cnt_in;
wire fbdic1_nb_ts_cnt_en;
wire ff_nb_ts_cnt1_scanin;
wire ff_nb_ts_cnt1_scanout;
wire fbdic1_lane0_match;
wire fbdic1_lane1_match;
wire fbdic1_lane2_match;
wire fbdic1_ts_match_in;
wire [0:0] fbdic1_ts_match;
wire ff_ts_match1_scanin;
wire ff_ts_match1_scanout;
wire [3:0] fbdic1_ts_match_cnt_in;
wire [3:0] fbdic1_ts_match_cnt;
wire ff_ts_match1_cnt_scanin;
wire ff_ts_match1_cnt_scanout;
wire [15:0] fbdic_chnl_read_lat;
wire [7:0] fbdic_rt_lat1;
wire [7:0] fbdic_rt_lat0;
wire [7:0] fbdic_rt_lat_cntr0_in;
wire [7:0] fbdic_rt_lat_cntr0;
wire fbdic_rt_lat_cntr0_en;
wire fbdic_rt_lat_cntr0_clr;
wire ff_rt_lat_cntr0_scanin;
wire ff_rt_lat_cntr0_scanout;
wire fbdic_rt_lat0_en;
wire [7:0] fbdic_rt_lat0_in;
wire [7:0] inv_fbdic_rt_lat0_in;
wire [7:0] inv_fbdic_rt_lat0;
wire ff_rt_lat0_wmr_scanin;
wire ff_rt_lat0_wmr_scanout;
wire fbdic_rt_lat_cntr1_en;
wire [7:0] fbdic_rt_lat_cntr1_in;
wire [7:0] fbdic_rt_lat_cntr1;
wire fbdic_rt_lat_cntr1_clr;
wire ff_rt_lat_cntr1_scanin;
wire ff_rt_lat_cntr1_scanout;
wire fbdic_rt_lat1_en;
wire [7:0] fbdic_rt_lat1_in;
wire [7:0] inv_fbdic_rt_lat1_in;
wire [7:0] inv_fbdic_rt_lat1;
wire ff_rt_lat1_wmr_scanin;
wire ff_rt_lat1_wmr_scanout;
wire [4:0] fbdic_ch0_cap_reg_in;
wire fbdic_ch0_cap_reg_en;
wire ff_ch0_cap_reg_scanin;
wire ff_ch0_cap_reg_scanout;
wire [4:0] fbdic_ch1_cap_reg_in;
wire fbdic_ch1_cap_reg_en;
wire ff_ch1_cap_reg_scanin;
wire ff_ch1_cap_reg_scanout;
wire [9:0] fbdic_chnl_cap;
wire ff_kp_lnk_up_d1_scanin;
wire ff_kp_lnk_up_d1_scanout;
wire rdpctl_kp_lnk_up_d1;
wire fbdic_link_cnt_eq_3;
wire fbdic_link_cnt_eq_4_in;
wire ff_sync_frame_req_early_scanin;
wire ff_sync_frame_req_early_scanout;
wire fbdic_link_cnt_eq_4;
wire fbdic_link_cnt_eq_0_in;
wire fbdic_link_cnt_eq_0;
wire [2:0] fbdic_sync_frame_req_delay_in;
wire [2:0] fbdic_sync_frame_req_delay;
wire ff_sync_frame_req_delay_scanin;
wire ff_sync_frame_req_delay_scanout;
wire fbdic_sync_frame_req_d2;
wire fbdic_rd_cmd_a_d1;
wire fbdic_rd_cmd_a_d2;
wire fbdic_rd_cmd_a_d3;
wire ff_rd_cmd_a_d1_scanin;
wire ff_rd_cmd_a_d1_scanout;
wire fbdic_rd_cmd_a;
wire [5:0] fbdic_sync_frm_period;
wire [3:0] fbdic_scr_frame_req_dly_in;
wire [3:0] fbdic_scr_frame_req_dly;
wire fbdic_scr_frame_req_dly_en;
wire fbdic_scr_frame_req;
wire ff_scr_dly_scanin;
wire ff_scr_dly_scanout;
wire fbdic_scr_frame_req_d10;
wire fbdic_issue_pre_all_cmd_in;
wire [3:0] fbdic_pre_all_rank;
wire [3:0] fbdic_last_rank;
wire fbdic_issue_pre_all_cmd;
wire ff_issue_pre_all_cmd_scanin;
wire ff_issue_pre_all_cmd_scanout;
wire [3:0] fbdic_pre_all_rank_in;
wire ff_pre_all_rank_scanin;
wire ff_pre_all_rank_scanout;
wire [23:0] fbdic_act_cmd_a;
wire fbdic_wr_cmd_a;
wire [23:0] fbdic_rd_wr_cmd_a;
wire [23:0] fbdic_sync_cmd_a;
wire [23:0] fbdic_soft_chnl_reset_cmd;
wire [23:0] fbdic_a_cmd_in;
wire [1:0] fbdic_f_in;
wire ff_f_scanin;
wire ff_f_scanout;
wire ff_a_cmd_scanin;
wire ff_a_cmd_scanout;
wire fbdic_special_cmd_in;
wire ff_special_cmd_scanin;
wire ff_special_cmd_scanout;
wire fbdic_trans_id;
wire fbdic1_last_trans_id;
wire fbdic0_last_trans_id;
wire fbdic0_last_trans_id_in;
wire fbdic0_last_trans_id_en;
wire ff_last_trans_id0_scanin;
wire ff_last_trans_id0_scanout;
wire fbdic1_last_trans_id_in;
wire fbdic1_last_trans_id_en;
wire ff_last_trans_id1_scanin;
wire ff_last_trans_id1_scanout;
wire [23:0] fbdic_pre_all_cmd;
wire [23:0] fbdic_ref_cmd_b;
wire [35:0] fbdic_b_cmd;
wire [23:0] fbdic_sre_cmd_c;
wire [23:0] fbdic_pde_cmd_c;
wire [23:0] fbdic_srpdx_cmd_c;
wire [35:0] fbdic_c_cmd;
wire [71:0] fbdic_bc_cmd_in;
wire ff_bc_cmd_scanin;
wire ff_bc_cmd_scanout;
wire fbdic0_lane_align;
wire fbdic1_lane_align;
wire fbdic0_lane_align_in;
wire fbdic0_13_lanes_aligned;
wire fbdic0_lane_align_out;
wire fbdic1_lane_align_in;
wire fbdic1_13_lanes_aligned;
wire fbdic1_lane_align_out;
wire ff_lane_align_wmr_scanin;
wire ff_lane_align_wmr_scanout;
wire [7:0] fbdic_chnl_latency_cntr_in;
wire [7:0] fbdic_chnl_latency_cntr;
wire ff_chnl_latency_cntr_scanin;
wire ff_chnl_latency_cntr_scanout;
wire fbdic_latq_enq;
wire fbdic_latq_deq;
wire [11:0] fbdic_latq_dout;
wire fbdic_latq_empty;
wire fbdic_rddata_vld_d0;
wire ff_rddata_vld_d1_scanin;
wire ff_rddata_vld_d1_scanout;
wire fbdic_rddata_vld_d1;
wire fbdic_rddata_vld_d2;
wire fbdic_rddata_vld_d3;
wire fbdic_latq_deq_d1;
wire [11:8] fbdic_latq_dout_reg;
wire fbdic_latq_deq_d2;
wire fbdic_latq_deq_d3;
wire fbdic_latq_deq_d0;
wire ff_latq_deq_dly_scanin;
wire ff_latq_deq_dly_scanout;
wire fbdic_latq_dout_reg_en;
wire ff_latq_dout_reg_scanin;
wire ff_latq_dout_reg_scanout;
wire fbdic_scr_response_frame;
wire ff_status_frame_d1_scanin;
wire ff_status_frame_d1_scanout;
wire fbdic_status_frame_d1;
wire fbdic_scr_response_frame_d1;
wire fbdic_cnfgreg_rddata_vld_in;
wire [31:0] fbdic_cnfgreg_data_in;
wire fbdic_cnfgreg_data_32_in;
wire ff_cnfgreg_data_scanin;
wire ff_cnfgreg_data_scanout;
wire [32:0] fbdic_cnfgreg_data;
wire [3:0] fbdic_latq_xaction;
wire [7:0] fbd_delay;
wire inv_fbd_delay_0;
wire ff_fbd_delay_scanin;
wire ff_fbd_delay_scanout;
wire [11:0] fbdic_latq_din;
wire latq_scanin;
wire latq_scanout;
wire fbdic_latq_full;
wire [11:0] fbdic0_status_parity;
wire [11:0] fbdic1_status_parity;
wire [11:0] fbdic0_alert_asserted;
wire [11:0] fbdic1_alert_asserted;
wire fbdic_inj_sfp_err;
wire fbdic_alert_asserted_en;
wire fbdic_inj_aa_err;
wire fbdic_alert_frame_en;
wire fbdic_inj_af_err;
wire fbdic_status_parity_error_in;
wire fbdic_status_parity_error;
wire fbdic_status_parity_error_clr;
wire fbdic_alert_asserted_in;
wire fbdic_alert_asserted;
wire fbdic_alert_asserted_clr;
wire fbdic_alert_frame_in;
wire fbdic_alert_frame;
wire fbdic_alert_frame_clr;
wire fbdic_err_unrecov_in;
wire fbdic_err_recov_in;
wire ff_fbd_error_scanin;
wire ff_fbd_error_scanout;
wire fbdic_fbd_error_in;
wire ff_fbd_error_dly_scanin;
wire ff_fbd_error_dly_scanout;
wire fbdic_status_parity_error_en_d1;
wire fbdic_alert_asserted_en_d1;
wire fbdic_fbd_error_save_clr;
wire fbdic_spe_in;
wire fbdic_aa_in;
wire fbdic_af_in;
wire fbdic_scr_in;
wire fbdic_fr_in;
wire ff_fbd_error_save_scanin;
wire ff_fbd_error_save_scanout;
wire fbdic_chnl_alert_clr;
wire ff_chnl_alert_scanin;
wire ff_chnl_alert_scanout;
wire fbdic_train_seq;
wire fbdic_train_seq_l;
wire fbdic_txstart;
wire [1:0] fbdic0_cmd_crc_sel_in;
wire [2:0] fbdic0_data_crc_sel_in;
wire [1:0] fbdic1_cmd_crc_sel_in;
wire [2:0] fbdic1_data_crc_sel_in;
wire ff_crc_sel0_scanin;
wire ff_crc_sel0_scanout;
wire ff_crc_sel1_scanin;
wire ff_crc_sel1_scanout;
wire [23:0] fbdic_sbfibportctl;
wire [31:0] fbdic_sbfibpgctl;
wire [23:0] fbdic_sbfibpattbuf1;
wire [9:0] fbdic_sbfibtxmsk;
wire [9:0] fbdic_sbfibtxshft;
wire [23:0] fbdic_sbfibpattbuf2;
wire [9:0] fbdic_sbfibpatt2en;
wire [30:0] fbdic_sbfibinit;
wire [23:0] fbdic_sbibistmisc;
wire [23:0] fbdic_nbfibportctl;
wire [31:0] fbdic_nbfibpgctl;
wire [23:0] fbdic_nbfibpattbuf1;
wire [13:0] fbdic_nbfibrxmsk;
wire [13:0] fbdic_nbfibrxshft;
wire [13:0] fbdic_nbfibrxlnerr;
wire [23:0] fbdic_nbfibpattbuf2;
wire [13:0] fbdic_nbfibpatt2en;
wire fbdic_scr_qual;
wire fbdic_scr_qual_in;
wire scr_qual_scanin;
wire scr_qual_scanout;
wire fbdic_err_fast_chnl_reset_p2;
wire ff_err_fast_chnl_reset_scanin;
wire ff_err_fast_chnl_reset_scanout;
wire fbdic_err_fast_chnl_reset_p1;
wire ff_err_recov_scanin;
wire ff_err_recov_scanout;
wire ff_err_unrecov_scanin;
wire ff_err_unrecov_scanout;
wire [0:0] inv_fbdic_err_state_in;
wire [0:0] inv_fbdic_err_state;
wire ff_err_state_scanin;
wire ff_err_state_scanout;
wire fbdic_sbfibportctl_en;
wire [5:0] fbdic_sbfibportctl_in;
wire pff_sbfibportctl_wmr_scanin;
wire pff_sbfibportctl_wmr_scanout;
wire fbdic_ibtx_done_flag_in;
wire fbdic_ibtx_done_flag;
wire pff_ibtx_done_flag_wmr_scanin;
wire pff_ibtx_done_flag_wmr_scanout;
wire fbdic_ibtx_start_en;
wire pff_ibtx_start_wmr_scanin;
wire pff_ibtx_start_wmr_scanout;
wire [31:0] fbdic_sbfibpgctl_reset_val;
wire fbdic_sbfibpgctl_en;
wire [31:0] fbdic_sbfibpgctl_in;
wire [31:0] fbdic_sbfibpgctl_out;
wire pff_sbfibpgctl_wmr_scanin;
wire pff_sbfibpgctl_wmr_scanout;
wire [23:0] fbdic_sbfibpattbuf1_reset_val;
wire fbdic_sbfibpattbuf1_en;
wire [23:0] fbdic_sbfibpattbuf1_in;
wire [23:0] fbdic_sbfibpattbuf1_out;
wire pff_sbfibpattbuf1_wmr_scanin;
wire pff_sbfibpattbuf1_wmr_scanout;
wire [9:0] fbdic_sbfibtxmsk_reset_val;
wire fbdic_sbfibtxmsk_en;
wire [9:0] fbdic_sbfibtxmsk_in;
wire [9:0] fbdic_sbfibtxmsk_out;
wire pff_sbfibtxmsk_wmr_scanin;
wire pff_sbfibtxmsk_wmr_scanout;
wire [9:0] fbdic_sbfibtxshft_reset_val;
wire fbdic_sbfibtxshft_en;
wire [9:0] fbdic_sbfibtxshft_in;
wire [9:0] fbdic_sbfibtxshft_out;
wire pff_sbfibtxshft_wmr_scanin;
wire pff_sbfibtxshft_wmr_scanout;
wire [23:0] fbdic_sbfibpattbuf2_reset_val;
wire fbdic_sbfibpattbuf2_en;
wire [23:0] fbdic_sbfibpattbuf2_in;
wire [23:0] fbdic_sbfibpattbuf2_out;
wire pff_sbfibpattbuf2_wmr_scanin;
wire pff_sbfibpattbuf2_wmr_scanout;
wire fbdic_sbfibpatt2en_en;
wire [9:0] fbdic_sbfibpatt2en_in;
wire pff_sbfibpatt2en_wmr_scanin;
wire pff_sbfibpatt2en_wmr_scanout;
wire [30:0] fbdic_sbfibinit_reset_val;
wire fbdic_sbfibinit_en;
wire [30:0] fbdic_sbfibinit_in;
wire [30:0] fbdic_sbfibinit_out;
wire pff_sbfibinit_wmr_scanin;
wire pff_sbfibinit_wmr_scanout;
wire [9:0] fbdic_sbts0cnt;
wire [9:0] fbdic_sbts1cnt;
wire fbdic_sbibistiniten;
wire fbdic_sbts_cnt_decr;
wire [9:0] fbdic_sbts_cnt_in;
wire ff_sbts_cnt_scanin;
wire ff_sbts_cnt_scanout;
wire [23:0] fbdic_sbibistmisc_reset_val;
wire fbdic_sbibistmisc_en;
wire [23:0] fbdic_sbibistmisc_in;
wire [23:0] fbdic_sbibistmisc_out;
wire pff_sbibistmisc_wmr_scanin;
wire pff_sbibistmisc_wmr_scanout;
wire [3:0] fbdic_ibist_ambid;
wire fbdic_nbfibportctl_en;
wire [5:0] fbdic_nbfibportctl_in;
wire pff_nbfibportctl_wmr_scanin;
wire pff_nbfibportctl_wmr_scanout;
wire [9:0] ibrx_errcnt;
wire [3:0] ibrx_errlnnum;
wire [1:0] ibrx_errstat;
wire fbdic_ibrx_done_flag_in;
wire ibrx_done;
wire fbdic_ibrx_start_ld;
wire fbdic_ibrx_done_flag;
wire pff_ibrx_done_flag_scanin;
wire pff_ibrx_done_flag_scanout;
wire fbdic_ibrx_start_en;
wire pff_ibrx_start_wmr_scanin;
wire pff_ibrx_start_wmr_scanout;
wire fbdic_ibrx_start;
wire [31:0] fbdic_nbfibpgctl_reset_val;
wire fbdic_nbfibpgctl_en;
wire [31:0] fbdic_nbfibpgctl_in;
wire [31:0] fbdic_nbfibpgctl_out;
wire pff_nbfibpgctl_wmr_scanin;
wire pff_nbfibpgctl_wmr_scanout;
wire [23:0] fbdic_nbfibpattbuf1_reset_val;
wire fbdic_nbfibpattbuf1_en;
wire [23:0] fbdic_nbfibpattbuf1_in;
wire [23:0] fbdic_nbfibpattbuf1_out;
wire pff_nbfibpattbuf1_wmr_scanin;
wire pff_nbfibpattbuf1_wmr_scanout;
wire [13:0] fbdic_nbfibrxmsk_reset_val;
wire fbdic_nbfibrxmsk_en;
wire [13:0] fbdic_nbfibrxmsk_in;
wire [13:0] fbdic_nbfibrxmsk_out;
wire pff_nbfibrxmsk_wmr_scanin;
wire pff_nbfibrxmsk_wmr_scanout;
wire [13:0] fbdic_nbfibrxshft_reset_val;
wire fbdic_nbfibrxshft_en;
wire [13:0] fbdic_nbfibrxshft_in;
wire [13:0] fbdic_nbfibrxshft_out;
wire pff_nbfibrxshft_wmr_scanin;
wire pff_nbfibrxshft_wmr_scanout;
wire [13:0] ibrx_rxerrstat;
wire [23:0] fbdic_nbfibpattbuf2_reset_val;
wire fbdic_nbfibpattbuf2_en;
wire [23:0] fbdic_nbfibpattbuf2_in;
wire [23:0] fbdic_nbfibpattbuf2_out;
wire pff_nbfibpattbuf2_wmr_scanin;
wire pff_nbfibpattbuf2_wmr_scanout;
wire fbdic_nbfibpatt2en_en;
wire [13:0] fbdic_nbfibpatt2en_in;
wire pff_nbfibpatt2en_wmr_scanin;
wire pff_nbfibpatt2en_wmr_scanout;
wire fbdic_ibist_data_mode_in;
wire ff_ibist_data_scanin;
wire ff_ibist_data_scanout;
wire fbdic_ibist_done_in;
wire ff_ibist_done_scanin;
wire ff_ibist_done_scanout;
wire [39:0] fbdic_ibrx_data;
wire fbdic_ibrx_lane0_s0_match;
wire fbdic_ibrx_lane1_s0_match;
wire fbdic_ibrx_lane2_s0_match;
wire fbdic_ibrx_lane0_s1_match;
wire fbdic_ibrx_lane1_s1_match;
wire fbdic_ibrx_lane2_s1_match;
wire fbdic_ibrx_s0_match;
wire fbdic_ibrx_s1_match;
wire fbdic_s0_s1_s0_s1;
wire fbdic_s0_s1_s0_d1;
wire fbdic_s0_s1_s0;
wire fbdic_s0_s1_d1;
wire fbdic_s0_s1;
wire fbdic_s0_d1;
wire ff_rx_s0s1_match_dly_scanin;
wire ff_rx_s0s1_match_dly_scanout;
wire fbdic_rxstart;
wire ibist_scanin;
wire ibist_scanout;
wire ff_err_fbxi_scanin;
wire ff_err_fbxi_scanout;
wire fbdic_err_fbri;
wire fbdic_err_fbui;
wire fbdic_fbr_injected_in;
wire fbdic_fbr_injected;
wire ff_fbr_injected_scanin;
wire ff_fbr_injected_scanout;
wire ff_serdes_dtm_scanin;
wire ff_serdes_dtm_scanout;
wire fbdic_serdes_dtm_out;
wire [2:0] fbdic_dtm_zero_cnt_in;
wire fbdic_dtm_state;
wire [2:0] fbdic_dtm_zero_cnt;
wire ff_dtm_zero_cnt_scanin;
wire ff_dtm_zero_cnt_scanout;
wire fbdic_dtm_state_in;
wire ff_dtm_state_scanin;
wire ff_dtm_state_scanout;
wire fbdic_srds_dtm_muxsel_in;
wire ff_srds_dtm_muxsel_scanin;
wire ff_srds_dtm_muxsel_scanout;
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spares_scanin;
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
wire si_16;
wire so_16;
wire spare16_flop_unused;
wire spare16_buf_32x_unused;
wire spare16_nand3_8x_unused;
wire spare16_inv_8x_unused;
wire spare16_aoi22_4x_unused;
wire spare16_buf_8x_unused;
wire spare16_oai22_4x_unused;
wire spare16_inv_16x_unused;
wire spare16_nand2_16x_unused;
wire spare16_nor3_4x_unused;
wire spare16_nand2_8x_unused;
wire spare16_buf_16x_unused;
wire spare16_nor2_16x_unused;
wire spare16_inv_32x_unused;
wire si_17;
wire so_17;
wire spare17_flop_unused;
wire spare17_buf_32x_unused;
wire spare17_nand3_8x_unused;
wire spare17_inv_8x_unused;
wire spare17_aoi22_4x_unused;
wire spare17_buf_8x_unused;
wire spare17_oai22_4x_unused;
wire spare17_inv_16x_unused;
wire spare17_nand2_16x_unused;
wire spare17_nor3_4x_unused;
wire spare17_nand2_8x_unused;
wire spare17_buf_16x_unused;
wire spare17_nor2_16x_unused;
wire spare17_inv_32x_unused;
wire si_18;
wire so_18;
wire spare18_buf_32x_unused;
wire spare18_nand3_8x_unused;
wire spare18_inv_8x_unused;
wire spare18_aoi22_4x_unused;
wire spare18_buf_8x_unused;
wire spare18_oai22_4x_unused;
wire spare18_inv_16x_unused;
wire spare18_nand2_16x_unused;
wire spare18_nor3_4x_unused;
wire spare18_nand2_8x_unused;
wire spare18_buf_16x_unused;
wire spare18_nor2_16x_unused;
wire spare18_inv_32x_unused;
wire si_19;
wire so_19;
wire spare19_flop_unused;
wire spare19_buf_32x_unused;
wire spare19_nand3_8x_unused;
wire spare19_inv_8x_unused;
wire spare19_aoi22_4x_unused;
wire spare19_buf_8x_unused;
wire spare19_oai22_4x_unused;
wire spare19_inv_16x_unused;
wire spare19_nand2_16x_unused;
wire spare19_nor3_4x_unused;
wire spare19_nand2_8x_unused;
wire spare19_buf_16x_unused;
wire spare19_nor2_16x_unused;
wire spare19_inv_32x_unused;
wire si_20;
wire so_20;
wire spare20_buf_32x_unused;
wire spare20_nand3_8x_unused;
wire spare20_inv_8x_unused;
wire spare20_aoi22_4x_unused;
wire spare20_buf_8x_unused;
wire spare20_oai22_4x_unused;
wire spare20_inv_16x_unused;
wire spare20_nand2_16x_unused;
wire spare20_nor3_4x_unused;
wire spare20_nand2_8x_unused;
wire spare20_buf_16x_unused;
wire spare20_nor2_16x_unused;
wire spare20_inv_32x_unused;
wire si_21;
wire so_21;
wire spare21_flop_unused;
wire spare21_buf_32x_unused;
wire spare21_nand3_8x_unused;
wire spare21_inv_8x_unused;
wire spare21_aoi22_4x_unused;
wire spare21_buf_8x_unused;
wire spare21_oai22_4x_unused;
wire spare21_inv_16x_unused;
wire spare21_nand2_16x_unused;
wire spare21_nor3_4x_unused;
wire spare21_nand2_8x_unused;
wire spare21_buf_16x_unused;
wire spare21_nor2_16x_unused;
wire spare21_inv_32x_unused;
wire spares_scanout;
wire fbdtm_wmr_scanin;
wire fbdtm_wmr_scanout;
wire fbdtm_scanin;
wire fbdtm_scanout;
wire wmr_scan_out;


output	[4:0]	fbdic_data_sel;
output 	[11:0]	fbdic0_ts_data;
output 	[11:0]	fbdic1_ts_data;
output 	[119:0]	fbdic_ibist_data;
output 	[1:0]	fbdic_f;
output		fbdic_f_1_l;
output		fbdic0_chnl_disable;
output		fbdic1_chnl_disable;
output 	[23:0]	fbdic_a_cmd;
output 	[71:0]	fbdic_bc_cmd;
output 	[1:0]	fbdic0_cmd_crc_sel;
output 	[2:0]	fbdic0_data_crc_sel;
output		fbdic0_sb_failover;
output		fbdic0_sb_failover_l;
output	[8:0]	fbdic0_sb_failover_mask;
output	[8:0]	fbdic0_sb_failover_mask_l;
output		fbdic0_nb_failover;
output		fbdic0_nb_failover_l;
output	[12:0]	fbdic0_nb_failover_mask;
output	[12:0]	fbdic0_nb_failover_mask_l;
output 	[1:0]	fbdic1_cmd_crc_sel;
output 	[2:0]	fbdic1_data_crc_sel;
output		fbdic1_sb_failover;
output		fbdic1_sb_failover_l;
output	[8:0]	fbdic1_sb_failover_mask;
output	[8:0]	fbdic1_sb_failover_mask_l;
output		fbdic1_nb_failover;
output		fbdic1_nb_failover_l;
output	[12:0]	fbdic1_nb_failover_mask;
output	[12:0]	fbdic1_nb_failover_mask_l;

output 	[65:0]	fbdic_ucb_rd_data;
output		fbdic_train_state;
output		fbdic_disable_state;
output		fbdic_enable_sync_count;

output		fbdic_sync_frame_req_early3;
output		fbdic_sync_frame_req_early2;
output		fbdic_sync_frame_req_early1;
output		fbdic_sync_frame_req;
output		fbdic_sync_frame_req_d1;
output		fbdic_scr_frame_req_d4;
output		fbdic_l0_state;
output		fbdic_l0s_lfsr_stall;
output		fbdic_err_fast_reset_done;
output		fbdic_chnl_reset_error;
output		fbdic_chnl_reset_error_mode;

output		fbdic_special_cmd;
output		fbdic_special_cmd_l;
output		fbdic_ibrx_data_sel;
output		fbdic_ibrx_data_sel_l;

output		fbdic_rddata_vld;
output		fbdic_rddata_vld_l;
output	[1:0]	fbdic_woq_free;
output		fbdic_clear_wrq_ent;
output		fbdic_error_mode;		// error mode signal to drif to stall transaction issue
output		fbdic_fbd_error;		// Error mode signal for Debug bus
output		fbdic_crc_error;		// CRC error to rdpctl/drif to retry transaction
output		fbdic_err_unrecov;		// Unrecoverable error signal for MCU error status reg
output		fbdic_err_recov;		// Recoverable error signal for MCU error status reg

output		fbdic_err_fbr;			// FBR count interrupt

output		fbdic0_inc_wptr;
output	[13:0]	fbdic0_inc_rptr;
output		fbdic0_clr_ptrs;
output		fbdic1_inc_wptr;
output	[13:0]	fbdic1_inc_rptr;
output		fbdic1_clr_ptrs;

output		fbdic_idle_lfsr_reset;

output		mcu_fsr0_cfgpll_enpll;
output		mcu_fsr1_cfgpll_enpll;
output	[1:0]	mcu_fsr01_cfgpll_lb;
output	[3:0]	mcu_fsr01_cfgpll_mpy;
output		mcu_fsr0_cfgrx_enrx;
output		mcu_fsr1_cfgrx_enrx;
output		mcu_fsr0_cfgrx_entest;
output		mcu_fsr1_cfgrx_entest;
output		mcu_fsr0_cfgrx_align;
output		mcu_fsr1_cfgrx_align;
output	[13:0]	mcu_fsr0_cfgrx_invpair;
output	[13:0]	mcu_fsr1_cfgrx_invpair;
output	[3:0]	mcu_fsr01_cfgrx_eq;
output	[2:0]	mcu_fsr01_cfgrx_cdr;
output	[2:0]	mcu_fsr01_cfgrx_term;
output		mcu_fsr0_cfgtx_entx;
output		mcu_fsr1_cfgtx_entx;
output		mcu_fsr0_cfgtx_entest;
output		mcu_fsr1_cfgtx_entest;
output		mcu_fsr0_cfgtx_enidl;
output		mcu_fsr1_cfgtx_enidl;
output	[9:0]	mcu_fsr0_cfgtx_invpair;
output	[9:0]	mcu_fsr1_cfgtx_invpair;
output		mcu_fsr01_cfgtx_enftp;
output	[3:0]	mcu_fsr01_cfgtx_de;
output	[2:0]	mcu_fsr01_cfgtx_swing;
output		mcu_fsr01_cfgtx_cm;
output	[1:0]	mcu_fsr01_cfgrtx_rate;
output	[11:0]	mcu_fsr0_testcfg;
output	[11:0]	mcu_fsr1_testcfg;

output		fbdic_link_cnt_en;
output	[5:0]	fbdic_link_cnt_reset;
output		rdpctl_kp_lnk_up;
output		rdpctl_kp_lnk_up_clr;

output		fbdic_serdes_dtm;
output		fbdic_srds_dtm_muxsel;

output		fbdic_cfgrd_crc_error;

output		fbdic_mcu_idle;

input [13:0]	fbd0_elect_idle;
input [13:0]	fbd1_elect_idle;
input [13:0]	fbd0_frame_lock;
input [13:0]	fbd1_frame_lock;
input	[13:0]	fbd0_testfail;
input	[13:0]	fbd1_testfail;

input		drif_ucb_wr_req_vld;
input		drif_ucb_rd_req_vld;
input [12:0]	drif_ucb_addr;
input [63:0]	drif_ucb_data;

input [39:0]	lndskw0_data;
input [39:0]	lndskw1_data;

input [167:40]	fbdird_ibrx_data;

input [2:0]	drif_dram_cmd_a;
input [15:0]	drif_dram_addr_a;
input [2:0]	drif_dram_bank_a;
input [2:0]	drif_dram_dimm_a;
input		drif_dram_rank_a;

input [2:0]	drif_dram_cmd_b;
input [15:0]	drif_dram_addr_b;
input [2:0]	drif_dram_bank_b;
input [2:0]	drif_dram_dimm_b;
input		drif_dram_rank_b;

input		drif_wdata_wsn;
input		woq_err_st_wait_free;

input [2:0]	drif_dram_cmd_c;
input [15:0]	drif_dram_addr_c;
input [2:0]	drif_dram_bank_c;
input [2:0]	drif_dram_dimm_c;
input		drif_dram_rank_c;

input		drif_single_channel_mode;
input		drif_branch_disabled;
input		drif_mcu_idle;
input		drif_cke_reg;
input		drif_stacked_dimm;
input	[2:0]	drif_num_dimms;
input		rdpctl_fifo_empty;
input		rdpctl_crc_recov_err;
input		rdpctl_crc_unrecov_err;
input		rdpctl_mask_err;
input		drif_dbg_trig_reg_ld;
input	[5:0]	fdout_link_cnt;

input		drif_err_state_crc_fr;

input		rdata_err_fbui;
input		rdata_err_fbri;

input		fbdird_crc_cmp0_0;
input		fbdird_crc_cmp0_1;
input		fbdird_crc_cmp1_0;
input		fbdird_crc_cmp1_1;

input [13:0]	lndskw0_ts0_hdr_match;
input [13:0]	lndskw1_ts0_hdr_match;
input [11:0]	lndskw0_status_parity;
input [11:0]	lndskw1_status_parity;
input [13:0]	lndskw0_idle_match;
input [13:0]	lndskw1_idle_match;
input [13:0]	lndskw0_alert_match;
input [13:0]	lndskw1_alert_match;
input [11:0]	lndskw0_alert_asserted;
input [11:0]	lndskw1_alert_asserted;
input [11:0]	lndskw0_nbde;
input [11:0]	lndskw1_nbde;
input [23:0]	lndskw0_thermal_trip;
input [23:0]	lndskw1_thermal_trip;

input [31:0]	fbdird0_cnfgreg_data;
input [31:0]	fbdird1_cnfgreg_data;

input	[2:0]	fsr0_mcu_stspll_lock;
input	[2:0]	fsr1_mcu_stspll_lock;
input	[9:0]	fsr0_mcu_ststx_testfail;
input	[9:0]	fsr1_mcu_ststx_testfail;

input		rdpctl_dtm_atspeed;
input		ccu_serdes_dtm;
input		mcu_gnd;

input		drl2clk;
input 		scan_in;
output		scan_out;
input 		wmr_scan_in;
output		fbdic_wmr_scanout;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		aclk_wmr;
input		tcu_scan_en;
input		wmr_protect;
input		tcu_mcu_testmode;

input 		fbdtm_si;
output		fbdtm_so;
input 		fbdtm_wmr_si;
output		fbdtm_wmr_so;

// Code
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// 0in set_clock drl2clk -default
// 0in default_reset tcu_scan_en
mcu_fbdic_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(drl2clk),
 	.l1en (1'b1),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

// 
reg 	[6:0]	fbdic_err_state_in;

/////////////////////////////////
// REGISTERS
/////////////////////////////////

/////////////////////////////////
// FBD Initialization State Register
/////////////////////////////////
assign fbdic_fbd_state_ld = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h800;
assign fbdic_fbd_state_en = fbdic_fbd_state_ld | 
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h0 & fbdic_tdisable_done |
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h1 & fbdic_tcalibrate_done |
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h2 & (fbdic_tclktrain_done[0] | fbdic_tclktrain_to_done) |
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h3 & (fbdic_testing_done[0] | fbdic_testing_to_done) |
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h4 & (fbdic_polling_done[0] | fbdic_polling_to_done) |
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h5 & (fbdic_config_done[0] | fbdic_config_to_done) |
	fbdic_fbd_state[2:0] == 3'h7 & fbdic_sync_frame_req_d4 |
	fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_dtm_fbd_state0_en | fbdic_dtm_fbd_state2_en | 
	fbdic_dtm_fbd_state6_en | rdpctl_kp_lnk_up_clr;

assign fbdic_fbd_chnl_init_seq = fbdic_chnl_reset[0] | fbdic_ibtx_start | fbdic_ibist_done;

assign fbdic_fbd_state_in[2:0] = fbdic_fbd_state_ld ? drif_ucb_data[2:0] :
	fbdic_fbd_state[2:0] == 3'h0 & fbdic_tdisable_done & (fbdic_chnl_reset[0] & fbdic_fast_reset | 
			fbdic_ibtx_start & ~fbdic_sbcaliben | 
			fbdic_chnl_reset[0] & ~fbdic_fast_reset & fbdic_tcalibrate_done |
			fbdic_ibtx_start & fbdic_sbcaliben & fbdic_tcalibrate_done) | fbdic_dtm_fbd_state2_en ? 3'h2 :
	fbdic_fbd_state[2:0] == 3'h0 & fbdic_tdisable_done & (fbdic_chnl_reset[0] & ~fbdic_fast_reset |
					fbdic_ibtx_start & fbdic_sbcaliben) ? 3'h1 :
	fbdic_fbd_chnl_init_seq & (fbdic_fbd_state[2:0] == 3'h1 & fbdic_tcalibrate_done |
		fbdic_fbd_state[2:0] == 3'h2 & fbdic_tclktrain_to_done |
		fbdic_fbd_state[2:0] == 3'h3 & fbdic_testing_to_done |
		fbdic_fbd_state[2:0] == 3'h4 & fbdic_polling_to_done |
		fbdic_fbd_state[2:0] == 3'h5 & fbdic_config_to_done) | fbdic_dtm_fbd_state0_en ? 3'h0 :
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h2 & fbdic_tclktrain_done[0] ? 3'h3 :
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h3 & fbdic_testing_done[0] ? 3'h4 :
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h4 & fbdic_polling_done[0] ? 3'h5 :
	fbdic_fbd_chnl_init_seq & fbdic_fbd_state[2:0] == 3'h5 & fbdic_config_done[0] | 
		fbdic_dtm_fbd_state6_en | rdpctl_kp_lnk_up_clr ? 3'h6 : 
	fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_fbd_state[2:0] == 3'h7 & fbdic_sync_frame_req_d4 ? 3'h0 : 
	fbdic_fbd_state[2:1] == 2'h3 & fbdic_fbd_state_ld & drif_ucb_data[2:0] == 3'h0 ? 3'h7 : 3'h0;

assign fbdic_fbd_state_in[7:3] = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h800 ?
					drif_ucb_data[7:3] : fbdic_fbd_state[7:3];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 pff_fbd_state  ( // FS:wmr_protect
	.scan_in(pff_fbd_state_wmr_scanin),
	.scan_out(pff_fbd_state_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_fbd_state_in[6:3]),
	.dout(fbdic_fbd_state[6:3]),
	.en(fbdic_fbd_state_en),
	.l1clk(l1clk),
  .soclk(soclk));

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 ff_fbd_state  (
	.scan_in(ff_fbd_state_scanin),
	.scan_out(ff_fbd_state_scanout),
	.din({fbdic_fbd_state_in[7],fbdic_fbd_state_in[2:0]}),
	.dout({fbdic_fbd_state[7],fbdic_fbd_state[2:0]}),
	.en(fbdic_fbd_state_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_disable_state = fbdic_fbd_state[2:0] == 3'h0;
assign fbdic_calibrate_state = fbdic_fbd_state[2:0] == 3'h1;
assign fbdic_testing_state = fbdic_fbd_state[2:0] == 3'h3;
assign fbdic_polling_state = fbdic_fbd_state[2:0] == 3'h4;
assign fbdic_config_state = fbdic_fbd_state[2:0] == 3'h5;

/////////////////////////////////
// FBD Fast Reset Flag
/////////////////////////////////
assign fbdic_fast_reset_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h808;
assign fbdic_fast_reset_in[2:0] = drif_ucb_data[2:0];

assign fbdic_fast_reset_3_en = fbdic_fast_reset_en | fbdic_sync_ier_enable & ~fbdic_l0_state;
assign fbdic_fast_reset_in[3] = drif_ucb_data[3] & fbdic_l0_state;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_1 pff_fast_reset_3  ( // FS:wmr_protect
	.scan_in(pff_fast_reset_wmr_scanin),
	.scan_out(pff_fast_reset_3_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_fast_reset_in[3]),
	.dout(fbdic_sync_ier_enable),
	.en(fbdic_fast_reset_3_en),
	.l1clk(l1clk),
  .soclk(soclk));

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 pff_fast_reset  ( // FS:wmr_protect
	.scan_in(pff_fast_reset_3_wmr_scanout),
	.scan_out(pff_fast_reset_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_fast_reset_in[2:0]),
	.dout({fbdic_sync_r[1:0], fbdic_fast_reset}),
	.en(fbdic_fast_reset_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_sync_ier_in = fbdic_sync_ier_enable;

mcu_fbdic_ctl_msff_ctl_macro ff_sync_ier (
	.scan_in(ff_sync_ier_scanin),
	.scan_out(ff_sync_ier_scanout),
	.din(fbdic_sync_ier_in),
	.dout(fbdic_sync_ier),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//`ifdef MCU_BUG_118987
//assign fbdic_fr_issued_in = fbdic_err_fast_chnl_reset | fast_reset_err ? 1'b1 : 
//			    ~(drif_err_state_crc_fr | fbdic_err_state[`FBDIC_ERR_FASTRST]) | 
//				drif_err_state_crc_fr & fbdic_err_state[`FBDIC_ERR_FASTRST] ? 1'b0 : fbdic_fr_issued;
//`else
assign fbdic_fr_issued_in = fbdic_err_fast_chnl_reset | fast_reset_err ? 1'b1 : 
			    ~(drif_err_state_crc_fr | fbdic_err_state[`FBDIC_ERR_FASTRST]) ? 1'b0 : fbdic_fr_issued;
//`endif

mcu_fbdic_ctl_msff_ctl_macro ff_fr_issued (
	.scan_in(ff_fr_issued_scanin),
	.scan_out(ff_fr_issued_scanout),
	.din(fbdic_fr_issued_in),
	.dout(fbdic_fr_issued),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Recalibrate not supported
assign fbdic_sync_erc = 1'b0;

/////////////////////////////////
// FBD Channel Reset (Initialization) Flag
/////////////////////////////////

assign fast_reset_err_on_first_sync = fbdic_idle_lfsr_reset_d1 & ~fbdic_idle_lfsr_reset & ~fbdic_idle_frame ;

assign fast_reset_err = fast_reset_err_on_first_sync | woq_err_st_wait_free & fbdic_error_mode;

assign fbdic_chnl_reset_ld = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h810 & drif_ucb_data[0] |
			     fbdic_err_fast_chnl_reset | fast_reset_err;
assign fbdic_chnl_reset_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h810 | fbdic_chnl_reset_clr | 
			     fbdic_err_fast_chnl_reset | fast_reset_err;
assign fbdic_chnl_reset_in[1:0] = fbdic_chnl_reset_clr ? {fbdic_chnl_reset_error, 1'b0} : 
				  fbdic_err_fast_chnl_reset | fast_reset_err ? 2'h1 : drif_ucb_data[1:0];
assign fbdic_chnl_reset_clr = fbdic_chnl_reset[0] & fbdic_fbd_state[2:0] == 3'h5 & fbdic_config_done[0] |
				fbdic_chnl_reset_error;
assign fbdic_chnl_reset_error = fbdic_tclktrain_to_done | fbdic_testing_to_done | 
				fbdic_polling_to_done | fbdic_config_to_done;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_1 pff_chnl_reset1  ( // FS:wmr_protect
	.scan_in(pff_chnl_reset1_wmr_scanin),
	.scan_out(pff_chnl_reset1_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_chnl_reset_in[1]),
	.dout(fbdic_chnl_reset[1]),
	.en(fbdic_chnl_reset_en),
	.l1clk(l1clk),
  .soclk(soclk));

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_1 pff_chnl_reset0  (
	.scan_in(pff_chnl_reset0_scanin),
	.scan_out(pff_chnl_reset0_scanout),
	.din(fbdic_chnl_reset_in[0]),
	.dout(fbdic_chnl_reset[0]),
	.en(fbdic_chnl_reset_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_chnl_reset_error_mode_in = fbdic_chnl_reset_error ? 1'b1 : 
					(|fbdic_fbd_state[2:0]) ? 1'b0 : fbdic_chnl_reset_error_mode;
mcu_fbdic_ctl_msff_ctl_macro ff_chnl_reset_error_mode (
	.scan_in(ff_chnl_reset_error_mode_scanin),
	.scan_out(ff_chnl_reset_error_mode_scanout),
	.din(fbdic_chnl_reset_error_mode_in),
	.dout(fbdic_chnl_reset_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD TS1 SB to NB Mapping Register
/////////////////////////////////
assign fbdic_sb2nb_map_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h818;
assign fbdic_sb2nb_map_in[3:0] = drif_ucb_data[3:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 pff_sb2nb_map  ( // FS:wmr_protect
	.scan_in(pff_sb2nb_map_wmr_scanin),
	.scan_out(pff_sb2nb_map_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sb2nb_map_in[3:0]),
	.dout(fbdic_sb2nb_map[3:0]),
	.en(fbdic_sb2nb_map_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_ibrx_data_sel = fbdic_sb2nb_map[3];
assign fbdic_ibrx_data_sel_l = ~fbdic_sb2nb_map[3];

/////////////////////////////////
// FBD TS1 Test Parameter Register
/////////////////////////////////
assign fbdic_amb_test_param_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h820;
assign fbdic_amb_test_param_in[23:0] = drif_ucb_data[23:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_amb_test_param  ( // FS:wmr_protect
	.scan_in(pff_amb_test_param_wmr_scanin),
	.scan_out(pff_amb_test_param_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_amb_test_param_in[23:0]),
	.dout(fbdic_amb_test_param[23:0]),
	.en(fbdic_amb_test_param_en),
	.l1clk(l1clk),
  .soclk(soclk));

/////////////////////////////////
// FBD TS3 Failover Configuration Register - reset to 16'hffff
/////////////////////////////////

assign fbdic_failover_config_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h828;
assign fbdic_failover_config_in[15:0] = drif_ucb_data[15:0];

assign inv_fbdic_failover_config_in[15:0] = ~fbdic_failover_config_in[15:0];
assign fbdic_failover_config[15:0] = ~inv_fbdic_failover_config[15:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_16 pff_failover_config  ( // FS:wmr_protect
	.scan_in(pff_failover_config_wmr_scanin),
	.scan_out(pff_failover_config_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_failover_config_in[15:0]),
	.dout(inv_fbdic_failover_config[15:0]),
	.en(fbdic_failover_config_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic1_sb_failover = fbdic_failover_config[15:12] <= 4'd9;
assign fbdic1_sb_failover_l = ~fbdic1_sb_failover;
assign fbdic1_sb_failover_mask[8:0] =  {fbdic_failover_config[15:12] <= 4'h8,
				  	fbdic_failover_config[15:12] <= 4'h7,
				  	fbdic_failover_config[15:12] <= 4'h6,
				  	fbdic_failover_config[15:12] <= 4'h5,
				  	fbdic_failover_config[15:12] <= 4'h4,
				  	fbdic_failover_config[15:12] <= 4'h3,
				  	fbdic_failover_config[15:12] <= 4'h2,
				  	fbdic_failover_config[15:12] <= 4'h1,
				  	fbdic_failover_config[15:12] == 4'h0};
assign fbdic1_sb_failover_mask_l[8:0] = ~fbdic1_sb_failover_mask[8:0];


assign fbdic1_nb_failover = fbdic_failover_config[11:8] <= 4'd13;
assign fbdic1_nb_failover_l = ~fbdic1_nb_failover;
assign fbdic1_nb_failover_mask[12:0] = {fbdic_failover_config[11:8] <= 4'hc,
				  	fbdic_failover_config[11:8] <= 4'hb,
				  	fbdic_failover_config[11:8] <= 4'ha,
				  	fbdic_failover_config[11:8] <= 4'h9,
				  	fbdic_failover_config[11:8] <= 4'h8,
				  	fbdic_failover_config[11:8] <= 4'h7,
				  	fbdic_failover_config[11:8] <= 4'h6,
				  	fbdic_failover_config[11:8] <= 4'h5,
				  	fbdic_failover_config[11:8] <= 4'h4,
				  	fbdic_failover_config[11:8] <= 4'h3,
				  	fbdic_failover_config[11:8] <= 4'h2,
				  	fbdic_failover_config[11:8] <= 4'h1,
				  	fbdic_failover_config[11:8] == 4'h0};
assign fbdic1_nb_failover_mask_l[12:0] = ~fbdic1_nb_failover_mask[12:0];

assign fbdic0_sb_failover = fbdic_failover_config[7:4] <= 4'd9;
assign fbdic0_sb_failover_l = ~fbdic0_sb_failover;
assign fbdic0_sb_failover_mask[8:0] =  {fbdic_failover_config[7:4] <= 4'h8,
				  	fbdic_failover_config[7:4] <= 4'h7,
				  	fbdic_failover_config[7:4] <= 4'h6,
				  	fbdic_failover_config[7:4] <= 4'h5,
				  	fbdic_failover_config[7:4] <= 4'h4,
				  	fbdic_failover_config[7:4] <= 4'h3,
				  	fbdic_failover_config[7:4] <= 4'h2,
				  	fbdic_failover_config[7:4] <= 4'h1,
				  	fbdic_failover_config[7:4] == 4'h0};
assign fbdic0_sb_failover_mask_l[8:0] = ~fbdic0_sb_failover_mask[8:0];

assign fbdic0_nb_failover = fbdic_failover_config[3:0] <= 4'd13;
assign fbdic0_nb_failover_l = ~fbdic0_nb_failover;
assign fbdic0_nb_failover_mask[12:0] = {fbdic_failover_config[3:0] <= 4'hc,
				  	fbdic_failover_config[3:0] <= 4'hb,
				  	fbdic_failover_config[3:0] <= 4'ha,
				  	fbdic_failover_config[3:0] <= 4'h9,
				  	fbdic_failover_config[3:0] <= 4'h8,
				  	fbdic_failover_config[3:0] <= 4'h7,
				  	fbdic_failover_config[3:0] <= 4'h6,
				  	fbdic_failover_config[3:0] <= 4'h5,
				  	fbdic_failover_config[3:0] <= 4'h4,
				  	fbdic_failover_config[3:0] <= 4'h3,
				  	fbdic_failover_config[3:0] <= 4'h2,
				  	fbdic_failover_config[3:0] <= 4'h1,
				  	fbdic_failover_config[3:0] == 4'h0};
assign fbdic0_nb_failover_mask_l[12:0] = ~fbdic0_nb_failover_mask[12:0];

/////////////////////////////////
// FBD Electical Idle Detected Register - read-only
/////////////////////////////////

assign inv_fbdic_elect_idle_detect_in[27:0] = {~fbd1_elect_idle[13:0],~fbd0_elect_idle[13:0]};
assign fbdic_elect_idle_detect[27:0] = ~inv_fbdic_elect_idle_detect[27:0];

mcu_fbdic_ctl_msff_ctl_macro__width_28 ff_elect_idle_detect  (
	.scan_in(ff_elect_idle_detect_scanin),
	.scan_out(ff_elect_idle_detect_scanout),
	.din(inv_fbdic_elect_idle_detect_in[27:0]),
	.dout(inv_fbdic_elect_idle_detect[27:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Disable State Period Register
/////////////////////////////////

assign fbdic_tdisable_period_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h838;
assign fbdic_tdisable_period_in[9:0] = drif_ucb_data[9:0];

assign inv_fbdic_tdisable_period_in[7:0] = ~fbdic_tdisable_period_in[7:0];
assign fbdic_tdisable_period[7:0] = ~inv_fbdic_tdisable_period[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_10 pff_tdisable_period  ( // FS:wmr_protect
	.scan_in(pff_tdisable_period_wmr_scanin),
	.scan_out(pff_tdisable_period_wmr_scanout),
	.siclk(aclk_wmr),
	.din({fbdic_tdisable_period_in[9:8],inv_fbdic_tdisable_period_in[7:0]}),
	.dout({fbdic_tdisable_period[9:8],inv_fbdic_tdisable_period[7:0]}),
	.en(fbdic_tdisable_period_en),
	.l1clk(l1clk),
  .soclk(soclk));

/////////////////////////////////
// FBD Disable State Period Done Register
/////////////////////////////////
assign fbdic_enter_disable_state = fbdic_fbd_state_en & (fbdic_fbd_state_in[2:0] == 3'h0);

assign fbdic_tdisable_done_en = fbdic_disable_state & ~fbdic_tdisable_done & fbdic_tdisable_cnt[9:0] == 10'h0 |
				fbdic_calibrate_state | fbdic_chnl_reset_ld | fbdic_ibtx_start_ld |
				fbdic_enter_disable_state |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h840;
assign fbdic_tdisable_done_in = fbdic_disable_state & ~fbdic_tdisable_done & fbdic_tdisable_cnt[9:0] == 10'h0 ? 1'b1 :
				fbdic_calibrate_state | fbdic_ibtx_start_ld | fbdic_chnl_reset_ld |
				fbdic_enter_disable_state ? 1'b0 : drif_ucb_data[0];

mcu_fbdic_ctl_msff_ctl_macro__en_1 ff_tdisable_done  (
	.scan_in(ff_tdisable_done_scanin),
	.scan_out(ff_tdisable_done_scanout),
	.din(fbdic_tdisable_done_in),
	.dout(fbdic_tdisable_done),
	.en(fbdic_tdisable_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_tdisable_cnt_in[9:0] = fbdic_disable_state & (fbdic_chnl_reset[0] | fbdic_ibtx_start | fbdic_tdisable_start) ? 
					(fbdic_tdisable_cnt[9:0] == 10'h0 ? 10'h0 : fbdic_tdisable_cnt[9:0] - 10'h1) : 
					fbdic_ibtx_start_ld ? fbdic_sbdiscnt[9:0] : fbdic_tdisable_period[9:0];

assign inv_fbdic_tdisable_cnt_in[9:0] = ~fbdic_tdisable_cnt_in[9:0];
assign fbdic_tdisable_cnt[9:0] = ~inv_fbdic_tdisable_cnt[9:0];

mcu_fbdic_ctl_msff_ctl_macro__width_10 ff_tdisable_cnt  (
	.scan_in(ff_tdisable_cnt_scanin),
	.scan_out(ff_tdisable_cnt_scanout),
	.din(inv_fbdic_tdisable_cnt_in[9:0]),
	.dout(inv_fbdic_tdisable_cnt[9:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_tdisable_start_in = fbdic_fbd_state_en & (fbdic_fbd_state_in[2:0] == 3'h0) ? 1'b1 : 
					(|fbdic_fbd_state[2:0]) ? 1'b0 : fbdic_tdisable_start;

mcu_fbdic_ctl_msff_ctl_macro ff_tdisable_start (
	.scan_in(ff_tdisable_start_scanin),
	.scan_out(ff_tdisable_start_scanout),
	.din(fbdic_tdisable_start_in),
	.dout(fbdic_tdisable_start),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Calibrate State Period Register
/////////////////////////////////

assign fbdic_tcalibrate_period_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h848;
assign fbdic_tcalibrate_period_in[19:0] = drif_ucb_data[19:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_20 pff_tcalibrate_period  ( // FS:wmr_protect
	.scan_in(pff_tcalibrate_period_wmr_scanin),
	.scan_out(pff_tcalibrate_period_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_tcalibrate_period_in[19:0]),
	.dout(fbdic_tcalibrate_period[19:0]),
	.en(fbdic_tcalibrate_period_en),
	.l1clk(l1clk),
  .soclk(soclk));

/////////////////////////////////
// FBD Calibrate State Period Done Register
/////////////////////////////////
assign fbdic_tcalibrate_done_en = fbdic_calibrate_state & ~fbdic_tcalibrate_done & fbdic_tcalibrate_cnt[19:0] == 20'h0 |
			fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | 
			fbdic_fbd_state_en & fbdic_fbd_state_in[2:0] == 3'h0 & fbdic_fbd_state[2:0] != 3'h1 |
			drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h850;
assign fbdic_tcalibrate_done_in = 
			fbdic_calibrate_state & ~fbdic_tcalibrate_done & fbdic_tcalibrate_cnt[19:0] == 20'h0 ? 1'b1 :
			fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | 
			fbdic_fbd_state_en & fbdic_fbd_state_in[2:0] == 3'h0 & fbdic_fbd_state[2:0] != 3'h1 ? 1'b0 : 
				drif_ucb_data[0];

mcu_fbdic_ctl_msff_ctl_macro__en_1 ff_tcalibrate_done  (
	.scan_in(ff_tcalibrate_done_scanin),
	.scan_out(ff_tcalibrate_done_scanout),
	.din(fbdic_tcalibrate_done_in),
	.dout(fbdic_tcalibrate_done),
	.en(fbdic_tcalibrate_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_tcalibrate_cnt_in[19:0] = fbdic_calibrate_state ? (fbdic_tcalibrate_cnt[19:0] == 20'h0 ? 20'h0 : 
						fbdic_tcalibrate_cnt[19:0] - 20'h1) : 
					fbdic_ibtx_start ? fbdic_sbibistcalperiod[19:0] : fbdic_tcalibrate_period[19:0];

mcu_fbdic_ctl_msff_ctl_macro__width_20 ff_tcalibrate_cnt  (
	.scan_in(ff_tcalibrate_cnt_scanin),
	.scan_out(ff_tcalibrate_cnt_scanout),
	.din(fbdic_tcalibrate_cnt_in[19:0]),
	.dout(fbdic_tcalibrate_cnt[19:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Training State Minimum Time Register
/////////////////////////////////
assign fbdic_tclktrain_min_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h858;
assign fbdic_tclktrain_min_in[15:0] = drif_ucb_data[15:0];

assign inv_fbdic_tclktrain_min_in[7:0] = ~fbdic_tclktrain_min_in[7:0];
assign fbdic_tclktrain_min[7:0] = ~inv_fbdic_tclktrain_min[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_16 pff_tclktrain_min  ( // FS:wmr_protect
	.scan_in(pff_tclktrain_min_wmr_scanin),
	.scan_out(pff_tclktrain_min_wmr_scanout),
	.siclk(aclk_wmr),
	.din({fbdic_tclktrain_min_in[15:8],inv_fbdic_tclktrain_min_in[7:0]}),
	.dout({fbdic_tclktrain_min[15:8],inv_fbdic_tclktrain_min[7:0]}),
	.en(fbdic_tclktrain_min_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_tclktrain_min_cnt_in[15:0] = fbdic_train_state ? (fbdic_tclktrain_min_cnt[15:0] == 16'h0 ? 16'h0 :
								fbdic_tclktrain_min_cnt[15:0] - 16'h1) : 
						fbdic_tclktrain_min[15:0];

mcu_fbdic_ctl_msff_ctl_macro__width_16 ff_tclktrain_min_cnt  (
	.scan_in(ff_tclktrain_min_cnt_scanin),
	.scan_out(ff_tclktrain_min_cnt_scanout),
	.din(fbdic_tclktrain_min_cnt_in[15:0]),
	.dout(fbdic_tclktrain_min_cnt[15:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_enable_sync_count_in = (fbdic_tclktrain_min_cnt[15:0] == 16'h0) & fbdic_train_state |
					fbdic_disable_state & (fbdic_serdes_dtm | fbdic_loopback[1]);
mcu_fbdic_ctl_msff_ctl_macro__width_1 ff_enable_sync_count  (
	.scan_in(ff_enable_sync_count_scanin),
	.scan_out(ff_enable_sync_count_scanout),
	.din(fbdic_enable_sync_count_in),
	.dout(fbdic_enable_sync_count),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Training State Done Register
/////////////////////////////////
assign fbdic_tclktrain_rst_done = fbdic_train_state & ~(|fbdic_tclktrain_done[1:0]) & 
					fbdic_tclktrain_min_cnt[15:0] == 16'h0 & fbdic0_ts_match_cnt[3:0] == 4'hf;
assign fbdic_tclktrain_to_done = fbdic_train_state & ~(|fbdic_tclktrain_done[1:0]) & 
				fbdic_tclktrain_min_cnt[15:0] == 16'h0 & fbdic_tclktrain_timeout_cnt[15:0] == 16'h0;
assign fbdic_tclktrain_ibst_done = fbdic_ibtx_start & fbdic_train_state & fbdic_sbts_cnt[9:0] == 10'h0;

assign fbdic_tclktrain_done_en = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_tclktrain_rst_done | 
				fbdic_tclktrain_to_done | fbdic_tclktrain_ibst_done | fbdic_enter_disable_state |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h860;

assign fbdic_tclktrain_done_in[1:0] = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld ? 2'h0 :
					fbdic_tclktrain_to_done ? 2'h2 :
					fbdic_enter_disable_state ? {fbdic_tclktrain_done[1], 1'b0} :
	 				fbdic_tclktrain_rst_done | fbdic_tclktrain_ibst_done ? 2'h1 : drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 ff_tclktrain_done  (
	.scan_in(ff_tclktrain_done_scanin),
	.scan_out(ff_tclktrain_done_scanout),
	.din(fbdic_tclktrain_done_in[1:0]),
	.dout(fbdic_tclktrain_done[1:0]),
	.en(fbdic_tclktrain_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Training State Timeout Register
/////////////////////////////////
assign fbdic_tclktrain_timeout_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h868;
assign fbdic_tclktrain_timeout_in[15:0] = drif_ucb_data[15:0];

assign inv_fbdic_tclktrain_timeout_in[15:0] = ~fbdic_tclktrain_timeout_in[15:0];
assign fbdic_tclktrain_timeout[15:0] = ~inv_fbdic_tclktrain_timeout[15:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_16 pff_tclktrain_timeout  ( // FS:wmr_protect
	.scan_in(pff_tclktrain_timeout_wmr_scanin),
	.scan_out(pff_tclktrain_timeout_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_tclktrain_timeout_in[15:0]),
	.dout(inv_fbdic_tclktrain_timeout[15:0]),
	.en(fbdic_tclktrain_timeout_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_tclktrain_timeout_cnt_in[15:0] = (fbdic_train_state & fbdic_tclktrain_min_cnt[15:0] == 16'h0 ? 
							(fbdic_tclktrain_timeout_cnt[15:0] == 16'h0 ? 16'h0 : 
								fbdic_tclktrain_timeout_cnt[15:0] - 16'h1) : 
						fbdic_tclktrain_timeout[15:0]) | 
							{8'h0, fbdic_ibist_data_mode | ~fbdic_chnl_reset[0], 7'h0};

mcu_fbdic_ctl_msff_ctl_macro__width_16 ff_tclktrain_timeout_cnt  (
	.scan_in(ff_tclktrain_timeout_cnt_scanin),
	.scan_out(ff_tclktrain_timeout_cnt_scanout),
	.din(fbdic_tclktrain_timeout_cnt_in[15:0]),
	.dout(fbdic_tclktrain_timeout_cnt[15:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Testing State Done Register
/////////////////////////////////
assign fbdic_testing_rst_done = fbdic_testing_state & ~(|fbdic_testing_done[1:0]) & 
					fbdic0_ts_match_cnt[3:0] == 4'h4;
assign fbdic_testing_to_done = fbdic_testing_state & ~(|fbdic_testing_done[1:0]) & 
					fbdic_testing_timeout_cnt[7:0] == 8'h0;
assign fbdic_testing_ibst_done = ibtx_done & fbdic_testing_state & fbdic_sbts_cnt[9:0] == 10'h0;

assign fbdic_testing_done_en = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_testing_rst_done | 
				fbdic_testing_to_done | fbdic_testing_ibst_done | fbdic_enter_disable_state |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h870;
assign fbdic_testing_done_in[1:0] = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld ? 2'h0 :
				 	fbdic_testing_to_done ? 2'h2 :
					fbdic_enter_disable_state ? {fbdic_testing_done[1], 1'b0} :
				 	fbdic_testing_rst_done | fbdic_testing_ibst_done ? 2'h1 : drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 ff_testing_done  (
	.scan_in(ff_testing_done_scanin),
	.scan_out(ff_testing_done_scanout),
	.din(fbdic_testing_done_in[1:0]),
	.dout(fbdic_testing_done[1:0]),
	.en(fbdic_testing_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Testing State Timeout Register
/////////////////////////////////

assign fbdic_testing_timeout_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h878;
assign fbdic_testing_timeout_in[7:0] = drif_ucb_data[7:0];

assign inv_fbdic_testing_timeout_in[7:0] = ~fbdic_testing_timeout_in[7:0];
assign fbdic_testing_timeout[7:0] = ~inv_fbdic_testing_timeout[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 pff_testing_timeout  ( // FS:wmr_protect
	.scan_in(pff_testing_timeout_wmr_scanin),
	.scan_out(pff_testing_timeout_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_testing_timeout_in[7:0]),
	.dout(inv_fbdic_testing_timeout[7:0]),
	.en(fbdic_testing_timeout_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_testing_timeout_cnt_in[7:0] = (fbdic_testing_state ? (fbdic_testing_timeout_cnt[7:0] == 8'h0 ? 8'h0 :
									fbdic_testing_timeout_cnt[7:0] - 8'h1) :	
						fbdic_testing_timeout[7:0]) | 
							{fbdic_ibist_data_mode | ~fbdic_chnl_reset[0], 7'h0};
mcu_fbdic_ctl_msff_ctl_macro__width_8 ff_testing_timeout_cnt  (
	.scan_in(ff_testing_timeout_cnt_scanin),
	.scan_out(ff_testing_timeout_cnt_scanout),
	.din(fbdic_testing_timeout_cnt_in[7:0]),
	.dout(fbdic_testing_timeout_cnt[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Polling State Done Register
/////////////////////////////////
assign fbdic_polling_rst_done = fbdic_polling_state & ~(|fbdic_polling_done[1:0]) & 
				fbdic0_ts_match_cnt[3:0] == 4'hf;
assign fbdic_polling_to_done = fbdic_polling_state & ~(|fbdic_polling_done[1:0]) & 
				fbdic_polling_timeout_cnt[7:0] == 8'h0;
assign fbdic_polling_ibst_done = fbdic_ibist_done & fbdic_polling_state & fbdic_sbts_cnt[9:0] == 10'h0;

assign fbdic_polling_done_en = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_polling_to_done |
				fbdic_polling_rst_done | fbdic_polling_ibst_done | fbdic_enter_disable_state |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h870;
assign fbdic_polling_done_in[1:0] = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld ? 2'h0 :
				 	fbdic_polling_to_done ? 2'h2 :
					fbdic_enter_disable_state ? {fbdic_polling_done[1], 1'b0} :
				 	fbdic_polling_rst_done | fbdic_polling_ibst_done ? 2'h1 : drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 ff_polling_done  (
	.scan_in(ff_polling_done_scanin),
	.scan_out(ff_polling_done_scanout),
	.din(fbdic_polling_done_in[1:0]),
	.dout(fbdic_polling_done[1:0]),
	.en(fbdic_polling_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Polling State Timeout Register
/////////////////////////////////

assign fbdic_polling_timeout_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h888;
assign fbdic_polling_timeout_in[7:0] = drif_ucb_data[7:0];

assign inv_fbdic_polling_timeout_in[7:0] = ~fbdic_polling_timeout_in[7:0];
assign fbdic_polling_timeout[7:0] = ~inv_fbdic_polling_timeout[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 pff_polling_timeout  ( // FS:wmr_protect
	.scan_in(pff_polling_timeout_wmr_scanin),
	.scan_out(pff_polling_timeout_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_polling_timeout_in[7:0]),
	.dout(inv_fbdic_polling_timeout[7:0]),
	.en(fbdic_polling_timeout_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_polling_timeout_cnt_in[7:0] = (fbdic_polling_state ? (fbdic_polling_timeout_cnt[7:0] == 8'h0 ? 8'h0 :
									fbdic_polling_timeout_cnt[7:0] - 8'h1) :	
						fbdic_polling_timeout[7:0]) | {~fbdic_chnl_reset[0], 7'h0};
mcu_fbdic_ctl_msff_ctl_macro__width_8 ff_polling_timeout_cnt  (
	.scan_in(ff_polling_timeout_cnt_scanin),
	.scan_out(ff_polling_timeout_cnt_scanout),
	.din(fbdic_polling_timeout_cnt_in[7:0]),
	.dout(fbdic_polling_timeout_cnt[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Config State Done Register
/////////////////////////////////
assign fbdic_config_rst_done = fbdic_config_state & ~(|fbdic_config_done[1:0]) & 
				fbdic0_ts_match_cnt[3:0] == 4'h4;
assign fbdic_config_to_done = fbdic_config_state & ~(|fbdic_config_done[1:0]) & 
				fbdic_config_timeout_cnt[7:0] == 8'h0;
assign fbdic_config_ibst_done = fbdic_ibist_done & fbdic_config_state & fbdic_sbts_cnt[9:0] == 10'h0;

assign fbdic_config_done_en = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld | fbdic_config_rst_done |
				fbdic_config_to_done | fbdic_config_ibst_done | fbdic_enter_disable_state |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h870;
assign fbdic_config_done_in[1:0] = fbdic_chnl_reset_ld | fbdic_ibtx_start_ld ? 2'h0 :
					fbdic_config_to_done ? 2'h2 :
					fbdic_enter_disable_state ? {fbdic_config_done[1], 1'b0} :
					fbdic_config_ibst_done | fbdic_config_rst_done ? 2'h1 : drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 ff_config_done  (
	.scan_in(ff_config_done_scanin),
	.scan_out(ff_config_done_scanout),
	.din(fbdic_config_done_in[1:0]),
	.dout(fbdic_config_done[1:0]),
	.en(fbdic_config_done_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Config State Timeout Register
/////////////////////////////////

assign fbdic_config_timeout_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h898;
assign fbdic_config_timeout_in[7:0] = drif_ucb_data[7:0];

assign inv_fbdic_config_timeout_in[7:0] = ~fbdic_config_timeout_in[7:0];
assign fbdic_config_timeout[7:0] = ~inv_fbdic_config_timeout[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 pff_config_timeout  ( // FS:wmr_protect
	.scan_in(pff_config_timeout_wmr_scanin),
	.scan_out(pff_config_timeout_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_config_timeout_in[7:0]),
	.dout(inv_fbdic_config_timeout[7:0]),
	.en(fbdic_config_timeout_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_config_timeout_cnt_in[7:0] = (fbdic_config_state ? (fbdic_config_timeout_cnt[7:0] == 8'h0 ? 8'h0 :
									fbdic_config_timeout_cnt[7:0] - 8'h1) :	
						fbdic_config_timeout[7:0]) | {~fbdic_chnl_reset[0], 7'h0};
mcu_fbdic_ctl_msff_ctl_macro__width_8 ff_config_timeout_cnt  (
	.scan_in(ff_config_timeout_cnt_scanin),
	.scan_out(ff_config_timeout_cnt_scanout),
	.din(fbdic_config_timeout_cnt_in[7:0]),
	.dout(fbdic_config_timeout_cnt[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// FBD Per Rank CKE Register - reset to 16'hffff
/////////////////////////////////
assign fbdic_per_rank_cke_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8A0;
assign fbdic_per_rank_cke_in[15:0] = drif_ucb_data[15:0];

assign inv_fbdic_per_rank_cke_in[15:0] = ~fbdic_per_rank_cke_in[15:0];
assign fbdic_per_rank_cke[15:0] = ~inv_fbdic_per_rank_cke[15:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_16 pff_per_rank_cke  ( // FS:wmr_protect
	.scan_in(pff_per_rank_cke_wmr_scanin),
	.scan_out(pff_per_rank_cke_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_per_rank_cke_in[15:0]),
	.dout(inv_fbdic_per_rank_cke[15:0]),
	.en(fbdic_per_rank_cke_en),
	.l1clk(l1clk),
  .soclk(soclk));


assign fbdic_cke_cmd_pend_in = (fbdic_per_rank_cke_en & drif_cke_reg | drif_cke_reg ^ fbdic_cke_reg_d1 |
					fbdic_scr_frame_req_d5) & fbdic_l0_state ? 1'b1 : 
				fbdic_issue_cke_cmd | ~fbdic_l0_state | fbdic_error_mode ? 1'b0 : fbdic_cke_cmd_pend;

assign fbdic_issue_cke_cmd = fbdic_cke_cmd_pend & fbdic_config_reg_access_rdy | fbdic_scr_frame_req_d5;

// Using spare10_flop below

//msff_ctl_macro ff_cke_cmd_pend (
//	.scan_in(1'b0),
//	.scan_out(ff_cke_cmd_pend_scanout),
//	.din(fbdic_cke_cmd_pend_in),
//	.dout(fbdic_cke_cmd_pend),
//	.l1clk(l1clk));

mcu_fbdic_ctl_msff_ctl_macro__width_1 ff_cke_reg_d1  (
	.scan_in(ff_cke_reg_d1_scanin),
	.scan_out(ff_cke_reg_d1_scanout),
	.din(drif_cke_reg),
	.dout(fbdic_cke_reg_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_lower_cke_cmd[23:0] = drif_stacked_dimm ? {16'h01a0, fbdic_per_rank_cke[7:0] & {8{drif_cke_reg}}} : 
					{16'h01e0, {fbdic_per_rank_cke[14],fbdic_per_rank_cke[12],
						   fbdic_per_rank_cke[10],fbdic_per_rank_cke[8],
						   fbdic_per_rank_cke[6], fbdic_per_rank_cke[4],
						   fbdic_per_rank_cke[2], fbdic_per_rank_cke[0]} & {8{drif_cke_reg}}};

assign fbdic_upper_cke_cmd[23:0] = drif_stacked_dimm ? {16'h81a0, fbdic_per_rank_cke[15:8] & {8{drif_cke_reg}}} : 24'h0;

/////////////////////////////////
// FBD L0s Duration Register
/////////////////////////////////
assign fbdic_l0s_time_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8A8;
assign fbdic_l0s_time_in[6:0] = drif_ucb_data[6:0] ^ 7'h2a;
assign fbdic_l0s_time[6:0] = fbdic_l0s_time_out[6:0] ^ 7'h2a;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_7 pff_l0s_time  ( // FS:wmr_protect
	.scan_in(pff_l0s_time_wmr_scanin),
	.scan_out(pff_l0s_time_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_l0s_time_in[6:0]),
	.dout(fbdic_l0s_time_out[6:0]),
	.en(fbdic_l0s_time_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_l0s_enable = fbdic_l0s_time[6];
assign fbdic_sync_el0s = fbdic_l0s_enable & fbdic_mcu_idle;

assign fbdic_l0s_stall_in = fbdic_sync_frame_req ? fbdic_sync_el0s : fbdic_l0s_stall;

assign fbdic_mcu_idle_in = drif_mcu_idle & rdpctl_fifo_empty;
mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_l0s_stall  (
	.scan_in(ff_l0s_stall_scanin),
	.scan_out(ff_l0s_stall_scanout),
	.din({fbdic_mcu_idle_in,fbdic_l0s_stall_in}),
	.dout({fbdic_mcu_idle,fbdic_l0s_stall}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_l0s_lfsr_stall = fbdic_l0s_stall | fbdic_idle_lfsr_reset_d1;

/////////////////////////////////
// Loopback Mode Control Register
/////////////////////////////////
assign fbdic_loopback_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8C8;
assign fbdic_loopback_in[1:0] = drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 ff_loopback  (
	.scan_in(ff_loopback_scanin),
	.scan_out(ff_loopback_scanout),
	.din(fbdic_loopback_in[1:0]),
	.dout(fbdic_loopback[1:0]),
	.en(fbdic_loopback_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// SERDES PLL Status Register - address 8e8 - read only
/////////////////////////////////
cl_sc1_clksyncff_4x sync_stspll5 (
	.d(fsr1_mcu_stspll_lock[2]),
	.q(fbdic_sds_pll_status[5]),
	.si(sync_stspll5_scanin),
	.so(sync_stspll5_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_stspll4 (
	.d(fsr1_mcu_stspll_lock[1]),
	.q(fbdic_sds_pll_status[4]),
	.si(sync_stspll4_scanin),
	.so(sync_stspll4_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_stspll3 (
	.d(fsr1_mcu_stspll_lock[0]),
	.q(fbdic_sds_pll_status[3]),
	.si(sync_stspll3_scanin),
	.so(sync_stspll3_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_stspll2 (
	.d(fsr0_mcu_stspll_lock[2]),
	.q(fbdic_sds_pll_status[2]),
	.si(sync_stspll2_scanin),
	.so(sync_stspll2_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_stspll1 (
	.d(fsr0_mcu_stspll_lock[1]),
	.q(fbdic_sds_pll_status[1]),
	.si(sync_stspll1_scanin),
	.so(sync_stspll1_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_stspll0 (
	.d(fsr0_mcu_stspll_lock[0]),
	.q(fbdic_sds_pll_status[0]),
	.si(sync_stspll0_scanin),
	.so(sync_stspll0_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// SERDES Configuration Bus assignments

assign mcu_fsr01_cfgpll_lb[1:0] = fbdic_sds_config[1:0];
assign mcu_fsr01_cfgpll_mpy[3:0] = fbdic_sds_config[5:2];
assign mcu_fsr01_cfgrx_eq[3:0] = fbdic_sds_config[11:8];
assign mcu_fsr01_cfgrx_cdr[2:0] = fbdic_sds_config[14:12];
assign mcu_fsr01_cfgrx_term[2:0] = {3{mcu_gnd}};
assign mcu_fsr01_cfgtx_enftp = fbdic_sds_config[19];
assign mcu_fsr01_cfgtx_de[3:0] = fbdic_sds_config[23:20];
assign mcu_fsr01_cfgtx_swing[2:0] = fbdic_sds_config[26:24];
assign mcu_fsr01_cfgtx_cm = fbdic_sds_config[27];
assign mcu_fsr01_cfgrtx_rate[1:0] = fbdic_sds_config[29:28];

assign mcu_fsr0_cfgpll_enpll = ~drif_branch_disabled;
assign mcu_fsr1_cfgpll_enpll = ~drif_branch_disabled & ~drif_single_channel_mode;
assign mcu_fsr0_cfgrx_enrx = ~drif_branch_disabled;
assign mcu_fsr1_cfgrx_enrx = ~drif_branch_disabled & ~drif_single_channel_mode;
assign mcu_fsr0_cfgtx_entx = ~drif_branch_disabled;
assign mcu_fsr1_cfgtx_entx = ~drif_branch_disabled & ~drif_single_channel_mode;

// SERDES TX and RX Differential Pair Inversion assignments
assign mcu_fsr0_cfgrx_invpair[13:0] = fbdic_sds_invert[13:0];
assign mcu_fsr1_cfgrx_invpair[13:0] = fbdic_sds_invert[27:14];
assign mcu_fsr0_cfgtx_invpair[9:0] = fbdic_sds_invert[37:28];
assign mcu_fsr1_cfgtx_invpair[9:0] = fbdic_sds_invert[47:38];

// Test config bus assignments
assign mcu_fsr0_testcfg[11:0] = {fbdic_sds_testcfg[13:11], mcu_gnd, fbdic_sds_testcfg[7:0]};
assign mcu_fsr1_testcfg[11:0] = {fbdic_sds_testcfg[27:25], mcu_gnd, fbdic_sds_testcfg[21:14]};
assign mcu_fsr0_cfgrx_entest = fbdic_sds_testcfg[28];
assign mcu_fsr1_cfgrx_entest = fbdic_sds_testcfg[29];
assign mcu_fsr0_cfgtx_entest = fbdic_sds_testcfg[30];
assign mcu_fsr1_cfgtx_entest = fbdic_sds_testcfg[31];

/////////////////////////////////
// SERDES Test Status Register
/////////////////////////////////
mcu_fbdic_ctl_msff_ctl_macro__width_20 ff_sds_test_status  (
	.scan_in(ff_sds_test_status_scanin),
	.scan_out(ff_sds_test_status_scanout),
	.din({fsr1_mcu_ststx_testfail[9:0],fsr0_mcu_ststx_testfail[9:0]}),
	.dout(fbdic_sds_test_status[47:28]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_sds_test_status[27:0] = {fbd1_testfail[13:0],fbd0_testfail[13:0]};

/////////////////////////////////
// Config Register Access Address Register
/////////////////////////////////
assign fbdic_config_reg_addr_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h900;
assign fbdic_config_reg_addr_in[15:2] = drif_ucb_data[15:2];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_14 ff_config_reg_addr  (
	.scan_in(ff_config_reg_addr_scanin),
	.scan_out(ff_config_reg_addr_scanout),
	.din(fbdic_config_reg_addr_in[15:2]),
	.dout(fbdic_config_reg_addr[15:2]),
	.en(fbdic_config_reg_addr_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// Config Register Access Data Register
/////////////////////////////////
assign fbdic_cnfgreg_wr_pend_in = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h908 ? 1'b1 : 
				  fbdic_config_reg_write | ~fbdic_l0_state | fbdic_error_mode ? 1'b0 : 
					fbdic_cnfgreg_wr_pend;

assign fbdic_cnfgreg_rd_pend_in = drif_ucb_rd_req_vld & drif_ucb_addr[12:0] == 13'h908 |
					fbdic_cfgrd_crc_error & fbdic_l0_state ? 1'b1 : 
				  fbdic_config_reg_read | ~fbdic_l0_state ? 1'b0 : fbdic_cnfgreg_rd_pend;

assign fbdic_cfgrd_crc_error = (~(fbdird_crc_cmp0_0 & fbdird_crc_cmp0_1 & fbdird_crc_cmp1_0 & fbdird_crc_cmp1_1) | 
				fbdic_inj_crc_err) & fbdic_cnfgreg_rddata_vld & ~fbdic_chnl_reset_error_mode;

mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_cnfg_access_pending  (
	.scan_in(ff_cnfg_access_pending_scanin),
	.scan_out(ff_cnfg_access_pending_scanout),
	.din({fbdic_cnfgreg_wr_pend_in,fbdic_cnfgreg_rd_pend_in}),
	.dout({fbdic_cnfgreg_wr_pend,fbdic_cnfgreg_rd_pend}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_cnfgreg_wr_data_in[31:0] = drif_ucb_data[31:0];
assign fbdic_cnfgreg_wr_data_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h908;
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_32 ff_cnfgreg_wr_data  (
	.scan_in(ff_cnfgreg_wr_data_scanin),
	.scan_out(ff_cnfgreg_wr_data_scanout),
	.din(fbdic_cnfgreg_wr_data_in[31:0]),
	.dout(fbdic_cnfgreg_wr_data[31:0]),
	.en(fbdic_cnfgreg_wr_data_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_config_reg_access_rdy = ~fbdic_sync_frame_req & ~fbdic_sync_frame_req_early1 & ~fbdic_error_mode & 
					(drif_dram_cmd_a[2:0] == 3'h0) & 
					(drif_dram_cmd_b[2:0] == 3'h0) & (drif_dram_cmd_c[2:0] == 3'h0) &
					(fbdic_sync_sd[1:0] == 2'h0);
assign fbdic_config_reg_read = fbdic_cnfgreg_rd_pend & (fbdic_config_reg_access_rdy | ~fbdic_l0_state);
assign fbdic_config_reg_write = fbdic_cnfgreg_wr_pend & fbdic_config_reg_access_rdy;

mcu_fbdic_ctl_msff_ctl_macro ff_config_reg_write_d1 (
	.scan_in(ff_config_reg_write_d1_scanin),
	.scan_out(ff_config_reg_write_d1_scanout),
	.din(fbdic_config_reg_write),
	.dout(fbdic_config_reg_write_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Only send write data to one channel
assign fbdic0_chnl_disable = fbdic_config_reg_write_d1 & fbdic_config_reg_addr[15];
assign fbdic1_chnl_disable = fbdic_config_reg_write_d1 & ~fbdic_config_reg_addr[15];

/////////////////////////////////
// AMB Thermal Trip Register - address 0xa00 - read only
/////////////////////////////////
assign fbdic_thermal_trip_in[47:0] = {lndskw1_thermal_trip[23:0],lndskw0_thermal_trip[23:0]};
assign fbdic_thermal_trip_en = fbdic_status_frame & ~fbdic_status_parity_error_en;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_48 ff_thermal_trip  (
	.scan_in(ff_thermal_trip_scanin),
	.scan_out(ff_thermal_trip_scanout),
	.din(fbdic_thermal_trip_in[47:0]),
	.dout(fbdic_thermal_trip[47:0]),
	.en(fbdic_thermal_trip_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// MCU Syndrome Register (FBD error status register)
/////////////////////////////////
assign fbdic_mcu_syndrome_en = (fbdic_err_recov | rdpctl_crc_recov_err) & ~fbdic_mcu_syndrome[30] | 
				(fbdic_err_unrecov | rdpctl_crc_unrecov_err) & ~fbdic_fbu_error | 
				fbdic_err_recov & fbdic_aa & ~fbdic_mcu_synd_aa |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hC00;
assign fbdic_mcu_syndrome_in[30:0] = (fbdic_err_recov | rdpctl_crc_recov_err) & ~fbdic_mcu_syndrome[30] | 
				      (fbdic_err_unrecov | rdpctl_crc_unrecov_err) & ~fbdic_fbu_error ? 
						{1'b1,  // valid
						fbdic1_chnl_alert[11:0], 
						fbdic0_chnl_alert[11:0],
						fbdic_scr, 
						fbdic_fr,
						fbdic_spe,
						fbdic_aa,
						fbdic_af,
						rdpctl_crc_recov_err | rdpctl_crc_unrecov_err} :
					fbdic_err_recov & fbdic_aa & ~fbdic_mcu_synd_aa ? 
					       {fbdic_mcu_syndrome[30],
						fbdic1_chnl_alert[11:0], 
						fbdic0_chnl_alert[11:0],
						fbdic_mcu_syndrome[5:3], 1'b1, // AA
						fbdic_mcu_syndrome[1:0]} :
							{drif_ucb_data[63],drif_ucb_data[29:0]};

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_31 pff_mcu_syndrome  ( // FS:wmr_protect
	.scan_in(pff_mcu_syndrome_wmr_scanin),
	.scan_out(pff_mcu_syndrome_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_mcu_syndrome_in[30:0]),
	.dout(fbdic_mcu_syndrome[30:0]),
	.en(fbdic_mcu_syndrome_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_mcu_synd_valid = fbdic_mcu_syndrome[30];
assign fbdic_mcu_synd_fr = fbdic_mcu_syndrome[4];
assign fbdic_mcu_synd_aa = fbdic_mcu_syndrome[2];

assign fbdic_fbu_error_in = fbdic_err_unrecov | rdpctl_crc_unrecov_err ? 1'b1 : 
				~fbdic_mcu_syndrome[30] ? 1'b0 : fbdic_fbu_error;
mcu_fbdic_ctl_msff_ctl_macro ff_fbu_error (
	.scan_in(ff_fbu_error_scanin),
	.scan_out(ff_fbu_error_scanout),
	.din(fbdic_fbu_error_in),
	.dout(fbdic_fbu_error),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// Injected Error Source Register
/////////////////////////////////
// 00: CRC, 01: alert frame, 10: alert asserted, 11: status frame parity

assign fbdic_inj_err_src_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hC08;
assign fbdic_inj_err_src_in[1:0] = drif_ucb_data[1:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 pff_inj_err_src  ( // FS:wmr_protect
	.scan_in(pff_inj_err_src_wmr_scanin),
	.scan_out(pff_inj_err_src_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_inj_err_src_in[1:0]),
	.dout(fbdic_inj_err_src[1:0]),
	.en(fbdic_inj_err_src_en),
	.l1clk(l1clk),
  .soclk(soclk));

/////////////////////////////////
// MCU FBR Count Register
/////////////////////////////////
assign fbdic_fbr_count_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hC10 | 
				(rdpctl_crc_recov_err | fbdic_err_recov) & ~fbdic_fbr_count[16];
assign fbdic_fbr_count_in[16] = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hC10 ? drif_ucb_data[16] : 
											fbdic_fbr_count[16];
assign fbdic_fbr_count_in[15:0] = (rdpctl_crc_recov_err | fbdic_err_recov) & ~fbdic_fbr_count[16] ? 
					((fbdic_fbr_count[15:0] == 16'h0) ? 16'h0 : fbdic_fbr_count[15:0] - 16'h1) : 
						drif_ucb_data[15:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_17 pff_fbr_count  ( // FS:wmr_protect
	.scan_in(pff_fbr_count_wmr_scanin),
	.scan_out(pff_fbr_count_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_fbr_count_in[16:0]),
	.dout(fbdic_fbr_count[16:0]),
	.en(fbdic_fbr_count_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_err_fbr_in = (rdpctl_crc_recov_err | fbdic_err_recov) & 
				(fbdic_fbr_count[16] | fbdic_fbr_count[15:0] == 16'h1);
mcu_fbdic_ctl_msff_ctl_macro ff_err_fbr (
	.scan_in(ff_err_fbr_scanin),
	.scan_out(ff_err_fbr_scanout),
	.din(fbdic_err_fbr_in),
	.dout(fbdic_err_fbr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////

mcu_fbdic_ctl_msff_ctl_macro__width_24 ff_ts_data  (
	.scan_in(ff_ts_data_scanin),
	.scan_out(ff_ts_data_scanout),
	.din({fbdic0_ts_data_in[11:0],fbdic1_ts_data_in[11:0]}),
	.dout({fbdic0_ts_data[11:0],fbdic1_ts_data[11:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//assign fbdic_ts_data[119:0] = fbdic_ibist_data_mode | fbdic_txstart ? ibist_txdata[119:0] : {10{fbdic_ts_data_1bit[11:0]}};
assign fbdic_ibist_data[119:0] = ibist_txdata[119:0];

assign init_state[7:0] = {fbdic_fbd_state[2:0] == 3'h7,
			  fbdic_fbd_state[2:0] == 3'h6,
			  fbdic_fbd_state[2:0] == 3'h5,
			  fbdic_fbd_state[2:0] == 3'h4,
			  fbdic_fbd_state[2:0] == 3'h3,
			  fbdic_fbd_state[2:0] == 3'h2,
			  fbdic_fbd_state[2:0] == 3'h1,
			  fbdic_fbd_state[2:0] == 3'h0};

assign amb_id[3:0] = fbdic_fbd_state[6:3];

// mask for checking errors from status frames
assign fbdic_amb_mask[11:0] = amb_id[3:0] == 4'h1 ? 12'h003 :
			      amb_id[3:0] == 4'h2 ? 12'h007 :
			      amb_id[3:0] == 4'h3 ? 12'h00f :
			      amb_id[3:0] == 4'h4 ? 12'h01f :
			      amb_id[3:0] == 4'h5 ? 12'h03f :
			      amb_id[3:0] == 4'h6 ? 12'h07f :
			      amb_id[3:0] == 4'h7 ? 12'h0ff :
			      amb_id[3:0] == 4'h8 ? 12'h1ff :
			      amb_id[3:0] == 4'h9 ? 12'h3ff :
			      amb_id[3:0] == 4'ha ? 12'h7ff :
			      amb_id[3:0] == 4'hb ? 12'hfff : 12'h001;
			      

assign fbdic_l0_state_in = (fbdic_fbd_state[2:1] == 2'h3) & ~ts3_cnt_en & fbdic_l0_state_dly[2:0] == 3'h0;

mcu_fbdic_ctl_msff_ctl_macro ff_l0_state (
	.scan_in(ff_l0_state_scanin),
	.scan_out(ff_l0_state_scanout),
	.din(fbdic_l0_state_in),
	.dout(fbdic_l0_state),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_l0_state_dly_in[2:0] = (fbdic_fbd_state[2:0] == 3'h5) ? 3'h7 :
					(fbdic_fbd_state[2:1] == 2'h3) & ~ts3_cnt_en & (fbdic_l0_state_dly[2:0] != 3'h0) ? 
					fbdic_l0_state_dly[2:0] - 3'h1 : fbdic_l0_state_dly[2:0];

mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_l0_state_dly  (
	.scan_in(ff_l0_state_dly_scanin),
	.scan_out(ff_l0_state_dly_scanout),
	.din(fbdic_l0_state_dly_in[2:0]),
	.dout(fbdic_l0_state_dly[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_ts_data_in[11:0] = {12{init_state[1]}} | 
				 {12{ts0_cnt_en}} & ts0_data[11:0] | {12{ts1_cnt_en}} & ts1_data[11:0] | 
				 {12{ts2_cnt_en}} & ts2_data[11:0];

assign fbdic0_ts_data_in[11:0] = fbdic_ts_data_in[11:0] | {12{ts3_cnt_en}} & ts3_data0[11:0];
assign fbdic1_ts_data_in[11:0] = {12{~drif_single_channel_mode}} & 
				(fbdic_ts_data_in[11:0] | {12{ts3_cnt_en}} & ts3_data1[11:0]);

// TS0 patterns
assign ts0_cnt_in[3:0] = ts0_cnt[3:0] == 4'hb ? 4'h0 : ts0_cnt[3:0] + 4'h1;
assign ts0_cnt_en = init_state[2] | (|ts0_cnt[3:0]);

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 ff_ts0_cnt  (
	.scan_in(ff_ts0_cnt_scanin),
	.scan_out(ff_ts0_cnt_scanout),
	.din(ts0_cnt_in[3:0]),
	.dout(ts0_cnt[3:0]),
	.en(ts0_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ts0_data[11:0] = (ts0_cnt[3:0] == 4'h0) ? `FBD_TS0_HDR :
			(ts0_cnt[3:0] == 4'h1) ? {amb_id[3],1'b0,amb_id[2],1'b0,amb_id[1],1'b0,amb_id[0],5'h0a} : 12'haaa;

assign fbdic_train_state = ts0_cnt_en;

// TS1 patterns
assign ts1_cnt_in[5:0] = ts1_cnt[5:0] == 6'h7 ? 6'h0 : ts1_cnt[5:0] + 6'h1;
assign ts1_cnt_en = init_state[3] & ~ts0_cnt_en | (|ts1_cnt[5:0]);

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_6 ff_ts1_cnt  (
	.scan_in(ff_ts1_cnt_scanin),
	.scan_out(ff_ts1_cnt_scanout),
	.din(ts1_cnt_in[5:0]),
	.dout(ts1_cnt[5:0]),
	.en(ts1_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ts1_data[11:0] = (ts1_cnt[5:0] == 6'h0) ? `FBD_TS1_HDR : 
			(ts1_cnt[5:0] == 6'h1) ? {5'h0, fbdic_sb2nb_map[2:0], 4'hf} :
			(ts1_cnt[5:0] == 6'h2) ? fbdic_amb_test_param[23:12] :
			(ts1_cnt[5:0] == 6'h3) ? fbdic_amb_test_param[11:0] :
			(ts1_cnt[5:0] == 6'h4) ? 12'h678 :
			(ts1_cnt[5:0] == 6'h5) ? 12'h345 :
			(ts1_cnt[5:0] == 6'h6) ? 12'h678 :
			(ts1_cnt[5:0] == 6'h7) ? 12'h345 : 12'h0;

// TS2 patterns
assign ts2_cnt_in[2:0] = ts2_cnt[2:0] == 3'h5 ? 3'h0 : ts2_cnt[2:0] + 3'h1;
assign ts2_cnt_en = init_state[4] & ~ts1_cnt_en | (|ts2_cnt[2:0]);

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 ff_ts2_cnt  (
	.scan_in(ff_ts2_cnt_scanin),
	.scan_out(ff_ts2_cnt_scanout),
	.din(ts2_cnt_in[2:0]),
	.dout(ts2_cnt[2:0]),
	.en(ts2_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ts2_data[11:0] = (ts2_cnt[2:0] == 3'h0) ? `FBD_TS2_HDR :
			(ts2_cnt[2:0] == 3'h1) ? {6'h00, fbdic_fbd_state[7], 1'b0, amb_id[3:0]} : 
			(ts2_cnt[2:0] == 3'h2) ? {8'h00, ts2_seq_id[3:0]} : 12'haaa;

assign ts2_seq_id_in[3:0] = ts2_seq_id[3:0] + 4'h1;
assign ts2_seq_id_en = (ts2_cnt[2:0] == 3'h2);
assign ts2_seq_id_clr = ~ts2_cnt_en;
mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_ts2_seq_id  (
	.scan_in(ff_ts2_seq_id_scanin),
	.scan_out(ff_ts2_seq_id_scanout),
	.din(ts2_seq_id_in[3:0]),
	.dout(ts2_seq_id[3:0]),
	.en(ts2_seq_id_en),
	.clr(ts2_seq_id_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// TS3 patterns
assign ts3_cnt_in[2:0] = ts3_cnt[2:0] == 3'h5 ? 3'h0 : ts3_cnt[2:0] + 3'h1;
assign ts3_cnt_en = init_state[5] & ~ts2_cnt_en | (|ts3_cnt[2:0]);

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 ff_ts3_cnt  (
	.scan_in(ff_ts3_cnt_scanin),
	.scan_out(ff_ts3_cnt_scanout),
	.din(ts3_cnt_in[2:0]),
	.dout(ts3_cnt[2:0]),
	.en(ts3_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ts3_data0[11:0] = (ts3_cnt[2:0] == 3'h0) ? `FBD_TS3_HDR :
			 (ts3_cnt[2:0] == 3'h1) ? {3'h0, 4'h3, 1'b0, 4'hf} : 
			 (ts3_cnt[2:0] == 3'h2) ? {2'h1,fbdic_failover_config[3:0],
						   2'h0,fbdic_failover_config[7:4]} : 12'haaa;
assign ts3_data1[11:0] = (ts3_cnt[2:0] == 3'h0) ? `FBD_TS3_HDR :
			 (ts3_cnt[2:0] == 3'h1) ? {3'h0, 4'h3, 1'b0, 4'hf} : 
			 (ts3_cnt[2:0] == 3'h2) ? {2'h1,fbdic_failover_config[11:8],
						   2'h0,fbdic_failover_config[15:12]} : 12'haaa;
/////////////////////
// Northbound data
/////////////////////

assign fbdic0_nb_data[11:0] = lndskw0_data[11:0];
assign fbdic1_nb_data[11:0] = lndskw1_data[11:0];

assign fbdic_sequence_en[3:0] = {fbdic0_nb_data[11:0] == `FBD_TS3_HDR,
				 fbdic0_nb_data[11:0] == `FBD_TS2_HDR,
				 fbdic0_nb_data[11:0] == `FBD_TS1_HDR,
				 fbdic0_nb_data[11:0] == `FBD_TS0_HDR};

assign fbdic_sequence_in[1:0] = fbdic_sequence_en[0] ? 2'h0 :
				fbdic_sequence_en[1] ? 2'h1 :
				fbdic_sequence_en[2] ? 2'h2 :
				fbdic_sequence_en[3] ? 2'h3 : fbdic_sequence[1:0];

mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_sequence  (
	.scan_in(ff_sequence_scanin),
	.scan_out(ff_sequence_scanout),
	.din(fbdic_sequence_in[1:0]),
	.dout(fbdic_sequence[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic0_ts_exp_data_in[11:0] = (fbdic_fbd_state[2:0] == 3'h2) ? fbdic0_ts0_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h3) ? fbdic0_ts1_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h4) ? fbdic0_ts2_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h5) ? fbdic0_ts3_exp_in[11:0] : 12'h0;
assign fbdic1_ts_exp_data_in[11:0] = (fbdic_fbd_state[2:0] == 3'h2) ? fbdic1_ts0_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h3) ? fbdic1_ts1_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h4) ? fbdic1_ts2_exp_in[11:0] :
				     (fbdic_fbd_state[2:0] == 3'h5) ? fbdic1_ts3_exp_in[11:0] : 12'h0;

mcu_fbdic_ctl_msff_ctl_macro__width_24 ff_ts_exp_data  (
	.scan_in(ff_ts_exp_data_scanin),
	.scan_out(ff_ts_exp_data_scanout),
	.din({fbdic0_ts_exp_data_in[11:0],fbdic1_ts_exp_data_in[11:0]}),
	.dout({fbdic0_ts_exp_data[11:0],fbdic1_ts_exp_data[11:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Channel 0 expected TS data 
assign fbdic0_ts0_exp_in[11:0] = fbdic0_nb_ts_cnt[5:0] == 6'h0 ? {amb_id[3],1'b0,amb_id[2],1'b0,
								  amb_id[1],1'b0,amb_id[0],5'h0a} :
				 fbdic0_nb_ts_cnt[5:0] == 6'hb ? `FBD_TS0_HDR : 12'haaa;

assign fbdic0_ts1_exp_in[11:0] = (fbdic0_nb_ts_cnt[5:0] == 6'h7) ? `FBD_TS1_HDR : 
				 (fbdic0_nb_ts_cnt[5:0] == 6'h0) ? {5'h0, fbdic_sb2nb_map[2:0], amb_id[3:0]} :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h1) ? fbdic_amb_test_param[23:12] :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h2) ? fbdic_amb_test_param[11:0] :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h3) ? 12'h678 :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h4) ? 12'h345 :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h5) ? 12'h678 :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h6) ? 12'h345 : 12'h0;

assign fbdic0_ts2_exp_in[11:0] = (fbdic0_nb_ts_cnt[5:0] == 6'h5) ? `FBD_TS2_HDR :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h0) ? {6'h00, fbdic_fbd_state[7], 1'b0, amb_id[3:0]} : 
				 (fbdic0_nb_ts_cnt[5:0] == 6'h1) ? {2'h0,fbdic_ch0_cap_reg[4:0], 
								    1'b0,fbdic0_nb_ts2_seq_id[3:0]} : 12'haaa;

assign fbdic0_ts3_exp_in[11:0] = (fbdic0_nb_ts_cnt[5:0] == 6'h5) ? `FBD_TS3_HDR :
				 (fbdic0_nb_ts_cnt[5:0] == 6'h0) ? {3'h0, 4'h0, 1'b0, amb_id[3:0]} : 
				 (fbdic0_nb_ts_cnt[5:0] == 6'h1) ? {2'h1,fbdic_failover_config[3:0],
								    2'h0,fbdic_failover_config[7:4]} : 12'haaa;

assign fbdic0_nb_ts2_seq_id_in[3:0] = fbdic0_nb_ts2_seq_id[3:0] + 4'h1;
assign fbdic0_nb_ts2_seq_id_en = (fbdic_sequence[1:0] == 2'h2) & (fbdic0_nb_ts_cnt[5:0] == 6'h2);
assign fbdic0_nb_ts2_seq_id_clr = (fbdic_sequence[1:0] != 2'h2);

mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_nb_ts2_seq_id0  (
	.scan_in(ff_nb_ts2_seq_id0_scanin),
	.scan_out(ff_nb_ts2_seq_id0_scanout),
	.din(fbdic0_nb_ts2_seq_id_in[3:0]),
	.dout(fbdic0_nb_ts2_seq_id[3:0]),
	.en(fbdic0_nb_ts2_seq_id_en),
	.clr(fbdic0_nb_ts2_seq_id_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic0_hdr_match = (fbdic0_nb_data[11:0] == `FBD_TS0_HDR) & (fbdic_fbd_state[2:0] == 3'h2) | 
			  (fbdic0_nb_data[11:0] == `FBD_TS1_HDR) & (fbdic_fbd_state[2:0] == 3'h3) | 
			  (fbdic0_nb_data[11:0] == `FBD_TS2_HDR) & (fbdic_fbd_state[2:0] == 3'h4) | 
			  (fbdic0_nb_data[11:0] == `FBD_TS3_HDR) & (fbdic_fbd_state[2:0] == 3'h5);

assign fbdic0_nb_ts_cnt_in[5:0] = fbdic0_hdr_match ? 6'h1 : 
				fbdic_fbd_state[2:0] == 3'h2 & fbdic0_nb_ts_cnt[5:0] == 6'hb |
				fbdic_fbd_state[2:0] == 3'h3 & fbdic0_nb_ts_cnt[5:0] == 6'h7 |
				fbdic_fbd_state[2:0] == 3'h4 & fbdic0_nb_ts_cnt[5:0] == 6'h5 |
				fbdic_fbd_state[2:0] == 3'h5 & fbdic0_nb_ts_cnt[5:0] == 6'h5 ? 6'h0 : 
							fbdic0_nb_ts_cnt[5:0] + 6'h1;

assign fbdic0_nb_ts_cnt_en = fbdic_fbd_state[2:1] == 2'h1 | fbdic_fbd_state[2:1] == 2'h2;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_6 ff_nb_ts_cnt0  (
	.scan_in(ff_nb_ts_cnt0_scanin),
	.scan_out(ff_nb_ts_cnt0_scanout),
	.din(fbdic0_nb_ts_cnt_in[5:0]),
	.dout(fbdic0_nb_ts_cnt[5:0]),
	.en(fbdic0_nb_ts_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Counting sequence matches for channel 0

// check that at least two lanes match expected data
assign fbdic0_lane0_match = fbdic0_ts_exp_data[11:0] == lndskw0_data[35:24];
assign fbdic0_lane1_match = fbdic0_ts_exp_data[11:0] == lndskw0_data[23:12];
assign fbdic0_lane2_match = fbdic0_ts_exp_data[11:0] == lndskw0_data[11:0];

assign fbdic0_ts_match_in = (fbdic0_nb_ts_cnt[5:0] == 6'h0) | (fbdic0_lane0_match & fbdic0_lane1_match | 
			fbdic0_lane0_match & fbdic0_lane2_match | fbdic0_lane1_match & fbdic0_lane2_match) & 
			fbdic0_ts_match;

mcu_fbdic_ctl_msff_ctl_macro ff_ts_match0 (
	.scan_in(ff_ts_match0_scanin),
	.scan_out(ff_ts_match0_scanout),
	.din(fbdic0_ts_match_in),
	.dout(fbdic0_ts_match),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic0_ts_match_cnt_in[3:0] = 
	(fbdic0_nb_ts_cnt[5:0] == 6'h0 & ~fbdic0_ts_match) ? 4'h0 :
	(fbdic0_nb_ts_cnt[5:0] == 6'h0 & fbdic0_ts_match & fbdic0_ts_match_cnt[3:0] != 4'hf) ? 
						fbdic0_ts_match_cnt[3:0] + 4'h1 : fbdic0_ts_match_cnt[3:0];

mcu_fbdic_ctl_msff_ctl_macro__clr_1__width_4 ff_ts_match0_cnt  (
	.scan_in(ff_ts_match0_cnt_scanin),
	.scan_out(ff_ts_match0_cnt_scanout),
	.din(fbdic0_ts_match_cnt_in[3:0]),
	.dout(fbdic0_ts_match_cnt[3:0]),
	.clr(fbdic_fbd_state_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Channel 1 expected TS data 
assign fbdic1_ts0_exp_in[11:0] = fbdic1_nb_ts_cnt[5:0] == 6'h0 ? {amb_id[3],1'b0,amb_id[2],1'b0,
								  amb_id[1],1'b0,amb_id[0],5'h0a} :
				 fbdic1_nb_ts_cnt[5:0] == 6'hb ? `FBD_TS0_HDR : 12'haaa;

assign fbdic1_ts1_exp_in[11:0] = (fbdic1_nb_ts_cnt[5:0] == 6'h7) ? `FBD_TS1_HDR : 
				 (fbdic1_nb_ts_cnt[5:0] == 6'h0) ? {5'h0, fbdic_sb2nb_map[2:0], amb_id[3:0]} :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h1) ? fbdic_amb_test_param[23:12] :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h2) ? fbdic_amb_test_param[11:0] :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h3) ? 12'h678 :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h4) ? 12'h345 :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h5) ? 12'h678 :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h6) ? 12'h345 : 12'h0;

assign fbdic1_ts2_exp_in[11:0] = (fbdic1_nb_ts_cnt[5:0] == 6'h5) ? `FBD_TS2_HDR :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h0) ? {6'h00, fbdic_fbd_state[7], 1'b0, amb_id[3:0]} : 
				 (fbdic1_nb_ts_cnt[5:0] == 6'h1) ? {2'h0,fbdic_ch1_cap_reg[4:0], 
								    1'b0,fbdic1_nb_ts2_seq_id[3:0]} : 12'haaa;

assign fbdic1_ts3_exp_in[11:0] = (fbdic1_nb_ts_cnt[5:0] == 6'h5) ? `FBD_TS3_HDR :
				 (fbdic1_nb_ts_cnt[5:0] == 6'h0) ? {3'h0, 4'h0, 1'b0, amb_id[3:0]} : 
				 (fbdic1_nb_ts_cnt[5:0] == 6'h1) ? {2'h1,fbdic_failover_config[11:8],
								    2'h0,fbdic_failover_config[15:12]} : 12'haaa;

assign fbdic1_nb_ts2_seq_id_in[3:0] = fbdic1_nb_ts2_seq_id[3:0] + 4'h1;
assign fbdic1_nb_ts2_seq_id_en = (fbdic_sequence[1:0] == 2'h2) & (fbdic1_nb_ts_cnt[5:0] == 6'h2);
assign fbdic1_nb_ts2_seq_id_clr = (fbdic_sequence[1:0] != 2'h2);

mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_4 ff_nb_ts2_seq_id1  (
	.scan_in(ff_nb_ts2_seq_id1_scanin),
	.scan_out(ff_nb_ts2_seq_id1_scanout),
	.din(fbdic1_nb_ts2_seq_id_in[3:0]),
	.dout(fbdic1_nb_ts2_seq_id[3:0]),
	.en(fbdic1_nb_ts2_seq_id_en),
	.clr(fbdic1_nb_ts2_seq_id_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic1_hdr_match = (fbdic1_nb_data[11:0] == `FBD_TS0_HDR) & (fbdic_fbd_state[2:0] == 3'h2) | 
			  (fbdic1_nb_data[11:0] == `FBD_TS1_HDR) & (fbdic_fbd_state[2:0] == 3'h3) | 
			  (fbdic1_nb_data[11:0] == `FBD_TS2_HDR) & (fbdic_fbd_state[2:0] == 3'h4) | 
			  (fbdic1_nb_data[11:0] == `FBD_TS3_HDR) & (fbdic_fbd_state[2:0] == 3'h5);

assign fbdic1_nb_ts_cnt_in[5:0] = fbdic_fbd_state[2:0] == 3'h2 & fbdic1_nb_ts_cnt[5:0] == 6'hb |
				fbdic_fbd_state[2:0] == 3'h3 & fbdic1_nb_ts_cnt[5:0] == 6'h7 |
				fbdic_fbd_state[2:0] == 3'h4 & fbdic1_nb_ts_cnt[5:0] == 6'h5 |
				fbdic_fbd_state[2:0] == 3'h5 & fbdic1_nb_ts_cnt[5:0] == 6'h5 ? 6'h0 : 
				fbdic1_hdr_match ? 6'h1 : fbdic1_nb_ts_cnt[5:0] + 6'h1;

assign fbdic1_nb_ts_cnt_en = fbdic_fbd_state[2:1] == 2'h1 | fbdic_fbd_state[2:1] == 2'h2;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_6 ff_nb_ts_cnt1  (
	.scan_in(ff_nb_ts_cnt1_scanin),
	.scan_out(ff_nb_ts_cnt1_scanout),
	.din(fbdic1_nb_ts_cnt_in[5:0]),
	.dout(fbdic1_nb_ts_cnt[5:0]),
	.en(fbdic1_nb_ts_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Counting sequence matches for channel 1

assign fbdic1_lane0_match = fbdic1_ts_exp_data[11:0] == lndskw1_data[35:24];
assign fbdic1_lane1_match = fbdic1_ts_exp_data[11:0] == lndskw1_data[23:12];
assign fbdic1_lane2_match = fbdic1_ts_exp_data[11:0] == lndskw1_data[11:0];

assign fbdic1_ts_match_in = (fbdic1_nb_ts_cnt[5:0] == 6'h0) | (fbdic1_lane0_match & fbdic1_lane1_match | 
			fbdic1_lane0_match & fbdic1_lane2_match | fbdic1_lane1_match & fbdic1_lane2_match) & 
			fbdic1_ts_match;

mcu_fbdic_ctl_msff_ctl_macro ff_ts_match1 (
	.scan_in(ff_ts_match1_scanin),
	.scan_out(ff_ts_match1_scanout),
	.din(fbdic1_ts_match_in),
	.dout(fbdic1_ts_match),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic1_ts_match_cnt_in[3:0] = 
	(fbdic1_nb_ts_cnt[5:0] == 6'h0 & ~fbdic1_ts_match[0]) ? 4'h0 :
	(fbdic1_nb_ts_cnt[5:0] == 6'h0 & fbdic1_ts_match[0] & fbdic1_ts_match_cnt[3:0] != 4'hf) ? 
						fbdic1_ts_match_cnt[3:0] + 4'h1 : fbdic1_ts_match_cnt[3:0];

mcu_fbdic_ctl_msff_ctl_macro__clr_1__width_4 ff_ts_match1_cnt  (
	.scan_in(ff_ts_match1_cnt_scanin),
	.scan_out(ff_ts_match1_cnt_scanout),
	.din(fbdic1_ts_match_cnt_in[3:0]),
	.dout(fbdic1_ts_match_cnt[3:0]),
	.clr(fbdic_fbd_state_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////
// Channel Read Latency Register
/////////////////////////////////
assign fbdic_chnl_read_lat[15:0] = {fbdic_rt_lat1[7:0],fbdic_rt_lat0[7:0]};

// Channel round-trip latency counters

// Channel 0
assign fbdic_rt_lat_cntr0_in[7:0] = fbdic_rt_lat_cntr0[7:0] + 8'h1;
assign fbdic_rt_lat_cntr0_en = fbdic_sequence[1:0] == 2'h2 | fbdic_sequence_en[2];
assign fbdic_rt_lat_cntr0_clr = ts2_cnt[2:0] == 3'h5 & ts2_seq_id[3:0] == 4'h0;

mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_8 ff_rt_lat_cntr0  (
	.scan_in(ff_rt_lat_cntr0_scanin),
	.scan_out(ff_rt_lat_cntr0_scanout),
	.din(fbdic_rt_lat_cntr0_in[7:0]),
	.dout(fbdic_rt_lat_cntr0[7:0]),
	.en(fbdic_rt_lat_cntr0_en),
	.clr(fbdic_rt_lat_cntr0_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_rt_lat0_en = fbdic_sequence[1:0] == 2'h2 & fbdic0_nb_ts_cnt[5:0] == 6'h5 & fbdic0_nb_ts2_seq_id[3:0] == 4'h0 |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8b8;
assign fbdic_rt_lat0_in[7:0] = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8b8 ? 
				drif_ucb_data[7:0] : fbdic_rt_lat_cntr0[7:0];

assign inv_fbdic_rt_lat0_in[7:0] = ~fbdic_rt_lat0_in[7:0];
assign fbdic_rt_lat0[7:0] = ~inv_fbdic_rt_lat0[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 ff_rt_lat0  ( // FS:wmr_protect
	.scan_in(ff_rt_lat0_wmr_scanin),
	.scan_out(ff_rt_lat0_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_rt_lat0_in[7:0]),
	.dout(inv_fbdic_rt_lat0[7:0]),
	.en(fbdic_rt_lat0_en),
	.l1clk(l1clk),
  .soclk(soclk));

// Channel 1

assign fbdic_rt_lat_cntr1_en = fbdic_sequence[1:0] == 2'h2 | fbdic_sequence_en[2];
assign fbdic_rt_lat_cntr1_in[7:0] = fbdic_rt_lat_cntr1[7:0] + 8'h1;
assign fbdic_rt_lat_cntr1_clr = ts2_cnt[2:0] == 3'h5 & ts2_seq_id[3:0] == 4'h0;

mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_8 ff_rt_lat_cntr1  (
	.scan_in(ff_rt_lat_cntr1_scanin),
	.scan_out(ff_rt_lat_cntr1_scanout),
	.din(fbdic_rt_lat_cntr1_in[7:0]),
	.dout(fbdic_rt_lat_cntr1[7:0]),
	.en(fbdic_rt_lat_cntr1_en),
	.clr(fbdic_rt_lat_cntr1_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_rt_lat1_en = fbdic_sequence[1:0] == 2'h2 & fbdic0_nb_ts_cnt[5:0] == 6'h5 & fbdic0_nb_ts2_seq_id[3:0] == 4'h0 |
				drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8b8;
assign fbdic_rt_lat1_in[7:0] = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'h8b8 ? 
				drif_ucb_data[23:16] : fbdic_rt_lat_cntr1[7:0];

assign inv_fbdic_rt_lat1_in[7:0] = ~fbdic_rt_lat1_in[7:0];
assign fbdic_rt_lat1[7:0] = ~inv_fbdic_rt_lat1[7:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 ff_rt_lat1  ( // FS:wmr_protect
	.scan_in(ff_rt_lat1_wmr_scanin),
	.scan_out(ff_rt_lat1_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_fbdic_rt_lat1_in[7:0]),
	.dout(inv_fbdic_rt_lat1[7:0]),
	.en(fbdic_rt_lat1_en),
	.l1clk(l1clk),
  .soclk(soclk));

////////////////////////////////////////
// Channel capability registers
////////////////////////////////////////

assign fbdic_ch0_cap_reg_in[4:0] = fbdic0_nb_data[9:5];
assign fbdic_ch0_cap_reg_en = fbdic_sequence[1:0] == 2'h2 & fbdic0_nb_ts_cnt[5:0] == 6'h2;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_5 ff_ch0_cap_reg  (
	.scan_in(ff_ch0_cap_reg_scanin),
	.scan_out(ff_ch0_cap_reg_scanout),
	.din(fbdic_ch0_cap_reg_in[4:0]),	
	.dout(fbdic_ch0_cap_reg[4:0]),
	.en(fbdic_ch0_cap_reg_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// CLEANUP - add chnl 1 expected values
assign fbdic_ch1_cap_reg_in[4:0] = fbdic1_nb_data[9:5];
assign fbdic_ch1_cap_reg_en = fbdic_sequence[1:0] == 2'h2 & fbdic0_nb_ts_cnt[5:0] == 6'h2;

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_5 ff_ch1_cap_reg  (
	.scan_in(ff_ch1_cap_reg_scanin),
	.scan_out(ff_ch1_cap_reg_scanout),
	.din(fbdic_ch1_cap_reg_in[4:0]),	
	.dout(fbdic_ch1_cap_reg[4:0]),
	.en(fbdic_ch1_cap_reg_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_chnl_cap[9:0] = {fbdic_ch1_cap_reg[4:0],fbdic_ch0_cap_reg[4:0]};

////////////////////////////////////////
// Sync Frame Generation
////////////////////////////////////////
// The counter is in mcu_fdout_ctl so that it won't be reset when kp_lnk_up is set

//assign fbdic_link_cnt_en = (fbdic_l0_state | rdpctl_kp_lnk_up | rdpctl_kp_lnk_up_d1) & ~rdpctl_kp_lnk_up_clr;
assign fbdic_link_cnt_en = fbdic_l0_state | rdpctl_kp_lnk_up;
mcu_fbdic_ctl_msff_ctl_macro ff_kp_lnk_up_d1 (
	.scan_in(ff_kp_lnk_up_d1_scanin),
	.scan_out(ff_kp_lnk_up_d1_scanout),
	.din(rdpctl_kp_lnk_up),
	.dout(rdpctl_kp_lnk_up_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_sync_frame_req_early3 = fbdic_link_cnt_eq_3 & fbdic_l0_state & ~rdpctl_kp_lnk_up;

assign fbdic_link_cnt_eq_4_in = fdout_link_cnt[5:0] == 6'h4;
mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_sync_frame_req_early  (
	.scan_in(ff_sync_frame_req_early_scanin),
	.scan_out(ff_sync_frame_req_early_scanout),
	.din({fbdic_link_cnt_eq_4, fbdic_sync_frame_req_early3, fbdic_sync_frame_req_early2}),
	.dout({fbdic_link_cnt_eq_3, fbdic_sync_frame_req_early2, fbdic_sync_frame_req_early1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_link_cnt_eq_0_in = fdout_link_cnt[5:0] == 6'h0;
assign fbdic_sync_frame_req = fbdic_link_cnt_eq_0 & ~rdpctl_kp_lnk_up & fbdic_l0_state;

assign fbdic_sync_frame_req_delay_in[2:0] = fbdic_sync_frame_req | (|fbdic_sync_frame_req_delay[2:0]) ?
						fbdic_sync_frame_req_delay[2:0] + 3'h1 : fbdic_sync_frame_req_delay[2:0];
mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_sync_frame_req_delay  (
	.scan_in(ff_sync_frame_req_delay_scanin),
	.scan_out(ff_sync_frame_req_delay_scanout),
	.din(fbdic_sync_frame_req_delay_in[2:0]),
	.dout(fbdic_sync_frame_req_delay[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_sync_frame_req_d1 = fbdic_sync_frame_req_delay[2:0] == 3'h1;
assign fbdic_sync_frame_req_d2 = fbdic_sync_frame_req_delay[2:0] == 3'h2;
assign fbdic_sync_frame_req_d4 = fbdic_sync_frame_req_delay[2:0] == 3'h4;

assign fbdic_sync_sd[1:0] = drif_single_channel_mode ? (fbdic_rd_cmd_a_d1 ? 2'h3 : 
							fbdic_rd_cmd_a_d2 ? 2'h2 : 
							fbdic_rd_cmd_a_d3 ? 2'h1 : 2'h0) : {1'b0, fbdic_rd_cmd_a_d1};

mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_rd_cmd_a_d1  (
	.scan_in(ff_rd_cmd_a_d1_scanin),
	.scan_out(ff_rd_cmd_a_d1_scanout),
	.din({fbdic_rd_cmd_a,fbdic_rd_cmd_a_d1,fbdic_rd_cmd_a_d2}),
	.dout({fbdic_rd_cmd_a_d1,fbdic_rd_cmd_a_d2,fbdic_rd_cmd_a_d3}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_link_cnt_reset[5:0] = fbdic_sync_el0s & ~rdpctl_kp_lnk_up ? fbdic_l0s_time[5:0] : fbdic_sync_frm_period[5:0];

// Soft channel reset request delay for issuing next command
assign fbdic_scr_frame_req_dly_in[3:0] = fbdic_scr_frame_req_dly[3:0] + 4'h1;
assign fbdic_scr_frame_req_dly_en = fbdic_scr_frame_req | (|fbdic_scr_frame_req_dly[3:0]);
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 ff_scr_dly  (
	.scan_in(ff_scr_dly_scanin),
	.scan_out(ff_scr_dly_scanout),
	.din(fbdic_scr_frame_req_dly_in[3:0]),
	.dout(fbdic_scr_frame_req_dly[3:0]),
	.en(fbdic_scr_frame_req_dly_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
assign fbdic_scr_frame_req_d4 = fbdic_scr_frame_req_dly[3:0] == 4'h4;
assign fbdic_scr_frame_req_d5 = fbdic_scr_frame_req_dly[3:0] == 4'h5;
assign fbdic_scr_frame_req_d10 = fbdic_scr_frame_req_dly[3:0] == 4'ha;


// Issue Pre-charge All command after SCR
assign fbdic_issue_pre_all_cmd_in = fbdic_scr_frame_req_d10 ? 1'b1 : 
				    fbdic_pre_all_rank[3:0] == fbdic_last_rank[3:0] ? 1'b0 : fbdic_issue_pre_all_cmd;
mcu_fbdic_ctl_msff_ctl_macro ff_issue_pre_all_cmd (
	.scan_in(ff_issue_pre_all_cmd_scanin),
	.scan_out(ff_issue_pre_all_cmd_scanout),
	.din(fbdic_issue_pre_all_cmd_in),
	.dout(fbdic_issue_pre_all_cmd),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_pre_all_rank_in[3] = fbdic_issue_pre_all_cmd & (fbdic_pre_all_rank[3] ^ drif_stacked_dimm);
assign fbdic_pre_all_rank_in[2:0] = {3{fbdic_issue_pre_all_cmd}} & (fbdic_pre_all_rank[2:0] + 
					{2'h0, fbdic_pre_all_rank[3] & drif_stacked_dimm | ~drif_stacked_dimm});

mcu_fbdic_ctl_msff_ctl_macro__width_4 ff_pre_all_rank  (
	.scan_in(ff_pre_all_rank_scanin),
	.scan_out(ff_pre_all_rank_scanout),
	.din(fbdic_pre_all_rank_in[3:0]),
	.dout(fbdic_pre_all_rank[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_last_rank[3:0] = {drif_stacked_dimm, drif_num_dimms[2:0] - 3'h1};

// DRAM and Channel Commands

assign fbdic_act_cmd_a[23:0] = {drif_dram_dimm_a[2:0], 1'b1, drif_dram_addr_a[15:14], drif_dram_rank_a, 
					drif_dram_addr_a[13], drif_dram_bank_a[2:0], drif_dram_addr_a[12:0]};

assign fbdic_rd_cmd_a = (drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_RD);
assign fbdic_wr_cmd_a = (drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_WR);
assign fbdic_rd_wr_cmd_a[23:0] = {drif_dram_dimm_a[2:0], 2'h1, fbdic_wr_cmd_a, drif_dram_rank_a, 1'b0, 
					drif_dram_bank_a[2:0], drif_dram_addr_a[12:0]};

assign fbdic_sync_cmd_a[23:0] = {11'h2, fbdic_sync_sd[1:0], 4'h0, fbdic_sync_ier, 
				fbdic_sync_erc, fbdic_sync_el0s, 2'h0, fbdic_sync_r[1:0]};

assign fbdic_soft_chnl_reset_cmd[23:0] = 24'h008000;

assign fbdic_a_cmd_in[23:0] = fbdic_sync_frame_req ? fbdic_sync_cmd_a[23:0] :
			fbdic_scr_frame_req ? fbdic_soft_chnl_reset_cmd[23:0] :
			(drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_ACT) ? fbdic_act_cmd_a[23:0] :
			(drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_RD) | 
				(drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_WR) ? fbdic_rd_wr_cmd_a[23:0] : 24'h0;

assign fbdic_f_in[1] = (drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_WDATA);
assign fbdic_f_in[0] = fbdic_f_in[1] ? drif_wdata_wsn : 1'b0;

mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_f  (
	.scan_in(ff_f_scanin),
	.scan_out(ff_f_scanout),
	.din(fbdic_f_in[1:0]),
	.dout(fbdic_f[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_f_1_l = ~fbdic_f[1];

mcu_fbdic_ctl_msff_ctl_macro__width_24 ff_a_cmd  (
	.scan_in(ff_a_cmd_scanin),
	.scan_out(ff_a_cmd_scanout),
	.din(fbdic_a_cmd_in[23:0]),
	.dout(fbdic_a_cmd[23:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_special_cmd_in = fbdic_sync_frame_req | fbdic_scr_frame_req;

mcu_fbdic_ctl_msff_ctl_macro__width_1 ff_special_cmd  (
	.scan_in(ff_special_cmd_scanin),
	.scan_out(ff_special_cmd_scanout),
	.din(fbdic_special_cmd_in),
	.dout(fbdic_special_cmd),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_trans_id = fbdic_config_reg_addr[15] ? ~fbdic1_last_trans_id : ~fbdic0_last_trans_id;

assign fbdic0_last_trans_id_in = ~fbdic0_last_trans_id;
assign fbdic0_last_trans_id_en = fbdic_config_reg_write & ~fbdic_config_reg_addr[15];
mcu_fbdic_ctl_msff_ctl_macro__en_1 ff_last_trans_id0  (
	.scan_in(ff_last_trans_id0_scanin),
	.scan_out(ff_last_trans_id0_scanout),
	.din(fbdic0_last_trans_id_in),
	.dout(fbdic0_last_trans_id),
	.en(fbdic0_last_trans_id_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic1_last_trans_id_in = ~fbdic1_last_trans_id;
assign fbdic1_last_trans_id_en = fbdic_config_reg_write & fbdic_config_reg_addr[15];
mcu_fbdic_ctl_msff_ctl_macro__en_1 ff_last_trans_id1  (
	.scan_in(ff_last_trans_id1_scanin),
	.scan_out(ff_last_trans_id1_scanout),
	.din(fbdic1_last_trans_id_in),
	.dout(fbdic1_last_trans_id),
	.en(fbdic1_last_trans_id_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_pre_all_cmd[23:0] = {fbdic_pre_all_rank[2:0], 3'h1, fbdic_pre_all_rank[3], 17'h01c00};
assign fbdic_ref_cmd_b[23:0] = {drif_dram_dimm_b[2:0], 3'h1, drif_dram_rank_b,4'h0,`FBD_DRAM_CMD_OTHER_REF,10'h0};
assign fbdic_b_cmd[35:0] = fbdic_config_reg_write | fbdic_config_reg_read ? 
				{12'h0,fbdic_config_reg_addr[13:11],6'h02,fbdic_config_reg_write,fbdic_config_reg_addr[14],
				fbdic_trans_id & fbdic_config_reg_write,1'b0,fbdic_config_reg_addr[10:2],2'h0} : 
				fbdic_issue_cke_cmd ? {12'h0, fbdic_lower_cke_cmd[23:0]} : 
				fbdic_issue_pre_all_cmd ? {12'h0, fbdic_pre_all_cmd[23:0]} : 
				(drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_ACT) ? {12'h0, drif_dram_dimm_b[2:0], 1'b1, 
					drif_dram_addr_b[15:14], drif_dram_rank_b, drif_dram_addr_b[13], 
					drif_dram_bank_b[2:0], drif_dram_addr_b[12:0]} :
				(drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_WR) ? {12'h0, drif_dram_dimm_b[2:0], 3'h3, 
					drif_dram_rank_b, 1'b0, drif_dram_bank_b[2:0], drif_dram_addr_b[12:0]} :
				(drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_OTHER) & 
					(drif_dram_addr_b[2:0] == `FBD_DRAM_CMD_OTHER_REF) ? 
						{12'h0, fbdic_ref_cmd_b[23:0]} : 36'h0;

assign fbdic_sre_cmd_c[23:0] = {drif_dram_dimm_c[2:0], 3'h1, drif_dram_rank_c,4'h0,`FBD_DRAM_CMD_OTHER_SRE,10'h0};
assign fbdic_pde_cmd_c[23:0] = {drif_dram_dimm_c[2:0], 3'h1, drif_dram_rank_c,4'h0,`FBD_DRAM_CMD_OTHER_PDE,10'h0};
assign fbdic_srpdx_cmd_c[23:0] = {drif_dram_dimm_c[2:0], 3'h1, drif_dram_rank_c,4'h0,`FBD_DRAM_CMD_OTHER_SRPDX,10'h0};

assign fbdic_c_cmd[35:0] = fbdic_config_reg_write ? {4'hf,fbdic_cnfgreg_wr_data[31:0]} : 
				fbdic_issue_cke_cmd ? {12'h0, fbdic_upper_cke_cmd[23:0]} :
				(drif_dram_cmd_c[2:0] == `FBD_DRAM_CMD_ACT) ? {12'h0, drif_dram_dimm_c[2:0], 1'b1, 
					drif_dram_addr_c[15:14], drif_dram_rank_c, drif_dram_addr_c[13], 
					drif_dram_bank_c[2:0], drif_dram_addr_c[12:0]} :
				(drif_dram_cmd_c[2:0] == `FBD_DRAM_CMD_WR) ? {12'h0, drif_dram_dimm_c[2:0], 3'h3, 
					drif_dram_rank_c, 1'b0, drif_dram_bank_c[2:0], drif_dram_addr_c[12:0]} :
				(drif_dram_cmd_c[2:0] != `FBD_DRAM_CMD_OTHER) ? 36'h0 :
				(drif_dram_addr_c[2:0] == `FBD_DRAM_CMD_OTHER_SRE) ? {12'h0, fbdic_sre_cmd_c[23:0]} :
				(drif_dram_addr_c[2:0] == `FBD_DRAM_CMD_OTHER_PDE) ? {12'h0, fbdic_pde_cmd_c[23:0]} :
				(drif_dram_addr_c[2:0] == `FBD_DRAM_CMD_OTHER_SRPDX) ? {12'h0, fbdic_srpdx_cmd_c[23:0]} : 
						36'h0;

assign fbdic_bc_cmd_in[71:0] = fbdic_special_cmd_in ? 72'haa_55aa55aa_55aa55aa : 
			{fbdic_c_cmd[35:32],fbdic_b_cmd[35:32],
			 fbdic_c_cmd[31:28],fbdic_b_cmd[31:28],
			 fbdic_c_cmd[27:24],fbdic_b_cmd[27:24],
			 fbdic_c_cmd[23:20],fbdic_b_cmd[23:20],
			 fbdic_c_cmd[19:16],fbdic_b_cmd[19:16],
			 fbdic_c_cmd[15:12],fbdic_b_cmd[15:12],
			 fbdic_c_cmd[11:8], fbdic_b_cmd[11:8],
			 fbdic_c_cmd[7:4],  fbdic_b_cmd[7:4],
			 fbdic_c_cmd[3:0],  fbdic_b_cmd[3:0]};

mcu_fbdic_ctl_msff_ctl_macro__width_72 ff_bc_cmd  (
	.scan_in(ff_bc_cmd_scanin),
	.scan_out(ff_bc_cmd_scanout),
	.din(fbdic_bc_cmd_in[71:0]),
	.dout(fbdic_bc_cmd[71:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Lane deskew buffer control logic
// The logic waits for the TS0 header to appear at the head of all 28 buffers before proceeding.
// If only 13 lanes of either channel 0 or channel 1 have TS0 headers present, then the logic waits
// until the tclktrain miniumum time has expired and then allows the buffers to proceed.

assign fbdic0_inc_wptr = fbdic_fbd_state[2] | fbdic_fbd_state[1] | rdpctl_kp_lnk_up | fbdic_serdes_dtm | fbdic_loopback[1];
assign fbdic0_inc_rptr[13:0] = ~lndskw0_ts0_hdr_match[13:0] | {14{fbdic0_lane_align & 
									(fbdic1_lane_align | drif_single_channel_mode)}};
assign fbdic0_clr_ptrs = fbdic_fbd_state[2:0] == 3'h0 & ~rdpctl_kp_lnk_up & ~fbdic_serdes_dtm & ~fbdic_loopback[1];
assign fbdic0_lane_align_in = ((|fbdic_fbd_state[2:0]) | rdpctl_kp_lnk_up | fbdic_serdes_dtm | fbdic_loopback[1]) & 
						(&lndskw0_ts0_hdr_match[13:0] |
						fbdic0_13_lanes_aligned & ~(|fbdic_tclktrain_timeout_cnt[15:10]) |
						fbdic0_lane_align_out);

assign fbdic0_13_lanes_aligned = lndskw0_ts0_hdr_match[13:0] == 14'h3ffe |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3ffd |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3ffb |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3ff7 |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3fef |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3fdf |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3fbf |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3f7f |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3eff |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3dff |
				 lndskw0_ts0_hdr_match[13:0] == 14'h3bff |
				 lndskw0_ts0_hdr_match[13:0] == 14'h37ff |
				 lndskw0_ts0_hdr_match[13:0] == 14'h2fff |
				 lndskw0_ts0_hdr_match[13:0] == 14'h1fff;

assign fbdic1_inc_wptr = (fbdic_fbd_state[2] | fbdic_fbd_state[1] | rdpctl_kp_lnk_up | fbdic_serdes_dtm | 
				fbdic_loopback[1]) & ~drif_single_channel_mode;
assign fbdic1_inc_rptr[13:0] = drif_single_channel_mode ? 14'h0 : 
					~lndskw1_ts0_hdr_match[13:0] | {14{fbdic0_lane_align & fbdic1_lane_align}};
assign fbdic1_clr_ptrs = fbdic_fbd_state[2:0] == 3'h0 & ~rdpctl_kp_lnk_up & ~fbdic_serdes_dtm & ~fbdic_loopback[1];
assign fbdic1_lane_align_in = ((|fbdic_fbd_state[2:0]) | rdpctl_kp_lnk_up | fbdic_serdes_dtm | fbdic_loopback[1]) & 
						(&lndskw1_ts0_hdr_match[13:0] |
						fbdic1_13_lanes_aligned & ~(|fbdic_tclktrain_timeout_cnt[15:10]) |
						fbdic1_lane_align_out);

assign fbdic1_13_lanes_aligned = lndskw1_ts0_hdr_match[13:0] == 14'h3ffe |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3ffd |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3ffb |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3ff7 |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3fef |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3fdf |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3fbf |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3f7f |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3eff |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3dff |
				 lndskw1_ts0_hdr_match[13:0] == 14'h3bff |
				 lndskw1_ts0_hdr_match[13:0] == 14'h37ff |
				 lndskw1_ts0_hdr_match[13:0] == 14'h2fff |
				 lndskw1_ts0_hdr_match[13:0] == 14'h1fff;

mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_lane_align  ( // FS:wmr_protect
	.scan_in(ff_lane_align_wmr_scanin),
	.scan_out(ff_lane_align_wmr_scanout),
	.siclk(aclk_wmr),
	.din({fbdic0_lane_align_in,fbdic1_lane_align_in}),
	.dout({fbdic0_lane_align_out,fbdic1_lane_align_out}),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic0_lane_align = fbdic0_lane_align_out | fbdic0_lane_align_in;
assign fbdic1_lane_align = fbdic1_lane_align_out | fbdic1_lane_align_in;

//////////////////////////////////////////////////////////////////////////////////
// Free running counter:  when a request is issued, the counter value plus the 
// channel latency is stored in a fifo.  When the counter reaches the value at
// the head of the fifo, rddata_vld is asserted for reads, status is detected for
// sync/soft channel reset frames, and idle/alert frame detects are generated for
// write requests.
//////////////////////////////////////////////////////////////////////////////////

assign fbdic_chnl_latency_cntr_in[7:0] = fbdic_chnl_latency_cntr[7:0] + 8'h1;
mcu_fbdic_ctl_msff_ctl_macro__width_8 ff_chnl_latency_cntr  (
	.scan_in(ff_chnl_latency_cntr_scanin),
	.scan_out(ff_chnl_latency_cntr_scanout),
	.din(fbdic_chnl_latency_cntr_in[7:0]),
	.dout(fbdic_chnl_latency_cntr[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_latq_enq = (drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_RD | drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_WR | 
				drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_WR | drif_dram_cmd_c[2:0] == `FBD_DRAM_CMD_WR) | 
				fbdic_config_reg_read | fbdic_sync_frame_req | fbdic_scr_frame_req;
assign fbdic_latq_deq = (fbdic_chnl_latency_cntr[7:0] == fbdic_latq_dout[7:0]) & ~fbdic_latq_empty;

assign fbdic_rddata_vld_d0 = fbdic_latq_deq & fbdic_latq_dout[11:8] == 4'h0;
mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_rddata_vld_d1  (
	.scan_in(ff_rddata_vld_d1_scanin),
	.scan_out(ff_rddata_vld_d1_scanout),
	.din({fbdic_rddata_vld_d0,fbdic_rddata_vld_d1,fbdic_rddata_vld_d2}),
	.dout({fbdic_rddata_vld_d1,fbdic_rddata_vld_d2,fbdic_rddata_vld_d3}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_rddata_vld = fbdic_rddata_vld_d0 | fbdic_rddata_vld_d1 | 
				drif_single_channel_mode & (fbdic_rddata_vld_d2 | fbdic_rddata_vld_d3);
assign fbdic_rddata_vld_l = ~(fbdic_rddata_vld | fbdic_cnfgreg_rddata_vld);

assign fbdic_woq_free[1:0] = fbdic_latq_deq & fbdic_latq_dout[11:8] == 4'h1 ? 2'h1 : 
			     fbdic_latq_deq & fbdic_latq_dout[11:8] == 4'h2 ? 2'h2 : 2'h0;

assign fbdic_status_frame = fbdic_latq_deq    & fbdic_latq_dout[11:8]     == 4'h4 |
			    fbdic_latq_deq_d1 & fbdic_latq_dout_reg[11:8] == 4'h5 |
			    fbdic_latq_deq_d2 & fbdic_latq_dout_reg[11:8] == 4'h6 |
			    fbdic_latq_deq_d3 & fbdic_latq_dout_reg[11:8] == 4'h7;

assign fbdic_latq_deq_d0 = fbdic_latq_deq & fbdic_latq_dout[11:10] == 2'h1;
mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_latq_deq_dly  (
	.scan_in(ff_latq_deq_dly_scanin),
	.scan_out(ff_latq_deq_dly_scanout),
	.din( {fbdic_latq_deq_d0, fbdic_latq_deq_d1, fbdic_latq_deq_d2}),
	.dout({fbdic_latq_deq_d1, fbdic_latq_deq_d2, fbdic_latq_deq_d3}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_latq_dout_reg_en = fbdic_latq_deq & fbdic_latq_dout[11:10] == 2'h1;
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 ff_latq_dout_reg  (
	.scan_in(ff_latq_dout_reg_scanin),
	.scan_out(ff_latq_dout_reg_scanout),
	.din(fbdic_latq_dout[11:8]),
	.dout(fbdic_latq_dout_reg[11:8]),
	.en(fbdic_latq_dout_reg_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_scr_response_frame = fbdic_latq_deq & fbdic_latq_dout[11:8] == 4'h3;
mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_status_frame_d1  (
	.scan_in(ff_status_frame_d1_scanin),
	.scan_out(ff_status_frame_d1_scanout),
	.din({fbdic_status_frame, fbdic_scr_response_frame}),
	.dout({fbdic_status_frame_d1, fbdic_scr_response_frame_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_cnfgreg_rddata_vld_in = fbdic_latq_deq & fbdic_latq_dout[11:8] == 4'h8;
assign fbdic_cnfgreg_data_in[31:0] = fbdic_config_reg_addr[15] ? fbdird1_cnfgreg_data[31:0] : fbdird0_cnfgreg_data[31:0];

assign fbdic_cnfgreg_data_32_in = fbdic_cnfgreg_rddata_vld & ~fbdic_cfgrd_crc_error & fbdic_l0_state;

mcu_fbdic_ctl_msff_ctl_macro__width_34 ff_cnfgreg_data  (
	.scan_in(ff_cnfgreg_data_scanin),
	.scan_out(ff_cnfgreg_data_scanout),
	.din({fbdic_cnfgreg_rddata_vld_in,fbdic_cnfgreg_data_32_in,fbdic_cnfgreg_data_in[31:0]}),
	.dout({fbdic_cnfgreg_rddata_vld,fbdic_cnfgreg_data[32:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// FIFO entries
//--------------------------------------
// bits [11:8]
// 	0 - read
// 	1 - 1 write
// 	2 - 2 writes
// 	3 - SCR
// 	4-7 - Sync + delay
// 	8 Cfg Read
// bits [7:0] - latency value

assign fbdic_latq_xaction[3:0] = fbdic_sync_frame_req ? {2'h1, fbdic_sync_sd[1:0]} :
				 fbdic_scr_frame_req ? 4'h3 :
				 (drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_RD) ? 4'h0 :
				 (drif_dram_cmd_a[2:0] == `FBD_DRAM_CMD_WR) ? 4'h1 :
				 (drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_WR & drif_dram_cmd_c[2:0] == `FBD_DRAM_CMD_WR) ? 4'h2 :
				 (drif_dram_cmd_b[2:0] == `FBD_DRAM_CMD_WR | drif_dram_cmd_c[2:0] == `FBD_DRAM_CMD_WR) ? 4'h1 :
				 fbdic_config_reg_read ? 4'h8 : 4'h0;

assign fbd_delay[7:0] = {7'h0,~inv_fbd_delay_0};
mcu_fbdic_ctl_msff_ctl_macro ff_fbd_delay (
	.scan_in(ff_fbd_delay_scanin),
	.scan_out(ff_fbd_delay_scanout),
	.din(1'b0),
	.dout(inv_fbd_delay_0),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_latq_din[11:0] = {fbdic_latq_xaction[3:0], fbdic_chnl_latency_cntr[7:0] + fbdic_rt_lat0[7:0] + fbd_delay[7:0]};

mcu_latq_ctl latq (
	.scan_in(latq_scanin),
	.scan_out(latq_scanout),
	.l1clk(l1clk),
	.latq_enq(fbdic_latq_enq),
	.latq_din(fbdic_latq_din[11:0]),
	.latq_deq(fbdic_latq_deq),
	.latq_dout(fbdic_latq_dout[11:0]),
	.latq_full(fbdic_latq_full),
	.latq_empty(fbdic_latq_empty),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Qualify status frames with amb_mask
assign fbdic0_status_parity[11:0] = ~lndskw0_status_parity[11:0] & fbdic_amb_mask[11:0];
assign fbdic1_status_parity[11:0] = ~lndskw1_status_parity[11:0] & fbdic_amb_mask[11:0] & {12{~drif_single_channel_mode}};
assign fbdic0_alert_asserted[11:0] = lndskw0_alert_asserted[11:0] & fbdic_amb_mask[11:0];
assign fbdic1_alert_asserted[11:0] = lndskw1_alert_asserted[11:0] & fbdic_amb_mask[11:0] & {12{~drif_single_channel_mode}};

// FBD channel error types
assign fbdic_crc_error = (~(fbdird_crc_cmp0_0 & fbdird_crc_cmp0_1 & fbdird_crc_cmp1_0 & fbdird_crc_cmp1_1) | 
				fbdic_inj_crc_err) & fbdic_rddata_vld & ~fbdic_chnl_reset_error_mode;

assign fbdic_status_parity_error_en = ((|fbdic0_status_parity[11:0]) | (|fbdic1_status_parity[11:0]) | fbdic_inj_sfp_err) &
 					fbdic_status_frame & ~fbdic_chnl_reset_error_mode & fbdic_l0_state;
assign fbdic_alert_asserted_en = ((|fbdic0_alert_asserted[11:0]) | (|fbdic1_alert_asserted[11:0]) | fbdic_inj_aa_err) & 
				 fbdic_status_frame & ~fbdic_chnl_reset_error_mode & ~fbdic_status_parity_error_en & 
						fbdic_l0_state;
assign fbdic_alert_frame_en = (((&lndskw0_alert_match[12:0]) | ((&lndskw1_alert_match[12:0]) & ~drif_single_channel_mode)) |
				fbdic_inj_af_err) & ~fbdic_chnl_reset_error_mode & fbdic_l0_state & ~rdpctl_mask_err;

assign fbdic_status_parity_error_in = fbdic_status_parity_error_en | fbdic_status_parity_error & ~fbdic_status_parity_error_clr;
assign fbdic_alert_asserted_in = fbdic_alert_asserted_en | fbdic_alert_asserted & ~fbdic_alert_asserted_clr;
assign fbdic_alert_frame_in = fbdic_alert_frame_en | fbdic_alert_frame & ~fbdic_alert_frame_clr;

assign fbdic_status_parity_error_clr = fbdic_err_unrecov_in | fbdic_err_recov_in;
assign fbdic_alert_asserted_clr = fbdic_err_unrecov_in | fbdic_err_recov_in;
assign fbdic_alert_frame_clr = fbdic_err_unrecov_in | fbdic_err_recov_in;

mcu_fbdic_ctl_msff_ctl_macro__width_4 ff_fbd_error  (
	.scan_in(ff_fbd_error_scanin),
	.scan_out(ff_fbd_error_scanout),
	.din({fbdic_status_parity_error_in,fbdic_alert_asserted_in,fbdic_alert_frame_in,fbdic_fbd_error_in}),
	.dout({fbdic_status_parity_error,fbdic_alert_asserted,fbdic_alert_frame,fbdic_fbd_error}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_fbd_error_in = fbdic_err_unrecov | fbdic_err_recov | rdpctl_crc_recov_err | rdpctl_crc_unrecov_err;

// delay alert asserted and status parity error enables for one cycle for error state machine
mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_fbd_error_dly  (
	.scan_in(ff_fbd_error_dly_scanin),
	.scan_out(ff_fbd_error_dly_scanout),
	.din({fbdic_status_parity_error_en,fbdic_alert_asserted_en}),
	.dout({fbdic_status_parity_error_en_d1,fbdic_alert_asserted_en_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_fbd_error_save_clr = fbdic_err_unrecov | fbdic_err_recov | rdpctl_crc_recov_err | rdpctl_crc_unrecov_err;
assign fbdic_spe_in = fbdic_status_parity_error | fbdic_spe;
assign fbdic_aa_in = fbdic_alert_asserted | fbdic_aa;
assign fbdic_af_in = fbdic_alert_frame | fbdic_af;
assign fbdic_scr_in = fbdic_err_state[`FBDIC_ERR_SCRST] | fbdic_scr;
assign fbdic_fr_in = fbdic_err_state[`FBDIC_ERR_FASTRST] | drif_err_state_crc_fr | fbdic_fr;
mcu_fbdic_ctl_msff_ctl_macro__clr_1__width_5 ff_fbd_error_save  (
	.scan_in(ff_fbd_error_save_scanin),
	.scan_out(ff_fbd_error_save_scanout),
	.din({fbdic_spe_in, fbdic_aa_in, fbdic_af_in,fbdic_scr_in,fbdic_fr_in}),
	.dout({fbdic_spe, fbdic_aa, fbdic_af,fbdic_scr,fbdic_fr}),
	.clr(fbdic_fbd_error_save_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Idle frame detect, used for retiring writes
assign fbdic_idle_frame = (&lndskw0_idle_match[12:0]) & ((&lndskw1_idle_match[12:0]) | drif_single_channel_mode) & 
				~fbdic_latq_deq & ~fbdic_rddata_vld;

assign fbdic_clear_wrq_ent = (fbdic_idle_frame & ~fbdic_status_frame | 
				fbdic_status_frame & ~fbdic_status_parity_error_in & ~fbdic_alert_asserted_in) & 
					fbdic_err_state[`FBDIC_ERR_IDLE];

assign fbdic_chnl_alert_clr = fbdic_err_unrecov | fbdic_err_recov;
mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_24 ff_chnl_alert  (
	.scan_in(ff_chnl_alert_scanin),
	.scan_out(ff_chnl_alert_scanout),
	.din({fbdic0_alert_asserted[11:0],fbdic1_alert_asserted[11:0]}),
	.dout({fbdic0_chnl_alert[11:0],fbdic1_chnl_alert[11:0]}),
	.en(fbdic_alert_asserted_en),
	.clr(fbdic_chnl_alert_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Control signals from fbdiwr data path block
assign fbdic_train_seq = ~fbdic_l0_state;
assign fbdic_train_seq_l = fbdic_l0_state;
assign fbdic_data_sel[4:0] = fbdic_loopback[1] ? {fbdic_loopback[0],~fbdic_loopback[0],3'h0} : 
			     fbdic_ibist_data_mode | fbdic_txstart ? 5'h4 : 
				{3'h0,~fbdic_l0_state,fbdic_l0_state};

assign fbdic_special_cmd_l = ~fbdic_special_cmd;

assign fbdic0_cmd_crc_sel_in[1:0] = {~fbdic0_sb_failover, fbdic0_sb_failover};
assign fbdic0_data_crc_sel_in[2:0] = {~fbdic0_sb_failover & ~fbdic_special_cmd_in, 
					fbdic0_sb_failover & ~fbdic_special_cmd_in, 
					fbdic_special_cmd_in}; 
assign fbdic1_cmd_crc_sel_in[1:0] = {~fbdic1_sb_failover, fbdic1_sb_failover};
assign fbdic1_data_crc_sel_in[2:0] = {~fbdic1_sb_failover & ~fbdic_special_cmd_in, 
					fbdic1_sb_failover & ~fbdic_special_cmd_in, 
					fbdic_special_cmd_in}; 

mcu_fbdic_ctl_msff_ctl_macro__width_5 ff_crc_sel0  (
	.scan_in(ff_crc_sel0_scanin),
	.scan_out(ff_crc_sel0_scanout),
	.din({fbdic0_cmd_crc_sel_in[1:0],fbdic0_data_crc_sel_in[2:0]}),
	.dout({fbdic0_cmd_crc_sel[1:0],fbdic0_data_crc_sel[2:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fbdic_ctl_msff_ctl_macro__width_5 ff_crc_sel1  (
	.scan_in(ff_crc_sel1_scanin),
	.scan_out(ff_crc_sel1_scanout),
	.din({fbdic1_cmd_crc_sel_in[1:0],fbdic1_data_crc_sel_in[2:0]}),
	.dout({fbdic1_cmd_crc_sel[1:0],fbdic1_data_crc_sel[2:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_ucb_rd_data[65] = drif_ucb_rd_req_vld & drif_ucb_addr[11] & ~fbdic_ucb_rd_data[64] &
				drif_ucb_addr[12:0] != 13'h908 | (fbdic_cnfgreg_rddata_vld & ~fbdic_l0_state);

assign fbdic_ucb_rd_data[64:0] = {65{drif_ucb_rd_req_vld}} &
       {{65{drif_ucb_addr[12:0] == 13'h800}} & {1'b1, 56'h0, fbdic_fbd_state[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h808}} & {1'b1, 60'h0, fbdic_sync_ier_enable, fbdic_sync_r[1:0], fbdic_fast_reset} |
	{65{drif_ucb_addr[12:0] == 13'h810}} & {1'b1, 62'h0, fbdic_chnl_reset[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h818}} & {1'b1, 60'h0, fbdic_sb2nb_map[3:0]} |
	{65{drif_ucb_addr[12:0] == 13'h820}} & {1'b1, 40'h0, fbdic_amb_test_param[23:0]} |
	{65{drif_ucb_addr[12:0] == 13'h828}} & {1'b1, 48'h0, fbdic_failover_config[15:0]} |
	{65{drif_ucb_addr[12:0] == 13'h830}} & {1'b1, 36'h0, fbdic_elect_idle_detect[27:0]} |
	{65{drif_ucb_addr[12:0] == 13'h838}} & {1'b1, 56'h0, fbdic_tdisable_period[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h840}} & {1'b1, 63'h0, fbdic_tdisable_done} |
	{65{drif_ucb_addr[12:0] == 13'h848}} & {1'b1, 44'h0, fbdic_tcalibrate_period[19:0]} |
	{65{drif_ucb_addr[12:0] == 13'h850}} & {1'b1, 63'h0, fbdic_tcalibrate_done} |
	{65{drif_ucb_addr[12:0] == 13'h858}} & {1'b1, 56'h0, fbdic_tclktrain_min[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h860}} & {1'b1, 62'h0, fbdic_tclktrain_done[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h868}} & {1'b1, 56'h0, fbdic_tclktrain_timeout[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h870}} & {1'b1, 62'h0, fbdic_testing_done[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h878}} & {1'b1, 56'h0, fbdic_testing_timeout[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h880}} & {1'b1, 62'h0, fbdic_polling_done[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h888}} & {1'b1, 56'h0, fbdic_polling_timeout[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h890}} & {1'b1, 62'h0, fbdic_config_done[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h898}} & {1'b1, 56'h0, fbdic_config_timeout[7:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8a0}} & {1'b1, 48'h0, fbdic_per_rank_cke[15:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8a8}} & {1'b1, 57'h0, fbdic_l0s_time[6:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8b0}} & {1'b1, 58'h0, fbdic_sync_frm_period[5:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8b8}} & {1'b1, 48'h0, fbdic_chnl_read_lat[15:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8c0}} & {1'b1, 58'h0, fbdic_chnl_cap[5:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8c8}} & {1'b1, 62'h0, fbdic_loopback[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8d0}} & {1'b1, 34'h0, fbdic_sds_config[29:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8d8}} & {1'b1, 16'h0, fbdic_sds_invert[47:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8e0}} & {1'b1, 32'h0, fbdic_sds_testcfg[31:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8e8}} & {1'b1, 58'h0, fbdic_sds_pll_status[5:0]} |
	{65{drif_ucb_addr[12:0] == 13'h8f0}} & {1'b1, 16'h0, fbdic_sds_test_status[47:0]} |
	{65{drif_ucb_addr[12:0] == 13'h900}} & {1'b1, 48'h0, fbdic_config_reg_addr[15:2], 2'h0} |
	{65{drif_ucb_addr[12:0] == 13'h908}} & {1'b0, 64'h0} |
	{65{drif_ucb_addr[12:0] == 13'ha00}} & {1'b1, 16'h0, fbdic_thermal_trip[47:0]} |
	{65{drif_ucb_addr[12:0] == 13'hc00}} & {1'b1, fbdic_mcu_syndrome[30], 33'h0, fbdic_mcu_syndrome[29:0]} |
	{65{drif_ucb_addr[12:0] == 13'hc08}} & {1'b1, 62'h0, fbdic_inj_err_src[1:0]} |
	{65{drif_ucb_addr[12:0] == 13'hc10}} & {1'b1, 47'h0, fbdic_fbr_count[16:0]} |
	{65{drif_ucb_addr[12:0] == 13'he80}} & {1'b1,  8'h0, fbdic_sbfibportctl[23:0], fbdic_sbfibpgctl[31:0]} |
	{65{drif_ucb_addr[12:0] == 13'he88}} & {1'b1,  8'h0, fbdic_sbfibpattbuf1[23:0], 22'h0, fbdic_sbfibtxmsk[9:0]} |
	{65{drif_ucb_addr[12:0] == 13'he90}} & {1'b1, 54'h0, fbdic_sbfibtxshft[9:0]} |
	{65{drif_ucb_addr[12:0] == 13'hea0}} & {1'b1,  8'h0, fbdic_sbfibpattbuf2[23:0], 22'h0, fbdic_sbfibpatt2en[9:0]} |
	{65{drif_ucb_addr[12:0] == 13'heb0}} & {1'b1,  1'b0, fbdic_sbfibinit[30:0], 8'h0, fbdic_sbibistmisc[23:0]} |
	{65{drif_ucb_addr[12:0] == 13'hec0}} & {1'b1,  8'h0, fbdic_nbfibportctl[23:0], fbdic_nbfibpgctl[31:0]} |
	{65{drif_ucb_addr[12:0] == 13'hec8}} & {1'b1,  8'h0, fbdic_nbfibpattbuf1[23:0], 32'h0} |
	{65{drif_ucb_addr[12:0] == 13'hed0}} & {1'b1, 18'h0, fbdic_nbfibrxmsk[13:0], 32'h0} |
	{65{drif_ucb_addr[12:0] == 13'hed8}} & {1'b1, 18'h0, fbdic_nbfibrxshft[13:0], 18'h0, fbdic_nbfibrxlnerr[13:0]} |
	{65{drif_ucb_addr[12:0] == 13'hee0}} & {1'b1,  8'h0, fbdic_nbfibpattbuf2[23:0], 18'h0, fbdic_nbfibpatt2en[13:0]}} |
	{65{fbdic_cnfgreg_data[32]}} & {1'b1, 32'h0, fbdic_cnfgreg_data[31:0]};

//
assign fbdic_error_mode = ~fbdic_err_state[`FBDIC_ERR_IDLE];

assign fbdic_scr_frame_req = fbdic_sync_frame_req_d2 & fbdic_err_state[`FBDIC_ERR_SCRST] & fbdic_scr_qual;

assign fbdic_scr_qual_in = fbdic_sync_frame_req_d2 & fbdic_err_state[`FBDIC_ERR_SCRST] & ~fbdic_scr_qual ? 1'b1 :
			   fbdic_scr_frame_req ? 1'b0 : fbdic_scr_qual;

mcu_fbdic_ctl_msff_ctl_macro scr_qual (
	.scan_in(scr_qual_scanin),
	.scan_out(scr_qual_scanout),
	.din(fbdic_scr_qual_in),
	.dout(fbdic_scr_qual),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// wait 4 cycles after sync frame  request to send fast reset (of IER bit in sync frame)
assign fbdic_err_fast_chnl_reset_p2 = (drif_err_state_crc_fr | fbdic_err_state[`FBDIC_ERR_FASTRST]) & 
				      fbdic_sync_frame_req_d2 & ~fbdic_fr_issued;

mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_err_fast_chnl_reset  (
	.scan_in(ff_err_fast_chnl_reset_scanin),
	.scan_out(ff_err_fast_chnl_reset_scanout),
	.din({fbdic_err_fast_chnl_reset_p2,fbdic_err_fast_chnl_reset_p1}),
	.dout({fbdic_err_fast_chnl_reset_p1,fbdic_err_fast_chnl_reset}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_err_fast_reset_done = (drif_err_state_crc_fr | fbdic_err_state[`FBDIC_ERR_FASTRST]) & fbdic_chnl_reset_clr;

// Check for recoverable and unrecoverable errors
assign fbdic_err_recov_in = (fbdic_err_state[`FBDIC_ERR_STS] & fbdic_status_frame & ~fbdic_status_parity_error_en |
			    fbdic_err_state[`FBDIC_ERR_STS2] & fbdic_status_frame & ~fbdic_status_parity_error_en |
			    fbdic_err_state[`FBDIC_ERR_FASTRST_STS] & fbdic_status_frame_d1 & ~fbdic_alert_frame_en &
				~fbdic_status_parity_error_en_d1 | fbdic_cfgrd_crc_error) & fbdic_l0_state;

mcu_fbdic_ctl_msff_ctl_macro ff_err_recov (
	.scan_in(ff_err_recov_scanin),
	.scan_out(ff_err_recov_scanout),
	.din(fbdic_err_recov_in),
	.dout(fbdic_err_recov),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// ASW - 04/18/06
// REMOVED fbdic_alert_asserted_en_d1 because AA should never cause an FBU.
assign fbdic_err_unrecov_in = fbdic_err_state[`FBDIC_ERR_FASTRST_STS] & fbdic_l0_state & fbdic_status_frame_d1 &
				(fbdic_alert_frame_en | fbdic_status_parity_error_en_d1);

mcu_fbdic_ctl_msff_ctl_macro ff_err_unrecov (
	.scan_in(ff_err_unrecov_scanin),
	.scan_out(ff_err_unrecov_scanout),
	.din(fbdic_err_unrecov_in),
	.dout(fbdic_err_unrecov),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Error handling state machine
assign inv_fbdic_err_state_in[0] = ~fbdic_err_state_in[0];
assign fbdic_err_state[0] = ~inv_fbdic_err_state[0];

// 0in one_hot -var fbdic_err_state[6:0]
mcu_fbdic_ctl_msff_ctl_macro__width_7 ff_err_state  (
	.scan_in(ff_err_state_scanin),
	.scan_out(ff_err_state_scanout),
	.din({fbdic_err_state_in[6:1],inv_fbdic_err_state_in[0]}),
	.dout({fbdic_err_state[6:1],inv_fbdic_err_state[0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

always @(fbdic_alert_asserted or fbdic_alert_frame or fbdic_err_state or fbdic_status_frame or 
	fbdic_sync_frame_req_d2 or fbdic_mcu_synd_valid or fbdic_chnl_reset_error or 
	fbdic_scr_response_frame or fbdic_mcu_synd_aa or fbdic_status_parity_error_en or 
	fbdic_status_parity_error or fbdic_disable_state or fbdic_err_unrecov or fbdic_err_recov or 
	fbdic_alert_frame_en or fbdic_mcu_synd_fr or fbdic_fbu_error or fbdic_scr_qual) 
begin

	fbdic_err_state_in[6:0] = fbdic_err_state[6:0];
	case (1'b1)

	// State 7'h1
	fbdic_err_state[`FBDIC_ERR_IDLE]: begin

		// For status parity error or alert asserted, wait for next status frame
		// ignore alert_asserted until software clears valid bit (should be after clearing Alert bits in AMBs)
		if (fbdic_status_parity_error & ~(fbdic_fbu_error & fbdic_mcu_synd_valid & fbdic_mcu_synd_fr) |
		    fbdic_alert_asserted & ~(fbdic_mcu_synd_valid & fbdic_mcu_synd_aa) & ~fbdic_err_recov) 
			fbdic_err_state_in[6:0] = `FBDIC_ERR_STS_ST;

		// For alert frame, issue SCR immediately
		else if (fbdic_alert_frame & ~(fbdic_fbu_error & fbdic_mcu_synd_valid & fbdic_mcu_synd_fr))
			fbdic_err_state_in[6:0] = `FBDIC_ERR_SCRST_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_IDLE_ST;
	end

	// State 7'h2
	fbdic_err_state[`FBDIC_ERR_STS]: begin

		// If status parity error persists, or alert frame is detected, issue SCR
		if (fbdic_status_frame & fbdic_status_parity_error_en | fbdic_alert_frame)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_SCRST_ST;

		// If status parity error is gone, return to Idle -> FBR
		// If alert_asserted is the only error detected, it is logged as FBR
		else if (fbdic_status_frame & ~fbdic_status_parity_error_en)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_IDLE_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_STS_ST;
	end

	// State 7'h4
	fbdic_err_state[`FBDIC_ERR_SCRST]: begin

		// Issue SCR two cycles after next sync frame request
		if (fbdic_sync_frame_req_d2 & fbdic_scr_qual)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_SCRST_STS_ST;
		else 
			fbdic_err_state_in[6:0] = `FBDIC_ERR_SCRST_ST;
	end

	// State 7'h8
	fbdic_err_state[`FBDIC_ERR_SCRST_STS]: begin

		// When SCR completes, check that Alert frames have stopped
		// If they have, wait for next status frame
		if (fbdic_scr_response_frame & ~fbdic_alert_frame_en)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_STS2_ST;

		// if Alert frames haven't stopped, issue fast reset
		else if (fbdic_scr_response_frame & fbdic_alert_frame_en)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_FASTRST_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_SCRST_STS_ST;
	end

	// State 7'h10
	fbdic_err_state[`FBDIC_ERR_STS2]: begin

		// Check next status frame for status parity error
		// If none, return to Idle (alert may be asserted from Alert frames)
		if (fbdic_status_frame & ~fbdic_status_parity_error_en)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_IDLE_ST;

		// If status parity error or Alert frames, issue fast reset
		else if (fbdic_status_frame & fbdic_status_parity_error_en |
			 	fbdic_alert_frame_en)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_FASTRST_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_STS2_ST;
	end

	// State 7'h20
	fbdic_err_state[`FBDIC_ERR_FASTRST]: begin

	// Wait until Fast reset starts
		if (fbdic_disable_state)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_FASTRST_STS_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_FASTRST_ST;
	end

	// State 7'h40
	fbdic_err_state[`FBDIC_ERR_FASTRST_STS]: begin

		// Wait until Fast reset is completed
		if (fbdic_err_unrecov | fbdic_err_recov | fbdic_chnl_reset_error)
			fbdic_err_state_in[6:0] = `FBDIC_ERR_IDLE_ST;
		else
			fbdic_err_state_in[6:0] = `FBDIC_ERR_FASTRST_STS_ST;
	end

	default: ;
	endcase
end

///////////////////////////////
// IBIST Registers
///////////////////////////////
// SBFIBPORTCTL: 0x680
assign fbdic_sbfibportctl_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE80;
assign fbdic_sbfibportctl_in[5:3] = drif_ucb_data[37:35];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 pff_sbfibportctl  ( // FS:wmr_protect
	.scan_in(pff_sbfibportctl_wmr_scanin),
	.scan_out(pff_sbfibportctl_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibportctl_in[5:3]),
	.dout(fbdic_sbfibportctl[5:3]),
	.en(fbdic_sbfibportctl_en),
	.l1clk(l1clk),
  .soclk(soclk));

// These bits are not used by the transmitter and are read only
assign fbdic_sbfibportctl[23:6] = 18'h0;
assign fbdic_sbfibportctl[1] = 1'b1;

// Set ibist done flag, write-1 to clear
assign fbdic_ibtx_done_flag_in = ibtx_done ? 1'b1 : 
				  fbdic_sbfibportctl_en & drif_ucb_data[34] | fbdic_ibtx_start_ld ? 1'b0 :
				  fbdic_ibtx_done_flag;
mcu_fbdic_ctl_msff_ctl_macro pff_ibtx_done_flag ( // FS:wmr_protect
	.scan_in(pff_ibtx_done_flag_wmr_scanin),
	.scan_out(pff_ibtx_done_flag_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_ibtx_done_flag_in),
	.dout(fbdic_ibtx_done_flag),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_sbfibportctl[2] = fbdic_ibtx_done_flag;

// Start ibist transmitter
assign fbdic_ibtx_start_ld = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE80 & drif_ucb_data[32];
assign fbdic_ibtx_start_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE80 | ibtx_done;
assign fbdic_sbfibportctl_in[0] = ibtx_done ? 1'b0 : drif_ucb_data[32];
mcu_fbdic_ctl_msff_ctl_macro__en_1 pff_ibtx_start  ( // FS:wmr_protect
	.scan_in(pff_ibtx_start_wmr_scanin),
	.scan_out(pff_ibtx_start_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibportctl_in[0]),
	.dout(fbdic_sbfibportctl[0]),
	.en(fbdic_ibtx_start_en),
	.l1clk(l1clk),
  .soclk(soclk));
assign fbdic_ibtx_start = fbdic_sbfibportctl[0];

// SBFIBPGCTL: 0x684
assign fbdic_sbfibpgctl_reset_val[31:0] = {6'hf, 5'h0, 1'b0, 7'hf, 3'h1, 7'hf, 3'h0};
assign fbdic_sbfibpgctl_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE80;
assign fbdic_sbfibpgctl_in[31:0] = drif_ucb_data[31:0] ^ fbdic_sbfibpgctl_reset_val[31:0];
assign fbdic_sbfibpgctl[31:0] = fbdic_sbfibpgctl_out[31:0] ^ fbdic_sbfibpgctl_reset_val[31:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_32 pff_sbfibpgctl  ( // FS:wmr_protect
	.scan_in(pff_sbfibpgctl_wmr_scanin),
	.scan_out(pff_sbfibpgctl_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibpgctl_in[31:0]),
	.dout(fbdic_sbfibpgctl_out[31:0]),
	.en(fbdic_sbfibpgctl_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBPATTBUF1: 0x688
assign fbdic_sbfibpattbuf1_reset_val[23:0] = 24'h02ccfd;
assign fbdic_sbfibpattbuf1_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE88;
assign fbdic_sbfibpattbuf1_in[23:0] = drif_ucb_data[55:32] ^ fbdic_sbfibpattbuf1_reset_val[23:0];
assign fbdic_sbfibpattbuf1[23:0] = fbdic_sbfibpattbuf1_out[23:0] ^ fbdic_sbfibpattbuf1_reset_val[23:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_sbfibpattbuf1  ( // FS:wmr_protect
	.scan_in(pff_sbfibpattbuf1_wmr_scanin),
	.scan_out(pff_sbfibpattbuf1_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibpattbuf1_in[23:0]),
	.dout(fbdic_sbfibpattbuf1_out[23:0]),
	.en(fbdic_sbfibpattbuf1_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBTXMSK: 0x68C
assign fbdic_sbfibtxmsk_reset_val[9:0] = 10'h3ff;
assign fbdic_sbfibtxmsk_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE88;
assign fbdic_sbfibtxmsk_in[9:0] = drif_ucb_data[9:0] ^ fbdic_sbfibtxmsk_reset_val[9:0];
assign fbdic_sbfibtxmsk[9:0] = fbdic_sbfibtxmsk_out[9:0] ^ fbdic_sbfibtxmsk_reset_val[9:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_10 pff_sbfibtxmsk  ( // FS:wmr_protect
	.scan_in(pff_sbfibtxmsk_wmr_scanin),
	.scan_out(pff_sbfibtxmsk_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibtxmsk_in[9:0]),
	.dout(fbdic_sbfibtxmsk_out[9:0]),
	.en(fbdic_sbfibtxmsk_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBRXMSK: 0x690 - NOT NEEDED

// SBFIBTXSHFT: 0x694
assign fbdic_sbfibtxshft_reset_val[9:0] = 10'h3ff;
assign fbdic_sbfibtxshft_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hE90;
assign fbdic_sbfibtxshft_in[9:0] = drif_ucb_data[9:0] ^ fbdic_sbfibtxshft_reset_val[9:0];
assign fbdic_sbfibtxshft[9:0] = fbdic_sbfibtxshft_out[9:0] ^ fbdic_sbfibtxshft_reset_val[9:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_10 pff_sbfibtxshft  ( // FS:wmr_protect
	.scan_in(pff_sbfibtxshft_wmr_scanin),
	.scan_out(pff_sbfibtxshft_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibtxshft_in[9:0]),
	.dout(fbdic_sbfibtxshft_out[9:0]),
	.en(fbdic_sbfibtxshft_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBRXSHFT: 0x698 - NOT NEEDED

// SBFIBRXLNERR: 0x69C - NOT NEEDED

// SBFIBPATTBUF2: 0x6A0
assign fbdic_sbfibpattbuf2_reset_val[23:0] = 24'hfd3302;
assign fbdic_sbfibpattbuf2_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEA0;
assign fbdic_sbfibpattbuf2_in[23:0] = drif_ucb_data[55:32] ^ fbdic_sbfibpattbuf2_reset_val[23:0];
assign fbdic_sbfibpattbuf2[23:0] = fbdic_sbfibpattbuf2_out[23:0] ^ fbdic_sbfibpattbuf2_reset_val[23:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_sbfibpattbuf2  ( // FS:wmr_protect
	.scan_in(pff_sbfibpattbuf2_wmr_scanin),
	.scan_out(pff_sbfibpattbuf2_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibpattbuf2_in[23:0]),
	.dout(fbdic_sbfibpattbuf2_out[23:0]),
	.en(fbdic_sbfibpattbuf2_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBPATT2EN: 0x6A4
assign fbdic_sbfibpatt2en_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEA0;
assign fbdic_sbfibpatt2en_in[9:0] = drif_ucb_data[9:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_10 pff_sbfibpatt2en  ( // FS:wmr_protect
	.scan_in(pff_sbfibpatt2en_wmr_scanin),
	.scan_out(pff_sbfibpatt2en_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbfibpatt2en_in[9:0]),
	.dout(fbdic_sbfibpatt2en[9:0]),
	.en(fbdic_sbfibpatt2en_en),
	.l1clk(l1clk),
  .soclk(soclk));

// SBFIBINIT: 0x6B0
assign fbdic_sbfibinit_reset_val[30:0] = {10'hc8,8'h1,10'h100,1'b1,1'b0,1'b0};
assign fbdic_sbfibinit_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEB0;
assign fbdic_sbfibinit_in[30:0] = drif_ucb_data[62:32] ^ fbdic_sbfibinit_reset_val[30:0];
assign fbdic_sbfibinit[30:0] = fbdic_sbfibinit_out[30:0] ^ fbdic_sbfibinit_reset_val[30:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_30 pff_sbfibinit  ( // FS:wmr_protect
	.scan_in(pff_sbfibinit_wmr_scanin),
	.scan_out(pff_sbfibinit_wmr_scanout),
	.siclk(aclk_wmr),
	.din({fbdic_sbfibinit_in[30:2],fbdic_sbfibinit_in[0]}),
	.dout({fbdic_sbfibinit_out[30:2],fbdic_sbfibinit_out[0]}),
	.en(fbdic_sbfibinit_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_sbts0cnt[9:0] = fbdic_sbfibinit[30:21] - 10'h1;
assign fbdic_sbts1cnt[9:0] = {2'h0, fbdic_sbfibinit[20:13] - 8'h1};
assign fbdic_sbdiscnt[9:0] = fbdic_sbfibinit[12:3];
assign fbdic_sbcaliben = fbdic_sbfibinit[2];
assign fbdic_sbfibinit_out[1] = 1'b0;
assign fbdic_sbibistiniten = fbdic_sbfibinit[0];

assign fbdic_sbts_cnt_decr = ts0_cnt[3:0] == 4'hb | ibtx_done | ts2_cnt[2:0] == 3'h5 | ts3_cnt[2:0] == 3'h5;
assign fbdic_sbts_cnt_in[9:0] = fbdic_ibtx_start | fbdic_ibist_done ?
				(fbdic_fbd_state_in[2:0] == 3'h2 & fbdic_fbd_state_en ? fbdic_sbts0cnt[9:0] :
				fbdic_fbd_state_in[2:0] == 3'h3 & fbdic_fbd_state_en ? fbdic_sbts1cnt[9:0] :
				fbdic_fbd_state_in[2:1] == 2'h2 & fbdic_fbd_state_en ? 10'hf :
				fbdic_sbts_cnt[9:0] == 10'h0 ? 10'h0 : 
				fbdic_sbts_cnt_decr ? fbdic_sbts_cnt[9:0] - 10'h1 : fbdic_sbts_cnt[9:0]) : 10'h0;
				
mcu_fbdic_ctl_msff_ctl_macro__width_10 ff_sbts_cnt  (
	.scan_in(ff_sbts_cnt_scanin),
	.scan_out(ff_sbts_cnt_scanout),
	.din(fbdic_sbts_cnt_in[9:0]),
	.dout(fbdic_sbts_cnt[9:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// SBIBISTMISC: 0x6B4
assign fbdic_sbibistmisc_reset_val[23:0] = 24'h061a80;
assign fbdic_sbibistmisc_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEB0;
assign fbdic_sbibistmisc_in[23:0] = drif_ucb_data[23:0] ^ fbdic_sbibistmisc_reset_val[23:0];
assign fbdic_sbibistmisc[23:0] = fbdic_sbibistmisc_out[23:0] ^ fbdic_sbibistmisc_reset_val[23:0];

mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_sbibistmisc  ( // FS:wmr_protect
	.scan_in(pff_sbibistmisc_wmr_scanin),
	.scan_out(pff_sbibistmisc_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_sbibistmisc_in[23:0]),
	.dout(fbdic_sbibistmisc_out[23:0]),
	.en(fbdic_sbibistmisc_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign fbdic_ibist_ambid[3:0] = fbdic_sbibistmisc[23:20];
assign fbdic_sbibistcalperiod[19:0] = fbdic_sbibistmisc[19:0];

////////////////////////////////////////////////////////////

// NBFIBPORTCTL: 0x6C0
assign fbdic_nbfibportctl_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEC0;
assign fbdic_nbfibportctl_in[5:3] = drif_ucb_data[37:35];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 pff_nbfibportctl  ( // FS:wmr_protect
	.scan_in(pff_nbfibportctl_wmr_scanin),
	.scan_out(pff_nbfibportctl_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibportctl_in[5:3]),
	.dout(fbdic_nbfibportctl[5:3]),
	.en(fbdic_nbfibportctl_en),
	.l1clk(l1clk),
  .soclk(soclk));

// Read only and Write-1 to clear bits bits
assign fbdic_nbfibportctl[23:22] = 2'h0;
assign fbdic_nbfibportctl[21:12] = ibrx_errcnt[9:0];
assign fbdic_nbfibportctl[11:8] = ibrx_errlnnum[3:0];
assign fbdic_nbfibportctl[7:6] = ibrx_errstat[1:0];
assign fbdic_nbfibportctl[1] = 1'b0;

assign fbdic_ibrx_done_flag_in = ibrx_done ? 1'b1 : 
				  fbdic_nbfibportctl_en & drif_ucb_data[34] | fbdic_ibrx_start_ld ? 1'b0 :
				  fbdic_ibrx_done_flag;
mcu_fbdic_ctl_msff_ctl_macro pff_ibrx_done_flag (
	.scan_in(pff_ibrx_done_flag_scanin),
	.scan_out(pff_ibrx_done_flag_scanout),
	.din(fbdic_ibrx_done_flag_in),
	.dout(fbdic_ibrx_done_flag),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));
assign fbdic_nbfibportctl[2] = fbdic_ibrx_done_flag;

// start IBIST receive engine:  wait for start delimiter
assign fbdic_ibrx_start_ld = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEC0 & drif_ucb_data[32];
assign fbdic_ibrx_start_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEC0 | ibrx_done;
assign fbdic_nbfibportctl_in[0] = ibrx_done ? 1'b0 : drif_ucb_data[32];
mcu_fbdic_ctl_msff_ctl_macro__en_1 pff_ibrx_start  ( // FS:wmr_protect
	.scan_in(pff_ibrx_start_wmr_scanin),
	.scan_out(pff_ibrx_start_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibportctl_in[0]),
	.dout(fbdic_nbfibportctl[0]),
	.en(fbdic_ibrx_start_en),
	.l1clk(l1clk),
  .soclk(soclk));
assign fbdic_ibrx_start = fbdic_nbfibportctl[0];

// NBFIBPGCTL: 0x6C4
assign fbdic_nbfibpgctl_reset_val[31:0] = {6'hf, 5'h0, 1'b0, 7'hf, 3'h1, 7'hf, 3'h0};
assign fbdic_nbfibpgctl_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEC0;
assign fbdic_nbfibpgctl_in[31:0] = drif_ucb_data[31:0] ^ fbdic_nbfibpgctl_reset_val[31:0];
assign fbdic_nbfibpgctl[31:0] = fbdic_nbfibpgctl_out[31:0] ^ fbdic_nbfibpgctl_reset_val[31:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_32 pff_nbfibpgctl  ( // FS:wmr_protect
	.scan_in(pff_nbfibpgctl_wmr_scanin),
	.scan_out(pff_nbfibpgctl_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibpgctl_in[31:0]),
	.dout(fbdic_nbfibpgctl_out[31:0]),
	.en(fbdic_nbfibpgctl_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBPATTBUF1: 0x6C8
assign fbdic_nbfibpattbuf1_reset_val[23:0] = 24'h02ccfd;
assign fbdic_nbfibpattbuf1_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEC8;
assign fbdic_nbfibpattbuf1_in[23:0] = drif_ucb_data[55:32] ^ fbdic_nbfibpattbuf1_reset_val[23:0];
assign fbdic_nbfibpattbuf1[23:0] = fbdic_nbfibpattbuf1_out[23:0] ^ fbdic_nbfibpattbuf1_reset_val[23:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_nbfibpattbuf1  ( // FS:wmr_protect
	.scan_in(pff_nbfibpattbuf1_wmr_scanin),
	.scan_out(pff_nbfibpattbuf1_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibpattbuf1_in[23:0]),
	.dout(fbdic_nbfibpattbuf1_out[23:0]),
	.en(fbdic_nbfibpattbuf1_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBTXMSK: 0x6CC - NOT NEEDED

// NBFIBRXMSK: 0x6D0
assign fbdic_nbfibrxmsk_reset_val[13:0] = 14'h3fff;
assign fbdic_nbfibrxmsk_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hED0;
assign fbdic_nbfibrxmsk_in[13:0] = drif_ucb_data[45:32] ^ fbdic_nbfibrxmsk_reset_val[13:0];
assign fbdic_nbfibrxmsk[13:0] = fbdic_nbfibrxmsk_out[13:0] ^ fbdic_nbfibrxmsk_reset_val[13:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_14 pff_nbfibrxmsk  ( // FS:wmr_protect
	.scan_in(pff_nbfibrxmsk_wmr_scanin),
	.scan_out(pff_nbfibrxmsk_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibrxmsk_in[13:0]),
	.dout(fbdic_nbfibrxmsk_out[13:0]),
	.en(fbdic_nbfibrxmsk_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBTXSHFT: 0x6D4 - NOT NEEDED

// NBFIBRXSHFT: 0x6D8
assign fbdic_nbfibrxshft_reset_val[13:0] = 14'h3fff;
assign fbdic_nbfibrxshft_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hED8;
assign fbdic_nbfibrxshft_in[13:0] = drif_ucb_data[45:32] ^ fbdic_nbfibrxshft_reset_val[13:0];
assign fbdic_nbfibrxshft[13:0] = fbdic_nbfibrxshft_out[13:0] ^ fbdic_nbfibrxshft_reset_val[13:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_14 pff_nbfibrxshft  ( // FS:wmr_protect
	.scan_in(pff_nbfibrxshft_wmr_scanin),
	.scan_out(pff_nbfibrxshft_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibrxshft_in[13:0]),
	.dout(fbdic_nbfibrxshft_out[13:0]),
	.en(fbdic_nbfibrxshft_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBRXLNERR: 0x6DC
assign fbdic_nbfibrxlnerr[13:0] = ibrx_rxerrstat[13:0];

// NBFIBPATTBUF2: 0x6E0
assign fbdic_nbfibpattbuf2_reset_val[23:0] = 24'hfd3302;
assign fbdic_nbfibpattbuf2_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEE0;
assign fbdic_nbfibpattbuf2_in[23:0] = drif_ucb_data[55:32] ^ fbdic_nbfibpattbuf2_reset_val[23:0];
assign fbdic_nbfibpattbuf2[23:0] = fbdic_nbfibpattbuf2_out[23:0] ^ fbdic_nbfibpattbuf2_reset_val[23:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 pff_nbfibpattbuf2  ( // FS:wmr_protect
	.scan_in(pff_nbfibpattbuf2_wmr_scanin),
	.scan_out(pff_nbfibpattbuf2_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibpattbuf2_in[23:0]),
	.dout(fbdic_nbfibpattbuf2_out[23:0]),
	.en(fbdic_nbfibpattbuf2_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBPATT2EN: 0x6E4
assign fbdic_nbfibpatt2en_en = drif_ucb_wr_req_vld & drif_ucb_addr[12:0] == 13'hEE0;
assign fbdic_nbfibpatt2en_in[13:0] = drif_ucb_data[13:0];
mcu_fbdic_ctl_msff_ctl_macro__en_1__width_14 pff_nbfibpatt2en  ( // FS:wmr_protect
	.scan_in(pff_nbfibpatt2en_wmr_scanin),
	.scan_out(pff_nbfibpatt2en_wmr_scanout),
	.siclk(aclk_wmr),
	.din(fbdic_nbfibpatt2en_in[13:0]),
	.dout(fbdic_nbfibpatt2en[13:0]),
	.en(fbdic_nbfibpatt2en_en),
	.l1clk(l1clk),
  .soclk(soclk));

// NBFIBINIT: 0x6F0 - NOT NEEDED

// NBIBISTMISC: 0x6F4 - NOT NEEDED

// IBIST Transmit Engine
assign fbdic_ibist_data_mode_in = fbdic_txstart ? 1'b1 : ibtx_done ? 1'b0 : fbdic_ibist_data_mode;
mcu_fbdic_ctl_msff_ctl_macro ff_ibist_data (
	.scan_in(ff_ibist_data_scanin),
	.scan_out(ff_ibist_data_scanout),
	.din(fbdic_ibist_data_mode_in),
	.dout(fbdic_ibist_data_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_ibist_done_in = ibtx_done ? 1'b1 : 
				fbdic_ibtx_start_ld | fbdic_fbd_state[2:1] == 2'h3 ? 1'b0 : fbdic_ibist_done;
mcu_fbdic_ctl_msff_ctl_macro ff_ibist_done (
	.scan_in(ff_ibist_done_scanin),
	.scan_out(ff_ibist_done_scanout),
	.din(fbdic_ibist_done_in),
	.dout(fbdic_ibist_done),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_txstart = fbdic_sbfibportctl[0] & (ts1_cnt[5:0] == 6'h3) & ~fbdic_ibist_data_mode;

// IBIST Receive Engine
assign fbdic_ibrx_data[39:0] = fbdic_ibrx_data_sel ? lndskw1_data[39:0] : lndskw0_data[39:0];

assign fbdic_ibrx_lane0_s0_match = fbdic_ibrx_data[11:0] == 12'h543;
assign fbdic_ibrx_lane1_s0_match = fbdic_ibrx_data[23:12] == 12'h543;
assign fbdic_ibrx_lane2_s0_match = fbdic_ibrx_data[35:24] == 12'h543;
assign fbdic_ibrx_lane0_s1_match = fbdic_ibrx_data[11:0] == 12'h876;
assign fbdic_ibrx_lane1_s1_match = fbdic_ibrx_data[23:12] == 12'h876;
assign fbdic_ibrx_lane2_s1_match = fbdic_ibrx_data[35:24] == 12'h876;

assign fbdic_ibrx_s0_match = fbdic_ibrx_lane0_s0_match & fbdic_ibrx_lane1_s0_match |
			     fbdic_ibrx_lane1_s0_match & fbdic_ibrx_lane2_s0_match |
			     fbdic_ibrx_lane0_s0_match & fbdic_ibrx_lane2_s0_match;
assign fbdic_ibrx_s1_match = fbdic_ibrx_lane0_s1_match & fbdic_ibrx_lane1_s1_match |
			     fbdic_ibrx_lane1_s1_match & fbdic_ibrx_lane2_s1_match |
			     fbdic_ibrx_lane0_s1_match & fbdic_ibrx_lane2_s1_match;

assign fbdic_s0_s1_s0_s1 = fbdic_s0_s1_s0_d1 & fbdic_ibrx_s1_match;
assign fbdic_s0_s1_s0    = fbdic_s0_s1_d1 & fbdic_ibrx_s0_match;
assign fbdic_s0_s1       = fbdic_s0_d1 & fbdic_ibrx_s1_match;

mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_rx_s0s1_match_dly  (
	.scan_in(ff_rx_s0s1_match_dly_scanin),
	.scan_out(ff_rx_s0s1_match_dly_scanout),
	.din({fbdic_ibrx_s0_match,fbdic_s0_s1,fbdic_s0_s1_s0}),
	.dout({fbdic_s0_d1,fbdic_s0_s1_d1,fbdic_s0_s1_s0_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_rxstart = fbdic_s0_s1_s0_s1 & (ibrx_errstat[1:0] == 2'h1);

mcu_ibist_ctl ibist (
        .scan_in(ibist_scanin),
        .scan_out(ibist_scanout),
        .l1clk(l1clk),
	.fbdic_errcnt_clr(drif_ucb_data[53:44]),
	.fbdic_errstat_clr(drif_ucb_data[39:38]),
	.ibist_rxdata({fbdird_ibrx_data[167:40],fbdic_ibrx_data[39:0]}),
  .ibist_txdata(ibist_txdata[119:0]),
  .ibtx_done(ibtx_done),
  .ibrx_done(ibrx_done),
  .ibrx_rxerrstat(ibrx_rxerrstat[13:0]),
  .ibrx_errcnt(ibrx_errcnt[9:0]),
  .ibrx_errlnnum(ibrx_errlnnum[3:0]),
  .ibrx_errstat(ibrx_errstat[1:0]),
  .fbdic_sbfibportctl(fbdic_sbfibportctl[23:0]),
  .fbdic_sbfibpgctl(fbdic_sbfibpgctl[31:0]),
  .fbdic_sbfibpattbuf1(fbdic_sbfibpattbuf1[23:0]),
  .fbdic_sbfibtxmsk(fbdic_sbfibtxmsk[9:0]),
  .fbdic_sbfibtxshft(fbdic_sbfibtxshft[9:0]),
  .fbdic_sbfibpattbuf2(fbdic_sbfibpattbuf2[23:0]),
  .fbdic_sbfibpatt2en(fbdic_sbfibpatt2en[9:0]),
  .fbdic_txstart(fbdic_txstart),
  .fbdic_nbfibportctl(fbdic_nbfibportctl[23:0]),
  .fbdic_nbfibpgctl(fbdic_nbfibpgctl[31:0]),
  .fbdic_nbfibpattbuf1(fbdic_nbfibpattbuf1[23:0]),
  .fbdic_nbfibrxmsk(fbdic_nbfibrxmsk[13:0]),
  .fbdic_nbfibrxshft(fbdic_nbfibrxshft[13:0]),
  .fbdic_nbfibrxlnerr(fbdic_nbfibrxlnerr[13:0]),
  .fbdic_nbfibpattbuf2(fbdic_nbfibpattbuf2[23:0]),
  .fbdic_nbfibpatt2en(fbdic_nbfibpatt2en[13:0]),
  .fbdic_rxstart(fbdic_rxstart),
  .fbdic_ibrx_start_ld(fbdic_ibrx_start_ld),
  .fbdic_nbfibportctl_en(fbdic_nbfibportctl_en),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Error Injection
mcu_fbdic_ctl_msff_ctl_macro__width_2 ff_err_fbxi  (
	.scan_in(ff_err_fbxi_scanin),
	.scan_out(ff_err_fbxi_scanout),
	.din({rdata_err_fbri,rdata_err_fbui}),
	.dout({fbdic_err_fbri,fbdic_err_fbui}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_fbr_injected_in = fbdic_err_fbri & (fbdic_crc_error & fbdic_inj_crc_err | 
						fbdic_status_parity_error & fbdic_inj_sfp_err |
						fbdic_alert_asserted & fbdic_inj_aa_err | 
						fbdic_alert_frame & fbdic_inj_af_err) ? 1'b1 : 
							rdpctl_crc_recov_err | fbdic_err_recov ? 1'b0 : fbdic_fbr_injected;
mcu_fbdic_ctl_msff_ctl_macro ff_fbr_injected (
	.scan_in(ff_fbr_injected_scanin),
	.scan_out(ff_fbr_injected_scanout),
	.din(fbdic_fbr_injected_in),
	.dout(fbdic_fbr_injected),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_inj_crc_err = fbdic_inj_err_src[1:0] == 2'h0 & (fbdic_err_fbri & ~fbdic_fbr_injected | fbdic_err_fbui);
assign fbdic_inj_af_err = fbdic_inj_err_src[1:0] == 2'h1 & (fbdic_err_fbri & ~fbdic_fbr_injected | fbdic_err_fbui);
assign fbdic_inj_aa_err = fbdic_inj_err_src[1:0] == 2'h2 & (fbdic_err_fbri & ~fbdic_fbr_injected | fbdic_err_fbui);
assign fbdic_inj_sfp_err = fbdic_inj_err_src[1:0] == 2'h3 & (fbdic_err_fbri & ~fbdic_fbr_injected | fbdic_err_fbui);

// DTM
cl_sc1_clksyncff_4x ff_serdes_dtm (
	.si(ff_serdes_dtm_scanin),
	.so(ff_serdes_dtm_scanout),
	.d(ccu_serdes_dtm),
	.q(fbdic_serdes_dtm_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_serdes_dtm = fbdic_serdes_dtm_out | rdpctl_dtm_atspeed;

assign fbdic_dtm_zero_cnt_in[2:0] = fbdic_dtm_state & 
				    lndskw0_data[35:0] == 36'h0 & 
				    lndskw1_data[35:0] == 36'h0 ? fbdic_dtm_zero_cnt[2:0] + 3'h1 : 3'h0;

mcu_fbdic_ctl_msff_ctl_macro__width_3 ff_dtm_zero_cnt  (
	.scan_in(ff_dtm_zero_cnt_scanin),
	.scan_out(ff_dtm_zero_cnt_scanout),
	.din(fbdic_dtm_zero_cnt_in[2:0]),
	.dout(fbdic_dtm_zero_cnt[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_dtm_state_in = fbdic_dtm_fbd_state2_en ? 1'b1 : 
			    fbdic_dtm_fbd_state6_en | fbdic_dtm_fbd_state0_en ? 1'b0 : fbdic_dtm_state;

assign fbdic_dtm_fbd_state0_en = ~fbdic_serdes_dtm & fbdic_dtm_state;
assign fbdic_dtm_fbd_state2_en = fbdic_serdes_dtm & fbdic0_lane_align & (fbdic1_lane_align | drif_single_channel_mode) &
				~fbdic_dtm_state & fbdic_disable_state;
assign fbdic_dtm_fbd_state6_en = fbdic_dtm_zero_cnt[2:0] == 3'h4 & fbdic_dtm_state;
				
mcu_fbdic_ctl_msff_ctl_macro__width_1 ff_dtm_state  (
	.scan_in(ff_dtm_state_scanin),
	.scan_out(ff_dtm_state_scanout),
	.din(fbdic_dtm_state_in),
	.dout(fbdic_dtm_state),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Select line for CRC/DBG mux in ucb
assign fbdic_srds_dtm_muxsel_in = fbdic_serdes_dtm_out & ~rdpctl_dtm_atspeed;

mcu_fbdic_ctl_msff_ctl_macro ff_srds_dtm_muxsel (
	.scan_in(ff_srds_dtm_muxsel_scanin),
	.scan_out(ff_srds_dtm_muxsel_scanout),
	.din(fbdic_srds_dtm_muxsel_in),
	.dout(fbdic_srds_dtm_muxsel),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// spare gates 
cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = spares_scanin;

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
                               .d(fbdic_idle_lfsr_reset),
                               .q(fbdic_idle_lfsr_reset_d1));
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
                               .d(fbdic_cke_cmd_pend_in),
                               .q(fbdic_cke_cmd_pend));
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

cl_sc1_msff_8x spare16_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_16),
                               .so(so_16),
                               .d(1'b0),
                               .q(spare16_flop_unused));
assign si_16 = so_15;

cl_u1_buf_32x   spare16_buf_32x (.in(1'b1),
                                   .out(spare16_buf_32x_unused));
cl_u1_nand3_8x spare16_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare16_nand3_8x_unused));
cl_u1_inv_8x    spare16_inv_8x (.in(1'b1),
                                  .out(spare16_inv_8x_unused));
cl_u1_aoi22_4x spare16_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare16_aoi22_4x_unused));
cl_u1_buf_8x    spare16_buf_8x (.in(1'b1),
                                  .out(spare16_buf_8x_unused));
cl_u1_oai22_4x spare16_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare16_oai22_4x_unused));
cl_u1_inv_16x   spare16_inv_16x (.in(1'b1),
                                   .out(spare16_inv_16x_unused));
cl_u1_nand2_16x spare16_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare16_nand2_16x_unused));
cl_u1_nor3_4x spare16_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare16_nor3_4x_unused));
cl_u1_nand2_8x spare16_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare16_nand2_8x_unused));
cl_u1_buf_16x   spare16_buf_16x (.in(1'b1),
                                   .out(spare16_buf_16x_unused));
cl_u1_nor2_16x spare16_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare16_nor2_16x_unused));
cl_u1_inv_32x   spare16_inv_32x (.in(1'b1),
                                   .out(spare16_inv_32x_unused));

cl_sc1_msff_8x spare17_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_17),
                               .so(so_17),
                               .d(1'b0),
                               .q(spare17_flop_unused));
assign si_17 = so_16;

cl_u1_buf_32x   spare17_buf_32x (.in(1'b1),
                                   .out(spare17_buf_32x_unused));
cl_u1_nand3_8x spare17_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare17_nand3_8x_unused));
cl_u1_inv_8x    spare17_inv_8x (.in(1'b1),
                                  .out(spare17_inv_8x_unused));
cl_u1_aoi22_4x spare17_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare17_aoi22_4x_unused));
cl_u1_buf_8x    spare17_buf_8x (.in(1'b1),
                                  .out(spare17_buf_8x_unused));
cl_u1_oai22_4x spare17_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare17_oai22_4x_unused));
cl_u1_inv_16x   spare17_inv_16x (.in(1'b1),
                                   .out(spare17_inv_16x_unused));
cl_u1_nand2_16x spare17_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare17_nand2_16x_unused));
cl_u1_nor3_4x spare17_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare17_nor3_4x_unused));
cl_u1_nand2_8x spare17_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare17_nand2_8x_unused));
cl_u1_buf_16x   spare17_buf_16x (.in(1'b1),
                                   .out(spare17_buf_16x_unused));
cl_u1_nor2_16x spare17_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare17_nor2_16x_unused));
cl_u1_inv_32x   spare17_inv_32x (.in(1'b1),
                                   .out(spare17_inv_32x_unused));

cl_sc1_msff_8x spare18_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_18),
                               .so(so_18),
                               .d(fbdic_link_cnt_eq_4_in),
                               .q(fbdic_link_cnt_eq_4));
assign si_18 = so_17;

cl_u1_buf_32x   spare18_buf_32x (.in(1'b1),
                                   .out(spare18_buf_32x_unused));
cl_u1_nand3_8x spare18_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare18_nand3_8x_unused));
cl_u1_inv_8x    spare18_inv_8x (.in(1'b1),
                                  .out(spare18_inv_8x_unused));
cl_u1_aoi22_4x spare18_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare18_aoi22_4x_unused));
cl_u1_buf_8x    spare18_buf_8x (.in(1'b1),
                                  .out(spare18_buf_8x_unused));
cl_u1_oai22_4x spare18_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare18_oai22_4x_unused));
cl_u1_inv_16x   spare18_inv_16x (.in(1'b1),
                                   .out(spare18_inv_16x_unused));
cl_u1_nand2_16x spare18_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare18_nand2_16x_unused));
cl_u1_nor3_4x spare18_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare18_nor3_4x_unused));
cl_u1_nand2_8x spare18_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare18_nand2_8x_unused));
cl_u1_buf_16x   spare18_buf_16x (.in(1'b1),
                                   .out(spare18_buf_16x_unused));
cl_u1_nor2_16x spare18_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare18_nor2_16x_unused));
cl_u1_inv_32x   spare18_inv_32x (.in(1'b1),
                                   .out(spare18_inv_32x_unused));

cl_sc1_msff_8x spare19_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_19),
                               .so(so_19),
                               .d(1'b0),
                               .q(spare19_flop_unused));
assign si_19 = so_18;

cl_u1_buf_32x   spare19_buf_32x (.in(1'b1),
                                   .out(spare19_buf_32x_unused));
cl_u1_nand3_8x spare19_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare19_nand3_8x_unused));
cl_u1_inv_8x    spare19_inv_8x (.in(1'b1),
                                  .out(spare19_inv_8x_unused));
cl_u1_aoi22_4x spare19_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare19_aoi22_4x_unused));
cl_u1_buf_8x    spare19_buf_8x (.in(1'b1),
                                  .out(spare19_buf_8x_unused));
cl_u1_oai22_4x spare19_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare19_oai22_4x_unused));
cl_u1_inv_16x   spare19_inv_16x (.in(1'b1),
                                   .out(spare19_inv_16x_unused));
cl_u1_nand2_16x spare19_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare19_nand2_16x_unused));
cl_u1_nor3_4x spare19_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare19_nor3_4x_unused));
cl_u1_nand2_8x spare19_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare19_nand2_8x_unused));
cl_u1_buf_16x   spare19_buf_16x (.in(1'b1),
                                   .out(spare19_buf_16x_unused));
cl_u1_nor2_16x spare19_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare19_nor2_16x_unused));
cl_u1_inv_32x   spare19_inv_32x (.in(1'b1),
                                   .out(spare19_inv_32x_unused));



cl_sc1_msff_8x spare20_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_20),
                               .so(so_20),
                               .d(fbdic_link_cnt_eq_0_in),
                               .q(fbdic_link_cnt_eq_0));
assign si_20 = so_19;

cl_u1_buf_32x   spare20_buf_32x (.in(1'b1),
                                   .out(spare20_buf_32x_unused));
cl_u1_nand3_8x spare20_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare20_nand3_8x_unused));
cl_u1_inv_8x    spare20_inv_8x (.in(1'b1),
                                  .out(spare20_inv_8x_unused));
cl_u1_aoi22_4x spare20_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare20_aoi22_4x_unused));
cl_u1_buf_8x    spare20_buf_8x (.in(1'b1),
                                  .out(spare20_buf_8x_unused));
cl_u1_oai22_4x spare20_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare20_oai22_4x_unused));
cl_u1_inv_16x   spare20_inv_16x (.in(1'b1),
                                   .out(spare20_inv_16x_unused));
cl_u1_nand2_16x spare20_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare20_nand2_16x_unused));
cl_u1_nor3_4x spare20_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare20_nor3_4x_unused));
cl_u1_nand2_8x spare20_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare20_nand2_8x_unused));
cl_u1_buf_16x   spare20_buf_16x (.in(1'b1),
                                   .out(spare20_buf_16x_unused));
cl_u1_nor2_16x spare20_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare20_nor2_16x_unused));
cl_u1_inv_32x   spare20_inv_32x (.in(1'b1),
                                   .out(spare20_inv_32x_unused));

cl_sc1_msff_8x spare21_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_21),
                               .so(so_21),
                               .d(1'b0),
                               .q(spare21_flop_unused));
assign si_21 = so_20;

cl_u1_buf_32x   spare21_buf_32x (.in(1'b1),
                                   .out(spare21_buf_32x_unused));
cl_u1_nand3_8x spare21_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare21_nand3_8x_unused));
cl_u1_inv_8x    spare21_inv_8x (.in(1'b1),
                                  .out(spare21_inv_8x_unused));
cl_u1_aoi22_4x spare21_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare21_aoi22_4x_unused));
cl_u1_buf_8x    spare21_buf_8x (.in(1'b1),
                                  .out(spare21_buf_8x_unused));
cl_u1_oai22_4x spare21_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare21_oai22_4x_unused));
cl_u1_inv_16x   spare21_inv_16x (.in(1'b1),
                                   .out(spare21_inv_16x_unused));
cl_u1_nand2_16x spare21_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare21_nand2_16x_unused));
cl_u1_nor3_4x spare21_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare21_nor3_4x_unused));
cl_u1_nand2_8x spare21_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare21_nand2_8x_unused));
cl_u1_buf_16x   spare21_buf_16x (.in(1'b1),
                                   .out(spare21_buf_16x_unused));
cl_u1_nor2_16x spare21_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare21_nor2_16x_unused));
cl_u1_inv_32x   spare21_inv_32x (.in(1'b1),
                                   .out(spare21_inv_32x_unused));
assign spares_scanout = so_21;

// Test Mode domain - signals that need to be maintained during reset/scan if tcu_mcu_testmode is not asserted.
mcu_fbdtm_ctl fbdtm ( // FS:wmr_protect
	.wmr_scan_in(fbdtm_wmr_scanin),
	.wmr_scan_out(fbdtm_wmr_scanout),
	.scan_in(fbdtm_scanin),
	.scan_out(fbdtm_scanout),
	.drl2clk(drl2clk),
	.fbdic_aclk_wmr(aclk_wmr),
	.fbdic_loopback_1(fbdic_loopback[1]),
	.drif_ucb_data(drif_ucb_data[47:0]),
  .fbdic_sync_frm_period(fbdic_sync_frm_period[5:0]),
  .fbdic_sds_config(fbdic_sds_config[29:0]),
  .fbdic_sds_invert(fbdic_sds_invert[47:0]),
  .fbdic_sds_testcfg(fbdic_sds_testcfg[31:0]),
  .rdpctl_kp_lnk_up(rdpctl_kp_lnk_up),
  .rdpctl_kp_lnk_up_clr(rdpctl_kp_lnk_up_clr),
  .fbdic_idle_lfsr_reset(fbdic_idle_lfsr_reset),
  .mcu_fsr0_cfgrx_align(mcu_fsr0_cfgrx_align),
  .mcu_fsr1_cfgrx_align(mcu_fsr1_cfgrx_align),
  .mcu_fsr0_cfgtx_enidl(mcu_fsr0_cfgtx_enidl),
  .mcu_fsr1_cfgtx_enidl(mcu_fsr1_cfgtx_enidl),
  .drif_ucb_wr_req_vld(drif_ucb_wr_req_vld),
  .drif_ucb_addr(drif_ucb_addr[12:0]),
  .drif_dbg_trig_reg_ld(drif_dbg_trig_reg_ld),
  .drif_single_channel_mode(drif_single_channel_mode),
  .fbdic_fbd_state(fbdic_fbd_state[2:0]),
  .fbd0_frame_lock(fbd0_frame_lock[13:0]),
  .fbd1_frame_lock(fbd1_frame_lock[13:0]),
  .fbdic_disable_state(fbdic_disable_state),
  .fbdic_serdes_dtm(fbdic_serdes_dtm),
  .fbdic_status_frame(fbdic_status_frame),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .wmr_protect(wmr_protect),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .fbdtm_si(fbdtm_si),
  .fbdtm_so(fbdtm_so),
  .fbdtm_wmr_si(fbdtm_wmr_si),
  .fbdtm_wmr_so(fbdtm_wmr_so)
);

assign fbdic_wmr_scanout = ~(~wmr_scan_out | wmr_protect);

// fixscan start:
assign ff_fbd_state_scanin       = scan_in                  ;
assign ff_sync_ier_scanin        = ff_fbd_state_scanout     ;
assign ff_fr_issued_scanin       = ff_sync_ier_scanout      ;
assign pff_chnl_reset0_scanin    = ff_fr_issued_scanout     ;
assign ff_chnl_reset_error_mode_scanin = pff_chnl_reset0_scanout  ;
assign ff_elect_idle_detect_scanin = ff_chnl_reset_error_mode_scanout;
assign ff_tdisable_done_scanin   = ff_elect_idle_detect_scanout;
assign ff_tdisable_cnt_scanin    = ff_tdisable_done_scanout ;
assign ff_tdisable_start_scanin  = ff_tdisable_cnt_scanout  ;
assign ff_tcalibrate_done_scanin = ff_tdisable_start_scanout;
assign ff_tcalibrate_cnt_scanin  = ff_tcalibrate_done_scanout;
assign ff_tclktrain_min_cnt_scanin = ff_tcalibrate_cnt_scanout;
assign ff_enable_sync_count_scanin = ff_tclktrain_min_cnt_scanout;
assign ff_tclktrain_done_scanin  = ff_enable_sync_count_scanout;
assign ff_tclktrain_timeout_cnt_scanin = ff_tclktrain_done_scanout;
assign ff_testing_done_scanin    = ff_tclktrain_timeout_cnt_scanout;
assign ff_testing_timeout_cnt_scanin = ff_testing_done_scanout  ;
assign ff_polling_done_scanin    = ff_testing_timeout_cnt_scanout;
assign ff_polling_timeout_cnt_scanin = ff_polling_done_scanout  ;
assign ff_config_done_scanin     = ff_polling_timeout_cnt_scanout;
assign ff_config_timeout_cnt_scanin = ff_config_done_scanout   ;
assign ff_cke_reg_d1_scanin      = ff_config_timeout_cnt_scanout;
assign ff_l0s_stall_scanin       = ff_cke_reg_d1_scanout    ;
assign ff_loopback_scanin        = ff_l0s_stall_scanout     ;
assign sync_stspll5_scanin       = ff_loopback_scanout      ;
assign sync_stspll4_scanin       = sync_stspll5_scanout     ;
assign sync_stspll3_scanin       = sync_stspll4_scanout     ;
assign sync_stspll2_scanin       = sync_stspll3_scanout     ;
assign sync_stspll1_scanin       = sync_stspll2_scanout     ;
assign sync_stspll0_scanin       = sync_stspll1_scanout     ;
assign ff_sds_test_status_scanin = sync_stspll0_scanout     ;
assign ff_config_reg_addr_scanin = ff_sds_test_status_scanout;
assign ff_cnfg_access_pending_scanin = ff_config_reg_addr_scanout;
assign ff_cnfgreg_wr_data_scanin = ff_cnfg_access_pending_scanout;
assign ff_config_reg_write_d1_scanin = ff_cnfgreg_wr_data_scanout;
assign ff_thermal_trip_scanin    = ff_config_reg_write_d1_scanout;
assign ff_fbu_error_scanin       = ff_thermal_trip_scanout  ;
assign ff_err_fbr_scanin         = ff_fbu_error_scanout     ;
assign ff_ts_data_scanin         = ff_err_fbr_scanout       ;
assign ff_l0_state_scanin        = ff_ts_data_scanout       ;
assign ff_l0_state_dly_scanin    = ff_l0_state_scanout      ;
assign ff_ts0_cnt_scanin         = ff_l0_state_dly_scanout  ;
assign ff_ts1_cnt_scanin         = ff_ts0_cnt_scanout       ;
assign ff_ts2_cnt_scanin         = ff_ts1_cnt_scanout       ;
assign ff_ts2_seq_id_scanin      = ff_ts2_cnt_scanout       ;
assign ff_ts3_cnt_scanin         = ff_ts2_seq_id_scanout    ;
assign ff_sequence_scanin        = ff_ts3_cnt_scanout       ;
assign ff_ts_exp_data_scanin     = ff_sequence_scanout      ;
assign ff_nb_ts2_seq_id0_scanin  = ff_ts_exp_data_scanout   ;
assign ff_nb_ts_cnt0_scanin      = ff_nb_ts2_seq_id0_scanout;
assign ff_ts_match0_scanin       = ff_nb_ts_cnt0_scanout    ;
assign ff_ts_match0_cnt_scanin   = ff_ts_match0_scanout     ;
assign ff_nb_ts2_seq_id1_scanin  = ff_ts_match0_cnt_scanout ;
assign ff_nb_ts_cnt1_scanin      = ff_nb_ts2_seq_id1_scanout;
assign ff_ts_match1_scanin       = ff_nb_ts_cnt1_scanout    ;
assign ff_ts_match1_cnt_scanin   = ff_ts_match1_scanout     ;
assign ff_rt_lat_cntr0_scanin    = ff_ts_match1_cnt_scanout ;
assign ff_rt_lat_cntr1_scanin    = ff_rt_lat_cntr0_scanout  ;
assign ff_ch0_cap_reg_scanin     = ff_rt_lat_cntr1_scanout  ;
assign ff_ch1_cap_reg_scanin     = ff_ch0_cap_reg_scanout   ;
assign ff_kp_lnk_up_d1_scanin    = ff_ch1_cap_reg_scanout   ;
assign ff_sync_frame_req_early_scanin = ff_kp_lnk_up_d1_scanout  ;
assign ff_sync_frame_req_delay_scanin = ff_sync_frame_req_early_scanout;
assign ff_rd_cmd_a_d1_scanin     = ff_sync_frame_req_delay_scanout;
assign ff_scr_dly_scanin         = ff_rd_cmd_a_d1_scanout   ;
assign ff_issue_pre_all_cmd_scanin = ff_scr_dly_scanout       ;
assign ff_pre_all_rank_scanin    = ff_issue_pre_all_cmd_scanout;
assign ff_f_scanin               = ff_pre_all_rank_scanout  ;
assign ff_a_cmd_scanin           = ff_f_scanout             ;
assign ff_special_cmd_scanin     = ff_a_cmd_scanout         ;
assign ff_last_trans_id0_scanin  = ff_special_cmd_scanout   ;
assign ff_last_trans_id1_scanin  = ff_last_trans_id0_scanout;
assign ff_bc_cmd_scanin          = ff_last_trans_id1_scanout;
assign ff_chnl_latency_cntr_scanin = ff_bc_cmd_scanout        ;
assign ff_rddata_vld_d1_scanin   = ff_chnl_latency_cntr_scanout;
assign ff_latq_deq_dly_scanin    = ff_rddata_vld_d1_scanout ;
assign ff_latq_dout_reg_scanin   = ff_latq_deq_dly_scanout  ;
assign ff_status_frame_d1_scanin = ff_latq_dout_reg_scanout ;
assign ff_cnfgreg_data_scanin    = ff_status_frame_d1_scanout;
assign ff_fbd_delay_scanin       = ff_cnfgreg_data_scanout  ;
assign latq_scanin               = ff_fbd_delay_scanout     ;
assign ff_fbd_error_scanin       = latq_scanout             ;
assign ff_fbd_error_dly_scanin   = ff_fbd_error_scanout     ;
assign ff_fbd_error_save_scanin  = ff_fbd_error_dly_scanout ;
assign ff_chnl_alert_scanin      = ff_fbd_error_save_scanout;
assign ff_crc_sel0_scanin        = ff_chnl_alert_scanout    ;
assign ff_crc_sel1_scanin        = ff_crc_sel0_scanout      ;
assign scr_qual_scanin           = ff_crc_sel1_scanout      ;
assign ff_err_fast_chnl_reset_scanin = scr_qual_scanout         ;
assign ff_err_recov_scanin       = ff_err_fast_chnl_reset_scanout;
assign ff_err_unrecov_scanin     = ff_err_recov_scanout     ;
assign ff_err_state_scanin       = ff_err_unrecov_scanout   ;
assign ff_sbts_cnt_scanin        = ff_err_state_scanout     ;
assign pff_ibrx_done_flag_scanin = ff_sbts_cnt_scanout      ;
assign ff_ibist_data_scanin      = pff_ibrx_done_flag_scanout;
assign ff_ibist_done_scanin      = ff_ibist_data_scanout    ;
assign ff_rx_s0s1_match_dly_scanin = ff_ibist_done_scanout    ;
assign ibist_scanin              = ff_rx_s0s1_match_dly_scanout;
assign ff_err_fbxi_scanin        = ibist_scanout            ;
assign ff_fbr_injected_scanin    = ff_err_fbxi_scanout      ;
assign ff_serdes_dtm_scanin      = ff_fbr_injected_scanout  ;
assign ff_dtm_zero_cnt_scanin    = ff_serdes_dtm_scanout    ;
assign ff_dtm_state_scanin       = ff_dtm_zero_cnt_scanout  ;
assign ff_srds_dtm_muxsel_scanin = ff_dtm_state_scanout     ;
assign spares_scanin             = ff_srds_dtm_muxsel_scanout;
assign fbdtm_scanin              = spares_scanout           ;
assign scan_out                  = fbdtm_scanout            ;

assign pff_fbd_state_wmr_scanin  = wmr_scan_in              ;
assign pff_fast_reset_wmr_scanin = pff_fbd_state_wmr_scanout;
assign pff_chnl_reset1_wmr_scanin = pff_fast_reset_wmr_scanout;
assign pff_sb2nb_map_wmr_scanin  = pff_chnl_reset1_wmr_scanout;
assign pff_amb_test_param_wmr_scanin = pff_sb2nb_map_wmr_scanout;
assign pff_failover_config_wmr_scanin = pff_amb_test_param_wmr_scanout;
assign pff_tdisable_period_wmr_scanin = pff_failover_config_wmr_scanout;
assign pff_tcalibrate_period_wmr_scanin = pff_tdisable_period_wmr_scanout;
assign pff_tclktrain_min_wmr_scanin = pff_tcalibrate_period_wmr_scanout;
assign pff_tclktrain_timeout_wmr_scanin = pff_tclktrain_min_wmr_scanout;
assign pff_testing_timeout_wmr_scanin = pff_tclktrain_timeout_wmr_scanout;
assign pff_polling_timeout_wmr_scanin = pff_testing_timeout_wmr_scanout;
assign pff_config_timeout_wmr_scanin = pff_polling_timeout_wmr_scanout;
assign pff_per_rank_cke_wmr_scanin = pff_config_timeout_wmr_scanout;
assign pff_l0s_time_wmr_scanin   = pff_per_rank_cke_wmr_scanout;
assign pff_mcu_syndrome_wmr_scanin = pff_l0s_time_wmr_scanout ;
assign pff_inj_err_src_wmr_scanin = pff_mcu_syndrome_wmr_scanout;
assign pff_fbr_count_wmr_scanin  = pff_inj_err_src_wmr_scanout;
assign ff_rt_lat0_wmr_scanin     = pff_fbr_count_wmr_scanout;
assign ff_rt_lat1_wmr_scanin     = ff_rt_lat0_wmr_scanout   ;
assign ff_lane_align_wmr_scanin  = ff_rt_lat1_wmr_scanout   ;
assign pff_sbfibportctl_wmr_scanin = ff_lane_align_wmr_scanout;
assign pff_ibtx_done_flag_wmr_scanin = pff_sbfibportctl_wmr_scanout;
assign pff_ibtx_start_wmr_scanin = pff_ibtx_done_flag_wmr_scanout;
assign pff_sbfibpgctl_wmr_scanin = pff_ibtx_start_wmr_scanout;
assign pff_sbfibpattbuf1_wmr_scanin = pff_sbfibpgctl_wmr_scanout;
assign pff_sbfibtxmsk_wmr_scanin = pff_sbfibpattbuf1_wmr_scanout;
assign pff_sbfibtxshft_wmr_scanin = pff_sbfibtxmsk_wmr_scanout;
assign pff_sbfibpattbuf2_wmr_scanin = pff_sbfibtxshft_wmr_scanout;
assign pff_sbfibpatt2en_wmr_scanin = pff_sbfibpattbuf2_wmr_scanout;
assign pff_sbfibinit_wmr_scanin  = pff_sbfibpatt2en_wmr_scanout;
assign pff_sbibistmisc_wmr_scanin = pff_sbfibinit_wmr_scanout;
assign pff_nbfibportctl_wmr_scanin = pff_sbibistmisc_wmr_scanout;
assign pff_ibrx_start_wmr_scanin = pff_nbfibportctl_wmr_scanout;
assign pff_nbfibpgctl_wmr_scanin = pff_ibrx_start_wmr_scanout;
assign pff_nbfibpattbuf1_wmr_scanin = pff_nbfibpgctl_wmr_scanout;
assign pff_nbfibrxmsk_wmr_scanin = pff_nbfibpattbuf1_wmr_scanout;
assign pff_nbfibrxshft_wmr_scanin = pff_nbfibrxmsk_wmr_scanout;
assign pff_nbfibpattbuf2_wmr_scanin = pff_nbfibrxshft_wmr_scanout;
assign pff_nbfibpatt2en_wmr_scanin = pff_nbfibpattbuf2_wmr_scanout;
assign fbdtm_wmr_scanin          = pff_nbfibpatt2en_wmr_scanout;
assign wmr_scan_out              = fbdtm_wmr_scanout        ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_l1clkhdr_ctl_macro (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_3 (
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

module mcu_fbdic_ctl_msff_ctl_macro (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_24 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = (din[23:0] & {24{en}}) | (dout[23:0] & ~{24{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_16 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_28 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [27:0] fdin;
wire [26:0] so;

  input [27:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [27:0] dout;
  output scan_out;
assign fdin[27:0] = din[27:0];






dff #(28)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[27:0]),
.si({scan_in,so[26:0]}),
.so({so[26:0],scan_out}),
.q(dout[27:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_10 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = (din[9:0] & {10{en}}) | (dout[9:0] & ~{10{en}});






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__en_1 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_10 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [9:0] fdin;
wire [8:0] so;

  input [9:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [9:0] dout;
  output scan_out;
assign fdin[9:0] = din[9:0];






dff #(10)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[9:0]),
.si({scan_in,so[8:0]}),
.so({so[8:0],scan_out}),
.q(dout[9:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_20 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = (din[19:0] & {20{en}}) | (dout[19:0] & ~{20{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__width_20 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_16 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_1 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_2 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_8 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_8 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_7 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = (din[6:0] & {7{en}}) | (dout[6:0] & ~{7{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__width_2 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_14 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [13:0] fdin;
wire [12:0] so;

  input [13:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [13:0] dout;
  output scan_out;
assign fdin[13:0] = (din[13:0] & {14{en}}) | (dout[13:0] & ~{14{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_48 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [47:0] fdin;
wire [46:0] so;

  input [47:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [47:0] dout;
  output scan_out;
assign fdin[47:0] = (din[47:0] & {48{en}}) | (dout[47:0] & ~{48{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_31 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [30:0] fdin;
wire [29:0] so;

  input [30:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [30:0] dout;
  output scan_out;
assign fdin[30:0] = (din[30:0] & {31{en}}) | (dout[30:0] & ~{31{en}});






dff #(31)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[30:0]),
.si({scan_in,so[29:0]}),
.so({so[29:0],scan_out}),
.q(dout[30:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_17 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [16:0] fdin;
wire [15:0] so;

  input [16:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [16:0] dout;
  output scan_out;
assign fdin[16:0] = (din[16:0] & {17{en}}) | (dout[16:0] & ~{17{en}});






dff #(17)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[16:0]),
.si({scan_in,so[15:0]}),
.so({so[15:0],scan_out}),
.q(dout[16:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__width_24 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_3 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_4 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}} & ~{4{clr}}) | (dout[3:0] & ~{4{en}} & ~{4{clr}});






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

module mcu_fbdic_ctl_msff_ctl_macro__clr_1__width_4 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0] & ~{4{clr}};






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

module mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_8 (
  din, 
  en, 
  clr, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = (din[7:0] & {8{en}} & ~{8{clr}}) | (dout[7:0] & ~{8{en}} & ~{8{clr}});






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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_5 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = (din[4:0] & {5{en}}) | (dout[4:0] & ~{5{en}});






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

module mcu_fbdic_ctl_msff_ctl_macro__width_4 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_72 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [71:0] fdin;
wire [70:0] so;

  input [71:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [71:0] dout;
  output scan_out;
assign fdin[71:0] = din[71:0];






dff #(72)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[71:0]),
.si({scan_in,so[70:0]}),
.so({so[70:0],scan_out}),
.q(dout[71:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__width_34 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [33:0] fdin;
wire [32:0] so;

  input [33:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [33:0] dout;
  output scan_out;
assign fdin[33:0] = din[33:0];






dff #(34)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[33:0]),
.si({scan_in,so[32:0]}),
.so({so[32:0],scan_out}),
.q(dout[33:0])
);












endmodule






// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_12 (
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

module mcu_fbdic_ctl_msff_ctl_macro__clr_1__width_5 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0] & ~{5{clr}};






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

module mcu_fbdic_ctl_msff_ctl_macro__clr_1__en_1__width_24 (
  din, 
  en, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [23:0] fdin;
wire [22:0] so;

  input [23:0] din;
  input en;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [23:0] dout;
  output scan_out;
assign fdin[23:0] = (din[23:0] & {24{en}} & ~{24{clr}}) | (dout[23:0] & ~{24{en}} & ~{24{clr}});






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

module mcu_fbdic_ctl_msff_ctl_macro__width_5 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_7 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_30 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [29:0] fdin;
wire [28:0] so;

  input [29:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [29:0] dout;
  output scan_out;
assign fdin[29:0] = (din[29:0] & {30{en}}) | (dout[29:0] & ~{30{en}});






dff #(30)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[29:0]),
.si({scan_in,so[28:0]}),
.so({so[28:0],scan_out}),
.q(dout[29:0])
);

endmodule



// any PARAMS parms go into naming of macro

module mcu_fbdic_ctl_msff_ctl_macro__width_6 (
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

module mcu_fbdic_ctl_msff_ctl_macro__width_14 (
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

module mcu_fbdic_ctl_msff_ctl_macro__en_1__width_27 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [26:0] fdin;
wire [25:0] so;

  input [26:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [26:0] dout;
  output scan_out;
assign fdin[26:0] = (din[26:0] & {27{en}}) | (dout[26:0] & ~{27{en}});






dff #(27)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[26:0]),
.si({scan_in,so[25:0]}),
.so({so[25:0],scan_out}),
.q(dout[26:0])
);












endmodule








