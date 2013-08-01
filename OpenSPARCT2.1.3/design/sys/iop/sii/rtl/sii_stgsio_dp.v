// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: sii_stgsio_dp.v
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
module sii_stgsio_dp (
  l2clk, 
  sio_sii_opcc_ipcc_dmu_or_deq, 
  sio_sii_opcc_ipcc_dmu_by_deq, 
  sio_sii_opcc_ipcc_niu_or_deq, 
  sio_sii_opcc_ipcc_niu_by_deq, 
  sio_sii_opcc_ipcc_dmu_by_cnt, 
  sio_sii_opcc_ipcc_niu_by_cnt, 
  sio_sii_opcc_ipcc_dmu_or_deq_r, 
  sio_sii_opcc_ipcc_dmu_by_deq_r, 
  sio_sii_opcc_ipcc_niu_or_deq_r, 
  sio_sii_opcc_ipcc_niu_by_deq_r, 
  sio_sii_opcc_ipcc_dmu_by_cnt_r, 
  sio_sii_opcc_ipcc_niu_by_cnt_r, 
  sio_sii_olc0_ilc0_dequeue, 
  sio_sii_olc1_ilc1_dequeue, 
  sio_sii_olc2_ilc2_dequeue, 
  sio_sii_olc3_ilc3_dequeue, 
  sio_sii_olc4_ilc4_dequeue, 
  sio_sii_olc5_ilc5_dequeue, 
  sio_sii_olc6_ilc6_dequeue, 
  sio_sii_olc7_ilc7_dequeue, 
  sio_sii_olc0_ilc0_dequeue_r, 
  sio_sii_olc1_ilc1_dequeue_r, 
  sio_sii_olc2_ilc2_dequeue_r, 
  sio_sii_olc3_ilc3_dequeue_r, 
  sio_sii_olc4_ilc4_dequeue_r, 
  sio_sii_olc5_ilc5_dequeue_r, 
  sio_sii_olc6_ilc6_dequeue_r, 
  sio_sii_olc7_ilc7_dequeue_r, 
  tcu_muxtest, 
  tcu_dectest, 
  tcu_scan_en, 
  scan_in, 
  tcu_aclk, 
  tcu_bclk, 
  tcu_pce_ov, 
  tcu_clk_stop, 
  scan_out);
wire muxtst;
wire test;
wire se;
wire siclk;
wire soclk;
wire pce_ov;
wire stop;
wire dff_sio_sii_opcc_ipcc_dmu_deq_scanin;
wire dff_sio_sii_opcc_ipcc_dmu_deq_scanout;
wire dff_sio_sii_opcc_ipcc_niu_deq_scanin;
wire dff_sio_sii_opcc_ipcc_niu_deq_scanout;
wire dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanin;
wire dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanout;
wire dff_sio_sii_opcc_ipcc_niu_by_cnt_scanin;
wire dff_sio_sii_opcc_ipcc_niu_by_cnt_scanout;
wire dff_sio_sii_olc_ilc_dequeue_scanin;
wire dff_sio_sii_olc_ilc_dequeue_scanout;
		           
				           
   input          l2clk;
input           sio_sii_opcc_ipcc_dmu_or_deq;
input           sio_sii_opcc_ipcc_dmu_by_deq;
input           sio_sii_opcc_ipcc_niu_or_deq;
input           sio_sii_opcc_ipcc_niu_by_deq;
input   [3:0]   sio_sii_opcc_ipcc_dmu_by_cnt;
input   [3:0]   sio_sii_opcc_ipcc_niu_by_cnt;

output           sio_sii_opcc_ipcc_dmu_or_deq_r;
output           sio_sii_opcc_ipcc_dmu_by_deq_r;
output           sio_sii_opcc_ipcc_niu_or_deq_r;
output           sio_sii_opcc_ipcc_niu_by_deq_r;
output   [3:0]   sio_sii_opcc_ipcc_dmu_by_cnt_r;
output   [3:0]   sio_sii_opcc_ipcc_niu_by_cnt_r;

input           sio_sii_olc0_ilc0_dequeue;
input           sio_sii_olc1_ilc1_dequeue;
input           sio_sii_olc2_ilc2_dequeue;
input           sio_sii_olc3_ilc3_dequeue;
input           sio_sii_olc4_ilc4_dequeue;
input           sio_sii_olc5_ilc5_dequeue;
input           sio_sii_olc6_ilc6_dequeue;
input           sio_sii_olc7_ilc7_dequeue;

output           sio_sii_olc0_ilc0_dequeue_r;
output           sio_sii_olc1_ilc1_dequeue_r;
output           sio_sii_olc2_ilc2_dequeue_r;
output           sio_sii_olc3_ilc3_dequeue_r;
output           sio_sii_olc4_ilc4_dequeue_r;
output           sio_sii_olc5_ilc5_dequeue_r;
output           sio_sii_olc6_ilc6_dequeue_r;
output           sio_sii_olc7_ilc7_dequeue_r;

   input          tcu_muxtest;
   input 	  tcu_dectest;
   input 	  tcu_scan_en;
   
   input 	  scan_in;
   input 	  tcu_aclk;
   input 	  tcu_bclk; 
   input 	  tcu_pce_ov;
   input 	  tcu_clk_stop;
   output 	  scan_out;

   ///////////////////////////////////////
   // Scan chain connections            
   ///////////////////////////////////////
   // scan renames
   assign 	  muxtst = tcu_muxtest;
   assign 	  test   = tcu_dectest;
   assign 	  se     = tcu_scan_en;
   
   assign 	  siclk = tcu_aclk;
   assign 	  soclk = tcu_bclk;
   assign 	  pce_ov = tcu_pce_ov;
   assign 	  stop = tcu_clk_stop;
   // end scan


   ///////////////////////////////////////
   //
   // CAPTURE FLOPS for parity, ue and din
   // -- sol0 cycle
   //
   ///////////////////////////////////////   


   sii_stgsio_dpmsff_macro__stack_2c__width_2 dff_sio_sii_opcc_ipcc_dmu_deq   (
	.scan_in(dff_sio_sii_opcc_ipcc_dmu_deq_scanin),
	.scan_out(dff_sio_sii_opcc_ipcc_dmu_deq_scanout),
	.clk  (l2clk),
	.din  ({sio_sii_opcc_ipcc_dmu_or_deq, sio_sii_opcc_ipcc_dmu_by_deq}),
	.dout ({sio_sii_opcc_ipcc_dmu_or_deq_r, sio_sii_opcc_ipcc_dmu_by_deq_r}),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sii_stgsio_dpmsff_macro__stack_2c__width_2 dff_sio_sii_opcc_ipcc_niu_deq   (
	.scan_in(dff_sio_sii_opcc_ipcc_niu_deq_scanin),
	.scan_out(dff_sio_sii_opcc_ipcc_niu_deq_scanout),
	.clk  (l2clk),
	.din  ({sio_sii_opcc_ipcc_niu_or_deq, sio_sii_opcc_ipcc_niu_by_deq}),
	.dout ({sio_sii_opcc_ipcc_niu_or_deq_r, sio_sii_opcc_ipcc_niu_by_deq_r}),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sii_stgsio_dpmsff_macro__stack_4c__width_4 dff_sio_sii_opcc_ipcc_dmu_by_cnt   (
	.scan_in(dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanin),
	.scan_out(dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanout),
	.clk  (l2clk),
	.din  (sio_sii_opcc_ipcc_dmu_by_cnt[3:0]),
	.dout (sio_sii_opcc_ipcc_dmu_by_cnt_r[3:0]),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sii_stgsio_dpmsff_macro__stack_4c__width_4 dff_sio_sii_opcc_ipcc_niu_by_cnt   (
	.scan_in(dff_sio_sii_opcc_ipcc_niu_by_cnt_scanin),
	.scan_out(dff_sio_sii_opcc_ipcc_niu_by_cnt_scanout),
	.clk  (l2clk),
	.din  (sio_sii_opcc_ipcc_niu_by_cnt[3:0]),
	.dout (sio_sii_opcc_ipcc_niu_by_cnt_r[3:0]),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

   sii_stgsio_dpmsff_macro__stack_8c__width_8 dff_sio_sii_olc_ilc_dequeue   (
	.scan_in(dff_sio_sii_olc_ilc_dequeue_scanin),
	.scan_out(dff_sio_sii_olc_ilc_dequeue_scanout),
	.clk  (l2clk),
	.din  ({sio_sii_olc7_ilc7_dequeue,
		sio_sii_olc6_ilc6_dequeue,
		sio_sii_olc5_ilc5_dequeue,
		sio_sii_olc4_ilc4_dequeue,
		sio_sii_olc3_ilc3_dequeue,
		sio_sii_olc2_ilc2_dequeue,
		sio_sii_olc1_ilc1_dequeue,
		sio_sii_olc0_ilc0_dequeue }),
	.dout  ({sio_sii_olc7_ilc7_dequeue_r,
		sio_sii_olc6_ilc6_dequeue_r,
		sio_sii_olc5_ilc5_dequeue_r,
		sio_sii_olc4_ilc4_dequeue_r,
		sio_sii_olc3_ilc3_dequeue_r,
		sio_sii_olc2_ilc2_dequeue_r,
		sio_sii_olc1_ilc1_dequeue_r,
		sio_sii_olc0_ilc0_dequeue_r }),
        .en   (1'b1),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
	);

// fixscan start:
assign dff_sio_sii_opcc_ipcc_dmu_deq_scanin = scan_in                  ;
assign dff_sio_sii_opcc_ipcc_niu_deq_scanin = dff_sio_sii_opcc_ipcc_dmu_deq_scanout;
assign dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanin = dff_sio_sii_opcc_ipcc_niu_deq_scanout;
assign dff_sio_sii_opcc_ipcc_niu_by_cnt_scanin = dff_sio_sii_opcc_ipcc_dmu_by_cnt_scanout;
assign dff_sio_sii_olc_ilc_dequeue_scanin = dff_sio_sii_opcc_ipcc_niu_by_cnt_scanout;
assign scan_out                  = dff_sio_sii_olc_ilc_dequeue_scanout;
// fixscan end:
endmodule // sio_old_dp		           
				           
				           






// any PARAMS parms go into naming of macro

module sii_stgsio_dpmsff_macro__stack_2c__width_2 (
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
wire [0:0] so;

  input [1:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [1:0] dout;


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
dff #(2)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[1:0]),
.si({scan_in,so[0:0]}),
.so({so[0:0],scan_out}),
.q(dout[1:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sii_stgsio_dpmsff_macro__stack_4c__width_4 (
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
wire [2:0] so;

  input [3:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [3:0] dout;


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
dff #(4)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[3:0]),
.si({scan_in,so[2:0]}),
.so({so[2:0],scan_out}),
.q(dout[3:0])
);




















endmodule













// any PARAMS parms go into naming of macro

module sii_stgsio_dpmsff_macro__stack_8c__width_8 (
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








