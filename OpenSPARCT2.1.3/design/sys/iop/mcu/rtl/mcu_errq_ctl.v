// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_errq_ctl.v
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
module mcu_errq_ctl (
  errq_dout, 
  errq_full, 
  errq_empty, 
  errq_enq, 
  errq_deq, 
  errq_din, 
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
wire [14:0] ent0;
wire ent1_en;
wire ff_ent1_scanin;
wire ff_ent1_scanout;
wire [14:0] ent1;
wire ent2_en;
wire ff_ent2_scanin;
wire ff_ent2_scanout;
wire [14:0] ent2;
wire ent3_en;
wire ff_ent3_scanin;
wire ff_ent3_scanout;
wire [14:0] ent3;
wire ent4_en;
wire ff_ent4_scanin;
wire ff_ent4_scanout;
wire [14:0] ent4;
wire ent5_en;
wire ff_ent5_scanin;
wire ff_ent5_scanout;
wire [14:0] ent5;
wire ent6_en;
wire ff_ent6_scanin;
wire ff_ent6_scanout;
wire [14:0] ent6;
wire ent7_en;
wire ff_ent7_scanin;
wire ff_ent7_scanout;
wire [14:0] ent7;
wire ent8_en;
wire ff_ent8_scanin;
wire ff_ent8_scanout;
wire [14:0] ent8;
wire ent9_en;
wire ff_ent9_scanin;
wire ff_ent9_scanout;
wire [14:0] ent9;
wire ent10_en;
wire ff_ent10_scanin;
wire ff_ent10_scanout;
wire [14:0] ent10;
wire ent11_en;
wire ff_ent11_scanin;
wire ff_ent11_scanout;
wire [14:0] ent11;
wire ent12_en;
wire ff_ent12_scanin;
wire ff_ent12_scanout;
wire [14:0] ent12;
wire ent13_en;
wire ff_ent13_scanin;
wire ff_ent13_scanout;
wire [14:0] ent13;
wire ent14_en;
wire ff_ent14_scanin;
wire ff_ent14_scanout;
wire [14:0] ent14;
wire ent15_en;
wire ff_ent15_scanin;
wire ff_ent15_scanout;
wire [14:0] ent15;
wire ent16_en;
wire ff_ent16_scanin;
wire ff_ent16_scanout;
wire [14:0] ent16;


output	[14:0]	errq_dout;
output		errq_full;
output		errq_empty;

input		errq_enq;
input		errq_deq;
input	[14:0]	errq_din;

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

// 0in fifo -enq errq_enq -deq errq_deq -depth 17 -enq_data errq_din[14:0] -deq_data errq_dout[14:0]
// 0in custom -fire (wptr[4:0] > 5'h10)
// 0in custom -fire (rptr[4:0] > 5'h10)

assign wptr_in[5:0] = (wptr[4:0] == 5'h10) ? {~wptr[5], 5'h0} : {wptr[5], wptr[4:0] + 5'h1};
mcu_errq_ctl_msff_ctl_macro__en_1__width_6 ff_wptr  (
	.scan_in(ff_wptr_scanin),
	.scan_out(ff_wptr_scanout),
	.din(wptr_in[5:0]),
	.dout(wptr[5:0]),
	.en(errq_enq),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rptr_in[5:0] = (rptr[4:0] == 5'h10) ? {~rptr[5], 5'h0} : {rptr[5], rptr[4:0] + 5'h1};
mcu_errq_ctl_msff_ctl_macro__en_1__width_6 ff_rptr  (
	.scan_in(ff_rptr_scanin),
	.scan_out(ff_rptr_scanout),
	.din(rptr_in[5:0]),
	.dout(rptr[5:0]),
	.en(errq_deq),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign errq_full = rptr[5:0] == {~wptr[5],wptr[4:0]};
assign errq_empty = rptr[5:0] == wptr[5:0];

assign ent0_en = (wptr[4:0] == 5'd0) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent0  (
	.scan_in(ff_ent0_scanin),
	.scan_out(ff_ent0_scanout),
	.din(errq_din[14:0]),
	.dout(ent0[14:0]),
	.en(ent0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent1_en = (wptr[4:0] == 5'd1) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent1  (
	.scan_in(ff_ent1_scanin),
	.scan_out(ff_ent1_scanout),
	.din(errq_din[14:0]),
	.dout(ent1[14:0]),
	.en(ent1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent2_en = (wptr[4:0] == 5'd2) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent2  (
	.scan_in(ff_ent2_scanin),
	.scan_out(ff_ent2_scanout),
	.din(errq_din[14:0]),
	.dout(ent2[14:0]),
	.en(ent2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent3_en = (wptr[4:0] == 5'd3) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent3  (
	.scan_in(ff_ent3_scanin),
	.scan_out(ff_ent3_scanout),
	.din(errq_din[14:0]),
	.dout(ent3[14:0]),
	.en(ent3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent4_en = (wptr[4:0] == 5'd4) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent4  (
	.scan_in(ff_ent4_scanin),
	.scan_out(ff_ent4_scanout),
	.din(errq_din[14:0]),
	.dout(ent4[14:0]),
	.en(ent4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent5_en = (wptr[4:0] == 5'd5) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent5  (
	.scan_in(ff_ent5_scanin),
	.scan_out(ff_ent5_scanout),
	.din(errq_din[14:0]),
	.dout(ent5[14:0]),
	.en(ent5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent6_en = (wptr[4:0] == 5'd6) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent6  (
	.scan_in(ff_ent6_scanin),
	.scan_out(ff_ent6_scanout),
	.din(errq_din[14:0]),
	.dout(ent6[14:0]),
	.en(ent6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent7_en = (wptr[4:0] == 5'd7) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent7  (
	.scan_in(ff_ent7_scanin),
	.scan_out(ff_ent7_scanout),
	.din(errq_din[14:0]),
	.dout(ent7[14:0]),
	.en(ent7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent8_en = (wptr[4:0] == 5'd8) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent8  (
	.scan_in(ff_ent8_scanin),
	.scan_out(ff_ent8_scanout),
	.din(errq_din[14:0]),
	.dout(ent8[14:0]),
	.en(ent8_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent9_en = (wptr[4:0] == 5'd9) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent9  (
	.scan_in(ff_ent9_scanin),
	.scan_out(ff_ent9_scanout),
	.din(errq_din[14:0]),
	.dout(ent9[14:0]),
	.en(ent9_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent10_en = (wptr[4:0] == 5'd10) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent10  (
	.scan_in(ff_ent10_scanin),
	.scan_out(ff_ent10_scanout),
	.din(errq_din[14:0]),
	.dout(ent10[14:0]),
	.en(ent10_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent11_en = (wptr[4:0] == 5'd11) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent11  (
	.scan_in(ff_ent11_scanin),
	.scan_out(ff_ent11_scanout),
	.din(errq_din[14:0]),
	.dout(ent11[14:0]),
	.en(ent11_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent12_en = (wptr[4:0] == 5'd12) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent12  (
	.scan_in(ff_ent12_scanin),
	.scan_out(ff_ent12_scanout),
	.din(errq_din[14:0]),
	.dout(ent12[14:0]),
	.en(ent12_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent13_en = (wptr[4:0] == 5'd13) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent13  (
	.scan_in(ff_ent13_scanin),
	.scan_out(ff_ent13_scanout),
	.din(errq_din[14:0]),
	.dout(ent13[14:0]),
	.en(ent13_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent14_en = (wptr[4:0] == 5'd14) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent14  (
	.scan_in(ff_ent14_scanin),
	.scan_out(ff_ent14_scanout),
	.din(errq_din[14:0]),
	.dout(ent14[14:0]),
	.en(ent14_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent15_en = (wptr[4:0] == 5'd15) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent15  (
	.scan_in(ff_ent15_scanin),
	.scan_out(ff_ent15_scanout),
	.din(errq_din[14:0]),
	.dout(ent15[14:0]),
	.en(ent15_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign ent16_en = (wptr[4:0] == 5'd16) & errq_enq;
mcu_errq_ctl_msff_ctl_macro__en_1__width_15 ff_ent16  (
	.scan_in(ff_ent16_scanin),
	.scan_out(ff_ent16_scanout),
	.din(errq_din[14:0]),
	.dout(ent16[14:0]),
	.en(ent16_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// FIFO output selection
assign errq_dout[14:0] = 
	{15{rptr[4:0] == 5'd0}} & ent0[14:0] |
	{15{rptr[4:0] == 5'd1}} & ent1[14:0] |
	{15{rptr[4:0] == 5'd2}} & ent2[14:0] |
	{15{rptr[4:0] == 5'd3}} & ent3[14:0] |
	{15{rptr[4:0] == 5'd4}} & ent4[14:0] |
	{15{rptr[4:0] == 5'd5}} & ent5[14:0] |
	{15{rptr[4:0] == 5'd6}} & ent6[14:0] |
	{15{rptr[4:0] == 5'd7}} & ent7[14:0] |
	{15{rptr[4:0] == 5'd8}} & ent8[14:0] |
	{15{rptr[4:0] == 5'd9}} & ent9[14:0] |
	{15{rptr[4:0] == 5'd10}} & ent10[14:0] |
	{15{rptr[4:0] == 5'd11}} & ent11[14:0] |
	{15{rptr[4:0] == 5'd12}} & ent12[14:0] |
	{15{rptr[4:0] == 5'd13}} & ent13[14:0] |
	{15{rptr[4:0] == 5'd14}} & ent14[14:0] |
	{15{rptr[4:0] == 5'd15}} & ent15[14:0] |
	{15{rptr[4:0] == 5'd16}} & ent16[14:0];

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
assign scan_out                  = ff_ent16_scanout         ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_errq_ctl_msff_ctl_macro__en_1__width_6 (
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

module mcu_errq_ctl_msff_ctl_macro__en_1__width_15 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [14:0] fdin;
wire [13:0] so;

  input [14:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [14:0] dout;
  output scan_out;
assign fdin[14:0] = (din[14:0] & {15{en}}) | (dout[14:0] & ~{15{en}});






dff #(15)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[14:0]),
.si({scan_in,so[13:0]}),
.so({so[13:0],scan_out}),
.q(dout[14:0])
);












endmodule








