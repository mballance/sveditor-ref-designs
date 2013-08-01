// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio_sync.v
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
// ****************************************************************
//
//   Sun Proprietary/Confidential: Internal Use Only
//
// ****************************************************************
//   Design: IB Phy Interface Core
//    Block: IB Phy Interface Core Top Level
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio_sync
//     File: xpcs_rxio_sync.v
//
//   Description: This block contains an X12 receive physical
//		  channel.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   09/21/02  Created
//
// ****************************************************************

module xpcs_rxio_sync (		
		rx_clk,

		reset_rxclk,
                reset_rxclk_lane,

		flush,

                rx_signal_detect,

                hold,

		byte_out,
		special_out,
		error_out,

                symbol_in,

                csr_lane_sync_state,
		csr_lane_sync_status,
              
		rx_lane_clk);

// RX Link Interface

input		rx_clk;
input           rx_signal_detect;
input		reset_rxclk;  
input           reset_rxclk_lane;
input           rx_lane_clk;
input		flush;

input           hold;

input   [9:0]   symbol_in;

output	[7:0]	byte_out;
output		special_out;
output		error_out;

output          csr_lane_sync_status;
output  [3:0]   csr_lane_sync_state;

// Wires

wire		rx_lane_clk;

wire [7:0]      byte_deskew;
wire            special_deskew;
wire            error_deskew;

wire [2:0]      w_ptr;
wire [2:0]      r_ptr;

reg             flush_d;

wire            flush_hold;
wire            flush_sync;


// **********************************************
// Synchronize flush from rx_clk to rx lane clk 
// **********************************************

 always @ (posedge rx_clk)
    flush_d <= flush;

 assign flush_hold = flush | flush_d;

 SYNC_CELL FLUSH_SYNC (.D(flush_hold),
                            .CP(rx_lane_clk),
                            .Q(flush_sync));

xpcs_rxio_sync_fifo_ptr xpcs_rxio_sync_fifo_ptr (
                .w_clk   (rx_lane_clk),
                .w_rst   (reset_rxclk_lane),

                .rx_clk (rx_clk),

                .w_ptr   (w_ptr),
                .r_ptr   (r_ptr),
 
                .hold    (hold),

                .rst     (reset_rxclk),
                .flush   (flush) );


// 10b/8b decoder for low byte

xpcs_rxio_sync_decoder xpcs_rxio_sync_decode (
		.rx_lane_clk	(rx_lane_clk),
		.rx_lane_reset	(reset_rxclk_lane),

		.rx_symbol	(symbol_in),
 
		.byte		(byte_deskew),
		.special	(special_deskew),
		.error		(error_deskew));

// Synchronization State Machine

xpcs_rxio_sync_sm xpcs_rxio_sync_sm (
		.rx_lane_clk	      (rx_lane_clk),
                .rx_signal_detect     (rx_signal_detect),
		.rx_lane_reset	      (reset_rxclk_lane),
		
		.byte_deskew	      (byte_deskew),      // Before synchronization on lane clock
		.special_deskew	      (special_deskew),
		.error_deskew	      (error_deskew),

                .state                (csr_lane_sync_state),
		.csr_lane_sync_status (csr_lane_sync_status));

// deskew fifo for low byte stream

xpcs_rxio_sync_deskew_fifo xpcs_rxio_sync_deskew_fifo (
		.w_clk			(rx_lane_clk),
		.w_rst		        (reset_rxclk_lane | flush_sync),

		.w_byte			(byte_deskew),   // Before synchronization on lane clock
		.w_special		(special_deskew),
		.w_error		(error_deskew),

                .w_ptr                  (w_ptr),
                .r_ptr                  (r_ptr),         // read ptr synchronized to rx_clk
		
		.byte			(byte_out),      // data synchronized to rx_clk
		.special		(special_out),
		.error	        	(error_out));

endmodule		
