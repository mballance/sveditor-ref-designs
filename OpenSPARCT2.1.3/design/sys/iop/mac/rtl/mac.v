// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mac.v
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
// # File Name    : mac.v
// # Author Name  : John Lo
// # Description  :  
// #                
// # 
// # Parent Module: 
// # Child  Module: 
// # Interface Mod: 
// # Date Created : 5/5/05
// # 
// # Copyright (c) 2020, Sun Microsystems, Inc. 
// # Sun Proprietary and Confidential   
// ##########################################################

// VPERL: PERL_BEG
//
// $VPERL_PORT_COMM = 1;
// $VPERL_INST_COMM = 2;
//
// &MODULE  ("mac");
// &DECLARE ("wire",   "aclk");
// &DECLARE ("wire",   "bclk");
// &DECLARE ("wire",   "pce_ov");
// &DECLARE ("wire",   "tcu_clk_stop");
// # declare outputs
// &DECLARE ("output", "mdclk");
// #
// &INSTANCE ("/vobs/neptune/design/niu/mac/rtl/mac_core.v",      "mac_core");
// &INSTANCE ("/vobs/neptune/design/niu/mac/rtl/hedwig.v",        "hedwig");
// &INSTANCE ("/vobs/neptune/design/niu/mac/rtl/clkgen_mac.v",    "clkgen_mac");
// &INSTANCE ("/vobs/neptune/design/niu/mac/rtl/esr_bscan.v",     "esr_bscan");

// &CONNECT ("mac_core.tcu_mac_125rx_clk_stop", "tcu_clk_stop");
// &CONNECT ("mac_core.tcu_mac_125tx_clk_stop", "tcu_clk_stop");
// &CONNECT ("mac_core.tcu_mac_156rx_clk_stop", "tcu_clk_stop");
// &CONNECT ("mac_core.tcu_mac_156tx_clk_stop", "tcu_clk_stop");
// &CONNECT ("mac_core.tcu_mac_312rx_clk_stop", "tcu_clk_stop");
// &CONNECT ("mac_core.tcu_mac_312tx_clk_stop", "tcu_clk_stop");
// &CONNECT ("hedwig.gl_mac_io_clk_stop", "tcu_clk_stop");

// &ENDMODULE;

// VPERL: PERL_END
// VPERL: GENERATED_BEG

module mac (
    mdclk,                   // output (mac_core) => (hedwig)
    cluster_arst_l,          // input  (clkgen_mac) <= ()
    cmp_gclk_c1_mac,         // input  (clkgen_mac) <= ()
    esr_mac_rclk_0,          // input  (hedwig,mac_core) <= ()
    esr_mac_rclk_1,          // input  (hedwig,mac_core) <= ()
    esr_mac_rxd0_0,          // input  (mac_core) <= ()
    esr_mac_rxd0_1,          // input  (mac_core) <= ()
    esr_mac_rxd1_0,          // input  (mac_core) <= ()
    esr_mac_rxd1_1,          // input  (mac_core) <= ()
    esr_mac_rxd2_0,          // input  (mac_core) <= ()
    esr_mac_rxd2_1,          // input  (mac_core) <= ()
    esr_mac_rxd3_0,          // input  (mac_core) <= ()
    esr_mac_rxd3_1,          // input  (mac_core) <= ()
    esr_mac_tclk_0,          // input  (hedwig,mac_core) <= ()
    esr_mac_tclk_1,          // input  (hedwig,mac_core) <= ()
    gl_mac_,                 // input  (clkgen_mac) <= ()
    gl_mac_io_clk_stop,      // input  (clkgen_mac) <= ()
    gl_mac_io_out,           // input  (clkgen_mac) <= ()
    mac_125rx_test_clk,      // input  (hedwig,mac_core) <= ()
    mac_125tx_test_clk,      // input  (mac_core) <= ()
    mac_156rx_test_clk,      // input  (mac_core) <= ()
    mac_156tx_test_clk,      // input  (mac_core) <= ()
    mac_312rx_test_clk,      // input  (mac_core) <= ()
    mac_312tx_test_clk,      // input  (mac_core) <= ()
    mac_reset0,              // input  (mac_core) <= ()
    mac_reset1,              // input  (mac_core) <= ()
    mdi,                     // input  (mac_core) <= ()
    peu_mac_sbs_input,       // input  (esr_bscan) <= ()
    pio_clients_addr,        // input  (mac_core) <= ()
    pio_clients_rd,          // input  (mac_core) <= ()
    pio_clients_wdata,       // input  (mac_core) <= ()
    pio_mac_sel,             // input  (mac_core) <= ()
    rxc_mac_req0,            // input  (mac_core) <= ()
    rxc_mac_req1,            // input  (mac_core) <= ()
    scan_in,                 // input  (clkgen_mac) <= ()
    stspll_0,                // input  (hedwig) <= ()
    stspll_1,                // input  (hedwig) <= ()
    stsrx0_0,                // input  (hedwig) <= ()
    stsrx0_1,                // input  (hedwig) <= ()
    stsrx1_0,                // input  (hedwig) <= ()
    stsrx1_1,                // input  (hedwig) <= ()
    stsrx2_0,                // input  (hedwig) <= ()
    stsrx2_1,                // input  (hedwig) <= ()
    stsrx3_0,                // input  (hedwig) <= ()
    stsrx3_1,                // input  (hedwig) <= ()
    ststx0_0,                // input  (hedwig) <= ()
    ststx0_1,                // input  (hedwig) <= ()
    ststx1_0,                // input  (hedwig) <= ()
    ststx1_1,                // input  (hedwig) <= ()
    ststx2_0,                // input  (hedwig) <= ()
    ststx2_1,                // input  (hedwig) <= ()
    ststx3_0,                // input  (hedwig) <= ()
    ststx3_1,                // input  (hedwig) <= ()
    tcu_aclk,                // input  (clkgen_mac) <= ()
    tcu_atpg_mode,           // input  (clkgen_mac) <= ()
    tcu_bclk,                // input  (clkgen_mac) <= ()
    tcu_div_bypass,          // input  (clkgen_mac) <= ()
    tcu_pce_ov,              // input  (clkgen_mac) <= ()
    tcu_sbs_aclk,            // input  (esr_bscan) <= ()
    tcu_sbs_acmode,          // input  (esr_bscan) <= ()
    tcu_sbs_actestsignal,    // input  (esr_bscan) <= ()
    tcu_sbs_bclk,            // input  (esr_bscan) <= ()
    tcu_sbs_clk,             // input  (esr_bscan) <= ()
    tcu_sbs_enbspt,          // input  (hedwig) <= ()
    tcu_sbs_enbsrx,          // input  (hedwig) <= ()
    tcu_sbs_enbstx,          // input  (hedwig) <= ()
    tcu_sbs_scan_en,         // input  (esr_bscan) <= ()
    tcu_sbs_uclk,            // input  (esr_bscan) <= ()
    tcu_scan_en,             // input  (clkgen_mac,hedwig,mac_core) <= ()
    tcu_scan_mode,           // input  (clkgen_mac,hedwig,mac_core) <= ()
    tcu_wr_inhibit,          // input  (clkgen_mac) <= ()
    txc_mac_abort0,          // input  (mac_core) <= ()
    txc_mac_abort1,          // input  (mac_core) <= ()
    txc_mac_ack0,            // input  (mac_core) <= ()
    txc_mac_ack1,            // input  (mac_core) <= ()
    txc_mac_data0,           // input  (mac_core) <= ()
    txc_mac_data1,           // input  (mac_core) <= ()
    txc_mac_stat0,           // input  (mac_core) <= ()
    txc_mac_stat1,           // input  (mac_core) <= ()
    txc_mac_tag0,            // input  (mac_core) <= ()
    txc_mac_tag1,            // input  (mac_core) <= ()
    xaui_mdint0_l,           // input  (mac_core) <= ()
    xaui_mdint1_l,           // input  (mac_core) <= ()
    cfgpll_0,                // output (hedwig) => ()
    cfgpll_1,                // output (hedwig) => ()
    cfgrx0_0,                // output (hedwig) => ()
    cfgrx0_1,                // output (hedwig) => ()
    cfgrx1_0,                // output (hedwig) => ()
    cfgrx1_1,                // output (hedwig) => ()
    cfgrx2_0,                // output (hedwig) => ()
    cfgrx2_1,                // output (hedwig) => ()
    cfgrx3_0,                // output (hedwig) => ()
    cfgrx3_1,                // output (hedwig) => ()
    cfgtx0_0,                // output (hedwig) => ()
    cfgtx0_1,                // output (hedwig) => ()
    cfgtx1_0,                // output (hedwig) => ()
    cfgtx1_1,                // output (hedwig) => ()
    cfgtx2_0,                // output (hedwig) => ()
    cfgtx2_1,                // output (hedwig) => ()
    cfgtx3_0,                // output (hedwig) => ()
    cfgtx3_1,                // output (hedwig) => ()
    mac_debug_port,          // output (mac_core) => ()
    mac_esr_tclk_0,          // output (mac_core) => ()
    mac_esr_tclk_1,          // output (mac_core) => ()
    mac_esr_txd0_0,          // output (mac_core) => ()
    mac_esr_txd0_1,          // output (mac_core) => ()
    mac_esr_txd1_0,          // output (mac_core) => ()
    mac_esr_txd1_1,          // output (mac_core) => ()
    mac_esr_txd2_0,          // output (mac_core) => ()
    mac_esr_txd2_1,          // output (mac_core) => ()
    mac_esr_txd3_0,          // output (mac_core) => ()
    mac_esr_txd3_1,          // output (mac_core) => ()
    mac_mcu_3_sbs_output,    // output (esr_bscan) => ()
    mac_pio_ack,             // output (mac_core) => ()
    mac_pio_err,             // output (mac_core) => ()
    mac_pio_intr0,           // output (mac_core) => ()
    mac_pio_intr1,           // output (mac_core) => ()
    mac_pio_rdata,           // output (mac_core) => ()
    mac_rxc_ack0,            // output (mac_core) => ()
    mac_rxc_ack1,            // output (mac_core) => ()
    mac_rxc_ctrl0,           // output (mac_core) => ()
    mac_rxc_ctrl1,           // output (mac_core) => ()
    mac_rxc_data0,           // output (mac_core) => ()
    mac_rxc_data1,           // output (mac_core) => ()
    mac_rxc_stat0,           // output (mac_core) => ()
    mac_rxc_stat1,           // output (mac_core) => ()
    mac_rxc_tag0,            // output (mac_core) => ()
    mac_rxc_tag1,            // output (mac_core) => ()
    mac_txc_req0,            // output (mac_core) => ()
    mac_txc_req1,            // output (mac_core) => ()
    mdoe,                    // output (mac_core) => ()
    mif_pio_intr,            // output (mac_core) => ()
    scan_out,                // output (clkgen_mac) => ()
    testcfg_0,               // output (hedwig) => ()
    testcfg_1,               // output (hedwig) => ()
    xaui_act_led_0,          // output (mac_core) => ()
    xaui_act_led_1,          // output (mac_core) => ()
    xaui_link_led_0,         // output (mac_core) => ()
    xaui_link_led_1          // output (mac_core) => ()
    );

input		cluster_arst_l;
input		cmp_gclk_c1_mac;       // global clk - this is either cmp or dr
input	[3:0]	esr_mac_rclk_0;        // To phy_clock_2ports of phy_clock_2ports.v
input	[3:0]	esr_mac_rclk_1;        // To phy_clock_2ports of phy_clock_2ports.v
input	[9:0]	esr_mac_rxd0_0;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd0_1;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd1_0;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd1_1;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd2_0;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd2_1;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd3_0;        // To mac_2ports of mac_2ports.v
input	[9:0]	esr_mac_rxd3_1;        // To mac_2ports of mac_2ports.v
input		esr_mac_tclk_0;        // To phy_clock_2ports of phy_clock_2ports.v
input		esr_mac_tclk_1;        // To phy_clock_2ports of phy_clock_2ports.v
input		gl_mac_;
input		gl_mac_io_clk_stop;
input		gl_mac_io_out;         // phase signal from ccu (div/4 or div/2)
input		mac_125rx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_125tx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_156rx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_156tx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_312rx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_312tx_test_clk;    // To phy_clock_2ports of phy_clock_2ports.v
input		mac_reset0;            // To mac_2ports of mac_2ports.v
input		mac_reset1;            // To mac_2ports of mac_2ports.v
input		mdi;                   // To mac_2ports of mac_2ports.v
input		peu_mac_sbs_input;
input	[19:0]	pio_clients_addr;      // To mac_2ports of mac_2ports.v
input		pio_clients_rd;        // To mac_2ports of mac_2ports.v
input	[31:0]	pio_clients_wdata;     // To mac_2ports of mac_2ports.v
input		pio_mac_sel;           // To mac_2ports of mac_2ports.v
input		rxc_mac_req0;          // To mac_2ports of mac_2ports.v
input		rxc_mac_req1;          // To mac_2ports of mac_2ports.v
input		scan_in;
input	[3:0]	stspll_0;              // from malfoy
input	[3:0]	stspll_1;              // from malfoy
input	[7:0]	stsrx0_0;              // from malfoy
input	[7:0]	stsrx0_1;              // from malfoy
input	[7:0]	stsrx1_0;              // from malfoy
input	[7:0]	stsrx1_1;              // from malfoy
input	[7:0]	stsrx2_0;              // from malfoy
input	[7:0]	stsrx2_1;              // from malfoy
input	[7:0]	stsrx3_0;              // from malfoy
input	[7:0]	stsrx3_1;              // from malfoy
input	[3:0]	ststx0_0;              // from malfoy
input	[3:0]	ststx0_1;              // from malfoy
input	[3:0]	ststx1_0;              // from malfoy
input	[3:0]	ststx1_1;              // from malfoy
input	[3:0]	ststx2_0;              // from malfoy
input	[3:0]	ststx2_1;              // from malfoy
input	[3:0]	ststx3_0;              // from malfoy
input	[3:0]	ststx3_1;              // from malfoy
input		tcu_aclk;
input		tcu_atpg_mode;
input		tcu_bclk;
input		tcu_div_bypass;        // bypasses clk divider to mux in ext clk
input		tcu_pce_ov;
input		tcu_sbs_aclk;          // from tcu
input		tcu_sbs_acmode;        // from tcu
input		tcu_sbs_actestsignal;  // from tcu
input		tcu_sbs_bclk;          // from tcu
input		tcu_sbs_clk;           // from tcu
input		tcu_sbs_enbspt;
input		tcu_sbs_enbsrx;        // from tcu
input		tcu_sbs_enbstx;        // from tcu
input		tcu_sbs_scan_en;       // from tcu
input		tcu_sbs_uclk;          // from tcu
input		tcu_scan_en;           // To mac_2ports of mac_2ports.v
input		tcu_scan_mode;         // To mac_2ports of mac_2ports.v, ...
input		tcu_wr_inhibit;
input		txc_mac_abort0;        // To mac_2ports of mac_2ports.v
input		txc_mac_abort1;        // To mac_2ports of mac_2ports.v
input		txc_mac_ack0;          // To mac_2ports of mac_2ports.v
input		txc_mac_ack1;          // To mac_2ports of mac_2ports.v
input	[63:0]	txc_mac_data0;         // To mac_2ports of mac_2ports.v
input	[63:0]	txc_mac_data1;         // To mac_2ports of mac_2ports.v
input	[3:0]	txc_mac_stat0;         // To mac_2ports of mac_2ports.v
input	[3:0]	txc_mac_stat1;         // To mac_2ports of mac_2ports.v
input		txc_mac_tag0;          // To mac_2ports of mac_2ports.v
input		txc_mac_tag1;          // To mac_2ports of mac_2ports.v
input		xaui_mdint0_l;         // To mac_2ports of mac_2ports.v
input		xaui_mdint1_l;         // To mac_2ports of mac_2ports.v
output	[11:0]	cfgpll_0;              // to malfoy
output	[11:0]	cfgpll_1;              // to malfoy
output	[27:0]	cfgrx0_0;              // to malfoy
output	[27:0]	cfgrx0_1;              // to malfoy
output	[27:0]	cfgrx1_0;              // to malfoy
output	[27:0]	cfgrx1_1;              // to malfoy
output	[27:0]	cfgrx2_0;              // to malfoy
output	[27:0]	cfgrx2_1;              // to malfoy
output	[27:0]	cfgrx3_0;              // to malfoy
output	[27:0]	cfgrx3_1;              // to malfoy
output	[19:0]	cfgtx0_0;              // to malfoy
output	[19:0]	cfgtx0_1;              // to malfoy
output	[19:0]	cfgtx1_0;              // to malfoy
output	[19:0]	cfgtx1_1;              // to malfoy
output	[19:0]	cfgtx2_0;              // to malfoy
output	[19:0]	cfgtx2_1;              // to malfoy
output	[19:0]	cfgtx3_0;              // to malfoy
output	[19:0]	cfgtx3_1;              // to malfoy
output	[31:0]	mac_debug_port;        // From mac_2ports of mac_2ports.v
output	[3:0]	mac_esr_tclk_0;        // From mac_2ports of mac_2ports.v
output	[3:0]	mac_esr_tclk_1;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd0_0;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd0_1;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd1_0;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd1_1;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd2_0;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd2_1;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd3_0;        // From mac_2ports of mac_2ports.v
output	[9:0]	mac_esr_txd3_1;        // From mac_2ports of mac_2ports.v
output		mac_mcu_3_sbs_output;
output		mac_pio_ack;           // From mac_2ports of mac_2ports.v
output		mac_pio_err;           // From mac_2ports of mac_2ports.v
output		mac_pio_intr0;         // From mac_2ports of mac_2ports.v
output		mac_pio_intr1;         // From mac_2ports of mac_2ports.v
output	[63:0]	mac_pio_rdata;         // From mac_2ports of mac_2ports.v
output		mac_rxc_ack0;          // From mac_2ports of mac_2ports.v
output		mac_rxc_ack1;          // From mac_2ports of mac_2ports.v
output		mac_rxc_ctrl0;         // From mac_2ports of mac_2ports.v
output		mac_rxc_ctrl1;         // From mac_2ports of mac_2ports.v
output	[63:0]	mac_rxc_data0;         // From mac_2ports of mac_2ports.v
output	[63:0]	mac_rxc_data1;         // From mac_2ports of mac_2ports.v
output	[22:0]	mac_rxc_stat0;         // From mac_2ports of mac_2ports.v
output	[22:0]	mac_rxc_stat1;         // From mac_2ports of mac_2ports.v
output		mac_rxc_tag0;          // From mac_2ports of mac_2ports.v
output		mac_rxc_tag1;          // From mac_2ports of mac_2ports.v
output		mac_txc_req0;          // From mac_2ports of mac_2ports.v
output		mac_txc_req1;          // From mac_2ports of mac_2ports.v
output		mdoe;                  // From mac_2ports of mac_2ports.v
output		mif_pio_intr;          // From mac_2ports of mac_2ports.v
output		scan_out;
output	[15:0]	testcfg_0;             // to malfoy
output	[15:0]	testcfg_1;             // to malfoy
output		xaui_act_led_0;        // From mac_2ports of mac_2ports.v
output		xaui_act_led_1;        // From mac_2ports of mac_2ports.v
output		xaui_link_led_0;       // From mac_2ports of mac_2ports.v
output		xaui_link_led_1;       // From mac_2ports of mac_2ports.v

wire		BSRXN0_0;
wire		BSRXN0_1;
wire		BSRXN1_0;
wire		BSRXN1_1;
wire		BSRXN2_0;
wire		BSRXN2_1;
wire		BSRXN3_0;
wire		BSRXN3_1;
wire		BSRXP0_0;
wire		BSRXP0_1;
wire		BSRXP1_0;
wire		BSRXP1_1;
wire		BSRXP2_0;
wire		BSRXP2_1;
wire		BSRXP3_0;
wire		BSRXP3_1;
wire	[1:0]	cfgrx0_0_b25_b24;
wire	[1:0]	cfgrx0_1_b25_b24;
wire	[1:0]	cfgrx1_0_b25_b24;
wire	[1:0]	cfgrx1_1_b25_b24;
wire	[1:0]	cfgrx2_0_b25_b24;
wire	[1:0]	cfgrx2_1_b25_b24;
wire	[1:0]	cfgrx3_0_b25_b24;
wire	[1:0]	cfgrx3_1_b25_b24;
wire		cfgtx0_0_17;
wire		cfgtx0_1_17;
wire		cfgtx1_0_17;
wire		cfgtx1_1_17;
wire		cfgtx2_0_17;
wire		cfgtx2_1_17;
wire		cfgtx3_0_17;
wire		cfgtx3_1_17;
wire		esr_mac_lock_0;
wire		esr_mac_lock_1;
wire	[3:0]	esr_mac_los_0;
wire	[3:0]	esr_mac_los_1;
wire		esr_mac_oddcg0_0;
wire		esr_mac_oddcg0_1;
wire		mdi_0;
wire		mdi_1;
wire		mdo;
wire		niu_clk;
wire		niu_reset_l;
wire		serdes_reset_0;
wire		serdes_reset_1;
wire		aclk;                  // buffered version of aclk
wire		bclk;                  // buffered version of bclk
wire		pce_ov;                // buffered version of pce_ov
wire		tcu_clk_stop;
output		mdclk;                 // From mac_2ports of mac_2ports.v

mac_core mac_core (
    .esr_mac_lock_0         (esr_mac_lock_0),          // input  (mac_core) <= (hedwig)
    .esr_mac_lock_1         (esr_mac_lock_1),          // input  (mac_core) <= (hedwig)
    .esr_mac_los_0          (esr_mac_los_0[3:0]),      // input  (mac_core) <= (hedwig)
    .esr_mac_los_1          (esr_mac_los_1[3:0]),      // input  (mac_core) <= (hedwig)
    .esr_mac_oddcg0_0       (esr_mac_oddcg0_0),        // input  (mac_core) <= (hedwig)
    .esr_mac_oddcg0_1       (esr_mac_oddcg0_1),        // input  (mac_core) <= (hedwig)
    .esr_mac_rclk_0         (esr_mac_rclk_0[3:0]),     // input  (hedwig,mac_core) <= ()
    .esr_mac_rclk_1         (esr_mac_rclk_1[3:0]),     // input  (hedwig,mac_core) <= ()
    .esr_mac_rxd0_0         (esr_mac_rxd0_0[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd0_1         (esr_mac_rxd0_1[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd1_0         (esr_mac_rxd1_0[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd1_1         (esr_mac_rxd1_1[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd2_0         (esr_mac_rxd2_0[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd2_1         (esr_mac_rxd2_1[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd3_0         (esr_mac_rxd3_0[9:0]),     // input  (mac_core) <= ()
    .esr_mac_rxd3_1         (esr_mac_rxd3_1[9:0]),     // input  (mac_core) <= ()
    .esr_mac_tclk_0         (esr_mac_tclk_0),          // input  (hedwig,mac_core) <= ()
    .esr_mac_tclk_1         (esr_mac_tclk_1),          // input  (hedwig,mac_core) <= ()
    .mac_125rx_test_clk     (mac_125rx_test_clk),      // input  (hedwig,mac_core) <= ()
    .mac_125tx_test_clk     (mac_125tx_test_clk),      // input  (mac_core) <= ()
    .mac_156rx_test_clk     (mac_156rx_test_clk),      // input  (mac_core) <= ()
    .mac_156tx_test_clk     (mac_156tx_test_clk),      // input  (mac_core) <= ()
    .mac_312rx_test_clk     (mac_312rx_test_clk),      // input  (mac_core) <= ()
    .mac_312tx_test_clk     (mac_312tx_test_clk),      // input  (mac_core) <= ()
    .mac_reset0             (mac_reset0),              // input  (mac_core) <= ()
    .mac_reset1             (mac_reset1),              // input  (mac_core) <= ()
    .mdi                    (mdi),                     // input  (mac_core) <= ()
    .mdi_0                  (mdi_0),                   // input  (mac_core) <= (hedwig)
    .mdi_1                  (mdi_1),                   // input  (mac_core) <= (hedwig)
    .niu_clk                (niu_clk),                 // input  (mac_core) <= (clkgen_mac)
    .niu_reset_l            (niu_reset_l),             // input  (hedwig,mac_core) <= (clkgen_mac)
    .pio_clients_addr       (pio_clients_addr[19:0]),  // input  (mac_core) <= ()
    .pio_clients_rd         (pio_clients_rd),          // input  (mac_core) <= ()
    .pio_clients_wdata      (pio_clients_wdata[31:0]), // input  (mac_core) <= ()
    .pio_mac_sel            (pio_mac_sel),             // input  (mac_core) <= ()
    .rxc_mac_req0           (rxc_mac_req0),            // input  (mac_core) <= ()
    .rxc_mac_req1           (rxc_mac_req1),            // input  (mac_core) <= ()
    .tcu_mac_125rx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_mac_125tx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_mac_156rx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_mac_156tx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_mac_312rx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_mac_312tx_clk_stop (tcu_clk_stop),            // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_scan_en            (tcu_scan_en),             // input  (clkgen_mac,hedwig,mac_core) <= ()
    .tcu_scan_mode          (tcu_scan_mode),           // input  (clkgen_mac,hedwig,mac_core) <= ()
    .txc_mac_abort0         (txc_mac_abort0),          // input  (mac_core) <= ()
    .txc_mac_abort1         (txc_mac_abort1),          // input  (mac_core) <= ()
    .txc_mac_ack0           (txc_mac_ack0),            // input  (mac_core) <= ()
    .txc_mac_ack1           (txc_mac_ack1),            // input  (mac_core) <= ()
    .txc_mac_data0          (txc_mac_data0[63:0]),     // input  (mac_core) <= ()
    .txc_mac_data1          (txc_mac_data1[63:0]),     // input  (mac_core) <= ()
    .txc_mac_stat0          (txc_mac_stat0[3:0]),      // input  (mac_core) <= ()
    .txc_mac_stat1          (txc_mac_stat1[3:0]),      // input  (mac_core) <= ()
    .txc_mac_tag0           (txc_mac_tag0),            // input  (mac_core) <= ()
    .txc_mac_tag1           (txc_mac_tag1),            // input  (mac_core) <= ()
    .xaui_mdint0_l          (xaui_mdint0_l),           // input  (mac_core) <= ()
    .xaui_mdint1_l          (xaui_mdint1_l),           // input  (mac_core) <= ()
    .mac_debug_port         (mac_debug_port[31:0]),    // output (mac_core) => ()
    .mac_esr_tclk_0         (mac_esr_tclk_0[3:0]),     // output (mac_core) => ()
    .mac_esr_tclk_1         (mac_esr_tclk_1[3:0]),     // output (mac_core) => ()
    .mac_esr_txd0_0         (mac_esr_txd0_0[9:0]),     // output (mac_core) => ()
    .mac_esr_txd0_1         (mac_esr_txd0_1[9:0]),     // output (mac_core) => ()
    .mac_esr_txd1_0         (mac_esr_txd1_0[9:0]),     // output (mac_core) => ()
    .mac_esr_txd1_1         (mac_esr_txd1_1[9:0]),     // output (mac_core) => ()
    .mac_esr_txd2_0         (mac_esr_txd2_0[9:0]),     // output (mac_core) => ()
    .mac_esr_txd2_1         (mac_esr_txd2_1[9:0]),     // output (mac_core) => ()
    .mac_esr_txd3_0         (mac_esr_txd3_0[9:0]),     // output (mac_core) => ()
    .mac_esr_txd3_1         (mac_esr_txd3_1[9:0]),     // output (mac_core) => ()
    .mac_pio_ack            (mac_pio_ack),             // output (mac_core) => ()
    .mac_pio_err            (mac_pio_err),             // output (mac_core) => ()
    .mac_pio_intr0          (mac_pio_intr0),           // output (mac_core) => ()
    .mac_pio_intr1          (mac_pio_intr1),           // output (mac_core) => ()
    .mac_pio_rdata          (mac_pio_rdata[63:0]),     // output (mac_core) => ()
    .mac_rxc_ack0           (mac_rxc_ack0),            // output (mac_core) => ()
    .mac_rxc_ack1           (mac_rxc_ack1),            // output (mac_core) => ()
    .mac_rxc_ctrl0          (mac_rxc_ctrl0),           // output (mac_core) => ()
    .mac_rxc_ctrl1          (mac_rxc_ctrl1),           // output (mac_core) => ()
    .mac_rxc_data0          (mac_rxc_data0[63:0]),     // output (mac_core) => ()
    .mac_rxc_data1          (mac_rxc_data1[63:0]),     // output (mac_core) => ()
    .mac_rxc_stat0          (mac_rxc_stat0[22:0]),     // output (mac_core) => ()
    .mac_rxc_stat1          (mac_rxc_stat1[22:0]),     // output (mac_core) => ()
    .mac_rxc_tag0           (mac_rxc_tag0),            // output (mac_core) => ()
    .mac_rxc_tag1           (mac_rxc_tag1),            // output (mac_core) => ()
    .mac_txc_req0           (mac_txc_req0),            // output (mac_core) => ()
    .mac_txc_req1           (mac_txc_req1),            // output (mac_core) => ()
    .mdclk                  (mdclk),                   // output (mac_core) => (hedwig)
    .mdo                    (mdo),                     // output (mac_core) => (hedwig)
    .mdoe                   (mdoe),                    // output (mac_core) => ()
    .mif_pio_intr           (mif_pio_intr),            // output (mac_core) => ()
    .serdes_reset_0         (serdes_reset_0),          // output (mac_core) => (hedwig)
    .serdes_reset_1         (serdes_reset_1),          // output (mac_core) => (hedwig)
    .xaui_act_led_0         (xaui_act_led_0),          // output (mac_core) => ()
    .xaui_act_led_1         (xaui_act_led_1),          // output (mac_core) => ()
    .xaui_link_led_0        (xaui_link_led_0),         // output (mac_core) => ()
    .xaui_link_led_1        (xaui_link_led_1)          // output (mac_core) => ()
    );

hedwig hedwig (
    .cfgtx0_0           (cfgtx0_0[19:0]),        // output (hedwig) => ()
    .cfgtx1_0           (cfgtx1_0[19:0]),        // output (hedwig) => ()
    .cfgtx2_0           (cfgtx2_0[19:0]),        // output (hedwig) => ()
    .cfgtx3_0           (cfgtx3_0[19:0]),        // output (hedwig) => ()
    .cfgrx0_0           (cfgrx0_0[27:0]),        // output (hedwig) => ()
    .cfgrx1_0           (cfgrx1_0[27:0]),        // output (hedwig) => ()
    .cfgrx2_0           (cfgrx2_0[27:0]),        // output (hedwig) => ()
    .cfgrx3_0           (cfgrx3_0[27:0]),        // output (hedwig) => ()
    .cfgpll_0           (cfgpll_0[11:0]),        // output (hedwig) => ()
    .testcfg_0          (testcfg_0[15:0]),       // output (hedwig) => ()
    .ststx0_0           (ststx0_0[3:0]),         // input  (hedwig) <= ()
    .ststx1_0           (ststx1_0[3:0]),         // input  (hedwig) <= ()
    .ststx2_0           (ststx2_0[3:0]),         // input  (hedwig) <= ()
    .ststx3_0           (ststx3_0[3:0]),         // input  (hedwig) <= ()
    .stsrx0_0           (stsrx0_0[7:0]),         // input  (hedwig) <= ()
    .stsrx1_0           (stsrx1_0[7:0]),         // input  (hedwig) <= ()
    .stsrx2_0           (stsrx2_0[7:0]),         // input  (hedwig) <= ()
    .stsrx3_0           (stsrx3_0[7:0]),         // input  (hedwig) <= ()
    .stspll_0           (stspll_0[3:0]),         // input  (hedwig) <= ()
    .esr_mac_rclk_0     (esr_mac_rclk_0[3:0]),   // input  (hedwig,mac_core) <= ()
    .esr_mac_tclk_0     (esr_mac_tclk_0),        // input  (hedwig,mac_core) <= ()
    .serdes_reset_0     (serdes_reset_0),        // input  (hedwig) <= (mac_core)
    .cfgtx0_1           (cfgtx0_1[19:0]),        // output (hedwig) => ()
    .cfgtx1_1           (cfgtx1_1[19:0]),        // output (hedwig) => ()
    .cfgtx2_1           (cfgtx2_1[19:0]),        // output (hedwig) => ()
    .cfgtx3_1           (cfgtx3_1[19:0]),        // output (hedwig) => ()
    .cfgrx0_1           (cfgrx0_1[27:0]),        // output (hedwig) => ()
    .cfgrx1_1           (cfgrx1_1[27:0]),        // output (hedwig) => ()
    .cfgrx2_1           (cfgrx2_1[27:0]),        // output (hedwig) => ()
    .cfgrx3_1           (cfgrx3_1[27:0]),        // output (hedwig) => ()
    .cfgpll_1           (cfgpll_1[11:0]),        // output (hedwig) => ()
    .testcfg_1          (testcfg_1[15:0]),       // output (hedwig) => ()
    .ststx0_1           (ststx0_1[3:0]),         // input  (hedwig) <= ()
    .ststx1_1           (ststx1_1[3:0]),         // input  (hedwig) <= ()
    .ststx2_1           (ststx2_1[3:0]),         // input  (hedwig) <= ()
    .ststx3_1           (ststx3_1[3:0]),         // input  (hedwig) <= ()
    .stsrx0_1           (stsrx0_1[7:0]),         // input  (hedwig) <= ()
    .stsrx1_1           (stsrx1_1[7:0]),         // input  (hedwig) <= ()
    .stsrx2_1           (stsrx2_1[7:0]),         // input  (hedwig) <= ()
    .stsrx3_1           (stsrx3_1[7:0]),         // input  (hedwig) <= ()
    .stspll_1           (stspll_1[3:0]),         // input  (hedwig) <= ()
    .esr_mac_rclk_1     (esr_mac_rclk_1[3:0]),   // input  (hedwig,mac_core) <= ()
    .esr_mac_tclk_1     (esr_mac_tclk_1),        // input  (hedwig,mac_core) <= ()
    .serdes_reset_1     (serdes_reset_1),        // input  (hedwig) <= (mac_core)
    .esr_mac_oddcg0_0   (esr_mac_oddcg0_0),      // output (hedwig) => (mac_core)
    .esr_mac_los_0      (esr_mac_los_0[3:0]),    // output (hedwig) => (mac_core)
    .esr_mac_lock_0     (esr_mac_lock_0),        // output (hedwig) => (mac_core)
    .esr_mac_oddcg0_1   (esr_mac_oddcg0_1),      // output (hedwig) => (mac_core)
    .esr_mac_los_1      (esr_mac_los_1[3:0]),    // output (hedwig) => (mac_core)
    .esr_mac_lock_1     (esr_mac_lock_1),        // output (hedwig) => (mac_core)
    .tcu_sbs_enbstx     (tcu_sbs_enbstx),        // input  (hedwig) <= ()
    .tcu_sbs_enbsrx     (tcu_sbs_enbsrx),        // input  (hedwig) <= ()
    .cfgtx0_0_17        (cfgtx0_0_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx1_0_17        (cfgtx1_0_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx2_0_17        (cfgtx2_0_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx3_0_17        (cfgtx3_0_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx0_1_17        (cfgtx0_1_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx1_1_17        (cfgtx1_1_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx2_1_17        (cfgtx2_1_17),           // input  (hedwig) <= (esr_bscan)
    .cfgtx3_1_17        (cfgtx3_1_17),           // input  (hedwig) <= (esr_bscan)
    .cfgrx0_0_b25_b24   (cfgrx0_0_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx1_0_b25_b24   (cfgrx1_0_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx2_0_b25_b24   (cfgrx2_0_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx3_0_b25_b24   (cfgrx3_0_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx0_1_b25_b24   (cfgrx0_1_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx1_1_b25_b24   (cfgrx1_1_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx2_1_b25_b24   (cfgrx2_1_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .cfgrx3_1_b25_b24   (cfgrx3_1_b25_b24[1:0]), // input  (hedwig) <= (esr_bscan)
    .tcu_scan_mode      (tcu_scan_mode),         // input  (clkgen_mac,hedwig,mac_core) <= ()
    .gl_mac_io_clk_stop (tcu_clk_stop),          // input  (hedwig,mac_core) <= (clkgen_mac)
    .tcu_scan_en        (tcu_scan_en),           // input  (clkgen_mac,hedwig,mac_core) <= ()
    .tcu_sbs_enbspt     (tcu_sbs_enbspt),        // input  (hedwig) <= ()
    .mac_125rx_test_clk (mac_125rx_test_clk),    // input  (hedwig,mac_core) <= ()
    .BSRXP0_0           (BSRXP0_0),              // output (hedwig) => (esr_bscan)
    .BSRXP1_0           (BSRXP1_0),              // output (hedwig) => (esr_bscan)
    .BSRXP2_0           (BSRXP2_0),              // output (hedwig) => (esr_bscan)
    .BSRXP3_0           (BSRXP3_0),              // output (hedwig) => (esr_bscan)
    .BSRXN0_0           (BSRXN0_0),              // output (hedwig) => (esr_bscan)
    .BSRXN1_0           (BSRXN1_0),              // output (hedwig) => (esr_bscan)
    .BSRXN2_0           (BSRXN2_0),              // output (hedwig) => (esr_bscan)
    .BSRXN3_0           (BSRXN3_0),              // output (hedwig) => (esr_bscan)
    .BSRXP0_1           (BSRXP0_1),              // output (hedwig) => (esr_bscan)
    .BSRXP1_1           (BSRXP1_1),              // output (hedwig) => (esr_bscan)
    .BSRXP2_1           (BSRXP2_1),              // output (hedwig) => (esr_bscan)
    .BSRXP3_1           (BSRXP3_1),              // output (hedwig) => (esr_bscan)
    .BSRXN0_1           (BSRXN0_1),              // output (hedwig) => (esr_bscan)
    .BSRXN1_1           (BSRXN1_1),              // output (hedwig) => (esr_bscan)
    .BSRXN2_1           (BSRXN2_1),              // output (hedwig) => (esr_bscan)
    .BSRXN3_1           (BSRXN3_1),              // output (hedwig) => (esr_bscan)
    .niu_reset_l        (niu_reset_l),           // input  (hedwig,mac_core) <= (clkgen_mac)
    .mdclk              (mdclk),                 // input  (hedwig) <= (mac_core)
    .mdo                (mdo),                   // input  (hedwig) <= (mac_core)
    .mdi_0              (mdi_0),                 // output (hedwig) => (mac_core)
    .mdi_1              (mdi_1)                  // output (hedwig) => (mac_core)
    );

clkgen_mac clkgen_mac (
    .niu_clk            (niu_clk),            // output (clkgen_mac) => (mac_core)
    .aclk               (aclk),               // output (clkgen_mac) => ()
    .bclk               (bclk),               // output (clkgen_mac) => ()
    .scan_out           (scan_out),           // output (clkgen_mac) => ()
    .pce_ov             (pce_ov),             // output (clkgen_mac) => ()
    .tcu_clk_stop       (tcu_clk_stop),       // output (clkgen_mac) => (hedwig,mac_core)
    .niu_reset_l        (niu_reset_l),        // output (clkgen_mac) => (hedwig,mac_core)
    .tcu_pce_ov         (tcu_pce_ov),         // input  (clkgen_mac) <= ()
    .tcu_div_bypass     (tcu_div_bypass),     // input  (clkgen_mac) <= ()
    .tcu_scan_en        (tcu_scan_en),        // input  (clkgen_mac,hedwig,mac_core) <= ()
    .gl_mac_io_clk_stop (gl_mac_io_clk_stop), // input  (clkgen_mac) <= ()
    .scan_in            (scan_in),            // input  (clkgen_mac) <= ()
    .tcu_wr_inhibit     (tcu_wr_inhibit),     // input  (clkgen_mac) <= ()
    .tcu_atpg_mode      (tcu_atpg_mode),      // input  (clkgen_mac) <= ()
    .tcu_scan_mode      (tcu_scan_mode),      // input  (clkgen_mac,hedwig,mac_core) <= ()
    .gl_mac_io_out      (gl_mac_io_out),      // input  (clkgen_mac) <= ()
    .cmp_gclk_c1_mac    (cmp_gclk_c1_mac),    // input  (clkgen_mac) <= ()
    .tcu_aclk           (tcu_aclk),           // input  (clkgen_mac) <= ()
    .tcu_bclk           (tcu_bclk),           // input  (clkgen_mac) <= ()
    .cluster_arst_l     (cluster_arst_l),     // input  (clkgen_mac) <= ()
    .gl_mac_            (gl_mac_)             // input  (clkgen_mac) <= ()
    );

esr_bscan esr_bscan (
    .peu_mac_sbs_input    (peu_mac_sbs_input),     // input  (esr_bscan) <= ()
    .mac_mcu_3_sbs_output (mac_mcu_3_sbs_output),  // output (esr_bscan) => ()
    .tcu_sbs_scan_en      (tcu_sbs_scan_en),       // input  (esr_bscan) <= ()
    .tcu_sbs_aclk         (tcu_sbs_aclk),          // input  (esr_bscan) <= ()
    .tcu_sbs_bclk         (tcu_sbs_bclk),          // input  (esr_bscan) <= ()
    .tcu_sbs_clk          (tcu_sbs_clk),           // input  (esr_bscan) <= ()
    .tcu_sbs_uclk         (tcu_sbs_uclk),          // input  (esr_bscan) <= ()
    .tcu_sbs_acmode       (tcu_sbs_acmode),        // input  (esr_bscan) <= ()
    .tcu_sbs_actestsignal (tcu_sbs_actestsignal),  // input  (esr_bscan) <= ()
    .BSRXP0_0             (BSRXP0_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXP1_0             (BSRXP1_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXP2_0             (BSRXP2_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXP3_0             (BSRXP3_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXN0_0             (BSRXN0_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXN1_0             (BSRXN1_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXN2_0             (BSRXN2_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXN3_0             (BSRXN3_0),              // input  (esr_bscan) <= (hedwig)
    .BSRXP0_1             (BSRXP0_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXP1_1             (BSRXP1_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXP2_1             (BSRXP2_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXP3_1             (BSRXP3_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXN0_1             (BSRXN0_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXN1_1             (BSRXN1_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXN2_1             (BSRXN2_1),              // input  (esr_bscan) <= (hedwig)
    .BSRXN3_1             (BSRXN3_1),              // input  (esr_bscan) <= (hedwig)
    .cfgtx0_0_17          (cfgtx0_0_17),           // output (esr_bscan) => (hedwig)
    .cfgtx1_0_17          (cfgtx1_0_17),           // output (esr_bscan) => (hedwig)
    .cfgtx2_0_17          (cfgtx2_0_17),           // output (esr_bscan) => (hedwig)
    .cfgtx3_0_17          (cfgtx3_0_17),           // output (esr_bscan) => (hedwig)
    .cfgtx0_1_17          (cfgtx0_1_17),           // output (esr_bscan) => (hedwig)
    .cfgtx1_1_17          (cfgtx1_1_17),           // output (esr_bscan) => (hedwig)
    .cfgtx2_1_17          (cfgtx2_1_17),           // output (esr_bscan) => (hedwig)
    .cfgtx3_1_17          (cfgtx3_1_17),           // output (esr_bscan) => (hedwig)
    .cfgrx0_0_b25_b24     (cfgrx0_0_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx1_0_b25_b24     (cfgrx1_0_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx2_0_b25_b24     (cfgrx2_0_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx3_0_b25_b24     (cfgrx3_0_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx0_1_b25_b24     (cfgrx0_1_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx1_1_b25_b24     (cfgrx1_1_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx2_1_b25_b24     (cfgrx2_1_b25_b24[1:0]), // output (esr_bscan) => (hedwig)
    .cfgrx3_1_b25_b24     (cfgrx3_1_b25_b24[1:0])  // output (esr_bscan) => (hedwig)
    );

endmodule

// VPERL: GENERATED_END

