// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: tcu_ucbbusout8_ctl.v
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
`define UCB_BUS_WIDTH 8
`define UCB_BUS_WIDTH_M1 7
`define CYC_NUM 16
`define CYC_NUM_M1 15

module tcu_ucbbusout8_ctl (
  iol2clk, 
  scan_in, 
  scan_out, 
  tcu_int_ce, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  tcu_siclk_in, 
  tcu_soclk_in, 
  tcu_scan_en, 
  vld, 
  data, 
  stall, 
  outdata_buf_busy, 
  outdata_buf_in, 
  outdata_vec_in, 
  outdata_buf_wr) ;
wire [15:0] outdata_vec;
wire [127:0] outdata_buf;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire stall_d1;
wire l1clk;
wire load_outdata;
wire shift_outdata;
wire [15:0] outdata_vec_next;
wire outdata_vec_ff_scanin;
wire outdata_vec_ff_scanout;
wire [127:0] outdata_buf_next;
wire outdata_buf_ff_scanin;
wire outdata_buf_ff_scanout;
wire siclk;
wire soclk;
wire l1en;
wire pce_ov;
wire stop;
wire se;


// Globals
input		iol2clk;
input		scan_in;
output		scan_out;
input           tcu_int_ce;
input		tcu_pce_ov;
input		tcu_clk_stop;
input		tcu_siclk_in;
input		tcu_soclk_in;
input 	        tcu_scan_en;

// UCB bus interface
output		vld;
output [`UCB_BUS_WIDTH_M1 :0]	data;
input		stall;

// Local interface
output		outdata_buf_busy;
input [127:0]	outdata_buf_in;
input [`CYC_NUM_M1 :0]	outdata_vec_in;
input		outdata_buf_wr;

// Local signals

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////
/************************************************************
 * UCB bus interface flops
 ************************************************************/
assign 	 vld = outdata_vec[0];
assign 	 data[`UCB_BUS_WIDTH_M1 :0] = outdata_buf[`UCB_BUS_WIDTH_M1 :0];

tcu_ucbbusout8_ctl_msff_ctl_macro__width_1 stall_d1_ff 
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
 * Outbound Data
 ************************************************************/
// accept new data only if there is none being processed
assign  load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign  outdata_buf_busy = outdata_vec[0] | stall_d1;

assign  shift_outdata = outdata_vec[0] & ~stall_d1;

assign  outdata_vec_next[`CYC_NUM_M1 :0] =
				load_outdata  ? outdata_vec_in[`CYC_NUM_M1 :0] : 
				shift_outdata ? {1'b0,outdata_vec[`CYC_NUM_M1 :1]} : 
						outdata_vec[`CYC_NUM_M1 :0] ;

tcu_ucbbusout8_ctl_msff_ctl_macro__width_16 outdata_vec_ff  
				(
				.scan_in(outdata_vec_ff_scanin),
				.scan_out(outdata_vec_ff_scanout),
				.dout		(outdata_vec[`CYC_NUM_M1 :0]),
				.l1clk		(l1clk),
				.din		(outdata_vec_next[`CYC_NUM_M1 :0]),
  .siclk(siclk),
  .soclk(soclk)
				);

assign  outdata_buf_next[127:0] = load_outdata  ? outdata_buf_in[127:0] :
		 		  shift_outdata ? (outdata_buf[127:0] >> `UCB_BUS_WIDTH ) :  
	                         		   outdata_buf[127:0] ;

tcu_ucbbusout8_ctl_msff_ctl_macro__width_128 outdata_buf_ff 
				(
				.scan_in(outdata_buf_ff_scanin),
				.scan_out(outdata_buf_ff_scanout),
				.dout		(outdata_buf[127:0]),
				.l1clk		(l1clk),
				.din		(outdata_buf_next[127:0]),
  .siclk(siclk),
  .soclk(soclk)
				);



/**** adding clock header ****/
tcu_ucbbusout8_ctl_l1clkhdr_ctl_macro clkgen (
				.l2clk	(iol2clk),
				.l1clk	(l1clk),
  .l1en(l1en),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
				);

/*** building tcu port ***/
assign	siclk = tcu_siclk_in;
assign	soclk = tcu_soclk_in;
assign  l1en  = tcu_int_ce; // 1'1b
assign	pce_ov = tcu_pce_ov;
assign	stop = tcu_clk_stop;
assign  se = tcu_scan_en;

// fixscan start:
assign stall_d1_ff_scanin        = scan_in                  ;
assign outdata_vec_ff_scanin     = stall_d1_ff_scanout      ;
assign outdata_buf_ff_scanin     = outdata_vec_ff_scanout   ;
assign scan_out                  = outdata_buf_ff_scanout   ;
// fixscan end:
endmodule // ucb_bus_out












// any PARAMS parms go into naming of macro

module tcu_ucbbusout8_ctl_msff_ctl_macro__width_1 (
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

module tcu_ucbbusout8_ctl_msff_ctl_macro__width_16 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [15:0] fdin;
wire [14:0] so;

  input [15:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [15:0] dout;
  output scan_out;
assign fdin[15:0] = din[15:0];






dff #(16)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[15:0]),
.si({scan_in,so[14:0]}),
.so({so[14:0],scan_out}),
.q(dout[15:0])
);












endmodule













// any PARAMS parms go into naming of macro

module tcu_ucbbusout8_ctl_msff_ctl_macro__width_128 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [127:0] fdin;
wire [126:0] so;

  input [127:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [127:0] dout;
  output scan_out;
assign fdin[127:0] = din[127:0];






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

module tcu_ucbbusout8_ctl_l1clkhdr_ctl_macro (
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








