// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tlu_sse_dp.v
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
module tlu_sse_dp (
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  scan_in, 
  tcu_shscan_clk_stop, 
  trl1_shscanid_2, 
  fls_ss_update_pc_w, 
  pct0_shadow_pc_d, 
  pct1_shadow_pc_d, 
  fls0_spc_hardstop_request, 
  fls0_spc_softstop_request, 
  fls0_spc_trigger_pulse, 
  fls1_spc_hardstop_request, 
  fls1_spc_softstop_request, 
  fls1_spc_trigger_pulse, 
  scan_out, 
  sse_shscan_clk_stop, 
  sse_shadow_pc, 
  tlu_hardstop_request, 
  tlu_softstop_request, 
  tlu_trigger_pulse);
wire stop;
wire en;
wire clk;
wire pce_ov;
wire se;
wire siclk;
wire soclk;
wire pc_e_lat_scanin;
wire pc_e_lat_scanout;
wire [47:2] pc_e;
wire pc_m_lat_scanin;
wire pc_m_lat_scanout;
wire [47:2] pc_m;
wire pc_b_lat_scanin;
wire pc_b_lat_scanout;
wire shscan_clk_stop_in;
wire [47:2] pc_b;
wire pc_w_lat_scanin;
wire pc_w_lat_scanout;



input		l2clk;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input 		scan_in;

input		tcu_shscan_clk_stop;	// To be synchronized

input		trl1_shscanid_2;

input	[1:0]	fls_ss_update_pc_w;

input	[47:2]	pct0_shadow_pc_d;
input	[47:2]	pct1_shadow_pc_d;

// NOT SHADOW SCAN, but debug
input		fls0_spc_hardstop_request;
input		fls0_spc_softstop_request;
input		fls0_spc_trigger_pulse;
input		fls1_spc_hardstop_request;
input		fls1_spc_softstop_request;
input		fls1_spc_trigger_pulse;



output		scan_out;

output 		sse_shscan_clk_stop;

output	[47:2]	sse_shadow_pc;

output		tlu_hardstop_request;
output		tlu_softstop_request;
output		tlu_trigger_pulse;





//////////////////////////////////////////////////////////////////////

assign stop	= 1'b0;
assign en	= 1'b1;
assign clk	= l2clk;

tlu_sse_dp_buff_macro__width_4 clk_control_buf  (
	.din	({tcu_pce_ov		       ,
		  tcu_scan_en		       ,
		  spc_aclk		       ,
		  spc_bclk		       }),
	.dout	({pce_ov		       ,
		  se			       ,
		  siclk			       ,
		  soclk			       })
);



//////////////////////////////////////////////////////////////////////
//
// Stage PC to W
//

tlu_sse_dp_msff_macro__left_14__mux_aope__ports_2__stack_60c__width_46 pc_e_lat      (
	.scan_in(pc_e_lat_scanin),
	.scan_out(pc_e_lat_scanout),
	.din1	(pct0_shadow_pc_d	[47:2]	),
	.din0	(pct1_shadow_pc_d	[47:2]	),
	.sel0	(trl1_shscanid_2		),
	.dout	(pc_e			[47:2]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_sse_dp_msff_macro__left_14__stack_60c__width_46 pc_m_lat    (
	.scan_in(pc_m_lat_scanin),
	.scan_out(pc_m_lat_scanout),
	.din	(pc_e			[47:2]	),
	.dout	(pc_m			[47:2]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_sse_dp_msff_macro__left_12__stack_60c__width_48 pc_b_lat    (
	.scan_in(pc_b_lat_scanin),
	.scan_out(pc_b_lat_scanout),
	.din	({pc_m			[47:2],
		  tcu_shscan_clk_stop	       ,
		  shscan_clk_stop_in	       }),
	.dout	({pc_b			[47:2],
		  shscan_clk_stop_in	       ,
		  sse_shscan_clk_stop	       }),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

tlu_sse_dp_msff_macro__left_14__mux_aope__ports_3__stack_60c__width_46 pc_w_lat      (
	.scan_in(pc_w_lat_scanin),
	.scan_out(pc_w_lat_scanout),
	.din0	(pc_b			[47:2]	),
	.din1	(pc_b			[47:2]	),
	.din2	(sse_shadow_pc		[47:2]	),
	.sel0	(fls_ss_update_pc_w	[0   ]	),
	.sel1	(fls_ss_update_pc_w	[1   ]	),
	.dout	(sse_shadow_pc		[47:2]	),
  .clk(clk),
  .en(en),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



//////////////////////////////////////////////////////////////////////////////
// OR the stop requests and trigger pulses
//

tlu_sse_dp_or_macro__ports_2__stack_60c__width_3 debug_or    (
	.din0	({fls0_spc_hardstop_request    ,
		  fls0_spc_softstop_request    ,
		  fls0_spc_trigger_pulse       }),
	.din1	({fls1_spc_hardstop_request    ,
		  fls1_spc_softstop_request    ,
		  fls1_spc_trigger_pulse       }),
	.dout	({tlu_hardstop_request	       ,
		  tlu_softstop_request	       ,
		  tlu_trigger_pulse	       })
);




// fixscan start:
assign pc_e_lat_scanin           = scan_in                  ;
assign pc_m_lat_scanin           = pc_e_lat_scanout         ;
assign pc_b_lat_scanin           = pc_m_lat_scanout         ;
assign pc_w_lat_scanin           = pc_b_lat_scanout         ;
assign scan_out                  = pc_w_lat_scanout         ;
// fixscan end:
endmodule




//
//   buff macro
//
//





module tlu_sse_dp_buff_macro__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule









// any PARAMS parms go into naming of macro

module tlu_sse_dp_msff_macro__left_14__mux_aope__ports_2__stack_60c__width_46 (
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
wire [45:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [44:0] so;

  input [45:0] din0;
  input [45:0] din1;
  input sel0;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [45:0] dout;


  output scan_out;




cl_dp1_penc2_8x  c1_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(46)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[45:0]),
  .in1(din1[45:0]),
.dout(muxout[45:0])
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
dff #(46)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[45:0]),
.si({scan_in,so[44:0]}),
.so({so[44:0],scan_out}),
.q(dout[45:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_sse_dp_msff_macro__left_14__stack_60c__width_46 (
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
wire [44:0] so;

  input [45:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [45:0] dout;


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
dff #(46)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[45:0]),
.si({scan_in,so[44:0]}),
.so({so[44:0],scan_out}),
.q(dout[45:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_sse_dp_msff_macro__left_12__stack_60c__width_48 (
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
wire [46:0] so;

  input [47:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [47:0] dout;


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
dff #(48)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[47:0]),
.si({scan_in,so[46:0]}),
.so({so[46:0],scan_out}),
.q(dout[47:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module tlu_sse_dp_msff_macro__left_14__mux_aope__ports_3__stack_60c__width_46 (
  din0, 
  din1, 
  din2, 
  sel0, 
  sel1, 
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
wire psel2;
wire [45:0] muxout;
wire l1clk;
wire siclk_out;
wire soclk_out;
wire [44:0] so;

  input [45:0] din0;
  input [45:0] din1;
  input [45:0] din2;
  input sel0;
  input sel1;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [45:0] dout;


  output scan_out;




cl_dp1_penc3_8x  c1_0 (
  .test(1'b1),
 .sel0(sel0),
 .sel1(sel1),
 .psel0(psel0),
 .psel1(psel1),
 .psel2(psel2)
);

mux3s #(46)  d1_0 (
  .sel0(psel0),
  .sel1(psel1),
  .sel2(psel2),
  .in0(din0[45:0]),
  .in1(din1[45:0]),
  .in2(din2[45:0]),
.dout(muxout[45:0])
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
dff #(46)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(muxout[45:0]),
.si({scan_in,so[44:0]}),
.so({so[44:0],scan_out}),
.q(dout[45:0])
);




















endmodule









//  
//   or macro for ports = 2,3
//
//





module tlu_sse_dp_or_macro__ports_2__stack_60c__width_3 (
  din0, 
  din1, 
  dout);
  input [2:0] din0;
  input [2:0] din1;
  output [2:0] dout;






or2 #(3)  d0_0 (
.in0(din0[2:0]),
.in1(din1[2:0]),
.out(dout[2:0])
);









endmodule




