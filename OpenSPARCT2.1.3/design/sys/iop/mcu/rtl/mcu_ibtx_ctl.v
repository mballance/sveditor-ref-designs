// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ibtx_ctl.v
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



module mcu_ibtx_ctl (
  ibist_txdata, 
  ibtx_done, 
  fbdic_sbfibportctl, 
  fbdic_sbfibpgctl, 
  fbdic_sbfibpattbuf1, 
  fbdic_sbfibtxmsk, 
  fbdic_sbfibtxshft, 
  fbdic_sbfibpattbuf2, 
  fbdic_sbfibpatt2en, 
  fbdic_txstart, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  l1clk, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire ibtx_loopcon;
wire ibtx_autoinvswpen;
wire ibtx_ovrloop_disable;
wire ibtx_ovrloopcnt_is_zero;
wire [5:0] ibtx_ovrloopcnt;
wire ibtx_ovrloopcnt_dec;
wire [4:0] ibtx_cnstgencnt;
wire [6:0] ibtx_modloopcnt;
wire [6:0] ibtx_pattloopcnt;
wire [5:0] ibtx_ovrloopcnt_in;
wire [3:0] ibtx_state;
wire ff_ovrloopcnt_scanin;
wire ff_ovrloopcnt_scanout;
wire ibtx_cnstgen_disable;
wire ibtx_cnstgencnt_dec;
wire ibtx_lo_bits_sel;
wire [4:0] ibtx_cnstgencnt_in;
wire ff_cnstgencnt_scanin;
wire ff_cnstgencnt_scanout;
wire ibtx_cnstgenset;
wire ibtx_modloop_disable;
wire ibtx_modloopcnt_dec;
wire [6:0] ibtx_modloopcnt_in;
wire ff_modloopcnt_scanin;
wire ff_modloopcnt_scanout;
wire [2:0] ibtx_modperiod;
wire ibtx_pattloop_disable;
wire ibtx_pattloopcnt_dec;
wire [6:0] ibtx_pattloopcnt_in;
wire ff_pattloopcnt_scanin;
wire ff_pattloopcnt_scanout;
wire [2:0] ibtx_ptgenord;
wire ibtx_ptgenord_pmc;
wire ibtx_ptgenord_pcm;
wire ibtx_ptgenord_mpc;
wire ibtx_ptgenord_mcp;
wire ibtx_ptgenord_cpm;
wire ibtx_ptgenord_cmp;
wire ibtx_idle_to_patt;
wire ibtx_idle_to_modn;
wire ibtx_idle_to_const;
wire ibtx_idle_to_idle;
wire ibtx_patt_to_patt;
wire ibtx_patt_to_modn;
wire ibtx_patt_to_const;
wire ibtx_patt_to_idle;
wire ibtx_modn_to_patt;
wire ibtx_modn_to_modn;
wire ibtx_modn_to_const;
wire ibtx_modn_to_idle;
wire ibtx_const_to_patt;
wire ibtx_const_to_modn;
wire ibtx_const_to_const;
wire ibtx_const_to_idle;
wire [1:0] ibtx_start_cnt_in;
wire [1:0] ibtx_start_cnt;
wire ff_start_cnt_scanin;
wire ff_start_cnt_scanout;
wire [11:0] ibtx_start_data;
wire ibtx_lo_bits_sel_in;
wire ff_hiword_sel_scanin;
wire ff_hiword_sel_scanout;
wire ff_state_scanin;
wire ff_state_scanout;
wire [3:0] ibtx_state_in;
wire [3:0] ibtx_state_out;
wire [9:0] ibtx_txinvshft_in;
wire [9:0] ibtx_txinvshft;
wire ff_txinvshft_scanin;
wire ff_txinvshft_scanout;
wire [11:0] ibtx_modn_data;
wire [11:0] ibtx_patt1_data;
wire [11:0] ibtx_data;
wire [11:0] ibtx_data_l;
wire [11:0] ibtx_patt2_data;
wire [119:0] ibtx_txdata;


output	[119:0]	ibist_txdata;
output		ibtx_done;

input	[23:0]	fbdic_sbfibportctl;
input	[31:0]	fbdic_sbfibpgctl;
input	[23:0]	fbdic_sbfibpattbuf1;
input	[9:0]	fbdic_sbfibtxmsk;
input	[9:0]	fbdic_sbfibtxshft;
input	[23:0]	fbdic_sbfibpattbuf2;
input	[9:0]	fbdic_sbfibpatt2en;
input		fbdic_txstart;

input 		scan_in ;
input		tcu_aclk ;
input		tcu_bclk ;
input		tcu_scan_en ;

input 		l1clk ;

output 		scan_out ;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// Port control register signals
assign ibtx_loopcon = fbdic_sbfibportctl[3];
assign ibtx_autoinvswpen = fbdic_sbfibportctl[5];

// Pattern generation counters
assign ibtx_ovrloop_disable = fbdic_sbfibpgctl[31:26] == 6'h0;
assign ibtx_ovrloopcnt_is_zero = ibtx_ovrloopcnt[5:0] == 6'h0 & ~ibtx_loopcon;
assign ibtx_ovrloopcnt_dec = ibtx_cnstgencnt[4:0] == 5'h0 & ibtx_modloopcnt[6:0] == 7'h0 & 
				ibtx_pattloopcnt[6:0] == 7'h0 & ~ibtx_ovrloopcnt_is_zero;
assign ibtx_ovrloopcnt_in[5:0] = fbdic_txstart | ibtx_cnstgencnt[4:0] == 5'h0 & 
						 ibtx_modloopcnt[6:0] == 7'h0 & 
						 ibtx_pattloopcnt[6:0] == 7'h0 & 
						 ibtx_ovrloopcnt[5:0] == 6'h0 & ~ibtx_state[`IBTX_STATE_IDLE] &
						 ibtx_loopcon ? fbdic_sbfibpgctl[31:26] - 6'h1 : 
						 ibtx_ovrloopcnt_dec ? ibtx_ovrloopcnt[5:0] - 6'h1 : ibtx_ovrloopcnt[5:0];
mcu_ibtx_ctl_msff_ctl_macro__width_6 ff_ovrloopcnt  (
	.scan_in(ff_ovrloopcnt_scanin),
	.scan_out(ff_ovrloopcnt_scanout),
	.din(ibtx_ovrloopcnt_in[5:0]),
	.dout(ibtx_ovrloopcnt[5:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Constant generation
assign ibtx_cnstgen_disable = fbdic_sbfibpgctl[25:21] == 5'h0;
assign ibtx_cnstgencnt_dec = ibtx_state[`IBTX_STATE_CONST] & ibtx_lo_bits_sel;
assign ibtx_cnstgencnt_in[4:0] = fbdic_txstart | ibtx_ovrloopcnt_dec ? fbdic_sbfibpgctl[25:21] : 
					ibtx_cnstgencnt_dec ? ibtx_cnstgencnt[4:0] - 5'h1 : ibtx_cnstgencnt[4:0];
mcu_ibtx_ctl_msff_ctl_macro__width_5 ff_cnstgencnt  (
	.scan_in(ff_cnstgencnt_scanin),
	.scan_out(ff_cnstgencnt_scanout),
	.din(ibtx_cnstgencnt_in[4:0]),
	.dout(ibtx_cnstgencnt[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibtx_cnstgenset = fbdic_sbfibpgctl[20];

// Mod-N pattern
assign ibtx_modloop_disable = fbdic_sbfibpgctl[19:13] == 7'h0;
assign ibtx_modloopcnt_dec = ibtx_state[`IBTX_STATE_MODN] & ibtx_lo_bits_sel;
assign ibtx_modloopcnt_in[6:0] = fbdic_txstart | ibtx_ovrloopcnt_dec ? fbdic_sbfibpgctl[19:13] : 
					ibtx_modloopcnt_dec ? ibtx_modloopcnt[6:0] - 7'h1 : ibtx_modloopcnt[6:0];
mcu_ibtx_ctl_msff_ctl_macro__width_7 ff_modloopcnt  (
	.scan_in(ff_modloopcnt_scanin),
	.scan_out(ff_modloopcnt_scanout),
	.din(ibtx_modloopcnt_in[6:0]),
	.dout(ibtx_modloopcnt[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibtx_modperiod[2:0] = fbdic_sbfibpgctl[12:10];

// Pattern Register 1
assign ibtx_pattloop_disable = fbdic_sbfibpgctl[9:3] == 7'h0;
assign ibtx_pattloopcnt_dec = ibtx_state[`IBTX_STATE_PATT] & ibtx_lo_bits_sel;
assign ibtx_pattloopcnt_in[6:0] = fbdic_txstart | ibtx_ovrloopcnt_dec ? fbdic_sbfibpgctl[9:3] : 
					ibtx_pattloopcnt_dec ? ibtx_pattloopcnt[6:0] - 7'h1 : ibtx_pattloopcnt[6:0];
mcu_ibtx_ctl_msff_ctl_macro__width_7 ff_pattloopcnt  (
	.scan_in(ff_pattloopcnt_scanin),
	.scan_out(ff_pattloopcnt_scanout),
	.din(ibtx_pattloopcnt_in[6:0]),
	.dout(ibtx_pattloopcnt[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// 
assign ibtx_ptgenord[2:0] = fbdic_sbfibpgctl[2:0];
assign ibtx_ptgenord_pmc = ibtx_ptgenord[2:0] == 3'h0;
assign ibtx_ptgenord_pcm = ibtx_ptgenord[2:0] == 3'h1;
assign ibtx_ptgenord_mpc = ibtx_ptgenord[2:0] == 3'h2;
assign ibtx_ptgenord_mcp = ibtx_ptgenord[2:0] == 3'h3;
assign ibtx_ptgenord_cpm = ibtx_ptgenord[2:0] == 3'h4;
assign ibtx_ptgenord_cmp = ibtx_ptgenord[2:0] == 3'h5;

// State machine arcs
// Idle/Start state
assign ibtx_idle_to_patt = ~ibtx_pattloop_disable & 
				(ibtx_ptgenord_pmc | ibtx_ptgenord_pcm |
				ibtx_ptgenord_mpc & ibtx_modloop_disable |
			    	ibtx_ptgenord_mcp & ibtx_cnstgen_disable & ibtx_modloop_disable |
			    	ibtx_ptgenord_cpm & ibtx_cnstgen_disable |
			    	ibtx_ptgenord_cmp & ibtx_cnstgen_disable & ibtx_modloop_disable);
assign ibtx_idle_to_modn = ~ibtx_modloop_disable & 
				(ibtx_ptgenord_mpc | ibtx_ptgenord_mcp |
				ibtx_ptgenord_pmc & ibtx_pattloop_disable | 
				ibtx_ptgenord_pcm & ibtx_pattloop_disable & ibtx_cnstgen_disable | 
				ibtx_ptgenord_cpm & ibtx_pattloop_disable & ibtx_cnstgen_disable | 
				ibtx_ptgenord_cmp & ibtx_cnstgen_disable);
assign ibtx_idle_to_const = ~ibtx_cnstgen_disable & 
				(ibtx_ptgenord_cpm | ibtx_ptgenord_cmp |
				ibtx_ptgenord_pmc & ibtx_pattloop_disable & ibtx_modloop_disable | 
				ibtx_ptgenord_pcm & ibtx_pattloop_disable | 
				ibtx_ptgenord_mpc & ibtx_modloop_disable & ibtx_pattloop_disable |
			    	ibtx_ptgenord_mcp & ibtx_modloop_disable);
assign ibtx_idle_to_idle = ibtx_pattloop_disable & ibtx_modloop_disable & ibtx_cnstgen_disable | ibtx_ovrloop_disable;

// Pattern state
assign ibtx_patt_to_patt = ibtx_modloop_disable & ibtx_cnstgen_disable & ~ibtx_ovrloopcnt_is_zero;
assign ibtx_patt_to_modn = ~ibtx_modloop_disable & 
				(ibtx_ptgenord_pmc | ibtx_ptgenord_cpm |
				ibtx_ptgenord_pcm & ibtx_cnstgen_disable |
				ibtx_ptgenord_mpc & ibtx_cnstgen_disable & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_mcp & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_cmp & ibtx_cnstgen_disable & ~ibtx_ovrloopcnt_is_zero);	
assign ibtx_patt_to_const = ~ibtx_cnstgen_disable &
				(ibtx_ptgenord_pmc & ibtx_modloop_disable | 
				ibtx_ptgenord_cpm & ibtx_modloop_disable & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_pcm |
				ibtx_ptgenord_mpc |
				ibtx_ptgenord_mcp & ibtx_modloop_disable & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_cmp & ~ibtx_ovrloopcnt_is_zero);
assign ibtx_patt_to_idle = ibtx_ovrloopcnt_is_zero &
				(ibtx_ptgenord_pmc & ibtx_cnstgen_disable & ibtx_modloop_disable | 
				ibtx_ptgenord_cpm & ibtx_modloop_disable |
				ibtx_ptgenord_pcm & ibtx_cnstgen_disable & ibtx_modloop_disable |
				ibtx_ptgenord_mpc & ibtx_cnstgen_disable |
				ibtx_ptgenord_mcp |
				ibtx_ptgenord_cmp);

// MOD-N state
assign ibtx_modn_to_patt = ~ibtx_pattloop_disable &
				(ibtx_ptgenord_pmc & ibtx_cnstgen_disable & ~ibtx_ovrloopcnt_is_zero | 
				ibtx_ptgenord_cpm & ibtx_cnstgen_disable & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_pcm & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_mpc |
				ibtx_ptgenord_mcp & ibtx_cnstgen_disable |
				ibtx_ptgenord_cmp);
assign ibtx_modn_to_modn = ~ibtx_modloop_disable & ibtx_cnstgen_disable & ibtx_pattloop_disable;
assign ibtx_modn_to_const = ~ibtx_cnstgen_disable &
				(ibtx_ptgenord_pmc | 
				ibtx_ptgenord_mcp |
				ibtx_ptgenord_cpm & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_pcm & ~ibtx_ovrloopcnt_is_zero & ibtx_pattloop_disable |
				ibtx_ptgenord_mpc & ibtx_pattloop_disable|
				ibtx_ptgenord_cmp & ~ibtx_ovrloopcnt_is_zero & ibtx_pattloop_disable);
assign ibtx_modn_to_idle = ibtx_ovrloopcnt_is_zero &
				(ibtx_ptgenord_pmc & ibtx_cnstgen_disable | 
				ibtx_ptgenord_cpm |
				ibtx_ptgenord_pcm |
				ibtx_ptgenord_mpc & ibtx_cnstgen_disable & ibtx_pattloop_disable |
				ibtx_ptgenord_mcp & ibtx_cnstgen_disable & ibtx_pattloop_disable |
				ibtx_ptgenord_cmp & ibtx_pattloop_disable);

// Constant state
assign ibtx_const_to_patt = ~ibtx_pattloop_disable &
				(ibtx_ptgenord_pmc & ~ibtx_ovrloopcnt_is_zero | 
				ibtx_ptgenord_cpm |
				ibtx_ptgenord_pcm & ~ibtx_ovrloopcnt_is_zero & ibtx_modloop_disable |
				ibtx_ptgenord_mpc & ~ibtx_ovrloopcnt_is_zero & ibtx_modloop_disable |
				ibtx_ptgenord_mcp |
				ibtx_ptgenord_cmp & ibtx_modloop_disable);
assign ibtx_const_to_modn = ~ibtx_modloop_disable &
				(ibtx_ptgenord_pmc & ~ibtx_ovrloopcnt_is_zero & ibtx_pattloop_disable | 
				ibtx_ptgenord_cpm & ibtx_pattloop_disable |
				ibtx_ptgenord_pcm |
				ibtx_ptgenord_mpc & ~ibtx_ovrloopcnt_is_zero |
				ibtx_ptgenord_mcp & ~ibtx_ovrloopcnt_is_zero & ibtx_pattloop_disable |
				ibtx_ptgenord_cmp);
assign ibtx_const_to_const = ~ibtx_ovrloopcnt_is_zero & ibtx_modloop_disable & ibtx_pattloop_disable;
assign ibtx_const_to_idle = ibtx_ovrloopcnt_is_zero &
				(ibtx_ptgenord_pmc | 
				ibtx_ptgenord_cpm & ibtx_modloop_disable & ibtx_pattloop_disable |
				ibtx_ptgenord_pcm & ibtx_modloop_disable |
				ibtx_ptgenord_mpc |
				ibtx_ptgenord_mcp & ibtx_pattloop_disable |
				ibtx_ptgenord_cmp & ibtx_modloop_disable & ibtx_pattloop_disable);

// Counter to send out start delimiters
assign ibtx_start_cnt_in[1:0] = fbdic_txstart | (|ibtx_start_cnt[1:0]) ? ibtx_start_cnt[1:0] + 2'h1 : 2'h0;
mcu_ibtx_ctl_msff_ctl_macro__width_2 ff_start_cnt  (
	.scan_in(ff_start_cnt_scanin),
	.scan_out(ff_start_cnt_scanout),
	.din(ibtx_start_cnt_in[1:0]),
	.dout(ibtx_start_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibtx_start_data[11:0] = ibtx_start_cnt[0] ? 12'h876 : 12'h543;

// Bit to select between high and low 12 bits of pattern data
assign ibtx_lo_bits_sel_in = ~ibtx_state[`IBTX_STATE_IDLE] & ~ibtx_lo_bits_sel;
mcu_ibtx_ctl_msff_ctl_macro ff_hiword_sel (
	.scan_in(ff_hiword_sel_scanin),
	.scan_out(ff_hiword_sel_scanout),
	.din(ibtx_lo_bits_sel_in),
	.dout(ibtx_lo_bits_sel),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// state machine
reg [3:0] ibtx_state_next;

// 0in one_hot -var ibtx_state[3:0]
mcu_ibtx_ctl_msff_ctl_macro__width_4 ff_state  (
	.scan_in(ff_state_scanin),
	.scan_out(ff_state_scanout),
	.din(ibtx_state_in[3:0]),
	.dout(ibtx_state_out[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibtx_state_in[3:0] = ibtx_state_next[3:0] ^ 4'h1;
assign ibtx_state[3:0] = ibtx_state_out[3:0] ^ 4'h1;

always @(ibtx_state or ibtx_idle_to_const or ibtx_idle_to_modn or ibtx_idle_to_patt or ibtx_idle_to_idle
	 or ibtx_patt_to_const or ibtx_patt_to_modn or ibtx_patt_to_patt or ibtx_patt_to_idle
	 or ibtx_const_to_const or ibtx_const_to_modn or ibtx_const_to_patt or ibtx_const_to_idle
	 or ibtx_modn_to_const or ibtx_modn_to_modn or ibtx_modn_to_patt or ibtx_modn_to_idle
	 or ibtx_start_cnt or ibtx_cnstgencnt or ibtx_modloopcnt or ibtx_pattloopcnt or ibtx_lo_bits_sel) 
begin

	ibtx_state_next[3:0] = 4'h0;

	case (1'b1)
	ibtx_state[`IBTX_STATE_IDLE]: begin
		if (ibtx_start_cnt[1:0] == 2'h3) begin
			ibtx_state_next[3:0] = {ibtx_idle_to_const, ibtx_idle_to_modn, 
						ibtx_idle_to_patt, ibtx_idle_to_idle};
		end
		else begin
			ibtx_state_next[`IBTX_STATE_IDLE] = 1'b1;
		end	
	end
	ibtx_state[`IBTX_STATE_CONST]: begin
		if (ibtx_cnstgencnt[4:0] == 5'h1 & ibtx_lo_bits_sel) begin
			ibtx_state_next[3:0] = {ibtx_const_to_const, ibtx_const_to_modn, 
						ibtx_const_to_patt, ibtx_const_to_idle};
		end
		else begin
			ibtx_state_next[`IBTX_STATE_CONST] = 1'b1;
		end
	end
	ibtx_state[`IBTX_STATE_MODN]: begin
		if (ibtx_modloopcnt[6:0] == 7'h1 & ibtx_lo_bits_sel) begin
			ibtx_state_next[3:0] = {ibtx_modn_to_const, ibtx_modn_to_modn, 
						ibtx_modn_to_patt, ibtx_modn_to_idle};
		end
		else begin
			ibtx_state_next[`IBTX_STATE_MODN] = 1'b1;
		end
	end
	ibtx_state[`IBTX_STATE_PATT]: begin
		if (ibtx_pattloopcnt[6:0] == 7'h1 & ibtx_lo_bits_sel) begin
			ibtx_state_next[3:0] = {ibtx_patt_to_const, ibtx_patt_to_modn, 
						ibtx_patt_to_patt, ibtx_patt_to_idle};
		end
		else begin
			ibtx_state_next[`IBTX_STATE_PATT] = 1'b1;
		end
	end
	default: ;
	endcase
end

assign ibtx_done = ~ibtx_state[0] & ibtx_state_next[0];

// inversion shift register
assign ibtx_txinvshft_in[9:0] = fbdic_txstart ? fbdic_sbfibtxshft[9:0] : 
				ibtx_ovrloopcnt_dec & ibtx_autoinvswpen ? 
					{ibtx_txinvshft[8:0],ibtx_txinvshft[9]} : ibtx_txinvshft[9:0];
mcu_ibtx_ctl_msff_ctl_macro__width_10 ff_txinvshft  (
	.scan_in(ff_txinvshft_scanin),
	.scan_out(ff_txinvshft_scanout),
	.din(ibtx_txinvshft_in[9:0]),
	.dout(ibtx_txinvshft[9:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibtx_modn_data[11:0] =   {12{ibtx_modperiod[2:0] == 3'h1}} & 12'h555 |
				{12{ibtx_modperiod[2:0] == 3'h2}} & 12'h333 |
				{12{ibtx_modperiod[2:0] == 3'h3}} & 12'h1c7 |
				{12{ibtx_modperiod[2:0] == 3'h4}} & (ibtx_lo_bits_sel ? 12'hf0f : 12'h0f0) |
				{12{ibtx_modperiod[2:0] == 3'h6}} & (ibtx_lo_bits_sel ? 12'hfff : 12'h000);

assign ibtx_patt1_data[11:0] = ibtx_lo_bits_sel ? fbdic_sbfibpattbuf1[11:0] : fbdic_sbfibpattbuf1[23:12];

assign ibtx_data[11:0] = {12{ibtx_state[`IBTX_STATE_CONST]}} & {12{ibtx_cnstgenset}} |
			 {12{ibtx_state[`IBTX_STATE_PATT]}}  & ibtx_patt1_data[11:0] |
			 {12{ibtx_state[`IBTX_STATE_MODN]}}  & ibtx_modn_data[11:0];
assign ibtx_data_l[11:0] = ~ibtx_data[11:0];

assign ibtx_patt2_data[11:0] = ibtx_lo_bits_sel ? fbdic_sbfibpattbuf2[11:0] : fbdic_sbfibpattbuf2[23:12];

assign ibtx_txdata[119:108] = {12{fbdic_sbfibtxmsk[9]}} & (fbdic_sbfibpatt2en[9] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[9] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[107:96] = {12{fbdic_sbfibtxmsk[8]}} & (fbdic_sbfibpatt2en[8] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[8] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[95:84] = {12{fbdic_sbfibtxmsk[7]}} & (fbdic_sbfibpatt2en[7] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[7] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[83:72] = {12{fbdic_sbfibtxmsk[6]}} & (fbdic_sbfibpatt2en[6] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[6] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[71:60] = {12{fbdic_sbfibtxmsk[5]}} & (fbdic_sbfibpatt2en[5] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[5] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[59:48] = {12{fbdic_sbfibtxmsk[4]}} & (fbdic_sbfibpatt2en[4] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[4] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[47:36] = {12{fbdic_sbfibtxmsk[3]}} & (fbdic_sbfibpatt2en[3] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[3] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[35:24] = {12{fbdic_sbfibtxmsk[2]}} & (fbdic_sbfibpatt2en[2] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[2] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[23:12] = {12{fbdic_sbfibtxmsk[1]}} & (fbdic_sbfibpatt2en[1] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[1] ? ibtx_data_l[11:0] : ibtx_data[11:0]);
assign ibtx_txdata[11:0] = {12{fbdic_sbfibtxmsk[0]}} & (fbdic_sbfibpatt2en[0] ? ibtx_patt2_data[11:0] :
							ibtx_txinvshft[0] ? ibtx_data_l[11:0] : ibtx_data[11:0]);

assign ibist_txdata[119:0] = ibtx_state[`IBTX_STATE_IDLE] ? {10{ibtx_start_data[11:0]}}: ibtx_txdata[119:0];

// fixscan start:
assign ff_ovrloopcnt_scanin      = scan_in                  ;
assign ff_cnstgencnt_scanin      = ff_ovrloopcnt_scanout    ;
assign ff_modloopcnt_scanin      = ff_cnstgencnt_scanout    ;
assign ff_pattloopcnt_scanin     = ff_modloopcnt_scanout    ;
assign ff_start_cnt_scanin       = ff_pattloopcnt_scanout   ;
assign ff_hiword_sel_scanin      = ff_start_cnt_scanout     ;
assign ff_state_scanin           = ff_hiword_sel_scanout    ;
assign ff_txinvshft_scanin       = ff_state_scanout         ;
assign scan_out                  = ff_txinvshft_scanout     ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_ibtx_ctl_msff_ctl_macro__width_6 (
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

module mcu_ibtx_ctl_msff_ctl_macro__width_5 (
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

module mcu_ibtx_ctl_msff_ctl_macro__width_7 (
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

module mcu_ibtx_ctl_msff_ctl_macro__width_2 (
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

module mcu_ibtx_ctl_msff_ctl_macro (
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

module mcu_ibtx_ctl_msff_ctl_macro__width_4 (
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

module mcu_ibtx_ctl_msff_ctl_macro__width_10 (
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








