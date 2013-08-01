// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_sequence_detect.v
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
// @(#)pcs_sequence_detect.v	1.1G
/**********************************************************************/
/* Project Name  :  CASSINI                                           */
/* Module Name   :  PCS Sequence Detection			      */
/* Description   :  This block detects all ordered sets which could   */
/*		    come over the receive data bus.  As a result, it  */
/*		    generates flags indicating which ordered sets     */
/*		    were received. These outputs are used by the Link */
/*		    Configuration block to determine link status.     */
/*		    It also captures the partner's configuration      */
/*		    registers in order to compare them with previous  */
/*		    copies it has received.  It counts the number of  */
/*		    sequential and identical Config registers         */
/*		    it has received (not comparing their ack bits),   */
/*		    and counts the number of Config registers with    */
/*		    the ack bit set plus good data characters it has  */
/*		    received sequentially.  These flags are also used */
/*		    by the Link Configuration block.  The outputs are */
/*		    passed out synchronous to the rxclk, so the       */
/*		    blocks which use the outputs must synchronize     */
/*		    them to the local clock domain if necessary.      */
/*    								      */
/*    		    This block also detects whether word synchroniz-  */
/*		    ation has been achieved. The main output from it  */
/*		    is the loss_sync signal. Loss of signal indicated */
/*		    by the optics will put the state machine in loss  */
/*		    of sync state.  Then the state machine will try   */
/*		    to reacquire sync.  Link Configuration will be    */
/*		    triggered upon loss_sync.			      */
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
/*	7/22/97 : removed flag for got_Cnack_rx to restart autoneg    */
/*	     : add check for unaligned commas for sync state machine  */
/*	     : allow any d following k28.5 to be considered an idle   */
/*	11/1/97 : add got3_config0_rx flag for aneg restart	      */
/*	     : add check for dec_err and disp_err to cause aneg       */
/*	       restart during aneg				      */	
/*	     : stay in loss of sync if signal_detect is in FAIL	      */
/*	11/17/97: reset Cnack_cnt and CorData_cnt counters if got idle*/
/*	     : updated got_none_err to allow undefined idles	      */
/*	11/24/97: removed signal_detect_rx_d because it no longer     */
/*	     : drives any nets.					      */
/*	12/8/98 : changed word_sync sm to only look at commas, not    */
/*	     : care if it is k28.5 specifically			      */
/*	12/8/98 : changed crs to trigger on carrier detect which      */
/*	     : looks for 2 or more bit difference with K28.5	      */
/*      1/17/02 : added LT_TM related logic                           */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"

module pcs_sequence_detect (
        rxclk,reset_pci, // inputs
	kchar_p,disp_err_p,dec_err_p,rx_8bdata_p,odd_rx,signal_detect,	
	got_d_linkconf_p,nxt_crs_mask,
	link_up_tx,comma_p,k285w1_p,

	good3_Cnack_rx,good3_CorData_rx,		// outputs
	got_C_rx,CorData_err_rx,nxt_crs_rx,crs_rx,
	loss_sync_rx,reset_rx,link_partner_rx,
	seq_state_rx,word_state_rx,got3_config0_rx);			

input 	rxclk;			// Rx Clk 125 MHz
input	reset_pci;		// hw and sw reset OR'ed, needs sync from PCI
input	kchar_p;		// this marks a K char 
input	disp_err_p;		// marks a code which had a disparity error
input	dec_err_p;		// marks a code which was not a valid code
input [7:0] rx_8bdata_p; 	// the 8 bit decoded data
input	odd_rx;			// indicates alignment to word boundary	
input	signal_detect;		// input from optics which indicates light ok
input	got_d_linkconf_p;	// flags special data character 
input	nxt_crs_mask;		// used to deassert crs_rx early for IPG
input	link_up_tx;		// used to clear cnt_CorData
input	comma_p;		// received a comma character
input	k285w1_p;		// within one bit of k28.5

output	good3_Cnack_rx;		// flag to link config, got 3 C's 
output	good3_CorData_rx;	// flag to link config, got 3 C's or data
output	got_C_rx;		// flag to indicate currently receiving C chars
output	CorData_err_rx;		// flag to indicate not receiving C or data 
output	nxt_crs_rx;		// unmasked crs_rx one cycle before crs_rx
output	crs_rx;			// post-masked crs_rx due out with rx_dv
output	loss_sync_rx;		// flag which indicates word synchronization 
output	reset_rx;		// synchronized here, to be used by rx_ctrl
output	[15:0] link_partner_rx; // same as cfg_old, link partner ability 
output [1:0] seq_state_rx;	// state bits to slave for diagnostic
output [2:0] word_state_rx;	// state bits to slave for diagnostic
output  got3_config0_rx;	// used in conjunction with good3_Cnack_rx 
				// to restart aneg

wire	reset_rx;		// synchronized version of reset to rxclk
wire 	got_k285; 		// special symbol K28.5 detected
wire	clr_got_C, 		// control for special symbol detect registers
	clr_got_I;
wire	set_got_C, 		// used to set got_C reg
	set_got_I,		// used to set got_I reg
	got_none_err;		// used in clearing got_C/I regs
wire    got_I, nxt_got_C,	
	nxt_got_I;
wire [15:0] cfg_new, cfg_old;	// used for config reg compare for link config
wire [7:0]  cfg_new_lsb,	// pipeline of config registers, used to 
	cfg_new_msb,		// compare sequential config register contents
	cfg_old_msb,
	cfg_old_lsb;	
wire 	Cnack_same,		// compare of config regs disregarding ack bit
	Cwack_same;		// compare of config regs, all bits	
wire [1:0] Cnack_cnt,		// counter for number of sequential and
	nxt_Cnack_cnt,		// identical Config regs
	CorData_cnt,
	nxt_CorData_cnt;	
wire	good3_Cnack,		// flags for when counters reach 3
	good3_CorData;		
wire	load_config;		// load signal for config reg pipeline
wire	compare_config;		// asserted when ok to compare Config regs
wire	two_kchar_err;		// flag for two Kchar in a row error
wire	CorData_err_loc;	// local version of CorData_err, not delayed

wire [1:0] seq_state_rx, nxt_seq_state_rx;
wire [2:0] word_state_rx, nxt_word_state_rx;	

wire [15:0] link_partner_rx;	// same as cfg_new, link partner ability reg
wire	clr_crs_rx,set_crs_rx,	// signals used for carrier sense rx activity
	crs_rx_p,nxt_crs_rx,
	masked_nxt_crs_rx;	
wire	carrier_detect;		// 2+ bit difference to k28.5 detected

/*
** Signals Specific to Word Synchronization
*/
wire  [1:0] nxt_sync_cnt, 	// counter for number of good commas received
	sync_cnt;	
wire	loss_sync_loc;		// local version of loss_sync, not delayed
wire	invalid;		// error flag used to determine loss of sync
wire	sync_cnt_eq3;		// flag which marks receipt of 3 good commas
wire	clr_sync_cnt;		// clear signal for good comma counter
wire 	inc_sync_cnt;		// increment signal for good comma counter
wire	signal_detect_rx;	// delayed version of signal detect from optics

parameter  	CHECK_K285 	= 2'h0,	// sequence detect state machine
		CHECK_D_CHAR	= 2'h1,
		CONFIG_LOAD_LSB = 2'h2,
		CONFIG_LOAD_MSB = 2'h3;
		
parameter 	LOSS_SYNC	= 3'h0, // word synchronization state machine
		IN_SYNC		= 3'h1,
		ONE_INVALID	= 3'h2,
		TWO_INVALID	= 3'h3,
		THREE_INVALID	= 3'h4;

assign 	got_k285 = kchar_p & rx_8bdata_p[`PCS_K285_CHAR],
 	clr_got_C = set_got_I | got_none_err,
	clr_got_I = set_got_C | got_none_err,
	nxt_got_C = (clr_got_C | reset_rx) ? 1'h0 : (set_got_C) ? 1'h1 : 
		got_C_rx,
	nxt_got_I = (clr_got_I | reset_rx) ? 1'h0 : (set_got_I) ?
		 1'h1 : got_I,
	cfg_new_msb = rx_8bdata_p,
	link_partner_rx = {cfg_new_lsb,cfg_old_msb},
	cfg_new = {cfg_new_msb,cfg_new_lsb},
	cfg_old = {cfg_old_msb,cfg_old_lsb},
	Cnack_same = (cfg_old[13:0] == cfg_new[13:0])
			& (cfg_old[15] == cfg_new[15]),
	Cwack_same = Cnack_same & cfg_old[14] & cfg_new[14],
	nxt_Cnack_cnt = (reset_rx | (compare_config & !Cnack_same) | got_I) ? 
		2'h0 : (good3_Cnack) ? 2'h3 : (compare_config & Cnack_same) ? 
		Cnack_cnt + 1'h1 : Cnack_cnt,   
	nxt_CorData_cnt = (reset_rx | (compare_config & ~Cwack_same) | link_up_tx) ?
		2'h0 : (good3_CorData) ? 2'h3 : (compare_config & Cwack_same) ? 
		CorData_cnt + 1'h1 : CorData_cnt,
	good3_Cnack = Cnack_cnt == 2'h3,
	good3_CorData = CorData_cnt == 2'h3,
	CorData_err_loc = !(got_C_rx | got_I), 
	crs_rx_p = (reset_rx | clr_crs_rx) ? 1'h0 : (set_crs_rx) ? 1'h1 :
		nxt_crs_rx,
	masked_nxt_crs_rx = nxt_crs_rx & ~nxt_crs_mask,
	got3_config0_rx = good3_Cnack & (cfg_old == 16'h0),
	carrier_detect = ~odd_rx & ~k285w1_p;
		

/*
** Call of function sequence_detect_fn
*/
assign {set_got_C,set_got_I,got_none_err,
	load_config,compare_config,two_kchar_err,
	clr_crs_rx,set_crs_rx,nxt_seq_state_rx }
	= sequence_detect_fn(reset_rx,odd_rx,
	got_k285,got_d_linkconf_p,
	dec_err_p,disp_err_p,carrier_detect,kchar_p,seq_state_rx);

/*
** Sequence Detect state machine
*/
function [9:0] sequence_detect_fn;
   input        reset;
   input	odd;
   input	got_k285;
   input	got_d_linkconf;		
   input	dec_err;	
   input	disp_err;	
   input	carrier_detect;
   input	kchar;
   input [1:0]	state;

   reg		set_got_C;	// control signals for special char detect
   reg		set_got_I;
   reg		got_none_err;	// illegal & unrecognizable sequence
   reg		load_config;	// load config regs in pipeline
   reg		compare_config;	// ok to compare config regs
   reg		two_kchar_err;	// illegal sequence
   reg		clr_crs_rx;	// turn off carrier sense 
   reg		set_crs_rx;	// turn on carrier sense
   reg [1:0]    n_state;	// next state

   begin
		set_got_C = 1'h0;
		set_got_I = 1'h0;
		got_none_err = 1'h0;
		load_config = 1'h0;
		compare_config = 1'h0;
		two_kchar_err = 1'h0;
		clr_crs_rx = 1'h0;
		set_crs_rx = 1'h0;
		n_state = 2'h0;

      	case (state)  // synopsys parallel_case full_case
            CHECK_K285 : // 0
                if (reset)	
			n_state = CHECK_K285;
	        else if (!odd & got_k285)
		   begin
			n_state = CHECK_D_CHAR;
			clr_crs_rx = 1'h1;
		   end
		else 
		   begin
			got_none_err = 1'h1;
			n_state = CHECK_K285;
			set_crs_rx = carrier_detect;
		   end
	    CHECK_D_CHAR : // 1
		begin
		  set_got_C = got_d_linkconf & ~disp_err;	
		  set_got_I = ~dec_err & ~got_d_linkconf & ~disp_err ;
		  got_none_err = disp_err | dec_err;
 		  two_kchar_err = kchar;
		  if (got_d_linkconf)
			n_state = CONFIG_LOAD_LSB;
		  else
			n_state = CHECK_K285;
		end
	    CONFIG_LOAD_LSB : // 2
		begin
		  if (dec_err | disp_err)
			got_none_err = 1'h1;
		  else
			load_config = 1'h1;
		n_state = CONFIG_LOAD_MSB;
		end
	    CONFIG_LOAD_MSB : // 3
		begin
		  if (dec_err | disp_err)
			got_none_err = 1'h1;
		  else
		    begin
			load_config = 1'h1;
		  	compare_config = 1'h1;
		    end
		  n_state = CHECK_K285;
		end
            default: n_state = CHECK_K285;
	endcase
	
    sequence_detect_fn = {set_got_C,set_got_I,
		got_none_err,load_config,compare_config,
		two_kchar_err,clr_crs_rx,set_crs_rx,n_state };
  end
endfunction

RREG #(2) r_seq_state (seq_state_rx, rxclk, reset_rx, nxt_seq_state_rx);
REG  #(1) r_nxt_crs_rx (nxt_crs_rx, rxclk, crs_rx_p);
REG  #(1) r_crs_rx (crs_rx, rxclk, masked_nxt_crs_rx);
REG  #(2) r_Cnack_cnt (Cnack_cnt, rxclk, nxt_Cnack_cnt);
REG  #(2) r_CorData_cnt (CorData_cnt, rxclk, nxt_CorData_cnt);
REG  #(1) r_got_C (got_C_rx, rxclk, nxt_got_C);
REG  #(1) r_got_I (got_I, rxclk, nxt_got_I);
REG  #(1) r_good3_Cnack_rx(good3_Cnack_rx, rxclk, good3_Cnack);	    // unglitch
REG  #(1) r_good3_CorData_rx(good3_CorData_rx, rxclk, good3_CorData); // unglitch
REG  #(1) r_CorData_err_rx(CorData_err_rx, rxclk, CorData_err_loc); // unglitch
SRREG #(8) r_cfg_old_lsb (cfg_old_lsb,rxclk,load_config,reset_rx,cfg_old_msb);
SRREG #(8) r_cfg_old_msb (cfg_old_msb,rxclk,load_config,reset_rx,cfg_new_lsb);
SRREG #(8) r_cfg_new_lsb (cfg_new_lsb,rxclk,load_config,reset_rx,cfg_new_msb);

// SYNCREG (qout, clk, din);
SYNCREG  r_reset_rx(.qout(reset_rx),.clk(rxclk),.din(reset_pci));

/*
** Word Synchronization Logic
*/

assign nxt_sync_cnt = (reset_rx|clr_sync_cnt)? 2'h0 : (inc_sync_cnt) ?
		sync_cnt + 1'h1 : sync_cnt,
//       no_signal = !signal_detect_rx & signal_detect_rx_d, 
// need to conform to the spec, so restart on ~signal_detect instead of one shot
       invalid = dec_err_p | two_kchar_err | disp_err_p | (comma_p & odd_rx),
       sync_cnt_eq3 = sync_cnt == 2'h3;
	

/*
** Call of function word synchronization
*/
assign {loss_sync_loc,inc_sync_cnt,clr_sync_cnt,nxt_word_state_rx}
	= word_synchronization_fn(reset_rx,
	comma_p,odd_rx,
	invalid,sync_cnt_eq3,word_state_rx);

/*
** Word Synchronization state machine
*/
function [5:0] word_synchronization_fn;
   input        reset;
   input	got_comma;	// to determine if there is a comma
   input	odd;		// 		
   input	invalid;	// invalid transmission word detected
   input	sync_cnt_eq3;	// found 3 commas with no errors
   input [2:0]	state;

   reg 		loss_sync;	// indicates word sync status
   reg		inc_sync_cnt;	// increment word sync counter
   reg		clr_sync_cnt;	// clear word sync counter
   reg [2:0]    n_state;	// next state

   begin
		loss_sync = 1'h0; 
		inc_sync_cnt = 1'h0;
		clr_sync_cnt = 1'h0;			
		n_state = LOSS_SYNC;

      	case (state)  // synopsys parallel_case full_case
            LOSS_SYNC : // 0	// being in this state triggers link config
	      begin
		loss_sync = 1'h1;
                if (reset)	
			n_state = LOSS_SYNC;
		else if (invalid)	
			clr_sync_cnt = 1'h1;
	        else if (sync_cnt_eq3)	// got 3 good ordered sets with commas
			n_state = IN_SYNC;
		else if (got_comma & ~odd) // accum good
			inc_sync_cnt = 1'h1;
	     end
	   IN_SYNC : // 1
		if (invalid) 
			n_state = ONE_INVALID;
		else 
			n_state = IN_SYNC;
	   ONE_INVALID : // 2
		if (invalid) 
			n_state = TWO_INVALID;
		else 
			n_state = IN_SYNC;
	   TWO_INVALID : // 3
		if (invalid) 
			n_state = THREE_INVALID;
		else 
			n_state = ONE_INVALID;
	   THREE_INVALID : // 4
		if (invalid) 
		   begin
			n_state = LOSS_SYNC;
			clr_sync_cnt = 1'h1;	// reset good comma counter
		   end
		else 
			n_state = TWO_INVALID;
	   default:     n_state = LOSS_SYNC;
	endcase
	
    word_synchronization_fn = {loss_sync,inc_sync_cnt,clr_sync_cnt,n_state};

  end
endfunction

RREG #(3) r_word_state (word_state_rx, rxclk, reset_rx|(~signal_detect_rx), 
		nxt_word_state_rx);
REG #(2) r_sync_cnt (sync_cnt, rxclk, nxt_sync_cnt);
SYNCREG r_signal_det_rx (signal_detect_rx, rxclk, signal_detect);
REG #(1) r_loss_sync_rx (loss_sync_rx, rxclk, loss_sync_loc);

endmodule


