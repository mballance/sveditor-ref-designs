// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_fdoklu_ctl.v
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
module mcu_fdoklu_ctl (
  fdout0_frame_lock_sync, 
  fdout1_frame_lock_sync, 
  fdout0_rptr0, 
  fdout0_rptr1, 
  fdout0_rptr2, 
  fdout0_rptr3, 
  fdout0_rptr4, 
  fdout0_rptr5, 
  fdout0_rptr6, 
  fdout0_rptr7, 
  fdout0_rptr8, 
  fdout0_rptr9, 
  fdout0_rptr10, 
  fdout0_rptr11, 
  fdout0_rptr12, 
  fdout0_rptr13, 
  fdout1_rptr0, 
  fdout1_rptr1, 
  fdout1_rptr2, 
  fdout1_rptr3, 
  fdout1_rptr4, 
  fdout1_rptr5, 
  fdout1_rptr6, 
  fdout1_rptr7, 
  fdout1_rptr8, 
  fdout1_rptr9, 
  fdout1_rptr10, 
  fdout1_rptr11, 
  fdout1_rptr12, 
  fdout1_rptr13, 
  fdout_idle_lfsr, 
  fdout_idle_lfsr_l_0, 
  fdout_link_cnt, 
  fbdic_link_cnt_eq_0_d1, 
  rdpctl_kp_lnk_up, 
  fbdic_link_cnt_en, 
  fbdic_idle_lfsr_reset, 
  fbdic_link_cnt_reset, 
  fbdic_l0_state, 
  fbd0_frame_lock, 
  fbd1_frame_lock, 
  tcu_mcu_fbd_clk_stop, 
  tcu_atpg_mode, 
  drl2clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_pce_ov, 
  tcu_mcu_testmode);
wire pce_ov;
wire siclk;
wire soclk;
wire se;
wire stop;
wire drl2clk_buf;
wire l1clk;
wire [5:0] fdout_link_cnt_in;
wire fbdic_link_cnt_eq_0;
wire ff_link_cnt_scanin;
wire ff_link_cnt_scanout;
wire ff_link_cnt_eq_0_d1_scanin;
wire ff_link_cnt_eq_0_d1_scanout;
wire sync_fbd0_framelock0_scanin;
wire sync_fbd0_framelock0_scanout;
wire sync_fbd0_framelock1_scanin;
wire sync_fbd0_framelock1_scanout;
wire sync_fbd0_framelock2_scanin;
wire sync_fbd0_framelock2_scanout;
wire sync_fbd0_framelock3_scanin;
wire sync_fbd0_framelock3_scanout;
wire sync_fbd0_framelock4_scanin;
wire sync_fbd0_framelock4_scanout;
wire sync_fbd0_framelock5_scanin;
wire sync_fbd0_framelock5_scanout;
wire sync_fbd0_framelock6_scanin;
wire sync_fbd0_framelock6_scanout;
wire sync_fbd0_framelock7_scanin;
wire sync_fbd0_framelock7_scanout;
wire sync_fbd0_framelock8_scanin;
wire sync_fbd0_framelock8_scanout;
wire sync_fbd0_framelock9_scanin;
wire sync_fbd0_framelock9_scanout;
wire sync_fbd0_framelock10_scanin;
wire sync_fbd0_framelock10_scanout;
wire sync_fbd0_framelock11_scanin;
wire sync_fbd0_framelock11_scanout;
wire sync_fbd0_framelock12_scanin;
wire sync_fbd0_framelock12_scanout;
wire sync_fbd0_framelock13_scanin;
wire sync_fbd0_framelock13_scanout;
wire sync_fbd1_framelock0_scanin;
wire sync_fbd1_framelock0_scanout;
wire sync_fbd1_framelock1_scanin;
wire sync_fbd1_framelock1_scanout;
wire sync_fbd1_framelock2_scanin;
wire sync_fbd1_framelock2_scanout;
wire sync_fbd1_framelock3_scanin;
wire sync_fbd1_framelock3_scanout;
wire sync_fbd1_framelock4_scanin;
wire sync_fbd1_framelock4_scanout;
wire sync_fbd1_framelock5_scanin;
wire sync_fbd1_framelock5_scanout;
wire sync_fbd1_framelock6_scanin;
wire sync_fbd1_framelock6_scanout;
wire sync_fbd1_framelock7_scanin;
wire sync_fbd1_framelock7_scanout;
wire sync_fbd1_framelock8_scanin;
wire sync_fbd1_framelock8_scanout;
wire sync_fbd1_framelock9_scanin;
wire sync_fbd1_framelock9_scanout;
wire sync_fbd1_framelock10_scanin;
wire sync_fbd1_framelock10_scanout;
wire sync_fbd1_framelock11_scanin;
wire sync_fbd1_framelock11_scanout;
wire sync_fbd1_framelock12_scanin;
wire sync_fbd1_framelock12_scanout;
wire sync_fbd1_framelock13_scanin;
wire sync_fbd1_framelock13_scanout;
wire [1:0] fdout0_rptr0_in;
wire [1:0] fdout0_rptr1_in;
wire [1:0] fdout0_rptr2_in;
wire [1:0] fdout0_rptr3_in;
wire [1:0] fdout0_rptr4_in;
wire [1:0] fdout0_rptr5_in;
wire [1:0] fdout0_rptr6_in;
wire [1:0] fdout0_rptr7_in;
wire [1:0] fdout0_rptr8_in;
wire [1:0] fdout0_rptr9_in;
wire [1:0] fdout0_rptr10_in;
wire [1:0] fdout0_rptr11_in;
wire [1:0] fdout0_rptr12_in;
wire [1:0] fdout0_rptr13_in;
wire ff0_rptr0_scanin;
wire ff0_rptr0_scanout;
wire ff0_rptr1_scanin;
wire ff0_rptr1_scanout;
wire ff0_rptr2_scanin;
wire ff0_rptr2_scanout;
wire ff0_rptr3_scanin;
wire ff0_rptr3_scanout;
wire ff0_rptr4_scanin;
wire ff0_rptr4_scanout;
wire ff0_rptr5_scanin;
wire ff0_rptr5_scanout;
wire ff0_rptr6_scanin;
wire ff0_rptr6_scanout;
wire ff0_rptr7_scanin;
wire ff0_rptr7_scanout;
wire ff0_rptr8_scanin;
wire ff0_rptr8_scanout;
wire ff0_rptr9_scanin;
wire ff0_rptr9_scanout;
wire ff0_rptr10_scanin;
wire ff0_rptr10_scanout;
wire ff0_rptr11_scanin;
wire ff0_rptr11_scanout;
wire ff0_rptr12_scanin;
wire ff0_rptr12_scanout;
wire ff0_rptr13_scanin;
wire ff0_rptr13_scanout;
wire [1:0] fdout1_rptr0_in;
wire [1:0] fdout1_rptr1_in;
wire [1:0] fdout1_rptr2_in;
wire [1:0] fdout1_rptr3_in;
wire [1:0] fdout1_rptr4_in;
wire [1:0] fdout1_rptr5_in;
wire [1:0] fdout1_rptr6_in;
wire [1:0] fdout1_rptr7_in;
wire [1:0] fdout1_rptr8_in;
wire [1:0] fdout1_rptr9_in;
wire [1:0] fdout1_rptr10_in;
wire [1:0] fdout1_rptr11_in;
wire [1:0] fdout1_rptr12_in;
wire [1:0] fdout1_rptr13_in;
wire ff1_rptr0_scanin;
wire ff1_rptr0_scanout;
wire ff1_rptr1_scanin;
wire ff1_rptr1_scanout;
wire ff1_rptr2_scanin;
wire ff1_rptr2_scanout;
wire ff1_rptr3_scanin;
wire ff1_rptr3_scanout;
wire ff1_rptr4_scanin;
wire ff1_rptr4_scanout;
wire ff1_rptr5_scanin;
wire ff1_rptr5_scanout;
wire ff1_rptr6_scanin;
wire ff1_rptr6_scanout;
wire ff1_rptr7_scanin;
wire ff1_rptr7_scanout;
wire ff1_rptr8_scanin;
wire ff1_rptr8_scanout;
wire ff1_rptr9_scanin;
wire ff1_rptr9_scanout;
wire ff1_rptr10_scanin;
wire ff1_rptr10_scanout;
wire ff1_rptr11_scanin;
wire ff1_rptr11_scanout;
wire ff1_rptr12_scanin;
wire ff1_rptr12_scanout;
wire ff1_rptr13_scanin;
wire ff1_rptr13_scanout;
wire [11:0] fdout_idle_lfsr_in;
wire ff_idle_lfsr_scanin;
wire ff_idle_lfsr_scanout;
wire spares_scanin;
wire spares_scanout;


output	[13:0]	fdout0_frame_lock_sync;
output	[13:0]	fdout1_frame_lock_sync;

output	[1:0]	fdout0_rptr0;
output	[1:0]	fdout0_rptr1;
output	[1:0]	fdout0_rptr2;
output	[1:0]	fdout0_rptr3;
output	[1:0]	fdout0_rptr4;
output	[1:0]	fdout0_rptr5;
output	[1:0]	fdout0_rptr6;
output	[1:0]	fdout0_rptr7;
output	[1:0]	fdout0_rptr8;
output	[1:0]	fdout0_rptr9;
output	[1:0]	fdout0_rptr10;
output	[1:0]	fdout0_rptr11;
output	[1:0]	fdout0_rptr12;
output	[1:0]	fdout0_rptr13;

output	[1:0]	fdout1_rptr0;
output	[1:0]	fdout1_rptr1;
output	[1:0]	fdout1_rptr2;
output	[1:0]	fdout1_rptr3;
output	[1:0]	fdout1_rptr4;
output	[1:0]	fdout1_rptr5;
output	[1:0]	fdout1_rptr6;
output	[1:0]	fdout1_rptr7;
output	[1:0]	fdout1_rptr8;
output	[1:0]	fdout1_rptr9;
output	[1:0]	fdout1_rptr10;
output	[1:0]	fdout1_rptr11;
output	[1:0]	fdout1_rptr12;
output	[1:0]	fdout1_rptr13;

output	[11:0]	fdout_idle_lfsr;
output		fdout_idle_lfsr_l_0;

output	[5:0]	fdout_link_cnt;

output		fbdic_link_cnt_eq_0_d1;

input		rdpctl_kp_lnk_up;
input		fbdic_link_cnt_en;
input		fbdic_idle_lfsr_reset;
input	[5:0]	fbdic_link_cnt_reset;
input		fbdic_l0_state;

input	[13:0]	fbd0_frame_lock;
input	[13:0]	fbd1_frame_lock;

input		tcu_mcu_fbd_clk_stop;
input		tcu_atpg_mode;

input		drl2clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;
input		tcu_pce_ov;
input		tcu_mcu_testmode;

// Scan reassigns
assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk & tcu_mcu_testmode;
assign soclk = tcu_bclk & tcu_mcu_testmode;
assign se = tcu_scan_en & tcu_mcu_testmode;
assign stop = tcu_mcu_fbd_clk_stop & ~tcu_atpg_mode;

cl_sc1_clk_inv_8x inv_drl2clk (
	.clkin(drl2clk),
	.clkout(drl2clk_buf));

mcu_fdoklu_ctl_l1clkhdr_ctl_macro clkgen (
 	.l2clk(drl2clk_buf),
 	.l1en (1'b1 ),
 	.l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));

assign fdout_link_cnt_in[5:0] = {6{fbdic_link_cnt_en}} & 
			(fbdic_link_cnt_eq_0 ? fbdic_link_cnt_reset[5:0] - 6'h1 : fdout_link_cnt[5:0] - 6'h1);

mcu_fdoklu_ctl_msff_ctl_macro__width_6 ff_link_cnt  (
	.scan_in(ff_link_cnt_scanin),
	.scan_out(ff_link_cnt_scanout),
	.din(fdout_link_cnt_in[5:0]),
	.dout(fdout_link_cnt[5:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign fbdic_link_cnt_eq_0 = fdout_link_cnt[5:0] == 6'h0;
mcu_fdoklu_ctl_msff_ctl_macro ff_link_cnt_eq_0_d1 (
	.scan_in(ff_link_cnt_eq_0_d1_scanin),
	.scan_out(ff_link_cnt_eq_0_d1_scanout),
	.din(fbdic_link_cnt_eq_0),
	.dout(fbdic_link_cnt_eq_0_d1),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Frame lock synchronizers

cl_sc1_clksyncff_4x sync_fbd0_framelock0 (
	.d(fbd0_frame_lock[0]),
	.q(fdout0_frame_lock_sync[0]),
	.si(sync_fbd0_framelock0_scanin),
	.so(sync_fbd0_framelock0_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock1 (
	.d(fbd0_frame_lock[1]),
	.q(fdout0_frame_lock_sync[1]),
	.si(sync_fbd0_framelock1_scanin),
	.so(sync_fbd0_framelock1_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock2 (
	.d(fbd0_frame_lock[2]),
	.q(fdout0_frame_lock_sync[2]),
	.si(sync_fbd0_framelock2_scanin),
	.so(sync_fbd0_framelock2_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock3 (
	.d(fbd0_frame_lock[3]),
	.q(fdout0_frame_lock_sync[3]),
	.si(sync_fbd0_framelock3_scanin),
	.so(sync_fbd0_framelock3_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock4 (
	.d(fbd0_frame_lock[4]),
	.q(fdout0_frame_lock_sync[4]),
	.si(sync_fbd0_framelock4_scanin),
	.so(sync_fbd0_framelock4_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock5 (
	.d(fbd0_frame_lock[5]),
	.q(fdout0_frame_lock_sync[5]),
	.si(sync_fbd0_framelock5_scanin),
	.so(sync_fbd0_framelock5_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock6 (
	.d(fbd0_frame_lock[6]),
	.q(fdout0_frame_lock_sync[6]),
	.si(sync_fbd0_framelock6_scanin),
	.so(sync_fbd0_framelock6_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock7 (
	.d(fbd0_frame_lock[7]),
	.q(fdout0_frame_lock_sync[7]),
	.si(sync_fbd0_framelock7_scanin),
	.so(sync_fbd0_framelock7_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock8 (
	.d(fbd0_frame_lock[8]),
	.q(fdout0_frame_lock_sync[8]),
	.si(sync_fbd0_framelock8_scanin),
	.so(sync_fbd0_framelock8_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock9 (
	.d(fbd0_frame_lock[9]),
	.q(fdout0_frame_lock_sync[9]),
	.si(sync_fbd0_framelock9_scanin),
	.so(sync_fbd0_framelock9_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock10 (
	.d(fbd0_frame_lock[10]),
	.q(fdout0_frame_lock_sync[10]),
	.si(sync_fbd0_framelock10_scanin),
	.so(sync_fbd0_framelock10_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock11 (
	.d(fbd0_frame_lock[11]),
	.q(fdout0_frame_lock_sync[11]),
	.si(sync_fbd0_framelock11_scanin),
	.so(sync_fbd0_framelock11_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock12 (
	.d(fbd0_frame_lock[12]),
	.q(fdout0_frame_lock_sync[12]),
	.si(sync_fbd0_framelock12_scanin),
	.so(sync_fbd0_framelock12_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd0_framelock13 (
	.d(fbd0_frame_lock[13]),
	.q(fdout0_frame_lock_sync[13]),
	.si(sync_fbd0_framelock13_scanin),
	.so(sync_fbd0_framelock13_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock0 (
	.d(fbd1_frame_lock[0]),
	.q(fdout1_frame_lock_sync[0]),
	.si(sync_fbd1_framelock0_scanin),
	.so(sync_fbd1_framelock0_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock1 (
	.d(fbd1_frame_lock[1]),
	.q(fdout1_frame_lock_sync[1]),
	.si(sync_fbd1_framelock1_scanin),
	.so(sync_fbd1_framelock1_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock2 (
	.d(fbd1_frame_lock[2]),
	.q(fdout1_frame_lock_sync[2]),
	.si(sync_fbd1_framelock2_scanin),
	.so(sync_fbd1_framelock2_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock3 (
	.d(fbd1_frame_lock[3]),
	.q(fdout1_frame_lock_sync[3]),
	.si(sync_fbd1_framelock3_scanin),
	.so(sync_fbd1_framelock3_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock4 (
	.d(fbd1_frame_lock[4]),
	.q(fdout1_frame_lock_sync[4]),
	.si(sync_fbd1_framelock4_scanin),
	.so(sync_fbd1_framelock4_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock5 (
	.d(fbd1_frame_lock[5]),
	.q(fdout1_frame_lock_sync[5]),
	.si(sync_fbd1_framelock5_scanin),
	.so(sync_fbd1_framelock5_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock6 (
	.d(fbd1_frame_lock[6]),
	.q(fdout1_frame_lock_sync[6]),
	.si(sync_fbd1_framelock6_scanin),
	.so(sync_fbd1_framelock6_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock7 (
	.d(fbd1_frame_lock[7]),
	.q(fdout1_frame_lock_sync[7]),
	.si(sync_fbd1_framelock7_scanin),
	.so(sync_fbd1_framelock7_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock8 (
	.d(fbd1_frame_lock[8]),
	.q(fdout1_frame_lock_sync[8]),
	.si(sync_fbd1_framelock8_scanin),
	.so(sync_fbd1_framelock8_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock9 (
	.d(fbd1_frame_lock[9]),
	.q(fdout1_frame_lock_sync[9]),
	.si(sync_fbd1_framelock9_scanin),
	.so(sync_fbd1_framelock9_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock10 (
	.d(fbd1_frame_lock[10]),
	.q(fdout1_frame_lock_sync[10]),
	.si(sync_fbd1_framelock10_scanin),
	.so(sync_fbd1_framelock10_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock11 (
	.d(fbd1_frame_lock[11]),
	.q(fdout1_frame_lock_sync[11]),
	.si(sync_fbd1_framelock11_scanin),
	.so(sync_fbd1_framelock11_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock12 (
	.d(fbd1_frame_lock[12]),
	.q(fdout1_frame_lock_sync[12]),
	.si(sync_fbd1_framelock12_scanin),
	.so(sync_fbd1_framelock12_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

cl_sc1_clksyncff_4x sync_fbd1_framelock13 (
	.d(fbd1_frame_lock[13]),
	.q(fdout1_frame_lock_sync[13]),
	.si(sync_fbd1_framelock13_scanin),
	.so(sync_fbd1_framelock13_scanout),
  .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// Cross domain FIFO read pointers

assign fdout0_rptr0_in[1:0] = {fdout0_rptr0[0],~fdout0_rptr0[1]} & {2{fdout0_frame_lock_sync[0]}};
assign fdout0_rptr1_in[1:0] = {fdout0_rptr1[0],~fdout0_rptr1[1]} & {2{fdout0_frame_lock_sync[1]}};
assign fdout0_rptr2_in[1:0] = {fdout0_rptr2[0],~fdout0_rptr2[1]} & {2{fdout0_frame_lock_sync[2]}};
assign fdout0_rptr3_in[1:0] = {fdout0_rptr3[0],~fdout0_rptr3[1]} & {2{fdout0_frame_lock_sync[3]}};
assign fdout0_rptr4_in[1:0] = {fdout0_rptr4[0],~fdout0_rptr4[1]} & {2{fdout0_frame_lock_sync[4]}};
assign fdout0_rptr5_in[1:0] = {fdout0_rptr5[0],~fdout0_rptr5[1]} & {2{fdout0_frame_lock_sync[5]}};
assign fdout0_rptr6_in[1:0] = {fdout0_rptr6[0],~fdout0_rptr6[1]} & {2{fdout0_frame_lock_sync[6]}};
assign fdout0_rptr7_in[1:0] = {fdout0_rptr7[0],~fdout0_rptr7[1]} & {2{fdout0_frame_lock_sync[7]}};
assign fdout0_rptr8_in[1:0] = {fdout0_rptr8[0],~fdout0_rptr8[1]} & {2{fdout0_frame_lock_sync[8]}};
assign fdout0_rptr9_in[1:0] = {fdout0_rptr9[0],~fdout0_rptr9[1]} & {2{fdout0_frame_lock_sync[9]}};
assign fdout0_rptr10_in[1:0] = {fdout0_rptr10[0],~fdout0_rptr10[1]} & {2{fdout0_frame_lock_sync[10]}};
assign fdout0_rptr11_in[1:0] = {fdout0_rptr11[0],~fdout0_rptr11[1]} & {2{fdout0_frame_lock_sync[11]}};
assign fdout0_rptr12_in[1:0] = {fdout0_rptr12[0],~fdout0_rptr12[1]} & {2{fdout0_frame_lock_sync[12]}};
assign fdout0_rptr13_in[1:0] = {fdout0_rptr13[0],~fdout0_rptr13[1]} & {2{fdout0_frame_lock_sync[13]}};

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr0  (
	.scan_in(ff0_rptr0_scanin),
	.scan_out(ff0_rptr0_scanout),
	.din(fdout0_rptr0_in[1:0]),
	.dout(fdout0_rptr0[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr1  (
	.scan_in(ff0_rptr1_scanin),
	.scan_out(ff0_rptr1_scanout),
	.din(fdout0_rptr1_in[1:0]),
	.dout(fdout0_rptr1[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr2  (
	.scan_in(ff0_rptr2_scanin),
	.scan_out(ff0_rptr2_scanout),
	.din(fdout0_rptr2_in[1:0]),
	.dout(fdout0_rptr2[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr3  (
	.scan_in(ff0_rptr3_scanin),
	.scan_out(ff0_rptr3_scanout),
	.din(fdout0_rptr3_in[1:0]),
	.dout(fdout0_rptr3[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr4  (
	.scan_in(ff0_rptr4_scanin),
	.scan_out(ff0_rptr4_scanout),
	.din(fdout0_rptr4_in[1:0]),
	.dout(fdout0_rptr4[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr5  (
	.scan_in(ff0_rptr5_scanin),
	.scan_out(ff0_rptr5_scanout),
	.din(fdout0_rptr5_in[1:0]),
	.dout(fdout0_rptr5[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr6  (
	.scan_in(ff0_rptr6_scanin),
	.scan_out(ff0_rptr6_scanout),
	.din(fdout0_rptr6_in[1:0]),
	.dout(fdout0_rptr6[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr7  (
	.scan_in(ff0_rptr7_scanin),
	.scan_out(ff0_rptr7_scanout),
	.din(fdout0_rptr7_in[1:0]),
	.dout(fdout0_rptr7[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr8  (
	.scan_in(ff0_rptr8_scanin),
	.scan_out(ff0_rptr8_scanout),
	.din(fdout0_rptr8_in[1:0]),
	.dout(fdout0_rptr8[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr9  (
	.scan_in(ff0_rptr9_scanin),
	.scan_out(ff0_rptr9_scanout),
	.din(fdout0_rptr9_in[1:0]),
	.dout(fdout0_rptr9[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr10  (
	.scan_in(ff0_rptr10_scanin),
	.scan_out(ff0_rptr10_scanout),
	.din(fdout0_rptr10_in[1:0]),
	.dout(fdout0_rptr10[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr11  (
	.scan_in(ff0_rptr11_scanin),
	.scan_out(ff0_rptr11_scanout),
	.din(fdout0_rptr11_in[1:0]),
	.dout(fdout0_rptr11[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr12  (
	.scan_in(ff0_rptr12_scanin),
	.scan_out(ff0_rptr12_scanout),
	.din(fdout0_rptr12_in[1:0]),
	.dout(fdout0_rptr12[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff0_rptr13  (
	.scan_in(ff0_rptr13_scanin),
	.scan_out(ff0_rptr13_scanout),
	.din(fdout0_rptr13_in[1:0]),
	.dout(fdout0_rptr13[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// -------------------------------------------

assign fdout1_rptr0_in[1:0] = {fdout1_rptr0[0],~fdout1_rptr0[1]} & {2{fdout1_frame_lock_sync[0]}};
assign fdout1_rptr1_in[1:0] = {fdout1_rptr1[0],~fdout1_rptr1[1]} & {2{fdout1_frame_lock_sync[1]}};
assign fdout1_rptr2_in[1:0] = {fdout1_rptr2[0],~fdout1_rptr2[1]} & {2{fdout1_frame_lock_sync[2]}};
assign fdout1_rptr3_in[1:0] = {fdout1_rptr3[0],~fdout1_rptr3[1]} & {2{fdout1_frame_lock_sync[3]}};
assign fdout1_rptr4_in[1:0] = {fdout1_rptr4[0],~fdout1_rptr4[1]} & {2{fdout1_frame_lock_sync[4]}};
assign fdout1_rptr5_in[1:0] = {fdout1_rptr5[0],~fdout1_rptr5[1]} & {2{fdout1_frame_lock_sync[5]}};
assign fdout1_rptr6_in[1:0] = {fdout1_rptr6[0],~fdout1_rptr6[1]} & {2{fdout1_frame_lock_sync[6]}};
assign fdout1_rptr7_in[1:0] = {fdout1_rptr7[0],~fdout1_rptr7[1]} & {2{fdout1_frame_lock_sync[7]}};
assign fdout1_rptr8_in[1:0] = {fdout1_rptr8[0],~fdout1_rptr8[1]} & {2{fdout1_frame_lock_sync[8]}};
assign fdout1_rptr9_in[1:0] = {fdout1_rptr9[0],~fdout1_rptr9[1]} & {2{fdout1_frame_lock_sync[9]}};
assign fdout1_rptr10_in[1:0] = {fdout1_rptr10[0],~fdout1_rptr10[1]} & {2{fdout1_frame_lock_sync[10]}};
assign fdout1_rptr11_in[1:0] = {fdout1_rptr11[0],~fdout1_rptr11[1]} & {2{fdout1_frame_lock_sync[11]}};
assign fdout1_rptr12_in[1:0] = {fdout1_rptr12[0],~fdout1_rptr12[1]} & {2{fdout1_frame_lock_sync[12]}};
assign fdout1_rptr13_in[1:0] = {fdout1_rptr13[0],~fdout1_rptr13[1]} & {2{fdout1_frame_lock_sync[13]}};

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr0  (
	.scan_in(ff1_rptr0_scanin),
	.scan_out(ff1_rptr0_scanout),
	.din(fdout1_rptr0_in[1:0]),
	.dout(fdout1_rptr0[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr1  (
	.scan_in(ff1_rptr1_scanin),
	.scan_out(ff1_rptr1_scanout),
	.din(fdout1_rptr1_in[1:0]),
	.dout(fdout1_rptr1[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr2  (
	.scan_in(ff1_rptr2_scanin),
	.scan_out(ff1_rptr2_scanout),
	.din(fdout1_rptr2_in[1:0]),
	.dout(fdout1_rptr2[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr3  (
	.scan_in(ff1_rptr3_scanin),
	.scan_out(ff1_rptr3_scanout),
	.din(fdout1_rptr3_in[1:0]),
	.dout(fdout1_rptr3[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr4  (
	.scan_in(ff1_rptr4_scanin),
	.scan_out(ff1_rptr4_scanout),
	.din(fdout1_rptr4_in[1:0]),
	.dout(fdout1_rptr4[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr5  (
	.scan_in(ff1_rptr5_scanin),
	.scan_out(ff1_rptr5_scanout),
	.din(fdout1_rptr5_in[1:0]),
	.dout(fdout1_rptr5[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr6  (
	.scan_in(ff1_rptr6_scanin),
	.scan_out(ff1_rptr6_scanout),
	.din(fdout1_rptr6_in[1:0]),
	.dout(fdout1_rptr6[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr7  (
	.scan_in(ff1_rptr7_scanin),
	.scan_out(ff1_rptr7_scanout),
	.din(fdout1_rptr7_in[1:0]),
	.dout(fdout1_rptr7[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr8  (
	.scan_in(ff1_rptr8_scanin),
	.scan_out(ff1_rptr8_scanout),
	.din(fdout1_rptr8_in[1:0]),
	.dout(fdout1_rptr8[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr9  (
	.scan_in(ff1_rptr9_scanin),
	.scan_out(ff1_rptr9_scanout),
	.din(fdout1_rptr9_in[1:0]),
	.dout(fdout1_rptr9[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr10  (
	.scan_in(ff1_rptr10_scanin),
	.scan_out(ff1_rptr10_scanout),
	.din(fdout1_rptr10_in[1:0]),
	.dout(fdout1_rptr10[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr11  (
	.scan_in(ff1_rptr11_scanin),
	.scan_out(ff1_rptr11_scanout),
	.din(fdout1_rptr11_in[1:0]),
	.dout(fdout1_rptr11[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr12  (
	.scan_in(ff1_rptr12_scanin),
	.scan_out(ff1_rptr12_scanout),
	.din(fdout1_rptr12_in[1:0]),
	.dout(fdout1_rptr12[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_msff_ctl_macro__width_2 ff1_rptr13  (
	.scan_in(ff1_rptr13_scanin),
	.scan_out(ff1_rptr13_scanout),
	.din(fdout1_rptr13_in[1:0]),
	.dout(fdout1_rptr13[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// LFSR
assign fdout_idle_lfsr_in[11:0] = fbdic_idle_lfsr_reset ? 12'h001 :
		{fdout_idle_lfsr[7] ^ fdout_idle_lfsr[4] ^ fdout_idle_lfsr[3] ^ fdout_idle_lfsr[0], fdout_idle_lfsr[11:1]};

mcu_fdoklu_ctl_msff_ctl_macro__width_12 ff_idle_lfsr  (
	.scan_in(ff_idle_lfsr_scanin),
	.scan_out(ff_idle_lfsr_scanout),
	.din(fdout_idle_lfsr_in[11:0]),
	.dout(fdout_idle_lfsr[11:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_fdoklu_ctl_spare_ctl_macro__num_2 spares  (
        .scan_in(spares_scanin),
        .scan_out(spares_scanout),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);

assign fdout_idle_lfsr_l_0 = ~fdout_idle_lfsr[0];

assign ff_link_cnt_scanin          = scan_in                     ;
assign ff_link_cnt_eq_0_d1_scanin  = ff_link_cnt_scanout         ;
assign sync_fbd0_framelock0_scanin = ff_link_cnt_eq_0_d1_scanout ;
assign sync_fbd0_framelock1_scanin = sync_fbd0_framelock0_scanout;
assign sync_fbd0_framelock2_scanin = sync_fbd0_framelock1_scanout;
assign sync_fbd0_framelock3_scanin = sync_fbd0_framelock2_scanout;
assign sync_fbd0_framelock4_scanin = sync_fbd0_framelock3_scanout;
assign sync_fbd0_framelock5_scanin = sync_fbd0_framelock4_scanout;
assign sync_fbd0_framelock6_scanin = sync_fbd0_framelock5_scanout;
assign sync_fbd0_framelock7_scanin = sync_fbd0_framelock6_scanout;
assign sync_fbd0_framelock8_scanin = sync_fbd0_framelock7_scanout;
assign sync_fbd0_framelock9_scanin = sync_fbd0_framelock8_scanout;
assign sync_fbd0_framelock10_scanin = sync_fbd0_framelock9_scanout;
assign sync_fbd0_framelock11_scanin = sync_fbd0_framelock10_scanout;
assign sync_fbd0_framelock12_scanin = sync_fbd0_framelock11_scanout;
assign sync_fbd0_framelock13_scanin = sync_fbd0_framelock12_scanout;
assign sync_fbd1_framelock0_scanin = sync_fbd0_framelock13_scanout;
assign sync_fbd1_framelock1_scanin = sync_fbd1_framelock0_scanout;
assign sync_fbd1_framelock2_scanin = sync_fbd1_framelock1_scanout;
assign sync_fbd1_framelock3_scanin = sync_fbd1_framelock2_scanout;
assign sync_fbd1_framelock4_scanin = sync_fbd1_framelock3_scanout;
assign sync_fbd1_framelock5_scanin = sync_fbd1_framelock4_scanout;
assign sync_fbd1_framelock6_scanin = sync_fbd1_framelock5_scanout;
assign sync_fbd1_framelock7_scanin = sync_fbd1_framelock6_scanout;
assign sync_fbd1_framelock8_scanin = sync_fbd1_framelock7_scanout;
assign sync_fbd1_framelock9_scanin = sync_fbd1_framelock8_scanout;
assign sync_fbd1_framelock10_scanin = sync_fbd1_framelock9_scanout;
assign sync_fbd1_framelock11_scanin = sync_fbd1_framelock10_scanout;
assign sync_fbd1_framelock12_scanin = sync_fbd1_framelock11_scanout;
assign sync_fbd1_framelock13_scanin = sync_fbd1_framelock12_scanout;
assign ff0_rptr0_scanin          = sync_fbd1_framelock13_scanout;
assign ff0_rptr1_scanin          = ff0_rptr0_scanout        ;
assign ff0_rptr2_scanin          = ff0_rptr1_scanout        ;
assign ff0_rptr3_scanin          = ff0_rptr2_scanout        ;
assign ff0_rptr4_scanin          = ff0_rptr3_scanout        ;
assign ff0_rptr5_scanin          = ff0_rptr4_scanout        ;
assign ff0_rptr6_scanin          = ff0_rptr5_scanout        ;
assign ff0_rptr7_scanin          = ff0_rptr6_scanout        ;
assign ff0_rptr8_scanin          = ff0_rptr7_scanout        ;
assign ff0_rptr9_scanin          = ff0_rptr8_scanout        ;
assign ff0_rptr10_scanin         = ff0_rptr9_scanout        ;
assign ff0_rptr11_scanin         = ff0_rptr10_scanout       ;
assign ff0_rptr12_scanin         = ff0_rptr11_scanout       ;
assign ff0_rptr13_scanin         = ff0_rptr12_scanout       ;
assign ff1_rptr0_scanin          = ff0_rptr13_scanout       ;
assign ff1_rptr1_scanin          = ff1_rptr0_scanout        ;
assign ff1_rptr2_scanin          = ff1_rptr1_scanout        ;
assign ff1_rptr3_scanin          = ff1_rptr2_scanout        ;
assign ff1_rptr4_scanin          = ff1_rptr3_scanout        ;
assign ff1_rptr5_scanin          = ff1_rptr4_scanout        ;
assign ff1_rptr6_scanin          = ff1_rptr5_scanout        ;
assign ff1_rptr7_scanin          = ff1_rptr6_scanout        ;
assign ff1_rptr8_scanin          = ff1_rptr7_scanout        ;
assign ff1_rptr9_scanin          = ff1_rptr8_scanout        ;
assign ff1_rptr10_scanin         = ff1_rptr9_scanout        ;
assign ff1_rptr11_scanin         = ff1_rptr10_scanout       ;
assign ff1_rptr12_scanin         = ff1_rptr11_scanout       ;
assign ff1_rptr13_scanin         = ff1_rptr12_scanout       ;
assign ff_idle_lfsr_scanin       = ff1_rptr13_scanout       ;
assign spares_scanin             = ff_idle_lfsr_scanout     ;
assign scan_out                  = tcu_mcu_testmode ? spares_scanout : scan_in ;

endmodule






// any PARAMS parms go into naming of macro

module mcu_fdoklu_ctl_l1clkhdr_ctl_macro (
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

module mcu_fdoklu_ctl_msff_ctl_macro__width_6 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = din[5:0];






dff #(6)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[5:0]),
.si({scan_in,so[4:0]}),
.so({so[4:0],scan_out}),
.q(dout[5:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fdoklu_ctl_msff_ctl_macro (
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

module mcu_fdoklu_ctl_msff_ctl_macro__width_2 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [1:0] fdin;
wire [0:0] so;

  input [1:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [1:0] dout;
  output scan_out;
assign fdin[1:0] = din[1:0];






dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_fdoklu_ctl_msff_ctl_macro__width_12 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mcu_fdoklu_ctl_spare_ctl_macro__num_2 (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));
assign scan_out = so_1;



endmodule

