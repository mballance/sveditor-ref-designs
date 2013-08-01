// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fbd_dp.v
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
module mcu_fbd_dp (
  fbd_data, 
  fbd_elect_idle, 
  fbd_frame_lock, 
  fbd_testfail, 
  fsr_data, 
  fsr_stsrx_losdtct, 
  fsr_stsrx_sync, 
  fsr_stsrx_testfail, 
  fsr_rxbclk, 
  fdout_frame_lock, 
  fbdic_enable_sync_count, 
  fdout_rptr0, 
  fdout_rptr1, 
  fdout_rptr2, 
  fdout_rptr3, 
  fdout_rptr4, 
  fdout_rptr5, 
  fdout_rptr6, 
  fdout_rptr7, 
  fdout_rptr8, 
  fdout_rptr9, 
  fdout_rptr10, 
  fdout_rptr11, 
  fdout_rptr12, 
  fdout_rptr13, 
  drl2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  scan_in, 
  scan_out, 
  tcu_mcu_fbd_clk_stop, 
  tcu_mcu_testmode, 
  tcu_atpg_mode);
wire rdbuf0_scanin;
wire rdbuf0_scanout;
wire rdbuf1_scanin;
wire rdbuf1_scanout;
wire rdbuf2_scanin;
wire rdbuf2_scanout;
wire rdbuf3_scanin;
wire rdbuf3_scanout;
wire rdbuf4_scanin;
wire rdbuf4_scanout;
wire rdbuf5_scanin;
wire rdbuf5_scanout;
wire rdbuf6_scanin;
wire rdbuf6_scanout;
wire rdbuf7_scanin;
wire rdbuf7_scanout;
wire rdbuf8_scanin;
wire rdbuf8_scanout;
wire rdbuf9_scanin;
wire rdbuf9_scanout;
wire rdbuf10_scanin;
wire rdbuf10_scanout;
wire rdbuf11_scanin;
wire rdbuf11_scanout;
wire rdbuf12_scanin;
wire rdbuf12_scanout;
wire rdbuf13_scanin;
wire rdbuf13_scanout;


output [167:0]	fbd_data;
output [13:0]	fbd_elect_idle;
output [13:0]	fbd_frame_lock;
output [13:0]	fbd_testfail;

input [167:0]	fsr_data;
input [13:0]	fsr_stsrx_losdtct;
input [13:0]	fsr_stsrx_sync;
input [13:0]	fsr_stsrx_testfail;
input [13:0]	fsr_rxbclk;
input [13:0]	fdout_frame_lock;

input		fbdic_enable_sync_count;

input	[1:0]	fdout_rptr0;
input	[1:0]	fdout_rptr1;
input	[1:0]	fdout_rptr2;
input	[1:0]	fdout_rptr3;
input	[1:0]	fdout_rptr4;
input	[1:0]	fdout_rptr5;
input	[1:0]	fdout_rptr6;
input	[1:0]	fdout_rptr7;
input	[1:0]	fdout_rptr8;
input	[1:0]	fdout_rptr9;
input	[1:0]	fdout_rptr10;
input	[1:0]	fdout_rptr11;
input	[1:0]	fdout_rptr12;
input	[1:0]	fdout_rptr13;

input		drl2clk;
input		tcu_pce_ov;
input           tcu_aclk;
input           tcu_bclk;
input		tcu_scan_en;
input 		scan_in;
output		scan_out;

input		tcu_mcu_fbd_clk_stop;
input		tcu_mcu_testmode;
input		tcu_atpg_mode;

// Northbound SERDES

mcu_frdbuf_dp frdbuf0 (
	.scan_in(rdbuf0_scanin),
	.scan_out(rdbuf0_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[0]),
	.fsr_data(fsr_data[11:0]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[0]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[0]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[0]),
	.frdbuf_testfail_sync(fbd_testfail[0]),
 	.frdbuf_data(fbd_data[11:0]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[0]),
	.frdbuf_frame_lock(fbd_frame_lock[0]),
	.fdout_frame_lock(fdout_frame_lock[0]),
	.fdout_rptr(fdout_rptr0[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf1 (
	.scan_in(rdbuf1_scanin),
	.scan_out(rdbuf1_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[1]),
	.fsr_data(fsr_data[23:12]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[1]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[1]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[1]),
	.frdbuf_testfail_sync(fbd_testfail[1]),
 	.frdbuf_data(fbd_data[23:12]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[1]),
	.frdbuf_frame_lock(fbd_frame_lock[1]),
	.fdout_frame_lock(fdout_frame_lock[1]),
	.fdout_rptr(fdout_rptr1[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf2 (
	.scan_in(rdbuf2_scanin),
	.scan_out(rdbuf2_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[2]),
	.fsr_data(fsr_data[35:24]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[2]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[2]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[2]),
	.frdbuf_testfail_sync(fbd_testfail[2]),
 	.frdbuf_data(fbd_data[35:24]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[2]),
	.frdbuf_frame_lock(fbd_frame_lock[2]),
	.fdout_frame_lock(fdout_frame_lock[2]),
	.fdout_rptr(fdout_rptr2[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf3 (
	.scan_in(rdbuf3_scanin),
	.scan_out(rdbuf3_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[3]),
	.fsr_data(fsr_data[47:36]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[3]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[3]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[3]),
	.frdbuf_testfail_sync(fbd_testfail[3]),
 	.frdbuf_data(fbd_data[47:36]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[3]),
	.frdbuf_frame_lock(fbd_frame_lock[3]),
	.fdout_frame_lock(fdout_frame_lock[3]),
	.fdout_rptr(fdout_rptr3[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf4 (
	.scan_in(rdbuf4_scanin),
	.scan_out(rdbuf4_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[4]),
	.fsr_data(fsr_data[59:48]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[4]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[4]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[4]),
	.frdbuf_testfail_sync(fbd_testfail[4]),
 	.frdbuf_data(fbd_data[59:48]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[4]),
	.frdbuf_frame_lock(fbd_frame_lock[4]),
	.fdout_frame_lock(fdout_frame_lock[4]),
	.fdout_rptr(fdout_rptr4[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf5 (
	.scan_in(rdbuf5_scanin),
	.scan_out(rdbuf5_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[5]),
	.fsr_data(fsr_data[71:60]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[5]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[5]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[5]),
	.frdbuf_testfail_sync(fbd_testfail[5]),
 	.frdbuf_data(fbd_data[71:60]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[5]),
	.frdbuf_frame_lock(fbd_frame_lock[5]),
	.fdout_frame_lock(fdout_frame_lock[5]),
	.fdout_rptr(fdout_rptr5[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf6 (
	.scan_in(rdbuf6_scanin),
	.scan_out(rdbuf6_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[6]),
	.fsr_data(fsr_data[83:72]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[6]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[6]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[6]),
	.frdbuf_testfail_sync(fbd_testfail[6]),
 	.frdbuf_data(fbd_data[83:72]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[6]),
	.frdbuf_frame_lock(fbd_frame_lock[6]),
	.fdout_frame_lock(fdout_frame_lock[6]),
	.fdout_rptr(fdout_rptr6[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf7 (
	.scan_in(rdbuf7_scanin),
	.scan_out(rdbuf7_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[7]),
	.fsr_data(fsr_data[95:84]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[7]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[7]),
 	.fsr_stsrx_testfail(fsr_stsrx_testfail[7]),
	.frdbuf_testfail_sync(fbd_testfail[7]),
	.frdbuf_data(fbd_data[95:84]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[7]),
	.frdbuf_frame_lock(fbd_frame_lock[7]),
	.fdout_frame_lock(fdout_frame_lock[7]),
	.fdout_rptr(fdout_rptr7[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf8 (
	.scan_in(rdbuf8_scanin),
	.scan_out(rdbuf8_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[8]),
	.fsr_data(fsr_data[107:96]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[8]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[8]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[8]),
	.frdbuf_testfail_sync(fbd_testfail[8]),
 	.frdbuf_data(fbd_data[107:96]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[8]),
	.frdbuf_frame_lock(fbd_frame_lock[8]),
	.fdout_frame_lock(fdout_frame_lock[8]),
	.fdout_rptr(fdout_rptr8[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf9 (
	.scan_in(rdbuf9_scanin),
	.scan_out(rdbuf9_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[9]),
	.fsr_data(fsr_data[119:108]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[9]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[9]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[9]),
	.frdbuf_testfail_sync(fbd_testfail[9]),
 	.frdbuf_data(fbd_data[119:108]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[9]),
	.frdbuf_frame_lock(fbd_frame_lock[9]),
	.fdout_frame_lock(fdout_frame_lock[9]),
	.fdout_rptr(fdout_rptr9[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf10 (
	.scan_in(rdbuf10_scanin),
	.scan_out(rdbuf10_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[10]),
	.fsr_data(fsr_data[131:120]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[10]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[10]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[10]),
	.frdbuf_testfail_sync(fbd_testfail[10]),
 	.frdbuf_data(fbd_data[131:120]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[10]),
	.frdbuf_frame_lock(fbd_frame_lock[10]),
	.fdout_frame_lock(fdout_frame_lock[10]),
	.fdout_rptr(fdout_rptr10[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf11 (
	.scan_in(rdbuf11_scanin),
	.scan_out(rdbuf11_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[11]),
	.fsr_data(fsr_data[143:132]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[11]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[11]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[11]),
	.frdbuf_testfail_sync(fbd_testfail[11]),
 	.frdbuf_data(fbd_data[143:132]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[11]),
	.frdbuf_frame_lock(fbd_frame_lock[11]),
	.fdout_frame_lock(fdout_frame_lock[11]),
	.fdout_rptr(fdout_rptr11[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf12 (
	.scan_in(rdbuf12_scanin),
	.scan_out(rdbuf12_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[12]),
	.fsr_data(fsr_data[155:144]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[12]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[12]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[12]),
	.frdbuf_testfail_sync(fbd_testfail[12]),
 	.frdbuf_data(fbd_data[155:144]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[12]),
	.frdbuf_frame_lock(fbd_frame_lock[12]),
	.fdout_frame_lock(fdout_frame_lock[12]),
	.fdout_rptr(fdout_rptr12[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

mcu_frdbuf_dp frdbuf13 (
	.scan_in(rdbuf13_scanin),
	.scan_out(rdbuf13_scanout),
	.drl2clk(drl2clk),
	.rxbclk(fsr_rxbclk[13]),
	.fsr_data(fsr_data[167:156]),
 	.fsr_stsrx_sync(fsr_stsrx_sync[13]),
	.fsr_stsrx_losdtct(fsr_stsrx_losdtct[13]),
	.fsr_stsrx_testfail(fsr_stsrx_testfail[13]),
	.frdbuf_testfail_sync(fbd_testfail[13]),
 	.frdbuf_data(fbd_data[167:156]),
	.frdbuf_elect_idle_sync(fbd_elect_idle[13]),
	.frdbuf_frame_lock(fbd_frame_lock[13]),
	.fdout_frame_lock(fdout_frame_lock[13]),
	.fdout_rptr(fdout_rptr13[1:0]),
  .fbdic_enable_sync_count(fbdic_enable_sync_count),
  .tcu_pce_ov(tcu_pce_ov),
  .tcu_aclk(tcu_aclk),
  .tcu_bclk(tcu_bclk),
  .tcu_scan_en(tcu_scan_en),
  .tcu_mcu_fbd_clk_stop(tcu_mcu_fbd_clk_stop),
  .tcu_mcu_testmode(tcu_mcu_testmode),
  .tcu_atpg_mode(tcu_atpg_mode)
);

// fixscan start:
assign rdbuf0_scanin             = scan_in                  ;
assign rdbuf1_scanin             = rdbuf0_scanout           ;
assign rdbuf2_scanin             = rdbuf1_scanout           ;
assign rdbuf3_scanin             = rdbuf2_scanout           ;
assign rdbuf4_scanin             = rdbuf3_scanout           ;
assign rdbuf5_scanin             = rdbuf4_scanout           ;
assign rdbuf6_scanin             = rdbuf5_scanout           ;
assign rdbuf7_scanin             = rdbuf6_scanout           ;
assign rdbuf8_scanin             = rdbuf7_scanout           ;
assign rdbuf9_scanin             = rdbuf8_scanout           ;
assign rdbuf10_scanin            = rdbuf9_scanout           ;
assign rdbuf11_scanin            = rdbuf10_scanout          ;
assign rdbuf12_scanin            = rdbuf11_scanout          ;
assign rdbuf13_scanin            = rdbuf12_scanout          ;
assign scan_out                  = rdbuf13_scanout          ;
// fixscan end:
endmodule


//  
//   and macro for ports = 2,3,4
//
//





module mcu_fbd_dp_and_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule









// any PARAMS parms go into naming of macro

module mcu_fbd_dp_msff_macro__stack_11r__width_4 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   invert macro
//
//





module mcu_fbd_dp_inv_macro (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_fbd_dp_nor_macro (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   buff macro
//
//





module mcu_fbd_dp_buff_macro__minbuff_1__stack_12r__width_12 (
  din, 
  dout);
  input [11:0] din;
  output [11:0] dout;






buff #(12)  d0_0 (
.in(din[11:0]),
.out(dout[11:0])
);








endmodule





//
//   increment macro 
//
//





module mcu_fbd_dp_increment_macro__width_4 (
  din, 
  cin, 
  dout, 
  cout);
  input [3:0] din;
  input cin;
  output [3:0] dout;
  output cout;






incr #(4)  m0_0 (
.cin(cin),
.in(din[3:0]),
.out(dout[3:0]),
.cout(cout)
);











endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_fbd_dp_and_macro__ports_3__width_4 (
  din0, 
  din1, 
  din2, 
  dout);
  input [3:0] din0;
  input [3:0] din1;
  input [3:0] din2;
  output [3:0] dout;






and3 #(4)  d0_0 (
.in0(din0[3:0]),
.in1(din1[3:0]),
.in2(din2[3:0]),
.out(dout[3:0])
);









endmodule





//  
//   or macro for ports = 2,3
//
//





module mcu_fbd_dp_or_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






or2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module mcu_fbd_dp_inv_macro__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






inv #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_fbd_dp_and_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






and2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);









endmodule





//
//   invert macro
//
//





module mcu_fbd_dp_inv_macro__width_2 (
  din, 
  dout);
  input [1:0] din;
  output [1:0] dout;






inv #(2)  d0_0 (
.in(din[1:0]),
.out(dout[1:0])
);









endmodule





//  
//   and macro for ports = 2,3,4
//
//





module mcu_fbd_dp_and_macro__width_2 (
  din0, 
  din1, 
  dout);
  input [1:0] din0;
  input [1:0] din1;
  output [1:0] dout;






and2 #(2)  d0_0 (
.in0(din0[1:0]),
.in1(din1[1:0]),
.out(dout[1:0])
);









endmodule





//
//   nor macro for ports = 2,3
//
//





module mcu_fbd_dp_nor_macro__ports_3__width_1 (
  din0, 
  din1, 
  din2, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  output [0:0] dout;






nor3 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module mcu_fbd_dp_msff_macro__stack_12r__width_12 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [10:0] so;

  input [11:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module mcu_fbd_dp_msff_macro__stack_12r__width_4 (
  din, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


  output scan_out;




cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule









//
//   nor macro for ports = 2,3
//
//





module mcu_fbd_dp_nor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






nor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule









// any PARAMS parms go into naming of macro

module mcu_fbd_dp_msff_macro__mux_aonpe__ports_4__stack_12r__width_12 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  clk, 
  en, 
  se, 
  scan_in, 
  siclk, 
  soclk, 
  pce_ov, 
  stop, 
  dout, 
  scan_out);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire [11:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [10:0] so;

  input [11:0] din0;
  input sel0;
  input [11:0] din1;
  input sel1;
  input [11:0] din2;
  input sel2;
  input [11:0] din3;
  input sel3;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [11:0] dout;


  output scan_out;




cl_dp1_muxbuff4_8x  c1_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3)
);
mux4s #(12)  d1_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .in0(din0[11:0]),
  .in1(din1[11:0]),
  .in2(din2[11:0]),
  .in3(din3[11:0]),
.dout(muxout[11:0])
);
cl_dp1_l1hdr_8x c0_0 (
.l2clk(clk),
.pce(en),
.aclk(siclk),
.bclk(soclk),
.l1clk(l1clk),
  .se(se),
  .pce_ov(pce_ov),
  .stop(stop),
  .siclk_out(siclk_out),
  .soclk_out(soclk_out)
);
dff #(12)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[11:0]),
.si({scan_in,so[10:0]}),
.so({so[10:0],scan_out}),
.q(dout[11:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module mcu_fbd_dp_mux_macro__buffsel_none__mux_aonpe (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
  input [0:0] din0;
  input sel0;
  input [0:0] din1;
  input sel1;
  output [0:0] dout;





mux2s #(1)  d0_0 (
  .sel0(sel0),
  .sel1(sel1),
  .in0(din0[0:0]),
  .in1(din1[0:0]),
.dout(dout[0:0])
);









  



endmodule

