// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: serdes_wrapper.v
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
module serdes_wrapper ( 
  BSINITCLK,
  CFGPLL,
  CFGRX0,
  CFGRX1,
  CFGRX2,
  CFGRX3,
  CFGTX0,
  CFGTX1,
  CFGTX2,
  CFGTX3,
  FCLK,
  FCLRZ,
  FDI,
  REFCLKN,
  REFCLKP,
  RXBCLKIN,
  RXN0,
  RXN1,
  RXN2,
  RXN3,
  RXP0,
  RXP1,
  RXP2,
  RXP3,
  STCICFG,
  STCICLK,
  STCID,
  TD0,
  TD1,
  TD2,
  TD3,
  TESTCFG,
  TESTCLKR,
  TESTCLKT,
  TXBCLKIN,
  AMUX,
  FDO,
  RD0,
  RD1,
  RD2,
  RD3,
  RDLL0,
  RDLL1,
  RDLL2,
  RDLL3,
  RXBCLK,
  RXBCLKLLN,
  RXBCLKLLP,
  STCIQ,
  STSPLL,
  STSRX0,
  STSRX1,
  STSRX2,
  STSRX3,
  STSTX0,
  STSTX1,
  STSTX2,
  STSTX3,
  TXBCLK,
  TXN0,
  TXN1,
  TXN2,
  TXN3,
  TXP0,
  TXP1,
  TXP2,
  TXP3
 );

  input  BSINITCLK;
  input  [11:0] CFGPLL;
  input  [27:0] CFGRX0;
  input  [27:0] CFGRX1;
  input  [27:0] CFGRX2;
  input  [27:0] CFGRX3;
  input  [19:0] CFGTX0;
  input  [19:0] CFGTX1;
  input  [19:0] CFGTX2;
  input  [19:0] CFGTX3;
  input  FCLK;
  input  FCLRZ;
  input  FDI;
  input  REFCLKN;
  input  REFCLKP;
  input  [3:0] RXBCLKIN;
  input  RXN0;
  input  RXN1;
  input  RXN2;
  input  RXN3;
  input  RXP0;
  input  RXP1;
  input  RXP2;
  input  RXP3;
  input  [1:0] STCICFG;
  input  STCICLK;
  input  STCID;
  input  [9:0] TD0;
  input  [9:0] TD1;
  input  [9:0] TD2;
  input  [9:0] TD3;
  input  [19:0] TESTCFG;
  input  TESTCLKR;
  input  TESTCLKT;
  input  [3:0] TXBCLKIN;
  output AMUX;
  output FDO;
  output [9:0] RD0;
  output [9:0] RD1;
  output [9:0] RD2;
  output [9:0] RD3;
  output [1:0] RDLL0;
  output [1:0] RDLL1;
  output [1:0] RDLL2;
  output [1:0] RDLL3;
  output [3:0] RXBCLK;
  output [3:0] RXBCLKLLN;
  output [3:0] RXBCLKLLP;
  output STCIQ;
  output [3:0] STSPLL;
  output [7:0] STSRX0;
  output [7:0] STSRX1;
  output [7:0] STSRX2;
  output [7:0] STSRX3;
  output [3:0] STSTX0;
  output [3:0] STSTX1;
  output [3:0] STSTX2;
  output [3:0] STSTX3;
  output [3:0] TXBCLK;
  output TXN0;
  output TXN1;
  output TXN2;
  output TXN3;
  output TXP0;
  output TXP1;
  output TXP2;
  output TXP3;
wire	   xaui_clk;
clock_multiplier_10x clock_multiplier_10x  (tb_top.cpu.XAUI0_REFCLK_P, xaui_clk);
xaui_port xaui0 (
        .XAUI_RX_N      ({RXN3,RXN2,RXN1,RXN0}),
        .XAUI_RX_P      ({RXP3,RXP2,RXP1,RXP0}),
        .XAUI_AMUX      (AMUX),
        .XAUI_TX_N      ({TXN3,TXN2,TXN1,TXN0}),
        .XAUI_TX_P      ({TXP3,TXP2,TXP1,TXP0}),
        .esr_mac_rxd0   (RD0),
        .esr_mac_rxd1   (RD1),
        .esr_mac_rxd2   (RD2),
        .esr_mac_rxd3   (RD3),
        .mac_esr_txd0   (TD0),
        .mac_esr_txd1   (TD1),
        .mac_esr_txd2   (TD2),
        .mac_esr_txd3   (TD3),
        .xaui_clk       (xaui_clk),
        .mac_clk        (tb_top.cpu.XAUI0_REFCLK_P),
        .reset          (~tb_top.cpu.n2_clk_gl_cust.gl_rst_mac_c1b)    );

endmodule
