// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: phy_clock_2ports.v
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
 * File Name    : phy_clock_2ports.v
 * Author Name  : John Lo
 * Description  : This module contains 2 clock muxes modules for each port.
 *                This is the top clock mux module. 
 *                Some ASIC vendor requires the phy_clock_top2 to be
 *                outside mac.
 * 
 * 
 * 
 * Parent Module: None
 * Child  Module: xmac_x2pcs_clk_mux
 * Interface Mod: 
 * Date Created : 3/5/04
 * 
 * 
 * Copyright (c) 2020, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * 
 *************************************************************************/


module phy_clock_2ports (/*AUTOARG*/
   // Outputs
   tx_nbclk_muxd0, tx_clk_muxd0, tx_clk_312mhz_muxd0, rx_nbclk_muxd0, 
   rx_clk_muxd0, rbc0_a_muxd0, rbc0_b_muxd0, rbc0_c_muxd0, 
   rbc0_d_muxd0, tx_nbclk_muxd1, tx_clk_muxd1, tx_clk_312mhz_muxd1, 
   rx_nbclk_muxd1, rx_clk_muxd1, rbc0_a_muxd1, rbc0_b_muxd1, 
   rbc0_c_muxd1, rbc0_d_muxd1, 
   // Inputs
   tcu_scan_mode, mac_312tx_test_clk, mac_312rx_test_clk, 
   mac_156tx_test_clk, mac_156rx_test_clk, mac_125tx_test_clk, 
   mac_125rx_test_clk, reset, clk, loopback0, sel_por_clk_src0, 
   sel_clk_25mhz0, mii_mode0, gmii_mode0, xgmii_mode0, pcs_bypass0, 
   xpcs_loopback0, tx_heart_beat_timer0, rx_heart_beat_timer0, 
   esr_mac_rclk_0, esr_mac_tclk_0, loopback1, sel_por_clk_src1, 
   sel_clk_25mhz1, mii_mode1, gmii_mode1, xgmii_mode1, pcs_bypass1, 
   xpcs_loopback1, tx_heart_beat_timer1, rx_heart_beat_timer1, 
   esr_mac_rclk_1, esr_mac_tclk_1
   );

/* ------------- global signals ------------------------------- */
   input          tcu_scan_mode;
   input 	  mac_312tx_test_clk;
   input 	  mac_312rx_test_clk;
   input 	  mac_156tx_test_clk;
   input 	  mac_156rx_test_clk;
   input 	  mac_125tx_test_clk;
   input 	  mac_125rx_test_clk;
   input 	  reset;
   input 	  clk;
/* ------------- xmac_2pcs_clk_mux --- port 0 ----------------- */
   input          loopback0;
   input          sel_por_clk_src0;
   input 	  sel_clk_25mhz0;
   input 	  mii_mode0;
   input 	  gmii_mode0;
   input 	  xgmii_mode0;
   input 	  pcs_bypass0;          // select external pcs
   input 	  xpcs_loopback0;       // !tx_clk as xpcs_loopback clock
   input [3:0] 	  tx_heart_beat_timer0; // from tx_mii_gmii.v 
   input [3:0] 	  rx_heart_beat_timer0; // from rx_mii_gmii.v
// outputs to clock tree
   // 802.3 rx clocks
   input  [3:0]	  esr_mac_rclk_0;
   input       	  esr_mac_tclk_0;       // use lane 0 tclk for common tclk.
   output 	  tx_nbclk_muxd0;       // to clock tree
   output 	  tx_clk_muxd0;         // to clock tree
   output 	  tx_clk_312mhz_muxd0;  // to clock tree
   output 	  rx_nbclk_muxd0;       // to clock tree
   output 	  rx_clk_muxd0;         // to clock tree
   output 	  rbc0_a_muxd0;         // to clock tree
   output 	  rbc0_b_muxd0;         // to clock tree
   output 	  rbc0_c_muxd0;         // to clock tree
   output 	  rbc0_d_muxd0;         // to clock tree
/* ------------- xmac_2pcs_clk_mux --- port 1 ----------------- */
   input          loopback1;
   input          sel_por_clk_src1;
   input 	  sel_clk_25mhz1;
   input 	  mii_mode1;
   input 	  gmii_mode1;
   input 	  xgmii_mode1;
   input 	  pcs_bypass1;          // select external pcs
   input 	  xpcs_loopback1;       // !tx_clk as xpcs_loopback clock
   input [3:0] 	  tx_heart_beat_timer1; // from tx_mii_gmii.v 
   input [3:0] 	  rx_heart_beat_timer1; // from rx_mii_gmii.v
// outputs to clock tree
   // 802.3 rx clocks
   input  [3:0]	  esr_mac_rclk_1;
   input          esr_mac_tclk_1;       // use lance 0 tclk for common tclk.
   output 	  tx_nbclk_muxd1;       // to clock tree
   output 	  tx_clk_muxd1;         // to clock tree
   output 	  tx_clk_312mhz_muxd1;  // to clock tree
   output 	  rx_nbclk_muxd1;       // to clock tree
   output 	  rx_clk_muxd1;         // to clock tree
   output 	  rbc0_a_muxd1;         // to clock tree
   output 	  rbc0_b_muxd1;         // to clock tree
   output 	  rbc0_c_muxd1;         // to clock tree
   output 	  rbc0_d_muxd1;         // to clock tree

/************************************
 * N2 specific setup and logic
 ************************************/
   wire  	  ref_clk_250mhz = 1'b0; // N2 has no cupper phy (rgmii)
   wire 	  gmii_rx_clk0   = 1'b0;
   wire 	  gmii_rx_clk1   = 1'b0;
   wire 	  FUNC_MODE      = ~tcu_scan_mode;
   
   // vlint flag_dangling_net_within_module off
   // vlint flag_net_has_no_load off
   wire 	  debug_tclk_156mhz0;
   wire 	  debug_rclk_156mhz0;
   wire 	  debug_tclk_156mhz1;
   wire 	  debug_rclk_156mhz1;
   // vlint flag_net_has_no_load on
   // vlint flag_dangling_net_within_module on
     
/* ------------- xmac_2pcs_clk_mux --- port 0 ----------------- */
xmac_2pcs_clk_mux xmac_2pcs_clk_mux0(
.FUNC_MODE(FUNC_MODE),
.mac_312tx_test_clk(mac_312tx_test_clk),
.mac_312rx_test_clk({4{mac_312rx_test_clk}}),
.mac_156tx_test_clk(mac_156tx_test_clk),
.mac_156rx_test_clk(mac_156rx_test_clk),
.mac_125tx_test_clk(mac_125tx_test_clk),
.mac_125rx_test_clk(mac_125rx_test_clk),
.reset(reset),
.clk(clk),
.loopback(loopback0),
.sel_por_clk_src(sel_por_clk_src0),
.mii_mode(mii_mode0),
.gmii_mode(gmii_mode0),
.xgmii_mode(xgmii_mode0),
.pcs_bypass(pcs_bypass0),                   // select external pcs
.xpcs_loopback(xpcs_loopback0),             // !tx_clk as xpcs_loopback clock
.ref_clk_250mhz(ref_clk_250mhz),
.sel_clk_25mhz(sel_clk_25mhz0),
.tx_heart_beat_timer(tx_heart_beat_timer0), // from tx_mii_gmii.v 
.rx_heart_beat_timer(rx_heart_beat_timer0), // from rx_mii_gmii.v
// 802.3 input rx clocks
.gmii_rx_clk(gmii_rx_clk0),
// xpcs clock
.esr_tclk_312mhz(esr_mac_tclk_0),           // for 10G optical lane 0 tclk for all.
.esr_mac_rclk0(esr_mac_rclk_0[0]),
.esr_mac_rclk1(esr_mac_rclk_0[1]),
.esr_mac_rclk2(esr_mac_rclk_0[2]),
.esr_mac_rclk3(esr_mac_rclk_0[3]),
// pcs clock
.atca_GE(1'b0),
.esr_tclk_125mhz0(esr_mac_tclk_0),          // for 1G optical
.esr_tclk_125mhz1(esr_mac_tclk_0),          // for 1G optical
.esr_rclk_125mhz0(esr_mac_rclk_0[0]),       // for 1G optical
.esr_rclk_125mhz1(esr_mac_rclk_0[0]),       // for 1G optical
// outputs to clock tree
.tx_nbclk_muxd(tx_nbclk_muxd0),
.tx_clk_muxd(tx_clk_muxd0),
.tx_clk_312mhz_muxd(tx_clk_312mhz_muxd0),
.rx_nbclk_muxd(rx_nbclk_muxd0),
.rx_clk_muxd(rx_clk_muxd0),
.rbc0_a_muxd(rbc0_a_muxd0),
.rbc0_b_muxd(rbc0_b_muxd0),
.rbc0_c_muxd(rbc0_c_muxd0),
.rbc0_d_muxd(rbc0_d_muxd0),
.debug_tclk_156mhz(debug_tclk_156mhz0),
.debug_rclk_156mhz(debug_rclk_156mhz0));

/* ------------- xmac_2pcs_clk_mux --- port 1 ----------------- */
xmac_2pcs_clk_mux xmac_2pcs_clk_mux1(
.FUNC_MODE(FUNC_MODE),
.mac_312tx_test_clk(mac_312tx_test_clk),
.mac_312rx_test_clk({4{mac_312rx_test_clk}}),
.mac_156tx_test_clk(mac_156tx_test_clk),
.mac_156rx_test_clk(mac_156rx_test_clk),
.mac_125tx_test_clk(mac_125tx_test_clk),
.mac_125rx_test_clk(mac_125rx_test_clk),
.reset(reset),
.clk(clk),
.loopback(loopback1),
.sel_por_clk_src(sel_por_clk_src1),
.mii_mode(mii_mode1),
.gmii_mode(gmii_mode1),
.xgmii_mode(xgmii_mode1),
.pcs_bypass(pcs_bypass1),                   // select external pcs
.xpcs_loopback(xpcs_loopback1),             // !tx_clk as xpcs_loopback clock
.ref_clk_250mhz(ref_clk_250mhz),
.sel_clk_25mhz(sel_clk_25mhz1),
.tx_heart_beat_timer(tx_heart_beat_timer1), // from tx_mii_gmii.v 
.rx_heart_beat_timer(rx_heart_beat_timer1), // from rx_mii_gmii.v
// 802.3 input rx clocks
.gmii_rx_clk(gmii_rx_clk1),
// xpcs clock
.esr_tclk_312mhz(esr_mac_tclk_1),           // for 10G optical lane 0 tclk for all.
.esr_mac_rclk0(esr_mac_rclk_1[0]),
.esr_mac_rclk1(esr_mac_rclk_1[1]),
.esr_mac_rclk2(esr_mac_rclk_1[2]),
.esr_mac_rclk3(esr_mac_rclk_1[3]),
// pcs clock
.atca_GE(1'b0),
.esr_tclk_125mhz0(esr_mac_tclk_1),          // for 1G optical
.esr_tclk_125mhz1(esr_mac_tclk_1),          // for 1G optical
.esr_rclk_125mhz0(esr_mac_rclk_1[0]),       // for 1G optical
.esr_rclk_125mhz1(esr_mac_rclk_1[0]),       // for 1G optical
// outputs to clock tree
.tx_nbclk_muxd(tx_nbclk_muxd1),
.tx_clk_muxd(tx_clk_muxd1),
.tx_clk_312mhz_muxd(tx_clk_312mhz_muxd1),
.rx_nbclk_muxd(rx_nbclk_muxd1),
.rx_clk_muxd(rx_clk_muxd1),
.rbc0_a_muxd(rbc0_a_muxd1),
.rbc0_b_muxd(rbc0_b_muxd1),
.rbc0_c_muxd(rbc0_c_muxd1),
.rbc0_d_muxd(rbc0_d_muxd1),
.debug_tclk_156mhz(debug_tclk_156mhz1),
.debug_rclk_156mhz(debug_rclk_156mhz1));

endmodule // phy_clock_2ports

