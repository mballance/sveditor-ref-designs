// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sphy_dpath2.v
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
 * File Name    : sphy_dpath2 
 * Author Name  : John Lo
 * Description  : mac to serdes physical data path (sphy_dpath). 
 *                TI recommended to use channel 1 tx clk for 10G.
 *                Due to atca_GE, channel 0 esr_mac_tclk_0,1 is used.
 *  
 *                This module is intended to be place right on top of 
 *                XAUI serdes to help on closing timing when no source
 *                synchronous tx clock is available in 10G mode. 
 *
 *                sphy_dpath2 works closely with esr_ctl2, phy_clock_2ports. 
 *                The phy_clock_2ports is clock path.
 *                The sphy_dpath2  is data path. 
 *                The control path is esr_ctl2.
 *                When doing changes/modifications make sure 
 *                phy_clock_2ports , sphy_dpath2 and esr_ctl2 are in sync.
 *
 * Parent Module: mac
 * Child  Module: none
 * Interface Mod:  
 * Date Created : 10/04/01
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification :
 * 
 * Synthesis Notes: 
 * 
 *****************************************************************/

`include  "xmac.h"
 
module sphy_dpath2(
blunt_end_loopback,
tcu_scan_en,
// ---- port 0 serdes 0
xgmii_mode0,
// tx side signals
tx_nbclk0,
tx_clk_312mhz0,
xtx_code_group0,
tx_code_group0,
mac_esr_txd0_0,
mac_esr_txd1_0,
mac_esr_txd2_0,
mac_esr_txd3_0,
// rx side signals
rbc0_a0,
rbc0_b0,
rbc0_c0,
rbc0_d0,
rx_nbclk0,
esr_mac_rxd0_0,
esr_mac_rxd1_0,
esr_mac_rxd2_0,
esr_mac_rxd3_0,
esr_mac_oddcg0_0,
odd_rx0,
xrx_code_group0,
rx_code_group0,
// ----  port 1 serdes 1
xgmii_mode1,
// tx side signals
tx_nbclk1,
tx_clk_312mhz1,
xtx_code_group1,
tx_code_group1,
mac_esr_txd0_1,
mac_esr_txd1_1,
mac_esr_txd2_1,
mac_esr_txd3_1,
// rx side signals
rbc0_a1,
rbc0_b1,
rbc0_c1,
rbc0_d1,
rx_nbclk1,
esr_mac_rxd0_1,
esr_mac_rxd1_1,
esr_mac_rxd2_1,
esr_mac_rxd3_1,
esr_mac_oddcg0_1,
odd_rx1,
xrx_code_group1,
rx_code_group1
		  );

   input           blunt_end_loopback;
   input 	   tcu_scan_en;
                   // ----- port 0 serdes 0
   input 	   xgmii_mode0;
                   // tx side signals
   input 	   tx_nbclk0;
   input 	   tx_clk_312mhz0;
   input  [39:0]   xtx_code_group0;
   input  [9:0]    tx_code_group0;
   output [9:0]    mac_esr_txd0_0;
   output [9:0]    mac_esr_txd1_0;
   output [9:0]    mac_esr_txd2_0;
   output [9:0]    mac_esr_txd3_0;
                   // rx side signals
   input 	   rbc0_a0;
   input 	   rbc0_b0;
   input 	   rbc0_c0;
   input 	   rbc0_d0;
   input 	   rx_nbclk0;
   input  [9:0]    esr_mac_rxd0_0;
   input  [9:0]    esr_mac_rxd1_0;
   input  [9:0]    esr_mac_rxd2_0;
   input  [9:0]    esr_mac_rxd3_0;
   input           esr_mac_oddcg0_0;
   output 	   odd_rx0;
   output [39:0]   xrx_code_group0;
   output [9:0]    rx_code_group0;
                   // ----- port 1 serdes 1
   input 	   xgmii_mode1;
                   // tx side signals
   input 	   tx_nbclk1;
   input 	   tx_clk_312mhz1;
   input  [39:0]   xtx_code_group1;
   input  [9:0]    tx_code_group1;
   output [9:0]    mac_esr_txd0_1;
   output [9:0]    mac_esr_txd1_1;
   output [9:0]    mac_esr_txd2_1;
   output [9:0]    mac_esr_txd3_1;
                   // rx side signals
   input 	   rbc0_a1;
   input 	   rbc0_b1;
   input 	   rbc0_c1;
   input 	   rbc0_d1;
   input 	   rx_nbclk1;
   input  [9:0]    esr_mac_rxd0_1;
   input  [9:0]    esr_mac_rxd1_1;
   input  [9:0]    esr_mac_rxd2_1;
   input  [9:0]    esr_mac_rxd3_1;
   input           esr_mac_oddcg0_1;
   output 	   odd_rx1;
   output [39:0]   xrx_code_group1;
   output [9:0]    rx_code_group1;

                   // ----- port 0 serdes 0
   wire 	   xgmii_mode0;
   wire 	   tx_clk_312mhz0;
                   // tx side signals
   wire [39:0]     xtx_code_group0;
   wire [39:0]     xtx_code_group_reg0;
   wire [39:0]     xtx_code_group_reg_latch0;
   wire [9:0] 	   tx_code_group_latch0;
   wire [9:0] 	   tx_code_group0;
   wire [9:0]      mac_esr_txd0_0;
   wire [9:0]      mac_esr_txd1_0;
   wire [9:0]      mac_esr_txd2_0;
   wire [9:0]      mac_esr_txd3_0;
   wire [9:0]      mac_esr_txd0_0_p1;
   wire [9:0]      mac_esr_txd1_0_p1;
   wire [9:0]      mac_esr_txd2_0_p1;
   wire [9:0]      mac_esr_txd3_0_p1;
                   // rx side signals
   wire [9:0]      esr_mac_rxd0_0;
   wire [9:0]      esr_mac_rxd1_0;
   wire [9:0]      esr_mac_rxd2_0;
   wire [9:0]      esr_mac_rxd3_0;
   wire [9:0]      esr_mac_rxd0_0_swap;
   wire [9:0]      esr_mac_rxd1_0_swap;
   wire [9:0]      esr_mac_rxd2_0_swap;
   wire [9:0]      esr_mac_rxd3_0_swap;
   wire [9:0]      esr_mac_rxd0_0_blunt;
   wire [9:0]      esr_mac_rxd1_0_blunt;
   wire [9:0]      esr_mac_rxd2_0_blunt;
   wire [9:0]      esr_mac_rxd3_0_blunt;
   wire [39:0]     xrx_code_group0;
   wire [9:0]      rx_code_group0;
                   // ----- port 1 serdes 1
   wire 	   xgmii_mode1;
   wire 	   tx_clk_312mhz1;
                   // tx side signals
   wire [39:0]     xtx_code_group1;
   wire [39:0]     xtx_code_group_reg1;
   wire [39:0]     xtx_code_group_reg_latch1;
   wire [9:0] 	   tx_code_group1;
   wire [9:0] 	   tx_code_group_latch1;
   wire [9:0]      mac_esr_txd0_1;
   wire [9:0]      mac_esr_txd1_1;
   wire [9:0]      mac_esr_txd2_1;
   wire [9:0]      mac_esr_txd3_1;
   wire [9:0]      mac_esr_txd0_1_p1;
   wire [9:0]      mac_esr_txd1_1_p1;
   wire [9:0]      mac_esr_txd2_1_p1;
   wire [9:0]      mac_esr_txd3_1_p1;
                   // rx side signals
   wire [9:0]      esr_mac_rxd0_1;
   wire [9:0]      esr_mac_rxd1_1;
   wire [9:0]      esr_mac_rxd2_1;
   wire [9:0]      esr_mac_rxd3_1;
   wire [9:0]      esr_mac_rxd0_1_swap;
   wire [9:0]      esr_mac_rxd1_1_swap;
   wire [9:0]      esr_mac_rxd2_1_swap;
   wire [9:0]      esr_mac_rxd3_1_swap;
   wire [9:0]      esr_mac_rxd0_1_blunt;
   wire [9:0]      esr_mac_rxd1_1_blunt;
   wire [9:0]      esr_mac_rxd2_1_blunt;
   wire [9:0]      esr_mac_rxd3_1_blunt;
   wire [39:0]     xrx_code_group1;
   wire [9:0]      rx_code_group1;
   
/***********************************************
 * port 0  
 ***********************************************/
/* ------------ transmit path ------------- */
RegDff  #(40) xtx_code_group_reg0_RegDff (.din(xtx_code_group0[39:0]),.clk(tx_clk_312mhz0),.qout(xtx_code_group_reg0[39:0]));  

n2_txd_blatch port0_n2_txd_blatch
  (
   // Outputs
   .xtx_code_group_reg_latch		(xtx_code_group_reg_latch0[39:0]),
   .tx_code_group_latch			(tx_code_group_latch0[9:0]),
   // Inputs
   .tx_nbclk				(tx_nbclk0),
   .tx_clk_312mhz			(tx_clk_312mhz0),
   .xtx_code_group_reg			(xtx_code_group_reg0[39:0]),
   .tx_code_group			(tx_code_group0[9:0]));
   
 // 1G uses ch0 since mac_esr_tclk_0 is from ch0. 
xMUX_2to1 #(10)    mac_esr_txd0_0_p1_xMUX_2to1(.din0(tx_code_group_latch0[9:0]),.din1(xtx_code_group_reg_latch0[9:0]),.sel(xgmii_mode0),.dout(mac_esr_txd0_0_p1));
   assign          mac_esr_txd1_0_p1 =                                                xtx_code_group_reg_latch0[19:10];
   assign 	   mac_esr_txd2_0_p1 =                                                xtx_code_group_reg_latch0[29:20];
   assign 	   mac_esr_txd3_0_p1 =                                                xtx_code_group_reg_latch0[39:30];

// Final txd assembly and swapping
xMUX_2to1 #(10) mac_esr_txd0_0_xMUX (.din0(mac_esr_txd0_0_p1),
                                     .din1(esr_mac_rxd0_0_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd0_0[0],
				            mac_esr_txd0_0[1],
				            mac_esr_txd0_0[2],
				            mac_esr_txd0_0[3],
				            mac_esr_txd0_0[4],
				            mac_esr_txd0_0[5],
				            mac_esr_txd0_0[6],
				            mac_esr_txd0_0[7],
				            mac_esr_txd0_0[8],
				            mac_esr_txd0_0[9]}));
xMUX_2to1 #(10) mac_esr_txd1_0_xMUX (.din0(mac_esr_txd1_0_p1),
                                     .din1(esr_mac_rxd1_0_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd1_0[0],
				            mac_esr_txd1_0[1],
				            mac_esr_txd1_0[2],
				            mac_esr_txd1_0[3],
				            mac_esr_txd1_0[4],
				            mac_esr_txd1_0[5],
				            mac_esr_txd1_0[6],
				            mac_esr_txd1_0[7],
				            mac_esr_txd1_0[8],
				            mac_esr_txd1_0[9]}));
xMUX_2to1 #(10) mac_esr_txd2_0_xMUX (.din0(mac_esr_txd2_0_p1),
                                     .din1(esr_mac_rxd2_0_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd2_0[0],
					    mac_esr_txd2_0[1],
					    mac_esr_txd2_0[2],
					    mac_esr_txd2_0[3],
					    mac_esr_txd2_0[4],
					    mac_esr_txd2_0[5],
					    mac_esr_txd2_0[6],
					    mac_esr_txd2_0[7],
					    mac_esr_txd2_0[8],
					    mac_esr_txd2_0[9]}));
		 
xMUX_2to1 #(10) mac_esr_txd3_0_xMUX (.din0(mac_esr_txd3_0_p1),
                                     .din1(esr_mac_rxd3_0_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd3_0[0],
 				            mac_esr_txd3_0[1],
 				            mac_esr_txd3_0[2],
 				            mac_esr_txd3_0[3],
 				            mac_esr_txd3_0[4],
 				            mac_esr_txd3_0[5],
 				            mac_esr_txd3_0[6],
 				            mac_esr_txd3_0[7],
 				            mac_esr_txd3_0[8],
 				            mac_esr_txd3_0[9]}));

/* ------------ receive path ------------- */
   /* ----- start swapping ----- */
   assign 	   esr_mac_rxd0_0_swap = {esr_mac_rxd0_0[0],
                                          esr_mac_rxd0_0[1],
                                          esr_mac_rxd0_0[2],
                                          esr_mac_rxd0_0[3],
                                          esr_mac_rxd0_0[4],
                                          esr_mac_rxd0_0[5],
                                          esr_mac_rxd0_0[6],
                                          esr_mac_rxd0_0[7],
                                          esr_mac_rxd0_0[8],
                                          esr_mac_rxd0_0[9]};

   assign 	   esr_mac_rxd1_0_swap = {esr_mac_rxd1_0[0],
                                          esr_mac_rxd1_0[1],
                                          esr_mac_rxd1_0[2],
                                          esr_mac_rxd1_0[3],
                                          esr_mac_rxd1_0[4],
                                          esr_mac_rxd1_0[5],
                                          esr_mac_rxd1_0[6],
                                          esr_mac_rxd1_0[7],
                                          esr_mac_rxd1_0[8],
                                          esr_mac_rxd1_0[9]};

   assign 	   esr_mac_rxd2_0_swap = {esr_mac_rxd2_0[0],
                                          esr_mac_rxd2_0[1],
                                          esr_mac_rxd2_0[2],
                                          esr_mac_rxd2_0[3],
                                          esr_mac_rxd2_0[4],
                                          esr_mac_rxd2_0[5],
                                          esr_mac_rxd2_0[6],
                                          esr_mac_rxd2_0[7],
                                          esr_mac_rxd2_0[8],
                                          esr_mac_rxd2_0[9]};

   assign 	   esr_mac_rxd3_0_swap = {esr_mac_rxd3_0[0],
                                          esr_mac_rxd3_0[1],
                                          esr_mac_rxd3_0[2],
                                          esr_mac_rxd3_0[3],
                                          esr_mac_rxd3_0[4],
                                          esr_mac_rxd3_0[5],
                                          esr_mac_rxd3_0[6],
                                          esr_mac_rxd3_0[7],
                                          esr_mac_rxd3_0[8],
                                          esr_mac_rxd3_0[9]};
   /* ----- end of swapping ---- */

   
// assign          xrx_code_group0= {esr_mac_rxd3_0_swap[9:0], // 10G
//                                   esr_mac_rxd2_0_swap[9:0],
//                                   esr_mac_rxd1_0_swap[9:0],
//                                   esr_mac_rxd0_0_swap[9:0]};
//
//                                   // ch0 is used for 1G
// assign 	   rx_code_group0 =  esr_mac_rxd0_0_swap[9:0]; // 1G, ch0
   
n2_rxd_alatch port0_n2_rxd_alatch
  (
   // Outputs
   .xrx_code_group			(xrx_code_group0[39:0]),
   .rx_code_group			(rx_code_group0[9:0]),
   // Inputs
   .tcu_scan_en                         (tcu_scan_en),
   .rx_nbclk			        (rx_nbclk0),
   .rbc0_d				(rbc0_d0),
   .rbc0_c				(rbc0_c0),
   .rbc0_b				(rbc0_b0),
   .rbc0_a				(rbc0_a0),
   .esr_mac_rxd 			({esr_mac_rxd3_0_swap[9:0],
					  esr_mac_rxd2_0_swap[9:0],
					  esr_mac_rxd1_0_swap[9:0],
					  esr_mac_rxd0_0_swap[9:0]}));

// per Carlos's and Jeff's request on fixing 1G hold time violation 6-12-06
RegDff  #(1) odd_rx0_RegDff (.din(esr_mac_oddcg0_0),.clk(~rx_nbclk0),.qout(odd_rx0));  

// 10G blunt loopback path 
RegDff  #(10) esr_mac_rxd0_0_blunt_RegDff (.din(xrx_code_group0[9:0]),  .clk(rbc0_a0),.qout(esr_mac_rxd0_0_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd1_0_blunt_RegDff (.din(xrx_code_group0[19:10]),.clk(rbc0_b0),.qout(esr_mac_rxd1_0_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd2_0_blunt_RegDff (.din(xrx_code_group0[29:20]),.clk(rbc0_c0),.qout(esr_mac_rxd2_0_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd3_0_blunt_RegDff (.din(xrx_code_group0[39:30]),.clk(rbc0_d0),.qout(esr_mac_rxd3_0_blunt[9:0]));  

/***********************************************
 * port 1  
 ***********************************************/
/* ------------ transmit path ------------- */
RegDff  #(40) xtx_code_group_reg1_RegDff (.din(xtx_code_group1[39:0]),.clk(tx_clk_312mhz1),.qout(xtx_code_group_reg1[39:0]));  

n2_txd_blatch port1_n2_txd_blatch
  (
   // Outputs
   .xtx_code_group_reg_latch		(xtx_code_group_reg_latch1[39:0]),
   .tx_code_group_latch			(tx_code_group_latch1[9:0]),
   // Inputs
   .tx_nbclk				(tx_nbclk1),
   .tx_clk_312mhz			(tx_clk_312mhz1),
   .xtx_code_group_reg			(xtx_code_group_reg1[39:0]),
   .tx_code_group			(tx_code_group1[9:0]));
   
 // 1G uses ch0 since mac_esr_tclk_0 is from ch0. 
xMUX_2to1 #(10)    mac_esr_txd0_1_p1_xMUX_2to1(.din0(tx_code_group_latch1[9:0]),.din1(xtx_code_group_reg_latch1[9:0]),.sel(xgmii_mode1),.dout(mac_esr_txd0_1_p1));
   assign          mac_esr_txd1_1_p1 =                                                xtx_code_group_reg_latch1[19:10];
   assign 	   mac_esr_txd2_1_p1 =                                                xtx_code_group_reg_latch1[29:20];
   assign 	   mac_esr_txd3_1_p1 =                                                xtx_code_group_reg_latch1[39:30];
   
// Final txd assembly and swapping
xMUX_2to1 #(10) mac_esr_txd0_1_xMUX (.din0(mac_esr_txd0_1_p1),
                                     .din1(esr_mac_rxd0_1_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd0_1[0],
				            mac_esr_txd0_1[1],
				            mac_esr_txd0_1[2],
				            mac_esr_txd0_1[3],
				            mac_esr_txd0_1[4],
				            mac_esr_txd0_1[5],
				            mac_esr_txd0_1[6],
				            mac_esr_txd0_1[7],
				            mac_esr_txd0_1[8],
				            mac_esr_txd0_1[9]}));
xMUX_2to1 #(10) mac_esr_txd1_1_xMUX (.din0(mac_esr_txd1_1_p1),
                                     .din1(esr_mac_rxd1_1_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd1_1[0],
				            mac_esr_txd1_1[1],
				            mac_esr_txd1_1[2],
				            mac_esr_txd1_1[3],
				            mac_esr_txd1_1[4],
				            mac_esr_txd1_1[5],
				            mac_esr_txd1_1[6],
				            mac_esr_txd1_1[7],
				            mac_esr_txd1_1[8],
				            mac_esr_txd1_1[9]}));
xMUX_2to1 #(10) mac_esr_txd2_1_xMUX (.din0(mac_esr_txd2_1_p1),
                                     .din1(esr_mac_rxd2_1_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd2_1[0],
					    mac_esr_txd2_1[1],
					    mac_esr_txd2_1[2],
					    mac_esr_txd2_1[3],
					    mac_esr_txd2_1[4],
					    mac_esr_txd2_1[5],
					    mac_esr_txd2_1[6],
					    mac_esr_txd2_1[7],
					    mac_esr_txd2_1[8],
					    mac_esr_txd2_1[9]}));
		 
xMUX_2to1 #(10) mac_esr_txd3_1_xMUX (.din0(mac_esr_txd3_1_p1),
                                     .din1(esr_mac_rxd3_1_blunt),
                                     .sel(blunt_end_loopback),
                                     .dout({mac_esr_txd3_1[0],
 				            mac_esr_txd3_1[1],
 				            mac_esr_txd3_1[2],
 				            mac_esr_txd3_1[3],
 				            mac_esr_txd3_1[4],
 				            mac_esr_txd3_1[5],
 				            mac_esr_txd3_1[6],
 				            mac_esr_txd3_1[7],
 				            mac_esr_txd3_1[8],
 				            mac_esr_txd3_1[9]}));

/* ------------ receive path ------------- */
   /* ----- start swapping ----- */
   assign 	   esr_mac_rxd0_1_swap = {esr_mac_rxd0_1[0],
                                          esr_mac_rxd0_1[1],
                                          esr_mac_rxd0_1[2],
                                          esr_mac_rxd0_1[3],
                                          esr_mac_rxd0_1[4],
                                          esr_mac_rxd0_1[5],
                                          esr_mac_rxd0_1[6],
                                          esr_mac_rxd0_1[7],
                                          esr_mac_rxd0_1[8],
                                          esr_mac_rxd0_1[9]};

   assign 	   esr_mac_rxd1_1_swap = {esr_mac_rxd1_1[0],
                                          esr_mac_rxd1_1[1],
                                          esr_mac_rxd1_1[2],
                                          esr_mac_rxd1_1[3],
                                          esr_mac_rxd1_1[4],
                                          esr_mac_rxd1_1[5],
                                          esr_mac_rxd1_1[6],
                                          esr_mac_rxd1_1[7],
                                          esr_mac_rxd1_1[8],
                                          esr_mac_rxd1_1[9]};

   assign 	   esr_mac_rxd2_1_swap = {esr_mac_rxd2_1[0],
                                          esr_mac_rxd2_1[1],
                                          esr_mac_rxd2_1[2],
                                          esr_mac_rxd2_1[3],
                                          esr_mac_rxd2_1[4],
                                          esr_mac_rxd2_1[5],
                                          esr_mac_rxd2_1[6],
                                          esr_mac_rxd2_1[7],
                                          esr_mac_rxd2_1[8],
                                          esr_mac_rxd2_1[9]};

   assign 	   esr_mac_rxd3_1_swap = {esr_mac_rxd3_1[0],
                                          esr_mac_rxd3_1[1],
                                          esr_mac_rxd3_1[2],
                                          esr_mac_rxd3_1[3],
                                          esr_mac_rxd3_1[4],
                                          esr_mac_rxd3_1[5],
                                          esr_mac_rxd3_1[6],
                                          esr_mac_rxd3_1[7],
                                          esr_mac_rxd3_1[8],
                                          esr_mac_rxd3_1[9]};
   /* ----- end of swapping ---- */


// assign          xrx_code_group1= {esr_mac_rxd3_1_swap[9:0], // 10G
//                                   esr_mac_rxd2_1_swap[9:0],
//                                   esr_mac_rxd1_1_swap[9:0],
//                                   esr_mac_rxd0_1_swap[9:0]};
//
//                                   // ch1 is used for 1G
// assign 	   rx_code_group1 =  esr_mac_rxd0_1_swap[9:0]; // 1G, ch0
   
n2_rxd_alatch port1_n2_rxd_alatch
  (
   // Outputs
   .xrx_code_group			(xrx_code_group1[39:0]),
   .rx_code_group			(rx_code_group1[9:0]),
   // Inputs
   .tcu_scan_en                         (tcu_scan_en),
   .rx_nbclk			        (rx_nbclk1),
   .rbc0_d				(rbc0_d1),
   .rbc0_c				(rbc0_c1),
   .rbc0_b				(rbc0_b1),
   .rbc0_a				(rbc0_a1),
   .esr_mac_rxd 			({esr_mac_rxd3_1_swap[9:0],
					  esr_mac_rxd2_1_swap[9:0],
					  esr_mac_rxd1_1_swap[9:0],
					  esr_mac_rxd0_1_swap[9:0]}));

// per Carlos's and Jeff's request on fixing 1G hold time violation 6-12-06
RegDff  #(1) odd_rx1_RegDff (.din(esr_mac_oddcg0_1),.clk(~rx_nbclk1),.qout(odd_rx1));  

// 10G blunt loopback path 
RegDff  #(10) esr_mac_rxd0_1_blunt_RegDff (.din(xrx_code_group1[9:0]),  .clk(rbc0_a1),.qout(esr_mac_rxd0_1_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd1_1_blunt_RegDff (.din(xrx_code_group1[19:10]),.clk(rbc0_b1),.qout(esr_mac_rxd1_1_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd2_1_blunt_RegDff (.din(xrx_code_group1[29:20]),.clk(rbc0_c1),.qout(esr_mac_rxd2_1_blunt[9:0]));  
RegDff  #(10) esr_mac_rxd3_1_blunt_RegDff (.din(xrx_code_group1[39:30]),.clk(rbc0_d1),.qout(esr_mac_rxd3_1_blunt[9:0]));  
   
endmodule // sphy_dpath2

