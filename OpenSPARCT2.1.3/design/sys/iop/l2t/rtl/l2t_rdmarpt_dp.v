// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: l2t_rdmarpt_dp.v
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
module  l2t_rdmarpt_dp (
  l2t_l2b_fbrd_en_c3, 
  l2t_l2b_fbrd_wl_c3, 
  l2t_l2b_fbwr_wl_r2, 
  filbuf_fbd_rd_en_c2, 
  filbuf_fbd_rd_entry_c2, 
  filbuf_fbd_wr_entry_r1, 
  l2clk, 
  tcu_pce_ov, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_scan_en, 
  tcu_clk_stop, 
  scan_in, 
  scan_out);
wire pce_ov;
wire siclk;
wire soclk;
wire stop;
wire se;


output		l2t_l2b_fbrd_en_c3;
output	[2:0]	l2t_l2b_fbrd_wl_c3;
output	[2:0]	l2t_l2b_fbwr_wl_r2;

input		filbuf_fbd_rd_en_c2;
input	[2:0] 	filbuf_fbd_rd_entry_c2;
input	[2:0] 	filbuf_fbd_wr_entry_r1;
input		l2clk;

input   	tcu_pce_ov;
input   	tcu_aclk;
input   	tcu_bclk;
input   	tcu_scan_en;
input   	tcu_clk_stop;
input		scan_in;
output		scan_out;

assign pce_ov = tcu_pce_ov;
assign siclk = tcu_aclk;
assign soclk = tcu_bclk;
assign stop = tcu_clk_stop;
assign se = tcu_scan_en;


l2t_msff_macro__dmsff_32x__stack_8r__width_7 ff_rdma_rptr_flops  
	(
	.din	({filbuf_fbd_rd_en_c2,filbuf_fbd_rd_entry_c2[2:0],filbuf_fbd_wr_entry_r1[2:0]}),
	.dout	({l2t_l2b_fbrd_en_c3,l2t_l2b_fbrd_wl_c3[2:0],l2t_l2b_fbwr_wl_r2[2:0]}),
	.clk	(l2clk),
	.en	(1'b1),
	.scan_in(scan_in),
	.scan_out(scan_out),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);




endmodule




// any PARAMS parms go into naming of macro

module l2t_msff_macro__dmsff_32x__stack_8r__width_7 (
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
wire [5:0] so;

  input [6:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [6:0] dout;


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
dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);




















endmodule



