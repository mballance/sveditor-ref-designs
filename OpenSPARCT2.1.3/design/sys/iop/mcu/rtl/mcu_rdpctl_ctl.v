// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_rdpctl_ctl.v
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



module mcu_rdpctl_ctl (
  rdpctl_scrub_addrinc_en, 
  rdpctl_err_addr_reg, 
  rdpctl_err_sts_reg, 
  rdpctl_err_loc, 
  rdpctl_err_cnt, 
  rdpctl_err_retry_reg, 
  rdpctl_dbg_trig_enable, 
  rdpctl_drq0_clear_ent, 
  rdpctl_drq1_clear_ent, 
  rdpctl_err_fifo_enq, 
  rdpctl_err_fifo_data, 
  rdpctl_fifo_empty, 
  rdpctl_fifo_full, 
  rdpctl_no_crc_err, 
  rdpctl_crc_err, 
  rdpctl_fbd0_recov_err, 
  rdpctl_fbd1_recov_err, 
  rdpctl_fbd_unrecov_err, 
  rdpctl_crc_recov_err, 
  rdpctl_crc_unrecov_err, 
  rdpctl_scrub_read_done, 
  rdpctl_scrb0_err_valid, 
  rdpctl_scrb1_err_valid, 
  rdpctl_l2t0_data_valid, 
  rdpctl_l2t1_data_valid, 
  rdpctl_qword_id, 
  rdpctl_rd_req_id, 
  rdpctl_pa_err, 
  rdpctl_radr_parity, 
  rdpctl_rddata_en, 
  rdpctl_inj_ecc_err, 
  rdpctl0_dummy_data_valid, 
  rdpctl1_dummy_data_valid, 
  rdpctl_secc_cnt_intr, 
  rdpctl_scrub_wren, 
  rdpctl_mask_err, 
  rdpctl_dtm_mask_chnl, 
  rdpctl_dtm_atspeed, 
  rdpctl_dtm_chnl_enable, 
  fbdic_serdes_dtm, 
  fbdic_rddata_vld, 
  fbdic_crc_error, 
  fbdic_chnl_reset_error, 
  drif_err_state_crc_fr, 
  fbdic_chnl_reset_error_mode, 
  fbdic_err_unrecov, 
  fbdic_err_recov, 
  fbdic_cfgrd_crc_error, 
  drif_send_info_val, 
  drif_send_info, 
  readdp_ecc_single_err, 
  readdp_ecc_multi_err, 
  readdp0_syndrome, 
  readdp1_syndrome, 
  readdp0_ecc_loc, 
  readdp1_ecc_loc, 
  drif_scrub_addr, 
  mcu_id, 
  drif_single_channel_mode, 
  l2if0_rd_dummy_req, 
  l2if0_rd_dummy_req_addr5, 
  l2if0_rd_dummy_req_id, 
  l2if0_rd_dummy_addr_err, 
  l2if1_rd_dummy_req, 
  l2if1_rd_dummy_req_addr5, 
  l2if1_rd_dummy_req_id, 
  l2if1_rd_dummy_addr_err, 
  drif_ucb_data_39to0, 
  drif_ucb_data_63to54, 
  drif_err_sts_reg_ld, 
  drif_err_addr_reg_ld, 
  drif_err_cnt_reg_ld, 
  drif_err_loc_reg_ld, 
  drif_err_retry_reg_ld, 
  drif_dbg_trig_reg_ld, 
  rdata_err_ecci, 
  rdata_pm_1mcu, 
  rdata_pm_2mcu, 
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
wire ff_pm_mcus_scanin;
wire ff_pm_mcus_scanout;
wire rdpctl_pm_1mcu;
wire rdpctl_pm_2mcu;
wire ff_dummy_req0_scanin;
wire ff_dummy_req0_scanout;
wire rdpctl0_rd_dummy_req_en;
wire rdpctl0_rd_dummy_req_addr5_in;
wire [2:0] rdpctl0_rd_dummy_req_id_in;
wire rdpctl0_rd_dummy_addr_err_in;
wire ff_dummy_req1_scanin;
wire ff_dummy_req1_scanout;
wire rdpctl1_rd_dummy_req_en;
wire rdpctl1_rd_dummy_req_addr5_in;
wire [2:0] rdpctl1_rd_dummy_req_id_in;
wire rdpctl1_rd_dummy_addr_err_in;
wire ff_ddp_data_valid_scanin;
wire ff_ddp_data_valid_scanout;
wire rdpctl_rddata_vld;
wire rdpctl_mcu_data_valid;
wire ff_ecc_loc_scanin;
wire ff_ecc_loc_scanout;
wire [35:0] rdpctl0_ecc_loc;
wire [35:0] rdpctl1_ecc_loc;
wire rdpctl_fifo_deq;
wire rdpctl_data_cnt;
wire rdpctl_data_cnt_in;
wire rdpctl0_dummy_data_valid_in;
wire rdpctl1_dummy_data_valid_in;
wire ff_data_cnt_scanin;
wire ff_data_cnt_scanout;
wire rdpctl_fifo_err_crc;
wire [19:0] rdpctl_fifo_ent0;
wire rdpctl_fifo_err_xaction;
wire rdpctl_fifo_rank_adr;
wire [2:0] rdpctl_fifo_dimm_adr;
wire [2:0] rdpctl_fifo_bank_adr;
wire rdpctl_fifo_addr_pa_err;
wire rdpctl_fifo_err_type;
wire rdpctl_fifo_addr_parity;
wire rdpctl_fifo_scrub;
wire [2:0] rdpctl_fifo_rd_index;
wire [2:0] rdpctl_fifo_rd_req_id;
wire rdpctl_fifo_err_xactnum;
wire rdpctl_fifo_qword_id;
wire rdpctl_fifo_l2bank;
wire otq_scanin;
wire otq_scanout;
wire rdpctl_fifo_addr_parity_p1;
wire rdpctl_clear_drq_entry;
wire rdpctl_fifo_deq_d1;
wire rdpctl_fifo_scrub_d1;
wire rdpctl_fifo_err_xaction_d1;
wire rdpctl_ecc_error;
wire rdpctl_crc_error_d1;
wire drif_err_state_crc_fr_d1;
wire rdpctl_clear_drq0_entry;
wire rdpctl_fifo_l2bank_d1;
wire rdpctl_clear_drq1_entry;
wire [7:0] rdpctl_drq0_clear_ent_in;
wire [2:0] rdpctl_fifo_rd_index_d1;
wire [7:0] rdpctl_drq1_clear_ent_in;
wire ff_drif_clear_ent_scanin;
wire ff_drif_clear_ent_scanout;
wire rdpctl_l2t0_data_valid_in;
wire rdpctl_crc_error_in;
wire rdpctl_crc_error;
wire rdpctl_l2t1_data_valid_in;
wire rdpctl_l2t_data_valid;
wire ff_l2t_data_valid_scanin;
wire ff_l2t_data_valid_scanout;
wire rdpctl_scrub_data_valid_in;
wire ff_scrub_data_valid_scanin;
wire ff_scrub_data_valid_scanout;
wire rdpctl_scrub_data_valid_out;
wire rdpctl_scrub_data_valid;
wire rdpctl_qword_id_in;
wire rdpctl0_rd_dummy_req_addr5;
wire rdpctl1_rd_dummy_req_addr5;
wire ff_qword_id_scanin;
wire ff_qword_id_scanout;
wire [2:0] rdpctl_rd_req_id_in;
wire [2:0] rdpctl0_rd_dummy_req_id;
wire [2:0] rdpctl1_rd_dummy_req_id;
wire ff_rd_req_id_scanin;
wire ff_rd_req_id_scanout;
wire rdpctl_pa_err_in;
wire rdpctl0_rd_dummy_addr_err;
wire rdpctl1_rd_dummy_addr_err;
wire ff_pa_err_scanin;
wire ff_pa_err_scanout;
wire rdpctl_crc_err_st0;
wire [1:0] rdpctl_rddata_state;
wire rdpctl_crc_err_st1;
wire rdpctl_crc_err_st0_d1;
wire rdpctl_crc_err_st2;
wire rdpctl_crc_err_st1_d1;
wire rdpctl_crc_err_st3;
wire rdpctl_crc_err_st2_d1;
wire ff_crc_err_dly_scanin;
wire ff_crc_err_dly_scanout;
wire readdp_ecc_multi_err_d1_in;
wire ff_mecc_errors_scanin;
wire ff_mecc_errors_scanout;
wire readdp_ecc_multi_err_d1;
wire readdp_ecc_multi_err_d2;
wire readdp_ecc_multi_err_d3;
wire rdpctl_ecc_multi_err;
wire [1:0] rdpctl_ecc_multi_err_d1;
wire rdpctl_ecc_single_err;
wire [1:0] rdpctl_ecc_single_err_d1;
wire rdpctl_err_type;
wire rdpctl_fifo_err_crc_d1;
wire [13:0] rdpctl_err_fifo_data_in;
wire ff_err_fifo_data_scanin;
wire ff_err_fifo_data_scanout;
wire ff_fifo_deq_d1_scanin;
wire ff_fifo_deq_d1_scanout;
wire rdpctl_fifo_err_type_d1;
wire rdpctl_fifo_err_xactnum_d1;
wire rdpctl_meu_error;
wire rdpctl_mec_error;
wire rdpctl_dac_error;
wire rdpctl_dau_error;
wire rdpctl_dsc_error;
wire rdpctl_dsu_error;
wire rdpctl_dbu_error;
wire rdpctl_meb_error;
wire rdpctl_fbu_error;
wire rdpctl_fbr_error;
wire rdpctl_meu_error_en;
wire rdpctl_meu_error_in;
wire pff_err_sts_bit63_wmr_scanin;
wire pff_err_sts_bit63_wmr_scanout;
wire rdpctl_mec_error_en;
wire rdpctl_mec_error_in;
wire pff_err_sts_bit62_wmr_scanin;
wire pff_err_sts_bit62_wmr_scanout;
wire rdpctl_dac_error_en;
wire rdpctl_dac_error_in;
wire pff_err_sts_bit61_wmr_scanin;
wire pff_err_sts_bit61_wmr_scanout;
wire rdpctl_dau_error_en;
wire rdpctl_dau_error_in;
wire pff_err_sts_bit60_wmr_scanin;
wire pff_err_sts_bit60_wmr_scanout;
wire rdpctl_dsc_error_en;
wire rdpctl_dsc_error_in;
wire pff_err_sts_bit59_wmr_scanin;
wire pff_err_sts_bit59_wmr_scanout;
wire rdpctl_dsu_error_en;
wire rdpctl_dsu_error_in;
wire pff_err_sts_bit58_wmr_scanin;
wire pff_err_sts_bit58_wmr_scanout;
wire rdpctl_dummy_dbu;
wire rdpctl_dbu_error_en;
wire rdpctl_dbu_error_in;
wire pff_err_sts_bit57_wmr_scanin;
wire pff_err_sts_bit57_wmr_scanout;
wire rdpctl_meb_error_en;
wire rdpctl_meb_error_in;
wire pff_err_sts_bit56_wmr_scanin;
wire pff_err_sts_bit56_wmr_scanout;
wire rdpctl_fbu_error_en;
wire rdpctl_fbu_error_in;
wire pff_err_sts_bit55_wmr_scanin;
wire pff_err_sts_bit55_wmr_scanout;
wire ff_fbd_unrecov_err_scanin;
wire ff_fbd_unrecov_err_scanout;
wire rdpctl_fbd_unrecov_err_1_in;
wire rdpctl_crc_unrecov_err_in;
wire ff_crc_unrecov_err_scanin;
wire ff_crc_unrecov_err_scanout;
wire rdpctl_fbr_error_en;
wire rdpctl_fbr_error_in;
wire pff_err_sts_bit54_wmr_scanin;
wire pff_err_sts_bit54_wmr_scanout;
wire rdpctl_fbd0_recov_err_in;
wire rdpctl_fbd1_recov_err_in;
wire ff_fbd_recov_err_scanin;
wire ff_fbd_recov_err_scanout;
wire rdpctl_crc_recov_err_in;
wire ff_crc_recov_err_scanin;
wire ff_crc_recov_err_scanout;
wire rdpctl_crc_recov_err_out;
wire ff_ecc_d1_scanin;
wire ff_ecc_d1_scanout;
wire [15:0] rdpctl0_syndrome;
wire [15:0] rdpctl1_syndrome;
wire rdpctl_err_sts_reg_en;
wire [15:0] rdpctl_err_sts_reg_in;
wire pff_err_syn_wmr_scanin;
wire pff_err_syn_wmr_scanout;
wire rdpctl_err_retry_ld_en;
wire rdpctl_err_retry_ld_clr;
wire ff_err_retry_ld_scanin;
wire ff_err_retry_ld_scanout;
wire rdpctl_err_retry_ld_out;
wire rdpctl_err_retry_ld;
wire rdpctl_retry_reg_valid;
wire [17:0] rdpctl_err_retry2_reg;
wire [17:0] rdpctl_err_retry1_reg;
wire rdpctl_err_retry1_reg_en;
wire [17:0] rdpctl_err_retry1_reg_in;
wire [15:0] rdpctl_retry_syndrome;
wire pff_err_retry1_wmr_scanin;
wire pff_err_retry1_wmr_scanout;
wire rdpctl_err_retry2_reg_en;
wire [17:0] rdpctl_err_retry2_reg_in;
wire pff_err_retry2_wmr_scanin;
wire pff_err_retry2_wmr_scanout;
wire rdpctl_err_retry2_reg_en_no_ld;
wire rdpctl_err_retry1_reg_en_no_ld;
wire rdpctl_retry_reg_valid_in;
wire rdpctl_retry_reg_valid_en;
wire pff_retry_reg_valid_wmr_scanin;
wire pff_retry_reg_valid_wmr_scanout;
wire rdpctl_syndrome_dly_en;
wire ff_syndrome_dly_scanin;
wire ff_syndrome_dly_scanout;
wire [15:0] rdpctl0_syndrome_d1;
wire [15:0] rdpctl1_syndrome_d1;
wire rdpctl_err_addr_reg_en;
wire [35:0] rdpctl_err_addr_reg_in;
wire [35:0] rdpctl_err_addr;
wire [1:0] rdpctl_scrub_data_cnt;
wire pff_err_addr_reg_wmr_scanin;
wire pff_err_addr_reg_wmr_scanout;
wire [1:1] rdpctl_scrub_data_cnt_in;
wire rdpctl_scrub_data_cnt_en;
wire ff_scrub_data_cnt_scanin;
wire ff_scrub_data_cnt_scanout;
wire [15:0] rdpctl_secc_cnt;
wire rdpctl_secc_int_en;
wire rdpctl_secc_cnt_intr_in;
wire rdpctl_secc_int_in;
wire pff_secc_int_en_wmr_scanin;
wire pff_secc_int_en_wmr_scanout;
wire rdpctl_secc_int_enabled;
wire rdpctl_secc_cnt_en;
wire [15:0] rdpctl_secc_cnt_next;
wire [15:0] rdpctl_secc_cnt_in;
wire pff_secc_cnt_wmr_scanin;
wire pff_secc_cnt_wmr_scanout;
wire ff_secc_cnt_intr_scanin;
wire ff_secc_cnt_intr_scanout;
wire [5:1] rdpctl_dbg_trig_enable_in;
wire pff_dbg_trig_wmr_scanin;
wire pff_dbg_trig_wmr_scanout;
wire rdpctl_secc_loc_en;
wire [35:0] rdpctl_err_loc_in;
wire pff_err_loc_wmr_scanin;
wire pff_err_loc_wmr_scanout;
wire rdpctl_scrb0_err_valid_in;
wire rdpctl_scrb1_err_valid_in;
wire ff_scrub_ecc_err_scanin;
wire ff_scrub_ecc_err_scanout;
wire ff_rd_dummy_req0_scanin;
wire ff_rd_dummy_req0_scanout;
wire rdpctl0_rd_dummy_req;
wire ff_rd_dummy0_scanin;
wire ff_rd_dummy0_scanout;
wire ff_rd_dummy_req1_scanin;
wire ff_rd_dummy_req1_scanout;
wire rdpctl1_rd_dummy_req;
wire ff_rd_dummy1_scanin;
wire ff_rd_dummy1_scanout;
wire rdpctl_dummy_priority_in;
wire rdpctl_dummy_priority;
wire ff_dummy_priority_scanin;
wire ff_dummy_priority_scanout;
wire ff_dummy_data_valid_scanin;
wire ff_dummy_data_valid_scanout;
wire rdpctl_scrub_wren_out;
wire rdpctl_scrub_wren_in;
wire ff_scrub_wren_scanin;
wire ff_scrub_wren_scanout;
wire [1:0] rdpctl_rddata_state_in;
wire ff_rddata_state_scanin;
wire ff_rddata_state_scanout;
wire ff_err_ecci_scanin;
wire ff_err_ecci_scanout;
wire rdpctl_err_ecci;
wire spares_scanin;
wire spares_scanout;


output		rdpctl_scrub_addrinc_en; // increment scrub address

// error registers to drif block for read access
output	[35:0]	rdpctl_err_addr_reg;	
output	[25:0]	rdpctl_err_sts_reg;
output	[35:0]	rdpctl_err_loc;
output	[15:0]	rdpctl_err_cnt;
output	[36:0]	rdpctl_err_retry_reg;
output		rdpctl_dbg_trig_enable;	// debug mode trigger enable

// clear entries from read queues when dequeued from rdpctl fifo if no errors
output	[7:0]	rdpctl_drq0_clear_ent;
output	[7:0]	rdpctl_drq1_clear_ent;

// error information to drif for error retries
output		rdpctl_err_fifo_enq;
output	[14:0]	rdpctl_err_fifo_data;
output		rdpctl_fifo_empty;
output		rdpctl_fifo_full;
output		rdpctl_no_crc_err;
output		rdpctl_crc_err;
output		rdpctl_fbd0_recov_err;
output		rdpctl_fbd1_recov_err;
output	[1:0]	rdpctl_fbd_unrecov_err;
output		rdpctl_crc_recov_err;
output		rdpctl_crc_unrecov_err;

output		rdpctl_scrub_read_done;	// resets outstanding scrub flop

output		rdpctl_scrb0_err_valid;
output		rdpctl_scrb1_err_valid;

output		rdpctl_l2t0_data_valid;	// data valid signal to rdata_ctl for L2 0
output		rdpctl_l2t1_data_valid;	// data valid signal to rdata_ctl for L2 1
output 		rdpctl_qword_id;	// quad-word id for returning data sub-packet
output	[2:0]	rdpctl_rd_req_id;	// read request id for returning data packet
output		rdpctl_pa_err;		// physical address error bit to OR with mecc

output		rdpctl_radr_parity;	// parity to readdp
output	[2:0]	rdpctl_rddata_en;	// read data enable for single-dimm mode
output		rdpctl_inj_ecc_err;	// ecc error injection for readdp

// indicates to rdata block when empty is coming to respond to dummy read
output		rdpctl0_dummy_data_valid;
output		rdpctl1_dummy_data_valid;

output		rdpctl_secc_cnt_intr;	// single ecc error counter interrupt

output		rdpctl_scrub_wren;	// write enable for wrdp scrub data buffer

output		rdpctl_mask_err;
output	[1:0]	rdpctl_dtm_mask_chnl;
output		rdpctl_dtm_atspeed;
output	[1:0]	rdpctl_dtm_chnl_enable;

input		fbdic_serdes_dtm;

input		fbdic_rddata_vld;	// read data from fbdic valid
input		fbdic_crc_error;
input		fbdic_chnl_reset_error;
input		drif_err_state_crc_fr;
input		fbdic_chnl_reset_error_mode;
input		fbdic_err_unrecov;
input		fbdic_err_recov;
input		fbdic_cfgrd_crc_error;

// information associated with returning read data
input		drif_send_info_val;	// which send_info buses are valid
input	[19:0]	drif_send_info;		// info for CMD A slot (rd or wr)

input	[1:0]	readdp_ecc_single_err;	// single-bit ecc error detected
input	[1:0]	readdp_ecc_multi_err;	// multiple-bit ecc error detected
input	[15:0]	readdp0_syndrome;	// ecc syndrome bits for error reporting
input	[15:0]	readdp1_syndrome;	// ecc syndrome bits for error reporting
input	[35:0]	readdp0_ecc_loc;		// error nibble for error reporting
input	[35:0]	readdp1_ecc_loc;		// error nibble for error reporting

input	[31:0]	drif_scrub_addr;	// scrub address for error logging
input	[1:0]	mcu_id;			// for scrub address in address error register, 
					//	to indicate in which mcu error occurred

// SDRAM address generation information
input		drif_single_channel_mode;

// 
input		l2if0_rd_dummy_req;
input		l2if0_rd_dummy_req_addr5;
input	[2:0]	l2if0_rd_dummy_req_id;
input		l2if0_rd_dummy_addr_err;
input		l2if1_rd_dummy_req;
input		l2if1_rd_dummy_req_addr5;
input	[2:0]	l2if1_rd_dummy_req_id;
input		l2if1_rd_dummy_addr_err;

// register write interface for rdpctl
input	[39:0]	drif_ucb_data_39to0;
input	[63:54]	drif_ucb_data_63to54;
input		drif_err_sts_reg_ld;
input		drif_err_addr_reg_ld;
input		drif_err_cnt_reg_ld;
input		drif_err_loc_reg_ld;
input		drif_err_retry_reg_ld;
input		drif_dbg_trig_reg_ld;

input		rdata_err_ecci;

input		rdata_pm_1mcu;
input		rdata_pm_2mcu;

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

// 0in set_clock drl2clk -default
mcu_rdpctl_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(drl2clk),
 	.l1en(1'b1 ),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

mcu_rdpctl_ctl_msff_ctl_macro__width_2 ff_pm_mcus  (
	.scan_in(ff_pm_mcus_scanin),
	.scan_out(ff_pm_mcus_scanout),
	.din({rdata_pm_1mcu,rdata_pm_2mcu}),
	.dout({rdpctl_pm_1mcu,rdpctl_pm_2mcu}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__width_6 ff_dummy_req0  (
	.scan_in(ff_dummy_req0_scanin),
	.scan_out(ff_dummy_req0_scanout),
	.din({l2if0_rd_dummy_req, l2if0_rd_dummy_req_addr5, l2if0_rd_dummy_req_id[2:0], l2if0_rd_dummy_addr_err}),
	.dout({rdpctl0_rd_dummy_req_en, rdpctl0_rd_dummy_req_addr5_in, rdpctl0_rd_dummy_req_id_in[2:0], rdpctl0_rd_dummy_addr_err_in}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__width_6 ff_dummy_req1  (
	.scan_in(ff_dummy_req1_scanin),
	.scan_out(ff_dummy_req1_scanout),
	.din({l2if1_rd_dummy_req, l2if1_rd_dummy_req_addr5, l2if1_rd_dummy_req_id[2:0], l2if1_rd_dummy_addr_err}),
	.dout({rdpctl1_rd_dummy_req_en, rdpctl1_rd_dummy_req_addr5_in, rdpctl1_rd_dummy_req_id_in[2:0], rdpctl1_rd_dummy_addr_err_in}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro ff_ddp_data_valid (
	.scan_in(ff_ddp_data_valid_scanin),
	.scan_out(ff_ddp_data_valid_scanout),
	.din(rdpctl_rddata_vld),
	.dout(rdpctl_mcu_data_valid),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__width_72 ff_ecc_loc  (
	.scan_in(ff_ecc_loc_scanin),
	.scan_out(ff_ecc_loc_scanout),
	.din({readdp0_ecc_loc[35:0],readdp1_ecc_loc[35:0]}),
	.dout({rdpctl0_ecc_loc[35:0],rdpctl1_ecc_loc[35:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// This part of code controls the 16 deep FIFO that directs the data that comes back
// from the SDRAMs

assign rdpctl_fifo_deq = rdpctl_data_cnt & rdpctl_mcu_data_valid;

assign rdpctl_data_cnt_in = rdpctl_mcu_data_valid | rdpctl0_dummy_data_valid_in | rdpctl1_dummy_data_valid_in ? 
				~rdpctl_data_cnt : rdpctl_data_cnt;

mcu_rdpctl_ctl_msff_ctl_macro__width_1 ff_data_cnt  (
	.scan_in(ff_data_cnt_scanin),
	.scan_out(ff_data_cnt_scanout),
	.din(rdpctl_data_cnt_in),
	.dout(rdpctl_data_cnt),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// 19 - crc error retry
// 18 - error mode transaction
// 17 - drif_rank_adr_d1 - for error retry
// 16:14 - drif_dimm_adr_d1 - for error retry
// 13:11 - drif_bank_adr_d1[2:0] - for error retry
// 10 - drif_addr_err_d1 - out of bound error
// 9 - drif_addr_parity_d1
// 8 - drif_scrub_picked_d1 
// 7:5 - drif_rd_index_d1[2:0] - index to free
// 4:2 - drif_rd_req_id_d1[2:0]
// 1 - drif_cas_adr_d1[1] - qword_id (PA[5])
// 0 - drif1_rd_picked_d1 - return to l2t1

assign rdpctl_fifo_err_crc = rdpctl_fifo_ent0[19];
assign rdpctl_fifo_err_xaction = rdpctl_fifo_ent0[18];
assign rdpctl_fifo_rank_adr = rdpctl_fifo_ent0[17];
assign rdpctl_fifo_dimm_adr[2:0] = rdpctl_fifo_ent0[16:14];
assign rdpctl_fifo_bank_adr[2:0] = rdpctl_fifo_ent0[13:11];
assign rdpctl_fifo_addr_pa_err = rdpctl_fifo_ent0[10] & ~rdpctl_fifo_err_xaction;
assign rdpctl_fifo_err_type = rdpctl_fifo_ent0[10] & rdpctl_fifo_err_xaction;
assign rdpctl_fifo_addr_parity = rdpctl_fifo_ent0[9];
assign rdpctl_fifo_scrub = rdpctl_fifo_ent0[8];
assign rdpctl_fifo_rd_index[2:0] = rdpctl_fifo_ent0[7:5];
assign rdpctl_fifo_rd_req_id[2:0] = rdpctl_fifo_ent0[4:2];
assign rdpctl_fifo_err_xactnum = rdpctl_fifo_ent0[2];
assign rdpctl_fifo_qword_id = rdpctl_fifo_ent0[1];
assign rdpctl_fifo_l2bank = rdpctl_fifo_ent0[0];

mcu_otq_ctl otq (
	.scan_in(otq_scanin),
	.scan_out(otq_scanout),
	.l1clk(l1clk),
	.otq_enq(drif_send_info_val),
	.otq_din(drif_send_info[19:0]),
	.otq_deq(rdpctl_fifo_deq),
	.otq_dout(rdpctl_fifo_ent0[19:0]),
	.next_otq_dout_9(rdpctl_fifo_addr_parity_p1),
	.otq_full(rdpctl_fifo_full),
	.otq_empty(rdpctl_fifo_empty),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en)
);

// Clear a read entry in the Read Request Queues
assign rdpctl_clear_drq_entry = rdpctl_fifo_deq_d1 & (~rdpctl_fifo_scrub_d1 & ~rdpctl_fifo_err_xaction_d1 & 
				(~rdpctl_ecc_error | rdpctl_pa_err) & (~rdpctl_crc_error_d1 | drif_err_state_crc_fr_d1) |
				fbdic_chnl_reset_error_mode);
assign rdpctl_clear_drq0_entry = rdpctl_clear_drq_entry & ~rdpctl_fifo_l2bank_d1;
assign rdpctl_clear_drq1_entry = rdpctl_clear_drq_entry & rdpctl_fifo_l2bank_d1;

assign rdpctl_drq0_clear_ent_in[0] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h0) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[1] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h1) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[2] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h2) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[3] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h3) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[4] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h4) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[5] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h5) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[6] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h6) & rdpctl_clear_drq0_entry;
assign rdpctl_drq0_clear_ent_in[7] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h7) & rdpctl_clear_drq0_entry;

assign rdpctl_drq1_clear_ent_in[0] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h0) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[1] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h1) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[2] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h2) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[3] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h3) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[4] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h4) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[5] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h5) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[6] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h6) & rdpctl_clear_drq1_entry;
assign rdpctl_drq1_clear_ent_in[7] = (rdpctl_fifo_rd_index_d1[2:0] == 3'h7) & rdpctl_clear_drq1_entry;

mcu_rdpctl_ctl_msff_ctl_macro__width_16 ff_drif_clear_ent  (
	.scan_in(ff_drif_clear_ent_scanin),
	.scan_out(ff_drif_clear_ent_scanout),
	.din({rdpctl_drq0_clear_ent_in[7:0],rdpctl_drq1_clear_ent_in[7:0]}),
	.dout({rdpctl_drq0_clear_ent[7:0],rdpctl_drq1_clear_ent[7:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// generate data valid signals for rdata block
assign rdpctl_l2t0_data_valid_in = ~rdpctl_fifo_l2bank & ~rdpctl_fifo_scrub & ~rdpctl_fifo_err_xaction & 
				  (~rdpctl_crc_error_in & ~rdpctl_crc_error | drif_err_state_crc_fr) & 
				    rdpctl_mcu_data_valid | rdpctl0_dummy_data_valid_in;
assign rdpctl_l2t1_data_valid_in = rdpctl_fifo_l2bank & ~rdpctl_fifo_scrub & ~rdpctl_fifo_err_xaction & 
				 (~rdpctl_crc_error_in & ~rdpctl_crc_error | drif_err_state_crc_fr) & 
				   rdpctl_mcu_data_valid | rdpctl1_dummy_data_valid_in;
assign rdpctl_l2t_data_valid = rdpctl_l2t0_data_valid & ~rdpctl0_dummy_data_valid | 
				rdpctl_l2t1_data_valid & ~rdpctl1_dummy_data_valid;

mcu_rdpctl_ctl_msff_ctl_macro__width_2 ff_l2t_data_valid  (
	.scan_in(ff_l2t_data_valid_scanin),
	.scan_out(ff_l2t_data_valid_scanout),
	.din({rdpctl_l2t0_data_valid_in,rdpctl_l2t1_data_valid_in}),
	.dout({rdpctl_l2t0_data_valid,   rdpctl_l2t1_data_valid}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_scrub_data_valid_in = rdpctl_fifo_scrub & rdpctl_mcu_data_valid & ~rdpctl_fifo_err_xaction;

mcu_rdpctl_ctl_msff_ctl_macro__width_1 ff_scrub_data_valid  (
	.scan_in(ff_scrub_data_valid_scanin),
	.scan_out(ff_scrub_data_valid_scanout),
	.din(rdpctl_scrub_data_valid_in),
	.dout(rdpctl_scrub_data_valid_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

	assign rdpctl_scrub_data_valid = rdpctl_scrub_data_valid_out & ~rdpctl_crc_error & ~rdpctl_crc_error_d1;

// generate qword id for rdata block
assign rdpctl_qword_id_in = (rdpctl0_dummy_data_valid_in ? rdpctl0_rd_dummy_req_addr5 : 
				rdpctl1_dummy_data_valid_in ? rdpctl1_rd_dummy_req_addr5 : rdpctl_fifo_qword_id) ^ rdpctl_data_cnt;
mcu_rdpctl_ctl_msff_ctl_macro__width_1 ff_qword_id  (
	.scan_in(ff_qword_id_scanin),
	.scan_out(ff_qword_id_scanout),
	.din(rdpctl_qword_id_in),
	.dout(rdpctl_qword_id),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// generate read request id for rdata block
assign rdpctl_rd_req_id_in[2:0] = rdpctl0_dummy_data_valid_in ? rdpctl0_rd_dummy_req_id[2:0] : 
				rdpctl1_dummy_data_valid_in ? rdpctl1_rd_dummy_req_id[2:0] : rdpctl_fifo_rd_req_id[2:0];
mcu_rdpctl_ctl_msff_ctl_macro__width_3 ff_rd_req_id  (
	.scan_in(ff_rd_req_id_scanin),
	.scan_out(ff_rd_req_id_scanout),
	.din(rdpctl_rd_req_id_in[2:0]),
	.dout(rdpctl_rd_req_id[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// generate pa error bit for rdata block
assign rdpctl_pa_err_in = rdpctl0_dummy_data_valid_in ? rdpctl0_rd_dummy_addr_err : 
			  rdpctl1_dummy_data_valid_in ? rdpctl1_rd_dummy_addr_err : rdpctl_fifo_addr_pa_err;
mcu_rdpctl_ctl_msff_ctl_macro__width_1 ff_pa_err  (
	.scan_in(ff_pa_err_scanin),
	.scan_out(ff_pa_err_scanout),
	.din(rdpctl_pa_err_in),
	.dout(rdpctl_pa_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// CRC error - nay need to drop data going to L2
assign rdpctl_crc_err_st0 = fbdic_crc_error & fbdic_rddata_vld & (rdpctl_rddata_state[1:0] == 2'h0);
assign rdpctl_crc_err_st1 = fbdic_crc_error & fbdic_rddata_vld & (rdpctl_rddata_state[1:0] == 2'h1) | rdpctl_crc_err_st0_d1;
assign rdpctl_crc_err_st2 = fbdic_crc_error & fbdic_rddata_vld & (rdpctl_rddata_state[1:0] == 2'h2) | rdpctl_crc_err_st1_d1;
assign rdpctl_crc_err_st3 = fbdic_crc_error & fbdic_rddata_vld & (rdpctl_rddata_state[1:0] == 2'h3) | rdpctl_crc_err_st2_d1;
assign rdpctl_crc_error_in = ~rdpctl_fifo_addr_pa_err & 
				(drif_single_channel_mode ? rdpctl_crc_err_st3 : rdpctl_crc_err_st1);

mcu_rdpctl_ctl_msff_ctl_macro__width_6 ff_crc_err_dly  (
	.scan_in(ff_crc_err_dly_scanin),
	.scan_out(ff_crc_err_dly_scanout),
	.din({ rdpctl_crc_err_st0,    rdpctl_crc_err_st1,    rdpctl_crc_err_st2,    rdpctl_crc_error_in,
		rdpctl_crc_error,    drif_err_state_crc_fr}),
	.dout({rdpctl_crc_err_st0_d1, rdpctl_crc_err_st1_d1, rdpctl_crc_err_st2_d1, rdpctl_crc_error,   
		rdpctl_crc_error_d1, drif_err_state_crc_fr_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_no_crc_err = rdpctl_fifo_deq & ~rdpctl_crc_error & rdpctl_fifo_err_crc;
assign rdpctl_crc_err = rdpctl_fifo_deq & rdpctl_crc_error & rdpctl_fifo_err_crc;


// set rdpctl_ecc_error when error occurs, clear when dequeued from rdpctl fifo;
// entry will be written into error fifo in drif_ctl and error fifo's not_empty 
// will disable additional requests from being issued.

assign readdp_ecc_multi_err_d1_in = |readdp_ecc_multi_err[1:0];
mcu_rdpctl_ctl_msff_ctl_macro__width_3 ff_mecc_errors  (
	.scan_in(ff_mecc_errors_scanin),
	.scan_out(ff_mecc_errors_scanout),
	.din({readdp_ecc_multi_err_d1_in,readdp_ecc_multi_err_d1,readdp_ecc_multi_err_d2}),
	.dout({readdp_ecc_multi_err_d1,readdp_ecc_multi_err_d2,readdp_ecc_multi_err_d3}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_ecc_multi_err = (|readdp_ecc_multi_err[1:0]) | (|rdpctl_ecc_multi_err_d1[1:0]);

//assign readdp_ecc_single_err_d1_in = |readdp_ecc_single_err[1:0];
//msff_ctl_macro ff_secc_errors (width=3) (
//	.scan_in(ff_secc_errors_scanin),
//	.scan_out(ff_secc_errors_scanout),
//	.din({readdp_ecc_single_err_d1_in,readdp_ecc_single_err_d1,readdp_ecc_single_err_d2}),
//	.dout({readdp_ecc_single_err_d1,readdp_ecc_single_err_d2,readdp_ecc_single_err_d3}),
//	.l1clk(l1clk));

assign rdpctl_ecc_single_err = (|readdp_ecc_single_err[1:0]) | (|rdpctl_ecc_single_err_d1[1:0]);

assign rdpctl_ecc_error = rdpctl_ecc_multi_err | rdpctl_ecc_single_err;
assign rdpctl_err_type = rdpctl_ecc_multi_err;

// send error retry info to drif when error occurs (if it is not already a retry)
assign rdpctl_err_fifo_enq = rdpctl_fifo_deq_d1 & ((rdpctl_ecc_multi_err | rdpctl_ecc_single_err) &
                                        ~(rdpctl_fifo_err_xaction_d1 | rdpctl_crc_error_d1) |
                                rdpctl_crc_error_d1 & ~(rdpctl_fifo_err_crc_d1 | rdpctl_fifo_err_xaction_d1)) &
                                        ~(rdpctl_pa_err | fbdic_chnl_reset_error_mode);

assign rdpctl_err_fifo_data_in[13:0] = {rdpctl_crc_error, rdpctl_fifo_rank_adr,rdpctl_fifo_dimm_adr[2:0],
					rdpctl_fifo_bank_adr[2:0], rdpctl_fifo_addr_parity, rdpctl_fifo_scrub,
					rdpctl_fifo_rd_index[2:0], rdpctl_fifo_l2bank};

assign rdpctl_fifo_scrub_d1 = rdpctl_err_fifo_data[5];
assign rdpctl_fifo_rd_index_d1[2:0] = rdpctl_err_fifo_data[4:2];
assign rdpctl_fifo_l2bank_d1 = rdpctl_err_fifo_data[0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_14 ff_err_fifo_data  (
	.scan_in(ff_err_fifo_data_scanin),
	.scan_out(ff_err_fifo_data_scanout),
	.din(rdpctl_err_fifo_data_in[13:0]),
	.dout({rdpctl_err_fifo_data[14:2],rdpctl_err_fifo_data[0]}),
	.en(rdpctl_fifo_deq),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_err_fifo_data[1] = ~rdpctl_crc_error;

mcu_rdpctl_ctl_msff_ctl_macro__width_5 ff_fifo_deq_d1  (
	.scan_in(ff_fifo_deq_d1_scanin),
	.scan_out(ff_fifo_deq_d1_scanout),
	.din({rdpctl_fifo_deq,rdpctl_fifo_err_xaction,rdpctl_fifo_err_type,rdpctl_fifo_err_xactnum,
		rdpctl_fifo_err_crc}),
	.dout({rdpctl_fifo_deq_d1,rdpctl_fifo_err_xaction_d1,rdpctl_fifo_err_type_d1,rdpctl_fifo_err_xactnum_d1,
		rdpctl_fifo_err_crc_d1}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// scrub addressing
assign rdpctl_scrub_addrinc_en = rdpctl_fifo_deq_d1 & rdpctl_fifo_scrub_d1 & ~rdpctl_ecc_error & 
					~rdpctl_fifo_err_xaction_d1;

// let drif know scrub is done so next scrub can be issued
assign rdpctl_scrub_read_done = rdpctl_fifo_deq_d1 & rdpctl_fifo_scrub_d1 & 
					~rdpctl_fifo_err_xaction_d1;

// Error type bits for error status register
assign rdpctl_err_sts_reg[25:16] = {rdpctl_meu_error, rdpctl_mec_error, rdpctl_dac_error, rdpctl_dau_error,
					rdpctl_dsc_error, rdpctl_dsu_error, rdpctl_dbu_error, rdpctl_meb_error,
					rdpctl_fbu_error, rdpctl_fbr_error};
///////
// Multiple uncorrected errors 
// If s/w write and error occurs in same cycle, h/w update has priority.
///////

assign rdpctl_meu_error_en = (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & ~rdpctl_pa_err & 
				((rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & (|readdp_ecc_multi_err[1:0]) | 
				(&readdp_ecc_multi_err[1:0])) | 
			     (rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & 
				(drif_err_state_crc_fr & rdpctl_crc_err & rdpctl_fifo_err_crc | 
			     	fbdic_err_unrecov | fbdic_chnl_reset_error) |
			     drif_err_sts_reg_ld;
assign rdpctl_meu_error_in = (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & ~rdpctl_pa_err & 
				((rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & (|readdp_ecc_multi_err[1:0]) | 
				(&readdp_ecc_multi_err[1:0])) | 
			     (rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & 
				(drif_err_state_crc_fr & rdpctl_crc_err & rdpctl_fifo_err_crc | 
			     	fbdic_err_unrecov | fbdic_chnl_reset_error) ? 1'b1 : 	
					~drif_ucb_data_63to54[63] & rdpctl_meu_error;
			
mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit63  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit63_wmr_scanin),
	.scan_out(pff_err_sts_bit63_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_meu_error_in),
	.dout(rdpctl_meu_error),
	.en(rdpctl_meu_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// Multiple corrected errors 
///////

assign rdpctl_mec_error_en = (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & 
				((rdpctl_dac_error | rdpctl_dsc_error | rdpctl_fbr_error |
				  rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & (|readdp_ecc_single_err[1:0]) |
				(&readdp_ecc_single_err[1:0]) | 
					(|readdp_ecc_single_err[1:0]) & (|readdp_ecc_multi_err[1:0])) | 
			     (rdpctl_dac_error | rdpctl_dsc_error | rdpctl_fbr_error |
				rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & 
				(rdpctl_no_crc_err & rdpctl_fifo_err_crc | fbdic_err_recov) |
			     drif_err_sts_reg_ld;
assign rdpctl_mec_error_in = (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & 
				((rdpctl_dac_error | rdpctl_dsc_error | rdpctl_fbr_error |
				  rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & (|readdp_ecc_single_err[1:0]) |
				(&readdp_ecc_single_err[1:0]) | 
					(|readdp_ecc_single_err[1:0]) & (|readdp_ecc_multi_err[1:0])) | 
			     (rdpctl_dac_error | rdpctl_dsc_error | rdpctl_fbr_error |
				  rdpctl_dau_error | rdpctl_dsu_error | rdpctl_fbu_error) & 
				(rdpctl_no_crc_err & rdpctl_fifo_err_crc | fbdic_err_recov) ? 1'b1 : 
								~drif_ucb_data_63to54[62] & rdpctl_mec_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit62  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit62_wmr_scanin),
	.scan_out(pff_err_sts_bit62_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_mec_error_in),
	.dout(rdpctl_mec_error),
	.en(rdpctl_mec_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// DRAM access correctable error
///////
assign rdpctl_dac_error_en = rdpctl_l2t_data_valid & ~rdpctl_dac_error & (|readdp_ecc_single_err[1:0]) |
				drif_err_sts_reg_ld;
assign rdpctl_dac_error_in = rdpctl_l2t_data_valid & ~rdpctl_dac_error & (|readdp_ecc_single_err[1:0]) ? 1'b1 : 
					~drif_ucb_data_63to54[61] & rdpctl_dac_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit61  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit61_wmr_scanin),
	.scan_out(pff_err_sts_bit61_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dac_error_in),
	.dout(rdpctl_dac_error),
	.en(rdpctl_dac_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// DRAM access uncorrectable error
///////

assign rdpctl_dau_error_en = rdpctl_l2t_data_valid & ~rdpctl_dau_error & (|readdp_ecc_multi_err[1:0]) & 
				~rdpctl_pa_err & ~rdpctl_fbd_unrecov_err[0] | drif_err_sts_reg_ld;
assign rdpctl_dau_error_in = rdpctl_l2t_data_valid & ~rdpctl_dau_error & (|readdp_ecc_multi_err[1:0]) & 
				~rdpctl_pa_err & ~rdpctl_fbd_unrecov_err[0] ? 1'b1 : 
					~drif_ucb_data_63to54[60] & rdpctl_dau_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit60  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit60_wmr_scanin),
	.scan_out(pff_err_sts_bit60_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dau_error_in),
	.dout(rdpctl_dau_error),
	.en(rdpctl_dau_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// Scrub access correctable error
///////
assign rdpctl_dsc_error_en = rdpctl_scrub_data_valid & ~rdpctl_dsc_error & (|readdp_ecc_single_err[1:0]) | drif_err_sts_reg_ld;
assign rdpctl_dsc_error_in = rdpctl_scrub_data_valid & ~rdpctl_dsc_error & (|readdp_ecc_single_err[1:0]) ?
					1'b1 : ~drif_ucb_data_63to54[59] & rdpctl_dsc_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit59  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit59_wmr_scanin),
	.scan_out(pff_err_sts_bit59_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dsc_error_in),
	.dout(rdpctl_dsc_error),
	.en(rdpctl_dsc_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// Scrub access uncorrectable error
///////

assign rdpctl_dsu_error_en = rdpctl_scrub_data_valid & ~rdpctl_dsu_error & (|readdp_ecc_multi_err[1:0]) & ~rdpctl_pa_err |
				 drif_err_sts_reg_ld;
assign rdpctl_dsu_error_in = rdpctl_scrub_data_valid & ~rdpctl_dsu_error & (|readdp_ecc_multi_err[1:0]) & ~rdpctl_pa_err ?
				1'b1 : ~drif_ucb_data_63to54[58] & rdpctl_dsu_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit58  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit58_wmr_scanin),
	.scan_out(pff_err_sts_bit58_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dsu_error_in),
	.dout(rdpctl_dsu_error),
	.en(rdpctl_dsu_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// OUT of BOUND PA error
///////
assign rdpctl_dummy_dbu = ~rdpctl0_dummy_data_valid_in & rdpctl0_dummy_data_valid & rdpctl0_rd_dummy_addr_err |
			  ~rdpctl1_dummy_data_valid_in & rdpctl1_dummy_data_valid & rdpctl1_rd_dummy_addr_err;

assign rdpctl_dbu_error_en = rdpctl_fifo_deq & rdpctl_fifo_addr_pa_err | rdpctl_dummy_dbu | drif_err_sts_reg_ld;
assign rdpctl_dbu_error_in = rdpctl_fifo_deq & rdpctl_fifo_addr_pa_err | rdpctl_dummy_dbu ? 1'b1 : 
			     						 ~drif_ucb_data_63to54[57] & rdpctl_dbu_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit57  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit57_wmr_scanin),
	.scan_out(pff_err_sts_bit57_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dbu_error_in),
	.dout(rdpctl_dbu_error),
	.en(rdpctl_dbu_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// Multiple out of bound PA error
///////
assign rdpctl_meb_error_en = (rdpctl_fifo_deq & rdpctl_fifo_addr_pa_err | rdpctl_dummy_dbu) & rdpctl_dbu_error | 
			     	drif_err_sts_reg_ld;
assign rdpctl_meb_error_in = (rdpctl_fifo_deq & rdpctl_fifo_addr_pa_err | rdpctl_dummy_dbu) & rdpctl_dbu_error ? 1'b1 : 
							~drif_ucb_data_63to54[56] & rdpctl_meb_error;

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_err_sts_bit56  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit56_wmr_scanin),
	.scan_out(pff_err_sts_bit56_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_meb_error_in),
	.dout(rdpctl_meb_error),
	.en(rdpctl_meb_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

///////
// FBU
///////
assign rdpctl_fbu_error_en = drif_err_state_crc_fr & rdpctl_crc_err & rdpctl_fifo_err_crc | 
			     fbdic_err_unrecov | fbdic_chnl_reset_error | drif_err_sts_reg_ld;
assign rdpctl_fbu_error_in = drif_err_state_crc_fr & rdpctl_crc_err & rdpctl_fifo_err_crc | 
				fbdic_err_unrecov | fbdic_chnl_reset_error ? 1'b1 :
				rdpctl_fbu_error & ~drif_ucb_data_63to54[55];

mcu_rdpctl_ctl_msff_ctl_macro__en_1 pff_err_sts_bit55  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit55_wmr_scanin),
	.scan_out(pff_err_sts_bit55_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_fbu_error_in),
	.dout(rdpctl_fbu_error),
	.en(rdpctl_fbu_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

// Unrecoverable error signals to RDATA: [0] => mecc_err, [1] => scb_mecc_err
assign rdpctl_fbd_unrecov_err[0] = rdpctl_crc_unrecov_err;

mcu_rdpctl_ctl_msff_ctl_macro ff_fbd_unrecov_err (
	.scan_in(ff_fbd_unrecov_err_scanin),
	.scan_out(ff_fbd_unrecov_err_scanout),
	.din(rdpctl_fbd_unrecov_err_1_in),
	.dout(rdpctl_fbd_unrecov_err[1]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_fbd_unrecov_err_1_in = fbdic_err_unrecov | fbdic_chnl_reset_error |
			drif_err_state_crc_fr & rdpctl_crc_err & rdpctl_fifo_err_crc & rdpctl_fifo_scrub;

// Report CRC unrecoverable error back to FBDIC for MCU Syndrome Register
assign rdpctl_crc_unrecov_err_in = drif_err_state_crc_fr & (rdpctl_crc_error | rdpctl_crc_error_in) |
				   fbdic_chnl_reset_error_mode;

mcu_rdpctl_ctl_msff_ctl_macro ff_crc_unrecov_err (
	.scan_in(ff_crc_unrecov_err_scanin),
	.scan_out(ff_crc_unrecov_err_scanout),
	.din(rdpctl_crc_unrecov_err_in),
	.dout(rdpctl_crc_unrecov_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

///////
// FBR
///////
assign rdpctl_fbr_error_en = rdpctl_no_crc_err & rdpctl_fifo_err_crc | fbdic_err_recov | drif_err_sts_reg_ld;
assign rdpctl_fbr_error_in = rdpctl_no_crc_err & rdpctl_fifo_err_crc | fbdic_err_recov ? 1'b1 : 
					rdpctl_fbr_error & ~drif_ucb_data_63to54[54];

mcu_rdpctl_ctl_msff_ctl_macro__en_1 pff_err_sts_bit54  ( // FS:wmr_protect
	.scan_in(pff_err_sts_bit54_wmr_scanin),
	.scan_out(pff_err_sts_bit54_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_fbr_error_in),
	.dout(rdpctl_fbr_error),
	.en(rdpctl_fbr_error_en),
	.l1clk(l1clk),
  .soclk(soclk));

// Report recoverable errors to RDATA
assign rdpctl_fbd0_recov_err_in = (rdpctl_no_crc_err & rdpctl_fifo_err_crc & ~rdpctl_fifo_l2bank | fbdic_err_recov) & 
					~fbdic_chnl_reset_error_mode;
assign rdpctl_fbd1_recov_err_in = rdpctl_no_crc_err & rdpctl_fifo_err_crc & rdpctl_fifo_l2bank & 
					~fbdic_chnl_reset_error_mode;

mcu_rdpctl_ctl_msff_ctl_macro__width_2 ff_fbd_recov_err  (
	.scan_in(ff_fbd_recov_err_scanin),
	.scan_out(ff_fbd_recov_err_scanout),
	.din({rdpctl_fbd0_recov_err_in,rdpctl_fbd1_recov_err_in}),
	.dout({rdpctl_fbd0_recov_err,rdpctl_fbd1_recov_err}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Report CRC recoverable errors to FBDIC for MCU Syndrome Register
assign rdpctl_crc_recov_err_in = rdpctl_no_crc_err & rdpctl_fifo_err_crc & ~fbdic_chnl_reset_error_mode;
mcu_rdpctl_ctl_msff_ctl_macro ff_crc_recov_err (
	.scan_in(ff_crc_recov_err_scanin),
	.scan_out(ff_crc_recov_err_scanout),
	.din(rdpctl_crc_recov_err_in),
	.dout(rdpctl_crc_recov_err_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_crc_recov_err = rdpctl_crc_recov_err_out | fbdic_cfgrd_crc_error;

// stage error syndrome with error signals to capture in error status register

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_32 ff_ecc_d1  (
	.scan_in(ff_ecc_d1_scanin),
	.scan_out(ff_ecc_d1_scanout),
	.din({readdp0_syndrome[15:0],readdp1_syndrome[15:0]}),
	.dout({rdpctl0_syndrome[15:0],rdpctl1_syndrome[15:0]}),
	.en(rdpctl_rddata_en[2]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// set it only if there is no prior uncorrectable error and a new uncorrectable one happens
// OR no prior uncorrectable and no prior correctable and new correctable happens

assign rdpctl_err_sts_reg_en = (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & 
				((~rdpctl_dau_error & ~rdpctl_dsu_error & (|readdp_ecc_multi_err[1:0]) & ~rdpctl_pa_err) |
		(~rdpctl_dau_error & ~rdpctl_dsu_error & ~rdpctl_dac_error & ~rdpctl_dsc_error & (|readdp_ecc_single_err[1:0]))) | 
			 drif_err_sts_reg_ld;
assign rdpctl_err_sts_reg_in[15:0] = rdpctl_scrub_data_valid | rdpctl_l2t_data_valid & ~rdpctl_dau_error & ~rdpctl_dsu_error ? 
		(readdp_ecc_multi_err[0] & ~rdpctl_pa_err ? rdpctl0_syndrome[15:0] :
		readdp_ecc_multi_err[1] & ~rdpctl_pa_err ? rdpctl1_syndrome[15:0] :
		~rdpctl_dac_error & ~rdpctl_dsc_error & readdp_ecc_single_err[0] ? rdpctl0_syndrome[15:0] :
		~rdpctl_dac_error & ~rdpctl_dsc_error & readdp_ecc_single_err[1] ? rdpctl1_syndrome[15:0] : drif_ucb_data_39to0[15:0]) :
					drif_ucb_data_39to0[15:0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_16 pff_err_syn  ( // FS:wmr_protect
	.scan_in(pff_err_syn_wmr_scanin),
	.scan_out(pff_err_syn_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_err_sts_reg_in[15:0]),
	.dout(rdpctl_err_sts_reg[15:0]),
	.en(rdpctl_err_sts_reg_en),
	.l1clk(l1clk),
  .soclk(soclk));

//////////////////////////////////////
// DRAM ERROR RETRY REGISTER
//////////////////////////////////////
assign rdpctl_err_retry_ld_en =  (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) & 
					((|readdp_ecc_single_err[1:0]) & ~rdpctl_dsc_error & ~rdpctl_dac_error | 
					(|readdp_ecc_multi_err[1:0])) & ~rdpctl_dsu_error & ~rdpctl_dau_error;
assign rdpctl_err_retry_ld_clr = rdpctl_fifo_deq_d1;

mcu_rdpctl_ctl_msff_ctl_macro__clr_1__en_1 ff_err_retry_ld  (
	.scan_in(ff_err_retry_ld_scanin),
	.scan_out(ff_err_retry_ld_scanout),
	.din(1'b1),
	.dout(rdpctl_err_retry_ld_out),
	.en(rdpctl_err_retry_ld_en),
	.clr(rdpctl_err_retry_ld_clr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_err_retry_ld = rdpctl_err_retry_ld_out | rdpctl_err_retry_ld_en;

assign rdpctl_err_retry_reg[36:0] = {rdpctl_retry_reg_valid, rdpctl_err_retry2_reg[17:0],rdpctl_err_retry1_reg[17:0]};

// Retry status for first retry read
assign rdpctl_err_retry1_reg_en = rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & ~rdpctl_fifo_err_xactnum_d1 & 
					rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid | drif_err_retry_reg_ld;
assign rdpctl_err_retry1_reg_in[1:0] = rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & ~rdpctl_fifo_err_xactnum_d1 & 
						rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid ? 
					{rdpctl_ecc_error, rdpctl_err_type & rdpctl_ecc_error | ~rdpctl_ecc_error} :
						drif_ucb_data_39to0[1:0];

assign rdpctl_err_retry1_reg_in[17:2] = rdpctl_retry_syndrome[15:0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_18 pff_err_retry1  ( // FS:wmr_protect
	.scan_in(pff_err_retry1_wmr_scanin),
	.scan_out(pff_err_retry1_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_err_retry1_reg_in[17:0]),
	.dout(rdpctl_err_retry1_reg[17:0]),
	.en(rdpctl_err_retry1_reg_en),
	.l1clk(l1clk),
  .soclk(soclk));

// Retry status for second retry read
assign rdpctl_err_retry2_reg_en = rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & rdpctl_fifo_err_xactnum_d1 & 
					rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid | drif_err_retry_reg_ld;
assign rdpctl_err_retry2_reg_in[1:0] =  rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & rdpctl_fifo_err_xactnum_d1 & 
						rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid ? 
					{rdpctl_ecc_error, rdpctl_err_type & rdpctl_ecc_error | ~rdpctl_ecc_error} :
						drif_ucb_data_39to0[19:18];

assign rdpctl_err_retry2_reg_in[17:2] = rdpctl_retry_syndrome[15:0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_18 pff_err_retry2  ( // FS:wmr_protect
	.scan_in(pff_err_retry2_wmr_scanin),
	.scan_out(pff_err_retry2_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_err_retry2_reg_in[17:0]),
	.dout(rdpctl_err_retry2_reg[17:0]),
	.en(rdpctl_err_retry2_reg_en),
	.l1clk(l1clk),
  .soclk(soclk));


assign rdpctl_err_retry2_reg_en_no_ld = rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & rdpctl_fifo_err_xactnum_d1 & 
					rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid;
assign rdpctl_err_retry1_reg_en_no_ld = rdpctl_fifo_deq_d1 & rdpctl_fifo_err_xaction_d1 & ~rdpctl_fifo_err_xactnum_d1 & 
					rdpctl_fifo_err_type_d1 & ~rdpctl_retry_reg_valid;
assign rdpctl_retry_reg_valid_in = rdpctl_retry_reg_valid & (~drif_err_retry_reg_ld | drif_ucb_data_39to0[36]) | 
					rdpctl_err_retry2_reg_en_no_ld | 
					rdpctl_err_retry1_reg_en_no_ld & (rdpctl_err_retry1_reg_in[1:0] == 2'h3) |
					drif_err_retry_reg_ld & drif_ucb_data_39to0[36];
assign rdpctl_retry_reg_valid_en = 1'b1;

mcu_rdpctl_ctl_msff_ctl_macro__en_1 pff_retry_reg_valid  ( // FS:wmr_protect
	.scan_in(pff_retry_reg_valid_wmr_scanin),
	.scan_out(pff_retry_reg_valid_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_retry_reg_valid_in),
	.dout(rdpctl_retry_reg_valid),
	.en(rdpctl_retry_reg_valid_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign rdpctl_syndrome_dly_en = ~drif_single_channel_mode | drif_single_channel_mode & rdpctl_rddata_en[2];
mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_36 ff_syndrome_dly  (
	.scan_in(ff_syndrome_dly_scanin),
	.scan_out(ff_syndrome_dly_scanout),
	.din({rdpctl0_syndrome[15:0],rdpctl1_syndrome[15:0],readdp_ecc_single_err[1:0],readdp_ecc_multi_err[1:0]}),
	.dout({rdpctl0_syndrome_d1[15:0],rdpctl1_syndrome_d1[15:0],
							rdpctl_ecc_single_err_d1[1:0],rdpctl_ecc_multi_err_d1[1:0]}),
	.en(1'b1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_retry_syndrome[15:0] = rdpctl_ecc_multi_err_d1[0]  ? rdpctl0_syndrome_d1[15:0] :
				     rdpctl_ecc_multi_err_d1[1]  ? rdpctl1_syndrome_d1[15:0] :
				     readdp_ecc_multi_err[0]     ? rdpctl0_syndrome[15:0]    :
				     readdp_ecc_multi_err[1]     ? rdpctl1_syndrome[15:0]    :
				     rdpctl_ecc_single_err_d1[0] ? rdpctl0_syndrome_d1[15:0] :
				     rdpctl_ecc_single_err_d1[1] ? rdpctl1_syndrome_d1[15:0] :
				     readdp_ecc_single_err[0]    ? rdpctl0_syndrome[15:0]    : 
								   rdpctl1_syndrome[15:0];

//////////////////////////////////////
// DRAM ERROR ADDRESS REGISTER
//////////////////////////////////////
// This address reg can only have scrub address as load address is not kept.
assign rdpctl_err_addr_reg_en = rdpctl_scrub_data_valid & ((|readdp_ecc_multi_err[1:0]) & ~rdpctl_pa_err | 
				(|readdp_ecc_single_err[1:0])) & ~rdpctl_dsc_error & ~rdpctl_dsu_error | drif_err_addr_reg_ld;
assign rdpctl_err_addr_reg_in[35:0] = rdpctl_scrub_data_valid & ((|readdp_ecc_multi_err[1:0]) & ~rdpctl_pa_err | 
				(|readdp_ecc_single_err[1:0])) & ~rdpctl_dsc_error & ~rdpctl_dsu_error ? rdpctl_err_addr[35:0] :
		 			drif_ucb_data_39to0[39:4];

assign rdpctl_err_addr[35:0] = rdpctl_pm_1mcu ? {2'h0, drif_scrub_addr[31:1], drif_scrub_addr[0], rdpctl_scrub_data_cnt[1:0]} :
			rdpctl_pm_2mcu ? {1'b0, drif_scrub_addr[31:1], mcu_id[0], drif_scrub_addr[0], rdpctl_scrub_data_cnt[1:0]} :
					{drif_scrub_addr[31:1], mcu_id[1:0], drif_scrub_addr[0], rdpctl_scrub_data_cnt[1:0]};

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_36 pff_err_addr_reg  ( // FS:wmr_protect
	.scan_in(pff_err_addr_reg_wmr_scanin),
	.scan_out(pff_err_addr_reg_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_err_addr_reg_in[35:0]),
	.dout(rdpctl_err_addr_reg[35:0]),
	.en(rdpctl_err_addr_reg_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign rdpctl_scrub_data_cnt[0] = readdp_ecc_multi_err[0] | readdp_ecc_single_err[0] & ~readdp_ecc_multi_err[1];

assign rdpctl_scrub_data_cnt_in[1] = ~rdpctl_scrub_data_cnt[1];
assign rdpctl_scrub_data_cnt_en = rdpctl_scrub_data_valid;
mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 ff_scrub_data_cnt  (
	.scan_in(ff_scrub_data_cnt_scanin),
	.scan_out(ff_scrub_data_cnt_scanout),
	.din(rdpctl_scrub_data_cnt_in[1]),
	.dout(rdpctl_scrub_data_cnt[1]),
	.en(rdpctl_scrub_data_cnt_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////
// SECC ERROR COUNTER - for generating interrupts and debug triggers to NCU
////////////////////////////////////////

assign rdpctl_err_cnt[15:0] = rdpctl_secc_cnt[15:0];

// interrupt enable bit
assign rdpctl_secc_int_en = drif_err_cnt_reg_ld | rdpctl_secc_cnt_intr_in;
assign rdpctl_secc_int_in = rdpctl_secc_cnt_intr_in ? 1'b0 : (|drif_ucb_data_39to0[15:0]);

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 pff_secc_int_en  ( // FS:wmr_protect
	.scan_in(pff_secc_int_en_wmr_scanin),
	.scan_out(pff_secc_int_en_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_secc_int_in),
	.dout(rdpctl_secc_int_enabled),
	.en(rdpctl_secc_int_en),
	.l1clk(l1clk),
  .soclk(soclk));

// counter value
assign rdpctl_secc_cnt_en = drif_err_cnt_reg_ld | (|readdp_ecc_single_err[1:0]) & rdpctl_secc_int_enabled &
				(rdpctl_scrub_data_valid | rdpctl_l2t_data_valid);

assign rdpctl_secc_cnt_next[15:0] = (rdpctl_secc_cnt[15:0] == 16'h0) ? 16'h0 : rdpctl_secc_cnt[15:0] - 16'h1;

assign rdpctl_secc_cnt_in[15:0] = (|readdp_ecc_single_err[1:0]) & rdpctl_secc_int_enabled & (rdpctl_scrub_data_valid | rdpctl_l2t_data_valid) ? 
				rdpctl_secc_cnt_next[15:0] : drif_ucb_data_39to0[15:0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_16 pff_secc_cnt  ( // FS:wmr_protect
	.scan_in(pff_secc_cnt_wmr_scanin),
	.scan_out(pff_secc_cnt_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_secc_cnt_in[15:0]),
	.dout(rdpctl_secc_cnt[15:0]),
	.en(rdpctl_secc_cnt_en),
	.l1clk(l1clk),
  .soclk(soclk));

assign rdpctl_secc_cnt_intr_in = rdpctl_secc_int_enabled & ~(|rdpctl_secc_cnt[15:0]);

mcu_rdpctl_ctl_msff_ctl_macro ff_secc_cnt_intr (
	.scan_in(ff_secc_cnt_intr_scanin),
	.scan_out(ff_secc_cnt_intr_scanout),
	.din(rdpctl_secc_cnt_intr_in),
	.dout(rdpctl_secc_cnt_intr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

////////////////////////////////////////
// SECC DEBUG TRIGGER ENABLE REGISTER
////////////////////////////////////////

assign rdpctl_dbg_trig_enable_in[5:1] = drif_ucb_data_39to0[5:1];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_5 pff_dbg_trig  ( // FS:wmr_protect
	.scan_in(pff_dbg_trig_wmr_scanin),
	.scan_out(pff_dbg_trig_wmr_scanout),
	.siclk(aclk_wmr),
	.din(rdpctl_dbg_trig_enable_in[5:1]),
	.dout({rdpctl_dtm_atspeed, rdpctl_dtm_mask_chnl[1:0], rdpctl_dbg_trig_enable, rdpctl_mask_err}),
	.en(drif_dbg_trig_reg_ld),
	.l1clk(l1clk),
  .soclk(soclk));

assign rdpctl_dtm_chnl_enable[1:0] = {2{fbdic_serdes_dtm}} & (~rdpctl_dtm_mask_chnl[1:0]);

////////////////////////////////////////
// SECC ERROR LOCATION
// The interpretation of the parity is as following ecc[15:0] = {p0,p1,p2,p3} where p3 is not used
// failover mode.
// The error location is as = {err_in_p3, err_in_p2, ... err_in_d2, err_in_d1, err_in_d0}
// If the error location bit is 1, and to create mask in failover mode set all the bits left of 1 to 1 
// (including the bit 1 set in err location) upto bit location 34.
// Also this error location once logged will not be over written when another error occurs till S/W
// resets the appropriate bit in the error status register.
////////////////////////////////////////

assign rdpctl_secc_loc_en = (|readdp_ecc_single_err[1:0]) & (rdpctl_scrub_data_valid & ~rdpctl_dsc_error | 
				rdpctl_l2t_data_valid & ~rdpctl_dac_error) | 
				drif_err_loc_reg_ld;
assign rdpctl_err_loc_in[35:0] = readdp_ecc_single_err[1] & (rdpctl_scrub_data_valid & ~rdpctl_dsc_error | 
					rdpctl_l2t_data_valid & ~rdpctl_dac_error) ? rdpctl1_ecc_loc[35:0] : 
				readdp_ecc_single_err[0] & (rdpctl_scrub_data_valid & ~rdpctl_dsc_error | 
					rdpctl_l2t_data_valid & ~rdpctl_dac_error) ? rdpctl0_ecc_loc[35:0] : drif_ucb_data_39to0[35:0];

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_36 pff_err_loc  ( // FS:wmr_protect
	    .scan_in(pff_err_loc_wmr_scanin),
	    .scan_out(pff_err_loc_wmr_scanout),
	    .siclk(aclk_wmr),
	    .din(rdpctl_err_loc_in[35:0]),
	    .dout(rdpctl_err_loc[35:0]),
	    .en(rdpctl_secc_loc_en),
	    .l1clk(l1clk),
  .soclk(soclk));

////////////////////////////////////////
// Scrub valid signals to rdata 
////////////////////////////////////////
assign rdpctl_scrb0_err_valid_in = rdpctl_mcu_data_valid & rdpctl_fifo_scrub & ~drif_scrub_addr[0] & ~rdpctl_fifo_err_xaction &
				  (~rdpctl_crc_error_in & ~rdpctl_crc_error | drif_err_state_crc_fr);
assign rdpctl_scrb1_err_valid_in = rdpctl_mcu_data_valid & rdpctl_fifo_scrub & drif_scrub_addr[0] & ~rdpctl_fifo_err_xaction &
				  (~rdpctl_crc_error_in & ~rdpctl_crc_error | drif_err_state_crc_fr);

mcu_rdpctl_ctl_msff_ctl_macro__width_2 ff_scrub_ecc_err  (
	    .scan_in(ff_scrub_ecc_err_scanin),
	    .scan_out(ff_scrub_ecc_err_scanout),
	    .din({rdpctl_scrb0_err_valid_in,rdpctl_scrb1_err_valid_in}),
	    .dout({rdpctl_scrb0_err_valid,rdpctl_scrb1_err_valid}),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//////////////////////////////////////////////////////////////
// Dummy request
//////////////////////////////////////////////////////////////

mcu_rdpctl_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_rd_dummy_req0  (
	    .scan_in(ff_rd_dummy_req0_scanin),
	    .scan_out(ff_rd_dummy_req0_scanout),
	    .din(1'b1),
	    .dout(rdpctl0_rd_dummy_req),
	    .en(rdpctl0_rd_dummy_req_en),
	    .clr(rdpctl0_dummy_data_valid),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_5 ff_rd_dummy0  (
	    .scan_in(ff_rd_dummy0_scanin),
	    .scan_out(ff_rd_dummy0_scanout),
	    .din({rdpctl0_rd_dummy_req_addr5_in, rdpctl0_rd_dummy_req_id_in[2:0], rdpctl0_rd_dummy_addr_err_in}),
	    .dout({rdpctl0_rd_dummy_req_addr5, rdpctl0_rd_dummy_req_id[2:0], rdpctl0_rd_dummy_addr_err}),
	    .en(rdpctl0_rd_dummy_req_en),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_rd_dummy_req1  (
	    .scan_in(ff_rd_dummy_req1_scanin),
	    .scan_out(ff_rd_dummy_req1_scanout),
	    .din(1'b1),
	    .dout(rdpctl1_rd_dummy_req),
	    .en(rdpctl1_rd_dummy_req_en),
	    .clr(rdpctl1_dummy_data_valid),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_5 ff_rd_dummy1  (
	    .scan_in(ff_rd_dummy1_scanin),
	    .scan_out(ff_rd_dummy1_scanout),
	    .din({rdpctl1_rd_dummy_req_addr5_in, rdpctl1_rd_dummy_req_id_in[2:0], rdpctl1_rd_dummy_addr_err_in}),
	    .dout({rdpctl1_rd_dummy_req_addr5, rdpctl1_rd_dummy_req_id[2:0], rdpctl1_rd_dummy_addr_err}),
	    .en(rdpctl1_rd_dummy_req_en),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));


// give priority to first dummy requester
// only want one valid at a time in case one has a pa_err
assign rdpctl_dummy_priority_in = rdpctl1_rd_dummy_req & ~rdpctl0_rd_dummy_req ? 1'b1 : 
				      rdpctl0_rd_dummy_req & ~rdpctl1_rd_dummy_req ? 1'b0 : 
				      rdpctl_dummy_priority;

mcu_rdpctl_ctl_msff_ctl_macro ff_dummy_priority (
	    .scan_in(ff_dummy_priority_scanin),
	    .scan_out(ff_dummy_priority_scanout),
	    .din(rdpctl_dummy_priority_in),
	    .dout(rdpctl_dummy_priority),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl0_dummy_data_valid_in = (~fbdic_rddata_vld & ~rdpctl_mcu_data_valid | 
					    fbdic_rddata_vld & ~rdpctl_mcu_data_valid & rdpctl0_dummy_data_valid) & 
					    rdpctl0_rd_dummy_req & (~rdpctl_dummy_priority | ~rdpctl1_rd_dummy_req);
assign rdpctl1_dummy_data_valid_in = (~fbdic_rddata_vld & ~rdpctl_mcu_data_valid | 
					    fbdic_rddata_vld & ~rdpctl_mcu_data_valid & rdpctl1_dummy_data_valid) & 
					    rdpctl1_rd_dummy_req & (rdpctl_dummy_priority | ~rdpctl0_rd_dummy_req);


mcu_rdpctl_ctl_msff_ctl_macro__width_2 ff_dummy_data_valid  (
	    .scan_in(ff_dummy_data_valid_scanin),
	    .scan_out(ff_dummy_data_valid_scanout),
	    .din({rdpctl0_dummy_data_valid_in,rdpctl1_dummy_data_valid_in}),
	    .dout({rdpctl0_dummy_data_valid,rdpctl1_dummy_data_valid}),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Write enable for scrub data buffer, for data from 1st error retry

assign rdpctl_scrub_wren = drif_single_channel_mode ? rdpctl_scrub_wren_out : 
				rdpctl_fifo_err_xaction & ~rdpctl_fifo_err_xactnum & rdpctl_mcu_data_valid;
assign rdpctl_scrub_wren_in = rdpctl_fifo_err_xaction & ~rdpctl_fifo_err_xactnum & 
				fbdic_rddata_vld & rdpctl_rddata_state[0];
				
mcu_rdpctl_ctl_msff_ctl_macro ff_scrub_wren (
	.scan_in(ff_scrub_wren_scanin),
	.scan_out(ff_scrub_wren_scanout),
	.din(rdpctl_scrub_wren_in),
	.dout(rdpctl_scrub_wren_out),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Mux controls for single-DIMM mode
assign rdpctl_rddata_en[1:0] = drif_single_channel_mode ? 
	    {rdpctl_rddata_state[0] | ~fbdic_rddata_vld, ~rdpctl_rddata_state[0] | ~fbdic_rddata_vld} : 2'h3;

assign rdpctl_rddata_en[2] = drif_single_channel_mode ? ~rdpctl_rddata_state[0] : 1'b1;

assign rdpctl_rddata_state_in[1:0] = drif_single_channel_mode ? rdpctl_rddata_state[1:0] + 2'h1 : 
								{1'b0, ~rdpctl_rddata_state[0]};
mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_2 ff_rddata_state  (
	    .scan_in(ff_rddata_state_scanin),
	    .scan_out(ff_rddata_state_scanout),
	    .din(rdpctl_rddata_state_in[1:0]),
	    .dout(rdpctl_rddata_state[1:0]),
	    .en(fbdic_rddata_vld),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_rddata_vld = drif_single_channel_mode ? fbdic_rddata_vld & rdpctl_rddata_state[1] : fbdic_rddata_vld;

// address parity for readdp block

assign rdpctl_radr_parity = fbdic_rddata_vld & (rdpctl_fifo_deq ? rdpctl_fifo_addr_parity_p1 : rdpctl_fifo_addr_parity);

// ECC Error injection from NCU
mcu_rdpctl_ctl_msff_ctl_macro ff_err_ecci (
	    .scan_in(ff_err_ecci_scanin),
	    .scan_out(ff_err_ecci_scanout),
	    .din(rdata_err_ecci),
	    .dout(rdpctl_err_ecci),
	    .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rdpctl_inj_ecc_err = rdpctl_err_ecci & ~rdpctl_rddata_state[0] & fbdic_rddata_vld;

// spare gates 
mcu_rdpctl_ctl_spare_ctl_macro__num_6 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign ff_pm_mcus_scanin         = scan_in                  ;
assign ff_dummy_req0_scanin      = ff_pm_mcus_scanout       ;
assign ff_dummy_req1_scanin      = ff_dummy_req0_scanout    ;
assign ff_ddp_data_valid_scanin  = ff_dummy_req1_scanout    ;
assign ff_ecc_loc_scanin         = ff_ddp_data_valid_scanout;
assign ff_data_cnt_scanin        = ff_ecc_loc_scanout       ;
assign otq_scanin                = ff_data_cnt_scanout      ;
assign ff_drif_clear_ent_scanin  = otq_scanout              ;
assign ff_l2t_data_valid_scanin  = ff_drif_clear_ent_scanout;
assign ff_scrub_data_valid_scanin = ff_l2t_data_valid_scanout;
assign ff_qword_id_scanin        = ff_scrub_data_valid_scanout;
assign ff_rd_req_id_scanin       = ff_qword_id_scanout      ;
assign ff_pa_err_scanin          = ff_rd_req_id_scanout     ;
assign ff_crc_err_dly_scanin     = ff_pa_err_scanout        ;
assign ff_mecc_errors_scanin     = ff_crc_err_dly_scanout   ;
assign ff_err_fifo_data_scanin   = ff_mecc_errors_scanout   ;
assign ff_fifo_deq_d1_scanin     = ff_err_fifo_data_scanout ;
assign ff_fbd_unrecov_err_scanin = ff_fifo_deq_d1_scanout   ;
assign ff_crc_unrecov_err_scanin = ff_fbd_unrecov_err_scanout;
assign ff_fbd_recov_err_scanin   = ff_crc_unrecov_err_scanout;
assign ff_crc_recov_err_scanin   = ff_fbd_recov_err_scanout ;
assign ff_ecc_d1_scanin          = ff_crc_recov_err_scanout ;
assign ff_err_retry_ld_scanin    = ff_ecc_d1_scanout        ;
assign ff_syndrome_dly_scanin    = ff_err_retry_ld_scanout  ;
assign ff_scrub_data_cnt_scanin  = ff_syndrome_dly_scanout  ;
assign ff_secc_cnt_intr_scanin   = ff_scrub_data_cnt_scanout;
assign ff_scrub_ecc_err_scanin   = ff_secc_cnt_intr_scanout ;
assign ff_rd_dummy_req0_scanin   = ff_scrub_ecc_err_scanout ;
assign ff_rd_dummy0_scanin       = ff_rd_dummy_req0_scanout ;
assign ff_rd_dummy_req1_scanin   = ff_rd_dummy0_scanout     ;
assign ff_rd_dummy1_scanin       = ff_rd_dummy_req1_scanout ;
assign ff_dummy_priority_scanin  = ff_rd_dummy1_scanout     ;
assign ff_dummy_data_valid_scanin = ff_dummy_priority_scanout;
assign ff_scrub_wren_scanin      = ff_dummy_data_valid_scanout;
assign ff_rddata_state_scanin    = ff_scrub_wren_scanout    ;
assign ff_err_ecci_scanin        = ff_rddata_state_scanout  ;
assign spares_scanin             = ff_err_ecci_scanout      ;
assign scan_out                  = spares_scanout           ;

assign pff_err_sts_bit63_wmr_scanin = wmr_scan_in              ;
assign pff_err_sts_bit62_wmr_scanin = pff_err_sts_bit63_wmr_scanout;
assign pff_err_sts_bit61_wmr_scanin = pff_err_sts_bit62_wmr_scanout;
assign pff_err_sts_bit60_wmr_scanin = pff_err_sts_bit61_wmr_scanout;
assign pff_err_sts_bit59_wmr_scanin = pff_err_sts_bit60_wmr_scanout;
assign pff_err_sts_bit58_wmr_scanin = pff_err_sts_bit59_wmr_scanout;
assign pff_err_sts_bit57_wmr_scanin = pff_err_sts_bit58_wmr_scanout;
assign pff_err_sts_bit56_wmr_scanin = pff_err_sts_bit57_wmr_scanout;
assign pff_err_sts_bit55_wmr_scanin = pff_err_sts_bit56_wmr_scanout;
assign pff_err_sts_bit54_wmr_scanin = pff_err_sts_bit55_wmr_scanout;
assign pff_err_syn_wmr_scanin    = pff_err_sts_bit54_wmr_scanout;
assign pff_err_retry1_wmr_scanin = pff_err_syn_wmr_scanout  ;
assign pff_err_retry2_wmr_scanin = pff_err_retry1_wmr_scanout;
assign pff_retry_reg_valid_wmr_scanin = pff_err_retry2_wmr_scanout;
assign pff_err_addr_reg_wmr_scanin = pff_retry_reg_valid_wmr_scanout;
assign pff_secc_int_en_wmr_scanin = pff_err_addr_reg_wmr_scanout;
assign pff_secc_cnt_wmr_scanin   = pff_secc_int_en_wmr_scanout;
assign pff_dbg_trig_wmr_scanin   = pff_secc_cnt_wmr_scanout ;
assign pff_err_loc_wmr_scanin    = pff_dbg_trig_wmr_scanout ;
assign wmr_scan_out              = pff_err_loc_wmr_scanout  ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_rdpctl_ctl_l1clkhdr_ctl_macro (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_2 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_6 (
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

module mcu_rdpctl_ctl_msff_ctl_macro (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_72 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_1 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_5 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_20 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_16 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__width_3 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_14 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_32 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_16 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__clr_1__en_1 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_18 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_36 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [35:0] fdin;
wire [34:0] so;

  input [35:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [35:0] dout;
  output scan_out;
assign fdin[35:0] = (din[35:0] & {36{en}}) | (dout[35:0] & ~{36{en}});






dff #(36)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[35:0]),
.si({scan_in,so[34:0]}),
.so({so[34:0],scan_out}),
.q(dout[35:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_5 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module mcu_rdpctl_ctl_msff_ctl_macro__en_1__width_2 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mcu_rdpctl_ctl_spare_ctl_macro__num_6 (
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
assign scan_out = so_5;



endmodule

