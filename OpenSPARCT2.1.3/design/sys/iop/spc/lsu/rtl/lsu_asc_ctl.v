// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_asc_ctl.v
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
module  lsu_asc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
  asd_p2a_vld, 
  asd_p2a_fast, 
  asd_ring_ctl, 
  asd_ring_asi, 
  asd_ring_addr, 
  lsu_asi_clken, 
  sbc_pid_kill_store_p4_, 
  pic_st_asi_p4, 
  asc_ring_ctl, 
  asc_ring_data, 
  asc_ring_local, 
  asc_ring_fast, 
  asc_wr_p0ctxt, 
  asc_wr_p1ctxt, 
  asc_wr_s0ctxt, 
  asc_wr_s1ctxt, 
  asc_wr_pid, 
  asc_wrasi, 
  asc_pid_ack, 
  lsu_ring_ctl, 
  lsu_ifu_tid_w, 
  lsu_ifu_wr_p0ctxt, 
  lsu_ifu_wr_p1ctxt, 
  lsu_ifu_wr_pid);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk_pm1;
wire pid_ackl_c;
wire ascl_vld_1f;
wire hole_pend_f;
wire pid_ackf_c;
wire hole_vld_c;
wire ascl_vld_c;
wire ascl_vld_1_scanin;
wire ascl_vld_1_scanout;
wire asc_rngl_ctl_c;
wire asc_rngf_ctl_c;
wire asc_ring_ctl_c;
wire pid_ack_scanin;
wire pid_ack_scanout;
wire rngf_ctl;
wire rngl_ctl;
wire [3:0] count_c;
wire [3:0] count_f;
wire hole_count_scanin;
wire hole_count_scanout;
wire hole_pend_c;
wire create_tlb_hole;
wire hole_pend_state_scanin;
wire hole_pend_state_scanout;
wire rngf_unused;
wire asi_write;
wire asr_write;
wire asi_p0ctxt_wr;
wire asi_p1ctxt_wr;
wire asi_s0ctxt_wr;
wire asi_s1ctxt_wr;
wire asi_pid_wr;
wire wrasi;
wire dff_asr_wr_scanin;
wire dff_asr_wr_scanout;
wire [2:0] asr_wr_tid_2;
wire asi_p0ctxt_wr_2;
wire asi_p1ctxt_wr_2;
wire asi_s0ctxt_wr_2;
wire asi_s1ctxt_wr_2;
wire asi_pid_wr_2;
wire wrasi_2;
wire spares_scanin;
wire spares_scanout;


// globals
input		l2clk;
input		scan_in;
input		tcu_pce_ov;		// scan signals
input		tcu_scan_en;
input		spc_aclk;
input		spc_bclk;
output		scan_out;

input		asd_p2a_vld;    // valid packet from pid
input		asd_p2a_fast;   // packet from pid is destined for fast bus

input	[63:56]	asd_ring_ctl;   // Must look for DTLB writes to create hole
input	[7:0]	asd_ring_asi;
input	[8:3]	asd_ring_addr;
input		lsu_asi_clken;

input		sbc_pid_kill_store_p4_;
input		pic_st_asi_p4;

output		asc_ring_ctl;    // ring control to asd
output		asc_ring_data;   // ring data to asd
output		asc_ring_local;  // local ring to asd
output		asc_ring_fast;   // fast ring to asd

output	[7:0]	asc_wr_p0ctxt;
output	[7:0]	asc_wr_p1ctxt;
output	[7:0]	asc_wr_s0ctxt;
output	[7:0]	asc_wr_s1ctxt;
output	[7:0]	asc_wr_pid;
output	[7:0]	asc_wrasi;


output		asc_pid_ack;    // packet acknowledge to pid

output          lsu_ring_ctl;

output	[2:0]	lsu_ifu_tid_w;
output		lsu_ifu_wr_p0ctxt;
output		lsu_ifu_wr_p1ctxt;
output		lsu_ifu_wr_pid;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

////////////////////////////////////////////////////////
lsu_asc_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk(l2clk),
   .l1en (lsu_asi_clken ),
   .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
// generate an ack if a valid pid packet received and
// not launching the first cycle of a packet on the ring,
// and not in middle of a pending hole.

// generate a hole packet if a pending hole and
// not launching the first cycle of a packet on the ring.

assign pid_ackl_c = (asd_p2a_vld & !asd_p2a_fast & !ascl_vld_1f & !hole_pend_f);
assign pid_ackf_c = (asd_p2a_vld &  asd_p2a_fast & !ascl_vld_1f & !hole_pend_f);

// generate a hole every other cycle unless a pid_ack is being sent
assign hole_vld_c = ~(pid_ackl_c | pid_ackf_c) & !ascl_vld_1f;

// vld_c indicates a ctl pkt. Every other pkt is a control pkt (either a hole or an ack)
assign ascl_vld_c = ~ascl_vld_1f;

// register the first cycle valid signal
lsu_asc_ctl_msff_ctl_macro__width_1 ascl_vld_1 
(
 .scan_in(ascl_vld_1_scanin),
 .scan_out(ascl_vld_1_scanout),
 .l1clk(l1clk_pm1),
 .din  (ascl_vld_c),
 .dout (ascl_vld_1f),
  .siclk(siclk),
  .soclk(soclk)
 );

assign lsu_ring_ctl = ascl_vld_1f;


assign asc_pid_ack = pid_ackl_c | pid_ackf_c;

assign asc_rngl_ctl_c = ascl_vld_c & pid_ackl_c;
assign asc_rngf_ctl_c = ascl_vld_c & pid_ackf_c;
assign asc_ring_ctl_c = ascl_vld_c & (pid_ackf_c | pid_ackl_c);

assign asc_ring_ctl = asc_ring_ctl_c;

lsu_asc_ctl_msff_ctl_macro__width_3 pid_ack 
(
 .scan_in(pid_ack_scanin),
 .scan_out(pid_ack_scanout),
 .l1clk(l1clk_pm1),
 .din  ({asc_ring_ctl_c,asc_rngf_ctl_c,asc_rngl_ctl_c}),
 .dout ({asc_ring_data ,rngf_ctl,      rngl_ctl      }),
  .siclk(siclk),
  .soclk(soclk)
 );

assign asc_ring_local = (asc_rngl_ctl_c | rngl_ctl) & (sbc_pid_kill_store_p4_ | ~pic_st_asi_p4);
assign asc_ring_fast  = (asc_rngf_ctl_c | rngf_ctl) & (sbc_pid_kill_store_p4_ | ~pic_st_asi_p4);

/////////////////////////////////////////////////////////////
// HOLE INSERTION
/////////////////////////////////////////////////////////////
// Logic to insert hole every 16 cycles.
// Duplicated for fast and local rings
// 4 bit counter to insert a hole every 16 cycles
// This logic exists for local and fast rings
assign count_c[3:0] = count_f[3:0] + 4'b1;

lsu_asc_ctl_msff_ctl_macro__width_4 hole_count 
(
 .scan_in(hole_count_scanin),
 .scan_out(hole_count_scanout),
 .l1clk(l1clk_pm1),
 .din  (count_c[3:0]),
 .dout (count_f[3:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

// set state to indicate pending hole, clear when hole inserted

assign hole_pend_c = ((count_f[3:0] == 4'b0) | hole_pend_f | create_tlb_hole) & !hole_vld_c;

lsu_asc_ctl_msff_ctl_macro__width_1 hole_pend_state 
(
 .scan_in(hole_pend_state_scanin),
 .scan_out(hole_pend_state_scanout),
 .l1clk(l1clk_pm1),
 .din  (hole_pend_c),
 .dout (hole_pend_f),
  .siclk(siclk),
  .soclk(soclk)
 );

////////////////////////////////////////////////////////////
// There is a special case in which a hole must be created on the
// fast ring.  When a write to the DTLB_DATA_IN_REG goes out on the
// ring, a hold needs to be created afterwards to ensure that the
// bus is free to accomodate the tlb write.  (The MMU sends tlb
// reload information over the ASI bus.)

assign create_tlb_hole = rngf_ctl &	 				// ctl pkt
                         asd_ring_ctl[63] &				// valid
                         ~asd_ring_ctl[61] & ~asd_ring_ctl[60] &	// type=ASI
                         ~asd_ring_ctl[59] &				// write
                         ((asd_ring_asi[7:0] == 8'h5c) |		// ASI=DTLB_DATA_IN_REG
                          (asd_ring_asi[7:0] == 8'h5d) |		// ASI=DTLB_DATA_ACCESS_REG
                          (asd_ring_asi[7:0] == 8'h5f));		// ASI=DMMU_DEMAP

assign rngf_unused = asd_ring_ctl[62];


////////////////////////////////////////////////////////////
// Interface for ASI registers located in the LSU

assign asi_write = rngf_ctl & asd_ring_ctl[63] & ~asd_ring_ctl[61] & ~asd_ring_ctl[60] & ~asd_ring_ctl[59];
assign asr_write = rngf_ctl & asd_ring_ctl[63] & ~asd_ring_ctl[61] & asd_ring_ctl[60] & ~asd_ring_ctl[59];
assign asi_p0ctxt_wr = asi_write & (asd_ring_asi[7:0] == 8'h21) & (asd_ring_addr[8:3] == 6'b000001);
assign asi_p1ctxt_wr = asi_write & (asd_ring_asi[7:0] == 8'h21) & (asd_ring_addr[7:3] == 5'b00001);
assign asi_s0ctxt_wr = asi_write & (asd_ring_asi[7:0] == 8'h21) & (asd_ring_addr[8:3] == 6'b000010);
assign asi_s1ctxt_wr = asi_write & (asd_ring_asi[7:0] == 8'h21) & (asd_ring_addr[7:3] == 5'b00010);
assign asi_pid_wr    = asi_write & (asd_ring_asi[7:0] == 8'h58) &  asd_ring_addr[7];
assign wrasi         = asr_write & (asd_ring_asi[4:0] == 5'b00011);

lsu_asc_ctl_msff_ctl_macro__width_9 dff_asr_wr  (
  .scan_in(dff_asr_wr_scanin),
  .scan_out(dff_asr_wr_scanout),
  .l1clk(l1clk_pm1),
  .din	({asd_ring_ctl[58:56], asi_p0ctxt_wr,  asi_p1ctxt_wr,  asi_s0ctxt_wr,  asi_s1ctxt_wr,  asi_pid_wr,  wrasi}),
  .dout	({asr_wr_tid_2[2:0],    asi_p0ctxt_wr_2,asi_p1ctxt_wr_2,asi_s0ctxt_wr_2,asi_s1ctxt_wr_2,asi_pid_wr_2,wrasi_2}),
  .siclk(siclk),
  .soclk(soclk)
);

assign lsu_ifu_tid_w[2:0] = asr_wr_tid_2[2:0]; 
assign lsu_ifu_wr_p0ctxt  = asi_p0ctxt_wr_2;
assign lsu_ifu_wr_p1ctxt  = asi_p1ctxt_wr_2;
assign lsu_ifu_wr_pid     = asi_pid_wr_2;

assign asc_wr_p0ctxt[0] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wr_p0ctxt[1] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wr_p0ctxt[2] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wr_p0ctxt[3] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wr_p0ctxt[4] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wr_p0ctxt[5] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wr_p0ctxt[6] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wr_p0ctxt[7] = asi_p0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd7);

assign asc_wr_p1ctxt[0] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wr_p1ctxt[1] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wr_p1ctxt[2] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wr_p1ctxt[3] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wr_p1ctxt[4] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wr_p1ctxt[5] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wr_p1ctxt[6] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wr_p1ctxt[7] = asi_p1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd7);

assign asc_wr_s0ctxt[0] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wr_s0ctxt[1] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wr_s0ctxt[2] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wr_s0ctxt[3] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wr_s0ctxt[4] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wr_s0ctxt[5] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wr_s0ctxt[6] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wr_s0ctxt[7] = asi_s0ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd7);

assign asc_wr_s1ctxt[0] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wr_s1ctxt[1] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wr_s1ctxt[2] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wr_s1ctxt[3] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wr_s1ctxt[4] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wr_s1ctxt[5] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wr_s1ctxt[6] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wr_s1ctxt[7] = asi_s1ctxt_wr_2 & (asr_wr_tid_2[2:0] == 3'd7);

assign asc_wr_pid[0] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wr_pid[1] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wr_pid[2] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wr_pid[3] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wr_pid[4] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wr_pid[5] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wr_pid[6] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wr_pid[7] = asi_pid_wr_2 & (asr_wr_tid_2[2:0] == 3'd7);

assign asc_wrasi[0] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd0);
assign asc_wrasi[1] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd1);
assign asc_wrasi[2] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd2);
assign asc_wrasi[3] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd3);
assign asc_wrasi[4] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd4);
assign asc_wrasi[5] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd5);
assign asc_wrasi[6] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd6);
assign asc_wrasi[7] = wrasi_2 & (asr_wr_tid_2[2:0] == 3'd7);

lsu_asc_ctl_spare_ctl_macro spares (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign ascl_vld_1_scanin         = scan_in                  ;
assign pid_ack_scanin            = ascl_vld_1_scanout       ;
assign hole_count_scanin         = pid_ack_scanout          ;
assign hole_pend_state_scanin    = hole_count_scanout       ;
assign dff_asr_wr_scanin         = hole_pend_state_scanout  ;
assign spares_scanin             = dff_asr_wr_scanout       ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module lsu_asc_ctl_l1clkhdr_ctl_macro (
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













// any PARAMS parms go into naming of macro

module lsu_asc_ctl_msff_ctl_macro__width_1 (
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

module lsu_asc_ctl_msff_ctl_macro__width_3 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [2:0] fdin;
wire [1:0] so;

  input [2:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [2:0] dout;
  output scan_out;
assign fdin[2:0] = din[2:0];






dff #(3)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[2:0]),
.si({scan_in,so[1:0]}),
.so({so[1:0],scan_out}),
.q(dout[2:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_asc_ctl_msff_ctl_macro__width_4 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [3:0] fdin;
wire [2:0] so;

  input [3:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [3:0] dout;
  output scan_out;
assign fdin[3:0] = din[3:0];






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

module lsu_asc_ctl_msff_ctl_macro__width_9 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [8:0] fdin;
wire [7:0] so;

  input [8:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [8:0] dout;
  output scan_out;
assign fdin[8:0] = din[8:0];






dff #(9)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[8:0]),
.si({scan_in,so[7:0]}),
.so({so[7:0],scan_out}),
.q(dout[8:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_asc_ctl_spare_ctl_macro (
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  scan_out);
wire si_0;
wire so_0;
wire spare0_flop_unused;
wire spare0_buf_32x_unused;
wire spare0_nand3_8x_unused;
wire spare0_inv_8x_unused;
wire spare0_aoi22_4x_unused;
wire spare0_buf_8x_unused;
wire spare0_oai22_4x_unused;
wire spare0_inv_16x_unused;
wire spare0_nand2_16x_unused;
wire spare0_nor3_4x_unused;
wire spare0_nand2_8x_unused;
wire spare0_buf_16x_unused;
wire spare0_nor2_16x_unused;
wire spare0_inv_32x_unused;


input		l1clk;
input		scan_in;
input		siclk;
input		soclk;
output		scan_out;

cl_sc1_msff_8x spare0_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_0),
                               .so(so_0),
                               .d(1'b0),
                               .q(spare0_flop_unused));
assign si_0 = scan_in;

cl_u1_buf_32x   spare0_buf_32x (.in(1'b1),
                                   .out(spare0_buf_32x_unused));
cl_u1_nand3_8x spare0_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare0_nand3_8x_unused));
cl_u1_inv_8x    spare0_inv_8x (.in(1'b1),
                                  .out(spare0_inv_8x_unused));
cl_u1_aoi22_4x spare0_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_aoi22_4x_unused));
cl_u1_buf_8x    spare0_buf_8x (.in(1'b1),
                                  .out(spare0_buf_8x_unused));
cl_u1_oai22_4x spare0_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare0_oai22_4x_unused));
cl_u1_inv_16x   spare0_inv_16x (.in(1'b1),
                                   .out(spare0_inv_16x_unused));
cl_u1_nand2_16x spare0_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare0_nand2_16x_unused));
cl_u1_nor3_4x spare0_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare0_nor3_4x_unused));
cl_u1_nand2_8x spare0_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare0_nand2_8x_unused));
cl_u1_buf_16x   spare0_buf_16x (.in(1'b1),
                                   .out(spare0_buf_16x_unused));
cl_u1_nor2_16x spare0_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare0_nor2_16x_unused));
cl_u1_inv_32x   spare0_inv_32x (.in(1'b1),
                                   .out(spare0_inv_32x_unused));
assign scan_out = so_0;



endmodule

