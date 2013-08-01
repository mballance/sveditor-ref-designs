// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_bscan_ctl.v
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
module mcu_bscan_ctl (
  mcu_fsr0_cfgtx_bstx, 
  mcu_fsr1_cfgtx_bstx, 
  fsr0_mcu_stsrx_bsrxp, 
  fsr1_mcu_stsrx_bsrxp, 
  fsr0_mcu_stsrx_bsrxn, 
  fsr1_mcu_stsrx_bsrxn, 
  mcu_sbs_scan_in, 
  mcu_sbs_scan_out, 
  tcu_sbs_scan_en, 
  tcu_sbs_clk, 
  tcu_sbs_uclk, 
  tcu_sbs_aclk, 
  tcu_sbs_bclk);
wire se;
wire siclk;
wire soclk;
wire updateclk;
wire mode;
wire muxd;
wire highz_n;
wire l1clk;
wire bstx00_so;
wire bstx01_so;
wire bstx02_so;
wire bstx03_so;
wire bstx04_so;
wire bstx05_so;
wire bstx06_so;
wire bstx07_so;
wire bstx08_so;
wire bstx09_so;
wire bstx10_so;
wire bstx11_so;
wire bstx12_so;
wire bstx13_so;
wire bstx14_so;
wire bstx15_so;
wire bstx16_so;
wire bstx17_so;
wire bstx18_so;
wire bstx19_so;
wire bsrxp00_so;
wire [55:0] q_unused;
wire bsrxp01_so;
wire bsrxp02_so;
wire bsrxp03_so;
wire bsrxp04_so;
wire bsrxp05_so;
wire bsrxp06_so;
wire bsrxp07_so;
wire bsrxp08_so;
wire bsrxp09_so;
wire bsrxp10_so;
wire bsrxp11_so;
wire bsrxp12_so;
wire bsrxp13_so;
wire bsrxn00_so;
wire bsrxn01_so;
wire bsrxn02_so;
wire bsrxn03_so;
wire bsrxn04_so;
wire bsrxn05_so;
wire bsrxn06_so;
wire bsrxn07_so;
wire bsrxn08_so;
wire bsrxn09_so;
wire bsrxn10_so;
wire bsrxn11_so;
wire bsrxn12_so;
wire bsrxn13_so;
wire bsrxp14_so;
wire bsrxp15_so;
wire bsrxp16_so;
wire bsrxp17_so;
wire bsrxp18_so;
wire bsrxp19_so;
wire bsrxp20_so;
wire bsrxp21_so;
wire bsrxp22_so;
wire bsrxp23_so;
wire bsrxp24_so;
wire bsrxp25_so;
wire bsrxp26_so;
wire bsrxp27_so;
wire bsrxn14_so;
wire bsrxn15_so;
wire bsrxn16_so;
wire bsrxn17_so;
wire bsrxn18_so;
wire bsrxn19_so;
wire bsrxn20_so;
wire bsrxn21_so;
wire bsrxn22_so;
wire bsrxn23_so;
wire bsrxn24_so;
wire bsrxn25_so;
wire bsrxn26_so;


output	[9:0]	mcu_fsr0_cfgtx_bstx;
output	[9:0]	mcu_fsr1_cfgtx_bstx;

input	[13:0]	fsr0_mcu_stsrx_bsrxp;
input	[13:0]	fsr1_mcu_stsrx_bsrxp;
input	[13:0]	fsr0_mcu_stsrx_bsrxn;
input	[13:0]	fsr1_mcu_stsrx_bsrxn;

input		mcu_sbs_scan_in;
output		mcu_sbs_scan_out;
input		tcu_sbs_scan_en;
input		tcu_sbs_clk;
input		tcu_sbs_uclk;
input		tcu_sbs_aclk;
input		tcu_sbs_bclk;

assign se = tcu_sbs_scan_en;
assign siclk = tcu_sbs_aclk;
assign soclk = tcu_sbs_bclk;
assign updateclk = tcu_sbs_uclk;

assign mode = 1'b0;
assign muxd = 1'b0;
assign highz_n = 1'b1;

mcu_bscan_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(tcu_sbs_clk),
 	.l1en(1'b1),
	.pce_ov(1'b1),
	.stop(1'b0),
 	.l1clk(l1clk),
  .se(se));

// TX 0 
cl_sc1_bs_cell2_4x bstx00 (
	.q(mcu_fsr0_cfgtx_bstx[0]),
	.so(bstx00_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(mcu_sbs_scan_in),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx01 (
	.q(mcu_fsr0_cfgtx_bstx[1]),
	.so(bstx01_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx00_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx02 (
	.q(mcu_fsr0_cfgtx_bstx[2]),
	.so(bstx02_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx01_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx03 (
	.q(mcu_fsr0_cfgtx_bstx[3]),
	.so(bstx03_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx02_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx04 (
	.q(mcu_fsr0_cfgtx_bstx[4]),
	.so(bstx04_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx03_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx05 (
	.q(mcu_fsr0_cfgtx_bstx[5]),
	.so(bstx05_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx04_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx06 (
	.q(mcu_fsr0_cfgtx_bstx[6]),
	.so(bstx06_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx05_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx07 (
	.q(mcu_fsr0_cfgtx_bstx[7]),
	.so(bstx07_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx06_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx08 (
	.q(mcu_fsr0_cfgtx_bstx[8]),
	.so(bstx08_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx07_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx09 (
	.q(mcu_fsr0_cfgtx_bstx[9]),
	.so(bstx09_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx08_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

// TX 1
cl_sc1_bs_cell2_4x bstx10 (
	.q(mcu_fsr1_cfgtx_bstx[0]),
	.so(bstx10_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx09_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx11 (
	.q(mcu_fsr1_cfgtx_bstx[1]),
	.so(bstx11_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx10_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx12 (
	.q(mcu_fsr1_cfgtx_bstx[2]),
	.so(bstx12_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx11_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx13 (
	.q(mcu_fsr1_cfgtx_bstx[3]),
	.so(bstx13_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx12_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx14 (
	.q(mcu_fsr1_cfgtx_bstx[4]),
	.so(bstx14_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx13_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx15 (
	.q(mcu_fsr1_cfgtx_bstx[5]),
	.so(bstx15_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx14_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx16 (
	.q(mcu_fsr1_cfgtx_bstx[6]),
	.so(bstx16_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx15_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx17 (
	.q(mcu_fsr1_cfgtx_bstx[7]),
	.so(bstx17_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx16_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx18 (
	.q(mcu_fsr1_cfgtx_bstx[8]),
	.so(bstx18_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx17_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bstx19 (
	.q(mcu_fsr1_cfgtx_bstx[9]),
	.so(bstx19_so),
	.d(1'b0),
	.l1clk(1'b1),
	.si(bstx18_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

// RXP 0
cl_sc1_bs_cell2_4x bsrxp00 (
	.d(fsr0_mcu_stsrx_bsrxp[0]),
	.so(bsrxp00_so),
	.q(q_unused[0]),
	.l1clk(l1clk),
	.si(bstx19_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp01 (
	.d(fsr0_mcu_stsrx_bsrxp[1]),
	.so(bsrxp01_so),
	.q(q_unused[1]),
	.l1clk(l1clk),
	.si(bsrxp00_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp02 (
	.d(fsr0_mcu_stsrx_bsrxp[2]),
	.so(bsrxp02_so),
	.q(q_unused[2]),
	.l1clk(l1clk),
	.si(bsrxp01_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp03 (
	.d(fsr0_mcu_stsrx_bsrxp[3]),
	.so(bsrxp03_so),
	.q(q_unused[3]),
	.l1clk(l1clk),
	.si(bsrxp02_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp04 (
	.d(fsr0_mcu_stsrx_bsrxp[4]),
	.so(bsrxp04_so),
	.q(q_unused[4]),
	.l1clk(l1clk),
	.si(bsrxp03_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp05 (
	.d(fsr0_mcu_stsrx_bsrxp[5]),
	.so(bsrxp05_so),
	.q(q_unused[5]),
	.l1clk(l1clk),
	.si(bsrxp04_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp06 (
	.d(fsr0_mcu_stsrx_bsrxp[6]),
	.so(bsrxp06_so),
	.q(q_unused[6]),
	.l1clk(l1clk),
	.si(bsrxp05_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp07 (
	.d(fsr0_mcu_stsrx_bsrxp[7]),
	.so(bsrxp07_so),
	.q(q_unused[7]),
	.l1clk(l1clk),
	.si(bsrxp06_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp08 (
	.d(fsr0_mcu_stsrx_bsrxp[8]),
	.so(bsrxp08_so),
	.q(q_unused[8]),
	.l1clk(l1clk),
	.si(bsrxp07_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp09 (
	.d(fsr0_mcu_stsrx_bsrxp[9]),
	.so(bsrxp09_so),
	.q(q_unused[9]),
	.l1clk(l1clk),
	.si(bsrxp08_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp10 (
	.d(fsr0_mcu_stsrx_bsrxp[10]),
	.so(bsrxp10_so),
	.q(q_unused[10]),
	.l1clk(l1clk),
	.si(bsrxp09_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp11 (
	.d(fsr0_mcu_stsrx_bsrxp[11]),
	.so(bsrxp11_so),
	.q(q_unused[11]),
	.l1clk(l1clk),
	.si(bsrxp10_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp12 (
	.d(fsr0_mcu_stsrx_bsrxp[12]),
	.so(bsrxp12_so),
	.q(q_unused[12]),
	.l1clk(l1clk),
	.si(bsrxp11_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp13 (
	.d(fsr0_mcu_stsrx_bsrxp[13]),
	.so(bsrxp13_so),
	.q(q_unused[13]),
	.l1clk(l1clk),
	.si(bsrxp12_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

// RXN 0
cl_sc1_bs_cell2_4x bsrxn00 (
	.d(fsr0_mcu_stsrx_bsrxn[0]),
	.so(bsrxn00_so),
	.q(q_unused[14]),
	.l1clk(l1clk),
	.si(bsrxp13_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn01 (
	.d(fsr0_mcu_stsrx_bsrxn[1]),
	.so(bsrxn01_so),
	.q(q_unused[15]),
	.l1clk(l1clk),
	.si(bsrxn00_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn02 (
	.d(fsr0_mcu_stsrx_bsrxn[2]),
	.so(bsrxn02_so),
	.q(q_unused[16]),
	.l1clk(l1clk),
	.si(bsrxn01_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn03 (
	.d(fsr0_mcu_stsrx_bsrxn[3]),
	.so(bsrxn03_so),
	.q(q_unused[17]),
	.l1clk(l1clk),
	.si(bsrxn02_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn04 (
	.d(fsr0_mcu_stsrx_bsrxn[4]),
	.so(bsrxn04_so),
	.q(q_unused[18]),
	.l1clk(l1clk),
	.si(bsrxn03_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn05 (
	.d(fsr0_mcu_stsrx_bsrxn[5]),
	.so(bsrxn05_so),
	.q(q_unused[19]),
	.l1clk(l1clk),
	.si(bsrxn04_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn06 (
	.d(fsr0_mcu_stsrx_bsrxn[6]),
	.so(bsrxn06_so),
	.q(q_unused[20]),
	.l1clk(l1clk),
	.si(bsrxn05_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn07 (
	.d(fsr0_mcu_stsrx_bsrxn[7]),
	.so(bsrxn07_so),
	.q(q_unused[21]),
	.l1clk(l1clk),
	.si(bsrxn06_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn08 (
	.d(fsr0_mcu_stsrx_bsrxn[8]),
	.so(bsrxn08_so),
	.q(q_unused[22]),
	.l1clk(l1clk),
	.si(bsrxn07_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn09 (
	.d(fsr0_mcu_stsrx_bsrxn[9]),
	.so(bsrxn09_so),
	.q(q_unused[23]),
	.l1clk(l1clk),
	.si(bsrxn08_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn10 (
	.d(fsr0_mcu_stsrx_bsrxn[10]),
	.so(bsrxn10_so),
	.q(q_unused[24]),
	.l1clk(l1clk),
	.si(bsrxn09_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn11 (
	.d(fsr0_mcu_stsrx_bsrxn[11]),
	.so(bsrxn11_so),
	.q(q_unused[25]),
	.l1clk(l1clk),
	.si(bsrxn10_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn12 (
	.d(fsr0_mcu_stsrx_bsrxn[12]),
	.so(bsrxn12_so),
	.q(q_unused[26]),
	.l1clk(l1clk),
	.si(bsrxn11_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn13 (
	.d(fsr0_mcu_stsrx_bsrxn[13]),
	.so(bsrxn13_so),
	.q(q_unused[27]),
	.l1clk(l1clk),
	.si(bsrxn12_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

// RXP 1
cl_sc1_bs_cell2_4x bsrxp14 (
	.d(fsr1_mcu_stsrx_bsrxp[0]),
	.so(bsrxp14_so),
	.q(q_unused[28]),
	.l1clk(l1clk),
	.si(bsrxn13_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp15 (
	.d(fsr1_mcu_stsrx_bsrxp[1]),
	.so(bsrxp15_so),
	.q(q_unused[29]),
	.l1clk(l1clk),
	.si(bsrxp14_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp16 (
	.d(fsr1_mcu_stsrx_bsrxp[2]),
	.so(bsrxp16_so),
	.q(q_unused[30]),
	.l1clk(l1clk),
	.si(bsrxp15_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp17 (
	.d(fsr1_mcu_stsrx_bsrxp[3]),
	.so(bsrxp17_so),
	.q(q_unused[31]),
	.l1clk(l1clk),
	.si(bsrxp16_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp18 (
	.d(fsr1_mcu_stsrx_bsrxp[4]),
	.so(bsrxp18_so),
	.q(q_unused[32]),
	.l1clk(l1clk),
	.si(bsrxp17_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp19 (
	.d(fsr1_mcu_stsrx_bsrxp[5]),
	.so(bsrxp19_so),
	.q(q_unused[33]),
	.l1clk(l1clk),
	.si(bsrxp18_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp20 (
	.d(fsr1_mcu_stsrx_bsrxp[6]),
	.so(bsrxp20_so),
	.q(q_unused[34]),
	.l1clk(l1clk),
	.si(bsrxp19_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp21 (
	.d(fsr1_mcu_stsrx_bsrxp[7]),
	.so(bsrxp21_so),
	.q(q_unused[35]),
	.l1clk(l1clk),
	.si(bsrxp20_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp22 (
	.d(fsr1_mcu_stsrx_bsrxp[8]),
	.so(bsrxp22_so),
	.q(q_unused[36]),
	.l1clk(l1clk),
	.si(bsrxp21_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp23 (
	.d(fsr1_mcu_stsrx_bsrxp[9]),
	.so(bsrxp23_so),
	.q(q_unused[37]),
	.l1clk(l1clk),
	.si(bsrxp22_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp24 (
	.d(fsr1_mcu_stsrx_bsrxp[10]),
	.so(bsrxp24_so),
	.q(q_unused[38]),
	.l1clk(l1clk),
	.si(bsrxp23_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp25 (
	.d(fsr1_mcu_stsrx_bsrxp[11]),
	.so(bsrxp25_so),
	.q(q_unused[39]),
	.l1clk(l1clk),
	.si(bsrxp24_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp26 (
	.d(fsr1_mcu_stsrx_bsrxp[12]),
	.so(bsrxp26_so),
	.q(q_unused[40]),
	.l1clk(l1clk),
	.si(bsrxp25_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxp27 (
	.d(fsr1_mcu_stsrx_bsrxp[13]),
	.so(bsrxp27_so),
	.q(q_unused[41]),
	.l1clk(l1clk),
	.si(bsrxp26_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

// RXN 1
cl_sc1_bs_cell2_4x bsrxn14 (
	.d(fsr1_mcu_stsrx_bsrxn[0]),
	.so(bsrxn14_so),
	.q(q_unused[42]),
	.l1clk(l1clk),
	.si(bsrxp27_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn15 (
	.d(fsr1_mcu_stsrx_bsrxn[1]),
	.so(bsrxn15_so),
	.q(q_unused[43]),
	.l1clk(l1clk),
	.si(bsrxn14_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn16 (
	.d(fsr1_mcu_stsrx_bsrxn[2]),
	.so(bsrxn16_so),
	.q(q_unused[44]),
	.l1clk(l1clk),
	.si(bsrxn15_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn17 (
	.d(fsr1_mcu_stsrx_bsrxn[3]),
	.so(bsrxn17_so),
	.q(q_unused[45]),
	.l1clk(l1clk),
	.si(bsrxn16_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn18 (
	.d(fsr1_mcu_stsrx_bsrxn[4]),
	.so(bsrxn18_so),
	.q(q_unused[46]),
	.l1clk(l1clk),
	.si(bsrxn17_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn19 (
	.d(fsr1_mcu_stsrx_bsrxn[5]),
	.so(bsrxn19_so),
	.q(q_unused[47]),
	.l1clk(l1clk),
	.si(bsrxn18_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn20 (
	.d(fsr1_mcu_stsrx_bsrxn[6]),
	.so(bsrxn20_so),
	.q(q_unused[48]),
	.l1clk(l1clk),
	.si(bsrxn19_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn21 (
	.d(fsr1_mcu_stsrx_bsrxn[7]),
	.so(bsrxn21_so),
	.q(q_unused[49]),
	.l1clk(l1clk),
	.si(bsrxn20_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn22 (
	.d(fsr1_mcu_stsrx_bsrxn[8]),
	.so(bsrxn22_so),
	.q(q_unused[50]),
	.l1clk(l1clk),
	.si(bsrxn21_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn23 (
	.d(fsr1_mcu_stsrx_bsrxn[9]),
	.so(bsrxn23_so),
	.q(q_unused[51]),
	.l1clk(l1clk),
	.si(bsrxn22_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn24 (
	.d(fsr1_mcu_stsrx_bsrxn[10]),
	.so(bsrxn24_so),
	.q(q_unused[52]),
	.l1clk(l1clk),
	.si(bsrxn23_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn25 (
	.d(fsr1_mcu_stsrx_bsrxn[11]),
	.so(bsrxn25_so),
	.q(q_unused[53]),
	.l1clk(l1clk),
	.si(bsrxn24_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn26 (
	.d(fsr1_mcu_stsrx_bsrxn[12]),
	.so(bsrxn26_so),
	.q(q_unused[54]),
	.l1clk(l1clk),
	.si(bsrxn25_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

cl_sc1_bs_cell2_4x bsrxn27 (
	.d(fsr1_mcu_stsrx_bsrxn[13]),
	.so(mcu_sbs_scan_out),
	.q(q_unused[55]),
	.l1clk(l1clk),
	.si(bsrxn26_so),
  .siclk(siclk),
  .soclk(soclk),
  .updateclk(updateclk),
  .mode(mode),
  .muxd(muxd),
  .highz_n(highz_n));

endmodule






// any PARAMS parms go into naming of macro

module mcu_bscan_ctl_l1clkhdr_ctl_macro (
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








