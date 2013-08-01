// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fbdird_dp.v
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



module mcu_fbdird_dp (
  fbdird0_data, 
  fbdird1_data, 
  fbdird_ibrx_data, 
  fbdird_crc_cmp0_0, 
  fbdird_crc_cmp0_1, 
  fbdird_crc_cmp1_0, 
  fbdird_crc_cmp1_1, 
  bd00, 
  bd01, 
  bd10, 
  bd11, 
  fbdic0_failover, 
  fbdic0_failover_l, 
  fbdic1_failover, 
  fbdic1_failover_l, 
  fbdic_rddata_vld, 
  fbdic_rddata_vld_l, 
  fbdic_ibrx_data_sel, 
  fbdic_ibrx_data_sel_l, 
  fbd0_data, 
  fbd1_data, 
  fbdic_idle_lfsr_reset, 
  fbdic_train_state, 
  fbdic_disable_state, 
  lndskw0_data, 
  lndskw1_data, 
  crcnd_crc0_0, 
  crcnd_crc0_1, 
  crcnd_crc1_0, 
  crcnd_crc1_1, 
  crcndf_crc0_0, 
  crcndf_crc0_1, 
  crcndf_crc1_0, 
  crcndf_crc1_1, 
  drif_single_channel_mode, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_dectest, 
  tcu_muxtest, 
  tcu_scan_en);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire test;
wire muxtst;
wire se;
wire [11:0] fbdird_crc0_0;
wire [11:0] fbdird_crcf0_0;
wire [71:0] fbdird_data0_0;
wire [11:0] crc_cmp0_0_actual;
wire [11:0] crc_cmp0_0_expected;
wire [11:0] fbdird_crc0_1;
wire [11:0] fbdird_crcf0_1;
wire [71:0] fbdird_data0_1;
wire [11:0] crc_cmp0_1_actual;
wire [11:0] crc_cmp0_1_expected;
wire [11:0] fbdird_crc1_0;
wire [11:0] fbdird_crcf1_0;
wire [71:0] fbdird_data1_0;
wire [11:0] crc_cmp1_0_actual;
wire [11:0] crc_cmp1_0_expected;
wire [11:0] fbdird_crc1_1;
wire [11:0] fbdird_crcf1_1;
wire [71:0] fbdird_data1_1;
wire [11:0] crc_cmp1_1_actual;
wire [11:0] crc_cmp1_1_expected;


output [143:0]	fbdird0_data;
output [143:0]	fbdird1_data;

output [167:40]	fbdird_ibrx_data;

output		fbdird_crc_cmp0_0;
output		fbdird_crc_cmp0_1;
output		fbdird_crc_cmp1_0;
output		fbdird_crc_cmp1_1;

output	[71:0]	bd00;
output	[71:0]	bd01;
output	[71:0]	bd10;
output	[71:0]	bd11;

input		fbdic0_failover;
input		fbdic0_failover_l;
input		fbdic1_failover;
input		fbdic1_failover_l;

input		fbdic_rddata_vld;
input		fbdic_rddata_vld_l;

input		fbdic_ibrx_data_sel;
input		fbdic_ibrx_data_sel_l;

input [167:0]	fbd0_data;
input [167:0]	fbd1_data;

input		fbdic_idle_lfsr_reset;

input		fbdic_train_state;
input		fbdic_disable_state;

input	[167:0]	lndskw0_data;
input	[167:0]	lndskw1_data;

input	[11:0]	crcnd_crc0_0;
input	[11:0]	crcnd_crc0_1;
input	[11:0]	crcnd_crc1_0;
input	[11:0]	crcnd_crc1_1;

input	[5:0]	crcndf_crc0_0;
input	[5:0]	crcndf_crc0_1;
input	[5:0]	crcndf_crc1_0;
input	[5:0]	crcndf_crc1_1;

input		drif_single_channel_mode;

input		drl2clk;
input		scan_in;
output			scan_out;
input		tcu_pce_ov;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_dectest;
input		tcu_muxtest;
input		tcu_scan_en;

assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign test = tcu_dectest;
assign muxtst = tcu_muxtest;
assign se = tcu_scan_en;

assign scan_out = scan_in;

// Channel 0 northbound data

// Channel 0, Burst 0
assign fbdird_crc0_0[11:0]  = {lndskw0_data[144],lndskw0_data[145],lndskw0_data[146],lndskw0_data[147],lndskw0_data[148],
				lndskw0_data[149],lndskw0_data[161:156]};
assign fbdird_crcf0_0[11:0]  = {6'h0,lndskw0_data[149:144]};
assign fbdird_data0_0[71:0] = {lndskw0_data[137:132], lndskw0_data[125:120], lndskw0_data[113:108], lndskw0_data[101:96],  
			       lndskw0_data[89:84],   lndskw0_data[77:72],   lndskw0_data[65:60],   lndskw0_data[53:48],   
			       lndskw0_data[41:36],   lndskw0_data[29:24],   lndskw0_data[17:12],   lndskw0_data[5:0]};
////csret 11/15/2004
//assign crc_cmp0_0 = crc_cmp0_0_actual[11:0] == crc_cmp0_0_expected[11:0];
mcu_fbdird_dp_cmp_macro__width_12 u_cmp_crc_cmp0     (  
	.din0 ( crc_cmp0_0_actual[11:0] ),  
	.din1 ( crc_cmp0_0_expected[11:0] ), 
	.dout ( fbdird_crc_cmp0_0 ));

////csret 11/15/2004
//assign crc_cmp0_0_actual[11:0] = fbdic_failover ? {6'h0,fbdird_crc0_0[5:0]} : fbdird_crc0_0[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_act0           (  
	.dout  ( crc_cmp0_0_actual[11:0] ),  
	.din0 ( fbdird_crc0_0[11:0] ),  
	.din1 ( fbdird_crcf0_0[11:0] ),  
	.sel0 ( fbdic0_failover_l ),  
	.sel1 ( fbdic0_failover ) );

////csret 11/15/2004
//assign crc_cmp0_0_expected[11:0] = fbdic_failover ? {6'h0,crcndf_crc0_0[5:0]} : crcnd_crc0_0[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_exp0           (  
	.dout  ( crc_cmp0_0_expected[11:0] ),  
	.din0 ( crcnd_crc0_0[11:0] ),  
	.din1 ( {6'h0,crcndf_crc0_0[5:0]} ),  
	.sel0 ( fbdic0_failover_l ),  
	.sel1 ( fbdic0_failover ) );

assign bd00[71:0] = {
	fbdird_data0_0[5],  fbdird_data0_0[11], fbdird_data0_0[17], fbdird_data0_0[23], fbdird_data0_0[29], fbdird_data0_0[35], 
	fbdird_data0_0[41], fbdird_data0_0[47], fbdird_data0_0[53], fbdird_data0_0[59], fbdird_data0_0[65], fbdird_data0_0[71], 
	fbdird_data0_0[70], fbdird_data0_0[64], fbdird_data0_0[58], fbdird_data0_0[52], fbdird_data0_0[46], fbdird_data0_0[40], 
	fbdird_data0_0[34], fbdird_data0_0[28], fbdird_data0_0[22], fbdird_data0_0[16], fbdird_data0_0[10], fbdird_data0_0[4], 
	fbdird_data0_0[3],  fbdird_data0_0[9],  fbdird_data0_0[15], fbdird_data0_0[21], fbdird_data0_0[27], fbdird_data0_0[33], 
	fbdird_data0_0[39], fbdird_data0_0[45], fbdird_data0_0[51], fbdird_data0_0[57], fbdird_data0_0[63], fbdird_data0_0[69], 
	fbdird_data0_0[68], fbdird_data0_0[62], fbdird_data0_0[56], fbdird_data0_0[50], fbdird_data0_0[44], fbdird_data0_0[38], 
	fbdird_data0_0[32], fbdird_data0_0[26], fbdird_data0_0[20], fbdird_data0_0[14], fbdird_data0_0[8],  fbdird_data0_0[2], 
	fbdird_data0_0[1],  fbdird_data0_0[7],  fbdird_data0_0[13], fbdird_data0_0[19], fbdird_data0_0[25], fbdird_data0_0[31], 
	fbdird_data0_0[37], fbdird_data0_0[43], fbdird_data0_0[49], fbdird_data0_0[55], fbdird_data0_0[61], fbdird_data0_0[67], 
	fbdird_data0_0[66], fbdird_data0_0[60], fbdird_data0_0[54], fbdird_data0_0[48], fbdird_data0_0[42], fbdird_data0_0[36], 
	fbdird_data0_0[30], fbdird_data0_0[24], fbdird_data0_0[18], fbdird_data0_0[12], fbdird_data0_0[6],  fbdird_data0_0[0]};

// Channel 0, Burst 1
assign fbdird_crc0_1[11:0]  = {lndskw0_data[150],lndskw0_data[151],lndskw0_data[152],lndskw0_data[153],lndskw0_data[154],
				lndskw0_data[155],lndskw0_data[167:162]};
assign fbdird_crcf0_1[11:0]  = {6'h0,lndskw0_data[155:150]};
assign fbdird_data0_1[71:0] = {lndskw0_data[143:138], lndskw0_data[131:126], lndskw0_data[119:114], lndskw0_data[107:102], 
			       lndskw0_data[95:90],   lndskw0_data[83:78],   lndskw0_data[71:66],   lndskw0_data[59:54],   
			       lndskw0_data[47:42],   lndskw0_data[35:30],   lndskw0_data[23:18],   lndskw0_data[11:6]};

////csret 11/15/2004
//assign crc_cmp0_1 = crc_cmp0_1_actual[11:0] == crc_cmp0_1_expected[11:0];
mcu_fbdird_dp_cmp_macro__width_12 u_cmp_crc_cmp1     (  
	.din0 ( crc_cmp0_1_actual[11:0] ),  
	.din1 ( crc_cmp0_1_expected[11:0] ),  
	.dout ( fbdird_crc_cmp0_1 ));

////csret 11/15/2004
//assign crc_cmp0_1_actual[11:0] = fbdic_failover ? {6'h0,fbdird_crc0_1[5:0]} : fbdird_crc0_1[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_act1           (  
	.dout  ( crc_cmp0_1_actual[11:0] ),  
	.din0 ( fbdird_crc0_1[11:0] ),  
	.din1 ( fbdird_crcf0_1[11:0] ),  
	.sel0 ( fbdic0_failover_l ),  
	.sel1 ( fbdic0_failover ) );

////csret 11/15/2004
//assign crc_cmp0_1_expected[11:0] = fbdic_failover ? {6'h0,crcndf_crc0_1[5:0]} : crcnd_crc0_1[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_exp1           (  
	.dout  ( crc_cmp0_1_expected[11:0] ),  
	.din0 ( crcnd_crc0_1[11:0] ),  
	.din1 ( {6'h0,crcndf_crc0_1[5:0]} ),  
	.sel0 ( fbdic0_failover_l ),  
	.sel1 ( fbdic0_failover ) );

assign bd01[71:0] = {
	fbdird_data0_1[5],  fbdird_data0_1[11], fbdird_data0_1[17], fbdird_data0_1[23], fbdird_data0_1[29], fbdird_data0_1[35], 
	fbdird_data0_1[41], fbdird_data0_1[47], fbdird_data0_1[53], fbdird_data0_1[59], fbdird_data0_1[65], fbdird_data0_1[71], 
	fbdird_data0_1[70], fbdird_data0_1[64], fbdird_data0_1[58], fbdird_data0_1[52], fbdird_data0_1[46], fbdird_data0_1[40], 
	fbdird_data0_1[34], fbdird_data0_1[28], fbdird_data0_1[22], fbdird_data0_1[16], fbdird_data0_1[10], fbdird_data0_1[4], 
	fbdird_data0_1[3],  fbdird_data0_1[9],  fbdird_data0_1[15], fbdird_data0_1[21], fbdird_data0_1[27], fbdird_data0_1[33], 
	fbdird_data0_1[39], fbdird_data0_1[45], fbdird_data0_1[51], fbdird_data0_1[57], fbdird_data0_1[63], fbdird_data0_1[69], 
	fbdird_data0_1[68], fbdird_data0_1[62], fbdird_data0_1[56], fbdird_data0_1[50], fbdird_data0_1[44], fbdird_data0_1[38], 
	fbdird_data0_1[32], fbdird_data0_1[26], fbdird_data0_1[20], fbdird_data0_1[14], fbdird_data0_1[8],  fbdird_data0_1[2], 
	fbdird_data0_1[1],  fbdird_data0_1[7],  fbdird_data0_1[13], fbdird_data0_1[19], fbdird_data0_1[25], fbdird_data0_1[31], 
	fbdird_data0_1[37], fbdird_data0_1[43], fbdird_data0_1[49], fbdird_data0_1[55], fbdird_data0_1[61], fbdird_data0_1[67], 
	fbdird_data0_1[66], fbdird_data0_1[60], fbdird_data0_1[54], fbdird_data0_1[48], fbdird_data0_1[42], fbdird_data0_1[36], 
	fbdird_data0_1[30], fbdird_data0_1[24], fbdird_data0_1[18], fbdird_data0_1[12], fbdird_data0_1[6],  fbdird_data0_1[0]};

// Channel 1 northbound data

// Channel 1, Burst 0
assign fbdird_crc1_0[11:0]  = {lndskw1_data[144],lndskw1_data[145],lndskw1_data[146],lndskw1_data[147],lndskw1_data[148],
				lndskw1_data[149],lndskw1_data[161:156]};
assign fbdird_crcf1_0[11:0]  = {6'h0,lndskw1_data[149:144]};
assign fbdird_data1_0[71:0] = {lndskw1_data[137:132], lndskw1_data[125:120], lndskw1_data[113:108], lndskw1_data[101:96],  
			       lndskw1_data[89:84],   lndskw1_data[77:72],   lndskw1_data[65:60],   lndskw1_data[53:48],   
			       lndskw1_data[41:36],   lndskw1_data[29:24],   lndskw1_data[17:12],   lndskw1_data[5:0]};

////csret 11/15/2004
//assign crc_cmp1_0 = crc_cmp1_0_actual[11:0] == crc_cmp1_0_expected[11:0];
mcu_fbdird_dp_cmp_macro__width_12 u_cmp_crc_cmp10     (  
	.din0 ( crc_cmp1_0_actual[11:0] ),  
	.din1 ( crc_cmp1_0_expected[11:0] ),  
	.dout ( fbdird_crc_cmp1_0 ));

////csret 11/15/2004
//assign crc_cmp1_0_actual[11:0] = fbdic_failover ? {6'h0,fbdird_crc1_0[5:0]} : fbdird_crc1_0[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_act10           (  
	.dout  ( crc_cmp1_0_actual[11:0] ),  
	.din0 ( fbdird_crc1_0[11:0] ),  
	.din1 ( fbdird_crcf1_0[11:0] ),  
	.sel0 ( fbdic1_failover_l ),  
	.sel1 ( fbdic1_failover ) );

////csret 11/15/2004
//assign crc_cmp1_0_expected[11:0] = fbdic_failover ? {6'h0,crcndf_crc1_0[5:0]} : crcnd_crc1_0[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_exp10           (  
	.dout  ( crc_cmp1_0_expected[11:0] ),  
	.din0 ( crcnd_crc1_0[11:0] ),  
	.din1 ( {6'h0,crcndf_crc1_0[5:0]} ),  
	.sel0 ( fbdic1_failover_l ),  
	.sel1 ( fbdic1_failover ) );

assign bd10[71:0] = {
	fbdird_data1_0[5],  fbdird_data1_0[11], fbdird_data1_0[17], fbdird_data1_0[23], fbdird_data1_0[29], fbdird_data1_0[35], 
	fbdird_data1_0[41], fbdird_data1_0[47], fbdird_data1_0[53], fbdird_data1_0[59], fbdird_data1_0[65], fbdird_data1_0[71], 
	fbdird_data1_0[70], fbdird_data1_0[64], fbdird_data1_0[58], fbdird_data1_0[52], fbdird_data1_0[46], fbdird_data1_0[40], 
	fbdird_data1_0[34], fbdird_data1_0[28], fbdird_data1_0[22], fbdird_data1_0[16], fbdird_data1_0[10], fbdird_data1_0[4], 
	fbdird_data1_0[3],  fbdird_data1_0[9],  fbdird_data1_0[15], fbdird_data1_0[21], fbdird_data1_0[27], fbdird_data1_0[33], 
	fbdird_data1_0[39], fbdird_data1_0[45], fbdird_data1_0[51], fbdird_data1_0[57], fbdird_data1_0[63], fbdird_data1_0[69], 
	fbdird_data1_0[68], fbdird_data1_0[62], fbdird_data1_0[56], fbdird_data1_0[50], fbdird_data1_0[44], fbdird_data1_0[38], 
	fbdird_data1_0[32], fbdird_data1_0[26], fbdird_data1_0[20], fbdird_data1_0[14], fbdird_data1_0[8],  fbdird_data1_0[2], 
	fbdird_data1_0[1],  fbdird_data1_0[7],  fbdird_data1_0[13], fbdird_data1_0[19], fbdird_data1_0[25], fbdird_data1_0[31], 
	fbdird_data1_0[37], fbdird_data1_0[43], fbdird_data1_0[49], fbdird_data1_0[55], fbdird_data1_0[61], fbdird_data1_0[67], 
	fbdird_data1_0[66], fbdird_data1_0[60], fbdird_data1_0[54], fbdird_data1_0[48], fbdird_data1_0[42], fbdird_data1_0[36], 
	fbdird_data1_0[30], fbdird_data1_0[24], fbdird_data1_0[18], fbdird_data1_0[12], fbdird_data1_0[6],  fbdird_data1_0[0]};

// Channel 1, Burst 1

assign fbdird_crc1_1[11:0]  = {lndskw1_data[150],lndskw1_data[151],lndskw1_data[152],lndskw1_data[153],lndskw1_data[154],
				lndskw1_data[155],lndskw1_data[167:162]};
assign fbdird_crcf1_1[11:0]  = {6'h0,lndskw1_data[155:150]};
assign fbdird_data1_1[71:0] = {lndskw1_data[143:138], lndskw1_data[131:126], lndskw1_data[119:114], lndskw1_data[107:102], 
			       lndskw1_data[95:90],   lndskw1_data[83:78],   lndskw1_data[71:66],   lndskw1_data[59:54],   
			       lndskw1_data[47:42],   lndskw1_data[35:30],   lndskw1_data[23:18],   lndskw1_data[11:6]};

////csret 11/15/2004
//assign crc_cmp1_1 = crc_cmp1_1_actual[11:0] == crc_cmp1_1_expected[11:0];
mcu_fbdird_dp_cmp_macro__width_12 u_cmp_crc_cmp11     (  
	.din0 ( crc_cmp1_1_actual[11:0] ),  
	.din1 ( crc_cmp1_1_expected[11:0] ),  
	.dout ( fbdird_crc_cmp1_1 ));

////csret 11/15/2004
//assign crc_cmp1_1_actual[11:0] = fbdic_failover ? {6'h0,fbdird_crc1_1[5:0]} : fbdird_crc1_1[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_act11           (  
	.dout ( crc_cmp1_1_actual[11:0] ),  
	.din0 ( fbdird_crc1_1[11:0] ),  
	.din1 ( fbdird_crcf1_1[11:0] ),  
	.sel0 ( fbdic1_failover_l ),  
	.sel1 ( fbdic1_failover ) );

////csret 11/15/2004
//assign crc_cmp1_1_expected[11:0] = fbdic_failover ? {6'h0,crcndf_crc1_1[5:0]} : crcnd_crc1_1[11:0];
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 u_mux_crc_cmp_exp11           (  
	.dout  ( crc_cmp1_1_expected[11:0] ),  
	.din0 ( crcnd_crc1_1[11:0] ),  
	.din1 ( {6'h0,crcndf_crc1_1[5:0]} ),  
	.sel0 ( fbdic1_failover_l ),  
	.sel1 ( fbdic1_failover ) );

assign bd11[71:0] = {
	fbdird_data1_1[5],  fbdird_data1_1[11], fbdird_data1_1[17], fbdird_data1_1[23], fbdird_data1_1[29], fbdird_data1_1[35], 
	fbdird_data1_1[41], fbdird_data1_1[47], fbdird_data1_1[53], fbdird_data1_1[59], fbdird_data1_1[65], fbdird_data1_1[71], 
	fbdird_data1_1[70], fbdird_data1_1[64], fbdird_data1_1[58], fbdird_data1_1[52], fbdird_data1_1[46], fbdird_data1_1[40], 
	fbdird_data1_1[34], fbdird_data1_1[28], fbdird_data1_1[22], fbdird_data1_1[16], fbdird_data1_1[10], fbdird_data1_1[4], 
	fbdird_data1_1[3],  fbdird_data1_1[9],  fbdird_data1_1[15], fbdird_data1_1[21], fbdird_data1_1[27], fbdird_data1_1[33], 
	fbdird_data1_1[39], fbdird_data1_1[45], fbdird_data1_1[51], fbdird_data1_1[57], fbdird_data1_1[63], fbdird_data1_1[69], 
	fbdird_data1_1[68], fbdird_data1_1[62], fbdird_data1_1[56], fbdird_data1_1[50], fbdird_data1_1[44], fbdird_data1_1[38], 
	fbdird_data1_1[32], fbdird_data1_1[26], fbdird_data1_1[20], fbdird_data1_1[14], fbdird_data1_1[8],  fbdird_data1_1[2], 
	fbdird_data1_1[1],  fbdird_data1_1[7],  fbdird_data1_1[13], fbdird_data1_1[19], fbdird_data1_1[25], fbdird_data1_1[31], 
	fbdird_data1_1[37], fbdird_data1_1[43], fbdird_data1_1[49], fbdird_data1_1[55], fbdird_data1_1[61], fbdird_data1_1[67], 
	fbdird_data1_1[66], fbdird_data1_1[60], fbdird_data1_1[54], fbdird_data1_1[48], fbdird_data1_1[42], fbdird_data1_1[36], 
	fbdird_data1_1[30], fbdird_data1_1[24], fbdird_data1_1[18], fbdird_data1_1[12], fbdird_data1_1[6],  fbdird_data1_1[0]};

// data to readdp blocks
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_16 u_mux_fbdird0_data_143_128    (
	.din0({16{1'b0}}),
	.din1(fbdird_data0_0[71:56]),
	.din2(fbdird_data0_0[71:56]),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird0_data[143:128]),
  .muxtst(muxtst),
  .test(test));
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_64 u_mux_fbdird0_data_127_64  (
	.din0({64{1'b0}}),
	.din1({fbdird_data0_0[55:0],fbdird_data0_1[71:64]}),
	.din2({fbdird_data0_0[55:0],fbdird_data1_0[71:64]}),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird0_data[127:64]),
  .muxtst(muxtst),
  .test(test));
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_64 u_mux_fbdird0_data_63_0  (
	.din0({64{1'b0}}),
	.din1(fbdird_data0_1[63:0]),
	.din2(fbdird_data1_0[63:0]),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird0_data[63:0]),
  .muxtst(muxtst),
  .test(test));

// if in single channel mode, send data0 bits to readdp1 also
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_16 u_mux_fbdird1_data_143_128    (
	.din0({16{1'b0}}),
	.din1(fbdird_data0_0[71:56]),
	.din2(fbdird_data0_1[71:56]),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird1_data[143:128]),
  .muxtst(muxtst),
  .test(test));
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_64 u_mux_fbdird1_data_127_64  (
	.din0({64{1'b0}}),
	.din1({fbdird_data0_0[55:0],fbdird_data0_1[71:64]}),
	.din2({fbdird_data0_1[55:0],fbdird_data1_1[71:64]}),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird1_data[127:64]),
  .muxtst(muxtst),
  .test(test));
mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_64 u_mux_fbdird1_data_63_0  (
	.din0({64{1'b0}}),
	.din1(fbdird_data0_1[63:0]),
	.din2(fbdird_data1_1[63:0]),
	.sel0(fbdic_rddata_vld_l),
	.sel1(drif_single_channel_mode),
	.dout(fbdird1_data[63:0]),
  .muxtst(muxtst),
  .test(test));

// Mux for IBIST data
mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_64 u_mux_ibist_167_104  (
	.din0(lndskw0_data[167:104]),
	.din1(lndskw1_data[167:104]),
	.sel0(fbdic_ibrx_data_sel_l),
	.sel1(fbdic_ibrx_data_sel),
	.dout(fbdird_ibrx_data[167:104]));

mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_64 u_mux_ibist_103_40  (
	.din0(lndskw0_data[103:40]),
	.din1(lndskw1_data[103:40]),
	.sel0(fbdic_ibrx_data_sel_l),
	.sel1(fbdic_ibrx_data_sel),
	.dout(fbdird_ibrx_data[103:40]));

endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module mcu_fbdird_dp_cmp_macro__width_12 (
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





// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  output [11:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(12)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
.dout(dout[11:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_16 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [15:0] din0;
  input [15:0] din1;
  input [15:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [15:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(16)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[15:0]),
  .in1(din1[15:0]),
  .in2(din2[15:0]),
.dout(dout[15:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdird_dp_mux_macro__mux_pgpe__ports_3__width_64 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
  muxtst, 
  test, 
  dout);
wire psel0;
wire psel1;
wire psel2;

  input [63:0] din0;
  input [63:0] din1;
  input [63:0] din2;
  input sel0;
  input sel1;
  input muxtst;
  input test;
  output [63:0] dout;





cl_dp1_penc3_8x  c0_0 (
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2),
  .test(test)
);

mux3 #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
  .in2(din2[63:0]),
.dout(dout[63:0]),
  .muxtst(muxtst)
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbdird_dp_mux_macro__mux_aonpe__ports_2__width_64 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [63:0] din0;
  input sel0;
  input [63:0] din1;
  input sel1;
  output [63:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(64)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule

