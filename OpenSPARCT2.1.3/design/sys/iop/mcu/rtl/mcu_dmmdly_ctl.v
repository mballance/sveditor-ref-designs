// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_dmmdly_ctl.v
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
module mcu_dmmdly_ctl (
  rrd_cnt_is_zero, 
  rtw_cnt_is_zero, 
  wtr_cnt_is_zero, 
  rtr_cnt_is_zero, 
  wtw_cnt_is_zero, 
  dmmdly_4_activate_stall, 
  rrd_reg, 
  rtw_reg, 
  wtr_reg, 
  faw_reg, 
  drif_rd_ras_picked, 
  drif_wr_ras_picked, 
  drif_wrbc_ras_picked, 
  fbdic_sync_frame_req_l, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire drif_ras_picked;
wire [3:0] rrd_cnt_next;
wire [3:0] rrd_cnt;
wire ff_rrd_cnt_scanin;
wire ff_rrd_cnt_scanout;
wire [3:0] rtw_cnt_next;
wire [3:0] rtw_cnt;
wire ff_rtw_cnt_scanin;
wire ff_rtw_cnt_scanout;
wire [3:0] wtr_cnt_next;
wire [3:0] wtr_cnt;
wire ff_wtr_cnt_scanin;
wire ff_wtr_cnt_scanout;
wire rtr_cnt_next;
wire dmmdly_rd_cas_picked;
wire rtr_cnt;
wire ff_rtr_cnt_scanin;
wire ff_rtr_cnt_scanout;
wire [1:0] wtw_cnt_next;
wire dmmdly_wr_cas_picked;
wire dmmdly_wrbc_cas_picked;
wire [1:0] wtw_cnt;
wire ff_wtw_cnt_scanin;
wire ff_wtw_cnt_scanout;
wire drif_activate_cmd;
wire [4:0] faw0_cnt_in;
wire faw0_cnt_is_zero;
wire [4:0] faw0_cnt;
wire ff_faw0_cnt_scanin;
wire ff_faw0_cnt_scanout;
wire [4:0] faw1_cnt_in;
wire faw1_cnt_is_zero;
wire [4:0] faw1_cnt;
wire ff_faw1_cnt_scanin;
wire ff_faw1_cnt_scanout;
wire [4:0] faw2_cnt_in;
wire faw2_cnt_is_zero;
wire [4:0] faw2_cnt;
wire ff_faw2_cnt_scanin;
wire ff_faw2_cnt_scanout;
wire [4:0] faw3_cnt_in;
wire faw3_cnt_is_zero;
wire [4:0] faw3_cnt;
wire ff_faw3_cnt_scanin;
wire ff_faw3_cnt_scanout;
wire ff_cas_picked_scanin;
wire ff_cas_picked_scanout;


output		rrd_cnt_is_zero;
output		rtw_cnt_is_zero;
output		wtr_cnt_is_zero;
output		rtr_cnt_is_zero;
output		wtw_cnt_is_zero;
output		dmmdly_4_activate_stall;

input	[3:0]	rrd_reg;
input	[3:0]	rtw_reg;
input	[3:0]	wtr_reg;
input	[4:0]	faw_reg;

input		drif_rd_ras_picked;
input		drif_wr_ras_picked;
input		drif_wrbc_ras_picked;

input 		fbdic_sync_frame_req_l;

input  		l1clk;
input		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

assign drif_ras_picked = drif_rd_ras_picked | drif_wr_ras_picked;

// ras to ras (bankA to bankB) delay timer.
assign rrd_cnt_next[3:0] = drif_ras_picked & rrd_cnt_is_zero ? rrd_reg[3:0] - 4'h1 : 
				drif_wrbc_ras_picked & rrd_cnt_is_zero ? rrd_reg[3:0] : 
				(rrd_cnt[3:0] == 4'h0) ? 4'h0 : 
				fbdic_sync_frame_req_l ? rrd_cnt[3:0] - 4'h1 : rrd_cnt[3:0];

mcu_dmmdly_ctl_msff_ctl_macro__width_4	ff_rrd_cnt  (
        .scan_in(ff_rrd_cnt_scanin),
        .scan_out(ff_rrd_cnt_scanout),
        .din(rrd_cnt_next[3:0]),
        .dout(rrd_cnt[3:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rrd_cnt_is_zero = (rrd_cnt[3:0] == 4'h0);

// read to write cas to cas (bankA to bankA/bankB) delay timer for not clashing read and write data.
// If read is picked during cas assert rtw_cnt to regular cnt + rtw delay.
assign rtw_cnt_next[3:0] = drif_rd_ras_picked ? rtw_reg[3:0] : 
				(rtw_cnt[3:0] == 4'h0) ? 4'h0 : 
				fbdic_sync_frame_req_l ? rtw_cnt[3:0] - 4'h1 : rtw_cnt[3:0];

mcu_dmmdly_ctl_msff_ctl_macro__width_4      ff_rtw_cnt  (
	.scan_in(ff_rtw_cnt_scanin),
	.scan_out(ff_rtw_cnt_scanout),
	.din(rtw_cnt_next[3:0]),
	.dout(rtw_cnt[3:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rtw_cnt_is_zero = (rtw_cnt[3:0] == 4'h0);

// write to read cas to cas (bankA to bankA/bankB) delay timer for not clashing read and write data.
assign wtr_cnt_next[3:0] = drif_wr_ras_picked ? wtr_reg[3:0] : 
				drif_wrbc_ras_picked ? wtr_reg[3:0] + 4'h1: 
				(wtr_cnt[3:0] == 4'h0) ? 4'h0 : 
				fbdic_sync_frame_req_l ? wtr_cnt[3:0] - 4'h1 : wtr_cnt[3:0];

mcu_dmmdly_ctl_msff_ctl_macro__width_4	ff_wtr_cnt  (
        .scan_in(ff_wtr_cnt_scanin),
        .scan_out(ff_wtr_cnt_scanout),
        .din(wtr_cnt_next[3:0]),
        .dout(wtr_cnt[3:0]),
        .l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign wtr_cnt_is_zero = (wtr_cnt[3:0] == 4'h0);

// read to read cas to cas (bankA to bankA/bankB) delay timer for not clashing read data.
assign rtr_cnt_next = dmmdly_rd_cas_picked & fbdic_sync_frame_req_l ? 1'h1 :
                                (rtr_cnt == 1'h0) ? 1'h0 : rtr_cnt - 1'h1;

mcu_dmmdly_ctl_msff_ctl_macro__width_1  ff_rtr_cnt  (
	.scan_in(ff_rtr_cnt_scanin),
	.scan_out(ff_rtr_cnt_scanout),
	.din(rtr_cnt_next),
	.dout(rtr_cnt),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rtr_cnt_is_zero = (rtr_cnt == 1'h0);

// write to write cas to cas (bankA to bankA/bankB) delay timer for not clashing store data.
assign wtw_cnt_next[1:0] = dmmdly_wr_cas_picked & fbdic_sync_frame_req_l ? 2'h1 :
                                dmmdly_wrbc_cas_picked & fbdic_sync_frame_req_l ? 2'h1 :
                                (wtw_cnt[1:0] == 2'h0) ? 2'h0 : wtw_cnt[1:0] - 2'h1;

mcu_dmmdly_ctl_msff_ctl_macro__width_2  ff_wtw_cnt  (
	.scan_in(ff_wtw_cnt_scanin),
	.scan_out(ff_wtw_cnt_scanout),
	.din(wtw_cnt_next[1:0]),
	.dout(wtw_cnt[1:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign wtw_cnt_is_zero = (wtw_cnt[1:0] == 2'h0);

//////////////////////////////////////////////////////////////////
// Limit number of activates within tFAW to 4
//	Whenever an activate cmd is detected, a counter is started at
//	the tFAW value.  If all four counters are active, then the scheduler
// 	is stalled until one becomes inactive.
//////////////////////////////////////////////////////////////////

assign drif_activate_cmd = drif_rd_ras_picked | drif_wr_ras_picked | drif_wrbc_ras_picked;

assign faw0_cnt_in[4:0] = faw0_cnt_is_zero & drif_activate_cmd & fbdic_sync_frame_req_l ? faw_reg[4:0] - 5'h1 :
			  faw0_cnt_is_zero ? 5'h0 : faw0_cnt[4:0] - 5'h1;

mcu_dmmdly_ctl_msff_ctl_macro__en_0__width_5 ff_faw0_cnt  (
	.scan_in(ff_faw0_cnt_scanin),
	.scan_out(ff_faw0_cnt_scanout),
	.din(faw0_cnt_in[4:0]),
	.dout(faw0_cnt[4:0]),
//	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign faw0_cnt_is_zero = (faw0_cnt[4:0] == 5'h0);

assign faw1_cnt_in[4:0] = faw1_cnt_is_zero & ~faw0_cnt_is_zero & drif_activate_cmd & fbdic_sync_frame_req_l ? faw_reg[4:0] - 5'h1 :
			  faw1_cnt_is_zero ? 5'h0 : faw1_cnt[4:0] - 5'h1;

mcu_dmmdly_ctl_msff_ctl_macro__en_0__width_5 ff_faw1_cnt  (
	.scan_in(ff_faw1_cnt_scanin),
	.scan_out(ff_faw1_cnt_scanout),
	.din(faw1_cnt_in[4:0]),
	.dout(faw1_cnt[4:0]),
//	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign faw1_cnt_is_zero = (faw1_cnt[4:0] == 5'h0);

assign faw2_cnt_in[4:0] = faw2_cnt_is_zero & ~faw1_cnt_is_zero & ~faw0_cnt_is_zero & drif_activate_cmd & fbdic_sync_frame_req_l ? faw_reg[4:0] - 5'h1 :
			  faw2_cnt_is_zero ? 5'h0 : faw2_cnt[4:0] - 5'h1;

mcu_dmmdly_ctl_msff_ctl_macro__en_0__width_5 ff_faw2_cnt  (
	.scan_in(ff_faw2_cnt_scanin),
	.scan_out(ff_faw2_cnt_scanout),
	.din(faw2_cnt_in[4:0]),
	.dout(faw2_cnt[4:0]),
//	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign faw2_cnt_is_zero = (faw2_cnt[4:0] == 5'h0);

assign faw3_cnt_in[4:0] = faw3_cnt_is_zero & ~faw2_cnt_is_zero & ~faw1_cnt_is_zero & ~faw0_cnt_is_zero & drif_activate_cmd & fbdic_sync_frame_req_l ? 
				faw_reg[4:0] - 5'h1 : faw3_cnt_is_zero ? 5'h0 : faw3_cnt[4:0] - 5'h1;

mcu_dmmdly_ctl_msff_ctl_macro__en_0__width_5 ff_faw3_cnt  (
	.scan_in(ff_faw3_cnt_scanin),
	.scan_out(ff_faw3_cnt_scanout),
	.din(faw3_cnt_in[4:0]),
	.dout(faw3_cnt[4:0]),
//	.en(drif_sync_frame_req_l),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign faw3_cnt_is_zero = (faw3_cnt[4:0] == 5'h0);

assign dmmdly_4_activate_stall = ~faw0_cnt_is_zero & ~faw1_cnt_is_zero & ~faw2_cnt_is_zero & ~faw3_cnt_is_zero;

mcu_dmmdly_ctl_msff_ctl_macro__width_3 ff_cas_picked  (
	.scan_in(ff_cas_picked_scanin),
	.scan_out(ff_cas_picked_scanout),
	.din({drif_rd_ras_picked,drif_wr_ras_picked,drif_wrbc_ras_picked}),
	.dout({dmmdly_rd_cas_picked,dmmdly_wr_cas_picked,dmmdly_wrbc_cas_picked}),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// fixscan start:
assign ff_rrd_cnt_scanin         = scan_in                  ;
assign ff_rtw_cnt_scanin         = ff_rrd_cnt_scanout       ;
assign ff_wtr_cnt_scanin         = ff_rtw_cnt_scanout       ;
assign ff_rtr_cnt_scanin         = ff_wtr_cnt_scanout       ;
assign ff_wtw_cnt_scanin         = ff_rtr_cnt_scanout       ;
assign ff_faw0_cnt_scanin        = ff_wtw_cnt_scanout       ;
assign ff_faw1_cnt_scanin        = ff_faw0_cnt_scanout      ;
assign ff_faw2_cnt_scanin        = ff_faw1_cnt_scanout      ;
assign ff_faw3_cnt_scanin        = ff_faw2_cnt_scanout      ;
assign ff_cas_picked_scanin      = ff_faw3_cnt_scanout      ;
assign scan_out                  = ff_cas_picked_scanout    ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_dmmdly_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_dmmdly_ctl_msff_ctl_macro__width_1 (
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

module mcu_dmmdly_ctl_msff_ctl_macro__width_2 (
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

module mcu_dmmdly_ctl_msff_ctl_macro__en_0__width_5 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [4:0] fdin;
wire [3:0] so;

  input [4:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [4:0] dout;
  output scan_out;
assign fdin[4:0] = din[4:0];






dff #(5)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[4:0]),
.si({scan_in,so[3:0]}),
.so({so[3:0],scan_out}),
.q(dout[4:0])
);












endmodule













// any PARAMS parms go into naming of macro

module mcu_dmmdly_ctl_msff_ctl_macro__width_3 (
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








