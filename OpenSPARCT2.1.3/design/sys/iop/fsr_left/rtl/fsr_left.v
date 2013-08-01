// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fsr_left.v
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
module fsr_left
   (fsr0_mcu0_rd0,
    fsr0_mcu0_rd1,
    fsr0_mcu0_rd2,
    fsr0_mcu0_rd3,
    fsr0_mcu0_rd4,
    fsr0_mcu0_rd5,
    fsr0_mcu0_rd6,
    fsr0_mcu0_rd7,
    fsr0_mcu0_rd8,
    fsr0_mcu0_rd9,
    fsr0_mcu0_rd10,
    fsr0_mcu0_rd11,
    fsr0_mcu0_rd12,
    fsr0_mcu0_rd13,
    fsr0_mcu0_ststx_testfail,
    fsr0_mcu0_stspll_lock,
    fsr0_mcu0_stsrx_testfail,
    fsr0_mcu0_stsrx_sync,
    fsr0_mcu0_stsrx_losdtct,
    fsr0_mcu0_stsrx_bsrxp,
    fsr0_mcu0_stsrx_bsrxn,
    fsr0_mcu0_rxbclk,
    FBDIMM0A_TX_N, 
    FBDIMM0A_TX_P,
    FBDIMM0A_AMUX,
    fsr0_fdo,
    fsr0_stciq,
    mcu0_fsr0_cfgpll0,
    mcu0_fsr0_cfgpll1,
    mcu0_fsr0_cfgpll2,
    mcu0_fsr0_cfgrx0,
    mcu0_fsr0_cfgrx1,
    mcu0_fsr0_cfgrx2,
    mcu0_fsr0_cfgrx3,
    mcu0_fsr0_cfgrx4,
    mcu0_fsr0_cfgrx5,
    mcu0_fsr0_cfgrx6,
    mcu0_fsr0_cfgrx7,
    mcu0_fsr0_cfgrx8,
    mcu0_fsr0_cfgrx9,
    mcu0_fsr0_cfgrx10,
    mcu0_fsr0_cfgrx11,
    mcu0_fsr0_cfgrx12,
    mcu0_fsr0_cfgrx13,
    mcu0_fsr0_cfgtx0,
    mcu0_fsr0_cfgtx1,
    mcu0_fsr0_cfgtx2,
    mcu0_fsr0_cfgtx3,
    mcu0_fsr0_cfgtx4,
    mcu0_fsr0_cfgtx5,
    mcu0_fsr0_cfgtx6,
    mcu0_fsr0_cfgtx7,
    mcu0_fsr0_cfgtx8,
    mcu0_fsr0_cfgtx9,
    mcu0_fsr0_testcfg0,
    mcu0_fsr0_testcfg1,
    mcu0_fsr0_testcfg2,
    mcu0_fsr0_td0,
    mcu0_fsr0_td1,
    mcu0_fsr0_td2,
    mcu0_fsr0_td3,
    mcu0_fsr0_td4,
    mcu0_fsr0_td5,
    mcu0_fsr0_td6,
    mcu0_fsr0_td7,
    mcu0_fsr0_td8,
    mcu0_fsr0_td9,
    fsr0_stcicfg,
    fsr0_txbclkin,
    fsr0_rxbclkin,
    fsr0_bsinitclk, 
    fsr0_fclk, 
    fsr0_fclrz, 
    fsr0_fdi, 
    FBDIMM0A_RX_N, 
    FBDIMM0A_RX_P, 
    fsr0_stciclk, 
    fsr0_stcid, 
    fsr0_testclkr, 
    fsr0_testclkt,
    fsr1_mcu0_rd0,
    fsr1_mcu0_rd1,
    fsr1_mcu0_rd2,
    fsr1_mcu0_rd3,
    fsr1_mcu0_rd4,
    fsr1_mcu0_rd5,
    fsr1_mcu0_rd6,
    fsr1_mcu0_rd7,
    fsr1_mcu0_rd8,
    fsr1_mcu0_rd9,
    fsr1_mcu0_rd10,
    fsr1_mcu0_rd11,
    fsr1_mcu0_rd12,
    fsr1_mcu0_rd13,
    fsr1_mcu0_ststx_testfail,
    fsr1_mcu0_stspll_lock,
    fsr1_mcu0_stsrx_testfail,
    fsr1_mcu0_stsrx_sync,
    fsr1_mcu0_stsrx_losdtct,
    fsr1_mcu0_stsrx_bsrxp,
    fsr1_mcu0_stsrx_bsrxn,
    fsr1_mcu0_rxbclk,
    FBDIMM0B_TX_N, 
    FBDIMM0B_TX_P,
    FBDIMM0B_AMUX,
    fsr1_fdo,
    fsr1_stciq, 
    mcu0_fsr1_cfgpll0,
    mcu0_fsr1_cfgpll1,
    mcu0_fsr1_cfgpll2,
    mcu0_fsr1_cfgrx0,
    mcu0_fsr1_cfgrx1,
    mcu0_fsr1_cfgrx2,
    mcu0_fsr1_cfgrx3,
    mcu0_fsr1_cfgrx4,
    mcu0_fsr1_cfgrx5,
    mcu0_fsr1_cfgrx6,
    mcu0_fsr1_cfgrx7,
    mcu0_fsr1_cfgrx8,
    mcu0_fsr1_cfgrx9,
    mcu0_fsr1_cfgrx10,
    mcu0_fsr1_cfgrx11,
    mcu0_fsr1_cfgrx12,
    mcu0_fsr1_cfgrx13,
    mcu0_fsr1_cfgtx0,
    mcu0_fsr1_cfgtx1,
    mcu0_fsr1_cfgtx2,
    mcu0_fsr1_cfgtx3,
    mcu0_fsr1_cfgtx4,
    mcu0_fsr1_cfgtx5,
    mcu0_fsr1_cfgtx6,
    mcu0_fsr1_cfgtx7,
    mcu0_fsr1_cfgtx8,
    mcu0_fsr1_cfgtx9,
    mcu0_fsr1_testcfg0,
    mcu0_fsr1_testcfg1,
    mcu0_fsr1_testcfg2,
    mcu0_fsr1_td0,
    mcu0_fsr1_td1,
    mcu0_fsr1_td2,
    mcu0_fsr1_td3,
    mcu0_fsr1_td4,
    mcu0_fsr1_td5,
    mcu0_fsr1_td6,
    mcu0_fsr1_td7,
    mcu0_fsr1_td8,
    mcu0_fsr1_td9,
    fsr1_stcicfg,
    fsr1_txbclkin,
    fsr1_rxbclkin,
    fsr1_bsinitclk, 
    fsr1_fclk, 
    fsr1_fclrz, 
    fsr1_fdi, 
    FBDIMM0B_RX_N, 
    FBDIMM0B_RX_P, 
    fsr1_stciclk, 
    fsr1_stcid, 
    fsr1_testclkr, 
    fsr1_testclkt,
    fsr2_mcu1_rd0,
    fsr2_mcu1_rd1,
    fsr2_mcu1_rd2,
    fsr2_mcu1_rd3,
    fsr2_mcu1_rd4,
    fsr2_mcu1_rd5,
    fsr2_mcu1_rd6,
    fsr2_mcu1_rd7,
    fsr2_mcu1_rd8,
    fsr2_mcu1_rd9,
    fsr2_mcu1_rd10,
    fsr2_mcu1_rd11,
    fsr2_mcu1_rd12,
    fsr2_mcu1_rd13,
    fsr2_mcu1_ststx_testfail,
    fsr2_mcu1_stspll_lock,
    fsr2_mcu1_stsrx_testfail,
    fsr2_mcu1_stsrx_sync,
    fsr2_mcu1_stsrx_losdtct,
    fsr2_mcu1_stsrx_bsrxp,
    fsr2_mcu1_stsrx_bsrxn,
    fsr2_mcu1_rxbclk,
    FBDIMM1A_TX_N, 
    FBDIMM1A_TX_P,
    FBDIMM1A_AMUX,
    fsr2_fdo,
    fsr2_stciq,
    mcu1_fsr2_cfgpll0,
    mcu1_fsr2_cfgpll1,
    mcu1_fsr2_cfgpll2,
    mcu1_fsr2_cfgrx0,
    mcu1_fsr2_cfgrx1,
    mcu1_fsr2_cfgrx2,
    mcu1_fsr2_cfgrx3,
    mcu1_fsr2_cfgrx4,
    mcu1_fsr2_cfgrx5,
    mcu1_fsr2_cfgrx6,
    mcu1_fsr2_cfgrx7,
    mcu1_fsr2_cfgrx8,
    mcu1_fsr2_cfgrx9,
    mcu1_fsr2_cfgrx10,
    mcu1_fsr2_cfgrx11,
    mcu1_fsr2_cfgrx12,
    mcu1_fsr2_cfgrx13,
    mcu1_fsr2_cfgtx0,
    mcu1_fsr2_cfgtx1,
    mcu1_fsr2_cfgtx2,
    mcu1_fsr2_cfgtx3,
    mcu1_fsr2_cfgtx4,
    mcu1_fsr2_cfgtx5,
    mcu1_fsr2_cfgtx6,
    mcu1_fsr2_cfgtx7,
    mcu1_fsr2_cfgtx8,
    mcu1_fsr2_cfgtx9,
    mcu1_fsr2_testcfg0,
    mcu1_fsr2_testcfg1,
    mcu1_fsr2_testcfg2,
    mcu1_fsr2_td0,
    mcu1_fsr2_td1,
    mcu1_fsr2_td2,
    mcu1_fsr2_td3,
    mcu1_fsr2_td4,
    mcu1_fsr2_td5,
    mcu1_fsr2_td6,
    mcu1_fsr2_td7,
    mcu1_fsr2_td8,
    mcu1_fsr2_td9,
    fsr2_stcicfg,
    fsr2_txbclkin,
    fsr2_rxbclkin,
    fsr2_bsinitclk, 
    fsr2_fclk, 
    fsr2_fclrz, 
    fsr2_fdi, 
    FBDIMM1A_RX_N, 
    FBDIMM1A_RX_P, 
    fsr2_stciclk, 
    fsr2_stcid, 
    fsr2_testclkr, 
    fsr2_testclkt,
    fsr3_mcu1_rd0,
    fsr3_mcu1_rd1,
    fsr3_mcu1_rd2,
    fsr3_mcu1_rd3,
    fsr3_mcu1_rd4,
    fsr3_mcu1_rd5,
    fsr3_mcu1_rd6,
    fsr3_mcu1_rd7,
    fsr3_mcu1_rd8,
    fsr3_mcu1_rd9,
    fsr3_mcu1_rd10,
    fsr3_mcu1_rd11,
    fsr3_mcu1_rd12,
    fsr3_mcu1_rd13,
    fsr3_mcu1_ststx_testfail,
    fsr3_mcu1_stspll_lock,
    fsr3_mcu1_stsrx_testfail,
    fsr3_mcu1_stsrx_sync,
    fsr3_mcu1_stsrx_losdtct,
    fsr3_mcu1_stsrx_bsrxp,
    fsr3_mcu1_stsrx_bsrxn,
    fsr3_mcu1_rxbclk,
    FBDIMM1B_TX_N, 
    FBDIMM1B_TX_P,
    FBDIMM1B_AMUX,
    fsr3_fdo,
    fsr3_stciq, 
    mcu1_fsr3_cfgpll0,
    mcu1_fsr3_cfgpll1,
    mcu1_fsr3_cfgpll2,
    mcu1_fsr3_cfgrx0,
    mcu1_fsr3_cfgrx1,
    mcu1_fsr3_cfgrx2,
    mcu1_fsr3_cfgrx3,
    mcu1_fsr3_cfgrx4,
    mcu1_fsr3_cfgrx5,
    mcu1_fsr3_cfgrx6,
    mcu1_fsr3_cfgrx7,
    mcu1_fsr3_cfgrx8,
    mcu1_fsr3_cfgrx9,
    mcu1_fsr3_cfgrx10,
    mcu1_fsr3_cfgrx11,
    mcu1_fsr3_cfgrx12,
    mcu1_fsr3_cfgrx13,
    mcu1_fsr3_cfgtx0,
    mcu1_fsr3_cfgtx1,
    mcu1_fsr3_cfgtx2,
    mcu1_fsr3_cfgtx3,
    mcu1_fsr3_cfgtx4,
    mcu1_fsr3_cfgtx5,
    mcu1_fsr3_cfgtx6,
    mcu1_fsr3_cfgtx7,
    mcu1_fsr3_cfgtx8,
    mcu1_fsr3_cfgtx9,
    mcu1_fsr3_testcfg0,
    mcu1_fsr3_testcfg1,
    mcu1_fsr3_testcfg2,
    mcu1_fsr3_td0,
    mcu1_fsr3_td1,
    mcu1_fsr3_td2,
    mcu1_fsr3_td3,
    mcu1_fsr3_td4,
    mcu1_fsr3_td5,
    mcu1_fsr3_td6,
    mcu1_fsr3_td7,
    mcu1_fsr3_td8,
    mcu1_fsr3_td9,
    fsr3_stcicfg,
    fsr3_txbclkin,
    fsr3_rxbclkin,
    fsr3_bsinitclk, 
    fsr3_fclk, 
    fsr3_fclrz, 
    fsr3_fdi, 
    FBDIMM1B_RX_N, 
    FBDIMM1B_RX_P, 
    fsr3_stciclk, 
    fsr3_stcid, 
    fsr3_testclkr, 
    fsr3_testclkt,
    fsr_left_atpgd,
    fsr_left_atpgq,
    FBDIMM1_REFCLK_N, 
    FBDIMM1_REFCLK_P,
    VDDA,
    VDDD,
    VDDR,
    VDDT,
    VSSA);
   
   output [11:0]  fsr0_mcu0_rd0;
   output [11:0]  fsr0_mcu0_rd1;
   output [11:0]  fsr0_mcu0_rd2;
   output [11:0]  fsr0_mcu0_rd3;
   output [11:0]  fsr0_mcu0_rd4;
   output [11:0]  fsr0_mcu0_rd5;
   output [11:0]  fsr0_mcu0_rd6;
   output [11:0]  fsr0_mcu0_rd7;
   output [11:0]  fsr0_mcu0_rd8;
   output [11:0]  fsr0_mcu0_rd9;
   output [11:0]  fsr0_mcu0_rd10;
   output [11:0]  fsr0_mcu0_rd11;
   output [11:0]  fsr0_mcu0_rd12;
   output [11:0]  fsr0_mcu0_rd13;
   output [2:0]   fsr0_mcu0_stspll_lock;
   output [13:0]  fsr0_mcu0_stsrx_testfail;
   output [13:0]  fsr0_mcu0_stsrx_sync;
   output [13:0]  fsr0_mcu0_stsrx_losdtct;
   output [13:0]  fsr0_mcu0_stsrx_bsrxp;
   output [13:0]  fsr0_mcu0_stsrx_bsrxn;
   output [9:0]   fsr0_mcu0_ststx_testfail;
   output [13:0]  fsr0_mcu0_rxbclk;
   output [9:0]   FBDIMM0A_TX_N; 
   output [9:0]   FBDIMM0A_TX_P;
   output [2:0]   FBDIMM0A_AMUX;
   output [2:0]	  fsr0_fdo;
   output [2:0]	  fsr0_stciq; 
   
   input [6:0]	  mcu0_fsr0_cfgpll0;
   input [6:0]	  mcu0_fsr0_cfgpll1;
   input [6:0]	  mcu0_fsr0_cfgpll2;
   input [19:0]   mcu0_fsr0_cfgrx0;
   input [19:0]	  mcu0_fsr0_cfgrx1;
   input [19:0]	  mcu0_fsr0_cfgrx2;
   input [19:0]	  mcu0_fsr0_cfgrx3;
   input [19:0]	  mcu0_fsr0_cfgrx4;
   input [19:0]   mcu0_fsr0_cfgrx5;
   input [19:0]	  mcu0_fsr0_cfgrx6;
   input [19:0]	  mcu0_fsr0_cfgrx7;
   input [19:0]	  mcu0_fsr0_cfgrx8;
   input [19:0]	  mcu0_fsr0_cfgrx9;
   input [19:0]	  mcu0_fsr0_cfgrx10;
   input [19:0]	  mcu0_fsr0_cfgrx11;
   input [19:0]	  mcu0_fsr0_cfgrx12;
   input [19:0]	  mcu0_fsr0_cfgrx13;
   input [15:0]	  mcu0_fsr0_cfgtx0;
   input [15:0]	  mcu0_fsr0_cfgtx1;
   input [15:0]	  mcu0_fsr0_cfgtx2;
   input [15:0]	  mcu0_fsr0_cfgtx3;
   input [15:0]	  mcu0_fsr0_cfgtx4;
   input [15:0]	  mcu0_fsr0_cfgtx5;
   input [15:0]	  mcu0_fsr0_cfgtx6;
   input [15:0]	  mcu0_fsr0_cfgtx7;
   input [15:0]	  mcu0_fsr0_cfgtx8;
   input [15:0]	  mcu0_fsr0_cfgtx9;
   input [17:0]	  mcu0_fsr0_testcfg0;
   input [17:0]	  mcu0_fsr0_testcfg1;
   input [17:0]	  mcu0_fsr0_testcfg2;
   input [11:0]   mcu0_fsr0_td0;
   input [11:0]   mcu0_fsr0_td1;
   input [11:0]   mcu0_fsr0_td2;
   input [11:0]   mcu0_fsr0_td3;
   input [11:0]   mcu0_fsr0_td4;
   input [11:0]   mcu0_fsr0_td5;
   input [11:0]   mcu0_fsr0_td6;
   input [11:0]   mcu0_fsr0_td7;
   input [11:0]   mcu0_fsr0_td8;
   input [11:0]   mcu0_fsr0_td9;
   input [5:0] 	  fsr0_stcicfg;
   input [2:0]	  fsr0_txbclkin;
   input [13:0]	  fsr0_rxbclkin;
   input [2:0]	  fsr0_bsinitclk; 
   input [2:0]	  fsr0_fclk; 
   input [2:0]	  fsr0_fclrz; 
   input [2:0]	  fsr0_fdi; 
   input [13:0]   FBDIMM0A_RX_N; 
   input [13:0]   FBDIMM0A_RX_P; 
   input [2:0]	  fsr0_stciclk; 
   input [2:0]	  fsr0_stcid; 
   input [2:0]	  fsr0_testclkr; 
   input [2:0]	  fsr0_testclkt;

   output [11:0]  fsr1_mcu0_rd0;
   output [11:0]  fsr1_mcu0_rd1;
   output [11:0]  fsr1_mcu0_rd2;
   output [11:0]  fsr1_mcu0_rd3;
   output [11:0]  fsr1_mcu0_rd4;
   output [11:0]  fsr1_mcu0_rd5;
   output [11:0]  fsr1_mcu0_rd6;
   output [11:0]  fsr1_mcu0_rd7;
   output [11:0]  fsr1_mcu0_rd8;
   output [11:0]  fsr1_mcu0_rd9;
   output [11:0]  fsr1_mcu0_rd10;
   output [11:0]  fsr1_mcu0_rd11;
   output [11:0]  fsr1_mcu0_rd12;
   output [11:0]  fsr1_mcu0_rd13;
   output [2:0]   fsr1_mcu0_stspll_lock;
   output [13:0]  fsr1_mcu0_stsrx_testfail;
   output [13:0]  fsr1_mcu0_stsrx_sync;
   output [13:0]  fsr1_mcu0_stsrx_losdtct;
   output [13:0]  fsr1_mcu0_stsrx_bsrxp;
   output [13:0]  fsr1_mcu0_stsrx_bsrxn;
   output [9:0]   fsr1_mcu0_ststx_testfail;
   output [13:0]  fsr1_mcu0_rxbclk;
   output [9:0]   FBDIMM0B_TX_N; 
   output [9:0]   FBDIMM0B_TX_P;
   output [2:0]   FBDIMM0B_AMUX;
   output [2:0]	  fsr1_fdo;
   output [2:0]	  fsr1_stciq; 
   
   input [6:0]	  mcu0_fsr1_cfgpll0;
   input [6:0]	  mcu0_fsr1_cfgpll1;
   input [6:0]	  mcu0_fsr1_cfgpll2;
   input [19:0]   mcu0_fsr1_cfgrx0;
   input [19:0]	  mcu0_fsr1_cfgrx1;
   input [19:0]	  mcu0_fsr1_cfgrx2;
   input [19:0]	  mcu0_fsr1_cfgrx3;
   input [19:0]	  mcu0_fsr1_cfgrx4;
   input [19:0]   mcu0_fsr1_cfgrx5;
   input [19:0]	  mcu0_fsr1_cfgrx6;
   input [19:0]	  mcu0_fsr1_cfgrx7;
   input [19:0]	  mcu0_fsr1_cfgrx8;
   input [19:0]	  mcu0_fsr1_cfgrx9;
   input [19:0]	  mcu0_fsr1_cfgrx10;
   input [19:0]	  mcu0_fsr1_cfgrx11;
   input [19:0]	  mcu0_fsr1_cfgrx12;
   input [19:0]	  mcu0_fsr1_cfgrx13;
   input [15:0]	  mcu0_fsr1_cfgtx0;
   input [15:0]	  mcu0_fsr1_cfgtx1;
   input [15:0]	  mcu0_fsr1_cfgtx2;
   input [15:0]	  mcu0_fsr1_cfgtx3;
   input [15:0]	  mcu0_fsr1_cfgtx4;
   input [15:0]	  mcu0_fsr1_cfgtx5;
   input [15:0]	  mcu0_fsr1_cfgtx6;
   input [15:0]	  mcu0_fsr1_cfgtx7;
   input [15:0]	  mcu0_fsr1_cfgtx8;
   input [15:0]	  mcu0_fsr1_cfgtx9;
   input [17:0]	  mcu0_fsr1_testcfg0;
   input [17:0]	  mcu0_fsr1_testcfg1;
   input [17:0]	  mcu0_fsr1_testcfg2;
   input [11:0]   mcu0_fsr1_td0;
   input [11:0]   mcu0_fsr1_td1;
   input [11:0]   mcu0_fsr1_td2;
   input [11:0]   mcu0_fsr1_td3;
   input [11:0]   mcu0_fsr1_td4;
   input [11:0]   mcu0_fsr1_td5;
   input [11:0]   mcu0_fsr1_td6;
   input [11:0]   mcu0_fsr1_td7;
   input [11:0]   mcu0_fsr1_td8;
   input [11:0]   mcu0_fsr1_td9;
   input [5:0] 	  fsr1_stcicfg;
   input [2:0]	  fsr1_txbclkin;
   input [13:0]	  fsr1_rxbclkin;
   input [2:0]	  fsr1_bsinitclk; 
   input [2:0]	  fsr1_fclk; 
   input [2:0]	  fsr1_fclrz; 
   input [2:0]	  fsr1_fdi; 
   input [13:0]   FBDIMM0B_RX_N; 
   input [13:0]   FBDIMM0B_RX_P; 
   input [2:0]	  fsr1_stciclk; 
   input [2:0]	  fsr1_stcid; 
   input [2:0]	  fsr1_testclkr; 
   input [2:0]	  fsr1_testclkt;

   output [11:0]  fsr2_mcu1_rd0;
   output [11:0]  fsr2_mcu1_rd1;
   output [11:0]  fsr2_mcu1_rd2;
   output [11:0]  fsr2_mcu1_rd3;
   output [11:0]  fsr2_mcu1_rd4;
   output [11:0]  fsr2_mcu1_rd5;
   output [11:0]  fsr2_mcu1_rd6;
   output [11:0]  fsr2_mcu1_rd7;
   output [11:0]  fsr2_mcu1_rd8;
   output [11:0]  fsr2_mcu1_rd9;
   output [11:0]  fsr2_mcu1_rd10;
   output [11:0]  fsr2_mcu1_rd11;
   output [11:0]  fsr2_mcu1_rd12;
   output [11:0]  fsr2_mcu1_rd13;
   output [2:0]   fsr2_mcu1_stspll_lock;
   output [13:0]  fsr2_mcu1_stsrx_testfail;
   output [13:0]  fsr2_mcu1_stsrx_sync;
   output [13:0]  fsr2_mcu1_stsrx_losdtct;
   output [13:0]  fsr2_mcu1_stsrx_bsrxp;
   output [13:0]  fsr2_mcu1_stsrx_bsrxn;
   output [9:0]   fsr2_mcu1_ststx_testfail;
   output [13:0]  fsr2_mcu1_rxbclk;
   output [9:0]   FBDIMM1A_TX_N; 
   output [9:0]   FBDIMM1A_TX_P;
   output [2:0]   FBDIMM1A_AMUX;
   output [2:0]	  fsr2_fdo;
   output [2:0]	  fsr2_stciq; 
   
   input [6:0]	  mcu1_fsr2_cfgpll0;
   input [6:0]	  mcu1_fsr2_cfgpll1;
   input [6:0]	  mcu1_fsr2_cfgpll2;
   input [19:0]   mcu1_fsr2_cfgrx0;
   input [19:0]	  mcu1_fsr2_cfgrx1;
   input [19:0]	  mcu1_fsr2_cfgrx2;
   input [19:0]	  mcu1_fsr2_cfgrx3;
   input [19:0]	  mcu1_fsr2_cfgrx4;
   input [19:0]   mcu1_fsr2_cfgrx5;
   input [19:0]	  mcu1_fsr2_cfgrx6;
   input [19:0]	  mcu1_fsr2_cfgrx7;
   input [19:0]	  mcu1_fsr2_cfgrx8;
   input [19:0]	  mcu1_fsr2_cfgrx9;
   input [19:0]	  mcu1_fsr2_cfgrx10;
   input [19:0]	  mcu1_fsr2_cfgrx11;
   input [19:0]	  mcu1_fsr2_cfgrx12;
   input [19:0]	  mcu1_fsr2_cfgrx13;
   input [15:0]	  mcu1_fsr2_cfgtx0;
   input [15:0]	  mcu1_fsr2_cfgtx1;
   input [15:0]	  mcu1_fsr2_cfgtx2;
   input [15:0]	  mcu1_fsr2_cfgtx3;
   input [15:0]	  mcu1_fsr2_cfgtx4;
   input [15:0]	  mcu1_fsr2_cfgtx5;
   input [15:0]	  mcu1_fsr2_cfgtx6;
   input [15:0]	  mcu1_fsr2_cfgtx7;
   input [15:0]	  mcu1_fsr2_cfgtx8;
   input [15:0]	  mcu1_fsr2_cfgtx9;
   input [17:0]	  mcu1_fsr2_testcfg0;
   input [17:0]	  mcu1_fsr2_testcfg1;
   input [17:0]	  mcu1_fsr2_testcfg2;
   input [11:0]   mcu1_fsr2_td0;
   input [11:0]   mcu1_fsr2_td1;
   input [11:0]   mcu1_fsr2_td2;
   input [11:0]   mcu1_fsr2_td3;
   input [11:0]   mcu1_fsr2_td4;
   input [11:0]   mcu1_fsr2_td5;
   input [11:0]   mcu1_fsr2_td6;
   input [11:0]   mcu1_fsr2_td7;
   input [11:0]   mcu1_fsr2_td8;
   input [11:0]   mcu1_fsr2_td9;
   input [5:0] 	  fsr2_stcicfg;
   input [2:0]	  fsr2_txbclkin;
   input [13:0]	  fsr2_rxbclkin;
   input [2:0]	  fsr2_bsinitclk; 
   input [2:0]	  fsr2_fclk; 
   input [2:0]	  fsr2_fclrz; 
   input [2:0]	  fsr2_fdi; 
   input [13:0]   FBDIMM1A_RX_N; 
   input [13:0]   FBDIMM1A_RX_P; 
   input [2:0]	  fsr2_stciclk; 
   input [2:0]	  fsr2_stcid; 
   input [2:0]	  fsr2_testclkr; 
   input [2:0]	  fsr2_testclkt;

   output [11:0]  fsr3_mcu1_rd0;
   output [11:0]  fsr3_mcu1_rd1;
   output [11:0]  fsr3_mcu1_rd2;
   output [11:0]  fsr3_mcu1_rd3;
   output [11:0]  fsr3_mcu1_rd4;
   output [11:0]  fsr3_mcu1_rd5;
   output [11:0]  fsr3_mcu1_rd6;
   output [11:0]  fsr3_mcu1_rd7;
   output [11:0]  fsr3_mcu1_rd8;
   output [11:0]  fsr3_mcu1_rd9;
   output [11:0]  fsr3_mcu1_rd10;
   output [11:0]  fsr3_mcu1_rd11;
   output [11:0]  fsr3_mcu1_rd12;
   output [11:0]  fsr3_mcu1_rd13;
   output [2:0]   fsr3_mcu1_stspll_lock;
   output [13:0]  fsr3_mcu1_stsrx_testfail;
   output [13:0]  fsr3_mcu1_stsrx_sync;
   output [13:0]  fsr3_mcu1_stsrx_losdtct;
   output [13:0]  fsr3_mcu1_stsrx_bsrxp;
   output [13:0]  fsr3_mcu1_stsrx_bsrxn;
   output [9:0]   fsr3_mcu1_ststx_testfail;
   output [13:0]  fsr3_mcu1_rxbclk;
   output [9:0]   FBDIMM1B_TX_N; 
   output [9:0]   FBDIMM1B_TX_P;
   output [2:0]   FBDIMM1B_AMUX;
   output [2:0]	  fsr3_fdo;
   output [2:0]	  fsr3_stciq; 
   
   input [6:0]	  mcu1_fsr3_cfgpll0;
   input [6:0]	  mcu1_fsr3_cfgpll1;
   input [6:0]	  mcu1_fsr3_cfgpll2;
   input [19:0]   mcu1_fsr3_cfgrx0;
   input [19:0]	  mcu1_fsr3_cfgrx1;
   input [19:0]	  mcu1_fsr3_cfgrx2;
   input [19:0]	  mcu1_fsr3_cfgrx3;
   input [19:0]	  mcu1_fsr3_cfgrx4;
   input [19:0]   mcu1_fsr3_cfgrx5;
   input [19:0]	  mcu1_fsr3_cfgrx6;
   input [19:0]	  mcu1_fsr3_cfgrx7;
   input [19:0]	  mcu1_fsr3_cfgrx8;
   input [19:0]	  mcu1_fsr3_cfgrx9;
   input [19:0]	  mcu1_fsr3_cfgrx10;
   input [19:0]	  mcu1_fsr3_cfgrx11;
   input [19:0]	  mcu1_fsr3_cfgrx12;
   input [19:0]	  mcu1_fsr3_cfgrx13;
   input [15:0]	  mcu1_fsr3_cfgtx0;
   input [15:0]	  mcu1_fsr3_cfgtx1;
   input [15:0]	  mcu1_fsr3_cfgtx2;
   input [15:0]	  mcu1_fsr3_cfgtx3;
   input [15:0]	  mcu1_fsr3_cfgtx4;
   input [15:0]	  mcu1_fsr3_cfgtx5;
   input [15:0]	  mcu1_fsr3_cfgtx6;
   input [15:0]	  mcu1_fsr3_cfgtx7;
   input [15:0]	  mcu1_fsr3_cfgtx8;
   input [15:0]	  mcu1_fsr3_cfgtx9;
   input [17:0]	  mcu1_fsr3_testcfg0;
   input [17:0]	  mcu1_fsr3_testcfg1;
   input [17:0]	  mcu1_fsr3_testcfg2;
   input [11:0]   mcu1_fsr3_td0;
   input [11:0]   mcu1_fsr3_td1;
   input [11:0]   mcu1_fsr3_td2;
   input [11:0]   mcu1_fsr3_td3;
   input [11:0]   mcu1_fsr3_td4;
   input [11:0]   mcu1_fsr3_td5;
   input [11:0]   mcu1_fsr3_td6;
   input [11:0]   mcu1_fsr3_td7;
   input [11:0]   mcu1_fsr3_td8;
   input [11:0]   mcu1_fsr3_td9;
   input [5:0] 	  fsr3_stcicfg;
   input [2:0]	  fsr3_txbclkin;
   input [13:0]	  fsr3_rxbclkin;
   input [2:0]	  fsr3_bsinitclk; 
   input [2:0]	  fsr3_fclk; 
   input [2:0]	  fsr3_fclrz; 
   input [2:0]	  fsr3_fdi; 
   input [13:0]   FBDIMM1B_RX_N;
   input [13:0]   FBDIMM1B_RX_P;
   input [2:0]	  fsr3_stciclk;
   input [2:0]	  fsr3_stcid;
   input [2:0]	  fsr3_testclkr; 
   input [2:0]	  fsr3_testclkt;

   input 	  fsr_left_atpgd;
   output 	  fsr_left_atpgq;

   input 	  FBDIMM1_REFCLK_N; 
   input 	  FBDIMM1_REFCLK_P; 

   input 	  VDDA;
   input 	  VDDD;
   input 	  VDDR;
   input 	  VDDT;
   input 	  VSSA;

   assign clk622l_l_1 = FBDIMM1_REFCLK_P;
   assign clk622l_l_1x = FBDIMM1_REFCLK_N;
   assign clk622l_l_2 = FBDIMM1_REFCLK_P;
   assign clk622l_l_2x = FBDIMM1_REFCLK_N;
   assign clk622l_l_3 = FBDIMM1_REFCLK_P;
   assign clk622l_l_3x = FBDIMM1_REFCLK_N;
   assign clk622l_l_4 = FBDIMM1_REFCLK_P;
   assign clk622l_l_4x = FBDIMM1_REFCLK_N;
   assign clk622l_l_5 = FBDIMM1_REFCLK_P;
   assign clk622l_l_5x = FBDIMM1_REFCLK_N;
   assign clk622l_l_6 = FBDIMM1_REFCLK_P;
   assign clk622l_l_6x = FBDIMM1_REFCLK_N;
   assign clk622l_l_8 = FBDIMM1_REFCLK_P;
   assign clk622l_l_8x = FBDIMM1_REFCLK_N;
   assign clk622l_l_9 = FBDIMM1_REFCLK_P;
   assign clk622l_l_9x = FBDIMM1_REFCLK_N;
   assign clk622l_l_10 = FBDIMM1_REFCLK_P;
   assign clk622l_l_10x = FBDIMM1_REFCLK_N;
   assign clk622l_l_11 = FBDIMM1_REFCLK_P;
   assign clk622l_l_11x = FBDIMM1_REFCLK_N;
   assign clk622l_l_12 = FBDIMM1_REFCLK_P;
   assign clk622l_l_12x = FBDIMM1_REFCLK_N;
   assign clk622l_l_13 = FBDIMM1_REFCLK_P;
   assign clk622l_l_13x = FBDIMM1_REFCLK_N;
      
   wire [9:0] 	  fsr0_txbclk_unused;
   wire [13:0] 	  fsr0_rxbclklln_unused;
   wire [13:0] 	  fsr0_rxbclkllp_unused;
   wire [3:0] 	  fsr0_mcu0_stspll_b80;
   wire [3:0] 	  fsr0_mcu0_stspll_b81;
   wire [3:0] 	  fsr0_mcu0_stspll_b62;
   wire [7:0] 	  fsr0_mcu0_stsrx0_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx1_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx2_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx3_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx4_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx5_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx6_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx7_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx8_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx9_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx10_unused;	  
   wire [7:0] 	  fsr0_mcu0_stsrx11_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx12_unused; 	  
   wire [7:0] 	  fsr0_mcu0_stsrx13_unused; 
   wire [3:0] 	  fsr0_mcu0_ststx0_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx1_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx2_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx3_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx4_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx5_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx6_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx7_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx8_unused;	  
   wire [3:0] 	  fsr0_mcu0_ststx9_unused;	  
   wire [1:0] 	  fsr0_rdll0_b80;
   wire [1:0] 	  fsr0_rdll1_b80;
   wire [1:0] 	  fsr0_rdll2_b80;
   wire [1:0] 	  fsr0_rdll3_b80;
   wire [1:0] 	  fsr0_rdll0_b81;
   wire [1:0] 	  fsr0_rdll1_b81;
   wire [1:0] 	  fsr0_rdll2_b81;
   wire [1:0] 	  fsr0_rdll3_b81;
   wire [1:0] 	  fsr0_rdll0_b62;
   wire [1:0] 	  fsr0_rdll1_b62;
   wire [1:0] 	  fsr0_rdll2_b62;
   wire [1:0] 	  fsr0_rdll3_b62;

   wire [9:0] 	  fsr1_txbclk_unused;
   wire [13:0] 	  fsr1_rxbclklln_unused;
   wire [13:0] 	  fsr1_rxbclkllp_unused;
   wire [3:0] 	  fsr1_mcu0_stspll_b80;
   wire [3:0] 	  fsr1_mcu0_stspll_b81;
   wire [3:0] 	  fsr1_mcu0_stspll_b62;
   wire [7:0] 	  fsr1_mcu0_stsrx0_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx1_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx2_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx3_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx4_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx5_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx6_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx7_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx8_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx9_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx10_unused;	  
   wire [7:0] 	  fsr1_mcu0_stsrx11_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx12_unused; 	  
   wire [7:0] 	  fsr1_mcu0_stsrx13_unused; 
   wire [3:0] 	  fsr1_mcu0_ststx0_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx1_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx2_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx3_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx4_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx5_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx6_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx7_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx8_unused;	  
   wire [3:0] 	  fsr1_mcu0_ststx9_unused;	  
   wire [1:0] 	  fsr1_rdll0_b80;
   wire [1:0] 	  fsr1_rdll1_b80;
   wire [1:0] 	  fsr1_rdll2_b80;
   wire [1:0] 	  fsr1_rdll3_b80;
   wire [1:0] 	  fsr1_rdll0_b81;
   wire [1:0] 	  fsr1_rdll1_b81;
   wire [1:0] 	  fsr1_rdll2_b81;
   wire [1:0] 	  fsr1_rdll3_b81;
   wire [1:0] 	  fsr1_rdll0_b62;
   wire [1:0] 	  fsr1_rdll1_b62;
   wire [1:0] 	  fsr1_rdll2_b62;
   wire [1:0] 	  fsr1_rdll3_b62;

   wire [9:0] 	  fsr2_txbclk_unused;
   wire [13:0] 	  fsr2_rxbclklln_unused;
   wire [13:0] 	  fsr2_rxbclkllp_unused;
   wire [3:0] 	  fsr2_mcu1_stspll_b80;
   wire [3:0] 	  fsr2_mcu1_stspll_b81;
   wire [3:0] 	  fsr2_mcu1_stspll_b62;
   wire [7:0] 	  fsr2_mcu1_stsrx0_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx1_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx2_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx3_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx4_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx5_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx6_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx7_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx8_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx9_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx10_unused;	  
   wire [7:0] 	  fsr2_mcu1_stsrx11_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx12_unused; 	  
   wire [7:0] 	  fsr2_mcu1_stsrx13_unused; 
   wire [3:0] 	  fsr2_mcu1_ststx0_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx1_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx2_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx3_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx4_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx5_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx6_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx7_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx8_unused;	  
   wire [3:0] 	  fsr2_mcu1_ststx9_unused;	  
   wire [1:0] 	  fsr2_rdll0_b80;
   wire [1:0] 	  fsr2_rdll1_b80;
   wire [1:0] 	  fsr2_rdll2_b80;
   wire [1:0] 	  fsr2_rdll3_b80;
   wire [1:0] 	  fsr2_rdll0_b81;
   wire [1:0] 	  fsr2_rdll1_b81;
   wire [1:0] 	  fsr2_rdll2_b81;
   wire [1:0] 	  fsr2_rdll3_b81;
   wire [1:0] 	  fsr2_rdll0_b62;
   wire [1:0] 	  fsr2_rdll1_b62;
   wire [1:0] 	  fsr2_rdll2_b62;
   wire [1:0] 	  fsr2_rdll3_b62;

   wire [9:0] 	  fsr3_txbclk_unused;
   wire [13:0] 	  fsr3_rxbclklln_unused;
   wire [13:0] 	  fsr3_rxbclkllp_unused;
   wire [3:0] 	  fsr3_mcu1_stspll_b80;
   wire [3:0] 	  fsr3_mcu1_stspll_b81;
   wire [3:0] 	  fsr3_mcu1_stspll_b62;
   wire [7:0] 	  fsr3_mcu1_stsrx0_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx1_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx2_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx3_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx4_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx5_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx6_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx7_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx8_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx9_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx10_unused;	  
   wire [7:0] 	  fsr3_mcu1_stsrx11_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx12_unused; 	  
   wire [7:0] 	  fsr3_mcu1_stsrx13_unused; 
   wire [3:0] 	  fsr3_mcu1_ststx0_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx1_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx2_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx3_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx4_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx5_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx6_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx7_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx8_unused;	  
   wire [3:0] 	  fsr3_mcu1_ststx9_unused;	  
   wire [1:0] 	  fsr3_rdll0_b80;
   wire [1:0] 	  fsr3_rdll1_b80;
   wire [1:0] 	  fsr3_rdll2_b80;
   wire [1:0] 	  fsr3_rdll3_b80;
   wire [1:0] 	  fsr3_rdll0_b81;
   wire [1:0] 	  fsr3_rdll1_b81;
   wire [1:0] 	  fsr3_rdll2_b81;
   wire [1:0] 	  fsr3_rdll3_b81;
   wire [1:0] 	  fsr3_rdll0_b62;
   wire [1:0] 	  fsr3_rdll1_b62;
   wire [1:0] 	  fsr3_rdll2_b62;
   wire [1:0] 	  fsr3_rdll3_b62;

   wire 	  fsr0_atpgmq_b80;
   wire 	  fsr0_atpgmq_a8;
   wire 	  fsr0_atpgmq_b81;
   wire [3:0]	  fsr0_atpgrq_b80;
   wire [5:0]	  fsr0_atpgrq_a8;
   wire [3:0]	  fsr0_atpgrq_b81;
   wire [3:0]	  fsr0_atpgtq_b80;
   wire [1:0]	  fsr0_atpgtq_a8;
   wire [3:0]	  fsr0_atpgtq_b81;

   wire 	  fsr1_atpgmq_b80;
   wire 	  fsr1_atpgmq_a8;
   wire 	  fsr1_atpgmq_b81;
   wire [3:0]	  fsr1_atpgrq_b80;
   wire [5:0]	  fsr1_atpgrq_a8;
   wire [3:0]	  fsr1_atpgrq_b81;
   wire [3:0]	  fsr1_atpgtq_b80;
   wire [1:0]	  fsr1_atpgtq_a8;
   wire [3:0]	  fsr1_atpgtq_b81;

   wire 	  fsr2_atpgmq_b80;
   wire 	  fsr2_atpgmq_a8;
   wire 	  fsr2_atpgmq_b81;
   wire [3:0]	  fsr2_atpgrq_b80;
   wire [5:0]	  fsr2_atpgrq_a8;
   wire [3:0]	  fsr2_atpgrq_b81;
   wire [3:0]	  fsr2_atpgtq_b80;
   wire [1:0]	  fsr2_atpgtq_a8;
   wire [3:0]	  fsr2_atpgtq_b81;

   wire 	  fsr3_atpgmq_b80;
   wire 	  fsr3_atpgmq_a8;
   wire 	  fsr3_atpgmq_b81;
   wire [3:0]	  fsr3_atpgrq_b80;
   wire [5:0]	  fsr3_atpgrq_a8;
   wire [3:0]	  fsr3_atpgrq_b81;
   wire [3:0]	  fsr3_atpgtq_b80;
   wire [1:0]	  fsr3_atpgtq_a8;
   wire [3:0]	  fsr3_atpgtq_b81;

   

// first serdes macro: rx ports 0-3, tx ports 0-3

wiz6c2b8n6d2t    fsr0_b8_0 (
  .bsinitclk 	    ( fsr0_bsinitclk[0]),
  .cfgpll       ({2'b0, mcu0_fsr0_cfgpll0[6:5], 3'b0, mcu0_fsr0_cfgpll0[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr0_cfgrx0[19:18], 1'b0, mcu0_fsr0_cfgrx0[17:9], 1'b0, mcu0_fsr0_cfgrx0[8], 
		  1'b0, mcu0_fsr0_cfgrx0[7:2], 3'b0, mcu0_fsr0_cfgrx0[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr0_cfgrx1[19:18], 1'b0, mcu0_fsr0_cfgrx1[17:9], 1'b0, mcu0_fsr0_cfgrx1[8], 
		  1'b0, mcu0_fsr0_cfgrx1[7:2], 3'b0, mcu0_fsr0_cfgrx1[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr0_cfgrx2[19:18], 1'b0, mcu0_fsr0_cfgrx2[17:9], 1'b0, mcu0_fsr0_cfgrx2[8], 
		  1'b0, mcu0_fsr0_cfgrx2[7:2], 3'b0, mcu0_fsr0_cfgrx2[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr0_cfgrx3[19:18], 1'b0, mcu0_fsr0_cfgrx3[17:9], 1'b0, mcu0_fsr0_cfgrx3[8], 
		  1'b0, mcu0_fsr0_cfgrx3[7:2], 3'b0, mcu0_fsr0_cfgrx3[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr0_cfgtx0[15:2], 3'b0, mcu0_fsr0_cfgtx0[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr0_cfgtx1[15:2], 3'b0, mcu0_fsr0_cfgtx1[1:0]}),
  .cfgtx2	({1'b0, mcu0_fsr0_cfgtx2[15:2], 3'b0, mcu0_fsr0_cfgtx2[1:0]}),
  .cfgtx3	({1'b0, mcu0_fsr0_cfgtx3[15:2], 3'b0, mcu0_fsr0_cfgtx3[1:0]}),
  .fclk 	    ( fsr0_fclk[0]     ),
  .fclrz 	    ( fsr0_fclrz[0]    ),
  .fdi 		    ( fsr0_fdi[0]      ),
  .refclkn 	    ( clk622l_l_13x  ),
  .refclkp 	    ( clk622l_l_13  ),
  .rxbclkin 	    ( fsr0_rxbclkin[3:0] ),
  .rxn0 	    ( FBDIMM0A_RX_N[0]   ),
  .rxn1 	    ( FBDIMM0A_RX_N[1]   ),
  .rxn2 	    ( FBDIMM0A_RX_N[2]   ),
  .rxn3 	    ( FBDIMM0A_RX_N[3]   ),
  .rxp0 	    ( FBDIMM0A_RX_P[0]   ),
  .rxp1 	    ( FBDIMM0A_RX_P[1]   ),
  .rxp2 	    ( FBDIMM0A_RX_P[2]   ),
  .rxp3 	    ( FBDIMM0A_RX_P[3]   ),
  .stcicfg 	    ( fsr0_stcicfg[1:0]  ),
  .stciclk 	    ( fsr0_stciclk[0]  ),
  .stcid 	    ( fsr0_stcid[0]    ),
  .td0 		    ( {mcu0_fsr0_td0[0], mcu0_fsr0_td0[1], mcu0_fsr0_td0[2], mcu0_fsr0_td0[3],
		       mcu0_fsr0_td0[4], mcu0_fsr0_td0[5], mcu0_fsr0_td0[6], mcu0_fsr0_td0[7],
		       mcu0_fsr0_td0[8], mcu0_fsr0_td0[9], mcu0_fsr0_td0[10], mcu0_fsr0_td0[11]} ),
  .td1 		    ( {mcu0_fsr0_td1[0], mcu0_fsr0_td1[1], mcu0_fsr0_td1[2], mcu0_fsr0_td1[3],
		       mcu0_fsr0_td1[4], mcu0_fsr0_td1[5], mcu0_fsr0_td1[6], mcu0_fsr0_td1[7],
		       mcu0_fsr0_td1[8], mcu0_fsr0_td1[9], mcu0_fsr0_td1[10], mcu0_fsr0_td1[11]} ),
  .td2 		    ( {mcu0_fsr0_td2[0], mcu0_fsr0_td2[1], mcu0_fsr0_td2[2], mcu0_fsr0_td2[3],
		       mcu0_fsr0_td2[4], mcu0_fsr0_td2[5], mcu0_fsr0_td2[6], mcu0_fsr0_td2[7],
		       mcu0_fsr0_td2[8], mcu0_fsr0_td2[9], mcu0_fsr0_td2[10], mcu0_fsr0_td2[11]} ),
  .td3 		    ( {mcu0_fsr0_td3[0], mcu0_fsr0_td3[1], mcu0_fsr0_td3[2], mcu0_fsr0_td3[3],
		       mcu0_fsr0_td3[4], mcu0_fsr0_td3[5], mcu0_fsr0_td3[6], mcu0_fsr0_td3[7],
		       mcu0_fsr0_td3[8], mcu0_fsr0_td3[9], mcu0_fsr0_td3[10], mcu0_fsr0_td3[11]} ),
  .testcfg 	    ( {mcu0_fsr0_testcfg0[17:14], 1'b0, mcu0_fsr0_testcfg0[13:11], 1'b0, mcu0_fsr0_testcfg0[10:0]}  ),
  .testclkr 	    ( fsr0_testclkr[0] ),
  .testclkt 	    ( fsr0_testclkt[0] ),
  .txbclkin 	    ( {4{fsr0_txbclkin[0]}} ),
  .amux 	    ( FBDIMM0A_AMUX[0]     ),
  .fdo 		    ( fsr0_fdo[0]      ),
  .rd0 		    ( {fsr0_mcu0_rd0[0], fsr0_mcu0_rd0[1], fsr0_mcu0_rd0[2], fsr0_mcu0_rd0[3], 
		       fsr0_mcu0_rd0[4], fsr0_mcu0_rd0[5], fsr0_mcu0_rd0[6], fsr0_mcu0_rd0[7], 
		       fsr0_mcu0_rd0[8], fsr0_mcu0_rd0[9], fsr0_mcu0_rd0[10], fsr0_mcu0_rd0[11]} ),
  .rd1 		    ( {fsr0_mcu0_rd1[0], fsr0_mcu0_rd1[1], fsr0_mcu0_rd1[2], fsr0_mcu0_rd1[3], 
		       fsr0_mcu0_rd1[4], fsr0_mcu0_rd1[5], fsr0_mcu0_rd1[6], fsr0_mcu0_rd1[7], 
		       fsr0_mcu0_rd1[8], fsr0_mcu0_rd1[9], fsr0_mcu0_rd1[10], fsr0_mcu0_rd1[11]} ),
  .rd2 		    ( {fsr0_mcu0_rd2[0], fsr0_mcu0_rd2[1], fsr0_mcu0_rd2[2], fsr0_mcu0_rd2[3], 
		       fsr0_mcu0_rd2[4], fsr0_mcu0_rd2[5], fsr0_mcu0_rd2[6], fsr0_mcu0_rd2[7], 
		       fsr0_mcu0_rd2[8], fsr0_mcu0_rd2[9], fsr0_mcu0_rd2[10], fsr0_mcu0_rd2[11]} ),
  .rd3 		    ( {fsr0_mcu0_rd3[0], fsr0_mcu0_rd3[1], fsr0_mcu0_rd3[2], fsr0_mcu0_rd3[3], 
		       fsr0_mcu0_rd3[4], fsr0_mcu0_rd3[5], fsr0_mcu0_rd3[6], fsr0_mcu0_rd3[7], 
		       fsr0_mcu0_rd3[8], fsr0_mcu0_rd3[9], fsr0_mcu0_rd3[10], fsr0_mcu0_rd3[11]} ),
  .rdll0 	    ( fsr0_rdll0_b80[1:0] ),
  .rdll1 	    ( fsr0_rdll1_b80[1:0] ),
  .rdll2 	    ( fsr0_rdll2_b80[1:0] ),
  .rdll3 	    ( fsr0_rdll3_b80[1:0] ),
  .rxbclk 	    ( fsr0_mcu0_rxbclk[3:0]   ),
  .rxbclklln 	    ( fsr0_rxbclklln_unused[3:0] ),
  .rxbclkllp 	    ( fsr0_rxbclkllp_unused[3:0] ),
  .stciq 	    ( fsr0_stciq[0]    ),
  .stspll 	    ( {fsr0_mcu0_stspll_b80[2:0], fsr0_mcu0_stspll_lock[0]} ),
  .stsrx0 	    ( {fsr0_mcu0_stsrx0_unused[2:1], fsr0_mcu0_stsrx_bsrxn[0], fsr0_mcu0_stsrx_bsrxp[0],
		       fsr0_mcu0_stsrx_losdtct[0], fsr0_mcu0_stsrx0_unused[0], fsr0_mcu0_stsrx_sync[0],
		       fsr0_mcu0_stsrx_testfail[0]} ),
  .stsrx1 	    ( {fsr0_mcu0_stsrx1_unused[2:1], fsr0_mcu0_stsrx_bsrxn[1], fsr0_mcu0_stsrx_bsrxp[1],
		       fsr0_mcu0_stsrx_losdtct[1], fsr0_mcu0_stsrx1_unused[0], fsr0_mcu0_stsrx_sync[1],
		       fsr0_mcu0_stsrx_testfail[1]} ),
  .stsrx2 	    ( {fsr0_mcu0_stsrx2_unused[2:1], fsr0_mcu0_stsrx_bsrxn[2], fsr0_mcu0_stsrx_bsrxp[2],
		       fsr0_mcu0_stsrx_losdtct[2], fsr0_mcu0_stsrx2_unused[0], fsr0_mcu0_stsrx_sync[2],
		       fsr0_mcu0_stsrx_testfail[2]} ),
  .stsrx3 	    ( {fsr0_mcu0_stsrx3_unused[2:1], fsr0_mcu0_stsrx_bsrxn[3], fsr0_mcu0_stsrx_bsrxp[3],
		       fsr0_mcu0_stsrx_losdtct[3], fsr0_mcu0_stsrx3_unused[0], fsr0_mcu0_stsrx_sync[3],
		       fsr0_mcu0_stsrx_testfail[3]} ),
  .ststx0 	    ( {fsr0_mcu0_ststx0_unused[2:0], fsr0_mcu0_ststx_testfail[0]} ),
  .ststx1 	    ( {fsr0_mcu0_ststx1_unused[2:0], fsr0_mcu0_ststx_testfail[1]} ),
  .ststx2 	    ( {fsr0_mcu0_ststx2_unused[2:0], fsr0_mcu0_ststx_testfail[2]} ),
  .ststx3 	    ( {fsr0_mcu0_ststx3_unused[2:0], fsr0_mcu0_ststx_testfail[3]} ),
  .txbclk 	    ( fsr0_txbclk_unused[3:0]   ),
  .txn0 	    ( FBDIMM0A_TX_N[0]   ),
  .txn1 	    ( FBDIMM0A_TX_N[1]   ),
  .txn2 	    ( FBDIMM0A_TX_N[2]   ),
  .txn3 	    ( FBDIMM0A_TX_N[3]   ),
  .txp0 	    ( FBDIMM0A_TX_P[0]   ),
  .txp1 	    ( FBDIMM0A_TX_P[1]   ),
  .txp2 	    ( FBDIMM0A_TX_P[2]   ),
  .txp3 	    ( FBDIMM0A_TX_P[3]   ),
  .atpgmd           ( fsr0_atpgtq_b80[1] ),
  .atpgmq           ( fsr0_atpgmq_b80 ),
  .atpgrd           ( {fsr0_atpgrq_b80[2],fsr0_atpgtq_b80[2],fsr0_atpgrq_b80[0],fsr0_atpgtq_b80[0]} ),
  .atpgrq           ( fsr0_atpgrq_b80[3:0] ),
  .atpgtd           ( {fsr0_atpgrq_b80[3],fsr0_atpgmq_b80,fsr0_atpgrq_b80[1],fsr_left_atpgd} ),
  .atpgtq           ( fsr0_atpgtq_b80[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );


// second serdes macro: RX ports 4-9, TX ports 4-5
   
wiz6c2a8n6d2t fsr0_a8 (
  .bsinitclk 	    ( fsr0_bsinitclk[1]),
  .cfgpll       ({2'b0, mcu0_fsr0_cfgpll1[6:5], 3'b0, mcu0_fsr0_cfgpll1[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr0_cfgrx4[19:18], 1'b0, mcu0_fsr0_cfgrx4[17:9], 1'b0, mcu0_fsr0_cfgrx4[8], 
		  1'b0, mcu0_fsr0_cfgrx4[7:2], 3'b0, mcu0_fsr0_cfgrx4[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr0_cfgrx5[19:18], 1'b0, mcu0_fsr0_cfgrx5[17:9], 1'b0, mcu0_fsr0_cfgrx5[8], 
		  1'b0, mcu0_fsr0_cfgrx5[7:2], 3'b0, mcu0_fsr0_cfgrx5[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr0_cfgrx6[19:18], 1'b0, mcu0_fsr0_cfgrx6[17:9], 1'b0, mcu0_fsr0_cfgrx6[8], 
		  1'b0, mcu0_fsr0_cfgrx6[7:2], 3'b0, mcu0_fsr0_cfgrx6[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr0_cfgrx7[19:18], 1'b0, mcu0_fsr0_cfgrx7[17:9], 1'b0, mcu0_fsr0_cfgrx7[8], 
		  1'b0, mcu0_fsr0_cfgrx7[7:2], 3'b0, mcu0_fsr0_cfgrx7[1:0]}),
  .cfgrx4	({2'b0, mcu0_fsr0_cfgrx8[19:18], 1'b0, mcu0_fsr0_cfgrx8[17:9], 1'b0, mcu0_fsr0_cfgrx8[8], 
		  1'b0, mcu0_fsr0_cfgrx8[7:2], 3'b0, mcu0_fsr0_cfgrx8[1:0]}),
  .cfgrx5	({2'b0, mcu0_fsr0_cfgrx9[19:18], 1'b0, mcu0_fsr0_cfgrx9[17:9], 1'b0, mcu0_fsr0_cfgrx9[8], 
		  1'b0, mcu0_fsr0_cfgrx9[7:2], 3'b0, mcu0_fsr0_cfgrx9[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr0_cfgtx4[15:2], 3'b0, mcu0_fsr0_cfgtx4[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr0_cfgtx5[15:2], 3'b0, mcu0_fsr0_cfgtx5[1:0]}),
  .fclk 	    ( fsr0_fclk[1]     ),
  .fclrz 	    ( fsr0_fclrz[1]    ),
  .fdi 		    ( fsr0_fdi[1]      ),
  .refclkn 	    ( clk622l_l_12x  ),
  .refclkp 	    ( clk622l_l_12  ),
  .rxbclkin 	    ( fsr0_rxbclkin[9:4] ),
  .rxn0 	    ( FBDIMM0A_RX_N[4]   ),
  .rxn1 	    ( FBDIMM0A_RX_N[5]   ),
  .rxn2 	    ( FBDIMM0A_RX_N[6]   ),
  .rxn3 	    ( FBDIMM0A_RX_N[7]   ),
  .rxn4 	    ( FBDIMM0A_RX_N[8]   ),
  .rxn5 	    ( FBDIMM0A_RX_N[9]   ),
  .rxp0 	    ( FBDIMM0A_RX_P[4]   ),
  .rxp1 	    ( FBDIMM0A_RX_P[5]   ),
  .rxp2 	    ( FBDIMM0A_RX_P[6]   ),
  .rxp3 	    ( FBDIMM0A_RX_P[7]   ),
  .rxp4 	    ( FBDIMM0A_RX_P[8]   ),
  .rxp5 	    ( FBDIMM0A_RX_P[9]   ),
  .stcicfg 	    ( fsr0_stcicfg[3:2]  ),
  .stciclk 	    ( fsr0_stciclk[1]  ),
  .stcid 	    ( fsr0_stcid[1]    ),
  .td0 		    ( {mcu0_fsr0_td4[0], mcu0_fsr0_td4[1], mcu0_fsr0_td4[2], mcu0_fsr0_td4[3],
			       mcu0_fsr0_td4[4], mcu0_fsr0_td4[5], mcu0_fsr0_td4[6], mcu0_fsr0_td4[7],
			       mcu0_fsr0_td4[8], mcu0_fsr0_td4[9], mcu0_fsr0_td4[10], mcu0_fsr0_td4[11]} ),
  .td1 		    ( {mcu0_fsr0_td5[0], mcu0_fsr0_td5[1], mcu0_fsr0_td5[2], mcu0_fsr0_td5[3],
			       mcu0_fsr0_td5[4], mcu0_fsr0_td5[5], mcu0_fsr0_td5[6], mcu0_fsr0_td5[7],
			       mcu0_fsr0_td5[8], mcu0_fsr0_td5[9], mcu0_fsr0_td5[10], mcu0_fsr0_td5[11]} ),
  .testcfg 	    ( {mcu0_fsr0_testcfg1[17:14], 1'b0, mcu0_fsr0_testcfg1[13:11], 1'b0, mcu0_fsr0_testcfg1[10:0]}  ),
  .testclkr 	    ( fsr0_testclkr[1] ),
  .testclkt 	    ( fsr0_testclkt[1] ),
  .txbclkin 	    ( {2{fsr0_txbclkin[1]}} ),
  .amux 	    ( FBDIMM0A_AMUX[1]     ),
  .fdo 		    ( fsr0_fdo[1]      ),
  .rd0 		    ( {fsr0_mcu0_rd4[0], fsr0_mcu0_rd4[1], fsr0_mcu0_rd4[2], fsr0_mcu0_rd4[3], 
		       fsr0_mcu0_rd4[4], fsr0_mcu0_rd4[5], fsr0_mcu0_rd4[6], fsr0_mcu0_rd4[7], 
		       fsr0_mcu0_rd4[8], fsr0_mcu0_rd4[9], fsr0_mcu0_rd4[10], fsr0_mcu0_rd4[11]} ),
  .rd1 		    ( {fsr0_mcu0_rd5[0], fsr0_mcu0_rd5[1], fsr0_mcu0_rd5[2], fsr0_mcu0_rd5[3], 
		       fsr0_mcu0_rd5[4], fsr0_mcu0_rd5[5], fsr0_mcu0_rd5[6], fsr0_mcu0_rd5[7], 
		       fsr0_mcu0_rd5[8], fsr0_mcu0_rd5[9], fsr0_mcu0_rd5[10], fsr0_mcu0_rd5[11]} ),
  .rd2 		    ( {fsr0_mcu0_rd6[0], fsr0_mcu0_rd6[1], fsr0_mcu0_rd6[2], fsr0_mcu0_rd6[3], 
		       fsr0_mcu0_rd6[4], fsr0_mcu0_rd6[5], fsr0_mcu0_rd6[6], fsr0_mcu0_rd6[7], 
		       fsr0_mcu0_rd6[8], fsr0_mcu0_rd6[9], fsr0_mcu0_rd6[10], fsr0_mcu0_rd6[11]} ),
  .rd3 		    ( {fsr0_mcu0_rd7[0], fsr0_mcu0_rd7[1], fsr0_mcu0_rd7[2], fsr0_mcu0_rd7[3], 
		       fsr0_mcu0_rd7[4], fsr0_mcu0_rd7[5], fsr0_mcu0_rd7[6], fsr0_mcu0_rd7[7], 
		       fsr0_mcu0_rd7[8], fsr0_mcu0_rd7[9], fsr0_mcu0_rd7[10], fsr0_mcu0_rd7[11]} ),
  .rd4 		    ( {fsr0_mcu0_rd8[0], fsr0_mcu0_rd8[1], fsr0_mcu0_rd8[2], fsr0_mcu0_rd8[3], 
		       fsr0_mcu0_rd8[4], fsr0_mcu0_rd8[5], fsr0_mcu0_rd8[6], fsr0_mcu0_rd8[7], 
		       fsr0_mcu0_rd8[8], fsr0_mcu0_rd8[9], fsr0_mcu0_rd8[10], fsr0_mcu0_rd8[11]} ),
  .rd5 		    ( {fsr0_mcu0_rd9[0], fsr0_mcu0_rd9[1], fsr0_mcu0_rd9[2], fsr0_mcu0_rd9[3], 
		       fsr0_mcu0_rd9[4], fsr0_mcu0_rd9[5], fsr0_mcu0_rd9[6], fsr0_mcu0_rd9[7], 
		       fsr0_mcu0_rd9[8], fsr0_mcu0_rd9[9], fsr0_mcu0_rd9[10], fsr0_mcu0_rd9[11]} ),
  .rdll0 	    ( fsr0_rdll0_b62[1:0] ),
  .rdll1 	    ( fsr0_rdll1_b62[1:0] ),
  .rdll2 	    ( fsr0_rdll2_b62[1:0] ),
  .rdll3 	    ( fsr0_rdll3_b62[1:0] ),
  .rxbclk 	    ( fsr0_mcu0_rxbclk[9:4]   ),
  .rxbclklln 	    ( fsr0_rxbclklln_unused[9:4] ),
  .rxbclkllp 	    ( fsr0_rxbclkllp_unused[9:4] ),
  .stciq 	    ( fsr0_stciq[1]    ),
  .stspll 	    ( {fsr0_mcu0_stspll_b62[2:0], fsr0_mcu0_stspll_lock[1]} ),
  .stsrx0 	    ( {fsr0_mcu0_stsrx4_unused[2:1], fsr0_mcu0_stsrx_bsrxn[4], fsr0_mcu0_stsrx_bsrxp[4],
		       fsr0_mcu0_stsrx_losdtct[4], fsr0_mcu0_stsrx4_unused[0], fsr0_mcu0_stsrx_sync[4],
		       fsr0_mcu0_stsrx_testfail[4]} ),
  .stsrx1 	    ( {fsr0_mcu0_stsrx5_unused[2:1], fsr0_mcu0_stsrx_bsrxn[5], fsr0_mcu0_stsrx_bsrxp[5],
		       fsr0_mcu0_stsrx_losdtct[5], fsr0_mcu0_stsrx5_unused[0], fsr0_mcu0_stsrx_sync[5],
		       fsr0_mcu0_stsrx_testfail[5]} ),
  .stsrx2 	    ( {fsr0_mcu0_stsrx6_unused[2:1], fsr0_mcu0_stsrx_bsrxn[6], fsr0_mcu0_stsrx_bsrxp[6],
		       fsr0_mcu0_stsrx_losdtct[6], fsr0_mcu0_stsrx6_unused[0], fsr0_mcu0_stsrx_sync[6],
		       fsr0_mcu0_stsrx_testfail[6]} ),
  .stsrx3 	    ( {fsr0_mcu0_stsrx7_unused[2:1], fsr0_mcu0_stsrx_bsrxn[7], fsr0_mcu0_stsrx_bsrxp[7],
		       fsr0_mcu0_stsrx_losdtct[7], fsr0_mcu0_stsrx7_unused[0], fsr0_mcu0_stsrx_sync[7],
		       fsr0_mcu0_stsrx_testfail[7]} ),
  .stsrx4 	    ( {fsr0_mcu0_stsrx8_unused[2:1], fsr0_mcu0_stsrx_bsrxn[8], fsr0_mcu0_stsrx_bsrxp[8],
		       fsr0_mcu0_stsrx_losdtct[8], fsr0_mcu0_stsrx8_unused[0], fsr0_mcu0_stsrx_sync[8],
		       fsr0_mcu0_stsrx_testfail[8]} ),
  .stsrx5 	    ( {fsr0_mcu0_stsrx9_unused[2:1], fsr0_mcu0_stsrx_bsrxn[9], fsr0_mcu0_stsrx_bsrxp[9],
		       fsr0_mcu0_stsrx_losdtct[9], fsr0_mcu0_stsrx9_unused[0], fsr0_mcu0_stsrx_sync[9],
		       fsr0_mcu0_stsrx_testfail[9]} ),
  .ststx0 	    ( {fsr0_mcu0_ststx4_unused[2:0], fsr0_mcu0_ststx_testfail[4]} ),
  .ststx1 	    ( {fsr0_mcu0_ststx5_unused[2:0], fsr0_mcu0_ststx_testfail[5]} ),
  .txbclk 	    ( fsr0_txbclk_unused[5:4]   ),
  .txn0 	    ( FBDIMM0A_TX_N[4]   ),
  .txn1 	    ( FBDIMM0A_TX_N[5]   ),
  .txp0 	    ( FBDIMM0A_TX_P[4]   ),
  .txp1 	    ( FBDIMM0A_TX_P[5]   ),
  .atpgmd           ( fsr0_atpgrq_a8[4] ),
  .atpgmq           ( fsr0_atpgmq_a8 ),
  .atpgrd           ( {fsr0_atpgmq_a8,fsr0_atpgrq_a8[1],fsr0_atpgrq_a8[2],fsr0_atpgrq_a8[5],fsr0_atpgrq_a8[0],
		       fsr0_atpgtq_a8[0]} ),
  .atpgrq           ( fsr0_atpgrq_a8[5:0] ),
  .atpgtd           ( {fsr0_atpgrq_a8[3],fsr0_atpgtq_b80[3]} ),
  .atpgtq           ( fsr0_atpgtq_a8[1:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// third serdes macro: RX ports 10-13, TX ports 6-9
   
wiz6c2b8n6d2t    fsr0_b8_1 (
  .bsinitclk 	    ( fsr0_bsinitclk[2]),
  .cfgpll       ({2'b0, mcu0_fsr0_cfgpll2[6:5], 3'b0, mcu0_fsr0_cfgpll2[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr0_cfgrx10[19:18], 1'b0, mcu0_fsr0_cfgrx10[17:9], 1'b0, mcu0_fsr0_cfgrx10[8], 
		  1'b0, mcu0_fsr0_cfgrx10[7:2], 3'b0, mcu0_fsr0_cfgrx10[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr0_cfgrx11[19:18], 1'b0, mcu0_fsr0_cfgrx11[17:9], 1'b0, mcu0_fsr0_cfgrx11[8], 
		  1'b0, mcu0_fsr0_cfgrx11[7:2], 3'b0, mcu0_fsr0_cfgrx11[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr0_cfgrx12[19:18], 1'b0, mcu0_fsr0_cfgrx12[17:9], 1'b0, mcu0_fsr0_cfgrx12[8], 
		  1'b0, mcu0_fsr0_cfgrx12[7:2], 3'b0, mcu0_fsr0_cfgrx12[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr0_cfgrx13[19:18], 1'b0, mcu0_fsr0_cfgrx13[17:9], 1'b0, mcu0_fsr0_cfgrx13[8], 
		  1'b0, mcu0_fsr0_cfgrx13[7:2], 3'b0, mcu0_fsr0_cfgrx13[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr0_cfgtx6[15:2], 3'b0, mcu0_fsr0_cfgtx6[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr0_cfgtx7[15:2], 3'b0, mcu0_fsr0_cfgtx7[1:0]}),
  .cfgtx2	({1'b0, mcu0_fsr0_cfgtx8[15:2], 3'b0, mcu0_fsr0_cfgtx8[1:0]}),
  .cfgtx3	({1'b0, mcu0_fsr0_cfgtx9[15:2], 3'b0, mcu0_fsr0_cfgtx9[1:0]}),
  .fclk 	    ( fsr0_fclk[2]     ),
  .fclrz 	    ( fsr0_fclrz[2]    ),
  .fdi 		    ( fsr0_fdi[2]      ),
  .refclkn 	    ( clk622l_l_11x ),
  .refclkp 	    ( clk622l_l_11  ),
  .rxbclkin 	    ( fsr0_rxbclkin[13:10] ),
  .rxn0 	    ( FBDIMM0A_RX_N[10]   ),
  .rxn1 	    ( FBDIMM0A_RX_N[11]   ),
  .rxn2 	    ( FBDIMM0A_RX_N[12]   ),
  .rxn3 	    ( FBDIMM0A_RX_N[13]   ),
  .rxp0 	    ( FBDIMM0A_RX_P[10]   ),
  .rxp1 	    ( FBDIMM0A_RX_P[11]   ),
  .rxp2 	    ( FBDIMM0A_RX_P[12]   ),
  .rxp3 	    ( FBDIMM0A_RX_P[13]   ),
  .stcicfg 	    ( fsr0_stcicfg[5:4]  ),
  .stciclk 	    ( fsr0_stciclk[2]  ),
  .stcid 	    ( fsr0_stcid[2]    ),
  .td0 		    ( {mcu0_fsr0_td6[0], mcu0_fsr0_td6[1], mcu0_fsr0_td6[2], mcu0_fsr0_td6[3],
		       mcu0_fsr0_td6[4], mcu0_fsr0_td6[5], mcu0_fsr0_td6[6], mcu0_fsr0_td6[7],
		       mcu0_fsr0_td6[8], mcu0_fsr0_td6[9], mcu0_fsr0_td6[10], mcu0_fsr0_td6[11]} ),
  .td1 		    ( {mcu0_fsr0_td7[0], mcu0_fsr0_td7[1], mcu0_fsr0_td7[2], mcu0_fsr0_td7[3],
		       mcu0_fsr0_td7[4], mcu0_fsr0_td7[5], mcu0_fsr0_td7[6], mcu0_fsr0_td7[7],
		       mcu0_fsr0_td7[8], mcu0_fsr0_td7[9], mcu0_fsr0_td7[10], mcu0_fsr0_td7[11]} ),
  .td2 		    ( {mcu0_fsr0_td8[0], mcu0_fsr0_td8[1], mcu0_fsr0_td8[2], mcu0_fsr0_td8[3],
		       mcu0_fsr0_td8[4], mcu0_fsr0_td8[5], mcu0_fsr0_td8[6], mcu0_fsr0_td8[7],
		       mcu0_fsr0_td8[8], mcu0_fsr0_td8[9], mcu0_fsr0_td8[10], mcu0_fsr0_td8[11]} ),
  .td3 		    ( {mcu0_fsr0_td9[0], mcu0_fsr0_td9[1], mcu0_fsr0_td9[2], mcu0_fsr0_td9[3],
		       mcu0_fsr0_td9[4], mcu0_fsr0_td9[5], mcu0_fsr0_td9[6], mcu0_fsr0_td9[7],
		       mcu0_fsr0_td9[8], mcu0_fsr0_td9[9], mcu0_fsr0_td9[10], mcu0_fsr0_td9[11]} ),
  .testcfg 	    ( {mcu0_fsr0_testcfg2[17:14], 1'b0, mcu0_fsr0_testcfg2[13:11], 1'b0, mcu0_fsr0_testcfg2[10:0]}  ),
  .testclkr 	    ( fsr0_testclkr[2] ),
  .testclkt 	    ( fsr0_testclkt[2] ),
  .txbclkin 	    ( {4{fsr0_txbclkin[2]}} ),
  .amux 	    ( FBDIMM0A_AMUX[2]     ),
  .fdo 		    ( fsr0_fdo[2]     ),
  .rd0 		    ( {fsr0_mcu0_rd10[0], fsr0_mcu0_rd10[1], fsr0_mcu0_rd10[2], fsr0_mcu0_rd10[3], 
		       fsr0_mcu0_rd10[4], fsr0_mcu0_rd10[5], fsr0_mcu0_rd10[6], fsr0_mcu0_rd10[7], 
		       fsr0_mcu0_rd10[8], fsr0_mcu0_rd10[9], fsr0_mcu0_rd10[10], fsr0_mcu0_rd10[11]} ),
  .rd1 		    ( {fsr0_mcu0_rd11[0], fsr0_mcu0_rd11[1], fsr0_mcu0_rd11[2], fsr0_mcu0_rd11[3], 
		       fsr0_mcu0_rd11[4], fsr0_mcu0_rd11[5], fsr0_mcu0_rd11[6], fsr0_mcu0_rd11[7], 
		       fsr0_mcu0_rd11[8], fsr0_mcu0_rd11[9], fsr0_mcu0_rd11[10], fsr0_mcu0_rd11[11]} ),
  .rd2 		    ( {fsr0_mcu0_rd12[0], fsr0_mcu0_rd12[1], fsr0_mcu0_rd12[2], fsr0_mcu0_rd12[3], 
		       fsr0_mcu0_rd12[4], fsr0_mcu0_rd12[5], fsr0_mcu0_rd12[6], fsr0_mcu0_rd12[7], 
		       fsr0_mcu0_rd12[8], fsr0_mcu0_rd12[9], fsr0_mcu0_rd12[10], fsr0_mcu0_rd12[11]} ),
  .rd3 		    ( {fsr0_mcu0_rd13[0], fsr0_mcu0_rd13[1], fsr0_mcu0_rd13[2], fsr0_mcu0_rd13[3], 
		       fsr0_mcu0_rd13[4], fsr0_mcu0_rd13[5], fsr0_mcu0_rd13[6], fsr0_mcu0_rd13[7], 
		       fsr0_mcu0_rd13[8], fsr0_mcu0_rd13[9], fsr0_mcu0_rd13[10], fsr0_mcu0_rd13[11]} ),
  .rdll0 	    ( fsr0_rdll0_b81[1:0] ),
  .rdll1 	    ( fsr0_rdll1_b81[1:0] ),
  .rdll2 	    ( fsr0_rdll2_b81[1:0] ),
  .rdll3 	    ( fsr0_rdll3_b81[1:0] ),
  .rxbclk 	    ( fsr0_mcu0_rxbclk[13:10]   ),
  .rxbclklln 	    ( fsr0_rxbclklln_unused[13:10] ),
  .rxbclkllp 	    ( fsr0_rxbclkllp_unused[13:10] ),
  .stciq 	    ( fsr0_stciq[2]    ),
  .stspll 	    ( {fsr0_mcu0_stspll_b81[2:0], fsr0_mcu0_stspll_lock[2]} ),
  .stsrx0 	    ( {fsr0_mcu0_stsrx10_unused[2:1], fsr0_mcu0_stsrx_bsrxn[10], fsr0_mcu0_stsrx_bsrxp[10],
		       fsr0_mcu0_stsrx_losdtct[10], fsr0_mcu0_stsrx10_unused[0], fsr0_mcu0_stsrx_sync[10],
		       fsr0_mcu0_stsrx_testfail[10]} ),
  .stsrx1 	    ( {fsr0_mcu0_stsrx11_unused[2:1], fsr0_mcu0_stsrx_bsrxn[11], fsr0_mcu0_stsrx_bsrxp[11],
		       fsr0_mcu0_stsrx_losdtct[11], fsr0_mcu0_stsrx11_unused[0], fsr0_mcu0_stsrx_sync[11],
		       fsr0_mcu0_stsrx_testfail[11]} ),
  .stsrx2 	    ( {fsr0_mcu0_stsrx12_unused[2:1], fsr0_mcu0_stsrx_bsrxn[12], fsr0_mcu0_stsrx_bsrxp[12],
		       fsr0_mcu0_stsrx_losdtct[12], fsr0_mcu0_stsrx12_unused[0], fsr0_mcu0_stsrx_sync[12],
		       fsr0_mcu0_stsrx_testfail[12]} ),
  .stsrx3 	    ( {fsr0_mcu0_stsrx13_unused[2:1], fsr0_mcu0_stsrx_bsrxn[13], fsr0_mcu0_stsrx_bsrxp[13],
		       fsr0_mcu0_stsrx_losdtct[13], fsr0_mcu0_stsrx13_unused[0], fsr0_mcu0_stsrx_sync[13],
		       fsr0_mcu0_stsrx_testfail[13]} ),
  .ststx0 	    ( {fsr0_mcu0_ststx6_unused[2:0], fsr0_mcu0_ststx_testfail[6]} ),
  .ststx1 	    ( {fsr0_mcu0_ststx7_unused[2:0], fsr0_mcu0_ststx_testfail[7]} ),
  .ststx2 	    ( {fsr0_mcu0_ststx8_unused[2:0], fsr0_mcu0_ststx_testfail[8]} ),
  .ststx3 	    ( {fsr0_mcu0_ststx9_unused[2:0], fsr0_mcu0_ststx_testfail[9]} ),
  .txbclk 	    ( fsr0_txbclk_unused[9:6]   ),
  .txn0 	    ( FBDIMM0A_TX_N[6]   ),
  .txn1 	    ( FBDIMM0A_TX_N[7]   ),
  .txn2 	    ( FBDIMM0A_TX_N[8]   ),
  .txn3 	    ( FBDIMM0A_TX_N[9]   ),
  .txp0 	    ( FBDIMM0A_TX_P[6]   ),
  .txp1 	    ( FBDIMM0A_TX_P[7]   ),
  .txp2 	    ( FBDIMM0A_TX_P[8]   ),
  .txp3 	    ( FBDIMM0A_TX_P[9]   ),
  .atpgmd           ( fsr0_atpgtq_b81[1] ),
  .atpgmq           ( fsr0_atpgmq_b81 ),
  .atpgrd           ( {fsr0_atpgrq_b81[2],fsr0_atpgtq_b81[2],fsr0_atpgrq_b81[0],fsr0_atpgtq_b81[0]} ),
  .atpgrq           ( fsr0_atpgrq_b81[3:0] ),
  .atpgtd           ( {fsr0_atpgrq_b81[3],fsr0_atpgmq_b81,fsr0_atpgrq_b81[1],fsr0_atpgtq_a8[1]} ),
  .atpgtq           ( fsr0_atpgtq_b81[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// first serdes macro: rx ports 0-3, tx ports 0-3

wiz6c2b8n6d2t    fsr1_b8_0 (
  .bsinitclk 	    ( fsr1_bsinitclk[0]),
  .cfgpll       ({2'b0, mcu0_fsr1_cfgpll0[6:5], 3'b0, mcu0_fsr1_cfgpll0[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr1_cfgrx0[19:18], 1'b0, mcu0_fsr1_cfgrx0[17:9], 1'b0, mcu0_fsr1_cfgrx0[8], 
		  1'b0, mcu0_fsr1_cfgrx0[7:2], 3'b0, mcu0_fsr1_cfgrx0[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr1_cfgrx1[19:18], 1'b0, mcu0_fsr1_cfgrx1[17:9], 1'b0, mcu0_fsr1_cfgrx1[8], 
		  1'b0, mcu0_fsr1_cfgrx1[7:2], 3'b0, mcu0_fsr1_cfgrx1[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr1_cfgrx2[19:18], 1'b0, mcu0_fsr1_cfgrx2[17:9], 1'b0, mcu0_fsr1_cfgrx2[8], 
		  1'b0, mcu0_fsr1_cfgrx2[7:2], 3'b0, mcu0_fsr1_cfgrx2[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr1_cfgrx3[19:18], 1'b0, mcu0_fsr1_cfgrx3[17:9], 1'b0, mcu0_fsr1_cfgrx3[8], 
		  1'b0, mcu0_fsr1_cfgrx3[7:2], 3'b0, mcu0_fsr1_cfgrx3[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr1_cfgtx0[15:2], 3'b0, mcu0_fsr1_cfgtx0[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr1_cfgtx1[15:2], 3'b0, mcu0_fsr1_cfgtx1[1:0]}),
  .cfgtx2	({1'b0, mcu0_fsr1_cfgtx2[15:2], 3'b0, mcu0_fsr1_cfgtx2[1:0]}),
  .cfgtx3	({1'b0, mcu0_fsr1_cfgtx3[15:2], 3'b0, mcu0_fsr1_cfgtx3[1:0]}),
  .fclk 	    ( fsr1_fclk[0]     ),
  .fclrz 	    ( fsr1_fclrz[0]    ),
  .fdi 		    ( fsr1_fdi[0]      ),
  .refclkn 	    ( clk622l_l_10x  ),
  .refclkp 	    ( clk622l_l_10  ),
  .rxbclkin 	    ( fsr1_rxbclkin[3:0] ),
  .rxn0 	    ( FBDIMM0B_RX_N[0]   ),
  .rxn1 	    ( FBDIMM0B_RX_N[1]   ),
  .rxn2 	    ( FBDIMM0B_RX_N[2]   ),
  .rxn3 	    ( FBDIMM0B_RX_N[3]   ),
  .rxp0 	    ( FBDIMM0B_RX_P[0]   ),
  .rxp1 	    ( FBDIMM0B_RX_P[1]   ),
  .rxp2 	    ( FBDIMM0B_RX_P[2]   ),
  .rxp3 	    ( FBDIMM0B_RX_P[3]   ),
  .stcicfg 	    ( fsr1_stcicfg[1:0]  ),
  .stciclk 	    ( fsr1_stciclk[0]  ),
  .stcid 	    ( fsr1_stcid[0]    ),
  .td0 		    ( {mcu0_fsr1_td0[0], mcu0_fsr1_td0[1], mcu0_fsr1_td0[2], mcu0_fsr1_td0[3],
		       mcu0_fsr1_td0[4], mcu0_fsr1_td0[5], mcu0_fsr1_td0[6], mcu0_fsr1_td0[7],
		       mcu0_fsr1_td0[8], mcu0_fsr1_td0[9], mcu0_fsr1_td0[10], mcu0_fsr1_td0[11]} ),
  .td1 		    ( {mcu0_fsr1_td1[0], mcu0_fsr1_td1[1], mcu0_fsr1_td1[2], mcu0_fsr1_td1[3],
		       mcu0_fsr1_td1[4], mcu0_fsr1_td1[5], mcu0_fsr1_td1[6], mcu0_fsr1_td1[7],
		       mcu0_fsr1_td1[8], mcu0_fsr1_td1[9], mcu0_fsr1_td1[10], mcu0_fsr1_td1[11]} ),
  .td2 		    ( {mcu0_fsr1_td2[0], mcu0_fsr1_td2[1], mcu0_fsr1_td2[2], mcu0_fsr1_td2[3],
		       mcu0_fsr1_td2[4], mcu0_fsr1_td2[5], mcu0_fsr1_td2[6], mcu0_fsr1_td2[7],
		       mcu0_fsr1_td2[8], mcu0_fsr1_td2[9], mcu0_fsr1_td2[10], mcu0_fsr1_td2[11]} ),
  .td3 		    ( {mcu0_fsr1_td3[0], mcu0_fsr1_td3[1], mcu0_fsr1_td3[2], mcu0_fsr1_td3[3],
		       mcu0_fsr1_td3[4], mcu0_fsr1_td3[5], mcu0_fsr1_td3[6], mcu0_fsr1_td3[7],
		       mcu0_fsr1_td3[8], mcu0_fsr1_td3[9], mcu0_fsr1_td3[10], mcu0_fsr1_td3[11]} ),
  .testcfg 	    ( {mcu0_fsr1_testcfg0[17:14], 1'b0, mcu0_fsr1_testcfg0[13:11], 1'b0, mcu0_fsr1_testcfg0[10:0]}  ),
  .testclkr 	    ( fsr1_testclkr[0] ),
  .testclkt 	    ( fsr1_testclkt[0] ),
  .txbclkin 	    ( {4{fsr1_txbclkin[0]}} ),
  .amux 	    ( FBDIMM0B_AMUX[0]     ),
  .fdo 		    ( fsr1_fdo[0]      ),
  .rd0 		    ( {fsr1_mcu0_rd0[0], fsr1_mcu0_rd0[1], fsr1_mcu0_rd0[2], fsr1_mcu0_rd0[3], 
		       fsr1_mcu0_rd0[4], fsr1_mcu0_rd0[5], fsr1_mcu0_rd0[6], fsr1_mcu0_rd0[7], 
		       fsr1_mcu0_rd0[8], fsr1_mcu0_rd0[9], fsr1_mcu0_rd0[10], fsr1_mcu0_rd0[11]} ),
  .rd1 		    ( {fsr1_mcu0_rd1[0], fsr1_mcu0_rd1[1], fsr1_mcu0_rd1[2], fsr1_mcu0_rd1[3], 
		       fsr1_mcu0_rd1[4], fsr1_mcu0_rd1[5], fsr1_mcu0_rd1[6], fsr1_mcu0_rd1[7], 
		       fsr1_mcu0_rd1[8], fsr1_mcu0_rd1[9], fsr1_mcu0_rd1[10], fsr1_mcu0_rd1[11]} ),
  .rd2 		    ( {fsr1_mcu0_rd2[0], fsr1_mcu0_rd2[1], fsr1_mcu0_rd2[2], fsr1_mcu0_rd2[3], 
		       fsr1_mcu0_rd2[4], fsr1_mcu0_rd2[5], fsr1_mcu0_rd2[6], fsr1_mcu0_rd2[7], 
		       fsr1_mcu0_rd2[8], fsr1_mcu0_rd2[9], fsr1_mcu0_rd2[10], fsr1_mcu0_rd2[11]} ),
  .rd3 		    ( {fsr1_mcu0_rd3[0], fsr1_mcu0_rd3[1], fsr1_mcu0_rd3[2], fsr1_mcu0_rd3[3], 
		       fsr1_mcu0_rd3[4], fsr1_mcu0_rd3[5], fsr1_mcu0_rd3[6], fsr1_mcu0_rd3[7], 
		       fsr1_mcu0_rd3[8], fsr1_mcu0_rd3[9], fsr1_mcu0_rd3[10], fsr1_mcu0_rd3[11]} ),
  .rdll0 	    ( fsr1_rdll0_b80[1:0] ),
  .rdll1 	    ( fsr1_rdll1_b80[1:0] ),
  .rdll2 	    ( fsr1_rdll2_b80[1:0] ),
  .rdll3 	    ( fsr1_rdll3_b80[1:0] ),
  .rxbclk 	    ( fsr1_mcu0_rxbclk[3:0]   ),
  .rxbclklln 	    ( fsr1_rxbclklln_unused[3:0] ),
  .rxbclkllp 	    ( fsr1_rxbclkllp_unused[3:0] ),
  .stciq 	    ( fsr1_stciq[0]    ),
  .stspll 	    ( {fsr1_mcu0_stspll_b80[2:0], fsr1_mcu0_stspll_lock[0]} ),
  .stsrx0 	    ( {fsr1_mcu0_stsrx0_unused[2:1], fsr1_mcu0_stsrx_bsrxn[0], fsr1_mcu0_stsrx_bsrxp[0],
		       fsr1_mcu0_stsrx_losdtct[0], fsr1_mcu0_stsrx0_unused[0], fsr1_mcu0_stsrx_sync[0],
		       fsr1_mcu0_stsrx_testfail[0]} ),
  .stsrx1 	    ( {fsr1_mcu0_stsrx1_unused[2:1], fsr1_mcu0_stsrx_bsrxn[1], fsr1_mcu0_stsrx_bsrxp[1],
		       fsr1_mcu0_stsrx_losdtct[1], fsr1_mcu0_stsrx1_unused[0], fsr1_mcu0_stsrx_sync[1],
		       fsr1_mcu0_stsrx_testfail[1]} ),
  .stsrx2 	    ( {fsr1_mcu0_stsrx2_unused[2:1], fsr1_mcu0_stsrx_bsrxn[2], fsr1_mcu0_stsrx_bsrxp[2],
		       fsr1_mcu0_stsrx_losdtct[2], fsr1_mcu0_stsrx2_unused[0], fsr1_mcu0_stsrx_sync[2],
		       fsr1_mcu0_stsrx_testfail[2]} ),
  .stsrx3 	    ( {fsr1_mcu0_stsrx3_unused[2:1], fsr1_mcu0_stsrx_bsrxn[3], fsr1_mcu0_stsrx_bsrxp[3],
		       fsr1_mcu0_stsrx_losdtct[3], fsr1_mcu0_stsrx3_unused[0], fsr1_mcu0_stsrx_sync[3],
		       fsr1_mcu0_stsrx_testfail[3]} ),
  .ststx0 	    ( {fsr1_mcu0_ststx0_unused[2:0], fsr1_mcu0_ststx_testfail[0]} ),
  .ststx1 	    ( {fsr1_mcu0_ststx1_unused[2:0], fsr1_mcu0_ststx_testfail[1]} ),
  .ststx2 	    ( {fsr1_mcu0_ststx2_unused[2:0], fsr1_mcu0_ststx_testfail[2]} ),
  .ststx3 	    ( {fsr1_mcu0_ststx3_unused[2:0], fsr1_mcu0_ststx_testfail[3]} ),
  .txbclk 	    ( fsr1_txbclk_unused[3:0]   ),
  .txn0 	    ( FBDIMM0B_TX_N[0]   ),
  .txn1 	    ( FBDIMM0B_TX_N[1]   ),
  .txn2 	    ( FBDIMM0B_TX_N[2]   ),
  .txn3 	    ( FBDIMM0B_TX_N[3]   ),
  .txp0 	    ( FBDIMM0B_TX_P[0]   ),
  .txp1 	    ( FBDIMM0B_TX_P[1]   ),
  .txp2 	    ( FBDIMM0B_TX_P[2]   ),
  .txp3 	    ( FBDIMM0B_TX_P[3]   ),
  .atpgmd           ( fsr1_atpgtq_b80[1] ),
  .atpgmq           ( fsr1_atpgmq_b80 ),
  .atpgrd           ( {fsr1_atpgrq_b80[2],fsr1_atpgtq_b80[2],fsr1_atpgrq_b80[0],fsr1_atpgtq_b80[0]} ),
  .atpgrq           ( fsr1_atpgrq_b80[3:0] ),
  .atpgtd           ( {fsr1_atpgrq_b80[3],fsr1_atpgmq_b80,fsr1_atpgrq_b80[1],fsr0_atpgtq_b81[3]} ),
  .atpgtq           ( fsr1_atpgtq_b80[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );


// second serdes macro: RX ports 4-9, TX ports 4-5
   
wiz6c2a8n6d2t fsr1_a8 (
  .bsinitclk 	    ( fsr1_bsinitclk[1]),
  .cfgpll       ({2'b0, mcu0_fsr1_cfgpll1[6:5], 3'b0, mcu0_fsr1_cfgpll1[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr1_cfgrx4[19:18], 1'b0, mcu0_fsr1_cfgrx4[17:9], 1'b0, mcu0_fsr1_cfgrx4[8], 
		  1'b0, mcu0_fsr1_cfgrx4[7:2], 3'b0, mcu0_fsr1_cfgrx4[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr1_cfgrx5[19:18], 1'b0, mcu0_fsr1_cfgrx5[17:9], 1'b0, mcu0_fsr1_cfgrx5[8], 
		  1'b0, mcu0_fsr1_cfgrx5[7:2], 3'b0, mcu0_fsr1_cfgrx5[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr1_cfgrx6[19:18], 1'b0, mcu0_fsr1_cfgrx6[17:9], 1'b0, mcu0_fsr1_cfgrx6[8], 
		  1'b0, mcu0_fsr1_cfgrx6[7:2], 3'b0, mcu0_fsr1_cfgrx6[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr1_cfgrx7[19:18], 1'b0, mcu0_fsr1_cfgrx7[17:9], 1'b0, mcu0_fsr1_cfgrx7[8], 
		  1'b0, mcu0_fsr1_cfgrx7[7:2], 3'b0, mcu0_fsr1_cfgrx7[1:0]}),
  .cfgrx4	({2'b0, mcu0_fsr1_cfgrx8[19:18], 1'b0, mcu0_fsr1_cfgrx8[17:9], 1'b0, mcu0_fsr1_cfgrx8[8], 
		  1'b0, mcu0_fsr1_cfgrx8[7:2], 3'b0, mcu0_fsr1_cfgrx8[1:0]}),
  .cfgrx5	({2'b0, mcu0_fsr1_cfgrx9[19:18], 1'b0, mcu0_fsr1_cfgrx9[17:9], 1'b0, mcu0_fsr1_cfgrx9[8], 
		  1'b0, mcu0_fsr1_cfgrx9[7:2], 3'b0, mcu0_fsr1_cfgrx9[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr1_cfgtx4[15:2], 3'b0, mcu0_fsr1_cfgtx4[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr1_cfgtx5[15:2], 3'b0, mcu0_fsr1_cfgtx5[1:0]}),
  .fclk 	    ( fsr1_fclk[1]     ),
  .fclrz 	    ( fsr1_fclrz[1]    ),
  .fdi 		    ( fsr1_fdi[1]      ),
  .refclkn 	    ( clk622l_l_9x  ),
  .refclkp 	    ( clk622l_l_9  ),
  .rxbclkin 	    ( fsr1_rxbclkin[9:4] ),
  .rxn0 	    ( FBDIMM0B_RX_N[4]   ),
  .rxn1 	    ( FBDIMM0B_RX_N[5]   ),
  .rxn2 	    ( FBDIMM0B_RX_N[6]   ),
  .rxn3 	    ( FBDIMM0B_RX_N[7]   ),
  .rxn4 	    ( FBDIMM0B_RX_N[8]   ),
  .rxn5 	    ( FBDIMM0B_RX_N[9]   ),
  .rxp0 	    ( FBDIMM0B_RX_P[4]   ),
  .rxp1 	    ( FBDIMM0B_RX_P[5]   ),
  .rxp2 	    ( FBDIMM0B_RX_P[6]   ),
  .rxp3 	    ( FBDIMM0B_RX_P[7]   ),
  .rxp4 	    ( FBDIMM0B_RX_P[8]   ),
  .rxp5 	    ( FBDIMM0B_RX_P[9]   ),
  .stcicfg 	    ( fsr1_stcicfg[3:2]  ),
  .stciclk 	    ( fsr1_stciclk[1]  ),
  .stcid 	    ( fsr1_stcid[1]    ),
  .td0 		    ( {mcu0_fsr1_td4[0], mcu0_fsr1_td4[1], mcu0_fsr1_td4[2], mcu0_fsr1_td4[3],
			       mcu0_fsr1_td4[4], mcu0_fsr1_td4[5], mcu0_fsr1_td4[6], mcu0_fsr1_td4[7],
			       mcu0_fsr1_td4[8], mcu0_fsr1_td4[9], mcu0_fsr1_td4[10], mcu0_fsr1_td4[11]} ),
  .td1 		    ( {mcu0_fsr1_td5[0], mcu0_fsr1_td5[1], mcu0_fsr1_td5[2], mcu0_fsr1_td5[3],
			       mcu0_fsr1_td5[4], mcu0_fsr1_td5[5], mcu0_fsr1_td5[6], mcu0_fsr1_td5[7],
			       mcu0_fsr1_td5[8], mcu0_fsr1_td5[9], mcu0_fsr1_td5[10], mcu0_fsr1_td5[11]} ),
  .testcfg 	    ( {mcu0_fsr1_testcfg1[17:14], 1'b0, mcu0_fsr1_testcfg1[13:11], 1'b0, mcu0_fsr1_testcfg1[10:0]}  ),
  .testclkr 	    ( fsr1_testclkr[1] ),
  .testclkt 	    ( fsr1_testclkt[1] ),
  .txbclkin 	    ( {2{fsr1_txbclkin[1]}} ),
  .amux 	    ( FBDIMM0B_AMUX[1]     ),
  .fdo 		    ( fsr1_fdo[1]      ),
  .rd0 		    ( {fsr1_mcu0_rd4[0], fsr1_mcu0_rd4[1], fsr1_mcu0_rd4[2], fsr1_mcu0_rd4[3], 
		       fsr1_mcu0_rd4[4], fsr1_mcu0_rd4[5], fsr1_mcu0_rd4[6], fsr1_mcu0_rd4[7], 
		       fsr1_mcu0_rd4[8], fsr1_mcu0_rd4[9], fsr1_mcu0_rd4[10], fsr1_mcu0_rd4[11]} ),
  .rd1 		    ( {fsr1_mcu0_rd5[0], fsr1_mcu0_rd5[1], fsr1_mcu0_rd5[2], fsr1_mcu0_rd5[3], 
		       fsr1_mcu0_rd5[4], fsr1_mcu0_rd5[5], fsr1_mcu0_rd5[6], fsr1_mcu0_rd5[7], 
		       fsr1_mcu0_rd5[8], fsr1_mcu0_rd5[9], fsr1_mcu0_rd5[10], fsr1_mcu0_rd5[11]} ),
  .rd2 		    ( {fsr1_mcu0_rd6[0], fsr1_mcu0_rd6[1], fsr1_mcu0_rd6[2], fsr1_mcu0_rd6[3], 
		       fsr1_mcu0_rd6[4], fsr1_mcu0_rd6[5], fsr1_mcu0_rd6[6], fsr1_mcu0_rd6[7], 
		       fsr1_mcu0_rd6[8], fsr1_mcu0_rd6[9], fsr1_mcu0_rd6[10], fsr1_mcu0_rd6[11]} ),
  .rd3 		    ( {fsr1_mcu0_rd7[0], fsr1_mcu0_rd7[1], fsr1_mcu0_rd7[2], fsr1_mcu0_rd7[3], 
		       fsr1_mcu0_rd7[4], fsr1_mcu0_rd7[5], fsr1_mcu0_rd7[6], fsr1_mcu0_rd7[7], 
		       fsr1_mcu0_rd7[8], fsr1_mcu0_rd7[9], fsr1_mcu0_rd7[10], fsr1_mcu0_rd7[11]} ),
  .rd4 		    ( {fsr1_mcu0_rd8[0], fsr1_mcu0_rd8[1], fsr1_mcu0_rd8[2], fsr1_mcu0_rd8[3], 
		       fsr1_mcu0_rd8[4], fsr1_mcu0_rd8[5], fsr1_mcu0_rd8[6], fsr1_mcu0_rd8[7], 
		       fsr1_mcu0_rd8[8], fsr1_mcu0_rd8[9], fsr1_mcu0_rd8[10], fsr1_mcu0_rd8[11]} ),
  .rd5 		    ( {fsr1_mcu0_rd9[0], fsr1_mcu0_rd9[1], fsr1_mcu0_rd9[2], fsr1_mcu0_rd9[3], 
		       fsr1_mcu0_rd9[4], fsr1_mcu0_rd9[5], fsr1_mcu0_rd9[6], fsr1_mcu0_rd9[7], 
		       fsr1_mcu0_rd9[8], fsr1_mcu0_rd9[9], fsr1_mcu0_rd9[10], fsr1_mcu0_rd9[11]} ),
  .rdll0 	    ( fsr1_rdll0_b62[1:0] ),
  .rdll1 	    ( fsr1_rdll1_b62[1:0] ),
  .rdll2 	    ( fsr1_rdll2_b62[1:0] ),
  .rdll3 	    ( fsr1_rdll3_b62[1:0] ),
  .rxbclk 	    ( fsr1_mcu0_rxbclk[9:4]   ),
  .rxbclklln 	    ( fsr1_rxbclklln_unused[9:4] ),
  .rxbclkllp 	    ( fsr1_rxbclkllp_unused[9:4] ),
  .stciq 	    ( fsr1_stciq[1]    ),
  .stspll 	    ( {fsr1_mcu0_stspll_b62[2:0], fsr1_mcu0_stspll_lock[1]} ),
  .stsrx0 	    ( {fsr1_mcu0_stsrx4_unused[2:1], fsr1_mcu0_stsrx_bsrxn[4], fsr1_mcu0_stsrx_bsrxp[4],
		       fsr1_mcu0_stsrx_losdtct[4], fsr1_mcu0_stsrx4_unused[0], fsr1_mcu0_stsrx_sync[4],
		       fsr1_mcu0_stsrx_testfail[4]} ),
  .stsrx1 	    ( {fsr1_mcu0_stsrx5_unused[2:1], fsr1_mcu0_stsrx_bsrxn[5], fsr1_mcu0_stsrx_bsrxp[5],
		       fsr1_mcu0_stsrx_losdtct[5], fsr1_mcu0_stsrx5_unused[0], fsr1_mcu0_stsrx_sync[5],
		       fsr1_mcu0_stsrx_testfail[5]} ),
  .stsrx2 	    ( {fsr1_mcu0_stsrx6_unused[2:1], fsr1_mcu0_stsrx_bsrxn[6], fsr1_mcu0_stsrx_bsrxp[6],
		       fsr1_mcu0_stsrx_losdtct[6], fsr1_mcu0_stsrx6_unused[0], fsr1_mcu0_stsrx_sync[6],
		       fsr1_mcu0_stsrx_testfail[6]} ),
  .stsrx3 	    ( {fsr1_mcu0_stsrx7_unused[2:1], fsr1_mcu0_stsrx_bsrxn[7], fsr1_mcu0_stsrx_bsrxp[7],
		       fsr1_mcu0_stsrx_losdtct[7], fsr1_mcu0_stsrx7_unused[0], fsr1_mcu0_stsrx_sync[7],
		       fsr1_mcu0_stsrx_testfail[7]} ),
  .stsrx4 	    ( {fsr1_mcu0_stsrx8_unused[2:1], fsr1_mcu0_stsrx_bsrxn[8], fsr1_mcu0_stsrx_bsrxp[8],
		       fsr1_mcu0_stsrx_losdtct[8], fsr1_mcu0_stsrx8_unused[0], fsr1_mcu0_stsrx_sync[8],
		       fsr1_mcu0_stsrx_testfail[8]} ),
  .stsrx5 	    ( {fsr1_mcu0_stsrx9_unused[2:1], fsr1_mcu0_stsrx_bsrxn[9], fsr1_mcu0_stsrx_bsrxp[9],
		       fsr1_mcu0_stsrx_losdtct[9], fsr1_mcu0_stsrx9_unused[0], fsr1_mcu0_stsrx_sync[9],
		       fsr1_mcu0_stsrx_testfail[9]} ),
  .ststx0 	    ( {fsr1_mcu0_ststx4_unused[2:0], fsr1_mcu0_ststx_testfail[4]} ),
  .ststx1 	    ( {fsr1_mcu0_ststx5_unused[2:0], fsr1_mcu0_ststx_testfail[5]} ),
  .txbclk 	    ( fsr1_txbclk_unused[5:4]   ),
  .txn0 	    ( FBDIMM0B_TX_N[4]   ),
  .txn1 	    ( FBDIMM0B_TX_N[5]   ),
  .txp0 	    ( FBDIMM0B_TX_P[4]   ),
  .txp1 	    ( FBDIMM0B_TX_P[5]   ),
  .atpgmd           ( fsr1_atpgrq_a8[4] ),
  .atpgmq           ( fsr1_atpgmq_a8 ),
  .atpgrd           ( {fsr1_atpgmq_a8,fsr1_atpgrq_a8[1],fsr1_atpgrq_a8[2],fsr1_atpgrq_a8[5],fsr1_atpgrq_a8[0],
		       fsr1_atpgtq_a8[0]} ),
  .atpgrq           ( fsr1_atpgrq_a8[5:0] ),
  .atpgtd           ( {fsr1_atpgrq_a8[3],fsr1_atpgtq_b80[3]} ),
  .atpgtq           ( fsr1_atpgtq_a8[1:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// third serdes macro: RX ports 10-13, TX ports 6-9
   
wiz6c2b8n6d2t    fsr1_b8_1 (
  .bsinitclk 	    ( fsr1_bsinitclk[2]),
  .cfgpll       ({2'b0, mcu0_fsr1_cfgpll2[6:5], 3'b0, mcu0_fsr1_cfgpll2[4:0]}),
  .cfgrx0	({2'b0, mcu0_fsr1_cfgrx10[19:18], 1'b0, mcu0_fsr1_cfgrx10[17:9], 1'b0, mcu0_fsr1_cfgrx10[8], 
		  1'b0, mcu0_fsr1_cfgrx10[7:2], 3'b0, mcu0_fsr1_cfgrx10[1:0]}),
  .cfgrx1	({2'b0, mcu0_fsr1_cfgrx11[19:18], 1'b0, mcu0_fsr1_cfgrx11[17:9], 1'b0, mcu0_fsr1_cfgrx11[8], 
		  1'b0, mcu0_fsr1_cfgrx11[7:2], 3'b0, mcu0_fsr1_cfgrx11[1:0]}),
  .cfgrx2	({2'b0, mcu0_fsr1_cfgrx12[19:18], 1'b0, mcu0_fsr1_cfgrx12[17:9], 1'b0, mcu0_fsr1_cfgrx12[8], 
		  1'b0, mcu0_fsr1_cfgrx12[7:2], 3'b0, mcu0_fsr1_cfgrx12[1:0]}),
  .cfgrx3	({2'b0, mcu0_fsr1_cfgrx13[19:18], 1'b0, mcu0_fsr1_cfgrx13[17:9], 1'b0, mcu0_fsr1_cfgrx13[8], 
		  1'b0, mcu0_fsr1_cfgrx13[7:2], 3'b0, mcu0_fsr1_cfgrx13[1:0]}),
  .cfgtx0	({1'b0, mcu0_fsr1_cfgtx6[15:2], 3'b0, mcu0_fsr1_cfgtx6[1:0]}),
  .cfgtx1	({1'b0, mcu0_fsr1_cfgtx7[15:2], 3'b0, mcu0_fsr1_cfgtx7[1:0]}),
  .cfgtx2	({1'b0, mcu0_fsr1_cfgtx8[15:2], 3'b0, mcu0_fsr1_cfgtx8[1:0]}),
  .cfgtx3	({1'b0, mcu0_fsr1_cfgtx9[15:2], 3'b0, mcu0_fsr1_cfgtx9[1:0]}),
  .fclk 	    ( fsr1_fclk[2]     ),
  .fclrz 	    ( fsr1_fclrz[2]    ),
  .fdi 		    ( fsr1_fdi[2]      ),
  .refclkn 	    ( clk622l_l_8x  ),
  .refclkp 	    ( clk622l_l_8 ),
  .rxbclkin 	    ( fsr1_rxbclkin[13:10] ),
  .rxn0 	    ( FBDIMM0B_RX_N[10]   ),
  .rxn1 	    ( FBDIMM0B_RX_N[11]   ),
  .rxn2 	    ( FBDIMM0B_RX_N[12]   ),
  .rxn3 	    ( FBDIMM0B_RX_N[13]   ),
  .rxp0 	    ( FBDIMM0B_RX_P[10]   ),
  .rxp1 	    ( FBDIMM0B_RX_P[11]   ),
  .rxp2 	    ( FBDIMM0B_RX_P[12]   ),
  .rxp3 	    ( FBDIMM0B_RX_P[13]   ),
  .stcicfg 	    ( fsr1_stcicfg[5:4]  ),
  .stciclk 	    ( fsr1_stciclk[2]  ),
  .stcid 	    ( fsr1_stcid[2]    ),
  .td0 		    ( {mcu0_fsr1_td6[0], mcu0_fsr1_td6[1], mcu0_fsr1_td6[2], mcu0_fsr1_td6[3],
		       mcu0_fsr1_td6[4], mcu0_fsr1_td6[5], mcu0_fsr1_td6[6], mcu0_fsr1_td6[7],
		       mcu0_fsr1_td6[8], mcu0_fsr1_td6[9], mcu0_fsr1_td6[10], mcu0_fsr1_td6[11]} ),
  .td1 		    ( {mcu0_fsr1_td7[0], mcu0_fsr1_td7[1], mcu0_fsr1_td7[2], mcu0_fsr1_td7[3],
		       mcu0_fsr1_td7[4], mcu0_fsr1_td7[5], mcu0_fsr1_td7[6], mcu0_fsr1_td7[7],
		       mcu0_fsr1_td7[8], mcu0_fsr1_td7[9], mcu0_fsr1_td7[10], mcu0_fsr1_td7[11]} ),
  .td2 		    ( {mcu0_fsr1_td8[0], mcu0_fsr1_td8[1], mcu0_fsr1_td8[2], mcu0_fsr1_td8[3],
		       mcu0_fsr1_td8[4], mcu0_fsr1_td8[5], mcu0_fsr1_td8[6], mcu0_fsr1_td8[7],
		       mcu0_fsr1_td8[8], mcu0_fsr1_td8[9], mcu0_fsr1_td8[10], mcu0_fsr1_td8[11]} ),
  .td3 		    ( {mcu0_fsr1_td9[0], mcu0_fsr1_td9[1], mcu0_fsr1_td9[2], mcu0_fsr1_td9[3],
		       mcu0_fsr1_td9[4], mcu0_fsr1_td9[5], mcu0_fsr1_td9[6], mcu0_fsr1_td9[7],
		       mcu0_fsr1_td9[8], mcu0_fsr1_td9[9], mcu0_fsr1_td9[10], mcu0_fsr1_td9[11]} ),
  .testcfg 	    ( {mcu0_fsr1_testcfg2[17:14], 1'b0, mcu0_fsr1_testcfg2[13:11], 1'b0, mcu0_fsr1_testcfg2[10:0]}  ),
  .testclkr 	    ( fsr1_testclkr[2] ),
  .testclkt 	    ( fsr1_testclkt[2] ),
  .txbclkin 	    ( {4{fsr1_txbclkin[2]}} ),
  .amux 	    ( FBDIMM0B_AMUX[2]     ),
  .fdo 		    ( fsr1_fdo[2]      ),
  .rd0 		    ( {fsr1_mcu0_rd10[0], fsr1_mcu0_rd10[1], fsr1_mcu0_rd10[2], fsr1_mcu0_rd10[3], 
		       fsr1_mcu0_rd10[4], fsr1_mcu0_rd10[5], fsr1_mcu0_rd10[6], fsr1_mcu0_rd10[7], 
		       fsr1_mcu0_rd10[8], fsr1_mcu0_rd10[9], fsr1_mcu0_rd10[10], fsr1_mcu0_rd10[11]} ),
  .rd1 		    ( {fsr1_mcu0_rd11[0], fsr1_mcu0_rd11[1], fsr1_mcu0_rd11[2], fsr1_mcu0_rd11[3], 
		       fsr1_mcu0_rd11[4], fsr1_mcu0_rd11[5], fsr1_mcu0_rd11[6], fsr1_mcu0_rd11[7], 
		       fsr1_mcu0_rd11[8], fsr1_mcu0_rd11[9], fsr1_mcu0_rd11[10], fsr1_mcu0_rd11[11]} ),
  .rd2 		    ( {fsr1_mcu0_rd12[0], fsr1_mcu0_rd12[1], fsr1_mcu0_rd12[2], fsr1_mcu0_rd12[3], 
		       fsr1_mcu0_rd12[4], fsr1_mcu0_rd12[5], fsr1_mcu0_rd12[6], fsr1_mcu0_rd12[7], 
		       fsr1_mcu0_rd12[8], fsr1_mcu0_rd12[9], fsr1_mcu0_rd12[10], fsr1_mcu0_rd12[11]} ),
  .rd3 		    ( {fsr1_mcu0_rd13[0], fsr1_mcu0_rd13[1], fsr1_mcu0_rd13[2], fsr1_mcu0_rd13[3], 
		       fsr1_mcu0_rd13[4], fsr1_mcu0_rd13[5], fsr1_mcu0_rd13[6], fsr1_mcu0_rd13[7], 
		       fsr1_mcu0_rd13[8], fsr1_mcu0_rd13[9], fsr1_mcu0_rd13[10], fsr1_mcu0_rd13[11]} ),
  .rdll0 	    ( fsr1_rdll0_b81[1:0] ),
  .rdll1 	    ( fsr1_rdll1_b81[1:0] ),
  .rdll2 	    ( fsr1_rdll2_b81[1:0] ),
  .rdll3 	    ( fsr1_rdll3_b81[1:0] ),
  .rxbclk 	    ( fsr1_mcu0_rxbclk[13:10]   ),
  .rxbclklln 	    ( fsr1_rxbclklln_unused[13:10] ),
  .rxbclkllp 	    ( fsr1_rxbclkllp_unused[13:10] ),
  .stciq 	    ( fsr1_stciq[2]    ),
  .stspll 	    ( {fsr1_mcu0_stspll_b81[2:0], fsr1_mcu0_stspll_lock[2]} ),
  .stsrx0 	    ( {fsr1_mcu0_stsrx10_unused[2:1], fsr1_mcu0_stsrx_bsrxn[10], fsr1_mcu0_stsrx_bsrxp[10],
		       fsr1_mcu0_stsrx_losdtct[10], fsr1_mcu0_stsrx10_unused[0], fsr1_mcu0_stsrx_sync[10],
		       fsr1_mcu0_stsrx_testfail[10]} ),
  .stsrx1 	    ( {fsr1_mcu0_stsrx11_unused[2:1], fsr1_mcu0_stsrx_bsrxn[11], fsr1_mcu0_stsrx_bsrxp[11],
		       fsr1_mcu0_stsrx_losdtct[11], fsr1_mcu0_stsrx11_unused[0], fsr1_mcu0_stsrx_sync[11],
		       fsr1_mcu0_stsrx_testfail[11]} ),
  .stsrx2 	    ( {fsr1_mcu0_stsrx12_unused[2:1], fsr1_mcu0_stsrx_bsrxn[12], fsr1_mcu0_stsrx_bsrxp[12],
		       fsr1_mcu0_stsrx_losdtct[12], fsr1_mcu0_stsrx12_unused[0], fsr1_mcu0_stsrx_sync[12],
		       fsr1_mcu0_stsrx_testfail[12]} ),
  .stsrx3 	    ( {fsr1_mcu0_stsrx13_unused[2:1], fsr1_mcu0_stsrx_bsrxn[13], fsr1_mcu0_stsrx_bsrxp[13],
		       fsr1_mcu0_stsrx_losdtct[13], fsr1_mcu0_stsrx13_unused[0], fsr1_mcu0_stsrx_sync[13],
		       fsr1_mcu0_stsrx_testfail[13]} ),
  .ststx0 	    ( {fsr1_mcu0_ststx6_unused[2:0], fsr1_mcu0_ststx_testfail[6]} ),
  .ststx1 	    ( {fsr1_mcu0_ststx7_unused[2:0], fsr1_mcu0_ststx_testfail[7]} ),
  .ststx2 	    ( {fsr1_mcu0_ststx8_unused[2:0], fsr1_mcu0_ststx_testfail[8]} ),
  .ststx3 	    ( {fsr1_mcu0_ststx9_unused[2:0], fsr1_mcu0_ststx_testfail[9]} ),
  .txbclk 	    ( fsr1_txbclk_unused[9:6]   ),
  .txn0 	    ( FBDIMM0B_TX_N[6]   ),
  .txn1 	    ( FBDIMM0B_TX_N[7]   ),
  .txn2 	    ( FBDIMM0B_TX_N[8]   ),
  .txn3 	    ( FBDIMM0B_TX_N[9]   ),
  .txp0 	    ( FBDIMM0B_TX_P[6]   ),
  .txp1 	    ( FBDIMM0B_TX_P[7]   ),
  .txp2 	    ( FBDIMM0B_TX_P[8]   ),
  .txp3 	    ( FBDIMM0B_TX_P[9]   ),
  .atpgmd           ( fsr1_atpgtq_b81[1] ),
  .atpgmq           ( fsr1_atpgmq_b81 ),
  .atpgrd           ( {fsr1_atpgrq_b81[2],fsr1_atpgtq_b81[2],fsr1_atpgrq_b81[0],fsr1_atpgtq_b81[0]} ),
  .atpgrq           ( fsr1_atpgrq_b81[3:0] ),
  .atpgtd           ( {fsr1_atpgrq_b81[3],fsr1_atpgmq_b81,fsr1_atpgrq_b81[1],fsr1_atpgtq_a8[1]} ),
  .atpgtq           ( fsr1_atpgtq_b81[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );    

// first serdes macro: rx ports 0-3, tx ports 0-3

wiz6c2b8n6d2t    fsr2_b8_0 (
  .bsinitclk 	    ( fsr2_bsinitclk[0]),
  .cfgpll       ({2'b0, mcu1_fsr2_cfgpll0[6:5], 3'b0, mcu1_fsr2_cfgpll0[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr2_cfgrx0[19:18], 1'b0, mcu1_fsr2_cfgrx0[17:9], 1'b0, mcu1_fsr2_cfgrx0[8], 
		  1'b0, mcu1_fsr2_cfgrx0[7:2], 3'b0, mcu1_fsr2_cfgrx0[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr2_cfgrx1[19:18], 1'b0, mcu1_fsr2_cfgrx1[17:9], 1'b0, mcu1_fsr2_cfgrx1[8], 
		  1'b0, mcu1_fsr2_cfgrx1[7:2], 3'b0, mcu1_fsr2_cfgrx1[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr2_cfgrx2[19:18], 1'b0, mcu1_fsr2_cfgrx2[17:9], 1'b0, mcu1_fsr2_cfgrx2[8], 
		  1'b0, mcu1_fsr2_cfgrx2[7:2], 3'b0, mcu1_fsr2_cfgrx2[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr2_cfgrx3[19:18], 1'b0, mcu1_fsr2_cfgrx3[17:9], 1'b0, mcu1_fsr2_cfgrx3[8], 
		  1'b0, mcu1_fsr2_cfgrx3[7:2], 3'b0, mcu1_fsr2_cfgrx3[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr2_cfgtx0[15:2], 3'b0, mcu1_fsr2_cfgtx0[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr2_cfgtx1[15:2], 3'b0, mcu1_fsr2_cfgtx1[1:0]}),
  .cfgtx2	({1'b0, mcu1_fsr2_cfgtx2[15:2], 3'b0, mcu1_fsr2_cfgtx2[1:0]}),
  .cfgtx3	({1'b0, mcu1_fsr2_cfgtx3[15:2], 3'b0, mcu1_fsr2_cfgtx3[1:0]}),
  .fclk 	    ( fsr2_fclk[0]     ),
  .fclrz 	    ( fsr2_fclrz[0]    ),
  .fdi 		    ( fsr2_fdi[0]      ),
  .refclkn 	    ( clk622l_l_6x  ),
  .refclkp 	    ( clk622l_l_6 ),
  .rxbclkin 	    ( fsr2_rxbclkin[3:0] ),
  .rxn0 	    ( FBDIMM1A_RX_N[0]   ),
  .rxn1 	    ( FBDIMM1A_RX_N[1]   ),
  .rxn2 	    ( FBDIMM1A_RX_N[2]   ),
  .rxn3 	    ( FBDIMM1A_RX_N[3]   ),
  .rxp0 	    ( FBDIMM1A_RX_P[0]   ),
  .rxp1 	    ( FBDIMM1A_RX_P[1]   ),
  .rxp2 	    ( FBDIMM1A_RX_P[2]   ),
  .rxp3 	    ( FBDIMM1A_RX_P[3]   ),
  .stcicfg 	    ( fsr2_stcicfg[1:0]  ),
  .stciclk 	    ( fsr2_stciclk[0]  ),
  .stcid 	    ( fsr2_stcid[0]    ),
  .td0 		    ( {mcu1_fsr2_td0[0], mcu1_fsr2_td0[1], mcu1_fsr2_td0[2], mcu1_fsr2_td0[3],
		       mcu1_fsr2_td0[4], mcu1_fsr2_td0[5], mcu1_fsr2_td0[6], mcu1_fsr2_td0[7],
		       mcu1_fsr2_td0[8], mcu1_fsr2_td0[9], mcu1_fsr2_td0[10], mcu1_fsr2_td0[11]} ),
  .td1 		    ( {mcu1_fsr2_td1[0], mcu1_fsr2_td1[1], mcu1_fsr2_td1[2], mcu1_fsr2_td1[3],
		       mcu1_fsr2_td1[4], mcu1_fsr2_td1[5], mcu1_fsr2_td1[6], mcu1_fsr2_td1[7],
		       mcu1_fsr2_td1[8], mcu1_fsr2_td1[9], mcu1_fsr2_td1[10], mcu1_fsr2_td1[11]} ),
  .td2 		    ( {mcu1_fsr2_td2[0], mcu1_fsr2_td2[1], mcu1_fsr2_td2[2], mcu1_fsr2_td2[3],
		       mcu1_fsr2_td2[4], mcu1_fsr2_td2[5], mcu1_fsr2_td2[6], mcu1_fsr2_td2[7],
		       mcu1_fsr2_td2[8], mcu1_fsr2_td2[9], mcu1_fsr2_td2[10], mcu1_fsr2_td2[11]} ),
  .td3 		    ( {mcu1_fsr2_td3[0], mcu1_fsr2_td3[1], mcu1_fsr2_td3[2], mcu1_fsr2_td3[3],
		       mcu1_fsr2_td3[4], mcu1_fsr2_td3[5], mcu1_fsr2_td3[6], mcu1_fsr2_td3[7],
		       mcu1_fsr2_td3[8], mcu1_fsr2_td3[9], mcu1_fsr2_td3[10], mcu1_fsr2_td3[11]} ),
  .testcfg 	    ( {mcu1_fsr2_testcfg0[17:14], 1'b0, mcu1_fsr2_testcfg0[13:11], 1'b0, mcu1_fsr2_testcfg0[10:0]}  ),
  .testclkr 	    ( fsr2_testclkr[0] ),
  .testclkt 	    ( fsr2_testclkt[0] ),
  .txbclkin 	    ( {4{fsr2_txbclkin[0]}} ),
  .amux 	    ( FBDIMM1A_AMUX[0]     ),
  .fdo 	 	    ( fsr2_fdo[0]      ),
  .rd0 		    ( {fsr2_mcu1_rd0[0], fsr2_mcu1_rd0[1], fsr2_mcu1_rd0[2], fsr2_mcu1_rd0[3], 
		       fsr2_mcu1_rd0[4], fsr2_mcu1_rd0[5], fsr2_mcu1_rd0[6], fsr2_mcu1_rd0[7], 
		       fsr2_mcu1_rd0[8], fsr2_mcu1_rd0[9], fsr2_mcu1_rd0[10], fsr2_mcu1_rd0[11]} ),
  .rd1 		    ( {fsr2_mcu1_rd1[0], fsr2_mcu1_rd1[1], fsr2_mcu1_rd1[2], fsr2_mcu1_rd1[3], 
		       fsr2_mcu1_rd1[4], fsr2_mcu1_rd1[5], fsr2_mcu1_rd1[6], fsr2_mcu1_rd1[7], 
		       fsr2_mcu1_rd1[8], fsr2_mcu1_rd1[9], fsr2_mcu1_rd1[10], fsr2_mcu1_rd1[11]} ),
  .rd2 		    ( {fsr2_mcu1_rd2[0], fsr2_mcu1_rd2[1], fsr2_mcu1_rd2[2], fsr2_mcu1_rd2[3], 
		       fsr2_mcu1_rd2[4], fsr2_mcu1_rd2[5], fsr2_mcu1_rd2[6], fsr2_mcu1_rd2[7], 
		       fsr2_mcu1_rd2[8], fsr2_mcu1_rd2[9], fsr2_mcu1_rd2[10], fsr2_mcu1_rd2[11]} ),
  .rd3 		    ( {fsr2_mcu1_rd3[0], fsr2_mcu1_rd3[1], fsr2_mcu1_rd3[2], fsr2_mcu1_rd3[3], 
		       fsr2_mcu1_rd3[4], fsr2_mcu1_rd3[5], fsr2_mcu1_rd3[6], fsr2_mcu1_rd3[7], 
		       fsr2_mcu1_rd3[8], fsr2_mcu1_rd3[9], fsr2_mcu1_rd3[10], fsr2_mcu1_rd3[11]} ),
  .rdll0 	    ( fsr2_rdll0_b80[1:0] ),
  .rdll1 	    ( fsr2_rdll1_b80[1:0] ),
  .rdll2 	    ( fsr2_rdll2_b80[1:0] ),
  .rdll3 	    ( fsr2_rdll3_b80[1:0] ),
  .rxbclk 	    ( fsr2_mcu1_rxbclk[3:0]   ),
  .rxbclklln 	    ( fsr2_rxbclklln_unused[3:0] ),
  .rxbclkllp 	    ( fsr2_rxbclkllp_unused[3:0] ),
  .stciq 	    ( fsr2_stciq[0]    ),
  .stspll 	    ( {fsr2_mcu1_stspll_b80[2:0], fsr2_mcu1_stspll_lock[0]} ),
  .stsrx0 	    ( {fsr2_mcu1_stsrx0_unused[2:1], fsr2_mcu1_stsrx_bsrxn[0], fsr2_mcu1_stsrx_bsrxp[0],
		       fsr2_mcu1_stsrx_losdtct[0], fsr2_mcu1_stsrx0_unused[0], fsr2_mcu1_stsrx_sync[0],
		       fsr2_mcu1_stsrx_testfail[0]} ),
  .stsrx1 	    ( {fsr2_mcu1_stsrx1_unused[2:1], fsr2_mcu1_stsrx_bsrxn[1], fsr2_mcu1_stsrx_bsrxp[1],
		       fsr2_mcu1_stsrx_losdtct[1], fsr2_mcu1_stsrx1_unused[0], fsr2_mcu1_stsrx_sync[1],
		       fsr2_mcu1_stsrx_testfail[1]} ),
  .stsrx2 	    ( {fsr2_mcu1_stsrx2_unused[2:1], fsr2_mcu1_stsrx_bsrxn[2], fsr2_mcu1_stsrx_bsrxp[2],
		       fsr2_mcu1_stsrx_losdtct[2], fsr2_mcu1_stsrx2_unused[0], fsr2_mcu1_stsrx_sync[2],
		       fsr2_mcu1_stsrx_testfail[2]} ),
  .stsrx3 	    ( {fsr2_mcu1_stsrx3_unused[2:1], fsr2_mcu1_stsrx_bsrxn[3], fsr2_mcu1_stsrx_bsrxp[3],
		       fsr2_mcu1_stsrx_losdtct[3], fsr2_mcu1_stsrx3_unused[0], fsr2_mcu1_stsrx_sync[3],
		       fsr2_mcu1_stsrx_testfail[3]} ),
  .ststx0 	    ( {fsr2_mcu1_ststx0_unused[2:0], fsr2_mcu1_ststx_testfail[0]} ),
  .ststx1 	    ( {fsr2_mcu1_ststx1_unused[2:0], fsr2_mcu1_ststx_testfail[1]} ),
  .ststx2 	    ( {fsr2_mcu1_ststx2_unused[2:0], fsr2_mcu1_ststx_testfail[2]} ),
  .ststx3 	    ( {fsr2_mcu1_ststx3_unused[2:0], fsr2_mcu1_ststx_testfail[3]} ),
  .txbclk 	    ( fsr2_txbclk_unused[3:0]   ),
  .txn0 	    ( FBDIMM1A_TX_N[0]   ),
  .txn1 	    ( FBDIMM1A_TX_N[1]   ),
  .txn2 	    ( FBDIMM1A_TX_N[2]   ),
  .txn3 	    ( FBDIMM1A_TX_N[3]   ),
  .txp0 	    ( FBDIMM1A_TX_P[0]   ),
  .txp1 	    ( FBDIMM1A_TX_P[1]   ),
  .txp2 	    ( FBDIMM1A_TX_P[2]   ),
  .txp3 	    ( FBDIMM1A_TX_P[3]   ),
  .atpgmd           ( fsr2_atpgtq_b80[1] ),
  .atpgmq           ( fsr2_atpgmq_b80 ),
  .atpgrd           ( {fsr2_atpgrq_b80[2],fsr2_atpgtq_b80[2],fsr2_atpgrq_b80[0],fsr2_atpgtq_b80[0]} ),
  .atpgrq           ( fsr2_atpgrq_b80[3:0] ),
  .atpgtd           ( {fsr2_atpgrq_b80[3],fsr2_atpgmq_b80,fsr2_atpgrq_b80[1],fsr1_atpgtq_b81[3]} ),
  .atpgtq           ( fsr2_atpgtq_b80[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );


// second serdes macro: RX ports 4-9, TX ports 4-5
   
wiz6c2a8n6d2t fsr2_a8 (
  .bsinitclk 	    ( fsr2_bsinitclk[1]),
  .cfgpll       ({2'b0, mcu1_fsr2_cfgpll1[6:5], 3'b0, mcu1_fsr2_cfgpll1[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr2_cfgrx4[19:18], 1'b0, mcu1_fsr2_cfgrx4[17:9], 1'b0, mcu1_fsr2_cfgrx4[8], 
		  1'b0, mcu1_fsr2_cfgrx4[7:2], 3'b0, mcu1_fsr2_cfgrx4[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr2_cfgrx5[19:18], 1'b0, mcu1_fsr2_cfgrx5[17:9], 1'b0, mcu1_fsr2_cfgrx5[8], 
		  1'b0, mcu1_fsr2_cfgrx5[7:2], 3'b0, mcu1_fsr2_cfgrx5[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr2_cfgrx6[19:18], 1'b0, mcu1_fsr2_cfgrx6[17:9], 1'b0, mcu1_fsr2_cfgrx6[8], 
		  1'b0, mcu1_fsr2_cfgrx6[7:2], 3'b0, mcu1_fsr2_cfgrx6[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr2_cfgrx7[19:18], 1'b0, mcu1_fsr2_cfgrx7[17:9], 1'b0, mcu1_fsr2_cfgrx7[8], 
		  1'b0, mcu1_fsr2_cfgrx7[7:2], 3'b0, mcu1_fsr2_cfgrx7[1:0]}),
  .cfgrx4	({2'b0, mcu1_fsr2_cfgrx8[19:18], 1'b0, mcu1_fsr2_cfgrx8[17:9], 1'b0, mcu1_fsr2_cfgrx8[8], 
		  1'b0, mcu1_fsr2_cfgrx8[7:2], 3'b0, mcu1_fsr2_cfgrx8[1:0]}),
  .cfgrx5	({2'b0, mcu1_fsr2_cfgrx9[19:18], 1'b0, mcu1_fsr2_cfgrx9[17:9], 1'b0, mcu1_fsr2_cfgrx9[8], 
		  1'b0, mcu1_fsr2_cfgrx9[7:2], 3'b0, mcu1_fsr2_cfgrx9[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr2_cfgtx4[15:2], 3'b0, mcu1_fsr2_cfgtx4[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr2_cfgtx5[15:2], 3'b0, mcu1_fsr2_cfgtx5[1:0]}),
  .fclk 	    ( fsr2_fclk[1]     ),
  .fclrz 	    ( fsr2_fclrz[1]    ),
  .fdi 		    ( fsr2_fdi[1]      ),
  .refclkn 	    ( clk622l_l_5x  ),
  .refclkp 	    ( clk622l_l_5  ),
  .rxbclkin 	    ( fsr2_rxbclkin[9:4] ),
  .rxn0 	    ( FBDIMM1A_RX_N[4]   ),
  .rxn1 	    ( FBDIMM1A_RX_N[5]   ),
  .rxn2 	    ( FBDIMM1A_RX_N[6]   ),
  .rxn3 	    ( FBDIMM1A_RX_N[7]   ),
  .rxn4 	    ( FBDIMM1A_RX_N[8]   ),
  .rxn5 	    ( FBDIMM1A_RX_N[9]   ),
  .rxp0 	    ( FBDIMM1A_RX_P[4]   ),
  .rxp1 	    ( FBDIMM1A_RX_P[5]   ),
  .rxp2 	    ( FBDIMM1A_RX_P[6]   ),
  .rxp3 	    ( FBDIMM1A_RX_P[7]   ),
  .rxp4 	    ( FBDIMM1A_RX_P[8]   ),
  .rxp5 	    ( FBDIMM1A_RX_P[9]   ),
  .stcicfg 	    ( fsr2_stcicfg[3:2]  ),
  .stciclk 	    ( fsr2_stciclk[1]  ),
  .stcid 	    ( fsr2_stcid[1]    ),
  .td0 		    ( {mcu1_fsr2_td4[0], mcu1_fsr2_td4[1], mcu1_fsr2_td4[2], mcu1_fsr2_td4[3],
			       mcu1_fsr2_td4[4], mcu1_fsr2_td4[5], mcu1_fsr2_td4[6], mcu1_fsr2_td4[7],
			       mcu1_fsr2_td4[8], mcu1_fsr2_td4[9], mcu1_fsr2_td4[10], mcu1_fsr2_td4[11]} ),
  .td1 		    ( {mcu1_fsr2_td5[0], mcu1_fsr2_td5[1], mcu1_fsr2_td5[2], mcu1_fsr2_td5[3],
			       mcu1_fsr2_td5[4], mcu1_fsr2_td5[5], mcu1_fsr2_td5[6], mcu1_fsr2_td5[7],
			       mcu1_fsr2_td5[8], mcu1_fsr2_td5[9], mcu1_fsr2_td5[10], mcu1_fsr2_td5[11]} ),
  .testcfg 	    ( {mcu1_fsr2_testcfg1[17:14], 1'b0, mcu1_fsr2_testcfg1[13:11], 1'b0, mcu1_fsr2_testcfg1[10:0]}  ),
  .testclkr 	    ( fsr2_testclkr[1] ),
  .testclkt 	    ( fsr2_testclkt[1] ),
  .txbclkin 	    ( {2{fsr2_txbclkin[1]}} ),
  .amux 	    ( FBDIMM1A_AMUX[1]     ),
  .fdo 		    ( fsr2_fdo[1]      ),
  .rd0 		    ( {fsr2_mcu1_rd4[0], fsr2_mcu1_rd4[1], fsr2_mcu1_rd4[2], fsr2_mcu1_rd4[3], 
		       fsr2_mcu1_rd4[4], fsr2_mcu1_rd4[5], fsr2_mcu1_rd4[6], fsr2_mcu1_rd4[7], 
		       fsr2_mcu1_rd4[8], fsr2_mcu1_rd4[9], fsr2_mcu1_rd4[10], fsr2_mcu1_rd4[11]} ),
  .rd1 		    ( {fsr2_mcu1_rd5[0], fsr2_mcu1_rd5[1], fsr2_mcu1_rd5[2], fsr2_mcu1_rd5[3], 
		       fsr2_mcu1_rd5[4], fsr2_mcu1_rd5[5], fsr2_mcu1_rd5[6], fsr2_mcu1_rd5[7], 
		       fsr2_mcu1_rd5[8], fsr2_mcu1_rd5[9], fsr2_mcu1_rd5[10], fsr2_mcu1_rd5[11]} ),
  .rd2 		    ( {fsr2_mcu1_rd6[0], fsr2_mcu1_rd6[1], fsr2_mcu1_rd6[2], fsr2_mcu1_rd6[3], 
		       fsr2_mcu1_rd6[4], fsr2_mcu1_rd6[5], fsr2_mcu1_rd6[6], fsr2_mcu1_rd6[7], 
		       fsr2_mcu1_rd6[8], fsr2_mcu1_rd6[9], fsr2_mcu1_rd6[10], fsr2_mcu1_rd6[11]} ),
  .rd3 		    ( {fsr2_mcu1_rd7[0], fsr2_mcu1_rd7[1], fsr2_mcu1_rd7[2], fsr2_mcu1_rd7[3], 
		       fsr2_mcu1_rd7[4], fsr2_mcu1_rd7[5], fsr2_mcu1_rd7[6], fsr2_mcu1_rd7[7], 
		       fsr2_mcu1_rd7[8], fsr2_mcu1_rd7[9], fsr2_mcu1_rd7[10], fsr2_mcu1_rd7[11]} ),
  .rd4 		    ( {fsr2_mcu1_rd8[0], fsr2_mcu1_rd8[1], fsr2_mcu1_rd8[2], fsr2_mcu1_rd8[3], 
		       fsr2_mcu1_rd8[4], fsr2_mcu1_rd8[5], fsr2_mcu1_rd8[6], fsr2_mcu1_rd8[7], 
		       fsr2_mcu1_rd8[8], fsr2_mcu1_rd8[9], fsr2_mcu1_rd8[10], fsr2_mcu1_rd8[11]} ),
  .rd5 		    ( {fsr2_mcu1_rd9[0], fsr2_mcu1_rd9[1], fsr2_mcu1_rd9[2], fsr2_mcu1_rd9[3], 
		       fsr2_mcu1_rd9[4], fsr2_mcu1_rd9[5], fsr2_mcu1_rd9[6], fsr2_mcu1_rd9[7], 
		       fsr2_mcu1_rd9[8], fsr2_mcu1_rd9[9], fsr2_mcu1_rd9[10], fsr2_mcu1_rd9[11]} ),
  .rdll0 	    ( fsr2_rdll0_b62[1:0] ),
  .rdll1 	    ( fsr2_rdll1_b62[1:0] ),
  .rdll2 	    ( fsr2_rdll2_b62[1:0] ),
  .rdll3 	    ( fsr2_rdll3_b62[1:0] ),
  .rxbclk 	    ( fsr2_mcu1_rxbclk[9:4]   ),
  .rxbclklln 	    ( fsr2_rxbclklln_unused[9:4] ),
  .rxbclkllp 	    ( fsr2_rxbclkllp_unused[9:4] ),
  .stciq 	    ( fsr2_stciq[1]    ),
  .stspll 	    ( {fsr2_mcu1_stspll_b62[2:0], fsr2_mcu1_stspll_lock[1]} ),
  .stsrx0 	    ( {fsr2_mcu1_stsrx4_unused[2:1], fsr2_mcu1_stsrx_bsrxn[4], fsr2_mcu1_stsrx_bsrxp[4],
		       fsr2_mcu1_stsrx_losdtct[4], fsr2_mcu1_stsrx4_unused[0], fsr2_mcu1_stsrx_sync[4],
		       fsr2_mcu1_stsrx_testfail[4]} ),
  .stsrx1 	    ( {fsr2_mcu1_stsrx5_unused[2:1], fsr2_mcu1_stsrx_bsrxn[5], fsr2_mcu1_stsrx_bsrxp[5],
		       fsr2_mcu1_stsrx_losdtct[5], fsr2_mcu1_stsrx5_unused[0], fsr2_mcu1_stsrx_sync[5],
		       fsr2_mcu1_stsrx_testfail[5]} ),
  .stsrx2 	    ( {fsr2_mcu1_stsrx6_unused[2:1], fsr2_mcu1_stsrx_bsrxn[6], fsr2_mcu1_stsrx_bsrxp[6],
		       fsr2_mcu1_stsrx_losdtct[6], fsr2_mcu1_stsrx6_unused[0], fsr2_mcu1_stsrx_sync[6],
		       fsr2_mcu1_stsrx_testfail[6]} ),
  .stsrx3 	    ( {fsr2_mcu1_stsrx7_unused[2:1], fsr2_mcu1_stsrx_bsrxn[7], fsr2_mcu1_stsrx_bsrxp[7],
		       fsr2_mcu1_stsrx_losdtct[7], fsr2_mcu1_stsrx7_unused[0], fsr2_mcu1_stsrx_sync[7],
		       fsr2_mcu1_stsrx_testfail[7]} ),
  .stsrx4 	    ( {fsr2_mcu1_stsrx8_unused[2:1], fsr2_mcu1_stsrx_bsrxn[8], fsr2_mcu1_stsrx_bsrxp[8],
		       fsr2_mcu1_stsrx_losdtct[8], fsr2_mcu1_stsrx8_unused[0], fsr2_mcu1_stsrx_sync[8],
		       fsr2_mcu1_stsrx_testfail[8]} ),
  .stsrx5 	    ( {fsr2_mcu1_stsrx9_unused[2:1], fsr2_mcu1_stsrx_bsrxn[9], fsr2_mcu1_stsrx_bsrxp[9],
		       fsr2_mcu1_stsrx_losdtct[9], fsr2_mcu1_stsrx9_unused[0], fsr2_mcu1_stsrx_sync[9],
		       fsr2_mcu1_stsrx_testfail[9]} ),
  .ststx0 	    ( {fsr2_mcu1_ststx4_unused[2:0], fsr2_mcu1_ststx_testfail[4]} ),
  .ststx1 	    ( {fsr2_mcu1_ststx5_unused[2:0], fsr2_mcu1_ststx_testfail[5]} ),
  .txbclk 	    ( fsr2_txbclk_unused[5:4]   ),
  .txn0 	    ( FBDIMM1A_TX_N[4]   ),
  .txn1 	    ( FBDIMM1A_TX_N[5]   ),
  .txp0 	    ( FBDIMM1A_TX_P[4]   ),
  .txp1 	    ( FBDIMM1A_TX_P[5]   ),
  .atpgmd           ( fsr2_atpgrq_a8[4] ),
  .atpgmq           ( fsr2_atpgmq_a8 ),
  .atpgrd           ( {fsr2_atpgmq_a8,fsr2_atpgrq_a8[1],fsr2_atpgrq_a8[2],fsr2_atpgrq_a8[5],fsr2_atpgrq_a8[0],
		       fsr2_atpgtq_a8[0]} ),
  .atpgrq           ( fsr2_atpgrq_a8[5:0] ),
  .atpgtd           ( {fsr2_atpgrq_a8[3],fsr2_atpgtq_b80[3]} ),
  .atpgtq           ( fsr2_atpgtq_a8[1:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// third serdes macro: RX ports 10-13, TX ports 6-9
   
wiz6c2b8n6d2t    fsr2_b8_1 (
  .bsinitclk 	    ( fsr2_bsinitclk[2]),
  .cfgpll       ({2'b0, mcu1_fsr2_cfgpll2[6:5], 3'b0, mcu1_fsr2_cfgpll2[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr2_cfgrx10[19:18], 1'b0, mcu1_fsr2_cfgrx10[17:9], 1'b0, mcu1_fsr2_cfgrx10[8], 
		  1'b0, mcu1_fsr2_cfgrx10[7:2], 3'b0, mcu1_fsr2_cfgrx10[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr2_cfgrx11[19:18], 1'b0, mcu1_fsr2_cfgrx11[17:9], 1'b0, mcu1_fsr2_cfgrx11[8], 
		  1'b0, mcu1_fsr2_cfgrx11[7:2], 3'b0, mcu1_fsr2_cfgrx11[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr2_cfgrx12[19:18], 1'b0, mcu1_fsr2_cfgrx12[17:9], 1'b0, mcu1_fsr2_cfgrx12[8], 
		  1'b0, mcu1_fsr2_cfgrx12[7:2], 3'b0, mcu1_fsr2_cfgrx12[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr2_cfgrx13[19:18], 1'b0, mcu1_fsr2_cfgrx13[17:9], 1'b0, mcu1_fsr2_cfgrx13[8], 
		  1'b0, mcu1_fsr2_cfgrx13[7:2], 3'b0, mcu1_fsr2_cfgrx13[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr2_cfgtx6[15:2], 3'b0, mcu1_fsr2_cfgtx6[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr2_cfgtx7[15:2], 3'b0, mcu1_fsr2_cfgtx7[1:0]}),
  .cfgtx2	({1'b0, mcu1_fsr2_cfgtx8[15:2], 3'b0, mcu1_fsr2_cfgtx8[1:0]}),
  .cfgtx3	({1'b0, mcu1_fsr2_cfgtx9[15:2], 3'b0, mcu1_fsr2_cfgtx9[1:0]}),
  .fclk 	    ( fsr2_fclk[2]     ),
  .fclrz 	    ( fsr2_fclrz[2]    ),
  .fdi 		    ( fsr2_fdi[2]      ),
  .refclkn 	    ( clk622l_l_4x  ),
  .refclkp 	    ( clk622l_l_4  ),
  .rxbclkin 	    ( fsr2_rxbclkin[13:10] ),
  .rxn0 	    ( FBDIMM1A_RX_N[10]   ),
  .rxn1 	    ( FBDIMM1A_RX_N[11]   ),
  .rxn2 	    ( FBDIMM1A_RX_N[12]   ),
  .rxn3 	    ( FBDIMM1A_RX_N[13]   ),
  .rxp0 	    ( FBDIMM1A_RX_P[10]   ),
  .rxp1 	    ( FBDIMM1A_RX_P[11]   ),
  .rxp2 	    ( FBDIMM1A_RX_P[12]   ),
  .rxp3 	    ( FBDIMM1A_RX_P[13]   ),
  .stcicfg 	    ( fsr2_stcicfg[5:4]  ),
  .stciclk 	    ( fsr2_stciclk[2]  ),
  .stcid 	    ( fsr2_stcid[2]    ),
  .td0 		    ( {mcu1_fsr2_td6[0], mcu1_fsr2_td6[1], mcu1_fsr2_td6[2], mcu1_fsr2_td6[3],
		       mcu1_fsr2_td6[4], mcu1_fsr2_td6[5], mcu1_fsr2_td6[6], mcu1_fsr2_td6[7],
		       mcu1_fsr2_td6[8], mcu1_fsr2_td6[9], mcu1_fsr2_td6[10], mcu1_fsr2_td6[11]} ),
  .td1 		    ( {mcu1_fsr2_td7[0], mcu1_fsr2_td7[1], mcu1_fsr2_td7[2], mcu1_fsr2_td7[3],
		       mcu1_fsr2_td7[4], mcu1_fsr2_td7[5], mcu1_fsr2_td7[6], mcu1_fsr2_td7[7],
		       mcu1_fsr2_td7[8], mcu1_fsr2_td7[9], mcu1_fsr2_td7[10], mcu1_fsr2_td7[11]} ),
  .td2 		    ( {mcu1_fsr2_td8[0], mcu1_fsr2_td8[1], mcu1_fsr2_td8[2], mcu1_fsr2_td8[3],
		       mcu1_fsr2_td8[4], mcu1_fsr2_td8[5], mcu1_fsr2_td8[6], mcu1_fsr2_td8[7],
		       mcu1_fsr2_td8[8], mcu1_fsr2_td8[9], mcu1_fsr2_td8[10], mcu1_fsr2_td8[11]} ),
  .td3 		    ( {mcu1_fsr2_td9[0], mcu1_fsr2_td9[1], mcu1_fsr2_td9[2], mcu1_fsr2_td9[3],
		       mcu1_fsr2_td9[4], mcu1_fsr2_td9[5], mcu1_fsr2_td9[6], mcu1_fsr2_td9[7],
		       mcu1_fsr2_td9[8], mcu1_fsr2_td9[9], mcu1_fsr2_td9[10], mcu1_fsr2_td9[11]} ),
  .testcfg 	    ( {mcu1_fsr2_testcfg2[17:14], 1'b0, mcu1_fsr2_testcfg2[13:11], 1'b0, mcu1_fsr2_testcfg2[10:0]}  ),
  .testclkr 	    ( fsr2_testclkr[2] ),
  .testclkt 	    ( fsr2_testclkt[2] ),
  .txbclkin 	    ( {4{fsr2_txbclkin[2]}} ),
  .amux 	    ( FBDIMM1A_AMUX[2]     ),
  .fdo 		    ( fsr2_fdo[2]      ),
  .rd0 		    ( {fsr2_mcu1_rd10[0], fsr2_mcu1_rd10[1], fsr2_mcu1_rd10[2], fsr2_mcu1_rd10[3], 
		       fsr2_mcu1_rd10[4], fsr2_mcu1_rd10[5], fsr2_mcu1_rd10[6], fsr2_mcu1_rd10[7], 
		       fsr2_mcu1_rd10[8], fsr2_mcu1_rd10[9], fsr2_mcu1_rd10[10], fsr2_mcu1_rd10[11]} ),
  .rd1 		    ( {fsr2_mcu1_rd11[0], fsr2_mcu1_rd11[1], fsr2_mcu1_rd11[2], fsr2_mcu1_rd11[3], 
		       fsr2_mcu1_rd11[4], fsr2_mcu1_rd11[5], fsr2_mcu1_rd11[6], fsr2_mcu1_rd11[7], 
		       fsr2_mcu1_rd11[8], fsr2_mcu1_rd11[9], fsr2_mcu1_rd11[10], fsr2_mcu1_rd11[11]} ),
  .rd2 		    ( {fsr2_mcu1_rd12[0], fsr2_mcu1_rd12[1], fsr2_mcu1_rd12[2], fsr2_mcu1_rd12[3], 
		       fsr2_mcu1_rd12[4], fsr2_mcu1_rd12[5], fsr2_mcu1_rd12[6], fsr2_mcu1_rd12[7], 
		       fsr2_mcu1_rd12[8], fsr2_mcu1_rd12[9], fsr2_mcu1_rd12[10], fsr2_mcu1_rd12[11]} ),
  .rd3 		    ( {fsr2_mcu1_rd13[0], fsr2_mcu1_rd13[1], fsr2_mcu1_rd13[2], fsr2_mcu1_rd13[3], 
		       fsr2_mcu1_rd13[4], fsr2_mcu1_rd13[5], fsr2_mcu1_rd13[6], fsr2_mcu1_rd13[7], 
		       fsr2_mcu1_rd13[8], fsr2_mcu1_rd13[9], fsr2_mcu1_rd13[10], fsr2_mcu1_rd13[11]} ),
  .rdll0 	    ( fsr2_rdll0_b81[1:0] ),
  .rdll1 	    ( fsr2_rdll1_b81[1:0] ),
  .rdll2 	    ( fsr2_rdll2_b81[1:0] ),
  .rdll3 	    ( fsr2_rdll3_b81[1:0] ),
  .rxbclk 	    ( fsr2_mcu1_rxbclk[13:10]   ),
  .rxbclklln 	    ( fsr2_rxbclklln_unused[13:10] ),
  .rxbclkllp 	    ( fsr2_rxbclkllp_unused[13:10] ),
  .stciq 	    ( fsr2_stciq[2]    ),
  .stspll 	    ( {fsr2_mcu1_stspll_b81[2:0], fsr2_mcu1_stspll_lock[2]} ),
  .stsrx0 	    ( {fsr2_mcu1_stsrx10_unused[2:1], fsr2_mcu1_stsrx_bsrxn[10], fsr2_mcu1_stsrx_bsrxp[10],
		       fsr2_mcu1_stsrx_losdtct[10], fsr2_mcu1_stsrx10_unused[0], fsr2_mcu1_stsrx_sync[10],
		       fsr2_mcu1_stsrx_testfail[10]} ),
  .stsrx1 	    ( {fsr2_mcu1_stsrx11_unused[2:1], fsr2_mcu1_stsrx_bsrxn[11], fsr2_mcu1_stsrx_bsrxp[11],
		       fsr2_mcu1_stsrx_losdtct[11], fsr2_mcu1_stsrx11_unused[0], fsr2_mcu1_stsrx_sync[11],
		       fsr2_mcu1_stsrx_testfail[11]} ),
  .stsrx2 	    ( {fsr2_mcu1_stsrx12_unused[2:1], fsr2_mcu1_stsrx_bsrxn[12], fsr2_mcu1_stsrx_bsrxp[12],
		       fsr2_mcu1_stsrx_losdtct[12], fsr2_mcu1_stsrx12_unused[0], fsr2_mcu1_stsrx_sync[12],
		       fsr2_mcu1_stsrx_testfail[12]} ),
  .stsrx3 	    ( {fsr2_mcu1_stsrx13_unused[2:1], fsr2_mcu1_stsrx_bsrxn[13], fsr2_mcu1_stsrx_bsrxp[13],
		       fsr2_mcu1_stsrx_losdtct[13], fsr2_mcu1_stsrx13_unused[0], fsr2_mcu1_stsrx_sync[13],
		       fsr2_mcu1_stsrx_testfail[13]} ),
  .ststx0 	    ( {fsr2_mcu1_ststx6_unused[2:0], fsr2_mcu1_ststx_testfail[6]} ),
  .ststx1 	    ( {fsr2_mcu1_ststx7_unused[2:0], fsr2_mcu1_ststx_testfail[7]} ),
  .ststx2 	    ( {fsr2_mcu1_ststx8_unused[2:0], fsr2_mcu1_ststx_testfail[8]} ),
  .ststx3 	    ( {fsr2_mcu1_ststx9_unused[2:0], fsr2_mcu1_ststx_testfail[9]} ),
  .txbclk 	    ( fsr2_txbclk_unused[9:6]   ),
  .txn0 	    ( FBDIMM1A_TX_N[6]   ),
  .txn1 	    ( FBDIMM1A_TX_N[7]   ),
  .txn2 	    ( FBDIMM1A_TX_N[8]   ),
  .txn3 	    ( FBDIMM1A_TX_N[9]   ),
  .txp0 	    ( FBDIMM1A_TX_P[6]   ),
  .txp1 	    ( FBDIMM1A_TX_P[7]   ),
  .txp2 	    ( FBDIMM1A_TX_P[8]   ),
  .txp3 	    ( FBDIMM1A_TX_P[9]   ),
  .atpgmd           ( fsr2_atpgtq_b81[1] ),
  .atpgmq           ( fsr2_atpgmq_b81 ),
  .atpgrd           ( {fsr2_atpgrq_b81[2],fsr2_atpgtq_b81[2],fsr2_atpgrq_b81[0],fsr2_atpgtq_b81[0]} ),
  .atpgrq           ( fsr2_atpgrq_b81[3:0] ),
  .atpgtd           ( {fsr2_atpgrq_b81[3],fsr2_atpgmq_b81,fsr2_atpgrq_b81[1],fsr2_atpgtq_a8[1]} ),
  .atpgtq           ( fsr2_atpgtq_b81[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// first serdes macro: rx ports 0-3, tx ports 0-3

wiz6c2b8n6d2t    fsr3_b8_0 (
  .bsinitclk 	    ( fsr3_bsinitclk[0]),
  .cfgpll       ({2'b0, mcu1_fsr3_cfgpll0[6:5], 3'b0, mcu1_fsr3_cfgpll0[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr3_cfgrx0[19:18], 1'b0, mcu1_fsr3_cfgrx0[17:9], 1'b0, mcu1_fsr3_cfgrx0[8], 
		  1'b0, mcu1_fsr3_cfgrx0[7:2], 3'b0, mcu1_fsr3_cfgrx0[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr3_cfgrx1[19:18], 1'b0, mcu1_fsr3_cfgrx1[17:9], 1'b0, mcu1_fsr3_cfgrx1[8], 
		  1'b0, mcu1_fsr3_cfgrx1[7:2], 3'b0, mcu1_fsr3_cfgrx1[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr3_cfgrx2[19:18], 1'b0, mcu1_fsr3_cfgrx2[17:9], 1'b0, mcu1_fsr3_cfgrx2[8], 
		  1'b0, mcu1_fsr3_cfgrx2[7:2], 3'b0, mcu1_fsr3_cfgrx2[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr3_cfgrx3[19:18], 1'b0, mcu1_fsr3_cfgrx3[17:9], 1'b0, mcu1_fsr3_cfgrx3[8], 
		  1'b0, mcu1_fsr3_cfgrx3[7:2], 3'b0, mcu1_fsr3_cfgrx3[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr3_cfgtx0[15:2], 3'b0, mcu1_fsr3_cfgtx0[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr3_cfgtx1[15:2], 3'b0, mcu1_fsr3_cfgtx1[1:0]}),
  .cfgtx2	({1'b0, mcu1_fsr3_cfgtx2[15:2], 3'b0, mcu1_fsr3_cfgtx2[1:0]}),
  .cfgtx3	({1'b0, mcu1_fsr3_cfgtx3[15:2], 3'b0, mcu1_fsr3_cfgtx3[1:0]}),
  .fclk 	    ( fsr3_fclk[0]     ),
  .fclrz 	    ( fsr3_fclrz[0]    ),
  .fdi 		    ( fsr3_fdi[0]      ),
  .refclkn 	    ( clk622l_l_3x  ),
  .refclkp 	    ( clk622l_l_3  ),
  .rxbclkin 	    ( fsr3_rxbclkin[3:0] ),
  .rxn0 	    ( FBDIMM1B_RX_N[0]   ),
  .rxn1 	    ( FBDIMM1B_RX_N[1]   ),
  .rxn2 	    ( FBDIMM1B_RX_N[2]   ),
  .rxn3 	    ( FBDIMM1B_RX_N[3]   ),
  .rxp0 	    ( FBDIMM1B_RX_P[0]   ),
  .rxp1 	    ( FBDIMM1B_RX_P[1]   ),
  .rxp2 	    ( FBDIMM1B_RX_P[2]   ),
  .rxp3 	    ( FBDIMM1B_RX_P[3]   ),
  .stcicfg 	    ( fsr3_stcicfg[1:0]  ),
  .stciclk 	    ( fsr3_stciclk[0]  ),
  .stcid 	    ( fsr3_stcid[0]   ),
  .td0 		    ( {mcu1_fsr3_td0[0], mcu1_fsr3_td0[1], mcu1_fsr3_td0[2], mcu1_fsr3_td0[3],
		       mcu1_fsr3_td0[4], mcu1_fsr3_td0[5], mcu1_fsr3_td0[6], mcu1_fsr3_td0[7],
		       mcu1_fsr3_td0[8], mcu1_fsr3_td0[9], mcu1_fsr3_td0[10], mcu1_fsr3_td0[11]} ),
  .td1 		    ( {mcu1_fsr3_td1[0], mcu1_fsr3_td1[1], mcu1_fsr3_td1[2], mcu1_fsr3_td1[3],
		       mcu1_fsr3_td1[4], mcu1_fsr3_td1[5], mcu1_fsr3_td1[6], mcu1_fsr3_td1[7],
		       mcu1_fsr3_td1[8], mcu1_fsr3_td1[9], mcu1_fsr3_td1[10], mcu1_fsr3_td1[11]} ),
  .td2 		    ( {mcu1_fsr3_td2[0], mcu1_fsr3_td2[1], mcu1_fsr3_td2[2], mcu1_fsr3_td2[3],
		       mcu1_fsr3_td2[4], mcu1_fsr3_td2[5], mcu1_fsr3_td2[6], mcu1_fsr3_td2[7],
		       mcu1_fsr3_td2[8], mcu1_fsr3_td2[9], mcu1_fsr3_td2[10], mcu1_fsr3_td2[11]} ),
  .td3 		    ( {mcu1_fsr3_td3[0], mcu1_fsr3_td3[1], mcu1_fsr3_td3[2], mcu1_fsr3_td3[3],
		       mcu1_fsr3_td3[4], mcu1_fsr3_td3[5], mcu1_fsr3_td3[6], mcu1_fsr3_td3[7],
		       mcu1_fsr3_td3[8], mcu1_fsr3_td3[9], mcu1_fsr3_td3[10], mcu1_fsr3_td3[11]} ),
  .testcfg 	    ( {mcu1_fsr3_testcfg0[17:14], 1'b0, mcu1_fsr3_testcfg0[13:11], 1'b0, mcu1_fsr3_testcfg0[10:0]}  ),
  .testclkr 	    ( fsr3_testclkr[0] ),
  .testclkt 	    ( fsr3_testclkt[0] ),
  .txbclkin 	    ( {4{fsr3_txbclkin[0]}} ),
  .amux 	    ( FBDIMM1B_AMUX[0]     ),
  .fdo 		    ( fsr3_fdo[0]      ),
  .rd0 		    ( {fsr3_mcu1_rd0[0], fsr3_mcu1_rd0[1], fsr3_mcu1_rd0[2], fsr3_mcu1_rd0[3], 
		       fsr3_mcu1_rd0[4], fsr3_mcu1_rd0[5], fsr3_mcu1_rd0[6], fsr3_mcu1_rd0[7], 
		       fsr3_mcu1_rd0[8], fsr3_mcu1_rd0[9], fsr3_mcu1_rd0[10], fsr3_mcu1_rd0[11]} ),
  .rd1 		    ( {fsr3_mcu1_rd1[0], fsr3_mcu1_rd1[1], fsr3_mcu1_rd1[2], fsr3_mcu1_rd1[3], 
		       fsr3_mcu1_rd1[4], fsr3_mcu1_rd1[5], fsr3_mcu1_rd1[6], fsr3_mcu1_rd1[7], 
		       fsr3_mcu1_rd1[8], fsr3_mcu1_rd1[9], fsr3_mcu1_rd1[10], fsr3_mcu1_rd1[11]} ),
  .rd2 		    ( {fsr3_mcu1_rd2[0], fsr3_mcu1_rd2[1], fsr3_mcu1_rd2[2], fsr3_mcu1_rd2[3], 
		       fsr3_mcu1_rd2[4], fsr3_mcu1_rd2[5], fsr3_mcu1_rd2[6], fsr3_mcu1_rd2[7], 
		       fsr3_mcu1_rd2[8], fsr3_mcu1_rd2[9], fsr3_mcu1_rd2[10], fsr3_mcu1_rd2[11]} ),
  .rd3 		    ( {fsr3_mcu1_rd3[0], fsr3_mcu1_rd3[1], fsr3_mcu1_rd3[2], fsr3_mcu1_rd3[3], 
		       fsr3_mcu1_rd3[4], fsr3_mcu1_rd3[5], fsr3_mcu1_rd3[6], fsr3_mcu1_rd3[7], 
		       fsr3_mcu1_rd3[8], fsr3_mcu1_rd3[9], fsr3_mcu1_rd3[10], fsr3_mcu1_rd3[11]} ),
  .rdll0 	    ( fsr3_rdll0_b80[1:0] ),
  .rdll1 	    ( fsr3_rdll1_b80[1:0] ),
  .rdll2 	    ( fsr3_rdll2_b80[1:0] ),
  .rdll3 	    ( fsr3_rdll3_b80[1:0] ),
  .rxbclk 	    ( fsr3_mcu1_rxbclk[3:0]   ),
  .rxbclklln 	    ( fsr3_rxbclklln_unused[3:0] ),
  .rxbclkllp 	    ( fsr3_rxbclkllp_unused[3:0] ),
  .stciq 	    ( fsr3_stciq[0]    ),
  .stspll 	    ( {fsr3_mcu1_stspll_b80[2:0], fsr3_mcu1_stspll_lock[0]} ),
  .stsrx0 	    ( {fsr3_mcu1_stsrx0_unused[2:1], fsr3_mcu1_stsrx_bsrxn[0], fsr3_mcu1_stsrx_bsrxp[0],
		       fsr3_mcu1_stsrx_losdtct[0], fsr3_mcu1_stsrx0_unused[0], fsr3_mcu1_stsrx_sync[0],
		       fsr3_mcu1_stsrx_testfail[0]} ),
  .stsrx1 	    ( {fsr3_mcu1_stsrx1_unused[2:1], fsr3_mcu1_stsrx_bsrxn[1], fsr3_mcu1_stsrx_bsrxp[1],
		       fsr3_mcu1_stsrx_losdtct[1], fsr3_mcu1_stsrx1_unused[0], fsr3_mcu1_stsrx_sync[1],
		       fsr3_mcu1_stsrx_testfail[1]} ),
  .stsrx2 	    ( {fsr3_mcu1_stsrx2_unused[2:1], fsr3_mcu1_stsrx_bsrxn[2], fsr3_mcu1_stsrx_bsrxp[2],
		       fsr3_mcu1_stsrx_losdtct[2], fsr3_mcu1_stsrx2_unused[0], fsr3_mcu1_stsrx_sync[2],
		       fsr3_mcu1_stsrx_testfail[2]} ),
  .stsrx3 	    ( {fsr3_mcu1_stsrx3_unused[2:1], fsr3_mcu1_stsrx_bsrxn[3], fsr3_mcu1_stsrx_bsrxp[3],
		       fsr3_mcu1_stsrx_losdtct[3], fsr3_mcu1_stsrx3_unused[0], fsr3_mcu1_stsrx_sync[3],
		       fsr3_mcu1_stsrx_testfail[3]} ),
  .ststx0 	    ( {fsr3_mcu1_ststx0_unused[2:0], fsr3_mcu1_ststx_testfail[0]} ),
  .ststx1 	    ( {fsr3_mcu1_ststx1_unused[2:0], fsr3_mcu1_ststx_testfail[1]} ),
  .ststx2 	    ( {fsr3_mcu1_ststx2_unused[2:0], fsr3_mcu1_ststx_testfail[2]} ),
  .ststx3 	    ( {fsr3_mcu1_ststx3_unused[2:0], fsr3_mcu1_ststx_testfail[3]} ),
  .txbclk 	    ( fsr3_txbclk_unused[3:0]   ),
  .txn0 	    ( FBDIMM1B_TX_N[0]   ),
  .txn1 	    ( FBDIMM1B_TX_N[1]   ),
  .txn2 	    ( FBDIMM1B_TX_N[2]   ),
  .txn3 	    ( FBDIMM1B_TX_N[3]   ),
  .txp0 	    ( FBDIMM1B_TX_P[0]   ),
  .txp1 	    ( FBDIMM1B_TX_P[1]   ),
  .txp2 	    ( FBDIMM1B_TX_P[2]   ),
  .txp3 	    ( FBDIMM1B_TX_P[3]   ),
  .atpgmd           ( fsr3_atpgtq_b80[1] ),
  .atpgmq           ( fsr3_atpgmq_b80 ),
  .atpgrd           ( {fsr3_atpgrq_b80[2],fsr3_atpgtq_b80[2],fsr3_atpgrq_b80[0],fsr3_atpgtq_b80[0]} ),
  .atpgrq           ( fsr3_atpgrq_b80[3:0] ),
  .atpgtd           ( {fsr3_atpgrq_b80[3],fsr3_atpgmq_b80,fsr3_atpgrq_b80[1],fsr2_atpgtq_b81[3]} ),
  .atpgtq           ( fsr3_atpgtq_b80[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );


// second serdes macro: RX ports 4-9, TX ports 4-5
   
wiz6c2a8n6d2t fsr3_a8 (
  .bsinitclk 	    ( fsr3_bsinitclk[1]),
  .cfgpll       ({2'b0, mcu1_fsr3_cfgpll1[6:5], 3'b0, mcu1_fsr3_cfgpll1[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr3_cfgrx4[19:18], 1'b0, mcu1_fsr3_cfgrx4[17:9], 1'b0, mcu1_fsr3_cfgrx4[8], 
		  1'b0, mcu1_fsr3_cfgrx4[7:2], 3'b0, mcu1_fsr3_cfgrx4[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr3_cfgrx5[19:18], 1'b0, mcu1_fsr3_cfgrx5[17:9], 1'b0, mcu1_fsr3_cfgrx5[8], 
		  1'b0, mcu1_fsr3_cfgrx5[7:2], 3'b0, mcu1_fsr3_cfgrx5[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr3_cfgrx6[19:18], 1'b0, mcu1_fsr3_cfgrx6[17:9], 1'b0, mcu1_fsr3_cfgrx6[8], 
		  1'b0, mcu1_fsr3_cfgrx6[7:2], 3'b0, mcu1_fsr3_cfgrx6[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr3_cfgrx7[19:18], 1'b0, mcu1_fsr3_cfgrx7[17:9], 1'b0, mcu1_fsr3_cfgrx7[8], 
		  1'b0, mcu1_fsr3_cfgrx7[7:2], 3'b0, mcu1_fsr3_cfgrx7[1:0]}),
  .cfgrx4	({2'b0, mcu1_fsr3_cfgrx8[19:18], 1'b0, mcu1_fsr3_cfgrx8[17:9], 1'b0, mcu1_fsr3_cfgrx8[8], 
		  1'b0, mcu1_fsr3_cfgrx8[7:2], 3'b0, mcu1_fsr3_cfgrx8[1:0]}),
  .cfgrx5	({2'b0, mcu1_fsr3_cfgrx9[19:18], 1'b0, mcu1_fsr3_cfgrx9[17:9], 1'b0, mcu1_fsr3_cfgrx9[8], 
		  1'b0, mcu1_fsr3_cfgrx9[7:2], 3'b0, mcu1_fsr3_cfgrx9[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr3_cfgtx4[15:2], 3'b0, mcu1_fsr3_cfgtx4[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr3_cfgtx5[15:2], 3'b0, mcu1_fsr3_cfgtx5[1:0]}),
  .fclk 	    ( fsr3_fclk[1]     ),
  .fclrz 	    ( fsr3_fclrz[1]    ),
  .fdi 		    ( fsr3_fdi[1]      ),
  .refclkn 	    ( clk622l_l_2x  ),
  .refclkp 	    ( clk622l_l_2  ),
  .rxbclkin 	    ( fsr3_rxbclkin[9:4] ),
  .rxn0 	    ( FBDIMM1B_RX_N[4]   ),
  .rxn1 	    ( FBDIMM1B_RX_N[5]   ),
  .rxn2 	    ( FBDIMM1B_RX_N[6]   ),
  .rxn3 	    ( FBDIMM1B_RX_N[7]   ),
  .rxn4 	    ( FBDIMM1B_RX_N[8]   ),
  .rxn5 	    ( FBDIMM1B_RX_N[9]   ),
  .rxp0 	    ( FBDIMM1B_RX_P[4]   ),
  .rxp1 	    ( FBDIMM1B_RX_P[5]   ),
  .rxp2 	    ( FBDIMM1B_RX_P[6]   ),
  .rxp3 	    ( FBDIMM1B_RX_P[7]   ),
  .rxp4 	    ( FBDIMM1B_RX_P[8]   ),
  .rxp5 	    ( FBDIMM1B_RX_P[9]   ),
  .stcicfg 	    ( fsr3_stcicfg[3:2]  ),
  .stciclk 	    ( fsr3_stciclk[1]  ),
  .stcid 	    ( fsr3_stcid[1]    ),
  .td0 		    ( {mcu1_fsr3_td4[0], mcu1_fsr3_td4[1], mcu1_fsr3_td4[2], mcu1_fsr3_td4[3],
			       mcu1_fsr3_td4[4], mcu1_fsr3_td4[5], mcu1_fsr3_td4[6], mcu1_fsr3_td4[7],
			       mcu1_fsr3_td4[8], mcu1_fsr3_td4[9], mcu1_fsr3_td4[10], mcu1_fsr3_td4[11]} ),
  .td1 		    ( {mcu1_fsr3_td5[0], mcu1_fsr3_td5[1], mcu1_fsr3_td5[2], mcu1_fsr3_td5[3],
			       mcu1_fsr3_td5[4], mcu1_fsr3_td5[5], mcu1_fsr3_td5[6], mcu1_fsr3_td5[7],
			       mcu1_fsr3_td5[8], mcu1_fsr3_td5[9], mcu1_fsr3_td5[10], mcu1_fsr3_td5[11]} ),
  .testcfg 	    ( {mcu1_fsr3_testcfg1[17:14], 1'b0, mcu1_fsr3_testcfg1[13:11], 1'b0, mcu1_fsr3_testcfg1[10:0]}  ),
  .testclkr 	    ( fsr3_testclkr[1] ),
  .testclkt 	    ( fsr3_testclkt[1] ),
  .txbclkin 	    ( {2{fsr3_txbclkin[1]}} ),
  .amux 	    ( FBDIMM1B_AMUX[1]     ),
  .fdo 		    ( fsr3_fdo[1]      ),
  .rd0 		    ( {fsr3_mcu1_rd4[0], fsr3_mcu1_rd4[1], fsr3_mcu1_rd4[2], fsr3_mcu1_rd4[3], 
		       fsr3_mcu1_rd4[4], fsr3_mcu1_rd4[5], fsr3_mcu1_rd4[6], fsr3_mcu1_rd4[7], 
		       fsr3_mcu1_rd4[8], fsr3_mcu1_rd4[9], fsr3_mcu1_rd4[10], fsr3_mcu1_rd4[11]} ),
  .rd1 		    ( {fsr3_mcu1_rd5[0], fsr3_mcu1_rd5[1], fsr3_mcu1_rd5[2], fsr3_mcu1_rd5[3], 
		       fsr3_mcu1_rd5[4], fsr3_mcu1_rd5[5], fsr3_mcu1_rd5[6], fsr3_mcu1_rd5[7], 
		       fsr3_mcu1_rd5[8], fsr3_mcu1_rd5[9], fsr3_mcu1_rd5[10], fsr3_mcu1_rd5[11]} ),
  .rd2 		    ( {fsr3_mcu1_rd6[0], fsr3_mcu1_rd6[1], fsr3_mcu1_rd6[2], fsr3_mcu1_rd6[3], 
		       fsr3_mcu1_rd6[4], fsr3_mcu1_rd6[5], fsr3_mcu1_rd6[6], fsr3_mcu1_rd6[7], 
		       fsr3_mcu1_rd6[8], fsr3_mcu1_rd6[9], fsr3_mcu1_rd6[10], fsr3_mcu1_rd6[11]} ),
  .rd3 		    ( {fsr3_mcu1_rd7[0], fsr3_mcu1_rd7[1], fsr3_mcu1_rd7[2], fsr3_mcu1_rd7[3], 
		       fsr3_mcu1_rd7[4], fsr3_mcu1_rd7[5], fsr3_mcu1_rd7[6], fsr3_mcu1_rd7[7], 
		       fsr3_mcu1_rd7[8], fsr3_mcu1_rd7[9], fsr3_mcu1_rd7[10], fsr3_mcu1_rd7[11]} ),
  .rd4 		    ( {fsr3_mcu1_rd8[0], fsr3_mcu1_rd8[1], fsr3_mcu1_rd8[2], fsr3_mcu1_rd8[3], 
		       fsr3_mcu1_rd8[4], fsr3_mcu1_rd8[5], fsr3_mcu1_rd8[6], fsr3_mcu1_rd8[7], 
		       fsr3_mcu1_rd8[8], fsr3_mcu1_rd8[9], fsr3_mcu1_rd8[10], fsr3_mcu1_rd8[11]} ),
  .rd5 		    ( {fsr3_mcu1_rd9[0], fsr3_mcu1_rd9[1], fsr3_mcu1_rd9[2], fsr3_mcu1_rd9[3], 
		       fsr3_mcu1_rd9[4], fsr3_mcu1_rd9[5], fsr3_mcu1_rd9[6], fsr3_mcu1_rd9[7], 
		       fsr3_mcu1_rd9[8], fsr3_mcu1_rd9[9], fsr3_mcu1_rd9[10], fsr3_mcu1_rd9[11]} ),
  .rdll0 	    ( fsr3_rdll0_b62[1:0] ),
  .rdll1 	    ( fsr3_rdll1_b62[1:0] ),
  .rdll2 	    ( fsr3_rdll2_b62[1:0] ),
  .rdll3 	    ( fsr3_rdll3_b62[1:0] ),
  .rxbclk 	    ( fsr3_mcu1_rxbclk[9:4]   ),
  .rxbclklln 	    ( fsr3_rxbclklln_unused[9:4] ),
  .rxbclkllp 	    ( fsr3_rxbclkllp_unused[9:4] ),
  .stciq 	    ( fsr3_stciq[1]    ),
  .stspll 	    ( {fsr3_mcu1_stspll_b62[2:0], fsr3_mcu1_stspll_lock[1]} ),
  .stsrx0 	    ( {fsr3_mcu1_stsrx4_unused[2:1], fsr3_mcu1_stsrx_bsrxn[4], fsr3_mcu1_stsrx_bsrxp[4],
		       fsr3_mcu1_stsrx_losdtct[4], fsr3_mcu1_stsrx4_unused[0], fsr3_mcu1_stsrx_sync[4],
		       fsr3_mcu1_stsrx_testfail[4]} ),
  .stsrx1 	    ( {fsr3_mcu1_stsrx5_unused[2:1], fsr3_mcu1_stsrx_bsrxn[5], fsr3_mcu1_stsrx_bsrxp[5],
		       fsr3_mcu1_stsrx_losdtct[5], fsr3_mcu1_stsrx5_unused[0], fsr3_mcu1_stsrx_sync[5],
		       fsr3_mcu1_stsrx_testfail[5]} ),
  .stsrx2 	    ( {fsr3_mcu1_stsrx6_unused[2:1], fsr3_mcu1_stsrx_bsrxn[6], fsr3_mcu1_stsrx_bsrxp[6],
		       fsr3_mcu1_stsrx_losdtct[6], fsr3_mcu1_stsrx6_unused[0], fsr3_mcu1_stsrx_sync[6],
		       fsr3_mcu1_stsrx_testfail[6]} ),
  .stsrx3 	    ( {fsr3_mcu1_stsrx7_unused[2:1], fsr3_mcu1_stsrx_bsrxn[7], fsr3_mcu1_stsrx_bsrxp[7],
		       fsr3_mcu1_stsrx_losdtct[7], fsr3_mcu1_stsrx7_unused[0], fsr3_mcu1_stsrx_sync[7],
		       fsr3_mcu1_stsrx_testfail[7]} ),
  .stsrx4 	    ( {fsr3_mcu1_stsrx8_unused[2:1], fsr3_mcu1_stsrx_bsrxn[8], fsr3_mcu1_stsrx_bsrxp[8],
		       fsr3_mcu1_stsrx_losdtct[8], fsr3_mcu1_stsrx8_unused[0], fsr3_mcu1_stsrx_sync[8],
		       fsr3_mcu1_stsrx_testfail[8]} ),
  .stsrx5 	    ( {fsr3_mcu1_stsrx9_unused[2:1], fsr3_mcu1_stsrx_bsrxn[9], fsr3_mcu1_stsrx_bsrxp[9],
		       fsr3_mcu1_stsrx_losdtct[9], fsr3_mcu1_stsrx9_unused[0], fsr3_mcu1_stsrx_sync[9],
		       fsr3_mcu1_stsrx_testfail[9]} ),
  .ststx0 	    ( {fsr3_mcu1_ststx4_unused[2:0], fsr3_mcu1_ststx_testfail[4]} ),
  .ststx1 	    ( {fsr3_mcu1_ststx5_unused[2:0], fsr3_mcu1_ststx_testfail[5]} ),
  .txbclk 	    ( fsr3_txbclk_unused[5:4]   ),
  .txn0 	    ( FBDIMM1B_TX_N[4]   ),
  .txn1 	    ( FBDIMM1B_TX_N[5]   ),
  .txp0 	    ( FBDIMM1B_TX_P[4]   ),
  .txp1 	    ( FBDIMM1B_TX_P[5]   ),
  .atpgmd           ( fsr3_atpgrq_a8[4] ),
  .atpgmq           ( fsr3_atpgmq_a8 ),
  .atpgrd           ( {fsr3_atpgmq_a8,fsr3_atpgrq_a8[1],fsr3_atpgrq_a8[2],fsr3_atpgrq_a8[5],fsr3_atpgrq_a8[0],
		       fsr3_atpgtq_a8[0]} ),
  .atpgrq           ( fsr3_atpgrq_a8[5:0] ),
  .atpgtd           ( {fsr3_atpgrq_a8[3],fsr3_atpgtq_b80[3]} ),
  .atpgtq           ( fsr3_atpgtq_a8[1:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// third serdes macro: RX ports 10-13, TX ports 6-9
   
wiz6c2b8n6d2t    fsr3_b8_1 (
  .bsinitclk 	    ( fsr3_bsinitclk[2]),
  .cfgpll       ({2'b0, mcu1_fsr3_cfgpll2[6:5], 3'b0, mcu1_fsr3_cfgpll2[4:0]}),
  .cfgrx0	({2'b0, mcu1_fsr3_cfgrx10[19:18], 1'b0, mcu1_fsr3_cfgrx10[17:9], 1'b0, mcu1_fsr3_cfgrx10[8], 
		  1'b0, mcu1_fsr3_cfgrx10[7:2], 3'b0, mcu1_fsr3_cfgrx10[1:0]}),
  .cfgrx1	({2'b0, mcu1_fsr3_cfgrx11[19:18], 1'b0, mcu1_fsr3_cfgrx11[17:9], 1'b0, mcu1_fsr3_cfgrx11[8], 
		  1'b0, mcu1_fsr3_cfgrx11[7:2], 3'b0, mcu1_fsr3_cfgrx11[1:0]}),
  .cfgrx2	({2'b0, mcu1_fsr3_cfgrx12[19:18], 1'b0, mcu1_fsr3_cfgrx12[17:9], 1'b0, mcu1_fsr3_cfgrx12[8], 
		  1'b0, mcu1_fsr3_cfgrx12[7:2], 3'b0, mcu1_fsr3_cfgrx12[1:0]}),
  .cfgrx3	({2'b0, mcu1_fsr3_cfgrx13[19:18], 1'b0, mcu1_fsr3_cfgrx13[17:9], 1'b0, mcu1_fsr3_cfgrx13[8], 
		  1'b0, mcu1_fsr3_cfgrx13[7:2], 3'b0, mcu1_fsr3_cfgrx13[1:0]}),
  .cfgtx0	({1'b0, mcu1_fsr3_cfgtx6[15:2], 3'b0, mcu1_fsr3_cfgtx6[1:0]}),
  .cfgtx1	({1'b0, mcu1_fsr3_cfgtx7[15:2], 3'b0, mcu1_fsr3_cfgtx7[1:0]}),
  .cfgtx2	({1'b0, mcu1_fsr3_cfgtx8[15:2], 3'b0, mcu1_fsr3_cfgtx8[1:0]}),
  .cfgtx3	({1'b0, mcu1_fsr3_cfgtx9[15:2], 3'b0, mcu1_fsr3_cfgtx9[1:0]}),
  .fclk 	    ( fsr3_fclk[2]     ),
  .fclrz 	    ( fsr3_fclrz[2]    ),
  .fdi 		    ( fsr3_fdi[2]      ),
  .refclkn 	    ( clk622l_l_1x  ),
  .refclkp 	    ( clk622l_l_1  ),
  .rxbclkin 	    ( fsr3_rxbclkin[13:10] ),
  .rxn0 	    ( FBDIMM1B_RX_N[10]   ),
  .rxn1 	    ( FBDIMM1B_RX_N[11]   ),
  .rxn2 	    ( FBDIMM1B_RX_N[12]   ),
  .rxn3 	    ( FBDIMM1B_RX_N[13]   ),
  .rxp0 	    ( FBDIMM1B_RX_P[10]   ),
  .rxp1 	    ( FBDIMM1B_RX_P[11]   ),
  .rxp2 	    ( FBDIMM1B_RX_P[12]   ),
  .rxp3 	    ( FBDIMM1B_RX_P[13]   ),
  .stcicfg 	    ( fsr3_stcicfg[5:4]  ),
  .stciclk 	    ( fsr3_stciclk[2]  ),
  .stcid 	    ( fsr3_stcid[2]    ),
  .td0 		    ( {mcu1_fsr3_td6[0], mcu1_fsr3_td6[1], mcu1_fsr3_td6[2], mcu1_fsr3_td6[3],
		       mcu1_fsr3_td6[4], mcu1_fsr3_td6[5], mcu1_fsr3_td6[6], mcu1_fsr3_td6[7],
		       mcu1_fsr3_td6[8], mcu1_fsr3_td6[9], mcu1_fsr3_td6[10], mcu1_fsr3_td6[11]} ),
  .td1 		    ( {mcu1_fsr3_td7[0], mcu1_fsr3_td7[1], mcu1_fsr3_td7[2], mcu1_fsr3_td7[3],
		       mcu1_fsr3_td7[4], mcu1_fsr3_td7[5], mcu1_fsr3_td7[6], mcu1_fsr3_td7[7],
		       mcu1_fsr3_td7[8], mcu1_fsr3_td7[9], mcu1_fsr3_td7[10], mcu1_fsr3_td7[11]} ),
  .td2 		    ( {mcu1_fsr3_td8[0], mcu1_fsr3_td8[1], mcu1_fsr3_td8[2], mcu1_fsr3_td8[3],
		       mcu1_fsr3_td8[4], mcu1_fsr3_td8[5], mcu1_fsr3_td8[6], mcu1_fsr3_td8[7],
		       mcu1_fsr3_td8[8], mcu1_fsr3_td8[9], mcu1_fsr3_td8[10], mcu1_fsr3_td8[11]} ),
  .td3 		    ( {mcu1_fsr3_td9[0], mcu1_fsr3_td9[1], mcu1_fsr3_td9[2], mcu1_fsr3_td9[3],
		       mcu1_fsr3_td9[4], mcu1_fsr3_td9[5], mcu1_fsr3_td9[6], mcu1_fsr3_td9[7],
		       mcu1_fsr3_td9[8], mcu1_fsr3_td9[9], mcu1_fsr3_td9[10], mcu1_fsr3_td9[11]} ),
  .testcfg 	    ( {mcu1_fsr3_testcfg2[17:14], 1'b0, mcu1_fsr3_testcfg2[13:11], 1'b0, mcu1_fsr3_testcfg2[10:0]}  ),
  .testclkr 	    ( fsr3_testclkr[2] ),
  .testclkt 	    ( fsr3_testclkt[2] ),
  .txbclkin 	    ( {4{fsr3_txbclkin[2]}} ),
  .amux 	    ( FBDIMM1B_AMUX[2]     ),
  .fdo 		    ( fsr3_fdo[2]      ),
  .rd0 		    ( {fsr3_mcu1_rd10[0], fsr3_mcu1_rd10[1], fsr3_mcu1_rd10[2], fsr3_mcu1_rd10[3], 
		       fsr3_mcu1_rd10[4], fsr3_mcu1_rd10[5], fsr3_mcu1_rd10[6], fsr3_mcu1_rd10[7], 
		       fsr3_mcu1_rd10[8], fsr3_mcu1_rd10[9], fsr3_mcu1_rd10[10], fsr3_mcu1_rd10[11]} ),
  .rd1 		    ( {fsr3_mcu1_rd11[0], fsr3_mcu1_rd11[1], fsr3_mcu1_rd11[2], fsr3_mcu1_rd11[3], 
		       fsr3_mcu1_rd11[4], fsr3_mcu1_rd11[5], fsr3_mcu1_rd11[6], fsr3_mcu1_rd11[7], 
		       fsr3_mcu1_rd11[8], fsr3_mcu1_rd11[9], fsr3_mcu1_rd11[10], fsr3_mcu1_rd11[11]} ),
  .rd2 		    ( {fsr3_mcu1_rd12[0], fsr3_mcu1_rd12[1], fsr3_mcu1_rd12[2], fsr3_mcu1_rd12[3], 
		       fsr3_mcu1_rd12[4], fsr3_mcu1_rd12[5], fsr3_mcu1_rd12[6], fsr3_mcu1_rd12[7], 
		       fsr3_mcu1_rd12[8], fsr3_mcu1_rd12[9], fsr3_mcu1_rd12[10], fsr3_mcu1_rd12[11]} ),
  .rd3 		    ( {fsr3_mcu1_rd13[0], fsr3_mcu1_rd13[1], fsr3_mcu1_rd13[2], fsr3_mcu1_rd13[3], 
		       fsr3_mcu1_rd13[4], fsr3_mcu1_rd13[5], fsr3_mcu1_rd13[6], fsr3_mcu1_rd13[7], 
		       fsr3_mcu1_rd13[8], fsr3_mcu1_rd13[9], fsr3_mcu1_rd13[10], fsr3_mcu1_rd13[11]} ),
  .rdll0 	    ( fsr3_rdll0_b81[1:0] ),
  .rdll1 	    ( fsr3_rdll1_b81[1:0] ),
  .rdll2 	    ( fsr3_rdll2_b81[1:0] ),
  .rdll3 	    ( fsr3_rdll3_b81[1:0] ),
  .rxbclk 	    ( fsr3_mcu1_rxbclk[13:10]   ),
  .rxbclklln 	    ( fsr3_rxbclklln_unused[13:10] ),
  .rxbclkllp 	    ( fsr3_rxbclkllp_unused[13:10] ),
  .stciq 	    ( fsr3_stciq[2]    ),
  .stspll 	    ( {fsr3_mcu1_stspll_b81[2:0], fsr3_mcu1_stspll_lock[2]} ),
  .stsrx0 	    ( {fsr3_mcu1_stsrx10_unused[2:1], fsr3_mcu1_stsrx_bsrxn[10], fsr3_mcu1_stsrx_bsrxp[10],
		       fsr3_mcu1_stsrx_losdtct[10], fsr3_mcu1_stsrx10_unused[0], fsr3_mcu1_stsrx_sync[10],
		       fsr3_mcu1_stsrx_testfail[10]} ),
  .stsrx1 	    ( {fsr3_mcu1_stsrx11_unused[2:1], fsr3_mcu1_stsrx_bsrxn[11], fsr3_mcu1_stsrx_bsrxp[11],
		       fsr3_mcu1_stsrx_losdtct[11], fsr3_mcu1_stsrx11_unused[0], fsr3_mcu1_stsrx_sync[11],
		       fsr3_mcu1_stsrx_testfail[11]} ),
  .stsrx2 	    ( {fsr3_mcu1_stsrx12_unused[2:1], fsr3_mcu1_stsrx_bsrxn[12], fsr3_mcu1_stsrx_bsrxp[12],
		       fsr3_mcu1_stsrx_losdtct[12], fsr3_mcu1_stsrx12_unused[0], fsr3_mcu1_stsrx_sync[12],
		       fsr3_mcu1_stsrx_testfail[12]} ),
  .stsrx3 	    ( {fsr3_mcu1_stsrx13_unused[2:1], fsr3_mcu1_stsrx_bsrxn[13], fsr3_mcu1_stsrx_bsrxp[13],
		       fsr3_mcu1_stsrx_losdtct[13], fsr3_mcu1_stsrx13_unused[0], fsr3_mcu1_stsrx_sync[13],
		       fsr3_mcu1_stsrx_testfail[13]} ),
  .ststx0 	    ( {fsr3_mcu1_ststx6_unused[2:0], fsr3_mcu1_ststx_testfail[6]} ),
  .ststx1 	    ( {fsr3_mcu1_ststx7_unused[2:0], fsr3_mcu1_ststx_testfail[7]} ),
  .ststx2 	    ( {fsr3_mcu1_ststx8_unused[2:0], fsr3_mcu1_ststx_testfail[8]} ),
  .ststx3 	    ( {fsr3_mcu1_ststx9_unused[2:0], fsr3_mcu1_ststx_testfail[9]} ),
  .txbclk 	    ( fsr3_txbclk_unused[9:6]   ),
  .txn0 	    ( FBDIMM1B_TX_N[6]   ),
  .txn1 	    ( FBDIMM1B_TX_N[7]   ),
  .txn2 	    ( FBDIMM1B_TX_N[8]   ),
  .txn3 	    ( FBDIMM1B_TX_N[9]   ),
  .txp0 	    ( FBDIMM1B_TX_P[6]   ),
  .txp1 	    ( FBDIMM1B_TX_P[7]   ),
  .txp2 	    ( FBDIMM1B_TX_P[8]   ),
  .txp3 	    ( FBDIMM1B_TX_P[9]   ),
  .atpgmd           ( fsr3_atpgtq_b81[1] ),
  .atpgmq           ( fsr3_atpgmq_b81 ),
  .atpgrd           ( {fsr3_atpgrq_b81[2],fsr3_atpgtq_b81[2],fsr3_atpgrq_b81[0],fsr3_atpgtq_b81[0]} ),
  .atpgrq           ( fsr3_atpgrq_b81[3:0] ),
  .atpgtd           ( {fsr3_atpgrq_b81[3],fsr3_atpgmq_b81,fsr3_atpgrq_b81[1],fsr3_atpgtq_a8[1]} ),
  .atpgtq           ( {fsr_left_atpgq, fsr3_atpgtq_b81[2:0]} ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );    

endmodule

