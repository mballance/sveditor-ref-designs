// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_rx_ctrl.v
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
// @(#)pcs_rx_ctrl.v	1.1G 
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Rx Control Block			      */
/* Description   :  This block controls the PCS Rx Datapath mux which */
/*		    provides input to the MAC over GMII.  It also     */
/*		    controls the other GMII signals such as rx_dv and */
/*		    rx_er.					      */
/*    								      */
/*    		    If the link is not up, as dictated by the Link    */
/*		    configuration state machine, the GMII interface   */
/*		    signals go to zero.		      		      */
/*    								      */
/*    		    End delimiters do not cause activity on the GMII. */
/*		    If the T arrives on an odd the end delimiter is   */
/*		    RRI.  If Even, the end delimiter is RI.	      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs.v 	                                      */
/* Child modules : none.                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/17/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_rx_ctrl (rxclk,reset_rx,enable_rx,link_up_tx,	// inputs
	kchar,rx_8bdata,kchar_p,rx_8bdata_p,kchar_pp,
	rx_8bdata_pp,disp_err,dec_err,nxt_crs_rx,
	got_d_linkconf_p,loss_sync_rx,odd_rx,
	
	rx_dv,rx_er,rx_d_sel,rx_state_rx,link_up_rx,	// outputs
	nxt_crs_mask,rx_pkt_cnt_rx);		

input 	rxclk;			// Rx Clk 125 MHz
input	reset_rx;		// hw and sw reset OR'ed
input	enable_rx;		// enable for pcs, rx clock domain
input	link_up_tx;		// link up status from link config block
input	kchar;			// this marks this character a K character
// vlint flag_input_port_not_connected off
input [7:0] rx_8bdata; 		// the 8 bit decoded data
input	kchar_p;		// this marks the next char a K character 
input [7:0] rx_8bdata_p;	// the 8 bit next decoded data
input	kchar_pp;		// this marks the next next char a K character
input [7:0] rx_8bdata_pp; 	// the 8 bit next next decoded data
// vlint flag_input_port_not_connected on
input	disp_err;		// marks a code which had a disparity error
input	dec_err;		// marks a code which was not a valid code
input 	nxt_crs_rx;		// carrier sense for rx activity
input	got_d_linkconf_p;	// flag for config reg data symbol
input	loss_sync_rx;		// to reset rx state machine
input	odd_rx;			// to check alignment of eop delims

output	rx_dv;			// receive data valid, GMII interface
output	rx_er;			// receive error, GMII interface
output [2:0] rx_d_sel;		// receive data mux select
output [2:0] rx_state_rx;	// receive control state bits for slave
output	link_up_rx;		// to use by sequence detect
output	nxt_crs_mask;		// to deassert crs_rx early to start IPG count
output [10:0] rx_pkt_cnt_rx;	// packet count

wire 	end_of_pkt_rri;		// marks the end of packet sequence RRI
wire 	end_of_pkt_tri;		// marks the end of packet sequence TRI
wire 	end_of_pkt_trr;		// marks the end of packet sequence TRR
wire	end_of_pkt_rs;		// marks the end of packet sequence RS
wire	end_of_pkt_rrr;		// marks the end delimiter error
wire	t_char;			// marks the end of packet character, T
wire	h_char;			// marks error being propagated
wire	r_char;			// marks the carrier extension character, R
wire	r_char_p;		// marks the carrier extension character, R
wire	r_char_pp;		// marks the carrier extension character, R
wire	s_char_p;		// marks the carrier extension character, S
wire 	i_char;			// marks the beginning of idle, K28.5 
wire 	i_char_pp;		// marks the beginning of idle, K28.5 
wire	beg_of_pkt;		// marks the beginning of packet char, S
wire	trunc_pkt;		// detection of idle or config before epd
wire [2:0] rx_state_rx, 	// state of rx_ctrl state machine
	nxt_rx_state_rx;	
wire 	nxt_rx_dv,		// pre register MAC Control
	nxt_rx_er;		// pre register MAC Control
wire [10:0] nxt_pkt_cnt;	// next rx packet count
wire 	inc_pkt_cnt;		// increment packet counter

// vlint flag_dangling_net_within_module off
// vlint flag_net_has_no_load off
// vlint flag_input_port_not_connected off
wire  [7:0] rx_8bdata; 		// the 8 bit decoded data
wire  [7:0] rx_8bdata_p;	// the 8 bit next decoded data
wire  [7:0] rx_8bdata_pp; 	// the 8 bit next next decoded data
// vlint flag_net_has_no_load on
// vlint flag_dangling_net_within_module on
// vlint flag_input_port_not_connected on

   

parameter       IDLE		= 3'h0, // state machine states
		RECEIVE_STREAM	= 3'h1,
		EARLY_TERM	= 3'h2,
		CARRIER_EXT	= 3'h3,
		CARRIER_EXT_ER	= 3'h4,
		FLUSH1		= 3'h5,
		FALSE_CARRIER	= 3'h6;

assign
	beg_of_pkt = kchar & rx_8bdata[`PCS_S_CHAR] & ~disp_err, 
	t_char = kchar & rx_8bdata[`PCS_T_CHAR] & ~disp_err,
	r_char = kchar & rx_8bdata[`PCS_R_CHAR] & ~disp_err,
	r_char_p = kchar_p & rx_8bdata_p[`PCS_R_CHAR] & ~disp_err,
	r_char_pp = kchar_pp & rx_8bdata_pp[`PCS_R_CHAR] & ~disp_err,
	s_char_p = kchar_p & rx_8bdata_p[`PCS_S_CHAR] & ~disp_err,
	i_char   = kchar & rx_8bdata[`PCS_K285_CHAR] & ~disp_err,
	i_char_pp = kchar_pp & rx_8bdata_pp[`PCS_K285_CHAR] & ~disp_err,

	end_of_pkt_rri = r_char & r_char_p & i_char_pp & odd_rx, // odd_rx goes with _p
	end_of_pkt_tri = t_char & r_char_p & i_char_pp & odd_rx,
	end_of_pkt_trr = t_char & r_char_p & r_char_pp,
	end_of_pkt_rs = r_char & s_char_p,
	end_of_pkt_rrr = r_char & r_char_p & r_char_pp,
	h_char = kchar & rx_8bdata[`PCS_H_CHAR],
	// checks for early end of packet, two idles or a config 
	trunc_pkt = (i_char & i_char_pp) | (i_char & got_d_linkconf_p),
	nxt_pkt_cnt = (inc_pkt_cnt) ? rx_pkt_cnt_rx + 1'h1 : rx_pkt_cnt_rx;
		
/*
** Call of function word synchronization
*/
assign {nxt_rx_dv,nxt_rx_er,rx_d_sel,nxt_crs_mask,
	inc_pkt_cnt,nxt_rx_state_rx}
	= rx_control_fn(reset_rx,enable_rx,end_of_pkt_rri,
	end_of_pkt_tri,end_of_pkt_trr,	
	end_of_pkt_rs,end_of_pkt_rrr,
	nxt_crs_rx,beg_of_pkt,disp_err,h_char,
	dec_err,link_up_rx,trunc_pkt,r_char,loss_sync_rx,
	i_char,rx_state_rx);	
						
/*
** Rx control state machine
*/
function [9:0] rx_control_fn;
   input        reset;
   input	enable;
   input	end_of_pkt_rri;	// flag for end of packet sequence 
   input	end_of_pkt_tri;	// flag for end of packet sequence 
   input	end_of_pkt_trr;	// flag for end of packet sequence 
   input	end_of_pkt_rs;  // flag for end of packet sequence, pkt burst
   input	end_of_pkt_rrr;	// marks error in the end delimiter	
   input	crs_rx;		// carrier sense at end of pipeline
   input	beg_of_pkt;	// flag for s code detect (start of frame)
   input	disp_err;	// disparity error at end of pipeline
   input	dec_err;	// decode error
   input	h_char;		// propogated error
   input	link_up_rx;	// to deactivate GMII during link down
   input	trunc_pkt;	// detection of idle or config before epd
   input	r_char;		// detection of errors during carrier ext	
   input	loss_sync;	// to keep state machine in reset
   input	i_char;		// to know when to leave false carrier state
   input [2:0]	state;

   reg 		rx_dv;		// receive data valid
   reg		rx_er;		// receive error
   reg [2:0]	rx_d_sel;	// mux select for rx data
   reg		crs_mask;	// to make crs_rx go down early
   reg		inc_pkt_cnt;	// increment pkt counter
   reg [2:0]    n_state;	// next state

   begin
		rx_dv = 1'h0; 
		rx_er = 1'h0;
		rx_d_sel = `PCS_RXD_ZERO;
		crs_mask = 1'h0;
		inc_pkt_cnt = 1'h0;
		n_state = 3'h0;

      	case (state)  // synopsys parallel_case full_case
            IDLE : // 0	
                if (reset || ~enable)	
			n_state = IDLE;
	        else if (crs_rx & link_up_rx & ~loss_sync)
		   if (beg_of_pkt) // checks that S comes on even byte through crs_rx
		     begin
			n_state = RECEIVE_STREAM;
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_PREAMBLE;
			inc_pkt_cnt = 1'h1;
		     end
		   else 
		     begin
			rx_er = 1'h1;
			n_state = FALSE_CARRIER;
			rx_d_sel = `PCS_RXD_FALSE_CARRIER;
		     end
		else
			n_state = IDLE;
	   RECEIVE_STREAM : // 1
		if (end_of_pkt_trr)
		     begin
			n_state = CARRIER_EXT;
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT;
		     end
		else if (end_of_pkt_tri)
		     begin
			n_state = FLUSH1;
			crs_mask = 1'h1;
		     end
		else if (end_of_pkt_rrr) 
		     begin
		     	n_state = CARRIER_EXT_ER;
			rx_er = 1'h1;	
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_DECODER;
		     end
		else if (trunc_pkt) // got K28.5
		     begin
			n_state = EARLY_TERM;
			rx_er = 1'h1;
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_DECODER;
		     end
		else if (dec_err | disp_err | h_char)  // bad data
		     begin
			n_state = RECEIVE_STREAM;
			rx_er = 1'h1;
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_DECODER;
		     end
		else	// good data
		     begin
			rx_d_sel = `PCS_RXD_DECODER;
			rx_dv = 1'h1;
			n_state = RECEIVE_STREAM;
		     end
	   EARLY_TERM : // 2
		if (crs_rx)
		     begin
			n_state = EARLY_TERM; 
			rx_er = 1'h1;
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_DECODER;
		     end
		else
			n_state = IDLE;
	   CARRIER_EXT : // 3	
		if (end_of_pkt_rri)	// end of pkt delim to be stripped
		     begin
			n_state = FLUSH1;
			crs_mask = 1'h1;
		     end
		else if (end_of_pkt_rs) // packet bursting
		     begin
			n_state = IDLE;
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT;
		     end
		else if (!r_char | disp_err)	  // illegal character
		     begin
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT_ER;
			n_state = CARRIER_EXT_ER;	
		     end
		else				  // continue carrier ext
		     begin
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT;
			n_state = CARRIER_EXT;
		     end
	   CARRIER_EXT_ER : // 4
		if (~crs_rx) 	// got Idle
			n_state = IDLE;
		else if (beg_of_pkt) // next burst
		     begin
			n_state = RECEIVE_STREAM;
			rx_dv = 1'h1;
			rx_d_sel = `PCS_RXD_PREAMBLE;
		     end
		else if (!r_char | disp_err)	  // illegal character
		     begin
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT_ER;
			n_state = CARRIER_EXT_ER;
		     end
		else				  // continue carrier ext
		     begin
			rx_er = 1'h1;
			rx_d_sel = `PCS_RXD_CRS_EXT;
			n_state = CARRIER_EXT_ER;
		     end
	   FLUSH1 : // 5
		begin
		  	n_state = IDLE;
			crs_mask = 1'h1;
		end
	   FALSE_CARRIER : // 6
		begin
		    rx_er = 1'h1;
		    rx_d_sel = `PCS_RXD_FALSE_CARRIER;
		    if (i_char)
			n_state = IDLE;
		    else
			n_state = FALSE_CARRIER;
		end
            default: n_state = IDLE;
	endcase
	
    rx_control_fn = {rx_dv,rx_er,rx_d_sel,crs_mask,inc_pkt_cnt,n_state};

  end
endfunction

RREG #(3) r_state (rx_state_rx, rxclk, reset_rx | ~link_up_rx | loss_sync_rx, 
		nxt_rx_state_rx);
SYNCREG r_link_up_tx (link_up_rx, rxclk, link_up_tx);
RREG #(1)  r_rx_dv (rx_dv, rxclk, reset_rx, nxt_rx_dv);
RREG #(1)  r_rx_er (rx_er, rxclk, reset_rx, nxt_rx_er);
RREG #(11)  r_rx_pkt_cnt (rx_pkt_cnt_rx, rxclk, reset_rx, nxt_pkt_cnt);

endmodule


