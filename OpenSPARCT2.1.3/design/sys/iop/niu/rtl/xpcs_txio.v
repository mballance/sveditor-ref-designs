// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: xpcs_txio.v
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
//   Design: XPCS Phy Interface Core
//    Block: XPCS Phy Interface Core Top Level
//   Author: Carlos Castil 
//   
//   Module: xpcs_txio
//     File: xpcs_txio.v
//
//   Description: This block contains 8 channel transmit physical
//		  interface to ieee 802.3 clause 48 xpcs.
//
//   Revision History
//   ------------------------------------------------------------
//      Ver   Date      Comments
//   ------------------------------------------------------------
//      1.0   11/12/02  Created
//
// ****************************************************************

module xpcs_txio (
                reset,
		tx_clk,

		tx_byte_0,
		tx_byte_1,
		tx_byte_2,
		tx_byte_3,
		
		tx_special_0,
		tx_special_1,
		tx_special_2,
		tx_special_3,
		
                tx_symbol_0,
                tx_symbol_1,
                tx_symbol_2,
                tx_symbol_3 

		);

// Interface
input           reset;		
input		tx_clk;

input	[7:0]	tx_byte_0;
input	[7:0]	tx_byte_1;
input	[7:0]	tx_byte_2;
input	[7:0]	tx_byte_3;

input		tx_special_0;
input		tx_special_1;
input		tx_special_2;
input		tx_special_3;

output [9:0]    tx_symbol_0;
output [9:0]    tx_symbol_1;
output [9:0]    tx_symbol_2;
output [9:0]    tx_symbol_3;


// lane 0 macro

xpcs_txio_pcs u_lane_0 (
                .reset          (reset),
		.tx_clk		(tx_clk),

		.tx_byte	(tx_byte_0),
		.tx_special	(tx_special_0),
		
		.tx_symbol	(tx_symbol_0) ); 

// lane 1 macro

xpcs_txio_pcs u_lane_1 (
                .reset          (reset),
                .tx_clk         (tx_clk),

                .tx_byte        (tx_byte_1),
                .tx_special     (tx_special_1),

                .tx_symbol      (tx_symbol_1) );


// lane 2 macro

xpcs_txio_pcs u_lane_2 (
                .reset          (reset),
                .tx_clk         (tx_clk),

                .tx_byte        (tx_byte_2),
                .tx_special     (tx_special_2),

                .tx_symbol      (tx_symbol_2) );

// lane 3 macro

xpcs_txio_pcs u_lane_3 (
                .reset          (reset),
                .tx_clk         (tx_clk),

                .tx_byte        (tx_byte_3),
                .tx_special     (tx_special_3),

                .tx_symbol      (tx_symbol_3) );


endmodule		
