// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mcu_ucbout_ctl.v
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
module mcu_ucbout_ctl (
  l1clk, 
  scan_in, 
  scan_out, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  vld, 
  data, 
  stall, 
  outdata_buf_busy, 
  outdata_buf_in, 
  outdata_vec_in, 
  outdata_buf_wr);
wire siclk;
wire soclk;
wire se;
wire stall_d1_ff_scanin;
wire stall_d1_ff_scanout;
wire outdata_vec_ff_scanin;
wire outdata_vec_ff_scanout;
wire outdata_buf_ff_scanin;
wire outdata_buf_ff_scanout;



//parameter UCB_BUS_WIDTH = 4;
//parameter REG_WIDTH = 64;            // maximum data bits that needs to
                                     // be sent.  Set to 64 or 128

// Globals
input		l1clk;		
input 		scan_in;
output		scan_out;
input 		tcu_aclk;
input		tcu_bclk;
input		tcu_scan_en;


// UCB bus interface
output 		vld;
output [3:0] 	data;
input 		stall;


// Local interface
output 		outdata_buf_busy;
input [127:0] 	outdata_buf_in;
input [31:0] 	outdata_vec_in;
input 		outdata_buf_wr;


// Local signals
wire 		stall_d1;
wire [31:0] 	outdata_vec;
wire [31:0] 	outdata_vec_next;
wire [127:0] 	outdata_buf;
wire [127:0] 	outdata_buf_next;
wire 		load_outdata;
wire 		shift_outdata;

////////////////////////////////////////////////////////////////////////
// Code starts here
////////////////////////////////////////////////////////////////////////

// Scan reassigns
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign se = tcu_scan_en;

/************************************************************
 * UCB bus interface flops
 ************************************************************/
assign 	 vld = outdata_vec[0];
assign 	 data = outdata_buf[3:0];

mcu_ucbout_ctl_msff_ctl_macro__width_1 stall_d1_ff  (
	.scan_in(stall_d1_ff_scanin),
	.scan_out(stall_d1_ff_scanout),
	.din(stall),
	.l1clk(l1clk),
	.dout(stall_d1),
  .siclk(siclk),
  .soclk(soclk));


/************************************************************
 * Outbound Data
 ************************************************************/
// accept new data only if there is none being processed
assign 	 load_outdata = outdata_buf_wr & ~outdata_buf_busy;

assign 	 outdata_buf_busy = outdata_vec[0] | stall_d1;

assign 	 shift_outdata = outdata_vec[0] & ~stall_d1;

assign 	 outdata_vec_next =
		 load_outdata  ? outdata_vec_in:
		 shift_outdata ? outdata_vec >> 1:    
	                         outdata_vec;

mcu_ucbout_ctl_msff_ctl_macro__width_32 outdata_vec_ff  (
	.scan_in(outdata_vec_ff_scanin),
	.scan_out(outdata_vec_ff_scanout),
	.din(outdata_vec_next),
	.l1clk(l1clk),
	.dout(outdata_vec),
  .siclk(siclk),
  .soclk(soclk));

assign 	 outdata_buf_next =
		 load_outdata  ? outdata_buf_in:
		 shift_outdata ? (outdata_buf >> 4):  
	                         outdata_buf;

mcu_ucbout_ctl_msff_ctl_macro__width_128 outdata_buf_ff  (
	.scan_in(outdata_buf_ff_scanin),
	.scan_out(outdata_buf_ff_scanout),
	.din(outdata_buf_next),
	.l1clk(l1clk),
	.dout(outdata_buf),
  .siclk(siclk),
  .soclk(soclk));


// fixscan start:
assign stall_d1_ff_scanin        = scan_in                  ;
assign outdata_vec_ff_scanin     = stall_d1_ff_scanout      ;
assign outdata_buf_ff_scanin     = outdata_vec_ff_scanout   ;
assign scan_out                  = outdata_buf_ff_scanout   ;
// fixscan end:
endmodule












// any PARAMS parms go into naming of macro

module mcu_ucbout_ctl_msff_ctl_macro__width_1 (
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

module mcu_ucbout_ctl_msff_ctl_macro__width_32 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [31:0] fdin;
wire [30:0] so;

  input [31:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [31:0] dout;
  output scan_out;
assign fdin[31:0] = din[31:0];






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

module mcu_ucbout_ctl_msff_ctl_macro__width_128 (
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








