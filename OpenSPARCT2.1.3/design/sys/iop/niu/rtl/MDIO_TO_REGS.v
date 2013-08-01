// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: MDIO_TO_REGS.v
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
//////////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////
// ***********************************************************************
//
//  File: MDIO_TO_REGS.v
//
//  Author: Andre Szczepanek 
//
//  Purpose: MDIO Interface to SERDES CFG & STS buses top level block
// 
//  Instantiates "Hedwig" MDIO framer and a configurable register block
//             
//
//  Date    Author  Changes
// -------  ------  -----------------------------------------------------
// 21May04  Andre   Created 
// 
// ***********************************************************************
/// synopsys translate_off
//// synopsys translate_on

         
// switches to turn off verilint checks that prove OK
//verilint 446 off
//verilint 484 off
//verilint 257 off
//verilint 280 off
//verilint 531 off
//verilint 570 off
//verilint 549 off
//verilint 257 off
//verilint 280 off
//verilint 389 off
//verilint 530 off
//verilint 396 off
//verilint 542 off
//verilint  69 off
//verilint 550 off
//verilint 341 off


//////////////////////////////////////////////////////////////////////////////////
//
// Use include file to configure macro selection
//
`include "make_b8_macro.v"


`timescale 1ns / 1ps

module MDIO_TO_REGS
 (

  io_mdclk,
  tcu_clk_stop,
  tcu_scan_mode,

  RESET,
  MDCLK,
  MDIN,
  MDOUT,
  MDOE,
  CFG,
  
  SCANEN,
  SCANCLK,
 
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
parameter pl_cr=32'h0000_000B;     // (default) PLL config reg reset value // loj POR 10G. MPY = 4'b0101 ENPLL =1
parameter pl_ci=32'h0000_0f3f;     // (default) PLL config reg bit instantiations

parameter pl_sw=4;                 // (default) PLL status bus width
parameter pl_sr=32'h0000_0000;     // (default) PLL status reg reset value
parameter pl_si=32'h0000_0001;     // (default) PLL status reg bit instantiations
parameter pl_ss=32'h0000_0000;     // (default) PLL status sticky reg bit locations
 
parameter te_cw=16;                // (default) TEST config bus width
parameter te_cr=32'h0000_0000;     // (default) TEST config reg reset value
parameter te_ci=32'h0000_7fff;     // (default) TEST config reg bit instantiations

parameter tx_cw=20; // loj 24->20  // (default) TX config bus width
parameter tx_cr=32'h0000_0001;     // (default) TX config reg reset value // loj @8-30-05 ENTX[0]<=1
parameter tx_ci=32'h0073_ffff;     // (default) TX config reg bit instantiations

parameter tx_sw=4;                 // (default) TX status bus width
parameter tx_sr=32'h0000_0000;     // (default) TX status reg reset value
parameter tx_si=32'h0000_0003;     // (default) TX status reg bit instantiations
parameter tx_ss=32'h0000_0001;     // (default) PLL status sticky reg bit locations
 
parameter rx_cw=28;                // (default) RX config bus width
parameter rx_cr=32'h0000_0101;     // (default) RX config reg reset value // loj @8-30-05,TERM[10:8]<= 001(AC coupling), ENRX[0]<=1
parameter rx_ci=32'h033f_f7ff;     // (default) RX config reg bit instantiations

parameter rx_sw=8 ; // loj 12->8   // (default) RX status bus width
parameter rx_sr=32'h0000_0000;     // (default) RX status reg reset value
parameter rx_si=32'h0000_0339;     // (default) RX status reg bit instantiations
parameter rx_ss=32'h0000_0001;     // (default) PLL status sticky reg bit locations


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

  output      io_mdclk;
  input       tcu_clk_stop;
  input       tcu_scan_mode;

  // MDIO Interface
  input        RESET;              // Reset
  input        MDCLK;              // Clock
  input        MDIN;               // Data in
  output       MDOUT;              // Data out
  output       MDOE;               // Output enable

  // Configuration Interface
  input[15:0]  CFG;                // Configuration

  // Scan Interface
  input        SCANEN;             // Bypass MDIO2P clocks for scan
  input        SCANCLK;            // Scan clock source


 
  // Interface to Macro CFG & STS buses

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
// Internal signals                  
//
////////////////////////////////////////////////////////////////////////////////

  // Parallel Interface
  wire       PW;                 // Write enable
  wire       PR;                 // Read indicator
  wire[9:0]  PA;                 // Address
  wire[15:0] WRITE_DATA;         // Data to be written to registers
  wire[15:0] READ_DATA;          // Data read out of registers


//
// Note the PD<>PQ swap below.
//
// The Hedwig Framer has an SRAM-like interface, but uses SRAM device directions on its own ports !
// Ie provides data on PQ and expects data on PD. 
//
// The P2REGS block expects to be read written as an SRAM, hence the swap
//

MDIO2P  I_MDIO2P
        (

        .io_mdclk       (io_mdclk),
        .tcu_clk_stop   (tcu_clk_stop),
        .tcu_scan_mode  (tcu_scan_mode),

	.RESET   (RESET      ),
	.MDCLK   (MDCLK      ),
	.MDIN    (MDIN       ),
	.MDOUT   (MDOUT      ),
	.MDOE    (MDOE       ),
	.CFG     (CFG        ),
	.PD      (READ_DATA  ),
	.PW      (PW         ),
	.PR      (PR         ),
	.PA      (PA         ),
	.PQ      (WRITE_DATA ),
	.SCANEN  (SCANEN     ),
	.SCANCLK (SCANCLK    )
        );

P2REGS  #(pl_cw,pl_cr,pl_ci,pl_sw,pl_sr,pl_si,pl_ss,
          te_cw,te_cr,te_ci,
          tx_cw,tx_cr,tx_ci,tx_sw,tx_sr,tx_si,tx_ss,
          rx_cw,rx_cr,rx_ci,rx_sw,rx_sr,rx_si,rx_ss,
          pl_ra,te_ra,
          t0_ra,t1_ra,t2_ra,t3_ra,t4_ra,t5_ra,t6_ra,t7_ra,
          r0_ra,r1_ra,r2_ra,r3_ra,r4_ra,r5_ra,r6_ra,r7_ra)
        I_P2REGS 
        (

        .RESET            (RESET           ),  
        .IO_MDCLK         (io_mdclk        ),  // cc 093005 consolidated clock domains to single l1 header
	.SCANEN           (SCANEN          ),
// 	.SCANCLK          (SCANCLK         ),  // cc 093005 not needed
        .PW               (PW              ),
        .PR               (PR              ),
        .PA               (PA              ),
        .READ_DATA        (READ_DATA       ),
        .WRITE_DATA       (WRITE_DATA      ),
        //
     `ifdef MAKE_REGS_TX_0
        .CFGTX0  (CFGTX0 ),
        .STSTX0  (STSTX0 ),
        .TXBCLKIN0 (TXBCLKIN0 ),
     `endif  
                   
     `ifdef MAKE_REGS_TX_1  
        .CFGTX1  (CFGTX1 ),
        .STSTX1  (STSTX1 ),
        .TXBCLKIN1 (TXBCLKIN1 ),
     `endif
     
     `ifdef MAKE_REGS_TX_2
        .CFGTX2  (CFGTX2 ),
        .STSTX2  (STSTX2 ),
        .TXBCLKIN2 (TXBCLKIN2 ),
     `endif
     
     `ifdef MAKE_REGS_TX_3
        .CFGTX3  (CFGTX3 ),
        .STSTX3  (STSTX3 ),
        .TXBCLKIN3 (TXBCLKIN3 ),
     `endif
     
     `ifdef MAKE_REGS_TX_4
        .CFGTX4  (CFGTX4 ),
        .STSTX4  (STSTX4 ),
        .TXBCLKIN4 (TXBCLKIN4 ),
     `endif
     
     `ifdef MAKE_REGS_TX_5
        .CFGTX5  (CFGTX5 ),
        .STSTX5  (STSTX5 ),
        .TXBCLKIN5 (TXBCLKIN5 ),
     `endif
     
     `ifdef MAKE_REGS_TX_6
        .CFGTX6  (CFGTX6 ),
        .STSTX6  (STSTX6 ),
        .TXBCLKIN6 (TXBCLKIN6 ),
     `endif
     
     `ifdef MAKE_REGS_TX_7
        .CFGTX7  (CFGTX7 ),
        .STSTX7  (STSTX7 ),
        .TXBCLKIN7 (TXBCLKIN7 ),
     `endif
     
     `ifdef MAKE_REGS_RX_0
        .CFGRX0  (CFGRX0 ),
        .STSRX0  (STSRX0 ),
        .RXBCLKIN0 (RXBCLKIN0 ),
     `endif
 
     `ifdef MAKE_REGS_RX_1
	.CFGRX1  (CFGRX1 ),
        .STSRX1  (STSRX1 ),
        .RXBCLKIN1 (RXBCLKIN1 ),
     `endif
 
     `ifdef MAKE_REGS_RX_2
        .CFGRX2  (CFGRX2 ),
        .STSRX2  (STSRX2 ),
        .RXBCLKIN2 (RXBCLKIN2 ),
     `endif
 
     `ifdef MAKE_REGS_RX_3
        .CFGRX3  (CFGRX3 ),
        .STSRX3  (STSRX3 ),
        .RXBCLKIN3 (RXBCLKIN3 ),
     `endif
 
     `ifdef MAKE_REGS_RX_4
        .CFGRX4  (CFGRX4 ),
        .STSRX4  (STSRX4 ),
        .RXBCLKIN4 (RXBCLKIN4 ),
     `endif
 
     `ifdef MAKE_REGS_RX_5
         CFGRX5  (CFGRX5 ),
         STSRX5  (STSRX5 ),
        .RXBCLKIN5 (RXBCLKIN5 ),
     `endif
 
     `ifdef MAKE_REGS_RX_6
        .CFGRX6  (CFGRX6 ),
        .STSRX6  (STSRX6 ),
        .RXBCLKIN6 (RXBCLKIN6 ),
     `endif
 
     `ifdef MAKE_REGS_RX_7
        .CFGRX7  (CFGRX7 ),
        .STSRX7  (STSRX7 ),
        .RXBCLKIN7 (RXBCLKIN7 ),
     `endif
     
        .TESTCFG  (TESTCFG ),
        .CFGPLL   (CFGPLL  ),
        .STSPLL   (STSPLL  )
        );

                                     

endmodule
