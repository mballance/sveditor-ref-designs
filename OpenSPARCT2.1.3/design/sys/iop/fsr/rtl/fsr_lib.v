// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: fsr_lib.v
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
module wiz6c2a8n6d2t ( amux, fdo, rd0, rd1, rd2, rd3, rd4, rd5, 
			rdll0, rdll1, rdll2, rdll3, rdll4, rdll5, 
			rxbclk, rxbclklln, rxbclkllp, 
			stciq, stspll, 
			stsrx0, stsrx1, stsrx2, stsrx3, stsrx4, stsrx5, 
			ststx0, ststx1, // STSTX2, STSTX3, 
			txbclk, 
			txn0, txn1, // TXN2, TXN3, 
			txp0, txp1, // TXP2, TXP3, 
			bsinitclk, cfgpll, 
			cfgrx0, cfgrx1, cfgrx2, cfgrx3, cfgrx4, cfgrx5, 
			cfgtx0, cfgtx1, // CFGTX2, CFGTX3, 
			fclk, fclrz, fdi, refclkn, refclkp, rxbclkin, 
			rxn0, rxn1, rxn2, rxn3, rxn4, rxn5, 
			rxp0, rxp1, rxp2, rxp3, rxp4, rxp5, 
			stcicfg, stciclk, stcid, 
			td0, td1, // TD2, TD3, 
			testcfg, testclkr, testclkt, txbclkin,
			atpgmd, atpgmq, atpgrd, atpgrq, atpgtd, atpgtq,
			vdd, vdda, vddd, vddr, vddt, vss, vssa );
wire scan_in;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire se;
wire scan_out;


output  amux, fdo, stciq, 
	txn0, txn1, // TXN2, TXN3, 
	txp0, txp1  //, TXP2, TXP3
	;

input  bsinitclk, fclk, fclrz, fdi, refclkn, refclkp, 
       rxn0, rxn1, rxn2, rxn3, rxn4, rxn5, 
       rxp0, rxp1, rxp2, rxp3, rxp4, rxp5, 
       stciclk, stcid, testclkr, testclkt, 
       vdd, vdda, vddd, vddr, vddt, vss, vssa;

output [11:0]  rd0;
output [11:0]  rd1;
output [11:0]  rd2;
output [11:0]  rd3;
output [11:0]  rd4; // added
output [11:0]  rd5; // added
output [3:0]  ststx0;
output [3:0]  ststx1;
//output [3:0]  STSTX2;
//output [3:0]  STSTX3;
output [3:0]  stspll;
output [1:0]  rdll0;
output [1:0]  rdll1;
output [1:0]  rdll2;
output [1:0]  rdll3;
output [1:0]  rdll4; // added
output [1:0]  rdll5; // added
output [7:0]  stsrx0;
output [7:0]  stsrx1;
output [7:0]  stsrx2;
output [7:0]  stsrx3;
output [7:0]  stsrx4; // added
output [7:0]  stsrx5; // added
output [5:0]  rxbclk; // added 5:4
output [1:0]  txbclk; // deleted 3:2
output [5:0]  rxbclklln; // added 5:4
output [5:0]  rxbclkllp; // added 5:4

input [11:0]  cfgpll;
input [27:0]  cfgrx0;
input [27:0]  cfgrx1;
input [27:0]  cfgrx2;
input [27:0]  cfgrx3;
input [27:0]  cfgrx4; // added
input [27:0]  cfgrx5; // added
input [19:0]  cfgtx0;
input [19:0]  cfgtx1;
//input [19:0]  CFGTX2;
//input [19:0]  CFGTX3;
input [1:0]  stcicfg;
input [11:0]  td0;
input [11:0]  td1;
//input [11:0]  TD2;
//input [11:0]  TD3;
input [19:0]  testcfg;
input [1:0]  txbclkin; // deleted 3:2
input [5:0]  rxbclkin; // added 5:4

 input        atpgmd;
 input  [5:0] atpgrd;
 input  [1:0] atpgtd;
 output       atpgmq;
 output [5:0] atpgrq;
 output [1:0] atpgtq;

   wire       pll_lock;
   wire [7:0] pll_lock_cnt_in, pll_lock_cnt;

// Misc. outputs
assign rdll0 = 2'b00;
assign rdll1 = 2'b00;
assign rdll2 = 2'b11;
assign rdll3 = 2'b11;
assign rdll4 = 2'b00;
assign rdll5 = 2'b00;
assign amux  = 1'b0;
assign fdo   = 1'b0;
assign stciq = 1'b0;
assign stspll = {3'b000, pll_lock};
   
// Scan signals for sunv
assign scan_in = 1'b0;
assign siclk = `CPU.tcu_aclk & `CPU.tcu_mcu_testmode;
assign soclk = `CPU.tcu_bclk & `CPU.tcu_mcu_testmode;
assign pce_ov = `CPU.tcu_pce_ov;
assign stop = 1'b0;
assign se = `CPU.tcu_scan_en & `CPU.tcu_mcu_testmode;

   // ATPG
   assign atpgmq = atpgmd;
   assign atpgrq[5:0] = atpgrd[5:0];
   assign atpgtq[1:0] = atpgtd[1:0];

   assign pll_lock = pll_lock_cnt[7:0] == 8'hff;
   assign pll_lock_cnt_in[7:0] = pll_lock & cfgpll[0] ? 8'hff : cfgpll[0] ? pll_lock_cnt[7:0] + 8'h1 : 8'h0;
dff #(8) ff_pll_lock_cnt (
.l1clk(refclkp),
.siclk(siclk),
.soclk(soclk),
.d(pll_lock_cnt_in[7:0]),
.si(8'h0),
.so(),
.q(pll_lock_cnt[7:0])
);

// Receive SERDES
   fsr_rx rx0 	    (
		    // Outputs
	.rd	    (rd0[11:0]),
	.stsrx	    (stsrx0[7:0]),
	.rxbclklln  (rxbclklln[0]),
	.rxbclkllp  (rxbclkllp[0]),
	.rxbclk	    (rxbclk[0]),
		    
		    // Inputs
	.rxp	    (rxp0),
	.rxn	    (rxn0),
	.cfgrx	    (cfgrx0[27:0]),
	.rxbclkin   (rxbclkin[0]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx1 	    (
		    // Outputs
	.rd	    (rd1[11:0]),
	.stsrx	    (stsrx1[7:0]),
	.rxbclklln  (rxbclklln[1]),
	.rxbclkllp  (rxbclkllp[1]),
	.rxbclk	    (rxbclk[1]),
		    
		    // Inputs
	.rxp	    (rxp1),
	.rxn	    (rxn1),
	.cfgrx	    (cfgrx1[27:0]),
	.rxbclkin   (rxbclkin[1]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx2 	    (
		    // Outputs
	.rd	    (rd2[11:0]),
	.stsrx	    (stsrx2[7:0]),
	.rxbclklln  (rxbclklln[2]),
	.rxbclkllp  (rxbclkllp[2]),
	.rxbclk	    (rxbclk[2]),
		    
		    // Inputs
	.rxp	    (rxp2),
	.rxn	    (rxn2),
	.cfgrx	    (cfgrx2[27:0]),
	.rxbclkin   (rxbclkin[2]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx3 	    (
		    // Outputs
	.rd	    (rd3[11:0]),
	.stsrx	    (stsrx3[7:0]),
	.rxbclklln  (rxbclklln[3]),
	.rxbclkllp  (rxbclkllp[3]),
	.rxbclk	    (rxbclk[3]),
		    
		    // Inputs
	.rxp	    (rxp3),
	.rxn	    (rxn3),
	.cfgrx	    (cfgrx3[27:0]),
	.rxbclkin   (rxbclkin[3]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx4 	    (
		    // Outputs
	.rd	    (rd4[11:0]),
	.stsrx	    (stsrx4[7:0]),
	.rxbclklln  (rxbclklln[4]),
	.rxbclkllp  (rxbclkllp[4]),
	.rxbclk	    (rxbclk[4]),
		    
		    // Inputs
	.rxp	    (rxp4),
	.rxn	    (rxn4),
	.cfgrx	    (cfgrx4[27:0]),
	.rxbclkin   (rxbclkin[4]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx5 	    (
		    // Outputs
	.rd	    (rd5[11:0]),
	.stsrx	    (stsrx5[7:0]),
	.rxbclklln  (rxbclklln[5]),
	.rxbclkllp  (rxbclkllp[5]),
	.rxbclk	    (rxbclk[5]),
		    
		    // Inputs
	.rxp	    (rxp5),
	.rxn	    (rxn5),
	.cfgrx	    (cfgrx5[27:0]),
	.rxbclkin   (rxbclkin[5]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);


// Transmit SERDES
   fsr_tx tx0 	   (
		   // Outputs
	.td	   (td0[11:0]),
	.ststx	   (ststx0[3:0]),
	.txbclk	   (txbclk[0]),
		   
		   // Inputs
	.txp	   (txp0),
	.txn	   (txn0),
	.cfgtx	   (cfgtx0[19:0]),
	.txbclkin  (txbclkin[0]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_tx tx1 	   (
		   // Outputs
	.td	   (td1[11:0]),
	.ststx	   (ststx1[3:0]),
	.txbclk	   (txbclk[1]),
		   
		   // Inputs
	.txp	   (txp1),
	.txn	   (txn1),
	.cfgtx	   (cfgtx1[19:0]),
	.txbclkin  (txbclkin[1]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

endmodule

// Created from the WIZ6C2B8N6DX schematic view,
// NETLIST TIME: Nov 22 14:38:43 2004


module wiz6c2b8n6d2t ( amux, fdo, rd0, rd1, rd2, rd3, rdll0, rdll1, rdll2, rdll3, rxbclk, rxbclklln, 
		      rxbclkllp, stciq, stspll, stsrx0, stsrx1, stsrx2, stsrx3, ststx0, ststx1, 
		      ststx2, ststx3, txbclk,
		      txn0, txn1, txn2, txn3, txp0, txp1, txp2, txp3, bsinitclk, cfgpll, cfgrx0, 
		      cfgrx1, cfgrx2, cfgrx3, cfgtx0, cfgtx1, cfgtx2, cfgtx3, fclk, fclrz, fdi, 
		      refclkn, refclkp, rxbclkin, rxn0, rxn1, rxn2,
		      rxn3, rxp0, rxp1, rxp2, rxp3, stcicfg, stciclk, stcid, td0, td1, td2, td3, 
		      testcfg, testclkr, testclkt, txbclkin, 
		      atpgmd, atpgmq, atpgrd, atpgrq, atpgtd, atpgtq,
		      vdd, vdda, vddd, vddr, vddt, vss, vssa );
wire scan_in;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire se;
wire scan_out;


output  amux, fdo, stciq, txn0, txn1, txn2, txn3, txp0, txp1, txp2, txp3;

input  bsinitclk, fclk, fclrz, fdi, refclkn, refclkp, rxn0, rxn1, rxn2, rxn3, rxp0, rxp1, rxp2, rxp3, stciclk, stcid, testclkr, testclkt, vdd, vdda, vddd, vddr, vddt, vss, vssa;

output [11:0]  rd0;
output [11:0]  rd1;
output [11:0]  rd2;
output [11:0]  rd3;
output [3:0]  ststx0;
output [3:0]  ststx1;
output [3:0]  ststx2;
output [3:0]  ststx3;
output [3:0]  stspll;
output [1:0]  rdll0;
output [1:0]  rdll1;
output [1:0]  rdll3;
output [7:0]  stsrx0;
output [7:0]  stsrx1;
output [7:0]  stsrx2;
output [7:0]  stsrx3;
output [3:0]  rxbclk;
output [3:0]  txbclk;
output [3:0]  rxbclklln;
output [1:0]  rdll2;
output [3:0]  rxbclkllp;

input [11:0]  cfgpll;
input [27:0]  cfgrx0;
input [27:0]  cfgrx1;
input [27:0]  cfgrx2;
input [27:0]  cfgrx3;
input [19:0]  cfgtx0;
input [19:0]  cfgtx1;
input [19:0]  cfgtx2;
input [19:0]  cfgtx3;
input [1:0]  stcicfg;
input [11:0]  td0;
input [11:0]  td1;
input [11:0]  td2;
input [11:0]  td3;
input [19:0]  testcfg;
input [3:0]  txbclkin;
input [3:0]  rxbclkin;

 input  atpgmd;
 input  [3:0] atpgrd;
 input  [3:0] atpgtd;
 output       atpgmq;
 output [3:0] atpgrq;
 output [3:0] atpgtq;
   
   wire       pll_lock;
   wire [7:0] pll_lock_cnt_in, pll_lock_cnt;

// Misc. outputs
assign rdll0 = 2'b00;
assign rdll1 = 2'b00;
assign rdll2 = 2'b11;
assign rdll3 = 2'b11;
assign amux  = 1'b0;
assign fdo   = 1'b0;
assign stciq = 1'b0;
assign stspll = {3'b000,pll_lock};
   
// Scan signals for sunv
assign scan_in = 1'b0;
assign siclk = `CPU.tcu_aclk & `CPU.tcu_mcu_testmode;
assign soclk = `CPU.tcu_bclk & `CPU.tcu_mcu_testmode;
assign pce_ov = `CPU.tcu_pce_ov;
assign stop = 1'b0;
assign se = `CPU.tcu_scan_en & `CPU.tcu_mcu_testmode;


   // ATPG
   assign atpgmq = atpgmd;
   assign atpgrq[3:0] = atpgrd[3:0];
   assign atpgtq[3:0] = atpgtd[3:0];

   assign pll_lock = pll_lock_cnt[7:0] == 8'hff;
   assign pll_lock_cnt_in[7:0] = pll_lock & cfgpll[0] ? 8'hff : cfgpll[0] ? pll_lock_cnt[7:0] + 8'h1 : 8'h0;
dff #(8) ff_pll_lock_cnt (
.l1clk(refclkp),
.siclk(siclk),
.soclk(soclk),
.d(pll_lock_cnt_in[7:0]),
.si(8'h0),
.so(),
.q(pll_lock_cnt[7:0])
);

// 4 Rx ports
   
   fsr_rx rx0 	    (
		    // Outputs
	.rd	    (rd0[11:0]),
	.stsrx	    (stsrx0[7:0]),
	.rxbclklln  (rxbclklln[0]),
	.rxbclkllp  (rxbclkllp[0]),
	.rxbclk	    (rxbclk[0]),
		    
		    // Inputs
	.rxp	    (rxp0),
	.rxn	    (rxn0),
	.cfgrx	    (cfgrx0[27:0]),
	.rxbclkin   (rxbclkin[0]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx1 	    (
		    // Outputs
	.rd	    (rd1[11:0]),
	.stsrx	    (stsrx1[7:0]),
	.rxbclklln  (rxbclklln[1]),
	.rxbclkllp  (rxbclkllp[1]),
	.rxbclk	    (rxbclk[1]),
		    
		    // Inputs
	.rxp	    (rxp1),
	.rxn	    (rxn1),
	.cfgrx	    (cfgrx1[27:0]),
	.rxbclkin   (rxbclkin[1]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx2 	    (
		    // Outputs
	.rd	    (rd2[11:0]),
	.stsrx	    (stsrx2[7:0]),
	.rxbclklln  (rxbclklln[2]),
	.rxbclkllp  (rxbclkllp[2]),
	.rxbclk	    (rxbclk[2]),
		    
		    // Inputs
	.rxp	    (rxp2),
	.rxn	    (rxn2),
	.cfgrx	    (cfgrx2[27:0]),
	.rxbclkin   (rxbclkin[2]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_rx rx3 	    (
		    // Outputs
	.rd	    (rd3[11:0]),
	.stsrx	    (stsrx3[7:0]),
	.rxbclklln  (rxbclklln[3]),
	.rxbclkllp  (rxbclkllp[3]),
	.rxbclk	    (rxbclk[3]),
		    
		    // Inputs
	.rxp	    (rxp3),
	.rxn	    (rxn3),
	.cfgrx	    (cfgrx3[27:0]),
	.rxbclkin   (rxbclkin[3]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
); 
   
   
// 4 Tx ports
   
   fsr_tx tx0 	   (
		   // Outputs
	.td	   (td0[11:0]),
	.ststx	   (ststx0[3:0]),
	.txbclk	   (txbclk[0]),
		   
		   // Inputs
	.txp	   (txp0),
	.txn	   (txn0),
	.cfgtx	   (cfgtx0[19:0]),
	.txbclkin  (txbclkin[0]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_tx tx1 	   (
		   // Outputs
	.td	   (td1[11:0]),
	.ststx	   (ststx1[3:0]),
	.txbclk	   (txbclk[1]),
		   
		   // Inputs
	.txp	   (txp1),
	.txn	   (txn1),
	.cfgtx	   (cfgtx1[19:0]),
	.txbclkin  (txbclkin[1]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_tx tx2 	    (
		    // Outputs
	.td 	    (td2[11:0]),
	.ststx 	    (ststx2[3:0]),
	.txbclk     (txbclk[2]),
		    
		    // Inputs
	.txp 	    (txp2),
	.txn 	    (txn2),
	.cfgtx 	    (cfgtx2[19:0]),
	.txbclkin   (txbclkin[2]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   fsr_tx tx3 	   (
		   // Outputs
	.td	   (td3[11:0]),
	.ststx	   (ststx3[3:0]),
	.txbclk	   (txbclk[3]),
		   
		   // Inputs
	.txp	   (txp3),
	.txn	   (txn3),
	.cfgtx	   (cfgtx3[19:0]),
	.txbclkin  (txbclkin[3]),
	.pll_ck     (refclkp ),
  .scan_in(scan_in),
  .scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .stop(stop),
  .pce_ov(pce_ov)
);

   
endmodule

module fsr_rx (
  rd, 
  stsrx, 
  rxbclklln, 
  rxbclkllp, 
  rxbclk, 
  rxp, 
  rxn, 
  cfgrx, 
  rxbclkin, 
  pll_ck, 
  scan_in, 
  scan_out, 
  se, 
  siclk, 
  soclk, 
  stop, 
  pce_ov);
wire elect_idle;
wire sync;
wire pll_ck_l;
wire l1clk;
wire l1clk_l;
wire ff_sn0_scanin;
wire ff_sn0_scanout;
wire sn0;
wire ff_sn1_scanin;
wire ff_sn1_scanout;
wire sn1;
wire match_in;
wire match_even;
wire match_odd;
wire match;
wire ff_match_scanin;
wire ff_match_scanout;
wire match_ptr_en;
wire ff_match_ptr_scanin;
wire ff_match_ptr_scanout;
wire [2:0] cnt;
wire [2:0] match_ptr;
wire [11:0] rd_in;
wire [12:0] nb_data;
wire rd_en;
wire ff_rd_scanin;
wire ff_rd_scanout;
wire [12:0] nb_data_in;
wire ff_nb_data_scanin;
wire ff_nb_data_scanout;
wire [2:0] cnt_in;
wire ff_cnt_scanin;
wire ff_cnt_scanout;
wire rxbclk_in;
wire [2:0] match_ptr_plus_4;
wire [2:0] match_ptr_plus_1;
wire ff_rxbclk_scanin;
wire ff_rxbclk_scanout;
wire sync_en;
wire ff_sync_scanin;
wire ff_sync_scanout;
wire [11:0] rd_rev;
   
output	[11:0]	rd;
output	[7:0]	stsrx;
output		rxbclklln;
output		rxbclkllp;
output		rxbclk;

input		rxp;
input		rxn;
input	[27:0]	cfgrx; 
input		rxbclkin;
input		pll_ck;

input 		scan_in;
output	      	scan_out;
input 		se;
input 		siclk;
input 		soclk;
input 		stop;
input 		pce_ov;
   
assign stsrx[7:0] = {4'h0, elect_idle, 1'b0, sync & cfgrx[0], 1'b0};
assign elect_idle = ~rxp & ~rxn & cfgrx[0];
assign pll_ck_l = ~pll_ck;
assign rxbclklln = 1'b1;
assign rxbclkllp = 1'b0;

l1clkhdr_ctl_macro clkgen0 (
        .l2clk(pll_ck),
        .l1en (1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

l1clkhdr_ctl_macro clkgen1 (
        .l2clk(pll_ck_l),
        .l1en (1'b1 ),
        .l1clk(l1clk_l),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

//assign l1clk_l = ~l1clk;

msff_ctl_macro ff_sn0 (
	.scan_in(ff_sn0_scanin),
	.scan_out(ff_sn0_scanout),
	.din(rxp),
	.dout(sn0),
	.l1clk(l1clk_l),
  .siclk(siclk),
  .soclk(soclk));

msff_ctl_macro ff_sn1 (
	.scan_in(ff_sn1_scanin),
	.scan_out(ff_sn1_scanout),
	.din(rxp),
	.dout(sn1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign match_in = (match_even | match_odd) & (cfgrx[13:12] == 2'h1) ? match_odd & ~match_even : match;
msff_ctl_macro ff_match (
	.scan_in(ff_match_scanin),
	.scan_out(ff_match_scanout),
	.din(match_in),
	.dout(match),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign match_ptr_en = (match_even | match_odd) & (cfgrx[13:12] == 2'h1);
msff_ctl_macro__en_1__width_3 ff_match_ptr  (
	.scan_in(ff_match_ptr_scanin),
	.scan_out(ff_match_ptr_scanout),
	.din(cnt[2:0]),
	.dout(match_ptr[2:0]),
	.en(match_ptr_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rd_in[11:0] = {12{cfgrx[0]}} & (match ? nb_data[11:0] : nb_data[12:1]);
assign rd_en = cnt[2:0] == match_ptr[2:0];
msff_ctl_macro__en_1__width_12 ff_rd  (
	.scan_in(ff_rd_scanin),
	.scan_out(ff_rd_scanout),
	.din(rd_in[11:0]),
	.dout(rd_rev[11:0]),
	.en(rd_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rd[11:0] = {rd_rev[0],rd_rev[1],rd_rev[2],rd_rev[3],rd_rev[4],rd_rev[5],
		      rd_rev[6],rd_rev[7],rd_rev[8],rd_rev[9],rd_rev[10],rd_rev[11]};

assign nb_data_in[12:0] = {sn0,sn1,nb_data[12:2]};
msff_ctl_macro__width_13 ff_nb_data  (
	.scan_in(ff_nb_data_scanin),
	.scan_out(ff_nb_data_scanout),
	.din(nb_data_in[12:0]),
	.dout(nb_data[12:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign match_odd = nb_data[11:0] == 12'hbfe;
assign match_even = nb_data[12:1] == 12'hbfe;

assign cnt_in[2:0] = cnt[2:0] == 3'h5 ? 3'h0 : cnt[2:0] + 3'h1;
msff_ctl_macro__width_3 ff_cnt  (
	.scan_in(ff_cnt_scanin),
	.scan_out(ff_cnt_scanout),
	.din(cnt_in[2:0]),
	.dout(cnt[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rxbclk_in = cfgrx[0] & ((cnt[2:0] == match_ptr_plus_4[2:0]) ? 1'b0 : (cnt[2:0] == match_ptr_plus_1[2:0]) ? 1'b1 : rxbclk);
msff_ctl_macro ff_rxbclk (
	.scan_in(ff_rxbclk_scanin),
	.scan_out(ff_rxbclk_scanout),
	.din(rxbclk_in),
	.dout(rxbclk),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign match_ptr_plus_4[2:0] = match_ptr[2:0] == 3'h0 ? 3'h4 :
				match_ptr[2:0] == 3'h1 ? 3'h5 :
				match_ptr[2:0] == 3'h2 ? 3'h0 :
				match_ptr[2:0] == 3'h3 ? 3'h1 :
				match_ptr[2:0] == 3'h4 ? 3'h2 :
				match_ptr[2:0] == 3'h5 ? 3'h3 : 3'h0;
				

assign match_ptr_plus_1[2:0] = match_ptr[2:0] == 3'h0 ? 3'h1 :
				match_ptr[2:0] == 3'h1 ? 3'h2 :
				match_ptr[2:0] == 3'h2 ? 3'h3 :
				match_ptr[2:0] == 3'h3 ? 3'h4 :
				match_ptr[2:0] == 3'h4 ? 3'h5 :
				match_ptr[2:0] == 3'h5 ? 3'h0 : 3'h0;
				

assign sync_en = (match_ptr[2:0] == cnt[2:0]) & (cfgrx[13:12] == 2'h1);
msff_ctl_macro__en_1 ff_sync  (
	.scan_in(ff_sync_scanin),
	.scan_out(ff_sync_scanout),
	.din(match_ptr_en),
	.dout(sync),
	.en(sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fixscan start:
assign ff_sn0_scanin             = scan_in                  ;
assign ff_sn1_scanin             = ff_sn0_scanout           ;
assign ff_match_scanin           = ff_sn1_scanout           ;
assign ff_match_ptr_scanin       = ff_match_scanout         ;
assign ff_rd_scanin              = ff_match_ptr_scanout     ;
assign ff_nb_data_scanin         = ff_rd_scanout            ;
assign ff_cnt_scanin             = ff_nb_data_scanout       ;
assign ff_rxbclk_scanin          = ff_cnt_scanout           ;
assign ff_sync_scanin            = ff_rxbclk_scanout        ;
assign scan_out                  = ff_sync_scanout          ;
// fixscan end:
endmodule

module fsr_tx (
  txp, 
  txn, 
  ststx, 
  txbclk, 
  td, 
  cfgtx, 
  txbclkin, 
  pll_ck, 
  scan_in, 
  scan_out, 
  se, 
  siclk, 
  soclk, 
  stop, 
  pce_ov);
wire l1clk;
wire ff_td_reg_scanin;
wire ff_td_reg_scanout;
wire [11:0] td_reg;
wire td_sync_en;
wire [2:0] cnt;
wire ff_td_sync_in_scanin;
wire ff_td_sync_in_scanout;
wire [11:0] td_sync_in;
wire ff_td_sync_scanin;
wire ff_td_sync_scanout;
wire [11:0] td_sync;
wire [2:0] cnt_in;
wire ff_cnt_scanin;
wire ff_cnt_scanout;
wire txp_out;
wire [11:0] td_rev;


output 		txp;
output 		txn;
output	[3:0]	ststx;
output 		txbclk;
   
input 	[11:0] 	td;
input 	[19:0] 	cfgtx;
input 		txbclkin;
input 		pll_ck;

input 		scan_in;
output	      	scan_out;
input 		se;
input 		siclk;
input 		soclk;
input 		stop;
input 		pce_ov;
   
assign ststx[3:0] = 4'h0;
assign txbclk = 1'b0;

l1clkhdr_ctl_macro clkgen (
        .l2clk(pll_ck),
        .l1en (1'b1 ),
        .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

assign td_rev[11:0] = {td[0],td[1],td[2],td[3],td[4],td[5],td[6],td[7],td[8],td[9],td[10],td[11]};
msff_ctl_macro__width_12 ff_td_reg  (
	.scan_in(ff_td_reg_scanin),
	.scan_out(ff_td_reg_scanout),
	.din(td_rev[11:0]),
	.dout(td_reg[11:0]),
	.l1clk(txbclkin),
  .siclk(siclk),
  .soclk(soclk));

assign td_sync_en = cnt[2:0] == 3'h4;
msff_ctl_macro__en_1__width_12 ff_td_sync_in  (
	.scan_in(ff_td_sync_in_scanin),
	.scan_out(ff_td_sync_in_scanout),
	.din(td_reg[11:0]),
	.dout(td_sync_in[11:0]),
	.en(td_sync_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

msff_ctl_macro__width_12 ff_td_sync  (
	.scan_in(ff_td_sync_scanin),
	.scan_out(ff_td_sync_scanout),
	.din(td_sync_in[11:0]),
	.dout(td_sync[11:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign cnt_in[2:0] = cnt[2:0] == 3'h5 ? 3'h0 : cnt[2:0] + 3'h1;
msff_ctl_macro__width_3 ff_cnt  (
	.scan_in(ff_cnt_scanin),
	.scan_out(ff_cnt_scanout),
	.din(cnt_in[2:0]),
	.dout(cnt[2:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

   assign txp_out = cnt[2:0] == 3'h0 ? td_sync[0]  & pll_ck | td_sync[1]  & ~pll_ck :
		cnt[2:0] == 3'h1 ? td_sync[2]  & pll_ck | td_sync[3]  & ~pll_ck :
		cnt[2:0] == 3'h2 ? td_sync[4]  & pll_ck | td_sync[5]  & ~pll_ck :
		cnt[2:0] == 3'h3 ? td_sync[6]  & pll_ck | td_sync[7]  & ~pll_ck :
		cnt[2:0] == 3'h4 ? td_sync[8]  & pll_ck | td_sync[9]  & ~pll_ck :
		cnt[2:0] == 3'h5 ? td_sync[10] & pll_ck | td_sync[11] & ~pll_ck : 1'b0;
   assign txp = ~cfgtx[18] & cfgtx[0] & txp_out;
   assign txn = ~cfgtx[18] & cfgtx[0] & ~txp_out;

// fixscan start:
assign ff_td_reg_scanin          = scan_in                  ;
assign ff_td_sync_in_scanin      = ff_td_reg_scanout        ;
assign ff_td_sync_scanin         = ff_td_sync_in_scanout    ;
assign ff_cnt_scanin             = ff_td_sync_scanout       ;
assign scan_out                  = ff_cnt_scanout           ;
// fixscan end:
endmodule


module l1clkhdr_ctl_macro (
  l2clk, 
  l1en, 
  pce_ov, 
  stop, 
  se, 
  l1clk);


  input l2clk;
  input l1en;
  input pce_ov;
  input stop;
  input se;
  output l1clk;



 

cl_sc1_l1hdr_8x c_0 (


   .l2clk(l2clk),
   .pce(l1en),
   .l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop)
);



endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = din[0:0];






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_3 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = (din[2:0] & {3{en}}) | (dout[2:0] & ~{3{en}});






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule

























// any PARAMS parms go into naming of macro

module msff_ctl_macro__width_13 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [12:0] fdin;
wire [11:0] so;

  input [12:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [12:0] dout;
  output scan_out;
assign fdin[12:0] = din[12:0];






dff #(13)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[12:0]),
.si({scan_in,so[11:0]}),
.so({so[11:0],scan_out}),
.q(dout[12:0])
);












endmodule
























// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






dff #(1)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[0:0]),
.si(scan_in),
.so(scan_out),
.q(dout[0:0])
);












endmodule










// any PARAMS parms go into naming of macro

module msff_ctl_macro__width_12 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = din[11:0];






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__en_1__width_12 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [11:0] fdin;
wire [10:0] so;

  input [11:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [11:0] dout;
  output scan_out;
assign fdin[11:0] = (din[11:0] & {12{en}}) | (dout[11:0] & ~{12{en}});






dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);












endmodule













// any PARAMS parms go into naming of macro

module msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule








