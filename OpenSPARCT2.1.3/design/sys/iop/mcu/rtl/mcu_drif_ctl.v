// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_drif_ctl.v
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



module mcu_drif_ctl (
  drif_fail_over_mode, 
  drif_fail_over_mask, 
  drif_fail_over_mask_l, 
  drq0_rdq_free, 
  drq1_rdq_free, 
  woq0_wdq_entry_free, 
  woq1_wdq_entry_free, 
  drif_num_dimms, 
  drif_addr_bank_low_sel, 
  drif_mem_type, 
  drif_stacked_dimm, 
  drif_single_channel_mode, 
  drif_branch_disabled, 
  drif_wdata_sel, 
  drif_rdata_ack_vld, 
  drif_rdata_nack_vld, 
  drif_rdata_data, 
  drif_err_inj_enable, 
  drif_err_mask_reg, 
  drif_send_info_val, 
  drif_send_info, 
  drif0_wdq_rd, 
  drif1_wdq_rd, 
  drif_wdq_radr, 
  drif_rascas_adr_sel, 
  drif_rascas_wr1_adr_sel, 
  drif_rascas_wr2_adr_sel, 
  drif_scrub_addr, 
  drq0_rd_adr_queue7_en, 
  drq0_rd_adr_queue6_en, 
  drq0_rd_adr_queue5_en, 
  drq0_rd_adr_queue4_en, 
  drq0_rd_adr_queue3_en, 
  drq0_rd_adr_queue2_en, 
  drq0_rd_adr_queue1_en, 
  drq0_rd_adr_queue0_en, 
  drq1_rd_adr_queue7_en, 
  drq1_rd_adr_queue6_en, 
  drq1_rd_adr_queue5_en, 
  drq1_rd_adr_queue4_en, 
  drq1_rd_adr_queue3_en, 
  drq1_rd_adr_queue2_en, 
  drq1_rd_adr_queue1_en, 
  drq1_rd_adr_queue0_en, 
  drq0_wr_adr_queue7_en, 
  drq0_wr_adr_queue6_en, 
  drq0_wr_adr_queue5_en, 
  drq0_wr_adr_queue4_en, 
  drq0_wr_adr_queue3_en, 
  drq0_wr_adr_queue2_en, 
  drq0_wr_adr_queue1_en, 
  drq0_wr_adr_queue0_en, 
  drq1_wr_adr_queue7_en, 
  drq1_wr_adr_queue6_en, 
  drq1_wr_adr_queue5_en, 
  drq1_wr_adr_queue4_en, 
  drq1_wr_adr_queue3_en, 
  drq1_wr_adr_queue2_en, 
  drq1_wr_adr_queue1_en, 
  drq1_wr_adr_queue0_en, 
  drif0_rd_adr_queue_sel, 
  drif1_rd_adr_queue_sel, 
  woq_wr_adr_queue_sel, 
  woq_wr1_adr_queue_sel, 
  woq_wr2_adr_queue_sel, 
  drif0_req_rdwr_addr_sel, 
  drif1_req_rdwr_addr_sel, 
  drif_l2poison_qw, 
  drif_wadr_parity, 
  mcu_pt_sync_out, 
  drif_scrub_rwen, 
  drif_io_wdata_sel, 
  drif_ucb_wr_req_vld, 
  drif_ucb_rd_req_vld, 
  drif_ucb_addr, 
  drif_ucb_data, 
  drif_err_sts_reg_ld, 
  drif_err_addr_reg_ld, 
  drif_err_cnt_reg_ld, 
  drif_err_loc_reg_ld, 
  drif_err_retry_reg_ld, 
  drif_dbg_trig_reg_ld, 
  drif_dram_cmd_a, 
  drif_dram_addr_a, 
  drif_dram_bank_a, 
  drif_dram_rank_a, 
  drif_dram_dimm_a, 
  drif_dram_cmd_b, 
  drif_dram_addr_b, 
  drif_dram_bank_b, 
  drif_dram_rank_b, 
  drif_dram_dimm_b, 
  drif_dram_cmd_c, 
  drif_dram_addr_c, 
  drif_dram_bank_c, 
  drif_dram_rank_c, 
  drif_dram_dimm_c, 
  drif_wdata_wsn, 
  woq_err_st_wait_free, 
  drif_crc_rd_picked, 
  drif_err_fifo_empty, 
  woq_err_fifo_empty, 
  woq_wr_req_out, 
  drif_mcu_error_mode, 
  drif_err_state_crc_fr, 
  drif_mcu_idle, 
  drif_cke_reg, 
  rdata_drif_rd_req_vld, 
  rdata_drif_wr_req_vld, 
  rdata_drif_addr, 
  rdata_drif_data, 
  rdata_mcu_selfrsh, 
  rdpctl_err_addr_reg, 
  rdpctl_err_sts_reg, 
  rdpctl_err_loc, 
  rdpctl_err_cnt, 
  rdpctl_err_retry_reg, 
  rdpctl_dbg_trig_enable, 
  rdpctl_kp_lnk_up, 
  rdpctl_mask_err, 
  rdpctl_dtm_mask_chnl, 
  rdpctl_dtm_atspeed, 
  rdpctl_drq0_clear_ent, 
  rdpctl_drq1_clear_ent, 
  rdpctl_scrub_wren, 
  rdpctl_scrub_addrinc_en, 
  readdp_ecc_multi_err, 
  addrdp_ras_adr_queue, 
  addrdp_cas_adr_queue, 
  addrdp_rd_req_id_queue, 
  addrdp_ras_wr1_adr_queue, 
  addrdp_cas_wr1_adr_queue, 
  addrdp_ras_wr2_adr_queue, 
  addrdp_cas_wr2_adr_queue, 
  l2b0_rd_rank_adr, 
  l2b0_rd_dimm_adr, 
  l2b0_rd_bank_adr, 
  l2b0_rd_addr_err, 
  l2b0_rd_addr_par, 
  l2b1_rd_rank_adr, 
  l2b1_rd_dimm_adr, 
  l2b1_rd_bank_adr, 
  l2b1_rd_addr_err, 
  l2b1_rd_addr_par, 
  l2b0_wr_rank_adr, 
  l2b0_wr_dimm_adr, 
  l2b0_wr_bank_adr, 
  l2b0_wr_addr_err, 
  l2b0_wr_addr_par, 
  l2b1_wr_rank_adr, 
  l2b1_wr_dimm_adr, 
  l2b1_wr_bank_adr, 
  l2b1_wr_addr_err, 
  l2b1_wr_addr_par, 
  l2if0_rd_req, 
  l2if0_wr_req, 
  l2if0_data_wr_addr, 
  l2if0_wdq_rd_inh, 
  l2if0_wdq_in_cntr, 
  l2if1_rd_req, 
  l2if1_wr_req, 
  l2if1_data_wr_addr, 
  l2if1_wdq_rd_inh, 
  l2if1_wdq_in_cntr, 
  mcu_pt_sync_in0, 
  mcu_pt_sync_in1, 
  mcu_pt_sync_in2, 
  addrdp0_rd_wr_adr0_eq, 
  addrdp0_rd_wr_adr1_eq, 
  addrdp0_rd_wr_adr2_eq, 
  addrdp0_rd_wr_adr3_eq, 
  addrdp0_rd_wr_adr4_eq, 
  addrdp0_rd_wr_adr5_eq, 
  addrdp0_rd_wr_adr6_eq, 
  addrdp0_rd_wr_adr7_eq, 
  addrdp1_rd_wr_adr0_eq, 
  addrdp1_rd_wr_adr1_eq, 
  addrdp1_rd_wr_adr2_eq, 
  addrdp1_rd_wr_adr3_eq, 
  addrdp1_rd_wr_adr4_eq, 
  addrdp1_rd_wr_adr5_eq, 
  addrdp1_rd_wr_adr6_eq, 
  addrdp1_rd_wr_adr7_eq, 
  rdpctl_scrub_read_done, 
  wdqrf00_data_mecc, 
  wdqrf01_data_mecc, 
  wdqrf10_data_mecc, 
  wdqrf11_data_mecc, 
  rdpctl_err_fifo_enq, 
  rdpctl_err_fifo_data, 
  rdpctl_fifo_empty, 
  rdpctl_fifo_full, 
  rdpctl_no_crc_err, 
  rdpctl_crc_err, 
  fbdic_ucb_rd_data, 
  fbdic_sync_frame_req_early3, 
  fbdic_sync_frame_req_early2, 
  fbdic_sync_frame_req_early1, 
  fbdic_sync_frame_req, 
  fbdic_scr_frame_req_d4, 
  fbdic_l0_state, 
  fbdic_woq_free, 
  fbdic_clear_wrq_ent, 
  fbdic_error_mode, 
  fbdic_l0s_lfsr_stall, 
  fbdic_err_fast_reset_done, 
  fbdic_chnl_reset_error_mode, 
  fbdic_mcu_idle, 
  drl2clk, 
  scan_in, 
  scan_out, 
  wmr_scan_in, 
  wmr_scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  aclk_wmr, 
  tcu_scan_en, 
  wmr_protect);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire ff_ucb_req_scanin;
wire ff_ucb_req_scanout;
wire ff_hw_selfref_scanin;
wire ff_hw_selfref_scanout;
wire drif_hw_selfrsh;
wire fbdic_sync_frame_req_l;
wire fbdic_sync_frame_req_early3_l;
wire fbdic_sync_frame_req_early1_l;
wire ff_sync_frame_req_l_scanin;
wire ff_sync_frame_req_l_scanout;
wire drif_sync_frame_req_l;
wire drif_sync_frame_req_early3_l;
wire drif_sync_frame_req_early1_l;
wire dmmdly0_scanin;
wire dmmdly0_scanout;
wire [7:0] drif_dmm_rd_ras_picked;
wire [7:0] drif_dmm_wr_ras_picked;
wire [7:0] drif_dmm_wrbc_ras_picked;
wire [7:0] rrd_cnt_is_zero;
wire [7:0] rtw_cnt_is_zero;
wire [7:0] wtr_cnt_is_zero;
wire [7:0] rtr_cnt_is_zero;
wire [7:0] wtw_cnt_is_zero;
wire [7:0] dmmdly_4_activate_stall;
wire dmmdly1_scanin;
wire dmmdly1_scanout;
wire dmmdly2_scanin;
wire dmmdly2_scanout;
wire dmmdly3_scanin;
wire dmmdly3_scanout;
wire dmmdly4_scanin;
wire dmmdly4_scanout;
wire dmmdly5_scanin;
wire dmmdly5_scanout;
wire dmmdly6_scanin;
wire dmmdly6_scanout;
wire dmmdly7_scanin;
wire dmmdly7_scanout;
wire [6:0] rfc_cnt_next;
wire drif_refresh_req_picked;
wire [6:0] rfc_reg;
wire [6:0] rfc_cnt;
wire ff_rfc_cnt_scanin;
wire ff_rfc_cnt_scanout;
wire rfc_cnt_is_zero;
wire [1:0] rd_rrd_cnt_next;
wire drif0_rd_picked;
wire drif0_raw_hazard;
wire drif1_rd_picked;
wire drif1_raw_hazard;
wire drif_scrub_picked;
wire drif_err_rd_picked;
wire rd_rrd_cnt_is_zero;
wire [1:0] rd_rrd_cnt;
wire ff_rd_rrd_cnt_scanin;
wire ff_rd_rrd_cnt_scanout;
wire bnksm0_scanin;
wire bnksm0_scanout;
wire [15:0] drif_abnk_ras_picked;
wire [15:0] drif_abnk_cas_picked;
wire [15:0] drif_bcbnk_ras_picked;
wire [15:0] drif_bcbnk_cas_picked;
wire b0_rcd_cnt_is_zero;
wire b0_rc_cnt_is_zero;
wire b0_dal_cnt_is_zero;
wire bnksm1_scanin;
wire bnksm1_scanout;
wire b1_rcd_cnt_is_zero;
wire b1_rc_cnt_is_zero;
wire b1_dal_cnt_is_zero;
wire bnksm2_scanin;
wire bnksm2_scanout;
wire b2_rcd_cnt_is_zero;
wire b2_rc_cnt_is_zero;
wire b2_dal_cnt_is_zero;
wire bnksm3_scanin;
wire bnksm3_scanout;
wire b3_rcd_cnt_is_zero;
wire b3_rc_cnt_is_zero;
wire b3_dal_cnt_is_zero;
wire bnksm4_scanin;
wire bnksm4_scanout;
wire b4_rcd_cnt_is_zero;
wire b4_rc_cnt_is_zero;
wire b4_dal_cnt_is_zero;
wire bnksm5_scanin;
wire bnksm5_scanout;
wire b5_rcd_cnt_is_zero;
wire b5_rc_cnt_is_zero;
wire b5_dal_cnt_is_zero;
wire bnksm6_scanin;
wire bnksm6_scanout;
wire b6_rcd_cnt_is_zero;
wire b6_rc_cnt_is_zero;
wire b6_dal_cnt_is_zero;
wire bnksm7_scanin;
wire bnksm7_scanout;
wire b7_rcd_cnt_is_zero;
wire b7_rc_cnt_is_zero;
wire b7_dal_cnt_is_zero;
wire bnksm8_scanin;
wire bnksm8_scanout;
wire b8_rcd_cnt_is_zero;
wire b8_rc_cnt_is_zero;
wire b8_dal_cnt_is_zero;
wire bnksm9_scanin;
wire bnksm9_scanout;
wire b9_rcd_cnt_is_zero;
wire b9_rc_cnt_is_zero;
wire b9_dal_cnt_is_zero;
wire bnksm10_scanin;
wire bnksm10_scanout;
wire b10_rcd_cnt_is_zero;
wire b10_rc_cnt_is_zero;
wire b10_dal_cnt_is_zero;
wire bnksm11_scanin;
wire bnksm11_scanout;
wire b11_rcd_cnt_is_zero;
wire b11_rc_cnt_is_zero;
wire b11_dal_cnt_is_zero;
wire bnksm12_scanin;
wire bnksm12_scanout;
wire b12_rcd_cnt_is_zero;
wire b12_rc_cnt_is_zero;
wire b12_dal_cnt_is_zero;
wire bnksm13_scanin;
wire bnksm13_scanout;
wire b13_rcd_cnt_is_zero;
wire b13_rc_cnt_is_zero;
wire b13_dal_cnt_is_zero;
wire bnksm14_scanin;
wire bnksm14_scanout;
wire b14_rcd_cnt_is_zero;
wire b14_rc_cnt_is_zero;
wire b14_dal_cnt_is_zero;
wire bnksm15_scanin;
wire bnksm15_scanout;
wire b15_rcd_cnt_is_zero;
wire b15_rc_cnt_is_zero;
wire b15_dal_cnt_is_zero;
wire [15:0] drif0_rd_bank_valids;
wire [15:0] drq0_rd_entry0_val;
wire [15:0] drq0_rd_entry1_val;
wire [15:0] drq0_rd_entry2_val;
wire [15:0] drq0_rd_entry3_val;
wire [15:0] drq0_rd_entry4_val;
wire [15:0] drq0_rd_entry5_val;
wire [15:0] drq0_rd_entry6_val;
wire [15:0] drq0_rd_entry7_val;
wire [15:0] drif1_rd_bank_valids;
wire [15:0] drq1_rd_entry0_val;
wire [15:0] drq1_rd_entry1_val;
wire [15:0] drq1_rd_entry2_val;
wire [15:0] drq1_rd_entry3_val;
wire [15:0] drq1_rd_entry4_val;
wire [15:0] drq1_rd_entry5_val;
wire [15:0] drq1_rd_entry6_val;
wire [15:0] drq1_rd_entry7_val;
wire [15:0] drif_wr_bank_valids;
wire [15:0] woq_entry0_val;
wire [15:0] woq_entry1_val;
wire [15:0] drif_bank_available;
wire [7:0] drif_dimm_rd_available;
wire [7:0] drif_dimm_wr_available;
wire drif0_rd_ready;
wire drif1_rd_ready;
wire drif_rd_ready;
wire drif_rd_pending;
wire [15:0] drq0_rd_bank_val;
wire [15:0] drq1_rd_bank_val;
wire drif_rd_stall;
wire drif_blk_new_openbank;
wire drif_wr_pending;
wire drif_pick_wr_first;
wire drif_wr_entry_pend;
wire drif_scrub_ready;
wire drif_cas_picked;
wire woq_wr_error_mode;
wire [7:0] drif_mcu_state;
wire [7:0] drif0_rd_entry_ready;
wire drif_rank_wait;
wire [3:0] drif_last_rank_picked;
wire [2:0] drq0_rd_entry0_dimm;
wire drq0_rd_entry0_rank;
wire [2:0] drq0_rd_entry1_dimm;
wire drq0_rd_entry1_rank;
wire [2:0] drq0_rd_entry2_dimm;
wire drq0_rd_entry2_rank;
wire [2:0] drq0_rd_entry3_dimm;
wire drq0_rd_entry3_rank;
wire [2:0] drq0_rd_entry4_dimm;
wire drq0_rd_entry4_rank;
wire [2:0] drq0_rd_entry5_dimm;
wire drq0_rd_entry5_rank;
wire [2:0] drq0_rd_entry6_dimm;
wire drq0_rd_entry6_rank;
wire [2:0] drq0_rd_entry7_dimm;
wire drq0_rd_entry7_rank;
wire [7:0] drif1_rd_entry_ready;
wire [2:0] drq1_rd_entry0_dimm;
wire drq1_rd_entry0_rank;
wire [2:0] drq1_rd_entry1_dimm;
wire drq1_rd_entry1_rank;
wire [2:0] drq1_rd_entry2_dimm;
wire drq1_rd_entry2_rank;
wire [2:0] drq1_rd_entry3_dimm;
wire drq1_rd_entry3_rank;
wire [2:0] drq1_rd_entry4_dimm;
wire drq1_rd_entry4_rank;
wire [2:0] drq1_rd_entry5_dimm;
wire drq1_rd_entry5_rank;
wire [2:0] drq1_rd_entry6_dimm;
wire drq1_rd_entry6_rank;
wire [2:0] drq1_rd_entry7_dimm;
wire drq1_rd_entry7_rank;
wire drif_wr_ready;
wire [15:0] woq_wr_bank_val;
wire drif_wr_stall;
wire [2:0] drif_wr_entry_ready;
wire [15:0] woq_entry0;
wire woq0_wdq_rd;
wire woq1_wdq_rd;
wire drif_wdq_sel;
wire drif_wdq_sel_d1;
wire drif_cmd_b_val;
wire drif_pd_mode_pending;
wire [15:0] woq_entry1;
wire [7:0] drif0_rd_entry_picked_in;
wire drif_entry_priority;
wire [7:0] drif1_rd_entry_picked_in;
wire [7:0] drif0_rd_entry_picked;
wire [7:0] drif1_rd_entry_picked;
wire [2:0] drif_wr_entry_picked;
wire drif_rd_picked;
wire drif0_wr_picked;
wire drif1_wr_picked;
wire drif0_wr1_picked;
wire drif1_wr1_picked;
wire drif0_wr2_picked;
wire drif1_wr2_picked;
wire drif0_err_rd_picked;
wire drif0_err_wr_picked;
wire drif_err_fifo_scrub;
wire drif_entry_priority_in;
wire ff_entry_priority_scanin;
wire ff_entry_priority_scanout;
wire [9:0] drq0_rd_addr_picked;
wire [9:0] drq1_rd_addr_picked;
wire drif_wr_picked;
wire [9:0] woq_wr_addr_picked;
wire [15:0] drif_scrub_entry_val;
wire drif_err_wr_picked;
wire [15:0] drif_err_entry_val;
wire drif_wr1_picked;
wire [9:0] woq_wr1_addr_picked;
wire drif_wr2_picked;
wire [9:0] woq_wr2_addr_picked;
wire ff_cas_abnk_picked_scanin;
wire ff_cas_abnk_picked_scanout;
wire ff_cas_bcbnk_picked_scanin;
wire ff_cas_bcbnk_picked_scanout;
wire [15:0] drif_bnk_ras_picked;
wire [15:0] drif_bnk_cas_picked;
wire drif_any_ras_picked;
wire [15:0] drif_ras_picked;
wire [2:0] drif_scrub_dimm_adr;
wire [2:0] drif_err_fifo_dimm_adr;
wire drif_last_rank_picked_en;
wire [3:0] drif_phy_bank_picked;
wire drif_phy_bank_picked_en;
wire ff_rank_dimm_picked_scanin;
wire ff_rank_dimm_picked_scanout;
wire drif_rank_adr;
wire [2:0] drif_dimm_adr;
wire drif_ras_picked_d2_in;
wire ff_ras_picked_d2_scanin;
wire ff_ras_picked_d2_scanout;
wire drif_ras_picked_d2;
wire drif_ras_picked_d3;
wire drif_ras_picked_d4;
wire [15:0] drif_scrub_bank_valid;
wire [4:0] drif_refresh_rank;
wire drif_scrub_rank_adr;
wire drif_init;
wire [15:0] drif_scrub_rank_avail;
wire drif_err_fifo_empty_d1;
wire drif_4_activate_stall_scrub;
wire rtr_cnt_is_zero_scrub;
wire wtr_cnt_is_zero_scrub;
wire [8:0] drif_rd_addr_picked;
wire [2:0] drif_rd_index_picked;
wire [2:0] drq0_rd_index_picked;
wire [2:0] drq1_rd_index_picked;
wire [7:0] drif0_raw_match_in;
wire [7:0] drq0_pending_wr_req;
wire [7:0] drif1_raw_match_in;
wire [7:0] drq1_pending_wr_req;
wire drif_wr_entry_pend_in;
wire drif_wr_entry_pend_en;
wire drif_wr_entry_pend_clr;
wire drif0_haz_rd;
wire [7:0] drif_raw_match;
wire ff_wr_entry_pend_scanin;
wire ff_wr_entry_pend_scanout;
wire drif0_haz_rd_in;
wire [7:0] drif_raw_match_in;
wire drif_raw_match_en;
wire ff_raw_match_scanin;
wire ff_raw_match_scanout;
wire [8:0] drif_rdwr_addr_picked;
wire drif_rdwr_cmd_picked;
wire [2:0] drif_rdwr_index_picked;
wire [2:0] woq_wr_index_picked;
wire [3:0] drif_scrub_sched_bank_adr;
wire drif_eight_bank_mode_mod;
wire [2:0] drif_scrub_bank_adr;
wire drif_scrub_read_pending;
wire [8:0] drif_scrub_addr_picked;
wire drif_scrub_addr_parity;
wire drif_scrub_addr_err;
wire drif_err_fifo_parity;
wire drif_err_fifo_rank_adr;
wire [3:0] drif_err_fifo_bank_adr;
wire drif_addr_parity;
wire drif_addr_err;
wire [2:0] drif_bank_adr;
wire [2:0] drif_index_picked;
wire [2:0] drif_err_fifo_rdq_entry;
wire drif_cmd_picked;
wire ff_cmd_picked_d1_scanin;
wire ff_cmd_picked_d1_scanout;
wire drif_cmd_picked_d1;
wire ff_scrub_picked_d1_scanin;
wire ff_scrub_picked_d1_scanout;
wire drif_scrub_picked_d1;
wire ff_addr_parity_d1_scanin;
wire ff_addr_parity_d1_scanout;
wire drif_addr_parity_d1;
wire ff_addr_err_d1_scanin;
wire ff_addr_err_d1_scanout;
wire drif_addr_err_d1;
wire drif0_wr_starve_cnt_reset;
wire drif0_pick_wr_first;
wire drif0_pick_wr_first_in;
wire [5:0] drif0_wr_starve_cnt_in;
wire [5:0] drif0_wr_starve_cnt;
wire ff_wr_starve_cnt0_scanin;
wire ff_wr_starve_cnt0_scanout;
wire drif0_pick_wr_first_reset;
wire ff_pick_wr_first0_scanin;
wire ff_pick_wr_first0_scanout;
wire drif1_wr_starve_cnt_reset;
wire drif1_pick_wr_first;
wire drif1_pick_wr_first_in;
wire [5:0] drif1_wr_starve_cnt_in;
wire [5:0] drif1_wr_starve_cnt;
wire ff_wr_starve_cnt1_scanin;
wire ff_wr_starve_cnt1_scanout;
wire drif1_pick_wr_first_reset;
wire ff_pick_wr_first1_scanin;
wire ff_pick_wr_first1_scanout;
wire drif_bnk_cas_picked_or;
wire ff_cas_picked_scanin;
wire ff_cas_picked_scanout;
wire drif_cas_picked_io_d1;
wire [15:0] drif_ras_picked_io_d1;
wire [14:0] drif_ras_adr;
wire [14:0] drif_scrub_ras_adr;
wire ff_ras_adr_d1_scanin;
wire ff_ras_adr_d1_scanout;
wire [14:0] drif_ras_adr_d1_out;
wire [14:0] drif_ras_adr_d1;
wire [3:0] drif_cas_addr_bits;
wire [10:0] drif_cas_adr_d1_out;
wire [10:0] drif_cas_adr;
wire [10:0] drif_scrub_cas_adr;
wire ff_cas_adr_d1_scanin;
wire ff_cas_adr_d1_scanout;
wire ff_req_id_d1_scanin;
wire ff_req_id_d1_scanout;
wire [2:0] drif_rd_req_id_d1;
wire [10:0] drif_cas_adr_d1;
wire ff_cas_adr_d2_scanin;
wire ff_cas_adr_d2_scanout;
wire [10:0] drif_cas_adr_d2;
wire ff_bank_adr_scanin;
wire ff_bank_adr_scanout;
wire [2:0] drif_bank_adr_d1;
wire [2:0] drif_bank_adr_d1_out;
wire [2:0] drif_bank_adr_d2;
wire ff_dimm_adr_scanin;
wire ff_dimm_adr_scanout;
wire [2:0] drif_dimm_adr_d1;
wire [2:0] drif_dimm_adr_d2;
wire ff_rank_adr_scanin;
wire ff_rank_adr_scanout;
wire drif_rank_adr_d1;
wire drif_rank_adr_d2;
wire drif_mux_write_en;
wire ff_mux_wr_en_scanin;
wire ff_mux_wr_en_scanout;
wire drif_mux_write_en_d1;
wire drif_write_en_int;
wire drif_cmd_a_val;
wire drif_cmd_a_val_d1;
wire drif_cmd_a_val_in;
wire ff_cmd_val_scanin;
wire ff_cmd_val_scanout;
wire drif_cmd_c_val;
wire drif_wr_bc_stall;
wire ff_cmd_val_d1_scanin;
wire ff_cmd_val_d1_scanout;
wire drif_cmd_b_val_d1;
wire drif_cmd_c_val_d1;
wire ff_wr1_adr_d1_scanin;
wire ff_wr1_adr_d1_scanout;
wire [14:0] drif_ras_wr1_adr_d1_out;
wire [10:0] drif_cas_wr1_adr_d1_out;
wire ff_write1_data_scanin;
wire ff_write1_data_scanout;
wire drif_rank_wr1_adr_d1;
wire [2:0] drif_dimm_wr1_adr_d1;
wire [2:0] drif_bank_wr1_adr_d1_out;
wire [14:0] drif_ras_wr1_adr_d1;
wire [10:0] drif_cas_wr1_adr_d1;
wire [2:0] drif_bank_wr1_adr_d1;
wire ff_wr1_adr_d2_scanin;
wire ff_wr1_adr_d2_scanout;
wire [10:0] drif_cas_wr1_adr_d2;
wire drif_rank_wr1_adr_d2;
wire [2:0] drif_dimm_wr1_adr_d2;
wire [2:0] drif_bank_wr1_adr_d2;
wire ff_write2_data_scanin;
wire ff_write2_data_scanout;
wire drif_rank_wr2_adr_d1;
wire [2:0] drif_dimm_wr2_adr_d1;
wire [2:0] drif_bank_wr2_adr_d1_out;
wire ff_wr2_adr_d1_scanin;
wire ff_wr2_adr_d1_scanout;
wire [14:0] drif_ras_wr2_adr_d1_out;
wire [10:0] drif_cas_wr2_adr_d1_out;
wire [14:0] drif_ras_wr2_adr_d1;
wire [10:0] drif_cas_wr2_adr_d1;
wire [2:0] drif_bank_wr2_adr_d1;
wire ff_wr2_adr_d2_scanin;
wire ff_wr2_adr_d2_scanout;
wire [10:0] drif_cas_wr2_adr_d2;
wire drif_rank_wr2_adr_d2;
wire [2:0] drif_dimm_wr2_adr_d2;
wire [2:0] drif_bank_wr2_adr_d2;
wire drif_scrub_data_rden_en_d1;
wire drif_enter_self_refresh;
wire drif_exit_self_refresh;
wire drif_pd_mode_exit_pending;
wire drif_pd_mode_enter_pending;
wire drif_pd_mode_exit_rank;
wire drif_pd_mode_enter_rank;
wire [2:0] drif_pd_mode_exit_dimm;
wire [2:0] drif_pd_mode_enter_dimm;
wire drif_scrub_wsn;
wire [2:0] drif_scrub_data_rden;
wire drif_scrub_data_rden_en;
wire drif_wdata_wsn_out;
wire ff_wdata_wsn_scanin;
wire ff_wdata_wsn_scanout;
wire woq_wdata_wsn;
wire ff_rd_wr_picked_d1_scanin;
wire ff_rd_wr_picked_d1_scanout;
wire [2:0] woq1_wr_picked;
wire drif1_rd_picked_d1;
wire drif1_wr2_picked_d1;
wire drif1_wr1_picked_d1;
wire drif1_wr_picked_d1;
wire [4:0] drif0_wdq_radr;
wire [4:0] woq_wdq_radr;
wire [4:0] drif1_wdq_radr;
wire drif0_wdq_sel_in;
wire drif1_wdq_sel_in;
wire [4:0] drif_err_state;
wire drif0_wdq_rd_inh;
wire [2:0] drif0_cpu_wr_addr;
wire drif1_wdq_rd_inh;
wire [2:0] drif1_cpu_wr_addr;
wire ff0_wr_entry0_scanin;
wire ff0_wr_entry0_scanout;
wire ff1_wr_entry0_scanin;
wire ff1_wr_entry0_scanout;
wire ff_wdq_sel_scanin;
wire ff_wdq_sel_scanout;
wire drif0_wdq_sel;
wire drif1_wdq_sel;
wire [2:0] drif_scrub_data_rden_in;
wire drif_scrub_buffer_full;
wire drif_multi_err;
wire ff_scrub_data_rden_scanin;
wire ff_scrub_data_rden_scanout;
wire [1:0] drif_scrub_buffer_cnt;
wire [1:0] drif_scrub_buffer_cnt_in;
wire drif_scrub_wren_d2;
wire ff_scrub_buffer_cnt_scanin;
wire ff_scrub_buffer_cnt_scanout;
wire drif_multi_err_in;
wire drif_scrub_wren;
wire ff_multi_err_scanin;
wire ff_multi_err_scanout;
wire [1:0] drif_woq_free;
wire drif_error_write_flag;
wire drif_error_write_flag_in;
wire ff_error_write_flag_scanin;
wire ff_error_write_flag_scanout;
wire ff_scrub_data_rden_en_d1_scanin;
wire ff_scrub_data_rden_en_d1_scanout;
wire drif_scrub_data_rden0_d1;
wire drif_err_wrdata_ready_in;
wire drif_err_wrdata_ready;
wire ff_err_wrdata_ready_scanin;
wire ff_err_wrdata_ready_scanout;
wire [1:0] woq_io_wdata_sel;
wire drif_wadr_parity_p2;
wire woq_wadr_parity;
wire ff_wadr_parity_scanin;
wire ff_wadr_parity_scanout;
wire drif_wadr_parity_p1;
wire ff_rd_index_d1_scanin;
wire ff_rd_index_d1_scanout;
wire [2:0] woq_wr_wdq_index_picked;
wire [2:0] drif_rd_index_d1;
wire [2:0] drif_wr_index_d1;
wire [2:0] drif_wr_wdq_index_d1;
wire ff_err_fifo_err_type_d1_scanin;
wire ff_err_fifo_err_type_d1_scanout;
wire drif_err_fifo_err_type;
wire drif_err_fifo_err_type_d1;
wire drif_err_rd_picked_d1;
wire drif_err_fifo_crc_d1;
wire [2:0] drif_err_fifo_rdq_entry_d1;
wire drif_err_fifo_l2bank;
wire [4:0] drif_mcu_state_enc;
wire ff_mcu_state_enc_scanin;
wire ff_mcu_state_enc_scanout;
wire [4:0] dal_reg;
wire drif_ref_go;
wire [4:0] ral_reg;
wire [4:0] rc_reg;
wire ff_cyc_cnt_scanin;
wire ff_cyc_cnt_scanout;
wire [1:0] mrd_cnt_next;
wire mrd_cnt_is_zero;
wire [1:0] mrd_reg;
wire [1:0] mrd_cnt;
wire ff_mrd_cnt_scanin;
wire ff_mrd_cnt_scanout;
wire [3:0] rp_cnt_next;
wire [3:0] rp_reg;
wire [3:0] rp_cnt;
wire ff_rp_cnt_scanin;
wire ff_rp_cnt_scanout;
wire rp_cnt_is_zero;
wire ff_bank_idle_cnt_scanin;
wire ff_bank_idle_cnt_scanout;
wire ff_refresh_rank_scanin;
wire ff_refresh_rank_scanout;
wire drif_enter_self_refresh_in;
wire ff_enter_self_refresh_scanin;
wire ff_enter_self_refresh_scanout;
wire drif_exit_self_refresh_in;
wire ff_exit_self_refresh_scanin;
wire ff_exit_self_refresh_scanout;
wire drif_l2poison_qw_in;
wire ff_l2_poison_qw_scanin;
wire ff_l2_poison_qw_scanout;
wire sch_mode_reg_en;
wire [6:4] mode_reg_in;
wire [6:0] mode_reg;
wire [5:4] inv_mode_reg_in;
wire [5:4] inv_mode_reg;
wire pff_mode_reg_wmr_scanin;
wire pff_mode_reg_wmr_scanout;
wire sch_ext_mode_reg1_en;
wire [14:0] ext_mode_reg1_in;
wire [4:3] inv_ext_mode_reg1_in;
wire [14:0] ext_mode_reg1;
wire [4:3] inv_ext_mode_reg1;
wire pff_ext_mode_reg1_wmr_scanin;
wire pff_ext_mode_reg1_wmr_scanout;
wire sch_ext_mode_reg2_en;
wire [14:0] ext_mode_reg2_in;
wire pff_ext_mode_reg2_wmr_scanin;
wire pff_ext_mode_reg2_wmr_scanout;
wire [14:0] ext_mode_reg2;
wire sch_ext_mode_reg3_en;
wire [14:0] ext_mode_reg3_in;
wire pff_ext_mode_reg3_wmr_scanin;
wire pff_ext_mode_reg3_wmr_scanout;
wire [14:0] ext_mode_reg3;
wire drif_stacked_dimm_en;
wire drif_stacked_dimm_in;
wire pff_stacked_dimm_wmr_scanin;
wire pff_stacked_dimm_wmr_scanout;
wire drif_cas_addr_bits_en;
wire [3:0] drif_cas_addr_bits_in;
wire [2:0] inv_drif_cas_addr_bits_in;
wire [2:0] inv_drif_cas_addr_bits;
wire pff_cas_addr_bits_wmr_scanin;
wire pff_cas_addr_bits_wmr_scanout;
wire drif_ras_addr_bits_en;
wire [3:0] drif_ras_addr_bits_in;
wire [3:0] inv_drif_ras_addr_bits_in;
wire [3:0] drif_ras_addr_bits;
wire [3:0] inv_drif_ras_addr_bits;
wire pff_ras_addr_bits_wmr_scanin;
wire pff_ras_addr_bits_wmr_scanout;
wire [1:0] drif_row_addr_bits;
wire [1:0] drif_mem_type_in;
wire drif_eight_bank_mode_nomod;
wire ff_mem_type_scanin;
wire ff_mem_type_scanout;
wire drif_freq_scrub_en;
wire [11:0] drif_freq_scrub_in;
wire [11:0] inv_drif_freq_scrub_in;
wire [11:0] drif_freq_scrub;
wire [11:0] inv_drif_freq_scrub;
wire pff_freq_scrub_wmr_scanin;
wire pff_freq_scrub_wmr_scanout;
wire drif_dimms_present_en;
wire [3:0] drif_dimms_present_in;
wire [0:0] inv_drif_dimms_present_in;
wire [3:0] drif_dimms_present;
wire [0:0] inv_drif_dimms_present;
wire pff_dimms_present_wmr_scanin;
wire pff_dimms_present_wmr_scanout;
wire drif_branch_disabled_en;
wire drif_branch_disabled_in;
wire pff_branch_disabled_wmr_scanin;
wire pff_branch_disabled_wmr_scanout;
wire drif_init_en;
wire drif_init_in;
wire inv_drif_init_in;
wire inv_drif_init;
wire ff_init_scanin;
wire ff_init_scanout;
wire drif_addr_bank_low_sel_en;
wire drif_addr_bank_low_sel_in;
wire pff_bank_low_sel_wmr_scanin;
wire pff_bank_low_sel_wmr_scanout;
wire drif_eight_bank_mode_en;
wire drif_eight_bank_mode_in;
wire inv_drif_eight_bank_mode_in;
wire drif_eight_bank_mode;
wire inv_drif_eight_bank_mode;
wire pff_eight_bank_present_wmr_scanin;
wire pff_eight_bank_present_wmr_scanout;
wire drif_single_channel_mode_en;
wire drif_single_channel_mode_in;
wire pff_single_channel_mode_wmr_scanin;
wire pff_single_channel_mode_wmr_scanout;
wire drif_single_channel_mode_pend_clr;
wire ff_single_channel_mode_pend_scanin;
wire ff_single_channel_mode_pend_scanout;
wire drif_single_channel_mode_pend;
wire drif_fail_over_mode_en;
wire drif_fail_over_mode_in;
wire pff_fail_over_mode_wmr_scanin;
wire pff_fail_over_mode_wmr_scanout;
wire drif_cke_en;
wire drif_cke_in;
wire ff_cke_enable_scanin;
wire ff_cke_enable_scanout;
wire drif_fail_over_mask_en;
wire [34:0] drif_fail_over_mask_in;
wire pff_fail_over_mask_wmr_scanin;
wire pff_fail_over_mask_wmr_scanout;
wire sch_rrd_reg_en;
wire [3:0] rrd_reg_in;
wire [1:1] inv_rrd_reg_in;
wire [3:0] rrd_reg;
wire [1:1] inv_rrd_reg;
wire pff_rrd_reg_wmr_scanin;
wire pff_rrd_reg_wmr_scanout;
wire sch_rcd_reg_en;
wire [3:0] rcd_reg_in;
wire [1:0] inv_rcd_reg_in;
wire [3:0] rcd_reg;
wire [1:0] inv_rcd_reg;
wire pff_rcd_reg_wmr_scanin;
wire pff_rcd_reg_wmr_scanout;
wire sch_iwtr_reg_en;
wire [1:0] iwtr_reg_in;
wire [1:1] inv_iwtr_reg_in;
wire [1:0] iwtr_reg;
wire [1:1] inv_iwtr_reg;
wire pff_iwtr_reg_wmr_scanin;
wire pff_iwtr_reg_wmr_scanout;
wire sch_wtr_reg_en;
wire [3:0] wtr_reg_in;
wire pff_wtr_reg_wmr_scanin;
wire pff_wtr_reg_wmr_scanout;
wire [3:0] wtr_dly_reg;
wire [3:0] wtr_reg;
wire sch_rtw_reg_en;
wire [3:0] rtw_reg_in;
wire pff_rtw_reg_wmr_scanin;
wire pff_rtw_reg_wmr_scanout;
wire [3:0] rtw_dly_reg;
wire [3:0] rtw_reg;
wire [4:0] dal_reg_in;
wire [3:0] wr_reg;
wire ff_dal_reg_scanin;
wire ff_dal_reg_scanout;
wire [4:0] al_plus_bl_2;
wire cmp0;
wire [3:0] ras_reg;
wire cmp1;
wire [2:0] rtp_reg;
wire cmp2;
wire [4:0] max_ral_delay;
wire [4:0] ral_reg_in;
wire ff_ral_reg_scanin;
wire ff_ral_reg_scanout;
wire sch_rtp_reg_en;
wire [2:0] rtp_reg_in;
wire [1:1] inv_rtp_reg_in;
wire [1:1] inv_rtp_reg;
wire pff_rtp_reg_wmr_scanin;
wire pff_rtp_reg_wmr_scanout;
wire sch_ras_reg_en;
wire [3:0] ras_reg_in;
wire [1:0] inv_ras_reg_in;
wire [1:0] inv_ras_reg;
wire pff_ras_reg_wmr_scanin;
wire pff_ras_reg_wmr_scanout;
wire sch_rp_reg_en;
wire [3:0] rp_reg_in;
wire [1:0] inv_rp_reg_in;
wire [1:0] inv_rp_reg;
wire pff_rp_reg_wmr_scanin;
wire pff_rp_reg_wmr_scanout;
wire sch_rc_reg_en;
wire [4:0] rc_reg_in;
wire [3:2] inv_rc_reg_in;
wire [3:2] inv_rc_reg;
wire pff_rc_reg_wmr_scanin;
wire pff_rc_reg_wmr_scanout;
wire sch_wr_reg_en;
wire [3:0] wr_reg_in;
wire [1:0] inv_wr_reg_in;
wire [1:0] inv_wr_reg;
wire pff_wr_reg_wmr_scanin;
wire pff_wr_reg_wmr_scanout;
wire sch_rfc_reg_en;
wire [6:0] rfc_reg_in;
wire [6:0] rfc_reg_reset_val_in;
wire [6:0] rfc_reg_reset_val;
wire pff_rfc_reg_wmr_scanin;
wire pff_rfc_reg_wmr_scanout;
wire sch_mrd_reg_en;
wire [1:0] mrd_reg_in;
wire [1:1] inv_mrd_reg_in;
wire [1:1] inv_mrd_reg;
wire pff_mrd_reg_wmr_scanin;
wire pff_mrd_reg_wmr_scanout;
wire faw_reg_en;
wire [4:0] faw_reg_in;
wire [1:0] inv_faw_reg_in;
wire [4:0] faw_reg;
wire [1:0] inv_faw_reg;
wire pff_faw_reg_wmr_scanin;
wire pff_faw_reg_wmr_scanout;
wire drif_precharge_wait_en;
wire [7:0] drif_precharge_wait_in;
wire [7:0] drif_precharge_wait_reset_val_in;
wire [7:0] drif_precharge_wait_reset_val;
wire ff_precharge_wait_scanin;
wire ff_precharge_wait_scanout;
wire drif_err_inj_reg_en;
wire drif_sshot_err_reg;
wire drif_err_injected;
wire drif_err_inj_reg_in;
wire pff_err_inj_wmr_scanin;
wire pff_err_inj_wmr_scanout;
wire drif_err_inj_reg;
wire drif_sshot_err_reg_en;
wire drif_sshot_err_reg_in;
wire pff_sshot_wmr_scanin;
wire pff_sshot_wmr_scanout;
wire drif_err_mask_reg_en;
wire [15:0] drif_err_mask_reg_in;
wire pff_err_mask_wmr_scanin;
wire pff_err_mask_wmr_scanout;
wire ff_wdq_sel_d1_scanin;
wire ff_wdq_sel_d1_scanout;
wire [12:0] drif_ref_freq_reset_val;
wire drif_ref_freq_en;
wire [12:0] drif_ref_freq_in;
wire [12:0] drif_ref_freq;
wire [12:0] drif_ref_freq_out;
wire pff_ref_freq_wmr_scanin;
wire pff_ref_freq_wmr_scanout;
wire [15:0] drif_refresh_rank_dec;
wire [15:0] pdmc_rank_avail;
wire [12:0] drif_ref_cnt_in;
wire ff_ref_cnt_scanin;
wire ff_ref_cnt_scanout;
wire fbdic_l0_state_d1;
wire ff_l0_state_d1_scanin;
wire ff_l0_state_d1_scanout;
wire drif_data_scrub_en;
wire drif_data_scrub_en_in;
wire pff_data_scrub_wmr_scanin;
wire pff_data_scrub_wmr_scanout;
wire drif_data_scrub_enabled;
wire [11:0] drif_scrub_cnt_in;
wire [11:0] drif_scrub_cnt;
wire drif_scrub_cnt_reset;
wire drif_init_mcu_done;
wire drif_scrub_cnt_en;
wire ff_scrub_cnt_scanin;
wire ff_scrub_cnt_scanout;
wire drif_scrub_read_pending_in;
wire drif_scrub_read_pending_en;
wire drif_scrub_read_outstanding;
wire drif_scrub_read_pending_reset;
wire ff_scrub_read_pending_scanin;
wire ff_scrub_read_pending_scanout;
wire ff_scrub_read_out_scanin;
wire ff_scrub_read_out_scanout;
wire ff_scrub_read_pending_en_d1_scanin;
wire ff_scrub_read_pending_en_d1_scanout;
wire drif_scrub_read_pending_en_d1;
wire drif_scrub_time;
wire pt_max_banks_open_en;
wire [16:0] pt_max_banks_open_in;
wire [16:0] inv_pt_max_banks_open_in;
wire [16:0] pt_max_banks_open;
wire [16:0] inv_pt_max_banks_open;
wire pff_max_banks_open_wmr_scanin;
wire pff_max_banks_open_wmr_scanout;
wire pt_max_time_en;
wire [15:0] pt_max_time_in;
wire [15:0] inv_pt_max_time_in;
wire [15:0] pt_max_time;
wire [15:0] inv_pt_max_time;
wire pff_max_time_wmr_scanin;
wire pff_max_time_wmr_scanout;
wire pt_sync_out;
wire ff_pt_sync_out_d1_scanin;
wire ff_pt_sync_out_d1_scanout;
wire pt_sync_out_d1;
wire mcu_pt_sync_out_in;
wire ff_pt_sync_out_scanin;
wire ff_pt_sync_out_scanout;
wire ff_pt_sync_scanin;
wire ff_pt_sync_scanout;
wire [3:0] pt_sync;
wire pt_reset;
wire [15:0] pt_time_cntr;
wire pt_banks_open_en;
wire [16:0] pt_banks_open_in;
wire [16:0] pt_banks_open;
wire ff_banks_open_scanin;
wire ff_banks_open_scanout;
wire [15:0] pt_time_cntr_in;
wire ff_time_cntr_scanin;
wire ff_time_cntr_scanout;
wire drif_blk_new_openbank_in;
wire ff_blk_openbank_scanin;
wire ff_blk_openbank_scanout;
wire drif_wr_mode_reg_done_in;
wire drif_wr_mode_reg_done;
wire wr_mode_reg_done_reset;
wire ff_wr_mode_reg_scanin;
wire ff_wr_mode_reg_scanout;
wire drif_init_mcu_done_in;
wire ff_init_done_scanin;
wire ff_init_done_scanout;
wire drif_init_status_reg_in;
wire drif_init_status_reg;
wire int_status_reg_reset;
wire ff_init_status_reg_scanin;
wire ff_init_status_reg_scanout;
wire drif_rdata_nack_vld_in;
wire drif_rdata_ack_vld_in;
wire [63:0] drif_rdata_data_in;
wire [65:0] drif_read_ucb_info;
wire ff_ucb_data_scanin;
wire ff_ucb_data_scanout;
wire drif_pd_mode_enable_en;
wire drif_pd_mode_enable_in;
wire ff_pd_mode_enable_scanin;
wire ff_pd_mode_enable_scanout;
wire drif_pd_mode_enable;
wire drif_perf_cntl_reg_en;
wire [7:0] drif_perf_cntl_reg_in;
wire ff_perf_cntl_reg_scanin;
wire ff_perf_cntl_reg_scanout;
wire [7:0] drif_perf_cntl_reg;
wire ff_crit_sig_scanin;
wire ff_crit_sig_scanout;
wire drif_rd_xaction_picked;
wire drif_wr_xaction_picked;
wire drif_bank_busy_stall;
wire [4:0] drif_rd_que_latency;
wire [4:0] drif_wr_que_latency;
wire drif_writeback_buf_hit;
wire drif_rd_que_latency_adj;
wire drif_wr_que_latency_adj;
wire drif_rd_xaction_picked_d1;
wire drif_wr_xaction_picked_d1;
wire drif_bank_busy_stall_d1;
wire [4:0] drif_rd_que_latency_noadj_d1;
wire [4:0] drif_wr_que_latency_noadj_d1;
wire drif_writeback_buf_hit_d1;
wire drif_rd_que_latency_adj_d1;
wire drif_wr_que_latency_adj_d1;
wire [4:0] drif_rd_que_latency_d1;
wire [4:0] drif_wr_que_latency_d1;
wire drif_perf_cnt0_reg_en;
wire [31:0] drif_perf_cnt0_reg_in;
wire [31:0] drif_perf0_adder_out;
wire [31:0] drif_perf_cnt0_reg;
wire [31:0] drif_perf0_adder_in;
wire drif_rd_or_wr_xaction_picked_d1;
wire [5:0] drif_rd_or_wr_que_latency_d1;
wire ff_perf_cnt0_reg_scanin;
wire ff_perf_cnt0_reg_scanout;
wire drif_perf_cnt1_reg_en;
wire [31:0] drif_perf_cnt1_reg_in;
wire [31:0] drif_perf1_adder_out;
wire [31:0] drif_perf_cnt1_reg;
wire [31:0] drif_perf1_adder_in;
wire ff_perf_cnt1_reg_scanin;
wire ff_perf_cnt1_reg_scanout;
wire drif_cmd_write;
wire ff_raw_hazard_d1_scanin;
wire ff_raw_hazard_d1_scanout;
wire drif_raw_hazard_d1;
wire [7:0] drq0_rdbuf_valids;
wire [7:0] drq1_rdbuf_valids;
wire [7:0] drq0_wrbuf_valids;
wire [7:0] drq1_wrbuf_valids;
wire [3:0] drq0_read_queue_cnt;
wire [3:0] drq1_read_queue_cnt;
wire [3:0] drq0_write_queue_cnt;
wire [3:0] drq1_write_queue_cnt;
wire ff_scrub_wren_scanin;
wire ff_scrub_wren_scanout;
wire drif_scrub_wren_d1;
wire drif_err_fifo_deq;
wire drif_err_fifo_crc;
wire drif_scrub_addr_incr;
wire errq_scanin;
wire errq_scanout;
wire [14:0] drif_err_fifo_ent0;
wire drif_err_fifo_full;
wire ff_err_fifo_empty_d1_scanin;
wire ff_err_fifo_empty_d1_scanout;
wire [7:0] drif_drq0_clear_ent;
wire [7:0] drif_drq1_clear_ent;
wire drq0_req_rdwr_addr_sel;
wire [7:0] drq0_rd_adr_queue_sel;
wire [7:0] drif_err_rd_adr_queue_sel;
wire drq1_req_rdwr_addr_sel;
wire [7:0] drq1_rd_adr_queue_sel;
wire drif_err_ready;
wire drif_crc_retry_wait;
wire woq_empty;
wire woq_owr_empty;
wire [15:0] drif_err_rank_avail;
wire woq_wdata_send;
wire drif_err_rd_ready;
wire [7:0] drif_dimm_err_rd_avail;
wire drif_err_wr_ready;
wire rtr_cnt_is_zero_err;
wire wtr_cnt_is_zero_err;
wire wtw_cnt_is_zero_err;
wire rtw_cnt_is_zero_err;
wire [15:0] drif_err_bank_valid;
wire drif1_err_rd_picked;
wire drif1_err_wr_picked;
wire ff_err_rd_picked_d1_scanin;
wire ff_err_rd_picked_d1_scanout;
wire ff_err_fifo_d1_scanin;
wire ff_err_fifo_d1_scanout;
wire drif_crc_retry_wait_in;
wire ff_crc_retry_wait_scanin;
wire ff_crc_retry_wait_scanout;
wire [0:0] inv_drif_err_state_next;
wire [4:0] drif_err_state_next;
wire [0:0] inv_drif_err_state;
wire ff_err_state_scanin;
wire ff_err_state_scanout;
wire drif_mcu_error_mode_in;
wire ff_mcu_error_mode_scanin;
wire ff_mcu_error_mode_scanout;
wire reqq_scanin;
wire reqq_scanout;
wire [31:0] drif_scrub_addr_in;
wire drif_scrub_addr_en;
wire drif_scrub_addr_clr;
wire ff_scrub_addr_scanin;
wire ff_scrub_addr_scanout;
wire adrgen_scanin;
wire adrgen_scanout;
wire drif_scrub_addr_err_out;
wire [15:0] drif_pd_mode_scrub_rank;
wire [15:0] drif_pd_mode_scrub_incr;
wire [15:0] drif_pd_mode_scrub_decr;
wire [15:0] drif_pd_mode_err_incr;
wire [15:0] drif_pd_mode_err_decr;
wire [15:0] drif_pd_mode_err_rank;
wire [15:0] pdmc_pdx_pending;
wire [15:0] pdmc_pde_pending;
wire [15:0] drif_pdx_issued;
wire [15:0] pdmc_pdx_pending_priority;
wire [15:0] drif_pde_issued;
wire [15:0] pdmc_pde_pending_priority;
wire [7:0] drif_num_dimm_dec;
wire [15:0] drif_pdmc_enable;
wire [15:0] drif_refresh_mode;
wire [15:0] pdmc_rank_avail_out;
wire pdmc0_scanin;
wire pdmc0_scanout;
wire [15:0] drq0_pd_mode_rd_incr;
wire [15:0] drq1_pd_mode_rd_incr;
wire [15:0] drq0_pd_mode_wr_incr;
wire [15:0] drq1_pd_mode_wr_incr;
wire [15:0] drq0_pd_mode_rd_decr;
wire [15:0] drq1_pd_mode_rd_decr;
wire [15:0] woq_pd_mode_wr_decr;
wire [15:0] woq_err_pdm_wr_decr;
wire [15:0] woq_err_pdm_wr_incr;
wire pdmc1_scanin;
wire pdmc1_scanout;
wire pdmc2_scanin;
wire pdmc2_scanout;
wire pdmc3_scanin;
wire pdmc3_scanout;
wire pdmc4_scanin;
wire pdmc4_scanout;
wire pdmc5_scanin;
wire pdmc5_scanout;
wire pdmc6_scanin;
wire pdmc6_scanout;
wire pdmc7_scanin;
wire pdmc7_scanout;
wire pdmc8_scanin;
wire pdmc8_scanout;
wire pdmc9_scanin;
wire pdmc9_scanout;
wire pdmc10_scanin;
wire pdmc10_scanout;
wire pdmc11_scanin;
wire pdmc11_scanout;
wire pdmc12_scanin;
wire pdmc12_scanout;
wire pdmc13_scanin;
wire pdmc13_scanout;
wire pdmc14_scanin;
wire pdmc14_scanout;
wire pdmc15_scanin;
wire pdmc15_scanout;
wire drif_pdmc_idle;
wire drif_pdmc_idle_d0;
wire drif_pdmc_idle_d1;
wire drq0_rd_req;
wire drq0_wr_req;
wire drq1_rd_req;
wire drq1_wr_req;
wire drq0_empty;
wire drq1_empty;
wire si_0;
wire so_0;
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
wire spare18_flop_unused;
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
wire spare20_flop_unused;
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
wire si_22;
wire so_22;
wire spare22_flop_unused;
wire spare22_buf_32x_unused;
wire spare22_nand3_8x_unused;
wire spare22_inv_8x_unused;
wire spare22_aoi22_4x_unused;
wire spare22_buf_8x_unused;
wire spare22_oai22_4x_unused;
wire spare22_inv_16x_unused;
wire spare22_nand2_16x_unused;
wire spare22_nor3_4x_unused;
wire spare22_nand2_8x_unused;
wire spare22_buf_16x_unused;
wire spare22_nor2_16x_unused;
wire spare22_inv_32x_unused;
wire si_23;
wire so_23;
wire spare23_flop_unused;
wire spare23_buf_32x_unused;
wire spare23_nand3_8x_unused;
wire spare23_inv_8x_unused;
wire spare23_aoi22_4x_unused;
wire spare23_buf_8x_unused;
wire spare23_oai22_4x_unused;
wire spare23_inv_16x_unused;
wire spare23_nand2_16x_unused;
wire spare23_nor3_4x_unused;
wire spare23_nand2_8x_unused;
wire spare23_buf_16x_unused;
wire spare23_nor2_16x_unused;
wire spare23_inv_32x_unused;
wire si_24;
wire so_24;
wire spare24_flop_unused;
wire spare24_buf_32x_unused;
wire spare24_nand3_8x_unused;
wire spare24_inv_8x_unused;
wire spare24_aoi22_4x_unused;
wire spare24_buf_8x_unused;
wire spare24_oai22_4x_unused;
wire spare24_inv_16x_unused;
wire spare24_nand2_16x_unused;
wire spare24_nor3_4x_unused;
wire spare24_nand2_8x_unused;
wire spare24_buf_16x_unused;
wire spare24_nor2_16x_unused;
wire spare24_inv_32x_unused;
wire si_25;
wire so_25;
wire spare25_flop_unused;
wire spare25_buf_32x_unused;
wire spare25_nand3_8x_unused;
wire spare25_inv_8x_unused;
wire spare25_aoi22_4x_unused;
wire spare25_buf_8x_unused;
wire spare25_oai22_4x_unused;
wire spare25_inv_16x_unused;
wire spare25_nand2_16x_unused;
wire spare25_nor3_4x_unused;
wire spare25_nand2_8x_unused;
wire spare25_buf_16x_unused;
wire spare25_nor2_16x_unused;
wire spare25_inv_32x_unused;
wire si_26;
wire so_26;
wire spare26_flop_unused;
wire spare26_buf_32x_unused;
wire spare26_nand3_8x_unused;
wire spare26_inv_8x_unused;
wire spare26_aoi22_4x_unused;
wire spare26_buf_8x_unused;
wire spare26_oai22_4x_unused;
wire spare26_inv_16x_unused;
wire spare26_nand2_16x_unused;
wire spare26_nor3_4x_unused;
wire spare26_nand2_8x_unused;
wire spare26_buf_16x_unused;
wire spare26_nor2_16x_unused;
wire spare26_inv_32x_unused;
wire si_27;
wire so_27;
wire spare27_flop_unused;
wire spare27_buf_32x_unused;
wire spare27_nand3_8x_unused;
wire spare27_inv_8x_unused;
wire spare27_aoi22_4x_unused;
wire spare27_buf_8x_unused;
wire spare27_oai22_4x_unused;
wire spare27_inv_16x_unused;
wire spare27_nand2_16x_unused;
wire spare27_nor3_4x_unused;
wire spare27_nand2_8x_unused;
wire spare27_buf_16x_unused;
wire spare27_nor2_16x_unused;
wire spare27_inv_32x_unused;
wire si_28;
wire so_28;
wire spare28_flop_unused;
wire spare28_buf_32x_unused;
wire spare28_nand3_8x_unused;
wire spare28_inv_8x_unused;
wire spare28_aoi22_4x_unused;
wire spare28_buf_8x_unused;
wire spare28_oai22_4x_unused;
wire spare28_inv_16x_unused;
wire spare28_nand2_16x_unused;
wire spare28_nor3_4x_unused;
wire spare28_nand2_8x_unused;
wire spare28_buf_16x_unused;
wire spare28_nor2_16x_unused;
wire spare28_inv_32x_unused;
wire si_29;
wire so_29;
wire spare29_flop_unused;
wire spare29_buf_32x_unused;
wire spare29_nand3_8x_unused;
wire spare29_inv_8x_unused;
wire spare29_aoi22_4x_unused;
wire spare29_buf_8x_unused;
wire spare29_oai22_4x_unused;
wire spare29_inv_16x_unused;
wire spare29_nand2_16x_unused;
wire spare29_nor3_4x_unused;
wire spare29_nand2_8x_unused;
wire spare29_buf_16x_unused;
wire spare29_nor2_16x_unused;
wire spare29_inv_32x_unused;
wire si_30;
wire so_30;
wire spare30_flop_unused;
wire spare30_buf_32x_unused;
wire spare30_nand3_8x_unused;
wire spare30_inv_8x_unused;
wire spare30_aoi22_4x_unused;
wire spare30_buf_8x_unused;
wire spare30_oai22_4x_unused;
wire spare30_inv_16x_unused;
wire spare30_nand2_16x_unused;
wire spare30_nor3_4x_unused;
wire spare30_nand2_8x_unused;
wire spare30_buf_16x_unused;
wire spare30_nor2_16x_unused;
wire spare30_inv_32x_unused;
wire si_31;
wire so_31;
wire spare31_flop_unused;
wire spare31_buf_32x_unused;
wire spare31_nand3_8x_unused;
wire spare31_inv_8x_unused;
wire spare31_aoi22_4x_unused;
wire spare31_buf_8x_unused;
wire spare31_oai22_4x_unused;
wire spare31_inv_16x_unused;
wire spare31_nand2_16x_unused;
wire spare31_nor3_4x_unused;
wire spare31_nand2_8x_unused;
wire spare31_buf_16x_unused;
wire spare31_nor2_16x_unused;
wire spare31_inv_32x_unused;
wire si_32;
wire so_32;
wire spare32_flop_unused;
wire spare32_buf_32x_unused;
wire spare32_nand3_8x_unused;
wire spare32_inv_8x_unused;
wire spare32_aoi22_4x_unused;
wire spare32_buf_8x_unused;
wire spare32_oai22_4x_unused;
wire spare32_inv_16x_unused;
wire spare32_nand2_16x_unused;
wire spare32_nor3_4x_unused;
wire spare32_nand2_8x_unused;
wire spare32_buf_16x_unused;
wire spare32_nor2_16x_unused;
wire spare32_inv_32x_unused;
wire si_33;
wire so_33;
wire spare33_flop_unused;
wire spare33_buf_32x_unused;
wire spare33_nand3_8x_unused;
wire spare33_inv_8x_unused;
wire spare33_aoi22_4x_unused;
wire spare33_buf_8x_unused;
wire spare33_oai22_4x_unused;
wire spare33_inv_16x_unused;
wire spare33_nand2_16x_unused;
wire spare33_nor3_4x_unused;
wire spare33_nand2_8x_unused;
wire spare33_buf_16x_unused;
wire spare33_nor2_16x_unused;
wire spare33_inv_32x_unused;
wire si_34;
wire so_34;
wire spare34_flop_unused;
wire spare34_buf_32x_unused;
wire spare34_nand3_8x_unused;
wire spare34_inv_8x_unused;
wire spare34_aoi22_4x_unused;
wire spare34_buf_8x_unused;
wire spare34_oai22_4x_unused;
wire spare34_inv_16x_unused;
wire spare34_nand2_16x_unused;
wire spare34_nor3_4x_unused;
wire spare34_nand2_8x_unused;
wire spare34_buf_16x_unused;
wire spare34_nor2_16x_unused;
wire spare34_inv_32x_unused;
wire si_35;
wire so_35;
wire spare35_flop_unused;
wire spare35_buf_32x_unused;
wire spare35_nand3_8x_unused;
wire spare35_inv_8x_unused;
wire spare35_aoi22_4x_unused;
wire spare35_buf_8x_unused;
wire spare35_oai22_4x_unused;
wire spare35_inv_16x_unused;
wire spare35_nand2_16x_unused;
wire spare35_nor3_4x_unused;
wire spare35_nand2_8x_unused;
wire spare35_buf_16x_unused;
wire spare35_nor2_16x_unused;
wire spare35_inv_32x_unused;
wire si_36;
wire so_36;
wire spare36_flop_unused;
wire spare36_buf_32x_unused;
wire spare36_nand3_8x_unused;
wire spare36_inv_8x_unused;
wire spare36_aoi22_4x_unused;
wire spare36_buf_8x_unused;
wire spare36_oai22_4x_unused;
wire spare36_inv_16x_unused;
wire spare36_nand2_16x_unused;
wire spare36_nor3_4x_unused;
wire spare36_nand2_8x_unused;
wire spare36_buf_16x_unused;
wire spare36_nor2_16x_unused;
wire spare36_inv_32x_unused;
wire si_37;
wire so_37;
wire spare37_flop_unused;
wire spare37_buf_32x_unused;
wire spare37_nand3_8x_unused;
wire spare37_inv_8x_unused;
wire spare37_aoi22_4x_unused;
wire spare37_buf_8x_unused;
wire spare37_oai22_4x_unused;
wire spare37_inv_16x_unused;
wire spare37_nand2_16x_unused;
wire spare37_nor3_4x_unused;
wire spare37_nand2_8x_unused;
wire spare37_buf_16x_unused;
wire spare37_nor2_16x_unused;
wire spare37_inv_32x_unused;
wire si_38;
wire so_38;
wire spare38_flop_unused;
wire spare38_buf_32x_unused;
wire spare38_nand3_8x_unused;
wire spare38_inv_8x_unused;
wire spare38_aoi22_4x_unused;
wire spare38_buf_8x_unused;
wire spare38_oai22_4x_unused;
wire spare38_inv_16x_unused;
wire spare38_nand2_16x_unused;
wire spare38_nor3_4x_unused;
wire spare38_nand2_8x_unused;
wire spare38_buf_16x_unused;
wire spare38_nor2_16x_unused;
wire spare38_inv_32x_unused;
wire si_39;
wire so_39;
wire spare39_flop_unused;
wire spare39_buf_32x_unused;
wire spare39_nand3_8x_unused;
wire spare39_inv_8x_unused;
wire spare39_aoi22_4x_unused;
wire spare39_buf_8x_unused;
wire spare39_oai22_4x_unused;
wire spare39_inv_16x_unused;
wire spare39_nand2_16x_unused;
wire spare39_nor3_4x_unused;
wire spare39_nand2_8x_unused;
wire spare39_buf_16x_unused;
wire spare39_nor2_16x_unused;
wire spare39_inv_32x_unused;
wire si_40;
wire so_40;
wire spare40_flop_unused;
wire spare40_buf_32x_unused;
wire spare40_nand3_8x_unused;
wire spare40_inv_8x_unused;
wire spare40_aoi22_4x_unused;
wire spare40_buf_8x_unused;
wire spare40_oai22_4x_unused;
wire spare40_inv_16x_unused;
wire spare40_nand2_16x_unused;
wire spare40_nor3_4x_unused;
wire spare40_nand2_8x_unused;
wire spare40_buf_16x_unused;
wire spare40_nor2_16x_unused;
wire spare40_inv_32x_unused;
wire si_41;
wire so_41;
wire spare41_flop_unused;
wire spare41_buf_32x_unused;
wire spare41_nand3_8x_unused;
wire spare41_inv_8x_unused;
wire spare41_aoi22_4x_unused;
wire spare41_buf_8x_unused;
wire spare41_oai22_4x_unused;
wire spare41_inv_16x_unused;
wire spare41_nand2_16x_unused;
wire spare41_nor3_4x_unused;
wire spare41_nand2_8x_unused;
wire spare41_buf_16x_unused;
wire spare41_nor2_16x_unused;
wire spare41_inv_32x_unused;
wire si_42;
wire so_42;
wire spare42_flop_unused;
wire spare42_buf_32x_unused;
wire spare42_nand3_8x_unused;
wire spare42_inv_8x_unused;
wire spare42_aoi22_4x_unused;
wire spare42_buf_8x_unused;
wire spare42_oai22_4x_unused;
wire spare42_inv_16x_unused;
wire spare42_nand2_16x_unused;
wire spare42_nor3_4x_unused;
wire spare42_nand2_8x_unused;
wire spare42_buf_16x_unused;
wire spare42_nor2_16x_unused;
wire spare42_inv_32x_unused;
wire si_43;
wire so_43;
wire spare43_flop_unused;
wire spare43_buf_32x_unused;
wire spare43_nand3_8x_unused;
wire spare43_inv_8x_unused;
wire spare43_aoi22_4x_unused;
wire spare43_buf_8x_unused;
wire spare43_oai22_4x_unused;
wire spare43_inv_16x_unused;
wire spare43_nand2_16x_unused;
wire spare43_nor3_4x_unused;
wire spare43_nand2_8x_unused;
wire spare43_buf_16x_unused;
wire spare43_nor2_16x_unused;
wire spare43_inv_32x_unused;
wire si_44;
wire so_44;
wire spare44_flop_unused;
wire spare44_buf_32x_unused;
wire spare44_nand3_8x_unused;
wire spare44_inv_8x_unused;
wire spare44_aoi22_4x_unused;
wire spare44_buf_8x_unused;
wire spare44_oai22_4x_unused;
wire spare44_inv_16x_unused;
wire spare44_nand2_16x_unused;
wire spare44_nor3_4x_unused;
wire spare44_nand2_8x_unused;
wire spare44_buf_16x_unused;
wire spare44_nor2_16x_unused;
wire spare44_inv_32x_unused;
wire si_45;
wire so_45;
wire spare45_flop_unused;
wire spare45_buf_32x_unused;
wire spare45_nand3_8x_unused;
wire spare45_inv_8x_unused;
wire spare45_aoi22_4x_unused;
wire spare45_buf_8x_unused;
wire spare45_oai22_4x_unused;
wire spare45_inv_16x_unused;
wire spare45_nand2_16x_unused;
wire spare45_nor3_4x_unused;
wire spare45_nand2_8x_unused;
wire spare45_buf_16x_unused;
wire spare45_nor2_16x_unused;
wire spare45_inv_32x_unused;
wire si_46;
wire so_46;
wire spare46_flop_unused;
wire spare46_buf_32x_unused;
wire spare46_nand3_8x_unused;
wire spare46_inv_8x_unused;
wire spare46_aoi22_4x_unused;
wire spare46_buf_8x_unused;
wire spare46_oai22_4x_unused;
wire spare46_inv_16x_unused;
wire spare46_nand2_16x_unused;
wire spare46_nor3_4x_unused;
wire spare46_nand2_8x_unused;
wire spare46_buf_16x_unused;
wire spare46_nor2_16x_unused;
wire spare46_inv_32x_unused;
wire si_47;
wire so_47;
wire spare47_flop_unused;
wire spare47_buf_32x_unused;
wire spare47_nand3_8x_unused;
wire spare47_inv_8x_unused;
wire spare47_aoi22_4x_unused;
wire spare47_buf_8x_unused;
wire spare47_oai22_4x_unused;
wire spare47_inv_16x_unused;
wire spare47_nand2_16x_unused;
wire spare47_nor3_4x_unused;
wire spare47_nand2_8x_unused;
wire spare47_buf_16x_unused;
wire spare47_nor2_16x_unused;
wire spare47_inv_32x_unused;
wire si_48;
wire so_48;
wire spare48_flop_unused;
wire spare48_buf_32x_unused;
wire spare48_nand3_8x_unused;
wire spare48_inv_8x_unused;
wire spare48_aoi22_4x_unused;
wire spare48_buf_8x_unused;
wire spare48_oai22_4x_unused;
wire spare48_inv_16x_unused;
wire spare48_nand2_16x_unused;
wire spare48_nor3_4x_unused;
wire spare48_nand2_8x_unused;
wire spare48_buf_16x_unused;
wire spare48_nor2_16x_unused;
wire spare48_inv_32x_unused;
wire spares_scanout;
wire drif_scrub_write_req;
wire [2:0] drif_tot_ranks;
wire drif_power_down_mode;
wire mcu_ddp_clk_enable;
wire [2:0] woq_entry_valid;
wire [2:0] woq_wr1_index_picked;
wire [2:0] woq_wr2_index_picked;
wire [2:0] woq_wr1_wdq_index_picked;
wire [2:0] woq_wr2_wdq_index_picked;
wire drq0_wr_entry0_rank;
wire drq0_wr_entry1_rank;
wire drq0_wr_entry2_rank;
wire drq0_wr_entry3_rank;
wire drq0_wr_entry4_rank;
wire drq0_wr_entry5_rank;
wire drq0_wr_entry6_rank;
wire drq0_wr_entry7_rank;
wire [2:0] drq0_wr_entry0_dimm;
wire [2:0] drq0_wr_entry1_dimm;
wire [2:0] drq0_wr_entry2_dimm;
wire [2:0] drq0_wr_entry3_dimm;
wire [2:0] drq0_wr_entry4_dimm;
wire [2:0] drq0_wr_entry5_dimm;
wire [2:0] drq0_wr_entry6_dimm;
wire [2:0] drq0_wr_entry7_dimm;
wire drq0_rdq_full;
wire [2:0] drq0_wr_index_picked;
wire [2:0] drq0_wr_id_picked;
wire drq1_wr_entry0_rank;
wire drq1_wr_entry1_rank;
wire drq1_wr_entry2_rank;
wire drq1_wr_entry3_rank;
wire drq1_wr_entry4_rank;
wire drq1_wr_entry5_rank;
wire drq1_wr_entry6_rank;
wire drq1_wr_entry7_rank;
wire [2:0] drq1_wr_entry0_dimm;
wire [2:0] drq1_wr_entry1_dimm;
wire [2:0] drq1_wr_entry2_dimm;
wire [2:0] drq1_wr_entry3_dimm;
wire [2:0] drq1_wr_entry4_dimm;
wire [2:0] drq1_wr_entry5_dimm;
wire [2:0] drq1_wr_entry6_dimm;
wire [2:0] drq1_wr_entry7_dimm;
wire drq1_rdq_full;
wire [2:0] drq1_wr_index_picked;
wire [2:0] drq1_wr_id_picked;


// PAD interface
output		drif_fail_over_mode;	// indicates writedp and readdp in failover mode
output	[34:0]	drif_fail_over_mask;	// mask and complement for failover mode
output	[34:0]	drif_fail_over_mask_l;
output		drq0_rdq_free;		// entry freed in read request queue0
output		drq1_rdq_free;		// entry freed in read request queue1
output	[7:0]	woq0_wdq_entry_free;
output	[7:0]	woq1_wdq_entry_free;

// addressing mode info to rdpctl
output	[2:0]	drif_num_dimms;
output		drif_addr_bank_low_sel;
output  [1:0]	drif_mem_type;
output		drif_stacked_dimm;
output		drif_single_channel_mode;
output		drif_branch_disabled;

output	[3:0] 	drif_wdata_sel;		// writedp select between wdq0, wdq1 and scrub data

// register read data to rdata_ctl
output          drif_rdata_ack_vld;
output          drif_rdata_nack_vld;
output	[63:0] 	drif_rdata_data;

// error injection info to write dp
output		drif_err_inj_enable;
output 	[15:0]	drif_err_mask_reg;

output		drif_send_info_val; 	// read return information valid
output 	[19:0] 	drif_send_info;		// read return information (l2bank, parity, etc.)

// Read enables and addresses for write data queues
output		drif0_wdq_rd;
output		drif1_wdq_rd;
output	[4:0]	drif_wdq_radr;

output	[1:0]	drif_rascas_adr_sel;	// select between bank 0 and 1 request queues
output	[1:0]	drif_rascas_wr1_adr_sel; // select between bank 0 and 1 request queues
output	[1:0]	drif_rascas_wr2_adr_sel; // select between bank 0 and 1 request queues

output	[31:0]	drif_scrub_addr;

// bank 0 and 1 read request queue load enables
output		drq0_rd_adr_queue7_en;
output		drq0_rd_adr_queue6_en;
output		drq0_rd_adr_queue5_en;
output		drq0_rd_adr_queue4_en;
output		drq0_rd_adr_queue3_en;
output		drq0_rd_adr_queue2_en;
output		drq0_rd_adr_queue1_en;
output		drq0_rd_adr_queue0_en;
output		drq1_rd_adr_queue7_en;
output		drq1_rd_adr_queue6_en;
output		drq1_rd_adr_queue5_en;
output		drq1_rd_adr_queue4_en;
output		drq1_rd_adr_queue3_en;
output		drq1_rd_adr_queue2_en;
output		drq1_rd_adr_queue1_en;
output		drq1_rd_adr_queue0_en;

// bank 0 and 1 write request queue load enables
output		drq0_wr_adr_queue7_en;
output		drq0_wr_adr_queue6_en;
output		drq0_wr_adr_queue5_en;
output		drq0_wr_adr_queue4_en;
output		drq0_wr_adr_queue3_en;
output		drq0_wr_adr_queue2_en;
output		drq0_wr_adr_queue1_en;
output		drq0_wr_adr_queue0_en;
output		drq1_wr_adr_queue7_en;
output		drq1_wr_adr_queue6_en;
output		drq1_wr_adr_queue5_en;
output		drq1_wr_adr_queue4_en;
output		drq1_wr_adr_queue3_en;
output		drq1_wr_adr_queue2_en;
output		drq1_wr_adr_queue1_en;
output		drq1_wr_adr_queue0_en;

// read and write request queue output selects
output	[7:0]	drif0_rd_adr_queue_sel;
output	[7:0]	drif1_rd_adr_queue_sel;
output	[7:0]	woq_wr_adr_queue_sel;
output  [7:0]	woq_wr1_adr_queue_sel;
output  [7:0]	woq_wr2_adr_queue_sel;

// select between read and write request queues for a bank
output	[1:0]	drif0_req_rdwr_addr_sel;
output	[1:0]	drif1_req_rdwr_addr_sel;

output		drif_l2poison_qw;	// data poison information to writedp
output		drif_wadr_parity;	// address parity for writedp

output		mcu_pt_sync_out;	// power throttling sync; resets power
					// throttling counters in all mcu banks
					// when any power throttling register is
					// written

output		drif_scrub_rwen;	// shift data in/out of scrub buffer in wrdp
output	[1:0]	drif_io_wdata_sel;	// selects between double words for single DIMM mode in wrdp

// ucb addr and data bits to rdpctl and fbdic for registers in those block
output		drif_ucb_wr_req_vld;
output		drif_ucb_rd_req_vld;
output	[12:0]	drif_ucb_addr;
output	[63:0]	drif_ucb_data;

// register load signals for register in rdpctl
output		drif_err_sts_reg_ld;
output		drif_err_addr_reg_ld;
output		drif_err_cnt_reg_ld;
output		drif_err_loc_reg_ld;
output		drif_err_retry_reg_ld;
output		drif_dbg_trig_reg_ld;

// FBDIC interface
output	[2:0] 	drif_dram_cmd_a;
output	[15:0] 	drif_dram_addr_a;
output	[2:0] 	drif_dram_bank_a;
output 		drif_dram_rank_a;
output	[2:0] 	drif_dram_dimm_a;

output	[2:0] 	drif_dram_cmd_b;
output	[15:0] 	drif_dram_addr_b;
output	[2:0] 	drif_dram_bank_b;
output 		drif_dram_rank_b;
output	[2:0] 	drif_dram_dimm_b;

output	[2:0] 	drif_dram_cmd_c;
output	[15:0] 	drif_dram_addr_c;
output	[2:0] 	drif_dram_bank_c;
output 		drif_dram_rank_c;
output	[2:0] 	drif_dram_dimm_c;

output		drif_wdata_wsn;
output		woq_err_st_wait_free;
output		drif_crc_rd_picked;
output		drif_err_fifo_empty;
output		woq_err_fifo_empty;
output	[1:0]	woq_wr_req_out;

output		drif_mcu_error_mode;
output		drif_err_state_crc_fr;
output		drif_mcu_idle;
output		drif_cke_reg;

// UCB register rd/wr request information
input         	rdata_drif_rd_req_vld;
input         	rdata_drif_wr_req_vld;
input	[12:0] 	rdata_drif_addr;
input	[63:0]  rdata_drif_data;

input		rdata_mcu_selfrsh;	// puts mcu in self refresh mode

// error status registers from rdpctl
input	[35:0]	rdpctl_err_addr_reg;
input	[25:0]	rdpctl_err_sts_reg;
input	[35:0]	rdpctl_err_loc;
input	[15:0]	rdpctl_err_cnt;
input	[36:0]	rdpctl_err_retry_reg;
input		rdpctl_dbg_trig_enable;	// debug mode trigger 
input		rdpctl_kp_lnk_up;
input		rdpctl_mask_err;
input	[1:0]	rdpctl_dtm_mask_chnl;
input		rdpctl_dtm_atspeed;

// read request queue entry clear signals
input	[7:0]	rdpctl_drq0_clear_ent;
input	[7:0]	rdpctl_drq1_clear_ent;

// write request queue entry clear signals
input		rdpctl_scrub_wren;	// write enable for scrub buffer, gets OR'ed with drif's 
					//     read enable before being sent to wrdp
input		rdpctl_scrub_addrinc_en;
input	[1:0]	readdp_ecc_multi_err;	// multi bit error signal for error handling state machine

// ras, cas, and rd_req_id info from request queues
input	[14:0]	addrdp_ras_adr_queue;
input	[10:0]	addrdp_cas_adr_queue;
input	[2:0]	addrdp_rd_req_id_queue;
input	[14:0]	addrdp_ras_wr1_adr_queue;
input	[10:0]	addrdp_cas_wr1_adr_queue;
input	[14:0]	addrdp_ras_wr2_adr_queue;
input	[10:0]	addrdp_cas_wr2_adr_queue;

// rank, bank, err, and parity for incoming read requests
input		l2b0_rd_rank_adr;
input	[2:0]	l2b0_rd_dimm_adr;
input	[2:0]	l2b0_rd_bank_adr;
input		l2b0_rd_addr_err;
input		l2b0_rd_addr_par;
input		l2b1_rd_rank_adr;
input	[2:0]	l2b1_rd_dimm_adr;
input	[2:0]	l2b1_rd_bank_adr;
input		l2b1_rd_addr_err;
input		l2b1_rd_addr_par;

// rank, bank, err, and parity for incoming write requests
input		l2b0_wr_rank_adr;
input	[2:0]	l2b0_wr_dimm_adr;
input	[2:0]	l2b0_wr_bank_adr;
input		l2b0_wr_addr_err;
input		l2b0_wr_addr_par;
input		l2b1_wr_rank_adr;
input	[2:0]	l2b1_wr_dimm_adr;
input	[2:0]	l2b1_wr_bank_adr;
input		l2b1_wr_addr_err;
input		l2b1_wr_addr_par;


input		l2if0_rd_req;		// incoming read request
input		l2if0_wr_req;		// incoming write request
input	[2:0]	l2if0_data_wr_addr;	// wdq entry for write request
input		l2if0_wdq_rd_inh;
input	[3:0]	l2if0_wdq_in_cntr;	// incremented by l2if when all data for a write is in wdq

input		l2if1_rd_req;		// incoming read request
input		l2if1_wr_req;		// incoming write request
input	[2:0]	l2if1_data_wr_addr;	// wdq entry for write request
input		l2if1_wdq_rd_inh;
input	[3:0]	l2if1_wdq_in_cntr;	// incremented by l2if when all data for a write is in wdq

// incoming power throttling sync signals from other MCUs
input		mcu_pt_sync_in0;
input		mcu_pt_sync_in1;
input		mcu_pt_sync_in2;

// read-write queue match signals for RAW hazard detection
input		addrdp0_rd_wr_adr0_eq;
input		addrdp0_rd_wr_adr1_eq;
input		addrdp0_rd_wr_adr2_eq;
input		addrdp0_rd_wr_adr3_eq;
input		addrdp0_rd_wr_adr4_eq;
input		addrdp0_rd_wr_adr5_eq;
input		addrdp0_rd_wr_adr6_eq;
input		addrdp0_rd_wr_adr7_eq;
input		addrdp1_rd_wr_adr0_eq;
input		addrdp1_rd_wr_adr1_eq;
input		addrdp1_rd_wr_adr2_eq;
input		addrdp1_rd_wr_adr3_eq;
input		addrdp1_rd_wr_adr4_eq;
input		addrdp1_rd_wr_adr5_eq;
input		addrdp1_rd_wr_adr6_eq;
input		addrdp1_rd_wr_adr7_eq;

input		rdpctl_scrub_read_done;	// resets outstanding scrub flop

// data poison bits from wdqrf's for writedp
input		wdqrf00_data_mecc;
input		wdqrf01_data_mecc;
input		wdqrf10_data_mecc;
input		wdqrf11_data_mecc;

// error fifo data for ecc error transactions
input		rdpctl_err_fifo_enq;
input	[14:0]	rdpctl_err_fifo_data;
input		rdpctl_fifo_empty;
input		rdpctl_fifo_full;
input		rdpctl_no_crc_err;
input		rdpctl_crc_err;

input	[65:0]	fbdic_ucb_rd_data;
input		fbdic_sync_frame_req_early3;
input		fbdic_sync_frame_req_early2;
input		fbdic_sync_frame_req_early1;
input		fbdic_sync_frame_req;
input		fbdic_scr_frame_req_d4;
input		fbdic_l0_state;
input	[1:0]	fbdic_woq_free;
input		fbdic_clear_wrq_ent;
input		fbdic_error_mode;
input		fbdic_l0s_lfsr_stall;
input		fbdic_err_fast_reset_done;
input		fbdic_chnl_reset_error_mode;

input		fbdic_mcu_idle;

input 		drl2clk;
input 		scan_in;
output		scan_out;
input 		wmr_scan_in;
output		wmr_scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		aclk_wmr;
input		tcu_scan_en;
input		wmr_protect;

// Code
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// need to define these wires here so 'always' blocks won't cause errors
wire [7:0] 	drif_precharge_wait;
wire [12:0] 	drif_ref_cnt;
wire [3:0]	drif_last_rank;
wire [7:0]	drif_cyc_cnt;
wire [4:0]	drif_bank_idle_cnt;
wire		drif_mclk_en;

reg [`DRIF_MCU_STATE_MAX:0]	drif_mcu_state_next;
reg [7:0]	drif_cyc_cnt_next;
reg [4:0]	drif_bank_idle_cnt_next;
reg [4:0]	drif_refresh_rank_in;
reg		set_drif_enter_self_refresh;
reg		set_drif_exit_self_refresh;

// 0in set_clock drl2clk -default
mcu_drif_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(drl2clk),
 	.l1en (1'b1 ),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

// Register incoming signals

mcu_drif_ctl_msff_ctl_macro__width_79 ff_ucb_req  (
        .scan_in(ff_ucb_req_scanin),
        .scan_out(ff_ucb_req_scanout),
        .din({rdata_drif_rd_req_vld, rdata_drif_wr_req_vld, rdata_drif_addr[12:0], rdata_drif_data[63:0]}),
        .dout({drif_ucb_rd_req_vld, drif_ucb_wr_req_vld, drif_ucb_addr[12:0], drif_ucb_data[63:0]}),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__width_1    ff_hw_selfref  (
	.scan_in(ff_hw_selfref_scanin),
	.scan_out(ff_hw_selfref_scanout),
	.din(rdata_mcu_selfrsh),
	.dout(drif_hw_selfrsh),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_sync_frame_req_l = ~fbdic_sync_frame_req;
assign fbdic_sync_frame_req_early3_l = ~fbdic_sync_frame_req_early3;
assign fbdic_sync_frame_req_early1_l = ~fbdic_sync_frame_req_early1;

mcu_drif_ctl_msff_ctl_macro__width_3 ff_sync_frame_req_l  (
	.scan_in(ff_sync_frame_req_l_scanin),
	.scan_out(ff_sync_frame_req_l_scanout),
	.din({fbdic_sync_frame_req_l,fbdic_sync_frame_req_early3_l,fbdic_sync_frame_req_early1_l}),
	.dout({drif_sync_frame_req_l,drif_sync_frame_req_early3_l,drif_sync_frame_req_early1_l}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// delay timers for scheduling transactions
//////////////////////////////////////////////////////////////////

mcu_dmmdly_ctl dmmdly0 (
	.scan_in(dmmdly0_scanin),
	.scan_out(dmmdly0_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[0]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[0]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[0]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[0]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[0]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[0]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[0]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[0]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[0]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly1 (
	.scan_in(dmmdly1_scanin),
	.scan_out(dmmdly1_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[1]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[1]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[1]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[1]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[1]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[1]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[1]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[1]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[1]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly2 (
	.scan_in(dmmdly2_scanin),
	.scan_out(dmmdly2_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[2]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[2]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[2]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[2]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[2]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[2]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[2]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[2]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[2]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly3 (
	.scan_in(dmmdly3_scanin),
	.scan_out(dmmdly3_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[3]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[3]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[3]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[3]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[3]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[3]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[3]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[3]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[3]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly4 (
	.scan_in(dmmdly4_scanin),
	.scan_out(dmmdly4_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[4]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[4]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[4]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[4]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[4]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[4]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[4]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[4]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[4]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly5 (
	.scan_in(dmmdly5_scanin),
	.scan_out(dmmdly5_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[5]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[5]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[5]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[5]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[5]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[5]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[5]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[5]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[5]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly6 (
	.scan_in(dmmdly6_scanin),
	.scan_out(dmmdly6_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[6]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[6]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[6]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[6]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[6]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[6]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[6]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[6]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[6]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_dmmdly_ctl dmmdly7 (
	.scan_in(dmmdly7_scanin),
	.scan_out(dmmdly7_scanout),
	.l1clk(l1clk),
	.drif_rd_ras_picked(drif_dmm_rd_ras_picked[7]),
	.drif_wr_ras_picked(drif_dmm_wr_ras_picked[7]),
	.drif_wrbc_ras_picked(drif_dmm_wrbc_ras_picked[7]),
	.rrd_cnt_is_zero(rrd_cnt_is_zero[7]),
	.rtw_cnt_is_zero(rtw_cnt_is_zero[7]),
	.wtr_cnt_is_zero(wtr_cnt_is_zero[7]),
	.rtr_cnt_is_zero(rtr_cnt_is_zero[7]),
	.wtw_cnt_is_zero(wtw_cnt_is_zero[7]),
	.dmmdly_4_activate_stall(dmmdly_4_activate_stall[7]),
  .rrd_reg(rrd_reg[3:0]),
  .rtw_reg(rtw_reg[3:0]),
  .wtr_reg(wtr_reg[3:0]),
  .faw_reg(faw_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Refresh to Active delay timer 
// wait for tRFC count
assign rfc_cnt_next[6:0] = drif_refresh_req_picked & fbdic_sync_frame_req_l ? rfc_reg[6:0] : 
				(rfc_cnt[6:0] == 7'h0) ? 7'h0 : rfc_cnt[6:0] - 7'h1;

mcu_drif_ctl_msff_ctl_macro__width_7 ff_rfc_cnt  (
	.scan_in(ff_rfc_cnt_scanin),
	.scan_out(ff_rfc_cnt_scanout),
	.din(rfc_cnt_next[6:0]),
	.dout(rfc_cnt[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rfc_cnt_is_zero = (rfc_cnt[6:0] == 7'h0);

// RAS-to-RAS delay counter for all reads so data doesn't collide on NB channel
assign rd_rrd_cnt_next[1:0] = (drif0_rd_picked & ~drif0_raw_hazard | drif1_rd_picked & ~drif1_raw_hazard | 
					drif_scrub_picked | drif_err_rd_picked) & rd_rrd_cnt_is_zero ? {drif_single_channel_mode, 1'b1} : 
					rd_rrd_cnt[1:0] == 2'h0 ? 2'h0 : 
					fbdic_sync_frame_req_l ? rd_rrd_cnt[1:0] - 2'h1 : rd_rrd_cnt[1:0];

mcu_drif_ctl_msff_ctl_macro__width_2	ff_rd_rrd_cnt  (
        .scan_in(ff_rd_rrd_cnt_scanin),
        .scan_out(ff_rd_rrd_cnt_scanout),
        .din(rd_rrd_cnt_next[1:0]),
        .dout(rd_rrd_cnt[1:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rd_rrd_cnt_is_zero = rd_rrd_cnt[1:0] == 2'h0;

//////////////////////////////////////////////////////////////////
// DRAM BANK delay timers
// There is one set of timers for each DRAM bank. They keep track of the 
// commands issued to them and generate appropriate signals to 
// DRAM state machine.
//////////////////////////////////////////////////////////////////

mcu_bnksm_ctl bnksm0 (
	.scan_in(bnksm0_scanin),
	.scan_out(bnksm0_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[0]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[0]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[0]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[0]),
	.rcd_cnt_is_zero(b0_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b0_rc_cnt_is_zero),
	.dal_cnt_is_zero(b0_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm1 (
	.scan_in(bnksm1_scanin),
	.scan_out(bnksm1_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[1]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[1]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[1]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[1]),
	.rcd_cnt_is_zero(b1_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b1_rc_cnt_is_zero),
	.dal_cnt_is_zero(b1_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm2 (
	.scan_in(bnksm2_scanin),
	.scan_out(bnksm2_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[2]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[2]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[2]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[2]),
	.rcd_cnt_is_zero(b2_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b2_rc_cnt_is_zero),
	.dal_cnt_is_zero(b2_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm3 (
	.scan_in(bnksm3_scanin),
	.scan_out(bnksm3_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[3]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[3]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[3]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[3]),
	.rcd_cnt_is_zero(b3_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b3_rc_cnt_is_zero),
	.dal_cnt_is_zero(b3_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm4 (
	.scan_in(bnksm4_scanin),
	.scan_out(bnksm4_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[4]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[4]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[4]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[4]),
	.rcd_cnt_is_zero(b4_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b4_rc_cnt_is_zero),
	.dal_cnt_is_zero(b4_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm5 (
	.scan_in(bnksm5_scanin),
	.scan_out(bnksm5_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[5]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[5]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[5]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[5]),
	.rcd_cnt_is_zero(b5_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b5_rc_cnt_is_zero),
	.dal_cnt_is_zero(b5_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm6 (
	.scan_in(bnksm6_scanin),
	.scan_out(bnksm6_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[6]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[6]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[6]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[6]),
	.rcd_cnt_is_zero(b6_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b6_rc_cnt_is_zero),
	.dal_cnt_is_zero(b6_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm7 (
	.scan_in(bnksm7_scanin),
	.scan_out(bnksm7_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[7]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[7]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[7]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[7]),
	.rcd_cnt_is_zero(b7_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b7_rc_cnt_is_zero),
	.dal_cnt_is_zero(b7_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm8 (
	.scan_in(bnksm8_scanin),
	.scan_out(bnksm8_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[8]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[8]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[8]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[8]),
	.rcd_cnt_is_zero(b8_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b8_rc_cnt_is_zero),
	.dal_cnt_is_zero(b8_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm9 (
	.scan_in(bnksm9_scanin),
	.scan_out(bnksm9_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[9]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[9]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[9]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[9]),
	.rcd_cnt_is_zero(b9_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b9_rc_cnt_is_zero),
	.dal_cnt_is_zero(b9_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm10 (
	.scan_in(bnksm10_scanin),
	.scan_out(bnksm10_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[10]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[10]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[10]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[10]),
	.rcd_cnt_is_zero(b10_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b10_rc_cnt_is_zero),
	.dal_cnt_is_zero(b10_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm11 (
	.scan_in(bnksm11_scanin),
	.scan_out(bnksm11_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[11]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[11]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[11]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[11]),
	.rcd_cnt_is_zero(b11_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b11_rc_cnt_is_zero),
	.dal_cnt_is_zero(b11_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm12 (
	.scan_in(bnksm12_scanin),
	.scan_out(bnksm12_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[12]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[12]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[12]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[12]),
	.rcd_cnt_is_zero(b12_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b12_rc_cnt_is_zero),
	.dal_cnt_is_zero(b12_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm13 (
	.scan_in(bnksm13_scanin),
	.scan_out(bnksm13_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[13]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[13]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[13]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[13]),
	.rcd_cnt_is_zero(b13_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b13_rc_cnt_is_zero),
	.dal_cnt_is_zero(b13_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm14 (
	.scan_in(bnksm14_scanin),
	.scan_out(bnksm14_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[14]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[14]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[14]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[14]),
	.rcd_cnt_is_zero(b14_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b14_rc_cnt_is_zero),
	.dal_cnt_is_zero(b14_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_bnksm_ctl bnksm15 (
	.scan_in(bnksm15_scanin),
	.scan_out(bnksm15_scanout),
	.l1clk(l1clk),
	.drif_abnk_ras_picked(drif_abnk_ras_picked[15]),
	.drif_abnk_cas_picked(drif_abnk_cas_picked[15]),
	.drif_bcbnk_ras_picked(drif_bcbnk_ras_picked[15]),
	.drif_bcbnk_cas_picked(drif_bcbnk_cas_picked[15]),
	.rcd_cnt_is_zero(b15_rcd_cnt_is_zero),
	.rc_cnt_is_zero(b15_rc_cnt_is_zero),
	.dal_cnt_is_zero(b15_dal_cnt_is_zero),
  .drif_cmd_picked_d1(drif_cmd_picked_d1),
  .rcd_reg(rcd_reg[3:0]),
  .rc_reg(rc_reg[4:0]),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .fbdic_sync_frame_req_l(fbdic_sync_frame_req_l),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

//////////////////////////////////////////////////////////////////
// Performing ARBITRATION for RAS and CAS reqeust based on previous 
// valids generated
//////////////////////////////////////////////////////////////////

assign drif0_rd_bank_valids[15:0] = drq0_rd_entry0_val[15:0] | drq0_rd_entry1_val[15:0] |
                                drq0_rd_entry2_val[15:0] | drq0_rd_entry3_val[15:0] |
                                drq0_rd_entry4_val[15:0] | drq0_rd_entry5_val[15:0] |
                                drq0_rd_entry6_val[15:0] | drq0_rd_entry7_val[15:0];

assign drif1_rd_bank_valids[15:0] = drq1_rd_entry0_val[15:0] | drq1_rd_entry1_val[15:0] |
                                drq1_rd_entry2_val[15:0] | drq1_rd_entry3_val[15:0] |
                                drq1_rd_entry4_val[15:0] | drq1_rd_entry5_val[15:0] |
                                drq1_rd_entry6_val[15:0] | drq1_rd_entry7_val[15:0];

assign drif_wr_bank_valids[15:0] = woq_entry0_val[15:0] | woq_entry1_val[15:0];

assign drif_bank_available[15] = b15_rc_cnt_is_zero & b15_dal_cnt_is_zero;
assign drif_bank_available[14] = b14_rc_cnt_is_zero & b14_dal_cnt_is_zero;
assign drif_bank_available[13] = b13_rc_cnt_is_zero & b13_dal_cnt_is_zero;
assign drif_bank_available[12] = b12_rc_cnt_is_zero & b12_dal_cnt_is_zero;
assign drif_bank_available[11] = b11_rc_cnt_is_zero & b11_dal_cnt_is_zero;
assign drif_bank_available[10] = b10_rc_cnt_is_zero & b10_dal_cnt_is_zero;
assign drif_bank_available[9] = b9_rc_cnt_is_zero & b9_dal_cnt_is_zero;
assign drif_bank_available[8] = b8_rc_cnt_is_zero & b8_dal_cnt_is_zero;
assign drif_bank_available[7] = b7_rc_cnt_is_zero & b7_dal_cnt_is_zero;
assign drif_bank_available[6] = b6_rc_cnt_is_zero & b6_dal_cnt_is_zero;
assign drif_bank_available[5] = b5_rc_cnt_is_zero & b5_dal_cnt_is_zero;
assign drif_bank_available[4] = b4_rc_cnt_is_zero & b4_dal_cnt_is_zero;
assign drif_bank_available[3] = b3_rc_cnt_is_zero & b3_dal_cnt_is_zero;
assign drif_bank_available[2] = b2_rc_cnt_is_zero & b2_dal_cnt_is_zero;
assign drif_bank_available[1] = b1_rc_cnt_is_zero & b1_dal_cnt_is_zero;
assign drif_bank_available[0] = b0_rc_cnt_is_zero & b0_dal_cnt_is_zero;

assign drif_dimm_rd_available[7] = rtr_cnt_is_zero[7] & wtr_cnt_is_zero[7] & rrd_cnt_is_zero[7] & ~dmmdly_4_activate_stall[7];
assign drif_dimm_rd_available[6] = rtr_cnt_is_zero[6] & wtr_cnt_is_zero[6] & rrd_cnt_is_zero[6] & ~dmmdly_4_activate_stall[6];
assign drif_dimm_rd_available[5] = rtr_cnt_is_zero[5] & wtr_cnt_is_zero[5] & rrd_cnt_is_zero[5] & ~dmmdly_4_activate_stall[5];
assign drif_dimm_rd_available[4] = rtr_cnt_is_zero[4] & wtr_cnt_is_zero[4] & rrd_cnt_is_zero[4] & ~dmmdly_4_activate_stall[4];
assign drif_dimm_rd_available[3] = rtr_cnt_is_zero[3] & wtr_cnt_is_zero[3] & rrd_cnt_is_zero[3] & ~dmmdly_4_activate_stall[3];
assign drif_dimm_rd_available[2] = rtr_cnt_is_zero[2] & wtr_cnt_is_zero[2] & rrd_cnt_is_zero[2] & ~dmmdly_4_activate_stall[2];
assign drif_dimm_rd_available[1] = rtr_cnt_is_zero[1] & wtr_cnt_is_zero[1] & rrd_cnt_is_zero[1] & ~dmmdly_4_activate_stall[1];
assign drif_dimm_rd_available[0] = rtr_cnt_is_zero[0] & wtr_cnt_is_zero[0] & rrd_cnt_is_zero[0] & ~dmmdly_4_activate_stall[0];

assign drif_dimm_wr_available[7] = rtw_cnt_is_zero[7] & wtw_cnt_is_zero[7] & rrd_cnt_is_zero[7] & ~dmmdly_4_activate_stall[7];
assign drif_dimm_wr_available[6] = rtw_cnt_is_zero[6] & wtw_cnt_is_zero[6] & rrd_cnt_is_zero[6] & ~dmmdly_4_activate_stall[6];
assign drif_dimm_wr_available[5] = rtw_cnt_is_zero[5] & wtw_cnt_is_zero[5] & rrd_cnt_is_zero[5] & ~dmmdly_4_activate_stall[5];
assign drif_dimm_wr_available[4] = rtw_cnt_is_zero[4] & wtw_cnt_is_zero[4] & rrd_cnt_is_zero[4] & ~dmmdly_4_activate_stall[4];
assign drif_dimm_wr_available[3] = rtw_cnt_is_zero[3] & wtw_cnt_is_zero[3] & rrd_cnt_is_zero[3] & ~dmmdly_4_activate_stall[3];
assign drif_dimm_wr_available[2] = rtw_cnt_is_zero[2] & wtw_cnt_is_zero[2] & rrd_cnt_is_zero[2] & ~dmmdly_4_activate_stall[2];
assign drif_dimm_wr_available[1] = rtw_cnt_is_zero[1] & wtw_cnt_is_zero[1] & rrd_cnt_is_zero[1] & ~dmmdly_4_activate_stall[1];
assign drif_dimm_wr_available[0] = rtw_cnt_is_zero[0] & wtw_cnt_is_zero[0] & rrd_cnt_is_zero[0] & ~dmmdly_4_activate_stall[0];

// determine which reads are ready for issuing
assign drif0_rd_ready = |(drif_bank_available[15:0] & drif0_rd_bank_valids[15:0]);
assign drif1_rd_ready = |(drif_bank_available[15:0] & drif1_rd_bank_valids[15:0]);
assign drif_rd_ready = drif0_rd_ready | drif1_rd_ready;
assign drif_rd_pending = |(drif_bank_available[15:0] & drq0_rd_bank_val[15:0]) |
				(|(drif_bank_available[15:0] & drq1_rd_bank_val[15:0]));

assign drif_rd_stall = drif_blk_new_openbank | drif_mcu_error_mode | ~rd_rrd_cnt_is_zero | ~drif_err_fifo_empty |
			drif_wr_pending & drif_pick_wr_first | drif_wr_entry_pend | drif_scrub_ready | 
			~(fbdic_l0_state | fbdic_chnl_reset_error_mode) | drif_cas_picked | fbdic_sync_frame_req | 
			fbdic_l0s_lfsr_stall | fbdic_error_mode | woq_wr_error_mode | drif_mcu_state[3] |
			rdpctl_fifo_full;

assign drif0_rd_entry_ready[0] = |(drif_bank_available[15:0] & drq0_rd_entry0_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry0_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry0_rank,drq0_rd_entry0_dimm[2:0]});
assign drif0_rd_entry_ready[1] = |(drif_bank_available[15:0] & drq0_rd_entry1_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry1_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry1_rank,drq0_rd_entry1_dimm[2:0]});
assign drif0_rd_entry_ready[2] = |(drif_bank_available[15:0] & drq0_rd_entry2_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry2_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry2_rank,drq0_rd_entry2_dimm[2:0]});
assign drif0_rd_entry_ready[3] = |(drif_bank_available[15:0] & drq0_rd_entry3_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry3_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry3_rank,drq0_rd_entry3_dimm[2:0]});
assign drif0_rd_entry_ready[4] = |(drif_bank_available[15:0] & drq0_rd_entry4_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry4_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry4_rank,drq0_rd_entry4_dimm[2:0]});
assign drif0_rd_entry_ready[5] = |(drif_bank_available[15:0] & drq0_rd_entry5_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry5_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry5_rank,drq0_rd_entry5_dimm[2:0]});
assign drif0_rd_entry_ready[6] = |(drif_bank_available[15:0] & drq0_rd_entry6_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry6_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry6_rank,drq0_rd_entry6_dimm[2:0]});
assign drif0_rd_entry_ready[7] = |(drif_bank_available[15:0] & drq0_rd_entry7_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq0_rd_entry7_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq0_rd_entry7_rank,drq0_rd_entry7_dimm[2:0]});

assign drif1_rd_entry_ready[0] = |(drif_bank_available[15:0] & drq1_rd_entry0_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry0_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry0_rank,drq1_rd_entry0_dimm[2:0]});
assign drif1_rd_entry_ready[1] = |(drif_bank_available[15:0] & drq1_rd_entry1_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry1_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry1_rank,drq1_rd_entry1_dimm[2:0]});
assign drif1_rd_entry_ready[2] = |(drif_bank_available[15:0] & drq1_rd_entry2_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry2_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry2_rank,drq1_rd_entry2_dimm[2:0]});
assign drif1_rd_entry_ready[3] = |(drif_bank_available[15:0] & drq1_rd_entry3_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry3_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry3_rank,drq1_rd_entry3_dimm[2:0]});
assign drif1_rd_entry_ready[4] = |(drif_bank_available[15:0] & drq1_rd_entry4_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry4_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry4_rank,drq1_rd_entry4_dimm[2:0]});
assign drif1_rd_entry_ready[5] = |(drif_bank_available[15:0] & drq1_rd_entry5_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry5_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry5_rank,drq1_rd_entry5_dimm[2:0]});
assign drif1_rd_entry_ready[6] = |(drif_bank_available[15:0] & drq1_rd_entry6_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry6_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry6_rank,drq1_rd_entry6_dimm[2:0]});
assign drif1_rd_entry_ready[7] = |(drif_bank_available[15:0] & drq1_rd_entry7_val[15:0]) & ~drif_rd_stall &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drq1_rd_entry7_dimm[2:0] |
					drif_last_rank_picked[3:0] == {drq1_rd_entry7_rank,drq1_rd_entry7_dimm[2:0]});

// determine which writes are ready for issuing
assign drif_wr_ready = |(drif_bank_available[15:0] & drif_wr_bank_valids[15:0]);
assign drif_wr_pending = |(drif_bank_available[15:0] & woq_wr_bank_val[15:0]);

assign drif_wr_stall = (drif_rd_pending & ~drif_pick_wr_first & ~drif_wr_entry_pend & drif_err_fifo_empty &
				~woq_wr_error_mode) | 
			drif_scrub_ready | ~(fbdic_l0_state | fbdic_chnl_reset_error_mode) | fbdic_sync_frame_req | 
			drif_cas_picked | drif_blk_new_openbank | fbdic_l0s_lfsr_stall | fbdic_error_mode;

assign drif_wr_entry_ready[0] = |(drif_bank_available[15:0] & woq_entry0_val[15:0]) & ~drif_wr_stall &
				(~drif_rank_wait | drif_last_rank_picked[3:0] == woq_entry0[6:3]);

assign drif_wr_entry_ready[1] = ~drif_wr_entry_ready[0] & |(drif_bank_available[15:0] & woq_entry0_val[15:0]) & 
				(~drif_rank_wait | drif_last_rank_picked[3:0] == woq_entry0[6:3]) & 
				~(woq0_wdq_rd | woq1_wdq_rd | drif_wdq_sel | drif_wdq_sel_d1) & 
				~drif_blk_new_openbank & ~drif_cmd_b_val & drif_err_fifo_empty &
				~drif_pd_mode_pending & ~fbdic_error_mode & ~drif_mcu_state[2] & ~woq_wr_error_mode;
assign drif_wr_entry_ready[2] = |(drif_bank_available[15:0] & woq_entry1_val[15:0]) &
				(~drif_rank_wait | drif_last_rank_picked[3:0] == woq_entry1[6:3]) & 
				drif_wr_entry_ready[1] & (woq_entry0[5:3] != woq_entry1[5:3]);

// pick a read or a write to issue based on first-come-first-served policy
assign drif0_rd_entry_picked_in[0] = (~drif1_rd_ready | ~drif_entry_priority) & drif0_rd_entry_ready[0];
assign drif0_rd_entry_picked_in[1] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[1:0] == 2'h2);
assign drif0_rd_entry_picked_in[2] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[2:0] == 3'h4);
assign drif0_rd_entry_picked_in[3] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[3:0] == 4'h8);
assign drif0_rd_entry_picked_in[4] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[4:0] == 5'h10);
assign drif0_rd_entry_picked_in[5] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[5:0] == 6'h20);
assign drif0_rd_entry_picked_in[6] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[6:0] == 7'h40);
assign drif0_rd_entry_picked_in[7] = (~drif1_rd_ready | ~drif_entry_priority) & (drif0_rd_entry_ready[7:0] == 8'h80);

assign drif1_rd_entry_picked_in[0] = (~drif0_rd_ready | drif_entry_priority) & drif1_rd_entry_ready[0];
assign drif1_rd_entry_picked_in[1] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[1:0] == 2'h2);
assign drif1_rd_entry_picked_in[2] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[2:0] == 3'h4);
assign drif1_rd_entry_picked_in[3] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[3:0] == 4'h8);
assign drif1_rd_entry_picked_in[4] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[4:0] == 5'h10);
assign drif1_rd_entry_picked_in[5] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[5:0] == 6'h20);
assign drif1_rd_entry_picked_in[6] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[6:0] == 7'h40);
assign drif1_rd_entry_picked_in[7] = (~drif0_rd_ready | drif_entry_priority) & (drif1_rd_entry_ready[7:0] == 8'h80);

assign drif0_rd_entry_picked[7:0] = drif0_rd_entry_picked_in[7:0] & {8{~drif_scrub_picked & drif_sync_frame_req_l}};
assign drif1_rd_entry_picked[7:0] = drif1_rd_entry_picked_in[7:0] & {8{~drif_scrub_picked & drif_sync_frame_req_l}};
assign drif0_rd_picked = |drif0_rd_entry_picked[7:0];
assign drif1_rd_picked = |drif1_rd_entry_picked[7:0];

assign drif_wr_entry_picked[0] = drif_wr_entry_ready[0] & fbdic_sync_frame_req_l & drif_sync_frame_req_l & 
					~drif_scrub_picked;
assign drif_wr_entry_picked[1] = drif_wr_entry_ready[1] & fbdic_sync_frame_req_l & drif_sync_frame_req_l & 
					~drif_scrub_picked & ~drif_rd_picked & ~fbdic_sync_frame_req_early2 &
					~fbdic_sync_frame_req_early1;
assign drif_wr_entry_picked[2] = drif_wr_entry_ready[2] & fbdic_sync_frame_req_l & drif_sync_frame_req_l & 
					~drif_scrub_picked & ~drif_rd_picked & ~fbdic_sync_frame_req_early2 &
					~fbdic_sync_frame_req_early1;
assign drif0_wr_picked = drif_wr_entry_picked[0] & ~woq_entry0[15];
assign drif1_wr_picked = drif_wr_entry_picked[0] & woq_entry0[15];
assign drif0_wr1_picked = drif_wr_entry_picked[1] & ~woq_entry0[15];
assign drif1_wr1_picked = drif_wr_entry_picked[1] & woq_entry0[15];
assign drif0_wr2_picked = drif_wr_entry_picked[2] & ~woq_entry1[15];
assign drif1_wr2_picked = drif_wr_entry_picked[2] & woq_entry1[15];

assign drif_rascas_adr_sel[1:0] = 
	(drif0_wr_picked | drif0_rd_picked | (drif0_err_rd_picked | drif0_err_wr_picked) & ~drif_err_fifo_scrub) ? 2'h1 : 2'h2;
assign drif_rascas_wr1_adr_sel[1:0] = drif0_wr1_picked ? 2'h1 : 2'h2;
assign drif_rascas_wr2_adr_sel[1:0] = drif0_wr2_picked ? 2'h1 : 2'h2;

// round robin priority between l2_0 and l2_1 banks
assign drif_entry_priority_in = drif0_rd_picked & ~drif0_raw_hazard ? 1'b1 : 
				drif1_rd_picked & ~drif1_raw_hazard ? 1'b0 : drif_entry_priority;

mcu_drif_ctl_msff_ctl_macro ff_entry_priority (
	.scan_in(ff_entry_priority_scanin),
	.scan_out(ff_entry_priority_scanout),
	.din(drif_entry_priority_in),
	.dout(drif_entry_priority),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// determine which bank the selected transaction is going to and ensure there is no RAW hazard
assign drif_abnk_ras_picked[0] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h0) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h0) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h0) |
				drif_scrub_picked & drif_scrub_entry_val[0] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[0];
assign drif_abnk_ras_picked[1] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h1) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h1) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h1) |
				drif_scrub_picked & drif_scrub_entry_val[1] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[1];
assign drif_abnk_ras_picked[2] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h2) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h2) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h2) |
				drif_scrub_picked & drif_scrub_entry_val[2] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[2];
assign drif_abnk_ras_picked[3] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h3) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h3) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h3) |
				drif_scrub_picked & drif_scrub_entry_val[3] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[3];
assign drif_abnk_ras_picked[4] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h4) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h4) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h4) |
				drif_scrub_picked & drif_scrub_entry_val[4] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[4];
assign drif_abnk_ras_picked[5] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h5) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h5) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h5) |
				drif_scrub_picked & drif_scrub_entry_val[5] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[5];
assign drif_abnk_ras_picked[6] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h6) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h6) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h6) |
				drif_scrub_picked & drif_scrub_entry_val[6] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[6];
assign drif_abnk_ras_picked[7] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h7) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h7) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h7) |
				drif_scrub_picked & drif_scrub_entry_val[7] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[7];
assign drif_abnk_ras_picked[8] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h8) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h8) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h8) |
				drif_scrub_picked & drif_scrub_entry_val[8] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[8] ;
assign drif_abnk_ras_picked[9] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'h9) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'h9) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'h9) |
				drif_scrub_picked & drif_scrub_entry_val[9] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[9];
assign drif_abnk_ras_picked[10] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'ha) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'ha) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'ha) |
				drif_scrub_picked & drif_scrub_entry_val[10] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[10];
assign drif_abnk_ras_picked[11] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'hb) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'hb) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'hb) |
				drif_scrub_picked & drif_scrub_entry_val[11] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[11];
assign drif_abnk_ras_picked[12] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'hc) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'hc) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'hc) |
				drif_scrub_picked & drif_scrub_entry_val[12] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[12];
assign drif_abnk_ras_picked[13] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'hd) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'hd) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'hd) |
				drif_scrub_picked & drif_scrub_entry_val[13] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[13];
assign drif_abnk_ras_picked[14] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'he) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'he) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'he) |
				drif_scrub_picked & drif_scrub_entry_val[14] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[14];
assign drif_abnk_ras_picked[15] = drif0_rd_picked & (drq0_rd_addr_picked[3:0] == 4'hf) |
				drif1_rd_picked & (drq1_rd_addr_picked[3:0] == 4'hf) | 
				drif_wr_picked & (woq_wr_addr_picked[3:0] == 4'hf) |
				drif_scrub_picked & drif_scrub_entry_val[15] |
				(drif_err_rd_picked | drif_err_wr_picked) & drif_err_entry_val[15];
assign drif_bcbnk_ras_picked[0] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h0) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h0);
assign drif_bcbnk_ras_picked[1] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h1) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h1);
assign drif_bcbnk_ras_picked[2] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h2) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h2);
assign drif_bcbnk_ras_picked[3] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h3) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h3);
assign drif_bcbnk_ras_picked[4] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h4) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h4);
assign drif_bcbnk_ras_picked[5] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h5) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h5);
assign drif_bcbnk_ras_picked[6] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h6) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h6);
assign drif_bcbnk_ras_picked[7] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h7) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h7);
assign drif_bcbnk_ras_picked[8] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h8) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h8);
assign drif_bcbnk_ras_picked[9] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'h9) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'h9);
assign drif_bcbnk_ras_picked[10] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'ha) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'ha);
assign drif_bcbnk_ras_picked[11] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'hb) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'hb);
assign drif_bcbnk_ras_picked[12] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'hc) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'hc);
assign drif_bcbnk_ras_picked[13] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'hd) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'hd);
assign drif_bcbnk_ras_picked[14] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'he) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'he);
assign drif_bcbnk_ras_picked[15] = drif_wr1_picked & (woq_wr1_addr_picked[3:0] == 4'hf) |
				drif_wr2_picked & (woq_wr2_addr_picked[3:0] == 4'hf);

// cas_picked is ras_picked_d1 since using posted-cas
mcu_drif_ctl_msff_ctl_macro__en_1__width_16 ff_cas_abnk_picked  (
	.scan_in(ff_cas_abnk_picked_scanin),
	.scan_out(ff_cas_abnk_picked_scanout),
	.din(drif_abnk_ras_picked[15:0]),
	.dout(drif_abnk_cas_picked[15:0]),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_16   ff_cas_bcbnk_picked  (
	.scan_in(ff_cas_bcbnk_picked_scanin),
	.scan_out(ff_cas_bcbnk_picked_scanout),
	.din(drif_bcbnk_ras_picked[15:0]),
	.dout(drif_bcbnk_cas_picked[15:0]),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_bnk_ras_picked[15:0] = drif_abnk_ras_picked[15:0] | drif_bcbnk_ras_picked[15:0];
assign drif_bnk_cas_picked[15:0] = drif_abnk_cas_picked[15:0] | drif_bcbnk_cas_picked[15:0];
assign drif_cas_picked = |drif_bnk_cas_picked[15:0];
assign drif_any_ras_picked = |drif_ras_picked[15:0];

assign drif_dmm_rd_ras_picked[0] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h0) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h0) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h0) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h0);
assign drif_dmm_wr_ras_picked[0] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h0) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h0);
assign drif_dmm_wrbc_ras_picked[0] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h0) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h0);

assign drif_dmm_rd_ras_picked[1] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h1) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h1) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h1) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h1);
assign drif_dmm_wr_ras_picked[1] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h1) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h1);
assign drif_dmm_wrbc_ras_picked[1] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h1) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h1);

assign drif_dmm_rd_ras_picked[2] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h2) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h2) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h2) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h2);
assign drif_dmm_wr_ras_picked[2] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h2) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h2);
assign drif_dmm_wrbc_ras_picked[2] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h2) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h2);

assign drif_dmm_rd_ras_picked[3] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h3) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h3) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h3) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h3);
assign drif_dmm_wr_ras_picked[3] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h3) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h3);
assign drif_dmm_wrbc_ras_picked[3] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h3) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h3);

assign drif_dmm_rd_ras_picked[4] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h4) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h4) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h4) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h4);
assign drif_dmm_wr_ras_picked[4] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h4) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h4);
assign drif_dmm_wrbc_ras_picked[4] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h4) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h4);

assign drif_dmm_rd_ras_picked[5] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h5) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h5) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h5) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h5);
assign drif_dmm_wr_ras_picked[5] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h5) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h5);
assign drif_dmm_wrbc_ras_picked[5] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h5) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h5);

assign drif_dmm_rd_ras_picked[6] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h6) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h6) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h6) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h6);
assign drif_dmm_wr_ras_picked[6] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h6) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h6);
assign drif_dmm_wrbc_ras_picked[6] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h6) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h6);

assign drif_dmm_rd_ras_picked[7] = drif0_rd_picked & (drq0_rd_addr_picked[6:4] == 3'h7) |
				drif1_rd_picked & (drq1_rd_addr_picked[6:4] == 3'h7) | 
				drif_scrub_picked & (drif_scrub_dimm_adr[2:0] == 3'h7) |
				drif_err_rd_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h7);
assign drif_dmm_wr_ras_picked[7] = drif_wr_picked & (woq_wr_addr_picked[6:4] == 3'h7) |
				drif_err_wr_picked & (drif_err_fifo_dimm_adr[2:0] == 3'h7);
assign drif_dmm_wrbc_ras_picked[7] = drif_wr1_picked & (woq_wr1_addr_picked[6:4] == 3'h7) |
				drif_wr2_picked & (woq_wr2_addr_picked[6:4] == 3'h7);

// Last rank picked is kept track of here
// It is used to insert a dead cycle if successive transaction goes to 
// opposite rank of last dimm picked
assign drif_last_rank_picked_en = |drif_ras_picked[15:0];
assign drif_phy_bank_picked[3:0] = drif_last_rank_picked[3:0];
assign drif_phy_bank_picked_en = drif_last_rank_picked_en;
mcu_drif_ctl_msff_ctl_macro__en_1__width_4 ff_rank_dimm_picked  (
	.scan_in(ff_rank_dimm_picked_scanin),
	.scan_out(ff_rank_dimm_picked_scanout),
	.din({drif_rank_adr,drif_dimm_adr[2:0]}),
	.dout(drif_last_rank_picked[3:0]),
	.en(drif_last_rank_picked_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ras_picked_d2_in = drif_cas_picked;

mcu_drif_ctl_msff_ctl_macro__width_3 ff_ras_picked_d2  (
	.scan_in(ff_ras_picked_d2_scanin),
	.scan_out(ff_ras_picked_d2_scanout),
	.din({drif_ras_picked_d2_in,drif_ras_picked_d2,drif_ras_picked_d3}),
	.dout({drif_ras_picked_d2,drif_ras_picked_d3,drif_ras_picked_d4}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_rank_wait = drif_single_channel_mode ? drif_ras_picked_d4 : drif_ras_picked_d2;

//////////////////////////////////////////////////////////////////
// Generate signals necessary for Muxing RAS and CAS address - RAS PICKED
//	Error transaction has priority, then scrub, then l2$ transaction
//////////////////////////////////////////////////////////////////

assign drif_scrub_entry_val[15:0] = drif_scrub_bank_valid[15:0] & 
		{16{(((drif_refresh_rank[3:0] != {drif_scrub_rank_adr,drif_scrub_dimm_adr[2:0]}) &
				(drif_mcu_state[2] | drif_mcu_state[4]) & ~drif_init) | drif_mcu_state[1])}}; 

assign drif_ras_picked[15:0] = drif_abnk_ras_picked[15:0] | drif_bcbnk_ras_picked[15:0];

assign drif_scrub_ready = |(drif_bank_available[15:0] & drif_scrub_entry_val[15:0]) & (|drif_scrub_rank_avail[15:0]) &
				~drif_blk_new_openbank & drif_err_fifo_empty & drif_err_fifo_empty_d1 & 
				~drif_4_activate_stall_scrub & fbdic_sync_frame_req_l & ~drif_cas_picked &
				~fbdic_l0s_lfsr_stall & ~rdpctl_fifo_full & ~fbdic_error_mode & ~rdpctl_kp_lnk_up;

assign rtr_cnt_is_zero_scrub = drif_scrub_dimm_adr[2:0] == 3'h0 & rtr_cnt_is_zero[0] |
				drif_scrub_dimm_adr[2:0] == 3'h1 & rtr_cnt_is_zero[1] |
				drif_scrub_dimm_adr[2:0] == 3'h2 & rtr_cnt_is_zero[2] |
				drif_scrub_dimm_adr[2:0] == 3'h3 & rtr_cnt_is_zero[3] |
				drif_scrub_dimm_adr[2:0] == 3'h4 & rtr_cnt_is_zero[4] |
				drif_scrub_dimm_adr[2:0] == 3'h5 & rtr_cnt_is_zero[5] |
				drif_scrub_dimm_adr[2:0] == 3'h6 & rtr_cnt_is_zero[6] |
				drif_scrub_dimm_adr[2:0] == 3'h7 & rtr_cnt_is_zero[7];
				

assign wtr_cnt_is_zero_scrub = drif_scrub_dimm_adr[2:0] == 3'h0 & wtr_cnt_is_zero[0] |
				drif_scrub_dimm_adr[2:0] == 3'h1 & wtr_cnt_is_zero[1] |
				drif_scrub_dimm_adr[2:0] == 3'h2 & wtr_cnt_is_zero[2] |
				drif_scrub_dimm_adr[2:0] == 3'h3 & wtr_cnt_is_zero[3] |
				drif_scrub_dimm_adr[2:0] == 3'h4 & wtr_cnt_is_zero[4] |
				drif_scrub_dimm_adr[2:0] == 3'h5 & wtr_cnt_is_zero[5] |
				drif_scrub_dimm_adr[2:0] == 3'h6 & wtr_cnt_is_zero[6] |
				drif_scrub_dimm_adr[2:0] == 3'h7 & wtr_cnt_is_zero[7];

assign drif_4_activate_stall_scrub = drif_scrub_dimm_adr[2:0] == 3'h0 & dmmdly_4_activate_stall[0] |
				drif_scrub_dimm_adr[2:0] == 3'h1 & dmmdly_4_activate_stall[1] |
				drif_scrub_dimm_adr[2:0] == 3'h2 & dmmdly_4_activate_stall[2] |
				drif_scrub_dimm_adr[2:0] == 3'h3 & dmmdly_4_activate_stall[3] |
				drif_scrub_dimm_adr[2:0] == 3'h4 & dmmdly_4_activate_stall[4] |
				drif_scrub_dimm_adr[2:0] == 3'h5 & dmmdly_4_activate_stall[5] |
				drif_scrub_dimm_adr[2:0] == 3'h6 & dmmdly_4_activate_stall[6] |
				drif_scrub_dimm_adr[2:0] == 3'h7 & dmmdly_4_activate_stall[7];

assign drif_scrub_picked = drif_scrub_ready & rtr_cnt_is_zero_scrub & wtr_cnt_is_zero_scrub & rd_rrd_cnt_is_zero &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drif_scrub_dimm_adr[2:0] |
				 drif_last_rank_picked[3:0] == {drif_scrub_rank_adr,drif_scrub_dimm_adr[2:0]});

assign drif_rd_picked = drif0_rd_picked | drif1_rd_picked;
assign drif_wr_picked = drif0_wr_picked | drif1_wr_picked;
assign drif_wr1_picked = drif0_wr1_picked | drif1_wr1_picked;
assign drif_wr2_picked = drif0_wr2_picked | drif1_wr2_picked;

assign drif_rd_addr_picked[8:0] = (|drif0_rd_entry_picked[7:0]) ? {drq0_rd_addr_picked[9:4],drq0_rd_addr_picked[2:0]} : 
								  {drq1_rd_addr_picked[9:4],drq1_rd_addr_picked[2:0]};
assign drif_rd_index_picked[2:0] = (|drif0_rd_entry_picked[7:0]) ? drq0_rd_index_picked[2:0] : drq1_rd_index_picked[2:0];

// Check for RAW hazards

// matches between picked read and all valid writes
assign drif0_raw_match_in[7:0] = drq0_pending_wr_req[7:0] & {addrdp0_rd_wr_adr7_eq,addrdp0_rd_wr_adr6_eq,
				addrdp0_rd_wr_adr5_eq, addrdp0_rd_wr_adr4_eq,
				addrdp0_rd_wr_adr3_eq, addrdp0_rd_wr_adr2_eq,
				addrdp0_rd_wr_adr1_eq, addrdp0_rd_wr_adr0_eq};

assign drif1_raw_match_in[7:0] = drq1_pending_wr_req[7:0] & {addrdp1_rd_wr_adr7_eq,addrdp1_rd_wr_adr6_eq,
				addrdp1_rd_wr_adr5_eq, addrdp1_rd_wr_adr4_eq,
				addrdp1_rd_wr_adr3_eq, addrdp1_rd_wr_adr2_eq,
				addrdp1_rd_wr_adr1_eq, addrdp1_rd_wr_adr0_eq};

assign drif0_raw_hazard = |drif0_raw_match_in[7:0];
assign drif1_raw_hazard = |drif1_raw_match_in[7:0];

// if there is a RAW hazard, give priority to writes until appropriate write queue entry has been picked
// if there are multiple matches, flushes until all are issued
assign drif_wr_entry_pend_in = drif0_raw_hazard & drif0_rd_picked | drif1_raw_hazard & drif1_rd_picked;
assign drif_wr_entry_pend_en = drif_wr_entry_pend_in;
assign drif_wr_entry_pend_clr = (drif0_haz_rd & drif0_wr_picked  & (|(woq_wr_adr_queue_sel[7:0] & drif_raw_match[7:0])) | 
				 drif0_haz_rd & drif0_wr1_picked & (|(woq_wr1_adr_queue_sel[7:0] & drif_raw_match[7:0])) | 
				 drif0_haz_rd & drif0_wr2_picked & (|(woq_wr2_adr_queue_sel[7:0] & drif_raw_match[7:0])) | 
				~drif0_haz_rd & drif1_wr_picked  & (|(woq_wr_adr_queue_sel[7:0] & drif_raw_match[7:0])) | 
				~drif0_haz_rd & drif1_wr1_picked & (|(woq_wr1_adr_queue_sel[7:0] & drif_raw_match[7:0])) | 
				~drif0_haz_rd & drif1_wr2_picked & (|(woq_wr2_adr_queue_sel[7:0] & drif_raw_match[7:0])));

mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_wr_entry_pend  (
	.scan_in(ff_wr_entry_pend_scanin),
	.scan_out(ff_wr_entry_pend_scanout),
	.din(drif_wr_entry_pend_in),
	.dout(drif_wr_entry_pend),
	.en(drif_wr_entry_pend_en),
	.clr(drif_wr_entry_pend_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif0_haz_rd_in = drif_wr_entry_pend_en ? drif0_rd_picked : drif0_haz_rd;
assign drif_raw_match_in[7:0] = {8{drif_wr_entry_pend_en}} &
					(drif0_rd_picked ? drif0_raw_match_in[7:0] : drif1_raw_match_in[7:0]);

assign drif_raw_match_en = drif_wr_entry_pend_en | drif_wr_entry_pend_clr;

mcu_drif_ctl_msff_ctl_macro__en_1__width_9 ff_raw_match  (
	.scan_in(ff_raw_match_scanin),
	.scan_out(ff_raw_match_scanout),
	.din({drif0_haz_rd_in,drif_raw_match_in[7:0]}),
	.dout({drif0_haz_rd,drif_raw_match[7:0]}),
	.en(drif_raw_match_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Priority picking of reads and writes
assign drif_rdwr_addr_picked[8:0] = (drif_pick_wr_first & drif_wr_picked) ? {woq_wr_addr_picked[9:4],woq_wr_addr_picked[2:0]} :
                                (|drif0_rd_entry_picked[7:0]) | (|drif1_rd_entry_picked[7:0]) ? drif_rd_addr_picked[8:0] :
                                drif_wr_picked ? {woq_wr_addr_picked[9:4],woq_wr_addr_picked[2:0]} : 9'h0;

assign drif_rdwr_cmd_picked = (drif_pick_wr_first & drif_wr_picked) ? 1'b1 :
                                drif_rd_picked ? 1'b0 :
                                drif_wr_picked ? 1'b1 : 1'b0;

assign drif_rdwr_index_picked[2:0] = (drif_pick_wr_first & drif_wr_picked) ? woq_wr_index_picked[2:0] :
                                drif_rd_picked ? drif_rd_index_picked[2:0] :
                                drif_wr_picked ? woq_wr_index_picked[2:0] : 3'h0;

// when in 4-bank mode, use rank information for bank bit 2 when scheduling requests
assign drif_scrub_sched_bank_adr[3] = drif_eight_bank_mode_mod ? (drif_stacked_dimm ? drif_scrub_rank_adr :
							drif_scrub_dimm_adr[0]) :
						    (drif_stacked_dimm ? drif_scrub_dimm_adr[0] :
							drif_scrub_dimm_adr[1]);
assign drif_scrub_sched_bank_adr[2] = drif_eight_bank_mode_mod ? drif_scrub_bank_adr[2] : 
			   	 drif_stacked_dimm ? drif_scrub_rank_adr : drif_scrub_dimm_adr[0];
assign drif_scrub_sched_bank_adr[1:0] = drif_scrub_bank_adr[1:0];

assign drif_scrub_bank_valid[15:0] = {16{drif_scrub_read_pending}} & 
					{drif_scrub_sched_bank_adr[3:0] == 4'hf, drif_scrub_sched_bank_adr[3:0] == 4'he, 
					drif_scrub_sched_bank_adr[3:0] == 4'hd, drif_scrub_sched_bank_adr[3:0] == 4'hc, 
					drif_scrub_sched_bank_adr[3:0] == 4'hb, drif_scrub_sched_bank_adr[3:0] == 4'ha, 
					drif_scrub_sched_bank_adr[3:0] == 4'h9, drif_scrub_sched_bank_adr[3:0] == 4'h8,
					drif_scrub_sched_bank_adr[3:0] == 4'h7, drif_scrub_sched_bank_adr[3:0] == 4'h6, 
					drif_scrub_sched_bank_adr[3:0] == 4'h5, drif_scrub_sched_bank_adr[3:0] == 4'h4, 
					drif_scrub_sched_bank_adr[3:0] == 4'h3, drif_scrub_sched_bank_adr[3:0] == 4'h2, 
					drif_scrub_sched_bank_adr[3:0] == 4'h1, drif_scrub_sched_bank_adr[3:0] == 4'h0};

assign drif_scrub_addr_picked[8:0] = drif_scrub_picked ? {drif_scrub_addr_parity,drif_scrub_addr_err,drif_scrub_rank_adr,
								drif_scrub_dimm_adr[2:0],drif_scrub_sched_bank_adr[2:0]} : 
				(drif_err_rd_picked | drif_err_wr_picked) ? {drif_err_fifo_parity, 1'b0, 
										drif_err_fifo_rank_adr,
									    	drif_err_fifo_dimm_adr[2:0],
									    	drif_err_fifo_bank_adr[2:0]} :
									drif_rdwr_addr_picked[8:0];

// Generate bank, ras, cas and addr error signals for wr addr.
assign drif_addr_parity = drif_scrub_addr_picked[8];
assign drif_addr_err = drif_scrub_addr_picked[7];
assign drif_rank_adr = drif_scrub_addr_picked[6];
assign drif_dimm_adr[2:0] = drif_scrub_addr_picked[5:3];
assign drif_bank_adr[2:0] = drif_scrub_addr_picked[2:0];
assign drif_index_picked[2:0] = (drif_err_rd_picked | drif_err_wr_picked) ? drif_err_fifo_rdq_entry[2:0] : drif_rdwr_index_picked[2:0]; 
assign drif_cmd_picked = drif_err_wr_picked ? 1'b1 : (drif_scrub_picked | drif_err_rd_picked) ? 1'b0 : drif_rdwr_cmd_picked;

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_cmd_picked_d1  (
	.scan_in(ff_cmd_picked_d1_scanin),
	.scan_out(ff_cmd_picked_d1_scanout),
	.din(drif_cmd_picked),
	.dout(drif_cmd_picked_d1),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_scrub_picked_d1  (
	.scan_in(ff_scrub_picked_d1_scanin),
	.scan_out(ff_scrub_picked_d1_scanout),
	.din(drif_scrub_picked),
	.dout(drif_scrub_picked_d1),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_addr_parity_d1  (
	.scan_in(ff_addr_parity_d1_scanin),
	.scan_out(ff_addr_parity_d1_scanout),
	.din(drif_addr_parity),
	.dout(drif_addr_parity_d1),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_addr_err_d1  (
	.scan_in(ff_addr_err_d1_scanin),
	.scan_out(ff_addr_err_d1_scanout),
	.din(drif_addr_err),
	.dout(drif_addr_err_d1),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Making sure stores are not starved
// Keep a counter that triggers on drq_pending_wr_req all set
// and reaches a max cnt. Then give writes pref over reads 
// till it counts down to 0.

assign drif0_wr_starve_cnt_reset = ~(&drq0_pending_wr_req[7:0]) & ~drif0_pick_wr_first & ~drif0_pick_wr_first_in;
assign drif0_wr_starve_cnt_in[5:0] = 
		drif0_pick_wr_first & (drif0_wr_starve_cnt[5:0] != 6'h0) ? drif0_wr_starve_cnt[5:0] - 6'h1 :
		~drif0_pick_wr_first & (drif0_wr_starve_cnt[5:0] != 6'h3f) ? drif0_wr_starve_cnt[5:0] + 6'h1 : 
			drif0_wr_starve_cnt[5:0];
mcu_drif_ctl_msff_ctl_macro__clr_1__width_6 ff_wr_starve_cnt0  (
	.scan_in(ff_wr_starve_cnt0_scanin),
	.scan_out(ff_wr_starve_cnt0_scanout),
	.din(drif0_wr_starve_cnt_in[5:0]),
	.dout(drif0_wr_starve_cnt[5:0]),
	.clr(drif0_wr_starve_cnt_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif0_pick_wr_first_in = (drif0_wr_starve_cnt[5:0] == 6'h3f);
assign drif0_pick_wr_first_reset = drif0_wr_starve_cnt[5:0] == 6'h0;

mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_pick_wr_first0  (
	.scan_in(ff_pick_wr_first0_scanin),
	.scan_out(ff_pick_wr_first0_scanout),
	.din(drif0_pick_wr_first_in),
	.dout(drif0_pick_wr_first),
	.en(drif0_pick_wr_first_in),
	.clr(drif0_pick_wr_first_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif1_wr_starve_cnt_reset = ~(&drq1_pending_wr_req[7:0]) & ~drif1_pick_wr_first & ~drif1_pick_wr_first_in;
assign drif1_wr_starve_cnt_in[5:0] =
		drif1_pick_wr_first & (drif1_wr_starve_cnt[5:0] != 6'h0) ? drif1_wr_starve_cnt[5:0] - 6'h1 :
		~drif1_pick_wr_first & (drif1_wr_starve_cnt[5:0] != 6'h3f) ? drif1_wr_starve_cnt[5:0] + 6'h1 : 
			drif1_wr_starve_cnt[5:0];
mcu_drif_ctl_msff_ctl_macro__clr_1__width_6 ff_wr_starve_cnt1  (
	.scan_in(ff_wr_starve_cnt1_scanin),
	.scan_out(ff_wr_starve_cnt1_scanout),
	.din(drif1_wr_starve_cnt_in[5:0]),
	.dout(drif1_wr_starve_cnt[5:0]),
	.clr(drif1_wr_starve_cnt_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif1_pick_wr_first_in = (drif1_wr_starve_cnt[5:0] == 6'h3f);
assign drif1_pick_wr_first_reset = drif1_wr_starve_cnt[5:0] == 6'h0;

mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_pick_wr_first1  (
	.scan_in(ff_pick_wr_first1_scanin),
	.scan_out(ff_pick_wr_first1_scanout),
	.din(drif1_pick_wr_first_in),
	.dout(drif1_pick_wr_first),
	.en(drif1_pick_wr_first_in),
	.clr(drif1_pick_wr_first_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_pick_wr_first = drif0_pick_wr_first | drif1_pick_wr_first;

//////////////////////////////////////////////////////////////////
// Generating the signals to the pads
//////////////////////////////////////////////////////////////////
assign drif_bnk_cas_picked_or = |drif_bnk_cas_picked[15:0];
mcu_drif_ctl_msff_ctl_macro__en_1__width_1   ff_cas_picked  (
	.scan_in(ff_cas_picked_scanin),
	.scan_out(ff_cas_picked_scanout),
	.din(drif_bnk_cas_picked_or),
	.dout(drif_cas_picked_io_d1), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ras_picked_io_d1[15:0] = drif_bnk_cas_picked[15:0];

assign drif_ras_adr[14:0] = drif_scrub_picked | (drif_err_rd_picked | drif_err_wr_picked) & drif_err_fifo_scrub ? 
				drif_scrub_ras_adr[14:0] : addrdp_ras_adr_queue[14:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_15 ff_ras_adr_d1  (
	.scan_in(ff_ras_adr_d1_scanin),
	.scan_out(ff_ras_adr_d1_scanout),
	.din(drif_ras_adr[14:0]),
	.dout(drif_ras_adr_d1_out[14:0]), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ras_adr_d1[14] = drif_mem_type[1:0] == 2'h2 & ~drif_cas_addr_bits[0] ? drif_cas_adr_d1_out[10] : 
											drif_ras_adr_d1_out[14];
assign drif_ras_adr_d1[13] = drif_mem_type[1:0] == 2'h0 & ~drif_cas_addr_bits[0] ? drif_cas_adr_d1_out[10] : 
											drif_ras_adr_d1_out[13];
assign drif_ras_adr_d1[12:0] = drif_ras_adr_d1_out[12:0];

assign drif_cas_adr[10:0] = drif_scrub_picked | (drif_err_rd_picked | drif_err_wr_picked) & drif_err_fifo_scrub ? 
				drif_scrub_cas_adr[10:0] : addrdp_cas_adr_queue[10:0];

// bit 10 is forced to 1 for autoprecharge
mcu_drif_ctl_msff_ctl_macro__en_1__width_11 ff_cas_adr_d1  (
	.scan_in(ff_cas_adr_d1_scanin),
	.scan_out(ff_cas_adr_d1_scanout),
	.din(drif_cas_adr[10:0]),
	.dout(drif_cas_adr_d1_out[10:0]), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_3 ff_req_id_d1  (
	.scan_in(ff_req_id_d1_scanin),
	.scan_out(ff_req_id_d1_scanout),
	.din({addrdp_rd_req_id_queue[2:0]}),
	.dout(drif_rd_req_id_d1[2:0]), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


assign drif_cas_adr_d1[10:0] = {drif_cas_adr_d1_out[10] & drif_cas_addr_bits[0], drif_cas_adr_d1_out[9:0]};

mcu_drif_ctl_msff_ctl_macro__en_1__width_11 ff_cas_adr_d2  (
	.scan_in(ff_cas_adr_d2_scanin),
	.scan_out(ff_cas_adr_d2_scanout),
	.din(drif_cas_adr_d1[10:0]),
	.dout(drif_cas_adr_d2[10:0]), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_6 ff_bank_adr  (
	.scan_in(ff_bank_adr_scanin),
	.scan_out(ff_bank_adr_scanout),
	.din({drif_bank_adr[2:0],drif_bank_adr_d1[2:0]}),
	.dout({drif_bank_adr_d1_out[2:0],drif_bank_adr_d2[2:0]}), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_bank_adr_d1[2] = drif_mem_type[1:0] == 2'h1 & ~drif_cas_addr_bits[0] ? drif_cas_adr_d1_out[10] : 
											drif_bank_adr_d1_out[2];
assign drif_bank_adr_d1[1:0] = drif_bank_adr_d1_out[1:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_6 ff_dimm_adr  (
	.scan_in(ff_dimm_adr_scanin),
	.scan_out(ff_dimm_adr_scanout),
	.din({drif_dimm_adr[2:0],drif_dimm_adr_d1[2:0]}),
	.dout({drif_dimm_adr_d1[2:0],drif_dimm_adr_d2[2:0]}), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_2 ff_rank_adr  (
	.scan_in(ff_rank_adr_scanin),
	.scan_out(ff_rank_adr_scanout),
	.din({drif_rank_adr,drif_rank_adr_d1}),
	.dout({drif_rank_adr_d1,drif_rank_adr_d2}), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_mux_write_en = drif_cmd_picked_d1;
mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_mux_wr_en  (
	.scan_in(ff_mux_wr_en_scanin),
	.scan_out(ff_mux_wr_en_scanout),
	.din(drif_mux_write_en),
	.dout(drif_mux_write_en_d1), 
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_write_en_int = drif_mux_write_en_d1 & drif_cas_picked_io_d1;

// Command A
assign drif_dram_cmd_a[2:0] = drif_cmd_a_val ? `FBD_DRAM_CMD_ACT :
				drif_cmd_a_val_d1 & drif_write_en_int ? `FBD_DRAM_CMD_WR :
				drif_cmd_a_val_d1 & ~drif_write_en_int ? `FBD_DRAM_CMD_RD : `FBD_DRAM_CMD_NOP;

assign drif_dram_addr_a[15:0] = drif_cmd_a_val ? {1'b0,drif_ras_adr_d1[14:0]} : 
						 {4'h0,drif_cas_adr_d2[10],1'b1,drif_cas_adr_d2[9:0]};

assign drif_dram_bank_a[2:0] = drif_cmd_a_val ? drif_bank_adr_d1[2:0] & {drif_eight_bank_mode_mod,2'h3} : 
						drif_bank_adr_d2[2:0] & {drif_eight_bank_mode_mod,2'h3};

assign drif_dram_rank_a = drif_cmd_a_val ? drif_rank_adr_d1 : drif_rank_adr_d2;
assign drif_dram_dimm_a[2:0] = drif_cmd_a_val ? drif_dimm_adr_d1[2:0] : drif_dimm_adr_d2[2:0];

// delay address for B and C commands
assign drif_cmd_a_val_in = (drif0_rd_picked & ~drif0_raw_hazard) | (drif1_rd_picked & ~drif1_raw_hazard) | 
				drif_wr_picked | drif_scrub_picked | drif_err_rd_picked | drif_err_wr_picked;
mcu_drif_ctl_msff_ctl_macro__en_1__width_3 ff_cmd_val  (
	.scan_in(ff_cmd_val_scanin),
	.scan_out(ff_cmd_val_scanout),
	.din({drif_cmd_a_val_in,drif_wr_entry_picked[1],drif_wr_entry_picked[2]}),
	.dout({drif_cmd_a_val,drif_cmd_b_val,drif_cmd_c_val}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// stall sending write data after write command if sync frame needs to be sent
assign drif_wr_bc_stall = drif_cmd_b_val & fbdic_sync_frame_req;

mcu_drif_ctl_msff_ctl_macro__en_1__width_3 ff_cmd_val_d1  (
	.scan_in(ff_cmd_val_d1_scanin),
	.scan_out(ff_cmd_val_d1_scanout),
	.din({drif_cmd_a_val,drif_cmd_b_val,drif_cmd_c_val}),
	.dout({drif_cmd_a_val_d1,drif_cmd_b_val_d1,drif_cmd_c_val_d1}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// B command RAS and CAS d1
mcu_drif_ctl_msff_ctl_macro__en_1__width_26 ff_wr1_adr_d1  (
	.scan_in(ff_wr1_adr_d1_scanin),
	.scan_out(ff_wr1_adr_d1_scanout),
	.din({addrdp_ras_wr1_adr_queue[14:0],addrdp_cas_wr1_adr_queue[10:0]}),
	.dout({drif_ras_wr1_adr_d1_out[14:0],drif_cas_wr1_adr_d1_out[10:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_7 ff_write1_data  (
	.scan_in(ff_write1_data_scanin),
	.scan_out(ff_write1_data_scanout),
	.din({woq_wr1_addr_picked[7:4],woq_wr1_addr_picked[2:0]}),
	.dout({drif_rank_wr1_adr_d1,drif_dimm_wr1_adr_d1[2:0],drif_bank_wr1_adr_d1_out[2:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ras_wr1_adr_d1[14] = drif_mem_type[1:0] == 2'h2 & ~drif_cas_addr_bits[0] ? drif_cas_wr1_adr_d1_out[10] :
											drif_ras_wr1_adr_d1_out[14];
assign drif_ras_wr1_adr_d1[13] = drif_mem_type[1:0] == 2'h0 & ~drif_cas_addr_bits[0] ? drif_cas_wr1_adr_d1_out[10] :
											drif_ras_wr1_adr_d1_out[13];
assign drif_ras_wr1_adr_d1[12:0] = drif_ras_wr1_adr_d1_out[12:0];
assign drif_cas_wr1_adr_d1[10:0] = {drif_cas_wr1_adr_d1_out[10] & drif_cas_addr_bits[0], drif_cas_wr1_adr_d1_out[9:0]};
assign drif_bank_wr1_adr_d1[2] = drif_mem_type[1:0] == 2'h1 & ~drif_cas_addr_bits[0] ? drif_cas_wr1_adr_d1_out[10] :
											drif_bank_wr1_adr_d1_out[2];
assign drif_bank_wr1_adr_d1[1:0] = drif_bank_wr1_adr_d1_out[1:0]; 

// B command CAS rank, dimm, bank d2
mcu_drif_ctl_msff_ctl_macro__en_1__width_18 ff_wr1_adr_d2  (
	.scan_in(ff_wr1_adr_d2_scanin),
	.scan_out(ff_wr1_adr_d2_scanout),
	.din({drif_cas_wr1_adr_d1[10:0],drif_rank_wr1_adr_d1,drif_dimm_wr1_adr_d1[2:0],drif_bank_wr1_adr_d1[2:0]}),
	.dout({drif_cas_wr1_adr_d2[10:0],drif_rank_wr1_adr_d2,drif_dimm_wr1_adr_d2[2:0],drif_bank_wr1_adr_d2[2:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// C command RAS and CAS d1
mcu_drif_ctl_msff_ctl_macro__en_1__width_7 ff_write2_data  (
	.scan_in(ff_write2_data_scanin),
	.scan_out(ff_write2_data_scanout),
	.din({woq_wr2_addr_picked[7:4],woq_wr2_addr_picked[2:0]}),
	.dout({drif_rank_wr2_adr_d1,drif_dimm_wr2_adr_d1[2:0],drif_bank_wr2_adr_d1_out[2:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_26 ff_wr2_adr_d1  (
	.scan_in(ff_wr2_adr_d1_scanin),
	.scan_out(ff_wr2_adr_d1_scanout),
	.din({addrdp_ras_wr2_adr_queue[14:0],addrdp_cas_wr2_adr_queue[10:0]}),
	.dout({drif_ras_wr2_adr_d1_out[14:0],drif_cas_wr2_adr_d1_out[10:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ras_wr2_adr_d1[14] = drif_mem_type[1:0] == 2'h2 & ~drif_cas_addr_bits[0] ? drif_cas_wr2_adr_d1_out[10] :
											drif_ras_wr2_adr_d1_out[14];
assign drif_ras_wr2_adr_d1[13] = drif_mem_type[1:0] == 2'h0 & ~drif_cas_addr_bits[0] ? drif_cas_wr2_adr_d1_out[10] :
											drif_ras_wr2_adr_d1_out[13];
assign drif_ras_wr2_adr_d1[12:0] = drif_ras_wr2_adr_d1_out[12:0];
assign drif_cas_wr2_adr_d1[10:0] = {drif_cas_wr2_adr_d1_out[10] & drif_cas_addr_bits[0], drif_cas_wr2_adr_d1_out[9:0]};
assign drif_bank_wr2_adr_d1[2] = drif_mem_type[1:0] == 2'h1 & ~drif_cas_addr_bits[0] ? drif_cas_wr2_adr_d1_out[10] :
											drif_bank_wr2_adr_d1_out[2];
assign drif_bank_wr2_adr_d1[1:0] = drif_bank_wr2_adr_d1_out[1:0]; 

// C command CAS rank, dimm, bank d2
mcu_drif_ctl_msff_ctl_macro__en_1__width_18 ff_wr2_adr_d2  (
	.scan_in(ff_wr2_adr_d2_scanin),
	.scan_out(ff_wr2_adr_d2_scanout),
	.din({drif_cas_wr2_adr_d1[10:0],drif_rank_wr2_adr_d1,drif_dimm_wr2_adr_d1[2:0],drif_bank_wr2_adr_d1[2:0]}),
	.dout({drif_cas_wr2_adr_d2[10:0],drif_rank_wr2_adr_d2,drif_dimm_wr2_adr_d2[2:0],drif_bank_wr2_adr_d2[2:0]}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Make sure Refresh is not issued to the same DIMM as an Activate, Read or Write
// 0in custom -fire (drif_dram_cmd_a[2:0] != 3'h0 & drif_dram_cmd_b[2:0] == 3'h1 & drif_dram_dimm_a[2:0] == drif_dram_dimm_b[2:0])

// Command B
assign drif_dram_cmd_b[2:0] = drif_refresh_req_picked ? `FBD_DRAM_CMD_OTHER :
				drif_wdq_sel_d1 | drif_scrub_data_rden_en_d1 ? `FBD_DRAM_CMD_WDATA : 
				drif_cmd_b_val ? `FBD_DRAM_CMD_ACT : 
				drif_cmd_b_val_d1 ? `FBD_DRAM_CMD_WR : `FBD_DRAM_CMD_NOP;
assign drif_dram_addr_b[15:0] = drif_refresh_req_picked ? {13'h0, `FBD_DRAM_CMD_OTHER_REF} :
				drif_cmd_b_val ? {1'b0,drif_ras_wr1_adr_d1[14:0]} : 
							{4'h0,drif_cas_wr1_adr_d2[10],1'b1,drif_cas_wr1_adr_d2[9:0]};
assign drif_dram_bank_b[2:0] = drif_cmd_b_val ? drif_bank_wr1_adr_d1[2:0] & {drif_eight_bank_mode_mod,2'h3} : 
							drif_bank_wr1_adr_d2[2:0] & {drif_eight_bank_mode_mod,2'h3};
assign drif_dram_rank_b = drif_refresh_req_picked ? drif_refresh_rank[3] :
				drif_cmd_b_val ? drif_rank_wr1_adr_d1 : drif_rank_wr1_adr_d2;
assign drif_dram_dimm_b[2:0] = drif_refresh_req_picked ? drif_refresh_rank[2:0] :
				drif_cmd_b_val ? drif_dimm_wr1_adr_d1[2:0] : drif_dimm_wr1_adr_d2[2:0];

// Make sure Power Down or Self Refresh command is not issued to the same DIMM as an Activate, Read or Write
/* 0in custom -fire (drif_dram_cmd_a[2:0] != 3'h0 & drif_dram_cmd_c[2:0] == 3'h1 & 
		drif_dram_dimm_a[2:0] == drif_dram_dimm_c[2:0] & drif_dram_cmd_b[2:0] != 3'h5) */

// Command C
assign drif_dram_cmd_c[2:0] = drif_cmd_c_val ? `FBD_DRAM_CMD_ACT : 
				drif_cmd_c_val_d1 ? `FBD_DRAM_CMD_WR : 
				drif_pd_mode_pending | (drif_enter_self_refresh | drif_exit_self_refresh) & 
					fbdic_sync_frame_req_l ? `FBD_DRAM_CMD_OTHER : `FBD_DRAM_CMD_NOP;
assign drif_dram_addr_c[15:0] = drif_cmd_c_val ? {1'b0,drif_ras_wr2_adr_d1[14:0]} : 
				drif_cmd_c_val_d1 ? {4'h0,drif_cas_wr2_adr_d2[10],1'b1,drif_cas_wr2_adr_d2[9:0]} :
				drif_enter_self_refresh ? {13'h0, `FBD_DRAM_CMD_OTHER_SRE} :
				drif_pd_mode_exit_pending | drif_exit_self_refresh ? {13'h0, `FBD_DRAM_CMD_OTHER_SRPDX} :
				drif_pd_mode_enter_pending ? {13'h0, `FBD_DRAM_CMD_OTHER_PDE} : 16'h0;
assign drif_dram_bank_c[2:0] = drif_cmd_c_val ? drif_bank_wr2_adr_d1[2:0] & {drif_eight_bank_mode_mod,2'h3} : 
							drif_bank_wr2_adr_d2[2:0] & {drif_eight_bank_mode_mod,2'h3};
assign drif_dram_rank_c = drif_cmd_c_val ? drif_rank_wr2_adr_d1 : 
			  drif_cmd_c_val_d1 ? drif_rank_wr2_adr_d2 :
			  drif_enter_self_refresh | drif_exit_self_refresh ? drif_refresh_rank[3] :
			  drif_pd_mode_exit_pending ? drif_pd_mode_exit_rank :
			  drif_pd_mode_enter_pending ? drif_pd_mode_enter_rank : 1'b0;
assign drif_dram_dimm_c[2:0] = drif_cmd_c_val ? drif_dimm_wr2_adr_d1[2:0] : 
			       drif_cmd_c_val_d1 ? drif_dimm_wr2_adr_d2[2:0] :
			       drif_enter_self_refresh | drif_exit_self_refresh ? drif_refresh_rank[2:0] :
			       drif_pd_mode_exit_pending ? drif_pd_mode_exit_dimm[2:0] :
			       drif_pd_mode_enter_pending ? drif_pd_mode_enter_dimm[2:0] : 3'h0;

assign drif_scrub_wsn = (drif_scrub_data_rden[1:0] == 2'h1) & drif_err_fifo_dimm_adr[0] |
			(drif_scrub_data_rden[1:0] == 2'h2) & drif_err_fifo_dimm_adr[1] |
			(drif_scrub_data_rden[1:0] == 2'h3) & drif_err_fifo_dimm_adr[2];

assign drif_wdata_wsn = drif_scrub_data_rden_en | drif_scrub_data_rden_en_d1 ? 
				drif_scrub_wsn : drif_wdata_wsn_out;
mcu_drif_ctl_msff_ctl_macro__width_1 ff_wdata_wsn  (
	.scan_in(ff_wdata_wsn_scanin),
	.scan_out(ff_wdata_wsn_scanout),
	.din(woq_wdata_wsn),
	.dout(drif_wdata_wsn_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Generating the signals to store data buffer for READING DATA
//////////////////////////////////////////////////////////////////

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 ff_rd_wr_picked_d1  (
	.scan_in(ff_rd_wr_picked_d1_scanin),
	.scan_out(ff_rd_wr_picked_d1_scanout),
	.din({drif1_rd_picked,woq1_wr_picked[2:0]}),
	.dout({drif1_rd_picked_d1,drif1_wr2_picked_d1,drif1_wr1_picked_d1,drif1_wr_picked_d1}),
	.en(fbdic_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif0_wdq_radr[4:0] = woq_wdq_radr[4:0];
assign drif1_wdq_radr[4:0] = drif0_wdq_radr[4:0];
assign drif_wdq_radr[4:0] = drif1_wdq_radr[4:0];
assign drif0_wdq_rd = drif0_wdq_sel_in;
assign drif1_wdq_rd = drif1_wdq_sel_in;

// These 0in checks are for rd/wr conflict at memories
// 0in custom -fire (woq0_wdq_rd & drif0_wdq_rd_inh & drif0_cpu_wr_addr[2:0] == drif0_wdq_radr[4:2])
// 0in custom -fire (woq1_wdq_rd & drif1_wdq_rd_inh & drif1_cpu_wr_addr[2:0] == drif1_wdq_radr[4:2])
assign drif0_wdq_sel_in = woq0_wdq_rd & ~drif_err_state[`DRIF_ERR_READ1] & 
				~(drif0_wdq_rd_inh & drif0_cpu_wr_addr[2:0] == drif0_wdq_radr[4:2]);
assign drif1_wdq_sel_in = woq1_wdq_rd & ~drif_err_state[`DRIF_ERR_READ1] & 
				~(drif1_wdq_rd_inh & drif1_cpu_wr_addr[2:0] == drif1_wdq_radr[4:2]);

mcu_drif_ctl_msff_ctl_macro__width_4 ff0_wr_entry0  (
	.scan_in(ff0_wr_entry0_scanin),
	.scan_out(ff0_wr_entry0_scanout),
	.din({l2if0_wdq_rd_inh,l2if0_data_wr_addr[2:0]}),
	.dout({drif0_wdq_rd_inh,drif0_cpu_wr_addr[2:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__width_4 ff1_wr_entry0  (
	.scan_in(ff1_wr_entry0_scanin),
	.scan_out(ff1_wr_entry0_scanout),
	.din({l2if1_wdq_rd_inh,l2if1_data_wr_addr[2:0]}),
	.dout({drif1_wdq_rd_inh,drif1_cpu_wr_addr[2:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// mux select for routing data from wdq to wrdp
mcu_drif_ctl_msff_ctl_macro__width_2 ff_wdq_sel  (
	.scan_in(ff_wdq_sel_scanin),
	.scan_out(ff_wdq_sel_scanout),
	.din({drif0_wdq_sel_in,drif1_wdq_sel_in}),
	.dout({drif0_wdq_sel,drif1_wdq_sel}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// 0in one_hot -var drif_wdata_sel[3:0]
assign drif_wdata_sel[3:0] = ~drif_err_state[`DRIF_ERR_READ1] & drif0_wdq_sel ? 4'h1 : 
				~drif_err_state[`DRIF_ERR_READ1] & drif1_wdq_sel ? 4'h2 :
				drif_single_channel_mode ? {drif_scrub_data_rden[1],~drif_scrub_data_rden[1],2'h0} :
				{drif_scrub_data_rden[0],~drif_scrub_data_rden[0],2'h0};

// Generate signal for sending scrub data to IOs
assign drif_scrub_rwen = rdpctl_scrub_wren | fbdic_sync_frame_req_early1_l & 
				(~drif_single_channel_mode & drif_scrub_data_rden[0] |
				drif_single_channel_mode & drif_scrub_data_rden[1] & drif_scrub_data_rden[0]);

assign drif_scrub_data_rden_in[2:0] = (drif_scrub_data_rden[2:0] == 3'h3) & ~drif_single_channel_mode ? 3'h0 :
					drif_scrub_data_rden[2:0] + 3'h1;
assign drif_scrub_data_rden_en = (drif_scrub_buffer_full & ~drif_multi_err | (|drif_scrub_data_rden[2:0])) & 
					fbdic_sync_frame_req_early1_l & ~drif_refresh_req_picked & 
					~(drif_mcu_state[2] & drif_scrub_data_rden[2:0] == 3'h0) &
					~drif_mcu_state[3];

mcu_drif_ctl_msff_ctl_macro__en_1__width_3 ff_scrub_data_rden  (
	.scan_in(ff_scrub_data_rden_scanin),
	.scan_out(ff_scrub_data_rden_scanout),
	.din(drif_scrub_data_rden_in[2:0]),
	.dout(drif_scrub_data_rden[2:0]),
	.en(drif_scrub_data_rden_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Show when data is in scrub buffer and ready to send to fbdimms
assign drif_scrub_buffer_full = drif_scrub_buffer_cnt[1:0] == 2'h2;
assign drif_scrub_buffer_cnt_in[1:0] = drif_scrub_wren_d2 ? drif_scrub_buffer_cnt[1:0] + 2'h1 : 
					drif_scrub_data_rden_en | drif_scrub_buffer_full & drif_multi_err ? 2'h0 : 
												drif_scrub_buffer_cnt[1:0];

mcu_drif_ctl_msff_ctl_macro__width_2 ff_scrub_buffer_cnt  (
	.scan_in(ff_scrub_buffer_cnt_scanin),
	.scan_out(ff_scrub_buffer_cnt_scanout),
	.din(drif_scrub_buffer_cnt_in[1:0]),
	.dout(drif_scrub_buffer_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// if a multi-nibble error occurs, don't write data back to memory
assign drif_multi_err_in = (|readdp_ecc_multi_err[1:0]) & drif_scrub_wren ? 1'b1 : 
				drif_scrub_buffer_full & drif_multi_err ? 1'b0 : drif_multi_err;
mcu_drif_ctl_msff_ctl_macro ff_multi_err (
	.scan_in(ff_multi_err_scanin),
	.scan_out(ff_multi_err_scanout),
	.din(drif_multi_err_in),
	.dout(drif_multi_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// set a flag when issuing an error write so mcu can ignore write complete status
assign drif_woq_free[1:0] = fbdic_woq_free[1:0] & {2{~drif_error_write_flag}};
assign drif_error_write_flag_in = drif_scrub_data_rden_en ? 1'b1 : (|fbdic_woq_free[1:0]) ? 1'b0 : drif_error_write_flag;
mcu_drif_ctl_msff_ctl_macro ff_error_write_flag (
	.scan_in(ff_error_write_flag_scanin),
	.scan_out(ff_error_write_flag_scanout),
	.din(drif_error_write_flag_in),
	.dout(drif_error_write_flag),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__width_2 ff_scrub_data_rden_en_d1  (
	.scan_in(ff_scrub_data_rden_en_d1_scanin),
	.scan_out(ff_scrub_data_rden_en_d1_scanout),
	.din({drif_scrub_data_rden_en,drif_scrub_data_rden[0]}),
	.dout({drif_scrub_data_rden_en_d1,drif_scrub_data_rden0_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//`ifdef MCU_BUG_118947
//assign drif_err_wrdata_ready_in = (&drif_scrub_data_rden[1:0]) & (drif_single_channel_mode & drif_scrub_data_rden[2] | 
//					~drif_single_channel_mode) ? 1'b1 : 
//				                drif_err_wr_picked | drif_scrub_wr_drop ? 1'b0 : drif_err_wrdata_ready;
//`else
assign drif_err_wrdata_ready_in = (&drif_scrub_data_rden[1:0]) & (drif_single_channel_mode & drif_scrub_data_rden[2] | 
					~drif_single_channel_mode) ? 1'b1 : 
				                drif_err_wr_picked ? 1'b0 : drif_err_wrdata_ready;
//`endif

mcu_drif_ctl_msff_ctl_macro ff_err_wrdata_ready (
	.scan_in(ff_err_wrdata_ready_scanin),
	.scan_out(ff_err_wrdata_ready_scanout),
	.din(drif_err_wrdata_ready_in),
	.dout(drif_err_wrdata_ready),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// select between upper and lower doublewords for single-dimm mode
assign drif_io_wdata_sel[1:0] = drif_err_state[`DRIF_ERR_WRITE] & drif_single_channel_mode ? 
				{drif_scrub_data_rden0_d1,~drif_scrub_data_rden0_d1} : woq_io_wdata_sel[1:0];

///////
// Stage the address parity bit so that store data ecc can be XORed with this bit.
///////
assign drif_wadr_parity_p2 = drif_err_state[`DRIF_ERR_IDLE] ? woq_wadr_parity : drif_err_fifo_parity;
mcu_drif_ctl_msff_ctl_macro__width_2 ff_wadr_parity  (
	.scan_in(ff_wadr_parity_scanin),
	.scan_out(ff_wadr_parity_scanout),
	.din({drif_wadr_parity_p2,drif_wadr_parity_p1}),
	.dout({drif_wadr_parity_p1,drif_wadr_parity}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Store ID and the offset for read request response
//////////////////////////////////////////////////////////////////
mcu_drif_ctl_msff_ctl_macro__en_1__width_9 ff_rd_index_d1  (
	.scan_in(ff_rd_index_d1_scanin),
	.scan_out(ff_rd_index_d1_scanout),
	.din({drif_rd_index_picked[2:0],woq_wr_index_picked[2:0],woq_wr_wdq_index_picked[2:0]}),
	.dout({drif_rd_index_d1[2:0],drif_wr_index_d1[2:0],drif_wr_wdq_index_d1[2:0]}),
	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_err_fifo_err_type_d1  (
	.scan_in(ff_err_fifo_err_type_d1_scanin),
	.scan_out(ff_err_fifo_err_type_d1_scanout),
	.din(drif_err_fifo_err_type),
	.dout(drif_err_fifo_err_type_d1),
	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// read/write data info for rdpctl
assign drif_send_info_val = drif_cmd_a_val & ~drif_mux_write_en & drif_sync_frame_req_l;
assign drif_send_info[19:0] = { drif_err_rd_picked_d1 & drif_err_fifo_crc_d1,
				drif_err_rd_picked_d1 & ~drif_err_fifo_crc_d1, 
				drif_rank_adr_d1,
				drif_dimm_adr_d1[2:0],
				{drif_bank_adr_d1_out[2],drif_bank_adr_d1[1:0]},
				(drif_err_rd_picked_d1 & ~drif_err_fifo_crc_d1 ? drif_err_fifo_err_type_d1 : drif_addr_err_d1), 
				drif_addr_parity_d1, 
				(drif_err_rd_picked_d1 ? drif_err_fifo_scrub : drif_scrub_picked_d1), 
				(drif_err_rd_picked_d1 ? drif_err_fifo_rdq_entry_d1[2:0] : drif_rd_index_d1[2:0]), 
				(drif_err_rd_picked_d1 & ~drif_err_fifo_crc_d1 ? {2'h0,drif_err_state[`DRIF_ERR_IDLE]} : drif_rd_req_id_d1[2:0]), 
				(drif_single_channel_mode ? drif_cas_adr_d1[2] : drif_cas_adr_d1[1]), 
				(drif_err_rd_picked_d1 ? drif_err_fifo_l2bank : drif1_rd_picked_d1)};

/////////////////////////////////////////////////////////////
// MAIN STATE MACHINE THAT KEEPS TRACK OF THE CONTROLLER STATE
/////////////////////////////////////////////////////////////

// 0in one_hot -var drif_mcu_state[7:0]

assign drif_mcu_state[7:0] = {
	drif_mcu_state_enc[4:0] == 5'd7, drif_mcu_state_enc[4:0] == 5'd6, 
	drif_mcu_state_enc[4:0] == 5'd5, drif_mcu_state_enc[4:0] == 5'd4, 
	drif_mcu_state_enc[4:0] == 5'd3, drif_mcu_state_enc[4:0] == 5'd2, 
	drif_mcu_state_enc[4:0] == 5'd1, drif_mcu_state_enc[4:0] == 5'd0};

mcu_drif_ctl_msff_ctl_macro__width_5  ff_mcu_state_enc  (
	.scan_in(ff_mcu_state_enc_scanin),
	.scan_out(ff_mcu_state_enc_scanout),
	.din(drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0]),
	.dout(drif_mcu_state_enc[`DRIF_MCU_STATE_MAX:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

always @(drif_stacked_dimm or dal_reg or drif_err_wr_picked or drif_bank_idle_cnt 
	or drif_cyc_cnt or drif_mcu_state_enc or drif_scrub_picked
	or drif_hw_selfrsh or drif_init or drif_wr_picked or drif_rd_picked
	or drif_ref_go or drif_refresh_rank or drif_last_rank or rfc_cnt_is_zero 
	or drif_err_rd_picked or ral_reg or rc_reg or fbdic_sync_frame_req_l 
	or drif_enter_self_refresh or drif_exit_self_refresh or drif_cmd_a_val 
	or drif_cmd_a_val_d1 or drif_dram_dimm_a or fbdic_error_mode or drif_wdq_sel_d1) 
begin
	drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = drif_mcu_state_enc[`DRIF_MCU_STATE_MAX:0];
	drif_cyc_cnt_next[7:0] = 8'h0; 
	drif_bank_idle_cnt_next[4:0] = drif_bank_idle_cnt[4:0];
	drif_refresh_rank_in[4:0] = drif_refresh_rank[4:0];
	set_drif_enter_self_refresh = 1'b0;
	set_drif_exit_self_refresh = 1'b0;

case (drif_mcu_state_enc[`DRIF_MCU_STATE_MAX:0]) 
	5'd0:	begin
			if (drif_hw_selfrsh) begin
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_05;
			end
			else if (~drif_init) begin
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_01;
			end
		end
	5'd1:   begin
			// IN NORMAL operation but wait for refresh requests
			if (drif_ref_go | drif_hw_selfrsh) 
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_02;
			drif_bank_idle_cnt_next[4:0] = 5'h0;
		end
	5'd2:   begin
			// compare to 2 less than reg because of 2 cycle delay for issuing command
			if ((drif_bank_idle_cnt[4:0] >= (dal_reg[4:0] - 5'h2)) & 
			    (drif_bank_idle_cnt[4:0] >= (ral_reg[4:0] - 5'h2)) &
			    (drif_bank_idle_cnt[4:0] >= (rc_reg[4:0] - 5'h2)))
			begin
				if (~drif_rd_picked & ~drif_wr_picked & ~drif_err_wr_picked &
				    	~drif_err_rd_picked & ~drif_scrub_picked & ~fbdic_error_mode) 
				begin
					drif_bank_idle_cnt_next = 5'h0;
					drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_03;
				end
			end
			else begin
				drif_bank_idle_cnt_next[4:0] = drif_bank_idle_cnt[4:0] + 5'h1;
			end
		end
	5'd3:   begin
			// SEND the AUTO refresh command
			if (fbdic_sync_frame_req_l & (~drif_cmd_a_val & ~drif_cmd_a_val_d1 | 
			   drif_dram_dimm_a[2:0] != drif_refresh_rank[2:0]) & ~drif_wdq_sel_d1)
			begin
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_04;
			end
		end
	5'd4:   begin
			// WAIT for tRFC and back to normal operation
			if (rfc_cnt_is_zero) begin
				if (drif_refresh_rank[4:0] == {1'b0,drif_last_rank[3:0]}) begin
					// SW control to write mode regs
					if (drif_hw_selfrsh) begin
						drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_05; 
						set_drif_enter_self_refresh = 1'b1;
						drif_refresh_rank_in[4:0] = 5'h0;
					end
					else if (drif_init) begin
						drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_00;
					end
					else begin
						drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_01;
					end	
					drif_refresh_rank_in[4:0] = 5'h0;
				end
				else begin
					drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_02;
					drif_refresh_rank_in[4] = 1'b0;
					drif_refresh_rank_in[3] = drif_refresh_rank[3] ^ drif_stacked_dimm;
					drif_refresh_rank_in[2:0] = drif_refresh_rank[2:0] + 
						{2'h0, drif_refresh_rank[3] & drif_stacked_dimm | ~drif_stacked_dimm};
				end
			end
		end
	5'd5:  begin
			// Issue self refresh enter commands
			if (drif_enter_self_refresh & fbdic_sync_frame_req_l) begin
				drif_refresh_rank_in[4] = 1'b0;
				drif_refresh_rank_in[3] = drif_refresh_rank[3] ^ drif_stacked_dimm;
				drif_refresh_rank_in[2:0] = drif_refresh_rank[2:0] + 
					{2'h0, drif_refresh_rank[3] & drif_stacked_dimm | ~drif_stacked_dimm};	
			end

			// WAIT till self refresh bit is unset
			if (~drif_hw_selfrsh) begin
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_06;
				set_drif_exit_self_refresh = 1'b1;
				drif_refresh_rank_in[4:0] = 5'h0;
			end
		end
	5'd6:  begin
			// Issue self refresh exit commands
			if (drif_exit_self_refresh) begin
				if (fbdic_sync_frame_req_l) begin
					drif_refresh_rank_in[4] = 1'b0;
					drif_refresh_rank_in[3] = drif_refresh_rank[3] ^ drif_stacked_dimm;
					drif_refresh_rank_in[2:0] = drif_refresh_rank[2:0] + 
						{2'h0, drif_refresh_rank[3] & drif_stacked_dimm | ~drif_stacked_dimm};
				end	
			end
			else begin
				drif_cyc_cnt_next[7:0] = drif_cyc_cnt[7:0] + 8'h1;
			end

			// WAIT for 200 cycles after coming out of self refresh for 
			// back to normal operation
			if (drif_cyc_cnt[7:0] == 8'hC8) begin
				drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_01;
				drif_refresh_rank_in[4:0] = 5'h0;
			end
		end
	default: begin
			drif_mcu_state_next[`DRIF_MCU_STATE_MAX:0] = `DRIF_MCU_STATE_00;
		end
endcase
end

mcu_drif_ctl_msff_ctl_macro__width_8 ff_cyc_cnt  (
	.scan_in(ff_cyc_cnt_scanin),
	.scan_out(ff_cyc_cnt_scanout),
	.din(drif_cyc_cnt_next[7:0]),
	.dout(drif_cyc_cnt[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// wait for tMRD count
assign mrd_cnt_next[1:0] =  (drif_mcu_state[3] | drif_mcu_state[4]) & mrd_cnt_is_zero ? 
					mrd_reg[1:0] : ((mrd_cnt[1:0] == 2'h0) ? 2'h0 : mrd_cnt[1:0] - 2'h1);

mcu_drif_ctl_msff_ctl_macro__width_2 ff_mrd_cnt  (
	.scan_in(ff_mrd_cnt_scanin),
	.scan_out(ff_mrd_cnt_scanout),
	.din(mrd_cnt_next[1:0]),
	.dout(mrd_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mrd_cnt_is_zero = (mrd_cnt[1:0] == 2'h0);

// wait for tRP count
assign rp_cnt_next[3:0] = (drif_mcu_state[5] & mrd_cnt_is_zero | drif_mcu_state[2]) ? 
			(drif_eight_bank_mode_mod ? ((rp_reg[3:0] != 4'hf) ? rp_reg[3:0] + 4'h1 : rp_reg[3:0]) : 
				rp_reg[3:0]) : ((rp_cnt[3:0] == 4'h0) ? 4'h0 : rp_cnt[3:0] - 4'h1);

mcu_drif_ctl_msff_ctl_macro__width_4 ff_rp_cnt  (
	.scan_in(ff_rp_cnt_scanin),
	.scan_out(ff_rp_cnt_scanout),
	.din(rp_cnt_next[3:0]),
	.dout(rp_cnt[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rp_cnt_is_zero = (rp_cnt[3:0] == 4'h0);

// Count to clear all the requests to all banks so that refresh command could be issued.
mcu_drif_ctl_msff_ctl_macro__width_5  ff_bank_idle_cnt  (
	.scan_in(ff_bank_idle_cnt_scanin),
	.scan_out(ff_bank_idle_cnt_scanout),
	.din(drif_bank_idle_cnt_next[4:0]),
	.dout(drif_bank_idle_cnt[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// number of the current rank being refreshed
mcu_drif_ctl_msff_ctl_macro__width_5 ff_refresh_rank (
	.scan_in(ff_refresh_rank_scanin),
	.scan_out(ff_refresh_rank_scanout),
	.din(drif_refresh_rank_in[4:0]),
	.dout(drif_refresh_rank[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flag to issue self refresh enter commands to FBDIMMs

assign drif_enter_self_refresh_in = 
	set_drif_enter_self_refresh ? 1'b1 : 
	(drif_refresh_rank[4:0] == {1'b0,drif_last_rank[3:0]}) & fbdic_sync_frame_req_l ? 1'b0 : drif_enter_self_refresh;
mcu_drif_ctl_msff_ctl_macro ff_enter_self_refresh (
	.scan_in(ff_enter_self_refresh_scanin),
	.scan_out(ff_enter_self_refresh_scanout),
	.din(drif_enter_self_refresh_in),
	.dout(drif_enter_self_refresh),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// flag to issue self refresh exit commands to FBDIMMs

assign drif_exit_self_refresh_in = 
	set_drif_exit_self_refresh ? 1'b1 : 
	(drif_refresh_rank[4:0] == {1'b0,drif_last_rank[3:0]}) & fbdic_sync_frame_req_l ? 1'b0 : drif_exit_self_refresh;
mcu_drif_ctl_msff_ctl_macro ff_exit_self_refresh (
	.scan_in(ff_exit_self_refresh_scanin),
	.scan_out(ff_exit_self_refresh_scanout),
	.din(drif_exit_self_refresh_in),
	.dout(drif_exit_self_refresh),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Poison bit for ECC bits in writedp
assign drif_l2poison_qw_in = ((wdqrf00_data_mecc | wdqrf01_data_mecc) & drif0_wdq_sel | 
				(wdqrf10_data_mecc | wdqrf11_data_mecc) & drif1_wdq_sel) & ~drif_err_state[`DRIF_ERR_READ1];

mcu_drif_ctl_msff_ctl_macro ff_l2_poison_qw (
	.scan_in(ff_l2_poison_qw_scanin),
	.scan_out(ff_l2_poison_qw_scanout),
	.din(drif_l2poison_qw_in),
	.dout(drif_l2poison_qw),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// SOFTWARE PROGRAMMABLE REGISTERS
//////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////
// MODE REGISTER - reset to 7'h32
//////////////////////////////////////////////////////////////////

assign sch_mode_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h10);
assign mode_reg_in[6:4] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h10) ? 
			drif_ucb_data[2:0] : mode_reg[6:4];

assign inv_mode_reg_in[5:4] = ~mode_reg_in[5:4];
assign mode_reg[5:0] = {~inv_mode_reg[5:4], 4'h2};

mcu_drif_ctl_msff_ctl_macro__en_1__width_3   pff_mode_reg  ( // FS:wmr_protect
	.scan_in(pff_mode_reg_wmr_scanin),
	.scan_out(pff_mode_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({mode_reg_in[6],inv_mode_reg_in[5:4]}),
	.en(sch_mode_reg_en),
	.dout({mode_reg[6],inv_mode_reg[5:4]}),
	.l1clk(l1clk),
  .soclk(soclk));
			
//////////////////////////////////////////////////////////////////
// EXTENDED MODE REGISTER 1 - reset to 15'h0018
//////////////////////////////////////////////////////////////////

assign sch_ext_mode_reg1_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h118);
assign ext_mode_reg1_in[14:0] = drif_ucb_data[14:0];

assign inv_ext_mode_reg1_in[4:3] = ~ext_mode_reg1_in[4:3];
assign ext_mode_reg1[4:3] = ~inv_ext_mode_reg1[4:3];

mcu_drif_ctl_msff_ctl_macro__en_1__width_15  pff_ext_mode_reg1  ( // FS:wmr_protect
	.scan_in(pff_ext_mode_reg1_wmr_scanin),
	.scan_out(pff_ext_mode_reg1_wmr_scanout),
	.siclk(aclk_wmr),
	.din({ext_mode_reg1_in[14:5],inv_ext_mode_reg1_in[4:3],ext_mode_reg1_in[2:0]}),
	.dout({ext_mode_reg1[14:5],inv_ext_mode_reg1[4:3],ext_mode_reg1[2:0]}),
	.en(sch_ext_mode_reg1_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// EXTENDED MODE REGISTER 2 - reset to 15'h0000
//////////////////////////////////////////////////////////////////

assign sch_ext_mode_reg2_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h110);
assign ext_mode_reg2_in[14:0] = drif_ucb_data[14:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_15  pff_ext_mode_reg2  ( // FS:wmr_protect
	.scan_in(pff_ext_mode_reg2_wmr_scanin),
	.scan_out(pff_ext_mode_reg2_wmr_scanout),
	.siclk(aclk_wmr),
	.din(ext_mode_reg2_in[14:0]),
	.dout(ext_mode_reg2[14:0]),
	.en(sch_ext_mode_reg2_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// EXTENDED MODE REGISTER 3 - reset to 15'h0000
//////////////////////////////////////////////////////////////////

assign sch_ext_mode_reg3_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h120);
assign ext_mode_reg3_in[14:0] = drif_ucb_data[14:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_15  pff_ext_mode_reg3  ( // FS:wmr_protect
	.scan_in(pff_ext_mode_reg3_wmr_scanin),
	.scan_out(pff_ext_mode_reg3_wmr_scanout),
	.siclk(aclk_wmr),
	.din(ext_mode_reg3_in[14:0]),
	.dout(ext_mode_reg3[14:0]),
	.en(sch_ext_mode_reg3_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// stacked DIMMs used - reset to 0
//////////////////////////////////////////////////////////////////

assign drif_stacked_dimm_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h108); 
assign drif_stacked_dimm_in = drif_ucb_data[0]; 

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_stacked_dimm  ( // FS:wmr_protect
	.scan_in(pff_stacked_dimm_wmr_scanin),
	.scan_out(pff_stacked_dimm_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_stacked_dimm_in),
	.en(drif_stacked_dimm_en),
	.dout(drif_stacked_dimm),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// cas address bits - reset to 4'hb
//////////////////////////////////////////////////////////////////
assign drif_cas_addr_bits_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h0); 
assign drif_cas_addr_bits_in[3:0] = drif_ucb_data[3:0]; 

assign inv_drif_cas_addr_bits_in[2] = ~drif_cas_addr_bits_in[3];
assign inv_drif_cas_addr_bits_in[1:0] = ~drif_cas_addr_bits_in[1:0];
assign drif_cas_addr_bits[3] = ~inv_drif_cas_addr_bits[2];
assign drif_cas_addr_bits[1:0] = ~inv_drif_cas_addr_bits[1:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_cas_addr_bits  ( // FS:wmr_protect
	.scan_in(pff_cas_addr_bits_wmr_scanin),
	.scan_out(pff_cas_addr_bits_wmr_scanout),
	.siclk(aclk_wmr),
	.din({drif_cas_addr_bits_in[2],inv_drif_cas_addr_bits_in[2:0]}),
	.en(drif_cas_addr_bits_en),
	.dout({drif_cas_addr_bits[2],inv_drif_cas_addr_bits[2:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// ras address bits - reset to 4'hf
//////////////////////////////////////////////////////////////////
assign drif_ras_addr_bits_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h8);
assign drif_ras_addr_bits_in[3:0] = drif_ucb_data[3:0]; 

assign inv_drif_ras_addr_bits_in[3:0] = ~drif_ras_addr_bits_in[3:0];
assign drif_ras_addr_bits[3:0] = ~inv_drif_ras_addr_bits[3:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4    pff_ras_addr_bits  ( // FS:wmr_protect
	.scan_in(pff_ras_addr_bits_wmr_scanin),
	.scan_out(pff_ras_addr_bits_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_drif_ras_addr_bits_in[3:0]),
	.en(drif_ras_addr_bits_en),
	.dout(inv_drif_ras_addr_bits[3:0]),
	.l1clk(l1clk),
  .soclk(soclk));

assign drif_row_addr_bits[1:0] = (drif_ras_addr_bits[3:0] == 4'he) ? 2'h2 : (drif_ras_addr_bits[3:0] == 4'hd) ? 2'h1 : 2'h3;

// memory type for address mapping

assign drif_mem_type_in[1:0] =  drif_ras_addr_bits[3:0] == 4'd14 & ~drif_eight_bank_mode_nomod ? 2'h1 :
				drif_ras_addr_bits[3:0] == 4'd14 & drif_eight_bank_mode_nomod ? 2'h2 : 
				drif_ras_addr_bits[3:0] == 4'd15 ? 2'h3 : 2'h0;

mcu_drif_ctl_msff_ctl_macro__width_2 ff_mem_type  (
	.scan_in(ff_mem_type_scanin),
	.scan_out(ff_mem_type_scanout),
	.din(drif_mem_type_in[1:0]),
	.dout(drif_mem_type[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// scrub frequency - reset to 12'hfff
//////////////////////////////////////////////////////////////////
assign drif_freq_scrub_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h18);
assign drif_freq_scrub_in[11:0] = drif_ucb_data[11:0];

assign inv_drif_freq_scrub_in[11:0] = ~drif_freq_scrub_in[11:0];
assign drif_freq_scrub[11:0] = ~inv_drif_freq_scrub[11:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_12    pff_freq_scrub  ( // FS:wmr_protect
	.scan_in(pff_freq_scrub_wmr_scanin),
	.scan_out(pff_freq_scrub_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_drif_freq_scrub_in[11:0]),
	.en(drif_freq_scrub_en),
	.dout(inv_drif_freq_scrub[11:0]),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// DIMMS per channel  - reset to 4'h1
//////////////////////////////////////////////////////////////////
assign drif_dimms_present_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h218);
assign drif_dimms_present_in[3:0] = drif_ucb_data[3:0];

assign inv_drif_dimms_present_in[0] = ~drif_dimms_present_in[0];
assign drif_dimms_present[0] = ~inv_drif_dimms_present[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_dimms_present  ( // FS:wmr_protect
	.scan_in(pff_dimms_present_wmr_scanin),
	.scan_out(pff_dimms_present_wmr_scanout),
	.siclk(aclk_wmr),
	.din({drif_dimms_present_in[3:1],inv_drif_dimms_present_in[0]}),
	.en(drif_dimms_present_en),
	.dout({drif_dimms_present[3:1],inv_drif_dimms_present[0]}),
	.l1clk(l1clk),
  .soclk(soclk));

assign drif_num_dimms[2:0] = drif_dimms_present[2:0];

// branch disabled
assign drif_branch_disabled_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h138);
assign drif_branch_disabled_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1 pff_branch_disabled  ( // FS:wmr_protect
	.scan_in(pff_branch_disabled_wmr_scanin),
	.scan_out(pff_branch_disabled_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_branch_disabled_in),
	.dout(drif_branch_disabled),
	.en(drif_branch_disabled_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// START INIT PROCESS AND SET MODE REGS - software should set to 0 when init is done
//////////////////////////////////////////////////////////////////
assign drif_init_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h1a0);
assign drif_init_in = drif_ucb_data[0];

assign inv_drif_init_in = ~drif_init_in;
assign drif_init = ~inv_drif_init;

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_init  (
	.scan_in(ff_init_scanin),
	.scan_out(ff_init_scanout),
	.din(inv_drif_init_in),
	.dout(inv_drif_init),
	.en(drif_init_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// LAST RANK PRESENT - derived from dimms_present and stacked_dimm
//////////////////////////////////////////////////////////////////
assign drif_last_rank[2:0] = drif_dimms_present[2:0] - 3'h1;
assign drif_last_rank[3] = drif_stacked_dimm;

//////////////////////////////////////////////////////////////////
// SELECT LOW ORDER BITS TO access ranks
//////////////////////////////////////////////////////////////////
assign drif_addr_bank_low_sel_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h140); 
assign drif_addr_bank_low_sel_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_bank_low_sel  ( // FS:wmr_protect
	.scan_in(pff_bank_low_sel_wmr_scanin),
	.scan_out(pff_bank_low_sel_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_addr_bank_low_sel_in),
	.en(drif_addr_bank_low_sel_en),
	.dout(drif_addr_bank_low_sel),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// EIGHT BANK MODE REG
//////////////////////////////////////////////////////////////////
assign drif_eight_bank_mode_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h128);
assign drif_eight_bank_mode_in = drif_ucb_data[0];

assign inv_drif_eight_bank_mode_in = ~drif_eight_bank_mode_in;
assign drif_eight_bank_mode = ~inv_drif_eight_bank_mode;
assign drif_eight_bank_mode_nomod = drif_eight_bank_mode;

assign drif_eight_bank_mode_mod = drif_eight_bank_mode | drif_cas_addr_bits[3:0] == 4'ha;

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_eight_bank_present  ( // FS:wmr_protect
	.scan_in(pff_eight_bank_present_wmr_scanin),
	.scan_out(pff_eight_bank_present_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_drif_eight_bank_mode_in),
	.en(drif_eight_bank_mode_en),
	.dout(inv_drif_eight_bank_mode), 
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// SINGLE CHANNEL MODE
//////////////////////////////////////////////////////////////////
assign drif_single_channel_mode_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h148);
assign drif_single_channel_mode_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_single_channel_mode  ( // FS:wmr_protect
	.scan_in(pff_single_channel_mode_wmr_scanin),
	.scan_out(pff_single_channel_mode_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_single_channel_mode_in),
	.dout(drif_single_channel_mode), 
	.en(drif_single_channel_mode_en),
	.l1clk(l1clk),
  .soclk(soclk));

// writes to the single dimm mode register generate MRS commands to the DIMMs to set the 
// appropriate burst length.  This shows that the MRS register write is pending.
assign drif_single_channel_mode_pend_clr = drif_mcu_state[7] & mrd_cnt_is_zero;
mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_single_channel_mode_pend  (
	.scan_in(ff_single_channel_mode_pend_scanin),
	.scan_out(ff_single_channel_mode_pend_scanout),
	.din(1'b1),
	.dout(drif_single_channel_mode_pend),
	.en(drif_single_channel_mode_en),
	.clr(drif_single_channel_mode_pend_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// FAIL OVER MODE BIT
//////////////////////////////////////////////////////////////////
assign drif_fail_over_mode_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h220);
assign drif_fail_over_mode_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_fail_over_mode  ( // FS:wmr_protect
	.scan_in(pff_fail_over_mode_wmr_scanin),
	.scan_out(pff_fail_over_mode_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_fail_over_mode_in),
	.dout(drif_fail_over_mode),
	.en(drif_fail_over_mode_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// CKE ENABLE BIT - enables CKE to DIMMs
//////////////////////////////////////////////////////////////////
assign drif_cke_en = (drif_mcu_state[6] & ~drif_hw_selfrsh) | drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h1a0);
assign drif_cke_in = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h1a0) ? drif_ucb_data[1] : 1'b1; 

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 ff_cke_enable  (
	.scan_in(ff_cke_enable_scanin),
	.scan_out(ff_cke_enable_scanout),
	.din(drif_cke_in),
	.dout(drif_cke_reg),
	.en(drif_cke_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////////////
// MASK REG FOR MUXING DEAD CHIP ON DIMM
// The interpretation of the parity is as following ecc[15:0] = {p0,p1,p2,p3} where p3 is not used
// failover mode.                                                                                 
// The error location is as = {err_in_p3, err_in_p2, ... err_in_d2, err_in_d1, err_in_d0}         
// If the error location bit is 1, and to create mask in failover mode set all the bits left of 1 to 1
// (including the bit 1 set in err location) upto bit location 34.
////////////////////////////////////////////////

assign drif_fail_over_mask_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h228);
assign drif_fail_over_mask_in[34:0] = drif_ucb_data[34:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_35 pff_fail_over_mask  ( // FS:wmr_protect
	.scan_in(pff_fail_over_mask_wmr_scanin),
	.scan_out(pff_fail_over_mask_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_fail_over_mask_in[34:0]),
	.dout(drif_fail_over_mask[34:0]),
	.en(drif_fail_over_mask_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign drif_fail_over_mask_l[34:0] = ~drif_fail_over_mask[34:0];

//////////////////////////////////////////////////////////////////
// Ras to Ras Delay to different bank (RRD) REGISTER - reset to 4'h2
//////////////////////////////////////////////////////////////////

assign sch_rrd_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h80);
assign rrd_reg_in[3:0] = drif_ucb_data[3:0];

assign inv_rrd_reg_in[1] = ~rrd_reg_in[1];
assign rrd_reg[1] = ~inv_rrd_reg[1];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_rrd_reg  ( // FS:wmr_protect
	.scan_in(pff_rrd_reg_wmr_scanin),
	.scan_out(pff_rrd_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({rrd_reg_in[3:2],inv_rrd_reg_in[1],rrd_reg_in[0]}),
	.en(sch_rrd_reg_en),
	.dout({rrd_reg[3:2],inv_rrd_reg[1],rrd_reg[0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Ras to Cas Delay (RCD) REGISTER - reset to 4'h3
//////////////////////////////////////////////////////////////////

assign sch_rcd_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h90);
assign rcd_reg_in[3:0] = drif_ucb_data[3:0];
                            
assign inv_rcd_reg_in[1:0] = ~rcd_reg_in[1:0];
assign rcd_reg[1:0] = ~inv_rcd_reg[1:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_rcd_reg  ( // FS:wmr_protect
	.scan_in(pff_rcd_reg_wmr_scanin),
	.scan_out(pff_rcd_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({rcd_reg_in[3:2],inv_rcd_reg_in[1:0]}),
	.en(sch_rcd_reg_en),
	.dout({rcd_reg[3:2],inv_rcd_reg[1:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Internal write to read command delay (IWTR) REGISTER - reset to 2'h2
//////////////////////////////////////////////////////////////////

// tWTR delay
assign sch_iwtr_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'he0);
assign iwtr_reg_in[1:0] = drif_ucb_data[1:0];

assign inv_iwtr_reg_in[1] = ~iwtr_reg_in[1];
assign iwtr_reg[1] = ~inv_iwtr_reg[1];

mcu_drif_ctl_msff_ctl_macro__en_1__width_2 pff_iwtr_reg  ( // FS:wmr_protect
	.scan_in(pff_iwtr_reg_wmr_scanin),
	.scan_out(pff_iwtr_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({inv_iwtr_reg_in[1],iwtr_reg_in[0]}),
	.en(sch_iwtr_reg_en),
	.dout({inv_iwtr_reg[1],iwtr_reg[0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Write to Read (CAS) Delay to any bank (WTR) REGISTER
//////////////////////////////////////////////////////////////////

// This is because CL - 1 + BL/2 + iwtr due to the WTR delay
assign sch_wtr_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h98); 
assign wtr_reg_in[3:0] = drif_ucb_data[3:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_wtr_reg  ( // FS:wmr_protect
	.scan_in(pff_wtr_reg_wmr_scanin),
	.scan_out(pff_wtr_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din(wtr_reg_in[3:0]),
	.en(sch_wtr_reg_en),
	.dout(wtr_dly_reg[3:0]),
	.l1clk(l1clk),
  .soclk(soclk));

assign wtr_reg[3:0] = wtr_dly_reg[3:0] + {1'h0, mode_reg[6:4]} + {2'h0, iwtr_reg[1:0]} + 
				(drif_single_channel_mode ? 4'h3 : 4'h1);

//////////////////////////////////////////////////////////////////
// Read to Write (CAS) Delay to any bank (RTW) REGISTER
//////////////////////////////////////////////////////////////////

// This is 4 for BL=4 or 6 for BL=8
assign sch_rtw_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'ha0);
assign rtw_reg_in[3:0] = drif_ucb_data[3:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4 pff_rtw_reg  ( // FS:wmr_protect
	.scan_in(pff_rtw_reg_wmr_scanin),
	.scan_out(pff_rtw_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rtw_reg_in[3:0]),
	.en(sch_rtw_reg_en),
	.dout(rtw_dly_reg[3:0]),
	.l1clk(l1clk),
  .soclk(soclk));

assign rtw_reg = rtw_dly_reg + (drif_single_channel_mode ? 4'h6 : 4'h4);

//////////////////////////////////////////////////////////////////
// For AUTO_PRECHARGE case, after write, the time tDAL (auto precharge
// write recovery + precharge time) has to be met. tDAL = tRP + tWR.
// We have these registers seperate as following.
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// Precharge command period for write (DAL) REGISTER
// Its CAS to RAS time period for same bank on a write with auto precharge.
// Normally tDAL = BL/2 + tRP + tWR + (Write Latency - 1)  for data to be written.
// tRP starts from last chunk of data written.
//////////////////////////////////////////////////////////////////

assign dal_reg_in[4:0] = (drif_single_channel_mode ? 5'h4 : 5'h2) + {1'b0,rp_reg[3:0]} + {1'b0,wr_reg[3:0]} + 
				({2'h0, mode_reg[6:4]} + {2'b0, ext_mode_reg1[5:3]} - 5'h1);
mcu_drif_ctl_msff_ctl_macro__width_5    ff_dal_reg  (
	.scan_in(ff_dal_reg_scanin),
	.scan_out(ff_dal_reg_scanout),
	.din(dal_reg_in[4:0]),
	.dout(dal_reg[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Precharge command period for read (RAL) Register: => max(tRAS, tRTP, AL + BL/2) + tRP 
// Its CAS to RAS time period for same bank on a read with auto precharge.
//////////////////////////////////////////////////////////////////
assign al_plus_bl_2[4:0] = {2'b0, ext_mode_reg1[5:3]} + (drif_single_channel_mode ? 5'h4 : 5'h2);

assign cmp0 = al_plus_bl_2[4:0] > {1'b0,ras_reg[3:0]};
assign cmp1 = al_plus_bl_2[4:0] > {2'b0,rtp_reg[2:0]};
assign cmp2 = {1'b0,ras_reg[3:0]} > {2'b0,rtp_reg[2:0]};

assign max_ral_delay[4:0] = ~cmp1 & ~cmp2 ? {2'b0,rtp_reg[2:0]} :
			    ~cmp0 &  cmp2 ? {1'b0,ras_reg[3:0]} : al_plus_bl_2[4:0];

assign ral_reg_in[4:0] = max_ral_delay[4:0] + {1'b0,rp_reg[3:0]};

mcu_drif_ctl_msff_ctl_macro__width_5    ff_ral_reg  (
	.scan_in(ff_ral_reg_scanin),
	.scan_out(ff_ral_reg_scanout),
	.din(ral_reg_in[4:0]),
	.dout(ral_reg[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Internal Read to Precharge command delay (tRTP) REGISTER - reset to 3'h2
//////////////////////////////////////////////////////////////////

assign sch_rtp_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'ha8);
assign rtp_reg_in[2:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'ha8) & (drif_ucb_data[2:0] > 3'h2) ? 
		drif_ucb_data[2:0] : drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'ha8) ?
		3'h2 : rtp_reg[2:0];

assign inv_rtp_reg_in[1] = ~rtp_reg_in[1];
assign rtp_reg[1] = ~inv_rtp_reg[1];

mcu_drif_ctl_msff_ctl_macro__en_1__width_3     pff_rtp_reg  ( // FS:wmr_protect
	.scan_in(pff_rtp_reg_wmr_scanin),
	.scan_out(pff_rtp_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({rtp_reg_in[2],inv_rtp_reg_in[1],rtp_reg_in[0]}),
	.en(sch_rtp_reg_en),
	.dout({rtp_reg[2],inv_rtp_reg[1],rtp_reg[0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Active to Precharge command period (tRAS) REGISTER - reset to 4'h9
//////////////////////////////////////////////////////////////////

assign sch_ras_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hb0);
assign ras_reg_in[3:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hb0) ? 
			drif_ucb_data[3:0] : ras_reg[3:0];

assign inv_ras_reg_in[1] = ~ras_reg_in[3];
assign inv_ras_reg_in[0] = ~ras_reg_in[0];
assign ras_reg[3] = ~inv_ras_reg[1];
assign ras_reg[0] = ~inv_ras_reg[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4    pff_ras_reg  ( // FS:wmr_protect
	.scan_in(pff_ras_reg_wmr_scanin),
	.scan_out(pff_ras_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({ras_reg_in[2:1],inv_ras_reg_in[1:0]}),
	.en(sch_ras_reg_en),
	.dout({ras_reg[2:1],inv_ras_reg[1:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Precharge command period (RP) REGISTER - reset to 4'h3
//////////////////////////////////////////////////////////////////

assign sch_rp_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hb8);
assign rp_reg_in[3:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hb8) ? 
			drif_ucb_data[3:0] : rp_reg;

assign inv_rp_reg_in[1:0] = ~rp_reg_in[1:0];
assign rp_reg[1:0] = ~inv_rp_reg[1:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4    pff_rp_reg  ( // FS:wmr_protect
	.scan_in(pff_rp_reg_wmr_scanin),
	.scan_out(pff_rp_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({rp_reg_in[3:2],inv_rp_reg_in[1:0]}),
	.en(sch_rp_reg_en),
	.dout({rp_reg[3:2],inv_rp_reg[1:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Ras to Ras Delay to same bank (RC) REGISTER = tRAS + tRP - reset to 5'hc
//////////////////////////////////////////////////////////////////

assign sch_rc_reg_en = sch_rp_reg_en | sch_ras_reg_en | drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h88);
assign rc_reg_in[4:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h88) ? drif_ucb_data[4:0] :
			sch_rp_reg_en ? {1'b0,ras_reg[3:0]} + {1'b0,rp_reg_in[3:0]} : 
			sch_ras_reg_en ? {1'b0,rp_reg[3:0]} + {1'b0,ras_reg_in[3:0]} : rc_reg[4:0];

assign inv_rc_reg_in[3:2] = ~rc_reg_in[3:2];
assign rc_reg[3:2] = ~inv_rc_reg[3:2];

mcu_drif_ctl_msff_ctl_macro__en_1__width_5    pff_rc_reg  ( // FS:wmr_protect
	.scan_in(pff_rc_reg_wmr_scanin),
	.scan_out(pff_rc_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({rc_reg_in[4],inv_rc_reg_in[3:2],rc_reg_in[1:0]}),
	.en(sch_rc_reg_en),
	.dout({rc_reg[4],inv_rc_reg[3:2],rc_reg[1:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Write recovery time period (WR) REGISTER - reset to 4'h3
//////////////////////////////////////////////////////////////////

assign sch_wr_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hc0);
assign wr_reg_in[3:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hc0) ? 
			drif_ucb_data[3:0] : wr_reg;

assign inv_wr_reg_in[1:0] = ~wr_reg_in[1:0];
assign wr_reg[1:0] = ~inv_wr_reg[1:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_4    pff_wr_reg  ( // FS:wmr_protect
	.scan_in(pff_wr_reg_wmr_scanin),
	.scan_out(pff_wr_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({wr_reg_in[3:2],inv_wr_reg_in[1:0]}),
	.en(sch_wr_reg_en),
	.dout({wr_reg[3:2],inv_wr_reg[1:0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Auto refresh to active time period (RFC) REGISTER - reset to 7'h27
//		127.5 ns @ 333 MHz
//////////////////////////////////////////////////////////////////
assign sch_rfc_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hc8);
assign rfc_reg_in[6:0] = drif_ucb_data[6:0];

assign rfc_reg_reset_val_in[6:0] = {rfc_reg_in[6],
					~rfc_reg_in[5],
					rfc_reg_in[4],
					rfc_reg_in[3],
					~rfc_reg_in[2],
					~rfc_reg_in[1],
					~rfc_reg_in[0]};

assign rfc_reg[6:0] = {rfc_reg_reset_val[6],
			~rfc_reg_reset_val[5],
			rfc_reg_reset_val[4],
			rfc_reg_reset_val[3],
			~rfc_reg_reset_val[2],
			~rfc_reg_reset_val[1],
			~rfc_reg_reset_val[0]};

mcu_drif_ctl_msff_ctl_macro__en_1__width_7    pff_rfc_reg  ( // FS:wmr_protect
	.scan_in(pff_rfc_reg_wmr_scanin),
	.scan_out(pff_rfc_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rfc_reg_reset_val_in[6:0]),
	.en(sch_rfc_reg_en),
	.dout(rfc_reg_reset_val[6:0]),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// MODE REGISTER SET command period (tMRD) REGISTER - reset to 2'h2
//////////////////////////////////////////////////////////////////
assign sch_mrd_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hd0);
assign mrd_reg_in[1:0] = drif_ucb_data[1:0];

assign inv_mrd_reg_in[1] = ~mrd_reg_in[1];
assign mrd_reg[1] = ~inv_mrd_reg[1];

mcu_drif_ctl_msff_ctl_macro__en_1__width_2 pff_mrd_reg  ( // FS:wmr_protect
	.scan_in(pff_mrd_reg_wmr_scanin),
	.scan_out(pff_mrd_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({inv_mrd_reg_in[1],mrd_reg_in[0]}),
	.en(sch_mrd_reg_en),
	.dout({inv_mrd_reg[1],mrd_reg[0]}),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Four Activate Window (tFAW) REGISTER - reset to 5'ha
//////////////////////////////////////////////////////////////////
assign faw_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'hd8);
assign faw_reg_in[4:0] = drif_ucb_data[4:0];

assign inv_faw_reg_in[1] = ~faw_reg_in[3];
assign inv_faw_reg_in[0] = ~faw_reg_in[1];
assign faw_reg[3] = ~inv_faw_reg[1];
assign faw_reg[1] = ~inv_faw_reg[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_5 pff_faw_reg  (   // FS:wmr_protect
	.scan_in(pff_faw_reg_wmr_scanin),
	.scan_out(pff_faw_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din({faw_reg_in[4],faw_reg_in[2],faw_reg_in[0],inv_faw_reg_in[1:0]}),
	.dout({faw_reg[4],faw_reg[2],faw_reg[0],inv_faw_reg[1:0]}),
	.en(faw_reg_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// POWER ON INIT WAIT FOR PRECHARGE. Should be 400ns - implies 
// 85 cycles (8'h55) w/ some margin at 200 MHz.
//////////////////////////////////////////////////////////////////
assign drif_precharge_wait_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'he8);
assign drif_precharge_wait_in[7:0] = drif_ucb_data[7:0];

assign drif_precharge_wait_reset_val_in[7:0] = {drif_precharge_wait_in[7],
						~drif_precharge_wait_in[6],
						drif_precharge_wait_in[5],
						~drif_precharge_wait_in[4],
						drif_precharge_wait_in[3],
						~drif_precharge_wait_in[2],
						drif_precharge_wait_in[1],
						~drif_precharge_wait_in[0]};

assign drif_precharge_wait[7:0] = {drif_precharge_wait_reset_val[7],
					~drif_precharge_wait_reset_val[6],
					drif_precharge_wait_reset_val[5],
					~drif_precharge_wait_reset_val[4],
					drif_precharge_wait_reset_val[3],
					~drif_precharge_wait_reset_val[2],
					drif_precharge_wait_reset_val[1],
					~drif_precharge_wait_reset_val[0]};
						
mcu_drif_ctl_msff_ctl_macro__en_1__width_8 ff_precharge_wait  (
	.scan_in(ff_precharge_wait_scanin),
	.scan_out(ff_precharge_wait_scanout),
	.din(drif_precharge_wait_reset_val_in[7:0]),
	.en(drif_precharge_wait_en),
	.dout(drif_precharge_wait_reset_val[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////
// DRAM ERROR INJECTION REGISTER
//////////////////////////////////////////////////////

// error injection enable
assign drif_err_inj_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h290) | 
				drif_sshot_err_reg & drif_err_injected;
assign drif_err_inj_reg_in = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h290) ? drif_ucb_data[31] : 1'b0;

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_err_inj  ( // FS:wmr_protect
	.scan_in(pff_err_inj_wmr_scanin),
	.scan_out(pff_err_inj_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_err_inj_reg_in),
	.en(drif_err_inj_reg_en),
	.dout(drif_err_inj_reg),
	.l1clk(l1clk),
  .soclk(soclk));

// turn off error injection for scrub writes
assign drif_err_inj_enable = drif_err_inj_reg & ~drif_err_state[`DRIF_ERR_READ1];

// single shot vs. continuous error injection
assign drif_sshot_err_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h290) | drif_err_injected;
assign drif_sshot_err_reg_in = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h290) ? drif_ucb_data[30] : 1'b0;

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_sshot  ( // FS:wmr_protect
	.scan_in(pff_sshot_wmr_scanin),
	.scan_out(pff_sshot_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_sshot_err_reg_in),
	.en(drif_sshot_err_reg_en),
	.dout(drif_sshot_err_reg),
	.l1clk(l1clk),
  .soclk(soclk));

// mask to XOR with ECC bits
assign drif_err_mask_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h290);
assign drif_err_mask_reg_in[15:0] = drif_ucb_data[15:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_16 pff_err_mask  ( // FS:wmr_protect
	.scan_in(pff_err_mask_wmr_scanin),
	.scan_out(pff_err_mask_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_err_mask_reg_in[15:0]),
	.en(drif_err_mask_reg_en),
	.dout(drif_err_mask_reg[15:0]),
	.l1clk(l1clk),
  .soclk(soclk));

// Generation of "drif_err_injected" signal to reset when in single shot mode

assign drif_wdq_sel = drif0_wdq_sel | drif1_wdq_sel;

mcu_drif_ctl_msff_ctl_macro ff_wdq_sel_d1 (
	.scan_in(ff_wdq_sel_d1_scanin),
	.scan_out(ff_wdq_sel_d1_scanout),
	.din(drif_wdq_sel),
	.dout(drif_wdq_sel_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_err_injected = drif_wdq_sel_d1;

//////////////////////////////////////////////////////////////////
// REFRESH counters for 266MHz, 333, and 400MHz frequency.
// We have to have one refresh for every 7.8micro seconds
// for 266 MHz, count is 7.8micro/3.75 nano = 2080 (0x820)
// for 333 MHz, count is 7.8micro/3 nano = 2600 (0xA28)
// for 400 MHz, count is 7.8micro/2.5 nano = 3120 (0xC30)
// We can also post upto 8 refreshes at a time.
//////////////////////////////////////////////////////////////////
assign drif_ref_freq_reset_val[12:0] = 13'h820;

assign drif_ref_freq_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h20); 
assign drif_ref_freq_in[12:0] = drif_ucb_data[12:0] ^ drif_ref_freq_reset_val[12:0];

assign drif_ref_freq[12:0] = drif_ref_freq_out[12:0] ^ drif_ref_freq_reset_val[12:0];
				
mcu_drif_ctl_msff_ctl_macro__en_1__width_13	pff_ref_freq  ( // FS:wmr_protect
	.scan_in(pff_ref_freq_wmr_scanin),
	.scan_out(pff_ref_freq_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_ref_freq_in[12:0]),
	.dout(drif_ref_freq_out[12:0]),
	.en(drif_ref_freq_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// refresh counter register - refresh occurs when this reaches refresh 
//	frequency register value
//////////////////////////////////////////////////////////////////
assign drif_refresh_req_picked = drif_mcu_state[3] & fbdic_sync_frame_req_l & (~drif_cmd_a_val & ~drif_cmd_a_val_d1 | 
			   drif_dram_dimm_a[2:0] != drif_refresh_rank[2:0]) & ~drif_wdq_sel_d1 &
			   (|(drif_refresh_rank_dec[15:0] & pdmc_rank_avail[15:0]));
assign drif_ref_cnt_in[12:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h38) ? drif_ucb_data[12:0] :
			 	(drif_ref_go | drif_ref_freq_en | ~fbdic_l0_state | drif_hw_selfrsh) ? 13'h0 :
				drif_ref_cnt[12:0] + 13'h1;

mcu_drif_ctl_msff_ctl_macro__width_13 ff_ref_cnt  (
	.scan_in(ff_ref_cnt_scanin),
	.scan_out(ff_ref_cnt_scanout),
	.din(drif_ref_cnt_in[12:0]),
	.dout(drif_ref_cnt[12:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_ref_go = (drif_ref_cnt[12:0] >= drif_ref_freq[12:0]) | (fbdic_l0_state & ~fbdic_l0_state_d1);

mcu_drif_ctl_msff_ctl_macro ff_l0_state_d1 (
	.scan_in(ff_l0_state_d1_scanin),
	.scan_out(ff_l0_state_d1_scanout),
	.din(fbdic_l0_state),
	.dout(fbdic_l0_state_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////////
// Logic that generates scrubbing for all address at periodic interval
//////////////////////////////////////////////////////////////////

// SCRUB ENABLE BIT
assign drif_data_scrub_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h40);
assign drif_data_scrub_en_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_1 pff_data_scrub  ( // FS:wmr_protect
	.scan_in(pff_data_scrub_wmr_scanin),
	.scan_out(pff_data_scrub_wmr_scanout),
	.siclk(aclk_wmr),
	.din(drif_data_scrub_en_in),
	.en(drif_data_scrub_en),
	.dout(drif_data_scrub_enabled),
	.l1clk(l1clk),
  .soclk(soclk));

// scrub count - scrub request is issued when this reaches scrub frequency value
assign drif_scrub_cnt_in[11:0] = drif_scrub_cnt[11:0] + 12'h1;
assign drif_scrub_cnt_reset =  ((drif_scrub_picked & drif_scrub_read_pending) | ~drif_init_mcu_done);

assign drif_scrub_cnt_en = drif_data_scrub_enabled & fbdic_l0_state & ~drif_hw_selfrsh;
mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_12 ff_scrub_cnt  (
	.scan_in(ff_scrub_cnt_scanin),
	.scan_out(ff_scrub_cnt_scanout),
	.din(drif_scrub_cnt_in[11:0]),
	.dout(drif_scrub_cnt[11:0]),
	.en(drif_scrub_cnt_en),
	.clr(drif_scrub_cnt_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Assert read valid when its time to scrub and there is no pending scrub write 
// Reset the read valid when scrub read valid is picked
assign drif_scrub_read_pending_in = (drif_scrub_cnt[11:0] >= drif_freq_scrub[11:0]) & drif_data_scrub_enabled;
assign drif_scrub_read_pending_en = drif_scrub_read_pending_in & ~drif_scrub_read_outstanding & ~drif_scrub_addr_err & 
		drif_err_fifo_empty & drif_err_fifo_empty_d1;
assign drif_scrub_read_pending_reset = drif_scrub_read_pending & drif_scrub_picked;

mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_scrub_read_pending  (
	.scan_in(ff_scrub_read_pending_scanin),
	.scan_out(ff_scrub_read_pending_scanout),
	.din(drif_scrub_read_pending_in),
	.dout(drif_scrub_read_pending),
	.clr(drif_scrub_read_pending_reset),
	.en(drif_scrub_read_pending_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// scrub outstanging - wait for signal from rdpctl that scrub request finished to reset
mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_scrub_read_out  (
	.scan_in(ff_scrub_read_out_scanin),
	.scan_out(ff_scrub_read_out_scanout),
	.din(1'b1),
	.dout(drif_scrub_read_outstanding),
	.clr(rdpctl_scrub_read_done),
	.en(drif_scrub_read_pending_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// used for incrementing power down counter
mcu_drif_ctl_msff_ctl_macro ff_scrub_read_pending_en_d1 (
	.scan_in(ff_scrub_read_pending_en_d1_scanin),
	.scan_out(ff_scrub_read_pending_en_d1_scanout),
	.din(drif_scrub_read_pending_en),
	.dout(drif_scrub_read_pending_en_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_scrub_time = drif_scrub_read_pending_en & ~drif_scrub_read_pending_en_d1;

//////////////////////////////////////
// POWER THROTTLING LOGIC
//////////////////////////////////////

//////////////////////////////////////
// Max banks open at any given time - reset to 17'h1ffff
//////////////////////////////////////

assign pt_max_banks_open_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h28);
assign pt_max_banks_open_in[16:0] =  drif_ucb_data[16:0];

assign inv_pt_max_banks_open_in[16:0] = ~pt_max_banks_open_in[16:0];
assign pt_max_banks_open[16:0] = ~inv_pt_max_banks_open[16:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_17  pff_max_banks_open  ( // FS:wmr_protect
	.scan_in(pff_max_banks_open_wmr_scanin),
	.scan_out(pff_max_banks_open_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_pt_max_banks_open_in[16:0]),
	.dout(inv_pt_max_banks_open[16:0]),
	.en(pt_max_banks_open_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////
// Max pt period time - reset to 16'hffff
//////////////////////////////////////

assign pt_max_time_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h48);
assign pt_max_time_in[15:0] = drif_ucb_data[15:0];

assign inv_pt_max_time_in[15:0] = ~pt_max_time_in[15:0];
assign pt_max_time[15:0] = ~inv_pt_max_time[15:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_16  pff_max_time  ( // FS:wmr_protect
	.scan_in(pff_max_time_wmr_scanin),
	.scan_out(pff_max_time_wmr_scanout),
	.siclk(aclk_wmr),
	.din(inv_pt_max_time_in[15:0]),
	.dout(inv_pt_max_time[15:0]),
	.en(pt_max_time_en),
	.l1clk(l1clk),
  .soclk(soclk));

// send sync signal to other MCU's to reset counters so all MCUs' power throttling is in sync
assign pt_sync_out = pt_max_time_en | pt_max_banks_open_en;

// make it two cycles long so it will be valid with the clock enable
mcu_drif_ctl_msff_ctl_macro ff_pt_sync_out_d1 (
	.scan_in(ff_pt_sync_out_d1_scanin),
	.scan_out(ff_pt_sync_out_d1_scanout),
	.din(pt_sync_out),
	.dout(pt_sync_out_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_pt_sync_out_in = pt_sync_out | pt_sync_out_d1;
mcu_drif_ctl_msff_ctl_macro__width_1  ff_pt_sync_out  (
	.scan_in(ff_pt_sync_out_scanin),
	.scan_out(ff_pt_sync_out_scanout),
	.din(mcu_pt_sync_out_in),
	.dout(mcu_pt_sync_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__width_4  ff_pt_sync  (
	.scan_in(ff_pt_sync_scanin),
	.scan_out(ff_pt_sync_scanout),
	.din({mcu_pt_sync_in0, mcu_pt_sync_in1, mcu_pt_sync_in2, mcu_pt_sync_out}),
	.dout(pt_sync[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// reset counters when time period expires or incoming syncs from register updates
assign pt_reset = (pt_time_cntr[15:0] >= pt_max_time[15:0]) | (|pt_sync[3:0]);

// number of opened banks - increment when RAS is picked for a read or write
assign pt_banks_open_en = drif_cas_picked | pt_reset;
assign pt_banks_open_in[16:0] = pt_reset ? 17'h0 : pt_banks_open[16:0] + 17'h1; 

mcu_drif_ctl_msff_ctl_macro__en_1__width_17 ff_banks_open  (
	.scan_in(ff_banks_open_scanin),
	.scan_out(ff_banks_open_scanout),
	.din(pt_banks_open_in[16:0]),
	.dout(pt_banks_open[16:0]),
	.en(pt_banks_open_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// power throttling time period counter
assign pt_time_cntr_in[15:0] = pt_reset ? 16'h0 : pt_time_cntr[15:0] + 16'b1;

mcu_drif_ctl_msff_ctl_macro__width_16 ff_time_cntr  (
	.scan_in(ff_time_cntr_scanin),
	.scan_out(ff_time_cntr_scanout),
	.din(pt_time_cntr_in[15:0]),
	.dout(pt_time_cntr[15:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// blocks new requests from issuing once open bank threshold is reached
assign drif_blk_new_openbank_in = (pt_banks_open[16:0] >= pt_max_banks_open[16:0]);

mcu_drif_ctl_msff_ctl_macro__width_1 ff_blk_openbank  (
	.scan_in(ff_blk_openbank_scanin),
	.scan_out(ff_blk_openbank_scanout),
	.din(drif_blk_new_openbank_in),
	.dout(drif_blk_new_openbank),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////
// Mode register write done 
//////////////////////////////////////

assign drif_wr_mode_reg_done_in = drif_mcu_state[1] | drif_wr_mode_reg_done;
assign wr_mode_reg_done_reset = (drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h1a0) & drif_ucb_data[0]);

mcu_drif_ctl_msff_ctl_macro__clr_1__width_1	ff_wr_mode_reg  (
	.scan_in(ff_wr_mode_reg_scanin),
	.scan_out(ff_wr_mode_reg_scanout),
	.din(drif_wr_mode_reg_done_in),
	.dout(drif_wr_mode_reg_done),
	.clr(wr_mode_reg_done_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////
// Intialization sequence done - reset when state[1] reached
//////////////////////////////////////
assign drif_init_mcu_done_in = (drif_mcu_state_next[4:0] == 5'd1) | drif_init_mcu_done & ~drif_mcu_state[0];

mcu_drif_ctl_msff_ctl_macro__width_1	ff_init_done  (
	.scan_in(ff_init_done_scanin),
	.scan_out(ff_init_done_scanout),
	.din(drif_init_mcu_done_in),
	.dout(drif_init_mcu_done),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////
// DRAM INIT STATUS REG - reset to 0, cleared when DRAM init register is writen
//////////////////////////////////////
assign drif_init_status_reg_in = (~drif_mcu_state[1] & (drif_mcu_state_next[4:0] == 5'd1)) | drif_init_status_reg;
assign int_status_reg_reset = (drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h1a0));

mcu_drif_ctl_msff_ctl_macro__clr_1__width_1 ff_init_status_reg  (
	.scan_in(ff_init_status_reg_scanin),
	.scan_out(ff_init_status_reg_scanout),
	.din(drif_init_status_reg_in),
	.dout(drif_init_status_reg),
	.clr(int_status_reg_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Generate ack valid and flop both valid and data for register reads
assign {drif_rdata_nack_vld_in,drif_rdata_ack_vld_in,drif_rdata_data_in[63:0]} = drif_read_ucb_info[65:0] | fbdic_ucb_rd_data[65:0];

mcu_drif_ctl_msff_ctl_macro__width_66   ff_ucb_data  (
	.scan_in(ff_ucb_data_scanin),
	.scan_out(ff_ucb_data_scanout),
	.din({drif_rdata_ack_vld_in, drif_rdata_nack_vld_in, drif_rdata_data_in[63:0]}),
	.dout({drif_rdata_ack_vld, drif_rdata_nack_vld, drif_rdata_data[63:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////////////
// Power down mode enable register
/////////////////////////////////////////////////////////
assign drif_pd_mode_enable_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h238);
assign drif_pd_mode_enable_in = drif_ucb_data[0];

mcu_drif_ctl_msff_ctl_macro__en_1 ff_pd_mode_enable  (
	.scan_in(ff_pd_mode_enable_scanin),
	.scan_out(ff_pd_mode_enable_scanout),
	.din(drif_pd_mode_enable_in),
	.dout(drif_pd_mode_enable),
	.en(drif_pd_mode_enable_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

/////////////////////////////////////////////////////////
// PERFORMANCE COUNTERS
/////////////////////////////////////////////////////////

assign drif_perf_cntl_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h400);
assign drif_perf_cntl_reg_in[7:0] = drif_ucb_data[7:0];

mcu_drif_ctl_msff_ctl_macro__en_1__width_8 ff_perf_cntl_reg  (
	.scan_in(ff_perf_cntl_reg_scanin),
	.scan_out(ff_perf_cntl_reg_scanout),
	.din(drif_perf_cntl_reg_in[7:0]),
	.en(drif_perf_cntl_reg_en),
	.dout(drif_perf_cntl_reg[7:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Due to timing issues we have to flop some critical siganls and then do the increment 
// of the perf counter in the following cycle.

mcu_drif_ctl_msff_ctl_macro__width_16 ff_crit_sig  (
	.scan_in(ff_crit_sig_scanin),
	.scan_out(ff_crit_sig_scanout),
	.din({drif_rd_xaction_picked, drif_wr_xaction_picked, drif_bank_busy_stall,
		drif_rd_que_latency[4:0], drif_wr_que_latency[4:0], drif_writeback_buf_hit,
		drif_rd_que_latency_adj, drif_wr_que_latency_adj}),
	.dout({drif_rd_xaction_picked_d1, drif_wr_xaction_picked_d1, drif_bank_busy_stall_d1,
		drif_rd_que_latency_noadj_d1[4:0], drif_wr_que_latency_noadj_d1[4:0], drif_writeback_buf_hit_d1,
		drif_rd_que_latency_adj_d1, drif_wr_que_latency_adj_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_rd_que_latency_d1[4:0] = drif_rd_que_latency_noadj_d1[4:0] - {4'h0,drif_rd_que_latency_adj_d1};
assign drif_wr_que_latency_d1[4:0] = drif_wr_que_latency_noadj_d1[4:0] - {4'h0,drif_wr_que_latency_adj_d1};

assign drif_perf_cnt0_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h408) | ~drif_perf_cntl_reg[7];
assign drif_perf_cnt0_reg_in[31:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h408) ? drif_ucb_data[63:32] : 
					drif_perf0_adder_out[31:0];

assign drif_perf0_adder_out[31:0] = ({1'b0, drif_perf_cnt0_reg[30:0]} + drif_perf0_adder_in[31:0]) |
					{drif_perf_cnt0_reg[31], 31'h0};

assign  drif_perf0_adder_in[31:0] = {32{drif_perf_cntl_reg[7:4] == 4'h0}} & {31'h0, drif_rd_xaction_picked_d1} |
				    {32{drif_perf_cntl_reg[7:4] == 4'h1}} & {31'h0, drif_wr_xaction_picked_d1} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h2}} & {31'h0, drif_rd_or_wr_xaction_picked_d1} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h3}} & {31'h0, drif_bank_busy_stall_d1} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h4}} & {27'h0, drif_rd_que_latency_d1[4:0]} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h5}} & {27'h0, drif_wr_que_latency_d1[4:0]} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h6}} & {26'h0, drif_rd_or_wr_que_latency_d1[5:0]} | 
				    {32{drif_perf_cntl_reg[7:4] == 4'h7}} & {31'h0, drif_writeback_buf_hit_d1}; 

mcu_drif_ctl_msff_ctl_macro__en_1__width_32 ff_perf_cnt0_reg  (
	.scan_in(ff_perf_cnt0_reg_scanin),
	.scan_out(ff_perf_cnt0_reg_scanout),
	.din(drif_perf_cnt0_reg_in),
	.en(drif_perf_cnt0_reg_en),
	.dout(drif_perf_cnt0_reg),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_perf_cnt1_reg_en = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h408) | ~drif_perf_cntl_reg[3];
assign drif_perf_cnt1_reg_in[31:0] = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h408) ? drif_ucb_data[31:0] :
                                drif_perf1_adder_out[31:0];

assign drif_perf1_adder_out[31:0] = ({1'b0, drif_perf_cnt1_reg[30:0]} + drif_perf1_adder_in[31:0]) |
					{drif_perf_cnt1_reg[31], 31'h0};

assign  drif_perf1_adder_in[31:0] = {32{drif_perf_cntl_reg[3:0] == 4'h0}} & {31'h0, drif_rd_xaction_picked_d1} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h1}} & {31'h0, drif_wr_xaction_picked_d1} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h2}} & {31'h0, drif_rd_or_wr_xaction_picked_d1} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h3}} & {31'h0, drif_bank_busy_stall_d1} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h4}} & {27'h0, drif_rd_que_latency_d1[4:0]} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h5}} & {27'h0, drif_wr_que_latency_d1[4:0]} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h6}} & {26'h0, drif_rd_or_wr_que_latency_d1[5:0]} | 
				    {32{drif_perf_cntl_reg[3:0] == 4'h7}} & {31'h0, drif_writeback_buf_hit_d1}; 

mcu_drif_ctl_msff_ctl_macro__en_1__width_32 ff_perf_cnt1_reg  (
	.scan_in(ff_perf_cnt1_reg_scanin),
	.scan_out(ff_perf_cnt1_reg_scanout),
	.din(drif_perf_cnt1_reg_in),
	.en(drif_perf_cnt1_reg_en),
	.dout(drif_perf_cnt1_reg),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// This CAS PICKED is generated to cover 2 ch mode case too! 
assign drif_cmd_write = drif_mux_write_en;

// READ XACTION
mcu_drif_ctl_msff_ctl_macro ff_raw_hazard_d1 (
	.scan_in(ff_raw_hazard_d1_scanin),
	.scan_out(ff_raw_hazard_d1_scanout),
	.din(drif_wr_entry_pend_in),
	.dout(drif_raw_hazard_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_rd_xaction_picked = drif_cas_picked & ~drif_cmd_write & ~fbdic_sync_frame_req & ~drif_raw_hazard_d1 &
				(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[4]); 

// WRITE XACTION
assign drif_wr_xaction_picked = drif_cas_picked & drif_cmd_write & ~fbdic_sync_frame_req & 
				(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[4]); 

// READ OR WRITE XACTION
assign drif_rd_or_wr_xaction_picked_d1 = drif_rd_xaction_picked_d1 | drif_wr_xaction_picked_d1;

// BANK BUSY STALLS
assign drif_bank_busy_stall = (|(drq0_rdbuf_valids[7:0] | drq1_rdbuf_valids[7:0] | 
				drq0_wrbuf_valids[7:0] | drq1_wrbuf_valids[7:0])) & 
			~( (|drif_ras_picked[15:0]) | drif_cas_picked ) & 
				(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[4]) & drif_init_status_reg;

// READ QUE LATENCY
assign drif_rd_que_latency[4:0] = ({1'b0,drq0_read_queue_cnt[3:0]} + {1'b0,drq1_read_queue_cnt[3:0]}) &
			{5{(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[3] | drif_mcu_state[4])}} &
				{5{drif_init_status_reg}}; 

assign drif_rd_que_latency_adj = (|drif_ras_picked[15:0]) & ~drif_cmd_picked & ~drif_scrub_picked &
			(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[3] | drif_mcu_state[4]) &
				drif_init_status_reg;

// WRITE QUE LATENCY
assign drif_wr_que_latency[4:0] = ({1'b0,drq0_write_queue_cnt[3:0]} + {1'b0,drq1_write_queue_cnt[3:0]}) &
			{5{(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[3] | drif_mcu_state[4])}} &
				{5{drif_init_status_reg}};

assign drif_wr_que_latency_adj = (|drif_ras_picked[15:0]) & drif_cmd_picked & ~drif_scrub_picked &
			(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[3] | drif_mcu_state[4]) &
				drif_init_status_reg;

// READ OR WRITE QUE LATENCY
assign drif_rd_or_wr_que_latency_d1[5:0] = {1'b0, drif_rd_que_latency_d1[4:0]} + {1'b0, drif_wr_que_latency_d1[4:0]};

// WRITEBACK BUFFER HITS
assign drif_writeback_buf_hit = drif_wr_entry_pend_in & drif_init_status_reg &
				(drif_mcu_state[1] | drif_mcu_state[2] | drif_mcu_state[4]);

// Register read logic
assign drif_read_ucb_info[65] = drif_ucb_rd_req_vld & ~drif_ucb_addr[11] & ~drif_read_ucb_info[64];

assign drif_read_ucb_info[64:0] = {65{drif_ucb_rd_req_vld}} &
       {{65{(drif_ucb_addr[12:0] == 13'h0)}} & {1'b1, 60'h0, drif_cas_addr_bits[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h8)}} & {1'b1, 60'h0, drif_ras_addr_bits[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h10)}} & {1'b1, 61'h0, mode_reg[6:4]} |
	{65{(drif_ucb_addr[12:0] == 13'h18)}} & {1'b1, 52'h0, drif_freq_scrub[11:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h20)}} & {1'b1, 51'h0, drif_ref_freq[12:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h28)}} & {1'b1, 47'h0, pt_max_banks_open[16:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h38)}} & {1'b1, 51'h0, drif_ref_cnt[12:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h40)}} & {1'b1, 63'h0, drif_data_scrub_enabled} |
	{65{(drif_ucb_addr[12:0] == 13'h48)}} & {1'b1, 48'h0, pt_max_time[15:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h80)}} & {1'b1, 60'h0, rrd_reg[3:0]} |
        {65{(drif_ucb_addr[12:0] == 13'h88)}} & {1'b1, 59'h0, rc_reg[4:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h90)}} & {1'b1, 60'h0, rcd_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h98)}} & {1'b1, 60'h0, wtr_dly_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'ha0)}} & {1'b1, 60'h0, rtw_dly_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'ha8)}} & {1'b1, 61'h0, rtp_reg[2:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hb0)}} & {1'b1, 60'h0, ras_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hb8)}} & {1'b1, 60'h0, rp_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hc0)}} & {1'b1, 60'h0, wr_reg[3:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hc8)}} & {1'b1, 57'h0, rfc_reg[6:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hd0)}} & {1'b1, 62'h0, mrd_reg[1:0]} |
	{65{(drif_ucb_addr[12:0] == 13'hd8)}} & {1'b1, 59'h0, faw_reg[4:0]} |
	{65{(drif_ucb_addr[12:0] == 13'he0)}} & {1'b1, 62'h0, iwtr_reg[1:0]} |
	{65{(drif_ucb_addr[12:0] == 13'he8)}} & {1'b1, 56'h0, drif_precharge_wait[7:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h108)}} & {1'b1, 63'h0, drif_stacked_dimm} |
	{65{(drif_ucb_addr[12:0] == 13'h110)}} & {1'b1, 49'h0, ext_mode_reg2[14:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h118)}} & {1'b1, 49'h0, ext_mode_reg1[14:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h120)}} & {1'b1, 49'h0, ext_mode_reg3[14:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h128)}} & {1'b1, 63'h0, drif_eight_bank_mode_mod} |
	{65{(drif_ucb_addr[12:0] == 13'h138)}} & {1'b1, 63'h0, drif_branch_disabled} |
	{65{(drif_ucb_addr[12:0] == 13'h140)}} & {1'b1, 63'h0, drif_addr_bank_low_sel} |
	{65{(drif_ucb_addr[12:0] == 13'h148)}} & {1'b1, 63'h0, drif_single_channel_mode} |
	{65{(drif_ucb_addr[12:0] == 13'h1a0)}} & {1'b1, 62'h0, drif_cke_reg, drif_init} |
	{65{(drif_ucb_addr[12:0] == 13'h208)}} & {1'b1, 63'h0, drif_wr_mode_reg_done} |
	{65{(drif_ucb_addr[12:0] == 13'h210)}} & {1'b1, 63'h0, drif_init_status_reg} | 
	{65{(drif_ucb_addr[12:0] == 13'h218)}} & {1'b1, 60'h0, drif_dimms_present} | 
	{65{(drif_ucb_addr[12:0] == 13'h220)}} & {1'b1, 63'h0, drif_fail_over_mode} | 
	{65{(drif_ucb_addr[12:0] == 13'h228)}} & {1'b1, 29'h0, drif_fail_over_mask[34:0]} | 
	{65{(drif_ucb_addr[12:0] == 13'h230)}} & {1'b1, 58'h0, rdpctl_dtm_atspeed, rdpctl_dtm_mask_chnl[1:0], 
							       rdpctl_dbg_trig_enable, rdpctl_mask_err, 
							       rdpctl_kp_lnk_up} | 
	{65{(drif_ucb_addr[12:0] == 13'h238)}} & {1'b1, 63'h0, drif_pd_mode_enable} | 
        {65{(drif_ucb_addr[12:0] == 13'h280)}} & {1'b1,        rdpctl_err_sts_reg[25:16],38'h0,rdpctl_err_sts_reg[15:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h288)}} & {1'b1, 24'h0, rdpctl_err_addr_reg[35:0], 4'h0} |
	{65{(drif_ucb_addr[12:0] == 13'h290)}} & {1'b1, 32'h0, drif_err_inj_reg, drif_sshot_err_reg, 14'h0, 
							       drif_err_mask_reg[15:0]} | 
	{65{(drif_ucb_addr[12:0] == 13'h298)}} & {1'b1, 48'h0, rdpctl_err_cnt[15:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h2a0)}} & {1'b1, 28'h0, rdpctl_err_loc[35:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h2a8)}} & {1'b1, 27'h0, rdpctl_err_retry_reg[36:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h400)}} & {1'b1, 56'h0, drif_perf_cntl_reg[7:0]} |
	{65{(drif_ucb_addr[12:0] == 13'h408)}} & {1'b1,        drif_perf_cnt0_reg[31:0],drif_perf_cnt1_reg[31:0]}};

///////////////////////////////////////////////////
// Error FIFO: when ecc error occurs, transaction is placed in this FIFO for further processing
///////////////////////////////////////////////////

mcu_drif_ctl_msff_ctl_macro__width_3 ff_scrub_wren  (
	.scan_in(ff_scrub_wren_scanin),
	.scan_out(ff_scrub_wren_scanout),
	.din({rdpctl_scrub_wren,drif_scrub_wren,drif_scrub_wren_d1}),
	.dout({drif_scrub_wren,drif_scrub_wren_d1,drif_scrub_wren_d2}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_err_fifo_deq = drif_err_state[`DRIF_ERR_READ0] & drif_err_fifo_crc & rdpctl_no_crc_err | 
			   drif_err_state[`DRIF_ERR_READ1] & drif_err_rd_picked | 
			   drif_err_state[`DRIF_ERR_WRITE] & (|readdp_ecc_multi_err[1:0]) & drif_scrub_wren |
			   drif_err_state[`DRIF_ERR_CRC_FR] & drif_err_fifo_crc & (rdpctl_no_crc_err | rdpctl_crc_err);

// if the entry dequeued from the error fifo is from a scrub,
//    need to increment the scrub address
assign drif_scrub_addr_incr = drif_err_fifo_scrub & ~drif_err_fifo_crc & drif_err_fifo_deq;

// 14 - crc/ecc error
// 13 - rank
// 12:10 - dimm
// 9:7 - bank
// 6 - parity
// 5 - scrub
// 4:2 - req queue entry
// 1 - qword id (PA[5])
// 0 - l2 bank (for which queue)

mcu_errq_ctl errq (
	.scan_in(errq_scanin),
	.scan_out(errq_scanout),
	.l1clk(l1clk),
	.errq_enq(rdpctl_err_fifo_enq),
	.errq_din(rdpctl_err_fifo_data[14:0]),
	.errq_deq(drif_err_fifo_deq),
	.errq_dout(drif_err_fifo_ent0[14:0]),
	.errq_full(drif_err_fifo_full),
	.errq_empty(drif_err_fifo_empty),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_drif_ctl_msff_ctl_macro ff_err_fifo_empty_d1 (
	.scan_in(ff_err_fifo_empty_d1_scanin),
	.scan_out(ff_err_fifo_empty_d1_scanout),
	.din(drif_err_fifo_empty),
	.dout(drif_err_fifo_empty_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_drq0_clear_ent[0] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc & 
					(drif_err_fifo_rdq_entry[2:0] == 3'h0);
assign drif_drq0_clear_ent[1] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &
					(drif_err_fifo_rdq_entry[2:0] == 3'h1);
assign drif_drq0_clear_ent[2] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h2);
assign drif_drq0_clear_ent[3] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h3);
assign drif_drq0_clear_ent[4] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h4);
assign drif_drq0_clear_ent[5] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h5);
assign drif_drq0_clear_ent[6] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h6);
assign drif_drq0_clear_ent[7] = drif_err_fifo_deq & ~drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h7);

assign drif_drq1_clear_ent[0] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h0);
assign drif_drq1_clear_ent[1] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h1);
assign drif_drq1_clear_ent[2] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h2);
assign drif_drq1_clear_ent[3] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h3);
assign drif_drq1_clear_ent[4] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h4);
assign drif_drq1_clear_ent[5] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc &  
					(drif_err_fifo_rdq_entry[2:0] == 3'h5);
assign drif_drq1_clear_ent[6] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc & 
					(drif_err_fifo_rdq_entry[2:0] == 3'h6);
assign drif_drq1_clear_ent[7] = drif_err_fifo_deq & drif_err_fifo_l2bank & ~drif_err_fifo_scrub & ~drif_err_fifo_crc & 
					(drif_err_fifo_rdq_entry[2:0] == 3'h7);

// Error handling code

// override values for address queue selects when processing errors
assign drif0_req_rdwr_addr_sel[0] = drq0_req_rdwr_addr_sel & drif_err_state[`DRIF_ERR_IDLE];
assign drif0_req_rdwr_addr_sel[1] = ~drif0_req_rdwr_addr_sel[0];
assign drif0_rd_adr_queue_sel[7:0] = drif_err_state[`DRIF_ERR_IDLE] ? drq0_rd_adr_queue_sel[7:0] : 
					drif_err_rd_adr_queue_sel[7:0];
assign drif1_req_rdwr_addr_sel[0] = drq1_req_rdwr_addr_sel & drif_err_state[`DRIF_ERR_IDLE];
assign drif1_req_rdwr_addr_sel[1] = ~drif1_req_rdwr_addr_sel[0];
assign drif1_rd_adr_queue_sel[7:0] = drif_err_state[`DRIF_ERR_IDLE] ? drq1_rd_adr_queue_sel[7:0] : 
					drif_err_rd_adr_queue_sel[7:0];

assign drif_err_rd_adr_queue_sel[7:0] = {drif_err_fifo_rdq_entry[2:0] == 3'h7, drif_err_fifo_rdq_entry[2:0] == 3'h6,
					 drif_err_fifo_rdq_entry[2:0] == 3'h5, drif_err_fifo_rdq_entry[2:0] == 3'h4,
					 drif_err_fifo_rdq_entry[2:0] == 3'h3, drif_err_fifo_rdq_entry[2:0] == 3'h2,
					 drif_err_fifo_rdq_entry[2:0] == 3'h1, drif_err_fifo_rdq_entry[2:0] == 3'h0};

// error fifo entry components
assign drif_err_fifo_crc = drif_err_fifo_ent0[14];
assign drif_err_fifo_rank_adr = drif_err_fifo_ent0[13];
assign drif_err_fifo_dimm_adr[2:0] = drif_err_fifo_ent0[12:10];
assign drif_err_fifo_bank_adr[3] = drif_eight_bank_mode_mod ? (drif_stacked_dimm ? drif_err_fifo_rank_adr :
							drif_err_fifo_dimm_adr[0]) :
						    (drif_stacked_dimm ? drif_err_fifo_dimm_adr[0] :
							drif_err_fifo_dimm_adr[1]);
assign drif_err_fifo_bank_adr[2:0] = drif_err_fifo_ent0[9:7];
assign drif_err_fifo_parity = drif_err_fifo_ent0[6];
assign drif_err_fifo_scrub = drif_err_fifo_ent0[5];
assign drif_err_fifo_rdq_entry[2:0] = drif_err_fifo_ent0[4:2];
assign drif_err_fifo_err_type = drif_err_fifo_ent0[1];
assign drif_err_fifo_l2bank = drif_err_fifo_ent0[0];

// generate signals to arbitration logic to send out error requests
assign drif_err_ready = |(drif_bank_available[15:0] & drif_err_entry_val[15:0]) & ~drif_blk_new_openbank &
			~(|dmmdly_4_activate_stall[7:0]) & fbdic_sync_frame_req_l & ~fbdic_l0s_lfsr_stall &
			~drif_crc_retry_wait & ~fbdic_error_mode & woq_empty & woq_owr_empty & ~woq_wr_error_mode & 
			(|drif_err_rank_avail[15:0]) & ~drif_cas_picked & ~woq_wdata_send;
assign drif_err_rd_ready = drif_err_ready & (drif_err_state[`DRIF_ERR_READ0] | drif_err_state[`DRIF_ERR_READ1] |
				drif_err_state[`DRIF_ERR_CRC_FR] & (fbdic_l0_state | fbdic_chnl_reset_error_mode)) &
				(|drif_dimm_err_rd_avail[7:0]);
assign drif_err_wr_ready = drif_err_ready & drif_err_wrdata_ready & (drif_err_state[`DRIF_ERR_WRITE]) &
				~fbdic_sync_frame_req_early3 & ~fbdic_sync_frame_req_early2 & 
				~fbdic_sync_frame_req_early1 & ~fbdic_sync_frame_req;

assign drif_dimm_err_rd_avail[7:0] = {drif_err_fifo_dimm_adr[2:0] == 3'h7, drif_err_fifo_dimm_adr[2:0] == 3'h6,
			     		drif_err_fifo_dimm_adr[2:0] == 3'h5, drif_err_fifo_dimm_adr[2:0] == 3'h4,
			     		drif_err_fifo_dimm_adr[2:0] == 3'h3, drif_err_fifo_dimm_adr[2:0] == 3'h2,
			     		drif_err_fifo_dimm_adr[2:0] == 3'h1, drif_err_fifo_dimm_adr[2:0] == 3'h0} &
						drif_dimm_rd_available[7:0];

assign rtr_cnt_is_zero_err = drif_err_fifo_dimm_adr[2:0] == 3'h0 & rtr_cnt_is_zero[0] |
				drif_err_fifo_dimm_adr[2:0] == 3'h1 & rtr_cnt_is_zero[1] |
				drif_err_fifo_dimm_adr[2:0] == 3'h2 & rtr_cnt_is_zero[2] |
				drif_err_fifo_dimm_adr[2:0] == 3'h3 & rtr_cnt_is_zero[3] |
				drif_err_fifo_dimm_adr[2:0] == 3'h4 & rtr_cnt_is_zero[4] |
				drif_err_fifo_dimm_adr[2:0] == 3'h5 & rtr_cnt_is_zero[5] |
				drif_err_fifo_dimm_adr[2:0] == 3'h6 & rtr_cnt_is_zero[6] |
				drif_err_fifo_dimm_adr[2:0] == 3'h7 & rtr_cnt_is_zero[7];

assign wtr_cnt_is_zero_err = drif_err_fifo_dimm_adr[2:0] == 3'h0 & wtr_cnt_is_zero[0] |
				drif_err_fifo_dimm_adr[2:0] == 3'h1 & wtr_cnt_is_zero[1] |
				drif_err_fifo_dimm_adr[2:0] == 3'h2 & wtr_cnt_is_zero[2] |
				drif_err_fifo_dimm_adr[2:0] == 3'h3 & wtr_cnt_is_zero[3] |
				drif_err_fifo_dimm_adr[2:0] == 3'h4 & wtr_cnt_is_zero[4] |
				drif_err_fifo_dimm_adr[2:0] == 3'h5 & wtr_cnt_is_zero[5] |
				drif_err_fifo_dimm_adr[2:0] == 3'h6 & wtr_cnt_is_zero[6] |
				drif_err_fifo_dimm_adr[2:0] == 3'h7 & wtr_cnt_is_zero[7];

assign wtw_cnt_is_zero_err = drif_err_fifo_dimm_adr[2:0] == 3'h0 & wtw_cnt_is_zero[0] |
				drif_err_fifo_dimm_adr[2:0] == 3'h1 & wtw_cnt_is_zero[1] |
				drif_err_fifo_dimm_adr[2:0] == 3'h2 & wtw_cnt_is_zero[2] |
				drif_err_fifo_dimm_adr[2:0] == 3'h3 & wtw_cnt_is_zero[3] |
				drif_err_fifo_dimm_adr[2:0] == 3'h4 & wtw_cnt_is_zero[4] |
				drif_err_fifo_dimm_adr[2:0] == 3'h5 & wtw_cnt_is_zero[5] |
				drif_err_fifo_dimm_adr[2:0] == 3'h6 & wtw_cnt_is_zero[6] |
				drif_err_fifo_dimm_adr[2:0] == 3'h7 & wtw_cnt_is_zero[7];

assign rtw_cnt_is_zero_err = drif_err_fifo_dimm_adr[2:0] == 3'h0 & rtw_cnt_is_zero[0] |
				drif_err_fifo_dimm_adr[2:0] == 3'h1 & rtw_cnt_is_zero[1] |
				drif_err_fifo_dimm_adr[2:0] == 3'h2 & rtw_cnt_is_zero[2] |
				drif_err_fifo_dimm_adr[2:0] == 3'h3 & rtw_cnt_is_zero[3] |
				drif_err_fifo_dimm_adr[2:0] == 3'h4 & rtw_cnt_is_zero[4] |
				drif_err_fifo_dimm_adr[2:0] == 3'h5 & rtw_cnt_is_zero[5] |
				drif_err_fifo_dimm_adr[2:0] == 3'h6 & rtw_cnt_is_zero[6] |
				drif_err_fifo_dimm_adr[2:0] == 3'h7 & rtw_cnt_is_zero[7];

assign drif_err_rd_picked = drif_err_rd_ready & rtr_cnt_is_zero_err & wtr_cnt_is_zero_err & rd_rrd_cnt_is_zero &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drif_err_fifo_dimm_adr[2:0] |
				 drif_last_rank_picked[3:0] == {drif_err_fifo_rank_adr,drif_err_fifo_dimm_adr[2:0]});
assign drif_err_wr_picked = drif_err_wr_ready & wtw_cnt_is_zero_err & rtw_cnt_is_zero_err &
				(~drif_rank_wait | drif_last_rank_picked[2:0] != drif_err_fifo_dimm_adr[2:0] |
				 drif_last_rank_picked[3:0] == {drif_err_fifo_rank_adr,drif_err_fifo_dimm_adr[2:0]});
assign drif_crc_rd_picked = drif_err_rd_picked & drif_err_fifo_crc;

assign drif_err_bank_valid[15:0] = {16{~drif_err_fifo_empty}} &
			{drif_err_fifo_bank_adr[3:0] == 4'hf, drif_err_fifo_bank_adr[3:0] == 4'he, 
			drif_err_fifo_bank_adr[3:0] == 4'hd, drif_err_fifo_bank_adr[3:0] == 4'hc, 
			drif_err_fifo_bank_adr[3:0] == 4'hb, drif_err_fifo_bank_adr[3:0] == 4'ha, 
			drif_err_fifo_bank_adr[3:0] == 4'h9, drif_err_fifo_bank_adr[3:0] == 4'h8,
			drif_err_fifo_bank_adr[3:0] == 4'h7, drif_err_fifo_bank_adr[3:0] == 4'h6, 
			drif_err_fifo_bank_adr[3:0] == 4'h5, drif_err_fifo_bank_adr[3:0] == 4'h4, 
			drif_err_fifo_bank_adr[3:0] == 4'h3, drif_err_fifo_bank_adr[3:0] == 4'h2, 
			drif_err_fifo_bank_adr[3:0] == 4'h1, drif_err_fifo_bank_adr[3:0] == 4'h0};

assign drif_err_entry_val[15:0] = drif_err_bank_valid[15:0] & {16{(((drif_refresh_rank[3:0] != 
							{drif_err_fifo_rank_adr,drif_err_fifo_dimm_adr[2:0]}) &
				(drif_mcu_state[2] | drif_mcu_state[4]) & ~drif_init) | drif_mcu_state[1])}}; 

assign drif0_err_rd_picked = drif_err_rd_picked & ~drif_err_fifo_l2bank;
assign drif0_err_wr_picked = drif_err_wr_picked & ~drif_err_fifo_l2bank;
assign drif1_err_rd_picked = drif_err_rd_picked & drif_err_fifo_l2bank;
assign drif1_err_wr_picked = drif_err_wr_picked & drif_err_fifo_l2bank;

mcu_drif_ctl_msff_ctl_macro ff_err_rd_picked_d1 (
	.scan_in(ff_err_rd_picked_d1_scanin),
	.scan_out(ff_err_rd_picked_d1_scanout),
	.din(drif_err_rd_picked),
	.dout(drif_err_rd_picked_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_drif_ctl_msff_ctl_macro__width_4 ff_err_fifo_d1  (
	.scan_in(ff_err_fifo_d1_scanin),
	.scan_out(ff_err_fifo_d1_scanout),
	.din({drif_err_fifo_crc,drif_err_fifo_rdq_entry[2:0]}),
	.dout({drif_err_fifo_crc_d1,drif_err_fifo_rdq_entry_d1[2:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign drif_crc_retry_wait_in = drif_crc_rd_picked ? 1'b1 : 
				rdpctl_no_crc_err | (rdpctl_crc_err & drif_err_state[`DRIF_ERR_CRC_FR]) | 
					fbdic_scr_frame_req_d4 | fbdic_err_fast_reset_done ? 1'b0 : drif_crc_retry_wait;
mcu_drif_ctl_msff_ctl_macro ff_crc_retry_wait (
	.scan_in(ff_crc_retry_wait_scanin),
	.scan_out(ff_crc_retry_wait_scanout),
	.din(drif_crc_retry_wait_in),
	.dout(drif_crc_retry_wait),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Error handling state machine
// 0in one_hot -var drif_err_state[4:0]
assign inv_drif_err_state_next[0] = ~drif_err_state_next[0];
assign drif_err_state[0] = ~inv_drif_err_state[0];
mcu_drif_ctl_msff_ctl_macro__width_5 ff_err_state  (
	.scan_in(ff_err_state_scanin),
	.scan_out(ff_err_state_scanout),
	.din({drif_err_state_next[4:1], inv_drif_err_state_next[0]}),
	.dout({drif_err_state[4:1], inv_drif_err_state[0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//`ifdef MCU_BUG_118947
//assign drif_scrub_wr_drop = drif_err_wrdata_ready & (fbdic_scr_frame_req_d4 | ~fbdic_l0_state);
//`endif

assign drif_err_state_next[`DRIF_ERR_IDLE]  = drif_err_state[`DRIF_ERR_IDLE] & ~drif_err_ready |
//`ifdef MCU_BUG_118947
//					      drif_err_state[`DRIF_ERR_WRITE] & 
//						((|readdp_ecc_multi_err[1:0]) & drif_scrub_wren | drif_scrub_wr_drop) |
//`else
					      drif_err_state[`DRIF_ERR_WRITE] & ((|readdp_ecc_multi_err[1:0]) & drif_scrub_wren) |
//`endif
					      drif_err_state[`DRIF_ERR_READ0] & drif_err_fifo_crc & rdpctl_no_crc_err |
					      drif_err_state[`DRIF_ERR_READ1] & drif_err_rd_picked |
					      drif_err_state[`DRIF_ERR_CRC_FR] & drif_err_fifo_crc & (rdpctl_no_crc_err |
													rdpctl_crc_err);
assign drif_err_state_next[`DRIF_ERR_READ0] = drif_err_state[`DRIF_ERR_IDLE] & drif_err_ready |
					      drif_err_state[`DRIF_ERR_READ0] & ~drif_err_rd_picked & ~drif_err_fifo_crc |
					      drif_err_state[`DRIF_ERR_READ0] & drif_err_fifo_crc & ~rdpctl_no_crc_err &
													~rdpctl_crc_err;
assign drif_err_state_next[`DRIF_ERR_WRITE] = drif_err_state[`DRIF_ERR_READ0] & drif_err_rd_picked & ~drif_err_fifo_crc | 
					      drif_err_state[`DRIF_ERR_WRITE] & ~(drif_err_wr_picked | 
//`ifdef MCU_BUG_118947
//								(|readdp_ecc_multi_err[1:0]) & drif_scrub_wren | drif_scrub_wr_drop);
//`else
										  (|readdp_ecc_multi_err[1:0]) & drif_scrub_wren);
//`endif
assign drif_err_state_next[`DRIF_ERR_READ1] = drif_err_state[`DRIF_ERR_WRITE] & drif_err_wr_picked |
					      drif_err_state[`DRIF_ERR_READ1] & ~drif_err_rd_picked;
assign drif_err_state_next[`DRIF_ERR_CRC_FR] = drif_err_state[`DRIF_ERR_READ0] & drif_err_fifo_crc & rdpctl_crc_err |
					       drif_err_state[`DRIF_ERR_CRC_FR] & drif_err_fifo_crc & ~rdpctl_no_crc_err &
													~rdpctl_crc_err;

// error signals for other modules
assign drif_err_state_crc_fr = drif_err_state[`DRIF_ERR_CRC_FR];
assign drif_mcu_error_mode_in = ~drif_err_fifo_empty | ~drif_err_state[`DRIF_ERR_IDLE] | fbdic_error_mode;

mcu_drif_ctl_msff_ctl_macro ff_mcu_error_mode (
	.scan_in(ff_mcu_error_mode_scanin),
	.scan_out(ff_mcu_error_mode_scanout),
	.din(drif_mcu_error_mode_in),
	.dout(drif_mcu_error_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Load enables for registers in rdpctl block

assign drif_err_sts_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h280);
assign drif_err_addr_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h288);
assign drif_err_cnt_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h298);
assign drif_err_loc_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h2a0);
assign drif_err_retry_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h2a8);
assign drif_dbg_trig_reg_ld = drif_ucb_wr_req_vld & (drif_ucb_addr[12:0] == 13'h230);

mcu_reqq_ctl reqq (
	.scan_in(reqq_scanin),
	.scan_out(reqq_scanout),
	.l1clk(l1clk),
	.drif_eight_bank_mode(drif_eight_bank_mode_mod),
	.drif_mcu_state_1(drif_mcu_state[1]),
	.drif_mcu_state_2(drif_mcu_state[2]),
	.drif_mcu_state_3(drif_mcu_state[3]),
	.drif_mcu_state_4(drif_mcu_state[4]),
	.drif_mcu_state_5(drif_mcu_state[5]),
	.drif_mcu_state_6(drif_mcu_state[6]),
  .woq_entry0(woq_entry0[15:0]),
  .woq_entry1(woq_entry1[15:0]),
  .woq_entry_valid(woq_entry_valid[2:0]),
  .woq_entry0_val(woq_entry0_val[15:0]),
  .woq_entry1_val(woq_entry1_val[15:0]),
  .woq_wr_bank_val(woq_wr_bank_val[15:0]),
  .woq_wdq_radr(woq_wdq_radr[4:0]),
  .woq_io_wdata_sel(woq_io_wdata_sel[1:0]),
  .woq1_wr_picked(woq1_wr_picked[2:0]),
  .woq_wr_addr_picked(woq_wr_addr_picked[9:0]),
  .woq_wr1_addr_picked(woq_wr1_addr_picked[9:0]),
  .woq_wr2_addr_picked(woq_wr2_addr_picked[9:0]),
  .woq_wr_index_picked(woq_wr_index_picked[2:0]),
  .woq_wr1_index_picked(woq_wr1_index_picked[2:0]),
  .woq_wr2_index_picked(woq_wr2_index_picked[2:0]),
  .woq_wr_wdq_index_picked(woq_wr_wdq_index_picked[2:0]),
  .woq_wr1_wdq_index_picked(woq_wr1_wdq_index_picked[2:0]),
  .woq_wr2_wdq_index_picked(woq_wr2_wdq_index_picked[2:0]),
  .woq_wr_adr_queue_sel(woq_wr_adr_queue_sel[7:0]),
  .woq_wr1_adr_queue_sel(woq_wr1_adr_queue_sel[7:0]),
  .woq_wr2_adr_queue_sel(woq_wr2_adr_queue_sel[7:0]),
  .woq_wadr_parity(woq_wadr_parity),
  .woq_wdata_wsn(woq_wdata_wsn),
  .woq_err_st_wait_free(woq_err_st_wait_free),
  .woq_err_fifo_empty(woq_err_fifo_empty),
  .woq_wr_req_out(woq_wr_req_out[1:0]),
  .woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[15:0]),
  .woq_owr_empty(woq_owr_empty),
  .woq_empty(woq_empty),
  .woq_wr_error_mode(woq_wr_error_mode),
  .woq_wdata_send(woq_wdata_send),
  .drq0_rd_adr_queue7_en(drq0_rd_adr_queue7_en),
  .drq0_rd_adr_queue6_en(drq0_rd_adr_queue6_en),
  .drq0_rd_adr_queue5_en(drq0_rd_adr_queue5_en),
  .drq0_rd_adr_queue4_en(drq0_rd_adr_queue4_en),
  .drq0_rd_adr_queue3_en(drq0_rd_adr_queue3_en),
  .drq0_rd_adr_queue2_en(drq0_rd_adr_queue2_en),
  .drq0_rd_adr_queue1_en(drq0_rd_adr_queue1_en),
  .drq0_rd_adr_queue0_en(drq0_rd_adr_queue0_en),
  .drq0_rd_adr_queue_sel(drq0_rd_adr_queue_sel[7:0]),
  .drq0_wr_adr_queue7_en(drq0_wr_adr_queue7_en),
  .drq0_wr_adr_queue6_en(drq0_wr_adr_queue6_en),
  .drq0_wr_adr_queue5_en(drq0_wr_adr_queue5_en),
  .drq0_wr_adr_queue4_en(drq0_wr_adr_queue4_en),
  .drq0_wr_adr_queue3_en(drq0_wr_adr_queue3_en),
  .drq0_wr_adr_queue2_en(drq0_wr_adr_queue2_en),
  .drq0_wr_adr_queue1_en(drq0_wr_adr_queue1_en),
  .drq0_wr_adr_queue0_en(drq0_wr_adr_queue0_en),
  .drq0_req_rdwr_addr_sel(drq0_req_rdwr_addr_sel),
  .drq0_rdbuf_valids(drq0_rdbuf_valids[7:0]),
  .drq0_wrbuf_valids(drq0_wrbuf_valids[7:0]),
  .drq0_pending_wr_req(drq0_pending_wr_req[7:0]),
  .drq0_read_queue_cnt(drq0_read_queue_cnt[3:0]),
  .drq0_write_queue_cnt(drq0_write_queue_cnt[3:0]),
  .drq0_rd_entry0_val(drq0_rd_entry0_val[15:0]),
  .drq0_rd_entry1_val(drq0_rd_entry1_val[15:0]),
  .drq0_rd_entry2_val(drq0_rd_entry2_val[15:0]),
  .drq0_rd_entry3_val(drq0_rd_entry3_val[15:0]),
  .drq0_rd_entry4_val(drq0_rd_entry4_val[15:0]),
  .drq0_rd_entry5_val(drq0_rd_entry5_val[15:0]),
  .drq0_rd_entry6_val(drq0_rd_entry6_val[15:0]),
  .drq0_rd_entry7_val(drq0_rd_entry7_val[15:0]),
  .drq0_rd_bank_val(drq0_rd_bank_val[15:0]),
  .drq0_rd_entry0_rank(drq0_rd_entry0_rank),
  .drq0_rd_entry1_rank(drq0_rd_entry1_rank),
  .drq0_rd_entry2_rank(drq0_rd_entry2_rank),
  .drq0_rd_entry3_rank(drq0_rd_entry3_rank),
  .drq0_rd_entry4_rank(drq0_rd_entry4_rank),
  .drq0_rd_entry5_rank(drq0_rd_entry5_rank),
  .drq0_rd_entry6_rank(drq0_rd_entry6_rank),
  .drq0_rd_entry7_rank(drq0_rd_entry7_rank),
  .drq0_wr_entry0_rank(drq0_wr_entry0_rank),
  .drq0_wr_entry1_rank(drq0_wr_entry1_rank),
  .drq0_wr_entry2_rank(drq0_wr_entry2_rank),
  .drq0_wr_entry3_rank(drq0_wr_entry3_rank),
  .drq0_wr_entry4_rank(drq0_wr_entry4_rank),
  .drq0_wr_entry5_rank(drq0_wr_entry5_rank),
  .drq0_wr_entry6_rank(drq0_wr_entry6_rank),
  .drq0_wr_entry7_rank(drq0_wr_entry7_rank),
  .drq0_rd_entry0_dimm(drq0_rd_entry0_dimm[2:0]),
  .drq0_rd_entry1_dimm(drq0_rd_entry1_dimm[2:0]),
  .drq0_rd_entry2_dimm(drq0_rd_entry2_dimm[2:0]),
  .drq0_rd_entry3_dimm(drq0_rd_entry3_dimm[2:0]),
  .drq0_rd_entry4_dimm(drq0_rd_entry4_dimm[2:0]),
  .drq0_rd_entry5_dimm(drq0_rd_entry5_dimm[2:0]),
  .drq0_rd_entry6_dimm(drq0_rd_entry6_dimm[2:0]),
  .drq0_rd_entry7_dimm(drq0_rd_entry7_dimm[2:0]),
  .drq0_wr_entry0_dimm(drq0_wr_entry0_dimm[2:0]),
  .drq0_wr_entry1_dimm(drq0_wr_entry1_dimm[2:0]),
  .drq0_wr_entry2_dimm(drq0_wr_entry2_dimm[2:0]),
  .drq0_wr_entry3_dimm(drq0_wr_entry3_dimm[2:0]),
  .drq0_wr_entry4_dimm(drq0_wr_entry4_dimm[2:0]),
  .drq0_wr_entry5_dimm(drq0_wr_entry5_dimm[2:0]),
  .drq0_wr_entry6_dimm(drq0_wr_entry6_dimm[2:0]),
  .drq0_wr_entry7_dimm(drq0_wr_entry7_dimm[2:0]),
  .drq0_rd_addr_picked(drq0_rd_addr_picked[9:0]),
  .drq0_rdq_free(drq0_rdq_free),
  .drq0_rdq_full(drq0_rdq_full),
  .drq0_empty(drq0_empty),
  .drq0_rd_index_picked(drq0_rd_index_picked[2:0]),
  .drq0_wr_index_picked(drq0_wr_index_picked[2:0]),
  .drq0_wr_id_picked(drq0_wr_id_picked[2:0]),
  .drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[15:0]),
  .drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[15:0]),
  .drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[15:0]),
  .woq0_wdq_rd(woq0_wdq_rd),
  .woq0_wdq_entry_free(woq0_wdq_entry_free[7:0]),
  .drq0_rd_req(drq0_rd_req),
  .drq0_wr_req(drq0_wr_req),
  .drif0_raw_hazard(drif0_raw_hazard),
  .l2if0_rd_req(l2if0_rd_req),
  .l2if0_wr_req(l2if0_wr_req),
  .drif0_cpu_wr_addr(drif0_cpu_wr_addr[2:0]),
  .l2if0_wdq_in_cntr(l2if0_wdq_in_cntr[3:0]),
  .l2b0_rd_rank_adr(l2b0_rd_rank_adr),
  .l2b0_rd_dimm_adr(l2b0_rd_dimm_adr[2:0]),
  .l2b0_rd_bank_adr(l2b0_rd_bank_adr[2:0]),
  .l2b0_rd_addr_err(l2b0_rd_addr_err),
  .l2b0_rd_addr_par(l2b0_rd_addr_par),
  .l2b0_wr_rank_adr(l2b0_wr_rank_adr),
  .l2b0_wr_dimm_adr(l2b0_wr_dimm_adr[2:0]),
  .l2b0_wr_bank_adr(l2b0_wr_bank_adr[2:0]),
  .l2b0_wr_addr_err(l2b0_wr_addr_err),
  .l2b0_wr_addr_par(l2b0_wr_addr_par),
  .rdpctl_drq0_clear_ent(rdpctl_drq0_clear_ent[7:0]),
  .drif_drq0_clear_ent(drif_drq0_clear_ent[7:0]),
  .drif0_rd_entry_picked(drif0_rd_entry_picked[7:0]),
  .drq1_rd_adr_queue7_en(drq1_rd_adr_queue7_en),
  .drq1_rd_adr_queue6_en(drq1_rd_adr_queue6_en),
  .drq1_rd_adr_queue5_en(drq1_rd_adr_queue5_en),
  .drq1_rd_adr_queue4_en(drq1_rd_adr_queue4_en),
  .drq1_rd_adr_queue3_en(drq1_rd_adr_queue3_en),
  .drq1_rd_adr_queue2_en(drq1_rd_adr_queue2_en),
  .drq1_rd_adr_queue1_en(drq1_rd_adr_queue1_en),
  .drq1_rd_adr_queue0_en(drq1_rd_adr_queue0_en),
  .drq1_rd_adr_queue_sel(drq1_rd_adr_queue_sel[7:0]),
  .drq1_wr_adr_queue7_en(drq1_wr_adr_queue7_en),
  .drq1_wr_adr_queue6_en(drq1_wr_adr_queue6_en),
  .drq1_wr_adr_queue5_en(drq1_wr_adr_queue5_en),
  .drq1_wr_adr_queue4_en(drq1_wr_adr_queue4_en),
  .drq1_wr_adr_queue3_en(drq1_wr_adr_queue3_en),
  .drq1_wr_adr_queue2_en(drq1_wr_adr_queue2_en),
  .drq1_wr_adr_queue1_en(drq1_wr_adr_queue1_en),
  .drq1_wr_adr_queue0_en(drq1_wr_adr_queue0_en),
  .drq1_req_rdwr_addr_sel(drq1_req_rdwr_addr_sel),
  .drq1_rdbuf_valids(drq1_rdbuf_valids[7:0]),
  .drq1_wrbuf_valids(drq1_wrbuf_valids[7:0]),
  .drq1_pending_wr_req(drq1_pending_wr_req[7:0]),
  .drq1_read_queue_cnt(drq1_read_queue_cnt[3:0]),
  .drq1_write_queue_cnt(drq1_write_queue_cnt[3:0]),
  .drq1_rd_entry0_val(drq1_rd_entry0_val[15:0]),
  .drq1_rd_entry1_val(drq1_rd_entry1_val[15:0]),
  .drq1_rd_entry2_val(drq1_rd_entry2_val[15:0]),
  .drq1_rd_entry3_val(drq1_rd_entry3_val[15:0]),
  .drq1_rd_entry4_val(drq1_rd_entry4_val[15:0]),
  .drq1_rd_entry5_val(drq1_rd_entry5_val[15:0]),
  .drq1_rd_entry6_val(drq1_rd_entry6_val[15:0]),
  .drq1_rd_entry7_val(drq1_rd_entry7_val[15:0]),
  .drq1_rd_bank_val(drq1_rd_bank_val[15:0]),
  .drq1_rd_entry0_rank(drq1_rd_entry0_rank),
  .drq1_rd_entry1_rank(drq1_rd_entry1_rank),
  .drq1_rd_entry2_rank(drq1_rd_entry2_rank),
  .drq1_rd_entry3_rank(drq1_rd_entry3_rank),
  .drq1_rd_entry4_rank(drq1_rd_entry4_rank),
  .drq1_rd_entry5_rank(drq1_rd_entry5_rank),
  .drq1_rd_entry6_rank(drq1_rd_entry6_rank),
  .drq1_rd_entry7_rank(drq1_rd_entry7_rank),
  .drq1_wr_entry0_rank(drq1_wr_entry0_rank),
  .drq1_wr_entry1_rank(drq1_wr_entry1_rank),
  .drq1_wr_entry2_rank(drq1_wr_entry2_rank),
  .drq1_wr_entry3_rank(drq1_wr_entry3_rank),
  .drq1_wr_entry4_rank(drq1_wr_entry4_rank),
  .drq1_wr_entry5_rank(drq1_wr_entry5_rank),
  .drq1_wr_entry6_rank(drq1_wr_entry6_rank),
  .drq1_wr_entry7_rank(drq1_wr_entry7_rank),
  .drq1_rd_entry0_dimm(drq1_rd_entry0_dimm[2:0]),
  .drq1_rd_entry1_dimm(drq1_rd_entry1_dimm[2:0]),
  .drq1_rd_entry2_dimm(drq1_rd_entry2_dimm[2:0]),
  .drq1_rd_entry3_dimm(drq1_rd_entry3_dimm[2:0]),
  .drq1_rd_entry4_dimm(drq1_rd_entry4_dimm[2:0]),
  .drq1_rd_entry5_dimm(drq1_rd_entry5_dimm[2:0]),
  .drq1_rd_entry6_dimm(drq1_rd_entry6_dimm[2:0]),
  .drq1_rd_entry7_dimm(drq1_rd_entry7_dimm[2:0]),
  .drq1_wr_entry0_dimm(drq1_wr_entry0_dimm[2:0]),
  .drq1_wr_entry1_dimm(drq1_wr_entry1_dimm[2:0]),
  .drq1_wr_entry2_dimm(drq1_wr_entry2_dimm[2:0]),
  .drq1_wr_entry3_dimm(drq1_wr_entry3_dimm[2:0]),
  .drq1_wr_entry4_dimm(drq1_wr_entry4_dimm[2:0]),
  .drq1_wr_entry5_dimm(drq1_wr_entry5_dimm[2:0]),
  .drq1_wr_entry6_dimm(drq1_wr_entry6_dimm[2:0]),
  .drq1_wr_entry7_dimm(drq1_wr_entry7_dimm[2:0]),
  .drq1_rd_addr_picked(drq1_rd_addr_picked[9:0]),
  .drq1_rdq_free(drq1_rdq_free),
  .woq1_wdq_entry_free(woq1_wdq_entry_free[7:0]),
  .drq1_rdq_full(drq1_rdq_full),
  .drq1_empty(drq1_empty),
  .drq1_rd_index_picked(drq1_rd_index_picked[2:0]),
  .drq1_wr_index_picked(drq1_wr_index_picked[2:0]),
  .drq1_wr_id_picked(drq1_wr_id_picked[2:0]),
  .drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[15:0]),
  .drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[15:0]),
  .drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[15:0]),
  .woq1_wdq_rd(woq1_wdq_rd),
  .drq1_rd_req(drq1_rd_req),
  .drq1_wr_req(drq1_wr_req),
  .woq_err_pdm_wr_incr(woq_err_pdm_wr_incr[15:0]),
  .woq_err_pdm_wr_decr(woq_err_pdm_wr_decr[15:0]),
  .drif1_raw_hazard(drif1_raw_hazard),
  .l2if1_rd_req(l2if1_rd_req),
  .l2if1_wr_req(l2if1_wr_req),
  .drif1_cpu_wr_addr(drif1_cpu_wr_addr[2:0]),
  .l2if1_wdq_in_cntr(l2if1_wdq_in_cntr[3:0]),
  .l2b1_rd_rank_adr(l2b1_rd_rank_adr),
  .l2b1_rd_dimm_adr(l2b1_rd_dimm_adr[2:0]),
  .l2b1_rd_bank_adr(l2b1_rd_bank_adr[2:0]),
  .l2b1_rd_addr_err(l2b1_rd_addr_err),
  .l2b1_rd_addr_par(l2b1_rd_addr_par),
  .l2b1_wr_rank_adr(l2b1_wr_rank_adr),
  .l2b1_wr_dimm_adr(l2b1_wr_dimm_adr[2:0]),
  .l2b1_wr_bank_adr(l2b1_wr_bank_adr[2:0]),
  .l2b1_wr_addr_err(l2b1_wr_addr_err),
  .l2b1_wr_addr_par(l2b1_wr_addr_par),
  .rdpctl_drq1_clear_ent(rdpctl_drq1_clear_ent[7:0]),
  .drif_drq1_clear_ent(drif_drq1_clear_ent[7:0]),
  .drif1_rd_entry_picked(drif1_rd_entry_picked[7:0]),
  .drif_wr_entry_picked(drif_wr_entry_picked[2:0]),
  .drif_init(drif_init),
  .drif_init_mcu_done(drif_init_mcu_done),
  .drif_cmd_picked(drif_cmd_picked),
  .drif_blk_new_openbank(drif_blk_new_openbank),
  .drif_refresh_rank(drif_refresh_rank[3:0]),
  .drif_rd_picked(drif_rd_picked),
  .drif_wr_picked(drif_wr_picked),
  .drif_stacked_dimm(drif_stacked_dimm),
  .drif_sync_frame_req_l(drif_sync_frame_req_l),
  .drif_sync_frame_req_early3_l(drif_sync_frame_req_early3_l),
  .drif_single_channel_mode(drif_single_channel_mode),
  .drif_pd_mode_pending(drif_pd_mode_pending),
  .drif_err_fifo_empty(drif_err_fifo_empty),
  .pdmc_rank_avail(pdmc_rank_avail[15:0]),
  .drif_dimm_rd_available(drif_dimm_rd_available[7:0]),
  .drif_dimm_wr_available(drif_dimm_wr_available[7:0]),
  .drif_wr_bc_stall(drif_wr_bc_stall),
  .drif_hw_selfrsh(drif_hw_selfrsh),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_chnl_reset_error_mode(fbdic_chnl_reset_error_mode),
  .drif_woq_free(drif_woq_free[1:0]),
  .fbdic_clear_wrq_ent(fbdic_clear_wrq_ent),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .fbdic_error_mode(fbdic_error_mode),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Scrub address
assign drif_scrub_addr_in[31:0] = drif_scrub_addr[31:0] + 32'h1;
assign drif_scrub_addr_en = rdpctl_scrub_addrinc_en | drif_scrub_addr_incr;
assign drif_scrub_addr_clr = drif_scrub_addr_err;

mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_32 ff_scrub_addr  (
	.scan_in(ff_scrub_addr_scanin),
	.scan_out(ff_scrub_addr_scanout),
	.din(drif_scrub_addr_in[31:0]),
	.dout(drif_scrub_addr[31:0]),
	.en(drif_scrub_addr_en),
	.clr(drif_scrub_addr_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_adrgen_ctl adrgen (
	.scan_in(adrgen_scanin),
	.scan_out(adrgen_scanout),
	.l1clk(l1clk),
	.adrgen_rank(drif_scrub_rank_adr),
	.adrgen_dimm(drif_scrub_dimm_adr[2:0]),
	.adrgen_bank(drif_scrub_bank_adr[2:0]),
	.adrgen_row_addr(drif_scrub_ras_adr[14:0]),
	.adrgen_col_addr(drif_scrub_cas_adr[10:0]),
	.adrgen_addr_err(drif_scrub_addr_err_out),
	.adrgen_addr_parity(drif_scrub_addr_parity),
	.addr_39to9(drif_scrub_addr[31:1]),
	.addr_6to5({drif_scrub_addr[0],1'b0}),
	.stacked_dimm(drif_stacked_dimm),
	.addr_bank_low_sel(drif_addr_bank_low_sel),
	.mem_type(drif_mem_type[1:0]),
	.sngl_chnl_mode(drif_single_channel_mode),
	.num_dimms(drif_num_dimms[2:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

assign drif_scrub_addr_err = drif_scrub_addr_err_out | drif_scrub_addr[31] & drif_single_channel_mode;

assign drif_pd_mode_scrub_rank[15:0] = {{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'hf,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'he,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'hd,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'hc,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'hb,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'ha,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h9,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h8,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h7,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h6,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h5,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h4,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h3,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h2,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h1,
					{drif_scrub_rank_adr, drif_scrub_dimm_adr[2:0]} == 4'h0};
assign drif_pd_mode_scrub_incr[15:0] = {16{drif_scrub_time}} & drif_pd_mode_scrub_rank[15:0];
assign drif_pd_mode_scrub_decr[15:0] = {16{drif_scrub_picked}} & drif_pd_mode_scrub_rank[15:0];
assign drif_scrub_rank_avail[15:0] = drif_pd_mode_scrub_rank[15:0] & pdmc_rank_avail[15:0] & 
					{drif_dimm_rd_available[7:0],drif_dimm_rd_available[7:0]};

// Power down mode counter: increment when xactions placed in error FIFO
assign drif_pd_mode_err_incr[15:0] = {16{rdpctl_err_fifo_enq}} &
					{rdpctl_err_fifo_data[13:10] == 4'hf,
					 rdpctl_err_fifo_data[13:10] == 4'he,
					 rdpctl_err_fifo_data[13:10] == 4'hd,
					 rdpctl_err_fifo_data[13:10] == 4'hc,
					 rdpctl_err_fifo_data[13:10] == 4'hb,
					 rdpctl_err_fifo_data[13:10] == 4'ha,
					 rdpctl_err_fifo_data[13:10] == 4'h9,
					 rdpctl_err_fifo_data[13:10] == 4'h8,
					 rdpctl_err_fifo_data[13:10] == 4'h7,
					 rdpctl_err_fifo_data[13:10] == 4'h6,
					 rdpctl_err_fifo_data[13:10] == 4'h5,
					 rdpctl_err_fifo_data[13:10] == 4'h4,
					 rdpctl_err_fifo_data[13:10] == 4'h3,
					 rdpctl_err_fifo_data[13:10] == 4'h2,
					 rdpctl_err_fifo_data[13:10] == 4'h1,
					 rdpctl_err_fifo_data[13:10] == 4'h0};

// Power down mode counter: decrement on FIFO dequeue
assign drif_pd_mode_err_decr[15:0] = {16{drif_err_fifo_deq}} & drif_pd_mode_err_rank[15:0];

assign drif_pd_mode_err_rank[15:0] = {{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'hf,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'he,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'hd,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'hc,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'hb,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'ha,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h9,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h8,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h7,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h6,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h5,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h4,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h3,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h2,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h1,
					{drif_err_fifo_rank_adr, drif_err_fifo_dimm_adr[2:0]} == 4'h0};

assign drif_err_rank_avail[15:0] = drif_pd_mode_err_rank[15:0] & pdmc_rank_avail[15:0];

//
assign drif_pd_mode_pending = drif_pd_mode_exit_pending | drif_pd_mode_enter_pending;
assign drif_pd_mode_exit_pending = (|pdmc_pdx_pending[15:0]) & ~fbdic_error_mode &
				(~drif_cmd_a_val & ~drif_cmd_a_val_d1 | drif_dram_dimm_a[2:0] != drif_pd_mode_exit_dimm[2:0]) &
				(~drif_cmd_b_val & ~drif_cmd_b_val_d1 | drif_dram_dimm_b[2:0] != drif_pd_mode_exit_dimm[2:0]) &
				(~drif_refresh_req_picked | drif_refresh_rank[2:0] != drif_pd_mode_exit_dimm[2:0]);
assign drif_pd_mode_enter_pending = (|pdmc_pde_pending[15:0]) & ~fbdic_error_mode & 
				(~drif_cmd_a_val & ~drif_cmd_a_val_d1 | drif_dram_dimm_a[2:0] != drif_pd_mode_enter_dimm[2:0]) &
				(~drif_cmd_b_val & ~drif_cmd_b_val_d1 | drif_dram_dimm_b[2:0] != drif_pd_mode_enter_dimm[2:0]) &
				(~drif_refresh_req_picked | drif_refresh_rank[2:0] != drif_pd_mode_enter_dimm[2:0]);

assign drif_pdx_issued[15:0] = {16{~(drif_wdq_sel_d1 | drif_scrub_data_rden_en_d1) & 
				~drif_cmd_c_val & ~drif_cmd_c_val_d1 & 
				drif_pd_mode_exit_pending & fbdic_sync_frame_req_l}} &
				pdmc_pdx_pending_priority[15:0];
assign drif_pde_issued[15:0] = {16{~(drif_wdq_sel_d1 | drif_scrub_data_rden_en_d1) & 
				~drif_cmd_c_val & ~drif_cmd_c_val_d1 & 
				~drif_pd_mode_exit_pending & drif_pd_mode_enter_pending & 
				fbdic_sync_frame_req_l}} & pdmc_pde_pending_priority[15:0];

assign {drif_pd_mode_exit_rank, drif_pd_mode_exit_dimm[2:0]} = pdmc_pdx_pending[0] ? 4'h0 :
								pdmc_pdx_pending[1] ? 4'h1 :
								pdmc_pdx_pending[2] ? 4'h2 :
								pdmc_pdx_pending[3] ? 4'h3 :
								pdmc_pdx_pending[4] ? 4'h4 :
								pdmc_pdx_pending[5] ? 4'h5 :
								pdmc_pdx_pending[6] ? 4'h6 :
								pdmc_pdx_pending[7] ? 4'h7 :
								pdmc_pdx_pending[8] ? 4'h8 :
								pdmc_pdx_pending[9] ? 4'h9 :
								pdmc_pdx_pending[10] ? 4'ha :
								pdmc_pdx_pending[11] ? 4'hb :
								pdmc_pdx_pending[12] ? 4'hc :
								pdmc_pdx_pending[13] ? 4'hd :
								pdmc_pdx_pending[14] ? 4'he : 4'hf;

assign pdmc_pdx_pending_priority[15:0] = pdmc_pdx_pending[0] ? 16'h0001 :
					 pdmc_pdx_pending[1] ? 16'h0002 :
					 pdmc_pdx_pending[2] ? 16'h0004 :
					 pdmc_pdx_pending[3] ? 16'h0008 :
					 pdmc_pdx_pending[4] ? 16'h0010 :
					 pdmc_pdx_pending[5] ? 16'h0020 :
					 pdmc_pdx_pending[6] ? 16'h0040 :
					 pdmc_pdx_pending[7] ? 16'h0080 :
					 pdmc_pdx_pending[8] ? 16'h0100 :
					 pdmc_pdx_pending[9] ? 16'h0200 :
					 pdmc_pdx_pending[10] ? 16'h0400 :
					 pdmc_pdx_pending[11] ? 16'h0800 :
					 pdmc_pdx_pending[12] ? 16'h1000 :
					 pdmc_pdx_pending[13] ? 16'h2000 :
					 pdmc_pdx_pending[14] ? 16'h4000 :
					 pdmc_pdx_pending[15] ? 16'h8000 : 16'h0000;

assign {drif_pd_mode_enter_rank, drif_pd_mode_enter_dimm[2:0]} = pdmc_pde_pending[0] ? 4'h0 :
								pdmc_pde_pending[1] ? 4'h1 :
								pdmc_pde_pending[2] ? 4'h2 :
								pdmc_pde_pending[3] ? 4'h3 :
								pdmc_pde_pending[4] ? 4'h4 :
								pdmc_pde_pending[5] ? 4'h5 :
								pdmc_pde_pending[6] ? 4'h6 :
								pdmc_pde_pending[7] ? 4'h7 :
								pdmc_pde_pending[8] ? 4'h8 :
								pdmc_pde_pending[9] ? 4'h9 :
								pdmc_pde_pending[10] ? 4'ha :
								pdmc_pde_pending[11] ? 4'hb :
								pdmc_pde_pending[12] ? 4'hc :
								pdmc_pde_pending[13] ? 4'hd :
								pdmc_pde_pending[14] ? 4'he : 4'hf;

assign pdmc_pde_pending_priority[15:0] = pdmc_pde_pending[0] ? 16'h0001 :
					 pdmc_pde_pending[1] ? 16'h0002 :
					 pdmc_pde_pending[2] ? 16'h0004 :
					 pdmc_pde_pending[3] ? 16'h0008 :
					 pdmc_pde_pending[4] ? 16'h0010 :
					 pdmc_pde_pending[5] ? 16'h0020 :
					 pdmc_pde_pending[6] ? 16'h0040 :
					 pdmc_pde_pending[7] ? 16'h0080 :
					 pdmc_pde_pending[8] ? 16'h0100 :
					 pdmc_pde_pending[9] ? 16'h0200 :
					 pdmc_pde_pending[10] ? 16'h0400 :
					 pdmc_pde_pending[11] ? 16'h0800 :
					 pdmc_pde_pending[12] ? 16'h1000 :
					 pdmc_pde_pending[13] ? 16'h2000 :
					 pdmc_pde_pending[14] ? 16'h4000 :
					 pdmc_pde_pending[15] ? 16'h8000 : 16'h0000;

assign drif_num_dimm_dec[7:0] = {8{drif_pd_mode_enable}} &
				{{7'h0,    drif_num_dimms[2:0] == 3'h1  } | 
				 {6'h0, {2{drif_num_dimms[2:0] == 3'h2}}} | 
				 {5'h0, {3{drif_num_dimms[2:0] == 3'h3}}} | 
				 {4'h0, {4{drif_num_dimms[2:0] == 3'h4}}} | 
				 {3'h0, {5{drif_num_dimms[2:0] == 3'h5}}} | 
				 {2'h0, {6{drif_num_dimms[2:0] == 3'h6}}} | 
				 {1'h0, {7{drif_num_dimms[2:0] == 3'h7}}} |
				        {8{drif_num_dimms[2:0] == 3'h0}}};

assign drif_pdmc_enable[15:8] = drif_stacked_dimm ? drif_num_dimm_dec[7:0] : 8'h0;
assign drif_pdmc_enable[7:0] = drif_num_dimm_dec[7:0];

assign drif_refresh_rank_dec[15:0] = {drif_refresh_rank[3:0] == 4'hf,
				  drif_refresh_rank[3:0] == 4'he,
				  drif_refresh_rank[3:0] == 4'hd,
				  drif_refresh_rank[3:0] == 4'hc,
				  drif_refresh_rank[3:0] == 4'hb,
				  drif_refresh_rank[3:0] == 4'ha,
				  drif_refresh_rank[3:0] == 4'h9,
				  drif_refresh_rank[3:0] == 4'h8,
				  drif_refresh_rank[3:0] == 4'h7,
				  drif_refresh_rank[3:0] == 4'h6,
				  drif_refresh_rank[3:0] == 4'h5,
				  drif_refresh_rank[3:0] == 4'h4,
				  drif_refresh_rank[3:0] == 4'h3,
				  drif_refresh_rank[3:0] == 4'h2,
				  drif_refresh_rank[3:0] == 4'h1,
				  drif_refresh_rank[3:0] == 4'h0};

assign drif_refresh_mode[15:0] = {16{(|drif_mcu_state[4:2])}} & drif_refresh_rank_dec[15:0] | {16{(|drif_mcu_state[6:5]) | drif_hw_selfrsh}};
				  
// block transactions to opposite rank of DIMM with pending Power Down mode transaction
assign pdmc_rank_avail[15:0] = pdmc_rank_avail_out[15:0] & 
				{~pdmc_pde_pending[7:0],~pdmc_pde_pending[15:8]} & 
				{~pdmc_pdx_pending[7:0],~pdmc_pdx_pending[15:8]};

// Power down mode counters
mcu_pdmc_ctl pdmc0 (
	.scan_in(pdmc0_scanin),
	.scan_out(pdmc0_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[0]),
	.pdmc_pdx_pending(pdmc_pdx_pending[0]),
	.pdmc_rank_avail(pdmc_rank_avail_out[0]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[0]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[0]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[0]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[0]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[0]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[0]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[0]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[0]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[0]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[0]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[0]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[0]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[0]),
	.drif_pdx_issued(drif_pdx_issued[0]),
	.drif_pde_issued(drif_pde_issued[0]),
	.drif_pdmc_enable(drif_pdmc_enable[0]),
	.drif_refresh_mode(drif_refresh_mode[0]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .drif_pdmc_idle(drif_pdmc_idle),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmc_ctl pdmc1 (
	.scan_in(pdmc1_scanin),
	.scan_out(pdmc1_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[1]),
	.pdmc_pdx_pending(pdmc_pdx_pending[1]),
	.pdmc_rank_avail(pdmc_rank_avail_out[1]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[1]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[1]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[1]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[1]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[1]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[1]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[1]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[1]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[1]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[1]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[1]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[1]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[1]),
	.drif_pdx_issued(drif_pdx_issued[1]),
	.drif_pde_issued(drif_pde_issued[1]),
	.drif_pdmc_enable(drif_pdmc_enable[1]),
	.drif_refresh_mode(drif_refresh_mode[1]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .drif_pdmc_idle(drif_pdmc_idle),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmc_ctl pdmc2 (
	.scan_in(pdmc2_scanin),
	.scan_out(pdmc2_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[2]),
	.pdmc_pdx_pending(pdmc_pdx_pending[2]),
	.pdmc_rank_avail(pdmc_rank_avail_out[2]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[2]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[2]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[2]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[2]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[2]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[2]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[2]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[2]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[2]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[2]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[2]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[2]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[2]),
	.drif_pdx_issued(drif_pdx_issued[2]),
	.drif_pde_issued(drif_pde_issued[2]),
	.drif_pdmc_enable(drif_pdmc_enable[2]),
	.drif_refresh_mode(drif_refresh_mode[2]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .drif_pdmc_idle(drif_pdmc_idle),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmc_ctl pdmc3 (
	.scan_in(pdmc3_scanin),
	.scan_out(pdmc3_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[3]),
	.pdmc_pdx_pending(pdmc_pdx_pending[3]),
	.pdmc_rank_avail(pdmc_rank_avail_out[3]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[3]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[3]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[3]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[3]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[3]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[3]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[3]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[3]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[3]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[3]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[3]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[3]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[3]),
	.drif_pdx_issued(drif_pdx_issued[3]),
	.drif_pde_issued(drif_pde_issued[3]),
	.drif_pdmc_enable(drif_pdmc_enable[3]),
	.drif_refresh_mode(drif_refresh_mode[3]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .drif_pdmc_idle(drif_pdmc_idle),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc4 (
	.scan_in(pdmc4_scanin),
	.scan_out(pdmc4_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[4]),
	.pdmc_pdx_pending(pdmc_pdx_pending[4]),
	.pdmc_rank_avail(pdmc_rank_avail_out[4]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[4]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[4]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[4]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[4]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[4]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[4]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[4]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[4]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[4]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[4]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[4]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[4]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[4]),
	.drif_pdx_issued(drif_pdx_issued[4]),
	.drif_pde_issued(drif_pde_issued[4]),
	.drif_pdmc_enable(drif_pdmc_enable[4]),
	.drif_refresh_mode(drif_refresh_mode[4]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc5 (
	.scan_in(pdmc5_scanin),
	.scan_out(pdmc5_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[5]),
	.pdmc_pdx_pending(pdmc_pdx_pending[5]),
	.pdmc_rank_avail(pdmc_rank_avail_out[5]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[5]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[5]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[5]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[5]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[5]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[5]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[5]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[5]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[5]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[5]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[5]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[5]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[5]),
	.drif_pdx_issued(drif_pdx_issued[5]),
	.drif_pde_issued(drif_pde_issued[5]),
	.drif_pdmc_enable(drif_pdmc_enable[5]),
	.drif_refresh_mode(drif_refresh_mode[5]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc6 (
	.scan_in(pdmc6_scanin),
	.scan_out(pdmc6_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[6]),
	.pdmc_pdx_pending(pdmc_pdx_pending[6]),
	.pdmc_rank_avail(pdmc_rank_avail_out[6]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[6]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[6]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[6]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[6]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[6]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[6]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[6]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[6]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[6]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[6]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[6]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[6]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[6]),
	.drif_pdx_issued(drif_pdx_issued[6]),
	.drif_pde_issued(drif_pde_issued[6]),
	.drif_pdmc_enable(drif_pdmc_enable[6]),
	.drif_refresh_mode(drif_refresh_mode[6]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc7 (
	.scan_in(pdmc7_scanin),
	.scan_out(pdmc7_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[7]),
	.pdmc_pdx_pending(pdmc_pdx_pending[7]),
	.pdmc_rank_avail(pdmc_rank_avail_out[7]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[7]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[7]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[7]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[7]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[7]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[7]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[7]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[7]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[7]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[7]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[7]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[7]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[7]),
	.drif_pdx_issued(drif_pdx_issued[7]),
	.drif_pde_issued(drif_pde_issued[7]),
	.drif_pdmc_enable(drif_pdmc_enable[7]),
	.drif_refresh_mode(drif_refresh_mode[7]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc8 (
	.scan_in(pdmc8_scanin),
	.scan_out(pdmc8_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[8]),
	.pdmc_pdx_pending(pdmc_pdx_pending[8]),
	.pdmc_rank_avail(pdmc_rank_avail_out[8]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[8]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[8]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[8]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[8]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[8]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[8]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[8]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[8]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[8]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[8]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[8]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[8]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[8]),
	.drif_pdx_issued(drif_pdx_issued[8]),
	.drif_pde_issued(drif_pde_issued[8]),
	.drif_pdmc_enable(drif_pdmc_enable[8]),
	.drif_refresh_mode(drif_refresh_mode[8]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc9 (
	.scan_in(pdmc9_scanin),
	.scan_out(pdmc9_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[9]),
	.pdmc_pdx_pending(pdmc_pdx_pending[9]),
	.pdmc_rank_avail(pdmc_rank_avail_out[9]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[9]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[9]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[9]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[9]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[9]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[9]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[9]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[9]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[9]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[9]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[9]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[9]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[9]),
	.drif_pdx_issued(drif_pdx_issued[9]),
	.drif_pde_issued(drif_pde_issued[9]),
	.drif_pdmc_enable(drif_pdmc_enable[9]),
	.drif_refresh_mode(drif_refresh_mode[9]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc10 (
	.scan_in(pdmc10_scanin),
	.scan_out(pdmc10_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[10]),
	.pdmc_pdx_pending(pdmc_pdx_pending[10]),
	.pdmc_rank_avail(pdmc_rank_avail_out[10]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[10]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[10]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[10]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[10]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[10]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[10]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[10]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[10]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[10]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[10]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[10]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[10]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[10]),
	.drif_pdx_issued(drif_pdx_issued[10]),
	.drif_pde_issued(drif_pde_issued[10]),
	.drif_pdmc_enable(drif_pdmc_enable[10]),
	.drif_refresh_mode(drif_refresh_mode[10]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc11 (
	.scan_in(pdmc11_scanin),
	.scan_out(pdmc11_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[11]),
	.pdmc_pdx_pending(pdmc_pdx_pending[11]),
	.pdmc_rank_avail(pdmc_rank_avail_out[11]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[11]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[11]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[11]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[11]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[11]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[11]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[11]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[11]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[11]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[11]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[11]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[11]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[11]),
	.drif_pdx_issued(drif_pdx_issued[11]),
	.drif_pde_issued(drif_pde_issued[11]),
	.drif_pdmc_enable(drif_pdmc_enable[11]),
	.drif_refresh_mode(drif_refresh_mode[11]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc12 (
	.scan_in(pdmc12_scanin),
	.scan_out(pdmc12_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[12]),
	.pdmc_pdx_pending(pdmc_pdx_pending[12]),
	.pdmc_rank_avail(pdmc_rank_avail_out[12]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[12]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[12]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[12]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[12]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[12]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[12]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[12]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[12]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[12]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[12]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[12]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[12]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[12]),
	.drif_pdx_issued(drif_pdx_issued[12]),
	.drif_pde_issued(drif_pde_issued[12]),
	.drif_pdmc_enable(drif_pdmc_enable[12]),
	.drif_refresh_mode(drif_refresh_mode[12]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc13 (
	.scan_in(pdmc13_scanin),
	.scan_out(pdmc13_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[13]),
	.pdmc_pdx_pending(pdmc_pdx_pending[13]),
	.pdmc_rank_avail(pdmc_rank_avail_out[13]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[13]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[13]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[13]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[13]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[13]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[13]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[13]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[13]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[13]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[13]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[13]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[13]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[13]),
	.drif_pdx_issued(drif_pdx_issued[13]),
	.drif_pde_issued(drif_pde_issued[13]),
	.drif_pdmc_enable(drif_pdmc_enable[13]),
	.drif_refresh_mode(drif_refresh_mode[13]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc14 (
	.scan_in(pdmc14_scanin),
	.scan_out(pdmc14_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[14]),
	.pdmc_pdx_pending(pdmc_pdx_pending[14]),
	.pdmc_rank_avail(pdmc_rank_avail_out[14]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[14]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[14]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[14]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[14]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[14]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[14]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[14]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[14]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[14]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[14]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[14]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[14]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[14]),
	.drif_pdx_issued(drif_pdx_issued[14]),
	.drif_pde_issued(drif_pde_issued[14]),
	.drif_pdmc_enable(drif_pdmc_enable[14]),
	.drif_refresh_mode(drif_refresh_mode[14]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

mcu_pdmchi_ctl pdmc15 (
	.scan_in(pdmc15_scanin),
	.scan_out(pdmc15_scanout),
	.l1clk(l1clk),
	.pdmc_pde_pending(pdmc_pde_pending[15]),
	.pdmc_pdx_pending(pdmc_pdx_pending[15]),
	.pdmc_rank_avail(pdmc_rank_avail_out[15]),
	.drq0_pd_mode_rd_incr(drq0_pd_mode_rd_incr[15]),
	.drq1_pd_mode_rd_incr(drq1_pd_mode_rd_incr[15]),
	.drq0_pd_mode_wr_incr(drq0_pd_mode_wr_incr[15]),
	.drq1_pd_mode_wr_incr(drq1_pd_mode_wr_incr[15]),
	.drif_pd_mode_scrub_incr(drif_pd_mode_scrub_incr[15]),
	.drif_pd_mode_err_incr(drif_pd_mode_err_incr[15]),
	.drq0_pd_mode_rd_decr(drq0_pd_mode_rd_decr[15]),
	.drq1_pd_mode_rd_decr(drq1_pd_mode_rd_decr[15]),
	.woq_pd_mode_wr_decr(woq_pd_mode_wr_decr[15]),
	.woq_pd_mode_wr_err_decr(woq_err_pdm_wr_decr[15]),
	.woq_pd_mode_wr_err_incr(woq_err_pdm_wr_incr[15]),
	.drif_pd_mode_scrub_decr(drif_pd_mode_scrub_decr[15]),
	.drif_pd_mode_err_decr(drif_pd_mode_err_decr[15]),
	.drif_pdx_issued(drif_pdx_issued[15]),
	.drif_pde_issued(drif_pde_issued[15]),
	.drif_pdmc_enable(drif_pdmc_enable[15]),
	.drif_refresh_mode(drif_refresh_mode[15]),
  .fbdic_l0_state(fbdic_l0_state),
  .fbdic_scr_frame_req_d4(fbdic_scr_frame_req_d4),
  .dal_reg(dal_reg[4:0]),
  .ral_reg(ral_reg[4:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);


assign drif_pdmc_idle = drif_pdmc_idle_d0 & ~drif_pdmc_idle_d1;
assign drif_pdmc_idle_d0 = drif_mcu_idle & ~drq0_rd_req & ~drq0_wr_req & 
                                ~drq1_rd_req & ~drq1_wr_req & ~drif_scrub_time & 
				~rdpctl_err_fifo_enq;
assign drif_mcu_idle = drq0_empty & drq1_empty & woq_empty & drif_err_fifo_empty & 
			~(drif_scrub_read_pending | drif_scrub_read_outstanding);

// spare gates 
//spare_ctl_macro spares (num=49) (
//	.scan_in(spares_scanin),
//	.scan_out(spares_scanout),
//	.l1clk(l1clk)
//);
cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(drif_pdmc_idle_d0),
                               .q(drif_pdmc_idle_d1));
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
                               .d(1'b0),
                               .q(spare18_flop_unused));
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
                               .d(1'b0),
                               .q(spare20_flop_unused));
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

cl_sc1_msff_8x spare22_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_22),
                               .so(so_22),
                               .d(1'b0),
                               .q(spare22_flop_unused));
assign si_22 = so_21;

cl_u1_buf_32x   spare22_buf_32x (.in(1'b1),
                                   .out(spare22_buf_32x_unused));
cl_u1_nand3_8x spare22_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare22_nand3_8x_unused));
cl_u1_inv_8x    spare22_inv_8x (.in(1'b1),
                                  .out(spare22_inv_8x_unused));
cl_u1_aoi22_4x spare22_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare22_aoi22_4x_unused));
cl_u1_buf_8x    spare22_buf_8x (.in(1'b1),
                                  .out(spare22_buf_8x_unused));
cl_u1_oai22_4x spare22_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare22_oai22_4x_unused));
cl_u1_inv_16x   spare22_inv_16x (.in(1'b1),
                                   .out(spare22_inv_16x_unused));
cl_u1_nand2_16x spare22_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare22_nand2_16x_unused));
cl_u1_nor3_4x spare22_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare22_nor3_4x_unused));
cl_u1_nand2_8x spare22_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare22_nand2_8x_unused));
cl_u1_buf_16x   spare22_buf_16x (.in(1'b1),
                                   .out(spare22_buf_16x_unused));
cl_u1_nor2_16x spare22_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare22_nor2_16x_unused));
cl_u1_inv_32x   spare22_inv_32x (.in(1'b1),
                                   .out(spare22_inv_32x_unused));

cl_sc1_msff_8x spare23_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_23),
                               .so(so_23),
                               .d(1'b0),
                               .q(spare23_flop_unused));
assign si_23 = so_22;

cl_u1_buf_32x   spare23_buf_32x (.in(1'b1),
                                   .out(spare23_buf_32x_unused));
cl_u1_nand3_8x spare23_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare23_nand3_8x_unused));
cl_u1_inv_8x    spare23_inv_8x (.in(1'b1),
                                  .out(spare23_inv_8x_unused));
cl_u1_aoi22_4x spare23_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare23_aoi22_4x_unused));
cl_u1_buf_8x    spare23_buf_8x (.in(1'b1),
                                  .out(spare23_buf_8x_unused));
cl_u1_oai22_4x spare23_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare23_oai22_4x_unused));
cl_u1_inv_16x   spare23_inv_16x (.in(1'b1),
                                   .out(spare23_inv_16x_unused));
cl_u1_nand2_16x spare23_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare23_nand2_16x_unused));
cl_u1_nor3_4x spare23_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare23_nor3_4x_unused));
cl_u1_nand2_8x spare23_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare23_nand2_8x_unused));
cl_u1_buf_16x   spare23_buf_16x (.in(1'b1),
                                   .out(spare23_buf_16x_unused));
cl_u1_nor2_16x spare23_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare23_nor2_16x_unused));
cl_u1_inv_32x   spare23_inv_32x (.in(1'b1),
                                   .out(spare23_inv_32x_unused));

cl_sc1_msff_8x spare24_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_24),
                               .so(so_24),
                               .d(1'b0),
                               .q(spare24_flop_unused));
assign si_24 = so_23;

cl_u1_buf_32x   spare24_buf_32x (.in(1'b1),
                                   .out(spare24_buf_32x_unused));
cl_u1_nand3_8x spare24_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare24_nand3_8x_unused));
cl_u1_inv_8x    spare24_inv_8x (.in(1'b1),
                                  .out(spare24_inv_8x_unused));
cl_u1_aoi22_4x spare24_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare24_aoi22_4x_unused));
cl_u1_buf_8x    spare24_buf_8x (.in(1'b1),
                                  .out(spare24_buf_8x_unused));
cl_u1_oai22_4x spare24_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare24_oai22_4x_unused));
cl_u1_inv_16x   spare24_inv_16x (.in(1'b1),
                                   .out(spare24_inv_16x_unused));
cl_u1_nand2_16x spare24_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare24_nand2_16x_unused));
cl_u1_nor3_4x spare24_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare24_nor3_4x_unused));
cl_u1_nand2_8x spare24_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare24_nand2_8x_unused));
cl_u1_buf_16x   spare24_buf_16x (.in(1'b1),
                                   .out(spare24_buf_16x_unused));
cl_u1_nor2_16x spare24_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare24_nor2_16x_unused));
cl_u1_inv_32x   spare24_inv_32x (.in(1'b1),
                                   .out(spare24_inv_32x_unused));

cl_sc1_msff_8x spare25_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_25),
                               .so(so_25),
                               .d(1'b0),
                               .q(spare25_flop_unused));
assign si_25 = so_24;

cl_u1_buf_32x   spare25_buf_32x (.in(1'b1),
                                   .out(spare25_buf_32x_unused));
cl_u1_nand3_8x spare25_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare25_nand3_8x_unused));
cl_u1_inv_8x    spare25_inv_8x (.in(1'b1),
                                  .out(spare25_inv_8x_unused));
cl_u1_aoi22_4x spare25_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare25_aoi22_4x_unused));
cl_u1_buf_8x    spare25_buf_8x (.in(1'b1),
                                  .out(spare25_buf_8x_unused));
cl_u1_oai22_4x spare25_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare25_oai22_4x_unused));
cl_u1_inv_16x   spare25_inv_16x (.in(1'b1),
                                   .out(spare25_inv_16x_unused));
cl_u1_nand2_16x spare25_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare25_nand2_16x_unused));
cl_u1_nor3_4x spare25_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare25_nor3_4x_unused));
cl_u1_nand2_8x spare25_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare25_nand2_8x_unused));
cl_u1_buf_16x   spare25_buf_16x (.in(1'b1),
                                   .out(spare25_buf_16x_unused));
cl_u1_nor2_16x spare25_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare25_nor2_16x_unused));
cl_u1_inv_32x   spare25_inv_32x (.in(1'b1),
                                   .out(spare25_inv_32x_unused));

cl_sc1_msff_8x spare26_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_26),
                               .so(so_26),
                               .d(1'b0),
                               .q(spare26_flop_unused));
assign si_26 = so_25;

cl_u1_buf_32x   spare26_buf_32x (.in(1'b1),
                                   .out(spare26_buf_32x_unused));
cl_u1_nand3_8x spare26_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare26_nand3_8x_unused));
cl_u1_inv_8x    spare26_inv_8x (.in(1'b1),
                                  .out(spare26_inv_8x_unused));
cl_u1_aoi22_4x spare26_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare26_aoi22_4x_unused));
cl_u1_buf_8x    spare26_buf_8x (.in(1'b1),
                                  .out(spare26_buf_8x_unused));
cl_u1_oai22_4x spare26_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare26_oai22_4x_unused));
cl_u1_inv_16x   spare26_inv_16x (.in(1'b1),
                                   .out(spare26_inv_16x_unused));
cl_u1_nand2_16x spare26_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare26_nand2_16x_unused));
cl_u1_nor3_4x spare26_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare26_nor3_4x_unused));
cl_u1_nand2_8x spare26_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare26_nand2_8x_unused));
cl_u1_buf_16x   spare26_buf_16x (.in(1'b1),
                                   .out(spare26_buf_16x_unused));
cl_u1_nor2_16x spare26_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare26_nor2_16x_unused));
cl_u1_inv_32x   spare26_inv_32x (.in(1'b1),
                                   .out(spare26_inv_32x_unused));

cl_sc1_msff_8x spare27_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_27),
                               .so(so_27),
                               .d(1'b0),
                               .q(spare27_flop_unused));
assign si_27 = so_26;

cl_u1_buf_32x   spare27_buf_32x (.in(1'b1),
                                   .out(spare27_buf_32x_unused));
cl_u1_nand3_8x spare27_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare27_nand3_8x_unused));
cl_u1_inv_8x    spare27_inv_8x (.in(1'b1),
                                  .out(spare27_inv_8x_unused));
cl_u1_aoi22_4x spare27_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare27_aoi22_4x_unused));
cl_u1_buf_8x    spare27_buf_8x (.in(1'b1),
                                  .out(spare27_buf_8x_unused));
cl_u1_oai22_4x spare27_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare27_oai22_4x_unused));
cl_u1_inv_16x   spare27_inv_16x (.in(1'b1),
                                   .out(spare27_inv_16x_unused));
cl_u1_nand2_16x spare27_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare27_nand2_16x_unused));
cl_u1_nor3_4x spare27_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare27_nor3_4x_unused));
cl_u1_nand2_8x spare27_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare27_nand2_8x_unused));
cl_u1_buf_16x   spare27_buf_16x (.in(1'b1),
                                   .out(spare27_buf_16x_unused));
cl_u1_nor2_16x spare27_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare27_nor2_16x_unused));
cl_u1_inv_32x   spare27_inv_32x (.in(1'b1),
                                   .out(spare27_inv_32x_unused));

cl_sc1_msff_8x spare28_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_28),
                               .so(so_28),
                               .d(1'b0),
                               .q(spare28_flop_unused));
assign si_28 = so_27;

cl_u1_buf_32x   spare28_buf_32x (.in(1'b1),
                                   .out(spare28_buf_32x_unused));
cl_u1_nand3_8x spare28_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare28_nand3_8x_unused));
cl_u1_inv_8x    spare28_inv_8x (.in(1'b1),
                                  .out(spare28_inv_8x_unused));
cl_u1_aoi22_4x spare28_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare28_aoi22_4x_unused));
cl_u1_buf_8x    spare28_buf_8x (.in(1'b1),
                                  .out(spare28_buf_8x_unused));
cl_u1_oai22_4x spare28_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare28_oai22_4x_unused));
cl_u1_inv_16x   spare28_inv_16x (.in(1'b1),
                                   .out(spare28_inv_16x_unused));
cl_u1_nand2_16x spare28_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare28_nand2_16x_unused));
cl_u1_nor3_4x spare28_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare28_nor3_4x_unused));
cl_u1_nand2_8x spare28_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare28_nand2_8x_unused));
cl_u1_buf_16x   spare28_buf_16x (.in(1'b1),
                                   .out(spare28_buf_16x_unused));
cl_u1_nor2_16x spare28_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare28_nor2_16x_unused));
cl_u1_inv_32x   spare28_inv_32x (.in(1'b1),
                                   .out(spare28_inv_32x_unused));

cl_sc1_msff_8x spare29_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_29),
                               .so(so_29),
                               .d(1'b0),
                               .q(spare29_flop_unused));
assign si_29 = so_28;

cl_u1_buf_32x   spare29_buf_32x (.in(1'b1),
                                   .out(spare29_buf_32x_unused));
cl_u1_nand3_8x spare29_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare29_nand3_8x_unused));
cl_u1_inv_8x    spare29_inv_8x (.in(1'b1),
                                  .out(spare29_inv_8x_unused));
cl_u1_aoi22_4x spare29_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare29_aoi22_4x_unused));
cl_u1_buf_8x    spare29_buf_8x (.in(1'b1),
                                  .out(spare29_buf_8x_unused));
cl_u1_oai22_4x spare29_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare29_oai22_4x_unused));
cl_u1_inv_16x   spare29_inv_16x (.in(1'b1),
                                   .out(spare29_inv_16x_unused));
cl_u1_nand2_16x spare29_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare29_nand2_16x_unused));
cl_u1_nor3_4x spare29_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare29_nor3_4x_unused));
cl_u1_nand2_8x spare29_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare29_nand2_8x_unused));
cl_u1_buf_16x   spare29_buf_16x (.in(1'b1),
                                   .out(spare29_buf_16x_unused));
cl_u1_nor2_16x spare29_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare29_nor2_16x_unused));
cl_u1_inv_32x   spare29_inv_32x (.in(1'b1),
                                   .out(spare29_inv_32x_unused));

cl_sc1_msff_8x spare30_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_30),
                               .so(so_30),
                               .d(1'b0),
                               .q(spare30_flop_unused));
assign si_30 = so_29;

cl_u1_buf_32x   spare30_buf_32x (.in(1'b1),
                                   .out(spare30_buf_32x_unused));
cl_u1_nand3_8x spare30_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare30_nand3_8x_unused));
cl_u1_inv_8x    spare30_inv_8x (.in(1'b1),
                                  .out(spare30_inv_8x_unused));
cl_u1_aoi22_4x spare30_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare30_aoi22_4x_unused));
cl_u1_buf_8x    spare30_buf_8x (.in(1'b1),
                                  .out(spare30_buf_8x_unused));
cl_u1_oai22_4x spare30_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare30_oai22_4x_unused));
cl_u1_inv_16x   spare30_inv_16x (.in(1'b1),
                                   .out(spare30_inv_16x_unused));
cl_u1_nand2_16x spare30_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare30_nand2_16x_unused));
cl_u1_nor3_4x spare30_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare30_nor3_4x_unused));
cl_u1_nand2_8x spare30_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare30_nand2_8x_unused));
cl_u1_buf_16x   spare30_buf_16x (.in(1'b1),
                                   .out(spare30_buf_16x_unused));
cl_u1_nor2_16x spare30_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare30_nor2_16x_unused));
cl_u1_inv_32x   spare30_inv_32x (.in(1'b1),
                                   .out(spare30_inv_32x_unused));

cl_sc1_msff_8x spare31_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_31),
                               .so(so_31),
                               .d(1'b0),
                               .q(spare31_flop_unused));
assign si_31 = so_30;

cl_u1_buf_32x   spare31_buf_32x (.in(1'b1),
                                   .out(spare31_buf_32x_unused));
cl_u1_nand3_8x spare31_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare31_nand3_8x_unused));
cl_u1_inv_8x    spare31_inv_8x (.in(1'b1),
                                  .out(spare31_inv_8x_unused));
cl_u1_aoi22_4x spare31_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare31_aoi22_4x_unused));
cl_u1_buf_8x    spare31_buf_8x (.in(1'b1),
                                  .out(spare31_buf_8x_unused));
cl_u1_oai22_4x spare31_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare31_oai22_4x_unused));
cl_u1_inv_16x   spare31_inv_16x (.in(1'b1),
                                   .out(spare31_inv_16x_unused));
cl_u1_nand2_16x spare31_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare31_nand2_16x_unused));
cl_u1_nor3_4x spare31_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare31_nor3_4x_unused));
cl_u1_nand2_8x spare31_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare31_nand2_8x_unused));
cl_u1_buf_16x   spare31_buf_16x (.in(1'b1),
                                   .out(spare31_buf_16x_unused));
cl_u1_nor2_16x spare31_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare31_nor2_16x_unused));
cl_u1_inv_32x   spare31_inv_32x (.in(1'b1),
                                   .out(spare31_inv_32x_unused));

cl_sc1_msff_8x spare32_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_32),
                               .so(so_32),
                               .d(1'b0),
                               .q(spare32_flop_unused));
assign si_32 = so_31;

cl_u1_buf_32x   spare32_buf_32x (.in(1'b1),
                                   .out(spare32_buf_32x_unused));
cl_u1_nand3_8x spare32_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare32_nand3_8x_unused));
cl_u1_inv_8x    spare32_inv_8x (.in(1'b1),
                                  .out(spare32_inv_8x_unused));
cl_u1_aoi22_4x spare32_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare32_aoi22_4x_unused));
cl_u1_buf_8x    spare32_buf_8x (.in(1'b1),
                                  .out(spare32_buf_8x_unused));
cl_u1_oai22_4x spare32_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare32_oai22_4x_unused));
cl_u1_inv_16x   spare32_inv_16x (.in(1'b1),
                                   .out(spare32_inv_16x_unused));
cl_u1_nand2_16x spare32_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare32_nand2_16x_unused));
cl_u1_nor3_4x spare32_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare32_nor3_4x_unused));
cl_u1_nand2_8x spare32_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare32_nand2_8x_unused));
cl_u1_buf_16x   spare32_buf_16x (.in(1'b1),
                                   .out(spare32_buf_16x_unused));
cl_u1_nor2_16x spare32_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare32_nor2_16x_unused));
cl_u1_inv_32x   spare32_inv_32x (.in(1'b1),
                                   .out(spare32_inv_32x_unused));

cl_sc1_msff_8x spare33_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_33),
                               .so(so_33),
                               .d(1'b0),
                               .q(spare33_flop_unused));
assign si_33 = so_32;

cl_u1_buf_32x   spare33_buf_32x (.in(1'b1),
                                   .out(spare33_buf_32x_unused));
cl_u1_nand3_8x spare33_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare33_nand3_8x_unused));
cl_u1_inv_8x    spare33_inv_8x (.in(1'b1),
                                  .out(spare33_inv_8x_unused));
cl_u1_aoi22_4x spare33_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare33_aoi22_4x_unused));
cl_u1_buf_8x    spare33_buf_8x (.in(1'b1),
                                  .out(spare33_buf_8x_unused));
cl_u1_oai22_4x spare33_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare33_oai22_4x_unused));
cl_u1_inv_16x   spare33_inv_16x (.in(1'b1),
                                   .out(spare33_inv_16x_unused));
cl_u1_nand2_16x spare33_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare33_nand2_16x_unused));
cl_u1_nor3_4x spare33_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare33_nor3_4x_unused));
cl_u1_nand2_8x spare33_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare33_nand2_8x_unused));
cl_u1_buf_16x   spare33_buf_16x (.in(1'b1),
                                   .out(spare33_buf_16x_unused));
cl_u1_nor2_16x spare33_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare33_nor2_16x_unused));
cl_u1_inv_32x   spare33_inv_32x (.in(1'b1),
                                   .out(spare33_inv_32x_unused));

cl_sc1_msff_8x spare34_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_34),
                               .so(so_34),
                               .d(1'b0),
                               .q(spare34_flop_unused));
assign si_34 = so_33;

cl_u1_buf_32x   spare34_buf_32x (.in(1'b1),
                                   .out(spare34_buf_32x_unused));
cl_u1_nand3_8x spare34_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare34_nand3_8x_unused));
cl_u1_inv_8x    spare34_inv_8x (.in(1'b1),
                                  .out(spare34_inv_8x_unused));
cl_u1_aoi22_4x spare34_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare34_aoi22_4x_unused));
cl_u1_buf_8x    spare34_buf_8x (.in(1'b1),
                                  .out(spare34_buf_8x_unused));
cl_u1_oai22_4x spare34_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare34_oai22_4x_unused));
cl_u1_inv_16x   spare34_inv_16x (.in(1'b1),
                                   .out(spare34_inv_16x_unused));
cl_u1_nand2_16x spare34_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare34_nand2_16x_unused));
cl_u1_nor3_4x spare34_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare34_nor3_4x_unused));
cl_u1_nand2_8x spare34_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare34_nand2_8x_unused));
cl_u1_buf_16x   spare34_buf_16x (.in(1'b1),
                                   .out(spare34_buf_16x_unused));
cl_u1_nor2_16x spare34_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare34_nor2_16x_unused));
cl_u1_inv_32x   spare34_inv_32x (.in(1'b1),
                                   .out(spare34_inv_32x_unused));

cl_sc1_msff_8x spare35_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_35),
                               .so(so_35),
                               .d(1'b0),
                               .q(spare35_flop_unused));
assign si_35 = so_34;

cl_u1_buf_32x   spare35_buf_32x (.in(1'b1),
                                   .out(spare35_buf_32x_unused));
cl_u1_nand3_8x spare35_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare35_nand3_8x_unused));
cl_u1_inv_8x    spare35_inv_8x (.in(1'b1),
                                  .out(spare35_inv_8x_unused));
cl_u1_aoi22_4x spare35_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare35_aoi22_4x_unused));
cl_u1_buf_8x    spare35_buf_8x (.in(1'b1),
                                  .out(spare35_buf_8x_unused));
cl_u1_oai22_4x spare35_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare35_oai22_4x_unused));
cl_u1_inv_16x   spare35_inv_16x (.in(1'b1),
                                   .out(spare35_inv_16x_unused));
cl_u1_nand2_16x spare35_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare35_nand2_16x_unused));
cl_u1_nor3_4x spare35_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare35_nor3_4x_unused));
cl_u1_nand2_8x spare35_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare35_nand2_8x_unused));
cl_u1_buf_16x   spare35_buf_16x (.in(1'b1),
                                   .out(spare35_buf_16x_unused));
cl_u1_nor2_16x spare35_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare35_nor2_16x_unused));
cl_u1_inv_32x   spare35_inv_32x (.in(1'b1),
                                   .out(spare35_inv_32x_unused));

cl_sc1_msff_8x spare36_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_36),
                               .so(so_36),
                               .d(1'b0),
                               .q(spare36_flop_unused));
assign si_36 = so_35;

cl_u1_buf_32x   spare36_buf_32x (.in(1'b1),
                                   .out(spare36_buf_32x_unused));
cl_u1_nand3_8x spare36_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare36_nand3_8x_unused));
cl_u1_inv_8x    spare36_inv_8x (.in(1'b1),
                                  .out(spare36_inv_8x_unused));
cl_u1_aoi22_4x spare36_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare36_aoi22_4x_unused));
cl_u1_buf_8x    spare36_buf_8x (.in(1'b1),
                                  .out(spare36_buf_8x_unused));
cl_u1_oai22_4x spare36_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare36_oai22_4x_unused));
cl_u1_inv_16x   spare36_inv_16x (.in(1'b1),
                                   .out(spare36_inv_16x_unused));
cl_u1_nand2_16x spare36_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare36_nand2_16x_unused));
cl_u1_nor3_4x spare36_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare36_nor3_4x_unused));
cl_u1_nand2_8x spare36_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare36_nand2_8x_unused));
cl_u1_buf_16x   spare36_buf_16x (.in(1'b1),
                                   .out(spare36_buf_16x_unused));
cl_u1_nor2_16x spare36_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare36_nor2_16x_unused));
cl_u1_inv_32x   spare36_inv_32x (.in(1'b1),
                                   .out(spare36_inv_32x_unused));

cl_sc1_msff_8x spare37_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_37),
                               .so(so_37),
                               .d(1'b0),
                               .q(spare37_flop_unused));
assign si_37 = so_36;

cl_u1_buf_32x   spare37_buf_32x (.in(1'b1),
                                   .out(spare37_buf_32x_unused));
cl_u1_nand3_8x spare37_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare37_nand3_8x_unused));
cl_u1_inv_8x    spare37_inv_8x (.in(1'b1),
                                  .out(spare37_inv_8x_unused));
cl_u1_aoi22_4x spare37_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare37_aoi22_4x_unused));
cl_u1_buf_8x    spare37_buf_8x (.in(1'b1),
                                  .out(spare37_buf_8x_unused));
cl_u1_oai22_4x spare37_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare37_oai22_4x_unused));
cl_u1_inv_16x   spare37_inv_16x (.in(1'b1),
                                   .out(spare37_inv_16x_unused));
cl_u1_nand2_16x spare37_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare37_nand2_16x_unused));
cl_u1_nor3_4x spare37_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare37_nor3_4x_unused));
cl_u1_nand2_8x spare37_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare37_nand2_8x_unused));
cl_u1_buf_16x   spare37_buf_16x (.in(1'b1),
                                   .out(spare37_buf_16x_unused));
cl_u1_nor2_16x spare37_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare37_nor2_16x_unused));
cl_u1_inv_32x   spare37_inv_32x (.in(1'b1),
                                   .out(spare37_inv_32x_unused));

cl_sc1_msff_8x spare38_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_38),
                               .so(so_38),
                               .d(1'b0),
                               .q(spare38_flop_unused));
assign si_38 = so_37;

cl_u1_buf_32x   spare38_buf_32x (.in(1'b1),
                                   .out(spare38_buf_32x_unused));
cl_u1_nand3_8x spare38_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare38_nand3_8x_unused));
cl_u1_inv_8x    spare38_inv_8x (.in(1'b1),
                                  .out(spare38_inv_8x_unused));
cl_u1_aoi22_4x spare38_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare38_aoi22_4x_unused));
cl_u1_buf_8x    spare38_buf_8x (.in(1'b1),
                                  .out(spare38_buf_8x_unused));
cl_u1_oai22_4x spare38_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare38_oai22_4x_unused));
cl_u1_inv_16x   spare38_inv_16x (.in(1'b1),
                                   .out(spare38_inv_16x_unused));
cl_u1_nand2_16x spare38_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare38_nand2_16x_unused));
cl_u1_nor3_4x spare38_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare38_nor3_4x_unused));
cl_u1_nand2_8x spare38_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare38_nand2_8x_unused));
cl_u1_buf_16x   spare38_buf_16x (.in(1'b1),
                                   .out(spare38_buf_16x_unused));
cl_u1_nor2_16x spare38_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare38_nor2_16x_unused));
cl_u1_inv_32x   spare38_inv_32x (.in(1'b1),
                                   .out(spare38_inv_32x_unused));

cl_sc1_msff_8x spare39_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_39),
                               .so(so_39),
                               .d(1'b0),
                               .q(spare39_flop_unused));
assign si_39 = so_38;

cl_u1_buf_32x   spare39_buf_32x (.in(1'b1),
                                   .out(spare39_buf_32x_unused));
cl_u1_nand3_8x spare39_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare39_nand3_8x_unused));
cl_u1_inv_8x    spare39_inv_8x (.in(1'b1),
                                  .out(spare39_inv_8x_unused));
cl_u1_aoi22_4x spare39_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare39_aoi22_4x_unused));
cl_u1_buf_8x    spare39_buf_8x (.in(1'b1),
                                  .out(spare39_buf_8x_unused));
cl_u1_oai22_4x spare39_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare39_oai22_4x_unused));
cl_u1_inv_16x   spare39_inv_16x (.in(1'b1),
                                   .out(spare39_inv_16x_unused));
cl_u1_nand2_16x spare39_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare39_nand2_16x_unused));
cl_u1_nor3_4x spare39_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare39_nor3_4x_unused));
cl_u1_nand2_8x spare39_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare39_nand2_8x_unused));
cl_u1_buf_16x   spare39_buf_16x (.in(1'b1),
                                   .out(spare39_buf_16x_unused));
cl_u1_nor2_16x spare39_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare39_nor2_16x_unused));
cl_u1_inv_32x   spare39_inv_32x (.in(1'b1),
                                   .out(spare39_inv_32x_unused));

cl_sc1_msff_8x spare40_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_40),
                               .so(so_40),
                               .d(1'b0),
                               .q(spare40_flop_unused));
assign si_40 = so_39;

cl_u1_buf_32x   spare40_buf_32x (.in(1'b1),
                                   .out(spare40_buf_32x_unused));
cl_u1_nand3_8x spare40_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare40_nand3_8x_unused));
cl_u1_inv_8x    spare40_inv_8x (.in(1'b1),
                                  .out(spare40_inv_8x_unused));
cl_u1_aoi22_4x spare40_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare40_aoi22_4x_unused));
cl_u1_buf_8x    spare40_buf_8x (.in(1'b1),
                                  .out(spare40_buf_8x_unused));
cl_u1_oai22_4x spare40_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare40_oai22_4x_unused));
cl_u1_inv_16x   spare40_inv_16x (.in(1'b1),
                                   .out(spare40_inv_16x_unused));
cl_u1_nand2_16x spare40_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare40_nand2_16x_unused));
cl_u1_nor3_4x spare40_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare40_nor3_4x_unused));
cl_u1_nand2_8x spare40_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare40_nand2_8x_unused));
cl_u1_buf_16x   spare40_buf_16x (.in(1'b1),
                                   .out(spare40_buf_16x_unused));
cl_u1_nor2_16x spare40_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare40_nor2_16x_unused));
cl_u1_inv_32x   spare40_inv_32x (.in(1'b1),
                                   .out(spare40_inv_32x_unused));

cl_sc1_msff_8x spare41_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_41),
                               .so(so_41),
                               .d(1'b0),
                               .q(spare41_flop_unused));
assign si_41 = so_40;

cl_u1_buf_32x   spare41_buf_32x (.in(1'b1),
                                   .out(spare41_buf_32x_unused));
cl_u1_nand3_8x spare41_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare41_nand3_8x_unused));
cl_u1_inv_8x    spare41_inv_8x (.in(1'b1),
                                  .out(spare41_inv_8x_unused));
cl_u1_aoi22_4x spare41_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare41_aoi22_4x_unused));
cl_u1_buf_8x    spare41_buf_8x (.in(1'b1),
                                  .out(spare41_buf_8x_unused));
cl_u1_oai22_4x spare41_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare41_oai22_4x_unused));
cl_u1_inv_16x   spare41_inv_16x (.in(1'b1),
                                   .out(spare41_inv_16x_unused));
cl_u1_nand2_16x spare41_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare41_nand2_16x_unused));
cl_u1_nor3_4x spare41_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare41_nor3_4x_unused));
cl_u1_nand2_8x spare41_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare41_nand2_8x_unused));
cl_u1_buf_16x   spare41_buf_16x (.in(1'b1),
                                   .out(spare41_buf_16x_unused));
cl_u1_nor2_16x spare41_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare41_nor2_16x_unused));
cl_u1_inv_32x   spare41_inv_32x (.in(1'b1),
                                   .out(spare41_inv_32x_unused));

cl_sc1_msff_8x spare42_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_42),
                               .so(so_42),
                               .d(1'b0),
                               .q(spare42_flop_unused));
assign si_42 = so_41;

cl_u1_buf_32x   spare42_buf_32x (.in(1'b1),
                                   .out(spare42_buf_32x_unused));
cl_u1_nand3_8x spare42_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare42_nand3_8x_unused));
cl_u1_inv_8x    spare42_inv_8x (.in(1'b1),
                                  .out(spare42_inv_8x_unused));
cl_u1_aoi22_4x spare42_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare42_aoi22_4x_unused));
cl_u1_buf_8x    spare42_buf_8x (.in(1'b1),
                                  .out(spare42_buf_8x_unused));
cl_u1_oai22_4x spare42_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare42_oai22_4x_unused));
cl_u1_inv_16x   spare42_inv_16x (.in(1'b1),
                                   .out(spare42_inv_16x_unused));
cl_u1_nand2_16x spare42_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare42_nand2_16x_unused));
cl_u1_nor3_4x spare42_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare42_nor3_4x_unused));
cl_u1_nand2_8x spare42_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare42_nand2_8x_unused));
cl_u1_buf_16x   spare42_buf_16x (.in(1'b1),
                                   .out(spare42_buf_16x_unused));
cl_u1_nor2_16x spare42_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare42_nor2_16x_unused));
cl_u1_inv_32x   spare42_inv_32x (.in(1'b1),
                                   .out(spare42_inv_32x_unused));

cl_sc1_msff_8x spare43_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_43),
                               .so(so_43),
                               .d(1'b0),
                               .q(spare43_flop_unused));
assign si_43 = so_42;

cl_u1_buf_32x   spare43_buf_32x (.in(1'b1),
                                   .out(spare43_buf_32x_unused));
cl_u1_nand3_8x spare43_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare43_nand3_8x_unused));
cl_u1_inv_8x    spare43_inv_8x (.in(1'b1),
                                  .out(spare43_inv_8x_unused));
cl_u1_aoi22_4x spare43_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare43_aoi22_4x_unused));
cl_u1_buf_8x    spare43_buf_8x (.in(1'b1),
                                  .out(spare43_buf_8x_unused));
cl_u1_oai22_4x spare43_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare43_oai22_4x_unused));
cl_u1_inv_16x   spare43_inv_16x (.in(1'b1),
                                   .out(spare43_inv_16x_unused));
cl_u1_nand2_16x spare43_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare43_nand2_16x_unused));
cl_u1_nor3_4x spare43_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare43_nor3_4x_unused));
cl_u1_nand2_8x spare43_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare43_nand2_8x_unused));
cl_u1_buf_16x   spare43_buf_16x (.in(1'b1),
                                   .out(spare43_buf_16x_unused));
cl_u1_nor2_16x spare43_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare43_nor2_16x_unused));
cl_u1_inv_32x   spare43_inv_32x (.in(1'b1),
                                   .out(spare43_inv_32x_unused));

cl_sc1_msff_8x spare44_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_44),
                               .so(so_44),
                               .d(1'b0),
                               .q(spare44_flop_unused));
assign si_44 = so_43;

cl_u1_buf_32x   spare44_buf_32x (.in(1'b1),
                                   .out(spare44_buf_32x_unused));
cl_u1_nand3_8x spare44_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare44_nand3_8x_unused));
cl_u1_inv_8x    spare44_inv_8x (.in(1'b1),
                                  .out(spare44_inv_8x_unused));
cl_u1_aoi22_4x spare44_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare44_aoi22_4x_unused));
cl_u1_buf_8x    spare44_buf_8x (.in(1'b1),
                                  .out(spare44_buf_8x_unused));
cl_u1_oai22_4x spare44_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare44_oai22_4x_unused));
cl_u1_inv_16x   spare44_inv_16x (.in(1'b1),
                                   .out(spare44_inv_16x_unused));
cl_u1_nand2_16x spare44_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare44_nand2_16x_unused));
cl_u1_nor3_4x spare44_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare44_nor3_4x_unused));
cl_u1_nand2_8x spare44_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare44_nand2_8x_unused));
cl_u1_buf_16x   spare44_buf_16x (.in(1'b1),
                                   .out(spare44_buf_16x_unused));
cl_u1_nor2_16x spare44_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare44_nor2_16x_unused));
cl_u1_inv_32x   spare44_inv_32x (.in(1'b1),
                                   .out(spare44_inv_32x_unused));

cl_sc1_msff_8x spare45_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_45),
                               .so(so_45),
                               .d(1'b0),
                               .q(spare45_flop_unused));
assign si_45 = so_44;

cl_u1_buf_32x   spare45_buf_32x (.in(1'b1),
                                   .out(spare45_buf_32x_unused));
cl_u1_nand3_8x spare45_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare45_nand3_8x_unused));
cl_u1_inv_8x    spare45_inv_8x (.in(1'b1),
                                  .out(spare45_inv_8x_unused));
cl_u1_aoi22_4x spare45_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare45_aoi22_4x_unused));
cl_u1_buf_8x    spare45_buf_8x (.in(1'b1),
                                  .out(spare45_buf_8x_unused));
cl_u1_oai22_4x spare45_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare45_oai22_4x_unused));
cl_u1_inv_16x   spare45_inv_16x (.in(1'b1),
                                   .out(spare45_inv_16x_unused));
cl_u1_nand2_16x spare45_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare45_nand2_16x_unused));
cl_u1_nor3_4x spare45_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare45_nor3_4x_unused));
cl_u1_nand2_8x spare45_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare45_nand2_8x_unused));
cl_u1_buf_16x   spare45_buf_16x (.in(1'b1),
                                   .out(spare45_buf_16x_unused));
cl_u1_nor2_16x spare45_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare45_nor2_16x_unused));
cl_u1_inv_32x   spare45_inv_32x (.in(1'b1),
                                   .out(spare45_inv_32x_unused));

cl_sc1_msff_8x spare46_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_46),
                               .so(so_46),
                               .d(1'b0),
                               .q(spare46_flop_unused));
assign si_46 = so_45;

cl_u1_buf_32x   spare46_buf_32x (.in(1'b1),
                                   .out(spare46_buf_32x_unused));
cl_u1_nand3_8x spare46_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare46_nand3_8x_unused));
cl_u1_inv_8x    spare46_inv_8x (.in(1'b1),
                                  .out(spare46_inv_8x_unused));
cl_u1_aoi22_4x spare46_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare46_aoi22_4x_unused));
cl_u1_buf_8x    spare46_buf_8x (.in(1'b1),
                                  .out(spare46_buf_8x_unused));
cl_u1_oai22_4x spare46_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare46_oai22_4x_unused));
cl_u1_inv_16x   spare46_inv_16x (.in(1'b1),
                                   .out(spare46_inv_16x_unused));
cl_u1_nand2_16x spare46_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare46_nand2_16x_unused));
cl_u1_nor3_4x spare46_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare46_nor3_4x_unused));
cl_u1_nand2_8x spare46_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare46_nand2_8x_unused));
cl_u1_buf_16x   spare46_buf_16x (.in(1'b1),
                                   .out(spare46_buf_16x_unused));
cl_u1_nor2_16x spare46_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare46_nor2_16x_unused));
cl_u1_inv_32x   spare46_inv_32x (.in(1'b1),
                                   .out(spare46_inv_32x_unused));

cl_sc1_msff_8x spare47_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_47),
                               .so(so_47),
                               .d(1'b0),
                               .q(spare47_flop_unused));
assign si_47 = so_46;

cl_u1_buf_32x   spare47_buf_32x (.in(1'b1),
                                   .out(spare47_buf_32x_unused));
cl_u1_nand3_8x spare47_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare47_nand3_8x_unused));
cl_u1_inv_8x    spare47_inv_8x (.in(1'b1),
                                  .out(spare47_inv_8x_unused));
cl_u1_aoi22_4x spare47_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare47_aoi22_4x_unused));
cl_u1_buf_8x    spare47_buf_8x (.in(1'b1),
                                  .out(spare47_buf_8x_unused));
cl_u1_oai22_4x spare47_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare47_oai22_4x_unused));
cl_u1_inv_16x   spare47_inv_16x (.in(1'b1),
                                   .out(spare47_inv_16x_unused));
cl_u1_nand2_16x spare47_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare47_nand2_16x_unused));
cl_u1_nor3_4x spare47_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare47_nor3_4x_unused));
cl_u1_nand2_8x spare47_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare47_nand2_8x_unused));
cl_u1_buf_16x   spare47_buf_16x (.in(1'b1),
                                   .out(spare47_buf_16x_unused));
cl_u1_nor2_16x spare47_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare47_nor2_16x_unused));
cl_u1_inv_32x   spare47_inv_32x (.in(1'b1),
                                   .out(spare47_inv_32x_unused));

cl_sc1_msff_8x spare48_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_48),
                               .so(so_48),
                               .d(1'b0),
                               .q(spare48_flop_unused));
assign si_48 = so_47;

cl_u1_buf_32x   spare48_buf_32x (.in(1'b1),
                                   .out(spare48_buf_32x_unused));
cl_u1_nand3_8x spare48_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare48_nand3_8x_unused));
cl_u1_inv_8x    spare48_inv_8x (.in(1'b1),
                                  .out(spare48_inv_8x_unused));
cl_u1_aoi22_4x spare48_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare48_aoi22_4x_unused));
cl_u1_buf_8x    spare48_buf_8x (.in(1'b1),
                                  .out(spare48_buf_8x_unused));
cl_u1_oai22_4x spare48_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare48_oai22_4x_unused));
cl_u1_inv_16x   spare48_inv_16x (.in(1'b1),
                                   .out(spare48_inv_16x_unused));
cl_u1_nand2_16x spare48_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare48_nand2_16x_unused));
cl_u1_nor3_4x spare48_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare48_nor3_4x_unused));
cl_u1_nand2_8x spare48_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare48_nand2_8x_unused));
cl_u1_buf_16x   spare48_buf_16x (.in(1'b1),
                                   .out(spare48_buf_16x_unused));
cl_u1_nor2_16x spare48_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare48_nor2_16x_unused));
cl_u1_inv_32x   spare48_inv_32x (.in(1'b1),
                                   .out(spare48_inv_32x_unused));
assign spares_scanout = so_48;




// CLEANUP
assign drif_scrub_write_req = drif_err_wr_picked; // for mcusat
assign drif_tot_ranks[2:0] = 3'h0;
assign drif_power_down_mode = 1'b0;
assign mcu_ddp_clk_enable = 1'b0;

// fixscan start:
assign ff_ucb_req_scanin         = scan_in                  ;
assign ff_hw_selfref_scanin      = ff_ucb_req_scanout       ;
assign ff_sync_frame_req_l_scanin = ff_hw_selfref_scanout    ;
assign dmmdly0_scanin            = ff_sync_frame_req_l_scanout;
assign dmmdly1_scanin            = dmmdly0_scanout          ;
assign dmmdly2_scanin            = dmmdly1_scanout          ;
assign dmmdly3_scanin            = dmmdly2_scanout          ;
assign dmmdly4_scanin            = dmmdly3_scanout          ;
assign dmmdly5_scanin            = dmmdly4_scanout          ;
assign dmmdly6_scanin            = dmmdly5_scanout          ;
assign dmmdly7_scanin            = dmmdly6_scanout          ;
assign ff_rfc_cnt_scanin         = dmmdly7_scanout          ;
assign ff_rd_rrd_cnt_scanin      = ff_rfc_cnt_scanout       ;
assign bnksm0_scanin             = ff_rd_rrd_cnt_scanout    ;
assign bnksm1_scanin             = bnksm0_scanout           ;
assign bnksm2_scanin             = bnksm1_scanout           ;
assign bnksm3_scanin             = bnksm2_scanout           ;
assign bnksm4_scanin             = bnksm3_scanout           ;
assign bnksm5_scanin             = bnksm4_scanout           ;
assign bnksm6_scanin             = bnksm5_scanout           ;
assign bnksm7_scanin             = bnksm6_scanout           ;
assign bnksm8_scanin             = bnksm7_scanout           ;
assign bnksm9_scanin             = bnksm8_scanout           ;
assign bnksm10_scanin            = bnksm9_scanout           ;
assign bnksm11_scanin            = bnksm10_scanout          ;
assign bnksm12_scanin            = bnksm11_scanout          ;
assign bnksm13_scanin            = bnksm12_scanout          ;
assign bnksm14_scanin            = bnksm13_scanout          ;
assign bnksm15_scanin            = bnksm14_scanout          ;
assign ff_entry_priority_scanin  = bnksm15_scanout          ;
assign ff_cas_abnk_picked_scanin = ff_entry_priority_scanout;
assign ff_cas_bcbnk_picked_scanin = ff_cas_abnk_picked_scanout;
assign ff_rank_dimm_picked_scanin = ff_cas_bcbnk_picked_scanout;
assign ff_ras_picked_d2_scanin   = ff_rank_dimm_picked_scanout;
assign ff_wr_entry_pend_scanin   = ff_ras_picked_d2_scanout ;
assign ff_raw_match_scanin       = ff_wr_entry_pend_scanout ;
assign ff_cmd_picked_d1_scanin   = ff_raw_match_scanout     ;
assign ff_scrub_picked_d1_scanin = ff_cmd_picked_d1_scanout ;
assign ff_addr_parity_d1_scanin  = ff_scrub_picked_d1_scanout;
assign ff_addr_err_d1_scanin     = ff_addr_parity_d1_scanout;
assign ff_wr_starve_cnt0_scanin  = ff_addr_err_d1_scanout   ;
assign ff_pick_wr_first0_scanin  = ff_wr_starve_cnt0_scanout;
assign ff_wr_starve_cnt1_scanin  = ff_pick_wr_first0_scanout;
assign ff_pick_wr_first1_scanin  = ff_wr_starve_cnt1_scanout;
assign ff_cas_picked_scanin      = ff_pick_wr_first1_scanout;
assign ff_ras_adr_d1_scanin      = ff_cas_picked_scanout    ;
assign ff_cas_adr_d1_scanin      = ff_ras_adr_d1_scanout    ;
assign ff_req_id_d1_scanin       = ff_cas_adr_d1_scanout    ;
assign ff_cas_adr_d2_scanin      = ff_req_id_d1_scanout     ;
assign ff_bank_adr_scanin        = ff_cas_adr_d2_scanout    ;
assign ff_dimm_adr_scanin        = ff_bank_adr_scanout      ;
assign ff_rank_adr_scanin        = ff_dimm_adr_scanout      ;
assign ff_mux_wr_en_scanin       = ff_rank_adr_scanout      ;
assign ff_cmd_val_scanin         = ff_mux_wr_en_scanout     ;
assign ff_cmd_val_d1_scanin      = ff_cmd_val_scanout       ;
assign ff_wr1_adr_d1_scanin      = ff_cmd_val_d1_scanout    ;
assign ff_write1_data_scanin     = ff_wr1_adr_d1_scanout    ;
assign ff_wr1_adr_d2_scanin      = ff_write1_data_scanout   ;
assign ff_write2_data_scanin     = ff_wr1_adr_d2_scanout    ;
assign ff_wr2_adr_d1_scanin      = ff_write2_data_scanout   ;
assign ff_wr2_adr_d2_scanin      = ff_wr2_adr_d1_scanout    ;
assign ff_wdata_wsn_scanin       = ff_wr2_adr_d2_scanout    ;
assign ff_rd_wr_picked_d1_scanin = ff_wdata_wsn_scanout     ;
assign ff0_wr_entry0_scanin      = ff_rd_wr_picked_d1_scanout;
assign ff1_wr_entry0_scanin      = ff0_wr_entry0_scanout    ;
assign ff_wdq_sel_scanin         = ff1_wr_entry0_scanout    ;
assign ff_scrub_data_rden_scanin = ff_wdq_sel_scanout       ;
assign ff_scrub_buffer_cnt_scanin = ff_scrub_data_rden_scanout;
assign ff_multi_err_scanin       = ff_scrub_buffer_cnt_scanout;
assign ff_error_write_flag_scanin = ff_multi_err_scanout     ;
assign ff_scrub_data_rden_en_d1_scanin = ff_error_write_flag_scanout;
assign ff_err_wrdata_ready_scanin = ff_scrub_data_rden_en_d1_scanout;
assign ff_wadr_parity_scanin     = ff_err_wrdata_ready_scanout;
assign ff_rd_index_d1_scanin     = ff_wadr_parity_scanout   ;
assign ff_err_fifo_err_type_d1_scanin = ff_rd_index_d1_scanout   ;
assign ff_mcu_state_enc_scanin   = ff_err_fifo_err_type_d1_scanout;
assign ff_cyc_cnt_scanin         = ff_mcu_state_enc_scanout ;
assign ff_mrd_cnt_scanin         = ff_cyc_cnt_scanout       ;
assign ff_rp_cnt_scanin          = ff_mrd_cnt_scanout       ;
assign ff_bank_idle_cnt_scanin   = ff_rp_cnt_scanout        ;
assign ff_refresh_rank_scanin    = ff_bank_idle_cnt_scanout ;
assign ff_enter_self_refresh_scanin = ff_refresh_rank_scanout  ;
assign ff_exit_self_refresh_scanin = ff_enter_self_refresh_scanout;
assign ff_l2_poison_qw_scanin    = ff_exit_self_refresh_scanout;
assign ff_mem_type_scanin        = ff_l2_poison_qw_scanout  ;
assign ff_init_scanin            = ff_mem_type_scanout      ;
assign ff_single_channel_mode_pend_scanin = ff_init_scanout          ;
assign ff_cke_enable_scanin      = ff_single_channel_mode_pend_scanout;
assign ff_dal_reg_scanin         = ff_cke_enable_scanout    ;
assign ff_ral_reg_scanin         = ff_dal_reg_scanout       ;
assign ff_precharge_wait_scanin  = ff_ral_reg_scanout       ;
assign ff_wdq_sel_d1_scanin      = ff_precharge_wait_scanout;
assign ff_ref_cnt_scanin         = ff_wdq_sel_d1_scanout    ;
assign ff_l0_state_d1_scanin     = ff_ref_cnt_scanout       ;
assign ff_scrub_cnt_scanin       = ff_l0_state_d1_scanout   ;
assign ff_scrub_read_pending_scanin = ff_scrub_cnt_scanout     ;
assign ff_scrub_read_out_scanin  = ff_scrub_read_pending_scanout;
assign ff_scrub_read_pending_en_d1_scanin = ff_scrub_read_out_scanout;
assign ff_pt_sync_out_d1_scanin  = ff_scrub_read_pending_en_d1_scanout;
assign ff_pt_sync_out_scanin     = ff_pt_sync_out_d1_scanout;
assign ff_pt_sync_scanin         = ff_pt_sync_out_scanout   ;
assign ff_banks_open_scanin      = ff_pt_sync_scanout       ;
assign ff_time_cntr_scanin       = ff_banks_open_scanout    ;
assign ff_blk_openbank_scanin    = ff_time_cntr_scanout     ;
assign ff_wr_mode_reg_scanin     = ff_blk_openbank_scanout  ;
assign ff_init_done_scanin       = ff_wr_mode_reg_scanout   ;
assign ff_init_status_reg_scanin = ff_init_done_scanout     ;
assign ff_ucb_data_scanin        = ff_init_status_reg_scanout;
assign ff_pd_mode_enable_scanin  = ff_ucb_data_scanout      ;
assign ff_perf_cntl_reg_scanin   = ff_pd_mode_enable_scanout;
assign ff_crit_sig_scanin        = ff_perf_cntl_reg_scanout ;
assign ff_perf_cnt0_reg_scanin   = ff_crit_sig_scanout      ;
assign ff_perf_cnt1_reg_scanin   = ff_perf_cnt0_reg_scanout ;
assign ff_raw_hazard_d1_scanin   = ff_perf_cnt1_reg_scanout ;
assign ff_scrub_wren_scanin      = ff_raw_hazard_d1_scanout ;
assign errq_scanin               = ff_scrub_wren_scanout    ;
assign ff_err_fifo_empty_d1_scanin = errq_scanout             ;
assign ff_err_rd_picked_d1_scanin = ff_err_fifo_empty_d1_scanout;
assign ff_err_fifo_d1_scanin     = ff_err_rd_picked_d1_scanout;
assign ff_crc_retry_wait_scanin  = ff_err_fifo_d1_scanout   ;
assign ff_err_state_scanin       = ff_crc_retry_wait_scanout;
assign ff_mcu_error_mode_scanin  = ff_err_state_scanout     ;
assign reqq_scanin               = ff_mcu_error_mode_scanout;
assign ff_scrub_addr_scanin      = reqq_scanout             ;
assign adrgen_scanin             = ff_scrub_addr_scanout    ;
assign pdmc0_scanin              = adrgen_scanout           ;
assign pdmc1_scanin              = pdmc0_scanout            ;
assign pdmc2_scanin              = pdmc1_scanout            ;
assign pdmc3_scanin              = pdmc2_scanout            ;
assign pdmc4_scanin              = pdmc3_scanout            ;
assign pdmc5_scanin              = pdmc4_scanout            ;
assign pdmc6_scanin              = pdmc5_scanout            ;
assign pdmc7_scanin              = pdmc6_scanout            ;
assign pdmc8_scanin              = pdmc7_scanout            ;
assign pdmc9_scanin              = pdmc8_scanout            ;
assign pdmc10_scanin             = pdmc9_scanout            ;
assign pdmc11_scanin             = pdmc10_scanout           ;
assign pdmc12_scanin             = pdmc11_scanout           ;
assign pdmc13_scanin             = pdmc12_scanout           ;
assign pdmc14_scanin             = pdmc13_scanout           ;
assign pdmc15_scanin             = pdmc14_scanout           ;
assign spares_scanin             = pdmc15_scanout           ;
assign scan_out                  = spares_scanout           ;

assign pff_mode_reg_wmr_scanin   = wmr_scan_in              ;
assign pff_ext_mode_reg1_wmr_scanin = pff_mode_reg_wmr_scanout ;
assign pff_ext_mode_reg2_wmr_scanin = pff_ext_mode_reg1_wmr_scanout;
assign pff_ext_mode_reg3_wmr_scanin = pff_ext_mode_reg2_wmr_scanout;
assign pff_stacked_dimm_wmr_scanin = pff_ext_mode_reg3_wmr_scanout;
assign pff_cas_addr_bits_wmr_scanin = pff_stacked_dimm_wmr_scanout;
assign pff_ras_addr_bits_wmr_scanin = pff_cas_addr_bits_wmr_scanout;
assign pff_freq_scrub_wmr_scanin = pff_ras_addr_bits_wmr_scanout;
assign pff_dimms_present_wmr_scanin = pff_freq_scrub_wmr_scanout;
assign pff_branch_disabled_wmr_scanin = pff_dimms_present_wmr_scanout;
assign pff_bank_low_sel_wmr_scanin = pff_branch_disabled_wmr_scanout;
assign pff_eight_bank_present_wmr_scanin = pff_bank_low_sel_wmr_scanout;
assign pff_single_channel_mode_wmr_scanin = pff_eight_bank_present_wmr_scanout;
assign pff_fail_over_mode_wmr_scanin = pff_single_channel_mode_wmr_scanout;
assign pff_fail_over_mask_wmr_scanin = pff_fail_over_mode_wmr_scanout;
assign pff_rrd_reg_wmr_scanin    = pff_fail_over_mask_wmr_scanout;
assign pff_rcd_reg_wmr_scanin    = pff_rrd_reg_wmr_scanout  ;
assign pff_iwtr_reg_wmr_scanin   = pff_rcd_reg_wmr_scanout  ;
assign pff_wtr_reg_wmr_scanin    = pff_iwtr_reg_wmr_scanout ;
assign pff_rtw_reg_wmr_scanin    = pff_wtr_reg_wmr_scanout  ;
assign pff_rtp_reg_wmr_scanin    = pff_rtw_reg_wmr_scanout  ;
assign pff_ras_reg_wmr_scanin    = pff_rtp_reg_wmr_scanout  ;
assign pff_rp_reg_wmr_scanin     = pff_ras_reg_wmr_scanout  ;
assign pff_rc_reg_wmr_scanin     = pff_rp_reg_wmr_scanout   ;
assign pff_wr_reg_wmr_scanin     = pff_rc_reg_wmr_scanout   ;
assign pff_rfc_reg_wmr_scanin    = pff_wr_reg_wmr_scanout   ;
assign pff_mrd_reg_wmr_scanin    = pff_rfc_reg_wmr_scanout  ;
assign pff_faw_reg_wmr_scanin    = pff_mrd_reg_wmr_scanout  ;
assign pff_err_inj_wmr_scanin    = pff_faw_reg_wmr_scanout  ;
assign pff_sshot_wmr_scanin      = pff_err_inj_wmr_scanout  ;
assign pff_err_mask_wmr_scanin   = pff_sshot_wmr_scanout    ;
assign pff_ref_freq_wmr_scanin   = pff_err_mask_wmr_scanout ;
assign pff_data_scrub_wmr_scanin = pff_ref_freq_wmr_scanout ;
assign pff_max_banks_open_wmr_scanin = pff_data_scrub_wmr_scanout;
assign pff_max_time_wmr_scanin   = pff_max_banks_open_wmr_scanout;
assign wmr_scan_out              = pff_max_time_wmr_scanout ;
// fixscan end:
endmodule 






// any PARAMS parms go into naming of macro

module mcu_drif_ctl_l1clkhdr_ctl_macro (
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

module mcu_drif_ctl_msff_ctl_macro__width_79 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [78:0] fdin;
wire [77:0] so;

  input [78:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [78:0] dout;
  output scan_out;
assign fdin[78:0] = din[78:0];






dff #(79)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[78:0]),
.si({scan_in,so[77:0]}),
.so({so[77:0],scan_out}),
.q(dout[78:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__width_1 (
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

module mcu_drif_ctl_msff_ctl_macro__width_3 (
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

module mcu_drif_ctl_msff_ctl_macro__width_4 (
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

module mcu_drif_ctl_msff_ctl_macro__width_2 (
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

module mcu_drif_ctl_msff_ctl_macro__en_0__width_5 (
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

module mcu_drif_ctl_msff_ctl_macro__width_7 (
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

module mcu_drif_ctl_msff_ctl_macro__width_5 (
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

module mcu_drif_ctl_msff_ctl_macro (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_16 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_9 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = (din[8:0] & {9{en}}) | (dout[8:0] & ~{9{en}});






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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_drif_ctl_msff_ctl_macro__clr_1__width_6 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_15 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = (din[14:0] & {15{en}}) | (dout[14:0] & ~{15{en}});






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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_11 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [10:0] fdin;
wire [9:0] so;

  input [10:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [10:0] dout;
  output scan_out;
assign fdin[10:0] = (din[10:0] & {11{en}}) | (dout[10:0] & ~{11{en}});






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













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__en_1__width_3 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_6 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_2 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_26 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [25:0] fdin;
wire [24:0] so;

  input [25:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [25:0] dout;
  output scan_out;
assign fdin[25:0] = (din[25:0] & {26{en}}) | (dout[25:0] & ~{26{en}});






dff #(26)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[25:0]),
.si({scan_in,so[24:0]}),
.so({so[24:0],scan_out}),
.q(dout[25:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__en_1__width_7 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_18 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [17:0] fdin;
wire [16:0] so;

  input [17:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [17:0] dout;
  output scan_out;
assign fdin[17:0] = (din[17:0] & {18{en}}) | (dout[17:0] & ~{18{en}});






dff #(18)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[17:0]),
.si({scan_in,so[16:0]}),
.so({so[16:0],scan_out}),
.q(dout[17:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__width_8 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_12 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_35 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [34:0] fdin;
wire [33:0] so;

  input [34:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [34:0] dout;
  output scan_out;
assign fdin[34:0] = (din[34:0] & {35{en}}) | (dout[34:0] & ~{35{en}});






dff #(35)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[34:0]),
.si({scan_in,so[33:0]}),
.so({so[33:0],scan_out}),
.q(dout[34:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__en_1__width_5 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_8 (
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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_13 (
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

module mcu_drif_ctl_msff_ctl_macro__width_13 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = din[12:0];






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

module mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_12 (
  din, 
  en, 
  clr, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}} & ~{12{clr}}) | (dout[11:0] & ~{12{en}} & ~{12{clr}});






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

module mcu_drif_ctl_msff_ctl_macro__en_1__width_17 (
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

module mcu_drif_ctl_msff_ctl_macro__width_16 (
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

module mcu_drif_ctl_msff_ctl_macro__clr_1__width_1 (
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

module mcu_drif_ctl_msff_ctl_macro__width_66 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [65:0] fdin;
wire [64:0] so;

  input [65:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [65:0] dout;
  output scan_out;
assign fdin[65:0] = din[65:0];






dff #(66)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[65:0]),
.si({scan_in,so[64:0]}),
.so({so[64:0],scan_out}),
.q(dout[65:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_drif_ctl_msff_ctl_macro__en_1__width_32 (
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

module mcu_drif_ctl_msff_ctl_macro__width_6 (
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

module mcu_drif_ctl_msff_ctl_macro__width_9 (
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

module mcu_drif_ctl_msff_ctl_macro__clr_1__width_16 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0] & ~{16{clr}};






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

module mcu_drif_ctl_msff_ctl_macro__clr_1__width_3 (
  din, 
  clr, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0] & ~{3{clr}};






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

module mcu_drif_ctl_msff_ctl_macro__clr_1__en_1__width_32 (
  din, 
  en, 
  clr, 
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
  input clr;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}} & ~{32{clr}}) | (dout[31:0] & ~{32{en}} & ~{32{clr}});






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

