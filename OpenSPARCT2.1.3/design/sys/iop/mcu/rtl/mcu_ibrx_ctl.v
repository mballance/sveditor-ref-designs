// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ibrx_ctl.v
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



module mcu_ibrx_ctl (
  ibrx_done, 
  ibrx_rxerrstat, 
  ibrx_errcnt, 
  ibrx_errlnnum, 
  ibrx_errstat, 
  fbdic_nbfibportctl, 
  fbdic_nbfibpgctl, 
  fbdic_nbfibpattbuf1, 
  fbdic_nbfibrxmsk, 
  fbdic_nbfibrxshft, 
  fbdic_nbfibrxlnerr, 
  fbdic_nbfibpattbuf2, 
  fbdic_nbfibpatt2en, 
  fbdic_rxstart, 
  fbdic_ibrx_start_ld, 
  fbdic_nbfibportctl_en, 
  fbdic_errcnt_clr, 
  fbdic_errstat_clr, 
  ibist_rxdata, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  l1clk, 
  scan_out);
wire siclk;
wire soclk;
wire se;
wire ibrx_autoinvswpen;
wire ibrx_stoponerr;
wire ibrx_loopcon;
wire ibrx_ovrloop_disable;
wire ibrx_ovrloopcnt_is_zero;
wire [5:0] ibrx_ovrloopcnt;
wire ibrx_ovrloopcnt_dec;
wire [4:0] ibrx_cnstgencnt;
wire [6:0] ibrx_modloopcnt;
wire [6:0] ibrx_pattloopcnt;
wire [5:0] ibrx_ovrloopcnt_in;
wire [3:0] ibrx_state;
wire ff_ovrloopcnt_scanin;
wire ff_ovrloopcnt_scanout;
wire ibrx_cnstgen_disable;
wire ibrx_cnstgencnt_dec;
wire ibrx_lo_bits_sel;
wire [4:0] ibrx_cnstgencnt_in;
wire ff_cnstgencnt_scanin;
wire ff_cnstgencnt_scanout;
wire ibrx_cnstgenset;
wire ibrx_modloop_disable;
wire ibrx_modloopcnt_dec;
wire [6:0] ibrx_modloopcnt_in;
wire ff_modloopcnt_scanin;
wire ff_modloopcnt_scanout;
wire [2:0] ibrx_modperiod;
wire ibrx_pattloop_disable;
wire ibrx_pattloopcnt_dec;
wire [6:0] ibrx_pattloopcnt_in;
wire ff_pattloopcnt_scanin;
wire ff_pattloopcnt_scanout;
wire [2:0] ibrx_ptgenord;
wire ibrx_ptgenord_pmc;
wire ibrx_ptgenord_pcm;
wire ibrx_ptgenord_mpc;
wire ibrx_ptgenord_mcp;
wire ibrx_ptgenord_cpm;
wire ibrx_ptgenord_cmp;
wire ibrx_idle_to_patt;
wire ibrx_idle_to_modn;
wire ibrx_idle_to_const;
wire ibrx_idle_to_idle;
wire ibrx_patt_to_patt;
wire ibrx_patt_to_modn;
wire ibrx_patt_to_const;
wire ibrx_patt_to_idle;
wire ibrx_modn_to_patt;
wire ibrx_modn_to_modn;
wire ibrx_modn_to_const;
wire ibrx_modn_to_idle;
wire ibrx_const_to_patt;
wire ibrx_const_to_modn;
wire ibrx_const_to_const;
wire ibrx_const_to_idle;
wire [13:0] ibrx_rxinvshft_in;
wire [13:0] ibrx_rxinvshft;
wire ff_rxinvshft_scanin;
wire ff_rxinvshft_scanout;
wire ibrx_lo_bits_sel_in;
wire ff_hiword_sel_scanin;
wire ff_hiword_sel_scanout;
wire ff_state_scanin;
wire ff_state_scanout;
wire [3:0] ibrx_state_in;
wire [3:0] ibrx_state_out;
wire [11:0] ibrx_modn_data;
wire [11:0] ibrx_patt1_data;
wire [11:0] ibrx_data;
wire [11:0] ibrx_data_l;
wire [11:0] ibrx_patt2_data;
wire [167:0] ibrx_rxdata;
wire ibrx_ibist_mode_in;
wire ibrx_ibist_mode;
wire ff_ibist_mode_scanin;
wire ff_ibist_mode_scanout;
wire [13:0] ibrx_rxerrstat_in;
wire ff_rxerrstat_scanin;
wire ff_rxerrstat_scanout;
wire [9:0] ibrx_errcnt_in;
wire ff_errcnt_scanin;
wire ff_errcnt_scanout;
wire [3:0] ibrx_first_err_lane;
wire [3:0] ibrx_errlnnum_in;
wire ff_errlnnum_scanin;
wire ff_errlnnum_scanout;
wire [1:0] ibrx_errstat_in;
wire ff_errstat_scanin;
wire ff_errstat_scanout;


output		ibrx_done;
output	[13:0]	ibrx_rxerrstat;
output	[9:0]	ibrx_errcnt;
output	[3:0]	ibrx_errlnnum;
output	[1:0]	ibrx_errstat;

input	[23:0]	fbdic_nbfibportctl;
input	[31:0]	fbdic_nbfibpgctl;
input	[23:0]	fbdic_nbfibpattbuf1;
input	[13:0]	fbdic_nbfibrxmsk;
input	[13:0]	fbdic_nbfibrxshft;
input	[13:0]	fbdic_nbfibrxlnerr;
input	[23:0]	fbdic_nbfibpattbuf2;
input	[13:0]	fbdic_nbfibpatt2en;
input		fbdic_rxstart;

input		fbdic_ibrx_start_ld;
input		fbdic_nbfibportctl_en;
input	[9:0]	fbdic_errcnt_clr;
input	[1:0]	fbdic_errstat_clr;

input	[167:0]	ibist_rxdata;

input 		scan_in ;
input		tcu_aclk ;
input		tcu_bclk ;
input		tcu_scan_en ;

input 		l1clk ;

output 		scan_out ;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

wire [13:0] ibrx_lane_error;

// Port control register signals
assign ibrx_autoinvswpen = fbdic_nbfibportctl[5];
assign ibrx_stoponerr = fbdic_nbfibportctl[4];
assign ibrx_loopcon = fbdic_nbfibportctl[3];

// Pattern generation counters
assign ibrx_ovrloop_disable = fbdic_nbfibpgctl[31:26] == 6'h0;
assign ibrx_ovrloopcnt_is_zero = ibrx_ovrloopcnt[5:0] == 6'h0 & ~ibrx_loopcon;
assign ibrx_ovrloopcnt_dec = ibrx_cnstgencnt[4:0] == 5'h0 & ibrx_modloopcnt[6:0] == 7'h0 & 
				ibrx_pattloopcnt[6:0] == 7'h0 & (ibrx_ovrloopcnt[5:0] != 6'h0 | ibrx_loopcon);
assign ibrx_ovrloopcnt_in[5:0] = fbdic_rxstart | ibrx_cnstgencnt[4:0] == 5'h0 & 
						 ibrx_modloopcnt[6:0] == 7'h0 & 
						 ibrx_pattloopcnt[6:0] == 7'h0 & 
						 ibrx_ovrloopcnt[5:0] == 6'h0 & ~ibrx_state[`IBRX_STATE_IDLE] &
						 ibrx_loopcon ? fbdic_nbfibpgctl[31:26] - 6'h1 : 
						 ibrx_ovrloopcnt_dec ? ibrx_ovrloopcnt[5:0] - 6'h1 : ibrx_ovrloopcnt[5:0];
mcu_ibrx_ctl_msff_ctl_macro__width_6 ff_ovrloopcnt  (
	.scan_in(ff_ovrloopcnt_scanin),
	.scan_out(ff_ovrloopcnt_scanout),
	.din(ibrx_ovrloopcnt_in[5:0]),
	.dout(ibrx_ovrloopcnt[5:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Constant generation
assign ibrx_cnstgen_disable = fbdic_nbfibpgctl[25:21] == 5'h0;
assign ibrx_cnstgencnt_dec = ibrx_state[`IBRX_STATE_CONST] & ibrx_lo_bits_sel;
assign ibrx_cnstgencnt_in[4:0] = fbdic_rxstart | ibrx_ovrloopcnt_dec ? fbdic_nbfibpgctl[25:21] : 
					ibrx_cnstgencnt_dec ? ibrx_cnstgencnt[4:0] - 5'h1 : ibrx_cnstgencnt[4:0];
mcu_ibrx_ctl_msff_ctl_macro__width_5 ff_cnstgencnt  (
	.scan_in(ff_cnstgencnt_scanin),
	.scan_out(ff_cnstgencnt_scanout),
	.din(ibrx_cnstgencnt_in[4:0]),
	.dout(ibrx_cnstgencnt[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibrx_cnstgenset = fbdic_nbfibpgctl[20];

// Mod-N pattern
assign ibrx_modloop_disable = fbdic_nbfibpgctl[19:13] == 7'h0;
assign ibrx_modloopcnt_dec = ibrx_state[`IBRX_STATE_MODN] & ibrx_lo_bits_sel;
assign ibrx_modloopcnt_in[6:0] = fbdic_rxstart | ibrx_ovrloopcnt_dec ? fbdic_nbfibpgctl[19:13] : 
					ibrx_modloopcnt_dec ? ibrx_modloopcnt[6:0] - 7'h1 : ibrx_modloopcnt[6:0];
mcu_ibrx_ctl_msff_ctl_macro__width_7 ff_modloopcnt  (
	.scan_in(ff_modloopcnt_scanin),
	.scan_out(ff_modloopcnt_scanout),
	.din(ibrx_modloopcnt_in[6:0]),
	.dout(ibrx_modloopcnt[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibrx_modperiod[2:0] = fbdic_nbfibpgctl[12:10];

// Pattern Register 1
assign ibrx_pattloop_disable = fbdic_nbfibpgctl[9:3] == 7'h0;
assign ibrx_pattloopcnt_dec = ibrx_state[`IBRX_STATE_PATT] & ibrx_lo_bits_sel;
assign ibrx_pattloopcnt_in[6:0] = fbdic_rxstart | ibrx_ovrloopcnt_dec ? fbdic_nbfibpgctl[9:3] : 
					ibrx_pattloopcnt_dec ? ibrx_pattloopcnt[6:0] - 7'h1 : ibrx_pattloopcnt[6:0];
mcu_ibrx_ctl_msff_ctl_macro__width_7 ff_pattloopcnt  (
	.scan_in(ff_pattloopcnt_scanin),
	.scan_out(ff_pattloopcnt_scanout),
	.din(ibrx_pattloopcnt_in[6:0]),
	.dout(ibrx_pattloopcnt[6:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// 
assign ibrx_ptgenord[2:0] = fbdic_nbfibpgctl[2:0];
assign ibrx_ptgenord_pmc = ibrx_ptgenord[2:0] == 3'h0;
assign ibrx_ptgenord_pcm = ibrx_ptgenord[2:0] == 3'h1;
assign ibrx_ptgenord_mpc = ibrx_ptgenord[2:0] == 3'h2;
assign ibrx_ptgenord_mcp = ibrx_ptgenord[2:0] == 3'h3;
assign ibrx_ptgenord_cpm = ibrx_ptgenord[2:0] == 3'h4;
assign ibrx_ptgenord_cmp = ibrx_ptgenord[2:0] == 3'h5;

// State machine arcs
// Idle/Start state
assign ibrx_idle_to_patt = ~ibrx_pattloop_disable & 
				(ibrx_ptgenord_pmc | ibrx_ptgenord_pcm |
				ibrx_ptgenord_mpc & ibrx_modloop_disable |
			    	ibrx_ptgenord_mcp & ibrx_cnstgen_disable & ibrx_modloop_disable |
			    	ibrx_ptgenord_cpm & ibrx_cnstgen_disable |
			    	ibrx_ptgenord_cmp & ibrx_cnstgen_disable & ibrx_modloop_disable);
assign ibrx_idle_to_modn = ~ibrx_modloop_disable & 
				(ibrx_ptgenord_mpc | ibrx_ptgenord_mcp |
				ibrx_ptgenord_pmc & ibrx_pattloop_disable | 
				ibrx_ptgenord_pcm & ibrx_pattloop_disable & ibrx_cnstgen_disable | 
				ibrx_ptgenord_cpm & ibrx_pattloop_disable & ibrx_cnstgen_disable | 
				ibrx_ptgenord_cmp & ibrx_cnstgen_disable);
assign ibrx_idle_to_const = ~ibrx_cnstgen_disable & 
				(ibrx_ptgenord_cpm | ibrx_ptgenord_cmp |
				ibrx_ptgenord_pmc & ibrx_pattloop_disable & ibrx_modloop_disable | 
				ibrx_ptgenord_pcm & ibrx_pattloop_disable | 
				ibrx_ptgenord_mpc & ibrx_modloop_disable & ibrx_pattloop_disable |
			    	ibrx_ptgenord_mcp & ibrx_modloop_disable);
assign ibrx_idle_to_idle = ibrx_pattloop_disable & ibrx_modloop_disable & ibrx_cnstgen_disable | ibrx_ovrloop_disable;

// Pattern state
assign ibrx_patt_to_patt = ibrx_modloop_disable & ibrx_cnstgen_disable & ~ibrx_ovrloopcnt_is_zero;
assign ibrx_patt_to_modn = ~ibrx_modloop_disable & 
				(ibrx_ptgenord_pmc | ibrx_ptgenord_cpm |
				ibrx_ptgenord_pcm & ibrx_cnstgen_disable |
				ibrx_ptgenord_mpc & ibrx_cnstgen_disable & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_mcp & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_cmp & ibrx_cnstgen_disable & ~ibrx_ovrloopcnt_is_zero);	
assign ibrx_patt_to_const = ~ibrx_cnstgen_disable &
				(ibrx_ptgenord_pmc & ibrx_modloop_disable | 
				ibrx_ptgenord_cpm & ibrx_modloop_disable & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_pcm |
				ibrx_ptgenord_mpc |
				ibrx_ptgenord_mcp & ibrx_modloop_disable & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_cmp & ~ibrx_ovrloopcnt_is_zero);
assign ibrx_patt_to_idle = ibrx_ovrloopcnt_is_zero &
				(ibrx_ptgenord_pmc & ibrx_cnstgen_disable & ibrx_modloop_disable | 
				ibrx_ptgenord_cpm & ibrx_modloop_disable |
				ibrx_ptgenord_pcm & ibrx_cnstgen_disable & ibrx_modloop_disable |
				ibrx_ptgenord_mpc & ibrx_cnstgen_disable |
				ibrx_ptgenord_mcp |
				ibrx_ptgenord_cmp);

// MOD-N state
assign ibrx_modn_to_patt = ~ibrx_pattloop_disable &
				(ibrx_ptgenord_pmc & ibrx_cnstgen_disable & ~ibrx_ovrloopcnt_is_zero | 
				ibrx_ptgenord_cpm & ibrx_cnstgen_disable & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_pcm & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_mpc |
				ibrx_ptgenord_mcp & ibrx_cnstgen_disable |
				ibrx_ptgenord_cmp);
assign ibrx_modn_to_modn = ~ibrx_modloop_disable & ibrx_cnstgen_disable & ibrx_pattloop_disable;
assign ibrx_modn_to_const = ~ibrx_cnstgen_disable &
				(ibrx_ptgenord_pmc | 
				ibrx_ptgenord_mcp |
				ibrx_ptgenord_cpm & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_pcm & ~ibrx_ovrloopcnt_is_zero & ibrx_pattloop_disable |
				ibrx_ptgenord_mpc & ibrx_pattloop_disable|
				ibrx_ptgenord_cmp & ~ibrx_ovrloopcnt_is_zero & ibrx_pattloop_disable);
assign ibrx_modn_to_idle = ibrx_ovrloopcnt_is_zero &
				(ibrx_ptgenord_pmc & ibrx_cnstgen_disable | 
				ibrx_ptgenord_cpm |
				ibrx_ptgenord_pcm |
				ibrx_ptgenord_mpc & ibrx_cnstgen_disable & ibrx_pattloop_disable |
				ibrx_ptgenord_mcp & ibrx_cnstgen_disable & ibrx_pattloop_disable |
				ibrx_ptgenord_cmp & ibrx_pattloop_disable);

// Constant state
assign ibrx_const_to_patt = ~ibrx_pattloop_disable &
				(ibrx_ptgenord_pmc & ~ibrx_ovrloopcnt_is_zero | 
				ibrx_ptgenord_cpm |
				ibrx_ptgenord_pcm & ~ibrx_ovrloopcnt_is_zero & ibrx_modloop_disable |
				ibrx_ptgenord_mpc & ~ibrx_ovrloopcnt_is_zero & ibrx_modloop_disable |
				ibrx_ptgenord_mcp |
				ibrx_ptgenord_cmp & ibrx_modloop_disable);
assign ibrx_const_to_modn = ~ibrx_modloop_disable &
				(ibrx_ptgenord_pmc & ~ibrx_ovrloopcnt_is_zero & ibrx_pattloop_disable | 
				ibrx_ptgenord_cpm & ibrx_pattloop_disable |
				ibrx_ptgenord_pcm |
				ibrx_ptgenord_mpc & ~ibrx_ovrloopcnt_is_zero |
				ibrx_ptgenord_mcp & ~ibrx_ovrloopcnt_is_zero & ibrx_pattloop_disable |
				ibrx_ptgenord_cmp);
assign ibrx_const_to_const = ~ibrx_ovrloopcnt_is_zero & ibrx_modloop_disable & ibrx_pattloop_disable;
assign ibrx_const_to_idle = ibrx_ovrloopcnt_is_zero &
				(ibrx_ptgenord_pmc | 
				ibrx_ptgenord_cpm & ibrx_modloop_disable & ibrx_pattloop_disable |
				ibrx_ptgenord_pcm & ibrx_modloop_disable |
				ibrx_ptgenord_mpc |
				ibrx_ptgenord_mcp & ibrx_pattloop_disable |
				ibrx_ptgenord_cmp & ibrx_modloop_disable & ibrx_pattloop_disable);

// inversion shift register
assign ibrx_rxinvshft_in[13:0] = fbdic_rxstart ? fbdic_nbfibrxshft[13:0] : 
				ibrx_ovrloopcnt_dec & ibrx_autoinvswpen ? 
					{ibrx_rxinvshft[12:0],ibrx_rxinvshft[13]} : ibrx_rxinvshft[13:0];
mcu_ibrx_ctl_msff_ctl_macro__width_14 ff_rxinvshft  (
	.scan_in(ff_rxinvshft_scanin),
	.scan_out(ff_rxinvshft_scanout),
	.din(ibrx_rxinvshft_in[13:0]),
	.dout(ibrx_rxinvshft[13:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Bit to select between high and low 12 bits of pattern data
assign ibrx_lo_bits_sel_in = ~ibrx_state[`IBRX_STATE_IDLE] & ~ibrx_lo_bits_sel;
mcu_ibrx_ctl_msff_ctl_macro ff_hiword_sel (
	.scan_in(ff_hiword_sel_scanin),
	.scan_out(ff_hiword_sel_scanout),
	.din(ibrx_lo_bits_sel_in),
	.dout(ibrx_lo_bits_sel),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// state machine
reg [3:0] ibrx_state_next;

// 0in one_hot -var ibrx_state[3:0]
mcu_ibrx_ctl_msff_ctl_macro__width_4 ff_state  (
	.scan_in(ff_state_scanin),
	.scan_out(ff_state_scanout),
	.din(ibrx_state_in[3:0]),
	.dout(ibrx_state_out[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ibrx_state_in[3:0] = ibrx_state_next[3:0] ^ 4'h1;
assign ibrx_state[3:0] = ibrx_state_out[3:0] ^ 4'h1;

always @(ibrx_state or ibrx_idle_to_const or ibrx_idle_to_modn or ibrx_idle_to_patt or ibrx_idle_to_idle
	 or ibrx_patt_to_const or ibrx_patt_to_modn or ibrx_patt_to_patt or ibrx_patt_to_idle
	 or ibrx_const_to_const or ibrx_const_to_modn or ibrx_const_to_patt or ibrx_const_to_idle
	 or ibrx_modn_to_const or ibrx_modn_to_modn or ibrx_modn_to_patt or ibrx_modn_to_idle
	 or ibrx_cnstgencnt or ibrx_modloopcnt or ibrx_pattloopcnt or ibrx_lo_bits_sel or fbdic_rxstart
	 or ibrx_lane_error or ibrx_stoponerr) 
begin

	ibrx_state_next[3:0] = 4'h0;

	case (1'b1)
	ibrx_state[`IBRX_STATE_IDLE]: begin
		if (fbdic_rxstart) begin
			ibrx_state_next[3:0] = {ibrx_idle_to_const, ibrx_idle_to_modn, 
						ibrx_idle_to_patt, ibrx_idle_to_idle};
		end
		else begin
			ibrx_state_next[`IBRX_STATE_IDLE] = 1'b1;
		end	
	end
	ibrx_state[`IBRX_STATE_CONST]: begin
		if (|ibrx_lane_error[13:0] & ibrx_stoponerr) begin
			ibrx_state_next[`IBRX_STATE_IDLE] = 1'b1;
		end 
		else if (ibrx_cnstgencnt[4:0] == 5'h1 & ibrx_lo_bits_sel) begin
			ibrx_state_next[3:0] = {ibrx_const_to_const, ibrx_const_to_modn, 
						ibrx_const_to_patt, ibrx_const_to_idle};
		end
		else begin
			ibrx_state_next[`IBRX_STATE_CONST] = 1'b1;
		end
	end
	ibrx_state[`IBRX_STATE_MODN]: begin
		if (|ibrx_lane_error[13:0] & ibrx_stoponerr) begin
			ibrx_state_next[`IBRX_STATE_IDLE] = 1'b1;
		end 
		else if (ibrx_modloopcnt[6:0] == 7'h1 & ibrx_lo_bits_sel) begin
			ibrx_state_next[3:0] = {ibrx_modn_to_const, ibrx_modn_to_modn, 
						ibrx_modn_to_patt, ibrx_modn_to_idle};
		end
		else begin
			ibrx_state_next[`IBRX_STATE_MODN] = 1'b1;
		end
	end
	ibrx_state[`IBRX_STATE_PATT]: begin
		if (|ibrx_lane_error[13:0] & ibrx_stoponerr) begin
			ibrx_state_next[`IBRX_STATE_IDLE] = 1'b1;
		end 
		else if (ibrx_pattloopcnt[6:0] == 7'h1 & ibrx_lo_bits_sel) begin
			ibrx_state_next[3:0] = {ibrx_patt_to_const, ibrx_patt_to_modn, 
						ibrx_patt_to_patt, ibrx_patt_to_idle};
		end
		else begin
			ibrx_state_next[`IBRX_STATE_PATT] = 1'b1;
		end
	end
	default: ;
	endcase
end

assign ibrx_done = ~ibrx_state[0] & ibrx_state_next[0];

assign ibrx_modn_data[11:0] =   {12{ibrx_modperiod[2:0] == 3'h1}} & 12'h555 |
				{12{ibrx_modperiod[2:0] == 3'h2}} & 12'h333 |
				{12{ibrx_modperiod[2:0] == 3'h3}} & 12'h1c7 |
				{12{ibrx_modperiod[2:0] == 3'h4}} & (ibrx_lo_bits_sel ? 12'hf0f : 12'h0f0) |
				{12{ibrx_modperiod[2:0] == 3'h6}} & (ibrx_lo_bits_sel ? 12'hfff : 12'h000);

assign ibrx_patt1_data[11:0] = ibrx_lo_bits_sel ? fbdic_nbfibpattbuf1[11:0] : fbdic_nbfibpattbuf1[23:12];

assign ibrx_data[11:0] = {12{ibrx_state[`IBRX_STATE_CONST]}} & {12{ibrx_cnstgenset}} |
			 {12{ibrx_state[`IBRX_STATE_PATT]}}  & ibrx_patt1_data[11:0] |
			 {12{ibrx_state[`IBRX_STATE_MODN]}}  & ibrx_modn_data[11:0];
assign ibrx_data_l[11:0] = ~ibrx_data[11:0];

assign ibrx_patt2_data[11:0] = ibrx_lo_bits_sel ? fbdic_nbfibpattbuf2[11:0] : fbdic_nbfibpattbuf2[23:12];

// Expected receive data
assign ibrx_rxdata[167:156] = {12{fbdic_nbfibrxmsk[13]}} & (fbdic_nbfibpatt2en[13] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[13] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[155:144] = {12{fbdic_nbfibrxmsk[12]}} & (fbdic_nbfibpatt2en[12] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[12] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[143:132] = {12{fbdic_nbfibrxmsk[11]}} & (fbdic_nbfibpatt2en[11] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[11] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[131:120] = {12{fbdic_nbfibrxmsk[10]}} & (fbdic_nbfibpatt2en[10] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[10] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[119:108] = {12{fbdic_nbfibrxmsk[9]}} & (fbdic_nbfibpatt2en[9] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[9] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[107:96] = {12{fbdic_nbfibrxmsk[8]}} & (fbdic_nbfibpatt2en[8] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[8] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[95:84] = {12{fbdic_nbfibrxmsk[7]}} & (fbdic_nbfibpatt2en[7] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[7] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[83:72] = {12{fbdic_nbfibrxmsk[6]}} & (fbdic_nbfibpatt2en[6] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[6] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[71:60] = {12{fbdic_nbfibrxmsk[5]}} & (fbdic_nbfibpatt2en[5] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[5] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[59:48] = {12{fbdic_nbfibrxmsk[4]}} & (fbdic_nbfibpatt2en[4] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[4] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[47:36] = {12{fbdic_nbfibrxmsk[3]}} & (fbdic_nbfibpatt2en[3] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[3] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[35:24] = {12{fbdic_nbfibrxmsk[2]}} & (fbdic_nbfibpatt2en[2] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[2] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[23:12] = {12{fbdic_nbfibrxmsk[1]}} & (fbdic_nbfibpatt2en[1] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[1] ? ibrx_data_l[11:0] : ibrx_data[11:0]);
assign ibrx_rxdata[11:0] = {12{fbdic_nbfibrxmsk[0]}} & (fbdic_nbfibpatt2en[0] ? ibrx_patt2_data[11:0] :
							ibrx_rxinvshft[0] ? ibrx_data_l[11:0] : ibrx_data[11:0]);

assign ibrx_ibist_mode_in = fbdic_rxstart ? 1'b1 : ibrx_done ? 1'b0 : ibrx_ibist_mode;

mcu_ibrx_ctl_msff_ctl_macro ff_ibist_mode (
	.scan_in(ff_ibist_mode_scanin),
	.scan_out(ff_ibist_mode_scanout),
	.din(ibrx_ibist_mode_in),
	.dout(ibrx_ibist_mode),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Compare expected receive data against actual receive data
assign ibrx_lane_error[13] = ibist_rxdata[167:156] != ibrx_rxdata[167:156] & ibrx_ibist_mode & fbdic_nbfibrxmsk[13];
assign ibrx_lane_error[12] = ibist_rxdata[155:144] != ibrx_rxdata[155:144] & ibrx_ibist_mode & fbdic_nbfibrxmsk[12];
assign ibrx_lane_error[11] = ibist_rxdata[143:132] != ibrx_rxdata[143:132] & ibrx_ibist_mode & fbdic_nbfibrxmsk[11];
assign ibrx_lane_error[10] = ibist_rxdata[131:120] != ibrx_rxdata[131:120] & ibrx_ibist_mode & fbdic_nbfibrxmsk[10];
assign ibrx_lane_error[9] = ibist_rxdata[119:108] != ibrx_rxdata[119:108] & ibrx_ibist_mode & fbdic_nbfibrxmsk[9];
assign ibrx_lane_error[8] = ibist_rxdata[107:96] != ibrx_rxdata[107:96] & ibrx_ibist_mode & fbdic_nbfibrxmsk[8];
assign ibrx_lane_error[7] = ibist_rxdata[95:84] != ibrx_rxdata[95:84] & ibrx_ibist_mode & fbdic_nbfibrxmsk[7];
assign ibrx_lane_error[6] = ibist_rxdata[83:72] != ibrx_rxdata[83:72] & ibrx_ibist_mode & fbdic_nbfibrxmsk[6];
assign ibrx_lane_error[5] = ibist_rxdata[71:60] != ibrx_rxdata[71:60] & ibrx_ibist_mode & fbdic_nbfibrxmsk[5];
assign ibrx_lane_error[4] = ibist_rxdata[59:48] != ibrx_rxdata[59:48] & ibrx_ibist_mode & fbdic_nbfibrxmsk[4];
assign ibrx_lane_error[3] = ibist_rxdata[47:36] != ibrx_rxdata[47:36] & ibrx_ibist_mode & fbdic_nbfibrxmsk[3];
assign ibrx_lane_error[2] = ibist_rxdata[35:24] != ibrx_rxdata[35:24] & ibrx_ibist_mode & fbdic_nbfibrxmsk[2];
assign ibrx_lane_error[1] = ibist_rxdata[23:12] != ibrx_rxdata[23:12] & ibrx_ibist_mode & fbdic_nbfibrxmsk[1];
assign ibrx_lane_error[0] = ibist_rxdata[11:0] != ibrx_rxdata[11:0] & ibrx_ibist_mode & fbdic_nbfibrxmsk[0];

assign ibrx_rxerrstat_in[13:0] = fbdic_ibrx_start_ld ? 14'h0 : ibrx_lane_error[13:0] | ibrx_rxerrstat[13:0];

mcu_ibrx_ctl_msff_ctl_macro__width_14 ff_rxerrstat  (
	.scan_in(ff_rxerrstat_scanin),
	.scan_out(ff_rxerrstat_scanout),
	.din(ibrx_rxerrstat_in[13:0]),
	.dout(ibrx_rxerrstat[13:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Total number of errors on channel
assign ibrx_errcnt_in[9:0] = fbdic_ibrx_start_ld ? 10'h0 :
			     ibrx_ibist_mode ? ibrx_errcnt[9:0] + {9'h0,ibrx_lane_error[0]}
								+ {9'h0,ibrx_lane_error[1]}
								+ {9'h0,ibrx_lane_error[2]}
								+ {9'h0,ibrx_lane_error[3]}
								+ {9'h0,ibrx_lane_error[4]}
								+ {9'h0,ibrx_lane_error[5]}
								+ {9'h0,ibrx_lane_error[6]}
								+ {9'h0,ibrx_lane_error[7]}
								+ {9'h0,ibrx_lane_error[8]}
								+ {9'h0,ibrx_lane_error[9]}
								+ {9'h0,ibrx_lane_error[10]}
								+ {9'h0,ibrx_lane_error[11]}
								+ {9'h0,ibrx_lane_error[12]}
								+ {9'h0,ibrx_lane_error[13]} : 
			     fbdic_nbfibportctl_en ? ibrx_errcnt[9:0] & ~fbdic_errcnt_clr[9:0] : ibrx_errcnt[9:0];

mcu_ibrx_ctl_msff_ctl_macro__width_10 ff_errcnt  (
	.scan_in(ff_errcnt_scanin),
	.scan_out(ff_errcnt_scanout),
	.din(ibrx_errcnt_in[9:0]),
	.dout(ibrx_errcnt[9:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// First lane to have an error
assign ibrx_first_err_lane[3:0] = ibrx_lane_error[13] ? 4'hd :
					ibrx_lane_error[12] ? 4'hc :
					ibrx_lane_error[11] ? 4'hb :
					ibrx_lane_error[10] ? 4'ha :
					ibrx_lane_error[9] ? 4'h9 :
					ibrx_lane_error[8] ? 4'h8 :
					ibrx_lane_error[7] ? 4'h7 :
					ibrx_lane_error[6] ? 4'h6 :
					ibrx_lane_error[5] ? 4'h5 :
					ibrx_lane_error[4] ? 4'h4 :
					ibrx_lane_error[3] ? 4'h3 :
					ibrx_lane_error[2] ? 4'h2 :
					ibrx_lane_error[1] ? 4'h1 : 4'h0;
					
assign ibrx_errlnnum_in[3:0] = fbdic_ibrx_start_ld ? 4'h0 :
			     	ibrx_ibist_mode & ibrx_rxerrstat[13:0] == 14'h0 ? ibrx_first_err_lane[3:0] : 
					ibrx_errlnnum[3:0];
mcu_ibrx_ctl_msff_ctl_macro__width_4 ff_errlnnum  (
	.scan_in(ff_errlnnum_scanin),
	.scan_out(ff_errlnnum_scanout),
	.din(ibrx_errlnnum_in[3:0]),
	.dout(ibrx_errlnnum[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Error state:
// 00: No error
// 01: Did not receive first start delimiter
// 10: Transmition error
// 11: reserved
assign ibrx_errstat_in[1:0] = fbdic_ibrx_start_ld ? 2'h1 :
				fbdic_rxstart ? 2'h0 : 
				|ibrx_lane_error[13:0] ? 2'h2 : 
				fbdic_nbfibportctl_en ? ibrx_errstat[1:0] & ~fbdic_errstat_clr[1:0] : ibrx_errstat[1:0];

mcu_ibrx_ctl_msff_ctl_macro__width_2 ff_errstat  (
	.scan_in(ff_errstat_scanin),
	.scan_out(ff_errstat_scanout),
	.din(ibrx_errstat_in[1:0]),
	.dout(ibrx_errstat[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fixscan start:
assign ff_ovrloopcnt_scanin      = scan_in                  ;
assign ff_cnstgencnt_scanin      = ff_ovrloopcnt_scanout    ;
assign ff_modloopcnt_scanin      = ff_cnstgencnt_scanout    ;
assign ff_pattloopcnt_scanin     = ff_modloopcnt_scanout    ;
assign ff_rxinvshft_scanin       = ff_pattloopcnt_scanout   ;
assign ff_hiword_sel_scanin      = ff_rxinvshft_scanout     ;
assign ff_state_scanin           = ff_hiword_sel_scanout    ;
assign ff_ibist_mode_scanin      = ff_state_scanout         ;
assign ff_rxerrstat_scanin       = ff_ibist_mode_scanout    ;
assign ff_errcnt_scanin          = ff_rxerrstat_scanout     ;
assign ff_errlnnum_scanin        = ff_errcnt_scanout        ;
assign ff_errstat_scanin         = ff_errlnnum_scanout      ;
assign scan_out                  = ff_errstat_scanout       ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_ibrx_ctl_msff_ctl_macro__width_6 (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_5 (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_7 (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_14 (
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

module mcu_ibrx_ctl_msff_ctl_macro (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_4 (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_10 (
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

module mcu_ibrx_ctl_msff_ctl_macro__width_2 (
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








