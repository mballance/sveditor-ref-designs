// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: lsu_arc_ctl.v
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
module  lsu_arc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  tcu_scan_en, 
  spc_aclk, 
  spc_bclk, 
  scan_out, 
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
  lsu_asi_clken, 
  tlu_rngf_cdbus_error, 
  arc_retl_vld_2f, 
  arc_retf_vld_2f, 
  arc_sel_fast, 
  arc_pid_ctl_2f, 
  lsu_priv_action_g, 
  lsu_tid_g);
wire se;
wire pce_ov;
wire stop;
wire siclk;
wire soclk;
wire l1clk_pm1;
wire arcl_retl_vld_1;
wire [1:0] arcl_retl_exc_1;
wire rngl_stg2_reg_scanin;
wire rngl_stg2_reg_scanout;
wire [1:0] arcl_retl_exc_2f;
wire arcl_retl_rd_2f;
wire [2:0] arcl_retl_tid_2f;
wire [6:0] arcl_pidl_ctl_2;
wire clr_local;
wire [6:0] arcl_pidl_ctl_3f;
wire rngl_stg3_reg_scanin;
wire rngl_stg3_reg_scanout;
wire arcl_retf_vld_1;
wire [1:0] arcl_retf_exc_1;
wire rngf_stg2_reg_scanin;
wire rngf_stg2_reg_scanout;
wire [1:0] arcl_retf_exc_2f;
wire arcl_retf_rd_2f;
wire [2:0] arcl_retf_tid_2f;
wire rngf_error_2f;
wire [6:0] arcl_pidf_ctl_2;
wire clr_fast;
wire [6:0] arcl_pidf_ctl_3f;
wire rngf_stg3_reg_scanin;
wire rngf_stg3_reg_scanout;
wire arc_sel_fast_2f;
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

input		ard_retl_ctl_1f; // Control/Data bit from returning ring
input		ard_retl_vld_1f; // Valid/hold bit on returning ring
input		ard_retl_rd_1f;  // rd/wrx bit on returning ring
input	[2:0]	ard_retl_tid_1f; // Thread id on returning ring
input		ard_retl_ack_1f; // Ack bit returning on ring
input	[1:0]	ard_retl_exc_1f; // Exception status returning on ring

input		ard_retf_ctl_1f; // Control/Data bit from returning ring
input		ard_retf_vld_1f; // Valid/hold bit on returning ring
input		ard_retf_rd_1f;  // rd/wrx bit on returning ring
input	[2:0]   ard_retf_tid_1f; // Thread id on returning ring
input		ard_retf_ack_1f; // Ack bit returning on ring
input	[1:0]   ard_retf_exc_1f; // Exception status returning on ring

input		lsu_asi_clken;

input		tlu_rngf_cdbus_error;

output		arc_retl_vld_2f; // Valid data returned on the ring
output		arc_retf_vld_2f; // Valid data returned on the ring
output		arc_sel_fast;    // select fast ring data

output	[6:0]	arc_pid_ctl_2f;

output		lsu_priv_action_g;
output	[2:0]	lsu_tid_g;

// scan renames
assign se = tcu_scan_en;
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

////////////////////////////////////////////////////////
lsu_arc_ctl_l1clkhdr_ctl_macro clkgen 
  (
   .l2clk(l2clk),
   .l1en (lsu_asi_clken ),
   .l1clk(l1clk_pm1),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se));
////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////
// Return data coming from the ring. 
// This comes over two cycles. Combine
// into a single packet before returning.

// local ring

assign arcl_retl_vld_1 = ard_retl_ctl_1f & ard_retl_vld_1f;

// clear exceptions if no ack bit
assign arcl_retl_exc_1[1:0] = {ard_retl_ack_1f & ard_retl_exc_1f[1],
                               ard_retl_ack_1f & ard_retl_exc_1f[0]};


// Another staging register for the control bits.
lsu_arc_ctl_msff_ctl_macro__width_7 rngl_stg2_reg 
(
 .scan_in(rngl_stg2_reg_scanin),
 .scan_out(rngl_stg2_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  ({arcl_retl_vld_1,arcl_retl_exc_1[1:0],ard_retl_rd_1f,ard_retl_tid_1f[2:0]}),
 .dout ({arc_retl_vld_2f,arcl_retl_exc_2f[1:0],arcl_retl_rd_2f,arcl_retl_tid_2f[2:0]}),
  .siclk(siclk),
  .soclk(soclk)
 );

// stage the control bits for 1 more cycle to align it with output register 
// which holds data being returned to pid
// This is the output register and is loaded only when valid
// control is set in stage2. This can happen at the most every
// other cycle.
assign arcl_pidl_ctl_2[6:0] = ({7 { arc_retl_vld_2f}} & {arc_retl_vld_2f,arcl_retl_exc_2f[1:0],arcl_retl_rd_2f,arcl_retl_tid_2f[2:0]}) |
                              ({7 {~arc_retl_vld_2f & ~clr_local}} & arcl_pidl_ctl_3f[6:0]);

lsu_arc_ctl_msff_ctl_macro__width_7 rngl_stg3_reg 
(
 .scan_in(rngl_stg3_reg_scanin),
 .scan_out(rngl_stg3_reg_scanout),
 .l1clk(l1clk_pm1),
 .din (arcl_pidl_ctl_2[6:0]),
 .dout(arcl_pidl_ctl_3f[6:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

// Fast ring
assign arcl_retf_vld_1 = ard_retf_ctl_1f & ard_retf_vld_1f;
// clear exceptions if no ack bit
assign arcl_retf_exc_1[1:0] = {ard_retf_ack_1f & ard_retf_exc_1f[1],
                               ard_retf_ack_1f & ard_retf_exc_1f[0]};


// Another staging register for the control bits.
lsu_arc_ctl_msff_ctl_macro__width_8 rngf_stg2_reg 
(
 .scan_in(rngf_stg2_reg_scanin),
 .scan_out(rngf_stg2_reg_scanout),
 .l1clk(l1clk_pm1),
 .din  ({arcl_retf_vld_1,arcl_retf_exc_1[1:0],ard_retf_rd_1f,ard_retf_tid_1f[2:0],tlu_rngf_cdbus_error}),
 .dout ({arc_retf_vld_2f,arcl_retf_exc_2f[1:0],arcl_retf_rd_2f,arcl_retf_tid_2f[2:0],rngf_error_2f}),
  .siclk(siclk),
  .soclk(soclk)
 );

// stage the control bits for 1 more cycle to align it with
// data being returned to pid.
// This is the output register and is loaded only when valid
// control is set in stage2. This can happen at the most every
// other cycle.
// Set Fast bit (bit 4)

assign arcl_pidf_ctl_2[6:0] =
   ({7 { arc_retf_vld_2f}}              & {arc_retf_vld_2f,arcl_retf_exc_2f[1],(arcl_retf_exc_2f[0] | rngf_error_2f),
                                           arcl_retf_rd_2f,arcl_retf_tid_2f[2:0]}) |
   ({7 {~arc_retf_vld_2f & !clr_fast}}  & arcl_pidf_ctl_3f[6:0]);

lsu_arc_ctl_msff_ctl_macro__width_7 rngf_stg3_reg 
(
 .scan_in(rngf_stg3_reg_scanin),
 .scan_out(rngf_stg3_reg_scanout),
 .l1clk(l1clk_pm1),
 .din (arcl_pidf_ctl_2[6:0]),
 .dout(arcl_pidf_ctl_3f[6:0]),
  .siclk(siclk),
  .soclk(soclk)
 );

// mux between the two output registers (fast and local). Give priority to the fast register.
// Once valid pkt is sent to pid, clear the corresponding output register.
// sel_fast if fast packet is valid (bit 7)

assign arc_sel_fast_2f = arcl_pidf_ctl_2[6];
assign arc_pid_ctl_2f[6:0] = arc_sel_fast_2f ? arcl_pidf_ctl_2[6:0]: arcl_pidl_ctl_2[6:0];

assign arc_sel_fast = arcl_pidf_ctl_3f[6];
assign clr_fast = arc_sel_fast;
assign clr_local = !arc_sel_fast & arcl_pidl_ctl_3f[6];

assign lsu_priv_action_g = arc_pid_ctl_2f[6] & arc_pid_ctl_2f[5] & ~arc_pid_ctl_2f[4];
assign lsu_tid_g[2:0] = arc_pid_ctl_2f[2:0];

lsu_arc_ctl_spare_ctl_macro spares (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk_pm1),
  .siclk(siclk),
  .soclk(soclk)
);

supply0 vss;
supply1 vdd;
// fixscan start:
assign rngl_stg2_reg_scanin      = scan_in                  ;
assign rngl_stg3_reg_scanin      = rngl_stg2_reg_scanout    ;
assign rngf_stg2_reg_scanin      = rngl_stg3_reg_scanout    ;
assign rngf_stg3_reg_scanin      = rngf_stg2_reg_scanout    ;
assign spares_scanin             = rngf_stg3_reg_scanout    ;
assign scan_out                  = spares_scanout           ;
// fixscan end:
endmodule







// any PARAMS parms go into naming of macro

module lsu_arc_ctl_l1clkhdr_ctl_macro (
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

module lsu_arc_ctl_msff_ctl_macro__width_7 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [6:0] fdin;
wire [5:0] so;

  input [6:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [6:0] dout;
  output scan_out;
assign fdin[6:0] = din[6:0];






dff #(7)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[6:0]),
.si({scan_in,so[5:0]}),
.so({so[5:0],scan_out}),
.q(dout[6:0])
);












endmodule













// any PARAMS parms go into naming of macro

module lsu_arc_ctl_msff_ctl_macro__width_8 (
  din, 
  l1clk, 
  scan_in, 
  siclk, 
  soclk, 
  dout, 
  scan_out);
wire [7:0] fdin;
wire [6:0] so;

  input [7:0] din;
  input l1clk;
  input scan_in;


  input siclk;
  input soclk;

  output [7:0] dout;
  output scan_out;
assign fdin[7:0] = din[7:0];






dff #(8)  d0_0 (
.l1clk(l1clk),
.siclk(siclk),
.soclk(soclk),
.d(fdin[7:0]),
.si({scan_in,so[6:0]}),
.so({so[6:0],scan_out}),
.q(dout[7:0])
);












endmodule









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module lsu_arc_ctl_spare_ctl_macro (
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

