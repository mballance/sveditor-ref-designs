// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mac_2ports.v
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
/*%W%	%G%*/

/*****************************************************************
 *
 * File Name    : mac_2ports.v
 * Author Name  : John Lo
 * Description  : mac_clk_driver 
 *                + mac_pio_intf  
 *                + 2 xmac_2pcs_core
 *                + sphy_dpath2 
 *                + esr_ctrl
 *                + mif 
 * 
 * Parent Module: mac
 * Child  Module: 
 * Interface Mod: IPPs,OPPs,ethernet serdes, PIO.
 * Date Created : 3/23/04
 * 
 * Design Notes:  1. channel 0 of each serdes is used as 1G 
 *                   port respectively.
 *                   Used esr_mac_oddcg0_0 and esr_mac_oddcg0_1
 *                   to for odd_rx0 and odd_rx1.
 *                2. xpcs needs signal_detect and serdes_rdy 
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : 4/1/2004 -by John Lo
 *                1. Changed address bus width from 
 *                   16 bits to 19 bits for pio_clients_addr.
 *                2. Support both 32 bit and 64 bit addressing.
 *                3. Changed PIO read/write data bus from
 *                   32 bits to 64 bits.
 *                   The MSB 32 bits are "0". 
 *                7/14/2004 -by John Lo
 *                1. used esr_mac_oddcg0_0 and esr_mac_oddcg0_1
 *                   to for odd_rx0 and odd_rx1.
 * 
 *                11/23/2004 -by JOhn Lo
 *                1. used ch1 esr_mac_oddcg1_0 and esr_mac_oddcg1_1
 *                   to for odd_rx0 and odd_rx1.
 * 
 *                3/4/2005 -by John Lo
 *                1. Changed back to esr_mac_oddcg0_0 and esr_mac_oddcg0_1
 *                   to for odd_rx0 and odd_rx1.
 * 
 *               
 * Synthesis Notes: 
 * 
 * 
 ****************************************************************/

module mac_2ports(/*AUTOARG*/
   // Outputs
   reset, clk, mac_debug_port, mac_pio_ack, mac_pio_rdata, 
   mac_pio_intr0, mac_pio_intr1, mac_pio_err, tx_heart_beat_timer0, 
   rx_heart_beat_timer0, mac_txc_req0, mac_rxc_ack0, mac_rxc_tag0, 
   mac_rxc_data0, mac_rxc_ctrl0, mac_rxc_stat0, loopback0, 
   sel_por_clk_src0, sel_clk_25mhz0, mii_mode0, gmii_mode0, 
   xgmii_mode0, pcs_bypass0, xpcs_loopback0, xaui_act_led_0, 
   xaui_link_led_0, tx_heart_beat_timer1, rx_heart_beat_timer1, 
   mac_txc_req1, mac_rxc_ack1, mac_rxc_tag1, mac_rxc_data1, 
   mac_rxc_ctrl1, mac_rxc_stat1, loopback1, sel_por_clk_src1, 
   sel_clk_25mhz1, mii_mode1, gmii_mode1, xgmii_mode1, pcs_bypass1, 
   xpcs_loopback1, xaui_act_led_1, xaui_link_led_1, mdclk, mdo, mdoe, 
   serdes_reset_0, serdes_reset_1, mac_esr_tclk_0, mac_esr_txd0_0, 
   mac_esr_txd1_0, mac_esr_txd2_0, mac_esr_txd3_0, mac_esr_tclk_1, 
   mac_esr_txd0_1, mac_esr_txd1_1, mac_esr_txd2_1, mac_esr_txd3_1, 
   mif_pio_intr, 
   // Inputs
   niu_clk, niu_reset_l, pio_clients_addr, pio_clients_rd, 
   pio_clients_wdata, pio_mac_sel, mac_reset0, mac_reset1, 
   tcu_scan_mode, tcu_scan_en, tcu_mac_312tx_clk_stop, 
   tcu_mac_312rx_clk_stop, tcu_mac_156tx_clk_stop, 
   tcu_mac_156rx_clk_stop, tcu_mac_125tx_clk_stop, 
   tcu_mac_125rx_clk_stop, tx_clk_muxd0, tx_nbclk_muxd0, 
   tx_clk_312mhz_muxd0, rx_clk_muxd0, rx_nbclk_muxd0, txc_mac_ack0, 
   txc_mac_tag0, txc_mac_data0, txc_mac_stat0, txc_mac_abort0, 
   rxc_mac_req0, rbc0_a_muxd0, rbc0_b_muxd0, rbc0_c_muxd0, 
   rbc0_d_muxd0, tx_clk_muxd1, tx_nbclk_muxd1, tx_clk_312mhz_muxd1, 
   rx_clk_muxd1, rx_nbclk_muxd1, txc_mac_ack1, txc_mac_tag1, 
   txc_mac_data1, txc_mac_stat1, txc_mac_abort1, rxc_mac_req1, 
   rbc0_a_muxd1, rbc0_b_muxd1, rbc0_c_muxd1, rbc0_d_muxd1, mdi, 
   mdi_0, mdi_1, xaui_mdint0_l, xaui_mdint1_l, esr_mac_rxd0_0, 
   esr_mac_rxd1_0, esr_mac_rxd2_0, esr_mac_rxd3_0, esr_mac_lock_0, 
   esr_mac_los_0, esr_mac_oddcg0_0, esr_mac_rxd0_1, esr_mac_rxd1_1, 
   esr_mac_rxd2_1, esr_mac_rxd3_1, esr_mac_lock_1, esr_mac_los_1, 
   esr_mac_oddcg0_1
   );

/* ------------- global signals ------------------------------- */
   input 	   niu_clk;
   input 	   niu_reset_l;
   output 	   reset;
   output 	   clk;
   output [31:0]   mac_debug_port;
   input  [19:0]   pio_clients_addr;
   input 	   pio_clients_rd;
   input  [31:0]   pio_clients_wdata;
                   // designated signals
   input 	   pio_mac_sel;
   output 	   mac_pio_ack;
   output [63:0]   mac_pio_rdata;
   output 	   mac_pio_intr0;// port 0 interrupt
   output 	   mac_pio_intr1;// port 1 interrupt
   output 	   mac_pio_err;
                   // per port mac_reset
   input 	   mac_reset0;
   input 	   mac_reset1;
                   // DFT signals
   input 	   tcu_scan_mode;
   input           tcu_scan_en;              // NEW INPUT PIN
   input           tcu_mac_312tx_clk_stop;   // NEW INPUT PIN
   input           tcu_mac_312rx_clk_stop;   // NEW INPUT PIN
   input           tcu_mac_156tx_clk_stop;   // NEW INPUT PIN
   input           tcu_mac_156rx_clk_stop;   // NEW INPUT PIN
   input           tcu_mac_125tx_clk_stop;   // NEW INPUT PIN
   input           tcu_mac_125rx_clk_stop;   // NEW INPUT PIN   
/****************************************************************
 * port0: xmac_2pcs_core
 ****************************************************************/
/* ------------- xmac_core clocks ----------------------------- */
   input 	   tx_clk_muxd0;    // from clock mux
   input 	   tx_nbclk_muxd0;  // from clock mux
   input           tx_clk_312mhz_muxd0;  // esr_mac_tclk_0 is from Channel 1 transmit clock.
   input 	   rx_clk_muxd0;    // from clock mux
   input 	   rx_nbclk_muxd0;  // from clock mux
   output [3:0]    tx_heart_beat_timer0;
   output [3:0]    rx_heart_beat_timer0;
/* ------------- shared MII/GMII Interface -------------------- */
// input           gmii_rx_dv0;
// input [7:0]     gmii_rxd0;
// input           gmii_rx_err0;
// output          gmii_tx_en0;
// output [7:0]    gmii_txd0;
// output          gmii_tx_err0;
/* ------------- XGMII Interface ------------------------------ */
// input [3:0]     xgmii_rxc0;
// input [31:0]    xgmii_rxd0;
// output [3:0]    xgmii_txc0;
// output [31:0]   xgmii_txd0;
/* ------------- Tx DMA Interface ----------------------------- */
   output 	   mac_txc_req0;
   input           txc_mac_ack0;
   input           txc_mac_tag0;
   input [63:0]    txc_mac_data0;
   input [3:0] 	   txc_mac_stat0;
   input 	   txc_mac_abort0;
/* ------------- Rx DMA Interface ----------------------------- */
   input 	   rxc_mac_req0;
   output 	   mac_rxc_ack0;
   output 	   mac_rxc_tag0;   // output of rxfifo. non-registered.
   output [63:0]   mac_rxc_data0;  // {64bit data}
   output 	   mac_rxc_ctrl0;
   output [22:0]   mac_rxc_stat0;  // {24bit data}

/****************************
 * phy_clock signals
 ***************************/
   output 	   loopback0;
   output 	   sel_por_clk_src0;
   output 	   sel_clk_25mhz0;
   output 	   mii_mode0;
   output 	   gmii_mode0;
   output 	   xgmii_mode0;
   output 	   pcs_bypass0;
   output 	   xpcs_loopback0;
   
/* ------------- xPCS Interface ------------------------------- */
   input	   rbc0_a_muxd0;     // 
   input	   rbc0_b_muxd0;     // 
   input   	   rbc0_c_muxd0;     // 
   input	   rbc0_d_muxd0;     // 
/************
 * led
 * ***********/
   output 	   xaui_act_led_0;
   output 	   xaui_link_led_0;

/****************************************************************
 * end of port0
 ****************************************************************/
/****************************************************************
 * port1: xmac_2pcs_core
 ****************************************************************/
/* ------------- xmac_core clocks ----------------------------- */
   input 	   tx_clk_muxd1;    // from clock mux
   input 	   tx_nbclk_muxd1;  // from clock mux
   input           tx_clk_312mhz_muxd1;  // esr_mac_tclk_0 is from Channel 1 transmit clock.
   input 	   rx_clk_muxd1;    // from clock mux
   input 	   rx_nbclk_muxd1;  // from clock mux
   output [3:0]    tx_heart_beat_timer1;
   output [3:0]    rx_heart_beat_timer1;
/* ------------- shared MII/GMII Interface -------------------- */
//   input           gmii_rx_dv1;
//   input [7:0]     gmii_rxd1;
//   input           gmii_rx_err1;
//   output          gmii_tx_en1;
//   output [7:0]    gmii_txd1;
//   output          gmii_tx_err1;
/* ------------- XGMII Interface ------------------------------ */
// input [3:0]     xgmii_rxc1;
// input [31:0]    xgmii_rxd1;
// output [3:0]    xgmii_txc1;
// output [31:0]   xgmii_txd1;
/* ------------- Tx DMA Interface ----------------------------- */
   output 	   mac_txc_req1;
   input           txc_mac_ack1;
   input           txc_mac_tag1;
   input [63:0]    txc_mac_data1;
   input [3:0] 	   txc_mac_stat1;
   input 	   txc_mac_abort1;
/* ------------- Rx DMA Interface ----------------------------- */
   input 	   rxc_mac_req1;
   output 	   mac_rxc_ack1;
   output 	   mac_rxc_tag1;   // output of rxfifo. non-registered.
   output [63:0]   mac_rxc_data1;  // {64bit data}
   output 	   mac_rxc_ctrl1;
   output [22:0]   mac_rxc_stat1;  // {24bit data}

/****************************
 * phy_clock signals
 ***************************/
   output 	   loopback1;
   output 	   sel_por_clk_src1;
   output 	   sel_clk_25mhz1;
   output 	   mii_mode1;
   output 	   gmii_mode1;
   output 	   xgmii_mode1;
   output 	   pcs_bypass1;
   output 	   xpcs_loopback1;
   
/* ------------- xPCS Interface ------------------------------- */
   input	   rbc0_a_muxd1;     // 
   input	   rbc0_b_muxd1;     // 
   input   	   rbc0_c_muxd1;     // 
   input	   rbc0_d_muxd1;     // 
/************
 * led
 * ***********/
   output 	   xaui_act_led_1;
   output 	   xaui_link_led_1;

/****************************************************************
 * end of port1
 ****************************************************************/

/****************************************
 * mif related
 ****************************************/
   input 	   mdi;
   input 	   mdi_0;
   input 	   mdi_1;
   input           xaui_mdint0_l;
   input 	   xaui_mdint1_l;
                   // outputs
   output 	   mdclk;      
   output 	   mdo;      
   output 	   mdoe;      

   output 	   serdes_reset_0;
   output 	   serdes_reset_1;

/****************************************
 * top level esr data path (sphy_dpath2)
 ****************************************/
                   // rx serdes 0
   input  [9:0]    esr_mac_rxd0_0;
   input  [9:0]    esr_mac_rxd1_0;
   input  [9:0]    esr_mac_rxd2_0;
   input  [9:0]    esr_mac_rxd3_0;
   input           esr_mac_lock_0;
   input  [3:0]    esr_mac_los_0;
   input           esr_mac_oddcg0_0;
                   // tx serdes 0
   output [3:0]    mac_esr_tclk_0;
   output [9:0]    mac_esr_txd0_0;
   output [9:0]    mac_esr_txd1_0;
   output [9:0]    mac_esr_txd2_0;
   output [9:0]    mac_esr_txd3_0;
                   // rx serdes 1
   input  [9:0]    esr_mac_rxd0_1;
   input  [9:0]    esr_mac_rxd1_1;
   input  [9:0]    esr_mac_rxd2_1;
   input  [9:0]    esr_mac_rxd3_1;
   input           esr_mac_lock_1;
   input  [3:0]    esr_mac_los_1;
   input           esr_mac_oddcg0_1;
                   // tx serdes 1
   output [3:0]    mac_esr_tclk_1;
   output [9:0]    mac_esr_txd0_1;
   output [9:0]    mac_esr_txd1_1;
   output [9:0]    mac_esr_txd2_1;
   output [9:0]    mac_esr_txd3_1;
                   //
   output 	   mif_pio_intr;
   
/*AUTOWIRE*/
// Beginning of automatic wires (for undeclared instantiated-module outputs)
// End of automatics
  
/****************************
 * internal signals
 ***************************/
   wire 	   blunt_end_loopback;
   wire [19:0]     pio_clients_addr;
   wire 	   pio_clients_rd;
   wire [31:0]     pio_clients_wdata;
                   // vlint flag_dangling_net_within_module off
                   // vlint flag_net_has_no_load off
   wire [16:0]     pio_addr;
                   // vlint flag_net_has_no_load on
                   // vlint flag_dangling_net_within_module on
   wire   	   pio_rd;
   wire [31:0]     pio_wdata;
   // 10G
   wire  [31:0]    rdata_xmac0;
   wire  [31:0]    rdata_xpcs0;
   wire  [31:0]    rdata_pcs0;
   wire  [31:0]    rdata_xmac1;
   wire  [31:0]    rdata_xpcs1;
   wire  [31:0]    rdata_pcs1;
   wire  [31:0]    rdata_esr;
   wire  [31:0]    rdata_mif;
   wire  [31:0]    mac_debug_port;
   wire  [31:0]	   xmac_debug0;
   wire  [31:0]	   xpcs_debug0;
   wire  [2:0] 	   mac_debug_sel0;
   wire  [31:0]	   xmac_debug1;
   wire  [31:0]	   xpcs_debug1;
                   // vlint flag_dangling_net_within_module off
                   // vlint flag_net_has_no_load off
   wire  [2:0] 	   mac_debug_sel1;
                   // vlint flag_net_has_no_load on
                   // vlint flag_dangling_net_within_module on

   wire            gmii_rx_dv0 = 0;
   wire [7:0]      gmii_rxd0 = 0;
   wire            gmii_rx_err0 = 0;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire            gmii_tx_en0;
   wire [7:0]      gmii_txd0;
   wire            gmii_tx_err0;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on

   wire            gmii_rx_dv1 = 0;
   wire [7:0]      gmii_rxd1 = 0;
   wire            gmii_rx_err1 = 0;
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire            gmii_tx_en1;
   wire [7:0]      gmii_txd1;
   wire            gmii_tx_err1;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
   wire [31:0] 	   esrctl_debug;
   wire 	   serdes_reset_0;
   wire 	   serdes_reset_1;
   
// port 2
   wire 	   pio_err_bmac2 = 0;
   wire 	   ack_bmac2     = 0;
   wire [31:0]	   rdata_bmac2   = 32'b0;
   wire 	   pio_err_pcs2  = 0;
   wire 	   ack_pcs2      = 0;
   wire [31:0]	   rdata_pcs2    = 32'b0;
   wire 	   bm_tx_interrupt2 = 0;
   wire 	   bm_rx_interrupt2 = 0;
   wire 	   bm_control_interrupt2 = 0;
   wire 	   pcs_int2      = 0;
// port 3
   wire 	   pio_err_bmac3 = 0;
   wire 	   ack_bmac3     = 0;
   wire [31:0]	   rdata_bmac3   = 32'b0;
   wire 	   pio_err_pcs3  = 0;
   wire 	   ack_pcs3      = 0;
   wire [31:0]	   rdata_pcs3    = 32'b0;
   wire 	   bm_tx_interrupt3 = 0;
   wire 	   bm_rx_interrupt3 = 0;
   wire 	   bm_control_interrupt3 = 0;
   wire 	   pcs_int3      = 0;
   // sphy_dpath2
                   // ----- port 0 serdes 0
   wire 	   xgmii_mode0;
   wire 	   tx_clk_312mhz0;
   wire [39:0]     xtx_code_group0;
   wire [9:0] 	   tx_code_group0;
   wire [9:0]      mac_esr_txd0_0;
   wire [9:0]      mac_esr_txd1_0;
   wire [9:0]      mac_esr_txd2_0;
   wire [9:0]      mac_esr_txd3_0;
                   // rx side signals
   wire [9:0]      esr_mac_rxd0_0;
   wire [9:0]      esr_mac_rxd1_0;
   wire [9:0]      esr_mac_rxd2_0;
   wire [9:0]      esr_mac_rxd3_0;
   wire [39:0]     xrx_code_group0;
   wire [9:0]      rx_code_group0;
   wire 	   odd_rx0;
                   // ----- port 1 serdes 1
   wire 	   xgmii_mode1;
   wire 	   tx_clk_312mhz1;
                   // tx side signals
   wire [39:0]     xtx_code_group1;
   wire [9:0] 	   tx_code_group1;
   wire [9:0]      mac_esr_txd0_1;
   wire [9:0]      mac_esr_txd1_1;
   wire [9:0]      mac_esr_txd2_1;
   wire [9:0]      mac_esr_txd3_1;
                   // rx side signals
   wire [9:0]      esr_mac_rxd0_1;
   wire [9:0]      esr_mac_rxd1_1;
   wire [9:0]      esr_mac_rxd2_1;
   wire [9:0]      esr_mac_rxd3_1;
   wire [39:0]     xrx_code_group1;
   wire [9:0]      rx_code_group1;
   wire 	   odd_rx1;
   // esr_ctrl
                   // port0 xpcs, pcs signals
   wire        	   esr_mac_lock_0;
   wire [3:0] 	   esr_mac_los_0;
   wire            serdes_rdy0_0;
   wire       	   signal_detect0_0;
   wire            xserdes_rdy_0;
   wire [3:0]	   xsignal_detect_0;
                   // port1 xpcs, pcs signals
   wire       	   esr_mac_lock_1;
   wire [3:0] 	   esr_mac_los_1;
   wire            serdes_rdy0_1;
   wire       	   signal_detect0_1;
   wire            xserdes_rdy_1;
   wire [3:0]	   xsignal_detect_1;
   // global signals
   wire 	   tx_nbclk0;
   wire 	   tx_nbclk1;
   wire            mdclk;
   wire 	   mdo;
   wire 	   mdoe = mdo;
   wire            rbc0_a0,rbc0_b0,rbc0_c0,rbc0_d0,rx_clk0,rx_nbclk0,tx_clk0,
		   rbc0_a1,rbc0_b1,rbc0_c1,rbc0_d1,rx_clk1,rx_nbclk1,tx_clk1,
		   pio_err_xmac0,ack_xmac0,pio_err_xpcs0,ack_xpcs0,pio_err_pcs0,ack_pcs0,
		   pio_err_xmac1,ack_xmac1,pio_err_xpcs1,ack_xpcs1,pio_err_pcs1,ack_pcs1,
		   pio_err_esr,ack_esr,pio_err_mif,ack_mif,
		   txmac_interrupt0,rxmac_interrupt0,xmac_fc_interrupt0,xpcs_interrupt0,pcs_int0,
		   txmac_interrupt1,rxmac_interrupt1,xmac_fc_interrupt1,xpcs_interrupt1,pcs_int1,
		   sel_xmac0,sel_xpcs0,sel_pcs0,
                   sel_xmac1,sel_xpcs1,sel_pcs1;
		   // vlint flag_dangling_net_within_module off
                   // vlint flag_net_has_no_load off
   wire		   sel_bmac2,sel_pcs2,mac_pio_intr2,
		   sel_bmac3,sel_pcs3,mac_pio_intr3;
                   // vlint flag_net_has_no_load on
                   // vlint flag_dangling_net_within_module on

   wire 	   sel_esr,sel_mif;
   wire 	   clk;
   wire            MDINT0;
   wire            MDINT1;
		   
// vlint flag_net_has_no_load            off
// vlint flag_dangling_net_within_module off
   wire [2:0] 	   sys_clk_count0;
   wire [3:0] 	   xgmii_txc0;
   wire [31:0] 	   xgmii_txd0;
   wire [2:0] 	   sys_clk_count1;
   wire [3:0] 	   xgmii_txc1;
   wire [31:0] 	   xgmii_txd1;
   wire 	   atca_GE;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load            on

// \\\\\\\\\\ glue logic \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/* ----------- clock muxes ------------- */
   wire 	  p1_mac_esr_tclk_0;
   wire 	  p1_mac_esr_tclk_1;
   wire [3:0]	  mac_esr_tclk_0;
   wire [3:0]	  mac_esr_tclk_1;

func_mux1  p1_mac_esr_tclk_0_func_mux1 (.din0(tx_nbclk0),.din1(tx_clk_312mhz0),.select(xgmii_mode0),.dout(p1_mac_esr_tclk_0));
func_mux1  p1_mac_esr_tclk_1_func_mux1 (.din0(tx_nbclk1),.din1(tx_clk_312mhz1),.select(xgmii_mode1),.dout(p1_mac_esr_tclk_1));
// blunt_end_loopback is ment for 10G only
func_mux1  mac_esr_tclk_0_0_func_mux1(.din0(p1_mac_esr_tclk_0),.din1(~rbc0_a0),.select(blunt_end_loopback),.dout(mac_esr_tclk_0[0]));
func_mux1  mac_esr_tclk_0_1_func_mux1(.din0(p1_mac_esr_tclk_0),.din1(~rbc0_b0),.select(blunt_end_loopback),.dout(mac_esr_tclk_0[1]));
func_mux1  mac_esr_tclk_0_2_func_mux1(.din0(p1_mac_esr_tclk_0),.din1(~rbc0_c0),.select(blunt_end_loopback),.dout(mac_esr_tclk_0[2]));
func_mux1  mac_esr_tclk_0_3_func_mux1(.din0(p1_mac_esr_tclk_0),.din1(~rbc0_d0),.select(blunt_end_loopback),.dout(mac_esr_tclk_0[3]));
func_mux1  mac_esr_tclk_1_0_func_mux1(.din0(p1_mac_esr_tclk_1),.din1(~rbc0_a1),.select(blunt_end_loopback),.dout(mac_esr_tclk_1[0]));
func_mux1  mac_esr_tclk_1_1_func_mux1(.din0(p1_mac_esr_tclk_1),.din1(~rbc0_b1),.select(blunt_end_loopback),.dout(mac_esr_tclk_1[1]));
func_mux1  mac_esr_tclk_1_2_func_mux1(.din0(p1_mac_esr_tclk_1),.din1(~rbc0_c1),.select(blunt_end_loopback),.dout(mac_esr_tclk_1[2]));
func_mux1  mac_esr_tclk_1_3_func_mux1(.din0(p1_mac_esr_tclk_1),.din1(~rbc0_d1),.select(blunt_end_loopback),.dout(mac_esr_tclk_1[3]));

/* ----------- regiser reset ----------- */
   reg 	  mac_reset_port0;
   reg 	  mac_reset_port1;
   
always @ (posedge clk)
  begin
    mac_reset_port0 <= mac_reset0;
    mac_reset_port1 <= mac_reset1;
  end
   
// \\\\\\\\\\ begin instantiation \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/****************************************************************
 * mac_clk_driver isntantiation
 ****************************************************************/
mac_clk_driver mac_clk_driver(
// port0                             
.rbc0_a0(rbc0_a0),
.rbc0_b0(rbc0_b0),
.rbc0_c0(rbc0_c0),
.rbc0_d0(rbc0_d0),
.rx_clk0(rx_clk0),     // output of clock tree
.rx_nbclk0(rx_nbclk0), // output of clock tree
.tx_clk0(tx_clk0),     // output of clock tree
.tx_nbclk0(tx_nbclk0), // output of clock tree
.tx_clk_312mhz0(tx_clk_312mhz0),
.rbc0_a_muxd0(rbc0_a_muxd0),
.rbc0_b_muxd0(rbc0_b_muxd0),
.rbc0_c_muxd0(rbc0_c_muxd0),
.rbc0_d_muxd0(rbc0_d_muxd0),
.rx_nbclk_muxd0(rx_nbclk_muxd0),                      
.rx_clk_muxd0(rx_clk_muxd0),                        
.tx_nbclk_muxd0(tx_nbclk_muxd0),                      
.tx_clk_muxd0(tx_clk_muxd0),                        
.tx_clk_312mhz_muxd0(tx_clk_312mhz_muxd0),
// port1  
.rbc0_a1(rbc0_a1),
.rbc0_b1(rbc0_b1),
.rbc0_c1(rbc0_c1),
.rbc0_d1(rbc0_d1),
.rx_clk1(rx_clk1),     // output of clock tree
.rx_nbclk1(rx_nbclk1), // output of clock tree
.tx_clk1(tx_clk1),     // output of clock tree
.tx_nbclk1(tx_nbclk1), // output of clock tree
.tx_clk_312mhz1(tx_clk_312mhz1),
.rbc0_a_muxd1(rbc0_a_muxd1),
.rbc0_b_muxd1(rbc0_b_muxd1),
.rbc0_c_muxd1(rbc0_c_muxd1),
.rbc0_d_muxd1(rbc0_d_muxd1),
.rx_nbclk_muxd1(rx_nbclk_muxd1),                      
.rx_clk_muxd1(rx_clk_muxd1),                        
.tx_nbclk_muxd1(tx_nbclk_muxd1),                      
.tx_clk_muxd1(tx_clk_muxd1),                        
.tx_clk_312mhz_muxd1(tx_clk_312mhz_muxd1),
//
.tcu_scan_mode(tcu_scan_mode),
.tcu_scan_en(tcu_scan_en),           
.tcu_mac_312tx_clk_stop(tcu_mac_312tx_clk_stop),
.tcu_mac_312rx_clk_stop(tcu_mac_312rx_clk_stop),
.tcu_mac_156tx_clk_stop(tcu_mac_156tx_clk_stop),
.tcu_mac_156rx_clk_stop(tcu_mac_156rx_clk_stop),
.tcu_mac_125tx_clk_stop(tcu_mac_125tx_clk_stop),
.tcu_mac_125rx_clk_stop(tcu_mac_125rx_clk_stop),
// core clock
.clk(clk),
.niu_clk(niu_clk)
		       );
// end of mac_clk_driver isntantiation
   
/****************************************************************
 * mac_pio_intf isntantiation
 ****************************************************************/
mac_pio_intf  mac_pio_intf(
.clk(clk),
.niu_reset_l(niu_reset_l),
// global broadcast signals
.pio_clients_addr(pio_clients_addr[19:0]),
.pio_clients_rd(pio_clients_rd),
.pio_clients_wdata(pio_clients_wdata[31:0]),
// designated signals
.pio_mac_sel(pio_mac_sel),
.mac_pio_ack(mac_pio_ack),
.mac_pio_rdata(mac_pio_rdata[63:0]),
// individual internal inputs
// port 0
.pio_err_xmac0(pio_err_xmac0),
.ack_xmac0(ack_xmac0),
.rdata_xmac0(rdata_xmac0),
.pio_err_xpcs0(pio_err_xpcs0),
.ack_xpcs0(ack_xpcs0),
.rdata_xpcs0(rdata_xpcs0),
.pio_err_pcs0(pio_err_pcs0),
.ack_pcs0(ack_pcs0),
.rdata_pcs0(rdata_pcs0),
// port 1
.pio_err_xmac1(pio_err_xmac1),
.ack_xmac1(ack_xmac1),
.rdata_xmac1(rdata_xmac1),
.pio_err_xpcs1(pio_err_xpcs1),
.ack_xpcs1(ack_xpcs1),
.rdata_xpcs1(rdata_xpcs1),
.pio_err_pcs1(pio_err_pcs1),
.ack_pcs1(ack_pcs1),
.rdata_pcs1(rdata_pcs1),
// port 2
.pio_err_bmac2(pio_err_bmac2),
.ack_bmac2(ack_bmac2),
.rdata_bmac2(rdata_bmac2),
.pio_err_pcs2(pio_err_pcs2),
.ack_pcs2(ack_pcs2),
.rdata_pcs2(rdata_pcs2),
// port 3
.pio_err_bmac3(pio_err_bmac3),
.ack_bmac3(ack_bmac3),
.rdata_bmac3(rdata_bmac3),
.pio_err_pcs3(pio_err_pcs3),
.ack_pcs3(ack_pcs3),
.rdata_pcs3(rdata_pcs3),
// esr
.pio_err_esr(pio_err_esr),
.ack_esr(ack_esr),
.rdata_esr(rdata_esr),
// mif
.pio_err_mif(pio_err_mif),
.ack_mif(ack_mif),
.rdata_mif(rdata_mif[31:0]),
// port 0 interrupts
.txmac_interrupt0(txmac_interrupt0),
.rxmac_interrupt0(rxmac_interrupt0),
.xmac_fc_interrupt0(xmac_fc_interrupt0),
.xpcs_interrupt0(xpcs_interrupt0),
.pcs_int0(pcs_int0),	  // pcs link down interrupt, secondary interrupt
// port 1 interrupts
.txmac_interrupt1(txmac_interrupt1),
.rxmac_interrupt1(rxmac_interrupt1),
.xmac_fc_interrupt1(xmac_fc_interrupt1),
.xpcs_interrupt1(xpcs_interrupt1),
.pcs_int1(pcs_int1),	  // pcs link down interrupt, secondary interrupt
// port 2 interrupts
.bm_tx_interrupt2(bm_tx_interrupt2),
.bm_rx_interrupt2(bm_rx_interrupt2),
.bm_control_interrupt2(bm_control_interrupt2),
.pcs_int2(pcs_int2),	  // pcs link down interrupt, secondary interrupt
// port 3 interrupts
.bm_tx_interrupt3(bm_tx_interrupt3),
.bm_rx_interrupt3(bm_rx_interrupt3),
.bm_control_interrupt3(bm_control_interrupt3),
.pcs_int3(pcs_int3),	  // pcs link down interrupt, secondary interrupt
//
.xmac_debug0(xmac_debug0),
.xpcs_debug0(xpcs_debug0),
.mac_debug_sel0(mac_debug_sel0),
.xmac_debug1(xmac_debug1),
.xpcs_debug1(xpcs_debug1),
.esrctl_debug(esrctl_debug[31:0]),
// outputs			      
.reset(reset),
.mac_debug_port(mac_debug_port[31:0]),
.sel_xmac0(sel_xmac0),
.sel_xpcs0(sel_xpcs0),
.sel_pcs0 (sel_pcs0 ),
.sel_xmac1(sel_xmac1),
.sel_xpcs1(sel_xpcs1),
.sel_pcs1 (sel_pcs1 ),
.sel_bmac2(sel_bmac2),
.sel_pcs2 (sel_pcs2 ),
.sel_bmac3(sel_bmac3),
.sel_pcs3 (sel_pcs3 ),
.sel_esr(sel_esr),
.sel_mif(sel_mif),
.pio_addr(pio_addr[16:0]),
.pio_rd(pio_rd),
.pio_wdata(pio_wdata),
.mac_pio_intr0(mac_pio_intr0),// port 0 interrupt
.mac_pio_intr1(mac_pio_intr1),// port 1 interrupt
.mac_pio_intr2(mac_pio_intr2),// port 2 interrupt
.mac_pio_intr3(mac_pio_intr3),// port 3 interrupt
.mac_pio_err(mac_pio_err)
	);
// end of mac_pio_intf isntantiation

/****************************************************************
 * port0: xmac_2pcs_core
 ****************************************************************/
 xmac_2pcs_core  xmac_2pcs_core_port0(
// xmac_core signals
/* ------------- xmac clocks ---------------------------------- */   
.clk(clk),            // from system clock
.tx_clk(tx_clk0),     // from clock mux
.tx_clk_312mhz(tx_clk_312mhz0),
.tx_nbclk(tx_nbclk0), // from clock mux
.rx_clk(rx_clk0),     // from clock mux
.rx_nbclk(rx_nbclk0), // from clock mux
.sys_clk_count(sys_clk_count0[2:0]),
.tx_heart_beat_timer(tx_heart_beat_timer0),
.rx_heart_beat_timer(rx_heart_beat_timer0),
/* -------------  shared MII/GMII Interface ------------------- */
.gmii_rxd(gmii_rxd0),
.gmii_rx_dv(gmii_rx_dv0),
.gmii_rx_err(gmii_rx_err0),
.gmii_txd(gmii_txd0),
.gmii_tx_en(gmii_tx_en0),
.gmii_tx_err(gmii_tx_err0),
/* ------------- XGMII Interface ------------------------------ */
.xgmii_rxc(4'b0),
.xgmii_rxd(32'b0),
.xgmii_txc(xgmii_txc0[3:0]),
.xgmii_txd(xgmii_txd0[31:0]),
/* ------------- xmac pio Interface --------------------------- */
.pio_core_reset(reset|mac_reset_port0),// becomes hw_reset
.pio_core_sel_xmac(sel_xmac0),         // sel
.pio_ack_xmac(ack_xmac0),              // ack
.pio_rd(pio_rd),                       // r/w_
.pio_addr(pio_addr[11:3]),             // address
.pio_wr_data(pio_wdata),               // wr_data
.pio_rd_data_xmac(rdata_xmac0),        // rd_data
.pio_err_xmac(pio_err_xmac0),
.txmac_interrupt(txmac_interrupt0),
.rxmac_interrupt(rxmac_interrupt0),
.xmac_fc_interrupt(xmac_fc_interrupt0),
/* ------------- xpcs pio Interface --------------------------- */
.rdata_xpcs(rdata_xpcs0),              // rd_data
.sel_xpcs(sel_xpcs0),                  // sel
.ack_xpcs(ack_xpcs0),                  // ack
.pio_err_xpcs(pio_err_xpcs0),		       
.xpcs_interrupt(xpcs_interrupt0),
/* ------------- Tx DMA Interface ----------------------------- */
.txmac_opp_req(mac_txc_req0),
.opp_txmac_ack(txc_mac_ack0),
.opp_txmac_tag(txc_mac_tag0),
.opp_txmac_data(txc_mac_data0),
.opp_txmac_stat(txc_mac_stat0),
.opp_txmac_abort(txc_mac_abort0),
/* ------------- Rx DMA Interface ----------------------------- */
.ipp_rxmac_req(rxc_mac_req0),
.rxmac_ipp_ack(mac_rxc_ack0),
.rxmac_ipp_tag(mac_rxc_tag0),
.rxmac_ipp_data(mac_rxc_data0),        // {64 bit data}
.rxmac_ipp_ctrl(mac_rxc_ctrl0),
.rxmac_ipp_stat(mac_rxc_stat0),
/* ------------- xmac_xpcs_clk_mux control signals ------------ */
.sel_clk_25mhz(sel_clk_25mhz0),
.loopback(loopback0),
.sel_por_clk_src(sel_por_clk_src0),
.mii_mode(mii_mode0),
.gmii_mode(gmii_mode0),
.xgmii_mode(xgmii_mode0),
.pcs_bypass(pcs_bypass0),
.xpcs_loopback(xpcs_loopback0),
/* ------------- PCS related Interface ------------------------ */
/*************
 * phy_dpath signals
 *************/
.gmii_crs(1'b0),      	         // from external gmii interface
.gmii_col(1'b0),	         // from external gmii interface
/************
 * pcs signals
 ************/
.odd_rx(odd_rx0),       
.serdes_rdy(serdes_rdy0_0),      // ch0 serdes 0
.signal_detect(signal_detect0_0),// ch0 serdes 0
.rx_code_group(rx_code_group0),  // from internal serdes
.tx_code_group(tx_code_group0),  // to internal serdes
.pcs_pio_req(sel_pcs0),
.pcs_pio_err(pio_err_pcs0),				      
.pcs_pio_ack(ack_pcs0),	 // pio acknowledge
.pcs_pio_rd_data(rdata_pcs0), // pio read data out
.pcs_int(pcs_int0),	 // pcs link down interrupt, secondary interrupt
/* ------------- xPCS Interface ------------------------------- */
// rx xpcs signals	
.xserdes_rdy(xserdes_rdy_0),
.xsignal_detect(xsignal_detect_0[3:0]),
.rbc0_a(rbc0_a0),
.rbc0_b(rbc0_b0),
.rbc0_c(rbc0_c0),
.rbc0_d(rbc0_d0),
// rx PMD related signals
.link_up_led(xaui_link_led_0),	 // signal to on-board LED, low pulse elongated
.activity_led(xaui_act_led_0),
.xrx_code_group(xrx_code_group0[39:0]), // symbol received from link
.xtx_code_group(xtx_code_group0[39:0]), // symbol to send over link
.MDINT(MDINT0),
/* ------------- debug Interface ------------------------------ */
.xmac_debug(xmac_debug0),
.xpcs_debug(xpcs_debug0),
.mac_debug_sel(mac_debug_sel0)
				   );
// end of xmac_2pcs_core port0 instantiation


/****************************************************************
 * port1: xmac_2pcs_core
 ****************************************************************/
 xmac_2pcs_core  xmac_2pcs_core_port1(
// xmac_core signals
/* ------------- xmac clocks ---------------------------------- */
.clk(clk),            // from system clock
.tx_clk(tx_clk1),     // from clock mux
.tx_clk_312mhz(tx_clk_312mhz1),
.tx_nbclk(tx_nbclk1), // from clock mux
.rx_clk(rx_clk1),     // from clock mux
.rx_nbclk(rx_nbclk1), // from clock mux
.sys_clk_count(sys_clk_count1[2:0]),
.tx_heart_beat_timer(tx_heart_beat_timer1),
.rx_heart_beat_timer(rx_heart_beat_timer1),
/* -------------  shared MII/GMII Interface ------------------- */
.gmii_rxd(gmii_rxd1),
.gmii_rx_dv(gmii_rx_dv1),
.gmii_rx_err(gmii_rx_err1),
.gmii_txd(gmii_txd1),
.gmii_tx_en(gmii_tx_en1),
.gmii_tx_err(gmii_tx_err1),
/* ------------- XGMII Interface ------------------------------ */
.xgmii_rxc(4'b0),
.xgmii_rxd(32'b0),
.xgmii_txc(xgmii_txc1[3:0]),
.xgmii_txd(xgmii_txd1[31:0]),
/* ------------- xmac pio Interface --------------------------- */
.pio_core_reset(reset|mac_reset_port1),// becomes hw_reset
.pio_core_sel_xmac(sel_xmac1),         // sel
.pio_ack_xmac(ack_xmac1),              // ack
.pio_rd(pio_rd),                       // r/w_
.pio_addr(pio_addr[11:3]),             // address
.pio_wr_data(pio_wdata),               // wr_data
.pio_rd_data_xmac(rdata_xmac1),        // rd_data
.pio_err_xmac(pio_err_xmac1),
.txmac_interrupt(txmac_interrupt1),
.rxmac_interrupt(rxmac_interrupt1),
.xmac_fc_interrupt(xmac_fc_interrupt1),
/* ------------- xpcs pio Interface --------------------------- */
.rdata_xpcs(rdata_xpcs1),              // rd_data
.sel_xpcs(sel_xpcs1),                  // sel
.ack_xpcs(ack_xpcs1),                  // ack
.pio_err_xpcs(pio_err_xpcs1),		       
.xpcs_interrupt(xpcs_interrupt1),
/* ------------- Tx DMA Interface ----------------------------- */
.txmac_opp_req(mac_txc_req1),
.opp_txmac_ack(txc_mac_ack1),
.opp_txmac_tag(txc_mac_tag1),
.opp_txmac_data(txc_mac_data1),
.opp_txmac_stat(txc_mac_stat1),
.opp_txmac_abort(txc_mac_abort1),
/* ------------- Rx DMA Interface ----------------------------- */
.ipp_rxmac_req(rxc_mac_req1),
.rxmac_ipp_ack(mac_rxc_ack1),
.rxmac_ipp_tag(mac_rxc_tag1),
.rxmac_ipp_data(mac_rxc_data1),        // {64 bit data}
.rxmac_ipp_ctrl(mac_rxc_ctrl1),
.rxmac_ipp_stat(mac_rxc_stat1),
/* ------------- xmac_xpcs_clk_mux control signals ------------ */
.sel_clk_25mhz(sel_clk_25mhz1),
.loopback(loopback1),
.sel_por_clk_src(sel_por_clk_src1),
.mii_mode(mii_mode1),
.gmii_mode(gmii_mode1),
.xgmii_mode(xgmii_mode1),
.pcs_bypass(pcs_bypass1),
.xpcs_loopback(xpcs_loopback1),				      
/* ------------- PCS related Interface ------------------------ */
/*************
 * phy_dpath signals
 *************/
.gmii_crs(1'b1),	 // from external gmii interface	
.gmii_col(1'b1),	 // from external gmii interface
/************
 * pcs signals
 ************/
.odd_rx(odd_rx1),       
.serdes_rdy(serdes_rdy0_1),      // ch0 serdes 1
.signal_detect(signal_detect0_1),// ch0 serdes 1
.rx_code_group(rx_code_group1),  // from internal serdes
.tx_code_group(tx_code_group1),  // to internal serdes
.pcs_pio_req(sel_pcs1),
.pcs_pio_err(pio_err_pcs1),				      
.pcs_pio_ack(ack_pcs1),	 // pio acknowledge
.pcs_pio_rd_data(rdata_pcs1), // pio read data out
.pcs_int(pcs_int1),	 // pcs link down interrupt, secondary interrupt
/* ------------- xPCS Interface ------------------------------- */
// rx xpcs signals	
.xserdes_rdy(xserdes_rdy_1),
.xsignal_detect(xsignal_detect_1[3:0]),
.rbc0_a(rbc0_a1),
.rbc0_b(rbc0_b1),
.rbc0_c(rbc0_c1),
.rbc0_d(rbc0_d1),
// rx PMD related signals
.link_up_led(xaui_link_led_1),	 // signal to on-board LED, low pulse elongated
.activity_led(xaui_act_led_1),
.xrx_code_group(xrx_code_group1[39:0]), // symbol received from link
.xtx_code_group(xtx_code_group1[39:0]), // symbol to send over link
.MDINT(MDINT1),
/* ------------- debug Interface ------------------------------ */
.xmac_debug(xmac_debug1),
.xpcs_debug(xpcs_debug1),
.mac_debug_sel(mac_debug_sel1)
				   );
// end of xmac_2pcs_core port1 instantiation


/****************************************************************
 *  ethernet serdes data path 
 ****************************************************************/

sphy_dpath2 sphy_dpath2(
.blunt_end_loopback(blunt_end_loopback),
.tcu_scan_en(tcu_scan_en),           
// ---- port 0 serdes 0
.xgmii_mode0(xgmii_mode0),
// tx side signals
.tx_nbclk0(tx_nbclk0),
.tx_clk_312mhz0(tx_clk_312mhz0),
.xtx_code_group0(xtx_code_group0),
.tx_code_group0(tx_code_group0),
.mac_esr_txd0_0(mac_esr_txd0_0),
.mac_esr_txd1_0(mac_esr_txd1_0),
.mac_esr_txd2_0(mac_esr_txd2_0),
.mac_esr_txd3_0(mac_esr_txd3_0),
// rx side signals
.rbc0_a0(rbc0_a0),
.rbc0_b0(rbc0_b0),
.rbc0_c0(rbc0_c0),
.rbc0_d0(rbc0_d0),
.rx_nbclk0(rx_nbclk0),
.esr_mac_rxd0_0(esr_mac_rxd0_0),
.esr_mac_rxd1_0(esr_mac_rxd1_0),
.esr_mac_rxd2_0(esr_mac_rxd2_0),
.esr_mac_rxd3_0(esr_mac_rxd3_0),
.esr_mac_oddcg0_0(esr_mac_oddcg0_0),
.odd_rx0(odd_rx0),
.xrx_code_group0(xrx_code_group0),
.rx_code_group0(rx_code_group0),
// ---- port 1 serdes1
.xgmii_mode1(xgmii_mode1),
// tx side signals
.tx_nbclk1(tx_nbclk1),
.tx_clk_312mhz1(tx_clk_312mhz1),
.xtx_code_group1(xtx_code_group1),
.tx_code_group1(tx_code_group1),
.mac_esr_txd0_1(mac_esr_txd0_1),
.mac_esr_txd1_1(mac_esr_txd1_1),
.mac_esr_txd2_1(mac_esr_txd2_1),
.mac_esr_txd3_1(mac_esr_txd3_1),
// rx side signals
.rbc0_a1(rbc0_a1),
.rbc0_b1(rbc0_b1),
.rbc0_c1(rbc0_c1),
.rbc0_d1(rbc0_d1),
.rx_nbclk1(rx_nbclk1),
.esr_mac_rxd0_1(esr_mac_rxd0_1),
.esr_mac_rxd1_1(esr_mac_rxd1_1),
.esr_mac_rxd2_1(esr_mac_rxd2_1),
.esr_mac_rxd3_1(esr_mac_rxd3_1),
.esr_mac_oddcg0_1(esr_mac_oddcg0_1),
.odd_rx1(odd_rx1),
.xrx_code_group1(xrx_code_group1),
.rx_code_group1(rx_code_group1)
		  );
// end of serdes dpath2 instantiation


/****************************************************************
 * esr control instantiation
 ****************************************************************/
esr_ctl2 esr_ctl2( 
.pio_core_reset(reset),
.clk(clk),
.blunt_end_loopback(blunt_end_loopback),
// pio interface
.pio_addr(pio_addr[11:3]), // pio global signal
.pio_rd(pio_rd),           // pio global signal
.pio_wdata(pio_wdata),     // pio global signal
.sel_esr(sel_esr),
.ack_esr(ack_esr),
.rdata_esr(rdata_esr),
.pio_err_esr(pio_err_esr),
.serdes_reset_0(serdes_reset_0),
.serdes_reset_1(serdes_reset_1),
// port0 xpcs, pcs signals
.esr_mac_lock_0(esr_mac_lock_0),
.esr_mac_los_0(esr_mac_los_0[3:0]),
.serdes_rdy0_0(serdes_rdy0_0),
.signal_detect0_0(signal_detect0_0),
.xserdes_rdy_0(xserdes_rdy_0),
.xsignal_detect_0(xsignal_detect_0[3:0]),
// port1 xpcs, pcs signals
.esr_mac_lock_1(esr_mac_lock_1),
.esr_mac_los_1(esr_mac_los_1[3:0]),
.serdes_rdy0_1(serdes_rdy0_1),
.signal_detect0_1(signal_detect0_1),
.xserdes_rdy_1(xserdes_rdy_1),
.xsignal_detect_1(xsignal_detect_1[3:0]),
/* ----- debug data ----- */		 
// ---- port 0 serdes 0
// tx side signals
.xtx_code_group0(xtx_code_group0),
.tx_code_group0(tx_code_group0),
.mac_esr_txd0_0(mac_esr_txd0_0),
.mac_esr_txd1_0(mac_esr_txd1_0),
.mac_esr_txd2_0(mac_esr_txd2_0),
.mac_esr_txd3_0(mac_esr_txd3_0),
// rx side signals
.esr_mac_rxd0_0(esr_mac_rxd0_0),
.esr_mac_rxd1_0(esr_mac_rxd1_0),
.esr_mac_rxd2_0(esr_mac_rxd2_0),
.esr_mac_rxd3_0(esr_mac_rxd3_0),
.xrx_code_group0(xrx_code_group0),
.rx_code_group0(rx_code_group0),
// ---- port 1 serdes1
// tx side signals
.xtx_code_group1(xtx_code_group1),
.tx_code_group1(tx_code_group1),
.mac_esr_txd0_1(mac_esr_txd0_1),
.mac_esr_txd1_1(mac_esr_txd1_1),
.mac_esr_txd2_1(mac_esr_txd2_1),
.mac_esr_txd3_1(mac_esr_txd3_1),
// rx side signals
.esr_mac_rxd0_1(esr_mac_rxd0_1),
.esr_mac_rxd1_1(esr_mac_rxd1_1),
.esr_mac_rxd2_1(esr_mac_rxd2_1),
.esr_mac_rxd3_1(esr_mac_rxd3_1),
.xrx_code_group1(xrx_code_group1),
.rx_code_group1(rx_code_group1),
.esrctl_debug(esrctl_debug[31:0])
 );
// end of esr control instantiation

mif mif
  ( 
   .clk					(clk),
   .pio_core_reset			(reset),
   .sel_mif				(sel_mif),
   .pio_rd				(pio_rd),
   .pio_addr				(pio_addr[11:3]),
   .pio_wdata				(pio_wdata[31:0]),
   .ack_mif				(ack_mif),
   .rdata_mif				(rdata_mif[31:0]),
   .pio_err_mif				(pio_err_mif),
   .atca_GE                             (atca_GE),
   .MDINT0                              (MDINT0),
   .MDINT1                              (MDINT1),
   .PHY_MDINT0_L                        (xaui_mdint0_l),
   .PHY_MDINT1_L                        (xaui_mdint1_l),
   // mdio output signals
   .mdclk				(mdclk),
   .mdo					(mdo),
   .mif_pio_intr			(mif_pio_intr),
   // mdio input signals
   .mdi					(mdi),
   .mdi_0				(mdi_0),
   .mdi_1				(mdi_1),
   .mdi_2                               (1'b0));
  
   
endmodule // mac_2ports
