// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac_2pcs_clk_mux.v
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
 * File Name    : xmac_2pcs_clk_mux.v
 * Author Name  : John Lo
 * Description  : xmac_2pcs_clk_mux.v is a modification version of 
 *                xmac_clk_mux.v file.   It is specific for 250 MHz 
 *                core clock and 312.5Mhz clock input.
 *
 *                xmac_2pcs_clk_mux works closely with esr_ctl4, sphy_dpath4.
 *                The phy_clock_4ports is clock path.
 *                The sphy_dpath4  is data path. 
 *                The control path is esr_ctl4.
 *                When doing changes/modifications make sure 
 *                phy_clock_4ports , sphy_dpath4 and esr_ctl4 are in sync.
 *
 * Parent Module: phy_clock_2ports/phy_clock_4ports
 * Child  Module: 
 * Interface Mod: many.
 * Date Created : 8/24/01
 *
 * Copyright (c) 2003, Sun Microsystems, Inc.
 * Sun Proprietary and Confidential
 *
 * Modification : 1. 3/23/04 -loj: changed eser_phy to esr_mac.
 *                2. 3/23/04 -loj: changed iser_phy to psr_mac. 
 *                3. 4/21/04 -loj: changed esr_mac_tclk to 
 *                   ref_clk_312mhz for 10G optical and 
 *                   Bth esr_tclk_125mhz0 and esr_tclk_125mhz1 are 
 *                   for  1G optical. 
 *                4. 11/29/04 -loj: Added dft mux to ref_clk_312mhz.
 *                  
 *  
 * Synthesis Notes: Make sure those asyn reset flops are used. 
 *  
 *************************************************************************/

`include  "xmac.h"

module xmac_2pcs_clk_mux(
`ifdef NEPTUNE
`else
FUNC_MODE,
mac_312tx_test_clk,
mac_312rx_test_clk,
mac_156tx_test_clk,
mac_156rx_test_clk,
mac_125tx_test_clk,
mac_125rx_test_clk,
`endif
reset,
clk,
loopback,
sel_por_clk_src,
mii_mode,
xgmii_mode,
pcs_bypass,     // select external pcs
xpcs_loopback,  // !ref_clk_312mhz as xpcs_loopback clock
gmii_mode,
ref_clk_250mhz,
sel_clk_25mhz,
tx_heart_beat_timer, // from tx_mii_gmii.v 
rx_heart_beat_timer, // from rx_mii_gmii.v
// 802.3 input rx clocks
gmii_rx_clk,       // shared between mii and gmii receive clk
// xpcs clock
esr_tclk_312mhz,
esr_mac_rclk0,
esr_mac_rclk1,
esr_mac_rclk2,
esr_mac_rclk3,
// pcs clock
atca_GE,
esr_tclk_125mhz0,
esr_tclk_125mhz1,
esr_rclk_125mhz0,
esr_rclk_125mhz1,
// outputs to clock tree
tx_nbclk_muxd,
tx_clk_muxd,
tx_clk_312mhz_muxd,
rx_nbclk_muxd,
rx_clk_muxd,
rbc0_a_muxd,
rbc0_b_muxd,
rbc0_c_muxd,
rbc0_d_muxd,
debug_tclk_156mhz,
debug_rclk_156mhz
);
`ifdef NEPTUNE
`else
   input          FUNC_MODE;
   input 	  mac_312tx_test_clk;
   input [3:0]	  mac_312rx_test_clk;
   input 	  mac_156tx_test_clk;
   input 	  mac_156rx_test_clk;
   input 	  mac_125tx_test_clk;
   input 	  mac_125rx_test_clk;
`endif
   input 	  reset;
   input 	  clk;
   input          loopback;
   input          sel_por_clk_src;
   input 	  mii_mode;
   input 	  xgmii_mode;
   input 	  pcs_bypass;        // select external pcs
   input 	  xpcs_loopback;     // !tx_pclk as xpcs_loopback clock
   // vlint flag_dangling_net_within_module off
   // vlint flag_input_port_not_connected off
   // vlint flag_net_has_no_load off
   input 	  gmii_mode;
   input 	  ref_clk_250mhz;
   input 	  sel_clk_25mhz;
   input [3:0] 	  tx_heart_beat_timer;// from tx_mii_gmii.v 
   input [3:0] 	  rx_heart_beat_timer;// from rx_mii_gmii.v
   // vlint flag_dangling_net_within_module on
   // vlint flag_input_port_not_connected on
   // vlint flag_net_has_no_load on
                  // 802.3 rx clocks
   input 	  gmii_rx_clk;       // shared between mii and gmii receive clk
                  // xpcs clock
   input 	  esr_tclk_312mhz;   // For 10G optical
   input 	  esr_mac_rclk0;     // for 10G optical 
   input 	  esr_mac_rclk1;     // for 10G optical 
   input 	  esr_mac_rclk2;     // for 10G optical 
   input 	  esr_mac_rclk3;     // for 10G optical 
                  // pcs clock
   input 	  atca_GE;
   input 	  esr_tclk_125mhz0;  // For 1G optical
   input 	  esr_tclk_125mhz1;  // For 1G optical
   input 	  esr_rclk_125mhz0;  // For 1G optical
   input 	  esr_rclk_125mhz1;  // For 1G optical
                  // outputs to clock tree
   output 	  tx_nbclk_muxd;     // 125/25/2.5mhz
   output 	  tx_clk_muxd;       // 156mhz
   output 	  tx_clk_312mhz_muxd;// 312mhz
   output 	  rx_nbclk_muxd;     // 125/25/2.5mhz
   output 	  rx_clk_muxd;       // 156mhz
   output 	  rbc0_a_muxd;       // 312mhz 
   output 	  rbc0_b_muxd;       // 312mhz 
   output 	  rbc0_c_muxd;       // 312mhz
   output 	  rbc0_d_muxd;       // 312mhz
                  // debug clocks
   output 	  debug_tclk_156mhz;
   output 	  debug_rclk_156mhz;

   wire 	  inv_tx_heart_beat_timer3 = ~tx_heart_beat_timer[3];
   wire 	  inv_tx_heart_beat_timer2 = ~tx_heart_beat_timer[2];
   wire 	  cu_tclk;          // 125/25/2.5 mhz
   wire 	  tx_mg_clk;
   wire 	  mgmii_rx_clk;
   wire 	  rx_mg_clk;
   wire 	  rx_xg_clk;
   wire 	  xmac_loopback_clk;
   wire 	  xpcs_loopback_clk;
   wire   	  tx_nbclk_muxd;      // to clock tree
   wire   	  tx_clk_muxd;        // to clock tree
   wire   	  rx_nbclk_muxd;      // to clock tree
   wire   	  rx_clk_muxd;        // to clock tree
   wire   	  rbc0_a_muxd;
   wire   	  rbc0_b_muxd;
   wire   	  rbc0_c_muxd;
   wire   	  rbc0_d_muxd;
   wire   	  p1_tx_nbclk_muxd;   // to clock tree
   wire   	  p1_tx_clk_muxd;     // to clock tree
   wire   	  p1_rx_nbclk_muxd;   // to clock tree
   wire   	  p1_rx_clk_muxd;     // to clock tree
   wire   	  p1_rbc0_a_muxd;
   wire   	  p1_rbc0_b_muxd;
   wire   	  p1_rbc0_c_muxd;
   wire   	  p1_rbc0_d_muxd;
   wire 	  tclk_156mhz;
   wire 	  rclk_156mhz;
   wire 	  opti_tclk;
   wire 	  opti_t125;
   wire 	  tclk;
   wire 	  clk4;
   wire 	  rbcx2_ext;
   wire 	  tclk156mhz_div2_clkin;
   wire 	  rclk156mhz_div2_clkin;

// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
   wire 	  toggle;
   wire 	  cnt3;
   wire 	  cnt4;
   wire 	  cnt49;
// vlint flag_dangling_net_within_module on
// vlint flag_net_has_no_load on
   
`ifdef USE_NON_INVERTING_CLOCK
   // divider clock polarity
   assign  tclk156mhz_div2_clkin = esr_tclk_312mhz;
   assign  rclk156mhz_div2_clkin = p1_rbc0_a_muxd;
   // loopback clock polarity
   assign  xmac_loopback_clk     = p1_tx_nbclk_muxd;
   assign  xpcs_loopback_clk     = esr_tclk_312mhz;
`else
   // divider clock polarity
   inv_buffer     tclk156mhz_div2_clkin_inv_buffer(.z (tclk156mhz_div2_clkin),.a(esr_tclk_312mhz));
   inv_buffer     rclk156mhz_div2_clkin_inv_buffer(.z (rclk156mhz_div2_clkin),.a(p1_rbc0_a_muxd));
   // loopback clock polarity
   inv_buffer     xmac_loopback_clk_inv_buffer    (.z (xmac_loopback_clk),    .a(p1_tx_nbclk_muxd));
   inv_buffer     xpcs_loopback_clk_inv_buffer    (.z (xpcs_loopback_clk),    .a(esr_tclk_312mhz));
`endif
   
/* *************************************
 * local clock generation logic   
 * *************************************/

DIV4_CLK clk4_DIV4_CLK(
.reset(reset),
.clk(clk),
.clk4(clk4)		 
);


DIV2_CLK tclk_156mhz_DIV2_CLK(
.reset(reset),
.clk(tclk156mhz_div2_clkin),
.clk2(tclk_156mhz)		 
);

DIV2_CLK rclk_156mhz_DIV2_CLK(
.reset(reset),
.clk(rclk156mhz_div2_clkin),
.clk2(rclk_156mhz)		 
);

// debug clock monitor
DIV2_CLK debug_tclk_156mhz_DIV2_CLK(
.reset(reset),
.clk(tclk156mhz_div2_clkin),
.clk2(debug_tclk_156mhz)		 
);

DIV2_CLK debug_rclk_156mhz_DIV2_CLK(
.reset(reset),
.clk(rclk156mhz_div2_clkin),
.clk2(debug_rclk_156mhz)		 
);
   
/* *************************************
 * tx_mac's clk mux 
 * *************************************/
 func_mux1 p1_tx_nbclk_muxd_func_mux1_u0(                      // pre LV mux
                                  .dout  (p1_tx_nbclk_muxd), 
                                  .select(sel_por_clk_src),
                                  .din1  (clk4),               // sys_clk/4
                                  .din0  (tclk));  

 func_mux1 tclk_func_mux1_u1( 
                                  .dout  (tclk),               // 156/125(optical)/125(copper)/25/2.5 Mhz
                                  .select(pcs_bypass),
                                  .din1  (cu_tclk),            // cupper phy;  125(copper)/25/2.5mhz
                                  .din0  (opti_tclk));         // optical phy; 156/125(optical)mhz

 func_mux1 opti_tclk_func_mux1_u2(
                                  .dout  (opti_tclk), 
                                  .select(xgmii_mode), 
                                  .din1  (tclk_156mhz),        // 10G -> 156mhz
                                  .din0  (opti_t125));         //  1G -> 125mhz

 func_mux1 opti_t125_func_mux1_u3(
                                  .dout  (opti_t125), 
                                  .select(atca_GE), 
                                  .din1  (esr_tclk_125mhz1),   // sel 1
                                  .din0  (esr_tclk_125mhz0));  // sel 0

 func_mux1 p1_tx_clk_muxd_func_mux1_u4( // pre LV mux
                                  .dout  (p1_tx_clk_muxd), 
                                  .select(xgmii_mode),
                                  .din1  (p1_tx_nbclk_muxd),   // 10G -> 156mhz
                                  .din0  (tx_mg_clk));         //  1G -> 125mhz

 func_mux1 tx_mg_clk_func_mux1_u5(.dout  (tx_mg_clk),
                                  .select(mii_mode),
                                  .din1  (inv_tx_heart_beat_timer3),
                                  .din0  (inv_tx_heart_beat_timer2));

/* *************************************
 * rx_mac's clk mux  
 * *************************************/
 func_mux1 p1_rx_nbclk_muxd_func_mux1_u6(
                                  .dout  (p1_rx_nbclk_muxd), 
                                  .select(loopback), 
                                  .din1(xmac_loopback_clk),
                                  .din0(mgmii_rx_clk));

 func_mux1 mgmii_rx_clk_func_mux1_u7(.dout(mgmii_rx_clk), 
                                  .select(pcs_bypass), 
                                  .din1(gmii_rx_clk),          // rx copper 1G
                                  .din0(rbcx2_ext));           // rx opti 1G

 func_mux1 rbcx2_ext_func_mux1_u8(.dout(rbcx2_ext), 
                                  .select(atca_GE), 
                                  .din1(esr_rclk_125mhz1),
                                  .din0(esr_rclk_125mhz0));

 func_mux1 p1_rx_clk_muxd_func_mux1_u9(
                                  .dout  (p1_rx_clk_muxd), 
                                  .select(xgmii_mode), 
                                  .din1(rx_xg_clk),
                                  .din0(rx_mg_clk));

 func_mux1 rx_xg_clk_func_mux1_u10(.dout(rx_xg_clk), 
                                  .select(loopback), 
                                  .din1(xmac_loopback_clk),
                                  .din0(rclk_156mhz));


 func_mux1 rx_mg_clk_func_mux1_u11(.dout(rx_mg_clk), 
                                  .select(mii_mode), 
                                  .din1(rx_heart_beat_timer[3]),
                                  .din0(rx_heart_beat_timer[2]));

/* *************************************
 * xpcs's clk mux  
 * *************************************/
 func_mux1 p1_rbc0_a_muxd_func_mux1_u16( // pre LV mux
                                  .dout(p1_rbc0_a_muxd), 
                                  .select(xpcs_loopback), 
                                  .din1(xpcs_loopback_clk),
                                  .din0(esr_mac_rclk0));

 func_mux1 p1_rbc0_b_muxd_func_mux1_u17( // pre LV mux
                                  .dout(p1_rbc0_b_muxd), 
                                  .select(xpcs_loopback), 
                                  .din1(xpcs_loopback_clk),
                                  .din0(esr_mac_rclk1));

 func_mux1 p1_rbc0_c_muxd_func_mux1_u18( // pre LV mux
                                  .dout(p1_rbc0_c_muxd), 
                                  .select(xpcs_loopback), 
                                  .din1(xpcs_loopback_clk),
                                  .din0(esr_mac_rclk2));

 func_mux1 p1_rbc0_d_muxd_func_mux1_u19( // pre LV mux
                                  .dout(p1_rbc0_d_muxd), 
                                  .select(xpcs_loopback), 
                                  .din1(xpcs_loopback_clk),
                                  .din0(esr_mac_rclk3));


`ifdef NEPTUNE
rgmii_clk_gen rgmii_clk_gen(
.ref_clk_250mhz(ref_clk_250mhz),
.reset(reset),
.gmii_mode(gmii_mode),
.sel_clk_25mhz(sel_clk_25mhz),
// output
.cu_tclk(cu_tclk),
// for observation
.toggle(toggle),		      
.cnt3(cnt3),		      
.cnt4(cnt4),		      
.cnt49(cnt49)	      
);

/* *************************************
 * eliminate LV muxes
 * *************************************/
   // tx side
   assign 	  tx_nbclk_muxd      = p1_tx_nbclk_muxd;
   assign         tx_clk_muxd        = p1_tx_clk_muxd;
   assign 	  tx_clk_312mhz_muxd = esr_tclk_312mhz;
   assign 	  rx_nbclk_muxd      = p1_rx_nbclk_muxd;
   // rx side
   assign 	  rx_clk_muxd = p1_rx_clk_muxd;
   assign 	  rbc0_a_muxd = p1_rbc0_a_muxd;
   assign 	  rbc0_b_muxd = p1_rbc0_b_muxd;
   assign 	  rbc0_c_muxd = p1_rbc0_c_muxd;
   assign 	  rbc0_d_muxd = p1_rbc0_d_muxd;
   
`else // N2 -> does not have rgmii interface
   assign 	  cu_tclk = 1'b0;
   assign 	  toggle  = 1'b0;
   assign 	  cnt3    = 1'b0;
   assign 	  cnt4    = 1'b0;
   assign 	  cnt49   = 1'b0;

/* *************************************
 * LV muxes
 * *************************************/
   // tx side
 lv_mux1 tx_nbclk_muxd_lv_mux1_u20(
                                  .dout(tx_nbclk_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_tx_nbclk_muxd),
                                  .din0(mac_125tx_test_clk));

 lv_mux1 tx_clk_muxd_lv_mux1_u21(
                                  .dout(tx_clk_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_tx_clk_muxd),
                                  .din0(mac_156tx_test_clk));

 lv_mux1 tx_clk_312mhz_muxd_lv_mux1_u22(
                                  .dout(tx_clk_312mhz_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(esr_tclk_312mhz),       // esr_mac_tclk
                                  .din0(mac_312tx_test_clk));

   // rx side
 lv_mux1 rx_nbclk_muxd_lv_mux1_u30(
                                  .dout(rx_nbclk_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rx_nbclk_muxd),
                                  .din0(mac_125rx_test_clk));

 lv_mux1 rx_clk_muxd_lv_mux1_u31(
                                  .dout(rx_clk_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rx_clk_muxd),
                                  .din0(mac_156rx_test_clk));

 lv_mux1 rbc0_a_muxd_lv_mux1_u32(
                                  .dout(rbc0_a_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rbc0_a_muxd),
                                  .din0(mac_312rx_test_clk[0]));

 lv_mux1 rbc0_b_muxd_lv_mux1_u33(
                                  .dout(rbc0_b_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rbc0_b_muxd),
                                  .din0(mac_312rx_test_clk[1]));

 lv_mux1 rbc0_c_muxd_lv_mux1_u34(
                                  .dout(rbc0_c_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rbc0_c_muxd),
                                  .din0(mac_312rx_test_clk[2]));

 lv_mux1 rbc0_d_muxd_lv_mux1_u35(
                                  .dout(rbc0_d_muxd), 
                                  .select(FUNC_MODE), 
                                  .din1(p1_rbc0_d_muxd),
                                  .din0(mac_312rx_test_clk[3]));


`endif

endmodule // xmac_2pcs_clk_mux

