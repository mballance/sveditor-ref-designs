// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: MDIO2P_IO.v
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
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2003 Texas Instruments, Inc.
// All rights reserved
//
// This is an unpublished work created in the year stated above.
// Texas Instruments owns all rights in and to the work and intends to
// maintain it and protect it as unpublished copyright. In the event
// of either inadvertant or deliberate publication, the above stated
// date shall be treated as the year of first publication. In the event
// of such publication, Texas Instruments intends to enforce its rights
// in the work under the copyright laws as a published work.
//
// These commodities are under U.S. Government distribution license
// control. As such, they are not be re-exported without prior approval
// from the U.S. Department of Commerce.
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
// FUNCTION: MDIO Clock muxing and CFG decode
// COMMENTS: 
//  VERSION: #VERSION#
//     DATE: #DATE#
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module MDIO2P_IO
 (
  tcu_clk_stop,
  tcu_scan_mode,

  RESET,
  MDCLK,
  SCANEN,
  SCANCLK,
  CFG,
  IO_MDCLK,
  IO_RESET,
  IO_CLAUSE45,
  IO_PRTID,
  IO_DEVID,
  IO_BASEAD,
  IO_ACRAD,
  IO_IPRAD
 );


////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  input        RESET;              // Global reset

  // Scan clock control
  input        tcu_clk_stop;       // For N2 DFT clock control
  input        tcu_scan_mode;      // For N2 DFT clock control

  // MDIO Interface
  input        MDCLK;              // Clock

  // Scan Interface
  input        SCANEN;             // Bypass MDIO2P clocks for scan
  input        SCANCLK;            // Scan clock source

  // Configuration Interface
  input[15:0]  CFG;                // Configuration
  output       IO_CLAUSE45;        // Clause45
  output[4:0]  IO_PRTID;           // Port address ID
  output[4:0]  IO_DEVID;           // Device address ID
  output[4:0]  IO_BASEAD;          // Base address
  output[3:0]  IO_ACRAD;           // AddrCtl register address
  output[3:0]  IO_IPRAD;           // Indirect port register address

  // Internal Connections
  output       IO_MDCLK;           // Internal clock, after DFT muxing
  output       IO_RESET;           // Internal reset, after DFT override


////////////////////////////////////////////////////////////////////////////////
//
// Clock muxing and reset control for test
//
////////////////////////////////////////////////////////////////////////////////
  wire IO_MDCLK_mux;
  wire tcu_clk_stop_sync;
  wire tcu_clk_stop_sync_mux;

  cl_a1_clk_mux2_8x hedwig_mdio2p_io_mux (
                                .in0(SCANCLK), 
                                .in1(MDCLK), 
                                .sel0(tcu_scan_mode), 
                                .out(IO_MDCLK_mux));

// assign IO_MDCLK_mux = tcu_scan_mode ? SCANCLK : MDCLK;

  assign IO_RESET = ~SCANEN & RESET;

  SYNC_CELL  SYNC_CELL_mdio (.D(tcu_clk_stop),.CP(IO_MDCLK_mux),.Q(tcu_clk_stop_sync));

  assign tcu_clk_stop_sync_mux =  tcu_scan_mode ? tcu_clk_stop : tcu_clk_stop_sync; 

  cl_a1_l1hdr_12x hedwig_mdio2p_io_l1 (
                        .l2clk(IO_MDCLK_mux),
                        .se(SCANEN),
                        .pce(1'b1),
                        .pce_ov(1'b0),
                        .stop(tcu_clk_stop_sync_mux),
                        .l1clk(IO_MDCLK));


////////////////////////////////////////////////////////////////////////////////
//
// General decode
// - CFG bus fields are extracted and named for clarity
// - vsmmdbase identifies LS 16 register locations, which must be readable if
//   mapped to DEVID 30 or 31 (Clause 45 only).
//
////////////////////////////////////////////////////////////////////////////////

  assign IO_CLAUSE45 = CFG[15];
  assign IO_PRTID    = CFG[14:10];
  assign IO_DEVID    = CFG[9:5];
  assign IO_BASEAD   = CFG[4:0];
  assign IO_ACRAD    = CFG[8:5];
  assign IO_IPRAD    = CFG[3:0];

endmodule
