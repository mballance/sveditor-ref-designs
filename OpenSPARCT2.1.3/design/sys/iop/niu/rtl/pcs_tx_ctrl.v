// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: pcs_tx_ctrl.v
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
// @(#)pcs_tx_ctrl.v	1.5G
/**********************************************************************/
/* Project Name  :  GEM                                               */
/* Module Name   :  PCS Tx Control Block			      */
/* Description   :  This block sends control signals to the Encoder   */
/*		    block which indicates which characters should go  */
/*		    on the media.  When link is down, the link config */
/*		    block takes control over the media so the Tx      */
/*		    Control block controls are irrelevant at that     */
/*		    time.  The controls are deasserted.      	      */
/*		    If the disparity is positive at the end of the    */
/*		    packet, disparity is flipped to negative.  The    */
/*		    Start of Frame character always resides in an     */
/*		    even byte location.  One or two bytes of the      */
/*		    preamble are replaced by the Tx Control block     */
/*		    depending on if the last character of Idle needs  */
/*		    to be sent out.  One byte may be replaced with    */
/*		    the last portion of Idle, and one byte replaced   */
/*		    with the Start of Frame character.		      */
/*    								      */
/*    		    CRS and COL of the GMII interface are generated   */
/*		    here.  They are asynchronous because they are     *//*		    generated in part from crs_rx from the rx clock   */
/*		    domain.					      */
/*    								      */
/* Assumptions   : none.					      */
/*    								      */
/* Parent module : pcs.v 	                                      */
/* Child modules : none.                                              */
/* Author Name   : Linda Chen                                         */
/* Date Created  : 10/18/96                                           */
/*                                                                    */
/*              Copyright (c) 1994, Sun Microsystems, Inc.            */
/*                   Sun Proprietary and Confidential                 */
/*                                                                    */ 
/* Modifications : 						      */
/*	11/17/97 : removed tx_eq_crs_err signal			      */
/*		 : deassert transmitting two bytes before idle        */
/*		   conditionally with odd lookahead		      */
/*	12/9/98  : disabled crs upon ~enable_tx			      */
/* Synthesis Notes : none yet                                         */
/**********************************************************************/

`include  "pcs_define.h"
  
module pcs_tx_ctrl (txclk,reset_tx,enable_pci,			// inputs
			odd_tx,tx_en_d,tx_er_d,pos_disp_tx_p,
			crs_rx,txd_eq_crs_ext,
			col_test_pci,link_up_tx,

			tx_enc_ctrl_sel,crs,col,tx_state_tx,
			tx_pkt_cnt_tx);	// outputs

input 	txclk;			// Tx Clk 125 MHz
input	reset_tx;		// hw and sw reset OR'ed
input	enable_pci;		// enable for PCS
input	odd_tx;			// byte polarity on media
input 	tx_en_d;		// GMII transmit enable from Mac
input	tx_er_d;		// GMII transmit error from Mac
input	pos_disp_tx_p;		// disparity of data tx_8b_enc_in
input	crs_rx;			// activity on receive media
input	txd_eq_crs_ext;		// incoming txd maps to crs extension code
input	col_test_pci;		// collision test enable
input	link_up_tx;		// used to disable gmii inputs

output [3:0] tx_enc_ctrl_sel;	// control inputs for encoder
output	crs;			// async carrier sense signal over GMII
output	col;			// async collision signal over GMII
output [3:0] tx_state_tx;	// tx control state bits to slave
output [10:0] tx_pkt_cnt_tx;	// packet counter

wire            tx_err;		// 
wire 	        crs, col;	// GMII signals to MAC
wire [10:0]     nxt_pkt_cnt;	// next packet count value
wire	        enable_tx;	// enable for PCS in tx clock domain
wire [3:0]      tx_state_tx;	// tx control state bits to slave
reg 		transmitting;	// tx is actively transmitting
reg [3:0]       tx_enc_ctrl_sel;// tx mux control
reg		inc_pkt_cnt;	// increment packet count
reg [3:0]       nxt_tx_state_tx;// next state
reg 		tx_err_at_sop;

wire tx_err_at_sop_d1;
   
parameter       K285 		= 4'h0,
		D_IDLE		= 4'h1,
		START_OF_STREAM = 4'h2,
		TRANSMIT_STREAM = 4'h3,
		CRS_EXT		= 4'h4,
		END_R		= 4'h7,
		CHECK_DISP	= 4'h9,
		FLIP_DISP	= 4'hA;

assign 	crs = enable_tx & (crs_rx | transmitting), 
	col = (col_test_pci | crs_rx) & transmitting,
	nxt_pkt_cnt = (inc_pkt_cnt)? tx_pkt_cnt_tx + 1'h1 : tx_pkt_cnt_tx;

FD1 tx_err_at_sop_d1_FD1(.CP(txclk), .D(tx_err_at_sop), .Q(tx_err_at_sop_d1));

   assign tx_err = tx_err_at_sop_d1 | tx_er_d;
   
/* Tx Control state machine */


always @ (tx_state_tx or reset_tx or odd_tx or 
          tx_en_d or link_up_tx or enable_tx or
          tx_err or tx_er_d  or txd_eq_crs_ext or pos_disp_tx_p) 
   begin	
		transmitting	= 1'h0;
		tx_enc_ctrl_sel	= `PCS_ENC_K285;
		inc_pkt_cnt     = 1'h0;
                tx_err_at_sop   = 1'b0;
		nxt_tx_state_tx = K285;

      	case (tx_state_tx)  // synopsys parallel_case full_case
            K285 : // 0
                if (reset_tx | odd_tx)      	 
			nxt_tx_state_tx = K285;
		else if (tx_en_d & link_up_tx & enable_tx)
		  begin
		   	transmitting    = 1'h1;	
		   	tx_enc_ctrl_sel = `PCS_ENC_SOP;
		        tx_err_at_sop   = tx_er_d;      // loj
		   	nxt_tx_state_tx = TRANSMIT_STREAM;	
			inc_pkt_cnt     = 1'h1;
		  end
		else 
			nxt_tx_state_tx = D_IDLE;
	    D_IDLE : // 1
	      begin
		tx_enc_ctrl_sel = `PCS_ENC_IDLE2;
		if (tx_en_d & link_up_tx)
		      begin
			inc_pkt_cnt = 1'h1;
			nxt_tx_state_tx = START_OF_STREAM;
		      end
		else
			nxt_tx_state_tx = K285;
	      end
	    START_OF_STREAM : // 2
		begin
		   transmitting = 1'h1;	
		   tx_enc_ctrl_sel = `PCS_ENC_SOP;
                   tx_err_at_sop   = tx_er_d;      // loj
		   nxt_tx_state_tx = TRANSMIT_STREAM;	
		end
	    TRANSMIT_STREAM : // 3
		if (tx_en_d)
		    begin
			transmitting = 1'h1;
			if (tx_err) 
				tx_enc_ctrl_sel = `PCS_ENC_H_CHAR;
			else 
				tx_enc_ctrl_sel = `PCS_ENC_DATA;
			nxt_tx_state_tx = TRANSMIT_STREAM;
		    end
		else
		    begin
			transmitting = 1'h1;
			tx_enc_ctrl_sel = `PCS_ENC_T_CHAR;
			nxt_tx_state_tx = TRANSMIT_STREAM;
			if (txd_eq_crs_ext)
			    nxt_tx_state_tx = CRS_EXT;
			else if (tx_err)
			    begin
			        tx_enc_ctrl_sel = `PCS_ENC_H_CHAR;
				nxt_tx_state_tx = CRS_EXT;
			    end
			else 
			    begin
			     	nxt_tx_state_tx = END_R;
				transmitting = odd_tx; // if odd, 3rd byte from end
			    end
		    end
	    CRS_EXT : // 4
		begin			// add extra R's 
		   transmitting = 1'h1;
		   tx_enc_ctrl_sel = `PCS_ENC_R_CHAR;
   		   if (txd_eq_crs_ext)
		      	nxt_tx_state_tx = CRS_EXT;
		   else if (tx_err)	// includes carrier extension error
		      begin
			nxt_tx_state_tx = CRS_EXT;
		        tx_enc_ctrl_sel = `PCS_ENC_H_CHAR;			
		      end
		   else if (tx_en_d)
		      begin
			tx_enc_ctrl_sel = `PCS_ENC_SOP;
			nxt_tx_state_tx = TRANSMIT_STREAM;	
		      end
		   else
		   	nxt_tx_state_tx = END_R;
		end
	    END_R : // 7
		begin
		   tx_enc_ctrl_sel = `PCS_ENC_R_CHAR;
		   if (!odd_tx)
			nxt_tx_state_tx = END_R;
		   else 
			nxt_tx_state_tx = CHECK_DISP;
	        end
	   CHECK_DISP : // 9

		if (pos_disp_tx_p)
		   nxt_tx_state_tx = FLIP_DISP;
		else
		   nxt_tx_state_tx = D_IDLE;	
	   FLIP_DISP : // A
		begin	
		   tx_enc_ctrl_sel = `PCS_ENC_IDLE1;
		   nxt_tx_state_tx = K285;
		end // case: FLIP_DISP
	   default:nxt_tx_state_tx = K285;
	endcase
  end
			   
// state registers
RREG #(4) tx_state_tx_RREG (tx_state_tx, txclk, reset_tx, nxt_tx_state_tx);
   
RREG #(11) pkt_cnt_tx_RREG(tx_pkt_cnt_tx, txclk, reset_tx, nxt_pkt_cnt);

SYNCREG enable_tx_SYNCREG(enable_tx,txclk,enable_pci);


endmodule // pcs_tx_ctrl


