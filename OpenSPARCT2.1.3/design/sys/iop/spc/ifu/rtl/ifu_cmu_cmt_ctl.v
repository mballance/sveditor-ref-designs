// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: ifu_cmu_cmt_ctl.v
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
module ifu_cmu_cmt_ctl (
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  l2clk, 
  ftu_cmiss, 
  ftu_redirect, 
  mct_fill_complete, 
  ftu_inv_req, 
  lsc_l15_valid, 
  cmu_data_ready, 
  cmu_has_dup_miss, 
  mct_rst_dupmiss, 
  mdp_mbhit_q, 
  mct_ignore_cmiss, 
  csm_valid_req, 
  cmu_null_st, 
  cmu_dupmiss_st, 
  cmu_req_st, 
  cmu_canleave_st, 
  scan_out) ;
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire cmu_mbhit_c;
wire csm0_scanin;
wire csm0_scanout;
wire csm1_scanin;
wire csm1_scanout;
wire csm2_scanin;
wire csm2_scanout;
wire csm3_scanin;
wire csm3_scanout;
wire csm4_scanin;
wire csm4_scanout;
wire csm5_scanin;
wire csm5_scanout;
wire csm6_scanin;
wire csm6_scanout;
wire csm7_scanin;
wire csm7_scanout;
wire spares_scanin;
wire spares_scanout;


input scan_in;
input tcu_pce_ov;		// scan signals
input spc_aclk;
input spc_bclk;
input tcu_scan_en ;
input l2clk;

input [7:0] ftu_cmiss;
input [7:0] ftu_redirect;
input [7:0] mct_fill_complete;
input [7:0] ftu_inv_req;

input [7:0] lsc_l15_valid;

input [7:0] cmu_data_ready;
input [7:0] cmu_has_dup_miss;

input [7:0] mct_rst_dupmiss;
input [7:0] mdp_mbhit_q;
input       mct_ignore_cmiss;

output [7:0] csm_valid_req;
//output [7:0] cmu_cmiss_is_sent;
output [7:0] cmu_null_st;
output [7:0] cmu_dupmiss_st;
output [7:0] cmu_req_st;
output [7:0] cmu_canleave_st;
   
output scan_out;

// scan renames
assign pce_ov = tcu_pce_ov;
assign stop = 1'b0;
assign se = tcu_scan_en ;
assign siclk = spc_aclk;
assign soclk = spc_bclk;
// end scan

///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
ifu_cmu_cmt_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1 ),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);

assign cmu_mbhit_c = |(mdp_mbhit_q[7:0]);

/*
// ifu_cmu_csm_ctl AUTO_TEMPLATE
 (
.ftu_inv_req(ftu_inv_req[@]),                      
.ftu_cmiss(ftu_cmiss[@]),
.lsc_l15_valid(lsc_l15_valid[@]),
.mct_fill_complete(mct_fill_complete[@]),
.cmu_data_ready(cmu_data_ready[@]),
.cmu_has_dup_miss(cmu_has_dup_miss[@]),
.cmu_mbhit_c(cmu_mbhit_c),
.ftu_redirect(ftu_redirect[@]),
.mct_rst_dupmiss(mct_rst_dupmiss[@]),
.mdp_mbhit_q(mdp_mbhit_q[@]),
.csm_valid_req(csm_valid_req[@]),
.cmu_null_st(cmu_null_st[@]),
.cmu_req_st(cmu_req_st[@]),
.cmu_canleave_st(cmu_canleave_st[@]),
.cmu_dupmiss_st(cmu_dupmiss_st[@]),
 );
 */

ifu_cmu_csm_ctl csm0 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[0]),        // Templated
                      .cmu_null_st(cmu_null_st[0]),  // Templated
                      .cmu_req_st(cmu_req_st[0]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[0]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[0]),  // Templated
                      // Inputs
                      .scan_in(csm0_scanin),
                      .scan_out(csm0_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[0]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[0]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[0]),        // Templated
                      .mct_fill_complete(mct_fill_complete[0]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[0]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[0]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[0]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[0]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[0]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm1 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[1]),        // Templated
                      .cmu_null_st(cmu_null_st[1]),  // Templated
                      .cmu_req_st(cmu_req_st[1]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[1]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[1]),  // Templated
                      // Inputs
                      .scan_in(csm1_scanin),
                      .scan_out(csm1_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[1]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[1]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[1]),        // Templated
                      .mct_fill_complete(mct_fill_complete[1]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[1]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[1]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[1]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[1]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[1]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm2 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[2]),        // Templated
                      .cmu_null_st(cmu_null_st[2]),  // Templated
                      .cmu_req_st(cmu_req_st[2]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[2]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[2]),  // Templated
                      // Inputs
                      .scan_in(csm2_scanin),
                      .scan_out(csm2_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[2]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[2]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[2]),        // Templated
                      .mct_fill_complete(mct_fill_complete[2]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[2]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[2]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[2]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[2]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[2]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm3 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[3]),        // Templated
                      .cmu_null_st(cmu_null_st[3]),  // Templated
                      .cmu_req_st(cmu_req_st[3]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[3]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[3]),  // Templated
                      // Inputs
                      .scan_in(csm3_scanin),
                      .scan_out(csm3_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[3]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[3]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[3]),        // Templated
                      .mct_fill_complete(mct_fill_complete[3]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[3]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[3]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[3]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[3]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[3]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm4 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[4]),        // Templated
                      .cmu_null_st(cmu_null_st[4]),  // Templated
                      .cmu_req_st(cmu_req_st[4]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[4]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[4]),  // Templated
                      // Inputs
                      .scan_in(csm4_scanin),
                      .scan_out(csm4_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[4]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[4]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[4]),        // Templated
                      .mct_fill_complete(mct_fill_complete[4]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[4]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[4]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[4]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[4]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[4]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm5 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[5]),        // Templated
                      .cmu_null_st(cmu_null_st[5]),  // Templated
                      .cmu_req_st(cmu_req_st[5]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[5]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[5]),  // Templated
                      // Inputs
                      .scan_in(csm5_scanin),
                      .scan_out(csm5_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[5]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[5]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[5]),        // Templated
                      .mct_fill_complete(mct_fill_complete[5]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[5]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[5]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[5]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[5]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[5]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm6 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[6]),        // Templated
                      .cmu_null_st(cmu_null_st[6]),  // Templated
                      .cmu_req_st(cmu_req_st[6]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[6]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[6]),  // Templated
                      // Inputs
                      .scan_in(csm6_scanin),
                      .scan_out(csm6_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[6]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[6]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[6]),        // Templated
                      .mct_fill_complete(mct_fill_complete[6]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[6]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[6]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[6]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[6]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[6]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));

ifu_cmu_csm_ctl csm7 (
                      /*AUTOINST*/
                      // Outputs
                      .csm_valid_req      (csm_valid_req[7]),        // Templated
                      .cmu_null_st(cmu_null_st[7]),  // Templated
                      .cmu_req_st(cmu_req_st[7]),  // Templated
                      .cmu_canleave_st(cmu_canleave_st[7]),  // Templated
                      .cmu_dupmiss_st(cmu_dupmiss_st[7]),  // Templated
                      // Inputs
                      .scan_in(csm7_scanin),
                      .scan_out(csm7_scanout),
                      .l1clk            (l1clk),
                      .spc_aclk     (spc_aclk),
                      .spc_bclk     (spc_bclk),
                      .ftu_cmiss        (ftu_cmiss[7]),          // Templated
                      .ftu_inv_req      (ftu_inv_req[7]),        // Templated
                      .lsc_l15_valid      (lsc_l15_valid[7]),        // Templated
                      .mct_fill_complete(mct_fill_complete[7]),  // Templated
                      .cmu_data_ready   (cmu_data_ready[7]),     // Templated
                      .cmu_has_dup_miss (cmu_has_dup_miss[7]),   // Templated
                      .cmu_mbhit_c      (cmu_mbhit_c),           // Templated
                      .ftu_redirect     (ftu_redirect[7]),       // Templated
                      .mct_rst_dupmiss  (mct_rst_dupmiss[7]),    // Templated
                      .mdp_mbhit_q      (mdp_mbhit_q[7]),        // Templated
                      .mct_ignore_cmiss (mct_ignore_cmiss));


////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
ifu_cmu_cmt_ctl_spare_ctl_macro__num_1 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

supply0 vss;
supply1 vdd;
// fixscan start:
assign csm0_scanin               = scan_in                  ;
assign csm1_scanin               = csm0_scanout             ;
assign csm2_scanin               = csm1_scanout             ;
assign csm3_scanin               = csm2_scanout             ;
assign csm4_scanin               = csm3_scanout             ;
assign csm5_scanin               = csm4_scanout             ;
assign csm6_scanin               = csm5_scanout             ;
assign csm7_scanin               = csm6_scanout             ;
assign spares_scanin             = csm7_scanout             ;
assign scan_out                  = spares_scanout           ;

// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "v")
// End:






// any PARAMS parms go into naming of macro

module ifu_cmu_cmt_ctl_l1clkhdr_ctl_macro (
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

module ifu_cmu_cmt_ctl_msff_ctl_macro__width_1 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module ifu_cmu_cmt_ctl_spare_ctl_macro__num_1 (
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

