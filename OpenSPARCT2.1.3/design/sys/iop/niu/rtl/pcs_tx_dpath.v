// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_tx_dpath.v
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
// @(#)pcs_tx_dpath.v	1.2G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Tx Datapath Block			      */
/* Description   :  The PCS Tx datapath contains the configuration    */
/*		    registers to be sent during link configuration,   */
/*		    the mux for encoder control between the Link      */
/*		    config block and Tx control block, the mux for    */
/*		    the data going into the Encoder block, Encoder    */
/*		    block, and registers on either side of the        */
/*		    Encoder block. These exist because the critical   */
/*		    path is in the Encoder.			      */
/*    								      */
/*		    Running disparity is calculated on txd on a per   */
/*		    clock basis and passed onto Encoder.	      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs.v 	                                      */
/* Child modules : pcs_encoder.v pcs_rx_disparity.v		      */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/24/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/*	11/3/97  : removed unnecessary flag for txd_eq_crs_err	      */
/*	11/3/97  : set remote fault as long as signal_detect is FAIL  */
/*	10/2/98  : removed their fault bit to improve interoperability*/
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_tx_dpath (txclk,reset_tx,txd,tx_en,tx_er,		// inputs
	adver_reg,ack,txd_sel,
	tx_enc_ctrl_sel,tx_enc_conf_sel,link_up_loc,	
	jitter_study_pci,

	tx_10bdata,tx_en_d,tx_er_d,txd_eq_crs_ext, 	// outputs
	pos_disp_tx_p);		

input		txclk;			// 125 MHz clock
input 		reset_tx;		// reset synchronized to txclk
input [7:0]	txd;			// byte from MAC over GMII
input		tx_en;			// control signal from MAC over GMII
input		tx_er;			// control signal from MAC over GMII
input [12:0]	adver_reg;		// reg to be used for configuration
					// from PCI clock domain, but should
					// never change when PCS enabled
input		ack;			// from link configuration state mach.
//input		signal_detect;		// from optics, light ok
input [1:0]	txd_sel;		// select between data and config regs
input [3:0]	tx_enc_ctrl_sel;	// encoder control from tx ctrl
input [3:0]	tx_enc_conf_sel;	// encoder control from link config
input		link_up_loc;		// select for tx_enc_sel mux
//input		config_done;		// clear for remote their fault
input [1:0]	jitter_study_pci;	// select for 10 bit data output mux

output [9:0] 	tx_10bdata;		// symbol to send over link
output		tx_en_d;		// to be used by tx_ctrl
output		tx_er_d;		// to be used by tx_ctrl
output		txd_eq_crs_ext;		// incoming txd maps to crs ext code
//output	txd_eq_crs_err;	 // incoming txd maps to crs err code
output 		pos_disp_tx_p;		// positive disparity flag, last data
//output		their_fault_tx;		// remote their fault, advertisement

wire  [7:0]	txd_d;			// input from MAC delayed one
wire  [7:0] 	tx_8bdata_conf;		// muxed MAC data and config regs
wire  [7:0]	tx_8b_enc_in;		// bus which inputs to encoder
wire  [9:0]	tx_10b_enc_out;		// bus which outputs from encoder
wire  [3:0]	tx_enc_sel;		// encoder control, one cycle early
wire  [3:0]	encoder_sel;		// encoder control, input to encoder
wire		special_char;		// special code, one cycle early
wire		special_enc_in;		// special code, for tx_8b_enc_in
wire [15:0]	config_reg;		// used for advertisement
wire		pos_disp_tx_p;		// running disparity for tx_8b_enc_in
//wire		set_their_fault;	// signal detect negedge
//wire		nxt_their_fault;	// used for latching remote their fault
//wire		signal_detect_tx;	// used for negedge detect of signal
wire [9:0]	tx_10bdata_predel;	// for hold time to Serialink
wire [9:0]	tx_10bdata_todiag;	// 10b data to diagnostic mux
wire [1:0]	jitter_study_tx;	// to select mux for tx 10b data

wire pos_disp_tx;

/*
** Creation of flag to facilitate fast encoding of regular data
*/
assign special_char =((tx_enc_sel == `PCS_ENC_K285) | 
		      (tx_enc_sel == `PCS_ENC_IDLE2) | 
		      (tx_enc_sel == `PCS_ENC_SOP) | 
		      (tx_enc_sel == `PCS_ENC_T_CHAR) | 
		      (tx_enc_sel == `PCS_ENC_R_CHAR) | 	
		      (tx_enc_sel == `PCS_ENC_H_CHAR) | 	
		      (tx_enc_sel == `PCS_ENC_IDLE1) |
		      (tx_enc_sel == `PCS_ENC_LINK_CONFA) |
		      (tx_enc_sel == `PCS_ENC_LINK_CONFB)),

	config_reg = {1'b0,ack,adver_reg[12],1'b0,adver_reg[11:0]},
	txd_eq_crs_ext = tx_er_d & (txd_d == 8'h0F);	
//	txd_eq_crs_err = tx_er_d & (txd_d == 8'h1F),	
						// for pcs_tx_ctrl.v
/* old:set_their_fault = ~signal_detect_tx & signal_detect_tx_d,
** this will indicate remote fault as long as signal_detect is failed
** it gives management better visibility of signal_detect
** loss of sync should occur if signal_detect indicates fail
*/
//	set_their_fault = ~signal_detect_tx,
//	nxt_their_fault = (reset_tx) ? 1'h0 : (set_their_fault) ?
//		1'h1 : (config_done) ? 1'h0 : their_fault_tx;

/*
** Input Reg for TXD
*/
RREG #(8) r_txd_d (.qout(txd_d),.clk(txclk),.rst(reset_tx),.din(txd));

/*
** Mux between incoming GMII data, config reg lsb, and config reg msb
** The default is the GMII data from MAC.  Select is generated by 
** the Link Config state machine.  Output feeds into pre encoder register.
*/
MUX4TO1 #(8) r_pre_enc_data_mux (.dout(tx_8bdata_conf),.sel(txd_sel),
	      .data0(txd_d),.data1(config_reg[7:0]),.data2(config_reg[15:8]),
	      .data3(8'h0));

/*
** Pre Encoder Data Reg.  Provides maximum time for encoder to encode 8b to 10b
*/
REG #(8) r_tx_8bdata_p (.qout(tx_8b_enc_in),.clk(txclk),.din(tx_8bdata_conf));

/*
** Registered Control Signals from MAC (same level as Pre Encoder Data Reg
*/
RREG #(1) r_tx_en_d (.qout(tx_en_d),.clk(txclk),.rst(reset_tx),.din(tx_en));
RREG #(1) r_tx_er_d (.qout(tx_er_d),.clk(txclk),.rst(reset_tx),.din(tx_er));

/*
** Encoder - takes control inputs and data to create encoded 10b output
** Outputs disparity for incoming data for link config (so it knows 
** whether to generate Idle1 or Idle2 next.
*/
pcs_encoder pcs_encoder	(tx_8b_enc_in,encoder_sel,
		 special_enc_in,pos_disp_tx,

		 tx_10b_enc_out);

/*
** Tx running disparity calculator
*/
pcs_tx_disparity pcs_tx_disparity (.reset_tx(reset_tx),		// inputs
		.txclk(txclk), .special_char(special_enc_in),
		.tx_enc_sel(encoder_sel),.data(tx_8b_enc_in),
		.RDreg(pos_disp_tx), 	

		.RD(pos_disp_tx_p));				// outputs
/*
** Register to store running disparity
*/
RREG #(1) r_pos_disp_tx (.qout(pos_disp_tx), .din(pos_disp_tx_p), .clk(txclk),
		.rst(reset_tx));

/*
** Post Encoder Register.  Provides maximum time for encoder to encode
** Also provides plenty of setup time on the SERDES interface.
*/
REG #(10) r_tx_10bdata (.qout(tx_10bdata_todiag),.clk(txclk),
	.din(tx_10b_enc_out));

/*
** For jitter study, a high frequency pattern D21.5 and low frequency
** pattern K28.7 are provided.
*/
MUX3TO1 #(10) r_tx_10b_diag (.dout(tx_10bdata_predel),.sel(jitter_study_tx),
	      .data0(tx_10bdata_todiag),.data1(10'h2aa),.data2(10'h0f8));

REG #(10) tx_10bdata_REG (.qout(tx_10bdata),.clk(txclk),.din(tx_10bdata_predel));

/*
** 2:1 MUX for encoder select information
** If link is down, encoder is controlled by link configuration state
** machine. If link is up, encoder is controlled by tx control state machine
*/
MUX2TO1 #(4) r_tx_enc_sel(.dout(tx_enc_sel),.sel(link_up_loc),
		.data0(tx_enc_conf_sel),.data1(tx_enc_ctrl_sel));

/*
** Pre Encoder Register for Encoder controls.  
*/
REG #(4) r_encoder_sel (.qout(encoder_sel),.clk(txclk),.din(tx_enc_sel));
REG #(1) r_spec_enc (.qout(special_enc_in),.clk(txclk),.din(special_char));

/*
** Registers for Remote "Their" Fault
*/
//SYNCREG r_signal_detect_tx(signal_detect_tx,txclk,signal_detect);
//REG #(1) r_their_fault (their_fault_tx, txclk, nxt_their_fault);

SYNCREG r_jitter_study1(jitter_study_tx[1],txclk,jitter_study_pci[1]);
SYNCREG r_jitter_study0(jitter_study_tx[0],txclk,jitter_study_pci[0]);


endmodule

