// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ucb_ctl.v
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



module mcu_ucb_ctl (
  mcu_ucb_rd_request_out, 
  mcu_ucb_wr_req_out, 
  mcu_ucb_mecc_err, 
  mcu_ucb_secc_err, 
  mcu_ucb_fbd_err, 
  mcu_ucb_err_mode, 
  mcu_ucb_err_event, 
  mcu_ucb_rd_req_in_0, 
  mcu_ucb_wr_req_in_0, 
  mcu_ucb_rd_req_in_1, 
  mcu_ucb_wr_req_in_1, 
  mcu_dbg1_rd_req_out, 
  mcu_dbg1_wr_req_out, 
  mcu_dbg1_mecc_err, 
  mcu_dbg1_secc_err, 
  mcu_dbg1_fbd_err, 
  mcu_dbg1_err_mode, 
  mcu_dbg1_err_event, 
  mcu_dbg1_rd_req_in_0, 
  mcu_dbg1_wr_req_in_0, 
  mcu_dbg1_rd_req_in_1, 
  mcu_dbg1_wr_req_in_1, 
  mcu_dbg1_crc21, 
  ucb_mcu_rd_req_vld0, 
  ucb_mcu_wr_req_vld0, 
  ucb_mcu_addr, 
  ucb_mcu_data, 
  ucb_rdata_selfrsh, 
  ucb_err_ecci, 
  ucb_err_fbui, 
  ucb_err_fbri, 
  ucb_pm, 
  ucb_pm_ba01, 
  ucb_pm_ba23, 
  ucb_pm_ba45, 
  ucb_pm_ba67, 
  mcu_ncu_vld, 
  mcu_ncu_data, 
  mcu_ncu_stall, 
  mcu_ncu_ecc, 
  mcu_ncu_fbr, 
  clspine_mcu_selfrsh, 
  ncu_mcu_vld, 
  ncu_mcu_data, 
  ncu_mcu_stall, 
  ncu_mcu_ecci, 
  ncu_mcu_fbui, 
  ncu_mcu_fbri, 
  ncu_mcu_pm, 
  ncu_mcu_ba01, 
  ncu_mcu_ba23, 
  ncu_mcu_ba45, 
  ncu_mcu_ba67, 
  mcu_ucb_ack_vld0, 
  mcu_ucb_nack_vld0, 
  mcu_ucb_data0, 
  rdata_err_intr0, 
  rdata_err_fbr, 
  fbdiwr_dtm_crc, 
  rdata_serdes_dtm, 
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire l1clk;
wire ff_serdes_dtm_scanin;
wire ff_serdes_dtm_scanout;
wire ucb_serdes_dtm;
wire mcu_dbg1_crc21_in;
wire [21:0] ucb_dtm_crc;
wire ff_dbg1_crc21_scanin;
wire ff_dbg1_crc21_scanout;
wire [3:0] mcu_dbg1_rd_req_in_0_in;
wire ff_mcu_ucb_rd_req_in_0_scanin;
wire ff_mcu_ucb_rd_req_in_0_scanout;
wire [3:0] mcu_dbg1_rd_req_in_1_in;
wire ff_mcu_ucb_rd_req_in_1_scanin;
wire ff_mcu_ucb_rd_req_in_1_scanout;
wire [4:0] mcu_dbg1_rd_req_out_in;
wire ff_mcu_ucb_rd_request_out_scanin;
wire ff_mcu_ucb_rd_request_out_scanout;
wire mcu_dbg1_wr_req_in_0_in;
wire ff_mcu_ucb_wr_req_in_0_scanin;
wire ff_mcu_ucb_wr_req_in_0_scanout;
wire mcu_dbg1_wr_req_in_1_in;
wire ff_mcu_ucb_wr_req_in_1_scanin;
wire ff_mcu_ucb_wr_req_in_1_scanout;
wire [1:0] mcu_dbg1_wr_req_out_in;
wire ff_mcu_ucb_wr_req_out_scanin;
wire ff_mcu_ucb_wr_req_out_scanout;
wire mcu_dbg1_mecc_err_in;
wire ff_mcu_ucb_mecc_err_scanin;
wire ff_mcu_ucb_mecc_err_scanout;
wire mcu_dbg1_secc_err_in;
wire ff_mcu_ucb_secc_err_scanin;
wire ff_mcu_ucb_secc_err_scanout;
wire mcu_dbg1_fbd_err_in;
wire ff_mcu_ucb_fbd_err_scanin;
wire ff_mcu_ucb_fbd_err_scanout;
wire mcu_dbg1_err_mode_in;
wire ff_mcu_ucb_err_mode_scanin;
wire ff_mcu_ucb_err_mode_scanout;
wire ff_mcu_ucb_err_event_scanin;
wire ff_mcu_ucb_err_event_scanout;
wire ff_test_signals_scanin;
wire ff_test_signals_scanout;
wire ff_err_injection_scanin;
wire ff_err_injection_scanout;
wire ff_partial_bank_mode_scanin;
wire ff_partial_bank_mode_scanout;
wire ff_err_intr_scanin;
wire ff_err_intr_scanout;
wire ff_fbd_err_intr_scanin;
wire ff_fbd_err_intr_scanout;
wire ff_inputs_vlds_scanin;
wire ff_inputs_vlds_scanout;
wire ucb_ack_vld0;
wire ucb_nack_vld0;
wire ff_input_data_scanin;
wire ff_input_data_scanout;
wire [63:0] ucb_data0;
wire ff_outputs_vals_scanin;
wire ff_outputs_vals_scanout;
wire ucb_rd_req_vld0;
wire ucb_wr_req_vld0;
wire [39:0] addr_in;
wire ff_outputs_data_scanin;
wire ff_outputs_data_scanout;
wire [63:0] ucb_data_in;
wire ucbbuf_scanin;
wire ucbbuf_scanout;
wire rd_req_vld;
wire wr_req_vld;
wire [5:0] thr_id_in;
wire [1:0] buf_id_in;
wire ucb_mcu_ack_busy;
wire ucb_mcu_int_busy;
wire mcu_ucb_req_acpted;
wire mcu_ucb_ack_vld;
wire mcu_ucb_nack_vld;
wire [5:0] thr_id_out;
wire [1:0] buf_id_out;
wire [63:0] mcu_ucb_data;
wire ucb_int_vld;
wire [3:0] ucb_int_typ;
wire [5:0] int_thr_id;
wire [8:0] ucb_dev_id;
wire [31:0] ucb_int_stat;
wire [5:0] int_vec;
wire ucb_req_pend;
wire ucb_req_pend_en;
wire ucb_req_pend_reset;
wire ucb_wr_req_ack;
wire ff_req_pend_scanin;
wire ff_req_pend_scanout;
wire ucb_wr_req_vld;
wire ff_wr_ack_d1_scanin;
wire ff_wr_ack_d1_scanout;
wire ff_thr_id_scanin;
wire ff_thr_id_scanout;
wire alat_dtm_crc21_scanin;
wire alat_dtm_crc21_scanout;
wire alat_dtm_crc20_scanin;
wire alat_dtm_crc20_scanout;
wire alat_dtm_crc19_scanin;
wire alat_dtm_crc19_scanout;
wire alat_dtm_crc18_scanin;
wire alat_dtm_crc18_scanout;
wire alat_dtm_crc17_scanin;
wire alat_dtm_crc17_scanout;
wire alat_dtm_crc16_scanin;
wire alat_dtm_crc16_scanout;
wire alat_dtm_crc15_scanin;
wire alat_dtm_crc15_scanout;
wire alat_dtm_crc14_scanin;
wire alat_dtm_crc14_scanout;
wire alat_dtm_crc13_scanin;
wire alat_dtm_crc13_scanout;
wire alat_dtm_crc12_scanin;
wire alat_dtm_crc12_scanout;
wire alat_dtm_crc11_scanin;
wire alat_dtm_crc11_scanout;
wire alat_dtm_crc10_scanin;
wire alat_dtm_crc10_scanout;
wire alat_dtm_crc9_scanin;
wire alat_dtm_crc9_scanout;
wire alat_dtm_crc8_scanin;
wire alat_dtm_crc8_scanout;
wire alat_dtm_crc7_scanin;
wire alat_dtm_crc7_scanout;
wire alat_dtm_crc6_scanin;
wire alat_dtm_crc6_scanout;
wire alat_dtm_crc5_scanin;
wire alat_dtm_crc5_scanout;
wire alat_dtm_crc4_scanin;
wire alat_dtm_crc4_scanout;
wire alat_dtm_crc3_scanin;
wire alat_dtm_crc3_scanout;
wire alat_dtm_crc2_scanin;
wire alat_dtm_crc2_scanout;
wire alat_dtm_crc1_scanin;
wire alat_dtm_crc1_scanout;
wire alat_dtm_crc0_scanin;
wire alat_dtm_crc0_scanout;
wire spares_scanin;
wire spares_scanout;
wire [2:0] size_in;


///////////////////////////////////////////////////////////////////
// OUTPUTS
///////////////////////////////////////////////////////////////////
// TO DBG
input [4:0]	mcu_ucb_rd_request_out ;
input [1:0]	mcu_ucb_wr_req_out ;
input		mcu_ucb_mecc_err ;
input		mcu_ucb_secc_err ;
input		mcu_ucb_fbd_err ;
input		mcu_ucb_err_mode ;
input		mcu_ucb_err_event ;
input [3:0]	mcu_ucb_rd_req_in_0 ;
input		mcu_ucb_wr_req_in_0 ;
input [3:0]	mcu_ucb_rd_req_in_1 ;
input		mcu_ucb_wr_req_in_1 ;

output [4:0]	mcu_dbg1_rd_req_out ;
output [1:0]	mcu_dbg1_wr_req_out ;
output		mcu_dbg1_mecc_err ;
output		mcu_dbg1_secc_err ;
output		mcu_dbg1_fbd_err ;
output		mcu_dbg1_err_mode ;
output		mcu_dbg1_err_event ;
output [3:0]	mcu_dbg1_rd_req_in_0 ;
output		mcu_dbg1_wr_req_in_0 ;
output [3:0]	mcu_dbg1_rd_req_in_1 ;
output		mcu_dbg1_wr_req_in_1 ;
output		mcu_dbg1_crc21 ;

// TO DRAM
output      	ucb_mcu_rd_req_vld0;	// register read request to drif
output          ucb_mcu_wr_req_vld0;	// register write request to drif
output [12:0]   ucb_mcu_addr;		// register read/write address to drif
output [63:0]   ucb_mcu_data;		// register write data to drif
output		ucb_rdata_selfrsh;	// self refresh mode signal to drif
output		ucb_err_ecci;
output		ucb_err_fbui;
output		ucb_err_fbri;

output          ucb_pm;			// partial bank mode signals
output          ucb_pm_ba01;
output          ucb_pm_ba23;
output          ucb_pm_ba45;
output          ucb_pm_ba67;

// TO NCU
output		mcu_ncu_vld;		// ucb data/interrupt valid
output [3:0]	mcu_ncu_data;		// ucb interface data
output		mcu_ncu_stall;		// ucb stall to ncu
output		mcu_ncu_ecc;
output		mcu_ncu_fbr;

///////////////////////////////////////////////////////////////////
// INPUTS
///////////////////////////////////////////////////////////////////
input		clspine_mcu_selfrsh;	// self refresh mode signal from CCU

// FROM NCU
input		ncu_mcu_vld;		// ucb interface data valid 
input [3:0]	ncu_mcu_data;		// ucb interface data
input		ncu_mcu_stall;		// ucb interface stall
input		ncu_mcu_ecci;
input		ncu_mcu_fbui;
input		ncu_mcu_fbri;

input           ncu_mcu_pm;		// partial bank mode signals
input           ncu_mcu_ba01;
input           ncu_mcu_ba23;
input           ncu_mcu_ba45;
input           ncu_mcu_ba67;

// FROM RDATA
input          	mcu_ucb_ack_vld0;	// ack for register read data
input          	mcu_ucb_nack_vld0;	// nack for illegal register read address
input [63:0]   	mcu_ucb_data0;		// register read data

// FROM RDATA
input		rdata_err_intr0;	// single ecc error count interrupt
input		rdata_err_fbr;

// FROM FBDIWR
input	[21:0]	fbdiwr_dtm_crc;
input		rdata_serdes_dtm;

// Global Signals
input		iol2clk;		
input 		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

///////////////////////////////////////////////////////////////////
// CODE
///////////////////////////////////////////////////////////////////

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

mcu_ucb_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(iol2clk),
 	.l1en (1'b1 ),
	.stop(1'b0),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .se(se));

// 
mcu_ucb_ctl_msff_ctl_macro ff_serdes_dtm (
	.scan_in(ff_serdes_dtm_scanin),
	.scan_out(ff_serdes_dtm_scanout),
	.din(rdata_serdes_dtm),
	.dout(ucb_serdes_dtm),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//## dbg reclock with ioclk
assign mcu_dbg1_crc21_in = ucb_serdes_dtm & ucb_dtm_crc[21];

mcu_ucb_ctl_msff_ctl_macro ff_dbg1_crc21 (
	.scan_in(ff_dbg1_crc21_scanin),
	.scan_out(ff_dbg1_crc21_scanout),
	.din(mcu_dbg1_crc21_in),
	.dout(mcu_dbg1_crc21),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_rd_req_in_0_in[3:0] = ucb_serdes_dtm ? ucb_dtm_crc[20:17] : mcu_ucb_rd_req_in_0[3:0];

mcu_ucb_ctl_msff_ctl_macro__width_4 ff_mcu_ucb_rd_req_in_0  (
	.scan_in(ff_mcu_ucb_rd_req_in_0_scanin),
	.scan_out(ff_mcu_ucb_rd_req_in_0_scanout),
	.din(mcu_dbg1_rd_req_in_0_in[3:0]), 
	.dout(mcu_dbg1_rd_req_in_0[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_rd_req_in_1_in[3:0] = ucb_serdes_dtm ? ucb_dtm_crc[16:13] : mcu_ucb_rd_req_in_1[3:0];

mcu_ucb_ctl_msff_ctl_macro__width_4 ff_mcu_ucb_rd_req_in_1  (
	.scan_in(ff_mcu_ucb_rd_req_in_1_scanin),
	.scan_out(ff_mcu_ucb_rd_req_in_1_scanout),
	.din(mcu_dbg1_rd_req_in_1_in[3:0]), 
	.dout(mcu_dbg1_rd_req_in_1[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_rd_req_out_in[4:0] = ucb_serdes_dtm ? ucb_dtm_crc[12:8] : mcu_ucb_rd_request_out[4:0];

mcu_ucb_ctl_msff_ctl_macro__width_5 ff_mcu_ucb_rd_request_out  (
	.scan_in(ff_mcu_ucb_rd_request_out_scanin),
	.scan_out(ff_mcu_ucb_rd_request_out_scanout),
	.din(mcu_dbg1_rd_req_out_in[4:0]), 
	.dout(mcu_dbg1_rd_req_out[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_wr_req_in_0_in = ucb_serdes_dtm ? ucb_dtm_crc[7] : mcu_ucb_wr_req_in_0;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_wr_req_in_0  (
	.scan_in(ff_mcu_ucb_wr_req_in_0_scanin),
	.scan_out(ff_mcu_ucb_wr_req_in_0_scanout),
	.din(mcu_dbg1_wr_req_in_0_in), 
	.dout(mcu_dbg1_wr_req_in_0),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_wr_req_in_1_in = ucb_serdes_dtm ? ucb_dtm_crc[6] : mcu_ucb_wr_req_in_1;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_wr_req_in_1  (
	.scan_in(ff_mcu_ucb_wr_req_in_1_scanin),
	.scan_out(ff_mcu_ucb_wr_req_in_1_scanout),
	.din(mcu_dbg1_wr_req_in_1_in), 
	.dout(mcu_dbg1_wr_req_in_1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_wr_req_out_in[1:0] = ucb_serdes_dtm ? ucb_dtm_crc[5:4] : mcu_ucb_wr_req_out[1:0];

mcu_ucb_ctl_msff_ctl_macro__width_2 ff_mcu_ucb_wr_req_out  (
	.scan_in(ff_mcu_ucb_wr_req_out_scanin),
	.scan_out(ff_mcu_ucb_wr_req_out_scanout),
	.din(mcu_dbg1_wr_req_out_in[1:0]), 
	.dout(mcu_dbg1_wr_req_out[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_mecc_err_in = ucb_serdes_dtm ? ucb_dtm_crc[3] : mcu_ucb_mecc_err;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_mecc_err  (
	.scan_in(ff_mcu_ucb_mecc_err_scanin),
	.scan_out(ff_mcu_ucb_mecc_err_scanout),
	.din(mcu_dbg1_mecc_err_in), 
	.dout(mcu_dbg1_mecc_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_secc_err_in = ucb_serdes_dtm ? ucb_dtm_crc[2] : mcu_ucb_secc_err;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_secc_err  (
	.scan_in(ff_mcu_ucb_secc_err_scanin),
	.scan_out(ff_mcu_ucb_secc_err_scanout),
	.din(mcu_dbg1_secc_err_in), 
	.dout(mcu_dbg1_secc_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_fbd_err_in = ucb_serdes_dtm ? ucb_dtm_crc[1] : mcu_ucb_fbd_err;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_fbd_err  (
	.scan_in(ff_mcu_ucb_fbd_err_scanin),
	.scan_out(ff_mcu_ucb_fbd_err_scanout),
	.din(mcu_dbg1_fbd_err_in), 
	.dout(mcu_dbg1_fbd_err),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign mcu_dbg1_err_mode_in = ucb_serdes_dtm ? ucb_dtm_crc[0] : mcu_ucb_err_mode;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_err_mode  (
	.scan_in(ff_mcu_ucb_err_mode_scanin),
	.scan_out(ff_mcu_ucb_err_mode_scanout),
	.din(mcu_dbg1_err_mode_in), 
	.dout(mcu_dbg1_err_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_mcu_ucb_err_event  (
	.scan_in(ff_mcu_ucb_err_event_scanin),
	.scan_out(ff_mcu_ucb_err_event_scanout),
	.din(mcu_ucb_err_event), 
	.dout(mcu_dbg1_err_event),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Flop the self refresh signal from the CCU

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_test_signals  (
	.scan_in(ff_test_signals_scanin),
	.scan_out(ff_test_signals_scanout),
	.din({clspine_mcu_selfrsh}), 
	.dout({ucb_rdata_selfrsh}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucb_ctl_msff_ctl_macro__width_3 ff_err_injection  (
	.scan_in(ff_err_injection_scanin),
	.scan_out(ff_err_injection_scanout),
	.din({ncu_mcu_ecci,ncu_mcu_fbui,ncu_mcu_fbri}),
	.dout({ucb_err_ecci,ucb_err_fbui,ucb_err_fbri}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucb_ctl_msff_ctl_macro__width_5 ff_partial_bank_mode  (
	.scan_in(ff_partial_bank_mode_scanin),
	.scan_out(ff_partial_bank_mode_scanout),
	.din({ncu_mcu_pm,ncu_mcu_ba01,ncu_mcu_ba23,ncu_mcu_ba45,ncu_mcu_ba67}),
	.dout({ucb_pm,   ucb_pm_ba01, ucb_pm_ba23, ucb_pm_ba45, ucb_pm_ba67}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Interrupt for crossing max cnt of errors
mcu_ucb_ctl_msff_ctl_macro__width_1 ff_err_intr  (
	.scan_in(ff_err_intr_scanin),
	.scan_out(ff_err_intr_scanout),
	.din(rdata_err_intr0), 
	.dout(mcu_ncu_ecc),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fbdimm channel recoverable and non-recoverable error interrupts
mcu_ucb_ctl_msff_ctl_macro__width_1 ff_fbd_err_intr  (
	.scan_in(ff_fbd_err_intr_scanin),
	.scan_out(ff_fbd_err_intr_scanout),
	.din(rdata_err_fbr), 
	.dout(mcu_ncu_fbr),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Flop the inputs from the mcuctl interface

mcu_ucb_ctl_msff_ctl_macro__width_2 ff_inputs_vlds  (
	.scan_in(ff_inputs_vlds_scanin),
	.scan_out(ff_inputs_vlds_scanout),
	.din({mcu_ucb_ack_vld0, mcu_ucb_nack_vld0}),
	.dout({ucb_ack_vld0, ucb_nack_vld0}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucb_ctl_msff_ctl_macro__width_64 ff_input_data  (
	.scan_in(ff_input_data_scanin),
	.scan_out(ff_input_data_scanout),
	.din(mcu_ucb_data0[63:0]),
	.dout(ucb_data0[63:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Flop the outputs going to mcuctl block

mcu_ucb_ctl_msff_ctl_macro__width_2 ff_outputs_vals  (
	.scan_in(ff_outputs_vals_scanin),
	.scan_out(ff_outputs_vals_scanout),
	.din({ucb_rd_req_vld0, ucb_wr_req_vld0}),
	.dout({ucb_mcu_rd_req_vld0, ucb_mcu_wr_req_vld0}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

wire [12:0] ucb_rd_wr_addr = {|addr_in[31:14], addr_in[11:0]};
 
mcu_ucb_ctl_msff_ctl_macro__width_77 ff_outputs_data  (
	.scan_in(ff_outputs_data_scanin),
	.scan_out(ff_outputs_data_scanout),
	.din({ucb_rd_wr_addr[12:0], ucb_data_in[63:0]}),
	.dout({ucb_mcu_addr[12:0], ucb_mcu_data[63:0]}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Instantiate the UCB module that does 4bit - 64 bit and vice versa.
mcu_ucbbuf_ctl ucbbuf (
	.scan_in(ucbbuf_scanin),
	.scan_out(ucbbuf_scanout),
	.l1clk(l1clk),

	// Outputs
	.ucb_iob_stall(mcu_ncu_stall),
	.rd_req_vld(rd_req_vld),
	.wr_req_vld(wr_req_vld),
	.thr_id_in(thr_id_in[`UCB_THR_HI-`UCB_THR_LO:0]),
	.buf_id_in(buf_id_in[`UCB_BUF_HI-`UCB_BUF_LO:0]),
	//.size_in(size_in[`UCB_SIZE_HI-`UCB_SIZE_LO:0]),
	.addr_in(addr_in[`UCB_ADDR_HI-`UCB_ADDR_LO:0]),
	.data_in(ucb_data_in[`UCB_DATA_HI-`UCB_DATA_LO:0]),
	.ack_busy(ucb_mcu_ack_busy),
	.int_busy(ucb_mcu_int_busy),
	.ucb_iob_vld(mcu_ncu_vld),
	.ucb_iob_data(mcu_ncu_data[3:0]),

	// Inputs
	.iob_ucb_vld(ncu_mcu_vld),
	.iob_ucb_data(ncu_mcu_data[3:0]),
	.req_acpted(mcu_ucb_req_acpted),
	.rd_ack_vld(mcu_ucb_ack_vld),
	.rd_nack_vld(mcu_ucb_nack_vld),
	.thr_id_out(thr_id_out[`UCB_THR_HI-`UCB_THR_LO:0]),
	.buf_id_out(buf_id_out[`UCB_BUF_HI-`UCB_BUF_LO:0]),
	.data128(1'b0),
	.data_out(mcu_ucb_data[63:0]),
	.int_vld(ucb_int_vld),
	.int_typ(ucb_int_typ[`UCB_PKT_HI-`UCB_PKT_LO:0]),
	.int_thr_id(int_thr_id[`UCB_THR_HI-`UCB_THR_LO:0]),
	.dev_id(ucb_dev_id[`UCB_INT_DEV_HI-`UCB_INT_DEV_LO:0]),
	.int_stat(ucb_int_stat[`UCB_INT_STAT_HI-`UCB_INT_STAT_LO:0]),
	.int_vec(int_vec[`UCB_INT_VEC_HI-`UCB_INT_VEC_LO:0]),
	.iob_ucb_stall(ncu_mcu_stall),
  .size_in(size_in[2:0]),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en));

assign ucb_wr_req_vld0 = wr_req_vld & (addr_in[39:32] == 8'h84);
assign ucb_rd_req_vld0 = rd_req_vld & (addr_in[39:32] == 8'h84) & ~ucb_req_pend;

assign mcu_ucb_req_acpted = ~ucb_req_pend & (ucb_rd_req_vld0 | ucb_wr_req_vld0);
assign mcu_ucb_ack_vld = ucb_ack_vld0 & ~ucb_mcu_ack_busy;
assign mcu_ucb_nack_vld = ucb_nack_vld0 & ~ucb_mcu_ack_busy;
assign mcu_ucb_data[63:0] = ucb_data0[63:0];

// Keep track of pending request till ack came back...

assign ucb_req_pend_en = ucb_wr_req_vld0 | ucb_rd_req_vld0;
assign ucb_req_pend_reset = ucb_ack_vld0 | ucb_wr_req_ack | ucb_nack_vld0;

mcu_ucb_ctl_msff_ctl_macro__clr_1__en_1__width_1 ff_req_pend  (
	.scan_in(ff_req_pend_scanin),
	.scan_out(ff_req_pend_scanout),
	.din(1'b1),
	.dout(ucb_req_pend),
	.en(ucb_req_pend_en),
	.clr(ucb_req_pend_reset),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// For stores need to create a fake ack_vld after three cycle...
assign ucb_wr_req_vld =  ucb_wr_req_vld0;

mcu_ucb_ctl_msff_ctl_macro__width_1 ff_wr_ack_d1 (
	.scan_in(ff_wr_ack_d1_scanin),
	.scan_out(ff_wr_ack_d1_scanout),
	.din(ucb_wr_req_vld),
	.dout(ucb_wr_req_ack),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Save the params so return back to NCU

// `UCB_THR_HI-`UCB_THR_LO+1+`UCB_BUF_HI-`UCB_BUF_LO+1 = 9-4+1+11-10+1 = 8
mcu_ucb_ctl_msff_ctl_macro__en_1__width_8 ff_thr_id  (
	.scan_in(ff_thr_id_scanin),
	.scan_out(ff_thr_id_scanout),
	.din({thr_id_in[`UCB_THR_HI-`UCB_THR_LO:0], buf_id_in[`UCB_BUF_HI-`UCB_BUF_LO:0]}),
	.dout({thr_id_out[`UCB_THR_HI-`UCB_THR_LO:0], buf_id_out[`UCB_BUF_HI-`UCB_BUF_LO:0]}),
	.en(rd_req_vld),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

//assign ucb_int_vld = ucb_err_intr0 & ~ucb_mcu_int_busy;
assign ucb_int_vld = 1'b0;
assign ucb_dev_id = 9'h1;
assign ucb_int_typ = `UCB_INT;
assign ucb_int_stat = 32'h0;
assign int_thr_id = 6'h0;
assign int_vec = 6'h0;

// alatches for DR->IO signals
cl_sc1_alatch_4x alat_dtm_crc21 ( 
	.q(ucb_dtm_crc[21]), 
	.d(fbdiwr_dtm_crc[21]), 
	.si(alat_dtm_crc21_scanin),
	.so(alat_dtm_crc21_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc20 ( 
	.q(ucb_dtm_crc[20]), 
	.d(fbdiwr_dtm_crc[20]), 
	.si(alat_dtm_crc20_scanin),
	.so(alat_dtm_crc20_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc19 ( 
	.q(ucb_dtm_crc[19]), 
	.d(fbdiwr_dtm_crc[19]), 
	.si(alat_dtm_crc19_scanin),
	.so(alat_dtm_crc19_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc18 ( 
	.q(ucb_dtm_crc[18]), 
	.d(fbdiwr_dtm_crc[18]), 
	.si(alat_dtm_crc18_scanin),
	.so(alat_dtm_crc18_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc17 ( 
	.q(ucb_dtm_crc[17]), 
	.d(fbdiwr_dtm_crc[17]), 
	.si(alat_dtm_crc17_scanin),
	.so(alat_dtm_crc17_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc16 ( 
	.q(ucb_dtm_crc[16]), 
	.d(fbdiwr_dtm_crc[16]), 
	.si(alat_dtm_crc16_scanin),
	.so(alat_dtm_crc16_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc15 ( 
	.q(ucb_dtm_crc[15]), 
	.d(fbdiwr_dtm_crc[15]), 
	.si(alat_dtm_crc15_scanin),
	.so(alat_dtm_crc15_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc14 ( 
	.q(ucb_dtm_crc[14]), 
	.d(fbdiwr_dtm_crc[14]), 
	.si(alat_dtm_crc14_scanin),
	.so(alat_dtm_crc14_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc13 ( 
	.q(ucb_dtm_crc[13]), 
	.d(fbdiwr_dtm_crc[13]), 
	.si(alat_dtm_crc13_scanin),
	.so(alat_dtm_crc13_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc12 ( 
	.q(ucb_dtm_crc[12]), 
	.d(fbdiwr_dtm_crc[12]), 
	.si(alat_dtm_crc12_scanin),
	.so(alat_dtm_crc12_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc11 ( 
	.q(ucb_dtm_crc[11]), 
	.d(fbdiwr_dtm_crc[11]), 
	.si(alat_dtm_crc11_scanin),
	.so(alat_dtm_crc11_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc10 ( 
	.q(ucb_dtm_crc[10]), 
	.d(fbdiwr_dtm_crc[10]), 
	.si(alat_dtm_crc10_scanin),
	.so(alat_dtm_crc10_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc9 ( 
	.q(ucb_dtm_crc[9]), 
	.d(fbdiwr_dtm_crc[9]), 
	.si(alat_dtm_crc9_scanin),
	.so(alat_dtm_crc9_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc8 ( 
	.q(ucb_dtm_crc[8]), 
	.d(fbdiwr_dtm_crc[8]), 
	.si(alat_dtm_crc8_scanin),
	.so(alat_dtm_crc8_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc7 ( 
	.q(ucb_dtm_crc[7]), 
	.d(fbdiwr_dtm_crc[7]), 
	.si(alat_dtm_crc7_scanin),
	.so(alat_dtm_crc7_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc6 ( 
	.q(ucb_dtm_crc[6]), 
	.d(fbdiwr_dtm_crc[6]), 
	.si(alat_dtm_crc6_scanin),
	.so(alat_dtm_crc6_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc5 ( 
	.q(ucb_dtm_crc[5]), 
	.d(fbdiwr_dtm_crc[5]), 
	.si(alat_dtm_crc5_scanin),
	.so(alat_dtm_crc5_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc4 ( 
	.q(ucb_dtm_crc[4]), 
	.d(fbdiwr_dtm_crc[4]), 
	.si(alat_dtm_crc4_scanin),
	.so(alat_dtm_crc4_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc3 ( 
	.q(ucb_dtm_crc[3]), 
	.d(fbdiwr_dtm_crc[3]), 
	.si(alat_dtm_crc3_scanin),
	.so(alat_dtm_crc3_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc2 ( 
	.q(ucb_dtm_crc[2]), 
	.d(fbdiwr_dtm_crc[2]), 
	.si(alat_dtm_crc2_scanin),
	.so(alat_dtm_crc2_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc1 ( 
	.q(ucb_dtm_crc[1]), 
	.d(fbdiwr_dtm_crc[1]), 
	.si(alat_dtm_crc1_scanin),
	.so(alat_dtm_crc1_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

cl_sc1_alatch_4x alat_dtm_crc0 ( 
	.q(ucb_dtm_crc[0]), 
	.d(fbdiwr_dtm_crc[0]), 
	.si(alat_dtm_crc0_scanin),
	.so(alat_dtm_crc0_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk),
  .se(se));

// spare gates 
mcu_ucb_ctl_spare_ctl_macro__num_7 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

// fixscan start:
assign ff_serdes_dtm_scanin      = scan_in                  ;
assign ff_dbg1_crc21_scanin      = ff_serdes_dtm_scanout    ;
assign ff_mcu_ucb_rd_req_in_0_scanin = ff_dbg1_crc21_scanout    ;
assign ff_mcu_ucb_rd_req_in_1_scanin = ff_mcu_ucb_rd_req_in_0_scanout;
assign ff_mcu_ucb_rd_request_out_scanin = ff_mcu_ucb_rd_req_in_1_scanout;
assign ff_mcu_ucb_wr_req_in_0_scanin = ff_mcu_ucb_rd_request_out_scanout;
assign ff_mcu_ucb_wr_req_in_1_scanin = ff_mcu_ucb_wr_req_in_0_scanout;
assign ff_mcu_ucb_wr_req_out_scanin = ff_mcu_ucb_wr_req_in_1_scanout;
assign ff_mcu_ucb_mecc_err_scanin = ff_mcu_ucb_wr_req_out_scanout;
assign ff_mcu_ucb_secc_err_scanin = ff_mcu_ucb_mecc_err_scanout;
assign ff_mcu_ucb_fbd_err_scanin = ff_mcu_ucb_secc_err_scanout;
assign ff_mcu_ucb_err_mode_scanin = ff_mcu_ucb_fbd_err_scanout;
assign ff_mcu_ucb_err_event_scanin = ff_mcu_ucb_err_mode_scanout;
assign ff_test_signals_scanin    = ff_mcu_ucb_err_event_scanout;
assign ff_err_injection_scanin   = ff_test_signals_scanout  ;
assign ff_partial_bank_mode_scanin = ff_err_injection_scanout ;
assign ff_err_intr_scanin        = ff_partial_bank_mode_scanout;
assign ff_fbd_err_intr_scanin    = ff_err_intr_scanout      ;
assign ff_inputs_vlds_scanin     = ff_fbd_err_intr_scanout  ;
assign ff_input_data_scanin      = ff_inputs_vlds_scanout   ;
assign ff_outputs_vals_scanin    = ff_input_data_scanout    ;
assign ff_outputs_data_scanin    = ff_outputs_vals_scanout  ;
assign ucbbuf_scanin             = ff_outputs_data_scanout  ;
assign ff_req_pend_scanin        = ucbbuf_scanout           ;
assign ff_wr_ack_d1_scanin       = ff_req_pend_scanout      ;
assign ff_thr_id_scanin          = ff_wr_ack_d1_scanout     ;
assign alat_dtm_crc21_scanin     = ff_thr_id_scanout        ;
assign alat_dtm_crc20_scanin     = alat_dtm_crc21_scanout   ;
assign alat_dtm_crc19_scanin     = alat_dtm_crc20_scanout   ;
assign alat_dtm_crc18_scanin     = alat_dtm_crc19_scanout   ;
assign alat_dtm_crc17_scanin     = alat_dtm_crc18_scanout   ;
assign alat_dtm_crc16_scanin     = alat_dtm_crc17_scanout   ;
assign alat_dtm_crc15_scanin     = alat_dtm_crc16_scanout   ;
assign alat_dtm_crc14_scanin     = alat_dtm_crc15_scanout   ;
assign alat_dtm_crc13_scanin     = alat_dtm_crc14_scanout   ;
assign alat_dtm_crc12_scanin     = alat_dtm_crc13_scanout   ;
assign alat_dtm_crc11_scanin     = alat_dtm_crc12_scanout   ;
assign alat_dtm_crc10_scanin     = alat_dtm_crc11_scanout   ;
assign alat_dtm_crc9_scanin      = alat_dtm_crc10_scanout   ;
assign alat_dtm_crc8_scanin      = alat_dtm_crc9_scanout    ;
assign alat_dtm_crc7_scanin      = alat_dtm_crc8_scanout    ;
assign alat_dtm_crc6_scanin      = alat_dtm_crc7_scanout    ;
assign alat_dtm_crc5_scanin      = alat_dtm_crc6_scanout    ;
assign alat_dtm_crc4_scanin      = alat_dtm_crc5_scanout    ;
assign alat_dtm_crc3_scanin      = alat_dtm_crc4_scanout    ;
assign alat_dtm_crc2_scanin      = alat_dtm_crc3_scanout    ;
assign alat_dtm_crc1_scanin      = alat_dtm_crc2_scanout    ;
assign alat_dtm_crc0_scanin      = alat_dtm_crc1_scanout    ;
assign spares_scanin             = alat_dtm_crc0_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_l1clkhdr_ctl_macro (
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

module mcu_ucb_ctl_msff_ctl_macro (
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

module mcu_ucb_ctl_msff_ctl_macro__width_4 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_5 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_1 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_2 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_3 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_64 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_77 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [76:0] fdin;
wire [75:0] so;

  input [76:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [76:0] dout;
  output scan_out;
assign fdin[76:0] = din[76:0];






dff #(77)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[76:0]),
.si({scan_in,so[75:0]}),
.so({so[75:0],scan_out}),
.q(dout[76:0])
);


endmodule






// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_ucb_ctl_msff_ctl_macro__en_1 (
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

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_32 (
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

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_117 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [116:0] fdin;
wire [115:0] so;

  input [116:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [116:0] dout;
  output scan_out;
assign fdin[116:0] = (din[116:0] & {117{en}}) | (dout[116:0] & ~{117{en}});






dff #(117)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[116:0]),
.si({scan_in,so[115:0]}),
.so({so[115:0],scan_out}),
.q(dout[116:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_76 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [75:0] fdin;
wire [74:0] so;

  input [75:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [75:0] dout;
  output scan_out;
assign fdin[75:0] = (din[75:0] & {76{en}}) | (dout[75:0] & ~{76{en}});






dff #(76)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[75:0]),
.si({scan_in,so[74:0]}),
.so({so[74:0],scan_out}),
.q(dout[75:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_57 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [56:0] fdin;
wire [55:0] so;

  input [56:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [56:0] dout;
  output scan_out;
assign fdin[56:0] = (din[56:0] & {57{en}}) | (dout[56:0] & ~{57{en}});






dff #(57)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[56:0]),
.si({scan_in,so[55:0]}),
.so({so[55:0],scan_out}),
.q(dout[56:0])
);


endmodule






// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__width_32 (
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

module mcu_ucb_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_ucb_ctl_msff_ctl_macro__clr_1__en_1__width_1 (
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

module mcu_ucb_ctl_msff_ctl_macro__en_1__width_8 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mcu_ucb_ctl_spare_ctl_macro__num_7 (
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
assign scan_out = so_6;



endmodule

