// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fsr_bottom.v
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
module fsr_bottom 
   (fsr7_mcu3_rd0,
    fsr7_mcu3_rd1,
    fsr7_mcu3_rd2,
    fsr7_mcu3_rd3,
    fsr7_mcu3_rd4,
    fsr7_mcu3_rd5,
    fsr7_mcu3_rd6,
    fsr7_mcu3_rd7,
    fsr7_mcu3_rd8,
    fsr7_mcu3_rd9,
    fsr7_mcu3_rd10,
    fsr7_mcu3_rd11,
    fsr7_mcu3_rd12,
    fsr7_mcu3_rd13,
    fsr7_mcu3_ststx_testfail,
    fsr7_mcu3_stspll_lock,
    fsr7_mcu3_stsrx_testfail,
    fsr7_mcu3_stsrx_sync,
    fsr7_mcu3_stsrx_losdtct,
    fsr7_mcu3_stsrx_bsrxp,
    fsr7_mcu3_stsrx_bsrxn,
    fsr7_mcu3_rxbclk,
    FBDIMM3B_TX_N, 
    FBDIMM3B_TX_P,
    FBDIMM3B_AMUX,
    fsr7_fdo,
    fsr7_stciq,
    mcu3_fsr7_cfgpll0,
    mcu3_fsr7_cfgpll1,
    mcu3_fsr7_cfgpll2,
    mcu3_fsr7_cfgrx0,
    mcu3_fsr7_cfgrx1,
    mcu3_fsr7_cfgrx2,
    mcu3_fsr7_cfgrx3,
    mcu3_fsr7_cfgrx4,
    mcu3_fsr7_cfgrx5,
    mcu3_fsr7_cfgrx6,
    mcu3_fsr7_cfgrx7,
    mcu3_fsr7_cfgrx8,
    mcu3_fsr7_cfgrx9,
    mcu3_fsr7_cfgrx10,
    mcu3_fsr7_cfgrx11,
    mcu3_fsr7_cfgrx12,
    mcu3_fsr7_cfgrx13,
    mcu3_fsr7_cfgtx0,
    mcu3_fsr7_cfgtx1,
    mcu3_fsr7_cfgtx2,
    mcu3_fsr7_cfgtx3,
    mcu3_fsr7_cfgtx4,
    mcu3_fsr7_cfgtx5,
    mcu3_fsr7_cfgtx6,
    mcu3_fsr7_cfgtx7,
    mcu3_fsr7_cfgtx8,
    mcu3_fsr7_cfgtx9,
    mcu3_fsr7_testcfg0,
    mcu3_fsr7_testcfg1,
    mcu3_fsr7_testcfg2,
    mcu3_fsr7_td0,
    mcu3_fsr7_td1,
    mcu3_fsr7_td2,
    mcu3_fsr7_td3,
    mcu3_fsr7_td4,
    mcu3_fsr7_td5,
    mcu3_fsr7_td6,
    mcu3_fsr7_td7,
    mcu3_fsr7_td8,
    mcu3_fsr7_td9,
    fsr7_stcicfg,
    fsr7_txbclkin,
    fsr7_rxbclkin,
    fsr7_bsinitclk, 
    fsr7_fclk, 
    fsr7_fclrz, 
    fsr7_fdi, 
    FBDIMM3B_RX_N, 
    FBDIMM3B_RX_P,
    fsr7_stciclk, 
    fsr7_stcid, 
    fsr7_testclkr, 
    fsr7_testclkt,
    fsr_bottom_atpgd,
    fsr_bottom_atpgq,
    FBDIMM3_REFCLK_N,
    FBDIMM3_REFCLK_P, 
    VDDA,
    VDDD,
    VDDR,
    VDDT,
    VSSA);
   
   output [11:0]  fsr7_mcu3_rd0;
   output [11:0]  fsr7_mcu3_rd1;
   output [11:0]  fsr7_mcu3_rd2;
   output [11:0]  fsr7_mcu3_rd3;
   output [11:0]  fsr7_mcu3_rd4;
   output [11:0]  fsr7_mcu3_rd5;
   output [11:0]  fsr7_mcu3_rd6;
   output [11:0]  fsr7_mcu3_rd7;
   output [11:0]  fsr7_mcu3_rd8;
   output [11:0]  fsr7_mcu3_rd9;
   output [11:0]  fsr7_mcu3_rd10;
   output [11:0]  fsr7_mcu3_rd11;
   output [11:0]  fsr7_mcu3_rd12;
   output [11:0]  fsr7_mcu3_rd13;
   output [9:0]   fsr7_mcu3_ststx_testfail;
   output [2:0]   fsr7_mcu3_stspll_lock;
   output [13:0]  fsr7_mcu3_stsrx_testfail;
   output [13:0]  fsr7_mcu3_stsrx_sync;
   output [13:0]  fsr7_mcu3_stsrx_losdtct;
   output [13:0]  fsr7_mcu3_stsrx_bsrxp;
   output [13:0]  fsr7_mcu3_stsrx_bsrxn;
   output [13:0]  fsr7_mcu3_rxbclk;
   output [9:0]   FBDIMM3B_TX_N; 
   output [9:0]   FBDIMM3B_TX_P;
   output [2:0]   FBDIMM3B_AMUX;	  
   output [2:0]	  fsr7_fdo;
   output [2:0]	  fsr7_stciq; 

   
   input [6:0]	  mcu3_fsr7_cfgpll0;
   input [6:0]	  mcu3_fsr7_cfgpll1;
   input [6:0]	  mcu3_fsr7_cfgpll2;
   input [19:0]   mcu3_fsr7_cfgrx0;
   input [19:0]	  mcu3_fsr7_cfgrx1;
   input [19:0]	  mcu3_fsr7_cfgrx2;
   input [19:0]	  mcu3_fsr7_cfgrx3;
   input [19:0]	  mcu3_fsr7_cfgrx4;
   input [19:0]   mcu3_fsr7_cfgrx5;
   input [19:0]	  mcu3_fsr7_cfgrx6;
   input [19:0]	  mcu3_fsr7_cfgrx7;
   input [19:0]	  mcu3_fsr7_cfgrx8;
   input [19:0]	  mcu3_fsr7_cfgrx9;
   input [19:0]	  mcu3_fsr7_cfgrx10;
   input [19:0]	  mcu3_fsr7_cfgrx11;
   input [19:0]	  mcu3_fsr7_cfgrx12;
   input [19:0]	  mcu3_fsr7_cfgrx13;
   input [15:0]	  mcu3_fsr7_cfgtx0;
   input [15:0]	  mcu3_fsr7_cfgtx1;
   input [15:0]	  mcu3_fsr7_cfgtx2;
   input [15:0]	  mcu3_fsr7_cfgtx3;
   input [15:0]	  mcu3_fsr7_cfgtx4;
   input [15:0]	  mcu3_fsr7_cfgtx5;
   input [15:0]	  mcu3_fsr7_cfgtx6;
   input [15:0]	  mcu3_fsr7_cfgtx7;
   input [15:0]	  mcu3_fsr7_cfgtx8;
   input [15:0]	  mcu3_fsr7_cfgtx9;
   input [17:0]	  mcu3_fsr7_testcfg0;
   input [17:0]	  mcu3_fsr7_testcfg1;
   input [17:0]	  mcu3_fsr7_testcfg2;
   input [11:0]   mcu3_fsr7_td0;
   input [11:0]   mcu3_fsr7_td1;
   input [11:0]   mcu3_fsr7_td2;
   input [11:0]   mcu3_fsr7_td3;
   input [11:0]   mcu3_fsr7_td4;
   input [11:0]   mcu3_fsr7_td5;
   input [11:0]   mcu3_fsr7_td6;
   input [11:0]   mcu3_fsr7_td7;
   input [11:0]   mcu3_fsr7_td8;
   input [11:0]   mcu3_fsr7_td9;
   input [5:0] 	  fsr7_stcicfg;
   input [2:0]	  fsr7_txbclkin;
   input [13:0]	  fsr7_rxbclkin;
   input [2:0]	  fsr7_bsinitclk; 
   input [2:0]	  fsr7_fclk; 
   input [2:0]	  fsr7_fclrz; 
   input [2:0]	  fsr7_fdi; 
   input [13:0]   FBDIMM3B_RX_N; 
   input [13:0]   FBDIMM3B_RX_P;
   input [2:0]	  fsr7_stciclk; 
   input [2:0]	  fsr7_stcid; 
   input [2:0]	  fsr7_testclkr; 
   input [2:0]	  fsr7_testclkt;
   
   input 	  fsr_bottom_atpgd;
   output 	  fsr_bottom_atpgq;
   
   input 	  FBDIMM3_REFCLK_N; 
   input 	  FBDIMM3_REFCLK_P;

   input 	  VDDA;
   input 	  VDDD;
   input 	  VDDR;
   input 	  VDDT;
   input 	  VSSA;

   assign clk622b_b_27 = FBDIMM3_REFCLK_P;
   assign clk622b_b_27x = FBDIMM3_REFCLK_N;
   assign clk622b_b_26 = FBDIMM3_REFCLK_P;
   assign clk622b_b_26x = FBDIMM3_REFCLK_N;
   assign clk622b_b_25 = FBDIMM3_REFCLK_P;
   assign clk622b_b_25x = FBDIMM3_REFCLK_N;
   
   wire [9:0] 	  fsr7_txbclk_unused;
   wire [13:0] 	  fsr7_rxbclklln_unused;
   wire [13:0] 	  fsr7_rxbclkllp_unused;
   wire [3:0] 	  fsr7_mcu3_stspll_b80;
   wire [3:0] 	  fsr7_mcu3_stspll_b81;
   wire [3:0] 	  fsr7_mcu3_stspll_b62;
   wire [3:0] 	  fsr7_mcu3_stsrx0_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx1_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx2_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx3_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx4_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx5_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx6_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx7_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx8_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx9_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx10_unused;	  
   wire [3:0] 	  fsr7_mcu3_stsrx11_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx12_unused; 	  
   wire [3:0] 	  fsr7_mcu3_stsrx13_unused; 
   wire [2:0] 	  fsr7_mcu3_ststx0_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx1_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx2_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx3_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx4_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx5_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx6_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx7_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx8_unused;	  
   wire [2:0] 	  fsr7_mcu3_ststx9_unused;
   wire [1:0] 	  fsr7_rdll0_b80;
   wire [1:0] 	  fsr7_rdll1_b80;
   wire [1:0] 	  fsr7_rdll2_b80;
   wire [1:0] 	  fsr7_rdll3_b80;
   wire [1:0] 	  fsr7_rdll0_b81;
   wire [1:0] 	  fsr7_rdll1_b81;
   wire [1:0] 	  fsr7_rdll2_b81;
   wire [1:0] 	  fsr7_rdll3_b81;
   wire [1:0] 	  fsr7_rdll0_b62;
   wire [1:0] 	  fsr7_rdll1_b62;
   wire [1:0] 	  fsr7_rdll2_b62;
   wire [1:0] 	  fsr7_rdll3_b62;

   wire 	  fsr7_atpgmq_b80;
   wire 	  fsr7_atpgmq_a8;
   wire 	  fsr7_atpgmq_b81;
   wire [3:0]	  fsr7_atpgrq_b80;
   wire [5:0]	  fsr7_atpgrq_a8;
   wire [3:0]	  fsr7_atpgrq_b81;
   wire [3:0]	  fsr7_atpgtq_b80;
   wire [1:0]	  fsr7_atpgtq_a8;
   wire [3:0]	  fsr7_atpgtq_b81;

// first serdes macro: rx ports 0-3, tx ports 0-3

wiz6c2b8n6d2t    fsr7_b8_0 (
  .bsinitclk 	    ( fsr7_bsinitclk[0]),
  .cfgpll       ({2'b0, mcu3_fsr7_cfgpll0[6:5], 3'b0, mcu3_fsr7_cfgpll0[4:0]}),
  .cfgrx0	({2'b0, mcu3_fsr7_cfgrx0[19:18], 1'b0, mcu3_fsr7_cfgrx0[17:9], 1'b0, mcu3_fsr7_cfgrx0[8], 
		  1'b0, mcu3_fsr7_cfgrx0[7:2], 3'b0, mcu3_fsr7_cfgrx0[1:0]}),
  .cfgrx1	({2'b0, mcu3_fsr7_cfgrx1[19:18], 1'b0, mcu3_fsr7_cfgrx1[17:9], 1'b0, mcu3_fsr7_cfgrx1[8], 
		  1'b0, mcu3_fsr7_cfgrx1[7:2], 3'b0, mcu3_fsr7_cfgrx1[1:0]}),
  .cfgrx2	({2'b0, mcu3_fsr7_cfgrx2[19:18], 1'b0, mcu3_fsr7_cfgrx2[17:9], 1'b0, mcu3_fsr7_cfgrx2[8], 
		  1'b0, mcu3_fsr7_cfgrx2[7:2], 3'b0, mcu3_fsr7_cfgrx2[1:0]}),
  .cfgrx3	({2'b0, mcu3_fsr7_cfgrx3[19:18], 1'b0, mcu3_fsr7_cfgrx3[17:9], 1'b0, mcu3_fsr7_cfgrx3[8], 
		  1'b0, mcu3_fsr7_cfgrx3[7:2], 3'b0, mcu3_fsr7_cfgrx3[1:0]}),
  .cfgtx0	({1'b0, mcu3_fsr7_cfgtx0[15:2], 3'b0, mcu3_fsr7_cfgtx0[1:0]}),
  .cfgtx1	({1'b0, mcu3_fsr7_cfgtx1[15:2], 3'b0, mcu3_fsr7_cfgtx1[1:0]}),
  .cfgtx2	({1'b0, mcu3_fsr7_cfgtx2[15:2], 3'b0, mcu3_fsr7_cfgtx2[1:0]}),
  .cfgtx3	({1'b0, mcu3_fsr7_cfgtx3[15:2], 3'b0, mcu3_fsr7_cfgtx3[1:0]}),
  .fclk 	    ( fsr7_fclk[0]     ),
  .fclrz 	    ( fsr7_fclrz[0]    ),
  .fdi 		    ( fsr7_fdi[0]      ),
  .refclkn 	    ( clk622b_b_27x  ),
  .refclkp 	    ( clk622b_b_27   ),
  .rxbclkin 	    ( fsr7_rxbclkin[3:0] ),
  .rxn0 	    ( FBDIMM3B_RX_N[0]   ),
  .rxn1 	    ( FBDIMM3B_RX_N[1]   ),
  .rxn2 	    ( FBDIMM3B_RX_N[2]   ),
  .rxn3 	    ( FBDIMM3B_RX_N[3]   ),
  .rxp0 	    ( FBDIMM3B_RX_P[0]   ),
  .rxp1 	    ( FBDIMM3B_RX_P[1]   ),
  .rxp2 	    ( FBDIMM3B_RX_P[2]   ),
  .rxp3 	    ( FBDIMM3B_RX_P[3]   ),
  .stcicfg 	    ( fsr7_stcicfg[1:0]  ),
  .stciclk 	    ( fsr7_stciclk[0]  ),
  .stcid 	    ( fsr7_stcid[0]    ),
  .td0 		    ( {mcu3_fsr7_td0[0], mcu3_fsr7_td0[1], mcu3_fsr7_td0[2], mcu3_fsr7_td0[3],
		       mcu3_fsr7_td0[4], mcu3_fsr7_td0[5], mcu3_fsr7_td0[6], mcu3_fsr7_td0[7],
		       mcu3_fsr7_td0[8], mcu3_fsr7_td0[9], mcu3_fsr7_td0[10], mcu3_fsr7_td0[11]} ),
  .td1 		    ( {mcu3_fsr7_td1[0], mcu3_fsr7_td1[1], mcu3_fsr7_td1[2], mcu3_fsr7_td1[3],
		       mcu3_fsr7_td1[4], mcu3_fsr7_td1[5], mcu3_fsr7_td1[6], mcu3_fsr7_td1[7],
		       mcu3_fsr7_td1[8], mcu3_fsr7_td1[9], mcu3_fsr7_td1[10], mcu3_fsr7_td1[11]} ),
  .td2 		    ( {mcu3_fsr7_td2[0], mcu3_fsr7_td2[1], mcu3_fsr7_td2[2], mcu3_fsr7_td2[3],
		       mcu3_fsr7_td2[4], mcu3_fsr7_td2[5], mcu3_fsr7_td2[6], mcu3_fsr7_td2[7],
		       mcu3_fsr7_td2[8], mcu3_fsr7_td2[9], mcu3_fsr7_td2[10], mcu3_fsr7_td2[11]} ),
  .td3 		    ( {mcu3_fsr7_td3[0], mcu3_fsr7_td3[1], mcu3_fsr7_td3[2], mcu3_fsr7_td3[3],
		       mcu3_fsr7_td3[4], mcu3_fsr7_td3[5], mcu3_fsr7_td3[6], mcu3_fsr7_td3[7],
		       mcu3_fsr7_td3[8], mcu3_fsr7_td3[9], mcu3_fsr7_td3[10], mcu3_fsr7_td3[11]} ),
  .testcfg 	    ( {mcu3_fsr7_testcfg0[17:14], 1'b0, mcu3_fsr7_testcfg0[13:11], 1'b0, mcu3_fsr7_testcfg0[10:0]}  ),
  .testclkr 	    ( fsr7_testclkr[0] ),
  .testclkt 	    ( fsr7_testclkt[0] ),
  .txbclkin 	    ( {4{fsr7_txbclkin[0]}} ),
  .amux 	    ( FBDIMM3B_AMUX[0]     ),
  .fdo 		    ( fsr7_fdo[0]      ),
  .rd0 		    ( {fsr7_mcu3_rd0[0], fsr7_mcu3_rd0[1], fsr7_mcu3_rd0[2], fsr7_mcu3_rd0[3], 
		       fsr7_mcu3_rd0[4], fsr7_mcu3_rd0[5], fsr7_mcu3_rd0[6], fsr7_mcu3_rd0[7], 
		       fsr7_mcu3_rd0[8], fsr7_mcu3_rd0[9], fsr7_mcu3_rd0[10], fsr7_mcu3_rd0[11]} ),
  .rd1 		    ( {fsr7_mcu3_rd1[0], fsr7_mcu3_rd1[1], fsr7_mcu3_rd1[2], fsr7_mcu3_rd1[3], 
		       fsr7_mcu3_rd1[4], fsr7_mcu3_rd1[5], fsr7_mcu3_rd1[6], fsr7_mcu3_rd1[7], 
		       fsr7_mcu3_rd1[8], fsr7_mcu3_rd1[9], fsr7_mcu3_rd1[10], fsr7_mcu3_rd1[11]} ),
  .rd2 		    ( {fsr7_mcu3_rd2[0], fsr7_mcu3_rd2[1], fsr7_mcu3_rd2[2], fsr7_mcu3_rd2[3], 
		       fsr7_mcu3_rd2[4], fsr7_mcu3_rd2[5], fsr7_mcu3_rd2[6], fsr7_mcu3_rd2[7], 
		       fsr7_mcu3_rd2[8], fsr7_mcu3_rd2[9], fsr7_mcu3_rd2[10], fsr7_mcu3_rd2[11]} ),
  .rd3 		    ( {fsr7_mcu3_rd3[0], fsr7_mcu3_rd3[1], fsr7_mcu3_rd3[2], fsr7_mcu3_rd3[3], 
		       fsr7_mcu3_rd3[4], fsr7_mcu3_rd3[5], fsr7_mcu3_rd3[6], fsr7_mcu3_rd3[7], 
		       fsr7_mcu3_rd3[8], fsr7_mcu3_rd3[9], fsr7_mcu3_rd3[10], fsr7_mcu3_rd3[11]} ),
  .rdll0 	    ( fsr7_rdll0_b80[1:0] ),
  .rdll1 	    ( fsr7_rdll1_b80[1:0] ),
  .rdll2 	    ( fsr7_rdll2_b80[1:0] ),
  .rdll3 	    ( fsr7_rdll3_b80[1:0] ),
  .rxbclk 	    ( fsr7_mcu3_rxbclk[3:0]   ),
  .rxbclklln 	    ( fsr7_rxbclklln_unused[3:0] ),
  .rxbclkllp 	    ( fsr7_rxbclkllp_unused[3:0] ),
  .stciq 	    ( fsr7_stciq[0]    ),
  .stspll 	    ( {fsr7_mcu3_stspll_b80[2:0], fsr7_mcu3_stspll_lock[0]} ),
  .stsrx0 	    ( {fsr7_mcu3_stsrx0_unused[2:1], fsr7_mcu3_stsrx_bsrxn[0], fsr7_mcu3_stsrx_bsrxp[0],
		       fsr7_mcu3_stsrx_losdtct[0], fsr7_mcu3_stsrx0_unused[0], fsr7_mcu3_stsrx_sync[0],
		       fsr7_mcu3_stsrx_testfail[0]} ),
  .stsrx1 	    ( {fsr7_mcu3_stsrx1_unused[2:1], fsr7_mcu3_stsrx_bsrxn[1], fsr7_mcu3_stsrx_bsrxp[1],
		       fsr7_mcu3_stsrx_losdtct[1], fsr7_mcu3_stsrx1_unused[0], fsr7_mcu3_stsrx_sync[1],
		       fsr7_mcu3_stsrx_testfail[1]} ),
  .stsrx2 	    ( {fsr7_mcu3_stsrx2_unused[2:1], fsr7_mcu3_stsrx_bsrxn[2], fsr7_mcu3_stsrx_bsrxp[2],
		       fsr7_mcu3_stsrx_losdtct[2], fsr7_mcu3_stsrx2_unused[0], fsr7_mcu3_stsrx_sync[2],
		       fsr7_mcu3_stsrx_testfail[2]} ),
  .stsrx3 	    ( {fsr7_mcu3_stsrx3_unused[2:1], fsr7_mcu3_stsrx_bsrxn[3], fsr7_mcu3_stsrx_bsrxp[3],
		       fsr7_mcu3_stsrx_losdtct[3], fsr7_mcu3_stsrx3_unused[0], fsr7_mcu3_stsrx_sync[3],
		       fsr7_mcu3_stsrx_testfail[3]} ),
  .ststx0 	    ( {fsr7_mcu3_ststx0_unused[2:0], fsr7_mcu3_ststx_testfail[0]} ),
  .ststx1 	    ( {fsr7_mcu3_ststx1_unused[2:0], fsr7_mcu3_ststx_testfail[1]} ),
  .ststx2 	    ( {fsr7_mcu3_ststx2_unused[2:0], fsr7_mcu3_ststx_testfail[2]} ),
  .ststx3 	    ( {fsr7_mcu3_ststx3_unused[2:0], fsr7_mcu3_ststx_testfail[3]} ),
  .txbclk 	    ( fsr7_txbclk_unused[3:0] ),
  .txn0 	    ( FBDIMM3B_TX_N[0]   ),
  .txn1 	    ( FBDIMM3B_TX_N[1]   ),
  .txn2 	    ( FBDIMM3B_TX_N[2]   ),
  .txn3 	    ( FBDIMM3B_TX_N[3]   ),
  .txp0 	    ( FBDIMM3B_TX_P[0]   ),
  .txp1 	    ( FBDIMM3B_TX_P[1]   ),
  .txp2 	    ( FBDIMM3B_TX_P[2]   ),
  .txp3 	    ( FBDIMM3B_TX_P[3]   ),
  .atpgmd           ( fsr7_atpgtq_b80[1] ),
  .atpgmq           ( fsr7_atpgmq_b80 ),
  .atpgrd           ( {fsr7_atpgrq_b80[2],fsr7_atpgtq_b80[2],fsr7_atpgrq_b80[0],fsr7_atpgtq_b80[0]} ),
  .atpgrq           ( fsr7_atpgrq_b80[3:0] ),
  .atpgtd           ( {fsr7_atpgrq_b80[3],fsr7_atpgmq_b80,fsr7_atpgrq_b80[1],fsr_bottom_atpgd} ),
  .atpgtq           ( fsr7_atpgtq_b80[3:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );


// second serdes macro: RX ports 4-9, TX ports 4-5
   
wiz6c2a8n6d2t fsr7_a8 (
  .bsinitclk 	    ( fsr7_bsinitclk[1]),
  .cfgpll       ({2'b0, mcu3_fsr7_cfgpll1[6:5], 3'b0, mcu3_fsr7_cfgpll1[4:0]}),
  .cfgrx0	({2'b0, mcu3_fsr7_cfgrx4[19:18], 1'b0, mcu3_fsr7_cfgrx4[17:9], 1'b0, mcu3_fsr7_cfgrx4[8], 
		  1'b0, mcu3_fsr7_cfgrx4[7:2], 3'b0, mcu3_fsr7_cfgrx4[1:0]}),
  .cfgrx1	({2'b0, mcu3_fsr7_cfgrx5[19:18], 1'b0, mcu3_fsr7_cfgrx5[17:9], 1'b0, mcu3_fsr7_cfgrx5[8], 
		  1'b0, mcu3_fsr7_cfgrx5[7:2], 3'b0, mcu3_fsr7_cfgrx5[1:0]}),
  .cfgrx2	({2'b0, mcu3_fsr7_cfgrx6[19:18], 1'b0, mcu3_fsr7_cfgrx6[17:9], 1'b0, mcu3_fsr7_cfgrx6[8], 
		  1'b0, mcu3_fsr7_cfgrx6[7:2], 3'b0, mcu3_fsr7_cfgrx6[1:0]}),
  .cfgrx3	({2'b0, mcu3_fsr7_cfgrx7[19:18], 1'b0, mcu3_fsr7_cfgrx7[17:9], 1'b0, mcu3_fsr7_cfgrx7[8], 
		  1'b0, mcu3_fsr7_cfgrx7[7:2], 3'b0, mcu3_fsr7_cfgrx7[1:0]}),
  .cfgrx4	({2'b0, mcu3_fsr7_cfgrx8[19:18], 1'b0, mcu3_fsr7_cfgrx8[17:9], 1'b0, mcu3_fsr7_cfgrx8[8], 
		  1'b0, mcu3_fsr7_cfgrx8[7:2], 3'b0, mcu3_fsr7_cfgrx8[1:0]}),
  .cfgrx5	({2'b0, mcu3_fsr7_cfgrx9[19:18], 1'b0, mcu3_fsr7_cfgrx9[17:9], 1'b0, mcu3_fsr7_cfgrx9[8], 
		  1'b0, mcu3_fsr7_cfgrx9[7:2], 3'b0, mcu3_fsr7_cfgrx9[1:0]}),
  .cfgtx0	({1'b0, mcu3_fsr7_cfgtx4[15:2], 3'b0, mcu3_fsr7_cfgtx4[1:0]}),
  .cfgtx1	({1'b0, mcu3_fsr7_cfgtx5[15:2], 3'b0, mcu3_fsr7_cfgtx5[1:0]}),
  .fclk 	    ( fsr7_fclk[1]     ),
  .fclrz 	    ( fsr7_fclrz[1]    ),
  .fdi 		    ( fsr7_fdi[1]      ),
  .refclkn 	    ( clk622b_b_26x  ),
  .refclkp 	    ( clk622b_b_26  ),
  .rxbclkin 	    ( fsr7_rxbclkin[9:4] ),
  .rxn0 	    ( FBDIMM3B_RX_N[4]   ),
  .rxn1 	    ( FBDIMM3B_RX_N[5]   ),
  .rxn2 	    ( FBDIMM3B_RX_N[6]   ),
  .rxn3 	    ( FBDIMM3B_RX_N[7]   ),
  .rxn4 	    ( FBDIMM3B_RX_N[8]   ),
  .rxn5 	    ( FBDIMM3B_RX_N[9]   ),
  .rxp0 	    ( FBDIMM3B_RX_P[4]   ),
  .rxp1 	    ( FBDIMM3B_RX_P[5]   ),
  .rxp2 	    ( FBDIMM3B_RX_P[6]   ),
  .rxp3 	    ( FBDIMM3B_RX_P[7]   ),
  .rxp4 	    ( FBDIMM3B_RX_P[8]   ),
  .rxp5 	    ( FBDIMM3B_RX_P[9]   ),
  .stcicfg 	    ( fsr7_stcicfg[3:2]  ),
  .stciclk 	    ( fsr7_stciclk[1]  ),
  .stcid 	    ( fsr7_stcid[1]    ),
  .td0 		    ( {mcu3_fsr7_td4[0], mcu3_fsr7_td4[1], mcu3_fsr7_td4[2], mcu3_fsr7_td4[3],
			       mcu3_fsr7_td4[4], mcu3_fsr7_td4[5], mcu3_fsr7_td4[6], mcu3_fsr7_td4[7],
			       mcu3_fsr7_td4[8], mcu3_fsr7_td4[9], mcu3_fsr7_td4[10], mcu3_fsr7_td4[11]} ),
  .td1 		    ( {mcu3_fsr7_td5[0], mcu3_fsr7_td5[1], mcu3_fsr7_td5[2], mcu3_fsr7_td5[3],
			       mcu3_fsr7_td5[4], mcu3_fsr7_td5[5], mcu3_fsr7_td5[6], mcu3_fsr7_td5[7],
			       mcu3_fsr7_td5[8], mcu3_fsr7_td5[9], mcu3_fsr7_td5[10], mcu3_fsr7_td5[11]} ),
  .testcfg 	    ( {mcu3_fsr7_testcfg1[17:14], 1'b0, mcu3_fsr7_testcfg1[13:11], 1'b0, mcu3_fsr7_testcfg1[10:0]}  ),
  .testclkr 	    ( fsr7_testclkr[1] ),
  .testclkt 	    ( fsr7_testclkt[1] ),
  .txbclkin 	    ( {2{fsr7_txbclkin[1]}} ),
  .amux 	    ( FBDIMM3B_AMUX[1]     ),
  .fdo 		    ( fsr7_fdo[1]      ),
  .rd0 		    ( {fsr7_mcu3_rd4[0], fsr7_mcu3_rd4[1], fsr7_mcu3_rd4[2], fsr7_mcu3_rd4[3], 
		       fsr7_mcu3_rd4[4], fsr7_mcu3_rd4[5], fsr7_mcu3_rd4[6], fsr7_mcu3_rd4[7], 
		       fsr7_mcu3_rd4[8], fsr7_mcu3_rd4[9], fsr7_mcu3_rd4[10], fsr7_mcu3_rd4[11]} ),
  .rd1 		    ( {fsr7_mcu3_rd5[0], fsr7_mcu3_rd5[1], fsr7_mcu3_rd5[2], fsr7_mcu3_rd5[3], 
		       fsr7_mcu3_rd5[4], fsr7_mcu3_rd5[5], fsr7_mcu3_rd5[6], fsr7_mcu3_rd5[7], 
		       fsr7_mcu3_rd5[8], fsr7_mcu3_rd5[9], fsr7_mcu3_rd5[10], fsr7_mcu3_rd5[11]} ),
  .rd2 		    ( {fsr7_mcu3_rd6[0], fsr7_mcu3_rd6[1], fsr7_mcu3_rd6[2], fsr7_mcu3_rd6[3], 
		       fsr7_mcu3_rd6[4], fsr7_mcu3_rd6[5], fsr7_mcu3_rd6[6], fsr7_mcu3_rd6[7], 
		       fsr7_mcu3_rd6[8], fsr7_mcu3_rd6[9], fsr7_mcu3_rd6[10], fsr7_mcu3_rd6[11]} ),
  .rd3 		    ( {fsr7_mcu3_rd7[0], fsr7_mcu3_rd7[1], fsr7_mcu3_rd7[2], fsr7_mcu3_rd7[3], 
		       fsr7_mcu3_rd7[4], fsr7_mcu3_rd7[5], fsr7_mcu3_rd7[6], fsr7_mcu3_rd7[7], 
		       fsr7_mcu3_rd7[8], fsr7_mcu3_rd7[9], fsr7_mcu3_rd7[10], fsr7_mcu3_rd7[11]} ),
  .rd4 		    ( {fsr7_mcu3_rd8[0], fsr7_mcu3_rd8[1], fsr7_mcu3_rd8[2], fsr7_mcu3_rd8[3], 
		       fsr7_mcu3_rd8[4], fsr7_mcu3_rd8[5], fsr7_mcu3_rd8[6], fsr7_mcu3_rd8[7], 
		       fsr7_mcu3_rd8[8], fsr7_mcu3_rd8[9], fsr7_mcu3_rd8[10], fsr7_mcu3_rd8[11]} ),
  .rd5 		    ( {fsr7_mcu3_rd9[0], fsr7_mcu3_rd9[1], fsr7_mcu3_rd9[2], fsr7_mcu3_rd9[3], 
		       fsr7_mcu3_rd9[4], fsr7_mcu3_rd9[5], fsr7_mcu3_rd9[6], fsr7_mcu3_rd9[7], 
		       fsr7_mcu3_rd9[8], fsr7_mcu3_rd9[9], fsr7_mcu3_rd9[10], fsr7_mcu3_rd9[11]} ),
  .rdll0 	    ( fsr7_rdll0_b62[1:0] ),
  .rdll1 	    ( fsr7_rdll1_b62[1:0] ),
  .rdll2 	    ( fsr7_rdll2_b62[1:0] ),
  .rdll3 	    ( fsr7_rdll3_b62[1:0] ),
  .rxbclk 	    ( fsr7_mcu3_rxbclk[9:4]   ),
  .rxbclklln 	    ( fsr7_rxbclklln_unused[9:4] ),
  .rxbclkllp 	    ( fsr7_rxbclkllp_unused[9:4] ),
  .stciq 	    ( fsr7_stciq[1]    ),
  .stspll 	    ( {fsr7_mcu3_stspll_b62[2:0], fsr7_mcu3_stspll_lock[1]} ),
  .stsrx0 	    ( {fsr7_mcu3_stsrx4_unused[2:1], fsr7_mcu3_stsrx_bsrxn[4], fsr7_mcu3_stsrx_bsrxp[4],
		       fsr7_mcu3_stsrx_losdtct[4], fsr7_mcu3_stsrx4_unused[0], fsr7_mcu3_stsrx_sync[4],
		       fsr7_mcu3_stsrx_testfail[4]} ),
  .stsrx1 	    ( {fsr7_mcu3_stsrx5_unused[2:1], fsr7_mcu3_stsrx_bsrxn[5], fsr7_mcu3_stsrx_bsrxp[5],
		       fsr7_mcu3_stsrx_losdtct[5], fsr7_mcu3_stsrx5_unused[0], fsr7_mcu3_stsrx_sync[5],
		       fsr7_mcu3_stsrx_testfail[5]} ),
  .stsrx2 	    ( {fsr7_mcu3_stsrx6_unused[2:1], fsr7_mcu3_stsrx_bsrxn[6], fsr7_mcu3_stsrx_bsrxp[6],
		       fsr7_mcu3_stsrx_losdtct[6], fsr7_mcu3_stsrx6_unused[0], fsr7_mcu3_stsrx_sync[6],
		       fsr7_mcu3_stsrx_testfail[6]} ),
  .stsrx3 	    ( {fsr7_mcu3_stsrx7_unused[2:1], fsr7_mcu3_stsrx_bsrxn[7], fsr7_mcu3_stsrx_bsrxp[7],
		       fsr7_mcu3_stsrx_losdtct[7], fsr7_mcu3_stsrx7_unused[0], fsr7_mcu3_stsrx_sync[7],
		       fsr7_mcu3_stsrx_testfail[7]} ),
  .stsrx4 	    ( {fsr7_mcu3_stsrx8_unused[2:1], fsr7_mcu3_stsrx_bsrxn[8], fsr7_mcu3_stsrx_bsrxp[8],
		       fsr7_mcu3_stsrx_losdtct[8], fsr7_mcu3_stsrx8_unused[0], fsr7_mcu3_stsrx_sync[8],
		       fsr7_mcu3_stsrx_testfail[8]} ),
  .stsrx5 	    ( {fsr7_mcu3_stsrx9_unused[2:1], fsr7_mcu3_stsrx_bsrxn[9], fsr7_mcu3_stsrx_bsrxp[9],
		       fsr7_mcu3_stsrx_losdtct[9], fsr7_mcu3_stsrx9_unused[0], fsr7_mcu3_stsrx_sync[9],
		       fsr7_mcu3_stsrx_testfail[9]} ),
  .ststx0 	    ( {fsr7_mcu3_ststx4_unused[2:0], fsr7_mcu3_ststx_testfail[4]} ),
  .ststx1 	    ( {fsr7_mcu3_ststx5_unused[2:0], fsr7_mcu3_ststx_testfail[5]} ),
  .txbclk 	    ( fsr7_txbclk_unused[5:4] ),
  .txn0 	    ( FBDIMM3B_TX_N[4] ),
  .txn1 	    ( FBDIMM3B_TX_N[5] ),
  .txp0 	    ( FBDIMM3B_TX_P[4] ),
  .txp1 	    ( FBDIMM3B_TX_P[5] ),
  .atpgmd           ( fsr7_atpgrq_a8[4] ),
  .atpgmq           ( fsr7_atpgmq_a8 ),
  .atpgrd           ( {fsr7_atpgmq_a8,fsr7_atpgrq_a8[1],fsr7_atpgrq_a8[2],fsr7_atpgrq_a8[5],fsr7_atpgrq_a8[0],
		       fsr7_atpgtq_a8[0]} ),
  .atpgrq           ( fsr7_atpgrq_a8[5:0] ),
  .atpgtd           ( {fsr7_atpgrq_a8[3],fsr7_atpgtq_b80[3]} ),
  .atpgtq           ( fsr7_atpgtq_a8[1:0] ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );

// third serdes macro: RX ports 10-13, TX ports 6-9
   
wiz6c2b8n6d2t    fsr7_b8_1 (
  .bsinitclk 	    ( fsr7_bsinitclk[2]),
  .cfgpll       ({2'b0, mcu3_fsr7_cfgpll2[6:5], 3'b0, mcu3_fsr7_cfgpll2[4:0]}),
  .cfgrx0	({2'b0, mcu3_fsr7_cfgrx10[19:18], 1'b0, mcu3_fsr7_cfgrx10[17:9], 1'b0, mcu3_fsr7_cfgrx10[8], 
		  1'b0, mcu3_fsr7_cfgrx10[7:2], 3'b0, mcu3_fsr7_cfgrx10[1:0]}),
  .cfgrx1	({2'b0, mcu3_fsr7_cfgrx11[19:18], 1'b0, mcu3_fsr7_cfgrx11[17:9], 1'b0, mcu3_fsr7_cfgrx11[8], 
		  1'b0, mcu3_fsr7_cfgrx11[7:2], 3'b0, mcu3_fsr7_cfgrx11[1:0]}),
  .cfgrx2	({2'b0, mcu3_fsr7_cfgrx12[19:18], 1'b0, mcu3_fsr7_cfgrx12[17:9], 1'b0, mcu3_fsr7_cfgrx12[8], 
		  1'b0, mcu3_fsr7_cfgrx12[7:2], 3'b0, mcu3_fsr7_cfgrx12[1:0]}),
  .cfgrx3	({2'b0, mcu3_fsr7_cfgrx13[19:18], 1'b0, mcu3_fsr7_cfgrx13[17:9], 1'b0, mcu3_fsr7_cfgrx13[8], 
		  1'b0, mcu3_fsr7_cfgrx13[7:2], 3'b0, mcu3_fsr7_cfgrx13[1:0]}),
  .cfgtx0	({1'b0, mcu3_fsr7_cfgtx6[15:2], 3'b0, mcu3_fsr7_cfgtx6[1:0]}),
  .cfgtx1	({1'b0, mcu3_fsr7_cfgtx7[15:2], 3'b0, mcu3_fsr7_cfgtx7[1:0]}),
  .cfgtx2	({1'b0, mcu3_fsr7_cfgtx8[15:2], 3'b0, mcu3_fsr7_cfgtx8[1:0]}),
  .cfgtx3	({1'b0, mcu3_fsr7_cfgtx9[15:2], 3'b0, mcu3_fsr7_cfgtx9[1:0]}),
  .fclk 	    ( fsr7_fclk[2]     ),
  .fclrz 	    ( fsr7_fclrz[2]    ),
  .fdi 		    ( fsr7_fdi[2]      ),
  .refclkn 	    ( clk622b_b_25x  ),
  .refclkp 	    ( clk622b_b_25  ),
  .rxbclkin 	    ( fsr7_rxbclkin[13:10] ),
  .rxn0 	    ( FBDIMM3B_RX_N[10]   ),
  .rxn1 	    ( FBDIMM3B_RX_N[11]   ),
  .rxn2 	    ( FBDIMM3B_RX_N[12]   ),
  .rxn3 	    ( FBDIMM3B_RX_N[13]   ),
  .rxp0 	    ( FBDIMM3B_RX_P[10]   ),
  .rxp1 	    ( FBDIMM3B_RX_P[11]   ),
  .rxp2 	    ( FBDIMM3B_RX_P[12]   ),
  .rxp3 	    ( FBDIMM3B_RX_P[13]   ),
  .stcicfg 	    ( fsr7_stcicfg[5:4]  ),
  .stciclk 	    ( fsr7_stciclk[2]  ),
  .stcid 	    ( fsr7_stcid[2]    ),
  .td0 		    ( {mcu3_fsr7_td6[0], mcu3_fsr7_td6[1], mcu3_fsr7_td6[2], mcu3_fsr7_td6[3],
		       mcu3_fsr7_td6[4], mcu3_fsr7_td6[5], mcu3_fsr7_td6[6], mcu3_fsr7_td6[7],
		       mcu3_fsr7_td6[8], mcu3_fsr7_td6[9], mcu3_fsr7_td6[10], mcu3_fsr7_td6[11]} ),
  .td1 		    ( {mcu3_fsr7_td7[0], mcu3_fsr7_td7[1], mcu3_fsr7_td7[2], mcu3_fsr7_td7[3],
		       mcu3_fsr7_td7[4], mcu3_fsr7_td7[5], mcu3_fsr7_td7[6], mcu3_fsr7_td7[7],
		       mcu3_fsr7_td7[8], mcu3_fsr7_td7[9], mcu3_fsr7_td7[10], mcu3_fsr7_td7[11]} ),
  .td2 		    ( {mcu3_fsr7_td8[0], mcu3_fsr7_td8[1], mcu3_fsr7_td8[2], mcu3_fsr7_td8[3],
		       mcu3_fsr7_td8[4], mcu3_fsr7_td8[5], mcu3_fsr7_td8[6], mcu3_fsr7_td8[7],
		       mcu3_fsr7_td8[8], mcu3_fsr7_td8[9], mcu3_fsr7_td8[10], mcu3_fsr7_td8[11]} ),
  .td3 		    ( {mcu3_fsr7_td9[0], mcu3_fsr7_td9[1], mcu3_fsr7_td9[2], mcu3_fsr7_td9[3],
		       mcu3_fsr7_td9[4], mcu3_fsr7_td9[5], mcu3_fsr7_td9[6], mcu3_fsr7_td9[7],
		       mcu3_fsr7_td9[8], mcu3_fsr7_td9[9], mcu3_fsr7_td9[10], mcu3_fsr7_td9[11]} ),
  .testcfg 	    ( {mcu3_fsr7_testcfg2[17:14], 1'b0, mcu3_fsr7_testcfg2[13:11], 1'b0, mcu3_fsr7_testcfg2[10:0]}  ),
  .testclkr 	    ( fsr7_testclkr[2] ),
  .testclkt 	    ( fsr7_testclkt[2] ),
  .txbclkin 	    ( {4{fsr7_txbclkin[2]}} ),
  .amux 	    ( FBDIMM3B_AMUX[2]     ),
  .fdo 		    ( fsr7_fdo[2]      ),
  .rd0 		    ( {fsr7_mcu3_rd10[0], fsr7_mcu3_rd10[1], fsr7_mcu3_rd10[2], fsr7_mcu3_rd10[3], 
		       fsr7_mcu3_rd10[4], fsr7_mcu3_rd10[5], fsr7_mcu3_rd10[6], fsr7_mcu3_rd10[7], 
		       fsr7_mcu3_rd10[8], fsr7_mcu3_rd10[9], fsr7_mcu3_rd10[10], fsr7_mcu3_rd10[11]} ),
  .rd1 		    ( {fsr7_mcu3_rd11[0], fsr7_mcu3_rd11[1], fsr7_mcu3_rd11[2], fsr7_mcu3_rd11[3], 
		       fsr7_mcu3_rd11[4], fsr7_mcu3_rd11[5], fsr7_mcu3_rd11[6], fsr7_mcu3_rd11[7], 
		       fsr7_mcu3_rd11[8], fsr7_mcu3_rd11[9], fsr7_mcu3_rd11[10], fsr7_mcu3_rd11[11]} ),
  .rd2 		    ( {fsr7_mcu3_rd12[0], fsr7_mcu3_rd12[1], fsr7_mcu3_rd12[2], fsr7_mcu3_rd12[3], 
		       fsr7_mcu3_rd12[4], fsr7_mcu3_rd12[5], fsr7_mcu3_rd12[6], fsr7_mcu3_rd12[7], 
		       fsr7_mcu3_rd12[8], fsr7_mcu3_rd12[9], fsr7_mcu3_rd12[10], fsr7_mcu3_rd12[11]} ),
  .rd3 		    ( {fsr7_mcu3_rd13[0], fsr7_mcu3_rd13[1], fsr7_mcu3_rd13[2], fsr7_mcu3_rd13[3], 
		       fsr7_mcu3_rd13[4], fsr7_mcu3_rd13[5], fsr7_mcu3_rd13[6], fsr7_mcu3_rd13[7], 
		       fsr7_mcu3_rd13[8], fsr7_mcu3_rd13[9], fsr7_mcu3_rd13[10], fsr7_mcu3_rd13[11]} ),
  .rdll0 	    ( fsr7_rdll0_b81[1:0] ),
  .rdll1 	    ( fsr7_rdll1_b81[1:0] ),
  .rdll2 	    ( fsr7_rdll2_b81[1:0] ),
  .rdll3 	    ( fsr7_rdll3_b81[1:0] ),
  .rxbclk 	    ( fsr7_mcu3_rxbclk[13:10]   ),
  .rxbclklln 	    ( fsr7_rxbclklln_unused[13:10] ),
  .rxbclkllp 	    ( fsr7_rxbclkllp_unused[13:10] ),
  .stciq 	    ( fsr7_stciq[2]    ),
  .stspll 	    ( {fsr7_mcu3_stspll_b81[2:0], fsr7_mcu3_stspll_lock[2]} ),
  .stsrx0 	    ( {fsr7_mcu3_stsrx10_unused[2:1], fsr7_mcu3_stsrx_bsrxn[10], fsr7_mcu3_stsrx_bsrxp[10],
		       fsr7_mcu3_stsrx_losdtct[10], fsr7_mcu3_stsrx10_unused[0], fsr7_mcu3_stsrx_sync[10],
		       fsr7_mcu3_stsrx_testfail[10]} ),
  .stsrx1 	    ( {fsr7_mcu3_stsrx11_unused[2:1], fsr7_mcu3_stsrx_bsrxn[11], fsr7_mcu3_stsrx_bsrxp[11],
		       fsr7_mcu3_stsrx_losdtct[11], fsr7_mcu3_stsrx11_unused[0], fsr7_mcu3_stsrx_sync[11],
		       fsr7_mcu3_stsrx_testfail[11]} ),
  .stsrx2 	    ( {fsr7_mcu3_stsrx12_unused[2:1], fsr7_mcu3_stsrx_bsrxn[12], fsr7_mcu3_stsrx_bsrxp[12],
		       fsr7_mcu3_stsrx_losdtct[12], fsr7_mcu3_stsrx12_unused[0], fsr7_mcu3_stsrx_sync[12],
		       fsr7_mcu3_stsrx_testfail[12]} ),
  .stsrx3 	    ( {fsr7_mcu3_stsrx13_unused[2:1], fsr7_mcu3_stsrx_bsrxn[13], fsr7_mcu3_stsrx_bsrxp[13],
		       fsr7_mcu3_stsrx_losdtct[13], fsr7_mcu3_stsrx13_unused[0], fsr7_mcu3_stsrx_sync[13],
		       fsr7_mcu3_stsrx_testfail[13]} ),
  .ststx0 	    ( {fsr7_mcu3_ststx6_unused[2:0], fsr7_mcu3_ststx_testfail[6]} ),
  .ststx1 	    ( {fsr7_mcu3_ststx7_unused[2:0], fsr7_mcu3_ststx_testfail[7]} ),
  .ststx2 	    ( {fsr7_mcu3_ststx8_unused[2:0], fsr7_mcu3_ststx_testfail[8]} ),
  .ststx3 	    ( {fsr7_mcu3_ststx9_unused[2:0], fsr7_mcu3_ststx_testfail[9]} ),
  .txbclk 	    ( fsr7_txbclk_unused[9:6]   ),
  .txn0 	    ( FBDIMM3B_TX_N[6]   ),
  .txn1 	    ( FBDIMM3B_TX_N[7]   ),
  .txn2 	    ( FBDIMM3B_TX_N[8]   ),
  .txn3 	    ( FBDIMM3B_TX_N[9]   ),
  .txp0 	    ( FBDIMM3B_TX_P[6]   ),
  .txp1 	    ( FBDIMM3B_TX_P[7]   ),
  .txp2 	    ( FBDIMM3B_TX_P[8]   ),
  .txp3 	    ( FBDIMM3B_TX_P[9]   ),
  .atpgmd           ( fsr7_atpgtq_b81[1] ),
  .atpgmq           ( fsr7_atpgmq_b81 ),
  .atpgrd           ( {fsr7_atpgrq_b81[2],fsr7_atpgtq_b81[2],fsr7_atpgrq_b81[0],fsr7_atpgtq_b81[0]} ),
  .atpgrq           ( fsr7_atpgrq_b81[3:0] ),
  .atpgtd           ( {fsr7_atpgrq_b81[3],fsr7_atpgmq_b81,fsr7_atpgrq_b81[1],fsr7_atpgtq_a8[1]} ),
  .atpgtq           ( {fsr_bottom_atpgq,fsr7_atpgtq_b81[2:0]} ),
  .vdda 	    ( VDDA     ),
  .vddd 	    ( VDDD     ),
  .vddr 	    ( VDDR     ),
  .vddt 	    ( VDDT     ),
  .vssa 	    ( VSSA     )
 );    

endmodule

