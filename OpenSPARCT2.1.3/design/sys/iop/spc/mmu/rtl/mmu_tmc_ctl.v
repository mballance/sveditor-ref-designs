// ========== Copyright Header Begin ==========================================
// 
// OpenSPARC T2 Processor File: mmu_tmc_ctl.v
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
module mmu_tmc_ctl (
  l2clk, 
  scan_in, 
  tcu_pce_ov, 
  spc_aclk, 
  spc_bclk, 
  tcu_scan_en, 
  htc_data_rcvd_hw1, 
  htc_tlb_miss_m, 
  htc_tsb_done_hw2, 
  htc_vld_tsbptr_m2, 
  htc_thr_valid_m1, 
  htc_thr_valid_m0, 
  htc_hwtw_burst, 
  htc_cindex_bit0, 
  htc_cindex_bit1, 
  trs_eperr_st, 
  trs_eccerr_st, 
  tsm_tsb_miss_hw2, 
  tsm_rqv, 
  tsm_waitfortte, 
  scan_out);
wire pce_ov;
wire stop;
wire se;
wire siclk;
wire soclk;
wire l1clk;
wire tsm0_scanin;
wire tsm0_scanout;
wire tsm1_scanin;
wire tsm1_scanout;
wire tsm2_scanin;
wire tsm2_scanout;
wire tsm3_scanin;
wire tsm3_scanout;
wire tsm4_scanin;
wire tsm4_scanout;
wire tsm5_scanin;
wire tsm5_scanout;
wire tsm6_scanin;
wire tsm6_scanout;
wire tsm7_scanin;
wire tsm7_scanout;
wire spares_scanin;
wire spares_scanout;


input           l2clk;
input           scan_in;
input           tcu_pce_ov;               // scan signals
input		spc_aclk;
input		spc_bclk;
input		tcu_scan_en;

input [7:0]     htc_data_rcvd_hw1;
input [7:0]     htc_tlb_miss_m;
input [7:0]     htc_tsb_done_hw2;
input [7:0]     htc_vld_tsbptr_m2;
input [7:0]     htc_thr_valid_m1;
input [7:0]     htc_thr_valid_m0;
input [7:0]     htc_hwtw_burst;

input [7:0]     htc_cindex_bit0;
input [7:0]     htc_cindex_bit1;


input [7:0]     trs_eperr_st;

input [7:0]     trs_eccerr_st;

output [7:0]    tsm_tsb_miss_hw2;
output [7:0]    tsm_rqv;

output [7:0]    tsm_waitfortte;

output          scan_out;

assign pce_ov   = tcu_pce_ov;
assign stop = 1'b0;
assign se       = tcu_scan_en;

assign siclk	= spc_aclk;
assign soclk	= spc_bclk;


///////////////////////////////////////////////////
// clock header
///////////////////////////////////////////////////
mmu_tmc_ctl_l1clkhdr_ctl_macro clkgen (
 .l2clk(l2clk),
 .l1en (1'b1),
 .l1clk(l1clk),
  .pce_ov(pce_ov),
  .stop(stop),
  .se(se)
);


/* mmu_tsm_ctl  AUTO_TEMPLATE
 (
.tlb_miss_m(htc_tlb_miss_m[@]),
.cindex_bit0(htc_cindex_bit0[@]),
.cindex_bit1(htc_cindex_bit1[@]),

.data_rcvd_hw1(htc_data_rcvd_hw1[@]),
.thr_valid_m1(htc_thr_valid_m1[@]),
.thr_valid_m0(htc_thr_valid_m0[@]),
.hwtw_burst(htc_hwtw_burst[@]),
.tsb_done_hw2(htc_tsb_done_hw2[@]),
.tsb_vld_tsbptr_m2(htc_vld_tsbptr_m2[@]),

.tsm_tsb_miss_hw2(tsm_tsb_miss_hw2[@]),
.tsm_rqv(tsm_rqv[@]),
.tsm_waitfortte(tsm_waitfortte[@]),
.trs_eperr_st(trs_eperr_st[@]),
.trs_eccerr_st(trs_eccerr_st[@]));
 */

mmu_tsm_ctl tsm0 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[0]),   // Templated
                  .tsm_rqv              (tsm_rqv[0]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[0]),     // Templated
                  // Inputs
                  .scan_in(tsm0_scanin),
                  .scan_out(tsm0_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[0]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[0]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[0]),  // Templated
                  .hwtw_burst           (htc_hwtw_burst[0]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[0]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[0]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[0]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[0]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[0]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[0]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[0]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm1 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[1]),   // Templated
                  .tsm_rqv              (tsm_rqv[1]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[1]),     // Templated
                  // Inputs
                  .scan_in(tsm1_scanin),
                  .scan_out(tsm1_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[1]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[1]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[1]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[1]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[1]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[1]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[1]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[1]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[1]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[1]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[1]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm2 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[2]),   // Templated
                  .tsm_rqv              (tsm_rqv[2]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[2]),     // Templated
                  // Inputs
                  .scan_in(tsm2_scanin),
                  .scan_out(tsm2_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[2]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[2]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[2]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[2]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[2]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[2]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[2]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[2]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[2]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[2]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[2]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm3 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[3]),   // Templated
                  .tsm_rqv              (tsm_rqv[3]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[3]),     // Templated
                  // Inputs
                  .scan_in(tsm3_scanin),
                  .scan_out(tsm3_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[3]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[3]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[3]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[3]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[3]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[3]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[3]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[3]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[3]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[3]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[3]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm4 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[4]),   // Templated
                  .tsm_rqv              (tsm_rqv[4]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[4]),     // Templated
                  // Inputs
                  .scan_in(tsm4_scanin),
                  .scan_out(tsm4_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[4]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[4]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[4]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[4]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[4]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[4]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[4]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[4]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[4]),    // Templated

                  .trs_eperr_st         (trs_eperr_st[4]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[4]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm5 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[5]),   // Templated
                  .tsm_rqv              (tsm_rqv[5]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[5]),     // Templated
                  // Inputs
                  .scan_in(tsm5_scanin),
                  .scan_out(tsm5_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[5]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[5]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[5]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[5]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[5]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[5]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[5]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[5]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[5]),    // Templated

                  .trs_eperr_st         (trs_eperr_st[5]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[5]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm6 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[6]),   // Templated
                  .tsm_rqv              (tsm_rqv[6]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[6]),     // Templated
                  // Inputs
                  .scan_in(tsm6_scanin),
                  .scan_out(tsm6_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[6]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[6]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[6]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[6]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[6]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[6]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[6]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[6]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[6]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[6]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[6]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

mmu_tsm_ctl tsm7 (/*AUTOINST*/
                  // Outputs
                  .tsm_tsb_miss_hw2     (tsm_tsb_miss_hw2[7]),   // Templated
                  .tsm_rqv              (tsm_rqv[7]),            // Templated
                  .tsm_waitfortte       (tsm_waitfortte[7]),     // Templated
                  // Inputs
                  .scan_in(tsm7_scanin),
                  .scan_out(tsm7_scanout),
                  .l1clk                (l1clk),
                  .data_rcvd_hw1        (htc_data_rcvd_hw1[7]),  // Templated
                  .thr_valid_m1         (htc_thr_valid_m1[7]),  // Templated
                  .thr_valid_m0         (htc_thr_valid_m0[7]),  // Templated
                  .hwtw_burst       (htc_hwtw_burst[7]),    // Templated
                  .tlb_miss_m           (htc_tlb_miss_m[7]),     // Templated
                  .cindex_bit0          (htc_cindex_bit0[7]),    // Templated
                  .cindex_bit1          (htc_cindex_bit1[7]),    // Templated
                  .tsb_done_hw2          (htc_tsb_done_hw2[7]),    // Templated
                  .vld_tsbptr_m2        (htc_vld_tsbptr_m2[7]),    // Templated
                  .trs_eperr_st         (trs_eperr_st[7]),     // Templated
                  .trs_eccerr_st        (trs_eccerr_st[7]),
  .spc_aclk(spc_aclk),
  .spc_bclk(spc_bclk));      // Templated

////////////////////////////////////////////////////////
// SPARE CELLS
////////////////////////////////////////////////////////
mmu_tmc_ctl_spare_ctl_macro__num_3 spares  (
	.scan_in(spares_scanin),
	.scan_out(spares_scanout),
	.l1clk	(l1clk),
  .siclk(siclk),
  .soclk(soclk)
);
////////////////////////////////////////////////////////

// fixscan start:
assign tsm0_scanin               = scan_in                  ;
assign tsm1_scanin               = tsm0_scanout             ;
assign tsm2_scanin               = tsm1_scanout             ;
assign tsm3_scanin               = tsm2_scanout             ;
assign tsm4_scanin               = tsm3_scanout             ;
assign tsm5_scanin               = tsm4_scanout             ;
assign tsm6_scanin               = tsm5_scanout             ;
assign tsm7_scanin               = tsm6_scanout             ;
assign spares_scanin             = tsm7_scanout             ;
assign scan_out                  = spares_scanout           ;

// fixscan end:
endmodule

// Local Variables:
// verilog-library-directories:("." "v")
// End:






// any PARAMS parms go into naming of macro

module mmu_tmc_ctl_l1clkhdr_ctl_macro (
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

module mmu_tmc_ctl_msff_ctl_macro__width_1 (
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

module mmu_tmc_ctl_msff_ctl_macro__width_4 (
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









//  Description:        Spare gate macro for control blocks
//
//  Param num controls the number of times the macro is added
//  flops=0 can be used to use only combination spare logic


module mmu_tmc_ctl_spare_ctl_macro__num_3 (
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
wire si_1;
wire so_1;
wire spare1_flop_unused;
wire spare1_buf_32x_unused;
wire spare1_nand3_8x_unused;
wire spare1_inv_8x_unused;
wire spare1_aoi22_4x_unused;
wire spare1_buf_8x_unused;
wire spare1_oai22_4x_unused;
wire spare1_inv_16x_unused;
wire spare1_nand2_16x_unused;
wire spare1_nor3_4x_unused;
wire spare1_nand2_8x_unused;
wire spare1_buf_16x_unused;
wire spare1_nor2_16x_unused;
wire spare1_inv_32x_unused;
wire si_2;
wire so_2;
wire spare2_flop_unused;
wire spare2_buf_32x_unused;
wire spare2_nand3_8x_unused;
wire spare2_inv_8x_unused;
wire spare2_aoi22_4x_unused;
wire spare2_buf_8x_unused;
wire spare2_oai22_4x_unused;
wire spare2_inv_16x_unused;
wire spare2_nand2_16x_unused;
wire spare2_nor3_4x_unused;
wire spare2_nand2_8x_unused;
wire spare2_buf_16x_unused;
wire spare2_nor2_16x_unused;
wire spare2_inv_32x_unused;


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

cl_sc1_msff_8x spare1_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_1),
                               .so(so_1),
                               .d(1'b0),
                               .q(spare1_flop_unused));
assign si_1 = so_0;

cl_u1_buf_32x   spare1_buf_32x (.in(1'b1),
                                   .out(spare1_buf_32x_unused));
cl_u1_nand3_8x spare1_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare1_nand3_8x_unused));
cl_u1_inv_8x    spare1_inv_8x (.in(1'b1),
                                  .out(spare1_inv_8x_unused));
cl_u1_aoi22_4x spare1_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_aoi22_4x_unused));
cl_u1_buf_8x    spare1_buf_8x (.in(1'b1),
                                  .out(spare1_buf_8x_unused));
cl_u1_oai22_4x spare1_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare1_oai22_4x_unused));
cl_u1_inv_16x   spare1_inv_16x (.in(1'b1),
                                   .out(spare1_inv_16x_unused));
cl_u1_nand2_16x spare1_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare1_nand2_16x_unused));
cl_u1_nor3_4x spare1_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare1_nor3_4x_unused));
cl_u1_nand2_8x spare1_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare1_nand2_8x_unused));
cl_u1_buf_16x   spare1_buf_16x (.in(1'b1),
                                   .out(spare1_buf_16x_unused));
cl_u1_nor2_16x spare1_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare1_nor2_16x_unused));
cl_u1_inv_32x   spare1_inv_32x (.in(1'b1),
                                   .out(spare1_inv_32x_unused));

cl_sc1_msff_8x spare2_flop (.l1clk(l1clk),
                               .siclk(siclk),
                               .soclk(soclk),
                               .si(si_2),
                               .so(so_2),
                               .d(1'b0),
                               .q(spare2_flop_unused));
assign si_2 = so_1;

cl_u1_buf_32x   spare2_buf_32x (.in(1'b1),
                                   .out(spare2_buf_32x_unused));
cl_u1_nand3_8x spare2_nand3_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .in2(1'b1),
                                   .out(spare2_nand3_8x_unused));
cl_u1_inv_8x    spare2_inv_8x (.in(1'b1),
                                  .out(spare2_inv_8x_unused));
cl_u1_aoi22_4x spare2_aoi22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_aoi22_4x_unused));
cl_u1_buf_8x    spare2_buf_8x (.in(1'b1),
                                  .out(spare2_buf_8x_unused));
cl_u1_oai22_4x spare2_oai22_4x (.in00(1'b1),
                                   .in01(1'b1),
                                   .in10(1'b1),
                                   .in11(1'b1),
                                   .out(spare2_oai22_4x_unused));
cl_u1_inv_16x   spare2_inv_16x (.in(1'b1),
                                   .out(spare2_inv_16x_unused));
cl_u1_nand2_16x spare2_nand2_16x (.in0(1'b1),
                                     .in1(1'b1),
                                     .out(spare2_nand2_16x_unused));
cl_u1_nor3_4x spare2_nor3_4x (.in0(1'b0),
                                 .in1(1'b0),
                                 .in2(1'b0),
                                 .out(spare2_nor3_4x_unused));
cl_u1_nand2_8x spare2_nand2_8x (.in0(1'b1),
                                   .in1(1'b1),
                                   .out(spare2_nand2_8x_unused));
cl_u1_buf_16x   spare2_buf_16x (.in(1'b1),
                                   .out(spare2_buf_16x_unused));
cl_u1_nor2_16x spare2_nor2_16x (.in0(1'b0),
                                   .in1(1'b0),
                                   .out(spare2_nor2_16x_unused));
cl_u1_inv_32x   spare2_inv_32x (.in(1'b1),
                                   .out(spare2_inv_32x_unused));
assign scan_out = so_2;



endmodule

