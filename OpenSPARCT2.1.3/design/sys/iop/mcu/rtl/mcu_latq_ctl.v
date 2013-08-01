// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_latq_ctl.v
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
module mcu_latq_ctl (
  latq_dout, 
  latq_full, 
  latq_empty, 
  latq_enq, 
  latq_deq, 
  latq_din, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire [5:0] wptr_in;
wire [5:0] wptr;
wire ff_wptr_scanin;
wire ff_wptr_scanout;
wire [5:0] rptr_in;
wire [5:0] rptr;
wire ff_rptr_scanin;
wire ff_rptr_scanout;
wire ent0_en;
wire ff_ent0_scanin;
wire ff_ent0_scanout;
wire [11:0] ent0;
wire ent1_en;
wire ff_ent1_scanin;
wire ff_ent1_scanout;
wire [11:0] ent1;
wire ent2_en;
wire ff_ent2_scanin;
wire ff_ent2_scanout;
wire [11:0] ent2;
wire ent3_en;
wire ff_ent3_scanin;
wire ff_ent3_scanout;
wire [11:0] ent3;
wire ent4_en;
wire ff_ent4_scanin;
wire ff_ent4_scanout;
wire [11:0] ent4;
wire ent5_en;
wire ff_ent5_scanin;
wire ff_ent5_scanout;
wire [11:0] ent5;
wire ent6_en;
wire ff_ent6_scanin;
wire ff_ent6_scanout;
wire [11:0] ent6;
wire ent7_en;
wire ff_ent7_scanin;
wire ff_ent7_scanout;
wire [11:0] ent7;
wire ent8_en;
wire ff_ent8_scanin;
wire ff_ent8_scanout;
wire [11:0] ent8;
wire ent9_en;
wire ff_ent9_scanin;
wire ff_ent9_scanout;
wire [11:0] ent9;
wire ent10_en;
wire ff_ent10_scanin;
wire ff_ent10_scanout;
wire [11:0] ent10;
wire ent11_en;
wire ff_ent11_scanin;
wire ff_ent11_scanout;
wire [11:0] ent11;
wire ent12_en;
wire ff_ent12_scanin;
wire ff_ent12_scanout;
wire [11:0] ent12;
wire ent13_en;
wire ff_ent13_scanin;
wire ff_ent13_scanout;
wire [11:0] ent13;
wire ent14_en;
wire ff_ent14_scanin;
wire ff_ent14_scanout;
wire [11:0] ent14;
wire ent15_en;
wire ff_ent15_scanin;
wire ff_ent15_scanout;
wire [11:0] ent15;
wire ent16_en;
wire ff_ent16_scanin;
wire ff_ent16_scanout;
wire [11:0] ent16;
wire ent17_en;
wire ff_ent17_scanin;
wire ff_ent17_scanout;
wire [11:0] ent17;
wire ent18_en;
wire ff_ent18_scanin;
wire ff_ent18_scanout;
wire [11:0] ent18;
wire ent19_en;
wire ff_ent19_scanin;
wire ff_ent19_scanout;
wire [11:0] ent19;
wire ent20_en;
wire ff_ent20_scanin;
wire ff_ent20_scanout;
wire [11:0] ent20;
wire ent21_en;
wire ff_ent21_scanin;
wire ff_ent21_scanout;
wire [11:0] ent21;
wire ent22_en;
wire ff_ent22_scanin;
wire ff_ent22_scanout;
wire [11:0] ent22;
wire ent23_en;
wire ff_ent23_scanin;
wire ff_ent23_scanout;
wire [11:0] ent23;
wire ent24_en;
wire ff_ent24_scanin;
wire ff_ent24_scanout;
wire [11:0] ent24;
wire ent25_en;
wire ff_ent25_scanin;
wire ff_ent25_scanout;
wire [11:0] ent25;
wire ent26_en;
wire ff_ent26_scanin;
wire ff_ent26_scanout;
wire [11:0] ent26;
wire ent27_en;
wire ff_ent27_scanin;
wire ff_ent27_scanout;
wire [11:0] ent27;
wire ent28_en;
wire ff_ent28_scanin;
wire ff_ent28_scanout;
wire [11:0] ent28;
wire ent29_en;
wire ff_ent29_scanin;
wire ff_ent29_scanout;
wire [11:0] ent29;
wire ent30_en;
wire ff_ent30_scanin;
wire ff_ent30_scanout;
wire [11:0] ent30;
wire ent31_en;
wire ff_ent31_scanin;
wire ff_ent31_scanout;
wire [11:0] ent31;


output	[11:0]	latq_dout;
output		latq_full;
output		latq_empty;

input		latq_enq;
input		latq_deq;
input	[11:0]	latq_din;

input		l1clk;
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;

// Code
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

// 0in fifo -enq latq_enq -deq latq_deq -depth 32 -enq_data latq_din[11:0] -deq_data latq_dout[11:0]

assign wptr_in[5:0] = wptr[5:0] + 6'h1;
mcu_latq_ctl_msff_ctl_macro__en_1__width_6 ff_wptr  (
	.scan_in(ff_wptr_scanin),
	.scan_out(ff_wptr_scanout),
	.din(wptr_in[5:0]),
	.dout(wptr[5:0]),
	.en(latq_enq),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rptr_in[5:0] = rptr[5:0] + 6'h1;
mcu_latq_ctl_msff_ctl_macro__en_1__width_6 ff_rptr  (
	.scan_in(ff_rptr_scanin),
	.scan_out(ff_rptr_scanout),
	.din(rptr_in[5:0]),
	.dout(rptr[5:0]),
	.en(latq_deq),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign latq_full = rptr[5:0] == {~wptr[5],wptr[4:0]};
assign latq_empty = rptr[5:0] == wptr[5:0];

assign ent0_en = (wptr[4:0] == 5'd0) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent0  (
	.scan_in(ff_ent0_scanin),
	.scan_out(ff_ent0_scanout),
	.din(latq_din[11:0]),
	.dout(ent0[11:0]),
	.en(ent0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent1_en = (wptr[4:0] == 5'd1) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent1  (
	.scan_in(ff_ent1_scanin),
	.scan_out(ff_ent1_scanout),
	.din(latq_din[11:0]),
	.dout(ent1[11:0]),
	.en(ent1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent2_en = (wptr[4:0] == 5'd2) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent2  (
	.scan_in(ff_ent2_scanin),
	.scan_out(ff_ent2_scanout),
	.din(latq_din[11:0]),
	.dout(ent2[11:0]),
	.en(ent2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent3_en = (wptr[4:0] == 5'd3) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent3  (
	.scan_in(ff_ent3_scanin),
	.scan_out(ff_ent3_scanout),
	.din(latq_din[11:0]),
	.dout(ent3[11:0]),
	.en(ent3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent4_en = (wptr[4:0] == 5'd4) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent4  (
	.scan_in(ff_ent4_scanin),
	.scan_out(ff_ent4_scanout),
	.din(latq_din[11:0]),
	.dout(ent4[11:0]),
	.en(ent4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent5_en = (wptr[4:0] == 5'd5) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent5  (
	.scan_in(ff_ent5_scanin),
	.scan_out(ff_ent5_scanout),
	.din(latq_din[11:0]),
	.dout(ent5[11:0]),
	.en(ent5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent6_en = (wptr[4:0] == 5'd6) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent6  (
	.scan_in(ff_ent6_scanin),
	.scan_out(ff_ent6_scanout),
	.din(latq_din[11:0]),
	.dout(ent6[11:0]),
	.en(ent6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent7_en = (wptr[4:0] == 5'd7) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent7  (
	.scan_in(ff_ent7_scanin),
	.scan_out(ff_ent7_scanout),
	.din(latq_din[11:0]),
	.dout(ent7[11:0]),
	.en(ent7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent8_en = (wptr[4:0] == 5'd8) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent8  (
	.scan_in(ff_ent8_scanin),
	.scan_out(ff_ent8_scanout),
	.din(latq_din[11:0]),
	.dout(ent8[11:0]),
	.en(ent8_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent9_en = (wptr[4:0] == 5'd9) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent9  (
	.scan_in(ff_ent9_scanin),
	.scan_out(ff_ent9_scanout),
	.din(latq_din[11:0]),
	.dout(ent9[11:0]),
	.en(ent9_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent10_en = (wptr[4:0] == 5'd10) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent10  (
	.scan_in(ff_ent10_scanin),
	.scan_out(ff_ent10_scanout),
	.din(latq_din[11:0]),
	.dout(ent10[11:0]),
	.en(ent10_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent11_en = (wptr[4:0] == 5'd11) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent11  (
	.scan_in(ff_ent11_scanin),
	.scan_out(ff_ent11_scanout),
	.din(latq_din[11:0]),
	.dout(ent11[11:0]),
	.en(ent11_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent12_en = (wptr[4:0] == 5'd12) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent12  (
	.scan_in(ff_ent12_scanin),
	.scan_out(ff_ent12_scanout),
	.din(latq_din[11:0]),
	.dout(ent12[11:0]),
	.en(ent12_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent13_en = (wptr[4:0] == 5'd13) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent13  (
	.scan_in(ff_ent13_scanin),
	.scan_out(ff_ent13_scanout),
	.din(latq_din[11:0]),
	.dout(ent13[11:0]),
	.en(ent13_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent14_en = (wptr[4:0] == 5'd14) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent14  (
	.scan_in(ff_ent14_scanin),
	.scan_out(ff_ent14_scanout),
	.din(latq_din[11:0]),
	.dout(ent14[11:0]),
	.en(ent14_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent15_en = (wptr[4:0] == 5'd15) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent15  (
	.scan_in(ff_ent15_scanin),
	.scan_out(ff_ent15_scanout),
	.din(latq_din[11:0]),
	.dout(ent15[11:0]),
	.en(ent15_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent16_en = (wptr[4:0] == 5'd16) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent16  (
	.scan_in(ff_ent16_scanin),
	.scan_out(ff_ent16_scanout),
	.din(latq_din[11:0]),
	.dout(ent16[11:0]),
	.en(ent16_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent17_en = (wptr[4:0] == 5'd17) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent17  (
	.scan_in(ff_ent17_scanin),
	.scan_out(ff_ent17_scanout),
	.din(latq_din[11:0]),
	.dout(ent17[11:0]),
	.en(ent17_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent18_en = (wptr[4:0] == 5'd18) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent18  (
	.scan_in(ff_ent18_scanin),
	.scan_out(ff_ent18_scanout),
	.din(latq_din[11:0]),
	.dout(ent18[11:0]),
	.en(ent18_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent19_en = (wptr[4:0] == 5'd19) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent19  (
	.scan_in(ff_ent19_scanin),
	.scan_out(ff_ent19_scanout),
	.din(latq_din[11:0]),
	.dout(ent19[11:0]),
	.en(ent19_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent20_en = (wptr[4:0] == 5'd20) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent20  (
	.scan_in(ff_ent20_scanin),
	.scan_out(ff_ent20_scanout),
	.din(latq_din[11:0]),
	.dout(ent20[11:0]),
	.en(ent20_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent21_en = (wptr[4:0] == 5'd21) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent21  (
	.scan_in(ff_ent21_scanin),
	.scan_out(ff_ent21_scanout),
	.din(latq_din[11:0]),
	.dout(ent21[11:0]),
	.en(ent21_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent22_en = (wptr[4:0] == 5'd22) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent22  (
	.scan_in(ff_ent22_scanin),
	.scan_out(ff_ent22_scanout),
	.din(latq_din[11:0]),
	.dout(ent22[11:0]),
	.en(ent22_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent23_en = (wptr[4:0] == 5'd23) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent23  (
	.scan_in(ff_ent23_scanin),
	.scan_out(ff_ent23_scanout),
	.din(latq_din[11:0]),
	.dout(ent23[11:0]),
	.en(ent23_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent24_en = (wptr[4:0] == 5'd24) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent24  (
	.scan_in(ff_ent24_scanin),
	.scan_out(ff_ent24_scanout),
	.din(latq_din[11:0]),
	.dout(ent24[11:0]),
	.en(ent24_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent25_en = (wptr[4:0] == 5'd25) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent25  (
	.scan_in(ff_ent25_scanin),
	.scan_out(ff_ent25_scanout),
	.din(latq_din[11:0]),
	.dout(ent25[11:0]),
	.en(ent25_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent26_en = (wptr[4:0] == 5'd26) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent26  (
	.scan_in(ff_ent26_scanin),
	.scan_out(ff_ent26_scanout),
	.din(latq_din[11:0]),
	.dout(ent26[11:0]),
	.en(ent26_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent27_en = (wptr[4:0] == 5'd27) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent27  (
	.scan_in(ff_ent27_scanin),
	.scan_out(ff_ent27_scanout),
	.din(latq_din[11:0]),
	.dout(ent27[11:0]),
	.en(ent27_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent28_en = (wptr[4:0] == 5'd28) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent28  (
	.scan_in(ff_ent28_scanin),
	.scan_out(ff_ent28_scanout),
	.din(latq_din[11:0]),
	.dout(ent28[11:0]),
	.en(ent28_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent29_en = (wptr[4:0] == 5'd29) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent29  (
	.scan_in(ff_ent29_scanin),
	.scan_out(ff_ent29_scanout),
	.din(latq_din[11:0]),
	.dout(ent29[11:0]),
	.en(ent29_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent30_en = (wptr[4:0] == 5'd30) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent30  (
	.scan_in(ff_ent30_scanin),
	.scan_out(ff_ent30_scanout),
	.din(latq_din[11:0]),
	.dout(ent30[11:0]),
	.en(ent30_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent31_en = (wptr[4:0] == 5'd31) & latq_enq;
mcu_latq_ctl_msff_ctl_macro__en_1__width_12 ff_ent31  (
	.scan_in(ff_ent31_scanin),
	.scan_out(ff_ent31_scanout),
	.din(latq_din[11:0]),
	.dout(ent31[11:0]),
	.en(ent31_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// FIFO output selection
assign latq_dout[11:0] = 
	{12{rptr[4:0] == 5'd0}} & ent0[11:0] |
	{12{rptr[4:0] == 5'd1}} & ent1[11:0] |
	{12{rptr[4:0] == 5'd2}} & ent2[11:0] |
	{12{rptr[4:0] == 5'd3}} & ent3[11:0] |
	{12{rptr[4:0] == 5'd4}} & ent4[11:0] |
	{12{rptr[4:0] == 5'd5}} & ent5[11:0] |
	{12{rptr[4:0] == 5'd6}} & ent6[11:0] |
	{12{rptr[4:0] == 5'd7}} & ent7[11:0] |
	{12{rptr[4:0] == 5'd8}} & ent8[11:0] |
	{12{rptr[4:0] == 5'd9}} & ent9[11:0] |
	{12{rptr[4:0] == 5'd10}} & ent10[11:0] |
	{12{rptr[4:0] == 5'd11}} & ent11[11:0] |
	{12{rptr[4:0] == 5'd12}} & ent12[11:0] |
	{12{rptr[4:0] == 5'd13}} & ent13[11:0] |
	{12{rptr[4:0] == 5'd14}} & ent14[11:0] |
	{12{rptr[4:0] == 5'd15}} & ent15[11:0] |
	{12{rptr[4:0] == 5'd16}} & ent16[11:0] |
	{12{rptr[4:0] == 5'd17}} & ent17[11:0] |
	{12{rptr[4:0] == 5'd18}} & ent18[11:0] |
	{12{rptr[4:0] == 5'd19}} & ent19[11:0] |
	{12{rptr[4:0] == 5'd20}} & ent20[11:0] |
	{12{rptr[4:0] == 5'd21}} & ent21[11:0] |
	{12{rptr[4:0] == 5'd22}} & ent22[11:0] |
	{12{rptr[4:0] == 5'd23}} & ent23[11:0] |
	{12{rptr[4:0] == 5'd24}} & ent24[11:0] |
	{12{rptr[4:0] == 5'd25}} & ent25[11:0] |
	{12{rptr[4:0] == 5'd26}} & ent26[11:0] |
	{12{rptr[4:0] == 5'd27}} & ent27[11:0] |
	{12{rptr[4:0] == 5'd28}} & ent28[11:0] |
	{12{rptr[4:0] == 5'd29}} & ent29[11:0] |
	{12{rptr[4:0] == 5'd30}} & ent30[11:0] |
	{12{rptr[4:0] == 5'd31}} & ent31[11:0];


// fixscan start:
assign ff_wptr_scanin            = scan_in                  ;
assign ff_rptr_scanin            = ff_wptr_scanout          ;
assign ff_ent0_scanin            = ff_rptr_scanout          ;
assign ff_ent1_scanin            = ff_ent0_scanout          ;
assign ff_ent2_scanin            = ff_ent1_scanout          ;
assign ff_ent3_scanin            = ff_ent2_scanout          ;
assign ff_ent4_scanin            = ff_ent3_scanout          ;
assign ff_ent5_scanin            = ff_ent4_scanout          ;
assign ff_ent6_scanin            = ff_ent5_scanout          ;
assign ff_ent7_scanin            = ff_ent6_scanout          ;
assign ff_ent8_scanin            = ff_ent7_scanout          ;
assign ff_ent9_scanin            = ff_ent8_scanout          ;
assign ff_ent10_scanin           = ff_ent9_scanout          ;
assign ff_ent11_scanin           = ff_ent10_scanout         ;
assign ff_ent12_scanin           = ff_ent11_scanout         ;
assign ff_ent13_scanin           = ff_ent12_scanout         ;
assign ff_ent14_scanin           = ff_ent13_scanout         ;
assign ff_ent15_scanin           = ff_ent14_scanout         ;
assign ff_ent16_scanin           = ff_ent15_scanout         ;
assign ff_ent17_scanin           = ff_ent16_scanout         ;
assign ff_ent18_scanin           = ff_ent17_scanout         ;
assign ff_ent19_scanin           = ff_ent18_scanout         ;
assign ff_ent20_scanin           = ff_ent19_scanout         ;
assign ff_ent21_scanin           = ff_ent20_scanout         ;
assign ff_ent22_scanin           = ff_ent21_scanout         ;
assign ff_ent23_scanin           = ff_ent22_scanout         ;
assign ff_ent24_scanin           = ff_ent23_scanout         ;
assign ff_ent25_scanin           = ff_ent24_scanout         ;
assign ff_ent26_scanin           = ff_ent25_scanout         ;
assign ff_ent27_scanin           = ff_ent26_scanout         ;
assign ff_ent28_scanin           = ff_ent27_scanout         ;
assign ff_ent29_scanin           = ff_ent28_scanout         ;
assign ff_ent30_scanin           = ff_ent29_scanout         ;
assign ff_ent31_scanin           = ff_ent30_scanout         ;
assign scan_out                  = ff_ent31_scanout         ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_latq_ctl_msff_ctl_macro__en_1__width_6 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [5:0] fdin;
wire [4:0] so;

  input [5:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [5:0] dout;
  output scan_out;
assign fdin[5:0] = (din[5:0] & {6{en}}) | (dout[5:0] & ~{6{en}});






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

module mcu_latq_ctl_msff_ctl_macro__en_1__width_12 (
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








