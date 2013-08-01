// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_algnbf_dp.v
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



module mcu_algnbf_dp (
  dout, 
  ts0_hdr_match, 
  status_parity, 
  idle_match, 
  alert_match, 
  alert_asserted, 
  nbde, 
  thermal_trip, 
  din, 
  inc_rptr, 
  inc_wptr, 
  clr_ptrs, 
  lfsr_bit, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  wmr_scan_in, 
  wmr_scan_out, 
  aclk_wmr);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire se;
wire sp_2_0;
wire [1:0] lfsr_bit_l;
wire rptr_sl5;
wire buf5_en;
wire rptr_sl5_inc;
wire buf5_en_inc;
wire clr_rd_ptr;
wire clr_wr_ptr;
wire [2:0] rptr;
wire unused1;
wire [2:0] rptr_in;
wire unused;
wire inv_clr_rd_ptr;
wire inv_clr_wr_ptr;
wire inv_clr_ptrs;
wire [2:0] clr_rptr_in;
wire [2:0] wptr;
wire unused3;
wire [2:0] mux_inc;
wire unused2;
wire [2:0] wptr_in;
wire [0:0] wptr_next;
wire [2:0] rptr_l;
wire rptr_sl0;
wire rptr_sl1;
wire rptr_sl2;
wire rptr_sl3;
wire rptr_sl4;
wire [11:0] buf0;
wire [11:0] buf1;
wire [11:0] buf2;
wire [11:0] buf3;
wire [11:0] buf4;
wire [11:0] buf5;
wire [2:0] wptr_l;
wire [11:0] clr_din;
wire buf0_en;
wire buf1_en;
wire buf2_en;
wire buf3_en;
wire buf4_en;
wire ff_buf0_scanin;
wire ff_buf0_scanout;
wire ff_buf1_scanin;
wire ff_buf1_scanout;
wire ff_buf2_scanin;
wire ff_buf2_scanout;
wire ff_buf3_scanin;
wire ff_buf3_scanout;
wire ff_buf4_scanin;
wire ff_buf4_scanout;
wire ff_buf5_scanin;
wire ff_buf5_scanout;
wire ff_rptr_wptr_wmr_scanin;
wire ff_rptr_wptr_wmr_scanout;


output [11:0]	dout;
output		ts0_hdr_match;
output		status_parity;
output		idle_match;
output		alert_match;
output		alert_asserted;
output		nbde;
output	[1:0]	thermal_trip;

input [11:0]	din;
input		inc_rptr;
input		inc_wptr;
input		clr_ptrs;
input [1:0]	lfsr_bit;

input 		drl2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

input		wmr_scan_in;
output		wmr_scan_out;
input		aclk_wmr;

assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

mcu_algnbf_dp_cmp_macro__width_12 m_ts0_hdr_match     (
	.din0( `FBD_TS0_HDR ),
	.din1( dout[11:0] ),
	.dout( ts0_hdr_match ));

mcu_algnbf_dp_xor_macro__ports_3 m_status_parity2_0     (
	.din0( dout[0] ),
	.din1( dout[1] ),
	.din2( dout[2] ),
	.dout( sp_2_0 ));

mcu_algnbf_dp_xor_macro__ports_3 m_status_parity4_0     (
	.din0( sp_2_0 ),
	.din1( dout[3] ),
	.din2( dout[4] ),
	.dout( status_parity ));

mcu_algnbf_dp_cmp_macro__width_12 m_idle_match     (
	.din0( dout[11:0] ),
	.din1( { {6{lfsr_bit[1]}}, {6{lfsr_bit[0]}} } ),
	.dout( idle_match ));

mcu_algnbf_dp_inv_macro__width_2 m_inv_lfsr_bit     (
	.din( lfsr_bit[1:0] ),
	.dout( lfsr_bit_l[1:0] ));

mcu_algnbf_dp_cmp_macro__width_12 m_alert_match     (
	.din0( dout[11:0] ),
	.din1( { {6{lfsr_bit_l[1]}}, {6{lfsr_bit_l[0]}} } ),
	.dout( alert_match ));

mcu_algnbf_dp_and_macro__width_1 m_alert_asserted     (
	.din0( dout[0] ),
	.din1( status_parity ),
	.dout( alert_asserted ));

mcu_algnbf_dp_and_macro__width_1 m_nbde     (
	.din0( dout[3] ),
	.din1( status_parity ),
	.dout( nbde ));

mcu_algnbf_dp_and_macro__width_2 m_thermal_trip     (
	.din0( dout[2:1] ),
	.din1( {2{status_parity}} ),
	.dout( thermal_trip[1:0] ));

// assign clr_rd_ptr = clr_ptrs | rptr_sl5 & inc_rptr;
// assign clr_wr_ptr = clr_ptrs | buf5_en & inc_wptr;

mcu_algnbf_dp_and_macro__width_2 m_inc0_ptrs  (
	.din0({ inc_rptr,     inc_wptr }),
	.din1({ rptr_sl5,     buf5_en }),
	.dout({ rptr_sl5_inc, buf5_en_inc }));

mcu_algnbf_dp_or_macro__width_2 m_clr_ptrs  (
	.din0({2{ clr_ptrs }}),
	.din1({ rptr_sl5_inc,   buf5_en_inc }),
	.dout({ clr_rd_ptr,     clr_wr_ptr }));

////csret 11/15/2004
//asign rptr_in[2:0] = rptr[2:0] + 3'h1;
mcu_algnbf_dp_increment_macro__width_4 m_rptr_inc     (
	.din ( {1'b0,rptr[2:0]} ), 
	.cin ( inc_rptr ), 
	.dout ( {unused1, rptr_in[2:0]} ), 
	.cout ( unused ) );

mcu_algnbf_dp_inv_macro__width_3 m_inv_clr_ptrs     ( 
	.din ( {clr_rd_ptr,     clr_wr_ptr,     clr_ptrs    } ), 
	.dout( {inv_clr_rd_ptr, inv_clr_wr_ptr, inv_clr_ptrs} ) );

mcu_algnbf_dp_and_macro__ports_2__width_3 m_and_rptr_clr_in         ( 
	.din0 ( {3{inv_clr_rd_ptr}} ),
	.din1 ( rptr_in[2:0] ),
	.dout ( clr_rptr_in[2:0] ) );

////csret 11/15/2004
//asign wptr_in[2:0] = clr_ptrs ? 3'h1 : inc_wptr ? wptr[2:0] + 3'h1 : wptr[2:0];
mcu_algnbf_dp_increment_macro__width_4   m_wptr_inc     ( 
	.din ( {1'b0, wptr[2:0]} ), 
	.cin ( inc_wptr ), 
	.dout ( {unused3, mux_inc[2:0]} ), 
	.cout ( unused2 ));
mcu_algnbf_dp_and_macro__ports_2__width_3       m_wptr_in         (
	.dout ( {wptr_in[2:1], wptr_next[0]} ), 
	.din0 ( {3{inv_clr_wr_ptr}} ), 
	.din1 ( mux_inc[2:0] ));
mcu_algnbf_dp_or_macro__ports_2__width_1        m_wptr_in_0         (
	.dout ( wptr_in[0] ), 
	.din0 ( clr_ptrs ),     
	.din1 ( wptr_next[0] ));

////csret 11/15/2004
//asign dout[11:0] = 
//	{12{rptr[2:0] == 0}} & buf0[11:0] |
//	{12{rptr[2:0] == 1}} & buf1[11:0] |
//	{12{rptr[2:0] == 2}} & buf2[11:0] |
//	{12{rptr[2:0] == 3}} & buf3[11:0] |
//	{12{rptr[2:0] == 4}} & buf4[11:0] |
//	{12{rptr[2:0] == 5}} & buf5[11:0] |
//	{12{rptr[2:0] == 6}} & buf6[11:0] |
//	{12{rptr[2:0] == 7}} & buf7[11:0];
mcu_algnbf_dp_inv_macro__width_3 m_inv_rptr  ( 
	.din ( rptr[2:0] ), 
	.dout ( rptr_l[2:0] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_0    ( 
	.dout ( rptr_sl0 ), 
	.din0 ( rptr[0] ), 
	.din1 ( rptr[1] ), 
	.din2 ( rptr[2] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_1    (     
	.dout ( rptr_sl1 ), 
	.din0 ( rptr_l[0] ),    
	.din1 ( rptr[1] ), 
	.din2 ( rptr[2] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_2    (     
	.dout ( rptr_sl2 ), 
	.din0 ( rptr[0] ), 
	.din1 ( rptr_l[1] ),    
	.din2 ( rptr[2] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_3    (     
	.dout ( rptr_sl3 ), 
	.din0 ( rptr_l[0] ),    
	.din1 ( rptr_l[1] ),    
	.din2 ( rptr[2] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_4    (     
	.dout ( rptr_sl4 ), 
	.din0 ( rptr[0] ), 
	.din1 ( rptr[1] ), 
	.din2 ( rptr_l[2] ));
mcu_algnbf_dp_nor_macro__ports_3 m_dec_rptr_5    (     
	.dout ( rptr_sl5 ), 
	.din0 ( rptr_l[0] ),    
	.din1 ( rptr[1] ), 
	.din2 ( rptr_l[2] ));
mcu_algnbf_dp_mux_macro__mux_aonpe__ports_6__stack_12r__width_12 m_mux_rptr             (
	.dout ( dout[11:0] ), 
	.din0 ( buf0[11:0] ),
	.din1 ( buf1[11:0] ), 
	.din2 ( buf2[11:0] ), 
	.din3 ( buf3[11:0] ), 
	.din4 ( buf4[11:0] ), 
	.din5 ( buf5[11:0] ), 
	.sel0 ( rptr_sl0 ), 
	.sel1 ( rptr_sl1 ), 
	.sel2 ( rptr_sl2 ), 
	.sel3 ( rptr_sl3 ), 
	.sel4 ( rptr_sl4 ), 
	.sel5 ( rptr_sl5 ));
////csret 11/15/2004
//asign buf0_en = wptr[2:0] == 3'h0;
mcu_algnbf_dp_inv_macro__width_3 m_inv_wptr  (
	.din(wptr[2:0]),
	.dout(wptr_l[2:0]));
mcu_algnbf_dp_and_macro__ports_2__width_12 m_and_clr_din        (  
	.din0 ( {12{inv_clr_ptrs}} ),
        .din1 ( din[11:0] ),
        .dout ( clr_din[11:0] ) );

mcu_algnbf_dp_nor_macro__ports_3 m_buf0_en     ( 
	.dout ( buf0_en ), 
	.din0 ( wptr[0] ), 
	.din1 ( wptr[1] ), 
	.din2 ( wptr[2] ) );
////csret 11/15/2004
//asign buf1_en = wptr[2:0] == 3'h1;
mcu_algnbf_dp_nor_macro__ports_3 m_buf1_en     ( 
	.dout ( buf1_en ), 
        .din0 ( wptr_l[0] ), 
        .din1 ( wptr[1] ), 
        .din2 ( wptr[2] ) 
        );

////csret 11/15/2004
//asign buf2_en = wptr[2:0] == 3'h2;
mcu_algnbf_dp_nor_macro__ports_3 m_buf2_en     ( 
	.dout ( buf2_en ), 
        .din0 ( wptr[0] ), 
        .din1 ( wptr_l[1] ), 
        .din2 ( wptr[2] ) 
        );

////csret 11/15/2004
//asign buf3_en = wptr[2:0] == 3'h3;
mcu_algnbf_dp_nor_macro__ports_3 m_buf3_en     (
	.dout ( buf3_en ), 
        .din0 ( wptr_l[0] ), 
        .din1 ( wptr_l[1] ), 
        .din2 ( wptr[2] ) );

////csret 11/15/2004
//asign buf4_en = wptr[2:0] == 3'h4;
mcu_algnbf_dp_nor_macro__ports_3 m_buf4_en     ( 
	.dout ( buf4_en ), 
        .din0 ( wptr[0] ), 
        .din1 ( wptr[1] ), 
        .din2 ( wptr_l[2] ) 
        );

////csret 11/15/2004
//asign buf5_en = wptr[2:0] == 3'h5;
mcu_algnbf_dp_nor_macro__ports_3 m_buf5_en     ( 
	.dout ( buf5_en ), 
	.din0 ( wptr_l[0] ), 
	.din1 ( wptr[1] ), 
	.din2 ( wptr_l[2] ) );

// flops for fifo entries
mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf0  (
	.scan_in(ff_buf0_scanin),
	.scan_out(ff_buf0_scanout),
	.din(clr_din[11:0]),
	.dout(buf0[11:0]),
	.en(buf0_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf1  (
	.scan_in(ff_buf1_scanin),
	.scan_out(ff_buf1_scanout),
	.din(clr_din[11:0]),
	.dout(buf1[11:0]),
	.en(buf1_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf2  (
	.scan_in(ff_buf2_scanin),
	.scan_out(ff_buf2_scanout),
	.din(clr_din[11:0]),
	.dout(buf2[11:0]),
	.en(buf2_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf3  (
	.scan_in(ff_buf3_scanin),
	.scan_out(ff_buf3_scanout),
	.din(clr_din[11:0]),
	.dout(buf3[11:0]),
	.en(buf3_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf4  (
	.scan_in(ff_buf4_scanin),
	.scan_out(ff_buf4_scanout),
	.din(clr_din[11:0]),
	.dout(buf4[11:0]),
	.en(buf4_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

mcu_algnbf_dp_msff_macro__stack_12r__width_12 ff_buf5  (
	.scan_in(ff_buf5_scanin),
	.scan_out(ff_buf5_scanout),
	.din(clr_din[11:0]),
	.dout(buf5[11:0]),
	.en(buf5_en),
	.clk(drl2clk),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// flops for read and write pointers
mcu_algnbf_dp_msff_macro__stack_12r__width_6 ff_rptr_wptr  ( // FS:wmr_protect
	.scan_in(ff_rptr_wptr_wmr_scanin),
	.scan_out(ff_rptr_wptr_wmr_scanout),
	.siclk(aclk_wmr),
	.din({clr_rptr_in[2:0],wptr_in[2:0]}),
	.dout({rptr[2:0],wptr[2:0]}),
	.en(1'b1),
	.clk(drl2clk),
  .se(se),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop));

// fixscan start:
assign ff_buf0_scanin            = scan_in                  ;
assign ff_buf1_scanin            = ff_buf0_scanout          ;
assign ff_buf2_scanin            = ff_buf1_scanout          ;
assign ff_buf3_scanin            = ff_buf2_scanout          ;
assign ff_buf4_scanin            = ff_buf3_scanout          ;
assign ff_buf5_scanin            = ff_buf4_scanout          ;
assign scan_out                  = ff_buf5_scanout          ;

assign ff_rptr_wptr_wmr_scanin   = wmr_scan_in              ;
assign wmr_scan_out              = ff_rptr_wptr_wmr_scanout ;
// fixscan end:
endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_algnbf_dp_cmp_macro__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output dout;






cmp #(12)  m0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout)
);










endmodule





//
//   xor macro for ports = 2,3
//
//





module mcu_algnbf_dp_xor_macro__ports_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;





xor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);








endmodule





//
//   invert macro
//
//





module mcu_algnbf_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_algnbf_dp_and_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_algnbf_dp_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_algnbf_dp_or_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






or2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   increment macro 
//
//





module mcu_algnbf_dp_increment_macro__width_4 (
  din, 
  cin, 
  dout, 
  cout);
  input [3:0] din;
  input cin;
  output [3:0] dout;
  output cout;






incr #(4)  m0_0 (
.cin(cin),
.in(din[3:0]),
.out(dout[3:0]),
.cout(cout)
);











endmodule





//
//   invert macro
//
//





module mcu_algnbf_dp_inv_macro__width_3 (
  din, 
  dout);
  input [2:0] din;
  output [2:0] dout;






inv #(3)  d0_0 (
.in(din[2:0]),
.out(dout[2:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_algnbf_dp_and_macro__ports_2__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






and2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_algnbf_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_algnbf_dp_nor_macro__ports_3 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_algnbf_dp_mux_macro__mux_aonpe__ports_6__stack_12r__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  input [11:0] din3;
  input sel3;
  input [11:0] din4;
  input sel4;
  input [11:0] din5;
  input sel5;
  output [11:0] dout;





cl_dp1_muxbuff6_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5)
);
mux6s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
  .in4(din4[11:0]),
  .in5(din5[11:0]),
.dout(dout[11:0])
);









  



endmodule


//  
//   and macro for ports = 2,3,4
//
//





module mcu_algnbf_dp_and_macro__ports_2__width_12 (
  din0, 
  din1, 
  dout);
  input [11:0] din0;
  input [11:0] din1;
  output [11:0] dout;






and2 #(12)  d0_0 (
.in0(din0[11:0]),
.in1(din1[11:0]),
.out(dout[11:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mcu_algnbf_dp_msff_macro__stack_12r__width_12 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_algnbf_dp_msff_macro__stack_12r__width_6 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [4:0] so;

  input [5:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [5:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);




















endmodule








