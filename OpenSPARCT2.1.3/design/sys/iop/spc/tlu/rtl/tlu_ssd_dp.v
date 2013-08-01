// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_ssd_dp.v
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
module tlu_ssd_dp (
  shscan_l2clk, 
  tcu_shscan_scan_in, 
  tcu_shscan_pce_ov, 
  tcu_shscan_aclk, 
  tcu_shscan_bclk, 
  tcu_shscan_scan_en, 
  trl1_shscanid_2, 
  sse_shscan_clk_stop, 
  sse_shadow_pc, 
  tsd0_shadow_pstate, 
  tsd1_shadow_pstate, 
  tsd0_shadow_tpc, 
  tsd1_shadow_tpc, 
  tsd0_shadow_tt, 
  tsd1_shadow_tt, 
  trl0_shadow_tl, 
  trl1_shadow_tl, 
  trl0_tl_for_tt, 
  trl1_tl_for_tt, 
  spc_shscan_scan_out);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire en;
wire clk;
wire se;
wire shadow_0_lat_scan_out;
wire [117:0] shadow_unused;



input		shscan_l2clk;
input 		tcu_shscan_scan_in;
input		tcu_shscan_pce_ov;
input		tcu_shscan_aclk;
input		tcu_shscan_bclk;
input		tcu_shscan_scan_en;

input		trl1_shscanid_2;

input		sse_shscan_clk_stop;
input	[47:2]	sse_shadow_pc;

input	[10:0]	tsd0_shadow_pstate;
input	[10:0]	tsd1_shadow_pstate;

input	[47:2]	tsd0_shadow_tpc;
input	[47:2]	tsd1_shadow_tpc;

input	[8:0]	tsd0_shadow_tt;
input	[8:0]	tsd1_shadow_tt;

input	[2:0]	trl0_shadow_tl;
input	[2:0]	trl1_shadow_tl;

input	[2:0]	trl0_tl_for_tt;
input	[2:0]	trl1_tl_for_tt;


output		spc_shscan_scan_out;





//////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_shscan_pce_ov;
assign stop	= sse_shscan_clk_stop; // Synchronized
assign siclk	= tcu_shscan_aclk;
assign soclk	= tcu_shscan_bclk;
assign en	= 1'b1;
assign clk	= shscan_l2clk;
assign se       = tcu_shscan_scan_en;     



//////////////////////////////////////////////////////////////////////
//
// Shadow scan flops
//

// Note:  These ports are supposed to be cross-wired!
tlu_ssd_dp_msff_macro__mux_aope__ports_2__stack_60c__width_60 shadow_0_lat     (
	.scan_in(tcu_shscan_scan_in),
	.scan_out(shadow_0_lat_scan_out),
	.din1	({sse_shadow_pc		[47:2],
		  tsd0_shadow_pstate	[10:0],
		  trl0_shadow_tl	[2:0]}),
	.din0	({sse_shadow_pc		[47:2],
		  tsd1_shadow_pstate	[10:0],
		  trl1_shadow_tl	[2:0]}),
	.sel0	(trl1_shscanid_2		),
	.dout	(shadow_unused		[117:58]),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_ssd_dp_msff_macro__mux_aope__ports_2__stack_60c__width_58 shadow_1_lat     (
	.scan_in(shadow_0_lat_scan_out),
	.scan_out(spc_shscan_scan_out),
	.din1	({tsd0_shadow_tpc	[47:2],
		  tsd0_shadow_tt	[8:0],
		  trl0_tl_for_tt	[2:0]}),
	.din0	({tsd1_shadow_tpc	[47:2],
		  tsd1_shadow_tt	[8:0],
		  trl1_tl_for_tt	[2:0]}),
	.sel0	(trl1_shscanid_2		),
	.dout	(shadow_unused		[57:0]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



// Do NOT run fixscan on this file!
endmodule








// any PARAMS parms go into naming of macro

module tlu_ssd_dp_msff_macro__mux_aope__ports_2__stack_60c__width_60 (
  din0, 
  din1, 
  sel0, 
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
wire psel0;
wire psel1;
wire [59:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [58:0] so;

  input [59:0] din0;
  input [59:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [59:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(60)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[59:0]),
  .in1(din1[59:0]),
.dout(muxout[59:0])
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
dff #(60)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[59:0]),
.si({scan_in,so[58:0]}),
.so({so[58:0],scan_out}),
.q(dout[59:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_ssd_dp_msff_macro__mux_aope__ports_2__stack_60c__width_58 (
  din0, 
  din1, 
  sel0, 
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
wire psel0;
wire psel1;
wire [57:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [56:0] so;

  input [57:0] din0;
  input [57:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [57:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(58)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[57:0]),
  .in1(din1[57:0]),
.dout(muxout[57:0])
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
dff #(58)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[57:0]),
.si({scan_in,so[56:0]}),
.so({so[56:0],scan_out}),
.q(dout[57:0])
);




















endmodule








