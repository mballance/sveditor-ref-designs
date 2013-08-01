// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_ard_dp.v
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
module  lsu_ard_dp (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  rngl_lsu_cdbus, 
  tlu_rngf_cdbus, 
  arc_retl_vld_2f, 
  arc_retf_vld_2f, 
  arc_sel_fast, 
  lsu_asi_clken, 
  ard_retl_ctl_1f, 
  ard_retl_vld_1f, 
  ard_retl_rd_1f, 
  ard_retl_tid_1f, 
  ard_retl_ack_1f, 
  ard_retl_exc_1f, 
  ard_retf_ctl_1f, 
  ard_retf_vld_1f, 
  ard_retf_rd_1f, 
  ard_retf_tid_1f, 
  ard_retf_ack_1f, 
  ard_retf_exc_1f, 
  ard_pid_data);
wire stop;
wire se;
wire pce_ov;
wire siclk;
wire soclk;
wire i_rngl_stg1_reg_scanin;
wire i_rngl_stg1_reg_scanout;
wire [64:0] ardl_retl_pkt_1f;
wire i_rngl_stg2_reg_scanin;
wire i_rngl_stg2_reg_scanout;
wire [63:0] ardl_retl_pkt_2f;
wire i_rngf_stg1_reg_scanin;
wire i_rngf_stg1_reg_scanout;
wire [64:0] ardl_retf_pkt_1f;
wire i_rngf_stg2_reg_scanin;
wire i_rngf_stg2_reg_scanout;
wire [63:0] ardl_retf_pkt_2f;
wire [63:0] ardl_pid_data;


// globals
input 		l2clk;
input 		scan_in;
input 		tcu_pce_ov;		// scan signals
input 		tcu_scan_en;
input 		spc_aclk;
input 		spc_bclk;
output		scan_out;


input	[64:0]	rngl_lsu_cdbus; // 64:0, 65 bit control/data bus coming from the ring
                              // 64    - ctl/data            
                              // 63    - valid/hole          
                              // 62    - ack            
                              // 61:60 - 00-ASI, 01-ASR, 10-PR, 11-HPR          
                              // 59    - rd/wrx              
                              // 58:56 - Thread ID           
                              // 55:48 - ASI field           
                              // 47:0  - Virtual Address     

input	[64:0]	tlu_rngf_cdbus; // 65 bit control/data bus from mmu (fast ring)


input		arc_retl_vld_2f; // valid data returned on the ring
input		arc_retf_vld_2f; // valid data returned on the ring

input		arc_sel_fast;    // select fast ring data to be returned to pid

input		lsu_asi_clken;

output		ard_retl_ctl_1f; // Control/Data bit from returning ring
output		ard_retl_vld_1f; // Valid/hold bit on returning ring
output		ard_retl_rd_1f;  // rd/wrx bit on returning ring
output	[2:0]	ard_retl_tid_1f; // Thread id on returning ring
output		ard_retl_ack_1f; // Ack bit returning on ring
output	[1:0]	ard_retl_exc_1f; // Exception status returning on ring

output		ard_retf_ctl_1f; // Control/Data bit from returning ring
output		ard_retf_vld_1f; // Valid/hold bit on returning ring
output		ard_retf_rd_1f;  // rd/wrx bit on returning ring
output	[2:0]	ard_retf_tid_1f; // Thread id on returning ring
output		ard_retf_ack_1f; // Ack bit returning on ring
output	[1:0]	ard_retf_exc_1f; // Exception status returning on ring
    
output	[63:0]	ard_pid_data;   // 63:0  - data being returned to pid

// scan renames
assign stop = 1'b0;
// end scan

lsu_ard_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_4 test_rep0   (
	.din ({tcu_scan_en,tcu_pce_ov,spc_aclk,spc_bclk}),
	.dout({se,pce_ov,siclk,soclk})
);


////////////////////////////////////////////////////////////////
//Return data coming over FAST and LOCAL RING
////////////////////////////////////////////////////////////////
//
//Latch Return packet coming from the ring
// This comes over two cycles. Combine
// into a single packet before returning to pid.
// Data comes simultaneously over the local ring and fast ring, but
// since it comes over 2 cycles and the data is returned to pid in
// 1 cycle, we can sustain simultaneous pipelined transfers on local
// and fast rings.
//

// Local  ring
lsu_ard_dp_msff_macro__stack_66c__width_65 i_rngl_stg1_reg  
(
 .scan_in(i_rngl_stg1_reg_scanin),
 .scan_out(i_rngl_stg1_reg_scanout),
 .clk (l2clk),
 .en  (lsu_asi_clken),
 .din (rngl_lsu_cdbus[64:0]),
 .dout(ardl_retl_pkt_1f[64:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// control bits are sent to arc where they are staged for
// two more cycles.
assign ard_retl_ctl_1f = ardl_retl_pkt_1f[64];
assign ard_retl_vld_1f = ardl_retl_pkt_1f[63];
assign ard_retl_rd_1f =  ardl_retl_pkt_1f[59];
assign ard_retl_tid_1f[2:0] = ardl_retl_pkt_1f[58:56];
assign ard_retl_ack_1f = ardl_retl_pkt_1f[62];
assign ard_retl_exc_1f[1:0] = ardl_retl_pkt_1f[49:48];

// Stage the data being sent to PID in the output register
// This register is loaded only when valid control is
// set in stage2. It implies that valid control came
// in the previous cycle. This can happen at the most
// every other cycle.
lsu_ard_dp_msff_macro__stack_66c__width_64 i_rngl_stg2_reg  
(
 .scan_in(i_rngl_stg2_reg_scanin),
 .scan_out(i_rngl_stg2_reg_scanout),
 .clk (l2clk),
 .en  (arc_retl_vld_2f),
 .din(ardl_retl_pkt_1f[63:0]),
 .dout(ardl_retl_pkt_2f[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// Fast  ring
lsu_ard_dp_msff_macro__stack_66c__width_65 i_rngf_stg1_reg  
(
 .scan_in(i_rngf_stg1_reg_scanin),
 .scan_out(i_rngf_stg1_reg_scanout),
 .clk (l2clk),
 .en  (lsu_asi_clken),
 .din (tlu_rngf_cdbus[64:0]),
 .dout(ardl_retf_pkt_1f[64:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);

// control bits are sent to arc where they are staged for
// two more cycles.
assign ard_retf_ctl_1f = ardl_retf_pkt_1f[64];
assign ard_retf_vld_1f = ardl_retf_pkt_1f[63];
assign ard_retf_rd_1f =  ardl_retf_pkt_1f[59];
assign ard_retf_tid_1f[2:0] = ardl_retf_pkt_1f[58:56];
assign ard_retf_ack_1f = ardl_retf_pkt_1f[62];
assign ard_retf_exc_1f[1:0] = ardl_retf_pkt_1f[49:48];

// Stage the data being sent to PID in the output register
// This register is loaded only when valid control is
// set in stage2. It implies that valid control came
// in the previous cycle. This can happen at the most
// every other cycle.
lsu_ard_dp_msff_macro__stack_66c__width_64 i_rngf_stg2_reg  
(
 .scan_in(i_rngf_stg2_reg_scanin),
 .scan_out(i_rngf_stg2_reg_scanout),
 .clk (l2clk),
 .en  (arc_retf_vld_2f),
 .din(ardl_retf_pkt_1f[63:0]),
 .dout(ardl_retf_pkt_2f[63:0]),
  .se(se),
  .siclk(siclk),
  .soclk(soclk),
  .pce_ov(pce_ov),
  .stop(stop)
);


// Data being sent to PID aligns with the control being sent
// over arc_pid_ctl[6:0] from arc. Mux between the Fast Output
// register and the Local Output register.
lsu_ard_dp_mux_macro__mux_aope__ports_2__stack_66c__width_64 i_ret_pkt_mux  
(
 .din0( ardl_retf_pkt_2f[63:0]),
 .din1( ardl_retl_pkt_2f[63:0]),
 .sel0( arc_sel_fast),
 .dout( ardl_pid_data[63:0])
);

lsu_ard_dp_buff_macro__dbuff_32x__stack_66c__width_64 pid_data_buf  (
	.din (ardl_pid_data[63:0]),
	.dout(ard_pid_data[63:0])
);

// fixscan start:
assign i_rngl_stg1_reg_scanin    = scan_in                  ;
assign i_rngl_stg2_reg_scanin    = i_rngl_stg1_reg_scanout  ;
assign i_rngf_stg1_reg_scanin    = i_rngl_stg2_reg_scanout  ;
assign i_rngf_stg2_reg_scanin    = i_rngf_stg1_reg_scanout  ;
assign scan_out                  = i_rngf_stg2_reg_scanout  ;
// fixscan end:
endmodule



//
//   buff macro
//
//





module lsu_ard_dp_buff_macro__dbuff_16x__rep_1__stack_none__width_4 (
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

module lsu_ard_dp_msff_macro__stack_66c__width_65 (
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













// any PARAMS parms go into naming of macro

module lsu_ard_dp_msff_macro__stack_66c__width_64 (
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

module lsu_ard_dp_mux_macro__mux_aope__ports_2__stack_66c__width_64 (
  din0, 
  din1, 
  sel0, 
  dout);
wire psel0;
wire psel1;

  input [63:0] din0;
  input [63:0] din1;
  input sel0;
  output [63:0] dout;





cl_dp1_penc2_8x  c0_0 (
 .sel0(sel0),
 .psel0(psel0),
 .psel1(psel1)
);

mux2s #(64)  d0_0 (
  .sel0(psel0),
  .sel1(psel1),
  .in0(din0[63:0]),
  .in1(din1[63:0]),
.dout(dout[63:0])
);









  



endmodule


//
//   buff macro
//
//





module lsu_ard_dp_buff_macro__dbuff_32x__stack_66c__width_64 (
  din, 
  dout);
  input [63:0] din;
  output [63:0] dout;






buff #(64)  d0_0 (
.in(din[63:0]),
.out(dout[63:0])
);








endmodule




