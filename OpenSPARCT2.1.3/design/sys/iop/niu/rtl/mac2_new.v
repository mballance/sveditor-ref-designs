// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mac2_new.v
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
// ##########################################################
// # File Name    : mac2.v
// # Author Name  : John Lo
// # Description  : It contains mac_2ports and phy_clock_2ports.
// #                It is for N2.
// #
// # Parent Module: 
// # Child  Module: 
// # Interface Mod: 
// # Date Created : 7/26/04
// # 
// # Copyright (c) 2020, Sun Microsystems, Inc. 
// # Sun Proprietary and Confidential   
// ##########################################################


module mac2 
  (/*AUTOARG*/
   // Outputs
   xaui_link_led_1, xaui_link_led_0, xaui_act_led_1, xaui_act_led_0, 
   mif_pio_intr, mdoe, mdo, mac_txc_req1, mac_txc_req0, mac_rxc_tag1, 
   mac_rxc_tag0, mac_rxc_stat1, mac_rxc_stat0, mac_rxc_data1, 
   mac_rxc_data0, mac_rxc_ctrl1, mac_rxc_ctrl0, mac_rxc_ack1, 
   mac_rxc_ack0, mac_pio_rdata, mac_pio_intr1, mac_pio_intr0, 
   mac_pio_err, mac_pio_ack, mac_esr_txd3_1, mac_esr_txd3_0, 
   mac_esr_txd2_1, mac_esr_txd2_0, mac_esr_txd1_1, mac_esr_txd1_0, 
   mac_esr_txd0_1, mac_esr_txd0_0, mac_esr_tclk_1, mac_esr_tclk_0, 
   mac_debug_port, mdc, 
   // Inputs
   txc_mac_tag1, txc_mac_tag0, txc_mac_stat1, txc_mac_stat0, 
   txc_mac_data1, txc_mac_data0, txc_mac_ack1, txc_mac_ack0, 
   txc_mac_abort1, txc_mac_abort0, tcu_scan_mode, rxc_mac_req1, 
   rxc_mac_req0, pio_mac_sel, pio_clients_wdata, pio_clients_rd, 
   pio_clients_addr, niu_reset_l, niu_clk, mdi_1, mdi_0, mdi, 
   mac_reset1, mac_reset0, mac_312tx_test_clk, mac_312rx_test_clk, 
   mac_156tx_test_clk, mac_156rx_test_clk, mac_125tx_test_clk, 
   mac_125rx_test_clk, esr_mac_tclk_1, esr_mac_tclk_0, 
   esr_mac_sync_1, esr_mac_sync_0, esr_mac_rxd3_1, esr_mac_rxd3_0, 
   esr_mac_rxd2_1, esr_mac_rxd2_0, esr_mac_rxd1_1, esr_mac_rxd1_0, 
   esr_mac_rxd0_1, esr_mac_rxd0_0, esr_mac_rclk_1, esr_mac_rclk_0, 
   esr_mac_oddcg0_1, esr_mac_oddcg0_0, esr_mac_los_1, esr_mac_los_0
   );
   
// manual IO declaration -loj
   output 		mdc;

/*AUTOINPUT*/
// Beginning of automatic inputs (from unused autoinst inputs)
input [3:0]		esr_mac_los_0;		// To mac_2ports of mac_2ports.v
input [3:0]		esr_mac_los_1;		// To mac_2ports of mac_2ports.v
input			esr_mac_oddcg0_0;	// To mac_2ports of mac_2ports.v
input			esr_mac_oddcg0_1;	// To mac_2ports of mac_2ports.v
input [3:0]		esr_mac_rclk_0;		// To mac_2ports of mac_2ports.v, ...
input [3:0]		esr_mac_rclk_1;		// To mac_2ports of mac_2ports.v, ...
input [9:0]		esr_mac_rxd0_0;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd0_1;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd1_0;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd1_1;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd2_0;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd2_1;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd3_0;		// To mac_2ports of mac_2ports.v
input [9:0]		esr_mac_rxd3_1;		// To mac_2ports of mac_2ports.v
input [3:0]		esr_mac_sync_0;		// To mac_2ports of mac_2ports.v
input [3:0]		esr_mac_sync_1;		// To mac_2ports of mac_2ports.v
input [3:0]		esr_mac_tclk_0;		// To phy_clock_2ports of phy_clock_2ports.v
input [3:0]		esr_mac_tclk_1;		// To phy_clock_2ports of phy_clock_2ports.v
input			mac_125rx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_125tx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_156rx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_156tx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_312rx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_312tx_test_clk;	// To phy_clock_2ports of phy_clock_2ports.v
input			mac_reset0;		// To mac_2ports of mac_2ports.v
input			mac_reset1;		// To mac_2ports of mac_2ports.v
input			mdi;			// To mac_2ports of mac_2ports.v
input			mdi_0;			// To mac_2ports of mac_2ports.v
input			mdi_1;			// To mac_2ports of mac_2ports.v
input			niu_clk;		// To mac_2ports of mac_2ports.v
input			niu_reset_l;		// To mac_2ports of mac_2ports.v
input [19:0]		pio_clients_addr;	// To mac_2ports of mac_2ports.v
input			pio_clients_rd;		// To mac_2ports of mac_2ports.v
input [31:0]		pio_clients_wdata;	// To mac_2ports of mac_2ports.v
input			pio_mac_sel;		// To mac_2ports of mac_2ports.v
input			rxc_mac_req0;		// To mac_2ports of mac_2ports.v
input			rxc_mac_req1;		// To mac_2ports of mac_2ports.v
input			tcu_scan_mode;		// To phy_clock_2ports of phy_clock_2ports.v
input			txc_mac_abort0;		// To mac_2ports of mac_2ports.v
input			txc_mac_abort1;		// To mac_2ports of mac_2ports.v
input			txc_mac_ack0;		// To mac_2ports of mac_2ports.v
input			txc_mac_ack1;		// To mac_2ports of mac_2ports.v
input [63:0]		txc_mac_data0;		// To mac_2ports of mac_2ports.v
input [63:0]		txc_mac_data1;		// To mac_2ports of mac_2ports.v
input [3:0]		txc_mac_stat0;		// To mac_2ports of mac_2ports.v
input [3:0]		txc_mac_stat1;		// To mac_2ports of mac_2ports.v
input			txc_mac_tag0;		// To mac_2ports of mac_2ports.v
input			txc_mac_tag1;		// To mac_2ports of mac_2ports.v
// End of automatics
 
/*AUTOOUTPUT*/
// Beginning of automatic outputs (from unused autoinst outputs)
output [31:0]		mac_debug_port;		// From mac_2ports of mac_2ports.v
output [3:0]		mac_esr_tclk_0;		// From phy_clock_2ports of phy_clock_2ports.v
output [3:0]		mac_esr_tclk_1;		// From phy_clock_2ports of phy_clock_2ports.v
output [9:0]		mac_esr_txd0_0;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd0_1;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd1_0;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd1_1;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd2_0;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd2_1;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd3_0;		// From mac_2ports of mac_2ports.v
output [9:0]		mac_esr_txd3_1;		// From mac_2ports of mac_2ports.v
output			mac_pio_ack;		// From mac_2ports of mac_2ports.v
output			mac_pio_err;		// From mac_2ports of mac_2ports.v
output			mac_pio_intr0;		// From mac_2ports of mac_2ports.v
output			mac_pio_intr1;		// From mac_2ports of mac_2ports.v
output [63:0]		mac_pio_rdata;		// From mac_2ports of mac_2ports.v
output			mac_rxc_ack0;		// From mac_2ports of mac_2ports.v
output			mac_rxc_ack1;		// From mac_2ports of mac_2ports.v
output			mac_rxc_ctrl0;		// From mac_2ports of mac_2ports.v
output			mac_rxc_ctrl1;		// From mac_2ports of mac_2ports.v
output [63:0]		mac_rxc_data0;		// From mac_2ports of mac_2ports.v
output [63:0]		mac_rxc_data1;		// From mac_2ports of mac_2ports.v
output [22:0]		mac_rxc_stat0;		// From mac_2ports of mac_2ports.v
output [22:0]		mac_rxc_stat1;		// From mac_2ports of mac_2ports.v
output			mac_rxc_tag0;		// From mac_2ports of mac_2ports.v
output			mac_rxc_tag1;		// From mac_2ports of mac_2ports.v
output			mac_txc_req0;		// From mac_2ports of mac_2ports.v
output			mac_txc_req1;		// From mac_2ports of mac_2ports.v
output			mdo;			// From mac_2ports of mac_2ports.v
output			mdoe;			// From mac_2ports of mac_2ports.v
output			mif_pio_intr;		// From mac_2ports of mac_2ports.v
output			xaui_act_led_0;		// From mac_2ports of mac_2ports.v
output			xaui_act_led_1;		// From mac_2ports of mac_2ports.v
output			xaui_link_led_0;	// From mac_2ports of mac_2ports.v
output			xaui_link_led_1;	// From mac_2ports of mac_2ports.v
// End of automatics
 
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
wire			blunt_end_loopback;	// From mac_2ports of mac_2ports.v
wire			clk;			// From mac_2ports of mac_2ports.v
wire			gmii_mode0;		// From mac_2ports of mac_2ports.v
wire			gmii_mode1;		// From mac_2ports of mac_2ports.v
wire			loopback0;		// From mac_2ports of mac_2ports.v
wire			loopback1;		// From mac_2ports of mac_2ports.v
wire			mii_mode0;		// From mac_2ports of mac_2ports.v
wire			mii_mode1;		// From mac_2ports of mac_2ports.v
wire			pcs_bypass0;		// From mac_2ports of mac_2ports.v
wire			pcs_bypass1;		// From mac_2ports of mac_2ports.v
wire			rbc0_a_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_a_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_b_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_b_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_c_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_c_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_d_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rbc0_d_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			reset;			// From mac_2ports of mac_2ports.v
wire			rx_clk_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rx_clk_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire [3:0]		rx_heart_beat_timer0;	// From mac_2ports of mac_2ports.v
wire [3:0]		rx_heart_beat_timer1;	// From mac_2ports of mac_2ports.v
wire			rx_nbclk_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			rx_nbclk_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			sel_clk_25mhz0;		// From mac_2ports of mac_2ports.v
wire			sel_clk_25mhz1;		// From mac_2ports of mac_2ports.v
wire			sel_por_loopback_clk0;	// From mac_2ports of mac_2ports.v
wire			sel_por_loopback_clk1;	// From mac_2ports of mac_2ports.v
wire			tx_clk_312mhz0;		// From mac_2ports of mac_2ports.v
wire			tx_clk_312mhz1;		// From mac_2ports of mac_2ports.v
wire			tx_clk_312mhz_muxd0;	// From phy_clock_2ports of phy_clock_2ports.v
wire			tx_clk_312mhz_muxd1;	// From phy_clock_2ports of phy_clock_2ports.v
wire			tx_clk_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			tx_clk_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire [3:0]		tx_heart_beat_timer0;	// From mac_2ports of mac_2ports.v
wire [3:0]		tx_heart_beat_timer1;	// From mac_2ports of mac_2ports.v
wire			tx_nbclk_muxd0;		// From phy_clock_2ports of phy_clock_2ports.v
wire			tx_nbclk_muxd1;		// From phy_clock_2ports of phy_clock_2ports.v
wire			xgmii_mode0;		// From mac_2ports of mac_2ports.v
wire			xgmii_mode1;		// From mac_2ports of mac_2ports.v
wire			xpcs_loopback0;		// From mac_2ports of mac_2ports.v
wire			xpcs_loopback1;		// From mac_2ports of mac_2ports.v
// End of automatics
 

mac_2ports mac_2ports 
  (/*AUTOINST*/
   // Outputs
   .reset				(reset),
   .clk					(clk),
   .mac_debug_port			(mac_debug_port[31:0]),
   .blunt_end_loopback			(blunt_end_loopback),
   .mac_pio_ack				(mac_pio_ack),
   .mac_pio_rdata			(mac_pio_rdata[63:0]),
   .mac_pio_err				(mac_pio_err),
   .mac_pio_intr0			(mac_pio_intr0),
   .mac_pio_intr1			(mac_pio_intr1),
   .tx_clk_312mhz0			(tx_clk_312mhz0),
   .tx_heart_beat_timer0		(tx_heart_beat_timer0[3:0]),
   .rx_heart_beat_timer0		(rx_heart_beat_timer0[3:0]),
   .mac_txc_req0			(mac_txc_req0),
   .mac_rxc_ack0			(mac_rxc_ack0),
   .mac_rxc_tag0			(mac_rxc_tag0),
   .mac_rxc_data0			(mac_rxc_data0[63:0]),
   .mac_rxc_ctrl0			(mac_rxc_ctrl0),
   .mac_rxc_stat0			(mac_rxc_stat0[22:0]),
   .mdc					(mdc),
   .mdo					(mdo),
   .mdoe				(mdoe),
   .loopback0				(loopback0),
   .sel_por_loopback_clk0		(sel_por_loopback_clk0),
   .sel_clk_25mhz0			(sel_clk_25mhz0),
   .mii_mode0				(mii_mode0),
   .gmii_mode0				(gmii_mode0),
   .xgmii_mode0				(xgmii_mode0),
   .pcs_bypass0				(pcs_bypass0),
   .xpcs_loopback0			(xpcs_loopback0),
   .xaui_act_led_0			(xaui_act_led_0),
   .xaui_link_led_0			(xaui_link_led_0),
   .tx_clk_312mhz1			(tx_clk_312mhz1),
   .tx_heart_beat_timer1		(tx_heart_beat_timer1[3:0]),
   .rx_heart_beat_timer1		(rx_heart_beat_timer1[3:0]),
   .mac_txc_req1			(mac_txc_req1),
   .mac_rxc_ack1			(mac_rxc_ack1),
   .mac_rxc_tag1			(mac_rxc_tag1),
   .mac_rxc_data1			(mac_rxc_data1[63:0]),
   .mac_rxc_ctrl1			(mac_rxc_ctrl1),
   .mac_rxc_stat1			(mac_rxc_stat1[22:0]),
   .loopback1				(loopback1),
   .sel_por_loopback_clk1		(sel_por_loopback_clk1),
   .sel_clk_25mhz1			(sel_clk_25mhz1),
   .mii_mode1				(mii_mode1),
   .gmii_mode1				(gmii_mode1),
   .xgmii_mode1				(xgmii_mode1),
   .pcs_bypass1				(pcs_bypass1),
   .xpcs_loopback1			(xpcs_loopback1),
   .xaui_act_led_1			(xaui_act_led_1),
   .xaui_link_led_1			(xaui_link_led_1),
   .mac_esr_txd0_0			(mac_esr_txd0_0[9:0]),
   .mac_esr_txd1_0			(mac_esr_txd1_0[9:0]),
   .mac_esr_txd2_0			(mac_esr_txd2_0[9:0]),
   .mac_esr_txd3_0			(mac_esr_txd3_0[9:0]),
   .mac_esr_txd0_1			(mac_esr_txd0_1[9:0]),
   .mac_esr_txd1_1			(mac_esr_txd1_1[9:0]),
   .mac_esr_txd2_1			(mac_esr_txd2_1[9:0]),
   .mac_esr_txd3_1			(mac_esr_txd3_1[9:0]),
   .mif_pio_intr			(mif_pio_intr),
   // Inputs
   .niu_clk				(niu_clk),
   .niu_reset_l				(niu_reset_l),
   .pio_clients_addr			(pio_clients_addr[19:0]),
   .pio_clients_rd			(pio_clients_rd),
   .pio_clients_wdata			(pio_clients_wdata[31:0]),
   .pio_mac_sel				(pio_mac_sel),
   .mac_reset0				(mac_reset0),
   .mac_reset1				(mac_reset1),
   .esr_mac_rclk_0			(esr_mac_rclk_0[3:0]),
   .tx_clk_muxd0			(tx_clk_muxd0),
   .tx_nbclk_muxd0			(tx_nbclk_muxd0),
   .tx_clk_312mhz_muxd0			(tx_clk_312mhz_muxd0),
   .rx_clk_muxd0			(rx_clk_muxd0),
   .rx_nbclk_muxd0			(rx_nbclk_muxd0),
   .txc_mac_ack0			(txc_mac_ack0),
   .txc_mac_tag0			(txc_mac_tag0),
   .txc_mac_data0			(txc_mac_data0[63:0]),
   .txc_mac_stat0			(txc_mac_stat0[3:0]),
   .txc_mac_abort0			(txc_mac_abort0),
   .rxc_mac_req0			(rxc_mac_req0),
   .mdi					(mdi),
   .mdi_0				(mdi_0),
   .mdi_1				(mdi_1),
   .rbc0_a_muxd0			(rbc0_a_muxd0),
   .rbc0_b_muxd0			(rbc0_b_muxd0),
   .rbc0_c_muxd0			(rbc0_c_muxd0),
   .rbc0_d_muxd0			(rbc0_d_muxd0),
   .esr_mac_rclk_1			(esr_mac_rclk_1[3:0]),
   .tx_clk_muxd1			(tx_clk_muxd1),
   .tx_nbclk_muxd1			(tx_nbclk_muxd1),
   .tx_clk_312mhz_muxd1			(tx_clk_312mhz_muxd1),
   .rx_clk_muxd1			(rx_clk_muxd1),
   .rx_nbclk_muxd1			(rx_nbclk_muxd1),
   .txc_mac_ack1			(txc_mac_ack1),
   .txc_mac_tag1			(txc_mac_tag1),
   .txc_mac_data1			(txc_mac_data1[63:0]),
   .txc_mac_stat1			(txc_mac_stat1[3:0]),
   .txc_mac_abort1			(txc_mac_abort1),
   .rxc_mac_req1			(rxc_mac_req1),
   .rbc0_a_muxd1			(rbc0_a_muxd1),
   .rbc0_b_muxd1			(rbc0_b_muxd1),
   .rbc0_c_muxd1			(rbc0_c_muxd1),
   .rbc0_d_muxd1			(rbc0_d_muxd1),
   .esr_mac_rxd0_0			(esr_mac_rxd0_0[9:0]),
   .esr_mac_rxd1_0			(esr_mac_rxd1_0[9:0]),
   .esr_mac_rxd2_0			(esr_mac_rxd2_0[9:0]),
   .esr_mac_rxd3_0			(esr_mac_rxd3_0[9:0]),
   .esr_mac_sync_0			(esr_mac_sync_0[3:0]),
   .esr_mac_los_0			(esr_mac_los_0[3:0]),
   .esr_mac_oddcg0_0			(esr_mac_oddcg0_0),
   .esr_mac_rxd0_1			(esr_mac_rxd0_1[9:0]),
   .esr_mac_rxd1_1			(esr_mac_rxd1_1[9:0]),
   .esr_mac_rxd2_1			(esr_mac_rxd2_1[9:0]),
   .esr_mac_rxd3_1			(esr_mac_rxd3_1[9:0]),
   .esr_mac_sync_1			(esr_mac_sync_1[3:0]),
   .esr_mac_los_1			(esr_mac_los_1[3:0]),
   .esr_mac_oddcg0_1			(esr_mac_oddcg0_1));
   

phy_clock_2ports phy_clock_2ports 
  (/*AUTOINST*/
   // Outputs
   .mac_esr_tclk_0			(mac_esr_tclk_0[3:0]),
   .tx_nbclk_muxd0			(tx_nbclk_muxd0),
   .tx_clk_muxd0			(tx_clk_muxd0),
   .tx_clk_312mhz_muxd0			(tx_clk_312mhz_muxd0),
   .rx_nbclk_muxd0			(rx_nbclk_muxd0),
   .rx_clk_muxd0			(rx_clk_muxd0),
   .rbc0_a_muxd0			(rbc0_a_muxd0),
   .rbc0_b_muxd0			(rbc0_b_muxd0),
   .rbc0_c_muxd0			(rbc0_c_muxd0),
   .rbc0_d_muxd0			(rbc0_d_muxd0),
   .mac_esr_tclk_1			(mac_esr_tclk_1[3:0]),
   .tx_nbclk_muxd1			(tx_nbclk_muxd1),
   .tx_clk_muxd1			(tx_clk_muxd1),
   .tx_clk_312mhz_muxd1			(tx_clk_312mhz_muxd1),
   .rx_nbclk_muxd1			(rx_nbclk_muxd1),
   .rx_clk_muxd1			(rx_clk_muxd1),
   .rbc0_a_muxd1			(rbc0_a_muxd1),
   .rbc0_b_muxd1			(rbc0_b_muxd1),
   .rbc0_c_muxd1			(rbc0_c_muxd1),
   .rbc0_d_muxd1			(rbc0_d_muxd1),
   // Inputs
   .tcu_scan_mode			(tcu_scan_mode),
   .mac_312tx_test_clk			(mac_312tx_test_clk),
   .mac_312rx_test_clk			(mac_312rx_test_clk),
   .mac_156tx_test_clk			(mac_156tx_test_clk),
   .mac_156rx_test_clk			(mac_156rx_test_clk),
   .mac_125tx_test_clk			(mac_125tx_test_clk),
   .mac_125rx_test_clk			(mac_125rx_test_clk),
   .reset				(reset),
   .clk					(clk),
   .blunt_end_loopback			(blunt_end_loopback),
   .loopback0				(loopback0),
   .sel_por_loopback_clk0		(sel_por_loopback_clk0),
   .sel_clk_25mhz0			(sel_clk_25mhz0),
   .mii_mode0				(mii_mode0),
   .gmii_mode0				(gmii_mode0),
   .xgmii_mode0				(xgmii_mode0),
   .pcs_bypass0				(pcs_bypass0),
   .xpcs_loopback0			(xpcs_loopback0),
   .tx_heart_beat_timer0		(tx_heart_beat_timer0[3:0]),
   .rx_heart_beat_timer0		(rx_heart_beat_timer0[3:0]),
   .esr_mac_rclk_0			(esr_mac_rclk_0[3:0]),
   .esr_mac_tclk_0			(esr_mac_tclk_0[3:0]),
   .tx_clk_312mhz0			(tx_clk_312mhz0),
   .loopback1				(loopback1),
   .sel_por_loopback_clk1		(sel_por_loopback_clk1),
   .sel_clk_25mhz1			(sel_clk_25mhz1),
   .mii_mode1				(mii_mode1),
   .gmii_mode1				(gmii_mode1),
   .xgmii_mode1				(xgmii_mode1),
   .pcs_bypass1				(pcs_bypass1),
   .xpcs_loopback1			(xpcs_loopback1),
   .tx_heart_beat_timer1		(tx_heart_beat_timer1[3:0]),
   .rx_heart_beat_timer1		(rx_heart_beat_timer1[3:0]),
   .esr_mac_rclk_1			(esr_mac_rclk_1[3:0]),
   .esr_mac_tclk_1			(esr_mac_tclk_1[3:0]),
   .tx_clk_312mhz1			(tx_clk_312mhz1));
   

   
endmodule // mac2





