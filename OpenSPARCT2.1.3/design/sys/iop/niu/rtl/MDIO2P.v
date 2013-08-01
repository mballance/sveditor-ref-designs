// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: MDIO2P.v
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
// Copyright (c) 2002 Texas Instruments, Inc.
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
// FUNCTION: MDIO Interface to Serial Test and Configuration Interface
//           Top Level
// COMMENTS: Allows devices on STCI scan chain to be accessed using an
//           MDIO interface.  Connects to P2STCI using SRAM like interface,
//           synchronous to MDCLK:
//
//                    ____      ____      ___
//          MDCLK ___/    \____/    \____/  
//                               _________
//             PW XXXXX_________/         XXX
//                     _________ _________
//             PA XXXXX____A1___X____A2___XXX
//                               _________
//             PR XXXXX_________/         XXX
//                               _________ 
//             PQ XXXXXXXXXXXXXXX____Q1___XXX
//                                      ___
//             PD XXXXXXXXXXXXXXXXXXXXX<D2_>X
//
//  VERSION: #VERSION#
//     DATE: #DATE#
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module MDIO2P
 (

  tcu_clk_stop,
  tcu_scan_mode,
  io_mdclk,

  RESET,
  MDCLK,
  MDIN,
  MDOUT,
  MDOE,
  CFG,
  PD,
  PW,
  PR,
  PA,
  PQ,
  SCANEN,
  SCANCLK
 );
 
////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  input        tcu_clk_stop;
  input        tcu_scan_mode;
  output       io_mdclk;           // clock after scan mux

  input        RESET;              // Global reset

  // Parallel Interface
  input[15:0]  PD;                 // Data in
  output       PW;                 // Write enable
  output       PR;                 // Read indicator
  output[9:0]  PA;                 // Address
  output[15:0] PQ;                 // Data out
 
  // MDIO Interface
  input        MDCLK;              // Clock
  input        MDIN;               // Data in
  output       MDOUT;              // Data out
  output       MDOE;               // Output enable

  // Configuration Interface
  input[15:0]  CFG;                // Configuration

  // Scan Interface
  input        SCANEN;             // Bypass MDIO2P clocks for scan
  input        SCANCLK;            // Scan clock source


////////////////////////////////////////////////////////////////////////////////
//
// Internal Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // Interface to Framer
  wire[5:0]    frmr_state;         // LFSR encoded frame state

  // Configuration
  wire         io_clause45;        // Clause45
  wire[4:0]    io_prtid;           // Port address ID
  wire[4:0]    io_devid;           // Device address ID
  wire[4:0]    io_basead;          // Base address
  wire[3:0]    io_acrad;           // AddrCtl register address
  wire[3:0]    io_iprad;           // Indirect port register address

  // Clocking and reset
  wire         io_mdclk;           // Clock
  wire         io_reset;           // Reset


////////////////////////////////////////////////////////////////////////////////
//
// Instances
//
////////////////////////////////////////////////////////////////////////////////

  MDIO2P_IO I_MDIO2P_IO
   (

    .tcu_clk_stop(tcu_clk_stop),
    .tcu_scan_mode(tcu_scan_mode),

    .RESET(RESET),
    .MDCLK(MDCLK),
    .SCANEN(SCANEN),
    .SCANCLK(SCANCLK),
    .CFG(CFG),
    .IO_MDCLK(io_mdclk),
    .IO_RESET(io_reset),
    .IO_CLAUSE45(io_clause45),
    .IO_PRTID(io_prtid),
    .IO_DEVID(io_devid),
    .IO_BASEAD(io_basead),
    .IO_ACRAD(io_acrad),
    .IO_IPRAD(io_iprad)
   );

  MDIO2P_FRMR I_MDIO2P_FRMR
   (
    .IO_MDCLK(io_mdclk),
    .IO_RESET(io_reset),
    .MDIN(MDIN),
    .FRMR_STATE(frmr_state)
   );

  MDIO2P_REGS I_MDIO2P_REGS
   (
    .MDIN(MDIN),
    .MDOUT(MDOUT),
    .MDOE(MDOE),
    .IO_MDCLK(io_mdclk),
    .IO_RESET(io_reset),
    .IO_CLAUSE45(io_clause45),
    .IO_PRTID(io_prtid),
    .IO_DEVID(io_devid),
    .IO_BASEAD(io_basead),
    .IO_ACRAD(io_acrad),
    .IO_IPRAD(io_iprad),
    .PD(PD),
    .PW(PW),
    .PR(PR),
    .PA(PA),
    .PQ(PQ),
    .FRMR_STATE(frmr_state)
   );

endmodule
