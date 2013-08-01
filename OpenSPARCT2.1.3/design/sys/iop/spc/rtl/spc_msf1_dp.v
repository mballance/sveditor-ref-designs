// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: spc_msf1_dp.v
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
module spc_msf1_dp (
  l2clk, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_se_scancollar_out, 
  scan_in, 
  scan_out, 
  tcu_spc_mbist_start, 
  spc_mbist_fail_buf, 
  spc_mbist_done_buf, 
  tcu_spc_mbist_start_ff, 
  spc_mbist_fail_ff, 
  spc_mbist_done_ff);
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire en;
wire clk;
wire tcu_spc_mbist_start_rep0;
wire bank0_lat_scanin;
wire bank0_lat_scanout;


input		l2clk;
input		tcu_pce_ov;
input		spc_aclk;
input		spc_bclk;
input		tcu_se_scancollar_out;
input 		scan_in;
output		scan_out;

// Core I/O before the MSFF
input		tcu_spc_mbist_start;
input		spc_mbist_fail_buf;
input		spc_mbist_done_buf;

// Core I/O after the MSFF
output		tcu_spc_mbist_start_ff;
output		spc_mbist_fail_ff;
output		spc_mbist_done_ff;

//////////////////////////////////////////////////////////////////////

assign pce_ov	= tcu_pce_ov;
assign stop	= 1'b0;
assign siclk	= spc_aclk;
assign soclk	= spc_bclk;
assign en	= 1'b1;
assign clk	= l2clk;



//////////////////////////////////////////////////////////////////////


spc_msf1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 chip_io_rep0  (
        .din(tcu_spc_mbist_start),
        .dout(tcu_spc_mbist_start_rep0)
);

spc_msf1_dpmsff_macro__stack_8r__width_3 bank0_lat   (
	.scan_in(bank0_lat_scanin),
	.scan_out(bank0_lat_scanout),
	.se	( tcu_se_scancollar_out						),
	.din	({tcu_spc_mbist_start_rep0, spc_mbist_fail_buf, spc_mbist_done_buf}),
	.dout	({tcu_spc_mbist_start_ff, spc_mbist_fail_ff, spc_mbist_done_ff}	),
  .clk(clk),
  .en(en),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


// fixscan start:
assign bank0_lat_scanin          = scan_in                  ;
assign scan_out                  = bank0_lat_scanout        ;
// fixscan end:
endmodule


//
//   buff macro
//
//





module spc_msf1_dpbuff_macro__dbuff_32x__rep_1__stack_none__width_1 (
  din, 
  dout);
  input [0:0] din;
  output [0:0] dout;






buff #(1)  d0_0 (
.in(din[0:0]),
.out(dout[0:0])
);








endmodule









// any PARAMS parms go into naming of macro

module spc_msf1_dpmsff_macro__stack_8r__width_3 (
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
wire [1:0] so;

  input [2:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [2:0] dout;


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
dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);




















endmodule








