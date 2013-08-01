// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs.v
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
// @(#)pcs.v	1.10G 
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Top Module				      */
/* Description   :  The PCS top module hooks together the rx datapath,*/
/*		    which contains the encoder, running disparity and */
/*		    pipeline stages; the tx_datapath which contains   */
/*		    decoder and pipeline stages; link configuration   */
/*		    block; word synchronization block, and sequence   */
/*		    detection block. 				      */
/*    								      */
/*    		    The function of the PCS block is to encode 8 bit  */
/*		    transmit data into 10 bit codes, decode 10 bit    */
/*		    receive data coes into 8 bit codes, perform  word */
/*		    synchronization on the incoming codes, detect     */
/*		    coding errors, detect disparity errors, perform   */
/*		    link configuration and adhere to the 802.3        */
/*		    standard on register definitions and behavior.    */
/*								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : gem_core.v 	                                      */
/* Child modules : none.                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/25/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/*	7-30-97 : update ports to submodules for rev2 pcs update      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module	pcs (	
                rxclk,rx_10bdata,		// pcs_rx_dpath	
	     	rxd,

		rx_dv,rx_er,			// pcs_rx_ctrl
	
		odd_rx,signal_detect,		// pcs_sequence_detect
		an_loss_sync,

		serdes_rdy,			// pcs_link_configuration
		link_up_tx,			

		txclk,tx_en,tx_er,		// pcs_tx_ctrl
		crs,col,

		txd,				// pcs_tx_dpath
		tx_10bdata,	

		clk,pio_core_reset,			// pcs_slave
		pio_core_sel,pio_rd_wr,pio_addr,
		pio_wr_data,slink_state,

		pio_err,pio_core_ack,pio_rd_data,
		sw_ensyncdet,sw_lockref,phy_mode,
		shared_sel,pcs_int,ewrap);
	

/*
** Inputs and Outputs from Rx Datapath 
*/
input		rxclk;		// 125 MHz rx clock
input [9:0]	rx_10bdata;	// incoming 10 bits from link
output [7:0]	rxd;		// data going onto GMII

/*
** Inputs and Outputs from Rx Control
*/
output		rx_dv;		// receive data valid, GMII interface
output		rx_er;		// receive error, GMII interface

/*
** Output from Link Configuration 
*/
input	serdes_rdy;		// from slink control block, serdes initialized
output	link_up_tx;		// signal to on-board LED, low pulse elongated

/*
** Inputs from Sequence Detect
*/
input	odd_rx;			// indicates alignment to word boundary	
input	signal_detect;		// input from optics which indicates light ok
output	an_loss_sync;		// loss of word synchronization in rxclk domain

/*
** Inputs and Outputs from Tx Control 
*/
input 	txclk;			// Tx Clk 125 MHz
input 	tx_en;			// GMII transmit enable from Mac
input	tx_er;			// GMII transmit error from Mac
output	crs;			// async carrier sense signal over GMII
output	col;			// async collision signal over GMII

/*
** Input and Output from Tx Datapath
*/
input [7:0]	txd;		// byte from MAC over GMII
output [9:0] 	tx_10bdata;	// symbol to send over link

/*
** Outputs from Slave
*/
input 		clk;		// PCI clock 33 or 66 MHz
input 		pio_core_reset;	// global hw reset, synchronous to pci clock
input 		pio_core_sel;	// pio select for pcs
input 		pio_rd_wr;	// pio read signal
input [6:0] 	pio_addr;	// pio address - register memory map	
input [17:0] 	pio_wr_data;	// pio data in, don't need all 32 bits
input [1:0]	slink_state;	// serdes control state register

output 		pio_err;
output 		pio_core_ack;	// pio acknowledge
output [31:0] 	pio_rd_data;	// pio read data out
output 		sw_ensyncdet;	// sw override for ensyncdet, to slink_ctrl
output 		sw_lockref;	// sw override for lockref, to slink_ctrl
output 		phy_mode;	// selects network i/f, to phy dpath block
output [2:0]	shared_sel;	// used as a select for shared output pins
output		pcs_int;	// pcs link down interrupt, secondary interrupt
output		ewrap;		// to external serdes for loopback enable

wire tx_er_d,tx_en_d,got3_config0_rx,enable_rx;

/*
** Internal Outputs from Rx datapath
*/
wire [7:0]	rx_8bdata,	// data from decoder
		rx_8bdata_p,	// data from decoder previous stage
		rx_8bdata_pp;
wire		kchar,
		kchar_p,
		kchar_pp;
wire		disp_err,	// disparity error flag for rx_8bdata 	
		disp_err_p;	
wire		dec_err,	// decoder error flag for rx_8bdata	
		dec_err_p;
wire		got_d_linkconf_p; // flags special data character detected

/*
** Internal output from Rx Control
*/
wire [2:0]	rx_d_sel;	// receive data mux select
wire [2:0] 	rx_state_rx;	// receive control state bits to slave
wire		link_up_rx;	// link up signal synchronized to rxclk
wire		nxt_crs_mask;	// mask crs_rx for early deassert
				// for IPG count start
wire [10:0]	rx_pkt_cnt_rx;  // rx packet counter

/*
** Internal outputs from Sequence Detector/Word Synchronizer
*/
wire	good3_Cnack_rx;		// flag to link config, got 3 C's 
wire	good3_CorData_rx;	// flag to link config, got 3 C's or data
wire	got_C_rx;		// flag to indicate currently receiving C chars
wire	CorData_err_rx;		// flag to indicate not receiving C or data 
wire	loss_sync_rx;		// flag which indicates word synchronization 
wire	reset_rx;		// synchronized here, to be used by rx_ctrl
wire [15:0] link_partner_rx;	// link partner ability register to slave
wire [1:0] seq_state_rx;	// sequence state machine bits to slave
wire [2:0] word_state_rx;	// word synchronization state machine bits
wire	crs_rx;			// post-masked crs_rx due out with rx_dv
wire	nxt_crs_rx;		// unmasked crs_rx, used with rx_8bdata

/*
** Internal outputs from Link Configuration
*/
wire	link_up_tx;		// a signal to the MII status register
wire	link_up_loc;		// a local signal to the Tx datapath
wire [3:0] tx_enc_conf_sel;	// encoder control lines
wire [1:0] txd_sel;		// select for tx data mux
wire  	reset_tx;		// synchronous reset to txclk
wire 	ack;			// used in configuration register sent
wire	odd_tx;			// polarity for byte alignment on Tx side
wire [3:0] link_state_tx;	// link configuration state bits to slave
wire	res_auto_tx;		// restart autonegotiation clr for MII config
wire	lost_link_tx;		// used to set link_status flag
wire    set_lol_from_los_tx;	// used for loss of link diag
wire	set_lol_from_c_tx;	// used for loss of link diag
wire [5:0] link_not_up_diag_tx;	// used for link not up diag
wire       link_up_filter_en;

/*
** Internal output from Tx Control
*/
wire [3:0] tx_enc_ctrl_sel;	// control inputs for encoder
wire [3:0] tx_state_tx;		// tx control state bits for slave
wire [10:0] tx_pkt_cnt_tx;	// tx packet counter

/*
** Internal output from Tx Datapath
*/
wire 		pos_disp_tx_p;	// positive disparity flag, last data
wire		txd_eq_crs_ext;	// incoming txd maps to crs ext code

/*
** Internal outputs from Slave
*/
wire		res_auto_pci; 	// restart link configuration
wire		col_test_pci;	// collision test, pci clock domain 
wire [12:0]	adver_reg;	// advertisement of capabilities
wire		enable_pci;	// PCS enable, otherwise looks like link down
wire		autoneg_ena_pci;// enable for autonegotiation	
wire		reset_pci;	// hw and sw reset to pci clock
wire		signal_detect_pci; // processed version of signal_detect_optic
wire [1:0]	jitter_study_pci; // select for tx data output mux
wire		timer_override_pci; // used by aneg to shorten length of bringup
wire 		lost_link_pci;	// used to clear lost_link_tx flag
wire		set_lol_from_los_pci;	// used for loss of link diag
wire		set_lol_from_c_pci;	// used for loss of link diag
wire		comma_p;
wire 		k285w1_p;

// vlint flag_non_name_based_inst off
pcs_rx_dpath pcs_rx_dpath (rxclk,reset_rx,enable_pci, 		// inputs
		{rx_10bdata[0],rx_10bdata[1],rx_10bdata[2],
		rx_10bdata[3],rx_10bdata[4],rx_10bdata[5],
		rx_10bdata[6],rx_10bdata[7],rx_10bdata[8],
		rx_10bdata[9]},rx_d_sel,link_up_rx,	

		rxd,
		rx_8bdata,kchar,disp_err,dec_err,		// outputs
		rx_8bdata_p,kchar_p,disp_err_p,dec_err_p,
		rx_8bdata_pp,kchar_pp,
		got_d_linkconf_p,comma_p,k285w1_p,enable_rx);
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_rx_ctrl pcs_rx_ctrl (rxclk,reset_rx,enable_rx,link_up_tx,   // inputs
		kchar,rx_8bdata,kchar_p,rx_8bdata_p,kchar_pp,
		rx_8bdata_pp,disp_err,dec_err,nxt_crs_rx,
		got_d_linkconf_p,loss_sync_rx,odd_rx,
	
		rx_dv,rx_er,rx_d_sel,rx_state_rx,link_up_rx,	// outputs
		nxt_crs_mask, rx_pkt_cnt_rx);
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_sequence_detect pcs_sequence_detect (
                rxclk,reset_pci,	// inputs
		kchar_p,disp_err_p,dec_err_p,rx_8bdata_p,
		odd_rx,signal_detect_pci,	
		got_d_linkconf_p,
		nxt_crs_mask,link_up_tx,comma_p,k285w1_p,

		good3_Cnack_rx,good3_CorData_rx,                // outputs
		got_C_rx,CorData_err_rx,nxt_crs_rx,crs_rx,
		loss_sync_rx,reset_rx,link_partner_rx,
		seq_state_rx,word_state_rx,got3_config0_rx);                
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_link_config pcs_link_config (
                txclk,reset_pci,res_auto_pci,	// inputs
		loss_sync_rx,pos_disp_tx_p, 			
		good3_Cnack_rx,good3_CorData_rx,
		got_C_rx,CorData_err_rx,
		autoneg_ena_pci,serdes_rdy,
		got3_config0_rx,timer_override_pci,
		lost_link_pci,set_lol_from_los_pci,
                set_lol_from_c_pci,
                link_up_filter_en,
		link_up_loc,link_up_tx,				// outputs
		tx_enc_conf_sel,txd_sel,reset_tx,
		ack,odd_tx,res_auto_tx,
		link_state_tx,an_loss_sync,
		lost_link_tx,set_lol_from_los_tx,
		set_lol_from_c_tx,link_not_up_diag_tx);
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_tx_ctrl pcs_tx_ctrl (txclk,reset_tx,enable_pci,		// inputs
		odd_tx,tx_en_d,tx_er_d,pos_disp_tx_p,
		crs_rx,txd_eq_crs_ext,
		col_test_pci,link_up_tx,			// outputs

		tx_enc_ctrl_sel,crs,col,tx_state_tx,
		tx_pkt_cnt_tx);
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_tx_dpath pcs_tx_dpath (txclk,reset_tx,txd,tx_en,tx_er,	// inputs
		adver_reg,ack,txd_sel,
		tx_enc_ctrl_sel,tx_enc_conf_sel,link_up_loc,
		jitter_study_pci,

		{tx_10bdata[0],tx_10bdata[1],tx_10bdata[2], 	// outputs
		tx_10bdata[3],tx_10bdata[4],tx_10bdata[5],
		tx_10bdata[6],tx_10bdata[7],tx_10bdata[8],
		tx_10bdata[9]},tx_en_d,tx_er_d,txd_eq_crs_ext,	
		pos_disp_tx_p);		
// vlint flag_non_name_based_inst on

// vlint flag_non_name_based_inst off
pcs_slave pcs_slave (
                clk,pio_core_reset,pio_core_sel,pio_rd_wr, // inputs
		pio_addr,pio_wr_data,link_up_tx,link_partner_rx,
		rx_state_rx,tx_state_tx,word_state_rx,seq_state_rx,
		link_state_tx,reset_tx,reset_rx,
                res_auto_tx,slink_state,
		signal_detect,lost_link_tx,
		set_lol_from_los_tx,set_lol_from_c_tx,
		rx_pkt_cnt_rx,tx_pkt_cnt_tx,link_not_up_diag_tx,
		ack,

		link_up_filter_en,pio_err,pio_core_ack,pio_rd_data,// outputs
		res_auto_pci,col_test_pci,
		adver_reg,reset_pci,enable_pci,
		autoneg_ena_pci,sw_ensyncdet,sw_lockref,
		phy_mode,shared_sel,
		pcs_int,ewrap,signal_detect_pci,jitter_study_pci,
		timer_override_pci,lost_link_pci,
		set_lol_from_los_pci,set_lol_from_c_pci);
// vlint flag_non_name_based_inst on

endmodule
