// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_rxio.v
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
//   Design: XPCS PMA Interface Core
//    Block: XPCS PMA Interface Core Top Level
//   Author: Carlos Castil 
//   
//   Module: xpcs_rxio
//     File: xpcs_rxio.v
//
//   Description: This block contains an X4 receive physical
//		  interface.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   09/20/02  Created
//
// ****************************************************************

module xpcs_rxio (

                core_clk,

		reset_rxclk,

                rx_signal_detect,

		rx_byte_0,
		rx_byte_1,
		rx_byte_2,
		rx_byte_3,

		rx_special_0,
		rx_special_1,
		rx_special_2,
		rx_special_3,

		rx_error_0,
		rx_error_1,
		rx_error_2,
		rx_error_3,

                rx_wclk_a, 
                rx_symbol_a,

                rx_wclk_b,
                rx_symbol_b,

                rx_wclk_c,
                rx_symbol_c,

                rx_wclk_d,
                rx_symbol_d,

                csr_lane_sync_status,

                csr_lane_sync_state0,
                csr_lane_sync_state1,
                csr_lane_sync_state2,
                csr_lane_sync_state3,

                csr_link_status,
                csr_link_status_rx,
                csr_pulse_deskew_error,
                csr_ebuffer_state

		);

input		reset_rxclk;

input           core_clk;

input   [3:0]   rx_signal_detect;

output	[7:0]	rx_byte_0;
output	[7:0]	rx_byte_1;
output	[7:0]	rx_byte_2;
output	[7:0]	rx_byte_3;

output		rx_special_0;
output		rx_special_1;
output		rx_special_2;
output		rx_special_3;

output		rx_error_0;
output		rx_error_1;
output		rx_error_2;
output		rx_error_3;

input        rx_wclk_a;
input [9:0]  rx_symbol_a;

input        rx_wclk_b;
input [9:0]  rx_symbol_b;

input        rx_wclk_c;
input [9:0]  rx_symbol_c;

input        rx_wclk_d;
input [9:0]  rx_symbol_d;

output       csr_link_status;
output       csr_link_status_rx;
output [3:0] csr_lane_sync_status;

output       csr_pulse_deskew_error;
output [7:0] csr_ebuffer_state;

output [3:0] csr_lane_sync_state0;
output [3:0] csr_lane_sync_state1;
output [3:0] csr_lane_sync_state2;
output [3:0] csr_lane_sync_state3;


wire	     rx_wclk_a;
wire         rx_wclk_b;
wire         rx_wclk_c;
wire         rx_wclk_d;

wire	[7:0]	w_byte_0;
wire	[7:0]	w_byte_1;
wire	[7:0]	w_byte_2;
wire	[7:0]	w_byte_3;

wire		w_special_0;
wire		w_special_1;
wire		w_special_2;
wire		w_special_3;

wire		w_error_0;
wire		w_error_1;
wire		w_error_2;
wire		w_error_3;

wire		flush;

wire		w_hold_0;
wire            w_hold_1;
wire		w_hold_2;
wire		w_hold_3;

wire            sync_status;

wire            reset_rxclk_0;
wire            reset_rxclk_1;
wire            reset_rxclk_2;
wire            reset_rxclk_3;

wire            signal_detect_0;
wire            signal_detect_1;
wire            signal_detect_2;
wire            signal_detect_3;

wire            rx_clk;

wire            csr_lane_sync_status_lane0;
wire            csr_lane_sync_status_lane1;
wire            csr_lane_sync_status_lane2;
wire            csr_lane_sync_status_lane3;

wire  [3:0]     lane_sync_status;

assign rx_clk = rx_wclk_a; 

// **********************************************
// synchronize each rx lane sync status to rx_clk
// **********************************************

SYNC_CELL u_sync_rx_status_lane0 (
                        .D  (csr_lane_sync_status_lane0),  // unsynchronized sync_status
                        .CP (rx_clk),
                        .Q  (lane_sync_status[0]));    // synchronized sync_status

SYNC_CELL u_sync_rx_status_lane1 (
                        .D  (csr_lane_sync_status_lane1),  // unsynchronized sync_status
                        .CP (rx_clk),
                        .Q  (lane_sync_status[1]));    // synchronized sync_status

SYNC_CELL u_sync_rx_status_lane2 (
                        .D  (csr_lane_sync_status_lane2),  // unsynchronized sync_status
                        .CP (rx_clk),
                        .Q  (lane_sync_status[2]));    // synchronized sync_status

SYNC_CELL u_sync_rx_status_lane3 (
                        .D  (csr_lane_sync_status_lane3),  // unsynchronized sync_status
                        .CP (rx_clk),
                        .Q  (lane_sync_status[3]));    // synchronized sync_status

assign sync_status = lane_sync_status[0] & lane_sync_status[1] & lane_sync_status[2] & lane_sync_status[3];

// ***************************************
// synchronize rx sync_status to core_clk
// ***************************************

SYNC_CELL u_sync_core_status_lane0 (
                        .D  (csr_lane_sync_status_lane0),  // unsynchronized sync_status
                        .CP (core_clk),
                        .Q  (csr_lane_sync_status[0]));    // synchronized sync_status

SYNC_CELL u_sync_core_status_lane1 (
                        .D  (csr_lane_sync_status_lane1),  // unsynchronized sync_status
                        .CP (core_clk),
                        .Q  (csr_lane_sync_status[1]));    // synchronized sync_status

SYNC_CELL u_sync_core_status_lane2 (
                        .D  (csr_lane_sync_status_lane2),  // unsynchronized sync_status
                        .CP (core_clk),
                        .Q  (csr_lane_sync_status[2]));    // synchronized sync_status

SYNC_CELL u_sync_core_status_lane3 (
                        .D  (csr_lane_sync_status_lane3),  // unsynchronized sync_status
                        .CP (core_clk),
                        .Q  (csr_lane_sync_status[3]));    // synchronized sync_status

// ***************************************
// synchronize link status to core_clk
// ***************************************

SYNC_CELL u_sync_link_status_core (
                        .D  (csr_link_status_rx),  // unsynchronized sync_status
                        .CP (core_clk),
                        .Q  (csr_link_status));    // synchronized sync_status

// ***************************************
// synchronize signal_detect to rx clocks 
// ***************************************

SYNC_CELL u_sync_signal_detect_lane0 (
                        .D  (rx_signal_detect[0]),  // unsynchronized sync_status
                        .CP (rx_wclk_a),
                        .Q  (signal_detect_0));    // synchronized sync_status

SYNC_CELL u_sync_signal_detect_lane1 (
                        .D  (rx_signal_detect[1]),  // unsynchronized sync_status
                        .CP (rx_wclk_b),
                        .Q  (signal_detect_1));    // synchronized sync_status

SYNC_CELL u_sync_signal_detect_lane2 (
                        .D  (rx_signal_detect[2]),  // unsynchronized sync_status
                        .CP (rx_wclk_c),
                        .Q  (signal_detect_2));    // synchronized sync_status

SYNC_CELL u_sync_signal_detect_lane3 (
                        .D  (rx_signal_detect[3]),  // unsynchronized sync_status
                        .CP (rx_wclk_d),
                        .Q  (signal_detect_3));    // synchronized sync_status

// ***************************************
// synchronize reset_rxclk to lane domains
// ***************************************

SYNC_CELL u_sync_reset_0 (
                        .D  (reset_rxclk),   // unsynchronized
                        .CP (rx_wclk_a),
                        .Q  (reset_rxclk_0) ); // synchronized

SYNC_CELL u_sync_reset_1 (
                        .D  (reset_rxclk),   // unsynchronized
                        .CP (rx_wclk_b),
                        .Q  (reset_rxclk_1) ); // synchronized 

SYNC_CELL u_sync_reset_2 (
                        .D  (reset_rxclk),   // unsynchronized
                        .CP (rx_wclk_c),
                        .Q  (reset_rxclk_2) ); // synchronized 

SYNC_CELL u_sync_reset_3 (
                        .D  (reset_rxclk),   // unsynchronized
                        .CP (rx_wclk_d),
                        .Q  (reset_rxclk_3) ); // synchronized 


// Elastic Buffer

xpcs_rxio_ebuffer u_ebuffer (
		.rx_clk                    	(rx_clk),
		.reset    			(reset_rxclk),

                .csr_link_status                (csr_link_status_rx),
                .sync_status                    (sync_status),
                .csr_pulse_deskew_error         (csr_pulse_deskew_error),
                .csr_ebuffer_state              (csr_ebuffer_state),
		
		.w_byte_0			(w_byte_0),
		.w_byte_1			(w_byte_1),
		.w_byte_2			(w_byte_2),
		.w_byte_3			(w_byte_3),
		
		.w_special_0			(w_special_0),
		.w_special_1			(w_special_1),
		.w_special_2			(w_special_2),
		.w_special_3			(w_special_3),
		
		.w_error_0			(w_error_0),
		.w_error_1			(w_error_1),
		.w_error_2			(w_error_2),
		.w_error_3			(w_error_3),
		
		.flush			        (flush),
		
		.w_hold_0			(w_hold_0),
		.w_hold_1			(w_hold_1),
		.w_hold_2			(w_hold_2),
		.w_hold_3			(w_hold_3),

		.r_byte_0			(rx_byte_0),
		.r_byte_1			(rx_byte_1),
		.r_byte_2			(rx_byte_2),
		.r_byte_3			(rx_byte_3),
		
		.r_special_0			(rx_special_0),
		.r_special_1			(rx_special_1),
		.r_special_2			(rx_special_2),
		.r_special_3			(rx_special_3),
		
		.r_error_0			(rx_error_0),
		.r_error_1			(rx_error_1),
		.r_error_2			(rx_error_2),
		.r_error_3			(rx_error_3) );

// lane 0

xpcs_rxio_sync rxio_sync_lane_0 (		
		.rx_clk              (rx_clk),
		.reset_rxclk         (reset_rxclk),
                .reset_rxclk_lane    (reset_rxclk_0),
		
		.flush	             (flush),          // from DESKEW 
                .rx_signal_detect    (signal_detect_0),

		.hold                (w_hold_0),         // from DESKEW 

		.byte_out            (w_byte_0),         // from DESKEW 
		.special_out         (w_special_0),      // from DESKEW 
		.error_out           (w_error_0),        // from DESKEW 

		.csr_lane_sync_status  (csr_lane_sync_status_lane0),
                .csr_lane_sync_state   (csr_lane_sync_state0),

		.symbol_in           (rx_symbol_a),

		.rx_lane_clk         (rx_wclk_a) );

// lane 1 : Byte 1 and Byte 5

xpcs_rxio_sync rxio_sync_lane_1 (
                .rx_clk              (rx_clk),
                .reset_rxclk         (reset_rxclk),
                .reset_rxclk_lane    (reset_rxclk_1),

                .flush               (flush),          // from DESKEW
                .rx_signal_detect    (signal_detect_1),

                .hold                (w_hold_1),         // from DESKEW

                .byte_out            (w_byte_1),         // from DESKEW 
                .special_out         (w_special_1),      // from DESKEW
                .error_out           (w_error_1),        // from DESKEW 

                .csr_lane_sync_status  (csr_lane_sync_status_lane1),
                .csr_lane_sync_state   (csr_lane_sync_state1),


                .symbol_in           (rx_symbol_b),

                .rx_lane_clk         (rx_wclk_b) );

// lane 2 : Byte 2 and Byte 6

xpcs_rxio_sync rxio_sync_lane_2 (
                .rx_clk              (rx_clk),
                .reset_rxclk         (reset_rxclk),
                .reset_rxclk_lane    (reset_rxclk_2),


                .flush               (flush),          // from DESKEW
                .rx_signal_detect    (signal_detect_2),

                .hold                (w_hold_2),         // from DESKEW

                .byte_out            (w_byte_2),         // from DESKEW
                .special_out         (w_special_2),      // from DESKEW
                .error_out           (w_error_2),        // from DESKEW

                .csr_lane_sync_status  (csr_lane_sync_status_lane2),
                .csr_lane_sync_state   (csr_lane_sync_state2),

                .symbol_in            (rx_symbol_c),

                .rx_lane_clk          (rx_wclk_c) );


// lane 3 : Byte 3 and Byte 7 

xpcs_rxio_sync rxio_sync_lane_3 (
                .rx_clk              (rx_clk),
                .reset_rxclk         (reset_rxclk),
                .reset_rxclk_lane    (reset_rxclk_3),

                .flush               (flush),          // from DESKEW
                .rx_signal_detect    (signal_detect_3),

                .hold                (w_hold_3),         // from DESKEW

                .byte_out            (w_byte_3),         // from DESKEW
                .special_out         (w_special_3),      // from DESKEW
                .error_out           (w_error_3),        // from DESKEW

                .csr_lane_sync_status  (csr_lane_sync_status_lane3),
                .csr_lane_sync_state   (csr_lane_sync_state3),

                .symbol_in           (rx_symbol_d),

                .rx_lane_clk         (rx_wclk_d) );

endmodule
