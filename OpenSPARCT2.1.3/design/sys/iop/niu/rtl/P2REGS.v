// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: P2REGS.v
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
// Copyright (c) 2004 Texas Instruments, Inc.
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
// ***********************************************************************
//
//  File: P2REGS.v
//
//  Author: Andre Szczepanek 
//
//  Purpose: Top level of Register block
//
//  Contains MDIO Register instantiations and associated R/W decode
//             
//
//  Date    Author  Changes
// -------  ------  -----------------------------------------------------
// 21May04  Andre   Created 
// 02Feb05  Andre   Add Clock inputs to allow asynchronous sticky bits 
// 
// ***********************************************************************
////////////////////////////////////////////////////////////////////////////////
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
//     WRITE_DATA XXXXXXXXXXXXXXX____Q1___XXX
//                                      ___
//      READ_DATA XXXXXXXXXXXXXXXXXXXXX<D2_>X
//
////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//
// Select Macro configuration through include files
//
////////////////////////////////////////////////////////////////////////////////

`include "make_b8_macro.v"


`timescale 1ns / 1ps

module P2REGS
 (

  RESET,
  IO_MDCLK,     // cc 093005 consolidated clock domains to single l1 header
  SCANEN,
//  SCANCLK,    // cc 093005 scan clock not needed
  WRITE_DATA,
  PW,
  PR,
  PA,
  READ_DATA,

`ifdef MAKE_REGS_TX_0
  CFGTX0,
  STSTX0,
  TXBCLKIN0,
`endif
`ifdef MAKE_REGS_TX_1
  CFGTX1,
  STSTX1,
  TXBCLKIN1,
`endif
`ifdef MAKE_REGS_TX_2
  CFGTX2,
  STSTX2,
  TXBCLKIN2,
`endif
`ifdef MAKE_REGS_TX_3
  CFGTX3,
  STSTX3,
  TXBCLKIN3,
`endif
`ifdef MAKE_REGS_TX_4
  CFGTX4,
  STSTX4,
  TXBCLKIN4,
`endif
`ifdef MAKE_REGS_TX_5
  CFGTX5,
  STSTX5,
  TXBCLKIN5,
`endif
`ifdef MAKE_REGS_TX_6
  CFGTX6,
  STSTX6,
  TXBCLKIN6,
`endif
`ifdef MAKE_REGS_TX_7
  CFGTX7,
  STSTX7,
  TXBCLKIN7,
`endif
`ifdef MAKE_REGS_RX_0
  CFGRX0,
  STSRX0,
  RXBCLKIN0,
`endif
`ifdef MAKE_REGS_RX_1
  CFGRX1,
  STSRX1,
  RXBCLKIN1,
`endif
`ifdef MAKE_REGS_RX_2
  CFGRX2,
  STSRX2,
  RXBCLKIN2,
`endif
`ifdef MAKE_REGS_RX_3
  CFGRX3,
  STSRX3,
  RXBCLKIN3,
`endif
`ifdef MAKE_REGS_RX_4
  CFGRX4,
  STSRX4,
  RXBCLKIN4,
`endif
`ifdef MAKE_REGS_RX_5
  CFGRX5,
  STSRX5,
  RXBCLKIN5,
`endif
`ifdef MAKE_REGS_RX_6
  CFGRX6,
  STSRX6,
  RXBCLKIN6,
`endif
`ifdef MAKE_REGS_RX_7
  CFGRX7,
  STSRX7,
  RXBCLKIN7,
`endif
  TESTCFG,
  CFGPLL,
  STSPLL
 );

////////////////////////////////////////////////////////////////////////////////
//
// Parameters                  
//
////////////////////////////////////////////////////////////////////////////////
 
parameter pl_cw=12;                // (default) PLL config bus width
parameter pl_cr=32'h0000_0000;     // (default) PLL config reg reset value
parameter pl_ci=32'h0000_0f3f;     // (default) PLL config reg bit instantiations

parameter pl_sw=4;                 // (default) PLL status bus width
parameter pl_sr=32'h0000_0000;     // (default) PLL status reg reset value
parameter pl_si=32'h0000_0001;     // (default) PLL status reg bit instantiations
parameter pl_ss=32'h0000_0000;     // (default) PLL status sticky reg bit locations
 
parameter te_cw=16;                // (default) TEST config bus width
parameter te_cr=32'h0000_0000;     // (default) TEST config reg reset value
parameter te_ci=32'h0000_7fff;     // (default) TEST config reg bit instantiations

parameter tx_cw=24;                // (default) TX config bus width
parameter tx_cr=32'h0000_0000;     // (default) TX config reg reset value
parameter tx_ci=32'h0073_ffff;     // (default) TX config reg bit instantiations

parameter tx_sw=4;                 // (default) TX status bus width
parameter tx_sr=32'h0000_0000;     // (default) TX status reg reset value
parameter tx_si=32'h0000_0003;     // (default) TX status reg bit instantiations
parameter tx_ss=32'h0000_0001;     // (default) TX status sticky reg bit locations
 
parameter rx_cw=28;                // (default) RX config bus width
parameter rx_cr=32'h0000_0000;     // (default) RX config reg reset value
parameter rx_ci=32'h033f_f7ff;     // (default) RX config reg bit instantiations

parameter rx_sw=12;                // (default) RX status bus width
parameter rx_sr=32'h0000_0000;     // (default) RX status reg reset value
parameter rx_si=32'h0000_0339;     // (default) RX status reg bit instantiations
parameter rx_ss=32'h0000_0001;     // (default) RX status sticky reg bit locations

//
// Note : The top ten bits of indirect address are {1'b1,BASEAD}
//
parameter pl_ra=10'h000;           // (default) PLL  register block base address
parameter te_ra=10'h004;           // (default) TEST register block base address
parameter t0_ra=10'h100;           // (default) TX_0 register block base address
parameter t1_ra=10'h104;           // (default) TX_1 register block base address
parameter t2_ra=10'h108;           // (default) TX_2 register block base address
parameter t3_ra=10'h10C;           // (default) TX_3 register block base address
parameter t4_ra=10'h110;           // (default) TX_4 register block base address
parameter t5_ra=10'h114;           // (default) TX_5 register block base address
parameter t6_ra=10'h118;           // (default) TX_6 register block base address
parameter t7_ra=10'h11C;           // (default) TX_7 register block base address
parameter r0_ra=10'h120;           // (default) RX_0 register block base address
parameter r1_ra=10'h124;           // (default) RX_1 register block base address
parameter r2_ra=10'h128;           // (default) RX_2 register block base address
parameter r3_ra=10'h12C;           // (default) RX_3 register block base address
parameter r4_ra=10'h130;           // (default) RX_4 register block base address
parameter r5_ra=10'h134;           // (default) RX_5 register block base address
parameter r6_ra=10'h138;           // (default) RX_6 register block base address
parameter r7_ra=10'h13C;           // (default) RX_7 register block base address


////////////////////////////////////////////////////////////////////////////////
//
// Port Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // MDIO Interface
  input        RESET;              // Global reset
  input        IO_MDCLK;           // Clock

  // Scan Interface
  input        SCANEN;             // Bypass P2REGS clocks for scan
// input       SCANCLK;            // Scan clock source

  // Parallel Interface
  input         PW;                // Write enable
  input         PR;                // Read indicator
  input   [9:0] PA;                // Address
  input  [15:0] WRITE_DATA;        // Data in
  output [15:0] READ_DATA;         // Data out

 
  // Interface to Macro

`ifdef MAKE_REGS_TX_0
output [tx_cw-1:0] CFGTX0;
input  [tx_sw-1:0] STSTX0;
input              TXBCLKIN0;
`endif
`ifdef MAKE_REGS_TX_1
output [tx_cw-1:0] CFGTX1;
input  [tx_sw-1:0] STSTX1;
input              TXBCLKIN1;
`endif
`ifdef MAKE_REGS_TX_2
output [tx_cw-1:0] CFGTX2;
input  [tx_sw-1:0] STSTX2;
input              TXBCLKIN2;
`endif
`ifdef MAKE_REGS_TX_3
output [tx_cw-1:0] CFGTX3;
input  [tx_sw-1:0] STSTX3;
input              TXBCLKIN3;
`endif
`ifdef MAKE_REGS_TX_4
output [tx_cw-1:0] CFGTX4;
input  [tx_sw-1:0] STSTX4;
input              TXBCLKIN4;
`endif
`ifdef MAKE_REGS_TX_5
output [tx_cw-1:0] CFGTX5;
input  [tx_sw-1:0] STSTX5;
input              TXBCLKIN5;
`endif
`ifdef MAKE_REGS_TX_6
output [tx_cw-1:0] CFGTX6;
input  [tx_sw-1:0] STSTX6;
input              TXBCLKIN6;
`endif
`ifdef MAKE_REGS_TX_7
output [tx_cw-1:0] CFGTX7;
input  [tx_sw-1:0] STSTX7;
input              TXBCLKIN7;
`endif
`ifdef MAKE_REGS_RX_0
output [rx_cw-1:0] CFGRX0;
input  [rx_sw-1:0] STSRX0;
input              RXBCLKIN0;
`endif
`ifdef MAKE_REGS_RX_1
output [rx_cw-1:0] CFGRX1;
input  [rx_sw-1:0] STSRX1;
input              RXBCLKIN1;
`endif
`ifdef MAKE_REGS_RX_2
output [rx_cw-1:0] CFGRX2;
input  [rx_sw-1:0] STSRX2;
input              RXBCLKIN2;
`endif
`ifdef MAKE_REGS_RX_3
output [rx_cw-1:0] CFGRX3;
input  [rx_sw-1:0] STSRX3;
input              RXBCLKIN3;
`endif
`ifdef MAKE_REGS_RX_4
output [rx_cw-1:0] CFGRX4;
input  [rx_sw-1:0] STSRX4;
input              RXBCLKIN4;
`endif
`ifdef MAKE_REGS_RX_5
output [rx_cw-1:0] CFGRX5;
input  [rx_sw-1:0] STSRX5;
input              RXBCLKIN5;
`endif
`ifdef MAKE_REGS_RX_6
output [rx_cw-1:0] CFGRX6;
input  [rx_sw-1:0] STSRX6;
input              RXBCLKIN6;
`endif
`ifdef MAKE_REGS_RX_7
output [rx_cw-1:0] CFGRX7;
input  [rx_sw-1:0] STSRX7;
input              RXBCLKIN7;
`endif
output [te_cw-1:0] TESTCFG;
output [pl_cw-1:0] CFGPLL;
input  [pl_sw-1:0] STSPLL;

////////////////////////////////////////////////////////////////////////////////
//
// Output Register Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

reg [15:0] READ_DATA;                 // Data out


////////////////////////////////////////////////////////////////////////////////
//
// Internal Declarations                  
//
////////////////////////////////////////////////////////////////////////////////

  // Flops

  // Combinatorials

  reg        PW_PLL ;              // Write to PLL  register block address space
  reg        PW_TEST;              // Write to TEST register block address space
  reg        PW_TX_0;              // Write to TX_0 register block address space
  reg        PW_TX_1;              // Write to TX_1 register block address space
  reg        PW_TX_2;              // Write to TX_2 register block address space
  reg        PW_TX_3;              // Write to TX_3 register block address space
  reg        PW_TX_4;              // Write to TX_4 register block address space
  reg        PW_TX_5;              // Write to TX_5 register block address space
  reg        PW_TX_6;              // Write to TX_6 register block address space
  reg        PW_TX_7;              // Write to TX_7 register block address space
  reg        PW_RX_0;              // Write to RX_0 register block address space
  reg        PW_RX_1;              // Write to RX_1 register block address space
  reg        PW_RX_2;              // Write to RX_2 register block address space
  reg        PW_RX_3;              // Write to RX_3 register block address space
  reg        PW_RX_4;              // Write to RX_4 register block address space
  reg        PW_RX_5;              // Write to RX_5 register block address space
  reg        PW_RX_6;              // Write to RX_6 register block address space
  reg        PW_RX_7;              // Write to RX_7 register block address space

  reg        PR_PLL ;              // Read to PLL  register block address space
  reg        PR_TEST;              // Read to TEST register block address space
  reg        PR_TX_0;              // Read to TX_0 register block address space
  reg        PR_TX_1;              // Read to TX_1 register block address space
  reg        PR_TX_2;              // Read to TX_2 register block address space
  reg        PR_TX_3;              // Read to TX_3 register block address space
  reg        PR_TX_4;              // Read to TX_4 register block address space
  reg        PR_TX_5;              // Read to TX_5 register block address space
  reg        PR_TX_6;              // Read to TX_6 register block address space
  reg        PR_TX_7;              // Read to TX_7 register block address space
  reg        PR_RX_0;              // Read to RX_0 register block address space
  reg        PR_RX_1;              // Read to RX_1 register block address space
  reg        PR_RX_2;              // Read to RX_2 register block address space
  reg        PR_RX_3;              // Read to RX_3 register block address space
  reg        PR_RX_4;              // Read to RX_4 register block address space
  reg        PR_RX_5;              // Read to RX_5 register block address space
  reg        PR_RX_6;              // Read to RX_6 register block address space
  reg        PR_RX_7;              // Read to RX_7 register block address space

  wire[15:0] READ_DATA_PLL ;              // PLL  register block read data
  wire[15:0] READ_DATA_TEST;              // TEST register block read data
  wire[15:0] READ_DATA_TX_0;              // TX_0 register block read data
  wire[15:0] READ_DATA_TX_1;              // TX_1 register block read data
  wire[15:0] READ_DATA_TX_2;              // TX_2 register block read data
  wire[15:0] READ_DATA_TX_3;              // TX_3 register block read data
  wire[15:0] READ_DATA_TX_4;              // TX_4 register block read data
  wire[15:0] READ_DATA_TX_5;              // TX_5 register block read data
  wire[15:0] READ_DATA_TX_6;              // TX_6 register block read data
  wire[15:0] READ_DATA_TX_7;              // TX_7 register block read data
  wire[15:0] READ_DATA_RX_0;              // RX_0 register block read data
  wire[15:0] READ_DATA_RX_1;              // RX_1 register block read data
  wire[15:0] READ_DATA_RX_2;              // RX_2 register block read data
  wire[15:0] READ_DATA_RX_3;              // RX_3 register block read data
  wire[15:0] READ_DATA_RX_4;              // RX_4 register block read data
  wire[15:0] READ_DATA_RX_5;              // RX_5 register block read data
  wire[15:0] READ_DATA_RX_6;              // RX_6 register block read data
  wire[15:0] READ_DATA_RX_7;              // RX_7 register block read data
  

////////////////////////////////////////////////////////////////////////////////
//
// Clock muxing and reset control for test
//
////////////////////////////////////////////////////////////////////////////////

  SYNC_CELL  IO_RESET_SYNC_CELL (.D(~SCANEN & RESET),.CP(IO_MDCLK),.Q(IO_RESET)); // loj@8-30-05


////////////////////////////////////////////////////////////////////////////////
//
// Write decoder
//
////////////////////////////////////////////////////////////////////////////////

always @(PA or PW)
  begin

    PW_PLL  = 1'b0;
    PW_TEST = 1'b0;
    PW_TX_0 = 1'b0;
    PW_TX_1 = 1'b0;
    PW_TX_2 = 1'b0;
    PW_TX_3 = 1'b0;
    PW_TX_4 = 1'b0;
    PW_TX_5 = 1'b0;
    PW_TX_6 = 1'b0;
    PW_TX_7 = 1'b0;
    PW_RX_0 = 1'b0;
    PW_RX_1 = 1'b0;
    PW_RX_2 = 1'b0;
    PW_RX_3 = 1'b0;
    PW_RX_4 = 1'b0;
    PW_RX_5 = 1'b0;
    PW_RX_6 = 1'b0;
    PW_RX_7 = 1'b0;

    if (PW)
      case (PA[9:2])
        (pl_ra >> 2) : PW_PLL  = 1'b1;
        (te_ra >> 2) : PW_TEST = 1'b1;
        (t0_ra >> 2) : PW_TX_0 = 1'b1;
        (t1_ra >> 2) : PW_TX_1 = 1'b1;
        (t2_ra >> 2) : PW_TX_2 = 1'b1;
        (t3_ra >> 2) : PW_TX_3 = 1'b1;
        (t4_ra >> 2) : PW_TX_4 = 1'b1;
        (t5_ra >> 2) : PW_TX_5 = 1'b1;
        (t6_ra >> 2) : PW_TX_6 = 1'b1;
        (t7_ra >> 2) : PW_TX_7 = 1'b1;
        (r0_ra >> 2) : PW_RX_0 = 1'b1;
        (r1_ra >> 2) : PW_RX_1 = 1'b1;
        (r2_ra >> 2) : PW_RX_2 = 1'b1;
        (r3_ra >> 2) : PW_RX_3 = 1'b1;
        (r4_ra >> 2) : PW_RX_4 = 1'b1;
        (r5_ra >> 2) : PW_RX_5 = 1'b1;
        (r6_ra >> 2) : PW_RX_6 = 1'b1;
        (r7_ra >> 2) : PW_RX_7 = 1'b1;
         default     : PW_PLL  = 1'b0;
       endcase
  end

////////////////////////////////////////////////////////////////////////////////
//
// Read decoder
//
////////////////////////////////////////////////////////////////////////////////

always @(PA or PR)
  begin

    PR_PLL  = 1'b0;
    PR_TEST = 1'b0;
    PR_TX_0 = 1'b0;
    PR_TX_1 = 1'b0;
    PR_TX_2 = 1'b0;
    PR_TX_3 = 1'b0;
    PR_TX_4 = 1'b0;
    PR_TX_5 = 1'b0;
    PR_TX_6 = 1'b0;
    PR_TX_7 = 1'b0;
    PR_RX_0 = 1'b0;
    PR_RX_1 = 1'b0;
    PR_RX_2 = 1'b0;
    PR_RX_3 = 1'b0;
    PR_RX_4 = 1'b0;
    PR_RX_5 = 1'b0;
    PR_RX_6 = 1'b0;
    PR_RX_7 = 1'b0;

    if (PR)
      case (PA[9:2])
        (pl_ra >> 2) : PR_PLL  = 1'b1;
        (te_ra >> 2) : PR_TEST = 1'b1;
        (t0_ra >> 2) : PR_TX_0 = 1'b1;
        (t1_ra >> 2) : PR_TX_1 = 1'b1;
        (t2_ra >> 2) : PR_TX_2 = 1'b1;
        (t3_ra >> 2) : PR_TX_3 = 1'b1;
        (t4_ra >> 2) : PR_TX_4 = 1'b1;
        (t5_ra >> 2) : PR_TX_5 = 1'b1;
        (t6_ra >> 2) : PR_TX_6 = 1'b1;
        (t7_ra >> 2) : PR_TX_7 = 1'b1;
        (r0_ra >> 2) : PR_RX_0 = 1'b1;
        (r1_ra >> 2) : PR_RX_1 = 1'b1;
        (r2_ra >> 2) : PR_RX_2 = 1'b1;
        (r3_ra >> 2) : PR_RX_3 = 1'b1;
        (r4_ra >> 2) : PR_RX_4 = 1'b1;
        (r5_ra >> 2) : PR_RX_5 = 1'b1;
        (r6_ra >> 2) : PR_RX_6 = 1'b1;
        (r7_ra >> 2) : PR_RX_7 = 1'b1;
         default     : PR_PLL  = 1'b0;
       endcase
  end


////////////////////////////////////////////////////////////////////////////////
//
// Read decoder
//
////////////////////////////////////////////////////////////////////////////////

always @(PA or READ_DATA_PLL or READ_DATA_TEST or
         READ_DATA_TX_0 or READ_DATA_TX_1 or READ_DATA_TX_2 or READ_DATA_TX_3 or 
         READ_DATA_TX_4 or READ_DATA_TX_5 or READ_DATA_TX_6 or READ_DATA_TX_7 or 
         READ_DATA_RX_0 or READ_DATA_RX_1 or READ_DATA_RX_2 or READ_DATA_RX_3 or 
         READ_DATA_RX_4 or READ_DATA_RX_5 or READ_DATA_RX_6 or READ_DATA_RX_7)
  begin
    case (PA[9:2])
      (pl_ra >> 2) : READ_DATA = READ_DATA_PLL ;
      (te_ra >> 2) : READ_DATA = READ_DATA_TEST;
      (t0_ra >> 2) : READ_DATA = READ_DATA_TX_0;
      (t1_ra >> 2) : READ_DATA = READ_DATA_TX_1;
      (t2_ra >> 2) : READ_DATA = READ_DATA_TX_2;
      (t3_ra >> 2) : READ_DATA = READ_DATA_TX_3;
      (t4_ra >> 2) : READ_DATA = READ_DATA_TX_4;
      (t5_ra >> 2) : READ_DATA = READ_DATA_TX_5;
      (t6_ra >> 2) : READ_DATA = READ_DATA_TX_6;
      (t7_ra >> 2) : READ_DATA = READ_DATA_TX_7;
      (r0_ra >> 2) : READ_DATA = READ_DATA_RX_0;
      (r1_ra >> 2) : READ_DATA = READ_DATA_RX_1;
      (r2_ra >> 2) : READ_DATA = READ_DATA_RX_2;
      (r3_ra >> 2) : READ_DATA = READ_DATA_RX_3;
      (r4_ra >> 2) : READ_DATA = READ_DATA_RX_4;
      (r5_ra >> 2) : READ_DATA = READ_DATA_RX_5;
      (r6_ra >> 2) : READ_DATA = READ_DATA_RX_6;
      (r7_ra >> 2) : READ_DATA = READ_DATA_RX_7;
       default     : READ_DATA = 16'h0000 ;
     endcase
  end


////////////////////////////////////////////////////////////////////////////////
//
// Register Block Instantiations 
//
////////////////////////////////////////////////////////////////////////////////

  P2REGS_CFG_STS  #(pl_cw,pl_cr,pl_ci,pl_sw,pl_sr,pl_si,pl_ss) I_P2REGS_CFG_STS_PLL
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (1'b0            ),
        .PW         (PW_PLL          ),
        .PR         (PR_PLL          ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_PLL   ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGPLL          ),
        .STATUS_BUS (STSPLL          )
        );

  // Note TEST interface only has a config bus - doesn't have a status bus (So tie off)
  //
  P2REGS_CFG_STS  #(te_cw,te_cr,te_ci,2,32'h0,32'h0,16'h0) I_P2REGS_CFG_STS_TEST
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (1'b0            ),
        .PW         (PW_TEST         ),
        .PR         (PR_TEST         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TEST  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (TESTCFG         ), 
        .STATUS_BUS (2'b00           ) 
        );


`ifdef MAKE_REGS_TX_0

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_0
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN0       ),
        .PW         (PW_TX_0         ),
        .PR         (PR_TX_0         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_0  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX0          ),
        .STATUS_BUS (STSTX0          )
        );
`else
assign  READ_DATA_TX_0 = 16'h0000;
`endif

`ifdef MAKE_REGS_TX_1

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_1
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN1       ),
        .PW         (PW_TX_1         ),
        .PR         (PR_TX_1         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_1  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX1          ),
        .STATUS_BUS (STSTX1          )
        );
`else
assign  READ_DATA_TX_1 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_2

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_2
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN2       ),
        .PW         (PW_TX_2         ),
        .PR         (PR_TX_2         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_2  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX2          ),
        .STATUS_BUS (STSTX2          )
        );
`else
assign  READ_DATA_TX_2 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_3

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_3
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN3       ),
        .PW         (PW_TX_3         ),
        .PR         (PR_TX_3         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_3  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX3          ),
        .STATUS_BUS (STSTX3          )
        );
`else
assign  READ_DATA_TX_3 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_4

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_4
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN4       ),
        .PW         (PW_TX_4         ),
        .PR         (PR_TX_4         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_4  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX4          ),
        .STATUS_BUS (STSTX4          )
        );
`else
assign  READ_DATA_TX_4 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_5

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_5
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN5       ),
        .PW         (PW_TX_5         ),
        .PR         (PR_TX_5         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_5  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX5          ),
        .STATUS_BUS (STSTX5          )
        );
`else
assign  READ_DATA_TX_5 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_6

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_6
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN6       ),
        .PW         (PW_TX_6         ),
        .PR         (PR_TX_6         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_6  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX6          ),
        .STATUS_BUS (STSTX6          )
        );
`else
assign  READ_DATA_TX_6 = 16'h0000;
`endif


`ifdef MAKE_REGS_TX_7

  P2REGS_CFG_STS  #(tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss) I_P2REGS_CFG_STS_TX_7
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (TXBCLKIN7       ),
        .PW         (PW_TX_7         ),
        .PR         (PR_TX_7         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_TX_7  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGTX7          ),
        .STATUS_BUS (STSTX7          )
        );
`else
assign  READ_DATA_TX_7 = 16'h0000;
`endif




`ifdef MAKE_REGS_RX_0

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_0
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN0       ),
        .PW         (PW_RX_0         ),
        .PR         (PR_RX_0         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_0  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX0          ),
        .STATUS_BUS (STSRX0          )
        );
`else
assign  READ_DATA_RX_0 = 16'h0000;
`endif

`ifdef MAKE_REGS_RX_1

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_1
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN1       ),
        .PW         (PW_RX_1         ),
        .PR         (PR_RX_1         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_1  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX1          ),
        .STATUS_BUS (STSRX1          )
        );
`else
assign  READ_DATA_RX_1 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_2

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_2
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN2       ),
        .PW         (PW_RX_2         ),
        .PR         (PR_RX_2         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_2  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX2          ),
        .STATUS_BUS (STSRX2          )
        );
`else
assign  READ_DATA_RX_2 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_3

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_3
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN3       ),
        .PW         (PW_RX_3         ),
        .PR         (PR_RX_3         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_3  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX3          ),
        .STATUS_BUS (STSRX3          )
        );
`else
assign  READ_DATA_RX_3 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_4

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_4
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN4       ),
        .PW         (PW_RX_4         ),
        .PR         (PR_RX_4         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_4  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX4          ),
        .STATUS_BUS (STSRX4          )
        );
`else
assign  READ_DATA_RX_4 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_5

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_5
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN5       ),
        .PW         (PW_RX_5         ),
        .PR         (PR_RX_5         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_5  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX5          ),
        .STATUS_BUS (STSRX5          )
        );
`else
assign  READ_DATA_RX_5 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_6

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_6
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN6       ),
        .PW         (PW_RX_6         ),
        .PR         (PR_RX_6         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_6  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX6          ),
        .STATUS_BUS (STSRX6          )
        );
`else
assign  READ_DATA_RX_6 = 16'h0000;
`endif


`ifdef MAKE_REGS_RX_7

  P2REGS_CFG_STS  #(rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss) I_P2REGS_CFG_STS_RX_7
        (
        .RESET      (IO_RESET        ),
        .MDCLK      (IO_MDCLK        ),
        .WDCLK      (RXBCLKIN7       ),
        .PW         (PW_RX_7         ),
        .PR         (PR_RX_7         ),
        .PA         (PA[1:0]         ),
        .READ_DATA  (READ_DATA_RX_7  ),
        .WRITE_DATA (WRITE_DATA      ),
        .CONFIG_BUS (CFGRX7          ),
        .STATUS_BUS (STSRX7          )
        );
`else
assign  READ_DATA_RX_7 = 16'h0000;
`endif



endmodule
