// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ucbbuf_ctl.v
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



////////////////////////////////////////////////////////////////////////
// Local header file includes / local defines
////////////////////////////////////////////////////////////////////////
`define         UCB_BUF_DEPTH   2
//`define         UCB_BUF_WIDTH   64+(`UCB_ADDR_HI-`UCB_ADDR_LO+1)+(`UCB_SIZE_HI-`UCB_SIZE_LO+1)+(`UCB_BUF_HI-`UCB_BUF_LO+1)+(`UCB_THR_HI-`UCB_THR_LO+1)+1+1
`define 	UCB_BUF_WIDTH  	117

module mcu_ucbbuf_ctl (
  iob_ucb_vld, 
  iob_ucb_data, 
  ucb_iob_stall, 
  rd_req_vld, 
  wr_req_vld, 
  thr_id_in, 
  buf_id_in, 
  size_in, 
  addr_in, 
  data_in, 
  req_acpted, 
  rd_ack_vld, 
  rd_nack_vld, 
  thr_id_out, 
  buf_id_out, 
  data128, 
  data_out, 
  ack_busy, 
  int_vld, 
  int_typ, 
  int_thr_id, 
  dev_id, 
  int_stat, 
  int_vec, 
  int_busy, 
  ucb_iob_vld, 
  ucb_iob_data, 
  iob_ucb_stall, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire ucbin_scanin;
wire ucbin_scanout;
wire [0:0] inv_buf_head_next;
wire [0:0] inv_buf_head;
wire buf_head_ff_scanin;
wire buf_head_ff_scanout;
wire [0:0] inv_buf_tail_next;
wire [0:0] inv_buf_tail;
wire buf_tail_ff_scanin;
wire buf_tail_ff_scanout;
wire buf_full_en;
wire buf_full_ff_scanin;
wire buf_full_ff_scanout;
wire buf_empty_en;
wire inv_buf_empty_next;
wire inv_buf_empty;
wire buf_empty_ff_scanin;
wire buf_empty_ff_scanout;
wire buf0_ff_scanin;
wire buf0_ff_scanout;
wire buf1_ff_scanin;
wire buf1_ff_scanout;
wire ack_buf_vld_ff_scanin;
wire ack_buf_vld_ff_scanout;
wire ack_buf_is_nack_ff_scanin;
wire ack_buf_is_nack_ff_scanout;
wire ack_buf_is_data128_ff_scanin;
wire ack_buf_is_data128_ff_scanout;
wire ack_buf_ff_scanin;
wire ack_buf_ff_scanout;
wire int_buf_vld_ff_scanin;
wire int_buf_vld_ff_scanout;
wire int_buf_ff_scanin;
wire int_buf_ff_scanout;
wire int_last_rd_en;
wire int_last_rd_ff_scanin;
wire int_last_rd_ff_scanout;
wire ucbout_scanin;
wire ucbout_scanout;

   
//   parameter IOB_UCB_WIDTH = 4;  // data bus width from IOB to UCB
//   parameter UCB_IOB_WIDTH = 4;   // data bus width from UCB to IOB
//   parameter REG_WIDTH     = 64;  // please do not change this parameter
   

// Request from NCU
input 					iob_ucb_vld;
input [3:0] 				iob_ucb_data;
output 					ucb_iob_stall;

// Request to local unit
output 					rd_req_vld;
output 					wr_req_vld;
output [`UCB_THR_HI-`UCB_THR_LO:0]   	thr_id_in;
output [`UCB_BUF_HI-`UCB_BUF_LO:0]   	buf_id_in;
output [`UCB_SIZE_HI-`UCB_SIZE_LO:0] 	size_in;   // only pertinent to PCI
output [`UCB_ADDR_HI-`UCB_ADDR_LO:0] 	addr_in;
output [`UCB_DATA_HI-`UCB_DATA_LO:0] 	data_in;
input 					req_acpted;

// Ack/Nack from local unit
input 					rd_ack_vld;
input 					rd_nack_vld;
input [`UCB_THR_HI-`UCB_THR_LO:0] 	thr_id_out;
input [`UCB_BUF_HI-`UCB_BUF_LO:0] 	buf_id_out;
input 					data128;   // set to 1 if data returned is 128 bit
input [63:0] 				data_out;
output 					ack_busy;

// Interrupt from local unit
input 					int_vld;
input [`UCB_PKT_HI-`UCB_PKT_LO:0] 	int_typ;          // interrupt type
input [`UCB_THR_HI-`UCB_THR_LO:0] 	int_thr_id;       // interrupt thread ID
input [`UCB_INT_DEV_HI-`UCB_INT_DEV_LO:0] dev_id;      // interrupt device ID
input [`UCB_INT_STAT_HI-`UCB_INT_STAT_LO:0] int_stat;  // interrupt status
input [`UCB_INT_VEC_HI-`UCB_INT_VEC_LO:0]   int_vec;   // interrupt vector
output 					int_busy;

// Output to IO Bridge
output 					ucb_iob_vld;
output [3:0] 				ucb_iob_data;
input 					iob_ucb_stall;

// Globals
input					l1clk;		
input 					scan_in;
output					scan_out;
input 					tcu_aclk;
input					tcu_bclk;
input					tcu_scan_en;

// Local signals
wire                                 	indata_buf_vld;
wire [127:0]                         	indata_buf;
wire                                 	ucb_iob_stall_a1;

wire                                 	read_pending;
wire                                 	write_pending;
wire                                 	illegal_write_size;

wire 					rd_buf;
wire [1:0] 				buf_head_next;
wire [1:0] 				buf_head;
wire 					wr_buf;
wire [1:0] 				buf_tail_next;
wire [1:0] 				buf_tail;
wire 					buf_full_next;
wire 					buf_full;
wire 					buf_empty_next;
wire 					buf_empty;
wire [116:0] 				req_in;
wire 					buf0_en;
wire [116:0] 				buf0;
wire 					buf1_en;
wire [116:0] 				buf1;
wire [116:0] 				req_out;
wire 					rd_req_vld_nq;
wire 					wr_req_vld_nq;

wire                                 	ack_buf_rd;
wire                                 	ack_buf_wr;
wire                                 	ack_buf_vld;
wire                                 	ack_buf_vld_next;
wire                                 	ack_buf_is_nack;
wire                                 	ack_buf_is_data128;
wire [3:0]     				ack_typ_out;
wire [75:0] 				ack_buf_in;
wire [75:0] 				ack_buf;
wire [31:0] 				ack_buf_vec;

wire                                 	int_buf_rd;
wire                                 	int_buf_wr;
wire                                 	int_buf_vld;
wire                                 	int_buf_vld_next;
wire [56:0] 				int_buf_in;
wire [56:0] 				int_buf;
wire [31:0] 				int_buf_vec;

wire                                 	int_last_rd;
wire                                 	outdata_buf_busy;
wire                                 	outdata_buf_wr;
wire [127:0]                		outdata_buf_in;
wire [31:0] 				outdata_vec_in;


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////

// Scan reassigns
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

/************************************************************
 * Inbound Data
 ************************************************************/
// Register size is hardcoded to 64 bits here because all
// units using the UCB module will only write to 64 bit registers.
mcu_ucbin_ctl ucbin (
	.scan_in(ucbin_scanin),
	.scan_out(ucbin_scanout),
	.l1clk(l1clk),
	.vld(iob_ucb_vld),
	.data(iob_ucb_data),
	.stall(ucb_iob_stall),
	.indata_buf_vld(indata_buf_vld),
	.indata_buf(indata_buf),
	.stall_a1(ucb_iob_stall_a1),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en));


/************************************************************
 * Decode inbound packet type
 ************************************************************/
assign 	 read_pending = (indata_buf[`UCB_PKT_HI:`UCB_PKT_LO] == `UCB_READ_REQ) & indata_buf_vld;

assign 	 write_pending = (indata_buf[`UCB_PKT_HI:`UCB_PKT_LO] == 
				  `UCB_WRITE_REQ) &
     	                  indata_buf_vld;

// 3'b011 is the encoding for double word.  All writes have to be
// 64 bits except writes going to PCI.  PCI will instantiate a
// customized version of UCB.
assign 	 illegal_write_size = (indata_buf[`UCB_SIZE_HI:`UCB_SIZE_LO] !=
				       3'b011);

assign 	 ucb_iob_stall_a1 = (read_pending | write_pending) & buf_full;


/************************************************************
 * Inbound buffer
 ************************************************************/
// Head pointer
assign 	 rd_buf = req_acpted;
assign 	 buf_head_next = rd_buf ? {buf_head[0],
				           buf_head[1]} :
	                                  buf_head;

assign inv_buf_head_next[0] = ~buf_head_next[0];
assign buf_head[0] = ~inv_buf_head[0];

mcu_ucbbuf_ctl_msff_ctl_macro__width_2 buf_head_ff  (
	.scan_in(buf_head_ff_scanin),
	.scan_out(buf_head_ff_scanout),
	.din({buf_head_next[1],inv_buf_head_next[0]}),
	.l1clk(l1clk),
	.dout({buf_head[1],inv_buf_head[0]}),
  .siclk(siclk),
  .soclk(soclk));

// Tail pointer
assign 	 wr_buf = (read_pending |
		           (write_pending & ~illegal_write_size)) &
			  ~buf_full;
assign 	 buf_tail_next = wr_buf ? {buf_tail[0],
				           buf_tail[1]} :
	                                  buf_tail;

assign inv_buf_tail_next[0] = ~buf_tail_next[0];
assign buf_tail[0] = ~inv_buf_tail[0];

mcu_ucbbuf_ctl_msff_ctl_macro__width_2 buf_tail_ff  (
	.scan_in(buf_tail_ff_scanin),
	.scan_out(buf_tail_ff_scanout),
	.din({buf_tail_next[1],inv_buf_tail_next[0]}),
	.l1clk(l1clk),
	.dout({buf_tail[1],inv_buf_tail[0]}),
  .siclk(siclk),
  .soclk(soclk));

// Buffer full
assign 	buf_full_next = (buf_head_next == buf_tail_next) & wr_buf;
assign 	buf_full_en = rd_buf|wr_buf;
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_1 buf_full_ff  (.din(buf_full_next),
	.scan_in(buf_full_ff_scanin),
	.scan_out(buf_full_ff_scanout),
	.en(buf_full_en),
	.l1clk(l1clk),
	.dout(buf_full),
  .siclk(siclk),
  .soclk(soclk));

// Buffer empty
assign 	buf_empty_next = ((buf_head_next == buf_tail_next) & rd_buf);

assign 	buf_empty_en = rd_buf | wr_buf;

assign 	inv_buf_empty_next = ~buf_empty_next;
assign 	buf_empty = ~inv_buf_empty;

mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_1 buf_empty_ff  (
	.scan_in(buf_empty_ff_scanin),
	.scan_out(buf_empty_ff_scanout),
	.din(inv_buf_empty_next),
	.en(buf_empty_en), 
	.l1clk(l1clk),
	.dout(inv_buf_empty),
  .siclk(siclk),
  .soclk(soclk));


assign 	 req_in = {indata_buf[`UCB_DATA_HI:`UCB_DATA_LO],
			   indata_buf[`UCB_ADDR_HI:`UCB_ADDR_LO],
			   indata_buf[`UCB_SIZE_HI:`UCB_SIZE_LO],
			   indata_buf[`UCB_BUF_HI:`UCB_BUF_LO],
			   indata_buf[`UCB_THR_HI:`UCB_THR_LO],
			   write_pending & ~illegal_write_size,
			   read_pending};
	  
// Buffer 0
assign 	 buf0_en = buf_tail[0] & wr_buf;
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_117 buf0_ff  (
	.scan_in(buf0_ff_scanin),
	.scan_out(buf0_ff_scanout),
	.din(req_in),
	.en(buf0_en),
	.l1clk(l1clk),
	.dout(buf0),
  .siclk(siclk),
  .soclk(soclk));
// Buffer 1
assign 	 buf1_en = buf_tail[1] & wr_buf;
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_117 buf1_ff  (
	.scan_in(buf1_ff_scanin),
	.scan_out(buf1_ff_scanout),
	.din(req_in),
	.en(buf1_en),
	.l1clk(l1clk),
	.dout(buf1),
  .siclk(siclk),
  .soclk(soclk));

assign 	 req_out = buf_head[0] ? buf0 :
	                   buf_head[1] ? buf1 : {`UCB_BUF_WIDTH{1'b0}};


/************************************************************
 * Inbound interface to local unit
 ************************************************************/
assign 	 {data_in,
		  addr_in,
		  size_in,
		  buf_id_in,
		  thr_id_in,
		  wr_req_vld_nq,
		  rd_req_vld_nq} = req_out;

assign 	 rd_req_vld = rd_req_vld_nq & ~buf_empty;
assign 	 wr_req_vld = wr_req_vld_nq & ~buf_empty;

	  
/************************************************************
 * Outbound Ack/Nack
 ************************************************************/
assign        ack_buf_wr = rd_ack_vld | rd_nack_vld;

assign        ack_buf_vld_next = ack_buf_wr ? 1'b1 :
                                 ack_buf_rd ? 1'b0 :
                                              ack_buf_vld;

mcu_ucbbuf_ctl_msff_ctl_macro__width_1 ack_buf_vld_ff  (
	.scan_in(ack_buf_vld_ff_scanin),
	.scan_out(ack_buf_vld_ff_scanout),
	.din(ack_buf_vld_next),
	.l1clk(l1clk),
	.dout(ack_buf_vld),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucbbuf_ctl_msff_ctl_macro__en_1 ack_buf_is_nack_ff  (
	.scan_in(ack_buf_is_nack_ff_scanin),
	.scan_out(ack_buf_is_nack_ff_scanout),
	.din(rd_nack_vld),
	.en(ack_buf_wr),
	.l1clk(l1clk),
	.dout(ack_buf_is_nack),
  .siclk(siclk),
  .soclk(soclk));

mcu_ucbbuf_ctl_msff_ctl_macro__en_1 ack_buf_is_data128_ff  (
	.scan_in(ack_buf_is_data128_ff_scanin),
	.scan_out(ack_buf_is_data128_ff_scanout),
	.din(data128),
	.en(ack_buf_wr),
	.l1clk(l1clk),
	.dout(ack_buf_is_data128),
  .siclk(siclk),
  .soclk(soclk));

assign        ack_typ_out = rd_ack_vld ? `UCB_READ_ACK:
                                         `UCB_READ_NACK;

assign        ack_buf_in = {data_out,
                            buf_id_out,
                            thr_id_out,
                            ack_typ_out};

//   msff_ctl_macro ack_buf_ff (width=REG_WIDTH+`UCB_BUF_HI-`UCB_PKT_LO+1,en=1) (.din(ack_buf_in),
// 64+11-10+1
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_76 ack_buf_ff  (
	.scan_in(ack_buf_ff_scanin),
	.scan_out(ack_buf_ff_scanout),
	.din(ack_buf_in),
	.en(ack_buf_wr),
	.l1clk(l1clk),
	.dout(ack_buf),
  .siclk(siclk),
  .soclk(soclk));

assign        ack_buf_vec = ack_buf_is_nack    ? {{16{1'b0}},
                                                  {16{1'b1}}} :
                            ack_buf_is_data128 ? {32{1'b1}} :
                                                 {32{1'b1}};

assign        ack_busy = ack_buf_vld;


/************************************************************
 * Outbound Interrupt
 ************************************************************/
// Assertion: int_buf_wr shoudn't be asserted if int_buf_busy
assign        int_buf_wr = int_vld;

assign        int_buf_vld_next = int_buf_wr ? 1'b1 :
                                 int_buf_rd ? 1'b0 : int_buf_vld;

mcu_ucbbuf_ctl_msff_ctl_macro__width_1 int_buf_vld_ff  (
	.scan_in(int_buf_vld_ff_scanin),
	.scan_out(int_buf_vld_ff_scanout),
	.din(int_buf_vld_next),
	.l1clk(l1clk),
	.dout(int_buf_vld),
  .siclk(siclk),
  .soclk(soclk));

assign        int_buf_in = {int_vec, int_stat, dev_id, int_thr_id, int_typ};

 //  msff_ctl_macro int_buf_ff (width=`UCB_INT_VEC_HI-`UCB_PKT_LO+1,en=1) (.din(int_buf_in),
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_57 int_buf_ff  (
	.scan_in(int_buf_ff_scanin),
	.scan_out(int_buf_ff_scanout),
	.din(int_buf_in),
	.en(int_buf_wr),
	.l1clk(l1clk),
	.dout(int_buf),
  .siclk(siclk),
  .soclk(soclk));

assign        int_buf_vec = {{16{1'b0}}, {16{1'b1}}};

assign        int_busy = int_buf_vld;


/************************************************************
 * Outbound ack/interrupt Arbitration
 ************************************************************/
assign int_last_rd_en = ack_buf_rd|int_buf_rd;
mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_1 int_last_rd_ff  (
	.scan_in(int_last_rd_ff_scanin),
	.scan_out(int_last_rd_ff_scanout),
	.din(int_buf_rd),
	.en(int_last_rd_en),
	.l1clk(l1clk),
	.dout(int_last_rd),
  .siclk(siclk),
  .soclk(soclk));
                        
assign        ack_buf_rd = ~outdata_buf_busy & ack_buf_vld &
                           (~int_buf_vld | int_last_rd);

assign        int_buf_rd = ~outdata_buf_busy & int_buf_vld &
                           (~ack_buf_vld | ~int_last_rd);

assign        outdata_buf_wr = ack_buf_rd | int_buf_rd;

assign        outdata_buf_in = ack_buf_rd ? {ack_buf[75:12],
                                             {9{1'b0}},
                                             {40{1'b0}},
                                             {3{1'b0}},
                                             ack_buf[`UCB_BUF_HI:`UCB_BUF_LO],
                                             ack_buf[`UCB_THR_HI:`UCB_THR_LO],
                                             ack_buf[`UCB_PKT_HI:`UCB_PKT_LO]}:
                                            {{64{1'b0}},
                                             {7{1'b0}},
                                             int_buf[`UCB_INT_VEC_HI:`UCB_INT_VEC_LO],
                                             int_buf[`UCB_INT_STAT_HI:`UCB_INT_STAT_LO],
                                             int_buf[`UCB_INT_DEV_HI:`UCB_INT_DEV_LO],
                                             int_buf[`UCB_THR_HI:`UCB_THR_LO],
                                             int_buf[`UCB_PKT_HI:`UCB_PKT_LO]};

assign        outdata_vec_in = ack_buf_rd ? ack_buf_vec :
                                            int_buf_vec;

mcu_ucbout_ctl ucbout (
	.scan_in(ucbout_scanin),
	.scan_out(ucbout_scanout),
	.l1clk(l1clk),
	.outdata_buf_wr(outdata_buf_wr),
	.outdata_buf_in(outdata_buf_in),
	.outdata_vec_in(outdata_vec_in),
	.outdata_buf_busy(outdata_buf_busy),
	.vld(ucb_iob_vld),
	.data(ucb_iob_data),
	.stall(iob_ucb_stall),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en));

	  
// fixscan start:
assign ucbin_scanin              = scan_in                  ;
assign buf_head_ff_scanin        = ucbin_scanout            ;
assign buf_tail_ff_scanin        = buf_head_ff_scanout      ;
assign buf_full_ff_scanin        = buf_tail_ff_scanout      ;
assign buf_empty_ff_scanin       = buf_full_ff_scanout      ;
assign buf0_ff_scanin            = buf_empty_ff_scanout     ;
assign buf1_ff_scanin            = buf0_ff_scanout          ;
assign ack_buf_vld_ff_scanin     = buf1_ff_scanout          ;
assign ack_buf_is_nack_ff_scanin = ack_buf_vld_ff_scanout   ;
assign ack_buf_is_data128_ff_scanin = ack_buf_is_nack_ff_scanout;
assign ack_buf_ff_scanin         = ack_buf_is_data128_ff_scanout;
assign int_buf_vld_ff_scanin     = ack_buf_ff_scanout       ;
assign int_buf_ff_scanin         = int_buf_vld_ff_scanout   ;
assign int_last_rd_ff_scanin     = int_buf_ff_scanout       ;
assign ucbout_scanin             = int_last_rd_ff_scanout   ;
assign scan_out                  = ucbout_scanout           ;
// fixscan end:
endmodule





// any PARAMS parms go into naming of macro

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_1 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_4 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__width_1 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_32 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_128 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__width_2 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_117 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_76 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__en_1__width_57 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__width_32 (
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

module mcu_ucbbuf_ctl_msff_ctl_macro__width_128 (
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








