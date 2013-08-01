// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_link_config.v
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
// @(#)pcs_link_config.v	1.6G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Link Configuration                            */
/* Description   :  This block performs the link configuration        */
/* 		    procedure.  Based on inputs from the Sequence     */
/*		    detection module, it determines whether the link  */
/*		    is up or not.  This block also provides control   */
/*		    to the Tx out mux to mux out the proper control   */
/*		    symbols during link configuration.  It allows     */
/*		    data from the encoder to pass through when the    */
/*		    link is up. 				      */
/*    								      */
/*    		    If word synchronization is lost, the autonegot-   */
/*		    iation is restarted and the link config state     */
/*		    machine will only send C ordered sets until       */
/*		    synchronization is achieved again.  Word sync     */
/*		    is lost when loss of signal is detected.  Link    */
/*		    up local signal only transitions on even 	      */
/*		    boundaries.    				      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs.v 	                                      */
/* Child modules : none.                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/15/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/*		8/6/98 - change the autonegotiation so that 	      */
/*		  breaklink is exited despite no C codes received     */
/*      1/17/02 : added LT_TM related logic                           */
/*		  from the link partner				      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_link_config (// inputs
                        txclk,reset_pci,res_auto_pci,
			loss_sync_rx,pos_disp_tx_p,
			good3_Cnack_rx,good3_CorData_rx,
			got_C_rx,CorData_err_rx,
			autoneg_ena_pci,serdes_rdy,
			got3_config0_rx,timer_override_pci,
			lost_link_pci,set_lol_from_los_pci,
			set_lol_from_c_pci,
                        link_up_filter_en,
			// outputs
			link_up_loc,link_up_tx,
			tx_enc_conf_sel,txd_sel,reset_tx,
			ack,odd_tx,res_auto_tx,
			link_state_tx,an_loss_sync,
			lost_link_tx,set_lol_from_los_tx,
			set_lol_from_c_tx,link_not_up_diag_tx);

input 	txclk;			// Tx Clk 125 MHz
input	reset_pci;		// hw and sw reset OR'ed, needs sync from PCI
input	res_auto_pci;		// from MII Config, needs sync from PCI
input	loss_sync_rx;		// indication of word sync status
input	pos_disp_tx_p;		// running disparity from encoder
input	good3_Cnack_rx;		// received 3 sequential and identical Config 
				// regs, disregard ack bit, needs sync from Rx
input	good3_CorData_rx;  	// received 3 sequential and identical Config 
				// regs or data, needs sync from Rx 
input	got_C_rx;		// last received or receiving Link Config set
input 	CorData_err_rx;		// not receiving Config regs or good data
input	autoneg_ena_pci;	// enable for autonegotiation from MII config
input	serdes_rdy;		// from slink control block
input	got3_config0_rx;	// flag used to trigger restart of config
input   timer_override_pci;	// make timer short for speedy bringup
input 	lost_link_pci;		// used to clear lost_link_tx register
input	set_lol_from_los_pci;	// clears diag bit for why link was lost
input	set_lol_from_c_pci;	// clears diag bit for why link was lost
input   link_up_filter_en;      
output	link_up_loc;		// a signal to the MII status register
output	link_up_tx;		// a signal to the MII status register
output [3:0] tx_enc_conf_sel;	// encoder control lines
output [1:0] txd_sel;		// select for tx data mux
output  reset_tx;		// synchronous reset to txclk
output	ack;			// used in configuration register sent
output	odd_tx;			// odd polarity for tx
output	res_auto_tx;		// synchronized version of restart_autoneg
output [3:0] link_state_tx;	// link configuration state bits to slave
output	an_loss_sync;		// lost sync for over 10 ms, use to reinit
				// serdes part
output	lost_link_tx;		// used to set link status bit
output	set_lol_from_los_tx;	// sets diag bit for why link was lost
output	set_lol_from_c_tx;	// sets diag bit for why link was lost
output [5:0] link_not_up_diag_tx;// gives reasons for why link not up
	
wire	reset_tx;		// synchronized version of reset to rxclk
wire [3:0] link_state_tx, 	// link config state machine
	nxt_link_state_tx; 	
wire	error, nxt_error;	// flag for incorrect character reception
wire	res_auto_1shot;		// 1 shot for restart auto config
wire	res_auto_tx_d;		// synchronized version of restart_autoneg del
wire	got_C_tx;		// synchronized version of got_C
wire	CorData_err_tx;		// synchronized version of CorData_err_rx
wire    good3_Cnack_tx;		// synchronized version of good3_Cnack_rx
wire    good3_CorData_tx;	// synchronized version of good3_CorData_rx
wire	loss_sync_oneshot;	// pulse for loss of sync, to trigger autneg
wire 	loss_sync_tx;		// loss_sync synchronized 
wire 	loss_sync_tx_d;		// loss_sync synchronized and delayed
wire	set_err, clr_err;	// control for temp error register
wire   	ack;			// used in configuration register sent
wire	conf_polarity;		// which polarity of config reg last sent
wire	nxt_conf_polarity;	// which polarity of config reg last sent
wire 	flip_conf_polarity;	// signal used to flip config polarity flag
wire 	autoneg_ena_tx;		// synchronized autonegotiation enable
wire [2:0] nxt_an_timer, 	// timer value
	an_timer;		// timer value
wire	an_timer_done;		// timer equals 12 ms - 16 ms
wire	timer_tick;		// one shot version of slow clk
wire	start_timer;		// initialize timer pulse
wire    breaklink, 		// marks progress of autonegotiation
	nxt_breaklink;		// marks progress of autonegotiation
wire 	got3_config0_tx;	// flag for restart an, synchronized
wire [2:0] nxt_los_timer,	// count for 10 ms loss of sync timeout
	los_timer;		// count for 10 ms loss of sync timeout
wire	los_timer_done;		// timer equals 12 ms - 16 ms
wire 	nxt_restart_an,		// flag to restart aneg
	restart_an;		// flag to restart aneg
wire	slow_clk,		// 4.2 ms clk
	slow_clk_d;		// 4.2 ms clk one txclk delayed
wire	begin_an;		// flag to clear restart an flag
wire 	timer_override_tx;	// synchronized version of timer_override_pci
wire	nxt_lost_link;		// used to generate lost_link_tx signal
wire	clr_lost_link; 		// used to generate lost_link_tx signal
wire 	set_lost_link;		// used to generate lost_link_tx signal
wire	nxt_set_lol_from_los;	// for diagnostic flag why link was lost
wire	nxt_set_lol_from_c;	// for diagnostic flag why link was lost
wire	clr_lol_from_los;	// for diagnostic flag why link was lost
wire	clr_lol_from_c;		// for diagnostic flag why link was lost
wire 	set_restart_onC;	// for lol_from_c diag flag
wire	an_loss_sync_d;		// used for diag bit creation to prevent
				// bit high after read from reg
wire 	an_los_1shot;		// one shot used for diag bit creation
wire	link_up_loc_ori;	// used for detecting link down
wire	link_up_loc_ori_temp;	// used for detecting link down before filtering
wire	serdes_rdy_tx;		// synchronized version of serdes_rdy in tx
				// clock domain
wire    link_up_tx;
   
parameter       LINK_NA		= 4'h0,
		LINK_CNACK2	= 4'h1,
		LINK_CNACK3	= 4'h2,
		LINK_CNACK4	= 4'h3,
		LINK_CORDATA1	= 4'h4,
		LINK_CORDATA2	= 4'h5,
		LINK_CORDATA3	= 4'h6,
		LINK_CORDATA4	= 4'h7,
		CHECK_DISP	= 4'h8,
		FLIP_DISP	= 4'h9,
		LINK_UP_US	= 4'hA,
		LINK_UP_BOTH	= 4'hB;
		
/*
** An LFSR is used to create a 50% duty cycle clock which has a
** 4.2 ms cycle time.  This is used by the loss of sync and the
** autonegotiation timers which count to a value between 12.6 and 
** 16.8 ms.  This is within the 10 - 20 ms window required.
*/
pcs_lfsr pcs_lfsr(txclk,timer_override_tx,reset_tx,slow_clk);

assign  
	nxt_error = (reset_tx|clr_err)? 1'h0 : (set_err)? 1'h1 : error,
	nxt_conf_polarity = (reset_tx) ? 1'h0 : (flip_conf_polarity) ?
		    ~conf_polarity : conf_polarity,
	loss_sync_oneshot = loss_sync_tx & !loss_sync_tx_d,
	res_auto_1shot = !res_auto_tx_d & res_auto_tx,
	timer_tick = slow_clk & ~slow_clk_d, // every 4.2 ms
	nxt_an_timer = (start_timer | reset_tx) ? 3'h0 : 
		an_timer_done ? an_timer : (timer_tick)? 
		an_timer + 3'h1: an_timer,
	nxt_los_timer = (loss_sync_oneshot | reset_tx) ? 3'h0 : 
		los_timer_done ? los_timer : (timer_tick)? 
		los_timer + 3'h1 : los_timer,
	nxt_restart_an = (reset_tx | begin_an)? 1'h0: 
		(restart_an | res_auto_1shot | an_loss_sync),
	an_loss_sync = (los_timer_done & loss_sync_tx & ~loss_sync_oneshot),
	an_los_1shot = an_loss_sync & ~an_loss_sync_d,
	los_timer_done = (los_timer == 3'h4), // 12 -16 ms
	an_timer_done = (an_timer == 3'h4),
	set_lost_link = ~link_up_loc_ori & link_up_tx,// link_up_tx = link_up_loc_d
	nxt_lost_link = (reset_tx) ? 1'b0: (set_lost_link)? 1'b1 :
		(clr_lost_link)? 1'b0 : lost_link_tx,
	nxt_set_lol_from_los = (reset_tx) ? 1'b0: (an_los_1shot)? (1'b1) :
		(clr_lol_from_los)? 1'b0 : set_lol_from_los_tx,
	nxt_set_lol_from_c = (reset_tx) ? 1'b0: (set_restart_onC)? (1'b1) :
		(clr_lol_from_c)? 1'b0 : set_lol_from_c_tx,
	link_up_loc = link_up_loc_ori | ~autoneg_ena_tx, // in manual mode allows tx ctrl to 
			// to send idles
	link_not_up_diag_tx[0] = got3_config0_tx,
	link_not_up_diag_tx[1] = !serdes_rdy_tx,
	link_not_up_diag_tx[2] = !good3_Cnack_tx & ~link_up_loc,
	link_not_up_diag_tx[3] = loss_sync_tx,
	link_not_up_diag_tx[4] = !good3_CorData_tx &((link_state_tx == LINK_CORDATA1)
	 | (link_state_tx == LINK_CORDATA2) | (link_state_tx == LINK_CORDATA3)
	 | (link_state_tx == LINK_CORDATA4)),
	link_not_up_diag_tx[5] = got_C_tx & (link_state_tx == LINK_UP_US),

/*	
** Call of function link_config_fn
*/
{set_err,clr_err,ack,link_up_loc_ori_temp,
	tx_enc_conf_sel,txd_sel,flip_conf_polarity,
	start_timer,nxt_breaklink,begin_an,
	set_restart_onC,nxt_link_state_tx}
	= link_config_fn(reset_tx,restart_an,error,
	  good3_Cnack_tx,good3_CorData_tx,odd_tx,
	  CorData_err_tx,pos_disp_tx_p,loss_sync_tx,
	  conf_polarity,got_C_tx,autoneg_ena_tx,
	  serdes_rdy_tx,an_timer_done,
	  got3_config0_tx,breaklink,link_state_tx);
/*
** Link Configuration state machine
*/
function [18:0] link_config_fn;
   input        reset;		// reset 
   input	restart_an;	// trigger for autonegotiation restart	
   input        error;		// output of temporary error register	
   input        good3_Cnack;	// flag for 3 good C's no ack
   input        good3_CorData;	// flag for 3 good C's or data
   input        odd;		// this byte is odd flag
   input	CorData_err;	// not receiving C sets or data 
   input        pos_disp;	// this data is positive disparity flag	
   input	loss_sync;	// prevents link up when loss_sync
   input	conf_polarity;	// which polarity of config reg last sent
   input	got_C;		// received Config sequence
   input	autoneg_ena;	// enable autonegotiation from MII config
   input	serdes_rdy_tx;	// serdes is initialized, rx clock recovered
   input	timer_done;		// short timer reached terminal count
   input	got3_config0;	// received Config Reg of zeros, break link
   input 	breaklink;	// stores what stage autoneg is in
   input [3:0]	state;

   reg          set_err;	// set temp error register
   reg          clr_err;	// clear temp error register
   reg 	        ack;		// ack bit of config register
   reg	        link_up;	// link is up
   reg [3:0]    tx_enc_conf_sel;// tx encoder control
   reg [1:0]	txd_sel;	// tx data mux control
   reg		flip_config_polarity; // flips config reg polarity flag
   reg		start_timer; 
   reg 		nxt_breaklink;
   reg		begin_an;
   reg		set_restart_onC;
   reg [3:0]    n_state;	// next state

   begin
         	set_err = 1'h0;	// to catch all invalid codes - restart an
         	clr_err = 1'h0;
 	        ack = 1'h0;
	        link_up = 1'h0;
	        tx_enc_conf_sel = `PCS_ENC_K285;
		txd_sel = `PCS_TX_GMII_DATA;
		flip_config_polarity = 1'h0;
		start_timer = 1'h0;
		nxt_breaklink = breaklink;
		begin_an = 1'h0;
		set_restart_onC = 1'h0;
		n_state = 4'h0;

      	case (state) 
            LINK_NA : // 0
	      begin
		if (~reset & odd & ~autoneg_ena & ~loss_sync & ~got_C)
		   begin
			n_state = LINK_UP_BOTH; // enter on even
			begin_an = 1'h1;
		   end
		else if (~reset & ~odd & autoneg_ena)
			n_state = LINK_CNACK2; // enter on odd
		else // reset or disabled or odd
		   begin
			n_state = LINK_NA;
			tx_enc_conf_sel = `PCS_ENC_H_CHAR; 
			// to prevent rx sync on odd
			start_timer = 1'h1;
	      		set_err = loss_sync; 
			nxt_breaklink = 1'h1;
		   end
	      end
	    LINK_CNACK2 : // 1
	      begin
	      	set_err = loss_sync; 
		if (conf_polarity)
			tx_enc_conf_sel = `PCS_ENC_LINK_CONFA;
		else 
			tx_enc_conf_sel = `PCS_ENC_LINK_CONFB;
		flip_config_polarity = 1'h1;
		n_state = LINK_CNACK3;
	      end	
	    LINK_CNACK3 : // 2
	      begin
		tx_enc_conf_sel = `PCS_ENC_DATA;
		if (breaklink)
		   txd_sel = `PCS_TX_CONF_ZEROS;
		else 
	           txd_sel = `PCS_TX_CONF_REG1;
	      	set_err = loss_sync;  
		n_state = LINK_CNACK4;
	      end	
	    LINK_CNACK4 : // 3
	      begin
		tx_enc_conf_sel = `PCS_ENC_DATA;
		if (breaklink)	// break link
		   txd_sel = `PCS_TX_CONF_ZEROS;
		else 
	           txd_sel = `PCS_TX_CONF_REG2;
	        if (error)
		   begin
			clr_err = 1'h1;
		   	n_state = LINK_NA;
			nxt_breaklink = 1'h1;
			start_timer = 1'h1;
		   end
		else if (breaklink & timer_done & serdes_rdy_tx)
		   begin				// break link, promote
			n_state = LINK_NA;
			nxt_breaklink = 1'h0;
		   end		
		else if (~breaklink & good3_Cnack & ~got3_config0)
							// base page, promote
		   begin 
		      	n_state = LINK_CORDATA1; 
			clr_err = 1'h1;
			start_timer = 1'h1;
			begin_an = 1'h1;
		   end
		else
	      	   n_state = LINK_NA;	
	      end
	    LINK_CORDATA1 : // 4
	      begin
	      	set_err = CorData_err | loss_sync; 
		n_state = LINK_CORDATA2;
	      end	
	    LINK_CORDATA2 : // 5
	      begin
	      	set_err = CorData_err | loss_sync; 
		n_state = LINK_CORDATA3;
		if (conf_polarity)
			tx_enc_conf_sel = `PCS_ENC_LINK_CONFA;
		else 
			tx_enc_conf_sel = `PCS_ENC_LINK_CONFB;
		flip_config_polarity = 1'h1;
	      end	
	    LINK_CORDATA3 : // 6
	      begin
	      	set_err = CorData_err | loss_sync; 
		tx_enc_conf_sel = `PCS_ENC_DATA;
		txd_sel = `PCS_TX_CONF_REG1;
		n_state = LINK_CORDATA4;
	      end	
	    LINK_CORDATA4 : // 7
	      begin
		tx_enc_conf_sel = `PCS_ENC_DATA;
		txd_sel = `PCS_TX_CONF_REG2;
		ack = 1'h1;
		if (error | got3_config0)
		   begin
			clr_err = 1'h1;
		   	n_state = LINK_NA;
			nxt_breaklink = 1'h1;
			start_timer = 1'h1;
		   end
		else if (good3_CorData & timer_done)
		   begin
			n_state = CHECK_DISP;
			start_timer = 1'h1;
		   end
		else 
		   n_state = LINK_CORDATA1;  // waiting for 3 good C's or Data
	      end
	   CHECK_DISP : // 8
	      begin
		nxt_breaklink = 1'h1; 	// reset for future use
		if (pos_disp)		// disp at output of encoder	
		   n_state = FLIP_DISP;    // K28.5
		else
		  begin
		     n_state = LINK_UP_US;
	       	  end
	      end
	   FLIP_DISP : // 9
		begin	
		   tx_enc_conf_sel = `PCS_ENC_IDLE1;
		   n_state = LINK_UP_US;
		end
	   LINK_UP_US : // A
		begin	
		   if ((restart_an | got3_config0) & odd)
			n_state = LINK_NA;
		   else if (got_C | ~timer_done | ~odd)  // flush incoming C's
			n_state = LINK_UP_US;
		   else	
		     begin
			n_state = LINK_UP_BOTH;
		     end
		   if (odd) 
			tx_enc_conf_sel = `PCS_ENC_IDLE2;		
		end	
	   LINK_UP_BOTH : // B
	      begin		// always enter on even
		tx_enc_conf_sel = `PCS_ENC_DATA;
		if ((restart_an | good3_Cnack) & odd) // always exit on odd
		    begin
		    	n_state = LINK_NA;
			set_restart_onC = good3_Cnack;
		    end
	
		else 
		  begin
			link_up = 1'h1;
			n_state = LINK_UP_BOTH;
		  end
	      end
	endcase
	
    link_config_fn = {set_err,clr_err,ack,
		link_up,tx_enc_conf_sel,txd_sel,
		flip_config_polarity,start_timer,
		nxt_breaklink,begin_an,set_restart_onC,n_state};
  end
endfunction

RREG #(4) r_state (link_state_tx, txclk, reset_tx, 
		nxt_link_state_tx);
RREG #(1) r_odd_tx (odd_tx,txclk,reset_tx,~odd_tx);
REG  #(1) r_error (error, txclk, nxt_error);
REG  #(1) r_loss_sync_d (loss_sync_tx_d, txclk, loss_sync_tx);
REG  #(1) r_conf_polarity(conf_polarity,txclk,nxt_conf_polarity);
REG  #(1) r_res_auto_d(res_auto_tx_d,txclk,res_auto_tx); 
REG  #(1) r_link_up_tx (link_up_tx, txclk, link_up_loc_ori); // unglitch
REG  #(3) r_an_timer(an_timer,txclk,nxt_an_timer);
REG  #(3) r_los_timer(los_timer,txclk,nxt_los_timer);
REG  #(1) r_slowclk(slow_clk_d,txclk,slow_clk);
REG  #(1) r_lost_link_tx(lost_link_tx,txclk,nxt_lost_link);
RREG #(1) r_breaklink(breaklink,txclk,reset_tx,nxt_breaklink);
RREG #(1) r_restart_an(restart_an,txclk,reset_tx,nxt_restart_an);
REG  #(1) r_set_lol_los (set_lol_from_los_tx,txclk,nxt_set_lol_from_los);
REG  #(1) r_set_lol_c (set_lol_from_c_tx,txclk,nxt_set_lol_from_c);
REG  #(1) r_an_los_1shot (an_loss_sync_d,txclk,an_loss_sync);

// SYNCREG (qout, clk, din);
SYNCREG  r_res_auto(res_auto_tx,txclk,res_auto_pci);
SYNCREG  r_loss_sync_tx (loss_sync_tx, txclk, loss_sync_rx);
SYNCREG  r_reset_tx (.qout(reset_tx),.clk(txclk),.din(reset_pci));
   
SYNCREG  r_got_C (got_C_tx, txclk, got_C_rx);
SYNCREG  r_autoneg_ena_tx (autoneg_ena_tx, txclk, autoneg_ena_pci);
SYNCREG  r_CorData_err (CorData_err_tx, txclk, CorData_err_rx);
SYNCREG  r_good3_Cnack (good3_Cnack_tx, txclk, good3_Cnack_rx);
SYNCREG  r_good3_CorData (good3_CorData_tx, txclk, good3_CorData_rx);
SYNCREG  r_got3_config0 (got3_config0_tx, txclk, got3_config0_rx);
SYNCREG  r_timer_override (timer_override_tx, txclk, timer_override_pci);
SYNCREG  r_clr_lost_link (clr_lost_link, txclk, lost_link_pci);
SYNCREG  r_clr_lol_los (clr_lol_from_los, txclk,set_lol_from_los_pci);
SYNCREG  r_clr_lol_c (clr_lol_from_c, txclk,set_lol_from_c_pci);
SYNCREG  r_serdes_rdy_tx (serdes_rdy_tx,txclk,serdes_rdy);


/**************************************************
 * Added link_up filter logic -loj @Nov. 1st 2005
 **************************************************/
   wire         link_up_pls;
   wire         link_down_pls;
   wire         link_up_filter_en;
   wire         timer_on;
   reg  [10:0]  timer_cnt;
   
PlsGen2 PlsGen2(.sig_in(link_up_loc_ori_temp),.clk(txclk),.lead(link_up_pls),.trail(link_down_pls));

SRFF    timer_on_SRFF(.reset(reset_tx),.clk(txclk),.iSet(link_up_pls),.iRst(link_down_pls),.oQ(timer_on));

always @ (posedge txclk)
  if (reset_tx | (~timer_on))
          timer_cnt <= 0;
  else if (timer_cnt[10])
          timer_cnt <= timer_cnt;
  else    timer_cnt <= timer_cnt + 1;

    
  assign link_up_loc_ori = link_up_filter_en ? (timer_cnt[10] & link_up_loc_ori_temp) : link_up_loc_ori_temp;
   
/* --------------- spare gates --------------- */
`ifdef NEPTUNE
wire      [3:0] do_nad;
wire      [3:0] do_nor;
wire      [3:0] do_inv;
wire      [3:0] do_mux;
wire      [3:0] do_q;
wire            so;

  mac_spare_gates pcs_link_config_spare_gates (
                             .di_nd3     ({1'h1, 1'h1, do_q[3]}),
                             .di_nd2     ({1'h1, 1'h1, do_q[2]}),
                             .di_nd1     ({1'h1, 1'h1, do_q[1]}),
                             .di_nd0     ({1'h1, 1'h1, do_q[0]}),
                             .di_nr3     ({1'h0, 1'h0}),
                             .di_nr2     ({1'h0, 1'h0}),
                             .di_nr1     ({1'h0, 1'h0}),
                             .di_nr0     ({1'h0, 1'h0}),
                             .di_inv     (do_nad[3:0]),
                             .di_mx3     ({1'h0, 1'h0}),
                             .di_mx2     ({1'h0, 1'h0}),
                             .di_mx1     ({1'h0, 1'h0}),
                             .di_mx0     ({1'h0, 1'h0}),
                             .mx_sel     (do_nor[3:0]),
                             .di_reg     (do_inv[3:0]),
                             .wt_ena     (do_mux[3:0]),
                             .rst        ({4{reset_tx}}),
                             .si         (1'h0),
                             .se         (1'h0),
                             .clk        (txclk),
                             .do_nad     (do_nad[3:0]),
                             .do_nor     (do_nor[3:0]),
                             .do_inv     (do_inv[3:0]),
                             .do_mux     (do_mux[3:0]),
                             .do_q       (do_q[3:0]),
                             .so         (so)
                            );

`else
`endif
 
	       
endmodule

