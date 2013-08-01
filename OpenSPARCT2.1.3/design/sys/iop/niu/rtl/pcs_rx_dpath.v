// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_rx_dpath.v
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
// @(#)pcs_rx_dpath.v	1.1G 
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Rx Datapath				      */
/* Description   :  The PCS Rx datapath contains the four stage       */
/*		    pipeline used to detect special sequences.  It    */
/*		    also contains the Decoder block and input 	      */
/*		    register.  A mux exists which selects among       */
/*		    several special characters and encoded data to    */
/*		    to be shipped over the GMII.		      */
/*                                                                    */
/* Assumptions   : none.                                              */
/*                                                                    */
/* Parent module : pcs.v					      */
/* Child modules : pcs_decoder.v                                      */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/24/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */
/* Modifications : 12/9/98 : added output ports comma_p,k285_p for    */
/*			carrier detect generation and sync	      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

module pcs_rx_dpath (rxclk,reset_rx,enable_pci,		// inputs
		rx_10bdata,rx_d_sel,link_up_rx,	

		rxd,
		rx_8bdata,kchar,disp_err,dec_err,	// outputs
		rx_8bdata_p,kchar_p,disp_err_p,dec_err_p,
		rx_8bdata_pp,kchar_pp,
		got_d_linkconf_p,comma_p,k285w1_p,enable_rx);

input		rxclk;		// 125 MHz rx clock
input		reset_rx;	// reset synchronized to rx clk
input		enable_pci;	// PCS enable bit
input [9:0]	rx_10bdata;	// incoming 10 bits from link
input [2:0]	rx_d_sel;	// receive data mux to GMII select
input		link_up_rx;	// link status sychronized to rx clock domain

output [7:0]	rxd;		// data going onto GMII
output [7:0]	rx_8bdata,	// data from decoder
		rx_8bdata_p,	// data from decoder previous stage
		rx_8bdata_pp;
output		kchar,
		kchar_p,
		kchar_pp;
output		disp_err,	// disparity error flag for rx_8bdata 	
		disp_err_p;	
output		dec_err,	// decoder error flag for rx_8bdata	
		dec_err_p;
output		got_d_linkconf_p;
output		comma_p;
output		k285w1_p;
output		enable_rx;

wire [9:0]	rx_10bdec_in;	// data bus input to encoder
wire [7:0]	nxt_rxd;	// rx data bus to MAC
wire		enable_rx;	// PCS enable synchronized
wire		clr;		// clear pipeline	
wire		disp_err_p;
wire		dec_err_p;

wire dec_err_pp,disp_err_pp,got_d_linkconf_pp,comma_pp,k285w1_pp;

assign 	clr = reset_rx | ~enable_rx | !link_up_rx;

/*
** Pre Decoder Data Reg
*/
REG #(10) r_in_reg (.qout(rx_10bdec_in),.clk(rxclk),.din(rx_10bdata));


/*
** DECODER - takes whatever comes in and decodes it to an 8 bit value.
** Generates helpful flags for special data characters and k characters.
** Flags disparity and decode errors.
*/
// vlint flag_non_name_based_inst off
pcs_decoder pcs_decoder(rx_10bdec_in,rxclk, 		// inputs
	
		rx_8bdata_pp,dec_err_pp,disp_err_pp,	// outputs
		kchar_pp,got_d_linkconf_pp,comma_pp,k285w1_pp);
// vlint flag_non_name_based_inst on

/*
** Pipeline regs
*/		     
REG #(8) r_8bdata_p (.qout(rx_8bdata_p),.clk(rxclk),.din(rx_8bdata_pp));
REG #(8) r_8bdata (.qout(rx_8bdata),.clk(rxclk),.din(rx_8bdata_p));

REG #(1) r_kchar_p (.qout(kchar_p),.clk(rxclk),.din(kchar_pp));
REG #(1) r_kchar (.qout(kchar),.clk(rxclk),.din(kchar_p));

REG #(1) r_disp_err_p (.qout(disp_err_p),.clk(rxclk),.din(disp_err_pp));
REG #(1) r_disp_err (.qout(disp_err),.clk(rxclk),.din(disp_err_p));

REG #(1) r_dec_err_p (.qout(dec_err_p),.clk(rxclk),.din(dec_err_pp));
REG #(1) r_dec_err (.qout(dec_err),.clk(rxclk),.din(dec_err_p));

REG #(1) r_got_d_linkconf_p(.qout(got_d_linkconf_p),.clk(rxclk),
	.din(got_d_linkconf_pp));
REG #(1) r_comma_p(.qout(comma_p),.clk(rxclk),
	.din(comma_pp));
REG #(1) r_k285w1_p(.qout(k285w1_p),.clk(rxclk),
	.din(k285w1_pp));

SYNCREG r_enable_rx (enable_rx,rxclk,enable_pci);

/*
** Output MUX for rx data out
** PCS_RXD_ZERO            3'h0
** PCS_RXD_PREAMBLE        3'h1
** PCS_RXD_FALSE_CARRIER   3'h2
** PCS_RXD_CRS_EXT         3'h3
** PCS_RXD_CRS_EXT_ER      3'h4
** PCS_RXD_DECODER         3'h5
*/
MUX6TO1 #(8) rxd_outmux (.dout(nxt_rxd),.sel(rx_d_sel),.D0(8'h0),.D1(8'h55),
	.D2(8'hE),.D3(8'hF),.D4(8'h1F),.D5(rx_8bdata));

/*
** Output RXD reg
*/
RREG #(8) r_rxd (.qout(rxd),.clk(rxclk),.rst(clr),.din(nxt_rxd));

endmodule


