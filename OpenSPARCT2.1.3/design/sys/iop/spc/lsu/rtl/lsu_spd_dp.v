// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_spd_dp.v
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
module lsu_spd_dp (
  sbd_st_addr_b, 
  sbc_st_addr_new, 
  sbc_thread_b, 
  sbc_spd_clken, 
  sbc_tidb_eq_tidw, 
  sbc_inv_addr_prty, 
  sbc_cam_line_en_m, 
  stb_cam_data, 
  stb_ram_cparity, 
  dcc_bmask_parity_b, 
  spd_st_line_match, 
  stb_cam_perr, 
  stb_cparity_calc, 
  stb_cam_line_en_b, 
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  tcu_se_scancollar_in, 
  spc_aclk, 
  spc_bclk, 
  scan_out);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire [39:3] st_addr_b;
wire dff_st_addr_w_scanin;
wire dff_st_addr_w_scanout;
wire [38:6] st_addr_w;
wire dff_last_line_0_scanin;
wire dff_last_line_0_scanout;
wire [38:6] last_line_0;
wire dff_last_line_1_scanin;
wire dff_last_line_1_scanout;
wire [38:6] last_line_1;
wire dff_last_line_2_scanin;
wire dff_last_line_2_scanout;
wire [38:6] last_line_2;
wire dff_last_line_3_scanin;
wire dff_last_line_3_scanout;
wire [38:6] last_line_3;
wire dff_last_line_4_scanin;
wire dff_last_line_4_scanout;
wire [38:6] last_line_4;
wire dff_last_line_5_scanin;
wire dff_last_line_5_scanout;
wire [38:6] last_line_5;
wire dff_last_line_6_scanin;
wire dff_last_line_6_scanout;
wire [38:6] last_line_6;
wire dff_last_line_7_scanin;
wire dff_last_line_7_scanout;
wire [38:6] last_line_7;
wire [38:6] last_line;
wire [38:6] cmp_addr;
wire line_match_38_23;
wire line_match_22_7;
wire line_match_6;
wire pa_b39_b_;
wire addr_parity_hi;
wire addr_parity_lo;
wire stb_cparity_calc_;
wire rd_p0;
wire rd_p1;
wire cam_perr_;
wire dff_cam_line_en_b_scanin;
wire dff_cam_line_en_b_scanout;


input	[39:3]	sbd_st_addr_b;

input	[7:0]	sbc_st_addr_new;
input	[7:0]	sbc_thread_b;
input		sbc_spd_clken;
input		sbc_tidb_eq_tidw;
input		sbc_inv_addr_prty;
input	[7:0]	sbc_cam_line_en_m;

input	[44:0]	stb_cam_data;
input		stb_ram_cparity;

input		dcc_bmask_parity_b;

output		spd_st_line_match;
output		stb_cam_perr;
output		stb_cparity_calc;
output	[7:0]	stb_cam_line_en_b;

// Globals
input		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input		tcu_se_scancollar_in;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;

// scan renames
assign stop = 1'b0;
// end scan

lsu_spd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);


////////////////////////////////////////////////////////////////////////////////
// Address staging and compare for store pipelining.
// For a 64B line, addr[5:0] do not compare.  IO stores are not pipelined, so
// PA[39] does not need to factor into the compare.

lsu_spd_dp_buff_macro__rep_1__stack_40c__width_37 st_addr_b_buf   (
	.din	(sbd_st_addr_b[39:3]),
	.dout	(st_addr_b[39:3])
);

lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_st_addr_w     (
	.scan_in(dff_st_addr_w_scanin),
	.scan_out(dff_st_addr_w_scanout),
	.din	(st_addr_b[38:6]),
	.dout	(st_addr_w[38:6]),
	.clk    (l2clk),
	.en	(sbc_spd_clken),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_0     (
	.scan_in(dff_last_line_0_scanin),
	.scan_out(dff_last_line_0_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_0[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_1     (
	.scan_in(dff_last_line_1_scanin),
	.scan_out(dff_last_line_1_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_1[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[1]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_2     (
	.scan_in(dff_last_line_2_scanin),
	.scan_out(dff_last_line_2_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_2[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[2]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_3     (
	.scan_in(dff_last_line_3_scanin),
	.scan_out(dff_last_line_3_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_3[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[3]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_4     (
	.scan_in(dff_last_line_4_scanin),
	.scan_out(dff_last_line_4_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_4[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[4]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_5     (
	.scan_in(dff_last_line_5_scanin),
	.scan_out(dff_last_line_5_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_5[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[5]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_6     (
	.scan_in(dff_last_line_6_scanin),
	.scan_out(dff_last_line_6_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_6[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[6]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);
lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 dff_last_line_7     (
	.scan_in(dff_last_line_7_scanin),
	.scan_out(dff_last_line_7_scanout),
	.din    (st_addr_w[38:6]),
	.dout	(last_line_7[38:6]),
	.clk    (l2clk),
	.en	(sbc_st_addr_new[7]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// mux out the last line of the store in B
lsu_spd_dp_mux_macro__left_3__mux_aonpe__ports_8__stack_40c__width_33 mux_last_line       (
	.din0	(last_line_0[38:6]),
	.din1	(last_line_1[38:6]),
	.din2	(last_line_2[38:6]),
	.din3	(last_line_3[38:6]),
	.din4	(last_line_4[38:6]),
	.din5	(last_line_5[38:6]),
	.din6	(last_line_6[38:6]),
	.din7	(last_line_7[38:6]),
	.sel0	(sbc_thread_b[0]),
	.sel1	(sbc_thread_b[1]),
	.sel2	(sbc_thread_b[2]),
	.sel3	(sbc_thread_b[3]),
	.sel4	(sbc_thread_b[4]),
	.sel5	(sbc_thread_b[5]),
	.sel6	(sbc_thread_b[6]),
	.sel7	(sbc_thread_b[7]),
	.dout	(last_line[38:6])
);

lsu_spd_dp_mux_macro__left_3__mux_aope__ports_2__stack_40c__width_33 mux_cmp_addr      (
	.din0	(st_addr_w[38:6]),
	.din1	(last_line[38:6]),
	.sel0	(sbc_tidb_eq_tidw),
	.dout	(cmp_addr[38:6])
);

lsu_spd_dp_cmp_macro__width_16 st_addr_cmp0  (
	.din0	(st_addr_b[38:23]),
	.din1	(cmp_addr[38:23]),
	.dout	(line_match_38_23)
);
lsu_spd_dp_cmp_macro__width_16 st_addr_cmp1  (
	.din0	(st_addr_b[22:7]),
	.din1	(cmp_addr[22:7]),
	.dout	(line_match_22_7)
);
lsu_spd_dp_xnor_macro__width_1 st_addr_cmp2  (
	.din0	(st_addr_b[6]),
	.din1	(cmp_addr[6]),
	.dout	(line_match_6)
);
lsu_spd_dp_inv_macro__width_1 pa_b39_inv  (
	.din	(st_addr_b[39]),
	.dout	(pa_b39_b_)
);

lsu_spd_dp_and_macro__ports_4__width_1 st_addr_cmp   (
	.din0	(line_match_38_23),
	.din1	(line_match_22_7),
	.din2	(line_match_6),
	.din3	(pa_b39_b_),		// IO stores cannot pipeline
	.dout	(spd_st_line_match)
);

////////////////////////////////////////////////////////////////////////////////
// Parity generation for stb_cam.  Timing does not allow for parity
// to be written into the CAM.  The parity is generated in the next cycle and
// written to the RAM. 

// in this physical order : dcc_bmask_parity_b,st_addr_b[39:3]

lsu_spd_dp_prty_macro__width_8 cam_wr_p0  (
	.din	({dcc_bmask_parity_b,sbc_inv_addr_prty,1'b0,st_addr_b[39:35]}),
	.dout	(addr_parity_hi)
);
lsu_spd_dp_prty_macro__width_32 cam_wr_p1  (
	.din	(st_addr_b[34:3]),
	.dout	(addr_parity_lo)
);
lsu_spd_dp_xnor_macro__ports_2__width_1 camwr_parity_bar  (
	.din0	(addr_parity_hi),
	.din1	(addr_parity_lo),
	.dout	(stb_cparity_calc_)
);
lsu_spd_dp_inv_macro__width_1 camwr_parity  (
	.din	(stb_cparity_calc_),
	.dout	(stb_cparity_calc)
);

///////////////////////////////////////////
// Parity error detection for stb_cam
// bits in this phyiscal order: stb_cam_data[7:0],2'b00,stb_cam_data[44:8],stb_ram_cparity

lsu_spd_dp_prty_macro__width_32 cam_rd_p0  (
	.din	({stb_cam_data[7:0],stb_cam_data[44:23],2'b00}),
	.dout	(rd_p0)
);
lsu_spd_dp_prty_macro__width_16 cam_rd_p1  (
	.din	({stb_cam_data[22:8],stb_ram_cparity}),
	.dout	(rd_p1)
);
lsu_spd_dp_xnor_macro__ports_2__width_1 cam_rd_perr   (
	.din0	(rd_p0),
	.din1	(rd_p1),
	.dout	(cam_perr_)
);
lsu_spd_dp_inv_macro__width_1 buf_cam_perr  (
	.din	(cam_perr_),
	.dout	(stb_cam_perr)
);

///////////////////////////////////////////
// flops for stb_cam_line_en_b
lsu_spd_dp_msff_macro__stack_8l__width_8 dff_cam_line_en_b    (
	.scan_in(dff_cam_line_en_b_scanin),
	.scan_out(dff_cam_line_en_b_scanout),
	.din    (sbc_cam_line_en_m[7:0]),
	.dout	(stb_cam_line_en_b[7:0]),
	.clk    (l2clk),
	.en	(1'b1),
	.se	(tcu_se_scancollar_in),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);



// fixscan start:
assign dff_st_addr_w_scanin      = scan_in                  ;
assign dff_last_line_0_scanin    = dff_st_addr_w_scanout    ;
assign dff_last_line_1_scanin    = dff_last_line_0_scanout  ;
assign dff_last_line_2_scanin    = dff_last_line_1_scanout  ;
assign dff_last_line_3_scanin    = dff_last_line_2_scanout  ;
assign dff_last_line_4_scanin    = dff_last_line_3_scanout  ;
assign dff_last_line_5_scanin    = dff_last_line_4_scanout  ;
assign dff_last_line_6_scanin    = dff_last_line_5_scanout  ;
assign dff_last_line_7_scanin    = dff_last_line_6_scanout  ;
assign dff_cam_line_en_b_scanin  = dff_last_line_7_scanout  ;
assign scan_out                  = dff_cam_line_en_b_scanout;
// fixscan end:
endmodule


//
//   buff macro
//
//





module lsu_spd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
  din, 
  dout);
  input [3:0] din;
  output [3:0] dout;






buff #(4)  d0_0 (
.in(din[3:0]),
.out(dout[3:0])
);








endmodule





//
//   buff macro
//
//





module lsu_spd_dp_buff_macro__rep_1__stack_40c__width_37 (
  din, 
  dout);
  input [36:0] din;
  output [36:0] dout;






buff #(37)  d0_0 (
.in(din[36:0]),
.out(dout[36:0])
);








endmodule









// any PARAMS parms go into naming of macro

module lsu_spd_dp_msff_macro__left_3__stack_40c__width_33 (
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
wire [31:0] so;

  input [32:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [32:0] dout;


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
dff #(33)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[32:0]),
.si({scan_in,so[31:0]}),
.so({so[31:0],scan_out}),
.q(dout[32:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_spd_dp_mux_macro__left_3__mux_aonpe__ports_8__stack_40c__width_33 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  din2, 
  sel2, 
  din3, 
  sel3, 
  din4, 
  sel4, 
  din5, 
  sel5, 
  din6, 
  sel6, 
  din7, 
  sel7, 
  dout);
wire buffout0;
wire buffout1;
wire buffout2;
wire buffout3;
wire buffout4;
wire buffout5;
wire buffout6;
wire buffout7;

  input [32:0] din0;
  input sel0;
  input [32:0] din1;
  input sel1;
  input [32:0] din2;
  input sel2;
  input [32:0] din3;
  input sel3;
  input [32:0] din4;
  input sel4;
  input [32:0] din5;
  input sel5;
  input [32:0] din6;
  input sel6;
  input [32:0] din7;
  input sel7;
  output [32:0] dout;





cl_dp1_muxbuff8_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .in2(sel2),
 .in3(sel3),
 .in4(sel4),
 .in5(sel5),
 .in6(sel6),
 .in7(sel7),
 .out0(buffout0),
 .out1(buffout1),
 .out2(buffout2),
 .out3(buffout3),
 .out4(buffout4),
 .out5(buffout5),
 .out6(buffout6),
 .out7(buffout7)
);
mux8s #(33)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .sel2(buffout2),
  .sel3(buffout3),
  .sel4(buffout4),
  .sel5(buffout5),
  .sel6(buffout6),
  .sel7(buffout7),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
  .in2(din2[32:0]),
  .in3(din3[32:0]),
  .in4(din4[32:0]),
  .in5(din5[32:0]),
  .in6(din6[32:0]),
  .in7(din7[32:0]),
.dout(dout[32:0])
);









  



endmodule


// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_spd_dp_mux_macro__left_3__mux_aope__ports_2__stack_40c__width_33 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [32:0] din0;
  input [32:0] din1;
  input sel0;
  output [32:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(33)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[32:0]),
  .in1(din1[32:0]),
.dout(dout[32:0])
);









  



endmodule


//
//   comparator macro (output is 1 if both inputs are equal; 0 otherwise)
//
//





module lsu_spd_dp_cmp_macro__width_16 (
  din0, 
  din1, 
  dout);
  input [15:0] din0;
  input [15:0] din1;
  output dout;






cmp #(16)  m0_0 (
.in0(din0[15:0]),
.in1(din1[15:0]),
.out(dout)
);










endmodule





//
//   xnor macro for ports = 2,3
//
//





module lsu_spd_dp_xnor_macro__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






xnor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   invert macro
//
//





module lsu_spd_dp_inv_macro__width_1 (
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





module lsu_spd_dp_and_macro__ports_4__width_1 (
  din0, 
  din1, 
  din2, 
  din3, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  input [0:0] din2;
  input [0:0] din3;
  output [0:0] dout;






and4 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.in2(din2[0:0]),
.in3(din3[0:0]),
.out(dout[0:0])
);









endmodule





//
//   parity macro (even parity)
//
//





module lsu_spd_dp_prty_macro__width_8 (
  din, 
  dout);
  input [7:0] din;
  output dout;







prty #(8)  m0_0 (
.in(din[7:0]),
.out(dout)
);










endmodule





//
//   parity macro (even parity)
//
//





module lsu_spd_dp_prty_macro__width_32 (
  din, 
  dout);
  input [31:0] din;
  output dout;







prty #(32)  m0_0 (
.in(din[31:0]),
.out(dout)
);










endmodule





//
//   xnor macro for ports = 2,3
//
//





module lsu_spd_dp_xnor_macro__ports_2__width_1 (
  din0, 
  din1, 
  dout);
  input [0:0] din0;
  input [0:0] din1;
  output [0:0] dout;






xnor2 #(1)  d0_0 (
.in0(din0[0:0]),
.in1(din1[0:0]),
.out(dout[0:0])
);







endmodule





//
//   parity macro (even parity)
//
//





module lsu_spd_dp_prty_macro__width_16 (
  din, 
  dout);
  input [15:0] din;
  output dout;







prty #(16)  m0_0 (
.in(din[15:0]),
.out(dout)
);










endmodule









// any PARAMS parms go into naming of macro

module lsu_spd_dp_msff_macro__stack_8l__width_8 (
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
wire [6:0] so;

  input [7:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [7:0] dout;


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
dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);




















endmodule








