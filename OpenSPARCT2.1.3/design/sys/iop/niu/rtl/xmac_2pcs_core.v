// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xmac_2pcs_core.v
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
 * File Name    : xmac_2pcs_core
 * Author Name  : John Lo
 * Description  : xmac + pcs + xpcs 
 * Parent Module: mac_top 
 * Child  Module: many
 * Interface Mod: many.
 * Date Created : 8/17/01
 *
 * Copyright (c) 2003, Sun Microsystems, Inc. 
 * Sun Proprietary and Confidential   
 *
 * Modification : on 3-23-04 loj changed xrx_code_group and xtx_code_group 
 *                from 80 bits to 40 bits.
 * 
 * Synthesis Notes: 
 * 
 *************************************************************************/

`include  "xmac.h"

module xmac_2pcs_core (
/*******************************************************************
 * xmac signals
 *******************************************************************/
/* ------------- xmac clocks --------------------------------------- */   
clk,              // from system clock
tx_clk,           // from clock tree
tx_clk_312mhz,    // from clock tree
tx_nbclk,         // from clock tree
rx_clk,           // from clock tree
rx_nbclk,         // from clock tree
sys_clk_count,
tx_heart_beat_timer,
rx_heart_beat_timer,
/* -------------  shared MII/GMII/RGMII Interface ------------------ */
gmii_rxd,
gmii_rx_dv,
gmii_rx_err,
gmii_txd,
gmii_tx_en,
gmii_tx_err,
/* ------------- XGMII Interface ----------------------------------- */
xgmii_rxc,
xgmii_rxd,
xgmii_txc,
xgmii_txd,
/* ------------- xmac pio Interface -------------------------------- */
pio_core_reset,   // becomes hw_reset
pio_rd,           // r/w_
pio_addr,         // address
pio_wr_data,      // wr_data
pio_rd_data_xmac, // rd_data
pio_core_sel_xmac,// sel
pio_ack_xmac,     // ack
pio_err_xmac,		       
txmac_interrupt,
rxmac_interrupt,
xmac_fc_interrupt,
/* ------------- xpcs pio Interface -------------------------------- */
rdata_xpcs,       // rd_data
sel_xpcs,         // sel
ack_xpcs,         // ack
pio_err_xpcs,		       
xpcs_interrupt,
/* ------------- Tx DMA Interface ---------------------------------- */
txmac_opp_req,
opp_txmac_ack,
opp_txmac_tag,
opp_txmac_data,
opp_txmac_stat,
opp_txmac_abort,
/* ------------- Rx DMA Interface ---------------------------------- */
ipp_rxmac_req,
rxmac_ipp_ack,
rxmac_ipp_tag,
rxmac_ipp_data,   // {64 bit data}
rxmac_ipp_ctrl,
rxmac_ipp_stat,
/* ------------- xmac_xpcs_clk_mux control signals ----------------- */
sel_clk_25mhz,
loopback,
sel_por_clk_src,
mii_mode,
gmii_mode,
xgmii_mode,
pcs_bypass,
xpcs_loopback,
/* ------------- PCS related Interface ----------------------------- */
/*************
 * phy_dpath signals
 *************/
gmii_crs,	  // from external gmii interface	
gmii_col,	  // from external gmii interface
/************
 * pcs signals
 ************/
odd_rx,	          // indicates alignment to word boundary
serdes_rdy,		       
signal_detect,	  // input from optics which indicates light ok
rx_code_group,    // from internal serdes
tx_code_group,    // to internal serdes
pcs_pio_req,      //
pcs_pio_ack,	  // pio acknowledge
pcs_pio_err,
pcs_pio_rd_data,  // pio read data out
pcs_int,	  // pcs link down interrupt, secondary interrupt
/* ------------- xPCS Interface ------------------------------------ */
// rx xpcs signals
xserdes_rdy,		       
xsignal_detect,   // input from optics which indicates light ok
rbc0_a,           // 312 MHz rx clock
rbc0_b,           // 312 MHz rx clock
rbc0_c,           // 312 MHz rx clock
rbc0_d,           // 312 MHz rx clock
// rx PMD related signals
link_up_led,
activity_led,		       
xrx_code_group,	  // symbol to send over link
xtx_code_group,	  // symbol to send over link
MDINT,
// debug
xmac_debug,
xpcs_debug,
mac_debug_sel
   );

/*******************************************************************
 * xmac signals
 *******************************************************************/
/* ------------- xmac clocks --------------------------------------- */   
   input           clk;       // from system clock
   input 	   tx_clk;    // from clock tree
   input 	   tx_clk_312mhz;    // from clock tree
   input 	   tx_nbclk;  // from clock tree
   input 	   rx_clk;    // from clock tree
   input 	   rx_nbclk;  // from clock tree
   output [2:0]	   sys_clk_count;
   output [3:0]    tx_heart_beat_timer;
   output [3:0]    rx_heart_beat_timer;
/* -------------  shared MII/GMII Interface ------------------------ */
   input           gmii_rx_dv;
   input [`BYTE]   gmii_rxd;
   input           gmii_rx_err;
   output          gmii_tx_en;
   output [`BYTE]  gmii_txd;
   output          gmii_tx_err;
/* ------------- XGMII Interface ----------------------------------- */
   input [3:0]     xgmii_rxc;
   input [31:0]    xgmii_rxd;
   output [3:0]    xgmii_txc;
   output [31:0]   xgmii_txd;
/* ------------- xmac pio Interface -------------------------------- */
   input           pio_core_reset;  // becomes hw_reset
   input           pio_core_sel_xmac;// sel
   output 	   pio_ack_xmac;
   input           pio_rd;          // r/w
   input  [8:0]	   pio_addr;        // address
   input  [31:0]   pio_wr_data;     // wr_data
   output [31:0]   pio_rd_data_xmac; // rd_data
   output          pio_err_xmac;
   output  	   txmac_interrupt;
   output  	   rxmac_interrupt;
   output  	   xmac_fc_interrupt;
/* ------------- xpcs pio Interface -------------------------------- */
   output [31:0]   rdata_xpcs;
   input 	   sel_xpcs;
   output 	   ack_xpcs;
   output 	   pio_err_xpcs;
   output 	   xpcs_interrupt;
/* ------------- Tx DMA Interface ---------------------------------- */
   output 	   txmac_opp_req;
   input           opp_txmac_ack;
   input           opp_txmac_tag;
   input [63:0]    opp_txmac_data;
   input [3:0] 	   opp_txmac_stat;
   input 	   opp_txmac_abort;
/* ------------- Rx DMA Interface ---------------------------------- */
   input 	   ipp_rxmac_req;
   output 	   rxmac_ipp_ack;
   output 	   rxmac_ipp_tag;   // output of rxfifo. non-registered.
   output [63:0]   rxmac_ipp_data;  // {64bit data}
   output 	   rxmac_ipp_ctrl;
   output [`TBITS] rxmac_ipp_stat;  // {24bit data}
/* ------------- xmac_xpcs_clk_mux control signals ----------------- */
   output 	   sel_clk_25mhz;
   output 	   loopback;
   output 	   sel_por_clk_src;
   output 	   mii_mode;
   output 	   gmii_mode;
   output 	   xgmii_mode;
   output 	   pcs_bypass;
   output 	   xpcs_loopback;

   
/* ------------- PCS Interface ------------------------------------- */
/****************************
 * phy_dpath signals
 ****************************/
//   input [7:0] 	 gmii_rxd;	 // from external gmii interface	
//   input 	 gmii_rx_dv;	 // from external gmii interface	
//   input 	 gmii_rx_err;	 // from external gmii interface	
   input 	   gmii_crs;	 // from external gmii interface	
   input 	   gmii_col;	 // from external gmii interface
/*******************************************************************
 * pcs signals
 *******************************************************************/
   input 	   odd_rx;	 // indicates alignment to word boundary
   input 	   serdes_rdy;
   input 	   signal_detect;// input from optics which indicates light ok
   input  [9:0]    rx_code_group;// from internal serdes
   output [9:0]    tx_code_group;// to internal serdes
   input 	   pcs_pio_req;
   output 	   pcs_pio_ack;	 // pio acknowledge
   output 	   pcs_pio_err;
   output [31:0]   pcs_pio_rd_data;// pio read data out
   output 	   pcs_int;	 // pcs link down interrupt, secondary interrupt
/* ------------- xPCS Interface ------------------------------------ */
                        // rx xpcs signals
   input           xserdes_rdy;
   input  [3:0]	   xsignal_detect;// input from optics which indicates light ok
   input	   rbc0_a;  	 // 312 MHz rx clock
   input	   rbc0_b;  	 // 312 MHz rx clock
   input   	   rbc0_c;  	 // 312 MHz rx clock
   input	   rbc0_d;  	 // 312 MHz rx clock
/* ------------- led signals --------------------------------------- */
   output 	   link_up_led;	 // signal to on-board LED, low pulse elongated
   output          activity_led;
/* ------------- PMD signals --------------------------------------- */
   input  [39:0]   xrx_code_group;	 // symbol from link
   output [39:0]   xtx_code_group;	 // symbol to send over link
   input 	   MDINT;
/* ------------- debug Interface ----------------------------------- */
   output [31:0]   xmac_debug;
   output [31:0]   xpcs_debug;
   output [2:0]    mac_debug_sel;
	       
// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

// internal signal
   wire 	   loopback;
   wire 	   sel_por_clk_src;
   wire 	   gmii_mode;
   wire 	   mii_mode;
   wire [2:0]      sys_clk_count;
   wire [3:0] 	   tx_heart_beat_timer;
   wire [3:0] 	   rx_heart_beat_timer;
   wire [`BYTE]    gmii_rxd_mux;
   wire [`BYTE]    gmii_rxd;
   wire [`BYTE]    gmii_txd;
   wire [9:0] 	   rx_code_group;
   wire [9:0] 	   tx_code_group;
   wire [7:0] 	   rxd_int;
   wire [31:0] 	   xgmii_rxd;
   wire [31:0] 	   xgmii_txd;
   wire [3:0] 	   xgmii_rxc;
   wire [3:0] 	   xgmii_txc;
   wire [63:0] 	   xpcs_rxd;
   wire [63:0] 	   xpcs_txd;
   wire [7:0] 	   xpcs_rxc;
   wire [7:0] 	   xpcs_txc;
   wire            force_LED_on;
   wire 	   led_polarity;
   wire 	   xlink_up_tx;
   wire 	   link_up_tx;
   wire            led_equation = force_LED_on ? 1'b1         : 
                                  xgmii_mode   ? xlink_up_tx  : 
                                                 link_up_tx   ;
   
   wire 	   link_up_led  = led_polarity ? led_equation :
		                                ~led_equation ;
   
   wire [3:0] 	   xsignal_detect;
   wire [7:0] 	   xmac_rxc;
   wire [63:0] 	   xmac_rxd;
   wire [7:0] 	   xmac_txc;
   wire [63:0] 	   xmac_txd;

   wire 	   gmii_rx_err_mux,rx_dv_int,rx_er_int,crs_int,col_int;
   
   // vlint flag_net_has_no_load            off
   // vlint flag_dangling_net_within_module off
   wire [79:0] 	   xtx_code_group_80bits;
   wire [2:0] 	   shared_sel;
   wire 	   loss_sync_rx;
   wire 	   ewrap;
   wire 	   sw_lockref;
   wire 	   phy_mode;
   wire 	   gmii_crs_mux;
   wire 	   sw_ensyncdet;
   wire 	   gmii_col_mux;
   wire 	   xpcs_bypass;
   // vlint flag_dangling_net_within_module on
   // vlint flag_net_has_no_load            on

   wire gmii_rx_dv_mux;
   
/************************************************************/
/* Instantiation of the XMAC                                */
/************************************************************/
xmac xmac(
/* ------------- xmac clocks --------------------------------------- */   
    .clk(clk),
    .tx_clk(tx_clk),
    .tx_nbclk(tx_nbclk),
    .rx_clk(rx_clk),
    .rx_nbclk(rx_nbclk),
    .sys_clk_count(sys_clk_count),
    .tx_heart_beat_timer(tx_heart_beat_timer),
    .rx_heart_beat_timer(rx_heart_beat_timer),
/* -------------  shared MII/GMII Interface ------------------------ */
    .gmii_rxd(gmii_rxd_mux),
    .gmii_rx_dv(gmii_rx_dv_mux),
    .gmii_rx_err(gmii_rx_err_mux),
    .gmii_txd(gmii_txd),
    .gmii_tx_en(gmii_tx_en),
    .gmii_tx_err(gmii_tx_err),
/* ------------- XGMII Interface ----------------------------------- */
    .xgmii_rxc(xgmii_rxc),
    .xgmii_rxd(xgmii_rxd),
    .xgmii_txc(xgmii_txc),
    .xgmii_txd(xgmii_txd),
/* ------------- XPCS Interface ----------------------------------- */
    .xpcs_rxd(xmac_rxd), // data going onto xGMII// internal 64 bit receive signals
    .xpcs_rxc(xmac_rxc), // receive data valid, GMII interface
    .xpcs_txd(xmac_txd), // internal 64 bit transmit signals // byte from MAC over GMII
    .xpcs_txc(xmac_txc), // GMII transmit enable from Mac
/* ---------------- pio Interface ---------------------------------- */
    .pio_core_reset(pio_core_reset),  // becomes hw_reset
    .pio_core_sel(pio_core_sel_xmac), // sel mac
    .pio_ack(pio_ack_xmac),
    .pio_rd(pio_rd),                    // r/w
    .pio_addr(pio_addr),                // address
    .pio_wr_data(pio_wr_data),          // wr_data
    .pio_rd_data(pio_rd_data_xmac),  // rd_data
    .pio_err(pio_err_xmac),	     
    .txmac_interrupt(txmac_interrupt),
    .rxmac_interrupt(rxmac_interrupt),
    .xmac_fc_interrupt(xmac_fc_interrupt),
/* ---------------- Tx DMA Interface ------------------------------- */
    .txmac_opp_req(txmac_opp_req),
    .opp_txmac_ack(opp_txmac_ack),
    .opp_txmac_tag(opp_txmac_tag),
    .opp_txmac_data(opp_txmac_data),
    .opp_txmac_stat(opp_txmac_stat),
    .opp_txmac_abort(opp_txmac_abort),			  
/* ---------------- Rx DMA Interface ------------------------------- */
    .rxmac_ipp_ack(rxmac_ipp_ack),
    .ipp_rxmac_req(ipp_rxmac_req),
    .rxmac_ipp_tag(rxmac_ipp_tag),
    .rxmac_ipp_data(rxmac_ipp_data),
    .rxmac_ipp_ctrl(rxmac_ipp_ctrl),
    .rxmac_ipp_stat(rxmac_ipp_stat), 
/* ------------- xmac_clk_mux control signals ---------------------- */
    .sel_clk_25mhz(sel_clk_25mhz),
    .loopback(loopback),
    .sel_por_clk_src(sel_por_clk_src),
    .mii_mode(mii_mode),
    .gmii_mode(gmii_mode),
    .xgmii_mode(xgmii_mode),
    .pcs_bypass(pcs_bypass),
    .xpcs_bypass(xpcs_bypass),
/* ------------- led signals ---------------------- */
    .force_LED_on(force_LED_on),
    .led_polarity(led_polarity),
    .activity_led(activity_led),
/* ------------- PMD signals ---------------------- */
    .MDINT(MDINT),
/* ------------- debug signals -------------------- */
    .xmac_debug(xmac_debug[31:0]),
    .mac_debug_sel(mac_debug_sel[2:0])
     );

`ifdef XGMII_ONLY
   wire 	   nothing_happen = 1;
`else
/************************************************************/
/* Instantiation of the PHY Datapath for MAC                */
/************************************************************/

phy_dpath phy_dpath(
.phy_mode(pcs_bypass),
.rxd_int(rxd_int[7:0]),	        // from PCS block
.rx_dv_int(rx_dv_int),        	// from PCS block
.rx_er_int(rx_er_int),        	// from PCS block
.crs_int(crs_int),        	// from PCS block	
.col_int(col_int),        	// from PCS block
.gmii_rxd(gmii_rxd),            // from external gmii interface	
.gmii_rx_dv(gmii_rx_dv),        // from external gmii interface	
.gmii_rx_err(gmii_rx_err),      // from external gmii interface	
.gmii_crs(gmii_crs),        	// from external gmii interface	
.gmii_col(gmii_col),        	// from external gmii interface	
// outputs
.mii_rxd(gmii_rxd_mux),		// to MAC
.mii_rx_dv(gmii_rx_dv_mux),	// to MAC
.mii_rx_err(gmii_rx_err_mux),	// to MAC
.mii_crs(gmii_crs_mux),		// to MAC
.mii_col(gmii_col_mux) 		// to MAC
);

/************************************************************/
/* Instantiation of the MAC Physical Coding Sublayer        */
/************************************************************/
pcs pcs   ( 
                .rxclk(rx_nbclk),
                .rx_10bdata(rx_code_group), // from internal serdes
                .rxd(rxd_int[7:0]),         // to phy_dpath

                .rx_dv(rx_dv_int),          // to phy_dpath
                .rx_er(rx_er_int),          // to phy_dpath

                .serdes_rdy(serdes_rdy),    // from esr_ctrl // from slink_ctrl,serdes initialized
                .link_up_tx(link_up_tx),    // to big_mac and to on-board LED, low pulse elongated. It is called link_up_tx internal to pcs.

                .odd_rx(odd_rx),	    // from phy_clock.
                .signal_detect(signal_detect),// input from optics which indicates light ok
                .an_loss_sync(loss_sync_rx),// loss of word synchronization in rx_clk domain

                .txclk(tx_nbclk),
                .tx_en(gmii_tx_en),         // from xmac
                .tx_er(gmii_tx_err),        // from xmac
                .crs(crs_int),              // to phy_dpath
                .col(col_int),              // to phy_dpath

                .txd(gmii_txd),             // from xmac
                .tx_10bdata(tx_code_group), // to serdes

                .clk(clk),
                .pio_core_reset(pio_core_reset),
                .pio_core_sel(pcs_pio_req),
                .pio_rd_wr(pio_rd),
                .pio_addr(pio_addr[6:0]),
                .pio_wr_data(pio_wr_data[17:0]),
                .slink_state(2'b0),

                .pio_err(pcs_pio_err),
                .pio_core_ack(pcs_pio_ack),
                .pio_rd_data(pcs_pio_rd_data),
                .sw_ensyncdet(sw_ensyncdet), // to slink_ctrl
                .sw_lockref(sw_lockref),     // to slink_ctrl
                .phy_mode(phy_mode),
		.shared_sel(shared_sel[2:0]),// used as a select for shared output pins
                .pcs_int(pcs_int),
                .ewrap(ewrap)                // to external serdes for loopback enable
             );

`endif // !ifdef XGMII_ONLY


/************************************************************/
/* Instantiation of the 10G MAC Physical Coding Sublayer    */
/************************************************************/

   wire [79:0] xrx_code_group_80bits;

   assign      xrx_code_group_80bits={10'b0,xrx_code_group[39:30],
                                      10'b0,xrx_code_group[29:20],
                                      10'b0,xrx_code_group[19:10],
                                      10'b0,xrx_code_group[9:0]};
   
   wire [39:0] xtx_code_group;

   assign      xtx_code_group[9:0]  =xtx_code_group_80bits[9:0];
   assign      xtx_code_group[19:10]=xtx_code_group_80bits[29:20];
   assign      xtx_code_group[29:20]=xtx_code_group_80bits[49:40];
   assign      xtx_code_group[39:30]=xtx_code_group_80bits[69:60];
   
xpcs	xpcs (
.tx_clk(tx_clk_312mhz),
//
.clk(clk),
// Serdes signals	
.rbc0_a(rbc0_a),     // channel a 312 Mhz rx clock
.rbc0_b(rbc0_b),     // channel b 312 Mhz rx clock
.rbc0_c(rbc0_c),     // channel c 312 Mhz rx clock
.rbc0_d(rbc0_d),     // channel d 312 Mhz rx clock
	      
.xrx_code_group(xrx_code_group_80bits),   // Serdes to xpcs receive symbols
.xtx_code_group(xtx_code_group_80bits),   // xpcs to Serdes transmit symbols 
// rx PMD related signals
.xsignal_detect(xsignal_detect[3:0]),     // input from optics which indicates light ok. Inputs from Sequence Detect.
.xserdes_rdy(xserdes_rdy),

.xlink_up_tx(xlink_up_tx), // signal to on-board LED, low pulse elongated
// internal 64 bit receive signals
.xpcs_rxd(xpcs_rxd),	   // data going onto xGMII
.xpcs_rxc(xpcs_rxc),	   // receive data valid, GMII interface
// internal 64 bit transmit signals 
.xpcs_txd(xpcs_txd),	   // byte from MAC over GMII
.xpcs_txc(xpcs_txc),       // GMII transmit enable from Mac
.xpcs_loopback(xpcs_loopback),
//	      
// pio signals
.pio_core_reset(pio_core_reset),  // becomes hw_reset
.sel_xpcs(sel_xpcs),
.ack_xpcs(ack_xpcs),
.pio_err_xpcs(pio_err_xpcs),
.pio_addr(pio_addr[8:0] ),    // local global pio signal
.pio_rd(pio_rd),              // local global pio signal
.pio_wdata(pio_wr_data[31:0] ),// local global pio signal
.rdata_xpcs(rdata_xpcs[31:0] ),
.xpcs_interrupt(xpcs_interrupt),
.xpcs_debug(xpcs_debug)
);

   
/************************************************************/
/* Instantiation of the xMAC xPCS interface                 */
/************************************************************/
x64_intf x64_intf(
// XPCS Interface
.rbc0_a(rbc0_a),          // 312mhz
.tx_clk_312mhz(tx_clk_312mhz),   // 312mhz
.xpcs_rxc(xpcs_rxc),
.xpcs_rxd(xpcs_rxd),
.xpcs_txc(xpcs_txc),
.xpcs_txd(xpcs_txd),
// XMAC Interface
.rx_clk(rx_clk),
.tx_clk(tx_clk),
.xmac_rxc(xmac_rxc),
.xmac_rxd(xmac_rxd),
.xmac_txc(xmac_txc),
.xmac_txd(xmac_txd)
);

endmodule // xmac_2pcs_core



module x64_intf (
// XPCS Interface
rbc0_a,          // 312mhz
tx_clk_312mhz,   // 312mhz
xpcs_rxc,
xpcs_rxd,
xpcs_txc,
xpcs_txd,
// XMAC Interface
rx_clk,
tx_clk,
xmac_rxc,
xmac_rxd,
xmac_txc,
xmac_txd
);
                   // XPCS Interface
   input 	   rbc0_a;          // 312mhz
   input 	   tx_clk_312mhz;   // 312mhz
   input [7:0] 	   xpcs_rxc;
   input [63:0]    xpcs_rxd;
   output [7:0]    xpcs_txc;
   output [63:0]   xpcs_txd;
                   // XMAC Interface
   input 	   rx_clk;
   input 	   tx_clk;
   output [7:0]    xmac_rxc;
   output [63:0]   xmac_rxd;
   input [7:0]     xmac_txc;
   input [63:0]    xmac_txd;

   wire [7:0] 	   xpcs_rxc;
   wire [63:0] 	   xpcs_rxd;
   wire [7:0] 	   xpcs_xmac_rxc;
   wire [63:0] 	   xpcs_xmac_rxd;
   wire [7:0] 	   xmac_rxc;
   wire [63:0] 	   xmac_rxd;

   wire [7:0] 	   xmac_txc;
   wire [63:0] 	   xmac_txd;
   wire [7:0] 	   xmac_xpcs_txc;
   wire [63:0] 	   xmac_xpcs_txd;
   wire [7:0] 	   xpcs_txc;
   wire [63:0] 	   xpcs_txd;

//----- receive side: xpcs -> xmac -----
// rx_clk is triggered by the falling edge of rbc0_a.
// There is a build in half rbc0_a period delay to take care of the race condition
// between xpcs_xmac_rxd and rx_clk.
RegDff #(8)  xpcs_xmac_rxc_RegDff(.din(xpcs_rxc),.clk(rbc0_a),.qout(xpcs_xmac_rxc));
RegDff #(64) xpcs_xmac_rxd_RegDff(.din(xpcs_rxd),.clk(rbc0_a),.qout(xpcs_xmac_rxd));

RegDff #(8)  xmac_rxc_RegDff(.din(xpcs_xmac_rxc),.clk(rx_clk),.qout(xmac_rxc));
RegDff #(64) xmac_rxd_RegDff(.din(xpcs_xmac_rxd),.clk(rx_clk),.qout(xmac_rxd));

//----- transmit side: xmac -> xpcs -----
// tx_clk is triggered by the falling edge of tx_clk_312mhz.
// There is a build in half tx_clk_312mhz period delay to take care of the race condition
// between xmac_xpcs_txc and tx_clk_312mhz.
RegDff #(8)  xmac_xpcs_txc_RegDff(.din(xmac_txc),.clk(tx_clk),.qout(xmac_xpcs_txc));
RegDff #(64) xmac_xpcs_txd_RegDff(.din(xmac_txd),.clk(tx_clk),.qout(xmac_xpcs_txd));

RegDff #(8)  xpcs_txc_RegDff(.din(xmac_xpcs_txc),.clk(tx_clk_312mhz),.qout(xpcs_txc));
RegDff #(64) xpcs_txd_RegDff(.din(xmac_xpcs_txd),.clk(tx_clk_312mhz),.qout(xpcs_txd));
   
endmodule // x64_intf
