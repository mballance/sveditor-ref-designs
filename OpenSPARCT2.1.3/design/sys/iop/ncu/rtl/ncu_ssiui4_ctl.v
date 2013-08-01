// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ncu_ssiui4_ctl.v
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
`define UCB_BUS_WIDTH 4
`define UCB_BUS_WIDTH_M1 3
`define CYC_NUM 32
`define CYC_NUM_M1 31

module ncu_ssiui4_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_scan_en, 
  tcu_aclk, 
  tcu_bclk, 
  vld, 
  data, 
  stall, 
  indata_buf_vld, 
  indata_buf, 
  stall_a1) ;
wire stall_d1_n;
wire stall_d1;
wire vld_d1_ff_scanin;
wire vld_d1_ff_scanout;
wire vld_d1;
wire l1clk;
wire data_d1_ff_scanin;
wire data_d1_ff_scanout;
wire [3:0] data_d1;
wire stall_ff_scanin;
wire stall_ff_scanout;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire skid_buf0_en;
wire vld_buf0_ff_scanin;
wire vld_buf0_ff_scanout;
wire vld_buf0;
wire data_buf0_ff_scanin;
wire data_buf0_ff_scanout;
wire [3:0] data_buf0;
wire skid_buf1_en_ff_scanin;
wire skid_buf1_en_ff_scanout;
wire skid_buf1_en;
wire vld_buf1_ff_scanin;
wire vld_buf1_ff_scanout;
wire vld_buf1;
wire data_buf1_ff_scanin;
wire data_buf1_ff_scanout;
wire [3:0] data_buf1;
wire skid_buf0_sel;
wire skid_buf1_sel_ff_scanin;
wire skid_buf1_sel_ff_scanout;
wire skid_buf1_sel;
wire vld_mux;
wire [3:0] data_mux;
wire [31:0] indata_vec_next;
wire [31:0] indata_vec;
wire stall_a1_n;
wire indata_vec_ff_scanin;
wire indata_vec_ff_scanout;
wire [127:0] indata_buf_next;
wire indata_buf_ff_scanin;
wire indata_buf_ff_scanout;
wire indata_vec0_d1_ff_scanin;
wire indata_vec0_d1_ff_scanout;
wire indata_vec0_d1;
wire siclk;
wire soclk;
wire se;
wire pce_ov;
wire stop;


////////////////////////////////////////////////////////////////////////
// Signal declarations
////////////////////////////////////////////////////////////////////////
// Global interface
input		iol2clk;
input		scan_in;
output		scan_out;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_scan_en;
input		tcu_aclk;
input		tcu_bclk;

// UCB bus interface
input		vld;
input [`UCB_BUS_WIDTH_M1 :0]	data;
output		stall;


// Local interface
output		indata_buf_vld;
output [127:0]	indata_buf;
input		stall_a1;


// Internal signals


////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 * This is to make signals going between IOB and UCB flop-to-flop
 * to improve timing.
 ************************************************************/
assign stall_d1_n = ~stall_d1;
ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_1 vld_d1_ff  
				(
				.scan_in(vld_d1_ff_scanin),
				.scan_out(vld_d1_ff_scanout),
				.dout		(vld_d1),
				.l1clk		(l1clk),
				.en		(stall_d1_n),
				.din		(vld),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_4 data_d1_ff  
				(
				.scan_in(data_d1_ff_scanin),
				.scan_out(data_d1_ff_scanout),
				.dout		(data_d1[`UCB_BUS_WIDTH_M1:0]),
				.l1clk		(l1clk),
				.en		(stall_d1_n),
				.din		(data[`UCB_BUS_WIDTH_M1:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__width_1 stall_ff 
				(
				.scan_in(stall_ff_scanin),
				.scan_out(stall_ff_scanout),
				.dout		(stall),
				.l1clk		(l1clk),
				.din		(stall_a1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__width_1 stall_d1_ff 
				(
				.scan_in(stall_d1_ff_scanin),
				.scan_out(stall_d1_ff_scanout),
				.dout		(stall_d1),
				.l1clk		(l1clk),
				.din		(stall),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Skid buffer
 * We need a two deep skid buffer to handle stalling.
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

// Buffer 0
assign  skid_buf0_en = stall_a1 & ~stall;

ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_1 vld_buf0_ff  
				(
				.scan_in(vld_buf0_ff_scanin),
				.scan_out(vld_buf0_ff_scanout),
				.dout		(vld_buf0),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_4 data_buf0_ff   
				(
				.scan_in(data_buf0_ff_scanin),
				.scan_out(data_buf0_ff_scanout),
				.dout		(data_buf0[`UCB_BUS_WIDTH_M1 :0]),
				.l1clk		(l1clk),
				.en		(skid_buf0_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// Buffer 1
ncu_ssiui4_ctl_msff_ctl_macro__width_1 skid_buf1_en_ff 
				(
				.scan_in(skid_buf1_en_ff_scanin),
				.scan_out(skid_buf1_en_ff_scanout),
				.dout		(skid_buf1_en),
				.l1clk		(l1clk),
				.din		(skid_buf0_en),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_1 vld_buf1_ff  
				(
				.scan_in(vld_buf1_ff_scanin),
				.scan_out(vld_buf1_ff_scanout),
				.dout		(vld_buf1),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(vld_d1),
  .siclk(siclk),
  .soclk(soclk)
				);

ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_4 data_buf1_ff   
				(
				.scan_in(data_buf1_ff_scanin),
				.scan_out(data_buf1_ff_scanout),
				.dout		(data_buf1[`UCB_BUS_WIDTH_M1 :0]),
				.l1clk		(l1clk),
				.en		(skid_buf1_en),
				.din		(data_d1[`UCB_BUS_WIDTH_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);


/************************************************************
 * Mux between skid buffer and interface flop
 ************************************************************/
// Assertion: stall has to be deasserted for more than 1 cycle
//            ie time between two separate stalls has to be
//            at least two cycles.  Otherwise, contents from
//            skid buffer will be lost.

assign	skid_buf0_sel = ~stall_a1 & stall;

ncu_ssiui4_ctl_msff_ctl_macro__width_1 skid_buf1_sel_ff 
				(
				.scan_in(skid_buf1_sel_ff_scanin),
				.scan_out(skid_buf1_sel_ff_scanout),
				.dout		(skid_buf1_sel),
				.l1clk		(l1clk),
				.din		(skid_buf0_sel),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	vld_mux = skid_buf0_sel ? vld_buf0 : 
	   	     skid_buf1_sel ? vld_buf1 :
		                     vld_d1;

assign	data_mux[`UCB_BUS_WIDTH_M1 :0] = skid_buf0_sel ? data_buf0[`UCB_BUS_WIDTH_M1 :0] : 
					skid_buf1_sel ? data_buf1[`UCB_BUS_WIDTH_M1 :0] : 
					       		 data_d1[`UCB_BUS_WIDTH_M1 :0];


/************************************************************
 * Assemble inbound data
 ************************************************************/
// valid vector
assign	indata_vec_next[`CYC_NUM_M1:0] = {vld_mux, indata_vec[`CYC_NUM_M1 :1]};

assign	stall_a1_n = ~stall_a1;
ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_32 indata_vec_ff   
				(
				.scan_in(indata_vec_ff_scanin),
				.scan_out(indata_vec_ff_scanout),
				.dout		(indata_vec[`CYC_NUM_M1 :0]),
				.l1clk		(l1clk),
				.en		(stall_a1_n),
				.din		(indata_vec_next[`CYC_NUM_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// data buffer
assign	indata_buf_next[127:0] = {data_mux[`UCB_BUS_WIDTH_M1 :0], indata_buf[127:`UCB_BUS_WIDTH ]};
ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_128 indata_buf_ff  
				(
				.scan_in(indata_buf_ff_scanin),
				.scan_out(indata_buf_ff_scanout),
				.dout		(indata_buf[127:0]),
				.l1clk		(l1clk),
				.en		(stall_a1_n),
				.din		(indata_buf_next[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);

// detect a new packet	  
ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_1 indata_vec0_d1_ff  
				(
				.scan_in(indata_vec0_d1_ff_scanin),
				.scan_out(indata_vec0_d1_ff_scanout),
				.dout		(indata_vec0_d1),
				.l1clk		(l1clk),
				.en		(stall_a1_n),
				.din		(indata_vec[0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign	indata_buf_vld = indata_vec[0] & ~indata_vec0_d1;





/**** adding clock header ****/
ncu_ssiui4_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1en	(1'b1),
				.l1clk	(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_aclk;
assign	soclk = tcu_bclk;
assign	   se = tcu_scan_en;
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;

// fixscan start:
assign vld_d1_ff_scanin          = scan_in                  ;
assign data_d1_ff_scanin         = vld_d1_ff_scanout        ;
assign stall_ff_scanin           = data_d1_ff_scanout       ;
assign stall_d1_ff_scanin        = stall_ff_scanout         ;
assign vld_buf0_ff_scanin        = stall_d1_ff_scanout      ;
assign data_buf0_ff_scanin       = vld_buf0_ff_scanout      ;
assign skid_buf1_en_ff_scanin    = data_buf0_ff_scanout     ;
assign vld_buf1_ff_scanin        = skid_buf1_en_ff_scanout  ;
assign data_buf1_ff_scanin       = vld_buf1_ff_scanout      ;
assign skid_buf1_sel_ff_scanin   = data_buf1_ff_scanout     ;
assign indata_vec_ff_scanin      = skid_buf1_sel_ff_scanout ;
assign indata_buf_ff_scanin      = indata_vec_ff_scanout    ;
assign indata_vec0_d1_ff_scanin  = indata_buf_ff_scanout    ;
assign scan_out                  = indata_vec0_d1_ff_scanout;
// fixscan end:
endmodule // ucb_bus_in






// any PARAMS parms go into naming of macro

module ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_1 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [0:0] fdin;

  input [0:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [0:0] dout;
  output scan_out;
assign fdin[0:0] = (din[0:0] & {1{en}}) | (dout[0:0] & ~{1{en}});






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

module ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_4 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = (din[3:0] & {4{en}}) | (dout[3:0] & ~{4{en}});






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

module ncu_ssiui4_ctl_msff_ctl_macro__width_1 (
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

module ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_32 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = (din[31:0] & {32{en}}) | (dout[31:0] & ~{32{en}});






dff #(32)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[31:0]),
.si({scan_in,so[30:0]}),
.so({so[30:0],scan_out}),
.q(dout[31:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssiui4_ctl_msff_ctl_macro__en_1__width_128 (
  din, 
  en, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input en;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = (din[127:0] & {128{en}}) | (dout[127:0] & ~{128{en}});






dff #(128)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[127:0]),
.si({scan_in,so[126:0]}),
.so({so[126:0],scan_out}),
.q(dout[127:0])
);












endmodule













// any PARAMS parms go into naming of macro

module ncu_ssiui4_ctl_l1clkhdr_ctl_macro (
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








