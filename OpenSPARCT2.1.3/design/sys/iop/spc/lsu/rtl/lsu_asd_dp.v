// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_asd_dp.v
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
module  lsu_asd_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  pid_asi_pkt, 
  asc_ring_ctl, 
  asc_ring_data, 
  asc_ring_local, 
  asc_ring_fast, 
  lsu_asi_clken, 
  lsu_ring_ctl, 
  asd_p2a_vld, 
  asd_p2a_fast, 
  lsu_rngf_cdbus, 
  lsu_rngl_cdbus, 
  lsu_ifu_ctxt_data, 
  asd_ring_ctl, 
  asd_ring_asi, 
  asd_ring_addr);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire i_pid_pkt_d2_reg_scanin;
wire i_pid_pkt_d2_reg_scanout;
wire [63:0] asdl_data_2f;
wire asdl_rngl_b63;
wire asdl_rngf_b63;
wire [62:0] asdl_ring_pkt;
wire i_rng_pkt_reg_scanin;
wire i_rng_pkt_reg_scanout;
wire asd_rngl_b63;
wire asd_rngf_b63;
wire [62:0] asd_ring_pkt;
wire lsu_rngl_cdbus_b63;
wire lsu_rngf_cdbus_b63;
wire [62:0] lsu_ring_cdbus;


// globals
input 		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;


input	[127:0]	pid_asi_pkt;    // 127:0, 128 bit packet coming from pid to ASI block
				// 127     - Valid           
				// 126     - Fast/Slow       
				// 125:124 - 00-ASI, 01-ASR, 10-PR, 11-HPR          
				// 123     - rd/wrx          
				// 122:120 - Thread ID       
				// 119:112 - ASI Field       
				// 111:64  - Virtual address 
				// 63:0    - Data            

input		asc_ring_ctl;	// ring control bit from asc
input		asc_ring_data;	// ring data bit from asc
input		asc_ring_local;	// local ring sending
input		asc_ring_fast;	// fast ring sending

input		lsu_asi_clken;
input		lsu_ring_ctl;

output		asd_p2a_vld;    // valid packet from pid
output		asd_p2a_fast;   // packet from pid is destined for fast bus


output	[64:0]	lsu_rngf_cdbus;
output	[64:0]	lsu_rngl_cdbus; 

output	[12:0]	lsu_ifu_ctxt_data;

output	[63:56]	asd_ring_ctl;
output	[7:0]	asd_ring_asi;
output	[8:3]	asd_ring_addr;

// scan renames
assign stop = 1'b0;
// end scan

lsu_asd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 test_rep0  (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);

///////////////////////////////////////////////////////////////////
// PROCESS DATA FROM PID AND SEND IT OVER APPROPRIATE RING
///////////////////////////////////////////////////////////////////
//
//
// rename valid and Fast signal coming from the pid and send it to asc
assign asd_p2a_vld = pid_asi_pkt[127];
assign asd_p2a_fast = pid_asi_pkt[126];

// pipe data packet for one more cycle
// ctl and data packets are sent on the ring over two cycles
lsu_asd_dp_msff_macro__stack_66c__width_64 i_pid_pkt_d2_reg  
(
 .scan_in(i_pid_pkt_d2_reg_scanin),
 .scan_out(i_pid_pkt_d2_reg_scanout),
 .clk (l2clk),
 .en  (lsu_asi_clken),
 .din (pid_asi_pkt[63:0]),
 .dout(asdl_data_2f[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Mux between the data and control packet

lsu_asd_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_65 i_rng_pkt_mux  
(
 .din0( {asc_ring_local,  asc_ring_fast,   1'b0,pid_asi_pkt[125:64]}),          
 .din1( {asdl_data_2f[63],asdl_data_2f[63],asdl_data_2f[62:0]}),                     
 .sel0( asc_ring_ctl),
 .sel1( asc_ring_data),
 .dout( {asdl_rngl_b63,asdl_rngf_b63,asdl_ring_pkt[62:0]})
);

lsu_asd_dp_msff_macro__stack_66c__width_65 i_rng_pkt_reg  
(
 .scan_in(i_rng_pkt_reg_scanin),
 .scan_out(i_rng_pkt_reg_scanout),
 .clk (l2clk),
 .en  (lsu_asi_clken),
 .din ({asdl_rngl_b63,asdl_rngf_b63,asdl_ring_pkt[62:0]}),
 .dout({asd_rngl_b63, asd_rngf_b63, asd_ring_pkt[62:0]}),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

assign asd_ring_ctl[63:56] = {asd_rngf_b63,asd_ring_pkt[62:56]};
assign asd_ring_asi[7:0]   = asd_ring_pkt[55:48];
assign asd_ring_addr[8:3]  = asd_ring_pkt[8:3];

lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_66c__width_13 ifu_rngf_buf     (
	.din	(asd_ring_pkt[12:0]),
	.dout	(lsu_ifu_ctxt_data[12:0])
);

// send packet over the ring
lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_66c__width_65 ring_buf      (
	.din	({asd_rngl_b63,  asd_rngf_b63,  asd_ring_pkt[62:0]}),
	.dout	({lsu_rngl_cdbus_b63,lsu_rngf_cdbus_b63,lsu_ring_cdbus[62:0]})
);

lsu_asd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_65 rngf_buf     (
	.din	({lsu_ring_ctl,  lsu_rngf_cdbus_b63,  lsu_ring_cdbus[62:0]}),
	.dout	(lsu_rngf_cdbus[64:0])
);
lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_65 rngl_buf     (
	.din	({lsu_ring_ctl,  lsu_rngl_cdbus_b63,  lsu_ring_cdbus[62:0]}),
	.dout	(lsu_rngl_cdbus[64:0])
);


// fixscan start:
assign i_pid_pkt_d2_reg_scanin   = scan_in                  ;
assign i_rng_pkt_reg_scanin      = i_pid_pkt_d2_reg_scanout ;
assign scan_out                  = i_rng_pkt_reg_scanout    ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_asd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_4 (
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

module lsu_asd_dp_msff_macro__stack_66c__width_64 (
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
wire [62:0] so;

  input [63:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [63:0] dout;


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
dff #(64)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[63:0]),
.si({scan_in,so[62:0]}),
.so({so[62:0],scan_out}),
.q(dout[63:0])
);




















endmodule









// general mux macro for pass-gate and and-or muxes with/wout priority encoders
// also for pass-gate with decoder





// any PARAMS parms go into naming of macro

module lsu_asd_dp_mux_macro__mux_aonpe__ports_2__stack_66c__width_65 (
  din0, 
  sel0, 
  din1, 
  sel1, 
  dout);
wire buffout0;
wire buffout1;

  input [64:0] din0;
  input sel0;
  input [64:0] din1;
  input sel1;
  output [64:0] dout;





cl_dp1_muxbuff2_8x  c0_0 (
 .in0(sel0),
 .in1(sel1),
 .out0(buffout0),
 .out1(buffout1)
);
mux2s #(65)  d0_0 (
  .sel0(buffout0),
  .sel1(buffout1),
  .in0(din0[64:0]),
  .in1(din1[64:0]),
.dout(dout[64:0])
);









  



endmodule






// any PARAMS parms go into naming of macro

module lsu_asd_dp_msff_macro__stack_66c__width_65 (
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
wire [63:0] so;

  input [64:0] din;


  input clk;
  input en;
  input se;
  input scan_in;
  input siclk;
  input soclk;
  input pce_ov;
  input stop;



  output [64:0] dout;


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
dff #(65)  d0_0 (
.l1clk(l1clk),
.siclk(siclk_out),
.soclk(soclk_out),
.d(din[64:0]),
.si({scan_in,so[63:0]}),
.so({so[63:0],scan_out}),
.q(dout[64:0])
);




















endmodule









//
//   buff macro
//
//





module lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_66c__width_13 (
  din, 
  dout);
  input [12:0] din;
  output [12:0] dout;






buff #(13)  d0_0 (
.in(din[12:0]),
.out(dout[12:0])
);








endmodule





//
//   buff macro
//
//





module lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_66c__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule





//
//   buff macro
//
//





module lsu_asd_dp_buff_macro__dbuff_32x__rep_1__stack_none__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule





//
//   buff macro
//
//





module lsu_asd_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_65 (
  din, 
  dout);
  input [64:0] din;
  output [64:0] dout;






buff #(65)  d0_0 (
.in(din[64:0]),
.out(dout[64:0])
);








endmodule




