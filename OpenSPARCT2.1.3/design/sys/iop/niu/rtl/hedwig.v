// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: hedwig.v
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

/*************************************************************************
 *
 * File Name    : hedwig.v
 * Author Name  : John Lo
 * Description  : It contains two hedwig mdio modules.
 * Parent Module: 
 * Child  Module: 
 * Interface Mod: mac
 * Date Created : 11/23/2004
 *
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Design Notes : 1. It is OK to connect RXBCLK[i:0] to RXBCLKIN[i:0] directly.
 *                   According to an email from Iain Robertson <i-robertson@ti.com>
 *                   on Mon, 14 Jun 2004 12:55:14 +0100.
 * 
 * Modification : 1. Andre has changed hedwigh to all sync flops.
 *                   It needs clocks from phy_clock_top also.
 *                   Added clock inputs.
 *                   -by John Lo @Feb2-05
 *                
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "make_b8_macro.v"
`include  "mif.h"

module hedwig (/*AUTOARG*/
   // Outputs
   cfgtx0_0, cfgtx1_0, cfgtx2_0, cfgtx3_0, cfgrx0_0, cfgrx1_0, 
   cfgrx2_0, cfgrx3_0, cfgpll_0, testcfg_0, cfgtx0_1, cfgtx1_1, 
   cfgtx2_1, cfgtx3_1, cfgrx0_1, cfgrx1_1, cfgrx2_1, cfgrx3_1, 
   cfgpll_1, testcfg_1, esr_mac_oddcg0_0, esr_mac_los_0, 
   esr_mac_lock_0, esr_mac_oddcg0_1, esr_mac_los_1, esr_mac_lock_1, 
   BSRXP0_0, BSRXP1_0, BSRXP2_0, BSRXP3_0, BSRXN0_0, BSRXN1_0, 
   BSRXN2_0, BSRXN3_0, BSRXP0_1, BSRXP1_1, BSRXP2_1, BSRXP3_1, 
   BSRXN0_1, BSRXN1_1, BSRXN2_1, BSRXN3_1, mdi_0, mdi_1, 
   // Inputs
   ststx0_0, ststx1_0, ststx2_0, ststx3_0, stsrx0_0, stsrx1_0, 
   stsrx2_0, stsrx3_0, stspll_0, esr_mac_rclk_0, esr_mac_tclk_0, 
   serdes_reset_0, ststx0_1, ststx1_1, ststx2_1, ststx3_1, stsrx0_1, 
   stsrx1_1, stsrx2_1, stsrx3_1, stspll_1, esr_mac_rclk_1, 
   esr_mac_tclk_1, serdes_reset_1, tcu_sbs_enbstx, tcu_sbs_enbsrx, 
   cfgtx0_0_17, cfgtx1_0_17, cfgtx2_0_17, cfgtx3_0_17, cfgtx0_1_17, 
   cfgtx1_1_17, cfgtx2_1_17, cfgtx3_1_17, cfgrx0_0_b25_b24, 
   cfgrx1_0_b25_b24, cfgrx2_0_b25_b24, cfgrx3_0_b25_b24, 
   cfgrx0_1_b25_b24, cfgrx1_1_b25_b24, cfgrx2_1_b25_b24, 
   cfgrx3_1_b25_b24, tcu_scan_mode, gl_mac_io_clk_stop, tcu_scan_en, 
   tcu_sbs_enbspt, mac_125rx_test_clk, niu_reset_l, mdclk, mdo
   );
                                   // serdes global signals
                                   // serdes_0
   output [19:0] 		   cfgtx0_0;         // to malfoy
   output [19:0] 		   cfgtx1_0;         // to malfoy
   output [19:0] 		   cfgtx2_0;         // to malfoy
   output [19:0] 		   cfgtx3_0;         // to malfoy
   output [27:0] 		   cfgrx0_0;         // to malfoy
   output [27:0] 		   cfgrx1_0;         // to malfoy
   output [27:0] 		   cfgrx2_0;         // to malfoy
   output [27:0] 		   cfgrx3_0;         // to malfoy
   output [11:0] 		   cfgpll_0;         // to malfoy
   output [15:0] 		   testcfg_0;        // to malfoy
   input  [3:0] 		   ststx0_0;         // from malfoy
   input  [3:0] 		   ststx1_0;         // from malfoy
   input  [3:0] 		   ststx2_0;         // from malfoy
   input  [3:0] 		   ststx3_0;         // from malfoy
   input  [7:0] 		   stsrx0_0;         // from malfoy
   input  [7:0] 		   stsrx1_0;         // from malfoy
   input  [7:0] 		   stsrx2_0;         // from malfoy
   input  [7:0] 		   stsrx3_0;         // from malfoy
   input  [3:0] 		   stspll_0;         // from malfoy
   input  [3:0]			   esr_mac_rclk_0;   // from malfoy
   input             		   esr_mac_tclk_0;   // from malfoy
   input 			   serdes_reset_0;
                                   // serdes_1
   output [19:0] 		   cfgtx0_1;         // to malfoy
   output [19:0] 		   cfgtx1_1;         // to malfoy
   output [19:0] 		   cfgtx2_1;         // to malfoy
   output [19:0] 		   cfgtx3_1;         // to malfoy
   output [27:0] 		   cfgrx0_1;         // to malfoy
   output [27:0] 		   cfgrx1_1;         // to malfoy
   output [27:0] 		   cfgrx2_1;         // to malfoy
   output [27:0] 		   cfgrx3_1;         // to malfoy
   output [11:0] 		   cfgpll_1;         // to malfoy
   output [15:0] 		   testcfg_1;        // to malfoy
   input  [3:0] 		   ststx0_1;         // from malfoy
   input  [3:0] 		   ststx1_1;         // from malfoy
   input  [3:0] 		   ststx2_1;         // from malfoy
   input  [3:0] 		   ststx3_1;         // from malfoy
   input  [7:0] 		   stsrx0_1;         // from malfoy
   input  [7:0] 		   stsrx1_1;         // from malfoy
   input  [7:0] 		   stsrx2_1;         // from malfoy
   input  [7:0] 		   stsrx3_1;         // from malfoy
   input  [3:0] 		   stspll_1;         // from malfoy
   input  [3:0]			   esr_mac_rclk_1;   // from malfoy
   input            		   esr_mac_tclk_1;   // from malfoy
   input 			   serdes_reset_1;
                                   // mac signals
   output          		   esr_mac_oddcg0_0; // ch0 port0
   output [3:0] 		   esr_mac_los_0;
   output          		   esr_mac_lock_0;
   output          		   esr_mac_oddcg0_1; // ch0 port1  
   output [3:0] 		   esr_mac_los_1;
   output            		   esr_mac_lock_1;
                                   // from tcu
   input                           tcu_sbs_enbstx;      // from tcu
   input                           tcu_sbs_enbsrx;      // from tcu
   input                           cfgtx0_0_17;         // from esr_bscan
   input                           cfgtx1_0_17;         // from esr_bscan
   input                           cfgtx2_0_17;         // from esr_bscan
   input                           cfgtx3_0_17;         // from esr_bscan
   input                           cfgtx0_1_17;         // from esr_bscan
   input                           cfgtx1_1_17;         // from esr_bscan
   input                           cfgtx2_1_17;         // from esr_bscan
   input                           cfgtx3_1_17;         // from esr_bscan

   input	[1:0]		   cfgrx0_0_b25_b24;	// from esr_bscan
   input        [1:0]		   cfgrx1_0_b25_b24;	// from esr_bscan
   input        [1:0]		   cfgrx2_0_b25_b24;	// from esr_bscan
   input        [1:0]    	   cfgrx3_0_b25_b24;	// from esr_bscan

   input        [1:0]		   cfgrx0_1_b25_b24;	// from esr_bscan
   input        [1:0]		   cfgrx1_1_b25_b24;	// from esr_bscan
   input        [1:0]		   cfgrx2_1_b25_b24;	// from esr_bscan
   input        [1:0]    	   cfgrx3_1_b25_b24;	// from esr_bscan

                                   // scan
   input 			   tcu_scan_mode;
   input                           gl_mac_io_clk_stop;
   input                           tcu_scan_en;
   input			   tcu_sbs_enbspt;
   input                           mac_125rx_test_clk;
                                   // to esr_bscan.v
   output 			   BSRXP0_0;
   output 			   BSRXP1_0;
   output 			   BSRXP2_0;
   output 			   BSRXP3_0;
   output 			   BSRXN0_0;
   output 			   BSRXN1_0;
   output 			   BSRXN2_0;
   output 			   BSRXN3_0;
   output 			   BSRXP0_1;
   output 			   BSRXP1_1;
   output 			   BSRXP2_1;
   output 			   BSRXP3_1;
   output 			   BSRXN0_1;
   output 			   BSRXN1_1;
   output 			   BSRXN2_1;
   output 			   BSRXN3_1;
                                   // global signal
   input 			   niu_reset_l;
   input 			   mdclk;
   input 			   mdo;
   output 			   mdi_0;
   output 			   mdi_1;

   wire 			   gl_mac_io_clk_stop;
   wire 			   tcu_clk_stop = gl_mac_io_clk_stop;
   wire 			   niu_reset_l;
   wire				   hedwig_reset0;
   wire				   hedwig_reset1;
   wire				   hedwig_reset0_l;
   wire				   hedwig_reset1_l;
   wire 			   serdes_reset_0;
   wire 			   serdes_reset_1;
   wire 			   hedwig_serdes_reset_0;
   wire 			   hedwig_serdes_reset_1;
   wire 			   n2_mode = 1'b1;
                                   // For n2 mode, it was driven to "0".
                                   // BSINITCLK (per port) works with BSINRXPi & BSINRXNi in CFGRXi[25:24].
                                   // Both BSINRXPi & BSINRXNi are driven to "0".
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 	   mdoe_0;
   wire 	   mdoe_1;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
                   // to esr_bscan.v
   wire 	   BSRXP0_0;
   wire 	   BSRXP1_0;
   wire 	   BSRXP2_0;
   wire 	   BSRXP3_0;
   wire 	   BSRXN0_0;
   wire 	   BSRXN1_0;
   wire 	   BSRXN2_0;
   wire 	   BSRXN3_0;
   wire 	   BSRXP0_1;
   wire 	   BSRXP1_1;
   wire 	   BSRXP2_1;
   wire 	   BSRXP3_1;
   wire 	   BSRXN0_1;
   wire 	   BSRXN1_1;
   wire 	   BSRXN2_1;
   wire 	   BSRXN3_1;

   wire            esr_mac_tclk_0_mux;
   wire            esr_mac_tclk_1_mux;

   wire            esr_mac_tclk_0_buf;
   wire            esr_mac_tclk_1_buf;

   wire      [3:0] esr_mac_rclk_0_mux;
   wire      [3:0] esr_mac_rclk_1_mux;

   wire      [3:0] esr_mac_rclk_0_buf;
   wire      [3:0] esr_mac_rclk_1_buf;

   wire 	   tcu_clk_stop_tclk_0_sync;
   wire 	   tcu_clk_stop_tclk_1_sync;
   wire 	   tcu_clk_stop_rclk_0_0_sync;
   wire 	   tcu_clk_stop_rclk_0_1_sync;
   wire 	   tcu_clk_stop_rclk_0_2_sync;
   wire 	   tcu_clk_stop_rclk_0_3_sync;
   wire 	   tcu_clk_stop_rclk_1_0_sync;
   wire 	   tcu_clk_stop_rclk_1_1_sync;
   wire 	   tcu_clk_stop_rclk_1_2_sync;
   wire 	   tcu_clk_stop_rclk_1_3_sync;

   wire tcu_clk_stop_rclk_1_0_sync_mux;
   wire tcu_clk_stop_rclk_1_1_sync_mux;
   wire tcu_clk_stop_rclk_1_2_sync_mux;
   wire tcu_clk_stop_rclk_1_3_sync_mux;

   wire tcu_clk_stop_rclk_0_0_sync_mux;
   wire tcu_clk_stop_rclk_0_1_sync_mux;
   wire tcu_clk_stop_rclk_0_2_sync_mux;
   wire tcu_clk_stop_rclk_0_3_sync_mux;

   wire tcu_clk_stop_tclk_0_sync_mux;
   wire tcu_clk_stop_tclk_1_sync_mux;


// ***************************************************
// TX Port 0  Hedwig L1 clock headers and clock muxing
// ***************************************************
cl_a1_clk_mux2_8x tclk_0_mux (.in0(mac_125rx_test_clk), .in1(esr_mac_tclk_0), .sel0(tcu_scan_mode), .out(esr_mac_tclk_0_mux));

SYNC_CELL  SYNC_CELL_ST_TX_0_0(.D(tcu_clk_stop),.CP(esr_mac_tclk_0_mux),.Q(tcu_clk_stop_tclk_0_sync));

assign tcu_clk_stop_tclk_0_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_tclk_0_sync; 

cl_a1_l1hdr_12x hedwig_esr_mac_tclk_0_mux_l1 (
                        .l2clk(esr_mac_tclk_0_mux),
		        .se(tcu_scan_en),
		        .pce(1'b1),
			.pce_ov(1'b0),
		        .stop(tcu_clk_stop_tclk_0_sync_mux),
		        .l1clk(esr_mac_tclk_0_buf) );

// ***************************************************
// TX Port 1  Hedwig L1 clock headers and clock muxing
// ***************************************************
cl_a1_clk_mux2_8x tclk_1_mux (.in0(mac_125rx_test_clk), .in1(esr_mac_tclk_1), .sel0(tcu_scan_mode), .out(esr_mac_tclk_1_mux));

SYNC_CELL  SYNC_CELL_ST_TX_1_0(.D(tcu_clk_stop),.CP(esr_mac_tclk_1_mux),.Q(tcu_clk_stop_tclk_1_sync));

assign tcu_clk_stop_tclk_1_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_tclk_1_sync;

cl_a1_l1hdr_12x hedwig_esr_mac_tclk_1_mux_l1 (
			.l2clk(esr_mac_tclk_1_mux),
			.se(tcu_scan_en),
			.pce(1'b1),
			.pce_ov(1'b0),
			.stop(tcu_clk_stop_tclk_1_sync_mux),
			.l1clk(esr_mac_tclk_1_buf) );

// ***************************************************
// RX Port 0  Hedwig L1 clock headers and clock muxing
// ***************************************************

cl_a1_clk_mux2_8x rclk_0_mux_0 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_0[0]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_0_mux[0]));
cl_a1_clk_mux2_8x rclk_0_mux_1 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_0[1]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_0_mux[1]));
cl_a1_clk_mux2_8x rclk_0_mux_2 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_0[2]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_0_mux[2]));
cl_a1_clk_mux2_8x rclk_0_mux_3 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_0[3]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_0_mux[3]));

SYNC_CELL  SYNC_CELL_ST_RX_0_0(.D(tcu_clk_stop),.CP(esr_mac_rclk_0_mux[0]),.Q(tcu_clk_stop_rclk_0_0_sync));
SYNC_CELL  SYNC_CELL_ST_RX_0_1(.D(tcu_clk_stop),.CP(esr_mac_rclk_0_mux[1]),.Q(tcu_clk_stop_rclk_0_1_sync));
SYNC_CELL  SYNC_CELL_ST_RX_0_2(.D(tcu_clk_stop),.CP(esr_mac_rclk_0_mux[2]),.Q(tcu_clk_stop_rclk_0_2_sync));
SYNC_CELL  SYNC_CELL_ST_RX_0_3(.D(tcu_clk_stop),.CP(esr_mac_rclk_0_mux[3]),.Q(tcu_clk_stop_rclk_0_3_sync));

assign tcu_clk_stop_rclk_0_0_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_0_0_sync;
assign tcu_clk_stop_rclk_0_1_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_0_1_sync;
assign tcu_clk_stop_rclk_0_2_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_0_2_sync;
assign tcu_clk_stop_rclk_0_3_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_0_3_sync;

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_0_0_mux_l1 (
                        .l2clk(esr_mac_rclk_0_mux[0]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_0_0_sync_mux),
                        .l1clk(esr_mac_rclk_0_buf[0]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_0_1_mux_l1 (
                        .l2clk(esr_mac_rclk_0_mux[1]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_0_1_sync_mux),
                        .l1clk(esr_mac_rclk_0_buf[1]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_0_2_mux_l1 (
                        .l2clk(esr_mac_rclk_0_mux[2]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_0_2_sync_mux),
                        .l1clk(esr_mac_rclk_0_buf[2]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_0_3_mux_l1 (
                        .l2clk(esr_mac_rclk_0_mux[3]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_0_3_sync_mux),
                        .l1clk(esr_mac_rclk_0_buf[3]) );

// ***************************************************
// RX Port 1  Hedwig L1 clock headers and clock muxing
// ***************************************************

cl_a1_clk_mux2_8x rclk_1_mux_0 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_1[0]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_1_mux[0]));
cl_a1_clk_mux2_8x rclk_1_mux_1 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_1[1]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_1_mux[1]));
cl_a1_clk_mux2_8x rclk_1_mux_2 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_1[2]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_1_mux[2]));
cl_a1_clk_mux2_8x rclk_1_mux_3 (.in0(mac_125rx_test_clk), .in1(esr_mac_rclk_1[3]), .sel0(tcu_scan_mode), .out(esr_mac_rclk_1_mux[3]));

SYNC_CELL  SYNC_CELL_ST_RX_1_0(.D(tcu_clk_stop),.CP(esr_mac_rclk_1_mux[0]),.Q(tcu_clk_stop_rclk_1_0_sync));
SYNC_CELL  SYNC_CELL_ST_RX_1_1(.D(tcu_clk_stop),.CP(esr_mac_rclk_1_mux[1]),.Q(tcu_clk_stop_rclk_1_1_sync));
SYNC_CELL  SYNC_CELL_ST_RX_1_2(.D(tcu_clk_stop),.CP(esr_mac_rclk_1_mux[2]),.Q(tcu_clk_stop_rclk_1_2_sync));
SYNC_CELL  SYNC_CELL_ST_RX_1_3(.D(tcu_clk_stop),.CP(esr_mac_rclk_1_mux[3]),.Q(tcu_clk_stop_rclk_1_3_sync));

assign tcu_clk_stop_rclk_1_0_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_1_0_sync;
assign tcu_clk_stop_rclk_1_1_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_1_1_sync;
assign tcu_clk_stop_rclk_1_2_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_1_2_sync;
assign tcu_clk_stop_rclk_1_3_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_rclk_1_3_sync;

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_1_0_mux_l1 (
                        .l2clk(esr_mac_rclk_1_mux[0]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_1_0_sync_mux),
                        .l1clk(esr_mac_rclk_1_buf[0]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_1_1_mux_l1 (
                        .l2clk(esr_mac_rclk_1_mux[1]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_1_1_sync_mux),
                        .l1clk(esr_mac_rclk_1_buf[1]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_1_2_mux_l1 (
                        .l2clk(esr_mac_rclk_1_mux[2]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_1_2_sync_mux),
                        .l1clk(esr_mac_rclk_1_buf[2]) );

cl_a1_l1hdr_12x hedwig_esr_mac_rclk_1_3_mux_l1 (
                        .l2clk(esr_mac_rclk_1_mux[3]),
                        .se(tcu_scan_en),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_rclk_1_3_sync_mux),
                        .l1clk(esr_mac_rclk_1_buf[3]) );


// *******************************
// Synchronization of reset signal
// *******************************
wire io_mdclk0;
wire io_mdclk1;

SYNC_CELL  SYNC_CELL0(.D(niu_reset_l),.CP(io_mdclk0),.Q(hedwig_reset0_l));
SYNC_CELL  SYNC_CELL1(.D(niu_reset_l),.CP(io_mdclk1),.Q(hedwig_reset1_l));

SYNC_CELL  serdes_reset_0_SYNC_CELL(.D(serdes_reset_0),.CP(io_mdclk0),.Q(hedwig_serdes_reset_0));
SYNC_CELL  serdes_reset_1_SYNC_CELL(.D(serdes_reset_1),.CP(io_mdclk1),.Q(hedwig_serdes_reset_1));

   assign hedwig_reset0 = (~hedwig_reset0_l) | hedwig_serdes_reset_0;
   assign hedwig_reset1 = (~hedwig_reset1_l) | hedwig_serdes_reset_1;
   
   
/* ---------------- hedwig_0 stuff ---------------------- */
   wire [3:0]	   stspll_0;
   wire [7:0] 	   stsrx0_0;
   wire [7:0] 	   stsrx1_0;
   wire [7:0] 	   stsrx2_0;
   wire [7:0] 	   stsrx3_0;
   wire [3:0] 	   ststx0_0;
   wire [3:0] 	   ststx1_0;
   wire [3:0] 	   ststx2_0;
   wire [3:0] 	   ststx3_0;
   wire [11:0] 	   cfgpll_0;
   wire [27:0] 	   cfgrx0_0;
   wire [27:0] 	   cfgrx1_0;
   wire [27:0] 	   cfgrx2_0;
   wire [27:0] 	   cfgrx3_0;
   wire [19:0] 	   cfgtx0_0;
   wire [19:0] 	   cfgtx1_0;
   wire [19:0] 	   cfgtx2_0;
   wire [19:0] 	   cfgtx3_0;
   wire [15:0] 	   testcfg_0;
   wire            bstx_cfgtx0_0_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx1_0_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx2_0_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx3_0_bit17; // bstx: determines logic level output on txpi and txni
   wire [1:0]      bsinrxp_bsinrxn_cfgrx0_0_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx1_0_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx2_0_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx3_0_bit25_24;
   wire [2:0]      enbspt_enbsrx_enbstx_0;
   

// wire       	   esr_mac_oddcg0_0=  stsrx0_0[2]; // use ch 0
// wire       	   esr_mac_lock_0  =  stspll_0[0];
// wire [3:0] 	   esr_mac_los_0   = {stsrx3_0[3],stsrx2_0[3],stsrx1_0[3],stsrx0_0[3]};
// wire [3:0] 	   esr_mac_sync_0  = {stsrx3_0[1],stsrx2_0[1],stsrx1_0[1],stsrx0_0[1]};

// alias function
xMUX_2to1 #(1) esr_mac_oddcg0_s0(.din0(stsrx0_0[2]),.din1(1'b1),.sel(1'b0),.dout(esr_mac_oddcg0_0)); // use ch 0
   
xMUX_2to1 #(1) esr_mac_lock_s0(.din0(stspll_0[0]),.din1(1'b1),.sel(1'b0),.dout(esr_mac_lock_0));
   
xMUX_2to1 #(4) esr_mac_los_s0(.din0({stsrx3_0[3],stsrx2_0[3],stsrx1_0[3],stsrx0_0[3]}),.din1({4{1'b1}}),.sel(1'b0),.dout(esr_mac_los_0[3:0]));
   
// boundary scan stuff
   assign 	   cfgtx0_0[17]    = n2_mode ? cfgtx0_0_17 : bstx_cfgtx0_0_bit17;
   assign 	   cfgtx1_0[17]    = n2_mode ? cfgtx1_0_17 : bstx_cfgtx1_0_bit17;
   assign 	   cfgtx2_0[17]    = n2_mode ? cfgtx2_0_17 : bstx_cfgtx2_0_bit17;
   assign 	   cfgtx3_0[17]    = n2_mode ? cfgtx3_0_17 : bstx_cfgtx3_0_bit17;

// For 1149.6 support, cfgrx*_1_b25_b24 comes from boundary scan block esr_bscan.v

   assign          cfgrx0_0[25:24] = n2_mode ? cfgrx0_0_b25_b24 : bsinrxp_bsinrxn_cfgrx0_0_bit25_24;
   assign          cfgrx1_0[25:24] = n2_mode ? cfgrx1_0_b25_b24 : bsinrxp_bsinrxn_cfgrx1_0_bit25_24;
   assign          cfgrx2_0[25:24] = n2_mode ? cfgrx2_0_b25_b24 : bsinrxp_bsinrxn_cfgrx2_0_bit25_24;
   assign          cfgrx3_0[25:24] = n2_mode ? cfgrx3_0_b25_b24 : bsinrxp_bsinrxn_cfgrx3_0_bit25_24;

   assign	   testcfg_0[10:8] = n2_mode ? {tcu_sbs_enbspt,tcu_sbs_enbsrx,tcu_sbs_enbstx} : enbspt_enbsrx_enbstx_0;


// hedwig_0 instantiation

   wire  [15:0] cfg_0;
   assign 	cfg_0[15]    = 1'h1;          // clause 45
   assign 	cfg_0[14:10] = `PORT_ADDR_0;  // portad
   assign 	cfg_0[9:5]   = `DEV_ADDR_0;   // devad
   assign       cfg_0[4:0]   = 5'h0;          // base_addr

MDIO_TO_REGS hedwig_0
  (
   .io_mdclk                            (io_mdclk0),     // output clock from L1 header
   .tcu_clk_stop                        (tcu_clk_stop),  // input
   .tcu_scan_mode                       (tcu_scan_mode), // input

   // Outputs
   .MDOUT				(mdi_0),
   .MDOE				(mdoe_0),
   .CFGTX0				({cfgtx0_0[19:18],bstx_cfgtx0_0_bit17,              cfgtx0_0[16:0]}),
   .CFGTX1				({cfgtx1_0[19:18],bstx_cfgtx1_0_bit17,              cfgtx1_0[16:0]}),
   .CFGTX2				({cfgtx2_0[19:18],bstx_cfgtx2_0_bit17,              cfgtx2_0[16:0]}),
   .CFGTX3				({cfgtx3_0[19:18],bstx_cfgtx3_0_bit17,              cfgtx3_0[16:0]}),
   .CFGRX0				({cfgrx0_0[27:26],bsinrxp_bsinrxn_cfgrx0_0_bit25_24,cfgrx0_0[23:0]}),
   .CFGRX1				({cfgrx1_0[27:26],bsinrxp_bsinrxn_cfgrx1_0_bit25_24,cfgrx1_0[23:0]}),
   .CFGRX2				({cfgrx2_0[27:26],bsinrxp_bsinrxn_cfgrx2_0_bit25_24,cfgrx2_0[23:0]}),
   .CFGRX3				({cfgrx3_0[27:26],bsinrxp_bsinrxn_cfgrx3_0_bit25_24,cfgrx3_0[23:0]}),
   .TESTCFG				({testcfg_0[15:11],enbspt_enbsrx_enbstx_0[2:0],            testcfg_0[7:0]}),
   .CFGPLL				(cfgpll_0[11:0]),
   // Inputs
   .RESET				(hedwig_reset0),
   .MDCLK				(mdclk),
   .MDIN				(mdo),
   .CFG					(cfg_0[15:0]),
   .SCANEN				(tcu_scan_en),
   .SCANCLK				(mac_125rx_test_clk),
   .STSTX0				(ststx0_0[3:0]),
   .STSTX1				(ststx1_0[3:0]),
   .STSTX2				(ststx2_0[3:0]),
   .STSTX3				(ststx3_0[3:0]),
   .STSRX0				(stsrx0_0[7:0]),
   .STSRX1				(stsrx1_0[7:0]),
   .STSRX2				(stsrx2_0[7:0]),
   .STSRX3				(stsrx3_0[7:0]),
   .STSPLL				(stspll_0[3:0]),
   .TXBCLKIN0				(esr_mac_tclk_0_buf),
   .TXBCLKIN1				(esr_mac_tclk_0_buf),
   .TXBCLKIN2				(esr_mac_tclk_0_buf),
   .TXBCLKIN3				(esr_mac_tclk_0_buf),
   .RXBCLKIN0				(esr_mac_rclk_0_buf[0]),
   .RXBCLKIN1				(esr_mac_rclk_0_buf[1]),
   .RXBCLKIN2				(esr_mac_rclk_0_buf[2]),
   .RXBCLKIN3				(esr_mac_rclk_0_buf[3])
);
   
/* ---------------- hedwig_1 stuff ---------------------- */
   wire [3:0]	   stspll_1;
   wire [7:0] 	   stsrx0_1;
   wire [7:0] 	   stsrx1_1;
   wire [7:0] 	   stsrx2_1;
   wire [7:0] 	   stsrx3_1;
   wire [3:0] 	   ststx0_1;
   wire [3:0] 	   ststx1_1;
   wire [3:0] 	   ststx2_1;
   wire [3:0] 	   ststx3_1;
   wire [11:0] 	   cfgpll_1;
   wire [27:0] 	   cfgrx0_1;
   wire [27:0] 	   cfgrx1_1;
   wire [27:0] 	   cfgrx2_1;
   wire [27:0] 	   cfgrx3_1;
   wire [19:0] 	   cfgtx0_1;
   wire [19:0] 	   cfgtx1_1;
   wire [19:0] 	   cfgtx2_1;
   wire [19:0] 	   cfgtx3_1;
   wire [15:0] 	   testcfg_1;
   wire            bstx_cfgtx0_1_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx1_1_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx2_1_bit17; // bstx: determines logic level output on txpi and txni
   wire            bstx_cfgtx3_1_bit17; // bstx: determines logic level output on txpi and txni
   wire [1:0]      bsinrxp_bsinrxn_cfgrx0_1_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx1_1_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx2_1_bit25_24;
   wire [1:0]      bsinrxp_bsinrxn_cfgrx3_1_bit25_24;
   wire [2:0] 	   enbspt_enbsrx_enbstx_1;


// wire       	   esr_mac_oddcg0_1=  stsrx0_1[2]; // use ch 0
// wire       	   esr_mac_lock_1  =  stspll_1[0];
// wire [3:0] 	   esr_mac_los_1   = {stsrx3_1[3],stsrx2_1[3],stsrx1_1[3],stsrx0_1[3]};
// wire [3:0] 	   esr_mac_sync_1  = {stsrx3_1[1],stsrx2_1[1],stsrx1_1[1],stsrx0_1[1]};

// alias function
xMUX_2to1 #(1) esr_mac_oddcg0_s1(.din0(stsrx0_1[2]),.din1(1'b1),.sel(1'b0),.dout(esr_mac_oddcg0_1)); // use ch 1
   
xMUX_2to1 #(1) esr_mac_lock_s1(.din0(stspll_1[0]),.din1(1'b1),.sel(1'b0),.dout(esr_mac_lock_1));

xMUX_2to1 #(4) esr_mac_los_s1(.din0({stsrx3_1[3],stsrx2_1[3],stsrx1_1[3],stsrx0_1[3]}),.din1({4{1'b1}}),.sel(1'b0),.dout(esr_mac_los_1[3:0]));
   
// boundary scan stuff
   assign 	   cfgtx0_1[17]    = n2_mode ? cfgtx0_1_17 : bstx_cfgtx0_1_bit17;
   assign 	   cfgtx1_1[17]    = n2_mode ? cfgtx1_1_17 : bstx_cfgtx1_1_bit17;
   assign 	   cfgtx2_1[17]    = n2_mode ? cfgtx2_1_17 : bstx_cfgtx2_1_bit17;
   assign 	   cfgtx3_1[17]    = n2_mode ? cfgtx3_1_17 : bstx_cfgtx3_1_bit17;

// For 1149.6 support, cfgrx*_1_b25_b24 comes from boundary scan block esr_bscan.v

   assign          cfgrx0_1[25:24] = n2_mode ? cfgrx0_1_b25_b24 : bsinrxp_bsinrxn_cfgrx0_1_bit25_24;
   assign          cfgrx1_1[25:24] = n2_mode ? cfgrx1_1_b25_b24 : bsinrxp_bsinrxn_cfgrx1_1_bit25_24;
   assign          cfgrx2_1[25:24] = n2_mode ? cfgrx2_1_b25_b24 : bsinrxp_bsinrxn_cfgrx2_1_bit25_24;
   assign          cfgrx3_1[25:24] = n2_mode ? cfgrx3_1_b25_b24 : bsinrxp_bsinrxn_cfgrx3_1_bit25_24;

   assign	   testcfg_1[10:8] = n2_mode ? {tcu_sbs_enbspt,tcu_sbs_enbsrx,tcu_sbs_enbstx} : enbspt_enbsrx_enbstx_1;


// hedwig_1 instantiation

   wire  [15:0] cfg_1;
   assign 	cfg_1[15]    = 1'h1;          // clause 45
   assign 	cfg_1[14:10] = `PORT_ADDR_1;  // portad
   assign 	cfg_1[9:5]   = `DEV_ADDR_1;   // devad
   assign       cfg_1[4:0]   = 5'h0;          // base_addr

MDIO_TO_REGS hedwig_1
  (
   .io_mdclk                            (io_mdclk1),     // output clock from l1 header
   .tcu_clk_stop                        (tcu_clk_stop), // input
   .tcu_scan_mode                       (tcu_scan_mode), // input

   // Outputs
   .MDOUT				(mdi_1),
   .MDOE				(mdoe_1),
   .CFGTX0				({cfgtx0_1[19:18], bstx_cfgtx0_1_bit17,              cfgtx0_1[16:0]}),
   .CFGTX1				({cfgtx1_1[19:18], bstx_cfgtx1_1_bit17,              cfgtx1_1[16:0]}),
   .CFGTX2				({cfgtx2_1[19:18], bstx_cfgtx2_1_bit17,              cfgtx2_1[16:0]}),
   .CFGTX3				({cfgtx3_1[19:18], bstx_cfgtx3_1_bit17,              cfgtx3_1[16:0]}),
   .CFGRX0				({cfgrx0_1[27:26], bsinrxp_bsinrxn_cfgrx0_1_bit25_24,cfgrx0_1[23:0]}),
   .CFGRX1				({cfgrx1_1[27:26], bsinrxp_bsinrxn_cfgrx1_1_bit25_24,cfgrx1_1[23:0]}),
   .CFGRX2				({cfgrx2_1[27:26], bsinrxp_bsinrxn_cfgrx2_1_bit25_24,cfgrx2_1[23:0]}),
   .CFGRX3				({cfgrx3_1[27:26], bsinrxp_bsinrxn_cfgrx3_1_bit25_24,cfgrx3_1[23:0]}),
   .TESTCFG				({testcfg_1[15:11],enbspt_enbsrx_enbstx_1[2:0],      testcfg_1[7:0]}),
   .CFGPLL				(cfgpll_1[11:0]),
   // Inputs
   .RESET				(hedwig_reset1),
   .MDCLK				(mdclk),
   .MDIN				(mdo),
   .CFG					(cfg_1[15:0]),
   .SCANEN				(tcu_scan_en),
   .SCANCLK				(mac_125rx_test_clk),
   .STSTX0				(ststx0_1[3:0]),
   .STSTX1				(ststx1_1[3:0]),
   .STSTX2				(ststx2_1[3:0]),
   .STSTX3				(ststx3_1[3:0]),
   .STSRX0				(stsrx0_1[7:0]),
   .STSRX1				(stsrx1_1[7:0]),
   .STSRX2				(stsrx2_1[7:0]),
   .STSRX3				(stsrx3_1[7:0]),
   .STSPLL				(stspll_1[3:0]),
   .TXBCLKIN0				(esr_mac_tclk_1_buf),
   .TXBCLKIN1				(esr_mac_tclk_1_buf),
   .TXBCLKIN2				(esr_mac_tclk_1_buf),
   .TXBCLKIN3				(esr_mac_tclk_1_buf),
   .RXBCLKIN0				(esr_mac_rclk_1_buf[0]),
   .RXBCLKIN1				(esr_mac_rclk_1_buf[1]),
   .RXBCLKIN2				(esr_mac_rclk_1_buf[2]),
   .RXBCLKIN3				(esr_mac_rclk_1_buf[3])
);
 
  
// to esr_bscan 
   assign 	   BSRXP0_0 = stsrx0_0[4];  // bit4 of ch0 serdes 0
   assign 	   BSRXP1_0 = stsrx1_0[4];  // bit4 of ch1 serdes 0
   assign 	   BSRXP2_0 = stsrx2_0[4];  // bit4 of ch2 serdes 0
   assign 	   BSRXP3_0 = stsrx3_0[4];  // bit4 of ch3 serdes 0
   assign 	   BSRXN0_0 = stsrx0_0[5];  // bit5 of ch0 serdes 0
   assign 	   BSRXN1_0 = stsrx1_0[5];  // bit5 of ch1 serdes 0
   assign 	   BSRXN2_0 = stsrx2_0[5];  // bit5 of ch2 serdes 0
   assign 	   BSRXN3_0 = stsrx3_0[5];  // bit5 of ch3 serdes 0
   assign 	   BSRXP0_1 = stsrx0_1[4];  // bit4 of ch0 serdes 1
   assign 	   BSRXP1_1 = stsrx1_1[4];  // bit4 of ch1 serdes 1
   assign 	   BSRXP2_1 = stsrx2_1[4];  // bit4 of ch2 serdes 1
   assign 	   BSRXP3_1 = stsrx3_1[4];  // bit4 of ch3 serdes 1
   assign 	   BSRXN0_1 = stsrx0_1[5];  // bit5 of ch0 serdes 1
   assign 	   BSRXN1_1 = stsrx1_1[5];  // bit5 of ch1 serdes 1
   assign 	   BSRXN2_1 = stsrx2_1[5];  // bit5 of ch2 serdes 1
   assign 	   BSRXN3_1 = stsrx3_1[5];  // bit5 of ch3 serdes 1

   
endmodule // hedwig

 
