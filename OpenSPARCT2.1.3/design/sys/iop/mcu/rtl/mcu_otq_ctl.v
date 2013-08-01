// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_otq_ctl.v
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
`define WIDTH 20
`define WIDTH_M1 19
`define WIDTH_P1 21
module mcu_otq_ctl (
  otq_dout, 
  next_otq_dout_9, 
  otq_full, 
  otq_empty, 
  otq_enq, 
  otq_deq, 
  otq_din, 
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en);
wire siclk;
wire soclk;
wire se;
wire [4:0] wptr_in;
wire [4:0] wptr;
wire ff_wptr_scanin;
wire ff_wptr_scanout;
wire [4:0] rptr_in;
wire [4:0] rptr;
wire ff_rptr_scanin;
wire ff_rptr_scanout;
wire ent0_en;
wire ent1_en;
wire ent2_en;
wire ent3_en;
wire ent4_en;
wire ent5_en;
wire ent6_en;
wire ent7_en;
wire ent8_en;
wire ent9_en;
wire ent10_en;
wire ent11_en;
wire ent12_en;
wire ent13_en;
wire ent14_en;
wire ent15_en;
wire ff_ent0_scanin;
wire ff_ent0_scanout;
wire [19:0] ent0;
wire ff_ent1_scanin;
wire ff_ent1_scanout;
wire [19:0] ent1;
wire ff_ent2_scanin;
wire ff_ent2_scanout;
wire [19:0] ent2;
wire ff_ent3_scanin;
wire ff_ent3_scanout;
wire [19:0] ent3;
wire ff_ent4_scanin;
wire ff_ent4_scanout;
wire [19:0] ent4;
wire ff_ent5_scanin;
wire ff_ent5_scanout;
wire [19:0] ent5;
wire ff_ent6_scanin;
wire ff_ent6_scanout;
wire [19:0] ent6;
wire ff_ent7_scanin;
wire ff_ent7_scanout;
wire [19:0] ent7;
wire ff_ent8_scanin;
wire ff_ent8_scanout;
wire [19:0] ent8;
wire ff_ent9_scanin;
wire ff_ent9_scanout;
wire [19:0] ent9;
wire ff_ent10_scanin;
wire ff_ent10_scanout;
wire [19:0] ent10;
wire ff_ent11_scanin;
wire ff_ent11_scanout;
wire [19:0] ent11;
wire ff_ent12_scanin;
wire ff_ent12_scanout;
wire [19:0] ent12;
wire ff_ent13_scanin;
wire ff_ent13_scanout;
wire [19:0] ent13;
wire ff_ent14_scanin;
wire ff_ent14_scanout;
wire [19:0] ent14;
wire ff_ent15_scanin;
wire ff_ent15_scanout;
wire [19:0] ent15;


output	[`WIDTH_M1:0]	otq_dout;
output		next_otq_dout_9;	// address parity for 2nd entry
output		otq_full;
output		otq_empty;

input		otq_enq;
input		otq_deq;
input	[`WIDTH_M1:0]	otq_din;

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

// 0in fifo -enq otq_enq -deq otq_deq -depth 16 -enq_data otq_din[19:0] -deq_data otq_dout[19:0]

assign wptr_in[4:0] = wptr[4:0] + {4'h0, otq_enq};

mcu_otq_ctl_msff_ctl_macro__width_5 ff_wptr  (
	.scan_in(ff_wptr_scanin),
	.scan_out(ff_wptr_scanout),
	.din(wptr_in[4:0]),
	.dout(wptr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign rptr_in[4:0] = rptr[4:0] + {4'h0, otq_deq};
mcu_otq_ctl_msff_ctl_macro__width_5 ff_rptr  (
	.scan_in(ff_rptr_scanin),
	.scan_out(ff_rptr_scanout),
	.din(rptr_in[4:0]),
	.dout(rptr[4:0]),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

assign otq_full = rptr[4:0] == {~wptr[4],wptr[3:0]};
assign otq_empty = rptr[4:0] == wptr[4:0];

assign ent0_en = (wptr[3:0] == 4'd0) & otq_enq;
assign ent1_en = (wptr[3:0] == 4'd1) & otq_enq;
assign ent2_en = (wptr[3:0] == 4'd2) & otq_enq;
assign ent3_en = (wptr[3:0] == 4'd3) & otq_enq;
assign ent4_en = (wptr[3:0] == 4'd4) & otq_enq;
assign ent5_en = (wptr[3:0] == 4'd5) & otq_enq;
assign ent6_en = (wptr[3:0] == 4'd6) & otq_enq;
assign ent7_en = (wptr[3:0] == 4'd7) & otq_enq;
assign ent8_en = (wptr[3:0] == 4'd8) & otq_enq;
assign ent9_en = (wptr[3:0] == 4'd9) & otq_enq;
assign ent10_en = (wptr[3:0] == 4'd10) & otq_enq;
assign ent11_en = (wptr[3:0] == 4'd11) & otq_enq;
assign ent12_en = (wptr[3:0] == 4'd12) & otq_enq;
assign ent13_en = (wptr[3:0] == 4'd13) & otq_enq;
assign ent14_en = (wptr[3:0] == 4'd14) & otq_enq;
assign ent15_en = (wptr[3:0] == 4'd15) & otq_enq;

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent0  (
	.scan_in(ff_ent0_scanin),
	.scan_out(ff_ent0_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent0[`WIDTH_M1:0]),
	.en(ent0_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent1  (
	.scan_in(ff_ent1_scanin),
	.scan_out(ff_ent1_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent1[`WIDTH_M1:0]),
	.en(ent1_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent2  (
	.scan_in(ff_ent2_scanin),
	.scan_out(ff_ent2_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent2[`WIDTH_M1:0]),
	.en(ent2_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent3  (
	.scan_in(ff_ent3_scanin),
	.scan_out(ff_ent3_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent3[`WIDTH_M1:0]),
	.en(ent3_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent4  (
	.scan_in(ff_ent4_scanin),
	.scan_out(ff_ent4_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent4[`WIDTH_M1:0]),
	.en(ent4_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent5  (
	.scan_in(ff_ent5_scanin),
	.scan_out(ff_ent5_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent5[`WIDTH_M1:0]),
	.en(ent5_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent6  (
	.scan_in(ff_ent6_scanin),
	.scan_out(ff_ent6_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent6[`WIDTH_M1:0]),
	.en(ent6_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent7  (
	.scan_in(ff_ent7_scanin),
	.scan_out(ff_ent7_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent7[`WIDTH_M1:0]),
	.en(ent7_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent8  (
	.scan_in(ff_ent8_scanin),
	.scan_out(ff_ent8_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent8[`WIDTH_M1:0]),
	.en(ent8_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent9  (
	.scan_in(ff_ent9_scanin),
	.scan_out(ff_ent9_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent9[`WIDTH_M1:0]),
	.en(ent9_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent10  (
	.scan_in(ff_ent10_scanin),
	.scan_out(ff_ent10_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent10[`WIDTH_M1:0]),
	.en(ent10_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent11  (
	.scan_in(ff_ent11_scanin),
	.scan_out(ff_ent11_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent11[`WIDTH_M1:0]),
	.en(ent11_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent12  (
	.scan_in(ff_ent12_scanin),
	.scan_out(ff_ent12_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent12[`WIDTH_M1:0]),
	.en(ent12_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent13  (
	.scan_in(ff_ent13_scanin),
	.scan_out(ff_ent13_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent13[`WIDTH_M1:0]),
	.en(ent13_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent14  (
	.scan_in(ff_ent14_scanin),
	.scan_out(ff_ent14_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent14[`WIDTH_M1:0]),
	.en(ent14_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

mcu_otq_ctl_msff_ctl_macro__en_1__width_20 ff_ent15  (
	.scan_in(ff_ent15_scanin),
	.scan_out(ff_ent15_scanout),
	.din(otq_din[`WIDTH_M1:0]),
	.dout(ent15[`WIDTH_M1:0]),
	.en(ent15_en),
	.l1clk(l1clk),
  .siclk(siclk),
  .soclk(soclk));

// FIFO output selection
assign {otq_dout[`WIDTH_M1:0], next_otq_dout_9} = 
	{`WIDTH_P1{rptr[3:0] == 4'd0}} & {ent0[`WIDTH_M1:0], ent1[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd1}} & {ent1[`WIDTH_M1:0], ent2[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd2}} & {ent2[`WIDTH_M1:0], ent3[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd3}} & {ent3[`WIDTH_M1:0], ent4[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd4}} & {ent4[`WIDTH_M1:0], ent5[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd5}} & {ent5[`WIDTH_M1:0], ent6[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd6}} & {ent6[`WIDTH_M1:0], ent7[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd7}} & {ent7[`WIDTH_M1:0], ent8[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd8}} & {ent8[`WIDTH_M1:0], ent9[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd9}} & {ent9[`WIDTH_M1:0], ent10[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd10}} & {ent10[`WIDTH_M1:0], ent11[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd11}} & {ent11[`WIDTH_M1:0], ent12[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd12}} & {ent12[`WIDTH_M1:0], ent13[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd13}} & {ent13[`WIDTH_M1:0], ent14[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd14}} & {ent14[`WIDTH_M1:0], ent15[9]} |
	{`WIDTH_P1{rptr[3:0] == 4'd15}} & {ent15[`WIDTH_M1:0], ent0[9]};

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
assign scan_out                  = ff_ent15_scanout         ;
// fixscan end:
endmodule






// any PARAMS parms go into naming of macro

module mcu_otq_ctl_msff_ctl_macro__width_5 (
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

module mcu_otq_ctl_msff_ctl_macro__en_1__width_20 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [19:0] fdin;
wire [18:0] so;

  input [19:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [19:0] dout;
  output scan_out;
assign fdin[19:0] = (din[19:0] & {20{en}}) | (dout[19:0] & ~{20{en}});






dff #(20)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[19:0]),
.si({scan_in,so[18:0]}),
.so({so[18:0],scan_out}),
.q(dout[19:0])
);












endmodule








